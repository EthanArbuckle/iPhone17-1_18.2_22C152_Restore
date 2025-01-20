@interface NRAnalyticsPreferWiFi
- (void)submit;
@end

@implementation NRAnalyticsPreferWiFi

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t preferWiFiRequestStart = self->_preferWiFiRequestStart;
    unint64_t preferWiFiRequestEnd = self->_preferWiFiRequestEnd;
    if (preferWiFiRequestStart && preferWiFiRequestEnd > preferWiFiRequestStart)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v2) = dword_1001F4BC0;
      LODWORD(v3) = *(_DWORD *)algn_1001F4BC4;
      double v5 = (double)v2 * 0.000001 * (double)(preferWiFiRequestEnd - preferWiFiRequestStart) / (double)v3;
    }
  }
  v9 = +[NSNumber numberWithDouble:round(v5) * 0.001];
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0;
  }
  [(NSMutableDictionary *)eventDictionary setObject:v9 forKeyedSubscript:@"requestDurationInSec"];

  if (self)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_preferWiFiRequestTimedOut];
    v12 = self->super._eventDictionary;
  }
  else
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:0];
    v12 = 0;
  }
  [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:@"requestTimedOut"];

  if (self)
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:self->_preferWiFiRequestSuccessful];
    v14 = self->super._eventDictionary;
  }
  else
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:0];
    v14 = 0;
  }
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:@"requestSuccessful"];

  if (self)
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:self->_linkTransitionsWhileRequestActive];
    v16 = self->super._eventDictionary;
  }
  else
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:0];
    v16 = 0;
  }
  [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:@"linkTransitionsWhileRequestActive"];

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.preferWiFi");
}

@end