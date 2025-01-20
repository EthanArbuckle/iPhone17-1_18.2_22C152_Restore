@interface NavTrafficIncidentContaineeViewController
- (BOOL)_allowsCardDrag;
- (BOOL)_canShowWhileLocked;
- (BOOL)_displayActionButtonsForSmallLayout;
- (BOOL)_hasActionButtons;
- (BOOL)_hasIncidentDetailsContent;
- (BOOL)progressBarHidden;
- (BackgroundColorButton)cancelButton;
- (ContainerHeaderView)headerView;
- (MNTrafficIncidentAlert)incidentAlert;
- (MapsProgressButton)confirmButton;
- (NavTrafficIncidentAlertViewControllerDelegate)delegate;
- (NavTrafficIncidentDetailsView)incidentDetailsView;
- (NavTrafficIncidentHeaderView)titleView;
- (UIStackView)buttonsStackView;
- (VKTrafficIncidentFeature)incident;
- (double)actionButtonsHeightForLayout:(unint64_t)a3;
- (double)detailsHeight;
- (double)heightForLayout:(unint64_t)a3;
- (double)previousWidth;
- (double)rerouteTimerProgress;
- (id)_incidentTypeAsString;
- (id)dismissHandler;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (void)_didReceiveIncidentUpdate:(id)a3;
- (void)_didTapActionButton:(id)a3;
- (void)_didTapCancelButton:(id)a3;
- (void)_updateActionButtonsPaddingForLayout:(unint64_t)a3;
- (void)_updateGrabberVisibility;
- (void)_updateViewsFromContent;
- (void)applyAlphaToContent:(double)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)handleDismissAction:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIncident:(id)a3;
- (void)setIncidentAlert:(id)a3;
- (void)setIncidentDetailsView:(id)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setProgressBarHidden:(BOOL)a3;
- (void)setRerouteTimerProgress:(double)a3;
- (void)setTitleView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation NavTrafficIncidentContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setIncidentAlert:(id)a3
{
  v6 = (MNTrafficIncidentAlert *)a3;
  if (self->_incidentAlert != v6)
  {
    objc_storeStrong((id *)&self->_incidentAlert, a3);
    incident = self->_incident;
    self->_incident = 0;
  }
  [(NavTrafficIncidentContaineeViewController *)self _updateViewsFromContent];
}

- (void)setIncident:(id)a3
{
  id v7 = a3;
  id v5 = [(NavTrafficIncidentContaineeViewController *)self incident];

  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_incident, a3);
    incidentAlert = self->_incidentAlert;
    self->_incidentAlert = 0;

    [(NavTrafficIncidentContaineeViewController *)self _updateViewsFromContent];
  }
}

