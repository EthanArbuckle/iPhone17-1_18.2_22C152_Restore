@interface NSDate(VideosUI)
+ (BOOL)shouldShowLabelForDownloadExpirationDate:()VideosUI;
+ (id)vui_startOfDateInGMT:()VideosUI;
- (BOOL)vui_isInTheFuture;
- (BOOL)vui_isInThePast;
@end

@implementation NSDate(VideosUI)

+ (BOOL)shouldShowLabelForDownloadExpirationDate:()VideosUI
{
  if (!a3) {
    return 0;
  }
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v5 components:32 fromDate:v6 toDate:v4 options:0];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v7, "hour"));
  LODWORD(v9) = 1111490560;
  v10 = [MEMORY[0x1E4F28ED0] numberWithFloat:v9];
  LODWORD(v4) = [v8 intValue];
  BOOL v11 = (int)v4 <= (int)[v10 intValue];

  return v11;
}

+ (id)vui_startOfDateInGMT:()VideosUI
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:@"GMT"];
  v5 = v3;
  if (v4)
  {
    v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [v6 setTimeZone:v4];
    v5 = [v6 startOfDayForDate:v3];
  }
  return v5;
}

- (BOOL)vui_isInThePast
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [a1 earlierDate:v2];
  BOOL v4 = v3 == a1;

  return v4;
}

- (BOOL)vui_isInTheFuture
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [a1 laterDate:v2];
  BOOL v4 = v3 == a1;

  return v4;
}

@end