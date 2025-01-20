@interface COSDictationOptinViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)wantsUnifiedFYI;
- (COSDictationOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)learnMoreButtonPressed:(id)a3;
- (void)setNanoDictationEnabled:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSDictationOptinViewController

+ (BOOL)wantsUnifiedFYI
{
  id v2 = sub_100054AC0();

  return [v2 dictationIsEnabled];
}

+ (BOOL)controllerNeedsToRun
{
  id v2 = [UIApp activeWatch];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"41453C7F-5D99-4842-9DE4-F37E3A4D9D50"];
  unsigned int v4 = [v2 supportsCapability:v3];

  if (!v4
    || +[COSDictationOptinViewController wantsUnifiedFYI]|| (BPSShouldOfferSiriForDeviceLanguage() & 1) != 0)
  {
    return 0;
  }

  return sub_1000548B8();
}

- (COSDictationOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSDictationOptinViewController;
  id v2 = [(COSOptinViewController *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(COSDictationOptinViewController *)v2 setStyle:90];
  }
  return v3;
}

- (id)titleString
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"DICTATION_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"DICTATION_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)imageResource
{
  id v2 = [UIApp activeWatch];
  int v3 = BPSIsDeviceCompatibleWithVersions();

  if (v3)
  {
    unsigned int v4 = [@"Screen-Siri" stringByAppendingString:@"-v3"];
  }
  else
  {
    unsigned int v4 = @"Screen-Siri";
  }
  objc_super v5 = sub_1000328FC((uint64_t)v4);

  return v5;
}

- (void)suggestedButtonPressed:(id)a3
{
  unsigned int v4 = [UIApp activeWatch:a3];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F06861AE-125A-424B-AF25-C1DAA8F7AEBC"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    [(COSDictationOptinViewController *)self applyConfirmedOptin:1];
  }
  else
  {
    [(COSDictationOptinViewController *)self showOptinConfirmationAlert:@"DICTATION" optinChoice:1];
  }
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [UIApp activeWatch];
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F06861AE-125A-424B-AF25-C1DAA8F7AEBC"];
  unsigned int v7 = [v5 supportsCapability:v6];

  if (v7)
  {
    [(COSDictationOptinViewController *)self setNanoDictationEnabled:v3];
  }
  else
  {
    v8 = [sub_100055020() sharedPreferences];
    [v8 setDictationIsEnabled:v3];

    v9 = [sub_100055020() sharedPreferences];
    [v9 synchronize];
  }
  id v10 = [(COSDictationOptinViewController *)self delegate];
  [v10 buddyControllerDone:self];
}

- (void)setNanoDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [UIApp activeWatch];
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.assistant.nano" pairedDevice:v10];
  id v5 = +[NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKey:@"Dictation Enabled"];

  id v6 = [v4 synchronize];
  unsigned int v7 = objc_opt_new();
  v8 = [v4 domain];
  v9 = +[NSSet setWithObject:@"Dictation Enabled"];
  [v7 synchronizeNanoDomain:v8 keys:v9];
}

- (id)suggestedButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"DICTATION_ACCEPT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"DICTATION_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"ABOUT_DICTATION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"WHAT_IS_DICTATION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)learnMoreButtonPressed:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:OBPrivacyAskSiriIdentifier];
  [v4 setPresentingViewController:self];
  [v4 present];
}

@end