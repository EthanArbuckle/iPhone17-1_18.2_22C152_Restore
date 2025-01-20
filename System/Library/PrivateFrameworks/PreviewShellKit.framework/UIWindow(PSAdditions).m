@interface UIWindow(PSAdditions)
- (uint64_t)uv_createSnapshotImageFromIOSurface;
@end

@implementation UIWindow(PSAdditions)

- (uint64_t)uv_createSnapshotImageFromIOSurface
{
  uint64_t result = [a1 createIOSurface];
  if (result)
  {
    return MEMORY[0x270F82CD8]();
  }
  return result;
}

@end