@interface _UIBannerContent
+ (BOOL)supportsSecureCoding;
+ (_UIBannerContent)bannerContentWithTitle:(id)a3;
- (NSString)body;
- (NSString)imageName;
- (NSString)title;
- (UIColor)backgroundColor;
- (UIColor)contentColor;
- (UIImage)image;
- (_UIBannerContent)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBody:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIBannerContent

+ (_UIBannerContent)bannerContentWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setTitle:v4];

  return (_UIBannerContent *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBannerContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIBannerContent *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentColor"];
    contentColor = v5->_contentColor;
    v5->_contentColor = (UIColor *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_body forKey:@"body"];
  [v5 encodeObject:self->_imageName forKey:@"imageName"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v5 encodeObject:self->_contentColor forKey:@"contentColor"];
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    if (self->_imageName)
    {
      id v4 = +[UIImage kitImageNamed:](UIImage, "kitImageNamed:");
      id v5 = [v4 imageWithRenderingMode:2];
      uint64_t v6 = self->_image;
      self->_image = v5;

      image = self->_image;
    }
    else
    {
      image = 0;
    }
  }
  return image;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end