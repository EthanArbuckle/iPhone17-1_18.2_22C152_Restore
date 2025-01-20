@interface CLDurianConnectionAttempt
- (BOOL)addPossiblePeripheral:(id)a3 withConnectionMaterial:(id)a4;
- (BOOL)doesPeripheral:(id)a3 haveAddress:(id)a4;
- (BOOL)hasConnectionMaterialForPeripheral:(id)a3;
- (CLDurianConnectionAttempt)init;
- (NSArray)possiblePeripherals;
- (NSMutableArray)krMaterials;
- (NSMutableDictionary)allMaterials;
- (NSMutableDictionary)pendingMaterials;
- (NSUUID)identifier;
- (double)attemptDuration;
- (id)connectionMaterialsForPeripheral:(id)a3;
- (id)inertCopy;
- (id)nextConnectionMaterialForPeripheral:(id)a3;
- (int64_t)state;
- (unint64_t)connectionAttemptCount;
- (void)dealloc;
- (void)popConnectionMaterialForPeripheral:(id)a3;
- (void)removePossiblePeripheral:(id)a3;
- (void)setAllMaterials:(id)a3;
- (void)setConnectionAttemptCount:(unint64_t)a3;
- (void)setKrMaterials:(id)a3;
- (void)setPendingMaterials:(id)a3;
@end

@implementation CLDurianConnectionAttempt

- (CLDurianConnectionAttempt)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLDurianConnectionAttempt;
  v2 = [(CLDurianConnectionAttempt *)&v4 init];
  if (v2)
  {
    v2->_identifier = (NSUUID *)objc_alloc_init((Class)NSUUID);
    v2->_allMaterials = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_pendingMaterials = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_startTime = mach_continuous_time();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianConnectionAttempt;
  [(CLDurianConnectionAttempt *)&v3 dealloc];
}

- (int64_t)state
{
  unint64_t v3 = (unint64_t)[(NSMutableDictionary *)self->_allMaterials count];
  unint64_t v4 = (unint64_t)[(NSMutableDictionary *)self->_pendingMaterials count];
  uint64_t v5 = 3;
  if (v4) {
    uint64_t v5 = 1;
  }
  if (v3) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = 0;
  }
  if (v3 | v4)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BE8);
    }
    v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NSMutableDictionary *)self->_allMaterials count];
      unsigned int v9 = [(NSMutableDictionary *)self->_pendingMaterials count];
      allMaterials = self->_allMaterials;
      pendingMaterials = self->_pendingMaterials;
      v13[0] = 68290563;
      v13[1] = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2081;
      v17 = "state";
      __int16 v18 = 1026;
      int v19 = v6;
      __int16 v20 = 1026;
      unsigned int v21 = v8;
      __int16 v22 = 1026;
      unsigned int v23 = v9;
      __int16 v24 = 2113;
      v25 = allMaterials;
      __int16 v26 = 2113;
      v27 = pendingMaterials;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection materials\", \"caller\":%{private, location:escape_only}s, \"state\":%{public}d, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v13, 0x42u);
    }
  }
  return v6;
}

