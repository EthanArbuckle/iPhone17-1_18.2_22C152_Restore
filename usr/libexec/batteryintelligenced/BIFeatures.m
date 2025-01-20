@interface BIFeatures
+ (BIFeatures)sharedInstance;
- (BIFeatures)init;
- (BOOL)processDataEntry:(id)a3 forBDCDataColumns:(id)a4 atVersion:(id)a5 intoRunningCount:(id *)a6;
- (id)_copyHistogramsOfTypes:(id)a3 withBinners:(id)a4 withParams:(id)a5;
- (id)copyDailyHealthHistoryForFeatures:(id)a3 withFeatureDimensions:(id)a4 withParams:(id)a5;
- (id)copyHistogramsOfTypes:(id)a3 withBinners:(id)a4 withParams:(id)a5;
- (id)copyUsageHistory:(id)a3 withFeatureDimensions:(id)a4 withParams:(id)a5;
- (id)defaultCRateBinner;
- (id)defaultTemperatureBinner;
- (id)defaultUISocBinner;
- (id)getDeviceAgeAtDate:(id)a3 usingManufactureDate:(id)a4;
- (id)getDeviceManufactureDate;
- (id)getTimestampForEntry:(id)a3 atVersion:(id)a4;
- (id)objectForKey:(id)a3 fromDict:(id)a4 withDefaults:(int64_t)a5;
- (id)parseHealthHistoryFromPPSData:(id)a3 withBDCversion:(id)a4 andParams:(id)a5;
- (void)resampleUsingEnumerator:(id)a3 forBDCDataColumns:(id)a4 samplingPeriodSeconds:(unsigned int)a5 aggregationTypes:(id)a6 callBack:(id)a7;
@end

@implementation BIFeatures

+ (BIFeatures)sharedInstance
{
  if (qword_100039668 != -1) {
    dispatch_once(&qword_100039668, &stru_100030868);
  }
  v2 = (void *)qword_100039660;

  return (BIFeatures *)v2;
}

- (BIFeatures)init
{
  v36.receiver = self;
  v36.super_class = (Class)BIFeatures;
  id v2 = [(BIFeatures *)&v36 init];
  if (!v2)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_100020738(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_12;
  }
  uint64_t v3 = sub_100016A74("features");
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  if (!*((void *)v2 + 1))
  {
    BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v25) {
      sub_100020774(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_12;
  }
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.batteryintelligenced.features.sampler", v5);
  v7 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v6;

  if (!*((void *)v2 + 3))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_ERROR)) {
      sub_1000207B0();
    }
LABEL_12:
    v16 = 0;
    goto LABEL_17;
  }
  v8 = sub_100016A68();
  v9 = +[NSFileManager defaultManager];
  NSFileAttributeKey v37 = NSFileProtectionKey;
  NSFileProtectionType v38 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v10 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id v35 = 0;
  unsigned __int8 v11 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v10 error:&v35];
  id v12 = v35;

  if (v11)
  {
    v13 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = &stru_1000308A8;

    v14 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = &stru_1000308C8;

    v15 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = &stru_1000308E8;

    v16 = (BIFeatures *)v2;
  }
  else
  {
    v33 = *((void *)v2 + 1);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1000207E4((uint64_t)v8, (uint64_t)v12, v33);
    }
    v16 = 0;
  }

LABEL_17:
  return v16;
}

- (id)defaultTemperatureBinner
{
  id v2 = objc_retainBlock(self->_defaultTemperatureBinner);

  return v2;
}

- (id)defaultUISocBinner
{
  id v2 = objc_retainBlock(self->_defaultUISocBinner);

  return v2;
}

- (id)defaultCRateBinner
{
  id v2 = objc_retainBlock(self->_defaultCRateBinner);

  return v2;
}

- (id)getTimestampForEntry:(id)a3 atVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 epochTimestamp];
    v8 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000FC70;
      block[3] = &unk_1000305F0;
      id v13 = v7;
      if (qword_100039670 != -1) {
        dispatch_once(&qword_100039670, block);
      }
      v9 = (void *)qword_100039680;
      v10 = [v6 objectAtIndexedSubscript:dword_100039678];
      v8 = [v9 dateFromString:v10];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10002086C();
      }
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)processDataEntry:(id)a3 forBDCDataColumns:(id)a4 atVersion:(id)a5 intoRunningCount:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v41 = a5;
  if (a6)
  {
    if (v11 && [v11 count])
    {
      if (v41)
      {
        v40 = +[BDCSchema sharedBDCSchema];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          id v35 = [v10 metricKeysAndValues];
          v34 = v10;
          NSFileProtectionType v38 = self;
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
            sub_10002093C();
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
              sub_1000209A4(logger, v10);
            }
            BOOL v12 = 0;
            goto LABEL_38;
          }
          NSFileProtectionType v38 = self;
          v34 = v10;
          id v35 = 0;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v33 = v11;
        id obj = v11;
        id v42 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v42)
        {
          int v43 = 0;
          uint64_t v37 = *(void *)v45;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v45 != v37) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              if (isKindOfClass)
              {
                v16 = [v40 bdcNameForColumnName:*(void *)(*((void *)&v44 + 1) + 8 * i) atVersion:v41];
                BOOL v17 = [v35 objectForKeyedSubscript:v16];
                signed int v18 = [v17 intValue];
              }
              else
              {
                v16 = [v34 objectAtIndexedSubscript:objc_msgSend(v40, "columnIndexForColumnName:atVersion:", *(void *)(*((void *)&v44 + 1) + 8 * i), v41)];
                signed int v18 = [v16 intValue];
              }
              uint64_t v19 = &a6[v43 + (int)i];

              p_var3 = (int32x2_t *)&v19->var3;
              int32x2_t v21 = *(int32x2_t *)&v19->var3;
              v19->int var0 = v18;
              p_signed int var1 = &v19->var1;
              signed int var1 = v19->var1;
              if (v18 > var1) {
                signed int var1 = v18;
              }
              *p_signed int var1 = var1;
              p_signed int var2 = &v19->var2;
              signed int var2 = v19->var2;
              if (v18 < var2) {
                signed int var2 = v18;
              }
              *p_signed int var2 = var2;
              int32x2_t *p_var3 = vadd_s32(v21, (int32x2_t)(v18 | 0x100000000));
              uint64_t v26 = v38->_logger;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                int var0 = v19->var0;
                int v28 = *p_var1;
                int v29 = *p_var2;
                __int32 v30 = p_var3->i32[0];
                unsigned int var4 = a6[v43 + (int)i].var4;
                *(_DWORD *)buf = 138413570;
                uint64_t v49 = v15;
                __int16 v50 = 1024;
                int v51 = var0;
                __int16 v52 = 1024;
                int v53 = v28;
                __int16 v54 = 1024;
                int v55 = v29;
                __int16 v56 = 1024;
                __int32 v57 = v30;
                __int16 v58 = 1024;
                unsigned int v59 = var4;
                _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Key:%@ currVal %d maxVal %d minVal %d sum %d count %d", buf, 0x2Au);
              }
            }
            id v42 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
            v43 += (int)i;
          }
          while (v42);
        }

        BOOL v12 = 1;
        id v10 = v34;
        id v11 = v33;
