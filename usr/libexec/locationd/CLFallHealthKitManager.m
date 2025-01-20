@interface CLFallHealthKitManager
+ (void)recordFallEventInHealthKit:(const ImpactEvent *)a3;
@end

@implementation CLFallHealthKitManager

+ (void)recordFallEventInHealthKit:(const ImpactEvent *)a3
{
  if (objc_opt_class())
  {
    if (+[HKHealthStore isHealthDataAvailable])
    {
      uint64_t v4 = 0;
      char v5 = 1;
      int v6 = 0;
      switch(a3->fImpact.fHasMotionBeforeImpact)
      {
        case 0:
          if (qword_1024190F0 != -1) {
            dispatch_once(&qword_1024190F0, &stru_1022B6F98);
          }
          v11 = qword_1024190F8;
          if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "event has not response", buf, 2u);
          }
          if (sub_10013D1A0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024190F0 != -1) {
              dispatch_once(&qword_1024190F0, &stru_1022B6F98);
            }
            LOWORD(v21) = 0;
            goto LABEL_38;
          }
          return;
        case 1:
        case 5:
          char v5 = 0;
          uint64_t v4 = 1;
          goto LABEL_28;
        case 2:
          uint64_t v4 = 0;
          char v5 = 0;
LABEL_28:
          int v6 = 1;
          goto LABEL_29;
        case 6:
        case 7:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
          if (qword_1024190F0 != -1) {
            dispatch_once(&qword_1024190F0, &stru_1022B6F98);
          }
          v7 = qword_1024190F8;
          if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
          {
            BOOL fHasMotionBeforeImpact = a3->fImpact.fHasMotionBeforeImpact;
            *(_DWORD *)buf = 67109120;
            BOOL v24 = fHasMotionBeforeImpact;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "event should not be logged in HK with response %i", buf, 8u);
          }
          if (!sub_10013D1A0(115, 0)) {
            return;
          }
          bzero(buf, 0x65CuLL);
          if (qword_1024190F0 != -1) {
            dispatch_once(&qword_1024190F0, &stru_1022B6F98);
          }
          BOOL v9 = a3->fImpact.fHasMotionBeforeImpact;
          int v21 = 67109120;
          BOOL v22 = v9;
          goto LABEL_38;
        default:
LABEL_29:
          if (qword_1024190F0 != -1) {
            dispatch_once(&qword_1024190F0, &stru_1022B6F98);
          }
          v12 = qword_1024190F8;
          if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289539;
            BOOL v24 = 0;
            __int16 v25 = 2082;
            v26 = "";
            __int16 v27 = 1025;
            int v28 = v6;
            __int16 v29 = 1025;
            int v30 = v4;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Candidate fall event record\", \"felt\":%{private}hhd, \"actionRequested\":%{private}hhd}", buf, 0x1Eu);
          }
          if ((v5 & 1) == 0)
          {
            id v13 = objc_alloc_init((Class)HKHealthStore);
            id v14 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierNumberOfTimesFallen];
            CFStringRef v19 = @"_HKPrivateFallActionRequested";
            v20 = +[NSNumber numberWithBool:v4];
            v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
            v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&a3->fImpact.fOperatingMode];
            v18 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v14, +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit countUnit](HKUnit, "countUnit"), 1.0), v16, v16, +[HKDevice localDevice], v15);
            [v13 saveObjects:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1) withCompletion:&stru_1022B6F78];
          }
          return;
      }
    }
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022B6F98);
    }
    v10 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "HKHealthStore, health data not available", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1022B6F98);
      }
      LOWORD(v21) = 0;
LABEL_38:
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "+[CLFallHealthKitManager recordFallEventInHealthKit:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
}

@end