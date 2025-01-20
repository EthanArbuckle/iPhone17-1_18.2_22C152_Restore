@interface IOSRoutePlanningOverviewViewController
+ (float)contentViewBottomConstraintPriority;
+ (float)contentViewTopConstraintPriority;
- (BOOL)_shouldShowPedestrianARTeachableMomentCard;
- (BOOL)_supportsTransportTypePicker;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)sheetExpandingFromMedium;
- (BOOL)shouldIgnoreTapOnView:(id)a3 headerView:(id)a4;
- (BOOL)wasSheetDragging;
- (CGRect)_loadingAndErrorViewFrame;
- (GCDTimer)pedestrianARFeatureIntroTeachableMomentTimer;
- (IOSRoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSLayoutConstraint)collectionViewTopToContentViewConstraint;
- (NSLayoutConstraint)collectionViewTopToFieldsViewConstraint;
- (PedestrianARSessionStateManager)pedestrianARSessionStateManager;
- (RouteOverviewFieldsView)fieldsView;
- (RoutePlanningEbikeRefinementModel)ebikeRefinement;
- (RoutePlanningPreferenceRefinementModel)preferenceRefinement;
- (RoutePlanningPreferredNetworksRefinementModel)preferredNetworksRefinement;
- (RoutePlanningTimingRefinementModel)timingRefinement;
- (RoutePlanningTransportTypeRefinementModel)transportTypeRefinement;
- (RoutePlanningVehicleRefinementModel)vehicleRefinement;
- (double)_cardHeightMinusTableViewHeight;
- (double)_extraBottomPadding;
- (double)_percentCollapsedFullToMedium;
- (double)contentOffsetWhenDraggingBegan;
- (double)heightForLayout:(unint64_t)a3;
- (id)_initialConstraints;
- (id)currentRefinementsForFieldsView:(id)a3;
- (id)waypointsForFieldsView:(id)a3;
- (int64_t)observedRoutePlanningData;
- (int64_t)transportTypeForFieldsView:(id)a3;
- (void)_createStyleSpecificConstraintsIfNeeded;
- (void)_didSelectWaypoint:(id)a3 atIndex:(unint64_t)a4;
- (void)_didTapHeaderView;
- (void)_forceChangeOrigin;
- (void)_refreshContentInset;
- (void)_refreshRouteForChangeInWaypointListView:(id)a3;
- (void)_refreshRouteForWaypoints:(id)a3;
- (void)_refreshTimingDisplay;
- (void)_setupSubviews;
- (void)_showPedestrianARFeatureIntroTeachableMomentCardIfNecessary;
- (void)_showPedestrianARRaiseToEnterTeachableMomentCardIfNecessary;
- (void)_updateFieldsViewSuperviewIfNeeded;
- (void)_updateTransitionScrollPosition;
- (void)_updateWaypointsAndRoutesListForCurrentContaineeLayout:(unint64_t)a3;
- (void)dealloc;
- (void)didChangeContainerStyle:(unint64_t)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didResignCurrent;
- (void)didTapTimingInFieldsView:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pressedRefinementModel:(id)a3;
- (void)replaceOriginWithCurrentLocation;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateCyclePreferences:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateDrivePreferences:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRequestState:(int64_t)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransitPreferences:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateVirtualGarage:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateWalkPreferences:(id)a4;
- (void)selectedRefinementModel:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setCollectionViewTopToContentViewConstraint:(id)a3;
- (void)setCollectionViewTopToFieldsViewConstraint:(id)a3;
- (void)setContentOffsetWhenDraggingBegan:(double)a3;
- (void)setEbikeRefinement:(id)a3;
- (void)setFieldsView:(id)a3;
- (void)setPedestrianARFeatureIntroTeachableMomentTimer:(id)a3;
- (void)setPreferenceRefinement:(id)a3;
- (void)setPreferredNetworksRefinement:(id)a3;
- (void)setSheetExpandingFromMedium:(BOOL)a3;
- (void)setTimingRefinement:(id)a3;
- (void)setTransportTypeRefinement:(id)a3;
- (void)setVehicleRefinement:(id)a3;
- (void)setWasSheetDragging:(BOOL)a3;
- (void)updatedRefinementModel:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)waypointListView:(id)a3 didDeleteWaypointAtIndex:(unint64_t)a4;
- (void)waypointListView:(id)a3 didMoveWaypoint:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)waypointListView:(id)a3 didSelectCollapsedWaypoints:(id)a4;
- (void)waypointListView:(id)a3 didSelectWaypoint:(id)a4 atIndex:(unint64_t)a5;
- (void)waypointListViewDidSelectAddStop:(id)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation IOSRoutePlanningOverviewViewController

- (IOSRoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IOSRoutePlanningOverviewViewController;
  v3 = [(RoutePlanningOverviewViewController *)&v7 initWithDataCoordinator:a3];
  if (v3)
  {
    v4 = +[UIApplication sharedMapsDelegate];
    v5 = NSStringFromSelector("currentInterruptionKind");
    [v4 addObserver:v3 forKeyPath:v5 options:1 context:&unk_10160F2E0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[UIApplication sharedMapsDelegate];
  v4 = NSStringFromSelector("currentInterruptionKind");
  [v3 removeObserver:self forKeyPath:v4 context:&unk_10160F2E0];

  v5.receiver = self;
  v5.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v5 dealloc];
}

- (int64_t)observedRoutePlanningData
{
  v3.receiver = self;
  v3.super_class = (Class)IOSRoutePlanningOverviewViewController;
  return (unint64_t)[(RoutePlanningOverviewViewController *)&v3 observedRoutePlanningData] | 0x33180;
}

- (void)didResignCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v3 didResignCurrent];
  self->super._restoreRoutePlanningAfterRouteCreation = 0;
  [(IOSRoutePlanningOverviewViewController *)self setPedestrianARFeatureIntroTeachableMomentTimer:0];
}

