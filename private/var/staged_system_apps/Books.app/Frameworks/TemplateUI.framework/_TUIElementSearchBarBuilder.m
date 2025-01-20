@interface _TUIElementSearchBarBuilder
- (BOOL)showCancel;
- (NSString)cancelText;
- (NSString)name;
- (NSString)returnKeyType;
- (NSString)text;
- (TUIMutableDynamicValue)viewState;
- (TUITextContentStyler)style;
- (UIEdgeInsets)editingInsets;
- (void)setCancelText:(id)a3;
- (void)setEditingInsets:(UIEdgeInsets)a3;
- (void)setName:(id)a3;
- (void)setReturnKeyType:(id)a3;
- (void)setShowCancel:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setText:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation _TUIElementSearchBarBuilder

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(id)a3
{
  objc_storeStrong((id *)&self->_returnKeyType, a3);
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

- (TUITextContentStyler)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (NSString)cancelText
{
  return self->_cancelText;
}

- (void)setCancelText:(id)a3
{
}

- (BOOL)showCancel
{
  return self->_showCancel;
}

- (void)setShowCancel:(BOOL)a3
{
  self->_showCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelText, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_returnKeyType, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end