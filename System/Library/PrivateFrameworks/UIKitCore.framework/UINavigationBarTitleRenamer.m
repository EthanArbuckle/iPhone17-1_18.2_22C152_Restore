@interface UINavigationBarTitleRenamer
@end

@implementation UINavigationBarTitleRenamer

void __44___UINavigationBarTitleRenamer_renameServer__block_invoke(uint64_t a1)
{
  if ((_UIApplicationProcessIsOverlayUI() & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"_UINavigationBarTitleRenamer.m" lineNumber:36 description:@"A rename server is not available in this process."];
  }
  v2 = objc_alloc_init(_UINavigationBarTitleRenamer);
  v3 = (void *)_MergedGlobals_1196;
  _MergedGlobals_1196 = (uint64_t)v2;

  *(unsigned char *)(_MergedGlobals_1196 + 8) |= 1u;
}

uint64_t __54___UINavigationBarTitleRenamer_sessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 sessionIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end