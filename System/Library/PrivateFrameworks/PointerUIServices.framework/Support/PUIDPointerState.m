@interface PUIDPointerState
- (BOOL)isPointerAutoHidden;
- (BOOL)isPointerUnderlayingContent;
- (BOOL)isPressed;
- (BOOL)suppressPointerMirroring;
- (CATransform3D)clientCoordinateSpaceTransformToDisplay;
- (CGPoint)modelPointerReferencePosition;
- (CGRect)contentBounds;
- (NSArray)accessories;
- (NSString)debugRequestingClientString;
- (NSValue)contentSlipValue;
- (NSValue)pointerSlipValue;
- (PSMatchMoveSource)contentMatchMoveSource;
- (PSPointerPortalSourceCollection)pointerPortalSourceCollection;
- (PSPointerShape)pointerShape;
- (PUIDPointerState)init;
- (double)contentHoverInverseScale;
- (double)pointerVisualIntensity;
- (id)_pointerStateCopyWithClass:(Class)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)overlayEffectStyle;
- (unint64_t)pointerMaterialLuminance;
@end

@implementation PUIDPointerState

- (PUIDPointerState)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIDPointerState;
  result = [(PUIDPointerState *)&v7 init];
  if (result)
  {
    long long v3 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m33 = v3;
    long long v4 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m43 = v4;
    long long v5 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m13 = v5;
    long long v6 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&result->_clientCoordinateSpaceTransformToDisplay.m23 = v6;
    result->_contentHoverInverseScale = 1.0;
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pointerStateCopyWithClass:(Class)a3
{
  long long v4 = (char *)objc_alloc_init(a3);
  id v5 = v4;
  if (v4)
  {
    CGPoint origin = self->_contentBounds.origin;
    *(CGSize *)(v4 + 24) = self->_contentBounds.size;
    *(CGPoint *)(v4 + 8) = origin;
    long long v7 = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m33;
    long long v8 = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m41;
    long long v9 = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m43;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m31;
    *(_OWORD *)(v4 + 152) = v9;
    *(_OWORD *)(v4 + 136) = v8;
    *(_OWORD *)(v4 + 120) = v7;
    long long v10 = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m11;
    long long v11 = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m13;
    long long v12 = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m21;
    *(_OWORD *)(v4 + 88) = *(_OWORD *)&self->_clientCoordinateSpaceTransformToDisplay.m23;
    *(_OWORD *)(v4 + 72) = v12;
    *(_OWORD *)(v4 + 56) = v11;
    *(_OWORD *)(v4 + 40) = v10;
    *((void *)v4 + 21) = *(void *)&self->_contentHoverInverseScale;
    id v13 = [(PSMatchMoveSource *)self->_contentMatchMoveSource copy];
    v14 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v13;

    id v15 = [(NSValue *)self->_contentSlipValue copy];
    v16 = (void *)*((void *)v5 + 23);
    *((void *)v5 + 23) = v15;

    *((_OWORD *)v5 + 12) = self->_modelPointerReferencePosition;
    *((void *)v5 + 26) = self->_overlayEffectStyle;
    *((unsigned char *)v5 + 264) = self->_pointerAutoHidden;
    *((void *)v5 + 27) = self->_pointerMaterialLuminance;
    id v17 = [(PSPointerPortalSourceCollection *)self->_pointerPortalSourceCollection copy];
    v18 = (void *)*((void *)v5 + 28);
    *((void *)v5 + 28) = v17;

    id v19 = [(PSPointerShape *)self->_pointerShape copy];
    v20 = (void *)*((void *)v5 + 29);
    *((void *)v5 + 29) = v19;

    id v21 = [(NSValue *)self->_pointerSlipValue copy];
    v22 = (void *)*((void *)v5 + 30);
    *((void *)v5 + 30) = v21;

    id v23 = [(NSString *)self->_debugRequestingClientString copy];
    v24 = (void *)*((void *)v5 + 31);
    *((void *)v5 + 31) = v23;

    *((unsigned char *)v5 + 265) = self->_pointerUnderlayingContent;
    *((void *)v5 + 32) = *(void *)&self->_pointerVisualIntensity;
    *((unsigned char *)v5 + 266) = self->_pressed;
    *((unsigned char *)v5 + 267) = self->_suppressPointerMirroring;
    objc_storeStrong((id *)v5 + 34, self->_accessories);
  }
  return v5;
}

- (CGPoint)modelPointerReferencePosition
{
  double x = self->_modelPointerReferencePosition.x;
  double y = self->_modelPointerReferencePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)contentHoverInverseScale
{
  return self->_contentHoverInverseScale;
}

- (NSValue)contentSlipValue
{
  return self->_contentSlipValue;
}

- (CATransform3D)clientCoordinateSpaceTransformToDisplay
{
  long long v3 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m14;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m12;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (PSPointerPortalSourceCollection)pointerPortalSourceCollection
{
  return self->_pointerPortalSourceCollection;
}

- (PSMatchMoveSource)contentMatchMoveSource
{
  return self->_contentMatchMoveSource;
}

- (int64_t)overlayEffectStyle
{
  return self->_overlayEffectStyle;
}

- (BOOL)isPointerAutoHidden
{
  return self->_pointerAutoHidden;
}

- (BOOL)isPointerUnderlayingContent
{
  return self->_pointerUnderlayingContent;
}

- (unint64_t)pointerMaterialLuminance
{
  return self->_pointerMaterialLuminance;
}

- (PSPointerShape)pointerShape
{
  return self->_pointerShape;
}

- (NSValue)pointerSlipValue
{
  return self->_pointerSlipValue;
}

- (double)pointerVisualIntensity
{
  return self->_pointerVisualIntensity;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)suppressPointerMirroring
{
  return self->_suppressPointerMirroring;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (NSString)debugRequestingClientString
{
  return self->_debugRequestingClientString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_debugRequestingClientString, 0);
  objc_storeStrong((id *)&self->_pointerSlipValue, 0);
  objc_storeStrong((id *)&self->_pointerShape, 0);
  objc_storeStrong((id *)&self->_pointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_contentSlipValue, 0);
  objc_storeStrong((id *)&self->_contentMatchMoveSource, 0);
}

@end