@interface NTKGreenfieldViewController
- (NSURL)faceURL;
- (NTKGreenfieldAddWatchFaceManager)addWatchFaceManager;
- (NTKGreenfieldCompanionLoadingViewController)loadingViewController;
- (NTKGreenfieldViewController)initWithUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4;
- (UINavigationController)hiddenNavigationController;
- (void)_didTapCancelButton;
- (void)_toggleCancelButton:(BOOL)a3;
- (void)_toggleRightCounterLabel:(BOOL)a3;
- (void)addWatchFaceManager:(id)a3 didFinishAddingFaceWithError:(id)a4;
- (void)addWatchFaceManager:(id)a3 updateStateToAddComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6;
- (void)addWatchFaceManager:(id)a3 updateStateToCompletedWithSkippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5;
- (void)addWatchFaceManager:(id)a3 updateStateToComplicationsNotAvailableWithSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6;
- (void)addWatchFaceManager:(id)a3 updateStateToRevisitComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6;
- (void)addWatchFaceManager:(id)a3 updateStateToWelcomeWithCanAddFaceDirectly:(BOOL)a4;
- (void)companionContentViewController:(id)a3 didStartInstallingAppWithItemId:(id)a4;
- (void)companionContentViewController:(id)a3 handleButtonEvent:(int64_t)a4;
- (void)didStartLoadingInAddWatchFaceManager:(id)a3;
- (void)setAddWatchFaceManager:(id)a3;
- (void)setFaceURL:(id)a3;
- (void)setHiddenNavigationController:(id)a3;
- (void)setLoadingViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NTKGreenfieldViewController

- (NTKGreenfieldViewController)initWithUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKGreenfieldViewController;
  v9 = [(NTKGreenfieldViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceURL, a3);
    objc_storeStrong((id *)&v10->_sourceApplicationBundleIdentifier, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)NTKGreenfieldViewController;
  [(NTKGreenfieldViewController *)&v24 viewDidLoad];
  v3 = [(NTKGreenfieldViewController *)self navigationController];
  [v3 setModalInPresentation:1];

  v4 = objc_opt_new();
  [v4 configureWithTransparentBackground];
  v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
  [v4 setBackgroundEffect:v5];

  v6 = [(NTKGreenfieldViewController *)self navigationController];
  id v7 = [v6 navigationBar];
  [v7 setStandardAppearance:v4];

  id v8 = BPSBackgroundColor();
  v9 = [(NTKGreenfieldViewController *)self view];
  [v9 setBackgroundColor:v8];

  v10 = objc_alloc_init(NTKGreenfieldCompanionLoadingViewController);
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = v10;

  objc_super v12 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_loadingViewController];
  hiddenNavigationController = self->_hiddenNavigationController;
  self->_hiddenNavigationController = v12;

  [(NTKGreenfieldViewController *)self addChildViewController:self->_hiddenNavigationController];
  v14 = [(NTKGreenfieldViewController *)self view];
  v15 = [(UINavigationController *)self->_hiddenNavigationController view];
  [v14 addSubview:v15];

  [(UINavigationController *)self->_hiddenNavigationController didMoveToParentViewController:self];
  [(UINavigationController *)self->_hiddenNavigationController setNavigationBarHidden:1 animated:0];
  v16 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
  [(NTKGreenfieldViewController *)self setAddWatchFaceManager:v16];

  v17 = [(NTKGreenfieldViewController *)self addWatchFaceManager];
  [v17 setDelegate:self];

  [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodeWatchFaceWithURL:self->_faceURL sourceApplicationBundleIdentifier:self->_sourceApplicationBundleIdentifier];
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  complicationsCounterLabel = self->_complicationsCounterLabel;
  self->_complicationsCounterLabel = v18;

  v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [(UILabel *)self->_complicationsCounterLabel setFont:v20];

  v21 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [(UILabel *)self->_complicationsCounterLabel setTextColor:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_complicationsCounterLabel];
  v23 = [(NTKGreenfieldViewController *)self navigationItem];
  [v23 setRightBarButtonItem:v22];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldViewController;
  [(NTKGreenfieldViewController *)&v6 viewDidDisappear:a3];
  v4 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager addedFaceID];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"NTKGreenfieldAddWatchFaceManagerDidAddFaceNotification" object:v4];
  }
  [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleDidExitAddWatchFaceFlow];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKGreenfieldViewController;
  [(NTKGreenfieldViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(UINavigationController *)self->_hiddenNavigationController view];
  v4 = [(NTKGreenfieldViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)_didTapCancelButton
{
}

- (void)_toggleRightCounterLabel:(BOOL)a3
{
  if (a3)
  {
    int64_t v5 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager viewedNonInstalledAppCount];
    int64_t v6 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager totalNonInstalledAppCount];
    id v7 = NSString;
    id v8 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_APPS_COUNTER", @"%lu of %lu");
    v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v5, v6);

    [(UILabel *)self->_complicationsCounterLabel setText:v9];
    [(UILabel *)self->_complicationsCounterLabel sizeToFit];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__NTKGreenfieldViewController__toggleRightCounterLabel___block_invoke;
  v10[3] = &unk_1E62C1BF0;
  v10[4] = self;
  BOOL v11 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v10 options:0 animations:0.2 completion:0.0];
}

