@interface ICLibraryAuthServiceClientTokenStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldExcludeFromBackgroundRefresh;
- (ICLibraryAuthServiceClientTokenResult)tokenResult;
- (ICLibraryAuthServiceClientTokenStatus)initWithCoder:(id)a3;
- (NSDate)lastUpdatedDate;
- (NSError)lastError;
- (double)lastUpdateAttemptTime;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLastUpdateAttemptTime:(double)a3;
- (void)setShouldExcludeFromBackgroundRefresh:(BOOL)a3;
- (void)setTokenResult:(id)a3;
@end

@implementation ICLibraryAuthServiceClientTokenStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);

  objc_storeStrong((id *)&self->_tokenResult, 0);
}

- (void)setShouldExcludeFromBackgroundRefresh:(BOOL)a3
{
  self->_shouldExcludeFromBackgroundRefresh = a3;
}

- (BOOL)shouldExcludeFromBackgroundRefresh
{
  return self->_shouldExcludeFromBackgroundRefresh;
}

- (void)setLastUpdateAttemptTime:(double)a3
{
  self->_lastUpdateAttemptTime = a3;
}

- (double)lastUpdateAttemptTime
{
  return self->_lastUpdateAttemptTime;
}

- (void)setLastError:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setTokenResult:(id)a3
{
}

- (ICLibraryAuthServiceClientTokenResult)tokenResult
{
  return self->_tokenResult;
}

- (NSDate)lastUpdatedDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_lastUpdateAttemptTime];

  return (NSDate *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  tokenResult = self->_tokenResult;
  id v6 = a3;
  [v6 encodeObject:tokenResult forKey:@"tokenResult"];
  v5 = [(NSError *)self->_lastError msv_errorByRemovingUnsafeUserInfo];
  [v6 encodeObject:v5 forKey:@"lastError"];

  [v6 encodeDouble:@"lastUpdateTime" forKey:self->_lastUpdateAttemptTime];
  [v6 encodeBool:self->_shouldExcludeFromBackgroundRefresh forKey:@"excludeFromBackgroundRefresh"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  tokenResult = self->_tokenResult;
  lastError = self->_lastError;
  uint64_t v7 = [(ICLibraryAuthServiceClientTokenStatus *)self lastUpdatedDate];
  v8 = (void *)v7;
  if (self->_shouldExcludeFromBackgroundRefresh) {
    v9 = @"NO";
  }
  else {
    v9 = @"YES";
  }
  v10 = [v3 stringWithFormat:@"<%@:%p result=%@ lastError=%@ lastUpdate='%@' autoRefreshEnabled=%@>", v4, self, tokenResult, lastError, v7, v9];

  return v10;
}

- (ICLibraryAuthServiceClientTokenStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLibraryAuthServiceClientTokenStatus;
  v5 = [(ICLibraryAuthServiceClientTokenStatus *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenResult"];
    tokenResult = v5->_tokenResult;
    v5->_tokenResult = (ICLibraryAuthServiceClientTokenResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastError"];
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v8;

    [v4 decodeDoubleForKey:@"lastUpdateTime"];
    v5->_lastUpdateAttemptTime = v10;
    v5->_shouldExcludeFromBackgroundRefresh = [v4 decodeBoolForKey:@"excludeFromBackgroundRefresh"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end