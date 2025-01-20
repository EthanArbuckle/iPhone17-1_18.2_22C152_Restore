@interface UIAccessibilitySetFocusedElement
@end

@implementation UIAccessibilitySetFocusedElement

uint64_t ___UIAccessibilitySetFocusedElement_block_invoke()
{
  __UIAccessibilityFocusedElements = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

@end