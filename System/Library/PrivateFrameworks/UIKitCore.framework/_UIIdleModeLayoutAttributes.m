@interface _UIIdleModeLayoutAttributes
- (BOOL)wantsDimmingOverlay;
- (CGAffineTransform)transform;
- (CGPoint)centerOffset;
- (_UIIdleModeLayoutAttributes)init;
- (double)alphaOffset;
- (void)setAlphaOffset:(double)a3;
- (void)setCenterOffset:(CGPoint)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setWantsDimmingOverlay:(BOOL)a3;
@end

@implementation _UIIdleModeLayoutAttributes

- (_UIIdleModeLayoutAttributes)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIIdleModeLayoutAttributes;
  result = [(_UIIdleModeLayoutAttributes *)&v5 init];
  if (result)
  {
    result->_centerOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
    result->_alphaOffset = 0.0;
    result->_wantsDimmingOverlay = 0;
  }
  return result;
}

- (CGPoint)centerOffset
{
  double x = self->_centerOffset.x;
  double y = self->_centerOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenterOffset:(CGPoint)a3
{
  self->_centerOffset = a3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)alphaOffset
{
  return self->_alphaOffset;
}

- (void)setAlphaOffset:(double)a3
{
  self->_alphaOffset = a3;
}

- (BOOL)wantsDimmingOverlay
{
  return self->_wantsDimmingOverlay;
}

- (void)setWantsDimmingOverlay:(BOOL)a3
{
  self->_wantsDimmingOverladouble y = a3;
}

@end