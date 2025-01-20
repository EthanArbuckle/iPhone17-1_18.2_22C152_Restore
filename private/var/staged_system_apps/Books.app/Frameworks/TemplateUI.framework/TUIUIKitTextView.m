@interface TUIUIKitTextView
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (UIEdgeInsets)editingInsets;
- (void)setEditingInsets:(UIEdgeInsets)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation TUIUIKitTextView

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return [(TUIUIKitTextView *)self isEditable];
}

- (BOOL)isHighlighted
{
  return 0;
}

- (UIEdgeInsets)editingInsets
{
  double top = self->_editingInsets.top;
  double left = self->_editingInsets.left;
  double bottom = self->_editingInsets.bottom;
  double right = self->_editingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEditingInsets:(UIEdgeInsets)a3
{
  self->_editingInsets = a3;
}

@end