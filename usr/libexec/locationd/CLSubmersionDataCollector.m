@interface CLSubmersionDataCollector
- (CLSubmersionDataCollector)initWithUniverse:(id)a3 andStateMachine:(id)a4;
- (_BYTE)onDataProtectionNotification:(int)a3 data:(uint64_t)a4;
- (id).cxx_construct;
- (void)collectAt:(double)a3 measurement:(id)a4 atSensorLimit:(BOOL)a5;
- (void)collectWithSubmersionQuantities:(shared_ptr<CLSubmersionQuantities>)a3 shouldLog:(BOOL)a4;
- (void)dealloc;
- (void)finish;
- (void)finishUnlocked;
- (void)logCollectionData;
- (void)startAt:(double)a3;
- (void)startUnlocked;
- (void)writeDataOnUnlock;
@end

@implementation CLSubmersionDataCollector

- (void)startUnlocked
{
  id v3 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierUnderwaterDepth];
  id v4 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierWaterTemperature];
  self->_depthCollector = (HKDataCollector *)[objc_alloc((Class)HKDataCollector) initWithHealthStore:self->_healthStore bundleIdentifier:@"com.apple.coremotion" quantityType:v3];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102307BF8);
  }
  v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "healthkit resume with completion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector startUnlocked]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  [(HKDataCollector *)self->_depthCollector resumeWithCompletion:&stru_102307B38];
  self->_tempCollector = (HKDataCollector *)[objc_alloc((Class)HKDataCollector) initWithHealthStore:self->_healthStore bundleIdentifier:@"com.apple.coremotion" quantityType:v4];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102307BF8);
  }
  v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "healthkit resume temperature with completion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector startUnlocked]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  [(HKDataCollector *)self->_tempCollector resumeWithCompletion:&stru_102307B58];
}

- (void)startAt:(double)a3
{
  self->_lastSampleTime = a3;
  if (self->_unlockedSinceFirstBoot) {
    [(CLSubmersionDataCollector *)self startUnlocked];
  }
}