- (BOOL)addPossiblePeripheral:(id)a3 withConnectionMaterial:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BE8);
  }
  v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v18 = 68289538;
    int v19 = 0;
    __int16 v20 = 2082;
    unsigned int v21 = "";
    __int16 v22 = 2114;
    unsigned int v23 = identifier;
    __int16 v24 = 2114;
    *(void *)v25 = [a3 identifier];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian add possible peripheral\", \"attemptUUID\":%{public, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@}", (uint8_t *)&v18, 0x26u);
  }
  if (![(NSMutableDictionary *)self->_pendingMaterials objectForKey:a3])
  {
    [(NSMutableDictionary *)self->_pendingMaterials setObject:+[NSMutableArray array] forKey:a3];
    [(NSMutableDictionary *)self->_allMaterials setObject:+[NSMutableArray array] forKey:a3];
  }
  id v9 = [(NSMutableDictionary *)self->_pendingMaterials objectForKey:a3];
  unsigned __int8 v10 = [v9 containsObject:a4];
  if ((v10 & 1) == 0)
  {
    [v9 addObject:a4];
    [self->_allMaterials objectForKey:a3] addObject:a4;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BE8);
    }
    v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (NSUUID *)[a3 identifier];
      unsigned int v13 = [(NSMutableDictionary *)self->_allMaterials count];
      unsigned int v14 = [(NSMutableDictionary *)self->_pendingMaterials count];
      allMaterials = self->_allMaterials;
      pendingMaterials = self->_pendingMaterials;
      int v18 = 68290307;
      int v19 = 0;
      __int16 v20 = 2082;
      unsigned int v21 = "";
      __int16 v22 = 2114;
      unsigned int v23 = v12;
      __int16 v24 = 1026;
      *(_DWORD *)v25 = v13;
      *(_WORD *)&v25[4] = 1026;
      *(_DWORD *)&v25[6] = v14;
      __int16 v26 = 2113;
      v27 = allMaterials;
      __int16 v28 = 2113;
      v29 = pendingMaterials;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian add material\", \"peripheralUUID\":%{public, location:escape_only}@, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)&v18, 0x3Cu);
    }
  }
  return v10 ^ 1;
}

- (void)removePossiblePeripheral:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BE8);
  }
  uint64_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    id v7 = [a3 identifier];
    unsigned int v8 = [(NSMutableDictionary *)self->_pendingMaterials count];
    int v15 = 68289794;
    int v16 = 0;
    __int16 v17 = 2082;
    int v18 = "";
    __int16 v19 = 2114;
    __int16 v20 = identifier;
    __int16 v21 = 2114;
    *(void *)__int16 v22 = v7;
    *(_WORD *)&v22[8] = 1026;
    *(_DWORD *)unsigned int v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian removing possible peripheral\", \"attemptUUID\":%{public, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@, \"pending\":%{public}d}", (uint8_t *)&v15, 0x2Cu);
  }
  [(NSMutableDictionary *)self->_pendingMaterials removeObjectForKey:a3];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BE8);
  }
  id v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v10 = (NSUUID *)[a3 identifier];
    unsigned int v11 = [(NSMutableDictionary *)self->_allMaterials count];
    unsigned int v12 = [(NSMutableDictionary *)self->_pendingMaterials count];
    allMaterials = self->_allMaterials;
    pendingMaterials = self->_pendingMaterials;
    int v15 = 68290307;
    int v16 = 0;
    __int16 v17 = 2082;
    int v18 = "";
    __int16 v19 = 2114;
    __int16 v20 = v10;
    __int16 v21 = 1026;
    *(_DWORD *)__int16 v22 = v11;
    *(_WORD *)&v22[4] = 1026;
    *(_DWORD *)&v22[6] = v12;
    *(_WORD *)unsigned int v23 = 2113;
    *(void *)&v23[2] = allMaterials;
    __int16 v24 = 2113;
    v25 = pendingMaterials;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian remove material\", \"peripheralUUID\":%{public, location:escape_only}@, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Cu);
  }
}

- (id)nextConnectionMaterialForPeripheral:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BE8);
  }
  int64_t v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v5 count];
    id v8 = [a3 identifier];
    allMaterials = self->_allMaterials;
    pendingMaterials = self->_pendingMaterials;
    v12[0] = 68290051;
    v12[1] = 0;
    __int16 v13 = 2082;
    unsigned int v14 = "";
    __int16 v15 = 1026;
    unsigned int v16 = v7;
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2113;
    __int16 v20 = allMaterials;
    __int16 v21 = 2113;
    __int16 v22 = pendingMaterials;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection nextConnectionMaterialForPeripheral\", \"count\":%{public}d, \"peripheralUUID\":%{public, location:escape_only}@, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x36u);
  }
  id result = [v5 count];
  if (result) {
    return [v5 objectAtIndex:0];
  }
  return result;
}