LABEL_38:

        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_100020908();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      sub_1000208D4();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    sub_1000208A0();
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)resampleUsingEnumerator:(id)a3 forBDCDataColumns:(id)a4 samplingPeriodSeconds:(unsigned int)a5 aggregationTypes:(id)a6 callBack:(id)a7
{
  unsigned int v76 = a5;
  id v82 = a3;
  id v11 = a4;
  id v89 = a6;
  v75 = (char *)a7;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  uint64_t v101 = 0;
  id v90 = v11;
  unsigned int v12 = [v11 count];
  v74 = &v60;
  size_t v73 = 4 * v12;
  v92 = (char *)&v60 - ((v73 + 15) & 0x7FFFFFFF0);
  v93 = (os_log_t *)self;
  j__dispatch_assert_queue_barrier((dispatch_queue_t)self->_samplingQueue);
  if (v12 && (id)v12 == [v89 count])
  {
    if (v82)
    {
      id v68 = +[BDCSchema sharedBDCSchema];
      id v13 = [v82 version];
      unsigned int v14 = [v68 maxColumnIndexForBDCStream:@"BDC_SBC" atVersion:v13];

      if ((v14 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(v93[1], OS_LOG_TYPE_ERROR)) {
          sub_100020A9C();
        }
      }
      else
      {
        uint64_t v15 = malloc_type_malloc(20 * (v12 + 1), 0xF0E9629DuLL);
        v99[3] = (uint64_t)v15;
        if (v15)
        {
          v96[0] = _NSConcreteStackBlock;
          v96[1] = 3221225472;
          v96[2] = sub_100010EB4;
          v96[3] = &unk_100030910;
          v96[4] = &v98;
          v96[5] = 20 * (v12 + 1);
          unsigned int v97 = v12;
          v69 = objc_retainBlock(v96);
          v16 = (void (*)(void))*((void *)v69 + 2);
          v66 = v69 + 16;
          v16();
          bzero(v92, v73);
          id v88 = [v82 nextObject];
          id v17 = 0;
          id v91 = 0;
          unint64_t v72 = v14 + 1;
          double v18 = (double)v76;
          v65 = v75 + 16;
          v64 = v95;
          uint64_t v83 = 20 * v12;
          *(void *)&long long v19 = 138412546;
          long long v62 = v19;
          uint64_t v67 = (4 * v14 + 15) & 0x7FFFFFFF0;
          *(void *)&long long v19 = 67109120;
          long long v63 = v19;
          *(void *)&long long v19 = 67110656;
          long long v70 = v19;
          *(void *)&long long v19 = 67109634;
          long long v60 = v19;
          *(void *)&long long v19 = 138412290;
          long long v61 = v19;
          while (1)
          {
            if (!v88)
            {
              __int16 v58 = (void *)v99[3];
              if (v58) {
                free(v58);
              }

              goto LABEL_59;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            id v20 = [v88 count];
            if ((unint64_t)v20 >= v72) {
              break;
            }
            if (os_log_type_enabled(v93[1], OS_LOG_TYPE_ERROR)) {
              sub_100020B10(&v94, v64);
            }
            int32x2_t v21 = [v82 nextObject:v60];
            v81 = v88;
            id v88 = v21;
LABEL_56:
          }
          uint64_t v22 = [v82 version:v60];
          v81 = [(os_log_t *)v93 getTimestampForEntry:v88 atVersion:v22];

          sub_100016AAC(v81, v76);
          id v78 = (id)objc_claimAutoreleasedReturnValue();
          if (!v91) {
            id v91 = v78;
          }
          id v80 = [v82 nextObject];
          if (v80)
          {
            uint64_t v23 = [v82 version];
            uint64_t v24 = [(os_log_t *)v93 getTimestampForEntry:v80 atVersion:v23];

            sub_100016AAC(v24, v76);
            id v77 = (id)objc_claimAutoreleasedReturnValue();
            if (v24 && [v81 isEqualToDate:v24])
            {
              BOOL v25 = v93[1];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v61;
                *(void *)v105 = v81;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Skipping row due to repeated timestamp %@", buf, 0xCu);
              }
LABEL_55:
              id v57 = v80;

              id v88 = v57;
              goto LABEL_56;
            }
          }
          else
          {
            id v77 = 0;
            uint64_t v24 = 0;
          }
          uint64_t v26 = [v82 version];
          unsigned int v27 = [(os_log_t *)v93 processDataEntry:v88 forBDCDataColumns:v90 atVersion:v26 intoRunningCount:v99[3]];

          if (v27 && (!v80 || ([v77 isEqualToDate:v91] & 1) == 0))
          {
            int v28 = v93[1];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v62;
              *(void *)v105 = v17;
              *(_WORD *)&v105[8] = 2112;
              *(void *)&v105[10] = v91;
              _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "END OF SEGMENT prev_ts %@, current_ts %@", buf, 0x16u);
            }
            v71 = &v60;
            v85 = (float *)((char *)&v60 - v67);
            if (!v17)
            {
              int v84 = 1;
LABEL_31:
              id v86 = objc_alloc_init((Class)NSMutableDictionary);
              uint64_t v31 = v93[1];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v63;
                *(_DWORD *)v105 = v84;
                _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Number of segments to fill %d", buf, 8u);
              }
              uint64_t v32 = 0;
              uint64_t v33 = 0;
              while (2)
              {
                v34 = [v89 objectAtIndexedSubscript:v33];
                unsigned int v35 = [v34 unsignedIntValue];

                if (v35)
                {
                  if (v35 == 1)
                  {
                    int v36 = *(_DWORD *)(v99[3] + v32 + 4);
LABEL_40:
                    float v37 = (float)v36;
                  }
                  else
                  {
                    if (v35 == 2)
                    {
                      int v36 = *(_DWORD *)(v99[3] + v32 + 8);
                      goto LABEL_40;
                    }
                    NSFileProtectionType v38 = v93[1];
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      __int16 v54 = [v89 objectAtIndexedSubscript:v33];
                      unsigned int v55 = [v54 unsignedIntValue];
                      *(_DWORD *)buf = v63;
                      *(_DWORD *)v105 = v55;
                      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Unknown resampling aggregation type %u", buf, 8u);
                    }
                    float v37 = *(float *)&v92[4 * v33];
                  }
                }
                else
                {
                  float v37 = (float)*(int *)(v99[3] + v32 + 12) / (float)*(unsigned int *)(v99[3] + v32 + 16);
                }
                v85[v33] = v37;
                if (!v17) {
                  *(float *)&v92[4 * v33] = v37;
                }
                v39 = v93[1];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  v48 = (_DWORD *)(v99[3] + v32);
                  int v50 = v48[3];
                  int v49 = v48[4];
                  double v51 = *(float *)&v92[4 * v33];
                  int v53 = v48 + 1;
                  LODWORD(v48) = v48[1];
                  int v52 = v53[1];
                  *(_DWORD *)buf = v70;
                  *(_DWORD *)v105 = v33;
                  *(_WORD *)&v105[4] = 1024;
                  *(_DWORD *)&v105[6] = v49;
                  *(_WORD *)&v105[10] = 1024;
                  *(_DWORD *)&v105[12] = v50;
                  *(_WORD *)&v105[16] = 2048;
                  *(double *)&v105[18] = v51;
                  __int16 v106 = 2048;
                  double v107 = v37;
                  __int16 v108 = 1024;
                  int v109 = v52;
                  __int16 v110 = 1024;
                  int v111 = (int)v48;
                  _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "idx %d, count %d, sum %d, prevVal %f, currVal %f, min %d, max %d", buf, 0x34u);
                }
                v102[0] = @"NumSegments";
                v40 = +[NSNumber numberWithInt:v84];
                v103[0] = v40;
                v102[1] = @"PrevSegmentVal";
                LODWORD(v41) = *(_DWORD *)&v92[4 * v33];
                id v42 = +[NSNumber numberWithFloat:v41];
                v103[1] = v42;
                v102[2] = @"CurrSegmentVal";
                *(float *)&double v43 = v37;
                long long v44 = +[NSNumber numberWithFloat:v43];
                v103[2] = v44;
                v102[3] = @"PrevSegmentTimeStamp";
                id v45 = v17;
                if (!v17)
                {
                  id v87 = +[NSNull null];
                  id v45 = v87;
                }
                v102[4] = @"CurrSegmentTimeStamp";
                v103[3] = v45;
                v103[4] = v91;
                long long v46 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:5];
                long long v47 = [v90 objectAtIndexedSubscript:v33];
                [v86 setObject:v46 forKeyedSubscript:v47];

                if (!v17) {
                ++v33;
                }
                v32 += 20;
                if (v83 == v32)
                {
                  id v56 = [v86 copy];
                  (*((void (**)(char *, id))v75 + 2))(v75, v56);

                  goto LABEL_54;
                }
                continue;
              }
            }
            [v91 timeIntervalSinceDate:v17];
            int v84 = (int)(v29 / v18);
            if (v84 >= 1) {
              goto LABEL_31;
            }
            __int32 v30 = v93[1];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v60;
              *(_DWORD *)v105 = v84;
              *(_WORD *)&v105[4] = 2112;
              *(void *)&v105[6] = v91;
              *(_WORD *)&v105[14] = 2112;
              *(void *)&v105[16] = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unexpected number of segments %d current_ts %@ prev_ts %@", buf, 0x1Cu);
            }
