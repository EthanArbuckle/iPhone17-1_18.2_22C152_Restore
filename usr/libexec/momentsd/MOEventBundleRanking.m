@interface MOEventBundleRanking
+ (BOOL)supportsSecureCoding;
+ (void)defineClassCollections;
- (BOOL)isInternalBuild;
- (MOConfigurationManagerBase)configurationManager;
- (MOEventBundleRanking)initWithCoder:(id)a3;
- (MOEventBundleRanking)initWithConfigurationManager:(id)a3;
- (MOEventBundleRanking)initWithUniverse:(id)a3;
- (NSDictionary)bprRegularizationFactor;
- (NSDictionary)curationParameterDict;
- (NSDictionary)dynamicModelParameterDict;
- (NSDictionary)engagementScoreParameterDict;
- (NSDictionary)evergreenEngagementScoreParameterDict;
- (NSDictionary)heuristicsParameterDict;
- (NSDictionary)interfaceTypeCountFromSuggestionEngagementDict;
- (NSDictionary)rankingScoreThresholdDict;
- (NSDictionary)richnessWeightsDict;
- (NSDictionary)staticModelParameterMatrix;
- (NSDictionary)viewCountBasedAdjustmentParameterDict;
- (NSMutableDictionary)pairWiseWeights;
- (NSString)rankingAlgorithmVersion;
- (double)_calculateNormSquare:(double *)a3;
- (double)_computeBPROptForPairs:(double *)a3 withTotalBundleCountsForInterfaceTypesHigherTier:(id)a4 WithTotalBundleCountsForInterfaceTypesLowerTier:(id)a5 bprOpt:(double)a6 pairWiseMult:(float)a7;
- (double)_generateBPROptUsing:(double *)a3 initialParams:(double *)a4;
- (double)recommendedTabVisitFIThreshold;
- (float)elapsedDaysSinceOnboardingDate;
- (float)engagementScoreWeight;
- (float)frequencyPenalty;
- (id)_calculateRankingScore:(id)a3 withMinRecommendedBundleCountRequirement:(BOOL)a4;
- (id)_checkAndUpdateNumericLimits:(id)a3;
- (id)_fetchBundleInforForRanking:(id)a3;
- (id)_getDefaultFallbackFactorDict;
- (id)_getDefaultRichnessWeightDict;
- (id)_getRichnessScoreWeightFromConfigurationManager:(id)a3 withDefaultWeightDict:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (id)generateRankingInput:(id)a3;
- (void)_computeGradient:(double *)a3 initialParams:(double *)a4 Update:(double *)a5;
- (void)_fillCurationInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_fillDistincnessInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_fillEngagementInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_fillHeuristicsInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_fillQualityInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_fillRecencyInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_fillRichnessInfoForRanking:(id)a3 forBundle:(id)a4;
- (void)_lineSearch:(double *)a3 initialParams:(double *)a4 With:(double *)a5 And:(double *)a6 handler:(id)a7;
- (void)_mergeScoresToBundles:(id)a3 usingScore:(id)a4;
- (void)_setToIdentityMatrix:(double *)a3 forNumRows:(unint64_t)a4;
- (void)_submitEventBundleRankingAnalytics:(id)a3 withRankingInput:(id)a4 andSubmissionDate:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)generateBundleRanking:(id)a3 withMinRecommendedBundleCountRequirement:(BOOL)a4;
- (void)identifyRepetitiveSignificantContactBundlesFromBundles:(id)a3 precedingSignificantContactBundles:(id)a4;
- (void)safeSavePropertyToDictionary:(id)a3 withKey:(id)a4 andValue:(id)a5;
- (void)setBprRegularizationFactor:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setCurationParameterDict:(id)a3;
- (void)setDynamicModelParameterDict:(id)a3;
- (void)setElapsedDaysSinceOnboardingDate:(float)a3;
- (void)setEngagementScoreParameterDict:(id)a3;
- (void)setEngagementScoreWeight:(float)a3;
- (void)setEvergreenEngagementScoreParameterDict:(id)a3;
- (void)setFrequencyPenalty:(float)a3;
- (void)setHeuristicsParameterDict:(id)a3;
- (void)setInterfaceTypeCountFromSuggestionEngagementDict:(id)a3;
- (void)setPairWiseWeights:(id)a3;
- (void)setRankingAlgorithmVersion:(id)a3;
- (void)setRankingParamsFromRankingParamsMO:(id)a3;
- (void)setRankingScoreThresholdDict:(id)a3;
- (void)setRecommendedTabVisitFIThreshold:(double)a3;
- (void)setRichnessWeightsDict:(id)a3;
- (void)setStaticModelParameterMatrix:(id)a3;
- (void)setViewCountBasedAdjustmentParameterDict:(id)a3;
- (void)updateEngagementScoreParamsUsingBFGS;
- (void)updateTripMetaDataForRank:(id)a3;
@end

@implementation MOEventBundleRanking

- (void)setRankingParamsFromRankingParamsMO:(id)a3
{
  id v5 = a3;
  if (!self)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:](v6);
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:0 file:@"MORankingParams+CoreDataTransformable.m" lineNumber:23 description:@"MOEventBundleRanking was not initialized (in %s:%d)", "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]", 23];
  }
  if (v5)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v5 activityInterfaceTypeEngagementWeight];
    v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v9 forKeyedSubscript:&off_1002F4C10];

    [v5 outingInterfaceTypeEngagementWeight];
    v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v10 forKeyedSubscript:&off_1002F4C28];

    [v5 photoMomentInterfaceTypeEngagementWeight];
    v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v11 forKeyedSubscript:&off_1002F4C40];

    [v5 significantContactInterfaceTypeEngagementWeight];
    v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v12 forKeyedSubscript:&off_1002F4C58];

    [v5 yourMediaInterfaceTypeEngagementWeight];
    v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v13 forKeyedSubscript:&off_1002F4C70];

    [v5 yourTimeAtHomeInterfaceTypeEngagementWeight];
    v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v14 forKeyedSubscript:&off_1002F4C88];

    [v5 yourSharedContentInterfaceTypeEngagementWeight];
    v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v15 forKeyedSubscript:&off_1002F4CA0];

    [v5 topicsOfInterestInterfaceTypeEngagementWeight];
    v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v16 forKeyedSubscript:&off_1002F4CB8];

    [v5 trendInterfaceTypeEngagementWeight];
    v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v17 forKeyedSubscript:&off_1002F4CD0];

    [v5 photoMemoryInterfaceTypeEngagementWeight];
    v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v18 forKeyedSubscript:&off_1002F4CE8];

    [v5 evergreenInterfaceTypeEngagementWeight];
    v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v19 forKeyedSubscript:&off_1002F4D00];

    [v5 timeContextInterfaceTypeEngagementWeight];
    v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v20 forKeyedSubscript:&off_1002F4D18];

    [v5 tripInterfaceTypeEngagementWeight];
    v21 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v21 forKeyedSubscript:&off_1002F4D30];

    [v5 stateOfMindInterfaceTypeEngagementWeight];
    v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v22 forKeyedSubscript:&off_1002F4D48];

    [v5 clusteringInterfaceTypeEngagementWeight];
    v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setObject:v23 forKeyedSubscript:&off_1002F4D60];

    if ([v8 count] != (id)15)
    {
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:](v8, v24);
      }

      v25 = +[NSAssertionHandler currentHandler];
      [v25 handleFailureInMethod:a2, self, @"MORankingParams+CoreDataTransformable.m", 44, @"Mismatch between ranking modelParameterDict, %lu and bundle interface type, %lu (in %s:%d)", [v8 count], 15, @"-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]", 44 object file lineNumber description];
    }
    id v26 = objc_alloc_init((Class)NSMutableDictionary);
    [v5 wisdomEvergreenTypeEngagementWeight];
    v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v26 setObject:v27 forKeyedSubscript:@"WISDOM"];

    [v5 gratitudeEvergreenTypeEngagementWeight];
    v28 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v26 setObject:v28 forKeyedSubscript:@"GRATITUDE"];

    [v5 kindnessEvergreenTypeEngagementWeight];
    v29 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v26 setObject:v29 forKeyedSubscript:@"KINDNESS"];

    [v5 purposeEvergreenTypeEngagementWeight];
    v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v26 setObject:v30 forKeyedSubscript:@"PURPOSE"];

    [v5 resilienceEvergreenTypeEngagementWeight];
    v31 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v26 setObject:v31 forKeyedSubscript:@"RESILIENCE"];

    [v5 creativityEvergreenTypeEngagementWeight];
    v32 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v26 setObject:v32 forKeyedSubscript:@"CREATIVITY"];

    [(MOEventBundleRanking *)self setDynamicModelParameterDict:v8];
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "dynamicModelParameterDict was set to %@ using Moments DB", buf, 0xCu);
    }

    [(MOEventBundleRanking *)self setEvergreenEngagementScoreParameterDict:v26];
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "evergreenEngagementScoreParameterDict was set to %@ using Moments DB", buf, 0xCu);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_2 != -1) {
    dispatch_once(&defineClassCollections_onceToken_2, &__block_literal_global_38);
  }
}

void __46__MOEventBundleRanking_defineClassCollections__block_invoke(id a1)
{
  v24[0] = GEOPOICategoryAmusementPark;
  v24[1] = GEOPOICategoryAquarium;
  v24[2] = GEOPOICategoryBeach;
  v24[3] = GEOPOICategoryBrewery;
  v24[4] = GEOPOICategoryCafe;
  v24[5] = GEOPOICategoryFitnessCenter;
  v24[6] = GEOPOICategoryLibrary;
  v24[7] = GEOPOICategoryMarina;
  v24[8] = GEOPOICategoryMovieTheater;
  v24[9] = GEOPOICategoryMuseum;
  v24[10] = GEOPOICategoryNationalPark;
  v24[11] = GEOPOICategoryNightlife;
  v24[12] = GEOPOICategoryPark;
  v24[13] = GEOPOICategoryPlayground;
  v24[14] = GEOPOICategoryReligiousSite;
  v24[15] = GEOPOICategoryRestaurant;
  v24[16] = GEOPOICategoryStadium;
  v24[17] = GEOPOICategoryTheater;
  v24[18] = GEOPOICategoryWinery;
  v24[19] = GEOPOICategoryZoo;
  v24[20] = GEOPOICategoryCampground;
  v24[21] = GEOPOICategoryBaseball;
  v24[22] = GEOPOICategoryBasketball;
  v24[23] = GEOPOICategoryBeauty;
  v24[24] = GEOPOICategoryBowling;
  v24[25] = GEOPOICategoryCastle;
  v24[26] = GEOPOICategoryConventionCenter;
  v24[27] = GEOPOICategoryDistillery;
  v24[28] = GEOPOICategoryFairground;
  v24[29] = GEOPOICategoryFishing;
  v24[30] = GEOPOICategoryFortress;
  v24[31] = GEOPOICategoryGolf;
  v24[32] = GEOPOICategoryGoKart;
  v24[33] = GEOPOICategoryHiking;
  v24[34] = GEOPOICategoryKayaking;
  v24[35] = GEOPOICategoryLandmark;
  v24[36] = GEOPOICategoryMiniGolf;
  v24[37] = GEOPOICategoryMusicVenue;
  v24[38] = GEOPOICategoryNationalMonument;
  v24[39] = GEOPOICategoryPlanetarium;
  v24[40] = GEOPOICategoryRockClimbing;
  v24[41] = GEOPOICategoryRVPark;
  v24[42] = GEOPOICategorySkatePark;
  v24[43] = GEOPOICategorySkating;
  v24[44] = GEOPOICategorySkiing;
  v24[45] = GEOPOICategorySoccer;
  v24[46] = GEOPOICategorySpa;
  v24[47] = GEOPOICategorySurfing;
  v24[48] = GEOPOICategorySwimming;
  v24[49] = GEOPOICategoryTennis;
  v24[50] = GEOPOICategoryVolleyball;
  uint64_t v1 = +[NSArray arrayWithObjects:v24 count:51];
  v2 = (void *)interestingPOIcategories;
  interestingPOIcategories = v1;

  v23[0] = GEOPOICategoryAirportGate;
  v23[1] = GEOPOICategoryAirportTerminal;
  v23[2] = GEOPOICategoryATM;
  v23[3] = GEOPOICategoryBank;
  v23[4] = GEOPOICategoryCarRental;
  v23[5] = GEOPOICategoryEVCharger;
  v23[6] = GEOPOICategoryGasStation;
  v23[7] = GEOPOICategoryLaundry;
  v23[8] = GEOPOICategoryParking;
  v23[9] = GEOPOICategoryPharmacy;
  v23[10] = GEOPOICategoryPostOffice;
  v23[11] = GEOPOICategoryPublicTransport;
  v23[12] = GEOPOICategoryRestroom;
  v23[13] = GEOPOICategoryAutomotiveRepair;
  v23[14] = GEOPOICategoryMailbox;
  uint64_t v3 = +[NSArray arrayWithObjects:v23 count:15];
  v4 = (void *)nonInterestingPOIcategories;
  nonInterestingPOIcategories = v3;

  v22[0] = GEOPOICategoryHospital;
  v22[1] = GEOPOICategoryPolice;
  v22[2] = GEOPOICategoryFireStation;
  v22[3] = GEOPOICategoryAnimalService;
  uint64_t v5 = +[NSArray arrayWithObjects:v22 count:4];
  v6 = (void *)sensitivePOICategories;
  sensitivePOICategories = v5;

  v21[0] = GEOPOICategoryHotel;
  v21[1] = GEOPOICategoryFoodMarket;
  v21[2] = GEOPOICategoryBakery;
  v21[3] = GEOPOICategorySchool;
  v21[4] = GEOPOICategoryStore;
  v21[5] = GEOPOICategoryUniversity;
  uint64_t v7 = +[NSArray arrayWithObjects:v21 count:6];
  id v8 = (void *)neutralPOIcategories;
  neutralPOIcategories = v7;

  v9 = (void *)enrichedActionTags;
  enrichedActionTags = (uint64_t)&off_1002F91A0;

  v10 = (void *)interestingTimeTags;
  interestingTimeTags = (uint64_t)&off_1002F91B8;

  v11 = (void *)visitActionTags;
  visitActionTags = (uint64_t)&off_1002F91D0;

  v12 = (void *)visitSubtypeVariants;
  visitSubtypeVariants = (uint64_t)&off_1002F91E8;

  v13 = (void *)dailyMediaSubtypeVariants;
  dailyMediaSubtypeVariants = (uint64_t)&off_1002F9200;

  v14 = (void *)MediaWeeklySummarySubtypeVariants;
  MediaWeeklySummarySubtypeVariants = (uint64_t)&off_1002F9218;

  v15 = (void *)timeAtHomeSubtypeVariants;
  timeAtHomeSubtypeVariants = (uint64_t)&off_1002F9230;

  v16 = (void *)phoneSensedWalkingVariants;
  phoneSensedWalkingVariants = (uint64_t)&off_1002F9248;

  v17 = (void *)workoutSubtypeVariants;
  workoutSubtypeVariants = (uint64_t)&off_1002F9260;

  v18 = (void *)thirdPartyMediaSubtypeVariants;
  thirdPartyMediaSubtypeVariants = (uint64_t)&off_1002F9278;

  uint64_t v19 = +[NSSet setWithObject:&stru_1002D2AC8];
  v20 = (void *)emptyStringSet;
  emptyStringSet = v19;
}

- (id)generateRankingInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[MOEventBundleRanking _fetchBundleInforForRanking:](self, "_fetchBundleInforForRanking:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_fetchBundleInforForRanking:(id)a3
{
  id v4 = a3;
  id v6 = objc_opt_new();
  id v7 = [v4 bundleIdentifier];
  [v6 setBundleIdentifier:v7];

  id v8 = [v4 suggestionID];
  [v6 setSuggestionIdentifier:v8];

  uint64_t v9 = [v4 events];
  [v6 setEvents:v9];

  v10 = [v4 subSuggestionIDs];
  [v6 setSubSuggestionIDs:v10];

  [(MOEventBundleRanking *)self _fillRecencyInfoForRanking:v6 forBundle:v4];
  [(MOEventBundleRanking *)self _fillRichnessInfoForRanking:v6 forBundle:v4];
  [(MOEventBundleRanking *)self _fillDistincnessInfoForRanking:v6 forBundle:v4];
  [(MOEventBundleRanking *)self _fillHeuristicsInfoForRanking:v6 forBundle:v4];
  [(MOEventBundleRanking *)self _fillQualityInfoForRanking:v6 forBundle:v4];
  [(MOEventBundleRanking *)self _fillEngagementInfoForRanking:v6 forBundle:v4];
  [(MOEventBundleRanking *)self _fillCurationInfoForRanking:v6 forBundle:v4];

  return v6;
}

- (void)_fillRecencyInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 endDate];
  id v8 = +[NSDate date];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9 / -86400.0;
  *(float *)&double v10 = v10;
  [v6 setBundleRecencyDaysElapsed:v10];

  v11 = [v5 startDate];
  [v6 setBundleStartDate:v11];

  id v12 = [v5 endDate];

  [v6 setBundleEndDate:v12];
}

- (void)_fillCurationInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v6 = (void *)visitSubtypeVariants;
  id v7 = a4;
  id v8 = a3;
  double v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 bundleSubType]);
  unsigned int v10 = [v6 containsObject:v9];

  v11 = [v7 place];
  if ([v11 placeUserType] == (id)2) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  [v8 setIsWorkVisit:v12];

  long long v13 = [v7 metaDataForRank];

  long long v14 = [v13 objectForKeyedSubscript:@"VisitDuration"];
  [v14 floatValue];
  float v16 = v15;

  id v19 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"shortVisitDurationThresholdInSec"];
  [v19 floatValue];
  if (v16 < v17) {
    uint64_t v18 = v10;
  }
  else {
    uint64_t v18 = 0;
  }
  [v8 setIsShortVisit:v18];
}

- (void)_fillQualityInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 action];
  id v8 = [v7 actionType];
  double v9 = 0.0;
  if (v8) {
    *(float *)&double v9 = 0.5;
  }
  [v5 setIsBundleActionSpecific:v9];

  unsigned int v10 = (void *)enrichedActionTags;
  v11 = [v6 action];
  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 actionType]);
  LODWORD(v10) = [v10 containsObject:v12];

  if (v10)
  {
    [v5 isBundleActionSpecific];
    if ((float)(*(float *)&v13 + 0.5) > 1.0)
    {
      LODWORD(v13) = 1.0;
      [v5 setIsBundleActionSpecific:v13];
      long long v14 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  long long v14 = [v6 action];
  if ([v14 actionType] != (id)1) {
    goto LABEL_12;
  }
  v22 = [v6 action];
  id v23 = [v22 actionSubtype];

  if (v23 == (id)4)
  {
    [v5 isBundleActionSpecific];
    if ((float)(*(float *)&v24 + 0.5) > 1.0)
    {
      LODWORD(v24) = 1.0;
      [v5 setIsBundleActionSpecific:v24];
      long long v14 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
LABEL_11:
      }
        -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:](v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_12:

      goto LABEL_14;
    }
LABEL_13:
    [v5 isBundleActionSpecific];
    *(float *)&double v26 = v25 + 0.5;
    [v5 setIsBundleActionSpecific:v26];
  }
LABEL_14:
  v27 = [v6 time];
  float v29 = 0.0;
  if ([v27 timeTag]) {
    *(float *)&double v28 = 0.5;
  }
  else {
    *(float *)&double v28 = 0.0;
  }
  [v5 setIsBundleTimeTagSpecific:v28];

  v30 = (void *)interestingTimeTags;
  v31 = [v6 time];
  v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v31 timeTag]);
  LODWORD(v30) = [v30 containsObject:v32];

  if (v30)
  {
    [v5 isBundleTimeTagSpecific];
    if ((float)(*(float *)&v33 + 0.5) <= 1.0)
    {
      [v5 isBundleTimeTagSpecific];
      *(float *)&double v43 = v42 + 0.5;
      [v5 setIsBundleTimeTagSpecific:v43];
    }
    else
    {
      LODWORD(v33) = 1.0;
      [v5 setIsBundleTimeTagSpecific:v33];
      v34 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:](v34, v35, v36, v37, v38, v39, v40, v41);
      }
    }
  }
  v44 = [v6 place];
  uint64_t v45 = (uint64_t)[v44 placeType];

  if (v45 > 99)
  {
    if (v45 == 100 || v45 == 101 || v45 == 102)
    {
LABEL_29:
      float v29 = 1.0;
LABEL_30:
      *(float *)&double v46 = v29;
      [v5 setIsBundlePlaceTypeSpecific:v46];
    }
  }
  else
  {
    switch(v45)
    {
      case 0:
      case 1:
        goto LABEL_30;
      case 2:
        float v29 = 0.8;
        goto LABEL_30;
      case 3:
      case 6:
        goto LABEL_29;
      case 4:
        float v29 = 0.4;
        goto LABEL_30;
      case 5:
        float v29 = 0.2;
        goto LABEL_30;
      default:
        break;
    }
  }
  v47 = [v6 place];
  v48 = (char *)[v47 placeUserType];

  if ((unint64_t)(v48 - 1) < 4) {
    goto LABEL_32;
  }
  if (!v48)
  {
    double v49 = 0.0;
    goto LABEL_33;
  }
  if (v48 == (char *)100)
  {
LABEL_32:
    LODWORD(v49) = 1.0;
LABEL_33:
    [v5 setIsBundlePlaceTypeSpecific:v49];
  }
  [v5 isBundlePlaceTypeSpecific];
  float v51 = v50;
  [v5 isBundleTimeTagSpecific];
  float v53 = v51 + v52;
  [v5 isBundleActionSpecific];
  *(float *)&double v55 = v53 + v54;
  [v5 setLabelSpecificityNormalized:v55];
  v56 = [v6 persons];
  id v57 = [v56 count];

  if (v57)
  {
    [v5 labelSpecificityNormalized];
    if ((float)(*(float *)&v58 + 0.5) <= 4.0)
    {
      [v5 labelSpecificityNormalized];
      *(float *)&double v68 = v67 + 0.5;
      [v5 setLabelSpecificityNormalized:v68];
    }
    else
    {
      LODWORD(v58) = 4.0;
      [v5 setLabelSpecificityNormalized:v58];
      v59 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:](v59, v60, v61, v62, v63, v64, v65, v66);
      }
    }
  }
  [v5 labelSpecificityNormalized];
  *(float *)&double v70 = v69 * 0.25;
  [v5 setLabelSpecificityNormalized:v70];
  [v5 labelSpecificityNormalized];
  float v72 = v71;
  v73 = [v6 metaDataForRank];
  v74 = [v73 objectForKey:@"LabelConfidence"];
  [v74 floatValue];
  *(float *)&double v76 = v72 * v75;
  [v5 setLabelQualityScore:v76];

  v77 = [v6 metaDataForRank];
  v78 = [v77 objectForKey:@"TimeCorrelationScore"];

  if (v78)
  {
    v79 = [v6 metaDataForRank];
    v80 = [v79 objectForKey:@"TimeCorrelationScore"];
    [v80 floatValue];
    [v5 setTimeCorrelationScoreFeature:];
  }
  else
  {
    [v5 setTimeCorrelationScoreFeature:0.0];
  }
}

- (void)_fillHeuristicsInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 interfaceType] == (id)13)
  {
    [(MOEventBundleRanking *)self updateTripMetaDataForRank:v7];
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:](v7);
    }
  }
  double v9 = [v7 metaDataForRank];
  unsigned int v10 = [v9 objectForKeyedSubscript:@"PoiCategory"];

  v11 = +[NSNull null];
  v245 = v10;
  unsigned __int8 v12 = [v10 isEqual:v11];

  if (v12)
  {
    [v6 setInterestingPOIFeature:0.0];
  }
  else
  {
    double v13 = [v7 metaDataForRank];
    long long v14 = [v13 objectForKeyedSubscript:@"PoiCategory"];
    [v14 floatValue];
    [v6 setInterestingPOIFeature:];
  }
  [v6 setIsSensitivePOI:0];
  uint64_t v15 = [v7 place];
  uint64_t v16 = [v15 poiCategory];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = (void *)sensitivePOICategories;
    uint64_t v19 = [v7 place];
    uint64_t v20 = [v19 poiCategory];
    LODWORD(v18) = [v18 containsObject:v20];

    if (!v18) {
      goto LABEL_13;
    }
    [v6 setIsSensitivePOI:1];
    uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:](v7, v15);
    }
  }

LABEL_13:
  [v6 setFamiliarityIndexFeature:0.0];
  [v6 setDistanceToHomeFeatureNormalized:0.0];
  uint64_t v21 = [v7 metaDataForRank];
  v22 = [v21 objectForKey:@"FamiliarityIndex"];

  if (!v22) {
    goto LABEL_38;
  }
  id v23 = [v7 metaDataForRank];
  double v24 = [v23 objectForKey:@"FamiliarityIndex"];
  [v24 floatValue];
  float v26 = v25;

  v27 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  double v28 = [v27 objectForKeyedSubscript:@"FIDownRankThreshold"];
  [v28 floatValue];
  float v30 = v29;

  if (v26 != 0.0
    || ([v6 interestingPOIFeature], float v32 = 1.0, *(float *)&v31 != 1.0)
    && ([v6 numPhotoAssetsResourcesNormalized], *(float *)&v31 <= 0.0))
  {
    if (v26 > 0.0
      && v26 <= v30
      && (([v6 interestingPOIFeature], *(float *)&v31 == 1.0)
       || ([v6 numPhotoAssetsResourcesNormalized], *(float *)&v31 > 0.0)))
    {
      float v32 = (float)(v26 * -4.0) + 3.0;
    }
    else
    {
      double v33 = v26;
      if (v26 > v30
        && self->_recommendedTabVisitFIThreshold >= v33
        && ([v6 numPhotoAssetsResourcesNormalized], *(float *)&v31 == 0.0))
      {
        float v32 = (float)(v26 * -6.67) + 5.0;
      }
      else
      {
        if (v26 >= 1.0) {
          goto LABEL_30;
        }
        if (self->_recommendedTabVisitFIThreshold >= v33) {
          goto LABEL_30;
        }
        [v6 numPhotoAssetsResourcesNormalized];
        float v32 = -1.0;
        if (*(float *)&v31 != 0.0) {
          goto LABEL_30;
        }
      }
    }
  }
  *(float *)&double v31 = v32;
  [v6 setFamiliarityIndexFeature:v31];
LABEL_30:
  [v6 familiarityIndexFeature];
  if (*(float *)&v34 > 1.0)
  {
    LODWORD(v34) = 1.0;
    [v6 setFamiliarityIndexFeature:v34];
  }
  uint64_t v35 = [v7 metaDataForRank];
  uint64_t v36 = [v35 objectForKeyedSubscript:@"DistanceToHome"];
  [v36 floatValue];
  float v38 = v37;

  uint64_t v39 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  uint64_t v40 = [v39 objectForKeyedSubscript:@"distanceToHomeThreshold"];
  [v40 floatValue];
  float v42 = v41;

  [v6 interestingPOIFeature];
  if (*(float *)&v43 != -1.0 && v26 >= 0.0 && v26 <= v30 && v38 > 0.0)
  {
    *(float *)&double v43 = v38 / v42;
    [v6 setDistanceToHomeFeatureNormalized:v43];
    if (v38 > v42)
    {
      LODWORD(v44) = 1.0;
      [v6 setDistanceToHomeFeatureNormalized:v44];
    }
  }
LABEL_38:
  [v6 setNumFamilyNormalized:0.0];
  [v6 setNumKidsNormalized:0.0];
  [v6 setNumFriendsNormalized:0.0];
  [v6 setNumCoworkersNormalized:0.0];
  [v6 setNumPetsNormalized:0.0];
  [v6 setNumOtherPersonsNormalized:0.0];
  uint64_t v45 = [v7 persons];
  id v46 = [v45 count];

  if (v46)
  {
    long long v248 = 0u;
    long long v249 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    v47 = [v7 persons];
    id v48 = [v47 countByEnumeratingWithState:&v246 objects:v250 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v247;
      do
      {
        float v51 = 0;
        do
        {
          if (*(void *)v247 != v50) {
            objc_enumerationMutation(v47);
          }
          float v52 = *(void **)(*((void *)&v246 + 1) + 8 * (void)v51);
          if (([v52 isMePerson] & 1) == 0)
          {
            uint64_t v53 = +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:v52];
            if (v53 > 20)
            {
              switch(v53)
              {
                case 21:
                  [v6 numFriendsNormalized];
                  *(float *)&double v63 = v62 + 1.0;
                  [v6 setNumFriendsNormalized:v63];
                  break;
                case 22:
                  [v6 numCoworkersNormalized];
                  *(float *)&double v65 = v64 + 1.0;
                  [v6 setNumCoworkersNormalized:v65];
                  break;
                case 27:
                  [v6 numPetsNormalized];
                  *(float *)&double v57 = v56 + 1.0;
                  [v6 setNumPetsNormalized:v57];
                  break;
              }
            }
            else
            {
              switch(v53)
              {
                case 1:
                  [v6 numOtherPersonsNormalized];
                  *(float *)&double v59 = v58 + 1.0;
                  [v6 setNumOtherPersonsNormalized:v59];
                  break;
                case 4:
                  [v6 numFamilyNormalized];
                  *(float *)&double v61 = v60 + 1.0;
                  [v6 setNumFamilyNormalized:v61];
                  break;
                case 15:
                  [v6 numKidsNormalized];
                  *(float *)&double v55 = v54 + 1.0;
                  [v6 setNumKidsNormalized:v55];
                  break;
              }
            }
          }
          float v51 = (char *)v51 + 1;
        }
        while (v49 != v51);
        id v66 = [v47 countByEnumeratingWithState:&v246 objects:v250 count:16];
        id v49 = v66;
      }
      while (v66);
    }
  }
  float v67 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:](v6, v67);
  }

  [v6 numFamilyNormalized];
  float v68 = 1.0;
  BOOL v69 = *(float *)&v70 < 2.0;
  LODWORD(v70) = 1.0;
  if (v69)
  {
    [v6 numFamilyNormalized:v70];
    *(float *)&double v70 = *(float *)&v70 * 0.5;
  }
  [v6 setNumFamilyNormalized:v70];
  [v6 numKidsNormalized];
  if (*(float *)&v71 < 2.0)
  {
    [v6 numKidsNormalized];
    float v68 = *(float *)&v71 * 0.5;
  }
  *(float *)&double v71 = v68;
  [v6 setNumKidsNormalized:v71];
  [v6 numFriendsNormalized];
  float v72 = 1.0;
  BOOL v69 = *(float *)&v73 < 2.0;
  LODWORD(v73) = 1.0;
  if (v69)
  {
    [v6 numFriendsNormalized:v73];
    *(float *)&double v73 = *(float *)&v73 * 0.5;
  }
  [v6 setNumFriendsNormalized:v73];
  [v6 numCoworkersNormalized];
  if (*(float *)&v74 < 2.0)
  {
    [v6 numCoworkersNormalized];
    float v72 = *(float *)&v74 * 0.5;
  }
  *(float *)&double v74 = v72;
  [v6 setNumCoworkersNormalized:v74];
  [v6 numPetsNormalized];
  float v75 = 1.0;
  BOOL v69 = *(float *)&v76 < 2.0;
  LODWORD(v76) = 1.0;
  if (v69)
  {
    [v6 numPetsNormalized:v76];
    *(float *)&double v76 = *(float *)&v76 * 0.5;
  }
  [v6 setNumPetsNormalized:v76];
  [v6 numOtherPersonsNormalized];
  if (*(float *)&v77 < 2.0)
  {
    [v6 numOtherPersonsNormalized];
    float v75 = *(float *)&v77 * 0.5;
  }
  *(float *)&double v77 = v75;
  [v6 setNumOtherPersonsNormalized:v77];
  [v6 setCallDurationFeatureNormalized:0.0];
  v78 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v79 = [v78 objectForKeyedSubscript:@"callDurationThreshold"];
  [v79 floatValue];
  float v81 = v80;

  v82 = [v7 metaDataForRank];
  CFStringRef v83 = @"callDuration";
  v84 = [v82 objectForKey:@"callDuration"];
  [v84 doubleValue];
  double v86 = v85;

  v87 = [v7 metaDataForRank];
  v88 = v87;
  if (v86 <= 0.0)
  {
    CFStringRef v83 = @"dailyAggregateCallDuration";
    v89 = [v87 objectForKey:@"dailyAggregateCallDuration"];
    [v89 floatValue];
    float v91 = v90;

    if (v91 <= 0.0) {
      goto LABEL_84;
    }
    v87 = [v7 metaDataForRank];
    v88 = v87;
  }
  v92 = [v87 objectForKey:v83];
  [v92 floatValue];
  float v94 = v93;

  *(float *)&double v95 = v94 / v81;
  [v6 setCallDurationFeatureNormalized:v95];
  if (v94 > v81)
  {
    LODWORD(v96) = 1.0;
    [v6 setCallDurationFeatureNormalized:v96];
  }
LABEL_84:
  [v6 setBurstyInteractionCountFeatureNormalized:0.0];
  v97 = [v7 metaDataForRank];
  v98 = [v97 objectForKey:@"burstyInteractionCount"];
  [v98 doubleValue];
  double v100 = v99;

  if (v100 > 0.0)
  {
    v101 = [v7 metaDataForRank];
    v102 = [v101 objectForKey:@"burstyInteractionCount"];
    [v102 floatValue];
    float v104 = v103;

    v105 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    v106 = [v105 objectForKeyedSubscript:@"burstyInteractionCountThreshold"];
    *(float *)&double v107 = v104 / (float)(int)[v106 intValue];
    [v6 setBurstyInteractionCountFeatureNormalized:v107];

    v108 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    v109 = [v108 objectForKeyedSubscript:@"burstyInteractionCountThreshold"];
    float v110 = (float)(int)[v109 intValue];

    if (v104 > v110)
    {
      LODWORD(v111) = 1.0;
      [v6 setBurstyInteractionCountFeatureNormalized:v111];
    }
  }
  [v6 setMultipleInteractionTypesFeature:0];
  v112 = [v7 metaDataForRank];
  v113 = [v112 objectForKey:@"multipleInteractionTypes"];
  unsigned int v114 = [v113 BOOLValue];

  if (v114) {
    [v6 setMultipleInteractionTypesFeature:1];
  }
  [v6 setContactLocationWorkFeature:0];
  v115 = [v7 metaDataForRank];
  v116 = [v115 objectForKey:@"contactLocationWork"];
  unsigned int v117 = [v116 BOOLValue];

  if (v117) {
    [v6 setContactLocationWorkFeature:0xFFFFFFFFLL];
  }
  v118 = [v7 metaDataForRank];
  v119 = [v118 objectForKeyedSubscript:@"isFamilyContact"];
  [v119 floatValue];
  [v6 setIsFamilyContact:];

  v120 = [v7 metaDataForRank];
  v121 = [v120 objectForKeyedSubscript:@"isCoworkerContact"];
  [v121 floatValue];
  [v6 setIsCoworkerContact:];

  v122 = [v7 metaDataForRank];
  v123 = [v122 objectForKeyedSubscript:@"isRepetitiveContact"];
  [v6 setIsRepetitiveContact:[v123 BOOLValue]];

  v124 = [v7 metaDataForRank];
  v125 = [v124 objectForKeyedSubscript:@"isGroupConversation"];
  [v6 setGroupConversationFeature:[v125 BOOLValue]];

  [v6 setWorkoutDurationFeatureNormalized:0.0];
  v126 = [v7 metaDataForRank];
  v127 = [v126 objectForKey:@"WorkoutDuration"];
  [v127 floatValue];
  float v129 = v128;

  v130 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v131 = [v130 objectForKeyedSubscript:@"workoutDurationThreshold"];
  [v131 floatValue];
  float v133 = v132;

  if ([v6 bundleSubType] == (id)202)
  {
    v135 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    v136 = [v135 objectForKeyedSubscript:@"WeeklySummaryWorkoutDurationThreshold"];
    [v136 floatValue];
    float v133 = v137;
  }
  if (v129 > 0.0)
  {
    *(float *)&double v134 = v129 / v133;
    if (v129 >= v133) {
      *(float *)&double v134 = 1.0;
    }
    [v6 setWorkoutDurationFeatureNormalized:v134];
  }
  v138 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v139 = [v138 objectForKeyedSubscript:@"mediaPlayTimeThreshold"];
  [v139 floatValue];
  float v141 = v140;

  v142 = (void *)MediaWeeklySummarySubtypeVariants;
  v143 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 bundleSubType]);
  LODWORD(v142) = [v142 containsObject:v143];

  if (v142)
  {
    v144 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    v145 = [v144 objectForKeyedSubscript:@"weeklySummaryMediaPlayTimeThreshold"];
    [v145 floatValue];
    float v141 = v146;
  }
  v147 = [v7 metaDataForRank];
  v148 = [v147 objectForKey:@"MediaActionIsRepeat"];
  [v148 floatValue];
  [v6 setMediaScoreFeatureNormalized:];

  v149 = [v7 metaDataForRank];
  v150 = [v149 objectForKey:@"MediaTotalPlayTime"];
  [v150 floatValue];
  float v152 = v151;

  if (v152 > 0.0)
  {
    [v6 mediaScoreFeatureNormalized];
    if (v152 >= v141)
    {
      *(float *)&double v153 = *(float *)&v153 + 0.5;
    }
    else
    {
      double v153 = v152 * 0.5 / v141 + *(float *)&v153;
      *(float *)&double v153 = v153;
    }
    [v6 setMediaScoreFeatureNormalized:v153];
  }
  [v6 setItemFromMeFeature:0];
  v154 = [v7 metaDataForRank];
  v155 = [v154 objectForKey:@"ItemShareDirection"];
  if ([v155 intValue] == 1)
  {

LABEL_107:
    [v6 setItemFromMeFeature:1];
    goto LABEL_108;
  }
  v156 = [v7 metaDataForRank];
  v157 = [v156 objectForKey:@"ItemShareDirection"];
  unsigned int v158 = [v157 intValue];

  if (v158 == 3) {
    goto LABEL_107;
  }
