@interface VUIUpNextStateView
- (UIImage)image;
- (VUILabel)label;
- (void)setImage:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation VUIUpNextStateView

- (VUILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end