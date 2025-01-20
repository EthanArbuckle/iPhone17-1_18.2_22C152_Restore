@interface HRMakeRunnableData
- (HRMakeRunnableData)init;
- (NSDictionary)blockingThreadInfo;
- (NSMutableArray)allBlockingThreadsArray;
- (NSNumber)topBlockingPid;
- (int64_t)findBlockingThreadForTailspin:(id)a3 sampleStore:(id)a4 mainThread:(id)a5 hangStartTime:(unint64_t)a6 hangEndTime:(unint64_t)a7 hangDuration:(int)a8;
- (int64_t)findBlockingThreadFromSampleStore:(id)a3 mainThread:(id)a4 hangStartTime:(unint64_t)a5 hangEndTime:(unint64_t)a6;
- (void)setAllBlockingThreadsArray:(id)a3;
- (void)setBlockingThreadInfo:(id)a3;
- (void)setTopBlockingPid:(id)a3;
- (void)storeOtherBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 sortedThreadsMaxCumlativeTime:(id)a6 blockingTimeByThread:(id)a7 tidToPidDict:(id)a8;
- (void)storeTopBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 pidMostBlockingTime:(id)a6 blockedTime:(id)a7 isHangMainThread:(BOOL)a8;
@end

@implementation HRMakeRunnableData

- (HRMakeRunnableData)init
{
  v6.receiver = self;
  v6.super_class = (Class)HRMakeRunnableData;
  v2 = [(HRMakeRunnableData *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(HRMakeRunnableData *)v2 setAllBlockingThreadsArray:v3];

    v4 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
    [(HRMakeRunnableData *)v2 setTopBlockingPid:v4];

    [(HRMakeRunnableData *)v2 setBlockingThreadInfo:0];
  }
  return v2;
}

- (void)storeTopBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 pidMostBlockingTime:(id)a6 blockedTime:(id)a7 isHangMainThread:(BOOL)a8
{
  BOOL v8 = a8;
  id v20 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%#llx", [v20 unsignedLongLongValue]);
  [v17 setObject:v18 forKeyedSubscript:@"topBlockingThreadId"];

  [v17 setObject:v14 forKeyedSubscript:@"topBlockingPid"];
  v19 = sub_1000109F8(v16, v14);

  [v17 setObject:v19 forKeyedSubscript:@"topBlockingProcess"];
  [v17 setObject:v15 forKeyedSubscript:@"topBlockingTimeMS"];

  [v17 setObject:0 forKeyedSubscript:@"otherBlockingThreads"];
  [v17 setObject:0 forKeyedSubscript:@"nextTopBlockingThreadInfo"];

  if (v8) {
    objc_storeStrong((id *)&self->_topBlockingPid, a6);
  }
  [(NSMutableArray *)self->_allBlockingThreadsArray addObject:v20];
}

- (void)storeOtherBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 sortedThreadsMaxCumlativeTime:(id)a6 blockingTimeByThread:(id)a7 tidToPidDict:(id)a8
{
  id v31 = a3;
  id v37 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v36 = a8;
  id v35 = objc_alloc_init((Class)NSMutableArray);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v39;
    id v32 = v13;
    id v33 = v16;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (([v21 isEqualToNumber:v13] & 1) == 0)
        {
          v22 = [v15 objectForKeyedSubscript:v21];
          double v23 = sub_100003BDC((unint64_t)[v22 cumulativeTime]);

          if (v23 > 50.0)
          {
            v42[0] = @"threadId";
            v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%#llx", [v21 unsignedLongLongValue]);
            v43[0] = v24;
            v42[1] = @"process";
            [v36 objectForKeyedSubscript:v21];
            v26 = id v25 = v15;
            v27 = sub_1000109F8(v37, v26);
            v43[1] = v27;
            v42[2] = @"blockingTimeMS";
            v28 = +[NSNumber numberWithDouble:v23];
            v43[2] = v28;
            +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
            v30 = uint64_t v29 = v19;
            [v35 addObject:v30];

            uint64_t v19 = v29;
            id v15 = v25;
            id v13 = v32;
            id v16 = v33;

            [(NSMutableArray *)self->_allBlockingThreadsArray addObject:v21];
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v18);
  }

  if ([v35 count]) {
    [v31 setObject:v35 forKeyedSubscript:@"otherBlockingThreads"];
  }
}

