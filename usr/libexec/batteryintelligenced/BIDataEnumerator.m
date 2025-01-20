@interface BIDataEnumerator
- (BIDataEnumerator)initWithStartDate:(id)a3 endDate:(id)a4 forBDCStream:(id)a5 atOrAboveVersion:(id)a6 usingDataFromCSVs:(BOOL)a7;
- (BIDataEnumerator)initWithStartDate:(id)a3 endDate:(id)a4 forBDCStream:(id)a5 atOrAboveVersion:(id)a6 usingDataFromCSVs:(BOOL)a7 withInputFilePath:(id)a8;
- (BOOL)useCSVs;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)bdcStream;
- (NSString)version;
- (id)copyFileURLs;
- (id)getBDCDataFromStartDate:(id)a3 toEndDate:(id)a4 forStream:(id)a5 withMetrics:(id)a6 withLimit:(unint64_t)a7;
- (id)getMedianValueForKey:(id)a3;
- (id)nextObject;
- (void)resetStream;
@end

@implementation BIDataEnumerator

- (BIDataEnumerator)initWithStartDate:(id)a3 endDate:(id)a4 forBDCStream:(id)a5 atOrAboveVersion:(id)a6 usingDataFromCSVs:(BOOL)a7
{
  return [(BIDataEnumerator *)self initWithStartDate:a3 endDate:a4 forBDCStream:a5 atOrAboveVersion:a6 usingDataFromCSVs:a7 withInputFilePath:0];
}

- (BIDataEnumerator)initWithStartDate:(id)a3 endDate:(id)a4 forBDCStream:(id)a5 atOrAboveVersion:(id)a6 usingDataFromCSVs:(BOOL)a7 withInputFilePath:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v100.receiver = self;
  v100.super_class = (Class)BIDataEnumerator;
  id v19 = [(BIDataEnumerator *)&v100 init];
  if (v19)
  {
    uint64_t v20 = sub_100016A74("dataaccess");
    v21 = (void *)*((void *)v19 + 1);
    *((void *)v19 + 1) = v20;

    *((unsigned char *)v19 + 96) = a7;
    *((void *)v19 + 8) = 0x412A5E0000000000;
    *((void *)v19 + 9) = 0x3FF0000000000000;
    id v22 = [v14 copy];
    v23 = (void *)*((void *)v19 + 13);
    *((void *)v19 + 13) = v22;

    id v24 = [v15 copy];
    v25 = (void *)*((void *)v19 + 14);
    *((void *)v19 + 14) = v24;

    id v26 = [v16 copy];
    v27 = (void *)*((void *)v19 + 15);
    *((void *)v19 + 15) = v26;

    id v28 = [v17 copy];
    v29 = (void *)*((void *)v19 + 16);
    *((void *)v19 + 16) = v28;

    if (a7)
    {
      v30 = +[NSFileManager defaultManager];
      id v82 = v14;
      if (v18)
      {
        id v31 = v18;
      }
      else
      {
        sub_100016A5C();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v41 = v31;
      v42 = +[NSURL fileURLWithPath:v31 isDirectory:1];
      v111[0] = NSURLAttributeModificationDateKey;
      v111[1] = NSURLCreationDateKey;
      v43 = +[NSArray arrayWithObjects:v111 count:2];
      id v99 = 0;
      [v30 contentsOfDirectoryAtURL:v42 includingPropertiesForKeys:v43 options:5 error:&v99];
      v45 = v44 = v30;
      id v85 = v99;

      v79 = v44;
      v80 = v45;
      if (v45)
      {
        v76 = v42;
        v77 = v41;
        id v78 = v18;
        v84 = v17;
        id v81 = v15;
        id v46 = objc_alloc_init((Class)NSMutableArray);
        v47 = (void *)*((void *)v19 + 2);
        *((void *)v19 + 2) = v46;

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id obj = v45;
        id v48 = [obj countByEnumeratingWithState:&v95 objects:v110 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v88 = *(void *)v96;
          v75 = &v102;
          id v83 = v16;
          do
          {
            for (i = 0; i != v49; i = (char *)i + 1)
            {
              if (*(void *)v96 != v88) {
                objc_enumerationMutation(obj);
              }
              v51 = *(void **)(*((void *)&v95 + 1) + 8 * i);
              v53 = [v51 lastPathComponent];
              unsigned int v54 = [v53 containsString:v16];

              if (v54)
              {
                v55 = [v51 lastPathComponent];
                v56 = [v55 componentsSeparatedByString:@"_"];

                long long v93 = 0u;
                long long v94 = 0u;
                long long v91 = 0u;
                long long v92 = 0u;
                id v57 = v56;
                id v58 = [v57 countByEnumeratingWithState:&v91 objects:v109 count:16];
                float v59 = 0.0;
                if (v58)
                {
                  id v60 = v58;
                  uint64_t v61 = *(void *)v92;
                  while (2)
                  {
                    for (j = 0; j != v60; j = (char *)j + 1)
                    {
                      if (*(void *)v92 != v61) {
                        objc_enumerationMutation(v57);
                      }
                      v63 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
                      if (objc_msgSend(v63, "containsString:", @"version", v75)
                        && [v63 length] == (id)10)
                      {
                        v64 = [v63 substringFromIndex:7];
                        [v64 floatValue];
                        float v59 = v65;

                        goto LABEL_28;
                      }
                    }
                    id v60 = [v57 countByEnumeratingWithState:&v91 objects:v109 count:16];
                    if (v60) {
                      continue;
                    }
                    break;
                  }
LABEL_28:
                  id v16 = v83;
                }

                [v84 floatValue];
                if (v59 >= v66)
                {
                  id v89 = 0;
                  id v90 = 0;
                  [v51 getResourceValue:&v90 forKey:NSURLCreationDateKey error:&v89];
                  id v67 = v90;
                  id v68 = v89;

                  v69 = *((void *)v19 + 1);
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    id v104 = v82;
                    __int16 v105 = 2112;
                    id v106 = v81;
                    __int16 v107 = 2112;
                    id v108 = v67;
                    _os_log_debug_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "Look back %@ end date %@ Creation %@", buf, 0x20u);
                  }
                  [v67 laterDate:v82, v75];
                  id v70 = (id)objc_claimAutoreleasedReturnValue();
                  if (v70 == v67)
                  {
                    id v71 = [v67 laterDate:v81];

                    id v16 = v83;
                    if (v71 == v81)
                    {
                      v86 = *((void *)v19 + 1);
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
                        sub_10001F9D4(v101, v86, v51, v75);
                      }
                      [*((id *)v19 + 2) addObject:v51];
                    }
                  }
                  else
                  {
                  }
                  id v85 = v68;
                }
              }
            }
            id v49 = [obj countByEnumeratingWithState:&v95 objects:v110 count:16];
          }
          while (v49);
        }

        [*((id *)v19 + 2) sortUsingComparator:&stru_100030690];
        if ([*((id *)v19 + 2) count]) {
          v72 = v19;
        }
        else {
          v72 = 0;
        }
        v40 = v72;
        id v14 = v82;
        id v15 = v81;
        id v17 = v84;
        id v18 = v78;
        v73 = v79;
        v42 = v76;
        v41 = v77;
      }
      else
      {
        if (os_log_type_enabled(*((os_log_t *)v19 + 1), OS_LOG_TYPE_ERROR)) {
          sub_10001F96C();
        }
        v40 = 0;
        v73 = v44;
        id v14 = v82;
      }
    }
    else
    {
      v40 = (BIDataEnumerator *)v19;
    }
  }
  else
  {
    BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v32) {
      sub_10001EF98(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    v40 = 0;
  }

  return v40;
}

