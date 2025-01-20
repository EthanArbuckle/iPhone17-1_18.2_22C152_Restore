@interface CLMeanSeaLevelPressureEstimator
- (BOOL)firstRefreshAfterVisit;
- (BOOL)gaussianProcess:(id)a3 withMslpArray:(id)a4 withType:(unint64_t)a5;
- (BOOL)getLastPressureSample:(double *)a3;
- (BOOL)inVisitStatus;
- (BOOL)isValidMslp:(id)a3;
- (BOOL)updateHistoricalMslpArray:(id)a3 from:(int)a4;
- (BOOL)updateLastSampleInMeanSeaLevelPressureArray;
- (CLMeanSeaLevelPressureEstimator)initWithContextManager:(id)a3 andUniverse:(id)a4 andDelegate:(id)a5 andBuffers:(void *)a6;
- (double)cumulativeStartTime;
- (double)currentLatitude;
- (double)currentLongitude;
- (double)currentPressure;
- (double)exitVisitTimestamp;
- (double)lastRefreshTimestamp;
- (double)maxPressure;
- (double)minPressure;
- (id).cxx_construct;
- (id)getEstimatedMeanSeaLevelPressure;
- (int)getMeanSeaLevelArrayCount;
- (int)numberOfRebaseBtwRefresh;
- (int)numberOfTrackEndedBtwRefresh;
- (void)cleanHistoricalMslpArrayForForceRebase:(id)a3;
- (void)clearInVisitRebasedMslpInPlist;
- (void)clearMeanSeaLevelPressureArrayInPlist;
- (void)clearRecentMeanSeaLevelPressureArrayInPlist;
- (void)dealloc;
- (void)getAndSendCurrentEstimateMeanSeaLevelPressureFrom:(int)a3;
- (void)getLastHistoricalMeanSeaLevelPressureData:(double *)a3;
- (void)getMslpDriftRate:(double *)a3 withLastMslp:(double)a4;
- (void)onMslp:(const CMMeanSeaLevelPressure *)a3;
- (void)printMeanSeaLevelPressureArray:(id)a3 withPrePhrase:()basic_string<char;
- (void)printMeanSeaLevelPressureElement:(id)a3 withPrePhrase:()basic_string<char;
- (void)refreshHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4;
- (void)resetInVisitRebasedMslp;
- (void)retrieveMeanSeaLevelPressureEstimatorState;
- (void)saveInVisitRebasedMslpToPlist;
- (void)saveInVisitStateToPlist;
- (void)saveMeanSeaLevelPressureArrayToPlist;
- (void)saveRecentMeanSeaLevelPressureArrayToPlist;
- (void)sentRefreshMslpAnalyticsWithAltitudeCorrection:(double)a3 uncertaintyBeforeCurrentRefresh:(double)a4 uncertaintyAfterCurrentRefresh:(double)a5 refreshDuration:(double)a6 xpcWaitingTime:(double)a7 timeDiffBtwRefresh:(double)a8 pressureDelta:(double)a9;
- (void)setCumulativeStartTime:(double)a3;
- (void)setCurrentLatitude:(double)a3;
- (void)setCurrentLongitude:(double)a3;
- (void)setCurrentPressure:(double)a3;
- (void)setExitVisitTimestamp:(double)a3;
- (void)setFirstRefreshAfterVisit:(BOOL)a3;
- (void)setInVisitStatus:(BOOL)a3;
- (void)setLastRefreshTimestamp:(double)a3;
- (void)setMaxPressure:(double)a3;
- (void)setMinPressure:(double)a3;
- (void)setNumberOfRebaseBtwRefresh:(int)a3;
- (void)setNumberOfTrackEndedBtwRefresh:(int)a3;
- (void)updateInVisitRebasedMslp:(id)a3;
- (void)updateUncertinatyAndSendCurrentEstimateMslpFrom:(int)a3;
- (void)writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:(double)a3;
@end

@implementation CLMeanSeaLevelPressureEstimator

- (double)minPressure
{
  return self->_minPressure;
}

- (double)maxPressure
{
  return self->_maxPressure;
}

- (CLMeanSeaLevelPressureEstimator)initWithContextManager:(id)a3 andUniverse:(id)a4 andDelegate:(id)a5 andBuffers:(void *)a6
{
  v18.receiver = self;
  v18.super_class = (Class)CLMeanSeaLevelPressureEstimator;
  v10 = [(CLMeanSeaLevelPressureEstimator *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_universe = (CLIntersiloUniverse *)a4;
    v10->_delegate = (CLBarometerCalibrationContextClient *)a5;
    v10->_dataBuffers = a6;
    v10->_meanSeaLevelPressureArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11->_recentMeanSeaLevelPressureArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11->_inVisitRebasedMslp = objc_alloc_init(CLMeanSeaLevelPressureData);
    v11->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
    v11->_cumulativeNumber = 0;
    v11->_cumulativeUncertainty = 0.0;
    v11->_cumulativeMeanSeaLevelPressure = 0.0;
    int64x2_t v12 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v11->_cumulativePressureMeasurement = 0.0;
    *(int64x2_t *)&v11->_cumulativeTimestamp = v12;
    *(int64x2_t *)&v11->_lastTimestampSavedMslpForRecovery = v12;
    v11->_lastRefreshTimestamp = 1.79769313e308;
    v11->_exitVisitTimestamp = 0.0;
    *(_WORD *)&v11->_inVisitStatus = 0;
    v11->_lastSuccessfulRefreshTimestamp = 1.79769313e308;
    *(void *)&v11->_numberOfRebaseBtwRefresh = -1;
    v11->_numberOfWeatherUpdate = -1;
    *(int64x2_t *)&v11->_uncertaintyAfterRefresh = v12;
    *(int64x2_t *)&v11->_longitudeAfterRefresh = v12;
    *(_DWORD *)v17 = 1155596288;
    sub_101A22680(buf, "RateToRefreshHistoricalMeanSeaLevelPressure", v17, 0);
    v11->_rateToRefreshHistoricalMeanSeaLevelPressure = v20;
    v17[0] = 0;
    sub_10006ACBC(buf, "MeanSeaLevelPressureLogInitialArray", v17, 0);
    v11->_logInitialHistoricalMeanSeaLevelPressure = buf[1];
    *(_DWORD *)v17 = 1137180672;
    sub_101A22680(buf, "gpVerticalScale_historicalMslp", v17, 0);
    v11->_gpMinVertScale_historical = v20;
    *(_DWORD *)v17 = 1132068864;
    sub_101A22680(buf, "gpVerticalScale_recentMslp", v17, 0);
    v11->_gpMinVertScale_recent = v20;
    *(_DWORD *)v17 = 1079194419;
    sub_101A22680(buf, "gpHorizontalScale_historicalMslpOutVisit", v17, 0);
    v11->_gpHorizScale_outVisit = v20;
    *(_DWORD *)v17 = 1056964608;
    sub_101A22680(buf, "gpHorizontalScale_historicalMslpInVisit", v17, 0);
    v11->_gpHorizScale_inVisit = v20;
    *(_DWORD *)v17 = 1056964608;
    sub_101A22680(buf, "gpHorizontalScale_recentMslpInVisit", v17, 0);
    v11->_gpHorizScale_recentInVisit = v20;
    *(_DWORD *)v17 = 1045220557;
    sub_101A22680(buf, "gpHorizontalScale_recentMslpOutVisit", v17, 0);
    v11->_gpHorizScale_recentOutVisit = v20;
    [(CLMeanSeaLevelPressureEstimator *)v11 retrieveMeanSeaLevelPressureEstimatorState];
    if (![(NSMutableArray *)v11->_meanSeaLevelPressureArray count]
      && ![(NSMutableArray *)v11->_recentMeanSeaLevelPressureArray count])
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      v13 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "locationd starts and no historical data retrieved from plist, refreshing mean sea level array.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        *(_WORD *)v17 = 0;
        v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator initWithContextManager:andUniverse:andDelegate:andBuffers:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      double Current = CFAbsoluteTimeGetCurrent();
      [(CLMeanSeaLevelPressureEstimator *)v11 refreshHistoricalMeanSeaLevelPressureWithStartTime:Current + -10800.0 andEndTime:CFAbsoluteTimeGetCurrent()];
    }
    [(CLIntersiloUniverse *)v11->_universe silo];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  self->_meanSeaLevelPressureArray = 0;
  self->_recentMeanSeaLevelPressureArray = 0;

  self->_elevationProfileContextManager = 0;
  self->_currentEstimateMslp = 0;

  self->_inVisitRebasedMslp = 0;
  if (sub_1000D2E34(0))
  {
    uint64_t v3 = sub_1000D2E34(0);
    sub_1009D26C4(v3, 48, (uint64_t)self->_mslpDispatcher.__ptr_.__value_);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLMeanSeaLevelPressureEstimator;
  [(CLMeanSeaLevelPressureEstimator *)&v4 dealloc];
}

- (int)getMeanSeaLevelArrayCount
{
  unsigned int v3 = [(NSMutableArray *)self->_meanSeaLevelPressureArray count];
  return [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count] + v3;
}

- (void)printMeanSeaLevelPressureArray:(id)a3 withPrePhrase:()basic_string<char
{
  memset(&v63, 0, sizeof(v63));
  memset(&v62, 0, sizeof(v62));
  memset(&v61, 0, sizeof(v61));
  memset(&v60, 0, sizeof(v60));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v57;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        [v9 timestamp];
        std::to_string(&v65, v10);
        v11 = std::string::insert(&v65, 0, ", ");
        long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = *((void *)&v11->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v12;
        v11->__r_.__value_.__l.__size_ = 0;
        v11->__r_.__value_.__r.__words[2] = 0;
        v11->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0) {
          v13 = __p;
        }
        else {
          v13 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v14 = __p[23];
        }
        else {
          std::string::size_type v14 = *(void *)&__p[8];
        }
        std::string::append(&v63, v13, v14);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v65.__r_.__value_.__l.__data_);
        }
        [v9 meanSeaLevelPressure];
        std::to_string(&v65, v15);
        v16 = std::string::insert(&v65, 0, ", ");
        long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = *((void *)&v16->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v17;
        v16->__r_.__value_.__l.__size_ = 0;
        v16->__r_.__value_.__r.__words[2] = 0;
        v16->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0) {
          objc_super v18 = __p;
        }
        else {
          objc_super v18 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v19 = __p[23];
        }
        else {
          std::string::size_type v19 = *(void *)&__p[8];
        }
        std::string::append(&v62, v18, v19);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v65.__r_.__value_.__l.__data_);
        }
        [v9 uncertainty];
        std::to_string(&v65, v20);
        v21 = std::string::insert(&v65, 0, ", ");
        long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = *((void *)&v21->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v22;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        v21->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0) {
          v23 = __p;
        }
        else {
          v23 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v24 = __p[23];
        }
        else {
          std::string::size_type v24 = *(void *)&__p[8];
        }
        std::string::append(&v61, v23, v24);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v65.__r_.__value_.__l.__data_);
        }
        [v9 pressureMeasurement];
        std::to_string(&v65, v25);
        v26 = std::string::insert(&v65, 0, ", ");
        long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = *((void *)&v26->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0) {
          v28 = __p;
        }
        else {
          v28 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v29 = __p[23];
        }
        else {
          std::string::size_type v29 = *(void *)&__p[8];
        }
        std::string::append(&v60, v28, v29);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v65.__r_.__value_.__l.__data_);
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v6);
  }
  id v30 = [a3 count];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  v31 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "count";
    *(_WORD *)&__p[12] = 2048;
    *(void *)&__p[14] = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "mean sea level pressure array,%s,%lu", __p, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    LODWORD(v65.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v65.__r_.__value_.__r.__words + 4) = (std::string::size_type)"count";
    WORD2(v65.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&v65.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v30;
    v44 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v44);
    if (v44 != __p) {
      free(v44);
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  v32 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    data = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v34 = &v63;
    if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v34 = (std::string *)v63.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = data;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s timestamps%s", __p, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    v45 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      v45 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v46 = &v63;
    if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v46 = (std::string *)v63.__r_.__value_.__r.__words[0];
    }
    LODWORD(v65.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v65.__r_.__value_.__r.__words + 4) = (std::string::size_type)v45;
    WORD2(v65.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v65.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v46;
    v47 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v47);
    if (v47 != __p) {
      free(v47);
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  v35 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    v36 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      v36 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v37 = &v62;
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v37 = (std::string *)v62.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = v36;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s pressures%s", __p, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    v48 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      v48 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v49 = &v62;
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v49 = (std::string *)v62.__r_.__value_.__r.__words[0];
    }
    LODWORD(v65.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v65.__r_.__value_.__r.__words + 4) = (std::string::size_type)v48;
    WORD2(v65.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v65.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v49;
    v50 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v50);
    if (v50 != __p) {
      free(v50);
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  v38 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    v39 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      v39 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v40 = &v61;
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v40 = (std::string *)v61.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = v39;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s uncertainties%s", __p, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    v51 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      v51 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v52 = &v61;
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v52 = (std::string *)v61.__r_.__value_.__r.__words[0];
    }
    LODWORD(v65.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v65.__r_.__value_.__r.__words + 4) = (std::string::size_type)v51;
    WORD2(v65.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v65.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v52;
    v53 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v53);
    if (v53 != __p) {
      free(v53);
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  v41 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    v42 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      v42 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v43 = &v60;
    if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v43 = (std::string *)v60.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = v42;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s pressureMeasurements%s", __p, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      a4 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    v54 = &v60;
    if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v54 = (std::string *)v60.__r_.__value_.__r.__words[0];
    }
    LODWORD(v65.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v65.__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
    WORD2(v65.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v65.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v54;
    v55 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v55);
    if (v55 != __p) {
      free(v55);
    }
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
}

