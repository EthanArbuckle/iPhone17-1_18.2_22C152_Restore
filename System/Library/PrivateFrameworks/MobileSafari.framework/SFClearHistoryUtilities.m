@interface SFClearHistoryUtilities
+ (id)clearHistoryTimeFrameStringFromItemType:(int64_t)a3;
+ (int64_t)clearHistoryTimeFrameItemTypeFromString:(id)a3;
@end

@implementation SFClearHistoryUtilities

+ (id)clearHistoryTimeFrameStringFromItemType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E54EC920[a3];
  }
}

+ (int64_t)clearHistoryTimeFrameItemTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LastHour"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Today"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"TodayAndYesterday"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end