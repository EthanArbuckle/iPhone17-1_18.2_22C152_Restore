@interface TMCache
- (BOOL)isValid;
- (BOOL)readValidCache:(id)a3 clock:(id)a4;
- (BOOL)rtcReset;
- (BOOL)systemTimeSet;
- (NSData)STF;
- (NSData)TDTF;
- (NSUUID)bootUUID;
- (NSUUID)hostUUID;
- (TMCache)initWithDictionary:(id)a3 clock:(id)a4;
- (TMCache)initWithPath:(id)a3 clock:(id)a4;
- (double)accessoryUnc_s;
- (double)lastNTPFetchAttempt;
- (double)lastRtcTime;
- (id)filesystemTimestampOfPath:(id)a3;
- (unsigned)rtcResetCount;
- (void)dealloc;
- (void)emptyPath:(id)a3;
- (void)saveDict:(id)a3 toPath:(id)a4;
- (void)savePath:(id)a3;
- (void)setAccessoryUnc_s:(double)a3;
- (void)setBootUUID:(id)a3;
- (void)setHostUUID:(id)a3;
- (void)setLastNTPFetchAttempt:(double)a3;
- (void)setLastRtcTime:(double)a3;
- (void)setRtcResetCount:(unsigned int)a3;
- (void)setSTF:(id)a3;
- (void)setSystemTimeSet:(BOOL)a3;
- (void)setTDTF:(id)a3;
- (void)touchPath:(id)a3 tv:(timeval *)a4;
@end

@implementation TMCache

- (TMCache)initWithPath:(id)a3 clock:(id)a4
{
  v7 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = sub_1000058D8();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PMU presence: %d", buf, 8u);
    v7 = qword_1000338F8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100019C30();
  }
  id v13 = 0;
  id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a3) error:&v13];
  v9 = qword_1000338F8;
  if (!v8 && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v13 userInfo];
    *(_DWORD *)buf = 138412290;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to read cache: %@", buf, 0xCu);
    v9 = qword_1000338F8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "read cache: %@", buf, 0xCu);
  }
  v11 = [(TMCache *)self initWithDictionary:v8 clock:a4];

  return v11;
}