- (void)printMeanSeaLevelPressureElement:(id)a3 withPrePhrase:()basic_string<char
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  id v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    data = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    [a3 meanSeaLevelPressure];
    uint64_t v9 = v8;
    [a3 uncertainty];
    uint64_t v11 = v10;
    [a3 timestamp];
    *(_DWORD *)buf = 136316674;
    double v15 = data;
    __int16 v16 = 2080;
    long long v17 = "meanSeaLevelPressure";
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    v21 = "uncertainty";
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2080;
    double v25 = "timestamp";
    __int16 v26 = 2048;
    uint64_t v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s,%s,%f,%s,%f,%s,%f", buf, 0x48u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    [a3 meanSeaLevelPressure];
    [a3 uncertainty];
    [a3 timestamp];
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
}

- (BOOL)updateLastSampleInMeanSeaLevelPressureArray
{
  id v3 = [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count];
  if (v3)
  {
    id v4 = (id)objc_opt_new();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    [v4 setTimestamp:];
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_100134750(__p, "recent mean sea level pressure array for Gaussian process:");
    [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureArray:recentMeanSeaLevelPressureArray withPrePhrase:__p];
    if (v31 < 0) {
      operator delete(__p[0]);
    }
    if ([(CLMeanSeaLevelPressureEstimator *)self gaussianProcess:v4 withMslpArray:self->_recentMeanSeaLevelPressureArray withType:0])
    {
      if ((unint64_t)[(NSMutableArray *)self->_meanSeaLevelPressureArray count] >= 0xF)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        uint64_t v7 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [[-[NSMutableArray firstObject](self->_meanSeaLevelPressureArray, "firstObject") timestamp];
          *(_DWORD *)buf = 134217984;
          v49 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remove the oldest mean sea level pressure,timestamp,%f", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_10232CFE8);
          }
          [[-[NSMutableArray firstObject](self->_meanSeaLevelPressureArray, "firstObject") timestamp];
          int v32 = 134217984;
          v33 = v27;
          v28 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]", "%s\n", v28);
          if (v28 != (char *)buf) {
            free(v28);
          }
        }
        [(NSMutableArray *)self->_meanSeaLevelPressureArray removeObjectAtIndex:0];
      }
      [(NSMutableArray *)self->_meanSeaLevelPressureArray addObject:v4];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      uint64_t v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [v4 timestamp];
        double v11 = v10;
        [v4 meanSeaLevelPressure];
        uint64_t v13 = v12;
        [v4 uncertainty];
        uint64_t v15 = v14;
        [v4 pressureMeasurement];
        *(_DWORD *)buf = 136316930;
        v49 = "timestamp";
        __int16 v50 = 2048;
        CFAbsoluteTime v51 = v11;
        __int16 v52 = 2080;
        v53 = "meanSeaLevelPressure";
        __int16 v54 = 2048;
        uint64_t v55 = v13;
        __int16 v56 = 2080;
        long long v57 = "uncertainty";
        __int16 v58 = 2048;
        uint64_t v59 = v15;
        __int16 v60 = 2080;
        std::string v61 = "measurePressure";
        __int16 v62 = 2048;
        uint64_t v63 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "add temporary mslp to mslp array,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x52u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        [v4 timestamp];
        double v20 = v19;
        [v4 meanSeaLevelPressure];
        uint64_t v22 = v21;
        [v4 uncertainty];
        uint64_t v24 = v23;
        [v4 pressureMeasurement];
        int v32 = 136316930;
        v33 = "timestamp";
        __int16 v34 = 2048;
        CFAbsoluteTime v35 = v20;
        __int16 v36 = 2080;
        v37 = "meanSeaLevelPressure";
        __int16 v38 = 2048;
        uint64_t v39 = v22;
        __int16 v40 = 2080;
        v41 = "uncertainty";
        __int16 v42 = 2048;
        uint64_t v43 = v24;
        __int16 v44 = 2080;
        v45 = "measurePressure";
        __int16 v46 = 2048;
        uint64_t v47 = v25;
        __int16 v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]", "%s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
      LOBYTE(v3) = 1;
    }
    else
    {
      [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray removeAllObjects];
      [(CLMeanSeaLevelPressureEstimator *)self clearRecentMeanSeaLevelPressureArrayInPlist];
      self->_cumulativeStartTime = 1.79769313e308;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      long long v17 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "timestamp";
        __int16 v50 = 2048;
        CFAbsoluteTime v51 = Current;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fail to query temporary mslp from recent mslp array,%s,%f", buf, 0x16u);
      }
      LODWORD(v3) = sub_10013D1A0(115, 2);
      if (v3)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        int v32 = 136315394;
        v33 = "timestamp";
        __int16 v34 = 2048;
        CFAbsoluteTime v35 = Current;
        __int16 v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
        LOBYTE(v3) = 0;
      }
    }
  }
  return (char)v3;
}

- (id)getEstimatedMeanSeaLevelPressure
{
  id v3 = (id)objc_opt_new();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  [v3 setTimestamp:];
  unsigned int v5 = [(CLMeanSeaLevelPressureEstimator *)self updateLastSampleInMeanSeaLevelPressureArray];
  meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
  sub_100134750(__p, "mean sea level pressure array for Gaussian process:");
  [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureArray:meanSeaLevelPressureArray withPrePhrase:__p];
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (![(NSMutableArray *)self->_meanSeaLevelPressureArray count])
  {
    [v3 setMeanSeaLevelPressure:101325.0];
    [v3 setUncertainty:6000.0];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "mean sea level pressure array is empty.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return v3;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    LOWORD(v17) = 0;
    double v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]", "%s\n", v10);
LABEL_29:
    if (v10 != (char *)buf) {
      free(v10);
    }
    return v3;
  }
  if ([(CLMeanSeaLevelPressureEstimator *)self gaussianProcess:v3 withMslpArray:self->_meanSeaLevelPressureArray withType:1])
  {
    if (v5)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      uint64_t v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [[-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject") timestamp];
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remove temporary mslp from mslp array,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        [(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject")) timestamp];
        int v17 = 134217984;
        CFAbsoluteTime v18 = v13;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      [(NSMutableArray *)self->_meanSeaLevelPressureArray removeLastObject];
    }
    return v3;
  }
  [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray removeAllObjects];
  [(CLMeanSeaLevelPressureEstimator *)self clearRecentMeanSeaLevelPressureArrayInPlist];
  [(NSMutableArray *)self->_meanSeaLevelPressureArray removeAllObjects];
  [(CLMeanSeaLevelPressureEstimator *)self clearMeanSeaLevelPressureArrayInPlist];
  self->_cumulativeStartTime = 1.79769313e308;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  double v11 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v20 = Current;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "fail to query mslp from mslp array,timestamp,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    int v17 = 134217984;
    CFAbsoluteTime v18 = Current;
    double v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]", "%s\n", v10);
    goto LABEL_29;
  }
  return v3;
}