- (id)nextObject
{
  if (!self->_useCSVs)
  {
    v5 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == %@)", self->_bdcStream];
    v6 = [(NSEnumerator *)self->_enumeratorPPSCollection nextObject];
    if ([(NSString *)self->_bdcStream isEqualToString:@"BDC_SBC"])
    {
      uint64_t v7 = +[NSSet setWithArray:&off_100033418];
      if (v6)
      {
        id v8 = (id)v7;
LABEL_22:

        goto LABEL_23;
      }
      id v48 = (void *)v7;
      startDate = self->_startDate;
      if (startDate)
      {
        id v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          if (!self->_endDate)
          {
            id v8 = v20;
            id v30 = v19;
            goto LABEL_54;
          }
          p_itrEndDate = &self->_itrEndDate;
          itrEndDate = self->_itrEndDate;
          if (itrEndDate)
          {
            v47 = [(NSDate *)self->_itrEndDate dateByAddingTimeInterval:self->_timeIntevalBetweenChunks];
            startDate = v47;
          }
          p_itrStartDate = &self->_itrStartDate;
          objc_storeStrong((id *)&self->_itrStartDate, startDate);
          if (itrEndDate) {

          }
          if ([(NSDate *)*p_itrEndDate isEqualToDate:self->_endDate]) {
            break;
          }
          id v24 = [(NSDate *)*p_itrStartDate laterDate:self->_endDate];
          v25 = *p_itrStartDate;

          if (v24 == v25) {
            break;
          }
          uint64_t v26 = [(NSDate *)*p_itrStartDate dateByAddingTimeInterval:self->_dataChunkingTimeInterval];
          v27 = *p_itrEndDate;
          *p_itrEndDate = (NSDate *)v26;

          id v28 = [(NSDate *)*p_itrEndDate laterDate:self->_endDate];
          endDate = *p_itrEndDate;
          if (v28 == *p_itrEndDate) {
            endDate = self->_endDate;
          }
          objc_storeStrong((id *)&self->_itrEndDate, endDate);

          id v30 = [objc_alloc((Class)NSDateInterval) initWithStartDate:*p_itrStartDate endDate:*p_itrEndDate];
          id v8 = [objc_alloc((Class)PPSTimeSeriesRequest) initWithMetrics:v48 predicate:v5 timeFilter:v30 limitCount:3000 offsetCount:0];

          logger = self->_logger;
          if (!v8)
          {
            if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
              sub_10001FACC();
            }

            v6 = 0;
            id v8 = v30;
            goto LABEL_22;
          }
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            bdcStream = self->_bdcStream;
            v41 = *p_itrStartDate;
            v42 = *p_itrEndDate;
            *(_DWORD *)buf = 138412802;
            v53 = bdcStream;
            __int16 v54 = 2112;
            v55 = v41;
            __int16 v56 = 2112;
            id v57 = v42;
            _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Fetching data from %@ stream in range %@ - %@", buf, 0x20u);
          }
          id v51 = 0;
          BOOL v32 = PerfPowerServicesGetData();
          id v33 = v51;
          if (v33)
          {
            id v46 = v33;
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
              sub_10001F610();
            }

            goto LABEL_56;
          }
          uint64_t v34 = (PPSTimeSeries *)[v32 copy];
          currentPPSCollection = self->_currentPPSCollection;
          self->_currentPPSCollection = v34;

          uint64_t v36 = [(PPSTimeSeries *)self->_currentPPSCollection objectEnumerator];
          enumeratorPPSCollection = self->_enumeratorPPSCollection;
          self->_enumeratorPPSCollection = v36;

          uint64_t v38 = [(NSEnumerator *)self->_enumeratorPPSCollection nextObject];
          if (v38)
          {
            v6 = (void *)v38;

            id v8 = v48;
            goto LABEL_22;
          }
          uint64_t v39 = self->_logger;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            sub_10001FB00(&v49, v50, v39);
          }

          startDate = self->_startDate;
          id v19 = v30;
          uint64_t v20 = v8;
          if (!startDate) {
            goto LABEL_54;
          }
        }
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
          sub_10001FA8C();
        }

        v6 = 0;
        id v8 = v20;
        goto LABEL_22;
      }
      id v8 = 0;
      id v30 = 0;
