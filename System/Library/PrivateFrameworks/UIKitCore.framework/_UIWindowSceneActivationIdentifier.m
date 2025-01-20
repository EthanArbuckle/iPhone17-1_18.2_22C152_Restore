@interface _UIWindowSceneActivationIdentifier
+ (id)identifierWithLocation:(CGPoint)a3 inView:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)location;
- (UIView)view;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _UIWindowSceneActivationIdentifier

+ (id)identifierWithLocation:(CGPoint)a3 inView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  *(CGFloat *)(v7 + 16) = x;
  *(CGFloat *)(v7 + 24) = y;
  objc_storeWeak((id *)(v7 + 8), v6);

  return (id)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  [(_UIWindowSceneActivationIdentifier *)self location];
  *(void *)(v4 + 16) = v5;
  *(void *)(v4 + 24) = v6;
  uint64_t v7 = [(_UIWindowSceneActivationIdentifier *)self view];
  objc_storeWeak((id *)(v4 + 8), v7);

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIWindowSceneActivationIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(_UIWindowSceneActivationIdentifier *)v5 view];
      uint64_t v7 = [(_UIWindowSceneActivationIdentifier *)self view];
      if (v6 == v7)
      {
        [(_UIWindowSceneActivationIdentifier *)v5 location];
        double v10 = v9;
        double v12 = v11;
        [(_UIWindowSceneActivationIdentifier *)self location];
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
  [(_UIWindowSceneActivationIdentifier *)self location];
  int v4 = (int)v3;
  [(_UIWindowSceneActivationIdentifier *)self location];
  uint64_t v6 = (int)v5 ^ v4;
  uint64_t v7 = [(_UIWindowSceneActivationIdentifier *)self view];
  unint64_t v8 = [v7 hash] ^ v6;

  return v8;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end