- (BOOL)gaussianProcess:(id)a3 withMslpArray:(id)a4 withType:(unint64_t)a5
{
  double v5 = __chkstk_darwin(self);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v141 = v10;
  v145 = v11;
  [v11 timestamp:v5];
  double v149 = v12;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  double v13 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    [objc_msgSend(v9, "firstObject") timestamp];
    uint64_t v15 = v14;
    [objc_msgSend(v9, "lastObject") timestamp];
    *(_DWORD *)buf = 136316418;
    v214 = "queryTimestamp";
    __int16 v215 = 2048;
    double v216 = v149;
    __int16 v217 = 2080;
    v218 = "firstTimestampInArray";
    __int16 v219 = 2048;
    uint64_t v220 = v15;
    __int16 v221 = 2080;
    v222 = "lastTimestampInArray";
    __int16 v223 = 2048;
    uint64_t v224 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "interpolating or extrapolating the mean sea level pressure,%s,%f,%s,%f,%s,%f", buf, 0x3Eu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    [objc_msgSend(v9, "firstObject") timestamp];
    uint64_t v122 = v121;
    [objc_msgSend(v9, "lastObject") timestamp];
    *(_DWORD *)v195 = 136316418;
    v196 = "queryTimestamp";
    __int16 v197 = 2048;
    *(double *)v198 = v149;
    *(_WORD *)&v198[8] = 2080;
    *(void *)&v198[10] = "firstTimestampInArray";
    *(_WORD *)&v198[18] = 2048;
    *(void *)&v198[20] = v122;
    *(_WORD *)&v198[28] = 2080;
    *(void *)&v198[30] = "lastTimestampInArray";
    *(_WORD *)&v198[38] = 2048;
    *(void *)&v198[40] = v123;
    v124 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v124);
    if (v124 != (char *)buf) {
      free(v124);
    }
  }
  double v168 = 1.79769313e308;
  if ([(id)v141 getLastPressureSample:&v168])
  {
    [v145 setPressureMeasurement:v168];
  }
  else
  {
    [objc_msgSend(v9, "lastObject") pressureMeasurement];
    [v145 setPressureMeasurement:];
    [objc_msgSend(v9, "lastObject") pressureMeasurement];
    double v168 = v17;
  }
  int v18 = [v9 count];
  int v142 = v18;
  double v167 = 0.0;
  int64_t v19 = v18;
  if (v18 <= 0)
  {
    double v37 = 0.0;
    double v147 = 0.0 / (double)v18;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = v18;
    double v22 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    do
    {
      [objc_msgSend(v9, "objectAtIndexedSubscript:", v20) meanSeaLevelPressure];
      double v26 = v25;
      [objc_msgSend(v9, "objectAtIndexedSubscript:", v20) meanSeaLevelPressure];
      double v28 = v27;
      uint64_t v29 = v20 + 1;
      if (v20 + 1 < v19)
      {
        [objc_msgSend(v9, "objectAtIndexedSubscript:", v20 + 1) meanSeaLevelPressure];
        double v31 = v30;
        [objc_msgSend(v9, "objectAtIndexedSubscript:", v20) meanSeaLevelPressure];
        double v33 = v32;
        [objc_msgSend(v9, "objectAtIndexedSubscript:", v20 + 1) timestamp];
        double v35 = v34;
        [objc_msgSend(v9, "objectAtIndexedSubscript:", v20) timestamp];
        double v24 = v24 + vabdd_f64(v31, v33) / (v35 - v36);
      }
      double v22 = v22 + v26;
      double v23 = v23 + v28 * v28;
      ++v20;
    }
    while (v21 != v29);
    double v37 = 0.0;
    double v147 = v22 / (double)v142;
    if (v142 > 1)
    {
      double v37 = sqrt(v23 / (double)v142 - v22 / (double)v142 * (v22 / (double)v142));
      double v167 = v24 / (double)(v142 - 1) / 0.000277777785;
    }
  }
  [objc_msgSend(v9, "lastObject") meanSeaLevelPressure];
  [v141 getMslpDriftRate:&v167];
  bzero(buf, 0x708uLL);
  if (v7 == 1)
  {
    double v38 = v37 * 4.0;
    uint64_t v41 = 152;
    if (!*(unsigned char *)(v141 + 248)) {
      uint64_t v41 = 144;
    }
    double v39 = *(double *)(v141 + v41);
    if (v38 < *(float *)(v141 + 140)) {
      double v38 = *(float *)(v141 + 140);
    }
  }
  else
  {
    double v38 = 0.0;
    double v39 = 0.0;
    if (!v7)
    {
      uint64_t v40 = 160;
      if (!*(unsigned char *)(v141 + 248)) {
        uint64_t v40 = 168;
      }
      double v39 = *(double *)(v141 + v40);
      double v38 = *(float *)(v141 + 136);
    }
  }
  double v42 = v38 * v38;
  double v43 = 0.5 / (v39 * v39);
  if (v142 < 1)
  {
    double v148 = 1.79769313e308;
LABEL_61:
    unint64_t v90 = v19;
    do
    {
      *(void *)sub_101549804((uint64_t)buf, v90, v90) = 0x3FF0000000000000;
      ++v90;
    }
    while (v90 != 15);
    goto LABEL_63;
  }
  unint64_t v44 = 0;
  double v148 = 1.79769313e308;
  do
  {
    for (unint64_t i = 0; i != v142; ++i)
    {
      id v46 = [v9 objectAtIndexedSubscript:v44];
      if (v44 == i)
      {
        [v46 uncertainty];
        double v48 = v47;
        v49 = (double *)sub_101549804((uint64_t)buf, v44, v44);
        double v50 = v48 * v48 + v42 * 2.0;
      }
      else
      {
        [v46 timestamp];
        double v52 = v51;
        [objc_msgSend(v9, "objectAtIndexedSubscript:", i) timestamp];
        double v54 = v53;
        [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) pressureMeasurement];
        double v56 = v55;
        [v9[i] pressureMeasurement];
        double v58 = v57;
        double v59 = exp(v43 * -((v52 * 0.000277777785 - v54 * 0.000277777785) * (v52 * 0.000277777785 - v54 * 0.000277777785)));
        *(double *)sub_101549804((uint64_t)buf, v44, i) = v42 * v59;
        double v60 = exp(v43 * -((v56 / 1000.0 - v58 / 1000.0) * (v56 / 1000.0 - v58 / 1000.0)));
        v49 = (double *)sub_101549804((uint64_t)buf, v44, i);
        double v50 = *v49 + v42 * v60;
      }
      double *v49 = v50;
    }
    double v61 = v168;
    float v153 = 0.0;
    if (v168 != 1.79769313e308)
    {
      [objc_msgSend(v9, "objectAtIndexedSubscript:", v44, v168) pressureMeasurement];
      double v61 = v62 - v168;
      *(float *)&double v61 = v61;
      *(float *)&double v61 = fabsf(*(float *)&v61);
      float v153 = *(float *)&v61;
    }
    [objc_msgSend(v9, "objectAtIndexedSubscript:", v44, v61) pressureMeasurement];
    *(float *)&double v63 = v63;
    float v151 = sub_10006CC8C(*(float *)&v63);
    [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) pressureMeasurement];
    double v65 = v64;
    [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) meanSeaLevelPressure];
    float v66 = v65;
    float v68 = v67;
    sub_1014BE614(v66, v68);
    float v70 = v69;
    [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) timestamp];
    double v72 = v71;
    double v73 = v167;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    float v74 = (float)((float)(v153 * v151) / v70) * (float)((float)(v153 * v151) / v70);
    double v75 = vabdd_f64(v72, v149);
    float v76 = v73 * v75 * 0.000277777785 * (v73 * v75 * 0.000277777785);
    v77 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double v78 = v167;
      [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) uncertainty];
      *(_DWORD *)v195 = 136318978;
      v196 = "index";
      __int16 v197 = 1024;
      *(_DWORD *)v198 = v44;
      *(_WORD *)&v198[4] = 2080;
      *(void *)&v198[6] = "deltaPressure";
      *(_WORD *)&v198[14] = 2048;
      *(double *)&v198[16] = v153;
      *(_WORD *)&v198[24] = 2080;
      *(void *)&v198[26] = "uncDueToElevation";
      *(_WORD *)&v198[34] = 2048;
      *(double *)&v198[36] = v74;
      *(_WORD *)&v198[44] = 2080;
      *(void *)&v198[46] = "slopeDiffDElevationDPressure";
      *(_WORD *)&v198[54] = 2048;
      *(double *)&v198[56] = v151;
      *(_WORD *)&v198[64] = 2080;
      *(void *)&v198[66] = "dhdpb";
      __int16 v199 = 2048;
      double v200 = v70;
      __int16 v201 = 2080;
      v202 = "uncDueToWeather";
      __int16 v203 = 2048;
      double v204 = v76;
      __int16 v205 = 2080;
      v206 = "aveRateInSec";
      __int16 v207 = 2048;
      double v208 = v78 * 0.000277777785;
      __int16 v209 = 2080;
      v210 = "uncSquare";
      __int16 v211 = 2048;
      double v212 = v79 * v79;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "uncertainty term,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", v195, 0x9Eu);
    }
    double v80 = v74;
    double v81 = v76;
    if (sub_10013D1A0(115, 2))
    {
      bzero(v195, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v82 = v80;
      double v86 = v167;
      [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) uncertainty];
      *(_DWORD *)v185 = 136318978;
      *(void *)&v185[4] = "index";
      *(_WORD *)&v185[12] = 1024;
      *(_DWORD *)&v185[14] = v44;
      *(_WORD *)&v185[18] = 2080;
      *(void *)&v185[20] = "deltaPressure";
      *(_WORD *)&v185[28] = 2048;
      *(double *)&v185[30] = v153;
      *(_WORD *)&v185[38] = 2080;
      *(void *)&v185[40] = "uncDueToElevation";
      *(_WORD *)v186 = 2048;
      *(double *)&v186[2] = v82;
      *(_WORD *)&v186[10] = 2080;
      *(void *)&v186[12] = "slopeDiffDElevationDPressure";
      *(_WORD *)&v186[20] = 2048;
      *(double *)&v186[22] = v151;
      *(_WORD *)&v186[30] = 2080;
      *(void *)v187 = "dhdpb";
      *(_WORD *)&v187[8] = 2048;
      *(double *)&v187[10] = v70;
      *(_WORD *)&v187[18] = 2080;
      *(void *)&v187[20] = "uncDueToWeather";
      *(_WORD *)&v187[28] = 2048;
      *(double *)&v187[30] = v81;
      *(_WORD *)&v187[38] = 2080;
      v188 = "aveRateInSec";
      __int16 v189 = 2048;
      double v190 = v86 * 0.000277777785;
      __int16 v191 = 2080;
      v192 = "uncSquare";
      __int16 v193 = 2048;
      double v194 = v87 * v87;
      v88 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v88);
      if (v88 != (char *)v195) {
        free(v88);
      }
    }
    else
    {
      double v82 = v80;
    }
    [objc_msgSend(v9, "objectAtIndexedSubscript:", v44) uncertainty];
    double v84 = v83 * v83 + v82 + v81;
    if (v84 < v148)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      v85 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v195 = 136315906;
        v196 = "index";
        __int16 v197 = 1024;
        *(_DWORD *)v198 = v44;
        *(_WORD *)&v198[4] = 2080;
        *(void *)&v198[6] = "minUncSquare";
        *(_WORD *)&v198[14] = 2048;
        *(double *)&v198[16] = v84;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "minimum unc,%s,%d,%s,%f", v195, 0x26u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(v195, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        *(_DWORD *)v185 = 136315906;
        *(void *)&v185[4] = "index";
        *(_WORD *)&v185[12] = 1024;
        *(_DWORD *)&v185[14] = v44;
        *(_WORD *)&v185[18] = 2080;
        *(void *)&v185[20] = "minUncSquare";
        *(_WORD *)&v185[28] = 2048;
        *(double *)&v185[30] = v84;
        v89 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v89);
        if (v89 != (char *)v195) {
          free(v89);
        }
      }
      double v148 = v84;
    }
    ++v44;
  }
  while (v44 != v142);
  if (v142 < 15) {
    goto LABEL_61;
  }
