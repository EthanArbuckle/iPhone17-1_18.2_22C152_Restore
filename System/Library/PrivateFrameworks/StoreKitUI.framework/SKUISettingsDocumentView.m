@interface SKUISettingsDocumentView
- (SKUISettingsDocumentViewDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SKUISettingsDocumentView

- (void)tintColorDidChange
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsDocumentView tintColorDidChange]";
}

- (SKUISettingsDocumentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISettingsDocumentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end