LABEL_108:
  float v159 = 0.0;
  [v6 setShareCountFeatureNormalized:0.0];
  v160 = [v7 metaDataForRank];
  v161 = [v160 objectForKey:@"ItemAttributionsCount"];
  int v162 = [v161 intValue];

  if (v162 >= 1)
  {
    v163 = [v7 metaDataForRank];
    v164 = [v163 objectForKey:@"ItemAttributionsCount"];
    [v164 floatValue];
    float v166 = v165;

    v167 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    v168 = [v167 objectForKeyedSubscript:@"shareCountThreshold"];
    [v168 floatValue];
    *(float *)&double v170 = v166 / v169;
    [v6 setShareCountFeatureNormalized:v170];

    v171 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    v172 = [v171 objectForKeyedSubscript:@"shareCountThreshold"];
    [v172 floatValue];
    float v174 = v173;

    if (v166 > v174)
    {
      LODWORD(v175) = 1.0;
      [v6 setShareCountFeatureNormalized:v175];
    }
  }
  v176 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v177 = [v176 objectForKeyedSubscript:@"maxPeopleCountFromSocialContext"];
  [v177 floatValue];
  float v179 = v178;

  v180 = [v7 metaDataForRank];
  v181 = [v180 objectForKey:@"PeopleCountWeightedAverage"];

  if (v181)
  {
    [v181 floatValue];
    float v159 = *(float *)&v182 / v179;
  }
  *(float *)&double v182 = v159;
  [v6 setPeopleCountWeightedAverageNormalized:v182];
  [v6 peopleCountWeightedAverageNormalized];
  if (*(float *)&v183 > 1.0)
  {
    LODWORD(v183) = 1.0;
    [v6 setPeopleCountWeightedAverageNormalized:v183];
  }
  v184 = [v7 metaDataForRank];
  v185 = [v184 objectForKey:@"PeopleCountMax"];

  if (v185)
  {
    [v185 floatValue];
    *(float *)&double v186 = *(float *)&v186 / v179;
  }
  else
  {
    double v186 = 0.0;
  }
  [v6 setPeopleCountMaxNormalized:v186];
  [v6 peopleCountMaxNormalized];
  if (*(float *)&v187 > 1.0)
  {
    LODWORD(v187) = 1.0;
    [v6 setPeopleCountMaxNormalized:v187];
  }
  v188 = [v7 endDate];
  v189 = [v7 startDate];
  [v188 timeIntervalSinceDate:v189];
  double v191 = v190;

  if (v191 <= 0.0)
  {
    [v6 setPeopleCountWeightedSumNormalized:0.0];
  }
  else
  {
    v192 = [v7 endDate];
    v193 = [v7 startDate];
    [v192 timeIntervalSinceDate:v193];
    double v195 = v194;

    v196 = [v7 metaDataForRank];
    v197 = [v196 objectForKey:@"PeopleCountWeightedSum"];

    if (v197)
    {
      float v198 = v195 * v179;
      [v197 floatValue];
      *(float *)&double v199 = *(float *)&v199 / v198;
    }
    else
    {
      double v199 = 0.0;
    }
    [v6 setPeopleCountWeightedSumNormalized:v199];
    [v6 peopleCountWeightedSumNormalized];
    if (*(float *)&v200 > 1.0)
    {
      LODWORD(v200) = 1.0;
      [v6 setPeopleCountWeightedSumNormalized:v200];
    }
  }
  v201 = [v7 metaDataForRank];
  v202 = [v201 objectForKey:@"PeopleDensityWeightedAverage"];

  float v204 = 0.0;
  if (v202)
  {
    [v6 interestingPOIFeature];
    if (v205 > 0.0 || [v7 interfaceType] == (id)1)
    {
      [v202 floatValue];
      float v204 = *(float *)&v203 / v179;
    }
  }
  *(float *)&double v203 = v204;
  [v6 setPeopleDensityWeightedAverageNormalized:v203];
  [v6 peopleDensityWeightedAverageNormalized];
  if (*(float *)&v206 > 1.0)
  {
    LODWORD(v206) = 1.0;
    [v6 setPeopleDensityWeightedAverageNormalized:v206];
  }
  v207 = [v7 metaDataForRank];
  v208 = [v207 objectForKey:@"PeopleDensityMax"];

  if (v208)
  {
    [v208 floatValue];
    *(float *)&double v209 = *(float *)&v209 / v179;
  }
  else
  {
    double v209 = 0.0;
  }
  [v6 setPeopleDensityMaxNormalized:v209, v181];
  [v6 peopleDensityMaxNormalized];
  float v211 = 1.0;
  if (*(float *)&v210 > 1.0)
  {
    LODWORD(v210) = 1.0;
    [v6 setPeopleDensityMaxNormalized:v210];
  }
  v212 = [v7 metaDataForRank];
  v213 = [v212 objectForKeyedSubscript:@"TimeAtHomeDuration"];
  [v213 floatValue];
  float v215 = v214;
  v216 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v217 = [v216 objectForKeyedSubscript:@"timeAtHomeDurationThreshold"];
  [v217 floatValue];
  *(float *)&double v219 = v215 / v218;
  [v6 setTimeAtHomeDuration:v219];

  v220 = [v7 metaDataForRank];
  v221 = [v220 objectForKey:@"StateOfMindLabels"];

  v222 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v223 = [v222 objectForKeyedSubscript:@"stateOfMindLabelCountThreshold"];
  [v223 doubleValue];
  double v225 = v224;

  double v226 = (double)(unint64_t)[v221 count];
  if (v225 > v226)
  {
    double v226 = (double)(unint64_t)[v221 count] / v225;
    float v211 = v226;
  }
  *(float *)&double v226 = v211;
  [v6 setStateOfMindLabelCountNormalized:v226];
  v227 = [v7 metaDataForRank];
  v228 = [v227 objectForKey:@"StateOfMindDomains"];

  v229 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  v230 = [v229 objectForKeyedSubscript:@"stateOfMindDomainCountThreshold"];
  [v230 doubleValue];
  double v232 = v231;

  double v233 = (double)(unint64_t)[v228 count];
  LODWORD(v234) = 1.0;
  if (v232 > v233)
  {
    double v234 = (double)(unint64_t)[v228 count];
    *(float *)&double v234 = v234;
  }
  [v6 setStateOfMindDomainCountNormalized:v234];
  v235 = [v7 metaDataForRank];
  v236 = [v235 objectForKey:@"StateOfMindLoggedIn3pApp"];
  *(float *)&double v237 = (float)[v236 BOOLValue];
  [v6 setStateOfMindLoggedIn3pApp:v237];

  v238 = [v7 metaDataForRank];
  v239 = [v238 objectForKey:@"StateOfMindLoggedInJournalApp"];
  *(float *)&double v240 = (float)[v239 BOOLValue];
  [v6 setStateOfMindLoggedInJournalApp:v240];

  [v6 setIsBundleAggregated:[v7 isAggregatedAndSuppressed]];
  [v6 setSummarizationGranularity:[v7 summarizationGranularity]];
  [v6 setAvgSubBundleGoodnessScores:0.0];
  if ([v7 interfaceType] == (id)15)
  {
    v241 = [v7 clusterMetadata];
    v242 = [v241 subBundleGoodnessScores];
    v243 = [v242 valueForKeyPath:@"@avg.self"];
    [v243 floatValue];
    [v6 setAvgSubBundleGoodnessScores:];
  }
}

- (void)_fillRichnessInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setBundleInterfaceType:[v6 interfaceType]];
  [v5 setBundleSubType:[v6 bundleSubType]];
  [v5 setBundleSuperType:[v6 bundleSuperType]];
  [v5 setEvergreenType:0];
  [v5 setEvergreenPromptExists:0];
  if ([v6 interfaceType] == (id)11)
  {
    id v7 = [v6 resources];
    id v8 = [v7 count];

    if (v8)
    {
      double v9 = [v6 resources];
      unsigned int v10 = [v9 firstObject];

      v11 = [v10 name];
      [v5 setEvergreenType:v11];

      unsigned __int8 v12 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[MOEventBundleRanking _fillRichnessInfoForRanking:forBundle:](v5);
      }

      double v13 = [v10 promptIndexes];
      BOOL v14 = [v13 count] == 0;

      if (!v14)
      {
        [v5 setEvergreenPromptExists:1];
        uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[MOEventBundleRanking _fillRichnessInfoForRanking:forBundle:]();
        }
      }
    }
  }
  uint64_t v16 = (void *)visitSubtypeVariants;
  uint64_t v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 bundleSubType]);
  if (([v16 containsObject:v17] & 1) != 0
    || [v6 bundleSubType] == (id)105)
  {
    int v18 = 0;
  }
  else
  {
    float v32 = (void *)phoneSensedWalkingVariants;
    uint64_t v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 bundleSubType]);
    if (([v32 containsObject:v16] & 1) == 0)
    {

LABEL_35:
      [v5 setAllPlaceNames:emptyStringSet];
      goto LABEL_36;
    }
    int v18 = 1;
  }
  uint64_t v19 = [v6 place];
  if (v19)
  {

    if (v18) {
    goto LABEL_17;
    }
  }
  double v31 = [v6 places];

  if (v18)
  {

    if (!v31) {
      goto LABEL_35;
    }
  }
  else
  {

    if (!v31) {
      goto LABEL_35;
    }
  }
LABEL_17:
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__30;
  v109 = __Block_byref_object_dispose__30;
  id v110 = (id)objc_opt_new();
  uint64_t v20 = [v6 place];
  uint64_t v21 = [v20 placeName];
  BOOL v22 = v21 == 0;

  if (!v22)
  {
    id v23 = (void *)v106[5];
    double v24 = [v6 place];
    float v25 = [v24 placeName];
    [v23 addObject:v25];
  }
  float v26 = [v6 places];
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    double v28 = [v6 places];
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke;
    v104[3] = &unk_1002D0898;
    v104[4] = &v105;
    [v28 enumerateObjectsUsingBlock:v104];
  }
  id v29 = [(id)v106[5] count];
  if (v29) {
    id v30 = [(id)v106[5] copy];
  }
  else {
    id v30 = (id)emptyStringSet;
  }
  [v5 setAllPlaceNames:v30];
  if (v29) {

  }
  _Block_object_dispose(&v105, 8);
LABEL_36:
  if ([v6 bundleSuperType] != (id)3
    || ([v6 persons],
        double v33 = objc_claimAutoreleasedReturnValue(),
        BOOL v34 = v33 == 0,
        v33,
        v34))
  {
    [v5 setAllContactIdentifiers:emptyStringSet];
  }
  else
  {
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x3032000000;
    v108 = __Block_byref_object_copy__30;
    v109 = __Block_byref_object_dispose__30;
    id v110 = (id)objc_opt_new();
    uint64_t v35 = [v6 persons];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_2;
    v103[3] = &unk_1002D08C0;
    v103[4] = &v105;
    [v35 enumerateObjectsUsingBlock:v103];

    id v36 = [(id)v106[5] count];
    if (v36) {
      id v37 = [(id)v106[5] copy];
    }
    else {
      id v37 = (id)emptyStringSet;
    }
    [v5 setAllContactIdentifiers:v37];
    if (v36) {

    }
    _Block_object_dispose(&v105, 8);
  }
  float v38 = (void *)workoutSubtypeVariants;
  uint64_t v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 bundleSubType]);
  if ([v38 containsObject:v39]) {
    goto LABEL_49;
  }
  uint64_t v40 = (void *)phoneSensedWalkingVariants;
  float v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 bundleSubType]);
  if (([v40 containsObject:v41] & 1) != 0
    || [v6 bundleSubType] == (id)203)
  {

LABEL_49:
    goto LABEL_50;
  }
  BOOL v82 = [v6 bundleSubType] == (id)202;

  if (!v82)
  {
    [v5 setWorkoutTypes:emptyStringSet];
    goto LABEL_62;
  }
LABEL_50:
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__30;
  v109 = __Block_byref_object_dispose__30;
  id v110 = (id)objc_opt_new();
  float v42 = [v6 action];
  double v43 = [v42 actionName];
  if (!v43)
  {
LABEL_53:

    goto LABEL_54;
  }
  BOOL v44 = [v6 bundleSubType] == (id)202;

  if (!v44)
  {
    uint64_t v45 = (void *)v106[5];
    float v42 = [v6 action];
    id v46 = [v42 actionName];
    [v45 addObject:v46];

    goto LABEL_53;
  }
LABEL_54:
  v47 = [v6 actions];
  BOOL v48 = v47 == 0;

  if (!v48)
  {
    id v49 = [v6 actions];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_3;
    v102[3] = &unk_1002D08E8;
    v102[4] = &v105;
    [v49 enumerateObjectsUsingBlock:v102];
  }
  id v50 = [(id)v106[5] count];
  if (v50) {
    id v51 = [(id)v106[5] copy];
  }
  else {
    id v51 = (id)emptyStringSet;
  }
  [v5 setWorkoutTypes:v51];
  if (v50) {

  }
  _Block_object_dispose(&v105, 8);
LABEL_62:
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_4;
  v100[3] = &unk_1002CD2A0;
  id v52 = objc_alloc_init((Class)NSCountedSet);
  id v101 = v52;
  [v6 withResourcesUsingBlock:v100];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v52;
  unint64_t v53 = 0;
  id v54 = [obj countByEnumeratingWithState:&v96 objects:v112 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v97;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v97 != v55) {
          objc_enumerationMutation(obj);
        }
        double v57 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        if ([v57 intValue] && objc_msgSend(v57, "intValue") != 12) {
          ++v53;
        }
      }
      id v54 = [obj countByEnumeratingWithState:&v96 objects:v112 count:16];
    }
    while (v54);
  }

  double v85 = objc_opt_new();
  *(float *)&double v58 = (float)v53 / 7.0;
  double v59 = +[NSNumber numberWithFloat:v58];
  [v85 setObject:v59 forKey:@"RankingRichnessPrimaryPriorityScoreKey"];

  [v85 setObject:&off_1002F9510 forKey:@"RankingRichnessSecondaryPriorityScoreKey"];
  [v85 setObject:&off_1002F9510 forKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];
  [v5 setNumPhotoAssetsResourcesNormalized:0.0];
  [v5 setNumMediaTypeResourcesNormalized:0.0];
  float v60 = objc_opt_new();
  [v60 setObject:v85 forKey:@"NumUniqueResourceTypesNormalizedKey"];
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_937;
  v92[3] = &unk_1002D0910;
  id v84 = v5;
  id v93 = v84;
  id v86 = v60;
  id v94 = v86;
  id v95 = v6;
  id v83 = v95;
  [v95 withResourcesUsingBlock:v92];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  double v61 = [v86 allKeys];
  id v62 = [v61 countByEnumeratingWithState:&v88 objects:v111 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v89;
    do
    {
      for (j = 0; j != v62; j = (char *)j + 1)
      {
        if (*(void *)v89 != v63) {
          objc_enumerationMutation(v61);
        }
        double v65 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
        if (([v65 isEqualToString:@"NumUniqueResourceTypesNormalizedKey"] & 1) == 0)
        {
          id v66 = [v86 objectForKeyedSubscript:v65];
          float v67 = [v66 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
          [v67 floatValue];
          float v69 = v68;

          *(float *)&double v70 = v69 / 13.0;
          if ((float)(v69 / 13.0) > 1.0) {
            *(float *)&double v70 = 1.0;
          }
          double v71 = +[NSNumber numberWithFloat:v70];
          [v66 setObject:v71 forKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];

          float v72 = [v66 objectForKeyedSubscript:@"RankingRichnessSecondaryPriorityScoreKey"];
          [v72 floatValue];
          float v74 = v73;

          *(float *)&double v75 = v74 / 13.0;
          if ((float)(v74 / 13.0) > 1.0) {
            *(float *)&double v75 = 1.0;
          }
          double v76 = +[NSNumber numberWithFloat:v75];
          [v66 setObject:v76 forKeyedSubscript:@"RankingRichnessSecondaryPriorityScoreKey"];

          double v77 = [v66 objectForKeyedSubscript:@"RankingRichnessAuxiliaryPriorityScoreKey"];
          [v77 floatValue];
          float v79 = v78;

          *(float *)&double v80 = v79 / 13.0;
          if ((float)(v79 / 13.0) > 1.0) {
            *(float *)&double v80 = 1.0;
          }
          float v81 = +[NSNumber numberWithFloat:v80];
          [v66 setObject:v81 forKeyedSubscript:@"RankingRichnessAuxiliaryPriorityScoreKey"];
        }
      }
      id v62 = [v61 countByEnumeratingWithState:&v88 objects:v111 count:16];
    }
    while (v62);
  }

  [v84 setBundleRichnessDict:v86];
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 placeName];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = [v6 placeName];
    [v4 addObject:v5];
  }
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 contactIdentifier];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = [v6 contactIdentifier];
    [v4 addObject:v5];
  }
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 actionName];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = [v6 actionName];
    [v4 addObject:v5];
  }
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a2 type]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_937(uint64_t a1, void *a2)
{
  id v50 = a2;
  if ([v50 type] == (id)2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 numPhotoAssetsResourcesNormalized];
    *(float *)&double v5 = v4 + 1.0;
    [v3 setNumPhotoAssetsResourcesNormalized:v5];
  }
  id v6 = +[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", [v50 type]);
  id v7 = [*(id *)(a1 + 40) objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    double v9 = [v7 objectForKey:@"RankingRichnessPrimaryPriorityScoreKey"];
    [v9 floatValue];
    float v11 = v10;

    unsigned __int8 v12 = [v8 objectForKey:@"RankingRichnessSecondaryPriorityScoreKey"];
    [v12 floatValue];
    float v14 = v13;

    uint64_t v15 = [v8 objectForKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];
    [v15 floatValue];
    float v17 = v16;
  }
  else
  {
    float v14 = 0.0;
    float v17 = 0.0;
    float v11 = 0.0;
  }
  [v50 priorityScore];
  if (v18 >= 200.0)
  {
    [v50 priorityScore];
    if (v23 < 300.0)
    {
      if ([v50 type] == (id)2)
      {
        double v24 = [v50 photoCurationScore];
        [v24 floatValue];
        float v26 = v25;

        if (v26 == 0.0)
        {
          float v14 = v14 + 0.5;
          goto LABEL_36;
        }
        float v38 = [v50 photoCurationScore];
        [v38 floatValue];
        float v14 = v14 + v43;
        goto LABEL_35;
      }
      id v36 = (void *)thirdPartyMediaSubtypeVariants;
      id v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) bundleSubType]);
      LODWORD(v36) = [v36 containsObject:v37];

      if (!v36) {
        float v14 = v14 + 1.0;
      }
      goto LABEL_36;
    }
    [v50 priorityScore];
    double v30 = v29;
    id v31 = [v50 type];
    HIDWORD(v22) = 1081294848;
    if (v30 < 308.0)
    {
      if (v31 == (id)2)
      {
        float v32 = [v50 photoCurationScore];
        [v32 floatValue];
        float v34 = v33;

        if (v34 == 0.0)
        {
          float v35 = 0.5;
          goto LABEL_27;
        }
        float v38 = [v50 photoCurationScore];
        [v38 floatValue];
        float v17 = v17 + v44;
      }
      else
      {
        uint64_t v40 = (void *)thirdPartyMediaSubtypeVariants;
        float v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) bundleSubType]);
        if (![v40 containsObject:v38])
        {
          float v41 = (void *)MediaWeeklySummarySubtypeVariants;
          float v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) bundleSubType]);
          LODWORD(v41) = [v41 containsObject:v42];

          if (!v41) {
            float v17 = v17 + 1.0;
          }
          goto LABEL_36;
        }
      }
LABEL_35:

      goto LABEL_36;
    }
    if (v31 != (id)10 && [v50 type] != (id)6) {
      goto LABEL_36;
    }
    float v35 = 1.0;
LABEL_27:
    float v17 = v17 + v35;
    goto LABEL_36;
  }
  if ([v50 type] == (id)2)
  {
    uint64_t v19 = [v50 photoCurationScore];
    [v19 floatValue];
    float v21 = v20;

    if (v21 == 0.0)
    {
      float v11 = v11 + 0.5;
      goto LABEL_36;
    }
    float v38 = [v50 photoCurationScore];
    [v38 floatValue];
    float v11 = v11 + v39;
    goto LABEL_35;
  }
  BOOL v27 = (void *)thirdPartyMediaSubtypeVariants;
  double v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) bundleSubType]);
  LODWORD(v27) = [v27 containsObject:v28];

  if (!v27) {
    float v11 = v11 + 1.0;
  }
LABEL_36:
  if (!v8) {
    id v8 = objc_opt_new();
  }
  *(float *)&double v22 = v11;
  uint64_t v45 = +[NSNumber numberWithFloat:v22];
  [v8 setObject:v45 forKey:@"RankingRichnessPrimaryPriorityScoreKey"];

  *(float *)&double v46 = v14;
  v47 = +[NSNumber numberWithFloat:v46];
  [v8 setObject:v47 forKey:@"RankingRichnessSecondaryPriorityScoreKey"];

  *(float *)&double v48 = v17;
  id v49 = +[NSNumber numberWithFloat:v48];
  [v8 setObject:v49 forKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];

  [*(id *)(a1 + 40) setObject:v8 forKey:v6];
}

- (void)_fillDistincnessInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setNumAnomalyEventsNormalized:0.0];
  [v5 setNumTrendEventsNormalized:0.0];
  [v5 setNumRoutineEventsNormalized:0.0];
  [v5 setNumStateOfMindEventsNormalized:0.0];
  v47 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [v6 events];
  id v7 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v55;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        float v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ([v10 provider] == (id)5)
        {
          float v11 = [v10 patterns];
          unsigned __int8 v12 = [v11 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
          unsigned __int8 v13 = [v12 isEqual:&off_1002F73B8];

          if (v13) {
            continue;
          }
          float v14 = [v10 patterns];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"kEventPatternType"];
          unsigned int v16 = [v15 intValue];

          switch(v16)
          {
            case 2u:
              [v5 numRoutineEventsNormalized];
              *(float *)&double v22 = v21 + 1.0;
              [v5 setNumRoutineEventsNormalized:v22];
              break;
            case 1u:
              [v5 numTrendEventsNormalized];
              *(float *)&double v20 = v19 + 1.0;
              [v5 setNumTrendEventsNormalized:v20];
              break;
            case 0u:
              [v5 numAnomalyEventsNormalized];
              *(float *)&double v18 = v17 + 1.0;
              [v5 setNumAnomalyEventsNormalized:v18];
              break;
          }
        }
        uint64_t v50 = 0;
        id v51 = &v50;
        uint64_t v52 = 0x2020000000;
        char v53 = 0;
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = __65__MOEventBundleRanking__fillDistincnessInfoForRanking_forBundle___block_invoke;
        v49[3] = &unk_1002D0938;
        v49[4] = &v50;
        [v6 withResourcesUsingBlock:v49];
        if ([v10 category] == (id)24 && objc_msgSend(v10, "provider") != (id)5 && *((unsigned char *)v51 + 24))
        {
          [v5 numStateOfMindEventsNormalized];
          *(float *)&double v24 = v23 + 1.0;
          [v5 setNumStateOfMindEventsNormalized:v24];
          float v25 = [v10 identifierFromProvider];
          [v47 addObject:v25];
        }
        _Block_object_dispose(&v50, 8);
      }
      id v7 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v7);
  }

  [v5 numAnomalyEventsNormalized];
  *(float *)&double v27 = v26 * 0.25;
  [v5 setNumAnomalyEventsNormalized:v27];
  [v5 numAnomalyEventsNormalized];
  if (*(float *)&v28 > 1.0)
  {
    LODWORD(v28) = 1.0;
    [v5 setNumAnomalyEventsNormalized:v28];
  }
  [v5 numTrendEventsNormalized];
  *(float *)&double v30 = v29 * 0.25;
  [v5 setNumTrendEventsNormalized:v30];
  [v5 numTrendEventsNormalized];
  if (*(float *)&v31 > 1.0)
  {
    LODWORD(v31) = 1.0;
    [v5 setNumTrendEventsNormalized:v31];
  }
  [v5 numRoutineEventsNormalized];
  *(float *)&double v33 = v32 * 0.25;
  [v5 setNumRoutineEventsNormalized:v33];
  [v5 numRoutineEventsNormalized];
  if (*(float *)&v34 > 1.0)
  {
    LODWORD(v34) = 1.0;
    [v5 setNumRoutineEventsNormalized:v34];
  }
  if ([v5 bundleInterfaceType] == (id)4)
  {
    [v5 numAnomalyEventsNormalized];
    BOOL v36 = v35 <= 0.0;
    double v37 = 0.0;
    if (!v36) {
      *(float *)&double v37 = 1.0;
    }
    [v5 setNumAnomalyEventsNormalized:v37];
    [v5 numTrendEventsNormalized];
    BOOL v36 = v38 <= 0.0;
    double v39 = 0.0;
    if (!v36) {
      *(float *)&double v39 = 1.0;
    }
    [v5 setNumTrendEventsNormalized:v39];
    [v5 numRoutineEventsNormalized];
    BOOL v36 = v40 <= 0.0;
    double v41 = 0.0;
    if (!v36) {
      *(float *)&double v41 = 1.0;
    }
    [v5 setNumRoutineEventsNormalized:v41];
  }
  [v5 numStateOfMindEventsNormalized];
  if (v42 <= 0.0)
  {
    uint64_t v46 = emptyStringSet;
  }
  else
  {
    [v5 numStateOfMindEventsNormalized];
    *(float *)&double v44 = v43 * 0.25;
    [v5 setNumStateOfMindEventsNormalized:v44];
    [v5 numStateOfMindEventsNormalized];
    uint64_t v46 = (uint64_t)v47;
    if (*(float *)&v45 > 1.0)
    {
      LODWORD(v45) = 1.0;
      [v5 setNumStateOfMindEventsNormalized:v47, v45];
      uint64_t v46 = (uint64_t)v47;
    }
  }
  [v5 setAllStateOfMindIdentifiers:v46];
}

id __65__MOEventBundleRanking__fillDistincnessInfoForRanking_forBundle___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id result = [a2 type];
  if (result == (id)16)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)_fillEngagementInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  [v24 setSuggestionIsDeleted:[v6 hasSuggestionEngagementEvent:@"suggestionsDeleted"]];
  [v24 setSuggestionIsSelected:[v6 hasSuggestionEngagementEvent:@"suggestionsSelected"]];
  [v24 setSuggestionQuickAddEntry:[v6 hasSuggestionEngagementEvent:@"suggestionsQuickAddEntry"]];
  [v24 setJournalEntryIsEdited:[v6 hasAppEntryEngagementEvent:@"appEntryEdited"]];
  [v24 setJournalEntryIsCreated:[v6 hasAppEntryEngagementEvent:@"appEntryCreated"]];
  [v24 setJournalEntryIsCancelled:[v6 hasAppEntryEngagementEvent:@"appEntryCancelled"]];
  [v24 setJournalEntryIsDeleted:[v6 hasAppEntryEngagementEvent:@"appEntryDeleted"]];
  [v24 setViewCountNormalized:0.0];
  id v7 = [(MOEventBundleRanking *)self viewCountBasedAdjustmentParameterDict];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"minDaysElapsedForAdjustment"];
  [v8 floatValue];
  float v10 = v9;

  float v11 = [(MOEventBundleRanking *)self viewCountBasedAdjustmentParameterDict];
  unsigned __int8 v12 = [v11 objectForKeyedSubscript:@"minViewCountForAdjustment"];
  [v12 floatValue];
  float v14 = v13;

  uint64_t v15 = [(MOEventBundleRanking *)self viewCountBasedAdjustmentParameterDict];
  unsigned int v16 = [v15 objectForKeyedSubscript:@"maxViewCountForAdjustment"];
  [v16 floatValue];
  float v18 = v17;

  if ([v6 suggestionEngagementViewCount])
  {
    if (([v6 hasSuggestionEngagementEvent:@"suggestionsSelected"] & 1) == 0
      && ([v6 hasSuggestionEngagementEvent:@"suggestionsQuickAddEntry"] & 1) == 0
      && ([v6 hasSuggestionEngagementEvent:@"suggestionsDeleted"] & 1) == 0)
    {
      [v24 bundleRecencyDaysElapsed];
      if (v19 > v10)
      {
        double v20 = fmax((float)((float)(unint64_t)[v6 suggestionEngagementViewCount] - v14), 0.0);
        *(float *)&double v20 = v20;
        [v24 setViewCountNormalized:v20];
        [v24 viewCountNormalized];
        *(float *)&double v22 = v21 / (float)(v18 - v14);
        [v24 setViewCountNormalized:v22];
        [v24 viewCountNormalized];
        if (*(float *)&v23 > 1.0)
        {
          LODWORD(v23) = 1.0;
          [v24 setViewCountNormalized:v23];
        }
      }
    }
  }
}

- (MOEventBundleRanking)initWithUniverse:(id)a3
{
  if (a3)
  {
    float v4 = [a3 getService:@"MOConfigurationManager"];
    self = [(MOEventBundleRanking *)self initWithConfigurationManager:v4];

    id v5 = self;
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking initWithUniverse:]();
    }

    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MOEventBundleRanking.m" lineNumber:1068 description:@"Invalid parameter not satisfying: universe"];

    id v5 = 0;
  }

  return v5;
}

