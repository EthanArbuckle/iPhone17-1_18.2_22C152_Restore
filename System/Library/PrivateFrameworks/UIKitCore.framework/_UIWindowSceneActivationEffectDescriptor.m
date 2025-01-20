@interface _UIWindowSceneActivationEffectDescriptor
+ (id)descriptorWithPreview:(id)a3;
- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3;
- (NSArray)compatibleDescriptors;
- (UITargetedPreview)targetedPreview;
@end

@implementation _UIWindowSceneActivationEffectDescriptor

+ (id)descriptorWithPreview:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 parameters];
  [v5 setAppliesShadow:1];

  v6 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (NSArray)compatibleDescriptors
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [(_UIWindowSceneActivationEffectDescriptor *)self targetedPreview];
  v6 = [v5 view];
  v7 = [v4 targetedPreview];

  v8 = [v7 view];
  char v9 = [v6 isEqual:v8];

  return v9;
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (void).cxx_destruct
{
}

@end