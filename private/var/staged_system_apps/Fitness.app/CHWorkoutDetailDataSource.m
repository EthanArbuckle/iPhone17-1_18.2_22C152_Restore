@interface CHWorkoutDetailDataSource
- (BOOL)_createRouteAndWeatherCellIfNeeded;
- (BOOL)_isExtendedMode;
- (BOOL)_shouldShowSplits;
- (BOOL)_showAveragePaceForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)burnBarExpanded;
- (BOOL)didSetInitialSwimmingPaceFormat;
- (BOOL)isSwimmingActivity;
- (BOOL)isTopLevelMultisport;
- (BOOL)isUnderwaterDive;
- (BOOL)segmentsExpanded;
- (BOOL)splitsExpanded;
- (BOOL)weatherOrLocationAvailableForWorkout;
- (BOOL)workoutIsFirstParty;
- (BOOL)workoutIsPoolSwim;
- (CHCatalogItemViewModel)catalogItemViewModel;
- (CHDivingDataCalculator)divingDataCalculator;
- (CHFitnessAppContext)fitnessAppContext;
- (CHScoreSummaryWrapper)scoreSummaryWrapper;
- (CHWorkoutDataCalculator)dataCalculator;
- (CHWorkoutDetailDataSource)initWithTableView:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6 model:(id)a7 fitnessAppContext:(id)a8 formattingManager:(id)a9 badgeImageFactory:(id)a10 achievementLocalizationProvider:(id)a11 awardsDataProvider:(id)a12 fiuiFormattingManager:(id)a13 showCurrentWorkloadButton:(BOOL)a14;
- (CHWorkoutDetailLocationFetcherObserver)locationFetcherObserver;
- (CHWorkoutDetailNavigationDelegate)delegate;
- (CHWorkoutFormattingManager)formattingManager;
- (CHWorkoutRouteMapGenerator)snapshotGenerator;
- (FIUIModel)model;
- (HKAnchoredObjectQuery)routeQuery;
- (HKHealthStore)healthStore;
- (HKKeyValueDomain)trackValueDomain;
- (HKLocationFetcher)locationFetcher;
- (HKLocationReadings)locationReadings;
- (HKWorkout)workout;
- (HKWorkoutActivity)workoutActivity;
- (NSArray)cellClassesBySection;
- (NSArray)indexPathsForSplitCells;
- (NSArray)tableSectionHeaders;
- (NSDictionary)swimmingSplitItems;
- (NSMutableArray)tableItemsBySection;
- (UIImage)routeImageForSharing;
- (UITableView)tableView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_createSubItemsForWorkoutMetrics;
- (id)_makeAppleWeatherFooterView;
- (id)_makeUltraModeFooterView;
- (id)_normalizeSubItemsArray:(id)a3;
- (id)analyticsHandler;
- (id)navigationActionForHeaderInSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)currentlySelectedSwimmingPaceFormat;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)trackDistanceUnit;
- (void)_createAwardSection;
- (void)_createBurnBarSection;
- (void)_createCatalogItemViewModelIfNeeded;
- (void)_createCustomSplits;
- (void)_createDiveSection;
- (void)_createDownhillRunsSection;
- (void)_createEffortSection;
- (void)_createGuidedRunMediaMomentsSection;
- (void)_createHeartRateSectionWithHeartRateReadings:(id)a3 averageHeartRate:(id)a4 recoveryHeartRateReadings:(id)a5;
- (void)_createIntervalsSection;
- (void)_createMultiSportSection;
- (void)_createNormalSplits;
- (void)_createPowerSectionWithPowerSamples:(id)a3;
- (void)_createRouteAndWeatherSection;
- (void)_createSegmentsSection;
- (void)_createSplitsSection;
- (void)_createSummarySection;
- (void)_createSwimSetsSection;
- (void)_createSwimSplits;
- (void)_createTableItems;
- (void)_createTrackLapsSection;
- (void)_createValuesSection;
- (void)_fetchBurnBarScoreSummary;
- (void)_fetchPreferredTrackDistanceUnit;
- (void)_handleDidUpdateDemoOverrideEffortValues;
- (void)_handleFitnessUnitPreferencesDidChange;
- (void)_handleLocations:(id)a3;
- (void)_insertBurnBarSection;
- (void)_insertDownhillRunsSection;
- (void)_insertGuidedRunMediaMomentsSection;
- (void)_insertHeartRateSection;
- (void)_insertHeartRateSubItem;
- (void)_insertIntervalsSection;
- (void)_insertMultiSportSection;
- (void)_insertPowerSection;
- (void)_insertSegmentsSection;
- (void)_insertSplitsSection;
- (void)_insertSwimSetsSection;
- (void)_insertTrackLapsSection;
- (void)_registerCellClasses;
- (void)_section:(int64_t)a3 setExpanded:(BOOL)a4;
- (void)_stopRouteQueryIfNecessary;
- (void)_updatePaceFormatForSets:(int64_t)a3;
- (void)_warmDataCalculatorCache;
- (void)dealloc;
- (void)didUpdateKeyValueDomain:(id)a3;
- (void)divingDataDidFinishLoading;
- (void)expandingHeaderView:(id)a3 didChangeExpanded:(BOOL)a4;
- (void)fetchLocations;
- (void)paceCell:(id)a3 didSelectNewPaceFormat:(int64_t)a4;
- (void)presentEffortViewController:(BOOL)a3 presentationCompletion:(id)a4;
- (void)presentPageForSection:(int64_t)a3;
- (void)setBurnBarExpanded:(BOOL)a3;
- (void)setCatalogItemViewModel:(id)a3;
- (void)setCellClassesBySection:(id)a3;
- (void)setCurrentlySelectedSwimmingPaceFormat:(int64_t)a3;
- (void)setDataCalculator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSetInitialSwimmingPaceFormat:(BOOL)a3;
- (void)setDivingDataCalculator:(id)a3;
- (void)setFitnessAppContext:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setIndexPathsForSplitCells:(id)a3;
- (void)setIsSwimmingActivity:(BOOL)a3;
- (void)setIsTopLevelMultisport:(BOOL)a3;
- (void)setIsUnderwaterDive:(BOOL)a3;
- (void)setLocationFetcher:(id)a3;
- (void)setLocationFetcherObserver:(id)a3;
- (void)setLocationReadings:(id)a3;
- (void)setModel:(id)a3;
- (void)setRouteImageForSharing:(id)a3;
- (void)setRouteQuery:(id)a3;
- (void)setScoreSummaryWrapper:(id)a3;
- (void)setSegmentsExpanded:(BOOL)a3;
- (void)setSnapshotGenerator:(id)a3;
- (void)setSplitsExpanded:(BOOL)a3;
- (void)setSwimmingSplitItems:(id)a3;
- (void)setTableItemsBySection:(id)a3;
- (void)setTableSectionHeaders:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTrackDistanceUnit:(unint64_t)a3;
- (void)setTrackValueDomain:(id)a3;
- (void)setWorkout:(id)a3;
- (void)setWorkoutActivity:(id)a3;
- (void)setWorkoutIsFirstParty:(BOOL)a3;
- (void)setWorkoutIsPoolSwim:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)updateSharingImage;
@end

@implementation CHWorkoutDetailDataSource

- (CHWorkoutDetailDataSource)initWithTableView:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6 model:(id)a7 fitnessAppContext:(id)a8 formattingManager:(id)a9 badgeImageFactory:(id)a10 achievementLocalizationProvider:(id)a11 awardsDataProvider:(id)a12 fiuiFormattingManager:(id)a13 showCurrentWorkloadButton:(BOOL)a14
{
  id v19 = a3;
  id v65 = a4;
  id v20 = a4;
  id v66 = a5;
  id v21 = a5;
  id v62 = a6;
  id v22 = a6;
  id v63 = a7;
  id v78 = a7;
  id v64 = a8;
  id v77 = a8;
  id v79 = a9;
  id v67 = a10;
  id v76 = a10;
  id v68 = a11;
  v23 = v20;
  id v75 = a11;
  id v69 = a12;
  id v74 = a12;
  id v73 = a13;
  v80.receiver = self;
  v80.super_class = (Class)CHWorkoutDetailDataSource;
  v24 = [(CHWorkoutDetailDataSource *)&v80 init];
  if (!v24) {
    goto LABEL_19;
  }
  id obj = v19;
  id v70 = v21;
  id v60 = v22;
  if ([v20 workoutActivityType] == (id)46)
  {
    v24->_char isSwimmingActivity = 1;
  }
  else
  {
    v25 = [v21 workoutConfiguration];
    v24->_char isSwimmingActivity = [v25 activityType] == (id)46;

    char isSwimmingActivity = v24->_isSwimmingActivity;
    if (!isSwimmingActivity)
    {
LABEL_7:
      v24->_workoutIsPoolSwim = isSwimmingActivity;
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v20, "fi_swimmingLocationType", v22, v62, a7, a8, v65, v66, a10, a11, a12) == (id)1)
  {
    char isSwimmingActivity = 1;
    goto LABEL_7;
  }
  v27 = [v21 workoutConfiguration];
  v24->_workoutIsPoolSwim = [v27 swimmingLocationType] == (id)1;

LABEL_9:
  v28 = [v20 sourceRevision:v60];
  v29 = [v28 source];
  unsigned __int8 v30 = [v29 _isAppleWatch];
  if ((v30 & 1) != 0 || ([v20 _isWatchWorkout] & 1) == 0)
  {
    v24->_workoutIsFirstParty = v30;
  }
  else
  {
    v31 = [v20 _source];
    v24->_workoutIsFirstParty = [v31 _hasFirstPartyBundleID];
  }
  v24->_isUnderwaterDive = [v20 workoutActivityType] == (id)84;
  objc_storeStrong((id *)&v24->_fiuiFormattingManager, a13);
  v24->_currentlySelectedSwimmingPaceFormat = 100;
  v24->_didSetInitialSwimmingPaceFormat = 0;
  id v32 = objc_storeWeak((id *)&v24->_tableView, obj);
  [obj setEstimatedRowHeight:44.0];

  id WeakRetained = objc_loadWeakRetained((id *)&v24->_tableView);
  [WeakRetained setRowHeight:UITableViewAutomaticDimension];

  id v34 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v34 setSectionHeaderTopPadding:0.0];

  objc_storeStrong((id *)&v24->_healthStore, v62);
  objc_storeStrong((id *)&v24->_formattingManager, a9);
  uint64_t v35 = [v79 dataCalculator];
  dataCalculator = v24->_dataCalculator;
  v24->_dataCalculator = (CHWorkoutDataCalculator *)v35;

  objc_storeStrong((id *)&v24->_model, v63);
  objc_storeStrong((id *)&v24->_fitnessAppContext, v64);
  objc_storeStrong((id *)&v24->_workout, v65);
  objc_storeStrong((id *)&v24->_workoutActivity, v66);
  unsigned __int8 v37 = [v20 isMultiSportWorkout];
  if (v70) {
    unsigned __int8 v38 = 0;
  }
  else {
    unsigned __int8 v38 = v37;
  }
  v24->_isTopLevelMultisport = v38;
  objc_storeStrong((id *)&v24->_badgeImageFactory, v67);
  objc_storeStrong((id *)&v24->_achievementLocalizationProvider, v68);
  objc_storeStrong((id *)&v24->_awardsDataProvider, v69);
  v39 = [(HKWorkout *)v24->_workout metadata];
  v40 = [v39 objectForKey:_HKPrivateMetadataKeyWorkoutExtendedMode];

  [v40 BOOLValue];
  v41 = [[CHWorkoutRouteMapGenerator alloc] initWithPathRendererClass:objc_opt_class()];
  snapshotGenerator = v24->_snapshotGenerator;
  v24->_snapshotGenerator = v41;

  if (v24->_isUnderwaterDive)
  {
    v43 = [[CHDivingDataCalculator alloc] initWithHealthStore:v24->_healthStore diveSession:v24->_workout formattingManager:v24->_fiuiFormattingManager];
    divingDataCalculator = v24->_divingDataCalculator;
    v24->_divingDataCalculator = v43;

    [(CHDivingDataCalculator *)v24->_divingDataCalculator setDelegate:v24];
  }
  id v45 = objc_alloc((Class)HKKeyValueDomain);
  v46 = (HKKeyValueDomain *)[v45 initWithCategory:0 domainName:kHKNanolifestylePreferencesDomain healthStore:v24->_healthStore];
  trackValueDomain = v24->_trackValueDomain;
  v24->_trackValueDomain = v46;

  [(HKKeyValueDomain *)v24->_trackValueDomain startObservation:v24];
  v24->_trackDistanceUnit = 1;
  [(CHWorkoutDetailDataSource *)v24 _fetchPreferredTrackDistanceUnit];
  [(CHWorkoutDetailDataSource *)v24 _registerCellClasses];
  [(CHWorkoutDetailDataSource *)v24 _createTableItems];
  [(CHWorkoutDetailDataSource *)v24 _createCatalogItemViewModelIfNeeded];
  id v48 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v48 setDataSource:v24];

  id v49 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v49 setDelegate:v24];

  id v50 = objc_alloc((Class)UIView);
  id v51 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v51 bounds];
  id v52 = [v50 initWithFrame:0.0, 0.0, CGRectGetWidth(v81), 0.0];
  id v53 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v53 setTableFooterView:v52];

  id v54 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v54 setAllowsSelection:1];

  id v55 = objc_loadWeakRetained((id *)&v24->_tableView);
  [v55 setSectionFooterHeight:0.0];

  v24->_showCurrentWorkloadButton = a14;
  [(CHWorkoutDetailDataSource *)v24 _warmDataCalculatorCache];
  v56 = +[NSNotificationCenter defaultCenter];
  [v56 addObserver:v24 selector:"_handleFitnessUnitPreferencesDidChange" name:kFIUIFitnessUnitPreferencesDidChangeNotification object:0];

  v57 = +[NSNotificationCenter defaultCenter];
  v58 = +[WOEffortBridges didUpdateDemoOverrideEffortValues];
  [v57 addObserver:v24 selector:"_handleDidUpdateDemoOverrideEffortValues" name:v58 object:0];

  id v19 = obj;
  id v21 = v70;
  id v22 = v61;