LABEL_54:

            memcpy(v92, v85, v73);
            (*((void (**)(void))v69 + 2))();
            id v17 = v91;
            id v91 = 0;
          }
          goto LABEL_55;
        }
        unsigned int v59 = v93[1];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_100020AD0((uint64_t)buf, (uint64_t)[v90 count], v59);
        }
      }
    }
    else if (os_log_type_enabled(v93[1], OS_LOG_TYPE_ERROR))
    {
      sub_100020A68();
    }
  }
  else if (os_log_type_enabled(v93[1], OS_LOG_TYPE_ERROR))
  {
    sub_100020A34();
  }
LABEL_59:
  _Block_object_dispose(&v98, 8);
}

- (id)copyHistogramsOfTypes:(id)a3 withBinners:(id)a4 withParams:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = sub_100011084;
  uint64_t v26 = sub_100011094;
  id v27 = 0;
  samplingQueue = self->_samplingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001109C;
  block[3] = &unk_100030938;
  id v20 = v10;
  int32x2_t v21 = &v22;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(samplingQueue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)_copyHistogramsOfTypes:(id)a3 withBinners:(id)a4 withParams:(id)a5
{
  id v8 = a3;
  id v9 = (id *)a4;
  id v10 = a5;
  j__dispatch_assert_queue_barrier((dispatch_queue_t)self->_samplingQueue);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020B40();
    }
    id v18 = 0;
    goto LABEL_97;
  }
  uint64_t v12 = os_transaction_create();
  v79 = self;
  if (v10)
  {
    id v13 = [v10 objectForKeyedSubscript:@"UseCachedFeatures"];
    unsigned int v14 = [v13 BOOLValue];

    id v15 = [v10 objectForKeyedSubscript:@"HistogramStartDate"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v17 = [v10 objectForKeyedSubscript:@"HistogramStartDate"];
    }
    else
    {
      id v17 = 0;
    }
    id v20 = [v10 objectForKeyedSubscript:@"HistogramEndDate"];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if (v21)
    {
      uint64_t v73 = [v10 objectForKeyedSubscript:@"HistogramEndDate"];
    }
    else
    {
      uint64_t v73 = 0;
    }
    uint64_t v22 = [v10 objectForKeyedSubscript:@"DesignCapacity"];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      uint64_t v24 = [v10 objectForKeyedSubscript:@"DesignCapacity"];
      int v19 = [v24 unsignedIntValue];
    }
    else
    {
      int v19 = 0;
    }
  }
  else
  {
    unsigned int v14 = 0;
    int v19 = 0;
    uint64_t v73 = 0;
    id v17 = 0;
  }
  uisocHistogramCache = self->_uisocHistogramCache;
  location = (id *)&self->_uisocHistogramCache;
  uint64_t v67 = (void *)v12;
  id v68 = v10;
  if (uisocHistogramCache && self->_temperatureHistogramCache)
  {
    unsigned int v26 = self->_cRateHistogramCache ? v14 : 0;
    if (v26 == 1)
    {
      v69 = v17;
      locationa = v9;
      id v27 = uisocHistogramCache;
      int v28 = self->_temperatureHistogramCache;
      double v29 = self->_cRateHistogramCache;
      unint64_t v72 = 0;
LABEL_70:
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v77 = v8;
      id v53 = v8;
      id v54 = [v53 countByEnumeratingWithState:&v80 objects:v89 count:16];
      if (!v54) {
        goto LABEL_86;
      }
      id v55 = v54;
      uint64_t v56 = *(void *)v81;
      while (1)
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v81 != v56) {
            objc_enumerationMutation(v53);
          }
          __int16 v58 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          id v59 = [v58 integerValue];
          if (v59 == (id)2)
          {
            long long v61 = v29;
            goto LABEL_81;
          }
          id v60 = v59;
          if (v59 == (id)1)
          {
            long long v61 = v28;
            goto LABEL_81;
          }
          if (!v59)
          {
            long long v61 = v27;
LABEL_81:
            id v62 = [(BIHistogram *)v61 copyHistogramWithNormalizedCounts];
            [v11 setObject:v62 forKeyedSubscript:v58];

            continue;
          }
          logger = v79->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            id v91 = v60;
            _os_log_error_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_ERROR, "Unknown BIFeatureType %lu", buf, 0xCu);
          }
        }
        id v55 = [v53 countByEnumeratingWithState:&v80 objects:v89 count:16];
        if (!v55)
        {
LABEL_86:

          id v18 = v11;
          id v9 = locationa;
          id v8 = v77;
          __int32 v30 = (void *)v73;
          goto LABEL_96;
        }
      }
    }
  }
  __int32 v30 = (void *)v73;
  if (!v73)
  {
    __int32 v30 = +[NSDate now];
    if (v17) {
      goto LABEL_25;
    }
LABEL_64:
    id v17 = [v30 dateByAddingTimeInterval:-2592000.0];
    goto LABEL_25;
  }
  if (!v17) {
    goto LABEL_64;
  }
