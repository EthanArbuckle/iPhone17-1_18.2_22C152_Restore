@interface NSDateFormatter
@end

@implementation NSDateFormatter

uint64_t __51__NSDateFormatter_MTUtilities__mtTimeOnlyFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)mtTimeOnlyFormatter__timeOnlyFormatter;
  mtTimeOnlyFormatter__timeOnlyFormatter = (uint64_t)v0;

  v2 = (void *)mtTimeOnlyFormatter__timeOnlyFormatter;
  return [v2 setLocalizedDateFormatFromTemplate:@"Jmm"];
}

@end