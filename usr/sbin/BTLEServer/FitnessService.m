@interface FitnessService
+ (BOOL)manufacturer:(id)a3 andModel:(id)a4 matches:(id)a5;
+ (id)hkQuantityTypeForIdentifier:(id)a3;
- (BOOL)firstSampleTimestampOlderThan:(id)a3;
- (BOOL)isCollectingHKQuantityType:(id)a3;
- (BOOL)isDistributed;
- (BOOL)isFitnessClassicDevice;
- (BOOL)latestSampleTimestampWithinSeconds:(double)a3;
- (BOOL)matchesDistributedService:(id)a3;
- (BOOL)supportsHKQuantityType:(id)a3;
- (BOOL)updateHealthEnabled;
- (BOOL)wasPairedAfter:(id)a3;
- (FitnessService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSArray)alwaysCollectQuantityTypes;
- (NSDate)firstSampleTimestamp;
- (NSDate)latestSampleTimestamp;
- (NSDate)pairingTimestamp;
- (NSMutableDictionary)hkDataCollectors;
- (NSMutableDictionary)hkDatumBuffers;
- (id)createDatum:(double)a3 start:(id)a4 end:(id)a5 quantityType:(id)a6;
- (id)hkQuantityTypesCollecting;
- (unint64_t)readBytesFromNSData:(id)a3 into:(void *)a4 startingAt:(unint64_t)a5 length:(unint64_t)a6 info:(id)a7;
- (unsigned)productID;
- (unsigned)vendorID;
- (void)createDataCollectorForQuantityType:(id)a3;
- (void)createHKDevice;
- (void)featuresReadComplete;
- (void)finishCollectionForQuantityType:(id)a3;
- (void)receiveDeviceInfoUpdateNotification:(id)a3;
- (void)recordDatum:(double)a3 start:(id)a4 end:(id)a5 quantityType:(id)a6;
- (void)recordDatum:(id)a3 forType:(id)a4;
- (void)setFirstSampleTimestamp:(id)a3;
- (void)setHkDataCollectors:(id)a3;
- (void)setHkDatumBuffers:(id)a3;
- (void)setLatestSampleTimestamp:(id)a3;
- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4;
- (void)setPairingTimestamp:(id)a3;
- (void)start;
- (void)stop;
- (void)storeAllDatums;
- (void)storeDatumsForQuantityType:(id)a3;
- (void)storeDatumsForQuantityType:(id)a3 usingHKDevice:(id)a4;
- (void)updateRequestedQuantityTypes:(id)a3;
@end

@implementation FitnessService

+ (id)hkQuantityTypeForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v4 = (void *)qword_1000CCFD8;
  uint64_t v10 = qword_1000CCFD8;
  if (!qword_1000CCFD8)
  {
    sub_1000088B0();
    v8[3] = (uint64_t)objc_getClass("HKQuantityType");
    qword_1000CCFD8 = v8[3];
    v4 = (void *)v8[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v7, 8);
  if (v5)
  {
    id v5 = [v5 quantityTypeForIdentifier:v3];
  }

  return v5;
}

+ (BOOL)manufacturer:(id)a3 andModel:(id)a4 matches:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([@"ALL" caseInsensitiveCompare:v9])
  {
    uint64_t v10 = [v9 componentsSeparatedByString:@"/"];
    if ([v10 count] == (id)2)
    {
      v11 = [v10 objectAtIndexedSubscript:0];
      v12 = [v10 objectAtIndexedSubscript:1];
      v13 = [v7 uppercaseString];
      v14 = [v11 uppercaseString];
      unsigned int v15 = [v13 hasPrefix:v14];

      BOOL v16 = v15
         && (![@"ALL" caseInsensitiveCompare:v12]
          || ![v8 caseInsensitiveCompare:v12]);
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (FitnessService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)FitnessService;
  uint64_t v10 = [(ClientService *)&v27 initWithManager:a3 peripheral:v8 service:v9];
  if (v10)
  {
    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = [v8 name];
      v14 = [v9 UUID];
      unsigned int v15 = [v14 UUIDString];
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FitnessService - initWithManager:peripheral:“%@” service:%@", buf, 0x16u);
    }
    [(ClientService *)v10 setIsPrimary:1];
    [(ClientService *)v10 setPriority:8];
    BOOL v16 = objc_opt_new();
    [(FitnessService *)v10 setHkDataCollectors:v16];

    v17 = objc_opt_new();
    [(FitnessService *)v10 setHkDatumBuffers:v17];

    v18 = [(ClientService *)v10 manager];
    v19 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
    v20 = [v18 clientServiceForUUID:v19];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v10 selector:"receiveDeviceInfoUpdateNotification:" name:@"DeviceInformationUpdate" object:v20];

    [(FitnessService *)v10 createHKDevice];
    v22 = [v8 customProperty:@"PairingTimestamp"];
    v23 = v22;
    if (v22)
    {
      [v22 doubleValue];
      uint64_t v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      pairingTimestamp = v10->_pairingTimestamp;
      v10->_pairingTimestamp = (NSDate *)v24;
    }
    [(FitnessService *)v10 start];
  }
  return v10;
}

