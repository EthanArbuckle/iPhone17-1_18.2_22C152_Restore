@interface _SESSessionClientInfo
+ (id)withConnection:(id)a3;
- (BOOL)acwgSessionEntitlement;
- (BOOL)dckSessionEntitlement;
- (BOOL)rkeSessionEntitlement;
- (NSString)clientName;
@end

@implementation _SESSessionClientInfo

+ (id)withConnection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = [v3 userInfo];
  v6 = [v5 objectForKeyedSubscript:&off_10042DE70];
  id v7 = [v6 copy];
  v8 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v7;

  v9 = [v3 valueForEntitlement:@"com.apple.seserviced.session.acwg"];
  *(unsigned char *)(v4 + 8) = v9 != 0;

  v10 = [v3 valueForEntitlement:@"com.apple.seserviced.session.dck"];
  *(unsigned char *)(v4 + 9) = v10 != 0;

  v11 = [v3 valueForEntitlement:@"com.apple.developer.carkey.session"];

  *(unsigned char *)(v4 + 10) = v11 != 0;

  return (id)v4;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)acwgSessionEntitlement
{
  return self->_acwgSessionEntitlement;
}

- (BOOL)dckSessionEntitlement
{
  return self->_dckSessionEntitlement;
}

- (BOOL)rkeSessionEntitlement
{
  return self->_rkeSessionEntitlement;
}

- (void).cxx_destruct
{
}

@end