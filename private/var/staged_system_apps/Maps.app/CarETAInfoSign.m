@interface CarETAInfoSign
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isShareButtonHidden;
- (BOOL)isShowingShareETASuggestion;
- (CarETACardSignDelegate)delegate;
- (CarETAInfoSign)initWithDelegate:(id)a3 interruptPresenter:(id)a4 canExpand:(BOOL)a5;
- (GuidanceETA)latestETA;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (void)_onExpandTapped:(id)a3;
- (void)infoViewDidTapShareTripButton:(id)a3;
- (void)setContactSharingSuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLatestETA:(id)a3;
- (void)setShareButtonHidden:(BOOL)a3;
- (void)setShareButtonHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitleForShareTripButton:(id)a3;
- (void)updateContent;
@end

@implementation CarETAInfoSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAInfoSign)initWithDelegate:(id)a3 interruptPresenter:(id)a4 canExpand:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v85.receiver = self;
  v85.super_class = (Class)CarETAInfoSign;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[CarETAInfoSign initWithFrame:](&v85, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v14 = v13;
  if (v13)
  {
    id v83 = v8;
    objc_storeWeak((id *)&v13->_delegate, v8);
    v14->_canExpand = a5;
    v15 = -[CarRouteInfoView initWithFrame:]([CarRouteInfoView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    routeInfoView = v14->_routeInfoView;
    v14->_routeInfoView = v15;

    [(CarRouteInfoView *)v14->_routeInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v17) = 1148846080;
    [(CarRouteInfoView *)v14->_routeInfoView setContentCompressionResistancePriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(CarRouteInfoView *)v14->_routeInfoView setContentHuggingPriority:1 forAxis:v18];
    [(CarETAInfoSign *)v14 addSubview:v14->_routeInfoView];
    if (v14->_canExpand)
    {
      v19 = -[CarFocusableButton initWithFrame:]([CarFocusableButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      expandButton = v14->_expandButton;
      v14->_expandButton = v19;

      [(CarFocusableButton *)v14->_expandButton setAccessibilityIdentifier:@"ExpandButton"];
      [(CarFocusableButton *)v14->_expandButton setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v21) = 1148846080;
      [(CarFocusableButton *)v14->_expandButton setContentCompressionResistancePriority:0 forAxis:v21];
      LODWORD(v22) = 1148846080;
      [(CarFocusableButton *)v14->_expandButton setContentCompressionResistancePriority:1 forAxis:v22];
      LODWORD(v23) = 1148846080;
      [(CarFocusableButton *)v14->_expandButton setContentHuggingPriority:0 forAxis:v23];
      LODWORD(v24) = 1148846080;
      [(CarFocusableButton *)v14->_expandButton setContentHuggingPriority:1 forAxis:v24];
      [(CarFocusableButton *)v14->_expandButton addTarget:v14 action:"_onExpandTapped:" forControlEvents:64];
      v25 = v14->_expandButton;
      v26 = +[UIImage _mapsCar_systemImageNamed:@"chevron.up.circle.fill" textStyle:UIFontTextStyleTitle3 weight:6];
      [(CarFocusableButton *)v25 setImage:v26 forState:0];

      v27 = v14->_expandButton;
      v28 = +[UIColor _carSystemFocusColor];
      [(CarFocusableButton *)v27 setFocusedTintColor:v28];

      v29 = v14->_expandButton;
      v30 = +[UIColor _carSystemTertiaryColor];
      [(CarFocusableButton *)v29 setNonFocusedTintColor:v30];

      -[MapsLargerHitTargetButton setTouchInsets:](v14->_expandButton, "setTouchInsets:", -10.0, -130.0, -10.0, -10.0);
      v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"CarPlay_Expand" value:@"localized string not found" table:0];
      v91[0] = v32;
      v33 = +[NSBundle mainBundle];
      v34 = [v33 localizedStringForKey:@"CarPlay_Up" value:@"localized string not found" table:0];
      v91[1] = v34;
      v35 = +[NSArray arrayWithObjects:v91 count:2];
      [(CarFocusableButton *)v14->_expandButton setAccessibilityUserInputLabels:v35];

      [(CarETAInfoSign *)v14 addSubview:v14->_expandButton];
    }
    id v82 = v9;
    v36 = [[CarShareETAInfoView alloc] initWithDelegate:v14 interruptPresenter:v9];
    shareETAInfoView = v14->_shareETAInfoView;
    v14->_shareETAInfoView = v36;

    [(CarShareETAInfoView *)v14->_shareETAInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarETAInfoSign *)v14 addSubview:v14->_shareETAInfoView];
    id v84 = objc_alloc_init((Class)NSMutableArray);
    if (v14->_canExpand)
    {
      v38 = [(CarFocusableButton *)v14->_expandButton leadingAnchor];
      v39 = [(CarRouteInfoView *)v14->_routeInfoView trailingAnchor];
      uint64_t v40 = [v38 constraintEqualToAnchor:v39 constant:8.5];
      routeInfoViewToExpandButtonConstraint = v14->_routeInfoViewToExpandButtonConstraint;
      v14->_routeInfoViewToExpandButtonConstraint = (NSLayoutConstraint *)v40;

      v80 = [(CarFocusableButton *)v14->_expandButton firstBaselineAnchor];
      uint64_t v78 = [(CarETAInfoSign *)v14 topAnchor];
      v42 = [v80 constraintEqualToAnchor:v78 constant:29.0];
      v90[0] = v42;
      v43 = [(CarFocusableButton *)v14->_expandButton firstBaselineAnchor];
      v44 = [(CarShareETAInfoView *)v14->_shareETAInfoView topAnchor];
      v45 = [v43 constraintEqualToAnchor:v44 constant:-15.0];
      v90[1] = v45;
      v90[2] = v14->_routeInfoViewToExpandButtonConstraint;
      v46 = [(CarETAInfoSign *)v14 trailingAnchor];
      v47 = [(CarFocusableButton *)v14->_expandButton trailingAnchor];
      v48 = [v46 constraintEqualToAnchor:v47 constant:8.5];
      v90[3] = v48;
      v49 = +[NSArray arrayWithObjects:v90 count:4];
      [v84 addObjectsFromArray:v49];

      v50 = (void *)v78;
      v51 = v80;
    }
    else
    {
      v51 = [(CarETAInfoSign *)v14 trailingAnchor];
      v50 = [(CarRouteInfoView *)v14->_routeInfoView trailingAnchor];
      v42 = [v51 constraintEqualToAnchor:v50 constant:10.0];
      v89 = v42;
      v43 = +[NSArray arrayWithObjects:&v89 count:1];
      [v84 addObjectsFromArray:v43];
    }

    v81 = [(CarRouteInfoView *)v14->_routeInfoView firstBaselineAnchor];
    v79 = [(CarETAInfoSign *)v14 topAnchor];
    v77 = [v81 constraintEqualToAnchor:v79 constant:20.0];
    v88[0] = v77;
    v76 = [(CarRouteInfoView *)v14->_routeInfoView leadingAnchor];
    v75 = [(CarETAInfoSign *)v14 leadingAnchor];
    v74 = [v76 constraintEqualToAnchor:v75 constant:10.0];
    v88[1] = v74;
    v73 = [(CarShareETAInfoView *)v14->_shareETAInfoView topAnchor];
    v52 = [(CarRouteInfoView *)v14->_routeInfoView lastBaselineAnchor];
    v53 = [v73 constraintEqualToAnchor:v52 constant:11.0];
    v88[2] = v53;
    v54 = [(CarShareETAInfoView *)v14->_shareETAInfoView leadingAnchor];
    v55 = [(CarETAInfoSign *)v14 leadingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    v88[3] = v56;
    v57 = [(CarETAInfoSign *)v14 trailingAnchor];
    v58 = [(CarShareETAInfoView *)v14->_shareETAInfoView trailingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    v88[4] = v59;
    v60 = +[NSArray arrayWithObjects:v88 count:5];
    [v84 addObjectsFromArray:v60];

    v61 = [(CarShareETAInfoView *)v14->_shareETAInfoView bottomAnchor];
    v62 = [(CarETAInfoSign *)v14 bottomAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    v87 = v63;
    uint64_t v64 = +[NSArray arrayWithObjects:&v87 count:1];
    showingShareTripButtonConstraints = v14->_showingShareTripButtonConstraints;
    v14->_showingShareTripButtonConstraints = (NSArray *)v64;

    v66 = [(CarShareETAInfoView *)v14->_shareETAInfoView topAnchor];
    v67 = [(CarETAInfoSign *)v14 bottomAnchor];
    v68 = [v66 constraintEqualToAnchor:v67];
    v86 = v68;
    uint64_t v69 = +[NSArray arrayWithObjects:&v86 count:1];
    hidingShareTripButtonConstraints = v14->_hidingShareTripButtonConstraints;
    v14->_hidingShareTripButtonConstraints = (NSArray *)v69;

    +[NSLayoutConstraint activateConstraints:v84];
    if (v14->_shareButtonHidden) {
      uint64_t v71 = 40;
    }
    else {
      uint64_t v71 = 32;
    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&v14->super.super.super.isa + v71), 24);

    id v9 = v82;
    id v8 = v83;
  }

  return v14;
}

- (BOOL)isShowingShareETASuggestion
{
  return [(CarShareETAInfoView *)self->_shareETAInfoView isShowingShareETASuggestion];
}

- (void)updateContent
{
}

- (void)setTitleForShareTripButton:(id)a3
{
}

- (void)setContactSharingSuggestion:(id)a3
{
}

- (void)setShareButtonHidden:(BOOL)a3
{
}

- (void)setShareButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shareButtonHidden != a3)
  {
    BOOL v4 = a4;
    self->_shareButtonHidden = a3;
    if (a3) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 7;
    }
    if (a3) {
      uint64_t v7 = 7;
    }
    else {
      uint64_t v7 = 6;
    }
    +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarETAInfoSign__delegate[v6])];
    +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarETAInfoSign__delegate[v7])];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100B60994;
    v12[3] = &unk_1012E5D08;
    v12[4] = self;
    id v8 = objc_retainBlock(v12);
    id v9 = v8;
    if (v4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100B609C4;
      v10[3] = &unk_1012E5F78;
      v10[4] = self;
      v11 = v8;
      +[UIView animateWithDuration:v10 animations:0.3];
    }
    else
    {
      ((void (*)(void *))v8[2])(v8);
    }
  }
}