uint64_t __56__NTKGreenfieldViewController__toggleRightCounterLabel___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 984) setAlpha:v1];
}

- (void)_toggleCancelButton:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(NTKGreenfieldViewController *)self navigationItem];
  id v8 = v5;
  if (v3)
  {
    int64_t v6 = [v5 leftBarButtonItem];

    if (v6) {
      return;
    }
    id v8 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__didTapCancelButton];
    id v7 = [(NTKGreenfieldViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v8 animated:1];
  }
  else
  {
    [v5 setLeftBarButtonItem:0 animated:1];
  }
}

- (void)companionContentViewController:(id)a3 didStartInstallingAppWithItemId:(id)a4
{
}

- (void)companionContentViewController:(id)a3 handleButtonEvent:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 0:
      [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleAddToMyFacesAction];
      goto LABEL_8;
    case 1:
      [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleContinueAction];
      goto LABEL_8;
    case 2:
      [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleDoneAction];
      goto LABEL_8;
    case 3:
      [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleRevisitSkippedComplicationsAction];
      goto LABEL_8;
    case 4:
      [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager handleSkipComplicationAction];
      goto LABEL_8;
    case 5:
      [(NTKGreenfieldViewController *)self dismissViewControllerAnimated:1 completion:0];
LABEL_8:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (void)didStartLoadingInAddWatchFaceManager:(id)a3
{
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:0];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:1];
  id v4 = [(UINavigationController *)self->_hiddenNavigationController popToRootViewControllerAnimated:1];
}

- (void)addWatchFaceManager:(id)a3 updateStateToWelcomeWithCanAddFaceDirectly:(BOOL)a4
{
  BOOL v4 = a4;
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:0];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:1];
  id v8 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager addFaceDescription];
  id v6 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodedRecipe];
  id v7 = [[NTKGreenfieldCompanionContentViewController alloc] initStartStateWithDecodedRecipe:v6 canAddFaceDirectly:v4 addFaceDescription:v8];
  [v7 setGreenfieldDelegate:self];
  [(UINavigationController *)self->_hiddenNavigationController pushViewController:v7 animated:0];
}

- (void)addWatchFaceManager:(id)a3 updateStateToComplicationsNotAvailableWithSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:0];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:1];
  id v13 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodedRecipe];
  id v12 = [[NTKGreenfieldCompanionContentViewController alloc] initComplicationNotAvailableStateWithDecodedRecipe:v13 unavailableSlots:v11 unavailableTitle:v10 unavailableDescription:v9];

  [v12 setGreenfieldDelegate:self];
  [(UINavigationController *)self->_hiddenNavigationController pushViewController:v12 animated:1];
}

