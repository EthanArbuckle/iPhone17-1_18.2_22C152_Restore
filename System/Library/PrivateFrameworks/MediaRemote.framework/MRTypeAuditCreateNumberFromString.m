@interface MRTypeAuditCreateNumberFromString
@end

@implementation MRTypeAuditCreateNumberFromString

uint64_t ___MRTypeAuditCreateNumberFromString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MRTypeAuditCreateNumberFromString_numberFormatter;
  _MRTypeAuditCreateNumberFromString_numberFormatter = (uint64_t)v0;

  v2 = (void *)_MRTypeAuditCreateNumberFromString_numberFormatter;

  return [v2 setNumberStyle:0];
}

@end