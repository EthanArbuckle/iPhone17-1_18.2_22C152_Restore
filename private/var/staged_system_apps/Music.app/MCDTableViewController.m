@interface MCDTableViewController
+ (BOOL)wantsTallCells;
+ (id)addAlbumArtViewWithImage:(id)a3 radiusKind:(unint64_t)a4 toCell:(id)a5;
+ (void)addLeadingView:(id)a3 toCell:(id)a4;
+ (void)removeImageFromCell:(id)a3;
+ (void)setPlaceholderImage:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5 toCell:(id)a6;
- (BOOL)alwaysHideNowPlayingButton;
- (BOOL)alwaysShowNavBar;
- (BOOL)currentAppIsPlaying;
- (BOOL)hasRowsToDisplay;
- (BOOL)limitedUI;
- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)topLevel;
- (BOOL)viewHasAppeared;
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (MCDTableViewController)initWithLimitedUI:(BOOL)a3;
- (UIColor)tintColor;
- (id)preferredFocusEnvironments;
- (id)viewControllerForRowAtIndexPath:(id)a3;
- (void)_nowPlayingButtonTapped:(id)a3;
- (void)_nowPlayingDidChangeNotification:(id)a3;
- (void)_updateNowPlayingPlayingVisibilityWithCompletionHandler:(id)a3;
- (void)_updateNowPlayingVisibility;
- (void)loadView;
- (void)setAlwaysHideNowPlayingButton:(BOOL)a3;
- (void)setAlwaysShowNavBar:(BOOL)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTopLevel:(BOOL)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDTableViewController

- (MCDTableViewController)initWithLimitedUI:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCDTableViewController;
  v4 = [(MCDTableViewController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_limitedUI = a3;
    v4->_alwaysHideNowPlayingButton = 0;
    [(MCDTableViewController *)v4 setClearsSelectionOnViewWillAppear:1];
  }
  return v5;
}

- (void)loadView
{
  v3 = -[MCDTableView initWithFrame:style:]([MCDTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MCDTableView *)v3 setDataSource:self];
  [(MCDTableView *)v3 setDelegate:self];
  [(MCDTableViewController *)self setView:v3];
}

- (void)setLimitedUI:(BOOL)a3
{
  self->_limitedUI = a3;
  if ([(MCDTableViewController *)self viewHasAppeared])
  {
    v4 = [(MCDTableViewController *)self tableView];
    v5 = [v4 superview];
    v6 = [v5 snapshotViewAfterScreenUpdates:0];

    objc_super v7 = [(MCDTableViewController *)self tableView];
    v8 = [v7 superview];
    [v8 bounds];
    [v6 setFrame:];

    v9 = [(MCDTableViewController *)self tableView];
    v10 = [v9 superview];
    [v10 addSubview:v6];
  }
  else
  {
    v6 = 0;
  }
  [(MCDTableViewController *)self _limitedUIDidChange];
  v11 = [(MCDTableViewController *)self tableView];
  [v11 reloadData];

  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100097E18;
    v14[3] = &unk_100FC3900;
    id v15 = v6;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100097E24;
    v12[3] = &unk_100FC3A90;
    id v13 = v15;
    +[UIView animateWithDuration:v14 animations:v12 completion:0.4];
  }
}

+ (void)removeImageFromCell:(id)a3
{
  id v3 = a3;
  [v3 setSeparatorInset:UITableViewAutomaticDimension, UITableViewAutomaticDimension, UITableViewAutomaticDimension, UITableViewAutomaticDimension];
  id v5 = [v3 viewWithTag:1000];

  v4 = v5;
  if (v5)
  {
    [v5 removeFromSuperview];
    v4 = v5;
  }
}

