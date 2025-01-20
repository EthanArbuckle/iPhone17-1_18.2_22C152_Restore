@interface SNNMILListValue
- (NSArray)values;
- (SNNMILListValue)initWithValues:(id)a3;
@end

@implementation SNNMILListValue

- (SNNMILListValue)initWithValues:(id)a3
{
  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILListValue;
  v5 = [(SNNMILValue *)&v8 init];
  values = v5->_values;
  v5->_values = v4;

  return v5;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end