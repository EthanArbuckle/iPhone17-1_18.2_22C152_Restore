@interface CLMobilityHealthKitWriter
- (BOOL)areWalkingSteadinessNotificationsEnabled;
- (BOOL)isWalkingSteadinessAvailable;
- (CLMobilityHealthKitWriter)initWithDelegate:(id)a3;
- (void)_writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6 metadata:(id)a7;
- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)writeSteadinessEvent:(int)a3 startDate:(id)a4 endDate:(id)a5 source:(id)a6;
- (void)writeToHealthKitAppleWalkingSteadiness:(double)a3 startDate:(id)a4 endDate:(id)a5 source:(id)a6;
- (void)writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6;
- (void)writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6 deviceSide:(unsigned __int8)a7;
@end

@implementation CLMobilityHealthKitWriter

- (CLMobilityHealthKitWriter)initWithDelegate:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CLMobilityHealthKitWriter;
  v4 = [(CLMobilityHealthKitWriter *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (CLMobilityWalkingBoutServiceProtocol *)a3;
    if (objc_opt_class())
    {
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_10232C378);
      }
      v6 = qword_1024191F8;
      if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v17 = @"com.apple.locationd";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "HealthKitWriter: Initializing Mobility HKDataCollectors (%@)", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_10232C378);
        }
        int v14 = 138412290;
        CFStringRef v15 = @"com.apple.locationd";
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter initWithDelegate:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      v5->_healthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
      id v7 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierWalkingSpeed];
      id v8 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierWalkingDoubleSupportPercentage];
      id v9 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierWalkingStepLength];
      id v10 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierWalkingAsymmetryPercentage];
      v5->_dataCollectorWalkingSpeed = (HKDataCollector *)[objc_alloc((Class)HKDataCollector) initWithHealthStore:v5->_healthStore bundleIdentifier:@"com.apple.locationd" quantityType:v7];
      v5->_dataCollectorWalkingDoubleSupportPercentage = (HKDataCollector *)[objc_alloc((Class)HKDataCollector) initWithHealthStore:v5->_healthStore bundleIdentifier:@"com.apple.locationd" quantityType:v8];
      v5->_dataCollectorWalkingStepLength = (HKDataCollector *)[objc_alloc((Class)HKDataCollector) initWithHealthStore:v5->_healthStore bundleIdentifier:@"com.apple.locationd" quantityType:v9];
      v5->_dataCollectorWalkingAsymmetryPercentage = (HKDataCollector *)[objc_alloc((Class)HKDataCollector) initWithHealthStore:v5->_healthStore bundleIdentifier:@"com.apple.locationd" quantityType:v10];
      [(HKDataCollector *)v5->_dataCollectorWalkingSpeed setDelegate:v5];
      v5->_featureStatusManager = (HKMobilityWalkingSteadinessFeatureStatusManager *)[objc_alloc((Class)HKMobilityWalkingSteadinessFeatureStatusManager) initWithHealthStore:v5->_healthStore];
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMobilityHealthKitWriter;
  [(CLMobilityHealthKitWriter *)&v3 dealloc];
}

- (void)writeToHealthKitAppleWalkingSteadiness:(double)a3 startDate:(id)a4 endDate:(id)a5 source:(id)a6
{
  if (objc_opt_class())
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_10232C398);
    }
    v11 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544131;
      id v30 = a4;
      __int16 v31 = 2114;
      id v32 = a5;
      __int16 v33 = 2049;
      double v34 = a3;
      __int16 v35 = 2114;
      id v36 = a6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Writing Steadiness score to HealthKit, startDate: %{public}@, endDate:%{public}@, walkingSteadiness: %{private}f, source: %{public}@", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_10232C398);
      }
      int v21 = 138544131;
      id v22 = a4;
      __int16 v23 = 2114;
      id v24 = a5;
      __int16 v25 = 2049;
      double v26 = a3;
      __int16 v27 = 2114;
      id v28 = a6;
      CFStringRef v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter writeToHealthKitAppleWalkingSteadiness:startDate:endDate:source:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    id v12 = +[NSMutableDictionary dictionary];
    objc_super v13 = v12;
    if (a6)
    {
      [v12 setObject:a6 forKeyedSubscript:_HKPrivateMetadataKeyCoreMotionSourceIdentifier];
    }
    else
    {
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_10232C398);
      }
      int v14 = qword_102418FA8;
      if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Steadiness Sample missing source metadata", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_10232C398);
        }
        LOWORD(v21) = 0;
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter writeToHealthKitAppleWalkingSteadiness:startDate:endDate:source:]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
    }
    [v13 setObject:&off_102395120 forKeyedSubscript:HKMetadataKeyAlgorithmVersion];
    CFStringRef v15 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierAppleWalkingSteadiness), +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit percentUnit](HKUnit, "percentUnit"), a3 / 100.0), a4, a5, +[HKDevice localDevice], v13);
    healthStore = self->_healthStore;
    v20 = v15;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_101520468;
    v19[3] = &unk_1022B9CA8;
    v19[4] = a4;
    v19[5] = a5;
    *(double *)&v19[6] = a3;
    [(HKHealthStore *)healthStore saveObjects:+[NSArray arrayWithObjects:&v20 count:1] withCompletion:v19];
  }
}

