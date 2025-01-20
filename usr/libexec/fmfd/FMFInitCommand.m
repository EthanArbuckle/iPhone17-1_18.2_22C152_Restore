@interface FMFInitCommand
- (BOOL)allowsEmptyResponse;
- (BOOL)shouldIncludeDataContext;
- (BOOL)shouldIncludeServerContext;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (id)tapContext;
- (int64_t)fetchStatus;
- (void)processCommandResponse:(id)a3;
- (void)sendRequest;
- (void)setFetchStatus:(int64_t)a3;
@end

@implementation FMFInitCommand

- (void)sendRequest
{
  v2.receiver = self;
  v2.super_class = (Class)FMFInitCommand;
  [(FMFInitCommand *)&v2 sendRequest];
}

- (id)pathSuffix
{
  return @"initClient";
}

- (id)jsonBodyDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)FMFInitCommand;
  objc_super v2 = [(FMFBaseCmd *)&v10 jsonBodyDictionary];
  v3 = +[FMFAccountManager sharedInstance];
  v4 = [v3 account];
  v5 = [v4 dsid];

  v6 = +[FMFDataManager sharedInstance];
  v7 = [v6 lastLoggedInPrsId];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && ([v5 isEqualToString:v7] & 1) == 0) {
    [v2 setObject:v7 forKey:@"lastLoggedInPrsid"];
  }

  return v2;
}

- (void)processCommandResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFInitCommand;
  [(FMFBaseCmd *)&v8 processCommandResponse:v4];
  v5 = [v4 objectForKey:@"fetchStatus"];
  v6 = +[NSNull null];
  if (v5 == v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v4 objectForKey:@"fetchStatus"];
  }

  -[FMFInitCommand setFetchStatus:](self, "setFetchStatus:", [v7 integerValue]);
}

- (BOOL)allowsEmptyResponse
{
  return 0;
}

- (BOOL)shouldIncludeDataContext
{
  return 0;
}

- (BOOL)shouldIncludeServerContext
{
  return 0;
}

- (id)tapContext
{
  objc_super v2 = +[FMFDataManager sharedInstance];
  v3 = [v2 cachedTapMessages];

  return v3;
}

- (int64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(int64_t)a3
{
  self->_fetchStatus = a3;
}

@end