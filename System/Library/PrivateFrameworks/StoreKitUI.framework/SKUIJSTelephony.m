@interface SKUIJSTelephony
- (BOOL)isCellularRoaming;
- (NSString)countryCode;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)operatorName;
- (NSString)phoneNumber;
- (NSString)providerName;
- (SKUIJSTelephony)initWithAppContext:(id)a3;
- (__CTServerConnection)_telephonyServer;
- (id)formattedPhoneNumber:(id)a3;
- (void)beginObserving;
- (void)dealloc;
- (void)sendSMSWithBodyText:(id)a3 :(id)a4 :(id)a5;
@end

@implementation SKUIJSTelephony

- (SKUIJSTelephony)initWithAppContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSTelephony initWithAppContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIJSTelephony;
  v5 = [(IKJSObject *)&v9 initWithAppContext:v4];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIJSTelephony", 0);
    telephonyQueue = v5->_telephonyQueue;
    v5->_telephonyQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

- (void)dealloc
{
  v3 = (void *)SKUICoreTelephonyFramework();
  if (self->_telephonyServer)
  {
    id v4 = v3;
    v5 = (void (*)(__CTServerConnection *, void))SKUIWeakLinkedSymbolForString("_CTServerConnectionUnregisterForNotification", v3);
    if (v5)
    {
      dispatch_queue_t v6 = v5;
      v7 = SKUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v7);
      v8 = SKUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v4);
      v6(self->_telephonyServer, *v8);
      objc_super v9 = SKUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v9);
      v10 = SKUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v4);
      v6(self->_telephonyServer, *v10);
    }
    CFRelease(self->_telephonyServer);
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIJSTelephony;
  [(SKUIJSTelephony *)&v11 dealloc];
}

- (void)beginObserving
{
  if (!self->_isObserving)
  {
    v3 = [(SKUIJSTelephony *)self _telephonyServer];
    if (v3)
    {
      id v4 = v3;
      v5 = (void *)SKUICoreTelephonyFramework();
      dispatch_queue_t v6 = (void (*)(__CTServerConnection *, void))SKUIWeakLinkedSymbolForString("_CTServerConnectionRegisterForNotification", v5);
      if (v6)
      {
        v7 = v6;
        v8 = SKUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v5);
        v7(v4, *v8);
        objc_super v9 = SKUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v5);
        v7(v4, *v9);
        v10 = SKUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v5);
        v7(v4, *v10);
        objc_super v11 = SKUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v5);
        v7(v4, *v11);
      }
      self->_isObserving = 1;
    }
  }
}

- (NSString)countryCode
{
  active = (void *)CPPhoneNumberCopyActiveCountryCode();

  return (NSString *)active;
}

- (id)formattedPhoneNumber:(id)a3
{
  v3 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();

  return v3;
}

- (BOOL)isCellularRoaming
{
  v2 = (void *)SKUICoreTelephonyFramework();
  v3 = (uint64_t (*)(void))SKUIWeakLinkedSymbolForString("CTRegistrationCopyDataStatus", v2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3();
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = (const __CFDictionary *)v4;
  dispatch_queue_t v6 = (const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationStatus", v2);
  Value = CFDictionaryGetValue(v5, *v6);
  if (Value)
  {
    v8 = Value;
    objc_super v9 = (CFTypeRef *)SKUIWeakLinkedSymbolForString("kCTRegistrationStatusRegisteredRoaming", v2);
    BOOL v10 = CFEqual(v8, *v9) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  CFRelease(v5);
  return v10;
}

- (NSString)mobileCountryCode
{
  id v6 = 0;
  v2 = [(SKUIJSTelephony *)self _telephonyServer];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = (void *)SKUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SKUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileCountryCode", v4);
    if (v2)
    {
      ((void (*)(__CTServerConnection *, id *))v2)(v3, &v6);
      v2 = (__CTServerConnection *)v6;
    }
  }

  return (NSString *)v2;
}

- (NSString)mobileNetworkCode
{
  id v6 = 0;
  v2 = [(SKUIJSTelephony *)self _telephonyServer];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = (void *)SKUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SKUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileNetworkCode", v4);
    if (v2)
    {
      ((void (*)(__CTServerConnection *, id *))v2)(v3, &v6);
      v2 = (__CTServerConnection *)v6;
    }
  }

  return (NSString *)v2;
}

- (NSString)operatorName
{
  v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  v3 = [v2 operatorName];

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  v3 = [v2 phoneNumber];

  return (NSString *)v3;
}

- (NSString)providerName
{
  v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  v3 = [v2 providerName];

  return (NSString *)v3;
}

- (void)sendSMSWithBodyText:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = SKUICoreTelephonyFramework();
  id v11 = SKUIWeakLinkedClassForString(&cfstr_Ctmessagecente.isa, v10);
  objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Ctphonenumber.isa, v10), "phoneNumberWithDigits:countryCode:", v8, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v12 = [v11 sharedMessageCenter];
  v13 = [v14 canonicalFormat];
  [v12 sendSMSWithText:v9 serviceCenter:0 toAddress:v13];
}

- (__CTServerConnection)_telephonyServer
{
  if (!self->_telephonyServer)
  {
    v3 = (void *)SKUICoreTelephonyFramework();
    uint64_t v4 = SKUIWeakLinkedSymbolForString("_CTServerConnectionCreateWithIdentifier", v3);
    CFDictionaryRef v5 = (void (*)(void))SKUIWeakLinkedSymbolForString("_CTServerConnectionSetTargetQueue", v3);
    if (v4)
    {
      id v6 = v5;
      if (v5)
      {
        v8[0] = 0;
        long long v9 = 0u;
        uint64_t v10 = 0;
        v8[1] = self;
        self->_telephonyServer = (__CTServerConnection *)((uint64_t (*)(void, __CFString *, void, void *))v4)(0, @"com.apple.StoreKitUI.SKUIJSTelephony", _telephonyNotification, v8);
        v6();
      }
    }
  }
  return self->_telephonyServer;
}

- (void).cxx_destruct
{
}

- (void)initWithAppContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSTelephony initWithAppContext:]";
}

@end