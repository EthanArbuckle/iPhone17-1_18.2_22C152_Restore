@interface CarETACardViewController
- (BOOL)canExpand;
- (BOOL)hasArrived;
- (BOOL)isExpanded;
- (BOOL)isSharingButtonHidden;
- (BOOL)isShowingShareETASuggestion;
- (CarETAArrivedSign)arrivedSign;
- (CarETACardSign)currentSign;
- (CarETACardSign)etaSign;
- (CarETACardSign)incomingSign;
- (CarETACardViewController)initWithDataSource:(id)a3 delegate:(id)a4 interruptPresenter:(id)a5 canExpand:(BOOL)a6;
- (CarETAExpandedSign)etaExpandedSign;
- (CarETAInfoSign)etaCollapsedSign;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSMutableArray)signAnimationQueue;
- (void)_didArrive;
- (void)setArrived:(BOOL)a3;
- (void)setArrivedSign:(id)a3;
- (void)setCanExpand:(BOOL)a3;
- (void)setCurrentSign:(id)a3;
- (void)setCurrentSign:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setETA:(id)a3;
- (void)setEtaCollapsedSign:(id)a3;
- (void)setEtaExpandedSign:(id)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setIncomingSign:(id)a3;
- (void)setSharingButtonHidden:(BOOL)a3;
- (void)setSharingButtonHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setSignAnimationQueue:(id)a3;
- (void)updateArrivalState:(unint64_t)a3;
- (void)updateContent;
- (void)viewDidLoad;
@end

@implementation CarETACardViewController

