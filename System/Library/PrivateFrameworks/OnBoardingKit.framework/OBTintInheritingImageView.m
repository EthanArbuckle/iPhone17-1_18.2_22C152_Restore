@interface OBTintInheritingImageView
- (OBTintInheritingImageView)initWithImage:(id)a3 highlightedImage:(id)a4 tintColor:(id)a5;
- (UIImage)originalImage;
- (void)setImage:(id)a3;
- (void)setOriginalImage:(id)a3;
- (void)tintColorDidChange;
@end

@implementation OBTintInheritingImageView

- (OBTintInheritingImageView)initWithImage:(id)a3 highlightedImage:(id)a4 tintColor:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 _flatImageWithColor:v10];
  v15.receiver = self;
  v15.super_class = (Class)OBTintInheritingImageView;
  v13 = [(OBTintInheritingImageView *)&v15 initWithImage:v12 highlightedImage:v11];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_originalImage, a3);
    [(OBTintInheritingImageView *)v13 setTintColor:v10];
  }

  return v13;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalImage, a3);
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OBTintInheritingImageView;
  [(OBTintInheritingImageView *)&v6 setImage:v5];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)OBTintInheritingImageView;
  [(OBTintInheritingImageView *)&v7 tintColorDidChange];
  v3 = [(OBTintInheritingImageView *)self originalImage];
  v4 = [(OBTintInheritingImageView *)self tintColor];
  id v5 = [v3 _flatImageWithColor:v4];
  v6.receiver = self;
  v6.super_class = (Class)OBTintInheritingImageView;
  [(OBTintInheritingImageView *)&v6 setImage:v5];
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end