LABEL_54:
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10001FA58();
      }
LABEL_56:
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10001FB40();
      }
      id v8 = v6;
    }
    v6 = 0;
    goto LABEL_22;
  }
  if (!self->_fileEnumerator)
  {
    v3 = [(NSMutableArray *)self->_fileURLs objectEnumerator];
    fileEnumerator = self->_fileEnumerator;
    self->_fileEnumerator = v3;
  }
  v5 = [(NSEnumerator *)self->_rowEnumerator nextObject];
  if (v5) {
    goto LABEL_5;
  }
  uint64_t v9 = [(NSEnumerator *)self->_fileEnumerator nextObject];
  if (v9)
  {
    v5 = (void *)v9;
    v10 = +[NSString stringWithContentsOfURL:v9 encoding:4 error:0];
    v11 = [v10 componentsSeparatedByString:@"\n"];
    v12 = (NSMutableArray *)[v11 mutableCopy];
    rows = self->_rows;
    self->_rows = v12;

    id v14 = self->_rows;
    if (v14 && [(NSMutableArray *)v14 count])
    {
      [(NSMutableArray *)self->_rows removeObject:&stru_100031730];
      id v15 = [(NSMutableArray *)self->_rows count];
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        sub_10001FB74();
      }
      if ((unint64_t)v15 > 1)
      {
        [(NSMutableArray *)self->_rows removeObjectAtIndex:0];
        v43 = [(NSMutableArray *)self->_rows objectEnumerator];
        rowEnumerator = self->_rowEnumerator;
        self->_rowEnumerator = v43;

        uint64_t v45 = [(NSEnumerator *)self->_rowEnumerator nextObject];

        v5 = (void *)v45;
LABEL_5:
        v6 = [v5 componentsSeparatedByString:@","];
LABEL_23:

        goto LABEL_24;
      }
      id v16 = self->_logger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v53 = (NSString *)v5;
        __int16 v54 = 1024;
        LODWORD(v55) = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Returning early. File %@ Row count %u", buf, 0x12u);
      }
    }

    v6 = 0;
    goto LABEL_23;
  }
  v6 = 0;
