@interface MBPrebuddyGettingStartedViewController
+ (id)_phoneTransferImage;
- (AAUISignInController)signInController;
- (BOOL)didHSA2Upgrade;
- (BOOL)didSignIn;
- (BOOL)needsAccountSignIn;
- (BOOL)needsBackupEnabled;
- (BOOL)needsTemporaryStorage;
- (CGSize)_normalizeSize:(CGSize)a3 to:(CGSize)a4 scale:(double)a5;
- (MBLoadingStatusView)statusView;
- (MBPrebuddyGettingStartedViewController)initWithFlow:(id)a3 entryPoint:(int64_t)a4 deepLinkURL:(id)a5 needsAccountSignIn:(BOOL)a6 altDSIDForHSA2Upgrade:(id)a7;
- (MBViewControllerFlow)flow;
- (NSError)eligibilityError;
- (NSString)altDSIDForHSA2Upgrade;
- (NSString)deepLinkURL;
- (id)_iconOfSystemImageName:(id)a3 glyphScale:(double)a4 nudge:(CGPoint)a5 colored:(id)a6 backgroundGradientStart:(id)a7 backgroundGradientEnd:(id)a8 sized:(double)a9;
- (id)_xpcQueue;
- (int64_t)daysUntilExpiration;
- (int64_t)eligibilityStatus;
- (int64_t)entryPoint;
- (int64_t)mb_step;
- (void)_checkEligibility:(id)a3;
- (void)_checkEligibilityAndUpgradeHSA2IfNeeded:(id)a3;
- (void)_configureButtonTray;
- (void)_enableBackupIfNeeded:(id)a3;
- (void)_hideLoadingStatusView;
- (void)_presentError:(id)a3 completion:(id)a4;
- (void)_setUp;
- (void)_showLoadingStatusView;
- (void)_signInAccountIfNeeded:(id)a3;
- (void)_upgradeHSA2IfNeeded:(id)a3;
- (void)didTapCancelBarButtonItem:(id)a3;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)setAltDSIDForHSA2Upgrade:(id)a3;
- (void)setDaysUntilExpiration:(int64_t)a3;
- (void)setDeepLinkURL:(id)a3;
- (void)setDidHSA2Upgrade:(BOOL)a3;
- (void)setDidSignIn:(BOOL)a3;
- (void)setEligibilityError:(id)a3;
- (void)setEligibilityStatus:(int64_t)a3;
- (void)setEntryPoint:(int64_t)a3;
- (void)setNeedsAccountSignIn:(BOOL)a3;
- (void)setNeedsBackupEnabled:(BOOL)a3;
- (void)setNeedsTemporaryStorage:(BOOL)a3;
- (void)setSignInController:(id)a3;
- (void)setStatusView:(id)a3;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation MBPrebuddyGettingStartedViewController

+ (id)_phoneTransferImage
{
  v3 = +[MBPrebuddyManager twoDeviceImageName];
  v4 = +[NSBundle bundleForClass:a1];
  v5 = +[UIImage imageNamed:v3 inBundle:v4];
  v6 = [v5 imageWithRenderingMode:2];

  return v6;
}

- (MBPrebuddyGettingStartedViewController)initWithFlow:(id)a3 entryPoint:(int64_t)a4 deepLinkURL:(id)a5 needsAccountSignIn:(BOOL)a6 altDSIDForHSA2Upgrade:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v15 = MBLocalizedStringFromTable();
  v16 = MBLocalizedStringFromTable();
  v17 = [(id)objc_opt_class() _phoneTransferImage];
  v26.receiver = self;
  v26.super_class = (Class)MBPrebuddyGettingStartedViewController;
  v18 = [(MBPrebuddyGettingStartedViewController *)&v26 initWithTitle:v15 detailText:v16 icon:v17];

  if (v18)
  {
    objc_storeWeak((id *)&v18->_flow, v12);
    v18->_entryPoint = a4;
    v19 = (NSString *)[v13 copy];
    deepLinkURL = v18->_deepLinkURL;
    v18->_deepLinkURL = v19;

    v18->_needsAccountSignIn = a6;
    objc_storeStrong((id *)&v18->_altDSIDForHSA2Upgrade, a7);
    v21 = [MBLoadingStatusView alloc];
    v22 = MBLocalizedStringFromTable();
    v23 = [(MBLoadingStatusView *)v21 initWithStatusText:v22 backgroundColor:0];
    statusView = v18->_statusView;
    v18->_statusView = v23;
  }
  return v18;
}