- (void)_setupSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v24 _setupSubviews];
  objc_super v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v3 setSelectionFollowsFocus:1];

  v4 = [(RoutePlanningOverviewViewController *)self collectionView];
  objc_initWeak(&location, self);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100615E10;
  v21 = &unk_1012E6708;
  objc_copyWeak(&v22, &location);
  [v4 setLayoutHandler:&v18];
  [(IOSRoutePlanningOverviewViewController *)self _refreshContentInset];
  objc_super v5 = [(RoutePlanningOverviewViewController *)self transportTypePicker];

  if (v5)
  {
    v6 = [(ContaineeViewController *)self contentView];
    objc_super v7 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    [v6 addSubview:v7];
  }
  v8 = [[RouteOverviewFieldsView alloc] initWithDelegate:self waypointInfoProvider:self];
  [(IOSRoutePlanningOverviewViewController *)self setFieldsView:v8];

  v9 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"[Route Planning] Directions Title" value:@"localized string not found" table:0];
  [v10 setText:v12];

  LODWORD(v13) = 1148846080;
  [v10 setContentCompressionResistancePriority:1 forAxis:v13];
  +[DynamicTypeWizard autorefreshLabel:v10 withFontProvider:&stru_1013212A0];
  v14 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v14 setTitleView:v10];

  v15 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v15 setTitleViewInsets:16.0, 16.0, 12.0, 16.0];

  v16 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v16 setAccessoryView:0];

  v17 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v17 setAccessoryViewInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

  [(IOSRoutePlanningOverviewViewController *)self _updateFieldsViewSuperviewIfNeeded];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (id)_initialConstraints
{
  v57.receiver = self;
  v57.super_class = (Class)IOSRoutePlanningOverviewViewController;
  objc_super v3 = [(RoutePlanningOverviewViewController *)&v57 _initialConstraints];
  v4 = [(ContaineeViewController *)self contentView];
  objc_super v5 = [v4 topAnchor];
  v6 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  objc_super v7 = [v6 buttonViewForVisualAlignment];
  v8 = [v7 bottomAnchor];
  LODWORD(v9) = 1148829696;
  id v10 = [v5 constraintEqualToAnchor:v8 constant:12.0 priority:v9];
  [v3 addObject:v10];

  v11 = [(ContaineeViewController *)self contentView];
  v12 = [v11 topAnchor];
  double v13 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  v14 = [v13 titleViewLayoutGuide];
  v15 = [v14 bottomAnchor];
  v16 = [v12 constraintGreaterThanOrEqualToAnchor:v15 constant:8.0];
  id v56 = v3;
  [v3 addObject:v16];

  v17 = [(ContaineeViewController *)self contentView];
  v18 = [v17 topAnchor];
  uint64_t v19 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  v20 = [v19 titleViewLayoutGuide];
  v21 = [v20 bottomAnchor];
  id v22 = [v18 constraintLessThanOrEqualToAnchor:v21 constant:12.0];
  [v3 addObject:v22];

  v54 = [(RoutePlanningOverviewViewController *)self collectionView];
  v50 = [v54 leadingAnchor];
  v52 = [(ContaineeViewController *)self contentView];
  v23 = [v52 leadingAnchor];
  objc_super v24 = [v50 constraintEqualToAnchor:v23];
  v59[0] = v24;
  v25 = [(RoutePlanningOverviewViewController *)self collectionView];
  v26 = [v25 trailingAnchor];
  v27 = [(ContaineeViewController *)self contentView];
  v28 = [v27 trailingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v59[1] = v29;
  v30 = [(RoutePlanningOverviewViewController *)self collectionViewToBottomConstraint];
  v59[2] = v30;
  v31 = +[NSArray arrayWithObjects:v59 count:3];
  [v56 addObjectsFromArray:v31];

  v32 = [(RoutePlanningOverviewViewController *)self transportTypePicker];

  if (v32)
  {
    v55 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    v53 = [v55 heightAnchor];
    v51 = [v53 constraintEqualToConstant:38.0];
    v58[0] = v51;
    v49 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    v47 = [v49 topAnchor];
    v48 = [(ContaineeViewController *)self contentView];
    v46 = [v48 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v58[1] = v45;
    v44 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    v33 = [v44 leadingAnchor];
    v34 = [(ContaineeViewController *)self contentView];
    v35 = [v34 leadingAnchor];
    v36 = [v33 constraintEqualToAnchor:v35 constant:16.0];
    v58[2] = v36;
    v37 = [(ContaineeViewController *)self contentView];
    v38 = [v37 trailingAnchor];
    v39 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    v40 = [v39 trailingAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:16.0];
    v58[3] = v41;
    v42 = +[NSArray arrayWithObjects:v58 count:4];
    [v56 addObjectsFromArray:v42];
  }

  return v56;
}

- (void)_updateFieldsViewSuperviewIfNeeded
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v4 = (unint64_t)[v3 containerStyle];
  if (v4 > 7 || ((1 << v4) & 0xA3) == 0)
  {
    unsigned int v7 = 1;
  }
  else
  {
    v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    unsigned int v7 = [v6 hasExpandedWaypoints];
  }
  v8 = [(RoutePlanningOverviewViewController *)self collectionView];
  double v9 = [v8 dataSource];

  id v10 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  v11 = v10;
  if (v7)
  {
    v12 = [v9 headerView];

    if (v11 != v12)
    {
      [(IOSRoutePlanningOverviewViewController *)self _createStyleSpecificConstraintsIfNeeded];
      double v13 = [(IOSRoutePlanningOverviewViewController *)self collectionViewTopToFieldsViewConstraint];
      [v13 setActive:0];

      v14 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
      [v9 setHeaderView:v14];

      [(RoutePlanningOverviewViewController *)self _setupAdvisoryFooterView];
      v15 = [(IOSRoutePlanningOverviewViewController *)self collectionViewTopToContentViewConstraint];
      [v15 setActive:1];

      v16 = [(RoutePlanningOverviewViewController *)self collectionView];
      [v16 contentInset];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      v23 = [(RoutePlanningOverviewViewController *)self collectionView];
      [v23 setContentInset:0.0, v18, v20, v22];

      objc_super v24 = [(IOSRoutePlanningOverviewViewController *)self view];
      [v24 setNeedsLayout];
    }
  }
  else
  {
    v25 = [v10 superview];
    v26 = [(ContaineeViewController *)self contentView];

    if (v25 != v26)
    {
      [(IOSRoutePlanningOverviewViewController *)self _createStyleSpecificConstraintsIfNeeded];
      v27 = [(IOSRoutePlanningOverviewViewController *)self collectionViewTopToContentViewConstraint];
      [v27 setActive:0];

      [v9 setHeaderView:0];
      [(RoutePlanningOverviewViewController *)self _setupAdvisoryFooterView];
      v28 = [(ContaineeViewController *)self contentView];
      v29 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
      [v28 addSubview:v29];

      v30 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
      v31 = [v30 bottomAnchor];
      v32 = v31;
      v54 = v9;
      if (v31)
      {
        id v33 = v31;
      }
      else
      {
        v34 = [(ContaineeViewController *)self contentView];
        id v33 = [v34 topAnchor];
      }
      v50 = v33;

      v35 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
      if (v35) {
        double v36 = 10.0;
      }
      else {
        double v36 = 0.0;
      }

      v53 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
      v52 = [v53 topAnchor];
      v51 = [v52 constraintEqualToAnchor:v33 constant:v36];
      v55[0] = v51;
      v49 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
      v48 = [v49 leadingAnchor];
      v37 = [(ContaineeViewController *)self contentView];
      v38 = [v37 leadingAnchor];
      v39 = [v48 constraintEqualToAnchor:v38];
      v55[1] = v39;
      v40 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
      v41 = [v40 trailingAnchor];
      v42 = [(ContaineeViewController *)self contentView];
      v43 = [v42 trailingAnchor];
      v44 = [v41 constraintEqualToAnchor:v43];
      v55[2] = v44;
      v45 = +[NSArray arrayWithObjects:v55 count:3];
      +[NSLayoutConstraint activateConstraints:v45];

      v46 = [(IOSRoutePlanningOverviewViewController *)self collectionViewTopToFieldsViewConstraint];
      [v46 setActive:1];

      v47 = [(IOSRoutePlanningOverviewViewController *)self view];
      [v47 setNeedsLayout];

      double v9 = v54;
    }
  }
}

- (void)_createStyleSpecificConstraintsIfNeeded
{
  uint64_t v3 = [(IOSRoutePlanningOverviewViewController *)self collectionViewTopToFieldsViewConstraint];
  if (!v3
    || (unint64_t v4 = (void *)v3,
        [(IOSRoutePlanningOverviewViewController *)self collectionViewTopToContentViewConstraint], objc_super v5 = objc_claimAutoreleasedReturnValue(), v5, v4, !v5))
  {
    v6 = [(RoutePlanningOverviewViewController *)self collectionView];
    unsigned int v7 = [v6 topAnchor];
    v8 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    double v9 = [v8 bottomAnchor];
    id v10 = [v7 constraintEqualToAnchor:v9 constant:12.0];
    [(IOSRoutePlanningOverviewViewController *)self setCollectionViewTopToFieldsViewConstraint:v10];

    v11 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    v12 = [v11 bottomAnchor];
    double v13 = v12;
    if (v12)
    {
      id v20 = v12;
    }
    else
    {
      v14 = [(ContaineeViewController *)self contentView];
      id v20 = [v14 topAnchor];
    }
    v15 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    if (v15) {
      double v16 = 10.0;
    }
    else {
      double v16 = 0.0;
    }

    double v17 = [(RoutePlanningOverviewViewController *)self collectionView];
    double v18 = [v17 topAnchor];
    double v19 = [v18 constraintEqualToAnchor:v20 constant:v16];
    [(IOSRoutePlanningOverviewViewController *)self setCollectionViewTopToContentViewConstraint:v19];
  }
}

- (double)_cardHeightMinusTableViewHeight
{
  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v9 _cardHeightMinusTableViewHeight];
  double v4 = v3;
  objc_super v5 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v5 layoutIfNeeded];

  v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v6 bounds];
  double v7 = v4 + CGRectGetHeight(v10);

  return v7;
}

