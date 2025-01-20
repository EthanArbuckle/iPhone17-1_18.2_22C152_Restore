@interface WBSHistoryTombstone
+ (BOOL)supportsSecureCoding;
- (BOOL)isSecure;
- (BOOL)matchesVisitTime:(double)a3 urlString:(id)a4;
- (NSData)urlHash;
- (NSData)urlSalt;
- (NSDictionary)dictionaryRepresentation;
- (NSString)urlString;
- (WBSHistoryTombstone)initWithCoder:(id)a3;
- (WBSHistoryTombstone)initWithDictionary:(id)a3;
- (WBSHistoryTombstone)initWithSQLiteRow:(id)a3 crypto:(id)a4;
- (WBSHistoryTombstone)initWithURLString:(id)a3 urlHash:(id)a4 urlSalt:(id)a5 startTime:(double)a6 endTime:(double)a7 generation:(int64_t)a8;
- (double)endTime;
- (double)startTime;
- (id)description;
- (id)secureTombstoneWithSalt:(id)a3;
- (int64_t)generation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryTombstone

- (WBSHistoryTombstone)initWithURLString:(id)a3 urlHash:(id)a4 urlSalt:(id)a5 startTime:(double)a6 endTime:(double)a7 generation:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v26.receiver = self;
  v26.super_class = (Class)WBSHistoryTombstone;
  v17 = [(WBSHistoryTombstone *)&v26 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    urlString = v17->_urlString;
    v17->_urlString = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    urlHash = v17->_urlHash;
    v17->_urlHash = (NSData *)v20;

    uint64_t v22 = [v16 copy];
    urlSalt = v17->_urlSalt;
    v17->_urlSalt = (NSData *)v22;

    v17->_startTime = a6;
    v17->_endTime = a7;
    v17->_generation = a8;
    v24 = v17;
  }

  return v17;
}

- (WBSHistoryTombstone)initWithSQLiteRow:(id)a3 crypto:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 dataAtIndex:3];
  if (v8)
  {
    v9 = [v7 decryptDictionary:v8];
    v10 = objc_msgSend(v9, "safari_stringForKey:", @"url");
    v11 = objc_msgSend(v9, "safari_dataForKey:", @"url_hash");
    v12 = objc_msgSend(v9, "safari_dataForKey:", @"url_salt");
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v10 = 0;
  }

  [v6 doubleAtIndex:1];
  double v14 = v13;
  [v6 doubleAtIndex:2];
  id v16 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:](self, "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", v10, v11, v12, [v6 int64AtIndex:4], v14, v15);

  return v16;
}

- (WBSHistoryTombstone)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_stringForKey:", @"URL");
  id v6 = objc_msgSend(v4, "safari_dataForKey:", @"URLHash");
  id v7 = objc_msgSend(v4, "safari_dataForKey:", @"URLSalt");
  v8 = objc_msgSend(v4, "safari_numberForKey:", @"StartTime");
  [v8 doubleValue];
  double v10 = v9;

  v11 = objc_msgSend(v4, "safari_numberForKey:", @"EndTime");
  [v11 doubleValue];
  double v13 = v12;

  double v14 = [(WBSHistoryTombstone *)self initWithURLString:v5 urlHash:v6 urlSalt:v7 startTime:0 endTime:v10 generation:v13];
  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSString *)self->_urlString length]) {
    [v3 setObject:self->_urlString forKeyedSubscript:@"URL"];
  }
  if ([(NSData *)self->_urlHash length]) {
    [v3 setObject:self->_urlHash forKeyedSubscript:@"URLHash"];
  }
  if ([(NSData *)self->_urlSalt length]) {
    [v3 setObject:self->_urlSalt forKeyedSubscript:@"URLSalt"];
  }
  id v4 = [NSNumber numberWithDouble:self->_startTime];
  [v3 setObject:v4 forKeyedSubscript:@"StartTime"];

  v5 = [NSNumber numberWithDouble:self->_endTime];
  [v3 setObject:v5 forKeyedSubscript:@"EndTime"];

  return (NSDictionary *)v3;
}

- (BOOL)matchesVisitTime:(double)a3 urlString:(id)a4
{
  id v6 = a4;
  BOOL v9 = (![(NSString *)self->_urlString length]
     || [(NSString *)self->_urlString isEqualToString:v6])
    && (![(NSData *)self->_urlHash length]
     || (urlHash = self->_urlHash,
         WBSHistorySHA512(self->_urlSalt, v6),
         v8 = objc_claimAutoreleasedReturnValue(),
         LOBYTE(urlHash) = [(NSData *)urlHash isEqualToData:v8],
         v8,
         (urlHash & 1) != 0))
    && self->_startTime <= a3
    && self->_endTime >= a3;

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; urlString = \"%@\"; startTime = %lf; endTime = %lf>",
    v5,
    self,
    self->_urlString,
    *(void *)&self->_startTime,
  id v6 = *(void *)&self->_endTime);

  return v6;
}

- (BOOL)isSecure
{
  return !self->_urlString && self->_urlHash != 0;
}

- (id)secureTombstoneWithSalt:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_urlString length])
  {
    v5 = self;
    goto LABEL_5;
  }
  if ([(NSData *)self->_urlHash length])
  {
    v5 = [[WBSHistoryTombstone alloc] initWithURLString:0 urlHash:self->_urlHash urlSalt:self->_urlSalt startTime:self->_generation endTime:self->_startTime generation:self->_endTime];
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  id v7 = [WBSHistoryTombstone alloc];
  v8 = WBSHistorySHA512(v4, self->_urlString);
  id v6 = [(WBSHistoryTombstone *)v7 initWithURLString:0 urlHash:v8 urlSalt:v4 startTime:self->_generation endTime:self->_startTime generation:self->_endTime];

LABEL_7:
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryTombstone)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLHash"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLSalt"];
  [v4 decodeDoubleForKey:@"StartTime"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"EndTime"];
  v11 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:](self, "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", v5, v6, v7, [v4 decodeInt64ForKey:@"Generation"], v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_urlString forKey:@"URL"];
  [v4 encodeObject:self->_urlHash forKey:@"URLHash"];
  [v4 encodeObject:self->_urlSalt forKey:@"URLSalt"];
  [v4 encodeDouble:@"StartTime" forKey:self->_startTime];
  [v4 encodeDouble:@"EndTime" forKey:self->_endTime];
  [v4 encodeInt64:self->_generation forKey:@"Generation"];
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSData)urlHash
{
  return self->_urlHash;
}

- (NSData)urlSalt
{
  return self->_urlSalt;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSalt, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end