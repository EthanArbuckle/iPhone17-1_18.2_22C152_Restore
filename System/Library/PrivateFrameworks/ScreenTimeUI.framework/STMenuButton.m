@interface STMenuButton
- (STMenuButtonDelegate)delegate;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation STMenuButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STMenuButton;
  if ([(STMenuButton *)&v13 respondsToSelector:sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_])
  {
    v12.receiver = self;
    v12.super_class = (Class)STMenuButton;
    [(STMenuButton *)&v12 contextMenuInteraction:v8 willDisplayMenuForConfiguration:v9 animator:v10];
  }
  v11 = [(STMenuButton *)self delegate];
  [v11 contextMenuWillDisplayForButton:self];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(STMenuButton *)self delegate];
  [v11 contextMenuWillEndForButton:self];

  v13.receiver = self;
  v13.super_class = (Class)STMenuButton;
  if ([(STMenuButton *)&v13 respondsToSelector:sel_contextMenuInteraction_willEndForConfiguration_animator_])
  {
    v12.receiver = self;
    v12.super_class = (Class)STMenuButton;
    [(STMenuButton *)&v12 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];
  }
}

- (STMenuButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STMenuButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end