- (CGRect)_loadingAndErrorViewFrame
{
  double v3 = [(ContaineeViewController *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  CGRect v10 = [(ContaineeViewController *)self contentView];
  v11 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  double v21 = [v20 superview];
  [v10 convertRect:v21 fromView:v13, v15, v17, v19];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v28 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v28 estimatedHeight];
  CGFloat v30 = v29;

  v43.origin.x = v23;
  v43.origin.y = v25;
  v43.size.width = v27;
  v43.size.height = v30;
  double v31 = CGRectGetMaxY(v43) + 8.0;
  v44.origin.x = v5;
  v44.origin.y = v31;
  v44.size.width = v7;
  v44.size.height = v9;
  double Height = CGRectGetHeight(v44);
  v45.origin.x = v5;
  v45.origin.y = v31;
  v45.size.width = v7;
  v45.size.height = v9;
  double v33 = Height - CGRectGetMinY(v45);
  p_errorModeView = (id *)&self->super._errorModeView;
  v35 = [(ErrorModeView *)self->super._errorModeView superview];

  if (v35
    || (p_errorModeView = (id *)&self->super._loadingModeView,
        [(LoadingModeView *)self->super._loadingModeView superview],
        double v36 = objc_claimAutoreleasedReturnValue(),
        v36,
        v36))
  {
    [*p_errorModeView fittingHeight];
    double v38 = v37;
  }
  else
  {
    double v38 = 0.0;
  }
  v46.origin.x = v5;
  v46.origin.y = v31;
  v46.size.width = v7;
  v46.size.height = v33;
  if (v38 <= CGRectGetHeight(v46))
  {
    v47.origin.x = v5;
    v47.origin.y = v31;
    v47.size.width = v7;
    v47.size.height = v33;
    double v38 = CGRectGetHeight(v47);
  }
  double v39 = v5;
  double v40 = v31;
  double v41 = v7;
  double v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

+ (float)contentViewBottomConstraintPriority
{
  return 999.0;
}

+ (float)contentViewTopConstraintPriority
{
  return 998.0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unsigned __int8 v5 = [(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip];
  if (a3 == 4 && (v5 & 1) != 0
    || (unsigned __int8 v6 = [(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip],
        BOOL result = 0,
        a3 == 3)
    && (v6 & 1) == 0)
  {
    [(IOSRoutePlanningOverviewViewController *)self _didTapHeaderView];
    return 1;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v4 viewWillAppear:a3];
  [(IOSRoutePlanningOverviewViewController *)self _updateFieldsViewSuperviewIfNeeded];
  [(IOSRoutePlanningOverviewViewController *)self _refreshContentInset];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v4 viewDidDisappear:a3];
  self->super._previousLayoutForTransition = 0;
  self->super._previousStyleForTransition = 0;
  [(RouteOverviewFieldsView *)self->_fieldsView reset];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(IOSRoutePlanningOverviewViewController *)self _refreshContentInset];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(IOSRoutePlanningOverviewViewController *)&v9 viewWillLayoutSubviews];
  if (!self->super._previousLayoutForTransition)
  {
    unsigned __int8 v5 = [(ContaineeViewController *)self cardPresentationController];

    if (v5)
    {
      unsigned __int8 v6 = [(ContaineeViewController *)self cardPresentationController];
      self->super._previousLayoutForTransition = (unint64_t)[v6 containeeLayout];

      if (-[ContainerViewController delaysFirstCardPresentation]_0())
      {
        BOOL v7 = self->super._previousLayoutForTransition == 3;
        double v8 = [(RoutePlanningOverviewViewController *)self collectionView];
        [v8 setScrollEnabled:v7];
      }
    }
  }
  if (!self->super._previousStyleForTransition)
  {
    objc_super v3 = [(ContaineeViewController *)self cardPresentationController];

    if (v3)
    {
      objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
      self->super._previousStyleForTransition = (unint64_t)[v4 containerStyle];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)IOSRoutePlanningOverviewViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(IOSRoutePlanningOverviewViewController *)self view];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100617000;
  v9[3] = &unk_1012E81F8;
  v9[4] = self;
  [v7 animateAlongsideTransitionInView:v8 animation:&stru_1012F23A0 completion:v9];
}

- (BOOL)_supportsTransportTypePicker
{
  return GEOConfigGetBOOL();
}

- (double)_percentCollapsedFullToMedium
{
  v2 = [(IOSRoutePlanningOverviewViewController *)self sheetPresentationController];
  objc_super v3 = [v2 _maps_effectiveDetentValues];
  [v2 _currentPresentedViewFrame];
  double Height = CGRectGetHeight(v16);
  unsigned __int8 v5 = [v2 containerView];
  [v5 safeAreaInsets];
  double v7 = v6;

  double v8 = 0.0;
  if ((unint64_t)[v3 count] >= 3)
  {
    double v9 = Height - v7;
    objc_super v10 = [v3 objectAtIndexedSubscript:2];
    [v10 doubleValue];
    double v12 = v11;
    double v13 = [v3 objectAtIndexedSubscript:1];
    [v13 doubleValue];
    double v8 = fmax(fmin((v9 - v12) / (v14 - v12), 1.0), 0.0);
  }
  return v8;
}

- (void)_updateTransitionScrollPosition
{
  objc_super v3 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  objc_super v4 = [(RoutePlanningOverviewViewController *)self rootController];
  unsigned __int8 v5 = [v4 headerView];

  if (v3 == v5)
  {
    self->super._unint64_t previousStyleForTransition = 0;
    self->super._unint64_t previousLayoutForTransition = 0;
  }
  else
  {
    double v6 = [(ContaineeViewController *)self cardPresentationController];
    id v80 = [v6 containeeLayout];

    unint64_t previousLayoutForTransition = self->super._previousLayoutForTransition;
    double v8 = [(ContaineeViewController *)self cardPresentationController];
    id v79 = [v8 containerStyle];

    unint64_t previousStyleForTransition = self->super._previousStyleForTransition;
    [(IOSRoutePlanningOverviewViewController *)self _percentCollapsedFullToMedium];
    double v11 = v10;
    double v12 = [(RoutePlanningOverviewViewController *)self collectionView];
    double v13 = [(IOSRoutePlanningOverviewViewController *)self sheetPresentationController];
    id v14 = [v13 _isDragging];
    if (v14 != [(IOSRoutePlanningOverviewViewController *)self wasSheetDragging]
      || (id)previousLayoutForTransition != v80
      || (id)previousStyleForTransition != v79)
    {
      [(IOSRoutePlanningOverviewViewController *)self setWasSheetDragging:v14];
      char v15 = (id)previousLayoutForTransition == v80 ? (char)v14 : 1;
      if ((v15 & 1) != 0 || (id)previousStyleForTransition != v79)
      {
        [v12 contentOffset];
        [(IOSRoutePlanningOverviewViewController *)self setContentOffsetWhenDraggingBegan:v16];
        double v17 = [v13 selectedDetentIdentifier];
        -[IOSRoutePlanningOverviewViewController setSheetExpandingFromMedium:](self, "setSheetExpandingFromMedium:", [v17 isEqualToString:UISheetPresentationControllerDetentIdentifierLarge] ^ 1);

        double v18 = sub_100613704();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          [(IOSRoutePlanningOverviewViewController *)self contentOffsetWhenDraggingBegan];
          double v20 = v19;
          if ([(IOSRoutePlanningOverviewViewController *)self sheetExpandingFromMedium]) {
            double v21 = @"YES";
          }
          else {
            double v21 = @"NO";
          }
          *(double *)&v75 = COERCE_DOUBLE(v21);
          if (v14) {
            double v22 = @"YES";
          }
          else {
            double v22 = @"NO";
          }
          v77 = v13;
          double v23 = COERCE_DOUBLE(v22);
          if ((id)previousLayoutForTransition == v80) {
            double v24 = @"NO";
          }
          else {
            double v24 = @"YES";
          }
          CGFloat v25 = v24;
          if ((id)previousStyleForTransition == v79) {
            double v26 = @"NO";
          }
          else {
            double v26 = @"YES";
          }
          CGFloat v27 = v26;
          *(_DWORD *)buf = 134350338;
          v82 = self;
          __int16 v83 = 2048;
          double v84 = v20;
          __int16 v85 = 2112;
          double v86 = *(double *)&v75;
          __int16 v87 = 2112;
          double v88 = v23;
          __int16 v89 = 2112;
          v90 = v25;
          __int16 v91 = 2112;
          v92 = v27;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Recording initial offset %#.1lf, expanding: %@ (dragging: %@, layoutChanged: %@, styleChanged: %@)", buf, 0x3Eu);

          double v13 = v77;
        }
      }
    }
    if (([v12 isDragging] & 1) == 0)
    {
      [(RoutePlanningOverviewViewController *)self _rectOfRowToKeepVisible];
      double MinY = CGRectGetMinY(v95);
      double v78 = v11;
      double v29 = -(MinY * v11);
      [v12 contentInset];
      double v31 = v30;
      double v76 = v32;
      double v34 = v33;
      double v36 = v35;
      id v37 = v12;
      double v38 = vabdd_f64(v29, v31);
      double v39 = [v37 traitCollection];
      [v39 displayScale];
      double v40 = 1.0;
      if (v41 >= 1.0)
      {
        [v37 traitCollection];
        unint64_t v42 = previousStyleForTransition;
        v44 = unint64_t v43 = previousLayoutForTransition;
        [v44 displayScale];
        double v40 = v45;

        unint64_t previousLayoutForTransition = v43;
        unint64_t previousStyleForTransition = v42;
      }

      if (v38 > 1.0 / v40)
      {
        CGRect v46 = sub_100613704();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349824;
          v82 = self;
          __int16 v83 = 2048;
          double v84 = v31;
          __int16 v85 = 2048;
          double v86 = v29;
          __int16 v87 = 2048;
          double v88 = v78 * 100.0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Updating contentInset.top: %#.1lf -> %#.1lf (percentCollapsed: %3.1lf)", buf, 0x2Au);
        }

        [v37 setContentInset:v29, v76, v34, v36];
      }
      unsigned int v47 = [v13 _isGeneratingAnimations];
      if (((v14 | v47) & 1) != 0
        || (id)previousLayoutForTransition != v80
        || (id)previousStyleForTransition != v79)
      {
        [v37 adjustedContentInset];
        double v49 = v48 - v29;
        id v74 = (id)previousLayoutForTransition;
        if ([(IOSRoutePlanningOverviewViewController *)self sheetExpandingFromMedium]) {
          double v50 = -v49;
        }
        else {
          [(IOSRoutePlanningOverviewViewController *)self contentOffsetWhenDraggingBegan];
        }
        double v51 = (1.0 - v78) * v50 - (v49 - MinY) * v78;
        [v37 contentOffset];
        double v53 = v52;
        id v54 = v37;
        double v55 = vabdd_f64(v51, v53);
        id v56 = [v54 traitCollection];
        [v56 displayScale];
        double v57 = 1.0;
        if (v58 >= 1.0)
        {
          [v54 traitCollection];
          v60 = unint64_t v59 = previousStyleForTransition;
          [v60 displayScale];
          double v57 = v61;

          unint64_t previousStyleForTransition = v59;
        }

        unint64_t previousLayoutForTransition = (unint64_t)v74;
        if (v55 > 1.0 / v57)
        {
          v62 = sub_100613704();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            [v54 contentOffset];
            double v64 = v63;
            if (v14) {
              v65 = @"YES";
            }
            else {
              v65 = @"NO";
            }
            double v66 = COERCE_DOUBLE(v65);
            if (v47) {
              v67 = @"YES";
            }
            else {
              v67 = @"NO";
            }
            v68 = v67;
            if (v74 == v80) {
              v69 = @"NO";
            }
            else {
              v69 = @"YES";
            }
            v70 = v69;
            if ((id)previousStyleForTransition == v79) {
              v71 = @"NO";
            }
            else {
              v71 = @"YES";
            }
            v72 = v71;
            *(_DWORD *)buf = 134350594;
            v82 = self;
            __int16 v83 = 2048;
            double v84 = v64;
            __int16 v85 = 2048;
            double v86 = v51;
            __int16 v87 = 2112;
            double v88 = v66;
            __int16 v89 = 2112;
            v90 = v68;
            __int16 v91 = 2112;
            v92 = v70;
            __int16 v93 = 2112;
            v94 = v72;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Updating contentOffset.y:  %#.1lf -> %#.1lf (dragging: %@, generatingAnimations: %@, layoutChanged: %@, styleChanged: %@)", buf, 0x48u);
          }
          [v54 setContentOffset:0.0 v51];
          unint64_t previousLayoutForTransition = (unint64_t)v74;
        }
      }
      if ((id)previousLayoutForTransition != v80 || (id)previousStyleForTransition != v79)
      {
        v73 = sub_100613704();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          v82 = self;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Storing layout/style for next transition", buf, 0xCu);
        }

        self->super._unint64_t previousLayoutForTransition = (unint64_t)v80;
        self->super._unint64_t previousStyleForTransition = (unint64_t)v79;
      }
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_2;
    case 2uLL:
      double v11 = [(IOSRoutePlanningOverviewViewController *)self traitCollection];
      id v12 = [v11 verticalSizeClass];

      double v3 = -1.0;
      if (v12 == (id)1) {
        goto LABEL_5;
      }
      [(RoutePlanningOverviewViewController *)self _fittingHeightForMediumLayout];
      break;
    case 3uLL:
    case 4uLL:
      double v9 = [(ContaineeViewController *)self cardPresentationController];
      [v9 availableHeight];
      double v3 = v10;

      goto LABEL_5;
    case 5uLL:
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315650;
        double v18 = "-[IOSRoutePlanningOverviewViewController heightForLayout:]";
        __int16 v19 = 2080;
        double v20 = "RoutePlanningOverviewViewController.m";
        __int16 v21 = 1024;
        int v22 = 2352;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v17, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        char v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          double v16 = +[NSThread callStackSymbols];
          int v17 = 138412290;
          double v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
        }
      }
