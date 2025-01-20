@interface UIAXStringForAllChildren
@end

@implementation UIAXStringForAllChildren

uint64_t ___UIAXStringForAllChildren_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3 && (([v3 isAccessibilityElement] & 1) != 0 || *(unsigned char *)(a1 + 48))) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return 0;
}

@end