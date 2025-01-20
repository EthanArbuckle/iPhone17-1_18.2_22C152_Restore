@interface TUIButtonBarAppearanceDelegate
- (TUIButtonBarAppearanceDelegate)initWithSystemInputAssistantView:(id)a3;
- (TUISystemInputAssistantView)systemInputAssistantView;
- (UIColor)tintColor;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (void)setSystemInputAssistantView:(id)a3;
@end

@implementation TUIButtonBarAppearanceDelegate

- (void).cxx_destruct
{
}

- (void)setSystemInputAssistantView:(id)a3
{
}

- (TUISystemInputAssistantView)systemInputAssistantView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemInputAssistantView);
  return (TUISystemInputAssistantView *)WeakRetained;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  v3 = [(TUIButtonBarAppearanceDelegate *)self systemInputAssistantView];
  v4 = [v3 style];
  v5 = [v4 barButtonImageSymbolConfiguration];

  v6 = [(TUIButtonBarAppearanceDelegate *)self systemInputAssistantView];
  v7 = [v6 locale];

  if (v7)
  {
    v8 = [(TUIButtonBarAppearanceDelegate *)self systemInputAssistantView];
    v9 = [v8 locale];
    uint64_t v10 = [v5 configurationWithLocale:v9];

    v5 = (void *)v10;
  }
  return (UIImageSymbolConfiguration *)v5;
}

- (UIColor)tintColor
{
  v3 = [(TUIButtonBarAppearanceDelegate *)self systemInputAssistantView];
  v4 = [v3 style];
  int v5 = [v4 enableButtonTintColor];

  if (v5)
  {
    v6 = [(TUIButtonBarAppearanceDelegate *)self systemInputAssistantView];
    v7 = [v6 leftButtonBar];
    v8 = [v7 visualProvider];
    v9 = [v8 tintColor];
  }
  else
  {
    v9 = 0;
  }
  return (UIColor *)v9;
}

- (TUIButtonBarAppearanceDelegate)initWithSystemInputAssistantView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIButtonBarAppearanceDelegate;
  int v5 = [(TUIButtonBarAppearanceDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_systemInputAssistantView, v4);
  }

  return v6;
}

@end