LABEL_2:
      unsigned __int8 v5 = [(ContaineeViewController *)self cardPresentationController];
      [v5 bottomSafeOffset];
      double v7 = v6;
      [(ContaineeViewController *)self headerHeight];
      double v3 = v7 + v8;

      goto LABEL_5;
    default:
LABEL_5:
      double result = v3;
      break;
  }
  return result;
}

- (void)willChangeLayout:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v12 willChangeLayout:"willChangeLayout:"];
  unsigned __int8 v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (v6 && (unint64_t)v6 < a3)
  {
    double v7 = +[MKMapService sharedService];
    uint64_t v8 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
    double v9 = v7;
    uint64_t v10 = 1;
LABEL_7:
    [v9 captureUserAction:v10 onTarget:v8 eventValue:0];

    return;
  }
  if (a3 && (unint64_t)v6 > a3)
  {
    double v11 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v11 collapseWaypointsIfNeeded];

    [(IOSRoutePlanningOverviewViewController *)self _updateFieldsViewSuperviewIfNeeded];
    double v7 = +[MKMapService sharedService];
    uint64_t v8 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
    double v9 = v7;
    uint64_t v10 = 2;
    goto LABEL_7;
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v5 didChangeLayout:"didChangeLayout:"];
  [(IOSRoutePlanningOverviewViewController *)self _updateWaypointsAndRoutesListForCurrentContaineeLayout:a3];
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v9 willChangeContainerStyle:a3];
  objc_super v4 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v4 stopScrollingAndZooming];

  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 bottomSafeOffset];
  double v7 = v6;
  uint64_t v8 = [(RoutePlanningOverviewViewController *)self rootController];
  [v8 setBottomSafeOffset:v7];
}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v5 didChangeContainerStyle:a3];
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  -[IOSRoutePlanningOverviewViewController _updateWaypointsAndRoutesListForCurrentContaineeLayout:](self, "_updateWaypointsAndRoutesListForCurrentContaineeLayout:", [v4 containeeLayout]);
}

- (void)_updateWaypointsAndRoutesListForCurrentContaineeLayout:(unint64_t)a3
{
  if (a3 != 3)
  {
    objc_super v5 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v5 collapseWaypointsIfNeeded];

    double v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    double v7 = [v6 superview];
    uint64_t v8 = [(ContaineeViewController *)self contentView];

    if (v7 != v8)
    {
      objc_super v9 = [(RoutePlanningOverviewViewController *)self collectionView];
      uint64_t v10 = [v9 collectionViewLayout];
      [v10 invalidateLayout];
    }
  }
  [(IOSRoutePlanningOverviewViewController *)self _updateFieldsViewSuperviewIfNeeded];
  [(IOSRoutePlanningOverviewViewController *)self _updateTransitionScrollPosition];
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    id v11 = [(RoutePlanningOverviewViewController *)self collectionView];
    [v11 setScrollEnabled:a3 == 3];
  }
}

- (BOOL)shouldIgnoreTapOnView:(id)a3 headerView:(id)a4
{
  id v5 = a3;
  double v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  double v7 = [v6 waypointListView];
  unsigned __int8 v8 = [v5 isDescendantOfView:v7];

  return v8;
}

