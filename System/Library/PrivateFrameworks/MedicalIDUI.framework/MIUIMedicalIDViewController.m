@interface MIUIMedicalIDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersHomeIndicatorHidden;
- (MIUIMedicalIDViewController)initWithCoder:(id)a3;
- (MIUIMedicalIDViewController)initWithHealthStore:(id)a3 displayConfiguration:(id)a4;
- (MIUIMedicalIDViewController)initWithHealthStore:(id)a3 medicalIDData:(id)a4 displayConfiguration:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MIUIMedicalIDViewController

- (MIUIMedicalIDViewController)initWithHealthStore:(id)a3 displayConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MIUIMedicalIDViewController;
  v9 = [(MIUIMedicalIDViewController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayConfiguration, a4);
    objc_storeStrong((id *)&v10->_healthStore, a3);
    medicalIDData = v10->_medicalIDData;
    v10->_medicalIDData = 0;

    v12 = objc_alloc_init(_TtC11MedicalIDUI20MedicalIDViewFactory);
    factory = v10->_factory;
    v10->_factory = v12;

    uint64_t v14 = [(MedicalIDViewFactory *)v10->_factory makeHostingControllerWithHealthStore:v10->_healthStore medicalIDData:v10->_medicalIDData displayConfiguration:v10->_displayConfiguration];
    hostedController = v10->_hostedController;
    v10->_hostedController = (UIViewController *)v14;
  }
  return v10;
}

- (MIUIMedicalIDViewController)initWithHealthStore:(id)a3 medicalIDData:(id)a4 displayConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MIUIMedicalIDViewController;
  v12 = [(MIUIMedicalIDViewController *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_medicalIDData, a4);
    objc_storeStrong((id *)&v13->_displayConfiguration, a5);
    uint64_t v14 = objc_alloc_init(_TtC11MedicalIDUI20MedicalIDViewFactory);
    factory = v13->_factory;
    v13->_factory = v14;

    uint64_t v16 = [(MedicalIDViewFactory *)v13->_factory makeHostingControllerWithHealthStore:v13->_healthStore medicalIDData:v13->_medicalIDData displayConfiguration:v13->_displayConfiguration];
    hostedController = v13->_hostedController;
    v13->_hostedController = (UIViewController *)v16;
  }
  return v13;
}

- (MIUIMedicalIDViewController)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MIUIMedicalIDViewController;
  v3 = [(MIUIMedicalIDViewController *)&v14 initWithCoder:a3];
  if (v3)
  {
    uint64_t v4 = +[MIUIDisplayConfiguration standardConfiguration];
    displayConfiguration = v3->_displayConfiguration;
    v3->_displayConfiguration = (MIUIDisplayConfiguration *)v4;

    v6 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
    healthStore = v3->_healthStore;
    v3->_healthStore = v6;

    medicalIDData = v3->_medicalIDData;
    v3->_medicalIDData = 0;

    id v9 = objc_alloc_init(_TtC11MedicalIDUI20MedicalIDViewFactory);
    factory = v3->_factory;
    v3->_factory = v9;

    uint64_t v11 = [(MedicalIDViewFactory *)v3->_factory makeHostingControllerWithHealthStore:v3->_healthStore medicalIDData:v3->_medicalIDData displayConfiguration:v3->_displayConfiguration];
    hostedController = v3->_hostedController;
    v3->_hostedController = (UIViewController *)v11;
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersHomeIndicatorHidden
{
  return [(MIUIDisplayConfiguration *)self->_displayConfiguration isHomeIndicatorHidden];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MIUIMedicalIDViewController;
  [(MIUIMedicalIDViewController *)&v23 viewDidLoad];
  [(MIUIMedicalIDViewController *)self addChildViewController:self->_hostedController];
  v3 = [(MIUIMedicalIDViewController *)self view];
  uint64_t v4 = [(UIViewController *)self->_hostedController view];
  [v3 addSubview:v4];

  [(UIViewController *)self->_hostedController didMoveToParentViewController:self];
  v5 = [MIUIMedicalIDNavigationBarView alloc];
  healthStore = self->_healthStore;
  medicalIDData = self->_medicalIDData;
  BOOL v8 = [(MIUIDisplayConfiguration *)self->_displayConfiguration isLockScreen];
  id v9 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  id v10 = [(MIUIMedicalIDNavigationBarView *)v5 initWithHealthStore:healthStore medicalIDData:medicalIDData showDateUpdated:v8 locale:v9];
  uint64_t v11 = [(MIUIMedicalIDViewController *)self navigationItem];
  [v11 setTitleView:v10];

  if ([(MIUIDisplayConfiguration *)self->_displayConfiguration shouldShowDoneButton])
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x263F823D0];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    objc_super v19 = __42__MIUIMedicalIDViewController_viewDidLoad__block_invoke;
    v20 = &unk_2653EE130;
    objc_copyWeak(&v21, &location);
    v13 = [v12 actionWithHandler:&v17];
    id v14 = objc_alloc(MEMORY[0x263F824A8]);
    v15 = objc_msgSend(v14, "initWithBarButtonSystemItem:primaryAction:", 0, v13, v17, v18, v19, v20);
    uint64_t v16 = [(MIUIMedicalIDViewController *)self navigationItem];
    [v16 setRightBarButtonItem:v15];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __42__MIUIMedicalIDViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained parentViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MIUIMedicalIDViewController;
  [(MIUIMedicalIDViewController *)&v5 viewDidAppear:a3];
  uint64_t v4 = [(MedicalIDViewFactory *)self->_factory scrollView];
  [(MIUIMedicalIDViewController *)self setContentScrollView:v4 forEdge:15];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MIUIMedicalIDViewController;
  [(MIUIMedicalIDViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(MIUIMedicalIDViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(UIViewController *)self->_hostedController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_hostedController, 0);
}

@end