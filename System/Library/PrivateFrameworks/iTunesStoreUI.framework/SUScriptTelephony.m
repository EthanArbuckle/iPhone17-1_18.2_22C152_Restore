@interface SUScriptTelephony
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)_checkIfIsAllowed;
- (NSString)countryCode;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)operatorName;
- (NSString)phoneNumber;
- (NSString)providerName;
- (SUScriptTelephony)init;
- (id)_className;
- (id)formattedPhoneNumber:(id)a3;
- (id)isCellularRoaming;
- (id)isGreenTea;
- (id)scriptAttributeKeys;
- (id)sendSMSWithBodyText:(id)a3 digits:(id)a4 countryCode:(id)a5;
- (void)_handleOperatorNameChangedNotification:(id)a3;
- (void)_handlePhoneNumberChangedNotification:(id)a3;
- (void)_handleRegistrationChangedNotification:(id)a3;
- (void)dealloc;
@end

@implementation SUScriptTelephony

- (SUScriptTelephony)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptTelephony;
  v2 = [(SUScriptObject *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F7B3F0] sharedController];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__handleOperatorNameChangedNotification_ name:*MEMORY[0x263F7BD10] object:v3];
    [v4 addObserver:v2 selector:sel__handlePhoneNumberChangedNotification_ name:*MEMORY[0x263F7BD18] object:v3];
    [v4 addObserver:v2 selector:sel__handleRegistrationChangedNotification_ name:*MEMORY[0x263F7BD20] object:v3];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F7B3F0] sharedController];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F7BD10] object:v3];
  [v4 removeObserver:self name:*MEMORY[0x263F7BD18] object:v3];
  [v4 removeObserver:self name:*MEMORY[0x263F7BD20] object:v3];

  v5.receiver = self;
  v5.super_class = (Class)SUScriptTelephony;
  [(SUScriptObject *)&v5 dealloc];
}

- (id)_className
{
  return @"iTunesTelephony";
}

- (NSString)countryCode
{
  if ([(SUScriptTelephony *)self _checkIfIsAllowed]) {
    active = (void *)CPPhoneNumberCopyActiveCountryCode();
  }
  else {
    active = 0;
  }

  return (NSString *)active;
}

- (id)isCellularRoaming
{
  if (![(SUScriptTelephony *)self _checkIfIsAllowed]) {
    goto LABEL_8;
  }
  CFDictionaryRef v2 = (const __CFDictionary *)CTRegistrationCopyDataStatus();
  if (!v2) {
    goto LABEL_8;
  }
  CFDictionaryRef v3 = v2;
  Value = CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263F02FE0]);
  if (!Value)
  {
    CFRelease(v3);
LABEL_8:
    objc_super v6 = (void **)MEMORY[0x263EFFB38];
    goto LABEL_9;
  }
  int v5 = CFEqual(Value, (CFTypeRef)*MEMORY[0x263F03010]);
  CFRelease(v3);
  objc_super v6 = (void **)MEMORY[0x263EFFB40];
  if (!v5) {
    objc_super v6 = (void **)MEMORY[0x263EFFB38];
  }
LABEL_9:
  v7 = *v6;

  return v7;
}

- (id)isGreenTea
{
  int v2 = MGGetBoolAnswer();
  CFDictionaryRef v3 = (void **)MEMORY[0x263EFFB40];
  if (!v2) {
    CFDictionaryRef v3 = (void **)MEMORY[0x263EFFB38];
  }
  v4 = *v3;

  return v4;
}

- (NSString)mobileCountryCode
{
  if ([(SUScriptTelephony *)self _checkIfIsAllowed])
  {
    int v2 = [MEMORY[0x263F7B3F0] sharedController];
    CFDictionaryRef v3 = [v2 mobileSubscriberCountryCode];
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)mobileNetworkCode
{
  if ([(SUScriptTelephony *)self _checkIfIsAllowed])
  {
    int v2 = [MEMORY[0x263F7B3F0] sharedController];
    CFDictionaryRef v3 = [v2 mobileSubscriberNetworkCode];
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)operatorName
{
  if ([(SUScriptTelephony *)self _checkIfIsAllowed])
  {
    int v2 = [MEMORY[0x263F7B3F0] sharedController];
    CFDictionaryRef v3 = [v2 operatorName];
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  if ([(SUScriptTelephony *)self _checkIfIsAllowed])
  {
    int v2 = [MEMORY[0x263F7B3F0] sharedController];
    CFDictionaryRef v3 = [v2 phoneNumber];
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)providerName
{
  if ([(SUScriptTelephony *)self _checkIfIsAllowed])
  {
    int v2 = [MEMORY[0x263F7B3F0] sharedController];
    CFDictionaryRef v3 = [v2 providerName];
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return (NSString *)v3;
}

- (id)formattedPhoneNumber:(id)a3
{
  id v4 = a3;
  if ([(SUScriptTelephony *)self _checkIfIsAllowed]) {
    int v5 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (id)sendSMSWithBodyText:(id)a3 digits:(id)a4 countryCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(SUScriptTelephony *)self _checkIfIsAllowed]) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_13:
    v13 = (id *)MEMORY[0x263EFFB38];
    goto LABEL_14;
  }
  v11 = [MEMORY[0x263F7B3F0] sharedController];
  int v12 = [v11 sendSMSWithText:v8 toPhoneNumber:v9 countryCode:v10 error:0];

  v13 = (id *)MEMORY[0x263EFFB40];
  if (!v12) {
    v13 = (id *)MEMORY[0x263EFFB38];
  }
LABEL_14:
  id v14 = *v13;

  return v14;
}

- (void)_handleOperatorNameChangedNotification:(id)a3
{
}

- (void)_handlePhoneNumberChangedNotification:(id)a3
{
}

- (void)_handleRegistrationChangedNotification:(id)a3
{
}

- (BOOL)_checkIfIsAllowed
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFDictionaryRef v3 = objc_alloc_init(SUScriptAccessSecurity);
  id v4 = [(SUScriptObject *)self webFrame];
  id v16 = 0;
  BOOL v5 = [(SUScriptAccessSecurity *)v3 canAccessTelephonyInFrame:v4 error:&v16];
  id v6 = v16;

  if (v6)
  {
    v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      v11 = objc_opt_class();
      int v17 = 138412546;
      v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      id v12 = v11;
      LODWORD(v15) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v17, v15);
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)__KeyMapping_55 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptTelephony;
    BOOL v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  BOOL v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_40, 2);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptTelephony;
    BOOL v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptTelephony;
  int v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  CFDictionaryRef v3 = [(id)__KeyMapping_55 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_40 = (uint64_t)sel_formattedPhoneNumber_;
    unk_2681B5450 = @"formattedPhoneNumber";
    qword_2681B5458 = (uint64_t)sel_sendSMSWithBodyText_digits_countryCode_;
    unk_2681B5460 = @"sendSMS";
    __KeyMapping_55 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"countryCode", @"isCellularRoaming", @"isCellularRoaming", @"isGreenTea", @"isGreenTea", @"mobileCountryCode", @"mobileCountryCode", @"mobileNetworkCode", @"mobileNetworkCode", @"operatorName", @"operatorName", @"phoneNumber", @"phoneNumber", @"providerName", @"providerName", 0);
    MEMORY[0x270F9A758]();
  }
}

@end