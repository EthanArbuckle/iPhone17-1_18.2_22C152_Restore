@interface CMHealthColdStorageCompanionSyncService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CMHealthColdStorageCompanionSyncService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)receiveColdStorageDataUpdate:(id)a3;
- (void)resetAnalytics;
- (void)resetCoreAnalyticsTimer;
- (void)sendAnalytics;
- (void)setUpAggregationOnTimer;
@end

@implementation CMHealthColdStorageCompanionSyncService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102485B08 != -1) {
    dispatch_once(&qword_102485B08, &stru_102315338);
  }
  return (id)qword_102485B00;
}

- (CMHealthColdStorageCompanionSyncService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMHealthColdStorageCompanionSyncService;
  return [(CMHealthColdStorageCompanionSyncService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CMHealthColdStorageCompanionSyncServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CMHealthColdStorageCompanionSyncServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_102485B18 != -1) {
    dispatch_once(&qword_102485B18, &stru_102315358);
  }
  return byte_102485B10;
}

- (void)beginService
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_102315378);
  }
  objc_super v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CMHealthColdStorageCompanionSyncService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  LOBYTE(v7) = 0;
  sub_100491C40((unsigned __int8 *)&v7, buf);
  shared_ptr<CLHRRecoveryInputHRRecorderDb> v4 = *(shared_ptr<CLHRRecoveryInputHRRecorderDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fInputHRDb.__cntrl_;
  self->fInputHRDb = v4;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  operator new();
}

- (void)endService
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_102315378);
  }
  objc_super v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CMHealthColdStorageCompanionSyncService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService endService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }
  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  if (fCoreAnalyticsTimer)
  {
    dispatch_source_cancel(fCoreAnalyticsTimer);
    dispatch_release((dispatch_object_t)self->fCoreAnalyticsTimer);
    self->fCoreAnalyticsTimer = 0;
  }
}

