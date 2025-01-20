@interface SUComposeTextFieldConfiguration
- (BOOL)isRequired;
- (NSString)label;
- (NSString)placeholder;
- (NSString)value;
- (UIEdgeInsets)borderInsets;
- (unint64_t)maxLength;
- (void)dealloc;
- (void)setBorderInsets:(UIEdgeInsets)a3;
- (void)setLabel:(id)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation SUComposeTextFieldConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUComposeTextFieldConfiguration;
  [(SUComposeTextFieldConfiguration *)&v3 dealloc];
}

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

@end