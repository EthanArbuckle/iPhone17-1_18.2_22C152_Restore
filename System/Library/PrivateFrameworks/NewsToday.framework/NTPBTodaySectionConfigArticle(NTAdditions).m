@interface NTPBTodaySectionConfigArticle(NTAdditions)
- (id)displayDate;
@end

@implementation NTPBTodaySectionConfigArticle(NTAdditions)

- (id)displayDate
{
  v1 = [a1 displayDateString];
  if (v1)
  {
    v2 = objc_msgSend(MEMORY[0x263EFF910], "fc_dateFromStringWithISO8601Format:", v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end