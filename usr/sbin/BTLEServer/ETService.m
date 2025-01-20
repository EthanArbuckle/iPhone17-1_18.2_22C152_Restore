@interface ETService
+ (id)UUID;
- (CBCharacteristic)currentElapsedTimeCharacteristic;
- (ETService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (id)dateWithElapsedTimeData:(id)a3;
- (id)getDescriptionForTimeSyncSourceType:(unsigned __int8)a3;
- (void)extractTime;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setCurrentElapsedTimeCharacteristic:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ETService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDElapsedTimeServiceString];
}

- (ETService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)ETService;
  v5 = [(ClientService *)&v8 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setPriority:5];
    [(ClientService *)v6 setStartTimeout:0.0];
  }
  return v6;
}

- (void)start
{
  v7.receiver = self;
  v7.super_class = (Class)ETService;
  [(ClientService *)&v7 start];
  v3 = +[CBUUID UUIDWithString:CBUUIDCurrentElapsedTimeCharacteristicString];
  objc_super v8 = v3;
  v4 = +[NSArray arrayWithObjects:&v8 count:1];

  v5 = [(ClientService *)self peripheral];
  v6 = [(ClientService *)self service];
  [v5 discoverCharacteristics:v4 forService:v6];
}

- (void)stop
{
  v2.receiver = self;
  v2.super_class = (Class)ETService;
  [(ClientService *)&v2 stop];
}

- (id)dateWithElapsedTimeData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v34 = 0;
  unint64_t v33 = 0;
  __int16 v32 = 0;
  v5 = +[DataInputStream inputStreamWithData:v4 byteOrder:1];
  double v6 = 1.0;
  if ([v5 readUint8:&v34])
  {
    unint64_t lastTimeSyncFlags = self->_lastTimeSyncFlags;
    if (lastTimeSyncFlags != v34)
    {
      v26 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        v28 = v26;
        v29 = [(ClientService *)self peripheral];
        v30 = [v29 name];
        int v31 = self->_lastTimeSyncFlags;
        *(_DWORD *)buf = 141558787;
        uint64_t v36 = 1752392040;
        __int16 v37 = 2113;
        v38 = v30;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v34;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "ETS for peripheral \"%{private, mask.hash}@\" failed: flags: %d, lastTimeSyncFlags %d", buf, 0x22u);
      }
      goto LABEL_14;
    }
    double v6 = dbl_10008A7F0[(lastTimeSyncFlags >> 2) & 3];
  }
  if (![v5 readUint48:&v33]
    || ![v5 readUint8:(char *)&v32 + 1]
    || ![v5 readUint8:&v32])
  {
    v18 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = [(ClientService *)self peripheral];
      v21 = [v20 name];
      unint64_t lastTimeSyncTimeValue = self->_lastTimeSyncTimeValue;
      unint64_t v23 = v33;
      lastTimeSyncTimestamp = self->_lastTimeSyncTimestamp;
      v25 = [(ETService *)self getDescriptionForTimeSyncSourceType:HIBYTE(v32)];
      *(_DWORD *)buf = 141559811;
      uint64_t v36 = 1752392040;
      __int16 v37 = 2113;
      v38 = v21;
      __int16 v39 = 2048;
      *(void *)v40 = v23;
      *(_WORD *)&v40[8] = 2048;
      unint64_t v41 = lastTimeSyncTimeValue;
      __int16 v42 = 2112;
      v43 = lastTimeSyncTimestamp;
      __int16 v44 = 2048;
      double v45 = 0.0;
      __int16 v46 = 2112;
      v47 = v25;
      __int16 v48 = 1024;
      int v49 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "ETS Error for peripheral \"%{private, mask.hash}@\": timeValue %llu, _lastSyncTime %llu, %@, diffInSeconds %f, timeSyncSource %@, dstOffset %d", buf, 0x4Eu);
    }
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  double v8 = v6 * ((double)v33 - (double)self->_lastTimeSyncTimeValue);
  v9 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [(ClientService *)self peripheral];
    v12 = [v11 name];
    unint64_t v13 = self->_lastTimeSyncTimeValue;
    unint64_t v14 = v33;
    v15 = self->_lastTimeSyncTimestamp;
    v16 = [(ETService *)self getDescriptionForTimeSyncSourceType:HIBYTE(v32)];
    *(_DWORD *)buf = 141559811;
    uint64_t v36 = 1752392040;
    __int16 v37 = 2113;
    v38 = v12;
    __int16 v39 = 2048;
    *(void *)v40 = v14;
    *(_WORD *)&v40[8] = 2048;
    unint64_t v41 = v13;
    __int16 v42 = 2112;
    v43 = v15;
    __int16 v44 = 2048;
    double v45 = v8;
    __int16 v46 = 2112;
    v47 = v16;
    __int16 v48 = 1024;
    int v49 = v32;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\": timeValue %llu, _lastSyncTime %llu, %@, diffInSeconds %f, timeSyncSource %@, dstOffset %d", buf, 0x4Eu);
  }
  v17 = +[NSDate dateWithTimeInterval:self->_lastTimeSyncTimestamp sinceDate:v8];
LABEL_15:

  return v17;
}

- (id)getDescriptionForTimeSyncSourceType:(unsigned __int8)a3
{
  int v3 = a3;
  if (a3 < 8u) {
    return off_1000B1A78[(char)a3];
  }
  double v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_1000703F8(v6, (uint64_t)self, v3);
  }
  return @"Invalid";
}