- (void)writeSteadinessEvent:(int)a3 startDate:(id)a4 endDate:(id)a5 source:(id)a6
{
  if (objc_opt_class())
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_10232C398);
    }
    v11 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544131;
      id v21 = a4;
      __int16 v22 = 2114;
      id v23 = a5;
      __int16 v24 = 2053;
      uint64_t v25 = a3;
      __int16 v26 = 2114;
      id v27 = a6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Writing Steadiness event to HealthKit, startDate: %{public}@, endDate:%{public}@, eventType: %{sensitive}ld, source: %{public}@", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_10232C398);
      }
      CFStringRef v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter writeSteadinessEvent:startDate:endDate:source:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    switch(a3)
    {
      case 0:
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_10232C398);
        }
        objc_super v13 = qword_102418FA8;
        if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Unsupported event type: none", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102418FA0 != -1) {
            dispatch_once(&qword_102418FA0, &stru_10232C398);
          }
          v19 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter writeSteadinessEvent:startDate:endDate:source:]", "%s\n", v19);
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
        goto LABEL_16;
      case 1:
      case 5:
LABEL_16:
        uint64_t v12 = 1;
        break;
      case 2:
      case 6:
        uint64_t v12 = 2;
        break;
      case 3:
      case 7:
        uint64_t v12 = 3;
        break;
      case 4:
      case 8:
        uint64_t v12 = 4;
        break;
      default:
        uint64_t v12 = 0;
        break;
    }
    id v14 = +[NSMutableDictionary dictionary];
    id v15 = v14;
    if (a6)
    {
      [v14 setObject:a6 forKeyedSubscript:_HKPrivateMetadataKeyCoreMotionSourceIdentifier];
    }
    else
    {
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_10232C398);
      }
      v16 = qword_102418FA8;
      if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Steadiness Event missing source metadata", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_10232C398);
        }
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter writeSteadinessEvent:startDate:endDate:source:]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
    }
    [(HKHealthStore *)self->_healthStore saveObject:+[HKCategorySample categorySampleWithType:value:startDate:endDate:device:metadata:](HKCategorySample, "categorySampleWithType:value:startDate:endDate:device:metadata:", +[HKObjectType categoryTypeForIdentifier:](HKObjectType, "categoryTypeForIdentifier:", HKCategoryTypeIdentifierAppleWalkingSteadinessEvent), v12, a4, a5, +[HKDevice localDevice], v15) withCompletion:&stru_10232C338];
  }
}

- (void)writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6 deviceSide:(unsigned __int8)a7
{
  unsigned int v7 = a7;
  uint64_t v11 = *(void *)&a3;
  objc_super v13 = +[NSMutableDictionary dictionaryWithCapacity:1];
  id v14 = v13;
  if (v7 <= 2) {
    [(NSMutableDictionary *)v13 setObject:(&off_10232C3B8)[(char)v7] forKeyedSubscript:HKMetadataKeyDevicePlacementSide];
  }

  [(CLMobilityHealthKitWriter *)self _writeToHealthKitType:v11 value:a5 startDate:a6 endDate:v14 metadata:a4];
}