- (void)_updateViewsFromContent
{
  if ([(NavTrafficIncidentContaineeViewController *)self isViewLoaded])
  {
    v3 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];

    v4 = [(NavTrafficIncidentContaineeViewController *)self titleView];
    if (v3)
    {
      id v5 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
      +[NavTrafficIncidentViewComposer configureHeaderView:v4 withTrafficIncidentAlert:v5];

      v6 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
      id v7 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
      +[NavTrafficIncidentViewComposer configureDetailsView:v6 withTrafficIncidentAlert:v7];

      [(MapsProgressButton *)self->_confirmButton setProgressBarHidden:[(MNTrafficIncidentAlert *)self->_incidentAlert shouldShowTimer] ^ 1];
    }
    else
    {
      v8 = [(NavTrafficIncidentContaineeViewController *)self incident];
      +[NavTrafficIncidentViewComposer configureHeaderView:v4 withTrafficIncidentFeature:v8];

      v9 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
      v10 = [(NavTrafficIncidentContaineeViewController *)self incident];
      +[NavTrafficIncidentViewComposer configureDetailsView:v9 withTrafficIncidentFeature:v10];
    }
    unsigned int v11 = [(NavTrafficIncidentContaineeViewController *)self _hasActionButtons];
    if (v11)
    {
      cancelButton = self->_cancelButton;
      v13 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
      v14 = [v13 dismissButtonTitle];
      [(BackgroundColorButton *)cancelButton setTitle:v14 forState:0];

      confirmButton = self->_confirmButton;
      v16 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
      v17 = [v16 acceptButtonTitle];
      [(MapsProgressButton *)confirmButton setTitle:v17 forState:0];
    }
    [(UIStackView *)self->_buttonsStackView setHidden:v11 ^ 1];
    unsigned int v18 = [(NavTrafficIncidentContaineeViewController *)self _hasIncidentDetailsContent];
    if (v18) {
      double v19 = 1.0;
    }
    else {
      double v19 = 0.0;
    }
    v20 = [(NavTrafficIncidentContaineeViewController *)self headerView];
    [v20 setHairLineAlpha:v19];

    v21 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
    [v21 setHidden:v18 ^ 1];

    v22 = [(ContaineeViewController *)self cardPresentationController];
    id v23 = [v22 containeeLayout];

    if ((v18 & 1) != 0
      || [(NavTrafficIncidentContaineeViewController *)self _hasActionButtons]
      || v23 != (id)2)
    {
      v24 = [(ContaineeViewController *)self cardPresentationController];
      [v24 updateHeightForCurrentLayout];
    }
    else
    {
      v24 = [(ContaineeViewController *)self cardPresentationController];
      [v24 wantsLayout:1];
    }

    [(NavTrafficIncidentContaineeViewController *)self _updateGrabberVisibility];
  }
}

- (void)_updateGrabberVisibility
{
  uint64_t v3 = [(NavTrafficIncidentContaineeViewController *)self _allowsCardDrag] ^ 1;
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setHideGrabber:v3];
}

