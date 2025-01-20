@interface RowWhitelist
@end

@implementation RowWhitelist

void ___RowWhitelist_block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)_RowWhitelist_whitelist;
  _RowWhitelist_whitelist = v0;
}

@end