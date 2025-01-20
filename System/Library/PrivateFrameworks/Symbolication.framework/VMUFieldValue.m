@interface VMUFieldValue
- (VMUFieldInfo)field;
- (VMUFieldValue)initWithField:(id)a3 value:(unint64_t)a4;
- (unint64_t)value;
@end

@implementation VMUFieldValue

- (VMUFieldValue)initWithField:(id)a3 value:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMUFieldValue;
  v8 = [(VMUFieldValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_field, a3);
    v9->_value = a4;
  }

  return v9;
}

- (VMUFieldInfo)field
{
  return self->_field;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end