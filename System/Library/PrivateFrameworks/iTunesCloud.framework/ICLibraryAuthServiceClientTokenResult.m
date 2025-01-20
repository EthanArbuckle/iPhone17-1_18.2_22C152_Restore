@interface ICLibraryAuthServiceClientTokenResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isExpired;
- (ICLibraryAuthServiceClientTokenIdentifier)tokenIdentitifer;
- (ICLibraryAuthServiceClientTokenResult)initWithCoder:(id)a3;
- (ICLibraryAuthServiceClientTokenResult)initWithResponseDictionary:(id)a3;
- (NSDate)expirationDate;
- (NSString)token;
- (id)description;
- (int64_t)generatedAtMillis;
- (int64_t)lifespanMillis;
- (int64_t)timeToLiveMillis;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICLibraryAuthServiceClientTokenResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIdentitifer, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (ICLibraryAuthServiceClientTokenIdentifier)tokenIdentitifer
{
  return self->_tokenIdentitifer;
}

- (int64_t)lifespanMillis
{
  return self->_lifespanMillis;
}

- (int64_t)timeToLiveMillis
{
  return self->_timeToLiveMillis;
}

- (int64_t)generatedAtMillis
{
  return self->_generatedAtMillis;
}

- (NSString)token
{
  return self->_token;
}

- (void)encodeWithCoder:(id)a3
{
  token = self->_token;
  id v5 = a3;
  [v5 encodeObject:token forKey:@"tokenString"];
  [v5 encodeInt64:self->_generatedAtMillis forKey:@"generatedAtMillis"];
  [v5 encodeInt64:self->_timeToLiveMillis forKey:@"ttlMillis"];
  [v5 encodeInt64:self->_lifespanMillis forKey:@"lifespanMillis"];
  [v5 encodeObject:self->_tokenIdentitifer forKey:@"tokenID"];
}

- (ICLibraryAuthServiceClientTokenResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICLibraryAuthServiceClientTokenResult;
  id v5 = [(ICLibraryAuthServiceClientTokenResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenString"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_generatedAtMillis = [v4 decodeInt64ForKey:@"generatedAtMillis"];
    v5->_timeToLiveMillis = [v4 decodeInt64ForKey:@"ttlMillis"];
    v5->_lifespanMillis = [v4 decodeInt64ForKey:@"lifespanMillis"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenID"];
    tokenIdentitifer = v5->_tokenIdentitifer;
    v5->_tokenIdentitifer = (ICLibraryAuthServiceClientTokenIdentifier *)v8;
  }
  return v5;
}

- (BOOL)isExpired
{
  double v2 = (double)((self->_timeToLiveMillis + self->_generatedAtMillis) / 1000);
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  BOOL v5 = v4 > v2;

  return v5;
}

- (NSDate)expirationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)((self->_timeToLiveMillis + self->_generatedAtMillis) / 1000)];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)((self->_timeToLiveMillis + self->_generatedAtMillis) / 1000)];
  double v4 = +[ICDeviceInfo currentDeviceInfo];
  if ([v4 isInternalBuild]) {
    token = (__CFString *)self->_token;
  }
  else {
    token = @"<private>";
  }
  uint64_t v6 = token;

  v7 = [NSString stringWithFormat:@"<%@: %p token='%@' expires='%@'>", objc_opt_class(), self, v6, v3];

  return v7;
}

- (ICLibraryAuthServiceClientTokenResult)initWithResponseDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICLibraryAuthServiceClientTokenResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"token"];
    if (_NSIsNSString()) {
      objc_storeStrong((id *)&v5->_token, v6);
    }
    v7 = [v4 objectForKey:@"generatedAtMillis"];

    if (_NSIsNSNumber()) {
      v5->_generatedAtMillis = [v7 longLongValue];
    }
    uint64_t v8 = [v4 objectForKey:@"timeToLiveMillis"];

    if ([v8 isNSNumber]) {
      v5->_timeToLiveMillis = [v8 longLongValue];
    }
    v9 = +[ICDefaults standardDefaults];
    v10 = [v9 authServiceClientTokenTimeToLive];

    if ([v10 longLongValue] >= 1)
    {
      uint64_t v11 = [v10 longLongValue];
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11 > 119999)
      {
        if (v13)
        {
          int v19 = 134217984;
          uint64_t v20 = [v10 longLongValue];
          _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "Overridden to %lld milis.", (uint8_t *)&v19, 0xCu);
        }

        v5->_timeToLiveMillis = [v10 longLongValue];
      }
      else
      {
        if (v13)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "Override may not be less than 120000", (uint8_t *)&v19, 2u);
        }
      }
    }
    v14 = [v4 objectForKey:@"lifespanMillis"];

    if (_NSIsNSNumber()) {
      v5->_lifespanMillis = [v14 longLongValue];
    }
    v15 = [v4 objectForKey:@"tokenID"];

    if (_NSIsNSDictionary())
    {
      v16 = [[ICLibraryAuthServiceClientTokenIdentifier alloc] initWithResponseDictionary:v15];
      tokenIdentitifer = v5->_tokenIdentitifer;
      v5->_tokenIdentitifer = v16;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end