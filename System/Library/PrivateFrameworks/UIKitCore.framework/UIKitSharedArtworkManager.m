@interface UIKitSharedArtworkManager
@end

@implementation UIKitSharedArtworkManager

uint64_t ____UIKitSharedArtworkManager_block_invoke()
{
  v0 = [_UIAssetManager alloc];
  uint64_t result = -[_UIAssetManager initWithName:inBundle:idiom:](v0, "initWithName:inBundle:idiom:", @"UIKit_Artwork", [MEMORY[0x1E4F28B50] bundleWithPath:_UIKitResourceBundlePath(@"Artwork.bundle")], -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom"));
  qword_1EB264B08 = result;
  *(unsigned char *)(result + 116) |= 4u;
  return result;
}

@end