LABEL_25:
  v69 = v17;
  if (v17
    && v30
    && ([v17 laterDate:v30],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v31 == v17))
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020B74();
    }
  }
  else
  {
    if (v19 || (int v19 = sub_100017268()) != 0)
    {
      uint64_t v32 = self->_logger;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_100020C50(v19, v32);
      }
      int v66 = v19;
      uint64_t v73 = (uint64_t)v30;
      id v78 = objc_alloc_init((Class)NSMutableSet);
      id v76 = objc_alloc_init((Class)NSMutableArray);
      if ([v8 count])
      {
        uint64_t v34 = 0;
        id v27 = 0;
        int v28 = 0;
        double v29 = 0;
        p_cRateHistogramCache = (id *)&self->_cRateHistogramCache;
        p_temperatureHistogramCache = (id *)&self->_temperatureHistogramCache;
        *(void *)&long long v33 = 134217984;
        long long v65 = v33;
        while (1)
        {
          unsigned int v35 = [v8 objectAtIndexedSubscript:v34];
          id v36 = [v35 integerValue];

          if (v36 == (id)2)
          {
            if (v9)
            {
              v40 = [v9 objectAtIndexedSubscript:v34];
              if (v40)
              {
                double v41 = [v9 objectAtIndexedSubscript:v34];
                id v42 = objc_retainBlock(v41);
              }
              else
              {
                id v42 = objc_retainBlock(self->_defaultCRateBinner);
              }
            }
            else
            {
              id v42 = objc_retainBlock(self->_defaultCRateBinner);
            }
            v48 = [[BIHistogram alloc] initWithBinLabelGenerator:v42 allLabels:&off_100033478];

            [v78 addObject:@"amperage"];
            [v76 addObject:&off_100033988];
            objc_storeStrong(p_cRateHistogramCache, v48);

            double v29 = v48;
          }
          else if (v36 == (id)1)
          {
            if (v9)
            {
              double v43 = [v9 objectAtIndexedSubscript:v34];
              if (v43)
              {
                long long v44 = [v9 objectAtIndexedSubscript:v34];
                id v45 = objc_retainBlock(v44);
              }
              else
              {
                id v45 = objc_retainBlock(self->_defaultTemperatureBinner);
              }
            }
            else
            {
              id v45 = objc_retainBlock(self->_defaultTemperatureBinner);
            }
            int v49 = [[BIHistogram alloc] initWithBinLabelGenerator:v45 allLabels:&off_100033460];

            [v78 addObject:@"temp"];
            [v76 addObject:&off_100033988];
            objc_storeStrong(p_temperatureHistogramCache, v49);

            int v28 = v49;
          }
          else
          {
            if (v36)
            {
              long long v46 = self->_logger;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v65;
                id v91 = v36;
                _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Unknown BIFeatureType %lu", buf, 0xCu);
              }
              goto LABEL_61;
            }
            if (v9)
            {
              float v37 = [v9 objectAtIndexedSubscript:v34];
              if (v37)
              {
                NSFileProtectionType v38 = [v9 objectAtIndexedSubscript:v34];
                id v39 = objc_retainBlock(v38);
              }
              else
              {
                id v39 = objc_retainBlock(self->_defaultUISocBinner);
              }
            }
            else
            {
              id v39 = objc_retainBlock(self->_defaultUISocBinner);
            }
            long long v47 = [[BIHistogram alloc] initWithBinLabelGenerator:v39 allLabels:&off_100033448];

            [v78 addObject:@"uisoc"];
            [v76 addObject:&off_100033988];
            objc_storeStrong(location, v47);

            id v27 = v47;
          }
          self = v79;
LABEL_61:
          if ((unint64_t)[v8 count] <= ++v34) {
            goto LABEL_66;
          }
        }
      }
      double v29 = 0;
      int v28 = 0;
      id v27 = 0;
