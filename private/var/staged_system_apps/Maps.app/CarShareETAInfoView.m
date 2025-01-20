@interface CarShareETAInfoView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_shouldShowETASuggestion;
- (BOOL)shareETACompleted;
- (CarContentSizedTableView)shareETASuggestionTableView;
- (CarFocusableButton)shareTripButton;
- (CarShareETAInfoView)initWithDelegate:(id)a3 interruptPresenter:(id)a4;
- (CarShareETAInfoViewDelegate)delegate;
- (CarShareTripFooterView)shareETASuggestionFooterView;
- (GCDTimer)completionTimer;
- (MSPSharedTripContact)contact;
- (MapsInterruptionDisplay)interruptPresenter;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSLayoutConstraint)shareTripButtonBottomConstraint;
- (NSLayoutConstraint)shareTripContactSuggestionBottomConstraint;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_startCompletionTimer;
- (void)_stopCompletionTimer;
- (void)_updateFooterContentWithSharingIdentity:(id)a3;
- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3;
- (void)dealloc;
- (void)hideShareETASuggestion;
- (void)setCompletionTimer:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactSharingSuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterruptPresenter:(id)a3;
- (void)setShareETACompleted:(BOOL)a3;
- (void)setShareETASuggestionFooterView:(id)a3;
- (void)setShareETASuggestionTableView:(id)a3;
- (void)setShareTripButton:(id)a3;
- (void)setShareTripButtonBottomConstraint:(id)a3;
- (void)setShareTripContactSuggestionBottomConstraint:(id)a3;
- (void)setTitleForShareTripButton:(id)a3;
- (void)shareTripButtonTapped:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateContent;
@end

