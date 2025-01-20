@interface NSNumberFormatter
@end

@implementation NSNumberFormatter

uint64_t __63__NSNumberFormatter_MTUtilities__mtDecimalStyleNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)mtDecimalStyleNumberFormatter__decimalStyleumberFormatter;
  mtDecimalStyleNumberFormatter__decimalStyleumberFormatter = (uint64_t)v0;

  v2 = (void *)mtDecimalStyleNumberFormatter__decimalStyleumberFormatter;
  return [v2 setNumberStyle:1];
}

@end