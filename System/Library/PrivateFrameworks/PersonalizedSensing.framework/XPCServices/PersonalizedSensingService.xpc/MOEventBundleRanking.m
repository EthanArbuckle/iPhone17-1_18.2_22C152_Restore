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
- (void)setRankingScoreThresholdDict:(id)a3;
- (void)setRecommendedTabVisitFIThreshold:(double)a3;
- (void)setRichnessWeightsDict:(id)a3;
- (void)setStaticModelParameterMatrix:(id)a3;
- (void)setViewCountBasedAdjustmentParameterDict:(id)a3;
- (void)updateEngagementScoreParamsUsingBFGS;
- (void)updateTripMetaDataForRank:(id)a3;
@end

@implementation MOEventBundleRanking

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_0 != -1) {
    dispatch_once(&defineClassCollections_onceToken_0, &__block_literal_global_5);
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
  v8 = (void *)neutralPOIcategories;
  neutralPOIcategories = v7;

  v9 = (void *)enrichedActionTags;
  enrichedActionTags = (uint64_t)&off_1000B8198;

  v10 = (void *)interestingTimeTags;
  interestingTimeTags = (uint64_t)&off_1000B81B0;

  v11 = (void *)visitActionTags;
  visitActionTags = (uint64_t)&off_1000B81C8;

  v12 = (void *)visitSubtypeVariants;
  visitSubtypeVariants = (uint64_t)&off_1000B81E0;

  v13 = (void *)dailyMediaSubtypeVariants;
  dailyMediaSubtypeVariants = (uint64_t)&off_1000B81F8;

  v14 = (void *)MediaWeeklySummarySubtypeVariants;
  MediaWeeklySummarySubtypeVariants = (uint64_t)&off_1000B8210;

  v15 = (void *)timeAtHomeSubtypeVariants;
  timeAtHomeSubtypeVariants = (uint64_t)&off_1000B8228;

  v16 = (void *)phoneSensedWalkingVariants;
  phoneSensedWalkingVariants = (uint64_t)&off_1000B8240;

  v17 = (void *)workoutSubtypeVariants;
  workoutSubtypeVariants = (uint64_t)&off_1000B8258;

  v18 = (void *)thirdPartyMediaSubtypeVariants;
  thirdPartyMediaSubtypeVariants = (uint64_t)&off_1000B8270;

  uint64_t v19 = +[NSSet setWithObject:&stru_1000AC528];
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
    objc_msgSend(v5, "setTimeCorrelationScoreFeature:");
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
    objc_msgSend(v6, "setInterestingPOIFeature:");
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
    objc_msgSend(v6, "numFamilyNormalized", v70);
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
    objc_msgSend(v6, "numFriendsNormalized", v73);
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
    objc_msgSend(v6, "numPetsNormalized", v76);
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
  objc_msgSend(v6, "setIsFamilyContact:");

  v120 = [v7 metaDataForRank];
  v121 = [v120 objectForKeyedSubscript:@"isCoworkerContact"];
  [v121 floatValue];
  objc_msgSend(v6, "setIsCoworkerContact:");

  v122 = [v7 metaDataForRank];
  v123 = [v122 objectForKeyedSubscript:@"isRepetitiveContact"];
  objc_msgSend(v6, "setIsRepetitiveContact:", objc_msgSend(v123, "BOOLValue"));

  v124 = [v7 metaDataForRank];
  v125 = [v124 objectForKeyedSubscript:@"isGroupConversation"];
  objc_msgSend(v6, "setGroupConversationFeature:", objc_msgSend(v125, "BOOLValue"));

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
  objc_msgSend(v6, "setMediaScoreFeatureNormalized:");

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
  objc_msgSend(v6, "setPeopleDensityMaxNormalized:", v209, v181);
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
    double v234 = (double)(unint64_t)objc_msgSend(v228, "count", v234) / v232;
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

  objc_msgSend(v6, "setIsBundleAggregated:", objc_msgSend(v7, "isAggregatedAndSuppressed"));
  objc_msgSend(v6, "setSummarizationGranularity:", objc_msgSend(v7, "summarizationGranularity"));
  [v6 setAvgSubBundleGoodnessScores:0.0];
  if ([v7 interfaceType] == (id)15)
  {
    v241 = [v7 clusterMetadata];
    v242 = [v241 subBundleGoodnessScores];
    v243 = [v242 valueForKeyPath:@"@avg.self"];
    [v243 floatValue];
    objc_msgSend(v6, "setAvgSubBundleGoodnessScores:");
  }
}

- (void)_fillRichnessInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(v5, "setBundleInterfaceType:", objc_msgSend(v6, "interfaceType"));
  objc_msgSend(v5, "setBundleSubType:", objc_msgSend(v6, "bundleSubType"));
  objc_msgSend(v5, "setBundleSuperType:", objc_msgSend(v6, "bundleSuperType"));
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
  v108 = __Block_byref_object_copy__4;
  v109 = __Block_byref_object_dispose__4;
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
    v104[3] = &unk_1000A6F30;
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
    v108 = __Block_byref_object_copy__4;
    v109 = __Block_byref_object_dispose__4;
    id v110 = (id)objc_opt_new();
    uint64_t v35 = [v6 persons];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_2;
    v103[3] = &unk_1000A6F58;
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
  v108 = __Block_byref_object_copy__4;
  v109 = __Block_byref_object_dispose__4;
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
    v102[3] = &unk_1000A6F80;
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
  v100[3] = &unk_1000A5F50;
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

  [v85 setObject:&off_1000B8330 forKey:@"RankingRichnessSecondaryPriorityScoreKey"];
  [v85 setObject:&off_1000B8330 forKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];
  [v5 setNumPhotoAssetsResourcesNormalized:0.0];
  [v5 setNumMediaTypeResourcesNormalized:0.0];
  float v60 = objc_opt_new();
  [v60 setObject:v85 forKey:@"NumUniqueResourceTypesNormalizedKey"];
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_937;
  v92[3] = &unk_1000A6FA8;
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
          unsigned __int8 v13 = [v12 isEqual:&off_1000B6F00];

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
        v49[3] = &unk_1000A6FD0;
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
      objc_msgSend(v5, "setNumStateOfMindEventsNormalized:", v47, v45);
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
  objc_msgSend(v24, "setSuggestionIsDeleted:", objc_msgSend(v6, "hasSuggestionEngagementEvent:", @"suggestionsDeleted"));
  objc_msgSend(v24, "setSuggestionIsSelected:", objc_msgSend(v6, "hasSuggestionEngagementEvent:", @"suggestionsSelected"));
  objc_msgSend(v24, "setSuggestionQuickAddEntry:", objc_msgSend(v6, "hasSuggestionEngagementEvent:", @"suggestionsQuickAddEntry"));
  objc_msgSend(v24, "setJournalEntryIsEdited:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", @"appEntryEdited"));
  objc_msgSend(v24, "setJournalEntryIsCreated:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", @"appEntryCreated"));
  objc_msgSend(v24, "setJournalEntryIsCancelled:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", @"appEntryCancelled"));
  objc_msgSend(v24, "setJournalEntryIsDeleted:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", @"appEntryDeleted"));
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
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking initWithUniverse:]();
    }

    id v5 = 0;
  }

  return v5;
}

