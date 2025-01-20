@interface CyclingSpeedAndCadenceService
+ (id)UUID;
- ($609C494B4ED383A073B3BF77BC831FED)lastMeasurement;
- (BOOL)crankRevolutionDataSupported;
- (BOOL)sendDuplicateReadingsAsZero;
- (BOOL)sendZeroForDuplicates;
- (BOOL)supportsHKQuantityType:(id)a3;
- (BOOL)wheelRevolutionDataSupported;
- (CBCharacteristic)csControlPointCharacteristic;
- (CBCharacteristic)csFeatureCharacteristic;
- (CBCharacteristic)csMeasurementCharacteristic;
- (double)wheelDiameterInInches;
- (void)collectData:(BOOL)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readWheelSize;
- (void)receiveDeviceInfoUpdateNotification:(id)a3;
- (void)setCrankRevolutionDataSupported:(BOOL)a3;
- (void)setCsControlPointCharacteristic:(id)a3;
- (void)setCsFeatureCharacteristic:(id)a3;
- (void)setCsMeasurementCharacteristic:(id)a3;
- (void)setLastMeasurement:(id)a3;
- (void)setSendZeroForDuplicates:(BOOL)a3;
- (void)setWheelDiameterInInches:(double)a3;
- (void)setWheelRevolutionDataSupported:(BOOL)a3;
- (void)start;
- (void)updateZeroDuplicateValues;
- (void)updatedCadenceMeasurementValue:(id *)a3 at:(id)a4;
- (void)updatedControlPointCharacteristicValue;
- (void)updatedFeatureCharacteristicValue;
- (void)updatedMeasurementCharacteristicValue:(id)a3 at:(id)a4;
- (void)updatedSpeedMeasurementValue:(id *)a3 at:(id)a4;
@end

@implementation CyclingSpeedAndCadenceService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDCyclingSpeedAndCadenceServiceString];
}

- (void)readWheelSize
{
  v3 = [(ClientService *)self peripheral];
  v4 = [v3 customProperty:@"wheelCircumferenceMM"];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSNumberFormatter);
    [v5 setNumberStyle:1];
    v6 = [v5 numberFromString:v4];
    v7 = v6;
    if (v6)
    {
      self->_wheelDiameterInInches = (double)(int)[v6 intValue] * 0.0125318853;
    }
    else
    {
      v8 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076920(v8, self, (uint64_t)v4);
      }
    }
  }
}

- (BOOL)sendDuplicateReadingsAsZero
{
  return 1;
}

- (void)start
{
  v9.receiver = self;
  v9.super_class = (Class)CyclingSpeedAndCadenceService;
  [(FitnessService *)&v9 start];
  *(void *)&self->_lastMeasurement.cumulative_wheel_revolution = 0;
  self->_lastMeasurement.cycling_last_crank_event_time = 0;
  self->_sendZeroForDuplicates = 1;
  self->_wheelDiameterInInches = 26.3796185;
  [(CyclingSpeedAndCadenceService *)self readWheelSize];
  [(CyclingSpeedAndCadenceService *)self updateZeroDuplicateValues];
  v3 = +[CBUUID UUIDWithString:@"0x2A5C"];
  v10[0] = v3;
  v4 = +[CBUUID UUIDWithString:@"0x2A5D"];
  v10[1] = v4;
  id v5 = +[CBUUID UUIDWithString:@"0x2A5B"];
  v10[2] = v5;
  v6 = +[NSArray arrayWithObjects:v10 count:3];

  v7 = [(ClientService *)self peripheral];
  v8 = [(ClientService *)self service];
  [v7 discoverCharacteristics:v6 forService:v8];
}

- (BOOL)supportsHKQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if ([v5 isEqualToString:HKQuantityTypeIdentifierCyclingSpeed])
  {

LABEL_4:
    v8 = &OBJC_IVAR___CyclingSpeedAndCadenceService__wheelRevolutionDataSupported;
    goto LABEL_5;
  }
  v6 = [v4 identifier];
  unsigned __int8 v7 = [v6 isEqualToString:HKQuantityTypeIdentifierDistanceCycling];

  if (v7) {
    goto LABEL_4;
  }
  v11 = [v4 identifier];
  unsigned int v12 = [v11 isEqualToString:HKQuantityTypeIdentifierCyclingCadence];

  if (!v12)
  {
    BOOL v9 = 0;
    goto LABEL_6;
  }
  v8 = &OBJC_IVAR___CyclingSpeedAndCadenceService__crankRevolutionDataSupported;
