@interface PFMutableCameraAdjustments
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setCinematicVideoRenderingVersion:(unint64_t)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDepthEnabled:(BOOL)a3;
- (void)setEffectFilterName:(id)a3;
- (void)setIsEligibleForCinematicAudioEffectProcessing:(BOOL)a3;
- (void)setPortraitEffectFilterName:(id)a3;
- (void)setPortraitMetadata:(id)a3;
- (void)setSloMoEnabled:(BOOL)a3;
@end

@implementation PFMutableCameraAdjustments

- (void)setCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->super._cropRect))
  {
    self->super._cropRect.origin.CGFloat x = x;
    self->super._cropRect.origin.CGFloat y = y;
    self->super._cropRect.size.CGFloat width = width;
    self->super._cropRect.size.CGFloat height = height;
  }
}

- (void)setCinematicVideoRenderingVersion:(unint64_t)a3
{
  if (self->super._cinematicVideoRenderingVersion != a3) {
    self->super._cinematicVideoRenderingVersion = a3;
  }
}

- (void)setIsEligibleForCinematicAudioEffectProcessing:(BOOL)a3
{
  if (self->super._isEligibleForCinematicAudioEffectProcessing != a3) {
    self->super._isEligibleForCinematicAudioEffectProcessing = a3;
  }
}

- (void)setSloMoEnabled:(BOOL)a3
{
  if (self->super._sloMoEnabled != a3) {
    self->super._sloMoEnabled = a3;
  }
}

- (void)setDepthEnabled:(BOOL)a3
{
  if (self->super._depthEnabled != a3) {
    self->super._depthEnabled = a3;
  }
}

- (void)setPortraitMetadata:(id)a3
{
  v5 = (AVApplePortraitMetadata *)a3;
  portraitMetadata = self->super._portraitMetadata;
  p_portraitMetadata = &self->super._portraitMetadata;
  if (portraitMetadata != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_portraitMetadata, a3);
    v5 = v8;
  }
}

- (void)setPortraitEffectFilterName:(id)a3
{
  if (self->super._portraitEffectFilterName != a3)
  {
    self->super._portraitEffectFilterName = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setEffectFilterName:(id)a3
{
  if (self->super._effectFilterName != a3)
  {
    self->super._effectFilterName = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithAdjustments:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PFCameraAdjustments alloc];

  return [(PFCameraAdjustments *)v4 initWithAdjustments:self];
}

@end