LABEL_19:

  return v24;
}

- (void)dealloc
{
  [(HKKeyValueDomain *)self->_trackValueDomain stopObservation:self];
  [(CHWorkoutDetailDataSource *)self _stopRouteQueryIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailDataSource;
  [(CHWorkoutDetailDataSource *)&v3 dealloc];
}

- (void)_createCatalogItemViewModelIfNeeded
{
  objc_super v3 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourCatalogItemDataProvider];
  unsigned int v4 = [v3 isSeymourWorkout:self->_workout];

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourCatalogItemDataProvider];
    workout = self->_workout;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10013580C;
    v7[3] = &unk_1008AD0B8;
    objc_copyWeak(&v8, &location);
    [v5 fetchCatalogItemViewModelForWorkout:workout completion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_fetchBurnBarScoreSummary
{
  objc_initWeak(&location, self);
  objc_super v3 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourCatalogItemDataProvider];
  workout = self->_workout;
  healthStore = self->_healthStore;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100135A20;
  v6[3] = &unk_1008AD0E0;
  objc_copyWeak(&v7, &location);
  [v3 fetchScoreSummaryForWorkout:workout healthStore:healthStore completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_fetchPreferredTrackDistanceUnit
{
  if ([(HKWorkout *)self->_workout supportsTrackWorkout])
  {
    trackValueDomain = self->_trackValueDomain;
    uint64_t v8 = 0;
    uint64_t v4 = [(HKKeyValueDomain *)trackValueDomain numberForKey:@"WOTrackWorkoutsUnit" error:&v8];
    v5 = (void *)v4;
    if (v8) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6) {
      [(CHWorkoutDetailDataSource *)self setTrackDistanceUnit:1];
    }
    if ([v5 intValue]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 3;
    }
    [(CHWorkoutDetailDataSource *)self setTrackDistanceUnit:v7];
  }
}

- (void)setCurrentlySelectedSwimmingPaceFormat:(int64_t)a3
{
  if (self->_currentlySelectedSwimmingPaceFormat != a3
    || ![(CHWorkoutDetailDataSource *)self didSetInitialSwimmingPaceFormat])
  {
    [(CHWorkoutDetailDataSource *)self setDidSetInitialSwimmingPaceFormat:1];
    v5 = [(CHWorkoutDetailDataSource *)self swimmingSplitItems];
    int v6 = dword_10096B4D8;

    if (v5 || v6 > 9)
    {
      dword_10096B4D8 = 0;
      self->_currentlySelectedSwimmingPaceFormat = a3;
      if ([(CHWorkoutDetailDataSource *)self segmentsExpanded]) {
        [(CHWorkoutDetailDataSource *)self _updatePaceFormatForSets:a3];
      }
      uint64_t v8 = [(CHWorkoutDetailDataSource *)self swimmingSplitItems];
      v9 = +[NSNumber numberWithInteger:self->_currentlySelectedSwimmingPaceFormat];
      id v24 = [(id)v8 objectForKeyedSubscript:v9];

      LOBYTE(v8) = [(CHWorkoutDetailDataSource *)self splitsExpanded];
      v10 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
      v11 = v10;
      if ((v8 & 1) != 0 || !v24)
      {
        v12 = [v10 objectAtIndexedSubscript:8];

        id v13 = objc_alloc_init((Class)NSMutableArray);
        id v14 = objc_alloc_init((Class)NSMutableArray);
        if ([v12 count])
        {
          unint64_t v15 = 0;
          do
          {
            v16 = +[NSIndexPath indexPathForRow:v15 inSection:8];
            [v13 addObject:v16];

            ++v15;
          }
          while (v15 < (unint64_t)[v12 count]);
        }
        if ([v24 count])
        {
          unint64_t v17 = 0;
          do
          {
            v18 = +[NSIndexPath indexPathForRow:v17 inSection:8];
            [v14 addObject:v18];

            ++v17;
          }
          while (v17 < (unint64_t)[v24 count]);
        }
        id v19 = [(CHWorkoutDetailDataSource *)self tableView];
        [v19 beginUpdates];

        id v20 = [(CHWorkoutDetailDataSource *)self tableView];
        [v20 deleteRowsAtIndexPaths:v13 withRowAnimation:3];

        if ([v24 count])
        {
          id v21 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
          [v21 setObject:v24 atIndexedSubscript:8];
        }
        id v22 = [(CHWorkoutDetailDataSource *)self tableView];
        [v22 insertRowsAtIndexPaths:v14 withRowAnimation:3];

        v23 = [(CHWorkoutDetailDataSource *)self tableView];
        [v23 endUpdates];
      }
      else
      {
        [v10 setObject:v24 atIndexedSubscript:8];
        v12 = v11;
      }
    }
    else
    {
      ++dword_10096B4D8;
      dispatch_time_t v7 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100135FAC;
      block[3] = &unk_1008AD108;
      block[4] = self;
      block[5] = a3;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updatePaceFormatForSets:(int64_t)a3
{
  uint64_t v4 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  v5 = [v4 objectAtIndexedSubscript:7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 paceFormatUpdatedBlock:v14];

        if (v12)
        {
          id v13 = [v11 paceFormatUpdatedBlock];
          v13[2](v13, a3);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_registerCellClasses
{
  uint64_t v3 = objc_opt_class();
  if (self->_isUnderwaterDive) {
    uint64_t v3 = objc_opt_class();
  }
  uint64_t v4 = v3;
  v23[0] = objc_opt_class();
  v23[1] = v4;
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  v23[7] = objc_opt_class();
  v23[8] = objc_opt_class();
  v23[9] = objc_opt_class();
  v23[10] = objc_opt_class();
  v23[11] = objc_opt_class();
  v23[12] = objc_opt_class();
  v23[13] = objc_opt_class();
  v23[14] = objc_opt_class();
  v23[15] = objc_opt_class();
  v23[16] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v23 count:17];
  [(CHWorkoutDetailDataSource *)self setCellClassesBySection:v5];

  id v6 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
  if ([v6 count] != (id)17) {
    sub_10071CCC0();
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(objc_class **)(*((void *)&v18 + 1) + 8 * (void)v11);
        id v13 = [(CHWorkoutDetailDataSource *)self tableView];
        long long v14 = NSStringFromClass(v12);
        [v13 registerClass:v12 forCellReuseIdentifier:v14];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v15 = objc_opt_class();
  long long v16 = +[ActivityTileSectionHeader reuseIdentifier];
  long long v17 = [(CHWorkoutDetailDataSource *)self tableView];
  [v17 registerClass:v15 forHeaderFooterViewReuseIdentifier:v16];
}

- (void)_warmDataCalculatorCache
{
  uint64_t v3 = [(CHWorkoutDetailDataSource *)self workout];
  if ([v3 workoutActivityType] == (id)37)
  {
  }
  else
  {
    uint64_t v4 = [(CHWorkoutDetailDataSource *)self workout];
    id v5 = [v4 workoutActivityType];

    if (v5 != (id)13) {
      return;
    }
  }
  id v6 = [(CHWorkoutDetailDataSource *)self dataCalculator];
  id v7 = [(CHWorkoutDetailDataSource *)self workout];
  [v6 cadenceSamplesForWorkout:v7 workoutActivity:0 completion:&stru_1008AD148];

  id v9 = [(CHWorkoutDetailDataSource *)self dataCalculator];
  id v8 = [(CHWorkoutDetailDataSource *)self workout];
  [v9 powerSamplesForWorkout:v8 workoutActivity:0 completion:&stru_1008AD168];
}

- (void)_handleFitnessUnitPreferencesDidChange
{
  [(CHWorkoutDetailDataSource *)self _createValuesSection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained reloadData];
}

- (void)_handleDidUpdateDemoOverrideEffortValues
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  v2 = +[NSIndexSet indexSetWithIndex:2];
  [v3 reloadSections:v2 withRowAnimation:5];
}

- (void)didUpdateKeyValueDomain:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136650;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_createTableItems
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(CHWorkoutDetailDataSource *)self setTableItemsBySection:v3];

  uint64_t v4 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
      [v7 addObject:&__NSArray0__struct];

      ++v6;
      id v8 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
      id v9 = [v8 count];
    }
    while ((unint64_t)v9 > v6);
  }
  v43 = +[NSNull null];
  v44[0] = v43;
  uint64_t v10 = +[NSBundle mainBundle];
  v42 = v10;
  if (self->_isUnderwaterDive) {
    CFStringRef v11 = @"UNDERWATER_DIVING_DETAILS";
  }
  else {
    CFStringRef v11 = @"WORKOUT_DETAILS_TITLE";
  }
  v41 = [v10 localizedStringForKey:v11 value:&stru_1008D8AB8 table:@"Localizable"];
  v44[1] = v41;
  v40 = +[NSNull null];
  v44[2] = v40;
  v39 = +[NSNull null];
  v44[3] = v39;
  unsigned __int8 v38 = +[NSNull null];
  v44[4] = v38;
  unsigned __int8 v37 = +[NSBundle mainBundle];
  v36 = [v37 localizedStringForKey:@"WORKOUT_INTERVAL_HEADER_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[5] = v36;
  uint64_t v35 = +[NSBundle mainBundle];
  id v34 = [v35 localizedStringForKey:@"WORKOUT_LAPS_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[6] = v34;
  v33 = +[NSBundle mainBundle];
  id v32 = [v33 localizedStringForKey:@"WORKOUT_AUTO_SETS_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[7] = v32;
  v31 = +[NSBundle mainBundle];
  unsigned __int8 v30 = [v31 localizedStringForKey:@"WORKOUT_SPLITS_HEADER_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[8] = v30;
  v29 = +[NSBundle mainBundle];
  v28 = [v29 localizedStringForKey:@"WORKOUT_DOWNHILL_RUNS_HEADER_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[9] = v28;
  v27 = +[NSBundle mainBundle];
  v26 = [v27 localizedStringForKey:@"WORKOUT_SEGMENT_HEADER_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[10] = v26;
  v25 = +[NSBundle bundleForClass:objc_opt_class()];
  id v24 = [v25 localizedStringForKey:@"BURN_BAR" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  v44[11] = v24;
  v23 = +[NSBundle mainBundle];
  id v22 = [v23 localizedStringForKey:@"WORKOUT_HEART_RATE_PAGE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[12] = v22;
  v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"WORKOUT_POWER_PAGE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[13] = v13;
  long long v14 = +[NSBundle mainBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"WORKOUT_ROUTE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[14] = v15;
  long long v16 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v17 = [v16 localizedStringForKey:@"MEDIA_MOMENTS_IMAGES" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  v44[15] = v17;
  long long v18 = +[NSBundle mainBundle];
  long long v19 = [v18 localizedStringForKey:@"AWARDS" value:&stru_1008D8AB8 table:@"Localizable"];
  v44[16] = v19;
  long long v20 = +[NSArray arrayWithObjects:v44 count:17];
  [(CHWorkoutDetailDataSource *)self setTableSectionHeaders:v20];

  long long v21 = [(CHWorkoutDetailDataSource *)self tableSectionHeaders];
  if ([v21 count] != (id)17) {
    sub_10071CCEC();
  }

  [(CHWorkoutDetailDataSource *)self _createSummarySection];
  [(CHWorkoutDetailDataSource *)self _createMultiSportSection];
  if (self->_isUnderwaterDive) {
    [(CHWorkoutDetailDataSource *)self _createDiveSection];
  }
  else {
    [(CHWorkoutDetailDataSource *)self _createValuesSection];
  }
  if (!self->_isTopLevelMultisport)
  {
    [(CHWorkoutDetailDataSource *)self _createEffortSection];
    [(CHWorkoutDetailDataSource *)self _createIntervalsSection];
    [(CHWorkoutDetailDataSource *)self _createTrackLapsSection];
    [(CHWorkoutDetailDataSource *)self _createSplitsSection];
    [(CHWorkoutDetailDataSource *)self _createDownhillRunsSection];
    [(CHWorkoutDetailDataSource *)self _createSegmentsSection];
    [(CHWorkoutDetailDataSource *)self _createSwimSetsSection];
    [(CHWorkoutDetailDataSource *)self _createRouteAndWeatherSection];
  }
  [(CHWorkoutDetailDataSource *)self _createAwardSection];
}

- (void)_createSummarySection
{
  id v3 = objc_alloc_init(_CHWorkoutDetailSummaryLocationItem);
  uint64_t v4 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
  -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", [v4 objectAtIndexedSubscript:0]);

  uint64_t v15 = v3;
  id v5 = +[NSArray arrayWithObjects:&v15 count:1];
  unint64_t v6 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  [v6 setObject:v5 atIndexedSubscript:0];

  if ([(CHWorkoutDetailDataSource *)self workoutIsPoolSwim])
  {
    id v7 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    id v8 = [(CHWorkoutDetailDataSource *)self workout];
    id v9 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100136E9C;
    v13[3] = &unk_1008AD190;
    uint64_t v10 = (id *)&v14;
    long long v14 = v3;
    [v7 swimDistanceByStrokeStyleForWorkout:v8 workoutActivity:v9 completion:v13];
LABEL_5:

    goto LABEL_6;
  }
  if ([(CHWorkoutDetailDataSource *)self isSwimmingActivity])
  {
    id v7 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    id v8 = [(CHWorkoutDetailDataSource *)self workout];
    id v9 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100136F48;
    v11[3] = &unk_1008AD190;
    uint64_t v10 = (id *)&v12;
    v12 = v3;
    [v7 openWaterSwimDistanceByStrokeStyleForWorkout:v8 workoutActivity:v9 completion:v11];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_createMultiSportSection
{
  if (self->_isTopLevelMultisport)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [(HKWorkout *)self->_workout workoutActivities];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
          uint64_t v10 = objc_alloc_init(_CHWorkoutDetailMultiSportTableItem);
          CFStringRef v11 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
          -[_CHWorkoutDetailTableItem setCellClass:](v10, "setCellClass:", [v11 objectAtIndexedSubscript:4]);

          [(_CHWorkoutDetailMultiSportTableItem *)v10 setWorkoutActivity:v9];
          [v3 addObject:v10];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    v12 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    [v12 setObject:v3 atIndexedSubscript:4];

    [(CHWorkoutDetailDataSource *)self _insertMultiSportSection];
  }
}

- (void)_createValuesSection
{
  id v15 = [(CHWorkoutDetailDataSource *)self _createSubItemsForWorkoutMetrics];
  unint64_t v3 = (unint64_t)[v15 count];
  unint64_t v4 = ((unint64_t)[v15 count] & 1) + (v3 >> 1);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (v4)
  {
    uint64_t v6 = 0;
    do
    {
      if (v4 == 1)
      {
        BOOL v7 = ((unint64_t)[v15 count] & 1) == 0;
        id v8 = v15;
        if (v7) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 1;
        }
      }
      else
      {
        uint64_t v9 = 2;
        id v8 = v15;
      }
      uint64_t v10 = [v8 subarrayWithRange:v6, v9];
      CFStringRef v11 = objc_alloc_init(_CHWorkoutDetailTableItem);
      v12 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
      -[_CHWorkoutDetailTableItem setCellClass:](v11, "setCellClass:", [v12 objectAtIndexedSubscript:1]);

      long long v13 = +[NSArray arrayWithArray:v10];
      [(_CHWorkoutDetailTableItem *)v11 setSubItems:v13];

      [v5 addObject:v11];
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  long long v14 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  [v14 setObject:v5 atIndexedSubscript:1];
}

- (void)_createEffortSection
{
  if (!self->_isUnderwaterDive && (FIIsTinkerVegaOrFitnessJunior() & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      unint64_t v3 = objc_alloc_init(_CHWorkoutDetailEffortItem);
      unint64_t v4 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
      -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", [v4 objectAtIndexedSubscript:2]);

      [(_CHWorkoutDetailEffortItem *)v3 setEffortQuantity:0];
      BOOL v7 = v3;
      id v5 = +[NSArray arrayWithObjects:&v7 count:1];
      uint64_t v6 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
      [v6 setObject:v5 atIndexedSubscript:2];
    }
  }
}

- (void)_createDiveSection
{
  uint64_t v6 = objc_alloc_init(_CHWorkoutDetailTableItem);
  [(_CHWorkoutDetailTableItem *)v6 setCellClass:objc_opt_class()];
  [(_CHWorkoutDetailTableItem *)v6 setSubItems:&__NSArray0__struct];
  int v3 = 3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  do
  {
    [v4 addObject:v6];
    --v3;
  }
  while (v3);
  id v5 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  [v5 setObject:v4 atIndexedSubscript:1];
}

- (void)_createTrackLapsSection
{
  int v3 = [(CHWorkoutDetailDataSource *)self workout];
  unsigned int v4 = [v3 supportsTrackWorkout];

  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    uint64_t v6 = [(CHWorkoutDetailDataSource *)self workout];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100137604;
    v7[3] = &unk_1008AD1E0;
    objc_copyWeak(v8, &location);
    v8[1] = (id)6;
    [v5 trackLapsForWorkout:v6 completion:v7];

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_shouldShowSplits
{
  int v3 = [(CHWorkoutDetailDataSource *)self formattingManager];
  unsigned int v4 = [(CHWorkoutDetailDataSource *)self workout];
  id v5 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  unsigned __int8 v6 = [v3 supportsPaceForWorkout:v4 workoutActivity:v5];

  return v6;
}

- (void)_createSplitsSection
{
  if ([(CHWorkoutDetailDataSource *)self _shouldShowSplits])
  {
    if ([(CHWorkoutDetailDataSource *)self isSwimmingActivity])
    {
      [(CHWorkoutDetailDataSource *)self _createSwimSplits];
    }
    else
    {
      int v3 = [(CHWorkoutDetailDataSource *)self workout];
      unsigned int v4 = [v3 fiui_workoutCustomSplits];
      id v5 = [v4 count];

      if (v5)
      {
        [(CHWorkoutDetailDataSource *)self _createCustomSplits];
      }
      else
      {
        [(CHWorkoutDetailDataSource *)self _createNormalSplits];
      }
    }
  }
}

- (void)_createNormalSplits
{
  objc_initWeak(&location, self);
  int v3 = [(HKWorkout *)self->_workout fiui_activityType];
  unsigned int v4 = [(CHWorkoutDetailDataSource *)self dataCalculator];
  id v5 = [(CHWorkoutDetailDataSource *)self workout];
  unsigned __int8 v6 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = sub_100137B84;
  v8[3] = &unk_1008AD230;
  objc_copyWeak(v10, &location);
  id v7 = v3;
  id v9 = v7;
  v10[1] = (id)8;
  [v4 splitsForWorkout:v5 workoutActivity:v6 completion:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_createCustomSplits
{
  objc_initWeak(&location, self);
  int v3 = [(HKWorkout *)self->_workout fiui_activityType];
  unsigned int v4 = [(CHWorkoutDetailDataSource *)self dataCalculator];
  id v5 = [(CHWorkoutDetailDataSource *)self workout];
  unsigned __int8 v6 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = sub_100138078;
  v8[3] = &unk_1008AD230;
  objc_copyWeak(v10, &location);
  id v7 = v3;
  id v9 = v7;
  v10[1] = (id)8;
  [v4 customSplitsForWorkout:v5 workoutActivity:v6 completion:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_createSwimSplits
{
  objc_initWeak(&location, self);
  int v3 = [(CHWorkoutDetailDataSource *)self dataCalculator];
  unsigned int v4 = [(CHWorkoutDetailDataSource *)self workout];
  id v5 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013853C;
  v6[3] = &unk_1008AD280;
  objc_copyWeak(v7, &location);
  v7[1] = (id)8;
  [v3 swimmingSplitsForWorkout:v4 workoutActivity:v5 completion:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_createSegmentsSection
{
  if (![(CHWorkoutDetailDataSource *)self workoutIsPoolSwim])
  {
    if ([(CHWorkoutDetailDataSource *)self workoutIsFirstParty])
    {
      objc_initWeak(&location, self);
      int v3 = [(CHWorkoutDetailDataSource *)self dataCalculator];
      unsigned int v4 = [(CHWorkoutDetailDataSource *)self workout];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100138B08;
      v5[3] = &unk_1008AD1E0;
      objc_copyWeak(v6, &location);
      v6[1] = (id)10;
      [v3 segmentsForWorkout:v4 completion:v5];

      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_createDownhillRunsSection
{
  int v3 = [(CHWorkoutDetailDataSource *)self workout];
  unsigned int v4 = [v3 fiui_activityType];
  unsigned int v5 = [v4 bridge_isDownhillSnowSport];

  if (v5)
  {
    objc_initWeak(&location, self);
    unsigned __int8 v6 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    id v7 = [(CHWorkoutDetailDataSource *)self workout];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_100138EF4;
    v8[3] = &unk_1008AD1E0;
    objc_copyWeak(v9, &location);
    v9[1] = (id)9;
    [v6 downhillRunsForWorkout:v7 completion:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)_createIntervalsSection
{
  int v3 = [(CHWorkoutDetailDataSource *)self workout];
  unsigned int v4 = [v3 isIntervalWorkout];

  if (v4)
  {
    objc_initWeak(&location, self);
    unsigned int v5 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    unsigned __int8 v6 = [(CHWorkoutDetailDataSource *)self workout];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v7[2] = sub_1001393A8;
    v7[3] = &unk_1008AD1E0;
    objc_copyWeak(v8, &location);
    v8[1] = (id)5;
    [v5 intervalsForWorkout:v6 completion:v7];

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (void)_createSwimSetsSection
{
  if ([(CHWorkoutDetailDataSource *)self workoutIsPoolSwim]
    && [(CHWorkoutDetailDataSource *)self workoutIsFirstParty])
  {
    int v3 = [(CHWorkoutDetailDataSource *)self workout];
    if ([v3 isIntervalWorkout])
    {
      unsigned __int8 v4 = sub_1001785C4();

      if ((v4 & 1) == 0) {
        return;
      }
    }
    else
    {
    }
    objc_initWeak(&location, self);
    unsigned int v5 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    unsigned __int8 v6 = [(CHWorkoutDetailDataSource *)self workout];
    id v7 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_1001397C4;
    v8[3] = &unk_1008AD1E0;
    objc_copyWeak(v9, &location);
    v9[1] = (id)7;
    [v5 swimmingSetsForWorkout:v6 workoutActivity:v7 completion:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)_createBurnBarSection
{
  if ([(CHCatalogItemViewModel *)self->_catalogItemViewModel isSeymourPairedWorkout])
  {
    int v3 = objc_alloc_init(_CHWorkoutDetailBurnBarTableItem);
    unsigned __int8 v4 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
    -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", [v4 objectAtIndexedSubscript:11]);

    id v7 = v3;
    unsigned int v5 = +[NSArray arrayWithObjects:&v7 count:1];
    unsigned __int8 v6 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    [v6 setObject:v5 atIndexedSubscript:11];

    [(CHWorkoutDetailDataSource *)self _insertBurnBarSection];
  }
}

- (void)_createHeartRateSectionWithHeartRateReadings:(id)a3 averageHeartRate:(id)a4 recoveryHeartRateReadings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    CFStringRef v11 = objc_alloc_init(_CHWorkoutDetailHeartRateTableItem);
    v12 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
    -[_CHWorkoutDetailTableItem setCellClass:](v11, "setCellClass:", [v12 objectAtIndexedSubscript:12]);

    [(_CHWorkoutDetailHeartRateTableItem *)v11 setHeartRateReadings:v8];
    [(_CHWorkoutDetailHeartRateTableItem *)v11 setAverageHeartRate:v9];
    [(_CHWorkoutDetailHeartRateTableItem *)v11 setRecoveryHeartRateReadings:v10];
    id v15 = v11;
    long long v13 = +[NSArray arrayWithObjects:&v15 count:1];
    long long v14 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    [v14 setObject:v13 atIndexedSubscript:12];

    [(CHWorkoutDetailDataSource *)self _insertHeartRateSection];
  }
}

- (void)_createRouteAndWeatherSection
{
  [(CHWorkoutDetailDataSource *)self _stopRouteQueryIfNecessary];
  id v3 = objc_alloc((Class)HKLocationFetcher);
  unsigned __int8 v4 = [(CHWorkoutDetailDataSource *)self model];
  unsigned int v5 = [v4 healthStore];
  id v6 = [v3 initWithHealthStore:v5];
  [(CHWorkoutDetailDataSource *)self setLocationFetcher:v6];

  objc_initWeak(&location, self);
  _HKInitializeLogging();
  id v7 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[routes] Setting up route query", buf, 2u);
  }
  id v8 = [(CHWorkoutDetailDataSource *)self formattingManager];
  id v9 = [(CHWorkoutDetailDataSource *)self workout];
  id v10 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  CFStringRef v11 = [v8 locationForWorkout:v9 workoutActivity:v10];

  if (v11)
  {
    _HKInitializeLogging();
    v12 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[routes] Using location from metadata as route placeholder", buf, 2u);
    }
    long long v13 = [(CHWorkoutDetailDataSource *)self locationFetcher];
    long long v14 = [v13 shifter];
    v33 = v11;
    id v15 = +[NSArray arrayWithObjects:&v33 count:1];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10013A0D4;
    v29[3] = &unk_1008ABD40;
    objc_copyWeak(&v30, &location);
    [v14 shiftLocations:v15 withCompletion:v29];

    objc_destroyWeak(&v30);
  }
  else
  {
    _HKInitializeLogging();
    long long v16 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[routes] No location found in the metadata, no placeholder to display", buf, 2u);
    }
  }
  id v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10013A24C;
  v27 = &unk_1008AD348;
  objc_copyWeak(&v28, &location);
  long long v17 = objc_retainBlock(&v24);
  id v18 = objc_alloc((Class)HKAnchoredObjectQuery);
  long long v19 = +[HKSeriesType workoutRouteType];
  long long v20 = +[HKQuery predicateForObjectsFromWorkout:self->_workout];
  long long v21 = (HKAnchoredObjectQuery *)[v18 initWithType:v19 predicate:v20 anchor:0 limit:0 resultsHandler:v17];
  routeQuery = self->_routeQuery;
  self->_routeQuery = v21;

  [(HKAnchoredObjectQuery *)self->_routeQuery setUpdateHandler:v17];
  _HKInitializeLogging();
  v23 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[routes] Starting anchored route query", buf, 2u);
  }
  [(HKHealthStore *)self->_healthStore executeQuery:self->_routeQuery];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_stopRouteQueryIfNecessary
{
  if (self->_routeQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    routeQuery = self->_routeQuery;
    self->_routeQuery = 0;
  }
}

- (void)fetchLocations
{
  objc_initWeak(&location, self);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10013A584;
  long long v13 = &unk_1008AD370;
  objc_copyWeak(&v14, &location);
  id v3 = objc_retainBlock(&v10);
  unsigned __int8 v4 = [(CHWorkoutDetailDataSource *)self workoutActivity];

  if (v4)
  {
    unsigned int v5 = [(CHWorkoutDetailDataSource *)self locationFetcher];
    id v6 = [(CHWorkoutDetailDataSource *)self workout];
    id v7 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    [v5 fetchLocationsFromWorkout:v6 workoutActivity:v7 samplesHandler:v3];
  }
  else
  {
    id v8 = [(CHWorkoutDetailDataSource *)self workout];
    id v9 = [v8 metadata];
    unsigned int v5 = [v9 objectForKey:_HKPrivateMetadataKeyWorkoutExtendedMode];

    LODWORD(v9) = [v5 BOOLValue];
    id v6 = [(CHWorkoutDetailDataSource *)self locationFetcher];
    id v7 = [(CHWorkoutDetailDataSource *)self workout];
    [v6 fetchLocationsFromWorkout:v7 applyThreshold:v9 ^ 1 withSamplesHandler:v3];
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_createAwardSection
{
  if (AAUIShouldUseNewTrophyCase())
  {
    awardsDataProvider = self->_awardsDataProvider;
    unsigned __int8 v4 = [(HKWorkout *)self->_workout UUID];
    unsigned int v5 = [v4 UUIDString];
    id v6 = [(CHAwardsDataProvider *)awardsDataProvider achievementsForWorkoutIdentifier:v5];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v12);
        id v14 = objc_alloc_init(_CHWorkoutDetailAwardItem);
        -[_CHWorkoutDetailAwardItem setAchievement:](v14, "setAchievement:", v13, (void)v17);
        id v15 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
        -[_CHWorkoutDetailTableItem setCellClass:](v14, "setCellClass:", [v15 objectAtIndexedSubscript:16]);

        [v7 addObject:v14];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  long long v16 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  [v16 setObject:v7 atIndexedSubscript:16];
}

- (void)_createGuidedRunMediaMomentsSection
{
  if ([(CHCatalogItemViewModel *)self->_catalogItemViewModel isSeymourGuidedRunWorkout])
  {
    id v3 = objc_alloc_init(_CHWorkoutDetailGuidedRunMediaMomentsTableItem);
    unsigned __int8 v4 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
    -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", [v4 objectAtIndexedSubscript:15]);

    id v7 = v3;
    unsigned int v5 = +[NSArray arrayWithObjects:&v7 count:1];
    id v6 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    [v6 setObject:v5 atIndexedSubscript:15];

    [(CHWorkoutDetailDataSource *)self _insertGuidedRunMediaMomentsSection];
  }
}

- (BOOL)_createRouteAndWeatherCellIfNeeded
{
  if (self->_isTopLevelMultisport) {
    return 0;
  }
  unsigned __int8 v4 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  unsigned int v5 = [v4 objectAtIndexedSubscript:14];
  id v6 = [v5 firstObject];

  BOOL v2 = v6 == 0;
  if (!v6)
  {
    id v6 = objc_alloc_init(_CHWorkoutDetailRouteAndWeatherItem);
    id v7 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
    -[_CHWorkoutDetailTableItem setCellClass:](v6, "setCellClass:", [v7 objectAtIndexedSubscript:14]);

    uint64_t v11 = v6;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    id v9 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    [v9 setObject:v8 atIndexedSubscript:14];
  }
  return v2;
}

- (void)_handleLocations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ([v4 count] == (id)1
      && ([(CHWorkoutDetailDataSource *)self locationReadings],
          unsigned int v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = (uint64_t)[v5 count],
          v5,
          v6 >= 1))
    {
      _HKInitializeLogging();
      id v7 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        id v8 = "[routes] Discarding location updates that would wipe out known good data.";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v29, 2u);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v9 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        int v29 = 134217984;
        id v30 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[routes] Storing %li locations", (uint8_t *)&v29, 0xCu);
      }
      [(CHWorkoutDetailDataSource *)self setLocationReadings:v4];
      uint64_t v11 = [(CHWorkoutDetailDataSource *)self delegate];
      v12 = [v11 presentedViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 topViewController];
        if ([v13 conformsToProtocol:&OBJC_PROTOCOL____TtP10FitnessApp40LocationReadingsUpdateableViewController_])[v13 updateLocationReadings:v4]; {
      }
        }
      [(CHWorkoutDetailDataSource *)self updateSharingImage];
      id v14 = [v4 firstObject];
      id v15 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
      long long v16 = [v15 objectAtIndexedSubscript:0];
      long long v17 = [v16 firstObject];

      [v17 setFirstCoordinate:v14];
      long long v18 = [v17 firstCoordinateUpdatedBlock];

      if (v18)
      {
        long long v19 = [v17 firstCoordinateUpdatedBlock];
        ((void (**)(void, void *))v19)[2](v19, v14);
      }
      if ([(CHWorkoutDetailDataSource *)self _createRouteAndWeatherCellIfNeeded]) {
        uint64_t v20 = 3;
      }
      else {
        uint64_t v20 = 0;
      }
      long long v21 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
      id v22 = [v21 objectAtIndexedSubscript:14];
      v23 = [v22 firstObject];

      id v24 = [(CHWorkoutDetailDataSource *)self locationReadings];
      [v23 setLocationReadings:v24];

      uint64_t v25 = [(CHWorkoutDetailDataSource *)self tableView];
      [v25 beginUpdates];

      v26 = [(CHWorkoutDetailDataSource *)self tableView];
      v27 = +[NSIndexSet indexSetWithIndex:14];
      [v26 reloadSections:v27 withRowAnimation:v20];

      id v28 = [(CHWorkoutDetailDataSource *)self tableView];
      [v28 endUpdates];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      id v8 = "[routes] Discarding empty location update.";
      goto LABEL_20;
    }
  }
}

- (void)updateSharingImage
{
  id v3 = [(CHWorkoutDetailDataSource *)self workout];
  if ([v3 workoutActivityType] == (id)84) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = 2;
  }

  unsigned int v5 = [(CHWorkoutDetailDataSource *)self locationReadings];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= v4)
  {
    objc_initWeak(&location, self);
    snapshotGenerator = self->_snapshotGenerator;
    id v8 = [(CHWorkoutDetailDataSource *)self locationReadings];
    [(CHWorkoutRouteMapGenerator *)snapshotGenerator setLocationReadings:v8];

    id v9 = +[UITraitCollection traitCollectionWithTraits:&stru_1008AD3B0];
    id v10 = self->_snapshotGenerator;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10013B0F4;
    v11[3] = &unk_1008AD3D8;
    objc_copyWeak(&v12, &location);
    -[CHWorkoutRouteMapGenerator snapshotWithSize:lineWidth:traitCollection:insets:completion:](v10, "snapshotWithSize:lineWidth:traitCollection:insets:completion:", v9, v11, 270.0, 240.0, 3.0, 16.0, 80.0, 125.0, 24.0);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

- (id)_createSubItemsForWorkoutMetrics
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(location, self);
  unint64_t v4 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  unsigned int v5 = [v4 fiui_activityType];
  id v6 = v5;
  if (v5)
  {
    id v232 = v5;
  }
  else
  {
    id v7 = [(CHWorkoutDetailDataSource *)self workout];
    [v7 fiui_activityType];
    id v232 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = [(CHWorkoutDetailDataSource *)self formattingManager];
  id v9 = [(CHWorkoutDetailDataSource *)self workout];
  unsigned int v10 = [v8 workoutHasGoalCompletionEvent:v9];

  if (v10)
  {
    uint64_t v11 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    id v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"WORKOUT_PACER_RESULT_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutDetailTableSubItem *)v11 setTitleString:v13];

    id v14 = [(CHWorkoutDetailDataSource *)self formattingManager];
    id v15 = [(CHWorkoutDetailDataSource *)self workout];
    long long v16 = [v14 formattedGoalCompletedDurationForWorkout:v15 context:@"WorkoutsListDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v11 setValueAttrString:v16];

    [v3 addObject:v11];
    long long v17 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    [v3 addObject:v17];
  }
  else
  {
    long long v18 = [(CHWorkoutDetailDataSource *)self workout];
    unsigned int v19 = [v18 shouldShowRaceResults];

    if (!v19) {
      goto LABEL_9;
    }
    uint64_t v11 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    uint64_t v20 = +[NSBundle mainBundle];
    long long v21 = [v20 localizedStringForKey:@"WORKOUT_RACE_TIME" value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutDetailTableSubItem *)v11 setTitleString:v21];

    id v22 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v23 = [(CHWorkoutDetailDataSource *)self workout];
    id v24 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    uint64_t v25 = [v22 formattedRaceTimeForWorkout:v23 workoutActivity:v24 context:@"WorkoutDetailDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v11 setValueAttrString:v25];

    [v3 addObject:v11];
    long long v17 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"WORKOUT_RACE_PACE" value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutDetailTableSubItem *)v17 setTitleString:v27];

    id v28 = [(CHWorkoutDetailDataSource *)self workout];
    int v29 = [v28 metadata];
    id v30 = +[HKWorkout kRaceWorkoutAveragePaceOnRouteMetadataKey];
    v31 = [v29 valueForKey:v30];

    id v32 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v33 = [(CHWorkoutDetailDataSource *)self workout];
    id v34 = [v32 formattedRacePaceOrSpeedForWorkout:v33 metersPerSecond:v31 context:@"WorkoutsListDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v17 setValueAttrString:v34];

    [v3 addObject:v17];
  }

LABEL_9:
  v235 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
  uint64_t v35 = +[NSBundle mainBundle];
  v36 = [v35 localizedStringForKey:@"WORKOUT_TIME_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(_CHWorkoutDetailTableSubItem *)v235 setTitleString:v36];

  unsigned __int8 v37 = [(CHWorkoutDetailDataSource *)self formattingManager];
  unsigned __int8 v38 = [(CHWorkoutDetailDataSource *)self workout];
  v39 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  v40 = [v37 formattedDurationForWorkout:v38 workoutActivity:v39 context:@"WorkoutDetailDisplayContext"];
  [(_CHWorkoutDetailTableSubItem *)v235 setValueAttrString:v40];

  [v3 addObject:v235];
  v234 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
  v41 = +[NSBundle mainBundle];
  v42 = [v41 localizedStringForKey:@"WORKOUT_ELAPSED_TIME_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(_CHWorkoutDetailTableSubItem *)v234 setTitleString:v42];

  v43 = [(CHWorkoutDetailDataSource *)self formattingManager];
  uint64_t v44 = [(CHWorkoutDetailDataSource *)self workout];
  id v45 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  v46 = [v43 formattedElapsedTimeForWorkout:v44 workoutActivity:v45 context:@"WorkoutDetailDisplayContext"];
  [(_CHWorkoutDetailTableSubItem *)v234 setValueAttrString:v46];

  v47 = [(_CHWorkoutDetailTableSubItem *)v235 valueAttrString];
  id v48 = [(_CHWorkoutDetailTableSubItem *)v234 valueAttrString];
  LOBYTE(v44) = [v47 isEqualToAttributedString:v48];

  if ((v44 & 1) == 0) {
    [v3 addObject:v234];
  }
  v233 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
  id v49 = [(CHWorkoutDetailDataSource *)self formattingManager];
  id v50 = [(CHWorkoutDetailDataSource *)self workout];
  id v51 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  unsigned int v52 = [v49 shouldShowDistanceForWorkout:v50 workoutActivity:v51];

  if (v52)
  {
    if (objc_msgSend(v232, "bridge_isDownhillSnowSport"))
    {
      id v53 = +[NSBundle mainBundle];
      [v53 localizedStringForKey:@"WORKOUT_RUN_DISTANCE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
    }
    else
    {
      id v53 = +[NSBundle mainBundle];
      [v53 localizedStringForKey:@"WORKOUT_DISTANCE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
    id v54 = };
    [(_CHWorkoutDetailTableSubItem *)v233 setTitleString:v54];

    id WeakRetained = objc_loadWeakRetained(location);
    v56 = [WeakRetained formattingManager];
    v57 = [(CHWorkoutDetailDataSource *)self workout];
    v58 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v59 = [v56 formattedDistanceForWorkout:v57 workoutActivity:v58 context:@"WorkoutDetailDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v233 setValueAttrString:v59];

    if ((objc_msgSend(v232, "bridge_isDownhillSnowSport") & 1) == 0) {
      [v3 addObject:v233];
    }
  }
  if ([(HKWorkout *)self->_workout _activityMoveMode] != (id)2)
  {
    id v60 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v61 = +[NSBundle mainBundle];
    id v62 = [(CHWorkoutDetailDataSource *)self formattingManager];
    id v63 = [v62 fitnessUIFormattingManager];
    id v64 = [v63 localizationKeyForEnergyBaseKey:@"WORKOUT_ACTIVE_ENERGY_TITLE"];
    id v65 = [v61 localizedStringForKey:v64 value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutDetailTableSubItem *)v60 setTitleString:v65];

    id v66 = [(CHWorkoutDetailDataSource *)self formattingManager];
    id v67 = [(CHWorkoutDetailDataSource *)self workout];
    id v68 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    id v69 = [v66 formattedActiveEnergyForWorkout:v67 workoutActivity:v68 context:@"WorkoutDetailDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v60 setValueAttrString:v69];

    [v3 addObject:v60];
    id v70 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v71 = +[NSBundle mainBundle];
    v72 = [(CHWorkoutDetailDataSource *)self formattingManager];
    id v73 = [v72 fitnessUIFormattingManager];
    id v74 = [v73 localizationKeyForEnergyBaseKey:@"WORKOUT_TOTAL_ENERGY_TITLE"];
    id v75 = [v71 localizedStringForKey:v74 value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutDetailTableSubItem *)v70 setTitleString:v75];

    id v76 = [(CHWorkoutDetailDataSource *)self formattingManager];
    id v77 = [(CHWorkoutDetailDataSource *)self workout];
    id v78 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    id v79 = [v76 formattedTotalEnergyForWorkout:v77 workoutActivity:v78 context:@"WorkoutDetailDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v70 setValueAttrString:v79];

    [v3 addObject:v70];
  }
  if (self->_isTopLevelMultisport)
  {
    objc_super v80 = [(CHWorkoutDetailDataSource *)self _normalizeSubItemsArray:v3];
  }
  else
  {
    CGRect v81 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v82 = [(CHWorkoutDetailDataSource *)self workout];
    v83 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v84 = [v81 supportsElevationAscendedForWorkout:v82 workoutActivity:v83];

    if (v84)
    {
      v85 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v86 = [(CHWorkoutDetailDataSource *)self workout];
      v87 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      unsigned int v88 = [v85 hasElevationAscendedDataForWorkout:v86 workoutActivity:v87];

      if (v88)
      {
        v89 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
        v90 = +[NSBundle mainBundle];
        v91 = [v90 localizedStringForKey:@"WORKOUT_ELEVATION_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
        [(_CHWorkoutDetailTableSubItem *)v89 setTitleString:v91];

        v92 = [(CHWorkoutDetailDataSource *)self formattingManager];
        v93 = [(CHWorkoutDetailDataSource *)self workout];
        v94 = [(CHWorkoutDetailDataSource *)self workoutActivity];
        v95 = [v92 formattedElevationGainForWorkout:v93 workoutActivity:v94 context:@"WorkoutDetailDisplayContext"];
        [(_CHWorkoutDetailTableSubItem *)v89 setValueAttrString:v95];

        v96 = [(_CHWorkoutDetailTableSubItem *)v89 valueAttrString];

        if (v96) {
          [v3 addObject:v89];
        }
      }
    }
    v97 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v98 = [(CHWorkoutDetailDataSource *)self workout];
    v99 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v100 = [v97 hasAveragePowerForWorkout:v98 workoutActivity:v99];

    if (v100)
    {
      v101 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v102 = +[NSBundle mainBundle];
      v103 = [v102 localizedStringForKey:@"WORKOUT_AVERAGE_POWER_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      [(_CHWorkoutDetailTableSubItem *)v101 setTitleString:v103];

      v104 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v105 = [(CHWorkoutDetailDataSource *)self workout];
      v106 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v107 = [v104 formattedAveragePowerForWorkout:v105 workoutActivity:v106 context:@"WorkoutDetailDisplayContext"];
      [(_CHWorkoutDetailTableSubItem *)v101 setValueAttrString:v107];

      [v3 addObject:v101];
    }
    v108 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v109 = [(CHWorkoutDetailDataSource *)self workout];
    v110 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v111 = [v108 hasStepCountForWorkout:v109 workoutActivity:v110];

    if (v111)
    {
      v112 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v113 = +[NSBundle mainBundle];
      v114 = [v113 localizedStringForKey:@"WORKOUT_STEP_COUNT_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      [(_CHWorkoutDetailTableSubItem *)v112 setTitleString:v114];

      v115 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v116 = [(CHWorkoutDetailDataSource *)self workout];
      v117 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v118 = [v115 formattedStepCountForWorkout:v116 workoutActivity:v117 context:@"WorkoutDetailDisplayContext"];
      [(_CHWorkoutDetailTableSubItem *)v112 setValueAttrString:v118];

      [v3 addObject:v112];
    }
    v119 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v120 = [(CHWorkoutDetailDataSource *)self workout];
    v121 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v122 = [v119 hasFlightsClimbedForWorkout:v120 workoutActivity:v121];

    if (v122)
    {
      v123 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v124 = +[NSBundle mainBundle];
      v125 = [v124 localizedStringForKey:@"WORKOUT_FLIGHTS_CLIMBED_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      [(_CHWorkoutDetailTableSubItem *)v123 setTitleString:v125];

      v126 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v127 = [(CHWorkoutDetailDataSource *)self workout];
      v128 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v129 = [v126 formattedFlightsClimbedForWorkout:v127 workoutActivity:v128 context:@"WorkoutDetailDisplayContext"];
      [(_CHWorkoutDetailTableSubItem *)v123 setValueAttrString:v129];

      [v3 addObject:v123];
    }
    v130 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v131 = [(CHWorkoutDetailDataSource *)self workout];
    v132 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v133 = [v130 hasAverageCadenceForWorkout:v131 workoutActivity:v132];

    if (v133)
    {
      v134 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v135 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v136 = [v135 fiui_activityType];
      v137 = v136;
      if (v136)
      {
        id v138 = v136;
      }
      else
      {
        v139 = [(CHWorkoutDetailDataSource *)self workout];
        [v139 fiui_activityType];
        id v138 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v138 effectiveTypeIdentifier];
      if (FIUIIsWorkoutTypePedestrianActivity())
      {
        v140 = +[NSBundle mainBundle];
        [v140 localizedStringForKey:@"WORKOUT_AVERAGE_CADENCE_TITLE_PEDOMETER" value:&stru_1008D8AB8 table:@"Localizable"];
      }
      else
      {
        v140 = +[NSBundle mainBundle];
        [v140 localizedStringForKey:@"WORKOUT_AVERAGE_CADENCE_TITLE_CYCLING" value:&stru_1008D8AB8 table:@"Localizable"];
      v141 = };
      [(_CHWorkoutDetailTableSubItem *)v134 setTitleString:v141];

      v142 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v143 = [(CHWorkoutDetailDataSource *)self workout];
      v144 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v145 = [v142 formattedAverageCadenceForWorkout:v143 workoutActivity:v144 context:@"WorkoutDetailDisplayContext"];
      [(_CHWorkoutDetailTableSubItem *)v134 setValueAttrString:v145];

      [v3 addObject:v134];
    }
    v146 = [(CHWorkoutDetailDataSource *)self workout];
    v147 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v148 = [(CHWorkoutDetailDataSource *)self _showAveragePaceForWorkout:v146 workoutActivity:v147];

    if (v148)
    {
      v149 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v150 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      if (v150) {
        [(CHWorkoutDetailDataSource *)self workoutActivity];
      }
      else {
      v151 = [(CHWorkoutDetailDataSource *)self workout];
      }
      v152 = [v151 fiui_activityType];
      FIUIDistanceTypeForActivityType();

      if (FIUIPaceFormatForDistanceType() == 4)
      {
        v153 = +[NSBundle mainBundle];
        [v153 localizedStringForKey:@"WORKOUT_SPEED_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      }
      else
      {
        v153 = +[NSBundle mainBundle];
        [v153 localizedStringForKey:@"WORKOUT_PACE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      v154 = };
      [(_CHWorkoutDetailTableSubItem *)v149 setTitleString:v154];

      if ([(CHWorkoutDetailDataSource *)self isSwimmingActivity])
      {
        v155 = [(CHWorkoutDetailDataSource *)self dataCalculator];
        v156 = [(CHWorkoutDetailDataSource *)self workout];
        v157 = [(CHWorkoutDetailDataSource *)self workoutActivity];
        v240[0] = _NSConcreteStackBlock;
        v240[1] = 3221225472;
        v240[2] = sub_10013CD9C;
        v240[3] = &unk_1008AD400;
        v241 = v149;
        v242 = self;
        [v155 swimmingPacePerHundredForWorkout:v156 workoutActivity:v157 completion:v240];

        v158 = v241;
      }
      else
      {
        v158 = [(CHWorkoutDetailDataSource *)self formattingManager];
        v159 = [(CHWorkoutDetailDataSource *)self workout];
        v160 = [(CHWorkoutDetailDataSource *)self workoutActivity];
        v161 = [v158 formattedPaceOrSpeedForWorkout:v159 workoutActivity:v160 context:@"WorkoutDetailDisplayContext"];
        [(_CHWorkoutDetailTableSubItem *)v149 setValueAttrString:v161];
      }
      [v3 addObject:v149];
    }
    if (!self->_isUnderwaterDive)
    {
      v162 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v163 = +[NSBundle mainBundle];
      v164 = [v163 localizedStringForKey:@"WORKOUT_HEART_RATE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      [(_CHWorkoutDetailTableSubItem *)v162 setTitleString:v164];

      v165 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v166 = [v165 formattedHeartRate:0 context:@"WorkoutDetailDisplayContext"];
      [(_CHWorkoutDetailTableSubItem *)v162 setValueAttrString:v166];

      v167 = [(CHWorkoutDetailDataSource *)self dataCalculator];
      v168 = [(CHWorkoutDetailDataSource *)self workout];
      v169 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v170 = [v167 averageHeartRateForWorkout:v168 workoutActivity:v169];

      v237[0] = _NSConcreteStackBlock;
      v237[1] = 3221225472;
      v237[2] = sub_10013CE94;
      v237[3] = &unk_1008AD428;
      BOOL v239 = v170 != 0;
      objc_copyWeak(&v238, location);
      v171 = objc_retainBlock(v237);
      v172 = [(CHWorkoutDetailDataSource *)self dataCalculator];
      v173 = [(CHWorkoutDetailDataSource *)self workout];
      v174 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      [v172 heartRateDataForWorkout:v173 workoutActivity:v174 completion:v171];

      if (v170)
      {
        id v175 = objc_loadWeakRetained(location);
        v176 = [v175 formattingManager];
        v177 = [v176 formattedHeartRate:v170 context:@"WorkoutDetailDisplayContext"];
        [(_CHWorkoutDetailTableSubItem *)v162 setValueAttrString:v177];

        [v3 addObject:v162];
      }

      objc_destroyWeak(&v238);
    }
    v178 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    v179 = [(CHWorkoutDetailDataSource *)self workout];
    v180 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v236[0] = _NSConcreteStackBlock;
    v236[1] = 3221225472;
    v236[2] = sub_10013CF78;
    v236[3] = &unk_1008AD450;
    v236[4] = self;
    [v178 powerSamplesForWorkout:v179 workoutActivity:v180 completion:v236];

    v181 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v182 = +[NSBundle mainBundle];
    v183 = [v182 localizedStringForKey:@"WORKOUT_LAPS_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutDetailTableSubItem *)v181 setTitleString:v183];

    if ([(CHWorkoutDetailDataSource *)self isSwimmingActivity])
    {
      v184 = FIUIBundle();
      v185 = [v184 localizedStringForKey:@"SUMMARY_NUMBER_OF_LAPS" value:&stru_1008D8AB8 table:@"Localizable-Ariel"];
      [(_CHWorkoutDetailTableSubItem *)v181 setTitleString:v185];
    }
    v186 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v187 = [(CHWorkoutDetailDataSource *)self workout];
    v188 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v189 = [v186 formattedLapCountForWorkout:v187 workoutActivity:v188 context:@"WorkoutDetailDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v181 setValueAttrString:v189];

    v190 = [(_CHWorkoutDetailTableSubItem *)v181 valueAttrString];

    if (v190) {
      [v3 addObject:v181];
    }
    v191 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v192 = FIUIBundle();
    v193 = [v192 localizedStringForKey:@"SUMMARY_LAP_LENGTH" value:&stru_1008D8AB8 table:@"Localizable-Ariel"];
    [(_CHWorkoutDetailTableSubItem *)v191 setTitleString:v193];

    v194 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v195 = [(CHWorkoutDetailDataSource *)self workout];
    v196 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v197 = [v194 formattedPoolLengthForWorkout:v195 workoutActivity:v196 context:@"WorkoutDetailDisplayContext"];
    [(_CHWorkoutDetailTableSubItem *)v191 setValueAttrString:v197];

    v198 = [(_CHWorkoutDetailTableSubItem *)v191 valueAttrString];

    if (v198) {
      [v3 addObject:v191];
    }
    v199 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v200 = [(CHWorkoutDetailDataSource *)self workout];
    v201 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v202 = [v199 supportsDownhillRunsCountForWorkout:v200 workoutActivity:v201];

    if (v202)
    {
      v203 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v204 = +[NSBundle mainBundle];
      v205 = [v204 localizedStringForKey:@"WORKOUT_DOWNHILL_RUNS_HEADER_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      [(_CHWorkoutDetailTableSubItem *)v203 setTitleString:v205];

      v206 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v207 = [(CHWorkoutDetailDataSource *)self workout];
      v208 = [v207 downhillRunEventsBridge];
      v209 = [v206 formattedDownhillRunsCount:[v208 count] context:@"WorkoutDetailDisplayContext"];
      [(_CHWorkoutDetailTableSubItem *)v203 setValueAttrString:v209];

      v210 = [(_CHWorkoutDetailTableSubItem *)v203 valueAttrString];

      if (v210) {
        [v3 addObject:v203];
      }
    }
    v211 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v212 = [(CHWorkoutDetailDataSource *)self workout];
    v213 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    if ([v211 shouldShowDistanceForWorkout:v212 workoutActivity:v213])
    {
      unsigned int v214 = [v232 bridge_isDownhillSnowSport];

      if (v214) {
        [v3 addObject:v233];
      }
    }
    else
    {
    }
    v215 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v216 = [(CHWorkoutDetailDataSource *)self workout];
    v217 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    unsigned int v218 = [v215 supportsElevationDescendedForWorkout:v216 workoutActivity:v217];

    if (v218)
    {
      v219 = [(CHWorkoutDetailDataSource *)self dataCalculator];
      v220 = [(CHWorkoutDetailDataSource *)self workout];
      v221 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      v222 = [v219 cachedDownhillRunsForWorkout:v220 workoutActivity:v221];

      if (v222)
      {
        v223 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
        v224 = +[NSBundle mainBundle];
        v225 = [v224 localizedStringForKey:@"WORKOUT_TOTAL_ELEVATION_DESCENDED_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
        [(_CHWorkoutDetailTableSubItem *)v223 setTitleString:v225];

        v226 = [[CHWorkoutDownhillRunsStats alloc] initWithDownhillRunBridges:v222];
        v227 = [(CHWorkoutDownhillRunsStats *)v226 elevationDescended];
        v228 = [(CHWorkoutDetailDataSource *)self formattingManager];
        v229 = [v228 formattedElevation:v227 context:@"WorkoutDetailDisplayContext"];
        [(_CHWorkoutDetailTableSubItem *)v223 setValueAttrString:v229];

        v230 = [(_CHWorkoutDetailTableSubItem *)v223 valueAttrString];

        if (v230) {
          [v3 addObject:v223];
        }
      }
    }
    objc_super v80 = [(CHWorkoutDetailDataSource *)self _normalizeSubItemsArray:v3];
  }
  objc_destroyWeak(location);

  return v80;
}

- (BOOL)_showAveragePaceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CHWorkoutDetailDataSource *)self formattingManager];
  unsigned int v9 = [v8 isIndoorCyclingForWorkout:v6 workoutActivity:v7];

  unsigned int v10 = [(CHWorkoutDetailDataSource *)self formattingManager];
  unsigned int v11 = [v10 hasAverageCyclingSpeedForWorkout:v6 workoutActivity:v7];

  if (!v9 || v11)
  {
    uint64_t v13 = [v7 fiui_activityType];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      [v6 fiui_activityType];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v16 = v15;

    if (objc_msgSend(v16, "bridge_isDownhillSnowSport"))
    {
      unsigned __int8 v12 = 0;
    }
    else
    {
      long long v17 = [(CHWorkoutDetailDataSource *)self formattingManager];
      unsigned __int8 v12 = [v17 supportsPaceForWorkout:v6 workoutActivity:v7];
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)_createPowerSectionWithPowerSamples:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CHWorkoutDetailDataSource *)self formattingManager];
  id v6 = [(CHWorkoutDetailDataSource *)self workout];
  id v7 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  if (![(_CHWorkoutDetailPowerTableItem *)v5 hasAverageCyclingPowerForWorkout:v6 workoutActivity:v7])
  {

    goto LABEL_5;
  }
  id v8 = [v4 count];

  if (v8)
  {
    unsigned int v5 = objc_alloc_init(_CHWorkoutDetailPowerTableItem);
    unsigned int v9 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
    -[_CHWorkoutDetailTableItem setCellClass:](v5, "setCellClass:", [v9 objectAtIndexedSubscript:13]);

    [(_CHWorkoutDetailPowerTableItem *)v5 setPowerSamples:v4];
    unsigned __int8 v12 = v5;
    unsigned int v10 = +[NSArray arrayWithObjects:&v12 count:1];
    unsigned int v11 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    [v11 setObject:v10 atIndexedSubscript:13];

    [(CHWorkoutDetailDataSource *)self _insertPowerSection];
LABEL_5:
  }
}

- (id)_normalizeSubItemsArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v13 = sub_1000FC0A8();
        if (self->_isTopLevelMultisport || self->_isSwimmingActivity) {
          double v13 = v13 + sub_1000FC040();
        }
        if (v9)
        {
          if (objc_msgSend(v12, "_fitsWidth:", v13, (void)v19))
          {
            [v5 addObject:v12];
          }
          else
          {
            id v15 = +[_CHWorkoutDetailTableSubItem _emptyItem];
            [v5 addObject:v15];

            [v5 addObject:v12];
            long long v16 = +[_CHWorkoutDetailTableSubItem _emptyItem];
            [v5 addObject:v16];

            v9 += 2;
          }
        }
        else
        {
          [v5 addObject:v12];
          if (([v12 _fitsWidth:v13] & 1) == 0)
          {
            id v14 = +[_CHWorkoutDetailTableSubItem _emptyItem];
            [v5 addObject:v14];

            ++v9;
          }
        }
        ++v9;
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v17 = +[NSArray arrayWithArray:v5];

  return v17;
}

- (id)_makeUltraModeFooterView
{
  id v2 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"WORKOUT_DETAIL_ULTRA_MODE_FOOTER_TEXT" value:&stru_1008D8AB8 table:@"Localizable"];
  id v5 = [v2 textLabel];
  [v5 setText:v4];

  id v6 = [v2 textLabel];
  [v6 setNumberOfLines:0];

  id v7 = [v2 textLabel];
  [v7 setLineBreakMode:0];

  id v8 = +[UIFont defaultFontForTextStyle:UIFontTextStyleFootnote];
  uint64_t v9 = [v2 textLabel];
  [v9 setFont:v8];

  uint64_t v10 = +[UIColor tertiaryLabelColor];
  unsigned int v11 = [v2 textLabel];
  [v11 setTextColor:v10];

  return v2;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  uint64_t isKindOfClass = (uint64_t)a4;
  uint64_t v8 = isKindOfClass;
  if (a5 == 1)
  {
    id v14 = (id)isKindOfClass;
    uint64_t isKindOfClass = [(CHWorkoutDetailDataSource *)self _isExtendedMode];
    uint64_t v8 = (uint64_t)v14;
    if (isKindOfClass)
    {
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v8 = (uint64_t)v14;
      if (isKindOfClass)
      {
        id v9 = v14;
        uint64_t v10 = +[UIFont defaultFontForTextStyle:UIFontTextStyleFootnote];
        unsigned int v11 = [v9 textLabel];
        [v11 setFont:v10];

        unsigned __int8 v12 = +[UIColor tertiaryLabelColor];
        double v13 = [v9 textLabel];

        [v13 setTextColor:v12];
        uint64_t v8 = (uint64_t)v14;
      }
    }
  }

  _objc_release_x1(isKindOfClass, v8);
}

- (id)_makeAppleWeatherFooterView
{
  if (self->_isTopLevelMultisport) {
    id v2 = 0;
  }
  else {
    id v2 = objc_alloc_init(CHWorkoutDetailAppleWeatherFooterView);
  }

  return v2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  id v7 = [v6 count];
  return (int64_t)v7;
}

- (id)analyticsHandler
{
  id v3 = +[CHWorkoutDetailAnalyticsTracker sharedInstance];
  id v4 = [(CHWorkoutDetailDataSource *)self workout];
  id v5 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  id v6 = [v3 workoutAnalyticsHandlerFor:v4 workoutActivity:v5];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  id v9 = [v8 objectAtIndexedSubscript:[v7 section]];
  uint64_t v10 = [v9 objectAtIndexedSubscript:[v7 row]];

  unsigned int v11 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  unsigned __int8 v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  double v13 = (char *)[v12 count];
  id v14 = (char *)[v7 row];

  id v15 = NSStringFromClass((Class)[v10 cellClass]);
  long long v16 = [v6 dequeueReusableCellWithIdentifier:v15];

  id v17 = [v10 cellClass];
  if (v17 == (id)objc_opt_class())
  {
    id v37 = v16;
    v41 = [(CHWorkoutDetailDataSource *)self workout];
    v42 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    [v37 summaryConfigureWithWorkout:v41 workoutActivity:v42 fitnessAppContext:self->_fitnessAppContext catalogItemViewModel:self->_catalogItemViewModel formattingManager:self->_formattingManager resizeBlock:0];

    v43 = [v37 location];

    if (!v43)
    {
      id v44 = v10;
      id v45 = [v44 firstCoordinate];
      [v37 setLocation:v45];

      v46 = [v44 firstCoordinate];

      if (!v46)
      {
        v191[0] = _NSConcreteStackBlock;
        v191[1] = 3221225472;
        v191[2] = sub_10013EB2C;
        v191[3] = &unk_1008AD478;
        id v192 = v37;
        id v193 = v6;
        [v44 setFirstCoordinateUpdatedBlock:v191];
      }
    }
    if ([(CHWorkoutDetailDataSource *)self isSwimmingActivity])
    {
      id v47 = v10;
      id v48 = [v47 swimDistanceByStrokeStyle];
      [v37 setSwimDistanceByStrokeStyle:v48];

      v188[0] = _NSConcreteStackBlock;
      v188[1] = 3221225472;
      v188[2] = sub_10013EBF8;
      v188[3] = &unk_1008AD4A0;
      id v189 = v37;
      id v190 = v6;
      [v47 setSwimDistanceByStrokeStyleUpdateBlock:v188];
    }
    goto LABEL_36;
  }
  id v18 = [v10 cellClass];
  if (v18 == (id)objc_opt_class())
  {
    [v16 configureWithDive:self->_workout row:[v7 row] dataCalculator:self->_divingDataCalculator];
    goto LABEL_37;
  }
  long long v19 = v13 - 1;
  id v20 = [v10 cellClass];
  if (v20 == (id)objc_opt_class())
  {
    [v16 setHidesSeparator:v19 == v14];
    if (self->_isTopLevelMultisport || self->_isSwimmingActivity) {
      [v16 removeLeadingPadding];
    }
    id v49 = [v10 subItems];
    id v50 = [v49 count];

    if (v50)
    {
      id v51 = [v10 subItems];
      unsigned int v52 = [v51 objectAtIndexedSubscript:0];

      id v53 = [v52 titleString];
      id v54 = [v52 valueAttrString];
      [v16 configureWithTitle1:v53 value1:v54];
      v185[0] = _NSConcreteStackBlock;
      v185[1] = 3221225472;
      v185[2] = sub_10013EC40;
      v185[3] = &unk_1008AD4C8;
      id v186 = v16;
      id v187 = v53;
      id v55 = v53;
      [v52 setUpdateBlock:v185];
    }
    v56 = [v10 subItems];
    id v57 = [v56 count];

    if ((unint64_t)v57 < 2) {
      goto LABEL_37;
    }
    v58 = [v10 subItems];
    v59 = [v58 objectAtIndexedSubscript:1];

    id v60 = [v59 titleString];
    v61 = [v59 valueAttrString];
    [v16 configureWithTitle2:v60 value2:v61];
    v182[0] = _NSConcreteStackBlock;
    v182[1] = 3221225472;
    v182[2] = sub_10013EC50;
    v182[3] = &unk_1008AD4C8;
    id v183 = v16;
    id v184 = v60;
    id v62 = v60;
    [v59 setUpdateBlock:v182];

LABEL_34:
    goto LABEL_37;
  }
  id v21 = [v10 cellClass];
  if (v21 == (id)objc_opt_class())
  {
    id v37 = v16;
    id v63 = [(CHWorkoutDetailDataSource *)self formattingManager];
    [v37 setFormattingManager:v63];

    [v37 setSelectedPaceFormat:[self currentlySelectedSwimmingPaceFormat]];
    id v64 = [(CHWorkoutDetailDataSource *)self workout];
    id v65 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    id v66 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    [v37 configureWithWorkout:v64 workoutActivity:v65 dataCalculator:v66];

    [v37 setPaceSelectionDelegate:self];
LABEL_36:

    goto LABEL_37;
  }
  id v22 = [v10 cellClass];
  if (v22 == (id)objc_opt_class())
  {
    id v68 = v16;
    id v69 = v10;
    id v70 = [(CHWorkoutDetailDataSource *)self workout];
    v71 = [v69 workoutActivity];

    v72 = [(CHWorkoutDetailDataSource *)self formattingManager];
    [v72 fitnessUIFormattingManager];
    v170 = v16;
    v74 = id v73 = v6;
    id v75 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    [v68 configureWithWorkout:v70 workoutActivity:v71 formattingManager:v74 dataCalculator:v75];

    id v6 = v73;
    long long v16 = v170;

    id v76 = [(CHWorkoutDetailDataSource *)self delegate];
    [v68 setNavigationDelegate:v76];

    goto LABEL_37;
  }
  id v23 = [v10 cellClass];
  id v178 = v6;
  if (v23 == (id)objc_opt_class())
  {
    id v77 = v10;
    id v78 = [v77 split];

    if (v78)
    {
      BOOL v165 = v19 == v14;
      id v79 = [(CHWorkoutDetailDataSource *)self workout];
      v171 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      objc_super v80 = [v77 unit];
      [v77 split];
      v82 = CGRect v81 = v77;
      id v161 = [v81 splitIndex];
      [v81 expectedSplitDistance];
      double v84 = v83;
      v85 = [(CHWorkoutDetailDataSource *)self dataCalculator];
      v86 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v87 = [v86 fitnessUIFormattingManager];
      [v16 configureWithWorkout:v79 workoutActivity:v171 unit:v80 split:v82 splitIndex:v161 splitDistance:v165 isLastCell:v84 dataCalculator:v85 formattingManager:v87];

      id v77 = v81;
    }
    else
    {
      v99 = [v77 swimmingSplit];

      if (!v99)
      {
        v125 = [(CHWorkoutDetailDataSource *)self workoutActivity];
        v126 = [v125 fiui_activityType];
        v127 = v126;
        if (v126)
        {
          id v128 = v126;
        }
        else
        {
          v134 = [(CHWorkoutDetailDataSource *)self workout];
          [v134 fiui_activityType];
          id v128 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v79 = v128;
        [v16 configureHeaderWithActivityType:v128];
        goto LABEL_50;
      }
      BOOL v100 = v19 == v14;
      id v79 = [v77 swimmingSplit];
      id v101 = [v77 splitIndex];
      v102 = [(CHWorkoutDetailDataSource *)self formattingManager];
      v103 = [v102 fitnessUIFormattingManager];
      [v16 configureWithSwimmingSplit:v79 splitIndex:v101 isLastCell:v100 formattingManager:v103];
    }
    id v6 = v178;
LABEL_50:

    goto LABEL_51;
  }
  id v24 = [v10 cellClass];
  if (v24 == (id)objc_opt_class())
  {
    BOOL v172 = v19 == v14;
    id v88 = v10;
    uint64_t v166 = [v88 segment];
    id v162 = [v88 segmentIndex];

    v89 = [(CHWorkoutDetailDataSource *)self workout];
    unint64_t v160 = [(CHWorkoutDetailDataSource *)self trackDistanceUnit];
    v90 = [(CHWorkoutDetailDataSource *)self workout];
    v91 = [v90 fiui_activityType];
    v92 = [(CHWorkoutDetailDataSource *)self workout];
    id v93 = [v92 _activityMoveMode];
    v94 = [(CHWorkoutDetailDataSource *)self formattingManager];
    LOBYTE(v159) = v172;
    v95 = (void *)v166;
    [v16 configureWithSegment:v166 segmentIndex:v162 workout:v89 trackDistanceUnit:v160 activityType:v91 activityMoveMode:v93 isLastCell:v159 formattingManager:v94];

LABEL_46:
LABEL_57:
    id v6 = v178;
    goto LABEL_37;
  }
  id v25 = [v10 cellClass];
  if (v25 == (id)objc_opt_class())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v95 = [v10 downhillRunsStats];
      v96 = [(CHWorkoutDetailDataSource *)self workout];
      v97 = [v96 fiui_activityType];
      v98 = [(CHWorkoutDetailDataSource *)self formattingManager];
      [v16 configureWithDownhillRunsStats:v95 activityType:v97 formattingManager:v98];

      goto LABEL_46;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_37;
    }
    BOOL v112 = v19 == v14;
    id v113 = v10;
    id v77 = [v113 downhillRun];
    id v114 = [v113 downhillRunIndex];

    v115 = [(CHWorkoutDetailDataSource *)self workout];
    v116 = [v115 fiui_activityType];
    v117 = [(CHWorkoutDetailDataSource *)self formattingManager];
    [v16 configureWithDownhillRun:v77 downhillRunIndex:v114 activityType:v116 isLastCell:v112 formattingManager:v117];

LABEL_51:
    goto LABEL_37;
  }
  id v26 = [v10 cellClass];
  if (v26 == (id)objc_opt_class())
  {
    BOOL v173 = v19 == v14;
    id v104 = v10;
    v105 = [v104 interval];
    id v167 = [v104 intervalIndex];

    v106 = [(CHWorkoutDetailDataSource *)self workout];
    v107 = [(CHWorkoutDetailDataSource *)self workout];
    v108 = [v107 fiui_activityType];
    v109 = [(CHWorkoutDetailDataSource *)self workout];
    id v110 = [v109 _activityMoveMode];
    unsigned int v111 = [(CHWorkoutDetailDataSource *)self formattingManager];
    [v16 configureWithInterval:v105 index:v167 workout:v106 activityType:v108 activityMoveMode:v110 isLastCell:v173 formattingManager:v111];

LABEL_56:
    goto LABEL_57;
  }
  id v27 = [v10 cellClass];
  if (v27 == (id)objc_opt_class())
  {
    BOOL v174 = v19 == v14;
    id v118 = v10;
    v105 = [v118 trackLap];
    id v168 = [v118 lapIndex];
    v119 = [(CHWorkoutDetailDataSource *)self workout];
    id v163 = [v118 distanceUnit];

    v120 = [(CHWorkoutDetailDataSource *)self workout];
    v121 = [v120 fiui_activityType];
    unsigned int v122 = [(CHWorkoutDetailDataSource *)self workout];
    id v123 = [v122 _activityMoveMode];
    v124 = [(CHWorkoutDetailDataSource *)self formattingManager];
    LOBYTE(v159) = v174;
    [v16 configureWithTrackLap:v105 lapIndex:v168 workout:v119 distanceUnit:v163 activityType:v121 activityMoveMode:v123 isLastCell:v159 formattingManager:v124];

    goto LABEL_56;
  }
  id v28 = [v10 cellClass];
  if (v28 == (id)objc_opt_class())
  {
    BOOL v129 = v19 == v14;
    v130 = [v10 set];
    id v131 = [v7 row];
    v132 = [(CHWorkoutDetailDataSource *)self formattingManager];
    unsigned int v133 = [v132 fitnessUIFormattingManager];
    [v16 configureWithSwimmingSet:v130 index:v131 isLastCell:v129 formattingManager:v133];

    goto LABEL_57;
  }
  id v29 = [v10 cellClass];
  if (v29 == (id)objc_opt_class())
  {
    [v16 configureWithFitnessAppContext:self->_fitnessAppContext workout:self->_workout scoreSummaryWrapper:self->_scoreSummaryWrapper];
    goto LABEL_37;
  }
  id v30 = [v10 cellClass];
  if (v30 == (id)objc_opt_class())
  {
    id v135 = v16;
    id v136 = v10;
    uint64_t v175 = [(CHWorkoutDetailDataSource *)self workout];
    v169 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    uint64_t v137 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    v164 = [(CHWorkoutDetailDataSource *)self formattingManager];
    id v138 = [v136 heartRateReadings];
    v139 = [v136 averageHeartRate];

    v140 = [(CHWorkoutDetailDataSource *)self delegate];
    v59 = (void *)v175;
    v141 = (void *)v137;
    [v135 configureWithWorkout:v175 workoutActivity:v169 dataCalculator:v137 formattingManager:v164 heartRateReadings:v138 averageHeartRate:v139 parent:v140];

    id v6 = v178;
    goto LABEL_34;
  }
  id v31 = [v10 cellClass];
  if (v31 == (id)objc_opt_class())
  {
    id v142 = v16;
    id v143 = v10;
    uint64_t v176 = [(CHWorkoutDetailDataSource *)self workout];
    v144 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v145 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    v146 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v147 = [v143 powerSamples];

    unsigned int v148 = [(CHWorkoutDetailDataSource *)self delegate];
    v149 = (void *)v176;
    [v142 configureWithWorkout:v176 workoutActivity:v144 dataCalculator:v145 formattingManager:v146 powerSamples:v147 parent:v148];

    id v6 = v178;
  }
  else
  {
    id v32 = [v10 cellClass];
    if (v32 != (id)objc_opt_class())
    {
      id v33 = [v10 cellClass];
      if (v33 == (id)objc_opt_class())
      {
        id v37 = v16;
        [v37 configureWithWorkout:self->_workout fitnessAppContext:self->_fitnessAppContext];
        objc_initWeak(&location, self);
        v179[0] = _NSConcreteStackBlock;
        v179[1] = 3221225472;
        v179[2] = sub_10013EC60;
        v179[3] = &unk_1008AD4F0;
        objc_copyWeak(&v180, &location);
        [v37 setOnDidTapMediaMomentItem:v179];
        objc_destroyWeak(&v180);
        objc_destroyWeak(&location);
      }
      else
      {
        id v34 = [v10 cellClass];
        if (v34 == (id)objc_opt_class())
        {
          id v158 = v16;
          id v37 = [v10 achievement];
          [v158 configureForAchievement:v37 badgeImageFactory:self->_badgeImageFactory localizationProvider:self->_achievementLocalizationProvider];
        }
        else
        {
          id v35 = [v10 cellClass];
          if (v35 != (id)objc_opt_class()) {
            goto LABEL_37;
          }
          id v36 = v16;
          id v37 = [(CHWorkoutDetailDataSource *)self workout];
          unsigned __int8 v38 = [(CHWorkoutDetailDataSource *)self workoutActivity];
          v39 = [(CHWorkoutDetailDataSource *)self dataCalculator];
          v40 = [(CHWorkoutDetailDataSource *)self delegate];
          [v36 configureWithWorkout:v37 workoutActivity:v38 dataCalculator:v39 parent:v40];
        }
      }
      goto LABEL_36;
    }
    id v150 = v16;
    id v151 = v10;
    v152 = [(CHWorkoutDetailDataSource *)self delegate];
    [v150 setNavigationDelegate:v152];

    v153 = [(CHWorkoutDetailDataSource *)self analyticsHandler];
    [v150 setAnalyticsHandler:v153];

    v149 = [(CHWorkoutDetailDataSource *)self workout];
    uint64_t v177 = [(CHWorkoutDetailDataSource *)self workoutActivity];
    v154 = [(CHWorkoutDetailDataSource *)self dataCalculator];
    v155 = [(CHWorkoutDetailDataSource *)self formattingManager];
    v156 = [(CHWorkoutDetailDataSource *)self delegate];
    v157 = [v151 locationReadings];

    v144 = (void *)v177;
    [v150 configureWithWorkout:v149 workoutActivity:v177 dataCalculator:v154 formattingManager:v155 parent:v156 locationReadings:v157];

    id v6 = v178;
  }

LABEL_37:

  return v16;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CHWorkoutDetailDataSource *)self cellClassesBySection];
  id v7 = [v6 objectAtIndexedSubscript:[v5 section]];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(CHWorkoutDetailDataSource *)self workout];
    [v7 preferredHeightForWorkout:v8];
    double v10 = v9;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      double v10 = 44.0;
      goto LABEL_7;
    }
    uint64_t v8 = [(CHWorkoutDetailDataSource *)self workout];
    unsigned int v11 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    unsigned __int8 v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    [v7 preferredHeightForWorkout:v8 indexPath:v5 numberOfRows:[v12 count]];
    double v10 = v13;
  }
LABEL_7:

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [v7 count];
  if (a4 != 2 || (double v9 = 10.0, !v8))
  {
    double v10 = [(CHWorkoutDetailDataSource *)self tableSectionHeaders];
    unsigned int v11 = [v10 objectAtIndexedSubscript:a4];

    if (a4 == 1) {
      BOOL v12 = self->_isTopLevelMultisport || self->_isSwimmingActivity;
    }
    else {
      BOOL v12 = 0;
    }
    double v13 = +[NSNull null];
    if (([v11 isEqual:v13] & 1) != 0 || !objc_msgSend(v7, "count"))
    {

      double v9 = 0.0;
    }
    else
    {

      if (v12) {
        double v9 = 0.0;
      }
      else {
        double v9 = UITableViewAutomaticDimension;
      }
    }
  }
  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if (a4 == 1)
  {
    if ([(CHWorkoutDetailDataSource *)self _isExtendedMode]) {
LABEL_6:
    }
      double v7 = UITableViewAutomaticDimension;
  }
  else if (a4 == 14)
  {
    id v8 = [(HKWorkout *)self->_workout metadata];
    uint64_t v9 = _HKPrivateMetadataKeyWorkoutWeatherSourceName;
    double v10 = [v8 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutWeatherSourceName];
    if ([v10 isEqualToString:kHKAppleWeatherSourceName])
    {
    }
    else
    {
      BOOL v12 = [(HKWorkout *)self->_workout metadata];
      double v13 = [v12 objectForKeyedSubscript:v9];
      unsigned __int8 v14 = [v13 isEqualToString:kHKAppleWeatherLogoSourceName];

      if ((v14 & 1) == 0) {
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 section] == (id)16)
  {
    double v7 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
    id v8 = [v7 objectAtIndexedSubscript:[v6 section]];
    uint64_t v9 = [v8 objectAtIndexedSubscript:[v6 row]];

    double v10 = [v13 cellForRowAtIndexPath:v6];
    unsigned int v11 = [(CHWorkoutDetailDataSource *)self delegate];
    BOOL v12 = [v9 achievement];
    [v10 badgeRect];
    [v11 presentAchievement:v12 badgeRect:v10];
  }
  else
  {
    -[CHWorkoutDetailDataSource presentPageForSection:](self, "presentPageForSection:", [v6 section]);
  }
}

- (void)presentPageForSection:(int64_t)a3
{
  id v3 = [(CHWorkoutDetailDataSource *)self navigationActionForHeaderInSection:a3];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, 1);
    id v3 = (void (**)(void, void))v4;
  }
}

- (id)navigationActionForHeaderInSection:(int64_t)a3
{
  objc_initWeak(&location, self);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10013F9C4;
  v53[3] = &unk_1008AD518;
  objc_copyWeak(v54, &location);
  v54[1] = (id)a3;
  id v5 = objc_retainBlock(v53);
  id v6 = 0;
  switch(a3)
  {
    case 1:
      double v7 = [(CHWorkoutDetailDataSource *)self workoutActivity];
      if ([v7 hasChartableMetrics])
      {

        if (!self->_isUnderwaterDive) {
          goto LABEL_20;
        }
LABEL_18:
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10013FA24;
        v50[3] = &unk_1008AD540;
        id v8 = &v52;
        objc_copyWeak(&v52, &location);
        id v51 = v5;
        id v6 = objc_retainBlock(v50);
        uint64_t v9 = v51;
        goto LABEL_21;
      }
      double v10 = [(CHWorkoutDetailDataSource *)self workout];
      unsigned int v11 = [v10 hasChartableMetrics];

      if (self->_isUnderwaterDive) {
        goto LABEL_18;
      }
      if (!v11)
      {
        id v6 = 0;
        goto LABEL_22;
      }
LABEL_20:
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10013FAE8;
      v47[3] = &unk_1008AD540;
      id v8 = &v49;
      objc_copyWeak(&v49, &location);
      id v48 = v5;
      id v6 = objc_retainBlock(v47);
      uint64_t v9 = v48;
LABEL_21:

      objc_destroyWeak(v8);
LABEL_22:
      BOOL v12 = objc_retainBlock(v6);

      objc_destroyWeak(v54);
      objc_destroyWeak(&location);

      return v12;
    case 2:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10014087C;
      v14[3] = &unk_1008AD540;
      id v8 = &v16;
      objc_copyWeak(&v16, &location);
      id v15 = v5;
      id v6 = objc_retainBlock(v14);
      uint64_t v9 = v15;
      goto LABEL_21;
    case 5:
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100140260;
      v29[3] = &unk_1008AD540;
      id v8 = &v31;
      objc_copyWeak(&v31, &location);
      id v30 = v5;
      id v6 = objc_retainBlock(v29);
      uint64_t v9 = v30;
      goto LABEL_21;
    case 6:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100140394;
      v26[3] = &unk_1008AD540;
      id v8 = &v28;
      objc_copyWeak(&v28, &location);
      id v27 = v5;
      id v6 = objc_retainBlock(v26);
      uint64_t v9 = v27;
      goto LABEL_21;
    case 7:
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10013FC1C;
      v44[3] = &unk_1008AD568;
      id v8 = &v46;
      objc_copyWeak(&v46, &location);
      v44[4] = self;
      id v45 = v5;
      id v6 = objc_retainBlock(v44);
      uint64_t v9 = v45;
      goto LABEL_21;
    case 8:
      if ([(CHWorkoutDetailDataSource *)self isSwimmingActivity])
      {
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10013FD58;
        v41[3] = &unk_1008AD540;
        id v8 = &v43;
        objc_copyWeak(&v43, &location);
        v42 = v5;
        id v6 = objc_retainBlock(v41);
        uint64_t v9 = v42;
      }
      else
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10013FE88;
        v38[3] = &unk_1008AD540;
        id v8 = &v40;
        objc_copyWeak(&v40, &location);
        v39 = v5;
        id v6 = objc_retainBlock(v38);
        uint64_t v9 = v39;
      }
      goto LABEL_21;
    case 9:
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1001400F8;
      v32[3] = &unk_1008AD540;
      id v8 = &v34;
      objc_copyWeak(&v34, &location);
      id v33 = v5;
      id v6 = objc_retainBlock(v32);
      uint64_t v9 = v33;
      goto LABEL_21;
    case 10:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10013FFD0;
      v35[3] = &unk_1008AD540;
      id v8 = &v37;
      objc_copyWeak(&v37, &location);
      id v36 = v5;
      id v6 = objc_retainBlock(v35);
      uint64_t v9 = v36;
      goto LABEL_21;
    case 12:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1001404DC;
      v23[3] = &unk_1008AD540;
      id v8 = &v25;
      objc_copyWeak(&v25, &location);
      id v24 = v5;
      id v6 = objc_retainBlock(v23);
      uint64_t v9 = v24;
      goto LABEL_21;
    case 13:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001405D8;
      v20[3] = &unk_1008AD540;
      id v8 = &v22;
      objc_copyWeak(&v22, &location);
      id v21 = v5;
      id v6 = objc_retainBlock(v20);
      uint64_t v9 = v21;
      goto LABEL_21;
    case 14:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1001406F8;
      v17[3] = &unk_1008AD540;
      id v8 = &v19;
      objc_copyWeak(&v19, &location);
      id v18 = v5;
      id v6 = objc_retainBlock(v17);
      uint64_t v9 = v18;
      goto LABEL_21;
    default:
      goto LABEL_22;
  }
}

- (void)presentEffortViewController:(BOOL)a3 presentationCompletion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  double v7 = [(CHWorkoutDetailDataSource *)self dataCalculator];
  id v8 = [(CHWorkoutDetailDataSource *)self workout];
  uint64_t v9 = [(CHWorkoutDetailDataSource *)self workoutActivity];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100140A18;
  v11[3] = &unk_1008AD5D0;
  objc_copyWeak(&v13, &location);
  BOOL v14 = a3;
  id v10 = v6;
  id v12 = v10;
  [v7 effortForWorkout:v8 workoutActivity:v9 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    double v7 = +[ActivityTileSectionHeader reuseIdentifier];
    id v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v7];

    [v8 configureWithTitle:&stru_1008D8AB8 buttonAction:0];
  }
  else
  {
    uint64_t v9 = [(CHWorkoutDetailDataSource *)self tableSectionHeaders];
    id v10 = [v9 objectAtIndexedSubscript:a4];

    if (a4 == 1) {
      BOOL v11 = self->_isTopLevelMultisport || self->_isSwimmingActivity;
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = +[NSNull null];
    unsigned __int8 v13 = [v10 isEqual:v12];

    id v8 = 0;
    if (!v11 && (v13 & 1) == 0)
    {
      BOOL v14 = [(CHWorkoutDetailDataSource *)self navigationActionForHeaderInSection:a4];
      id v15 = +[ActivityTileSectionHeader reuseIdentifier];
      id v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v15];

      [v8 configureWithTitle:v10 buttonAction:v14];
    }
  }

  return v8;
}

- (BOOL)_isExtendedMode
{
  id v2 = [(CHWorkoutDetailDataSource *)self workout];
  id v3 = [v2 metadata];
  id v4 = [v3 objectForKey:_HKPrivateMetadataKeyWorkoutExtendedMode];

  LOBYTE(v2) = [v4 BOOLValue];
  return (char)v2;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 14)
  {
    uint64_t v7 = [(CHWorkoutDetailDataSource *)self _makeAppleWeatherFooterView];
  }
  else
  {
    if (a4 != 1 || ![(CHWorkoutDetailDataSource *)self _isExtendedMode])
    {
      id v8 = 0;
      goto LABEL_8;
    }
    uint64_t v7 = [(CHWorkoutDetailDataSource *)self _makeUltraModeFooterView];
  }
  id v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a5;
  id v7 = a4;
  if (![v10 section]
    || [v10 section] == (id)4
    || [v10 section] == (id)16
    || [v10 section] == (id)1 && (self->_isTopLevelMultisport || self->_isSwimmingActivity))
  {
    uint64_t v8 = +[UIColor systemBackgroundColor];
  }
  else
  {
    uint64_t v8 = sub_10005DB50();
  }
  uint64_t v9 = (void *)v8;
  [v7 setBackgroundColor:v8];

  [v7 setSelectionStyle:0];
}

- (void)_section:(int64_t)a3 setExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 7:
    case 10:
      if ([(CHWorkoutDetailDataSource *)self segmentsExpanded] != a4)
      {
        [(CHWorkoutDetailDataSource *)self setSegmentsExpanded:v4];
        goto LABEL_8;
      }
      break;
    case 8:
      if ([(CHWorkoutDetailDataSource *)self splitsExpanded] != a4)
      {
        [(CHWorkoutDetailDataSource *)self setSplitsExpanded:v4];
        goto LABEL_8;
      }
      break;
    case 11:
      if ([(CHWorkoutDetailDataSource *)self burnBarExpanded] != a4)
      {
        [(CHWorkoutDetailDataSource *)self setBurnBarExpanded:v4];
LABEL_8:
        id v17 = objc_alloc_init((Class)NSMutableArray);
        id v7 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
        uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
        id v9 = [v8 count];

        if (v9)
        {
          unint64_t v10 = 0;
          do
          {
            BOOL v11 = +[NSIndexPath indexPathForRow:v10 inSection:a3];
            [v17 addObject:v11];

            ++v10;
            id v12 = [(CHWorkoutDetailDataSource *)self tableItemsBySection];
            unsigned __int8 v13 = [v12 objectAtIndexedSubscript:a3];
            id v14 = [v13 count];
          }
          while (v10 < (unint64_t)v14);
        }
        id v15 = [(CHWorkoutDetailDataSource *)self tableView];
        id v16 = v15;
        if (v4) {
          [v15 insertRowsAtIndexPaths:v17 withRowAnimation:3];
        }
        else {
          [v15 deleteRowsAtIndexPaths:v17 withRowAnimation:3];
        }
      }
      break;
    default:
      return;
  }
}

- (void)expandingHeaderView:(id)a3 didChangeExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 section];

  [(CHWorkoutDetailDataSource *)self _section:v6 setExpanded:v4];
}

- (void)paceCell:(id)a3 didSelectNewPaceFormat:(int64_t)a4
{
}

- (void)_insertMultiSportSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:4];
  [v3 reloadSections:v2 withRowAnimation:3];
}

- (void)_insertSegmentsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:10];
  [v3 reloadSections:v2 withRowAnimation:3];
}

- (void)_insertDownhillRunsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  BOOL v4 = +[NSIndexSet indexSetWithIndex:9];
  [v3 reloadSections:v4 withRowAnimation:3];

  [(CHWorkoutDetailDataSource *)self _createValuesSection];
  id v6 = [(CHWorkoutDetailDataSource *)self tableView];
  id v5 = +[NSIndexSet indexSetWithIndex:1];
  [v6 reloadSections:v5 withRowAnimation:5];
}

- (void)_insertIntervalsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:5];
  [v3 reloadSections:v2 withRowAnimation:3];
}

- (void)_insertTrackLapsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:6];
  [v3 reloadSections:v2 withRowAnimation:3];
}

- (void)_insertSwimSetsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:7];
  [v3 reloadSections:v2 withRowAnimation:3];
}

- (void)_insertSplitsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:8];
  [v3 reloadSections:v2 withRowAnimation:3];
}

- (void)_insertBurnBarSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:11];
  [v3 reloadSections:v2 withRowAnimation:100];
}

- (void)_insertHeartRateSubItem
{
  [(CHWorkoutDetailDataSource *)self _createValuesSection];
  id v4 = [(CHWorkoutDetailDataSource *)self tableView];
  id v3 = +[NSIndexSet indexSetWithIndex:1];
  [v4 reloadSections:v3 withRowAnimation:100];
}

- (void)_insertHeartRateSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:12];
  [v3 reloadSections:v2 withRowAnimation:100];
}

- (void)_insertPowerSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:13];
  [v3 reloadSections:v2 withRowAnimation:100];
}

