@interface BMStateVectorMetricsCollector
- (BMStateVectorMetricsCollector)initWithDatabase:(id)a3 activity:(id)a4;
- (id)computeStateVectorMetrics;
- (id)dateToRelativePositionDictionary;
- (id)validStreamNameMapping;
- (unint64_t)sizeOfSerializedStateVectorInBytes:(id)a3;
- (unint64_t)timestampCountForStateVector:(id)a3;
- (void)computeAndSendStateVectorMetrics;
@end

@implementation BMStateVectorMetricsCollector

- (BMStateVectorMetricsCollector)initWithDatabase:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMStateVectorMetricsCollector;
  v9 = [(BMStateVectorMetricsCollector *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)computeAndSendStateVectorMetrics
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BMStateVectorMetricsCollector *)self computeStateVectorMetrics];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        +[BMCoreAnalyticsEvents sendCKRecordCRDTLog:*(void *)(*((void *)&v7 + 1) + 8 * (void)v6)];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)validStreamNameMapping
{
  v2 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = +[BMStreamSyncPolicy syncableStreamConfigurations];
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        long long v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v8 = [v7 streamIdentifier];
        long long v9 = [v7 syncPolicy];
        if ([v9 supportsTransport:3 direction:3])
        {
          [v2 setObject:v8 forKeyedSubscript:v8];
          long long v10 = [v7 streamUUID];
          v11 = [v10 UUIDString];
          [v2 setObject:v8 forKeyedSubscript:v11];

          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          objc_super v12 = [v7 legacyNames];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v2 setObject:v8 forKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
              }
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)computeStateVectorMetrics
{
  id v41 = (id)objc_opt_new();
  v40 = [(BMStateVectorMetricsCollector *)self validStreamNameMapping];
  id v3 = [v40 allKeys];
  id v4 = +[NSSet setWithArray:v3];

  uint64_t v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100044AFC((uint64_t)self, (uint64_t)v4, v5);
  }

  v39 = [(BMStateVectorMetricsCollector *)self dateToRelativePositionDictionary];
  [(BMSyncDatabase *)self->_database locationsWithState:2];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v49;
    uint64_t v37 = *(void *)v49;
    v38 = v4;
    do
    {
      long long v9 = 0;
      id v42 = v7;
      do
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v9);
        objc_super v12 = [v10 streamName];
        unsigned int v13 = [v4 containsObject:v12];

        if (v13)
        {
          v45 = v11;
          v47 = [(BMSyncDatabase *)self->_database locationRowWithLocation:v10];
          id v14 = -[BMSyncDatabase stateVectorForLocationRow:](self->_database, "stateVectorForLocationRow:");
          uint64_t v15 = [v10 day];
          uint64_t v16 = [v39 objectForKeyedSubscript:v15];
          v17 = (void *)v16;
          v18 = &off_100072D00;
          if (v16) {
            v18 = (_UNKNOWN **)v16;
          }
          long long v19 = v18;

          v46 = v19;
          v59[0] = v19;
          v58[0] = @"relative_pos";
          v58[1] = @"state_vector_sites_cnt";
          long long v20 = [v14 clockVector];
          long long v21 = [v20 allSiteIdentifiers];
          long long v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 count]);
          v59[1] = v22;
          v58[2] = @"state_vector_size_est";
          long long v23 = +[NSNumber numberWithUnsignedInteger:[(BMStateVectorMetricsCollector *)self sizeOfSerializedStateVectorInBytes:v14]];
          v59[2] = v23;
          v58[3] = @"state_vector_timestamp_cnt";
          long long v24 = +[NSNumber numberWithUnsignedInteger:[(BMStateVectorMetricsCollector *)self timestampCountForStateVector:v14]];
          v59[3] = v24;
          v58[4] = @"stream_name";
          [v10 streamName];
          v26 = long long v25 = self;
          v27 = [v40 objectForKeyedSubscript:v26];
          v59[4] = v27;
          v44 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:5];

          self = v25;
          v28 = __biome_log_for_category();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v30 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v30);
            v32 = [v47 location];
            v33 = [v32 day];
            *(_DWORD *)buf = 138412802;
            v53 = v31;
            __int16 v54 = 2112;
            v55 = v33;
            __int16 v56 = 2112;
            v57 = v46;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@ - locationRow with day: %@ has relativePosition: %@", buf, 0x20u);
          }
          v29 = __biome_log_for_category();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v34 = (objc_class *)objc_opt_class();
            v35 = NSStringFromClass(v34);
            *(_DWORD *)buf = 138412546;
            v53 = v35;
            __int16 v54 = 2112;
            v55 = v44;
            _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%@ - generated crdtLog: %@", buf, 0x16u);
          }
          [v41 addObject:v44];

          uint64_t v8 = v37;
          id v4 = v38;
          id v7 = v42;
          v11 = v45;
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v7);
  }

  return v41;
}

- (id)dateToRelativePositionDictionary
{
  v2 = objc_opt_new();
  id v3 = +[BMStreamCRDTLocationDayAssigner truncateDateToDay:CFAbsoluteTimeGetCurrent()];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  unint64_t v6 = 0;
  for (uint64_t i = 0; i != 100; ++i)
  {
    uint64_t v8 = +[BMStreamCRDTLocationDayAssigner truncateDateToDay:v5 - (double)v6];
    long long v9 = +[NSNumber numberWithUnsignedInteger:i];
    [v2 setObject:v9 forKeyedSubscript:v8];

    v6 += 86400;
  }

  return v2;
}

- (unint64_t)sizeOfSerializedStateVectorInBytes:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  double v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  id v6 = v10;
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100044BA0((uint64_t)self, (uint64_t)v4, v7);
    }
  }
  id v8 = [v5 length];

  return (unint64_t)v8;
}

- (unint64_t)timestampCountForStateVector:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000106E8;
  v6[3] = &unk_10006CE00;
  v6[4] = &v7;
  [v3 enumerateAllClockValuesUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end