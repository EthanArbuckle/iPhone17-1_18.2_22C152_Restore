@interface TUILayoutOptionBox
- (Class)layoutClass;
- (double)maxScale;
- (double)minScale;
- (void)setMaxScale:(double)a3;
- (void)setMinScale:(double)a3;
@end

@implementation TUILayoutOptionBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (double)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(double)a3
{
  self->_minScale = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

@end