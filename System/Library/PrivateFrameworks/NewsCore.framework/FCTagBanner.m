@interface FCTagBanner
- (CGSize)size;
- (FCAssetHandle)assetHandle;
- (FCEdgeInsets)insets;
- (FCTagBanner)initWithAssetHandle:(id)a3 size:(CGSize)a4 insets:(FCEdgeInsets)a5;
@end

@implementation FCTagBanner

- (FCAssetHandle)assetHandle
{
  return self->_assetHandle;
}

- (void).cxx_destruct
{
}

- (FCTagBanner)initWithAssetHandle:(id)a3 size:(CGSize)a4 insets:(FCEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCTagBanner;
  v14 = [(FCTagBanner *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetHandle, a3);
    v15->_size.CGFloat width = width;
    v15->_size.CGFloat height = height;
    v15->_insets.double top = top;
    v15->_insets.double left = left;
    v15->_insets.double bottom = bottom;
    v15->_insets.double right = right;
  }

  return v15;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (FCEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end