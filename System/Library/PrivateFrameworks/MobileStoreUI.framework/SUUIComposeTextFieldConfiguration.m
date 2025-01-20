@interface SUUIComposeTextFieldConfiguration
- (BOOL)isRequired;
- (NSString)label;
- (NSString)placeholder;
- (NSString)value;
- (UIEdgeInsets)borderInsets;
- (int64_t)columnIndex;
- (unint64_t)maxLength;
- (void)setBorderInsets:(UIEdgeInsets)a3;
- (void)setColumnIndex:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation SUUIComposeTextFieldConfiguration

- (UIEdgeInsets)borderInsets
{
  double top = self->_borderInsets.top;
  double left = self->_borderInsets.left;
  double bottom = self->_borderInsets.bottom;
  double right = self->_borderInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
}

- (int64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(int64_t)a3
{
  self->_columnIndex = a3;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
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
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end