@interface PSMutablePointerHoverRegion
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAccessories:(id)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setContentHoverInverseScale:(double)a3;
- (void)setContentMatchMoveSource:(id)a3;
- (void)setContentSlipValue:(id)a3;
- (void)setCoordinateSpaceSourceContextID:(unsigned int)a3;
- (void)setCoordinateSpaceSourceLayerRenderID:(unint64_t)a3;
- (void)setHitTestBounds:(CGRect)a3;
- (void)setOverlayEffectStyle:(int64_t)a3;
- (void)setOverlayEffectVisible:(BOOL)a3;
- (void)setPointerLatchingAxes:(unint64_t)a3;
- (void)setPointerPortalSourceCollection:(id)a3;
- (void)setPointerRecenteringAxes:(unint64_t)a3;
- (void)setPointerShape:(id)a3;
- (void)setPointerSlipValue:(id)a3;
- (void)setPointerVisualIntensity:(double)a3;
- (void)setPreferredPointerMaterialLuminance:(unint64_t)a3;
- (void)setShouldPointerSuppressMirroring:(BOOL)a3;
- (void)setShouldPointerUnderlayContent:(BOOL)a3;
@end

@implementation PSMutablePointerHoverRegion

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(PSPointerHoverRegion *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(PSPointerHoverRegion *)self _copyWithClass:v4];
}

- (void)setCoordinateSpaceSourceContextID:(unsigned int)a3
{
  self->super._coordinateSpaceSourceContextID = a3;
}

- (void)setCoordinateSpaceSourceLayerRenderID:(unint64_t)a3
{
  self->super._coordinateSpaceSourceLayerRenderID = a3;
}

- (void)setContentBounds:(CGRect)a3
{
  self->super._contentBounds = a3;
}

- (void)setContentHoverInverseScale:(double)a3
{
  self->super._contentHoverInverseScale = a3;
}

- (void)setContentMatchMoveSource:(id)a3
{
  self->super._contentMatchMoveSource = (PSMatchMoveSource *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContentSlipValue:(id)a3
{
  self->super._contentSlipValue = (NSValue *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHitTestBounds:(CGRect)a3
{
  self->super._hitTestBounds = a3;
}

- (void)setOverlayEffectVisible:(BOOL)a3
{
}

- (void)setOverlayEffectStyle:(int64_t)a3
{
  self->super._overlayEffectStyle = a3;
}

- (void)setPointerPortalSourceCollection:(id)a3
{
  self->super._pointerPortalSourceCollection = (PSPointerPortalSourceCollection *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPointerRecenteringAxes:(unint64_t)a3
{
  self->super._pointerRecenteringAxes = a3;
}

- (void)setPointerLatchingAxes:(unint64_t)a3
{
  self->super._pointerLatchingAxes = a3;
}

- (void)setPointerShape:(id)a3
{
  self->super._pointerShape = (PSPointerShape *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPointerSlipValue:(id)a3
{
  self->super._pointerSlipValue = (NSValue *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPointerVisualIntensity:(double)a3
{
  self->super._pointerVisualIntensity = a3;
}

- (void)setPreferredPointerMaterialLuminance:(unint64_t)a3
{
  self->super._preferredPointerMaterialLuminance = a3;
}

- (void)setShouldPointerUnderlayContent:(BOOL)a3
{
  self->super._shouldPointerUnderlayContent = a3;
}

- (void)setShouldPointerSuppressMirroring:(BOOL)a3
{
  self->super._shouldPointerSuppressMirroring = a3;
}

- (void)setAccessories:(id)a3
{
  self->super._accessories = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end