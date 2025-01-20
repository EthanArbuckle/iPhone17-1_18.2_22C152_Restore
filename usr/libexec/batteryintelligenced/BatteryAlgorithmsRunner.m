@interface BatteryAlgorithmsRunner
- (BOOL)featureFlagEn;
- (BOOL)freshInitRequested;
- (BOOL)initDone;
- (BatteryAlgorithmsRunner)init;
- (NSDictionary)algoStateData;
- (NSMutableDictionary)runMetaData;
- (NSString)AlgorithmClassName;
- (NSString)eventCA;
- (NSString)metaFilePath;
- (NSString)stateFilePath;
- (id)algorithmObject;
- (int)algoRunnerExecuteWithData:(id)a3;
- (void)algoRunnerFreshInitWithData:(id)a3;
- (void)algoRunnerInitWithData:(id)a3;
- (void)algoRunnerStoreOutput;
- (void)setAlgorithmClassName:(id)a3;
- (void)setFeatureFlagEn:(BOOL)a3;
- (void)setRunMetaData:(id)a3;
@end

@implementation BatteryAlgorithmsRunner

- (BatteryAlgorithmsRunner)init
{
  v7.receiver = self;
  v7.super_class = (Class)BatteryAlgorithmsRunner;
  v2 = [(BatteryAlgorithmsRunner *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.batteryintelligence", "BatteryAlgorithmsRunner");
    v4 = (void *)qword_100039640;
    qword_100039640 = (uint64_t)v3;

    v5 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10002023C();
  }

  return v2;
}

- (void)algoRunnerInitWithData:(id)a3
{
  id v4 = a3;
  if (![(BatteryAlgorithmsRunner *)self featureFlagEn])
  {
    v5 = (void *)qword_100039640;
    if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_super v7 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
      *(_DWORD *)buf = 138412290;
      v48 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ algorithm disabled by Feature Flag, Skipping", buf, 0xCu);
    }
    self->_initDone = 1;
  }
  v8 = sub_100016A68();
  v9 = [v8 stringByAppendingFormat:@"%@%@%@", @"/", @"com.apple.batteryintelligence.batteryalgorithms", @"/"];

  v10 = [v9 stringByAppendingFormat:@"%@%@", @"com.apple.batteryintelligence.batteryalgorithms", @"-"];
  v11 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
  v12 = [v10 stringByAppendingFormat:@"%@%@", v11, @"-meta.plist"];
  metaFilePath = self->_metaFilePath;
  self->_metaFilePath = v12;

  v14 = qword_100039640;
  if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_metaFilePath;
    *(_DWORD *)buf = 138412290;
    v48 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Metadata file: %@", buf, 0xCu);
  }
  v16 = [(BatteryAlgorithmsRunner *)self metaFilePath];
  v17 = sub_100016DEC(v16);

  v18 = +[NSMutableDictionary dictionaryWithDictionary:v17];
  runMetaData = self->_runMetaData;
  self->_runMetaData = v18;

  v20 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
  v21 = [v10 stringByAppendingFormat:@"%@%@", v20, @"-state.plist"];
  stateFilePath = self->_stateFilePath;
  self->_stateFilePath = v21;

  v23 = qword_100039640;
  if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_stateFilePath;
    *(_DWORD *)buf = 138412290;
    v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "State file: %@", buf, 0xCu);
  }
  v25 = [(BatteryAlgorithmsRunner *)self stateFilePath];
  v26 = sub_100016DEC(v25);

  v27 = +[NSMutableDictionary dictionaryWithDictionary:v26];
  algoStateData = self->_algoStateData;
  self->_algoStateData = v27;

  v29 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
  v30 = [@"com.apple.batteryalgorithm." stringByAppendingFormat:@"%@", v29];
  eventCA = self->_eventCA;
  self->_eventCA = v30;

  v32 = [(BatteryAlgorithmsRunner *)self algoStateData];
  [v4 setObject:v32 forKey:@"savedAlgoState"];

  v33 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
  v34 = [NSClassFromString(v33) algorithmWithData:v4];

  id algorithmObject = self->_algorithmObject;
  self->_id algorithmObject = v34;

  v36 = [(BatteryAlgorithmsRunner *)self algorithmObject];

  if (!v36)
  {
    v37 = (void *)qword_100039640;
    if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      v39 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
      *(_DWORD *)buf = 138412290;
      v48 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ algorithm Errored out", buf, 0xCu);
    }
    self->_initDone = 0;
  }
  v40 = [(BatteryAlgorithmsRunner *)self algorithmObject];
  v41 = (void *)qword_100039640;
  if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
  {
    v42 = v41;
    v43 = [v40 name];
    *(_DWORD *)buf = 138412290;
    v48 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "The Algorithm Name is: %@", buf, 0xCu);
  }
  v44 = (void *)qword_100039640;
  if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    v46 = [v40 algoDescription];
    *(_DWORD *)buf = 138412290;
    v48 = v46;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "The Algorithm description is: %@", buf, 0xCu);
  }
  self->_freshInitRequested = [v40 freshInitNeeded];
  self->_initDone = 1;
}

