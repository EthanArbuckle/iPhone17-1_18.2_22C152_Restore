@interface _UIDynamicTransformer
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (_UIDynamicTransformer)initWithActionBlock:(id)a3;
- (void)setCenter:(CGPoint)a3;
@end

@implementation _UIDynamicTransformer

- (_UIDynamicTransformer)initWithActionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIDynamicTransformer.m", 20, @"Invalid parameter not satisfying: %@", @"actionBlock" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIDynamicTransformer;
  v6 = [(_UIDynamicTransformer *)&v12 init];
  if (v6)
  {
    v7 = _Block_copy(v5);
    id action = v6->_action;
    v6->_id action = v7;

    v9 = v6;
  }

  return v6;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
  (*((void (**)(void))self->_action + 2))();
}

- (CGRect)bounds
{
  double v2 = 100.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 100.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v3 + 32);
  return self;
}

- (void).cxx_destruct
{
}

@end