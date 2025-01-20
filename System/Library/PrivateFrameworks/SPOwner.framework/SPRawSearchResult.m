@interface SPRawSearchResult
+ (BOOL)supportsSecureCoding;
- (NSData)hashedPublicKey;
- (NSData)publicKey;
- (NSDate)timestamp;
- (SPRawSearchResult)initWithCoder:(id)a3;
- (SPRawSearchResult)initWithHashedPublicKey:(id)a3 publicKey:(id)a4 status:(int64_t)a5 timestamp:(id)a6 latitude:(double)a7 longitude:(double)a8 horizontalAccuracy:(double)a9;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRawSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPRawSearchResult alloc];
  v5 = [(SPRawSearchResult *)self hashedPublicKey];
  v6 = [(SPRawSearchResult *)self publicKey];
  int64_t v7 = [(SPRawSearchResult *)self status];
  v8 = [(SPRawSearchResult *)self timestamp];
  [(SPRawSearchResult *)self latitude];
  double v10 = v9;
  [(SPRawSearchResult *)self longitude];
  double v12 = v11;
  [(SPRawSearchResult *)self horizontalAccuracy];
  v14 = [(SPRawSearchResult *)v4 initWithHashedPublicKey:v5 publicKey:v6 status:v7 timestamp:v8 latitude:v10 longitude:v12 horizontalAccuracy:v13];

  return v14;
}

- (SPRawSearchResult)initWithHashedPublicKey:(id)a3 publicKey:(id)a4 status:(int64_t)a5 timestamp:(id)a6 latitude:(double)a7 longitude:(double)a8 horizontalAccuracy:(double)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SPRawSearchResult;
  v20 = [(SPRawSearchResult *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_hashedPublicKey, a3);
    objc_storeStrong((id *)&v21->_publicKey, a4);
    v21->_status = a5;
    objc_storeStrong((id *)&v21->_timestamp, a6);
    v21->_latitude = a7;
    v21->_longitude = a8;
    v21->_horizontalAccuracy = a9;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  hashedPublicKey = self->_hashedPublicKey;
  id v5 = a3;
  [v5 encodeObject:hashedPublicKey forKey:@"hashedPublicKey"];
  [v5 encodeObject:self->_publicKey forKey:@"publicKey"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeDouble:@"latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeInteger:self->_status forKey:@"status"];
}

- (SPRawSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashedPublicKey"];
  hashedPublicKey = self->_hashedPublicKey;
  self->_hashedPublicKey = v5;

  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
  publicKey = self->_publicKey;
  self->_publicKey = v7;

  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = self->_timestamp;
  self->_timestamp = v9;

  [v4 decodeDoubleForKey:@"latitude"];
  self->_latitude = v11;
  [v4 decodeDoubleForKey:@"longitude"];
  self->_longitude = v12;
  [v4 decodeDoubleForKey:@"horizontalAccuracy"];
  self->_horizontalAccuracy = v13;
  int64_t v14 = [v4 decodeIntegerForKey:@"status"];

  self->_status = v14;
  return self;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(SPRawSearchResult *)self latitude];
  uint64_t v6 = v5;
  [(SPRawSearchResult *)self longitude];
  uint64_t v8 = v7;
  double v9 = [(SPRawSearchResult *)self timestamp];
  [(SPRawSearchResult *)self horizontalAccuracy];
  double v11 = [v3 stringWithFormat:@"<%@ %p: %.06f/%.06f %@ (%.0f)>", v4, self, v6, v8, v9, v10];

  return v11;
}

- (NSData)hashedPublicKey
{
  return self->_hashedPublicKey;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_hashedPublicKey, 0);
}

@end