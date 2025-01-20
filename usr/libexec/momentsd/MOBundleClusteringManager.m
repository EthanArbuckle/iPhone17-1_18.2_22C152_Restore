@interface MOBundleClusteringManager
- (BOOL)isClusteringResultValid;
- (MOBundleClusteringManager)initWithUniverse:(id)a3;
- (MOClusteringParams)clusteringParams;
- (MOConfigurationManager)configurationManager;
- (MOHDBSCANClustering)hdbscanClustering;
- (OS_dispatch_queue)queue;
- (double)clusterPhenotypeArbirationThreshold;
- (double)clusterPhenotypeMinimumRatioThreshold;
- (float)avgGoodnessScoreFilteringThreshold;
- (float)goodnessScoreAnomalySignificanceThreshold;
- (float)outlierScoreAnomalySignificanceThreshold;
- (id)_convertContextvalueToString:(id)a3 forKey:(id)a4;
- (id)_countValidKeysInHistogram:(id)a3;
- (id)_getClusterBundleFrom:(id)a3 withEmbeddings:(id)a4 andCreationDate:(id)a5;
- (id)getClusteringParams;
- (id)getEmbeddingsFromBundles:(id)a3 forEmbeddingType:(unint64_t)a4;
- (unint64_t)clusterPhenotypeMinimumCountThreshold;
- (unint64_t)phenotypeSpecificityThreshold;
- (void)annotateAnomalyBundles:(id)a3 withEmbeddings:(id)a4 handler:(id)a5;
- (void)generateClusterBundles:(id)a3 withEmbeddings:(id)a4 handler:(id)a5;
- (void)runHDBSCANClusteringOn:(id)a3;
- (void)setClusteringParams:(id)a3;
- (void)setHdbscanClustering:(id)a3;
- (void)submitAnomalyBundleInternalAnalytics:(id)a3 withOnboardingStatus:(id)a4 andSubmissionDate:(id)a5;
- (void)submitClusterBundleInternalAnalytics:(id)a3 withOnboardingStatus:(id)a4 andSubmissionDate:(id)a5;
@end

@implementation MOBundleClusteringManager

- (MOBundleClusteringManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 getService:v6];

  v80.receiver = self;
  v80.super_class = (Class)MOBundleClusteringManager;
  v8 = [(MOBundleClusteringManager *)&v80 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("MOBundleClusteringManager", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_configurationManager, v7);
    v12 = objc_opt_new();
    LODWORD(v13) = 0.25;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_activityContext" withFallback:v13];
    v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v14 forKeyedSubscript:@"embeddingDistWeight_activityContext"];

    LODWORD(v15) = 1045220557;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_timeContext" withFallback:v15];
    v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v16 forKeyedSubscript:@"embeddingDistWeight_timeContext"];

    LODWORD(v17) = 1053609165;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_locationContext" withFallback:v17];
    v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v18 forKeyedSubscript:@"embeddingDistWeight_locationContext"];

    LODWORD(v19) = 1036831949;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_socialContext" withFallback:v19];
    v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v20 forKeyedSubscript:@"embeddingDistWeight_socialContext"];

    LODWORD(v21) = 1028443341;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_extraContext" withFallback:v21];
    v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v22 forKeyedSubscript:@"embeddingDistWeight_extraContext"];

    LODWORD(v23) = 1050253722;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_topLevelActivityType" withFallback:v23];
    v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v24 forKeyedSubscript:@"embeddingDistWeight_topLevelActivityType"];

    LODWORD(v25) = 1058642330;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_secondLevelActivityType" withFallback:v25];
    v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v26 forKeyedSubscript:@"embeddingDistWeight_secondLevelActivityType"];

    LODWORD(v27) = 1036831949;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_activityTypeFromPhotoTraits" withFallback:v27];
    v28 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v28 forKeyedSubscript:@"embeddingDistWeight_activityTypeFromPhotoTraits"];

    LODWORD(v29) = 1036831949;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_normalizedDuration" withFallback:v29];
    v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v30 forKeyedSubscript:@"embeddingDistWeight_normalizedDuration"];

    LODWORD(v31) = 0.25;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_timeOfDay" withFallback:v31];
    v32 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v32 forKeyedSubscript:@"embeddingDistWeight_timeOfDay"];

    LODWORD(v33) = 1053609165;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_dayOfWeek" withFallback:v33];
    v34 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v34 forKeyedSubscript:@"embeddingDistWeight_dayOfWeek"];

    LODWORD(v35) = 1045220557;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_isWeekend" withFallback:v35];
    v36 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v36 forKeyedSubscript:@"embeddingDistWeight_isWeekend"];

    LODWORD(v37) = 1028443341;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_timeContextFromPhotoTrait" withFallback:v37];
    v38 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v38 forKeyedSubscript:@"embeddingDistWeight_timeContextFromPhotoTrait"];

    LODWORD(v39) = 1050253722;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_placeName" withFallback:v39];
    v40 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v40 forKeyedSubscript:@"embeddingDistWeight_placeName"];

    LODWORD(v41) = 1053609165;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_placeType" withFallback:v41];
    v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v42 forKeyedSubscript:@"embeddingDistWeight_placeType"];

    LODWORD(v43) = 1045220557;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_geoProximity" withFallback:v43];
    v44 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v44 forKeyedSubscript:@"embeddingDistWeight_geoProximity"];

    LODWORD(v45) = 1036831949;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_placeTypeFromPhotoTraits" withFallback:v45];
    v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v46 forKeyedSubscript:@"embeddingDistWeight_placeTypeFromPhotoTraits"];

    LODWORD(v47) = 1036831949;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_contactNames" withFallback:v47];
    v48 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v48 forKeyedSubscript:@"embeddingDistWeight_contactNames"];

    LODWORD(v49) = 0.25;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_IsWithContact" withFallback:v49];
    v50 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v50 forKeyedSubscript:@"embeddingDistWeight_IsWithContact"];

    LODWORD(v51) = 1041865114;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_isWithFamily" withFallback:v51];
    v52 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v52 forKeyedSubscript:@"embeddingDistWeight_isWithFamily"];

    LODWORD(v53) = 1028443341;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_isWithCoworker" withFallback:v53];
    v54 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v54 forKeyedSubscript:@"embeddingDistWeight_isWithCoworker"];

    LODWORD(v55) = 1041865114;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_isWithFriend" withFallback:v55];
    v56 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v56 forKeyedSubscript:@"embeddingDistWeight_isWithFriend"];

    LODWORD(v57) = 1036831949;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_isWithChild" withFallback:v57];
    v58 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v58 forKeyedSubscript:@"embeddingDistWeight_isWithChild"];

    LODWORD(v59) = 1041865114;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_isWithMyPet" withFallback:v59];
    v60 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v60 forKeyedSubscript:@"embeddingDistWeight_isWithMyPet"];

    LODWORD(v61) = 1028443341;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"embeddingDistWeight_SocialEventFromPhotoTraits " withFallback:v61];
    v62 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v12 setObject:v62 forKeyedSubscript:@"embeddingDistWeight_SocialEventFromPhotoTraits "];

    v63 = [[MOClusteringParams alloc] initWithembeddingDistanceWeights:v12 minPoints:[(MOConfigurationManagerBase *)v8->_configurationManager getIntegerSettingForKey:@"MOClusteringParams_minPoints" withFallback:3] minClusterSize:[(MOConfigurationManagerBase *)v8->_configurationManager getIntegerSettingForKey:@"MOClusteringParams_minClusterSize" withFallback:3]];
    clusteringParams = v8->_clusteringParams;
    v8->_clusteringParams = v63;

    v65 = [[MOHDBSCANClustering alloc] initWithParameters:v8->_clusteringParams];
    hdbscanClustering = v8->_hdbscanClustering;
    v8->_hdbscanClustering = v65;

    LODWORD(v67) = 0.5;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"MOClusteringParams_clusterPhenotypeContextRatioThreshold" withFallback:v67];
    double v69 = v68;
    v8->_clusterPhenotypeMinimumRatioThreshold = v69;
    LODWORD(v69) = 0.75;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"MOClusteringParams_phenotypeArbirationCountThreshold" withFallback:v69];
    double v71 = v70;
    v8->_clusterPhenotypeArbirationThreshold = v71;
    LODWORD(v71) = 3.0;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"MOClusteringParams_clusterPhenotypeContextCountThreshold" withFallback:v71];
    v8->_clusterPhenotypeMinimumCountThreshold = (unint64_t)v72;
    LODWORD(v73) = 1028443341;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"avgGoodnessScoreFilteringThreshold" withFallback:v73];
    v8->_avgGoodnessScoreFilteringThreshold = v74;
    v8->_phenotypeSpecificityThreshold = [(MOConfigurationManagerBase *)v8->_configurationManager getIntegerSettingForKey:@"phenoTypeCategoryCountFilteringThreshold" withFallback:3];
    LODWORD(v75) = 1034147594;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"goodnessScoreAnomalySignificanceThreshold" withFallback:v75];
    v8->_goodnessScoreAnomalySignificanceThreshold = v76;
    LODWORD(v77) = 1051260355;
    [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"outlierScoreAnomalySignificanceThreshold" withFallback:v77];
    v8->_outlierScoreAnomalySignificanceThreshold = v78;
  }
  return v8;
}

- (id)getEmbeddingsFromBundles:(id)a3 forEmbeddingType:(unint64_t)a4
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke;
  v8[3] = &unk_1002CD400;
  unint64_t v10 = a4;
  id v6 = (id)objc_opt_new();
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MOEmbedding alloc] initWithEventBundle:v3 forEmbeddingType:*(void *)(a1 + 40)];
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_2(v4);
  }

  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_1(v3, v6);
    }
  }
}

- (void)runHDBSCANClusteringOn:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  p_clusteringParams = &self->_clusteringParams;
  if (v5 <= (id)[(MOClusteringParams *)self->_clusteringParams minClusterSize])
  {
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(MOBundleClusteringManager *)v4 runHDBSCANClusteringOn:v7];
    }
  }
  else
  {
    [(MOHDBSCANClustering *)self->_hdbscanClustering runHDBSCANClusteringOn:v4];
  }
}

- (BOOL)isClusteringResultValid
{
  v2 = [(MOHDBSCANClustering *)self->_hdbscanClustering getClusterLabels];
  id v3 = +[NSCountedSet setWithArray:v2];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)generateClusterBundles:(id)a3 withEmbeddings:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (void (**)(id, void *, id))a5;
  double v55 = self;
  v11 = [(MOHDBSCANClustering *)self->_hdbscanClustering getClusterLabels];
  if (![v11 count])
  {
    id v37 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
    CFStringRef v81 = @"Cluster labels were not generated. Unable to create cluster bundles";
    v38 = &v81;
    double v39 = &v80;
LABEL_25:
    v40 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v39 count:1];
    id v14 = [v37 initWithDomain:@"MOBundleClusteringManager" code:0 userInfo:v40];

    double v31 = objc_opt_new();
    v10[2](v10, v31, v14);
    goto LABEL_31;
  }
  id v12 = [v11 count];
  if (v12 != [v9 count])
  {
    id v37 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
    CFStringRef v79 = @"Label count and embedding count do not match. Unable to create cluster bundles";
    v38 = &v79;
    double v39 = &v78;
    goto LABEL_25;
  }
  double v41 = v10;
  double v13 = +[NSCountedSet setWithArray:v11];
  v50 = objc_opt_new();
  v54 = +[NSDate date];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v62;
    id v42 = v9;
    id v43 = v8;
    id v52 = v14;
    double v53 = v11;
    uint64_t v51 = *(void *)v62;
    do
    {
      v18 = 0;
      id v56 = v16;
      do
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v18);
        if (([v19 isEqualToNumber:&off_1002F56F0] & 1) == 0)
        {
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke;
          v60[3] = &unk_1002CD428;
          v60[4] = v19;
          double v57 = [v11 indexesOfObjectsPassingTest:v60];
          v20 = [v9 objectsAtIndexes:];
          double v21 = objc_opt_new();
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke_2;
          v58[3] = &unk_1002CD450;
          id v22 = v21;
          id v59 = v22;
          [v20 enumerateObjectsUsingBlock:v58];
          double v23 = [v22 allObjects];
          v24 = +[NSPredicate predicateWithFormat:@"bundleIdentifier in %@", v23];

          double v25 = [v8 filteredArrayUsingPredicate:v24];
          v26 = [(MOBundleClusteringManager *)v55 _getClusterBundleFrom:v25 withEmbeddings:v20 andCreationDate:v54];
          double v27 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
          if (v26)
          {
            if (v28)
            {
              double v49 = [v26 subBundleIDs];
              id v46 = [v49 count];
              v48 = [v26 clusterMetadata];
              unsigned int v45 = [v48 isFiltered];
              double v47 = [v26 clusterMetadata];
              v44 = [v47 phenotype];
              double v29 = [v26 startDate];
              v30 = [v26 endDate];
              *(_DWORD *)buf = 138413570;
              id v66 = v19;
              __int16 v67 = 2048;
              id v68 = v46;
              __int16 v69 = 1024;
              unsigned int v70 = v45;
              __int16 v71 = 2112;
              float v72 = v44;
              __int16 v73 = 2112;
              float v74 = v29;
              __int16 v75 = 2112;
              float v76 = v30;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Created a cluster bundle: LabelNo=%@,bundleCount=%lu,isFiltered=%d,phenotype=%@, dateRange=%@-%@", buf, 0x3Au);

              id v9 = v42;
              id v8 = v43;
            }
            [v50 addObject:v26];
          }
          else
          {
            if (v28)
            {
              *(_DWORD *)buf = 138412290;
              id v66 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Cluster bundle for label %@ is nil. skip and proceed to the next clustering label", buf, 0xCu);
            }
          }
          id v14 = v52;
          v11 = v53;
          id v16 = v56;
          uint64_t v17 = v51;
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v61 objects:v77 count:16];
    }
    while (v16);
  }

  unint64_t v10 = v41;
  double v31 = v50;
  if (v41)
  {
    id v32 = [v50 count];
    double v33 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
    if (v32)
    {
      double v35 = v50;
      if (v34)
      {
        id v36 = [v50 count];
        *(_DWORD *)buf = 134217984;
        id v66 = v36;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Cluster bundle generation completed. cluster bundle count=%lu", buf, 0xCu);
        double v35 = v50;
      }
    }
    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "No cluster bundle is available", buf, 2u);
      }
      double v35 = 0;
    }

    v41[2](v41, v35, 0);
  }

