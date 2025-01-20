@interface MOTripAnnotationManager
- (BOOL)containInterestingCategoryInTrip:(id)a3;
- (BOOL)inSameCityOfEvent:(id)a3 trip:(id)a4;
- (BOOL)isSameDayOfEvent:(id)a3 trip:(id)a4;
- (MOConfigurationManager)configurationManager;
- (MOFSM)summaryTripMonitor;
- (MOFSMStore)fsmStore;
- (MOTripAnnotationManager)initWithUniverse:(id)a3;
- (NSString)addressFormatOption;
- (OS_dispatch_queue)queue;
- (RTRoutineManager)routineManager;
- (double)aoiVisitLabelConfidentThreshold;
- (double)distanceFromEvent:(id)a3 trip:(id)a4;
- (double)distanceFromLocation:(id)a3 hometownReferenceLocations:(id)a4;
- (double)durationOfTrip:(id)a3;
- (double)dwellTimeOfEvents:(id)a3;
- (double)interestingPOIDurationInTrip:(id)a3;
- (double)maxDistanceFromEvent:(id)a3 events:(id)a4;
- (double)maximumCommuteDistanceForTripThreshold;
- (double)minimumDistanceBetweenTripsThreshold;
- (double)minimumDominancyRatioForInterestingPOITripThreshold;
- (double)minimumDominancyRatioForSinglePOITripThreshold;
- (double)minimumDurationThreshold;
- (double)minimumDwellTime;
- (double)minimumHometownDistanceForTripThreshold;
- (double)minimumHometownDistanceThreshold;
- (double)nonInterestingPOIDurationInTrip:(id)a3;
- (double)overnightDurationHours;
- (double)overnightDurationWeight;
- (double)overnightStartDateHour;
- (double)visitLabelHighConfidenceThreshold;
- (double)visitLabelMediumConfidenceThreshold;
- (id)_assignPriorityScoreForPlace:(id)a3 placeInfoArray:(id)a4;
- (id)_filterPlaceUsingPredicates:(id)a3;
- (id)buildPromptDescriptionForEventBundle:(id)a3;
- (id)createTripWithVisitEvent:(id)a3;
- (id)dominantInterestingPOIFromEvents:(id)a3 timeZone:(id)a4;
- (id)dominantPOIFormEvents:(id)a3 timeZone:(id)a4;
- (id)dominantPlaceFromEvents:(id)a3 timeZone:(id)a4;
- (id)dominantPlaceNamesFromEvents:(id)a3 countryMode:(BOOL)a4 timeZone:(id)a5;
- (id)dominantPlacesFromEvents:(id)a3 timeZone:(id)a4;
- (id)generateDailyTripsFromBaseEvents:(id)a3 contextEvents:(id)a4 pregeneratedTripBundles:(id)a5 hometownReferenceLocations:(id)a6;
- (id)generateSummaryTripsFromBaseEvents:(id)a3 hometownReferenceLocations:(id)a4;
- (id)getBaseEvents:(id)a3;
- (id)getContextEvents:(id)a3;
- (id)getTripEventBundles:(id)a3;
- (id)hometownReferenceLocations;
- (id)loadSummaryTripMonitorFromStore:(id)a3;
- (id)placeNameOfEvent:(id)a3 addressFormatOption:(id)a4 countryMode:(BOOL)a5;
- (id)resourceFromWorkoutEvent:(id)a3;
- (id)transformTripPlan:(id)a3;
- (unint64_t)dayCountInTrip:(id)a3;
- (unint64_t)maximumDayCountThreashold;
- (unint64_t)minimumDayCountThreshold;
- (unint64_t)minimumVisitCountThreshold;
- (unint64_t)significantLOIMinimumVisitsThreshold;
- (unint64_t)visitCountInTrip:(id)a3;
- (void)_assignPriorityScoreForPhotoResources:(id)a3;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 eventBundles:(id)a5 handler:(id)a6;
- (void)_updateMOPlacePriorityScore:(id)a3 priorityScore:(unint64_t)a4 handler:(id)a5;
- (void)addVisitEvent:(id)a3 toTripBundle:(id)a4;
- (void)closeTrip:(id)a3 hometownReferenceLocations:(id)a4 contextEvents:(id)a5;
- (void)hometownReferenceLocations;
- (void)materializeTripBundle:(id)a3 contextEvents:(id)a4 updateWithFilteredEvents:(BOOL)a5;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 eventBundles:(id)a5 handler:(id)a6;
- (void)resourcesFromEvents:(id)a3 handler:(id)a4;
- (void)setAddressFormatOption:(id)a3;
- (void)setAoiVisitLabelConfidentThreshold:(double)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setFsmStore:(id)a3;
- (void)setMaximumCommuteDistanceForTripThreshold:(double)a3;
- (void)setMaximumDayCountThreashold:(unint64_t)a3;
- (void)setMinimumDayCountThreshold:(unint64_t)a3;
- (void)setMinimumDistanceBetweenTripsThreshold:(double)a3;
- (void)setMinimumDominancyRatioForInterestingPOITripThreshold:(double)a3;
- (void)setMinimumDominancyRatioForSinglePOITripThreshold:(double)a3;
- (void)setMinimumDurationThreshold:(double)a3;
- (void)setMinimumDwellTime:(double)a3;
- (void)setMinimumHometownDistanceForTripThreshold:(double)a3;
- (void)setMinimumHometownDistanceThreshold:(double)a3;
- (void)setMinimumVisitCountThreshold:(unint64_t)a3;
- (void)setOvernightDurationHours:(double)a3;
- (void)setOvernightDurationWeight:(double)a3;
- (void)setOvernightStartDateHour:(double)a3;
- (void)setRoutineManager:(id)a3;
- (void)setSignificantLOIMinimumVisitsThreshold:(unint64_t)a3;
- (void)setSummaryTripMonitor:(id)a3;
- (void)setVisitLabelHighConfidenceThreshold:(double)a3;
- (void)setVisitLabelMediumConfidenceThreshold:(double)a3;
- (void)setupSummaryTripMonitorWithHomeLOI:(id)a3;
- (void)updateSummaryTripMonitor:(id)a3;
@end

@implementation MOTripAnnotationManager

- (MOTripAnnotationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)MOTripAnnotationManager;
  v5 = [(MOAnnotationManager *)&v69 initWithUniverse:v4];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v74[0] = GEOPOICategoryATM;
    v74[1] = GEOPOICategoryBank;
    v74[2] = GEOPOICategoryCarRental;
    v74[3] = GEOPOICategoryEVCharger;
    v74[4] = GEOPOICategoryFireStation;
    v74[5] = GEOPOICategoryGasStation;
    v74[6] = GEOPOICategoryHospital;
    v74[7] = GEOPOICategoryHotel;
    v74[8] = GEOPOICategoryLaundry;
    v74[9] = GEOPOICategoryParking;
    v74[10] = GEOPOICategoryPharmacy;
    v74[11] = GEOPOICategoryPolice;
    v74[12] = GEOPOICategoryPostOffice;
    v74[13] = GEOPOICategoryPublicTransport;
    v74[14] = GEOPOICategoryRestroom;
    v12 = +[NSArray arrayWithObjects:v74 count:15];
    uint64_t v13 = +[NSSet setWithArray:v12];
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v13;

    v73[0] = GEOPOICategoryAirport;
    v73[1] = GEOPOICategoryAirportGate;
    v73[2] = GEOPOICategoryAirportTerminal;
    v15 = +[NSArray arrayWithObjects:v73 count:3];
    uint64_t v16 = +[NSSet setWithArray:v15];
    airportCategories = v5->_airportCategories;
    v5->_airportCategories = (NSSet *)v16;

    v72[0] = GEOPOICategoryAmusementPark;
    v72[1] = GEOPOICategoryAquarium;
    v72[2] = GEOPOICategoryBeach;
    v72[3] = GEOPOICategoryCampground;
    v72[4] = GEOPOICategoryNationalPark;
    v72[5] = GEOPOICategoryZoo;
    v18 = +[NSArray arrayWithObjects:v72 count:6];
    uint64_t v19 = +[NSSet setWithArray:v18];
    interestingPoiCategories = v5->_interestingPoiCategories;
    v5->_interestingPoiCategories = (NSSet *)v19;

    uint64_t v21 = +[NSSet setWithArray:&off_1002F8DC8];
    stateStateTripEligibleCountries = v5->_stateStateTripEligibleCountries;
    v5->_stateStateTripEligibleCountries = (NSSet *)v21;

    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    uint64_t v25 = [v4 getService:v24];
    fsmStore = v5->_fsmStore;
    v5->_fsmStore = (MOFSMStore *)v25;

    uint64_t v27 = [(MOTripAnnotationManager *)v5 loadSummaryTripMonitorFromStore:v5->_fsmStore];
    summaryTripMonitor = v5->_summaryTripMonitor;
    v5->_summaryTripMonitor = (MOFSM *)v27;

    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = [v4 getService:v30];

    uint64_t v32 = [v31 routineManager];
    routineManager = v5->_routineManager;
    v5->_routineManager = (RTRoutineManager *)v32;

    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    uint64_t v36 = [v4 getService:v35];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v36;

    v5->_significantLOIMinimumVisitsThreshold = [(MOConfigurationManagerBase *)v5->_configurationManager getIntegerSettingForKey:@"kMOTripAnnotationManagerSignificantLOIMinimumVisits" withFallback:12];
    HIDWORD(v38) = 1072483532;
    *(float *)&double v38 = 0.9;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_VisitLabelMediumConfidenceThreshold" withFallback:v38];
    v5->_visitLabelMediumConfidenceThreshold = v39;
    HIDWORD(v40) = 1072588390;
    *(float *)&double v40 = 0.95;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_VisitLabelHighConfidenceThreshold" withFallback:v40];
    v5->_visitLabelHighConfidenceThreshold = v41;
    HIDWORD(v42) = 1071644672;
    *(float *)&double v42 = 0.5;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AOIVisitLabelConfidentThreshold" withFallback:v42];
    double v44 = v43;
    v5->_aoiVisitLabelConfidentThreshold = v44;
    LODWORD(v44) = 1150681088;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMOTripAnnotationManagerMinimumDwellTimeDefault" withFallback:v44];
    double v46 = v45;
    v5->_minimumDwellTime = v46;
    LODWORD(v46) = 1189765120;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMOTripAnnotationManagerMinimumHometownDistance" withFallback:v46];
    double v48 = v47;
    v5->_minimumHometownDistanceThreshold = v48;
    LODWORD(v48) = 1198153728;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMOTripAnnotationManagerMinimumHometownDistanceForTrip" withFallback:v48];
    double v50 = v49;
    v5->_minimumHometownDistanceForTripThreshold = v50;
    LODWORD(v50) = 1206542336;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMOTripAnnotationManagerMaximumCommuteDistanceForTrip" withFallback:v50];
    double v52 = v51;
    v5->_maximumCommuteDistanceForTripThreshold = v52;
    LODWORD(v52) = 1198153728;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMOTripAnnotationManagerMinimumDistanceBetweenTrips" withFallback:v52];
    double v54 = v53;
    v5->_minimumDistanceBetweenTripsThreshold = v54;
    LODWORD(v54) = 1163984896;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMOTripAnnotationManagerMinimumDuration" withFallback:v54];
    v5->_minimumDurationThreshold = v55;
    v5->_minimumDayCountThreshold = [(MOConfigurationManagerBase *)v5->_configurationManager getIntegerSettingForKey:@"kMOTripAnnotationManagerMinimumDayCount" withFallback:2];
    v5->_maximumDayCountThreashold = [(MOConfigurationManagerBase *)v5->_configurationManager getIntegerSettingForKey:@"kMOTripAnnotationManagerMaximumDayCount" withFallback:7];
    v5->_minimumVisitCountThreshold = [(MOConfigurationManagerBase *)v5->_configurationManager getIntegerSettingForKey:@"kMOTripAnnotationManagerMinimumVisitCount" withFallback:1];
    [(MOConfigurationManagerBase *)v5->_configurationManager getDoubleSettingForKey:@"kMOTripAnnotationManagerMinimumDominancyRatioForSinglePOITrip" withFallback:0.8];
    v5->_minimumDominancyRatioForSinglePOITripThreshold = v56;
    [(MOConfigurationManagerBase *)v5->_configurationManager getDoubleSettingForKey:@"kMOTripAnnotationManagerMinimumDominancyRatioForInterestingPOITrip" withFallback:0.4];
    v5->_minimumDominancyRatioForInterestingPOITripThreshold = v57;
    v58 = v5->_configurationManager;
    v59 = +[NSString stringWithFormat:@"%@_%@", @"addressFormatting", @"formatOption"];
    uint64_t v60 = [(MOConfigurationManagerBase *)v58 getStringSettingForKey:v59 withFallback:@"aboveDoorShortAddress"];
    addressFormatOption = v5->_addressFormatOption;
    v5->_addressFormatOption = (NSString *)v60;

    [(MOConfigurationManagerBase *)v5->_configurationManager getDoubleSettingForKey:@"kMOTripAnnotationManagerOverNightStartDateHour" withFallback:0.0];
    v5->_overnightStartDateHour = v62;
    [(MOConfigurationManagerBase *)v5->_configurationManager getDoubleSettingForKey:@"kMOTripAnnotationManagerOverNightDurationHours" withFallback:6.0];
    v5->_overnightDurationHours = v63;
    [(MOConfigurationManagerBase *)v5->_configurationManager getDoubleSettingForKey:@"kMOTripAnnotationManagerOverNightDurationWeight" withFallback:0.1];
    v5->_overnightDurationWeight = v64;
    v65 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      v66 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v66);
      *(_DWORD *)buf = 138412290;
      v71 = v67;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%@: Initialized", buf, 0xCu);
    }
  }

  return v5;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 eventBundles:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(MOTripAnnotationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke;
  block[3] = &unk_1002CA300;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke_2;
  v5[3] = &unk_1002CA140;
  id v6 = *(id *)(a1 + 64);
  [v1 _performAnnotationWithEvents:v2 withPatternEvents:v3 eventBundles:v4 handler:v5];
}

