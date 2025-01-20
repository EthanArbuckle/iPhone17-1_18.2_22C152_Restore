@interface BKEndOfBookCardViewController
- (BAUpSellData)upSellData;
- (BCSheetTransitioningCardContent)transitioningCardContent;
- (BKEndOfBookCardViewController)initWithStoreID:(id)a3 resource:(id)a4;
- (BKEndOfBookCardViewControllerDelegate)delegate;
- (BOOL)bc_alwaysUseCoverTransitionForCardPresenting;
- (BOOL)bc_canCloseAsset;
- (BSUIFeedNavigationController)cardNavigationController;
- (BSUIFeedViewController)currentFeedViewController;
- (CGSize)cardSize;
- (NSDictionary)optionsForUIScene;
- (NSDictionary)resource;
- (NSString)storeID;
- (UIView)closeButton;
- (id)_optionsForUIScene:(BOOL)a3;
- (id)options;
- (id)serializeUpSellData;
- (unint64_t)supportedInterfaceOrientations;
- (void)_anchorCloseButton:(id)a3 toView:(id)a4;
- (void)bc_closeAssetWithCardStackViewController:(id)a3 completion:(id)a4;
- (void)bc_closeToAssetWithCardStackViewController:(id)a3 completion:(id)a4;
- (void)closeCard;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setResource:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setUpSellData:(id)a3;
- (void)updateCardSize;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKEndOfBookCardViewController

- (BKEndOfBookCardViewController)initWithStoreID:(id)a3 resource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKEndOfBookCardViewController;
  v8 = [(BKEndOfBookCardViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(BKEndOfBookCardViewController *)v8 setStoreID:v6];
    [(BKEndOfBookCardViewController *)v9 setResource:v7];
    [(BKEndOfBookCardViewController *)v9 setDefinesPresentationContext:1];
    -[BKEndOfBookCardViewController setPreferredContentSize:](v9, "setPreferredContentSize:", 540.0, 746.0);
    [(BKEndOfBookCardViewController *)v9 setModalPresentationStyle:2];
  }

  return v9;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)BKEndOfBookCardViewController;
  [(BKEndOfBookCardViewController *)&v26 viewDidLoad];
  id v3 = objc_alloc((Class)BSUIFeedViewController);
  v4 = [(BKEndOfBookCardViewController *)self options];
  id v5 = [v3 initWithOptions:v4];

  id v6 = [objc_alloc((Class)BSUIFeedNavigationController) initWithOptions:0];
  id v27 = v5;
  id v7 = +[NSArray arrayWithObjects:&v27 count:1];
  [v6 setViewControllers:v7];

  [(BKEndOfBookCardViewController *)self addChildViewController:v6];
  v8 = [(BKEndOfBookCardViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v6 view];
  [v17 setFrame:v10, v12, v14, v16];

  v18 = [(BKEndOfBookCardViewController *)self view];
  v19 = [v6 view];
  [v18 addSubview:v19];

  [v6 didMoveToParentViewController:self];
  [v6 setDelegate:self];
  cardNavigationController = self->_cardNavigationController;
  self->_cardNavigationController = (BSUIFeedNavigationController *)v6;
  id v21 = v6;

  v22 = +[UIButton buttonWithType:7];
  v23 = [(BKEndOfBookCardViewController *)self view];
  [v23 addSubview:v22];

  v24 = [(BKEndOfBookCardViewController *)self view];
  [(BKEndOfBookCardViewController *)self _anchorCloseButton:v22 toView:v24];

  [(UIView *)v22 addTarget:self action:"_closeButtonTapped:" forControlEvents:64];
  [(UIView *)v22 _accessibilitySetSortPriority:999];
  closeButton = self->_closeButton;
  self->_closeButton = v22;
}

