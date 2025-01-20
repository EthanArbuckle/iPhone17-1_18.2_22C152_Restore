@interface _UIWindowSceneOverlayPlacement
+ (id)placementOverlayingWindowScene:(id)a3;
+ (unint64_t)_placementType;
- (BOOL)isEqual:(id)a3;
- (FBSSceneIdentityToken)targetSceneIdentity;
- (_UIWindowSceneOverlayPlacement)initWithTargetSceneIdentity:(id)a3;
- (id)_createConfigurationWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setTargetSceneIdentity:(id)a3;
@end

@implementation _UIWindowSceneOverlayPlacement

+ (unint64_t)_placementType
{
  return 6;
}

- (_UIWindowSceneOverlayPlacement)initWithTargetSceneIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOverlayPlacement;
  v6 = [(UIWindowScenePlacement *)&v9 _init];
  v7 = (_UIWindowSceneOverlayPlacement *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)placementOverlayingWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 _FBSScene];

  v7 = [v6 identityToken];
  v8 = (void *)[v5 initWithTargetSceneIdentity:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneOverlayPlacement;
  id v4 = [(UIWindowScenePlacement *)&v8 copyWithZone:a3];
  id v5 = [(_UIWindowSceneOverlayPlacement *)self targetSceneIdentity];
  v6 = (void *)[v5 copy];
  [v4 setTargetSceneIdentity:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOverlayPlacement;
  if ([(UIWindowScenePlacement *)&v9 isEqual:v4])
  {
    id v5 = [v4 targetSceneIdentity];
    v6 = [(_UIWindowSceneOverlayPlacement *)self targetSceneIdentity];
    char v7 = [v6 isEqual:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB3440]);
  id v5 = [(_UIWindowSceneOverlayPlacement *)self targetSceneIdentity];
  v6 = (void *)[v4 initWithTargetSceneIdentity:v5];

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneOverlayPlacement;
  id v4 = a3;
  id v5 = [(UIWindowScenePlacement *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___UIWindowSceneOverlayPlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (FBSSceneIdentityToken)targetSceneIdentity
{
  return self->_targetSceneIdentity;
}

- (void)setTargetSceneIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end