- (void)_insertGuidedRunMediaMomentsSection
{
  id v3 = [(CHWorkoutDetailDataSource *)self tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:15];
  [v3 reloadSections:v2 withRowAnimation:100];
}

- (BOOL)weatherOrLocationAvailableForWorkout
{
  id v3 = [(CHWorkoutFormattingManager *)self->_formattingManager weatherTemperatureForWorkout:self->_workout workoutActivity:self->_workoutActivity];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CHWorkoutFormattingManager *)self->_formattingManager weatherHumidityForWorkout:self->_workout workoutActivity:self->_workoutActivity];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(CHWorkoutFormattingManager *)self->_formattingManager hasWeatherConditionForWorkout:self->_workout workoutActivity:self->_workoutActivity];
    }
  }
  id v6 = [(CHWorkoutFormattingManager *)self->_formattingManager locationForWorkout:self->_workout workoutActivity:self->_workoutActivity];

  return v6 || v4;
}

- (void)divingDataDidFinishLoading
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained reloadData];
}

- (CHWorkoutDetailNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHWorkoutDetailNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CHWorkoutDetailLocationFetcherObserver)locationFetcherObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationFetcherObserver);

  return (CHWorkoutDetailLocationFetcherObserver *)WeakRetained;
}

- (void)setLocationFetcherObserver:(id)a3
{
}