- (MOEventBundleRanking)initWithConfigurationManager:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v556.receiver = self;
    v556.super_class = (Class)MOEventBundleRanking;
    id v7 = [(MOEventBundleRanking *)&v556 init];
    if (v7)
    {
      id v534 = v6;
      +[MOEventBundleRanking defineClassCollections];
      rankingAlgorithmVersion = v7->_rankingAlgorithmVersion;
      v7->_rankingAlgorithmVersion = (NSString *)@"17.2.0";

      p_configurationManager = (void **)&v7->_configurationManager;
      objc_storeStrong((id *)&v7->_configurationManager, a3);
      v7->_isInternalBuild = +[MOPlatformInfo isInternalBuild];
      configurationManager = v7->_configurationManager;
      float v10 = NSAssertionHandler_ptr;
      float v11 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"diversityCoefficientAlpha"];
      LODWORD(v12) = 1120403456;
      [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v11 withFallback:v12];
      v7->_frequencyPenalty = v13;

      float v14 = v7->_configurationManager;
      uint64_t v15 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"engagementScoreWeight"];
      LODWORD(v16) = 1036831949;
      [(MOConfigurationManagerBase *)v14 getFloatSettingForKey:v15 withFallback:v16];
      v7->_engagementScoreWeight = v17;

      float v18 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[MOEventBundleRanking initWithConfigurationManager:].cold.4((uint64_t)&v7->_engagementScoreWeight, v18, v19, v20, v21, v22, v23, v24);
      }

      HIDWORD(v25) = 1072483532;
      *(float *)&double v25 = 0.9;
      [(MOConfigurationManagerBase *)v7->_configurationManager getFloatSettingForKey:@"VA_RecommendedTabVisitFIThreshold" withFallback:v25];
      v7->_recommendedTabVisitFIThreshold = v26;
      double v27 = (NSDictionary *)objc_opt_new();
      double v28 = v7->_configurationManager;
      float v29 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"distanceToHomeThreshold"];
      LODWORD(v30) = 10.0;
      [(MOConfigurationManagerBase *)v28 getFloatSettingForKey:v29 withFallback:v30];
      double v31 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v31 forKeyedSubscript:@"distanceToHomeThreshold"];

      float v32 = v7->_configurationManager;
      double v33 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"callDurationThreshold"];
      LODWORD(v34) = 1172373504;
      [(MOConfigurationManagerBase *)v32 getFloatSettingForKey:v33 withFallback:v34];
      float v35 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v35 forKeyedSubscript:@"callDurationThreshold"];

      BOOL v36 = v7->_configurationManager;
      double v37 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"workoutDurationThreshold"];
      LODWORD(v38) = 1180762112;
      [(MOConfigurationManagerBase *)v36 getFloatSettingForKey:v37 withFallback:v38];
      double v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v39 forKeyedSubscript:@"workoutDurationThreshold"];

      float v40 = v7->_configurationManager;
      double v41 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"WeeklySummaryWorkoutDurationThreshold"];
      LODWORD(v42) = 1187307520;
      [(MOConfigurationManagerBase *)v40 getFloatSettingForKey:v41 withFallback:v42];
      float v43 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v43 forKeyedSubscript:@"WeeklySummaryWorkoutDurationThreshold"];

      double v44 = v7->_configurationManager;
      double v45 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"timeAtHomeDurationThreshold"];
      LODWORD(v46) = 1202241536;
      [(MOConfigurationManagerBase *)v44 getFloatSettingForKey:v45 withFallback:v46];
      v47 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v47 forKeyedSubscript:@"timeAtHomeDurationThreshold"];

      double v48 = v7->_configurationManager;
      id v49 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"FIDownRankThreshold"];
      LODWORD(v50) = 0.75;
      [(MOConfigurationManagerBase *)v48 getFloatSettingForKey:v49 withFallback:v50];
      id v51 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v51 forKeyedSubscript:@"FIDownRankThreshold"];

      uint64_t v52 = v7->_configurationManager;
      char v53 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"burstyInteractionCountThreshold"];
      LODWORD(v54) = 1125515264;
      [(MOConfigurationManagerBase *)v52 getFloatSettingForKey:v53 withFallback:v54];
      long long v55 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v55 forKeyedSubscript:@"burstyInteractionCountThreshold"];

      long long v56 = v7->_configurationManager;
      long long v57 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxPeopleCountFromSocialContext"];
      LODWORD(v58) = 1115684864;
      [(MOConfigurationManagerBase *)v56 getFloatSettingForKey:v57 withFallback:v58];
      double v59 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v59 forKeyedSubscript:@"maxPeopleCountFromSocialContext"];

      float v60 = v7->_configurationManager;
      double v61 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"mediaPlayTimeThreshold"];
      LODWORD(v62) = 1177075712;
      [(MOConfigurationManagerBase *)v60 getFloatSettingForKey:v61 withFallback:v62];
      uint64_t v63 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v63 forKeyedSubscript:@"mediaPlayTimeThreshold"];

      float v64 = v7->_configurationManager;
      double v65 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weeklySummaryMediaPlayTimeThreshold"];
      LODWORD(v66) = 1187307520;
      [(MOConfigurationManagerBase *)v64 getFloatSettingForKey:v65 withFallback:v66];
      float v67 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v67 forKeyedSubscript:@"weeklySummaryMediaPlayTimeThreshold"];

      float v68 = v7->_configurationManager;
      float v69 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"shareCountThreshold"];
      LODWORD(v70) = 5.0;
      [(MOConfigurationManagerBase *)v68 getFloatSettingForKey:v69 withFallback:v70];
      double v71 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v71 forKeyedSubscript:@"shareCountThreshold"];

      float v72 = v7->_configurationManager;
      float v73 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"contactHoldOffThreshold"];
      LODWORD(v74) = -921458688;
      [(MOConfigurationManagerBase *)v72 getFloatSettingForKey:v73 withFallback:v74];
      double v75 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v75 forKeyedSubscript:@"contactHoldOffThreshold"];

      double v76 = v7->_configurationManager;
      double v77 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"stateOfMindLabelCountThreshold"];
      LODWORD(v78) = 5.0;
      [(MOConfigurationManagerBase *)v76 getFloatSettingForKey:v77 withFallback:v78];
      float v79 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v79 forKeyedSubscript:@"stateOfMindLabelCountThreshold"];

      double v80 = v7->_configurationManager;
      float v81 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"stateOfMindDomainCountThreshold"];
      LODWORD(v82) = 5.0;
      [(MOConfigurationManagerBase *)v80 getFloatSettingForKey:v81 withFallback:v82];
      id v83 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v83 forKeyedSubscript:@"stateOfMindDomainCountThreshold"];

      id v84 = v7->_configurationManager;
      double v85 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForVisitSubTypeVariants"];
      LODWORD(v86) = -1130113270;
      [(MOConfigurationManagerBase *)v84 getFloatSettingForKey:v85 withFallback:v86];
      v87 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v87 forKeyedSubscript:@"suggestionAcceptThresholdForVisitSubTypeVariants"];

      long long v88 = v7->_configurationManager;
      long long v89 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForTripSubType"];
      LODWORD(v90) = -1130113270;
      [(MOConfigurationManagerBase *)v88 getFloatSettingForKey:v89 withFallback:v90];
      long long v91 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v91 forKeyedSubscript:@"suggestionAcceptThresholdForTripSubType"];

      v92 = v7->_configurationManager;
      id v93 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForWorkoutSubtype"];
      LODWORD(v94) = -1130113270;
      [(MOConfigurationManagerBase *)v92 getFloatSettingForKey:v93 withFallback:v94];
      id v95 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v95 forKeyedSubscript:@"suggestionAcceptThresholdForWorkoutSubtype"];

      long long v96 = v7->_configurationManager;
      long long v97 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForMotionActivityWalkingSubtype"];
      LODWORD(v98) = -1130113270;
      [(MOConfigurationManagerBase *)v96 getFloatSettingForKey:v97 withFallback:v98];
      long long v99 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v99 forKeyedSubscript:@"suggestionAcceptThresholdForMotionActivityWalkingSubtype"];

      double v100 = v7->_configurationManager;
      id v101 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForWorkoutWeeklySummarySubType"];
      LODWORD(v102) = -1.0;
      [(MOConfigurationManagerBase *)v100 getFloatSettingForKey:v101 withFallback:v102];
      float v103 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v103 forKeyedSubscript:@"suggestionAcceptThresholdForWorkoutWeeklySummarySubType"];

      float v104 = v7->_configurationManager;
      uint64_t v105 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForContactSubType"];
      LODWORD(v106) = -1.0;
      [(MOConfigurationManagerBase *)v104 getFloatSettingForKey:v105 withFallback:v106];
      uint64_t v107 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v107 forKeyedSubscript:@"suggestionAcceptThresholdForContactSubType"];

      v108 = v7->_configurationManager;
      v109 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForContactWeeklySummarySubType"];
      LODWORD(v110) = 1023671095;
      [(MOConfigurationManagerBase *)v108 getFloatSettingForKey:v109 withFallback:v110];
      double v111 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v111 forKeyedSubscript:@"suggestionAcceptThresholdForContactWeeklySummarySubType"];

      v112 = v7->_configurationManager;
      v113 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForDailyMediaVariants"];
      LODWORD(v114) = -1.0;
      [(MOConfigurationManagerBase *)v112 getFloatSettingForKey:v113 withFallback:v114];
      v115 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v115 forKeyedSubscript:@"suggestionAcceptThresholdForDailyMediaVariants"];

      v116 = v7->_configurationManager;
      unsigned int v117 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForWeeklyMediaSummaryVariants"];
      LODWORD(v118) = -1.0;
      [(MOConfigurationManagerBase *)v116 getFloatSettingForKey:v117 withFallback:v118];
      v119 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v119 forKeyedSubscript:@"suggestionAcceptThresholdForWeeklyMediaSummaryVariants"];

      v120 = v7->_configurationManager;
      v121 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"];
      LODWORD(v122) = -1.0;
      [(MOConfigurationManagerBase *)v120 getFloatSettingForKey:v121 withFallback:v122];
      v123 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v123 forKeyedSubscript:@"suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"];

      v124 = v7->_configurationManager;
      v125 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForVisitSubTypeVariants"];
      LODWORD(v126) = 1017370378;
      [(MOConfigurationManagerBase *)v124 getFloatSettingForKey:v125 withFallback:v126];
      v127 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v127 forKeyedSubscript:@"suggestionRecommendThresholdForVisitSubTypeVariants"];

      float v128 = v7->_configurationManager;
      float v129 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForTripSubType"];
      LODWORD(v130) = 1017370378;
      [(MOConfigurationManagerBase *)v128 getFloatSettingForKey:v129 withFallback:v130];
      v131 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v131 forKeyedSubscript:@"suggestionRecommendThresholdForTripSubType"];

      float v132 = v7->_configurationManager;
      float v133 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForWorkoutSubtype"];
      LODWORD(v134) = 1025758986;
      [(MOConfigurationManagerBase *)v132 getFloatSettingForKey:v133 withFallback:v134];
      v135 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v135 forKeyedSubscript:@"suggestionRecommendThresholdForWorkoutSubtype"];

      v136 = v7->_configurationManager;
      float v137 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForMotionActivityWalkingSubtype"];
      LODWORD(v138) = 1017370378;
      [(MOConfigurationManagerBase *)v136 getFloatSettingForKey:v137 withFallback:v138];
      v139 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v139 forKeyedSubscript:@"suggestionRecommendThresholdForMotionActivityWalkingSubtype"];

      float v140 = v7->_configurationManager;
      float v141 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForWorkoutWeeklySummarySubType"];
      LODWORD(v142) = 1025758986;
      [(MOConfigurationManagerBase *)v140 getFloatSettingForKey:v141 withFallback:v142];
      v143 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v143 forKeyedSubscript:@"suggestionRecommendThresholdForWorkoutWeeklySummarySubType"];

      v144 = v7->_configurationManager;
      v145 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForContactSubType"];
      LODWORD(v146) = 1028443341;
      [(MOConfigurationManagerBase *)v144 getFloatSettingForKey:v145 withFallback:v146];
      v147 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v147 forKeyedSubscript:@"suggestionRecommendThresholdForContactSubType"];

      v148 = v7->_configurationManager;
      v149 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForContactWeeklySummarySubType"];
      LODWORD(v150) = 1023671095;
      [(MOConfigurationManagerBase *)v148 getFloatSettingForKey:v149 withFallback:v150];
      float v151 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v151 forKeyedSubscript:@"suggestionRecommendThresholdForContactWeeklySummarySubType"];

      float v152 = v7->_configurationManager;
      double v153 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForDailyMediaVariants"];
      LODWORD(v154) = -1.0;
      [(MOConfigurationManagerBase *)v152 getFloatSettingForKey:v153 withFallback:v154];
      v155 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v155 forKeyedSubscript:@"suggestionRecommendThresholdForDailyMediaVariants"];

      v156 = v7->_configurationManager;
      v157 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForWeeklyMediaSummaryVariants"];
      LODWORD(v158) = -1.0;
      [(MOConfigurationManagerBase *)v156 getFloatSettingForKey:v157 withFallback:v158];
      float v159 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v159 forKeyedSubscript:@"suggestionRecommendThresholdForWeeklyMediaSummaryVariants"];

      v160 = v7->_configurationManager;
      v161 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"];
      LODWORD(v162) = 1025758986;
      [(MOConfigurationManagerBase *)v160 getFloatSettingForKey:v161 withFallback:v162];
      v163 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v163 forKeyedSubscript:@"suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"];

      v164 = v7->_configurationManager;
      float v165 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"summarizationThresholdForVisitSubTypeVariants"];
      LODWORD(v166) = -1130113270;
      [(MOConfigurationManagerBase *)v164 getFloatSettingForKey:v165 withFallback:v166];
      v167 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v167 forKeyedSubscript:@"summarizationThresholdForVisitSubTypeVariants"];

      v168 = v7->_configurationManager;
      float v169 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"summarizationThresholdForWorkoutSubType"];
      LODWORD(v170) = -1130113270;
      [(MOConfigurationManagerBase *)v168 getFloatSettingForKey:v169 withFallback:v170];
      v171 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v171 forKeyedSubscript:@"summarizationThresholdForWorkoutSubType"];

      v172 = v7->_configurationManager;
      float v173 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"summarizationThresholdForMotionActivityWalkingSubType"];
      LODWORD(v174) = -1130113270;
      [(MOConfigurationManagerBase *)v172 getFloatSettingForKey:v173 withFallback:v174];
      double v175 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v175 forKeyedSubscript:@"summarizationThresholdForMotionActivityWalkingSubType"];

      v176 = v7->_configurationManager;
      v177 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"tripSummarizationThresholdForVisitSubType"];
      LODWORD(v178) = 1025758986;
      [(MOConfigurationManagerBase *)v176 getFloatSettingForKey:v177 withFallback:v178];
      float v179 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v27 setObject:v179 forKeyedSubscript:@"tripSummarizationThresholdForVisitSubType"];

      v180 = v7->_configurationManager;
      v181 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"tripSummarizationThresholdForWorkoutSubType"];
      LODWORD(v182) = -1130113270;
      [(MOConfigurationManagerBase *)v180 getFloatSettingForKey:v181 withFallback:v182];
      double v183 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v533 = v27;
      [(NSDictionary *)v27 setObject:v183 forKeyedSubscript:@"tripSummarizationThresholdForWorkoutSubType"];

      v184 = (NSDictionary *)objc_opt_new();
      v185 = v7->_configurationManager;
      double v186 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectWorkVisitWithPhotos"];
      double v187 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v185 getBoolSettingForKey:v186 withFallback:0]];
      [(NSDictionary *)v184 setObject:v187 forKeyedSubscript:@"rejectWorkVisitWithPhotos"];

      v188 = v7->_configurationManager;
      v189 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectWorkVisitWithNoPhoto"];
      double v190 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v188 getBoolSettingForKey:v189 withFallback:1]];
      [(NSDictionary *)v184 setObject:v190 forKeyedSubscript:@"rejectWorkVisitWithNoPhoto"];

      double v191 = v7->_configurationManager;
      v192 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectShortVisit"];
      v193 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v191 getBoolSettingForKey:v192 withFallback:0]];
      [(NSDictionary *)v184 setObject:v193 forKeyedSubscript:@"rejectShortVisit"];

      double v194 = v7->_configurationManager;
      double v195 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"shortVisitDurationThresholdInSec"];
      LODWORD(v196) = 1150681088;
      [(MOConfigurationManagerBase *)v194 getFloatSettingForKey:v195 withFallback:v196];
      v197 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v184 setObject:v197 forKeyedSubscript:@"shortVisitDurationThresholdInSec"];

      float v198 = v7->_configurationManager;
      double v199 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectSignificantContactWithHighSignificanceScore"];
      double v200 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v198 getBoolSettingForKey:v199 withFallback:0]];
      [(NSDictionary *)v184 setObject:v200 forKeyedSubscript:@"rejectSignificantContactWithHighSignificanceScore"];

      v201 = v7->_configurationManager;
      v202 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"highContactSignificanceScoreThreshold"];
      LODWORD(v203) = 1064514355;
      [(MOConfigurationManagerBase *)v201 getFloatSettingForKey:v202 withFallback:v203];
      float v204 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v184 setObject:v204 forKeyedSubscript:@"highContactSignificanceScoreThreshold"];

      float v205 = v7->_configurationManager;
      double v206 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"minSensedBundleCountInRecommendedTab"];
      v207 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v205 getIntegerSettingForKey:v206 withFallback:10]];
      [(NSDictionary *)v184 setObject:v207 forKeyedSubscript:@"minSensedBundleCountInRecommendedTab"];

      v208 = v7->_configurationManager;
      double v209 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxDaysInRecommendedTabForWorkoutRoutine"];
      LODWORD(v210) = 7.0;
      [(MOConfigurationManagerBase *)v208 getFloatSettingForKey:v209 withFallback:v210];
      float v211 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v184 setObject:v211 forKeyedSubscript:@"maxDaysInRecommendedTabForWorkoutRoutine"];

      v212 = v7->_configurationManager;
      v213 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxDaysInRecommendedTabForContact"];
      LODWORD(v214) = 3.0;
      [(MOConfigurationManagerBase *)v212 getFloatSettingForKey:v213 withFallback:v214];
      float v215 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v184 setObject:v215 forKeyedSubscript:@"maxDaysInRecommendedTabForContact"];

      v216 = v7->_configurationManager;
      v217 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxDaysInRecommendedTabForStateOfMind"];
      LODWORD(v218) = 2.0;
      [(MOConfigurationManagerBase *)v216 getFloatSettingForKey:v217 withFallback:v218];
      double v219 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v184 setObject:v219 forKeyedSubscript:@"maxDaysInRecommendedTabForStateOfMind"];

      v220 = v7->_configurationManager;
      v221 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"daysToSuppressCoarseSummaryAfterOnboarding"];
      LODWORD(v222) = 7.0;
      [(MOConfigurationManagerBase *)v220 getFloatSettingForKey:v221 withFallback:v222];
      v223 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v535 = v184;
      [(NSDictionary *)v184 setObject:v223 forKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding"];

      double v224 = objc_opt_new();
      double v225 = v7->_configurationManager;
      double v226 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForInterestingPOI"];
      LODWORD(v227) = 1024148374;
      [(MOConfigurationManagerBase *)v225 getFloatSettingForKey:v226 withFallback:v227];
      v228 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v228 forKeyedSubscript:@"weightForInterestingPOI"];

      v229 = v7->_configurationManager;
      v230 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForDistanceFromHome"];
      LODWORD(v231) = 1024953680;
      [(MOConfigurationManagerBase *)v229 getFloatSettingForKey:v230 withFallback:v231];
      double v232 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v232 forKeyedSubscript:@"weightForDistanceFromHome"];

      double v233 = v7->_configurationManager;
      double v234 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForCallDuration"];
      LODWORD(v235) = 1041865114;
      [(MOConfigurationManagerBase *)v233 getFloatSettingForKey:v234 withFallback:v235];
      v236 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v236 forKeyedSubscript:@"weightForCallDuration"];

      double v237 = v7->_configurationManager;
      v238 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForBurstyInteractionCount"];
      LODWORD(v239) = 1028443341;
      [(MOConfigurationManagerBase *)v237 getFloatSettingForKey:v238 withFallback:v239];
      double v240 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v240 forKeyedSubscript:@"weightForBurstyInteractionCount"];

      v241 = v7->_configurationManager;
      v242 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForMultipleInteractionTypes"];
      [(MOConfigurationManagerBase *)v241 getFloatSettingForKey:v242 withFallback:0.0];
      v243 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v243 forKeyedSubscript:@"weightForMultipleInteractionTypes"];

      v244 = v7->_configurationManager;
      v245 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForContactLocationWork"];
      [(MOConfigurationManagerBase *)v244 getFloatSettingForKey:v245 withFallback:0.0];
      long long v246 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v246 forKeyedSubscript:@"weightForContactLocationWork"];

      long long v247 = v7->_configurationManager;
      long long v248 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForGroupConversation"];
      [(MOConfigurationManagerBase *)v247 getFloatSettingForKey:v248 withFallback:0.0];
      long long v249 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v249 forKeyedSubscript:@"weightForGroupConversation"];

      v250 = v7->_configurationManager;
      v251 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPCountMax"];
      [(MOConfigurationManagerBase *)v250 getFloatSettingForKey:v251 withFallback:0.0];
      v252 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v252 forKeyedSubscript:@"weightForPCountMax"];

      v253 = v7->_configurationManager;
      v254 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPCountWeightedAverage"];
      LODWORD(v255) = 1008981770;
      [(MOConfigurationManagerBase *)v253 getFloatSettingForKey:v254 withFallback:v255];
      v256 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v256 forKeyedSubscript:@"weightForPCountWeightedAverage"];

      v257 = v7->_configurationManager;
      v258 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPDensityWeightedAverage"];
      LODWORD(v259) = 1008981770;
      [(MOConfigurationManagerBase *)v257 getFloatSettingForKey:v258 withFallback:v259];
      v260 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v260 forKeyedSubscript:@"weightForPDensityWeightedAverage"];

      v261 = v7->_configurationManager;
      v262 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPCountWeightedSum"];
      [(MOConfigurationManagerBase *)v261 getFloatSettingForKey:v262 withFallback:0.0];
      v263 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v263 forKeyedSubscript:@"weightForPCountWeightedSum"];

      v264 = v7->_configurationManager;
      v265 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForItemFromMe"];
      LODWORD(v266) = 1017370378;
      [(MOConfigurationManagerBase *)v264 getFloatSettingForKey:v265 withFallback:v266];
      v267 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v267 forKeyedSubscript:@"weightForItemFromMe"];

      v268 = v7->_configurationManager;
      v269 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightShareCountFeature"];
      LODWORD(v270) = 1017370378;
      [(MOConfigurationManagerBase *)v268 getFloatSettingForKey:v269 withFallback:v270];
      v271 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v271 forKeyedSubscript:@"weightShareCountFeature"];

      v272 = v7->_configurationManager;
      v273 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForTimeAtHomeDuration"];
      [(MOConfigurationManagerBase *)v272 getFloatSettingForKey:v273 withFallback:0.0];
      v274 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v274 forKeyedSubscript:@"weightForTimeAtHomeDuration"];

      v275 = v7->_configurationManager;
      v276 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForWorkoutDurationNormalized"];
      LODWORD(v277) = 1050924810;
      [(MOConfigurationManagerBase *)v275 getFloatSettingForKey:v276 withFallback:v277];
      v278 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v278 forKeyedSubscript:@"weightForWorkoutDurationNormalized"];

      v279 = v7->_configurationManager;
      v280 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForFamiliarityIndex"];
      LODWORD(v281) = 1030322389;
      [(MOConfigurationManagerBase *)v279 getFloatSettingForKey:v280 withFallback:v281];
      v282 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v282 forKeyedSubscript:@"weightForFamiliarityIndex"];

      v283 = v7->_configurationManager;
      v284 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForIsFamilyContact"];
      LODWORD(v285) = 1008981770;
      [(MOConfigurationManagerBase *)v283 getFloatSettingForKey:v284 withFallback:v285];
      v286 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v286 forKeyedSubscript:@"weightForIsFamilyContact"];

      v287 = v7->_configurationManager;
      v288 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForIsCoworkerContact"];
      LODWORD(v289) = -1130113270;
      [(MOConfigurationManagerBase *)v287 getFloatSettingForKey:v288 withFallback:v289];
      v290 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v290 forKeyedSubscript:@"weightForIsCoworkerContact"];

      v291 = v7->_configurationManager;
      v292 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForMediaPlayTime"];
      LODWORD(v293) = 1026206379;
      [(MOConfigurationManagerBase *)v291 getFloatSettingForKey:v292 withFallback:v293];
      v294 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v294 forKeyedSubscript:@"weightForMediaPlayTime"];

      v295 = v7->_configurationManager;
      v296 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxBundleGoodnessScorePhotoMemory"];
      LODWORD(v297) = 1028443341;
      [(MOConfigurationManagerBase *)v295 getFloatSettingForKey:v296 withFallback:v297];
      v298 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v298 forKeyedSubscript:@"maxBundleGoodnessScorePhotoMemory"];

      v299 = v7->_configurationManager;
      v300 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"bundleGoodnessScoreIncrementPhotoMemory"];
      LODWORD(v301) = 1017370378;
      [(MOConfigurationManagerBase *)v299 getFloatSettingForKey:v300 withFallback:v301];
      v302 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v302 forKeyedSubscript:@"bundleGoodnessScoreIncrementPhotoMemory"];

      v303 = v7->_configurationManager;
      v304 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightStateOfMindLabelCountNormalized"];
      LODWORD(v305) = 1028443341;
      [(MOConfigurationManagerBase *)v303 getFloatSettingForKey:v304 withFallback:v305];
      v306 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v306 forKeyedSubscript:@"weightStateOfMindLabelCountNormalized"];

      v307 = v7->_configurationManager;
      v308 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightStateOfMindDomainCountNormalized"];
      LODWORD(v309) = 1028443341;
      [(MOConfigurationManagerBase *)v307 getFloatSettingForKey:v308 withFallback:v309];
      v310 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v310 forKeyedSubscript:@"weightStateOfMindDomainCountNormalized"];

      v311 = v7->_configurationManager;
      v312 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumFamilyNormalized"];
      LODWORD(v313) = 1022739087;
      [(MOConfigurationManagerBase *)v311 getFloatSettingForKey:v312 withFallback:v313];
      v314 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v314 forKeyedSubscript:@"weightForNumFamilyNormalized"];

      v315 = v7->_configurationManager;
      v316 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumFriendsNormalized"];
      LODWORD(v317) = 1022739087;
      [(MOConfigurationManagerBase *)v315 getFloatSettingForKey:v316 withFallback:v317];
      v318 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v318 forKeyedSubscript:@"weightForNumFidsNormalized"];

      v319 = v7->_configurationManager;
      v320 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumFriendsNormalized"];
      LODWORD(v321) = 1017370378;
      [(MOConfigurationManagerBase *)v319 getFloatSettingForKey:v320 withFallback:v321];
      v322 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v322 forKeyedSubscript:@"weightForNumFriendsNormalized"];

      v323 = v7->_configurationManager;
      v324 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumPetsNormalized"];
      LODWORD(v325) = 1017370378;
      [(MOConfigurationManagerBase *)v323 getFloatSettingForKey:v324 withFallback:v325];
      v326 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v326 forKeyedSubscript:@"weightForNumPetsNormalized"];

      v327 = v7->_configurationManager;
      v328 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumCoworkersNormalized"];
      LODWORD(v329) = 1014350479;
      [(MOConfigurationManagerBase *)v327 getFloatSettingForKey:v328 withFallback:v329];
      v330 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v224 setObject:v330 forKeyedSubscript:@"weightForNumCoworkersNormalized"];

      v331 = v7->_configurationManager;
      v332 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumOtherPersonsNormalized"];
      LODWORD(v333) = 1008981770;
      [(MOConfigurationManagerBase *)v331 getFloatSettingForKey:v332 withFallback:v333];
      v334 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v532 = v224;
      [v224 setObject:v334 forKeyedSubscript:@"weightForNumOtherPersonsNormalized"];

      v335 = (NSDictionary *)objc_opt_new();
      v336 = v7->_configurationManager;
      v337 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForViewCountBasedPenalty"];
      LODWORD(v338) = 0.125;
      [(MOConfigurationManagerBase *)v336 getFloatSettingForKey:v337 withFallback:v338];
      v339 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v335 setObject:v339 forKeyedSubscript:@"weightForViewCountBasedPenalty"];

      v340 = v7->_configurationManager;
      v341 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"minViewCountForAdjustment"];
      v342 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v340 getIntegerSettingForKey:v341 withFallback:2]];
      [(NSDictionary *)v335 setObject:v342 forKeyedSubscript:@"minViewCountForAdjustment"];

      v343 = v7->_configurationManager;
      v344 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxViewCountForAdjustment"];
      v345 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v343 getIntegerSettingForKey:v344 withFallback:12]];
      [(NSDictionary *)v335 setObject:v345 forKeyedSubscript:@"maxViewCountForAdjustment"];

      v346 = v7->_configurationManager;
      v347 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"minDaysElapsedForAdjustment"];
      v348 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v346 getIntegerSettingForKey:v347 withFallback:2]];
      v531 = v335;
      [(NSDictionary *)v335 setObject:v348 forKeyedSubscript:@"minDaysElapsedForAdjustment"];

      v349 = [(MOConfigurationManagerBase *)v7->_configurationManager fDefaultsManager];
      v350 = [v349 objectForKey:@"OnboardingDate"];

      v530 = v350;
      if (v350 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v351 = v350;
        v352 = +[NSDate date];
        [v352 timeIntervalSinceDate:v351];
        *(float *)&double v353 = v353 / 86400.0;
        v7->_elapsedDaysSinceOnboardingDate = *(float *)&v353;

        v354 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v354, OS_LOG_TYPE_DEBUG)) {
          [(MOEventBundleRanking *)(uint64_t)v351 initWithConfigurationManager:v354];
        }
      }
      else
      {
        v358 = [(NSDictionary *)v535 objectForKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding"];
        [v358 floatValue];
        v7->_elapsedDaysSinceOnboardingDate = v359 + 1.0;

        v351 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v351, OS_LOG_TYPE_DEBUG)) {
          -[MOEventBundleRanking initWithConfigurationManager:]((uint64_t)&v7->_elapsedDaysSinceOnboardingDate, v351, v360, v361, v362, v363, v364, v365);
        }
      }

      v543 = (NSDictionary *)objc_opt_new();
      v539 = (NSDictionary *)objc_opt_new();
      id obj = (id)objc_opt_new();
      id v550 = objc_alloc_init((Class)NSString);
      v541 = (NSDictionary *)objc_opt_new();
      v538 = (NSDictionary *)objc_opt_new();
      int v366 = 1;
      v542 = v7;
      do
      {
        unsigned int v545 = v366;
        switch(v366)
        {
          case 1:
            v367 = +[NSNumber numberWithInt:1];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v367];

            v368 = v7->_configurationManager;
            v369 = [v10[44] stringWithFormat:@"%@_ActivityInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v370) = 1120403456;
            [(MOConfigurationManagerBase *)v368 getFloatSettingForKey:v369 withFallback:v370];
            v371 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v372 = +[NSNumber numberWithInt:1];
            [(NSDictionary *)v541 setObject:v371 forKeyedSubscript:v372];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9520 forKeyedSubscript:@"weightForNumRoutineEventsNormalized"];
            [v373 setObject:&off_1002F9530 forKeyedSubscript:@"richnessScoreScalingParameter"];
            CFStringRef v374 = @"%@_ActivityInterfaceType";
            goto LABEL_31;
          case 2:
            v375 = +[NSNumber numberWithInt:2];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v375];

            v376 = v7->_configurationManager;
            v377 = [v10[44] stringWithFormat:@"%@_OutingInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v378) = 1120403456;
            [(MOConfigurationManagerBase *)v376 getFloatSettingForKey:v377 withFallback:v378];
            v379 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v380 = +[NSNumber numberWithInt:2];
            [(NSDictionary *)v541 setObject:v379 forKeyedSubscript:v380];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9530 forKeyedSubscript:@"weightForNumAnamolyEventsNormalized"];
            CFStringRef v374 = @"%@_OutingInterfaceType";
            goto LABEL_31;
          case 3:
            v381 = +[NSNumber numberWithInt:3];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v381];

            v382 = v7->_configurationManager;
            v383 = [v10[44] stringWithFormat:@"%@_PhotoMomentInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v384) = 1120403456;
            [(MOConfigurationManagerBase *)v382 getFloatSettingForKey:v383 withFallback:v384];
            v385 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v386 = +[NSNumber numberWithInt:3];
            [(NSDictionary *)v541 setObject:v385 forKeyedSubscript:v386];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            CFStringRef v374 = @"%@_PhotoMomentInterfaceType";
            goto LABEL_31;
          case 4:
            v387 = +[NSNumber numberWithInt:4];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v387];

            v388 = v7->_configurationManager;
            v389 = [v10[44] stringWithFormat:@"%@_SignificantContactInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v390) = 1120403456;
            [(MOConfigurationManagerBase *)v388 getFloatSettingForKey:v389 withFallback:v390];
            v391 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v392 = +[NSNumber numberWithInt:4];
            [(NSDictionary *)v541 setObject:v391 forKeyedSubscript:v392];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9540 forKeyedSubscript:@"weightForNumAnamolyEventsNormalized"];
            [v373 setObject:&off_1002F9540 forKeyedSubscript:@"weightForNumTrendEventsNormalized"];
            [v373 setObject:&off_1002F9550 forKeyedSubscript:@"richnessScoreScalingParameter"];
            [v373 setObject:&off_1002F9560 forKeyedSubscript:@"bundleScoreConstant"];
            CFStringRef v374 = @"%@_SignificantContactInterfaceType";
            goto LABEL_31;
          case 5:
            v393 = +[NSNumber numberWithInt:5];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v393];

            v394 = v7->_configurationManager;
            v395 = [v10[44] stringWithFormat:@"%@_YourMediaInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v396) = 1120403456;
            [(MOConfigurationManagerBase *)v394 getFloatSettingForKey:v395 withFallback:v396];
            v397 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v398 = +[NSNumber numberWithInt:5];
            [(NSDictionary *)v541 setObject:v397 forKeyedSubscript:v398];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            CFStringRef v374 = @"%@_YourMediaInterfaceType";
            goto LABEL_31;
          case 6:
            v399 = +[NSNumber numberWithInt:6];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v399];

            v400 = v7->_configurationManager;
            v401 = [v10[44] stringWithFormat:@"%@_YourSharedContentInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v402) = 1120403456;
            [(MOConfigurationManagerBase *)v400 getFloatSettingForKey:v401 withFallback:v402];
            v403 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v404 = +[NSNumber numberWithInt:6];
            [(NSDictionary *)v541 setObject:v403 forKeyedSubscript:v404];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9570 forKeyedSubscript:@"bundleScoreConstant"];
            CFStringRef v374 = @"%@_YourSharedContentInterfaceType";
            goto LABEL_31;
          case 7:
            v405 = +[NSNumber numberWithInt:7];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v405];

            v406 = v7->_configurationManager;
            v407 = [v10[44] stringWithFormat:@"%@_YourTimeAtHomeInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v408) = 1120403456;
            [(MOConfigurationManagerBase *)v406 getFloatSettingForKey:v407 withFallback:v408];
            v409 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v410 = +[NSNumber numberWithInt:7];
            [(NSDictionary *)v541 setObject:v409 forKeyedSubscript:v410];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9580 forKeyedSubscript:@"bundleScoreConstant"];
            [v373 setObject:&off_1002F9590 forKeyedSubscript:@"bundleScoreScalingParameter"];
            CFStringRef v374 = @"%@_YourTimeAtHomeInterfaceType";
            goto LABEL_31;
          case 8:
            v411 = +[NSNumber numberWithInt:8];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v411];

            v412 = v7->_configurationManager;
            v413 = [v10[44] stringWithFormat:@"%@_TopicsOfInterestInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v414) = 1120403456;
            [(MOConfigurationManagerBase *)v412 getFloatSettingForKey:v413 withFallback:v414];
            v415 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v416 = +[NSNumber numberWithInt:8];
            [(NSDictionary *)v541 setObject:v415 forKeyedSubscript:v416];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            CFStringRef v374 = @"%@_TopicsOfInterestInterfaceType";
            goto LABEL_31;
          case 9:
            v417 = +[NSNumber numberWithInt:9];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v417];

            v418 = v7->_configurationManager;
            v419 = [v10[44] stringWithFormat:@"%@_TrendInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v420) = 1120403456;
            [(MOConfigurationManagerBase *)v418 getFloatSettingForKey:v419 withFallback:v420];
            v421 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v422 = +[NSNumber numberWithInt:9];
            [(NSDictionary *)v541 setObject:v421 forKeyedSubscript:v422];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            CFStringRef v374 = @"%@_TrendInterfaceType";
            goto LABEL_31;
          case 10:
            v423 = +[NSNumber numberWithInt:10];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v423];

            v424 = v7->_configurationManager;
            v425 = [v10[44] stringWithFormat:@"%@_PhotoMemoryInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v426) = 1120403456;
            [(MOConfigurationManagerBase *)v424 getFloatSettingForKey:v425 withFallback:v426];
            v427 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v428 = +[NSNumber numberWithInt:10];
            [(NSDictionary *)v541 setObject:v427 forKeyedSubscript:v428];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F95A0 forKeyedSubscript:@"decayRate"];
            CFStringRef v374 = @"%@_PhotoMemoryInterfaceType";
            goto LABEL_31;
          case 11:
            v429 = +[NSNumber numberWithInt:11];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v429];

            v430 = v7->_configurationManager;
            v431 = [v10[44] stringWithFormat:@"%@_EvergreenInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v432) = 1120403456;
            [(MOConfigurationManagerBase *)v430 getFloatSettingForKey:v431 withFallback:v432];
            v433 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v434 = +[NSNumber numberWithInt:11];
            [(NSDictionary *)v541 setObject:v433 forKeyedSubscript:v434];

            [(NSDictionary *)v538 setObject:&off_1002F9510 forKeyedSubscript:@"WISDOM"];
            [(NSDictionary *)v538 setObject:&off_1002F9510 forKeyedSubscript:@"GRATITUDE"];
            [(NSDictionary *)v538 setObject:&off_1002F9510 forKeyedSubscript:@"KINDNESS"];
            [(NSDictionary *)v538 setObject:&off_1002F9510 forKeyedSubscript:@"PURPOSE"];
            [(NSDictionary *)v538 setObject:&off_1002F9510 forKeyedSubscript:@"RESILIENCE"];
            [(NSDictionary *)v538 setObject:&off_1002F9510 forKeyedSubscript:@"CREATIVITY"];
            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9510 forKeyedSubscript:@"decayRate"];
            [v373 setObject:&off_1002F9510 forKeyedSubscript:@"weightForLabelQualityScore"];
            CFStringRef v374 = @"%@_EvergreenInterfaceType";
            goto LABEL_31;
          case 12:
            v435 = +[NSNumber numberWithInt:12];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v435];

            v436 = v7->_configurationManager;
            v437 = [v10[44] stringWithFormat:@"%@_TimeContextInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v438) = 1120403456;
            [(MOConfigurationManagerBase *)v436 getFloatSettingForKey:v437 withFallback:v438];
            v439 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v440 = +[NSNumber numberWithInt:12];
            [(NSDictionary *)v541 setObject:v439 forKeyedSubscript:v440];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9520 forKeyedSubscript:@"weightForNumRoutineEventsNormalized"];
            CFStringRef v374 = @"%@_TimeContextInterfaceType";
            goto LABEL_31;
          case 13:
            v441 = +[NSNumber numberWithInt:13];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v441];

            v442 = v7->_configurationManager;
            v443 = [v10[44] stringWithFormat:@"%@_TripInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v444) = 1120403456;
            [(MOConfigurationManagerBase *)v442 getFloatSettingForKey:v443 withFallback:v444];
            v445 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v446 = +[NSNumber numberWithInt:13];
            [(NSDictionary *)v541 setObject:v445 forKeyedSubscript:v446];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            CFStringRef v374 = @"%@_TripInterfaceType";
            goto LABEL_31;
          case 14:
            v447 = +[NSNumber numberWithInt:14];
            [(NSDictionary *)v539 setObject:&off_1002F9510 forKeyedSubscript:v447];

            v448 = v7->_configurationManager;
            v449 = [v10[44] stringWithFormat:@"%@_StateOfMindInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v450) = 1120403456;
            [(MOConfigurationManagerBase *)v448 getFloatSettingForKey:v449 withFallback:v450];
            v451 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v452 = +[NSNumber numberWithInt:14];
            [(NSDictionary *)v541 setObject:v451 forKeyedSubscript:v452];

            v373 = [(MOEventBundleRanking *)v7 _getDefaultFallbackFactorDict];

            [v373 setObject:&off_1002F9550 forKeyedSubscript:@"bundleScoreConstant"];
            [v373 setObject:&off_1002F95B0 forKeyedSubscript:@"decayRate"];
            CFStringRef v374 = @"%@_StateOfMindInterfaceType";
LABEL_31:
            id obj = v373;
            uint64_t v453 = [v10[44] stringWithFormat:v374, @"rankingParams"];

            id v550 = (id)v453;
            break;
          default:
            break;
        }
        v454 = objc_opt_new();
        long long v552 = 0u;
        long long v553 = 0u;
        long long v554 = 0u;
        long long v555 = 0u;
        id obj = obj;
        id v455 = [obj countByEnumeratingWithState:&v552 objects:v557 count:16];
        if (v455)
        {
          id v456 = v455;
          uint64_t v457 = *(void *)v553;
          do
          {
            for (i = 0; i != v456; i = (char *)i + 1)
            {
              if (*(void *)v553 != v457) {
                objc_enumerationMutation(obj);
              }
              uint64_t v459 = *(void *)(*((void *)&v552 + 1) + 8 * i);
              v460 = *p_configurationManager;
              v461 = [v10[44] stringWithFormat:@"%@_%@", v550, v459];
              [obj objectForKeyedSubscript:v459];
              v463 = v462 = v10;
              [v463 floatValue];
              [v460 getFloatSettingForKey:v461 withFallback:];
              v464 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              [v454 setObject:v464 forKeyedSubscript:v459];

              float v10 = v462;
            }
            id v456 = [obj countByEnumeratingWithState:&v552 objects:v557 count:16];
          }
          while (v456);
        }

        id v465 = [v454 copy];
        v466 = +[NSNumber numberWithInt:v545];
        [(NSDictionary *)v543 setObject:v465 forKeyedSubscript:v466];

        int v366 = v545 + 1;
        id v7 = v542;
      }
      while (v545 != 15);
      v467 = (NSDictionary *)objc_opt_new();
      v468 = v10;
      v469 = v542->_configurationManager;
      v470 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"minEngagementCount"];
      v471 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v469 getIntegerSettingForKey:v470 withFallback:5]];
      [(NSDictionary *)v467 setObject:v471 forKeyedSubscript:@"minEngagementCount"];

      v472 = v542->_configurationManager;
      v473 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"minInterfaceTypes"];
      v474 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v472 getIntegerSettingForKey:v473 withFallback:2]];
      [(NSDictionary *)v467 setObject:v474 forKeyedSubscript:@"minInterfaceTypes"];

      v475 = v542->_configurationManager;
      v476 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"minTimeIntervalForUpdateSec"];
      v477 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v475 getIntegerSettingForKey:v476 withFallback:259200]];
      [(NSDictionary *)v467 setObject:v477 forKeyedSubscript:@"minTimeIntervalForUpdateSec"];

      v478 = v542->_configurationManager;
      v479 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"longTimePeriodSinceEngagementScoreParamsUpdatedSec"];
      v480 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v478 getIntegerSettingForKey:v479 withFallback:2419200]];
      [(NSDictionary *)v467 setObject:v480 forKeyedSubscript:@"longTimePeriodSinceEngagementScoreParamsUpdatedSec"];

      v481 = v542->_configurationManager;
      v482 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"lowerBoundOfEngagementScoreParams"];
      LODWORD(v483) = -1.0;
      [(MOConfigurationManagerBase *)v481 getFloatSettingForKey:v482 withFallback:v483];
      v484 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v467 setObject:v484 forKeyedSubscript:@"lowerBoundOfEngagementScoreParams"];

      v485 = v542->_configurationManager;
      v486 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"upperBoundOfEngagementScoreParams"];
      LODWORD(v487) = 1.0;
      [(MOConfigurationManagerBase *)v485 getFloatSettingForKey:v486 withFallback:v487];
      v488 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v548 = v467;
      [(NSDictionary *)v467 setObject:v488 forKeyedSubscript:@"upperBoundOfEngagementScoreParams"];

      v489 = (NSMutableDictionary *)objc_opt_new();
      v490 = v542->_configurationManager;
      v491 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"pairWiseFarthest"];
      LODWORD(v492) = 2.5;
      [(MOConfigurationManagerBase *)v490 getFloatSettingForKey:v491 withFallback:v492];
      v493 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSMutableDictionary *)v489 setObject:v493 forKeyedSubscript:@"pairWiseFarthest"];

      v494 = v542->_configurationManager;
      v495 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"pairWiseFarther"];
      LODWORD(v496) = 2.0;
      [(MOConfigurationManagerBase *)v494 getFloatSettingForKey:v495 withFallback:v496];
      v497 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSMutableDictionary *)v489 setObject:v497 forKeyedSubscript:@"pairWiseFarther"];

      v498 = v542->_configurationManager;
      v499 = [v468[44] stringWithFormat:@"%@_%@", @"rankingParams", @"pairWiseFar"];
      LODWORD(v500) = 1.0;
      [(MOConfigurationManagerBase *)v498 getFloatSettingForKey:v499 withFallback:v500];
      v501 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSMutableDictionary *)v489 setObject:v501 forKeyedSubscript:@"pairWiseFar"];

      v502 = (NSDictionary *)objc_opt_new();
      v503 = [(MOEventBundleRanking *)v542 _getDefaultRichnessWeightDict];
      for (uint64_t j = 0; j != 17; ++j)
      {
        v505 = +[MOResource getStringTypeForResources:j];
        v506 = [v503 objectForKeyedSubscript:v505];
        v507 = [(MOEventBundleRanking *)v542 _getRichnessScoreWeightFromConfigurationManager:v505 withDefaultWeightDict:v506];
        [(NSDictionary *)v502 setObject:v507 forKey:v505];
      }
      v508 = [v503 objectForKeyedSubscript:@"NumUniqueResourceTypesNormalizedKey"];
      v509 = [(MOEventBundleRanking *)v542 _getRichnessScoreWeightFromConfigurationManager:@"NumUniqueResourceTypesNormalizedKey" withDefaultWeightDict:v508];
      [(NSDictionary *)v502 setObject:v509 forKey:@"NumUniqueResourceTypesNormalizedKey"];

      v546 = [v503 objectForKeyedSubscript:@"NumWorkoutRouteMapAssets"];

      v510 = [(MOEventBundleRanking *)v542 _getRichnessScoreWeightFromConfigurationManager:@"NumWorkoutRouteMapAssets" withDefaultWeightDict:v546];
      [(NSDictionary *)v502 setObject:v510 forKey:@"NumWorkoutRouteMapAssets"];

      richnessWeightsDict = v542->_richnessWeightsDict;
      v542->_richnessWeightsDict = v502;
      v537 = v502;

      engagementScoreParameterDict = v542->_engagementScoreParameterDict;
      v542->_engagementScoreParameterDict = v548;
      v536 = v548;

      staticModelParameterMatrix = v542->_staticModelParameterMatrix;
      v542->_staticModelParameterMatrix = v543;
      v549 = v543;

      dynamicModelParameterDict = v542->_dynamicModelParameterDict;
      v542->_dynamicModelParameterDict = v539;
      v544 = v539;

      v515 = [(MOEventBundleRanking *)v542 _checkAndUpdateNumericLimits:v532];
      heuristicsParameterDict = v542->_heuristicsParameterDict;
      v542->_heuristicsParameterDict = v515;
      v517 = v515;

      rankingScoreThresholdDict = v542->_rankingScoreThresholdDict;
      v542->_rankingScoreThresholdDict = v533;
      v540 = v533;

      viewCountBasedAdjustmentParameterDict = v542->_viewCountBasedAdjustmentParameterDict;
      v542->_viewCountBasedAdjustmentParameterDict = v531;
      v520 = v531;

      bprRegularizationFactor = v542->_bprRegularizationFactor;
      v542->_bprRegularizationFactor = v541;
      v522 = v541;

      pairWiseWeights = v542->_pairWiseWeights;
      v542->_pairWiseWeights = v489;
      v524 = v489;

      evergreenEngagementScoreParameterDict = v542->_evergreenEngagementScoreParameterDict;
      v542->_evergreenEngagementScoreParameterDict = v538;
      v526 = v538;

      curationParameterDict = v542->_curationParameterDict;
      v542->_curationParameterDict = v535;
      v528 = v535;

      id v6 = v534;
      id v7 = v542;
    }
    self = v7;
    v357 = self;
  }
  else
  {
    v355 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR)) {
      -[MOPeopleDiscoveryManager initWithUniverse:]();
    }

    v356 = +[NSAssertionHandler currentHandler];
    [v356 handleFailureInMethod:a2 object:self file:@"MOEventBundleRanking.m" lineNumber:1078 description:@"Invalid parameter not satisfying: configurationManager"];

    v357 = 0;
  }

  return v357;
}

