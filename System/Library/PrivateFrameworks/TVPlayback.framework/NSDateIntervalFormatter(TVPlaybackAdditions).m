@interface NSDateIntervalFormatter(TVPlaybackAdditions)
- (id)tvp_hourMinuteDisplayStringFromStartDate:()TVPlaybackAdditions endDate:;
@end

@implementation NSDateIntervalFormatter(TVPlaybackAdditions)

- (id)tvp_hourMinuteDisplayStringFromStartDate:()TVPlaybackAdditions endDate:
{
  v6 = (void *)MEMORY[0x263EFF960];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 currentLocale];
  [a1 setLocale:v9];
  [a1 setDateStyle:0];
  [a1 setTimeStyle:1];
  v10 = [a1 stringFromDate:v8 toDate:v7];

  return v10;
}

@end