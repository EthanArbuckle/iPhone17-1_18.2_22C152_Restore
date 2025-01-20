@interface PKDashboardTileContextViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKDashboardTileContextViewController)initWithTileContext:(int64_t)a3 forPass:(id)a4 passView:(id)a5 tileGroupID:(id)a6 overridesMaximumRows:(BOOL)a7;
- (void)viewDidLoad;
@end

@implementation PKDashboardTileContextViewController

- (PKDashboardTileContextViewController)initWithTileContext:(int64_t)a3 forPass:(id)a4 passView:(id)a5 tileGroupID:(id)a6 overridesMaximumRows:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  v16 = objc_alloc_init(PKDashboardPassTilesItemPresenter);
  v17 = [[PKDashboardSectionDataSourceTileContext alloc] initWithTileContext:a3 forPass:v13 passView:v15 tileGroupID:v14 overridesMaximumRows:v7];

  objc_storeStrong((id *)&self->_tileContextDataSource, v17);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v16, 0);
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v17, 0);
  if (a3 == 2)
  {
    v20 = [[PKDashboardPassLinkedAppItemPresenter alloc] initWithDelegate:self];
    [v18 addObject:v20];

    v21 = [PKDashboardSectionDataSourceLinkedApp alloc];
    v22 = [v13 auxiliaryStoreIdentifiers];
    v23 = [(PKDashboardSectionDataSourceLinkedApp *)v21 initWithStoreIDs:v22 applicationBundleIdentifiers:0 defaultLaunchURL:0];
    [v19 addObject:v23];
  }
  v24 = [[PKSectionedDashboardDataSourceTileContext alloc] initWithSectionDataSources:v19];
  v28.receiver = self;
  v28.super_class = (Class)PKDashboardTileContextViewController;
  v25 = [(PKDashboardViewController *)&v28 initWithDataSource:v24 presenters:v18 layout:0];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_pass, a4);
    v26->_context = a3;
  }

  return v26;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardTileContextViewController;
  [(PKDashboardViewController *)&v10 viewDidLoad];
  v3 = [(PKDashboardTileContextViewController *)self view];
  v4 = +[PKDashboardViewController backgroundColor];
  [v3 setBackgroundColor:v4];

  int64_t context = self->_context;
  if (context == 3)
  {
    v9 = PKLocalizedTicketingString(&cfstr_AdditionalTick.isa);
    if (v9)
    {
LABEL_9:
      [(PKDashboardTileContextViewController *)self setTitle:v9];
    }
  }
  else if (context == 2)
  {
    v6 = [(PKPass *)self->_pass eventName];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      PKLocalizedTicketingString(&cfstr_EventGuideFall.isa);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    if (v9) {
      goto LABEL_9;
    }
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  v2 = [(PKPass *)self->_pass nfcPayload];
  char v3 = [v2 requiresAuthentication] ^ 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileContextDataSource, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end