- (id)_getRichnessScoreWeightFromConfigurationManager:(id)a3 withDefaultWeightDict:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  float v9 = [v7 stringByAppendingString:@"_Resource_PrimaryWeight"];
  configurationManager = self->_configurationManager;
  float v11 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", v9];
  double v12 = [v6 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
  [v12 floatValue];
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v11);
  float v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [v8 setObject:v13 forKey:@"RankingRichnessPrimaryPriorityScoreKey"];
  float v14 = [v7 stringByAppendingString:@"_Resource_SecondaryWeight"];

  uint64_t v15 = self->_configurationManager;
  double v16 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", v14];
  float v17 = [v6 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
  [v17 floatValue];
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v15, "getFloatSettingForKey:withFallback:", v16);
  float v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [v8 setObject:v18 forKey:@"RankingRichnessSecondaryPriorityScoreKey"];
  uint64_t v19 = [v7 stringByAppendingString:@"_Resource_AuxiliaryWeight"];

  uint64_t v20 = self->_configurationManager;
  uint64_t v21 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", v19];
  uint64_t v22 = [v6 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];

  [v22 floatValue];
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v20, "getFloatSettingForKey:withFallback:", v21);
  uint64_t v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [v8 setObject:v23 forKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];

  return v8;
}

- (void)generateBundleRanking:(id)a3 withMinRecommendedBundleCountRequirement:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    id v36 = [v5 count];
    __int16 v37 = 1024;
    LODWORD(v38) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Input bundle count: %lu, minimumRecommendedBundleRequired:%d", buf, 0x12u);
  }
  BOOL v28 = v4;

  id v7 = +[NSMutableIndexSet indexSet];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        float v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = [v14 bundleIdentifier];
        if (v15)
        {
          double v16 = (void *)v15;
          float v17 = [v14 suggestionID];

          if (v17) {
            continue;
          }
        }
        [v7 addIndex:(char *)i + v11];
        float v18 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v14 bundleIdentifier];
          uint64_t v20 = [v14 suggestionID];
          *(_DWORD *)buf = 138412546;
          id v36 = v19;
          __int16 v37 = 2112;
          double v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "bundle with nil bundleID or nil suggestionID was filtered out: bundleID %@ suggestionID %@", buf, 0x16u);
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
      v11 += (uint64_t)i;
    }
    while (v10);
  }

  [v8 removeObjectsAtIndexes:v7];
  uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Input bundle count after nil ID filters: %lu", buf, 0xCu);
  }

  uint64_t v23 = [(MOEventBundleRanking *)self generateRankingInput:v8];
  uint64_t v24 = [(MOEventBundleRanking *)self _calculateRankingScore:v23 withMinRecommendedBundleCountRequirement:v28];
  if (self->_isInternalBuild)
  {
    double v25 = +[NSDate date];
    [(MOEventBundleRanking *)self _submitEventBundleRankingAnalytics:v24 withRankingInput:v23 andSubmissionDate:v25];
  }
  [(MOEventBundleRanking *)self _mergeScoresToBundles:v8 usingScore:v24];
  float v26 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "generateBundleRanking completed for %lu bundles", buf, 0xCu);
  }
}

- (id)_calculateRankingScore:(id)a3 withMinRecommendedBundleCountRequirement:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v905[0] = @"GRATITUDE";
  v905[1] = @"CREATIVITY";
  v906[0] = &off_1002F95C0;
  v906[1] = &off_1002F95D0;
  v905[2] = @"WISDOM";
  v905[3] = @"PURPOSE";
  v906[2] = &off_1002F95E0;
  v906[3] = &off_1002F95F0;
  v905[4] = @"KINDNESS";
  v905[5] = @"RESILIENCE";
  v906[4] = &off_1002F9600;
  v906[5] = &off_1002F94F0;
  v619 = +[NSDictionary dictionaryWithObjects:v906 forKeys:v905 count:6];
  v758 = objc_opt_new();
  v757 = objc_opt_new();
  v611 = objc_opt_new();
  v610 = objc_opt_new();
  v612 = objc_opt_new();
  v617 = objc_opt_new();
  id v6 = objc_opt_new();
  v627 = objc_opt_new();
  v687 = +[NSDate distantFuture];
  v688 = +[NSDate distantPast];
  float elapsedDaysSinceOnboardingDate = self->_elapsedDaysSinceOnboardingDate;
  id v7 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding"];
  [v7 floatValue];
  float v625 = v8;

  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(float *)&double v10 = elapsedDaysSinceOnboardingDate;
    float v11 = self->_elapsedDaysSinceOnboardingDate;
    uint64_t v12 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding", v10];
    [v12 floatValue];
    *(_DWORD *)buf = 134218496;
    *(double *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)v898 = elapsedDaysSinceOnboardingDate < v625;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "elapsedDaysSinceOnboardingDate, %.2f, maxDaysToSuppressCoarseSummaryAfterOnboarding,%.2f,suppressCoarseSummary:%d", buf, 0x1Cu);
  }
  if (v4)
  {
    float v14 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"minSensedBundleCountInRecommendedTab"];
    signed int v15 = [v14 intValue];

    unint64_t v614 = v15;
  }
  else
  {
    unint64_t v614 = 0;
  }
  long long v884 = 0u;
  long long v883 = 0u;
  long long v882 = 0u;
  long long v881 = 0u;
  id obj = v5;
  id v16 = [obj countByEnumeratingWithState:&v881 objects:v904 count:16];
  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v17 = *(void *)v882;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v882 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v881 + 1) + 8 * i);
      if ([v19 suggestionIsDeleted])
      {
        uint64_t v20 = [v19 suggestionIdentifier];
        uint64_t v21 = [v20 UUIDString];
        [v758 addObject:v21];

        id v22 = [v19 subSuggestionIDs];
        [v758 addObjectsFromArray:v22];
LABEL_16:

        continue;
      }
      if (([v19 suggestionIsSelected] & 1) != 0
        || [v19 suggestionQuickAddEntry])
      {
        uint64_t v23 = [v19 suggestionIdentifier];
        uint64_t v24 = [v23 UUIDString];
        [v757 addObject:v24];

        id v22 = [v19 subSuggestionIDs];
        [v757 addObjectsFromArray:v22];
        goto LABEL_16;
      }
    }
    id v16 = [obj countByEnumeratingWithState:&v881 objects:v904 count:16];
  }
  while (v16);
LABEL_19:

  int v613 = 0;
  int v615 = 0;
  unint64_t v25 = 0;
  float v26 = 1.0;
  while (2)
  {
    if (v26 < 0.0 || v25 > v614)
    {
      v623 = v6;
      goto LABEL_321;
    }
    float v616 = v26;
    v623 = objc_opt_new();

    uint64_t v28 = objc_opt_new();
    long long v880 = 0u;
    long long v879 = 0u;
    long long v878 = 0u;
    long long v877 = 0u;
    id v621 = obj;
    id v628 = [v621 countByEnumeratingWithState:&v877 objects:v903 count:16];
    v627 = (void *)v28;
    if (!v628)
    {
      unint64_t v622 = 0;
      goto LABEL_301;
    }
    unint64_t v622 = 0;
    unint64_t v618 = 0;
    uint64_t v624 = *(void *)v878;
    while (2)
    {
      uint64_t v29 = 0;
      while (2)
      {
        if (*(void *)v878 != v624)
        {
          uint64_t v30 = v29;
          objc_enumerationMutation(v621);
          uint64_t v29 = v30;
        }
        uint64_t v686 = v29;
        v773 = *(void **)(*((void *)&v877 + 1) + 8 * v29);
        long long v31 = [v773 bundleStartDate];
        unsigned int v32 = [v31 isAfterDate:v688];

        if (v32)
        {
          uint64_t v33 = [v773 bundleStartDate];

          v688 = (void *)v33;
        }
        long long v34 = [v773 bundleStartDate];
        unsigned int v35 = [v34 isBeforeDate:v687];

        if (v35)
        {
          uint64_t v36 = [v773 bundleStartDate];

          v687 = (void *)v36;
        }
        __int16 v37 = [v773 suggestionIdentifier];
        double v38 = [v37 UUIDString];
        if ([v758 containsObject:v38])
        {
          unsigned int v750 = 1;
        }
        else if ([v773 bundleInterfaceType] == (id)13)
        {
          unsigned int v750 = 0;
        }
        else
        {
          double v39 = [v773 subSuggestionIDs];
          float v40 = +[NSMutableSet setWithArray:v39];
          unsigned int v750 = [v758 intersectsSet:v40];
        }
        double v41 = [v773 suggestionIdentifier];
        double v42 = [v41 UUIDString];
        if ([v757 containsObject:v42])
        {
          unsigned int v748 = 1;
        }
        else if ([v773 bundleInterfaceType] == (id)13 || objc_msgSend(v773, "bundleSubType") == (id)202)
        {
          unsigned int v748 = 0;
        }
        else
        {
          float v43 = [v773 subSuggestionIDs];
          double v44 = +[NSMutableSet setWithArray:v43];
          unsigned int v748 = [v757 intersectsSet:v44];
        }
        double v45 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          double v46 = [v773 bundleIdentifier];
          v47 = [v773 suggestionIdentifier];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v47;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v898 = v748;
          *(_WORD *)&v898[4] = 1024;
          *(_DWORD *)&v898[6] = v750;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Engagement status: bundleID %@, suggestionID %@, isBundleOrSubBundlesSelectedOrQuickAdded %d, isBundleOrSubBundleDeleted %d", buf, 0x22u);
        }
        if (![v773 bundleInterfaceType])
        {
          unsigned int v684 = 0;
          BOOL v55 = 0;
          BOOL v56 = 0;
          uint64_t v57 = 0;
          uint64_t v719 = 0;
          float v58 = 0.0;
          float v59 = -1.0;
          float v60 = -1.0;
          float v61 = 0.0;
          float v62 = 0.0;
          HIDWORD(v63) = 0;
          float v740 = 0.0;
          float v736 = 0.0;
          float v743 = 0.0;
          float v759 = 0.0;
          float v64 = 0.0;
          goto LABEL_146;
        }
        double v48 = (_UNKNOWN **)objc_opt_new();
        if ([v773 bundleInterfaceType] != (id)11)
        {
          double v65 = [(MOEventBundleRanking *)self dynamicModelParameterDict];
          double v66 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleInterfaceType]);
          uint64_t v67 = [v65 objectForKeyedSubscript:v66];

          char v53 = (void *)v67;
          if (v67) {
            goto LABEL_61;
          }
          float v68 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            id v325 = [v773 bundleInterfaceType];
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v325;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v898 = 1573;
            _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Dynamic model parameter is not set for bundleInterfaceType %lu (in %s:%d)", buf, 0x1Cu);
          }

          double v54 = +[NSAssertionHandler currentHandler];
          -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEventBundleRanking.m", 1573, @"Dynamic model parameter is not set for bundleInterfaceType %lu (in %s:%d)", [v773 bundleInterfaceType], "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]", 1573);
          double v48 = 0;
LABEL_60:

          char v53 = v48;
          goto LABEL_61;
        }
        id v49 = [v773 evergreenType];

        if (!v49)
        {
          double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.7(&v875, v876);
          }
          goto LABEL_60;
        }
        double v50 = [(MOEventBundleRanking *)self evergreenEngagementScoreParameterDict];
        id v51 = [v773 evergreenType];
        uint64_t v52 = [v50 objectForKeyedSubscript:v51];

        char v53 = (void *)v52;
        if (!v52)
        {
          double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.8((uint64_t)v902, (uint64_t)v773);
          }
          double v48 = &off_1002F9510;
          goto LABEL_60;
        }
LABEL_61:
        v676 = v53;
        [v53 floatValue];
        float v740 = v69;
        if ([v773 bundleInterfaceType] == (id)12 && objc_msgSend(v773, "bundleSuperType") == (id)1)
        {
          id v70 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
          v753 = [v70 objectForKeyedSubscript:&off_1002F7190];
        }
        else
        {
          double v71 = (void *)phoneSensedWalkingVariants;
          float v72 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
          LODWORD(v71) = [v71 containsObject:v72];

          if (v71)
          {
            float v73 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
            double v74 = [v73 objectForKeyedSubscript:&off_1002F7190];
            id v75 = [v74 mutableCopy];

            configurationManager = self->_configurationManager;
            double v77 = +[NSString stringWithFormat:@"%@_MotionActivityWalkingSubType_%@", @"rankingParams", @"bundleScoreConstant"];
            LODWORD(v78) = -1138501878;
            [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v77 withFallback:v78];
            float v79 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            [v75 setObject:v79 forKeyedSubscript:@"bundleScoreConstant"];

            id v70 = v75;
            v753 = v70;
          }
          else if ([v773 bundleSubType] == (id)201 || objc_msgSend(v773, "bundleSubType") == (id)205)
          {
            id v70 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
            v753 = [v70 objectForKeyedSubscript:&off_1002F73D0];
          }
          else
          {
            id v70 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
            double v80 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleInterfaceType]);
            v753 = [v70 objectForKeyedSubscript:v80];
          }
        }

        if (!v753)
        {
          float v81 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            id v310 = [v773 bundleInterfaceType];
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v310;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v898 = 1605;
            _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Static model parameters are not set for bundleInterfaceType %lu (in %s:%d)", buf, 0x1Cu);
          }

          double v82 = +[NSAssertionHandler currentHandler];
          [v82 handleFailureInMethod:a2 object:self file:@"MOEventBundleRanking.m" lineNumber:1605 description:@"Static model parameters are not set for bundleInterfaceType %lu (in %s:%d)", [v773 bundleInterfaceType], @"-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]", 1605];
        }
        long long v874 = 0u;
        long long v873 = 0u;
        long long v872 = 0u;
        long long v871 = 0u;
        id v83 = [v773 bundleRichnessDict];
        id v760 = [v83 allKeys];

        id v84 = [v760 countByEnumeratingWithState:&v871 objects:v901 count:16];
        if (v84)
        {
          uint64_t v765 = *(void *)v872;
          float v64 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v84; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v872 != v765) {
                objc_enumerationMutation(v760);
              }
              uint64_t v86 = *(void *)(*((void *)&v871 + 1) + 8 * (void)j);
              v87 = [(NSDictionary *)self->_richnessWeightsDict objectForKeyedSubscript:v86];
              long long v88 = [v773 bundleRichnessDict];
              long long v89 = [v88 objectForKeyedSubscript:v86];

              double v90 = [v89 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
              [v90 floatValue];
              float v92 = v91;
              id v93 = [v87 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
              [v93 floatValue];
              float v95 = v94;
              long long v96 = [v89 objectForKeyedSubscript:@"RankingRichnessSecondaryPriorityScoreKey"];
              [v96 floatValue];
              float v98 = v97;
              long long v99 = [v87 objectForKeyedSubscript:@"RankingRichnessSecondaryPriorityScoreKey"];
              [v99 floatValue];
              float v101 = v100;
              double v102 = [v89 objectForKeyedSubscript:@"RankingRichnessAuxiliaryPriorityScoreKey"];
              [v102 floatValue];
              float v104 = v103;
              uint64_t v105 = [v87 objectForKeyedSubscript:@"RankingRichnessAuxiliaryPriorityScoreKey"];
              [v105 floatValue];
              float v107 = v106;

              float v64 = v64 + (float)((float)((float)(v98 * v101) + (float)(v92 * v95)) + (float)(v104 * v107));
            }
            id v84 = [v760 countByEnumeratingWithState:&v871 objects:v901 count:16];
          }
          while (v84);
        }
        else
        {
          float v64 = 0.0;
        }

        v108 = [v753 objectForKeyedSubscript:@"weightForLabelQualityScore"];
        [v108 floatValue];
        float v667 = v109;
        [v773 labelQualityScore];
        float v666 = v110;
        double v111 = [v753 objectForKeyedSubscript:@"weightForTimeCorrelationScore"];
        [v111 floatValue];
        float v663 = v112;
        [v773 timeCorrelationScoreFeature];
        float v662 = v113;

        double v114 = [v753 objectForKeyedSubscript:@"weightForNumAnamolyEventsNormalized"];
        [v114 floatValue];
        float v659 = v115;
        [v773 numAnomalyEventsNormalized];
        float v658 = v116;
        unsigned int v117 = [v753 objectForKeyedSubscript:@"weightForNumTrendEventsNormalized"];
        [v117 floatValue];
        float v655 = v118;
        [v773 numTrendEventsNormalized];
        float v654 = v119;
        v120 = [v753 objectForKeyedSubscript:@"weightForNumRoutineEventsNormalized"];
        [v120 floatValue];
        float v651 = v121;
        [v773 numRoutineEventsNormalized];
        float v650 = v122;
        v123 = [v753 objectForKeyedSubscript:@"weightForNumStateOfMindEventsNormalized"];
        [v123 floatValue];
        float v649 = v124;
        [v773 numStateOfMindEventsNormalized];
        float v647 = v125;

        double v126 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v766 = [v126 objectForKeyedSubscript:@"weightForInterestingPOI"];
        [v766 floatValue];
        float v675 = v127;
        [v773 interestingPOIFeature];
        float v674 = v128;
        id v761 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v744 = [v761 objectForKeyedSubscript:@"weightForDistanceFromHome"];
        [v744 floatValue];
        float v673 = v129;
        [v773 distanceToHomeFeatureNormalized];
        float v672 = v130;
        v737 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v733 = [v737 objectForKeyedSubscript:@"weightForCallDuration"];
        [v733 floatValue];
        float v671 = v131;
        [v773 callDurationFeatureNormalized];
        float v670 = v132;
        v730 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v727 = [v730 objectForKeyedSubscript:@"weightForBurstyInteractionCount"];
        [v727 floatValue];
        float v669 = v133;
        [v773 burstyInteractionCountFeatureNormalized];
        float v668 = v134;
        v723 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v720 = [v723 objectForKeyedSubscript:@"weightForMultipleInteractionTypes"];
        [v720 floatValue];
        float v665 = v135;
        unsigned int v664 = [v773 multipleInteractionTypesFeature];
        v717 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v715 = [v717 objectForKeyedSubscript:@"weightForContactLocationWork"];
        [v715 floatValue];
        float v661 = v136;
        int v660 = [v773 contactLocationWorkFeature];
        v713 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v711 = [v713 objectForKeyedSubscript:@"weightForGroupConversation"];
        [v711 floatValue];
        float v657 = v137;
        unsigned int v656 = [v773 groupConversationFeature];
        v709 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v707 = [v709 objectForKeyedSubscript:@"weightForPCountMax"];
        [v707 floatValue];
        float v653 = v138;
        [v773 peopleCountMaxNormalized];
        float v652 = v139;
        v705 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v703 = [v705 objectForKeyedSubscript:@"weightForPCountWeightedSum"];
        [v703 floatValue];
        float v648 = v140;
        [v773 peopleCountWeightedSumNormalized];
        float v646 = v141;
        v701 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v699 = [v701 objectForKeyedSubscript:@"weightForPCountWeightedAverage"];
        [v699 floatValue];
        float v645 = v142;
        [v773 peopleCountWeightedAverageNormalized];
        float v644 = v143;
        v697 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v695 = [v697 objectForKeyedSubscript:@"weightForPDensityWeightedAverage"];
        [v695 floatValue];
        float v643 = v144;
        [v773 peopleDensityWeightedAverageNormalized];
        float v642 = v145;
        v693 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v691 = [v693 objectForKeyedSubscript:@"weightForItemFromMe"];
        [v691 floatValue];
        float v641 = v146;
        unsigned int v640 = [v773 itemFromMeFeature];
        v689 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v685 = [v689 objectForKeyedSubscript:@"weightShareCountFeature"];
        [v685 floatValue];
        float v639 = v147;
        [v773 shareCountFeatureNormalized];
        float v638 = v148;
        v683 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v682 = [v683 objectForKeyedSubscript:@"weightForTimeAtHomeDuration"];
        [v682 floatValue];
        float v637 = v149;
        [v773 timeAtHomeDuration];
        float v636 = v150;
        v681 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v680 = [v681 objectForKeyedSubscript:@"weightForIsFamilyContact"];
        [v680 floatValue];
        float v635 = v151;
        [v773 isFamilyContact];
        float v634 = v152;
        v679 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v678 = [v679 objectForKeyedSubscript:@"weightForIsCoworkerContact"];
        [v678 floatValue];
        float v633 = v153;
        [v773 isCoworkerContact];
        float v632 = v154;
        v677 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v155 = [v677 objectForKeyedSubscript:@"weightForMediaPlayTime"];
        [v155 floatValue];
        float v631 = v156;
        [v773 mediaScoreFeatureNormalized];
        float v630 = v157;
        double v158 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        float v159 = [v158 objectForKeyedSubscript:@"weightForFamiliarityIndex"];
        [v159 floatValue];
        float v629 = v160;
        [v773 familiarityIndexFeature];
        float v162 = v161;
        v163 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v164 = [v163 objectForKeyedSubscript:@"weightForWorkoutDurationNormalized"];
        [v164 floatValue];
        float v166 = v165;
        [v773 workoutDurationFeatureNormalized];
        float v168 = v167;
        float v169 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v170 = [v169 objectForKeyedSubscript:@"weightStateOfMindLabelCountNormalized"];
        [v170 floatValue];
        float v172 = v171;
        [v773 stateOfMindLabelCountNormalized];
        float v174 = v173;
        double v175 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v176 = [v175 objectForKeyedSubscript:@"weightStateOfMindDomainCountNormalized"];
        [v176 floatValue];
        float v178 = v177;
        [v773 stateOfMindDomainCountNormalized];
        float v180 = v179;

        v181 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        float v182 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v673 * v672) + (float)(v675 * v674)) + (float)(v671 * v670)) + (float)(v669 * v668)) + (float)(v665 * (float)v664)) + (float)(v661 * (float)v660)) + (float)(v657 * (float)v656)) + (float)(v653 * v652)) + (float)(v648 * v646)) + (float)(v645 * v644))
                                                                                             + (float)(v643 * v642))
                                                                                     + (float)(v641 * (float)v640))
                                                                             + (float)(v639 * v638))
                                                                     + (float)(v637 * v636))
                                                             + (float)(v635 * v634))
                                                     + (float)(v633 * v632))
                                             + (float)(v631 * v630))
                                     + (float)(v629 * v162))
                             + (float)(v166 * v168))
                     + (float)(v172 * v174))
             + (float)(v178 * v180);
        if (os_log_type_enabled(v181, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v182;
          _os_log_debug_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEBUG, "heuristics score before person-relationship based bonus %.3f", buf, 0xCu);
        }
        float v745 = v182;

        double v183 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v767 = [v183 objectForKeyedSubscript:@"weightForNumFamilyNormalized"];
        [v767 floatValue];
        float v738 = v184;
        [v773 numFamilyNormalized];
        float v734 = v185;
        id v762 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v186 = [v762 objectForKeyedSubscript:@"weightForNumFidsNormalized"];
        [v186 floatValue];
        float v731 = v187;
        [v773 numKidsNormalized];
        float v728 = v188;
        v189 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v190 = [v189 objectForKeyedSubscript:@"weightForNumFriendsNormalized"];
        [v190 floatValue];
        float v724 = v191;
        [v773 numFriendsNormalized];
        float v193 = v192;
        double v194 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v195 = [v194 objectForKeyedSubscript:@"weightForNumPetsNormalized"];
        [v195 floatValue];
        float v197 = v196;
        [v773 numPetsNormalized];
        float v199 = v198;
        double v200 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v201 = [v200 objectForKeyedSubscript:@"weightForNumCoworkersNormalized"];
        [v201 floatValue];
        float v203 = v202;
        [v773 numCoworkersNormalized];
        float v205 = v204;
        double v206 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v207 = [v206 objectForKeyedSubscript:@"weightForNumOtherPersonsNormalized"];
        [v207 floatValue];
        float v209 = v208;
        [v773 numOtherPersonsNormalized];
        float v211 = v210;

        v212 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        float v743 = v745
             + (float)((float)((float)((float)((float)((float)(v731 * v728) + (float)(v738 * v734))
                                             + (float)(v724 * v193))
                                     + (float)(v197 * v199))
                             + (float)(v203 * v205))
                     + (float)(v209 * v211));
        if (os_log_type_enabled(v212, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v743;
          _os_log_debug_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_DEBUG, "heuristics score after person-relationship based bonus %.3f", buf, 0xCu);
        }

        float v736 = (float)(v663 * v662) + (float)(v667 * v666);
        float v759 = (float)((float)((float)(v655 * v654) + (float)(v659 * v658)) + (float)(v651 * v650))
             + (float)(v649 * v647);
        if ([v773 bundleInterfaceType] == (id)11)
        {
          float v61 = 1.0;
          float v58 = 0.0;
          float v62 = v740;
          if (v740 <= 0.0)
          {
            v213 = [v773 evergreenType];
            double v214 = [v619 objectForKeyedSubscript:v213];
            [v214 floatValue];
            float v62 = v215;
          }
        }
        else if ([v773 bundleInterfaceType] == (id)15)
        {
          [v773 avgSubBundleGoodnessScores];
          float v58 = v216;
          float v61 = 0.0;
          float v62 = v216;
        }
        else
        {
          if ([v773 bundleInterfaceType] == (id)10)
          {
            v217 = [(MOEventBundleRanking *)self heuristicsParameterDict];
            double v218 = [v217 objectForKeyedSubscript:@"maxBundleGoodnessScorePhotoMemory"];
            [v218 floatValue];
            float v220 = v219;
            v221 = [(MOEventBundleRanking *)self heuristicsParameterDict];
            double v222 = [v221 objectForKeyedSubscript:@"bundleGoodnessScoreIncrementPhotoMemory"];
            [v222 floatValue];
            float v224 = v223;

            float v58 = v220 - (float)(v224 * (float)v618++);
          }
          else if ([v773 bundleSuperType] != (id)4 {
                 || (float v58 = -0.49, [v773 bundleSubType] != (id)407)
          }
                 && [v773 bundleSubType] != (id)409
                 && [v773 bundleSubType] != (id)408
                 && [v773 bundleSubType] != (id)410)
          {
            double v225 = [v753 objectForKeyedSubscript:@"richnessScoreScalingParameter"];
            [v225 floatValue];
            float v227 = v226;
            v228 = [v753 objectForKeyedSubscript:@"bundleScoreScalingParameter"];
            [v228 floatValue];
            float v230 = v229;
            double v231 = [v753 objectForKeyedSubscript:@"bundleScoreConstant"];
            [v231 floatValue];
            float v233 = v232;

            float v58 = (float)((float)(v736 + (float)(v743 + (float)(v759 + (float)(v64 * v227)))) / v230) + v233;
          }
          [(MOEventBundleRanking *)self engagementScoreWeight];
          float v235 = v234;
          [(MOEventBundleRanking *)self engagementScoreWeight];
          float v237 = v236;
          BOOL v238 = [v773 bundleInterfaceType] == (id)10;
          double v239 = [v753 objectForKeyedSubscript:@"decayRate"];
          [v239 floatValue];
          float v241 = v240;
          [v773 bundleRecencyDaysElapsed];
          float v62 = (float)(v740 * v237) + (float)((float)(1.0 - v235) * v58);
          float v243 = -v241;
          if (v238) {
            float v61 = expf(floorf(v242) * v243);
          }
          else {
            float v61 = expf(v242 * v243);
          }
        }
        if ([v773 bundleInterfaceType] != (id)10 && objc_msgSend(v773, "bundleInterfaceType") != (id)11)
        {
          if ([v773 bundleSubType] == (id)406)
          {
            v245 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            float v60 = -1.0;
            if (os_log_type_enabled(v245, OS_LOG_TYPE_INFO))
            {
              long long v246 = [v773 bundleIdentifier];
              long long v247 = [v773 suggestionIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v246;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v247;
              _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_INFO, "Internal media bundle got rejected: bundleID %@, suggestionID %@", buf, 0x16u);
            }
LABEL_127:
            BOOL v56 = 0;
            BOOL v55 = 0;
            unsigned int v684 = 0;
            float v59 = -1.0;
            goto LABEL_128;
          }
          if ([v773 bundleInterfaceType] == (id)15)
          {
            v245 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            float v60 = -1.0;
            if (os_log_type_enabled(v245, OS_LOG_TYPE_INFO))
            {
              v253 = [v773 bundleIdentifier];
              v254 = [v773 suggestionIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v253;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v254;
              _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_INFO, "Clustering bundle got rejected: bundleID %@, suggestionID %@", buf, 0x16u);
            }
            goto LABEL_127;
          }
          v292 = (void *)visitSubtypeVariants;
          double v293 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
          LODWORD(v292) = [v292 containsObject:v293];

          if (v292)
          {
            v294 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v295 = [v294 objectForKeyedSubscript:@"suggestionAcceptThresholdForVisitSubTypeVariants"];
            [v295 floatValue];
            float v60 = v296;

            double v297 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v298 = [v297 objectForKeyedSubscript:@"suggestionRecommendThresholdForVisitSubTypeVariants"];
            [v298 floatValue];
            float v300 = v299;

            double v301 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v302 = [v301 objectForKeyedSubscript:@"summarizationThresholdForVisitSubTypeVariants"];
            [v302 floatValue];
            float v304 = v303;

            double v305 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v306 = [v305 objectForKeyedSubscript:@"tripSummarizationThresholdForVisitSubType"];
            [v306 floatValue];
            float v308 = v307;

            BOOL v56 = v58 > v304;
            BOOL v55 = v58 > v308;
            if (([v773 isShortVisit] & 1) != 0
              || [v773 isWorkVisit])
            {
              [v773 numPhotoAssetsResourcesNormalized];
              if (v309 == 0.0) {
                goto LABEL_158;
              }
            }
LABEL_169:
            if ((float)(v60 + (float)(v616 * (float)(v300 - v60))) >= v60) {
              float v59 = v60 + (float)(v616 * (float)(v300 - v60));
            }
            else {
              float v59 = v60;
            }
            v346 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            if (os_log_type_enabled(v346, OS_LOG_TYPE_DEBUG))
            {
              id v456 = [v773 bundleSubType];
              *(_DWORD *)buf = 134218752;
              *(void *)&uint8_t buf[4] = v456;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v60;
              *(_WORD *)&buf[22] = 2048;
              *(double *)v898 = v59;
              *(_WORD *)&v898[8] = 2048;
              *(double *)&v898[10] = v616;
              _os_log_debug_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_DEBUG, "Current bundle subtype, %lu, acceptThreshold,%.3f, recommendThreshold, %.3f, recommendThresholdMultiplier, %.3f", buf, 0x2Au);
            }

            if (v58 <= v59)
            {
              double v353 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              BOOL v354 = os_log_type_enabled(v353, OS_LOG_TYPE_INFO);
              if (v58 <= v60)
              {
                if (v354)
                {
                  uint64_t v360 = [v773 bundleIdentifier];
                  uint64_t v361 = [v773 suggestionIdentifier];
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v360;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v361;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v898 = v58;
                  *(_WORD *)&v898[8] = 2048;
                  *(double *)&v898[10] = v59;
                  *(_WORD *)&v898[18] = 2048;
                  *(double *)&v898[20] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_INFO, "Suggestion was rejected to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f", buf, 0x34u);
                }
              }
              else
              {
                if (v354)
                {
                  v355 = [v773 bundleIdentifier];
                  v356 = [v773 suggestionIdentifier];
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v355;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v356;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v898 = v58;
                  *(_WORD *)&v898[8] = 2048;
                  *(double *)&v898[10] = v59;
                  *(_WORD *)&v898[18] = 2048;
                  *(double *)&v898[20] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_INFO, "Suggestion was set to present only in Recent tab due to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f", buf, 0x34u);
                }
                if ((([v773 isBundleAggregated] & 1) != 0
                   || [v773 summarizationGranularity] != (id)2)
                  && [v773 bundleSubType] != (id)203
                  && [v773 bundleSubType] != (id)303)
                {
                  uint64_t v57 = 3;
                  uint64_t v719 = 2;
                  goto LABEL_234;
                }
                double v353 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v353, OS_LOG_TYPE_INFO))
                {
                  v357 = [v773 bundleIdentifier];
                  v358 = [v773 suggestionIdentifier];
                  id v359 = [v773 bundleSubType];
                  *(_DWORD *)buf = 138413570;
                  *(void *)&uint8_t buf[4] = v357;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v358;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v898 = v58;
                  *(_WORD *)&v898[8] = 2048;
                  *(double *)&v898[10] = v59;
                  *(_WORD *)&v898[18] = 2048;
                  *(double *)&v898[20] = v60;
                  *(_WORD *)&v898[28] = 2048;
                  *(void *)&v898[30] = v359;
                  _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_INFO, "Suggestion was rejected due to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f subtype %lu", buf, 0x3Eu);
                }
              }
              uint64_t v57 = 4;
              uint64_t v719 = 3;
              uint64_t v362 = (uint64_t)v617;
              goto LABEL_232;
            }
            if (([v773 isBundleAggregated] & 1) == 0
              && [v773 summarizationGranularity] == (id)2
              || [v773 bundleSubType] == (id)303)
            {
              if ([v773 bundleSubType] == (id)202)
              {
                uint64_t v347 = [v773 workoutTypes];

                int v615 = 1;
                v612 = (void *)v347;
              }
              if (elapsedDaysSinceOnboardingDate < v625)
              {
                v348 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v348, OS_LOG_TYPE_INFO))
                {
                  v349 = [v773 bundleIdentifier];
                  v350 = [v773 suggestionIdentifier];
                  id v351 = [v773 bundleSubType];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v349;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v350;
                  *(_WORD *)&buf[22] = 2048;
                  *(void *)v898 = v351;
                  _os_log_impl((void *)&_mh_execute_header, v348, OS_LOG_TYPE_INFO, "Coarse summary suggestion got rejected due to suppressCoarseSummary==True: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                }
                int v615 = ([v773 bundleSubType] != (id)202) & v615;
                uint64_t v57 = 4;
                uint64_t v352 = 3;
                goto LABEL_199;
              }
              uint64_t v57 = 2;
            }
            else
            {
              uint64_t v57 = 1;
            }
            uint64_t v352 = 1;
LABEL_199:
            uint64_t v719 = v352;
            if ([v773 bundleSubType] == (id)203)
            {
              uint64_t v362 = [v773 workoutTypes];

              [v773 bundleRecencyDaysElapsed];
              float v364 = v363;
              uint64_t v365 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForWorkoutRoutine"];
              [v365 floatValue];
              BOOL v367 = v364 > v366;

              if (v367)
              {
                v368 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v368, OS_LOG_TYPE_INFO))
                {
                  v369 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForWorkoutRoutine"];
                  [v369 floatValue];
                  float v371 = v370;
                  v372 = [v773 bundleIdentifier];
                  v373 = [v773 suggestionIdentifier];
                  id v374 = [v773 bundleSubType];
                  [v773 bundleRecencyDaysElapsed];
                  *(_DWORD *)buf = 134219010;
                  *(double *)&uint8_t buf[4] = v371;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v372;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v898 = v373;
                  *(_WORD *)&v898[8] = 2048;
                  *(void *)&v898[10] = v374;
                  *(_WORD *)&v898[18] = 2048;
                  *(double *)&v898[20] = v375;
                  _os_log_impl((void *)&_mh_execute_header, v368, OS_LOG_TYPE_INFO, "Workout routine suggestion was rejected because elapsed time >%.2f days: bundleID %@, suggestionID %@, bundleSubType %lu, elapsedTime %.2f", buf, 0x34u);
                }
                int v613 = 0;
                uint64_t v57 = 4;
                uint64_t v719 = 3;
              }
              else
              {
                uint64_t v719 = 1;
                uint64_t v57 = 2;
                int v613 = 1;
              }
            }
            else
            {
              uint64_t v362 = (uint64_t)v617;
            }
            if ([v773 bundleSuperType] == (id)3 && objc_msgSend(v773, "bundleSubType") != (id)303)
            {
              [v773 bundleRecencyDaysElapsed];
              float v377 = v376;
              double v378 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
              [v378 floatValue];
              BOOL v380 = v377 > v379;

              if (v380)
              {
                v381 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v381, OS_LOG_TYPE_INFO))
                {
                  v382 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
                  [v382 floatValue];
                  float v384 = v383;
                  v385 = [v773 bundleIdentifier];
                  v386 = [v773 suggestionIdentifier];
                  id v387 = [v773 bundleSubType];
                  [v773 bundleRecencyDaysElapsed];
                  *(_DWORD *)buf = 134219010;
                  *(double *)&uint8_t buf[4] = v384;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v385;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v898 = v386;
                  *(_WORD *)&v898[8] = 2048;
                  *(void *)&v898[10] = v387;
                  *(_WORD *)&v898[18] = 2048;
                  *(double *)&v898[20] = v388;
                  _os_log_impl((void *)&_mh_execute_header, v381, OS_LOG_TYPE_INFO, "Suggestion was dismissed from Recommended tab because elapsed time >%.2f days: bundleID %@, suggestionID %@, bundleSubType %lu, elapsedTime %.2f", buf, 0x34u);
                }
                uint64_t v57 = 3;
                uint64_t v719 = 2;
              }
            }
            if ([v773 bundleSuperType] == (id)8)
            {
              [v773 bundleRecencyDaysElapsed];
              float v390 = v389;
              v391 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForStateOfMind"];
              [v391 floatValue];
              BOOL v393 = v390 > v392;

              v394 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              BOOL v395 = os_log_type_enabled(v394, OS_LOG_TYPE_INFO);
              if (v393)
              {
                if (v395)
                {
                  double v396 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
                  [v396 floatValue];
                  float v398 = v397;
                  v399 = [v773 bundleIdentifier];
                  v400 = [v773 suggestionIdentifier];
                  id v401 = [v773 bundleSuperType];
                  [v773 bundleRecencyDaysElapsed];
                  *(_DWORD *)buf = 134219010;
                  *(double *)&uint8_t buf[4] = v398;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v399;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v898 = v400;
                  *(_WORD *)&v898[8] = 2048;
                  *(void *)&v898[10] = v401;
                  *(_WORD *)&v898[18] = 2048;
                  *(double *)&v898[20] = v402;
                  _os_log_impl((void *)&_mh_execute_header, v394, OS_LOG_TYPE_INFO, "Suggestion was dismissed from Recommended tab because elapsed time >%.2f days: bundleID %@, suggestionID %@,bundleSubType %lu, elapsedTime %.2f, ", buf, 0x34u);
                }
                uint64_t v57 = 3;
                uint64_t v719 = 2;
              }
              else if (v395)
              {
                v403 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
                [v403 floatValue];
                float v405 = v404;
                v406 = [v773 bundleIdentifier];
                v407 = [v773 suggestionIdentifier];
                [v773 bundleRecencyDaysElapsed];
                float v409 = v408;
                id v410 = [v773 bundleSuperType];
                *(_DWORD *)buf = 134219266;
                *(double *)&uint8_t buf[4] = v405;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v406;
                *(_WORD *)&buf[22] = 2112;
                *(void *)v898 = v407;
                *(_WORD *)&v898[8] = 2048;
                *(double *)&v898[10] = v409;
                *(_WORD *)&v898[18] = 1024;
                *(_DWORD *)&v898[20] = v748;
                *(_WORD *)&v898[24] = 2048;
                *(void *)&v898[26] = v410;
                _os_log_impl((void *)&_mh_execute_header, v394, OS_LOG_TYPE_INFO, "Suggestion was not dismissed from Recommended tab since elapsed time >%.2f days: bundleID %@, suggestionID %@ elapsedTime %.2f isBundleOrSubBundlesSelectedOrQuickAdded %d, bundleSuperType %lu,", buf, 0x3Au);
              }
            }
            if ((([v773 isBundleAggregated] & 1) != 0
               || [v773 summarizationGranularity] != (id)1
               || [v773 bundleSuperType] == (id)3)
              && [v773 bundleSubType] != (id)102)
            {
              goto LABEL_233;
            }
            double v353 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            BOOL v411 = os_log_type_enabled(v353, OS_LOG_TYPE_INFO);
            if (elapsedDaysSinceOnboardingDate >= v625)
            {
              if (v411)
              {
                v415 = [v773 bundleIdentifier];
                v416 = [v773 suggestionIdentifier];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v415;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v416;
                _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_INFO, "Fine granularity summary suggestion was set to present only in Recent tab: bundleID %@, suggestionID %@", buf, 0x16u);
              }
              uint64_t v57 = 3;
              uint64_t v414 = 2;
            }
            else
            {
              if (v411)
              {
                v412 = [v773 bundleIdentifier];
                v413 = [v773 suggestionIdentifier];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v412;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v413;
                _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_INFO, "Fine granularity summary suggestion was set to present on Recommended tab to enrich Recommended tab: bundleID %@, suggestionID %@", buf, 0x16u);
              }
              uint64_t v57 = 1;
              uint64_t v414 = 1;
            }
            uint64_t v719 = v414;