@implementation CarShareETAInfoView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarShareETAInfoView)initWithDelegate:(id)a3 interruptPresenter:(id)a4
{
  id obj = a3;
  id v81 = a4;
  v88.receiver = self;
  v88.super_class = (Class)CarShareETAInfoView;
  val = [(CarShareETAInfoView *)&v88 init];
  if (val)
  {
    objc_storeWeak((id *)&val->_delegate, obj);
    objc_storeWeak((id *)&val->_interruptPresenter, v81);
    [(CarShareETAInfoView *)val setAccessibilityIdentifier:@"CarShareETAInfoView"];
    v82 = +[NSMutableArray array];
    v6 = [CarFocusableButton alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = -[CarFocusableButton initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    shareTripButton = val->_shareTripButton;
    val->_shareTripButton = v10;

    [(CarFocusableButton *)val->_shareTripButton setAccessibilityIdentifier:@"ShareTripButton"];
    [(CarFocusableButton *)val->_shareTripButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarFocusableButton *)val->_shareTripButton setModifiesBackgroundColor:1];
    [(CarFocusableButton *)val->_shareTripButton setAlpha:1.0];
    v12 = [(CarFocusableButton *)val->_shareTripButton titleLabel];
    v13 = +[UIFont systemFontOfSize:12.0];
    [v12 setFont:v13];

    v14 = [(CarFocusableButton *)val->_shareTripButton titleLabel];
    [v14 setAdjustsFontSizeToFitWidth:1];

    v15 = [(CarFocusableButton *)val->_shareTripButton titleLabel];
    [v15 setMinimumScaleFactor:0.833333333];

    v83 = +[CarHairlineView hairlineViewAlongAxis:0];
    -[CarFocusableButton setContentEdgeInsets:](val->_shareTripButton, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
    [(CarFocusableButton *)val->_shareTripButton addSubview:v83];
    [(CarFocusableButton *)val->_shareTripButton addTarget:val action:"shareTripButtonTapped:" forControlEvents:64];
    [(CarShareETAInfoView *)val addSubview:val->_shareTripButton];
    v16 = [(CarFocusableButton *)val->_shareTripButton bottomAnchor];
    v17 = [(CarShareETAInfoView *)val bottomAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    shareTripButtonBottomConstraint = val->_shareTripButtonBottomConstraint;
    val->_shareTripButtonBottomConstraint = (NSLayoutConstraint *)v18;

    v77 = [v83 topAnchor];
    v75 = [(CarFocusableButton *)val->_shareTripButton topAnchor];
    v74 = [v77 constraintEqualToAnchor:v75];
    v91[0] = v74;
    v73 = [v83 leadingAnchor];
    v72 = [(CarFocusableButton *)val->_shareTripButton leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v91[1] = v71;
    v70 = [v83 trailingAnchor];
    v69 = [(CarFocusableButton *)val->_shareTripButton trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v91[2] = v68;
    v67 = [(CarFocusableButton *)val->_shareTripButton leadingAnchor];
    v66 = [(CarShareETAInfoView *)val leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v91[3] = v65;
    v20 = [(CarFocusableButton *)val->_shareTripButton trailingAnchor];
    v21 = [(CarShareETAInfoView *)val trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v91[4] = v22;
    v23 = [(CarFocusableButton *)val->_shareTripButton topAnchor];
    v24 = [(CarShareETAInfoView *)val topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v91[5] = v25;
    v91[6] = val->_shareTripButtonBottomConstraint;
    v26 = [(CarFocusableButton *)val->_shareTripButton heightAnchor];
    v27 = [v26 constraintEqualToConstant:28.0];
    v91[7] = v27;
    v28 = +[NSArray arrayWithObjects:v91 count:8];
    [v82 addObjectsFromArray:v28];

    v29 = -[CarContentSizedTableView initWithFrame:style:]([CarContentSizedTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
    shareETASuggestionTableView = val->_shareETASuggestionTableView;
    val->_shareETASuggestionTableView = v29;

    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setAccessibilityIdentifier:@"ShareETASuggestionTableView"];
    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setDataSource:val];
    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setDelegate:val];
    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setAlpha:0.0];
    v31 = +[UIColor clearColor];
    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setBackgroundColor:v31];

    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setRowHeight:UITableViewAutomaticDimension];
    LODWORD(v32) = 1148846080;
    [(CarContentSizedTableView *)val->_shareETASuggestionTableView setContentCompressionResistancePriority:1 forAxis:v32];
    v33 = val->_shareETASuggestionTableView;
    uint64_t v34 = objc_opt_class();
    v35 = +[CarShareTripContactCell reuseIdentifier];
    [(CarContentSizedTableView *)v33 registerClass:v34 forCellReuseIdentifier:v35];

    [(CarShareETAInfoView *)val addSubview:val->_shareETASuggestionTableView];
    v78 = [(CarContentSizedTableView *)val->_shareETASuggestionTableView leadingAnchor];
    v36 = [(CarShareETAInfoView *)val leadingAnchor];
    v37 = [v78 constraintEqualToAnchor:v36];
    v90[0] = v37;
    v38 = [(CarContentSizedTableView *)val->_shareETASuggestionTableView trailingAnchor];
    v39 = [(CarShareETAInfoView *)val trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v90[1] = v40;
    v41 = [(CarContentSizedTableView *)val->_shareETASuggestionTableView topAnchor];
    v42 = [(CarShareETAInfoView *)val topAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v90[2] = v43;
    v44 = +[NSArray arrayWithObjects:v90 count:3];
    [v82 addObjectsFromArray:v44];

    v45 = -[CarShareTripFooterView initWithFrame:]([CarShareTripFooterView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    shareETASuggestionFooterView = val->_shareETASuggestionFooterView;
    val->_shareETASuggestionFooterView = v45;

    [(CarShareTripFooterView *)val->_shareETASuggestionFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v47) = 1148846080;
    [(CarShareTripFooterView *)val->_shareETASuggestionFooterView setContentCompressionResistancePriority:1 forAxis:v47];
    [(CarShareTripFooterView *)val->_shareETASuggestionFooterView setAlpha:0.0];
    v48 = +[MSPSharedTripService sharedInstance];
    v49 = [v48 sharingIdentity];
    [(CarShareETAInfoView *)val _updateFooterContentWithSharingIdentity:v49];

    [(CarShareETAInfoView *)val addSubview:val->_shareETASuggestionFooterView];
    v79 = [(CarShareTripFooterView *)val->_shareETASuggestionFooterView topAnchor];
    v76 = [(CarContentSizedTableView *)val->_shareETASuggestionTableView bottomAnchor];
    v50 = [v79 constraintEqualToAnchor:v76];
    v89[0] = v50;
    v51 = [(CarShareTripFooterView *)val->_shareETASuggestionFooterView leadingAnchor];
    v52 = [(CarContentSizedTableView *)val->_shareETASuggestionTableView leadingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v89[1] = v53;
    v54 = [(CarShareTripFooterView *)val->_shareETASuggestionFooterView trailingAnchor];
    v55 = [(CarContentSizedTableView *)val->_shareETASuggestionTableView trailingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    v89[2] = v56;
    v57 = +[NSArray arrayWithObjects:v89 count:3];
    [v82 addObjectsFromArray:v57];

    v58 = [(CarShareTripFooterView *)val->_shareETASuggestionFooterView bottomAnchor];
    v59 = [(CarShareETAInfoView *)val bottomAnchor];
    uint64_t v60 = [v58 constraintEqualToAnchor:v59 constant:-10.0];
    shareTripContactSuggestionBottomConstraint = val->_shareTripContactSuggestionBottomConstraint;
    val->_shareTripContactSuggestionBottomConstraint = (NSLayoutConstraint *)v60;

    v62 = +[MSPSharedTripService sharedInstance];
    [v62 addSendingObserver:val];

    objc_initWeak(&location, val);
    v63 = +[MSPSharedTripService sharedInstance];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100CBC11C;
    v85[3] = &unk_1012EC650;
    objc_copyWeak(&v86, &location);
    [v63 refreshSharingIdentityWithCompletion:v85];

    +[NSLayoutConstraint activateConstraints:v82];
    objc_destroyWeak(&v86);
    objc_destroyWeak(&location);
  }
  return val;
}

- (void)dealloc
{
  v3 = +[MSPSharedTripService sharedInstance];
  [v3 removeSendingObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarShareETAInfoView;
  [(CarShareETAInfoView *)&v4 dealloc];
}

- (id)viewForFirstBaselineLayout
{
  unsigned int v3 = [(CarShareETAInfoView *)self _shouldShowETASuggestion];
  uint64_t v4 = 2;
  if (v3) {
    uint64_t v4 = 4;
  }
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarShareETAInfoView__delegate[v4]);

  return v5;
}

- (id)viewForLastBaselineLayout
{
  unsigned int v3 = [(CarShareETAInfoView *)self _shouldShowETASuggestion];
  uint64_t v4 = 2;
  if (v3) {
    uint64_t v4 = 5;
  }
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarShareETAInfoView__delegate[v4]);

  return v5;
}

- (void)hideShareETASuggestion
{
  [(CarShareETAInfoView *)self _stopCompletionTimer];
  self->_shareETACompleted = 1;
  [(CarShareETAInfoView *)self updateContent];
  shareETASuggestionTableView = self->_shareETASuggestionTableView;

  [(CarContentSizedTableView *)shareETASuggestionTableView reloadData];
}

- (void)updateContent
{
  BOOL v3 = [(CarShareETAInfoView *)self isShowingShareETASuggestion];
  if (v3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(CarContentSizedTableView *)self->_shareETASuggestionTableView setAlpha:v4];
  [(CarShareTripFooterView *)self->_shareETASuggestionFooterView setAlpha:v4];
  [(CarFocusableButton *)self->_shareTripButton setAlpha:v5];
  [(NSLayoutConstraint *)self->_shareTripButtonBottomConstraint setActive:v3 ^ 1];
  shareTripContactSuggestionBottomConstraint = self->_shareTripContactSuggestionBottomConstraint;

  [(NSLayoutConstraint *)shareTripContactSuggestionBottomConstraint setActive:v3];
}

- (BOOL)_shouldShowETASuggestion
{
  if (!self->_contact) {
    return 0;
  }
  BOOL v3 = +[MSPSharedTripService sharedInstance];
  double v4 = [v3 receivers];
  BOOL v5 = (![v4 count] || self->_completionTimer) && !self->_shareETACompleted;

  return v5;
}

- (void)_updateFooterContentWithSharingIdentity:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    BOOL v5 = [v4 name];
    [(CarShareTripFooterView *)self->_shareETASuggestionFooterView setNameText:v5];

    v6 = [v8 handle];
    v7 = +[NSString localizedStringWithFormat:@"(%@)", v6];
    [(CarShareTripFooterView *)self->_shareETASuggestionFooterView setHandleText:v7];
  }
  else
  {
    [(CarShareTripFooterView *)self->_shareETASuggestionFooterView setNameText:0];
    [(CarShareTripFooterView *)self->_shareETASuggestionFooterView setHandleText:0];
  }
}

- (void)_startCompletionTimer
{
  objc_initWeak(&location, self);
  GEOConfigGetDouble();
  double v4 = v3;
  id v5 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100CBC63C;
  v8[3] = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  v6 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v8 block:v4];
  completionTimer = self->_completionTimer;
  self->_completionTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_stopCompletionTimer
{
  [(GCDTimer *)self->_completionTimer invalidate];
  completionTimer = self->_completionTimer;
  self->_completionTimer = 0;
}

- (void)setContactSharingSuggestion:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_contact;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      unsigned int v9 = [(CarShareETAInfoView *)self _shouldShowETASuggestion];
      objc_storeStrong((id *)&self->_contact, a3);
      unsigned int v10 = [(CarShareETAInfoView *)self _shouldShowETASuggestion];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100CBC890;
      v12[3] = &unk_1012E5D08;
      v12[4] = self;
      +[UIView performWithoutAnimation:v12];
      [(CarShareETAInfoView *)self invalidateIntrinsicContentSize];
      if (v9 != v10)
      {
        v11 = +[NSNotificationCenter defaultCenter];
        [v11 postNotificationName:CarShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification object:self];

        if (v10) {
          +[GEOAPPortal captureUserAction:45 target:126 value:0];
        }
      }
    }
  }
}

- (void)setTitleForShareTripButton:(id)a3
{
}

- (void)shareTripButtonTapped:(id)a3
{
  id v4 = [(CarShareETAInfoView *)self delegate];
  [v4 infoViewDidTapShareTripButton:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return self->_contact != 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1001044E0;
  v21 = sub_100104AE0;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100CBCAC0;
  v12[3] = &unk_1012F5AF0;
  v16 = &v17;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = self;
  +[UIView performWithoutAnimation:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:0];
  id v8 = [v6 cellForRowAtIndexPath:v7];
  id v9 = [v8 sharingState];
  if (v9 == (id)1)
  {
    [v8 setSharingState:0 animated:0];
  }
  else if (v9)
  {
    objc_initWeak(&location, self);
    id v14 = +[MSPSharedTripService sharedInstance];
    contact = self->_contact;
    uint64_t v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_100CBCE50;
    v20 = &unk_101320C90;
    id v21 = v8;
    objc_copyWeak(&v22, &location);
    [v14 stopSharingWithContact:contact completion:&v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = self->_contact;
    v11 = +[MSPSharedTripService sharedInstance];
    v12 = [v11 sharingIdentity];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interruptPresenter);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100CBCE40;
    v24[3] = &unk_1012E5D08;
    id v25 = v8;
    +[CarNavigationShareTripModeController attemptToStartShareWithContact:v10 sharingIdentity:v12 interruptPresenter:WeakRetained completion:v24];
  }
  v16 = +[NSNotificationCenter defaultCenter];
  [v16 postNotificationName:CarShareETAInfoViewDidInteractWithShareETASuggestionNotification object:self];
}

- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self->_contact;
  objc_initWeak(&location, self);
  id v6 = +[MSPSharedTripService sharedInstance];
  unsigned int v7 = [v6 isSharingWithContact:v5];

  +[MSPSharedTripService sharedInstance];
  if (v7) {
    id v8 = {;
  }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100CBD0D8;
    v20[3] = &unk_101320C90;
    id v21 = v4;
    objc_copyWeak(&v22, &location);
    [v8 stopSharingWithContact:v5 completion:v20];
    id v9 = &v21;

    objc_destroyWeak(&v22);
  }
  else {
    id v10 = {;
  }
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100CBD140;
    v16 = &unk_101320CB8;
    v11 = v5;
    uint64_t v17 = v11;
    id v18 = v4;
    objc_copyWeak(&v19, &location);
    [v10 startSharingWithContact:v11 completion:&v13];

    v12 = +[SharedTripSuggestionsCache sharedInstance];
    [v12 provideFeedbackForContact:v11];
    id v9 = (id *)&v17;

    objc_destroyWeak(&v19);
  }

  objc_destroyWeak(&location);
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarShareETAInfoView *)self _shouldShowETASuggestion])
  {
    shareETASuggestionTableView = self->_shareETASuggestionTableView;
    p_shareETASuggestionTableView = &shareETASuggestionTableView;
  }
  else
  {
    shareTripButton = self->_shareTripButton;
    p_shareETASuggestionTableView = (CarContentSizedTableView **)&shareTripButton;
  }
  id v4 = +[NSArray arrayWithObjects:p_shareETASuggestionTableView count:1];

  return (NSArray *)v4;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarShareETAInfoView *)self _shouldShowETASuggestion])
  {
    double v3 = [(CarTableView *)self->_shareETASuggestionTableView _car_visibleCells];
  }
  else
  {
    shareTripButton = self->_shareTripButton;
    double v3 = +[NSArray arrayWithObjects:&shareTripButton count:1];
  }

  return (NSArray *)v3;
}

