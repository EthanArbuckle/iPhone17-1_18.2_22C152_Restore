@interface UIView
@end

@implementation UIView

uint64_t __75__UIView_WGCAPackageViewAdditions___wg_innerWalkSubviewTreeWithBlock_stop___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a2, "_wg_innerWalkSubviewTreeWithBlock:stop:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  *a4 = **(unsigned char **)(a1 + 40);
  return result;
}

@end