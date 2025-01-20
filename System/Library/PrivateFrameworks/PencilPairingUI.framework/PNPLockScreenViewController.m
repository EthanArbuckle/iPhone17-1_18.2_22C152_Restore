@interface PNPLockScreenViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSize;
- (PNPDeviceState)deviceState;
- (PNPDeviceStateConfigurable)pillView;
- (PNPLockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PNPPlatterViewControllerPlatterDelegate)platterDelegate;
- (PNPViewControllerAppearanceDelegate)appearanceDelegate;
- (unint64_t)preferredEdge;
- (void)dismissPill;
- (void)loadView;
- (void)setAppearanceDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setPillView:(id)a3;
- (void)setPlatterDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PNPLockScreenViewController

- (PNPLockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PNPLockScreenViewController;
  v4 = [(PNPLockScreenViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = objc_opt_new();
  [(PNPLockScreenViewController *)v4 setDeviceState:v5];

  v6 = objc_alloc_init(PNPPlatterTransitioningDelegate);
  platterTransitioningDelegate = v4->_platterTransitioningDelegate;
  v4->_platterTransitioningDelegate = v6;

  [(PNPLockScreenViewController *)v4 setTransitioningDelegate:v4->_platterTransitioningDelegate];
  [(PNPLockScreenViewController *)v4 setModalPresentationStyle:4];
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDeviceState:(id)a3
{
  [(PNPDeviceStateConfigurable *)self->_pillView setDeviceState:a3];
  id v4 = [(PNPLockScreenViewController *)self _platterContainerView];
  objc_msgSend(v4, "setEdge:", -[PNPLockScreenViewController preferredEdge](self, "preferredEdge"));
}

- (PNPDeviceState)deviceState
{
  return (PNPDeviceState *)[(PNPDeviceStateConfigurable *)self->_pillView deviceState];
}

- (void)loadView
{
  v3 = objc_alloc_init(PNPPlatterContainerView);
  [(PNPLockScreenViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PNPLockScreenViewController;
  [(PNPLockScreenViewController *)&v13 viewDidLoad];
  v3 = [PNPStackedPillView alloc];
  id v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"APPLE_PENCIL_NAME" value:&stru_26ECD9920 table:0];
  v6 = PencilPairingUIBundle();
  v7 = [v6 localizedStringForKey:@"UNLOCK" value:&stru_26ECD9920 table:0];
  v8 = -[PNPStackedPillView initWithFrame:topString:bottomString:](v3, "initWithFrame:topString:bottomString:", v5, v7, 0.0, 0.0, 1000.0, 1000.0);

  pillView = self->_pillView;
  self->_pillView = v8;
  v10 = v8;

  v11 = [(PNPLockScreenViewController *)self _platterContainerView];
  [v11 setContentView:self->_pillView];

  v12 = [(PNPLockScreenViewController *)self _platterContainerView];
  objc_msgSend(v12, "setEdge:", -[PNPLockScreenViewController preferredEdge](self, "preferredEdge"));
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PNPLockScreenViewController;
  -[PNPLockScreenViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  v5 = [(PNPLockScreenViewController *)self _platterContainerView];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__PNPLockScreenViewController_viewDidAppear___block_invoke;
  v6[3] = &unk_264DA56A0;
  v6[4] = self;
  PNPPlatterPresentPlatterContainerView(v5, v3, v6);
}

void __45__PNPLockScreenViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _platterContainerView];
  PNPChargingStatusConfigureAutoDismiss(v1, v2);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PNPLockScreenViewController;
  [(PNPLockScreenViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(PNPLockScreenViewController *)self appearanceDelegate];
  [v4 viewControllerDidDismiss:self];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__PNPLockScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_264DA56C8;
  CGSize v10 = a3;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:&__block_literal_global_7];
  v8.receiver = self;
  v8.super_class = (Class)PNPLockScreenViewController;
  -[PNPLockScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __82__PNPLockScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  v6 = [*(id *)(a1 + 32) view];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

- (CGSize)preferredContentSize
{
  [(PNPDeviceStateConfigurable *)self->_pillView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (unint64_t)preferredEdge
{
  return 1;
}

- (void)dismissPill
{
  double v3 = [(PNPLockScreenViewController *)self _platterContainerView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__PNPLockScreenViewController_dismissPill__block_invoke;
  v4[3] = &unk_264DA56A0;
  v4[4] = self;
  PNPPlatterPresentPlatterContainerView(v3, 1, v4);
}

void __42__PNPLockScreenViewController_dismissPill__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _platterContainerView];
  PNPChargingStatusConfigureAutoDismissWithTime(v1, v2, 0.0);
}

- (PNPPlatterViewControllerPlatterDelegate)platterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->platterDelegate);
  return (PNPPlatterViewControllerPlatterDelegate *)WeakRetained;
}

- (void)setPlatterDelegate:(id)a3
{
}

- (PNPViewControllerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->appearanceDelegate);
  return (PNPViewControllerAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (PNPDeviceStateConfigurable)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_destroyWeak((id *)&self->appearanceDelegate);
  objc_destroyWeak((id *)&self->platterDelegate);
  objc_storeStrong((id *)&self->_platterTransitioningDelegate, 0);
}

@end