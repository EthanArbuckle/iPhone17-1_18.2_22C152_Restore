@interface LookAroundButtonContainerViewController
+ (BOOL)isIncompleteMapItem:(id)a3;
+ (CGSize)sizeForPreviewSize:(int64_t)a3;
+ (double)expandedHeight;
+ (int64_t)previewSizeWithContainerStyle:(unint64_t)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)isMarkedLocation;
- (CGAffineTransform)_collapsedPreviewTransform;
- (CGAffineTransform)_expandedButtonTransform;
- (CGSize)_buttonSize;
- (CGSize)_previewSize;
- (LookAroundButtonContainerViewControllerDelegate)delegate;
- (MKMapItem)mapItem;
- (id)_buttonTintColorForExpanded:(BOOL)a3;
- (unint64_t)containerStyle;
- (void)_applyViewPropertiesForState:(int64_t)a3;
- (void)_invalidateConstraints;
- (void)_loadLookAroundContainerView;
- (void)_unloadLookAroundContainerView;
- (void)_updateBadgeLayout;
- (void)_updateConstraints;
- (void)setContainerStyle:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMarkedLocation:(BOOL)a3;
- (void)setMapItem:(id)a3 isMarkedLocation:(BOOL)a4 willChangeHidden:(BOOL)a5 animated:(BOOL)a6;
- (void)tappedLookAroundButton:(id)a3;
- (void)tappedLookAroundPreview:(id)a3;
- (void)updateLookAroundViewWithMapItem:(id)a3 isMarkedLocation:(BOOL)a4 willChangeHidden:(BOOL)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation LookAroundButtonContainerViewController

- (void)_updateBadgeLayout
{
  v3 = +[UIDevice currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] != (id)5;

  lookAroundContainerView = self->_lookAroundContainerView;

  [(MKLookAroundContainerView *)lookAroundContainerView setBadgeOnLeadingEdge:v4];
}

- (id)_buttonTintColorForExpanded:(BOOL)a3
{
  if (a3) {
    +[UIColor whiteColor];
  }
  else {
  v3 = +[MapsTheme floatingControlsTintColor];
  }

  return v3;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)LookAroundButtonContainerViewController;
  [(LookAroundButtonContainerViewController *)&v16 viewDidLoad];
  v3 = [[CardView alloc] initAllowingBlurredForButton:1];
  cardView = self->_cardView;
  self->_cardView = v3;

  [(CardView *)self->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardView *)self->_cardView setLayoutStyle:6];
  v5 = [(LookAroundButtonContainerViewController *)self view];
  [v5 addSubview:self->_cardView];

  v6 = +[MapsThemeButton buttonWithType:0];
  lookAroundButton = self->_lookAroundButton;
  self->_lookAroundButton = v6;

  [(UIButton *)self->_lookAroundButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Look Around [Accessibility]" value:@"localized string not found" table:0];
  [(UIButton *)self->_lookAroundButton setAccessibilityLabel:v9];

  [(UIButton *)self->_lookAroundButton addTarget:self action:"tappedLookAroundButton:" forControlEvents:0x2000];
  v10 = self->_lookAroundButton;
  v11 = +[UIImage systemImageNamed:@"binoculars.fill"];
  [(UIButton *)v10 setImage:v11 forState:0];

  v12 = self->_lookAroundButton;
  v13 = sub_10010A19C(4);
  [(UIButton *)v12 setPreferredSymbolConfiguration:v13 forImageInState:0];

  v14 = [(LookAroundButtonContainerViewController *)self _buttonTintColorForExpanded:0];
  [(UIButton *)self->_lookAroundButton setTintColor:v14];

  [(UIButton *)self->_lookAroundButton setAccessibilityIdentifier:@"LookAroundButton"];
  v15 = [(CardView *)self->_cardView contentView];
  [v15 addSubview:self->_lookAroundButton];

  [(LookAroundButtonContainerViewController *)self _updateConstraints];
}