- (BOOL)_hasIncidentDetailsContent
{
  uint64_t v3 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];

  if (v3)
  {
    id v4 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
    id v5 = [v4 incident];
    unsigned int v6 = [v5 type];

    if (v6 == 14)
    {
LABEL_3:
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  else
  {
    v8 = [(NavTrafficIncidentContaineeViewController *)self incident];
    id v9 = [v8 type];

    if (v9 == (id)14) {
      goto LABEL_3;
    }
  }
  v10 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
  if (v10)
  {
    unsigned int v11 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
    v12 = [v11 incident];
    v13 = [v12 info];
  }
  else
  {
    unsigned int v11 = [(NavTrafficIncidentContaineeViewController *)self incident];
    v13 = [v11 info];
  }

  if ([v13 length]) {
    unsigned int v7 = ![(NavTrafficIncidentContaineeViewController *)self _hasActionButtons];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_hasActionButtons
{
  v2 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
  uint64_t v3 = [v2 acceptButtonTitle];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)_displayActionButtonsForSmallLayout
{
  v2 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
  BOOL v3 = [v2 acceptButtonDisplay] == 1;

  return v3;
}

- (BOOL)_allowsCardDrag
{
  BOOL v3 = [(ContaineeViewController *)self cardPresentationController];
  BOOL v4 = (char *)[v3 containeeLayout];

  if ((unint64_t)(v4 - 3) < 3 || v4 == 0) {
    return 0;
  }
  if (v4 != (char *)1
    || [(NavTrafficIncidentContaineeViewController *)self _hasIncidentDetailsContent])
  {
    return 1;
  }

  return [(NavTrafficIncidentContaineeViewController *)self _hasActionButtons];
}

- (void)viewDidLoad
{
  v84.receiver = self;
  v84.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v84 viewDidLoad];
  BOOL v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setEdgeAttachedRegularHeightDimmingBehavior:1];

  BOOL v4 = [(NavTrafficIncidentContaineeViewController *)self view];
  [v4 setAccessibilityIdentifier:@"NavTrafficIncidentView"];
  id v5 = [[ContainerHeaderView alloc] initWithHairlineMargin:16.0];
  [(NavTrafficIncidentContaineeViewController *)self setHeaderView:v5];

  unsigned int v6 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  unsigned int v7 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v7 setHeaderSize:2];

  v8 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v8 setDelegate:self];

  id v9 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v4 addSubview:v9];

  v10 = [NavTrafficIncidentHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v14 = -[NavTrafficIncidentHeaderView initWithFrame:](v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(NavTrafficIncidentContaineeViewController *)self setTitleView:v14];

  v15 = [(NavTrafficIncidentContaineeViewController *)self titleView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(NavTrafficIncidentContaineeViewController *)self titleView];
  v17 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v17 setTitleView:v16];

  unsigned int v18 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v18 setTitleViewInsets:0.0, 16.0, 0.0, 0.0];

  double v19 = -[NavTrafficIncidentDetailsView initWithFrame:]([NavTrafficIncidentDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(NavTrafficIncidentContaineeViewController *)self setIncidentDetailsView:v19];

  v20 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
  v83 = v4;
  [v4 addSubview:v21];

  v22 = +[NavUserDecisionButtonFactory cancelButton];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v22;

  [(BackgroundColorButton *)self->_cancelButton addTarget:self action:"_didTapCancelButton:" forControlEvents:64];
  v24 = +[NavUserDecisionButtonFactory confirmButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v24;

  [(MapsProgressButton *)self->_confirmButton addTarget:self action:"_didTapActionButton:" forControlEvents:64];
  [(MapsProgressButton *)self->_confirmButton setProgressBarHidden:self->_progressBarHidden];
  [(MapsProgressButton *)self->_confirmButton setProgress:self->_rerouteTimerProgress];
  id v26 = objc_alloc((Class)UIStackView);
  v27 = self->_confirmButton;
  v86[0] = self->_cancelButton;
  v86[1] = v27;
  v28 = +[NSArray arrayWithObjects:v86 count:2];
  v29 = (UIStackView *)[v26 initWithArrangedSubviews:v28];
  buttonsStackView = self->_buttonsStackView;
  self->_buttonsStackView = v29;

  [(UIStackView *)self->_buttonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_buttonsStackView setAxis:0];
  [(UIStackView *)self->_buttonsStackView setDistribution:1];
  [(UIStackView *)self->_buttonsStackView setAlignment:0];
  [(UIStackView *)self->_buttonsStackView setSpacing:16.0];
  [(UIStackView *)self->_buttonsStackView setAccessibilityIdentifier:@"ButtonStack"];
  v31 = [(NavTrafficIncidentContaineeViewController *)self buttonsStackView];
  [v4 addSubview:v31];

  v32 = [(NavTrafficIncidentContaineeViewController *)self buttonsStackView];
  v33 = [v32 topAnchor];
  v34 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  actionButtonsBottomConstraint = self->_actionButtonsBottomConstraint;
  self->_actionButtonsBottomConstraint = v36;

  v82 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  v80 = [v82 leadingAnchor];
  v81 = [(NavTrafficIncidentContaineeViewController *)self view];
  v79 = [v81 leadingAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v85[0] = v78;
  v77 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  v75 = [v77 trailingAnchor];
  v76 = [(NavTrafficIncidentContaineeViewController *)self view];
  v74 = [v76 trailingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v85[1] = v73;
  v72 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  v70 = [v72 topAnchor];
  v71 = [(NavTrafficIncidentContaineeViewController *)self view];
  v69 = [v71 topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v85[2] = v68;
  v67 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
  v65 = [v67 leadingAnchor];
  v66 = [(NavTrafficIncidentContaineeViewController *)self view];
  v64 = [v66 leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v85[3] = v63;
  v62 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
  v60 = [v62 trailingAnchor];
  v61 = [(NavTrafficIncidentContaineeViewController *)self view];
  v59 = [v61 trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v85[4] = v58;
  v57 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
  v55 = [v57 topAnchor];
  v56 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  v54 = [v56 bottomAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v85[5] = v53;
  v52 = [(NavTrafficIncidentContaineeViewController *)self buttonsStackView];
  v50 = [v52 leadingAnchor];
  v51 = [(NavTrafficIncidentContaineeViewController *)self view];
  v49 = [v51 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:16.0];
  v85[6] = v48;
  v38 = [(NavTrafficIncidentContaineeViewController *)self buttonsStackView];
  v39 = [v38 trailingAnchor];
  v40 = [(NavTrafficIncidentContaineeViewController *)self view];
  v41 = [v40 trailingAnchor];
  v42 = [v39 constraintEqualToAnchor:v41 constant:-16.0];
  v85[7] = v42;
  v43 = [(NavTrafficIncidentContaineeViewController *)self buttonsStackView];
  v44 = [v43 heightAnchor];
  v45 = [v44 constraintEqualToConstant:65.0];
  v46 = self->_actionButtonsBottomConstraint;
  v85[8] = v45;
  v85[9] = v46;
  v47 = +[NSArray arrayWithObjects:v85 count:10];
  +[NSLayoutConstraint activateConstraints:v47];

  [(NavTrafficIncidentContaineeViewController *)self _updateViewsFromContent];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v10 viewDidLayoutSubviews];
  double previousWidth = self->_previousWidth;
  BOOL v4 = [(NavTrafficIncidentContaineeViewController *)self view];
  [v4 bounds];
  double v6 = v5;

  if (previousWidth != v6)
  {
    unsigned int v7 = [(NavTrafficIncidentContaineeViewController *)self view];
    [v7 bounds];
    self->_double previousWidth = v8;

    id v9 = [(ContaineeViewController *)self cardPresentationController];
    [v9 updateHeightForCurrentLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v12 viewWillAppear:a3];
  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_didReceiveIncidentUpdate:" name:@"SiriTrafficIncidentUpdateNotification" object:0];

  double v5 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];

  double v6 = +[MKMapService sharedService];
  if (v5)
  {
    unsigned int v7 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];
    double v8 = v6;
    uint64_t v9 = 248;
    uint64_t v10 = 401;
  }
  else
  {
    unsigned int v7 = [(NavTrafficIncidentContaineeViewController *)self _incidentTypeAsString];
    double v8 = v6;
    uint64_t v9 = 110;
    uint64_t v10 = 0;
  }
  [v8 captureUserAction:v9 onTarget:v10 eventValue:v7];

  unsigned int v11 = [(ContaineeViewController *)self cardPresentationController];
  -[NavTrafficIncidentContaineeViewController _updateActionButtonsPaddingForLayout:](self, "_updateActionButtonsPaddingForLayout:", [v11 containeeLayout]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SiriTrafficIncidentUpdateNotification" object:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NavTrafficIncidentContaineeViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v11 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  double v6 = [(NavTrafficIncidentContaineeViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    double v8 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];

    uint64_t v9 = [(NavTrafficIncidentContaineeViewController *)self titleView];
    if (v8)
    {
      uint64_t v10 = [(NavTrafficIncidentContaineeViewController *)self incidentAlert];
      +[NavTrafficIncidentViewComposer configureHeaderView:v9 withTrafficIncidentAlert:v10];
    }
    else
    {
      uint64_t v10 = [(NavTrafficIncidentContaineeViewController *)self incident];
      +[NavTrafficIncidentViewComposer configureHeaderView:v9 withTrafficIncidentFeature:v10];
    }
  }
}

- (void)applyAlphaToContent:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  if (![(NavTrafficIncidentContaineeViewController *)self _hasIncidentDetailsContent]) {
    a3 = 0.0;
  }
  id v5 = [(NavTrafficIncidentContaineeViewController *)self headerView];
  [v5 setHairLineAlpha:a3];
}

- (void)handleDismissAction:(id)a3
{
  incidentAlert = self->_incidentAlert;
  id v5 = a3;
  objc_super v6 = [(MNTrafficIncidentAlert *)incidentAlert analyticsMessage];

  id v7 = +[MKMapService sharedService];
  uint64_t v8 = [(NavTrafficIncidentContaineeViewController *)self currentUITargetForAnalytics];
  if (v6)
  {
    uint64_t v9 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];
    uint64_t v10 = v7;
    uint64_t v11 = 4;
  }
  else
  {
    uint64_t v9 = [(NavTrafficIncidentContaineeViewController *)self _incidentTypeAsString];
    uint64_t v10 = v7;
    uint64_t v11 = 108;
  }
  [v10 captureUserAction:v11 onTarget:v8 eventValue:v9];

  v14.receiver = self;
  v14.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v14 handleDismissAction:v5];

  objc_super v12 = [(NavTrafficIncidentContaineeViewController *)self dismissHandler];

  if (v12)
  {
    v13 = [(NavTrafficIncidentContaineeViewController *)self dismissHandler];
    v13[2]();
  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v5 willChangeLayout:"willChangeLayout:"];
  [(NavTrafficIncidentContaineeViewController *)self _updateActionButtonsPaddingForLayout:a3];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NavTrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v4 didChangeLayout:a3];
  [(NavTrafficIncidentContaineeViewController *)self _updateGrabberVisibility];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 bottomSafeOffset];
    double v8 = v7;
    [(ContaineeViewController *)self headerHeight];
    double v10 = v8 + v9;
    [(NavTrafficIncidentContaineeViewController *)self actionButtonsHeightForLayout:1];
    goto LABEL_9;
  }
  double v4 = -1.0;
  if (a3 == 2)
  {
    if (![(NavTrafficIncidentContaineeViewController *)self _hasIncidentDetailsContent]
      && ![(NavTrafficIncidentContaineeViewController *)self _hasActionButtons])
    {
      return v4;
    }
    [(ContaineeViewController *)self headerHeight];
    double v13 = v12;
    [(NavTrafficIncidentContaineeViewController *)self detailsHeight];
    double v15 = v13 + v14;
    [(NavTrafficIncidentContaineeViewController *)self actionButtonsHeightForLayout:2];
    double v10 = v15 + v16;
    objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 bottomSafeOffset];
