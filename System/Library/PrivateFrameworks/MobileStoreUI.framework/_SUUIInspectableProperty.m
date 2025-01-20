@interface _SUUIInspectableProperty
- (NSString)friendlyName;
- (NSString)valueString;
- (id)value;
- (void)setFriendlyName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _SUUIInspectableProperty

- (NSString)valueString
{
  v3 = [(_SUUIInspectableProperty *)self value];

  if (v3)
  {
    v4 = [(_SUUIInspectableProperty *)self value];
    v5 = [v4 debugDescription];
  }
  else
  {
    v5 = @"<nil>";
  }
  return (NSString *)v5;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
}

@end