uint64_t __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 eventBundles:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void *, void))a6;
  id v12 = v9;
  v66 = v11;
  id v13 = [(MOTripAnnotationManager *)self getBaseEvents:v9];
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  id v65 = v10;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = [v13 count];
    id v18 = [v13 firstObject];
    [v18 startDate];
    v20 = uint64_t v19 = v13;
    id v21 = [v19 lastObject];
    id v22 = [v21 endDate];
    *(_DWORD *)buf = 138413058;
    v71 = v16;
    __int16 v72 = 2048;
    id v73 = v17;
    __int16 v74 = 2112;
    v75 = v20;
    __int16 v76 = 2112;
    v77 = v22;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: Base Events, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    id v13 = v19;
    id v10 = v65;
  }
  if ([v13 count])
  {
    id v23 = [(MOTripAnnotationManager *)self getContextEvents:v12];
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      id v27 = [v23 count];
      *(_DWORD *)buf = 138412546;
      v71 = v26;
      __int16 v72 = 2048;
      id v73 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@: Context Events, %lu", buf, 0x16u);
    }
    double v64 = v12;

    v28 = [(MOTripAnnotationManager *)self getTripEventBundles:v10];
    v29 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      id v32 = [v28 count];
      [v28 firstObject];
      v33 = double v62 = v13;
      v34 = [v33 startDate];
      [v28 lastObject];
      v35 = v28;
      v37 = uint64_t v36 = v23;
      double v38 = [v37 endDate];
      *(_DWORD *)buf = 138413058;
      v71 = v31;
      __int16 v72 = 2048;
      id v73 = v32;
      __int16 v74 = 2112;
      v75 = v34;
      __int16 v76 = 2112;
      v77 = v38;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@: pre-generated Trip Bundles, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

      id v23 = v36;
      v28 = v35;

      id v13 = v62;
    }

    float v39 = [(MOTripAnnotationManager *)self hometownReferenceLocations];
    double v40 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      float v41 = (objc_class *)objc_opt_class();
      double v42 = NSStringFromClass(v41);
      id v43 = [v39 count];
      *(_DWORD *)buf = 138412546;
      v71 = v42;
      __int16 v72 = 2048;
      id v73 = v43;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@: trip manager hometown location count, %lu", buf, 0x16u);
    }
    if ([v39 count])
    {
      id v44 = (id)objc_opt_new();
      [(MOTripAnnotationManager *)self generateDailyTripsFromBaseEvents:v13 contextEvents:v23 pregeneratedTripBundles:v28 hometownReferenceLocations:v39];
      double v63 = v28;
      float v45 = v23;
      v47 = double v46 = v13;
      [v44 addObjectsFromArray:v47];
      double v48 = [(MOTripAnnotationManager *)self generateSummaryTripsFromBaseEvents:v46 hometownReferenceLocations:v39];
      [v44 addObjectsFromArray:v48];
      id v49 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
      id v67 = v49;
      double v50 = +[NSArray arrayWithObjects:&v67 count:1];
      float v51 = [v44 sortedArrayUsingDescriptors:v50];

      v66[2](v66, v51, 0);
      id v13 = v46;
      id v23 = v45;
      v28 = v63;
    }
    else
    {
      double v52 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[MOTripAnnotationManager _performAnnotationWithEvents:withPatternEvents:eventBundles:handler:](v52, v53, v54, v55, v56, v57, v58, v59);
      }

      id v60 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
      CFStringRef v69 = @"The hometown location is empty.";
      v61 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      id v44 = [v60 initWithDomain:@"MOBundleAnnotationManager" code:0 userInfo:v61];

      ((void (**)(id, void *, id))v66)[2](v66, &__NSArray0__struct, v44);
    }
    id v12 = v64;

    id v10 = v65;
  }
  else
  {
    v66[2](v66, &__NSArray0__struct, 0);
  }
}

- (id)generateSummaryTripsFromBaseEvents:(id)a3 hometownReferenceLocations:(id)a4
{
  id v5 = a3;
  id v6 = [(MOTripAnnotationManager *)self summaryTripMonitor];

  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = [(MOTripAnnotationManager *)self summaryTripMonitor];
      *(_DWORD *)buf = 138412546;
      id v44 = v9;
      __int16 v45 = 2112;
      double v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: fsm model, %@", buf, 0x16u);
    }
    id v11 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v36 = v5;
    id v12 = v5;
    id v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v39;
      id v16 = &MOLogFacilityTripAnnotationManager;
      v37 = self;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v17);
          uint64_t v19 = [(MOTripAnnotationManager *)self summaryTripMonitor];
          id v20 = [v19 processVisitEvent:v18];

          if (v20)
          {
            id v21 = [v20 startDate];

            if (!v21)
            {
              id v22 = _mo_log_facility_get_os_log(v16);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                id v32 = (objc_class *)objc_opt_class();
                v33 = NSStringFromClass(v32);
                *(_DWORD *)buf = 138412546;
                id v44 = v33;
                __int16 v45 = 2112;
                double v46 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@: plan, %@", buf, 0x16u);
              }
            }
            id v23 = [(MOTripAnnotationManager *)self transformTripPlan:v20];
            if (v23)
            {
              [v11 addObject:v23];
              v24 = _mo_log_facility_get_os_log(v16);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                uint64_t v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                id v26 = v14;
                uint64_t v27 = v15;
                id v28 = v12;
                v29 = v16;
                v31 = v30 = v11;
                *(_DWORD *)buf = 138412546;
                id v44 = v31;
                __int16 v45 = 2112;
                double v46 = v23;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@: Trip Summary Detected: %@", buf, 0x16u);

                id v11 = v30;
                id v16 = v29;
                id v12 = v28;
                uint64_t v15 = v27;
                id v14 = v26;
                self = v37;
              }
            }
          }

          id v17 = (char *)v17 + 1;
        }
        while (v14 != v17);
        id v14 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v14);
    }

    v34 = [(MOTripAnnotationManager *)self summaryTripMonitor];
    [(MOTripAnnotationManager *)self updateSummaryTripMonitor:v34];

    id v5 = v36;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)transformTripPlan:(id)a3
{
  id v4 = a3;
  id v5 = [MOEventBundle alloc];
  id v6 = +[NSUUID UUID];
  id v7 = +[NSDate date];
  v8 = [(MOEventBundle *)v5 initWithBundleIdentifier:v6 creationDate:v7];

  [(MOEventBundle *)v8 setInterfaceType:13];
  [(MOEventBundle *)v8 setBundleSuperType:1];
  [(MOEventBundle *)v8 setBundleSubType:105];
  [(MOEventBundle *)v8 setSummarizationGranularity:2];
  id v9 = [[MOAction alloc] initWithActionName:@"Trip" actionType:2];
  [(MOEventBundle *)v8 setAction:v9];

  id v10 = [v4 startDate];
  id v11 = [(MOAnnotationManager *)self timeZoneManager];
  id v12 = +[MOTime timeForDate:v10 timeZoneManager:v11];
  [(MOEventBundle *)v8 setTime:v12];

  [(MOEventBundle *)v8 setEvents:&__NSArray0__struct];
  id v13 = [v4 startDate];
  [(MOEventBundle *)v8 setStartDate:v13];

  id v14 = [v4 endDate];
  [(MOEventBundle *)v8 setEndDate:v14];

  uint64_t v15 = [v4 endDate];
  id v16 = [v15 dateByAddingTimeInterval:2419200.0];
  [(MOEventBundle *)v8 setExpirationDate:v16];

  [(MOEventBundle *)v8 setIsAggregatedAndSuppressed:0];
  id v17 = [v4 destination];
  [(MOEventBundle *)v8 setPromptLanguage:v17];

  unint64_t v18 = (unint64_t)[v4 destinationType];
  if (v18 > 3) {
    uint64_t v19 = 100;
  }
  else {
    uint64_t v19 = qword_1002BABE8[v18];
  }
  id v20 = [MOPlace alloc];
  id v21 = +[NSUUID UUID];
  id v22 = [v4 destination];
  id v23 = [v4 destination];
  v24 = [v4 startDate];
  uint64_t v25 = [v4 endDate];
  id v26 = [(MOPlace *)v20 initWithIdentifier:v21 placeName:v22 enclosingArea:v23 placeType:v19 placeUserType:0 location:0 locationMode:0.0 poiCategory:0.99 distanceToHomeInMiles:0.0 placeNameConfidence:-1.0 familiarityIndexLOI:2 priorityScore:0 startDate:v24 endDate:v25];
  [(MOEventBundle *)v8 setPlace:v26];

  return v8;
}

- (id)generateDailyTripsFromBaseEvents:(id)a3 contextEvents:(id)a4 pregeneratedTripBundles:(id)a5 hometownReferenceLocations:(id)a6
{
  id v10 = a3;
  id v114 = a4;
  id v11 = a5;
  id v120 = a6;
  v115 = objc_opt_new();
  v116 = v11;
  id v12 = [v11 lastObject];
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = [v12 state];
    id v17 = [v12 startDate];
    unint64_t v18 = [v12 endDate];
    uint64_t v19 = [v12 promptLanguage];
    id v20 = [v19 mask];
    *(_DWORD *)buf = 138413314;
    uint64_t v141 = (uint64_t)v15;
    __int16 v142 = 2048;
    double v143 = *(double *)&v16;
    __int16 v144 = 2112;
    double v145 = *(double *)&v17;
    __int16 v146 = 2112;
    double v147 = *(double *)&v18;
    __int16 v148 = 2112;
    v149 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: current trip, state, %lu, startDate, %@, endDate, %@, string, %@", buf, 0x34u);
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id obj = v10;
  id v21 = [obj countByEnumeratingWithState:&v132 objects:v139 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v133;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v133 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v132 + 1) + 8 * i);
        if (v12)
        {
          id v26 = [*(id *)(*((void *)&v132 + 1) + 8 * i) startDate];
          uint64_t v27 = [v12 endDate];
          unsigned __int8 v28 = [v26 isBeforeDate:v27];

          if (v28) {
            continue;
          }
        }
        v29 = v12;
        v30 = [v25 routineEvent];
        v31 = [v30 location];
        [(MOTripAnnotationManager *)self distanceFromLocation:v31 hometownReferenceLocations:v120];
        double v33 = v32;

        double minimumHometownDistanceThreshold = self->_minimumHometownDistanceThreshold;
        v35 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          id v36 = (objc_class *)objc_opt_class();
          uint64_t v37 = NSStringFromClass(v36);
          long long v38 = (void *)v37;
          double v39 = self->_minimumHometownDistanceThreshold;
          *(_DWORD *)buf = 138413314;
          CFStringRef v40 = @"Away";
          if (v33 < minimumHometownDistanceThreshold) {
            CFStringRef v40 = @"Home";
          }
          uint64_t v141 = v37;
          __int16 v142 = 2112;
          double v143 = *(double *)&v40;
          __int16 v144 = 2048;
          double v145 = v33;
          __int16 v146 = 2048;
          double v147 = v39;
          __int16 v148 = 2112;
          v149 = v25;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@: new visit (%@), distance, %f, threshold, %f, %@", buf, 0x34u);
        }
        if (v33 < minimumHometownDistanceThreshold)
        {
          if (v12)
          {
            if ([v12 state] == (id)1)
            {
              [(MOTripAnnotationManager *)self closeTrip:v12 hometownReferenceLocations:v120 contextEvents:v114];
              uint64_t v56 = [v12 suggestionID];
              [v115 setObject:v12 forKey:v56];

              uint64_t v57 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                uint64_t v58 = (objc_class *)objc_opt_class();
                uint64_t v59 = NSStringFromClass(v58);
                *(_DWORD *)buf = 138412546;
                uint64_t v141 = (uint64_t)v59;
                __int16 v142 = 2112;
                double v143 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%@: hometown visit, close the previous trip, %@", buf, 0x16u);
              }
            }
          }
          else
          {
            v29 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[MOTripAnnotationManager generateDailyTripsFromBaseEvents:contextEvents:pregeneratedTripBundles:hometownReferenceLocations:]((uint64_t)v138, (uint64_t)self);
            }
          }
          double v48 = 0;
          goto LABEL_48;
        }
        if (v12)
        {
          [(MOTripAnnotationManager *)self distanceFromEvent:v25 trip:v12];
          double v42 = v41;
          unsigned __int8 v43 = [(MOTripAnnotationManager *)self inSameCityOfEvent:v25 trip:v12];
          if (v42 <= self->_minimumDistanceBetweenTripsThreshold || (v43 & 1) != 0)
          {
            unsigned int v60 = [(MOTripAnnotationManager *)self isSameDayOfEvent:v25 trip:v12];
            unint64_t v61 = [(MOTripAnnotationManager *)self dayCountInTrip:v12];
            if (v61 < self->_maximumDayCountThreashold || (v60 & 1) != 0)
            {
              [(MOTripAnnotationManager *)self addVisitEvent:v25 toTripBundle:v12];
              CFStringRef v69 = [v12 suggestionID];
              [v115 setObject:v12 forKey:v69];

              v29 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                v70 = (objc_class *)objc_opt_class();
                uint64_t v71 = NSStringFromClass(v70);
                __int16 v72 = (void *)v71;
                *(_DWORD *)buf = 138412802;
                CFStringRef v73 = @"Continue";
                if (v60) {
                  CFStringRef v73 = @"SameDay";
                }
                uint64_t v141 = v71;
                __int16 v142 = 2112;
                double v143 = *(double *)&v73;
                __int16 v144 = 2112;
                double v145 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@: add to previous trip (%@), %@", buf, 0x20u);
              }
              double v48 = v12;
              goto LABEL_48;
            }
            unint64_t v62 = v61;
            if ([v12 state] == (id)1)
            {
              [(MOTripAnnotationManager *)self closeTrip:v12 hometownReferenceLocations:v120 contextEvents:v114];
              double v63 = [v12 suggestionID];
              [v115 setObject:v12 forKey:v63];

              double v64 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                id v65 = (objc_class *)objc_opt_class();
                v66 = NSStringFromClass(v65);
                *(_DWORD *)buf = 138412546;
                uint64_t v141 = (uint64_t)v66;
                __int16 v142 = 2112;
                double v143 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%@: activate the new trip, %@", buf, 0x16u);
              }
            }
            double v48 = [(MOTripAnnotationManager *)self createTripWithVisitEvent:v25];

            id v67 = [v48 suggestionID];
            [v115 setObject:v48 forKey:v67];

            v29 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              NSErrorUserInfoKey v68 = (objc_class *)objc_opt_class();
              float v51 = NSStringFromClass(v68);
              *(_DWORD *)buf = 138412802;
              uint64_t v141 = (uint64_t)v51;
              __int16 v142 = 2048;
              double v143 = *(double *)&v62;
              __int16 v144 = 2112;
              double v145 = *(double *)&v48;
              double v52 = v29;
              uint64_t v53 = "%@: long trip, %lu, start the new trip, %@";
              goto LABEL_42;
            }
          }
          else
          {
            if ([v12 state] == (id)1)
            {
              [(MOTripAnnotationManager *)self closeTrip:v12 hometownReferenceLocations:v120 contextEvents:v114];
              id v44 = [v12 suggestionID];
              [v115 setObject:v12 forKey:v44];

              __int16 v45 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                double v46 = (objc_class *)objc_opt_class();
                float v47 = NSStringFromClass(v46);
                *(_DWORD *)buf = 138412546;
                uint64_t v141 = (uint64_t)v47;
                __int16 v142 = 2112;
                double v143 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%@: activate the new trip, %@", buf, 0x16u);
              }
            }
            double v48 = [(MOTripAnnotationManager *)self createTripWithVisitEvent:v25];

            id v49 = [v48 suggestionID];
            [v115 setObject:v48 forKey:v49];

            v29 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
              goto LABEL_48;
            }
            double v50 = (objc_class *)objc_opt_class();
            float v51 = NSStringFromClass(v50);
            *(_DWORD *)buf = 138412802;
            uint64_t v141 = (uint64_t)v51;
            __int16 v142 = 2048;
            double v143 = v42;
            __int16 v144 = 2112;
            double v145 = *(double *)&v48;
            double v52 = v29;
            uint64_t v53 = "%@: long distance stride, %f, open new trip, %@";
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, v53, buf, 0x20u);
          }
        }
        else
        {
          double v48 = [(MOTripAnnotationManager *)self createTripWithVisitEvent:v25];
          uint64_t v54 = [v48 suggestionID];
          [v115 setObject:v48 forKey:v54];

          v29 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v55 = (objc_class *)objc_opt_class();
            float v51 = NSStringFromClass(v55);
            *(_DWORD *)buf = 138412802;
            uint64_t v141 = (uint64_t)v51;
            __int16 v142 = 2048;
            double v143 = v33;
            __int16 v144 = 2112;
            double v145 = *(double *)&v48;
            double v52 = v29;
            uint64_t v53 = "%@: long distance from hometown, %f, open new trip, %@";
            goto LABEL_42;
          }
        }