- (MOEventBundleRanking)initWithConfigurationManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v554.receiver = self;
    v554.super_class = (Class)MOEventBundleRanking;
    id v6 = [(MOEventBundleRanking *)&v554 init];
    if (v6)
    {
      id v532 = v5;
      +[MOEventBundleRanking defineClassCollections];
      rankingAlgorithmVersion = v6->_rankingAlgorithmVersion;
      v6->_rankingAlgorithmVersion = (NSString *)@"17.2.0";

      p_configurationManager = (void **)&v6->_configurationManager;
      objc_storeStrong((id *)&v6->_configurationManager, a3);
      v6->_isInternalBuild = +[MOPlatformInfo isInternalBuild];
      configurationManager = v6->_configurationManager;
      float v9 = &AnalyticsSendEventLazy_ptr;
      float v10 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"diversityCoefficientAlpha"];
      LODWORD(v11) = 1120403456;
      [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v10 withFallback:v11];
      v6->_frequencyPenalty = v12;

      float v13 = v6->_configurationManager;
      float v14 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"engagementScoreWeight"];
      LODWORD(v15) = 1036831949;
      [(MOConfigurationManagerBase *)v13 getFloatSettingForKey:v14 withFallback:v15];
      v6->_engagementScoreWeight = v16;

      float v17 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[MOEventBundleRanking initWithConfigurationManager:].cold.4((uint64_t)&v6->_engagementScoreWeight, v17, v18, v19, v20, v21, v22, v23);
      }

      HIDWORD(v24) = 1072483532;
      *(float *)&double v24 = 0.9;
      [(MOConfigurationManagerBase *)v6->_configurationManager getFloatSettingForKey:@"VA_RecommendedTabVisitFIThreshold" withFallback:v24];
      v6->_recommendedTabVisitFIThreshold = v25;
      float v26 = (NSDictionary *)objc_opt_new();
      double v27 = v6->_configurationManager;
      double v28 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"distanceToHomeThreshold"];
      LODWORD(v29) = 10.0;
      [(MOConfigurationManagerBase *)v27 getFloatSettingForKey:v28 withFallback:v29];
      double v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v30 forKeyedSubscript:@"distanceToHomeThreshold"];

      double v31 = v6->_configurationManager;
      float v32 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"callDurationThreshold"];
      LODWORD(v33) = 1172373504;
      [(MOConfigurationManagerBase *)v31 getFloatSettingForKey:v32 withFallback:v33];
      double v34 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v34 forKeyedSubscript:@"callDurationThreshold"];

      float v35 = v6->_configurationManager;
      BOOL v36 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"workoutDurationThreshold"];
      LODWORD(v37) = 1180762112;
      [(MOConfigurationManagerBase *)v35 getFloatSettingForKey:v36 withFallback:v37];
      float v38 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v38 forKeyedSubscript:@"workoutDurationThreshold"];

      double v39 = v6->_configurationManager;
      float v40 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"WeeklySummaryWorkoutDurationThreshold"];
      LODWORD(v41) = 1187307520;
      [(MOConfigurationManagerBase *)v39 getFloatSettingForKey:v40 withFallback:v41];
      float v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v42 forKeyedSubscript:@"WeeklySummaryWorkoutDurationThreshold"];

      float v43 = v6->_configurationManager;
      double v44 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"timeAtHomeDurationThreshold"];
      LODWORD(v45) = 1202241536;
      [(MOConfigurationManagerBase *)v43 getFloatSettingForKey:v44 withFallback:v45];
      uint64_t v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v46 forKeyedSubscript:@"timeAtHomeDurationThreshold"];

      v47 = v6->_configurationManager;
      double v48 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"FIDownRankThreshold"];
      LODWORD(v49) = 0.75;
      [(MOConfigurationManagerBase *)v47 getFloatSettingForKey:v48 withFallback:v49];
      uint64_t v50 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v50 forKeyedSubscript:@"FIDownRankThreshold"];

      id v51 = v6->_configurationManager;
      uint64_t v52 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"burstyInteractionCountThreshold"];
      LODWORD(v53) = 1125515264;
      [(MOConfigurationManagerBase *)v51 getFloatSettingForKey:v52 withFallback:v53];
      long long v54 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v54 forKeyedSubscript:@"burstyInteractionCountThreshold"];

      long long v55 = v6->_configurationManager;
      long long v56 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxPeopleCountFromSocialContext"];
      LODWORD(v57) = 1115684864;
      [(MOConfigurationManagerBase *)v55 getFloatSettingForKey:v56 withFallback:v57];
      double v58 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v58 forKeyedSubscript:@"maxPeopleCountFromSocialContext"];

      double v59 = v6->_configurationManager;
      float v60 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"mediaPlayTimeThreshold"];
      LODWORD(v61) = 1177075712;
      [(MOConfigurationManagerBase *)v59 getFloatSettingForKey:v60 withFallback:v61];
      id v62 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v62 forKeyedSubscript:@"mediaPlayTimeThreshold"];

      uint64_t v63 = v6->_configurationManager;
      float v64 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weeklySummaryMediaPlayTimeThreshold"];
      LODWORD(v65) = 1187307520;
      [(MOConfigurationManagerBase *)v63 getFloatSettingForKey:v64 withFallback:v65];
      id v66 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v66 forKeyedSubscript:@"weeklySummaryMediaPlayTimeThreshold"];

      float v67 = v6->_configurationManager;
      float v68 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"shareCountThreshold"];
      LODWORD(v69) = 5.0;
      [(MOConfigurationManagerBase *)v67 getFloatSettingForKey:v68 withFallback:v69];
      double v70 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v70 forKeyedSubscript:@"shareCountThreshold"];

      double v71 = v6->_configurationManager;
      float v72 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"contactHoldOffThreshold"];
      LODWORD(v73) = -921458688;
      [(MOConfigurationManagerBase *)v71 getFloatSettingForKey:v72 withFallback:v73];
      float v74 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v74 forKeyedSubscript:@"contactHoldOffThreshold"];

      double v75 = v6->_configurationManager;
      double v76 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"stateOfMindLabelCountThreshold"];
      LODWORD(v77) = 5.0;
      [(MOConfigurationManagerBase *)v75 getFloatSettingForKey:v76 withFallback:v77];
      float v78 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v78 forKeyedSubscript:@"stateOfMindLabelCountThreshold"];

      float v79 = v6->_configurationManager;
      double v80 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"stateOfMindDomainCountThreshold"];
      LODWORD(v81) = 5.0;
      [(MOConfigurationManagerBase *)v79 getFloatSettingForKey:v80 withFallback:v81];
      BOOL v82 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v82 forKeyedSubscript:@"stateOfMindDomainCountThreshold"];

      id v83 = v6->_configurationManager;
      id v84 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForVisitSubTypeVariants"];
      LODWORD(v85) = -1130113270;
      [(MOConfigurationManagerBase *)v83 getFloatSettingForKey:v84 withFallback:v85];
      id v86 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v86 forKeyedSubscript:@"suggestionAcceptThresholdForVisitSubTypeVariants"];

      v87 = v6->_configurationManager;
      long long v88 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForTripSubType"];
      LODWORD(v89) = -1130113270;
      [(MOConfigurationManagerBase *)v87 getFloatSettingForKey:v88 withFallback:v89];
      long long v90 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v90 forKeyedSubscript:@"suggestionAcceptThresholdForTripSubType"];

      long long v91 = v6->_configurationManager;
      v92 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForWorkoutSubtype"];
      LODWORD(v93) = -1130113270;
      [(MOConfigurationManagerBase *)v91 getFloatSettingForKey:v92 withFallback:v93];
      id v94 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v94 forKeyedSubscript:@"suggestionAcceptThresholdForWorkoutSubtype"];

      id v95 = v6->_configurationManager;
      long long v96 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForMotionActivityWalkingSubtype"];
      LODWORD(v97) = -1130113270;
      [(MOConfigurationManagerBase *)v95 getFloatSettingForKey:v96 withFallback:v97];
      long long v98 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v98 forKeyedSubscript:@"suggestionAcceptThresholdForMotionActivityWalkingSubtype"];

      long long v99 = v6->_configurationManager;
      double v100 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForWorkoutWeeklySummarySubType"];
      LODWORD(v101) = -1.0;
      [(MOConfigurationManagerBase *)v99 getFloatSettingForKey:v100 withFallback:v101];
      v102 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v102 forKeyedSubscript:@"suggestionAcceptThresholdForWorkoutWeeklySummarySubType"];

      float v103 = v6->_configurationManager;
      float v104 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForContactSubType"];
      LODWORD(v105) = -1.0;
      [(MOConfigurationManagerBase *)v103 getFloatSettingForKey:v104 withFallback:v105];
      v106 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v106 forKeyedSubscript:@"suggestionAcceptThresholdForContactSubType"];

      uint64_t v107 = v6->_configurationManager;
      v108 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForContactWeeklySummarySubType"];
      LODWORD(v109) = 1023671095;
      [(MOConfigurationManagerBase *)v107 getFloatSettingForKey:v108 withFallback:v109];
      id v110 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v110 forKeyedSubscript:@"suggestionAcceptThresholdForContactWeeklySummarySubType"];

      double v111 = v6->_configurationManager;
      v112 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForDailyMediaVariants"];
      LODWORD(v113) = -1.0;
      [(MOConfigurationManagerBase *)v111 getFloatSettingForKey:v112 withFallback:v113];
      unsigned int v114 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v114 forKeyedSubscript:@"suggestionAcceptThresholdForDailyMediaVariants"];

      v115 = v6->_configurationManager;
      v116 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForWeeklyMediaSummaryVariants"];
      LODWORD(v117) = -1.0;
      [(MOConfigurationManagerBase *)v115 getFloatSettingForKey:v116 withFallback:v117];
      v118 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v118 forKeyedSubscript:@"suggestionAcceptThresholdForWeeklyMediaSummaryVariants"];

      v119 = v6->_configurationManager;
      v120 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"];
      LODWORD(v121) = -1.0;
      [(MOConfigurationManagerBase *)v119 getFloatSettingForKey:v120 withFallback:v121];
      v122 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v122 forKeyedSubscript:@"suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"];

      v123 = v6->_configurationManager;
      v124 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForVisitSubTypeVariants"];
      LODWORD(v125) = 1017370378;
      [(MOConfigurationManagerBase *)v123 getFloatSettingForKey:v124 withFallback:v125];
      v126 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v126 forKeyedSubscript:@"suggestionRecommendThresholdForVisitSubTypeVariants"];

      v127 = v6->_configurationManager;
      float v128 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForTripSubType"];
      LODWORD(v129) = 1017370378;
      [(MOConfigurationManagerBase *)v127 getFloatSettingForKey:v128 withFallback:v129];
      v130 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v130 forKeyedSubscript:@"suggestionRecommendThresholdForTripSubType"];

      v131 = v6->_configurationManager;
      float v132 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForWorkoutSubtype"];
      LODWORD(v133) = 1025758986;
      [(MOConfigurationManagerBase *)v131 getFloatSettingForKey:v132 withFallback:v133];
      double v134 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v134 forKeyedSubscript:@"suggestionRecommendThresholdForWorkoutSubtype"];

      v135 = v6->_configurationManager;
      v136 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForMotionActivityWalkingSubtype"];
      LODWORD(v137) = 1017370378;
      [(MOConfigurationManagerBase *)v135 getFloatSettingForKey:v136 withFallback:v137];
      v138 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v138 forKeyedSubscript:@"suggestionRecommendThresholdForMotionActivityWalkingSubtype"];

      v139 = v6->_configurationManager;
      float v140 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForWorkoutWeeklySummarySubType"];
      LODWORD(v141) = 1025758986;
      [(MOConfigurationManagerBase *)v139 getFloatSettingForKey:v140 withFallback:v141];
      v142 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v142 forKeyedSubscript:@"suggestionRecommendThresholdForWorkoutWeeklySummarySubType"];

      v143 = v6->_configurationManager;
      v144 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForContactSubType"];
      LODWORD(v145) = 1028443341;
      [(MOConfigurationManagerBase *)v143 getFloatSettingForKey:v144 withFallback:v145];
      float v146 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v146 forKeyedSubscript:@"suggestionRecommendThresholdForContactSubType"];

      v147 = v6->_configurationManager;
      v148 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForContactWeeklySummarySubType"];
      LODWORD(v149) = 1023671095;
      [(MOConfigurationManagerBase *)v147 getFloatSettingForKey:v148 withFallback:v149];
      v150 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v150 forKeyedSubscript:@"suggestionRecommendThresholdForContactWeeklySummarySubType"];

      float v151 = v6->_configurationManager;
      float v152 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForDailyMediaVariants"];
      LODWORD(v153) = -1.0;
      [(MOConfigurationManagerBase *)v151 getFloatSettingForKey:v152 withFallback:v153];
      v154 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v154 forKeyedSubscript:@"suggestionRecommendThresholdForDailyMediaVariants"];

      v155 = v6->_configurationManager;
      v156 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForWeeklyMediaSummaryVariants"];
      LODWORD(v157) = -1.0;
      [(MOConfigurationManagerBase *)v155 getFloatSettingForKey:v156 withFallback:v157];
      unsigned int v158 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v158 forKeyedSubscript:@"suggestionRecommendThresholdForWeeklyMediaSummaryVariants"];

      float v159 = v6->_configurationManager;
      v160 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"];
      LODWORD(v161) = 1025758986;
      [(MOConfigurationManagerBase *)v159 getFloatSettingForKey:v160 withFallback:v161];
      int v162 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v162 forKeyedSubscript:@"suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"];

      v163 = v6->_configurationManager;
      v164 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"summarizationThresholdForVisitSubTypeVariants"];
      LODWORD(v165) = -1130113270;
      [(MOConfigurationManagerBase *)v163 getFloatSettingForKey:v164 withFallback:v165];
      float v166 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v166 forKeyedSubscript:@"summarizationThresholdForVisitSubTypeVariants"];

      v167 = v6->_configurationManager;
      v168 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"summarizationThresholdForWorkoutSubType"];
      LODWORD(v169) = -1130113270;
      [(MOConfigurationManagerBase *)v167 getFloatSettingForKey:v168 withFallback:v169];
      double v170 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v170 forKeyedSubscript:@"summarizationThresholdForWorkoutSubType"];

      v171 = v6->_configurationManager;
      v172 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"summarizationThresholdForMotionActivityWalkingSubType"];
      LODWORD(v173) = -1130113270;
      [(MOConfigurationManagerBase *)v171 getFloatSettingForKey:v172 withFallback:v173];
      float v174 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v174 forKeyedSubscript:@"summarizationThresholdForMotionActivityWalkingSubType"];

      double v175 = v6->_configurationManager;
      v176 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"tripSummarizationThresholdForVisitSubType"];
      LODWORD(v177) = 1025758986;
      [(MOConfigurationManagerBase *)v175 getFloatSettingForKey:v176 withFallback:v177];
      float v178 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v26 setObject:v178 forKeyedSubscript:@"tripSummarizationThresholdForVisitSubType"];

      float v179 = v6->_configurationManager;
      v180 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"tripSummarizationThresholdForWorkoutSubType"];
      LODWORD(v181) = -1130113270;
      [(MOConfigurationManagerBase *)v179 getFloatSettingForKey:v180 withFallback:v181];
      double v182 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v531 = v26;
      [(NSDictionary *)v26 setObject:v182 forKeyedSubscript:@"tripSummarizationThresholdForWorkoutSubType"];

      double v183 = (NSDictionary *)objc_opt_new();
      v184 = v6->_configurationManager;
      v185 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectWorkVisitWithPhotos"];
      double v186 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v184 getBoolSettingForKey:v185 withFallback:0]];
      [(NSDictionary *)v183 setObject:v186 forKeyedSubscript:@"rejectWorkVisitWithPhotos"];

      double v187 = v6->_configurationManager;
      v188 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectWorkVisitWithNoPhoto"];
      v189 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v187 getBoolSettingForKey:v188 withFallback:1]];
      [(NSDictionary *)v183 setObject:v189 forKeyedSubscript:@"rejectWorkVisitWithNoPhoto"];

      double v190 = v6->_configurationManager;
      double v191 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectShortVisit"];
      v192 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v190 getBoolSettingForKey:v191 withFallback:0]];
      [(NSDictionary *)v183 setObject:v192 forKeyedSubscript:@"rejectShortVisit"];

      v193 = v6->_configurationManager;
      double v194 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"shortVisitDurationThresholdInSec"];
      LODWORD(v195) = 1150681088;
      [(MOConfigurationManagerBase *)v193 getFloatSettingForKey:v194 withFallback:v195];
      v196 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v183 setObject:v196 forKeyedSubscript:@"shortVisitDurationThresholdInSec"];

      v197 = v6->_configurationManager;
      float v198 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"rejectSignificantContactWithHighSignificanceScore"];
      double v199 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v197 getBoolSettingForKey:v198 withFallback:0]];
      [(NSDictionary *)v183 setObject:v199 forKeyedSubscript:@"rejectSignificantContactWithHighSignificanceScore"];

      double v200 = v6->_configurationManager;
      v201 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"highContactSignificanceScoreThreshold"];
      LODWORD(v202) = 1064514355;
      [(MOConfigurationManagerBase *)v200 getFloatSettingForKey:v201 withFallback:v202];
      double v203 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v183 setObject:v203 forKeyedSubscript:@"highContactSignificanceScoreThreshold"];

      float v204 = v6->_configurationManager;
      float v205 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"minSensedBundleCountInRecommendedTab"];
      double v206 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v204 getIntegerSettingForKey:v205 withFallback:10]];
      [(NSDictionary *)v183 setObject:v206 forKeyedSubscript:@"minSensedBundleCountInRecommendedTab"];

      v207 = v6->_configurationManager;
      v208 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxDaysInRecommendedTabForWorkoutRoutine"];
      LODWORD(v209) = 7.0;
      [(MOConfigurationManagerBase *)v207 getFloatSettingForKey:v208 withFallback:v209];
      double v210 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v183 setObject:v210 forKeyedSubscript:@"maxDaysInRecommendedTabForWorkoutRoutine"];

      float v211 = v6->_configurationManager;
      v212 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxDaysInRecommendedTabForContact"];
      LODWORD(v213) = 3.0;
      [(MOConfigurationManagerBase *)v211 getFloatSettingForKey:v212 withFallback:v213];
      float v214 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v183 setObject:v214 forKeyedSubscript:@"maxDaysInRecommendedTabForContact"];

      float v215 = v6->_configurationManager;
      v216 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxDaysInRecommendedTabForStateOfMind"];
      LODWORD(v217) = 2.0;
      [(MOConfigurationManagerBase *)v215 getFloatSettingForKey:v216 withFallback:v217];
      float v218 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v183 setObject:v218 forKeyedSubscript:@"maxDaysInRecommendedTabForStateOfMind"];

      double v219 = v6->_configurationManager;
      v220 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"daysToSuppressCoarseSummaryAfterOnboarding"];
      LODWORD(v221) = 7.0;
      [(MOConfigurationManagerBase *)v219 getFloatSettingForKey:v220 withFallback:v221];
      v222 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v533 = v183;
      [(NSDictionary *)v183 setObject:v222 forKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding"];

      v223 = objc_opt_new();
      double v224 = v6->_configurationManager;
      double v225 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForInterestingPOI"];
      LODWORD(v226) = 1024148374;
      [(MOConfigurationManagerBase *)v224 getFloatSettingForKey:v225 withFallback:v226];
      v227 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v227 forKeyedSubscript:@"weightForInterestingPOI"];

      v228 = v6->_configurationManager;
      v229 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForDistanceFromHome"];
      LODWORD(v230) = 1024953680;
      [(MOConfigurationManagerBase *)v228 getFloatSettingForKey:v229 withFallback:v230];
      double v231 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v231 forKeyedSubscript:@"weightForDistanceFromHome"];

      double v232 = v6->_configurationManager;
      double v233 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForCallDuration"];
      LODWORD(v234) = 1041865114;
      [(MOConfigurationManagerBase *)v232 getFloatSettingForKey:v233 withFallback:v234];
      v235 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v235 forKeyedSubscript:@"weightForCallDuration"];

      v236 = v6->_configurationManager;
      double v237 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForBurstyInteractionCount"];
      LODWORD(v238) = 1028443341;
      [(MOConfigurationManagerBase *)v236 getFloatSettingForKey:v237 withFallback:v238];
      v239 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v239 forKeyedSubscript:@"weightForBurstyInteractionCount"];

      double v240 = v6->_configurationManager;
      v241 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForMultipleInteractionTypes"];
      [(MOConfigurationManagerBase *)v240 getFloatSettingForKey:v241 withFallback:0.0];
      v242 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v242 forKeyedSubscript:@"weightForMultipleInteractionTypes"];

      v243 = v6->_configurationManager;
      v244 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForContactLocationWork"];
      [(MOConfigurationManagerBase *)v243 getFloatSettingForKey:v244 withFallback:0.0];
      v245 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v245 forKeyedSubscript:@"weightForContactLocationWork"];

      long long v246 = v6->_configurationManager;
      long long v247 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForGroupConversation"];
      [(MOConfigurationManagerBase *)v246 getFloatSettingForKey:v247 withFallback:0.0];
      long long v248 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v248 forKeyedSubscript:@"weightForGroupConversation"];

      long long v249 = v6->_configurationManager;
      v250 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPCountMax"];
      [(MOConfigurationManagerBase *)v249 getFloatSettingForKey:v250 withFallback:0.0];
      v251 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v251 forKeyedSubscript:@"weightForPCountMax"];

      v252 = v6->_configurationManager;
      v253 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPCountWeightedAverage"];
      LODWORD(v254) = 1008981770;
      [(MOConfigurationManagerBase *)v252 getFloatSettingForKey:v253 withFallback:v254];
      v255 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v255 forKeyedSubscript:@"weightForPCountWeightedAverage"];

      v256 = v6->_configurationManager;
      v257 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPDensityWeightedAverage"];
      LODWORD(v258) = 1008981770;
      [(MOConfigurationManagerBase *)v256 getFloatSettingForKey:v257 withFallback:v258];
      v259 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v259 forKeyedSubscript:@"weightForPDensityWeightedAverage"];

      v260 = v6->_configurationManager;
      v261 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForPCountWeightedSum"];
      [(MOConfigurationManagerBase *)v260 getFloatSettingForKey:v261 withFallback:0.0];
      v262 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v262 forKeyedSubscript:@"weightForPCountWeightedSum"];

      v263 = v6->_configurationManager;
      v264 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForItemFromMe"];
      LODWORD(v265) = 1017370378;
      [(MOConfigurationManagerBase *)v263 getFloatSettingForKey:v264 withFallback:v265];
      v266 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v266 forKeyedSubscript:@"weightForItemFromMe"];

      v267 = v6->_configurationManager;
      v268 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightShareCountFeature"];
      LODWORD(v269) = 1017370378;
      [(MOConfigurationManagerBase *)v267 getFloatSettingForKey:v268 withFallback:v269];
      v270 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v270 forKeyedSubscript:@"weightShareCountFeature"];

      v271 = v6->_configurationManager;
      v272 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForTimeAtHomeDuration"];
      [(MOConfigurationManagerBase *)v271 getFloatSettingForKey:v272 withFallback:0.0];
      v273 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v273 forKeyedSubscript:@"weightForTimeAtHomeDuration"];

      v274 = v6->_configurationManager;
      v275 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForWorkoutDurationNormalized"];
      LODWORD(v276) = 1050924810;
      [(MOConfigurationManagerBase *)v274 getFloatSettingForKey:v275 withFallback:v276];
      v277 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v277 forKeyedSubscript:@"weightForWorkoutDurationNormalized"];

      v278 = v6->_configurationManager;
      v279 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForFamiliarityIndex"];
      LODWORD(v280) = 1030322389;
      [(MOConfigurationManagerBase *)v278 getFloatSettingForKey:v279 withFallback:v280];
      v281 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v281 forKeyedSubscript:@"weightForFamiliarityIndex"];

      v282 = v6->_configurationManager;
      v283 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForIsFamilyContact"];
      LODWORD(v284) = 1008981770;
      [(MOConfigurationManagerBase *)v282 getFloatSettingForKey:v283 withFallback:v284];
      v285 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v285 forKeyedSubscript:@"weightForIsFamilyContact"];

      v286 = v6->_configurationManager;
      v287 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForIsCoworkerContact"];
      LODWORD(v288) = -1130113270;
      [(MOConfigurationManagerBase *)v286 getFloatSettingForKey:v287 withFallback:v288];
      v289 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v289 forKeyedSubscript:@"weightForIsCoworkerContact"];

      v290 = v6->_configurationManager;
      v291 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForMediaPlayTime"];
      LODWORD(v292) = 1026206379;
      [(MOConfigurationManagerBase *)v290 getFloatSettingForKey:v291 withFallback:v292];
      v293 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v293 forKeyedSubscript:@"weightForMediaPlayTime"];

      v294 = v6->_configurationManager;
      v295 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxBundleGoodnessScorePhotoMemory"];
      LODWORD(v296) = 1028443341;
      [(MOConfigurationManagerBase *)v294 getFloatSettingForKey:v295 withFallback:v296];
      v297 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v297 forKeyedSubscript:@"maxBundleGoodnessScorePhotoMemory"];

      v298 = v6->_configurationManager;
      v299 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"bundleGoodnessScoreIncrementPhotoMemory"];
      LODWORD(v300) = 1017370378;
      [(MOConfigurationManagerBase *)v298 getFloatSettingForKey:v299 withFallback:v300];
      v301 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v301 forKeyedSubscript:@"bundleGoodnessScoreIncrementPhotoMemory"];

      v302 = v6->_configurationManager;
      v303 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightStateOfMindLabelCountNormalized"];
      LODWORD(v304) = 1028443341;
      [(MOConfigurationManagerBase *)v302 getFloatSettingForKey:v303 withFallback:v304];
      v305 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v305 forKeyedSubscript:@"weightStateOfMindLabelCountNormalized"];

      v306 = v6->_configurationManager;
      v307 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightStateOfMindDomainCountNormalized"];
      LODWORD(v308) = 1028443341;
      [(MOConfigurationManagerBase *)v306 getFloatSettingForKey:v307 withFallback:v308];
      v309 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v309 forKeyedSubscript:@"weightStateOfMindDomainCountNormalized"];

      v310 = v6->_configurationManager;
      v311 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumFamilyNormalized"];
      LODWORD(v312) = 1022739087;
      [(MOConfigurationManagerBase *)v310 getFloatSettingForKey:v311 withFallback:v312];
      v313 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v313 forKeyedSubscript:@"weightForNumFamilyNormalized"];

      v314 = v6->_configurationManager;
      v315 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumFriendsNormalized"];
      LODWORD(v316) = 1022739087;
      [(MOConfigurationManagerBase *)v314 getFloatSettingForKey:v315 withFallback:v316];
      v317 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v317 forKeyedSubscript:@"weightForNumFidsNormalized"];

      v318 = v6->_configurationManager;
      v319 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumFriendsNormalized"];
      LODWORD(v320) = 1017370378;
      [(MOConfigurationManagerBase *)v318 getFloatSettingForKey:v319 withFallback:v320];
      v321 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v321 forKeyedSubscript:@"weightForNumFriendsNormalized"];

      v322 = v6->_configurationManager;
      v323 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumPetsNormalized"];
      LODWORD(v324) = 1017370378;
      [(MOConfigurationManagerBase *)v322 getFloatSettingForKey:v323 withFallback:v324];
      v325 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v325 forKeyedSubscript:@"weightForNumPetsNormalized"];

      v326 = v6->_configurationManager;
      v327 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumCoworkersNormalized"];
      LODWORD(v328) = 1014350479;
      [(MOConfigurationManagerBase *)v326 getFloatSettingForKey:v327 withFallback:v328];
      v329 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v223 setObject:v329 forKeyedSubscript:@"weightForNumCoworkersNormalized"];

      v330 = v6->_configurationManager;
      v331 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForNumOtherPersonsNormalized"];
      LODWORD(v332) = 1008981770;
      [(MOConfigurationManagerBase *)v330 getFloatSettingForKey:v331 withFallback:v332];
      v333 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v530 = v223;
      [v223 setObject:v333 forKeyedSubscript:@"weightForNumOtherPersonsNormalized"];

      v334 = (NSDictionary *)objc_opt_new();
      v335 = v6->_configurationManager;
      v336 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"weightForViewCountBasedPenalty"];
      LODWORD(v337) = 0.125;
      [(MOConfigurationManagerBase *)v335 getFloatSettingForKey:v336 withFallback:v337];
      v338 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v334 setObject:v338 forKeyedSubscript:@"weightForViewCountBasedPenalty"];

      v339 = v6->_configurationManager;
      v340 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"minViewCountForAdjustment"];
      v341 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v339 getIntegerSettingForKey:v340 withFallback:2]];
      [(NSDictionary *)v334 setObject:v341 forKeyedSubscript:@"minViewCountForAdjustment"];

      v342 = v6->_configurationManager;
      v343 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"maxViewCountForAdjustment"];
      v344 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v342 getIntegerSettingForKey:v343 withFallback:12]];
      [(NSDictionary *)v334 setObject:v344 forKeyedSubscript:@"maxViewCountForAdjustment"];

      v345 = v6->_configurationManager;
      v346 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", @"minDaysElapsedForAdjustment"];
      v347 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v345 getIntegerSettingForKey:v346 withFallback:2]];
      v529 = v334;
      [(NSDictionary *)v334 setObject:v347 forKeyedSubscript:@"minDaysElapsedForAdjustment"];

      v348 = [(MOConfigurationManagerBase *)v6->_configurationManager fDefaultsManager];
      v349 = [v348 objectForKey:@"OnboardingDate"];

      v528 = v349;
      if (v349 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v350 = v349;
        v351 = +[NSDate date];
        [v351 timeIntervalSinceDate:v350];
        *(float *)&double v352 = v352 / 86400.0;
        v6->_elapsedDaysSinceOnboardingDate = *(float *)&v352;

        v353 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v353, OS_LOG_TYPE_DEBUG)) {
          [(MOEventBundleRanking *)(uint64_t)v350 initWithConfigurationManager:v353];
        }
      }
      else
      {
        v356 = [(NSDictionary *)v533 objectForKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding"];
        [v356 floatValue];
        v6->_elapsedDaysSinceOnboardingDate = v357 + 1.0;

        v350 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v350, OS_LOG_TYPE_DEBUG)) {
          -[MOEventBundleRanking initWithConfigurationManager:]((uint64_t)&v6->_elapsedDaysSinceOnboardingDate, v350, v358, v359, v360, v361, v362, v363);
        }
      }

      v541 = (NSDictionary *)objc_opt_new();
      v537 = (NSDictionary *)objc_opt_new();
      id obj = (id)objc_opt_new();
      id v548 = objc_alloc_init((Class)NSString);
      v539 = (NSDictionary *)objc_opt_new();
      v536 = (NSDictionary *)objc_opt_new();
      int v364 = 1;
      v540 = v6;
      do
      {
        unsigned int v543 = v364;
        switch(v364)
        {
          case 1:
            v365 = +[NSNumber numberWithInt:1];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v365];

            v366 = v6->_configurationManager;
            v367 = [v9[283] stringWithFormat:@"%@_ActivityInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v368) = 1120403456;
            [(MOConfigurationManagerBase *)v366 getFloatSettingForKey:v367 withFallback:v368];
            v369 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v370 = +[NSNumber numberWithInt:1];
            [(NSDictionary *)v539 setObject:v369 forKeyedSubscript:v370];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8340 forKeyedSubscript:@"weightForNumRoutineEventsNormalized"];
            [v371 setObject:&off_1000B8350 forKeyedSubscript:@"richnessScoreScalingParameter"];
            CFStringRef v372 = @"%@_ActivityInterfaceType";
            goto LABEL_31;
          case 2:
            v373 = +[NSNumber numberWithInt:2];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v373];

            v374 = v6->_configurationManager;
            v375 = [v9[283] stringWithFormat:@"%@_OutingInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v376) = 1120403456;
            [(MOConfigurationManagerBase *)v374 getFloatSettingForKey:v375 withFallback:v376];
            v377 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v378 = +[NSNumber numberWithInt:2];
            [(NSDictionary *)v539 setObject:v377 forKeyedSubscript:v378];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8350 forKeyedSubscript:@"weightForNumAnamolyEventsNormalized"];
            CFStringRef v372 = @"%@_OutingInterfaceType";
            goto LABEL_31;
          case 3:
            v379 = +[NSNumber numberWithInt:3];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v379];

            v380 = v6->_configurationManager;
            v381 = [v9[283] stringWithFormat:@"%@_PhotoMomentInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v382) = 1120403456;
            [(MOConfigurationManagerBase *)v380 getFloatSettingForKey:v381 withFallback:v382];
            v383 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v384 = +[NSNumber numberWithInt:3];
            [(NSDictionary *)v539 setObject:v383 forKeyedSubscript:v384];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            CFStringRef v372 = @"%@_PhotoMomentInterfaceType";
            goto LABEL_31;
          case 4:
            v385 = +[NSNumber numberWithInt:4];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v385];

            v386 = v6->_configurationManager;
            v387 = [v9[283] stringWithFormat:@"%@_SignificantContactInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v388) = 1120403456;
            [(MOConfigurationManagerBase *)v386 getFloatSettingForKey:v387 withFallback:v388];
            v389 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v390 = +[NSNumber numberWithInt:4];
            [(NSDictionary *)v539 setObject:v389 forKeyedSubscript:v390];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8360 forKeyedSubscript:@"weightForNumAnamolyEventsNormalized"];
            [v371 setObject:&off_1000B8360 forKeyedSubscript:@"weightForNumTrendEventsNormalized"];
            [v371 setObject:&off_1000B8370 forKeyedSubscript:@"richnessScoreScalingParameter"];
            [v371 setObject:&off_1000B8380 forKeyedSubscript:@"bundleScoreConstant"];
            CFStringRef v372 = @"%@_SignificantContactInterfaceType";
            goto LABEL_31;
          case 5:
            v391 = +[NSNumber numberWithInt:5];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v391];

            v392 = v6->_configurationManager;
            v393 = [v9[283] stringWithFormat:@"%@_YourMediaInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v394) = 1120403456;
            [(MOConfigurationManagerBase *)v392 getFloatSettingForKey:v393 withFallback:v394];
            v395 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v396 = +[NSNumber numberWithInt:5];
            [(NSDictionary *)v539 setObject:v395 forKeyedSubscript:v396];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            CFStringRef v372 = @"%@_YourMediaInterfaceType";
            goto LABEL_31;
          case 6:
            v397 = +[NSNumber numberWithInt:6];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v397];

            v398 = v6->_configurationManager;
            v399 = [v9[283] stringWithFormat:@"%@_YourSharedContentInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v400) = 1120403456;
            [(MOConfigurationManagerBase *)v398 getFloatSettingForKey:v399 withFallback:v400];
            v401 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v402 = +[NSNumber numberWithInt:6];
            [(NSDictionary *)v539 setObject:v401 forKeyedSubscript:v402];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8390 forKeyedSubscript:@"bundleScoreConstant"];
            CFStringRef v372 = @"%@_YourSharedContentInterfaceType";
            goto LABEL_31;
          case 7:
            v403 = +[NSNumber numberWithInt:7];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v403];

            v404 = v6->_configurationManager;
            v405 = [v9[283] stringWithFormat:@"%@_YourTimeAtHomeInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v406) = 1120403456;
            [(MOConfigurationManagerBase *)v404 getFloatSettingForKey:v405 withFallback:v406];
            v407 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v408 = +[NSNumber numberWithInt:7];
            [(NSDictionary *)v539 setObject:v407 forKeyedSubscript:v408];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B83A0 forKeyedSubscript:@"bundleScoreConstant"];
            [v371 setObject:&off_1000B83B0 forKeyedSubscript:@"bundleScoreScalingParameter"];
            CFStringRef v372 = @"%@_YourTimeAtHomeInterfaceType";
            goto LABEL_31;
          case 8:
            v409 = +[NSNumber numberWithInt:8];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v409];

            v410 = v6->_configurationManager;
            v411 = [v9[283] stringWithFormat:@"%@_TopicsOfInterestInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v412) = 1120403456;
            [(MOConfigurationManagerBase *)v410 getFloatSettingForKey:v411 withFallback:v412];
            v413 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v414 = +[NSNumber numberWithInt:8];
            [(NSDictionary *)v539 setObject:v413 forKeyedSubscript:v414];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            CFStringRef v372 = @"%@_TopicsOfInterestInterfaceType";
            goto LABEL_31;
          case 9:
            v415 = +[NSNumber numberWithInt:9];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v415];

            v416 = v6->_configurationManager;
            v417 = [v9[283] stringWithFormat:@"%@_TrendInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v418) = 1120403456;
            [(MOConfigurationManagerBase *)v416 getFloatSettingForKey:v417 withFallback:v418];
            v419 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v420 = +[NSNumber numberWithInt:9];
            [(NSDictionary *)v539 setObject:v419 forKeyedSubscript:v420];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            CFStringRef v372 = @"%@_TrendInterfaceType";
            goto LABEL_31;
          case 10:
            v421 = +[NSNumber numberWithInt:10];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v421];

            v422 = v6->_configurationManager;
            v423 = [v9[283] stringWithFormat:@"%@_PhotoMemoryInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v424) = 1120403456;
            [(MOConfigurationManagerBase *)v422 getFloatSettingForKey:v423 withFallback:v424];
            v425 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v426 = +[NSNumber numberWithInt:10];
            [(NSDictionary *)v539 setObject:v425 forKeyedSubscript:v426];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B83C0 forKeyedSubscript:@"decayRate"];
            CFStringRef v372 = @"%@_PhotoMemoryInterfaceType";
            goto LABEL_31;
          case 11:
            v427 = +[NSNumber numberWithInt:11];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v427];

            v428 = v6->_configurationManager;
            v429 = [v9[283] stringWithFormat:@"%@_EvergreenInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v430) = 1120403456;
            [(MOConfigurationManagerBase *)v428 getFloatSettingForKey:v429 withFallback:v430];
            v431 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v432 = +[NSNumber numberWithInt:11];
            [(NSDictionary *)v539 setObject:v431 forKeyedSubscript:v432];

            [(NSDictionary *)v536 setObject:&off_1000B8330 forKeyedSubscript:@"WISDOM"];
            [(NSDictionary *)v536 setObject:&off_1000B8330 forKeyedSubscript:@"GRATITUDE"];
            [(NSDictionary *)v536 setObject:&off_1000B8330 forKeyedSubscript:@"KINDNESS"];
            [(NSDictionary *)v536 setObject:&off_1000B8330 forKeyedSubscript:@"PURPOSE"];
            [(NSDictionary *)v536 setObject:&off_1000B8330 forKeyedSubscript:@"RESILIENCE"];
            [(NSDictionary *)v536 setObject:&off_1000B8330 forKeyedSubscript:@"CREATIVITY"];
            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8330 forKeyedSubscript:@"decayRate"];
            [v371 setObject:&off_1000B8330 forKeyedSubscript:@"weightForLabelQualityScore"];
            CFStringRef v372 = @"%@_EvergreenInterfaceType";
            goto LABEL_31;
          case 12:
            v433 = +[NSNumber numberWithInt:12];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v433];

            v434 = v6->_configurationManager;
            v435 = [v9[283] stringWithFormat:@"%@_TimeContextInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v436) = 1120403456;
            [(MOConfigurationManagerBase *)v434 getFloatSettingForKey:v435 withFallback:v436];
            v437 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v438 = +[NSNumber numberWithInt:12];
            [(NSDictionary *)v539 setObject:v437 forKeyedSubscript:v438];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8340 forKeyedSubscript:@"weightForNumRoutineEventsNormalized"];
            CFStringRef v372 = @"%@_TimeContextInterfaceType";
            goto LABEL_31;
          case 13:
            v439 = +[NSNumber numberWithInt:13];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v439];

            v440 = v6->_configurationManager;
            v441 = [v9[283] stringWithFormat:@"%@_TripInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v442) = 1120403456;
            [(MOConfigurationManagerBase *)v440 getFloatSettingForKey:v441 withFallback:v442];
            v443 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v444 = +[NSNumber numberWithInt:13];
            [(NSDictionary *)v539 setObject:v443 forKeyedSubscript:v444];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            CFStringRef v372 = @"%@_TripInterfaceType";
            goto LABEL_31;
          case 14:
            v445 = +[NSNumber numberWithInt:14];
            [(NSDictionary *)v537 setObject:&off_1000B8330 forKeyedSubscript:v445];

            v446 = v6->_configurationManager;
            v447 = [v9[283] stringWithFormat:@"%@_StateOfMindInterfaceType_%@", @"rankingParams", @"BPRRegularizationWeight"];
            LODWORD(v448) = 1120403456;
            [(MOConfigurationManagerBase *)v446 getFloatSettingForKey:v447 withFallback:v448];
            v449 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            v450 = +[NSNumber numberWithInt:14];
            [(NSDictionary *)v539 setObject:v449 forKeyedSubscript:v450];

            v371 = [(MOEventBundleRanking *)v6 _getDefaultFallbackFactorDict];

            [v371 setObject:&off_1000B8370 forKeyedSubscript:@"bundleScoreConstant"];
            [v371 setObject:&off_1000B83D0 forKeyedSubscript:@"decayRate"];
            CFStringRef v372 = @"%@_StateOfMindInterfaceType";
LABEL_31:
            id obj = v371;
            uint64_t v451 = objc_msgSend(v9[283], "stringWithFormat:", v372, @"rankingParams");

            id v548 = (id)v451;
            break;
          default:
            break;
        }
        v452 = objc_opt_new();
        long long v550 = 0u;
        long long v551 = 0u;
        long long v552 = 0u;
        long long v553 = 0u;
        id obj = obj;
        id v453 = [obj countByEnumeratingWithState:&v550 objects:v555 count:16];
        if (v453)
        {
          id v454 = v453;
          uint64_t v455 = *(void *)v551;
          do
          {
            for (i = 0; i != v454; i = (char *)i + 1)
            {
              if (*(void *)v551 != v455) {
                objc_enumerationMutation(obj);
              }
              uint64_t v457 = *(void *)(*((void *)&v550 + 1) + 8 * i);
              v458 = *p_configurationManager;
              v459 = [v9[283] stringWithFormat:@"%@_%@", v548, v457];
              [obj objectForKeyedSubscript:v457];
              v461 = v460 = v9;
              [v461 floatValue];
              objc_msgSend(v458, "getFloatSettingForKey:withFallback:", v459);
              v462 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              [v452 setObject:v462 forKeyedSubscript:v457];

              float v9 = v460;
            }
            id v454 = [obj countByEnumeratingWithState:&v550 objects:v555 count:16];
          }
          while (v454);
        }

        id v463 = [v452 copy];
        v464 = +[NSNumber numberWithInt:v543];
        [(NSDictionary *)v541 setObject:v463 forKeyedSubscript:v464];

        int v364 = v543 + 1;
        id v6 = v540;
      }
      while (v543 != 15);
      v465 = (NSDictionary *)objc_opt_new();
      v466 = v9;
      v467 = v540->_configurationManager;
      v468 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"minEngagementCount"];
      v469 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v467 getIntegerSettingForKey:v468 withFallback:5]];
      [(NSDictionary *)v465 setObject:v469 forKeyedSubscript:@"minEngagementCount"];

      v470 = v540->_configurationManager;
      v471 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"minInterfaceTypes"];
      v472 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v470 getIntegerSettingForKey:v471 withFallback:2]];
      [(NSDictionary *)v465 setObject:v472 forKeyedSubscript:@"minInterfaceTypes"];

      v473 = v540->_configurationManager;
      v474 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"minTimeIntervalForUpdateSec"];
      v475 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v473 getIntegerSettingForKey:v474 withFallback:259200]];
      [(NSDictionary *)v465 setObject:v475 forKeyedSubscript:@"minTimeIntervalForUpdateSec"];

      v476 = v540->_configurationManager;
      v477 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"longTimePeriodSinceEngagementScoreParamsUpdatedSec"];
      v478 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v476 getIntegerSettingForKey:v477 withFallback:2419200]];
      [(NSDictionary *)v465 setObject:v478 forKeyedSubscript:@"longTimePeriodSinceEngagementScoreParamsUpdatedSec"];

      v479 = v540->_configurationManager;
      v480 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"lowerBoundOfEngagementScoreParams"];
      LODWORD(v481) = -1.0;
      [(MOConfigurationManagerBase *)v479 getFloatSettingForKey:v480 withFallback:v481];
      v482 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSDictionary *)v465 setObject:v482 forKeyedSubscript:@"lowerBoundOfEngagementScoreParams"];

      v483 = v540->_configurationManager;
      v484 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"upperBoundOfEngagementScoreParams"];
      LODWORD(v485) = 1.0;
      [(MOConfigurationManagerBase *)v483 getFloatSettingForKey:v484 withFallback:v485];
      v486 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v546 = v465;
      [(NSDictionary *)v465 setObject:v486 forKeyedSubscript:@"upperBoundOfEngagementScoreParams"];

      v487 = (NSMutableDictionary *)objc_opt_new();
      v488 = v540->_configurationManager;
      v489 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"pairWiseFarthest"];
      LODWORD(v490) = 2.5;
      [(MOConfigurationManagerBase *)v488 getFloatSettingForKey:v489 withFallback:v490];
      v491 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSMutableDictionary *)v487 setObject:v491 forKeyedSubscript:@"pairWiseFarthest"];

      v492 = v540->_configurationManager;
      v493 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"pairWiseFarther"];
      LODWORD(v494) = 2.0;
      [(MOConfigurationManagerBase *)v492 getFloatSettingForKey:v493 withFallback:v494];
      v495 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSMutableDictionary *)v487 setObject:v495 forKeyedSubscript:@"pairWiseFarther"];

      v496 = v540->_configurationManager;
      v497 = [v466[283] stringWithFormat:@"%@_%@", @"rankingParams", @"pairWiseFar"];
      LODWORD(v498) = 1.0;
      [(MOConfigurationManagerBase *)v496 getFloatSettingForKey:v497 withFallback:v498];
      v499 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(NSMutableDictionary *)v487 setObject:v499 forKeyedSubscript:@"pairWiseFar"];

      v500 = (NSDictionary *)objc_opt_new();
      v501 = [(MOEventBundleRanking *)v540 _getDefaultRichnessWeightDict];
      for (uint64_t j = 0; j != 17; ++j)
      {
        v503 = +[MOResource getStringTypeForResources:j];
        v504 = [v501 objectForKeyedSubscript:v503];
        v505 = [(MOEventBundleRanking *)v540 _getRichnessScoreWeightFromConfigurationManager:v503 withDefaultWeightDict:v504];
        [(NSDictionary *)v500 setObject:v505 forKey:v503];
      }
      v506 = [v501 objectForKeyedSubscript:@"NumUniqueResourceTypesNormalizedKey"];
      v507 = [(MOEventBundleRanking *)v540 _getRichnessScoreWeightFromConfigurationManager:@"NumUniqueResourceTypesNormalizedKey" withDefaultWeightDict:v506];
      [(NSDictionary *)v500 setObject:v507 forKey:@"NumUniqueResourceTypesNormalizedKey"];

      v544 = [v501 objectForKeyedSubscript:@"NumWorkoutRouteMapAssets"];

      v508 = [(MOEventBundleRanking *)v540 _getRichnessScoreWeightFromConfigurationManager:@"NumWorkoutRouteMapAssets" withDefaultWeightDict:v544];
      [(NSDictionary *)v500 setObject:v508 forKey:@"NumWorkoutRouteMapAssets"];

      richnessWeightsDict = v540->_richnessWeightsDict;
      v540->_richnessWeightsDict = v500;
      v535 = v500;

      engagementScoreParameterDict = v540->_engagementScoreParameterDict;
      v540->_engagementScoreParameterDict = v546;
      v534 = v546;

      staticModelParameterMatrix = v540->_staticModelParameterMatrix;
      v540->_staticModelParameterMatrix = v541;
      v547 = v541;

      dynamicModelParameterDict = v540->_dynamicModelParameterDict;
      v540->_dynamicModelParameterDict = v537;
      v542 = v537;

      v513 = [(MOEventBundleRanking *)v540 _checkAndUpdateNumericLimits:v530];
      heuristicsParameterDict = v540->_heuristicsParameterDict;
      v540->_heuristicsParameterDict = v513;
      v515 = v513;

      rankingScoreThresholdDict = v540->_rankingScoreThresholdDict;
      v540->_rankingScoreThresholdDict = v531;
      v538 = v531;

      viewCountBasedAdjustmentParameterDict = v540->_viewCountBasedAdjustmentParameterDict;
      v540->_viewCountBasedAdjustmentParameterDict = v529;
      v518 = v529;

      bprRegularizationFactor = v540->_bprRegularizationFactor;
      v540->_bprRegularizationFactor = v539;
      v520 = v539;

      pairWiseWeights = v540->_pairWiseWeights;
      v540->_pairWiseWeights = v487;
      v522 = v487;

      evergreenEngagementScoreParameterDict = v540->_evergreenEngagementScoreParameterDict;
      v540->_evergreenEngagementScoreParameterDict = v536;
      v524 = v536;

      curationParameterDict = v540->_curationParameterDict;
      v540->_curationParameterDict = v533;
      v526 = v533;

      id v5 = v532;
      id v6 = v540;
    }
    self = v6;
    v355 = self;
  }
  else
  {
    v354 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v354, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking initWithConfigurationManager:]();
    }

    v355 = 0;
  }

  return v355;
}