LABEL_31:
}

id __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToNumber:*(void *)(a1 + 32)];
}

void __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleIdentifier];

  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleIdentifier];
    [v4 addObject:v5];
  }
}

- (void)annotateAnomalyBundles:(id)a3 withEmbeddings:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id, void))a5;
  hdbscanClustering = self->_hdbscanClustering;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(MOHDBSCANClustering *)hdbscanClustering getClusterLabels];
  double v13 = [(MOHDBSCANClustering *)self->_hdbscanClustering getOutlierScoreDict];
  id v14 = objc_opt_new();
  v30 = v12;
  id v15 = [v12 indexesOfObjectsPassingTest:&__block_literal_global_18];
  id v16 = [v10 objectsAtIndexes:v15];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_2;
  v35[3] = &unk_1002CD450;
  id v17 = (id)objc_opt_new();
  id v36 = v17;
  [v16 enumerateObjectsUsingBlock:v35];
  v18 = [v17 allObjects];
  double v19 = +[NSPredicate predicateWithFormat:@"bundleIdentifier in %@", v18];

  v20 = [v11 filteredArrayUsingPredicate:v19];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3;
  v31[3] = &unk_1002CD4B8;
  id v32 = v13;
  double v33 = self;
  id v21 = v14;
  id v34 = v21;
  id v22 = v13;
  [v20 enumerateObjectsUsingBlock:v31];
  if (v8)
  {
    id v23 = [v21 count];
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v25)
      {
        id v26 = [v21 count];
        *(_DWORD *)buf = 134217984;
        id v38 = v26;
        double v27 = "Anomaly bundle annotation completed. Annotated anomaly bundle count=%lu";
        BOOL v28 = v24;
        uint32_t v29 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
    else if (v25)
    {
      *(_WORD *)buf = 0;
      double v27 = "No bundle was annotated with anomaly metadata.";
      BOOL v28 = v24;
      uint32_t v29 = 2;
      goto LABEL_7;
    }

    v8[2](v8, v21, 0);
  }
}

BOOL __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke(id a1, NSNumber *a2, unint64_t a3, BOOL *a4)
{
  return -[NSNumber isEqualToNumber:](a2, "isEqualToNumber:", &off_1002F56F0, a4);
}

void __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleIdentifier];

  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleIdentifier];
    [v4 addObject:v5];
  }
}

void __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleIdentifier];
  id v6 = [v5 UUIDString];
  v7 = [v4 objectForKeyedSubscript:v6];
  [v7 doubleValue];
  double v9 = v8;

  id v10 = [v3 rankingDictionary];
  id v11 = [v10 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v11 floatValue];
  float v13 = v12;
  double v14 = v12;

  uint64_t v15 = *(void *)(a1 + 40);
  float v16 = *(float *)(v15 + 16);
  BOOL v17 = v13 > *(float *)(v15 + 12);
  BOOL v18 = v9 > v16 && v17;
  double v19 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    BOOL v25 = [v3 bundleIdentifier];
    int v26 = 138413058;
    double v27 = v25;
    __int16 v28 = 1024;
    BOOL v29 = v18;
    __int16 v30 = 2048;
    double v31 = v14;
    __int16 v32 = 2048;
    double v33 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Anomaly bundle %@ significance: isSignificant %d, bundleGoodnessScore %.3f, outlierScore %.3f", (uint8_t *)&v26, 0x26u);
  }
  v20 = [MOOutlierMetadata alloc];
  id v21 = [v3 bundleIdentifier];
  id v22 = +[NSDate date];
  id v23 = [(MOOutlierMetadata *)v20 initWithIdentifier:v21 updateDate:v22 isSignificant:v18 outlierScore:v9 outlierScoreThreshold:*(float *)(*(void *)(a1 + 40) + 16) bundleGoodnessScore:v14 bundleGoodnessScoreThreshold:*(float *)(*(void *)(a1 + 40) + 12)];

  [v3 setOutlierMetadata:v23];
  v24 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3_cold_1(v3);
  }

  [*(id *)(a1 + 48) addObject:v3];
}

- (id)_getClusterBundleFrom:(id)a3 withEmbeddings:(id)a4 andCreationDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MOEventBundle alloc];
  id v11 = +[NSUUID UUID];
  id v396 = v9;
  float v12 = [(MOEventBundle *)v10 initWithBundleIdentifier:v11 creationDate:v9];

  float v13 = [(MOEventBundle *)v12 bundleIdentifier];
  [(MOEventBundle *)v12 setSuggestionID:v13];

  double v14 = [(MOEventBundle *)v12 creationDate];
  uint64_t v15 = [v14 dateByAddingTimeInterval:2419200.0];
  [(MOEventBundle *)v12 setExpirationDate:v15];

  [(MOEventBundle *)v12 setInterfaceType:15];
  [(MOEventBundle *)v12 setBundleSuperType:9];
  v400 = v12;
  [(MOEventBundle *)v12 setBundleSubType:910];
  v399 = v7;
  id v16 = [v7 count];
  v508[0] = _NSConcreteStackBlock;
  v508[1] = 3221225472;
  v508[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke;
  v508[3] = &unk_1002CD450;
  id v405 = (id)objc_opt_new();
  id v509 = v405;
  id v397 = v8;
  [v8 enumerateObjectsUsingBlock:v508];
  v537[0] = @"topLevelActivityType";
  v537[1] = @"secondLevelActivityType";
  v537[2] = @"isWeekend";
  v537[3] = @"timeTag";
  v537[4] = @"dayOfWeek";
  v537[5] = @"placeName";
  v537[6] = @"combinedPlaceType";
  v537[7] = @"enclosingAreaName";
  v537[8] = @"persons";
  BOOL v17 = +[NSArray arrayWithObjects:v537 count:9];
  v536[0] = @"withFamily";
  v536[1] = @"withCoworker";
  v536[2] = @"withFriend";
  v536[3] = @"withChild";
  v536[4] = @"withMyPet";
  uint64_t v18 = +[NSArray arrayWithObjects:v536 count:5];
  v535[0] = @"activityTypeFromPhotoTraits";
  v535[1] = @"timeContextFromPhotoTraits";
  v535[2] = @"placeTypeFromPhotoTraits";
  v535[3] = @"socialEventFromPhotoTraits";
  v535[4] = @"otherSubjectFromPhotoTraits";
  uint64_t v19 = +[NSArray arrayWithObjects:v535 count:5];
  v407 = (void *)v18;
  v20 = [v17 arrayByAddingObjectsFromArray:v18];

  v398 = (void *)v19;
  id v21 = [v20 arrayByAddingObjectsFromArray:v19];

  v404 = objc_opt_new();
  double v22 = COERCE_DOUBLE(objc_opt_new());
  v402 = objc_opt_new();
  v422 = objc_opt_new();
  double v414 = COERCE_DOUBLE(objc_opt_new());
  long long v504 = 0u;
  long long v505 = 0u;
  long long v506 = 0u;
  long long v507 = 0u;
  id obj = v21;
  double v419 = v22;
  id v406 = [obj countByEnumeratingWithState:&v504 objects:v534 count:16];
  double v23 = 0.0;
  if (v406)
  {
    uint64_t v403 = *(void *)v505;
    double v24 = (double)(unint64_t)v16;
    id v411 = v16;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v505 != v403) {
          objc_enumerationMutation(obj);
        }
        uint64_t v408 = v25;
        int v26 = *(void **)(*((void *)&v504 + 1) + 8 * v25);
        unsigned int v27 = [v26 isEqualToString:@"persons"];
        double v28 = COERCE_DOUBLE(objc_opt_new());

        double v428 = v28;
        id v425 = v26;
        if (!v27)
        {
          v490[0] = _NSConcreteStackBlock;
          v490[1] = 3221225472;
          v490[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_313;
          v490[3] = &unk_1002CD4E0;
          v490[4] = self;
          v490[5] = v26;
          id v78 = *(id *)&v28;
          id v491 = v78;
          [v405 enumerateObjectsUsingBlock:v490];
          CFStringRef v79 = [v78 keysSortedByValueUsingComparator:&__block_literal_global_317];
          double v437 = [v79 firstObject];
          NSErrorUserInfoKey v80 = [v78 objectForKeyedSubscript:];
          double v432 = COERCE_DOUBLE([v80 count]);

          CFStringRef v81 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v440 = v79;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            double v171 = [v78 description];
            *(_DWORD *)buf = 138412802;
            double v524 = *(double *)&v26;
            __int16 v525 = 2112;
            double v526 = v171;
            __int16 v527 = 2112;
            v528 = v440;
            _os_log_debug_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "Current featureKey:%@, subBundleIDsGroupedByFeatureValues:%@, sortedFeatureValuesByFrequency:%@", buf, 0x20u);

            CFStringRef v79 = v440;
          }

          v82 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v524 = v437;
            __int16 v525 = 2048;
            double v526 = v432;
            _os_log_debug_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "mostFrequentFeatureValue:%@, count:%lu", buf, 0x16u);
          }

          if ([v26 isEqualToString:@"topLevelActivityType"])
          {
            double v83 = COERCE_DOUBLE(objc_opt_new());
            long long v486 = 0u;
            long long v487 = 0u;
            long long v488 = 0u;
            long long v489 = 0u;
            id v84 = v79;
            id v85 = [v84 countByEnumeratingWithState:&v486 objects:v520 count:16];
            if (v85)
            {
              id v86 = v85;
              uint64_t v87 = *(void *)v487;
              do
              {
                for (i = 0; i != v86; i = (char *)i + 1)
                {
                  if (*(void *)v487 != v87) {
                    objc_enumerationMutation(v84);
                  }
                  uint64_t v89 = *(void *)(*((void *)&v486 + 1) + 8 * i);
                  v90 = [v78 objectForKeyedSubscript:v89];
                  id v91 = [v90 count];
                  unint64_t clusterPhenotypeMinimumCountThreshold = self->_clusterPhenotypeMinimumCountThreshold;

                  if ((unint64_t)v91 >= clusterPhenotypeMinimumCountThreshold)
                  {
                    v93 = [v78 objectForKeyedSubscript:v89];
                    v94 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v93 count]);
                    [*(id *)&v83 setObject:v94 forKeyedSubscript:v89];
                  }
                }
                id v86 = [v84 countByEnumeratingWithState:&v486 objects:v520 count:16];
              }
              while (v86);
            }

            v95 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v524 = v83;
              _os_log_debug_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "TopLevelActivityType phenotypeCandidatesWithValueCounts before filtering:%@", buf, 0xCu);
            }

            int v26 = v425;
            if ((unint64_t)[*(id *)&v83 count] >= 2)
            {
              uint64_t v96 = [*(id *)&v83 objectForKeyedSubscript:@"outing"];
              if (v96)
              {
                v97 = (void *)v96;
                v98 = [*(id *)&v83 objectForKeyedSubscript:@"outing"];
                [v98 doubleValue];
                double clusterPhenotypeArbirationThreshold = self->_clusterPhenotypeArbirationThreshold;
                double v101 = v100 / v24;

                if (v101 < clusterPhenotypeArbirationThreshold)
                {
                  v102 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                  {
                    CFStringRef v103 = @"outing";
                    goto LABEL_105;
                  }
                  CFStringRef v180 = @"outing";
                  v181 = [*(id *)&v83 objectForKeyedSubscript:@"outing"];
                  [v181 doubleValue];
                  double v182 = self->_clusterPhenotypeArbirationThreshold;
                  *(_DWORD *)buf = 134218240;
                  double v524 = v183 / v24;
                  __int16 v525 = 2048;
                  double v526 = v182;
                  v184 = v102;
                  v185 = "Pruning outing from top level activity phenotype candidate since its proportion (%.3f) is lower"
                         " than threshold %.3f";
LABEL_179:
                  _os_log_debug_impl((void *)&_mh_execute_header, v184, OS_LOG_TYPE_DEBUG, v185, buf, 0x16u);

                  CFStringRef v103 = v180;
                  goto LABEL_105;
                }
              }
              uint64_t v128 = [*(id *)&v83 objectForKeyedSubscript:@"time_at_home"];
              if (v128)
              {
                v129 = (void *)v128;
                v130 = [*(id *)&v83 objectForKeyedSubscript:@"time_at_home"];
                [v130 doubleValue];
                double v131 = self->_clusterPhenotypeArbirationThreshold;
                double v133 = v132 / v24;

                if (v133 < v131)
                {
                  v102 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                  {
                    CFStringRef v180 = @"time_at_home";
                    v181 = [*(id *)&v83 objectForKeyedSubscript:@"time_at_home"];
                    [v181 doubleValue];
                    double v186 = self->_clusterPhenotypeArbirationThreshold;
                    *(_DWORD *)buf = 134218240;
                    double v524 = v187 / v24;
                    __int16 v525 = 2048;
                    double v526 = v186;
                    v184 = v102;
                    v185 = "Pruning timeAthome from top level activity phenotype candidate since its proportion (%.3f) is"
                           " less than threshold %.3f";
                    goto LABEL_179;
                  }
                  CFStringRef v103 = @"time_at_home";
LABEL_105:

                  [*(id *)&v83 removeObjectForKey:v103];
                }
              }
            }
            if ([*(id *)&v83 count])
            {
              v134 = [*(id *)&v83 keysSortedByValueUsingComparator:&__block_literal_global_327];
              double v126 = [v134 firstObject];

              v135 = [*(id *)&v83 objectForKeyedSubscript:*(void *)&v126];
              LODWORD(v127) = [v135 intValue];

              v136 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
              double v22 = v419;
              if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v524 = v126;
                _os_log_debug_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEBUG, "TopLevelActivityType selected phenotype:%@", buf, 0xCu);
              }
              goto LABEL_122;
            }
            unint64_t v127 = *(void *)&v432;
            double v126 = v437;
            double v22 = v419;