LABEL_232:

LABEL_233:
            v617 = (void *)v362;
LABEL_234:
            if ([v773 isBundleAggregated]
              && (![v773 summarizationGranularity]
               || [v773 summarizationGranularity] == (id)1
               || [v773 summarizationGranularity] == (id)2))
            {
              v417 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              if (os_log_type_enabled(v417, OS_LOG_TYPE_INFO))
              {
                v418 = [v773 bundleIdentifier];
                v419 = [v773 suggestionIdentifier];
                id v420 = [v773 summarizationGranularity];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v418;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v419;
                *(_WORD *)&buf[22] = 2048;
                *(void *)v898 = v420;
                _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_INFO, "Suggestion was rejected due to isBundleAggregated label: bundleID %@, suggestionID %@ summarizationGranularity %lu", buf, 0x20u);
              }
            }
            else
            {
              if (v57 == 4 || ![v773 isSensitivePOI])
              {
LABEL_247:
                if (v750)
                {
                  v427 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                  if (os_log_type_enabled(v427, OS_LOG_TYPE_INFO))
                  {
                    v428 = [v773 bundleIdentifier];
                    v429 = [v773 suggestionIdentifier];
                    id v430 = [v773 bundleSubType];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v428;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v429;
                    *(_WORD *)&buf[22] = 2048;
                    *(void *)v898 = v430;
                    _os_log_impl((void *)&_mh_execute_header, v427, OS_LOG_TYPE_INFO, "Suggestion was rejected due to isBundleOrSubBundleDeleted: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                  }
                  if ([v773 bundleSubType] == (id)203)
                  {
                    int v613 = 0;
                    goto LABEL_271;
                  }
                  id v436 = [v773 bundleSubType];
                }
                else
                {
                  if (v57 == 4) {
                    unsigned int v431 = 0;
                  }
                  else {
                    unsigned int v431 = v748;
                  }
                  if (v431 != 1) {
                    goto LABEL_273;
                  }
                  if (([v773 isBundleAggregated] & 1) != 0
                    || [v773 summarizationGranularity] != (id)2)
                  {
                    if ([v773 bundleSubType] == (id)303)
                    {
                      v437 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                      if (os_log_type_enabled(v437, OS_LOG_TYPE_INFO))
                      {
                        double v438 = [v773 bundleIdentifier];
                        v439 = [v773 suggestionIdentifier];
                        id v440 = [v773 bundleSubType];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&uint8_t buf[4] = v438;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v439;
                        *(_WORD *)&buf[22] = 2048;
                        *(void *)v898 = v440;
                        _os_log_impl((void *)&_mh_execute_header, v437, OS_LOG_TYPE_INFO, "Contact trend bundle got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                      }
                    }
                    else
                    {
                      BOOL v441 = [v773 bundleSubType] == (id)203;
                      v437 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                      BOOL v442 = os_log_type_enabled(v437, OS_LOG_TYPE_INFO);
                      if (!v441)
                      {
                        if (v442)
                        {
                          uint64_t v457 = [v773 bundleIdentifier];
                          v458 = [v773 suggestionIdentifier];
                          id v459 = [v773 bundleSubType];
                          *(_DWORD *)buf = 134219522;
                          *(void *)&uint8_t buf[4] = v719;
                          *(_WORD *)&buf[12] = 2048;
                          *(void *)&buf[14] = v57;
                          *(_WORD *)&buf[22] = 2048;
                          *(void *)v898 = 2;
                          *(_WORD *)&v898[8] = 2048;
                          *(void *)&v898[10] = 3;
                          *(_WORD *)&v898[18] = 2112;
                          *(void *)&v898[20] = v457;
                          *(_WORD *)&v898[28] = 2112;
                          *(void *)&v898[30] = v458;
                          __int16 v899 = 2048;
                          id v900 = v459;
                          _os_log_impl((void *)&_mh_execute_header, v437, OS_LOG_TYPE_INFO, "(rankingCategory,visibilityCategory) were updated from (%lu,%lu) to (%lu,%lu) due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@, bundleSubType %lu", buf, 0x48u);
                        }
                        uint64_t v57 = 3;
                        uint64_t v446 = 2;
                        goto LABEL_272;
                      }
                      if (v442)
                      {
                        v443 = [v773 bundleIdentifier];
                        double v444 = [v773 suggestionIdentifier];
                        id v445 = [v773 bundleSubType];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&uint8_t buf[4] = v443;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v444;
                        *(_WORD *)&buf[22] = 2048;
                        *(void *)v898 = v445;
                        _os_log_impl((void *)&_mh_execute_header, v437, OS_LOG_TYPE_INFO, "Workout routine bundle got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                      }
                    }

LABEL_271:
                    uint64_t v57 = 4;
                    uint64_t v446 = 3;
LABEL_272:
                    uint64_t v719 = v446;
LABEL_273:
                    if (([v773 isWorkVisit] & 1) == 0
                      && ![v773 isShortVisit])
                    {
                      goto LABEL_121;
                    }
                    [v773 numPhotoAssetsResourcesNormalized];
                    if (v447 != 0.0) {
                      goto LABEL_121;
                    }
                    v245 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                    if (os_log_type_enabled(v245, OS_LOG_TYPE_INFO))
                    {
                      v448 = [v773 bundleIdentifier];
                      v449 = [v773 suggestionIdentifier];
                      unsigned int v450 = [v773 isWorkVisit];
                      unsigned int v451 = [v773 isShortVisit];
                      *(_DWORD *)buf = 138413058;
                      *(void *)&uint8_t buf[4] = v448;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v449;
                      *(_WORD *)&buf[22] = 1024;
                      *(_DWORD *)v898 = v450;
                      *(_WORD *)&v898[4] = 1024;
                      *(_DWORD *)&v898[6] = v451;
                      _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_INFO, "Outing suggestion was rejected because it was either work or short visit (or both) without any photo: bundleID %@, suggestionID %@ isWorkVisit %d isShortVisit %d", buf, 0x22u);
                    }
                    unsigned int v684 = 1;
LABEL_128:
                    uint64_t v719 = 3;
                    uint64_t v57 = 4;
                    goto LABEL_129;
                  }
                  double v432 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                  if (os_log_type_enabled(v432, OS_LOG_TYPE_INFO))
                  {
                    v433 = [v773 bundleIdentifier];
                    v434 = [v773 suggestionIdentifier];
                    id v435 = [v773 bundleSubType];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v433;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v434;
                    *(_WORD *)&buf[22] = 2048;
                    *(void *)v898 = v435;
                    _os_log_impl((void *)&_mh_execute_header, v432, OS_LOG_TYPE_INFO, "Coarse summary suggestion got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                  }
                  id v436 = [v773 bundleSubType];
                }
                int v615 = (v436 != (id)202) & v615;
                goto LABEL_271;
              }
              v417 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              BOOL v422 = os_log_type_enabled(v417, OS_LOG_TYPE_INFO);
              if (v57 != 2)
              {
                if (v422)
                {
                  v452 = [v773 bundleIdentifier];
                  uint64_t v453 = [v773 suggestionIdentifier];
                  v454 = [v773 bundleStartDate];
                  id v455 = [v773 bundleEndDate];
                  *(_DWORD *)buf = 138413058;
                  *(void *)&uint8_t buf[4] = v452;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v453;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v898 = v454;
                  *(_WORD *)&v898[8] = 2112;
                  *(void *)&v898[10] = v455;
                  _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_INFO, "Suggestion was set to recent only since it contains sensitive POI: bundleID %@, suggestionID %@ startDate %@ endDate %@", buf, 0x2Au);
                }
                uint64_t v57 = 3;
                uint64_t v421 = 2;
                goto LABEL_241;
              }
              if (v422)
              {
                v423 = [v773 bundleIdentifier];
                v424 = [v773 suggestionIdentifier];
                v425 = [v773 bundleStartDate];
                double v426 = [v773 bundleEndDate];
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v423;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v424;
                *(_WORD *)&buf[22] = 2112;
                *(void *)v898 = v425;
                *(_WORD *)&v898[8] = 2112;
                *(void *)&v898[10] = v426;
                _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_INFO, "Suggestion (recommended only) was rejected since it contains sensitive POI: bundleID %@, suggestionID %@ startDate %@ endDate %@", buf, 0x2Au);
              }
            }
            uint64_t v57 = 4;
            uint64_t v421 = 3;
LABEL_241:
            uint64_t v719 = v421;

            goto LABEL_247;
          }
          float v300 = -1.0;
          if ([v773 bundleSubType] == (id)105)
          {
            BOOL v56 = 0;
            BOOL v55 = 1;
LABEL_161:
            float v60 = -1.0;
            goto LABEL_169;
          }
          if ([v773 bundleSubType] == (id)201)
          {
            v311 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v312 = [v311 objectForKeyedSubscript:@"suggestionAcceptThresholdForWorkoutSubtype"];
            [v312 floatValue];
            float v60 = v313;

            v314 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v315 = [v314 objectForKeyedSubscript:@"suggestionRecommendThresholdForWorkoutSubtype"];
            [v315 floatValue];
            float v300 = v316;

            double v317 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v318 = [v317 objectForKeyedSubscript:@"summarizationThresholdForWorkoutSubType"];
            [v318 floatValue];
            float v320 = v319;

            double v321 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v322 = [v321 objectForKeyedSubscript:@"tripSummarizationThresholdForWorkoutSubType"];
            [v322 floatValue];
            float v324 = v323;

            BOOL v56 = v58 > v320;
            BOOL v55 = v58 > v324;
            goto LABEL_169;
          }
          v326 = (void *)phoneSensedWalkingVariants;
          v327 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
          LODWORD(v326) = [v326 containsObject:v327];

          if (v326)
          {
            v328 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            double v329 = [v328 objectForKeyedSubscript:@"suggestionAcceptThresholdForMotionActivityWalkingSubtype"];
            [v329 floatValue];
            float v60 = v330;

            v331 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v332 = [v331 objectForKeyedSubscript:@"suggestionRecommendThresholdForMotionActivityWalkingSubtype"];
            [v332 floatValue];
            float v300 = v333;

            v334 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v335 = [v334 objectForKeyedSubscript:@"summarizationThresholdForMotionActivityWalkingSubType"];
            [v335 floatValue];
            BOOL v337 = v58 > v336;

            if (v337)
            {
              BOOL v55 = 0;
              BOOL v56 = 1;
              goto LABEL_169;
            }
          }
          else
          {
            if ([v773 bundleSubType] == (id)202)
            {
              uint64_t v338 = [v773 bundleStartDate];

              uint64_t v339 = [v773 bundleEndDate];

              v340 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v341 = [v340 objectForKeyedSubscript:@"suggestionAcceptThresholdForWorkoutWeeklySummarySubType"];
              [v341 floatValue];
              float v60 = v342;

              v343 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v344 = [v343 objectForKeyedSubscript:@"suggestionRecommendThresholdForWorkoutWeeklySummarySubType"];
              [v344 floatValue];
              float v300 = v345;

              BOOL v55 = 0;
              BOOL v56 = 0;
              v610 = (void *)v339;
              v611 = (void *)v338;
              goto LABEL_169;
            }
            if ([v773 bundleSubType] == (id)301 || objc_msgSend(v773, "bundleSubType") == (id)303)
            {
              v460 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v461 = [v460 objectForKeyedSubscript:@"suggestionAcceptThresholdForContactSubType"];
              [v461 floatValue];
              float v60 = v462;

              v463 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v464 = [v463 objectForKeyedSubscript:@"suggestionRecommendThresholdForContactSubType"];
              [v464 floatValue];
              float v300 = v465;
            }
            else if ([v773 bundleSubType] == (id)302)
            {
              v466 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v467 = [v466 objectForKeyedSubscript:@"suggestionAcceptThresholdForContactWeeklySummarySubType"];
              [v467 floatValue];
              float v60 = v468;

              v469 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v470 = [v469 objectForKeyedSubscript:@"suggestionRecommendThresholdForContactWeeklySummarySubType"];
              [v470 floatValue];
              float v300 = v471;
            }
            else
            {
              v472 = (void *)dailyMediaSubtypeVariants;
              v473 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
              LODWORD(v472) = [v472 containsObject:v473];

              if (v472)
              {
                v474 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                v475 = [v474 objectForKeyedSubscript:@"suggestionAcceptThresholdForDailyMediaVariants"];
                [v475 floatValue];
                float v60 = v476;

                v477 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                v478 = [v477 objectForKeyedSubscript:@"suggestionRecommendThresholdForDailyMediaVariants"];
                [v478 floatValue];
                float v300 = v479;
              }
              else
              {
                v480 = (void *)MediaWeeklySummarySubtypeVariants;
                v481 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
                LODWORD(v480) = [v480 containsObject:v481];

                if (v480)
                {
                  v482 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  double v483 = [v482 objectForKeyedSubscript:@"suggestionAcceptThresholdForWeeklyMediaSummaryVariants"];
                  [v483 floatValue];
                  float v60 = v484;

                  v485 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  v486 = [v485 objectForKeyedSubscript:@"suggestionRecommendThresholdForWeeklyMediaSummaryVariants"];
                  [v486 floatValue];
                  float v300 = v487;
                }
                else
                {
                  v488 = (void *)timeAtHomeSubtypeVariants;
                  v489 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
                  LODWORD(v488) = [v488 containsObject:v489];

                  if (!v488)
                  {
                    BOOL v55 = 0;
                    BOOL v56 = 0;
                    goto LABEL_161;
                  }
                  v490 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  v491 = [v490 objectForKeyedSubscript:@"suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"];
                  [v491 floatValue];
                  float v60 = v492;

                  v493 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  v494 = [v493 objectForKeyedSubscript:@"suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"];
                  [v494 floatValue];
                  float v300 = v495;
                }
              }
            }
          }
LABEL_158:
          BOOL v55 = 0;
          BOOL v56 = 0;
          goto LABEL_169;
        }
        if ([v773 bundleInterfaceType] == (id)11
          && ([v773 evergreenPromptExists] & 1) == 0)
        {
          long long v248 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v248, OS_LOG_TYPE_INFO))
          {
            long long v249 = [v773 bundleIdentifier];
            v250 = [v773 suggestionIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v249;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v250;
            _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_INFO, "Evergreen suggestion got rejected because prompt doesn't exist: bundleID %@, suggestionID %@", buf, 0x16u);
          }
          uint64_t v57 = 4;
          uint64_t v244 = 3;
        }
        else
        {
          uint64_t v57 = 2;
          uint64_t v244 = 1;
        }
        uint64_t v719 = v244;
        BOOL v55 = 0;
        float v59 = -1.0;
        if ([v773 bundleInterfaceType] == (id)10 && v748 | v750)
        {
          v245 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          float v60 = -1.0;
          if (os_log_type_enabled(v245, OS_LOG_TYPE_INFO))
          {
            v251 = [v773 bundleIdentifier];
            v252 = [v773 suggestionIdentifier];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v251;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v252;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v898 = v748;
            *(_WORD *)&v898[4] = 1024;
            *(_DWORD *)&v898[6] = v750;
            _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_INFO, "Photo Memory suggestion got rejected due to engagement signal: bundleID %@, suggestionID %@, isBundleOrSubBundlesSelectedOrQuickAdded %d, isBundleOrSubBundleDeleted %d", buf, 0x22u);
          }
          BOOL v56 = 0;
          BOOL v55 = 0;
          unsigned int v684 = 0;
          goto LABEL_128;
        }
        BOOL v56 = 0;
        float v60 = -1.0;
LABEL_121:
        if ((unint64_t)(v57 - 1) > 1 || [v773 bundleInterfaceType] == (id)11)
        {
          unsigned int v684 = 0;
          goto LABEL_130;
        }
        v288 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleInterfaceType]);
        double v289 = [v623 objectForKeyedSubscript:v288];
        signed int v290 = [v289 intValue];

        v245 = +[NSNumber numberWithUnsignedInteger:v290 + 1];
        v291 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleInterfaceType]);
        [v623 setObject:v245 forKeyedSubscript:v291];

        unsigned int v684 = 0;
LABEL_129:

LABEL_130:
        signed int v255 = [(MOConfigurationManagerBase *)self->_configurationManager getIntegerSettingForKey:@"EventManagerOverridePatternRehydrationFailureCountThreshold" withFallback:10];
        long long v870 = 0u;
        long long v869 = 0u;
        long long v868 = 0u;
        long long v867 = 0u;
        v256 = [v773 events];
        id v257 = [v256 countByEnumeratingWithState:&v867 objects:v896 count:16];
        if (v257)
        {
          uint64_t v258 = *(void *)v868;
          unint64_t v259 = v255;
          do
          {
            for (k = 0; k != v257; k = (char *)k + 1)
            {
              if (*(void *)v868 != v258) {
                objc_enumerationMutation(v256);
              }
              v261 = *(void **)(*((void *)&v867 + 1) + 8 * (void)k);
              if ((unint64_t)[v261 rehydrationFailCount] >= v259)
              {
                v262 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v262, OS_LOG_TYPE_INFO))
                {
                  v263 = [v773 bundleIdentifier];
                  id v264 = [v261 rehydrationFailCount];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v263;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v264;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v898 = v261;
                  _os_log_impl((void *)&_mh_execute_header, v262, OS_LOG_TYPE_INFO, "rejecting bundle %@ due to rehydration failures count bigger than threshold, %lu, in event %@", buf, 0x20u);
                }
                uint64_t v57 = 4;
              }
            }
            id v257 = [v256 countByEnumeratingWithState:&v867 objects:v896 count:16];
          }
          while (v257);
        }

        if (v57 != 4)
        {
          id v265 = [v773 bundleInterfaceType];
          unint64_t v266 = v622;
          if (v265 != (id)11) {
            unint64_t v266 = v622 + 1;
          }
          unint64_t v622 = v266;
        }

LABEL_146:
        if (v61 > 1.0) {
          float v61 = 1.0;
        }
        v894[0] = @"richnessScore";
        *(float *)&double v63 = v64;
        v768 = +[NSNumber numberWithFloat:v63];
        v895[0] = v768;
        v894[1] = @"distinctnessScore";
        *(float *)&double v267 = v759;
        id v763 = +[NSNumber numberWithFloat:v267];
        v895[1] = v763;
        v894[2] = @"heuristicsScore";
        *(float *)&double v268 = v743;
        v754 = +[NSNumber numberWithFloat:v268];
        v895[2] = v754;
        v894[3] = @"qualityScore";
        *(float *)&double v269 = v736;
        v746 = +[NSNumber numberWithFloat:v269];
        v895[3] = v746;
        v894[4] = @"engagementScore";
        *(float *)&double v270 = v740;
        v741 = +[NSNumber numberWithFloat:v270];
        v895[4] = v741;
        v894[5] = @"baseScore";
        v739 = +[NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(fmaxf(v62, 0.0)))];
        v895[5] = v739;
        v894[6] = @"bundleInterfaceType";
        v735 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleInterfaceType]);
        v895[6] = v735;
        v894[7] = @"bundleSubType";
        v732 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSubType]);
        v895[7] = v732;
        v894[8] = @"bundleSuperType";
        v729 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v773 bundleSuperType]);
        v895[8] = v729;
        v894[9] = @"decayFactor";
        *(float *)&double v271 = v61;
        v725 = +[NSNumber numberWithFloat:v271];
        v895[9] = v725;
        v894[10] = @"rankingCategory";
        v721 = +[NSNumber numberWithUnsignedInteger:v719];
        v895[10] = v721;
        v894[11] = @"visibilityCategoryForUI";
        v718 = +[NSNumber numberWithUnsignedInteger:v57];
        v895[11] = v718;
        v894[12] = @"viewCountBasedScoreAdjustment";
        v716 = +[NSNumber numberWithFloat:0.0];
        v895[12] = v716;
        v894[13] = @"bundleGoodnessScore";
        *(float *)&double v272 = v58;
        v714 = +[NSNumber numberWithFloat:v272];
        v895[13] = v714;
        v894[14] = @"elapsedDaysFromBundleEndDate";
        [v773 bundleRecencyDaysElapsed];
        v712 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v895[14] = v712;
        v894[15] = @"bundleIdentifier";
        v710 = [v773 bundleIdentifier];
        v895[15] = v710;
        v894[16] = @"suggestionIdentifier";
        v708 = [v773 suggestionIdentifier];
        v895[16] = v708;
        v895[17] = &off_1002F73E8;
        v894[17] = @"isDuplicated";
        v894[18] = @"isEligibleForTimeContextSummarization";
        v706 = +[NSNumber numberWithBool:v56];
        v895[18] = v706;
        v894[19] = @"isEligibleForTripSummarization";
        v704 = +[NSNumber numberWithBool:v55];
        v895[19] = v704;
        v895[20] = &off_1002F73E8;
        v894[20] = @"isPseudoDupInRecommendedTab";
        v894[21] = @"isPseudoDupInRecentTab";
        v895[21] = &off_1002F73E8;
        v895[22] = &off_1002F73E8;
        v894[22] = @"isWithinHoldOffPeriod";
        v894[23] = @"allPlaceNamesSet";
        v702 = [v773 allPlaceNames];
        v895[23] = v702;
        v894[24] = @"workoutTypesSet";
        v700 = [v773 workoutTypes];
        v895[24] = v700;
        v894[25] = @"allContactIdentifiersSet";
        v698 = [v773 allContactIdentifiers];
        v895[25] = v698;
        v894[26] = @"allStateOfMindIdentifiersSet";
        v696 = [v773 allStateOfMindIdentifiers];
        v895[26] = v696;
        v894[27] = @"stateOfMindLoggedIn3pApp";
        [v773 stateOfMindLoggedIn3pApp];
        v694 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v895[27] = v694;
        v894[28] = @"stateOfMindLoggedInJournalApp";
        [v773 stateOfMindLoggedInJournalApp];
        v692 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v895[28] = v692;
        v894[29] = @"numAnomalyEventsNormalized";
        [v773 numAnomalyEventsNormalized];
        v690 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v895[29] = v690;
        v894[30] = @"numPhotoAssetsResourcesNormalized";
        [v773 numPhotoAssetsResourcesNormalized];
        v273 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v895[30] = v273;
        v894[31] = @"isCoarseGranularitySummaryKey";
        BOOL v275 = ([v773 isBundleAggregated] & 1) == 0
            && [v773 summarizationGranularity] == (id)2;
        *(float *)&double v274 = elapsedDaysSinceOnboardingDate;
        v276 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v275, v274);
        v895[31] = v276;
        v894[32] = @"isBundleOrSubBundleDeleted";
        double v277 = +[NSNumber numberWithBool:v750];
        v895[32] = v277;
        v894[33] = @"isBundleOrSubBundlesSelectedOrQuickAdded";
        v278 = +[NSNumber numberWithBool:v748];
        v895[33] = v278;
        v894[34] = @"bundleStartDate";
        v279 = [v773 bundleStartDate];
        v895[34] = v279;
        v894[35] = @"bundleEndDate";
        v280 = [v773 bundleEndDate];
        v895[35] = v280;
        v894[36] = @"suppressCoarseSummarization";
        double v281 = +[NSNumber numberWithBool:elapsedDaysSinceOnboardingDate < v625];
        v895[36] = v281;
        v894[37] = @"suggestionAcceptThreshold";
        *(float *)&double v282 = v60;
        v283 = +[NSNumber numberWithFloat:v282];
        v895[37] = v283;
        v894[38] = @"suggestionRecommendThreshold";
        *(float *)&double v284 = v59;
        double v285 = +[NSNumber numberWithFloat:v284];
        v895[38] = v285;
        v894[39] = @"kRejectedByVisitHeuristicsFilter";
        v286 = +[NSNumber numberWithBool:v684];
        v895[39] = v286;
        v774 = +[NSDictionary dictionaryWithObjects:v895 forKeys:v894 count:40];

        v287 = [(MOEventBundleRanking *)self _checkAndUpdateNumericLimits:v774];
        [v627 addObject:v287];

        uint64_t v29 = v686 + 1;
        if ((id)(v686 + 1) != v628) {
          continue;
        }
        break;
      }
      id v496 = [v621 countByEnumeratingWithState:&v877 objects:v903 count:16];
      id v628 = v496;
      if (v496) {
        continue;
      }
      break;
    }
LABEL_301:

    v497 = [v623 allValues];
    v498 = [v497 valueForKeyPath:@"@sum.self"];
    signed int v499 = [v498 intValue];

    double v500 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    unint64_t v25 = v499;
    if (os_log_type_enabled(v500, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v622;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v499;
      *(_WORD *)&buf[22] = 2048;
      *(void *)v898 = v614;
      _os_log_impl((void *)&_mh_execute_header, v500, OS_LOG_TYPE_INFO, "Current allowed sensed bundle count=%lu, total sensed bundle count in Recommended tab =%lu, minimum sensed bundle count threshold in Recommended tab %lu", buf, 0x20u);
    }

    if (v622)
    {
      if (v622 != v499)
      {
        if (v614 <= v499)
        {
          id v6 = v623;
        }
        else
        {
          id v6 = objc_opt_new();

          v501 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v501, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)&uint8_t buf[4] = v25;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v614;
            *(_WORD *)&buf[22] = 2048;
            *(double *)v898 = v616;
            _os_log_impl((void *)&_mh_execute_header, v501, OS_LOG_TYPE_INFO, "Sensed suggestion count in Recommended tab (%lu) is less than required (%lu). Setting lower recommended threshold %f ", buf, 0x20u);
          }
        }
        float v26 = v616 + -0.25;
        if ((float)(v616 + -0.25) < 0.0)
        {
          v502 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v502, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v614;
            _os_log_impl((void *)&_mh_execute_header, v502, OS_LOG_TYPE_INFO, "Recommendation threshold is set to rejection threshold, but still can't satisfy minimum suggestion count requirement (%lu). continue", buf, 0xCu);
          }
          v623 = v6;
          break;
        }
        continue;
      }
      v502 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v502, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v502, OS_LOG_TYPE_INFO, "Labeled all unrejected bundles to be shown on Recommended tab", buf, 2u);
      }
      unint64_t v25 = v622;
    }
    else
    {
      v502 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v502, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v502, OS_LOG_TYPE_INFO, "No bundle available for the sheet", buf, 2u);
      }
    }
    break;
  }

LABEL_321:
  v503 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v503, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.6(v613 & 1, v615 & 1, v503);
  }

  v504 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v504, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.5();
  }

  if (v613 & v615)
  {
    if ([v612 isEqualToSet:v617])
    {
      v505 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v505, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v505, OS_LOG_TYPE_INFO, "Both Workout Routine and weekly workout summary are eligible for recommended tab. Tagging weekly summary to be suppressed downstream.", buf, 2u);
      }

      LOBYTE(v615) = 0;
    }
    else
    {
      LOBYTE(v615) = 1;
    }
  }
  float frequencyPenalty = self->_frequencyPenalty;
  v775 = objc_opt_new();
  long long v866 = 0u;
  long long v865 = 0u;
  long long v864 = 0u;
  long long v863 = 0u;
  v507 = [v623 allKeys];
  id v508 = [v507 countByEnumeratingWithState:&v863 objects:v893 count:16];
  if (v508)
  {
    float v509 = log((float)(frequencyPenalty + 1.0));
    uint64_t v510 = *(void *)v864;
    double v511 = v509;
    do
    {
      for (m = 0; m != v508; m = (char *)m + 1)
      {
        if (*(void *)v864 != v510) {
          objc_enumerationMutation(v507);
        }
        uint64_t v513 = *(void *)(*((void *)&v863 + 1) + 8 * (void)m);
        if (v25)
        {
          v514 = [v623 objectForKeyedSubscript:*(void *)(*((void *)&v863 + 1) + 8 * (void)m)];
          [v514 floatValue];
          float v516 = v515;

          long double v517 = log((float)((float)(self->_frequencyPenalty * (float)(1.0 - (float)(v516 / (float)v25))) + 1.0)) / v511;
          *(float *)&long double v517 = v517;
          v518 = +[NSNumber numberWithFloat:(double)v517];
          [v775 setObject:v518 forKeyedSubscript:v513];
        }
        else
        {
          [v775 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v863 + 1) + 8 * (void)m)];
        }
      }
      id v508 = [v507 countByEnumeratingWithState:&v863 objects:v893 count:16];
    }
    while (v508);
  }

  v519 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v519, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.4();
  }

  v520 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v520, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]();
  }

  v521 = [v775 allKeys];
  id v755 = [v521 count];

  v769 = objc_opt_new();
  long long v862 = 0u;
  long long v861 = 0u;
  long long v860 = 0u;
  long long v859 = 0u;
  id v764 = v627;
  id v522 = [v764 countByEnumeratingWithState:&v859 objects:v892 count:16];
  if (v522)
  {
    uint64_t v523 = 0;
    uint64_t v524 = *(void *)v860;
    do
    {
      for (n = 0; n != v522; n = (char *)n + 1)
      {
        if (*(void *)v860 != v524) {
          objc_enumerationMutation(v764);
        }
        v526 = *(void **)(*((void *)&v859 + 1) + 8 * (void)n);
        v527 = [v526 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        unsigned int v528 = [v527 intValue];

        v529 = [v526 objectForKeyedSubscript:@"bundleInterfaceType"];
        v530 = v529;
        if (v528 - 1 > 1)
        {
          float v543 = 0.0;
          float v533 = 1.0;
          if ([v529 intValue] != 11) {
            goto LABEL_361;
          }
        }
        else
        {
          v531 = [v775 objectForKeyedSubscript:v529];
          [v531 floatValue];
          float v533 = v532;

          if (v755 == (id)1) {
            float v533 = 1.0;
          }
          if ([v530 intValue] != 11)
          {
            id v534 = [v526 objectForKeyedSubscript:@"baseScore"];
            [v534 floatValue];
            float v536 = v535;
            v537 = [v526 objectForKeyedSubscript:@"viewCountBasedScoreAdjustment"];
            [v537 floatValue];
            float v539 = v538;

            if ((float)(v536 + v539) >= 0.0) {
              float v540 = v536 + v539;
            }
            else {
              float v540 = 0.0;
            }
            v541 = [v526 objectForKeyedSubscript:@"decayFactor"];
            [v541 floatValue];
            float v543 = v533 * (float)(v540 * v542);
            goto LABEL_360;
          }
        }
        v541 = [v526 objectForKeyedSubscript:@"baseScore"];
        [v541 floatValue];
        float v543 = v544;
LABEL_360:

LABEL_361:
        unsigned int v545 = objc_opt_new();
        [v545 addEntriesFromDictionary:v526];
        *(float *)&double v546 = v543;
        v547 = +[NSNumber numberWithFloat:v546];
        [v545 setObject:v547 forKey:@"rankingScore"];

        *(float *)&double v548 = v533;
        v549 = +[NSNumber numberWithFloat:v548];
        [v545 setObject:v549 forKey:@"diversityCoefficient"];

        id v550 = +[NSNumber numberWithUnsignedInteger:(char *)n + v523];
        [v545 setObject:v550 forKey:@"rankingDictionaryIndex"];

        [v769 addObject:v545];
      }
      id v522 = [v764 countByEnumeratingWithState:&v859 objects:v892 count:16];
      v523 += (uint64_t)n;
    }
    while (v522);
  }

  v756 = +[NSCalendar currentCalendar];
  v551 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v551, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]();
  }

  long long v552 = [v756 components:28 fromDate:v687];
  long long v553 = [v756 dateFromComponents:v552];

  v722 = [v756 components:28 fromDate:v688];

  long long v554 = [v756 dateFromComponents:v722];

  v751 = [v756 dateByAddingUnit:16 value:1 toDate:v554 options:0];

  v749 = objc_opt_new();
  id v726 = v553;
  long long v555 = v726;
  if ([v726 compare:v751] == (id)-1)
  {
    long long v555 = v726;
    do
    {
      id v593 = v555;
      v594 = [v756 dateByAddingUnit:16 value:1 toDate:v593 options:0];
      v856[0] = _NSConcreteStackBlock;
      v856[1] = 3221225472;
      v856[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke;
      v856[3] = &unk_1002D0960;
      id v595 = v593;
      id v857 = v595;
      id v596 = v594;
      id v858 = v596;
      v597 = +[NSPredicate predicateWithBlock:v856];
      v598 = [v769 filteredArrayUsingPredicate:v597];
      v599 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v599, OS_LOG_TYPE_DEBUG))
      {
        id v607 = [v598 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v595;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v596;
        *(_WORD *)&buf[22] = 2048;
        *(void *)v898 = v607;
        _os_log_debug_impl((void *)&_mh_execute_header, v599, OS_LOG_TYPE_DEBUG, "RankingDict count between %@-%@:%lu", buf, 0x20u);
      }

      v600 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1002F9290];
      v601 = [v598 filteredArrayUsingPredicate:v600];

      v602 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v602, OS_LOG_TYPE_DEBUG)) {
        -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]((uint64_t)v891, (uint64_t)v601);
      }

      v603 = +[NSSortDescriptor sortDescriptorWithKey:@"bundleGoodnessScore" ascending:0];
      v604 = +[NSArray arrayWithObject:v603];
      v605 = [v601 sortedArrayUsingDescriptors:v604];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)v898 = __Block_byref_object_copy__30;
      *(void *)&v898[8] = __Block_byref_object_dispose__30;
      *(void *)&v898[16] = objc_opt_new();
      uint64_t v836 = 0;
      v837 = &v836;
      uint64_t v838 = 0x2020000000;
      v839 = 0;
      uint64_t v830 = 0;
      v831 = &v830;
      uint64_t v832 = 0x2020000000;
      LOBYTE(v833) = 0;
      v850[0] = _NSConcreteStackBlock;
      v850[1] = 3221225472;
      v850[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1123;
      v850[3] = &unk_1002D0988;
      v850[4] = self;
      id v851 = v749;
      id v606 = v769;
      id v852 = v606;
      v853 = buf;
      v854 = &v836;
      v855 = &v830;
      [v605 enumerateObjectsUsingBlock:v850];
      if (*((unsigned char *)v831 + 24) && v837[3] >= 2)
      {
        v848[0] = _NSConcreteStackBlock;
        v848[1] = 3221225472;
        v848[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1129;
        v848[3] = &unk_1002D09B0;
        id v849 = v606;
        [v605 enumerateObjectsUsingBlock:v848];
      }
      _Block_object_dispose(&v830, 8);
      _Block_object_dispose(&v836, 8);
      _Block_object_dispose(buf, 8);

      long long v555 = [v756 dateByAddingUnit:16 value:1 toDate:v595 options:0];
    }
    while ([v555 compare:v751] == (id)-1);
  }

  v771 = objc_opt_new();
  id v742 = v726;
  objc_super v556 = v742;
  if ([v742 compare:v751] == (id)-1)
  {
    objc_super v556 = v742;
    do
    {
      id v557 = v556;
      v558 = [v756 dateByAddingUnit:16 value:1 toDate:v557 options:0];
      v845[0] = _NSConcreteStackBlock;
      v845[1] = 3221225472;
      v845[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1130;
      v845[3] = &unk_1002D0960;
      id v559 = v557;
      id v846 = v559;
      id v560 = v558;
      id v847 = v560;
      v561 = +[NSPredicate predicateWithBlock:v845];
      v562 = [v769 filteredArrayUsingPredicate:v561];
      v563 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1002F92A8];
      v564 = [v562 filteredArrayUsingPredicate:v563];

      v565 = +[NSSortDescriptor sortDescriptorWithKey:@"bundleStartDate" ascending:0];
      v566 = +[NSArray arrayWithObject:v565];
      v567 = [v564 sortedArrayUsingDescriptors:v566];

      v843[0] = _NSConcreteStackBlock;
      v843[1] = 3221225472;
      v843[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_2;
      v843[3] = &unk_1002D09B0;
      id v844 = v771;
      [v567 enumerateObjectsUsingBlock:v843];

      objc_super v556 = [v756 dateByAddingUnit:16 value:1 toDate:v559 options:0];
    }
    while ([v556 compare:v751] == (id)-1);
  }

  uint64_t v568 = +[NSSortDescriptor sortDescriptorWithKey:@"rankingScore" ascending:0];
  v569 = +[NSArray arrayWithObject:v568];
  v570 = [v769 sortedArrayUsingDescriptors:v569];
  id v571 = [v570 mutableCopy];

  v842[0] = 0;
  v842[1] = v842;
  v842[2] = 0x2020000000;
  v842[3] = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)v898 = __Block_byref_object_copy__30;
  *(void *)&v898[8] = __Block_byref_object_dispose__30;
  *(void *)&v898[16] = objc_opt_new();
  uint64_t v836 = 0;
  v837 = &v836;
  uint64_t v838 = 0x3032000000;
  v839 = __Block_byref_object_copy__30;
  v840 = __Block_byref_object_dispose__30;
  id v841 = (id)objc_opt_new();
  uint64_t v830 = 0;
  v831 = &v830;
  uint64_t v832 = 0x3032000000;
  v833 = __Block_byref_object_copy__30;
  v834 = __Block_byref_object_dispose__30;
  id v835 = (id)objc_opt_new();
  v828[0] = 0;
  v828[1] = v828;
  v828[2] = 0x3032000000;
  v828[3] = __Block_byref_object_copy__30;
  v828[4] = __Block_byref_object_dispose__30;
  id v829 = (id)objc_opt_new();
  v826[0] = 0;
  v826[1] = v826;
  v826[2] = 0x3032000000;
  v826[3] = __Block_byref_object_copy__30;
  v826[4] = __Block_byref_object_dispose__30;
  id v827 = (id)objc_opt_new();
  v824[0] = 0;
  v824[1] = v824;
  v824[2] = 0x3032000000;
  v824[3] = __Block_byref_object_copy__30;
  v824[4] = __Block_byref_object_dispose__30;
  id v825 = (id)objc_opt_new();
  uint64_t v818 = 0;
  v819 = &v818;
  uint64_t v820 = 0x3032000000;
  v821 = __Block_byref_object_copy__30;
  v822 = __Block_byref_object_dispose__30;
  id v823 = (id)objc_opt_new();
  uint64_t v814 = 0;
  v815 = &v814;
  uint64_t v816 = 0x2020000000;
  uint64_t v817 = 0;
  uint64_t v810 = 0;
  v811 = &v810;
  uint64_t v812 = 0x2020000000;
  uint64_t v813 = 0;
  uint64_t v806 = 0;
  v807 = &v806;
  uint64_t v808 = 0x2020000000;
  uint64_t v809 = 0;
  v804[0] = 0;
  v804[1] = v804;
  v804[2] = 0x2020000000;
  char v805 = 0;
  v802[0] = 0;
  v802[1] = v802;
  v802[2] = 0x2020000000;
  char v803 = 0;
  v800[0] = 0;
  v800[1] = v800;
  v800[2] = 0x2020000000;
  char v801 = 0;
  v780[0] = _NSConcreteStackBlock;
  v780[1] = 3221225472;
  v780[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3;
  v780[3] = &unk_1002D09D8;
  v785 = buf;
  v786 = &v836;
  v787 = &v830;
  v788 = &v810;
  id v572 = v771;
  id v781 = v572;
  char v799 = v615 & 1;
  id v747 = v611;
  id v782 = v747;
  id v772 = v610;
  id v783 = v772;
  v789 = v826;
  v790 = v828;
  v791 = v824;
  v792 = &v814;
  v793 = v842;
  v794 = &v818;
  v795 = v804;
  v796 = v802;
  v797 = v800;
  v798 = &v806;
  id v573 = v571;
  id v784 = v573;
  [v573 enumerateObjectsUsingBlock:v780];
  uint64_t v574 = v807[3];
  v575 = (void *)v568;
  if (v574 >= 24)
  {
    v811[3] = 0;
  }
  else
  {
    uint64_t v576 = 3;
    if (v574 > 15) {
      uint64_t v576 = 4;
    }
    if (v574 <= 19) {
      uint64_t v577 = v576;
    }
    else {
      uint64_t v577 = 5;
    }
    v811[3] = 0;
    v578 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v578, OS_LOG_TYPE_INFO))
    {
      v579 = (void *)v807[3];
      *(_DWORD *)v885 = 134218240;
      v886 = v579;
      __int16 v887 = 2048;
      uint64_t v888 = v577;
      _os_log_impl((void *)&_mh_execute_header, v578, OS_LOG_TYPE_INFO, "Total recommended sensed suggestion count=%ld, Adjust evergreen count to %ld", v885, 0x16u);
    }

    v776[0] = _NSConcreteStackBlock;
    v776[1] = 3221225472;
    v776[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1134;
    v776[3] = &unk_1002D0A00;
    v778 = &v810;
    uint64_t v779 = v577;
    id v777 = v573;
    [v777 enumerateObjectsUsingBlock:v776];
  }
  v580 = +[NSSortDescriptor sortDescriptorWithKey:@"rankingDictionaryIndex" ascending:1];
  v581 = +[NSArray arrayWithObject:v580];

  v582 = [v573 sortedArrayUsingDescriptors:v581];
  id v583 = [v582 mutableCopy];

  v584 = [(id)v819[5] objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v584 floatValue];
  if (v585 == 0.0)
  {
    v586 = [(id)v819[5] objectForKeyedSubscript:@"allPlaceNamesSet"];
    if (([v586 isEqualToSet:emptyStringSet] & 1) == 0)
    {

      goto LABEL_395;
    }
    BOOL v587 = (unint64_t)v815[3] > 1;

    if (v587)
    {
      [(id)v819[5] setObject:&off_1002F7400 forKeyedSubscript:@"visibilityCategoryForUI"];
      [(id)v819[5] setObject:&off_1002F7190 forKeyedSubscript:@"rankingCategory"];
      [(id)v819[5] setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
      [(id)v819[5] setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      v588 = [(id)v819[5] objectForKeyedSubscript:@"rankingDictionaryIndex"];
      signed int v589 = [v588 intValue];
      [v583 replaceObjectAtIndex:v589 withObject:v819[5]];

      v584 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v584, OS_LOG_TYPE_INFO))
      {
        v590 = [(id)v819[5] objectForKeyedSubscript:@"suggestionIdentifier"];
        v591 = [(id)v819[5] objectForKeyedSubscript:@"bundleIdentifier"];
        v592 = [(id)v819[5] objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)v885 = 138412802;
        v886 = v590;
        __int16 v887 = 2112;
        uint64_t v888 = (uint64_t)v591;
        __int16 v889 = 2112;
        v890 = v592;
        _os_log_impl((void *)&_mh_execute_header, v584, OS_LOG_TYPE_INFO, "Top Phone-sensed walking got suppressed from Recommended tab since it does not have location or photo and we have other unsuppressed walking suggestions. SuggestionID:%@, bundleID:%@, startDate:%@", v885, 0x20u);

        v575 = (void *)v568;
      }
      goto LABEL_395;
    }
  }
  else
  {
LABEL_395:
  }
  id v608 = [v583 copy];

  _Block_object_dispose(v800, 8);
  _Block_object_dispose(v802, 8);
  _Block_object_dispose(v804, 8);
  _Block_object_dispose(&v806, 8);
  _Block_object_dispose(&v810, 8);
  _Block_object_dispose(&v814, 8);
  _Block_object_dispose(&v818, 8);

  _Block_object_dispose(v824, 8);
  _Block_object_dispose(v826, 8);

  _Block_object_dispose(v828, 8);
  _Block_object_dispose(&v830, 8);

  _Block_object_dispose(&v836, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v842, 8);

  return v608;
}