- (void)_didTapHeaderView
{
  double v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v3 stopScrollingAndZooming];

  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 5uLL:
      double v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315650;
        double v13 = "-[IOSRoutePlanningOverviewViewController _didTapHeaderView]";
        __int16 v14 = 2080;
        char v15 = "RoutePlanningOverviewViewController.m";
        __int16 v16 = 1024;
        int v17 = 2444;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v12, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        double v7 = sub_1005762E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v8 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          double v13 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
        goto LABEL_10;
      }
      break;
    case 1uLL:
    case 3uLL:
      objc_super v9 = [(ContaineeViewController *)self cardPresentationController];
      double v7 = v9;
      uint64_t v10 = 2;
      goto LABEL_9;
    case 2uLL:
      objc_super v9 = [(ContaineeViewController *)self cardPresentationController];
      double v7 = v9;
      uint64_t v10 = 3;
LABEL_9:
      [v9 wantsLayout:v10];
LABEL_10:

      break;
    default:
      break;
  }
  id v11 = +[MKMapService sharedService];
  [v11 captureUserAction:3 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_10160F2E0)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100618128;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IOSRoutePlanningOverviewViewController;
    -[IOSRoutePlanningOverviewViewController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_forceChangeOrigin
{
  double v3 = [(ControlContaineeViewController *)self delegate];
  [v3 presentRoutePlanningViewType:1];

  id v4 = [(ControlContaineeViewController *)self delegate];
  [v4 selectWaypointSearchFieldIndex:0 exitPlanningIfCancelTapped:1];
}

- (void)waypointListView:(id)a3 didSelectWaypoint:(id)a4 atIndex:(unint64_t)a5
{
  [(IOSRoutePlanningOverviewViewController *)self _didSelectWaypoint:a4 atIndex:a5];
  id v10 = +[MKMapService sharedService];
  uint64_t v7 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
  id v8 = +[NSNumber numberWithUnsignedInteger:a5];
  objc_super v9 = [v8 stringValue];
  [v10 captureUserAction:277 onTarget:v7 eventValue:v9];
}

- (void)waypointListViewDidSelectAddStop:(id)a3
{
  [(IOSRoutePlanningOverviewViewController *)self _didSelectWaypoint:0 atIndex:-1];
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:6097 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)waypointListView:(id)a3 didSelectCollapsedWaypoints:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v6 expandWaypointsIfNeeded];

  uint64_t v7 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  id v8 = [v7 superview];
  objc_super v9 = [(ContaineeViewController *)self contentView];

  if (v8 != v9)
  {
    id v10 = [(RoutePlanningOverviewViewController *)self collectionView];
    id v11 = [v10 collectionViewLayout];
    [v11 invalidateLayout];
  }
  int v12 = [(ContaineeViewController *)self cardPresentationController];
  [v12 wantsLayout:3];

  [(IOSRoutePlanningOverviewViewController *)self _updateFieldsViewSuperviewIfNeeded];
  id v17 = +[MKMapService sharedService];
  uint64_t v13 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
  id v14 = [v5 count];

  char v15 = +[NSNumber numberWithUnsignedInteger:v14];
  __int16 v16 = [v15 stringValue];
  [v17 captureUserAction:31 onTarget:v13 eventValue:v16];
}

- (void)waypointListView:(id)a3 didMoveWaypoint:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v12 = a3;
  id v8 = +[MKMapService sharedService];
  uint64_t v9 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
  id v10 = +[NSNumber numberWithUnsignedInteger:a5];
  id v11 = [v10 stringValue];
  [v8 captureUserAction:279 onTarget:v9 eventValue:v11];

  [(IOSRoutePlanningOverviewViewController *)self _refreshRouteForChangeInWaypointListView:v12];
}

- (void)waypointListView:(id)a3 didDeleteWaypointAtIndex:(unint64_t)a4
{
  id v10 = a3;
  objc_super v6 = +[MKMapService sharedService];
  uint64_t v7 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  uint64_t v9 = [v8 stringValue];
  [v6 captureUserAction:280 onTarget:v7 eventValue:v9];

  [(IOSRoutePlanningOverviewViewController *)self _refreshRouteForChangeInWaypointListView:v10];
}

- (void)_didSelectWaypoint:(id)a3 atIndex:(unint64_t)a4
{
  objc_super v6 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  uint64_t v7 = [v6 platformController];
  id v8 = [v7 auxiliaryTasksManager];
  id v12 = [v8 auxilaryTaskForClass:objc_opt_class()];

  [v12 cancelNavigationAutoLaunchIfNeccessary];
  uint64_t v9 = [(ControlContaineeViewController *)self delegate];
  [v9 presentRoutePlanningViewType:1];

  id v10 = [(ControlContaineeViewController *)self delegate];
  [v10 selectWaypointSearchFieldIndex:a4 exitPlanningIfCancelTapped:0];

  id v11 = [(IOSRoutePlanningOverviewViewController *)self pedestrianARFeatureIntroTeachableMomentTimer];
  [v11 invalidate];
}

- (void)didTapTimingInFieldsView:(id)a3
{
  id v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v5 = [v4 platformController];
  objc_super v6 = [v5 auxiliaryTasksManager];
  id v9 = [v6 auxilaryTaskForClass:objc_opt_class()];

  [v9 cancelNavigationAutoLaunchIfNeccessary];
  uint64_t v7 = [(ControlContaineeViewController *)self delegate];
  [v7 presentRoutePlanningViewType:3];

  id v8 = [(IOSRoutePlanningOverviewViewController *)self pedestrianARFeatureIntroTeachableMomentTimer];
  [v8 invalidate];
}

- (void)replaceOriginWithCurrentLocation
{
  double v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 currentDirectionItem];
  id v5 = [v4 items];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    uint64_t v7 = +[SearchResult currentLocationSearchResult];
    id v8 = +[SearchFieldItem searchFieldItemWithObject:v7];
    [v6 replaceObjectAtIndex:0 withObject:v8];

    [(IOSRoutePlanningOverviewViewController *)self _refreshRouteForWaypoints:v6];
  }
  else
  {
    id v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't replace currentDirectionItem's origin", v10, 2u);
    }
  }
}

- (void)_refreshRouteForChangeInWaypointListView:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:6003 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v7 = [v4 waypoints];

  id v6 = [v7 copy];
  [(IOSRoutePlanningOverviewViewController *)self _refreshRouteForWaypoints:v6];
}

- (void)_refreshRouteForWaypoints:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v6 = [v5 desiredTransportType];

  if (!v6)
  {
    id v7 = [(ControlContaineeViewController *)self delegate];
    id v8 = [v7 currentDirectionItem];
    id v9 = [v8 editRequired:0];

    if (v9)
    {
      id v10 = [(ControlContaineeViewController *)self delegate];
      id v11 = [v10 currentDirectionItem];
      id v6 = [v11 transportType];
    }
    else
    {
      id v6 = 0;
    }
  }
  id v12 = +[MKLocationManager sharedLocationManager];
  uint64_t v13 = -[DirectionItem initWithItems:ignoreMapType:transportType:]([DirectionItem alloc], "initWithItems:ignoreMapType:transportType:", v4, [v12 isLocationServicesApproved] & [v12 isAuthorizedForPreciseLocation], v6);

  id v14 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  char v15 = [v14 drivePreferences];
  [(DirectionItem *)v13 setDrivePreferences:v15];

  __int16 v16 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v17 = [v16 transitPreferences];
  [(DirectionItem *)v13 setTransitPreferences:v17];

  double v18 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  __int16 v19 = [v18 cyclePreferences];
  [(DirectionItem *)v13 setCyclePreferences:v19];

  double v20 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  __int16 v21 = [v20 timing];
  [(DirectionItem *)v13 setTiming:v21];

  id v22 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v31 = @"DirectionsSessionInitiatorKey";
  double v32 = &off_1013A7E28;
  double v23 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v24 = [v22 initWithDictionary:v23];

  CGFloat v25 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v26 = [v25 originalHistoryEntryIdentifier];
  [v24 setObject:v26 forKeyedSubscript:@"DirectionsRouteUUIDKey"];

  CGFloat v27 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  v28 = [v27 automaticSharingContacts];
  [v24 setObject:v28 forKeyedSubscript:@"DirectionsPreviousContactsForTripSharing"];

  double v29 = [(ControlContaineeViewController *)self delegate];
  id v30 = [v24 copy];
  [v29 viewController:self doDirectionItem:v13 allowToPromptEditing:0 withUserInfo:v30];
}

