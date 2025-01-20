@interface UISceneOcclusionHostComponent
@end

@implementation UISceneOcclusionHostComponent

uint64_t __63___UISceneOcclusionHostComponent_setApplicationOcclusionRects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setApplicationOcclusionRects:*(void *)(a1 + 32)];
}

uint64_t __58___UISceneOcclusionHostComponent_setSystemOcclusionRects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSystemOcclusionRects:*(void *)(a1 + 32)];
}

@end