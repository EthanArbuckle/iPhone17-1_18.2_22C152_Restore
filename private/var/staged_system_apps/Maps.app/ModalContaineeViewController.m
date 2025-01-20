@interface ModalContaineeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)useAdaptiveFont;
- (HeightProviding)childHeightProvider;
- (ModalCardHeaderView)headerView;
- (ModalContaineeViewController)initWithChildViewController:(id)a3;
- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4;
- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4 fullScreen:(BOOL)a5 headerViewConfigurationProvider:(id)a6;
- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4 headerViewConfigurationProvider:(id)a5;
- (UIViewController)childVC;
- (double)heightForLayout:(unint64_t)a3;
- (id)blockAlongDismissContainee;
- (id)contentView;
- (id)headerConfigurationProvider;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (void)_dismissContainee;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)handleDismissAction:(id)a3;
- (void)headerViewCloseTapped:(id)a3;
- (void)setBlockAlongDismissContainee:(id)a3;
- (void)setChildHeightProvider:(id)a3;
- (void)setHeaderConfigurationProvider:(id)a3;
- (void)setUseAdaptiveFont:(BOOL)a3;
- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly;
- (void)viewDidLoad;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ModalContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3
{
  return [(ModalContaineeViewController *)self initWithChildViewController:a3 visualEffectDisabled:0];
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10056123C;
  v10[3] = &unk_1012EEF20;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v11;
  v8 = [(ModalContaineeViewController *)self initWithChildViewController:v6 visualEffectDisabled:v4 headerViewConfigurationProvider:v10];

  return v8;
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4 headerViewConfigurationProvider:(id)a5
{
  return [(ModalContaineeViewController *)self initWithChildViewController:a3 visualEffectDisabled:a4 fullScreen:0 headerViewConfigurationProvider:a5];
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4 fullScreen:(BOOL)a5 headerViewConfigurationProvider:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ModalContaineeViewController;
  v13 = [(ModalContaineeViewController *)&v23 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    if (v7)
    {
      [(ModalContaineeViewController *)v13 setModalPresentationStyle:0];
      v15 = [(ContaineeViewController *)v14 cardPresentationController];
      [v15 setWantsFullscreen:1];
    }
    v16 = [(ContaineeViewController *)v14 cardPresentationController];
    [v16 setPresentedModally:1];

    v17 = [(ContaineeViewController *)v14 cardPresentationController];
    [v17 setTakesAvailableHeight:1];

    v18 = [(ContaineeViewController *)v14 cardPresentationController];
    [v18 setBlurInCardView:!v8];

    v19 = [(ContaineeViewController *)v14 cardPresentationController];
    [v19 setAllowsSwipeToDismiss:0];

    objc_storeStrong((id *)&v14->_childVC, a3);
    id v20 = [v12 copy];
    id headerConfigurationProvider = v14->_headerConfigurationProvider;
    v14->_id headerConfigurationProvider = v20;
  }
  return v14;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ModalContaineeViewController;
  [(ContaineeViewController *)&v3 viewDidLoad];
  [(ModalContaineeViewController *)self _setupViews];
  [(ModalContaineeViewController *)self _setupConstraints];
}

- (void)setUseAdaptiveFont:(BOOL)a3
{
  if (self->_useAdaptiveFont != a3)
  {
    self->_useAdaptiveFont = a3;
    -[ModalCardHeaderView setUseAdaptiveFont:](self->_headerView, "setUseAdaptiveFont:");
  }
}

- (id)contentView
{
  return [(UIViewController *)self->_childVC view];
}

- (ModalCardHeaderView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    BOOL v4 = [ModalCardHeaderView alloc];
    v5 = [(ModalContaineeViewController *)self headerConfigurationProvider];
    id v6 = [(ContaineeViewController *)self cardPresentationController];
    id v7 = [v6 containerStyle];
    BOOL v8 = [(ModalContaineeViewController *)self traitCollection];
    v9 = ((void (**)(void, id, void *))v5)[2](v5, v7, v8);
    v10 = [(ModalCardHeaderView *)v4 initWithConfiguration:v9];
    id v11 = self->_headerView;
    self->_headerView = v10;

    [(ModalCardHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ModalCardHeaderView *)self->_headerView setUseAdaptiveFont:self->_useAdaptiveFont];
    id v12 = [(ModalCardHeaderView *)self->_headerView titleLabel];
    [v12 setTextAlignment:4];

    v13 = [(ModalCardHeaderView *)self->_headerView leadingButton];
    [v13 setHidden:1];

    v14 = [(ModalCardHeaderView *)self->_headerView trailingButton];
    v15 = sub_100AEBDC4();
    [v14 setTitle:v15 forState:0];

    v16 = [(ModalCardHeaderView *)self->_headerView trailingButton];
    [v16 addTarget:self action:"headerViewCloseTapped:" forControlEvents:64];

    headerView = self->_headerView;
  }

  return headerView;
}