LABEL_48:

        id v12 = v48;
        continue;
      }
      id v22 = [obj countByEnumeratingWithState:&v132 objects:v139 count:16];
    }
    while (v22);
  }
  v113 = v12;

  __int16 v74 = objc_opt_new();
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v118 = v116;
  id v75 = [v118 countByEnumeratingWithState:&v128 objects:v137 count:16];
  v123 = v74;
  if (v75)
  {
    id v76 = v75;
    uint64_t v121 = *(void *)v129;
    do
    {
      for (j = 0; j != v76; j = (char *)j + 1)
      {
        if (*(void *)v129 != v121) {
          objc_enumerationMutation(v118);
        }
        v78 = *(void **)(*((void *)&v128 + 1) + 8 * (void)j);
        v79 = [v78 suggestionID];
        [v74 setObject:v78 forKey:v79];

        v80 = [v78 events];
        v81 = [(MOTripAnnotationManager *)self getBaseEvents:v80];

        id v82 = [v81 count];
        v83 = [v78 events];
        v84 = [(MOTripAnnotationManager *)self getContextEvents:v83];

        id v85 = [v84 count];
        v86 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          v87 = (objc_class *)objc_opt_class();
          v88 = NSStringFromClass(v87);
          id v89 = [v78 state];
          *(_DWORD *)buf = 138413314;
          uint64_t v141 = (uint64_t)v88;
          __int16 v142 = 2048;
          double v143 = *(double *)&v89;
          __int16 v144 = 2048;
          double v145 = *(double *)&v82;
          __int16 v146 = 2048;
          double v147 = *(double *)&v85;
          __int16 v148 = 2112;
          v149 = v78;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "%@: finalize bundles. pregenerated trip biundle, state, %lu, base events, %lu, context events, %lu, bundle, %@", buf, 0x34u);

          __int16 v74 = v123;
        }
      }
      id v76 = [v118 countByEnumeratingWithState:&v128 objects:v137 count:16];
    }
    while (v76);
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v117 = [v115 allValues];
  id v90 = [v117 countByEnumeratingWithState:&v124 objects:v136 count:16];
  if (v90)
  {
    id v91 = v90;
    uint64_t v122 = *(void *)v125;
    do
    {
      for (k = 0; k != v91; k = (char *)k + 1)
      {
        if (*(void *)v125 != v122) {
          objc_enumerationMutation(v117);
        }
        v93 = *(void **)(*((void *)&v124 + 1) + 8 * (void)k);
        v94 = [v93 suggestionID];
        [v74 setObject:v93 forKey:v94];

        v95 = [v93 events];
        v96 = [(MOTripAnnotationManager *)self getBaseEvents:v95];

        id v97 = [v96 count];
        v98 = [v93 events];
        v99 = [(MOTripAnnotationManager *)self getContextEvents:v98];

        id v100 = [v99 count];
        v101 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
        {
          v102 = (objc_class *)objc_opt_class();
          v103 = NSStringFromClass(v102);
          id v104 = [v93 state];
          *(_DWORD *)buf = 138413314;
          uint64_t v141 = (uint64_t)v103;
          __int16 v142 = 2048;
          double v143 = *(double *)&v104;
          __int16 v144 = 2048;
          double v145 = *(double *)&v97;
          __int16 v146 = 2048;
          double v147 = *(double *)&v100;
          __int16 v148 = 2112;
          v149 = v93;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "%@: finalize bundles. new/updated trip biundle, state, %lu, base events, %lu, context events, %lu, bundle, %@", buf, 0x34u);

          __int16 v74 = v123;
        }
      }
      id v91 = [v117 countByEnumeratingWithState:&v124 objects:v136 count:16];
    }
    while (v91);
  }

  v105 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
  {
    v106 = (objc_class *)objc_opt_class();
    v107 = NSStringFromClass(v106);
    id v108 = [v74 count];
    id v109 = [v115 count];
    id v110 = [v74 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v141 = (uint64_t)v107;
    __int16 v142 = 2048;
    double v143 = *(double *)&v108;
    __int16 v144 = 2048;
    double v145 = *(double *)&v109;
    __int16 v146 = 2048;
    double v147 = *(double *)&v110;
    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "%@: previous trips, %lu, new trips, %lu, total trips, %lu", buf, 0x2Au);
  }
  v111 = [v74 allValues];

  return v111;
}

- (void)closeTrip:(id)a3 hometownReferenceLocations:(id)a4 contextEvents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 action];

  if (!v11)
  {
    id v12 = [v8 startDate];
    id v13 = +[NSPredicate predicateWithFormat:@"startDate >= %@", v12];
    v74[0] = v13;
    id v14 = [v8 endDate];
    uint64_t v15 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v14];
    v74[1] = v15;
    id v16 = +[NSArray arrayWithObjects:v74 count:2];
    uint64_t v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

    float v51 = (void *)v17;
    uint64_t v18 = [v10 filteredArrayUsingPredicate:v17];

    [(MOTripAnnotationManager *)self materializeTripBundle:v8 contextEvents:v18 updateWithFilteredEvents:0];
    [(MOTripAnnotationManager *)self durationOfTrip:v8];
    double v20 = v19;
    unint64_t v21 = [(MOTripAnnotationManager *)self dayCountInTrip:v8];
    unint64_t v22 = [(MOTripAnnotationManager *)self visitCountInTrip:v8];
    uint64_t v23 = [v8 events];
    v24 = [v23 firstObject];
    uint64_t v25 = [v24 location];
    [(MOTripAnnotationManager *)self distanceFromLocation:v25 hometownReferenceLocations:v9];
    double v27 = v26;

    unsigned int v28 = [(MOTripAnnotationManager *)self containInterestingCategoryInTrip:v8];
    BOOL v29 = v20 < self->_minimumDurationThreshold
       || v22 < self->_minimumVisitCountThreshold
       || v27 < self->_minimumHometownDistanceForTripThreshold;
    if (v21 >= self->_minimumDayCountThreshold) {
      BOOL v29 = 0;
    }
    unint64_t v50 = v21;
    unsigned int v30 = v29 & ~v28;
    double minimumHometownDistanceThreshold = self->_minimumHometownDistanceThreshold;
    unsigned int v49 = v28;
    double v32 = [v8 place];

    if (v27 < minimumHometownDistanceThreshold || v32 == 0) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = v30;
    }
    [v8 setIsAggregatedAndSuppressed:v34];
    v35 = [v8 place];
    id v36 = [v35 placeName];
    [v8 setPromptLanguage:v36];

    uint64_t v37 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      long long v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      double v39 = v47 = v9;
      [v8 suggestionID];
      CFStringRef v40 = v48 = v18;
      if (v34) {
        CFStringRef v41 = @"suppressed";
      }
      else {
        CFStringRef v41 = @"created";
      }
      double v42 = [v8 promptLanguage];
      unsigned __int8 v43 = [v42 mask];
      double minimumDurationThreshold = self->_minimumDurationThreshold;
      unint64_t minimumDayCountThreshold = self->_minimumDayCountThreshold;
      double minimumHometownDistanceForTripThreshold = self->_minimumHometownDistanceForTripThreshold;
      *(_DWORD *)buf = 138414850;
      uint64_t v53 = v39;
      __int16 v54 = 2112;
      uint64_t v55 = v40;
      __int16 v56 = 2112;
      CFStringRef v57 = v41;
      __int16 v58 = 2112;
      uint64_t v59 = v43;
      __int16 v60 = 2048;
      double v61 = v20;
      __int16 v62 = 2048;
      double v63 = minimumDurationThreshold;
      __int16 v64 = 2048;
      unint64_t v65 = v50;
      __int16 v66 = 2048;
      unint64_t v67 = minimumDayCountThreshold;
      __int16 v68 = 2048;
      double v69 = v27;
      __int16 v70 = 2048;
      double v71 = minimumHometownDistanceForTripThreshold;
      __int16 v72 = 2048;
      uint64_t v73 = v49;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@: trip, suggestionId : %@ is %@, label, %@, durationOfTrip, %f (>= %f), dayCount, %lu (>= %lu), distanceToHome, %f (>= %f), containsInterestingPOI, %lu", buf, 0x70u);

      uint64_t v18 = v48;
      id v9 = v47;
    }

    id v10 = (id)v18;
  }
}

- (id)createTripWithVisitEvent:(id)a3
{
  id v3 = a3;
  id v4 = [MOEventBundle alloc];
  id v5 = +[NSUUID UUID];
  id v6 = +[NSDate date];
  id v7 = [(MOEventBundle *)v4 initWithBundleIdentifier:v5 creationDate:v6];

  [(MOEventBundle *)v7 setInterfaceType:13];
  [(MOEventBundle *)v7 setBundleSuperType:1];
  [(MOEventBundle *)v7 setBundleSubType:105];
  [(MOEventBundle *)v7 setSummarizationGranularity:2];
  id v14 = v3;
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  [(MOEventBundle *)v7 setEvents:v8];

  id v9 = [v3 startDate];
  [(MOEventBundle *)v7 setStartDate:v9];

  id v10 = [v3 endDate];
  [(MOEventBundle *)v7 setEndDate:v10];

  id v11 = [v3 endDate];

  id v12 = [v11 dateByAddingTimeInterval:2419200.0];
  [(MOEventBundle *)v7 setExpirationDate:v12];

  [(MOEventBundle *)v7 setIsAggregatedAndSuppressed:1];
  [(MOEventBundle *)v7 setPromptLanguage:@"A place holder for a trip"];

  return v7;
}

