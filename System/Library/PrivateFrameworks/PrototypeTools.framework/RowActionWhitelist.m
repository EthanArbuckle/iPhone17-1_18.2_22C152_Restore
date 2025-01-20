@interface RowActionWhitelist
@end

@implementation RowActionWhitelist

void ___RowActionWhitelist_block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)_RowActionWhitelist_whitelist;
  _RowActionWhitelist_whitelist = v0;
}

@end