@interface TransitSchedulesViewController
+ (BOOL)shouldShowScheduleForTransitMapItem:(id)a3 sequence:(id)a4;
+ (id)validDeparturesInDepartureSequence:(id)a3 withReferenceDate:(id)a4;
- (ActionCoordination)actionCoordinator;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasHeadsignSection;
- (BOOL)_shouldShowDepartureInfoSection;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)hasIncidents;
- (BOOL)hasSelectedTrip;
- (BOOL)isNetworkError:(id)a3;
- (BOOL)isPinnedTransitLine;
- (BOOL)shouldShowChangeDateButton;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (GEOComposedRoute)selectedTripRoute;
- (GEOTransitLine)selectedTransitLine;
- (GEOTransitVehicleUpdater)vehicleUpdater;
- (MKTransitMapItemUpdater)mapItemUpdater;
- (NSArray)incidents;
- (NSArray)lastReceivedVehiclePositions;
- (NSArray)storeSubscriptionTypes;
- (NSDate)referenceDate;
- (NSString)selectedTripVehicleNumber;
- (TransitSchedulesDepartureDataProvider)departureDataProvider;
- (TransitSchedulesDepartureViewProviding)departureCellProvider;
- (TransitSchedulesHeaderView)headerTitleView;
- (TransitSchedulesHeadsignViewProviding)headsignCellProvider;
- (TransitSchedulesViewController)initWithDepartureSequence:(id)a3 timeZone:(id)a4 scheduleWindowStartDate:(id)a5 includeAllDirections:(BOOL)a6;
- (TransitSchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TransitSchedulesViewController)initWithTransitMapItem:(id)a3 departureSequence:(id)a4;
- (TransitSchedulesViewController)initWithTransitRouteStep:(id)a3;
- (TransitSchedulesViewControllerDelegate)transitSchedulesDelegate;
- (UICollectionView)collectionView;
- (double)heightForLayout:(unint64_t)a3;
- (id)_collectionViewLayout;
- (id)_firstVisibleDeparture;
- (id)_headerViewForSectionType:(unint64_t)a3;
- (id)_startEndDatesForOperatingHoursTimeRanges:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)fetchSelectedTransitLineItem;
- (id)ticketForTransitMapItemUpdater:(id)a3;
- (id)titleForStopsHeader;
- (id)traits;
- (int)currentUITargetForAnalytics;
- (int64_t)_numberOfDeparturesInSnapshot;
- (int64_t)_sectionIndexForSectionType:(unint64_t)a3;
- (unint64_t)_departuresHeaderStyle;
- (unint64_t)_sectionTypeForSectionIndex:(unint64_t)a3;
- (unint64_t)preferredPresentationStyle;
- (unint64_t)selectedTripIdentifier;
- (void)_addSection:(unint64_t)a3 toSnapshot:(id)a4;
- (void)_checkIfPinnedLine;
- (void)_clearSection:(unint64_t)a3 inSnapshot:(id)a4;
- (void)_clearVehicles;
- (void)_expandStopsSection:(id)a3;
- (void)_fetchMapsSyncTransitLineItemWithCallback:(id)a3;
- (void)_rebuildStopsSection;
- (void)_removeSection:(unint64_t)a3 toSnapshot:(id)a4;
- (void)_startObservingDepartureProvider;
- (void)_stopObservingDepartureProvider;
- (void)_updateDeparturesHeaderTitles;
- (void)_updateDeparturesHeaderTitlesForHeaderView:(id)a3;
- (void)_updateStopsSectionHeader;
- (void)_updateStopsSectionHeader:(id)a3;
- (void)_updateVehicleUpdater;
- (void)changeDate;
- (void)changedDate:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)departureCellProvider:(id)a3 selectDeparture:(id)a4 withIndex:(unint64_t)a5;
- (void)departureDataProvider:(id)a3 selectedDeparture:(id)a4 withIndex:(unint64_t)a5;
- (void)departureDataProvider:(id)a3 selectedDepartureSequence:(id)a4 withIndex:(unint64_t)a5;
- (void)departureDataProvider:(id)a3 updatedDepartureSequences:(id)a4;
- (void)departureDataProvider:(id)a3 updatedDepartures:(id)a4;
- (void)fetchNewScheduleData;
- (void)handleDismissAction:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)loadSelectedTripDetails;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pinSelectedTransitLine;
- (void)processUpdatedDepartureSequencesFromMapItem:(id)a3;
- (void)restoreInitialMapState;
- (void)selectDeparture;
- (void)selectDeparture:(id)a3;
- (void)selectDepartureSequence:(id)a3;
- (void)setActionCoordinator:(id)a3;
- (void)setBoardingStationMapItem:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDepartureCellProvider:(id)a3;
- (void)setDepartureDataProvider:(id)a3;
- (void)setHeaderTitleView:(id)a3;
- (void)setHeadsignCellProvider:(id)a3;
- (void)setIncidents:(id)a3;
- (void)setLastReceivedVehiclePositions:(id)a3;
- (void)setMapItemUpdater:(id)a3;
- (void)setPinnedTransitLine:(BOOL)a3;
- (void)setReferenceDate:(id)a3;
- (void)setScheduleWindowStartDate:(id)a3;
- (void)setSelectedDeparture:(id)a3;
- (void)setSelectedTransitLine:(id)a3;
- (void)setSelectedTripRoute:(id)a3;
- (void)setSelectedTripVehicleNumber:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)setTransitSchedulesDelegate:(id)a3;
- (void)setVehicleUpdater:(id)a3;
- (void)showDirectionsToSelectedTransitStop;
- (void)showLineInfo;
- (void)showRouteOnMap;
- (void)timingViewController:(id)a3 didPickTiming:(id)a4;
- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4;
- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5;
- (void)transitVehicleUpdater:(id)a3 didFailUpdateForTripIDs:(id)a4 withError:(id)a5;
- (void)transitVehicleUpdater:(id)a3 didTimeoutUpdateForTripIDs:(id)a4;
- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5;
- (void)unpinSelectedTransitLine;
- (void)updateDeparturesSectionForNetworkState:(unint64_t)a3;
- (void)updateStopsSectionForNetworkState:(unint64_t)a3;
- (void)updatedDepartureInfoProvider:(id)a3;
- (void)viewDidLoad;
- (void)viewLineOnMap;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TransitSchedulesViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)shouldShowScheduleForTransitMapItem:(id)a3 sequence:(id)a4
{
  id v5 = a4;
  v6 = +[MKTransitItemReferenceDateUpdater referenceDate];
  v7 = [a1 validDeparturesInDepartureSequence:v5 withReferenceDate:v6];

  LOBYTE(v5) = [v7 count] != 0;
  return (char)v5;
}

- (TransitSchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)TransitSchedulesViewController;
  v4 = [(TransitSchedulesViewController *)&v13 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = (GEOTransitVehicleUpdater *)[objc_alloc((Class)GEOTransitVehicleUpdater) initWithDelegate:v4];
    vehicleUpdater = v4->_vehicleUpdater;
    v4->_vehicleUpdater = v5;

    v7 = objc_alloc_init(TransitSchedulesLineOptionsProvider);
    lineOptionsProvider = v4->_lineOptionsProvider;
    v4->_lineOptionsProvider = v7;

    [(TransitSchedulesLineOptionsProvider *)v4->_lineOptionsProvider setDelegate:v4];
    v9 = +[MapsSyncStore sharedStore];
    [v9 subscribe:v4];

    uint64_t v14 = objc_opt_class();
    uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];
    storeSubscriptionTypes = v4->storeSubscriptionTypes;
    v4->storeSubscriptionTypes = (NSArray *)v10;

    [(TransitSchedulesViewController *)v4 storeDidChangeWithTypes:&__NSArray0__struct];
  }
  return v4;
}

- (TransitSchedulesViewController)initWithDepartureSequence:(id)a3 timeZone:(id)a4 scheduleWindowStartDate:(id)a5 includeAllDirections:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (NSDate *)a5;
  objc_super v13 = [(TransitSchedulesViewController *)self initWithNibName:0 bundle:0];
  if (v13)
  {
    uint64_t v14 = [v10 line];
    selectedTransitLine = v13->_selectedTransitLine;
    v13->_selectedTransitLine = (GEOTransitLine *)v14;

    v13->_transitLineIdentifier = (unint64_t)[(GEOTransitLine *)v13->_selectedTransitLine muid];
    v13->_boardingStopMuid = (unint64_t)[v10 transitId];
    boardingStopName = v13->_boardingStopName;
    v13->_boardingStopName = 0;

    objc_storeStrong((id *)&v13->_boardingStopTimeZone, a4);
    v13->_isRoutingScheduleCard = 0;
    v13->_requestAllDirections = a6;
    uint64_t v17 = +[MKTransitItemReferenceDateUpdater referenceDate];
    referenceDate = v13->_referenceDate;
    v13->_referenceDate = (NSDate *)v17;

    v19 = v12;
    if (!v12) {
      v19 = v13->_referenceDate;
    }
    objc_storeStrong((id *)&v13->_scheduleWindowStartDate, v19);
    v20 = [v10 departures];
    v21 = [v20 firstObject];

    if (v21)
    {
      uint64_t v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 tripIdentifier]);
      selectedTripIdentifier = v13->_selectedTripIdentifier;
      v13->_selectedTripIdentifier = (NSNumber *)v22;
    }
    v24 = [[TransitScheduleStopsTableViewDataSource alloc] initWithBoardingStopMuid:v13->_boardingStopMuid transitLine:v13->_selectedTransitLine referenceDate:v13->_referenceDate];
    stopsDataSource = v13->_stopsDataSource;
    v13->_stopsDataSource = v24;
  }
  return v13;
}

- (TransitSchedulesViewController)initWithTransitMapItem:(id)a3 departureSequence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(TransitSchedulesViewController *)self initWithNibName:0 bundle:0];
  if (v9)
  {
    uint64_t v10 = [v8 line];
    selectedTransitLine = v9->_selectedTransitLine;
    v9->_selectedTransitLine = (GEOTransitLine *)v10;

    v9->_transitLineIdentifier = (unint64_t)[(GEOTransitLine *)v9->_selectedTransitLine muid];
    v12 = [v7 _geoMapItem];
    objc_super v13 = [v12 transitStationIdentifier];
    v9->_boardingStopMuid = (unint64_t)[v13 muid];

    uint64_t v14 = [v7 _transitInfo];
    v15 = [v14 displayName];
    v16 = (NSString *)[v15 copy];
    boardingStopName = v9->_boardingStopName;
    v9->_boardingStopName = v16;

    uint64_t v18 = [v7 timeZone];
    boardingStopTimeZone = v9->_boardingStopTimeZone;
    v9->_boardingStopTimeZone = (NSTimeZone *)v18;

    v9->_isRoutingScheduleCard = 0;
    objc_storeStrong((id *)&v9->_boardingStopMapItem, a3);
    uint64_t v20 = +[MKTransitItemReferenceDateUpdater referenceDate];
    referenceDate = v9->_referenceDate;
    v9->_referenceDate = (NSDate *)v20;

    objc_storeStrong((id *)&v9->_scheduleWindowStartDate, v9->_referenceDate);
    uint64_t v22 = [v8 departures];
    v23 = [v22 firstObject];

    if (v23
      && ([v23 departureDate], v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
    {
      uint64_t v28 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v23 tripIdentifier]);
      selectedTripIdentifier = v9->_selectedTripIdentifier;
      v9->_selectedTripIdentifier = (NSNumber *)v28;
    }
    else
    {
      v25 = [TransitSchedulesDepartureDataProvider alloc];
      id v35 = v8;
      v26 = +[NSArray arrayWithObjects:&v35 count:1];
      v27 = [(TransitSchedulesDepartureDataProvider *)v25 initWithTransitMapItem:v7 selectedDepartureSequence:v8 departureSequences:v26 timeZone:v9->_boardingStopTimeZone initialScheduleDate:v9->_scheduleWindowStartDate];
      [(TransitSchedulesViewController *)v9 setDepartureDataProvider:v27];

      [(TransitSchedulesDepartureDataProvider *)v9->_departureDataProvider setRequestAllDirections:v9->_requestAllDirections];
      [(TransitSchedulesDepartureDataProvider *)v9->_departureDataProvider setDelegate:v9];
    }
    uint64_t v30 = [v7 _transitAttribution];
    attribution = v9->_attribution;
    v9->_attribution = (GEOTransitAttribution *)v30;

    v32 = [[TransitScheduleStopsTableViewDataSource alloc] initWithBoardingStopMuid:v9->_boardingStopMuid transitLine:v9->_selectedTransitLine referenceDate:v9->_referenceDate];
    stopsDataSource = v9->_stopsDataSource;
    v9->_stopsDataSource = v32;
  }
  return v9;
}

