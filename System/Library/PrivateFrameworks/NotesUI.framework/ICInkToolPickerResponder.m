@interface ICInkToolPickerResponder
- (BOOL)canBecomeFirstResponder;
- (BOOL)preventFirstResponder;
- (ICInkToolPickerResponderDelegate)delegate;
- (id)inputAssistantItem;
- (void)setDelegate:(id)a3;
- (void)setPreventFirstResponder:(BOOL)a3;
@end

@implementation ICInkToolPickerResponder

- (BOOL)canBecomeFirstResponder
{
  return ![(ICInkToolPickerResponder *)self preventFirstResponder];
}

- (id)inputAssistantItem
{
  v2 = [(ICInkToolPickerResponder *)self delegate];
  v3 = [v2 responderToMatch];
  v4 = [v3 inputAssistantItem];

  return v4;
}

- (ICInkToolPickerResponderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICInkToolPickerResponderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)preventFirstResponder
{
  return self->_preventFirstResponder;
}

- (void)setPreventFirstResponder:(BOOL)a3
{
  self->_preventFirstResponder = a3;
}

- (void).cxx_destruct
{
}

@end