uint64_t __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
  unsigned int v5 = [v4 isAfterDate:*(void *)(a1 + 32)];

  id v6 = [v3 objectForKeyedSubscript:@"bundleStartDate"];

  uint64_t v7 = v5 & [v6 isBeforeDate:*(void *)(a1 + 40)];
  return v7;
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1123(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"bundleSuperType"];
  unsigned int v5 = [v4 intValue];

  if (v5 == 3)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v6 = [v3 objectForKeyedSubscript:@"allContactIdentifiersSet"];
    id v66 = [v6 countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (!v66) {
      goto LABEL_17;
    }
    uint64_t v65 = *(void *)v68;
    *(void *)&long long v7 = 138413058;
    long long v63 = v7;
    float v64 = v6;
    while (1)
    {
      float v8 = 0;
      do
      {
        if (*(void *)v68 != v65) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void *)(*((void *)&v67 + 1) + 8 * (void)v8);
        double v10 = [v3 objectForKeyedSubscript:@"bundleStartDate" v63];
        float v11 = [*(id *)(a1 + 32) rankingScoreThresholdDict];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"contactHoldOffThreshold"];
        [v12 floatValue];
        float v14 = [v10 dateByAddingTimeInterval:v13];

        signed int v15 = [*(id *)(a1 + 40) objectForKey:v9];

        if (v15)
        {
          id v16 = [*(id *)(a1 + 40) objectForKey:v9];
          if ([v16 compare:v14] == (id)1)
          {
            uint64_t v17 = [v3 objectForKeyedSubscript:@"isWithinHoldOffPeriod"];
            unsigned int v18 = [v17 isEqual:&off_1002F73E8];

            if (!v18) {
              goto LABEL_13;
            }
            [v3 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
            [v3 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
            [v3 setObject:&off_1002F7418 forKeyedSubscript:@"isWithinHoldOffPeriod"];
            [v3 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
            uint64_t v19 = *(void **)(a1 + 48);
            uint64_t v20 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
            [v19 replaceObjectAtIndex:[v20 intValue] withObject:v3];

            id v16 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
              id v22 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
              uint64_t v23 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
              uint64_t v24 = [v3 objectForKeyedSubscript:@"bundleSubType"];
              *(_DWORD *)buf = v63;
              float v72 = v21;
              __int16 v73 = 2112;
              double v74 = v22;
              __int16 v75 = 2112;
              double v76 = v23;
              __int16 v77 = 2112;
              double v78 = v24;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Contact was suppressed from Recent tab since there is a visible suggestion with same contactID in the hold off period. SuggestionID:%@, BundleID:%@, startDate:%@,subType:%@", buf, 0x2Au);

              id v6 = v64;
            }
          }
        }
LABEL_13:
        unint64_t v25 = [v3 objectForKeyedSubscript:@"rankingCategory"];
        unsigned int v26 = [v25 intValue];

        if (v26 != 3)
        {
          id v27 = *(void **)(a1 + 40);
          uint64_t v28 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
          [v27 setObject:v28 forKey:v9];
        }
        float v8 = (char *)v8 + 1;
      }
      while (v66 != v8);
      id v66 = [v6 countByEnumeratingWithState:&v67 objects:v79 count:16];
      if (!v66)
      {
LABEL_17:

        break;
      }
    }
  }
  uint64_t v29 = (void *)phoneSensedWalkingVariants;
  uint64_t v30 = [v3 objectForKeyedSubscript:@"bundleSubType"];
  if ([v29 containsObject:v30])
  {
  }
  else
  {
    long long v31 = (void *)visitSubtypeVariants;
    unsigned int v32 = [v3 objectForKeyedSubscript:@"bundleSubType"];
    LODWORD(v31) = [v31 containsObject:v32];

    if (!v31) {
      goto LABEL_44;
    }
  }
  uint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  long long v34 = [v3 objectForKeyedSubscript:@"allPlaceNamesSet"];
  if ([v33 containsObject:v34])
  {
    unsigned int v35 = [v3 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
    [v35 floatValue];
    float v37 = v36;

    if (v37 == 0.0)
    {
      [v3 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v3 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
      [v3 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecentTab"];
      [v3 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      double v38 = *(void **)(a1 + 48);
      double v39 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
      [v38 replaceObjectAtIndex:(int)[v39 intValue] withObject:v3];

      float v40 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
LABEL_26:

        goto LABEL_42;
      }
      double v41 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
      double v42 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
      float v43 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
      double v44 = [v3 objectForKeyedSubscript:@"bundleSubType"];
      *(_DWORD *)buf = 138413058;
      float v72 = v41;
      __int16 v73 = 2112;
      double v74 = v42;
      __int16 v75 = 2112;
      double v76 = v43;
      __int16 v77 = 2112;
      double v78 = v44;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Phone-sensed walk or outing bundle was suppressed from Recent tab since it shares the same place(s) with other bundle(s) with higher goodness score from the same day. SuggestionID:%@, BundleID:%@, startDate:%@,subType:%@", buf, 0x2Au);

LABEL_25:
      goto LABEL_26;
    }
  }
  else
  {
  }
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= 1)
  {
    double v45 = (void *)phoneSensedWalkingVariants;
    double v46 = [v3 objectForKeyedSubscript:@"bundleSubType"];
    if ([v45 containsObject:v46])
    {
      v47 = [v3 objectForKeyedSubscript:@"allPlaceNamesSet"];
      if ([v47 isEqualToSet:emptyStringSet])
      {
        double v48 = [v3 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
        [v48 floatValue];
        float v50 = v49;

        if (v50 == 0.0)
        {
          [v3 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
          [v3 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
          [v3 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecentTab"];
          [v3 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
          id v51 = *(void **)(a1 + 48);
          uint64_t v52 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
          [v51 replaceObjectAtIndex:[v52 intValue] withObject:v3];

          float v40 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
            goto LABEL_26;
          }
          double v41 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
          double v42 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
          float v43 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v72 = v41;
          __int16 v73 = 2112;
          double v74 = v42;
          __int16 v75 = 2112;
          double v76 = v43;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Phone-sensed walk with no location was suppressed from Recent tab since there is other unsuppressed walking suggestion with higher goodness score. SuggestionID:%@, BundleID:%@, startDate:%@", buf, 0x20u);
          goto LABEL_25;
        }
        goto LABEL_36;
      }
    }
  }
LABEL_36:
  char v53 = (void *)phoneSensedWalkingVariants;
  double v54 = [v3 objectForKeyedSubscript:@"bundleSubType"];
  LODWORD(v53) = [v53 containsObject:v54];

  if (!v53) {
    goto LABEL_42;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  BOOL v55 = [v3 objectForKeyedSubscript:@"allPlaceNamesSet"];
  if (([v55 isEqualToSet:emptyStringSet] & 1) == 0)
  {

    goto LABEL_41;
  }
  BOOL v56 = [v3 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v56 floatValue];
  float v58 = v57;

  if (v58 > 0.0) {
LABEL_41:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
LABEL_42:
  float v59 = [v3 objectForKeyedSubscript:@"allPlaceNamesSet"];
  unsigned __int8 v60 = [v59 isEqualToSet:emptyStringSet];

  if ((v60 & 1) == 0)
  {
    float v61 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    float v62 = [v3 objectForKeyedSubscript:@"allPlaceNamesSet"];
    [v61 addObject:v62];
  }
LABEL_44:
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1129(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)phoneSensedWalkingVariants;
  unsigned int v5 = [v3 objectForKeyedSubscript:@"bundleSubType"];
  if (([v4 containsObject:v5] & 1) == 0) {
    goto LABEL_4;
  }
  id v6 = [v3 objectForKeyedSubscript:@"allPlaceNamesSet"];
  long long v7 = v6;
  if (v6 != (void *)emptyStringSet)
  {

LABEL_4:
    goto LABEL_5;
  }
  float v8 = [v3 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v8 floatValue];
  float v10 = v9;

  if (v10 == 0.0)
  {
    [v3 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v3 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
    [v3 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecentTab"];
    [v3 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    float v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
    [v11 replaceObjectAtIndex:(int)[v12 intValue] withObject:v3];

    float v13 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      float v14 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
      signed int v15 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
      id v16 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
      int v17 = 138412802;
      unsigned int v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Phone-sensed walking with no destination or photo got suppressed from Recent tab since richer walking bundle was found in the same day. SuggestionID:%@, BundleID:%@, startDate:%@", (uint8_t *)&v17, 0x20u);
    }
  }
LABEL_5:
}

uint64_t __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1130(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
  unsigned int v5 = [v4 isAfterDate:*(void *)(a1 + 32)];

  id v6 = [v3 objectForKeyedSubscript:@"bundleStartDate"];

  uint64_t v7 = v5 & [v6 isBeforeDate:*(void *)(a1 + 40)];
  return v7;
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectForKeyedSubscript:@"bundleSuperType"];
  if ([v3 intValue] != 8)
  {
    BOOL v4 = [v7 objectForKeyedSubscript:@"allStateOfMindIdentifiersSet"];
    unsigned __int8 v5 = [v4 isEqualToSet:emptyStringSet];

    if (v5) {
      goto LABEL_5;
    }
    id v6 = *(void **)(a1 + 32);
    id v3 = [v7 objectForKeyedSubscript:@"allStateOfMindIdentifiersSet"];
    [v6 addObjectsFromArray:v3];
  }

LABEL_5:
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  float v8 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
  if ([v7 containsObject:v8])
  {
  }
  else
  {
    float v9 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    float v10 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
    LODWORD(v9) = [v9 containsObject:v10];

    if (!v9) {
      goto LABEL_7;
    }
  }
  [v6 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
  [v6 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
  [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isDuplicated"];
  float v11 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
    float v13 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"rankingScore"];
    [(id)v3 floatValue];
    *(_DWORD *)buf = 138412802;
    float v166 = v12;
    __int16 v167 = 2112;
    float v168 = v13;
    __int16 v169 = 2048;
    double v170 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Bundle got rejected since it shares suggestionID(%@) or bundleID(%@) with the other bundle with higher ranking score: %.3f", buf, 0x20u);
  }
LABEL_7:
  signed int v15 = [v6 objectForKeyedSubscript:@"bundleInterfaceType"];
  if ([v15 intValue] == 11)
  {
    id v16 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v17 = [v16 intValue];

    if (v17 == 4) {
      goto LABEL_16;
    }
    unsigned int v18 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    __int16 v19 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    LODWORD(v18) = [v18 containsObject:v19];

    if (v18)
    {
      [v6 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
      [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isDuplicated"];
      uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        id v22 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(_DWORD *)buf = 138412546;
        float v166 = v21;
        __int16 v167 = 2112;
        float v168 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Evergreen bundle got rejected since it is the same type as the other evergreen bundle: suggestionID %@ bundleID %@", buf, 0x16u);
      }
    }
    else
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
    uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    signed int v15 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    [v23 addObject:v15];
  }

LABEL_16:
  uint64_t v24 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  unsigned int v25 = [v24 intValue];

  uint64_t v157 = a1;
  if (v25 == 802)
  {
    uint64_t v155 = a3;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    unsigned int v26 = [v6 objectForKeyedSubscript:@"allStateOfMindIdentifiersSet"];
    id v27 = [v26 countByEnumeratingWithState:&v160 objects:v164 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = &off_1002F70A0;
      CFStringRef v30 = @"visibilityCategoryForUI";
      CFStringRef v31 = @"rankingCategory";
      uint64_t v32 = *(void *)v161;
      uint64_t v159 = *(void *)v161;
      do
      {
        *(double *)&uint64_t v3 = 0.0;
        id v158 = v28;
        do
        {
          if (*(void *)v161 != v32) {
            objc_enumerationMutation(v26);
          }
          if ([*(id *)(a1 + 32) containsObject:*(void *)(*((void *)&v160 + 1) + 8 * v3)])
          {
            [v6 setObject:v29 forKeyedSubscript:v30];
            [v6 setObject:&off_1002F7400 forKeyedSubscript:v31];
            [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isDuplicated"];
            uint64_t v33 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              long long v34 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
              unsigned int v35 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
              [v6 objectForKeyedSubscript:@"bundleStartDate"];
              CFStringRef v36 = v31;
              float v37 = v26;
              CFStringRef v38 = v30;
              double v39 = v29;
              id v40 = v6;
              double v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 138412802;
              float v166 = v34;
              __int16 v167 = 2112;
              float v168 = v35;
              __int16 v169 = 2112;
              double v170 = v41;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Standalone emotion bundle got suppressed from both tabs since the emotion is contained in another bundle. SuggestionID:%@, bundleID:%@, startDate:%@", buf, 0x20u);

              id v6 = v40;
              uint64_t v29 = v39;
              CFStringRef v30 = v38;
              unsigned int v26 = v37;
              CFStringRef v31 = v36;

              id v28 = v158;
              a1 = v157;
            }

            uint64_t v32 = v159;
          }
          ++v3;
        }
        while (v28 != (id)v3);
        id v28 = [v26 countByEnumeratingWithState:&v160 objects:v164 count:16];
      }
      while (v28);
    }

    a3 = v155;
  }
  double v42 = [v6 objectForKeyedSubscript:@"bundleSuperType"];
  if ([v42 intValue] != 8) {
    goto LABEL_32;
  }
  float v43 = [v6 objectForKeyedSubscript:@"rankingCategory"];
  if ([v43 isEqual:&off_1002F7400])
  {

LABEL_32:
    goto LABEL_37;
  }
  double v44 = [v6 objectForKeyedSubscript:@"stateOfMindLoggedIn3pApp"];
  if ([v44 BOOLValue])
  {
  }
  else
  {
    *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"stateOfMindLoggedInJournalApp"];
    unsigned int v45 = [(id)v3 BOOLValue];

    if (!v45) {
      goto LABEL_37;
    }
  }
  [v6 setObject:&off_1002F7400 forKeyedSubscript:@"visibilityCategoryForUI"];
  [v6 setObject:&off_1002F7190 forKeyedSubscript:@"rankingCategory"];
LABEL_37:
  double v46 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  if ([v46 intValue] == 802)
  {
    v47 = [v6 objectForKeyedSubscript:@"rankingCategory"];
    unsigned __int8 v48 = [v47 isEqual:&off_1002F7400];

    if ((v48 & 1) == 0)
    {
      [v6 setObject:&off_1002F7400 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:&off_1002F7190 forKeyedSubscript:@"rankingCategory"];
    }
  }
  else
  {
  }
  float v49 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];
  if ([v49 intValue] == 1)
  {
  }
  else
  {
    float v50 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v51 = [v50 intValue];

    if (v51 != 2) {
      goto LABEL_148;
    }
  }
  uint64_t v52 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  if ([v52 intValue] == 202)
  {
    int v53 = *(unsigned __int8 *)(v157 + 176);

    if (!v53)
    {
      [v6 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
      [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)buf = 138412802;
        float v166 = v55;
        __int16 v167 = 2112;
        float v168 = v56;
        __int16 v169 = 2112;
        double v170 = *(double *)&v3;
        float v57 = "Weekly summary bundle got suppressed from Recommended tab since workout routine with the same workout type"
              "s exists. SuggestionID:%@, bundleID:%@, startDate:%@";
LABEL_131:
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, v57, buf, 0x20u);

        goto LABEL_132;
      }
      goto LABEL_132;
    }
  }
  else
  {
  }
  if (*(unsigned char *)(v157 + 176))
  {
    float v58 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    if ([v58 intValue] == 201)
    {
      float v59 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
      uint64_t v3 = v157;
      if ([v59 isAfterDate:*(void *)(v157 + 40)])
      {
        unsigned __int8 v60 = [v6 objectForKeyedSubscript:@"bundleEndDate"];
        *(double *)&uint64_t v3 = COERCE_DOUBLE([v60 isBeforeDate:*(void *)(v157 + 48)]);

        if (v3)
        {
          float v61 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
          unsigned int v62 = [v61 BOOLValue];

          if (v62) {
            long long v63 = &off_1002F70A0;
          }
          else {
            long long v63 = &off_1002F7400;
          }
          if (v62) {
            float v64 = &off_1002F7400;
          }
          else {
            float v64 = &off_1002F7190;
          }
          [v6 setObject:v63 forKeyedSubscript:@"visibilityCategoryForUI"];
          [v6 setObject:v64 forKeyedSubscript:@"rankingCategory"];
          [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
          [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
          double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
            goto LABEL_132;
          }
          BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
          BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
          *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v166 = v55;
          __int16 v167 = 2112;
          float v168 = v56;
          __int16 v169 = 2112;
          double v170 = *(double *)&v3;
          float v57 = "Workout bundle got suppressed from Recommended tab since weekly workout summary is shown on Recommended "
                "tab. SuggestionID:%@, bundleID:%@, startDate:%@";
          goto LABEL_131;
        }
        goto LABEL_63;
      }
    }
  }
LABEL_63:
  uint64_t v65 = (void *)workoutSubtypeVariants;
  id v66 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  if (![v65 containsObject:v66])
  {
LABEL_75:

    goto LABEL_76;
  }
  long long v67 = *(void **)(*(void *)(*(void *)(v157 + 96) + 8) + 40);
  long long v68 = [v6 objectForKeyedSubscript:@"workoutTypesSet"];
  if (([v67 containsObject:v68] & 1) == 0)
  {

    goto LABEL_75;
  }
  long long v69 = [v6 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v69 floatValue];
  float v71 = v70;

  if (v71 == 0.0)
  {
    float v72 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
    unsigned int v73 = [v72 BOOLValue];

    if (v73) {
      double v74 = &off_1002F70A0;
    }
    else {
      double v74 = &off_1002F7400;
    }
    if (v73) {
      __int16 v75 = &off_1002F7400;
    }
    else {
      __int16 v75 = &off_1002F7190;
    }
    [v6 setObject:v74 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v6 setObject:v75 forKeyedSubscript:@"rankingCategory"];
    [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
    [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
      goto LABEL_132;
    }
    BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
    BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
    *(_DWORD *)buf = 138412802;
    float v166 = v55;
    __int16 v167 = 2112;
    float v168 = v56;
    __int16 v169 = 2112;
    double v170 = *(double *)&v3;
    float v57 = "Workout bundle got suppressed from Recommended tab since it has the same workout type(s) with the other bundle"
          " with higher ranking score. SuggestionID:%@, bundleID:%@, startDate:%@";
    goto LABEL_131;
  }
LABEL_76:
  double v76 = (void *)visitSubtypeVariants;
  __int16 v77 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  unsigned __int8 v78 = [v76 containsObject:v77];
  if ((v78 & 1) == 0)
  {
    double v76 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    if ([v76 intValue] != 105) {
      goto LABEL_91;
    }
  }
  float v79 = *(void **)(*(void *)(*(void *)(v157 + 104) + 8) + 40);
  *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"allPlaceNamesSet"];
  if (![v79 containsObject:v3])
  {

    if (v78)
    {
LABEL_92:

      goto LABEL_93;
    }
LABEL_91:

    goto LABEL_92;
  }
  double v80 = [v6 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v80 floatValue];
  float v82 = v81;

  if ((v78 & 1) == 0) {
  if (v82 == 0.0)
  }
  {
    id v83 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
    unsigned int v84 = [v83 BOOLValue];

    if (v84) {
      double v85 = &off_1002F70A0;
    }
    else {
      double v85 = &off_1002F7400;
    }
    if (v84) {
      uint64_t v86 = &off_1002F7400;
    }
    else {
      uint64_t v86 = &off_1002F7190;
    }
    [v6 setObject:v85 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v6 setObject:v86 forKeyedSubscript:@"rankingCategory"];
    [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
    [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
      goto LABEL_132;
    }
    BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
    BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
    *(_DWORD *)buf = 138412802;
    float v166 = v55;
    __int16 v167 = 2112;
    float v168 = v56;
    __int16 v169 = 2112;
    double v170 = *(double *)&v3;
    float v57 = "Visit bundle got suppressed from Recommended tab since it shared the same place(s) with more highly ranked bun"
          "dle. SuggestionID:%@, bundleID:%@, startDate:%@";
    goto LABEL_131;
  }
LABEL_93:
  v87 = [v6 objectForKeyedSubscript:@"bundleSuperType"];
  if ([v87 intValue] == 3)
  {
    long long v88 = *(void **)(*(void *)(*(void *)(v157 + 112) + 8) + 40);
    long long v89 = [v6 objectForKeyedSubscript:@"allContactIdentifiersSet"];
    LODWORD(v88) = [v88 containsObject:v89];

    if (v88)
    {
      double v90 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
      if ([v90 BOOLValue])
      {

        float v91 = &off_1002F7400;
        float v92 = &off_1002F70A0;
      }
      else
      {
        float v113 = [v6 objectForKeyedSubscript:@"bundleSubType"];
        unsigned int v114 = [v113 intValue];

        if (v114 == 303) {
          float v92 = &off_1002F70A0;
        }
        else {
          float v92 = &off_1002F7400;
        }
        if (v114 == 303) {
          float v91 = &off_1002F7400;
        }
        else {
          float v91 = &off_1002F7190;
        }
      }
      [v6 setObject:v92 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:v91 forKeyedSubscript:@"rankingCategory"];
      [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
      [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
        goto LABEL_132;
      }
      BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
      BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
      *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
      *(_DWORD *)buf = 138412802;
      float v166 = v55;
      __int16 v167 = 2112;
      float v168 = v56;
      __int16 v169 = 2112;
      double v170 = *(double *)&v3;
      float v57 = "Contact bundle got suppressed from Recommended tab since it shares the same contact id(s) with the other bun"
            "dle with higher ranking score. SuggestionID:%@, bundleID:%@, startDate:%@";
      goto LABEL_131;
    }
  }
  else
  {
  }
  id v93 = (void *)phoneSensedWalkingVariants;
  float v94 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  LODWORD(v93) = [v93 containsObject:v94];

  if (!v93)
  {
    float v109 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    unsigned int v110 = [v109 intValue];

    if (v110 == 401)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v157 + 144) + 8) + 24))
      {
        [v6 setObject:&off_1002F7400 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:&off_1002F7190 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
          BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
          *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v166 = v55;
          __int16 v167 = 2112;
          float v168 = v56;
          __int16 v169 = 2112;
          double v170 = *(double *)&v3;
          float v57 = "Daily SongOnrepeat bundle was suppressed from Recommended tab since the same type already exists in Reco"
                "mmended tab. SuggestionID:%@, bundleID:%@, startDate:%@";
          goto LABEL_131;
        }
LABEL_132:

        goto LABEL_149;
      }
      ++*(void *)(*(void *)(*(void *)(v157 + 128) + 8) + 24);
      float v124 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v6 setObject:v124 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

      uint64_t v125 = *(void *)(v157 + 144);
      goto LABEL_177;
    }
    double v111 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    unsigned int v112 = [v111 intValue];

    if (v112 == 402)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v157 + 152) + 8) + 24))
      {
        [v6 setObject:&off_1002F7400 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:&off_1002F7190 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
          BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
          *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v166 = v55;
          __int16 v167 = 2112;
          float v168 = v56;
          __int16 v169 = 2112;
          double v170 = *(double *)&v3;
          float v57 = "Daily PlayedSong bundle was suppressed from Recommended tab since the same type already exists in Recomm"
                "ended tab. SuggestionID:%@, bundleID:%@, startDate:%@";
          goto LABEL_131;
        }
        goto LABEL_132;
      }
      ++*(void *)(*(void *)(*(void *)(v157 + 128) + 8) + 24);
      float v151 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v6 setObject:v151 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

      uint64_t v125 = *(void *)(v157 + 152);
      goto LABEL_177;
    }
    float v115 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    unsigned int v116 = [v115 intValue];

    if (v116 == 403)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v157 + 160) + 8) + 24))
      {
        [v6 setObject:&off_1002F7400 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:&off_1002F7190 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
          goto LABEL_132;
        }
        BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)buf = 138412802;
        float v166 = v55;
        __int16 v167 = 2112;
        float v168 = v56;
        __int16 v169 = 2112;
        double v170 = *(double *)&v3;
        float v57 = "Daily PlayedPodCast bundle was suppressed from Recommended tab since the same type already exists in Recom"
              "mended tab. SuggestionID:%@, bundleID:%@, startDate:%@";
        goto LABEL_131;
      }
      ++*(void *)(*(void *)(*(void *)(v157 + 128) + 8) + 24);
      float v154 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v6 setObject:v154 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

      uint64_t v125 = *(void *)(v157 + 160);
LABEL_177:
      *(unsigned char *)(*(void *)(v125 + 8) + 24) = 1;
      goto LABEL_149;
    }
    double v126 = [v6 objectForKeyedSubscript:@"bundleInterfaceType"];
    unsigned int v127 = [v126 intValue];

    if (v127 != 11)
    {
      float v152 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG)) {
        __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3_cold_1(v157, v6);
      }

      ++*(void *)(*(void *)(*(void *)(v157 + 128) + 8) + 24);
      float v153 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v6 setObject:v153 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

      ++*(void *)(*(void *)(*(void *)(v157 + 168) + 8) + 24);
      goto LABEL_149;
    }
LABEL_148:
    [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    goto LABEL_149;
  }
  float v95 = *(void **)(*(void *)(*(void *)(v157 + 104) + 8) + 40);
  long long v96 = [v6 objectForKeyedSubscript:@"allPlaceNamesSet"];
  if (![v95 containsObject:v96])
  {
LABEL_109:

    goto LABEL_110;
  }
  float v97 = [v6 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v97 floatValue];
  float v99 = v98;

  if (v99 == 0.0)
  {
    float v100 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
    unsigned int v101 = [v100 BOOLValue];

    if (v101) {
      double v102 = &off_1002F70A0;
    }
    else {
      double v102 = &off_1002F7400;
    }
    if (v101) {
      float v103 = &off_1002F7400;
    }
    else {
      float v103 = &off_1002F7190;
    }
    [v6 setObject:v102 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v6 setObject:v103 forKeyedSubscript:@"rankingCategory"];
    [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
    [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    long long v96 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      float v104 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
      uint64_t v105 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
      *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
      *(_DWORD *)buf = 138412802;
      float v166 = v104;
      __int16 v167 = 2112;
      float v168 = v105;
      __int16 v169 = 2112;
      double v170 = *(double *)&v3;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "Phone sensed bundle got suppressed from Recommended tab since it shared the same place(s) with more highly ranked bundle and it does not have any photo. SuggestionID:%@, bundleID:%@, startDate:%@", buf, 0x20u);
    }
    goto LABEL_109;
  }
LABEL_110:
  if (*(void *)(*(void *)(*(void *)(v157 + 120) + 8) + 24))
  {
    float v106 = [v6 objectForKeyedSubscript:@"allPlaceNamesSet"];
    float v107 = v106;
    if (v106 == (void *)emptyStringSet)
    {
      unsigned int v117 = [v6 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
      [v117 floatValue];
      float v119 = v118;

      if (v119 == 0.0)
      {
        v120 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
        unsigned int v121 = [v120 BOOLValue];

        if (v121) {
          float v122 = &off_1002F70A0;
        }
        else {
          float v122 = &off_1002F7400;
        }
        if (v121) {
          v123 = &off_1002F7400;
        }
        else {
          v123 = &off_1002F7190;
        }
        [v6 setObject:v122 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:v123 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1002F7418 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
        [v6 setObject:&off_1002F7430 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        double v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
          goto LABEL_132;
        }
        BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)buf = 138412802;
        float v166 = v55;
        __int16 v167 = 2112;
        float v168 = v56;
        __int16 v169 = 2112;
        double v170 = *(double *)&v3;
        float v57 = "Phone-sensed walking bundle got suppressed from Recommended tab since it has the same workout type(s) with"
              " the other bundle with higher ranking score. SuggestionID:%@, bundleID:%@, startDate:%@";
        goto LABEL_131;
      }
    }
    else
    {
    }
  }
  ++*(void *)(*(void *)(*(void *)(v157 + 120) + 8) + 24);
  ++*(void *)(*(void *)(*(void *)(v157 + 128) + 8) + 24);
  v108 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  [v6 setObject:v108 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

  if (![*(id *)(*(void *)(*(void *)(v157 + 136) + 8) + 40) count]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(v157 + 136) + 8) + 40), a2);
  }
LABEL_149:
  [*(id *)(v157 + 56) setObject:v6 atIndexedSubscript:a3];
  float v128 = *(void **)(*(void *)(*(void *)(v157 + 64) + 8) + 40);
  float v129 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
  [v128 addObject:v129];

  float v130 = *(void **)(*(void *)(*(void *)(v157 + 72) + 8) + 40);
  float v131 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
  [v130 addObject:v131];

  float v132 = (void *)visitSubtypeVariants;
  float v133 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  unsigned __int8 v134 = [v132 containsObject:v133];
  if (v134)
  {
    float v135 = v6;
    int v136 = 0;
  }
  else
  {
    float v132 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    if ([v132 intValue] == 105)
    {
      float v135 = v6;
      int v136 = 0;
    }
    else
    {
      float v141 = (void *)phoneSensedWalkingVariants;
      *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleSubType"];
      if (([v141 containsObject:v3] & 1) == 0)
      {

        uint64_t v139 = v157;
        goto LABEL_162;
      }
      float v135 = v6;
      int v136 = 1;
    }
  }
  float v137 = [v135 objectForKeyedSubscript:@"allPlaceNamesSet"];
  unsigned __int8 v138 = [v137 isEqualToSet:emptyStringSet];

  if (v136) {
  uint64_t v139 = v157;
  }
  if ((v134 & 1) == 0) {

  }
  id v6 = v135;
  if ((v138 & 1) == 0)
  {
    float v140 = *(void **)(*(void *)(*(void *)(v157 + 104) + 8) + 40);
    float v133 = [v135 objectForKeyedSubscript:@"allPlaceNamesSet"];
    [v140 addObject:v133];
LABEL_162:
  }
  float v142 = (void *)workoutSubtypeVariants;
  float v143 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  if ([v142 containsObject:v143])
  {
    float v144 = [v6 objectForKeyedSubscript:@"workoutTypesSet"];
    unsigned __int8 v145 = [v144 isEqualToSet:emptyStringSet];

    if (v145) {
      goto LABEL_167;
    }
    float v146 = *(void **)(*(void *)(*(void *)(v139 + 96) + 8) + 40);
    float v143 = [v6 objectForKeyedSubscript:@"workoutTypesSet"];
    [v146 addObject:v143];
  }

LABEL_167:
  float v147 = [v6 objectForKeyedSubscript:@"bundleSuperType"];
  if ([v147 intValue] != 3)
  {
LABEL_170:

    goto LABEL_171;
  }
  float v148 = [v6 objectForKeyedSubscript:@"allContactIdentifiersSet"];
  unsigned __int8 v149 = [v148 isEqualToSet:emptyStringSet];

  if ((v149 & 1) == 0)
  {
    float v150 = *(void **)(*(void *)(*(void *)(v139 + 112) + 8) + 40);
    float v147 = [v6 objectForKeyedSubscript:@"allContactIdentifiersSet"];
    [v150 addObject:v147];
    goto LABEL_170;
  }
LABEL_171:
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1134(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:@"bundleInterfaceType"];
  if ([v6 intValue] == 11)
  {
    id v7 = [v5 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v8 = [v7 intValue];

    if (v8 != 4 && ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > *(void *)(a1 + 48))
    {
      [v5 setObject:&off_1002F70A0 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v5 setObject:&off_1002F7400 forKeyedSubscript:@"rankingCategory"];
      float v9 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Evergreen bundle got rejected because allowable evergreen count is reached: %@", (uint8_t *)&v10, 0xCu);
      }

      [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
    }
  }
  else
  {
  }
}

- (void)_mergeScoresToBundles:(id)a3 usingScore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 count];
  if (v9 != [v8 count])
  {
    int v10 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking _mergeScoresToBundles:usingScore:](v7, v8, v10);
    }

    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MOEventBundleRanking.m" lineNumber:2531 description:@"Mismatch between bundle count %lu and score array count %lu (in %s:%d)", objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), @"-[MOEventBundleRanking _mergeScoresToBundles:usingScore:]", 2531];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  id v38 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v38)
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v12 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v39 = 0;
    uint64_t v37 = *(void *)v41;
    id v30 = v8;
    do
    {
      float v13 = 0;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        float v14 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v13);
        signed int v15 = [v8 objectAtIndexedSubscript:(char *)v13 + v39];
        id v16 = [v15 mutableCopy];

        unsigned int v17 = [v16 objectForKeyedSubscript:@"bundleInterfaceType"];
        unsigned int v18 = [v17 intValue];

        if (v18 == 11)
        {
          ++v12;
        }
        else
        {
          id v22 = [v16 objectForKeyedSubscript:@"visibilityCategoryForUI"];
          unsigned int v23 = [v22 intValue];

          switch(v23)
          {
            case 1u:
              ++v32;
              break;
            case 2u:
              ++v33;
              break;
            case 3u:
              ++v34;
              break;
            case 4u:
              ++v35;
              break;
            default:
              break;
          }
        }
        [v16 removeObjectForKey:@"bundleInterfaceType"];
        [v16 removeObjectForKey:@"bundleSubType"];
        [v16 removeObjectForKey:@"bundleSuperType"];
        [v16 removeObjectForKey:@"elapsedDaysFromBundleEndDate"];
        [v16 removeObjectForKey:@"rankingDictionaryIndex"];
        [v16 removeObjectForKey:@"bundleIdentifier"];
        [v16 removeObjectForKey:@"suggestionIdentifier"];
        [v16 removeObjectForKey:@"allPlaceNamesSet"];
        [v16 removeObjectForKey:@"workoutTypesSet"];
        [v16 removeObjectForKey:@"allContactIdentifiersSet"];
        [v16 removeObjectForKey:@"allStateOfMindIdentifiersSet"];
        [v16 removeObjectForKey:@"numAnomalyEventsNormalized"];
        [v16 removeObjectForKey:@"numPhotoAssetsResourcesNormalized"];
        [v16 removeObjectForKey:@"numMediaAssetsResourcesNormalized"];
        [v16 removeObjectForKey:@"isCoarseGranularitySummaryKey"];
        [v16 removeObjectForKey:@"bundleStartDate"];
        [v16 removeObjectForKey:@"bundleEndDate"];
        [v16 removeObjectForKey:@"stateOfMindLoggedIn3pApp"];
        [v16 removeObjectForKey:@"stateOfMindLoggedInJournalApp"];
        __int16 v19 = [(MOEventBundleRanking *)self _checkAndUpdateNumericLimits:v16];
        uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = [v14 bundleIdentifier];
          [v14 suggestionID];
          uint64_t v31 = v12;
          unsigned int v26 = v25 = self;
          *(_DWORD *)buf = 134218498;
          unsigned int v45 = (char *)v13 + v39;
          __int16 v46 = 2112;
          v47 = v24;
          __int16 v48 = 2112;
          float v49 = v26;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Bundle index %lu, BundleID %@, suggestionID %@", buf, 0x20u);

          self = v25;
          uint64_t v12 = v31;

          id v8 = v30;
        }

        __int16 v21 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v45 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "RankingDict %@", buf, 0xCu);
        }

        [v14 setRankingDictionary:v19];
        float v13 = (char *)v13 + 1;
      }
      while (v38 != v13);
      id v27 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
      id v38 = v27;
      v39 += (uint64_t)v13;
    }
    while (v27);
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v12 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }

  id v28 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = (char *)[obj count];
    *(_DWORD *)buf = 134219264;
    unsigned int v45 = v29;
    __int16 v46 = 2048;
    v47 = v32;
    __int16 v48 = 2048;
    float v49 = v33;
    __int16 v50 = 2048;
    uint64_t v51 = v34;
    __int16 v52 = 2048;
    uint64_t v53 = v35;
    __int16 v54 = 2048;
    uint64_t v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Added ranking dictionaries to bundle array: Num totalBundles=%lu, NumSensedBundlesEligibleForBothTabs=%lu,NumSensedBundlesRecommendedOnly=%lu, NumSensedBundlesRecentOnly=%lu, numSensedBundlesRejected=%lu, numEvergreenBundles=%lu  ", buf, 0x3Eu);
  }
}