LABEL_66:
      __int32 v30 = (void *)v73;
      int v50 = [[BIDataEnumerator alloc] initWithStartDate:v69 endDate:v73 forBDCStream:@"BDC_SBC" atOrAboveVersion:@"1.3" usingDataFromCSVs:0];
      if (v50)
      {
        double v51 = v50;
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
          sub_100020C10();
        }
        locationa = v9;
        int v52 = [v78 allObjects];
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_100011ACC;
        v84[3] = &unk_100030960;
        v84[4] = self;
        id v27 = v27;
        v85 = v27;
        int v28 = v28;
        id v86 = v28;
        int v88 = v66;
        double v29 = v29;
        id v87 = v29;
        unint64_t v72 = v51;
        [(BIFeatures *)self resampleUsingEnumerator:v51 forBDCDataColumns:v52 samplingPeriodSeconds:900 aggregationTypes:v76 callBack:v84];

        goto LABEL_70;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_100020BDC();
      }

      goto LABEL_95;
    }
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020BA8();
    }
  }
  double v29 = 0;
  int v28 = 0;
  id v27 = 0;
LABEL_95:
  id v18 = 0;
LABEL_96:

  id v10 = v68;
LABEL_97:

  return v18;
}

- (id)getDeviceManufactureDate
{
  unsigned __int16 v9 = 0;
  unsigned __int8 v8 = 0;
  if (sub_1000174D8(&v9, &v8))
  {
    id v3 = objc_alloc_init((Class)NSDateComponents);
    v4 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
    [v3 setCalendar:v4];

    [v3 setYear:v9];
    [v3 setWeekOfYear:v8];
    v5 = [v3 calendar];
    [v3 setWeekday:[v5 firstWeekday]];

    id v6 = [v3 date];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020D30();
    }
    id v6 = 0;
  }

  return v6;
}

- (id)getDeviceAgeAtDate:(id)a3 usingManufactureDate:(id)a4
{
  [a3 timeIntervalSinceDate:a4];
  double v5 = v4 / 31536000.0;

  return +[NSNumber numberWithDouble:v5];
}

- (id)objectForKey:(id)a3 fromDict:(id)a4 withDefaults:(int64_t)a5
{
  id v8 = a3;
  unsigned __int16 v9 = [a4 objectForKeyedSubscript:v8];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = v9;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_100020D64();
    }
    id v10 = +[NSNumber numberWithInteger:a5];
  }
  id v11 = v10;

  return v11;
}

- (id)copyUsageHistory:(id)a3 withFeatureDimensions:(id)a4 withParams:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v75 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = [BIDataEnumerator alloc];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"UsageHistoryStartDate"];
  id v13 = [v10 objectForKeyedSubscript:@"UsageHistoryEndDate"];
  unsigned int v14 = [(BIDataEnumerator *)v11 initWithStartDate:v12 endDate:v13 forBDCStream:@"BDC_SBC" atOrAboveVersion:@"1.3" usingDataFromCSVs:0];

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020DE8();
    }
    id v54 = 0;
    id v55 = v10;
    id v57 = v75;
    goto LABEL_65;
  }
  id v80 = objc_alloc_init((Class)NSMutableArray);
  id v79 = objc_alloc_init((Class)NSMutableArray);
  id v78 = objc_alloc_init((Class)NSMutableArray);
  id v77 = objc_alloc_init((Class)NSMutableArray);
  id v76 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v15 = +[NSSet setWithArray:&off_100033490];
  v16 = [v10 objectForKeyedSubscript:@"UsageHistoryStartDate"];
  id v17 = [v10 objectForKeyedSubscript:@"UsageHistoryEndDate"];
  v74 = v10;
  id v18 = [v10 objectForKeyedSubscript:@"MaxUsageHistoryLenTimesteps"];
  uint64_t v73 = (void *)v15;
  int v19 = -[BIDataEnumerator getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:](v14, "getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:", v16, v17, @"BDC_SBC", v15, [v18 unsignedLongValue]);

  if (!v19 || ![v19 count])
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020E1C();
    }
    goto LABEL_48;
  }
  id v20 = [v19 firstObject];
  char v21 = [(BIDataEnumerator *)v14 version];
  id v22 = [(BIFeatures *)self getTimestampForEntry:v20 atVersion:v21];

  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020E50();
    }
LABEL_48:
    id v54 = 0;
    uint64_t v56 = (void *)v15;
    id v55 = v74;
    id v57 = v75;
    goto LABEL_64;
  }
  id v71 = v8;
  id v72 = v9;
  int v84 = [v22 dateByAddingTimeInterval:-300.0];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v70 = v19;
  id obj = v19;
  id v23 = [obj countByEnumeratingWithState:&v98 objects:v114 count:16];
  long long v81 = v14;
  if (!v23) {
    goto LABEL_30;
  }
  id v24 = v23;
  uint64_t v87 = *(void *)v99;
  do
  {
    BOOL v25 = 0;
    id v82 = v24;
    do
    {
      if (*(void *)v99 != v87) {
        objc_enumerationMutation(obj);
      }
      unsigned int v26 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v25);
      int v28 = [v26 metricKeysAndValues];
      if (!v28)
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_100020F54(&v96, v97);
        }
        goto LABEL_25;
      }
      double v29 = [(BIDataEnumerator *)v14 version];
      __int32 v30 = [(BIFeatures *)self getTimestampForEntry:v26 atVersion:v29];

      if (!v30)
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_100020F84(&v94, v95);
        }
        id v22 = 0;
LABEL_25:

        goto LABEL_26;
      }
      [v30 timeIntervalSinceDate:v84];
      double v32 = v31;
      long long v33 = [(BIFeatures *)self objectForKey:@"Voltage" fromDict:v28 withDefaults:-999];
      uint64_t v34 = [(BIFeatures *)self objectForKey:@"Amperage" fromDict:v28 withDefaults:-999];
      unsigned int v35 = [(BIFeatures *)self objectForKey:@"Temperature" fromDict:v28 withDefaults:-999];
      id v36 = [(BIFeatures *)self objectForKey:@"ChargeAccum" fromDict:v28 withDefaults:-999];
      if (([v33 isEqual:&off_1000339B8] & 1) != 0
        || ([v34 isEqual:&off_1000339B8] & 1) != 0
        || ([v35 isEqual:&off_1000339B8] & 1) != 0
        || [v36 isEqual:&off_1000339B8])
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_100020FB4(&v92, v93);
        }

        id v22 = v30;
      }
      else
      {
        [v80 addObject:v33];
        [v79 addObject:v34];
        [v78 addObject:v35];
        [v77 addObject:v36];
        float v37 = +[NSNumber numberWithDouble:v32 / 60.0];
        [v76 addObject:v37];

        id v22 = v30;

        int v84 = v22;
      }
      unsigned int v14 = v81;
      id v24 = v82;
LABEL_26:
      BOOL v25 = (char *)v25 + 1;
    }
    while (v24 != v25);
    id v38 = [obj countByEnumeratingWithState:&v98 objects:v114 count:16];
    id v24 = v38;
  }
  while (v38);
