@interface UserInterfaceTraitFromPath
@end

@implementation UserInterfaceTraitFromPath

void ___UserInterfaceTraitFromPath_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "setUserInterfaceIdiom:");
    id v3 = v4;
  }
  [v3 setDisplayScale:(double)*(unint64_t *)(a1 + 40)];
}

@end