- (void)addVisitEvent:(id)a3 toTripBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v6 events];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
      id v13 = [v5 eventIdentifier];
      id v14 = [v12 eventIdentifier];
      unsigned __int8 v15 = [v13 isEqual:v14];

      if (v15) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v16 = [v6 events];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v18 = [v6 events];
    id v7 = v18;
    if ((isKindOfClass & 1) == 0)
    {
      id v19 = [v18 mutableCopy];

      id v7 = v19;
    }
    [v7 addObject:v5];
    [v6 setEvents:v7];
    double v20 = [v5 endDate];
    [v6 setEndDate:v20];
  }
}

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)getTripEventBundles:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 13];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)getContextEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 2];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)resourceFromWorkoutEvent:(id)a3
{
  id v3 = a3;
  if ([v3 provider] == (id)1
    && ([v3 workoutType], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v5 = objc_opt_new();
    id v6 = [v3 startDate];
    [v6 timeIntervalSince1970];
    id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v7 forKey:@"MOWorkoutMetaDataKeyStartDate"];

    id v8 = [v3 endDate];
    [v8 timeIntervalSince1970];
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v9 forKey:@"MOWorkoutMetaDataKeyEndDate"];

    id v10 = [v3 workoutType];
    [v5 setObject:v10 forKey:@"MOWorkoutMetaDataKeyActivityType"];

    uint64_t v11 = [v3 workoutEvent];
    id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isIndoors]);
    [v5 setObject:v12 forKey:@"MOWorkoutMetaDataKeyIsIndoors"];

    id v13 = [v3 identifierFromProvider];

    if (v13)
    {
      id v14 = [v3 identifierFromProvider];
      [v5 setObject:v14 forKey:@"MOWorkoutMetaDataKeyWorkoutID"];
    }
    unsigned __int8 v15 = [[MOResource alloc] initWithName:@"Workout" type:10 dict:v5 value:0.0];
    id v16 = [v3 eventIdentifier];
    [(MOResource *)v15 setSourceEventIdentifier:v16];
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)hometownReferenceLocations
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__4;
  double v20 = __Block_byref_object_dispose__4;
  id v21 = (id)objc_opt_new();
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(MOTripAnnotationManager *)self routineManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke;
  v13[3] = &unk_1002CA350;
  unsigned __int8 v15 = &v16;
  v13[4] = self;
  id v5 = v3;
  id v14 = v5;
  [v4 fetchLocationsOfInterestOfType:0 withHandler:v13];

  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOTripAnnotationManager.m", 710, "-[MOTripAnnotationManager hometownReferenceLocations]");
  id v12 = 0;
  BOOL v7 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v5, &v12, v6, 30.0);
  id v8 = v12;
  if (!v7)
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(MOTripAnnotationManager *)(uint64_t)v6 hometownReferenceLocations];
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v11 = [v9 location:v16];
        [v10 addObject:v11];

        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v16;
          uint64_t v25 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "trip manager howmtown reference location, %@", buf, 0xCu);
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }
  id v13 = [*(id *)(a1 + 32) routineManager];
  id v14 = +[NSDate distantPast];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke_293;
  v18[3] = &unk_1002CA328;
  v18[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 40);
  id v15 = (id)v17;
  long long v19 = v17;
  [v13 fetchLocationsOfInterestVisitedSinceDate:v14 withHandler:v18];
}

void __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke_293(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 138412290;
    long long v18 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", v18) == (id)1)
        {
          id v10 = *(void **)(a1 + 32);
          uint64_t v11 = [v9 location];
          [v10 distanceFromLocation:v11 hometownReferenceLocations:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          double v13 = v12;

          [*(id *)(a1 + 32) maximumCommuteDistanceForTripThreshold];
          if (v13 < v14)
          {
            id v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            long long v16 = [v9 location];
            [v15 addObject:v16];
          }
          long long v17 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            long long v24 = v9;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "trip manager howmtown reference location, %@", buf, 0xCu);
          }
        }
        if (![v9 type]) {
          [*(id *)(a1 + 32) setupSummaryTripMonitorWithHomeLOI:v9];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (double)distanceFromLocation:(id)a3 hometownReferenceLocations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5
    && (long long v17 = 0u,
        long long v18 = 0u,
        long long v15 = 0u,
        long long v16 = 0u,
        (id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16]) != 0))
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    double v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 distanceFromLocation:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v13 < v11) {
          double v11 = v13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 1.79769313e308;
  }

  return v11;
}

- (double)maxDistanceFromEvent:(id)a3 events:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 location];

  if (v7 && [v6 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      double v12 = 0.0;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v15 = [v5 location:v20];
          long long v16 = [v14 location];
          [v15 distanceFromLocation:v16];
          double v18 = v17;

          if (v18 > v12) {
            double v12 = v18;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = 0.0;
    }
  }
  else
  {
    double v12 = 1.79769313e308;
  }

  return v12;
}

- (double)distanceFromEvent:(id)a3 trip:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 location];

  double v8 = 1.79769313e308;
  if (v6 && v7)
  {
    id v9 = [v6 events];
    if ([v9 count])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v22;
        double v8 = 1.79769313e308;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            long long v16 = [v5 location:v21];
            double v17 = [v15 location];
            [v16 distanceFromLocation:v17];
            double v19 = v18;

            if (v19 < v8) {
              double v8 = v19;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }
      else
      {
        double v8 = 1.79769313e308;
      }
    }
    else
    {
      double v8 = 1.79769313e308;
    }
  }
  return v8;
}

- (BOOL)inSameCityOfEvent:(id)a3 trip:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = @"aboveDoorShortAddress";
  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
    id v10 = +[NSString stringWithFormat:@"%@_%@", @"addressFormatting", @"formatOption"];
    uint64_t v11 = [(MOConfigurationManagerBase *)configurationManager getStringSettingForKey:v10 withFallback:v8];

    double v8 = (__CFString *)v11;
  }
  id v12 = [v6 formatLocalityWithFormatOption:v8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v7 events];
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        double v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v17 category] == (id)1)
        {
          double v18 = [v17 formatLocalityWithFormatOption:v8];
          unsigned __int8 v19 = [v12 isEqualToString:v18];

          if (v19)
          {
            LOBYTE(v14) = 1;
            goto LABEL_14;
          }
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v14;
}

- (BOOL)isSameDayOfEvent:(id)a3 trip:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 dateInterval];
  double v8 = [v5 startDate];
  id v9 = [v7 endDate];
  if ([v8 isBeforeDate:v9])
  {
    id v10 = [v5 endDate];
    uint64_t v11 = [v7 startDate];
    unsigned __int8 v12 = [v10 isAfterDate:v11];

    if (v12)
    {
      unsigned __int8 v13 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = [v6 events];
  uint64_t v15 = [v14 lastObject];

  long long v16 = [v6 time];
  double v17 = [v16 timeZone];

  if (v17)
  {
    id v18 = objc_alloc((Class)NSTimeZone);
    unsigned __int8 v19 = [v6 time];
    long long v20 = [v19 timeZone];
    id v21 = [v18 initWithName:v20];
  }
  else
  {
    id v21 = 0;
  }
  long long v22 = [v5 startDate];
  long long v23 = [v15 endDate];
  unsigned __int8 v13 = [v22 isSameDayWithDate:v23 timeZone:v21];

LABEL_9:
  return v13;
}

- (double)durationOfTrip:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [a3 events];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 category] == (id)1)
        {
          lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
          unsigned __int8 v12 = [v10 poiCategory];
          LOBYTE(lessInterestingPoiCategories) = [(NSSet *)lessInterestingPoiCategories containsObject:v12];

          if ((lessInterestingPoiCategories & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            id v14 = [v10 poiCategory];
            LOBYTE(airportCategories) = [(NSSet *)airportCategories containsObject:v14];

            if ((airportCategories & 1) == 0)
            {
              [v10 duration];
              double v8 = v8 + v15;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (unint64_t)visitCountInTrip:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [a3 events];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 category] == (id)1)
        {
          lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
          unsigned __int8 v12 = [v10 poiCategory];
          LOBYTE(lessInterestingPoiCategories) = [(NSSet *)lessInterestingPoiCategories containsObject:v12];

          if ((lessInterestingPoiCategories & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            id v14 = [v10 poiCategory];
            LODWORD(airportCategories) = [(NSSet *)airportCategories containsObject:v14];

            v7 += airportCategories ^ 1;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)containInterestingCategoryInTrip:(id)a3
{
  [(MOTripAnnotationManager *)self interestingPOIDurationInTrip:a3];
  return v3 > 0.0;
}

- (double)interestingPOIDurationInTrip:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [a3 events];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 category] == (id)1)
        {
          interestingPoiCategories = self->_interestingPoiCategories;
          unsigned __int8 v12 = [v10 poiCategory];
          LODWORD(interestingPoiCategories) = [(NSSet *)interestingPoiCategories containsObject:v12];

          if (interestingPoiCategories)
          {
            [v10 duration];
            double v8 = v8 + v13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)nonInterestingPOIDurationInTrip:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [a3 events];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 category] == (id)1)
        {
          lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
          unsigned __int8 v12 = [v10 poiCategory];
          LOBYTE(lessInterestingPoiCategories) = [(NSSet *)lessInterestingPoiCategories containsObject:v12];

          if ((lessInterestingPoiCategories & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            id v14 = [v10 poiCategory];
            LOBYTE(airportCategories) = [(NSSet *)airportCategories containsObject:v14];

            if ((airportCategories & 1) == 0)
            {
              [v10 duration];
              double v8 = v8 + v15;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)dwellTimeOfEvents:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 category] == (id)1)
        {
          [v9 duration];
          double v7 = v7 + v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (unint64_t)dayCountInTrip:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v5 = [v3 time];
  uint64_t v6 = [v5 timeZone];

  if (v6)
  {
    id v7 = objc_alloc((Class)NSTimeZone);
    double v8 = [v3 time];
    id v9 = [v8 timeZone];
    id v10 = [v7 initWithName:v9];

    [v4 setTimeZone:v10];
  }
  id v22 = 0;
  uint64_t v11 = [v3 startDate];
  [v4 rangeOfUnit:16 startDate:&v22 interval:0 forDate:v11];
  id v12 = v22;

  id v21 = 0;
  long long v13 = [v3 endDate];
  [v4 rangeOfUnit:16 startDate:&v21 interval:0 forDate:v13];
  id v14 = v21;

  long long v15 = [v4 components:16 fromDate:v12 toDate:v14 options:0];
  long long v16 = (char *)[v15 day] + 1;
  long long v17 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = [v3 startDate];
    long long v19 = [v3 endDate];
    *(_DWORD *)buf = 138413570;
    long long v24 = v18;
    __int16 v25 = 2112;
    double v26 = v19;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    double v32 = v15;
    __int16 v33 = 2048;
    uint64_t v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "trip manager (annotateBaseEvents) startDate, %@, endDate, %@, day in startDate, %@, day in endDate, %@, diff, %@, dayCount, %lu", buf, 0x3Eu);
  }
  return (unint64_t)v16;
}