- (id)_optionsForUIScene:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKEndOfBookCardViewController *)self upSellData];

  id v6 = off_100A3C000;
  if (v5)
  {
    BOOL v23 = v3;
    v26[0] = BAUpSellLocationKey;
    id v7 = off_100A3C000;
    v8 = [(BKEndOfBookCardViewController *)self upSellData];
    double v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 location]);
    v27[0] = v9;
    v26[1] = BAUpSellVariantKey;
    double v10 = [(BKEndOfBookCardViewController *)self upSellData];
    double v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 variant]);
    v27[1] = v11;
    v26[2] = BAUpSellVariantVersionKey;
    double v12 = [(BKEndOfBookCardViewController *)self upSellData];
    double v13 = [v12 variantVersion];
    if (v13)
    {
      id v7 = [(BKEndOfBookCardViewController *)self upSellData];
      [v7 variantVersion];
    }
    else
    {
      +[NSNull null];
    double v14 = };
    v27[2] = v14;
    id v5 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    if (v13)
    {

      double v14 = v7;
    }

    id v6 = off_100A3C000;
    BOOL v3 = v23;
  }
  v24[0] = BSUIFeedOptionsKeyContextMenuProvider;
  if (v3) {
    +[NSNull null];
  }
  else {
  double v15 = +[BKContextMenuProvider sharedProvider];
  }
  v25[0] = v15;
  v25[1] = &__kCFBooleanTrue;
  v24[1] = @"end-of-book-card";
  v24[2] = @"storeId";
  double v16 = [(BKEndOfBookCardViewController *)self storeID];
  v25[2] = v16;
  v24[3] = @"resource";
  v17 = [(BKEndOfBookCardViewController *)self resource];
  v18 = v17;
  if (!v17)
  {
    v18 = +[NSNull null];
  }
  v25[3] = v18;
  v24[4] = @"upSellData";
  v19 = [(BKEndOfBookCardViewController *)self serializeUpSellData];
  v25[4] = v19;
  v24[5] = @"rawUpSellData";
  v20 = v5;
  if (!v5)
  {
    v20 = +[NSNull null];
  }
  v25[5] = v20;
  id v21 = [(__objc2_class *)v6[236] dictionaryWithObjects:v25 forKeys:v24 count:6];
  if (!v5) {

  }
  if (!v17) {

  }
  return v21;
}

- (id)options
{
  return [(BKEndOfBookCardViewController *)self _optionsForUIScene:0];
}

- (NSDictionary)optionsForUIScene
{
  return (NSDictionary *)[(BKEndOfBookCardViewController *)self _optionsForUIScene:1];
}

- (id)serializeUpSellData
{
  v2 = self;
  v12[0] = BAUpSellLocationKey;
  BOOL v3 = [(BKEndOfBookCardViewController *)self upSellData];
  v4 = +[BAUtilities stringFromUpSellLocation:](BAUtilities, "stringFromUpSellLocation:", [v3 location]);
  v13[0] = v4;
  v12[1] = BAUpSellVariantKey;
  id v5 = [v2 upSellData];
  id v6 = +[BAUtilities stringFromUpSellVariant:](BAUtilities, "stringFromUpSellVariant:", [v5 variant]);
  v13[1] = v6;
  v12[2] = BAUpSellVariantVersionKey;
  id v7 = [v2 upSellData];
  v8 = [v7 variantVersion];
  if (v8)
  {
    v2 = [v2 upSellData];
    [v2 variantVersion];
  }
  else
  {
    +[NSNull null];
  double v9 = };
  v13[2] = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v8)
  {

    double v9 = v2;
  }

  return v10;
}