LABEL_63:
  sub_101549B64((uint64_t)v166, (uint64_t)buf);
  for (int64_t j = 0; j != 15; ++j)
  {
    if (j >= v19)
    {
      *(void *)sub_101549E9C((uint64_t)v185, j) = 0;
      double v100 = 0.0;
    }
    else
    {
      [objc_msgSend(v9, "objectAtIndexedSubscript:", j) timestamp];
      double v93 = v92;
      [objc_msgSend(v9, "objectAtIndexedSubscript:", j) pressureMeasurement];
      double v95 = v94;
      double v96 = exp(v43 * -((v93 * -0.000277777785 + v149 * 0.000277777785) * (v93 * -0.000277777785 + v149 * 0.000277777785)));
      *(double *)sub_101549E9C((uint64_t)v185, j) = v42 * v96;
      double v97 = exp(v43 * -((v168 / 1000.0 - v95 / 1000.0) * (v168 / 1000.0 - v95 / 1000.0)));
      v98 = (double *)sub_101549E9C((uint64_t)v185, j);
      double *v98 = *v98 + v42 * v97;
      [objc_msgSend(v9, "objectAtIndexedSubscript:", j) meanSeaLevelPressure];
      double v100 = v99 - v147;
    }
    *(double *)sub_101549E9C((uint64_t)v157, j) = v100;
  }
  long long v158 = *(_OWORD *)v185;
  long long v159 = *(_OWORD *)&v185[16];
  long long v160 = *(_OWORD *)&v185[32];
  long long v161 = *(_OWORD *)v186;
  long long v162 = *(_OWORD *)&v186[16];
  long long v163 = *(_OWORD *)v187;
  long long v164 = *(_OWORD *)&v187[16];
  double v165 = *(double *)&v187[32];
  sub_10154A078((uint64_t)v166, (uint64_t)&v158);
  double v101 = v165;
  double v133 = *((double *)&v164 + 1);
  double v134 = *(double *)&v164;
  double v135 = *((double *)&v163 + 1);
  double v136 = *(double *)&v163;
  double v137 = *((double *)&v162 + 1);
  double v138 = *(double *)&v162;
  double v139 = *((double *)&v161 + 1);
  double v140 = *(double *)&v161;
  double v143 = *((double *)&v160 + 1);
  double v144 = *(double *)&v160;
  double v146 = *((double *)&v159 + 1);
  double v150 = *(double *)&v159;
  double v152 = *((double *)&v158 + 1);
  double v154 = *(double *)&v158;
  double v131 = *(double *)&v185[8];
  double v132 = *(double *)v185;
  double v129 = *(double *)&v185[24];
  double v130 = *(double *)&v185[16];
  double v127 = *(double *)&v185[40];
  double v128 = *(double *)&v185[32];
  long long v102 = *(_OWORD *)v186;
  double v126 = *(double *)v186;
  double v125 = *(double *)&v186[16];
  double v103 = *(double *)&v186[24];
  long long v104 = *(_OWORD *)v187;
  double v105 = *(double *)&v187[16];
  double v106 = *(double *)&v187[24];
  double v107 = *(double *)&v187[32];
  objc_msgSend(v145, "setMeanSeaLevelPressure:", &v187[32], v147+ v165 * v157[14]+ 0.0+ *((double *)&v164 + 1) * v157[13]+ *(double *)&v164 * v157[12]+ *((double *)&v163 + 1) * v157[11]+ *(double *)&v163 * v157[10]+ *((double *)&v162 + 1) * v157[9]+ *(double *)&v162 * v157[8]+ *((double *)&v161 + 1) * v157[7]+ *(double *)&v161 * v157[6]+ *((double *)&v160 + 1) * v157[5]+ *(double *)&v160 * v157[4]+ *((double *)&v159 + 1) * v157[3]+ *(double *)&v159 * v157[2]+ *((double *)&v158 + 1) * v157[1]
  + *(double *)&v158 * v157[0]);
  double v108 = v148 + v42 * 2.0;
  double v109 = v101 * v107
       + 0.0
       + v133 * v106
       + v134 * v105
       + v135 * *((double *)&v104 + 1)
       + v136 * *(double *)&v104
       + v137 * v103
       + v138 * v125
       + v139 * *((double *)&v102 + 1)
       + v140 * v126
       + v143 * v127
       + v144 * v128
       + v146 * v129
       + v150 * v130
       + v152 * v131
       + v154 * v132;
  if (v108 <= v109)
  {
    [v145 setUncertainty:sqrt(v108)];
  }
  else
  {
    [v145 setUncertainty:sqrt(v108 - v109)];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    v110 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      [v145 uncertainty];
      uint64_t v112 = v111;
      [v145 meanSeaLevelPressure];
      *(_DWORD *)v195 = 136316930;
      v196 = "uncertainty";
      __int16 v197 = 2048;
      *(void *)v198 = v112;
      *(_WORD *)&v198[8] = 2080;
      *(void *)&v198[10] = "mslp";
      *(_WORD *)&v198[18] = 2048;
      *(void *)&v198[20] = v113;
      *(_WORD *)&v198[28] = 2080;
      *(void *)&v198[30] = "queriedAprioriVerticalScale";
      *(_WORD *)&v198[38] = 2048;
      *(double *)&v198[40] = v108;
      *(_WORD *)&v198[48] = 2080;
      *(void *)&v198[50] = "uncertaintyUpdate";
      *(_WORD *)&v198[58] = 2048;
      *(double *)&v198[60] = v109;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "query information,%s,%f,%s,%f,%s,%f,%s,%f", v195, 0x52u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(v195, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      [v145 uncertainty];
      uint64_t v115 = v114;
      [v145 meanSeaLevelPressure];
      int v169 = 136316930;
      v170 = "uncertainty";
      __int16 v171 = 2048;
      uint64_t v172 = v115;
      __int16 v173 = 2080;
      v174 = "mslp";
      __int16 v175 = 2048;
      uint64_t v176 = v116;
      __int16 v177 = 2080;
      v178 = "queriedAprioriVerticalScale";
      __int16 v179 = 2048;
      double v180 = v108;
      __int16 v181 = 2080;
      v182 = "uncertaintyUpdate";
      __int16 v183 = 2048;
      double v184 = v109;
      v117 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v117);
      if (v117 != (char *)v195) {
        free(v117);
      }
    }
  }
  [v145 meanSeaLevelPressure];
  [v145 uncertainty];
  [v145 meanSeaLevelPressure];
  if (v118 <= 115000.0 && ([v145 meanSeaLevelPressure], v119 >= 80000.0))
  {
    sub_100134750(__p, "extrapolate or interpolate the mean sea level pressure:");
    [(id)v141 printMeanSeaLevelPressureElement:v145 withPrePhrase:__p];
    if (v156 < 0) {
      operator delete(__p[0]);
    }
    return 1;
  }
  else
  {
    [v145 setMeanSeaLevelPressure:101325.0];
    [v145 setUncertainty:6000.0];
    return 0;
  }
}

- (BOOL)getLastPressureSample:(double *)a3
{
  sub_100096374((uint64_t)v14, (void *)self->_dataBuffers + 6);
  if (!v16) {
    goto LABEL_14;
  }
  id v4 = (double **)(*(void *)(v14[1] + (((unint64_t)(v16 + v15 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v16 + v15 - 1));
  uint64_t v6 = *v4;
  double v5 = (std::__shared_weak_count *)v4[1];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  double v7 = *v6;
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  double v9 = vabdd_f64(v7, Current);
  uint64_t v10 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "time difference from the last pressure,sample,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    int v17 = 134217984;
    double v18 = v9;
    double v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getLastPressureSample:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  BOOL v11 = v9 <= 720.0;
  if (v9 > 720.0)
  {
    if (v5) {
      goto LABEL_13;
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  *a3 = v6[1] * 1000.0;
  if (v5)
  {
LABEL_13:
    sub_1000DB0A0(v5);
    goto LABEL_15;
  }
  BOOL v11 = 1;
LABEL_15:
  sub_1000DAF68(v14);
  return v11;
}

- (void)getMslpDriftRate:(double *)a3 withLastMslp:(double)a4
{
  double v11 = 0.0;
  if ([(CLMeanSeaLevelPressureEstimator *)self getLastPressureSample:&v11])
  {
    double v6 = v11;
  }
  else
  {
    double v11 = a4;
    double v6 = a4;
  }
  float v7 = v6;
  BOOL v8 = sub_1001C1F30(v7, 101320.0) < 3000.0;
  double v9 = 180.0;
  if (v8) {
    double v9 = 100.0;
  }
  double v10 = v9 * a4 / v11;
  if (*a3 > v10) {
    double v10 = *a3;
  }
  *a3 = v10;
}

- (void)refreshHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4
{
  double v16 = 0.0;
  if (![(CLMeanSeaLevelPressureEstimator *)self getLastPressureSample:&v16]) {
    double v16 = 101325.0;
  }
  if (self->_inVisitStatus && (float v7 = v16, sub_1001C1F30(v7, 101320.0) < 3000.0))
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    BOOL v8 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "refresh withdrawn due to in-visit.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      LOWORD(v17) = 0;
LABEL_32:
      double v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  else if (self->_lastRefreshTimestamp == 1.79769313e308 {
         || CFAbsoluteTimeGetCurrent() - self->_lastRefreshTimestamp >= self->_rateToRefreshHistoricalMeanSeaLevelPressure)
  }
  {
    if ([(CLContextManagerElevationProfileBase *)self->_elevationProfileContextManager registeredXPCTaskMSLP])
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v10 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "delay registration of XPC task for mslp estimation", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        LOWORD(v17) = 0;
        goto LABEL_32;
      }
    }
    else
    {
      self->_lastRefreshTimestamp = CFAbsoluteTimeGetCurrent();
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v12 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v22 = a3;
        __int16 v23 = 2048;
        double v24 = a4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling refreshing mean sea level pressure,startTimestamp,%f,endTimestamp,%f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        int v17 = 134218240;
        double v18 = a3;
        __int16 v19 = 2048;
        double v20 = a4;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      elevationProfileContextManager = self->_elevationProfileContextManager;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10154AC54;
      v15[3] = &unk_10232CFA0;
      v15[4] = self;
      *(double *)&v15[5] = a4;
      *(double *)&v15[6] = a3;
      [(CLContextManagerElevationProfileBase *)elevationProfileContextManager getHistoricalMeanSeaLevelPressureWithStartTime:v15 andEndTime:a3 andCompletionBlock:a4];
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    double v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "refresh withdrawn due to the last refresh event is finished within the past 30 mins.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      LOWORD(v17) = 0;
      goto LABEL_32;
    }
  }
}

- (void)sentRefreshMslpAnalyticsWithAltitudeCorrection:(double)a3 uncertaintyBeforeCurrentRefresh:(double)a4 uncertaintyAfterCurrentRefresh:(double)a5 refreshDuration:(double)a6 xpcWaitingTime:(double)a7 timeDiffBtwRefresh:(double)a8 pressureDelta:(double)a9
{
  if (self->_latitudeAfterRefresh != 1.79769313e308)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    int v17 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double latitudeAfterRefresh = self->_latitudeAfterRefresh;
      double longitudeAfterRefresh = self->_longitudeAfterRefresh;
      double currentLatitude = self->_currentLatitude;
      double currentLongitude = self->_currentLongitude;
      *(_DWORD *)buf = 134218752;
      double v34 = *(const char **)&latitudeAfterRefresh;
      __int16 v35 = 2048;
      double v36 = longitudeAfterRefresh;
      __int16 v37 = 2048;
      double v38 = *(const char **)&currentLatitude;
      __int16 v39 = 2048;
      double v40 = currentLongitude;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "refresh traveling distance location,lastLat,%f,lastLon,%f,currLat,%f,currLon,%f", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v31 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator sentRefreshMslpAnalyticsWithAltitudeCorrection:uncertaintyBeforeCurrentRefresh:uncertaintyAfterCurrentRefresh:refreshDuration:xpcWaitingTime:timeDiffBtwRefresh:pressureDelta:]", "%s\n", v31);
      if (v31 != (char *)buf) {
        free(v31);
      }
    }
    double v22 = sub_1000A3D9C(self->_latitudeAfterRefresh, self->_longitudeAfterRefresh, self->_currentLatitude, self->_currentLongitude);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    double v23 = fabs(v22);
    double v24 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = self->_maxPressure - self->_minPressure;
      int numberOfRebaseBtwRefresh = self->_numberOfRebaseBtwRefresh;
      int numberOfTrackEndedBtwRefresh = self->_numberOfTrackEndedBtwRefresh;
      int numberOfWeatherUpdate = self->_numberOfWeatherUpdate;
      double uncertaintyAfterRefresh = self->_uncertaintyAfterRefresh;
      BOOL firstRefreshAfterVisit = self->_firstRefreshAfterVisit;
      *(_DWORD *)buf = 136322050;
      double v34 = "altitudeCorrection";
      __int16 v35 = 2048;
      double v36 = a3;
      __int16 v37 = 2080;
      double v38 = "minMaxPressureDelta";
      __int16 v39 = 2048;
      double v40 = v25;
      __int16 v41 = 2080;
      double v42 = "pressureDelta";
      __int16 v43 = 2048;
      double v44 = a9;
      __int16 v45 = 2080;
      id v46 = "numberOfRebase";
      __int16 v47 = 1024;
      int v48 = numberOfRebaseBtwRefresh;
      __int16 v49 = 2080;
      double v50 = "numberOfTrackEnded";
      __int16 v51 = 1024;
      int v52 = numberOfTrackEndedBtwRefresh;
      __int16 v53 = 2080;
      double v54 = "numberOfWeatherUpdate";
      __int16 v55 = 1024;
      int v56 = numberOfWeatherUpdate;
      __int16 v57 = 2080;
      double v58 = "refreshDuration";
      __int16 v59 = 2048;
      double v60 = a6;
      __int16 v61 = 2080;
      double v62 = "timeDiffBtwRefresh";
      __int16 v63 = 2048;
      double v64 = a8;
      __int16 v65 = 2080;
      float v66 = "travelingDistance";
      __int16 v67 = 2048;
      double v68 = v23;
      __int16 v69 = 2080;
      float v70 = "uncertaintyAfterFormerRefresh";
      __int16 v71 = 2048;
      double v72 = uncertaintyAfterRefresh;
      __int16 v73 = 2080;
      float v74 = "uncertaintyAfterLatterRefresh";
      __int16 v75 = 2048;
      double v76 = a5;
      __int16 v77 = 2080;
      double v78 = "uncertaintyBeforeLatterRefresh";
      __int16 v79 = 2048;
      double v80 = a4;
      __int16 v81 = 2080;
      double v82 = "xpcWaitingTime";
      __int16 v83 = 2048;
      double v84 = a7;
      __int16 v85 = 2080;
      double v86 = "firstRefreshAfterVisit";
      __int16 v87 = 1024;
      BOOL v88 = firstRefreshAfterVisit;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "sent refresh mslp event to CoreAnalytics,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d", buf, 0x10Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v32 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator sentRefreshMslpAnalyticsWithAltitudeCorrection:uncertaintyBeforeCurrentRefresh:uncertaintyAfterCurrentRefresh:refreshDuration:xpcWaitingTime:timeDiffBtwRefresh:pressureDelta:]", "%s\n", v32);
      if (v32 != (char *)buf) {
        free(v32);
      }
    }
    AnalyticsSendEventLazy();
  }
}