- (void)collectWithSubmersionQuantities:(shared_ptr<CLSubmersionQuantities>)a3 shouldLog:(BOOL)a4
{
  int var1 = (int)a3.var1;
  var0 = a3.var0;
  if (*(double *)(*(void *)a3.var0 + 32) <= *(double *)(*(void *)a3.var0 + 40))
  {
    id v17 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)a3.var0 + 32)];
    id v75 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)var0 + 40)];
    v76 = v17;
    id v18 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v17 endDate:v75];
    if (**(unsigned char **)var0)
    {
      [(CLSubmersionStateMachine *)self->_submersionStateMachine sensorErrorThreshold];
      *(float *)&double v19 = v19;
      int v81 = LODWORD(v19);
      sub_101A22680(buf, "SensorErrorDepthMeters", &v81, 0);
      *(double *)(*(void *)var0 + 8) = *(float *)&v90;
    }
    id v20 = [objc_alloc((Class)HKQuantityDatum) initWithIdentifier:v18 dateInterval:[v18 dateInterval] quantity:[v18 quantity] resumeContext:0];
    id v21 = [objc_alloc((Class)HKQuantityDatum) initWithIdentifier:v18 dateInterval:+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit"), *(double *)(*(void *)var0 + 16)) resumeContext:0];
    v22 = *(double **)var0;
    if (*(double *)(*(void *)var0 + 8) >= 1.0)
    {
      if (var1)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        if (vabdd_f64(Current, self->_lastDefaultLogDepthTimestamp) >= 7.5)
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_102307BF8);
          }
          v38 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
          {
            [objc_msgSend(v20, "quantity") doubleValueForUnit:+[HKUnit meterUnit](HKUnit, "meterUnit")];
            uint64_t v40 = v39;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            uint64_t v42 = v41;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            int v43 = **(unsigned char **)var0;
            *(_DWORD *)buf = 134349824;
            uint64_t v90 = v40;
            __int16 v91 = 2050;
            uint64_t v92 = v42;
            __int16 v93 = 2050;
            uint64_t v94 = v44;
            __int16 v95 = 1026;
            LODWORD(v96[0]) = v43;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "inserting into healthkit,depth,%{public}f,sampleTime,%{public}f,startTime,%{public}f,atSensorLimit,%{public}d", buf, 0x26u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_102307BF8);
            }
            [objc_msgSend(v20, "quantity") doubleValueForUnit:+[HKUnit meterUnit](HKUnit, "meterUnit")];
            uint64_t v68 = v67;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            uint64_t v70 = v69;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            int v71 = **(unsigned char **)var0;
            int v81 = 134349824;
            uint64_t v82 = v68;
            __int16 v83 = 2050;
            uint64_t v84 = v70;
            __int16 v85 = 2050;
            uint64_t v86 = v72;
            __int16 v87 = 1026;
            *(_DWORD *)v88 = v71;
            v73 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v73);
            if (v73 != (char *)buf) {
              free(v73);
            }
          }
          self->_lastDefaultLogDepthTimestamp = Current;
        }
        else
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_102307BF8);
          }
          v24 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
          {
            [objc_msgSend(v20, "quantity") doubleValueForUnit:+[HKUnit meterUnit](HKUnit, "meterUnit")];
            uint64_t v26 = v25;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            uint64_t v28 = v27;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate"]
            int v29 = **(unsigned char **)var0;
            *(_DWORD *)buf = 134349824;
            uint64_t v90 = v26;
            __int16 v91 = 2050;
            uint64_t v92 = v28;
            __int16 v93 = 2050;
            uint64_t v94 = v30;
            __int16 v95 = 1026;
            LODWORD(v96[0]) = v29;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "inserting into healthkit,depth,%{public}f,sampleTime,%{public}f,startTime,%{public}f,atSensorLimit,%{public}d", buf, 0x26u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_102307BF8);
            }
            [objc_msgSend(v20, "quantity") doubleValueForUnit:[+[HKUnit meterUnit](HKUnit, "meterUnit")]];
            uint64_t v32 = v31;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            uint64_t v34 = v33;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            int v35 = **(unsigned char **)var0;
            int v81 = 134349824;
            uint64_t v82 = v32;
            __int16 v83 = 2050;
            uint64_t v84 = v34;
            __int16 v85 = 2050;
            uint64_t v86 = v36;
            __int16 v87 = 1026;
            *(_DWORD *)v88 = v35;
            v37 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v37);
            if (v37 != (char *)buf) {
              free(v37);
            }
          }
        }
      }
      if (**(unsigned char **)var0)
      {
        v79 = HKMetadataKeyQuantityClampedToUpperBound;
        v80 = &__kCFBooleanTrue;
        v45 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      }
      else
      {
        v45 = 0;
      }
      depthCollector = self->_depthCollector;
      id v78 = v20;
      [(HKDataCollector *)depthCollector insertDatums:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1) device:+[HKDevice localDevice] metadata:v45 completion:&stru_102307B78];
      v22 = *(double **)var0;
      double v47 = *(double *)(*(void *)var0 + 8);
      if (v47 > self->_maxDepthWritten) {
        self->_maxDepthWritten = v47;
      }
    }
    if (v22[3] <= self->_waterTempUncertaintyCap)
    {
      value = (double *)self->_temperatureDecimator.__ptr_.__value_;
      double v49 = v22[4];
      double v50 = v22[2];
      if (vabdd_f64(v50, value[2]) >= *value || vabdd_f64(v49, value[3]) >= value[1])
      {
        value[2] = v50;
        value[3] = v49;
        if (var1)
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_102307BF8);
          }
          v51 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
          {
            [objc_msgSend(v21, "quantity") doubleValueForUnit:+[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit")];
            uint64_t v53 = v52;
            id v54 = v20;
            uint64_t v55 = *(void *)(*(void *)var0 + 24);
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            uint64_t v57 = v56;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            *(_DWORD *)buf = 134349824;
            uint64_t v90 = v53;
            __int16 v91 = 2050;
            uint64_t v92 = v55;
            id v20 = v54;
            __int16 v93 = 2050;
            uint64_t v94 = v57;
            __int16 v95 = 2050;
            v96[0] = v58;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "inserting into healthkit,temperature,%{public}f,uncertainty,%{public}f,sampleTime,%{public}f,endTime,%{public}f", buf, 0x2Au);
          }
          if (sub_10013D1A0(115, 2))
          {
            id v74 = v20;
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_102307BF8);
            }
            [objc_msgSend(v21, "quantity") doubleValueForUnit:+[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit")];
            uint64_t v61 = v60;
            uint64_t v62 = *(void *)(*(void *)var0 + 24);
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate"]
            uint64_t v64 = v63;
            [objc_msgSend(objc_msgSend(objc_msgSend(v21, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            int v81 = 134349824;
            uint64_t v82 = v61;
            __int16 v83 = 2050;
            uint64_t v84 = v62;
            __int16 v85 = 2050;
            uint64_t v86 = v64;
            __int16 v87 = 2050;
            *(void *)v88 = v65;
            v66 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v66);
            if (v66 != (char *)buf) {
              free(v66);
            }
            id v20 = v74;
          }
        }
        tempCollector = self->_tempCollector;
        id v77 = v21;
        [(HKDataCollector *)tempCollector insertDatums:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1) device:+[HKDevice localDevice] metadata:0 completion:&stru_102307B98];
      }
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)var0 + 32);
      uint64_t v8 = *(void *)(*(void *)var0 + 40);
      uint64_t v9 = *(void *)(*(void *)var0 + 8);
      int v10 = **(unsigned char **)var0;
      *(_DWORD *)buf = 134219008;
      uint64_t v90 = v7;
      __int16 v91 = 2048;
      uint64_t v92 = v8;
      __int16 v93 = 2048;
      uint64_t v94 = v9;
      __int16 v95 = 1024;
      LODWORD(v96[0]) = v10;
      WORD2(v96[0]) = 1024;
      *(_DWORD *)((char *)v96 + 6) = var1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "HKDataCollector, startTime after endTime not storing sample,startTime,%f,endTime,%f,depth,%f,atSensorLimit,%d,shouldLog,%d", buf, 0x2Cu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102307BF8);
      }
      uint64_t v11 = *(void *)(*(void *)var0 + 32);
      uint64_t v12 = *(void *)(*(void *)var0 + 40);
      uint64_t v13 = *(void *)(*(void *)var0 + 8);
      int v14 = **(unsigned char **)var0;
      int v81 = 134219008;
      uint64_t v82 = v11;
      __int16 v83 = 2048;
      uint64_t v84 = v12;
      __int16 v85 = 2048;
      uint64_t v86 = v13;
      __int16 v87 = 1024;
      *(_DWORD *)v88 = v14;
      *(_WORD *)&v88[4] = 1024;
      *(_DWORD *)&v88[6] = var1;
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
}