- (void)extractTime
{
  int v3 = +[NSDate date];
  lastTimeSyncTimestamp = self->_lastTimeSyncTimestamp;
  self->_lastTimeSyncTimestamp = v3;

  v5 = [(ETService *)self currentElapsedTimeCharacteristic];
  double v6 = [v5 value];
  objc_super v7 = +[DataInputStream inputStreamWithData:v6 byteOrder:1];

  double v8 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [(ClientService *)self peripheral];
    v11 = [v10 name];
    *(_DWORD *)buf = 141558531;
    uint64_t v36 = 1752392040;
    __int16 v37 = 2113;
    uint64_t v38 = (uint64_t)v11;
    __int16 v39 = 2112;
    unint64_t v40 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\" data received rawDataBytes %@", buf, 0x20u);
  }
  unsigned __int8 v34 = 0;
  unint64_t v33 = 0;
  __int16 v32 = 0;
  __int16 v31 = 0;
  if ([v7 readUint8:&v34])
  {
    self->_unint64_t lastTimeSyncFlags = v34;
    v12 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = v12;
      unint64_t v14 = [(ClientService *)self peripheral];
      v15 = [v14 name];
      *(_DWORD *)buf = 141558531;
      uint64_t v36 = 1752392040;
      __int16 v37 = 2113;
      uint64_t v38 = (uint64_t)v15;
      __int16 v39 = 1024;
      LODWORD(v40) = v34;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\" data received, flags %d", buf, 0x1Cu);
    }
  }
  if ([v7 readUint48:&v33])
  {
    if ([v7 readUint8:(char *)&v32 + 1])
    {
      if ([v7 readUint8:&v32])
      {
        self->_unint64_t lastTimeSyncTimeValue = v33;
        v16 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = [(ClientService *)self peripheral];
          v19 = [v18 name];
          unint64_t lastTimeSyncTimeValue = self->_lastTimeSyncTimeValue;
          v21 = self->_lastTimeSyncTimestamp;
          v22 = [(ETService *)self getDescriptionForTimeSyncSourceType:HIBYTE(v32)];
          *(_DWORD *)buf = 141559299;
          uint64_t v36 = 1752392040;
          __int16 v37 = 2113;
          uint64_t v38 = (uint64_t)v19;
          __int16 v39 = 2048;
          unint64_t v40 = lastTimeSyncTimeValue;
          __int16 v41 = 2112;
          __int16 v42 = v21;
          __int16 v43 = 2112;
          __int16 v44 = v22;
          __int16 v45 = 1024;
          int v46 = v32;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\": referenceTimeValue %llu / %@, timeSyncSource %@, dstOffset %d", buf, 0x3Au);
        }
      }
    }
  }
  if ([v7 readUint8:(char *)&v31 + 1] && (v31 & 0x100) != 0)
  {
    unint64_t v23 = [(ETService *)self currentElapsedTimeCharacteristic];
    [v23 properties];
  }
  if ([v7 readUint8:&v31])
  {
    self->_lastTimeSyncClockCapability = v31;
    v24 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = [(ClientService *)self peripheral];
      uint64_t v27 = [v26 name];
      v28 = (void *)v27;
      *(_DWORD *)buf = 141558787;
      uint64_t v36 = 1752392040;
      if (v31) {
        v29 = "Y";
      }
      else {
        v29 = "N";
      }
      __int16 v37 = 2113;
      if ((v31 & 2) != 0) {
        v30 = "Y";
      }
      else {
        v30 = "N";
      }
      uint64_t v38 = v27;
      __int16 v39 = 2080;
      unint64_t v40 = (unint64_t)v29;
      __int16 v41 = 2080;
      __int16 v42 = (void *)v30;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\": clockAppliesDSTRules %s, clockManagesTZChanges %s", buf, 0x2Au);
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000704D8(v10);
    }
  }
  else
  {
    id v22 = v8;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v11 = [v8 characteristics];
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      uint64_t v15 = CBUUIDCurrentElapsedTimeCharacteristicString;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v18 = [(ETService *)self currentElapsedTimeCharacteristic];
          if (v18)
          {
          }
          else
          {
            v19 = [v17 UUID];
            v20 = +[CBUUID UUIDWithString:v15];
            unsigned int v21 = [v19 isEqual:v20];

            if (v21)
            {
              [(ETService *)self setCurrentElapsedTimeCharacteristic:v17];
              [v23 readValueForCharacteristic:v17];
              if (([v17 properties] & 0x10) != 0
                || ([v17 properties] & 0x20) != 0)
              {
                [v23 setNotifyValue:1 forCharacteristic:v17];
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    [(ClientService *)self notifyDidStart];
    id v9 = 0;
    id v8 = v22;
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100070584(v11);
    }
  }
  else
  {
    id v12 = [(ETService *)self currentElapsedTimeCharacteristic];

    if (v12 == v9) {
      [(ETService *)self extractTime];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100070630(v10);
    }
  }
}

- (CBCharacteristic)currentElapsedTimeCharacteristic
{
  return self->_currentElapsedTimeCharacteristic;
}

- (void)setCurrentElapsedTimeCharacteristic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentElapsedTimeCharacteristic, 0);

  objc_storeStrong((id *)&self->_lastTimeSyncTimestamp, 0);
}

@end