LABEL_5:
  BOOL v9 = *((unsigned char *)&self->super.super.super.isa + *v8) != 0;
LABEL_6:

  return v9;
}

- (void)updateZeroDuplicateValues
{
}

- (void)receiveDeviceInfoUpdateNotification:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CyclingSpeedAndCadenceService;
  [(FitnessService *)&v17 receiveDeviceInfoUpdateNotification:v4];
  id v5 = [v4 name];
  v6 = [(ClientService *)self peripheral];
  unsigned __int8 v7 = [v6 identifier];
  v8 = [v7 UUIDString];
  BOOL v9 = [v4 userInfo];
  NSLog(@"RECEIVE DEVICE INFO UPDATE NOTIFICATION - name:%@ device UUID:%@ notification userinfo:%@", v5, v8, v9);

  v10 = [v4 name];
  if ([v10 isEqualToString:@"DeviceInformationUpdate"])
  {
    v11 = [(ClientService *)self peripheral];
    unsigned int v12 = [v11 identifier];
    v13 = [v12 UUIDString];
    v14 = [v4 userInfo];
    v15 = [v14 valueForKey:@"UUID"];
    unsigned int v16 = [v13 isEqualToString:v15];

    if (v16) {
      [(CyclingSpeedAndCadenceService *)self updateZeroDuplicateValues];
    }
  }
  else
  {
  }
}

- (void)collectData:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v6 = @"ON";
    }
    else {
      CFStringRef v6 = @"OFF";
    }
    unsigned __int8 v7 = v5;
    v8 = [(ClientService *)self peripheral];
    BOOL v9 = [v8 name];
    int v12 = 138412546;
    CFStringRef v13 = v6;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "collectData:%@ for “%@”", (uint8_t *)&v12, 0x16u);
  }
  v10 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
  [(FitnessService *)self setNotify:v3 forCharacteristic:v10];

  v11 = [(CyclingSpeedAndCadenceService *)self csControlPointCharacteristic];
  [(FitnessService *)self setNotify:v3 forCharacteristic:v11];
}

- (void)updatedCadenceMeasurementValue:(id *)a3 at:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100076B50(v7, self);
  }
  p_lastMeasurement = &self->_lastMeasurement;
  if (self->_lastMeasurement.cycling_crank_revolution || self->_lastMeasurement.cycling_last_crank_event_time)
  {
    BOOL v9 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierCyclingCadence];
    if (v9)
    {
      if ([(FitnessService *)self isCollectingHKQuantityType:v9])
      {
        int var4 = a3->var4;
        int cycling_last_crank_event_time = self->_lastMeasurement.cycling_last_crank_event_time;
        BOOL v12 = __OFSUB__(var4, cycling_last_crank_event_time);
        int v13 = var4 - cycling_last_crank_event_time;
        if (v13 < 0 != v12) {
          v13 += 0x10000;
        }
        if (v13)
        {
          int v14 = a3->var3 - self->_lastMeasurement.cycling_crank_revolution;
          if (v14 >= 1)
          {
            double v15 = (double)v13 * 0.0009765625;
            double v16 = (double)v14 * 60.0 / v15;
            if (v16 < 0.0 || v16 >= 500.0)
            {
              v20 = (void *)qword_1000CD178;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
              {
                v21 = v20;
                v22 = [(ClientService *)self peripheral];
                v23 = [v22 name];
                int var3 = a3->var3;
                int v25 = a3->var4;
                int cycling_crank_revolution = p_lastMeasurement->cycling_crank_revolution;
                int v27 = p_lastMeasurement->cycling_last_crank_event_time;
                int v28 = 138413570;
                v29 = v23;
                __int16 v30 = 2048;
                double v31 = v16;
                __int16 v32 = 1024;
                int v33 = var3;
                __int16 v34 = 1024;
                int v35 = v25;
                __int16 v36 = 1024;
                int v37 = cycling_crank_revolution;
                __int16 v38 = 1024;
                int v39 = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "“%@” Invalid cadence detected:%f rpm rev count=0x%04X timestamp=0x%04X previous rev count=0x%04X timestamp=0x%04X", (uint8_t *)&v28, 0x2Eu);
              }
            }
            else
            {
              objc_super v17 = +[NSDate dateWithTimeInterval:v6 sinceDate:-v15];
              [(FitnessService *)self recordDatum:v17 start:v6 end:v9 quantityType:v16];
              [(FitnessService *)self storeDatumsForQuantityType:v9];
            }
          }
        }
        else if (self->fCurrentDataIsDuplicate {
               && [(CyclingSpeedAndCadenceService *)self sendDuplicateReadingsAsZero])
        }
        {
          [(FitnessService *)self recordDatum:v6 start:v6 end:v9 quantityType:0.0];
          [(FitnessService *)self storeDatumsForQuantityType:v9];
        }
      }
      else
      {
        v19 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100076AA8(v19);
        }
      }
    }
    else
    {
      v18 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076A00(v18);
      }
    }
  }
  *(_DWORD *)&p_lastMeasurement->int cycling_crank_revolution = *(_DWORD *)&a3->var3;
}