- (TMCache)initWithDictionary:(id)a3 clock:(id)a4
{
  v6 = [(TMCache *)self init];
  if (v6)
  {
    -[TMCache setSystemTimeSet:](v6, "setSystemTimeSet:", [[objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSystemTimeSet")) BOOLValue];
    v6->_clock = (TMMonotonicClock *)a4;
    if ([(TMCache *)v6 readValidCache:a3 clock:a4])
    {
      [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMLastRtcTime") doubleValue];
      -[TMCache setLastRtcTime:](v6, "setLastRtcTime:");
      [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMLastNtpFetchAttempt") doubleValue];
      -[TMCache setLastNTPFetchAttempt:](v6, "setLastNTPFetchAttempt:");
      -[TMCache setRtcResetCount:](v6, "setRtcResetCount:", [objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RTCResetCount"), "unsignedIntValue") unsignedIntValue]);
      v7 = (_UNKNOWN **)[a3 objectForKeyedSubscript:@"TMAccessoryUnc_s"];
      if (!v7) {
        v7 = &off_10002C258;
      }
      [v7 doubleValue];
      -[TMCache setAccessoryUnc_s:](v6, "setAccessoryUnc_s:");
      if ([a3 objectForKeyedSubscript:@"BootUUID"]) {
        v6->_bootUUID = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:[a3 objectForKeyedSubscript:@"BootUUID"]];
      }
      if ([a3 objectForKeyedSubscript:@"TDTF"]) {
        -[TMCache setTDTF:](v6, "setTDTF:", [a3 objectForKeyedSubscript:@"TDTF"]);
      }
      if ([a3 objectForKeyedSubscript:@"STF"]) {
        -[TMCache setSTF:](v6, "setSTF:", [a3 objectForKeyedSubscript:@"STF"]);
      }
      v6->_valid = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_clock = 0;
  [(TMCache *)self setBootUUID:0];
  [(TMCache *)self setHostUUID:0];
  [(TMCache *)self setSTF:0];
  [(TMCache *)self setTDTF:0];
  v3.receiver = self;
  v3.super_class = (Class)TMCache;
  [(TMCache *)&v3 dealloc];
}

- (void)touchPath:(id)a3 tv:(timeval *)a4
{
  if (utimes((const char *)objc_msgSend(a3, "UTF8String", a4->tv_sec, *(void *)&a4->tv_usec, a4->tv_sec, *(void *)&a4->tv_usec), &v4))
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_100019CA4();
    }
  }
}

- (void)emptyPath:(id)a3
{
  [(TMCache *)self setSystemTimeSet:0];
  [(TMCache *)self setLastRtcTime:0.0];
  [(TMCache *)self setLastNTPFetchAttempt:0.0];
  [(TMCache *)self setRtcResetCount:0];
  [(TMCache *)self setAccessoryUnc_s:1.79769313e308];
  [(TMCache *)self setBootUUID:0];
  [(TMCache *)self setHostUUID:0];
  [(TMCache *)self setSTF:0];
  [(TMCache *)self setTDTF:0];
  self->_valid = 0;
  id v5 = [objc_alloc((Class)NSURL) initFileURLWithPath:a3];
  if (v5)
  {
    uint64_t v13 = 0;
    if (![+[NSFileManager defaultManager] removeItemAtURL:v5 error:&v13])
    {
      v6 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_100019D0C((uint64_t)&v13, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
}

- (void)savePath:(id)a3
{
  id v5 = +[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:[(TMCache *)self systemTimeSet]], @"TMSystemTimeSet");
  [(TMCache *)self lastRtcTime];
  [(NSMutableDictionary *)v5 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"TMLastRtcTime"];
  [(TMCache *)self lastNTPFetchAttempt];
  [(NSMutableDictionary *)v5 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"TMLastNtpFetchAttempt"];
  [(NSMutableDictionary *)v5 setObject:&off_10002C298 forKeyedSubscript:@"TMVersionKey"];
  [(NSMutableDictionary *)v5 setObject:+[NSNumber numberWithUnsignedInt:[(TMCache *)self rtcResetCount]] forKeyedSubscript:@"RTCResetCount"];
  [(TMCache *)self accessoryUnc_s];
  [(NSMutableDictionary *)v5 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"TMAccessoryUnc_s"];
  [(NSMutableDictionary *)v5 setObject:[(NSUUID *)[(TMCache *)self hostUUID] UUIDString] forKeyedSubscript:@"HostUUID"];
  [(NSMutableDictionary *)v5 setObject:[(NSUUID *)[(TMCache *)self bootUUID] UUIDString] forKeyedSubscript:@"BootUUID"];
  [(NSMutableDictionary *)v5 setObject:[(TMCache *)self STF] forKeyedSubscript:@"STF"];
  [(NSMutableDictionary *)v5 setObject:[(TMCache *)self TDTF] forKeyedSubscript:@"TDTF"];

  [(TMCache *)self saveDict:v5 toPath:a3];
}

- (id)filesystemTimestampOfPath:(id)a3
{
  id result = [objc_alloc((Class)NSURL) initFileURLWithPath:a3];
  if (!result) {
    return result;
  }
  id v5 = result;
  uint64_t v18 = 0;
  v6 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [result path], &v18);

  if (!v6)
  {
    uint64_t v14 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      id v15 = "Unable to stat cache for modification timestamp: %@";
      v16 = v14;
      uint32_t v17 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
    return 0;
  }
  uint64_t v7 = [(NSDictionary *)v6 fileModificationDate];
  uint64_t v8 = qword_1000338F8;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v15 = "Unable to access the modification timestamp for cache";
      v16 = v8;
      uint32_t v17 = 2;
      goto LABEL_15;
    }
    return 0;
  }
  uint64_t v9 = v7;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving modification timestamp from cache", buf, 2u);
  }
  [(NSDate *)v9 timeIntervalSinceReferenceDate];
  long double v11 = v10;
  v19[0] = @"TMCommand";
  v19[1] = @"TMSource";
  v20[0] = @"TMSetSourceTime";
  v20[1] = @"FilesystemTimestamp";
  v19[2] = @"TMCurrentTime";
  v20[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v20[3] = &off_10002C268;
  v19[3] = @"TMTimeError";
  v19[4] = @"TMRtcTime";
  [(TMMonotonicClock *)self->_clock coarseMonotonicTime];
  v20[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[5] = @"TMMachTime";
  v20[5] = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v19[6] = @"TMAbsoluteNanoTime";
  if (v11 >= 9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&v11 file lineNumber description];
  }
  if (v11 <= -9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&v11 file lineNumber description];
  }
  *(void *)buf = 0;
  long double v12 = modf(v11, (long double *)buf);
  v20[6] = +[NSNumber numberWithLongLong:llround(v12 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf];
  v19[7] = @"TMNanoTimeError";
  *(void *)buf = 0;
  long double v13 = modf(1500000000.0, (long double *)buf);
  v20[7] = +[NSNumber numberWithLongLong:llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf];
  return +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:8];
}

- (BOOL)readValidCache:(id)a3 clock:(id)a4
{
  if (![a3 count])
  {
    id v15 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cache is empty.", (uint8_t *)&v28, 2u);
    }
    return 1;
  }
  id v7 = [[objc_msgSend(a3, "objectForKeyedSubscript:", @"TMVersionKey") integerValue];
  if (v7 != (id)18)
  {
    double v16 = *(double *)&v7;
    uint64_t v17 = qword_1000338F8;
    BOOL v18 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v18) {
      return result;
    }
    int v28 = 134218240;
    double v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = 18;
    v19 = "Cache format changed from %ld to %ld. Cache invalid.";
LABEL_14:
    v20 = v17;
    uint32_t v21 = 22;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
    return 0;
  }
  [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMLastRtcTime") doubleValue];
  double v9 = v8;
  [a4 coarseMonotonicTime];
  double v11 = v10;
  long double v12 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    int v28 = 134218240;
    double v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = *(void *)&v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Current RTC: %lf Cached RTC: %lf", (uint8_t *)&v28, 0x16u);
  }
  if (v9 <= v11)
  {
    if (sub_100006024(0))
    {
      if (sub_1000058D8())
      {
        double v22 = COERCE_DOUBLE([a3 objectForKeyedSubscript:@"HostUUID"]);
        v23 = [(NSUUID *)[(TMCache *)self hostUUID] UUIDString];
        if (([*(id *)&v22 isEqual:v23] & 1) == 0)
        {
          uint64_t v17 = qword_1000338F8;
          BOOL v24 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
          BOOL result = 0;
          if (!v24) {
            return result;
          }
          int v28 = 138412546;
          double v29 = v22;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v23;
          v19 = "Host UUID has changed. Cache Invalid. Cached:%@ Host:%@";
          goto LABEL_14;
        }
        return 1;
      }
      uint64_t v25 = qword_1000338F8;
      BOOL v27 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v27) {
        return result;
      }
      LOWORD(v28) = 0;
      v19 = "This platform is not equipped with a PMU RTC. Cache invalid.";
    }
    else
    {
      uint64_t v25 = qword_1000338F8;
      BOOL v26 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v26) {
        return result;
      }
      LOWORD(v28) = 0;
      v19 = "Current RTC offset is zero. RTC reset likely. Cache invalid.";
    }
    v20 = v25;
    uint32_t v21 = 2;
    goto LABEL_25;
  }
  long double v13 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Current RTC value older than cache. RTC reset likely. Cache invalid.", (uint8_t *)&v28, 2u);
  }
  BOOL result = 0;
  self->_rtcReset = 1;
  return result;
}