+ (id)validDeparturesInDepartureSequence:(id)a3 withReferenceDate:(id)a4
{
  id v5 = a4;
  v6 = [a3 departures];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10049E594;
  v11[3] = &unk_1012EBE90;
  id v12 = v5;
  id v7 = v5;
  id v8 = +[NSPredicate predicateWithBlock:v11];
  v9 = [v6 filteredArrayUsingPredicate:v8];

  return v9;
}

- (TransitSchedulesViewController)initWithTransitRouteStep:(id)a3
{
  id v5 = a3;
  v6 = [(TransitSchedulesViewController *)self initWithNibName:0 bundle:0];
  if (v6)
  {
    id v7 = [v5 nextBoardingStep];
    id v8 = [v5 transitStep];
    v9 = [v8 scheduleInfo];

    if (v9 && [v9 tripID] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 tripID]);
      int v12 = 0;
      int v11 = 1;
    }
    else
    {
      v3 = [v7 transitVehicle];
      uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 tripMuid]);
      int v11 = 0;
      int v12 = 1;
    }
    objc_storeStrong((id *)&v6->_selectedTripIdentifier, v10);
    if (v12)
    {
    }
    if (v11) {

    }
    objc_super v13 = [v9 staticDepartureDate];
    uint64_t v14 = v13;
    if (!v13)
    {
      uint64_t v14 = [v7 arrivalTime];
    }
    objc_storeStrong((id *)&v6->_selectedTripDepartureDate, v14);
    if (!v13) {

    }
    v15 = [v9 windowStartDate];
    selectedTripDepartureDate = v15;
    if (!v15) {
      selectedTripDepartureDate = v6->_selectedTripDepartureDate;
    }
    objc_storeStrong((id *)&v6->_scheduleWindowStartDate, selectedTripDepartureDate);

    if (v9 && [v9 lineID] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6->_id transitLineIdentifier = (unint64_t)[v9 lineID];
      v54 = [v7 transitLine];
      id v55 = [v54 muid];
      id transitLineIdentifier = (id)v6->_transitLineIdentifier;

      if (v55 == transitLineIdentifier)
      {
        uint64_t v57 = [v7 transitLine];
        selectedTransitLine = v6->_selectedTransitLine;
        v6->_selectedTransitLine = (GEOTransitLine *)v57;
      }
    }
    else
    {
      uint64_t v17 = [v7 transitLine];
      uint64_t v18 = v6->_selectedTransitLine;
      v6->_selectedTransitLine = (GEOTransitLine *)v17;

      v6->_id transitLineIdentifier = (unint64_t)[(GEOTransitLine *)v6->_selectedTransitLine muid];
    }
    uint64_t v19 = [v9 routingParameters];
    routingParameters = v6->_routingParameters;
    v6->_routingParameters = (NSData *)v19;

    v21 = [v7 transitVehicle];
    uint64_t v22 = [v21 vehicleNumber];
    selectedTripVehicleNumber = v6->_selectedTripVehicleNumber;
    v6->_selectedTripVehicleNumber = (NSString *)v22;

    v24 = [v7 transitIncidents];
    v25 = (NSArray *)[v24 copy];
    incidents = v6->_incidents;
    v6->_incidents = v25;

    v6->_isRoutingScheduleCard = 1;
    v27 = [(ContaineeViewController *)v6 cardPresentationController];
    [v27 setPresentedModally:1];

    uint64_t v28 = [v7 originStop];
    v6->_boardingStopMuid = (unint64_t)[v28 muid];
    v29 = [v7 originStop];
    uint64_t v30 = [v29 nameDisplayString];
    v31 = (NSString *)[v30 copy];
    boardingStopName = v6->_boardingStopName;
    v6->_boardingStopName = v31;

    uint64_t v33 = [v7 departureTimeZone];
    boardingStopTimeZone = v6->_boardingStopTimeZone;
    v6->_boardingStopTimeZone = (NSTimeZone *)v33;

    id v35 = objc_alloc((Class)GEOLocation);
    v36 = [v28 latLng];
    [v36 lat];
    double v38 = v37;
    v39 = [v28 latLng];
    [v39 lng];
    v41 = (GEOLocation *)[v35 initWithLatitude:v38 longitude:v40];
    boardingStopLocation = v6->_boardingStopLocation;
    v6->_boardingStopLocation = v41;

    v43 = [v5 nextAlightingStep];
    uint64_t v44 = [v43 destinationStop];

    v45 = [v5 nextAlightingStep];
    uint64_t v46 = [v45 destinationHall];

    uint64_t v47 = +[MKTransitItemReferenceDateUpdater referenceDate];
    referenceDate = v6->_referenceDate;
    v6->_referenceDate = (NSDate *)v47;

    if (v44 | v46)
    {
      id v63 = v5;
      v49 = [v5 composedRoute];
      v50 = [v49 getStationForHall:v46];

      id v51 = [(id)v44 muid];
      if (v46) {
        uint64_t v52 = (uint64_t)[(id)v46 muid];
      }
      else {
        uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v50) {
        uint64_t v59 = (uint64_t)[v50 muid];
      }
      else {
        uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v60 = [[TransitScheduleStopsTableViewDataSource alloc] initWithBoardingStopMuid:v6->_boardingStopMuid alightStopMuid:v51 alightHallMuid:v52 alightStationMuid:v59 transitLine:v6->_selectedTransitLine referenceDate:v6->_referenceDate];
      stopsDataSource = v6->_stopsDataSource;
      v6->_stopsDataSource = v60;

      id v5 = v63;
    }
    else
    {
      v53 = [[TransitScheduleStopsTableViewDataSource alloc] initWithBoardingStopMuid:v6->_boardingStopMuid transitLine:v6->_selectedTransitLine referenceDate:v6->_referenceDate];
      v50 = v6->_stopsDataSource;
      v6->_stopsDataSource = v53;
    }
  }
  return v6;
}

