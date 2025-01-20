@interface _WGCarouselCellResizeContext
- (BOOL)isActive;
- (UIViewFloatAnimatableProperty)resizeProgress;
- (double)compactHeight;
- (double)expandedHeight;
- (void)setActive:(BOOL)a3;
- (void)setCompactHeight:(double)a3;
- (void)setExpandedHeight:(double)a3;
- (void)setResizeProgress:(id)a3;
@end

@implementation _WGCarouselCellResizeContext

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3)
    {
      [(_WGCarouselCellResizeContext *)self setCompactHeight:-1.0];
      [(_WGCarouselCellResizeContext *)self setExpandedHeight:-1.0];
    }
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (double)compactHeight
{
  return self->_compactHeight;
}

- (void)setCompactHeight:(double)a3
{
  self->_compactHeight = a3;
}

- (double)expandedHeight
{
  return self->_expandedHeight;
}

- (void)setExpandedHeight:(double)a3
{
  self->_expandedHeight = a3;
}

- (UIViewFloatAnimatableProperty)resizeProgress
{
  return self->_resizeProgress;
}

- (void)setResizeProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end