+ (void)setPlaceholderImage:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5 toCell:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 artworkImageView];
  if (v17)
  {
    [v12 sizeForArtwork];
    [v12 setSeparatorInset:CGRectMake(0.0, v14 + 4.0 + 8.0, 0.0, 0.0)];
    if (!v13)
    {
      id v13 = [objc_alloc((Class)UIImageView) initWithImage:v17];
      [v13 setTag:1000];
    }
    [a1 addLeadingView:v13 toCell:v12];
    [v13 setContentMode:4];
    [v12 sizeForArtwork];
    v16 = +[UIImageSymbolConfiguration configurationWithPointSize:v15 * 0.5];
    [v13 setPreferredSymbolConfiguration:v16];

    [v12 setPlaceholderTintColor:v10];
    [v12 setPlaceholderHighlightedTintColor:v11];
  }
}

+ (void)addLeadingView:(id)a3 toCell:(id)a4
{
  id v25 = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v25 sizeForArtwork];
    double v7 = v6;
  }
  else
  {
    double v7 = 36.0;
  }
  [v5 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  [v25 addSubview:v5];
  [v25 setSeparatorInset:0.0, v7 + 4.0 + 8.0, 0.0, 0.0];
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  CGFloat v16 = (v7 - CGRectGetWidth(v27)) * 0.5 + 4.0;
  [v25 frame];
  CGFloat v17 = CGRectGetHeight(v28) * 0.5 - v15 * 0.5;
  v18 = [v5 layer];
  [v18 setContentsGravity:kCAGravityResizeAspect];

  id v19 = [v25 effectiveUserInterfaceLayoutDirection];
  v20 = [v25 contentView];
  [v20 frame];
  [v5 setFrame:sub_1000B4CA8((uint64_t)v19, v16, v17, v13, v15, v21, v22, v23, v24)];
}

+ (id)addAlbumArtViewWithImage:(id)a3 radiusKind:(unint64_t)a4 toCell:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  CGFloat v9 = v8;
  id v10 = 0;
  if (v7 && v8)
  {
    CGFloat v11 = [v8 artworkImageView];
    double v12 = v11;
    if (v11) {
      [v11 removeFromSuperview];
    }
    [v9 sizeForArtwork];
    double v14 = v13;
    [v9 setSeparatorInset:CGRectMake(0.0, v13 + 4.0 + 8.0, 0.0, 0.0)];
    id v10 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v10 setTag:1000];
    if ([v7 renderingMode] == (id)2)
    {
      [v10 setImage:v7];
      double v15 = +[UIColor _externalSystemWhiteColor];
      [v10 setTintColor:v15];

      [v10 setContentMode:4];
    }
    else
    {
      [v10 setContentMode:1];
      [v10 setImage:v7];
    }
    [v10 setClipsToBounds:1];
    if (a4 == 1)
    {
      CGFloat v17 = [v10 layer];
      [v17 setCornerRadius:v14 * 0.5];
    }
    else
    {
      if (a4)
      {
LABEL_13:
        id v18 = [v9 effectiveUserInterfaceLayoutDirection];
        id v19 = [v9 contentView];
        [v19 frame];
        [v10 setFrame:sub_1000B4CA8((uint64_t)v18, 4.0, 4.0, v14, v14, v20, v21, v22, v23)];

        [v10 setContentMode:1];
        [v9 addSubview:v10];

        goto LABEL_14;
      }
      CGFloat v16 = [v10 layer];
      [v16 setCornerRadius:4.5];

      CGFloat v17 = [v10 layer];
      [v17 setCornerCurve:kCACornerCurveContinuous];
    }

    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (BOOL)hasRowsToDisplay
{
  unsigned int v3 = [(MCDTableViewController *)self isViewLoaded];
  if (v3)
  {
    v4 = [(MCDTableViewController *)self tableView];
    uint64_t v5 = (uint64_t)[v4 numberOfSections];

    uint64_t v6 = v5 - 1;
    if (v5 < 1)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      uint64_t v7 = 0;
      do
      {
        id v8 = [(MCDTableViewController *)self tableView];
        id v9 = [v8 numberOfRowsInSection:v7];

        LOBYTE(v3) = (uint64_t)v9 > 0;
        if ((uint64_t)v9 > 0) {
          break;
        }
      }
      while (v6 != v7++);
    }
  }
  return v3;
}

