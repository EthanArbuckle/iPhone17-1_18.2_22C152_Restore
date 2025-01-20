@interface _UIWindowSceneFullscreenPlacement
+ (unint64_t)_placementType;
- (BOOL)_requestFullscreen;
- (_UIWindowSceneFullscreenPlacement)init;
- (id)_createConfigurationWithError:(id *)a3;
@end

@implementation _UIWindowSceneFullscreenPlacement

+ (unint64_t)_placementType
{
  return 4;
}

- (_UIWindowSceneFullscreenPlacement)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneFullscreenPlacement;
  return (_UIWindowSceneFullscreenPlacement *)[(UIWindowScenePlacement *)&v3 _init];
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB3430]);
  return v3;
}

- (BOOL)_requestFullscreen
{
  return 1;
}

@end