- (CarETACardViewController)initWithDataSource:(id)a3 delegate:(id)a4 interruptPresenter:(id)a5 canExpand:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CarETACardViewController;
  v13 = [(CarETACardViewController *)&v18 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_dataSource, v10);
    objc_storeWeak((id *)&v14->_delegate, v11);
    v14->_sharingButtonHidden = 1;
    v14->_canExpand = a6;
    objc_storeWeak((id *)&v14->_interruptPresenter, v12);
  }
  v15 = [(CarETACardViewController *)v14 view];
  LODWORD(v16) = 1148846080;
  [v15 setContentCompressionResistancePriority:1 forAxis:v16];

  return v14;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CarETACardViewController;
  [(CarETACardViewController *)&v5 viewDidLoad];
  v3 = [(CarETACardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarETACard"];

  if ([(CarETACardViewController *)self hasArrived]) {
    [(CarETACardViewController *)self arrivedSign];
  }
  else {
  v4 = [(CarETACardViewController *)self etaSign];
  }
  [(CarETACardViewController *)self setCurrentSign:v4];
}

- (BOOL)isShowingShareETASuggestion
{
  return [(CarETAInfoSign *)self->_etaCollapsedSign isShowingShareETASuggestion];
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = v8;
  if (self->_expanded == v6)
  {
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
  else
  {
    BOOL v10 = v6 && self->_canExpand;
    self->_expanded = v10;
    if ([(CarETACardViewController *)self hasArrived])
    {
      uint64_t v11 = [(CarETACardViewController *)self arrivedSign];
    }
    else
    {
      id v12 = sub_100015DB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        CFStringRef v13 = @"collapsing";
        if (v6) {
          CFStringRef v13 = @"expanding";
        }
        int v15 = 138412290;
        CFStringRef v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "etaCardVC: %@ tray", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v11 = [(CarETACardViewController *)self etaSign];
    }
    v14 = (void *)v11;
    [(CarETACardViewController *)self setCurrentSign:v11 animated:v5 completion:v9];
  }
}

- (void)setCurrentSign:(id)a3
{
}

- (void)setCurrentSign:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v9 = (CarETACardSign *)a3;
  BOOL v10 = (void (**)(id, uint64_t))a5;
  if (self->_currentSign == v9)
  {
    uint64_t v11 = [(CarETACardViewController *)self signAnimationQueue];
    id v12 = [v11 count];

    if (!v12)
    {
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  if (v9)
  {
    CFStringRef v13 = [(CarETACardViewController *)self signAnimationQueue];
    v14 = [v13 lastObject];

    if (v14 == v9)
    {
      if (!v10) {
        goto LABEL_22;
      }
      v43 = sub_100015DB4();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        *(_DWORD *)buf = 138412290;
        v67 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "etaCardVC: ignoring update to: %@ as it is already queued", buf, 0xCu);
      }
LABEL_21:
      v10[2](v10, 1);
      goto LABEL_22;
    }
  }
  v56 = v10;
  int v15 = sub_100015DB4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    CFStringRef v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    objc_super v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412546;
    v67 = v17;
    __int16 v68 = 2112;
    v69 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "etaCardVC: setting currentSign with class: %@, previous sign class: %@", buf, 0x16u);
  }
  id obj = a3;
  BOOL v47 = v6;

  v20 = v9;
  v21 = [(CarETACardViewController *)self signAnimationQueue];
  v22 = [v21 lastObject];
  currentSign = v22;
  if (!v22) {
    currentSign = self->_currentSign;
  }
  v55 = currentSign;

  [(CarETACardViewController *)self setIncomingSign:v20];
  v24 = [(CarETACardViewController *)self view];
  [v24 addSubview:v20];

  v54 = self->_currentSignBottomConstraint;
  v52 = [(CarETACardSign *)v20 topAnchor];
  v53 = [(CarETACardViewController *)self view];
  v51 = [v53 topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v65[0] = v50;
  v48 = [(CarETACardSign *)v20 leadingAnchor];
  v49 = [(CarETACardViewController *)self view];
  v25 = [v49 leadingAnchor];
  v26 = [v48 constraintEqualToAnchor:v25];
  v65[1] = v26;
  v27 = [(CarETACardSign *)v20 trailingAnchor];
  v28 = [(CarETACardViewController *)self view];
  [v28 trailingAnchor];
  v30 = v29 = v20;
  v31 = [v27 constraintEqualToAnchor:v30];
  v65[2] = v31;
  v32 = +[NSArray arrayWithObjects:v65 count:3];
  currentSignTopAndSideConstraints = self->_currentSignTopAndSideConstraints;
  self->_currentSignTopAndSideConstraints = v32;

  v34 = [(CarETACardSign *)v29 bottomAnchor];
  v35 = [(CarETACardViewController *)self view];
  v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  currentSignBottomConstraint = self->_currentSignBottomConstraint;
  self->_currentSignBottomConstraint = v37;

  +[NSLayoutConstraint activateConstraints:self->_currentSignTopAndSideConstraints];
  v39 = [(CarETACardViewController *)self view];
  [v39 layoutIfNeeded];

  [(NSLayoutConstraint *)v54 setActive:0];
  [(NSLayoutConstraint *)self->_currentSignBottomConstraint setActive:1];
  if (self->_currentSign)
  {
    double v40 = 0.0;
    -[CarETACardSign setAlpha:](v29, "setAlpha:", 0.0, obj);
    v41 = [(CarETACardViewController *)self signAnimationQueue];
    [v41 addObject:v29];

    if (v47) {
      double v40 = 0.5;
    }
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100BD00E0;
    v61[3] = &unk_1012E66E0;
    v62 = v29;
    v63 = v55;
    v64 = self;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100BD0168;
    v57[3] = &unk_1012F8968;
    v58 = v63;
    v59 = self;
    BOOL v10 = v56;
    v60 = v56;
    +[UIView animateWithDuration:6 delay:v61 usingSpringWithDamping:v57 initialSpringVelocity:v40 options:0.0 animations:0.800000012 completion:0.100000001];

    v42 = v55;
  }
  else
  {
    objc_storeStrong((id *)&self->_currentSign, obj);
    [(CarETACardViewController *)self setIncomingSign:0];
    v42 = v55;
    BOOL v10 = v56;
    if (v56) {
      v56[2](v56, 1);
    }
  }

LABEL_22:
}

- (CarETACardSign)etaSign
{
  if ([(CarETACardViewController *)self isExpanded]) {
    [(CarETACardViewController *)self etaExpandedSign];
  }
  else {
  v3 = [(CarETACardViewController *)self etaCollapsedSign];
  }

  return (CarETACardSign *)v3;
}