+ (BOOL)wantsTallCells
{
  return 0;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = [(MCDTableViewController *)self tableView];
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = v3;
    uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MCDTableViewController;
    uint64_t v5 = [(MCDTableViewController *)&v8 preferredFocusEnvironments];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)MCDTableViewController;
  [(MCDTableViewController *)&v14 viewDidLoad];
  [(MCDTableViewController *)self _setFilteredDataType:1];
  uint64_t v3 = [(MCDTableViewController *)self tableView];
  [v3 setRowHeight:UITableViewAutomaticDimension];

  v4 = [(MCDTableViewController *)self tableView];
  [v4 setEstimatedRowHeight:UITableViewAutomaticDimension];

  uint64_t v5 = [(MCDTableViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = +[_MCDReusableCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  objc_super v8 = [(MCDTableViewController *)self tableView];
  uint64_t v9 = objc_opt_class();
  id v10 = +[_MCDReusableCell reuseIdentifier];
  [v8 registerClass:v9 forCellReuseIdentifier:v10];

  CGFloat v11 = [(MCDTableViewController *)self tableView];
  [v11 setShowsHorizontalScrollIndicator:0];

  double v12 = [(MCDTableViewController *)self tableView];
  [v12 setShowsVerticalScrollIndicator:0];

  double v13 = [(MCDTableViewController *)self tableView];
  [v13 setRemembersLastFocusedIndexPath:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)MCDTableViewController;
  [(MCDTableViewController *)&v22 viewWillAppear:a3];
  unsigned int v4 = [(MCDTableViewController *)self alwaysShowNavBar];
  uint64_t v5 = [(MCDTableViewController *)self navigationController];
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 setNavigationBarHidden:0 animated:1];
  }
  else
  {
    uint64_t v7 = [(MCDTableViewController *)self navigationController];
    objc_super v8 = [v7 viewControllers];
    [v6 setNavigationBarHidden:([v8 count] < 2) animated:1];
  }
  if (!self->_nowPlayingButton)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v9 = (id *)qword_1010D6E18;
    v31 = (void *)qword_1010D6E18;
    if (!qword_1010D6E18)
    {
      CGFloat v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      id v25 = sub_100027EF4;
      v26 = &unk_100FC34A0;
      CGRect v27 = &v28;
      id v10 = (void *)sub_100029670();
      CGFloat v11 = dlsym(v10, "MCDMusicBundleIdentifier");
      *(void *)(v27[1] + 24) = v11;
      qword_1010D6E18 = *(void *)(v27[1] + 24);
      uint64_t v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (v9)
    {
      id v12 = *v9;
      double v13 = self;
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      objc_super v14 = (void (*)(id, MCDTableViewController *, const char *))off_1010D6E08;
      v31 = off_1010D6E08;
      if (!off_1010D6E08)
      {
        CGFloat v23 = _NSConcreteStackBlock;
        uint64_t v24 = 3221225472;
        id v25 = sub_1000991CC;
        v26 = &unk_100FC34A0;
        CGRect v27 = &v28;
        double v15 = (void *)sub_100029670();
        CGFloat v16 = dlsym(v15, "MCDGetNowPlayingButton");
        *(void *)(v27[1] + 24) = v16;
        off_1010D6E08 = *(_UNKNOWN **)(v27[1] + 24);
        objc_super v14 = (void (*)(id, MCDTableViewController *, const char *))v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (v14)
      {
        v14(v12, v13, "_nowPlayingButtonTapped:");
        CGFloat v17 = (UIButton *)objc_claimAutoreleasedReturnValue();

        nowPlayingButton = self->_nowPlayingButton;
        self->_nowPlayingButton = v17;

        id v19 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_nowPlayingButton];
        CGFloat v20 = [(MCDTableViewController *)v13 navigationItem];
        [v20 setRightBarButtonItem:v19];

        goto LABEL_12;
      }
    }
    else
    {
      sub_100D691B8();
    }
    CGFloat v21 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v28, 8);
    _Unwind_Resume(v21);
  }
