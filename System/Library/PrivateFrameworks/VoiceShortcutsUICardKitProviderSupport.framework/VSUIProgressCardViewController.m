@interface VSUIProgressCardViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAnimateTransitionToState:(unint64_t)a3 fromState:(unint64_t)a4 forProgressIndicatorViewController:(id)a5;
- (CGSize)preferredContentSize;
- (NSProgress)progress;
- (SUICProgressIndicatorViewController)_progressIndicatorViewController;
- (SUICProgressStateMachine)_progressStateMachine;
- (UIActivityIndicatorView)_loadingIndicatorView;
- (UIView)_hairlineView;
- (VSUIActionStatusView)_statusView;
- (double)contentHeightForWidth:(double)a3;
- (id)_initWithCard:(id)a3 delegate:(id)a4 loadProvidersImmediately:(BOOL)a5;
- (void)_setHairlineView:(id)a3;
- (void)_setLoadingIndicatorView:(id)a3;
- (void)_setProgressIndicatorViewController:(id)a3;
- (void)_setProgressStateMachine:(id)a3;
- (void)_setStatusView:(id)a3;
- (void)_setUpHelpers;
- (void)_setUpViews;
- (void)_updateDelegateOnBoundsDidChange;
- (void)actionStatusView:(id)a3 didAddViewFromProgressViewController:(id)a4;
- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)handleCardCommand:(id)a3 reply:(id)a4;
- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6;
@end

@implementation VSUIProgressCardViewController

