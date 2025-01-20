@interface PUIDMutablePointerState
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAccessories:(id)a3;
- (void)setClientCoordinateSpaceTransformToDisplay:(CATransform3D *)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setContentHoverInverseScale:(double)a3;
- (void)setContentMatchMoveSource:(id)a3;
- (void)setContentSlipValue:(id)a3;
- (void)setDebugRequestingClientString:(id)a3;
- (void)setModelPointerReferencePosition:(CGPoint)a3;
- (void)setOverlayEffectStyle:(int64_t)a3;
- (void)setPointerAutoHidden:(BOOL)a3;
- (void)setPointerMaterialLuminance:(unint64_t)a3;
- (void)setPointerPortalSourceCollection:(id)a3;
- (void)setPointerShape:(id)a3;
- (void)setPointerSlipValue:(id)a3;
- (void)setPointerUnderlayingContent:(BOOL)a3;
- (void)setPointerVisualIntensity:(double)a3;
- (void)setPressed:(BOOL)a3;
- (void)setSuppressPointerMirroring:(BOOL)a3;
@end

@implementation PUIDMutablePointerState

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  v4 = [v3 activeMultilinePrefix];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100027980;
  v11 = &unk_100044C88;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:@"PUIDPointerState" multilinePrefix:v4 block:&v8];

  v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

- (void)setContentBounds:(CGRect)a3
{
  self->super._contentBounds = a3;
}

- (void)setClientCoordinateSpaceTransformToDisplay:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m21 = v5;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m13 = v4;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m11 = v3;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m41 = v8;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m33 = v7;
  *(_OWORD *)&self->super._clientCoordinateSpaceTransformToDisplay.m31 = v6;
}

- (void)setContentHoverInverseScale:(double)a3
{
  self->super._contentHoverInverseScale = a3;
}

- (void)setContentMatchMoveSource:(id)a3
{
  self->super._contentMatchMoveSource = (PSMatchMoveSource *)[a3 copy];
  _objc_release_x1();
}

- (void)setContentSlipValue:(id)a3
{
  self->super._contentSlipValue = (NSValue *)[a3 copy];
  _objc_release_x1();
}

- (void)setModelPointerReferencePosition:(CGPoint)a3
{
  self->super._modelPointerReferencePosition = a3;
}

- (void)setOverlayEffectStyle:(int64_t)a3
{
  self->super._overlayEffectStyle = a3;
}

- (void)setPointerAutoHidden:(BOOL)a3
{
  self->super._pointerAutoHidden = a3;
}

- (void)setPointerMaterialLuminance:(unint64_t)a3
{
  self->super._pointerMaterialLuminance = a3;
}

- (void)setPointerPortalSourceCollection:(id)a3
{
  self->super._pointerPortalSourceCollection = (PSPointerPortalSourceCollection *)[a3 copy];
  _objc_release_x1();
}

- (void)setPointerShape:(id)a3
{
  self->super._pointerShape = (PSPointerShape *)[a3 copy];
  _objc_release_x1();
}

- (void)setPointerSlipValue:(id)a3
{
  self->super._pointerSlipValue = (NSValue *)[a3 copy];
  _objc_release_x1();
}

- (void)setDebugRequestingClientString:(id)a3
{
  self->super._debugRequestingClientString = (NSString *)[a3 copy];
  _objc_release_x1();
}

- (void)setPointerUnderlayingContent:(BOOL)a3
{
  self->super._pointerUnderlayingContent = a3;
}

- (void)setPointerVisualIntensity:(double)a3
{
  self->super._pointerVisualIntensity = a3;
}

- (void)setPressed:(BOOL)a3
{
  self->super._pressed = a3;
}

- (void)setSuppressPointerMirroring:(BOOL)a3
{
  self->super._suppressPointerMirroring = a3;
}

- (void)setAccessories:(id)a3
{
}

@end