@interface _UIWindowSceneBackgroundPlacement
+ (unint64_t)_placementType;
- (BOOL)_requestBackground;
- (_UIWindowSceneBackgroundPlacement)init;
- (id)_createConfigurationWithError:(id *)a3;
@end

@implementation _UIWindowSceneBackgroundPlacement

+ (unint64_t)_placementType
{
  return 5;
}

- (_UIWindowSceneBackgroundPlacement)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneBackgroundPlacement;
  return (_UIWindowSceneBackgroundPlacement *)[(UIWindowScenePlacement *)&v3 _init];
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB3428]);
  return v3;
}

- (BOOL)_requestBackground
{
  return 1;
}

@end