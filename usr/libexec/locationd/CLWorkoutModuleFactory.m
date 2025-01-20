@interface CLWorkoutModuleFactory
- (id).cxx_construct;
- (id)createNewModules:(id)a3 universe:(id)a4 settings:(SettingStructure *)a5;
- (id)generateTheRecording:(id)a3 universe:(id)a4 settings:(SettingStructure *)a5;
- (id)initFor:(int)a3;
- (vector<ModuleName,)removeDisableModules:(CLWorkoutModuleFactory *)self setting:(SEL)a3;
- (void)dealloc;
@end

@implementation CLWorkoutModuleFactory

- (id)initFor:(int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLWorkoutModuleFactory;
  v4 = [(CLWorkoutModuleFactory *)&v14 init];
  if (v4)
  {
    if (a3 == 1)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E0D0);
      }
      v8 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Factory: initFor phone", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234E0D0);
        }
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutModuleFactory initFor:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      p_moduleNames = &v4->_moduleNames;
      v7 = &qword_1024898C8;
    }
    else if (a3)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E0D0);
      }
      v9 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Factory: initFor default", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234E0D0);
        }
        v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutModuleFactory initFor:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
      p_moduleNames = &v4->_moduleNames;
      v7 = &qword_1024898E0;
    }
    else
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E0D0);
      }
      v5 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Factory: initFor watch", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234E0D0);
        }
        v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutModuleFactory initFor:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
      p_moduleNames = &v4->_moduleNames;
      v7 = &qword_1024898B0;
    }
    if (p_moduleNames != (vector<ModuleName, std::allocator<ModuleName>> *)v7) {
      sub_101A45B2C(p_moduleNames, (char *)*v7, (char *)v7[1], (v7[1] - *v7) >> 2);
    }
  }
  return v4;
}

- (id)createNewModules:(id)a3 universe:(id)a4 settings:(SettingStructure *)a5
{
  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  v37 = 0;
  v38 = 0;
  v39 = 0;
  begin = self->_moduleNames.__begin_;
  end = self->_moduleNames.__end_;
  int64_t v9 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v9 < 0) {
      sub_1001D7FD4();
    }
    v10 = (char *)operator new((char *)end - (char *)begin);
    v11 = &v10[4 * (v9 >> 2)];
    v37 = v10;
    v39 = v11;
    memmove(v10, begin, v9);
    v38 = v11;
  }
  long long v12 = *(_OWORD *)&a5->privacyTimeOffset;
  v53[2] = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
  v53[3] = v12;
  long long v13 = *(_OWORD *)a5->workoutRecorderSessionId;
  v53[4] = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
  v53[5] = v13;
  long long v14 = *(_OWORD *)&a5->hasSyncInWatch;
  v53[0] = *(_OWORD *)&a5->disableAveragedALS;
  v53[1] = v14;
  p_recordingType = &a5->recordingType;
  if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1000DC48C(&__p, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    long long __p = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
    uint64_t v55 = *((void *)&a5->recordingType.__r_.__value_.var0.var1 + 2);
  }
  long long v56 = *(_OWORD *)&a5->recordingType.__r_.var0;
  long long v57 = *(_OWORD *)&a5[1].disableAveragedALS;
  long long v58 = *(_OWORD *)&a5[1].hasSyncInWatch;
  long long v59 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
  [(CLWorkoutModuleFactory *)self removeDisableModules:&v37 setting:v53];
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p);
  }
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
  v16 = v40;
  v33 = v41;
  if (v40 != v41)
  {
    do
    {
      uint64_t v17 = *v16;
      v18 = &qword_1024898A0;
      uint64_t v19 = qword_1024898A0;
      if (qword_1024898A0)
      {
        while (1)
        {
          while (1)
          {
            v18 = (uint64_t *)v19;
            int v20 = *(_DWORD *)(v19 + 32);
            if (v20 <= (int)v17) {
              break;
            }
            uint64_t v19 = *v18;
            v21 = (uint64_t **)v18;
            if (!*v18) {
              goto LABEL_20;
            }
          }
          if (v20 >= (int)v17) {
            break;
          }
          uint64_t v19 = v18[1];
          if (!v19)
          {
            v21 = (uint64_t **)(v18 + 1);
            goto LABEL_20;
          }
        }
      }
      else
      {
        v21 = (uint64_t **)&qword_1024898A0;
LABEL_20:
        v22 = operator new(0x30uLL);
        v22[8] = v17;
        *((void *)v22 + 5) = 0;
        sub_101A45ACC((uint64_t)v18, v21, (uint64_t *)v22);
        v18 = (uint64_t *)v22;
      }
      id v23 = objc_alloc((Class)v18[5]);
      long long v24 = *(_OWORD *)&a5->privacyTimeOffset;
      v46[2] = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
      v46[3] = v24;
      long long v25 = *(_OWORD *)a5->workoutRecorderSessionId;
      v46[4] = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
      v46[5] = v25;
      long long v26 = *(_OWORD *)&a5->hasSyncInWatch;
      v46[0] = *(_OWORD *)&a5->disableAveragedALS;
      v46[1] = v26;
      if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
      {
        sub_1000DC48C(&v47, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
      }
      else
      {
        long long v47 = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
        uint64_t v48 = *((void *)&a5->recordingType.__r_.__value_.var0.var1 + 2);
      }
      long long v27 = *(_OWORD *)&a5[1].disableAveragedALS;
      long long v49 = *(_OWORD *)&a5->recordingType.__r_.var0;
      long long v50 = v27;
      long long v28 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
      long long v51 = *(_OWORD *)&a5[1].hasSyncInWatch;
      long long v52 = v28;
      id v29 = [v23 initWithDelegate:a3 universeCopy:a4 settings:v46];
      if (SHIBYTE(v48) < 0) {
        operator delete((void *)v47);
      }
      [v36 setObject:v29 forKey:[NSNumber numberWithInt:v17]];
      if (v29)
      {
        [v29 setPrivacyTimeOffset:a5->privacyTimeOffset];
      }
      else
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234E0D0);
        }
        v30 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v45 = v17;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "CLWorkoutModuleFactory: the added module is invalid: %d", buf, 8u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234E0D0);
          }
          int v42 = 67109120;
          int v43 = v17;
          v31 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutModuleFactory createNewModules:universe:settings:]", "%s\n", v31);
          if (v31 != (char *)buf) {
            free(v31);
          }
        }
      }
      ++v16;
    }
    while (v16 != v33);
    v16 = v40;
  }
  if (v16)
  {
    v41 = v16;
    operator delete(v16);
  }
  return v36;
}

