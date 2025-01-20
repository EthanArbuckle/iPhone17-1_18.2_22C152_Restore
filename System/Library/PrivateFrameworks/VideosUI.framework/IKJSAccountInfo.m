@interface IKJSAccountInfo
- (IKJSAccountInfo)initWithAppContext:(id)a3;
- (NSString)DSID;
- (NSString)appleId;
- (NSString)storefrontCountryCode;
- (NSString)storefrontId;
- (NSString)storefrontLanguage;
@end

@implementation IKJSAccountInfo

- (NSString)storefrontId
{
  return (NSString *)+[VUIAuthenticationManager storefrontId];
}

- (NSString)appleId
{
  return (NSString *)+[VUIAuthenticationManager userAccountName];
}

- (NSString)DSID
{
  v2 = +[VUIAuthenticationManager DSID];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (IKJSAccountInfo)initWithAppContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IKJSAccountInfo;
  return [(VUIJSObject *)&v4 initWithAppContext:a3];
}

- (NSString)storefrontLanguage
{
  v2 = [MEMORY[0x1E4FA9C70] app];
  uint64_t v3 = [v2 stringForKey:@"language"];
  objc_super v4 = (void *)v3;
  v5 = &stru_1F3E921E0;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)storefrontCountryCode
{
  v2 = [MEMORY[0x1E4FA9C70] app];
  uint64_t v3 = [v2 stringForKey:@"countryCode"];
  objc_super v4 = (void *)v3;
  v5 = &stru_1F3E921E0;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  return (NSString *)v6;
}

@end