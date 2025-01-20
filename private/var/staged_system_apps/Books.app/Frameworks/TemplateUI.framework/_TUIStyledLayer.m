@interface _TUIStyledLayer
- (id)implicitAnimationForKeyPath:(id)a3;
@end

@implementation _TUIStyledLayer

- (id)implicitAnimationForKeyPath:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_TUIStyledLayer;
  v5 = [(_TUIStyledLayer *)&v7 implicitAnimationForKeyPath:v4];
  if (!v5)
  {
    if ([v4 isEqualToString:@"shadowPath"])
    {
      v5 = +[CABasicAnimation animationWithKeyPath:v4];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end