- (void)updatedSpeedMeasurementValue:(id *)a3 at:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100076CB4(v7, self);
  }
  p_lastMeasurement = &self->_lastMeasurement;
  if (self->_lastMeasurement.cumulative_wheel_revolution || self->_lastMeasurement.cycling_last_wheel_event_time)
  {
    uint64_t v9 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierCyclingSpeed];
    uint64_t v10 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling];
    if (v9 | v10)
    {
      int var2 = a3->var2;
      int cycling_last_wheel_event_time = self->_lastMeasurement.cycling_last_wheel_event_time;
      BOOL v13 = __OFSUB__(var2, cycling_last_wheel_event_time);
      int v14 = var2 - cycling_last_wheel_event_time;
      if (v14 < 0 != v13) {
        v14 += 0x10000;
      }
      if (v14)
      {
        double v15 = (double)v14 * 0.0009765625;
        double v16 = self->_wheelDiameterInInches
            * ((double)(a3->var1 - self->_lastMeasurement.cumulative_wheel_revolution)
             * 3.14159265);
        double v17 = v16 / v15 * 0.0568181818;
        if (v17 >= 0.0 && v17 < 200.0)
        {
          int v28 = +[NSDate dateWithTimeInterval:v6 sinceDate:-v15];
          if (v9 && [(FitnessService *)self isCollectingHKQuantityType:v9])
          {
            [(FitnessService *)self recordDatum:v28 start:v6 end:v9 quantityType:v17];
            [(FitnessService *)self storeDatumsForQuantityType:v9];
          }
          if (v10 && [(FitnessService *)self isCollectingHKQuantityType:v10])
          {
            [(FitnessService *)self recordDatum:v28 start:v6 end:v10 quantityType:v16 * 0.0254];
            [(FitnessService *)self storeDatumsForQuantityType:v10];
          }
        }
        else
        {
          v19 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = [(ClientService *)self peripheral];
            v22 = [v21 name];
            unsigned int var1 = a3->var1;
            int v24 = a3->var2;
            unsigned int cumulative_wheel_revolution = p_lastMeasurement->cumulative_wheel_revolution;
            int v26 = p_lastMeasurement->cycling_last_wheel_event_time;
            int v29 = 138413570;
            __int16 v30 = v22;
            __int16 v31 = 2048;
            double v32 = v17;
            __int16 v33 = 1024;
            unsigned int v34 = var1;
            __int16 v35 = 1024;
            int v36 = v24;
            __int16 v37 = 1024;
            unsigned int v38 = cumulative_wheel_revolution;
            __int16 v39 = 1024;
            int v40 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "“%@” Invalid speed detected:%f rpm rev count=0x%08X timestamp=0x%04X previous rev count=0x%08X timestamp=0x%04X", (uint8_t *)&v29, 0x2Eu);
          }
        }
      }
      else if (self->fCurrentDataIsDuplicate {
             && [(CyclingSpeedAndCadenceService *)self sendDuplicateReadingsAsZero])
      }
      {
        if ([(FitnessService *)self isCollectingHKQuantityType:v9])
        {
          [(FitnessService *)self recordDatum:v6 start:v6 end:v9 quantityType:0.0];
          [(FitnessService *)self storeDatumsForQuantityType:v9];
        }
        if (v10 && [(FitnessService *)self isCollectingHKQuantityType:v10])
        {
          [(FitnessService *)self recordDatum:v6 start:v6 end:v10 quantityType:0.0];
          [(FitnessService *)self storeDatumsForQuantityType:v10];
        }
      }
    }
    else
    {
      int v27 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076C0C(v27);
      }
    }
  }
  p_lastMeasurement->unsigned int cumulative_wheel_revolution = a3->var1;
  p_lastMeasurement->int cycling_last_wheel_event_time = a3->var2;
}