- (void)writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6
{
}

- (void)_writeToHealthKitType:(int)a3 value:(double)a4 startDate:(id)a5 endDate:(id)a6 metadata:(id)a7
{
  if (objc_opt_class())
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_10232C378);
    }
    objc_super v13 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
    {
      sub_101136C9C(a3, &__p);
      id v14 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &__p
          : (std::string *)__p.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136316163;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2114;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2114;
      id v39 = a6;
      __int16 v40 = 2049;
      double v41 = a4;
      __int16 v42 = 2112;
      id v43 = a7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "HealthKitWriter: Writing %s to HealthKit, startDate: %{public}@, endDate: %{public}@, value: %{private}.2f, metadata: %@", (uint8_t *)&buf, 0x34u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_10232C378);
      }
      sub_101136C9C(a3, &v31);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v25 = &v31;
      }
      else {
        uint64_t v25 = (std::string *)v31.__r_.__value_.__r.__words[0];
      }
      LODWORD(__p.__r_.__value_.__l.__data_) = 136316163;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v25;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2114;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2114;
      id v33 = a6;
      __int16 v34 = 2049;
      double v35 = a4;
      __int16 v36 = 2112;
      id v37 = a7;
      __int16 v26 = (std::string *)_os_log_send_and_compose_impl();
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:]", "%s\n", (const char *)v26);
      if (v26 != &buf) {
        free(v26);
      }
    }
    switch(a3)
    {
      case 0:
        id v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:@"m/s"], a4);
        uint64_t v16 = 32;
        goto LABEL_25;
      case 1:
        id v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit percentUnit], a4 / 100.0);
        uint64_t v16 = 40;
        goto LABEL_25;
      case 2:
        id v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit meterUnit], a4);
        uint64_t v16 = 48;
        goto LABEL_25;
      case 3:
        id v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit percentUnit], a4 / 100.0);
        uint64_t v16 = 56;
LABEL_25:
        v19 = *(Class *)((char *)&self->super.isa + v16);
        if (v19 && v15)
        {
          v20 = +[NSUUID UUID];
          id v21 = [objc_alloc((Class)NSDateInterval) initWithStartDate:a5 endDate:a6];
          id v22 = [objc_alloc((Class)HKQuantityDatum) initWithIdentifier:v20 dateInterval:v21 quantity:v15 resumeContext:0];
          id v30 = v22;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_101521810;
          v28[3] = &unk_10232C358;
          int v29 = a3;
          [v19 insertDatums:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1) device:+[HKDevice localDevice](HKDevice, "localDevice") metadata:a7 completion:v28];
        }
        else
        {
          if (qword_1024191F0 != -1) {
            dispatch_once(&qword_1024191F0, &stru_10232C378);
          }
          id v23 = qword_1024191F8;
          if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
          {
            sub_101136C9C(a3, &buf);
            __int16 v24 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &buf
                : (std::string *)buf.__r_.__value_.__r.__words[0];
            LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "HKDataCollector %s was not properly initialized", (uint8_t *)&__p, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
          }
          if (sub_10013D1A0(115, 0))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1024191F0 != -1) {
              dispatch_once(&qword_1024191F0, &stru_10232C378);
            }
            sub_101136C9C(a3, &__p);
            id v27 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &__p
                : (std::string *)__p.__r_.__value_.__r.__words[0];
            LODWORD(v31.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 4) = (std::string::size_type)v27;
            v18 = (std::string *)_os_log_send_and_compose_impl();
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:]", "%s\n", (const char *)v18);
            if (v18 != &buf) {
LABEL_55:
            }
              free(v18);
          }
        }
        break;
      default:
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_10232C378);
        }
        CFStringRef v17 = qword_1024191F8;
        if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
          HIDWORD(buf.__r_.__value_.__r.__words[0]) = a3;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "HealthKitWriter: Unexpected QuantityTypeIdentifier %d", (uint8_t *)&buf, 8u);
        }
        if (!sub_10013D1A0(115, 0)) {
          return;
        }
        bzero(&buf, 0x65CuLL);
        if (qword_1024191F0 != -1) {
          dispatch_once(&qword_1024191F0, &stru_10232C378);
        }
        LODWORD(__p.__r_.__value_.__l.__data_) = 67109120;
        HIDWORD(__p.__r_.__value_.__r.__words[0]) = a3;
        v18 = (std::string *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter _writeToHealthKitType:value:startDate:endDate:metadata:]", "%s\n", (const char *)v18);
        if (v18 == &buf) {
          return;
        }
        goto LABEL_55;
    }
  }
}