- (void)materializeTripBundle:(id)a3 contextEvents:(id)a4 updateWithFilteredEvents:(BOOL)a5
{
  BOOL v77 = a5;
  id v6 = a3;
  id v7 = a4;
  id v79 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  v87 = v6;
  double v8 = [v6 events];
  id v9 = [(MOTripAnnotationManager *)self getBaseEvents:v8];

  id v145 = v79;
  id v10 = +[NSArray arrayWithObjects:&v145 count:1];
  v83 = [v9 sortedArrayUsingDescriptors:v10];

  v80 = [(MOTripAnnotationManager *)self getContextEvents:v7];

  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    id v14 = [v80 count];
    CFStringRef v15 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    if (v77) {
      CFStringRef v15 = @"YES";
    }
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v141 = (uint64_t (*)(uint64_t, uint64_t))v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: Context Events, %lu, updateWithFilteredEvents, %@", buf, 0x20u);
  }
  long long v16 = [v87 time];
  long long v17 = [v16 timeZone];

  if (v17)
  {
    long long v18 = [v87 time];
    long long v19 = [v18 timeZone];
    id v82 = +[NSTimeZone timeZoneWithName:v19];
  }
  else
  {
    id v82 = 0;
  }
  id v90 = [objc_alloc((Class)NSMutableString) initWithString:@"Trip to"];
  long long v20 = [(MOTripAnnotationManager *)self dominantPlaceFromEvents:v83 timeZone:v82];
  v78 = v20;
  if (v20)
  {
    id v81 = v20;
    id v21 = [v81 placeName];
    id v22 = [v21 mask];
    [v90 appendString:v22];

    id obj = &__NSArray0__struct;
  }
  else
  {
    long long v23 = [(MOTripAnnotationManager *)self dominantPlacesFromEvents:v83 timeZone:v82];
    id v81 = [v23 firstObject];
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id obj = v23;
    id v24 = [obj countByEnumeratingWithState:&v130 objects:v144 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v131;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v131 != v25) {
            objc_enumerationMutation(obj);
          }
          __int16 v27 = [*(id *)(*((void *)&v130 + 1) + 8 * i) placeName];
          id v28 = [v27 mask];
          [v90 appendFormat:@"%@, ", v28];
        }
        id v24 = [obj countByEnumeratingWithState:&v130 objects:v144 count:16];
      }
      while (v24);
    }

    if (!v81)
    {
      id v76 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        -[MOTripAnnotationManager materializeTripBundle:contextEvents:updateWithFilteredEvents:]();
      }

      id v81 = 0;
      goto LABEL_53;
    }
  }
  if (!v77)
  {
    __int16 v29 = [v83 firstObject];
    id v30 = [v29 startDate];

    __int16 v31 = [v83 lastObject];
    double v32 = [v31 endDate];

    __int16 v33 = [[MOAction alloc] initWithActionName:@"Visit" actionType:2];
    [v87 setAction:v33];

    uint64_t v34 = [v83 firstObject];
    v35 = [v34 eventIdentifier];
    id v36 = [v87 action];
    [v36 setSourceEventIdentifier:v35];

    uint64_t v37 = [v83 firstObject];
    long long v38 = [v37 startDate];
    double v39 = [(MOAnnotationManager *)self timeZoneManager];
    CFStringRef v40 = +[MOTime timeForDate:v38 timeZoneManager:v39];
    [v87 setTime:v40];

    [v87 setEvents:v83];
    [v87 setPropertiesBasedOnEvents];
    [v87 setStartDate:v30];
    [v87 setEndDate:v32];
    CFStringRef v41 = [v32 dateByAddingTimeInterval:2419200.0];
    [v87 setExpirationDate:v41];
  }
  id v42 = [v90 copy];
  [v87 setPromptLanguage:v42];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v141 = __Block_byref_object_copy__4;
  __int16 v142 = __Block_byref_object_dispose__4;
  id v143 = 0;
  uint64_t v124 = 0;
  long long v125 = &v124;
  uint64_t v126 = 0x3032000000;
  long long v127 = __Block_byref_object_copy__4;
  long long v128 = __Block_byref_object_dispose__4;
  id v129 = 0;
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3032000000;
  uint64_t v121 = __Block_byref_object_copy__4;
  uint64_t v122 = __Block_byref_object_dispose__4;
  id v123 = 0;
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472;
  v117[2] = __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke;
  v117[3] = &unk_1002CA378;
  v117[4] = &v118;
  v117[5] = buf;
  v117[6] = &v124;
  [(MOTripAnnotationManager *)self resourcesFromEvents:v83 handler:v117];
  [v87 setResources:v119[5]];
  id v85 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v86 = v80;
  id v43 = [v86 countByEnumeratingWithState:&v113 objects:v139 count:16];
  if (v43)
  {
    uint64_t v88 = *(void *)v114;
    double v44 = 201.0;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v114 != v88) {
          objc_enumerationMutation(v86);
        }
        double v46 = *(void **)(*((void *)&v113 + 1) + 8 * (void)j);
        if ([v46 category] == (id)2)
        {
          id v47 = [v46 workoutType];
          BOOL v48 = v47 == 0;

          if (!v48)
          {
            unsigned int v49 = [v46 endDate];
            unint64_t v50 = [v87 startDate];
            unsigned __int8 v51 = [v49 isBeforeDate:v50];

            if ((v51 & 1) == 0)
            {
              double v52 = [v46 startDate];
              uint64_t v53 = [v87 endDate];
              unsigned __int8 v54 = [v52 isAfterDate:v53];

              if (v54) {
                goto LABEL_47;
              }
              long long v111 = 0u;
              long long v112 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              uint64_t v55 = [v87 events];
              id v56 = [v55 countByEnumeratingWithState:&v109 objects:v138 count:16];
              if (v56)
              {
                uint64_t v57 = *(void *)v110;
                while (2)
                {
                  for (k = 0; k != v56; k = (char *)k + 1)
                  {
                    if (*(void *)v110 != v57) {
                      objc_enumerationMutation(v55);
                    }
                    uint64_t v59 = *(void **)(*((void *)&v109 + 1) + 8 * (void)k);
                    __int16 v60 = [v46 eventIdentifier];
                    double v61 = [v59 eventIdentifier];
                    unsigned __int8 v62 = [v60 isEqual:v61];

                    if (v62)
                    {

                      goto LABEL_39;
                    }
                  }
                  id v56 = [v55 countByEnumeratingWithState:&v109 objects:v138 count:16];
                  if (v56) {
                    continue;
                  }
                  break;
                }
              }

              [v87 addEvent:v46];
LABEL_39:
              double v63 = [v46 eventIdentifier];
              unsigned __int8 v64 = [v85 containsObject:v63];

              if ((v64 & 1) == 0)
              {
                unint64_t v65 = [(MOTripAnnotationManager *)self resourceFromWorkoutEvent:v46];
                __int16 v66 = v65;
                if (v65)
                {
                  [v65 setPriorityScore:v44];
                  [v87 addResource:v66];
                  unint64_t v67 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                  {
                    __int16 v68 = (objc_class *)objc_opt_class();
                    double v69 = NSStringFromClass(v68);
                    *(_DWORD *)long long v134 = 138412802;
                    *(void *)&v134[4] = v69;
                    *(_WORD *)&v134[12] = 2112;
                    *(void *)&v134[14] = v46;
                    *(_WORD *)&v134[22] = 2112;
                    long long v135 = (uint64_t (*)(uint64_t, uint64_t))v87;
                    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%@: add to context event %@ to trip, %@", v134, 0x20u);
                  }
                  __int16 v70 = [v46 eventIdentifier];
                  [v85 addObject:v70];

                  double v44 = v44 + 1.0;
                }
              }
            }
          }
        }
      }
      id v43 = [v86 countByEnumeratingWithState:&v113 objects:v139 count:16];
    }
    while (v43);
  }
LABEL_47:

  *(void *)long long v134 = 0;
  *(void *)&v134[8] = v134;
  *(void *)&v134[16] = 0x3032000000;
  long long v135 = __Block_byref_object_copy__4;
  v136 = __Block_byref_object_dispose__4;
  id v137 = (id)objc_opt_new();
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  uint64_t v108 = 0;
  uint64_t v99 = 0;
  id v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__4;
  v103 = __Block_byref_object_dispose__4;
  id v104 = (id)objc_opt_new();
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__4;
  id v97 = __Block_byref_object_dispose__4;
  id v98 = (id)objc_opt_new();
  v92.receiver = self;
  v92.super_class = (Class)MOTripAnnotationManager;
  double v71 = [(MOAnnotationManager *)&v92 fUniverse];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke_324;
  v91[3] = &unk_1002CA3A0;
  v91[4] = v134;
  v91[5] = &v105;
  v91[6] = &v99;
  v91[7] = buf;
  v91[8] = &v93;
  +[MOContextAnnotationUtilities addPhotoResourcesWithDateArray:v87 universe:v71 handler:v91];

  id v72 = [(MOTripAnnotationManager *)self _assignPriorityScoreForPlace:v125[5] placeInfoArray:v94[5]];
  [(MOTripAnnotationManager *)self _assignPriorityScoreForPhotoResources:*(void *)(*(void *)&v134[8] + 40)];
  [v87 setPlace:v81];
  if (v125[5])
  {
    uint64_t v73 = [obj arrayByAddingObjectsFromArray:];
    [v87 setPlaces:v73];
  }
  else
  {
    [v87 setPlaces:obj];
  }
  [v87 setResources:*(void *)(*(void *)&v134[8] + 40)];
  [v87 setPhotoSource:v106[3]];
  id v74 = [(id)v100[5] copy];
  [v87 setPhotoTraits:v74];

  id v75 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
    -[MOTripAnnotationManager materializeTripBundle:contextEvents:updateWithFilteredEvents:]();
  }

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(v134, 8);

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v124, 8);

  _Block_object_dispose(buf, 8);
LABEL_53:
}

void __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v10 count])
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  }
  if ([v8 count]) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
}

void __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke_324(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v45 = a2;
  id v40 = a4;
  id v42 = a7;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  double v44 = a1;
  id obj = *(id *)(*(void *)(a1[7] + 8) + 40);
  id v46 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v46)
  {
    uint64_t v43 = *(void *)v58;
    CFStringRef v12 = @"kMOPlaceStartDate";
    do
    {
      for (i = 0; i != v46; i = (char *)i + 1)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(obj);
        }
        id v14 = [*(id *)(*((void *)&v57 + 1) + 8 * i) mutableCopy];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v15 = v45;
        id v16 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v16)
        {
          id v17 = v16;
          id v47 = i;
          id v48 = v14;
          unint64_t v51 = 0;
          uint64_t v52 = 0;
          uint64_t v18 = *(void *)v54;
          float v19 = 0.0;
          long long v20 = v42;
          uint64_t v49 = *(void *)v54;
          id v50 = v15;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v54 != v18) {
                objc_enumerationMutation(v15);
              }
              id v22 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
              if ([v22 type] == (id)2)
              {
                long long v23 = [v20 objectAtIndex:v52];
                [v14 objectForKeyedSubscript:v12];
                CFStringRef v24 = v12;
                v26 = uint64_t v25 = v20;
                if ([v23 isOnOrAfter:v26])
                {
                  __int16 v27 = [v14 objectForKeyedSubscript:@"kMOPlaceEndDate"];
                  unsigned int v28 = [v23 isOnOrBefore:v27];

                  if (v28)
                  {
                    __int16 v29 = [v22 photoCurationScore];
                    if (v29)
                    {
                      id v30 = [v22 photoCurationScore];
                      [v30 floatValue];
                      float v19 = v19 + v31;
                    }
                    else
                    {
                      float v19 = v19 + 0.5;
                    }
                    double v32 = v25;
                    CFStringRef v12 = @"kMOPlaceStartDate";
                    id v14 = v48;

                    id v15 = v50;
                    ++v51;
                    uint64_t v18 = v49;
                    long long v20 = v32;
                  }
                  else
                  {
                    long long v20 = v25;
                    CFStringRef v12 = @"kMOPlaceStartDate";
                    id v14 = v48;
                    uint64_t v18 = v49;
                    id v15 = v50;
                  }
                }
                else
                {

                  long long v20 = v25;
                  CFStringRef v12 = v24;
                }
                ++v52;
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
          }
          while (v17);

          if (v51) {
            float v19 = v19 / (float)v51;
          }
          i = v47;
        }
        else
        {

          float v19 = 0.0;
        }
        *(float *)&double v33 = v19;
        uint64_t v34 = +[NSNumber numberWithFloat:v33];
        [v14 setObject:v34 forKey:@"kPhotoCurationScore"];

        v35 = [v14 objectForKeyedSubscript:@"kMOPlaceEndDate"];
        id v36 = [v14 objectForKeyedSubscript:v12];
        [v35 timeIntervalSinceDate:v36];
        double v38 = v37;

        double v39 = +[NSNumber numberWithDouble:v38];
        [v14 setObject:v39 forKey:@"kEventDwellDuration"];

        [v14 removeObjectForKey:v12];
        [v14 removeObjectForKey:@"kMOPlaceEndDate"];
        [*(id *)(*(void *)(v44[8] + 8) + 40) addObject:v14];
      }
      id v46 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v46);
  }
}

- (id)_assignPriorityScoreForPlace:(id)a3 placeInfoArray:(id)a4
{
  id v6 = a3;
  uint64_t v43 = [(MOTripAnnotationManager *)self _filterPlaceUsingPredicates:a4];
  id v40 = v6;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = [v6 mutableCopy];
  id v44 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v56;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v56 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v7;
        id v8 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
        [v8 setPriorityScore:20000.0];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v9 = v43;
        id v10 = [v9 countByEnumeratingWithState:&v51 objects:v70 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v52;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v52 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              id v15 = [v14 allKeys];
              id v16 = [v15 objectAtIndexedSubscript:0];

              id v17 = [v8 identifier];
              uint64_t v18 = [v17 UUIDString];
              unsigned int v19 = [v18 isEqualToString:v16];

              if (v19)
              {
                long long v20 = [v14 objectForKeyedSubscript:v16];
                [v8 setPriorityScore:([v20 unsignedIntValue])];

                goto LABEL_16;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v51 objects:v70 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        uint64_t v7 = v45 + 1;
      }
      while ((id)(v45 + 1) != v44);
      id v44 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v44);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v21 = obj;
  id v22 = [v21 countByEnumeratingWithState:&v47 objects:v69 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v48;
    uint64_t v25 = &MOLogFacilityTripAnnotationManager;
    do
    {
      double v26 = 0;
      id v46 = v23;
      do
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        __int16 v27 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v26);
        unsigned int v28 = _mo_log_facility_get_os_log(v25);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          __int16 v29 = [v27 identifier];
          id v30 = [v29 UUIDString];
          [v27 placeName];
          uint64_t v31 = v24;
          double v32 = v25;
          v34 = id v33 = v21;
          [v27 priorityScore];
          uint64_t v36 = v35;
          double v37 = [v27 startDate];
          double v38 = [v27 endDate];
          *(_DWORD *)buf = 138413314;
          long long v60 = v30;
          __int16 v61 = 2112;
          unsigned __int8 v62 = v34;
          __int16 v63 = 2048;
          uint64_t v64 = v36;
          __int16 v65 = 2112;
          __int16 v66 = v37;
          __int16 v67 = 2112;
          __int16 v68 = v38;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "_assignPriorityScoreForPlace:MOPlace id is:%@, name is %@, priorityscore:%f, startdate:%@ enddate:%@", buf, 0x34u);

          id v21 = v33;
          uint64_t v25 = v32;
          uint64_t v24 = v31;
          id v23 = v46;
        }
        double v26 = (char *)v26 + 1;
      }
      while (v23 != v26);
      id v23 = [v21 countByEnumeratingWithState:&v47 objects:v69 count:16];
    }
    while (v23);
  }

  return v21;
}

- (void)_assignPriorityScoreForPhotoResources:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"type = %lu", 2];
  id v5 = [v3 filteredArrayUsingPredicate:v4];
  if ([v5 count])
  {
    id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
    id v21 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v21 count:1];
    id v8 = [v5 sortedArrayUsingDescriptors:v7];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v9);
          }
          double v15 = (double)((unint64_t)i + v12 + 300);
          if (!((char *)i + v12)) {
            double v15 = 100.0;
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) setPriorityScore:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v12 += (uint64_t)i;
      }
      while (v11);
    }
  }
}

- (id)_filterPlaceUsingPredicates:(id)a3
{
  id v5 = a3;
  if (![(id)interestingPOIcategories count])
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOTripAnnotationManager _filterPlaceUsingPredicates:](v6);
    }

    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOTripAnnotationManager.m" lineNumber:1124 description:@"_filterPlaceUsingPredicates: interestingPOIcategories is empty (in %s:%d)", "-[MOTripAnnotationManager _filterPlaceUsingPredicates:]", 1124];
  }
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__4;
  id v30 = __Block_byref_object_dispose__4;
  uint64_t v8 = 0;
  id v31 = (id)objc_opt_new();
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  do
  {
    switch(v8)
    {
      case 0:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore != 0 AND (kEventDwellDuration >= %f) AND kMOPlacePOICategory IN %@", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kPhotoCurationScore" ascending:0];
        uint64_t v11 = 200;
        goto LABEL_17;
      case 1:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore != 0 AND (kEventDwellDuration < %f) AND kMOPlacePOICategory IN %@", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kPhotoCurationScore" ascending:0];
        goto LABEL_14;
      case 2:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore == 0 AND (kEventDwellDuration >= %f) AND kMOPlacePOICategory IN %@", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kEventDwellDuration" ascending:0];
        goto LABEL_14;
      case 3:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore == 0 AND (kEventDwellDuration < %f) AND kMOPlacePOICategory IN %@", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kEventDwellDuration" ascending:0];
        goto LABEL_14;
      case 4:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore != 0 AND (kEventDwellDuration >= %f) AND NOT (kMOPlacePOICategory IN %@)", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kPhotoCurationScore" ascending:0];
        uint64_t v11 = 202;
        goto LABEL_17;
      case 5:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore != 0 AND (kEventDwellDuration < %f) AND NOT (kMOPlacePOICategory IN %@)", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kPhotoCurationScore" ascending:0];
