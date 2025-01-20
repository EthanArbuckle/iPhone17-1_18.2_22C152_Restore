@interface PKManagePaymentPassNotificationsViewController
+ (BOOL)canShowForPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7;
- (PKManagePaymentPassNotificationsViewController)initWithPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7 transactionSourceCollection:(id)a8;
- (void)didSelectEditNotificationSettings:(id)a3;
- (void)recomputeMappedSectionsAndReloadSections:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKManagePaymentPassNotificationsViewController

+ (BOOL)canShowForPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v11 passType] == 1)
  {
    id v16 = v11;
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v16];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v17];
    BOOL v19 = [v16 activationState] != 2
       && +[PKPaymentPassDetailsNotificationSettingsSectionController canShowSectionforPass:v16 dataProvider:v12 peerPaymentAccount:v13 bankConnectAccount:v14 account:v15 transactionSourceCollection:v18];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKManagePaymentPassNotificationsViewController;
  [(PKDynamicTableViewController *)&v4 viewDidLoad];
  v3 = [(PKManagePaymentPassNotificationsViewController *)self view];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85728]];
}

- (PKManagePaymentPassNotificationsViewController)initWithPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7 transactionSourceCollection:(id)a8
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PKManagePaymentPassNotificationsViewController;
  v21 = -[PKDynamicTableViewController initWithStyle:](&v29, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_pass, a3);
    objc_storeStrong((id *)&v22->_defaultDataProvider, a4);
    v23 = [[PKPaymentPassDetailsNotificationSettingsSectionController alloc] initWithPass:v22->_pass peerPaymentAccount:v17 bankConnectAccount:v18 account:v19 paymentDataProvider:v22->_defaultDataProvider transactionSourceCollection:v20 detailViewStyle:0 delegate:v22];
    notificationsSectionController = v22->_notificationsSectionController;
    v22->_notificationsSectionController = v23;

    v30[0] = v22->_notificationsSectionController;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [(PKDynamicTableViewController *)v22 setSectionControllers:v25];

    v26 = [(PKManagePaymentPassNotificationsViewController *)v22 navigationItem];
    v27 = PKLocalizedString(&cfstr_SettingsManage.isa, 0);
    [v26 setTitle:v27];
  }
  return v22;
}

- (void)didSelectEditNotificationSettings:(id)a3
{
  if ([a3 notificationAuthorizationStatus] == 1)
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    objc_super v4 = [NSString stringWithFormat:@"prefs:root=NOTIFICATIONS_ID&path=%@", *MEMORY[0x1E4F87D30]];
    id v6 = [v3 URLWithString:v4];

    v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 openSensitiveURL:v6 withOptions:0];
  }
}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3
{
  notificationsSectionController = self->_notificationsSectionController;
  id v5 = a3;
  id v6 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)notificationsSectionController allSectionIdentifiers];
  v7.receiver = self;
  v7.super_class = (Class)PKManagePaymentPassNotificationsViewController;
  [(PKDynamicTableViewController *)&v7 recomputeMappedSectionsAndReloadSections:v5 sectionIdentifiers:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDataProvider, 0);
  objc_storeStrong((id *)&self->_notificationsSectionController, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end