- (BOOL)updateHealthEnabled
{
  return 1;
}

- (BOOL)isFitnessClassicDevice
{
  return 0;
}

- (NSArray)alwaysCollectQuantityTypes
{
  if (qword_1000CCFD0 != -1) {
    dispatch_once(&qword_1000CCFD0, &stru_1000B1168);
  }
  v2 = (void *)qword_1000CCFC8;

  return (NSArray *)v2;
}

- (BOOL)supportsHKQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = [(ClientService *)self peripheral];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 hasTag:v6];
  return (char)v4;
}

- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if (([v6 properties] & 0x10) != 0)
    {
      id v7 = [(ClientService *)self peripheral];
      [v7 setNotifyValue:v4 forCharacteristic:v8];
    }
  }

  _objc_release_x1();
}

- (void)featuresReadComplete
{
  id v3 = +[FitnessDeviceManager instance];
  [v3 registerFitnessService:self];
}

- (void)start
{
  id v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    id v5 = [(ClientService *)self peripheral];
    id v6 = [v5 name];
    *(_DWORD *)buf = 138412802;
    id v9 = v6;
    __int16 v10 = 1024;
    unsigned int v11 = [(FitnessService *)self productID];
    __int16 v12 = 1024;
    unsigned int v13 = [(FitnessService *)self vendorID];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FitnessService starting for “%@” PID:0x%04X VID:0x%04X", buf, 0x18u);
  }
  v7.receiver = self;
  v7.super_class = (Class)FitnessService;
  [(ClientService *)&v7 start];
}

- (void)stop
{
  id v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    id v5 = [(ClientService *)self peripheral];
    id v6 = [v5 name];
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FitnessService stopping for “%@”", buf, 0xCu);
  }
  [(FitnessService *)self updateRequestedQuantityTypes:&__NSArray0__struct];
  v7.receiver = self;
  v7.super_class = (Class)FitnessService;
  [(ClientService *)&v7 stop];
}

- (void)updateRequestedQuantityTypes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    objc_super v7 = [(ClientService *)self peripheral];
    id v8 = [v7 name];
    *(_DWORD *)buf = 138412290;
    v51 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FitnessService.updateRequestedQuantityTypes:%@", buf, 0xCu);
  }
  id v9 = [(FitnessService *)self alwaysCollectQuantityTypes];
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = [v4 mutableCopy];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    __int16 v12 = [(FitnessService *)self alwaysCollectQuantityTypes];
    id v13 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v44;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (([v4 containsObject:v17] & 1) == 0) {
            [v11 addObject:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = v4;
  }
  v18 = [(NSMutableDictionary *)self->_hkDataCollectors allKeys];
  id v19 = [v18 count];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v20 = v11;
  id v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
        if ([(FitnessService *)self supportsHKQuantityType:v25]) {
          [(FitnessService *)self createDataCollectorForQuantityType:v25];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v22);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v26 = [(FitnessService *)self hkQuantityTypesCollecting];
  id v27 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v35 + 1) + 8 * (void)k);
        if (([v20 containsObject:v31] & 1) == 0) {
          [(FitnessService *)self finishCollectionForQuantityType:v31];
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v28);
  }
  BOOL v32 = v19 == 0;

  v33 = [(NSMutableDictionary *)self->_hkDataCollectors allKeys];
  id v34 = [v33 count];

  if (((v32 ^ (v34 != 0)) & 1) == 0) {
    [(FitnessService *)self collectData:v34 != 0];
  }
}

- (id)hkQuantityTypesCollecting
{
  return [(NSMutableDictionary *)self->_hkDataCollectors allKeys];
}

