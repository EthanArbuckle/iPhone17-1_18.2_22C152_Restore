@interface NSDateFormatter(TVPlaybackAdditions)
+ (id)tvp_ISO8601CombinedDateAndTimeFormatter;
+ (id)tvp_RFC1123DateFormatter;
+ (id)tvp_RFC850DateFormatter;
+ (id)tvp_asctimeDateFormatter;
@end

@implementation NSDateFormatter(TVPlaybackAdditions)

+ (id)tvp_ISO8601CombinedDateAndTimeFormatter
{
  if (tvp_ISO8601CombinedDateAndTimeFormatter_onceToken != -1) {
    dispatch_once(&tvp_ISO8601CombinedDateAndTimeFormatter_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)tvp_ISO8601CombinedDateAndTimeFormatter_iso8601Formatter;
  return v0;
}

+ (id)tvp_RFC1123DateFormatter
{
  if (tvp_RFC1123DateFormatter_pred != -1) {
    dispatch_once(&tvp_RFC1123DateFormatter_pred, &__block_literal_global_21);
  }
  v0 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  return v0;
}

+ (id)tvp_RFC850DateFormatter
{
  if (tvp_RFC850DateFormatter_pred != -1) {
    dispatch_once(&tvp_RFC850DateFormatter_pred, &__block_literal_global_26);
  }
  v0 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  return v0;
}

+ (id)tvp_asctimeDateFormatter
{
  if (tvp_asctimeDateFormatter_pred != -1) {
    dispatch_once(&tvp_asctimeDateFormatter_pred, &__block_literal_global_31);
  }
  v0 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  return v0;
}

@end