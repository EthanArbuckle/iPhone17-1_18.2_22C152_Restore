@interface OverlayContainerViewController
- (NSArray)_topBannerViewHorizontalConstraints;
- (NSArray)innerLayoutGuideConstraints;
- (OverlayContainerDimmingBehaviour)dimmingBehaviour;
- (TopBannerView)topBannerView;
- (UILayoutGuide)innerLayoutGuide;
- (UIView)overlayView;
- (UIView)passThroughView;
- (UIView)topContentView;
- (double)_topBannerMaxHeight;
- (double)currentDimmingValue;
- (double)topEdgeInset;
- (double)topLabelEdgeInset;
- (id)_topBannerViewConstraints;
- (unint64_t)topContentSizeStyle;
- (void)_dismissAction:(id)a3;
- (void)_updateDimming;
- (void)_updateDimmingViewsWithAlpha:(double)a3;
- (void)_updateDimmingViewsWithAlpha:(double)a3 animated:(BOOL)a4;
- (void)applyTransitionWithProgress:(double)a3;
- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3;
- (void)contentHeightUpdatedWithValue:(double)a3;
- (void)layoutGuideUpdated;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6;
- (void)restoreDimmingViewAlphaCacheIfNeeded;
- (void)setDimmingBehaviour:(id)a3;
- (void)setInnerLayoutGuide:(id)a3;
- (void)setInnerLayoutGuideConstraints:(id)a3;
- (void)setTopBannerView:(id)a3;
- (void)setTopContentSizeStyle:(unint64_t)a3;
- (void)setupConstraints;
- (void)transitionEnded;
- (void)updateContainerStyleDependentConstraints;
- (void)updateEdgePadding;
- (void)updateTopBannerViewWithTopBannerItems:(id)a3;
- (void)updateViewsForCustomDismissalTransition;
- (void)updateViewsForCustomPresentationTransition;
- (void)viewControllerWantsTopBannerItemsUpdate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation OverlayContainerViewController

- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v11 containerStyleManagerConfigureLayoutForStyle:a3];
  [(OverlayContainerViewController *)self updateContainerStyleDependentConstraints];
  v4 = [(OverlayContainerViewController *)self topContentView];
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    unint64_t v6 = [(ContainerViewController *)self containerStyle];
    if (v6 <= 7 && ((1 << v6) & 0xE3) != 0)
    {
      v7 = [(OverlayContainerViewController *)self topContentView];
      v8 = [v7 layer];
      v9 = v8;
      double v10 = 0.0;
    }
    else
    {
      v7 = [(OverlayContainerViewController *)self topContentView];
      v8 = [v7 layer];
      v9 = v8;
      double v10 = 10.0;
    }
    [v8 setCornerRadius:v10];
  }
  [(OverlayContainerViewController *)self _updateDimming];
}

- (void)_updateDimming
{
  v3 = [(OverlayContainerViewController *)self view];
  v4 = [v3 superview];

  if (v4)
  {
    unsigned __int8 v5 = [(OverlayContainerViewController *)self dimmingBehaviour];
    unint64_t v6 = [(ContainerViewController *)self currentViewController];
    v7 = [v6 view];
    [v7 frame];
    [v5 overlayContainer:self dimmingPercentageForCurrentContaineeWithNewHeight:CGRectGetHeight(v14)];
    double v9 = v8;

    double v10 = fmin(fmax(v9, 0.0), 1.0);
    [(OverlayContainerViewController *)self currentDimmingValue];
    BOOL v12 = v10 == 1.0 && v11 == 0.0;
    [(OverlayContainerViewController *)self _updateDimmingViewsWithAlpha:v12 animated:v10];
  }
}

- (double)currentDimmingValue
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 > 7) {
    v4 = &OBJC_IVAR___OverlayContainerViewController__topDimmingView;
  }
  else {
    v4 = off_1012F9110[v3];
  }
  unsigned __int8 v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v4);

  [v5 alpha];
  return result;
}

- (void)_updateDimmingViewsWithAlpha:(double)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1007CEAEC;
    v5[3] = &unk_1012E69C0;
    v5[4] = self;
    *(double *)&v5[5] = a3;
    +[UIView animateWithDuration:v5 animations:0.25];
  }
  else
  {
    [(OverlayContainerViewController *)self _updateDimmingViewsWithAlpha:a3];
  }
}