- (BOOL)isCollectingHKQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = [(FitnessService *)self hkQuantityTypesCollecting];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (unint64_t)readBytesFromNSData:(id)a3 into:(void *)a4 startingAt:(unint64_t)a5 length:(unint64_t)a6 info:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if ((unint64_t)[v11 length] <= a5)
  {
    uint64_t v15 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138413058;
      *(void *)v18 = v12;
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)&v18[10] = a5;
      __int16 v19 = 1024;
      int v20 = a6;
      __int16 v21 = 2112;
      *(void *)id v22 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Out of range error trying to read %@ at index %d length %d from data %@", (uint8_t *)&v17, 0x22u);
    }
    a6 = 0;
  }
  else if (a6 + a5 <= (unint64_t)[v11 length])
  {
    [v11 getBytes:a4 range:a5];
  }
  else
  {
    unsigned int v13 = [v11 length] - a5;
    [v11 getBytes:a4 range:a5];
    id v14 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      int v17 = 67110146;
      *(_DWORD *)v18 = v13;
      *(_WORD *)&v18[4] = 2112;
      *(void *)&v18[6] = v12;
      __int16 v19 = 1024;
      int v20 = a5;
      __int16 v21 = 1024;
      *(_DWORD *)id v22 = a6;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could only read %d bytes from %@ at index %d instead of requested length %d from data %@", (uint8_t *)&v17, 0x28u);
    }
    a6 = v13;
  }

  return a6;
}

- (BOOL)isDistributed
{
  return 0;
}

- (BOOL)matchesDistributedService:(id)a3
{
  return 0;
}

- (id)createDatum:(double)a3 start:(id)a4 end:(id)a5 quantityType:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v12 = (void *)qword_1000CCFE8;
  uint64_t v27 = qword_1000CCFE8;
  if (!qword_1000CCFE8)
  {
    sub_1000088B0();
    v25[3] = (uint64_t)objc_getClass("HKQuantity");
    qword_1000CCFE8 = v25[3];
    id v12 = (void *)v25[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v24, 8);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v14 = (void *)qword_1000CCFF0;
  uint64_t v27 = qword_1000CCFF0;
  if (!qword_1000CCFF0)
  {
    sub_1000088B0();
    v25[3] = (uint64_t)objc_getClass("HKQuantityDatum");
    qword_1000CCFF0 = v25[3];
    id v14 = (void *)v25[3];
  }
  uint64_t v15 = v14;
  _Block_object_dispose(&v24, 8);
  if (v13 && v15)
  {
    BOOL v16 = +[FitnessDeviceManager instance];
    int v17 = [v16 hkUnitForHKQuantityType:v11];

    v18 = [v13 quantityWithUnit:v17 doubleValue:a3];
    __int16 v19 = +[NSUUID UUID];
    id v20 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v9 endDate:v10];
    id v21 = [[v15 alloc] initWithIdentifier:v19 dateInterval:v20 quantity:v18 resumeContext:0];
  }
  else
  {
    id v22 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C7E4(v22, v11);
    }
    id v21 = 0;
  }

  return v21;
}

- (BOOL)wasPairedAfter:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_pairingTimestamp)
  {
    unsigned __int8 v6 = [v4 pairingTimestamp];

    if (v6)
    {
      pairingTimestamp = self->_pairingTimestamp;
      id v8 = [v5 pairingTimestamp];
      BOOL v9 = [(NSDate *)pairingTimestamp compare:v8] == NSOrderedAscending;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)firstSampleTimestampOlderThan:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_firstSampleTimestamp)
  {
    unsigned __int8 v6 = [v4 firstSampleTimestamp];

    if (v6)
    {
      firstSampleTimestamp = self->_firstSampleTimestamp;
      id v8 = [v5 firstSampleTimestamp];
      BOOL v9 = [(NSDate *)firstSampleTimestamp compare:v8] == NSOrderedAscending;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)latestSampleTimestampWithinSeconds:(double)a3
{
  latestSampleTimestamp = self->_latestSampleTimestamp;
  if (latestSampleTimestamp)
  {
    [(NSDate *)latestSampleTimestamp timeIntervalSinceNow];
    LOBYTE(latestSampleTimestamp) = fabs(v5) < a3;
  }
  return (char)latestSampleTimestamp;
}

- (void)recordDatum:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[NSDate now];
    latestSampleTimestamp = self->_latestSampleTimestamp;
    self->_latestSampleTimestamp = v8;

    if (!self->_firstSampleTimestamp) {
      objc_storeStrong((id *)&self->_firstSampleTimestamp, self->_latestSampleTimestamp);
    }
    id v10 = +[FitnessDeviceManager instance];
    unsigned int v11 = [v10 shouldForwardFitnessService:self quantityType:v7];

    if (v11)
    {
      id v12 = [(NSMutableDictionary *)self->_hkDatumBuffers objectForKey:v7];
      id v13 = v12;
      if (v12)
      {
        [v12 addObject:v6];
      }
      else
      {
        id v14 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = v14;
          BOOL v16 = [v7 identifier];
          int v17 = [(ClientService *)self peripheral];
          v18 = [v17 name];
          hkDatumBuffers = self->_hkDatumBuffers;
          int v20 = 138412802;
          id v21 = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v18;
          __int16 v24 = 2112;
          uint64_t v25 = hkDatumBuffers;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "recordDatum:forType:%@ “%@” datumBuffer not available (hkDatumBuffers:%@)", (uint8_t *)&v20, 0x20u);
        }
      }
    }
  }
}