LABEL_14:
        id v10 = v12;
        break;
      case 6:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore == 0 AND (kEventDwellDuration >= %f) AND NOT (kMOPlacePOICategory IN %@)", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kEventDwellDuration" ascending:0];
        uint64_t v11 = 300;
        goto LABEL_17;
      case 7:
        id v9 = +[NSPredicate predicateWithFormat:@"kPhotoCurationScore == 0 AND (kEventDwellDuration < %f) AND NOT (kMOPlacePOICategory IN %@)", *(void *)&self->_minimumDwellTime, interestingPOIcategories];
        id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"kPhotoCurationScore" ascending:0];
        uint64_t v11 = 20000;
LABEL_17:
        v23[3] = v11;
        break;
      default:
        id v10 = 0;
        id v9 = 0;
        break;
    }
    uint64_t v13 = [v5 filteredArrayUsingPredicate:v9];
    id v36 = v10;
    id v14 = +[NSArray arrayWithObjects:&v36 count:1];
    double v15 = [v13 sortedArrayUsingDescriptors:v14];

    if ([v15 count])
    {
      long long v16 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = v23[3];
        *(_DWORD *)buf = 138412546;
        id v33 = v15;
        __int16 v34 = 2048;
        uint64_t v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "_filterPlaceUsingPredicates:sorted array is %@ and start priority score is %lu", buf, 0x16u);
      }

      uint64_t v18 = v23[3];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __55__MOTripAnnotationManager__filterPlaceUsingPredicates___block_invoke;
      v21[3] = &unk_1002CA3C8;
      v21[4] = &v26;
      v21[5] = &v22;
      [(MOTripAnnotationManager *)self _updateMOPlacePriorityScore:v15 priorityScore:v18 handler:v21];
    }

    ++v8;
  }
  while (v8 != 8);
  id v19 = [(id)v27[5] copy];
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v19;
}

id __55__MOTripAnnotationManager__filterPlaceUsingPredicates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return result;
}

- (void)_updateMOPlacePriorityScore:(id)a3 priorityScore:(unint64_t)a4 handler:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, id, unint64_t))a5;
  id v9 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    id v19 = v8;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v15 = objc_opt_new();
        long long v16 = +[NSNumber numberWithUnsignedInteger:(char *)i + a4];
        uint64_t v17 = [v14 objectForKeyedSubscript:@"kMOPlaceUUID"];
        [v15 setObject:v16 forKey:v17];

        [v9 addObject:v15];
      }
      id v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      a4 += (unint64_t)i;
    }
    while (v11);
    uint64_t v8 = v19;
  }

  id v18 = [v9 copy];
  v8[2](v8, v18, a4);
}

- (id)placeNameOfEvent:(id)a3 addressFormatOption:(id)a4 countryMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v5) {
    [v7 formatCountryWithFormatOption:v8];
  }
  else {
  id v9 = [v7 formatLocalityWithFormatOption:v8];
  }
  if (!v9)
  {
    id v9 = [v7 formatAdministrativeAreaWithFormatOption:v8];
    if (!v9)
    {
      id v9 = [v7 placeName];
    }
  }

  return v9;
}

- (id)dominantPlaceFromEvents:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOTripAnnotationManager *)self dominantInterestingPOIFromEvents:v6 timeZone:v7];
  if (!v8)
  {
    id v8 = [(MOTripAnnotationManager *)self dominantPOIFormEvents:v6 timeZone:v7];
  }

  return v8;
}

- (id)dominantInterestingPOIFromEvents:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v83 = a4;
  v84 = objc_opt_new();
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v93 objects:v113 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v82 = 0;
    uint64_t v10 = *(void *)v94;
    double v11 = 0.0;
    uint64_t v12 = &OBJC_IVAR___MOTrendAnnotationManager__configurationManager;
    id v81 = v7;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v94 != v10) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v13);
        double v15 = [v14 placeName];
        if (v15)
        {
          long long v16 = *(Class *)((char *)&self->super.super.isa + v12[120]);
          uint64_t v17 = [v14 poiCategory];
          LOBYTE(v16) = [v16 containsObject:v17];

          if ((v16 & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            id v19 = [v14 poiCategory];
            LOBYTE(airportCategories) = [(NSSet *)airportCategories containsObject:v19];

            if ((airportCategories & 1) == 0)
            {
              [v14 weightedDurationWithTimeZone:v83 overnightStartDateHour:self->_overnightStartDateHour overnightDurationHours:self->_overnightDurationHours overnightDurationWeight:self->_overnightDurationWeight];
              double v21 = v20;
              interestingPoiCategories = self->_interestingPoiCategories;
              long long v23 = [v14 poiCategory];
              unsigned int v24 = [(NSSet *)interestingPoiCategories containsObject:v23];

              uint64_t v25 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(double *)&CFStringRef v30 = COERCE_DOUBLE(@"NO");
                if (v24) {
                  *(double *)&CFStringRef v30 = COERCE_DOUBLE(@"YES");
                }
                CFStringRef v79 = v30;
                [v14 duration];
                double v32 = v31;
                v78 = [v14 poiCategory];
                v80 = [v14 routineEvent];
                id v33 = [v80 poiCategory];
                __int16 v34 = [(MOTripAnnotationManager *)self addressFormatOption];
                BOOL v77 = [v14 formatLocalityWithFormatOption:v34];
                *(_DWORD *)buf = 138413826;
                id v100 = v15;
                __int16 v101 = 2112;
                double v102 = *(double *)&v79;
                __int16 v103 = 2048;
                double v104 = v32;
                __int16 v105 = 2048;
                double v106 = v21;
                __int16 v107 = 2112;
                uint64_t v108 = v78;
                __int16 v109 = 2112;
                long long v110 = v33;
                __int16 v111 = 2112;
                long long v112 = v77;
                _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "trip manager (dominantInterestingPOIFromEvents), the dominant name, %@, interesting, %@, duration, %f, weighted duration, %f, category, %@ -%@, city, %@", buf, 0x48u);

                uint64_t v12 = &OBJC_IVAR___MOTrendAnnotationManager__configurationManager;
              }
              double v11 = v11 + v21;

              if (v24)
              {
                uint64_t v26 = [v84 objectForKey:v15];
                __int16 v27 = v26;
                id v7 = v81;
                if (v26)
                {
                  [v26 doubleValue];
                  double v21 = v21 + v28;
                }
                ++v82;
                __int16 v29 = +[NSNumber numberWithDouble:v21];
                [v84 setObject:v29 forKey:v15];

                uint64_t v12 = &OBJC_IVAR___MOTrendAnnotationManager__configurationManager;
              }
              else
              {
                id v7 = v81;
              }
            }
          }
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      id v35 = [v7 countByEnumeratingWithState:&v93 objects:v113 count:16];
      id v9 = v35;
    }
    while (v35);

    if (!v82)
    {
      long long v48 = 0;
      goto LABEL_64;
    }
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v36 = v84;
    id v37 = [v36 countByEnumeratingWithState:&v89 objects:v98 count:16];
    if (v37)
    {
      id v38 = v37;
      double v39 = 0;
      uint64_t v40 = *(void *)v90;
      double v41 = -1.0;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v90 != v40) {
            objc_enumerationMutation(v36);
          }
          uint64_t v43 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          id v44 = [v36 objectForKey:v43];
          [v44 doubleValue];
          double v46 = v45;

          if (v46 > v41)
          {
            id v47 = v43;

            double v41 = v46;
            double v39 = v47;
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v89 objects:v98 count:16];
      }
      while (v38);
    }
    else
    {
      double v39 = 0;
      double v41 = -1.0;
    }

    if (v11 <= 0.0) {
      double v49 = 0.0;
    }
    else {
      double v49 = v41 / v11;
    }
    long long v50 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      id v75 = [v39 mask];
      double minimumDominancyRatioForInterestingPOITripThreshold = self->_minimumDominancyRatioForInterestingPOITripThreshold;
      *(_DWORD *)buf = 138412802;
      id v100 = v75;
      __int16 v101 = 2048;
      double v102 = v49;
      __int16 v103 = 2048;
      double v104 = minimumDominancyRatioForInterestingPOITripThreshold;
      _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "trip manager (dominantInterestingPOIFromEvents), the dominant name, %@, ratio, %f, threshold, %f", buf, 0x20u);
    }
    id v7 = v81;
    if (v49 <= self->_minimumDominancyRatioForInterestingPOITripThreshold)
    {
      long long v48 = 0;
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v51 = v81;
      id v52 = [v51 countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v86;
LABEL_43:
        uint64_t v55 = 0;
        while (1)
        {
          if (*(void *)v86 != v54) {
            objc_enumerationMutation(v51);
          }
          long long v56 = *(void **)(*((void *)&v85 + 1) + 8 * v55);
          long long v57 = [v56 placeName];
          unsigned __int8 v58 = [v39 isEqualToString:v57];

          if (v58) {
            break;
          }
          if (v53 == (id)++v55)
          {
            id v53 = [v51 countByEnumeratingWithState:&v85 objects:v97 count:16];
            if (v53) {
              goto LABEL_43;
            }
            goto LABEL_49;
          }
        }
        id v60 = v56;

        if (v60)
        {
          unsigned __int8 v62 = [(MOTripAnnotationManager *)self addressFormatOption];
          long long v59 = [v60 formatLocalityWithFormatOption:v62];
          int v61 = 0;
          goto LABEL_53;
        }
        long long v59 = 0;
        int v61 = 1;
      }
      else
      {
LABEL_49:
        long long v59 = 0;
        id v60 = 0;
        int v61 = 1;
        unsigned __int8 v62 = v51;
LABEL_53:
      }
      __int16 v63 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        uint64_t v64 = [v39 mask];
        double v65 = [v59 mask];
        *(_DWORD *)buf = 138412546;
        id v100 = v64;
        __int16 v101 = 2112;
        double v102 = v65;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "trip manager (dominantInterestingPOIFromEvents), place name, %@, city name, %@", buf, 0x16u);
      }
      __int16 v66 = [MOPlace alloc];
      __int16 v67 = +[NSUUID UUID];
      if (v61)
      {
        long long v48 = [(MOPlace *)v66 initWithIdentifier:v67 placeName:v39 enclosingArea:0 placeType:3 placeUserType:0 location:0 locationMode:0.0 poiCategory:v49 distanceToHomeInMiles:0.0 placeNameConfidence:-1.0 familiarityIndexLOI:2 priorityScore:0 startDate:0 endDate:0];

        __int16 v68 = [v51 firstObject];
      }
      else
      {
        double v69 = [(MOTripAnnotationManager *)self addressFormatOption];
        __int16 v70 = [v60 formatLocalityWithFormatOption:v69];
        double v71 = [v60 location];
        [v60 familiarityIndexLOI];
        long long v48 = [(MOPlace *)v66 initWithIdentifier:v67 placeName:v39 enclosingArea:v70 placeType:3 placeUserType:0 location:v71 locationMode:0.0 poiCategory:v49 distanceToHomeInMiles:v72 placeNameConfidence:-1.0 familiarityIndexLOI:2 priorityScore:0 startDate:0 endDate:0];

        __int16 v68 = v60;
      }
      uint64_t v73 = [v68 eventIdentifier];
      [(MOPlace *)v48 setSourceEventIdentifier:v73];

      if (v61) {
      id v7 = v81;
      }
    }
  }
  else
  {
    long long v48 = 0;
    double v39 = v7;
  }

LABEL_64:

  return v48;
}