- (int64_t)findBlockingThreadForTailspin:(id)a3 sampleStore:(id)a4 mainThread:(id)a5 hangStartTime:(unint64_t)a6 hangEndTime:(unint64_t)a7 hangDuration:(int)a8
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 threadId];
  id v14 = v12;
  v149 = v11;
  v152 = [v11 tidToPidDict];
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  int v151 = 0;
  char v16 = 1;
  *(void *)&long long v17 = 134218240;
  long long v143 = v17;
  v145 = v15;
  id v146 = v10;
  id v147 = v13;
  id v155 = v13;
  v144 = v14;
  v153 = v14;
  while (1)
  {
    v154 = v15;
    if ((v16 & 1) == 0) {
      goto LABEL_110;
    }
    if (v151 >= 5)
    {
      p_super = sub_10001B6E0();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v151;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin:  currentNextIterationCount = %d is more than MAX_KTRACE_SESSION_COUNT", buf, 8u);
      }
      goto LABEL_109;
    }
    p_super = objc_alloc_init((Class)NSMutableArray);
    id v19 = v10;
    uint64_t v20 = ktrace_session_create();
    if (!v20)
    {
      v129 = sub_10001B6E0();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v190 = 0;
        _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_session_create failed", v190, 2u);
      }

      goto LABEL_80;
    }
    uint64_t v21 = v20;
    id v22 = v19;
    [v22 UTF8String];
    int v23 = ktrace_set_file();
    if (v23)
    {
      int v130 = v23;
      v131 = sub_10001B6E0();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v190 = 67109120;
        *(_DWORD *)&v190[4] = v130;
        _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_set_file failed with error# = %i", v190, 8u);
      }

      ktrace_session_destroy();
LABEL_80:

LABEL_94:
      int64_t v136 = 2;
      goto LABEL_111;
    }
    ktrace_session_set_event_names_enabled();
    ktrace_set_execnames_enabled();
    ktrace_set_jetsam_coalitions_enabled();
    ktrace_set_thread_groups_enabled();
    ktrace_set_vnode_paths_enabled();
    ktrace_set_thread_cputime_enabled();
    ktrace_set_uuid_map_enabled();
    ktrace_set_remotetime_conversion_enabled();
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100012B24;
    v186 = &unk_100075488;
    unint64_t v24 = a7;
    *((void *)&v187 + 1) = v155;
    unint64_t v188 = a6;
    unint64_t v189 = a7;
    p_super = p_super;
    *(void *)&long long v187 = p_super;
    id v25 = objc_retainBlock(buf);
    int v26 = ktrace_events_single();
    if (v26)
    {
      int v132 = v26;
      v133 = sub_10001B6E0();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_84;
      }
      goto LABEL_85;
    }
    int v27 = ktrace_events_single();
    if (v27)
    {
      int v132 = v27;
      v133 = sub_10001B6E0();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
LABEL_84:
        *(_DWORD *)v190 = 67109376;
        *(_DWORD *)&v190[4] = v132;
        *(_WORD *)&v190[8] = 2048;
        *(void *)&v190[10] = v155;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_events_single failed with error# = %i for threadId= %llx", v190, 0x12u);
      }
LABEL_85:

      ktrace_session_destroy();
