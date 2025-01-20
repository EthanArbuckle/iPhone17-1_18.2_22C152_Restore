@interface VUIPathAnimationAction
- (CABasicAnimation)animationToRun;
- (CGPath)fromPath;
- (NSString)key;
- (void)dealloc;
- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5;
- (void)setAnimationToRun:(id)a3;
- (void)setFromPath:(CGPath *)a3;
- (void)setKey:(id)a3;
@end

@implementation VUIPathAnimationAction

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v9 = a4;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_animationToRun)
    {
      key = self->_key;
      if (key)
      {
        id v7 = v9;
        uint64_t v8 = [v7 valueForKey:key];
        [(CABasicAnimation *)self->_animationToRun setFromValue:self->_fromPath];
        [(CABasicAnimation *)self->_animationToRun setToValue:v8];
        [v7 addAnimation:self->_animationToRun forKey:self->_key];
      }
    }
  }
}

- (void)setFromPath:(CGPath *)a3
{
  self->_fromPath = a3;
}

- (void)dealloc
{
  CGPathRelease(self->_fromPath);
  v3.receiver = self;
  v3.super_class = (Class)VUIPathAnimationAction;
  [(VUIPathAnimationAction *)&v3 dealloc];
}

- (CABasicAnimation)animationToRun
{
  return self->_animationToRun;
}

- (void)setAnimationToRun:(id)a3
{
}

- (CGPath)fromPath
{
  return self->_fromPath;
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