LABEL_123:

            CFStringRef v79 = v440;
LABEL_124:
            v146 = +[NSNull null];
            if ([*(id *)&v126 isEqual:v146])
            {
              double v147 = v126;
              goto LABEL_127;
            }
            double v147 = v126;
            if ([*(id *)&v126 isEqualToString:@"unavailable"])
            {
LABEL_127:
              double v23 = v428;
              goto LABEL_128;
            }
            unint64_t v167 = self->_clusterPhenotypeMinimumCountThreshold;

            BOOL v168 = v127 >= v167;
            CFStringRef v79 = v440;
            double v23 = v428;
            if (!v168)
            {
LABEL_129:

              goto LABEL_130;
            }
            if ([v407 containsObject:v26])
            {
              if (![*(id *)&v147 BOOLValue]) {
                goto LABEL_129;
              }
              [v402 setObject:*(void *)&v147 forKeyedSubscript:v26];
              v169 = [v78 objectForKeyedSubscript:*(void *)&v147];
              [v422 setObject:v169 forKeyedSubscript:v26];

              v146 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
              {
LABEL_176:
                double v178 = [v402 objectForKeyedSubscript:v26];
                v179 = [v422 objectForKeyedSubscript:v26];
                *(_DWORD *)buf = 138412802;
                double v524 = *(double *)&v26;
                __int16 v525 = 2112;
                double v526 = v178;
                __int16 v527 = 2112;
                v528 = v179;
                _os_log_debug_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEBUG, " %@ Phenotype was found: %@. subbundles:%@", buf, 0x20u);

                CFStringRef v79 = v440;
              }
            }
            else if ([v26 isEqualToString:@"combinedPlaceType"])
            {
              if ([*(id *)&v147 isEqualToString:@"RTMapItemPOICategoryUndefined"]) {
                goto LABEL_129;
              }
              [v402 setObject:*(void *)&v147 forKeyedSubscript:v26];
              v170 = [v78 objectForKeyedSubscript:*(void *)&v147];
              [v422 setObject:v170 forKeyedSubscript:v26];

              v146 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_176;
              }
            }
            else
            {
              double v172 = (double)*(unint64_t *)&v432 / v24;
              if ([v26 isEqualToString:@"dayOfWeek"])
              {
                if (v172 <= self->_clusterPhenotypeMinimumRatioThreshold)
                {
                  v173 = [v402 objectForKeyedSubscript:@"isWeekend"];

                  if (v173) {
                    goto LABEL_129;
                  }
                }
                [v402 setObject:*(void *)&v147 forKeyedSubscript:v26];
                v174 = [v78 objectForKeyedSubscript:*(void *)&v147];
                [v422 setObject:v174 forKeyedSubscript:v26];

                v146 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_176;
                }
              }
              else if ([v26 isEqualToString:@"secondLevelActivityType"])
              {
                if (v172 <= self->_clusterPhenotypeMinimumRatioThreshold)
                {
                  v175 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];

                  if (v175) {
                    goto LABEL_129;
                  }
                }
                [v402 setObject:*(void *)&v147 forKeyedSubscript:v26];
                v176 = [v78 objectForKeyedSubscript:*(void *)&v147];
                [v422 setObject:v176 forKeyedSubscript:v26];

                v146 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_176;
                }
              }
              else
              {
                [v402 setObject:*(void *)&v147 forKeyedSubscript:v26];
                v177 = [v78 objectForKeyedSubscript:*(void *)&v147];
                [v422 setObject:v177 forKeyedSubscript:v26];

                v146 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_176;
                }
              }
            }
LABEL_128:

            goto LABEL_129;
          }
          if (![v26 isEqualToString:@"secondLevelActivityType"])
          {
            unint64_t v127 = *(void *)&v432;
            double v126 = v437;
            goto LABEL_124;
          }
          double v83 = COERCE_DOUBLE(objc_opt_new());
          long long v482 = 0u;
          long long v483 = 0u;
          long long v484 = 0u;
          long long v485 = 0u;
          id v104 = v79;
          id v105 = [v104 countByEnumeratingWithState:&v482 objects:v519 count:16];
          if (v105)
          {
            id v106 = v105;
            uint64_t v107 = *(void *)v483;
            do
            {
              for (j = 0; j != v106; j = (char *)j + 1)
              {
                if (*(void *)v483 != v107) {
                  objc_enumerationMutation(v104);
                }
                uint64_t v109 = *(void *)(*((void *)&v482 + 1) + 8 * (void)j);
                v110 = [v78 objectForKeyedSubscript:v109];
                id v111 = [v110 count];
                unint64_t v112 = self->_clusterPhenotypeMinimumCountThreshold;

                if ((unint64_t)v111 >= v112)
                {
                  v113 = [v78 objectForKeyedSubscript:v109];
                  v114 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v113 count]);
                  [*(id *)&v83 setObject:v114 forKeyedSubscript:v109];
                }
              }
              id v106 = [v104 countByEnumeratingWithState:&v482 objects:v519 count:16];
            }
            while (v106);
          }

          v115 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v524 = v83;
            _os_log_debug_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEBUG, "SecondLevelActivityType phenotypeCandidatesWithValueCounts before filtering:%@", buf, 0xCu);
          }

          int v26 = v425;
          if ((unint64_t)[*(id *)&v83 count] >= 2)
          {
            v116 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];
            if (([v116 isEqualToString:@"outing"] & 1) != 0
              || ([*(id *)&v83 objectForKeyedSubscript:@"visit"],
                  (uint64_t v117 = objc_claimAutoreleasedReturnValue()) == 0))
            {
            }
            else
            {
              v118 = (void *)v117;
              v119 = [*(id *)&v83 objectForKeyedSubscript:@"visit"];
              [v119 doubleValue];
              double v120 = self->_clusterPhenotypeArbirationThreshold;
              double v122 = v121 / v24;

              if (v122 < v120)
              {
                v123 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
                {
                  v188 = [*(id *)&v83 objectForKeyedSubscript:@"visit"];
                  [v188 doubleValue];
                  double v189 = self->_clusterPhenotypeArbirationThreshold;
                  *(_DWORD *)buf = 134218240;
                  double v524 = v190 / v24;
                  __int16 v525 = 2048;
                  double v526 = v189;
                  _os_log_debug_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEBUG, "Pruning visit from top level activity phenotype candidate since its proportion (%.3f) is lower than threshold %.3f", buf, 0x16u);
                }
                double v124 = v83;
                CFStringRef v125 = @"visit";
                goto LABEL_117;
              }
            }
            v137 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];
            if ([v137 isEqualToString:@"time_at_home"]
              || ([*(id *)&v83 objectForKeyedSubscript:@"Photos at Home"],
                  (uint64_t v138 = objc_claimAutoreleasedReturnValue()) == 0))
            {
            }
            else
            {
              v139 = (void *)v138;
              v140 = [*(id *)&v83 objectForKeyedSubscript:@"Photos at Home"];
              [v140 doubleValue];
              double v141 = self->_clusterPhenotypeArbirationThreshold;
              double v143 = v142 / v24;

              if (v143 < v141)
              {
                v144 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
                {
                  v191 = [*(id *)&v83 objectForKeyedSubscript:@"Photos at Home"];
                  [v191 doubleValue];
                  double v192 = self->_clusterPhenotypeArbirationThreshold;
                  *(_DWORD *)buf = 134218240;
                  double v524 = v193 / v24;
                  __int16 v525 = 2048;
                  double v526 = v192;
                  _os_log_debug_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEBUG, "Pruning P@H from top level activity phenotype candidate since its proportion (%.3f) is lower than threshold %.3f", buf, 0x16u);
                }
                double v124 = v83;
                CFStringRef v125 = @"Photos at Home";
LABEL_117:
                [*(id *)&v124 removeObjectForKey:v125];
              }
            }
          }
          double v22 = v419;
          if ([*(id *)&v83 count])
          {
            v134 = [*(id *)&v83 keysSortedByValueUsingComparator:&__block_literal_global_336];
            double v126 = [v134 firstObject];

            v145 = [*(id *)&v83 objectForKeyedSubscript:*(void *)&v126];
            LODWORD(v127) = [v145 intValue];

            v136 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v524 = v126;
              _os_log_debug_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEBUG, "SecondLevelActivityType selected phenotype:%@", buf, 0xCu);
            }
