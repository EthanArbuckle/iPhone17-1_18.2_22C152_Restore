@interface NTPBTodayPersonalizationUpdate(FCTodayExtension)
- (void)addEvent:()FCTodayExtension;
@end

@implementation NTPBTodayPersonalizationUpdate(FCTodayExtension)

- (void)addEvent:()FCTodayExtension
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v7 = v5;

  if (v7)
  {
    v6 = [a1 events];
    [v6 addObject:v7];
  }
}

@end