@interface TimeFormatterWithDate
@end

@implementation TimeFormatterWithDate

uint64_t ___TimeFormatterWithDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F19AD0]);
  v1 = (void *)_TimeFormatterWithDate___formatter;
  _TimeFormatterWithDate___formatter = (uint64_t)v0;

  [(id)_TimeFormatterWithDate___formatter setSuppressesDesignatorWhitespace:1];
  v2 = (void *)_TimeFormatterWithDate___formatter;
  return [v2 setPaused:1 forReason:@"AlwaysPaused"];
}

@end