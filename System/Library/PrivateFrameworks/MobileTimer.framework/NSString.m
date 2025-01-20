@interface NSString
@end

@implementation NSString

uint64_t __62__NSString_Notification__mtStringByAppendingNotificationDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  mtStringByAppendingNotificationDate____dateFormatter = (uint64_t)v0;

  v2 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  v4 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];

  v6 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  return [v6 setDateFormat:@"yyyy-MM-dd-HH-mm"];
}

@end