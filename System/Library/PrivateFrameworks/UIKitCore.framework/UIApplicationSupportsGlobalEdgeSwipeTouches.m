@interface UIApplicationSupportsGlobalEdgeSwipeTouches
@end

@implementation UIApplicationSupportsGlobalEdgeSwipeTouches

void ___UIApplicationSupportsGlobalEdgeSwipeTouches_block_invoke()
{
  uint64_t v0 = _UIMainBundleIdentifier();
  v1 = (void *)v0;
  if (v0)
  {
    v2 = (void *)v0;
    LOBYTE(v0) = [&unk_1ED3F0DA8 containsObject:v0];
    v1 = v2;
  }
  byte_1EB25B4E0 = v0;
}

@end