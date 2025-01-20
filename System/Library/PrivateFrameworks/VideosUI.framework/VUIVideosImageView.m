@interface VUIVideosImageView
+ (id)imageWithImage:(id)a3 existingImageView:(id)a4;
- (UIImage)highlightOrSelectedImage;
- (void)_updateImage;
- (void)setHighlightOrSelectedImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation VUIVideosImageView

+ (id)imageWithImage:(id)a3 existingImageView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [v7 setImage:v5];
  }
  else
  {
    id v7 = (id)[objc_alloc((Class)objc_opt_class()) initWithImage:v5];
  }

  return v7;
}

- (void)setImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUIVideosImageView;
  id v4 = a3;
  [(VUIVideosImageView *)&v7 setImage:v4];
  id v5 = (UIImage *)objc_msgSend(v4, "copy", v7.receiver, v7.super_class);

  flatImage = self->_flatImage;
  self->_flatImage = v5;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIVideosImageView;
  [(VUIVideosImageView *)&v4 setHighlighted:a3];
  [(VUIVideosImageView *)self _updateImage];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_selected = a3;
  [(VUIVideosImageView *)self _updateImage];
}

- (void)_updateImage
{
  p_highlightOrSelectedImage = &self->_highlightOrSelectedImage;
  if (self->_highlightOrSelectedImage)
  {
    if (!self->_selected)
    {
      v6.receiver = self;
      v6.super_class = (Class)VUIVideosImageView;
      if (([(VUIVideosImageView *)&v6 isHighlighted] & 1) == 0) {
        p_highlightOrSelectedImage = &self->_flatImage;
      }
    }
    objc_super v4 = *p_highlightOrSelectedImage;
    v5.receiver = self;
    v5.super_class = (Class)VUIVideosImageView;
    [(VUIVideosImageView *)&v5 setImage:v4];
  }
}

- (UIImage)highlightOrSelectedImage
{
  return self->_highlightOrSelectedImage;
}

- (void)setHighlightOrSelectedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightOrSelectedImage, 0);
  objc_storeStrong((id *)&self->_flatImage, 0);
}

@end