@interface _UICalendarViewDecorationItem
- (UIView)_decorationView;
- (UIView)_parent;
- (id)_decorationViewForReuseView:(id)a3;
- (id)_decorationViewReusableKey;
- (void)_setDecorationView:(id)a3;
- (void)_setParent:(id)a3;
@end

@implementation _UICalendarViewDecorationItem

- (id)_decorationViewForReuseView:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UICalendarViewDecoration.m" lineNumber:204 description:@"This must be implemented by a decoration subclass"];

  return 0;
}

- (id)_decorationViewReusableKey
{
  return 0;
}

- (UIView)_decorationView
{
  return self->_decorationView;
}

- (void)_setDecorationView:(id)a3
{
}

- (UIView)_parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (UIView *)WeakRetained;
}

- (void)_setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_decorationView, 0);
}

@end