- (void)_submitEventBundleRankingAnalytics:(id)a3 withRankingInput:(id)a4 andSubmissionDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v294 = v9;
  id v12 = [v9 count];
  if (v12 != [v10 count])
  {
    float v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.5(v13);
    }

    float v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MOEventBundleRanking.m" lineNumber:2596 description:@"Mismatch between score dict and input dict sizes (in %s:%d)", @"-[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:]", 2596];
  }
  signed int v15 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v314[0] = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%lu bundle rankings and inputs are set to be submitted to CoreAnalytics.", buf, 0xCu);
  }

  double v274 = +[NSCalendar currentCalendar];
  BOOL v275 = v11;
  id v16 = [v274 components:764 fromDate:v11];
  id v282 = [v16 year];
  id v284 = [v16 month];
  id v286 = [v16 day];
  id v288 = [v16 hour];
  v273 = v16;
  id v292 = [v16 minute];
  unsigned int v17 = [(MOConfigurationManagerBase *)self->_configurationManager getTrialExperimentIdentifiers];
  long long v308 = 0u;
  long long v309 = 0u;
  long long v310 = 0u;
  long long v311 = 0u;
  id obj = v10;
  id v295 = [obj countByEnumeratingWithState:&v308 objects:v312 count:16];
  if (v295)
  {
    uint64_t v297 = 0;
    uint64_t v280 = *(void *)v309;
    do
    {
      unsigned int v18 = 0;
      do
      {
        if (*(void *)v309 != v280) {
          objc_enumerationMutation(obj);
        }
        __int16 v19 = *(void **)(*((void *)&v308 + 1) + 8 * (void)v18);
        __int16 v21 = [v294 objectAtIndexedSubscript:(char *)v18 + v297];
        id v22 = objc_opt_new();
        unsigned int v23 = +[NSNumber numberWithInteger:v282];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"submissionTimeYear" andValue:v23];

        uint64_t v24 = +[NSNumber numberWithInteger:v284];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"submissionTimeMonth" andValue:v24];

        unsigned int v25 = +[NSNumber numberWithInteger:v286];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"submissionTimeDay" andValue:v25];

        unsigned int v26 = +[NSNumber numberWithInteger:v288];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"submissionTimeHour" andValue:v26];

        id v27 = +[NSNumber numberWithInteger:v292];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"submissionTimeMinute" andValue:v27];

        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"scalingFactorForAnalytics" andValue:&off_1002F9610];
        id v28 = [v19 bundleIdentifier];
        uint64_t v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 hash]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"bundleId" andValue:v29];

        id v30 = [v19 suggestionIdentifier];
        uint64_t v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 hash]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"suggestionId" andValue:v31];

        if (v17)
        {
          uint64_t v32 = [v17 experimentId];
          [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"trialExperimentId" andValue:v32];

          uint64_t v33 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 deploymentId]);
          uint64_t v34 = [v33 stringValue];
          [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"trialDeploymentId" andValue:v34];

          uint64_t v35 = [v17 treatmentId];
          [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"trialTreatmentId" andValue:v35];
        }
        CFStringRef v36 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 suggestionIsDeleted]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isDeleted" andValue:v36];

        uint64_t v37 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 suggestionIsSelected]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isSelected" andValue:v37];

        id v38 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 suggestionQuickAddEntry]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"quickAddEntry" andValue:v38];

        [v19 viewCountNormalized];
        *(float *)&double v40 = v39 * 10000.0;
        long long v41 = +[NSNumber numberWithFloat:v40];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"viewCountNormalized" andValue:v41];

        long long v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 journalEntryIsCreated]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"journalEntryIsCreated" andValue:v42];

        long long v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 journalEntryIsEdited]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"journalEntryIsEdited" andValue:v43];

        double v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 journalEntryIsCancelled]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"journalEntryIsCancelled" andValue:v44];

        unsigned int v45 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 journalEntryIsDeleted]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"journalEntryIsDeleted" andValue:v45];

        [v19 bundleRecencyDaysElapsed];
        __int16 v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"bundleRecencyDaysElapsed" andValue:v46];

        v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 bundleInterfaceType]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"bundleInterfaceType" andValue:v47];

        __int16 v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 bundleSubType]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"bundleSubType" andValue:v48];

        float v49 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 bundleSuperType]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"bundleSuperType" andValue:v49];

        [v19 numAnomalyEventsNormalized];
        *(float *)&double v51 = v50 * 10000.0;
        __int16 v52 = +[NSNumber numberWithFloat:v51];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numAnomalyEventsNormalized" andValue:v52];

        [v19 numTrendEventsNormalized];
        *(float *)&double v54 = v53 * 10000.0;
        uint64_t v55 = +[NSNumber numberWithFloat:v54];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numTrendEventsNormalized" andValue:v55];

        [v19 numRoutineEventsNormalized];
        *(float *)&double v57 = v56 * 10000.0;
        float v58 = +[NSNumber numberWithFloat:v57];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numRoutineEventsNormalized" andValue:v58];

        [v19 numStateOfMindEventsNormalized];
        *(float *)&double v60 = v59 * 10000.0;
        float v61 = +[NSNumber numberWithFloat:v60];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numStateOfMindEventsNormalized" andValue:v61];

        [v19 numUniqueResourceTypesNormalized];
        *(float *)&double v63 = v62 * 10000.0;
        float v64 = +[NSNumber numberWithFloat:v63];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numUniqueResourceTypesNormalized" andValue:v64];

        [v19 numValueTypeResourcesNormalized];
        *(float *)&double v66 = v65 * 10000.0;
        long long v67 = +[NSNumber numberWithFloat:v66];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numValueTypeResourcesNormalized" andValue:v67];

        [v19 numPhotoAssetsResourcesNormalized];
        *(float *)&double v69 = v68 * 10000.0;
        float v70 = +[NSNumber numberWithFloat:v69];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numPhotoAssetsResourcesNormalized" andValue:v70];

        [v19 numMediaTypeResourcesNormalized];
        *(float *)&double v72 = v71 * 10000.0;
        unsigned int v73 = +[NSNumber numberWithFloat:v72];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numMediaTypeResourcesNormalized" andValue:v73];

        [v19 numWebLinkTypeResourcesNormalized];
        *(float *)&double v75 = v74 * 10000.0;
        double v76 = +[NSNumber numberWithFloat:v75];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numWebLinkTypeResourcesNormalized" andValue:v76];

        [v19 numInterfaceTagTypeResourcesNormalized];
        *(float *)&double v78 = v77 * 10000.0;
        float v79 = +[NSNumber numberWithFloat:v78];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numInterfaceTagTypeResourcesNormalized" andValue:v79];

        [v19 numMapItemTypeResourcesNormalized];
        *(float *)&double v81 = v80 * 10000.0;
        float v82 = +[NSNumber numberWithFloat:v81];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numMapItemTypeResourcesNormalized" andValue:v82];

        [v19 numAppTypeResourcesNormalized];
        *(float *)&double v84 = v83 * 10000.0;
        double v85 = +[NSNumber numberWithFloat:v84];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numAppTypeResourcesNormalized" andValue:v85];

        [v19 numWorkoutRingAssetsNormalized];
        *(float *)&double v87 = v86 * 10000.0;
        long long v88 = +[NSNumber numberWithFloat:v87];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numWorkoutRingAssetsNormalized" andValue:v88];

        [v19 numWorkoutIconAssetsNormalized];
        *(float *)&double v90 = v89 * 10000.0;
        float v91 = +[NSNumber numberWithFloat:v90];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numWorkoutIconAssetsNormalized" andValue:v91];

        [v19 numWorkoutRouteMapAssetsNormalized];
        *(float *)&double v93 = v92 * 10000.0;
        float v94 = +[NSNumber numberWithFloat:v93];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"numWorkoutRouteMapAssetsNormalized" andValue:v94];

        [v19 isBundleActionSpecific];
        *(float *)&double v96 = v95 * 10000.0;
        float v97 = +[NSNumber numberWithFloat:v96];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isBundleActionSpecificGranular" andValue:v97];

        [v19 isBundlePlaceTypeSpecific];
        *(float *)&double v99 = v98 * 10000.0;
        float v100 = +[NSNumber numberWithFloat:v99];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isBundlePlaceTypeSpecificGranular" andValue:v100];

        [v19 isBundleTimeTagSpecific];
        *(float *)&double v102 = v101 * 10000.0;
        float v103 = +[NSNumber numberWithFloat:v102];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isBundleTimeTagSpecificGranular" andValue:v103];

        [v19 labelSpecificityNormalized];
        *(float *)&double v105 = v104 * 10000.0;
        float v106 = +[NSNumber numberWithFloat:v105];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"labelSpecificityNormalized" andValue:v106];

        [v19 labelQualityScore];
        *(float *)&double v108 = v107 * 10000.0;
        float v109 = +[NSNumber numberWithFloat:v108];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"labelQualityScore" andValue:v109];

        [v19 peopleDensityWeightedAverageNormalized];
        *(float *)&double v111 = v110 * 10000.0;
        unsigned int v112 = +[NSNumber numberWithFloat:v111];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"pDensityWeightedAverageNormalized" andValue:v112];

        float v113 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 isWorkVisit]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isWorkVisit" andValue:v113];

        unsigned int v114 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 isShortVisit]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"isShortVisit" andValue:v114];

        float v115 = [v21 objectForKeyedSubscript:@"richnessScore"];
        [v115 floatValue];
        *(float *)&double v117 = v116 * 10000.0;
        float v118 = +[NSNumber numberWithFloat:v117];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"richnessScore" andValue:v118];

        float v119 = [v21 objectForKeyedSubscript:@"distinctnessScore"];
        [v119 floatValue];
        *(float *)&double v121 = v120 * 10000.0;
        float v122 = +[NSNumber numberWithFloat:v121];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"distinctnessScore" andValue:v122];

        v123 = [v21 objectForKeyedSubscript:@"heuristicsScore"];
        [v123 floatValue];
        *(float *)&double v125 = v124 * 10000.0;
        double v126 = +[NSNumber numberWithFloat:v125];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"heuristicsScore" andValue:v126];

        unsigned int v127 = [v21 objectForKeyedSubscript:@"qualityScore"];
        [v127 floatValue];
        *(float *)&double v129 = v128 * 10000.0;
        float v130 = +[NSNumber numberWithFloat:v129];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"qualityScore" andValue:v130];

        float v131 = [v21 objectForKeyedSubscript:@"viewCountBasedScoreAdjustment"];
        [v131 floatValue];
        *(float *)&double v133 = v132 * 10000.0;
        unsigned __int8 v134 = +[NSNumber numberWithFloat:v133];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"viewCountBasedScoreAdjustment" andValue:v134];

        float v135 = [v21 objectForKeyedSubscript:@"baseScore"];
        [v135 floatValue];
        *(float *)&double v137 = v136 * 10000.0;
        unsigned __int8 v138 = +[NSNumber numberWithFloat:v137];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"baseScore" andValue:v138];

        uint64_t v139 = [v21 objectForKeyedSubscript:@"engagementScore"];
        [v139 floatValue];
        *(float *)&double v141 = v140 * 10000.0;
        float v142 = +[NSNumber numberWithFloat:v141];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"engagementScore" andValue:v142];

        float v143 = [v21 objectForKeyedSubscript:@"diversityCoefficient"];
        [v143 floatValue];
        *(float *)&double v145 = v144 * 10000.0;
        float v146 = +[NSNumber numberWithFloat:v145];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"diversityCoefficient" andValue:v146];

        float v147 = [v21 objectForKeyedSubscript:@"decayFactor"];
        [v147 floatValue];
        *(float *)&double v149 = v148 * 10000.0;
        float v150 = +[NSNumber numberWithFloat:v149];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"decayFactor" andValue:v150];

        float v151 = [v21 objectForKeyedSubscript:@"rankingScore"];
        [v151 floatValue];
        *(float *)&double v153 = v152 * 10000.0;
        float v154 = +[NSNumber numberWithFloat:v153];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"rankingScore" andValue:v154];

        uint64_t v155 = [v21 objectForKeyedSubscript:@"bundleGoodnessScore"];
        [v155 floatValue];
        *(float *)&double v157 = v156 * 10000.0;
        id v158 = +[NSNumber numberWithFloat:v157];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"bundleGoodnessScore" andValue:v158];

        uint64_t v159 = [v21 objectForKeyedSubscript:@"rankingCategory"];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"rankingCategory" andValue:v159];

        long long v160 = [v21 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"visibilityCategoryForUI" andValue:v160];

        long long v161 = [v21 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v22 withKey:@"ordinalRankInRecommendedTab" andValue:v161];

        if (v22)
        {
          float v303 = _NSConcreteStackBlock;
          uint64_t v304 = 3221225472;
          double v305 = __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke;
          v306 = &unk_1002CD5F8;
          float v307 = v22;
          AnalyticsSendEventLazy();
          long long v162 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.4(&v301, v302);
          }

          long long v163 = v307;
        }
        else
        {
          long long v163 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
            -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:](buf, v314, v163);
          }
        }

        unsigned int v18 = (char *)v18 + 1;
      }
      while (v295 != v18);
      id v295 = [obj countByEnumeratingWithState:&v308 objects:v312 count:16];
      v297 += (uint64_t)v18;
    }
    while (v295);
  }

  v164 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)float v300 = 0;
    _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_INFO, "Completed individual Ranking CoreAnalytics submission.", v300, 2u);
  }

  uint64_t v165 = objc_opt_new();
  float v166 = +[NSNumber numberWithInteger:v282];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"submissionTimeYear" andValue:v166];

  __int16 v167 = +[NSNumber numberWithInteger:v284];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"submissionTimeMonth" andValue:v167];

  float v168 = +[NSNumber numberWithInteger:v286];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"submissionTimeDay" andValue:v168];

  __int16 v169 = +[NSNumber numberWithInteger:v288];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"submissionTimeHour" andValue:v169];

  double v170 = +[NSNumber numberWithInteger:v292];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"submissionTimeMinute" andValue:v170];

  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"scalingFactorForAnalytics" andValue:&off_1002F9610];
  if (v17)
  {
    float v171 = [v17 experimentId];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"trialExperimentId" andValue:v171];

    float v172 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 deploymentId]);
    float v173 = [v172 stringValue];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"trialDeploymentId" andValue:v173];

    float v174 = [v17 treatmentId];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"trialTreatmentId" andValue:v174];
  }
  double v175 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v294 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"totalBundleCount" andValue:v175];

  v279 = +[NSSortDescriptor sortDescriptorWithKey:@"ordinalRankInRecommendedTab" ascending:1];
  double v277 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  v176 = [v294 sortedArrayUsingDescriptors:];
  float v177 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1002F92C0];
  float v178 = [v176 filteredArrayUsingPredicate:v177];

  float v179 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v178 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v165 withKey:@"recommendedSuggestionCount" andValue:v179];

  +[NSPredicate predicateWithFormat:@"%K == %lu", @"bundleInterfaceType", 11];
  v180 = double v281 = (void *)v165;

  v276 = [v294 filteredArrayUsingPredicate:v180];
  v181 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v276 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"evergreenBundleCount" andValue:v181];

  float v182 = +[NSPredicate predicateWithFormat:@"%K == %lu", @"bundleInterfaceType", 10];

  double v272 = [v294 filteredArrayUsingPredicate:v182];
  double v183 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v272 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"photoMemoryBundleCount" andValue:v183];

  float v184 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1002F92D8];

  float v185 = [v294 filteredArrayUsingPredicate:v184];
  double v186 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v185 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"suggestionCountInRecentTab" andValue:v186];

  float v187 = +[NSPredicate predicateWithFormat:@"%K <= 1", @"elapsedDaysFromBundleEndDate"];

  double v270 = [v185 filteredArrayUsingPredicate:v187];
  float v188 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v270 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"suggestionCountInRecenTabFromPast1Day" andValue:v188];

  v189 = +[NSPredicate predicateWithFormat:@"%K <= 3", @"elapsedDaysFromBundleEndDate"];

  double v269 = [v185 filteredArrayUsingPredicate:v189];
  double v190 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v269 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"suggestionCountInRecenTabFromPast3Days" andValue:v190];

  float v191 = v281;
  uint64_t v192 = +[NSPredicate predicateWithFormat:@"%K <= 7", @"elapsedDaysFromBundleEndDate"];

  double v271 = v185;
  double v268 = (void *)v192;
  double v267 = [v185 filteredArrayUsingPredicate:v192];
  float v193 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v267 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"suggestionCountInRecenTabFromPast7Days" andValue:v193];

  v287 = objc_opt_new();
  double v285 = objc_opt_new();
  v283 = objc_opt_new();
  uint64_t v194 = objc_opt_new();
  double v195 = objc_opt_new();
  float v196 = objc_opt_new();
  float v197 = objc_opt_new();
  float v296 = v178;
  if ((unint64_t)[v178 count] < 3)
  {
    v298 = (void *)v194;
    uint64_t v293 = 0;
  }
  else
  {
    uint64_t v198 = 0;
    uint64_t v293 = 0;
    do
    {
      float v199 = (void *)v194;
      double v200 = v195;
      double v289 = v197;
      v201 = [v296 objectAtIndexedSubscript:v198];
      uint64_t v202 = [v201 objectForKeyedSubscript:@"bundleInterfaceType"];

      float v203 = (void *)v202;
      float v204 = [v296 objectAtIndexedSubscript:v198];
      v298 = [v204 objectForKeyedSubscript:@"bundleSubType"];

      float v205 = [v296 objectAtIndexedSubscript:v198];
      double v195 = [v205 objectForKeyedSubscript:@"bundleSuperType"];

      double v206 = [v296 objectAtIndexedSubscript:v198];
      float v197 = [v206 objectForKeyedSubscript:@"elapsedDaysFromBundleEndDate"];

      float v196 = v203;
      if ([v203 intValue] == 10)
      {
        ++v293;
        uint64_t v194 = (uint64_t)v298;
      }
      else
      {
        uint64_t v194 = (uint64_t)v298;
        [v287 addObject:v298];
        [v285 addObject:v195];
        [v283 addObject:v197];
      }
      ++v198;
    }
    while (v198 != 3);
    v207 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v287 count]);
    float v191 = v281;
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"uniqueBundleSubTypeCountForSensedBundlesInTop3" andValue:v207];

    float v208 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v285 count]);
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"uniqueBundleSuperTypeCountForSensedBundlesInTop3" andValue:v208];

    float v209 = [v283 valueForKeyPath:@"@avg.self"];
    [v209 floatValue];
    *(float *)&double v211 = v210 * 10000.0;
    v212 = +[NSNumber numberWithFloat:v211];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"averageBundleAgeInTop3" andValue:v212];

    v213 = [v283 valueForKeyPath:@"@max.self"];
    [v213 floatValue];
    *(float *)&double v215 = v214 * 10000.0;
    float v216 = +[NSNumber numberWithFloat:v215];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"maxBundleAgeInTop3" andValue:v216];

    v217 = +[NSNumber numberWithUnsignedInteger:v293];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"numPhotoMemoriesInTop3" andValue:v217];
  }
  if ((unint64_t)[v296 count] >= 5)
  {
    uint64_t v218 = 3;
    float v219 = v298;
    do
    {
      float v220 = v195;
      signed int v290 = v197;
      v221 = [v296 objectAtIndexedSubscript:v218];
      uint64_t v222 = [v221 objectForKeyedSubscript:@"bundleInterfaceType"];

      float v223 = (void *)v222;
      float v224 = [v296 objectAtIndexedSubscript:v218];
      v298 = [v224 objectForKeyedSubscript:@"bundleSubType"];

      double v225 = [v296 objectAtIndexedSubscript:v218];
      double v195 = [v225 objectForKeyedSubscript:@"bundleSuperType"];

      float v226 = [v296 objectAtIndexedSubscript:v218];
      float v197 = [v226 objectForKeyedSubscript:@"elapsedDaysFromBundleEndDate"];

      float v196 = v223;
      if ([v223 intValue] == 10)
      {
        ++v293;
        float v219 = v298;
      }
      else
      {
        float v219 = v298;
        [v287 addObject:v298];
        [v285 addObject:v195];
        [v283 addObject:v197];
      }
      ++v218;
    }
    while (v218 != 5);
    float v227 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v287 count]);
    float v191 = v281;
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"uniqueBundleSubTypeCountForSensedBundlesInTop5" andValue:v227];

    v228 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v285 count]);
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"uniqueBundleSuperTypeCountForSensedBundlesInTop5" andValue:v228];

    float v229 = [v283 valueForKeyPath:@"@avg.self"];
    [v229 floatValue];
    *(float *)&double v231 = v230 * 10000.0;
    float v232 = +[NSNumber numberWithFloat:v231];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"averageBundleAgeInTop5" andValue:v232];

    float v233 = [v283 valueForKeyPath:@"@max.self"];
    [v233 floatValue];
    *(float *)&double v235 = v234 * 10000.0;
    float v236 = +[NSNumber numberWithFloat:v235];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"maxBundleAgeInTop5" andValue:v236];

    float v237 = +[NSNumber numberWithUnsignedInteger:v293];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"numPhotoMemoriesInTop5" andValue:v237];
  }
  if ((unint64_t)[v296 count] >= 0xA)
  {
    uint64_t v238 = 5;
    double v239 = v298;
    do
    {
      float v240 = v195;
      v291 = v197;
      float v241 = [v296 objectAtIndexedSubscript:v238];
      uint64_t v242 = [v241 objectForKeyedSubscript:@"bundleInterfaceType"];

      float v243 = (void *)v242;
      uint64_t v244 = [v296 objectAtIndexedSubscript:v238];
      v298 = [v244 objectForKeyedSubscript:@"bundleSubType"];

      v245 = [v296 objectAtIndexedSubscript:v238];
      double v195 = [v245 objectForKeyedSubscript:@"bundleSuperType"];

      long long v246 = [v296 objectAtIndexedSubscript:v238];
      float v197 = [v246 objectForKeyedSubscript:@"elapsedDaysFromBundleEndDate"];

      float v196 = v243;
      if ([v243 intValue] == 10)
      {
        ++v293;
        double v239 = v298;
      }
      else
      {
        double v239 = v298;
        [v287 addObject:v298];
        [v285 addObject:v195];
        [v283 addObject:v197];
      }
      ++v238;
    }
    while (v238 != 10);
    long long v247 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v287 count]);
    float v191 = v281;
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"uniqueBundleSubTypeCountForSensedBundlesInTop10" andValue:v247];

    long long v248 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v285 count]);
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"uniqueBundleSuperTypeCountForSensedBundlesInTop10" andValue:v248];

    long long v249 = [v283 valueForKeyPath:@"@avg.self"];
    [v249 floatValue];
    *(float *)&double v251 = v250 * 10000.0;
    v252 = +[NSNumber numberWithFloat:v251];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"averageBundleAgeInTop10" andValue:v252];

    v253 = [v283 valueForKeyPath:@"@max.self"];
    [v253 floatValue];
    *(float *)&double v255 = v254 * 10000.0;
    v256 = +[NSNumber numberWithFloat:v255];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"maxBundleAgeInTop10" andValue:v256];

    id v257 = +[NSNumber numberWithUnsignedInteger:v293];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v281 withKey:@"numPhotoMemoriesInTop10" andValue:v257];
  }
  if (v191)
  {
    float v299 = v191;
    AnalyticsSendEventLazy();
    uint64_t v258 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v258, OS_LOG_TYPE_DEBUG)) {
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:]();
    }

    unint64_t v259 = v299;
  }
  else
  {
    unint64_t v259 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:](v259, v260, v261, v262, v263, v264, v265, v266);
    }
  }
}

id __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke_1165(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateEngagementScoreParamsUsingBFGS
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Number of iteration in BFGS %lu", v2, v3, v4, v5, v6);
}

uint64_t __60__MOEventBundleRanking_updateEngagementScoreParamsUsingBFGS__block_invoke(uint64_t result, int a2, double a3)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  else {
    *(double *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  }
  return result;
}

- (void)_computeGradient:(double *)a3 initialParams:(double *)a4 Update:(double *)a5
{
  unint64_t v9 = 0;
  long long v10 = *((_OWORD *)a3 + 5);
  long long v11 = *((_OWORD *)a3 + 3);
  long long v32 = *((_OWORD *)a3 + 4);
  long long v33 = v10;
  long long v12 = *((_OWORD *)a3 + 5);
  long long v34 = *((_OWORD *)a3 + 6);
  long long v13 = *((_OWORD *)a3 + 1);
  v29[0] = *(_OWORD *)a3;
  v29[1] = v13;
  long long v14 = *((_OWORD *)a3 + 3);
  long long v16 = *(_OWORD *)a3;
  long long v15 = *((_OWORD *)a3 + 1);
  long long v30 = *((_OWORD *)a3 + 2);
  long long v31 = v14;
  long long v25 = v32;
  long long v26 = v12;
  long long v27 = *((_OWORD *)a3 + 6);
  uint64_t v35 = *((void *)a3 + 14);
  uint64_t v28 = *((void *)a3 + 14);
  long long v21 = v16;
  long long v22 = v15;
  long long v23 = v30;
  long long v24 = v11;
  do
  {
    *(double *)((char *)v29 + v9) = *(double *)((char *)v29 + v9) + 0.000001;
    *(double *)((char *)&v21 + v9) = *(double *)((char *)&v21 + v9) + -0.000001;
    -[MOEventBundleRanking _generateBPROptUsing:initialParams:](self, "_generateBPROptUsing:initialParams:", v29, a4, v21, v22, v23, v24, v25, v26, v27, v28);
    double v18 = v17;
    [(MOEventBundleRanking *)self _generateBPROptUsing:&v21 initialParams:a4];
    a5[v9 / 8] = (v18 - v19) / 0.000002;
    double v20 = a3[v9 / 8];
    *(double *)((char *)v29 + v9) = v20;
    *(double *)((char *)&v21 + v9) = v20;
    v9 += 8;
  }
  while (v9 != 120);
}

- (double)_computeBPROptForPairs:(double *)a3 withTotalBundleCountsForInterfaceTypesHigherTier:(id)a4 WithTotalBundleCountsForInterfaceTypesLowerTier:(id)a5 bprOpt:(double)a6 pairWiseMult:(float)a7
{
  id v11 = a4;
  id v12 = a5;
  if ([v11 count] && objc_msgSend(v12, "count"))
  {
    double v51 = v12;
    long long v13 = objc_opt_new();
    long long v14 = objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v50 = v11;
    id v15 = v11;
    id obj = [v15 countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (obj)
    {
      uint64_t v52 = *(void *)v70;
      do
      {
        for (i = 0; i != obj; i = (char *)i + 1)
        {
          if (*(void *)v70 != v52) {
            objc_enumerationMutation(v15);
          }
          double v17 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          double v18 = [v15 objectForKeyedSubscript:v17, v50];
          int v19 = [v18 intValue];

          if (v19 >= 1)
          {
            signed int v20 = 0;
            do
            {
              long long v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3[[v17 intValue] - 1]);
              [v13 addObject:v21];

              ++v20;
              long long v22 = [v15 objectForKeyedSubscript:v17];
              signed int v23 = [v22 intValue];
            }
            while (v20 < v23);
          }
        }
        id obj = [v15 countByEnumeratingWithState:&v69 objects:v76 count:16];
      }
      while (obj);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v24 = v51;
    id obja = [v24 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (obja)
    {
      uint64_t v53 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != obja; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v66 != v53) {
            objc_enumerationMutation(v24);
          }
          long long v26 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
          long long v27 = [v24 objectForKeyedSubscript:v26, v50];
          int v28 = [v27 intValue];

          if (v28 >= 1)
          {
            signed int v29 = 0;
            do
            {
              long long v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3[[v26 intValue] - 1]);
              [v14 addObject:v30];

              ++v29;
              long long v31 = [v24 objectForKeyedSubscript:v26];
              signed int v32 = [v31 intValue];
            }
            while (v29 < v32);
          }
        }
        id obja = [v24 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (obja);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id objb = v13;
    id v33 = [objb countByEnumeratingWithState:&v61 objects:v74 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v62;
      double v36 = a7;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v62 != v35) {
            objc_enumerationMutation(objb);
          }
          id v38 = *(void **)(*((void *)&v61 + 1) + 8 * (void)k);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v39 = v14;
          id v40 = [v39 countByEnumeratingWithState:&v57 objects:v73 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v58;
            do
            {
              for (m = 0; m != v41; m = (char *)m + 1)
              {
                if (*(void *)v58 != v42) {
                  objc_enumerationMutation(v39);
                }
                double v44 = *(void **)(*((void *)&v57 + 1) + 8 * (void)m);
                [v38 doubleValue:v50];
                double v46 = v45;
                [v44 doubleValue];
                long double v48 = exp(-(v46 - v47));
                a6 = a6 + log(1.0 / (v48 + 1.0)) * v36;
              }
              id v41 = [v39 countByEnumeratingWithState:&v57 objects:v73 count:16];
            }
            while (v41);
          }
        }
        id v34 = [objb countByEnumeratingWithState:&v61 objects:v74 count:16];
      }
      while (v34);
    }

    id v11 = v50;
    id v12 = v51;
  }

  return a6;
}

- (double)_generateBPROptUsing:(double *)a3 initialParams:(double *)a4
{
  uint64_t v7 = 0;
  double v8 = 0.0;
  do
  {
    bprRegularizationFactor = self->_bprRegularizationFactor;
    long long v10 = +[NSNumber numberWithUnsignedInteger:v7 + 1];
    id v11 = [(NSDictionary *)bprRegularizationFactor objectForKeyedSubscript:v10];
    [v11 floatValue];
    double v13 = a3[v7] - a4[v7];
    double v8 = v8 + -(v13 * v12) * v13;

    ++v7;
  }
  while (v7 != 15);
  long long v14 = [(NSDictionary *)self->_interfaceTypeCountFromSuggestionEngagementDict objectForKeyedSubscript:@"journalWasWritten"];
  id v15 = [(NSDictionary *)self->_interfaceTypeCountFromSuggestionEngagementDict objectForKeyedSubscript:@"journalEntryWasCreatedWithNoWriting"];
  long long v16 = [(NSDictionary *)self->_interfaceTypeCountFromSuggestionEngagementDict objectForKeyedSubscript:@"suggestionWasViewedButNotEngaged"];
  double v17 = [(NSDictionary *)self->_interfaceTypeCountFromSuggestionEngagementDict objectForKeyedSubscript:@"suggestionWasDeleted"];
  double v18 = [(NSMutableDictionary *)self->_pairWiseWeights objectForKeyedSubscript:@"pairWiseFarthest"];
  [v18 floatValue];
  LODWORD(v20) = v19;
  [(MOEventBundleRanking *)self _computeBPROptForPairs:a3 withTotalBundleCountsForInterfaceTypesHigherTier:v14 WithTotalBundleCountsForInterfaceTypesLowerTier:v17 bprOpt:v8 pairWiseMult:v20];
  double v22 = v21;

  signed int v23 = [(NSMutableDictionary *)self->_pairWiseWeights objectForKeyedSubscript:@"pairWiseFarther"];
  [v23 floatValue];
  LODWORD(v25) = v24;
  [(MOEventBundleRanking *)self _computeBPROptForPairs:a3 withTotalBundleCountsForInterfaceTypesHigherTier:v14 WithTotalBundleCountsForInterfaceTypesLowerTier:v16 bprOpt:v22 pairWiseMult:v25];
  double v27 = v26;

  int v28 = [(NSMutableDictionary *)self->_pairWiseWeights objectForKeyedSubscript:@"pairWiseFarther"];
  [v28 floatValue];
  LODWORD(v30) = v29;
  [(MOEventBundleRanking *)self _computeBPROptForPairs:a3 withTotalBundleCountsForInterfaceTypesHigherTier:v15 WithTotalBundleCountsForInterfaceTypesLowerTier:v17 bprOpt:v27 pairWiseMult:v30];
  double v32 = v31;

  id v33 = [(NSDictionary *)self->_engagementScoreParameterDict objectForKeyedSubscript:@"pairWiseFar"];
  [v33 floatValue];
  LODWORD(v35) = v34;
  [(MOEventBundleRanking *)self _computeBPROptForPairs:a3 withTotalBundleCountsForInterfaceTypesHigherTier:v14 WithTotalBundleCountsForInterfaceTypesLowerTier:v15 bprOpt:v32 pairWiseMult:v35];
  double v37 = v36;

  id v38 = [(NSMutableDictionary *)self->_pairWiseWeights objectForKeyedSubscript:@"pairWiseFar"];
  [v38 floatValue];
  LODWORD(v40) = v39;
  [(MOEventBundleRanking *)self _computeBPROptForPairs:a3 withTotalBundleCountsForInterfaceTypesHigherTier:v15 WithTotalBundleCountsForInterfaceTypesLowerTier:v16 bprOpt:v37 pairWiseMult:v40];
  double v42 = v41;

  long long v43 = [(NSMutableDictionary *)self->_pairWiseWeights objectForKeyedSubscript:@"pairWiseFar"];
  [v43 floatValue];
  LODWORD(v45) = v44;
  [(MOEventBundleRanking *)self _computeBPROptForPairs:a3 withTotalBundleCountsForInterfaceTypesHigherTier:v16 WithTotalBundleCountsForInterfaceTypesLowerTier:v17 bprOpt:v42 pairWiseMult:v45];
  double v47 = v46;

  return -v47;
}

- (double)_calculateNormSquare:(double *)a3
{
  double __C = 0.0;
  vDSP_dotprD(a3, 1, a3, 1, &__C, 0xFuLL);
  return __C;
}

- (void)_setToIdentityMatrix:(double *)a3 forNumRows:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      for (uint64_t i = 0; i != a4; ++i)
      {
        if (v4 == i) {
          double v7 = 1.0;
        }
        else {
          double v7 = 0.0;
        }
        a3[v5 + i] = v7;
      }
      ++v4;
      v5 += i;
    }
    while (v4 != a4);
  }
}

- (void)_lineSearch:(double *)a3 initialParams:(double *)a4 With:(double *)a5 And:(double *)a6 handler:(id)a7
{
  float v12 = (void (**)(id, void, double))a7;
  double __B = 1.0;
  [(MOEventBundleRanking *)self _generateBPROptUsing:a3 initialParams:a4];
  double v14 = v13;
  unint64_t v15 = 1;
  vDSP_vsmulD(a5, 1, &__B, __C, 1, 0xFuLL);
  vDSP_vaddD(a3, 1, __C, 1, v33, 1, 0xFuLL);
  [(MOEventBundleRanking *)self _computeGradient:v33 initialParams:a4 Update:__A];
  BOOL v16 = 0;
  while (1)
  {
    [(MOEventBundleRanking *)self _generateBPROptUsing:v33 initialParams:a4];
    double v18 = v17;
    double v30 = 0.0;
    vDSP_mmulD(a6, 1, a5, 1, &v30, 1, 1uLL, 1uLL, 0xFuLL);
    double v19 = v14 + v30 * 0.0001 * __B;
    double v29 = 0.0;
    vDSP_mmulD(__A, 1, a5, 1, &v29, 1, 1uLL, 1uLL, 0xFuLL);
    if (v18 <= v19 && v29 > v30 * 0.9) {
      break;
    }
    double __B = __B * 0.5;
    vDSP_vsmulD(a5, 1, &__B, __C, 1, 0xFuLL);
    vDSP_vaddD(a3, 1, __C, 1, v33, 1, 0xFuLL);
    [(MOEventBundleRanking *)self _computeGradient:v33 initialParams:a4 Update:__A];
    BOOL v16 = v15++ > 0x63;
    if (v15 == 101)
    {
      double v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MOEventBundleRanking _lineSearch:initialParams:With:And:handler:](v20, v21, v22, v23, v24, v25, v26, v27);
      }

      BOOL v16 = 1;
      break;
    }
  }
  int v28 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _lineSearch:initialParams:With:And:handler:]();
  }

  ((void (**)(id, BOOL, double))v12)[2](v12, v16, __B);
}

