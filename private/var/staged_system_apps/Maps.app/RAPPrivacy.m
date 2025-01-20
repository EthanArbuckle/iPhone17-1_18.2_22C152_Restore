@interface RAPPrivacy
+ (BOOL)hasReceivedPrivacyConsent;
+ (id)callToActionMessage;
+ (id)callToActionMessageForShortcutType:(int64_t)a3;
+ (id)emailAnalyticsEventForEmailAddress:(id)a3 isValidEmail:(BOOL)a4 optedIn:(BOOL)a5;
+ (id)informationalMessageWithEmailAddress:(id)a3 isUserEnteredEmailAddress:(BOOL)a4 isMac:(BOOL)a5;
+ (id)macPreferencesInformationalMessageWithEmailAddress:(id)a3;
+ (void)performPrivacyCheckWithAppearance:(int64_t)a3 completion:(id)a4;
+ (void)performPrivacyCheckWithAppearance:(int64_t)a3 userEnteredEmailAddress:(id)a4 completion:(id)a5;
+ (void)setPrivacyConsent:(BOOL)a3 allowEmail:(BOOL)a4;
+ (void)showPrivacyScreenWithAppearance:(int64_t)a3;
+ (void)showPrivacyScreenWithAppearance:(int64_t)a3 completion:(id)a4;
+ (void)showPrivacyScreenWithAppearance:(int64_t)a3 userEnteredEmailAddress:(id)a4 completion:(id)a5;
@end

@implementation RAPPrivacy

+ (void)performPrivacyCheckWithAppearance:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([a1 hasReceivedPrivacyConsent])
  {
    if (v6) {
      (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, 1, 0, 0);
    }
  }
  else
  {
    [a1 showPrivacyScreenWithAppearance:a3 completion:v6];
  }
}

+ (void)performPrivacyCheckWithAppearance:(int64_t)a3 userEnteredEmailAddress:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if ([a1 hasReceivedPrivacyConsent])
  {
    if (v8) {
      (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 1, 0, 0);
    }
  }
  else
  {
    [a1 showPrivacyScreenWithAppearance:a3 userEnteredEmailAddress:v9 completion:v8];
  }
}

+ (void)showPrivacyScreenWithAppearance:(int64_t)a3
{
}

+ (void)showPrivacyScreenWithAppearance:(int64_t)a3 userEnteredEmailAddress:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = [[RAPPrivacyViewController alloc] initWithUserEnteredEmailAddress:v7];

  [(RAPPrivacyViewController *)v8 presentPrivacyScreen:v6];
}

+ (void)showPrivacyScreenWithAppearance:(int64_t)a3 completion:(id)a4
{
  id v4 = a4;
  v5 = objc_alloc_init(RAPPrivacyViewController);
  [(RAPPrivacyViewController *)v5 presentPrivacyScreen:v4];
}

+ (BOOL)hasReceivedPrivacyConsent
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"RAPHasReceived2015PrivacyConsent"];

  return v3;
}

+ (void)setPrivacyConsent:(BOOL)a3 allowEmail:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setBool:v5 forKey:@"RAPHasReceived2015PrivacyConsent"];

  if (v4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }

  sub_100578E18(@"RAPContactBackByEmailPreference", v7);
}

+ (id)callToActionMessage
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"Report an Issue [Call to action]" value:@"localized string not found" table:0];

  return v3;
}

+ (id)callToActionMessageForShortcutType:(int64_t)a3
{
  if (a3 == 3)
  {
    unsigned __int8 v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"Submit RAP Confirmation (Work Question)";
  }
  else if (a3 == 2)
  {
    unsigned __int8 v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"Submit RAP Confirmation (Home Question)";
  }
  else
  {
    unsigned __int8 v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"Submit RAP Confirmation (Default Question)";
  }
  id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

+ (id)informationalMessageWithEmailAddress:(id)a3 isUserEnteredEmailAddress:(BOOL)a4 isMac:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [v7 length];
  id v9 = +[NSBundle mainBundle];
  v10 = v9;
  if (v8)
  {
    if (v6)
    {
      CFStringRef v11 = @"Report an Issue [Privacy description w/ user entered email]";
    }
    else if (v5)
    {
      CFStringRef v11 = @"Report an Issue Mac [Privacy description w/ email]";
    }
    else
    {
      CFStringRef v11 = @"Report an Issue [Privacy description w/ email]";
    }
    uint64_t v13 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:0];

    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v7);
    v10 = (void *)v13;
  }
  else
  {
    v12 = [v9 localizedStringForKey:@"Report an Issue [Privacy description w/o email]" value:@"localized string not found" table:0];
  }

  return v12;
}

+ (id)macPreferencesInformationalMessageWithEmailAddress:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  BOOL v5 = +[NSBundle mainBundle];
  BOOL v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"Report an Issue Preferences Mac [Privacy description w/ email]" value:@"localized string not found" table:0];

    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3);
    BOOL v6 = (void *)v7;
  }
  else
  {
    id v8 = [v5 localizedStringForKey:@"Report an Issue [Privacy description w/o email]" value:@"localized string not found" table:0];
  }

  return v8;
}

+ (id)emailAnalyticsEventForEmailAddress:(id)a3 isValidEmail:(BOOL)a4 optedIn:(BOOL)a5
{
  if (a4)
  {
    if (a5) {
      uint64_t v7 = @"EMAIL_ON";
    }
    else {
      uint64_t v7 = @"EMAIL_OFF";
    }
  }
  else
  {
    id v9 = [a3 length];
    v10 = @"INVALID_EMAIL";
    if (!v9) {
      v10 = @"NO_EMAIL";
    }
    uint64_t v7 = v10;
  }
  return v7;
}

@end