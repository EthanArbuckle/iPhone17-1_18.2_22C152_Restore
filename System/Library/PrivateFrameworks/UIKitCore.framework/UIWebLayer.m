@interface UIWebLayer
- (void)setLayoutsSuspended:(BOOL)a3;
- (void)setNeedsLayout;
@end

@implementation UIWebLayer

- (void)setNeedsLayout
{
  if (!self->_layoutsSuspended)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebLayer;
    [(UIWebLayer *)&v2 setNeedsLayout];
  }
}

- (void)setLayoutsSuspended:(BOOL)a3
{
  self->_layoutsSuspended = a3;
}

@end