- (id)_collectionViewLayout
{
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10049ECA4;
  v7[3] = &unk_1012EBEE0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v3 = objc_retainBlock(v7);
  id v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  [v4 setInterSectionSpacing:8.0];
  id v5 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v3 configuration:v4];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)viewDidLoad
{
  v83.receiver = self;
  v83.super_class = (Class)TransitSchedulesViewController;
  [(ContaineeViewController *)&v83 viewDidLoad];
  v3 = [(TransitSchedulesViewController *)self view];
  [v3 setAccessibilityIdentifier:@"TransitSchedulesDepartureView"];

  id v4 = [[ContainerHeaderView alloc] initWithCardButtonType:0];
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v4;

  [(ContainerHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1148846080;
  [(ContainerHeaderView *)self->_containerHeaderView setContentCompressionResistancePriority:1 forAxis:v6];
  [(ContainerHeaderView *)self->_containerHeaderView setDelegate:self];
  [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:0.0];
  id v7 = [(ContaineeViewController *)self headerView];
  [v7 addSubview:self->_containerHeaderView];

  id v8 = [TransitSchedulesHeaderView alloc];
  v9 = [(TransitSchedulesViewController *)self selectedTransitLine];
  uint64_t v10 = [(TransitSchedulesHeaderView *)v8 initWithTransitLine:v9];
  headerTitleView = self->_headerTitleView;
  self->_headerTitleView = v10;

  [(TransitSchedulesHeaderView *)self->_headerTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_containerHeaderView setTitleView:self->_headerTitleView];
  LODWORD(v12) = 1148846080;
  [(TransitSchedulesHeaderView *)self->_headerTitleView setContentCompressionResistancePriority:1 forAxis:v12];
  v79 = [(ContainerHeaderView *)self->_containerHeaderView leadingAnchor];
  v80 = [(ContaineeViewController *)self headerView];
  v77 = [v80 leadingAnchor];
  v75 = [v79 constraintEqualToAnchor:v77];
  v87[0] = v75;
  v71 = [(ContainerHeaderView *)self->_containerHeaderView trailingAnchor];
  v73 = [(ContaineeViewController *)self headerView];
  v69 = [v73 trailingAnchor];
  v66 = [v71 constraintEqualToAnchor:v69];
  v87[1] = v66;
  objc_super v13 = [(ContainerHeaderView *)self->_containerHeaderView topAnchor];
  uint64_t v14 = [(ContaineeViewController *)self headerView];
  v15 = [v14 topAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v87[2] = v16;
  uint64_t v17 = [(ContainerHeaderView *)self->_containerHeaderView bottomAnchor];
  uint64_t v18 = [(ContaineeViewController *)self headerView];
  uint64_t v19 = [v18 bottomAnchor];
  uint64_t v20 = [v17 constraintEqualToAnchor:v19];
  v87[3] = v20;
  v21 = +[NSArray arrayWithObjects:v87 count:4];
  +[NSLayoutConstraint activateConstraints:v21];

  v81 = [(TransitSchedulesViewController *)self _collectionViewLayout];
  id v22 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v22 setAccessibilityIdentifier:@"TransitSchedulesDepartureCollectionView"];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 setDelegate:self];
  [v22 setShowsHorizontalScrollIndicator:0];
  [v22 setAllowsMultipleSelection:1];
  [v22 setAllowsSelection:1];
  [v22 setAlwaysBounceVertical:1];
  [v22 setPreservesSuperviewLayoutMargins:1];
  v23 = +[UIColor clearColor];
  [v22 setBackgroundColor:v23];

  [v22 setContentInset:8.0, 0.0, 0.0, 0.0];
  id v24 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v25 = sub_10001CBB8(self);
  v26 = (UICollectionViewDiffableDataSource *)[v24 initWithCollectionView:v22 cellProvider:v25];
  dataSource = self->_dataSource;
  self->_dataSource = v26;

  uint64_t v28 = sub_1005B38D0(self);
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSupplementaryViewProvider:v28];

  v29 = [(ContaineeViewController *)self contentView];
  [v29 addSubview:v22];

  [(TransitSchedulesViewController *)self setCollectionView:v22];
  +[TransitScheduleStopsTableViewDataSource registerCellsForCollectionView:v22];
  uint64_t v30 = objc_opt_class();
  v31 = +[TransitStationLineScheduleSectionHeaderView identifier];
  [v22 registerClass:v30 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v31];

  uint64_t v32 = objc_opt_class();
  uint64_t v33 = +[TransitStationLineScheduleSectionHeaderView identifier];
  [v22 registerClass:v32 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v33];

  [v22 registerClass:[TransitSchedulesLineOptionsProvider cellClass] forCellWithReuseIdentifier:@"TransitLineOptionsCellIdentifier"];
  [v22 registerClass:[TransitSchedulesDepartureInfoProvider cellClass] forCellWithReuseIdentifier:@"TransitLineDepartureInfoCellIdentifier"];
  [v22 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TransitAttributionCellIdentifier"];
  [v22 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"IncidentsCellIdentifier"];
  v34 = [(TransitSchedulesViewController *)self departureCellProvider];
  id v35 = [(TransitSchedulesViewController *)self collectionView];
  [v34 registerCellsForCollectionView:v35];

  v36 = [(TransitSchedulesViewController *)self headsignCellProvider];
  double v37 = [(TransitSchedulesViewController *)self collectionView];
  [v36 registerCellsForCollectionView:v37];

  v76 = [v22 topAnchor];
  v78 = [(ContaineeViewController *)self contentView];
  v74 = [v78 safeAreaLayoutGuide];
  v72 = [v74 topAnchor];
  v70 = [v76 constraintEqualToAnchor:v72];
  v86[0] = v70;
  v68 = [(ContaineeViewController *)self contentView];
  v67 = [v68 bottomAnchor];
  v65 = [v22 bottomAnchor];
  v64 = [v67 constraintEqualToAnchor:v65];
  v86[1] = v64;
  v62 = [v22 leadingAnchor];
  id v63 = [(ContaineeViewController *)self contentView];
  v61 = [v63 safeAreaLayoutGuide];
  double v38 = [v61 leadingAnchor];
  v39 = [v62 constraintEqualToAnchor:v38];
  v86[2] = v39;
  double v40 = [v22 trailingAnchor];
  v41 = [(ContaineeViewController *)self contentView];
  v42 = [v41 safeAreaLayoutGuide];
  v43 = [v42 trailingAnchor];
  uint64_t v44 = [v40 constraintEqualToAnchor:v43];
  v86[3] = v44;
  v45 = +[NSArray arrayWithObjects:v86 count:4];
  +[NSLayoutConstraint activateConstraints:v45];

  uint64_t v46 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  if (self->_departureDataProvider)
  {
    [(TransitSchedulesViewController *)self _addSection:3 toSnapshot:v46];
    uint64_t v47 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider departures];
    id v48 = [v47 count];

    if (v48)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10049FEC8;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  if ([(TransitSchedulesViewController *)self hasIncidents])
  {
    [(TransitSchedulesViewController *)self _addSection:4 toSnapshot:v46];
    CFStringRef v85 = @"IncidentsCellIdentifier";
    v49 = +[NSArray arrayWithObjects:&v85 count:1];
    [v46 appendItemsWithIdentifiers:v49 intoSectionWithIdentifier:&off_1013A71E0];
  }
  if ([(TransitSchedulesViewController *)self _shouldShowDepartureInfoSection])
  {
    v50 = [[TransitSchedulesDepartureInfoProvider alloc] initWithTransitLine:self->_selectedTransitLine timeZone:self->_boardingStopTimeZone referenceDate:self->_scheduleWindowStartDate];
    departureInfoProvider = self->_departureInfoProvider;
    self->_departureInfoProvider = v50;

    uint64_t v52 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider selectedDepartureSequence];
    [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDepartureSequence:v52];

    [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDelegate:self];
    v53 = [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider identifiers];
    if ([v53 count])
    {
      [(TransitSchedulesViewController *)self _addSection:1 toSnapshot:v46];
      [v46 appendItemsWithIdentifiers:v53 intoSectionWithIdentifier:&off_1013A71F8];
    }
  }
  if (!self->_isRoutingScheduleCard)
  {
    [(TransitSchedulesViewController *)self _addSection:7 toSnapshot:v46];
    v54 = [(TransitSchedulesLineOptionsProvider *)self->_lineOptionsProvider identifiers];
    [v46 appendItemsWithIdentifiers:v54 intoSectionWithIdentifier:&off_1013A7210];

    id v55 = [(TransitSchedulesViewController *)self fetchSelectedTransitLineItem];
  }
  v56 = [(GEOTransitAttribution *)self->_attribution _providerNames];
  id v57 = [v56 count];

  if (v57)
  {
    [(TransitSchedulesViewController *)self _addSection:8 toSnapshot:v46];
    CFStringRef v84 = @"AttributionCellIdentifier";
    v58 = +[NSArray arrayWithObjects:&v84 count:1];
    [v46 appendItemsWithIdentifiers:v58 intoSectionWithIdentifier:&off_1013A7228];
  }
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v46 animatingDifferences:0];
  if ([(TransitSchedulesViewController *)self hasSelectedTrip]
    && ![(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource hasStops])
  {
    [(TransitSchedulesViewController *)self fetchNewScheduleData];
  }
  uint64_t v59 = [(ControlContaineeViewController *)self delegate];
  self->_initialViewMode = (int64_t)[v59 displayedViewMode];

  v60 = [(ControlContaineeViewController *)self delegate];
  self->_initialMapApplicationState = [v60 mapApplicationState];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TransitSchedulesViewController *)self mapItemUpdater];
  [v5 setActive:1];

  double v6 = [(TransitSchedulesViewController *)self vehicleUpdater];
  [v6 setActive:1];

  [(TransitSchedulesViewController *)self _startObservingDepartureProvider];
  if (![(TransitSchedulesViewController *)self hasSelectedTrip]
    && [(TransitSchedulesViewController *)self _numberOfDeparturesInSnapshot] >= 1)
  {
    id v7 = [(TransitSchedulesViewController *)self departureDataProvider];
    [v7 selectNextIncomingDeparture];
  }
  id v8 = [(TransitSchedulesViewController *)self selectedTripRoute];

  if (v8) {
    [(TransitSchedulesViewController *)self showRouteOnMap];
  }
  v9.receiver = self;
  v9.super_class = (Class)TransitSchedulesViewController;
  [(ContaineeViewController *)&v9 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TransitSchedulesViewController *)self vehicleUpdater];
  [v5 setActive:0];

  double v6 = [(TransitSchedulesViewController *)self mapItemUpdater];
  [v6 setActive:0];

  [(TransitSchedulesViewController *)self _stopObservingDepartureProvider];
  [(TransitSchedulesViewController *)self restoreInitialMapState];
  v7.receiver = self;
  v7.super_class = (Class)TransitSchedulesViewController;
  [(ContaineeViewController *)&v7 viewWillDisappear:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  int v11 = (TransitSchedulesDepartureDataProvider *)a4;
  id v12 = a5;
  if (off_1015E31D8 == a6)
  {
    if (self->_departureDataProvider == v11)
    {
      objc_super v13 = NSStringFromSelector("remoteNetworkState");
      unsigned int v14 = [v10 isEqualToString:v13];

      if (v14) {
        [(TransitSchedulesViewController *)self updateDeparturesSectionForNetworkState:[(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider remoteNetworkState]];
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TransitSchedulesViewController;
    [(TransitSchedulesViewController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_startObservingDepartureProvider
{
  id v4 = [(TransitSchedulesViewController *)self departureDataProvider];
  BOOL v3 = NSStringFromSelector("remoteNetworkState");
  [v4 addObserver:self forKeyPath:v3 options:4 context:off_1015E31D8];
}

- (void)_stopObservingDepartureProvider
{
  id v4 = [(TransitSchedulesViewController *)self departureDataProvider];
  BOOL v3 = NSStringFromSelector("remoteNetworkState");
  [v4 removeObserver:self forKeyPath:v3];
}

- (BOOL)hasIncidents
{
  v2 = [(TransitSchedulesViewController *)self incidents];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)fetchSelectedTransitLineItem
{
  selectedTransitLineItem = self->_selectedTransitLineItem;
  if (selectedTransitLineItem && !sub_1003A1138(selectedTransitLineItem))
  {
LABEL_7:
    id v12 = self->_selectedTransitLineItem;
    goto LABEL_9;
  }
  id v4 = [(TransitSchedulesViewController *)self selectedTransitLine];

  if (v4)
  {
    id v5 = [(TransitSchedulesViewController *)self selectedTransitLine];
    double v6 = [[IncompleteTransitLineItem alloc] initWithTransitLine:v5];
    objc_super v7 = self->_selectedTransitLineItem;
    self->_selectedTransitLineItem = (GEOTransitLineItem *)v6;

    if (sub_1003A1138(self->_selectedTransitLineItem))
    {
      id v8 = MKMapItemIdentifierFromGEOTransitLine();
      objc_super v9 = +[MKMapService sharedService];
      uint64_t v18 = v8;
      id v10 = +[NSArray arrayWithObjects:&v18 count:1];
      int v11 = [v9 ticketForTransitLines:v10 traits:0];

      objc_initWeak(&location, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1004A04F4;
      v14[3] = &unk_1012EBF08;
      id v15 = v5;
      objc_copyWeak(&v16, &location);
      [v11 submitWithHandler:v14 networkActivity:0];
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }

    goto LABEL_7;
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (void)updateDeparturesSectionForNetworkState:(unint64_t)a3
{
  if (!self->_departureDataProvider) {
    self->_initialRoutingSchedulesNetworkRequestState = a3;
  }
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  double v6 = v5;
  if (a3 - 2 >= 3)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        [(TransitSchedulesViewController *)self _removeSection:1 toSnapshot:v5];
        if ([v6 indexOfSectionIdentifier:&off_1013A7240] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [(TransitSchedulesViewController *)self _clearSection:3 inSnapshot:v6];
          [v6 deleteSectionsWithIdentifiers:&off_1013AD5D8];
          [(TransitSchedulesViewController *)self _addSection:3 toSnapshot:v6];
        }
      }
    }
    else
    {
      [(TransitSchedulesViewController *)self _removeSection:3 toSnapshot:v5];
      [(TransitSchedulesViewController *)self _removeSection:2 toSnapshot:v6];
    }
  }
  else
  {
    if ([v5 indexOfSectionIdentifier:&off_1013A7258] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 deleteSectionsWithIdentifiers:&off_1013AD5F0];
      [(TransitSchedulesViewController *)self _addSection:2 toSnapshot:v6];
      CFStringRef v9 = @"DeparturesNetworkStateViewCellIdentifier";
      objc_super v7 = +[NSArray arrayWithObjects:&v9 count:1];
      [v6 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&off_1013A7258];
    }
    else
    {
      CFStringRef v8 = @"DeparturesNetworkStateViewCellIdentifier";
      objc_super v7 = +[NSArray arrayWithObjects:&v8 count:1];
      [v6 reloadItemsWithIdentifiers:v7];
    }
  }
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:0];
}

- (void)updateStopsSectionForNetworkState:(unint64_t)a3
{
  if ([(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource remoteNetworkState] != a3)
  {
    id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource setRemoteNetworkState:a3];
    if (a3 - 2 >= 3)
    {
      if (a3 == 1 && [v5 indexOfSectionIdentifier:&off_1013A7288] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v5 deleteSectionsWithIdentifiers:&off_1013AD608];
        [(TransitSchedulesViewController *)self _addSection:6 toSnapshot:v5];
      }
    }
    else
    {
      if ([v5 indexOfSectionIdentifier:&off_1013A7270] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v5 deleteSectionsWithIdentifiers:&off_1013AD620];
        [(TransitSchedulesViewController *)self _addSection:5 toSnapshot:v5];
        CFStringRef v8 = @"StopsNetworkStateViewCellIdentifier";
        double v6 = +[NSArray arrayWithObjects:&v8 count:1];
        [v5 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:&off_1013A7270];
      }
      else
      {
        CFStringRef v7 = @"StopsNetworkStateViewCellIdentifier";
        double v6 = +[NSArray arrayWithObjects:&v7 count:1];
        [v5 reloadItemsWithIdentifiers:v6];
      }
    }
    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v5 animatingDifferences:1];
  }
}

- (void)setIncidents:(id)a3
{
  id v4 = (NSArray *)a3;
  incidents = self->_incidents;
  if (incidents != v4 && ([(NSArray *)incidents isEqual:v4] & 1) == 0)
  {
    double v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [(TransitSchedulesViewController *)self _removeSection:4 toSnapshot:v6];
    if ([(NSArray *)v4 count])
    {
      [(TransitSchedulesViewController *)self _addSection:4 toSnapshot:v6];
      CFStringRef v12 = @"IncidentsCellIdentifier";
      CFStringRef v7 = +[NSArray arrayWithObjects:&v12 count:1];
      [v6 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&off_1013A71E0];
    }
    CFStringRef v8 = (NSArray *)[(NSArray *)v4 copy];
    CFStringRef v9 = self->_incidents;
    self->_incidents = v8;

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:1];
    BOOL v10 = [(NSArray *)self->_incidents count] != 0;
    int v11 = +[GEOAPSharedStateData sharedData];
    [v11 setPlaceCardTransitAdvisoryBanner:v10];
  }
}

- (void)setDepartureDataProvider:(id)a3
{
  id v4 = (TransitSchedulesDepartureDataProvider *)a3;
  departureDataProvider = self->_departureDataProvider;
  if (departureDataProvider)
  {
    [(TransitSchedulesViewController *)self _stopObservingDepartureProvider];
    departureDataProvider = self->_departureDataProvider;
  }
  self->_departureDataProvider = v4;

  if (v4)
  {
    [(TransitSchedulesViewController *)self _startObservingDepartureProvider];
  }
}

- (TransitSchedulesDepartureViewProviding)departureCellProvider
{
  departureCellProvider = self->_departureCellProvider;
  if (!departureCellProvider)
  {
    if (sub_1000BBB44(self) == 5)
    {
      id v4 = objc_alloc_init(TransitSchedulesDeparturePickerProvider);
      [(TransitSchedulesDeparturePickerProvider *)v4 setDelegate:self];
    }
    else
    {
      id v4 = objc_alloc_init(TransitSchedulesDepartureCellProvider);
    }
    id v5 = self->_departureCellProvider;
    self->_departureCellProvider = (TransitSchedulesDepartureViewProviding *)v4;

    departureCellProvider = self->_departureCellProvider;
  }

  return departureCellProvider;
}

- (TransitSchedulesHeadsignViewProviding)headsignCellProvider
{
  headsignCellProvider = self->_headsignCellProvider;
  if (!headsignCellProvider)
  {
    if (sub_1000BBB44(self) == 5)
    {
      id v4 = objc_alloc_init(TransitSchedulesHeadsignPickerProvider);
      [(TransitSchedulesHeadsignPickerProvider *)v4 setDelegate:self];
    }
    else
    {
      id v4 = objc_alloc_init(TransitSchedulesHeadsignCellProvider);
    }
    id v5 = self->_headsignCellProvider;
    self->_headsignCellProvider = (TransitSchedulesHeadsignViewProviding *)v4;

    headsignCellProvider = self->_headsignCellProvider;
  }

  return headsignCellProvider;
}

- (void)_rebuildStopsSection
{
  id v4 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  [(TransitSchedulesViewController *)self _clearSection:6 inSnapshot:v4];
  BOOL v3 = [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource stopIdentifiers];
  [v4 appendItemsWithIdentifiers:v3 intoSectionWithIdentifier:&off_1013A7288];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v4 animatingDifferences:1];
  [(TransitSchedulesViewController *)self _updateStopsSectionHeader];
}