LABEL_122:
            unint64_t v127 = (int)v127;

            int v26 = v425;
          }
          else
          {
            unint64_t v127 = *(void *)&v432;
            double v126 = v437;
          }
          goto LABEL_123;
        }
        v439 = objc_opt_new();
        long long v500 = 0u;
        long long v501 = 0u;
        long long v502 = 0u;
        long long v503 = 0u;
        id v29 = v405;
        id v30 = [v29 countByEnumeratingWithState:&v500 objects:v533 count:16];
        if (!v30) {
          goto LABEL_35;
        }
        id v31 = v30;
        uint64_t v32 = *(void *)v501;
        uint64_t v415 = *(void *)v501;
        id v417 = v29;
        do
        {
          id v33 = 0;
          id v420 = v31;
          do
          {
            if (*(void *)v501 != v32) {
              objc_enumerationMutation(v29);
            }
            v431 = (char *)v33;
            id v34 = *(void **)(*((void *)&v500 + 1) + 8 * (void)v33);
            double v35 = [v34 objectForKeyedSubscript:@"persons"];
            id v36 = [v34 objectForKeyedSubscript:@"bundleID"];
            id v37 = +[NSNull null];
            v435 = v35;
            if ([v35 isEqual:v37])
            {

LABEL_28:
              double v55 = [*(id *)&v28 objectForKeyedSubscript:@"unavailable"];
              id v56 = [v55 count];

              if (v56)
              {
                double v57 = [*(id *)&v28 objectForKeyedSubscript:@"unavailable"];
                id v39 = [v57 mutableCopy];

                [v39 addObject:v36];
              }
              else
              {
                v530 = v36;
                id v39 = +[NSArray arrayWithObjects:&v530 count:1];
              }
              v58 = v431;
              [*(id *)&v28 setObject:v39 forKeyedSubscript:@"unavailable"];
              goto LABEL_33;
            }
            id v38 = [v35 count];

            if (!v38) {
              goto LABEL_28;
            }
            long long v499 = 0u;
            long long v498 = 0u;
            long long v497 = 0u;
            long long v496 = 0u;
            id v39 = v435;
            id v40 = [v39 countByEnumeratingWithState:&v496 objects:v532 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v497;
              do
              {
                for (k = 0; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v497 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v44 = *(void **)(*((void *)&v496 + 1) + 8 * (void)k);
                  unsigned int v45 = [v44 name];
                  id v46 = [v45 length];

                  if (v46)
                  {
                    double v47 = [v44 name];
                    v48 = [*(id *)&v28 objectForKeyedSubscript:v47];
                    double v49 = v28;
                    id v50 = [v48 count];

                    if (v50)
                    {
                      uint64_t v51 = [v44 name];
                      id v52 = [*(id *)&v49 objectForKeyedSubscript:v51];
                      id v53 = [v52 mutableCopy];

                      [v53 addObject:v36];
                    }
                    else
                    {
                      v531 = v36;
                      id v53 = +[NSArray arrayWithObjects:&v531 count:1];
                    }
                    v54 = [v44 name];
                    [*(id *)&v49 setObject:v53 forKeyedSubscript:v54];
                    double v28 = v49;

                    [v439 addObject:v44];
                  }
                }
                id v41 = [v39 countByEnumeratingWithState:&v496 objects:v532 count:16];
              }
              while (v41);
              id v29 = v417;
              double v22 = v419;
              uint64_t v32 = v415;
              id v31 = v420;
            }
            v58 = v431;
LABEL_33:

            id v33 = v58 + 1;
          }
          while (v33 != v31);
          id v31 = [v29 countByEnumeratingWithState:&v500 objects:v533 count:16];
        }
        while (v31);
LABEL_35:

        id v59 = (id)objc_opt_new();
        long long v492 = 0u;
        long long v493 = 0u;
        long long v494 = 0u;
        long long v495 = 0u;
        id v60 = *(id *)&v28;
        id v61 = [v60 countByEnumeratingWithState:&v492 objects:v529 count:16];
        if (v61)
        {
          id v62 = v61;
          uint64_t v63 = *(void *)v493;
          uint64_t v436 = *(void *)v493;
          do
          {
            for (m = 0; m != v62; m = (char *)m + 1)
            {
              if (*(void *)v493 != v63) {
                objc_enumerationMutation(v60);
              }
              v65 = *(void **)(*((void *)&v492 + 1) + 8 * (void)m);
              if (([v65 isEqualToString:@"unavailable"] & 1) == 0)
              {
                id v66 = [v60 objectForKeyedSubscript:v65];
                double v67 = COERCE_DOUBLE([v66 count]);

                id v68 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  double v77 = [v65 mask];
                  *(_DWORD *)buf = 138412802;
                  double v524 = v77;
                  __int16 v525 = 2048;
                  double v526 = v67;
                  __int16 v527 = 2048;
                  v528 = v411;
                  _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Current contactName:%@, count:%lu, totalSubBundleCount:%lu", buf, 0x20u);
                }
                if (*(void *)&v67 >= self->_clusterPhenotypeMinimumCountThreshold)
                {
                  __int16 v69 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
                    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.9((uint64_t)v522, (uint64_t)v65);
                  }

                  if ([v59 length])
                  {
                    id v70 = +[NSString stringWithFormat:@"%@, %@", v59, v65];

                    id v59 = v70;
                  }
                  else
                  {
                    id v70 = v59;
                    id v59 = v65;
                  }

                  __int16 v71 = [v425 stringByAppendingFormat:@"_%@", v65];
                  float v72 = [v60 objectForKeyedSubscript:v65];
                  [v422 setObject:v72 forKeyedSubscript:v71];

                  __int16 v73 = +[NSPredicate predicateWithFormat:@"name==%@", v65];
                  double v74 = [v439 filteredSetUsingPredicate:v73];
                  if ([*(id *)&v74 count])
                  {
                    __int16 v75 = [*(id *)&v74 allObjects];
                    [*(id *)&v414 addObjectsFromArray:v75];

                    float v76 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      double v524 = v74;
                      __int16 v525 = 2112;
                      double v526 = v414;
                      _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Added current persons %@ to allPersonPhenotype%@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    float v76 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
                      -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.8((uint64_t)v521, (uint64_t)v65);
                    }
                  }

                  uint64_t v63 = v436;
                }
              }
            }
            id v62 = [v60 countByEnumeratingWithState:&v492 objects:v529 count:16];
          }
          while (v62);
        }

        int v26 = v425;
        if ([v59 length]) {
          [v402 setObject:v59 forKeyedSubscript:v425];
        }
        [v404 setObject:v60 forKeyedSubscript:v425];

        double v23 = v428;