- (id)_getRichnessScoreWeightFromConfigurationManager:(id)a3 withDefaultWeightDict:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  float v9 = [v7 stringByAppendingString:@"_Resource_PrimaryWeight"];
  configurationManager = self->_configurationManager;
  double v11 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", v9];
  float v12 = [v6 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
  [v12 floatValue];
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v11);
  float v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [v8 setObject:v13 forKey:@"RankingRichnessPrimaryPriorityScoreKey"];
  float v14 = [v7 stringByAppendingString:@"_Resource_SecondaryWeight"];

  double v15 = self->_configurationManager;
  float v16 = +[NSString stringWithFormat:@"%@_%@", @"rankingParams", v14];
  float v17 = [v6 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
  [v17 floatValue];
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v15, "getFloatSettingForKey:withFallback:", v16);
  uint64_t v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

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
          float v16 = (void *)v15;
          float v17 = [v14 suggestionID];

          if (v17) {
            continue;
          }
        }
        [v7 addIndex:(char *)i + v11];
        uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v14 bundleIdentifier];
          uint64_t v20 = [v14 suggestionID];
          *(_DWORD *)buf = 138412546;
          id v36 = v19;
          __int16 v37 = 2112;
          float v38 = v20;
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
  double v24 = [(MOEventBundleRanking *)self _calculateRankingScore:v23 withMinRecommendedBundleCountRequirement:v28];
  if (self->_isInternalBuild)
  {
    float v25 = +[NSDate date];
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
  v902[0] = @"GRATITUDE";
  v902[1] = @"CREATIVITY";
  v903[0] = &off_1000B83E0;
  v903[1] = &off_1000B83F0;
  v902[2] = @"WISDOM";
  v902[3] = @"PURPOSE";
  v903[2] = &off_1000B8400;
  v903[3] = &off_1000B8410;
  v902[4] = @"KINDNESS";
  v902[5] = @"RESILIENCE";
  v903[4] = &off_1000B8420;
  v903[5] = &off_1000B8310;
  v617 = +[NSDictionary dictionaryWithObjects:v903 forKeys:v902 count:6];
  v755 = objc_opt_new();
  v754 = objc_opt_new();
  v609 = objc_opt_new();
  v608 = objc_opt_new();
  v610 = objc_opt_new();
  v615 = objc_opt_new();
  id v6 = objc_opt_new();
  v624 = objc_opt_new();
  v684 = +[NSDate distantFuture];
  v685 = +[NSDate distantPast];
  float elapsedDaysSinceOnboardingDate = self->_elapsedDaysSinceOnboardingDate;
  id v7 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"daysToSuppressCoarseSummaryAfterOnboarding"];
  [v7 floatValue];
  float v622 = v8;

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
    *(_DWORD *)v895 = elapsedDaysSinceOnboardingDate < v622;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "elapsedDaysSinceOnboardingDate, %.2f, maxDaysToSuppressCoarseSummaryAfterOnboarding,%.2f,suppressCoarseSummary:%d", buf, 0x1Cu);
  }
  if (v4)
  {
    float v14 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"minSensedBundleCountInRecommendedTab"];
    signed int v15 = [v14 intValue];

    unint64_t v612 = v15;
  }
  else
  {
    unint64_t v612 = 0;
  }
  long long v881 = 0u;
  long long v880 = 0u;
  long long v879 = 0u;
  long long v878 = 0u;
  id obj = v5;
  id v16 = [obj countByEnumeratingWithState:&v878 objects:v901 count:16];
  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v17 = *(void *)v879;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v879 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v878 + 1) + 8 * i);
      if ([v19 suggestionIsDeleted])
      {
        uint64_t v20 = [v19 suggestionIdentifier];
        uint64_t v21 = [v20 UUIDString];
        [v755 addObject:v21];

        id v22 = [v19 subSuggestionIDs];
        [v755 addObjectsFromArray:v22];
LABEL_16:

        continue;
      }
      if (([v19 suggestionIsSelected] & 1) != 0
        || [v19 suggestionQuickAddEntry])
      {
        uint64_t v23 = [v19 suggestionIdentifier];
        double v24 = [v23 UUIDString];
        [v754 addObject:v24];

        id v22 = [v19 subSuggestionIDs];
        [v754 addObjectsFromArray:v22];
        goto LABEL_16;
      }
    }
    id v16 = [obj countByEnumeratingWithState:&v878 objects:v901 count:16];
  }
  while (v16);
LABEL_19:

  int v611 = 0;
  int v613 = 0;
  unint64_t v25 = 0;
  float v26 = 1.0;
  while (2)
  {
    if (v26 < 0.0 || v25 > v612)
    {
      v620 = v6;
      goto LABEL_321;
    }
    float v614 = v26;
    v620 = objc_opt_new();

    uint64_t v28 = objc_opt_new();
    long long v877 = 0u;
    long long v876 = 0u;
    long long v875 = 0u;
    long long v874 = 0u;
    id v618 = obj;
    id v625 = [v618 countByEnumeratingWithState:&v874 objects:v900 count:16];
    v624 = (void *)v28;
    if (!v625)
    {
      unint64_t v619 = 0;
      goto LABEL_301;
    }
    unint64_t v619 = 0;
    unint64_t v616 = 0;
    uint64_t v621 = *(void *)v875;
    while (2)
    {
      uint64_t v29 = 0;
      while (2)
      {
        if (*(void *)v875 != v621)
        {
          uint64_t v30 = v29;
          objc_enumerationMutation(v618);
          uint64_t v29 = v30;
        }
        uint64_t v683 = v29;
        v770 = *(void **)(*((void *)&v874 + 1) + 8 * v29);
        long long v31 = [v770 bundleStartDate];
        unsigned int v32 = [v31 isAfterDate:v685];

        if (v32)
        {
          uint64_t v33 = [v770 bundleStartDate];

          v685 = (void *)v33;
        }
        long long v34 = [v770 bundleStartDate];
        unsigned int v35 = [v34 isBeforeDate:v684];

        if (v35)
        {
          uint64_t v36 = [v770 bundleStartDate];

          v684 = (void *)v36;
        }
        __int16 v37 = [v770 suggestionIdentifier];
        float v38 = [v37 UUIDString];
        if ([v755 containsObject:v38])
        {
          unsigned int v747 = 1;
        }
        else if ([v770 bundleInterfaceType] == (id)13)
        {
          unsigned int v747 = 0;
        }
        else
        {
          double v39 = [v770 subSuggestionIDs];
          float v40 = +[NSMutableSet setWithArray:v39];
          unsigned int v747 = [v755 intersectsSet:v40];
        }
        double v41 = [v770 suggestionIdentifier];
        float v42 = [v41 UUIDString];
        if ([v754 containsObject:v42])
        {
          unsigned int v745 = 1;
        }
        else if ([v770 bundleInterfaceType] == (id)13 || objc_msgSend(v770, "bundleSubType") == (id)202)
        {
          unsigned int v745 = 0;
        }
        else
        {
          float v43 = [v770 subSuggestionIDs];
          double v44 = +[NSMutableSet setWithArray:v43];
          unsigned int v745 = [v754 intersectsSet:v44];
        }
        double v45 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          uint64_t v46 = [v770 bundleIdentifier];
          v47 = [v770 suggestionIdentifier];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v47;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v895 = v745;
          *(_WORD *)&v895[4] = 1024;
          *(_DWORD *)&v895[6] = v747;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Engagement status: bundleID %@, suggestionID %@, isBundleOrSubBundlesSelectedOrQuickAdded %d, isBundleOrSubBundleDeleted %d", buf, 0x22u);
        }
        if (![v770 bundleInterfaceType])
        {
          unsigned int v681 = 0;
          BOOL v55 = 0;
          BOOL v56 = 0;
          uint64_t v57 = 0;
          uint64_t v716 = 0;
          float v58 = 0.0;
          float v59 = -1.0;
          float v60 = -1.0;
          float v61 = 0.0;
          float v62 = 0.0;
          HIDWORD(v63) = 0;
          float v737 = 0.0;
          float v733 = 0.0;
          float v740 = 0.0;
          float v756 = 0.0;
          float v64 = 0.0;
          goto LABEL_146;
        }
        double v48 = (_UNKNOWN **)objc_opt_new();
        if ([v770 bundleInterfaceType] != (id)11)
        {
          double v65 = [(MOEventBundleRanking *)self dynamicModelParameterDict];
          id v66 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleInterfaceType]);
          uint64_t v67 = [v65 objectForKeyedSubscript:v66];

          double v53 = (void *)v67;
          if (v67) {
            goto LABEL_61;
          }
          long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            id v323 = [v770 bundleInterfaceType];
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v323;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v895 = 1573;
            _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Dynamic model parameter is not set for bundleInterfaceType %lu (in %s:%d)", buf, 0x1Cu);
          }
          double v48 = 0;
LABEL_60:

          double v53 = v48;
          goto LABEL_61;
        }
        double v49 = [v770 evergreenType];

        if (!v49)
        {
          long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.7(&v872, v873);
          }
          goto LABEL_60;
        }
        uint64_t v50 = [(MOEventBundleRanking *)self evergreenEngagementScoreParameterDict];
        id v51 = [v770 evergreenType];
        uint64_t v52 = [v50 objectForKeyedSubscript:v51];

        double v53 = (void *)v52;
        if (!v52)
        {
          long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.8((uint64_t)v899, (uint64_t)v770);
          }
          double v48 = &off_1000B8330;
          goto LABEL_60;
        }
