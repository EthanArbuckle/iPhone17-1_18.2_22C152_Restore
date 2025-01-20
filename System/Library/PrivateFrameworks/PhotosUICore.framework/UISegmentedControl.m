@interface UISegmentedControl
@end

@implementation UISegmentedControl

uint64_t __62__UISegmentedControl_PhotosUICore__px_setMinimumSegmentWidth___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4FB1C10], "px_swizzleMethod:withMethod:", sel_sizeThatFits_, sel__pxswizzled_sizeThatFits_);
}

@end