- (UIImage)routeImageForSharing
{
  return self->_routeImageForSharing;
}

- (void)setRouteImageForSharing:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
}

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (void)setWorkoutActivity:(id)a3
{
}

- (CHDivingDataCalculator)divingDataCalculator
{
  return self->_divingDataCalculator;
}

- (void)setDivingDataCalculator:(id)a3
{
}

- (NSArray)cellClassesBySection
{
  return self->_cellClassesBySection;
}

- (void)setCellClassesBySection:(id)a3
{
}

- (NSMutableArray)tableItemsBySection
{
  return self->_tableItemsBySection;
}

- (void)setTableItemsBySection:(id)a3
{
}

- (NSArray)tableSectionHeaders
{
  return self->_tableSectionHeaders;
}

- (void)setTableSectionHeaders:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKAnchoredObjectQuery)routeQuery
{
  return self->_routeQuery;
}

- (void)setRouteQuery:(id)a3
{
}

- (FIUIModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (CHFitnessAppContext)fitnessAppContext
{
  return self->_fitnessAppContext;
}

- (void)setFitnessAppContext:(id)a3
{
}

- (CHCatalogItemViewModel)catalogItemViewModel
{
  return self->_catalogItemViewModel;
}

- (void)setCatalogItemViewModel:(id)a3
{
}

- (CHScoreSummaryWrapper)scoreSummaryWrapper
{
  return self->_scoreSummaryWrapper;
}

- (void)setScoreSummaryWrapper:(id)a3
{
}

- (CHWorkoutFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (CHWorkoutDataCalculator)dataCalculator
{
  return self->_dataCalculator;
}

- (void)setDataCalculator:(id)a3
{
}

- (BOOL)splitsExpanded
{
  return self->_splitsExpanded;
}

- (void)setSplitsExpanded:(BOOL)a3
{
  self->_splitsExpanded = a3;
}

- (NSArray)indexPathsForSplitCells
{
  return self->_indexPathsForSplitCells;
}

- (void)setIndexPathsForSplitCells:(id)a3
{
}

- (HKLocationFetcher)locationFetcher
{
  return self->_locationFetcher;
}

- (void)setLocationFetcher:(id)a3
{
}

- (BOOL)segmentsExpanded
{
  return self->_segmentsExpanded;
}

- (void)setSegmentsExpanded:(BOOL)a3
{
  self->_segmentsExpanded = a3;
}

- (int64_t)currentlySelectedSwimmingPaceFormat
{
  return self->_currentlySelectedSwimmingPaceFormat;
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
}

- (CHWorkoutRouteMapGenerator)snapshotGenerator
{
  return self->_snapshotGenerator;
}

- (void)setSnapshotGenerator:(id)a3
{
}

- (BOOL)burnBarExpanded
{
  return self->_burnBarExpanded;
}

- (void)setBurnBarExpanded:(BOOL)a3
{
  self->_burnBarExpanded = a3;
}

- (BOOL)workoutIsFirstParty
{
  return self->_workoutIsFirstParty;
}

- (void)setWorkoutIsFirstParty:(BOOL)a3
{
  self->_workoutIsFirstParty = a3;
}

- (BOOL)workoutIsPoolSwim
{
  return self->_workoutIsPoolSwim;
}

- (void)setWorkoutIsPoolSwim:(BOOL)a3
{
  self->_workoutIsPoolSwim = a3;
}

- (BOOL)isSwimmingActivity
{
  return self->_isSwimmingActivity;
}

- (void)setIsSwimmingActivity:(BOOL)a3
{
  self->_char isSwimmingActivity = a3;
}

- (BOOL)isTopLevelMultisport
{
  return self->_isTopLevelMultisport;
}

- (void)setIsTopLevelMultisport:(BOOL)a3
{
  self->_isTopLevelMultisport = a3;
}

- (BOOL)isUnderwaterDive
{
  return self->_isUnderwaterDive;
}

- (void)setIsUnderwaterDive:(BOOL)a3
{
  self->_isUnderwaterDive = a3;
}

- (NSDictionary)swimmingSplitItems
{
  return self->_swimmingSplitItems;
}

- (void)setSwimmingSplitItems:(id)a3
{
}

- (BOOL)didSetInitialSwimmingPaceFormat
{
  return self->_didSetInitialSwimmingPaceFormat;
}

- (void)setDidSetInitialSwimmingPaceFormat:(BOOL)a3
{
  self->_didSetInitialSwimmingPaceFormat = a3;
}

- (HKKeyValueDomain)trackValueDomain
{
  return self->_trackValueDomain;
}

- (void)setTrackValueDomain:(id)a3
{
}

- (unint64_t)trackDistanceUnit
{
  return self->_trackDistanceUnit;
}

- (void)setTrackDistanceUnit:(unint64_t)a3
{
  self->_trackDistanceUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackValueDomain, 0);
  objc_storeStrong((id *)&self->_swimmingSplitItems, 0);
  objc_storeStrong((id *)&self->_snapshotGenerator, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_locationFetcher, 0);
  objc_storeStrong((id *)&self->_indexPathsForSplitCells, 0);
  objc_storeStrong((id *)&self->_dataCalculator, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_scoreSummaryWrapper, 0);
  objc_storeStrong((id *)&self->_catalogItemViewModel, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_routeQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_tableSectionHeaders, 0);
  objc_storeStrong((id *)&self->_tableItemsBySection, 0);
  objc_storeStrong((id *)&self->_cellClassesBySection, 0);
  objc_storeStrong((id *)&self->_divingDataCalculator, 0);
  objc_storeStrong((id *)&self->_workoutActivity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_routeImageForSharing, 0);
  objc_destroyWeak((id *)&self->_locationFetcherObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fiuiFormattingManager, 0);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);

  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
}

@end