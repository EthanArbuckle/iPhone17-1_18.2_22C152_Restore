@interface TRAMutableSettingsOrientation
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientationMapResolver:(id)a3;
- (void)setRawOrientationInputs:(id)a3;
- (void)setValidatedOrientationInputs:(id)a3;
@end

@implementation TRAMutableSettingsOrientation

- (void)setOrientationMapResolver:(id)a3
{
  id v5 = a3;
  orientationMapResolver = self->super._orientationMapResolver;
  p_orientationMapResolver = &self->super._orientationMapResolver;
  id v8 = v5;
  if ((-[BSInterfaceOrientationMapResolving isEqual:](orientationMapResolver, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_orientationMapResolver, a3);
  }
}

- (void)setValidatedOrientationInputs:(id)a3
{
  id v5 = a3;
  validatedOrientationInputs = self->super._validatedOrientationInputs;
  p_validatedOrientationInputs = &self->super._validatedOrientationInputs;
  id v8 = v5;
  if (!-[TRAArbitrationDeviceOrientationInputs isEqual:](validatedOrientationInputs, "isEqual:")) {
    objc_storeStrong((id *)p_validatedOrientationInputs, a3);
  }
}

- (void)setRawOrientationInputs:(id)a3
{
  id v5 = a3;
  rawOrientationInputs = self->super._rawOrientationInputs;
  p_rawOrientationInputs = &self->super._rawOrientationInputs;
  id v8 = v5;
  if (!-[TRAArbitrationDeviceOrientationInputs isEqual:](rawOrientationInputs, "isEqual:")) {
    objc_storeStrong((id *)p_rawOrientationInputs, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRASettingsOrientation allocWithZone:a3];
  return [(TRASettingsOrientation *)v4 initWithOrientationSettings:self];
}

- (void)setOrientation:(int64_t)a3
{
  if (self->super._orientation != a3) {
    self->super._orientation = a3;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithOrientationSettings:self];
}

@end