@interface _UIGravityWellEffectDescriptor
- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3;
- (NSArray)compatibleDescriptors;
- (NSArray)secondaryPreviews;
- (UITargetedPreview)primaryPreview;
- (void)setPrimaryPreview:(id)a3;
- (void)setSecondaryPreviews:(id)a3;
@end

@implementation _UIGravityWellEffectDescriptor

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
  v5 = [(_UIGravityWellEffectDescriptor *)self targetedPreview];
  v6 = [v5 view];
  v7 = [v4 targetedPreview];

  v8 = [v7 view];
  LOBYTE(v4) = v6 == v8;

  return (char)v4;
}

- (UITargetedPreview)primaryPreview
{
  return self->_primaryPreview;
}

- (void)setPrimaryPreview:(id)a3
{
}

- (NSArray)secondaryPreviews
{
  return self->_secondaryPreviews;
}

- (void)setSecondaryPreviews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryPreviews, 0);
  objc_storeStrong((id *)&self->_primaryPreview, 0);
}

@end