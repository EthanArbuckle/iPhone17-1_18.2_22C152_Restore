@interface TUIBindings
- (NSDictionary)data;
- (TUIBindings)initWithData:(id)a3;
- (TUIBindings)parent;
- (id)dataForKey:(id)a3;
@end

@implementation TUIBindings

- (TUIBindings)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIBindings;
  v6 = [(TUIBindings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_data objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (TUIBindings)parent
{
  return self->_parent;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_parent, 0);
}

@end