- (void)viewDidLoad
{
  v59.receiver = self;
  v59.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v59 viewDidLoad];
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->_modeTransitiontransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->_modeTransitiontransform.c = v3;
  *(_OWORD *)&self->_modeTransitiontransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  uint64_t v4 = [(OverlayContainerViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(OverlayContainerViewController *)self view];
  [v13 setAccessibilityIdentifier:@"OverlayContainerView"];

  CGRect v14 = [objc_alloc((Class)UIView) initWithFrame:v6, v8, v10, v12];
  topContentView = self->_topContentView;
  self->_topContentView = v14;

  [(UIView *)self->_topContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = +[UIColor clearColor];
  [(UIView *)self->_topContentView setBackgroundColor:v16];

  [(UIView *)self->_topContentView setClipsToBounds:1];
  v17 = [(OverlayContainerViewController *)self view];
  v18 = self->_topContentView;
  v19 = [(ContainerViewController *)self containerView];
  [v17 insertSubview:v18 belowSubview:v19];

  v20 = -[PassThroughView initWithFrame:]([PassThroughView alloc], "initWithFrame:", v6, v8, v10, v12);
  [(PassThroughView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = +[UIColor clearColor];
  [(PassThroughView *)v20 setBackgroundColor:v21];

  [(PassThroughView *)v20 setDelegate:self];
  overlayView = self->_overlayView;
  self->_overlayView = (UIView *)v20;
  v23 = v20;

  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v26 = +[NSString stringWithFormat:@"%@.OverlayView", v25];
  [(UIView *)self->_overlayView setAccessibilityIdentifier:v26];

  v27 = [(OverlayContainerViewController *)self view];
  [v27 insertSubview:self->_overlayView belowSubview:self->_topContentView];

  v28 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  innerLayoutGuide = self->_innerLayoutGuide;
  self->_innerLayoutGuide = v28;

  v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  v32 = +[NSString stringWithFormat:@"%@.innerLayoutGuide", v31];
  [(UILayoutGuide *)self->_innerLayoutGuide setIdentifier:v32];

  v33 = [(OverlayContainerViewController *)self view];
  [v33 addLayoutGuide:self->_innerLayoutGuide];

  v58 = [(UILayoutGuide *)self->_innerLayoutGuide topAnchor];
  v57 = [(PassThroughView *)v23 topAnchor];
  [(ContainerViewController *)self edgePadding];
  v56 = [v58 constraintEqualToAnchor:v57];
  v60[0] = v56;
  v55 = [(UILayoutGuide *)self->_innerLayoutGuide leadingAnchor];
  v34 = [(PassThroughView *)v23 leadingAnchor];
  [(ContainerViewController *)self edgePadding];
  v35 = [v55 constraintEqualToAnchor:v34];
  v60[1] = v35;
  v36 = [(PassThroughView *)v23 bottomAnchor];
  v37 = [(UILayoutGuide *)self->_innerLayoutGuide bottomAnchor];
  [(ContainerViewController *)self bottomEdgePadding];
  v38 = [v36 constraintEqualToAnchor:v37];
  v60[2] = v38;
  v39 = [(PassThroughView *)v23 trailingAnchor];
  v40 = [(UILayoutGuide *)self->_innerLayoutGuide trailingAnchor];
  [(ContainerViewController *)self edgePadding];
  v41 = [v39 constraintEqualToAnchor:v40];
  v60[3] = v41;
  v42 = +[NSArray arrayWithObjects:v60 count:4];
  innerLayoutGuideConstraints = self->_innerLayoutGuideConstraints;
  self->_innerLayoutGuideConstraints = v42;

  +[NSLayoutConstraint activateConstraints:self->_innerLayoutGuideConstraints];
  v44 = [objc_alloc((Class)UIView) initWithFrame:v6, v8, v10, v12];
  topDimmingView = self->_topDimmingView;
  self->_topDimmingView = v44;

  [(UIView *)self->_topDimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
  v46 = +[UIColor colorWithWhite:0.0 alpha:0.400000006];
  [(UIView *)self->_topDimmingView setBackgroundColor:v46];

  [(UIView *)self->_topDimmingView setAlpha:0.0];
  [(UIView *)self->_topDimmingView setUserInteractionEnabled:0];
  [(UIView *)self->_topDimmingView setClipsToBounds:1];
  v47 = [(UIView *)self->_topDimmingView layer];
  [v47 setCornerRadius:10.0];

  v48 = [(OverlayContainerViewController *)self view];
  [v48 insertSubview:self->_topDimmingView aboveSubview:self->_topContentView];

  v49 = -[DimmingContainerView initWithFrame:]([DimmingContainerView alloc], "initWithFrame:", v6, v8, v10, v12);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v49;

  [(DimmingContainerView *)self->_dimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DimmingContainerView *)self->_dimmingView setAlpha:0.0];
  [(DimmingContainerView *)self->_dimmingView setUserInteractionEnabled:1];
  v51 = [(OverlayContainerViewController *)self view];
  v52 = self->_dimmingView;
  v53 = [(ContainerViewController *)self containerView];
  [v51 insertSubview:v52 belowSubview:v53];

  id v54 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_dismissAction:"];
  [(DimmingContainerView *)self->_dimmingView addGestureRecognizer:v54];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v12 viewDidLayoutSubviews];
  long long v3 = [(TopBannerView *)self->_topBannerView superview];

  if (v3)
  {
    [(OverlayContainerViewController *)self _topBannerMaxHeight];
    double v5 = v4;
    double v6 = [(OverlayContainerViewController *)self topBannerView];
    [v6 setMaximumHeight:v5];

    -[TopBannerView systemLayoutSizeFittingSize:](self->_topBannerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    double v8 = v7;
    [(ContainerViewController *)self edgePadding];
    double v10 = -(v8 + v9);
  }
  else
  {
    double v10 = 0.0;
  }
  [(NSLayoutConstraint *)self->_overlayToTopInsetConstraint constant];
  if (v10 != v11)
  {
    [(NSLayoutConstraint *)self->_overlayToTopInsetConstraint setConstant:v10];
    [(ContainerViewController *)self updateMapEdgeInsets];
  }
  [(OverlayContainerViewController *)self updateEdgePadding];
  [(OverlayContainerViewController *)self layoutGuideUpdated];
}

- (void)updateEdgePadding
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v3 = self->_innerLayoutGuideConstraints;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "firstAttribute", (void)v9) == (id)4)
        {
          [(ContainerViewController *)self bottomEdgePadding];
        }
        else if ([v8 firstAttribute] == (id)5)
        {
          sub_1000BBAF8();
        }
        else
        {
          [(ContainerViewController *)self edgePadding];
        }
        [v8 setConstant:];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)layoutGuideUpdated
{
  long long v3 = [(ContainerViewController *)self chromeViewController];
  id v4 = [v3 mapInsetsLayoutGuide];

  if (v4)
  {
    id v5 = [(OverlayContainerViewController *)self view];
    uint64_t v6 = [v5 window];

    if (v6)
    {
      double v7 = [(UIView *)self->_overlayView constraintsAffectingLayoutForAxis:1];
      double v8 = [(UIView *)self->_overlayView constraintsAffectingLayoutForAxis:0];
      long long v9 = [v7 arrayByAddingObjectsFromArray:v8];

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v50;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v50 != v12) {
              objc_enumerationMutation(v10);
            }
            CGRect v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            v15 = [v14 firstItem];
            v16 = v15;
            if (v15 == self->_overlayView)
            {
              v17 = [v14 secondItem];
              BOOL v18 = v17 == v4;

              if (v18)
              {

                goto LABEL_15;
              }
            }
            else
            {
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      [(NSLayoutConstraint *)self->_overlayToTopInsetConstraint setActive:0];
      v19 = [(UIView *)self->_overlayView topAnchor];
      v20 = [v4 topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      overlayToTopInsetConstraint = self->_overlayToTopInsetConstraint;
      self->_overlayToTopInsetConstraint = v21;

      v47 = [(DimmingContainerView *)self->_dimmingView topAnchor];
      v48 = [(OverlayContainerViewController *)self view];
      v46 = [v48 topAnchor];
      v45 = [v47 constraintEqualToAnchor:v46 constant:-6.0];
      v53[0] = v45;
      v43 = [(DimmingContainerView *)self->_dimmingView bottomAnchor];
      v44 = [(OverlayContainerViewController *)self view];
      v42 = [v44 bottomAnchor];
      v41 = [v43 constraintEqualToAnchor:v42];
      v53[1] = v41;
      v38 = [(DimmingContainerView *)self->_dimmingView leadingAnchor];
      v40 = [(OverlayContainerViewController *)self view];
      v39 = [v40 leadingAnchor];
      v37 = [v38 constraintEqualToAnchor:v39];
      v53[2] = v37;
      v35 = [(DimmingContainerView *)self->_dimmingView trailingAnchor];
      v36 = [(OverlayContainerViewController *)self view];
      v34 = [v36 trailingAnchor];
      v33 = [v35 constraintEqualToAnchor:v34];
      v53[3] = v33;
      v32 = [(UIView *)self->_overlayView leadingAnchor];
      v31 = [v4 leadingAnchor];
      v30 = [v32 constraintEqualToAnchor:v31];
      v53[4] = v30;
      v23 = [(UIView *)self->_overlayView trailingAnchor];
      v24 = [v4 trailingAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      v53[5] = v25;
      v53[6] = self->_overlayToTopInsetConstraint;
      v26 = [(UIView *)self->_overlayView bottomAnchor];
      v27 = [v4 bottomAnchor];
      v28 = [v26 constraintEqualToAnchor:v27];
      v53[7] = v28;
      v29 = +[NSArray arrayWithObjects:v53 count:8];
      +[NSLayoutConstraint activateConstraints:v29];

      [(OverlayContainerViewController *)self updateContainerStyleDependentConstraints];
LABEL_15:
    }
  }
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v12 presentController:v10 animated:v8 useDefaultContaineeLayout:v7 completion:a6];
  if (objc_opt_respondsToSelector())
  {
    id v11 = v10;
    [v11 setBannerContainer:self];
    [(OverlayContainerViewController *)self viewControllerWantsTopBannerItemsUpdate:v11];
  }
  else
  {
    [(OverlayContainerViewController *)self updateTopBannerViewWithTopBannerItems:0];
  }
}

- (void)updateTopBannerViewWithTopBannerItems:(id)a3
{
  id v19 = a3;
  id v4 = [(TopBannerView *)self->_topBannerView items];
  id v5 = v19;
  if (v4 != v19)
  {
    uint64_t v6 = [(TopBannerView *)self->_topBannerView items];
    unsigned __int8 v7 = [v19 isEqualToArray:v6];

    BOOL v8 = v19;
    if (v7) {
      goto LABEL_12;
    }
    id v9 = [v19 count];
    topBannerView = self->_topBannerView;
    if (v9)
    {
      if (!topBannerView)
      {
        id v11 = [[TopBannerView alloc] initAllowingBlurredForButton:1];
        objc_super v12 = self->_topBannerView;
        self->_topBannerView = v11;

        v13 = [(ContainerViewController *)self blurGroupName];
        [(CardView *)self->_topBannerView setBlurGroupName:v13];

        [(TopBannerView *)self->_topBannerView setTranslatesAutoresizingMaskIntoConstraints:0];
        topBannerView = self->_topBannerView;
      }
      [(TopBannerView *)topBannerView setItems:v19];
      CGRect v14 = [(TopBannerView *)self->_topBannerView superview];

      if (!v14)
      {
        v15 = [(OverlayContainerViewController *)self overlayView];
        v16 = [(OverlayContainerViewController *)self topBannerView];
        [v15 addSubview:v16];

        v17 = [(OverlayContainerViewController *)self _topBannerViewConstraints];
        +[NSLayoutConstraint activateConstraints:v17];
      }
    }
    else
    {
      BOOL v18 = [(TopBannerView *)topBannerView superview];

      BOOL v8 = v19;
      if (!v18) {
        goto LABEL_12;
      }
      [(TopBannerView *)self->_topBannerView setItems:0];
      [(TopBannerView *)self->_topBannerView removeFromSuperview];
    }
    id v5 = [(OverlayContainerViewController *)self view];
    [v5 setNeedsLayout];
  }

  BOOL v8 = v19;
LABEL_12:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v4 viewDidAppear:a3];
  [(OverlayContainerViewController *)self setupConstraints];
}

