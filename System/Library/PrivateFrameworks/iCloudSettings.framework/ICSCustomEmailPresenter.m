@interface ICSCustomEmailPresenter
- (ICSCustomEmailPresenter)initWithAccountManager:(id)a3 presenter:(id)a4;
- (void)showCustomEmailDomainView;
@end

@implementation ICSCustomEmailPresenter

- (ICSCustomEmailPresenter)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICSCustomEmailPresenter;
  v8 = [(ICSCustomEmailPresenter *)&v15 init];
  if (v8)
  {
    v9 = LogSubsystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICSCustomEmailPresenter initWithAccountManager:presenter:](v6, v9);
    }

    v10 = objc_msgSend(MEMORY[0x263F086E0], "ics_loadBundle:atPath:", @"MailAccountSettings.bundle", @"System/Library/PreferenceBundles/AccountSettings");
    v11 = NSClassFromString(&cfstr_Byodspecifierp.isa);
    if ([(objc_class *)v11 conformsToProtocol:&unk_270E21F68])
    {
      uint64_t v12 = [[v11 alloc] initWithAccountManager:v6 presenter:v7];
      customEmailSpecifierProvider = v8->_customEmailSpecifierProvider;
      v8->_customEmailSpecifierProvider = (AAUISpecifierProvider *)v12;
    }
    else
    {
      customEmailSpecifierProvider = LogSubsystem();
      if (os_log_type_enabled(customEmailSpecifierProvider, OS_LOG_TYPE_ERROR)) {
        -[ICSCustomEmailPresenter initWithAccountManager:presenter:]((uint64_t)v10, customEmailSpecifierProvider);
      }
    }
  }
  return v8;
}

- (void)showCustomEmailDomainView
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"BYOD_HANDLE_URL_NOTIFICATION" object:0 userInfo:MEMORY[0x263EFFA78]];
}

- (void).cxx_destruct
{
}

- (void)initWithAccountManager:(uint64_t)a1 presenter:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
}

- (void)initWithAccountManager:(void *)a1 presenter:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 accounts];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
  int v6 = 138412546;
  id v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_262993000, a2, OS_LOG_TYPE_DEBUG, "AccountManager: %@, account: %@", (uint8_t *)&v6, 0x16u);
}

@end