- (void)updatedMeasurementCharacteristicValue:(id)a3 at:(id)a4
{
  id v5 = a4;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  id v6 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
  unsigned __int8 v7 = [v6 value];
  unint64_t v8 = [(FitnessService *)self readBytesFromNSData:v7 into:&v43 startingAt:0 length:1 info:@"CSCM - flags"];

  char v9 = v43;
  if (v43)
  {
    BOOL v12 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
    BOOL v13 = [v12 value];
    int v14 = (char *)[(FitnessService *)self readBytesFromNSData:v13 into:(char *)&v43 + 4 startingAt:v8 length:4 info:@"CSCM - wheel revs"]+ v8;

    double v15 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
    double v16 = [v15 value];
    unint64_t v17 = [(FitnessService *)self readBytesFromNSData:v16 into:&v44 startingAt:v14 length:2 info:@"CSCM - wheel event time"];

    if ((v43 & 2) == 0)
    {
      p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
      char v18 = 1;
      self->fCurrentDataIsDuplicate = 1;
      goto LABEL_9;
    }
    unint64_t v8 = (unint64_t)&v14[v17];
  }
  else if ((v43 & 2) == 0)
  {
    p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
    char v11 = 1;
    self->fCurrentDataIsDuplicate = 1;
    goto LABEL_20;
  }
  v19 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
  v20 = [v19 value];
  v21 = (char *)[(FitnessService *)self readBytesFromNSData:v20 into:(char *)&v44 + 2 startingAt:v8 length:2 info:@"CSCM - crank revs"]+ v8;

  v22 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
  v23 = [v22 value];
  [(FitnessService *)self readBytesFromNSData:v23 into:(char *)&v44 + 4 startingAt:v21 length:2 info:@"CSCM - crank event time"];

  p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
  self->fCurrentDataIsDuplicate = 1;
  if ((v9 & 1) == 0)
  {
LABEL_16:
    BOOL v24 = WORD1(v44) == self->_lastMeasurement.cycling_crank_revolution
       && WORD2(v44) == self->_lastMeasurement.cycling_last_crank_event_time;
LABEL_19:
    char v11 = 0;
    BOOL *p_fCurrentDataIsDuplicate = v24;
    if (!v24) {
      goto LABEL_14;
    }
    goto LABEL_20;
  }
  char v18 = 0;
LABEL_9:
  BOOL v24 = HIDWORD(v43) == self->_lastMeasurement.cumulative_wheel_revolution
     && (unsigned __int16)v44 == self->_lastMeasurement.cycling_last_wheel_event_time;
  BOOL *p_fCurrentDataIsDuplicate = v24;
  if ((v18 & 1) == 0)
  {
    if (!v24) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  char v11 = 1;
  if (!v24)
  {
LABEL_14:
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_20:
  if (!self->firstDuplicateEventTimeStamp)
  {
    int v26 = (NSDate *)v5;
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = v26;
    goto LABEL_22;
  }
LABEL_23:
  BOOL v28 = 1;
  if (*p_fCurrentDataIsDuplicate)
  {
    if ([(CyclingSpeedAndCadenceService *)self sendZeroForDuplicates])
    {
      [v5 timeIntervalSinceDate:self->firstDuplicateEventTimeStamp];
      if (v27 < 1.5) {
        BOOL v28 = 0;
      }
    }
  }
  int v29 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    log = v29;
    v42 = [(ClientService *)self peripheral];
    uint64_t v30 = [v42 name];
    if (self->_wheelRevolutionDataSupported) {
      CFStringRef v31 = @"✓";
    }
    else {
      CFStringRef v31 = @"0";
    }
    CFStringRef v39 = v31;
    int v40 = (void *)v30;
    if (self->_crankRevolutionDataSupported) {
      CFStringRef v32 = @"✓";
    }
    else {
      CFStringRef v32 = @"0";
    }
    CFStringRef v38 = v32;
    __int16 v33 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
    unsigned int v34 = [v33 value];
    BOOL v35 = *p_fCurrentDataIsDuplicate;
    unsigned int v36 = [(CyclingSpeedAndCadenceService *)self sendZeroForDuplicates];
    [v5 timeIntervalSinceDate:self->firstDuplicateEventTimeStamp];
    *(_DWORD *)buf = 138414082;
    v46 = v40;
    __int16 v47 = 2112;
    CFStringRef v48 = v39;
    __int16 v49 = 2112;
    CFStringRef v50 = v38;
    __int16 v51 = 2112;
    v52 = v34;
    __int16 v53 = 1024;
    BOOL v54 = v35;
    __int16 v55 = 1024;
    unsigned int v56 = v36;
    __int16 v57 = 2048;
    uint64_t v58 = v37;
    __int16 v59 = 1024;
    BOOL v60 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "“%@” Measurement - SPEED:%@ CADENCE:%@ (%@) duplicate:%d sendZeroForDuplicates:%d secondsSinceFirstDuplicate:%f sending:%d", buf, 0x46u);

    if (!v28) {
      goto LABEL_34;
    }
  }
  else if (!v28)
  {
    goto LABEL_34;
  }
  if (v9) {
    [(CyclingSpeedAndCadenceService *)self updatedSpeedMeasurementValue:&v43 at:v5];
  }
  if ((v11 & 1) == 0) {
    [(CyclingSpeedAndCadenceService *)self updatedCadenceMeasurementValue:&v43 at:v5];
  }
LABEL_34:
}