- (void)setupConstraints
{
  if (!self->_topContentConstraint)
  {
    topContentView = self->_topContentView;
    long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v28[1] = v4;
    v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(UIView *)topContentView setTransform:v28];
    id v5 = [(UIView *)self->_topContentView topAnchor];
    uint64_t v6 = [(ContainerViewController *)self chromeViewController];
    unsigned __int8 v7 = [v6 viewportLayoutGuide];
    BOOL v8 = [v7 topAnchor];
    id v9 = [v5 constraintEqualToAnchor:v8];
    topContentConstraint = self->_topContentConstraint;
    self->_topContentConstraint = v9;

    id v11 = [(UIView *)self->_topContentView heightAnchor];
    objc_super v12 = [v11 constraintEqualToConstant:0.0];

    LODWORD(v13) = 1.0;
    v27 = v12;
    [v12 setPriority:v13];
    v29[0] = self->_topContentConstraint;
    v29[1] = v12;
    v26 = [(UIView *)self->_topDimmingView topAnchor];
    v25 = [(UIView *)self->_topContentView topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v29[2] = v24;
    v23 = [(UIView *)self->_topDimmingView bottomAnchor];
    CGRect v14 = [(UIView *)self->_topContentView bottomAnchor];
    v15 = [v23 constraintEqualToAnchor:v14];
    v29[3] = v15;
    v16 = [(UIView *)self->_topDimmingView leadingAnchor];
    v17 = [(UIView *)self->_topContentView leadingAnchor];
    BOOL v18 = [v16 constraintEqualToAnchor:v17];
    v29[4] = v18;
    id v19 = [(UIView *)self->_topDimmingView trailingAnchor];
    v20 = [(UIView *)self->_topContentView trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v29[5] = v21;
    v22 = +[NSArray arrayWithObjects:v29 count:6];
    +[NSLayoutConstraint activateConstraints:v22];

    [(OverlayContainerViewController *)self updateContainerStyleDependentConstraints];
  }
}

- (double)topLabelEdgeInset
{
  int BOOL = GEOConfigGetBOOL();
  if (GEOConfigGetBOOL()) {
    BOOL v4 = BOOL == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return 0.0;
  }

  [(ContainerViewController *)self statusBarHeight];
  return result;
}

- (TopBannerView)topBannerView
{
  return self->_topBannerView;
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  v13.receiver = self;
  v13.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController contentHeightUpdatedWithValue:](&v13, "contentHeightUpdatedWithValue:");
  unint64_t v5 = [(ContainerViewController *)self containerStyle];
  unint64_t v6 = [(ContainerViewController *)self containerStyle];
  if (v6 <= 7 && ((1 << v6) & 0xE3) != 0 && (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    [(OverlayContainerViewController *)self _updateDimmingViewsWithAlpha:0.0];
  }
  else
  {
    unsigned __int8 v7 = [(OverlayContainerViewController *)self dimmingBehaviour];
    [v7 overlayContainer:self dimmingPercentageForCurrentContaineeWithNewHeight:a3];
    double v9 = v8;

    if (![(ContainerViewController *)self transitioning] || vabdd_f64(0.0, v9) <= 2.22044605e-16) {
      [(OverlayContainerViewController *)self _updateDimmingViewsWithAlpha:v9];
    }
    if ([(ContainerViewController *)self transitioning])
    {
      id v10 = [(ContainerViewController *)self currentViewController];
      id v11 = [v10 cardPresentationController];
      unsigned int v12 = [v11 presentedModally];

      if (v12) {
        [(OverlayContainerViewController *)self _updateDimmingViewsWithAlpha:1 animated:v9];
      }
    }
  }
}

- (double)topEdgeInset
{
  [(NSLayoutConstraint *)self->_overlayToTopInsetConstraint constant];
  double v4 = v3;
  if ((id)[(ContainerViewController *)self containerStyle] == (id)1)
  {
    unint64_t v5 = [(OverlayContainerViewController *)self topContentView];
    [v5 frame];
    double MaxY = CGRectGetMaxY(v13);
    [(ContainerViewController *)self statusBarHeight];
    if (MaxY <= v7)
    {
      [(ContainerViewController *)self statusBarHeight];
      double v9 = v11;
    }
    else
    {
      double v8 = [(OverlayContainerViewController *)self topContentView];
      [v8 frame];
      double v9 = CGRectGetMaxY(v14);
    }
  }
  else
  {
    [(ContainerViewController *)self statusBarHeight];
    double v9 = v10;
  }
  return v9 - v4;
}

- (OverlayContainerDimmingBehaviour)dimmingBehaviour
{
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    double v3 = 0;
  }
  else
  {
    dimmingBehaviour = self->_dimmingBehaviour;
    if (!dimmingBehaviour)
    {
      unint64_t v5 = [OverlayContainerDimmingController alloc];
      unint64_t v6 = sub_10001F724(&stru_1012FF008);
      double v7 = [(OverlayContainerDimmingController *)v5 initWithDimmingBehaviour:v6 customBehaviours:0];
      double v8 = self->_dimmingBehaviour;
      self->_dimmingBehaviour = v7;

      dimmingBehaviour = self->_dimmingBehaviour;
    }
    double v3 = dimmingBehaviour;
  }

  return v3;
}

