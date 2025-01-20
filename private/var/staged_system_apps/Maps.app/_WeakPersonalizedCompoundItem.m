@interface _WeakPersonalizedCompoundItem
- (PersonalizedCompoundItem)item;
- (void)setItem:(id)a3;
@end

@implementation _WeakPersonalizedCompoundItem

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

- (PersonalizedCompoundItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (PersonalizedCompoundItem *)WeakRetained;
}

@end