LABEL_93:

      goto LABEL_94;
    }
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    *(void *)v176 = _NSConcreteStackBlock;
    *(void *)&v176[8] = 3221225472;
    *(void *)&v176[16] = sub_100012CE8;
    v177 = &unk_1000754B0;
    *(void *)&v178[8] = v21;
    uint64_t v29 = v28;
    *(void *)v178 = v29;
    ktrace_set_completion_handler();
    qos_class_t v30 = qos_class_self();
    id v31 = dispatch_get_global_queue(v30, 0);
    int v32 = ktrace_start();

    if (v32)
    {
      v134 = sub_10001B6E0();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v190 = 67109376;
        *(_DWORD *)&v190[4] = v32;
        *(_WORD *)&v190[8] = 2048;
        *(void *)&v190[10] = v155;
        _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_start failed with error# = %i for threadId= %llx", v190, 0x12u);
      }

      ktrace_session_destroy();
      goto LABEL_92;
    }
    dispatch_time_t v33 = dispatch_time(0, 100000000000);
    if (dispatch_semaphore_wait(v29, v33))
    {
      v135 = sub_10001B6E0();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v190 = 134217984;
        *(void *)&v190[4] = 100000000000;
        _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Timed out (%lld) parsing trace buffer", v190, 0xCu);
      }

      ktrace_end();