LABEL_30:

  v112[0] = @"voltageHistory";
  v112[1] = @"currentHistory";
  v113[0] = v80;
  v113[1] = v79;
  v112[2] = @"tempHistory";
  v112[3] = @"qHistory";
  v113[2] = v78;
  v113[3] = v77;
  v112[4] = @"timeSinceLastReadingMins";
  v113[4] = v76;
  id v39 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:5];
  v40 = [v74 objectForKeyedSubscript:@"MaxUsageHistoryLenTimesteps"];
  unint64_t obja = [v40 unsignedIntValue];

  long long v83 = [v80 count];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v41 = v39;
  id v42 = [v41 countByEnumeratingWithState:&v88 objects:v111 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v89;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v89 != v44) {
          objc_enumerationMutation(v41);
        }
        long long v46 = *(unsigned char **)(*((void *)&v88 + 1) + 8 * i);
        long long v47 = [v41 objectForKey:v46, v70];
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          int v49 = logger;
          id v50 = [v47 count];
          *(_DWORD *)buf = 138413058;
          v104 = v46;
          __int16 v105 = 2048;
          id v106 = v50;
          __int16 v107 = 2112;
          __int16 v108 = v46;
          __int16 v109 = 2112;
          unint64_t v110 = (unint64_t)v47;
          _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%@ length: %lu \n %@: %@", buf, 0x2Au);
        }
      }
      id v43 = [v41 countByEnumeratingWithState:&v88 objects:v111 count:16];
    }
    while (v43);
  }

  unint64_t v51 = obja;
  if ((unint64_t)v83 <= obja)
  {
    id v8 = v71;
    id v9 = v72;
  }
  else
  {
    int v52 = self->_logger;
    id v8 = v71;
    id v9 = v72;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v67 = v52;
      id v68 = [v74 objectForKeyedSubscript:@"UsageHistoryStartDate"];
      unint64_t v51 = obja;
      v69 = [v74 objectForKeyedSubscript:@"UsageHistoryEndDate"];
      *(_DWORD *)buf = 134218754;
      v104 = v83;
      __int16 v105 = 2112;
      id v106 = v68;
      __int16 v107 = 2112;
      __int16 v108 = v69;
      __int16 v109 = 2048;
      unint64_t v110 = obja;
      _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Actual usage history length = %lu pulled from start date %@ to end date %@ exceeds model max input length of %lu", buf, 0x2Au);

      id v9 = v72;
    }
    uint64_t v53 = +[BITensor createSubArraysFromArrays:fromStartIndex:withSize:](BITensor, "createSubArraysFromArrays:fromStartIndex:withSize:", v41, &v83[-obja], v51, v70);

    id v41 = (id)v53;
    if (!v53)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_100020E84();
      }
      id v41 = 0;
      id v54 = 0;
      uint64_t v56 = v73;
      id v55 = v74;
      id v57 = v75;
      goto LABEL_63;
    }
  }
  __int16 v58 = [v41 allValues];
  id v59 = [v58 objectAtIndex:0];
  id v60 = [v59 count];

  v102[0] = &off_1000339A0;
  long long v61 = +[NSNumber numberWithUnsignedInteger:v60];
  v102[1] = v61;
  id v62 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v41 count]);
  v102[2] = v62;
  long long v63 = +[NSArray arrayWithObjects:v102 count:3];

  v64 = [v9 objectForKey:@"usage_history_input"];
  long long v65 = +[BITensor create3DMultiArrayFromFeatureArrays:v41 withInputShape:v63 usingFeatureDimensionsDict:v64];

  if (v65)
  {
    id v57 = v75;
    [v75 setObject:v65 forKeyedSubscript:@"usage_history_input"];
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_100020EEC();
    }
    id v54 = v75;
    id v55 = v74;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020EB8();
    }
    id v54 = 0;
    id v55 = v74;
    id v57 = v75;
  }
  uint64_t v56 = v73;

LABEL_63:
  unsigned int v14 = v81;
  int v19 = v70;
LABEL_64:

LABEL_65:
  return v54;
}

- (id)parseHealthHistoryFromPPSData:(id)a3 withBDCversion:(id)a4 andParams:(id)a5
{
  id v52 = a3;
  id v58 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v78[0] = @"nccpHistory";
  v78[1] = @"wraHistory";
  v78[2] = @"qmaxpHistory";
  v78[3] = @"cycleCountHistory";
  v78[4] = @"ageHistory";
  v78[5] = @"timeSinceLastReadingDays";
  +[NSArray arrayWithObjects:v78 count:6];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v73;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v73 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        id v16 = objc_alloc_init((Class)NSMutableArray);
        [v9 setObject:v16 forKeyedSubscript:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v12);
  }

  id v17 = [v8 objectForKey:@"DesignCapacity"];
  unsigned int v18 = [v17 unsignedIntValue];

  unint64_t v51 = v8;
  id v57 = [v8 objectForKey:@"ManufactureDate"];
  int v19 = v52;
  id v20 = [v52 firstObject];
  char v21 = [(BIFeatures *)self getTimestampForEntry:v20 atVersion:v58];

  if (v21)
  {
    id v22 = [v21 dateByAddingTimeInterval:-86400.0];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v52;
    id v55 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v69;
      float v23 = (float)v18;
      id v50 = v67;
      id v54 = self;
LABEL_11:
      uint64_t v24 = 0;
      BOOL v25 = v22;
      id v22 = v21;
      while (1)
      {
        if (*(void *)v69 != v56) {
          objc_enumerationMutation(obj);
        }
        unsigned int v26 = *(void **)(*((void *)&v68 + 1) + 8 * v24);
        int v28 = [v26 metricKeysAndValues];
        if (!v28) {
          break;
        }
        char v21 = [(BIFeatures *)self getTimestampForEntry:v26 atVersion:v58];

        if (!v21)
        {
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
            sub_10002104C();
          }
          char v21 = 0;
LABEL_33:
          int v19 = v52;
LABEL_37:

          id v48 = 0;
          goto LABEL_38;
        }
        context = v27;
        uint64_t v29 = [(BIFeatures *)self getDeviceAgeAtDate:v21 usingManufactureDate:v57];
        if (!v29)
        {
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
            sub_100021080(&v66, v50);
          }

          int v19 = v52;
          goto LABEL_37;
        }
        id v62 = (void *)v29;
        __int32 v30 = v25;
        [v21 timeIntervalSinceDate:v25];
        double v32 = v31;
        long long v33 = [(BIFeatures *)self objectForKey:@"NominalChargeCapacity" fromDict:v28 withDefaults:-999];
        long long v63 = [(BIFeatures *)self objectForKey:@"WeightedRa" fromDict:v28 withDefaults:-999];
        uint64_t v34 = [(BIFeatures *)self objectForKey:@"Qmax0" fromDict:v28 withDefaults:-999];
        long long v61 = [(BIFeatures *)self objectForKey:@"CycleCount" fromDict:v28 withDefaults:-999];
        unsigned int v35 = &off_1000339B8;
        if (([v33 isEqual:&off_1000339B8] & 1) == 0)
        {
          [v33 floatValue];
          *(float *)&double v37 = v36 / v23;
          unsigned int v35 = +[NSNumber numberWithFloat:v37];
        }
        uint64_t v60 = v24;
        v64 = v33;
        id v38 = &off_1000339B8;
        if (([v34 isEqual:&off_1000339B8] & 1) == 0)
        {
          [v34 floatValue];
          *(float *)&double v40 = v39 / v23;
          id v38 = +[NSNumber numberWithFloat:v40];
        }
        [v9 objectForKeyedSubscript:@"nccpHistory"];
        id v41 = v59 = v34;
        [v41 addObject:v35];

        id v42 = [v9 objectForKeyedSubscript:@"wraHistory"];
        [v42 addObject:v63];

        id v43 = [v9 objectForKeyedSubscript:@"qmaxpHistory"];
        [v43 addObject:v38];

        uint64_t v44 = [v9 objectForKeyedSubscript:@"cycleCountHistory"];
        [v44 addObject:v61];

        id v45 = [v9 objectForKeyedSubscript:@"ageHistory"];
        [v45 addObject:v62];

        long long v46 = [v9 objectForKeyedSubscript:@"timeSinceLastReadingDays"];
        long long v47 = +[NSNumber numberWithDouble:v32 / 86400.0];
        [v46 addObject:v47];

        id v22 = v21;

        ++v24;
        BOOL v25 = v22;
        self = v54;
        if (v55 == (id)(v60 + 1))
        {
          char v21 = v22;
          int v19 = v52;
          id v55 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
          if (v55) {
            goto LABEL_11;
          }
          goto LABEL_23;
        }
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_100021018();
      }
      char v21 = v22;
      goto LABEL_33;
    }