- (void)_onExpandTapped:(id)a3
{
  BOOL v4 = [(CarETAInfoSign *)self delegate];
  [v4 etaCardSign:self didSelectAction:0];

  dispatch_time_t v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B60AD0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setLatestETA:(id)a3
{
  dispatch_time_t v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    [(CarRouteInfoView *)self->_routeInfoView setLatestETA:v11];
    unsigned __int8 v6 = [(NSLayoutConstraint *)self->_routeInfoViewToExpandButtonConstraint isActive];
    dispatch_time_t v5 = v11;
    if ((v6 & 1) == 0)
    {
      [(NSLayoutConstraint *)self->_routeInfoViewToExpandButtonConstraint setActive:0];
      uint64_t v7 = [(CarFocusableButton *)self->_expandButton leadingAnchor];
      id v8 = [(CarRouteInfoView *)self->_routeInfoView trailingAnchor];
      id v9 = [v7 constraintEqualToAnchor:v8 constant:8.5];
      routeInfoViewToExpandButtonConstraint = self->_routeInfoViewToExpandButtonConstraint;
      self->_routeInfoViewToExpandButtonConstraint = v9;

      [(NSLayoutConstraint *)self->_routeInfoViewToExpandButtonConstraint setActive:1];
      dispatch_time_t v5 = v11;
    }
  }
}