- (void)_setUpViews
{
  v64[10] = *MEMORY[0x263EF8340];
  v3 = [(VSUIProgressCardViewController *)self view];
  v4 = [(VSUIProgressCardViewController *)self _statusView];
  [v3 addSubview:v4];

  v5 = [(VSUIProgressCardViewController *)self view];
  v6 = [(VSUIProgressCardViewController *)self _hairlineView];
  [v5 addSubview:v6];

  v7 = [(VSUIProgressCardViewController *)self view];
  v8 = [(VSUIProgressCardViewController *)self _loadingIndicatorView];
  [v7 addSubview:v8];

  v9 = [(VSUIProgressCardViewController *)self _statusView];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintEqualToConstant:40.0];
  statusViewSuccessHeightConstraint = self->_statusViewSuccessHeightConstraint;
  self->_statusViewSuccessHeightConstraint = v11;

  v13 = [(VSUIProgressCardViewController *)self _statusView];
  v14 = [v13 heightAnchor];
  v15 = [v14 constraintLessThanOrEqualToConstant:70.0];
  statusViewFailureHeightConstraint = self->_statusViewFailureHeightConstraint;
  self->_statusViewFailureHeightConstraint = v15;

  v44 = (void *)MEMORY[0x263F08938];
  v64[0] = self->_statusViewSuccessHeightConstraint;
  v63 = [(VSUIProgressCardViewController *)self _statusView];
  v61 = [v63 leftAnchor];
  v62 = [(VSUIProgressCardViewController *)self view];
  v60 = [v62 leftAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v64[1] = v59;
  v58 = [(VSUIProgressCardViewController *)self _statusView];
  v56 = [v58 rightAnchor];
  v57 = [(VSUIProgressCardViewController *)self view];
  v55 = [v57 rightAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v64[2] = v54;
  v53 = [(VSUIProgressCardViewController *)self _statusView];
  v51 = [v53 bottomAnchor];
  v52 = [(VSUIProgressCardViewController *)self view];
  v50 = [v52 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v64[3] = v49;
  v48 = [(VSUIProgressCardViewController *)self _hairlineView];
  v47 = [v48 heightAnchor];
  v46 = [v47 constraintEqualToConstant:1.0];
  v64[4] = v46;
  v45 = [(VSUIProgressCardViewController *)self _hairlineView];
  v42 = [v45 leftAnchor];
  v43 = [(VSUIProgressCardViewController *)self view];
  v41 = [v43 leftAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v64[5] = v40;
  v39 = [(VSUIProgressCardViewController *)self _hairlineView];
  v37 = [v39 rightAnchor];
  v38 = [(VSUIProgressCardViewController *)self view];
  v36 = [v38 rightAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v64[6] = v35;
  v34 = [(VSUIProgressCardViewController *)self _hairlineView];
  v32 = [v34 bottomAnchor];
  v33 = [(VSUIProgressCardViewController *)self _statusView];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v64[7] = v30;
  v29 = [(VSUIProgressCardViewController *)self _loadingIndicatorView];
  v28 = [v29 centerXAnchor];
  v17 = [(VSUIProgressCardViewController *)self view];
  v18 = [v17 centerXAnchor];
  v19 = [v28 constraintEqualToAnchor:v18];
  v64[8] = v19;
  v20 = [(VSUIProgressCardViewController *)self _loadingIndicatorView];
  v21 = [v20 topAnchor];
  v22 = [(VSUIProgressCardViewController *)self view];
  v23 = [v22 topAnchor];
  v24 = [(VSUIProgressCardViewController *)self _loadingIndicatorView];
  [v24 bounds];
  v26 = [v21 constraintEqualToAnchor:v23 constant:(98.0 - v25) * 0.5];
  v64[9] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:10];
  [v44 activateConstraints:v27];
}

- (void)_setUpHelpers
{
  v7[3] = *MEMORY[0x263EF8340];
  v3 = [(VSUIProgressCardViewController *)self _progressStateMachine];
  v4 = [(VSUIProgressCardViewController *)self _progressIndicatorViewController];
  v7[1] = v4;
  v5 = [(VSUIProgressCardViewController *)self _statusView];
  v7[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  [v3 addObservers:v6];
}

- (void)_updateDelegateOnBoundsDidChange
{
  id v3 = [(VSUIProgressCardViewController *)self cardViewControllerDelegate];
  [v3 cardViewControllerBoundsDidChange:self];
}

- (SUICProgressStateMachine)_progressStateMachine
{
  progressStateMachine = self->_progressStateMachine;
  if (!progressStateMachine)
  {
    v4 = (SUICProgressStateMachine *)objc_opt_new();
    v5 = self->_progressStateMachine;
    self->_progressStateMachine = v4;

    progressStateMachine = self->_progressStateMachine;
  }
  return progressStateMachine;
}

- (SUICProgressIndicatorViewController)_progressIndicatorViewController
{
  progressIndicatorViewController = self->_progressIndicatorViewController;
  if (!progressIndicatorViewController)
  {
    v4 = objc_opt_new();
    [v4 setDataSource:self];
    [(VSUIProgressCardViewController *)self addChildViewController:v4];
    v5 = self->_progressIndicatorViewController;
    self->_progressIndicatorViewController = (SUICProgressIndicatorViewController *)v4;

    progressIndicatorViewController = self->_progressIndicatorViewController;
  }
  return progressIndicatorViewController;
}

- (UIView)_hairlineView
{
  hairlineView = self->_hairlineView;
  if (!hairlineView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = [MEMORY[0x263F1C550] blackColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIView *)v4 setAlpha:0.04];
    [(UIView *)v4 setHidden:1];
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = self->_hairlineView;
    self->_hairlineView = v4;

    hairlineView = self->_hairlineView;
  }
  return hairlineView;
}

- (VSUIActionStatusView)_statusView
{
  statusView = self->_statusView;
  if (!statusView)
  {
    v4 = (VSUIActionStatusView *)objc_opt_new();
    [(VSUIActionStatusView *)v4 setDelegate:self];
    [(VSUIActionStatusView *)v4 setHidden:1];
    [(VSUIActionStatusView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = self->_statusView;
    self->_statusView = v4;

    statusView = self->_statusView;
  }
  return statusView;
}

- (UIActivityIndicatorView)_loadingIndicatorView
{
  loadingIndicatorView = self->_loadingIndicatorView;
  if (!loadingIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [(UIActivityIndicatorView *)v4 startAnimating];
    [(UIActivityIndicatorView *)v4 setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = self->_loadingIndicatorView;
    self->_loadingIndicatorView = v4;

    loadingIndicatorView = self->_loadingIndicatorView;
  }
  return loadingIndicatorView;
}

- (void)actionStatusView:(id)a3 didAddViewFromProgressViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(VSUIProgressCardViewController *)self _progressIndicatorViewController];

  if (v6 == v5)
  {
    id v7 = [(VSUIProgressCardViewController *)self _progressIndicatorViewController];
    [v7 didMoveToParentViewController:self];
  }
}

- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke;
  v11[3] = &unk_2649FBFC8;
  v11[4] = self;
  v11[5] = a6;
  id v7 = (void (**)(void))MEMORY[0x230FB0AF0](v11, a2, a3, a4, a5);
  v8 = v7;
  if (self->_animatesStateTransitions)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2;
    v9[3] = &unk_2649FBFF0;
    v9[4] = self;
    v10 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
  else
  {
    v7[2](v7);
  }
}

void __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  switch(v2)
  {
    case 0:
LABEL_4:
      id v3 = [*(id *)(a1 + 32) _statusView];
      [v3 setHidden:0];

      id v11 = [*(id *)(a1 + 32) _hairlineView];
      [v11 setHidden:0];

      return;
    case 3:
      v4 = [*(id *)(a1 + 32) _statusView];
      [v4 setHidden:0];

      id v5 = [*(id *)(a1 + 32) _hairlineView];
      [v5 setHidden:0];

      [*(id *)(*(void *)(a1 + 32) + 1096) setActive:1];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = 1088;
      break;
    case 2:
      goto LABEL_4;
    default:
      v8 = [*(id *)(a1 + 32) _statusView];
      [v8 setHidden:0];

      v9 = [*(id *)(a1 + 32) _hairlineView];
      [v9 setHidden:0];

      [*(id *)(*(void *)(a1 + 32) + 1088) setActive:1];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = 1096;
      break;
  }
  v10 = *(void **)(v6 + v7);
  [v10 setActive:0];
}

uint64_t __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateDelegateOnBoundsDidChange];
}

