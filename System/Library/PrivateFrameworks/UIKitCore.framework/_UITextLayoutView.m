@interface _UITextLayoutView
- (id)delegate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation _UITextLayoutView

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained _layoutText];
}

- (void).cxx_destruct
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

@end