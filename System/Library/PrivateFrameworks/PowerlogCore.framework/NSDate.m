@interface NSDate
@end

@implementation NSDate

void __41__NSDate_Monotonic__defaultDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)defaultDateFormatter_f;
  defaultDateFormatter_f = (uint64_t)v0;

  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)defaultDateFormatter_f setDateFormat:@"yyyy-MM-dd"];
  v2 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [(id)defaultDateFormatter_f setTimeZone:v2];

  v3 = [v4 objectForKey:*MEMORY[0x1E4F1C3E0]];
  [(id)defaultDateFormatter_f setCalendar:v3];

  [(id)defaultDateFormatter_f setLocale:v4];
}

@end