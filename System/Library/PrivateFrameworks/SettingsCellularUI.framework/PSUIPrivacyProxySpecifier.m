@interface PSUIPrivacyProxySpecifier
- (CTXPCServiceSubscriptionContext)context;
- (PSUICoreTelephonyDataCache)dataCache;
- (PSUIPrivacyProxySpecifier)initWithDataCache:(id)a3 context:(id)a4;
- (id)groupSpecifier;
- (id)isPrivacyProxyEnabled;
- (void)setContext:(id)a3;
- (void)setDataCache:(id)a3;
- (void)setPrivacyProxyEnabled:(id)a3;
@end

@implementation PSUIPrivacyProxySpecifier

- (PSUIPrivacyProxySpecifier)initWithDataCache:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PRIVACYPROXY" value:&stru_26D410CA0 table:@"Cellular"];
  v13.receiver = self;
  v13.super_class = (Class)PSUIPrivacyProxySpecifier;
  v11 = [(PSUIPrivacyProxySpecifier *)&v13 initWithName:v10 target:self set:sel_setPrivacyProxyEnabled_ get:sel_isPrivacyProxyEnabled detail:0 cell:6 edit:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataCache, a3);
    objc_storeStrong((id *)&v11->_context, a4);
    [(PSUIPrivacyProxySpecifier *)v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  }

  return v11;
}

- (void)setPrivacyProxyEnabled:(id)a3
{
  dataCache = self->_dataCache;
  context = self->_context;
  uint64_t v5 = [a3 BOOLValue];
  [(PSUICoreTelephonyDataCache *)dataCache setPrivacyProxy:context enabled:v5];
}

- (id)isPrivacyProxyEnabled
{
  BOOL v2 = [(PSUICoreTelephonyDataCache *)self->_dataCache isPrivacyProxyEnabled:self->_context];
  v3 = NSNumber;
  return (id)[v3 numberWithBool:v2];
}

- (id)groupSpecifier
{
  v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PrivacyProxy"];
  BOOL v4 = [(PSUICoreTelephonyDataCache *)self->_dataCache isUserSubscribedToPrivacyProxy:self->_context];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4) {
    id v7 = @"PRIVACYPROXY_FOOTER_SUBSCRIBED";
  }
  else {
    id v7 = @"PRIVACYPROXY_FOOTER_UNSUBSCRIBED";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];
  [v3 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

  return v3;
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
}

@end