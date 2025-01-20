@interface PNPAirplaneModeViewController
- (CGSize)preferredContentSize;
- (PNPAirplaneModeBluetoothDelegate)delegate;
- (PNPAirplaneModeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PNPDeviceState)deviceState;
- (PNPPlatterViewControllerPlatterDelegate)platterDelegate;
- (PNPViewControllerAppearanceDelegate)appearanceDelegate;
- (unint64_t)preferredEdge;
- (void)didTapOnBluetoothButton;
- (void)dismissPill;
- (void)loadView;
- (void)setAppearanceDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setPlatterDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PNPAirplaneModeViewController

- (PNPAirplaneModeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PNPAirplaneModeViewController;
  v4 = [(PNPAirplaneModeViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = objc_opt_new();
  [(PNPAirplaneModeViewController *)v4 setDeviceState:v5];

  v6 = objc_alloc_init(PNPPlatterTransitioningDelegate);
  platterTransitioningDelegate = v4->_platterTransitioningDelegate;
  v4->_platterTransitioningDelegate = v6;

  [(PNPAirplaneModeViewController *)v4 setTransitioningDelegate:v4->_platterTransitioningDelegate];
  [(PNPAirplaneModeViewController *)v4 setModalPresentationStyle:4];
  return v4;
}

- (void)setDeviceState:(id)a3
{
  [(PNPAirplaneModeView *)self->_airplaneModeView setDeviceState:a3];
  id v4 = [(PNPAirplaneModeViewController *)self _platterContainerView];
  objc_msgSend(v4, "setEdge:", -[PNPAirplaneModeViewController preferredEdge](self, "preferredEdge"));
}

- (PNPDeviceState)deviceState
{
  return [(PNPAirplaneModeView *)self->_airplaneModeView deviceState];
}

- (void)loadView
{
  v3 = objc_alloc_init(PNPPlatterContainerView);
  [(PNPAirplaneModeViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PNPAirplaneModeViewController;
  [(PNPAirplaneModeViewController *)&v7 viewDidLoad];
  v3 = -[PNPAirplaneModeView initWithFrame:]([PNPAirplaneModeView alloc], "initWithFrame:", 0.0, 0.0, 1000.0, 1000.0);
  airplaneModeView = self->_airplaneModeView;
  self->_airplaneModeView = v3;

  [(PNPAirplaneModeView *)self->_airplaneModeView setBluetoothDelegate:self];
  v5 = [(PNPAirplaneModeViewController *)self _platterContainerView];
  [v5 setContentView:self->_airplaneModeView];

  v6 = [(PNPAirplaneModeViewController *)self _platterContainerView];
  objc_msgSend(v6, "setEdge:", -[PNPAirplaneModeViewController preferredEdge](self, "preferredEdge"));
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PNPAirplaneModeViewController;
  -[PNPAirplaneModeViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  v5 = [(PNPAirplaneModeViewController *)self _platterContainerView];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__PNPAirplaneModeViewController_viewDidAppear___block_invoke;
  v6[3] = &unk_264DA56A0;
  v6[4] = self;
  PNPPlatterPresentPlatterContainerView(v5, v3, v6);
}

void __47__PNPAirplaneModeViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _platterContainerView];
  PNPChargingStatusConfigureAutoDismissWithTime(v1, v2, 4.0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__PNPAirplaneModeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_264DA56C8;
  CGSize v10 = a3;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:&__block_literal_global_8];
  v8.receiver = self;
  v8.super_class = (Class)PNPAirplaneModeViewController;
  -[PNPAirplaneModeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __84__PNPAirplaneModeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
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

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PNPAirplaneModeViewController;
  [(PNPAirplaneModeViewController *)&v5 viewDidDisappear:a3];
  double v4 = [(PNPAirplaneModeViewController *)self appearanceDelegate];
  [v4 viewControllerDidDismiss:self];
}

- (CGSize)preferredContentSize
{
  [(PNPAirplaneModeView *)self->_airplaneModeView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (unint64_t)preferredEdge
{
  return 1;
}

- (void)didTapOnBluetoothButton
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_delegate);
    [v4 didRequestEnablingBluetooth];
  }
}

- (void)dismissPill
{
  double v3 = [(PNPAirplaneModeViewController *)self _platterContainerView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__PNPAirplaneModeViewController_dismissPill__block_invoke;
  v4[3] = &unk_264DA56A0;
  v4[4] = self;
  PNPPlatterPresentPlatterContainerView(v3, 1, v4);
}

void __44__PNPAirplaneModeViewController_dismissPill__block_invoke(uint64_t a1)
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

- (PNPAirplaneModeBluetoothDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPAirplaneModeBluetoothDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->appearanceDelegate);
  objc_destroyWeak((id *)&self->platterDelegate);
  objc_storeStrong((id *)&self->_airplaneModeView, 0);
  objc_storeStrong((id *)&self->_platterTransitioningDelegate, 0);
}

@end