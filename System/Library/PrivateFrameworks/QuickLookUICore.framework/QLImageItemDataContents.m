@interface QLImageItemDataContents
+ (BOOL)supportsSecureCoding;
+ (id)imageItemContentsWithImage:(id)a3 imageData:(id)a4;
- (NSData)imageData;
- (QLImageItemDataContents)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setImageData:(id)a3;
@end

@implementation QLImageItemDataContents

+ (id)imageItemContentsWithImage:(id)a3 imageData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setImage:v6];

  [v7 setImageData:v5];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (QLImageItemDataContents)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLImageItemDataContents;
  id v5 = [(QLImageItemContents *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;
  }
  return v5;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end