- (void)recordDatum:(double)a3 start:(id)a4 end:(id)a5 quantityType:(id)a6
{
  id v10 = a6;
  id v11 = [(FitnessService *)self createDatum:a4 start:a5 end:v10 quantityType:a3];
  [(FitnessService *)self recordDatum:v11 forType:v10];
}

- (void)storeDatumsForQuantityType:(id)a3 usingHKDevice:(id)a4
{
  id v6 = a3;
  id v29 = a4;
  id v7 = [(NSMutableDictionary *)self->_hkDataCollectors objectForKey:v6];
  __int16 v30 = v6;
  id v8 = [(NSMutableDictionary *)self->_hkDatumBuffers objectForKey:v6];
  BOOL v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      id v13 = [v30 identifier];
      *(_DWORD *)buf = 138412802;
      long long v42 = v7;
      __int16 v43 = 2112;
      long long v44 = v9;
      __int16 v45 = 2112;
      long long v46 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "storeDatumsForQuantityType: Missing dataCollector:%@ or datumBuffer:%@ for qty:%@", buf, 0x20u);
    }
  }
  else if ([v8 count])
  {
    uint64_t v27 = v9;
    id v28 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v9;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          __int16 v19 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
          {
            int v20 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v18);
            log = v19;
            uint64_t v31 = [v30 identifier];
            id v21 = [v29 name];
            BOOL v32 = [v20 quantity];
            [v32 _value];
            uint64_t v23 = v22;
            __int16 v24 = [v20 quantity];
            uint64_t v25 = [v24 _unit];
            uint64_t v26 = [v25 unitString];
            *(_DWORD *)buf = 138413058;
            long long v42 = v31;
            __int16 v43 = 2112;
            long long v44 = v21;
            __int16 v45 = 2048;
            long long v46 = v23;
            __int16 v47 = 2112;
            v48 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "storeDatumForQuantityType:%@ - device:“%@”: value:%f %@", buf, 0x2Au);
          }
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v16);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000075D4;
    v34[3] = &unk_1000B1190;
    id v35 = v29;
    id v36 = v30;
    id v7 = v28;
    [v28 insertDatums:v14 device:v35 metadata:0 completion:v34];
    [v14 removeAllObjects];

    BOOL v9 = v27;
  }
}

- (void)storeDatumsForQuantityType:(id)a3
{
  id v4 = a3;
  id v6 = [(ClientService *)self peripheral];
  double v5 = [v6 hkDevice];
  [(FitnessService *)self storeDatumsForQuantityType:v4 usingHKDevice:v5];
}

