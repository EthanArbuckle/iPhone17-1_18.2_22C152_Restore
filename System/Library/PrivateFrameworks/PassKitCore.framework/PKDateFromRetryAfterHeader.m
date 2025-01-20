@interface PKDateFromRetryAfterHeader
@end

@implementation PKDateFromRetryAfterHeader

void ___PKDateFromRetryAfterHeader_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_295;
  _MergedGlobals_295 = (uint64_t)v0;

  id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_MergedGlobals_295 setLocale:v4];
  [(id)_MergedGlobals_295 setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"];
  v2 = (void *)_MergedGlobals_295;
  v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];
}

@end