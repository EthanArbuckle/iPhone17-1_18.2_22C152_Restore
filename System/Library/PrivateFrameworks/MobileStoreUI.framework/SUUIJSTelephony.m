@interface SUUIJSTelephony
- (BOOL)isCellularRoaming;
- (NSString)countryCode;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)operatorName;
- (NSString)phoneNumber;
- (NSString)providerName;
- (SUUIJSTelephony)initWithAppContext:(id)a3;
- (__CTServerConnection)_telephonyServer;
- (id)formattedPhoneNumber:(id)a3;
- (void)beginObserving;
- (void)dealloc;
- (void)sendSMSWithBodyText:(id)a3 :(id)a4 :(id)a5;
@end

@implementation SUUIJSTelephony

- (SUUIJSTelephony)initWithAppContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIJSTelephony;
  v3 = [(IKJSObject *)&v7 initWithAppContext:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIJSTelephony", 0);
    telephonyQueue = v3->_telephonyQueue;
    v3->_telephonyQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)SUUICoreTelephonyFramework();
  if (self->_telephonyServer)
  {
    dispatch_queue_t v4 = v3;
    v5 = (void (*)(__CTServerConnection *, void))SUUIWeakLinkedSymbolForString("_CTServerConnectionUnregisterForNotification", v3);
    if (v5)
    {
      v6 = v5;
      objc_super v7 = SUUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v7);
      v8 = SUUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v4);
      v6(self->_telephonyServer, *v8);
      v9 = SUUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v9);
      v10 = SUUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v4);
      v6(self->_telephonyServer, *v10);
    }
    CFRelease(self->_telephonyServer);
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIJSTelephony;
  [(SUUIJSTelephony *)&v11 dealloc];
}

- (void)beginObserving
{
  if (!self->_isObserving)
  {
    v3 = [(SUUIJSTelephony *)self _telephonyServer];
    if (v3)
    {
      dispatch_queue_t v4 = v3;
      v5 = (void *)SUUICoreTelephonyFramework();
      v6 = (void (*)(__CTServerConnection *, void))SUUIWeakLinkedSymbolForString("_CTServerConnectionRegisterForNotification", v5);
      if (v6)
      {
        objc_super v7 = v6;
        v8 = SUUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v5);
        v7(v4, *v8);
        v9 = SUUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v5);
        v7(v4, *v9);
        v10 = SUUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v5);
        v7(v4, *v10);
        objc_super v11 = SUUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v5);
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
  v2 = (void *)SUUICoreTelephonyFramework();
  v3 = (uint64_t (*)(void))SUUIWeakLinkedSymbolForString("CTRegistrationCopyDataStatus", v2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3();
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = (const __CFDictionary *)v4;
  v6 = (const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationStatus", v2);
  Value = CFDictionaryGetValue(v5, *v6);
  if (Value)
  {
    v8 = Value;
    v9 = (CFTypeRef *)SUUIWeakLinkedSymbolForString("kCTRegistrationStatusRegisteredRoaming", v2);
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
  v2 = [(SUUIJSTelephony *)self _telephonyServer];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = (void *)SUUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SUUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileCountryCode", v4);
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
  v2 = [(SUUIJSTelephony *)self _telephonyServer];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = (void *)SUUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SUUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileNetworkCode", v4);
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
  v2 = [MEMORY[0x263F894C0] sharedInstance];
  v3 = [v2 operatorName];

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  v2 = [MEMORY[0x263F894C0] sharedInstance];
  v3 = [v2 phoneNumber];

  return (NSString *)v3;
}

- (NSString)providerName
{
  v2 = [MEMORY[0x263F894C0] sharedInstance];
  v3 = [v2 providerName];

  return (NSString *)v3;
}

- (void)sendSMSWithBodyText:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = SUUICoreTelephonyFramework();
  id v11 = SUUIWeakLinkedClassForString(&cfstr_Ctmessagecente.isa, v10);
  objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Ctphonenumber.isa, v10), "phoneNumberWithDigits:countryCode:", v8, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v12 = [v11 sharedMessageCenter];
  v13 = [v14 canonicalFormat];
  [v12 sendSMSWithText:v9 serviceCenter:0 toAddress:v13];
}

- (__CTServerConnection)_telephonyServer
{
  if (!self->_telephonyServer)
  {
    v3 = (void *)SUUICoreTelephonyFramework();
    uint64_t v4 = SUUIWeakLinkedSymbolForString("_CTServerConnectionCreateWithIdentifier", v3);
    CFDictionaryRef v5 = (void (*)(void))SUUIWeakLinkedSymbolForString("_CTServerConnectionSetTargetQueue", v3);
    if (v4)
    {
      id v6 = v5;
      if (v5)
      {
        v8[0] = 0;
        long long v9 = 0u;
        uint64_t v10 = 0;
        v8[1] = self;
        self->_telephonyServer = (__CTServerConnection *)((uint64_t (*)(void, __CFString *, void, void *))v4)(0, @"com.apple.iTunesStoreUI.SUUIJSTelephony", _telephonyNotification, v8);
        v6();
      }
    }
  }
  return self->_telephonyServer;
}

- (void).cxx_destruct
{
}

@end