LABEL_130:
        if ([v407 containsObject:v26])
        {
          long long v481 = 0u;
          long long v480 = 0u;
          long long v479 = 0u;
          long long v478 = 0u;
          id v148 = *(id *)&v23;
          id v149 = [v148 countByEnumeratingWithState:&v478 objects:v518 count:16];
          if (v149)
          {
            id v150 = v149;
            uint64_t v151 = *(void *)v479;
            do
            {
              for (n = 0; n != v150; n = (char *)n + 1)
              {
                if (*(void *)v479 != v151) {
                  objc_enumerationMutation(v148);
                }
                v153 = *(void **)(*((void *)&v478 + 1) + 8 * (void)n);
                v154 = [&off_1002F5708 stringValue];
                unsigned int v155 = [v153 isEqualToString:v154];

                if (v155)
                {
                  v156 = [*(id *)&v22 objectForKeyedSubscript:v26];
                  id v157 = [v156 count];

                  if (v157)
                  {
                    v158 = [*(id *)&v22 objectForKeyedSubscript:v26];
                    v159 = [v148 objectForKeyedSubscript:v153];
                    v160 = [v158 arrayByAddingObjectsFromArray:v159];
                    [*(id *)&v22 setObject:v160 forKeyedSubscript:v26];
                  }
                  else
                  {
                    v158 = [v148 objectForKeyedSubscript:v153];
                    [*(id *)&v22 setObject:v158 forKeyedSubscript:v26];
                  }
                  double v23 = v428;
                }
                else
                {
                  v158 = [@"not" stringByAppendingString:v26];
                  v161 = [*(id *)&v22 objectForKeyedSubscript:v158];
                  id v162 = [v161 count];

                  if (v162)
                  {
                    v163 = [*(id *)&v22 objectForKeyedSubscript:v158];
                    v164 = [v148 objectForKeyedSubscript:v153];
                    v165 = [v163 arrayByAddingObjectsFromArray:v164];
                    [*(id *)&v22 setObject:v165 forKeyedSubscript:v158];
                  }
                  else
                  {
                    v163 = [v148 objectForKeyedSubscript:v153];
                    [*(id *)&v22 setObject:v163 forKeyedSubscript:v158];
                  }

                  double v23 = v428;
                  int v26 = v425;
                }
              }
              id v150 = [v148 countByEnumeratingWithState:&v478 objects:v518 count:16];
            }
            while (v150);
          }

          v166 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v524 = *(double *)&v26;
            __int16 v525 = 2112;
            double v526 = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEBUG, "subBundleIDsGroupedByFeatureValues for %@: %@", buf, 0x16u);
          }
        }
        else
        {
          [v404 setObject:*(void *)&v23 forKeyedSubscript:v26];
          v166 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v524 = *(double *)&v26;
            __int16 v525 = 2112;
            double v526 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEBUG, "subBundleIDsGroupedByFeatureValues for %@: %@", buf, 0x16u);
          }
        }

        uint64_t v25 = v408 + 1;
      }
      while ((id)(v408 + 1) != v406);
      id v194 = [obj countByEnumeratingWithState:&v504 objects:v534 count:16];
      id v406 = v194;
    }
    while (v194);
  }

  v195 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  if (os_log_type_enabled(v195, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.7();
  }
  double v429 = v23;

  id v196 = (id)objc_opt_new();
  long long v474 = 0u;
  long long v475 = 0u;
  long long v476 = 0u;
  long long v477 = 0u;
  id v413 = v422;
  id v197 = [v413 countByEnumeratingWithState:&v474 objects:v517 count:16];
  if (v197)
  {
    id v198 = v197;
    uint64_t v199 = 0;
    uint64_t v200 = *(void *)v475;
    while (2)
    {
      v201 = 0;
      uint64_t v202 = -v199;
      v199 += (uint64_t)v198;
      do
      {
        if (*(void *)v475 != v200) {
          objc_enumerationMutation(v413);
        }
        double v203 = *(double *)(*((void *)&v474 + 1) + 8 * (void)v201);
        double v418 = [v413 objectForKeyedSubscript:*(void *)&v203];
        v204 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
        if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          double v524 = v203;
          __int16 v525 = 2112;
          double v526 = v418;
          _os_log_debug_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_DEBUG, "Current phenotype value: %@, subBundles: %@", buf, 0x16u);
        }

        if ((void *)v202 == v201)
        {
          double v205 = v418;
          uint64_t v206 = +[NSMutableSet setWithArray:*(void *)&v418];

          id v196 = (id)v206;
        }
        else
        {
          v207 = +[NSSet setWithArray:*(void *)&v418];
          [v196 intersectSet:v207];

          if ((unint64_t)[v196 count] < self->_clusterPhenotypeMinimumCountThreshold)
          {
            v221 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
            v412 = v221;
            if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG)) {
              -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:](v221);
            }
            v219 = 0;
            v208 = v413;
            v222 = v413;
            v212 = v399;
            v218 = v396;
            v220 = v397;
            double v215 = v419;
            double v216 = v429;
            goto LABEL_387;
          }
          double v205 = v418;
        }

        v201 = (char *)v201 + 1;
      }
      while (v198 != v201);
      id v198 = [v413 countByEnumeratingWithState:&v474 objects:v517 count:16];
      if (v198) {
        continue;
      }
      break;
    }
  }
  v208 = v413;

  v209 = [v196 allObjects];
  uint64_t v210 = +[NSPredicate predicateWithFormat:@"bundleIdentifier in %@", v209];

  uint64_t v211 = v210;
  v212 = v399;
  double v213 = [v399 filteredArrayUsingPredicate:v210];
  v214 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  double v215 = v419;
  if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.5(v399, *(void **)&v213);
  }
  v410 = (void *)v211;

  double v216 = v429;
  if ((unint64_t)[*(id *)&v213 count] >= self->_clusterPhenotypeMinimumCountThreshold)
  {
    v223 = [*(id *)&v213 valueForKeyPath:@"@min.startDate"];
    [(MOEventBundle *)v400 setStartDate:v223];

    v224 = [*(id *)&v213 valueForKeyPath:@"@max.endDate"];
    [(MOEventBundle *)v400 setEndDate:v224];

    v225 = objc_opt_new();
    v226 = objc_opt_new();
    v471[0] = _NSConcreteStackBlock;
    v471[1] = 3221225472;
    v471[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_352;
    v471[3] = &unk_1002C9590;
    v227 = v225;
    v472 = v227;
    id v228 = v226;
    id v473 = v228;
    [*(id *)&v213 enumerateObjectsUsingBlock:v471];
    v412 = v227;
    [(MOEventBundle *)v400 setSubBundleIDs:v227];
    v409 = v228;
    [(MOEventBundle *)v400 setSubSuggestionIDs:v228];
    v423 = objc_opt_new();
    long long v467 = 0u;
    long long v468 = 0u;
    long long v469 = 0u;
    long long v470 = 0u;
    double v229 = COERCE_DOUBLE(*(id *)&v213);
    id v230 = [*(id *)&v229 countByEnumeratingWithState:&v467 objects:v516 count:16];
    if (v230)
    {
      id v231 = v230;
      uint64_t v232 = *(void *)v468;
      do
      {
        for (ii = 0; ii != v231; ii = (char *)ii + 1)
        {
          if (*(void *)v468 != v232) {
            objc_enumerationMutation(*(id *)&v229);
          }
          v234 = [*(id *)(*((void *)&v467 + 1) + 8 * (void)ii) events];
          [v423 addObjectsFromArray:v234];
        }
        id v231 = [*(id *)&v229 countByEnumeratingWithState:&v467 objects:v516 count:16];
      }
      while (v231);
    }
    double v418 = v229;

    v235 = [v423 allObjects];
    [(MOEventBundle *)v400 setEvents:v235];

    v416 = objc_opt_new();
    long long v463 = 0u;
    long long v464 = 0u;
    long long v465 = 0u;
    long long v466 = 0u;
    id v426 = v404;
    id v424 = [v426 countByEnumeratingWithState:&v463 objects:v515 count:16];
    if (v424)
    {
      uint64_t v421 = *(void *)v464;
      do
      {
        uint64_t v236 = 0;
        do
        {
          if (*(void *)v464 != v421) {
            objc_enumerationMutation(v426);
          }
          uint64_t v433 = v236;
          double v427 = *(double *)(*((void *)&v463 + 1) + 8 * v236);
          v237 = [v426 objectForKeyedSubscript:v236];
          double v238 = COERCE_DOUBLE(objc_opt_new());
          long long v459 = 0u;
          long long v460 = 0u;
          long long v461 = 0u;
          long long v462 = 0u;
          id v239 = v237;
          id v240 = [v239 countByEnumeratingWithState:&v459 objects:v514 count:16];
          if (v240)
          {
            id v241 = v240;
            uint64_t v242 = *(void *)v460;
            do
            {
              for (jj = 0; jj != v241; jj = (char *)jj + 1)
              {
                if (*(void *)v460 != v242) {
                  objc_enumerationMutation(v239);
                }
                double v244 = *(double *)(*((void *)&v459 + 1) + 8 * (void)jj);
                v245 = [v239 objectForKeyedSubscript:*(void *)&v244];
                id v246 = [v245 count];

                if (v246)
                {
                  v247 = [v239 objectForKeyedSubscript:*(void *)&v244];
                  double v248 = +[NSMutableSet setWithArray:v247];

                  v249 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  if (os_log_type_enabled(v249, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    double v524 = v244;
                    __int16 v525 = 2112;
                    double v526 = v248;
                    _os_log_debug_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEBUG, "Current featureValue %@, SubBundleIDs %@", buf, 0x16u);
                  }

                  [*(id *)&v248 intersectSet:v196];
                  v250 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  if (os_log_type_enabled(v250, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    double v524 = v248;
                    _os_log_debug_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_DEBUG, "Intersection between feature value subbundles and phenotype subbundles %@", buf, 0xCu);
                  }

                  if ([*(id *)&v248 count])
                  {
                    v251 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)&v248 count]);
                    [*(id *)&v238 setObject:v251 forKeyedSubscript:*(void *)&v244];
                  }
                }
              }
              id v241 = [v239 countByEnumeratingWithState:&v459 objects:v514 count:16];
            }
            while (v241);
          }

          v252 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          if (os_log_type_enabled(v252, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v524 = v427;
            __int16 v525 = 2112;
            double v526 = v238;
            _os_log_debug_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEBUG, "%@ Histogram: %@", buf, 0x16u);
          }

          double v215 = v419;
          if ([*(id *)&v238 count]) {
            [v416 setObject:*(void *)&v238 forKeyedSubscript:*(void *)&v427];
          }

          uint64_t v236 = v433 + 1;
        }
        while ((id)(v433 + 1) != v424);
        id v424 = [v426 countByEnumeratingWithState:&v463 objects:v515 count:16];
      }
      while (v424);
    }

    v253 = objc_opt_new();
    long long v455 = 0u;
    long long v456 = 0u;
    long long v457 = 0u;
    long long v458 = 0u;
    id v254 = *(id *)&v215;
    id v255 = [v254 countByEnumeratingWithState:&v455 objects:v513 count:16];
    if (v255)
    {
      id v256 = v255;
      uint64_t v257 = *(void *)v456;
      do
      {
        for (kk = 0; kk != v256; kk = (char *)kk + 1)
        {
          if (*(void *)v456 != v257) {
            objc_enumerationMutation(v254);
          }
          uint64_t v259 = *(void *)(*((void *)&v455 + 1) + 8 * (void)kk);
          v260 = [v254 objectForKeyedSubscript:v259];
          id v261 = [v260 count];

          if (v261)
          {
            v262 = [v254 objectForKeyedSubscript:v259];
            v263 = +[NSMutableSet setWithArray:v262];

            [v263 intersectSet:v196];
            if ([v263 count])
            {
              v264 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v263 count]);
              [v253 setObject:v264 forKeyedSubscript:v259];
            }
          }
        }
        id v256 = [v254 countByEnumeratingWithState:&v455 objects:v513 count:16];
      }
      while (v256);
    }

    v265 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    if (os_log_type_enabled(v265, OS_LOG_TYPE_DEBUG)) {
      -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.4();
    }

    v266 = objc_opt_new();
    v452[0] = _NSConcreteStackBlock;
    v452[1] = 3221225472;
    v452[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_353;
    v452[3] = &unk_1002CD5A8;
    id v196 = v196;
    id v453 = v196;
    id v267 = v266;
    id v454 = v267;
    [v405 enumerateObjectsUsingBlock:v452];
    v268 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
    v441 = v253;
    if (v268)
    {
      BOOL v269 = [(unint64_t)[v267 count:@"timeTag"] > 1];
    }
    else
    {
      v270 = [v402 objectForKeyedSubscript:@"timeTag"];
      if (v270)
      {
        BOOL v269 = (unint64_t)[v267 count] > 1;
      }
      else
      {
        v271 = [v402 objectForKeyedSubscript:@"isWeekend"];
        if (v271) {
          BOOL v269 = (unint64_t)[v267 count] > 1;
        }
        else {
          BOOL v269 = 0;
        }
      }
    }
    double v272 = v418;

    v273 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];
    if (v273)
    {
    }
    else
    {
      v274 = [v402 objectForKeyedSubscript:@"secondLevelActivityType"];

      if (!v274) {
        goto LABEL_289;
      }
    }
    v275 = objc_opt_new();
    v276 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];

    if (v276)
    {
      v277 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];

      if ([v277 isEqualToString:@"outing"])
      {
        if (v269) {
          uint64_t v278 = 901;
        }
        else {
          uint64_t v278 = 905;
        }
        uint64_t v279 = 2;
      }
      else if ([v277 isEqualToString:@"activity"])
      {
        if (v269) {
          uint64_t v278 = 902;
        }
        else {
          uint64_t v278 = 906;
        }
        uint64_t v279 = 4;
      }
      else if ([v277 isEqualToString:@"contact"])
      {
        if (v269) {
          uint64_t v278 = 903;
        }
        else {
          uint64_t v278 = 907;
        }
        uint64_t v279 = 5;
      }
      else
      {
        if (![v277 isEqualToString:@"time_at_home"])
        {
          uint64_t v279 = 0;
          goto LABEL_286;
        }
        if (v269) {
          uint64_t v278 = 904;
        }
        else {
          uint64_t v278 = 909;
        }
        uint64_t v279 = 1;
      }
      [(MOEventBundle *)v400 setBundleSubType:v278];
    }
    else
    {
      uint64_t v279 = 0;
      v277 = v275;
    }
LABEL_286:
    v280 = [v402 objectForKeyedSubscript:@"secondLevelActivityType"];

    if (v280)
    {
      uint64_t v281 = [v402 objectForKeyedSubscript:@"secondLevelActivityType"];

      v277 = (void *)v281;
    }
    double v272 = v418;
    v282 = [[MOAction alloc] initWithActionName:v277 actionType:v279];
    [(MOEventBundle *)v400 setAction:v282];

