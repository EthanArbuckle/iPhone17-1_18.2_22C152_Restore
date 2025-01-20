@interface VSCredentialEntryTableView
- (VSCredentialEntryViewController_iOS)viewController;
- (void)layoutSubviews;
- (void)setViewController:(id)a3;
@end

@implementation VSCredentialEntryTableView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryTableView;
  [(VSCredentialEntryTableView *)&v4 layoutSubviews];
  v3 = [(VSCredentialEntryTableView *)self viewController];
  [v3 _updateLinkButtonLayout];
}

- (VSCredentialEntryViewController_iOS)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (VSCredentialEntryViewController_iOS *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end