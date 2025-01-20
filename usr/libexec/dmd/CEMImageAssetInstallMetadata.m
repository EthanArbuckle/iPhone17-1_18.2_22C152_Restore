@interface CEMImageAssetInstallMetadata
+ (BOOL)supportsSecureCoding;
- (CEMImageAssetInstallMetadata)initWithCoder:(id)a3;
- (NSURL)imageURL;
- (id)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation CEMImageAssetInstallMetadata

- (id)dataRepresentation
{
  v2 = [(CEMImageAssetInstallMetadata *)self imageURL];
  v3 = +[NSData dataWithContentsOfURL:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CEMImageAssetInstallMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CEMImageAssetInstallMetadata *)self init];
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CEMImageAssetInstallMetadata *)self imageURL];
  [v4 encodeObject:v5 forKey:@"imageURL"];
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