@interface TimeTo80Estimator
+ (id)sharedPredictor;
- (MLModel)tt80EstimatorModel;
- (NSArray)predictedFeatureNames;
- (NSString)name;
- (NSString)version;
- (OS_os_log)logger;
- (TimeTo80Estimator)init;
- (id)getPayloadForPPSWithParams:(id)a3 andPredictionValue:(id)a4;
- (id)runInferenceAndGetPrediction:(id)a3;
- (void)predictAndRecordWithParams:(id)a3;
- (void)setLogger:(id)a3;
- (void)setName:(id)a3;
- (void)setPredictedFeatureNames:(id)a3;
- (void)setTt80EstimatorModel:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation TimeTo80Estimator

+ (id)sharedPredictor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000063C8;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_100039618 != -1) {
    dispatch_once(&qword_100039618, block);
  }
  v2 = (void *)qword_100039610;

  return v2;
}

- (MLModel)tt80EstimatorModel
{
  tt80EstimatorModel = self->_tt80EstimatorModel;
  if (tt80EstimatorModel) {
    goto LABEL_4;
  }
  v4 = [(TimeTo80Estimator *)self name];
  v5 = sub_10001812C(v4);

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"mlModel"];
    v7 = self->_tt80EstimatorModel;
    self->_tt80EstimatorModel = v6;

    tt80EstimatorModel = self->_tt80EstimatorModel;
LABEL_4:
    v8 = tt80EstimatorModel;
    goto LABEL_5;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
    sub_10001F2FC(logger, v11, v12, v13, v14, v15, v16, v17);
  }
  v8 = 0;
LABEL_5:

  return v8;
}

