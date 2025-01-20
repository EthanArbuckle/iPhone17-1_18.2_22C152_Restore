@interface SearchUIContactQuickActionView
- (BOOL)enabled;
- (NSString)title;
- (SearchUIContactButtonItem)buttonItem;
- (SearchUIContactButtonItemGenerator)generator;
- (void)setButtonItem:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGenerator:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SearchUIContactQuickActionView

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v3 = [(SearchUIContactQuickActionView *)self generator];
    [v3 updateButtons];
  }
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (SearchUIContactButtonItemGenerator)generator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  return (SearchUIContactButtonItemGenerator *)WeakRetained;
}

- (void)setGenerator:(id)a3
{
}

- (SearchUIContactButtonItem)buttonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonItem);
  return (SearchUIContactButtonItem *)WeakRetained;
}

- (void)setButtonItem:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonItem);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->title, 0);
}

@end