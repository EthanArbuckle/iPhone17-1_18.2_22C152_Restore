@interface PXLayoutItem
- (CGAffineTransform)transform;
- (CGPoint)positionOffset;
- (CGRect)acceptableCropRect;
- (CGRect)preferredCropRect;
- (CGSize)size;
- (PXLayoutItem)init;
- (PXLayoutItem)initWithSize:(CGSize)a3 weight:(double)a4;
- (double)weight;
- (double)weightUsingCriterion:(int64_t)a3;
- (void)setAcceptableCropRect:(CGRect)a3;
- (void)setPositionOffset:(CGPoint)a3;
- (void)setPreferredCropRect:(CGRect)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setWeight:(double)a3;
@end

@implementation PXLayoutItem

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableCropRect.origin.x;
  double y = self->_acceptableCropRect.origin.y;
  double width = self->_acceptableCropRect.size.width;
  double height = self->_acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPositionOffset:(CGPoint)a3
{
  self->_positionOffset = a3;
}

- (CGPoint)positionOffset
{
  double x = self->_positionOffset.x;
  double y = self->_positionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)weightUsingCriterion:(int64_t)a3
{
  return self->_weight;
}

- (PXLayoutItem)initWithSize:(CGSize)a3 weight:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)PXLayoutItem;
  CGSize result = [(PXLayoutItem *)&v8 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_weight = a4;
    result->_preferredCropRect.origin = (CGPoint)PXRectUnit;
    result->_preferredCropRect.size = (CGSize)unk_259D74B60;
    result->_acceptableCropRect.origin = (CGPoint)PXRectUnit;
    result->_acceptableCropRect.size = (CGSize)unk_259D74B60;
  }
  return result;
}

- (PXLayoutItem)init
{
  return -[PXLayoutItem initWithSize:weight:](self, "initWithSize:weight:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), 0.0);
}

@end