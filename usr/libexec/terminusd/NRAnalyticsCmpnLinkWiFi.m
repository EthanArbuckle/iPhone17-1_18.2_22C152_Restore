@interface NRAnalyticsCmpnLinkWiFi
- (void)submit;
@end

@implementation NRAnalyticsCmpnLinkWiFi

- (void)submit
{
  sub_10012D3F4((uint64_t)self, v2, v3, v4);
  double v8 = 0.0;
  if (self)
  {
    unint64_t symptomsNOIRegistrationStart = self->_symptomsNOIRegistrationStart;
    unint64_t symptomsNOIRegistrationEnd = self->_symptomsNOIRegistrationEnd;
    if (symptomsNOIRegistrationStart && symptomsNOIRegistrationEnd > symptomsNOIRegistrationStart)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v6) = dword_1001F4BC0;
      LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
      double v8 = (double)v6 * 0.000001 * (double)(symptomsNOIRegistrationEnd - symptomsNOIRegistrationStart) / (double)v7;
    }
  }
  v12 = +[NSNumber numberWithDouble:round(v8) * 0.001];
  if (!self)
  {
    CFStringRef v16 = @"symptomsNOIRegistrationTimeInSec";
    eventDictionary = 0;
    goto LABEL_17;
  }
  [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v12 forKeyedSubscript:@"symptomsNOIRegistrationTimeInSec"];

  if (self->_symptomsAdvisoryFalsePositivesCounter)
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v13 forKeyedSubscript:@"symptomsAdvisoryFalsePositivesCounter"];
  }
  if (self->_virtualInterfaceRetryCounter)
  {
    v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v14 forKeyedSubscript:@"virtualInterfaceRetryCounter"];
  }
  if (self->_symptomsNOIRegistrationCounter)
  {
    v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    eventDictionary = self->super.super._eventDictionary;
    CFStringRef v16 = @"symptomsNOIRegistrationCounter";
LABEL_17:
    [(NSMutableDictionary *)eventDictionary setObject:v12 forKeyedSubscript:v16];
  }

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.cmpnLinkWiFi");
}

@end