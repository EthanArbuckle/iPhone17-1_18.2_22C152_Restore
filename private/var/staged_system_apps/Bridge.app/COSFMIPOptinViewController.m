@interface COSFMIPOptinViewController
+ (BOOL)controllerBlocksRunningBeforeSignInStep;
+ (BOOL)controllerNeedsToRun;
- (BOOL)supportsFindMyWatch;
- (COSFMIPOptinViewController)init;
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
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSFMIPOptinViewController

+ (BOOL)controllerNeedsToRun
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = [v2 aa_primaryAppleAccount];
  unsigned int v4 = [v3 isProvisionedForDataclass:kAccountDataclassDeviceLocator];
  v5 = [UIApp setupController];
  v6 = [v5 appleIDSignInModel];
  unsigned int v7 = [v6 hasSignedInToiCloud];
  if (v3) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = v8 || v4 == 0;
  if (v9 || !sub_1000325D0()) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = +[COSFindMyController isDeviceLocatorEnabled] ^ 1;
  }

  v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = +[NSNumber numberWithBool:v10];
    int v14 = 138412802;
    v15 = v12;
    __int16 v16 = 1024;
    BOOL v17 = v3 != 0;
    __int16 v18 = 1024;
    unsigned int v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "COSFMIPOptinViewController needs to run %@; hasPrimaryAccount: (%d); isProvisioned: (%d)",
      (uint8_t *)&v14,
      0x18u);
  }
  return v10;
}

- (COSFMIPOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSFMIPOptinViewController;
  id v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSFMIPOptinViewController *)v2 setStyle:26];
  }
  return v3;
}

- (BOOL)supportsFindMyWatch
{
  id v2 = [UIApp activeWatch];
  char HasCapabilityForString = BPSDeviceHasCapabilityForString();

  return HasCapabilityForString;
}

- (id)titleString
{
  v3 = +[NSBundle mainBundle];
  if ([(COSFMIPOptinViewController *)self supportsFindMyWatch]) {
    CFStringRef v4 = @"AL_TITLE_FMW";
  }
  else {
    CFStringRef v4 = @"AL_TITLE";
  }
  objc_super v5 = [v3 localizedStringForKey:v4 value:&stru_100249230 table:@"Localizable"];

  return v5;
}

- (id)detailString
{
  if ([(COSFMIPOptinViewController *)self supportsFindMyWatch]) {
    CFStringRef v2 = @"AL_DETAIL_FMW";
  }
  else {
    CFStringRef v2 = @"AL_DETAIL";
  }
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 localizedStringForKey:v2 value:&stru_100249230 table:@"Localizable"];

  return v4;
}

- (id)imageResource
{
  return sub_1000328FC(@"FindMy");
}

- (void)suggestedButtonPressed:(id)a3
{
  if ([(COSFMIPOptinViewController *)self supportsFindMyWatch]) {
    CFStringRef v4 = @"AL_FMW";
  }
  else {
    CFStringRef v4 = @"AL";
  }

  [(COSFMIPOptinViewController *)self showOptinConfirmationAlert:v4 optinChoice:1];
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  if (a3)
  {
    CFStringRef v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling FMIP for Companion.", v6, 2u);
    }

    +[COSFindMyController enabledDeviceLocatorForCompanion];
    +[COSFindMyController recordShowingActivationLockDetailsForPairingDevice];
  }
  objc_super v5 = [(COSFMIPOptinViewController *)self delegate];
  [v5 buddyControllerDone:self];
}

- (id)suggestedButtonTitle
{
  unsigned int v2 = [(COSFMIPOptinViewController *)self supportsFindMyWatch];
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = v3;
  if (v2) {
    CFStringRef v5 = @"AL_ACCEPT_FMW";
  }
  else {
    CFStringRef v5 = @"AL_ACCEPT";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (id)alternateButtonTitle
{
  unsigned int v2 = [(COSFMIPOptinViewController *)self supportsFindMyWatch];
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = v3;
  if (v2) {
    CFStringRef v5 = @"AL_DECLINE_FMW";
  }
  else {
    CFStringRef v5 = @"AL_DECLINE";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (id)learnMoreButtonTitle
{
  unsigned int v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"ABOUT_AL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  unsigned int v2 = [(COSFMIPOptinViewController *)self supportsFindMyWatch];
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = v3;
  if (v2) {
    CFStringRef v5 = @"WHAT_IS_FMW";
  }
  else {
    CFStringRef v5 = @"WHAT_IS_AL";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (void)learnMoreButtonPressed:(id)a3
{
  CFStringRef v4 = objc_alloc_init(COSAboutTextViewController);
  CFStringRef v5 = +[NSBundle mainBundle];
  if ([(COSFMIPOptinViewController *)self supportsFindMyWatch]) {
    CFStringRef v6 = @"ABOUT_AL_PRIVACY_TITLE_FMW";
  }
  else {
    CFStringRef v6 = @"ABOUT_AL_PRIVACY_TITLE";
  }
  unsigned int v7 = [v5 localizedStringForKey:v6 value:&stru_100249230 table:@"OptinDescriptions"];
  [(COSAboutTextViewController *)v4 setTitleString:v7];

  BOOL v8 = +[UIImage imageNamed:@"AboutAL"];
  [(COSAboutTextViewController *)v4 setHeaderGlyph:v8];

  uint64_t v9 = BPSAboutTextViewParagraphHeaderKey;
  v25[0] = BPSAboutTextViewParagraphHeaderKey;
  v21 = +[NSBundle mainBundle];
  v20 = [v21 localizedStringForKey:@"ABOUT_AL_INFO_HEADER" value:&stru_100249230 table:@"OptinDescriptions"];
  v26[0] = v20;
  uint64_t v10 = BPSAboutTextViewParagraphTextKey;
  v25[1] = BPSAboutTextViewParagraphTextKey;
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"ABOUT_AL_INFO_TEXT" value:&stru_100249230 table:@"OptinDescriptions"];
  v26[1] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v27[0] = v13;
  v23[0] = v9;
  int v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"ABOUT_AL_FM_INFO_HEADER" value:&stru_100249230 table:@"OptinDescriptions"];
  v23[1] = v10;
  v24[0] = v15;
  __int16 v16 = +[NSBundle mainBundle];
  BOOL v17 = [v16 localizedStringForKey:@"ABOUT_AL_FM_INFO_TEXT" value:&stru_100249230 table:@"OptinDescriptions"];
  v24[1] = v17;
  __int16 v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v27[1] = v18;
  unsigned int v19 = +[NSArray arrayWithObjects:v27 count:2];

  [(COSAboutTextViewController *)v4 setParagraphs:v19];
  [(COSAboutTextViewController *)v4 presentWithController:self];
}

+ (BOOL)controllerBlocksRunningBeforeSignInStep
{
  return 1;
}

@end