@interface searchColumn
- (int)propNumber;
- (rowVariant)propValue;
- (searchColumn)initWithPropertyNumber:(int)a3 RVariant:(id)a4;
- (void)setPropNumber:(int)a3;
- (void)setPropValue:(id)a3;
@end

@implementation searchColumn

- (searchColumn)initWithPropertyNumber:(int)a3 RVariant:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)searchColumn;
  v8 = [(searchColumn *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_propNumber = a3;
    objc_storeStrong((id *)&v8->_propValue, a4);
  }

  return v9;
}

- (int)propNumber
{
  return self->_propNumber;
}

- (void)setPropNumber:(int)a3
{
  self->_propNumber = a3;
}

- (rowVariant)propValue
{
  return (rowVariant *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPropValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end