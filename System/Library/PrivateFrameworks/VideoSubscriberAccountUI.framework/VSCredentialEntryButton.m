@interface VSCredentialEntryButton
- (NSString)title;
- (VSCredentialEntryViewModel)owningViewModel;
- (void)setOwningViewModel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSCredentialEntryButton

- (VSCredentialEntryViewModel)owningViewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewModel);
  return (VSCredentialEntryViewModel *)WeakRetained;
}

- (void)setOwningViewModel:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_owningViewModel);
}

@end