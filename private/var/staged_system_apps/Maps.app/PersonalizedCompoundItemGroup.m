@interface PersonalizedCompoundItemGroup
- (NSArray)items;
- (PersonalizedCompoundItemGroup)initWithItems:(id)a3;
@end

@implementation PersonalizedCompoundItemGroup

- (PersonalizedCompoundItemGroup)initWithItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedCompoundItemGroup;
  v5 = [(PersonalizedCompoundItemGroup *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    items = v5->_items;
    v5->_items = v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)items
{
  return self->_items;
}

@end