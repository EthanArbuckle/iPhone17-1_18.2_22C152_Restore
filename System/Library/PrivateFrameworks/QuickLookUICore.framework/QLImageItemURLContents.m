@interface QLImageItemURLContents
+ (BOOL)supportsSecureCoding;
+ (id)imageItemContentsWithImage:(id)a3 imageURL:(id)a4;
- (NSURL)imageURL;
- (QLImageItemURLContents)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation QLImageItemURLContents

+ (id)imageItemContentsWithImage:(id)a3 imageURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(QLImageItemContents *)[QLImageItemURLContents alloc] initWithImage:v6];

  [(QLImageItemURLContents *)v7 setImageURL:v5];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (QLImageItemURLContents)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLImageItemURLContents;
  id v5 = [(QLImageItemContents *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end