- (void)_updateDimmingViewsWithAlpha:(double)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D6390;
  v10[3] = &unk_1012EB730;
  v10[4] = self;
  unint64_t v5 = objc_retainBlock(v10);
  unint64_t v6 = [(ContainerViewController *)self containerStyle];
  v7.n128_u64[0] = 0;
  if (((1 << v6) & 0xE3) != 0) {
    double v8 = a3;
  }
  else {
    double v8 = 0.0;
  }
  if (((1 << v6) & 0xE3) != 0) {
    double v9 = 0.0;
  }
  else {
    double v9 = a3;
  }
  if (v6 <= 7)
  {
    v7.n128_f64[0] = v8;
    a3 = v9;
  }
  ((void (*)(void *, __n128))v5[2])(v5, v7);
  [(UIView *)self->_topDimmingView setAlpha:a3];
}

- (void)updateContainerStyleDependentConstraints
{
  double v3 = [(OverlayContainerViewController *)self topContentView];
  unsigned __int8 v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    unint64_t v5 = [(ContainerViewController *)self containerStyle];
    if (v5 >= 8 || (double v6 = 0.0, ((0xE3u >> v5) & 1) == 0)) {
      [(ContainerViewController *)self edgePadding];
    }
    [(NSLayoutConstraint *)self->_topContentConstraint setConstant:v6];
    if ([(NSArray *)self->_topContentHorizontalConstraints count]) {
      +[NSLayoutConstraint deactivateConstraints:self->_topContentHorizontalConstraints];
    }
    if ((id)[(ContainerViewController *)self containerStyle] == (id)6
      || (id)[(ContainerViewController *)self containerStyle] == (id)4)
    {
      __n128 v7 = [(ContainerViewController *)self containerView];
      double v8 = [v7 trailingAnchor];

      double v9 = [(OverlayContainerViewController *)self view];
    }
    else
    {
      double v10 = [(ContainerViewController *)self containerView];
      double v8 = [v10 leadingAnchor];

      double v9 = [(ContainerViewController *)self containerView];
    }
    double v11 = v9;
    unsigned int v12 = [v9 trailingAnchor];

    CGRect v13 = [(OverlayContainerViewController *)self overlayView];
    CGRect v14 = [v13 superview];

    if (!v14) {
      goto LABEL_18;
    }
    v15 = [(OverlayContainerViewController *)self topContentView];
    v16 = [v15 leadingAnchor];
    v17 = [v16 constraintEqualToAnchor:v8];
    v27 = v17;
    BOOL v18 = +[NSArray arrayWithObjects:&v27 count:1];
    id v19 = +[NSMutableArray arrayWithArray:v18];

    unint64_t topContentSizeStyle = self->_topContentSizeStyle;
    if (topContentSizeStyle == 1)
    {
      v21 = [(OverlayContainerViewController *)self topContentView];
      v22 = [v21 trailingAnchor];
      uint64_t v23 = [v22 constraintLessThanOrEqualToAnchor:v12];
    }
    else
    {
      if (topContentSizeStyle)
      {
LABEL_17:
        topContentHorizontalConstraints = self->_topContentHorizontalConstraints;
        self->_topContentHorizontalConstraints = v19;
        v26 = v19;

        +[NSLayoutConstraint activateConstraints:self->_topContentHorizontalConstraints];
LABEL_18:

        return;
      }
      v21 = [(OverlayContainerViewController *)self topContentView];
      v22 = [v21 trailingAnchor];
      uint64_t v23 = [v22 constraintEqualToAnchor:v12];
    }
    v24 = (void *)v23;
    [(NSArray *)v19 addObject:v23];

    goto LABEL_17;
  }
}

