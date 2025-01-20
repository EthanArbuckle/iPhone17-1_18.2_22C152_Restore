@interface VUIPointAnimationAction
- (CABasicAnimation)animationToRun;
- (CGPoint)fromPoint;
- (NSString)key;
- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5;
- (void)setAnimationToRun:(id)a3;
- (void)setFromPoint:(CGPoint)a3;
- (void)setKey:(id)a3;
@end

@implementation VUIPointAnimationAction

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
      v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", self->_fromPoint.x, self->_fromPoint.y);
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

- (CGPoint)fromPoint
{
  double x = self->_fromPoint.x;
  double y = self->_fromPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFromPoint:(CGPoint)a3
{
  self->_fromPoint = a3;
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