- (CarShareETAInfoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarShareETAInfoViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MapsInterruptionDisplay)interruptPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interruptPresenter);

  return (MapsInterruptionDisplay *)WeakRetained;
}

- (void)setInterruptPresenter:(id)a3
{
}

- (MSPSharedTripContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (CarFocusableButton)shareTripButton
{
  return self->_shareTripButton;
}

- (void)setShareTripButton:(id)a3
{
}

- (CarContentSizedTableView)shareETASuggestionTableView
{
  return self->_shareETASuggestionTableView;
}

- (void)setShareETASuggestionTableView:(id)a3
{
}

- (CarShareTripFooterView)shareETASuggestionFooterView
{
  return self->_shareETASuggestionFooterView;
}

- (void)setShareETASuggestionFooterView:(id)a3
{
}

- (NSLayoutConstraint)shareTripButtonBottomConstraint
{
  return self->_shareTripButtonBottomConstraint;
}

- (void)setShareTripButtonBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)shareTripContactSuggestionBottomConstraint
{
  return self->_shareTripContactSuggestionBottomConstraint;
}

- (void)setShareTripContactSuggestionBottomConstraint:(id)a3
{
}

- (GCDTimer)completionTimer
{
  return self->_completionTimer;
}

- (void)setCompletionTimer:(id)a3
{
}

- (BOOL)shareETACompleted
{
  return self->_shareETACompleted;
}

- (void)setShareETACompleted:(BOOL)a3
{
  self->_shareETACompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionTimer, 0);
  objc_storeStrong((id *)&self->_shareTripContactSuggestionBottomConstraint, 0);
  objc_storeStrong((id *)&self->_shareTripButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_shareETASuggestionFooterView, 0);
  objc_storeStrong((id *)&self->_shareETASuggestionTableView, 0);
  objc_storeStrong((id *)&self->_shareTripButton, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_interruptPresenter);

  objc_destroyWeak((id *)&self->_delegate);
}

@end