- (UIView)topContentView
{
  return self->_topContentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setDimmingBehaviour:(id)a3
{
}

- (UILayoutGuide)innerLayoutGuide
{
  return self->_innerLayoutGuide;
}

- (void)restoreDimmingViewAlphaCacheIfNeeded
{
  if (!self->_dimmingViewDisabled)
  {
    dimmingViewDisabledAlphaUpdateCache = self->_dimmingViewDisabledAlphaUpdateCache;
    if (dimmingViewDisabledAlphaUpdateCache)
    {
      [(NSNumber *)dimmingViewDisabledAlphaUpdateCache doubleValue];
      -[DimmingContainerView setAlpha:](self->_dimmingView, "setAlpha:");
      unsigned __int8 v4 = self->_dimmingViewDisabledAlphaUpdateCache;
      self->_dimmingViewDisabledAlphaUpdateCache = 0;
    }
  }
}

- (void)transitionEnded
{
  v3.receiver = self;
  v3.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v3 transitionEnded];
  [(OverlayContainerViewController *)self _updateDimming];
}

- (void)updateViewsForCustomPresentationTransition
{
  self->_dimmingViewDisabled = 1;
  dimmingView = self->_dimmingView;
  objc_super v3 = +[NSArray arrayWithObjects:&dimmingView count:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned __int8 v4 = [(OverlayContainerViewController *)self view];
  unint64_t v5 = [v4 subviews];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v3 containsObject:v10] & 1) == 0) {
          [v10 setAlpha:0.0];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  double v11 = [(ContainerViewController *)self chromeViewController];
  [v11 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

  unsigned int v12 = [(ContainerViewController *)self chromeViewController];
  [v12 setNeedsUpdateComponent:@"weatherOverlay" animated:1];

  CGRect v13 = [(ContainerViewController *)self chromeViewController];
  [v13 setNeedsUpdateComponent:@"floatingControls" animated:1];
}

- (void)updateViewsForCustomDismissalTransition
{
  self->_dimmingViewDisabled = 0;
  dimmingView = self->_dimmingView;
  objc_super v3 = +[NSArray arrayWithObjects:&dimmingView count:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned __int8 v4 = [(OverlayContainerViewController *)self view];
  unint64_t v5 = [v4 subviews];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v3 containsObject:v10] & 1) == 0) {
          [v10 setAlpha:1.0];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(OverlayContainerViewController *)self restoreDimmingViewAlphaCacheIfNeeded];
  double v11 = [(ContainerViewController *)self chromeViewController];
  [v11 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

  unsigned int v12 = [(ContainerViewController *)self chromeViewController];
  [v12 setNeedsUpdateComponent:@"weatherOverlay" animated:1];

  CGRect v13 = [(ContainerViewController *)self chromeViewController];
  [v13 setNeedsUpdateComponent:@"floatingControls" animated:1];
}

