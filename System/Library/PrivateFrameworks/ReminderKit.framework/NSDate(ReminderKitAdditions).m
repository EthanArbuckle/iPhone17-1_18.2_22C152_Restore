@interface NSDate(ReminderKitAdditions)
+ (id)debug_rem_nowOverride;
+ (id)rem_now;
+ (void)setDebug_rem_nowOverride:()ReminderKitAdditions;
@end

@implementation NSDate(ReminderKitAdditions)

+ (void)setDebug_rem_nowOverride:()ReminderKitAdditions
{
}

+ (id)debug_rem_nowOverride
{
  return (id)__sNowOverride;
}

+ (id)rem_now
{
  if (__sNowOverride)
  {
    id v0 = (id)__sNowOverride;
  }
  else
  {
    id v0 = [MEMORY[0x1E4F1C9C8] now];
  }

  return v0;
}

@end