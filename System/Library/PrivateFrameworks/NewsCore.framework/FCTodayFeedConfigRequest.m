@interface FCTodayFeedConfigRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCTodayFeedConfigRequest)initWithCoder:(id)a3;
- (FCTodayFeedConfigRequest)initWithFeedType:(unint64_t)a3 forYouConfigID:(id)a4 formatVersion:(id)a5 additionalRecordIDs:(id)a6;
- (NSArray)additionalRecordIDs;
- (NSString)forYouConfigID;
- (NSString)formatVersion;
- (id)description;
- (unint64_t)feedType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCTodayFeedConfigRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCTodayFeedConfigRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] == 1)
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feedType"];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"forYouConfigID"];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatVersion"];
        if (v11)
        {
          v12 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v13 = objc_opt_class();
          v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
          v15 = [v4 decodeObjectOfClasses:v14 forKey:@"additionalRecordIDs"];
          if (v15)
          {
            self = -[FCTodayFeedConfigRequest initWithFeedType:forYouConfigID:formatVersion:additionalRecordIDs:](self, "initWithFeedType:forYouConfigID:formatVersion:additionalRecordIDs:", [v7 unsignedIntegerValue], v10, v11, v15);
            v16 = self;
          }
          else
          {
            v16 = 0;
          }
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (FCTodayFeedConfigRequest)initWithFeedType:(unint64_t)a3 forYouConfigID:(id)a4 formatVersion:(id)a5 additionalRecordIDs:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FCTodayFeedConfigRequest;
  uint64_t v13 = [(FCTodayFeedConfigRequest *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_feedType = a3;
    uint64_t v15 = [v10 copy];
    forYouConfigID = v14->_forYouConfigID;
    v14->_forYouConfigID = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    formatVersion = v14->_formatVersion;
    v14->_formatVersion = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    additionalRecordIDs = v14->_additionalRecordIDs;
    v14->_additionalRecordIDs = (NSArray *)v19;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRecordIDs, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_forYouConfigID, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6 && (unint64_t v7 = -[FCTodayFeedConfigRequest feedType](self, "feedType"), v7 == [v6 feedType]))
  {
    v8 = [(FCTodayFeedConfigRequest *)self forYouConfigID];
    v9 = [v6 forYouConfigID];
    if ([v8 isEqualToString:v9])
    {
      id v10 = [(FCTodayFeedConfigRequest *)self formatVersion];
      id v11 = [v6 formatVersion];
      if ([v10 isEqualToString:v11])
      {
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v13 = [(FCTodayFeedConfigRequest *)self additionalRecordIDs];
        v14 = [v12 setWithArray:v13];
        uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
        v16 = [v6 additionalRecordIDs];
        uint64_t v17 = [v15 setWithArray:v16];
        char v18 = [v14 isEqualToSet:v17];
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCTodayFeedConfigRequest feedType](self, "feedType"));
  uint64_t v4 = [v3 hash];
  v5 = [(FCTodayFeedConfigRequest *)self forYouConfigID];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = [(FCTodayFeedConfigRequest *)self formatVersion];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(FCTodayFeedConfigRequest *)self additionalRecordIDs];
  unint64_t v10 = v8 ^ [v9 hash] ^ v4;

  return v10;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  unint64_t v4 = [(FCTodayFeedConfigRequest *)self feedType];
  v5 = @"regular";
  if (v4 == 1) {
    v5 = @"premium";
  }
  if (v4 == 2) {
    uint64_t v6 = @"premium_lite";
  }
  else {
    uint64_t v6 = v5;
  }
  [(FCDescription *)v3 addField:@"feedType" object:v6];
  unint64_t v7 = [(FCTodayFeedConfigRequest *)self forYouConfigID];
  [(FCDescription *)v3 addField:@"forYouConfigID" object:v7];

  uint64_t v8 = [(FCTodayFeedConfigRequest *)self formatVersion];
  [(FCDescription *)v3 addField:@"formatVersion" object:v8];

  v9 = [(FCTodayFeedConfigRequest *)self additionalRecordIDs];
  [(FCDescription *)v3 addField:@"additionalRecordIDs" object:v9];

  unint64_t v10 = [(FCDescription *)v3 descriptionString];

  return v10;
}

__CFString *__39__FCTodayFeedConfigRequest_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) feedType];
  v2 = @"regular";
  if (v1 == 1) {
    v2 = @"premium";
  }
  if (v1 == 2) {
    return @"premium_lite";
  }
  else {
    return v2;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCTodayFeedConfigRequest feedType](self, "feedType"));
  [v4 encodeObject:v5 forKey:@"feedType"];

  uint64_t v6 = [(FCTodayFeedConfigRequest *)self forYouConfigID];
  [v4 encodeObject:v6 forKey:@"forYouConfigID"];

  unint64_t v7 = [(FCTodayFeedConfigRequest *)self formatVersion];
  [v4 encodeObject:v7 forKey:@"formatVersion"];

  id v8 = [(FCTodayFeedConfigRequest *)self additionalRecordIDs];
  [v4 encodeObject:v8 forKey:@"additionalRecordIDs"];
}

- (unint64_t)feedType
{
  return self->_feedType;
}

- (NSString)forYouConfigID
{
  return self->_forYouConfigID;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSArray)additionalRecordIDs
{
  return self->_additionalRecordIDs;
}

@end