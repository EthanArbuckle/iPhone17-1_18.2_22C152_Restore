@interface NRAnalyticsDirectToCloud
- (void)submit;
@end

@implementation NRAnalyticsDirectToCloud

- (void)submit
{
  if (self)
  {
    unint64_t directToCloudRequestStart = self->_directToCloudRequestStart;
    unint64_t directToCloudRequestEnd = self->_directToCloudRequestEnd;
    double v7 = 0.0;
    if (directToCloudRequestStart) {
      BOOL v8 = directToCloudRequestEnd > directToCloudRequestStart;
    }
    else {
      BOOL v8 = 0;
    }
    double v9 = 0.0;
    if (v8)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v2) = dword_1001F4BC0;
      LODWORD(v3) = *(_DWORD *)algn_1001F4BC4;
      double v3 = (double)*(unint64_t *)&v3;
      double v2 = 0.000000001 * (double)*(unint64_t *)&v2;
      double v9 = (double)(directToCloudRequestEnd - directToCloudRequestStart) * v2 / v3;
    }
    unint64_t iRATManagerQueryStart = self->_iRATManagerQueryStart;
    unint64_t iRATManagerQueryEnd = self->_iRATManagerQueryEnd;
    if (iRATManagerQueryStart) {
      BOOL v12 = iRATManagerQueryEnd > iRATManagerQueryStart;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v2) = dword_1001F4BC0;
      LODWORD(v3) = *(_DWORD *)algn_1001F4BC4;
      double v7 = (double)*(unint64_t *)&v2
         * 0.000001
         * (double)(iRATManagerQueryEnd - iRATManagerQueryStart)
         / (double)*(unint64_t *)&v3;
    }
  }
  else
  {
    double v9 = 0.0;
    double v7 = 0.0;
  }
  v13 = +[NSNumber numberWithDouble:round(v9 * 1000.0) * 0.001];
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0;
  }
  [(NSMutableDictionary *)eventDictionary setObject:v13 forKeyedSubscript:@"requestDurationInSec"];

  v15 = +[NSNumber numberWithDouble:round(v7) * 0.001];
  if (self) {
    v16 = self->super._eventDictionary;
  }
  else {
    v16 = 0;
  }
  [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:@"iRATQueryDurationInSec"];

  if (self) {
    double v17 = self->_timeSinceLastDirectToCloudRequest * 1000.0;
  }
  else {
    double v17 = 0.0;
  }
  v18 = +[NSNumber numberWithDouble:round(v17) * 0.001];
  if (!self)
  {
    CFStringRef v21 = @"timeSinceLastRequestInSec";
    v20 = 0;
    goto LABEL_29;
  }
  [(NSMutableDictionary *)self->super._eventDictionary setObject:v18 forKeyedSubscript:@"timeSinceLastRequestInSec"];

  if (self->_iRATManagerQueryIncomplete)
  {
    v19 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super._eventDictionary setObject:v19 forKeyedSubscript:@"iRATManagerQueryIncomplete"];
  }
  if (self->_fallbackAdvisoryIssued)
  {
    v18 = +[NSNumber numberWithBool:1];
    v20 = self->super._eventDictionary;
    CFStringRef v21 = @"fallbackAdvisoryIssued";
LABEL_29:
    [(NSMutableDictionary *)v20 setObject:v18 forKeyedSubscript:v21];
  }

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.directToCloud");
}

@end