LABEL_61:
        v673 = v53;
        [v53 floatValue];
        float v737 = v68;
        if ([v770 bundleInterfaceType] == (id)12 && objc_msgSend(v770, "bundleSuperType") == (id)1)
        {
          id v69 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
          v750 = [v69 objectForKeyedSubscript:&off_1000B6CD8];
        }
        else
        {
          double v70 = (void *)phoneSensedWalkingVariants;
          double v71 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
          LODWORD(v70) = [v70 containsObject:v71];

          if (v70)
          {
            float v72 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
            double v73 = [v72 objectForKeyedSubscript:&off_1000B6CD8];
            id v74 = [v73 mutableCopy];

            configurationManager = self->_configurationManager;
            double v76 = +[NSString stringWithFormat:@"%@_MotionActivityWalkingSubType_%@", @"rankingParams", @"bundleScoreConstant"];
            LODWORD(v77) = -1138501878;
            [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v76 withFallback:v77];
            float v78 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            [v74 setObject:v78 forKeyedSubscript:@"bundleScoreConstant"];

            id v69 = v74;
            v750 = v69;
          }
          else if ([v770 bundleSubType] == (id)201 || objc_msgSend(v770, "bundleSubType") == (id)205)
          {
            id v69 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
            v750 = [v69 objectForKeyedSubscript:&off_1000B6F18];
          }
          else
          {
            id v69 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
            float v79 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleInterfaceType]);
            v750 = [v69 objectForKeyedSubscript:v79];
          }
        }

        if (!v750)
        {
          double v80 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            id v308 = [v770 bundleInterfaceType];
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v308;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v895 = 1605;
            _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Static model parameters are not set for bundleInterfaceType %lu (in %s:%d)", buf, 0x1Cu);
          }
        }
        long long v871 = 0u;
        long long v870 = 0u;
        long long v869 = 0u;
        long long v868 = 0u;
        double v81 = [v770 bundleRichnessDict];
        id v757 = [v81 allKeys];

        id v82 = [v757 countByEnumeratingWithState:&v868 objects:v898 count:16];
        if (v82)
        {
          uint64_t v762 = *(void *)v869;
          float v64 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v82; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v869 != v762) {
                objc_enumerationMutation(v757);
              }
              uint64_t v84 = *(void *)(*((void *)&v868 + 1) + 8 * (void)j);
              double v85 = [(NSDictionary *)self->_richnessWeightsDict objectForKeyedSubscript:v84];
              id v86 = [v770 bundleRichnessDict];
              v87 = [v86 objectForKeyedSubscript:v84];

              long long v88 = [v87 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
              [v88 floatValue];
              float v90 = v89;
              long long v91 = [v85 objectForKeyedSubscript:@"RankingRichnessPrimaryPriorityScoreKey"];
              [v91 floatValue];
              float v93 = v92;
              id v94 = [v87 objectForKeyedSubscript:@"RankingRichnessSecondaryPriorityScoreKey"];
              [v94 floatValue];
              float v96 = v95;
              double v97 = [v85 objectForKeyedSubscript:@"RankingRichnessSecondaryPriorityScoreKey"];
              [v97 floatValue];
              float v99 = v98;
              double v100 = [v87 objectForKeyedSubscript:@"RankingRichnessAuxiliaryPriorityScoreKey"];
              [v100 floatValue];
              float v102 = v101;
              float v103 = [v85 objectForKeyedSubscript:@"RankingRichnessAuxiliaryPriorityScoreKey"];
              [v103 floatValue];
              float v105 = v104;

              float v64 = v64 + (float)((float)((float)(v96 * v99) + (float)(v90 * v93)) + (float)(v102 * v105));
            }
            id v82 = [v757 countByEnumeratingWithState:&v868 objects:v898 count:16];
          }
          while (v82);
        }
        else
        {
          float v64 = 0.0;
        }

        v106 = [v750 objectForKeyedSubscript:@"weightForLabelQualityScore"];
        [v106 floatValue];
        float v664 = v107;
        [v770 labelQualityScore];
        float v663 = v108;
        double v109 = [v750 objectForKeyedSubscript:@"weightForTimeCorrelationScore"];
        [v109 floatValue];
        float v660 = v110;
        [v770 timeCorrelationScoreFeature];
        float v659 = v111;

        v112 = [v750 objectForKeyedSubscript:@"weightForNumAnamolyEventsNormalized"];
        [v112 floatValue];
        float v656 = v113;
        [v770 numAnomalyEventsNormalized];
        float v655 = v114;
        v115 = [v750 objectForKeyedSubscript:@"weightForNumTrendEventsNormalized"];
        [v115 floatValue];
        float v652 = v116;
        [v770 numTrendEventsNormalized];
        float v651 = v117;
        v118 = [v750 objectForKeyedSubscript:@"weightForNumRoutineEventsNormalized"];
        [v118 floatValue];
        float v649 = v119;
        [v770 numRoutineEventsNormalized];
        float v647 = v120;
        double v121 = [v750 objectForKeyedSubscript:@"weightForNumStateOfMindEventsNormalized"];
        [v121 floatValue];
        float v646 = v122;
        [v770 numStateOfMindEventsNormalized];
        float v644 = v123;

        v124 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v763 = [v124 objectForKeyedSubscript:@"weightForInterestingPOI"];
        [v763 floatValue];
        float v672 = v125;
        [v770 interestingPOIFeature];
        float v671 = v126;
        id v758 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v741 = [v758 objectForKeyedSubscript:@"weightForDistanceFromHome"];
        [v741 floatValue];
        float v670 = v127;
        [v770 distanceToHomeFeatureNormalized];
        float v669 = v128;
        v734 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v730 = [v734 objectForKeyedSubscript:@"weightForCallDuration"];
        [v730 floatValue];
        float v668 = v129;
        [v770 callDurationFeatureNormalized];
        float v667 = v130;
        v727 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v724 = [v727 objectForKeyedSubscript:@"weightForBurstyInteractionCount"];
        [v724 floatValue];
        float v666 = v131;
        [v770 burstyInteractionCountFeatureNormalized];
        float v665 = v132;
        v720 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v717 = [v720 objectForKeyedSubscript:@"weightForMultipleInteractionTypes"];
        [v717 floatValue];
        float v662 = v133;
        unsigned int v661 = [v770 multipleInteractionTypesFeature];
        v714 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v712 = [v714 objectForKeyedSubscript:@"weightForContactLocationWork"];
        [v712 floatValue];
        float v658 = v134;
        int v657 = [v770 contactLocationWorkFeature];
        v710 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v708 = [v710 objectForKeyedSubscript:@"weightForGroupConversation"];
        [v708 floatValue];
        float v654 = v135;
        unsigned int v653 = [v770 groupConversationFeature];
        v706 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v704 = [v706 objectForKeyedSubscript:@"weightForPCountMax"];
        [v704 floatValue];
        float v650 = v136;
        [v770 peopleCountMaxNormalized];
        float v648 = v137;
        v702 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v700 = [v702 objectForKeyedSubscript:@"weightForPCountWeightedSum"];
        [v700 floatValue];
        float v645 = v138;
        [v770 peopleCountWeightedSumNormalized];
        float v643 = v139;
        v698 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v696 = [v698 objectForKeyedSubscript:@"weightForPCountWeightedAverage"];
        [v696 floatValue];
        float v642 = v140;
        [v770 peopleCountWeightedAverageNormalized];
        float v641 = v141;
        v694 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v692 = [v694 objectForKeyedSubscript:@"weightForPDensityWeightedAverage"];
        [v692 floatValue];
        float v640 = v142;
        [v770 peopleDensityWeightedAverageNormalized];
        float v639 = v143;
        v690 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v688 = [v690 objectForKeyedSubscript:@"weightForItemFromMe"];
        [v688 floatValue];
        float v638 = v144;
        unsigned int v637 = [v770 itemFromMeFeature];
        v686 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v682 = [v686 objectForKeyedSubscript:@"weightShareCountFeature"];
        [v682 floatValue];
        float v636 = v145;
        [v770 shareCountFeatureNormalized];
        float v635 = v146;
        v680 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v679 = [v680 objectForKeyedSubscript:@"weightForTimeAtHomeDuration"];
        [v679 floatValue];
        float v634 = v147;
        [v770 timeAtHomeDuration];
        float v633 = v148;
        v678 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v677 = [v678 objectForKeyedSubscript:@"weightForIsFamilyContact"];
        [v677 floatValue];
        float v632 = v149;
        [v770 isFamilyContact];
        float v631 = v150;
        v676 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v675 = [v676 objectForKeyedSubscript:@"weightForIsCoworkerContact"];
        [v675 floatValue];
        float v630 = v151;
        [v770 isCoworkerContact];
        float v629 = v152;
        v674 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v153 = [v674 objectForKeyedSubscript:@"weightForMediaPlayTime"];
        [v153 floatValue];
        float v628 = v154;
        [v770 mediaScoreFeatureNormalized];
        float v627 = v155;
        v156 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v157 = [v156 objectForKeyedSubscript:@"weightForFamiliarityIndex"];
        [v157 floatValue];
        float v626 = v158;
        [v770 familiarityIndexFeature];
        float v160 = v159;
        double v161 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        int v162 = [v161 objectForKeyedSubscript:@"weightForWorkoutDurationNormalized"];
        [v162 floatValue];
        float v164 = v163;
        [v770 workoutDurationFeatureNormalized];
        float v166 = v165;
        v167 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v168 = [v167 objectForKeyedSubscript:@"weightStateOfMindLabelCountNormalized"];
        [v168 floatValue];
        float v170 = v169;
        [v770 stateOfMindLabelCountNormalized];
        float v172 = v171;
        double v173 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        float v174 = [v173 objectForKeyedSubscript:@"weightStateOfMindDomainCountNormalized"];
        [v174 floatValue];
        float v176 = v175;
        [v770 stateOfMindDomainCountNormalized];
        float v178 = v177;

        float v179 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        float v180 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v670 * v669) + (float)(v672 * v671)) + (float)(v668 * v667)) + (float)(v666 * v665)) + (float)(v662 * (float)v661)) + (float)(v658 * (float)v657)) + (float)(v654 * (float)v653)) + (float)(v650 * v648)) + (float)(v645 * v643)) + (float)(v642 * v641))
                                                                                             + (float)(v640 * v639))
                                                                                     + (float)(v638 * (float)v637))
                                                                             + (float)(v636 * v635))
                                                                     + (float)(v634 * v633))
                                                             + (float)(v632 * v631))
                                                     + (float)(v630 * v629))
                                             + (float)(v628 * v627))
                                     + (float)(v626 * v160))
                             + (float)(v164 * v166))
                     + (float)(v170 * v172))
             + (float)(v176 * v178);
        if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v180;
          _os_log_debug_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEBUG, "heuristics score before person-relationship based bonus %.3f", buf, 0xCu);
        }
        float v742 = v180;

        double v181 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v764 = [v181 objectForKeyedSubscript:@"weightForNumFamilyNormalized"];
        [v764 floatValue];
        float v735 = v182;
        [v770 numFamilyNormalized];
        float v731 = v183;
        id v759 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v184 = [v759 objectForKeyedSubscript:@"weightForNumFidsNormalized"];
        [v184 floatValue];
        float v728 = v185;
        [v770 numKidsNormalized];
        float v725 = v186;
        double v187 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v188 = [v187 objectForKeyedSubscript:@"weightForNumFriendsNormalized"];
        [v188 floatValue];
        float v721 = v189;
        [v770 numFriendsNormalized];
        float v191 = v190;
        v192 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        v193 = [v192 objectForKeyedSubscript:@"weightForNumPetsNormalized"];
        [v193 floatValue];
        float v195 = v194;
        [v770 numPetsNormalized];
        float v197 = v196;
        float v198 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        double v199 = [v198 objectForKeyedSubscript:@"weightForNumCoworkersNormalized"];
        [v199 floatValue];
        float v201 = v200;
        [v770 numCoworkersNormalized];
        float v203 = v202;
        float v204 = [(MOEventBundleRanking *)self heuristicsParameterDict];
        float v205 = [v204 objectForKeyedSubscript:@"weightForNumOtherPersonsNormalized"];
        [v205 floatValue];
        float v207 = v206;
        [v770 numOtherPersonsNormalized];
        float v209 = v208;

        double v210 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        float v740 = v742
             + (float)((float)((float)((float)((float)((float)(v728 * v725) + (float)(v735 * v731))
                                             + (float)(v721 * v191))
                                     + (float)(v195 * v197))
                             + (float)(v201 * v203))
                     + (float)(v207 * v209));
        if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v740;
          _os_log_debug_impl((void *)&_mh_execute_header, v210, OS_LOG_TYPE_DEBUG, "heuristics score after person-relationship based bonus %.3f", buf, 0xCu);
        }

        float v733 = (float)(v660 * v659) + (float)(v664 * v663);
        float v756 = (float)((float)((float)(v652 * v651) + (float)(v656 * v655)) + (float)(v649 * v647))
             + (float)(v646 * v644);
        if ([v770 bundleInterfaceType] == (id)11)
        {
          float v61 = 1.0;
          float v58 = 0.0;
          float v62 = v737;
          if (v737 <= 0.0)
          {
            float v211 = [v770 evergreenType];
            v212 = [v617 objectForKeyedSubscript:v211];
            [v212 floatValue];
            float v62 = v213;
          }
        }
        else if ([v770 bundleInterfaceType] == (id)15)
        {
          [v770 avgSubBundleGoodnessScores];
          float v58 = v214;
          float v61 = 0.0;
          float v62 = v214;
        }
        else
        {
          if ([v770 bundleInterfaceType] == (id)10)
          {
            float v215 = [(MOEventBundleRanking *)self heuristicsParameterDict];
            v216 = [v215 objectForKeyedSubscript:@"maxBundleGoodnessScorePhotoMemory"];
            [v216 floatValue];
            float v218 = v217;
            double v219 = [(MOEventBundleRanking *)self heuristicsParameterDict];
            v220 = [v219 objectForKeyedSubscript:@"bundleGoodnessScoreIncrementPhotoMemory"];
            [v220 floatValue];
            float v222 = v221;

            float v58 = v218 - (float)(v222 * (float)v616++);
          }
          else if ([v770 bundleSuperType] != (id)4 {
                 || (float v58 = -0.49, [v770 bundleSubType] != (id)407)
          }
                 && [v770 bundleSubType] != (id)409
                 && [v770 bundleSubType] != (id)408
                 && [v770 bundleSubType] != (id)410)
          {
            v223 = [v750 objectForKeyedSubscript:@"richnessScoreScalingParameter"];
            [v223 floatValue];
            float v225 = v224;
            double v226 = [v750 objectForKeyedSubscript:@"bundleScoreScalingParameter"];
            [v226 floatValue];
            float v228 = v227;
            v229 = [v750 objectForKeyedSubscript:@"bundleScoreConstant"];
            [v229 floatValue];
            float v231 = v230;

            float v58 = (float)((float)(v733 + (float)(v740 + (float)(v756 + (float)(v64 * v225)))) / v228) + v231;
          }
          [(MOEventBundleRanking *)self engagementScoreWeight];
          float v233 = v232;
          [(MOEventBundleRanking *)self engagementScoreWeight];
          float v235 = v234;
          BOOL v236 = [v770 bundleInterfaceType] == (id)10;
          double v237 = [v750 objectForKeyedSubscript:@"decayRate"];
          [v237 floatValue];
          float v239 = v238;
          [v770 bundleRecencyDaysElapsed];
          float v62 = (float)(v737 * v235) + (float)((float)(1.0 - v233) * v58);
          float v241 = -v239;
          if (v236) {
            float v61 = expf(floorf(v240) * v241);
          }
          else {
            float v61 = expf(v240 * v241);
          }
        }
        if ([v770 bundleInterfaceType] != (id)10 && objc_msgSend(v770, "bundleInterfaceType") != (id)11)
        {
          if ([v770 bundleSubType] == (id)406)
          {
            v243 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            float v60 = -1.0;
            if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
            {
              v244 = [v770 bundleIdentifier];
              v245 = [v770 suggestionIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v244;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v245;
              _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_INFO, "Internal media bundle got rejected: bundleID %@, suggestionID %@", buf, 0x16u);
            }
LABEL_127:
            BOOL v56 = 0;
            BOOL v55 = 0;
            unsigned int v681 = 0;
            float v59 = -1.0;
            goto LABEL_128;
          }
          if ([v770 bundleInterfaceType] == (id)15)
          {
            v243 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            float v60 = -1.0;
            if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
            {
              v251 = [v770 bundleIdentifier];
              v252 = [v770 suggestionIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v251;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v252;
              _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_INFO, "Clustering bundle got rejected: bundleID %@, suggestionID %@", buf, 0x16u);
            }
            goto LABEL_127;
          }
          v290 = (void *)visitSubtypeVariants;
          v291 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
          LODWORD(v290) = [v290 containsObject:v291];

          if (v290)
          {
            double v292 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v293 = [v292 objectForKeyedSubscript:@"suggestionAcceptThresholdForVisitSubTypeVariants"];
            [v293 floatValue];
            float v60 = v294;

            v295 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            double v296 = [v295 objectForKeyedSubscript:@"suggestionRecommendThresholdForVisitSubTypeVariants"];
            [v296 floatValue];
            float v298 = v297;

            v299 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            double v300 = [v299 objectForKeyedSubscript:@"summarizationThresholdForVisitSubTypeVariants"];
            [v300 floatValue];
            float v302 = v301;

            v303 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            double v304 = [v303 objectForKeyedSubscript:@"tripSummarizationThresholdForVisitSubType"];
            [v304 floatValue];
            float v306 = v305;

            BOOL v56 = v58 > v302;
            BOOL v55 = v58 > v306;
            if (([v770 isShortVisit] & 1) != 0
              || [v770 isWorkVisit])
            {
              [v770 numPhotoAssetsResourcesNormalized];
              if (v307 == 0.0) {
                goto LABEL_158;
              }
            }
LABEL_169:
            if ((float)(v60 + (float)(v614 * (float)(v298 - v60))) >= v60) {
              float v59 = v60 + (float)(v614 * (float)(v298 - v60));
            }
            else {
              float v59 = v60;
            }
            v344 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            if (os_log_type_enabled(v344, OS_LOG_TYPE_DEBUG))
            {
              id v454 = [v770 bundleSubType];
              *(_DWORD *)buf = 134218752;
              *(void *)&uint8_t buf[4] = v454;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v60;
              *(_WORD *)&buf[22] = 2048;
              *(double *)v895 = v59;
              *(_WORD *)&v895[8] = 2048;
              *(double *)&v895[10] = v614;
              _os_log_debug_impl((void *)&_mh_execute_header, v344, OS_LOG_TYPE_DEBUG, "Current bundle subtype, %lu, acceptThreshold,%.3f, recommendThreshold, %.3f, recommendThresholdMultiplier, %.3f", buf, 0x2Au);
            }

            if (v58 <= v59)
            {
              v351 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              BOOL v352 = os_log_type_enabled(v351, OS_LOG_TYPE_INFO);
              if (v58 <= v60)
              {
                if (v352)
                {
                  uint64_t v358 = [v770 bundleIdentifier];
                  uint64_t v359 = [v770 suggestionIdentifier];
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v358;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v359;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v895 = v58;
                  *(_WORD *)&v895[8] = 2048;
                  *(double *)&v895[10] = v59;
                  *(_WORD *)&v895[18] = 2048;
                  *(double *)&v895[20] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_INFO, "Suggestion was rejected to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f", buf, 0x34u);
                }
              }
              else
              {
                if (v352)
                {
                  v353 = [v770 bundleIdentifier];
                  v354 = [v770 suggestionIdentifier];
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v353;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v354;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v895 = v58;
                  *(_WORD *)&v895[8] = 2048;
                  *(double *)&v895[10] = v59;
                  *(_WORD *)&v895[18] = 2048;
                  *(double *)&v895[20] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_INFO, "Suggestion was set to present only in Recent tab due to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f", buf, 0x34u);
                }
                if ((([v770 isBundleAggregated] & 1) != 0
                   || [v770 summarizationGranularity] != (id)2)
                  && [v770 bundleSubType] != (id)203
                  && [v770 bundleSubType] != (id)303)
                {
                  uint64_t v57 = 3;
                  uint64_t v716 = 2;
                  goto LABEL_234;
                }
                v351 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v351, OS_LOG_TYPE_INFO))
                {
                  v355 = [v770 bundleIdentifier];
                  v356 = [v770 suggestionIdentifier];
                  id v357 = [v770 bundleSubType];
                  *(_DWORD *)buf = 138413570;
                  *(void *)&uint8_t buf[4] = v355;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v356;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v895 = v58;
                  *(_WORD *)&v895[8] = 2048;
                  *(double *)&v895[10] = v59;
                  *(_WORD *)&v895[18] = 2048;
                  *(double *)&v895[20] = v60;
                  *(_WORD *)&v895[28] = 2048;
                  *(void *)&v895[30] = v357;
                  _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_INFO, "Suggestion was rejected due to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f subtype %lu", buf, 0x3Eu);
                }
              }
              uint64_t v57 = 4;
              uint64_t v716 = 3;
              uint64_t v360 = (uint64_t)v615;
              goto LABEL_232;
            }
            if (([v770 isBundleAggregated] & 1) == 0
              && [v770 summarizationGranularity] == (id)2
              || [v770 bundleSubType] == (id)303)
            {
              if ([v770 bundleSubType] == (id)202)
              {
                uint64_t v345 = [v770 workoutTypes];

                int v613 = 1;
                v610 = (void *)v345;
              }
              if (elapsedDaysSinceOnboardingDate < v622)
              {
                v346 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
                {
                  v347 = [v770 bundleIdentifier];
                  v348 = [v770 suggestionIdentifier];
                  id v349 = [v770 bundleSubType];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v347;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v348;
                  *(_WORD *)&buf[22] = 2048;
                  *(void *)v895 = v349;
                  _os_log_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_INFO, "Coarse summary suggestion got rejected due to suppressCoarseSummary==True: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                }
                int v613 = ([v770 bundleSubType] != (id)202) & v613;
                uint64_t v57 = 4;
                uint64_t v350 = 3;
                goto LABEL_199;
              }
              uint64_t v57 = 2;
            }
            else
            {
              uint64_t v57 = 1;
            }
            uint64_t v350 = 1;
LABEL_199:
            uint64_t v716 = v350;
            if ([v770 bundleSubType] == (id)203)
            {
              uint64_t v360 = [v770 workoutTypes];

              [v770 bundleRecencyDaysElapsed];
              float v362 = v361;
              uint64_t v363 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForWorkoutRoutine"];
              [v363 floatValue];
              BOOL v365 = v362 > v364;

              if (v365)
              {
                v366 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v366, OS_LOG_TYPE_INFO))
                {
                  v367 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForWorkoutRoutine"];
                  [v367 floatValue];
                  float v369 = v368;
                  v370 = [v770 bundleIdentifier];
                  v371 = [v770 suggestionIdentifier];
                  id v372 = [v770 bundleSubType];
                  [v770 bundleRecencyDaysElapsed];
                  *(_DWORD *)buf = 134219010;
                  *(double *)&uint8_t buf[4] = v369;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v370;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v895 = v371;
                  *(_WORD *)&v895[8] = 2048;
                  *(void *)&v895[10] = v372;
                  *(_WORD *)&v895[18] = 2048;
                  *(double *)&v895[20] = v373;
                  _os_log_impl((void *)&_mh_execute_header, v366, OS_LOG_TYPE_INFO, "Workout routine suggestion was rejected because elapsed time >%.2f days: bundleID %@, suggestionID %@, bundleSubType %lu, elapsedTime %.2f", buf, 0x34u);
                }
                int v611 = 0;
                uint64_t v57 = 4;
                uint64_t v716 = 3;
              }
              else
              {
                uint64_t v716 = 1;
                uint64_t v57 = 2;
                int v611 = 1;
              }
            }
            else
            {
              uint64_t v360 = (uint64_t)v615;
            }
            if ([v770 bundleSuperType] == (id)3 && objc_msgSend(v770, "bundleSubType") != (id)303)
            {
              [v770 bundleRecencyDaysElapsed];
              float v375 = v374;
              double v376 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
              [v376 floatValue];
              BOOL v378 = v375 > v377;

              if (v378)
              {
                v379 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v379, OS_LOG_TYPE_INFO))
                {
                  v380 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
                  [v380 floatValue];
                  float v382 = v381;
                  v383 = [v770 bundleIdentifier];
                  v384 = [v770 suggestionIdentifier];
                  id v385 = [v770 bundleSubType];
                  [v770 bundleRecencyDaysElapsed];
                  *(_DWORD *)buf = 134219010;
                  *(double *)&uint8_t buf[4] = v382;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v383;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v895 = v384;
                  *(_WORD *)&v895[8] = 2048;
                  *(void *)&v895[10] = v385;
                  *(_WORD *)&v895[18] = 2048;
                  *(double *)&v895[20] = v386;
                  _os_log_impl((void *)&_mh_execute_header, v379, OS_LOG_TYPE_INFO, "Suggestion was dismissed from Recommended tab because elapsed time >%.2f days: bundleID %@, suggestionID %@, bundleSubType %lu, elapsedTime %.2f", buf, 0x34u);
                }
                uint64_t v57 = 3;
                uint64_t v716 = 2;
              }
            }
            if ([v770 bundleSuperType] == (id)8)
            {
              [v770 bundleRecencyDaysElapsed];
              float v388 = v387;
              v389 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForStateOfMind"];
              [v389 floatValue];
              BOOL v391 = v388 > v390;

              v392 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              BOOL v393 = os_log_type_enabled(v392, OS_LOG_TYPE_INFO);
              if (v391)
              {
                if (v393)
                {
                  double v394 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
                  [v394 floatValue];
                  float v396 = v395;
                  v397 = [v770 bundleIdentifier];
                  v398 = [v770 suggestionIdentifier];
                  id v399 = [v770 bundleSuperType];
                  [v770 bundleRecencyDaysElapsed];
                  *(_DWORD *)buf = 134219010;
                  *(double *)&uint8_t buf[4] = v396;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v397;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v895 = v398;
                  *(_WORD *)&v895[8] = 2048;
                  *(void *)&v895[10] = v399;
                  *(_WORD *)&v895[18] = 2048;
                  *(double *)&v895[20] = v400;
                  _os_log_impl((void *)&_mh_execute_header, v392, OS_LOG_TYPE_INFO, "Suggestion was dismissed from Recommended tab because elapsed time >%.2f days: bundleID %@, suggestionID %@,bundleSubType %lu, elapsedTime %.2f, ", buf, 0x34u);
                }
                uint64_t v57 = 3;
                uint64_t v716 = 2;
              }
              else if (v393)
              {
                v401 = [(NSDictionary *)self->_curationParameterDict objectForKeyedSubscript:@"maxDaysInRecommendedTabForContact"];
                [v401 floatValue];
                float v403 = v402;
                v404 = [v770 bundleIdentifier];
                v405 = [v770 suggestionIdentifier];
                [v770 bundleRecencyDaysElapsed];
                float v407 = v406;
                id v408 = [v770 bundleSuperType];
                *(_DWORD *)buf = 134219266;
                *(double *)&uint8_t buf[4] = v403;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v404;
                *(_WORD *)&buf[22] = 2112;
                *(void *)v895 = v405;
                *(_WORD *)&v895[8] = 2048;
                *(double *)&v895[10] = v407;
                *(_WORD *)&v895[18] = 1024;
                *(_DWORD *)&v895[20] = v745;
                *(_WORD *)&v895[24] = 2048;
                *(void *)&v895[26] = v408;
                _os_log_impl((void *)&_mh_execute_header, v392, OS_LOG_TYPE_INFO, "Suggestion was not dismissed from Recommended tab since elapsed time >%.2f days: bundleID %@, suggestionID %@ elapsedTime %.2f isBundleOrSubBundlesSelectedOrQuickAdded %d, bundleSuperType %lu,", buf, 0x3Au);
              }
            }
            if ((([v770 isBundleAggregated] & 1) != 0
               || [v770 summarizationGranularity] != (id)1
               || [v770 bundleSuperType] == (id)3)
              && [v770 bundleSubType] != (id)102)
            {
              goto LABEL_233;
            }
            v351 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            BOOL v409 = os_log_type_enabled(v351, OS_LOG_TYPE_INFO);
            if (elapsedDaysSinceOnboardingDate >= v622)
            {
              if (v409)
              {
                v413 = [v770 bundleIdentifier];
                v414 = [v770 suggestionIdentifier];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v413;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v414;
                _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_INFO, "Fine granularity summary suggestion was set to present only in Recent tab: bundleID %@, suggestionID %@", buf, 0x16u);
              }
              uint64_t v57 = 3;
              uint64_t v412 = 2;
            }
            else
            {
              if (v409)
              {
                v410 = [v770 bundleIdentifier];
                v411 = [v770 suggestionIdentifier];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v410;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v411;
                _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_INFO, "Fine granularity summary suggestion was set to present on Recommended tab to enrich Recommended tab: bundleID %@, suggestionID %@", buf, 0x16u);
              }
              uint64_t v57 = 1;
              uint64_t v412 = 1;
            }
            uint64_t v716 = v412;
LABEL_232:

LABEL_233:
            v615 = (void *)v360;
