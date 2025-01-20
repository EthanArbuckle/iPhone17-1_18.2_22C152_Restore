@interface PKSharingMessageDisplayInformation
+ (BOOL)supportsSecureCoding;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)imageURL;
- (NSURL)openGraphURL;
- (PKSharingMessageDisplayInformation)init;
- (PKSharingMessageDisplayInformation)initWithCoder:(id)a3;
- (PKSharingMessageDisplayInformation)initWithTitle:(id)a3 subtitle:(id)a4 imageURL:(id)a5;
- (PKSharingMessageDisplayInformation)initWithTitle:(id)a3 subtitle:(id)a4 imageURL:(id)a5 openGraphURL:(id)a6;
- (id)_initWithTitle:(void *)a3 subtitle:(void *)a4 imageURL:(void *)a5 openGraphURL:;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOpenGraphURL:(id)a3;
@end

@implementation PKSharingMessageDisplayInformation

- (PKSharingMessageDisplayInformation)init
{
  return 0;
}

- (PKSharingMessageDisplayInformation)initWithTitle:(id)a3 subtitle:(id)a4 imageURL:(id)a5
{
  return (PKSharingMessageDisplayInformation *)-[PKSharingMessageDisplayInformation _initWithTitle:subtitle:imageURL:openGraphURL:]((id *)&self->super.isa, a3, a4, a5, 0);
}

- (id)_initWithTitle:(void *)a3 subtitle:(void *)a4 imageURL:(void *)a5 openGraphURL:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)PKSharingMessageDisplayInformation;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (PKSharingMessageDisplayInformation)initWithTitle:(id)a3 subtitle:(id)a4 imageURL:(id)a5 openGraphURL:(id)a6
{
  return (PKSharingMessageDisplayInformation *)-[PKSharingMessageDisplayInformation _initWithTitle:subtitle:imageURL:openGraphURL:]((id *)&self->super.isa, a3, a4, a5, a6);
}

- (PKSharingMessageDisplayInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingMessageDisplayInformation;
  v5 = [(PKSharingMessageDisplayInformation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openGraphURL"];
    openGraphURL = v5->_openGraphURL;
    v5->_openGraphURL = (NSURL *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_imageURL forKey:@"imageURL"];
  [v5 encodeObject:self->_openGraphURL forKey:@"openGraphURL"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"subtitle: '%@'; ", self->_subtitle];
  [v3 appendFormat:@"imageURL: '%@'; ", self->_imageURL];
  [v3 appendFormat:@"openGraphURL: '%@'; ", self->_openGraphURL];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)openGraphURL
{
  return self->_openGraphURL;
}

- (void)setOpenGraphURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openGraphURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end