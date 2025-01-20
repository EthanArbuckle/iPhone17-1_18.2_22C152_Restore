@interface TMLValue
- (TMLValue)initWithValue:(id)a3 valueType:(unint64_t)a4;
- (id)value;
- (unint64_t)valueType;
@end

@implementation TMLValue

- (TMLValue)initWithValue:(id)a3 valueType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TMLValue;
  v8 = [(TMLValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_valueType = a4;
  }

  return v9;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end