LABEL_24:

  return v6;
}

- (id)getBDCDataFromStartDate:(id)a3 toEndDate:(id)a4 forStream:(id)a5 withMetrics:(id)a6 withLimit:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!self->_useCSVs)
  {
    id v17 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == %@)", v14];
    if (([v14 isEqualToString:@"BDC_Daily"] & 1) != 0
      || ([v14 isEqualToString:@"BDC_SBC"] & 1) != 0)
    {
      id v18 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v12 endDate:v13];
      id v19 = [objc_alloc((Class)PPSTimeSeriesRequest) initWithMetrics:v15 predicate:v17 timeFilter:v18 limitCount:a7 offsetCount:0];
      logger = self->_logger;
      if (v19)
      {
        v21 = v19;
        v25 = v17;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v27 = v14;
          __int16 v28 = 2112;
          id v29 = v12;
          __int16 v30 = 2112;
          id v31 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Fetching data for stream %@ in range %@ - %@", buf, 0x20u);
        }
        id v22 = PerfPowerServicesGetData();
        id v23 = 0;
        if (v23)
        {
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
            sub_10001F610();
          }
          id v16 = 0;
        }
        else
        {
          id v16 = v22;
        }

        id v17 = v25;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10001FBF8();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      sub_10001FC2C();
    }
    id v16 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
    sub_10001FC60();
  }
  id v16 = 0;
LABEL_23:

  return v16;
}

- (void)resetStream
{
  fileEnumerator = self->_fileEnumerator;
  self->_fileEnumerator = 0;

  rowEnumerator = self->_rowEnumerator;
  self->_rowEnumerator = 0;

  enumeratorPPSCollection = self->_enumeratorPPSCollection;
  self->_enumeratorPPSCollection = 0;

  itrEndDate = self->_itrEndDate;
  self->_itrEndDate = 0;

  itrStartDate = self->_itrStartDate;
  self->_itrStartDate = 0;
}

- (id)copyFileURLs
{
  return [(NSMutableArray *)self->_fileURLs copy];
}

- (id)getMedianValueForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSSet setWithObject:v4];
  id v6 = [objc_alloc((Class)NSDateInterval) initWithStartDate:self->_startDate endDate:self->_endDate];
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == %@)", self->_bdcStream];
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_10001FDB4();
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    startDate = self->_startDate;
    endDate = self->_endDate;
    *(_DWORD *)buf = 138412802;
    id v39 = v4;
    __int16 v40 = 2112;
    v41 = startDate;
    __int16 v42 = 2112;
    v43 = endDate;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "Fetching BDC metric %@ in range %@ - %@", buf, 0x20u);
  }
  id v11 = [objc_alloc((Class)PPSTimeSeriesRequest) initWithMetrics:v5 predicate:v7 timeFilter:v6 limitCount:100 offsetCount:0];
  if (v11)
  {
    uint64_t v36 = 0;
    id v12 = PerfPowerServicesGetData();
    id v13 = 0;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10001F610();
      }
      id v14 = 0;
    }
    else
    {
      id v28 = v11;
      id v29 = v7;
      id v30 = v6;
      id v31 = v5;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        sub_10001FD4C();
      }
      id v15 = +[NSMutableArray array];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v27 = v12;
      id v16 = v12;
      id v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [*(id *)(*((void *)&v32 + 1) + 8 * i) metricKeysAndValues];
            id v22 = [v21 objectForKeyedSubscript:v4];
            [v15 addObject:v22];
          }
          id v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v18);
      }

      id v23 = sub_1000176D0(v15);
      if (v23
        && (+[NSNull null],
            id v24 = objc_claimAutoreleasedReturnValue(),
            unsigned int v25 = [v23 isEqual:v24],
            v24,
            !v25))
      {
        v5 = v31;
        id v13 = 0;
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
          sub_10001FCC8();
        }
        id v14 = v23;
      }
      else
      {
        v5 = v31;
        id v13 = 0;
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_10001FC94();
        }
        id v14 = 0;
      }
      id v12 = v27;
      id v11 = v28;

      uint64_t v7 = v29;
      id v6 = v30;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)bdcStream
{
  return self->_bdcStream;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)useCSVs
{
  return self->_useCSVs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bdcStream, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_itrEndDate, 0);
  objc_storeStrong((id *)&self->_itrStartDate, 0);
  objc_storeStrong((id *)&self->_enumeratorPPSCollection, 0);
  objc_storeStrong((id *)&self->_currentPPSCollection, 0);
  objc_storeStrong((id *)&self->_rowEnumerator, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_fileEnumerator, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end