LABEL_92:

      goto LABEL_93;
    }

    if (![p_super count]) {
      break;
    }
    v34 = sub_10001B6E0();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = [p_super count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "*** Size of makeRunnableData array %lx,***", buf, 0xCu);
    }

    id v36 = objc_alloc_init((Class)NSMutableDictionary);
    id v175 = v153;
    id v37 = v149;
    id v164 = v36;
    memset(v190, 0, sizeof(v190));
    long long v191 = 0u;
    long long v192 = 0u;
    v150 = p_super;
    long long v38 = p_super;
    long long v39 = v37;
    long long v40 = [v38 reverseObjectEnumerator];
    id v41 = [v40 countByEnumeratingWithState:v190 objects:buf count:16];
    v170 = v37;
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = **(void **)&v190[16];
      uint64_t v171 = **(void **)&v190[16];
      v173 = v40;
      do
      {
        v44 = 0;
        do
        {
          if (**(void **)&v190[16] != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*(void *)&v190[8] + 8 * (void)v44);
          if ((objc_msgSend(v45, "inInterrupt", v143) & 1) == 0
            && (unint64_t)[v45 timestamp] < v24)
          {
            v46 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:](SATimestamp, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:", [v45 timestamp], 0, sub_100003CF0(), 0.0);
            v47 = [v39 sampleTimestamps];
            v48 = [v175 lastThreadStateOnOrBeforeTime:v46 sampleIndex:[v47 count] - 1];

            if (v48)
            {
              id v49 = [v45 timestamp];
              v50 = [v48 endTimestamp];
              if (v49 <= [v50 machAbsTime])
              {
                id v55 = [v45 timestamp];
                v56 = [v48 startTimestamp];
                BOOL v51 = v55 >= [v56 machAbsTime];

                long long v39 = v170;
              }
              else
              {
                BOOL v51 = 0;
              }

              v57 = sub_10001B6E0();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                id v162 = [v45 timestamp];
                id v159 = [v45 madeRunnableByThreadId];
                v166 = [v48 startTimestamp];
                id v157 = [v166 machAbsTime];
                v85 = [v48 endTimestamp];
                id v86 = [v85 machAbsTime];
                id v87 = [v48 startSampleIndex];
                id v88 = [v48 endSampleIndex];
                *(_DWORD *)v176 = 134219778;
                CFStringRef v89 = @"outside";
                if (v51) {
                  CFStringRef v89 = @"inside";
                }
                *(void *)&v176[4] = v162;
                *(_WORD *)&v176[12] = 2048;
                *(void *)&v176[14] = v155;
                *(_WORD *)&v176[22] = 2048;
                v177 = v159;
                *(_WORD *)v178 = 2048;
                *(void *)&v178[2] = v157;
                *(_WORD *)&v178[10] = 2048;
                *(void *)&v178[12] = v86;
                long long v39 = v170;
                __int16 v179 = 2048;
                unint64_t v180 = (unint64_t)v87;
                __int16 v181 = 2048;
                id v182 = v88;
                __int16 v183 = 2112;
                CFStringRef v184 = v89;
                _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx mkRunnableTime, threadState time %llu-%llu (idx %lu - idx %lu) -> %@", v176, 0x52u);

                unint64_t v24 = a7;
              }

              if (v51)
              {
                v58 = [v48 startTimestamp];
                id v59 = [v58 machAbsTime];

                if ((unint64_t)v59 <= a6) {
                  unint64_t v60 = a6;
                }
                else {
                  unint64_t v60 = (unint64_t)v59;
                }
                v61 = (char *)[v45 timestamp];
                v62 = sub_10001B6E0();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                {
                  id v90 = [v45 timestamp];
                  id v91 = [v45 madeRunnableByThreadId];
                  *(_DWORD *)v176 = 134219264;
                  *(void *)&v176[4] = v90;
                  *(_WORD *)&v176[12] = 2048;
                  *(void *)&v176[14] = v155;
                  *(_WORD *)&v176[22] = 2048;
                  v177 = v91;
                  *(_WORD *)v178 = 2048;
                  *(void *)&v178[2] = &v61[-v60];
                  *(_WORD *)&v178[10] = 2048;
                  *(void *)&v178[12] = v61;
                  __int16 v179 = 2048;
                  unint64_t v180 = v60;
                  _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx -> blockedtime = %llu (= %llu - %llu)", v176, 0x3Eu);
                }

                v63 = &v61[-v60];
                if ((unint64_t)v61 >= v60)
                {
                  v165 = v46;
                  v158 = v61;
                  unint64_t v161 = v60;
                  v66 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                  v67 = [v164 objectForKeyedSubscript:v66];

                  if (!v67)
                  {
                    v68 = objc_alloc_init(BlockingThreadElement);
                    v69 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                    [v164 setObject:v68 forKeyedSubscript:v69];
                  }
                  v70 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                  v71 = [v164 objectForKeyedSubscript:v70];
                  unint64_t v72 = (unint64_t)v63;
                  v73 = &v63[(void)[v71 cumulativeTime]];

                  v74 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                  v75 = [v164 objectForKeyedSubscript:v74];
                  v156 = v73;
                  [v75 setCumulativeTime:v73];

                  v76 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                  v77 = [v164 objectForKeyedSubscript:v76];
                  id v78 = [v77 maxBlockingTime];

                  if ((unint64_t)v78 < v72)
                  {
                    v79 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                    v80 = [v164 objectForKeyedSubscript:v79];
                    [v80 setMaxBlockingTime:v72];

                    v81 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                    v82 = [v164 objectForKeyedSubscript:v81];
                    [v82 setStartThreadTime:v161];

                    v83 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                    v84 = [v164 objectForKeyedSubscript:v83];
                    [v84 setEndThreadTime:v158];
                  }
                  v52 = sub_10001B6E0();
                  v46 = v165;
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    id v92 = [v45 timestamp];
                    id v93 = [v45 madeRunnableByThreadId];
                    id v94 = [v45 madeRunnableByThreadId];
                    v95 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v45 madeRunnableByThreadId]);
                    v96 = [v164 objectForKeyedSubscript:v95];
                    id v97 = [v96 maxBlockingTime];
                    *(_DWORD *)v176 = 134219264;
                    *(void *)&v176[4] = v92;
                    *(_WORD *)&v176[12] = 2048;
                    *(void *)&v176[14] = v155;
                    *(_WORD *)&v176[22] = 2048;
                    v177 = v93;
                    *(_WORD *)v178 = 2048;
                    *(void *)&v178[2] = v94;
                    *(_WORD *)&v178[10] = 2048;
                    *(void *)&v178[12] = v156;
                    __int16 v179 = 2048;
                    unint64_t v180 = (unint64_t)v97;
                    _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx => thread %llu total time is up to %llu and max time %llu", v176, 0x3Eu);
                  }
                  unint64_t v24 = a7;
                  long long v39 = v170;
                }
                else
                {
                  v52 = sub_10001B6E0();
                  unint64_t v24 = a7;
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
                  {
                    unint64_t v160 = v60;
                    id v64 = [v45 timestamp];
                    id v65 = [v45 madeRunnableByThreadId];
                    *(_DWORD *)v176 = 134219008;
                    *(void *)&v176[4] = v64;
                    *(_WORD *)&v176[12] = 2048;
                    *(void *)&v176[14] = v155;
                    *(_WORD *)&v176[22] = 2048;
                    v177 = v65;
                    *(_WORD *)v178 = 2048;
                    *(void *)&v178[2] = v61;
                    *(_WORD *)&v178[10] = 2048;
                    *(void *)&v178[12] = v160;
                    _os_log_fault_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx -> NEGATIVE blocked time = %llu - %llu)", v176, 0x34u);
                  }
                }
                goto LABEL_43;
              }
            }
            else
            {
              v52 = sub_10001B6E0();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                id v53 = [v45 timestamp];
                id v54 = [v45 madeRunnableByThreadId];
                *(_DWORD *)v176 = 134218496;
                *(void *)&v176[4] = v53;
                *(_WORD *)&v176[12] = 2048;
                *(void *)&v176[14] = v155;
                *(_WORD *)&v176[22] = 2048;
                v177 = v54;
                _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx mkRunnableTime, threadState is nil", v176, 0x20u);
              }