- (id)dominantPOIFormEvents:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v66 = a4;
  id v7 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v77;
    double v11 = 0.0;
    uint64_t v12 = &OBJC_IVAR___MOTrendAnnotationManager__configurationManager;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v77 != v10) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        double v15 = [v14 placeName];
        if (v15)
        {
          long long v16 = *(Class *)((char *)&self->super.super.isa + v12[120]);
          uint64_t v17 = [v14 poiCategory];
          LOBYTE(v16) = [v16 containsObject:v17];

          if ((v16 & 1) == 0)
          {
            [v14 weightedDurationWithTimeZone:v66 overnightStartDateHour:self->_overnightStartDateHour overnightDurationHours:self->_overnightDurationHours overnightDurationWeight:self->_overnightDurationWeight];
            double v19 = v18;
            double v11 = v11 + v18;
            if ([v14 placeType] == (id)2 || objc_msgSend(v14, "placeType") == (id)3)
            {
              double v20 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                [v14 duration];
                double v26 = v25;
                __int16 v27 = [v14 poiCategory];
                double v28 = [v14 routineEvent];
                __int16 v29 = [v28 poiCategory];
                *(_DWORD *)buf = 138413314;
                id v83 = v15;
                __int16 v84 = 2048;
                double v85 = v26;
                __int16 v86 = 2048;
                double v87 = v19;
                __int16 v88 = 2112;
                long long v89 = v27;
                __int16 v90 = 2112;
                long long v91 = v29;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "trip manager (dominantPOIFormEvents), the dominant name, %@, duration, %f, weighted duration, %f, category, %@ -%@", buf, 0x34u);
              }
              double v21 = [v7 objectForKey:v15];
              long long v22 = v21;
              if (v21)
              {
                [v21 doubleValue];
                double v19 = v19 + v23;
              }
              unsigned int v24 = +[NSNumber numberWithDouble:v19];
              [v7 setObject:v24 forKey:v15];

              uint64_t v12 = &OBJC_IVAR___MOTrendAnnotationManager__configurationManager;
            }
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v30 = v7;
  id v31 = [v30 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v31)
  {
    id v32 = v31;
    id v33 = 0;
    uint64_t v34 = *(void *)v73;
    double v35 = -1.0;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v73 != v34) {
          objc_enumerationMutation(v30);
        }
        id v37 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
        id v38 = [v30 objectForKey:v37];
        [v38 doubleValue];
        double v40 = v39;

        if (v40 > v35)
        {
          id v41 = v37;

          double v35 = v40;
          id v33 = v41;
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v32);
  }
  else
  {
    id v33 = 0;
    double v35 = -1.0;
  }

  if (v11 <= 0.0) {
    double v42 = 0.0;
  }
  else {
    double v42 = v35 / v11;
  }
  uint64_t v43 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v64 = [v33 mask];
    double minimumDominancyRatioForSinglePOITripThreshold = self->_minimumDominancyRatioForSinglePOITripThreshold;
    *(_DWORD *)buf = 138412802;
    id v83 = v64;
    __int16 v84 = 2048;
    double v85 = v42;
    __int16 v86 = 2048;
    double v87 = minimumDominancyRatioForSinglePOITripThreshold;
    _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "trip manager (dominantPOIFormEvents), the dominant name, %@, ratio, %f, threshold, %f", buf, 0x20u);
  }
  if (v33 && v42 > self->_minimumDominancyRatioForSinglePOITripThreshold)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v44 = obj;
    id v45 = [v44 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v69;
      while (2)
      {
        for (k = 0; k != v45; k = (char *)k + 1)
        {
          if (*(void *)v69 != v46) {
            objc_enumerationMutation(v44);
          }
          long long v48 = *(void **)(*((void *)&v68 + 1) + 8 * (void)k);
          double v49 = [v48 placeName];
          unsigned int v50 = [v33 isEqualToString:v49];

          if (v50)
          {
            id v45 = v48;
            goto LABEL_48;
          }
        }
        id v45 = [v44 countByEnumeratingWithState:&v68 objects:v80 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }
LABEL_48:

    id v52 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      id v53 = [v33 mask];
      *(_DWORD *)buf = 138412290;
      id v83 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "trip manager (dominantPOIFormEvents), place name, %@", buf, 0xCu);
    }
    uint64_t v54 = [MOPlace alloc];
    uint64_t v55 = +[NSUUID UUID];
    if (v45)
    {
      long long v56 = [(MOTripAnnotationManager *)self addressFormatOption];
      long long v57 = [v45 formatLocalityWithFormatOption:v56];
      unsigned __int8 v58 = [v45 location];
      long long v59 = [v45 poiCategory];
      [v45 familiarityIndexLOI];
      id v51 = [(MOPlace *)v54 initWithIdentifier:v55 placeName:v33 enclosingArea:v57 placeType:3 placeUserType:0 location:v58 locationMode:0.0 poiCategory:v42 distanceToHomeInMiles:v60 placeNameConfidence:-1.0 familiarityIndexLOI:2 priorityScore:v59 startDate:0 endDate:0];

      int v61 = v45;
    }
    else
    {
      id v51 = [(MOPlace *)v54 initWithIdentifier:v55 placeName:v33 enclosingArea:0 placeType:3 placeUserType:0 location:0 locationMode:0.0 poiCategory:v42 distanceToHomeInMiles:0.0 placeNameConfidence:-1.0 familiarityIndexLOI:2 priorityScore:0 startDate:0 endDate:0];

      int v61 = [v44 firstObject];
    }
    unsigned __int8 v62 = [v61 eventIdentifier];
    [(MOPlace *)v51 setSourceEventIdentifier:v62];

    if (!v45) {
  }
    }
  else
  {
    id v51 = 0;
  }

  return v51;
}

- (id)dominantPlacesFromEvents:(id)a3 timeZone:(id)a4
{
  return [(MOTripAnnotationManager *)self dominantPlaceNamesFromEvents:a3 countryMode:0 timeZone:a4];
}

- (id)dominantPlaceNamesFromEvents:(id)a3 countryMode:(BOOL)a4 timeZone:(id)a5
{
  BOOL v88 = a4;
  id v7 = a3;
  id v84 = a5;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    id v99 = [v7 count];
    __int16 v100 = 2048;
    *(void *)&double v101 = v88;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "trip manager (dominantPlaceNameFromEvents), events, %lu, country mode, %lu", buf, 0x16u);
  }

  id v9 = @"aboveDoorShortAddress";
  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
    double v11 = +[NSString stringWithFormat:@"%@_%@", @"addressFormatting", @"formatOption"];
    uint64_t v12 = [(MOConfigurationManagerBase *)configurationManager getStringSettingForKey:v11 withFallback:v9];

    id v9 = (__CFString *)v12;
  }
  long long v89 = objc_opt_new();
  double v85 = objc_opt_new();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v94 objects:v108 count:16];
  __int16 v86 = v13;
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v95;
    do
    {
      uint64_t v17 = 0;
      id v87 = v15;
      do
      {
        if (*(void *)v95 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v17);
        airportCategories = self->_airportCategories;
        double v20 = [v18 poiCategory];
        LOBYTE(airportCategories) = [(NSSet *)airportCategories containsObject:v20];

        if ((airportCategories & 1) == 0)
        {
          double v21 = [(MOTripAnnotationManager *)self placeNameOfEvent:v18 addressFormatOption:v9 countryMode:v88];
          if (v21)
          {
            uint64_t v22 = v16;
            double v23 = v9;
            unsigned int v24 = [v89 objectForKey:v21];
            lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
            double v26 = [v18 poiCategory];
            if ([(NSSet *)lessInterestingPoiCategories containsObject:v26])
            {

              goto LABEL_17;
            }
            __int16 v27 = self->_airportCategories;
            double v28 = [v18 poiCategory];
            LODWORD(v27) = [(NSSet *)v27 containsObject:v28];

            if (v27)
            {
LABEL_17:
              [v18 duration];
              double v30 = v29 * self->_overnightDurationWeight;
            }
            else
            {
              [v18 weightedDurationWithTimeZone:v84 overnightStartDateHour:self->_overnightStartDateHour overnightDurationHours:self->_overnightDurationHours overnightDurationWeight:self->_overnightDurationWeight];
              double v30 = v31;
            }
            id v9 = v23;
            id v13 = v86;
            if (v24)
            {
              uint64_t v16 = v22;
              [v24 doubleValue];
              id v33 = +[NSNumber numberWithDouble:v30 + v32];
              uint64_t v34 = v89;
            }
            else
            {
              double v35 = +[NSNumber numberWithDouble:v30];
              [v89 setObject:v35 forKey:v21];

              uint64_t v16 = v22;
              id v33 = [v18 location];
              uint64_t v34 = v85;
            }
            [v34 setObject:v33 forKey:v21];
            id v15 = v87;
          }
          else
          {
            unsigned int v24 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[MOTripAnnotationManager dominantPlaceNamesFromEvents:countryMode:timeZone:]((uint64_t)v107, (uint64_t)v18);
            }
          }
        }
        uint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v15);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v36 = v89;
  id v37 = [v36 countByEnumeratingWithState:&v90 objects:v106 count:16];
  if (!v37)
  {

    double v40 = 0;
    goto LABEL_52;
  }
  id v38 = v37;
  double v39 = 0;
  double v40 = 0;
  uint64_t v41 = *(void *)v91;
  double v42 = 0.0;
  double v43 = -1.0;
  double v44 = -1.0;
  do
  {
    for (i = 0; i != v38; i = (char *)i + 1)
    {
      if (*(void *)v91 != v41) {
        objc_enumerationMutation(v36);
      }
      uint64_t v46 = *(void **)(*((void *)&v90 + 1) + 8 * i);
      id v47 = [v36 objectForKey:v46];
      [v47 doubleValue];
      double v49 = v48;

      if (v49 <= v43)
      {
        double v51 = v49;
        id v50 = v46;
        if (v49 <= v44) {
          goto LABEL_35;
        }
      }
      else
      {
        id v50 = v39;

        double v40 = v50;
        double v39 = v46;
        double v51 = v43;
        double v43 = v49;
      }
      id v52 = v46;

      double v44 = v51;
      double v40 = v50;
LABEL_35:
      id v53 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v54 = [v46 mask];
        *(_DWORD *)buf = 138412546;
        id v99 = v54;
        __int16 v100 = 2048;
        double v101 = v49;
        _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "trip manager (dominantPlaceNameFromEvents), place, %@, dwell, %f", buf, 0x16u);
      }
      double v42 = v42 + v49;
    }
    id v38 = [v36 countByEnumeratingWithState:&v90 objects:v106 count:16];
  }
  while (v38);

  if (v39)
  {
    BOOL v55 = v42 <= 0.0;
    double v56 = v44 / v42;
    if (v42 > 0.0) {
      double v57 = v43 / v42;
    }
    else {
      double v57 = 0.0;
    }
    if (v55) {
      double v58 = 0.0;
    }
    else {
      double v58 = v56;
    }
    long long v59 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      double v60 = [v39 mask];
      int v61 = [v40 mask];
      *(_DWORD *)buf = 138413058;
      id v99 = v60;
      __int16 v100 = 2048;
      double v101 = v57;
      __int16 v102 = 2112;
      __int16 v103 = v61;
      __int16 v104 = 2048;
      double v105 = v58;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "trip manager (dominantPlaceNameFromEvents), the dominant name, %@, ratio, %f, the second name, %@, ratio, %f", buf, 0x2Au);
    }
    unsigned __int8 v62 = [v85 objectForKey:v39];
    if (v40)
    {
      id v83 = [v85 objectForKey:v40];
    }
    else
    {
      id v83 = 0;
    }
    +[MOContextAnnotationUtilities weightedAverageForObjects:v86 weightPath:@"duration" valuePath:@"familiarityIndexLOI"];
    double v72 = v71;
    long long v73 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      long long v74 = [v39 mask];
      *(_DWORD *)buf = 138412546;
      id v99 = v74;
      __int16 v100 = 2048;
      *(void *)&double v101 = v88;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "trip manager (dominantPlaceNameFromEvents), place name, %@, country mode, %lu", buf, 0x16u);
    }
    long long v75 = objc_opt_new();
    long long v76 = [[MOPlace alloc] initWithPlaceName:v39 placeType:100 placeUserType:0 location:v62 locationMode:2 poiCategory:0 distanceToHomeInMiles:0.0 placeNameConfidence:v57 familiarityIndexLOI:v72];
    [(MOPlace *)v76 setPriorityScore:20000.0];
    [(MOPlace *)v76 setEnclosingArea:v39];
    long long v77 = [v86 firstObject];
    long long v78 = [v77 eventIdentifier];
    [(MOPlace *)v76 setSourceEventIdentifier:v78];

    [v75 addObject:v76];
    if (v40)
    {
      long long v79 = [[MOPlace alloc] initWithPlaceName:v40 placeType:100 placeUserType:0 location:v83 locationMode:2 poiCategory:0 distanceToHomeInMiles:0.0 placeNameConfidence:v58 familiarityIndexLOI:v72];

      [(MOPlace *)v79 setPriorityScore:20000.0];
      [(MOPlace *)v79 setEnclosingArea:v39];
      v80 = [v86 firstObject];
      id v81 = [v80 eventIdentifier];
      [(MOPlace *)v79 setSourceEventIdentifier:v81];

      [v75 addObject:v79];
      long long v76 = v79;
    }
    id v70 = [v75 copy];

    id v13 = v86;
    goto LABEL_61;
  }
  id v13 = v86;
LABEL_52:
  unsigned __int8 v62 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
    -[MOTripAnnotationManager dominantPlaceNamesFromEvents:countryMode:timeZone:](v62, v63, v64, v65, v66, v67, v68, v69);
  }
  double v39 = 0;
  id v70 = &__NSArray0__struct;
LABEL_61:

  return v70;
}

- (void)resourcesFromEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v54 = (void (**)(id, void *, void *, void *))a4;
  id v7 = [(NSSet *)self->_airportCategories setByAddingObjectsFromSet:self->_lessInterestingPoiCategories];
  long long v59 = objc_opt_new();
  double v56 = objc_opt_new();
  BOOL v55 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v60 = *(void *)v62;
    id v57 = v8;
    double v58 = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v62 != v60) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v13 = [v12 routineEvent];
        id v14 = [v13 poiCategory];
        if ([v7 containsObject:v14])
        {

LABEL_9:
          uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_24;
          }
          double v18 = (objc_class *)objc_opt_class();
          double v19 = NSStringFromClass(v18);
          double v20 = [v12 placeName];
          double v21 = [v20 mask];
          uint64_t v22 = [v12 poiCategory];
          double v23 = [v12 routineEvent];
          unsigned int v24 = [v23 poiCategory];
          *(_DWORD *)buf = 138413058;
          uint64_t v66 = v19;
          __int16 v67 = 2112;
          uint64_t v68 = v21;
          __int16 v69 = 2112;
          id v70 = v22;
          __int16 v71 = 2112;
          double v72 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@: supress resource, place, %@, category, %@ (%@)", buf, 0x2Au);

          self = v58;
          id v8 = v57;