- (TimeTo80Estimator)init
{
  v27.receiver = self;
  v27.super_class = (Class)TimeTo80Estimator;
  v2 = [(TimeTo80Estimator *)&v27 init];
  if (v2)
  {
    uint64_t v3 = sub_100016A74("TimeTo80Estimator");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    [(TimeTo80Estimator *)v2 setName:@"tt80_lstm_regression"];
    v5 = [(TimeTo80Estimator *)v2 name];
    v6 = sub_10001812C(v5);

    if (v6)
    {
      v7 = [v6 objectForKeyedSubscript:@"version"];
      [(TimeTo80Estimator *)v2 setVersion:v7];

      v8 = [v6 objectForKeyedSubscript:@"predictedFeatureNames"];
      [(TimeTo80Estimator *)v2 setPredictedFeatureNames:v8];

      v9 = v2;
    }
    else
    {
      v18 = v2->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001F2FC(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      v9 = 0;
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_10001EF98(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v9 = 0;
  }

  return v9;
}

- (id)runInferenceAndGetPrediction:(id)a3
{
  id v4 = a3;
  v5 = [(TimeTo80Estimator *)self tt80EstimatorModel];
  id v15 = 0;
  v6 = [v5 predictionFromFeatures:v4 error:&v15];

  id v7 = v15;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_10001F334();
    }
    v8 = 0;
  }
  else
  {
    v9 = [(TimeTo80Estimator *)self predictedFeatureNames];
    BOOL v10 = [v9 firstObject];
    uint64_t v11 = [v6 featureValueForName:v10];
    uint64_t v12 = [v11 multiArrayValue];
    v8 = [v12 objectAtIndexedSubscript:0];

    tt80EstimatorModel = self->_tt80EstimatorModel;
    self->_tt80EstimatorModel = 0;
  }

  return v8;
}

- (void)predictAndRecordWithParams:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v202 = v4;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "Additional params for TT80 inference: %@", buf, 0xCu);
  }
  v6 = [v4 allKeys];
  unsigned int v7 = [v6 containsObject:@"minTimeSteps"];

  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"minTimeSteps"];
  }
  else
  {
    v8 = &off_100033820;
  }
  v9 = [v4 allKeys];
  unsigned int v10 = [v9 containsObject:@"takeLatestSMCValuesInFeatures"];

  if (v10)
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:@"takeLatestSMCValuesInFeatures"];
    unsigned int v12 = [v11 BOOLValue];
  }
  else
  {
    unsigned int v12 = 0;
  }
  uint64_t v13 = [v4 allKeys];
  unsigned int v14 = [v13 containsObject:@"postInternalNotification"];

  unsigned int v162 = v12;
  if (v14)
  {
    id v15 = [v4 objectForKeyedSubscript:@"postInternalNotification"];
    unsigned int v14 = [v15 BOOLValue];
  }
  uint64_t v16 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == 'BDC_SBC')"];
  uint64_t v17 = +[NSSet setWithArray:&off_100033400];
  sub_10001840C();
  id v18 = [objc_alloc((Class)PPSTimeSeriesRequest) initWithMetrics:v17 predicate:v16 timeFilter:0 limitCount:[off_100033808 unsignedIntValue] offsetCount:0 readDirection:1];
  if (!v18)
  {
    uint64_t v22 = self->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10001F39C(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_88;
  }
  unsigned int v161 = v14;
  uint64_t v190 = 0;
  uint64_t v19 = PerfPowerServicesGetData();
  id v20 = 0;
  if (v20)
  {
    uint64_t v21 = v20;
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_10001F610();
    }
    goto LABEL_87;
  }
  v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 count]);
  v31 = self->_logger;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v202 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Received %@ rows from PPS.", buf, 0xCu);
  }
  v32 = self->_logger;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_10001F56C(v32, v19);
  }
  if ([v30 compare:v8] == (id)-1)
  {
    v57 = self->_logger;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_10001F3D4(v57, v30);
    }
    uint64_t v21 = 0;
    goto LABEL_86;
  }
  v153 = v30;
  v174 = (os_log_t *)self;
  id v156 = v18;
  v157 = v17;
  v158 = v16;
  id v159 = v4;
  v160 = v8;
  id v169 = objc_alloc_init((Class)NSMutableArray);
  id v168 = objc_alloc_init((Class)NSMutableArray);
  id v167 = objc_alloc_init((Class)NSMutableArray);
  id v166 = objc_alloc_init((Class)NSMutableArray);
  id v170 = objc_alloc_init((Class)NSMutableArray);
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  v155 = v19;
  id obj = v19;
  id v177 = [obj countByEnumeratingWithState:&v186 objects:v224 count:16];
  if (!v177)
  {
    v179 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    goto LABEL_48;
  }
  v179 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  uint64_t v175 = *(void *)v187;
  v37 = &off_100033838;
  do
  {
    v38 = 0;
    do
    {
      if (*(void *)v187 != v175) {
        objc_enumerationMutation(obj);
      }
      v39 = v37;
      v40 = [*(id *)(*((void *)&v186 + 1) + 8 * (void)v38) metricKeysAndValues];
      if (!v40)
      {
        v54 = v174[5];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_10001F4EC(&v184, v185, v54);
        }
        goto LABEL_38;
      }
      v41 = +[BIFeatures sharedInstance];
      v42 = [v41 objectForKey:@"CurrentCapacity" fromDict:v40 withDefaults:-99999];

      v43 = +[BIFeatures sharedInstance];
      v44 = [v43 objectForKey:@"Voltage" fromDict:v40 withDefaults:-99999];

      v45 = +[BIFeatures sharedInstance];
      [v45 objectForKey:@"Amperage" fromDict:v40 withDefaults:-99999];
      v47 = v46 = v34;

      v48 = +[BIFeatures sharedInstance];
      v49 = [v48 objectForKey:@"Temperature" fromDict:v40 withDefaults:-99999];

      v50 = +[BIFeatures sharedInstance];
      v51 = [v50 objectForKey:@"IsCharging" fromDict:v40 withDefaults:-99999];

      v37 = v39;
      if (([v42 isEqual:v39] & 1) != 0
        || ([v44 isEqual:v39] & 1) != 0
        || ([v47 isEqual:v39] & 1) != 0
        || ([v49 isEqual:v39] & 1) != 0
        || [v51 isEqual:v39])
      {
        v52 = v174[5];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          sub_10001F52C(&v182, v183, v52);
        }
        v179 = v51;
        v53 = v47;
        v34 = v49;
        v33 = v53;
        v35 = v44;
        v36 = v42;
LABEL_38:
        v37 = v39;
        goto LABEL_39;
      }
      [v169 addObject:v42];
      [v168 addObject:v44];
      [v167 addObject:v47];
      [v166 addObject:v49];
      [v170 addObject:v51];
      v179 = v51;
      v55 = v47;
      v34 = v49;
      v33 = v55;
      v35 = v44;
      v36 = v42;
