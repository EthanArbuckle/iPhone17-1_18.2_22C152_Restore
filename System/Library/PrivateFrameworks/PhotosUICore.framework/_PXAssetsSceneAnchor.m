@interface _PXAssetsSceneAnchor
- (CGPoint)anchorOrigin;
- (PXAssetReference)assetReference;
- (_PXAssetsSceneAnchor)initWithAssetReference:(id)a3 anchorOrigin:(CGPoint)a4 distance:(double)a5;
- (double)distance;
@end

@implementation _PXAssetsSceneAnchor

- (void).cxx_destruct
{
}

- (double)distance
{
  return self->_distance;
}

- (CGPoint)anchorOrigin
{
  double x = self->_anchorOrigin.x;
  double y = self->_anchorOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (_PXAssetsSceneAnchor)initWithAssetReference:(id)a3 anchorOrigin:(CGPoint)a4 distance:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXAssetsSceneAnchor;
  v11 = [(_PXAssetsSceneAnchor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetReference, a3);
    v12->_anchorOrigin.CGFloat x = x;
    v12->_anchorOrigin.CGFloat y = y;
    v12->_distance = a5;
  }

  return v12;
}

@end