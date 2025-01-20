@interface PKPassPreviewImageSet
+ (BOOL)supportsSecureCoding;
+ (id)archiveName;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (BOOL)isEqual:(id)a3;
- (PKImage)iconImage;
- (PKImage)notificationIconImage;
- (PKImage)rawIcon;
- (PKPassPreviewImageSet)initWithCoder:(id)a3;
- (PKPassPreviewImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setIconImage:(id)a3;
- (void)setNotificationIconImage:(id)a3;
- (void)setRawIcon:(id)a3;
@end

@implementation PKPassPreviewImageSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImage)iconImage
{
  return self->_iconImage;
}

+ (unsigned)currentVersion
{
  return 20;
}

+ (id)archiveName
{
  return @"Preview";
}

+ (int64_t)imageSetType
{
  return 1;
}

- (PKPassPreviewImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassPreviewImageSet;
  v5 = [(PKImageSet *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconImage"];
    iconImage = v5->_iconImage;
    v5->_iconImage = (PKImage *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationIconImage"];
    notificationIconImage = v5->_notificationIconImage;
    v5->_notificationIconImage = (PKImage *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawIcon"];
    rawIcon = v5->_rawIcon;
    v5->_rawIcon = (PKImage *)v11;
  }

  return v5;
}

- (PKPassPreviewImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKPassPreviewImageSet;
  v13 = [(PKImageSet *)&v32 initWithDisplayProfile:v10 fileURL:v11 screenScale:v12 suffix:a5];
  if (v13)
  {
    context = (void *)MEMORY[0x192FDC630]();
    objc_super v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    v15 = +[PKImage imageNamed:@"icon" inBundle:v14];
    objc_storeStrong((id *)&v13->_rawIcon, v15);
    v16 = (void *)MEMORY[0x192FDC630]();
    double v31 = 1.0;
    v17 = (PKImage *)PKPassIconImage(v15, &v31);
    uint64_t v18 = __75__PKPassPreviewImageSet_initWithDisplayProfile_fileURL_screenScale_suffix___block_invoke(v17, v31);
    iconImage = v13->_iconImage;
    v13->_iconImage = (PKImage *)v18;

    v20 = (void *)MEMORY[0x192FDC630]();
    double v31 = 1.0;
    v21 = v15;
    v22 = v21;
    if (!v21)
    {
      v23 = PKPassKitCoreBundle();
      v22 = +[PKImage imageNamed:@"GenericIcon" inBundle:v23];
    }
    [v22 scale];
    v25 = DefaultNotificationIconDescriptor(v24);
    [v25 setShouldApplyMask:0];
    v26 = (PKImage *)IconImageFromImage(v22, v25, &v31);

    uint64_t v27 = __75__PKPassPreviewImageSet_initWithDisplayProfile_fileURL_screenScale_suffix___block_invoke(v26, v31);
    notificationIconImage = v13->_notificationIconImage;
    v13->_notificationIconImage = (PKImage *)v27;
  }

  return v13;
}

PKImage *__75__PKPassPreviewImageSet_initWithDisplayProfile_fileURL_screenScale_suffix___block_invoke(PKImage *a1, double a2)
{
  if (a1)
  {
    a1 = [[PKImage alloc] initWithCGImage:a1 scale:1 orientation:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)preheatImages
{
  [(PKImage *)self->_iconImage preheatBitmapData];
  notificationIconImage = self->_notificationIconImage;
  [(PKImage *)notificationIconImage preheatBitmapData];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassPreviewImageSet;
  id v5 = [(PKImageSet *)&v7 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_iconImage forKey:@"iconImage"];
  [v4 encodeObject:self->_notificationIconImage forKey:@"notificationIconImage"];
  [v4 encodeObject:self->_rawIcon forKey:@"rawIcon"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(PKImageSet *)self _isSetImage:self->_iconImage equalToImage:v5[3]]
      && [(PKImageSet *)self _isSetImage:self->_notificationIconImage equalToImage:v5[4]]
      && [(PKImageSet *)self _isSetImage:self->_rawIcon equalToImage:v5[5]];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [(PKImage *)self->_notificationIconImage imageHash];
  uint64_t v4 = [v3 hash];
  id v5 = [(PKImage *)self->_iconImage imageHash];
  uint64_t v6 = [v5 hash] + v4;
  objc_super v7 = [(PKImage *)self->_rawIcon imageHash];
  unint64_t v8 = v6 + [v7 hash];

  return v8;
}

- (void)setIconImage:(id)a3
{
}

- (PKImage)notificationIconImage
{
  return self->_notificationIconImage;
}

- (void)setNotificationIconImage:(id)a3
{
}

- (PKImage)rawIcon
{
  return self->_rawIcon;
}

- (void)setRawIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawIcon, 0);
  objc_storeStrong((id *)&self->_notificationIconImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end