- (void)getAndSendCurrentEstimateMeanSeaLevelPressureFrom:(int)a3
{
  uint64_t v3 = *(void *)&a3;

  self->_currentEstimateMslp = (CLMeanSeaLevelPressureData *)[(CLMeanSeaLevelPressureEstimator *)self getEstimatedMeanSeaLevelPressure];

  [(CLMeanSeaLevelPressureEstimator *)self updateUncertinatyAndSendCurrentEstimateMslpFrom:v3];
}

- (void)updateUncertinatyAndSendCurrentEstimateMslpFrom:(int)a3
{
  if (self->_inVisitStatus)
  {
    [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
    if (v5 != 1.79769313e308)
    {
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
      if (v6 != 1.79769313e308)
      {
        [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp uncertainty];
        double v8 = v7;
        [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp meanSeaLevelPressure];
        double v10 = v9;
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
        double v12 = vabdd_f64(v10, v11);
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
        double v14 = v12 + v13;
        if (v14 >= v8) {
          double v14 = v8;
        }
        [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp setUncertainty:v14];
      }
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  uint64_t v15 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp meanSeaLevelPressure];
    uint64_t v17 = v16;
    [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp uncertainty];
    uint64_t v19 = v18;
    [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp timestamp];
    *(_DWORD *)buf = 136316930;
    double v28 = "meanSeaLevelPressure";
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    __int16 v31 = 2080;
    double v32 = "uncertainty";
    __int16 v33 = 2048;
    uint64_t v34 = v19;
    __int16 v35 = 2080;
    double v36 = "timestamp";
    __int16 v37 = 2048;
    uint64_t v38 = v20;
    __int16 v39 = 2080;
    double v40 = "resetInVisitReference";
    __int16 v41 = 1024;
    BOOL v42 = a3 != 1;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "current estimate mean sea level pressure sent to AOP,%s,%f,%s,%f,%s,%f,%s,%d", buf, 0x4Eu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp meanSeaLevelPressure];
    [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp uncertainty];
    [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp timestamp];
    double v26 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:]", "%s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
  }
  uint64_t v21 = sub_1000D2E34(0);
  [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp meanSeaLevelPressure];
  float v23 = v22;
  [(CLMeanSeaLevelPressureData *)self->_currentEstimateMslp uncertainty];
  float v25 = v24;
  (*(void (**)(uint64_t, BOOL, float, float))(*(void *)(v21 + 112) + 64))(v21 + 112, a3 != 1, v23, v25);
}

