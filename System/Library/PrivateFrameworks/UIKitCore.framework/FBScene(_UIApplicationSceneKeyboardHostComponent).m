@interface FBScene(_UIApplicationSceneKeyboardHostComponent)
- (uint64_t)_keyboardHostComponent;
@end

@implementation FBScene(_UIApplicationSceneKeyboardHostComponent)

- (uint64_t)_keyboardHostComponent
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [a1 componentForExtension:v2 ofClass:v3];
}

@end