- (CarETAInfoSign)etaCollapsedSign
{
  etaCollapsedSign = self->_etaCollapsedSign;
  if (!etaCollapsedSign)
  {
    v4 = [CarETAInfoSign alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = objc_loadWeakRetained((id *)&self->_interruptPresenter);
    v7 = [(CarETAInfoSign *)v4 initWithDelegate:WeakRetained interruptPresenter:v6 canExpand:self->_canExpand];
    id v8 = self->_etaCollapsedSign;
    self->_etaCollapsedSign = v7;

    [(CarETAInfoSign *)self->_etaCollapsedSign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarETAInfoSign *)self->_etaCollapsedSign setLatestETA:self->_latestETA];
    [(CarETAInfoSign *)self->_etaCollapsedSign setShareButtonHidden:self->_sharingButtonHidden];
    etaCollapsedSign = self->_etaCollapsedSign;
  }

  return etaCollapsedSign;
}

- (CarETAExpandedSign)etaExpandedSign
{
  etaExpandedSign = self->_etaExpandedSign;
  if (!etaExpandedSign)
  {
    v4 = [CarETAExpandedSign alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = [(CarETAExpandedSign *)v4 initWithDataSource:WeakRetained delegate:v6];
    id v8 = self->_etaExpandedSign;
    self->_etaExpandedSign = v7;

    [(CarETAExpandedSign *)self->_etaExpandedSign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarETAExpandedSign *)self->_etaExpandedSign setLatestETA:self->_latestETA];
    etaExpandedSign = self->_etaExpandedSign;
  }

  return etaExpandedSign;
}

- (CarETAArrivedSign)arrivedSign
{
  arrivedSign = self->_arrivedSign;
  if (!arrivedSign)
  {
    v4 = [CarETAArrivedSign alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    v7 = [(CarETAArrivedSign *)v4 initWithDelegate:WeakRetained dataSource:v6];
    id v8 = self->_arrivedSign;
    self->_arrivedSign = v7;

    [(CarETAArrivedSign *)self->_arrivedSign setTranslatesAutoresizingMaskIntoConstraints:0];
    arrivedSign = self->_arrivedSign;
  }

  return arrivedSign;
}

- (NSMutableArray)signAnimationQueue
{
  signAnimationQueue = self->_signAnimationQueue;
  if (!signAnimationQueue)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    BOOL v5 = self->_signAnimationQueue;
    self->_signAnimationQueue = v4;

    signAnimationQueue = self->_signAnimationQueue;
  }

  return signAnimationQueue;
}

- (void)setIncomingSign:(id)a3
{
  BOOL v5 = (CarETACardSign *)a3;
  p_incomingSign = &self->_incomingSign;
  if (*p_incomingSign != v5)
  {
    v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "etaCardVC: incoming sign is now %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)p_incomingSign, a3);
  }
}

- (void)updateContent
{
  v3 = +[MNNavigationService sharedService];
  -[CarETACardViewController updateArrivalState:](self, "updateArrivalState:", [v3 arrivalState]);

  v4 = [(CarETACardViewController *)self etaCollapsedSign];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained sharingButtonTitle];
  [v4 setTitleForShareTripButton:v6];

  v7 = [(CarETACardViewController *)self etaCollapsedSign];
  id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
  v9 = [v8 contactSharingSuggestion];
  [v7 setContactSharingSuggestion:v9];

  BOOL v10 = [(CarETACardViewController *)self etaCollapsedSign];
  [v10 updateContent];

  uint64_t v11 = [(CarETACardViewController *)self etaExpandedSign];
  [v11 updateContent];

  id v12 = [(CarETACardViewController *)self arrivedSign];
  [v12 updateContent];
}

- (void)setSharingButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_sharingButtonHidden != a3)
  {
    BOOL v4 = a3;
    self->_sharingButtonHidden = a3;
    etaCollapsedSign = self->_etaCollapsedSign;
    if (a4)
    {
      id v8 = [(CarETACardViewController *)self currentSign];
      [(CarETAInfoSign *)etaCollapsedSign setShareButtonHidden:v4 animated:v8 == self->_etaCollapsedSign];
    }
    else
    {
      v7 = self->_etaCollapsedSign;
      -[CarETAInfoSign setShareButtonHidden:animated:](v7, "setShareButtonHidden:animated:");
    }
  }
}