- (void)setBoardingStationMapItem:(id)a3
{
  id v5 = a3;
  if (!self->_mapItemUpdater)
  {
    id v6 = objc_alloc((Class)MKMapItem);
    CFStringRef v7 = [v5 _geoMapItem];
    id v8 = [v6 initWithGeoMapItem:v7 isPlaceHolderPlace:0];

    CFStringRef v9 = (MKTransitMapItemUpdater *)[objc_alloc((Class)MKTransitMapItemUpdater) initWithMapItem:v8 delegate:self];
    mapItemUpdater = self->_mapItemUpdater;
    self->_mapItemUpdater = v9;

    if ([(TransitSchedulesViewController *)self isViewLoaded]) {
      [(MKTransitMapItemUpdater *)self->_mapItemUpdater setActive:1];
    }
  }
  if (!self->_attribution)
  {
    v26 = [v5 _transitAttribution];

    if (v26)
    {
      v27 = [v5 _transitAttribution];
      attribution = self->_attribution;
      self->_attribution = v27;

      if ([(TransitSchedulesViewController *)self isViewLoaded])
      {
        v29 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
        [(TransitSchedulesViewController *)self _addSection:8 toSnapshot:v29];
        CFStringRef v33 = @"AttributionCellIdentifier";
        uint64_t v30 = +[NSArray arrayWithObjects:&v33 count:1];
        [v29 appendItemsWithIdentifiers:v30 intoSectionWithIdentifier:&off_1013A7228];

        [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v29 animatingDifferences:0];
      }
    }
  }
  objc_storeStrong((id *)&self->_boardingStopMapItem, a3);
  int v11 = [v5 _transitInfo];
  CFStringRef v12 = [v11 title];
  id v13 = [v12 length];

  if (v13)
  {
    unsigned int v14 = [v11 title];
    id v15 = [(TransitSchedulesViewController *)self headerTitleView];
    [v15 setTitle:v14];
  }
  id v16 = [v11 subtitle];
  id v17 = [v16 length];

  if (v17)
  {
    uint64_t v18 = [v11 subtitle];
    uint64_t v19 = [(TransitSchedulesViewController *)self headerTitleView];
    [v19 setSubtitle:v18];
  }
  uint64_t v20 = [v11 lines];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1004A12A8;
  v32[3] = &unk_1012EBF30;
  v32[4] = self;
  [v20 enumerateObjectsUsingBlock:v32];

  v21 = [v11 transitTripStops];
  id v22 = [v21 firstObject];
  if (v22)
  {
    v23 = [v11 composedRoute];
    [(TransitSchedulesViewController *)self setSelectedTripRoute:v23];
    id v24 = [v5 _transitInfo];
    v25 = [v24 incidents];
    [(TransitSchedulesViewController *)self setIncidents:v25];

    [(TransitSchedulesViewController *)self _updateVehicleUpdater];
    if ([v21 count])
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1004A1378;
      v31[3] = &unk_1012EA358;
      v31[4] = self;
      [v21 enumerateObjectsUsingBlock:v31];
      [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource buildTransitTripStopItemsWithTransitStops:v21 boardingStopDepartureDate:self->_selectedTripDepartureDate maintainingCollapsedState:0];
      if ([(TransitSchedulesViewController *)self isViewLoaded]) {
        [(TransitSchedulesViewController *)self _rebuildStopsSection];
      }
    }
  }
}

- (void)setSelectedTripVehicleNumber:(id)a3
{
  id v8 = a3;
  if ((-[NSString isEqual:](self->_selectedTripVehicleNumber, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v8 copy];
    selectedTripVehicleNumber = self->_selectedTripVehicleNumber;
    self->_selectedTripVehicleNumber = v4;

    id v6 = [(TransitSchedulesViewController *)self _headerViewForSectionType:6];
    CFStringRef v7 = [(TransitSchedulesViewController *)self titleForStopsHeader];
    [v6 setTitle:v7];
  }
}

- (id)_headerViewForSectionType:(unint64_t)a3
{
  int64_t v4 = [(TransitSchedulesViewController *)self _sectionIndexForSectionType:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = +[NSIndexPath indexPathForRow:0 inSection:v4];
    CFStringRef v7 = [(UICollectionView *)self->_collectionView supplementaryViewForElementKind:UICollectionElementKindSectionHeader atIndexPath:v6];
    objc_opt_class();
    id v5 = 0;
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
  }

  return v5;
}

- (id)titleForStopsHeader
{
  NSUInteger v3 = [(NSString *)self->_selectedTripVehicleNumber length];
  unsigned int v4 = [(GEOTransitLine *)self->_selectedTransitLine isBus];
  id v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v3)
  {
    if (v4) {
      CFStringRef v7 = @"[Transit Schedules] (Bus) Stops for <vehicle number>";
    }
    else {
      CFStringRef v7 = @"[Transit Schedules] (Non-Bus) Stops for <vehicle number>";
    }
    uint64_t v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

    CFStringRef v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, self->_selectedTripVehicleNumber);
    id v6 = (void *)v8;
  }
  else
  {
    if (v4) {
      CFStringRef v10 = @"[Transit Schedules] (Bus) Stops";
    }
    else {
      CFStringRef v10 = @"[Transit Schedules] (Non-Bus) Stops";
    }
    CFStringRef v9 = [v5 localizedStringForKey:v10 value:@"localized string not found" table:0];
  }

  return v9;
}

- (id)_startEndDatesForOperatingHoursTimeRanges:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v11 = [v10 startDate];
        [v4 addObject:v11];

        CFStringRef v12 = [v10 endDate];
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (void)setSelectedTransitLine:(id)a3
{
  p_selectedTransitLine = &self->_selectedTransitLine;
  id v6 = a3;
  if ((-[GEOTransitLine isEqual:](*p_selectedTransitLine, "isEqual:") & 1) == 0)
  {
    [(TransitSchedulesViewController *)self _checkIfPinnedLine];
    objc_storeStrong((id *)&self->_selectedTransitLine, a3);
    [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setTransitLine:*p_selectedTransitLine];
    [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource setTransitLine:*p_selectedTransitLine];
  }
}

- (BOOL)hasSelectedTrip
{
  return self->_selectedTripIdentifier != 0;
}

- (unint64_t)selectedTripIdentifier
{
  return [(NSNumber *)self->_selectedTripIdentifier unsignedIntegerValue];
}

- (unint64_t)_departuresHeaderStyle
{
  id v3 = [(TransitSchedulesViewController *)self selectedTransitLine];
  id v4 = [v3 departureTimeDisplayStyle];

  if (v4 == (id)4 || v4 == (id)2) {
    return 2 * !self->_isRoutingScheduleCard;
  }
  else {
    return 1;
  }
}

- (id)traits
{
  id v3 = [(TransitSchedulesViewController *)self departureDataProvider];
  id v4 = [v3 scheduleWindowStartDate];
  scheduleWindowStartDate = v4;
  if (!v4) {
    scheduleWindowStartDate = self->_scheduleWindowStartDate;
  }
  id v6 = scheduleWindowStartDate;

  id v7 = +[TransitSchedulesDepartureDataProvider serviceTraitsForScheduleDate:v6 timeZone:self->_boardingStopTimeZone];
  if ([(TransitSchedulesViewController *)self hasSelectedTrip])
  {
    id v8 = objc_alloc_init((Class)GEOTraitsTransitScheduleModeFilter);
    id v9 = objc_alloc_init((Class)GEOTraitsTransitScheduleTimeRange);
    [v8 setTimeRange:v9];

    [(NSDate *)self->_scheduleWindowStartDate timeIntervalSinceReferenceDate];
    double v11 = v10 + -1.0;
    CFStringRef v12 = [v8 timeRange];
    [v12 setStartTime:v11];

    id v13 = [v8 timeRange];
    [v13 setDuration:2.0];

    id v14 = objc_alloc_init((Class)GEOTraitsTransitScheduleFilter);
    [v14 setHighFrequencyFilter:v8];
    [v14 setLowFrequencyFilter:v8];
    [v7 setTransitTripStopTimeFilter:v14];
  }

  return v7;
}

- (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqual:kCFErrorDomainCFNetwork])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v3 domain];
    unsigned __int8 v5 = [v6 isEqual:NSURLErrorDomain];
  }
  return v5;
}