- (id)generateTheRecording:(id)a3 universe:(id)a4 settings:(SettingStructure *)a5
{
  long long v9 = *(_OWORD *)&a5->privacyTimeOffset;
  v36[2] = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
  v36[3] = v9;
  long long v10 = *(_OWORD *)a5->workoutRecorderSessionId;
  v36[4] = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
  v36[5] = v10;
  long long v11 = *(_OWORD *)&a5->hasSyncInWatch;
  v36[0] = *(_OWORD *)&a5->disableAveragedALS;
  v36[1] = v11;
  p_recordingType = &a5->recordingType;
  if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1000DC48C(&__p, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    long long __p = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
    uint64_t v38 = *((void *)&a5->recordingType.__r_.__value_.var0.var1 + 2);
  }
  long long v39 = *(_OWORD *)&a5->recordingType.__r_.var0;
  long long v40 = *(_OWORD *)&a5[1].disableAveragedALS;
  long long v41 = *(_OWORD *)&a5[1].hasSyncInWatch;
  long long v42 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
  id v13 = [(CLWorkoutModuleFactory *)self createNewModules:a3 universe:a4 settings:v36];
  if (SHIBYTE(v38) < 0) {
    operator delete((void *)__p);
  }
  long long v14 = [CLWorkoutRecording alloc];
  long long v15 = *(_OWORD *)&a5->privacyTimeOffset;
  long long v26 = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
  long long v27 = v15;
  long long v16 = *(_OWORD *)a5->workoutRecorderSessionId;
  long long v28 = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
  long long v29 = v16;
  long long v17 = *(_OWORD *)&a5->hasSyncInWatch;
  long long v24 = *(_OWORD *)&a5->disableAveragedALS;
  long long v25 = v17;
  if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1000DC48C(&v30, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    long long v30 = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
    uint64_t v31 = *((void *)&p_recordingType->__r_.__value_.var0.var1 + 2);
  }
  long long v18 = *(_OWORD *)&a5[1].disableAveragedALS;
  long long v32 = *(_OWORD *)&a5->recordingType.__r_.var0;
  long long v33 = v18;
  long long v19 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
  long long v34 = *(_OWORD *)&a5[1].hasSyncInWatch;
  long long v35 = v19;
  int v20 = [(CLWorkoutRecording *)v14 initWithDelegate:a3 universe:a4 moduleDictionary:v13 setting:&v24];
  if (SHIBYTE(v31) < 0) {
    operator delete((void *)v30);
  }
  id v21 = [v13 objectForKey:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 14, v24, v25, v26, v27, v28, v29)];
  if (v21)
  {
    [v21 setGetStartLocation:-[CLWorkoutRecording getLocationBlock](v20, "getLocationBlock")];
    -[CLWorkoutRecording setMotionStateFunction:](v20, "setMotionStateFunction:", [v21 getRecordEventBlock]);
    if (a5->hasSyncInWatch) {
      [v21 setWorkoutCount:1];
    }
    id v22 = [v13 objectForKey:[NSNumber numberWithInt:9]];
    if (v22) {
      [v21 setBlockUpdateIsCycling:[v22 getBlockSetIsCycling]];
    }
  }

  return v20;
}

