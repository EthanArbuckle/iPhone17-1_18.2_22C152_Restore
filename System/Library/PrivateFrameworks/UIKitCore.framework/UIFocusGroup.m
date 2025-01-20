@interface UIFocusGroup
@end

@implementation UIFocusGroup

uint64_t __46___UIFocusGroup__validateItemOrderIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _UIFocusItemCompare(a2, a3);
}

uint64_t __52___UIFocusGroup__validateChildGroupOrderIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _UIFocusGroupCompare(a2, a3);
}

@end