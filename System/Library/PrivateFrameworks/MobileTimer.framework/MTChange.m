@interface MTChange
- (MTChange)initWithProperty:(id)a3 changedValue:(id)a4 originalValue:(id)a5;
- (NSString)property;
- (id)changedValue;
- (id)description;
- (id)originalValue;
- (void)setChangedValue:(id)a3;
- (void)setOriginalValue:(id)a3;
- (void)setProperty:(id)a3;
@end

@implementation MTChange

- (MTChange)initWithProperty:(id)a3 changedValue:(id)a4 originalValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTChange;
  v11 = [(MTChange *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    property = v11->_property;
    v11->_property = (NSString *)v12;

    objc_storeStrong(&v11->_changedValue, a4);
    objc_storeStrong(&v11->_originalValue, a5);
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@ = %@ (was %@)>", objc_opt_class(), self, self->_property, self->_changedValue, self->_originalValue];
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
}

- (id)changedValue
{
  return self->_changedValue;
}

- (void)setChangedValue:(id)a3
{
}

- (id)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_originalValue, 0);
  objc_storeStrong(&self->_changedValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end