- (void)setUpAggregationOnTimer
{
  sub_10048D634((void **)self->fInputHRAggregator.__ptr_.__value_, 604800.0);
  sub_10048D8EC((void **)self->fInputWRAggregator.__ptr_.__value_, 604800.0);
  sub_10048DBA4((void **)self->fSessionAggregator.__ptr_.__value_, 15552000.0);
  sub_1005D2CA0((void **)self->fElevationGradeAggregator.__ptr_.__value_, 604800.0);
  int v10 = 86400;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v8);
  sub_10006EF84(v8, "HRRecoveryAggregationTimeInterval", &v10);
  if (v9) {
    sub_1000DB0A0(v9);
  }
  uint64_t v4 = 1000000000 * v10;
  unint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CMHealthColdStorageCompanionSyncService universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v5;
  dispatch_source_set_timer((dispatch_source_t)v5, 0, v4, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10117B630;
  v7[3] = &unk_10229FED8;
  v7[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v7);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)receiveColdStorageDataUpdate:(id)a3
{
  if (!a3)
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    v14 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[CompanionSyncService] received empty message from watch", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_102;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    LOWORD(v90) = 0;
    goto LABEL_136;
  }
  if ([a3 objectForKeyedSubscript:@"HRRecoveryInputHRKey"])
  {
    id v5 = [a3 objectForKeyedSubscript:@"HRRecoveryInputHRKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(buf, 0, sizeof(buf));
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v82 objects:v103 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v83;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v83 != v8) {
              objc_enumerationMutation(v5);
            }
            int v10 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            *(void *)buf = [v10 recordId];
            [v10 startTime];
            *(void *)&buf[8] = v11;
            [v10 hr];
            *(void *)&long long v105 = v12;
            [v10 hrConfidence];
            *((void *)&v105 + 1) = v13;
            sub_101437110((uint64_t)self->fInputHRDb.__ptr_, (uint64_t)buf);
          }
          id v7 = [v5 countByEnumeratingWithState:&v82 objects:v103 count:16];
        }
        while (v7);
      }
      self->fStats.numRecordsSync_HRRIHH += [v5 count];
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      v15 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed HRRecoveryInputHRKey %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_102315378);
        }
        LODWORD(v90) = 138412290;
        *(void *)((char *)&v90 + 4) = v5;
        v58 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v58);
        if (v58 != (char *)buf) {
          free(v58);
        }
      }
      ++self->fStats.numErrors;
    }
  }
  if ([a3 objectForKeyedSubscript:@"HRRecoveryInputWRKey"])
  {
    id v16 = [a3 objectForKeyedSubscript:@"HRRecoveryInputWRKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(buf, 0, sizeof(buf));
      DWORD2(v105) = 0;
      *(void *)&long long v105 = 0;
      long long v106 = 0uLL;
      LODWORD(v107) = 3;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v17 = [v16 countByEnumeratingWithState:&v78 objects:v102 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v79;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v79 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
            *(void *)buf = [v21 recordId];
            [v21 startTime];
            *(void *)&buf[8] = v22;
            [v21 mets];
            *(void *)&long long v105 = v23;
            DWORD2(v105) = [v21 gradeType];
            [v21 grade];
            *(void *)&long long v106 = v24;
            [v21 userMets];
            *((void *)&v106 + 1) = v25;
            LODWORD(v107) = [v21 userMetsSource];
            sub_1010EE5C4((uint64_t)self->fInputWRDb.__ptr_, (uint64_t)buf);
          }
          id v18 = [v16 countByEnumeratingWithState:&v78 objects:v102 count:16];
        }
        while (v18);
      }
      self->fStats.numRecordsSync_HRRIWH += [v16 count];
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      v26 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed HRRecoveryInputWRKey %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_102315378);
        }
        LODWORD(v90) = 138412290;
        *(void *)((char *)&v90 + 4) = v16;
        v59 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v59);
        if (v59 != (char *)buf) {
          free(v59);
        }
      }
      ++self->fStats.numErrors;
    }
  }
  if ([a3 objectForKeyedSubscript:@"HRRecoverySessionKey"])
  {
    id v27 = [a3 objectForKeyedSubscript:@"HRRecoverySessionKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v28 = [v27 countByEnumeratingWithState:&v74 objects:v101 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v75;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v75 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
            if (v32)
            {
              [v32 recoverySession];
            }
            else
            {
              long long v113 = 0u;
              long long v112 = 0u;
              long long v111 = 0u;
              long long v110 = 0u;
              long long v109 = 0u;
              long long v108 = 0u;
              long long v107 = 0u;
              long long v106 = 0u;
              long long v105 = 0u;
              *(_OWORD *)buf = 0u;
            }
            sub_100B422AC((uint64_t)self->fSessionDb.__ptr_, (uint64_t)buf);
          }
          id v29 = [v27 countByEnumeratingWithState:&v74 objects:v101 count:16];
        }
        while (v29);
      }
      self->fStats.numRecordsSync_HRRSH += [v27 count];
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      v33 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed HRRecoverySessionKey %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_102315378);
        }
        LODWORD(v90) = 138412290;
        *(void *)((char *)&v90 + 4) = v27;
        v60 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v60);
        if (v60 != (char *)buf) {
          free(v60);
        }
      }
      ++self->fStats.numErrors;
    }
  }
  if ([a3 objectForKeyedSubscript:@"PredictedWalkDistanceBoutKey"])
  {
    id v34 = [a3 objectForKeyedSubscript:@"PredictedWalkDistanceBoutKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LODWORD(v90) = 0;
      double v91 = 0.0;
      *((void *)&v90 + 1) = 0;
      unsigned int v92 = 0;
      uint64_t v95 = 0;
      uint64_t v93 = 0;
      uint64_t v94 = 0;
      unsigned int v96 = 0;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v100 = 0;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v35 = [v34 countByEnumeratingWithState:&v70 objects:v89 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v71;
        do
        {
          for (m = 0; m != v36; m = (char *)m + 1)
          {
            if (*(void *)v71 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = *(void **)(*((void *)&v70 + 1) + 8 * (void)m);
            LODWORD(v90) = [v39 recordId];
            [v39 startTime];
            *((void *)&v90 + 1) = v40;
            [v39 endTime];
            double v91 = v41;
            unsigned int v92 = [v39 stepCount];
            [v39 distance];
            uint64_t v93 = v42;
            [v39 activeTime];
            uint64_t v94 = v43;
            LODWORD(v95) = [v39 elevationAscended];
            HIDWORD(v95) = [v39 elevationDescended];
            unsigned int v96 = [v39 stepCountGPS];
            [v39 distanceGPS];
            *(void *)&long long v97 = v44;
            DWORD2(v97) = [v39 boutType];
            (*(void (**)(CLPredictedWalkDistanceBoutRecorderDb *, long long *))(*(void *)self->fPredWalkDistanceBoutDb.__ptr_
                                                                                        + 160))(self->fPredWalkDistanceBoutDb.__ptr_, &v90);
          }
          id v36 = [v34 countByEnumeratingWithState:&v70 objects:v89 count:16];
        }
        while (v36);
      }
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      v45 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "[CompanionSyncService] Received cold storage data of type PredictedWalkDistanceBoutKey", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_102315378);
        }
        LOWORD(v86) = 0;
        v61 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v61);
        if (v61 != (char *)buf) {
          free(v61);
        }
      }
      self->fStats.numRecordsSync_PWDBH += [v34 count];
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      v46 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed PredictedWalkDistanceBoutKey %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_102315378);
        }
        LODWORD(v90) = 138412290;
        *(void *)((char *)&v90 + 4) = v34;
        v62 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v62);
        if (v62 != (char *)buf) {
          free(v62);
        }
      }
      ++self->fStats.numErrors;
    }
  }
  if ([a3 objectForKeyedSubscript:@"ElevationGradeKey"])
  {
    id v47 = [a3 objectForKeyedSubscript:@"ElevationGradeKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v90 = 0uLL;
      double v91 = 0.0;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v48 = [v47 countByEnumeratingWithState:&v66 objects:v88 count:16];
      if (v48)
      {
        id v49 = v48;
        uint64_t v50 = *(void *)v67;
        do
        {
          for (n = 0; n != v49; n = (char *)n + 1)
          {
            if (*(void *)v67 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v66 + 1) + 8 * (void)n);
            *(void *)&long long v90 = [v52 recordId];
            [v52 startTime];
            *((void *)&v90 + 1) = v53;
            [v52 fractionalGrade];
            double v91 = v54;
            sub_10117CAE4(self->fElevationGradeRecorderDb.__ptr_, (uint64_t)&v90, 0);
          }
          id v49 = [v47 countByEnumeratingWithState:&v66 objects:v88 count:16];
        }
        while (v49);
      }
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      v55 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
      {
        id v56 = [v47 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "[CompanionSyncService] Received cold storage data of type ElevationGradeKey, count: %lu", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_102315378);
        }
        id v63 = [v47 count];
        int v86 = 134217984;
        id v87 = v63;
        v64 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v64);
        if (v64 != (char *)buf) {
          free(v64);
        }
      }
      self->fStats.numRecordsSync_EGH += [v47 count];
      goto LABEL_103;
    }
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    v57 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v47;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed ElevationGradeKey %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0))
    {
LABEL_102:
      ++self->fStats.numErrors;
      goto LABEL_103;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    LODWORD(v90) = 138412290;
    *(void *)((char *)&v90 + 4) = v47;
LABEL_136:
    v65 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v65);
    if (v65 != (char *)buf) {
      free(v65);
    }
    goto LABEL_102;
  }
