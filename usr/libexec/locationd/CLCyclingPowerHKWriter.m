@interface CLCyclingPowerHKWriter
- (CLCyclingPowerHKWriter)init;
- (void)dealloc;
- (void)writeFTPToHK:(CLCyclingFTPResults *)a3;
@end

@implementation CLCyclingPowerHKWriter

- (CLCyclingPowerHKWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLCyclingPowerHKWriter;
  v2 = [(CLCyclingPowerHKWriter *)&v6 init];
  if (v2)
  {
    if (objc_opt_class())
    {
      if (+[HKHealthStore isHealthDataAvailable])
      {
        v2->_healthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
      }
      else
      {
        if (qword_1024192F0 != -1) {
          dispatch_once(&qword_1024192F0, &stru_102311C50);
        }
        v3 = qword_1024192F8;
        if (os_log_type_enabled((os_log_t)qword_1024192F8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "HKHealthStore, health data not available", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024192F0 != -1) {
            dispatch_once(&qword_1024192F0, &stru_102311C50);
          }
          v5 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCyclingPowerHKWriter init]", "%s\n", v5);
          if (v5 != (char *)buf) {
            free(v5);
          }
        }
      }
    }
    v2->_startDate = (NSDate *)objc_alloc_init((Class)NSDate);
  }
  return v2;
}

- (void)writeFTPToHK:(CLCyclingFTPResults *)a3
{
  self->_startDate = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3->var5];
  v5 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit wattUnit], a3->var0);
  id v6 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierCyclingFunctionalThresholdPower];
  id v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:&off_102394298 forKeyedSubscript:HKMetadataKeyCyclingFunctionalThresholdPowerTestType];
  v8 = +[HKQuantitySample quantitySampleWithType:v6 quantity:v5 startDate:self->_startDate endDate:self->_startDate metadata:v7];
  healthStore = self->_healthStore;
  v10 = v8;
  [(HKHealthStore *)healthStore saveObjects:+[NSArray arrayWithObjects:&v10 count:1] withCompletion:&stru_102311C30];
}

- (void)dealloc
{
  self->_healthStore = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLCyclingPowerHKWriter;
  [(CLCyclingPowerHKWriter *)&v3 dealloc];
}

@end