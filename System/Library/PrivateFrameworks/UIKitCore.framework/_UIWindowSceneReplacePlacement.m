@interface _UIWindowSceneReplacePlacement
+ (id)placementToReplaceSceneSession:(id)a3;
+ (unint64_t)_placementType;
- (BOOL)isEqual:(id)a3;
- (NSString)targetSceneSessionPersistentIdentifier;
- (id)_createConfigurationWithError:(id *)a3;
- (id)_initWithTargetSceneSession:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setTargetSceneSessionPersistentIdentifier:(id)a3;
@end

@implementation _UIWindowSceneReplacePlacement

+ (id)placementToReplaceSceneSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithTargetSceneSession:v4];

  return v5;
}

- (id)_initWithTargetSceneSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneReplacePlacement;
  v5 = [(UIWindowScenePlacement *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 persistentIdentifier];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

+ (unint64_t)_placementType
{
  return 8;
}

- (id)_createConfigurationWithError:(id *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB3460]) initWithTargetSceneSessionPersistentIdentifier:self->_targetSceneSessionPersistentIdentifier];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWindowSceneReplacePlacement;
  id v4 = [(UIWindowScenePlacement *)&v6 copyWithZone:a3];
  [v4 setTargetSceneSessionPersistentIdentifier:self->_targetSceneSessionPersistentIdentifier];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneReplacePlacement;
  if ([(UIWindowScenePlacement *)&v8 isEqual:v4])
  {
    v5 = [v4 targetSceneSessionPersistentIdentifier];
    char v6 = [v5 isEqual:self->_targetSceneSessionPersistentIdentifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneReplacePlacement;
  id v4 = a3;
  v5 = [(UIWindowScenePlacement *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___UIWindowSceneReplacePlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (NSString)targetSceneSessionPersistentIdentifier
{
  return self->_targetSceneSessionPersistentIdentifier;
}

- (void)setTargetSceneSessionPersistentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end