- (void)_setupViews
{
  if (!-[ContainerViewController delaysFirstCardPresentation]_0()
    || ([(ContaineeViewController *)self cardPresentationController],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 wantsFullscreen],
        v3,
        (v4 & 1) == 0))
  {
    v5 = [(ModalContaineeViewController *)self view];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  if (self->_childVC)
  {
    -[ModalContaineeViewController addChildViewController:](self, "addChildViewController:");
    id v6 = [(UIViewController *)self->_childVC view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v7 = [(ModalContaineeViewController *)self view];
    BOOL v8 = [(UIViewController *)self->_childVC view];
    [v7 addSubview:v8];

    [(UIViewController *)self->_childVC didMoveToParentViewController:self];
  }
  id v10 = [(ModalContaineeViewController *)self view];
  v9 = [(ModalContaineeViewController *)self headerView];
  [v10 addSubview:v9];
}

- (void)_setupConstraints
{
  v39 = [(ModalContaineeViewController *)self headerView];
  v37 = [v39 topAnchor];
  v38 = [(ModalContaineeViewController *)self view];
  v36 = [v38 safeAreaLayoutGuide];
  v35 = [v36 topAnchor];
  v34 = [v37 constraintEqualToAnchor:v35];
  v40[0] = v34;
  v33 = [(ModalContaineeViewController *)self headerView];
  v31 = [v33 bottomAnchor];
  v32 = [(UIViewController *)self->_childVC view];
  v30 = [v32 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v40[1] = v29;
  v28 = [(ModalContaineeViewController *)self headerView];
  v26 = [v28 leadingAnchor];
  v27 = [(ModalContaineeViewController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v40[2] = v24;
  objc_super v23 = [(ModalContaineeViewController *)self headerView];
  v21 = [v23 trailingAnchor];
  v22 = [(ModalContaineeViewController *)self view];
  id v20 = [v22 trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v40[3] = v19;
  v18 = [(UIViewController *)self->_childVC view];
  v16 = [v18 leadingAnchor];
  v17 = [(ModalContaineeViewController *)self view];
  v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v40[4] = v14;
  v13 = [(UIViewController *)self->_childVC view];
  objc_super v3 = [v13 trailingAnchor];
  unsigned __int8 v4 = [(ModalContaineeViewController *)self view];
  v5 = [v4 trailingAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v40[5] = v6;
  id v7 = [(UIViewController *)self->_childVC view];
  BOOL v8 = [v7 bottomAnchor];
  v9 = [(ModalContaineeViewController *)self view];
  id v10 = [v9 bottomAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v40[6] = v11;
  id v12 = +[NSArray arrayWithObjects:v40 count:7];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ModalContaineeViewController;
  id v6 = a3;
  [(ModalContaineeViewController *)&v10 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(ModalContaineeViewController *)self headerConfigurationProvider];
  BOOL v8 = [(ContaineeViewController *)self cardPresentationController];
  v9 = ((void (**)(void, id, id))v7)[2](v7, [v8 containerStyle], v6);

  [(ModalCardHeaderView *)self->_headerView setConfiguration:v9];
}

- (void)handleDismissAction:(id)a3
{
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ModalContaineeViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v8, "willChangeContainerStyle:");
  v5 = [(ModalContaineeViewController *)self headerConfigurationProvider];
  id v6 = [(ModalContaineeViewController *)self traitCollection];
  id v7 = ((void (**)(void, unint64_t, void *))v5)[2](v5, a3, v6);
  [(ModalCardHeaderView *)self->_headerView setConfiguration:v7];
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v5 = [(ModalContaineeViewController *)self childHeightProvider];

    if (v5)
    {
      id v6 = [(ModalContaineeViewController *)self childHeightProvider];
      [v6 fittingHeight];
      double v8 = v7;
      [(ContaineeViewController *)self headerHeight];
      double v3 = v8 + v9;
    }
    else
    {
      id v6 = [(ContaineeViewController *)self cardPresentationController];
      [v6 availableHeight];
      double v3 = v10;
    }
  }
  return v3;
}

- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly
{
}

- (void)_dismissContainee
{
  double v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 dismiss:1];

  unsigned __int8 v4 = [(ModalContaineeViewController *)self blockAlongDismissContainee];

  if (v4)
  {
    v5 = [(ModalContaineeViewController *)self blockAlongDismissContainee];
    id v6 = (void (**)(void))[v5 copy];

    [(ModalContaineeViewController *)self setBlockAlongDismissContainee:0];
    v6[2]();
  }
}

- (void)headerViewCloseTapped:(id)a3
{
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (UIViewController)childVC
{
  return self->_childVC;
}

- (id)blockAlongDismissContainee
{
  return self->_blockAlongDismissContainee;
}

- (void)setBlockAlongDismissContainee:(id)a3
{
}

- (HeightProviding)childHeightProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_childHeightProvider);

  return (HeightProviding *)WeakRetained;
}

- (void)setChildHeightProvider:(id)a3
{
}

- (BOOL)useAdaptiveFont
{
  return self->_useAdaptiveFont;
}

- (id)headerConfigurationProvider
{
  return self->_headerConfigurationProvider;
}

- (void)setHeaderConfigurationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headerConfigurationProvider, 0);
  objc_destroyWeak((id *)&self->_childHeightProvider);
  objc_storeStrong(&self->_blockAlongDismissContainee, 0);
  objc_storeStrong((id *)&self->_childVC, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end