- (void)addWatchFaceManager:(id)a3 updateStateToAddComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:1];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:1];
  id v12 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodedRecipe];
  id v11 = [[NTKGreenfieldCompanionContentViewController alloc] initAddComplicationStateWithDecodedRecipe:v12 complicationItemId:v10 installMode:a5 skippedComplicationSlots:v9];

  [v11 setGreenfieldDelegate:self];
  [(UINavigationController *)self->_hiddenNavigationController pushViewController:v11 animated:1];
}

- (void)addWatchFaceManager:(id)a3 updateStateToRevisitComplicationWithItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a4;
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:1];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:1];
  id v11 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodedRecipe];
  id v12 = [[NTKGreenfieldCompanionContentViewController alloc] initAddComplicationStateWithDecodedRecipe:v11 complicationItemId:v10 installMode:a5 skippedComplicationSlots:v9];

  [v12 setGreenfieldDelegate:self];
  id v13 = [(UINavigationController *)self->_hiddenNavigationController topViewController];
  hiddenNavigationController = self->_hiddenNavigationController;
  v17[0] = v12;
  v17[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [(UINavigationController *)hiddenNavigationController setViewControllers:v15 animated:0];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __131__NTKGreenfieldViewController_addWatchFaceManager_updateStateToRevisitComplicationWithItemId_installMode_skippedComplicationSlots___block_invoke;
  v16[3] = &unk_1E62BFF20;
  v16[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

id __131__NTKGreenfieldViewController_addWatchFaceManager_updateStateToRevisitComplicationWithItemId_installMode_skippedComplicationSlots___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 1016) popToRootViewControllerAnimated:1];
}

- (void)addWatchFaceManager:(id)a3 updateStateToCompletedWithSkippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:0];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:0];
  id v9 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodedRecipe];
  id v8 = [[NTKGreenfieldCompanionContentViewController alloc] initCompletedStateWithDecodedRecipe:v9 skippedComplicationSlots:v7 canRevisit:v5];

  [v8 setGreenfieldDelegate:self];
  [(UINavigationController *)self->_hiddenNavigationController pushViewController:v8 animated:1];
}

- (void)addWatchFaceManager:(id)a3 didFinishAddingFaceWithError:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NTKGreenfieldViewController *)self _toggleRightCounterLabel:0];
  [(NTKGreenfieldViewController *)self _toggleCancelButton:1];
  if (v5)
  {
    id v6 = [(NTKGreenfieldAddWatchFaceManager *)self->_addWatchFaceManager decodedRecipe];
    id v7 = [[NTKGreenfieldCompanionContentViewController alloc] initWithError:v5 decodedRecipe:v6];
    [(NTKGreenfieldCompanionContentViewController *)v7 setGreenfieldDelegate:self];
    hiddenNavigationController = self->_hiddenNavigationController;
    v10[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UINavigationController *)hiddenNavigationController setViewControllers:v9 animated:0];
  }
  else
  {
    [(NTKGreenfieldViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (NSURL)faceURL
{
  return self->_faceURL;
}

- (void)setFaceURL:(id)a3
{
}

- (NTKGreenfieldAddWatchFaceManager)addWatchFaceManager
{
  return self->_addWatchFaceManager;
}

- (void)setAddWatchFaceManager:(id)a3
{
}

- (UINavigationController)hiddenNavigationController
{
  return self->_hiddenNavigationController;
}

- (void)setHiddenNavigationController:(id)a3
{
}

- (NTKGreenfieldCompanionLoadingViewController)loadingViewController
{
  return self->_loadingViewController;
}

- (void)setLoadingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_hiddenNavigationController, 0);
  objc_storeStrong((id *)&self->_addWatchFaceManager, 0);
  objc_storeStrong((id *)&self->_faceURL, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_complicationsCounterLabel, 0);
}

@end