- (void)updatedFeatureCharacteristicValue
{
  __int16 v14 = 0;
  BOOL v3 = [(CyclingSpeedAndCadenceService *)self csFeatureCharacteristic];
  id v4 = [v3 value];
  [(FitnessService *)self readBytesFromNSData:v4 into:&v14 startingAt:0 length:2 info:@"CSCF - flags"];

  char v5 = v14;
  self->_wheelRevolutionDataSupported = v14 & 1;
  self->_BOOL crankRevolutionDataSupported = (v5 & 2) != 0;
  id v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    unint64_t v8 = [(ClientService *)self peripheral];
    uint64_t v9 = [v8 name];
    uint64_t v10 = (void *)v9;
    CFStringRef v11 = @"YES";
    BOOL crankRevolutionDataSupported = self->_crankRevolutionDataSupported;
    if (self->_wheelRevolutionDataSupported) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    if (!crankRevolutionDataSupported) {
      CFStringRef v11 = @"NO";
    }
    CFStringRef v18 = v13;
    __int16 v19 = 2112;
    CFStringRef v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "“%@” Features - SPEED:%@ CADENCE:%@", buf, 0x20u);
  }
  [(FitnessService *)self featuresReadComplete];
}

- (void)updatedControlPointCharacteristicValue
{
  v2 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100076D70(v2);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v32 = a3;
  if (!a5)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v8 = [a4 characteristics];
    id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        BOOL v12 = 0;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          CFStringRef v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
          __int16 v14 = [(CyclingSpeedAndCadenceService *)self csFeatureCharacteristic];
          if (v14)
          {
          }
          else
          {
            double v15 = [v13 UUID];
            uint64_t v16 = +[CBUUID UUIDWithString:@"0x2A5C"];
            unsigned int v17 = [v15 isEqual:v16];

            if (v17)
            {
              [(CyclingSpeedAndCadenceService *)self setCsFeatureCharacteristic:v13];
              [(FitnessService *)self setNotify:1 forCharacteristic:v13];
              [v32 readValueForCharacteristic:v13];
              goto LABEL_20;
            }
          }
          CFStringRef v18 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];
          if (v18)
          {
          }
          else
          {
            __int16 v19 = [v13 UUID];
            CFStringRef v20 = +[CBUUID UUIDWithString:@"0x2A5B"];
            unsigned int v21 = [v19 isEqual:v20];

            if (v21)
            {
              [(CyclingSpeedAndCadenceService *)self setCsMeasurementCharacteristic:v13];
LABEL_19:
              [(FitnessService *)self setNotify:0 forCharacteristic:v13];
              goto LABEL_20;
            }
          }
          v22 = [(CyclingSpeedAndCadenceService *)self csControlPointCharacteristic];
          if (v22)
          {

            goto LABEL_20;
          }
          v23 = [v13 UUID];
          BOOL v24 = +[CBUUID UUIDWithString:@"0x2A5D"];
          unsigned int v25 = [v23 isEqual:v24];

          if (v25)
          {
            [(CyclingSpeedAndCadenceService *)self setCsControlPointCharacteristic:v13];
            goto LABEL_19;
          }
