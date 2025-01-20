@interface MOEventPatternDetector
- (BOOL)configure:(id)a3;
- (MOEventPatternDetector)init;
- (MOEventPatternDetector)initWithPredicate:(id)a3 andFeatureExtractor:(id)a4 andFeatureTransformer:(id)a5 andAnomalyDetector:(id)a6 andRoutineDetector:(id)a7 andTrendDetector:(id)a8;
- (NSString)patternDetectorName;
- (id)getAnomalyDetector;
- (id)getRoutineDetector;
- (id)getTrendDetector;
- (id)processEvents:(id)a3;
- (void)setAnomalyDetector:(id)a3;
- (void)setFeatureExtractor:(id)a3;
- (void)setFeatureTransformer:(id)a3;
- (void)setPatternDetectorName:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setRoutineDetector:(id)a3;
- (void)setTrendDetector:(id)a3;
@end

@implementation MOEventPatternDetector

- (MOEventPatternDetector)init
{
  v12.receiver = self;
  v12.super_class = (Class)MOEventPatternDetector;
  v2 = [(MOEventPatternDetector *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    configuration = v2->_configuration;
    v2->_configuration = (NSDictionary *)v3;

    predicate = v2->_predicate;
    v2->_predicate = 0;

    featureExtractor = v2->_featureExtractor;
    v2->_featureExtractor = 0;

    featureTransformer = v2->_featureTransformer;
    v2->_featureTransformer = 0;

    anomalyDetector = v2->_anomalyDetector;
    v2->_anomalyDetector = 0;

    routineDetector = v2->_routineDetector;
    v2->_routineDetector = 0;

    trendDetector = v2->_trendDetector;
    v2->_trendDetector = 0;
  }
  return v2;
}

- (MOEventPatternDetector)initWithPredicate:(id)a3 andFeatureExtractor:(id)a4 andFeatureTransformer:(id)a5 andAnomalyDetector:(id)a6 andRoutineDetector:(id)a7 andTrendDetector:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MOEventPatternDetector;
  v20 = [(MOEventPatternDetector *)&v24 init];
  if (v20)
  {
    uint64_t v21 = objc_opt_new();
    configuration = v20->_configuration;
    v20->_configuration = (NSDictionary *)v21;

    [(MOEventPatternDetector *)v20 setPredicate:v14];
    [(MOEventPatternDetector *)v20 setFeatureExtractor:v15];
    [(MOEventPatternDetector *)v20 setFeatureTransformer:v16];
    [(MOEventPatternDetector *)v20 setAnomalyDetector:v17];
    [(MOEventPatternDetector *)v20 setRoutineDetector:v18];
    [(MOEventPatternDetector *)v20 setTrendDetector:v19];
  }

  return v20;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
  id v5 = a3;
  [(MOEventPatternDetectorPredicate *)self->_predicate configure:self->_configuration];
}

- (void)setFeatureExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_featureExtractor, a3);
  id v5 = a3;
  [(MOEventPatternDetectorFeatureExtractor *)self->_featureExtractor configure:self->_configuration];
}

- (void)setFeatureTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_featureTransformer, a3);
  id v5 = a3;
  [(MOEventPatternDetectorFeatureTransformer *)self->_featureTransformer configure:self->_configuration];
}

- (void)setAnomalyDetector:(id)a3
{
  objc_storeStrong((id *)&self->_anomalyDetector, a3);
  id v5 = a3;
  [(MOEventPatternDetectorAnomalyDetector *)self->_anomalyDetector configure:self->_configuration];
}

- (void)setRoutineDetector:(id)a3
{
  objc_storeStrong((id *)&self->_routineDetector, a3);
  id v5 = a3;
  [(MOEventPatternDetectorRoutineDetector *)self->_routineDetector configure:self->_configuration];
}

- (void)setTrendDetector:(id)a3
{
  objc_storeStrong((id *)&self->_trendDetector, a3);
  id v5 = a3;
  [(MOEventPatternDetectorTrendDetector *)self->_trendDetector configure:self->_configuration];
}