- (void)getLastHistoricalMeanSeaLevelPressureData:(double *)a3
{
  if ([(NSMutableArray *)self->_meanSeaLevelPressureArray count])
  {
    [[-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray) timestamp];
    *(void *)a3 = v5;
    id v6 = [(NSMutableArray *)self->_meanSeaLevelPressureArray lastObject];
    sub_100134750(__p, "get last mean sea level pressure");
    [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureElement:v6 withPrePhrase:__p];
    if (v8 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)cleanHistoricalMslpArrayForForceRebase:(id)a3
{
  uint64_t v4 = 0x7FEFFFFFFFFFFFFFLL;
  if ([(CLMeanSeaLevelPressureEstimator *)self isValidMslp:a3]
    && [(CLMeanSeaLevelPressureEstimator *)self getLastPressureSample:&v4])
  {
    if ([(NSMutableArray *)self->_meanSeaLevelPressureArray count]) {
      [(NSMutableArray *)self->_meanSeaLevelPressureArray removeAllObjects];
    }
    if ([(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count]) {
      [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray removeAllObjects];
    }
    [(CLMeanSeaLevelPressureEstimator *)self clearMeanSeaLevelPressureArrayInPlist];
    self->_cumulativeStartTime = 1.79769313e308;
  }
}

- (BOOL)isValidMslp:(id)a3
{
  [a3 uncertainty];
  if (v4 > 6000.0) {
    [a3 setUncertainty:];
  }
  [a3 timestamp];
  if (v5 == 1.79769313e308) {
    return 0;
  }
  [a3 meanSeaLevelPressure];
  if (v6 > 115000.0) {
    return 0;
  }
  [a3 meanSeaLevelPressure];
  if (v7 < 80000.0) {
    return 0;
  }
  [a3 uncertainty];
  return v9 > 0.0;
}

- (BOOL)updateHistoricalMslpArray:(id)a3 from:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v91 = 1.79769313e308;
  unsigned int v7 = -[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:");
  if (!v7) {
    return v7;
  }
  unsigned int v7 = [(CLMeanSeaLevelPressureEstimator *)self getLastPressureSample:&v91];
  if (!v7) {
    return v7;
  }
  if (self->_cumulativeStartTime == 1.79769313e308
    || ([a3 timestamp], v8 - self->_cumulativeStartTime > 0.0))
  {
    [a3 setPressureMeasurement:v91];
    if (!v4 && self->_inVisitStatus) {
      [(CLMeanSeaLevelPressureEstimator *)self resetInVisitRebasedMslp];
    }
    double Current = CFAbsoluteTimeGetCurrent();
    int v10 = [(NSMutableArray *)self->_meanSeaLevelPressureArray count];
    int v82 = [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count];
    if (self->_cumulativeStartTime == 1.79769313e308)
    {
      if (v82 < 1)
      {
LABEL_49:
        [a3 timestamp];
        self->_double cumulativeStartTime = v48;
        goto LABEL_50;
      }
      [[-[NSMutableArray firstObject](self->_recentMeanSeaLevelPressureArray, "firstObject") timestamp];
      self->_double cumulativeStartTime = v11;
    }
    else if (v82 < 1)
    {
      goto LABEL_50;
    }
    [a3 timestamp];
    if (v18 - self->_cumulativeStartTime > 900.0)
    {
      if (v10 >= 15)
      {
        [(NSMutableArray *)self->_meanSeaLevelPressureArray removeObjectAtIndex:0];
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        uint64_t v19 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v112 = "mslpArrayCount";
          __int16 v113 = 1024;
          *(_DWORD *)uint64_t v114 = v10 - 1;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "remove the oldest mean sea level pressure,%s,%d", buf, 0x12u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_10232CFE8);
          }
          int v92 = 136315394;
          double v93 = "mslpArrayCount";
          __int16 v94 = 1024;
          *(_DWORD *)double v95 = v10 - 1;
          double v80 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v80);
          if (v80 != (char *)buf) {
            free(v80);
          }
        }
      }
      uint64_t v20 = objc_opt_new();
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
      id v22 = [(NSMutableArray *)recentMeanSeaLevelPressureArray countByEnumeratingWithState:&v87 objects:v110 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v88;
        double v24 = 0.0;
        double v25 = 0.0;
        double v26 = 0.0;
        double v27 = 0.0;
        do
        {
          for (unint64_t i = 0; i != v22; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v88 != v23) {
              objc_enumerationMutation(recentMeanSeaLevelPressureArray);
            }
            __int16 v29 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            [v29 timestamp];
            double v31 = v30;
            [v29 meanSeaLevelPressure];
            double v33 = v32;
            [v29 uncertainty];
            double v35 = v34;
            [v29 pressureMeasurement];
            double v24 = v24 + v31;
            double v25 = v25 + v33;
            double v26 = v26 + v35;
            double v27 = v27 + v36;
          }
          id v22 = [(NSMutableArray *)recentMeanSeaLevelPressureArray countByEnumeratingWithState:&v87 objects:v110 count:16];
        }
        while (v22);
      }
      else
      {
        double v24 = 0.0;
        double v25 = 0.0;
        double v26 = 0.0;
        double v27 = 0.0;
      }
      [v20 setTimestamp:v24 / (double)[self->_recentMeanSeaLevelPressureArray count]];
      [v20 setMeanSeaLevelPressure:v25 / (double)(unint64_t)[self->_recentMeanSeaLevelPressureArray count]];
      [v20 setUncertainty:v26 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count")];
      [v20 setPressureMeasurement:v27 / (double)(unint64_t)[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count")];
      [(NSMutableArray *)self->_meanSeaLevelPressureArray addObject:v20];
      double lastTimestampSavedMslpForRecovery = self->_lastTimestampSavedMslpForRecovery;
      if (lastTimestampSavedMslpForRecovery == 1.79769313e308
        || vabdd_f64(Current, lastTimestampSavedMslpForRecovery) > 180.0)
      {
        [(CLMeanSeaLevelPressureEstimator *)self saveMeanSeaLevelPressureArrayToPlist];
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      uint64_t v38 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v39 = [(NSMutableArray *)self->_meanSeaLevelPressureArray count];
        [v20 meanSeaLevelPressure];
        uint64_t v41 = v40;
        [v20 uncertainty];
        uint64_t v43 = v42;
        [v20 timestamp];
        uint64_t v45 = v44;
        [v20 pressureMeasurement];
        *(_DWORD *)buf = 136317442;
        uint64_t v112 = "count";
        __int16 v113 = 1024;
        *(_DWORD *)uint64_t v114 = v39;
        *(_WORD *)&v114[4] = 2080;
        *(void *)&v114[6] = "meanSeaLevelPressure";
        __int16 v115 = 2048;
        uint64_t v116 = v41;
        __int16 v117 = 2080;
        double v118 = "uncertainty";
        __int16 v119 = 2048;
        uint64_t v120 = v43;
        __int16 v121 = 2080;
        uint64_t v122 = "timestamp";
        __int16 v123 = 2048;
        uint64_t v124 = v45;
        __int16 v125 = 2080;
        double v126 = "measurePressure";
        __int16 v127 = 2048;
        uint64_t v128 = v46;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "add mslp to mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x62u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        unsigned int v71 = [(NSMutableArray *)self->_meanSeaLevelPressureArray count];
        [v20 meanSeaLevelPressure];
        uint64_t v73 = v72;
        [v20 uncertainty];
        uint64_t v75 = v74;
        [v20 timestamp];
        uint64_t v77 = v76;
        [v20 pressureMeasurement];
        int v92 = 136317442;
        double v93 = "count";
        __int16 v94 = 1024;
        *(_DWORD *)double v95 = v71;
        *(_WORD *)&v95[4] = 2080;
        *(void *)&v95[6] = "meanSeaLevelPressure";
        __int16 v96 = 2048;
        uint64_t v97 = v73;
        __int16 v98 = 2080;
        double v99 = "uncertainty";
        __int16 v100 = 2048;
        uint64_t v101 = v75;
        __int16 v102 = 2080;
        double v103 = "timestamp";
        __int16 v104 = 2048;
        uint64_t v105 = v77;
        __int16 v106 = 2080;
        double v107 = "measurePressure";
        __int16 v108 = 2048;
        uint64_t v109 = v78;
        __int16 v79 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v79);
        if (v79 != (char *)buf) {
          free(v79);
        }
      }
      meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
      sub_100134750(__p, "mean sea level pressure array updates to:");
      [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureArray:meanSeaLevelPressureArray withPrePhrase:__p];
      if (v86 < 0) {
        operator delete(__p[0]);
      }
      [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray removeAllObjects];

      goto LABEL_49;
    }
LABEL_50:
    if ((unint64_t)[(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count] >= 0xF)
    {
      [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray removeObjectAtIndex:0];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      __int16 v49 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v112 = "recentMslpArrayCount";
        __int16 v113 = 1024;
        *(_DWORD *)uint64_t v114 = v82 - 1;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "remove the oldest recent mslp,%s,%d", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        int v92 = 136315394;
        double v93 = "recentMslpArrayCount";
        __int16 v94 = 1024;
        *(_DWORD *)double v95 = v82 - 1;
        float v70 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v70);
        if (v70 != (char *)buf) {
          free(v70);
        }
      }
    }
    [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray addObject:a3];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    double v50 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v51 = [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count];
      [a3 meanSeaLevelPressure];
      uint64_t v53 = v52;
      [a3 uncertainty];
      uint64_t v55 = v54;
      [a3 timestamp];
      uint64_t v57 = v56;
      [a3 pressureMeasurement];
      *(_DWORD *)buf = 136317442;
      uint64_t v112 = "count";
      __int16 v113 = 1024;
      *(_DWORD *)uint64_t v114 = v51;
      *(_WORD *)&v114[4] = 2080;
      *(void *)&v114[6] = "meanSeaLevelPressure";
      __int16 v115 = 2048;
      uint64_t v116 = v53;
      __int16 v117 = 2080;
      double v118 = "uncertainty";
      __int16 v119 = 2048;
      uint64_t v120 = v55;
      __int16 v121 = 2080;
      uint64_t v122 = "timestamp";
      __int16 v123 = 2048;
      uint64_t v124 = v57;
      __int16 v125 = 2080;
      double v126 = "measurePressure";
      __int16 v127 = 2048;
      uint64_t v128 = v58;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "add mslp to recent mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x62u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      unsigned int v61 = [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count];
      [a3 meanSeaLevelPressure];
      uint64_t v63 = v62;
      [a3 uncertainty];
      uint64_t v65 = v64;
      [a3 timestamp];
      uint64_t v67 = v66;
      [a3 pressureMeasurement];
      int v92 = 136317442;
      double v93 = "count";
      __int16 v94 = 1024;
      *(_DWORD *)double v95 = v61;
      *(_WORD *)&v95[4] = 2080;
      *(void *)&v95[6] = "meanSeaLevelPressure";
      __int16 v96 = 2048;
      uint64_t v97 = v63;
      __int16 v98 = 2080;
      double v99 = "uncertainty";
      __int16 v100 = 2048;
      uint64_t v101 = v65;
      __int16 v102 = 2080;
      double v103 = "timestamp";
      __int16 v104 = 2048;
      uint64_t v105 = v67;
      __int16 v106 = 2080;
      double v107 = "measurePressure";
      __int16 v108 = 2048;
      uint64_t v109 = v68;
      __int16 v69 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v69);
      if (v69 != (char *)buf) {
        free(v69);
      }
    }
    double lastTimestampSavedRecentMslpForRecovery = self->_lastTimestampSavedRecentMslpForRecovery;
    if (lastTimestampSavedRecentMslpForRecovery == 1.79769313e308
      || vabdd_f64(Current, lastTimestampSavedRecentMslpForRecovery) > 180.0)
    {
      [(CLMeanSeaLevelPressureEstimator *)self saveRecentMeanSeaLevelPressureArrayToPlist];
    }
    double v60 = self->_recentMeanSeaLevelPressureArray;
    sub_100134750(v83, "recent mslp array updates to:");
    [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureArray:v60 withPrePhrase:v83];
    if (v84 < 0) {
      operator delete(v83[0]);
    }
    [(CLMeanSeaLevelPressureEstimator *)self getAndSendCurrentEstimateMeanSeaLevelPressureFrom:v4];
    LOBYTE(v7) = 1;
    return v7;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  double v12 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    [a3 timestamp];
    double cumulativeStartTime = self->_cumulativeStartTime;
    *(_DWORD *)buf = 134218240;
    uint64_t v112 = v14;
    __int16 v113 = 2048;
    *(double *)uint64_t v114 = cumulativeStartTime;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "return early in update historical mslp array due to fall back timestamp,sampleTimestamp,%f,cumulativeStartTime,%f", buf, 0x16u);
  }
  unsigned int v7 = sub_10013D1A0(115, 2);
  if (v7)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    [a3 timestamp];
    double v15 = self->_cumulativeStartTime;
    int v92 = 134218240;
    double v93 = v16;
    __int16 v94 = 2048;
    *(double *)double v95 = v15;
    uint64_t v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)updateInVisitRebasedMslp:(id)a3
{
  if (-[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:"))
  {
    [a3 meanSeaLevelPressure];
    -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](self->_inVisitRebasedMslp, "setMeanSeaLevelPressure:");
    [a3 uncertainty];
    -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:");
    [a3 timestamp];
    -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:");
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    double v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
      uint64_t v7 = v6;
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
      uint64_t v9 = v8;
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
      *(_DWORD *)buf = 134218496;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "in visit rebased location mean sea level pressure sample,meanSeaLevelPressure,%f,uncertainty,%f,timestamp,%f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
      double v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateInVisitRebasedMslp:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    [(CLMeanSeaLevelPressureEstimator *)self saveInVisitRebasedMslpToPlist];
  }
}

- (void)writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:(double)a3
{
  double v4 = __chkstk_darwin(self);
  if (*(unsigned char *)(v3 + 176))
  {
    double v5 = v4;
    uint64_t v6 = v3;
    if ([*(id *)(v3 + 32) count])
    {
      sub_10170140C(v22);
      v24 |= 1u;
      *(double *)&v22[77] = v5;
      sub_101726318((uint64_t)v22);
      uint64_t v7 = (char *)[*(id *)(v6 + 32) count];
      sub_1001DCFA4(&v20, (unint64_t)v7);
      sub_1001DCFA4(&v18, (unint64_t)v7);
      sub_1001DCFA4(&__p, (unint64_t)v7);
      if (v7)
      {
        for (unint64_t i = 0; i != v7; ++i)
        {
          [objc_msgSend(*(id *)(v6 + 32), "objectAtIndexedSubscript:", i) timestamp];
          *((void *)v20 + i) = v9;
          [objc_msgSend(*(id *)(v6 + 32), "objectAtIndexedSubscript:", i) meanSeaLevelPressure];
          *((void *)v18 + i) = v10;
          [objc_msgSend(*(id *)(v6 + 32), "objectAtIndexedSubscript:", i) uncertainty];
          *((void *)__p + i) = v11;
        }
      }
      uint64_t v12 = v23;
      if ((void **)(v23 + 32) != &v20)
      {
        sub_1002DD194((char *)(v23 + 32), (char *)v20, (uint64_t)v21, (v21 - (unsigned char *)v20) >> 3);
        uint64_t v12 = v23;
      }
      if ((void **)(v12 + 8) != &v18)
      {
        sub_1002DD194((char *)(v12 + 8), (char *)v18, (uint64_t)v19, (v19 - (unsigned char *)v18) >> 3);
        uint64_t v12 = v23;
      }
      if ((void **)(v12 + 56) != &__p)
      {
        sub_1002DD194((char *)(v12 + 56), (char *)__p, (uint64_t)v17, (v17 - (unsigned char *)__p) >> 3);
        uint64_t v12 = v23;
      }
      uint64_t v13 = *(void *)(v6 + 264);
      *(unsigned char *)(v12 + 88) |= 1u;
      *(void *)(v12 + 80) = v13;
      if (qword_10248AF88 != -1) {
        dispatch_once(&qword_10248AF88, &stru_10232D008);
      }
      if (qword_10248AF90) {
        sub_1019E5150(qword_10248AF90, (uint64_t)v22);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      __int16 v14 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "write initial mean sea level pressure array to msl.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        uint64_t v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
      if (__p)
      {
        uint64_t v17 = __p;
        operator delete(__p);
      }
      if (v18)
      {
        uint64_t v19 = v18;
        operator delete(v18);
      }
      if (v20)
      {
        uint64_t v21 = v20;
        operator delete(v20);
      }
      sub_101706914((PB::Base *)v22);
    }
  }
}

- (void)onMslp:(const CMMeanSeaLevelPressure *)a3
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  double v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double var1 = a3->var1;
    double var2 = a3->var2;
    *(_DWORD *)buf = 134218496;
    CFAbsoluteTime v15 = Current;
    __int16 v16 = 2048;
    double v17 = var1;
    __int16 v18 = 2048;
    double v19 = var2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mslp from aop,timestamp,%f,mslp,%f,uncertainty,%f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    CFAbsoluteTimeGetCurrent();
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator onMslp:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  uint64_t v9 = objc_opt_new();
  [v9 setTimestamp:a3->var0];
  [v9 setMeanSeaLevelPressure:a3->var1];
  [v9 setUncertainty:a3->var2];
  if ([(CLMeanSeaLevelPressureEstimator *)self updateHistoricalMslpArray:v9 from:1])
  {
    ++self->_numberOfWeatherUpdate;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v10 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "mslp array is successfully updated from AOP weather estimate", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 == -1)
      {
LABEL_25:
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator onMslp:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
        goto LABEL_19;
      }
LABEL_27:
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      goto LABEL_25;
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v11 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "mslp array fails to update from AOP weather estimate", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 == -1) {
        goto LABEL_25;
      }
      goto LABEL_27;
    }
  }