- (void)storeAllDatums
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->_hkDataCollectors allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(FitnessService *)self storeDatumsForQuantityType:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)finishCollectionForQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(ClientService *)self peripheral];
    long long v8 = [v7 name];
    long long v9 = [v4 identifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v23 = 2112;
    __int16 v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finishing data collection on %@ for %@", buf, 0x16u);
  }
  [(FitnessService *)self storeDatumsForQuantityType:v4];
  long long v10 = [(FitnessService *)self hkDataCollectors];
  long long v11 = [v10 objectForKey:v4];

  id v12 = objc_alloc((Class)HKDataCollectorState);
  id v13 = [v12 initWithType:1 priority:HKDataCollectorPriorityDefault + 10];
  [v11 setState:v13];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100007A10;
  __int16 v19 = &unk_1000B11B8;
  objc_copyWeak(&v21, (id *)buf);
  id v14 = v4;
  id v20 = v14;
  [v11 finishWithCompletion:&v16];
  id v15 = [(FitnessService *)self hkDataCollectors];
  [v15 removeObjectForKey:v14];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)createDataCollectorForQuantityType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_hkDataCollectors objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = objc_alloc((Class)HKDataCollectorState);
    id v8 = [v7 initWithType:2 priority:HKDataCollectorPriorityDefault + 10];
    [v6 setState:v8];
    goto LABEL_3;
  }
  long long v9 = +[FitnessDeviceManager instance];
  uint64_t v6 = [v9 createHKDataCollectorForHKQuantityType:v4];

  if (v6)
  {
    if (_os_feature_enabled_impl())
    {
      id v10 = objc_alloc((Class)HKDataCollectorState);
      id v11 = [v10 initWithType:2 priority:HKDataCollectorPriorityDefault + 10];
      [v6 setState:v11];
    }
    [(NSMutableDictionary *)self->_hkDataCollectors setObject:v6 forKey:v4];
    hkDatumBuffers = self->_hkDatumBuffers;
    id v13 = objc_opt_new();
    [(NSMutableDictionary *)hkDatumBuffers setObject:v13 forKey:v4];

    id v14 = (void *)qword_1000CD178;
    if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    id v15 = v14;
    id v8 = [(ClientService *)self peripheral];
    id v16 = [v8 name];
    int v18 = 138412546;
    __int16 v19 = v16;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created data collector for device “%@” quantity type %@", (uint8_t *)&v18, 0x16u);

LABEL_3:
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v17 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006C984(v17, self, (uint64_t)v4);
  }
LABEL_5:
}

- (void)createHKDevice
{
  id v3 = [(ClientService *)self peripheral];

  if (v3)
  {
    id v4 = [(ClientService *)self peripheral];
    uint64_t v5 = [v4 hkDevice];

    if (v5)
    {
      uint64_t v6 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = [(ClientService *)self peripheral];
        long long v9 = [v8 name];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HKDevice for %@ already exists", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x2050000000;
      id v11 = (void *)qword_1000CCFF8;
      uint64_t v54 = qword_1000CCFF8;
      if (!qword_1000CCFF8)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100008A94;
        v56 = &unk_1000B11E0;
        *(void *)v57 = &v51;
        sub_1000088B0();
        Class Class = objc_getClass("HKDevice");
        *(void *)(*(void *)(*(void *)v57 + 8) + 24) = Class;
        qword_1000CCFF8 = *(void *)(*(void *)(*(void *)v57 + 8) + 24);
        id v11 = (void *)v52[3];
      }
      id v13 = v11;
      _Block_object_dispose(&v51, 8);
      if (v13)
      {
        id v14 = [(ClientService *)self manager];
        id v15 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
        v50 = [v14 clientServiceForUUID:v15];

        self->_vendorID = (unsigned __int16)[v50 vendorID];
        self->_productID = (unsigned __int16)[v50 productID];
        id v16 = [(ClientService *)self peripheral];
        __int16 v47 = [v16 name];

        id v17 = [v13 alloc];
        v48 = [v50 manufacturerName];
        int v18 = [v50 modelNumber];
        __int16 v19 = [v50 hardwareRevision];
        __int16 v20 = [v50 firmwareRevision];
        id v21 = [v50 softwareRevision];
        __int16 v22 = [(ClientService *)self peripheral];
        __int16 v23 = [v22 identifier];
        __int16 v24 = [v23 UUIDString];
        id v25 = [v17 initWithName:v47 manufacturer:v48 model:v18 hardwareVersion:v19 firmwareVersion:v20 softwareVersion:v21 localIdentifier:v24 UDIDeviceIdentifier:0];
        uint64_t v26 = [(ClientService *)self peripheral];
        [v26 setHkDevice:v25];

        uint64_t v27 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          log = v27;
          v49 = [(ClientService *)self peripheral];
          long long v46 = [v49 hkDevice];
          long long v39 = [v46 name];
          __int16 v45 = [(ClientService *)self peripheral];
          long long v44 = [v45 hkDevice];
          long long v40 = [v44 manufacturer];
          __int16 v43 = [(ClientService *)self peripheral];
          long long v42 = [v43 hkDevice];
          id v28 = [v42 model];
          id v29 = [(ClientService *)self peripheral];
          __int16 v30 = [v29 hkDevice];
          uint64_t v31 = [v30 hardwareVersion];
          BOOL v32 = [(ClientService *)self peripheral];
          v33 = [v32 hkDevice];
          id v34 = [v33 firmwareVersion];
          id v35 = [(ClientService *)self peripheral];
          id v36 = [v35 hkDevice];
          long long v37 = [v36 localIdentifier];
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = v39;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2112;
          v56 = v28;
          *(_WORD *)v57 = 2112;
          *(void *)&v57[2] = v31;
          __int16 v58 = 2112;
          v59 = v34;
          __int16 v60 = 2112;
          v61 = v37;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Created HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", buf, 0x3Eu);
        }
      }
      else
      {
        long long v38 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006CA98(v38, self);
        }
      }
    }
  }
  else
  {
    id v10 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006CA54(v10);
    }
  }
}

- (void)receiveDeviceInfoUpdateNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  if ([v5 isEqualToString:@"DeviceInformationUpdate"])
  {
    uint64_t v6 = [(ClientService *)self peripheral];
    id v7 = [v6 identifier];
    id v8 = [v7 UUIDString];
    long long v9 = [v4 userInfo];
    id v10 = [v9 valueForKey:@"UUID"];
    unsigned int v11 = [v8 isEqualToString:v10];

    if (v11)
    {
      id v12 = [(ClientService *)self peripheral];
      id v13 = [v12 hkDevice];

      if (v13)
      {
        id v14 = [v4 userInfo];
        id v15 = [v14 valueForKey:@"ModelNumber"];

        if (v15) {
          [v13 _setModel:v15];
        }
        id v16 = [v4 userInfo];
        id v17 = [v16 valueForKey:@"FirmwareRevision"];

        if (v17) {
          [v13 _setFirmwareVersion:v17];
        }
        int v18 = [v4 userInfo];
        __int16 v19 = [v18 valueForKey:@"HardwareRevision"];

        if (v19) {
          [v13 _setHardwareVersion:v19];
        }
        __int16 v20 = [v4 userInfo];
        id v21 = [v20 valueForKey:@"ManufacturerName"];

        if (v21) {
          [v13 _setManufacturer:v21];
        }
        __int16 v22 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = v22;
          __int16 v24 = [v13 name];
          id v25 = [v13 manufacturer];
          uint64_t v26 = [v13 model];
          uint64_t v27 = [v13 hardwareVersion];
          id v28 = [v13 firmwareVersion];
          id v29 = [v13 localIdentifier];
          int v30 = 138413570;
          uint64_t v31 = v24;
          __int16 v32 = 2112;
          v33 = v25;
          __int16 v34 = 2112;
          id v35 = v26;
          __int16 v36 = 2112;
          long long v37 = v27;
          __int16 v38 = 2112;
          long long v39 = v28;
          __int16 v40 = 2112;
          long long v41 = v29;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updated HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", (uint8_t *)&v30, 0x3Eu);
        }
      }
    }
  }
  else
  {
  }
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSMutableDictionary)hkDataCollectors
{
  return self->_hkDataCollectors;
}

- (void)setHkDataCollectors:(id)a3
{
}

- (NSMutableDictionary)hkDatumBuffers
{
  return self->_hkDatumBuffers;
}

- (void)setHkDatumBuffers:(id)a3
{
}

- (NSDate)pairingTimestamp
{
  return self->_pairingTimestamp;
}

- (void)setPairingTimestamp:(id)a3
{
}

- (NSDate)firstSampleTimestamp
{
  return self->_firstSampleTimestamp;
}

- (void)setFirstSampleTimestamp:(id)a3
{
}

- (NSDate)latestSampleTimestamp
{
  return self->_latestSampleTimestamp;
}

- (void)setLatestSampleTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleTimestamp, 0);
  objc_storeStrong((id *)&self->_firstSampleTimestamp, 0);
  objc_storeStrong((id *)&self->_pairingTimestamp, 0);
  objc_storeStrong((id *)&self->_hkDatumBuffers, 0);

  objc_storeStrong((id *)&self->_hkDataCollectors, 0);
}

@end