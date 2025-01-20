@interface QLImageItemContents
+ (BOOL)supportsSecureCoding;
- (QLImageItemContents)initWithCoder:(id)a3;
- (QLImageItemContents)initWithImage:(id)a3;
- (UIImage)image;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation QLImageItemContents

- (QLImageItemContents)initWithImage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLImageItemContents;
  v6 = [(QLImageItemContents *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (QLImageItemContents)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLImageItemContents;
  id v5 = [(QLImageItemContents *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v6;
  }
  return v5;
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
}

@end