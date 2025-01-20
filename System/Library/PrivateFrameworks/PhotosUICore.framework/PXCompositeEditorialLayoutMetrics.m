@interface PXCompositeEditorialLayoutMetrics
- (BOOL)useSaliency;
- (PXCompositeEditorialLayoutMetrics)init;
- (PXCompositeEditorialLayoutSpec)editorialLayoutSpec;
- (UIEdgeInsets)padding;
- (double)interTileSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInterTileSpacing:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setUseSaliency:(BOOL)a3;
@end

@implementation PXCompositeEditorialLayoutMetrics

- (void).cxx_destruct
{
}

- (PXCompositeEditorialLayoutSpec)editorialLayoutSpec
{
  return self->_editorialLayoutSpec;
}

- (void)setUseSaliency:(BOOL)a3
{
  self->_useSaliency = a3;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInterTileSpacing:(double)a3
{
  self->_interTileSpacing = a3;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXCompositeEditorialLayoutMetrics;
  id v4 = [(PXLayoutMetrics *)&v7 copyWithZone:a3];
  *((void *)v4 + 4) = *(void *)&self->_interTileSpacing;
  long long v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)v4 + 3) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)v4 + 4) = v5;
  *((unsigned char *)v4 + 24) = self->_useSaliency;
  objc_storeStrong((id *)v4 + 5, self->_editorialLayoutSpec);
  return v4;
}

- (PXCompositeEditorialLayoutMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXCompositeEditorialLayoutMetrics;
  v2 = [(PXCompositeEditorialLayoutMetrics *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_interTileSpacing = 2.0;
    long long v4 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v2->_padding.double top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v2->_padding.double bottom = v4;
    uint64_t v5 = +[PXCompositeEditorialLayoutSpec defaultSpec];
    editorialLayoutSpec = v3->_editorialLayoutSpec;
    v3->_editorialLayoutSpec = (PXCompositeEditorialLayoutSpec *)v5;
  }
  return v3;
}

@end