- (id)_getDefaultFallbackFactorDict
{
  v5[0] = @"decayRate";
  v5[1] = @"weightForNumAnamolyEventsNormalized";
  v6[0] = &off_1002F9620;
  v6[1] = &off_1002F9630;
  v5[2] = @"weightForNumTrendEventsNormalized";
  v5[3] = @"weightForNumRoutineEventsNormalized";
  v6[2] = &off_1002F9630;
  v6[3] = &off_1002F9640;
  v5[4] = @"weightForNumStateOfMindEventsNormalized";
  v5[5] = @"weightForLabelQualityScore";
  v6[4] = &off_1002F9530;
  v6[5] = &off_1002F9510;
  v5[6] = @"weightForTimeCorrelationScore";
  v5[7] = @"richnessScoreScalingParameter";
  v6[6] = &off_1002F9510;
  v6[7] = &off_1002F94F0;
  v5[8] = @"bundleScoreScalingParameter";
  v5[9] = @"bundleScoreConstant";
  v6[8] = &off_1002F94F0;
  v6[9] = &off_1002F9510;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:10];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (void)identifyRepetitiveSignificantContactBundlesFromBundles:(id)a3 precedingSignificantContactBundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke;
    v130[3] = &unk_1002CD5D0;
    id v8 = (id)objc_opt_new();
    id v131 = v8;
    [v6 enumerateObjectsUsingBlock:v130];
    unint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    double v99 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = NSStringFromSelector(a2);
      id v11 = [v6 count];
      id v12 = [v99 count];
      CFStringRef v13 = (const __CFString *)[v7 count];
      *(_DWORD *)buf = 138413058;
      float v136 = v10;
      __int16 v137 = 2048;
      unint64_t v138 = (unint64_t)v11;
      __int16 v139 = 2048;
      uint64_t v140 = (uint64_t)v12;
      __int16 v141 = 2048;
      CFStringRef v142 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, event bundle count, %lu, contact bundle count, %lu, preceding contact bundle count, %lu", buf, 0x2Au);

      id v8 = v99;
    }
    float v100 = v6;

    if ([v7 count]) {
      [v8 addObjectsFromArray:v7];
    }
    id v98 = v7;
    double v14 = [v8 allObjects];
    unint64_t v15 = +[NSMutableArray arrayWithArray:v14];

    id v97 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v148 = v97;
    BOOL v16 = +[NSArray arrayWithObjects:&v148 count:1];
    [v15 sortUsingDescriptors:v16];

    double v17 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    double v102 = a2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = NSStringFromSelector(a2);
      id v19 = [v15 count];
      double v20 = [v100 firstObject];
      uint64_t v21 = [v20 startDate];
      uint64_t v22 = [v100 lastObject];
      uint64_t v23 = [v22 startDate];
      *(_DWORD *)buf = 138413058;
      float v136 = v18;
      __int16 v137 = 2048;
      unint64_t v138 = (unint64_t)v19;
      __int16 v139 = 2112;
      uint64_t v140 = (uint64_t)v21;
      __int16 v141 = 2112;
      CFStringRef v142 = v23;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@, merged contact bundle count, %lu, first bundle start date, %@, last bundle start date, %@", buf, 0x2Au);

      a2 = v102;
    }

    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1177;
    v129[3] = &__block_descriptor_40_e30_v32__0__MOEventBundle_8Q16_B24l;
    v129[4] = a2;
    [v15 enumerateObjectsUsingBlock:v129];
    uint64_t v24 = [v15 firstObject];
    uint64_t v25 = [v24 startDate];
    uint64_t v26 = +[NSDate firstSaturdayBeforeReferenceDate:v25];

    uint64_t v27 = objc_opt_new();
    int v28 = [v15 lastObject];
    double v29 = [v28 endDate];
    double v30 = v26;
    LODWORD(v26) = [v26 isBeforeDate:v29];

    if (v26)
    {
      do
      {
        double v31 = v30;
        uint64_t v33 = [v30 dateByAddingTimeInterval:604800.0];
        int v34 = (void *)v33;
        if (v30)
        {
          if (v33)
          {
            double v35 = v30;
            double v36 = v34;
            unsigned int v37 = [v35 isBeforeDate:v34];
            int v34 = v36;
            if (v37)
            {
              id v38 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v31 endDate:v36];
              [v27 addObject:v38];

              int v34 = v36;
            }
          }
        }
        double v30 = v34;

        int v39 = [v15 lastObject];
        double v40 = [v39 endDate];
        unsigned __int8 v41 = [v30 isBeforeDate:v40];
      }
      while ((v41 & 1) != 0);
    }
    double v96 = v30;
    float v109 = objc_opt_new();
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id obj = v27;
    id v104 = [obj countByEnumeratingWithState:&v125 objects:v147 count:16];
    if (v104)
    {
      unint64_t v42 = 0;
      uint64_t v103 = *(void *)v126;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v126 != v103) {
            objc_enumerationMutation(obj);
          }
          float v110 = *(void **)(*((void *)&v125 + 1) + 8 * v43);
          int v44 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            double v84 = NSStringFromSelector(a2);
            double v85 = [v110 startDate];
            float v86 = [v110 endDate];
            *(_DWORD *)buf = 138412802;
            float v136 = v84;
            __int16 v137 = 2112;
            unint64_t v138 = (unint64_t)v85;
            __int16 v139 = 2112;
            uint64_t v140 = (uint64_t)v86;
            _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@, interval startDate, %@, interval endDate, %@", buf, 0x20u);
          }
          uint64_t v108 = v43;

          double v45 = objc_opt_new();
          while (v42 < (unint64_t)[v15 count])
          {
            double v46 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              double v105 = NSStringFromSelector(a2);
              float v106 = [v15 objectAtIndexedSubscript:v42];
              unsigned int v73 = [v106 bundleIdentifier];
              float v74 = [v15 objectAtIndexedSubscript:v42];
              double v75 = [v74 startDate];
              double v76 = [v15 objectAtIndexedSubscript:v42];
              id v77 = [v76 summarizationGranularity];
              id v78 = [v45 count];
              *(_DWORD *)buf = 138413570;
              float v136 = v105;
              __int16 v137 = 2048;
              unint64_t v138 = v42;
              __int16 v139 = 2112;
              uint64_t v140 = (uint64_t)v73;
              __int16 v141 = 2112;
              CFStringRef v142 = v75;
              __int16 v143 = 2048;
              id v144 = v77;
              __int16 v145 = 2048;
              id v146 = v78;
              _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@, bundle idx, %lu, identifier, %@, startDate, %@, summarizationGranularity, %lu, contactIdentifierList count, %lu", buf, 0x3Eu);

              a2 = v102;
            }

            v124[0] = _NSConcreteStackBlock;
            v124[1] = 3221225472;
            v124[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1179;
            v124[3] = &__block_descriptor_48_e22_v24__0__NSString_8_B16l;
            v124[4] = a2;
            v124[5] = v42;
            [v45 enumerateObjectsUsingBlock:v124];
            double v47 = [v15 objectAtIndexedSubscript:v42];
            id v48 = [v47 summarizationGranularity];

            if (v48 == (id)1)
            {
              float v49 = [v15 objectAtIndexedSubscript:v42];
              id v50 = [v49 startDate];
              double v51 = [v110 endDate];
              unsigned __int8 v52 = [v50 isAfterDate:v51];

              if (v52) {
                break;
              }
              long long v122 = 0u;
              long long v123 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              uint64_t v53 = [v15 objectAtIndexedSubscript:v42];
              double v54 = [v53 persons];

              id v55 = [v54 countByEnumeratingWithState:&v120 objects:v134 count:16];
              if (v55)
              {
                uint64_t v56 = *(void *)v121;
                while (2)
                {
                  for (uint64_t i = 0; i != v55; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v121 != v56) {
                      objc_enumerationMutation(v54);
                    }
                    long long v58 = [*(id *)(*((void *)&v120 + 1) + 8 * i) contactIdentifier];
                    unsigned int v59 = [v45 containsObject:v58];

                    if (v59)
                    {
                      long long v60 = [v15 objectAtIndexedSubscript:v42];
                      long long v61 = [v60 bundleIdentifier];
                      long long v62 = [v61 UUIDString];
                      [v109 addObject:v62];

                      LODWORD(v55) = 1;
                      goto LABEL_37;
                    }
                  }
                  id v55 = [v54 countByEnumeratingWithState:&v120 objects:v134 count:16];
                  if (v55) {
                    continue;
                  }
                  break;
                }
              }
LABEL_37:

              long long v63 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                float v79 = NSStringFromSelector(a2);
                float v80 = [v15 objectAtIndexedSubscript:v42];
                uint64_t v81 = [v80 bundleIdentifier];
                float v82 = (void *)v81;
                *(_DWORD *)buf = 138413058;
                CFStringRef v83 = @"NO";
                if (v55) {
                  CFStringRef v83 = @"YES";
                }
                float v136 = v79;
                __int16 v137 = 2048;
                unint64_t v138 = v42;
                __int16 v139 = 2112;
                uint64_t v140 = v81;
                __int16 v141 = 2112;
                CFStringRef v142 = v83;
                _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "%@, bundle idx, %lu, identifier, %@, repetitiveBundle, %@", buf, 0x2Au);
              }
              if ((v55 & 1) == 0)
              {
                long long v118 = 0u;
                long long v119 = 0u;
                long long v116 = 0u;
                long long v117 = 0u;
                long long v64 = [v15 objectAtIndexedSubscript:v42];
                long long v65 = [v64 persons];

                id v66 = [v65 countByEnumeratingWithState:&v116 objects:v133 count:16];
                if (v66)
                {
                  id v67 = v66;
                  uint64_t v68 = *(void *)v117;
                  do
                  {
                    for (uint64_t j = 0; j != v67; uint64_t j = (char *)j + 1)
                    {
                      if (*(void *)v117 != v68) {
                        objc_enumerationMutation(v65);
                      }
                      long long v70 = *(void **)(*((void *)&v116 + 1) + 8 * (void)j);
                      long long v71 = [v70 contactIdentifier];

                      if (v71)
                      {
                        long long v72 = [v70 contactIdentifier];
                        [v45 addObject:v72];
                      }
                    }
                    id v67 = [v65 countByEnumeratingWithState:&v116 objects:v133 count:16];
                  }
                  while (v67);
                }
              }
            }
            ++v42;
          }

          uint64_t v43 = v108 + 1;
        }
        while ((id)(v108 + 1) != v104);
        id v104 = [obj countByEnumeratingWithState:&v125 objects:v147 count:16];
      }
      while (v104);
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v111 = v100;
    id v87 = [v111 countByEnumeratingWithState:&v112 objects:v132 count:16];
    if (v87)
    {
      id v88 = v87;
      uint64_t v89 = *(void *)v113;
      do
      {
        for (k = 0; k != v88; k = (char *)k + 1)
        {
          if (*(void *)v113 != v89) {
            objc_enumerationMutation(v111);
          }
          float v91 = *(void **)(*((void *)&v112 + 1) + 8 * (void)k);
          float v92 = [v91 bundleIdentifier];
          double v93 = [v92 UUIDString];
          unsigned int v94 = [v109 containsObject:v93];

          if (v94) {
            float v95 = &__kCFBooleanTrue;
          }
          else {
            float v95 = &__kCFBooleanFalse;
          }
          [v91 addMetaDataForRankForKey:@"isRepetitiveContact" value:v95];
        }
        id v88 = [v111 countByEnumeratingWithState:&v112 objects:v132 count:16];
      }
      while (v88);
    }

    id v6 = v100;
    id v7 = v98;
  }
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 interfaceType] == (id)4) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1177(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    unint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, bundle, %@", (uint8_t *)&v8, 0x20u);
  }
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1179(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1179_cold_1(a1);
  }
}

- (id)_getDefaultRichnessWeightDict
{
  uint64_t v2 = objc_opt_new();
  for (unint64_t i = 0; i != 17; ++i)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = v4;
    if (i <= 0x10)
    {
      id v6 = off_1002D0B60[i];
      id v7 = off_1002D0BE8[i];
      [v4 setObject:off_1002D0AD8[i] forKey:@"RankingRichnessPrimaryPriorityScoreKey"];
      [v5 setObject:v6 forKey:@"RankingRichnessSecondaryPriorityScoreKey"];
      [v5 setObject:v7 forKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];
    }
    int v8 = +[MOResource getStringTypeForResources:i];
    [v2 setObject:v5 forKey:v8];
  }
  v15[0] = @"RankingRichnessPrimaryPriorityScoreKey";
  v15[1] = @"RankingRichnessSecondaryPriorityScoreKey";
  v16[0] = &off_1002F9650;
  v16[1] = &off_1002F9650;
  v15[2] = @"RankingRichnessAuxiliaryPriorityScoreKey";
  v16[2] = &off_1002F9650;
  unint64_t v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 setObject:v9 forKey:@"NumUniqueResourceTypesNormalizedKey"];
  v13[0] = @"RankingRichnessPrimaryPriorityScoreKey";
  v13[1] = @"RankingRichnessSecondaryPriorityScoreKey";
  v14[0] = &off_1002F9650;
  v14[1] = &off_1002F9650;
  v13[2] = @"RankingRichnessAuxiliaryPriorityScoreKey";
  v14[2] = &off_1002F9650;
  __int16 v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 setObject:v10 forKey:@"NumWorkoutRouteMapAssets"];
  id v11 = [v2 copy];

  return v11;
}

- (id)_checkAndUpdateNumericLimits:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v3 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138412290;
    long long v18 = v7;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v10);
        __int16 v12 = [v3 objectForKeyedSubscript:v11, v18];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_9;
        }
        [v12 doubleValue];
        if (fabs(v13) != INFINITY)
        {
          [v12 doubleValue];
LABEL_9:
          double v14 = [v3 objectForKeyedSubscript:v11];
          [v4 setObject:v14 forKeyedSubscript:v11];

          goto LABEL_10;
        }
        unint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v24 = v11;
          _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Value is either infinite or NaN for key %@", buf, 0xCu);
        }

        [v4 setObject:&off_1002F9920 forKeyedSubscript:v11];
LABEL_10:

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v16 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      id v8 = v16;
    }
    while (v16);
  }

  return v4;
}

- (id)dictionary
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(MOEventBundleRanking *)self rankingAlgorithmVersion];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"kMORankingAlgorithmVersion" andValue:v4];

  id v5 = objc_opt_new();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__30;
  v36[4] = __Block_byref_object_dispose__30;
  id v37 = 0;
  id v6 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __34__MOEventBundleRanking_dictionary__block_invoke;
  v33[3] = &unk_1002D0A90;
  double v35 = v36;
  id v7 = v5;
  id v34 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v33];

  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"staticModelParameterMatrix" andValue:v7];
  id v8 = objc_opt_new();
  uint64_t v9 = [(MOEventBundleRanking *)self dynamicModelParameterDict];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __34__MOEventBundleRanking_dictionary__block_invoke_2;
  v30[3] = &unk_1002D0A90;
  double v32 = v36;
  id v10 = v8;
  id v31 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v30];

  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"dynamicModelParameterDict" andValue:v10];
  uint64_t v11 = [(MOEventBundleRanking *)self heuristicsParameterDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"heuristicsParameterDict" andValue:v11];

  __int16 v12 = [(MOEventBundleRanking *)self engagementScoreParameterDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"engagementScoreParameterDict" andValue:v12];

  [(MOEventBundleRanking *)self engagementScoreWeight];
  double v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"engagementScoreWeight" andValue:v13];

  double v14 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"rankingScoreThresholdDict" andValue:v14];

  [(MOEventBundleRanking *)self frequencyPenalty];
  unint64_t v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"frequencyPenaltyCoefficient" andValue:v15];

  id v16 = [(MOEventBundleRanking *)self curationParameterDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"curationParameterDict" andValue:v16];

  double v17 = [(MOEventBundleRanking *)self evergreenEngagementScoreParameterDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"evergreenEngagementScoreParameterDict" andValue:v17];

  long long v18 = [(MOEventBundleRanking *)self viewCountBasedAdjustmentParameterDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v3 withKey:@"viewCountBasedAdjustmentParameterDict" andValue:v18];

  long long v19 = objc_opt_new();
  long long v20 = [(MOEventBundleRanking *)self bprRegularizationFactor];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __34__MOEventBundleRanking_dictionary__block_invoke_3;
  v27[3] = &unk_1002D0AB8;
  double v29 = v36;
  v27[4] = self;
  id v21 = v3;
  id v28 = v21;
  [v20 enumerateKeysAndObjectsUsingBlock:v27];

  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v21 withKey:@"bprRegularizationFactor" andValue:v19];
  long long v22 = [(MOEventBundleRanking *)self pairWiseWeights];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v21 withKey:@"pairWiseWeights" andValue:v22];

  uint64_t v23 = [(MOEventBundleRanking *)self richnessWeightsDict];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v21 withKey:@"richnessWeightsDict" andValue:v23];

  uint64_t v24 = v28;
  id v25 = v21;

  _Block_object_dispose(v36, 8);

  return v25;
}

void __34__MOEventBundleRanking_dictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = +[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", (int)[a2 intValue], 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) setObject:v8 forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __34__MOEventBundleRanking_dictionary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = +[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", (int)[a2 intValue], 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) setObject:v8 forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __34__MOEventBundleRanking_dictionary__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = +[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", (int)[a2 intValue], 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) safeSavePropertyToDictionary:*(void *)(a1 + 40) withKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) andValue:v8];
}

- (void)safeSavePropertyToDictionary:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    [a3 setObject:v8 forKey:v7];
  }
  else
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:]();
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  float frequencyPenalty = self->_frequencyPenalty;
  id v8 = a3;
  *(float *)&double v5 = frequencyPenalty;
  uint64_t v6 = +[NSNumber numberWithFloat:v5];
  [v8 encodeObject:v6 forKey:@"frequencyPenaltyCoefficient"];

  id v7 = +[NSNumber numberWithDouble:self->_recommendedTabVisitFIThreshold];
  [v8 encodeObject:v7 forKey:@"recommendedTabVisitFIThreshold"];

  [v8 encodeObject:self->_richnessWeightsDict forKey:@"richnessWeightsDict"];
  [v8 encodeObject:self->_staticModelParameterMatrix forKey:@"staticModelParameterMatrix"];
  [v8 encodeObject:self->_dynamicModelParameterDict forKey:@"dynamicModelParameterDict"];
  [v8 encodeObject:self->_heuristicsParameterDict forKey:@"heuristicsParameterDict"];
  [v8 encodeObject:self->_engagementScoreParameterDict forKey:@"engagementScoreParameterDict"];
  [v8 encodeObject:self->_rankingScoreThresholdDict forKey:@"rankingScoreThresholdDict"];
  [v8 encodeObject:self->_viewCountBasedAdjustmentParameterDict forKey:@"viewCountBasedAdjustmentParameterDict"];
  [v8 encodeObject:self->_interfaceTypeCountFromSuggestionEngagementDict forKey:@"interfaceTypeCountFromSuggestionEngagement"];
  [v8 encodeObject:self->_bprRegularizationFactor forKey:@"bprRegularizationFactor"];
  [v8 encodeObject:self->_pairWiseWeights forKey:@"pairWiseWeights"];
  [v8 encodeObject:self->_evergreenEngagementScoreParameterDict forKey:@"evergreenEngagementScoreParameterDict"];
  [v8 encodeObject:self->_curationParameterDict forKey:@"curationParameterDict"];
}

- (MOEventBundleRanking)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(MOConfigurationManagerBase);
  uint64_t v6 = [(MOEventBundleRanking *)self initWithConfigurationManager:v5];

  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frequencyPenaltyCoefficient"];
    [v7 floatValue];
    v6->_float frequencyPenalty = v8;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommendedTabVisitFIThreshold"];
    [v9 doubleValue];
    v6->_recommendedTabVisitFIThreshold = v10;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    double v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"richnessWeightsDict"];
    richnessWeightsDict = v6->_richnessWeightsDict;
    v6->_richnessWeightsDict = (NSDictionary *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    long long v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"staticModelParameterMatrix"];
    staticModelParameterMatrix = v6->_staticModelParameterMatrix;
    v6->_staticModelParameterMatrix = (NSDictionary *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"dynamicModelParameterDict"];
    dynamicModelParameterDict = v6->_dynamicModelParameterDict;
    v6->_dynamicModelParameterDict = (NSDictionary *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    id v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"heuristicsParameterDict"];
    heuristicsParameterDict = v6->_heuristicsParameterDict;
    v6->_heuristicsParameterDict = (NSDictionary *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"engagementScoreParameterDict"];
    engagementScoreParameterDict = v6->_engagementScoreParameterDict;
    v6->_engagementScoreParameterDict = (NSDictionary *)v34;

    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    id v38 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"rankingScoreThresholdDict"];
    rankingScoreThresholdDict = v6->_rankingScoreThresholdDict;
    v6->_rankingScoreThresholdDict = (NSDictionary *)v39;

    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v41, v42, objc_opt_class(), 0);
    uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"viewCountBasedAdjustmentParameterDict"];
    viewCountBasedAdjustmentParameterDict = v6->_viewCountBasedAdjustmentParameterDict;
    v6->_viewCountBasedAdjustmentParameterDict = (NSDictionary *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    id v48 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v46, v47, objc_opt_class(), 0);
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"interfaceTypeCountFromSuggestionEngagement"];
    interfaceTypeCountFromSuggestionEngagementDict = v6->_interfaceTypeCountFromSuggestionEngagementDict;
    v6->_interfaceTypeCountFromSuggestionEngagementDict = (NSDictionary *)v49;

    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v51, v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"bprRegularizationFactor"];
    bprRegularizationFactor = v6->_bprRegularizationFactor;
    v6->_bprRegularizationFactor = (NSDictionary *)v54;

    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    long long v58 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v56, v57, objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"pairWiseWeights"];
    pairWiseWeights = v6->_pairWiseWeights;
    v6->_pairWiseWeights = (NSMutableDictionary *)v59;

    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    long long v63 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v61, v62, objc_opt_class(), 0);
    uint64_t v64 = [v4 decodeObjectOfClasses:v63 forKey:@"evergreenEngagementScoreParameterDict"];
    evergreenEngagementScoreParameterDict = v6->_evergreenEngagementScoreParameterDict;
    v6->_evergreenEngagementScoreParameterDict = (NSDictionary *)v64;

    uint64_t v66 = objc_opt_class();
    uint64_t v67 = objc_opt_class();
    uint64_t v68 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v66, v67, objc_opt_class(), 0);
    uint64_t v69 = [v4 decodeObjectOfClasses:v68 forKey:@"curationParameterDict"];
    curationParameterDict = v6->_curationParameterDict;
    v6->_curationParameterDict = (NSDictionary *)v69;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOEventBundleRanking alloc];
  double v5 = [(MOEventBundleRanking *)self configurationManager];
  uint64_t v6 = [(MOEventBundleRanking *)v4 initWithConfigurationManager:v5];

  if (v6)
  {
    [(MOEventBundleRanking *)self frequencyPenalty];
    -[MOEventBundleRanking setFrequencyPenalty:](v6, "setFrequencyPenalty:");
    [(MOEventBundleRanking *)self recommendedTabVisitFIThreshold];
    -[MOEventBundleRanking setRecommendedTabVisitFIThreshold:](v6, "setRecommendedTabVisitFIThreshold:");
    id v7 = [(MOEventBundleRanking *)self richnessWeightsDict];
    id v8 = [v7 copy];
    [(MOEventBundleRanking *)v6 setRichnessWeightsDict:v8];

    uint64_t v9 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
    id v10 = [v9 copy];
    [(MOEventBundleRanking *)v6 setStaticModelParameterMatrix:v10];

    uint64_t v11 = [(MOEventBundleRanking *)self dynamicModelParameterDict];
    id v12 = [v11 copy];
    [(MOEventBundleRanking *)v6 setDynamicModelParameterDict:v12];

    double v13 = [(MOEventBundleRanking *)self heuristicsParameterDict];
    id v14 = [v13 copy];
    [(MOEventBundleRanking *)v6 setHeuristicsParameterDict:v14];

    unint64_t v15 = [(MOEventBundleRanking *)self engagementScoreParameterDict];
    id v16 = [v15 copy];
    [(MOEventBundleRanking *)v6 setEngagementScoreParameterDict:v16];

    uint64_t v17 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
    id v18 = [v17 copy];
    [(MOEventBundleRanking *)v6 setRankingScoreThresholdDict:v18];

    uint64_t v19 = [(MOEventBundleRanking *)self viewCountBasedAdjustmentParameterDict];
    id v20 = [v19 copy];
    [(MOEventBundleRanking *)v6 setViewCountBasedAdjustmentParameterDict:v20];

    uint64_t v21 = [(MOEventBundleRanking *)self interfaceTypeCountFromSuggestionEngagementDict];
    id v22 = [v21 copy];
    [(MOEventBundleRanking *)v6 setInterfaceTypeCountFromSuggestionEngagementDict:v22];

    uint64_t v23 = [(MOEventBundleRanking *)self bprRegularizationFactor];
    id v24 = [v23 copy];
    [(MOEventBundleRanking *)v6 setBprRegularizationFactor:v24];

    id v25 = [(MOEventBundleRanking *)self pairWiseWeights];
    id v26 = [v25 copy];
    [(MOEventBundleRanking *)v6 setPairWiseWeights:v26];

    uint64_t v27 = [(MOEventBundleRanking *)self evergreenEngagementScoreParameterDict];
    id v28 = [v27 copy];
    [(MOEventBundleRanking *)v6 setEvergreenEngagementScoreParameterDict:v28];

    uint64_t v29 = [(MOEventBundleRanking *)self curationParameterDict];
    id v30 = [v29 copy];
    [(MOEventBundleRanking *)v6 setCurationParameterDict:v30];
  }
  return v6;
}

- (void)updateTripMetaDataForRank:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 places];
  id v7 = [v6 count];

  if (v7)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [v5 places];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (!v9)
    {
LABEL_24:

      goto LABEL_25;
    }
    id v10 = v9;
    uint64_t v37 = v5;
    uint64_t v11 = *(void *)v41;
    float v12 = 0.0;
    float v13 = 0.0;
    float v14 = 0.0;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        id v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v17 = [v16 endDate];
        if (v17)
        {
          id v18 = (void *)v17;
          uint64_t v19 = [v16 startDate];

          if (v19)
          {
            id v20 = [v16 endDate];
            uint64_t v21 = [v16 startDate];
            [v20 timeIntervalSinceDate:v21];
            double v23 = v22;

            [v16 distanceToHomeInMiles];
            *(float *)&double v24 = v24;
            if (*(float *)&v24 >= 0.0)
            {
              [v16 distanceToHomeInMiles];
              *(float *)&double v27 = v27;
              [v16 distanceToHomeInMiles:v27];
              *(float *)&double v28 = v28;
              float v14 = v14 + *(float *)&v28 * v23;
            }
            else
            {
              id v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                double v45 = "-[MOEventBundleRanking updateTripMetaDataForRank:]";
                __int16 v46 = 1024;
                int v47 = 3531;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Trip bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
              }

              id v26 = +[NSAssertionHandler currentHandler];
              [v26 handleFailureInMethod:a2 object:self file:@"MOEventBundleRanking.m" lineNumber:3531 description:@"Trip bundle distanceToHomeInMiles is negative (in %s:%d)", "-[MOEventBundleRanking updateTripMetaDataForRank:]", 3531];
            }
            [v16 familiarityIndexLOI];
            *(float *)&double v29 = v29;
            if (*(float *)&v29 == -1.0)
            {
              uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
                -[MOEventBundleRanking updateTripMetaDataForRank:](&v38, v39);
              }
            }
            else
            {
              [v16 familiarityIndexLOI];
              *(float *)&double v30 = v30;
              float v13 = v13 + *(float *)&v30 * v23;
            }
            float v12 = v23 + v12;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v10);

    id v5 = v37;
    if (v12 > 0.0)
    {
      *(float *)&double v32 = v14 / v12;
      uint64_t v33 = +[NSNumber numberWithFloat:v32];
      [v37 addMetaDataForRankForKey:@"DistanceToHome" value:v33];

      *(float *)&double v34 = v12;
      double v35 = +[NSNumber numberWithFloat:v34];
      [v37 addMetaDataForRankForKey:@"VisitDuration" value:v35];

      *(float *)&double v36 = v13 / v12;
      id v8 = +[NSNumber numberWithFloat:v36];
      [v37 addMetaDataForRankForKey:@"FamiliarityIndex" value:v8];
      goto LABEL_24;
    }
  }
LABEL_25:
}

- (float)frequencyPenalty
{
  return self->_frequencyPenalty;
}

- (void)setFrequencyPenalty:(float)a3
{
  self->_float frequencyPenalty = a3;
}

- (double)recommendedTabVisitFIThreshold
{
  return self->_recommendedTabVisitFIThreshold;
}

- (void)setRecommendedTabVisitFIThreshold:(double)a3
{
  self->_recommendedTabVisitFIThreshold = a3;
}

- (NSDictionary)richnessWeightsDict
{
  return self->_richnessWeightsDict;
}

- (void)setRichnessWeightsDict:(id)a3
{
}

- (NSDictionary)staticModelParameterMatrix
{
  return self->_staticModelParameterMatrix;
}

- (void)setStaticModelParameterMatrix:(id)a3
{
}

- (NSDictionary)dynamicModelParameterDict
{
  return self->_dynamicModelParameterDict;
}

- (void)setDynamicModelParameterDict:(id)a3
{
}

- (NSDictionary)heuristicsParameterDict
{
  return self->_heuristicsParameterDict;
}

- (void)setHeuristicsParameterDict:(id)a3
{
}

- (NSDictionary)engagementScoreParameterDict
{
  return self->_engagementScoreParameterDict;
}

- (void)setEngagementScoreParameterDict:(id)a3
{
}

- (float)engagementScoreWeight
{
  return self->_engagementScoreWeight;
}

- (void)setEngagementScoreWeight:(float)a3
{
  self->_engagementScoreWeight = a3;
}

- (NSDictionary)rankingScoreThresholdDict
{
  return self->_rankingScoreThresholdDict;
}

- (void)setRankingScoreThresholdDict:(id)a3
{
}

- (NSString)rankingAlgorithmVersion
{
  return self->_rankingAlgorithmVersion;
}

- (void)setRankingAlgorithmVersion:(id)a3
{
}

- (NSDictionary)viewCountBasedAdjustmentParameterDict
{
  return self->_viewCountBasedAdjustmentParameterDict;
}

- (void)setViewCountBasedAdjustmentParameterDict:(id)a3
{
}

- (NSDictionary)interfaceTypeCountFromSuggestionEngagementDict
{
  return self->_interfaceTypeCountFromSuggestionEngagementDict;
}

- (void)setInterfaceTypeCountFromSuggestionEngagementDict:(id)a3
{
}

- (NSDictionary)bprRegularizationFactor
{
  return self->_bprRegularizationFactor;
}

- (void)setBprRegularizationFactor:(id)a3
{
}

- (NSMutableDictionary)pairWiseWeights
{
  return self->_pairWiseWeights;
}

- (void)setPairWiseWeights:(id)a3
{
}

- (NSDictionary)evergreenEngagementScoreParameterDict
{
  return self->_evergreenEngagementScoreParameterDict;
}

- (void)setEvergreenEngagementScoreParameterDict:(id)a3
{
}

- (NSDictionary)curationParameterDict
{
  return self->_curationParameterDict;
}

- (void)setCurationParameterDict:(id)a3
{
}

- (MOConfigurationManagerBase)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (float)elapsedDaysSinceOnboardingDate
{
  return self->_elapsedDaysSinceOnboardingDate;
}

- (void)setElapsedDaysSinceOnboardingDate:(float)a3
{
  self->_float elapsedDaysSinceOnboardingDate = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_curationParameterDict, 0);
  objc_storeStrong((id *)&self->_evergreenEngagementScoreParameterDict, 0);
  objc_storeStrong((id *)&self->_pairWiseWeights, 0);
  objc_storeStrong((id *)&self->_bprRegularizationFactor, 0);
  objc_storeStrong((id *)&self->_interfaceTypeCountFromSuggestionEngagementDict, 0);
  objc_storeStrong((id *)&self->_viewCountBasedAdjustmentParameterDict, 0);
  objc_storeStrong((id *)&self->_rankingAlgorithmVersion, 0);
  objc_storeStrong((id *)&self->_rankingScoreThresholdDict, 0);
  objc_storeStrong((id *)&self->_engagementScoreParameterDict, 0);
  objc_storeStrong((id *)&self->_heuristicsParameterDict, 0);
  objc_storeStrong((id *)&self->_dynamicModelParameterDict, 0);
  objc_storeStrong((id *)&self->_staticModelParameterMatrix, 0);

  objc_storeStrong((id *)&self->_richnessWeightsDict, 0);
}

- (void)_fillQualityInfoForRanking:(uint64_t)a3 forBundle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_fillQualityInfoForRanking:(uint64_t)a3 forBundle:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_fillQualityInfoForRanking:(uint64_t)a3 forBundle:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_fillHeuristicsInfoForRanking:(void *)a1 forBundle:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  [a1 numFamilyNormalized];
  double v5 = v4;
  [a1 numKidsNormalized];
  double v7 = v6;
  [a1 numFriendsNormalized];
  double v9 = v8;
  [a1 numCoworkersNormalized];
  double v11 = v10;
  [a1 numPetsNormalized];
  double v13 = v12;
  [a1 numOtherPersonsNormalized];
  int v15 = 134219264;
  double v16 = v5;
  __int16 v17 = 2048;
  double v18 = v7;
  __int16 v19 = 2048;
  double v20 = v9;
  __int16 v21 = 2048;
  double v22 = v11;
  __int16 v23 = 2048;
  double v24 = v13;
  __int16 v25 = 2048;
  double v26 = v14;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Person relationship heuristics: numFamily %.f,numKids %.f,numFriends %.f,numCoworkers %.f,numPets %.f,numOtherPersons %.f,", (uint8_t *)&v15, 0x3Eu);
}

- (void)_fillHeuristicsInfoForRanking:(void *)a1 forBundle:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  float v4 = [a1 bundleIdentifier];
  double v5 = [a1 startDate];
  float v6 = [a1 endDate];
  double v7 = [a1 place];
  float v8 = [v7 poiCategory];
  int v9 = 138413058;
  float v10 = v4;
  __int16 v11 = 2112;
  float v12 = v5;
  __int16 v13 = 2112;
  float v14 = v6;
  __int16 v15 = 2112;
  double v16 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Bundle contains sensitive POI: bundleID %@, startDate %@, endDate %@, poiCategory %@", (uint8_t *)&v9, 0x2Au);
}

- (void)_fillHeuristicsInfoForRanking:(void *)a1 forBundle:.cold.3(void *a1)
{
  uint64_t v1 = [a1 metaDataForRank];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "Filled in metadata for rank for trip bundle: %@", v4, v5, v6, v7, v8);
}

- (void)_fillRichnessInfoForRanking:forBundle:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_1((void *)&_mh_execute_header, v0, v1, "Evergreen prompt exists", v2);
}

- (void)_fillRichnessInfoForRanking:(void *)a1 forBundle:.cold.2(void *a1)
{
  uint64_t v1 = [a1 evergreenType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "Evergreen type is set to %@", v4, v5, v6, v7, v8);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: universe", v1, 2u);
}

- (double)initWithConfigurationManager:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "User onboarding date is not available. Setting elapsedDaysSinceOnboardingDate to %.3f for default behavior", a5, a6, a7, a8, 0);
  return result;
}

- (void)initWithConfigurationManager:(NSObject *)a3 .cold.3(uint64_t a1, float *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(double *)&v3[14] = *a2;
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, (uint64_t)a2, a3, "User onboarding date %@, elapsedDaysSinceOnboardingDate %.3f", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

- (double)initWithConfigurationManager:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "EngagementScoreWeight is set to %f", a5, a6, a7, a8, 0);
  return result;
}

- (void)_calculateRankingScore:(uint64_t)a1 withMinRecommendedBundleCountRequirement:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = [OUTLINED_FUNCTION_2_1(a1, a2) count];
  *uint64_t v3 = 134217984;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "RankingDict count After filtering for ones shown in Recent tab:%lu");
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.2()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "Min bundle date:%@, max bundle date:%@");
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "diversityCoefficientDict:%@", v2, v3, v4, v5, v6);
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "visibleInterfaceTypeAndCountDict:%@", v2, v3, v4, v5, v6);
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.5()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "workoutTypesInWeeklySummary=%@ , workoutTypesInWorkoutRoutine=%@");
}

- (void)_calculateRankingScore:(os_log_t)log withMinRecommendedBundleCountRequirement:.cold.6(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "isWorkoutRoutineInRecommendedTab=%d , isWorkoutWeeklySummaryInRecommendedTab=%d", (uint8_t *)v3, 0xEu);
}

- (void)_calculateRankingScore:(unsigned char *)a1 withMinRecommendedBundleCountRequirement:(unsigned char *)a2 .cold.7(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_4(a1, a2);
  OUTLINED_FUNCTION_9_1((void *)&_mh_execute_header, v2, (uint64_t)v2, "Evergreen type is not found. Use random score instead.", v3);
}

- (void)_calculateRankingScore:(uint64_t)a1 withMinRecommendedBundleCountRequirement:(uint64_t)a2 .cold.8(uint64_t a1, uint64_t a2)
{
  __int16 v4 = [OUTLINED_FUNCTION_2_1(a1, a2) evergreenType];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "Evergreen engagement score parameter is not set for evergreenType %@. Use default dynamic param.");
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"suggestionIdentifier"];
  float v10 = [a2 objectForKeyedSubscript:@"bundleIdentifier"];
  OUTLINED_FUNCTION_1_9((void *)&_mh_execute_header, v4, v5, "Ordinal rank %lu:  SuggestionID:%@, bundleID:%@", v6, v7, v8, v9, 2u);
}

- (void)_mergeScoresToBundles:(NSObject *)a3 usingScore:.cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5 = 134218754;
  id v6 = [a1 count];
  __int16 v7 = 2048;
  id v8 = [a2 count];
  __int16 v9 = 2080;
  float v10 = "-[MOEventBundleRanking _mergeScoresToBundles:usingScore:]";
  __int16 v11 = 1024;
  int v12 = 2531;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Mismatch between bundle count %lu and score array count %lu (in %s:%d)", (uint8_t *)&v5, 0x26u);
}

- (void)_submitEventBundleRankingAnalytics:(uint64_t)a3 withRankingInput:(uint64_t)a4 andSubmissionDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_1((void *)&_mh_execute_header, v0, v1, "Completed aggregated Ranking CoreAnalytics submission", v2);
}

- (void)_submitEventBundleRankingAnalytics:(uint8_t *)buf withRankingInput:(void *)a2 andSubmissionDate:(os_log_t)log .cold.3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = @"com.apple.Moments.MOEventBundleRanking";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CA payload (%@) is nil. Skip submission", buf, 0xCu);
}

- (void)_submitEventBundleRankingAnalytics:(unsigned char *)a1 withRankingInput:(unsigned char *)a2 andSubmissionDate:.cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_4(a1, a2);
  OUTLINED_FUNCTION_9_1((void *)&_mh_execute_header, v2, (uint64_t)v2, "Submitted ranking CA message", v3);
}

- (void)_submitEventBundleRankingAnalytics:(os_log_t)log withRankingInput:andSubmissionDate:.cold.5(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:]";
  __int16 v3 = 1024;
  int v4 = 2596;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Mismatch between score dict and input dict sizes (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

- (void)_lineSearch:initialParams:With:And:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Num iterations in BFGS - _lineSearch is %lu", v2, v3, v4, v5, v6);
}

- (void)_lineSearch:(uint64_t)a3 initialParams:(uint64_t)a4 With:(uint64_t)a5 And:(uint64_t)a6 handler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1179_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_9((void *)&_mh_execute_header, v2, v3, "%@, bundle idx, %lu, contact identifier, %@", v4, v5, v6, v7, v8);
}

- (void)safeSavePropertyToDictionary:withKey:andValue:.cold.1()
{
  OUTLINED_FUNCTION_0_8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "key-value pair contains nil value (key=%@, value=%@). Skip dict update", v1, 0x16u);
}

- (void)updateTripMetaDataForRank:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_4(a1, a2);
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Trip bundle familiarity index is -1", v3, 2u);
}

@end