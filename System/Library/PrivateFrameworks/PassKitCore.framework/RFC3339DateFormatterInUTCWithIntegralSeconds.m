@interface RFC3339DateFormatterInUTCWithIntegralSeconds
@end

@implementation RFC3339DateFormatterInUTCWithIntegralSeconds

void ___RFC3339DateFormatterInUTCWithIntegralSeconds_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB402980;
  qword_1EB402980 = (uint64_t)v0;

  v2 = (void *)qword_1EB402980;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)qword_1EB402980 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v4 = (void *)qword_1EB402980;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

@end