- (id)_xpcQueue
{
  if (qword_100023408 != -1) {
    dispatch_once(&qword_100023408, &stru_10001C888);
  }
  v2 = (void *)qword_100023400;
  return v2;
}

- (int64_t)mb_step
{
  return 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MBPrebuddyGettingStartedViewController;
  [(MBPrebuddyGettingStartedViewController *)&v4 viewDidLoad];
  [(MBPrebuddyGettingStartedViewController *)self _setUp];
  v3 = [(MBPrebuddyGettingStartedViewController *)self navigationItem];
  [v3 setHidesBackButton:1];
}

- (void)_setUp
{
  [(MBPrebuddyGettingStartedViewController *)self _configureButtonTray];
  uint64_t v3 = MBLocalizedStringFromTable();
  objc_super v4 = MBLocalizedStringFromTable();
  v5 = +[UIImage systemImageNamed:@"icloud.and.arrow.up"];
  v37 = (void *)v3;
  [(MBPrebuddyGettingStartedViewController *)self addBulletedListItemWithTitle:v4 description:v3 image:v5];

  v6 = MBLocalizedStringFromTable();
  v7 = MBLocalizedStringFromTable();
  v8 = +[UIImage systemImageNamed:@"arrow.3.trianglepath"];
  [(MBPrebuddyGettingStartedViewController *)self addBulletedListItemWithTitle:v6 description:v7 image:v8];

  v9 = [(MBPrebuddyGettingStartedViewController *)self view];
  v10 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  [v9 addSubview:v10];

  v36 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  v34 = [v36 leadingAnchor];
  v35 = [(MBPrebuddyGettingStartedViewController *)self view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v38[0] = v32;
  v31 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  v29 = [v31 topAnchor];
  v30 = [(MBPrebuddyGettingStartedViewController *)self view];
  v28 = [v30 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v38[1] = v27;
  objc_super v26 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  v25 = [v26 trailingAnchor];
  v11 = [(MBPrebuddyGettingStartedViewController *)self view];
  id v12 = [v11 trailingAnchor];
  id v13 = [v25 constraintEqualToAnchor:v12];
  v38[2] = v13;
  id v14 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  v15 = [v14 bottomAnchor];
  v16 = [(MBPrebuddyGettingStartedViewController *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v38[3] = v18;
  v19 = +[NSArray arrayWithObjects:v38 count:4];
  +[NSLayoutConstraint activateConstraints:v19];

  v20 = [(MBPrebuddyGettingStartedViewController *)self navigationItem];
  [v20 _setBackgroundHidden:1];

  id v21 = [(MBPrebuddyGettingStartedViewController *)self navigationController];
  v22 = [v21 navigationBar];
  v23 = [v22 backItem];
  if (v23)
  {

LABEL_5:
    goto LABEL_6;
  }
  unsigned int v24 = +[MBPrebuddyManager hasPrebuddyFollowUp];

  if (v24)
  {
    id v21 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"didTapCancelBarButtonItem:"];
    v22 = [(MBPrebuddyGettingStartedViewController *)self navigationItem];
    [v22 setLeftBarButtonItem:v21];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_configureButtonTray
{
  id v12 = +[OBBoldTrayButton boldButton];
  uint64_t v3 = MBLocalizedStringFromTable();
  [v12 setTitle:v3 forState:0];

  [v12 addTarget:self action:"didTapPrimaryButton:" forEvents:0x2000];
  objc_super v4 = [v12 titleLabel];
  LODWORD(v5) = 1036831949;
  [v4 _setHyphenationFactor:v5];

  v6 = [(MBPrebuddyGettingStartedViewController *)self buttonTray];
  [v6 addButton:v12];

  v7 = +[OBLinkTrayButton linkButton];
  v8 = MBLocalizedStringFromTable();
  [v7 setTitle:v8 forState:0];

  [v7 addTarget:self action:"didTapSecondaryButton:" forEvents:0x2000];
  v9 = [v7 titleLabel];
  LODWORD(v10) = 1036831949;
  [v9 _setHyphenationFactor:v10];

  v11 = [(MBPrebuddyGettingStartedViewController *)self buttonTray];
  [v11 addButton:v7];
}

- (void)_showLoadingStatusView
{
  uint64_t v3 = [(MBPrebuddyGettingStartedViewController *)self navigationController];
  objc_super v4 = [v3 view];
  [v4 setUserInteractionEnabled:0];

  double v5 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  [v5 startAnimating];

  id v6 = [(MBPrebuddyGettingStartedViewController *)self buttonTray];
  [v6 removeAllButtons];
}

- (void)_hideLoadingStatusView
{
  uint64_t v3 = [(MBPrebuddyGettingStartedViewController *)self statusView];
  [v3 stopAnimating];

  objc_super v4 = [(MBPrebuddyGettingStartedViewController *)self buttonTray];
  [v4 removeAllButtons];

  [(MBPrebuddyGettingStartedViewController *)self _configureButtonTray];
  id v6 = [(MBPrebuddyGettingStartedViewController *)self navigationController];
  double v5 = [v6 view];
  [v5 setUserInteractionEnabled:1];
}

- (void)didTapPrimaryButton:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000087C0;
  v3[3] = &unk_10001C6E8;
  v3[4] = self;
  [(MBPrebuddyGettingStartedViewController *)self _signInAccountIfNeeded:v3];
}

- (void)didTapSecondaryButton:(id)a3
{
  objc_super v4 = [(MBPrebuddyGettingStartedViewController *)self navigationController];
  double v5 = [v4 view];
  [v5 setUserInteractionEnabled:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  objc_msgSend(WeakRetained, "mb_didTapCancelFromViewController:", self);
}

- (void)didTapCancelBarButtonItem:(id)a3
{
  objc_super v4 = +[MBPrebuddyManager sharedManager];
  [v4 cancelPrebuddy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  objc_msgSend(WeakRetained, "mb_didTapCancelFromViewController:", self);
}

- (void)_enableBackupIfNeeded:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_needsBackupEnabled)
  {
    id v6 = MBLocalizedStringFromTable();
    v7 = MBLocalizedStringFromTable();
    v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    v9 = MBLocalizedStringFromTable();
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100008C94;
    v24[3] = &unk_10001C8D8;
    v24[4] = self;
    id v10 = v8;
    id v25 = v10;
    id v11 = v5;
    id v26 = v11;
    id v12 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v24];

    id v13 = MBLocalizedStringFromTable();
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_100008F44;
    v20 = &unk_10001C8D8;
    id v21 = self;
    id v22 = v10;
    id v23 = v11;
    id v14 = v10;
    v15 = +[UIAlertAction actionWithTitle:v13 style:1 handler:&v17];

    objc_msgSend(v14, "addAction:", v12, v17, v18, v19, v20, v21);
    [v14 addAction:v15];
    [v14 setPreferredAction:v12];
    v16 = MBPrebuddyAlertIcon();
    [v14 setImage:v16];

    [(MBPrebuddyGettingStartedViewController *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (id)_iconOfSystemImageName:(id)a3 glyphScale:(double)a4 nudge:(CGPoint)a5 colored:(id)a6 backgroundGradientStart:(id)a7 backgroundGradientEnd:(id)a8 sized:(double)a9
{
  double y = a5.y;
  double x = a5.x;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  v36.width = a9;
  v36.height = a9;
  UIGraphicsBeginImageContextWithOptions(v36, 0, 1.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v37.origin.double x = 0.0;
  v37.origin.double y = 0.0;
  v37.size.width = a9;
  v37.size.height = a9;
  CGRect v38 = CGRectInset(v37, 1.0, 1.0);
  CGContextAddEllipseInRect(CurrentContext, v38);
  CGContextClip(CurrentContext);
  id v22 = +[CAGradientLayer layer];
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, a9, a9);
  id v23 = v18;
  id v24 = [v23 CGColor];

  v34[0] = v24;
  id v25 = v17;
  id v26 = [v25 CGColor];

  v34[1] = v26;
  v27 = +[NSArray arrayWithObjects:v34 count:2];
  [v22 setColors:v27];

  [v22 renderInContext:CurrentContext];
  v28 = +[UIImage systemImageNamed:v20];

  v29 = [v28 imageWithTintColor:v19];

  [v29 size];
  -[MBPrebuddyGettingStartedViewController _normalizeSize:to:scale:](self, "_normalizeSize:to:scale:");
  objc_msgSend(v29, "drawInRect:", (a9 - v30) * 0.5 + x * a4, (a9 - v31) * 0.5 + y * a4, v30);
  v32 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v32;
}

- (CGSize)_normalizeSize:(CGSize)a3 to:(CGSize)a4 scale:(double)a5
{
  double v5 = fmin(a4.width, a4.height) * a5 / fmax(a3.width, a3.height);
  double v6 = a3.width * v5;
  double v7 = a3.height * v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_signInAccountIfNeeded:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_needsAccountSignIn && !self->_didSignIn)
  {
    double v6 = (AAUISignInController *)objc_alloc_init((Class)AAUISignInController);
    signInController = self->_signInController;
    self->_signInController = v6;

    [(AAUISignInController *)self->_signInController setDelegate:self];
    [(AAUISignInController *)self->_signInController _setShouldForceOperation:1];
    v8 = self->_signInController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009558;
    v9[3] = &unk_10001C648;
    v9[4] = self;
    id v10 = v5;
    [(AAUISignInController *)v8 prepareInViewController:self completion:v9];
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (void)_checkEligibilityAndUpgradeHSA2IfNeeded:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009774;
  v4[3] = &unk_10001C900;
  double v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MBPrebuddyGettingStartedViewController *)v5 _checkEligibility:v4];
}

- (void)_upgradeHSA2IfNeeded:(id)a3
{
  id v4 = a3;
  altDSIDForHSA2Upgrade = self->_altDSIDForHSA2Upgrade;
  if (altDSIDForHSA2Upgrade && !self->_didHSA2Upgrade)
  {
    if ([(NSString *)altDSIDForHSA2Upgrade length])
    {
      id v6 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext) initWithAltDSID:self->_altDSIDForHSA2Upgrade];
      [v6 setPresentingViewController:self];
      [v6 setDeviceToDeviceEncryptionUpgradeUIStyle:1];
      id v7 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v6];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000099DC;
      v11[3] = &unk_10001C928;
      v11[4] = self;
      id v12 = v4;
      [v7 performDeviceToDeviceEncryptionStateRepairWithCompletion:v11];
    }
    else
    {
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Have an empty alt DSID, so cannot do HSA2 upgrade.", buf, 2u);
        _MBLog();
      }

      (*((void (**)(id, void))v4 + 2))(v4, 0);
      v9 = [(MBPrebuddyGettingStartedViewController *)self navigationController];
      id v10 = [v9 view];
      [v10 setUserInteractionEnabled:0];

      id v6 = [(MBPrebuddyGettingStartedViewController *)self flow];
      objc_msgSend(v6, "mb_didTapCancelFromViewController:", self);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (void)_checkEligibility:(id)a3
{
  id v4 = a3;
  [(MBPrebuddyGettingStartedViewController *)self _showLoadingStatusView];
  id v5 = objc_alloc_init((Class)MBManager);
  char v6 = [v5 isBackupEnabled] ^ 1;
  id v7 = [v5 backupDeviceUUID];
  v8 = objc_alloc_init(MBMegaBackupEligibilityManager);
  int64_t entryPoint = self->_entryPoint;
  deepLinkURL = self->_deepLinkURL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009C0C;
  v12[3] = &unk_10001C950;
  char v14 = v6;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(MBMegaBackupEligibilityManager *)v8 checkMegaBackupEligibility:entryPoint deepLinkURL:deepLinkURL backupDeviceUUID:v7 queue:&_dispatch_main_q completion:v12];
}

- (void)_presentError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = MBLocalizedStringFromTable();
  v9 = MBLocalizedStringFromTable();
  id v10 = MBLocalizedStringFromTable();
  id v11 = [v6 domain];
  uint64_t v12 = _ICQMegaBackupErrorDomain;
  if ([v11 isEqualToString:_ICQMegaBackupErrorDomain])
  {
    id v13 = [v6 code];

    if (v13 == (id)5)
    {
      int v14 = MGGetBoolAnswer();
      CFStringRef v15 = @"WIFI";
      if (v14) {
        CFStringRef v15 = @"WLAN";
      }
      v16 = +[NSString stringWithFormat:@"MB_PREBUDDY_NETWORK_%@_ERROR_TITLE", v15];
      uint64_t v17 = MBLocalizedStringFromTable();

      char v18 = 0;
      id v19 = v9;
      v8 = (void *)v17;
      v9 = 0;
      goto LABEL_26;
    }
  }
  else
  {
  }
  id v20 = [v6 domain];
  if ([v20 isEqualToString:v12])
  {
    id v21 = [v6 code];

    if (v21 == (id)6)
    {
LABEL_24:
      uint64_t v24 = MBLocalizedStringFromTable();

      uint64_t v25 = MBLocalizedStringFromTable();

      uint64_t v26 = MBLocalizedStringFromTable();
      char v18 = 0;
      id v19 = v10;
      goto LABEL_25;
    }
  }
  else
  {
  }
  id v22 = [v6 domain];
  if ([v22 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
  {
    id v23 = [v6 code];

    if (v23 == (id)6)
    {
      uint64_t v24 = MBLocalizedStringFromTable();

      uint64_t v25 = MBLocalizedStringFromTable();

      uint64_t v26 = MBLocalizedStringFromTable();
      id v19 = v10;
      char v18 = 1;
LABEL_25:
      id v10 = (void *)v26;
      v9 = (void *)v25;
      v8 = (void *)v24;
      goto LABEL_26;
    }
  }
  else
  {
  }
  v27 = [v6 domain];
  if ([v27 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
  {
    id v28 = [v6 code];

    if (v28 == (id)2) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  id v19 = [v6 domain];
  if ([v19 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
  {
    if ([v6 code] == (id)3)
    {
    }
    else
    {
      id v29 = [v6 code];

      if (v29 != (id)4)
      {
        char v18 = 0;
        goto LABEL_27;
      }
    }
    goto LABEL_24;
  }
  char v18 = 0;
LABEL_26:

LABEL_27:
  double v30 = +[UIAlertController alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  double v31 = MBPrebuddyAlertIcon();
  [v30 setImage:v31];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  void v34[2] = sub_10000A510;
  v34[3] = &unk_10001C978;
  char v36 = v18;
  id v35 = v7;
  id v32 = v7;
  v33 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v34];
  [v30 addAction:v33];
  [(MBPrebuddyGettingStartedViewController *)self presentViewController:v30 animated:1 completion:0];
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  v8 = (__CFString *)a5;
  id v9 = a3;
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = +[NSNumber numberWithBool:v5];
    uint64_t v12 = (void *)v11;
    if (v8) {
      CFStringRef v13 = v8;
    }
    else {
      CFStringRef v13 = @"nil error";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    CFStringRef v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "signInController:didCompleteWithSuccess:error: %@ %@", buf, 0x16u);

    int v14 = +[NSNumber numberWithBool:v5];
    _MBLog();
  }
  [v9 dismissViewControllerAnimated:1 completion:0];

  if (v5)
  {
    self->_didSignIn = 1;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A72C;
    v15[3] = &unk_10001C6E8;
    v15[4] = self;
    [(MBPrebuddyGettingStartedViewController *)self _checkEligibilityAndUpgradeHSA2IfNeeded:v15];
  }
}

- (void)signInControllerDidCancel:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "signInControllerDidCancel:", v5, 2u);
    _MBLog();
  }

  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (MBViewControllerFlow)flow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  return (MBViewControllerFlow *)WeakRetained;
}

- (int64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (void)setEligibilityStatus:(int64_t)a3
{
  self->_eligibilityStatus = a3;
}

- (BOOL)needsTemporaryStorage
{
  return self->_needsTemporaryStorage;
}

- (void)setNeedsTemporaryStorage:(BOOL)a3
{
  self->_needsTemporaryStorage = a3;
}

- (int64_t)daysUntilExpiration
{
  return self->_daysUntilExpiration;
}

- (void)setDaysUntilExpiration:(int64_t)a3
{
  self->_daysUntilExpiration = a3;
}

- (NSError)eligibilityError
{
  return self->_eligibilityError;
}

- (void)setEligibilityError:(id)a3
{
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_int64_t entryPoint = a3;
}

- (NSString)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void)setDeepLinkURL:(id)a3
{
}

- (BOOL)needsAccountSignIn
{
  return self->_needsAccountSignIn;
}

- (void)setNeedsAccountSignIn:(BOOL)a3
{
  self->_needsAccountSignIn = a3;
}

- (BOOL)didSignIn
{
  return self->_didSignIn;
}

- (void)setDidSignIn:(BOOL)a3
{
  self->_didSignIn = a3;
}

- (AAUISignInController)signInController
{
  return self->_signInController;
}

- (void)setSignInController:(id)a3
{
}

- (NSString)altDSIDForHSA2Upgrade
{
  return self->_altDSIDForHSA2Upgrade;
}

- (void)setAltDSIDForHSA2Upgrade:(id)a3
{
}

- (BOOL)didHSA2Upgrade
{
  return self->_didHSA2Upgrade;
}

- (void)setDidHSA2Upgrade:(BOOL)a3
{
  self->_didHSA2Upgrade = a3;
}

- (MBLoadingStatusView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
}

- (BOOL)needsBackupEnabled
{
  return self->_needsBackupEnabled;
}

- (void)setNeedsBackupEnabled:(BOOL)a3
{
  self->_needsBackupEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_altDSIDForHSA2Upgrade, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_eligibilityError, 0);
  objc_destroyWeak((id *)&self->_flow);
}

@end