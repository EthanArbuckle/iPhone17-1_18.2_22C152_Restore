@interface FormattedDate
@end

@implementation FormattedDate

uint64_t ___FormattedDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_FormattedDate___formatter;
  _FormattedDate___formatter = (uint64_t)v0;

  v2 = (void *)_FormattedDate___formatter;
  return [v2 setDateFormat:@"MMM dd-hh:mm"];
}

@end