LABEL_9:
    double v4 = v10 + v11;
    goto LABEL_10;
  }
  if (a3 == 4)
  {
    objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 availableHeight];
    double v4 = v6;
LABEL_10:
  }
  return v4;
}

- (void)_updateActionButtonsPaddingForLayout:(unint64_t)a3
{
  if (a3 == 1
    && ![(NavTrafficIncidentContaineeViewController *)self _displayActionButtonsForSmallLayout])
  {
    id v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 bottomSafeOffset];
    -[NSLayoutConstraint setConstant:](self->_actionButtonsBottomConstraint, "setConstant:");
  }
  else
  {
    actionButtonsBottomConstraint = self->_actionButtonsBottomConstraint;
    [(NSLayoutConstraint *)actionButtonsBottomConstraint setConstant:0.0];
  }
}

- (double)detailsHeight
{
  double v3 = 0.0;
  if ([(NavTrafficIncidentContaineeViewController *)self _hasIncidentDetailsContent])
  {
    double v4 = [(NavTrafficIncidentContaineeViewController *)self incidentDetailsView];
    [v4 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
    double v3 = v5;
  }
  return v3;
}

- (double)actionButtonsHeightForLayout:(unint64_t)a3
{
  unsigned int v5 = [(NavTrafficIncidentContaineeViewController *)self _hasActionButtons];
  if (a3 == 1)
  {
    double result = 0.0;
    if (!v5) {
      return result;
    }
    unsigned int v5 = [(NavTrafficIncidentContaineeViewController *)self _displayActionButtonsForSmallLayout];
  }
  double result = 80.0;
  if (!v5) {
    return 0.0;
  }
  return result;
}

- (void)headerViewTapped:(id)a3
{
  double v4 = +[MKMapService sharedService];
  uint64_t v5 = [(NavTrafficIncidentContaineeViewController *)self currentUITargetForAnalytics];
  double v6 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];
  [v4 captureUserAction:3 onTarget:v5 eventValue:v6];

  double v7 = [(ContaineeViewController *)self cardPresentationController];
  id v8 = [v7 containeeLayout];

  if (v8 == (id)2) {
    goto LABEL_8;
  }
  if (v8 != (id)1) {
    return;
  }
  if ([(NavTrafficIncidentContaineeViewController *)self _hasIncidentDetailsContent]
    || [(NavTrafficIncidentContaineeViewController *)self _hasActionButtons])
  {
    double v9 = [(ContaineeViewController *)self cardPresentationController];
    id v10 = [v9 containerStyle];

    if (v10 == (id)5) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 2;
    }
  }
  else
  {
LABEL_8:
    uint64_t v11 = 1;
  }
  if ((id)v11 != v8)
  {
    id v12 = [(ContaineeViewController *)self cardPresentationController];
    [v12 wantsLayout:v11];
  }
}

