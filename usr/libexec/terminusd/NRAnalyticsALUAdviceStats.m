@interface NRAnalyticsALUAdviceStats
- (void)submit;
@end

@implementation NRAnalyticsALUAdviceStats

- (void)submit
{
  if (self) {
    double v3 = self->_timeSinceLastAdvice * 1000.0;
  }
  else {
    double v3 = 0.0;
  }
  v4 = +[NSNumber numberWithDouble:round(v3) * 0.001];
  if (!self)
  {
    CFStringRef v8 = @"timeSinceLastAdvice";
    eventDictionary = 0;
    goto LABEL_8;
  }
  [(NSMutableDictionary *)self->super._eventDictionary setObject:v4 forKeyedSubscript:@"timeSinceLastAdvice"];

  double timeSinceLastNonDefaultAdvice = self->_timeSinceLastNonDefaultAdvice;
  if (timeSinceLastNonDefaultAdvice > 0.0)
  {
    v6 = +[NSNumber numberWithDouble:round(timeSinceLastNonDefaultAdvice * 1000.0) * 0.001];
    [(NSMutableDictionary *)self->super._eventDictionary setObject:v6 forKeyedSubscript:@"timeSinceLastNonDefaultAdvice"];
  }
  if (self->_receivedSameAdvice)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    eventDictionary = self->super._eventDictionary;
    CFStringRef v8 = @"receivedSameAdvice";
LABEL_8:
    [(NSMutableDictionary *)eventDictionary setObject:v4 forKeyedSubscript:v8];
  }

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.aluAdviceStats");
}

@end