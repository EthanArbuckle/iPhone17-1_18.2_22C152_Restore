@interface UIRenderingBufferCreateBlock
@end

@implementation UIRenderingBufferCreateBlock

__IOSurface *_UIRenderingBufferCreateBlock_block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  return _UIRenderingBufferCreate(a4, a1, a2);
}

@end