- (void)saveDict:(id)a3 toPath:(id)a4
{
  uint64_t v19 = 0;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v19];
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_100019EA4();
    }
  }
  else
  {
    v6 = v5;
    id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:a4];
    if (v7)
    {
      uint64_t v18 = 0;
      unsigned int v8 = [(NSData *)v6 writeToURL:v7 options:268435457 error:&v18];
      double v9 = qword_1000338F8;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Cached state.", v17, 2u);
          double v9 = qword_1000338F8;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_100019DC0();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
      {
        sub_100019E34((uint64_t)&v18, v9, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      double v10 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_100019D7C(v10);
      }
    }
  }
}

- (NSUUID)hostUUID
{
  BOOL result = self->_hostUUID;
  if (!result)
  {
    v4.tv_sec = 0;
    v4.tv_nsec = 0;
    memset(v5, 0, sizeof(v5));
    gethostuuid(v5, &v4);
    BOOL result = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:v5];
    self->_hostUUID = result;
  }
  return result;
}

- (BOOL)systemTimeSet
{
  return self->_systemTimeSet;
}

- (void)setSystemTimeSet:(BOOL)a3
{
  self->_systemTimeSet = a3;
}

- (double)lastRtcTime
{
  return self->_lastRtcTime;
}

- (void)setLastRtcTime:(double)a3
{
  self->_lastRtcTime = a3;
}

- (double)lastNTPFetchAttempt
{
  return self->_lastNTPFetchAttempt;
}

- (void)setLastNTPFetchAttempt:(double)a3
{
  self->_lastNTPFetchAttempt = a3;
}

- (unsigned)rtcResetCount
{
  return self->_rtcResetCount;
}

- (void)setRtcResetCount:(unsigned int)a3
{
  self->_rtcResetCount = a3;
}

- (double)accessoryUnc_s
{
  return self->_accessoryUnc_s;
}

- (void)setAccessoryUnc_s:(double)a3
{
  self->_accessoryUnc_s = a3;
}

- (NSUUID)bootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBootUUID:(id)a3
{
}

- (NSData)STF
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSTF:(id)a3
{
}

- (NSData)TDTF
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTDTF:(id)a3
{
}

- (BOOL)rtcReset
{
  return self->_rtcReset;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setHostUUID:(id)a3
{
}

@end