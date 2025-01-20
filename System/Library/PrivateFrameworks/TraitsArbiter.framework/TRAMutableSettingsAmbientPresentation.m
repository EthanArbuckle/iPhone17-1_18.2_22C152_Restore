@interface TRAMutableSettingsAmbientPresentation
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAmbientPresentationInputs:(id)a3;
@end

@implementation TRAMutableSettingsAmbientPresentation

- (void)setAmbientPresentationInputs:(id)a3
{
  v5 = (TRAArbitrationAmbientPresentationInputs *)a3;
  ambientPresentationInputs = self->super._ambientPresentationInputs;
  p_ambientPresentationInputs = &self->super._ambientPresentationInputs;
  if (ambientPresentationInputs != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_ambientPresentationInputs, a3);
    v5 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRASettingsAmbientPresentation allocWithZone:a3];
  return [(TRASettingsAmbientPresentation *)v4 initWithAmbientPresentationSettings:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithAmbientPresentationSettings:self];
}

@end