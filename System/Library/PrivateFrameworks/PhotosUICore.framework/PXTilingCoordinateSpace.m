@interface PXTilingCoordinateSpace
- (CGAffineTransform)transform;
- (PXTilingCoordinateSpace)init;
- (PXTilingCoordinateSpace)parentSpace;
- (void)setParentSpace:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation PXTilingCoordinateSpace

- (void).cxx_destruct
{
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].a;
  return self;
}

- (void)setParentSpace:(id)a3
{
}

- (PXTilingCoordinateSpace)parentSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpace);
  return (PXTilingCoordinateSpace *)WeakRetained;
}

- (PXTilingCoordinateSpace)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXTilingCoordinateSpace;
  result = [(PXTilingCoordinateSpace *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

@end