@interface NRAnalyticsBluetoothAssertion
- (void)submit;
@end

@implementation NRAnalyticsBluetoothAssertion

- (void)submit
{
  if (self) {
    double v3 = self->_durationInSec * 1000.0;
  }
  else {
    double v3 = 0.0;
  }
  v4 = +[NSNumber numberWithDouble:round(v3) * 0.001];
  if (self)
  {
    [(NSMutableDictionary *)self->super._eventDictionary setObject:v4 forKeyedSubscript:@"durationInSec"];

    if (!self->_multipleAssertions) {
      goto LABEL_7;
    }
    v4 = +[NSNumber numberWithBool:1];
    eventDictionary = self->super._eventDictionary;
    CFStringRef v6 = @"multipleAssertions";
  }
  else
  {
    CFStringRef v6 = @"durationInSec";
    eventDictionary = 0;
  }
  [(NSMutableDictionary *)eventDictionary setObject:v4 forKeyedSubscript:v6];

LABEL_7:

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.bluetoothAssertion");
}

@end