LABEL_103:
  [(CMHealthColdStorageCompanionSyncService *)self resetCoreAnalyticsTimer];
}

- (void)resetCoreAnalyticsTimer
{
  [self universe].silo
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_102315378);
  }
  uint64_t v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v8 = 60000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Reset CoreAnalytics timer to fire in %{public}lld seconds", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService resetCoreAnalyticsTimer]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  dispatch_time_t v5 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(fCoreAnalyticsTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)sendAnalytics
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v8[0] = @"NumErrors";
    v9[0] = +[NSNumber numberWithInt:self->fStats.numErrors];
    v8[1] = @"NumRecordsSync_EGH";
    v9[1] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_EGH];
    v8[2] = @"NumRecordsSync_HRRIHH";
    v9[2] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_HRRIHH];
    v8[3] = @"NumRecordsSync_HRRIWH";
    v9[3] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_HRRIWH];
    v8[4] = @"NumRecordsSync_HRRSH";
    v9[4] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_HRRSH];
    v8[5] = @"NumRecordsSync_PWDBH";
    v9[5] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_PWDBH];
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:6];
    AnalyticsSendEventLazy();
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    uint64_t v4 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sent Core Analytics event: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService sendAnalytics]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CMHealthColdStorageCompanionSyncService *)self resetAnalytics];
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_102315378);
    }
    dispatch_time_t v5 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_102315378);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService sendAnalytics]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)resetAnalytics
{
  *(void *)&self->fStats.numRecordsSync_HRRIHH = 0;
  *(void *)&self->fStats.numRecordsSync_HRRSH = 0;
  *(void *)&self->fStats.numErrors = 0;
}

- (void).cxx_destruct
{
  sub_1003B273C((uint64_t *)&self->fElevationGradeAggregator, 0);
  cntrl = self->fElevationGradeRecorderDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->fPredWalkDistanceBoutDb.__cntrl_;
  if (v4) {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
  sub_1003B273C((uint64_t *)&self->fSessionAggregator, 0);
  dispatch_time_t v5 = self->fSessionDb.__cntrl_;
  if (v5) {
    sub_1000DB0A0((std::__shared_weak_count *)v5);
  }
  sub_1003B273C((uint64_t *)&self->fInputWRAggregator, 0);
  id v6 = self->fInputWRDb.__cntrl_;
  if (v6) {
    sub_1000DB0A0((std::__shared_weak_count *)v6);
  }
  sub_1003B273C((uint64_t *)&self->fInputHRAggregator, 0);
  id v7 = self->fInputHRDb.__cntrl_;
  if (v7)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  return self;
}

@end