@interface FMFAllowFriendRequestsCommand
- (BOOL)allowFriendRequests;
- (BOOL)isUserAction;
- (FMFAllowFriendRequestsCommand)initWithAllowFriendRequests:(BOOL)a3 forSession:(id)a4;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setAllowFriendRequests:(BOOL)a3;
@end

@implementation FMFAllowFriendRequestsCommand

- (FMFAllowFriendRequestsCommand)initWithAllowFriendRequests:(BOOL)a3 forSession:(id)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFAllowFriendRequestsCommand;
  v5 = [(FMFBaseCmd *)&v8 initWithClientSession:a4];
  v6 = v5;
  if (v5) {
    [(FMFAllowFriendRequestsCommand *)v5 setAllowFriendRequests:v4];
  }
  return v6;
}

- (id)pathSuffix
{
  return @"allowFriendRequests/savePrefs";
}

- (id)jsonBodyDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)FMFAllowFriendRequestsCommand;
  v3 = [(FMFBaseCmd *)&v7 jsonBodyDictionary];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(FMFAllowFriendRequestsCommand *)self allowFriendRequests]) {
    CFStringRef v5 = @"Yes";
  }
  else {
    CFStringRef v5 = @"No";
  }
  [v4 setObject:v5 forKey:@"allowFriendRequests"];
  [v3 setObject:v4 forKey:@"prefs"];

  return v3;
}

- (BOOL)isUserAction
{
  return 1;
}

- (BOOL)allowFriendRequests
{
  return self->_allowFriendRequests;
}

- (void)setAllowFriendRequests:(BOOL)a3
{
  self->_allowFriendRequests = a3;
}

@end