LABEL_23:

    id v48 = v9;
    BOOL v25 = v22;
LABEL_38:
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_100020FE4();
    }
    id v48 = 0;
  }

  return v48;
}

- (id)copyDailyHealthHistoryForFeatures:(id)a3 withFeatureDimensions:(id)a4 withParams:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [v10 objectForKeyedSubscript:@"HealthHistoryStartDate"];
  uint64_t v13 = [v10 objectForKeyedSubscript:@"HealthHistoryEndDate"];
  id v14 = [v12 compare:v13];

  if (v14 != (id)1)
  {
    v95 = (os_log_t *)self;
    uint64_t v15 = [BIDataEnumerator alloc];
    id v16 = [v10 objectForKeyedSubscript:@"HealthHistoryStartDate"];
    id v17 = [v10 objectForKeyedSubscript:@"HealthHistoryEndDate"];
    unsigned int v18 = [(BIDataEnumerator *)v15 initWithStartDate:v16 endDate:v17 forBDCStream:@"BDC_Daily" atOrAboveVersion:@"1.3" usingDataFromCSVs:0];

    if (!v18)
    {
      if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR)) {
        sub_1000210E4();
      }
      goto LABEL_9;
    }
    v93 = v11;
    int v19 = [v10 objectForKey:@"DesignCapacity"];
    if (v19)
    {
      id v20 = [v10 objectForKey:@"DesignCapacity"];
      id v21 = [v20 unsignedIntValue];
    }
    else
    {
      id v21 = (id)sub_100017268();
    }

    if (!v21)
    {
      if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR)) {
        sub_100021118();
      }

      id v22 = 0;
      goto LABEL_81;
    }
    float v23 = [v10 objectForKey:@"ManufactureDate"];
    char v92 = v10;
    if (v23)
    {
      uint64_t v24 = [v10 objectForKey:@"ManufactureDate"];
      BOOL v25 = v95;
    }
    else
    {
      BOOL v25 = v95;
      uint64_t v24 = [(os_log_t *)v95 getDeviceManufactureDate];
    }

    unsigned int v26 = v25[1];
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_1000214FC();
      }
      id v27 = [v10 objectForKeyedSubscript:@"HealthHistoryStartDate"];
      int v28 = [v10 objectForKeyedSubscript:@"HealthHistoryEndDate"];
      uint64_t v29 = [(BIDataEnumerator *)v18 getBDCDataFromStartDate:v27 toEndDate:v28 forStream:@"BDC_Daily" withMetrics:0 withLimit:1000];

      if (v29 && [v29 count])
      {
        long long v90 = v24;
        long long v91 = v29;
        __int32 v30 = v95[1];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_100021464(v30, v29);
        }
        id v88 = v9;
        long long v89 = v18;
        double v31 = [(BIDataEnumerator *)v18 version];
        v122[0] = @"DesignCapacity";
        double v32 = +[NSNumber numberWithUnsignedInt:v21];
        v122[1] = @"ManufactureDate";
        v123[0] = v32;
        v123[1] = v90;
        long long v33 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
        uint64_t v34 = [(os_log_t *)v95 parseHealthHistoryFromPPSData:v29 withBDCversion:v31 andParams:v33];

        if (os_log_type_enabled(v95[1], OS_LOG_TYPE_DEBUG)) {
          sub_1000213FC();
        }
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v35 = v34;
        id v36 = [v35 countByEnumeratingWithState:&v104 objects:v121 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v105;
          while (2)
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v105 != v38) {
                objc_enumerationMutation(v35);
              }
              double v40 = [v35 objectForKey:*(void *)(*((void *)&v104 + 1) + 8 * i)];
              id v41 = [v40 count];

              if (!v41)
              {
                long long v71 = v95[1];
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
                  sub_10002136C(v71, v29);
                }
                id v22 = 0;
                id v43 = v35;
                id v9 = v88;
                goto LABEL_70;
              }
            }
            id v37 = [v35 countByEnumeratingWithState:&v104 objects:v121 count:16];
            if (v37) {
              continue;
            }
            break;
          }
        }

        id v42 = objc_alloc_init((Class)NSMutableDictionary);
        v119[0] = &off_1000339D0;
        v119[1] = &off_1000339E8;
        v120[0] = @"nccpHistory";
        v120[1] = @"wraHistory";
        v119[2] = &off_100033A00;
        v119[3] = &off_100033A18;
        v120[2] = @"qmaxpHistory";
        v120[3] = @"cycleCountHistory";
        v119[4] = &off_100033A30;
        v119[5] = &off_100033A48;
        v120[4] = @"ageHistory";
        v120[5] = @"timeSinceLastReadingDays";
        id v43 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:6];
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v85 = v8;
        id v44 = v8;
        id v45 = [v44 countByEnumeratingWithState:&v100 objects:v118 count:16];
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = *(void *)v101;
          do
          {
            for (j = 0; j != v46; j = (char *)j + 1)
            {
              if (*(void *)v101 != v47) {
                objc_enumerationMutation(v44);
              }
              uint64_t v49 = *(void *)(*((void *)&v100 + 1) + 8 * (void)j);
              id v50 = [v43 objectForKeyedSubscript:v49];
              unint64_t v51 = [v35 objectForKeyedSubscript:v50];
              id v52 = [v43 objectForKeyedSubscript:v49];
              [v42 setObject:v51 forKeyedSubscript:v52];
            }
            id v46 = [v44 countByEnumeratingWithState:&v100 objects:v118 count:16];
          }
          while (v46);
        }

        if (os_log_type_enabled(v95[1], OS_LOG_TYPE_DEBUG)) {
          sub_100021304();
        }
        uint64_t v53 = [v92 objectForKeyedSubscript:@"MaxHealthHistoryLenDays"];
        unint64_t v87 = [v53 unsignedIntValue];

        id v54 = [v44 objectAtIndex:0];
        id v55 = [v43 objectForKeyedSubscript:v54];
        uint64_t v56 = [v42 objectForKey:v55];
        id v86 = (char *)[v56 count];

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v57 = v42;
        id v58 = [v57 countByEnumeratingWithState:&v96 objects:v117 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v60 = *(void *)v97;
          do
          {
            for (k = 0; k != v59; k = (char *)k + 1)
            {
              if (*(void *)v97 != v60) {
                objc_enumerationMutation(v57);
              }
              id v62 = *(char **)(*((void *)&v96 + 1) + 8 * (void)k);
              long long v63 = [v57 objectForKey:v62];
              v64 = v95[1];
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                long long v65 = v64;
                id v66 = [v63 count];
                *(_DWORD *)buf = 138413058;
                unint64_t v110 = v62;
                __int16 v111 = 2048;
                id v112 = v66;
                __int16 v113 = 2112;
                v114 = v62;
                __int16 v115 = 2112;
                unint64_t v116 = (unint64_t)v63;
                _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%@ length: %lu \n %@: %@", buf, 0x2Au);
              }
            }
            id v59 = [v57 countByEnumeratingWithState:&v96 objects:v117 count:16];
          }
          while (v59);
        }

        unint64_t v67 = v87;
        if ((unint64_t)v86 <= v87)
        {
          id v8 = v85;
          id v9 = v88;
        }
        else
        {
          long long v68 = v95[1];
          id v8 = v85;
          id v9 = v88;
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            log = v68;
            int v84 = [v92 objectForKeyedSubscript:@"HealthHistoryStartDate"];
            unint64_t v67 = v87;
            long long v83 = [v92 objectForKeyedSubscript:@"HealthHistoryEndDate"];
            *(_DWORD *)buf = 134218754;
            unint64_t v110 = v86;
            __int16 v111 = 2112;
            id v112 = v84;
            __int16 v113 = 2112;
            v114 = v83;
            __int16 v115 = 2048;
            unint64_t v116 = v87;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Actual daily history length = %lu pulled from start date %@ to end date %@ exceeds model max input length of %lu", buf, 0x2Au);
          }
          long long v69 = +[BITensor createSubArraysFromArrays:v57 fromStartIndex:&v86[-v87] withSize:v67];
          id v70 = [v69 copy];

          id v57 = v70;
          if (!v70)
          {
            if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR)) {
              sub_1000211EC();
            }
            id v22 = 0;
