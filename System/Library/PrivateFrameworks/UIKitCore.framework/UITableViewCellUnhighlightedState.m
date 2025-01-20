@interface UITableViewCellUnhighlightedState
- (BOOL)highlighted;
- (BOOL)opaque;
- (UIColor)backgroundColor;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOpaque:(BOOL)a3;
@end

@implementation UITableViewCellUnhighlightedState

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end