@interface SNNMILNamedValue
- (NSString)name;
- (SNNMILNamedValue)initWithName:(id)a3;
@end

@implementation SNNMILNamedValue

- (SNNMILNamedValue)initWithName:(id)a3
{
  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILNamedValue;
  v5 = [(SNNMILValue *)&v8 init];
  name = v5->_name;
  v5->_name = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end