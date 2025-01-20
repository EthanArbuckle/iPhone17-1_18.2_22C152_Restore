@interface NRAnalyticsLinkRecommendation
- (void)submit;
@end

@implementation NRAnalyticsLinkRecommendation

- (void)submit
{
  if (self)
  {
    unint64_t btNotRecommendedStart = self->_btNotRecommendedStart;
    unint64_t btNotRecommendedEnd = self->_btNotRecommendedEnd;
    double v7 = 0.0;
    if (btNotRecommendedStart) {
      BOOL v8 = btNotRecommendedEnd > btNotRecommendedStart;
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
      double v9 = (double)(btNotRecommendedEnd - btNotRecommendedStart) * v2 / v3;
    }
    unint64_t cmpWiFiNotRecommendedStart = self->_cmpWiFiNotRecommendedStart;
    unint64_t cmpWiFiNotRecommendedEnd = self->_cmpWiFiNotRecommendedEnd;
    if (cmpWiFiNotRecommendedStart) {
      BOOL v12 = cmpWiFiNotRecommendedEnd > cmpWiFiNotRecommendedStart;
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
      double v7 = (double)(cmpWiFiNotRecommendedEnd - cmpWiFiNotRecommendedStart)
         * (0.000000001
          * (double)*(unint64_t *)&v2)
         / (double)*(unint64_t *)&v3;
    }
    if (v9 > 0.0)
    {
      v13 = +[NSNumber numberWithDouble:round(v9 * 1000.0) * 0.001];
      [(NSMutableDictionary *)self->super._eventDictionary setObject:v13 forKeyedSubscript:@"btNotRecommendedDurationInSec"];
    }
    if (v7 > 0.0)
    {
      v14 = +[NSNumber numberWithDouble:round(v7 * 1000.0) * 0.001];
      [(NSMutableDictionary *)self->super._eventDictionary setObject:v14 forKeyedSubscript:@"cmpWiFiNotRecommendedDurationInSec"];
    }
  }

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.linkRecommendation");
}

@end