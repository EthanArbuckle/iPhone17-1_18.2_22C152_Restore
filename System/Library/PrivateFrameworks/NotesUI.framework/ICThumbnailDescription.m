@interface ICThumbnailDescription
- (BOOL)isCached;
- (ICThumbnailConfiguration)configuration;
- (ICThumbnailDescription)initWithConfiguration:(id)a3;
- (NSDate)creationDate;
- (NSError)error;
- (NSSet)associatedObjectIdentifiers;
- (UIImage)image;
- (double)fetchDuration;
- (int64_t)preferredContentMode;
- (int64_t)thumbnailDecorationType;
- (unint64_t)imageScaling;
- (void)setAssociatedObjectIdentifiers:(id)a3;
- (void)setCached:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setError:(id)a3;
- (void)setFetchDuration:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageScaling:(unint64_t)a3;
- (void)setThumbnailDecorationType:(int64_t)a3;
@end

@implementation ICThumbnailDescription

- (UIImage)image
{
  return self->_image;
}

- (ICThumbnailConfiguration)configuration
{
  return self->_configuration;
}

- (void)setImage:(id)a3
{
}

- (void)setFetchDuration:(double)a3
{
  self->_fetchDuration = a3;
}

- (void)setCreationDate:(id)a3
{
}

- (ICThumbnailDescription)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICThumbnailDescription;
  v6 = [(ICThumbnailDescription *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v11 = [v5 associatedObjectIdentifier];
    uint64_t v12 = objc_msgSend(v10, "ic_setFromNonNilObject:", v11);
    associatedObjectIdentifiers = v7->_associatedObjectIdentifiers;
    v7->_associatedObjectIdentifiers = (NSSet *)v12;
  }
  return v7;
}

- (NSSet)associatedObjectIdentifiers
{
  return self->_associatedObjectIdentifiers;
}

- (int64_t)preferredContentMode
{
  unint64_t v2 = [(ICThumbnailDescription *)self imageScaling];
  int64_t v3 = 1;
  if (v2 != 2) {
    int64_t v3 = 2;
  }
  if (v2) {
    return v3;
  }
  else {
    return 4;
  }
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (double)fetchDuration
{
  return self->_fetchDuration;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
}

- (int64_t)thumbnailDecorationType
{
  return self->_thumbnailDecorationType;
}

- (void)setThumbnailDecorationType:(int64_t)a3
{
  self->_thumbnailDecorationType = a3;
}

- (void)setAssociatedObjectIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end