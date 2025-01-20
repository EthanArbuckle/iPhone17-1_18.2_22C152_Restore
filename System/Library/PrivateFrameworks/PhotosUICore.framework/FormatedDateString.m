@interface FormatedDateString
@end

@implementation FormatedDateString

uint64_t ___FormatedDateString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_FormatedDateString_dateFormatter;
  _FormatedDateString_dateFormatter = (uint64_t)v0;

  [(id)_FormatedDateString_dateFormatter setDateStyle:2];
  v2 = (void *)_FormatedDateString_dateFormatter;
  return [v2 setTimeStyle:0];
}

@end