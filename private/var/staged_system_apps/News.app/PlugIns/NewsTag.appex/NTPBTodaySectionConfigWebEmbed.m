@interface NTPBTodaySectionConfigWebEmbed
- (BOOL)conformsToProtocol:(id)a3;
@end

@implementation NTPBTodaySectionConfigWebEmbed

- (BOOL)conformsToProtocol:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  v4 = (__objc2_prot *)a3;
  v5 = self;
  if ([(NTPBTodaySectionConfigWebEmbed *)&v7 conformsToProtocol:v4])
  {

    return 1;
  }
  else
  {

    return &OBJC_PROTOCOL___NTTodayItem == v4;
  }
}

@end