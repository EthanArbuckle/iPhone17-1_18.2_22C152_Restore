@interface UIKitGetApplicationAssetManager
@end

@implementation UIKitGetApplicationAssetManager

void ___UIKitGetApplicationAssetManager_block_invoke()
{
  v0 = [_UIAssetManager alloc];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = +[UIDevice currentDevice];
  uint64_t v2 = -[_UIAssetManager initWithName:inBundle:idiom:](v0, "initWithName:inBundle:idiom:", @"Assets", v4, [v1 userInterfaceIdiom]);
  v3 = (void *)qword_1EB25B128;
  qword_1EB25B128 = v2;
}

@end