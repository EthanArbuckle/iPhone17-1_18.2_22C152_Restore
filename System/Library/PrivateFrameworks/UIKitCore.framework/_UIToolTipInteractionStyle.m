@interface _UIToolTipInteractionStyle
- (UIToolTipProvider)provider;
- (UIView)view;
- (_UIToolTipInteractionStyle)initWithView:(id)a3 provider:(id)a4;
@end

@implementation _UIToolTipInteractionStyle

- (_UIToolTipInteractionStyle)initWithView:(id)a3 provider:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIToolTipInteractionStyle;
  id v5 = a4;
  id v6 = a3;
  v7 = [(_UIToolTipInteractionStyle *)&v9 init];
  objc_storeWeak((id *)&v7->_view, v6);

  objc_storeWeak((id *)&v7->_provider, v5);
  return v7;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (UIToolTipProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (UIToolTipProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_view);
}

@end