- (BOOL)isWalkingSteadinessAvailable
{
  CFStringRef v17 = 0;
  id v2 = [(HKMobilityWalkingSteadinessFeatureStatusManager *)self->_featureStatusManager onboardingStatusWithError:&v17];
  if (v17) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_10232C398);
    }
    v4 = qword_102418FA8;
    if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 138543362;
      id v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to query onboarding status: %{public}@", buf, 0xCu);
    }
    BOOL v5 = sub_10013D1A0(115, 0);
    BOOL result = 0;
    if (v5)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_10232C398);
      }
      int v18 = 138543362;
      id v19 = v17;
      unsigned int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter isWalkingSteadinessAvailable]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
      return 0;
    }
  }
  else
  {
    id v8 = v2;
    if ([v2 onboardingUnavailableReasons])
    {
      if (qword_102418FA0 != -1) {
        dispatch_once(&qword_102418FA0, &stru_10232C398);
      }
      id v9 = qword_102418FA8;
      if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_INFO))
      {
        id v10 = [v8 onboardingUnavailableReasons];
        unsigned int v11 = [v8 isLocaleValidOnLocalDevice];
        id v12 = [v8 state];
        *(_DWORD *)std::string buf = 134349568;
        id v25 = v10;
        __int16 v26 = 1026;
        unsigned int v27 = v11;
        __int16 v28 = 2050;
        id v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HK Walking Steadiness unavailable. reasons=%{public}ld, isLocaleValid=%{public}d, state=%{public}ld", buf, 0x1Cu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FA0 != -1) {
          dispatch_once(&qword_102418FA0, &stru_10232C398);
        }
        id v13 = [v8 onboardingUnavailableReasons];
        unsigned int v14 = [v8 isLocaleValidOnLocalDevice];
        id v15 = [v8 state];
        int v18 = 134349568;
        id v19 = v13;
        __int16 v20 = 1026;
        unsigned int v21 = v14;
        __int16 v22 = 2050;
        id v23 = v15;
        uint64_t v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter isWalkingSteadinessAvailable]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
    }
    return [v8 isClassificationAvailable];
  }
  return result;
}

- (BOOL)areWalkingSteadinessNotificationsEnabled
{
  uint64_t v8 = 0;
  id v2 = [(HKMobilityWalkingSteadinessFeatureStatusManager *)self->_featureStatusManager notificationStatusWithError:&v8];
  if (v8) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (!v3) {
    return [v2 state] == (id)1;
  }
  if (qword_102418FA0 != -1) {
    dispatch_once(&qword_102418FA0, &stru_10232C398);
  }
  v4 = qword_102418FA8;
  if (os_log_type_enabled((os_log_t)qword_102418FA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string buf = 138543362;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to query notification status: %{public}@", buf, 0xCu);
  }
  BOOL v5 = sub_10013D1A0(115, 0);
  BOOL result = 0;
  if (v5)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FA0 != -1) {
      dispatch_once(&qword_102418FA0, &stru_10232C398);
    }
    int v9 = 138543362;
    uint64_t v10 = v8;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMobilityHealthKitWriter areWalkingSteadinessNotificationsEnabled]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
    return 0;
  }
  return result;
}

- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4
{
  if (qword_1024191F0 != -1) {
    dispatch_once(&qword_1024191F0, &stru_10232C378);
  }
  unsigned int v7 = qword_1024191F8;
  if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 138412290;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "HealthKitWriter: Data collection requested through date %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_10232C378);
    }
    int v11 = 138412290;
    id v12 = a3;
    int v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityHealthKitWriter dataCollectorDidRequestCollectionThroughDate:completion:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  delegate = self->_delegate;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_101522380;
  v10[3] = &unk_1022D7BF0;
  v10[4] = a4;
  [(CLMobilityWalkingBoutServiceProtocol *)delegate onDataCollectionRequested:v10];
}

@end