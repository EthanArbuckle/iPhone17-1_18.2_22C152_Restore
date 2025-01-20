@interface CNVCardPropertyItem
+ (id)itemWithValue:(id)a3 label:(id)a4 identifier:(id)a5;
- (CNVCardPropertyItem)initWithValue:(id)a3 label:(id)a4 identifier:(id)a5;
- (NSString)identifier;
- (NSString)label;
- (id)description;
- (id)value;
@end

@implementation CNVCardPropertyItem

+ (id)itemWithValue:(id)a3 label:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithValue:v10 label:v9 identifier:v8];

  return v11;
}

- (CNVCardPropertyItem)initWithValue:(id)a3 label:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNVCardPropertyItem *)self init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id value = v11->_value;
    v11->_id value = (id)v12;

    uint64_t v14 = [v9 copy];
    label = v11->_label;
    v11->_label = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"value" object:self->_value];
  id v5 = (id)[v3 appendName:@"label" object:self->_label];
  v6 = [v3 build];

  return v6;
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_value, 0);
}

@end