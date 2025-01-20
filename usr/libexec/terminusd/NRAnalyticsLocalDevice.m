@interface NRAnalyticsLocalDevice
- (void)submit;
@end

@implementation NRAnalyticsLocalDevice

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t deviceRegistrationStart = self->_deviceRegistrationStart;
    unint64_t deviceRegistrationEnd = self->_deviceRegistrationEnd;
    if (deviceRegistrationStart && deviceRegistrationEnd > deviceRegistrationStart)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v2) = dword_1001F4BC0;
      LODWORD(v3) = *(_DWORD *)algn_1001F4BC4;
      double v5 = (double)v2 * 0.000001 * (double)(deviceRegistrationEnd - deviceRegistrationStart) / (double)v3;
    }
  }
  v9 = +[NSNumber numberWithDouble:round(v5) * 0.001];
  if (!self)
  {
    CFStringRef v12 = @"deviceRegistrationTimeInSec";
    eventDictionary = 0;
    goto LABEL_15;
  }
  [(NSMutableDictionary *)self->super._eventDictionary setObject:v9 forKeyedSubscript:@"deviceRegistrationTimeInSec"];

  if (self->_deviceRegistrationSuccess)
  {
    v10 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super._eventDictionary setObject:v10 forKeyedSubscript:@"deviceRegistrationSuccess"];
  }
  if (self->_devicePairedWithOOBKey)
  {
    v9 = +[NSNumber numberWithBool:1];
    eventDictionary = self->super._eventDictionary;
    CFStringRef v12 = @"devicePairedWithOOBKey";
LABEL_15:
    [(NSMutableDictionary *)eventDictionary setObject:v9 forKeyedSubscript:v12];
  }

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.localDevice");
}

@end