LABEL_70:
            id v10 = v92;
            long long v72 = v90;
            goto LABEL_80;
          }
        }
        long long v73 = [v57 allValues];
        long long v74 = [v73 objectAtIndex:0];
        id v75 = [v74 count];

        v108[0] = &off_1000339A0;
        id v76 = +[NSNumber numberWithUnsignedInteger:v75];
        v108[1] = v76;
        id v77 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v57 count]);
        v108[2] = v77;
        id v78 = +[NSArray arrayWithObjects:v108 count:3];

        id v79 = [v9 objectForKey:@"daily_history_input"];
        id v80 = +[BITensor create3DMultiArrayFromFeatureArrays:v57 withInputShape:v78 usingFeatureDimensionsDict:v79];

        if (v80)
        {
          [v93 setObject:v80 forKeyedSubscript:@"daily_history_input"];
          long long v81 = v95[1];
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
            sub_100021254(v81, v57);
          }
          id v22 = v93;
          long long v72 = v90;
        }
        else
        {
          long long v72 = v90;
          if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR)) {
            sub_100021220();
          }
          id v22 = 0;
        }

        id v10 = v92;
LABEL_80:

        goto LABEL_81;
      }
      if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR)) {
        sub_100021180();
      }
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002114C();
      }
    }
    id v22 = 0;
    id v10 = v92;
LABEL_81:
    id v11 = v93;
    goto LABEL_82;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
    sub_1000210B0();
  }
LABEL_9:
  id v22 = 0;
LABEL_82:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCyclesCache, 0);
  objc_storeStrong((id *)&self->_startAgeCache, 0);
  objc_storeStrong((id *)&self->_startQMaxpCache, 0);
  objc_storeStrong((id *)&self->_startWRaCache, 0);
  objc_storeStrong((id *)&self->_startNCCPCache, 0);
  objc_storeStrong((id *)&self->_cRateHistogramCache, 0);
  objc_storeStrong((id *)&self->_temperatureHistogramCache, 0);
  objc_storeStrong((id *)&self->_uisocHistogramCache, 0);
  objc_storeStrong(&self->_defaultCRateBinner, 0);
  objc_storeStrong(&self->_defaultTemperatureBinner, 0);
  objc_storeStrong(&self->_defaultUISocBinner, 0);
  objc_storeStrong((id *)&self->_samplingQueue, 0);
  objc_storeStrong((id *)&self->_storageLocation, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end