LABEL_234:
            if ([v770 isBundleAggregated]
              && (![v770 summarizationGranularity]
               || [v770 summarizationGranularity] == (id)1
               || [v770 summarizationGranularity] == (id)2))
            {
              v415 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              if (os_log_type_enabled(v415, OS_LOG_TYPE_INFO))
              {
                v416 = [v770 bundleIdentifier];
                v417 = [v770 suggestionIdentifier];
                id v418 = [v770 summarizationGranularity];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v416;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v417;
                *(_WORD *)&buf[22] = 2048;
                *(void *)v895 = v418;
                _os_log_impl((void *)&_mh_execute_header, v415, OS_LOG_TYPE_INFO, "Suggestion was rejected due to isBundleAggregated label: bundleID %@, suggestionID %@ summarizationGranularity %lu", buf, 0x20u);
              }
            }
            else
            {
              if (v57 == 4 || ![v770 isSensitivePOI])
              {
LABEL_247:
                if (v747)
                {
                  v425 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                  if (os_log_type_enabled(v425, OS_LOG_TYPE_INFO))
                  {
                    v426 = [v770 bundleIdentifier];
                    v427 = [v770 suggestionIdentifier];
                    id v428 = [v770 bundleSubType];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v426;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v427;
                    *(_WORD *)&buf[22] = 2048;
                    *(void *)v895 = v428;
                    _os_log_impl((void *)&_mh_execute_header, v425, OS_LOG_TYPE_INFO, "Suggestion was rejected due to isBundleOrSubBundleDeleted: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                  }
                  if ([v770 bundleSubType] == (id)203)
                  {
                    int v611 = 0;
                    goto LABEL_271;
                  }
                  id v434 = [v770 bundleSubType];
                }
                else
                {
                  if (v57 == 4) {
                    unsigned int v429 = 0;
                  }
                  else {
                    unsigned int v429 = v745;
                  }
                  if (v429 != 1) {
                    goto LABEL_273;
                  }
                  if (([v770 isBundleAggregated] & 1) != 0
                    || [v770 summarizationGranularity] != (id)2)
                  {
                    if ([v770 bundleSubType] == (id)303)
                    {
                      v435 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                      if (os_log_type_enabled(v435, OS_LOG_TYPE_INFO))
                      {
                        double v436 = [v770 bundleIdentifier];
                        v437 = [v770 suggestionIdentifier];
                        id v438 = [v770 bundleSubType];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&uint8_t buf[4] = v436;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v437;
                        *(_WORD *)&buf[22] = 2048;
                        *(void *)v895 = v438;
                        _os_log_impl((void *)&_mh_execute_header, v435, OS_LOG_TYPE_INFO, "Contact trend bundle got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                      }
                    }
                    else
                    {
                      BOOL v439 = [v770 bundleSubType] == (id)203;
                      v435 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                      BOOL v440 = os_log_type_enabled(v435, OS_LOG_TYPE_INFO);
                      if (!v439)
                      {
                        if (v440)
                        {
                          uint64_t v455 = [v770 bundleIdentifier];
                          v456 = [v770 suggestionIdentifier];
                          id v457 = [v770 bundleSubType];
                          *(_DWORD *)buf = 134219522;
                          *(void *)&uint8_t buf[4] = v716;
                          *(_WORD *)&buf[12] = 2048;
                          *(void *)&buf[14] = v57;
                          *(_WORD *)&buf[22] = 2048;
                          *(void *)v895 = 2;
                          *(_WORD *)&v895[8] = 2048;
                          *(void *)&v895[10] = 3;
                          *(_WORD *)&v895[18] = 2112;
                          *(void *)&v895[20] = v455;
                          *(_WORD *)&v895[28] = 2112;
                          *(void *)&v895[30] = v456;
                          __int16 v896 = 2048;
                          id v897 = v457;
                          _os_log_impl((void *)&_mh_execute_header, v435, OS_LOG_TYPE_INFO, "(rankingCategory,visibilityCategory) were updated from (%lu,%lu) to (%lu,%lu) due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@, bundleSubType %lu", buf, 0x48u);
                        }
                        uint64_t v57 = 3;
                        uint64_t v444 = 2;
                        goto LABEL_272;
                      }
                      if (v440)
                      {
                        v441 = [v770 bundleIdentifier];
                        double v442 = [v770 suggestionIdentifier];
                        id v443 = [v770 bundleSubType];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&uint8_t buf[4] = v441;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v442;
                        *(_WORD *)&buf[22] = 2048;
                        *(void *)v895 = v443;
                        _os_log_impl((void *)&_mh_execute_header, v435, OS_LOG_TYPE_INFO, "Workout routine bundle got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                      }
                    }

LABEL_271:
                    uint64_t v57 = 4;
                    uint64_t v444 = 3;
LABEL_272:
                    uint64_t v716 = v444;
LABEL_273:
                    if (([v770 isWorkVisit] & 1) == 0
                      && ![v770 isShortVisit])
                    {
                      goto LABEL_121;
                    }
                    [v770 numPhotoAssetsResourcesNormalized];
                    if (v445 != 0.0) {
                      goto LABEL_121;
                    }
                    v243 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                    if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
                    {
                      v446 = [v770 bundleIdentifier];
                      v447 = [v770 suggestionIdentifier];
                      unsigned int v448 = [v770 isWorkVisit];
                      unsigned int v449 = [v770 isShortVisit];
                      *(_DWORD *)buf = 138413058;
                      *(void *)&uint8_t buf[4] = v446;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v447;
                      *(_WORD *)&buf[22] = 1024;
                      *(_DWORD *)v895 = v448;
                      *(_WORD *)&v895[4] = 1024;
                      *(_DWORD *)&v895[6] = v449;
                      _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_INFO, "Outing suggestion was rejected because it was either work or short visit (or both) without any photo: bundleID %@, suggestionID %@ isWorkVisit %d isShortVisit %d", buf, 0x22u);
                    }
                    unsigned int v681 = 1;
LABEL_128:
                    uint64_t v716 = 3;
                    uint64_t v57 = 4;
                    goto LABEL_129;
                  }
                  double v430 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                  if (os_log_type_enabled(v430, OS_LOG_TYPE_INFO))
                  {
                    v431 = [v770 bundleIdentifier];
                    v432 = [v770 suggestionIdentifier];
                    id v433 = [v770 bundleSubType];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v431;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v432;
                    *(_WORD *)&buf[22] = 2048;
                    *(void *)v895 = v433;
                    _os_log_impl((void *)&_mh_execute_header, v430, OS_LOG_TYPE_INFO, "Coarse summary suggestion got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);
                  }
                  id v434 = [v770 bundleSubType];
                }
                int v613 = (v434 != (id)202) & v613;
                goto LABEL_271;
              }
              v415 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              BOOL v420 = os_log_type_enabled(v415, OS_LOG_TYPE_INFO);
              if (v57 != 2)
              {
                if (v420)
                {
                  v450 = [v770 bundleIdentifier];
                  uint64_t v451 = [v770 suggestionIdentifier];
                  v452 = [v770 bundleStartDate];
                  id v453 = [v770 bundleEndDate];
                  *(_DWORD *)buf = 138413058;
                  *(void *)&uint8_t buf[4] = v450;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v451;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v895 = v452;
                  *(_WORD *)&v895[8] = 2112;
                  *(void *)&v895[10] = v453;
                  _os_log_impl((void *)&_mh_execute_header, v415, OS_LOG_TYPE_INFO, "Suggestion was set to recent only since it contains sensitive POI: bundleID %@, suggestionID %@ startDate %@ endDate %@", buf, 0x2Au);
                }
                uint64_t v57 = 3;
                uint64_t v419 = 2;
                goto LABEL_241;
              }
              if (v420)
              {
                v421 = [v770 bundleIdentifier];
                v422 = [v770 suggestionIdentifier];
                v423 = [v770 bundleStartDate];
                double v424 = [v770 bundleEndDate];
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v421;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v422;
                *(_WORD *)&buf[22] = 2112;
                *(void *)v895 = v423;
                *(_WORD *)&v895[8] = 2112;
                *(void *)&v895[10] = v424;
                _os_log_impl((void *)&_mh_execute_header, v415, OS_LOG_TYPE_INFO, "Suggestion (recommended only) was rejected since it contains sensitive POI: bundleID %@, suggestionID %@ startDate %@ endDate %@", buf, 0x2Au);
              }
            }
            uint64_t v57 = 4;
            uint64_t v419 = 3;
LABEL_241:
            uint64_t v716 = v419;

            goto LABEL_247;
          }
          float v298 = -1.0;
          if ([v770 bundleSubType] == (id)105)
          {
            BOOL v56 = 0;
            BOOL v55 = 1;
LABEL_161:
            float v60 = -1.0;
            goto LABEL_169;
          }
          if ([v770 bundleSubType] == (id)201)
          {
            v309 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v310 = [v309 objectForKeyedSubscript:@"suggestionAcceptThresholdForWorkoutSubtype"];
            [v310 floatValue];
            float v60 = v311;

            double v312 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v313 = [v312 objectForKeyedSubscript:@"suggestionRecommendThresholdForWorkoutSubtype"];
            [v313 floatValue];
            float v298 = v314;

            v315 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            double v316 = [v315 objectForKeyedSubscript:@"summarizationThresholdForWorkoutSubType"];
            [v316 floatValue];
            float v318 = v317;

            v319 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            double v320 = [v319 objectForKeyedSubscript:@"tripSummarizationThresholdForWorkoutSubType"];
            [v320 floatValue];
            float v322 = v321;

            BOOL v56 = v58 > v318;
            BOOL v55 = v58 > v322;
            goto LABEL_169;
          }
          double v324 = (void *)phoneSensedWalkingVariants;
          v325 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
          LODWORD(v324) = [v324 containsObject:v325];

          if (v324)
          {
            v326 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v327 = [v326 objectForKeyedSubscript:@"suggestionAcceptThresholdForMotionActivityWalkingSubtype"];
            [v327 floatValue];
            float v60 = v328;

            v329 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v330 = [v329 objectForKeyedSubscript:@"suggestionRecommendThresholdForMotionActivityWalkingSubtype"];
            [v330 floatValue];
            float v298 = v331;

            double v332 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
            v333 = [v332 objectForKeyedSubscript:@"summarizationThresholdForMotionActivityWalkingSubType"];
            [v333 floatValue];
            BOOL v335 = v58 > v334;

            if (v335)
            {
              BOOL v55 = 0;
              BOOL v56 = 1;
              goto LABEL_169;
            }
          }
          else
          {
            if ([v770 bundleSubType] == (id)202)
            {
              uint64_t v336 = [v770 bundleStartDate];

              uint64_t v337 = [v770 bundleEndDate];

              v338 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v339 = [v338 objectForKeyedSubscript:@"suggestionAcceptThresholdForWorkoutWeeklySummarySubType"];
              [v339 floatValue];
              float v60 = v340;

              v341 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v342 = [v341 objectForKeyedSubscript:@"suggestionRecommendThresholdForWorkoutWeeklySummarySubType"];
              [v342 floatValue];
              float v298 = v343;

              BOOL v55 = 0;
              BOOL v56 = 0;
              v608 = (void *)v337;
              v609 = (void *)v336;
              goto LABEL_169;
            }
            if ([v770 bundleSubType] == (id)301 || objc_msgSend(v770, "bundleSubType") == (id)303)
            {
              v458 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v459 = [v458 objectForKeyedSubscript:@"suggestionAcceptThresholdForContactSubType"];
              [v459 floatValue];
              float v60 = v460;

              v461 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v462 = [v461 objectForKeyedSubscript:@"suggestionRecommendThresholdForContactSubType"];
              [v462 floatValue];
              float v298 = v463;
            }
            else if ([v770 bundleSubType] == (id)302)
            {
              v464 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v465 = [v464 objectForKeyedSubscript:@"suggestionAcceptThresholdForContactWeeklySummarySubType"];
              [v465 floatValue];
              float v60 = v466;

              v467 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
              v468 = [v467 objectForKeyedSubscript:@"suggestionRecommendThresholdForContactWeeklySummarySubType"];
              [v468 floatValue];
              float v298 = v469;
            }
            else
            {
              v470 = (void *)dailyMediaSubtypeVariants;
              v471 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
              LODWORD(v470) = [v470 containsObject:v471];

              if (v470)
              {
                v472 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                v473 = [v472 objectForKeyedSubscript:@"suggestionAcceptThresholdForDailyMediaVariants"];
                [v473 floatValue];
                float v60 = v474;

                v475 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                v476 = [v475 objectForKeyedSubscript:@"suggestionRecommendThresholdForDailyMediaVariants"];
                [v476 floatValue];
                float v298 = v477;
              }
              else
              {
                v478 = (void *)MediaWeeklySummarySubtypeVariants;
                v479 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
                LODWORD(v478) = [v478 containsObject:v479];

                if (v478)
                {
                  v480 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  double v481 = [v480 objectForKeyedSubscript:@"suggestionAcceptThresholdForWeeklyMediaSummaryVariants"];
                  [v481 floatValue];
                  float v60 = v482;

                  v483 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  v484 = [v483 objectForKeyedSubscript:@"suggestionRecommendThresholdForWeeklyMediaSummaryVariants"];
                  [v484 floatValue];
                  float v298 = v485;
                }
                else
                {
                  v486 = (void *)timeAtHomeSubtypeVariants;
                  v487 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
                  LODWORD(v486) = [v486 containsObject:v487];

                  if (!v486)
                  {
                    BOOL v55 = 0;
                    BOOL v56 = 0;
                    goto LABEL_161;
                  }
                  v488 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  v489 = [v488 objectForKeyedSubscript:@"suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"];
                  [v489 floatValue];
                  float v60 = v490;

                  v491 = [(MOEventBundleRanking *)self rankingScoreThresholdDict];
                  v492 = [v491 objectForKeyedSubscript:@"suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"];
                  [v492 floatValue];
                  float v298 = v493;
                }
              }
            }
          }
LABEL_158:
          BOOL v55 = 0;
          BOOL v56 = 0;
          goto LABEL_169;
        }
        if ([v770 bundleInterfaceType] == (id)11
          && ([v770 evergreenPromptExists] & 1) == 0)
        {
          long long v246 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v246, OS_LOG_TYPE_INFO))
          {
            long long v247 = [v770 bundleIdentifier];
            long long v248 = [v770 suggestionIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v247;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v248;
            _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_INFO, "Evergreen suggestion got rejected because prompt doesn't exist: bundleID %@, suggestionID %@", buf, 0x16u);
          }
          uint64_t v57 = 4;
          uint64_t v242 = 3;
        }
        else
        {
          uint64_t v57 = 2;
          uint64_t v242 = 1;
        }
        uint64_t v716 = v242;
        BOOL v55 = 0;
        float v59 = -1.0;
        if ([v770 bundleInterfaceType] == (id)10 && v745 | v747)
        {
          v243 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          float v60 = -1.0;
          if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
          {
            long long v249 = [v770 bundleIdentifier];
            v250 = [v770 suggestionIdentifier];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v249;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v250;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v895 = v745;
            *(_WORD *)&v895[4] = 1024;
            *(_DWORD *)&v895[6] = v747;
            _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_INFO, "Photo Memory suggestion got rejected due to engagement signal: bundleID %@, suggestionID %@, isBundleOrSubBundlesSelectedOrQuickAdded %d, isBundleOrSubBundleDeleted %d", buf, 0x22u);
          }
          BOOL v56 = 0;
          BOOL v55 = 0;
          unsigned int v681 = 0;
          goto LABEL_128;
        }
        BOOL v56 = 0;
        float v60 = -1.0;
LABEL_121:
        if ((unint64_t)(v57 - 1) > 1 || [v770 bundleInterfaceType] == (id)11)
        {
          unsigned int v681 = 0;
          goto LABEL_130;
        }
        v286 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleInterfaceType]);
        v287 = [v620 objectForKeyedSubscript:v286];
        signed int v288 = [v287 intValue];

        v243 = +[NSNumber numberWithUnsignedInteger:v288 + 1];
        v289 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleInterfaceType]);
        [v620 setObject:v243 forKeyedSubscript:v289];

        unsigned int v681 = 0;
LABEL_129:

LABEL_130:
        signed int v253 = [(MOConfigurationManagerBase *)self->_configurationManager getIntegerSettingForKey:@"EventManagerOverridePatternRehydrationFailureCountThreshold" withFallback:10];
        long long v867 = 0u;
        long long v866 = 0u;
        long long v865 = 0u;
        long long v864 = 0u;
        double v254 = [v770 events];
        id v255 = [v254 countByEnumeratingWithState:&v864 objects:v893 count:16];
        if (v255)
        {
          uint64_t v256 = *(void *)v865;
          unint64_t v257 = v253;
          do
          {
            for (k = 0; k != v255; k = (char *)k + 1)
            {
              if (*(void *)v865 != v256) {
                objc_enumerationMutation(v254);
              }
              v259 = *(void **)(*((void *)&v864 + 1) + 8 * (void)k);
              if ((unint64_t)[v259 rehydrationFailCount] >= v257)
              {
                v260 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                if (os_log_type_enabled(v260, OS_LOG_TYPE_INFO))
                {
                  v261 = [v770 bundleIdentifier];
                  id v262 = [v259 rehydrationFailCount];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v261;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v262;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v895 = v259;
                  _os_log_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_INFO, "rejecting bundle %@ due to rehydration failures count bigger than threshold, %lu, in event %@", buf, 0x20u);
                }
                uint64_t v57 = 4;
              }
            }
            id v255 = [v254 countByEnumeratingWithState:&v864 objects:v893 count:16];
          }
          while (v255);
        }

        if (v57 != 4)
        {
          id v263 = [v770 bundleInterfaceType];
          unint64_t v264 = v619;
          if (v263 != (id)11) {
            unint64_t v264 = v619 + 1;
          }
          unint64_t v619 = v264;
        }

LABEL_146:
        if (v61 > 1.0) {
          float v61 = 1.0;
        }
        v891[0] = @"richnessScore";
        *(float *)&double v63 = v64;
        v765 = +[NSNumber numberWithFloat:v63];
        v892[0] = v765;
        v891[1] = @"distinctnessScore";
        *(float *)&double v265 = v756;
        id v760 = +[NSNumber numberWithFloat:v265];
        v892[1] = v760;
        v891[2] = @"heuristicsScore";
        *(float *)&double v266 = v740;
        v751 = +[NSNumber numberWithFloat:v266];
        v892[2] = v751;
        v891[3] = @"qualityScore";
        *(float *)&double v267 = v733;
        v743 = +[NSNumber numberWithFloat:v267];
        v892[3] = v743;
        v891[4] = @"engagementScore";
        *(float *)&double v268 = v737;
        v738 = +[NSNumber numberWithFloat:v268];
        v892[4] = v738;
        v891[5] = @"baseScore";
        v736 = +[NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(fmaxf(v62, 0.0)))];
        v892[5] = v736;
        v891[6] = @"bundleInterfaceType";
        v732 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleInterfaceType]);
        v892[6] = v732;
        v891[7] = @"bundleSubType";
        v729 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSubType]);
        v892[7] = v729;
        v891[8] = @"bundleSuperType";
        v726 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v770 bundleSuperType]);
        v892[8] = v726;
        v891[9] = @"decayFactor";
        *(float *)&double v269 = v61;
        v722 = +[NSNumber numberWithFloat:v269];
        v892[9] = v722;
        v891[10] = @"rankingCategory";
        v718 = +[NSNumber numberWithUnsignedInteger:v716];
        v892[10] = v718;
        v891[11] = @"visibilityCategoryForUI";
        v715 = +[NSNumber numberWithUnsignedInteger:v57];
        v892[11] = v715;
        v891[12] = @"viewCountBasedScoreAdjustment";
        v713 = +[NSNumber numberWithFloat:0.0];
        v892[12] = v713;
        v891[13] = @"bundleGoodnessScore";
        *(float *)&double v270 = v58;
        v711 = +[NSNumber numberWithFloat:v270];
        v892[13] = v711;
        v891[14] = @"elapsedDaysFromBundleEndDate";
        [v770 bundleRecencyDaysElapsed];
        v709 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v892[14] = v709;
        v891[15] = @"bundleIdentifier";
        v707 = [v770 bundleIdentifier];
        v892[15] = v707;
        v891[16] = @"suggestionIdentifier";
        v705 = [v770 suggestionIdentifier];
        v892[16] = v705;
        v892[17] = &off_1000B6F30;
        v891[17] = @"isDuplicated";
        v891[18] = @"isEligibleForTimeContextSummarization";
        v703 = +[NSNumber numberWithBool:v56];
        v892[18] = v703;
        v891[19] = @"isEligibleForTripSummarization";
        v701 = +[NSNumber numberWithBool:v55];
        v892[19] = v701;
        v892[20] = &off_1000B6F30;
        v891[20] = @"isPseudoDupInRecommendedTab";
        v891[21] = @"isPseudoDupInRecentTab";
        v892[21] = &off_1000B6F30;
        v892[22] = &off_1000B6F30;
        v891[22] = @"isWithinHoldOffPeriod";
        v891[23] = @"allPlaceNamesSet";
        v699 = [v770 allPlaceNames];
        v892[23] = v699;
        v891[24] = @"workoutTypesSet";
        v697 = [v770 workoutTypes];
        v892[24] = v697;
        v891[25] = @"allContactIdentifiersSet";
        v695 = [v770 allContactIdentifiers];
        v892[25] = v695;
        v891[26] = @"allStateOfMindIdentifiersSet";
        v693 = [v770 allStateOfMindIdentifiers];
        v892[26] = v693;
        v891[27] = @"stateOfMindLoggedIn3pApp";
        [v770 stateOfMindLoggedIn3pApp];
        v691 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v892[27] = v691;
        v891[28] = @"stateOfMindLoggedInJournalApp";
        [v770 stateOfMindLoggedInJournalApp];
        v689 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v892[28] = v689;
        v891[29] = @"numAnomalyEventsNormalized";
        [v770 numAnomalyEventsNormalized];
        v687 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v892[29] = v687;
        v891[30] = @"numPhotoAssetsResourcesNormalized";
        [v770 numPhotoAssetsResourcesNormalized];
        v271 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v892[30] = v271;
        v891[31] = @"isCoarseGranularitySummaryKey";
        BOOL v273 = ([v770 isBundleAggregated] & 1) == 0
            && [v770 summarizationGranularity] == (id)2;
        *(float *)&double v272 = elapsedDaysSinceOnboardingDate;
        v274 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v273, v272);
        v892[31] = v274;
        v891[32] = @"isBundleOrSubBundleDeleted";
        v275 = +[NSNumber numberWithBool:v747];
        v892[32] = v275;
        v891[33] = @"isBundleOrSubBundlesSelectedOrQuickAdded";
        double v276 = +[NSNumber numberWithBool:v745];
        v892[33] = v276;
        v891[34] = @"bundleStartDate";
        v277 = [v770 bundleStartDate];
        v892[34] = v277;
        v891[35] = @"bundleEndDate";
        v278 = [v770 bundleEndDate];
        v892[35] = v278;
        v891[36] = @"suppressCoarseSummarization";
        v279 = +[NSNumber numberWithBool:elapsedDaysSinceOnboardingDate < v622];
        v892[36] = v279;
        v891[37] = @"suggestionAcceptThreshold";
        *(float *)&double v280 = v60;
        v281 = +[NSNumber numberWithFloat:v280];
        v892[37] = v281;
        v891[38] = @"suggestionRecommendThreshold";
        *(float *)&double v282 = v59;
        v283 = +[NSNumber numberWithFloat:v282];
        v892[38] = v283;
        v891[39] = @"kRejectedByVisitHeuristicsFilter";
        double v284 = +[NSNumber numberWithBool:v681];
        v892[39] = v284;
        v771 = +[NSDictionary dictionaryWithObjects:v892 forKeys:v891 count:40];

        v285 = [(MOEventBundleRanking *)self _checkAndUpdateNumericLimits:v771];
        [v624 addObject:v285];

        uint64_t v29 = v683 + 1;
        if ((id)(v683 + 1) != v625) {
          continue;
        }
        break;
      }
      id v494 = [v618 countByEnumeratingWithState:&v874 objects:v900 count:16];
      id v625 = v494;
      if (v494) {
        continue;
      }
      break;
    }
