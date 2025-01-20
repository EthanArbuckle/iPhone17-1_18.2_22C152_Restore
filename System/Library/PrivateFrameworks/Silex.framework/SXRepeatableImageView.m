@interface SXRepeatableImageView
- (BOOL)isAccessibilityElement;
- (UIImage)repeatingImage;
- (void)setImage:(id)a3;
- (void)setRepeatingImage:(id)a3;
@end

@implementation SXRepeatableImageView

- (void)setImage:(id)a3
{
  v4 = (void *)MEMORY[0x263F1C550];
  id v5 = a3;
  id v6 = [v4 colorWithPatternImage:v5];
  [(SXRepeatableImageView *)self setBackgroundColor:v6];
  [(SXRepeatableImageView *)self setRepeatingImage:v5];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (UIImage)repeatingImage
{
  return self->_repeatingImage;
}

- (void)setRepeatingImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end