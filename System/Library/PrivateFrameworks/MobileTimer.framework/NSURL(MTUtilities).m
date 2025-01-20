@interface NSURL(MTUtilities)
+ (__CFString)schemeForSection:()MTUtilities;
+ (id)mtURLForClockAppSection:()MTUtilities timerManager:;
+ (id)mtURLForScheme:()MTUtilities;
+ (id)mtURLForSection:()MTUtilities;
+ (uint64_t)mtURLForClockAppSection:()MTUtilities;
- (id)mtID;
- (uint64_t)mtClockAppSection;
- (uint64_t)mtIsForLastTimer;
- (uint64_t)mtIsList;
@end

@implementation NSURL(MTUtilities)

+ (uint64_t)mtURLForClockAppSection:()MTUtilities
{
  return [a1 mtURLForClockAppSection:a3 timerManager:0];
}

+ (id)mtURLForClockAppSection:()MTUtilities timerManager:
{
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = v7;
  switch(a3)
  {
    case 1:
      v9 = @"clock-alarm";
      goto LABEL_6;
    case 2:
      v9 = @"clock-sleep-alarm";
      goto LABEL_6;
    case 3:
      v9 = @"clock-stopwatch";
      goto LABEL_6;
    case 4:
      v12 = [v6 currentTimer];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke;
      v15[3] = &unk_1E59160A0;
      id v16 = v8;
      id v13 = (id)[v12 addSuccessBlock:v15];

      goto LABEL_7;
    default:
      v9 = @"clock-worldclock";
LABEL_6:
      [v7 finishWithResult:v9];
LABEL_7:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke_2;
      v14[3] = &__block_descriptor_40_e28___NAFuture_16__0__NSString_8l;
      v14[4] = a1;
      v10 = [v8 flatMap:v14];

      return v10;
  }
}

+ (id)mtURLForScheme:()MTUtilities
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [NSString stringWithFormat:@"%@:%@", a3, @"default"];
  v5 = [v3 URLWithString:v4];

  return v5;
}

+ (id)mtURLForSection:()MTUtilities
{
  v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = NSString;
  v3 = objc_msgSend(a1, "schemeForSection:");
  v4 = [v2 stringWithFormat:@"%@:%@", v3, @"default"];
  v5 = [v1 URLWithString:v4];

  return v5;
}

+ (__CFString)schemeForSection:()MTUtilities
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"clock-worldclock";
  }
  else {
    return off_1E5916E68[a3 - 1];
  }
}

- (uint64_t)mtClockAppSection
{
  v1 = [a1 scheme];
  if ([v1 isEqualToString:@"clock-worldclock"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"clock-alarm"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"clock-sleep-alarm"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"clock-stopwatch"])
  {
    uint64_t v2 = 3;
  }
  else if (([v1 isEqualToString:@"clock-timer"] & 1) != 0 {
         || [v1 isEqualToString:@"clock-timer-running"])
  }
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = -1;
  }

  return v2;
}

- (uint64_t)mtIsList
{
  v1 = [a1 host];
  uint64_t v2 = [v1 isEqualToString:@"list"];

  return v2;
}

- (uint64_t)mtIsForLastTimer
{
  uint64_t v2 = [a1 scheme];
  if ([v2 isEqualToString:@"clock-timer"])
  {
    v3 = [a1 host];
    uint64_t v4 = [v3 isEqualToString:@"lastTimer"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)mtID
{
  uint64_t v2 = [a1 path];
  unint64_t v3 = [v2 length];

  if (v3 >= 2)
  {
    v5 = [a1 path];
    uint64_t v4 = [v5 substringFromIndex:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

@end