LABEL_12:
  [(MCDTableViewController *)self _updateNowPlayingVisibility];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCDTableViewController;
  -[MCDTableViewController viewDidAppear:](&v10, "viewDidAppear:");
  uint64_t v5 = [(MCDTableViewController *)self transitionCoordinator];
  uint64_t v6 = v5;
  if (v5 && [v5 initiallyInteractive])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100098AE8;
    v8[3] = &unk_100FC3AB8;
    v8[4] = self;
    BOOL v9 = v3;
    [v6 notifyWhenInteractionChangesUsingBlock:v8];
  }
  else
  {
    uint64_t v7 = [(MCDTableViewController *)self tableView];
    sub_100098B58(v7, v3);
  }
  [(MCDTableViewController *)self setViewHasAppeared:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDTableViewController;
  [(MCDTableViewController *)&v9 viewWillDisappear:a3];
  unsigned int v4 = [(MCDTableViewController *)self alwaysShowNavBar];
  uint64_t v5 = [(MCDTableViewController *)self navigationController];
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 setNavigationBarHidden:0 animated:1];
  }
  else
  {
    uint64_t v7 = [(MCDTableViewController *)self navigationController];
    objc_super v8 = [v7 viewControllers];
    [v6 setNavigationBarHidden:[v8 count] < 2 animated:1];
  }
  [(MCDTableViewController *)self setViewHasAppeared:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(MCDTableViewController *)self viewControllerForRowAtIndexPath:a4];
  if (v5)
  {
    id v7 = v5;
    [v5 setPlayActivityFeatureNameSourceViewController:self];
    uint64_t v6 = [(MCDTableViewController *)self navigationController];
    [v6 pushViewController:v7 animated:1];

    uint64_t v5 = v7;
  }
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 nextFocusedView];
  objc_super v8 = [v6 nextFocusedIndexPath];

  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) == 0
     || (v9 = [v8 section], (objc_super v10 = (char *)objc_msgSend(v8, "row")) == 0)
     || v10 == (char *)[v5 numberOfRowsInSection:v9] - 1;

  return v11;
}

- (void)_nowPlayingDidChangeNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100098EEC;
  v3[3] = &unk_100FC3A90;
  v3[4] = self;
  [(MCDTableViewController *)self _updateNowPlayingPlayingVisibilityWithCompletionHandler:v3];
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  id v5 = +[MCDMusicNowPlayingViewController musicNowPlayingViewController];
  [v5 setPlayActivityFeatureNameSourceViewController:self];
  unsigned int v4 = [(MCDTableViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)_updateNowPlayingPlayingVisibilityWithCompletionHandler:(id)a3
{
  id v10 = a3;
  unsigned int v4 = +[MusicCarPlayManager sharedManager];
  id v5 = [v4 nowPlayingContentManager];
  id v6 = [v5 currentPlayingSong];

  unsigned int v7 = [(MCDTableViewController *)self alwaysHideNowPlayingButton];
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 1;
  }
  [(UIButton *)self->_nowPlayingButton setHidden:v8];
  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v6 != 0);
    id v9 = v10;
  }
}

- (void)_updateNowPlayingVisibility
{
}

- (BOOL)currentAppIsPlaying
{
  if ([(UIButton *)self->_nowPlayingButton isHidden]) {
    return 0;
  }
  BOOL v3 = +[MusicCarPlayManager sharedManager];
  unsigned int v4 = [v3 nowPlayingContentManager];
  id v5 = [v4 currentPlayingSong];
  BOOL v2 = v5 != 0;

  return v2;
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (BOOL)alwaysShowNavBar
{
  return self->_alwaysShowNavBar;
}

- (void)setAlwaysShowNavBar:(BOOL)a3
{
  self->_alwaysShowNavBar = a3;
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (BOOL)topLevel
{
  return self->_topLevel;
}

- (void)setTopLevel:(BOOL)a3
{
  self->_topLevel = a3;
}

- (BOOL)alwaysHideNowPlayingButton
{
  return self->_alwaysHideNowPlayingButton;
}

- (void)setAlwaysHideNowPlayingButton:(BOOL)a3
{
  self->_alwaysHideNowPlayingButton = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_nowPlayingButton, 0);
}

@end