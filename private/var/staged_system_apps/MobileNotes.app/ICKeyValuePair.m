@interface ICKeyValuePair
- (ICKeyValuePair)initWithKey:(id)a3 value:(id)a4;
- (NSString)key;
- (id)value;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ICKeyValuePair

- (ICKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICKeyValuePair;
  v9 = [(ICKeyValuePair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end