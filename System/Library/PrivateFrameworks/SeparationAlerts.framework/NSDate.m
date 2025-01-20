@interface NSDate
@end

@implementation NSDate

uint64_t __37__NSDate_TADateFormat__getDateString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)gTADateFormatDateFormatter;
  gTADateFormatDateFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)gTADateFormatDateFormatter setTimeZone:v2];

  v3 = (void *)gTADateFormatDateFormatter;
  return [v3 setFormatOptions:1907];
}

@end