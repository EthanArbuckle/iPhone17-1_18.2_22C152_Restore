@interface PXGPPTLayoutTesterItemInput
+ (id)createItemInputsForCount:(int64_t)a3;
- (CGAffineTransform)transform;
- (CGPoint)positionOffset;
- (CGRect)acceptableCropRect;
- (CGRect)preferredCropRect;
- (CGSize)size;
- (double)weight;
- (double)weightUsingCriterion:(int64_t)a3;
@end

@implementation PXGPPTLayoutTesterItemInput

- (double)weightUsingCriterion:(int64_t)a3
{
  return self->_weight;
}

- (CGPoint)positionOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
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

- (double)weight
{
  return self->_weight;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (id)createItemInputsForCount:(int64_t)a3
{
  int64_t v3 = a3;
  long long v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  time_t v5 = time(0);
  srand48(v5);
  if (v3 >= 1)
  {
    __asm { FMOV            V0.2D, #1.0 }
    CGSize v13 = _Q0;
    int64x2_t v14 = vdupq_n_s64(0x4069000000000000uLL);
    do
    {
      v11 = objc_alloc_init(PXGPPTLayoutTesterItemInput);
      v11->_size = (CGSize)v14;
      v11->_weight = drand48();
      v11->_preferredCropRect.origin.double x = 0.0;
      v11->_preferredCropRect.origin.double y = 0.0;
      v11->_preferredCropRect.size = v13;
      v11->_acceptableCropRect.origin.double x = 0.0;
      v11->_acceptableCropRect.origin.double y = 0.0;
      v11->_acceptableCropRect.size = v13;
      [v4 addObject:v11];

      --v3;
    }
    while (v3);
  }
  return v4;
}

@end