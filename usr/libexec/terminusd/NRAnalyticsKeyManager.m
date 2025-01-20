@interface NRAnalyticsKeyManager
- (void)submit;
@end

@implementation NRAnalyticsKeyManager

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t queryKeysStart = self->_queryKeysStart;
    unint64_t queryKeysEnd = self->_queryKeysEnd;
    if (queryKeysStart && queryKeysEnd > queryKeysStart)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v2) = dword_1001F4BC0;
      LODWORD(v3) = *(_DWORD *)algn_1001F4BC4;
      double v5 = (double)v2 * 0.000001 * (double)(queryKeysEnd - queryKeysStart) / (double)v3;
    }
  }
  v9 = +[NSNumber numberWithDouble:round(v5) * 0.001];
  if (self)
  {
    [(NSMutableDictionary *)self->super._eventDictionary setObject:v9 forKeyedSubscript:@"queryKeysDurationInSec"];

    if (!self->_queryKeysSuccess) {
      goto LABEL_14;
    }
    v9 = +[NSNumber numberWithBool:1];
    eventDictionary = self->super._eventDictionary;
    CFStringRef v11 = @"queryKeysSuccess";
  }
  else
  {
    CFStringRef v11 = @"queryKeysDurationInSec";
    eventDictionary = 0;
  }
  [(NSMutableDictionary *)eventDictionary setObject:v9 forKeyedSubscript:v11];

LABEL_14:

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.keyManager");
}

@end