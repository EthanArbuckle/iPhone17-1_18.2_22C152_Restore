@interface RCSSavedRecordingAccessToken
+ (BOOL)supportsSecureCoding;
+ (id)tokenWithName:(id)a3 accessIntent:(int64_t)a4 compositionAVURL:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExclusive;
- (NSDictionary)userInfo;
- (NSString)accessName;
- (NSURL)compositionAVURL;
- (NSUUID)identifier;
- (RCSSavedRecordingAccessToken)initWithCoder:(id)a3;
- (RCSSavedRecordingAccessToken)initWithName:(id)a3 accessIntent:(int64_t)a4 compositionAVURL:(id)a5 identifier:(id)a6;
- (id)description;
- (int64_t)accessIntent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation RCSSavedRecordingAccessToken

+ (id)tokenWithName:(id)a3 accessIntent:(int64_t)a4 compositionAVURL:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a5;
  id v9 = a3;
  v10 = [v7 UUID];
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v9 accessIntent:a4 compositionAVURL:v8 identifier:v10];

  return v11;
}

- (RCSSavedRecordingAccessToken)initWithName:(id)a3 accessIntent:(int64_t)a4 compositionAVURL:(id)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RCSSavedRecordingAccessToken;
  v14 = [(RCSSavedRecordingAccessToken *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_accessIntent = a4;
    v14->_exclusive = a4 == 3;
    objc_storeStrong((id *)&v14->_identifier, a6);
    objc_storeStrong((id *)&v15->_compositionAVURL, a5);
    objc_storeStrong((id *)&v15->_accessName, a3);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RCSSavedRecordingAccessToken *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(RCSSavedRecordingAccessToken *)self identifier];
      v6 = [(RCSSavedRecordingAccessToken *)v4 identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(RCSSavedRecordingAccessToken *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(NSUUID *)self->_identifier UUIDString];
  unint64_t v5 = self->_accessIntent - 1;
  if (v5 > 2) {
    v6 = @"RCSSavedRecordingAccessIntentUnknown";
  }
  else {
    v6 = off_1E6496B20[v5];
  }
  accessName = self->_accessName;
  id v8 = [(NSURL *)self->_compositionAVURL path];
  id v9 = [v3 stringWithFormat:@"[RCSSavedRecordingAccessToken-%@ access=%@, name=%@, URL=%@]", v4, v6, accessName, v8];

  return v9;
}

- (void)setUserInfo:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCSSavedRecordingAccessToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCSSavedRecordingAccessToken;
  unint64_t v5 = [(RCSSavedRecordingAccessToken *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"RCSIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"RCSAccessName"];
    accessName = v5->_accessName;
    v5->_accessName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"RCSCompositionAVURL"];
    compositionAVURL = v5->_compositionAVURL;
    v5->_compositionAVURL = (NSURL *)v10;

    v5->_accessIntent = [v4 decodeIntegerForKey:@"RCSAccessIntent"];
    uint64_t v12 = [v4 decodeObjectForKey:@"RCSUserInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"RCSIdentifier"];
  [v5 encodeObject:self->_accessName forKey:@"RCSAccessName"];
  [v5 encodeObject:self->_compositionAVURL forKey:@"RCSCompositionAVURL"];
  [v5 encodeInteger:self->_accessIntent forKey:@"RCSAccessIntent"];
  [v5 encodeObject:self->_userInfo forKey:@"RCSUserInfo"];
}

- (int64_t)accessIntent
{
  return self->_accessIntent;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (NSURL)compositionAVURL
{
  return self->_compositionAVURL;
}

- (NSString)accessName
{
  return self->_accessName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_accessName, 0);
  objc_storeStrong((id *)&self->_compositionAVURL, 0);
}

@end