- (id)waypointsForFieldsView:(id)a3
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 directionItemForCurrentSession];

  id v5 = [v4 items];

  return v5;
}

- (RoutePlanningTransportTypeRefinementModel)transportTypeRefinement
{
  if (!self->_transportTypeRefinement)
  {
    double v3 = [(RoutePlanningOverviewViewController *)self transportTypePicker];

    if (!v3)
    {
      id v4 = [(RoutePlanningRefinementModel *)[RoutePlanningTransportTypeRefinementModel alloc] initWithDelegate:self value:&off_1013A7DF8];
      transportTypeRefinement = self->_transportTypeRefinement;
      self->_transportTypeRefinement = v4;
    }
  }
  id v6 = self->_transportTypeRefinement;

  return v6;
}

- (RoutePlanningPreferenceRefinementModel)preferenceRefinement
{
  preferenceRefinement = self->_preferenceRefinement;
  if (!preferenceRefinement)
  {
    id v4 = [(RoutePlanningRefinementModel *)[RoutePlanningPreferenceRefinementModel alloc] initWithDelegate:self value:0];
    id v5 = self->_preferenceRefinement;
    self->_preferenceRefinement = v4;

    preferenceRefinement = self->_preferenceRefinement;
  }

  return preferenceRefinement;
}

- (RoutePlanningTimingRefinementModel)timingRefinement
{
  timingRefinement = self->_timingRefinement;
  if (!timingRefinement)
  {
    id v4 = [RoutePlanningTimingRefinementModel alloc];
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 timing];
    id v7 = [(RoutePlanningRefinementModel *)v4 initWithDelegate:self value:v6];
    id v8 = self->_timingRefinement;
    self->_timingRefinement = v7;

    timingRefinement = self->_timingRefinement;
  }

  return timingRefinement;
}

- (RoutePlanningVehicleRefinementModel)vehicleRefinement
{
  vehicleRefinement = self->_vehicleRefinement;
  if (!vehicleRefinement)
  {
    id v4 = [RoutePlanningVehicleRefinementModel alloc];
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 virtualGarage];
    id v7 = [(RoutePlanningVehicleRefinementModel *)v4 initWithDelegate:self value:v6];
    id v8 = self->_vehicleRefinement;
    self->_vehicleRefinement = v7;

    vehicleRefinement = self->_vehicleRefinement;
  }

  return vehicleRefinement;
}

- (RoutePlanningPreferredNetworksRefinementModel)preferredNetworksRefinement
{
  preferredNetworksRefinement = self->_preferredNetworksRefinement;
  if (!preferredNetworksRefinement)
  {
    id v4 = [RoutePlanningPreferredNetworksRefinementModel alloc];
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 virtualGarage];
    id v7 = [v6 selectedVehicle];
    id v8 = [(RoutePlanningPreferredNetworksRefinementModel *)v4 initWithDelegate:self value:v7];
    id v9 = self->_preferredNetworksRefinement;
    self->_preferredNetworksRefinement = v8;

    preferredNetworksRefinement = self->_preferredNetworksRefinement;
  }

  return preferredNetworksRefinement;
}

- (RoutePlanningEbikeRefinementModel)ebikeRefinement
{
  ebikeRefinement = self->_ebikeRefinement;
  if (!ebikeRefinement)
  {
    id v4 = [RoutePlanningEbikeRefinementModel alloc];
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 cyclePreferences];
    id v7 = [(RoutePlanningRefinementModel *)v4 initWithDelegate:self value:v6];
    id v8 = self->_ebikeRefinement;
    self->_ebikeRefinement = v7;

    ebikeRefinement = self->_ebikeRefinement;
  }

  return ebikeRefinement;
}

- (id)currentRefinementsForFieldsView:(id)a3
{
  id v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v5 = [v4 platformController];
  id v6 = [v5 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 currentTransportType];
    unsigned int v10 = [v8 navigationType] == (id)2;
  }
  else
  {
    id v11 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v9 = [v11 transportType];

    id v12 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    uint64_t v13 = [v12 currentRoute];
    id v14 = [v13 origin];
    if (v14)
    {
      char v15 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      __int16 v16 = [v15 currentRoute];
      id v17 = [v16 origin];
      unsigned int v10 = [v17 isCurrentLocation] ^ 1;
    }
    else
    {
      unsigned int v10 = 0;
    }
  }
  int BOOL = GEOConfigGetBOOL();
  int v19 = GEOConfigGetBOOL() | BOOL ^ 1;
  if (v10) {
    int v20 = v19;
  }
  else {
    int v20 = 1;
  }
  __int16 v21 = [(IOSRoutePlanningOverviewViewController *)self transportTypeRefinement];
  id v22 = +[NSNumber numberWithInteger:v9];
  [v21 setValue:v22];

  if (v9)
  {
    double v23 = objc_opt_new();
    id v24 = v23;
    if (v21) {
      [v23 addObject:v21];
    }
    CGFloat v25 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    double v26 = [v25 timing];
    CGFloat v27 = [(IOSRoutePlanningOverviewViewController *)self timingRefinement];
    [v27 setValue:v26];

    if (MapsFeature_IsEnabled_Maps357RoutePlanning()) {
      +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, &off_1013A7E10, 0);
    }
    else {
    v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, 0, v77);
    }
    double v29 = +[NSNumber numberWithInteger:v9];
    unsigned int v30 = [v28 containsObject:v29];

    if (v30)
    {
      CFStringRef v31 = [(IOSRoutePlanningOverviewViewController *)self timingRefinement];
      [v24 addObject:v31];
    }
    switch((unint64_t)v9)
    {
      case 1uLL:
        double v32 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        double v33 = [v32 drivePreferences];
        double v34 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        [v34 setValue:v33];

        double v35 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        [v24 addObject:v35];

        double v36 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        id v37 = [v36 virtualGarage];
        double v38 = [v37 vehicles];
        int v78 = v20;
        if ([v38 count]) {
          int v39 = v20;
        }
        else {
          int v39 = 0;
        }

        if (v39 == 1)
        {
          double v40 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
          double v41 = [v40 virtualGarage];
          unint64_t v42 = [(IOSRoutePlanningOverviewViewController *)self vehicleRefinement];
          [v42 setValue:v41];

          unint64_t v43 = [(IOSRoutePlanningOverviewViewController *)self vehicleRefinement];
          [v24 addObject:v43];
        }
        int IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
        CGRect v44 = [(IOSRoutePlanningOverviewViewController *)self vehicleRefinement];
        unsigned __int8 v45 = [v44 isOverridingToNoSelection];

        CGRect v46 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        unsigned int v47 = [v46 virtualGarage];
        double v48 = [v47 selectedVehicle];
        double v49 = [v48 preferredChargingNetworks];
        id v50 = [v49 count];

        if (IsEnabled_EVRoutingEnhancements && (v45 & 1) == 0 && v50 && ((v78 ^ 1) & 1) == 0)
        {
          double v51 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
          double v52 = [v51 virtualGarage];
          double v53 = [v52 selectedVehicle];
          id v54 = [(IOSRoutePlanningOverviewViewController *)self preferredNetworksRefinement];
          [v54 setValue:v53];

          uint64_t v55 = [(IOSRoutePlanningOverviewViewController *)self preferredNetworksRefinement];
          goto LABEL_42;
        }
        break;
      case 2uLL:
        id v56 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        double v57 = [v56 walkPreferences];
        double v58 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        [v58 setValue:v57];

        uint64_t v55 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        goto LABEL_42;
      case 3uLL:
        unint64_t v59 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        v60 = [v59 transitPreferences];

        double v61 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        [v61 setValue:v60];

        v62 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        [v24 addObject:v62];

        double v63 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        double v64 = [v63 displayHints];

        v65 = +[RoutePlanningDisplayHintsRefinementModel requirementFieldsForDisplayHints:v64];
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_100619880;
        v80[3] = &unk_1012F23C8;
        id v24 = v24;
        id v81 = v24;
        v82 = self;
        id v83 = v60;
        id v84 = v64;
        id v66 = v64;
        id v67 = v60;
        [v65 enumerateIndexesUsingBlock:v80];

        break;
      case 4uLL:
        v68 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
        [v68 setValue:0];
        goto LABEL_43;
      case 5uLL:
        if (sub_10050B784())
        {
          v69 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
          v70 = [v69 cyclePreferences];
          v71 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
          [v71 setValue:v70];

          v72 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
          [v24 addObject:v72];
        }
        if (!sub_10050B708()) {
          break;
        }
        v73 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        id v74 = [v73 cyclePreferences];
        v75 = [(IOSRoutePlanningOverviewViewController *)self ebikeRefinement];
        [v75 setValue:v74];

        uint64_t v55 = [(IOSRoutePlanningOverviewViewController *)self ebikeRefinement];
LABEL_42:
        v68 = (void *)v55;
        [v24 addObject:v55];
LABEL_43:

        break;
      default:
        break;
    }
  }
  else if (v21)
  {
    __int16 v85 = v21;
    id v24 = +[NSArray arrayWithObjects:&v85 count:1];
  }
  else
  {
    id v24 = &__NSArray0__struct;
  }

  return v24;
}

