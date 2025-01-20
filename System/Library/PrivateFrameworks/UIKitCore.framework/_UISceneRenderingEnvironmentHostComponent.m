@interface _UISceneRenderingEnvironmentHostComponent
- (BOOL)isCapturingContentForAdditionalRenderingDestination;
- (NSString)systemDisplayIdentifier;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)setIsCapturingContentForAdditionalRenderingDestination:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSystemDisplayIdentifier:(id)a3;
@end

@implementation _UISceneRenderingEnvironmentHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v9 = a4;
  v5 = [v9 settingsDiff];
  int v6 = [v5 containsProperty:sel_isCapturingContentForAdditionalRenderingDestination];

  if (v6)
  {
    v7 = [v9 settings];
    uint64_t v8 = [v7 isCapturingContentForAdditionalRenderingDestination];

    [(_UISceneRenderingEnvironmentHostComponent *)self setIsCapturingContentForAdditionalRenderingDestination:v8];
  }
}

- (void)setScene:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISceneRenderingEnvironmentHostComponent;
  [(FBSSceneComponent *)&v4 setScene:a3];
  [(_UISceneRenderingEnvironmentHostComponent *)self setIsCapturingContentForAdditionalRenderingDestination:0];
  [(_UISceneRenderingEnvironmentHostComponent *)self setSystemDisplayIdentifier:0];
}

- (void)setSystemDisplayIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(FBSSceneComponent *)self hostScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72___UISceneRenderingEnvironmentHostComponent_setSystemDisplayIdentifier___block_invoke;
  v7[3] = &unk_1E53056C0;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSettings:v7];
}

- (void)setIsCapturingContentForAdditionalRenderingDestination:(BOOL)a3
{
  id v4 = [(FBSSceneComponent *)self hostScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100___UISceneRenderingEnvironmentHostComponent_setIsCapturingContentForAdditionalRenderingDestination___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v6 = a3;
  [v4 updateSettings:v5];
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  v2 = [(FBSSceneComponent *)self scene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "modern_isCapturingContentForAdditionalRenderingDestination");

  return v4;
}

- (NSString)systemDisplayIdentifier
{
  v2 = [(FBSSceneComponent *)self scene];
  v3 = [v2 settings];
  char v4 = [v3 systemDisplayIdentifier];

  return (NSString *)v4;
}

@end