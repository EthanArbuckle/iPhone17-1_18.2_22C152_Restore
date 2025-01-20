@interface _UIGravityWellEffectKey
- (BOOL)isEqual:(id)a3;
- (CGPoint)point;
- (UIView)view;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPoint:(CGPoint)a3;
- (void)setView:(id)a3;
@end

@implementation _UIGravityWellEffectKey

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  v5 = [(_UIGravityWellEffectKey *)self view];
  [v4 setView:v5];

  [(_UIGravityWellEffectKey *)self point];
  objc_msgSend(v4, "setPoint:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIGravityWellEffectKey *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(_UIGravityWellEffectKey *)v5 view];
      v7 = [(_UIGravityWellEffectKey *)self view];
      if (v6 == v7)
      {
        [(_UIGravityWellEffectKey *)v5 point];
        double v10 = v9;
        double v12 = v11;
        [(_UIGravityWellEffectKey *)self point];
        BOOL v8 = v12 == v14 && v10 == v13;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(_UIGravityWellEffectKey *)self view];
  uint64_t v4 = [v3 hash];
  [(_UIGravityWellEffectKey *)self point];
  uint64_t v6 = v4 ^ (int)v5;
  [(_UIGravityWellEffectKey *)self point];
  unint64_t v8 = v6 ^ (int)v7;

  return v8;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (void).cxx_destruct
{
}

@end