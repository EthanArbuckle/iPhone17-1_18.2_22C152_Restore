@interface _TUIDynamicValueProperty
- (NSString)property;
- (TUIDynamicValue)upstreamValue;
- (_TUIDynamicValueProperty)initWithValue:(id)a3 property:(id)a4;
- (id)newInstanceWithObserver:(id)a3;
@end

@implementation _TUIDynamicValueProperty

- (_TUIDynamicValueProperty)initWithValue:(id)a3 property:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicValueProperty;
  v9 = [(TUIDynamicValue *)&v12 initWithValue:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a4);
    objc_storeStrong((id *)&v10->_upstreamValue, a3);
  }

  return v10;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4 = a3;
  v5 = [[_TUIDynamicValuePropertyInstance alloc] initWithDynamicValue:self observer:v4];

  return v5;
}

- (NSString)property
{
  return self->_property;
}

- (TUIDynamicValue)upstreamValue
{
  return self->_upstreamValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstreamValue, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

@end