- (vector<ModuleName,)removeDisableModules:(CLWorkoutModuleFactory *)self setting:(SEL)a3
{
  if (a5->accelIntervalSeconds <= 0.0)
  {
    begin = a4->__begin_;
    end = a4->__end_;
    int v44 = 0;
    long long v10 = sub_101A459E4(begin, end, &v44);
    if (a4->__end_ != v10) {
      a4->__end_ = v10;
    }
  }
  if (a5->disableAveragedALS)
  {
    long long v11 = a4->__begin_;
    long long v12 = a4->__end_;
    int v44 = 2;
    id v13 = sub_101A459E4(v11, v12, &v44);
    if (a4->__end_ != v13) {
      a4->__end_ = v13;
    }
  }
  if (a5->disableHeartRate)
  {
    long long v14 = a4->__begin_;
    long long v15 = a4->__end_;
    int v44 = 12;
    long long v16 = sub_101A459E4(v14, v15, &v44);
    if (a4->__end_ != v16) {
      a4->__end_ = v16;
    }
  }
  if (a5->rotationRateIntervalSeconds <= 0.0)
  {
    long long v17 = a4->__begin_;
    long long v18 = a4->__end_;
    int v44 = 6;
    long long v19 = sub_101A459E4(v17, v18, &v44);
    if (a4->__end_ != v19) {
      a4->__end_ = v19;
    }
  }
  if (a5->disableHealthKitInfo)
  {
    int v20 = a4->__begin_;
    id v21 = a4->__end_;
    int v44 = 11;
    id v22 = sub_101A459E4(v20, v21, &v44);
    if (a4->__end_ != v22) {
      a4->__end_ = v22;
    }
  }
  if (a5->magIntervalSeconds <= 0.0)
  {
    id v23 = a4->__begin_;
    long long v24 = a4->__end_;
    int v44 = 13;
    long long v25 = sub_101A459E4(v23, v24, &v44);
    if (a4->__end_ != v25) {
      a4->__end_ = v25;
    }
  }
  if (a5->disableMotionState)
  {
    long long v26 = a4->__begin_;
    long long v27 = a4->__end_;
    int v44 = 14;
    long long v28 = sub_101A459E4(v26, v27, &v44);
    if (a4->__end_ != v28) {
      a4->__end_ = v28;
    }
  }
  if (a5->disableBodyMetrics && a5->disableMeanMaxMets)
  {
    long long v29 = a4->__begin_;
    long long v30 = a4->__end_;
    int v44 = 4;
    uint64_t v31 = sub_101A459E4(v29, v30, &v44);
    if (a4->__end_ != v31) {
      a4->__end_ = v31;
    }
  }
  if (a5->disableOdometer)
  {
    long long v32 = a4->__begin_;
    long long v33 = a4->__end_;
    int v44 = 15;
    long long v34 = sub_101A459E4(v32, v33, &v44);
    if (a4->__end_ != v34) {
      a4->__end_ = v34;
    }
  }
  if (a5->disablePressure)
  {
    long long v35 = a4->__begin_;
    id v36 = a4->__end_;
    int v44 = 16;
    v37 = sub_101A459E4(v35, v36, &v44);
    if (a4->__end_ != v37) {
      a4->__end_ = v37;
    }
  }
  if (a5->disableWatchOrientation && a5->disableWatchOnWristStatus)
  {
    uint64_t v38 = a4->__begin_;
    long long v39 = a4->__end_;
    int v44 = 18;
    long long v40 = sub_101A459E4(v38, v39, &v44);
    if (a4->__end_ != v40) {
      a4->__end_ = v40;
    }
  }
  result = (vector<ModuleName, std::allocator<ModuleName>> *)a4->__begin_;
  if (a5->disableWifiScans)
  {
    long long v42 = a4->__end_;
    int v44 = 19;
    int v43 = sub_101A459E4(result, v42, &v44);
    result = (vector<ModuleName, std::allocator<ModuleName>> *)a4->__begin_;
    if (a4->__end_ != v43) {
      a4->__end_ = v43;
    }
  }
  else
  {
    int v43 = a4->__end_;
  }
  retstr->__begin_ = (int *)result;
  retstr->__end_ = v43;
  retstr->__end_cap_.__value_ = a4->__end_cap_.__value_;
  a4->__begin_ = 0;
  a4->__end_ = 0;
  a4->__end_cap_.__value_ = 0;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLWorkoutModuleFactory;
  [(CLWorkoutModuleFactory *)&v2 dealloc];
}

- (void).cxx_destruct
{
  begin = self->_moduleNames.__begin_;
  if (begin)
  {
    self->_moduleNames.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end