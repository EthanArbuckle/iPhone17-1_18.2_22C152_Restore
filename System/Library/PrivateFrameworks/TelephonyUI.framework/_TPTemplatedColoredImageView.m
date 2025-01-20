@interface _TPTemplatedColoredImageView
- (UIColor)templateImageColor;
- (void)setTemplateImageColor:(id)a3;
@end

@implementation _TPTemplatedColoredImageView

- (void)setTemplateImageColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_templateImageColor = &self->_templateImageColor;
  if (self->_templateImageColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_templateImageColor, a3);
    v7 = [(_TPTemplatedColoredImageView *)self layer];
    objc_msgSend(v7, "setContentsMultiplyColor:", -[UIColor CGColor](*p_templateImageColor, "CGColor"));

    v5 = v8;
  }
}

- (UIColor)templateImageColor
{
  return self->_templateImageColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiplyColorFilter, 0);
  objc_storeStrong((id *)&self->_templateImageColor, 0);
}

@end