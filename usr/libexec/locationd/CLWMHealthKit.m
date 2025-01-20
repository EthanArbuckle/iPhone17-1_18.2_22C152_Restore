@interface CLWMHealthKit
- (CLWMHealthKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (double)startTime;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)queryHRSource:(double)a3 workoutEndTime:(double)a4;
- (void)queryUserEffortResponse:(double)a3 workoutEndTime:(double)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupHealthKitQueries;
- (void)setupListener;
- (void)stopHealthKitQueries;
- (void)teardownHealthKitQueries;
- (void)teardownListeners;
- (void)writeHealthKitInfo;
@end

@implementation CLWMHealthKit

- (CLWMHealthKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLWMHealthKit;
  v7 = [(CLWMBase *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v7->_universe = (CLIntersiloUniverse *)a4;
    v7->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_sampleCount = 0;
    v8->_startTime = CFAbsoluteTimeGetCurrent();
  }
  return v8;
}

- (void)setupListener
{
}

- (void)teardownListeners
{
  [(CLWMHealthKit *)self writeHealthKitInfo];

  [(CLWMHealthKit *)self teardownHealthKitQueries];
}

- (void)dealloc
{
  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMHealthKit;
  [(CLWMBase *)&v3 dealloc];
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)setupHealthKitQueries
{
  id v3 = +[HKSampleType workoutType];
  id v4 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierRestingHeartRate];
  id v5 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierWalkingHeartRateAverage];
  self->_healthKitQueries = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  self->_healthKit = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
  ++self->_sampleCount;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_101A2FFE4;
  v27[3] = &unk_10234D898;
  v27[4] = self;
  v27[5] = v4;
  v27[6] = v5;
  [(CLWMHealthKit *)self startTime];
  v31[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"), +[NSDate date], 0);
  v31[1] = +[HKQuery _predicateForObjectsFromAppleWatches];
  id v6 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:v3 predicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2)) limit:0 sortDescriptors:0 resultsHandler:v27];
  [(NSMutableArray *)self->_healthKitQueries addObject:v6];

  v7 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate date](NSDate, "date"), +[NSDate date], 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v29[0] = v4;
  v29[1] = v5;
  v8 = +[NSArray arrayWithObjects:v29 count:2];
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:*(void *)(*((void *)&v23 + 1) + 8 * i) predicate:v7 limit:1 sortDescriptors:0 resultsHandler:v27];
        [(NSMutableArray *)self->_healthKitQueries addObject:v13];
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v10);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  healthKitQueries = self->_healthKitQueries;
  id v15 = [(NSMutableArray *)healthKitQueries countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(healthKitQueries);
        }
        [(HKHealthStore *)self->_healthKit executeQuery:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
      }
      id v16 = [(NSMutableArray *)healthKitQueries countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)queryUserEffortResponse:(double)a3 workoutEndTime:(double)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_101A30AAC;
  v6[3] = &unk_10234D8C0;
  v6[4] = self;
  id v5 = [objc_alloc((Class)HKWorkoutEffortRelationshipQuery) initWithPredicate:+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4), 1) anchor:0 options:1 resultsHandler:v6];
  [(NSMutableArray *)self->_healthKitQueries addObject:v5];
  [(HKHealthStore *)self->_healthKit executeQuery:v5];
}

- (void)stopHealthKitQueries
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  healthKitQueries = self->_healthKitQueries;
  id v4 = [(NSMutableArray *)healthKitQueries countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(healthKitQueries);
        }
        [(HKHealthStore *)self->_healthKit stopQuery:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }
      id v5 = [(NSMutableArray *)healthKitQueries countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)teardownHealthKitQueries
{
  self->_healthKitQueries = 0;
  self->_healthKit = 0;
}

- (double)startTime
{
  [(CLWMBase *)self makeSafeCFAbsoluteTime:self->_startTime];
  return result;
}

- (void)writeHealthKitInfo
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      sub_10170140C(v5);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v6 |= 1u;
      v5[77] = v4;
      operator new();
    }
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  id v5 = *(WriterManager **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_writer.__cntrl_;
  p_writer->__ptr_ = v5;
  p_writer->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)queryHRSource:(double)a3 workoutEndTime:(double)a4
{
  [(NSMutableDictionary *)self->_metadata setObject:@"HeartRateSourceUnknown" forKeyedSubscript:@"HeartRateSourceManufacturer"];
  [(NSMutableDictionary *)self->_metadata setObject:@"HeartRateSourceUnknown" forKeyedSubscript:@"HeartRateSourceModel"];
  [(NSMutableDictionary *)self->_metadata setObject:@"HeartRateSourceUnknown" forKeyedSubscript:@"HeartRateSourceFirmware"];
  v18[0] = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3), +[NSDate dateWithTimeIntervalSinceReferenceDate:a4], 1);
  v18[1] = +[HKQuery predicateForObjectsFromSource:](HKQuery, "predicateForObjectsFromSource:", +[HKSource _blePeripheralSource]);
  v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:v18 count:2]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_101A31AD0;
  v9[3] = &unk_10234D910;
  v9[4] = self;
  id v10 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
  CFStringRef v11 = @"Apple";
  CFStringRef v12 = @"HeartRateSourceManufacturer";
  CFStringRef v13 = @"HeartRateSourceUnknown";
  CFStringRef v14 = @"HeartRateSourceModel";
  CFStringRef v15 = @"HeartRateSourceFirmware";
  CFStringRef v16 = @"HeartRateSourceHardware";
  CFStringRef v17 = @"Other";
  id v8 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:v10 predicate:v7 limit:5 sortDescriptors:0 resultsHandler:v9];
  [(NSMutableArray *)self->_healthKitQueries addObject:v8];
  [(HKHealthStore *)self->_healthKit executeQuery:v8];
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    uint64_t v9 = *((void *)a4 + 2);
    if (v9 == 13)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D930);
      }
      CFStringRef v12 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CLWMHealthkit, Received session begin, stopping all healthit queries if exist", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D930);
        }
        CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMHealthKit onMotionStateMediatorNotification:data:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
      [(CLWMHealthKit *)self stopHealthKitQueries];
    }
    else if (v9 == 15)
    {
      uuid_copy(self->_overviewId, (const unsigned __int8 *)a4 + 80);
      [(CLWMHealthKit *)self queryHRSource:*(double *)a4 workoutEndTime:*((double *)a4 + 1)];
      double v10 = *(double *)a4;
      double v11 = *((double *)a4 + 1);
      [(CLWMHealthKit *)self queryUserEffortResponse:v10 workoutEndTime:v11];
    }
  }
}

- (void).cxx_destruct
{
  PB::Base::~Base((PB::Base *)&self->_healthKitInfo);
  cntrl = self->_writer.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value)
  {
    id v5 = *(void (**)(void))(*(void *)value + 8);
    v5();
  }
}

- (id).cxx_construct
{
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  self->_writer.__ptr_ = 0;
  self->_writer.__cntrl_ = 0;
  sub_10175EBDC((uint64_t)&self->_healthKitInfo);
  return self;
}

@end