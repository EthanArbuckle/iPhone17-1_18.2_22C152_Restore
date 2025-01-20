@interface CKMMSSettingsHelper
+ (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4;
- (id)_syncManager;
- (id)getMMSDictionary;
- (id)isMMSEnabled;
- (id)willSendGroupMMS;
- (void)setMMSEnabled:(BOOL)a3;
@end

@implementation CKMMSSettingsHelper

+ (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v8 = [v7 isReadMMSDefaultFromCBEnabled];

  if (v8)
  {
    v9 = [MEMORY[0x263F4AF48] sharedInstance];
    v10 = [v9 ctSubscriptionInfo];
    v11 = objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);

    if (v11) {
      goto LABEL_3;
    }
    if (IMSharedHelperDeviceHasMultipleActiveSubscriptions()) {
      goto LABEL_9;
    }
    v17 = [MEMORY[0x263F4AF48] sharedInstance];
    v18 = [v17 ctSubscriptionInfo];
    v19 = [v18 subscriptions];
    v11 = [v19 firstObject];

    if (v11)
    {
LABEL_3:
      v12 = [MEMORY[0x263F4AF48] sharedInstance];
      v13 = (void *)[v12 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_2704C9270 defaultValue:0 valueIfError:0];

      if (v13)
      {
        v14 = [v13 valueForKey:@"MMSDefaultEnabled"];
        v15 = v14;
        if (v14) {
          char v16 = [v14 BOOLValue];
        }
        else {
          char v16 = 1;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
LABEL_9:
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (id)getMMSDictionary
{
  v2 = [MEMORY[0x263F4AF48] sharedInstance];
  v3 = [v2 ctSubscriptionInfo];
  v4 = [v3 subscriptions];
  id v5 = [v4 firstObject];

  id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MMS", 0);
  v7 = [MEMORY[0x263F4AF48] sharedInstance];
  int v8 = (void *)[v7 copyCarrierBundleValueForSubscriptionContext:v5 keyHierarchy:v6 defaultValue:0 valueIfError:0];

  return v8;
}

- (id)isMMSEnabled
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    v2 = [MEMORY[0x263F4AF48] sharedInstance];
    v3 = [v2 ctSubscriptionInfo];
    v4 = [v3 subscriptions];
    id v5 = [v4 firstObject];

    id v6 = (void *)MEMORY[0x263F4AF40];
    v7 = [v5 phoneNumber];
    int v8 = [v5 labelID];
    v9 = [v6 IMUniqueIdentifierForPhoneNumber:v7 simID:v8];

    CFStringRef v10 = (const __CFString *)[NSString stringWithFormat:@"%@%@", @"MMSEnabled-", v9];
  }
  else
  {
    v9 = 0;
    CFStringRef v10 = @"MMSEnabled";
  }
  Boolean keyExistsAndHasValidFormat = 0;
  v11 = [MEMORY[0x263F3BB18] sharedInstance];
  int v12 = [v11 supportsMMS];

  unsigned int v13 = CFPreferencesGetAppBooleanValue(v10, @"com.apple.MobileSMS", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    v14 = [MEMORY[0x263F4AF48] sharedInstance];
    v15 = [v14 ctSubscriptionInfo];
    char v16 = [v15 subscriptions];
    v17 = [v16 firstObject];

    v18 = objc_opt_class();
    v19 = [v17 phoneNumber];
    v20 = [v17 labelID];
    unsigned int v13 = [v18 mmsDefaultEnabledForPhoneNumber:v19 simID:v20];
  }
  if (_IMWillLog())
  {
    v21 = @"NO";
    if ((v12 & v13) != 0) {
      v21 = @"YES";
    }
    v24 = v9;
    CFStringRef v25 = v10;
    v26 = v21;
    _IMAlwaysLog();
  }
  v22 = objc_msgSend(NSNumber, "numberWithBool:", v12 & v13, v24, v25, v26);

  return v22;
}

- (void)setMMSEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    id v5 = [MEMORY[0x263F4AF48] sharedInstance];
    id v6 = [v5 ctSubscriptionInfo];
    v7 = [v6 subscriptions];
    int v8 = [v7 firstObject];

    v9 = (void *)MEMORY[0x263F4AF40];
    CFStringRef v10 = [v8 phoneNumber];
    v11 = [v8 labelID];
    id v30 = [v9 IMUniqueIdentifierForPhoneNumber:v10 simID:v11];

    CFStringRef v12 = (const __CFString *)[NSString stringWithFormat:@"%@%@", @"MMSEnabled-", v30];
  }
  else
  {
    id v30 = 0;
    CFStringRef v12 = @"MMSEnabled";
  }
  CFPreferencesSetAppValue(v12, (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.MobileSMS");
  if (_IMWillLog())
  {
    unsigned int v13 = [NSNumber numberWithBool:v3];
    int v14 = [v13 BOOLValue];
    v15 = @"NO";
    if (v14) {
      v15 = @"YES";
    }
    CFStringRef v26 = v12;
    v28 = v15;
    id v24 = v30;
    _IMAlwaysLog();
  }
  char v16 = objc_msgSend(NSNumber, "numberWithBool:", v3, v24, v26, v28);
  char v17 = [v16 BOOLValue];

  if ((v17 & 1) == 0)
  {
    if (_IMWillLog())
    {
      v18 = [NSNumber numberWithBool:v3];
      int v19 = [v18 BOOLValue];
      v20 = @"NO";
      if (v19) {
        v20 = @"YES";
      }
      v27 = @"MMSShowSubject";
      v29 = v20;
      id v25 = v30;
      _IMAlwaysLog();
    }
    CFPreferencesSetAppValue(@"MMSShowSubject", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithBool:", v3, v25, v27, v29), @"com.apple.MobileSMS");
  }
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSEnabled.changed", 0, 0, 1u);
  v22 = [(CKMMSSettingsHelper *)self _syncManager];
  v23 = [MEMORY[0x263EFFA08] setWithObject:@"MMSEnabled"];
  [v22 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v23];
}

- (id)willSendGroupMMS
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    BOOL v3 = [MEMORY[0x263F4AF48] sharedInstance];
    v4 = [v3 ctSubscriptionInfo];
    id v5 = [v4 subscriptions];
    id v6 = [v5 firstObject];

    v7 = (void *)MEMORY[0x263F4AF40];
    int v8 = [v6 phoneNumber];
    v9 = [v6 labelID];
    CFStringRef v10 = [v7 IMUniqueIdentifierForPhoneNumber:v8 simID:v9];

    v11 = 0;
  }
  else
  {
    v11 = [(CKMMSSettingsHelper *)self getMMSDictionary];
    CFStringRef v10 = 0;
    id v6 = 0;
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    CFStringRef v12 = [MEMORY[0x263F4AF48] sharedInstance];
    unsigned int v13 = (void *)[v12 copyCarrierBundleValueForSubscriptionContext:v6 keyHierarchy:&unk_2704C9288 defaultValue:MEMORY[0x263EFFA80] valueIfError:MEMORY[0x263EFFA80]];
    int v14 = (void *)[v13 BOOLValue];
  }
  else
  {
    int v14 = [v11 objectForKey:@"GroupModeEnabled"];

    if (!v14) {
      goto LABEL_9;
    }
    CFStringRef v12 = [v11 objectForKey:@"GroupModeEnabled"];
    int v14 = (void *)[v12 BOOLValue];
  }

LABEL_9:
  if (_IMWillLog())
  {
    v15 = @"NO";
    if (v14) {
      v15 = @"YES";
    }
    v18 = v10;
    int v19 = v15;
    _IMAlwaysLog();
  }
  char v16 = objc_msgSend(NSNumber, "numberWithBool:", v14, v18, v19);

  return v16;
}

- (id)_syncManager
{
  v2 = (objc_class *)MEMORY[0x25A2A32D0](@"NPSManager", @"NanoPreferencesSync");
  if (v2) {
    v2 = (objc_class *)objc_alloc_init(v2);
  }
  return v2;
}

@end