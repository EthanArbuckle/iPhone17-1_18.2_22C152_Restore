@interface NSURL
@end

@implementation NSURL

uint64_t __57__NSURL_LPPrivate___lp_URLByDeletingCommonIndexPageNames__block_invoke()
{
  -[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::commonIndexPageNames = [MEMORY[0x263EFFA08] setWithArray:&unk_26C3C73B0];
  return MEMORY[0x270F9A758]();
}

@end