LABEL_19:
}

- (void)resetInVisitRebasedMslp
{
  [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setUncertainty:1.79769313e308];
  [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setMeanSeaLevelPressure:1.79769313e308];
  [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setTimestamp:1.79769313e308];
  [(CLMeanSeaLevelPressureEstimator *)self clearInVisitRebasedMslpInPlist];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  uint64_t v3 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset in visit rebased Mslp,timestamp,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    CFAbsoluteTimeGetCurrent();
    double v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)clearInVisitRebasedMslpInPlist
{
  uint64_t v2 = sub_1000A6958();
  sub_1004CF7DC(v2, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", 0xFFFFFFFFLL);
  uint64_t v3 = sub_1000A6958();
  sub_1004CF7DC(v3, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", 0xFFFFFFFFLL);
  uint64_t v4 = sub_1000A6958();
  sub_1004CF7DC(v4, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", 0xFFFFFFFFLL);
  uint64_t v5 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v5 + 944))();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  uint64_t v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "clear visit rebase location to plist,timestamp,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    CFAbsoluteTimeGetCurrent();
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator clearInVisitRebasedMslpInPlist]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (void)clearMeanSeaLevelPressureArrayInPlist
{
  uint64_t v2 = sub_1000A6958();
  sub_1004CF870(v2);
  uint64_t v3 = sub_1000A6958();
  sub_1004CF870(v3);
  uint64_t v4 = sub_1000A6958();
  sub_1004CF870(v4);
  uint64_t v5 = sub_1000A6958();
  sub_1004CF870(v5);
  uint64_t v6 = sub_1000A6958();
  sub_1004CF7DC(v6, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", 0xFFFFFFFFLL);
  uint64_t v7 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v7 + 944))();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  uint64_t v8 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "clear mean sea level pressure in plist,timestamp,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    CFAbsoluteTimeGetCurrent();
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
}

- (void)clearRecentMeanSeaLevelPressureArrayInPlist
{
  uint64_t v2 = sub_1000A6958();
  sub_1004CF870(v2);
  uint64_t v3 = sub_1000A6958();
  sub_1004CF870(v3);
  uint64_t v4 = sub_1000A6958();
  sub_1004CF870(v4);
  uint64_t v5 = sub_1000A6958();
  sub_1004CF870(v5);
  uint64_t v6 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v6 + 944))();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  uint64_t v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "clear recent mean sea level pressure in plist,timestamp,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    CFAbsoluteTimeGetCurrent();
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)saveMeanSeaLevelPressureArrayToPlist
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if ([(NSMutableArray *)self->_meanSeaLevelPressureArray count]
    && self->_lastRefreshTimestamp != 1.79769313e308)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = objc_alloc_init((Class)NSMutableArray);
    char v24 = self;
    id v25 = objc_alloc_init((Class)NSMutableArray);
    meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
    sub_100134750(__p, "save mean sea level array to cache:");
    [(CLMeanSeaLevelPressureEstimator *)v24 printMeanSeaLevelPressureArray:meanSeaLevelPressureArray withPrePhrase:__p];
    if (v31 < 0) {
      operator delete(__p[0]);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = v24->_meanSeaLevelPressureArray;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v12 timestamp];
          [v4 addObject:[NSNumber numberWithDouble:x0]];
          [v12 meanSeaLevelPressure];
          [v5 addObject:[NSNumber numberWithDouble:]];
          [v12 uncertainty];
          [v6 addObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")];
          [v12 pressureMeasurement];
          [v25 addObject:[NSNumber numberWithDouble:]];
        }
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v9);
    }
    [(CLMeanSeaLevelPressureEstimator *)v24 clearMeanSeaLevelPressureArrayInPlist];
    uint64_t v13 = sub_1000A6958();
    sub_1004D258C(v13);
    uint64_t v14 = sub_1000A6958();
    sub_1004D258C(v14);
    uint64_t v15 = sub_1000A6958();
    sub_1004D258C(v15);
    uint64_t v16 = sub_1000A6958();
    sub_1004D258C(v16);
    uint64_t v17 = sub_1000A6958();
    p_lastRefreshTimestamp = (CLMeanSeaLevelPressureEstimator *)&v24->_lastRefreshTimestamp;
    sub_10016332C(v17, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", &v24->_lastRefreshTimestamp);
    uint64_t v19 = sub_1000A6958();
    (*(void (**)(uint64_t))(*(void *)v19 + 944))(v19);
    v24->_double lastTimestampSavedMslpForRecovery = Current;

    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v20 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      Class isa = p_lastRefreshTimestamp->super.isa;
      *(_DWORD *)buf = 134217984;
      Class v35 = isa;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "save the latest refresh time to plist,%f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      Class v22 = p_lastRefreshTimestamp->super.isa;
      int v32 = 134217984;
      Class v33 = v22;
      uint64_t v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator saveMeanSeaLevelPressureArrayToPlist]", "%s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
  }
}

- (void)saveRecentMeanSeaLevelPressureArrayToPlist
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if ([(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = objc_alloc_init((Class)NSMutableArray);
    __int16 v18 = self;
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_100134750(__p, "save recent mean sea level array to cache:");
    [(CLMeanSeaLevelPressureEstimator *)v18 printMeanSeaLevelPressureArray:recentMeanSeaLevelPressureArray withPrePhrase:__p];
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obint64_t j = v18->_recentMeanSeaLevelPressureArray;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16, v18);
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v12 timestamp];
          [v4 addObject:[NSNumber numberWithDouble:]];
          [v12 meanSeaLevelPressure];
          [v5 addObject:[NSNumber numberWithDouble:]];
          [v12 uncertainty];
          [v6 addObject:[NSNumber numberWithDouble:]];
          [v12 pressureMeasurement];
          [v7 addObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")]];
        }
        id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }
    [v19 clearRecentMeanSeaLevelPressureArrayInPlist];
    uint64_t v13 = sub_1000A6958();
    sub_1004D258C(v13);
    uint64_t v14 = sub_1000A6958();
    sub_1004D258C(v14);
    uint64_t v15 = sub_1000A6958();
    sub_1004D258C(v15);
    uint64_t v16 = sub_1000A6958();
    sub_1004D258C(v16);
    uint64_t v17 = sub_1000A6958();
    (*(void (**)(uint64_t))(*(void *)v17 + 944))(v17);
    *((CFAbsoluteTime *)v19 + 13) = Current;
  }
}

