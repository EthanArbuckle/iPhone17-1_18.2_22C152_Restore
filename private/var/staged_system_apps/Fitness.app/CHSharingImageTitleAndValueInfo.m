@interface CHSharingImageTitleAndValueInfo
- (NSString)title;
- (NSString)unit;
- (NSString)value;
- (UIColor)valueColor;
- (void)setTitle:(id)a3;
- (void)setUnit:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueColor:(id)a3;
@end

@implementation CHSharingImageTitleAndValueInfo

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (void)setValueColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end