- (CGSize)preferredContentSize
{
  v8.receiver = self;
  v8.super_class = (Class)VSUIProgressCardViewController;
  [(VSUIProgressCardViewController *)&v8 preferredContentSize];
  double v4 = v3;
  -[VSUIProgressCardViewController contentHeightForWidth:](self, "contentHeightForWidth:");
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_initWithCard:(id)a3 delegate:(id)a4 loadProvidersImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSUIProgressCardViewController;
  v9 = [(VSUIProgressCardViewController *)&v13 _initWithCard:v8 delegate:a4 loadProvidersImmediately:v5];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F08AB8]);
    id v11 = (void *)v9[134];
    v9[134] = v10;

    *((unsigned char *)v9 + 1080) = 1;
    *((unsigned char *)v9 + 1081) = [v8 asynchronous];
    [v9 _setUpViews];
    [v9 _setUpHelpers];
  }

  return v9;
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v15 = a3;
  if (([(VSUIProgressCardViewController *)self isLoading] & 1) == 0)
  {
    BOOL v5 = [(VSUIProgressCardViewController *)self _loadingIndicatorView];
    [v5 stopAnimating];
  }
  if (self->_hasAsynchronousCard)
  {
    double v6 = [(VSUIProgressCardViewController *)self cardSectionViewSource];
    double v7 = [v6 viewConfigurationForCardSection:v15];
    id v8 = [v7 cardSectionView];

    [v8 setAlpha:0.0];
    v9 = [(VSUIProgressCardViewController *)self view];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v8, "sizeThatFits:", v11, v13);
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, v11, v14);
  }
  MEMORY[0x270F9A758]();
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  if (self->_hasAsynchronousCard)
  {
    id v5 = a3;
    double v6 = [(VSUIProgressCardViewController *)self cardSectionViewSource];
    double v7 = [v6 viewConfigurationForCardSection:v5];

    id v8 = [v7 cardSectionView];

    v9 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __96__VSUIProgressCardViewController_cardSectionViewDidAppearForCardSection_withAppearanceFeedback___block_invoke;
    v11[3] = &unk_2649FC018;
    id v12 = v8;
    id v10 = v8;
    [v9 animateWithDuration:v11 animations:0.300000012];
  }
}

uint64_t __96__VSUIProgressCardViewController_cardSectionViewDidAppearForCardSection_withAppearanceFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (double)contentHeightForWidth:(double)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VSUIProgressCardViewController;
  -[VSUIProgressCardViewController contentHeightForWidth:](&v15, sel_contentHeightForWidth_);
  double v6 = v5;
  double v7 = [(VSUIProgressCardViewController *)self _statusView];
  char v8 = [v7 isHidden];

  double result = v6;
  if ((v8 & 1) == 0)
  {
    id v10 = [(VSUIProgressCardViewController *)self _statusView];
    objc_msgSend(v10, "sizeThatFits:", a3, 2.22507386e-308);
    double v12 = v11;

    BOOL v13 = [(NSLayoutConstraint *)self->_statusViewFailureHeightConstraint isActive];
    double v14 = 40.0;
    if (v13) {
      double v14 = 70.0;
    }
    if (v14 < v12) {
      double v14 = v12;
    }
    double result = v6 + v14;
  }
  if (v6 == 0.0) {
    return result + 98.0;
  }
  return result;
}

- (void)handleCardCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    self->_animatesStateTransitions = [v8 animatesProgress];
    v9 = [v8 progress];
    progress = self->_progress;
    self->_progress = v9;

    unint64_t v11 = [v8 event];
    if (v11 >= 5) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = v11;
    }
    [(SUICProgressStateMachine *)self->_progressStateMachine handleEvent:v12];
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VSUIProgressCardViewController;
    [(VSUIProgressCardViewController *)&v13 handleCardCommand:v6 reply:v7];
  }
}

- (BOOL)shouldAnimateTransitionToState:(unint64_t)a3 fromState:(unint64_t)a4 forProgressIndicatorViewController:(id)a5
{
  return self->_animatesStateTransitions;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)_setStatusView:(id)a3
{
}

- (void)_setLoadingIndicatorView:(id)a3
{
}

- (void)_setProgressIndicatorViewController:(id)a3
{
}

- (void)_setHairlineView:(id)a3
{
}

- (void)_setProgressStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressStateMachine, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_statusViewFailureHeightConstraint, 0);
  objc_storeStrong((id *)&self->_statusViewSuccessHeightConstraint, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end