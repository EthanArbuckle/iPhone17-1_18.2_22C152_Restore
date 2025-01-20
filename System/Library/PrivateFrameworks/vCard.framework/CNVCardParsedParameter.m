@interface CNVCardParsedParameter
+ (id)parameterWithName:(id)a3 values:(id)a4;
- (CNVCardParsedParameter)initWithName:(id)a3 values:(id)a4;
- (NSArray)values;
- (NSString)name;
- (id)description;
@end

@implementation CNVCardParsedParameter

+ (id)parameterWithName:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 values:v6];

  return v8;
}

- (CNVCardParsedParameter)initWithName:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNVCardParsedParameter;
  v8 = [(CNVCardParsedParameter *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    values = v8->_values;
    v8->_values = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(CNVCardParsedParameter *)self name];
  id v7 = [(CNVCardParsedParameter *)self values];
  v8 = [v7 componentsJoinedByString:@","];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p name='%@' values='%@'>", v5, self, v6, v8];

  return v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end