- (void)fetchNewScheduleData
{
  boardingStopMuid = (void *)self->_boardingStopMuid;
  id transitLineIdentifier = (void *)self->_transitLineIdentifier;
  unsigned __int8 v5 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
  id v6 = [(TransitSchedulesViewController *)self traits];
  objc_initWeak(&location, self);
  id v7 = +[MKMapService sharedService];
  id v8 = [v7 ticketForTransitScheduleAtStation:boardingStopMuid line:transitLineIdentifier referenceTripID:v5 includeAllDirectionNames:self->_requestAllDirections routingParameters:self->_routingParameters traits:v6];

  if (!self->_departureDataProvider) {
    [(TransitSchedulesViewController *)self updateDeparturesSectionForNetworkState:2];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004A1D44;
  v9[3] = &unk_1012EBF80;
  objc_copyWeak(v10, &location);
  v10[2] = transitLineIdentifier;
  v10[3] = v5;
  v10[1] = boardingStopMuid;
  v9[4] = self;
  [v8 submitWithHandler:v9 networkActivity:0];
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

- (void)processUpdatedDepartureSequencesFromMapItem:(id)a3
{
  id v16 = a3;
  id v4 = [v16 _transitInfo];
  unsigned __int8 v5 = [v4 departureSequences];
  id v6 = [v5 copy];

  id v7 = [(TransitSchedulesViewController *)self departureDataProvider];
  if (v7)
  {
    id v8 = v7;
    [v7 processDeparturesFromDepartureSequences:v6 animatingDifferences:0];

    goto LABEL_17;
  }
  if (![v6 count])
  {
    [(TransitSchedulesViewController *)self updateDeparturesSectionForNetworkState:0];
    goto LABEL_17;
  }
  if (![(TransitSchedulesViewController *)self hasSelectedTrip]) {
    goto LABEL_9;
  }
  id v9 = +[TransitSchedulesDepartureDataProvider departureSequenceContainingTripIdentifier:[(TransitSchedulesViewController *)self selectedTripIdentifier] departureSequences:v6];
  if (!v9)
  {
    if ([v6 count] == (id)1)
    {
      id v9 = [v6 firstObject];
      goto LABEL_10;
    }
LABEL_9:
    id v9 = 0;
  }
LABEL_10:
  double v10 = [v9 departures];
  double v11 = [v10 firstObject];
  CFStringRef v12 = [v11 departureDate];

  departureInfoProvider = self->_departureInfoProvider;
  if (v12)
  {
    [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDepartureSequence:v9];
    id v14 = [[TransitSchedulesDepartureDataProvider alloc] initWithTransitMapItem:v16 selectedDepartureSequence:v9 departureSequences:v6 timeZone:self->_boardingStopTimeZone initialScheduleDate:self->_scheduleWindowStartDate];
    [(TransitSchedulesViewController *)self setDepartureDataProvider:v14];
    [(TransitSchedulesDepartureDataProvider *)v14 setRequestAllDirections:self->_requestAllDirections];
    [(TransitSchedulesDepartureDataProvider *)v14 setDelegate:self];
    [(TransitSchedulesViewController *)self selectDeparture];
  }
  else
  {
    if (v9)
    {
      [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDepartureSequence:v9];
    }
    else
    {
      long long v15 = [v6 firstObject];
      [(TransitSchedulesDepartureInfoProvider *)departureInfoProvider setDepartureSequence:v15];
    }
    id v14 = 0;
  }
  [(TransitSchedulesViewController *)self updateDeparturesSectionForNetworkState:[(TransitSchedulesDepartureDataProvider *)v14 remoteNetworkState]];

LABEL_17:
}

- (void)selectDeparture
{
  if ([(TransitSchedulesViewController *)self _numberOfDeparturesInSnapshot])
  {
    if (![(TransitSchedulesViewController *)self hasSelectedTrip]
      || ([(TransitSchedulesViewController *)self departureDataProvider],
          id v3 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v4 = objc_msgSend(v3, "selectDepartureWithTripIdentifier:", -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier")), v3, (v4 & 1) == 0))
    {
      id v5 = [(TransitSchedulesViewController *)self departureDataProvider];
      [v5 selectNextIncomingDeparture];
    }
  }
}

- (void)loadSelectedTripDetails
{
  objc_initWeak(&location, self);
  [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource removeAllStops];
  [(TransitSchedulesViewController *)self updateStopsSectionForNetworkState:2];
  [(TransitSchedulesViewController *)self _updateVehicleUpdater];
  boardingStopMuid = (void *)self->_boardingStopMuid;
  id transitLineIdentifier = (void *)self->_transitLineIdentifier;
  id v5 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
  id v6 = [(TransitSchedulesViewController *)self traits];
  id v7 = +[MKMapService sharedService];
  id v8 = [v7 ticketForTransitTripDetailsAtStation:boardingStopMuid line:transitLineIdentifier referenceTripID:v5 includeAllDirectionNames:self->_requestAllDirections routingParameters:self->_routingParameters traits:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004A2590;
  v9[3] = &unk_1012EBFD0;
  objc_copyWeak(v10, &location);
  v10[1] = boardingStopMuid;
  v10[2] = transitLineIdentifier;
  v10[3] = v5;
  [v8 submitWithHandler:v9 networkActivity:0];
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

- (BOOL)shouldShowChangeDateButton
{
  return !self->_isRoutingScheduleCard;
}

- (void)setSelectedTripRoute:(id)a3
{
  id v5 = a3;
  if ((-[GEOComposedRoute isEqual:](self->_selectedTripRoute, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedTripRoute, a3);
    [(TransitSchedulesViewController *)self showRouteOnMap];
  }
}

- (void)setScheduleWindowStartDate:(id)a3
{
  unsigned __int8 v4 = (NSDate *)a3;
  id v5 = [(TransitSchedulesViewController *)self departureDataProvider];
  [v5 setScheduleWindowStartDate:v4];

  [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDate:v4];
  scheduleWindowStartDate = self->_scheduleWindowStartDate;
  self->_scheduleWindowStartDate = v4;
}

- (void)changedDate:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v4 = [v5 date];
    [(TransitSchedulesViewController *)self setScheduleWindowStartDate:v4];

    +[GEOAPPortal captureUserAction:7015 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
  }
}

- (void)changeDate
{
  id v3 = [(TransitSchedulesViewController *)self departureDataProvider];
  id v10 = [v3 timeZone];

  unsigned __int8 v4 = [(TransitSchedulesViewController *)self departureDataProvider];
  id v5 = [v4 scheduleWindowStartDate];

  id v6 = [RoutePlanningTimingViewController alloc];
  id v7 = +[RoutePlanningTiming timingWithDepartureDate:v5 departureTimeZone:v10 arrivalTimeZone:0];
  id v8 = [(RoutePlanningTimingViewController *)v6 initWithCurrentTiming:v7 shouldShowArriveBy:0 pickerDelegate:self];

  id v9 = [(ContaineeViewController *)self cardPresentationController];
  [v9 presentViewController:v8 animated:1 completion:0];

  +[GEOAPPortal captureUserAction:7015 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
}

- (void)showRouteOnMap
{
  id v3 = [(TransitSchedulesViewController *)self selectedTripRoute];

  if (v3)
  {
    unsigned __int8 v4 = [(ControlContaineeViewController *)self delegate];
    id v5 = [v4 displayedViewMode];

    if (v5 != (id)3)
    {
      id v6 = [(ControlContaineeViewController *)self delegate];
      [v6 updateViewMode:3 animated:1];
    }
    id v7 = [(ControlContaineeViewController *)self delegate];
    unsigned int v8 = [v7 mapApplicationState];

    if (v8 != 7)
    {
      id v9 = [(ControlContaineeViewController *)self delegate];
      [v9 updateMapApplicationState:7];
    }
  }
  id v10 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];
  [v10 transitSchedulesViewControllerWantsToUpdateRouteAnnotations:self];
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitSchedulesViewController *)self selectedTripRoute];
  if (v5)
  {
    id v6 = [(TransitSchedulesViewController *)self selectedTripRoute];
    id v10 = v6;
    id v7 = +[NSArray arrayWithObjects:&v10 count:1];
    [v4 setRoutes:v7];
  }
  else
  {
    [v4 setRoutes:0];
  }

  unsigned int v8 = [(TransitSchedulesViewController *)self lastReceivedVehiclePositions];
  [v4 setTransitVehiclePositions:v8];

  return 1;
}

- (int64_t)_numberOfDeparturesInSnapshot
{
  id v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v4 = [v3 indexOfSectionIdentifier:&off_1013A7240];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v7 = [v6 numberOfItemsInSection:&off_1013A7240];

  return (int64_t)v7;
}

- (void)restoreInitialMapState
{
  id v12 = [(ControlContaineeViewController *)self delegate];
  if ([v12 displayedViewMode] != (id)3)
  {
LABEL_8:

    return;
  }
  id v3 = [(ControlContaineeViewController *)self delegate];
  unsigned int v4 = [v3 mapApplicationState];

  if (v4 == 7)
  {
    int64_t initialViewMode = self->_initialViewMode;
    id v6 = [(ControlContaineeViewController *)self delegate];
    id v7 = [v6 displayedViewMode];

    if ((id)initialViewMode != v7)
    {
      unsigned int v8 = [(ControlContaineeViewController *)self delegate];
      [v8 updateViewMode:self->_initialViewMode animated:1];
    }
    int initialMapApplicationState = self->_initialMapApplicationState;
    id v10 = [(ControlContaineeViewController *)self delegate];
    unsigned int v11 = [v10 mapApplicationState];

    if (initialMapApplicationState != v11)
    {
      id v12 = [(ControlContaineeViewController *)self delegate];
      [v12 updateMapApplicationState:self->_initialMapApplicationState];
      goto LABEL_8;
    }
  }
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v7 = &OBJC_IVAR___TransitSchedulesViewController__lineOptionsProvider;
  switch(-[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v6 section]))
  {
    case 0uLL:
      id v8 = [v6 row];
      id v9 = [(TransitSchedulesViewController *)self departureDataProvider];
      [v9 selectDepartureSequenceAtIndex:v8];

      id v10 = [(TransitSchedulesViewController *)self departureDataProvider];
      unsigned int v11 = [v10 selectedDepartureSequence];
      id v12 = [v11 displayName];

      id v13 = +[NSString stringWithFormat:@"%lu, %@", v8, v12];

      uint64_t v14 = 49;
      goto LABEL_16;
    case 1uLL:
      id v7 = &OBJC_IVAR___TransitSchedulesViewController__departureInfoProvider;
      goto LABEL_4;
    case 3uLL:
      id v16 = [v6 row];
      long long v17 = [(TransitSchedulesViewController *)self departureDataProvider];
      id v18 = [v17 selectDepartureAtIndex:v16];

      goto LABEL_17;
    case 4uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_transitIncidentCell);
      uint64_t v20 = WeakRetained;
      if (WeakRetained)
      {
        id v21 = WeakRetained;
      }
      else
      {
        id v21 = [(TransitSchedulesViewController *)self collectionView:v29 cellForItemAtIndexPath:v6 itemIdentifier:@"IncidentsCellIdentifier"];
      }
      v25 = v21;

      v26 = [(TransitSchedulesViewController *)self actionCoordinator];
      v27 = [(TransitSchedulesViewController *)self incidents];
      [v26 viewController:self openTransitIncidents:v27 fromView:v25 withUserInfo:0];
      uint64_t v14 = 7008;
      goto LABEL_13;
    case 7uLL:
LABEL_4:
      long long v15 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
      [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7) selectedCellAtIndexPath:v6 withIdentifier:v15];

      goto LABEL_5;
    case 8uLL:
      id v22 = +[GEOResourceManifestManager modernManager];
      v23 = [v22 activeTileGroup];
      id v24 = [v23 attributions];
      v25 = [v24 firstObject];

      v26 = [v25 url];
      if (v26)
      {
        v27 = +[NSURL URLWithString:v26];
        uint64_t v28 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];
        [v28 transitSchedulesViewController:self wantsToOpenURL:v27];

        uint64_t v14 = 7021;
LABEL_13:
      }
      else
      {
        uint64_t v14 = 7021;
      }

      [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:v6 animated:1];
      id v13 = 0;
LABEL_16:
      +[GEOAPPortal captureUserAction:v14 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:v13];

      goto LABEL_17;
    default:
LABEL_5:
      [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:v6 animated:1];
LABEL_17:

      return;
  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  unint64_t v5 = -[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [a4 section:a3]);
  BOOL result = 1;
  if (v5 <= 9)
  {
    if (((1 << v5) & 0x264) != 0) {
      return 0;
    }
    if (v5 == 1)
    {
      uint64_t v7 = 280;
    }
    else
    {
      if (v5 != 7) {
        return result;
      }
      uint64_t v7 = 296;
    }
    id v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
    return _[v8 allowsCellSelection];
  }
  return result;
}

- (void)_updateStopsSectionHeader
{
  id v3 = [(TransitSchedulesViewController *)self _headerViewForSectionType:6];
  [(TransitSchedulesViewController *)self _updateStopsSectionHeader:v3];
}

- (void)_updateStopsSectionHeader:(id)a3
{
  id v6 = a3;
  if ([(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource canShowMoreStops])
  {
    unsigned int v4 = +[NSBundle mainBundle];
    unint64_t v5 = [v4 localizedStringForKey:@"[Transit Schedules] More" value:@"localized string not found" table:0];

    [v6 addButtonWithText:v5 buttonTarget:self buttonAction:"_expandStopsSection:"];
  }
  else
  {
    [v6 removeSecondaryText];
  }
}

- (void)_expandStopsSection:(id)a3
{
  [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource expandTransitTripStops];
  [(TransitSchedulesViewController *)self _rebuildStopsSection];
  [(TransitSchedulesViewController *)self _updateStopsSectionHeader];
  uint64_t v4 = [(TransitSchedulesViewController *)self currentUITargetForAnalytics];

  +[GEOAPPortal captureUserAction:9040 target:v4 value:0];
}

- (void)_addSection:(unint64_t)a3 toSnapshot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 sectionIdentifiers];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004A37EC;
  v13[3] = &unk_1012EBFF8;
  long long v15 = &v17;
  unint64_t v16 = a3;
  id v8 = v6;
  id v14 = v8;
  [v7 enumerateObjectsUsingBlock:v13];
  if (!*((unsigned char *)v18 + 24))
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:a3];
    id v21 = v9;
    id v10 = +[NSArray arrayWithObjects:&v21 count:1];
    [v8 appendSectionsWithIdentifiers:v10];
  }
  unsigned int v11 = [v8 sectionIdentifiers];
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v11;

  _Block_object_dispose(&v17, 8);
}