- (void)saveInVisitRebasedMslpToPlist
{
  [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
  if (v3 != 1.79769313e308)
  {
    [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
    if (v4 != 1.79769313e308)
    {
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
      if (v5 != 1.79769313e308)
      {
        [(CLMeanSeaLevelPressureEstimator *)self clearInVisitRebasedMslpInPlist];
        uint64_t v6 = sub_1000A6958();
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
        *(void *)buf = v7;
        sub_10016332C(v6, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", buf);
        uint64_t v8 = sub_1000A6958();
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
        *(void *)buf = v9;
        sub_10016332C(v8, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", buf);
        uint64_t v10 = sub_1000A6958();
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
        *(void *)buf = v11;
        sub_10016332C(v10, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", buf);
        uint64_t v12 = *(void *)sub_1000A6958();
        (*(void (**)(void))(v12 + 944))();
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        uint64_t v13 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
          uint64_t v15 = v14;
          [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
          uint64_t v17 = v16;
          [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
          *(_DWORD *)buf = 134218496;
          *(void *)&uint8_t buf[4] = v15;
          __int16 v21 = 2048;
          uint64_t v22 = v17;
          __int16 v23 = 2048;
          uint64_t v24 = v18;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "save visit rebased mean sea level pressure to plist,mslp,%f,uncertainty,%f,timestamp,%f", buf, 0x20u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_10232CFE8);
          }
          [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
          [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
          [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
          uint64_t v19 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator saveInVisitRebasedMslpToPlist]", "%s\n", v19);
          if (v19 != buf) {
            free(v19);
          }
        }
      }
    }
  }
}

- (void)saveInVisitStateToPlist
{
  uint64_t v3 = sub_1000A6958();
  sub_1004CF7DC(v3, "CLMeanSeaLevelPressureEstimator_InVisitStatus", 0xFFFFFFFFLL);
  uint64_t v4 = sub_1000A6958();
  sub_1004CF7DC(v4, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", 0xFFFFFFFFLL);
  uint64_t v5 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v5 + 944))();
  uint64_t v6 = sub_1000A6958();
  p_inVisitStatus = &self->_inVisitStatus;
  sub_1000EA238(v6, "CLMeanSeaLevelPressureEstimator_InVisitStatus", &self->_inVisitStatus);
  uint64_t v8 = sub_1000A6958();
  p_exitVisitTimestamp = &self->_exitVisitTimestamp;
  sub_10016332C(v8, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", p_exitVisitTimestamp);
  uint64_t v10 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v10 + 944))();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  uint64_t v11 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = *p_inVisitStatus;
    uint64_t v13 = *(void *)p_exitVisitTimestamp;
    *(_DWORD *)buf = 67109376;
    BOOL v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "save visit to plist,inVisitStatus,%d,exitVisitTimestamp,%f", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator saveInVisitStateToPlist]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
}

- (void)retrieveMeanSeaLevelPressureEstimatorState
{
  double v84 = 0.0;
  double v85 = 1.79769313e308;
  double v82 = 1.79769313e308;
  double v83 = 1.79769313e308;
  double v81 = 1.79769313e308;
  BOOL v80 = 0;
  CFTypeRef v78 = 0;
  __int16 v79 = 0;
  CFTypeRef v76 = 0;
  CFTypeRef v77 = 0;
  CFTypeRef v74 = 0;
  uint64_t v75 = 0;
  CFTypeRef v72 = 0;
  CFTypeRef v73 = 0;
  uint64_t v3 = sub_1000A6958();
  sub_1000A699C(v3, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", &v83);
  uint64_t v4 = sub_1000A6958();
  sub_1000A699C(v4, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", &v82);
  uint64_t v5 = sub_1000A6958();
  sub_1000A699C(v5, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", &v81);
  uint64_t v6 = sub_1000A6958();
  sub_1000D2988(v6, "CLMeanSeaLevelPressureEstimator_InVisitStatus", &v80);
  uint64_t v7 = sub_1000A6958();
  sub_1000A699C(v7, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", &v84);
  uint64_t v8 = sub_1000A6958();
  sub_1000A699C(v8, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", &v85);
  uint64_t v9 = sub_1000A6958();
  sub_1004D1D1C(v9, @"CLMeanSeaLevelPressureEstimator_MslpArray", (CFTypeRef *)&v79);
  uint64_t v10 = sub_1000A6958();
  sub_1004D1D1C(v10, @"CLMeanSeaLevelPressureEstimator_MslpUncertaintyArray", &v78);
  uint64_t v11 = sub_1000A6958();
  sub_1004D1D1C(v11, @"CLMeanSeaLevelPressureEstimator_MslpTimestampArray", &v77);
  uint64_t v12 = sub_1000A6958();
  sub_1004D1D1C(v12, @"CLMeanSeaLevelPressureEstimator_PressureMeasurementArray", &v76);
  uint64_t v13 = sub_1000A6958();
  sub_1004D1D1C(v13, @"CLMeanSeaLevelPressureEstimator_RecentMslpArray", (CFTypeRef *)&v75);
  uint64_t v14 = sub_1000A6958();
  sub_1004D1D1C(v14, @"CLMeanSeaLevelPressureEstimator_RecentMslpUncertaintyArray", &v74);
  uint64_t v15 = sub_1000A6958();
  sub_1004D1D1C(v15, @"CLMeanSeaLevelPressureEstimator_RecentMslpTimestampArray", &v73);
  uint64_t v16 = sub_1000A6958();
  sub_1004D1D1C(v16, @"CLMeanSeaLevelPressureEstimator_RecentPressureMeasurementArray", &v72);
  if (v85 == 1.79769313e308
    || (__int16 v17 = v79) == 0
    || (uint64_t v18 = (void *)v78) == 0
    || (uint64_t v19 = (void *)v77) == 0
    || (uint64_t v20 = (void *)v76) == 0)
  {
LABEL_53:
    self->_double exitVisitTimestamp = v84;
    self->_BOOL inVisitStatus = v80;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v46 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL inVisitStatus = self->_inVisitStatus;
      double exitVisitTimestamp = self->_exitVisitTimestamp;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)double v91 = inVisitStatus;
      *(_WORD *)&v91[4] = 2048;
      *(double *)&v91[6] = exitVisitTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "retrieve invisit state,inVisitStatus,%d,exitVisitTimestamp,%f", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      BOOL v62 = self->_inVisitStatus;
      double v63 = self->_exitVisitTimestamp;
      int v86 = 67109376;
      *(_DWORD *)long long v87 = v62;
      *(_WORD *)&v87[4] = 2048;
      *(double *)&v87[6] = v63;
      uint64_t v64 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v64);
      if (v64 != (char *)buf) {
        free(v64);
      }
    }
    inVisitRebasedMslp = self->_inVisitRebasedMslp;
    if (!self->_inVisitStatus || v83 == 1.79769313e308 || v82 == 1.79769313e308 || v81 == 1.79769313e308)
    {
      [(CLMeanSeaLevelPressureData *)inVisitRebasedMslp setMeanSeaLevelPressure:1.79769313e308];
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setUncertainty:1.79769313e308];
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setTimestamp:1.79769313e308];
    }
    else
    {
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](inVisitRebasedMslp, "setMeanSeaLevelPressure:", v83, v81);
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setUncertainty:v82];
      [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp setTimestamp:v81];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v50 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
        uint64_t v52 = v51;
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
        uint64_t v54 = v53;
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
        *(_DWORD *)buf = 134218496;
        *(void *)double v91 = v52;
        *(_WORD *)&v91[8] = 2048;
        *(void *)&v91[10] = v54;
        __int16 v92 = 2048;
        uint64_t v93 = v55;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "retrieve invisit rebase mslp,inVisitRebasedMslp,%f,inVisitRebasedMslpUnc,%f,inVisitRebasedMslpTime,%f", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10232CFE8);
        }
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp meanSeaLevelPressure];
        uint64_t v57 = v56;
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp uncertainty];
        uint64_t v59 = v58;
        [(CLMeanSeaLevelPressureData *)self->_inVisitRebasedMslp timestamp];
        int v86 = 134218496;
        *(void *)long long v87 = v57;
        *(_WORD *)&v87[8] = 2048;
        *(void *)&v87[10] = v59;
        __int16 v88 = 2048;
        uint64_t v89 = v60;
        unsigned int v61 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v61);
        if (v61 != (char *)buf) {
          free(v61);
        }
      }
    }
    if ([(NSMutableArray *)self->_meanSeaLevelPressureArray count]
      || [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray count])
    {
      [(CLMeanSeaLevelPressureEstimator *)self updateUncertinatyAndSendCurrentEstimateMslpFrom:0];
    }
    return;
  }
  int v21 = [v79 count:v85];
  unsigned int v22 = [v18 count];
  unsigned int v23 = [v19 count];
  unsigned int v24 = [v20 count];
  if (v21 == v22 && v21 == v23 && v22 == v23 && v24 == v23 && v24 == v22 && v24 == v21)
  {
    self->_double lastRefreshTimestamp = v85;
    if (v21 >= 1)
    {
      uint64_t v25 = 0;
      uint64_t v26 = v21;
      do
      {
        long long v27 = objc_opt_new();
        [objc_msgSend(v19, "objectAtIndexedSubscript:", v25) doubleValue];
        [v27 setTimestamp:];
        [v17[v25] doubleValue];
        [v27 setMeanSeaLevelPressure:];
        [objc_msgSend(v18, "objectAtIndexedSubscript:", v25) doubleValue];
        [v27 setUncertainty:];
        [v20[v25] doubleValue];
        [v27 setPressureMeasurement:];
        [(NSMutableArray *)self->_meanSeaLevelPressureArray addObject:v27];

        ++v25;
      }
      while (v26 != v25);
    }
    long long v28 = v75;
    if (v75)
    {
      long long v29 = (void *)v74;
      if (v74)
      {
        double v30 = (void *)v73;
        if (v73)
        {
          char v31 = (void *)v72;
          if (v72)
          {
            int v32 = [v75 count];
            unsigned int v33 = [v29 count];
            unsigned int v34 = [v30 count];
            unsigned int v35 = [v31 count];
            if (v32 == v33 && v32 == v34 && v33 == v34 && v35 == v34 && v35 == v33 && v35 == v32)
            {
              if (v32 >= 1)
              {
                uint64_t v36 = 0;
                uint64_t v37 = v32;
                do
                {
                  uint64_t v38 = objc_opt_new();
                  [v30[v36] doubleValue];
                  [v38 setTimestamp:];
                  [objc_msgSend(v28, "objectAtIndexedSubscript:", v36) doubleValue];
                  [v38 setMeanSeaLevelPressure:];
                  [v29[v36] doubleValue];
                  [v38 setUncertainty:];
                  [v31[v36] doubleValue];
                  [v38 setPressureMeasurement:];
                  [(NSMutableArray *)self->_recentMeanSeaLevelPressureArray addObject:v38];

                  ++v36;
                }
                while (v37 != v36);
              }
            }
            else
            {
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_10232CFE8);
              }
              uint64_t v41 = qword_1024191E8;
              if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "the saved recent mean sea level pressure arrays have different sizes.", buf, 2u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1024191E0 != -1) {
                  dispatch_once(&qword_1024191E0, &stru_10232CFE8);
                }
                LOWORD(v86) = 0;
                uint64_t v67 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v67);
                if (v67 != (char *)buf) {
                  free(v67);
                }
              }
            }
          }
        }
      }
    }
    meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
    sub_100134750(__p, "retrieve mean sea level pressure array from plist:");
    [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureArray:meanSeaLevelPressureArray withPrePhrase:__p];
    if (v71 < 0) {
      operator delete(__p[0]);
    }
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_100134750(v68, "retrieve recent mean sea level pressure array from plist:");
    [(CLMeanSeaLevelPressureEstimator *)self printMeanSeaLevelPressureArray:recentMeanSeaLevelPressureArray withPrePhrase:v68];
    if (v69 < 0) {
      operator delete(v68[0]);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    uint64_t v44 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double lastRefreshTimestamp = self->_lastRefreshTimestamp;
      *(_DWORD *)buf = 134217984;
      *(double *)double v91 = lastRefreshTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "retrieve the latest array refresh time from plist,%f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232CFE8);
      }
      double v65 = self->_lastRefreshTimestamp;
      int v86 = 134217984;
      *(double *)long long v87 = v65;
      uint64_t v66 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v66);
      if (v66 != (char *)buf) {
        free(v66);
      }
    }

    self->_currentEstimateMslp = (CLMeanSeaLevelPressureData *)[(CLMeanSeaLevelPressureEstimator *)self getEstimatedMeanSeaLevelPressure];
    [(CLMeanSeaLevelPressureEstimator *)self writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:CFAbsoluteTimeGetCurrent()];
    goto LABEL_53;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232CFE8);
  }
  unsigned int v39 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "the saved mean sea level pressure arrays have different sizes.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232CFE8);
    }
    LOWORD(v86) = 0;
    uint64_t v40 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v40);
    if (v40 != (char *)buf) {
      free(v40);
    }
  }
}

- (double)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(double)a3
{
  self->_double lastRefreshTimestamp = a3;
}

- (double)exitVisitTimestamp
{
  return self->_exitVisitTimestamp;
}

- (void)setExitVisitTimestamp:(double)a3
{
  self->_double exitVisitTimestamp = a3;
}

- (double)cumulativeStartTime
{
  return self->_cumulativeStartTime;
}

- (void)setCumulativeStartTime:(double)a3
{
  self->_double cumulativeStartTime = a3;
}

- (BOOL)inVisitStatus
{
  return self->_inVisitStatus;
}

- (void)setInVisitStatus:(BOOL)a3
{
  self->_BOOL inVisitStatus = a3;
}

- (double)currentLatitude
{
  return self->_currentLatitude;
}

- (void)setCurrentLatitude:(double)a3
{
  self->_double currentLatitude = a3;
}

- (double)currentLongitude
{
  return self->_currentLongitude;
}

- (void)setCurrentLongitude:(double)a3
{
  self->_double currentLongitude = a3;
}

- (double)currentPressure
{
  return self->_currentPressure;
}

- (void)setCurrentPressure:(double)a3
{
  self->_currentPressure = a3;
}

- (void)setMinPressure:(double)a3
{
  self->_minPressure = a3;
}

- (void)setMaxPressure:(double)a3
{
  self->_maxPressure = a3;
}

- (BOOL)firstRefreshAfterVisit
{
  return self->_firstRefreshAfterVisit;
}

- (void)setFirstRefreshAfterVisit:(BOOL)a3
{
  self->_BOOL firstRefreshAfterVisit = a3;
}

- (int)numberOfRebaseBtwRefresh
{
  return self->_numberOfRebaseBtwRefresh;
}

- (void)setNumberOfRebaseBtwRefresh:(int)a3
{
  self->_int numberOfRebaseBtwRefresh = a3;
}

- (int)numberOfTrackEndedBtwRefresh
{
  return self->_numberOfTrackEndedBtwRefresh;
}

- (void)setNumberOfTrackEndedBtwRefresh:(int)a3
{
  self->_int numberOfTrackEndedBtwRefresh = a3;
}

- (void).cxx_destruct
{
  value = self->_mslpDispatcher.__ptr_.__value_;
  self->_mslpDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 30) = 0;
  return self;
}

@end