- (void)infoViewDidTapShareTripButton:(id)a3
{
  id v4 = [(CarETAInfoSign *)self delegate];
  [v4 etaCardSign:self didSelectAction:6];
}

- (NSArray)focusOrderSubItems
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = v3;
  if (self->_canExpand) {
    [v3 addObject:self->_expandButton];
  }
  if (![(CarETAInfoSign *)self isShareButtonHidden])
  {
    dispatch_time_t v5 = [(CarShareETAInfoView *)self->_shareETAInfoView focusOrderSubItems];
    [v4 addObjectsFromArray:v5];
  }
  id v6 = [v4 copy];

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = v3;
  if (self->_canExpand) {
    [v3 addObject:self->_expandButton];
  }
  if (![(CarETAInfoSign *)self isShareButtonHidden]) {
    [v4 addObject:self->_shareETAInfoView];
  }
  id v5 = [v4 copy];

  return (NSArray *)v5;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (CarETACardSignDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarETACardSignDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isShareButtonHidden
{
  return self->_shareButtonHidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_routeInfoViewToExpandButtonConstraint, 0);
  objc_storeStrong((id *)&self->_hidingShareTripButtonConstraints, 0);
  objc_storeStrong((id *)&self->_showingShareTripButtonConstraints, 0);
  objc_storeStrong((id *)&self->_shareETAInfoView, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);

  objc_storeStrong((id *)&self->_routeInfoView, 0);
}

@end