LABEL_20:
          BOOL v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }

    [(ClientService *)self notifyDidStart];
    int v26 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];

    if (!v26)
    {
      double v27 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076F78(v27);
      }
    }
    BOOL v28 = [(CyclingSpeedAndCadenceService *)self csFeatureCharacteristic];

    if (!v28)
    {
      int v29 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076ED0(v29);
      }
    }
    uint64_t v30 = [(CyclingSpeedAndCadenceService *)self csControlPointCharacteristic];

    if (!v30)
    {
      CFStringRef v31 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076E28(v31);
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v13 = v7;
    id v8 = [(CyclingSpeedAndCadenceService *)self csFeatureCharacteristic];

    if (v8 == v13) {
      [(CyclingSpeedAndCadenceService *)self updatedFeatureCharacteristicValue];
    }
    id v9 = [(CyclingSpeedAndCadenceService *)self csMeasurementCharacteristic];

    if (v9 == v13)
    {
      id v10 = [v13 value];
      uint64_t v11 = +[NSDate now];
      [(CyclingSpeedAndCadenceService *)self updatedMeasurementCharacteristicValue:v10 at:v11];
    }
    id v12 = [(CyclingSpeedAndCadenceService *)self csControlPointCharacteristic];

    id v7 = v13;
    if (v12 == v13)
    {
      [(CyclingSpeedAndCadenceService *)self updatedControlPointCharacteristicValue];
      id v7 = v13;
    }
  }
}

- (CBCharacteristic)csMeasurementCharacteristic
{
  return self->_csMeasurementCharacteristic;
}

- (void)setCsMeasurementCharacteristic:(id)a3
{
}

- (CBCharacteristic)csFeatureCharacteristic
{
  return self->_csFeatureCharacteristic;
}

- (void)setCsFeatureCharacteristic:(id)a3
{
}

- (CBCharacteristic)csControlPointCharacteristic
{
  return self->_csControlPointCharacteristic;
}

- (void)setCsControlPointCharacteristic:(id)a3
{
}

- ($609C494B4ED383A073B3BF77BC831FED)lastMeasurement
{
  p_lastMeasurement = &self->_lastMeasurement;
  uint64_t v3 = *(void *)&self->_lastMeasurement.cycling_speed_cadence_flags;
  uint64_t v4 = *(void *)&p_lastMeasurement->cycling_last_wheel_event_time;
  result.int var2 = v4;
  result.int var3 = WORD1(v4);
  result.int var4 = WORD2(v4);
  result.var0 = ($B457590F2E91A24430F091323247A31F)v3;
  result.unsigned int var1 = HIDWORD(v3);
  return result;
}

- (void)setLastMeasurement:(id)a3
{
  self->_lastMeasurement = ($E565BE7FF4DBC4B8C15830BDD601C5D9)a3;
}

- (double)wheelDiameterInInches
{
  return self->_wheelDiameterInInches;
}

- (void)setWheelDiameterInInches:(double)a3
{
  self->_wheelDiameterInInches = a3;
}

- (BOOL)wheelRevolutionDataSupported
{
  return self->_wheelRevolutionDataSupported;
}

- (void)setWheelRevolutionDataSupported:(BOOL)a3
{
  self->_wheelRevolutionDataSupported = a3;
}

- (BOOL)crankRevolutionDataSupported
{
  return self->_crankRevolutionDataSupported;
}

- (void)setCrankRevolutionDataSupported:(BOOL)a3
{
  self->_BOOL crankRevolutionDataSupported = a3;
}

- (BOOL)sendZeroForDuplicates
{
  return self->_sendZeroForDuplicates;
}

- (void)setSendZeroForDuplicates:(BOOL)a3
{
  self->_sendZeroForDuplicates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_csFeatureCharacteristic, 0);
  objc_storeStrong((id *)&self->_csMeasurementCharacteristic, 0);

  objc_storeStrong((id *)&self->firstDuplicateEventTimeStamp, 0);
}

@end