- (void)_updateConstraints
{
  if (!self->_constraints)
  {
    [(LookAroundButtonContainerViewController *)self _buttonSize];
    double v4 = v3;
    double v6 = v5;
    [(LookAroundButtonContainerViewController *)self _previewSize];
    double v9 = v7;
    double v10 = v8;
    if (self->_expanded) {
      double v11 = v7;
    }
    else {
      double v11 = v4;
    }
    if (self->_expanded) {
      double v12 = v8;
    }
    else {
      double v12 = v6;
    }
    v67 = [(CardView *)self->_cardView topAnchor];
    v68 = [(LookAroundButtonContainerViewController *)self view];
    v65 = [v68 topAnchor];
    v64 = [v67 constraintEqualToAnchor:v65];
    v71[0] = v64;
    v61 = [(CardView *)self->_cardView leadingAnchor];
    v62 = [(LookAroundButtonContainerViewController *)self view];
    v60 = [v62 leadingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v71[1] = v59;
    v58 = [(CardView *)self->_cardView trailingAnchor];
    v13 = [(LookAroundButtonContainerViewController *)self view];
    v14 = [v13 trailingAnchor];
    v15 = [v58 constraintEqualToAnchor:v14];
    v71[2] = v15;
    objc_super v16 = [(CardView *)self->_cardView bottomAnchor];
    v17 = [(LookAroundButtonContainerViewController *)self view];
    v18 = [v17 bottomAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    v71[3] = v19;
    v20 = +[NSArray arrayWithObjects:v71 count:4];
    v63 = +[NSMutableArray arrayWithArray:v20];

    v66 = [(CardView *)self->_cardView widthAnchor];
    v21 = [v66 constraintEqualToConstant:v11];
    v70[0] = v21;
    v22 = [(CardView *)self->_cardView heightAnchor];
    v23 = [v22 constraintEqualToConstant:v12];
    v70[1] = v23;
    v24 = [(UIButton *)self->_lookAroundButton widthAnchor];
    v25 = [v24 constraintEqualToConstant:v4];
    v70[2] = v25;
    v26 = [(UIButton *)self->_lookAroundButton heightAnchor];
    v27 = [v26 constraintEqualToConstant:v6];
    v70[3] = v27;
    v28 = +[NSArray arrayWithObjects:v70 count:4];
    [v63 addObjectsFromArray:v28];

    lookAroundContainerView = self->_lookAroundContainerView;
    if (lookAroundContainerView)
    {
      v30 = [(MKLookAroundContainerView *)lookAroundContainerView widthAnchor];
      v31 = [v30 constraintEqualToConstant:v9];
      v69[0] = v31;
      v32 = [(MKLookAroundContainerView *)self->_lookAroundContainerView heightAnchor];
      v33 = [v32 constraintEqualToConstant:v10];
      v69[1] = v33;
      v34 = +[NSArray arrayWithObjects:v69 count:2];
      [v63 addObjectsFromArray:v34];
    }
    v35 = +[UIDevice currentDevice];
    id v36 = [v35 userInterfaceIdiom];

    v37 = [(UIButton *)self->_lookAroundButton bottomAnchor];
    v38 = [(CardView *)self->_cardView contentView];
    v39 = [v38 bottomAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [v63 addObject:v40];

    lookAroundButton = self->_lookAroundButton;
    if (v36 == (id)5)
    {
      v42 = [(UIButton *)lookAroundButton trailingAnchor];
      v43 = [(CardView *)self->_cardView contentView];
      [v43 trailingAnchor];
    }
    else
    {
      v42 = [(UIButton *)lookAroundButton leadingAnchor];
      v43 = [(CardView *)self->_cardView contentView];
      [v43 leadingAnchor];
    v44 = };
    v45 = [v42 constraintEqualToAnchor:v44];
    [v63 addObject:v45];

    v46 = self->_lookAroundContainerView;
    if (v46)
    {
      v47 = [(MKLookAroundContainerView *)v46 bottomAnchor];
      v48 = [(CardView *)self->_cardView contentView];
      v49 = [v48 bottomAnchor];
      v50 = [v47 constraintEqualToAnchor:v49];
      [v63 addObject:v50];

      v51 = self->_lookAroundContainerView;
      if (v36 == (id)5)
      {
        v52 = [(MKLookAroundContainerView *)v51 trailingAnchor];
        v53 = [(CardView *)self->_cardView contentView];
        [v53 trailingAnchor];
      }
      else
      {
        v52 = [(MKLookAroundContainerView *)v51 leadingAnchor];
        v53 = [(CardView *)self->_cardView contentView];
        [v53 leadingAnchor];
      v54 = };
      v55 = [v52 constraintEqualToAnchor:v54];
      [v63 addObject:v55];
    }
    v56 = (NSArray *)[v63 copy];
    constraints = self->_constraints;
    self->_constraints = v56;

    +[NSLayoutConstraint activateConstraints:self->_constraints];
  }
}

- (CGSize)_previewSize
{
  id v2 = [(id)objc_opt_class() previewSizeWithContainerStyle:self->_containerStyle];
  double v3 = objc_opt_class();

  [v3 sizeForPreviewSize:v2];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_buttonSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)sizeForPreviewSize:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 2)
  {
    double v5 = 66.0;
    double v4 = 90.0;
  }
  else
  {
    double v4 = dbl_100F71B20[v3];
    double v5 = dbl_100F71B38[v3];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

+ (int64_t)previewSizeWithContainerStyle:(unint64_t)a3
{
  if (a3 == 6) {
    return 3;
  }
  double v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  [v4 bounds];
  double v8 = v7;
  [v4 bounds];
  if (v6 >= v8) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  if (v11 >= 375.0)
  {
    if (v11 <= 390.0)
    {
      int64_t v3 = 1;
    }
    else
    {
      [v4 scale];
      if (v12 <= 2.0) {
        int64_t v3 = 1;
      }
      else {
        int64_t v3 = 2;
      }
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContainerStyle:(unint64_t)a3
{
  if (self->_containerStyle != a3)
  {
    self->_containerStyle = a3;
    [(LookAroundButtonContainerViewController *)self _updateBadgeLayout];
    [(LookAroundButtonContainerViewController *)self _invalidateConstraints];
    [(LookAroundButtonContainerViewController *)self _updateConstraints];
  }
}

- (void)_invalidateConstraints
{
  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setMapItem:(id)a3 isMarkedLocation:(BOOL)a4 willChangeHidden:(BOOL)a5 animated:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  BOOL v8 = a4;
  double v12 = (MKMapItem *)a3;
  mapItem = self->_mapItem;
  if ((mapItem == v12 || [(MKMapItem *)mapItem isEqual:v12])
    && self->_isMarkedLocation == v8)
  {
    goto LABEL_14;
  }
  v14 = sub_1005764AC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    objc_super v16 = v27 = v6;
    NSStringFromSelector(a2);
    v17 = unsigned int v26 = v7;
    [(MKMapItem *)self->_mapItem _identifier];
    v19 = v18 = a2;
    *(_DWORD *)buf = 138412802;
    v29 = v16;
    __int16 v30 = 2112;
    v31 = v17;
    __int16 v32 = 2112;
    v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);

    a2 = v18;
    uint64_t v7 = v26;

    uint64_t v6 = v27;
  }

  objc_storeStrong((id *)&self->_mapItem, a3);
  self->_isMarkedLocation = v8;
  if (!v12)
  {
    v24 = self;
    v25 = 0;
LABEL_13:
    [(LookAroundButtonContainerViewController *)v24 updateLookAroundViewWithMapItem:v25 isMarkedLocation:v8 willChangeHidden:v7 animated:v6];
    goto LABEL_14;
  }
  if (![(id)objc_opt_class() isIncompleteMapItem:v12])
  {
    v24 = self;
    v25 = v12;
    goto LABEL_13;
  }
  v20 = sub_1005764AC();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v29 = v22;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ %@, waiting for refreshed map item", buf, 0x16u);
  }
  [(MKLookAroundContainerView *)self->_lookAroundContainerView setDimmingState:2 animated:v6];
LABEL_14:
}

- (void)updateLookAroundViewWithMapItem:(id)a3 isMarkedLocation:(BOOL)a4 willChangeHidden:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  unsigned int v11 = [v10 _hasLookAroundStorefront];
  unsigned int v12 = v11;
  BOOL v13 = v7;
  uint64_t v14 = 2;
  if (v7) {
    uint64_t v14 = 3;
  }
  if (v11) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v7;
  }
  objc_super v16 = objc_alloc_init(GroupAnimation);
  [(GroupAnimation *)v16 setAnimated:v6];
  [(GroupAnimation *)v16 setDuration:0.3];
  [(GroupAnimation *)v16 setOptions:4];
  [(GroupAnimation *)v16 setPreventsAnimationDuringPreparation:1];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1006DB858;
  v25[3] = &unk_1012F5528;
  char v28 = v12;
  v25[4] = self;
  BOOL v27 = v13;
  id v17 = v10;
  id v26 = v17;
  BOOL v29 = a4;
  [(GroupAnimation *)v16 addPreparation:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1006DB91C;
  v23[3] = &unk_1012E8FA8;
  char v24 = v12;
  v23[4] = self;
  v23[5] = v15;
  [(GroupAnimation *)v16 addAnimations:v23];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1006DB9C4;
  v20[3] = &unk_1012E6998;
  objc_copyWeak(&v21, &location);
  [(GroupAnimation *)v16 addCompletion:v20];
  [(GroupAnimation *)v16 runWithCurrentOptions];
  if (v12)
  {
    v18 = +[NSMutableDictionary dictionary];
    [v18 setObject:v17 forKeyedSubscript:@"PPTLookAroundChromeOverlayMapItemUserInfoKey"];
    v19 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
    [v18 setObject:v19 forKeyedSubscript:@"PPTLookAroundChromeOverlayLookAroundViewUserInfoKey"];

    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTLookAroundChromeOverlayDidShowLookAroundPreviewNotificationName" object:0 userInfo:v18];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_loadLookAroundContainerView
{
  if (!self->_lookAroundContainerView)
  {
    double v4 = sub_1005764AC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = (objc_class *)objc_opt_class();
      BOOL v6 = NSStringFromClass(v5);
      BOOL v7 = NSStringFromSelector(a2);
      int v12 = 138412546;
      BOOL v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v8 = (MKLookAroundContainerView *)[objc_alloc((Class)MKLookAroundContainerView) initWithFloatingDimmingStyle:1];
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v8;

    [(MKLookAroundContainerView *)self->_lookAroundContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView setAccessibilityIdentifier:@"LookAroundPreview"];
    id v10 = [(CardView *)self->_cardView contentView];
    [v10 insertSubview:self->_lookAroundContainerView belowSubview:self->_lookAroundButton];

    id v11 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tappedLookAroundPreview:"];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView addGestureRecognizer:v11];
    [(LookAroundButtonContainerViewController *)self _updateBadgeLayout];
    [(LookAroundButtonContainerViewController *)self _invalidateConstraints];
  }
}

- (void)_unloadLookAroundContainerView
{
  if (self->_lookAroundContainerView)
  {
    double v4 = sub_1005764AC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = (objc_class *)objc_opt_class();
      BOOL v6 = NSStringFromClass(v5);
      BOOL v7 = NSStringFromSelector(a2);
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v9, 0x16u);
    }
    [(MKLookAroundContainerView *)self->_lookAroundContainerView removeFromSuperview];
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = 0;
  }
}

- (void)_applyViewPropertiesForState:(int64_t)a3
{
  uint64_t v31 = v3;
  uint64_t v32 = v4;
  uint64_t v33 = v5;
  switch(a3)
  {
    case 0:
      [(UIButton *)self->_lookAroundButton setHidden:0];
      [(UIButton *)self->_lookAroundButton setAlpha:1.0];
      lookAroundButton = self->_lookAroundButton;
      long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v30[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v30[1] = v8;
      v30[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(UIButton *)lookAroundButton setTransform:v30];
      int v9 = [(LookAroundButtonContainerViewController *)self _buttonTintColorForExpanded:0];
      [(UIButton *)self->_lookAroundButton setTintColor:v9];

      [(MKLookAroundContainerView *)self->_lookAroundContainerView setHidden:0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setAlpha:0.0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setBadgeHidden:1];
      [(LookAroundButtonContainerViewController *)self _collapsedPreviewTransform];
      lookAroundContainerView = self->_lookAroundContainerView;
      v29[0] = v29[3];
      v29[1] = v29[4];
      v29[2] = v29[5];
      __int16 v11 = v29;
      goto LABEL_6;
    case 1:
      [(UIButton *)self->_lookAroundButton setHidden:1];
      [(UIButton *)self->_lookAroundButton setAlpha:0.0];
      int v12 = self->_lookAroundButton;
      long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v28[1] = v13;
      v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(UIButton *)v12 setTransform:v28];
      __int16 v14 = [(LookAroundButtonContainerViewController *)self _buttonTintColorForExpanded:0];
      [(UIButton *)self->_lookAroundButton setTintColor:v14];

      [(MKLookAroundContainerView *)self->_lookAroundContainerView setHidden:0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setAlpha:1.0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setBadgeHidden:1];
      [(LookAroundButtonContainerViewController *)self _collapsedPreviewTransform];
      lookAroundContainerView = self->_lookAroundContainerView;
      v27[0] = v27[3];
      v27[1] = v27[4];
      v27[2] = v27[5];
      __int16 v11 = v27;
      goto LABEL_6;
    case 2:
      [(UIButton *)self->_lookAroundButton setHidden:0];
      [(UIButton *)self->_lookAroundButton setAlpha:1.0];
      [(LookAroundButtonContainerViewController *)self _expandedButtonTransform];
      uint64_t v15 = self->_lookAroundButton;
      v26[0] = v26[3];
      v26[1] = v26[4];
      v26[2] = v26[5];
      [(UIButton *)v15 setTransform:v26];
      objc_super v16 = [(LookAroundButtonContainerViewController *)self _buttonTintColorForExpanded:1];
      [(UIButton *)self->_lookAroundButton setTintColor:v16];

      [(MKLookAroundContainerView *)self->_lookAroundContainerView setHidden:0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setAlpha:1.0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setBadgeHidden:1];
      lookAroundContainerView = self->_lookAroundContainerView;
      long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v25[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v25[1] = v17;
      v25[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      __int16 v11 = v25;
      goto LABEL_6;
    case 3:
      [(UIButton *)self->_lookAroundButton setHidden:1];
      [(UIButton *)self->_lookAroundButton setAlpha:1.0];
      [(LookAroundButtonContainerViewController *)self _expandedButtonTransform];
      v18 = self->_lookAroundButton;
      v24[0] = v24[3];
      v24[1] = v24[4];
      v24[2] = v24[5];
      [(UIButton *)v18 setTransform:v24];
      v19 = [(LookAroundButtonContainerViewController *)self _buttonTintColorForExpanded:1];
      [(UIButton *)self->_lookAroundButton setTintColor:v19];

      [(MKLookAroundContainerView *)self->_lookAroundContainerView setHidden:0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setAlpha:1.0];
      [(MKLookAroundContainerView *)self->_lookAroundContainerView setBadgeHidden:0];
      lookAroundContainerView = self->_lookAroundContainerView;
      long long v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v22 = v20;
      long long v23 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      __int16 v11 = &v21;
LABEL_6:
      -[MKLookAroundContainerView setTransform:](lookAroundContainerView, "setTransform:", v11, v21, v22, v23);
      break;
    default:
      return;
  }
}

- (CGAffineTransform)_expandedButtonTransform
{
  uint64_t v5 = +[UIDevice currentDevice];
  int v6 = [v5 userInterfaceIdiom] != (id)5;

  BOOL v7 = [(LookAroundButtonContainerViewController *)self view];
  LODWORD(v5) = [v7 effectiveUserInterfaceLayoutDirection] == (id)1;

  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v10;
  double v11 = 4.5;
  if (v6 != v5) {
    double v11 = -4.5;
  }
  *(_OWORD *)&v16.a = v8;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = v10;
  CGAffineTransformTranslate(retstr, &v16, v11, 7.0);
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  CGSize result = CGAffineTransformScale(&v16, &v15, 0.9, 0.9);
  long long v14 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  return result;
}

- (CGAffineTransform)_collapsedPreviewTransform
{
  uint64_t v5 = +[UIDevice currentDevice];
  BOOL v6 = [v5 userInterfaceIdiom] != (id)5;

  BOOL v7 = [(LookAroundButtonContainerViewController *)self view];
  id v8 = [v7 effectiveUserInterfaceLayoutDirection];

  [(LookAroundButtonContainerViewController *)self _buttonSize];
  double v10 = v9;
  double v12 = v11;
  [(LookAroundButtonContainerViewController *)self _previewSize];
  if (v10 / v13 <= v12 / v14) {
    double v15 = v12 / v14;
  }
  else {
    double v15 = v10 / v13;
  }
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v17;
  long long v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v18;
  double v19 = (v13 - v10) * 0.5;
  double v20 = -v19;
  if (v6 == (v8 == (id)1)) {
    double v20 = v19;
  }
  *(_OWORD *)&v25.a = v16;
  *(_OWORD *)&v25.c = v17;
  *(_OWORD *)&v25.tx = v18;
  CGAffineTransformTranslate(retstr, &v25, v20, (v14 - v12) * 0.5);
  long long v21 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v24.c = v21;
  *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
  CGSize result = CGAffineTransformScale(&v25, &v24, v15, v15);
  long long v23 = *(_OWORD *)&v25.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
  *(_OWORD *)&retstr->c = v23;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
  return result;
}

- (void)tappedLookAroundButton:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained enterLookAroundPIP:v4];
}

- (void)tappedLookAroundPreview:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  mapItem = self->_mapItem;
  BOOL isMarkedLocation = self->_isMarkedLocation;
  BOOL v6 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  [WeakRetained enterLookAroundForMapItem:mapItem isMarkedLocation:isMarkedLocation lookAroundView:v6];
}

+ (double)expandedHeight
{
  [a1 sizeForPreviewSize:[a1 previewSizeWithContainerStyle:1]];
  return v2;
}

+ (BOOL)isIncompleteMapItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _identifier];
  if (v4)
  {
    if ([v3 _hasResolvablePartialInformation])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      BOOL v6 = [v3 _geoMapItem];
      unsigned __int8 v5 = [v6 hasExpiredComponents];
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (LookAroundButtonContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LookAroundButtonContainerViewControllerDelegate *)WeakRetained;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (BOOL)isMarkedLocation
{
  return self->_isMarkedLocation;
}

- (void)setIsMarkedLocation:(BOOL)a3
{
  self->_BOOL isMarkedLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_storeStrong((id *)&self->_lookAroundButton, 0);

  objc_storeStrong((id *)&self->_cardView, 0);
}

@end