LABEL_301:

    v495 = [v620 allValues];
    v496 = [v495 valueForKeyPath:@"@sum.self"];
    signed int v497 = [v496 intValue];

    double v498 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    unint64_t v25 = v497;
    if (os_log_type_enabled(v498, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v619;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v497;
      *(_WORD *)&buf[22] = 2048;
      *(void *)v895 = v612;
      _os_log_impl((void *)&_mh_execute_header, v498, OS_LOG_TYPE_INFO, "Current allowed sensed bundle count=%lu, total sensed bundle count in Recommended tab =%lu, minimum sensed bundle count threshold in Recommended tab %lu", buf, 0x20u);
    }

    if (v619)
    {
      if (v619 != v497)
      {
        if (v612 <= v497)
        {
          id v6 = v620;
        }
        else
        {
          id v6 = objc_opt_new();

          v499 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v499, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)&uint8_t buf[4] = v25;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v612;
            *(_WORD *)&buf[22] = 2048;
            *(double *)v895 = v614;
            _os_log_impl((void *)&_mh_execute_header, v499, OS_LOG_TYPE_INFO, "Sensed suggestion count in Recommended tab (%lu) is less than required (%lu). Setting lower recommended threshold %f ", buf, 0x20u);
          }
        }
        float v26 = v614 + -0.25;
        if ((float)(v614 + -0.25) < 0.0)
        {
          v500 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v500, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v612;
            _os_log_impl((void *)&_mh_execute_header, v500, OS_LOG_TYPE_INFO, "Recommendation threshold is set to rejection threshold, but still can't satisfy minimum suggestion count requirement (%lu). continue", buf, 0xCu);
          }
          v620 = v6;
          break;
        }
        continue;
      }
      v500 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v500, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v500, OS_LOG_TYPE_INFO, "Labeled all unrejected bundles to be shown on Recommended tab", buf, 2u);
      }
      unint64_t v25 = v619;
    }
    else
    {
      v500 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v500, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v500, OS_LOG_TYPE_INFO, "No bundle available for the sheet", buf, 2u);
      }
    }
    break;
  }

