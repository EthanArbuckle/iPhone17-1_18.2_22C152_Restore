@interface NSFormatter(SMExtensions)
+ (id)dateFormatter;
+ (id)dateTimeFormatter;
+ (id)hourMinuteShortTimeIntervalFormatter;
+ (id)hourMinuteTimeIntervalFormatter;
+ (id)relativeDateFormatter;
+ (id)transcriptTimeIntervalFormatter;
@end

@implementation NSFormatter(SMExtensions)

+ (id)dateFormatter
{
  if (qword_26B349938 != -1) {
    dispatch_once(&qword_26B349938, &__block_literal_global_1);
  }
  v0 = (void *)_MergedGlobals_13;
  return v0;
}

+ (id)relativeDateFormatter
{
  if (qword_26B349948 != -1) {
    dispatch_once(&qword_26B349948, &__block_literal_global_3);
  }
  v0 = (void *)qword_26B349940;
  return v0;
}

+ (id)dateTimeFormatter
{
  if (qword_26B349958 != -1) {
    dispatch_once(&qword_26B349958, &__block_literal_global_6);
  }
  v0 = (void *)qword_26B349950;
  return v0;
}

+ (id)transcriptTimeIntervalFormatter
{
  if (qword_26B349968 != -1) {
    dispatch_once(&qword_26B349968, &__block_literal_global_8);
  }
  v0 = (void *)qword_26B349960;
  return v0;
}

+ (id)hourMinuteTimeIntervalFormatter
{
  if (qword_26B349978 != -1) {
    dispatch_once(&qword_26B349978, &__block_literal_global_12);
  }
  v0 = (void *)qword_26B349970;
  return v0;
}

+ (id)hourMinuteShortTimeIntervalFormatter
{
  if (qword_26B349988 != -1) {
    dispatch_once(&qword_26B349988, &__block_literal_global_14);
  }
  v0 = (void *)qword_26B349980;
  return v0;
}

@end