- (void)viewWillLayoutSubviews
{
  if (([(BKEndOfBookCardViewController *)self isBeingPresented] & 1) == 0
    && ([(BKEndOfBookCardViewController *)self isBeingDismissed] & 1) == 0)
  {
    [(BKEndOfBookCardViewController *)self updateCardSize];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (!isPad()) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKEndOfBookCardViewController;
  return [(BKEndOfBookCardViewController *)&v4 supportedInterfaceOrientations];
}

- (BSUIFeedNavigationController)cardNavigationController
{
  [(BKEndOfBookCardViewController *)self loadViewIfNeeded];
  cardNavigationController = self->_cardNavigationController;

  return cardNavigationController;
}

- (CGSize)cardSize
{
  v2 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  BOOL v3 = [v2 view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateCardSize
{
  BOOL v3 = [(BKEndOfBookCardViewController *)self view];
  [v3 bounds];
  CGRectGetCenterNoRounding();
  double v5 = v4;
  double v7 = v6;
  double v8 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  double v9 = [v8 view];
  [v9 setCenter:v5, v7];

  id v22 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  double v10 = [v22 view];
  [v10 bounds];
  double v11 = [(BKEndOfBookCardViewController *)self view];
  [v11 bounds];
  CGRectMakeWithOriginSize();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  id v21 = [v20 view];
  [v21 setBounds:v13, v15, v17, v19];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKEndOfBookCardViewController;
  id v7 = a4;
  -[BKEndOfBookCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100127F24;
  v8[3] = &unk_100A44DA8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)closeCard
{
  BOOL v3 = [(BKEndOfBookCardViewController *)self delegate];
  id v8 = v3;
  if (v3)
  {
    [v3 endOfBookCardViewControllerDidFinish:self];
  }
  else
  {
    double v4 = [(BKEndOfBookCardViewController *)self cardNavigationController];
    double v5 = [v4 currentFeedViewController];
    double v6 = [(BKEndOfBookCardViewController *)self presentingViewController];
    [v5 cardStackViewController:0 parentCardWillDismissWithReason:1 targetViewController:v6];

    id v7 = [(BKEndOfBookCardViewController *)self presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_anchorCloseButton:(id)a3 toView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [v6 topAnchor];
  id v8 = [v5 topAnchor];
  objc_super v9 = [v7 constraintEqualToAnchor:v8 constant:16.0];
  v14[0] = v9;
  double v10 = [v6 trailingAnchor];

  double v11 = [v5 trailingAnchor];

  double v12 = [v10 constraintEqualToAnchor:v11 constant:-16.0];
  v14[1] = v12;
  double v13 = +[NSArray arrayWithObjects:v14 count:2];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (BCSheetTransitioningCardContent)transitioningCardContent
{
  BOOL v3 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  double v4 = [v3 viewControllers];
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    id v6 = [(BKEndOfBookCardViewController *)self cardNavigationController];
    id v7 = [v6 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCSheetTransitioningCardContent];
  }
  else
  {
    id v7 = 0;
  }

  return (BCSheetTransitioningCardContent *)v7;
}

- (BOOL)bc_alwaysUseCoverTransitionForCardPresenting
{
  return 1;
}

- (BOOL)bc_canCloseAsset
{
  return 1;
}

- (void)bc_closeToAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKEndOfBookCardViewController *)self delegate];
  [v8 endOfBookCardViewControllerWantsToCloseToAsset:self cardStackViewController:v7 completion:v6];
}

- (void)bc_closeAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKEndOfBookCardViewController *)self delegate];
  [v8 endOfBookCardViewControllerWantsToCloseAsset:self cardStackViewController:v7 completion:v6];
}

- (BSUIFeedViewController)currentFeedViewController
{
  v2 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  BOOL v3 = [v2 currentFeedViewController];

  return (BSUIFeedViewController *)v3;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [(BKEndOfBookCardViewController *)self cardNavigationController];
  double v10 = [v9 childViewControllers];
  id v11 = [v10 firstObject];

  double v12 = [v8 transitionCoordinator];

  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10012847C;
    v15[3] = &unk_100A478E8;
    v15[4] = self;
    BOOL v16 = v11 != v7;
    [v12 animateAlongsideTransition:v15 completion:0];
  }
  else
  {
    if (v11 == v7) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    double v14 = [(BKEndOfBookCardViewController *)self closeButton];
    [v14 setAlpha:v13];
  }
}

- (BAUpSellData)upSellData
{
  return self->_upSellData;
}

- (void)setUpSellData:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (BKEndOfBookCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKEndOfBookCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)closeButton
{
  return self->_closeButton;
}

- (NSDictionary)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);

  objc_storeStrong((id *)&self->_cardNavigationController, 0);
}

@end