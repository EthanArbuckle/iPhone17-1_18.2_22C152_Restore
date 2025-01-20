@interface PKPassPersonalizationImageSet
+ (BOOL)shouldCache;
+ (BOOL)supportsSecureCoding;
+ (int64_t)imageSetType;
- (BOOL)isEqual:(id)a3;
- (PKImage)logoImage;
- (PKPassPersonalizationImageSet)initWithCoder:(id)a3;
- (PKPassPersonalizationImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setLogoImage:(id)a3;
@end

@implementation PKPassPersonalizationImageSet

- (PKPassPersonalizationImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKPassPersonalizationImageSet;
  v12 = [(PKImageSet *)&v17 initWithDisplayProfile:a3 fileURL:v10 screenScale:v11 suffix:a5];
  if (v12)
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithURL:v10];
    uint64_t v14 = +[PKImage imageNamed:@"personalizationLogo" inBundle:v13 screenScale:v11 suffix:a5];
    logoImage = v12->_logoImage;
    v12->_logoImage = (PKImage *)v14;
  }
  return v12;
}

+ (int64_t)imageSetType
{
  return 3;
}

+ (BOOL)shouldCache
{
  return 0;
}

- (void)preheatImages
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassPersonalizationImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassPersonalizationImageSet;
  v5 = [(PKImageSet *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoImage"];
    logoImage = v5->_logoImage;
    v5->_logoImage = (PKImage *)v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassPersonalizationImageSet;
  id v5 = [(PKImageSet *)&v7 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_logoImage forKey:@"logoImage"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PKImageSet *)self _isSetImage:self->_logoImage equalToImage:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PKImage *)self->_logoImage imageHash];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PKImage)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end