- (UIView)passThroughView
{
  v2 = [(ContainerViewController *)self chromeViewController];
  objc_super v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)OverlayContainerViewController;
  [(ContainerViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)OverlayContainerViewController;
  id v7 = a4;
  -[ContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007CF0E0;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:&stru_1012F90F0 completion:v8];
}

- (void)applyTransitionWithProgress:(double)a3
{
  v40.receiver = self;
  v40.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController applyTransitionWithProgress:](&v40, "applyTransitionWithProgress:");
  unint64_t v5 = [(OverlayContainerViewController *)self overlayView];
  [v5 setAlpha:a3];

  id v6 = [(OverlayContainerViewController *)self topContentView];
  [v6 frame];
  CGFloat MaxY = CGRectGetMaxY(v42);
  double v8 = 1.0 - a3;
  CGAffineTransformMakeTranslation(&v39, 0.0, -(MaxY * v8));
  objc_super v9 = [(OverlayContainerViewController *)self topContentView];
  CGAffineTransform v38 = v39;
  [v9 setTransform:&v38];

  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v37.c = v10;
  *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  p_modeTransitiontransform = &self->_modeTransitiontransform;
  long long v12 = *(_OWORD *)&self->_modeTransitiontransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_modeTransitiontransform.a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_modeTransitiontransform.tx;
  *(_OWORD *)&t2.a = *(_OWORD *)&v37.a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&v37.tx;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if ((id)[(ContainerViewController *)self containerStyle] == (id)6)
    {
      CGRect v13 = [(OverlayContainerViewController *)self view];
      int v14 = [v13 effectiveUserInterfaceLayoutDirection] == (id)1;

      unsigned int v15 = [(ContainerViewController *)self stackOnOppositeSide];
      long long v16 = [(ContainerViewController *)self containerView];
      [v16 frame];
      if (v14 == v15) {
        double v21 = -(CGRectGetMaxX(*(CGRect *)&v17) * v8);
      }
      else {
        double v21 = v8 * CGRectGetMinX(*(CGRect *)&v17);
      }
      double v22 = 0.0;
    }
    else
    {
      long long v16 = [(ContainerViewController *)self containerView];
      [v16 frame];
      double v22 = v8 * CGRectGetHeight(v43);
      double v21 = 0.0;
    }
    CGAffineTransformMakeTranslation(&v37, v21, v22);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = [(ContainerViewController *)self visibleCardViews];
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v27);
        CGAffineTransform v30 = v37;
        [v28 setTransform:&v30];
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v25);
  }

  long long v29 = *(_OWORD *)&v37.c;
  *(_OWORD *)&p_modeTransitiontransform->a = *(_OWORD *)&v37.a;
  *(_OWORD *)&p_modeTransitiontransform->c = v29;
  *(_OWORD *)&p_modeTransitiontransform->tx = *(_OWORD *)&v37.tx;
}