- (void)collectAt:(double)a3 measurement:(id)a4 atSensorLimit:(BOOL)a5
{
  [a4 depth];
  uint64_t v10 = v9;
  [a4 temperature];
  uint64_t v12 = v11;
  [a4 temperatureUncertainty];
  int v14 = v13;
  v15 = (std::__shared_weak_count *)operator new(0x48uLL);
  v16 = v15;
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)off_102307C28;
  LOBYTE(v15[1].__vftable) = a5;
  double lastSampleTime = self->_lastSampleTime;
  BYTE1(v15[1].__vftable) = 0;
  v15[1].__shared_owners_ = v10;
  v15[1].__shared_weak_owners_ = v12;
  v15[2].__vftable = v14;
  *(double *)&v15[2].__shared_owners_ = lastSampleTime;
  *(double *)&v15[2].__shared_weak_owners_ = a3;
  *(void *)&long long v23 = v15 + 1;
  *((void *)&v23 + 1) = v15;
  if (self->_unlockedSinceFirstBoot)
  {
    self->_double lastSampleTime = a3;
    id v21 = v15 + 1;
    v22 = v15;
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    [(CLSubmersionDataCollector *)self collectWithSubmersionQuantities:&v21 shouldLog:1];
    if (v22) {
      sub_1000DB0A0(v22);
    }
    goto LABEL_17;
  }
  if (self->_decimationCount >= 0) {
    int v18 = self->_decimationCount & 1;
  }
  else {
    int v18 = -(self->_decimationCount & 1);
  }
  self->_decimationCount = v18;
  if (v18) {
    goto LABEL_16;
  }
  if (self->_submersionCollection.__size_.__value_ >= self->_maxQuantities)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    double v19 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "failed to cache healthkit data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102307BF8);
      }
      id v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectAt:measurement:atSensorLimit:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
LABEL_16:
    ++self->_decimationCount;
    goto LABEL_17;
  }
  self->_double lastSampleTime = a3;
  sub_100FA203C(&self->_submersionCollection.__map_.__first_, &v23);
  v16 = (std::__shared_weak_count *)*((void *)&v23 + 1);
  ++self->_decimationCount;
  if (v16) {
LABEL_17:
  }
    sub_1000DB0A0(v16);
}

