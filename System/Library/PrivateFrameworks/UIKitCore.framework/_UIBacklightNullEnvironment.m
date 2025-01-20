@interface _UIBacklightNullEnvironment
- (UIScene)_scene;
- (_UIBacklightNullEnvironment)initWithScene:(id)a3;
- (void)_setScene:(id)a3;
@end

@implementation _UIBacklightNullEnvironment

- (_UIBacklightNullEnvironment)initWithScene:(id)a3
{
  id v5 = a3;
  v6 = [v5 _FBSScene];

  if (v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BLSBacklightFBSSceneEnvironment+UIKit.m", 144, @"BLSNullEnvironment should only be used for scenes with nil fbsScene:%@", v5 object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIBacklightNullEnvironment;
  v7 = [(_UIBacklightNullEnvironment *)&v10 init];

  return v7;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end