LABEL_39:

      v38 = (char *)v38 + 1;
    }
    while (v177 != v38);
    id v56 = [obj countByEnumeratingWithState:&v186 objects:v224 count:16];
    id v177 = v56;
  }
  while (v56);
LABEL_48:
  v165 = v33;

  v58 = v169;
  v59 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v169 count]);

  v60 = v174[5];
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v202 = v59;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "After processing PPS data, ppsNumRows is now: %@", buf, 0xCu);
  }
  v61 = v170;
  v178 = v59;
  if ([v59 compare:v8] == (id)-1)
  {
    v65 = v174[5];
    v66 = v168;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_10001F460(v65, v59);
    }
    id v67 = 0;
    v68 = 0;
    v69 = 0;
    id objb = 0;
  }
  else
  {
    v154 = sub_100016ECC();
    if (v154) {
      unsigned int v62 = v162;
    }
    else {
      unsigned int v62 = 0;
    }
    char obja = v62;
    if (v62 == 1)
    {
      if ([v59 isEqualToNumber:&off_100033808])
      {
        id v63 = v59;
        int v64 = 1;
        goto LABEL_63;
      }
      +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v59 intValue] + 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v70 = v59;
    }
    id v63 = v70;
    int v64 = 0;
LABEL_63:
    v152 = v34;
    v71 = v174[5];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v202 = v63;
      __int16 v203 = 2048;
      unint64_t v204 = v162;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Using inputFeaturesNumOfRows = %@ (with takeLatestSMCValues = %ld)", buf, 0x16u);
    }
    v223[0] = &off_100033850;
    v223[1] = v63;
    v164 = v63;
    v223[2] = &off_100033868;
    v72 = (void **)&AnalyticsSendEventLazy_ptr;
    +[NSArray arrayWithObjects:v223 count:3];
    uint64_t v163 = v181 = 0;
    id v73 = [objc_alloc((Class)MLMultiArray) initWithShape:v163 dataType:65568 error:&v181];
    id v148 = v181;
    if (v64 < (int)[v59 intValue])
    {
      uint64_t v74 = v64;
      do
      {
        v75 = [v169 objectAtIndexedSubscript:v74];
        v222[0] = &off_100033880;
        v76 = +[NSNumber numberWithInt:v74];
        v222[1] = v76;
        v222[2] = &off_100033880;
        [v72[138] arrayWithObjects:v222 count:3];
        v78 = v77 = v72;
        [v73 setObject:v75 forKeyedSubscript:v78];

        v79 = [v168 objectAtIndexedSubscript:v74];
        v221[0] = &off_100033880;
        v80 = +[NSNumber numberWithInt:v74];
        v221[1] = v80;
        v221[2] = &off_100033850;
        v81 = [v77[138] arrayWithObjects:v221 count:3];
        [v73 setObject:v79 forKeyedSubscript:v81];

        v82 = [v166 objectAtIndexedSubscript:v74];
        v220[0] = &off_100033880;
        v83 = +[NSNumber numberWithInt:v74];
        v220[1] = v83;
        v220[2] = &off_100033898;
        v84 = [v77[138] arrayWithObjects:v220 count:3];
        [v73 setObject:v82 forKeyedSubscript:v84];

        v85 = [v167 objectAtIndexedSubscript:v74];
        v219[0] = &off_100033880;
        v86 = +[NSNumber numberWithInt:v74];
        v219[1] = v86;
        v219[2] = &off_1000338B0;
        v87 = [v77[138] arrayWithObjects:v219 count:3];
        [v73 setObject:v85 forKeyedSubscript:v87];

        v88 = [v170 objectAtIndexedSubscript:v74];
        v218[0] = &off_100033880;
        v89 = +[NSNumber numberWithInt:v74];
        v218[1] = v89;
        v218[2] = &off_1000338C8;
        v90 = [v77[138] arrayWithObjects:v218 count:3];
        [v73 setObject:v88 forKeyedSubscript:v90];

        v72 = v77;
        ++v74;
      }
      while ((int)[v178 intValue] > (int)v74);
    }
    v176 = v73;
    if (obja)
    {
      v91 = [v154 objectForKey:@"CurrentCapacity"];
      v217[0] = &off_100033880;
      v92 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
      v217[1] = v92;
      v217[2] = &off_100033880;
      v93 = +[NSArray arrayWithObjects:v217 count:3];
      [v73 setObject:v91 forKeyedSubscript:v93];

      v94 = [v154 objectForKey:@"Voltage"];
      v216[0] = &off_100033880;
      v95 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
      v216[1] = v95;
      v216[2] = &off_100033850;
      v96 = +[NSArray arrayWithObjects:v216 count:3];
      [v73 setObject:v94 forKeyedSubscript:v96];

      v97 = [v154 objectForKey:@"Temperature"];
      v215[0] = &off_100033880;
      v98 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
      v215[1] = v98;
      v215[2] = &off_100033898;
      v99 = +[NSArray arrayWithObjects:v215 count:3];
      [v73 setObject:v97 forKeyedSubscript:v99];

      v100 = [v154 objectForKey:@"Amperage"];
      v214[0] = &off_100033880;
      v101 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
      v214[1] = v101;
      v214[2] = &off_1000338B0;
      v102 = +[NSArray arrayWithObjects:v214 count:3];
      [v73 setObject:v100 forKeyedSubscript:v102];

      v103 = [v154 objectForKey:@"IsCharging"];
      v213[0] = &off_100033880;
      v104 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
      v213[1] = v104;
      v213[2] = &off_1000338C8;
      v105 = +[NSArray arrayWithObjects:v213 count:3];
      [v73 setObject:v103 forKeyedSubscript:v105];
    }
    CFStringRef v211 = @"sbc_in";
    id v212 = v73;
    +[NSDictionary dictionaryWithObjects:&v212 forKeys:&v211 count:1];
    v151 = id v180 = v148;
    id v67 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v151 error:&v180];
    id objb = v180;

    os_log_t v106 = v174[5];
    v34 = v152;
    v107 = &AnalyticsSendEventLazy_ptr;
    if (v67)
    {
      v61 = v170;
      if (os_log_type_enabled(v174[5], OS_LOG_TYPE_DEBUG))
      {
        v200[0] = &off_100033880;
        log = v106;
        v144 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 2);
        v200[1] = v144;
        v200[2] = &off_100033880;
        v142 = +[NSArray arrayWithObjects:v200 count:3];
        v149 = [v176 objectForKeyedSubscript:v142];
        v199[0] = &off_100033880;
        v138 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 2);
        v199[1] = v138;
        v199[2] = &off_100033850;
        v136 = +[NSArray arrayWithObjects:v199 count:3];
        v146 = [v176 objectForKeyedSubscript:v136];
        v198[0] = &off_100033880;
        v134 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 2);
        v198[1] = v134;
        v198[2] = &off_100033898;
        v132 = +[NSArray arrayWithObjects:v198 count:3];
        v126 = [v176 objectForKeyedSubscript:v132];
        v197[0] = &off_100033880;
        v130 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 2);
        v197[1] = v130;
        v197[2] = &off_1000338B0;
        v128 = +[NSArray arrayWithObjects:v197 count:3];
        v124 = [v176 objectForKeyedSubscript:v128];
        v196[0] = &off_100033880;
        v118 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 2);
        v196[1] = v118;
        v196[2] = &off_1000338C8;
        v119 = +[NSArray arrayWithObjects:v196 count:3];
        v120 = [v176 objectForKeyedSubscript:v119];
        *(_DWORD *)buf = 138413314;
        id v202 = v149;
        __int16 v203 = 2112;
        unint64_t v204 = (unint64_t)v146;
        __int16 v205 = 2112;
        v206 = v126;
        __int16 v207 = 2112;
        v208 = v124;
        __int16 v209 = 2112;
        v210 = v120;
        _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "second last row for TT80 features: [%@ %@ %@ %@ %@]", buf, 0x34u);

        v34 = v152;
        v61 = v170;

        v107 = &AnalyticsSendEventLazy_ptr;
      }
      v108 = v174[5];
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
      {
        v195[0] = &off_100033880;
        loga = v108;
        v145 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
        v195[1] = v145;
        v195[2] = &off_100033880;
        v143 = [v107[138] arrayWithObjects:v195 count:3];
        v150 = [v176 objectForKeyedSubscript:v143];
        v194[0] = &off_100033880;
        v139 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
        v194[1] = v139;
        v194[2] = &off_100033850;
        v137 = [v107[138] arrayWithObjects:v194 count:3];
        v147 = [v176 objectForKeyedSubscript:v137];
        v193[0] = &off_100033880;
        v135 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
        v193[1] = v135;
        v193[2] = &off_100033898;
        v133 = [v107[138] arrayWithObjects:v193 count:3];
        v127 = [v176 objectForKeyedSubscript:v133];
        v192[0] = &off_100033880;
        v131 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
        v192[1] = v131;
        v192[2] = &off_1000338B0;
        v129 = [v107[138] arrayWithObjects:v192 count:3];
        v125 = [v176 objectForKeyedSubscript:v129];
        v191[0] = &off_100033880;
        v121 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v63 integerValue] - 1);
        v191[1] = v121;
        v191[2] = &off_1000338C8;
        v122 = [v107[138] arrayWithObjects:v191 count:3];
        v123 = [v176 objectForKeyedSubscript:v122];
        *(_DWORD *)buf = 138413314;
        id v202 = v150;
        __int16 v203 = 2112;
        unint64_t v204 = (unint64_t)v147;
        __int16 v205 = 2112;
        v206 = v127;
        __int16 v207 = 2112;
        v208 = v125;
        __int16 v209 = 2112;
        v210 = v123;
        _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "Latest values for TT80 features: [%@ %@ %@ %@ %@]", buf, 0x34u);

        v8 = v160;
        v61 = v170;

        v34 = v152;
      }
      v109 = v174[5];
      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
      {
        v110 = v109;
        v111 = [(os_log_t *)v174 name];
        v112 = [(os_log_t *)v174 version];
        *(_DWORD *)buf = 138412546;
        id v202 = v111;
        __int16 v203 = 2112;
        unint64_t v204 = (unint64_t)v112;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Predicting TT80 using model %@ and version %@", buf, 0x16u);

        v61 = v170;
      }
      v113 = [(os_log_t *)v174 runInferenceAndGetPrediction:v67];
      v114 = v174[5];
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v202 = v113;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, "TT80 prediction: %@", buf, 0xCu);
      }
      v115 = [(os_log_t *)v174 getPayloadForPPSWithParams:0 andPredictionValue:v113];
      +[BIMetricRecorder sendToPPS:v115 forIdentifier:@"TimeTo80"];
      if (v161)
      {
        v116 = +[BatteryIntelligenceNotificationManager sharedInstance];
        [v113 doubleValue];
        [v116 postTT80NotificationWithDuration:v117 * 3600.0];

        v61 = v170;
      }

      v66 = v168;
      v58 = v169;
    }
    else
    {
      v66 = v168;
      v58 = v169;
      v61 = v170;
      if (os_log_type_enabled(v174[5], OS_LOG_TYPE_ERROR)) {
        sub_10001F1F8();
      }
    }

    v69 = (void *)v163;
    v68 = v176;
  }

  uint64_t v16 = v158;
  id v4 = v159;
  id v18 = v156;
  uint64_t v17 = v157;
  uint64_t v19 = v155;
  v30 = v178;
  uint64_t v21 = objb;
LABEL_86:

LABEL_87:
LABEL_88:
}

- (id)getPayloadForPPSWithParams:(id)a3 andPredictionValue:(id)a4
{
  id v5 = a4;
  v6 = +[NSMutableDictionary dictionary];
  unsigned int v7 = [(TimeTo80Estimator *)self version];
  [v6 setObject:v7 forKeyedSubscript:@"model_id"];

  v8 = [(TimeTo80Estimator *)self name];
  [v6 setObject:v8 forKeyedSubscript:@"model_name"];

  [v6 setObject:v5 forKeyedSubscript:@"model_prediction"];
  v9 = +[NSNumber numberWithUnsignedInt:sub_1000170F4()];
  [v6 setObject:v9 forKeyedSubscript:@"start_soc"];

  return v6;
}

- (void)setTt80EstimatorModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)predictedFeatureNames
{
  return self->_predictedFeatureNames;
}

- (void)setPredictedFeatureNames:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_predictedFeatureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_tt80EstimatorModel, 0);
}

@end