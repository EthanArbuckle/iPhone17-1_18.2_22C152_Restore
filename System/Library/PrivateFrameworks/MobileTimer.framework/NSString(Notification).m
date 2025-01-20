@interface NSString(Notification)
- (id)mtStringByAppendingNotificationDate:()Notification;
- (id)mtStringByRemovingNotificationDate;
- (id)mtStringByRemovingNotificationPrefixes;
@end

@implementation NSString(Notification)

- (id)mtStringByRemovingNotificationPrefixes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = +[MTUserNotificationCenter notificationPrefixes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      v7 = v1;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v1 = [v7 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v10 + 1) + 8 * v6) withString:&stru_1EEDE16C8];

        ++v6;
        v7 = v1;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  v8 = [v1 mtStringByRemovingNotificationDate];

  return v8;
}

- (id)mtStringByRemovingNotificationDate
{
  id v1 = [a1 componentsSeparatedByString:@"_"];
  v2 = [v1 firstObject];

  return v2;
}

- (id)mtStringByAppendingNotificationDate:()Notification
{
  uint64_t v4 = mtStringByAppendingNotificationDate__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mtStringByAppendingNotificationDate__onceToken, &__block_literal_global_35);
  }
  uint64_t v6 = [(id)mtStringByAppendingNotificationDate____dateFormatter stringFromDate:v5];

  v7 = [a1 stringByAppendingFormat:@"%@%@", @"_", v6];

  return v7;
}

@end