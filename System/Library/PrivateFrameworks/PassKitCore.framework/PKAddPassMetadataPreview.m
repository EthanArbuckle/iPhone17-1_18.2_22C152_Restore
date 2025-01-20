@interface PKAddPassMetadataPreview
+ (BOOL)supportsSecureCoding;
+ (id)previewWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4;
- (CGImage)passThumbnailImage;
- (NSString)localizedDescription;
- (NSURL)thumbnailURL;
- (PKAddPassMetadataPreview)initWithCoder:(id)a3;
- (PKAddPassMetadataPreview)initWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4;
- (PKImage)pkPassThumbnailImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setPassThumbnailImage:(CGImage *)a3;
- (void)setPkPassThumbnailImage:(id)a3;
- (void)setThumbnailURL:(id)a3;
@end

@implementation PKAddPassMetadataPreview

+ (id)previewWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPassThumbnail:a3 localizedDescription:v5];

  return v6;
}

- (PKAddPassMetadataPreview)initWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4
{
  id v7 = a4;
  v8 = [(PKAddPassMetadataPreview *)self init];
  v9 = v8;
  if (v8)
  {
    [(PKAddPassMetadataPreview *)v8 setPassThumbnailImage:a3];
    objc_storeStrong((id *)&v9->_localizedDescription, a4);
  }

  return v9;
}

- (CGImage)passThumbnailImage
{
  return [(PKImage *)self->_pkPassThumbnailImage imageRef];
}

- (void)setPassThumbnailImage:(CGImage *)a3
{
  if (a3)
  {
    v4 = [[PKImage alloc] initWithCGImage:a3 scale:1 orientation:PKScreenScale()];
    pkPassThumbnailImage = self->_pkPassThumbnailImage;
    self->_pkPassThumbnailImage = v4;
  }
  else
  {
    pkPassThumbnailImage = self->_pkPassThumbnailImage;
    self->_pkPassThumbnailImage = 0;
  }
}

- (PKAddPassMetadataPreview)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAddPassMetadataPreview;
  id v5 = [(PKAddPassMetadataPreview *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailImage"];
    pkPassThumbnailImage = v5->_pkPassThumbnailImage;
    v5->_pkPassThumbnailImage = (PKImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailImageURL"];
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSURL *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pkPassThumbnailImage = self->_pkPassThumbnailImage;
  id v5 = a3;
  [v5 encodeObject:pkPassThumbnailImage forKey:@"thumbnailImage"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v5 encodeObject:self->_thumbnailURL forKey:@"thumbnailImageURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(PKAddPassMetadataPreview *)self _extendableDescription:v3];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)_extendableDescription:(id)a3
{
  localizedDescription = self->_localizedDescription;
  id v5 = a3;
  [v5 appendFormat:@"localizedDescription: '%@'; ", localizedDescription];
  [v5 appendFormat:@"thumbnailURL: '%@'; ", self->_thumbnailURL];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_pkPassThumbnailImage);
  uint64_t v5 = [(NSString *)self->_localizedDescription copy];
  uint64_t v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  uint64_t v7 = [(NSURL *)self->_thumbnailURL copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  return (id)v4;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (PKImage)pkPassThumbnailImage
{
  return self->_pkPassThumbnailImage;
}

- (void)setPkPassThumbnailImage:(id)a3
{
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_pkPassThumbnailImage, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end