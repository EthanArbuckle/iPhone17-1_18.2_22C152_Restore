@interface TMTimeSynthesizerMonitor
- (BOOL)shouldReset;
- (NSMutableDictionary)sourceRejects;
- (TMTimeSynthesizerMonitor)init;
- (void)dealloc;
- (void)resetRejectCountsForReason:(int64_t)a3 rtc:(double)a4;
- (void)sendConsecutiveRejectsAnalyticsAtRtc:(double)a3 forReason:(int64_t)a4 withTime:(id)a5;
- (void)setSourceRejects:(id)a3;
- (void)synthesizer:(id)a3 rejectedTimeInput:(id)a4;
@end

@implementation TMTimeSynthesizerMonitor

- (TMTimeSynthesizerMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)TMTimeSynthesizerMonitor;
  v2 = [(TMTimeSynthesizerMonitor *)&v4 init];
  if (v2) {
    v2->_sourceRejects = +[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", +[NSDictionary sharedKeySetForKeys:&off_10002C900]);
  }
  return v2;
}

- (void)dealloc
{
  [(TMTimeSynthesizerMonitor *)self setSourceRejects:0];
  v3.receiver = self;
  v3.super_class = (Class)TMTimeSynthesizerMonitor;
  [(TMTimeSynthesizerMonitor *)&v3 dealloc];
}

- (void)resetRejectCountsForReason:(int64_t)a3 rtc:(double)a4
{
  v7 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "resetting reject counts", v8, 2u);
  }
  [(TMTimeSynthesizerMonitor *)self sendConsecutiveRejectsAnalyticsAtRtc:a3 forReason:0 withTime:a4];
  [(NSMutableDictionary *)[(TMTimeSynthesizerMonitor *)self sourceRejects] removeAllObjects];
}

- (void)synthesizer:(id)a3 rejectedTimeInput:(id)a4
{
  if (objc_msgSend(&off_10002C900, "containsObject:", objc_msgSend(a4, "source", a3)))
  {
    id v6 = -[NSMutableDictionary objectForKey:](-[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"), "objectForKey:", [a4 source]);
    if (v6) {
      [-[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects") setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 intValue] + 1) forKeyedSubscript:objc_msgSend(a4, "source")];
    }
    else {
      -[NSMutableDictionary setObject:forKey:](-[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"), "setObject:forKey:", &off_10002C7F0, [a4 source]);
    }
    v8 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = [a4 source];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "source %@ has been rejected by Secure Filter, incrementing count", (uint8_t *)&v9, 0xCu);
    }
    [a4 rtc_s];
    -[TMTimeSynthesizerMonitor sendConsecutiveRejectsAnalyticsAtRtc:forReason:withTime:](self, "sendConsecutiveRejectsAnalyticsAtRtc:forReason:withTime:", 3, a4);
  }
  else
  {
    v7 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = [a4 source];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "source %@ is not being tracked by TMTimeSynthesizerMonitor", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)shouldReset
{
  unsigned int v3 = [[-[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects") objectForKeyedSubscript:@"NTP"] intValue];
  unsigned int v4 = [[-[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects") objectForKeyedSubscript:@"APNS"] intValue];
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = v3;
    __int16 v8 = 1024;
    unsigned int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SynthesizerMonitor: ntp_rejects: %d apns_rejects: %d", (uint8_t *)v7, 0xEu);
  }
  return 0;
}

- (void)sendConsecutiveRejectsAnalyticsAtRtc:(double)a3 forReason:(int64_t)a4 withTime:(id)a5
{
  __int16 v8 = +[NSMutableDictionary dictionaryWithDictionary:[(TMTimeSynthesizerMonitor *)self sourceRejects]];
  if (a5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [a5 utc_s];
    [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithDouble:Current - v10] forKey:@"difference"];
  }
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithDouble:a3] forKey:@"rtc_s"];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithInteger:a4] forKey:@"report_reason"];
  AnalyticsSendEventLazy();
}

- (NSMutableDictionary)sourceRejects
{
  return self->_sourceRejects;
}

- (void)setSourceRejects:(id)a3
{
  self->_sourceRejects = (NSMutableDictionary *)a3;
}

@end