- (void)finish
{
  if (self->_unlockedSinceFirstBoot)
  {
    [(CLSubmersionDataCollector *)self finishUnlocked];
  }
  else if (self->_submersionCollection.__size_.__value_ >= self->_maxQuantities)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "failed to cache healthkit data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102307BF8);
      }
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector finish]", "%s\n", v10);
      if (v10 != buf) {
        free(v10);
      }
    }
  }
  else
  {
    id v3 = (int64x2_t *)operator new(0x48uLL);
    v3->i64[1] = 0;
    v3[1].i64[0] = 0;
    v3->i64[0] = (uint64_t)off_102307C28;
    int64x2_t v4 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v3[2] = v4;
    v3[3] = v4;
    v3[4].i64[0] = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)&buf[8] = v3;
    v3[1].i16[4] = 256;
    *(void *)buf = (char *)v3 + 24;
    sub_100FA203C(&self->_submersionCollection.__map_.__first_, (long long *)buf);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  if (self->_maxDepthWritten >= 0.0)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double maxDepthWritten = self->_maxDepthWritten;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = maxDepthWritten;
      *(_WORD *)&buf[12] = 2048;
      *(CFAbsoluteTime *)&buf[14] = Current;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deepest depth written to HK,depth,%f,timestamp,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102307BF8);
      }
      CFAbsoluteTimeGetCurrent();
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector finish]", "%s\n", v9);
      if (v9 != buf) {
        free(v9);
      }
    }
    self->_double maxDepthWritten = -1.0;
  }
}

- (void)finishUnlocked
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102307BF8);
  }
  id v3 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "healthkit finishWithCompletion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    int64x2_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector finishUnlocked]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(HKDataCollector *)self->_depthCollector finishWithCompletion:&stru_102307BB8];
  [(HKDataCollector *)self->_tempCollector finishWithCompletion:&stru_102307BD8];

  self->_tempCollector = 0;
  self->_depthCollector = 0;
}

- (CLSubmersionDataCollector)initWithUniverse:(id)a3 andStateMachine:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CLSubmersionDataCollector;
  v6 = [(CLSubmersionDataCollector *)&v10 init];
  if (v6)
  {
    v6->_healthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_decimationCount = 0;
    sub_10044FD20((unsigned __int8 *)&v8, "MaxSubmersionHK", dword_101D9A450, 0);
    v6->_maxQuantities = HIDWORD(v8);
    v6->_submersionStateMachine = (CLSubmersionStateMachine *)a4;
    sub_101A1F180((unsigned __int8 *)&v8, "WaterTempResolutionHK", &qword_101D9A458, 0);
    v6->_waterTempResolution = v9;
    sub_101A1F180((unsigned __int8 *)&v8, "WaterTempTimeResolutionHK", &qword_101D9A460, 0);
    v6->_waterTempTimeResolution = v9;
    sub_101A1F180((unsigned __int8 *)&v8, "WaterTempUncertaintyCapHK", &qword_101D9A468, 0);
    v6->_waterTempUncertaintyCap = v9;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)CLSubmersionDataCollector;
  [(CLSubmersionDataCollector *)&v6 dealloc];
  healthStore = self->_healthStore;
  if (healthStore) {

  }
  depthCollector = self->_depthCollector;
  if (depthCollector) {

  }
  tempCollector = self->_tempCollector;
  if (tempCollector) {
}
  }

