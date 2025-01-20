@interface RUISelectOption
- (NSString)label;
- (NSString)value;
- (id)description;
- (void)setLabel:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RUISelectOption

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(RUISelectOption *)self label];
  v6 = [(RUISelectOption *)self value];
  v7 = [v3 stringWithFormat:@"<%@: %p, label: '%@', value: '%@'>", v4, self, v5, v6];

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
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
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end