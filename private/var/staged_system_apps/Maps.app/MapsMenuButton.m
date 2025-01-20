@interface MapsMenuButton
- (MapsMenuButton)initWithDelegate:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation MapsMenuButton

- (MapsMenuButton)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MapsMenuButton;
  v5 = -[MapsMenuButton initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MapsMenuButton;
  [(MapsMenuButton *)&v12 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:v8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(self) = objc_opt_respondsToSelector();

  if (self)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 menuWillDismissWithAnimator:v8];
  }
}

- (void).cxx_destruct
{
}

@end