LABEL_321:
  v501 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v501, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.6(v611 & 1, v613 & 1, v501);
  }

  v502 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v502, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.5();
  }

  if (v611 & v613)
  {
    if ([v610 isEqualToSet:v615])
    {
      v503 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v503, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v503, OS_LOG_TYPE_INFO, "Both Workout Routine and weekly workout summary are eligible for recommended tab. Tagging weekly summary to be suppressed downstream.", buf, 2u);
      }

      LOBYTE(v613) = 0;
    }
    else
    {
      LOBYTE(v613) = 1;
    }
  }
  float frequencyPenalty = self->_frequencyPenalty;
  v772 = objc_opt_new();
  long long v863 = 0u;
  long long v862 = 0u;
  long long v861 = 0u;
  long long v860 = 0u;
  v505 = [v620 allKeys];
  id v506 = [v505 countByEnumeratingWithState:&v860 objects:v890 count:16];
  if (v506)
  {
    float v507 = log((float)(frequencyPenalty + 1.0));
    uint64_t v508 = *(void *)v861;
    double v509 = v507;
    do
    {
      for (m = 0; m != v506; m = (char *)m + 1)
      {
        if (*(void *)v861 != v508) {
          objc_enumerationMutation(v505);
        }
        uint64_t v511 = *(void *)(*((void *)&v860 + 1) + 8 * (void)m);
        if (v25)
        {
          v512 = [v620 objectForKeyedSubscript:*(void *)(*((void *)&v860 + 1) + 8 * (void)m)];
          [v512 floatValue];
          float v514 = v513;

          long double v515 = log((float)((float)(self->_frequencyPenalty * (float)(1.0 - (float)(v514 / (float)v25))) + 1.0)) / v509;
          *(float *)&long double v515 = v515;
          v516 = +[NSNumber numberWithFloat:(double)v515];
          [v772 setObject:v516 forKeyedSubscript:v511];
        }
        else
        {
          [v772 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v860 + 1) + 8 * (void)m)];
        }
      }
      id v506 = [v505 countByEnumeratingWithState:&v860 objects:v890 count:16];
    }
    while (v506);
  }

  v517 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v517, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.4();
  }

  v518 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v518, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]();
  }

  v519 = [v772 allKeys];
  id v752 = [v519 count];

  v766 = objc_opt_new();
  long long v859 = 0u;
  long long v858 = 0u;
  long long v857 = 0u;
  long long v856 = 0u;
  id v761 = v624;
  id v520 = [v761 countByEnumeratingWithState:&v856 objects:v889 count:16];
  if (v520)
  {
    uint64_t v521 = 0;
    uint64_t v522 = *(void *)v857;
    do
    {
      for (n = 0; n != v520; n = (char *)n + 1)
      {
        if (*(void *)v857 != v522) {
          objc_enumerationMutation(v761);
        }
        v524 = *(void **)(*((void *)&v856 + 1) + 8 * (void)n);
        v525 = [v524 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        unsigned int v526 = [v525 intValue];

        v527 = [v524 objectForKeyedSubscript:@"bundleInterfaceType"];
        v528 = v527;
        if (v526 - 1 > 1)
        {
          float v541 = 0.0;
          float v531 = 1.0;
          if ([v527 intValue] != 11) {
            goto LABEL_361;
          }
        }
        else
        {
          v529 = [v772 objectForKeyedSubscript:v527];
          [v529 floatValue];
          float v531 = v530;

          if (v752 == (id)1) {
            float v531 = 1.0;
          }
          if ([v528 intValue] != 11)
          {
            id v532 = [v524 objectForKeyedSubscript:@"baseScore"];
            [v532 floatValue];
            float v534 = v533;
            v535 = [v524 objectForKeyedSubscript:@"viewCountBasedScoreAdjustment"];
            [v535 floatValue];
            float v537 = v536;

            if ((float)(v534 + v537) >= 0.0) {
              float v538 = v534 + v537;
            }
            else {
              float v538 = 0.0;
            }
            v539 = [v524 objectForKeyedSubscript:@"decayFactor"];
            [v539 floatValue];
            float v541 = v531 * (float)(v538 * v540);
            goto LABEL_360;
          }
        }
        v539 = [v524 objectForKeyedSubscript:@"baseScore"];
        [v539 floatValue];
        float v541 = v542;
LABEL_360:

LABEL_361:
        unsigned int v543 = objc_opt_new();
        [v543 addEntriesFromDictionary:v524];
        *(float *)&double v544 = v541;
        v545 = +[NSNumber numberWithFloat:v544];
        [v543 setObject:v545 forKey:@"rankingScore"];

        *(float *)&double v546 = v531;
        v547 = +[NSNumber numberWithFloat:v546];
        [v543 setObject:v547 forKey:@"diversityCoefficient"];

        id v548 = +[NSNumber numberWithUnsignedInteger:(char *)n + v521];
        [v543 setObject:v548 forKey:@"rankingDictionaryIndex"];

        [v766 addObject:v543];
      }
      id v520 = [v761 countByEnumeratingWithState:&v856 objects:v889 count:16];
      v521 += (uint64_t)n;
    }
    while (v520);
  }

  v753 = +[NSCalendar currentCalendar];
  v549 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v549, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]();
  }

  long long v550 = [v753 components:28 fromDate:v684];
  long long v551 = [v753 dateFromComponents:v550];

  v719 = [v753 components:28 fromDate:v685];

  long long v552 = [v753 dateFromComponents:v719];

  v748 = [v753 dateByAddingUnit:16 value:1 toDate:v552 options:0];

  v746 = objc_opt_new();
  id v723 = v551;
  long long v553 = v723;
  if ([v723 compare:v748] == (id)-1)
  {
    long long v553 = v723;
    do
    {
      id v591 = v553;
      v592 = [v753 dateByAddingUnit:16 value:1 toDate:v591 options:0];
      v853[0] = _NSConcreteStackBlock;
      v853[1] = 3221225472;
      v853[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke;
      v853[3] = &unk_1000A6FF8;
      id v593 = v591;
      id v854 = v593;
      id v594 = v592;
      id v855 = v594;
      v595 = +[NSPredicate predicateWithBlock:v853];
      v596 = [v766 filteredArrayUsingPredicate:v595];
      v597 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v597, OS_LOG_TYPE_DEBUG))
      {
        id v605 = [v596 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v593;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v594;
        *(_WORD *)&buf[22] = 2048;
        *(void *)v895 = v605;
        _os_log_debug_impl((void *)&_mh_execute_header, v597, OS_LOG_TYPE_DEBUG, "RankingDict count between %@-%@:%lu", buf, 0x20u);
      }

      v598 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1000B8288];
      v599 = [v596 filteredArrayUsingPredicate:v598];

      v600 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v600, OS_LOG_TYPE_DEBUG)) {
        -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]((uint64_t)v888, (uint64_t)v599);
      }

      v601 = +[NSSortDescriptor sortDescriptorWithKey:@"bundleGoodnessScore" ascending:0];
      v602 = +[NSArray arrayWithObject:v601];
      v603 = [v599 sortedArrayUsingDescriptors:v602];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)v895 = __Block_byref_object_copy__4;
      *(void *)&v895[8] = __Block_byref_object_dispose__4;
      *(void *)&v895[16] = objc_opt_new();
      uint64_t v833 = 0;
      v834 = &v833;
      uint64_t v835 = 0x2020000000;
      v836 = 0;
      uint64_t v827 = 0;
      v828 = &v827;
      uint64_t v829 = 0x2020000000;
      LOBYTE(v830) = 0;
      v847[0] = _NSConcreteStackBlock;
      v847[1] = 3221225472;
      v847[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1107;
      v847[3] = &unk_1000A7020;
      v847[4] = self;
      id v848 = v746;
      id v604 = v766;
      id v849 = v604;
      v850 = buf;
      v851 = &v833;
      v852 = &v827;
      [v603 enumerateObjectsUsingBlock:v847];
      if (*((unsigned char *)v828 + 24) && v834[3] >= 2)
      {
        v845[0] = _NSConcreteStackBlock;
        v845[1] = 3221225472;
        v845[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1113;
        v845[3] = &unk_1000A7048;
        id v846 = v604;
        [v603 enumerateObjectsUsingBlock:v845];
      }
      _Block_object_dispose(&v827, 8);
      _Block_object_dispose(&v833, 8);
      _Block_object_dispose(buf, 8);

      long long v553 = [v753 dateByAddingUnit:16 value:1 toDate:v593 options:0];
    }
    while ([v553 compare:v748] == (id)-1);
  }

  v768 = objc_opt_new();
  id v739 = v723;
  objc_super v554 = v739;
  if ([v739 compare:v748] == (id)-1)
  {
    objc_super v554 = v739;
    do
    {
      id v555 = v554;
      v556 = [v753 dateByAddingUnit:16 value:1 toDate:v555 options:0];
      v842[0] = _NSConcreteStackBlock;
      v842[1] = 3221225472;
      v842[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1114;
      v842[3] = &unk_1000A6FF8;
      id v557 = v555;
      id v843 = v557;
      id v558 = v556;
      id v844 = v558;
      v559 = +[NSPredicate predicateWithBlock:v842];
      v560 = [v766 filteredArrayUsingPredicate:v559];
      v561 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1000B82A0];
      v562 = [v560 filteredArrayUsingPredicate:v561];

      v563 = +[NSSortDescriptor sortDescriptorWithKey:@"bundleStartDate" ascending:0];
      v564 = +[NSArray arrayWithObject:v563];
      v565 = [v562 sortedArrayUsingDescriptors:v564];

      v840[0] = _NSConcreteStackBlock;
      v840[1] = 3221225472;
      v840[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_2;
      v840[3] = &unk_1000A7048;
      id v841 = v768;
      [v565 enumerateObjectsUsingBlock:v840];

      objc_super v554 = [v753 dateByAddingUnit:16 value:1 toDate:v557 options:0];
    }
    while ([v554 compare:v748] == (id)-1);
  }

  uint64_t v566 = +[NSSortDescriptor sortDescriptorWithKey:@"rankingScore" ascending:0];
  v567 = +[NSArray arrayWithObject:v566];
  v568 = [v766 sortedArrayUsingDescriptors:v567];
  id v569 = [v568 mutableCopy];

  v839[0] = 0;
  v839[1] = v839;
  v839[2] = 0x2020000000;
  v839[3] = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)v895 = __Block_byref_object_copy__4;
  *(void *)&v895[8] = __Block_byref_object_dispose__4;
  *(void *)&v895[16] = objc_opt_new();
  uint64_t v833 = 0;
  v834 = &v833;
  uint64_t v835 = 0x3032000000;
  v836 = __Block_byref_object_copy__4;
  v837 = __Block_byref_object_dispose__4;
  id v838 = (id)objc_opt_new();
  uint64_t v827 = 0;
  v828 = &v827;
  uint64_t v829 = 0x3032000000;
  v830 = __Block_byref_object_copy__4;
  v831 = __Block_byref_object_dispose__4;
  id v832 = (id)objc_opt_new();
  v825[0] = 0;
  v825[1] = v825;
  v825[2] = 0x3032000000;
  v825[3] = __Block_byref_object_copy__4;
  v825[4] = __Block_byref_object_dispose__4;
  id v826 = (id)objc_opt_new();
  v823[0] = 0;
  v823[1] = v823;
  v823[2] = 0x3032000000;
  v823[3] = __Block_byref_object_copy__4;
  v823[4] = __Block_byref_object_dispose__4;
  id v824 = (id)objc_opt_new();
  v821[0] = 0;
  v821[1] = v821;
  v821[2] = 0x3032000000;
  v821[3] = __Block_byref_object_copy__4;
  v821[4] = __Block_byref_object_dispose__4;
  id v822 = (id)objc_opt_new();
  uint64_t v815 = 0;
  v816 = &v815;
  uint64_t v817 = 0x3032000000;
  v818 = __Block_byref_object_copy__4;
  v819 = __Block_byref_object_dispose__4;
  id v820 = (id)objc_opt_new();
  uint64_t v811 = 0;
  v812 = &v811;
  uint64_t v813 = 0x2020000000;
  uint64_t v814 = 0;
  uint64_t v807 = 0;
  v808 = &v807;
  uint64_t v809 = 0x2020000000;
  uint64_t v810 = 0;
  uint64_t v803 = 0;
  v804 = &v803;
  uint64_t v805 = 0x2020000000;
  uint64_t v806 = 0;
  v801[0] = 0;
  v801[1] = v801;
  v801[2] = 0x2020000000;
  char v802 = 0;
  v799[0] = 0;
  v799[1] = v799;
  v799[2] = 0x2020000000;
  char v800 = 0;
  v797[0] = 0;
  v797[1] = v797;
  v797[2] = 0x2020000000;
  char v798 = 0;
  v777[0] = _NSConcreteStackBlock;
  v777[1] = 3221225472;
  v777[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3;
  v777[3] = &unk_1000A7070;
  v782 = buf;
  v783 = &v833;
  v784 = &v827;
  v785 = &v807;
  id v570 = v768;
  id v778 = v570;
  char v796 = v613 & 1;
  id v744 = v609;
  id v779 = v744;
  id v769 = v608;
  id v780 = v769;
  v786 = v823;
  v787 = v825;
  v788 = v821;
  v789 = &v811;
  v790 = v839;
  v791 = &v815;
  v792 = v801;
  v793 = v799;
  v794 = v797;
  v795 = &v803;
  id v571 = v569;
  id v781 = v571;
  [v571 enumerateObjectsUsingBlock:v777];
  uint64_t v572 = v804[3];
  v573 = (void *)v566;
  if (v572 >= 24)
  {
    v808[3] = 0;
  }
  else
  {
    uint64_t v574 = 3;
    if (v572 > 15) {
      uint64_t v574 = 4;
    }
    if (v572 <= 19) {
      uint64_t v575 = v574;
    }
    else {
      uint64_t v575 = 5;
    }
    v808[3] = 0;
    v576 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v576, OS_LOG_TYPE_INFO))
    {
      v577 = (void *)v804[3];
      *(_DWORD *)v882 = 134218240;
      v883 = v577;
      __int16 v884 = 2048;
      uint64_t v885 = v575;
      _os_log_impl((void *)&_mh_execute_header, v576, OS_LOG_TYPE_INFO, "Total recommended sensed suggestion count=%ld, Adjust evergreen count to %ld", v882, 0x16u);
    }

    v773[0] = _NSConcreteStackBlock;
    v773[1] = 3221225472;
    v773[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1118;
    v773[3] = &unk_1000A7098;
    v775 = &v807;
    uint64_t v776 = v575;
    id v774 = v571;
    [v774 enumerateObjectsUsingBlock:v773];
  }
  v578 = +[NSSortDescriptor sortDescriptorWithKey:@"rankingDictionaryIndex" ascending:1];
  v579 = +[NSArray arrayWithObject:v578];

  v580 = [v571 sortedArrayUsingDescriptors:v579];
  id v581 = [v580 mutableCopy];

  v582 = [(id)v816[5] objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v582 floatValue];
  if (v583 == 0.0)
  {
    v584 = [(id)v816[5] objectForKeyedSubscript:@"allPlaceNamesSet"];
    if (([v584 isEqualToSet:emptyStringSet] & 1) == 0)
    {

      goto LABEL_395;
    }
    BOOL v585 = (unint64_t)v812[3] > 1;

    if (v585)
    {
      [(id)v816[5] setObject:&off_1000B6F48 forKeyedSubscript:@"visibilityCategoryForUI"];
      [(id)v816[5] setObject:&off_1000B6CD8 forKeyedSubscript:@"rankingCategory"];
      [(id)v816[5] setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
      [(id)v816[5] setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      v586 = [(id)v816[5] objectForKeyedSubscript:@"rankingDictionaryIndex"];
      signed int v587 = [v586 intValue];
      [v581 replaceObjectAtIndex:v587 withObject:v816[5]];

      v582 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v582, OS_LOG_TYPE_INFO))
      {
        v588 = [(id)v816[5] objectForKeyedSubscript:@"suggestionIdentifier"];
        v589 = [(id)v816[5] objectForKeyedSubscript:@"bundleIdentifier"];
        v590 = [(id)v816[5] objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)v882 = 138412802;
        v883 = v588;
        __int16 v884 = 2112;
        uint64_t v885 = (uint64_t)v589;
        __int16 v886 = 2112;
        v887 = v590;
        _os_log_impl((void *)&_mh_execute_header, v582, OS_LOG_TYPE_INFO, "Top Phone-sensed walking got suppressed from Recommended tab since it does not have location or photo and we have other unsuppressed walking suggestions. SuggestionID:%@, bundleID:%@, startDate:%@", v882, 0x20u);

        v573 = (void *)v566;
      }
      goto LABEL_395;
    }
  }
  else
  {
LABEL_395:
  }
  id v606 = [v581 copy];

  _Block_object_dispose(v797, 8);
  _Block_object_dispose(v799, 8);
  _Block_object_dispose(v801, 8);
  _Block_object_dispose(&v803, 8);
  _Block_object_dispose(&v807, 8);
  _Block_object_dispose(&v811, 8);
  _Block_object_dispose(&v815, 8);

  _Block_object_dispose(v821, 8);
  _Block_object_dispose(v823, 8);

  _Block_object_dispose(v825, 8);
  _Block_object_dispose(&v827, 8);

  _Block_object_dispose(&v833, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v839, 8);
  return v606;
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

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1107(uint64_t a1, void *a2)
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
        double v10 = objc_msgSend(v3, "objectForKeyedSubscript:", @"bundleStartDate", v63);
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
            unsigned int v18 = [v17 isEqual:&off_1000B6F30];

            if (!v18) {
              goto LABEL_13;
            }
            [v3 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
            [v3 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
            [v3 setObject:&off_1000B6F60 forKeyedSubscript:@"isWithinHoldOffPeriod"];
            [v3 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
            uint64_t v19 = *(void **)(a1 + 48);
            uint64_t v20 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
            objc_msgSend(v19, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v20, "intValue"), v3);

            id v16 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
              id v22 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
              uint64_t v23 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
              double v24 = [v3 objectForKeyedSubscript:@"bundleSubType"];
              *(_DWORD *)buf = v63;
              float v72 = v21;
              __int16 v73 = 2112;
              id v74 = v22;
              __int16 v75 = 2112;
              double v76 = v23;
              __int16 v77 = 2112;
              float v78 = v24;
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
      [v3 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v3 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
      [v3 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecentTab"];
      [v3 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      float v38 = *(void **)(a1 + 48);
      double v39 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
      objc_msgSend(v38, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v39, "intValue"), v3);

      float v40 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
LABEL_26:

        goto LABEL_42;
      }
      double v41 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
      float v42 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
      float v43 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
      double v44 = [v3 objectForKeyedSubscript:@"bundleSubType"];
      *(_DWORD *)buf = 138413058;
      float v72 = v41;
      __int16 v73 = 2112;
      id v74 = v42;
      __int16 v75 = 2112;
      double v76 = v43;
      __int16 v77 = 2112;
      float v78 = v44;
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
    uint64_t v46 = [v3 objectForKeyedSubscript:@"bundleSubType"];
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
          [v3 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
          [v3 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
          [v3 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecentTab"];
          [v3 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
          id v51 = *(void **)(a1 + 48);
          uint64_t v52 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
          objc_msgSend(v51, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v52, "intValue"), v3);

          float v40 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
            goto LABEL_26;
          }
          double v41 = [v3 objectForKeyedSubscript:@"suggestionIdentifier"];
          float v42 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
          float v43 = [v3 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v72 = v41;
          __int16 v73 = 2112;
          id v74 = v42;
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
  double v53 = (void *)phoneSensedWalkingVariants;
  long long v54 = [v3 objectForKeyedSubscript:@"bundleSubType"];
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

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1113(uint64_t a1, void *a2)
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
    [v3 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v3 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
    [v3 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecentTab"];
    [v3 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    float v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v3 objectForKeyedSubscript:@"rankingDictionaryIndex"];
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v12, "intValue"), v3);

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

uint64_t __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1114(uint64_t a1, void *a2)
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
  [v6 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
  [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
  [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isDuplicated"];
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
    v168 = v13;
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
      [v6 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
      [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isDuplicated"];
      uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        id v22 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(_DWORD *)buf = 138412546;
        float v166 = v21;
        __int16 v167 = 2112;
        v168 = v22;
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
  double v24 = [v6 objectForKeyedSubscript:@"bundleSubType"];
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
      uint64_t v29 = &off_1000B6BE8;
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
            [v6 setObject:&off_1000B6F48 forKeyedSubscript:v31];
            [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isDuplicated"];
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
              v168 = v35;
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
  float v42 = [v6 objectForKeyedSubscript:@"bundleSuperType"];
  if ([v42 intValue] != 8) {
    goto LABEL_32;
  }
  float v43 = [v6 objectForKeyedSubscript:@"rankingCategory"];
  if ([v43 isEqual:&off_1000B6F48])
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
  [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"visibilityCategoryForUI"];
  [v6 setObject:&off_1000B6CD8 forKeyedSubscript:@"rankingCategory"];
LABEL_37:
  uint64_t v46 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  if ([v46 intValue] == 802)
  {
    v47 = [v6 objectForKeyedSubscript:@"rankingCategory"];
    unsigned __int8 v48 = [v47 isEqual:&off_1000B6F48];

    if ((v48 & 1) == 0)
    {
      [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:&off_1000B6CD8 forKeyedSubscript:@"rankingCategory"];
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
      [v6 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
      [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)buf = 138412802;
        float v166 = v55;
        __int16 v167 = 2112;
        v168 = v56;
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
            long long v63 = &off_1000B6BE8;
          }
          else {
            long long v63 = &off_1000B6F48;
          }
          if (v62) {
            float v64 = &off_1000B6F48;
          }
          else {
            float v64 = &off_1000B6CD8;
          }
          [v6 setObject:v63 forKeyedSubscript:@"visibilityCategoryForUI"];
          [v6 setObject:v64 forKeyedSubscript:@"rankingCategory"];
          [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
          [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
          long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
            goto LABEL_132;
          }
          BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
          BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
          *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v166 = v55;
          __int16 v167 = 2112;
          v168 = v56;
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
      id v74 = &off_1000B6BE8;
    }
    else {
      id v74 = &off_1000B6F48;
    }
    if (v73) {
      __int16 v75 = &off_1000B6F48;
    }
    else {
      __int16 v75 = &off_1000B6CD8;
    }
    [v6 setObject:v74 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v6 setObject:v75 forKeyedSubscript:@"rankingCategory"];
    [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
    [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
      goto LABEL_132;
    }
    BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
    BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
    *(_DWORD *)buf = 138412802;
    float v166 = v55;
    __int16 v167 = 2112;
    v168 = v56;
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
      double v85 = &off_1000B6BE8;
    }
    else {
      double v85 = &off_1000B6F48;
    }
    if (v84) {
      id v86 = &off_1000B6F48;
    }
    else {
      id v86 = &off_1000B6CD8;
    }
    [v6 setObject:v85 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v6 setObject:v86 forKeyedSubscript:@"rankingCategory"];
    [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
    [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
      goto LABEL_132;
    }
    BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
    BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
    *(_DWORD *)buf = 138412802;
    float v166 = v55;
    __int16 v167 = 2112;
    v168 = v56;
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
    float v89 = [v6 objectForKeyedSubscript:@"allContactIdentifiersSet"];
    LODWORD(v88) = [v88 containsObject:v89];

    if (v88)
    {
      float v90 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
      if ([v90 BOOLValue])
      {

        long long v91 = &off_1000B6F48;
        float v92 = &off_1000B6BE8;
      }
      else
      {
        float v113 = [v6 objectForKeyedSubscript:@"bundleSubType"];
        unsigned int v114 = [v113 intValue];

        if (v114 == 303) {
          float v92 = &off_1000B6BE8;
        }
        else {
          float v92 = &off_1000B6F48;
        }
        if (v114 == 303) {
          long long v91 = &off_1000B6F48;
        }
        else {
          long long v91 = &off_1000B6CD8;
        }
      }
      [v6 setObject:v92 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v6 setObject:v91 forKeyedSubscript:@"rankingCategory"];
      [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
      [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
      long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
        goto LABEL_132;
      }
      BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
      BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
      *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
      *(_DWORD *)buf = 138412802;
      float v166 = v55;
      __int16 v167 = 2112;
      v168 = v56;
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
  float v93 = (void *)phoneSensedWalkingVariants;
  id v94 = [v6 objectForKeyedSubscript:@"bundleSubType"];
  LODWORD(v93) = [v93 containsObject:v94];

  if (!v93)
  {
    double v109 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    unsigned int v110 = [v109 intValue];

    if (v110 == 401)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v157 + 144) + 8) + 24))
      {
        [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:&off_1000B6CD8 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
          BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
          *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v166 = v55;
          __int16 v167 = 2112;
          v168 = v56;
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
      v124 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v6 setObject:v124 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

      uint64_t v125 = *(void *)(v157 + 144);
      goto LABEL_177;
    }
    float v111 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    unsigned int v112 = [v111 intValue];

    if (v112 == 402)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v157 + 152) + 8) + 24))
      {
        [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:&off_1000B6CD8 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
          BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
          *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
          *(_DWORD *)buf = 138412802;
          float v166 = v55;
          __int16 v167 = 2112;
          v168 = v56;
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
    v115 = [v6 objectForKeyedSubscript:@"bundleSubType"];
    unsigned int v116 = [v115 intValue];

    if (v116 == 403)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v157 + 160) + 8) + 24))
      {
        [v6 setObject:&off_1000B6F48 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:&off_1000B6CD8 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
          goto LABEL_132;
        }
        BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)buf = 138412802;
        float v166 = v55;
        __int16 v167 = 2112;
        v168 = v56;
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
    float v126 = [v6 objectForKeyedSubscript:@"bundleInterfaceType"];
    unsigned int v127 = [v126 intValue];

    if (v127 != 11)
    {
      float v152 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG)) {
        __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3_cold_1(v157, v6);
      }

      ++*(void *)(*(void *)(*(void *)(v157 + 128) + 8) + 24);
      double v153 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v6 setObject:v153 forKeyedSubscript:@"ordinalRankInRecommendedTab"];

      ++*(void *)(*(void *)(*(void *)(v157 + 168) + 8) + 24);
      goto LABEL_149;
    }
LABEL_148:
    [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    goto LABEL_149;
  }
  float v95 = *(void **)(*(void *)(*(void *)(v157 + 104) + 8) + 40);
  float v96 = [v6 objectForKeyedSubscript:@"allPlaceNamesSet"];
  if (![v95 containsObject:v96])
  {
LABEL_109:

    goto LABEL_110;
  }
  double v97 = [v6 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
  [v97 floatValue];
  float v99 = v98;

  if (v99 == 0.0)
  {
    double v100 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
    unsigned int v101 = [v100 BOOLValue];

    if (v101) {
      float v102 = &off_1000B6BE8;
    }
    else {
      float v102 = &off_1000B6F48;
    }
    if (v101) {
      float v103 = &off_1000B6F48;
    }
    else {
      float v103 = &off_1000B6CD8;
    }
    [v6 setObject:v102 forKeyedSubscript:@"visibilityCategoryForUI"];
    [v6 setObject:v103 forKeyedSubscript:@"rankingCategory"];
    [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
    [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
    float v96 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      float v104 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
      float v105 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
      *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
      *(_DWORD *)buf = 138412802;
      float v166 = v104;
      __int16 v167 = 2112;
      v168 = v105;
      __int16 v169 = 2112;
      double v170 = *(double *)&v3;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "Phone sensed bundle got suppressed from Recommended tab since it shared the same place(s) with more highly ranked bundle and it does not have any photo. SuggestionID:%@, bundleID:%@, startDate:%@", buf, 0x20u);
    }
    goto LABEL_109;
  }
LABEL_110:
  if (*(void *)(*(void *)(*(void *)(v157 + 120) + 8) + 24))
  {
    v106 = [v6 objectForKeyedSubscript:@"allPlaceNamesSet"];
    float v107 = v106;
    if (v106 == (void *)emptyStringSet)
    {
      float v117 = [v6 objectForKeyedSubscript:@"numPhotoAssetsResourcesNormalized"];
      [v117 floatValue];
      float v119 = v118;

      if (v119 == 0.0)
      {
        float v120 = [v6 objectForKeyedSubscript:@"isCoarseGranularitySummaryKey"];
        unsigned int v121 = [v120 BOOLValue];

        if (v121) {
          float v122 = &off_1000B6BE8;
        }
        else {
          float v122 = &off_1000B6F48;
        }
        if (v121) {
          float v123 = &off_1000B6F48;
        }
        else {
          float v123 = &off_1000B6CD8;
        }
        [v6 setObject:v122 forKeyedSubscript:@"visibilityCategoryForUI"];
        [v6 setObject:v123 forKeyedSubscript:@"rankingCategory"];
        [v6 setObject:&off_1000B6F60 forKeyedSubscript:@"isPseudoDupInRecommendedTab"];
        [v6 setObject:&off_1000B6F78 forKeyedSubscript:@"ordinalRankInRecommendedTab"];
        long long v54 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
          goto LABEL_132;
        }
        BOOL v55 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
        BOOL v56 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
        *(double *)&uint64_t v3 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
        *(_DWORD *)buf = 138412802;
        float v166 = v55;
        __int16 v167 = 2112;
        v168 = v56;
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
  float v108 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
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

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_1118(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:@"bundleInterfaceType"];
  if ([v6 intValue] == 11)
  {
    id v7 = [v5 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v8 = [v7 intValue];

    if (v8 != 4 && ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > *(void *)(a1 + 48))
    {
      [v5 setObject:&off_1000B6BE8 forKeyedSubscript:@"visibilityCategoryForUI"];
      [v5 setObject:&off_1000B6F48 forKeyedSubscript:@"rankingCategory"];
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
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8 != [v7 count])
  {
    float v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking _mergeScoresToBundles:usingScore:](v6, v7, v9);
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v6;
  id v38 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
  uint64_t v11 = 0;
  if (v38)
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v39 = 0;
    uint64_t v37 = *(void *)v41;
    *(void *)&long long v10 = 138412290;
    long long v28 = v10;
    uint64_t v29 = self;
    id v30 = v7;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        float v13 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v12);
        float v14 = objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)v12 + v39, v28);
        id v15 = [v14 mutableCopy];

        id v16 = [v15 objectForKeyedSubscript:@"bundleInterfaceType"];
        unsigned int v17 = [v16 intValue];

        if (v17 == 11)
        {
          ++v11;
        }
        else
        {
          __int16 v21 = [v15 objectForKeyedSubscript:@"visibilityCategoryForUI"];
          unsigned int v22 = [v21 intValue];

          switch(v22)
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
        [v15 removeObjectForKey:@"bundleInterfaceType"];
        [v15 removeObjectForKey:@"bundleSubType"];
        [v15 removeObjectForKey:@"bundleSuperType"];
        [v15 removeObjectForKey:@"elapsedDaysFromBundleEndDate"];
        [v15 removeObjectForKey:@"rankingDictionaryIndex"];
        [v15 removeObjectForKey:@"bundleIdentifier"];
        [v15 removeObjectForKey:@"suggestionIdentifier"];
        [v15 removeObjectForKey:@"allPlaceNamesSet"];
        [v15 removeObjectForKey:@"workoutTypesSet"];
        [v15 removeObjectForKey:@"allContactIdentifiersSet"];
        [v15 removeObjectForKey:@"allStateOfMindIdentifiersSet"];
        [v15 removeObjectForKey:@"numAnomalyEventsNormalized"];
        [v15 removeObjectForKey:@"numPhotoAssetsResourcesNormalized"];
        [v15 removeObjectForKey:@"numMediaAssetsResourcesNormalized"];
        [v15 removeObjectForKey:@"isCoarseGranularitySummaryKey"];
        [v15 removeObjectForKey:@"bundleStartDate"];
        [v15 removeObjectForKey:@"bundleEndDate"];
        [v15 removeObjectForKey:@"stateOfMindLoggedIn3pApp"];
        [v15 removeObjectForKey:@"stateOfMindLoggedInJournalApp"];
        unsigned int v18 = [(MOEventBundleRanking *)self _checkAndUpdateNumericLimits:v15];
        __int16 v19 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = [v13 bundleIdentifier];
          [v13 suggestionID];
          double v24 = v31 = v11;
          *(_DWORD *)buf = 134218498;
          unsigned int v45 = (char *)v12 + v39;
          __int16 v46 = 2112;
          v47 = v23;
          __int16 v48 = 2112;
          float v49 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Bundle index %lu, BundleID %@, suggestionID %@", buf, 0x20u);

          self = v29;
          uint64_t v11 = v31;

          id v7 = v30;
        }

        uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v28;
          unsigned int v45 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "RankingDict %@", buf, 0xCu);
        }

        [v13 setRankingDictionary:v18];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v38 != v12);
      id v25 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
      id v38 = v25;
      v39 += (uint64_t)v12;
    }
    while (v25);
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }

  unsigned int v26 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = (char *)[obj count];
    *(_DWORD *)buf = 134219264;
    unsigned int v45 = v27;
    __int16 v46 = 2048;
    v47 = v32;
    __int16 v48 = 2048;
    float v49 = v33;
    __int16 v50 = 2048;
    uint64_t v51 = v34;
    __int16 v52 = 2048;
    uint64_t v53 = v35;
    __int16 v54 = 2048;
    uint64_t v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Added ranking dictionaries to bundle array: Num totalBundles=%lu, NumSensedBundlesEligibleForBothTabs=%lu,NumSensedBundlesRecommendedOnly=%lu, NumSensedBundlesRecentOnly=%lu, numSensedBundlesRejected=%lu, numEvergreenBundles=%lu  ", buf, 0x3Eu);
  }
}

- (void)_submitEventBundleRankingAnalytics:(id)a3 withRankingInput:(id)a4 andSubmissionDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v11 != [v9 count])
  {
    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.5(v12);
    }
  }
  float v13 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v311[0] = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%lu bundle rankings and inputs are set to be submitted to CoreAnalytics.", buf, 0xCu);
  }

  double v272 = +[NSCalendar currentCalendar];
  BOOL v273 = v10;
  float v14 = [v272 components:764 fromDate:v10];
  id v280 = [v14 year];
  id v282 = [v14 month];
  id v284 = [v14 day];
  id v286 = [v14 hour];
  v271 = v14;
  id v290 = [v14 minute];
  id v15 = [(MOConfigurationManagerBase *)self->_configurationManager getTrialExperimentIdentifiers];
  long long v305 = 0u;
  long long v306 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  id obj = v9;
  id v292 = [obj countByEnumeratingWithState:&v305 objects:v309 count:16];
  if (v292)
  {
    uint64_t v294 = 0;
    uint64_t v278 = *(void *)v306;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v306 != v278) {
          objc_enumerationMutation(obj);
        }
        unsigned int v17 = *(void **)(*((void *)&v305 + 1) + 8 * (void)v16);
        __int16 v19 = [v8 objectAtIndexedSubscript:(char *)v16 + v294];
        uint64_t v20 = objc_opt_new();
        __int16 v21 = +[NSNumber numberWithInteger:v280];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"submissionTimeYear" andValue:v21];

        unsigned int v22 = +[NSNumber numberWithInteger:v282];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"submissionTimeMonth" andValue:v22];

        uint64_t v23 = +[NSNumber numberWithInteger:v284];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"submissionTimeDay" andValue:v23];

        double v24 = +[NSNumber numberWithInteger:v286];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"submissionTimeHour" andValue:v24];

        id v25 = +[NSNumber numberWithInteger:v290];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"submissionTimeMinute" andValue:v25];

        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"scalingFactorForAnalytics" andValue:&off_1000B8430];
        unsigned int v26 = [v17 bundleIdentifier];
        id v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 hash]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"bundleId" andValue:v27];

        long long v28 = [v17 suggestionIdentifier];
        uint64_t v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 hash]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"suggestionId" andValue:v29];

        if (v15)
        {
          id v30 = [v15 experimentId];
          [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"trialExperimentId" andValue:v30];

          uint64_t v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 deploymentId]);
          uint64_t v32 = [v31 stringValue];
          [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"trialDeploymentId" andValue:v32];

          uint64_t v33 = [v15 treatmentId];
          [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"trialTreatmentId" andValue:v33];
        }
        uint64_t v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 suggestionIsDeleted]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isDeleted" andValue:v34];

        uint64_t v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 suggestionIsSelected]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isSelected" andValue:v35];

        CFStringRef v36 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 suggestionQuickAddEntry]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"quickAddEntry" andValue:v36];

        [v17 viewCountNormalized];
        *(float *)&double v38 = v37 * 10000.0;
        uint64_t v39 = +[NSNumber numberWithFloat:v38];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"viewCountNormalized" andValue:v39];

        long long v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 journalEntryIsCreated]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"journalEntryIsCreated" andValue:v40];

        long long v41 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 journalEntryIsEdited]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"journalEntryIsEdited" andValue:v41];

        long long v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 journalEntryIsCancelled]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"journalEntryIsCancelled" andValue:v42];

        long long v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 journalEntryIsDeleted]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"journalEntryIsDeleted" andValue:v43];

        [v17 bundleRecencyDaysElapsed];
        double v44 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"bundleRecencyDaysElapsed" andValue:v44];

        unsigned int v45 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleInterfaceType]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"bundleInterfaceType" andValue:v45];

        __int16 v46 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleSubType]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"bundleSubType" andValue:v46];

        v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleSuperType]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"bundleSuperType" andValue:v47];

        [v17 numAnomalyEventsNormalized];
        *(float *)&double v49 = v48 * 10000.0;
        __int16 v50 = +[NSNumber numberWithFloat:v49];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numAnomalyEventsNormalized" andValue:v50];

        [v17 numTrendEventsNormalized];
        *(float *)&double v52 = v51 * 10000.0;
        uint64_t v53 = +[NSNumber numberWithFloat:v52];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numTrendEventsNormalized" andValue:v53];

        [v17 numRoutineEventsNormalized];
        *(float *)&double v55 = v54 * 10000.0;
        BOOL v56 = +[NSNumber numberWithFloat:v55];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numRoutineEventsNormalized" andValue:v56];

        [v17 numStateOfMindEventsNormalized];
        *(float *)&double v58 = v57 * 10000.0;
        float v59 = +[NSNumber numberWithFloat:v58];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numStateOfMindEventsNormalized" andValue:v59];

        [v17 numUniqueResourceTypesNormalized];
        *(float *)&double v61 = v60 * 10000.0;
        unsigned int v62 = +[NSNumber numberWithFloat:v61];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numUniqueResourceTypesNormalized" andValue:v62];

        [v17 numValueTypeResourcesNormalized];
        *(float *)&double v64 = v63 * 10000.0;
        uint64_t v65 = +[NSNumber numberWithFloat:v64];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numValueTypeResourcesNormalized" andValue:v65];

        [v17 numPhotoAssetsResourcesNormalized];
        *(float *)&double v67 = v66 * 10000.0;
        long long v68 = +[NSNumber numberWithFloat:v67];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numPhotoAssetsResourcesNormalized" andValue:v68];

        [v17 numMediaTypeResourcesNormalized];
        *(float *)&double v70 = v69 * 10000.0;
        float v71 = +[NSNumber numberWithFloat:v70];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numMediaTypeResourcesNormalized" andValue:v71];

        [v17 numWebLinkTypeResourcesNormalized];
        *(float *)&double v73 = v72 * 10000.0;
        id v74 = +[NSNumber numberWithFloat:v73];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numWebLinkTypeResourcesNormalized" andValue:v74];

        [v17 numInterfaceTagTypeResourcesNormalized];
        *(float *)&double v76 = v75 * 10000.0;
        __int16 v77 = +[NSNumber numberWithFloat:v76];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numInterfaceTagTypeResourcesNormalized" andValue:v77];

        [v17 numMapItemTypeResourcesNormalized];
        *(float *)&double v79 = v78 * 10000.0;
        double v80 = +[NSNumber numberWithFloat:v79];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numMapItemTypeResourcesNormalized" andValue:v80];

        [v17 numAppTypeResourcesNormalized];
        *(float *)&double v82 = v81 * 10000.0;
        id v83 = +[NSNumber numberWithFloat:v82];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numAppTypeResourcesNormalized" andValue:v83];

        [v17 numWorkoutRingAssetsNormalized];
        *(float *)&double v85 = v84 * 10000.0;
        id v86 = +[NSNumber numberWithFloat:v85];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numWorkoutRingAssetsNormalized" andValue:v86];

        [v17 numWorkoutIconAssetsNormalized];
        *(float *)&double v88 = v87 * 10000.0;
        float v89 = +[NSNumber numberWithFloat:v88];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numWorkoutIconAssetsNormalized" andValue:v89];

        [v17 numWorkoutRouteMapAssetsNormalized];
        *(float *)&double v91 = v90 * 10000.0;
        float v92 = +[NSNumber numberWithFloat:v91];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"numWorkoutRouteMapAssetsNormalized" andValue:v92];

        [v17 isBundleActionSpecific];
        *(float *)&double v94 = v93 * 10000.0;
        float v95 = +[NSNumber numberWithFloat:v94];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isBundleActionSpecificGranular" andValue:v95];

        [v17 isBundlePlaceTypeSpecific];
        *(float *)&double v97 = v96 * 10000.0;
        float v98 = +[NSNumber numberWithFloat:v97];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isBundlePlaceTypeSpecificGranular" andValue:v98];

        [v17 isBundleTimeTagSpecific];
        *(float *)&double v100 = v99 * 10000.0;
        unsigned int v101 = +[NSNumber numberWithFloat:v100];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isBundleTimeTagSpecificGranular" andValue:v101];

        [v17 labelSpecificityNormalized];
        *(float *)&double v103 = v102 * 10000.0;
        float v104 = +[NSNumber numberWithFloat:v103];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"labelSpecificityNormalized" andValue:v104];

        [v17 labelQualityScore];
        *(float *)&double v106 = v105 * 10000.0;
        float v107 = +[NSNumber numberWithFloat:v106];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"labelQualityScore" andValue:v107];

        [v17 peopleDensityWeightedAverageNormalized];
        *(float *)&double v109 = v108 * 10000.0;
        unsigned int v110 = +[NSNumber numberWithFloat:v109];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"pDensityWeightedAverageNormalized" andValue:v110];

        float v111 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 isWorkVisit]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isWorkVisit" andValue:v111];

        unsigned int v112 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 isShortVisit]);
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"isShortVisit" andValue:v112];

        float v113 = [v19 objectForKeyedSubscript:@"richnessScore"];
        [v113 floatValue];
        *(float *)&double v115 = v114 * 10000.0;
        unsigned int v116 = +[NSNumber numberWithFloat:v115];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"richnessScore" andValue:v116];

        float v117 = [v19 objectForKeyedSubscript:@"distinctnessScore"];
        [v117 floatValue];
        *(float *)&double v119 = v118 * 10000.0;
        float v120 = +[NSNumber numberWithFloat:v119];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"distinctnessScore" andValue:v120];

        unsigned int v121 = [v19 objectForKeyedSubscript:@"heuristicsScore"];
        [v121 floatValue];
        *(float *)&double v123 = v122 * 10000.0;
        v124 = +[NSNumber numberWithFloat:v123];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"heuristicsScore" andValue:v124];

        uint64_t v125 = [v19 objectForKeyedSubscript:@"qualityScore"];
        [v125 floatValue];
        *(float *)&double v127 = v126 * 10000.0;
        float v128 = +[NSNumber numberWithFloat:v127];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"qualityScore" andValue:v128];

        float v129 = [v19 objectForKeyedSubscript:@"viewCountBasedScoreAdjustment"];
        [v129 floatValue];
        *(float *)&double v131 = v130 * 10000.0;
        float v132 = +[NSNumber numberWithFloat:v131];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"viewCountBasedScoreAdjustment" andValue:v132];

        float v133 = [v19 objectForKeyedSubscript:@"baseScore"];
        [v133 floatValue];
        *(float *)&double v135 = v134 * 10000.0;
        int v136 = +[NSNumber numberWithFloat:v135];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"baseScore" andValue:v136];

        float v137 = [v19 objectForKeyedSubscript:@"engagementScore"];
        [v137 floatValue];
        *(float *)&double v139 = v138 * 10000.0;
        float v140 = +[NSNumber numberWithFloat:v139];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"engagementScore" andValue:v140];

        float v141 = [v19 objectForKeyedSubscript:@"diversityCoefficient"];
        [v141 floatValue];
        *(float *)&double v143 = v142 * 10000.0;
        float v144 = +[NSNumber numberWithFloat:v143];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"diversityCoefficient" andValue:v144];

        unsigned __int8 v145 = [v19 objectForKeyedSubscript:@"decayFactor"];
        [v145 floatValue];
        *(float *)&double v147 = v146 * 10000.0;
        float v148 = +[NSNumber numberWithFloat:v147];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"decayFactor" andValue:v148];

        unsigned __int8 v149 = [v19 objectForKeyedSubscript:@"rankingScore"];
        [v149 floatValue];
        *(float *)&double v151 = v150 * 10000.0;
        float v152 = +[NSNumber numberWithFloat:v151];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"rankingScore" andValue:v152];

        double v153 = [v19 objectForKeyedSubscript:@"bundleGoodnessScore"];
        [v153 floatValue];
        *(float *)&double v155 = v154 * 10000.0;
        v156 = +[NSNumber numberWithFloat:v155];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"bundleGoodnessScore" andValue:v156];

        uint64_t v157 = [v19 objectForKeyedSubscript:@"rankingCategory"];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"rankingCategory" andValue:v157];

        id v158 = [v19 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"visibilityCategoryForUI" andValue:v158];

        uint64_t v159 = [v19 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
        [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v20 withKey:@"ordinalRankInRecommendedTab" andValue:v159];

        if (v20)
        {
          double v300 = _NSConcreteStackBlock;
          uint64_t v301 = 3221225472;
          float v302 = __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke;
          v303 = &unk_1000A5418;
          double v304 = v20;
          AnalyticsSendEventLazy();
          long long v160 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.4(&v298, v299);
          }

          long long v161 = v304;
        }
        else
        {
          long long v161 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR)) {
            -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:](buf, v311, v161);
          }
        }

        id v16 = (char *)v16 + 1;
      }
      while (v292 != v16);
      id v292 = [obj countByEnumeratingWithState:&v305 objects:v309 count:16];
      v294 += (uint64_t)v16;
    }
    while (v292);
  }

  long long v162 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)float v297 = 0;
    _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_INFO, "Completed individual Ranking CoreAnalytics submission.", v297, 2u);
  }

  uint64_t v163 = objc_opt_new();
  float v164 = +[NSNumber numberWithInteger:v280];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"submissionTimeYear" andValue:v164];

  float v165 = +[NSNumber numberWithInteger:v282];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"submissionTimeMonth" andValue:v165];

  float v166 = +[NSNumber numberWithInteger:v284];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"submissionTimeDay" andValue:v166];

  __int16 v167 = +[NSNumber numberWithInteger:v286];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"submissionTimeHour" andValue:v167];

  v168 = +[NSNumber numberWithInteger:v290];
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"submissionTimeMinute" andValue:v168];

  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"scalingFactorForAnalytics" andValue:&off_1000B8430];
  if (v15)
  {
    __int16 v169 = [v15 experimentId];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"trialExperimentId" andValue:v169];

    double v170 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 deploymentId]);
    float v171 = [v170 stringValue];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"trialDeploymentId" andValue:v171];

    float v172 = [v15 treatmentId];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"trialTreatmentId" andValue:v172];
  }
  double v173 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"totalBundleCount" andValue:v173];

  v277 = +[NSSortDescriptor sortDescriptorWithKey:@"ordinalRankInRecommendedTab" ascending:1];
  v275 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  float v174 = objc_msgSend(v8, "sortedArrayUsingDescriptors:");
  float v175 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1000B82B8];
  float v176 = [v174 filteredArrayUsingPredicate:v175];

  float v177 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v176 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v163 withKey:@"recommendedSuggestionCount" andValue:v177];

  +[NSPredicate predicateWithFormat:@"%K == %lu", @"bundleInterfaceType", 11];
  float v178 = v279 = (void *)v163;

  v274 = [v8 filteredArrayUsingPredicate:v178];
  float v179 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v274 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"evergreenBundleCount" andValue:v179];

  float v180 = +[NSPredicate predicateWithFormat:@"%K == %lu", @"bundleInterfaceType", 10];

  double v270 = [v8 filteredArrayUsingPredicate:v180];
  double v181 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v270 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"photoMemoryBundleCount" andValue:v181];

  float v182 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"visibilityCategoryForUI", &off_1000B82D0];

  float v183 = [v8 filteredArrayUsingPredicate:v182];
  v184 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v183 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"suggestionCountInRecentTab" andValue:v184];

  float v185 = +[NSPredicate predicateWithFormat:@"%K <= 1", @"elapsedDaysFromBundleEndDate"];

  double v268 = [v183 filteredArrayUsingPredicate:v185];
  float v186 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v268 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"suggestionCountInRecenTabFromPast1Day" andValue:v186];

  double v187 = +[NSPredicate predicateWithFormat:@"%K <= 3", @"elapsedDaysFromBundleEndDate"];

  double v267 = [v183 filteredArrayUsingPredicate:v187];
  v188 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v267 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"suggestionCountInRecenTabFromPast3Days" andValue:v188];

  float v189 = v279;
  uint64_t v190 = +[NSPredicate predicateWithFormat:@"%K <= 7", @"elapsedDaysFromBundleEndDate"];

  double v269 = v183;
  double v266 = (void *)v190;
  double v265 = [v183 filteredArrayUsingPredicate:v190];
  float v191 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v265 count]);
  [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"suggestionCountInRecenTabFromPast7Days" andValue:v191];

  v285 = objc_opt_new();
  v283 = objc_opt_new();
  v281 = objc_opt_new();
  uint64_t v192 = objc_opt_new();
  v193 = objc_opt_new();
  float v194 = objc_opt_new();
  float v195 = objc_opt_new();
  v293 = v176;
  if ((unint64_t)[v176 count] < 3)
  {
    v295 = (void *)v192;
    uint64_t v291 = 0;
  }
  else
  {
    uint64_t v196 = 0;
    uint64_t v291 = 0;
    do
    {
      float v197 = (void *)v192;
      float v198 = v193;
      v287 = v195;
      double v199 = [v293 objectAtIndexedSubscript:v196];
      uint64_t v200 = [v199 objectForKeyedSubscript:@"bundleInterfaceType"];

      float v201 = (void *)v200;
      float v202 = [v293 objectAtIndexedSubscript:v196];
      v295 = [v202 objectForKeyedSubscript:@"bundleSubType"];

      float v203 = [v293 objectAtIndexedSubscript:v196];
      v193 = [v203 objectForKeyedSubscript:@"bundleSuperType"];

      float v204 = [v293 objectAtIndexedSubscript:v196];
      float v195 = [v204 objectForKeyedSubscript:@"elapsedDaysFromBundleEndDate"];

      float v194 = v201;
      if ([v201 intValue] == 10)
      {
        ++v291;
        uint64_t v192 = (uint64_t)v295;
      }
      else
      {
        uint64_t v192 = (uint64_t)v295;
        [v285 addObject:v295];
        [v283 addObject:v193];
        [v281 addObject:v195];
      }
      ++v196;
    }
    while (v196 != 3);
    float v205 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v285 count]);
    float v189 = v279;
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"uniqueBundleSubTypeCountForSensedBundlesInTop3" andValue:v205];

    float v206 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v283 count]);
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"uniqueBundleSuperTypeCountForSensedBundlesInTop3" andValue:v206];

    float v207 = [v281 valueForKeyPath:@"@avg.self"];
    [v207 floatValue];
    *(float *)&double v209 = v208 * 10000.0;
    double v210 = +[NSNumber numberWithFloat:v209];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"averageBundleAgeInTop3" andValue:v210];

    float v211 = [v281 valueForKeyPath:@"@max.self"];
    [v211 floatValue];
    *(float *)&double v213 = v212 * 10000.0;
    float v214 = +[NSNumber numberWithFloat:v213];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"maxBundleAgeInTop3" andValue:v214];

    float v215 = +[NSNumber numberWithUnsignedInteger:v291];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"numPhotoMemoriesInTop3" andValue:v215];
  }
  if ((unint64_t)[v293 count] >= 5)
  {
    uint64_t v216 = 3;
    float v217 = v295;
    do
    {
      float v218 = v193;
      signed int v288 = v195;
      double v219 = [v293 objectAtIndexedSubscript:v216];
      uint64_t v220 = [v219 objectForKeyedSubscript:@"bundleInterfaceType"];

      float v221 = (void *)v220;
      float v222 = [v293 objectAtIndexedSubscript:v216];
      v295 = [v222 objectForKeyedSubscript:@"bundleSubType"];

      v223 = [v293 objectAtIndexedSubscript:v216];
      v193 = [v223 objectForKeyedSubscript:@"bundleSuperType"];

      float v224 = [v293 objectAtIndexedSubscript:v216];
      float v195 = [v224 objectForKeyedSubscript:@"elapsedDaysFromBundleEndDate"];

      float v194 = v221;
      if ([v221 intValue] == 10)
      {
        ++v291;
        float v217 = v295;
      }
      else
      {
        float v217 = v295;
        [v285 addObject:v295];
        [v283 addObject:v193];
        [v281 addObject:v195];
      }
      ++v216;
    }
    while (v216 != 5);
    float v225 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v285 count]);
    float v189 = v279;
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"uniqueBundleSubTypeCountForSensedBundlesInTop5" andValue:v225];

    double v226 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v283 count]);
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"uniqueBundleSuperTypeCountForSensedBundlesInTop5" andValue:v226];

    float v227 = [v281 valueForKeyPath:@"@avg.self"];
    [v227 floatValue];
    *(float *)&double v229 = v228 * 10000.0;
    float v230 = +[NSNumber numberWithFloat:v229];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"averageBundleAgeInTop5" andValue:v230];

    float v231 = [v281 valueForKeyPath:@"@max.self"];
    [v231 floatValue];
    *(float *)&double v233 = v232 * 10000.0;
    float v234 = +[NSNumber numberWithFloat:v233];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"maxBundleAgeInTop5" andValue:v234];

    float v235 = +[NSNumber numberWithUnsignedInteger:v291];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"numPhotoMemoriesInTop5" andValue:v235];
  }
  if ((unint64_t)[v293 count] >= 0xA)
  {
    uint64_t v236 = 5;
    double v237 = v295;
    do
    {
      float v238 = v193;
      v289 = v195;
      float v239 = [v293 objectAtIndexedSubscript:v236];
      uint64_t v240 = [v239 objectForKeyedSubscript:@"bundleInterfaceType"];

      float v241 = (void *)v240;
      uint64_t v242 = [v293 objectAtIndexedSubscript:v236];
      v295 = [v242 objectForKeyedSubscript:@"bundleSubType"];

      v243 = [v293 objectAtIndexedSubscript:v236];
      v193 = [v243 objectForKeyedSubscript:@"bundleSuperType"];

      v244 = [v293 objectAtIndexedSubscript:v236];
      float v195 = [v244 objectForKeyedSubscript:@"elapsedDaysFromBundleEndDate"];

      float v194 = v241;
      if ([v241 intValue] == 10)
      {
        ++v291;
        double v237 = v295;
      }
      else
      {
        double v237 = v295;
        [v285 addObject:v295];
        [v283 addObject:v193];
        [v281 addObject:v195];
      }
      ++v236;
    }
    while (v236 != 10);
    v245 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v285 count]);
    float v189 = v279;
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"uniqueBundleSubTypeCountForSensedBundlesInTop10" andValue:v245];

    long long v246 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v283 count]);
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"uniqueBundleSuperTypeCountForSensedBundlesInTop10" andValue:v246];

    long long v247 = [v281 valueForKeyPath:@"@avg.self"];
    [v247 floatValue];
    *(float *)&double v249 = v248 * 10000.0;
    v250 = +[NSNumber numberWithFloat:v249];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"averageBundleAgeInTop10" andValue:v250];

    v251 = [v281 valueForKeyPath:@"@max.self"];
    [v251 floatValue];
    *(float *)&double v253 = v252 * 10000.0;
    double v254 = +[NSNumber numberWithFloat:v253];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"maxBundleAgeInTop10" andValue:v254];

    id v255 = +[NSNumber numberWithUnsignedInteger:v291];
    [(MOEventBundleRanking *)self safeSavePropertyToDictionary:v279 withKey:@"numPhotoMemoriesInTop10" andValue:v255];
  }
  if (v189)
  {
    double v296 = v189;
    AnalyticsSendEventLazy();
    uint64_t v256 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v256, OS_LOG_TYPE_DEBUG)) {
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:]();
    }

    unint64_t v257 = v296;
  }
  else
  {
    unint64_t v257 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v257, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:](v257, v258, v259, v260, v261, v262, v263, v264);
    }
  }
}