- (void)algoRunnerFreshInitWithData:(id)a3
{
  id v4 = a3;
  if ([(BatteryAlgorithmsRunner *)self featureFlagEn])
  {
    v5 = [(BatteryAlgorithmsRunner *)self algorithmObject];
    unsigned int v6 = [v5 freshInitWithData:v4];

    if (v6)
    {
      objc_super v7 = (void *)qword_100039640;
      if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
        int v13 = 138412546;
        v14 = v9;
        __int16 v15 = 1024;
        unsigned int v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ failed to init: %d", (uint8_t *)&v13, 0x12u);
      }
      self->_initDone = 0;
    }
  }
  else
  {
    v10 = (void *)qword_100039640;
    if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = [(BatteryAlgorithmsRunner *)self AlgorithmClassName];
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ algorithm disabled by Feature Flag, Skipping", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (int)algoRunnerExecuteWithData:(id)a3
{
  id v4 = a3;
  v5 = [(BatteryAlgorithmsRunner *)self algorithmObject];
  int v6 = [v5 runWithData:v4];

  return v6;
}

- (void)algoRunnerStoreOutput
{
  v2 = self;
  os_log_t v3 = [(BatteryAlgorithmsRunner *)self algorithmObject];
  id v4 = [v3 output];

  if (v4)
  {
    v5 = [v4 valueForKey:@"kCoreAnalyticsData"];

    if (v5)
    {
      int v6 = (void *)qword_100039640;
      if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v7 = v6;
        v8 = [v4 valueForKey:@"kCoreAnalyticsData"];
        *(_DWORD *)buf = 138412290;
        v102 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Storing this to CA: %@", buf, 0xCu);
      }
      [v4 valueForKey:@"kCoreAnalyticsData"];
      v10 = v9 = v4;
      v11 = [(BatteryAlgorithmsRunner *)v2 eventCA];
      +[BIMetricRecorder sendToCoreAnalytics:v10 forEvent:v11 withTrialManager:0];

      id v4 = v9;
    }
    v12 = [v4 valueForKey:@"kBDCOutputData"];

    if (v12)
    {
      v66 = v4;
      int v13 = [v4 valueForKey:@"kBDCOutputData"];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v14 = [&off_100033430 countByEnumeratingWithState:&v78 objects:v90 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v72 = *(void *)v79;
        v67 = v13;
        v68 = v2;
        do
        {
          uint64_t v16 = 0;
          id v69 = v15;
          do
          {
            if (*(void *)v79 != v72) {
              objc_enumerationMutation(&off_100033430);
            }
            uint64_t v73 = v16;
            v17 = *(void **)(*((void *)&v78 + 1) + 8 * v16);
            v18 = qword_100039640;
            if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v102 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Looking for %@ in BDCOutputData", buf, 0xCu);
            }
            v19 = [v13 allKeys];
            unsigned __int8 v20 = [v19 containsObject:v17];

            if (v20)
            {
              v21 = [v13 valueForKey:v17];
              v22 = qword_100039640;
              if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v102 = v17;
                __int16 v103 = 2112;
                v104 = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Storing this to DB Table %@: %@", buf, 0x16u);
              }
              v23 = [(BatteryAlgorithmsRunner *)v2 AlgorithmClassName];
              v24 = +[NSString stringWithFormat:@"%@%@", v23, v17];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v70 = v21;
                v71 = v24;
                if ([v17 isEqualToString:@"SBC"])
                {
                  id v25 = v21;
                  v26 = +[NSMutableDictionary dictionary];
                  long long v97 = 0u;
                  long long v98 = 0u;
                  long long v99 = 0u;
                  long long v100 = 0u;
                  id v27 = v25;
                  id v28 = [v27 countByEnumeratingWithState:&v97 objects:buf count:16];
                  if (v28)
                  {
                    id v29 = v28;
                    uint64_t v30 = 0;
                    id v31 = 0;
                    uint64_t v32 = *(void *)v98;
                    do
                    {
                      v33 = 0;
                      v34 = v31;
                      do
                      {
                        if (*(void *)v98 != v32) {
                          objc_enumerationMutation(v27);
                        }
                        id v31 = *(id *)(*((void *)&v97 + 1) + 8 * (void)v33);

                        v35 = +[NSNumber numberWithUnsignedInteger:(char *)v33 + v30];
                        [v26 setObject:v31 forKey:v35];

                        v33 = (char *)v33 + 1;
                        v34 = v31;
                      }
                      while (v29 != v33);
                      id v29 = [v27 countByEnumeratingWithState:&v97 objects:buf count:16];
                      v30 += (uint64_t)v33;
                    }
                    while (v29);
                  }
                  v36 = qword_100039640;
                  if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v102 = v26;
                    __int16 v103 = 2112;
                    v104 = v71;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Storing this Dictionary to PPS EPSQL %@: %@", buf, 0x16u);
                  }
                  v24 = v71;
                  +[BIMetricRecorder sendToPPS:v26 forIdentifier:v71];

                  int v13 = v67;
                  v2 = v68;
                  id v15 = v69;
                  v21 = v70;
                }
                else
                {
                  id v40 = v21;
                  id v41 = v24;
                  long long v86 = 0u;
                  long long v87 = 0u;
                  long long v88 = 0u;
                  long long v89 = 0u;
                  id obj = v40;
                  id v76 = [v40 countByEnumeratingWithState:&v86 objects:buf count:16];
                  if (v76)
                  {
                    uint64_t v75 = *(void *)v87;
                    do
                    {
                      uint64_t v42 = 0;
                      do
                      {
                        if (*(void *)v87 != v75) {
                          objc_enumerationMutation(obj);
                        }
                        uint64_t v77 = v42;
                        v43 = *(void **)(*((void *)&v86 + 1) + 8 * v42);
                        v44 = +[NSMutableDictionary dictionary];
                        long long v82 = 0u;
                        long long v83 = 0u;
                        long long v84 = 0u;
                        long long v85 = 0u;
                        id v45 = v43;
                        id v46 = [v45 countByEnumeratingWithState:&v82 objects:&v97 count:16];
                        if (v46)
                        {
                          id v47 = v46;
                          uint64_t v48 = *(void *)v83;
                          do
                          {
                            for (i = 0; i != v47; i = (char *)i + 1)
                            {
                              if (*(void *)v83 != v48) {
                                objc_enumerationMutation(v45);
                              }
                              uint64_t v50 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                              v51 = [v45 objectForKey:v50];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                uint64_t v95 = v50;
                                v96 = v51;
                                v52 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
                                v53 = qword_100039640;
                                if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)v91 = 138412546;
                                  v92 = v52;
                                  __int16 v93 = 2112;
                                  id v94 = v41;
                                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Adding this Array to PPS EPSQL %@ : %@", v91, 0x16u);
                                }
                                +[BIMetricRecorder sendToPPS:v52 forIdentifier:v41];
                              }
                              else
                              {
                                [v44 setObject:v51 forKeyedSubscript:v50];
                              }
                            }
                            id v47 = [v45 countByEnumeratingWithState:&v82 objects:&v97 count:16];
                          }
                          while (v47);
                        }

                        v54 = qword_100039640;
                        if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v91 = 138412546;
                          v92 = v44;
                          __int16 v93 = 2112;
                          id v94 = v41;
                          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Storing this Dictionary to PPS EPSQL %@: %@", v91, 0x16u);
                        }
                        +[BIMetricRecorder sendToPPS:v44 forIdentifier:v41];

                        uint64_t v42 = v77 + 1;
                      }
                      while ((id)(v77 + 1) != v76);
                      id v76 = [obj countByEnumeratingWithState:&v86 objects:buf count:16];
                    }
                    while (v76);
                  }

                  int v13 = v67;
                  v2 = v68;
                  id v15 = v69;
                  v21 = v70;
                  v24 = v71;
                }
              }
            }
            else
            {
              v37 = (void *)qword_100039640;
              if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                v39 = [v13 allKeys];
                *(_DWORD *)buf = 138412546;
                v102 = v17;
                __int16 v103 = 2112;
                v104 = v39;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Did not find any data for %@. Keys passed in = %@", buf, 0x16u);
              }
            }
            uint64_t v16 = v73 + 1;
          }
          while ((id)(v73 + 1) != v15);
          id v15 = [&off_100033430 countByEnumeratingWithState:&v78 objects:v90 count:16];
        }
        while (v15);
      }

      id v4 = v66;
    }
    v55 = [v4 valueForKey:@"savedAlgoState"];

    if (v55)
    {
      v56 = (void *)qword_100039640;
      if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v56;
        v58 = [v4 valueForKey:@"savedAlgoState"];
        *(_DWORD *)buf = 138412290;
        v102 = v58;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Storing system state %@", buf, 0xCu);
      }
      v59 = [v4 valueForKey:@"savedAlgoState"];
      v60 = [(BatteryAlgorithmsRunner *)v2 stateFilePath];
      sub_100016BAC(v59, v60);
    }
  }
  v61 = (void *)qword_100039640;
  if (os_log_type_enabled((os_log_t)qword_100039640, OS_LOG_TYPE_DEFAULT))
  {
    v62 = v61;
    v63 = [(BatteryAlgorithmsRunner *)v2 runMetaData];
    *(_DWORD *)buf = 138412290;
    v102 = v63;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Storing MetaData %@", buf, 0xCu);
  }
  v64 = [(BatteryAlgorithmsRunner *)v2 runMetaData];
  v65 = [(BatteryAlgorithmsRunner *)v2 metaFilePath];
  sub_100016BAC(v64, v65);
}