- (void)_clearSection:(unint64_t)a3 inSnapshot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = v7;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v6 deleteSectionsWithIdentifiers:v8];

  [(TransitSchedulesViewController *)self _addSection:a3 toSnapshot:v6];
}

- (void)_removeSection:(unint64_t)a3 toSnapshot:(id)a4
{
  id v6 = a4;
  if ([(TransitSchedulesViewController *)self _sectionIndexForSectionType:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
    unsigned int v11 = v7;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    [v6 deleteSectionsWithIdentifiers:v8];

    id v9 = [v6 sectionIdentifiers];
    sectionIdentifiers = self->_sectionIdentifiers;
    self->_sectionIdentifiers = v9;
  }
}

- (void)departureDataProvider:(id)a3 updatedDepartures:(id)a4
{
  dataSource = self->_dataSource;
  id v6 = a4;
  uint64_t v7 = [(UICollectionViewDiffableDataSource *)dataSource snapshot];
  id v8 = [(TransitSchedulesViewController *)self departureCellProvider];
  id v9 = [v8 identifiersForDepartures:v6];

  if ([v9 count])
  {
    id v10 = sub_100576CFC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = v9;
      id v12 = v11;
      if (v11)
      {
        if ([v11 count])
        {
          id v13 = [v12 componentsJoinedByString:@", "];
          id v14 = +[NSString stringWithFormat:@"<%p> [%@]", v12, v13];
        }
        else
        {
          id v14 = +[NSString stringWithFormat:@"<%p> (empty)", v12];
        }
      }
      else
      {
        id v14 = @"<nil>";
      }

      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updating departures section with identifiers: %{public}@", buf, 0xCu);
    }
    [(TransitSchedulesViewController *)self _clearSection:3 inSnapshot:v7];
    [v7 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:&off_1013A7240];
    [v7 reloadItemsWithIdentifiers:v9];
  }
  else
  {
    [(TransitSchedulesViewController *)self _removeSection:3 toSnapshot:v7];
  }
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v7 animatingDifferences:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004A3D14;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)departureDataProvider:(id)a3 selectedDepartureSequence:(id)a4 withIndex:(unint64_t)a5
{
  id v13 = a4;
  uint64_t v7 = +[NSIndexPath indexPathForRow:a5 inSection:[(TransitSchedulesViewController *)self _sectionIndexForSectionType:0]];
  id v8 = [(TransitSchedulesViewController *)self headsignCellProvider];
  [v8 collectionView:self->_collectionView selectedHeadsignForDepartureSequence:v13 atIndexPath:v7];

  id v9 = [v13 displayName];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = [v13 displayName];
    id v12 = [(TransitSchedulesViewController *)self headerTitleView];
    [v12 setSubtitle:v11];
  }
}

- (BOOL)_shouldShowDepartureInfoSection
{
  id v3 = [(TransitSchedulesViewController *)self selectedTransitLine];
  if ([v3 departureTimeDisplayStyle] == (id)3)
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider departures];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (BOOL)_hasHeadsignSection
{
  return [(TransitSchedulesViewController *)self _sectionIndexForSectionType:0] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)departureDataProvider:(id)a3 updatedDepartureSequences:(id)a4
{
  id v5 = a4;
  id v6 = [(TransitSchedulesViewController *)self headsignCellProvider];
  uint64_t v7 = [v6 identifiersForDepartureSequences:v5];

  unsigned int v8 = [(TransitSchedulesViewController *)self _hasHeadsignSection];
  id v9 = [v5 count];

  if ((unint64_t)v9 >= 2 && [v7 count])
  {
    if ((v8 & 1) == 0)
    {
      id v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
      [(TransitSchedulesViewController *)self _clearSection:0 inSnapshot:v10];
      [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshotUsingReloadData:v10];
    }
    id v11 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [(TransitSchedulesViewController *)self _clearSection:0 inSnapshot:v11];
    [v11 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&off_1013A72A0];
    unint64_t v12 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider indexForSelectedDepartureSequence];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1004A40CC;
    v14[3] = &unk_1012E69C0;
    void v14[4] = self;
    v14[5] = v12;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    goto LABEL_8;
  }
  if (v8)
  {
    id v11 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [(TransitSchedulesViewController *)self _removeSection:0 toSnapshot:v11];
LABEL_8:
    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v11 animatingDifferences:1];
  }
  id v13 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider selectedDepartureSequence];
  [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDepartureSequence:v13];
}

- (void)departureDataProvider:(id)a3 selectedDeparture:(id)a4 withIndex:(unint64_t)a5
{
  id v7 = a4;
  id v9 = +[NSIndexPath indexPathForRow:a5 inSection:[(TransitSchedulesViewController *)self _sectionIndexForSectionType:3]];
  unsigned int v8 = [(TransitSchedulesViewController *)self departureCellProvider];
  [v8 collectionView:self->_collectionView selectedDeparture:v7 atIndexPath:v9];

  [(TransitSchedulesViewController *)self setSelectedDeparture:v7];
}

- (void)setSelectedDeparture:(id)a3
{
  id v15 = a3;
  id v4 = [v15 tripIdentifier];
  if (v4 == (id)[(TransitSchedulesViewController *)self selectedTripIdentifier])
  {
    id v5 = [v15 scheduledDepartureDate];
    BOOL v6 = v5 == self->_selectedTripDepartureDate;
  }
  else
  {
    BOOL v6 = 0;
  }
  BOOL v7 = ![(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource hasStops]
    && (id)[(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource remoteNetworkState] != (id)2;
  unsigned int v8 = v15;
  if (!v6 || v7)
  {
    unsigned int v9 = [(TransitSchedulesViewController *)self hasSelectedTrip];
    id v10 = [v15 vehicleIdentifier];
    [(TransitSchedulesViewController *)self setSelectedTripVehicleNumber:v10];

    +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 tripIdentifier]);
    id v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    selectedTripIdentifier = self->_selectedTripIdentifier;
    self->_selectedTripIdentifier = v11;

    id v13 = [v15 scheduledDepartureDate];
    selectedTripDepartureDate = self->_selectedTripDepartureDate;
    self->_selectedTripDepartureDate = v13;

    [(TransitSchedulesViewController *)self _clearVehicles];
    if (v9) {
      [(TransitSchedulesViewController *)self loadSelectedTripDetails];
    }
    else {
      [(TransitSchedulesViewController *)self fetchNewScheduleData];
    }
    +[GEOAPPortal captureUserAction:3074 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
    unsigned int v8 = v15;
  }
}

- (void)departureCellProvider:(id)a3 selectDeparture:(id)a4 withIndex:(unint64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(TransitSchedulesViewController *)self _sectionIndexForSectionType:3];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = (id)v8;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = [(TransitSchedulesViewController *)self collectionView];
    id v11 = [v10 indexPathsForSelectedItems];

    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v16 section] == v9)
          {
            uint64_t v17 = [(TransitSchedulesViewController *)self collectionView];
            [v17 deselectItemAtIndexPath:v16 animated:0];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    id v18 = +[NSIndexPath indexPathForRow:a5 inSection:v9];
    uint64_t v19 = [(TransitSchedulesViewController *)self collectionView];
    [v19 selectItemAtIndexPath:v18 animated:0 scrollPosition:0];

    [(TransitSchedulesViewController *)self setSelectedDeparture:v7];
  }
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  +[GEOAPPortal captureUserAction:34 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
  v5.receiver = self;
  v5.super_class = (Class)TransitSchedulesViewController;
  [(ContaineeViewController *)&v5 handleDismissAction:v4];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 < 3)
  {
    id v4 = [(ContaineeViewController *)self cardPresentationController];
    [v4 availableHeight];
    double v6 = v5;

    return v6;
  }
  if (a3 != 2)
  {
    double v6 = -1.0;
    if (a3 == 1)
    {
      id v7 = [(ContaineeViewController *)self cardPresentationController];
      [v7 bottomSafeOffset];
      double v9 = v8;
      [(ContaineeViewController *)self headerHeight];
      double v6 = v9 + v10;
    }
    return v6;
  }

  sub_10002197C();
  return result;
}

- (unint64_t)preferredPresentationStyle
{
  return 2;
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  id v5 = a4;
  [(TransitSchedulesViewController *)self setReferenceDate:v5];
  [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource setReferenceDate:v5 dataSource:self->_dataSource];
}

- (id)ticketForTransitMapItemUpdater:(id)a3
{
  if ([(TransitSchedulesViewController *)self hasSelectedTrip])
  {
    id v4 = [(TransitSchedulesViewController *)self selectedTransitLine];
    id v5 = [v4 muid];

    double v6 = +[MKMapService sharedService];
    unint64_t boardingStopMuid = self->_boardingStopMuid;
    unint64_t v8 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
    BOOL requestAllDirections = self->_requestAllDirections;
    routingParameters = self->_routingParameters;
    id v11 = [(TransitSchedulesViewController *)self traits];
    id v12 = [v6 ticketForUpdatedTransitScheduleDetailsAtStation:boardingStopMuid line:v5 referenceTripID:v8 includeAllDirectionNames:requestAllDirections routingParameters:routingParameters traits:v11];
  }
  else
  {
    id v13 = sub_100576CFC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Attempting to update the schedule card's mapItem, but there is no selected trip", v15, 2u);
    }

    id v12 = 0;
  }

  return v12;
}

- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    double v9 = sub_100576CFC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v27 = 134218242;
      unint64_t v28 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "The service encountered an error while updating trip id %llu. Error %@", (uint8_t *)&v27, 0x16u);
    }
  }
  else
  {
    double v10 = [v7 _transitInfo];
    id v11 = [v10 departureSequences];
    id v12 = [v11 count];

    if (v12)
    {
      [(TransitSchedulesViewController *)self processUpdatedDepartureSequencesFromMapItem:v7];
    }
    else
    {
      id v13 = sub_100576CFC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v27 = 134217984;
        unint64_t v28 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "The service failed to return any departures for the requested trip id %llu while updating", (uint8_t *)&v27, 0xCu);
      }
    }
    uint64_t v14 = [v7 _transitInfo];
    id v15 = [v14 transitTripStops];
    double v9 = [v15 copy];

    if ([v9 count])
    {
      [(TransitSchedulesViewController *)self updateStopsSectionForNetworkState:1];
      unint64_t v16 = [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource stopIdentifiers];
      id v17 = [v16 count];

      [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource buildTransitTripStopItemsWithTransitStops:v9 boardingStopDepartureDate:self->_selectedTripDepartureDate maintainingCollapsedState:1];
      id v18 = [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource stopIdentifiers];
      id v19 = [v18 count];

      if (v17 == v19)
      {
        long long v20 = sub_100576CFC();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource stopIdentifiers];
          id v22 = [v21 count];
          id v23 = [v9 count];
          unint64_t v24 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
          int v27 = 134218496;
          unint64_t v28 = (unint64_t)v22;
          __int16 v29 = 2048;
          id v30 = v23;
          __int16 v31 = 2048;
          unint64_t v32 = v24;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "The number of transit stops changed (from %lu to %lu) during the network refresh for trip id %llu", (uint8_t *)&v27, 0x20u);
        }
      }
      [(TransitSchedulesViewController *)self _rebuildStopsSection];
    }
    else
    {
      v25 = sub_100576CFC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
        int v27 = 134217984;
        unint64_t v28 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "The service failed to return any transit stops when updating for the requested trip id %llu", (uint8_t *)&v27, 0xCu);
      }
    }
  }
}

- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5
{
  id v6 = a4;
  if ([v6 count] == (id)1)
  {
    id v7 = [v6 anyObject];
    id v8 = sub_100576CFC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [(TransitSchedulesViewController *)self selectedTripIdentifier];
      double v10 = [v7 timestamp];
      int v13 = 134218242;
      unint64_t v14 = v9;
      __int16 v15 = 2112;
      unint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received vehicle position update for trip %llu with timestamp %@", (uint8_t *)&v13, 0x16u);
    }
  }
  id v11 = [v6 allObjects];
  [(TransitSchedulesViewController *)self setLastReceivedVehiclePositions:v11];

  id v12 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];
  [v12 transitSchedulesViewControllerWantsToUpdateRouteAnnotations:self];
}

- (void)transitVehicleUpdater:(id)a3 didTimeoutUpdateForTripIDs:(id)a4
{
  id v4 = a4;
  id v5 = sub_100576CFC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Vehicle position update timeout for trip ids %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)transitVehicleUpdater:(id)a3 didFailUpdateForTripIDs:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_100576CFC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Vehicle position update error for trip ids %@. Error: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_updateVehicleUpdater
{
  if ([(TransitSchedulesViewController *)self hasSelectedTrip]) {
    +[NSSet setWithObject:self->_selectedTripIdentifier];
  }
  else {
  id v4 = +[NSSet set];
  }
  id v3 = [(TransitSchedulesViewController *)self vehicleUpdater];
  [v3 setTripIDs:v4];
}

- (void)_clearVehicles
{
  id v3 = +[NSSet set];
  id v4 = [(TransitSchedulesViewController *)self vehicleUpdater];
  [v4 setTripIDs:v3];

  [(TransitSchedulesViewController *)self setLastReceivedVehiclePositions:0];
  id v5 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];
  [v5 transitSchedulesViewControllerWantsToUpdateRouteAnnotations:self];
}

- (unint64_t)_sectionTypeForSectionIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_sectionIdentifiers count] < a3) {
    return 9;
  }
  id v6 = [(NSArray *)self->_sectionIdentifiers objectAtIndexedSubscript:a3];
  id v7 = [v6 unsignedIntegerValue];

  return (unint64_t)v7;
}

- (int64_t)_sectionIndexForSectionType:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  sectionIdentifiers = self->_sectionIdentifiers;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004A508C;
  v6[3] = &unk_1012EC020;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSArray *)sectionIdentifiers enumerateObjectsUsingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch(-[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v9 section]))
  {
    case 0uLL:
      __int16 v11 = [(TransitSchedulesViewController *)self headsignCellProvider];
      id v12 = [v11 collectionView:self->_collectionView headsignCellWithIdentifier:v10 indexPath:v9 dataProvider:self->_departureDataProvider];
      goto LABEL_8;
    case 1uLL:
      id v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"TransitLineDepartureInfoCellIdentifier" forIndexPath:v9];
      uint64_t v13 = 280;
      goto LABEL_14;
    case 2uLL:
      id v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"TransitScheduleNetworkActivityTableViewCellIdentifier" forIndexPath:v9];
      departureDataProvider = self->_departureDataProvider;
      if (departureDataProvider) {
        id initialRoutingSchedulesNetworkRequestState = [(TransitSchedulesDepartureDataProvider *)departureDataProvider remoteNetworkState];
      }
      else {
        id initialRoutingSchedulesNetworkRequestState = self->_initialRoutingSchedulesNetworkRequestState;
      }
      if (initialRoutingSchedulesNetworkRequestState != (id)3) {
        goto LABEL_21;
      }
      id v23 = +[NSBundle mainBundle];
      unint64_t v24 = v23;
      CFStringRef v25 = @"[Transit Schedule] Departures unavailable message";
      goto LABEL_20;
    case 3uLL:
      __int16 v11 = [(TransitSchedulesViewController *)self departureCellProvider];
      collectionView = self->_collectionView;
      id v17 = [(TransitSchedulesViewController *)self referenceDate];
      id v12 = [v11 collectionView:collectionView departureCellWithIdentifier:v10 indexPath:v9 referenceDate:v17 dataProvider:self->_departureDataProvider];

LABEL_8:
      goto LABEL_22;
    case 4uLL:
      id v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"IncidentsCellIdentifier" forIndexPath:v9];
      p_transitIncidentCell = &self->_transitIncidentCell;
      objc_storeWeak((id *)&self->_transitIncidentCell, v18);

      long long v20 = [(TransitSchedulesViewController *)self referenceDate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_transitIncidentCell);
      id v22 = [(TransitSchedulesViewController *)self incidents];
      [WeakRetained configureWithIncidents:v22 referenceDate:v20];

      id v12 = objc_loadWeakRetained((id *)p_transitIncidentCell);
      goto LABEL_22;
    case 5uLL:
      id v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"TransitScheduleNetworkActivityTableViewCellIdentifier" forIndexPath:v9];
      if ((id)[(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource remoteNetworkState] == (id)3)
      {
        id v23 = +[NSBundle mainBundle];
        unint64_t v24 = v23;
        CFStringRef v25 = @"[Transit Schedule] Stops unavailable message";
LABEL_20:
        unint64_t v26 = [v23 localizedStringForKey:v25 value:@"localized string not found" table:0];
        [v12 setErrorStateWithString:v26];
      }
      else
      {
        id initialRoutingSchedulesNetworkRequestState = [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource remoteNetworkState];
LABEL_21:
        [v12 setState:initialRoutingSchedulesNetworkRequestState];
      }
LABEL_22:

      return v12;
    case 6uLL:
      id v12 = [(TransitScheduleStopsTableViewDataSource *)self->_stopsDataSource collectionView:v8 cellForItemAtIndexPath:v9 itemIdentifier:v10];
      goto LABEL_22;
    case 7uLL:
      id v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"TransitLineOptionsCellIdentifier" forIndexPath:v9];
      uint64_t v13 = 296;
LABEL_14:
      [*(id *)((char *)&self->super.super.super.super.super.super.isa + v13) configureCell:v12 forIndexPath:v9 withIdentifier:v10];
      goto LABEL_22;
    case 8uLL:
      id v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"TransitAttributionCellIdentifier" forIndexPath:v9];
      [v12 setAttribution:self->_attribution];
      goto LABEL_22;
    default:
      id v12 = 0;
      goto LABEL_22;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = sub_1000BBB44(self);
  unint64_t v10 = -[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v8 section]);
  unint64_t v11 = v10;
  if (v9 == 5
    && v10 == 3
    && (id)[(TransitSchedulesViewController *)self _departuresHeaderStyle] == (id)2)
  {
    id v12 = +[TransitStationLineScheduleSectionHeaderView identifier];
    uint64_t v13 = [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v12 forIndexPath:v8];

    id v14 = [v13 datePicker];
    __int16 v15 = [(TransitSchedulesViewController *)self departureDataProvider];
    unint64_t v16 = [v15 timeZone];
    [v14 setTimeZone:v16];

    id v17 = [(TransitSchedulesViewController *)self departureDataProvider];
    id v18 = [v17 scheduleWindowStartDate];
    [v14 setMinimumDate:v18];

    id v19 = [(TransitSchedulesViewController *)self departureDataProvider];
    long long v20 = [v19 scheduleWindowStartDate];
    [v14 setDate:v20];

    [v14 setDatePickerMode:2];
    [v14 addTarget:self action:"changedDate:" forControlEvents:4096];
    long long v21 = +[NSBundle mainBundle];
    id v22 = [v21 localizedStringForKey:@"[Transit Schedules] macOS Departures Title" value:@"localized string not found" table:0];
    [v13 setTitle:v22];
  }
  else
  {
    id v23 = +[TransitStationLineScheduleSectionHeaderView identifier];
    id v14 = [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v23 forIndexPath:v8];

    uint64_t v13 = 0;
    switch(v11)
    {
      case 1uLL:
        CFStringRef v25 = +[NSBundle mainBundle];
        unint64_t v24 = [v25 localizedStringForKey:@"[Transit Schedules] Departure Info" value:@"localized string not found" table:0];

        [v14 setTitle:v24];
        goto LABEL_12;
      case 2uLL:
      case 3uLL:
        if ((id)[(TransitSchedulesViewController *)self _departuresHeaderStyle] == (id)2) {
          [v14 addButtonWithTarget:self action:"changeDate"];
        }
        [(TransitSchedulesViewController *)self _updateDeparturesHeaderTitlesForHeaderView:v14];
        goto LABEL_14;
      case 5uLL:
      case 6uLL:
        unint64_t v24 = [(TransitSchedulesViewController *)self titleForStopsHeader];
        [v14 setBottomHairlineHidden:1];
        [v14 setTitle:v24];
        [(TransitSchedulesViewController *)self _updateStopsSectionHeader:v14];
        goto LABEL_12;
      case 7uLL:
        unint64_t v26 = +[NSBundle mainBundle];
        unint64_t v24 = [v26 localizedStringForKey:@"[Transit Schedules] Line Options" value:@"localized string not found" table:0];

        [v14 setTitle:v24];
        [v14 setBottomHairlineHidden:1];
LABEL_12:
        id v14 = v14;

        uint64_t v13 = v14;
        break;
      case 8uLL:
        [v14 setBottomHairlineHidden:v9 != 5];
LABEL_14:
        id v14 = v14;
        uint64_t v13 = v14;
        break;
      default:
        break;
    }
  }

  return v13;
}

- (id)_firstVisibleDeparture
{
  if (sub_1000BBB44(self) != 5)
  {
    id v3 = [(TransitSchedulesViewController *)self collectionView];
    int64_t v4 = [v3 window];

    if (v4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = [(UICollectionView *)self->_collectionView visibleCells];
      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        id v7 = v6;
        id v8 = 0;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v5);
            }
            unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v8)
              {
                [v11 frame];
                double v13 = v12;
                [v8 frame];
                if (v13 < v14)
                {
                  id v15 = v11;

                  id v8 = v15;
                }
              }
              else
              {
                id v8 = v11;
              }
            }
          }
          id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v7);

        if (v8)
        {
          uint64_t v16 = [v8 departure];
          goto LABEL_19;
        }
      }
      else
      {
      }
    }
  }
  id v8 = [(TransitSchedulesViewController *)self departureDataProvider];
  uint64_t v16 = [v8 selectedDeparture];
