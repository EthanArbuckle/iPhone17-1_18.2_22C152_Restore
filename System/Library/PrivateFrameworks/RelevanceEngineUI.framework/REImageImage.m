@interface REImageImage
- (BOOL)isEqual:(id)a3;
- (REImageImage)initWithCoder:(id)a3;
- (REImageImage)initWithImage:(id)a3;
- (UIImage)uiImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)image;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUiImage:(id)a3;
@end

@implementation REImageImage

- (REImageImage)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REImageImage;
  v6 = [(REImageImage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiImage, a3);
  }

  return v7;
}

- (id)image
{
  return self->_uiImage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uiImage = self->_uiImage;

  return (id)[v4 initWithImage:uiImage];
}

- (unint64_t)hash
{
  return [(UIImage *)self->_uiImage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 uiImage];
    v6 = v5;
    if (v5 == self->_uiImage) {
      char v7 = 1;
    }
    else {
      char v7 = -[UIImage isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (REImageImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedImage"];

  v6 = REDecodeImage(v5);
  char v7 = [(REImageImage *)self initWithImage:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uiImage = self->_uiImage;
  id v4 = a3;
  REEncodeImage(uiImage);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"encodedImage"];
}

- (UIImage)uiImage
{
  return self->_uiImage;
}

- (void)setUiImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end