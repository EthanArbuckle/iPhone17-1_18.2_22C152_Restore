@interface MBPrebuddyStartTransferViewController
+ (id)_backupToCloudImage;
- (MBPrebuddyStartTransferViewController)initWithFlow:(id)a3 needsTemporaryStorage:(BOOL)a4 daysUntilExpiration:(int64_t)a5;
- (MBViewControllerFlow)flow;
- (int64_t)mb_step;
- (void)_setUp;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation MBPrebuddyStartTransferViewController

+ (id)_backupToCloudImage
{
  v3 = +[MBPrebuddyManager backupToCloudImageName];
  v4 = +[NSBundle bundleForClass:a1];
  v5 = +[UIImage imageNamed:v3 inBundle:v4];
  v6 = [v5 imageWithRenderingMode:2];

  return v6;
}

- (MBPrebuddyStartTransferViewController)initWithFlow:(id)a3 needsTemporaryStorage:(BOOL)a4 daysUntilExpiration:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSDateComponentsFormatter);
  [v9 setUnitsStyle:3];
  [v9 setAllowedUnits:16];
  [v9 setMaximumUnitCount:1];
  [v9 setFormattingContext:5];
  id v10 = objc_alloc_init((Class)NSDateComponents);
  [v10 setDay:a5];
  v11 = [v9 stringFromDateComponents:v10];
  int v12 = MGGetBoolAnswer();
  v13 = @"WIFI";
  if (v12) {
    v13 = @"WLAN";
  }
  v14 = v13;
  if (v6)
  {
    v15 = +[NSString stringWithFormat:@"MB_PREBUDDY_START_TRANSFER_OFFER_DETAIL_%@", v14];
    MBLocalizedStringWithSubstitutionsFromTable();
  }
  else
  {
    v15 = +[NSString stringWithFormat:@"MB_PREBUDDY_START_TRANSFER_DETAIL_%@", v14];
    MBLocalizedStringFromTable();
  v16 = };

  v17 = MBLocalizedStringFromTable();
  v18 = [(id)objc_opt_class() _backupToCloudImage];
  v21.receiver = self;
  v21.super_class = (Class)MBPrebuddyStartTransferViewController;
  v19 = [(MBPrebuddyStartTransferViewController *)&v21 initWithTitle:v17 detailText:v16 icon:v18];

  if (v19) {
    objc_storeWeak((id *)&v19->_flow, v8);
  }

  return v19;
}

- (int64_t)mb_step
{
  return 2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MBPrebuddyStartTransferViewController;
  [(MBPrebuddyStartTransferViewController *)&v3 viewDidLoad];
  [(MBPrebuddyStartTransferViewController *)self _setUp];
}

- (void)_setUp
{
  id v13 = +[OBBoldTrayButton boldButton];
  objc_super v3 = MBLocalizedStringFromTable();
  [v13 setTitle:v3 forState:0];

  [v13 addTarget:self action:"didTapPrimaryButton:" forEvents:0x2000];
  v4 = [v13 titleLabel];
  LODWORD(v5) = 1036831949;
  [v4 _setHyphenationFactor:v5];

  BOOL v6 = [(MBPrebuddyStartTransferViewController *)self buttonTray];
  [v6 addButton:v13];

  v7 = +[OBLinkTrayButton linkButton];
  id v8 = MBLocalizedStringFromTable();
  [v7 setTitle:v8 forState:0];

  [v7 addTarget:self action:"didTapSecondaryButton:" forEvents:0x2000];
  id v9 = [v7 titleLabel];
  LODWORD(v10) = 1036831949;
  [v9 _setHyphenationFactor:v10];

  v11 = [(MBPrebuddyStartTransferViewController *)self buttonTray];
  [v11 addButton:v7];

  int v12 = [(MBPrebuddyStartTransferViewController *)self navigationItem];
  [v12 _setBackgroundHidden:1];
}

- (void)didTapPrimaryButton:(id)a3
{
  id v5 = objc_alloc_init((Class)MBManager);
  if (([v5 isBackupEnabled] & 1) == 0)
  {
    [v5 setBackupEnabled:1];
    [v5 saveBackupEnabledForMegaBackup];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  objc_msgSend(WeakRetained, "mb_didTapNextFromViewController:", self);
}

- (void)didTapSecondaryButton:(id)a3
{
  v4 = [(MBPrebuddyStartTransferViewController *)self navigationController];
  id v5 = [v4 view];
  [v5 setUserInteractionEnabled:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  objc_msgSend(WeakRetained, "mb_didTapCancelFromViewController:", self);
}

- (MBViewControllerFlow)flow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  return (MBViewControllerFlow *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end