id __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke_1143(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateEngagementScoreParamsUsingBFGS
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Number of iteration in BFGS %lu", v2, v3, v4, v5, v6);
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
    float v51 = v12;
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
          double v18 = objc_msgSend(v15, "objectForKeyedSubscript:", v17, v50);
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
          long long v27 = objc_msgSend(v24, "objectForKeyedSubscript:", v26, v50);
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
          double v38 = *(void **)(*((void *)&v61 + 1) + 8 * (void)k);
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
                objc_msgSend(v38, "doubleValue", v50);
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

  double v38 = [(NSMutableDictionary *)self->_pairWiseWeights objectForKeyedSubscript:@"pairWiseFar"];
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
  v6[0] = &off_1000B8440;
  v6[1] = &off_1000B8450;
  v5[2] = @"weightForNumTrendEventsNormalized";
  v5[3] = @"weightForNumRoutineEventsNormalized";
  v6[2] = &off_1000B8450;
  v6[3] = &off_1000B8460;
  v5[4] = @"weightForNumStateOfMindEventsNormalized";
  v5[5] = @"weightForLabelQualityScore";
  v6[4] = &off_1000B8350;
  v6[5] = &off_1000B8330;
  v5[6] = @"weightForTimeCorrelationScore";
  v5[7] = @"richnessScoreScalingParameter";
  v6[6] = &off_1000B8330;
  v6[7] = &off_1000B8310;
  v5[8] = @"bundleScoreScalingParameter";
  v5[9] = @"bundleScoreConstant";
  v6[8] = &off_1000B8310;
  v6[9] = &off_1000B8330;
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
    v130[3] = &unk_1000A70E8;
    id v8 = (id)objc_opt_new();
    id v131 = v8;
    [v6 enumerateObjectsUsingBlock:v130];
    unint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    float v99 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = NSStringFromSelector(a2);
      id v11 = [v6 count];
      id v12 = [v99 count];
      CFStringRef v13 = (const __CFString *)[v7 count];
      *(_DWORD *)buf = 138413058;
      int v136 = v10;
      __int16 v137 = 2048;
      unint64_t v138 = (unint64_t)v11;
      __int16 v139 = 2048;
      uint64_t v140 = (uint64_t)v12;
      __int16 v141 = 2048;
      CFStringRef v142 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, event bundle count, %lu, contact bundle count, %lu, preceding contact bundle count, %lu", buf, 0x2Au);

      id v8 = v99;
    }
    double v100 = v6;

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
    float v102 = a2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = NSStringFromSelector(a2);
      id v19 = [v15 count];
      double v20 = [v100 firstObject];
      uint64_t v21 = [v20 startDate];
      uint64_t v22 = [v100 lastObject];
      uint64_t v23 = [v22 startDate];
      *(_DWORD *)buf = 138413058;
      int v136 = v18;
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
    v129[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1155;
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
    float v96 = v30;
    double v109 = objc_opt_new();
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
          unsigned int v110 = *(void **)(*((void *)&v125 + 1) + 8 * v43);
          int v44 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            float v84 = NSStringFromSelector(a2);
            double v85 = [v110 startDate];
            id v86 = [v110 endDate];
            *(_DWORD *)buf = 138412802;
            int v136 = v84;
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
              float v105 = NSStringFromSelector(a2);
              double v106 = [v15 objectAtIndexedSubscript:v42];
              double v73 = [v106 bundleIdentifier];
              id v74 = [v15 objectAtIndexedSubscript:v42];
              float v75 = [v74 startDate];
              double v76 = [v15 objectAtIndexedSubscript:v42];
              id v77 = [v76 summarizationGranularity];
              id v78 = [v45 count];
              *(_DWORD *)buf = 138413570;
              int v136 = v105;
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
            v124[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1157;
            v124[3] = &__block_descriptor_48_e22_v24__0__NSString_8_B16l;
            v124[4] = a2;
            v124[5] = v42;
            [v45 enumerateObjectsUsingBlock:v124];
            double v47 = [v15 objectAtIndexedSubscript:v42];
            id v48 = [v47 summarizationGranularity];

            if (v48 == (id)1)
            {
              double v49 = [v15 objectAtIndexedSubscript:v42];
              id v50 = [v49 startDate];
              float v51 = [v110 endDate];
              unsigned __int8 v52 = [v50 isAfterDate:v51];

              if (v52) {
                break;
              }
              long long v122 = 0u;
              long long v123 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              uint64_t v53 = [v15 objectAtIndexedSubscript:v42];
              float v54 = [v53 persons];

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
                double v79 = NSStringFromSelector(a2);
                double v80 = [v15 objectAtIndexedSubscript:v42];
                uint64_t v81 = [v80 bundleIdentifier];
                double v82 = (void *)v81;
                *(_DWORD *)buf = 138413058;
                CFStringRef v83 = @"NO";
                if (v55) {
                  CFStringRef v83 = @"YES";
                }
                int v136 = v79;
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
          double v91 = *(void **)(*((void *)&v112 + 1) + 8 * (void)k);
          float v92 = [v91 bundleIdentifier];
          float v93 = [v92 UUIDString];
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

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1155(uint64_t a1, void *a2, uint64_t a3)
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

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1157(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1157_cold_1(a1);
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
      id v6 = off_1000A7220[i];
      id v7 = off_1000A72A8[i];
      [v4 setObject:off_1000A7198[i] forKey:@"RankingRichnessPrimaryPriorityScoreKey"];
      [v5 setObject:v6 forKey:@"RankingRichnessSecondaryPriorityScoreKey"];
      [v5 setObject:v7 forKey:@"RankingRichnessAuxiliaryPriorityScoreKey"];
    }
    int v8 = +[MOResource getStringTypeForResources:i];
    [v2 setObject:v5 forKey:v8];
  }
  v15[0] = @"RankingRichnessPrimaryPriorityScoreKey";
  v15[1] = @"RankingRichnessSecondaryPriorityScoreKey";
  v16[0] = &off_1000B8470;
  v16[1] = &off_1000B8470;
  v15[2] = @"RankingRichnessAuxiliaryPriorityScoreKey";
  v16[2] = &off_1000B8470;
  unint64_t v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 setObject:v9 forKey:@"NumUniqueResourceTypesNormalizedKey"];
  v13[0] = @"RankingRichnessPrimaryPriorityScoreKey";
  v13[1] = @"RankingRichnessSecondaryPriorityScoreKey";
  v14[0] = &off_1000B8470;
  v14[1] = &off_1000B8470;
  v13[2] = @"RankingRichnessAuxiliaryPriorityScoreKey";
  v14[2] = &off_1000B8470;
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
        __int16 v12 = objc_msgSend(v3, "objectForKeyedSubscript:", v11, v18);
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

        [v4 setObject:&off_1000B84C0 forKeyedSubscript:v11];
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
  v36[3] = __Block_byref_object_copy__4;
  v36[4] = __Block_byref_object_dispose__4;
  id v37 = 0;
  id v6 = [(MOEventBundleRanking *)self staticModelParameterMatrix];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __34__MOEventBundleRanking_dictionary__block_invoke;
  v33[3] = &unk_1000A7150;
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
  v30[3] = &unk_1000A7150;
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
  v27[3] = &unk_1000A7178;
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
  id v3 = a3;
  id v4 = [v3 places];
  id v5 = [v4 count];

  if (v5)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v6 = [v3 places];
    id v7 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (!v7)
    {
LABEL_24:

      goto LABEL_25;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v37;
    float v10 = 0.0;
    float v11 = 0.0;
    float v12 = 0.0;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        id v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v15 = [v14 endDate];
        if (v15)
        {
          id v16 = (void *)v15;
          uint64_t v17 = [v14 startDate];

          if (v17)
          {
            id v18 = [v14 endDate];
            uint64_t v19 = [v14 startDate];
            [v18 timeIntervalSinceDate:v19];
            double v21 = v20;

            [v14 distanceToHomeInMiles];
            *(float *)&double v22 = v22;
            if (*(float *)&v22 >= 0.0)
            {
              [v14 distanceToHomeInMiles];
              *(float *)&double v24 = v24;
              objc_msgSend(v14, "distanceToHomeInMiles", v24);
              *(float *)&double v25 = v25;
              float v12 = v12 + *(float *)&v25 * v21;
            }
            else
            {
              uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v41 = "-[MOEventBundleRanking updateTripMetaDataForRank:]";
                __int16 v42 = 1024;
                int v43 = 3531;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Trip bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
              }
            }
            [v14 familiarityIndexLOI];
            *(float *)&double v26 = v26;
            if (*(float *)&v26 == -1.0)
            {
              id v28 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
                -[MOEventBundleRanking updateTripMetaDataForRank:](&v34, v35);
              }
            }
            else
            {
              [v14 familiarityIndexLOI];
              *(float *)&double v27 = v27;
              float v11 = v11 + *(float *)&v27 * v21;
            }
            float v10 = v21 + v10;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v8);

    if (v10 > 0.0)
    {
      *(float *)&double v29 = v12 / v10;
      id v30 = +[NSNumber numberWithFloat:v29];
      [v3 addMetaDataForRankForKey:@"DistanceToHome" value:v30];

      *(float *)&double v31 = v10;
      uint64_t v32 = +[NSNumber numberWithFloat:v31];
      [v3 addMetaDataForRankForKey:@"VisitDuration" value:v32];

      *(float *)&double v33 = v11 / v10;
      uint64_t v6 = +[NSNumber numberWithFloat:v33];
      [v3 addMetaDataForRankForKey:@"FamiliarityIndex" value:v6];
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
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Filled in metadata for rank for trip bundle: %@", v4, v5, v6, v7, v8);
}

- (void)_fillRichnessInfoForRanking:forBundle:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Evergreen prompt exists", v2);
}

- (void)_fillRichnessInfoForRanking:(void *)a1 forBundle:.cold.2(void *a1)
{
  uint64_t v1 = [a1 evergreenType];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Evergreen type is set to %@", v4, v5, v6, v7, v8);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: universe", v1, 2u);
}

- (void)initWithConfigurationManager:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configurationManager", v1, 2u);
}

- (double)initWithConfigurationManager:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, a2, a3, "User onboarding date is not available. Setting elapsedDaysSinceOnboardingDate to %.3f for default behavior", a5, a6, a7, a8, 0);
  return result;
}

- (void)initWithConfigurationManager:(NSObject *)a3 .cold.3(uint64_t a1, float *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(double *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, (uint64_t)a2, a3, "User onboarding date %@, elapsedDaysSinceOnboardingDate %.3f", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

- (double)initWithConfigurationManager:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, a2, a3, "EngagementScoreWeight is set to %f", a5, a6, a7, a8, 0);
  return result;
}

- (void)_calculateRankingScore:(uint64_t)a1 withMinRecommendedBundleCountRequirement:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "count");
  *uint64_t v3 = 134217984;
  void *v2 = v4;
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v5, v6, "RankingDict count After filtering for ones shown in Recent tab:%lu");
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "Min bundle date:%@, max bundle date:%@");
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "diversityCoefficientDict:%@", v2, v3, v4, v5, v6);
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "visibleInterfaceTypeAndCountDict:%@", v2, v3, v4, v5, v6);
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.5()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "workoutTypesInWeeklySummary=%@ , workoutTypesInWorkoutRoutine=%@");
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
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v2, (uint64_t)v2, "Evergreen type is not found. Use random score instead.", v3);
}

- (void)_calculateRankingScore:(uint64_t)a1 withMinRecommendedBundleCountRequirement:(uint64_t)a2 .cold.8(uint64_t a1, uint64_t a2)
{
  __int16 v4 = objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "evergreenType");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v5, v6, "Evergreen engagement score parameter is not set for evergreenType %@. Use default dynamic param.");
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"suggestionIdentifier"];
  float v10 = [a2 objectForKeyedSubscript:@"bundleIdentifier"];
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v4, v5, "Ordinal rank %lu:  SuggestionID:%@, bundleID:%@", v6, v7, v8, v9, 2u);
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
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Completed aggregated Ranking CoreAnalytics submission", v2);
}

- (void)_submitEventBundleRankingAnalytics:(uint8_t *)buf withRankingInput:(void *)a2 andSubmissionDate:(os_log_t)log .cold.3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = @"com.apple.Moments.MOEventBundleRanking";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CA payload (%@) is nil. Skip submission", buf, 0xCu);
}

- (void)_submitEventBundleRankingAnalytics:(unsigned char *)a1 withRankingInput:(unsigned char *)a2 andSubmissionDate:.cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v2, (uint64_t)v2, "Submitted ranking CA message", v3);
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
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Num iterations in BFGS - _lineSearch is %lu", v2, v3, v4, v5, v6);
}

- (void)_lineSearch:(uint64_t)a3 initialParams:(uint64_t)a4 With:(uint64_t)a5 And:(uint64_t)a6 handler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_1157_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v2, v3, "%@, bundle idx, %lu, contact identifier, %@", v4, v5, v6, v7, v8);
}

- (void)safeSavePropertyToDictionary:withKey:andValue:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "key-value pair contains nil value (key=%@, value=%@). Skip dict update", v1, 0x16u);
}

- (void)updateTripMetaDataForRank:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Trip bundle familiarity index is -1", v3, 2u);
}

@end