- (void)_dismissAction:(id)a3
{
  unsigned __int8 v4 = [(OverlayContainerViewController *)self dimmingBehaviour];
  id v5 = [v4 overlayContainerLayoutForContaineeDimmingDismissal:self];

  id v7 = [(ContainerViewController *)self currentViewController];
  id v6 = [v7 cardPresentationController];
  [v6 wantsLayout:v5];
}

- (void)setTopContentSizeStyle:(unint64_t)a3
{
  if (self->_topContentSizeStyle != a3)
  {
    self->_unint64_t topContentSizeStyle = a3;
    [(OverlayContainerViewController *)self updateContainerStyleDependentConstraints];
  }
}

- (void)viewControllerWantsTopBannerItemsUpdate:(id)a3
{
  id v7 = a3;
  id v4 = [(ContainerViewController *)self currentViewController];

  id v5 = v7;
  if (v4 == v7)
  {
    id v6 = [v7 topBannerItems];
    [(OverlayContainerViewController *)self updateTopBannerViewWithTopBannerItems:v6];

    id v5 = v7;
  }
}

- (id)_topBannerViewConstraints
{
  if (self->_topBannerView)
  {
    objc_super v3 = +[NSMutableArray array];
    id v4 = [(OverlayContainerViewController *)self _topBannerViewHorizontalConstraints];
    [v3 addObjectsFromArray:v4];

    id v5 = [(OverlayContainerViewController *)self topBannerView];
    id v6 = [v5 topAnchor];
    id v7 = [(UILayoutGuide *)self->_innerLayoutGuide topAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7];
    [v3 addObject:v8];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (NSArray)_topBannerViewHorizontalConstraints
{
  int v14 = [(OverlayContainerViewController *)self topBannerView];
  objc_super v3 = [v14 leadingAnchor];
  id v4 = [(OverlayContainerViewController *)self overlayView];
  id v5 = [v4 leadingAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5 constant:sub_1000BBAF8()];
  v15[0] = v6;
  id v7 = [(OverlayContainerViewController *)self topBannerView];
  double v8 = [v7 trailingAnchor];
  objc_super v9 = [(OverlayContainerViewController *)self overlayView];
  long long v10 = [v9 trailingAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10 constant:-sub_1000BBAF8()];
  v15[1] = v11;
  long long v12 = +[NSArray arrayWithObjects:v15 count:2];

  return (NSArray *)v12;
}

- (double)_topBannerMaxHeight
{
  return 150.0;
}

- (void)setTopBannerView:(id)a3
{
}

- (unint64_t)topContentSizeStyle
{
  return self->_topContentSizeStyle;
}

- (void)setInnerLayoutGuide:(id)a3
{
}

- (NSArray)innerLayoutGuideConstraints
{
  return self->_innerLayoutGuideConstraints;
}

- (void)setInnerLayoutGuideConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingBehaviour, 0);
  objc_storeStrong((id *)&self->_innerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_topBannerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_topContentView, 0);
  objc_storeStrong((id *)&self->_topDimmingView, 0);
  objc_storeStrong((id *)&self->_dimmingViewDisabledAlphaUpdateCache, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_overlayToTopInsetConstraint, 0);
  objc_storeStrong((id *)&self->_topContentHorizontalConstraints, 0);

  objc_storeStrong((id *)&self->_topContentConstraint, 0);
}

@end