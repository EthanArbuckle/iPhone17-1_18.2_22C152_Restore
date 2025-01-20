@interface NTPBEvent
- (void)ft_setTemporalBoundsBySanitizingStartDate:(id)a3 endDate:(id)a4;
@end

@implementation NTPBEvent

- (void)ft_setTemporalBoundsBySanitizingStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  v8 = [v13 components:28 fromDate:v7];
  v9 = [v13 dateFromComponents:v8];
  [(NTPBEvent *)self nss_setStartDate:v9];
  [v6 timeIntervalSinceDate:v7];
  double v11 = v10;

  double v12 = round(v11);
  if (v12 > 21.0) {
    double v12 = 21.0;
  }
  [(NTPBEvent *)self setDuration:(uint64_t)v12];
}

@end