LABEL_289:
    v283 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
    v438 = v267;
    if (v283
      || ([v402 objectForKeyedSubscript:@"timeTag"],
          (v283 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v315 = [v402 objectForKeyedSubscript:@"isWeekend"];

      if (!v315) {
        goto LABEL_298;
      }
    }
    v284 = [v402 objectForKeyedSubscript:@"timeTag"];
    unsigned int v285 = [v284 intValue];

    if (v285)
    {
      v286 = [v402 objectForKeyedSubscript:@"timeTag"];
      uint64_t v287 = (int)[v286 intValue];
    }
    else
    {
      v308 = [v402 objectForKeyedSubscript:@"dayOfWeek"];

      if (!v308)
      {
        uint64_t v287 = [v402 objectForKeyedSubscript:@"isWeekend"];

        double v272 = v418;
        if (v287)
        {
          v317 = [v402 objectForKeyedSubscript:@"isWeekend"];
          unsigned int v318 = [v317 BOOLValue];

          if (v318) {
            uint64_t v287 = 10001;
          }
          else {
            uint64_t v287 = 10000;
          }
        }
        goto LABEL_295;
      }
      v309 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
      unsigned __int8 v310 = [v309 isEqualToString:@"sunday"];

      if (v310)
      {
        uint64_t v287 = 102;
      }
      else
      {
        v319 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
        unsigned __int8 v320 = [v319 isEqualToString:@"monday"];

        if (v320)
        {
          uint64_t v287 = 103;
        }
        else
        {
          v385 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
          unsigned __int8 v386 = [v385 isEqualToString:@"tuesday"];

          if (v386)
          {
            uint64_t v287 = 104;
          }
          else
          {
            v388 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
            unsigned __int8 v389 = [v388 isEqualToString:@"wednesday"];

            if (v389)
            {
              uint64_t v287 = 105;
            }
            else
            {
              v390 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
              unsigned __int8 v391 = [v390 isEqualToString:@"thursday"];

              if (v391)
              {
                uint64_t v287 = 106;
              }
              else
              {
                v392 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
                unsigned __int8 v393 = [v392 isEqualToString:@"friday"];

                if (v393)
                {
                  uint64_t v287 = 107;
                }
                else
                {
                  v394 = [v402 objectForKeyedSubscript:@"dayOfWeek"];
                  unsigned int v395 = [v394 isEqualToString:@"saturday"];

                  if (v395) {
                    uint64_t v287 = 108;
                  }
                  else {
                    uint64_t v287 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
    double v272 = v418;
LABEL_295:
    v288 = +[MOTime timeStringFromTimeTag:v287];
    if (v288)
    {
      [v402 setObject:v288 forKeyedSubscript:@"timeString"];
      v289 = +[NSCalendar currentCalendar];
      v290 = [MOTime alloc];
      v291 = +[NSDate date];
      [v291 timeIntervalSinceReferenceDate];
      double v293 = v292;
      v294 = [v289 timeZone];
      v295 = [v294 name];
      v296 = [(MOTime *)v290 initWithTimestamp:v288 timeString:v295 timeZone:v287 timeTag:v293];

      [(MOEventBundle *)v400 setTime:v296];
      double v272 = v418;
    }

LABEL_298:
    v297 = [v402 objectForKeyedSubscript:@"placeName"];
    if (v297
      || ([v402 objectForKeyedSubscript:@"combinedPlaceType"],
          (v297 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v316 = [v402 objectForKeyedSubscript:@"enclosingAreaName"];

      if (!v316) {
        goto LABEL_326;
      }
    }
    v298 = [MOPlace alloc];
    v299 = +[NSUUID UUID];
    v300 = [(MOPlace *)v298 initWithIdentifier:v299];

    v301 = [v402 objectForKeyedSubscript:@"placeName"];
    [(MOPlace *)v300 setPlaceName:v301];

    v302 = [v402 objectForKeyedSubscript:@"enclosingAreaName"];
    [(MOPlace *)v300 setEnclosingArea:v302];

    v303 = [v402 objectForKeyedSubscript:@"combinedPlaceType"];

    if (!v303)
    {
LABEL_325:
      [(MOEventBundle *)v400 setPlace:v300];

LABEL_326:
      v450[0] = _NSConcreteStackBlock;
      v450[1] = 3221225472;
      v450[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_2_391;
      v450[3] = &unk_1002CD5D0;
      id v323 = (id)objc_opt_new();
      id v451 = v323;
      [*(id *)&v272 enumerateObjectsUsingBlock:v450];
      if ([v323 count])
      {
        v324 = [v323 allObjects];
        [(MOEventBundle *)v400 setPlaces:v324];
      }
      v434 = v323;
      if ([*(id *)&v414 count])
      {
        v325 = [*(id *)&v414 allObjects];
        [(MOEventBundle *)v400 setPersons:v325];
      }
      v326 = objc_opt_new();
      long long v446 = 0u;
      long long v447 = 0u;
      long long v448 = 0u;
      long long v449 = 0u;
      id v327 = v398;
      id v328 = [v327 countByEnumeratingWithState:&v446 objects:v512 count:16];
      if (v328)
      {
        id v329 = v328;
        uint64_t v330 = *(void *)v447;
        do
        {
          for (mm = 0; mm != v329; mm = (char *)mm + 1)
          {
            if (*(void *)v447 != v330) {
              objc_enumerationMutation(v327);
            }
            uint64_t v332 = *(void *)(*((void *)&v446 + 1) + 8 * (void)mm);
            v333 = [v402 objectForKeyedSubscript:v332];

            if (v333)
            {
              v334 = [MOPhotoTrait alloc];
              v335 = [v402 objectForKeyedSubscript:v332];
              v336 = [(MOPhotoTrait *)v334 initWithIdentifier:0 name:v335 relevantAssetUUIDs:0];

              [v326 addObject:v336];
            }
          }
          id v329 = [v327 countByEnumeratingWithState:&v446 objects:v512 count:16];
        }
        while (v329);
      }

      if ([v326 count]) {
        [(MOEventBundle *)v400 setPhotoTraits:v326];
      }
      id v337 = [v402 count];
      unint64_t phenotypeSpecificityThreshold = self->_phenotypeSpecificityThreshold;
      v339 = [v402 objectForKeyedSubscript:@"topLevelActivityType"];
      if (v339)
      {
        BOOL v340 = 1;
      }
      else
      {
        v341 = [v402 objectForKeyedSubscript:@"secondLevelActivityType"];
        BOOL v340 = v341 != 0;
      }
      v444[0] = _NSConcreteStackBlock;
      v444[1] = 3221225472;
      v444[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_3;
      v444[3] = &unk_1002CD5D0;
      id v342 = (id)objc_opt_new();
      id v445 = v342;
      [*(id *)&v418 enumerateObjectsUsingBlock:v444];
      if ([v342 count])
      {
        v343 = [v342 valueForKeyPath:@"@avg.self"];
        [v343 floatValue];
        float v345 = v344;

        CFStringRef v510 = @"bundleGoodnessScore";
        *(float *)&double v346 = v345;
        v347 = +[NSNumber numberWithFloat:v346];
        v511 = v347;
        v348 = +[NSDictionary dictionaryWithObjects:&v511 forKeys:&v510 count:1];

        [(MOEventBundle *)v400 setRankingDictionary:v348];
        v349 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
        if (os_log_type_enabled(v349, OS_LOG_TYPE_DEBUG)) {
          -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:]((uint64_t)v342, v349, v345);
        }

        BOOL v350 = v345 > self->_avgGoodnessScoreFilteringThreshold;
      }
      else
      {
        BOOL v350 = 0;
      }
      int v351 = v340 && v350;
      if ((unint64_t)v337 < phenotypeSpecificityThreshold) {
        int v351 = 0;
      }
      uint64_t v352 = v351 ^ 1u;
      v353 = [MOClusterMetadata alloc];
      v354 = +[NSUUID UUID];
      v355 = [(MOClusterMetadata *)v353 initWithIdentifier:v354 phenoType:v402];

      [(MOClusterMetadata *)v355 setIsFiltered:v352];
      v442[0] = _NSConcreteStackBlock;
      v442[1] = 3221225472;
      v442[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_397;
      v442[3] = &unk_1002CD5D0;
      id v356 = (id)objc_opt_new();
      id v443 = v356;
      v212 = v399;
      [v399 enumerateObjectsUsingBlock:v442];
      v357 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
      if (os_log_type_enabled(v357, OS_LOG_TYPE_DEBUG)) {
        -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:](v356);
      }

      if ([v356 count]) {
        [(MOClusterMetadata *)v355 setSubSuggestionIDsBeforePruning:v356];
      }
      v358 = [v416 objectForKeyedSubscript:@"topLevelActivityType"];

      if (v358)
      {
        v359 = [v416 objectForKeyedSubscript:@"topLevelActivityType"];
        [(MOClusterMetadata *)v355 setTopLevelActivityHistogram:v359];
      }
      v360 = [v416 objectForKeyedSubscript:@"secondLevelActivityType"];

      if (v360)
      {
        v361 = [v416 objectForKeyedSubscript:@"secondLevelActivityType"];
        [(MOClusterMetadata *)v355 setSecondLevelActivityHistogram:v361];
      }
      v362 = [v416 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];

      if (v362)
      {
        v363 = [v416 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];
        [(MOClusterMetadata *)v355 setActivityTypeFromPhotoTraitsHistogram:v363];
      }
      v364 = [v416 objectForKeyedSubscript:@"timeTag"];

      if (v364)
      {
        v365 = [v416 objectForKeyedSubscript:@"timeTag"];
        [(MOClusterMetadata *)v355 setTimeTagHistogram:v365];
      }
      v366 = [v416 objectForKeyedSubscript:@"dayOfWeek"];

      if (v366)
      {
        v367 = [v416 objectForKeyedSubscript:@"dayOfWeek"];
        [(MOClusterMetadata *)v355 setDayOfWeekHistogram:v367];
      }
      v368 = [v416 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];

      if (v368)
      {
        v369 = [v416 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
        [(MOClusterMetadata *)v355 setTimeContextFromPhotoTraitsHistogram:v369];
      }
      v370 = [v416 objectForKeyedSubscript:@"placeName"];

      if (v370)
      {
        v371 = [v416 objectForKeyedSubscript:@"placeName"];
        [(MOClusterMetadata *)v355 setPlaceNameHistogram:v371];
      }
      v372 = [v416 objectForKeyedSubscript:@"combinedPlaceType"];

      if (v372)
      {
        v373 = [v416 objectForKeyedSubscript:@"combinedPlaceType"];
        [(MOClusterMetadata *)v355 setCombinedPlaceTypeHistogram:v373];
      }
      v374 = [v416 objectForKeyedSubscript:@"enclosingAreaName"];

      if (v374)
      {
        v375 = [v416 objectForKeyedSubscript:@"enclosingAreaName"];
        [(MOClusterMetadata *)v355 setEnclosingPlaceNameHistogram:v375];
      }
      v376 = [v416 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];

      if (v376)
      {
        v377 = [v416 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
        [(MOClusterMetadata *)v355 setPlaceTypeFromPhotoTraitsHistogram:v377];
      }
      v378 = [v416 objectForKeyedSubscript:@"persons"];

      if (v378)
      {
        v379 = [v416 objectForKeyedSubscript:@"persons"];
        [(MOClusterMetadata *)v355 setContactNamesHistogram:v379];
      }
      v380 = [v416 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];

      if (v380)
      {
        v381 = [v416 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
        [(MOClusterMetadata *)v355 setSocialEventFromPhotoTraitsHistogram:v381];
      }
      v382 = [v416 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];

      if (v382)
      {
        v383 = [v416 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];
        [(MOClusterMetadata *)v355 setOtherSubjectFromPhotoTraitsHistogram:v383];
      }
      [(MOClusterMetadata *)v355 setPersonRelationshipHistogram:v441];
      double v215 = v419;
      if ([v342 count]) {
        [(MOClusterMetadata *)v355 setSubBundleGoodnessScores:v342];
      }
      if ([v438 count]) {
        [(MOClusterMetadata *)v355 setWeekOfYearHistogram:v438];
      }
      [(MOEventBundle *)v400 setClusterMetadata:v355];
      v219 = v400;

      v218 = v396;
      v220 = v397;
      double v216 = v429;
      v208 = v413;
      goto LABEL_386;
    }
    v304 = [v402 objectForKeyedSubscript:@"combinedPlaceType"];
    unsigned int v305 = [v304 isEqualToString:@"Home"];

    if (v305)
    {
      v306 = v300;
      uint64_t v307 = 1;
    }
    else
    {
      v311 = [v402 objectForKeyedSubscript:@"combinedPlaceType"];
      unsigned int v312 = [v311 isEqualToString:@"Work"];

      if (v312)
      {
        v306 = v300;
        uint64_t v307 = 2;
      }
      else
      {
        v313 = [v402 objectForKeyedSubscript:@"combinedPlaceType"];
        unsigned int v314 = [v313 isEqualToString:@"School"];

        if (v314)
        {
          v306 = v300;
          uint64_t v307 = 3;
        }
        else
        {
          v321 = [v402 objectForKeyedSubscript:@"combinedPlaceType"];
          unsigned int v322 = [v321 isEqualToString:@"Gym"];

          v306 = v300;
          if (!v322)
          {
            [(MOPlace *)v300 setPlaceUserType:0];
            v387 = [v402 objectForKeyedSubscript:@"combinedPlaceType"];
            [(MOPlace *)v300 setPoiCategory:v387];

            goto LABEL_324;
          }
          uint64_t v307 = 4;
        }
      }
    }
    [(MOPlace *)v306 setPlaceUserType:v307];
LABEL_324:
    double v272 = v418;
    goto LABEL_325;
  }
  double v418 = v213;
  v217 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v218 = v396;
  v412 = v217;
  if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:](v217);
  }
  v219 = 0;
  v220 = v397;
LABEL_386:
  v222 = v410;
LABEL_387:

  return v219;
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 summaryDictionary];
  [v2 addObject:v3];
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_313(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [v3 _convertContextvalueToString:v6 forKey:*(void *)(a1 + 40)];

  id v8 = [v5 objectForKeyedSubscript:@"bundleID"];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    id v11 = [v10 count];

    if (v11)
    {
      float v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
      id v13 = [v12 mutableCopy];

      [v13 addObject:v8];
      [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v7];
    }
    else
    {
      uint64_t v15 = v8;
      double v14 = +[NSArray arrayWithObjects:&v15 count:1];
      [*(id *)(a1 + 48) setObject:v14 forKeyedSubscript:v7];
    }
  }
}

int64_t __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_2(id a1, NSArray *a2, NSArray *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = [(NSArray *)v4 count];
  if (v6 >= (id)[(NSArray *)v5 count])
  {
    id v8 = [(NSArray *)v4 count];
    if (v8 <= (id)[(NSArray *)v5 count]) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

int64_t __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_324(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  int v6 = [(NSNumber *)v4 intValue];
  if (v6 >= [(NSNumber *)v5 intValue])
  {
    int v8 = [(NSNumber *)v4 intValue];
    if (v8 <= [(NSNumber *)v5 intValue]) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

int64_t __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_334(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  int v6 = [(NSNumber *)v4 intValue];
  if (v6 >= [(NSNumber *)v5 intValue])
  {
    int v8 = [(NSNumber *)v4 intValue];
    if (v8 <= [(NSNumber *)v5 intValue]) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_352(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 bundleIdentifier];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v11 bundleIdentifier];
    int v6 = [v5 UUIDString];
    [v4 addObject:v6];
  }
  int64_t v7 = [v11 suggestionID];

  if (v7)
  {
    int v8 = *(void **)(a1 + 40);
    BOOL v9 = [v11 suggestionID];
    id v10 = [v9 UUIDString];
    [v8 addObject:v10];
  }
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_353(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 objectForKeyedSubscript:@"weekOfYear"];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [v14 objectForKeyedSubscript:@"suggestionID"];
    if (v5)
    {
      int v6 = (void *)v5;
      int64_t v7 = *(void **)(a1 + 32);
      int v8 = [v14 objectForKeyedSubscript:@"suggestionID"];
      LODWORD(v7) = [v7 containsObject:v8];

      if (!v7) {
        goto LABEL_6;
      }
      BOOL v9 = [v14 objectForKeyedSubscript:@"weekOfYear"];
      uint64_t v4 = [v9 stringValue];

      id v10 = *(void **)(a1 + 40);
      id v11 = [v14 objectForKeyedSubscript:@"weekOfYear"];
      float v12 = [v10 objectForKeyedSubscript:v11];
      id v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 intValue] + 1);
      [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v4];
    }
  }
LABEL_6:
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_2_391(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 place];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v10 place];
    [v4 addObject:v5];
  }
  int v6 = [v10 places];
  id v7 = [v6 count];

  if (v7)
  {
    int v8 = *(void **)(a1 + 32);
    BOOL v9 = [v10 places];
    [v8 addObjectsFromArray:v9];
  }
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 rankingDictionary];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"bundleGoodnessScore"];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = [v8 rankingDictionary];
    id v7 = [v6 objectForKeyedSubscript:@"bundleGoodnessScore"];
    [v5 addObject:v7];
  }
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_397(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 suggestionID];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v7 suggestionID];
    int v6 = [v5 UUIDString];
    [v4 addObject:v6];
  }
}

- (id)getClusteringParams
{
  return self->_clusteringParams;
}

- (id)_convertContextvalueToString:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  int v6 = (__CFString *)a4;
  if (!v5) {
    goto LABEL_3;
  }
  id v7 = +[NSNull null];
  unsigned int v8 = [v5 isEqual:v7];

  if (v8) {
    goto LABEL_3;
  }
  if (@"timeTag" != v6)
  {
    if (![(__CFString *)v6 isEqualToString:@"secondLevelActivityType"]) {
      [(__CFString *)v6 isEqualToString:@"combinedPlaceType"];
    }
    BOOL v9 = [v5 stringValue];
    goto LABEL_8;
  }
  id v10 = +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", (int)[v5 intValue]);
  if (!v10)
  {
LABEL_3:
    BOOL v9 = @"unavailable";
LABEL_8:
    id v10 = v9;
  }

  return v10;
}

- (void)submitClusterBundleInternalAnalytics:(id)a3 withOnboardingStatus:(id)a4 andSubmissionDate:(id)a5
{
  id v7 = a3;
  id v164 = a4;
  id v165 = a5;
  unsigned int v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v176 = (const __CFString *)[v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%lu cluster bundles are ready for CoreAnalytics donation", buf, 0xCu);
  }

  v154 = +[NSCalendar currentCalendar];
  BOOL v9 = [v154 components:764 fromDate:v165];
  id v162 = [v9 year];
  id v161 = [v9 month];
  id v160 = [v9 day];
  id v159 = [v9 hour];
  v153 = v9;
  id v158 = [v9 minute];
  v163 = +[MOMetric binsFromStart:&off_1002F56F0 toEnd:&off_1002F97C0 gap:&off_1002F97D0];
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id obj = v7;
  id v166 = [obj countByEnumeratingWithState:&v171 objects:v179 count:16];
  if (v166)
  {
    uint64_t v157 = *(void *)v172;
    do
    {
      for (id i = 0; i != v166; id i = v149 + 1)
      {
        if (*(void *)v172 != v157) {
          objc_enumerationMutation(obj);
        }
        BOOL v168 = (char *)i;
        id v11 = *(void **)(*((void *)&v171 + 1) + 8 * i);
        float v12 = +[MOEngagementAndSuggestionAnalyticsManager getDefaultAnalyticsResultWithOnboardingStatus:v164];
        id v13 = +[NSNumber numberWithInteger:v162];
        [v12 setObject:v13 forKeyedSubscript:@"submissionTimeYear"];

        id v14 = +[NSNumber numberWithInteger:v161];
        [v12 setObject:v14 forKeyedSubscript:@"submissionTimeMonth"];

        uint64_t v15 = +[NSNumber numberWithInteger:v160];
        [v12 setObject:v15 forKeyedSubscript:@"submissionTimeDay"];

        id v16 = +[NSNumber numberWithInteger:v159];
        [v12 setObject:v16 forKeyedSubscript:@"submissionTimeHour"];

        BOOL v17 = +[NSNumber numberWithInteger:v158];
        [v12 setObject:v17 forKeyedSubscript:@"submissionTimeMinute"];

        uint64_t v18 = [v11 bundleIdentifier];
        uint64_t v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 hash]);
        [v12 setObject:v19 forKeyedSubscript:@"bundleId"];

        v20 = [v11 suggestionID];
        id v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 hash]);
        [v12 setObject:v21 forKeyedSubscript:@"suggestionId"];

        double v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 bundleSubType]);
        [v12 setObject:v22 forKeyedSubscript:@"bundleSubType"];

        double v23 = [v11 subSuggestionIDs];
        double v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 count]);
        [v12 setObject:v24 forKeyedSubscript:@"subBundleCount"];

        uint64_t v25 = [v11 startDate];
        [v165 timeIntervalSinceDate:v25];
        int v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        unsigned int v27 = +[MOMetric binForNumber:v26 bins:v163];
        [v12 setObject:v27 forKeyedSubscript:@"startTimeBucketed"];

        double v28 = [v11 endDate];
        [v165 timeIntervalSinceDate:v28];
        id v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v30 = +[MOMetric binForNumber:v29 bins:v163];
        [v12 setObject:v30 forKeyedSubscript:@"endTimeBucketed"];

        id v31 = [v11 clusterMetadata];

        if (v31)
        {
          uint64_t v32 = [v11 clusterMetadata];
          id v33 = [v32 subSuggestionIDsBeforePruning];
          id v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 count]);
          [v12 setObject:v34 forKeyedSubscript:@"subBundleCountBeforePruning"];

          double v35 = [v11 clusterMetadata];
          id v36 = [v35 phenotype];

          id v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v36 count]);
          [v12 setObject:v37 forKeyedSubscript:@"phenotypeFieldCount"];

          id v38 = [v36 objectForKeyedSubscript:@"topLevelActivityType"];

          if (v38)
          {
            id v39 = [v36 objectForKeyedSubscript:@"topLevelActivityType"];
            id v40 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOEventBundle getSuperTypeEnum:v39]);
            [v12 setObject:v40 forKeyedSubscript:@"topLevelActivityPhenotype"];
          }
          id v41 = [v36 objectForKeyedSubscript:@"secondLevelActivityType"];
          if (v41) {
            uint64_t v42 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v42 = &__kCFBooleanFalse;
          }
          [v12 setObject:v42 forKeyedSubscript:@"secondLevelActivityPhenotypeExists"];

          id v43 = [v36 objectForKeyedSubscript:@"isWeekend"];
          v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v43 BOOLValue]);
          [v12 setObject:v44 forKeyedSubscript:@"isWeekend"];

          unsigned int v45 = [v36 objectForKeyedSubscript:@"dayOfWeek"];
          if (v45) {
            id v46 = &__kCFBooleanTrue;
          }
          else {
            id v46 = &__kCFBooleanFalse;
          }
          [v12 setObject:v46 forKeyedSubscript:@"dayOfWeekPhenotypeExists"];

          double v47 = [v36 objectForKeyedSubscript:@"timeTag"];
          if (v47) {
            v48 = &__kCFBooleanTrue;
          }
          else {
            v48 = &__kCFBooleanFalse;
          }
          [v12 setObject:v48 forKeyedSubscript:@"timeTagPhenotypeExists"];

          double v49 = [v36 objectForKeyedSubscript:@"combinedPlaceType"];

          if (v49)
          {
            id v50 = [v36 objectForKeyedSubscript:@"combinedPlaceType"];
            [v12 setObject:v50 forKeyedSubscript:@"combinedPlaceType"];
          }
          uint64_t v51 = [v36 objectForKeyedSubscript:@"placeName"];
          if (v51) {
            id v52 = &__kCFBooleanTrue;
          }
          else {
            id v52 = &__kCFBooleanFalse;
          }
          [v12 setObject:v52 forKeyedSubscript:@"placeNamePhenotypeExists"];

          id v53 = [v36 objectForKeyedSubscript:@"enclosingAreaName"];
          if (v53) {
            v54 = &__kCFBooleanTrue;
          }
          else {
            v54 = &__kCFBooleanFalse;
          }
          [v12 setObject:v54 forKeyedSubscript:@"enclosingAreaPhenotypeExists"];

          double v55 = [v11 persons];
          id v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 count]);
          [v12 setObject:v56 forKeyedSubscript:@"personPhenotypeCount"];

          double v57 = [v36 objectForKeyedSubscript:@"withFamily"];

          if (v57) {
            [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"withFamily"];
          }
          v58 = [v36 objectForKeyedSubscript:@"withCoworker"];

          if (v58) {
            [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"withCoworker"];
          }
          id v59 = [v36 objectForKeyedSubscript:@"withFriend"];

          if (v59) {
            [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"withFriend"];
          }
          id v60 = [v36 objectForKeyedSubscript:@"withChild"];

          if (v60) {
            [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"withChild"];
          }
          id v61 = [v36 objectForKeyedSubscript:@"withMyPet"];

          if (v61) {
            [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"withMyPet"];
          }
          id v62 = [v36 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];

          if (v62)
          {
            uint64_t v63 = [v36 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];
            [v12 setObject:v63 forKeyedSubscript:@"activityTypeFromPhotoTraits"];
          }
          long long v64 = [v36 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];

          if (v64)
          {
            v65 = [v36 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
            [v12 setObject:v65 forKeyedSubscript:@"timeContextFromPhotoTraits"];
          }
          id v66 = [v36 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];

          if (v66)
          {
            double v67 = [v36 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
            [v12 setObject:v67 forKeyedSubscript:@"placeTypeFromPhotoTraits"];
          }
          id v68 = [v36 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];

          if (v68)
          {
            __int16 v69 = [v36 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
            [v12 setObject:v69 forKeyedSubscript:@"socialEventFromPhotoTraits"];
          }
          id v70 = [v36 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];

          if (v70)
          {
            __int16 v71 = [v36 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];
            [v12 setObject:v71 forKeyedSubscript:@"otherSubjectFromPhotoTraits"];
          }
          float v72 = [v11 clusterMetadata];
          __int16 v73 = [v72 topLevelActivityHistogram];
          [v73 count];

          double v74 = [v11 clusterMetadata];
          __int16 v75 = [v74 topLevelActivityHistogram];
          float v76 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v75];
          [v12 setObject:v76 forKeyedSubscript:@"uniqueTopLevelActivityCount"];

          double v77 = [v11 clusterMetadata];
          id v78 = [v77 secondLevelActivityHistogram];
          [v78 count];

          CFStringRef v79 = [v11 clusterMetadata];
          NSErrorUserInfoKey v80 = [v79 secondLevelActivityHistogram];
          CFStringRef v81 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v80];
          [v12 setObject:v81 forKeyedSubscript:@"uniqueSecondLevelActivityCount"];

          v82 = [v11 clusterMetadata];
          double v83 = [v82 activityTypeFromPhotoTraitsHistogram];
          [v83 count];

          id v84 = [v11 clusterMetadata];
          id v85 = [v84 activityTypeFromPhotoTraitsHistogram];
          id v86 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v85];
          [v12 setObject:v86 forKeyedSubscript:@"activityTypeFromPhotoTraitsCount"];

          uint64_t v87 = [v11 clusterMetadata];
          v88 = [v87 timeTagHistogram];
          [v88 count];

          uint64_t v89 = [v11 clusterMetadata];
          v90 = [v89 timeTagHistogram];
          id v91 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v90];
          [v12 setObject:v91 forKeyedSubscript:@"timeTagCount"];

          v92 = [v11 clusterMetadata];
          v93 = [v92 dayOfWeekHistogram];
          [v93 count];

          v94 = [v11 clusterMetadata];
          v95 = [v94 dayOfWeekHistogram];
          uint64_t v96 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v95];
          [v12 setObject:v96 forKeyedSubscript:@"dayOfWeekCount"];

          v97 = [v11 clusterMetadata];
          v98 = [v97 weekOfYearHistogram];
          [v98 count];

          v99 = [v11 clusterMetadata];
          double v100 = [v99 weekOfYearHistogram];
          double v101 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v100];
          [v12 setObject:v101 forKeyedSubscript:@"weekOfYearCount"];

          v102 = [v11 clusterMetadata];
          CFStringRef v103 = [v102 timeContextFromPhotoTraitsHistogram];
          [v103 count];

          id v104 = [v11 clusterMetadata];
          id v105 = [v104 timeContextFromPhotoTraitsHistogram];
          id v106 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v105];
          [v12 setObject:v106 forKeyedSubscript:@"timeContextFromPhotoTraitsCount"];

          uint64_t v107 = [v11 clusterMetadata];
          v108 = [v107 placeNameHistogram];
          [v108 count];

          uint64_t v109 = [v11 clusterMetadata];
          v110 = [v109 placeNameHistogram];
          id v111 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v110];
          [v12 setObject:v111 forKeyedSubscript:@"placeNameCount"];

          unint64_t v112 = [v11 clusterMetadata];
          v113 = [v112 combinedPlaceTypeHistogram];
          [v113 count];

          v114 = [v11 clusterMetadata];
          v115 = [v114 combinedPlaceTypeHistogram];
          v116 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v115];
          [v12 setObject:v116 forKeyedSubscript:@"combinedPlaceTypeCount"];

          uint64_t v117 = [v11 clusterMetadata];
          v118 = [v117 enclosingPlaceNameHistogram];
          [v118 count];

          v119 = [v11 clusterMetadata];
          double v120 = [v119 enclosingPlaceNameHistogram];
          double v121 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v120];
          [v12 setObject:v121 forKeyedSubscript:@"enclosingPlaceNameCount"];

          double v122 = [v11 clusterMetadata];
          v123 = [v122 placeTypeFromPhotoTraitsHistogram];
          [v123 count];

          double v124 = [v11 clusterMetadata];
          CFStringRef v125 = [v124 placeTypeFromPhotoTraitsHistogram];
          double v126 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v125];
          [v12 setObject:v126 forKeyedSubscript:@"placeTypeFromPhotoTraitsCount"];

          unint64_t v127 = [v11 clusterMetadata];
          uint64_t v128 = [v127 contactNamesHistogram];
          [v128 count];

          v129 = [v11 clusterMetadata];
          v130 = [v129 contactNamesHistogram];
          double v131 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v130];
          [v12 setObject:v131 forKeyedSubscript:@"contactNamesCount"];

          double v132 = [v11 clusterMetadata];
          double v133 = [v132 personRelationshipHistogram];
          [v133 count];

          v134 = [v11 clusterMetadata];
          v135 = [v134 personRelationshipHistogram];
          v136 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v135];
          [v12 setObject:v136 forKeyedSubscript:@"personRelationshipCount"];

          v137 = [v11 clusterMetadata];
          uint64_t v138 = [v137 socialEventFromPhotoTraitsHistogram];
          [v138 count];

          v139 = [v11 clusterMetadata];
          v140 = [v139 socialEventFromPhotoTraitsHistogram];
          double v141 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v140];
          [v12 setObject:v141 forKeyedSubscript:@"socialEventFromPhotoTraitsCount"];

          double v142 = [v11 clusterMetadata];
          double v143 = [v142 otherSubjectFromPhotoTraitsHistogram];
          [v143 count];

          v144 = [v11 clusterMetadata];
          v145 = [v144 otherSubjectFromPhotoTraitsHistogram];
          v146 = [(MOBundleClusteringManager *)self _countValidKeysInHistogram:v145];
          [v12 setObject:v146 forKeyedSubscript:@"otherSubjectFromPhotoTraitsCount"];
        }
        if ([v12 count])
        {
          double v147 = v12;
          AnalyticsSendEventLazy();
          id v148 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          id v150 = v167;
          id v149 = v168;
          if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412547;
            CFStringRef v176 = @"com.apple.Moments.MOClusterBundle";
            __int16 v177 = 2113;
            double v178 = v147;
            _os_log_debug_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEBUG, "Submitted coreAnalytics payload to %@: %{private}@", buf, 0x16u);
          }

          uint64_t v151 = v147;
        }
        else
        {
          uint64_t v151 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          id v150 = v167;
          id v149 = v168;
          if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR)) {
            -[MOBundleClusteringManager submitClusterBundleInternalAnalytics:withOnboardingStatus:andSubmissionDate:](&v169, v170, v151);
          }
        }
      }
      id v166 = [obj countByEnumeratingWithState:&v171 objects:v179 count:16];
    }
    while (v166);
  }

  v152 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_INFO, "Completed cluster Bundle CoreAnalytics submission.", buf, 2u);
  }
}

