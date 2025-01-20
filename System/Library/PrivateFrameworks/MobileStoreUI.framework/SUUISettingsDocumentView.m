@interface SUUISettingsDocumentView
- (SUUISettingsDocumentViewDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SUUISettingsDocumentView

- (void)tintColorDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)SUUISettingsDocumentView;
  [(SUUISettingsDocumentView *)&v8 tintColorDidChange];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 settingsDocumentViewDidChangeTintColor:self];
    }
  }
}

- (SUUISettingsDocumentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISettingsDocumentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end