LABEL_20:
          goto LABEL_23;
        }
        id v15 = [v12 poiCategory];
        unsigned int v16 = [v7 containsObject:v15];

        if (v16) {
          goto LABEL_9;
        }
        [(MOTripAnnotationManager *)self visitLabelMediumConfidenceThreshold];
        double v26 = v25;
        [(MOTripAnnotationManager *)self visitLabelHighConfidenceThreshold];
        double v28 = v27;
        [(MOTripAnnotationManager *)self aoiVisitLabelConfidentThreshold];
        double v30 = v29;
        double v31 = [(MOAnnotationManager *)self fUniverse];
        uint64_t v17 = +[MOContextAnnotationUtilities placeFromVisitEvent:v12 preferredCategories:0 poiCategoryBlocklist:v7 mediumConfidenceThreshold:v31 highConfidenceThreshold:v26 aoiConfidenceThreshold:v28 universe:v30];

        if (!v17)
        {
          double v19 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            double v44 = (objc_class *)objc_opt_class();
            double v20 = NSStringFromClass(v44);
            *(_DWORD *)buf = 138412546;
            uint64_t v66 = v20;
            __int16 v67 = 2112;
            uint64_t v68 = v12;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@: resourcesFromBaseEvents, place is null, event, %@", buf, 0x16u);
            goto LABEL_20;
          }
LABEL_23:

          goto LABEL_24;
        }
        [v59 addObject:v17];
        double v32 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          double v48 = (objc_class *)objc_opt_class();
          double v49 = NSStringFromClass(v48);
          id v50 = [v17 placeName];
          double v51 = [v50 mask];
          id v52 = [v12 placeMapItem];
          id v53 = [v52 length];
          *(_DWORD *)buf = 138412802;
          uint64_t v66 = v49;
          __int16 v67 = 2112;
          uint64_t v68 = v51;
          __int16 v69 = 2048;
          id v70 = v53;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%@: resourcesFromBaseEvents, place, %@, mapItem.length, %lu", buf, 0x20u);

          id v8 = v57;
          self = v58;
        }
        uint64_t v33 = [v12 placeMapItem];
        if (v33)
        {
          uint64_t v34 = (void *)v33;
          id v35 = [v17 placeUserType];

          if (v35 != (id)2)
          {
            id v36 = [MOResource alloc];
            id v37 = [v17 placeName];
            id v38 = [v12 placeMapItem];
            double v19 = [(MOResource *)v36 initWithName:v37 mapItemHandle:v38 priorityScore:-1.0];

            double v39 = [v12 eventIdentifier];
            [v19 setSourceEventIdentifier:v39];

            [v55 addObject:v19];
            double v40 = objc_opt_new();
            uint64_t v41 = [v17 identifier];
            double v42 = [v41 UUIDString];
            [v40 setObject:v42 forKey:@"kMOPlaceUUID"];

            double v43 = [v17 poiCategory];
            if (v43) {
              [v17 poiCategory];
            }
            else {
            id v45 = +[NSString string];
            }
            self = v58;

            [v40 setObject:v45 forKey:@"kMOPlacePOICategory"];
            uint64_t v46 = [v12 startDate];
            [v40 setObject:v46 forKey:@"kMOPlaceStartDate"];

            id v47 = [v12 endDate];
            [v40 setObject:v47 forKey:@"kMOPlaceEndDate"];

            [v56 addObject:v40];
            id v8 = v57;
            goto LABEL_23;
          }
        }
LABEL_24:
      }
      id v10 = [v8 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v10);
  }

  v54[2](v54, v55, v59, v56);
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 place];
  BOOL v5 = [v4 placeName];

  if (v5)
  {
    id v6 = [v3 place];
    id v7 = [v6 placeName];
    id v8 = +[NSString stringWithFormat:@"Trip to %@", v7];
  }
  else
  {
    id v8 = @"Trip";
  }

  return v8;
}

- (id)loadSummaryTripMonitorFromStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unsigned int v16 = __Block_byref_object_copy__4;
  uint64_t v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  if (v4
    && (v12[0] = _NSConcreteStackBlock,
        v12[1] = 3221225472,
        v12[2] = __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke,
        v12[3] = &unk_1002CA3F0,
        v12[4] = self,
        v12[5] = &v13,
        [v4 fetchFSMWithName:@"SummaryTripMonitor" CompletionHandler:v12],
        v14[5]))
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v14[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "load fsm model, %@", buf, 0xCu);
    }

    id v8 = (MOFSM *)(id)v14[5];
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No existing fsm. Return newmodel.", buf, 2u);
    }

    id v8 = [[MOFSM alloc] initWithName:@"SummaryTripMonitor"];
  }
  id v10 = v8;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke_cold_1(a1, (uint64_t)v7, v8);
    }
  }
}

- (void)updateSummaryTripMonitor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MOTripAnnotationManager *)self fsmStore];

  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "saving fsm model, %@", buf, 0xCu);
    }

    id v8 = [v4 copy];
    [v8 cleanUpBeforeUpdate];
    id v9 = [(MOTripAnnotationManager *)self fsmStore];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke;
    v17[3] = &unk_1002CA418;
    id v18 = v8;
    id v7 = v8;
    [v9 updateFSM:v7 completionHandler:v17];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[MOTripAnnotationManager updateSummaryTripMonitor:](v7, v10, v11, v12, v13, v14, v15, v16);
  }
}

void __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "saved fsm model, %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setupSummaryTripMonitorWithHomeLOI:(id)a3
{
  id v22 = a3;
  id v4 = [v22 mapItem];
  BOOL v5 = [v4 address];
  uint64_t v6 = [v5 countryCode];

  if (v6)
  {
    int v7 = [v22 mapItem];
    uint64_t v8 = [v7 address];
    id v9 = +[MOFSM countryFromAddress:v8];

    uint64_t v10 = [v22 mapItem];
    uint64_t v11 = [v10 address];
    uint64_t v12 = +[MOFSM countryCodeFromAddress:v11];

    uint64_t v13 = [v22 mapItem];
    uint64_t v14 = [v13 address];
    uint64_t v15 = +[MOFSM stateFromAddress:v14];

    uint64_t v16 = [v22 mapItem];
    uint64_t v17 = [v16 address];
    id v18 = +[MOFSM stateCodeFromAddress:v17];

    if ([(NSSet *)self->_stateStateTripEligibleCountries containsObject:v12] && v18 != 0) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    id v20 = [(MOTripAnnotationManager *)self summaryTripMonitor];
    [v20 setMode:v19];

    double v21 = [(MOTripAnnotationManager *)self summaryTripMonitor];
    [v21 setReferenceDataWithCountry:v9 countryCode:v12 state:v15 stateCode:v18];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MOFSMStore)fsmStore
{
  return self->_fsmStore;
}

- (void)setFsmStore:(id)a3
{
}

- (MOFSM)summaryTripMonitor
{
  return self->_summaryTripMonitor;
}

- (void)setSummaryTripMonitor:(id)a3
{
}

- (unint64_t)significantLOIMinimumVisitsThreshold
{
  return self->_significantLOIMinimumVisitsThreshold;
}

- (void)setSignificantLOIMinimumVisitsThreshold:(unint64_t)a3
{
  self->_significantLOIMinimumVisitsThreshold = a3;
}

- (double)visitLabelMediumConfidenceThreshold
{
  return self->_visitLabelMediumConfidenceThreshold;
}

- (void)setVisitLabelMediumConfidenceThreshold:(double)a3
{
  self->_visitLabelMediumConfidenceThreshold = a3;
}

- (double)visitLabelHighConfidenceThreshold
{
  return self->_visitLabelHighConfidenceThreshold;
}

- (void)setVisitLabelHighConfidenceThreshold:(double)a3
{
  self->_visitLabelHighConfidenceThreshold = a3;
}

- (double)aoiVisitLabelConfidentThreshold
{
  return self->_aoiVisitLabelConfidentThreshold;
}

- (void)setAoiVisitLabelConfidentThreshold:(double)a3
{
  self->_aoiVisitLabelConfidentThreshold = a3;
}

- (double)minimumDwellTime
{
  return self->_minimumDwellTime;
}

- (void)setMinimumDwellTime:(double)a3
{
  self->_minimumDwellTime = a3;
}

- (double)minimumHometownDistanceThreshold
{
  return self->_minimumHometownDistanceThreshold;
}

- (void)setMinimumHometownDistanceThreshold:(double)a3
{
  self->_double minimumHometownDistanceThreshold = a3;
}

- (double)minimumHometownDistanceForTripThreshold
{
  return self->_minimumHometownDistanceForTripThreshold;
}

- (void)setMinimumHometownDistanceForTripThreshold:(double)a3
{
  self->_double minimumHometownDistanceForTripThreshold = a3;
}

- (double)maximumCommuteDistanceForTripThreshold
{
  return self->_maximumCommuteDistanceForTripThreshold;
}

- (void)setMaximumCommuteDistanceForTripThreshold:(double)a3
{
  self->_maximumCommuteDistanceForTripThreshold = a3;
}

- (double)minimumDistanceBetweenTripsThreshold
{
  return self->_minimumDistanceBetweenTripsThreshold;
}

- (void)setMinimumDistanceBetweenTripsThreshold:(double)a3
{
  self->_minimumDistanceBetweenTripsThreshold = a3;
}

- (double)minimumDurationThreshold
{
  return self->_minimumDurationThreshold;
}

- (void)setMinimumDurationThreshold:(double)a3
{
  self->_double minimumDurationThreshold = a3;
}

- (unint64_t)minimumDayCountThreshold
{
  return self->_minimumDayCountThreshold;
}

- (void)setMinimumDayCountThreshold:(unint64_t)a3
{
  self->_unint64_t minimumDayCountThreshold = a3;
}

- (unint64_t)maximumDayCountThreashold
{
  return self->_maximumDayCountThreashold;
}

- (void)setMaximumDayCountThreashold:(unint64_t)a3
{
  self->_maximumDayCountThreashold = a3;
}

- (unint64_t)minimumVisitCountThreshold
{
  return self->_minimumVisitCountThreshold;
}

- (void)setMinimumVisitCountThreshold:(unint64_t)a3
{
  self->_minimumVisitCountThreshold = a3;
}

- (double)minimumDominancyRatioForSinglePOITripThreshold
{
  return self->_minimumDominancyRatioForSinglePOITripThreshold;
}

- (void)setMinimumDominancyRatioForSinglePOITripThreshold:(double)a3
{
  self->_double minimumDominancyRatioForSinglePOITripThreshold = a3;
}

- (double)minimumDominancyRatioForInterestingPOITripThreshold
{
  return self->_minimumDominancyRatioForInterestingPOITripThreshold;
}

- (void)setMinimumDominancyRatioForInterestingPOITripThreshold:(double)a3
{
  self->_double minimumDominancyRatioForInterestingPOITripThreshold = a3;
}

- (NSString)addressFormatOption
{
  return self->_addressFormatOption;
}

- (void)setAddressFormatOption:(id)a3
{
}

- (double)overnightStartDateHour
{
  return self->_overnightStartDateHour;
}

- (void)setOvernightStartDateHour:(double)a3
{
  self->_overnightStartDateHour = a3;
}

- (double)overnightDurationHours
{
  return self->_overnightDurationHours;
}

- (void)setOvernightDurationHours:(double)a3
{
  self->_overnightDurationHours = a3;
}

- (double)overnightDurationWeight
{
  return self->_overnightDurationWeight;
}

- (void)setOvernightDurationWeight:(double)a3
{
  self->_overnightDurationWeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressFormatOption, 0);
  objc_storeStrong((id *)&self->_summaryTripMonitor, 0);
  objc_storeStrong((id *)&self->_fsmStore, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateStateTripEligibleCountries, 0);
  objc_storeStrong((id *)&self->_interestingPoiCategories, 0);
  objc_storeStrong((id *)&self->_airportCategories, 0);

  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)_performAnnotationWithEvents:(uint64_t)a3 withPatternEvents:(uint64_t)a4 eventBundles:(uint64_t)a5 handler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)generateDailyTripsFromBaseEvents:(uint64_t)a1 contextEvents:(uint64_t)a2 pregeneratedTripBundles:hometownReferenceLocations:.cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  *(_DWORD *)id v4 = 138412290;
  *id v3 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@: hometown visit, no open trip session", v4, 0xCu);
}

- (void)hometownReferenceLocations
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Semaphore wait failed with context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)materializeTripBundle:contextEvents:updateWithFilteredEvents:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "trip manager (materializeTripBundle with updateWithFilteredEvents=%i) fails to yield a name, bundle, %@", v1, 0x12u);
}

- (void)materializeTripBundle:contextEvents:updateWithFilteredEvents:.cold.2()
{
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "trip manager (materializeTripBundle with updateWithFilteredEvents=%i) eventBundle, %@", v1, 0x12u);
}

- (void)_filterPlaceUsingPredicates:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315394;
  int v2 = "-[MOTripAnnotationManager _filterPlaceUsingPredicates:]";
  __int16 v3 = 1024;
  int v4 = 1124;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "_filterPlaceUsingPredicates: interestingPOIcategories is empty (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

- (void)dominantPlaceNamesFromEvents:(uint64_t)a3 countryMode:(uint64_t)a4 timeZone:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dominantPlaceNamesFromEvents:(uint64_t)a1 countryMode:(uint64_t)a2 timeZone:.cold.2(uint64_t a1, uint64_t a2)
{
  BOOL v5 = [OUTLINED_FUNCTION_2_1(a1, a2) address];
  uint64_t v6 = [v5 description];
  int v7 = [v6 mask];
  *(_DWORD *)int v4 = 138412290;
  *__int16 v3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "trip manager (dominantPlaceNameFromEvents), address is not available, address, %@", v4, 0xCu);
}

void __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138412802;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  CFStringRef v10 = @"SummaryTripMonitor";
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: fetchFSMWithName, %@, error, %@", (uint8_t *)&v7, 0x20u);
}

- (void)updateSummaryTripMonitor:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "saving fsm model failed, error %@", (uint8_t *)&v2, 0xCu);
}

@end