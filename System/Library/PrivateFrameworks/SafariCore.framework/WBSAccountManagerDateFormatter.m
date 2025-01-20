@interface WBSAccountManagerDateFormatter
+ (NSDateFormatter)dateFormatterWithDynamicContext;
+ (NSDateFormatter)dateFormatterWithStandaloneContext;
@end

@implementation WBSAccountManagerDateFormatter

+ (NSDateFormatter)dateFormatterWithDynamicContext
{
  if (dateFormatterWithDynamicContext_onceToken != -1) {
    dispatch_once(&dateFormatterWithDynamicContext_onceToken, &__block_literal_global);
  }
  v2 = (void *)dateFormatterWithDynamicContext_dateFormatter;
  return (NSDateFormatter *)v2;
}

uint64_t __65__WBSAccountManagerDateFormatter_dateFormatterWithDynamicContext__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dateFormatterWithDynamicContext_dateFormatter;
  dateFormatterWithDynamicContext_dateFormatter = (uint64_t)v0;

  [(id)dateFormatterWithDynamicContext_dateFormatter setTimeStyle:0];
  [(id)dateFormatterWithDynamicContext_dateFormatter setDateStyle:1];
  [(id)dateFormatterWithDynamicContext_dateFormatter setDoesRelativeDateFormatting:1];
  v2 = (void *)dateFormatterWithDynamicContext_dateFormatter;
  return [v2 setFormattingContext:1];
}

+ (NSDateFormatter)dateFormatterWithStandaloneContext
{
  if (dateFormatterWithStandaloneContext_onceToken != -1) {
    dispatch_once(&dateFormatterWithStandaloneContext_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)dateFormatterWithStandaloneContext_dateFormatter;
  return (NSDateFormatter *)v2;
}

uint64_t __68__WBSAccountManagerDateFormatter_dateFormatterWithStandaloneContext__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dateFormatterWithStandaloneContext_dateFormatter;
  dateFormatterWithStandaloneContext_dateFormatter = (uint64_t)v0;

  [(id)dateFormatterWithStandaloneContext_dateFormatter setTimeStyle:0];
  [(id)dateFormatterWithStandaloneContext_dateFormatter setDateStyle:1];
  [(id)dateFormatterWithStandaloneContext_dateFormatter setDoesRelativeDateFormatting:1];
  v2 = (void *)dateFormatterWithStandaloneContext_dateFormatter;
  return [v2 setFormattingContext:2];
}

@end