- (void)setRerouteTimerProgress:(double)a3
{
  self->_rerouteTimerProgress = a3;
  -[MapsProgressButton setProgress:](self->_confirmButton, "setProgress:");
}

- (double)rerouteTimerProgress
{
  return self->_rerouteTimerProgress;
}

- (void)setProgressBarHidden:(BOOL)a3
{
  self->_progressBarHidden = a3;
  -[MapsProgressButton setProgressBarHidden:](self->_confirmButton, "setProgressBarHidden:");
}

- (BOOL)progressBarHidden
{
  return self->_progressBarHidden;
}

- (void)_didTapCancelButton:(id)a3
{
  id v3 = [(NavTrafficIncidentContaineeViewController *)self delegate];
  [v3 didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:739];
}

- (void)_didTapActionButton:(id)a3
{
  id v3 = [(NavTrafficIncidentContaineeViewController *)self delegate];
  [v3 didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:739];
}

- (int)currentUITargetForAnalytics
{
  return 615;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (id)_incidentTypeAsString
{
  if (self->_incidentAlert)
  {
    v2 = [(MNTrafficIncidentAlert *)self->_incidentAlert incident];
    id v3 = [v2 type];
    double v4 = @"ACCIDENT";
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        double v4 = @"CONSTRUCTION";
        break;
      case 2:
        double v4 = @"ROAD_CLOSURE";
        break;
      case 3:
        double v4 = @"EVENT";
        break;
      case 4:
        double v4 = @"HAZARD";
        break;
      case 5:
        double v4 = @"LANE_CLOSURE";
        break;
      case 6:
        double v4 = @"RAMP_CLOSURE";
        break;
      case 7:
        double v4 = @"TRAFFIC";
        break;
      case 8:
        double v4 = @"WALKING_CLOSURE";
        break;
      case 9:
        double v4 = @"CONGESTION_ZONE_RESTRICTION";
        break;
      case 10:
        double v4 = @"LICENSE_PLATE_RESTRICTION";
        break;
      case 11:
      case 12:
        goto LABEL_7;
      case 13:
        double v4 = @"SPEED_TRAP";
        break;
      case 14:
        double v4 = @"AREA_INCIDENT";
        break;
      default:
        if (v3 == 100)
        {
          double v4 = @"TIME_BASED_RESTRICTION";
        }
        else
        {
LABEL_7:
          double v4 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
        }
        break;
    }
  }
  else
  {
    double v4 = +[VKTrafficIncidentFeature stringForIncidentType:[(VKTrafficIncidentFeature *)self->_incident type]];
  }

  return v4;
}

- (void)_didReceiveIncidentUpdate:(id)a3
{
  double v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"SiriTrafficIncidentIsClearKey"];
  unsigned int v6 = [v5 BOOLValue];

  double v7 = [(NavTrafficIncidentContaineeViewController *)self delegate];
  id v8 = v7;
  if (v6) {
    [v7 didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:0];
  }
  else {
    [v7 didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:0];
  }
}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (MNTrafficIncidentAlert)incidentAlert
{
  return self->_incidentAlert;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (NavTrafficIncidentAlertViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavTrafficIncidentAlertViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ContainerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (NavTrafficIncidentHeaderView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (NavTrafficIncidentDetailsView)incidentDetailsView
{
  return self->_incidentDetailsView;
}

- (void)setIncidentDetailsView:(id)a3
{
}

- (BackgroundColorButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (MapsProgressButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_double previousWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_incidentDetailsView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_incidentAlert, 0);
  objc_storeStrong((id *)&self->_incident, 0);

  objc_storeStrong((id *)&self->_actionButtonsBottomConstraint, 0);
}

@end