- (void)_didArrive
{
  [(CarETACardViewController *)self setArrived:1];
  if ([(CarETACardViewController *)self isExpanded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v4 = [(CarETACardViewController *)self currentSign];
    [WeakRetained etaCardSign:v4 didSelectAction:0];
  }
  BOOL v5 = [(CarETACardViewController *)self arrivedSign];
  [(CarETACardViewController *)self setCurrentSign:v5 animated:[(CarETACardViewController *)self isViewLoaded] completion:0];

  id v6 = [(CarETACardViewController *)self arrivedSign];
  id v7 = [v6 state];

  if (v7 == (id)2)
  {
    id v8 = +[MKMapService sharedService];
    id v10 = v8;
    uint64_t v9 = 295;
  }
  else
  {
    if (v7 != (id)1) {
      return;
    }
    id v8 = +[MKMapService sharedService];
    id v10 = v8;
    uint64_t v9 = 296;
  }
  [v8 captureUserAction:v9 onTarget:1001 eventValue:0];
}

- (NSArray)focusOrderSubItems
{
  v2 = [(CarETACardViewController *)self currentSign];
  v3 = [v2 focusOrderSubItems];

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = [(CarETACardViewController *)self currentSign];
  v3 = [v2 preferredFocusEnvironments];

  return (NSArray *)v3;
}

- (void)setETA:(id)a3
{
  BOOL v5 = (GuidanceETA *)a3;
  p_latestETA = &self->_latestETA;
  if (self->_latestETA != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    [(CarETAInfoSign *)self->_etaCollapsedSign setLatestETA:*p_latestETA];
    [(CarETAExpandedSign *)self->_etaExpandedSign setLatestETA:*p_latestETA];
    BOOL v5 = v7;
  }
}

- (void)updateArrivalState:(unint64_t)a3
{
  BOOL v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = sub_10078D488(a3);
    int v16 = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "etaCardVC: updateArrivalState: %@", (uint8_t *)&v16, 0xCu);
  }
  if (a3 <= 5)
  {
    if (((1 << a3) & 3) != 0)
    {
      CFStringRef v13 = [(CarETACardViewController *)self arrivedSign];
      [v13 setState:0];

      [(CarETACardViewController *)self setArrived:0];
      id v10 = [(CarETACardViewController *)self etaSign];
      [(CarETACardViewController *)self setCurrentSign:v10 animated:[(CarETACardViewController *)self isViewLoaded] completion:0];
    }
    else
    {
      if (((1 << a3) & 0x14) == 0)
      {
        v14 = [(CarETACardViewController *)self arrivedSign];
        [v14 setState:0];

        [(CarETACardViewController *)self _didArrive];
        return;
      }
      id v7 = +[MNNavigationService sharedService];
      unsigned int v8 = [v7 isArrivedAtEVCharger];

      uint64_t v9 = +[MNNavigationService sharedService];
      id v10 = [v9 arrivalChargingStationInfo];

      if (v8)
      {
        [v10 chargingTime];
        if (v11 <= 0.0) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
      }
      else
      {
        uint64_t v12 = 1;
      }
      int v15 = [(CarETACardViewController *)self arrivedSign];
      [v15 setState:v12];

      [(CarETACardViewController *)self _didArrive];
    }
  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CarETACardSign)currentSign
{
  return self->_currentSign;
}

- (CarETACardSign)incomingSign
{
  return self->_incomingSign;
}

- (void)setSignAnimationQueue:(id)a3
{
}

- (void)setEtaCollapsedSign:(id)a3
{
}

- (void)setEtaExpandedSign:(id)a3
{
}

- (void)setArrivedSign:(id)a3
{
}

- (BOOL)isSharingButtonHidden
{
  return self->_sharingButtonHidden;
}

- (void)setSharingButtonHidden:(BOOL)a3
{
  self->_sharingButtonHidden = a3;
}

- (BOOL)hasArrived
{
  return self->_arrived;
}

- (void)setArrived:(BOOL)a3
{
  self->_arrived = a3;
}

- (BOOL)canExpand
{
  return self->_canExpand;
}

- (void)setCanExpand:(BOOL)a3
{
  self->_canExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivedSign, 0);
  objc_storeStrong((id *)&self->_etaExpandedSign, 0);
  objc_storeStrong((id *)&self->_etaCollapsedSign, 0);
  objc_storeStrong((id *)&self->_signAnimationQueue, 0);
  objc_storeStrong((id *)&self->_incomingSign, 0);
  objc_storeStrong((id *)&self->_currentSign, 0);
  objc_storeStrong((id *)&self->_currentSignBottomConstraint, 0);
  objc_storeStrong((id *)&self->_currentSignTopAndSideConstraints, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_destroyWeak((id *)&self->_interruptPresenter);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end