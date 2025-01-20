@interface NRAnalyticsPhoneCallRelay
- (void)submit;
@end

@implementation NRAnalyticsPhoneCallRelay

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t phoneCallRelayStart = self->_phoneCallRelayStart;
    unint64_t phoneCallRelayEnd = self->_phoneCallRelayEnd;
    if (phoneCallRelayStart && phoneCallRelayEnd > phoneCallRelayStart)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v2) = dword_1001F4BC0;
      LODWORD(v3) = *(_DWORD *)algn_1001F4BC4;
      double v5 = (double)v2 * 0.000001 * (double)(phoneCallRelayEnd - phoneCallRelayStart) / (double)v3;
    }
  }
  v9 = +[NSNumber numberWithDouble:round(v5) * 0.001];
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0;
  }
  [(NSMutableDictionary *)eventDictionary setObject:v9 forKeyedSubscript:@"phoneCallRelayDurationInSec"];

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.phoneCallRelay");
}

@end