- (id)connectionMaterialsForPeripheral:(id)a3
{
  id v3 = [[-[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:", a3) copy];

  return v3;
}

- (void)popConnectionMaterialForPeripheral:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:");
  if ([v5 count])
  {
    [v5 removeObjectAtIndex:0];
    if (![v5 count]) {
      [(NSMutableDictionary *)self->_pendingMaterials removeObjectForKey:a3];
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BE8);
    }
    int64_t v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(NSMutableDictionary *)self->_allMaterials count];
      unsigned int v8 = [(NSMutableDictionary *)self->_pendingMaterials count];
      allMaterials = self->_allMaterials;
      pendingMaterials = self->_pendingMaterials;
      __int16 v12 = 2082;
      v11[0] = 68290307;
      __int16 v13 = "";
      __int16 v14 = 2081;
      v11[1] = 0;
      __int16 v15 = "popConnectionMaterialForPeripheral";
      __int16 v16 = 1026;
      unsigned int v17 = v7;
      __int16 v18 = 1026;
      unsigned int v19 = v8;
      __int16 v20 = 2113;
      __int16 v21 = allMaterials;
      __int16 v22 = 2113;
      unsigned int v23 = pendingMaterials;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection materials\", \"caller\":%{private, location:escape_only}s, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x3Cu);
    }
  }
}

- (BOOL)hasConnectionMaterialForPeripheral:(id)a3
{
  return [[self->_pendingMaterials objectForKey:a3] count] != 0;
}

- (BOOL)doesPeripheral:(id)a3 haveAddress:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_pendingMaterials objectForKey:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(a4, "isEqualToData:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "address")))
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v6;
}

- (NSArray)possiblePeripherals
{
  return (NSArray *)[(NSMutableDictionary *)self->_pendingMaterials allKeys];
}

- (double)attemptDuration
{
  if (!self->_startTime) {
    return 0.0;
  }
  mach_continuous_time();

  TMConvertTicksToSeconds();
  return result;
}

- (id)inertCopy
{
  id v3 = objc_alloc_init(CLDurianConnectionAttempt);
  [(CLDurianConnectionAttempt *)v3 setAllMaterials:[(NSMutableDictionary *)self->_allMaterials mutableCopy]];
  [(CLDurianConnectionAttempt *)v3 setPendingMaterials:[(NSMutableDictionary *)self->_pendingMaterials mutableCopy]];
  [(CLDurianConnectionAttempt *)v3 setKrMaterials:[(NSMutableArray *)self->_krMaterials mutableCopy]];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BE8);
  }
  unint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_allMaterials count];
    unsigned int v6 = [(NSMutableDictionary *)self->_pendingMaterials count];
    unsigned int v7 = [(NSMutableArray *)self->_krMaterials count];
    allMaterials = self->_allMaterials;
    pendingMaterials = self->_pendingMaterials;
    v11[0] = 68290563;
    v11[1] = 0;
    __int16 v12 = 2082;
    long long v13 = "";
    __int16 v14 = 2081;
    __int16 v15 = "inertCopy";
    __int16 v16 = 1026;
    unsigned int v17 = v5;
    __int16 v18 = 1026;
    unsigned int v19 = v6;
    __int16 v20 = 1026;
    unsigned int v21 = v7;
    __int16 v22 = 2113;
    unsigned int v23 = allMaterials;
    __int16 v24 = 2113;
    v25 = pendingMaterials;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection materials\", \"caller\":%{private, location:escape_only}s, \"all\":%{public}d, \"pending\":%{public}d, \"krMaterials\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x42u);
  }
  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)connectionAttemptCount
{
  return self->_connectionAttemptCount;
}

- (void)setConnectionAttemptCount:(unint64_t)a3
{
  self->_connectionAttemptCount = a3;
}

- (NSMutableArray)krMaterials
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKrMaterials:(id)a3
{
}

- (NSMutableDictionary)allMaterials
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllMaterials:(id)a3
{
}

- (NSMutableDictionary)pendingMaterials
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingMaterials:(id)a3
{
}

@end