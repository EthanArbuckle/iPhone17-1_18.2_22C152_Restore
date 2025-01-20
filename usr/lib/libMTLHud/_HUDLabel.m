@interface _HUDLabel
- (NSString)value;
- (_HUDLabel)initWithName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _HUDLabel

- (_HUDLabel)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_HUDLabel;
  v3 = [(_HUDRow *)&v7 initWithName:a3];
  v4 = v3;
  if (v3)
  {
    value = v3->_value;
    v3->_value = (NSString *)&stru_26E7C2008;
  }
  return v4;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end