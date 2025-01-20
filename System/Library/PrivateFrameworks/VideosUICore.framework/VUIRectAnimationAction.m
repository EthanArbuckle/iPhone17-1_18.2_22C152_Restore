@interface VUIRectAnimationAction
- (CABasicAnimation)animationToRun;
- (CGRect)fromRect;
- (NSString)key;
- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5;
- (void)setAnimationToRun:(id)a3;
- (void)setFromRect:(CGRect)a3;
- (void)setKey:(id)a3;
@end

@implementation VUIRectAnimationAction

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v9 = a4;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_animationToRun && self->_key)
  {
    id v6 = v9;
    v7 = [v6 valueForKey:self->_key];
    objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_fromRect.origin.x, self->_fromRect.origin.y, self->_fromRect.size.width, self->_fromRect.size.height);
      [(CABasicAnimation *)self->_animationToRun setFromValue:v8];

      [(CABasicAnimation *)self->_animationToRun setToValue:v7];
      [v6 addAnimation:self->_animationToRun forKey:self->_key];
    }
  }
}

- (CABasicAnimation)animationToRun
{
  return self->_animationToRun;
}

- (void)setAnimationToRun:(id)a3
{
}

- (CGRect)fromRect
{
  double x = self->_fromRect.origin.x;
  double y = self->_fromRect.origin.y;
  double width = self->_fromRect.size.width;
  double height = self->_fromRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFromRect:(CGRect)a3
{
  self->_fromRect = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_animationToRun, 0);
}

@end