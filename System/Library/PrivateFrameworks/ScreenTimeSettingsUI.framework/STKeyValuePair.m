@interface STKeyValuePair
- (STKeyValuePair)init;
- (STKeyValuePair)initWithKey:(id)a3 value:(id)a4;
- (id)key;
- (id)value;
@end

@implementation STKeyValuePair

- (STKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STKeyValuePair;
  v8 = [(STKeyValuePair *)&v13 init];
  id key = v8->_key;
  v8->_id key = v6;
  id v10 = v6;

  id value = v8->_value;
  v8->_id value = v7;

  return v8;
}

- (STKeyValuePair)init
{
  return [(STKeyValuePair *)self initWithKey:0 value:0];
}

- (id)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong(&self->_key, 0);
}

@end