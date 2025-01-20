@interface JSAProfileBagKeyEntry
- (JSAProfileBagKeyEntry)initWithKey:(id)a3 valueType:(unint64_t)a4;
- (JSAProfileBagKeyEntry)initWithKeyValue:(id)a3 valueTypeValue:(id)a4;
- (NSString)key;
- (id)description;
- (unint64_t)valueType;
@end

@implementation JSAProfileBagKeyEntry

- (JSAProfileBagKeyEntry)initWithKey:(id)a3 valueType:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JSAProfileBagKeyEntry;
  v7 = [(JSAProfileBagKeyEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    key = v7->_key;
    v7->_key = v8;

    v7->_valueType = a4;
  }

  return v7;
}

- (JSAProfileBagKeyEntry)initWithKeyValue:(id)a3 valueTypeValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isString])
  {
    v8 = [v6 toString];
  }
  else
  {
    v8 = 0;
  }
  if ([v7 isString])
  {
    v9 = [v7 toString];
  }
  else
  {
    v9 = 0;
  }
  if ([v9 isEqualToString:@"Array"])
  {
    uint64_t v10 = 0;
  }
  else if ([v9 isEqualToString:@"Bool"])
  {
    uint64_t v10 = 1;
  }
  else if ([v9 isEqualToString:@"Dictionary"])
  {
    uint64_t v10 = 6;
  }
  else if ([v9 isEqualToString:@"Double"])
  {
    uint64_t v10 = 2;
  }
  else if ([v9 isEqualToString:@"Integer"])
  {
    uint64_t v10 = 3;
  }
  else if ([v9 isEqualToString:@"URL"])
  {
    uint64_t v10 = 5;
  }
  else
  {
    uint64_t v10 = 4;
  }
  objc_super v11 = [(JSAProfileBagKeyEntry *)self initWithKey:v8 valueType:v10];

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(JSAProfileBagKeyEntry *)self key];
  [(JSAProfileBagKeyEntry *)self valueType];
  id v6 = NSStringFromBagValueType();
  id v7 = +[NSString stringWithFormat:@"<%@ %p key=%@ valueType=%@>", v4, self, v5, v6];

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
}

@end