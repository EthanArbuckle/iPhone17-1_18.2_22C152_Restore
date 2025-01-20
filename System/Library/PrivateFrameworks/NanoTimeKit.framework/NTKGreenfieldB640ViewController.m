@interface NTKGreenfieldB640ViewController
- (NTKGreenfieldB640ViewController)initWithUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4;
- (NTKGreenfieldB640ViewControllerDelegate)delegate;
- (void)_didTapCancelButton;
- (void)didFinishAddingWatchFaceToLibrary:(id)a3;
- (void)didStartDecodingWatchFaces:(id)a3;
- (void)greenfieldB640ContentViewController:(id)a3 handleButtonActionEvent:(int64_t)a4;
- (void)greenfieldB640ContentViewController:(id)a3 handleWatchFaceSelectedEventAtIndex:(int64_t)a4;
- (void)greenfieldB640WatchFacesManager:(id)a3 didSelectWatchFaceAtIndex:(int64_t)a4;
- (void)greenfieldB640WatchFacesManager:(id)a3 didSelectWatchFaceWithError:(id)a4;
- (void)greenfieldB640WatchFacesManager:(id)a3 updateStateToError:(id)a4;
- (void)greenfieldB640WatchFacesManager:(id)a3 updateStateToSelectWatchFacesState:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation NTKGreenfieldB640ViewController

- (NTKGreenfieldB640ViewController)initWithUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKGreenfieldB640ViewController;
  v9 = [(NTKGreenfieldB640ViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_sourceApplicationBundleIdentifier, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)NTKGreenfieldB640ViewController;
  [(NTKGreenfieldB640ViewController *)&v20 viewDidLoad];
  v3 = [(NTKGreenfieldB640ViewController *)self navigationController];
  [v3 setModalInPresentation:1];

  v4 = objc_opt_new();
  [v4 configureWithTransparentBackground];
  v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
  [v4 setBackgroundEffect:v5];

  v6 = [(NTKGreenfieldB640ViewController *)self navigationController];
  id v7 = [v6 navigationBar];
  [v7 setStandardAppearance:v4];

  id v8 = BPSBackgroundColor();
  v9 = [(NTKGreenfieldB640ViewController *)self view];
  [v9 setBackgroundColor:v8];

  v10 = objc_alloc_init(NTKGreenfieldCompanionLoadingViewController);
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = v10;

  objc_super v12 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_loadingViewController];
  hiddenNavigationController = self->_hiddenNavigationController;
  self->_hiddenNavigationController = v12;

  [(UINavigationController *)self->_hiddenNavigationController setNavigationBarHidden:1 animated:0];
  [(NTKGreenfieldB640ViewController *)self addChildViewController:self->_hiddenNavigationController];
  v14 = [(NTKGreenfieldB640ViewController *)self view];
  v15 = [(UINavigationController *)self->_hiddenNavigationController view];
  [v14 addSubview:v15];

  [(UINavigationController *)self->_hiddenNavigationController didMoveToParentViewController:self];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__didTapCancelButton];
  v17 = [(NTKGreenfieldB640ViewController *)self navigationItem];
  [v17 setLeftBarButtonItem:v16 animated:0];

  v18 = objc_alloc_init(NTKGreenfieldB640Manager);
  b640Manager = self->_b640Manager;
  self->_b640Manager = v18;

  [(NTKGreenfieldB640Manager *)self->_b640Manager setDelegate:self];
  [(NTKGreenfieldB640Manager *)self->_b640Manager decodeUrl:self->_url sourceApplicationBundleIdentifier:self->_sourceApplicationBundleIdentifier];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldB640ViewController;
  [(NTKGreenfieldB640ViewController *)&v6 viewDidDisappear:a3];
  v4 = [(NTKGreenfieldB640Manager *)self->_b640Manager addedFaceID];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"NTKGreenfieldAddWatchFaceManagerDidAddFaceNotification" object:v4];
  }
  [(NTKGreenfieldB640Manager *)self->_b640Manager handleDidExitGreenfieldB640Flow];
}

- (void)_didTapCancelButton
{
}

- (void)greenfieldB640ContentViewController:(id)a3 handleButtonActionEvent:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v8 = v6;
LABEL_7:
    [(NTKGreenfieldB640ViewController *)self dismissViewControllerAnimated:1 completion:0];
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    id v8 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didTapOnLoadingFaceLibraryButton:self];

    goto LABEL_7;
  }
  if (a4) {
    goto LABEL_9;
  }
  id v8 = v6;
  [(NTKGreenfieldB640Manager *)self->_b640Manager handleAddToMyFacesAction];
LABEL_8:
  id v6 = v8;
LABEL_9:
}

- (void)greenfieldB640ContentViewController:(id)a3 handleWatchFaceSelectedEventAtIndex:(int64_t)a4
{
}

- (void)didStartDecodingWatchFaces:(id)a3
{
  id v3 = [(UINavigationController *)self->_hiddenNavigationController popToRootViewControllerAnimated:1];
}

- (void)greenfieldB640WatchFacesManager:(id)a3 updateStateToSelectWatchFacesState:(id)a4
{
  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    id v6 = a4;
    id v7 = [[NTKGreenfieldB640ContentViewController alloc] initForAddWatchFacesStateWithGreenfieldB640Model:v6];

    id v8 = self->_contentViewController;
    self->_contentViewController = v7;

    [(NTKGreenfieldB640ContentViewController *)self->_contentViewController setGreenfieldB640delegate:self];
    contentViewController = self->_contentViewController;
  }
  hiddenNavigationController = self->_hiddenNavigationController;
  [(UINavigationController *)hiddenNavigationController pushViewController:contentViewController animated:0];
}

- (void)didFinishAddingWatchFaceToLibrary:(id)a3
{
}

- (void)greenfieldB640WatchFacesManager:(id)a3 updateStateToError:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 error];

  if (v6)
  {
    id v7 = [[NTKGreenfieldB640ContentViewController alloc] initForErrorStateWithGreenfieldB640Model:v5];
    [v7 setGreenfieldB640delegate:self];
    hiddenNavigationController = self->_hiddenNavigationController;
    v10[0] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UINavigationController *)hiddenNavigationController setViewControllers:v9 animated:0];
  }
  else
  {
    [(NTKGreenfieldB640ViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)greenfieldB640WatchFacesManager:(id)a3 didSelectWatchFaceAtIndex:(int64_t)a4
{
}

- (void)greenfieldB640WatchFacesManager:(id)a3 didSelectWatchFaceWithError:(id)a4
{
}

- (NTKGreenfieldB640ViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKGreenfieldB640ViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_b640Manager, 0);
  objc_storeStrong((id *)&self->_hiddenNavigationController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
}

@end