- (void)logCollectionData
{
  begin = self->_submersionCollection.__map_.__begin_;
  unint64_t start = self->_submersionCollection.__start_;
  uint64_t v5 = (*(void **)((char *)begin + ((start >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * start];
  if (*(unsigned char *)(v5 + 1)) {
    uint64_t v5 = (*(void **)((char *)begin + (((start + 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * (start + 1)];
  }
  unint64_t v6 = start + self->_submersionCollection.__size_.__value_;
  uint64_t v7 = (*(void **)((char *)begin + (((v6 - 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * (v6 - 1)];
  if (*(unsigned char *)(v7 + 1)) {
    uint64_t v7 = (*(void **)((char *)begin + (((v6 - 2) >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * (v6 - 2)];
  }
  uint64_t v8 = *(void *)(v5 + 32);
  uint64_t v9 = *(void *)(v7 + 40);
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102307BF8);
  }
  objc_super v10 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    unint64_t value = self->_submersionCollection.__size_.__value_;
    *(_DWORD *)buf = 134218496;
    unint64_t v14 = value;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "inserting into healthkit,numValues,%lu,firstStartTime,%f,lastEndTime,%f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102307BF8);
    }
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionDataCollector logCollectionData]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
}

- (void)writeDataOnUnlock
{
  if (self->_submersionCollection.__size_.__value_)
  {
    p_submersionCollection = &self->_submersionCollection;
    BOOL v4 = 1;
    while (1)
    {
      [(CLSubmersionDataCollector *)self logCollectionData];
      sub_100FA35D4((uint64_t)&v25, p_submersionCollection);
      begin = self->_submersionCollection.__map_.__begin_;
      end = self->_submersionCollection.__map_.__end_;
      if (end == begin)
      {
        end = self->_submersionCollection.__map_.__begin_;
      }
      else
      {
        unint64_t start = self->_submersionCollection.__start_;
        uint64_t v8 = &begin[start >> 8];
        uint64_t v9 = (uint64_t)*v8;
        uint64_t v10 = (uint64_t)*v8 + 16 * start;
        uint64_t v11 = *(uint64_t *)((char *)begin
                         + (((self->_submersionCollection.__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8))
            + 16 * (LOBYTE(self->_submersionCollection.__size_.__value_) + start);
        if (v10 != v11)
        {
          do
          {
            uint64_t v12 = *(std::__shared_weak_count **)(v10 + 8);
            if (v12)
            {
              sub_1000DB0A0(v12);
              uint64_t v9 = (uint64_t)*v8;
            }
            v10 += 16;
            if (v10 - v9 == 4096)
            {
              uint64_t v13 = (uint64_t)v8[1];
              ++v8;
              uint64_t v9 = v13;
              uint64_t v10 = v13;
            }
          }
          while (v10 != v11);
          begin = self->_submersionCollection.__map_.__begin_;
          end = self->_submersionCollection.__map_.__end_;
        }
      }
      self->_submersionCollection.__size_.__value_ = 0;
      unint64_t v14 = (char *)end - (char *)begin;
      if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
      {
        do
        {
          operator delete(*begin);
          __int16 v15 = self->_submersionCollection.__map_.__end_;
          begin = self->_submersionCollection.__map_.__begin_ + 1;
          self->_submersionCollection.__map_.__begin_ = begin;
          unint64_t v14 = (char *)v15 - (char *)begin;
        }
        while ((unint64_t)((char *)v15 - (char *)begin) > 0x10);
      }
      unint64_t v16 = v14 >> 3;
      if (v16 == 1) {
        break;
      }
      if (v16 == 2)
      {
        unint64_t v17 = 256;
LABEL_18:
        self->_submersionCollection.__start_ = v17;
      }
      if (v27 != v26)
      {
        uint64_t v18 = (void *)(v26 + 8 * (v28 >> 8));
        double v19 = (uint64_t *)(*v18 + 16 * v28);
        uint64_t v20 = *(void *)(v26 + (((v29 + v28) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v29 + v28);
        while (v19 != (uint64_t *)v20)
        {
          if (v4) {
            [(CLSubmersionDataCollector *)self startUnlocked];
          }
          BOOL v4 = *(unsigned char *)(*v19 + 1) != 0;
          if (*(unsigned char *)(*v19 + 1))
          {
            [(CLSubmersionDataCollector *)self finishUnlocked];
          }
          else
          {
            id v21 = (std::__shared_weak_count *)v19[1];
            uint64_t v23 = *v19;
            v24 = v21;
            if (v21) {
              atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            [(CLSubmersionDataCollector *)self collectWithSubmersionQuantities:&v23 shouldLog:0];
            if (v24) {
              sub_1000DB0A0(v24);
            }
          }
          sub_1000962A4(&v25);
          v19 += 2;
          if ((uint64_t *)((char *)v19 - *v18) == (uint64_t *)4096)
          {
            v22 = (uint64_t *)v18[1];
            ++v18;
            double v19 = v22;
          }
        }
      }
      sub_1000DAF68(&v25);
      if (!self->_submersionCollection.__size_.__value_) {
        return;
      }
    }
    unint64_t v17 = 128;
    goto LABEL_18;
  }
}

- (_BYTE)onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 1)
  {
    char v4 = BYTE4(a4);
    uint64_t v5 = result;
    if (result[24]) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = (a4 & (unint64_t)&_mh_execute_header) == 0;
    }
    if (!v6)
    {
      if (*((void *)result + 14)) {
        result = [result writeDataOnUnlock];
      }
    }
    v5[24] = v4 & 1;
  }
  return result;
}

- (void).cxx_destruct
{
  unint64_t value = self->_temperatureDecimator.__ptr_.__value_;
  self->_temperatureDecimator.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  sub_1000DAF68(&self->_submersionCollection.__map_.__first_);
  char v4 = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 16) = 0;
  return self;
}

@end