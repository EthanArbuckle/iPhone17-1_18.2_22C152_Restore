@interface NPKPaymentProvisioningFlowPickerItem
+ (id)itemWithIdentifier:(id)a3 products:(id)a4;
+ (id)itemWithIdentifier:(id)a3 title:(id)a4 products:(id)a5;
- (NSArray)products;
- (NSString)identifier;
- (NSString)title;
- (id)description;
- (void)setProducts:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowPickerItem

+ (id)itemWithIdentifier:(id)a3 title:(id)a4 products:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init((Class)a1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 3, a3);
    uint64_t v14 = [v10 copy];
    v15 = (void *)v13[1];
    v13[1] = v14;

    uint64_t v16 = [v11 copy];
    v17 = (void *)v13[2];
    v13[2] = v16;
  }
  return v13;
}

+ (id)itemWithIdentifier:(id)a3 products:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)a1);
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 3, a3);
    uint64_t v11 = [v8 copy];
    id v12 = (void *)v10[2];
    v10[2] = v11;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NPKPaymentProvisioningFlowPickerItem *)self title];
  v6 = [(NPKPaymentProvisioningFlowPickerItem *)self products];
  id v7 = [v3 stringWithFormat:@"<%@: %p title \"%@\" products %@>", v4, self, v5, v6];

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)products
{
  return self->_products;
}

- (void)setProducts:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_products, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end