id __105__MOBundleClusteringManager_submitClusterBundleInternalAnalytics_withOnboardingStatus_andSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitAnomalyBundleInternalAnalytics:(id)a3 withOnboardingStatus:(id)a4 andSubmissionDate:(id)a5
{
  id v7 = a3;
  id v55 = a4;
  id v56 = a5;
  unsigned int v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v66 = (const __CFString *)[v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%lu anomaly bundles are ready for CoreAnalytics donation", buf, 0xCu);
  }

  id v46 = +[NSCalendar currentCalendar];
  BOOL v9 = [v46 components:764 fromDate:v56];
  id v53 = [v9 year];
  id v52 = [v9 month];
  id v51 = [v9 day];
  id v50 = [v9 hour];
  id v49 = [v9 minute];
  v54 = +[MOMetric binsFromStart:&off_1002F56F0 toEnd:&off_1002F97C0 gap:&off_1002F97D0];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v7;
  id v57 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v57)
  {
    uint64_t v48 = *(void *)v62;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v62 != v48) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v10);
        float v12 = +[MOEngagementAndSuggestionAnalyticsManager getDefaultAnalyticsResultWithOnboardingStatus:v55];
        id v13 = +[NSNumber numberWithInteger:v53];
        [v12 setObject:v13 forKeyedSubscript:@"submissionTimeYear"];

        id v14 = +[NSNumber numberWithInteger:v52];
        [v12 setObject:v14 forKeyedSubscript:@"submissionTimeMonth"];

        uint64_t v15 = +[NSNumber numberWithInteger:v51];
        [v12 setObject:v15 forKeyedSubscript:@"submissionTimeDay"];

        id v16 = +[NSNumber numberWithInteger:v50];
        [v12 setObject:v16 forKeyedSubscript:@"submissionTimeHour"];

        BOOL v17 = +[NSNumber numberWithInteger:v49];
        [v12 setObject:v17 forKeyedSubscript:@"submissionTimeMinute"];

        LODWORD(v18) = 1176256512;
        uint64_t v19 = +[NSNumber numberWithFloat:v18];
        [v12 setObject:v19 forKeyedSubscript:@"scalingFactorForFloatValue"];

        v20 = [v11 bundleIdentifier];
        id v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 hash]);
        [v12 setObject:v21 forKeyedSubscript:@"bundleId"];

        double v22 = [v11 suggestionID];
        double v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 hash]);
        [v12 setObject:v23 forKeyedSubscript:@"suggestionId"];

        double v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 bundleSubType]);
        [v12 setObject:v24 forKeyedSubscript:@"bundleSubType"];

        uint64_t v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 bundleSuperType]);
        [v12 setObject:v25 forKeyedSubscript:@"bundleSuperType"];

        int v26 = [v11 startDate];
        [v56 timeIntervalSinceDate:v26];
        unsigned int v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        double v28 = +[MOMetric binForNumber:v27 bins:v54];
        [v12 setObject:v28 forKeyedSubscript:@"startTimeBucketed"];

        id v29 = [v11 endDate];
        [v56 timeIntervalSinceDate:v29];
        id v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v31 = +[MOMetric binForNumber:v30 bins:v54];
        [v12 setObject:v31 forKeyedSubscript:@"endTimeBucketed"];

        uint64_t v32 = [v11 outlierMetadata];

        if (v32)
        {
          id v33 = [v11 outlierMetadata];
          id v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v33 isSignificant]);
          [v12 setObject:v34 forKeyedSubscript:@"anomalyIsSignificant"];

          double v35 = [v11 outlierMetadata];
          [v35 outlierScore];
          id v37 = +[NSNumber numberWithDouble:v36 * 10000.0];
          [v12 setObject:v37 forKeyedSubscript:@"outlierScore"];

          id v38 = [v11 outlierMetadata];
          [v38 bundleGoodnessScore];
          id v40 = +[NSNumber numberWithDouble:v39 * 10000.0];
          [v12 setObject:v40 forKeyedSubscript:@"bundleGoodnessScore"];
        }
        if ([v12 count])
        {
          id v41 = v12;
          AnalyticsSendEventLazy();
          uint64_t v42 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          id v43 = v58;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412547;
            CFStringRef v66 = @"com.apple.Moments.MOAnomalyBundle";
            __int16 v67 = 2113;
            id v68 = v41;
            _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Submitted coreAnalytics payload to %@: %{private}@", buf, 0x16u);
          }

          v44 = v41;
        }
        else
        {
          v44 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          id v43 = v58;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[MOBundleClusteringManager submitAnomalyBundleInternalAnalytics:withOnboardingStatus:andSubmissionDate:](&v59, v60, v44);
          }
        }

        unsigned int v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Completed Anomaly Bundle CoreAnalytics submission.", buf, 2u);
        }

        id v10 = (char *)v10 + 1;
      }
      while (v57 != v10);
      id v57 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v57);
  }
}