- (int64_t)transportTypeForFieldsView:(id)a3
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 transportType];

  return (int64_t)v4;
}

- (void)pressedRefinementModel:(id)a3
{
  id v4 = [a3 menuPressUsageAction];
  if (v4)
  {
    id v5 = v4;
    id v6 = +[MKMapService sharedService];
    [v6 captureUserAction:v5 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
}

- (void)selectedRefinementModel:(id)a3
{
  id v12 = a3;
  id v4 = [v12 buttonPressUsageAction];
  if (v4)
  {
    id v5 = v4;
    id v6 = +[MKMapService sharedService];
    [v6 captureUserAction:v5 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
  id v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v8 = [v7 platformController];
  id v9 = [v8 auxiliaryTasksManager];
  unsigned int v10 = [v9 auxilaryTaskForClass:objc_opt_class()];

  [v10 cancelNavigationAutoLaunchIfNeccessary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [(IOSRoutePlanningOverviewViewController *)self didTapTimingInFieldsView:v11];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(RoutePlanningOverviewViewController *)self _presentRouteOptions];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(RoutePlanningOverviewViewController *)self _presentEbikeOptions];
      }
    }
  }
}

- (void)updatedRefinementModel:(id)a3
{
  id v17 = a3;
  id v4 = [v17 lastUpdateUsageAction];
  if (v4)
  {
    id v5 = v4;
    id v6 = +[MKMapService sharedService];
    [v6 captureUserAction:v5 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
  id v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v8 = [v7 platformController];
  id v9 = [v8 auxiliaryTasksManager];
  unsigned int v10 = [v9 auxilaryTaskForClass:objc_opt_class()];

  [v10 cancelNavigationAutoLaunchIfNeccessary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v17 value];
    -[RoutePlanningOverviewViewController _updateToTransportType:](self, "_updateToTransportType:", [v11 integerValue]);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v17 selectedVehicle];
      id v12 = +[VGVirtualGarageService sharedService];
      [v12 virtualGarageSelectVehicle:v11];

      uint64_t v13 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
      [v13 setNeedsUpdateRefinements];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v17 value];
        uint64_t v13 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        [v13 updateTransitPreferences:v11];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_13;
        }
        id v14 = [v17 shouldUsePreferredNetworks];
        id v11 = +[VGVirtualGarageService sharedService];
        uint64_t v13 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        char v15 = [v13 virtualGarage];
        __int16 v16 = [v15 selectedVehicle];
        [v11 virtualGarageSetShouldUsePreferredNetworks:v14 forVehicle:v16];
      }
    }
  }
LABEL_13:
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRequestState:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v6 routePlanningDataCoordinator:a3 didUpdateRequestState:a4];
  id v5 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v5 setNeedsUpdateRefinements];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  id v6 = a4;
  [(RoutePlanningOverviewViewController *)&v9 routePlanningDataCoordinator:a3 didUpdateResolvedWaypointSet:v6];
  id v7 = [(ControlContaineeViewController *)self delegate];
  [v7 routePlanningUpdatedWaypoints:v6];

  id v8 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v8 setNeedsUpdateRefinements];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v7 routePlanningDataCoordinator:a3 didUpdateOriginName:a4 destinationName:a5];
  id v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v6 setNeedsUpdateWaypointsList];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v10 routePlanningDataCoordinator:a3 didUpdateTransportType:a4];
  id v5 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v5 updateRefinements];

  id v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v6 updateWaypointsList];

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100619FE8;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IOSRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v10 routePlanningDataCoordinator:a3 didUpdateRouteCollection:a4];
  id v5 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v5 setNeedsUpdateWaypointsList];

  id v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v6 setNeedsUpdateRefinements];

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10061A11C;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateVirtualGarage:(id)a4
{
  if ([(RoutePlanningOverviewViewController *)self shouldRefreshRoutePlanningWithCurrentGarage:a4 previousGarage:self->super._virtualGarageAtLastRouteRequest])
  {
    id v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Redrawing refinements for updated virtual garage", v8, 2u);
    }

    id v6 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v6 setNeedsUpdateRefinements];

    objc_super v7 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v7 setNeedsUpdateWaypointsList];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateDrivePreferences:(id)a4
{
  id v5 = a4;
  id v6 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
  objc_super v7 = [v6 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v13, 0x16u);
    }
    id v12 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v12 setNeedsUpdateRefinements];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateWalkPreferences:(id)a4
{
  id v5 = a4;
  id v6 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
  objc_super v7 = [v6 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v13, 0x16u);
    }
    id v12 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v12 setNeedsUpdateRefinements];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransitPreferences:(id)a4
{
  id v5 = a4;
  id v6 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
  objc_super v7 = [v6 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v13, 0x16u);
    }
    id v12 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v12 setNeedsUpdateRefinements];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateCyclePreferences:(id)a4
{
  id v5 = a4;
  id v6 = [(IOSRoutePlanningOverviewViewController *)self preferenceRefinement];
  objc_super v7 = [v6 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v13, 0x16u);
    }
    id v12 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
    [v12 setNeedsUpdateRefinements];
  }
}

- (void)_refreshTimingDisplay
{
  if (MapsFeature_IsEnabled_Maps357RoutePlanning()) {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, &off_1013A7E10, 0);
  }
  else {
  double v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, 0, v14);
  }
  id v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 transportType]);
  if ([v3 containsObject:v5])
  {

LABEL_10:
    objc_super v10 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v11 = [v10 timing];

    goto LABEL_12;
  }
  if (MapsFeature_IsEnabled_Maps357RoutePlanning()) {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, &off_1013A7E10, 0);
  }
  else {
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, 0, v15);
  }
  objc_super v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 desiredTransportType]);
  unsigned int v9 = [v6 containsObject:v8];

  if (v9) {
    goto LABEL_10;
  }
  id v11 = 0;
LABEL_12:
  id v12 = [(IOSRoutePlanningOverviewViewController *)self fieldsView];
  [v12 setNeedsUpdateRefinements];

  int v13 = sub_1005768D4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updating timing to: %@", buf, 0xCu);
  }
}

- (void)_refreshContentInset
{
  double v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(IOSRoutePlanningOverviewViewController *)self _extraBottomPadding];
  double v11 = v10;
  id v12 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  if ([v12 transportType] == (id)4) {
    double v11 = 0.0;
  }

  id v13 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v13 setContentInset:v5, v7, v11, v9];
}