LABEL_19:
  id v17 = (void *)v16;

  return v17;
}

- (void)_updateDeparturesHeaderTitles
{
  id v3 = [(TransitSchedulesViewController *)self _headerViewForSectionType:3];
  [(TransitSchedulesViewController *)self _updateDeparturesHeaderTitlesForHeaderView:v3];
}

- (void)_updateDeparturesHeaderTitlesForHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v22 = [v5 localizedStringForKey:@"[Transit Schedules] Departures" value:@"localized string not found" table:0];

  id v6 = [(TransitSchedulesViewController *)self _firstVisibleDeparture];
  if (sub_1000BBB44(self) != 5)
  {
    if (v6) {
      [v6 departureDate];
    }
    else {
    id v7 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider scheduleWindowStartDate];
    }
    id v8 = [(TransitSchedulesViewController *)self referenceDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    GEOTransitDepartureNearFuturePeriod();
    if (v10 <= v11)
    {
      double v12 = +[NSBundle mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"[Transit Schedules] Upcoming Departures" value:@"localized string not found" table:0];

      id v22 = (id)v13;
    }
  }
  unint64_t v14 = [(TransitSchedulesViewController *)self _departuresHeaderStyle];
  if (v14 != 2)
  {
    if (v14 == 1)
    {
      id v15 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider frequencyStringForDeparture:v6];
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (sub_1000BBB44(self) == 5)
  {
LABEL_12:
    id v15 = 0;
    goto LABEL_13;
  }
  uint64_t v16 = +[NSDate date];
  id v17 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider scheduleWindowStartDate];
  [v16 timeIntervalSinceDate:v17];

  if (GEOTransitDepartureIsNearFutureDepartureTimeInterval())
  {
    id v18 = +[NSBundle mainBundle];
    id v15 = [v18 localizedStringForKey:@"[Transit Schedules] Now" value:@"localized string not found" table:0];
  }
  else
  {
    long long v19 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider scheduleWindowStartDate];

    if (!v19) {
      goto LABEL_12;
    }
    long long v20 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider timeZone];
    long long v21 = [(TransitSchedulesDepartureDataProvider *)self->_departureDataProvider scheduleWindowStartDate];
    id v15 = +[NSDate _maps_dateDescriptionShort:0 timeZone:v20 bookingDate:v21];
  }
LABEL_13:
  [v4 setTitle:v22];
  [v4 setSecondaryText:v15];
}

- (int)currentUITargetForAnalytics
{
  return 651;
}

- (void)timingViewController:(id)a3 didPickTiming:(id)a4
{
  uint64_t v5 = [a4 departureDate];
  id v7 = (id)v5;
  if (v5)
  {
    [(TransitSchedulesViewController *)self setScheduleWindowStartDate:v5];
  }
  else
  {
    id v6 = objc_opt_new();
    [(TransitSchedulesViewController *)self setScheduleWindowStartDate:v6];
  }
}

- (void)selectDepartureSequence:(id)a3
{
  departureDataProvider = self->_departureDataProvider;
  id v5 = a3;
  [(TransitSchedulesDepartureDataProvider *)departureDataProvider selectDepartureSequence:v5];
  [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider setDepartureSequence:v5];
}

- (void)selectDeparture:(id)a3
{
  departureDataProvider = self->_departureDataProvider;
  id v4 = [a3 tripIdentifier];

  [(TransitSchedulesDepartureDataProvider *)departureDataProvider selectDepartureWithTripIdentifier:v4];
}

- (void)viewLineOnMap
{
  id v3 = [(TransitSchedulesViewController *)self selectedTripRoute];

  if (v3)
  {
    id v4 = [(TransitSchedulesViewController *)self selectedTripRoute];
    [(GEOLocation *)self->_boardingStopLocation coordinate];
    [v4 closestPointOnRoute:];

    id v6 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];
    id v9 = [v6 mapCameraControllerForTransitSchedulesViewController:self];

    id v7 = [(TransitSchedulesViewController *)self selectedTripRoute];
    [v9 displayTransitRoute:v7 boardingStopCoord:v5 boardingStopIndex:self->_boardingStopIndex animated:1 completion:0];

    id v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 wantsLayout:1];

    +[GEOAPPortal captureUserAction:7018 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
  }
}

- (void)showDirectionsToSelectedTransitStop
{
  id v3 = sub_100576CFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    boardingStopMapItem = self->_boardingStopMapItem;
    *(_DWORD *)buf = 138412290;
    id v18 = boardingStopMapItem;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Routing from current location to boarding stop: %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init(SearchFieldItem);
  id v6 = +[SearchResult currentLocationSearchResult];
  [(SearchFieldItem *)v5 setSearchResult:v6];

  id v7 = objc_alloc_init(SearchFieldItem);
  id v8 = [[SearchResult alloc] initWithMapItem:self->_boardingStopMapItem];
  [(SearchFieldItem *)v7 setSearchResult:v8];

  id v9 = [DirectionItem alloc];
  v16[0] = v5;
  v16[1] = v7;
  double v10 = +[NSArray arrayWithObjects:v16 count:2];
  double v11 = [(DirectionItem *)v9 initWithItems:v10 transportType:3];

  CFStringRef v14 = @"DirectionsSessionInitiatorKey";
  id v15 = &off_1013A71F8;
  double v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  uint64_t v13 = [(TransitSchedulesViewController *)self actionCoordinator];
  [v13 viewController:self doDirectionItem:v11 withUserInfo:v12];

  +[GEOAPPortal captureUserAction:6003 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
}

- (void)showLineInfo
{
  if (self->_selectedTransitLineItem)
  {
    id v3 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];

    if (v3)
    {
      id v4 = [(TransitSchedulesViewController *)self transitSchedulesDelegate];
      [v4 transitSchedulesViewController:self wantsToShowInfoForLine:self->_selectedTransitLineItem];
    }
  }
}

- (void)setPinnedTransitLine:(BOOL)a3
{
  if (self->_pinnedTransitLine != a3)
  {
    self->_pinnedTransitLine = a3;
    if ([(TransitSchedulesViewController *)self _sectionIndexForSectionType:7] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
      id v4 = [(TransitSchedulesLineOptionsProvider *)self->_lineOptionsProvider identifiers];
      [v5 reloadItemsWithIdentifiers:v4];
      [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v5 animatingDifferences:1];
    }
  }
}

- (void)_checkIfPinnedLine
{
  if (!self->_isRoutingScheduleCard)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1004A642C;
    v3[3] = &unk_1012EC048;
    objc_copyWeak(&v4, &location);
    [(TransitSchedulesViewController *)self _fetchMapsSyncTransitLineItemWithCallback:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)pinSelectedTransitLine
{
  id v3 = objc_alloc_init((Class)MSCollectionTransitItem);
  id v4 = [objc_alloc((Class)MSPTransitStorageLine) initWithLine:self->_selectedTransitLine];
  id v5 = [v4 data];
  [v3 setTransitLineStorage:v5];

  [v3 setMuid:[self->_selectedTransitLine muid]];
  id v6 = +[MapsSyncStore sharedStore];
  id v8 = v3;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [v6 saveWithObjects:v7 completionHandler:&stru_1012EC068];

  +[GEOAPPortal captureUserAction:241 target:[(TransitSchedulesViewController *)self currentUITargetForAnalytics] value:0];
}

- (void)unpinSelectedTransitLine
{
  [(TransitSchedulesViewController *)self _fetchMapsSyncTransitLineItemWithCallback:&stru_1012EC0A8];
  uint64_t v3 = [(TransitSchedulesViewController *)self currentUITargetForAnalytics];

  +[GEOAPPortal captureUserAction:252 target:v3 value:0];
}

- (void)_fetchMapsSyncTransitLineItemWithCallback:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc_init((Class)MSCollectionTransitItemRequest);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1004A69B0;
    v6[3] = &unk_1012EB628;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 fetchWithCompletionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)updatedDepartureInfoProvider:(id)a3
{
  if (![(TransitSchedulesViewController *)self _shouldShowDepartureInfoSection]) {
    return;
  }
  id v7 = [(TransitSchedulesDepartureInfoProvider *)self->_departureInfoProvider identifiers];
  if ([v7 count])
  {
    p_dataSource = &self->_dataSource;
    id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [(TransitSchedulesViewController *)self _clearSection:1 inSnapshot:v5];
    id v6 = +[NSNumber numberWithUnsignedInteger:1];
    [v5 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:v6];

LABEL_7:
    [(UICollectionViewDiffableDataSource *)*p_dataSource applySnapshot:v5 animatingDifferences:1];

    goto LABEL_8;
  }
  if ([(TransitSchedulesViewController *)self _sectionIndexForSectionType:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    p_dataSource = &self->_dataSource;
    id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [(TransitSchedulesViewController *)self _removeSection:1 toSnapshot:v5];
    goto LABEL_7;
  }
LABEL_8:
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (TransitSchedulesViewControllerDelegate)transitSchedulesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitSchedulesDelegate);

  return (TransitSchedulesViewControllerDelegate *)WeakRetained;
}

- (void)setTransitSchedulesDelegate:(id)a3
{
}

- (ActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (ActionCoordination *)WeakRetained;
}

- (void)setActionCoordinator:(id)a3
{
}

- (GEOTransitVehicleUpdater)vehicleUpdater
{
  return self->_vehicleUpdater;
}

- (void)setVehicleUpdater:(id)a3
{
}

- (GEOComposedRoute)selectedTripRoute
{
  return self->_selectedTripRoute;
}

- (GEOTransitLine)selectedTransitLine
{
  return self->_selectedTransitLine;
}

- (NSString)selectedTripVehicleNumber
{
  return self->_selectedTripVehicleNumber;
}

- (NSArray)lastReceivedVehiclePositions
{
  return self->_lastReceivedVehiclePositions;
}

- (void)setLastReceivedVehiclePositions:(id)a3
{
}

- (MKTransitMapItemUpdater)mapItemUpdater
{
  return self->_mapItemUpdater;
}

- (void)setMapItemUpdater:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (TransitSchedulesHeaderView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
}

- (void)setDepartureCellProvider:(id)a3
{
}

- (void)setHeadsignCellProvider:(id)a3
{
}

- (TransitSchedulesDepartureDataProvider)departureDataProvider
{
  return self->_departureDataProvider;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (BOOL)isPinnedTransitLine
{
  return self->_pinnedTransitLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_departureDataProvider, 0);
  objc_storeStrong((id *)&self->_headsignCellProvider, 0);
  objc_storeStrong((id *)&self->_departureCellProvider, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mapItemUpdater, 0);
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, 0);
  objc_storeStrong((id *)&self->_selectedTripVehicleNumber, 0);
  objc_storeStrong((id *)&self->_selectedTransitLine, 0);
  objc_storeStrong((id *)&self->_selectedTripRoute, 0);
  objc_storeStrong((id *)&self->_vehicleUpdater, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_destroyWeak((id *)&self->_transitSchedulesDelegate);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_boardingStopMapItem, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineItem, 0);
  objc_storeStrong((id *)&self->_lineOptionsProvider, 0);
  objc_storeStrong((id *)&self->_departureInfoProvider, 0);
  objc_destroyWeak((id *)&self->_transitIncidentCell);
  objc_storeStrong((id *)&self->_boardingStopTimeZone, 0);
  objc_storeStrong((id *)&self->_boardingStopLocation, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_stopsDataSource, 0);
  objc_storeStrong((id *)&self->_boardingStopName, 0);
  objc_storeStrong((id *)&self->_selectedTripIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_scheduleWindowStartDate, 0);
  objc_storeStrong((id *)&self->_selectedTripDepartureDate, 0);
  objc_storeStrong((id *)&self->_routingParameters, 0);
  objc_storeStrong((id *)&self->_attribution, 0);

  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end