id __105__MOBundleClusteringManager_submitAnomalyBundleInternalAnalytics_withOnboardingStatus_andSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_countValidKeysInHistogram:(id)a3
{
  uint64_t v3 = [a3 allKeys];
  id v4 = [v3 mutableCopy];

  [v4 removeObject:@"unknown"];
  [v4 removeObject:@"unavailable"];
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (MOClusteringParams)clusteringParams
{
  return self->_clusteringParams;
}

- (void)setClusteringParams:(id)a3
{
}

- (MOHDBSCANClustering)hdbscanClustering
{
  return self->_hdbscanClustering;
}

- (void)setHdbscanClustering:(id)a3
{
}

- (double)clusterPhenotypeMinimumRatioThreshold
{
  return self->_clusterPhenotypeMinimumRatioThreshold;
}

- (double)clusterPhenotypeArbirationThreshold
{
  return self->_clusterPhenotypeArbirationThreshold;
}

- (unint64_t)clusterPhenotypeMinimumCountThreshold
{
  return self->_clusterPhenotypeMinimumCountThreshold;
}

- (float)avgGoodnessScoreFilteringThreshold
{
  return self->_avgGoodnessScoreFilteringThreshold;
}

- (unint64_t)phenotypeSpecificityThreshold
{
  return self->_phenotypeSpecificityThreshold;
}

- (float)goodnessScoreAnomalySignificanceThreshold
{
  return self->_goodnessScoreAnomalySignificanceThreshold;
}

- (float)outlierScoreAnomalySignificanceThreshold
{
  return self->_outlierScoreAnomalySignificanceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hdbscanClustering, 0);
  objc_storeStrong((id *)&self->_clusteringParams, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Embedding for bundle %@ is nil. Skip and proceed to the next bundle", v4, 0xCu);
}

void __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_2(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "Extracted embedding:%@", v4, v5, v6, v7, v8);
}

- (void)runHDBSCANClusteringOn:(NSObject *)a3 .cold.1(void *a1, id *a2, NSObject *a3)
{
  [a1 count];
  [*a2 minClusterSize];
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Embedding count (%lu) is equal to or less than min cluster size (%lu). Skip clustering", v5, 0x16u);
}

void __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3_cold_1(void *a1)
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "Annotated anomaly bundle: id %@, outlierMetadata %@", v4, v5, v6, v7, v8);
}

- (void)_getClusterBundleFrom:(os_log_t)log withEmbeddings:andCreationDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Not enough subBundles after prunning. Skip cluster bundle generation.", v1, 2u);
}

- (void)_getClusterBundleFrom:(void *)a1 withEmbeddings:andCreationDate:.cold.2(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "SubSuggestionIDs before pruning %@", v4, v5, v6, v7, v8);
}

- (void)_getClusterBundleFrom:(uint64_t)a1 withEmbeddings:(NSObject *)a2 andCreationDate:(float)a3 .cold.3(uint64_t a1, NSObject *a2, float a3)
{
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Avg bundle goodness score %.3f, all goodness scores %@", (uint8_t *)&v3, 0x16u);
}

- (void)_getClusterBundleFrom:withEmbeddings:andCreationDate:.cold.4()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "PersonalRelationship histogram: %@", v1, 0xCu);
}

- (void)_getClusterBundleFrom:(void *)a1 withEmbeddings:(void *)a2 andCreationDate:.cold.5(void *a1, void *a2)
{
  [a1 count];
  [a2 count];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "Original subBundle count:%lu, count after pruning:%lu", v5, v6, v7, v8, v9);
}

- (void)_getClusterBundleFrom:withEmbeddings:andCreationDate:.cold.7()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Pruning bundles with different values from phenotype: %@", v1, 0xCu);
}

- (void)_getClusterBundleFrom:(uint64_t)a1 withEmbeddings:(uint64_t)a2 andCreationDate:.cold.8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [OUTLINED_FUNCTION_2_1(a1, a2) mask];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "Could not find person object for %@. Ignoring from propagating to bundle.persons");
}

- (void)_getClusterBundleFrom:(uint64_t)a1 withEmbeddings:(uint64_t)a2 andCreationDate:.cold.9(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [OUTLINED_FUNCTION_2_1(a1, a2) mask];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "ContactName %@ was picked as phenotype");
}

- (void)submitClusterBundleInternalAnalytics:(uint8_t *)buf withOnboardingStatus:(unsigned char *)a2 andSubmissionDate:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cluster bundle CA payload is empty. Skip submission", buf, 2u);
}

- (void)submitAnomalyBundleInternalAnalytics:(uint8_t *)buf withOnboardingStatus:(unsigned char *)a2 andSubmissionDate:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Anomaly bundle CA payload is empty. Skip submission", buf, 2u);
}

@end