- (double)_extraBottomPadding
{
  v2 = [(IOSRoutePlanningOverviewViewController *)self view];
  [v2 safeAreaInsets];
  if (v3 <= 0.0) {
    double v4 = 16.0;
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

- (PedestrianARSessionStateManager)pedestrianARSessionStateManager
{
  v2 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v3 = [v2 platformController];
  double v4 = [v3 pedestrianARSessionStateManager];

  return (PedestrianARSessionStateManager *)v4;
}

- (BOOL)_shouldShowPedestrianARTeachableMomentCard
{
  double v3 = [(IOSRoutePlanningOverviewViewController *)self pedestrianARSessionStateManager];

  if (v3)
  {
    double v4 = +[UIApplication sharedMapsDelegate];
    double v5 = (char *)[v4 currentInterruptionKind];

    if (v5)
    {
      double v6 = sub_1005768D4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)(v5 - 2) > 0x15) {
          CFStringRef v7 = @"kMapsInterruptionDirectionsSafetyWarning";
        }
        else {
          CFStringRef v7 = *(&off_1012F2498 + (void)(v5 - 2));
        }
        int v26 = 138412290;
        CFStringRef v27 = v7;
        double v8 = "Not showing Pedestrian AR teachable moment card because there is currently an interruption present: %@";
        double v9 = v6;
        uint32_t v10 = 12;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    double v11 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v12 = [v11 platformController];
    id v13 = [v12 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    double v6 = v14;

    if (v6)
    {
      uint64_t v15 = [v6 configuration];
      unsigned int v16 = [v15 shouldAutoLaunchNavigation];

      if (v16)
      {
        id v17 = sub_1005768D4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          double v18 = "Not showing Pedestrian AR teachable moment card because route planning is going to auto launch into nav";
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v26, 2u);
        }
      }
      else
      {
        int v20 = [(ContaineeViewController *)self cardPresentationController];
        unint64_t v21 = (unint64_t)[v20 containerStyle];

        if ((v21 & 0xFFFFFFFFFFFFFFFDLL) == 4)
        {
          id v17 = sub_1005768D4();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v26) = 0;
            double v18 = "Not showing Pedestrian AR teachable moment card because the phone is in landscape";
            goto LABEL_29;
          }
        }
        else
        {
          id v22 = [(IOSRoutePlanningOverviewViewController *)self pedestrianARSessionStateManager];
          unsigned __int8 v23 = [v22 shouldShowPedestrianAR];

          id v17 = sub_1005768D4();
          BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
          if (v23)
          {
            if (v24)
            {
              LOWORD(v26) = 0;
              BOOL v19 = 1;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Can show Pedestrian AR teachable moment card", (uint8_t *)&v26, 2u);
            }
            else
            {
              BOOL v19 = 1;
            }
            goto LABEL_31;
          }
          if (v24)
          {
            LOWORD(v26) = 0;
            double v18 = "Not showing the Pedestrian AR teachable moment card because the feature is not available right now";
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      id v17 = sub_1005768D4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        double v18 = "Not showing Pedestrian AR teachable moment card because we are no longer in route planning";
        goto LABEL_29;
      }
    }
    BOOL v19 = 0;
LABEL_31:

    goto LABEL_32;
  }
  double v6 = sub_1005768D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v26) = 0;
    double v8 = "Not showing Pedestrian AR teachable moment card because the feature is not enabled";
    double v9 = v6;
    uint32_t v10 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v26, v10);
  }
LABEL_18:
  BOOL v19 = 0;
LABEL_32:

  return v19;
}

- (void)_showPedestrianARFeatureIntroTeachableMomentCardIfNecessary
{
  if (![(IOSRoutePlanningOverviewViewController *)self _shouldShowPedestrianARTeachableMomentCard])
  {
    double v4 = sub_1005768D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not showing Pedestrian AR feature intro teachable moment card because we should not show any teachable moment cards right now", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!+[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment])
  {
    double v4 = sub_1005768D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not showing Pedestrian AR feature intro teachable moment card because it is not eligible to be shown", buf, 2u);
    }
    goto LABEL_12;
  }
  double v3 = [(IOSRoutePlanningOverviewViewController *)self pedestrianARFeatureIntroTeachableMomentTimer];

  if (v3)
  {
    double v4 = sub_1005768D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not showing the Pedestrian AR feature intro teachable moment card because the presentation timer has already been created", buf, 2u);
    }
LABEL_12:

    return;
  }
  GEOConfigGetDouble();
  double v6 = v5;
  objc_initWeak(&location, self);
  CFStringRef v7 = sub_1005768D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting feature intro teachable moment card with delay: %f", buf, 0xCu);
  }

  id v8 = &_dispatch_main_q;
  uint32_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10061B09C;
  id v13 = &unk_1012E7638;
  objc_copyWeak(&v14, &location);
  double v9 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v10 block:v6];
  -[IOSRoutePlanningOverviewViewController setPedestrianARFeatureIntroTeachableMomentTimer:](self, "setPedestrianARFeatureIntroTeachableMomentTimer:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_showPedestrianARRaiseToEnterTeachableMomentCardIfNecessary
{
  if ([(IOSRoutePlanningOverviewViewController *)self _shouldShowPedestrianARTeachableMomentCard])
  {
    if (+[PedestrianARRaiseToEnterTeachableMomentContaineeViewController hasShownTeachableMoment])
    {
      double v3 = sub_1005768D4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = 0;
        double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because it has already been shown before";
        double v5 = (uint8_t *)&v19;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
      }
    }
    else
    {
      double v6 = +[PedestrianARSessionUsageTracker sharedInstance];
      CFStringRef v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      id v8 = [v7 routeCollection];
      double v9 = [v8 currentRoute];
      uint32_t v10 = [v9 uniqueRouteID];
      uint64_t v11 = [v10 UUIDString];
      unsigned __int8 v12 = [v6 hasAREverLocalizedForRoute:v11];

      if ((v12 & 1) == 0)
      {
        double v3 = sub_1005768D4();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        __int16 v18 = 0;
        double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't localized on the current route yet";
        double v5 = (uint8_t *)&v18;
        goto LABEL_7;
      }
      id v13 = +[PedestrianARSessionUsageTracker sharedInstance];
      unsigned __int8 v14 = [v13 hasARElementRendered];

      double v3 = sub_1005768D4();
      BOOL v15 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
      if ((v14 & 1) == 0)
      {
        if (!v15) {
          goto LABEL_8;
        }
        __int16 v17 = 0;
        double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't seen an AR element yet";
        double v5 = (uint8_t *)&v17;
        goto LABEL_7;
      }
      if (v15)
      {
        *(_WORD *)unsigned int v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Showing the Pedestrian AR raise to enter teachable moment card", v16, 2u);
      }

      double v3 = [(ControlContaineeViewController *)self delegate];
      [v3 showPedestrianARRaiseToEnterTeachableMomentCard];
    }
  }
  else
  {
    double v3 = sub_1005768D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      double v4 = "Not showing Pedestrian AR raise to enter teachable moment card because we should not show any teachable momen"
           "t cards right now";
      double v5 = buf;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (BOOL)wasSheetDragging
{
  return self->_wasSheetDragging;
}

- (void)setWasSheetDragging:(BOOL)a3
{
  self->_wasSheetDragging = a3;
}

- (BOOL)sheetExpandingFromMedium
{
  return self->_sheetExpandingFromMedium;
}

- (void)setSheetExpandingFromMedium:(BOOL)a3
{
  self->_sheetExpandingFromMedium = a3;
}

- (double)contentOffsetWhenDraggingBegan
{
  return self->_contentOffsetWhenDraggingBegan;
}

- (void)setContentOffsetWhenDraggingBegan:(double)a3
{
  self->_contentOffsetWhenDraggingBegan = a3;
}

- (void)setTransportTypeRefinement:(id)a3
{
}

- (void)setPreferenceRefinement:(id)a3
{
}

- (void)setTimingRefinement:(id)a3
{
}

- (void)setVehicleRefinement:(id)a3
{
}

- (void)setPreferredNetworksRefinement:(id)a3
{
}

- (void)setEbikeRefinement:(id)a3
{
}

- (GCDTimer)pedestrianARFeatureIntroTeachableMomentTimer
{
  return self->_pedestrianARFeatureIntroTeachableMomentTimer;
}

- (void)setPedestrianARFeatureIntroTeachableMomentTimer:(id)a3
{
}

- (RouteOverviewFieldsView)fieldsView
{
  return self->_fieldsView;
}

- (void)setFieldsView:(id)a3
{
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)collectionViewTopToFieldsViewConstraint
{
  return self->_collectionViewTopToFieldsViewConstraint;
}

- (void)setCollectionViewTopToFieldsViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)collectionViewTopToContentViewConstraint
{
  return self->_collectionViewTopToContentViewConstraint;
}

- (void)setCollectionViewTopToContentViewConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewTopToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewTopToFieldsViewConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_fieldsView, 0);
  objc_storeStrong((id *)&self->_pedestrianARFeatureIntroTeachableMomentTimer, 0);
  objc_storeStrong((id *)&self->_ebikeRefinement, 0);
  objc_storeStrong((id *)&self->_preferredNetworksRefinement, 0);
  objc_storeStrong((id *)&self->_vehicleRefinement, 0);
  objc_storeStrong((id *)&self->_timingRefinement, 0);
  objc_storeStrong((id *)&self->_preferenceRefinement, 0);

  objc_storeStrong((id *)&self->_transportTypeRefinement, 0);
}

@end