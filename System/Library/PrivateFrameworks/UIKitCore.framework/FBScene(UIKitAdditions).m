@interface FBScene(UIKitAdditions)
- (void)_performUpdateWithoutActivation:()UIKitAdditions;
@end

@implementation FBScene(UIKitAdditions)

- (void)_performUpdateWithoutActivation:()UIKitAdditions
{
  id v4 = a3;
  if ([a1 isActive])
  {
    [a1 performUpdate:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__FBScene_UIKitAdditions___performUpdateWithoutActivation___block_invoke;
    v5[3] = &unk_1E5308C60;
    id v6 = v4;
    [a1 updateSettings:v5];
  }
}

@end