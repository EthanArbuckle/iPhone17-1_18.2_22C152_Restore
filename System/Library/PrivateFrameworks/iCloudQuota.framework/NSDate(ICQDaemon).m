@interface NSDate(ICQDaemon)
- (id)icq_serverFriendlyString;
@end

@implementation NSDate(ICQDaemon)

- (id)icq_serverFriendlyString
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  [v3 setLocale:v2];
  v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];

  v5 = [v3 stringFromDate:a1];

  return v5;
}

@end