LABEL_43:
            }
            uint64_t v43 = v171;
            long long v40 = v173;
          }
          v44 = (char *)v44 + 1;
        }
        while (v42 != v44);
        id v98 = [v40 countByEnumeratingWithState:v190 objects:buf count:16];
        id v42 = v98;
      }
      while (v98);
    }

    v99 = sub_10001B6E0();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v164;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: Cumulative Blocking Time By Thread: %@", buf, 0xCu);
    }

    v100 = +[NSNumber numberWithUnsignedLongLong:v155];
    [v164 removeObjectForKey:v100];

    if (![v164 count])
    {
      v139 = sub_10001B6E0();
      v140 = v139;
      if (v155 == v147)
      {
        id v10 = v146;
        p_super = v150;
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: no thread found for hangAppMainThreadId ", buf, 2u);
        }

        int64_t v136 = 4;
        v153 = v175;
        goto LABEL_111;
      }
      id v10 = v146;
      p_super = v150;
      if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v155;
        _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin: no thread found for currentNestedThreadId =%llx ", buf, 0xCu);
      }

LABEL_109:
LABEL_110:
      v141 = v145;
      p_super = &self->_blockingThreadInfo->super;
      self->_blockingThreadInfo = v141;
      int64_t v136 = 5;
      goto LABEL_111;
    }
    v101 = [v164 keysSortedByValueUsingComparator:&stru_100075440];
    v102 = [v164 keysSortedByValueUsingComparator:&stru_100075460];
    v103 = [v102 objectAtIndexedSubscript:0];
    v104 = [v164 objectForKeyedSubscript:v103];
    v105 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_100003BDC((unint64_t)[v104 cumulativeTime]));

    v106 = [v152 objectForKeyedSubscript:v103];
    v107 = [v101 objectAtIndexedSubscript:0];
    id v108 = [v107 unsignedLongLongValue];
    v109 = [v102 objectAtIndexedSubscript:0];
    id v110 = [v109 unsignedLongLongValue];

    BOOL v111 = v108 == v110;
    unint64_t v112 = a7;
    v113 = self;
    if (!v111)
    {
      v114 = sub_10001B6E0();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        v172 = [v102 objectAtIndexedSubscript:0];
        id v163 = [v172 unsignedLongLongValue];
        v167 = [v164 objectForKeyedSubscript:v103];
        v174 = v106;
        id v115 = [v167 cumulativeTime];
        v116 = [v101 objectAtIndexedSubscript:0];
        id v117 = [v116 unsignedLongLongValue];
        v118 = [v101 objectAtIndexedSubscript:0];
        v119 = [v164 objectForKeyedSubscript:v118];
        id v120 = [v119 cumulativeTime];
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = v163;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v115;
        v106 = v174;
        *(_WORD *)&buf[22] = 2048;
        v186 = v117;
        LOWORD(v187) = 2048;
        *(void *)((char *)&v187 + 2) = v120;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: max cumulative Thread id %llx, blocking time %llu, max block time thread id %llx, blocking time %llu ", buf, 0x2Au);

        v113 = self;
        unint64_t v112 = a7;
      }
    }
    id v15 = v154;
    [(HRMakeRunnableData *)v113 storeTopBlockingThreadInfoInBlockingThreadInfo:v154 sampleStore:v170 mostBlockingTimeThreadId:v103 pidMostBlockingTime:v106 blockedTime:v105 isHangMainThread:v155 == v147];
    if ((unint64_t)[v105 unsignedLongLongValue] < 0x33)
    {
      int v126 = 0;
      char v16 = 0;
      v153 = v175;
    }
    else
    {
      [(HRMakeRunnableData *)v113 storeOtherBlockingThreadInfoInBlockingThreadInfo:v154 sampleStore:v170 mostBlockingTimeThreadId:v103 sortedThreadsMaxCumlativeTime:v102 blockingTimeByThread:v164 tidToPidDict:v152];
      if (!v106)
      {
        v127 = sub_10001B6E0();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          id v128 = [v103 unsignedLongLongValue];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v128;
          _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: pid is nil for Thread with most blocking time %llx ", buf, 0xCu);
        }

        char v16 = 0;
        int v126 = 3;
        v153 = v175;
        goto LABEL_69;
      }
      v121 = [v164 objectForKeyedSubscript:v103];
      v122 = [v121 endThreadTime];

      v123 = [v164 objectForKeyedSubscript:v103];
      v124 = [v123 startThreadTime];

      v125 = sub_10001B6E0();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v143;
        *(void *)&buf[4] = v124;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v122;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin: new threadStartTime %llu endTime %llu ", buf, 0x16u);
      }

      if (v122 - v124 <= (v112 - a6) >> 1)
      {
        int v126 = 0;
        char v16 = 0;
        v153 = v175;
        a6 = (unint64_t)v124;
        a7 = (unint64_t)v122;
LABEL_69:
        id v15 = v154;
        goto LABEL_70;
      }
      id v155 = [v103 unsignedLongLongValue];
      v153 = sub_100012488(v170, v152, (uint64_t)v155);

      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      [v154 setObject:v15 forKeyedSubscript:@"nextTopBlockingThreadInfo"];

      int v126 = 0;
      ++v151;
      char v16 = 1;
      a6 = (unint64_t)v124;
      a7 = (unint64_t)v122;
    }
