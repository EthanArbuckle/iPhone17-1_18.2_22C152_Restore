@interface NSDateFormatter
@end

@implementation NSDateFormatter

void __79__NSDateFormatter_TVPlaybackAdditions__tvp_ISO8601CombinedDateAndTimeFormatter__block_invoke()
{
  v0 = objc_opt_new();
  [v0 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v1 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v0 setTimeZone:v1];

  v2 = (void *)tvp_ISO8601CombinedDateAndTimeFormatter_iso8601Formatter;
  tvp_ISO8601CombinedDateAndTimeFormatter_iso8601Formatter = (uint64_t)v0;
}

void __64__NSDateFormatter_TVPlaybackAdditions__tvp_RFC1123DateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  tvp_RFC1123DateFormatter_rfc1123Formatter = (uint64_t)v0;

  [(id)tvp_RFC1123DateFormatter_rfc1123Formatter setFormatterBehavior:1040];
  [(id)tvp_RFC1123DateFormatter_rfc1123Formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
  v2 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  v4 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  id v5 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v5];
}

void __63__NSDateFormatter_TVPlaybackAdditions__tvp_RFC850DateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  tvp_RFC850DateFormatter_rfc850Formatter = (uint64_t)v0;

  [(id)tvp_RFC850DateFormatter_rfc850Formatter setFormatterBehavior:1040];
  [(id)tvp_RFC850DateFormatter_rfc850Formatter setDateFormat:@"EEEE, dd-MMM-yyyy HH:mm:ss zzz"];
  v2 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  v4 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  id v5 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v5];
}

void __64__NSDateFormatter_TVPlaybackAdditions__tvp_asctimeDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  tvp_asctimeDateFormatter_asctimeFormatter = (uint64_t)v0;

  [(id)tvp_asctimeDateFormatter_asctimeFormatter setFormatterBehavior:1040];
  [(id)tvp_asctimeDateFormatter_asctimeFormatter setDateFormat:@"EEE MMM dd HH:mm:ss yyyy"];
  v2 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  v4 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  id v5 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v5];
}

@end