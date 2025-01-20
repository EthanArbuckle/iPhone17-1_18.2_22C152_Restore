@interface PKStackedTextItemGroup
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (PKStackedTextItemGroup)init;
- (PKStackedTextItemGroup)initWithItems:(id)a3;
- (unint64_t)hash;
@end

@implementation PKStackedTextItemGroup

- (PKStackedTextItemGroup)init
{
  return [(PKStackedTextItemGroup *)self initWithItems:0];
}

- (PKStackedTextItemGroup)initWithItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKStackedTextItemGroup;
  v5 = [(PKStackedTextItemGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0) {
    char v5 = PKEqualObjects();
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_items hash];
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end