LABEL_70:

    id v10 = v146;
    if (v126)
    {
      v154 = v15;
      goto LABEL_110;
    }
  }
  v137 = sub_10001B6E0();
  v138 = v137;
  if (v155 != v147)
  {
    if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v155;
      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin: 0 mkrunnable tracepoints found for threadId = %llx", buf, 0xCu);
    }

    goto LABEL_109;
  }
  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: 0 mkrunnable tracepoints found for hang main app thread", buf, 2u);
  }

  int64_t v136 = 3;
LABEL_111:

  return v136;
}

- (int64_t)findBlockingThreadFromSampleStore:(id)a3 mainThread:(id)a4 hangStartTime:(unint64_t)a5 hangEndTime:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  v46 = [v8 tidToPidDict];
  id v10 = [v9 threadId];
  id v11 = v9;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = v12;
  id v14 = [v11 threadStates];
  id v15 = [v14 lastObject];

  char v16 = [v15 endTimestamp];
  id v17 = [v16 machAbsTime];

  if ((unint64_t)v17 > a6)
  {
    int64_t v18 = 4;
    id v19 = v13;
    uint64_t v20 = v11;
    goto LABEL_34;
  }
  id obj = v12;
  v44 = v8;
  [v15 endTimestamp];
  v43 = id v42 = v10;
  unsigned int v21 = -1;
  id v22 = v10;
  id v40 = v11;
  id v41 = v13;
  id v23 = v11;
  unint64_t v24 = v15;
  id v25 = v13;
  while (1)
  {
    int v26 = [v24 turnstileInfo];
    int v27 = [v24 waitInfo];
    v47 = v23;
    if (v26 && [v26 blockingTid])
    {
      id v28 = [v26 blockingTid];
LABEL_12:
      uint64_t v29 = (uint64_t)[v26 blockingPid];
      if (!v27) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    if (v27 && [v27 blockingTid])
    {
      id v28 = [v27 blockingTid];
      uint64_t v29 = (uint64_t)[v27 blockingPid];
    }
    else
    {
      if (v26)
      {
        id v28 = 0;
        if ([v26 blockingPid] != -1) {
          goto LABEL_12;
        }
      }
      else
      {
        id v28 = 0;
      }
      uint64_t v29 = 0xFFFFFFFFLL;
      if (!v27) {
        goto LABEL_18;
      }
    }
LABEL_16:
    if ([v27 blockingPid] != -1) {
      uint64_t v29 = (uint64_t)[v27 blockingPid];
    }
LABEL_18:
    if (!v28 && v29 == -1) {
      goto LABEL_27;
    }
    if (v29 == -1)
    {
      qos_class_t v30 = +[NSNumber numberWithUnsignedLongLong:v28];
      id v31 = [v46 objectForKeyedSubscript:v30];
      uint64_t v29 = (uint64_t)[v31 intValue];
    }
    int v32 = +[NSNumber numberWithUnsignedLongLong:v28];
    dispatch_time_t v33 = +[NSNumber numberWithInt:v29];
    [(HRMakeRunnableData *)self storeTopBlockingThreadInfoInBlockingThreadInfo:v25 sampleStore:v44 mostBlockingTimeThreadId:v32 pidMostBlockingTime:v33 blockedTime:&off_10007A688 isHangMainThread:v22 == v42];

    if (!v28)
    {
LABEL_27:
      id v15 = v24;
      uint64_t v20 = v47;
      goto LABEL_29;
    }
    uint64_t v20 = sub_100012488(v44, v46, (uint64_t)v28);

    v34 = [v20 threadStates];
    id v15 = [v34 lastObject];

    id v35 = [v15 startTimestamp];
    if (([v35 le:v43] & 1) == 0) {
      break;
    }
    id v36 = [v15 endTimestamp];
    unsigned __int8 v37 = [v36 ge:v43];

    if ((v37 & 1) == 0) {
      goto LABEL_29;
    }
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    [v25 setObject:v19 forKeyedSubscript:@"nextTopBlockingThreadInfo"];

    ++v21;
    id v22 = v28;
    id v23 = v20;
    unint64_t v24 = v15;
    id v25 = v19;
    if (v21 >= 0x1F) {
      goto LABEL_30;
    }
  }

LABEL_29:
  id v19 = v25;
LABEL_30:
  id v13 = v41;
  if ([v41 count])
  {
    objc_storeStrong((id *)&self->_blockingThreadInfo, obj);
    int64_t v18 = 5;
  }
  else
  {
    int64_t v18 = 4;
  }
  id v8 = v44;
  id v11 = v40;

LABEL_34:
  return v18;
}

- (NSMutableArray)allBlockingThreadsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllBlockingThreadsArray:(id)a3
{
}

- (NSNumber)topBlockingPid
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTopBlockingPid:(id)a3
{
}

- (NSDictionary)blockingThreadInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBlockingThreadInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingThreadInfo, 0);
  objc_storeStrong((id *)&self->_topBlockingPid, 0);

  objc_storeStrong((id *)&self->_allBlockingThreadsArray, 0);
}

@end