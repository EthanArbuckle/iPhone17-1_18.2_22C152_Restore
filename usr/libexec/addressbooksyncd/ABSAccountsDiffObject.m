@interface ABSAccountsDiffObject
- (ABSAccountsDiffObject)init;
- (BOOL)matches:(id)a3;
- (NSString)description;
- (NSString)sha;
- (void)setSha:(id)a3;
@end

@implementation ABSAccountsDiffObject

- (ABSAccountsDiffObject)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABSAccountsDiffObject;
  v2 = [(ABSAccountsDiffObject *)&v8 init];
  if (v2)
  {
    v3 = +[ABSyncInterface sharedInstance];
    v4 = [v3 serverState];
    uint64_t v5 = [v4 getStringValueForKey:@"com.apple.absd.accounts.sha" default:@"0"];
    sha = v2->_sha;
    v2->_sha = (NSString *)v5;
  }
  return v2;
}

- (BOOL)matches:(id)a3
{
  v4 = +[ABSAccountsSyncObject sha];
  uint64_t v5 = [(ABSAccountsDiffObject *)self sha];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (NSString)description
{
  v3 = [(ABSAccountsDiffObject *)self sha];
  v4 = +[NSString stringWithFormat:@"<ABSAccountsDiffObject:%p, sha: %@>", self, v3];

  return (NSString *)v4;
}

- (NSString)sha
{
  return self->_sha;
}

- (void)setSha:(id)a3
{
}

- (void).cxx_destruct
{
}

@end