- (BOOL)initDone
{
  return self->_initDone;
}

- (id)algorithmObject
{
  return self->_algorithmObject;
}

- (NSString)AlgorithmClassName
{
  return self->_AlgorithmClassName;
}

- (void)setAlgorithmClassName:(id)a3
{
}

- (BOOL)featureFlagEn
{
  return self->_featureFlagEn;
}

- (void)setFeatureFlagEn:(BOOL)a3
{
  self->_featureFlagEn = a3;
}

- (BOOL)freshInitRequested
{
  return self->_freshInitRequested;
}

- (NSMutableDictionary)runMetaData
{
  return self->_runMetaData;
}

- (void)setRunMetaData:(id)a3
{
}

- (NSDictionary)algoStateData
{
  return self->_algoStateData;
}

- (NSString)metaFilePath
{
  return self->_metaFilePath;
}

- (NSString)stateFilePath
{
  return self->_stateFilePath;
}

- (NSString)eventCA
{
  return self->_eventCA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCA, 0);
  objc_storeStrong((id *)&self->_stateFilePath, 0);
  objc_storeStrong((id *)&self->_metaFilePath, 0);
  objc_storeStrong((id *)&self->_algoStateData, 0);
  objc_storeStrong((id *)&self->_runMetaData, 0);
  objc_storeStrong((id *)&self->_AlgorithmClassName, 0);

  objc_storeStrong(&self->_algorithmObject, 0);
}

@end