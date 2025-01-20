@interface CLDurianScanCache
- (CLDurianScanCache)init;
- (NSMutableDictionary)scanCache;
- (id)getAddressForUuid:(id)a3;
- (int)secondsFromLastQuarterHour;
- (int64_t)getMaintenanceReasonForUuid:(id)a3;
- (void)addScanResultAtDate:(id)a3 address:(id)a4 maintenanceReason:(int64_t)a5 reconciledUUID:(id)a6;
- (void)clearData;
- (void)dealloc;
- (void)pruneAggregatedResults;
- (void)setScanCache:(id)a3;
@end

@implementation CLDurianScanCache

- (CLDurianScanCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLDurianScanCache;
  v2 = [(CLDurianScanCache *)&v4 init];
  if (v2) {
    v2->_scanCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianScanCache;
  [(CLDurianScanCache *)&v3 dealloc];
}

- (void)clearData
{
}

- (void)addScanResultAtDate:(id)a3 address:(id)a4 maintenanceReason:(int64_t)a5 reconciledUUID:(id)a6
{
  id v11 = [(NSMutableDictionary *)self->_scanCache objectForKey:a4];
  v12 = &qword_102419000;
  v13 = &qword_102419000;
  if (v11)
  {
    v14 = v11;
    id v15 = [v11 objectForKey:@"kCLScanResultDataKey"];
    id v16 = [v14 objectForKey:@"kCLScanResultNeedsMaintenanceKey"];
    if ([a3 compare:v15] == (id)-1) {
      v17 = @"dropolder";
    }
    else {
      v17 = @"overwrite";
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332898);
    }
    v18 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290307;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2113;
      id v29 = [[objc_msgSend(a6, "description") substringToIndex:8];
      v13 = &qword_102419000;
      __int16 v30 = 2113;
      v31 = sub_101640700(a4);
      __int16 v32 = 2114;
      *(void *)v33 = v15;
      *(_WORD *)&v33[8] = 1026;
      *(_DWORD *)&v33[10] = [v16 integerValue];
      __int16 v34 = 2114;
      v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache existing\", \"item\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"date\":%{public, location:escape_only}@, \"reason\":%{public}d, \"action\":%{public, location:escape_only}@}", buf, 0x40u);
    }
    v12 = &qword_102419000;
  }
  else
  {
    v17 = @"addnew";
  }
  if (([(__CFString *)v17 isEqualToString:@"dropolder"] & 1) == 0)
  {
    v23[2] = +[NSNumber numberWithInteger:a5, @"kCLScanResultDataKey", @"kCLScanResultAddressKey", @"kCLScanResultNeedsMaintenanceKey", a3, a4];
    [(NSMutableDictionary *)self->_scanCache setObject:+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:3]) forKey:a6];
  }
  if (v12[114] != -1) {
    dispatch_once(&qword_102419390, &stru_102332898);
  }
  v19 = v13[115];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [[objc_msgSend(a6, "description") substringToIndex:8];
    v21 = (__CFString *)[(NSMutableDictionary *)self->_scanCache count];
    *(_DWORD *)buf = 68290307;
    int v25 = 0;
    __int16 v26 = 2082;
    v27 = "";
    __int16 v28 = 2113;
    id v29 = v20;
    __int16 v30 = 2114;
    v31 = a3;
    __int16 v32 = 1026;
    *(_DWORD *)v33 = a5;
    *(_WORD *)&v33[4] = 2114;
    *(void *)&v33[6] = v17;
    __int16 v34 = 2050;
    v35 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache entry\", \"item\":%{private, location:escape_only}@, \"date\":%{public, location:escape_only}@, \"reason\":%{public}d, \"action\":%{public, location:escape_only}@, \"size\":%{public}lu}", buf, 0x40u);
  }
}

- (int64_t)getMaintenanceReasonForUuid:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:");
  id v6 = v5;
  if (v5) {
    int64_t v7 = (int64_t)[v5 objectForKey:@"kCLScanResultNeedsMaintenanceKey"].integerValue;
  }
  else {
    int64_t v7 = -1;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332898);
  }
  v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [[objc_msgSend(a3, "description") substringToIndex:8];
    id v10 = [(NSMutableDictionary *)self->_scanCache count];
    v12[0] = 68290051;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2113;
    id v16 = v9;
    __int16 v17 = 1026;
    int v18 = v7;
    __int16 v19 = 1026;
    BOOL v20 = v6 != 0;
    __int16 v21 = 2050;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache maintreason\", \"item\":%{private, location:escape_only}@, \"reason\":%{public}d, \"entry\":%{public}hhd, \"size\":%{public}lu}", (uint8_t *)v12, 0x32u);
  }
  return v7;
}

- (id)getAddressForUuid:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:");
  id v6 = v5;
  if (v5) {
    id v7 = [v5 objectForKey:@"kCLScanResultAddressKey"];
  }
  else {
    id v7 = 0;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332898);
  }
  v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [[objc_msgSend(a3, "description") substringToIndex:8];
    id v10 = [(NSMutableDictionary *)self->_scanCache count];
    v12[0] = 68290051;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2113;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 1026;
    BOOL v20 = v6 != 0;
    __int16 v21 = 2050;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache address\", \"item\":%{private, location:escape_only}@, \"addr\":%{public, location:escape_only}@, \"entry\":%{public}hhd, \"size\":%{public}lu}", (uint8_t *)v12, 0x36u);
  }
  return v7;
}

- (int)secondsFromLastQuarterHour
{
  v2 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") components:192 fromDate:+[NSDate date]];
  int v3 = (int)[(NSDateComponents *)v2 minute] % 15;
  return [(NSDateComponents *)v2 second] + 60 * v3;
}

- (void)pruneAggregatedResults
{
  id v15 = [(NSMutableDictionary *)self->_scanCache count];
  id v3 = +[NSMutableArray array];
  int v4 = [(CLDurianScanCache *)self secondsFromLastQuarterHour];
  int v5 = v4 - 5;
  if (v4 <= 5) {
    int v5 = v4;
  }
  int v16 = v5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(NSMutableDictionary *)self->_scanCache allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        -[NSDate timeIntervalSinceDate:][+[NSDate now](NSDate, "now") timeIntervalSinceDate:[objc_msgSend(-[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:", v11), "objectForKey:", @"kCLScanResultDataKey")];
        if (fabs(v12) > (double)v16) {
          [v3 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v8);
  }
  [(NSMutableDictionary *)self->_scanCache removeObjectsForKeys:v3];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332898);
  }
  __int16 v13 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(NSMutableDictionary *)self->_scanCache count];
    *(_DWORD *)buf = 68289794;
    int v22 = 0;
    __int16 v23 = 2082;
    v24 = "";
    __int16 v25 = 1026;
    int v26 = v16;
    __int16 v27 = 2050;
    id v28 = v15;
    __int16 v29 = 2050;
    id v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache prune\", \"delta\":%{public}d, \"pre\":%{public}lu, \"post\":%{public}lu}", buf, 0x2Cu);
  }
}

- (NSMutableDictionary)scanCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScanCache:(id)a3
{
}

@end