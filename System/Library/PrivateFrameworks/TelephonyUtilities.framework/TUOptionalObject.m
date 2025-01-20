@interface TUOptionalObject
- (TUOptionalObject)initWithValue:(id)a3;
- (id)value;
@end

@implementation TUOptionalObject

- (id)value
{
  return self->_value;
}

- (TUOptionalObject)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUOptionalObject;
  v5 = [(TUOptionalObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    id value = v5->_value;
    v5->_id value = (id)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end