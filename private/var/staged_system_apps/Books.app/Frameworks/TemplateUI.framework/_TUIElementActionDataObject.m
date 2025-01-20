@interface _TUIElementActionDataObject
- (NSString)key;
- (id)value;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _TUIElementActionDataObject

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
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

  objc_storeStrong((id *)&self->_key, 0);
}

@end