- (BOOL)configure:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  configuration = self->_configuration;
  self->_configuration = v4;

  unsigned __int8 v6 = [(MOEventPatternDetectorPredicate *)self->_predicate configure:self->_configuration];
  char v7 = v6 & [(MOEventPatternDetectorFeatureExtractor *)self->_featureExtractor configure:self->_configuration];
  unsigned __int8 v8 = [(MOEventPatternDetectorFeatureTransformer *)self->_featureTransformer configure:self->_configuration];
  char v9 = v7 & v8 & [(MOEventPatternDetectorAnomalyDetector *)self->_anomalyDetector configure:self->_configuration];
  unsigned __int8 v10 = [(MOEventPatternDetectorRoutineDetector *)self->_routineDetector configure:self->_configuration];
  return v9 & v10 & [(MOEventPatternDetectorTrendDetector *)self->_trendDetector configure:self->_configuration];
}

- (id)processEvents:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    patternDetectorName = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = patternDetectorName;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Analyzing events for anomalies for %@...", buf, 0xCu);
  }

  if (!self->_predicate)
  {
    unsigned __int8 v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetector processEvents:].cold.9();
    }

    char v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MOEventPatternDetector.m", 136, @"No predicate was strategy defined %@ (in %s:%d)", self->_patternDetectorName, "-[MOEventPatternDetector processEvents:]", 136 object file lineNumber description];
  }
  if (!self->_featureExtractor)
  {
    unsigned __int8 v10 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetector processEvents:].cold.8();
    }

    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MOEventPatternDetector.m", 137, @"No feature extractor strategy was defined for %@ (in %s:%d)", self->_patternDetectorName, "-[MOEventPatternDetector processEvents:]", 137 object file lineNumber description];
  }
  if (!self->_anomalyDetector && !self->_routineDetector && !self->_trendDetector)
  {
    objc_super v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetector processEvents:].cold.7();
    }

    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MOEventPatternDetector.m", 138, @"No anomaly/routine/trend strategy was defined for %@ (in %s:%d)", self->_patternDetectorName, "-[MOEventPatternDetector processEvents:]", 138 object file lineNumber description];
  }
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Preparing for process for %@", buf, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOEventPatternDetectorPredicate *)self->_predicate reset];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOEventPatternDetectorFeatureExtractor *)self->_featureExtractor reset];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOEventPatternDetectorFeatureTransformer *)self->_featureTransformer reset];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOEventPatternDetectorAnomalyDetector *)self->_anomalyDetector reset];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOEventPatternDetectorRoutineDetector *)self->_routineDetector reset];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOEventPatternDetectorTrendDetector *)self->_trendDetector reset];
  }
  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Filtering relevant event subsets for %@", buf, 0xCu);
  }

  id v18 = [(MOEventPatternDetectorPredicate *)self->_predicate filterEvents:v5];
  id v19 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Extracting event features for %@", buf, 0xCu);
  }

  uint64_t v21 = [(MOEventPatternDetectorFeatureExtractor *)self->_featureExtractor extractFeaturesFromEvents:v18];
  v22 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Aggregating events with featureTransformer for %@", buf, 0xCu);
  }

  featureTransformer = self->_featureTransformer;
  if (featureTransformer)
  {
    v25 = [(MOEventPatternDetectorFeatureTransformer *)featureTransformer transformFeaturesFromEvents:v18 withFeatures:v21];
    if ([v25 count] != (id)2)
    {
      v26 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetector processEvents:].cold.6();
      }

      v27 = +[NSAssertionHandler currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"MOEventPatternDetector.m" lineNumber:172 description:@"Wrong NSArray length resulting from transformFeaturesFromEvents:withFeatures:. (in %s:%d)", "-[MOEventPatternDetector processEvents:]", 172];
    }
    v28 = [v25 firstObject];

    if (!v28)
    {
      v29 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetector processEvents:].cold.5();
      }

      v30 = +[NSAssertionHandler currentHandler];
      [v30 handleFailureInMethod:a2 object:self file:@"MOEventPatternDetector.m" lineNumber:173 description:@"eventsSubset undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", "-[MOEventPatternDetector processEvents:]", 173];
    }
    v31 = [v25 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v33 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetector processEvents:].cold.4();
      }

      v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"MOEventPatternDetector.m" lineNumber:174 description:@"eventsSubset is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", "-[MOEventPatternDetector processEvents:]", 174];
    }
    v35 = [v25 lastObject];

    if (!v35)
    {
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetector processEvents:]();
      }

      v37 = +[NSAssertionHandler currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"MOEventPatternDetector.m" lineNumber:175 description:@"features undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", @"-[MOEventPatternDetector processEvents:]", 175];
    }
    v38 = [v25 lastObject];
    objc_opt_class();
    char v39 = objc_opt_isKindOfClass();

    if ((v39 & 1) == 0)
    {
      v40 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetector processEvents:]();
      }

      v41 = +[NSAssertionHandler currentHandler];
      [v41 handleFailureInMethod:a2 object:self file:@"MOEventPatternDetector.m" lineNumber:176 description:@"features is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", @"-[MOEventPatternDetector processEvents:]", 176];
    }
    v42 = [v25 firstObject];

    v43 = [v25 lastObject];

    id v44 = [v42 count];
    if (v44 != [v43 count])
    {
      v45 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetector processEvents:]();
      }

      v46 = +[NSAssertionHandler currentHandler];
      [v46 handleFailureInMethod:a2 object:self file:@"MOEventPatternDetector.m" lineNumber:179 description:@"Mismatch between number of features and number of events after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", "-[MOEventPatternDetector processEvents:]", 179];
    }
    uint64_t v21 = v43;
    id v18 = v42;
  }
  v47 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Detecting anomalies for %@", buf, 0xCu);
  }

  v49 = [(MOEventPatternDetectorAnomalyDetector *)self->_anomalyDetector extractAnomalyEventsFrom:v18 withFeatures:v21];
  v50 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    v51 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v51;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Detecting routines for %@", buf, 0xCu);
  }

  v52 = [(MOEventPatternDetectorRoutineDetector *)self->_routineDetector extractRoutineEventsFrom:v18 withFeatures:v21];
  v53 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v73 = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Detecting trends for %@", buf, 0xCu);
  }

  v55 = [(MOEventPatternDetectorTrendDetector *)self->_trendDetector extractTrendEventsFrom:v18 withFeatures:v21];
  v56 = objc_opt_new();
  v57 = v56;
  if (v49) {
    [v56 addObjectsFromArray:v49];
  }
  if (v52) {
    [v57 addObjectsFromArray:v52];
  }
  if (v55) {
    [v57 addObjectsFromArray:v55];
  }
  if (v57 && [v57 count])
  {
    v58 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v71 = (NSString *)[v57 count];
      id v70 = [v49 count];
      v59 = v21;
      id v60 = v5;
      id v61 = [v52 count];
      id v62 = [v55 count];
      v63 = self->_patternDetectorName;
      *(_DWORD *)buf = 134219010;
      v73 = v71;
      __int16 v74 = 2048;
      id v75 = v70;
      __int16 v76 = 2048;
      id v77 = v61;
      id v5 = v60;
      uint64_t v21 = v59;
      __int16 v78 = 2048;
      id v79 = v62;
      __int16 v80 = 2112;
      v81 = v63;
      v64 = "Detected %lu patterns (a=%lu,r=%lu,t=%lu) for %@";
      v65 = v58;
      uint32_t v66 = 52;
LABEL_81:
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, v64, buf, v66);
    }
  }
  else
  {
    v58 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v67 = self->_patternDetectorName;
      *(_DWORD *)buf = 138412290;
      v73 = v67;
      v64 = "No patterns detected for %@";
      v65 = v58;
      uint32_t v66 = 12;
      goto LABEL_81;
    }
  }

  id v68 = v57;
  return v68;
}

- (id)getAnomalyDetector
{
  return self->_anomalyDetector;
}

- (id)getTrendDetector
{
  return self->_trendDetector;
}

- (id)getRoutineDetector
{
  return self->_routineDetector;
}

- (NSString)patternDetectorName
{
  return self->_patternDetectorName;
}

- (void)setPatternDetectorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternDetectorName, 0);
  objc_storeStrong((id *)&self->_trendDetector, 0);
  objc_storeStrong((id *)&self->_routineDetector, 0);
  objc_storeStrong((id *)&self->_anomalyDetector, 0);
  objc_storeStrong((id *)&self->_featureTransformer, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)processEvents:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Mismatch between number of features and number of events after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "features is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.3()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "features undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.4()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "eventsSubset is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.5()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "eventsSubset undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.6()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Wrong NSArray length resulting from transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.7()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "No anomaly/routine/trend strategy was defined for %@ (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.8()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "No feature extractor strategy was defined for %@ (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)processEvents:.cold.9()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "No predicate was strategy defined %@ (in %s:%d)", v2, v3, v4, v5, v6);
}

@end