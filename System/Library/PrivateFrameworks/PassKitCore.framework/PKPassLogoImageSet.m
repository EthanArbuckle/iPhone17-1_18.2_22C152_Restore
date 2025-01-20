@interface PKPassLogoImageSet
+ (BOOL)shouldCache;
+ (BOOL)supportsSecureCoding;
+ (id)archiveName;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (BOOL)isEqual:(id)a3;
- (PKImage)altImage;
- (PKImage)backgroundImage;
- (PKImage)bankLogoImage;
- (PKImage)cardBackgroundCombinedImage;
- (PKImage)cardBackgroundImage;
- (PKImage)cobrandLogoImage;
- (PKImage)compactBankLogoDarkImage;
- (PKImage)compactBankLogoLightImage;
- (PKImage)footerImage;
- (PKImage)logoImage;
- (PKImage)networkLogoImage;
- (PKImage)secondaryLogoImage;
- (PKImage)stripImage;
- (PKImage)thumbnailImage;
- (PKPassLogoImageSet)initWithCoder:(id)a3;
- (PKPassLogoImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setAltImage:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBankLogoImage:(id)a3;
- (void)setCardBackgroundCombinedImage:(id)a3;
- (void)setCardBackgroundImage:(id)a3;
- (void)setCobrandLogoImage:(id)a3;
- (void)setCompactBankLogoDarkImage:(id)a3;
- (void)setCompactBankLogoLightImage:(id)a3;
- (void)setFooterImage:(id)a3;
- (void)setLogoImage:(id)a3;
- (void)setNetworkLogoImage:(id)a3;
- (void)setSecondaryLogoImage:(id)a3;
- (void)setStripImage:(id)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation PKPassLogoImageSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)shouldCache
{
  return 0;
}

+ (id)archiveName
{
  return @"Logo";
}

- (PKPassLogoImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PKPassLogoImageSet;
  v13 = [(PKImageSet *)&v33 initWithDisplayProfile:v10 fileURL:v11 screenScale:v12 suffix:a5];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    uint64_t v15 = [v10 passStyle];
    v16 = PKPassBundlePrimaryLogoImageName;
    if (v15 != 9) {
      v16 = PKPassBundleLogoImageName;
    }
    v32 = +[PKImage imageNamed:*v16 inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLogoImageSet setLogoImage:](v13, "setLogoImage:");
    uint64_t v17 = +[PKImage imageNamed:@"background" inBundle:v14 screenScale:v12 suffix:a5];
    v18 = (void *)v17;
    if (v15 == 9 && !v17)
    {
      v18 = +[PKImage imageNamed:@"artwork" inBundle:v14 screenScale:v12 suffix:a5];
    }
    [(PKPassLogoImageSet *)v13 setBackgroundImage:v18];
    v31 = +[PKImage imageNamed:@"strip" inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLogoImageSet setStripImage:](v13, "setStripImage:");
    v30 = +[PKImage imageNamed:@"footer" inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLogoImageSet setFooterImage:](v13, "setFooterImage:");
    v19 = +[PKImage imageNamed:@"altImage" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLogoImageSet *)v13 setAltImage:v19];
    v20 = +[PKImage imageNamed:@"secondaryLogo" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLogoImageSet *)v13 setSecondaryLogoImage:v20];
    v21 = +[PKImage imageNamed:@"cardBackgroundCombined" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLogoImageSet *)v13 setCardBackgroundCombinedImage:v21];

    v22 = [(PKPassLogoImageSet *)v13 cardBackgroundCombinedImage];

    if (!v22)
    {
      v23 = +[PKImage imageNamed:@"bankLogo" inBundle:v14 screenScale:v12 suffix:a5];
      [(PKPassLogoImageSet *)v13 setBankLogoImage:v23];

      v24 = +[PKImage imageNamed:@"networkLogo" inBundle:v14 screenScale:v12 suffix:a5];
      [(PKPassLogoImageSet *)v13 setNetworkLogoImage:v24];

      v25 = +[PKImage imageNamed:@"cobrandLogo" inBundle:v14 screenScale:v12 suffix:a5];
      [(PKPassLogoImageSet *)v13 setCobrandLogoImage:v25];

      v26 = +[PKImage imageNamed:@"cardBackground" inBundle:v14 screenScale:v12 suffix:a5];
      [(PKPassLogoImageSet *)v13 setCardBackgroundImage:v26];
    }
    v27 = +[PKImage imageNamed:@"compactBankLogoDark" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLogoImageSet *)v13 setCompactBankLogoDarkImage:v27];
    v28 = +[PKImage imageNamed:@"compactBankLogoLight" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLogoImageSet *)v13 setCompactBankLogoLightImage:v28];
  }
  return v13;
}

- (void)setStripImage:(id)a3
{
}

- (void)setSecondaryLogoImage:(id)a3
{
}

- (void)setLogoImage:(id)a3
{
}

- (void)setFooterImage:(id)a3
{
}

- (void)setCompactBankLogoLightImage:(id)a3
{
}

- (void)setCompactBankLogoDarkImage:(id)a3
{
}

- (void)setCardBackgroundCombinedImage:(id)a3
{
}

- (void)setBackgroundImage:(id)a3
{
}

- (void)setAltImage:(id)a3
{
}

- (PKImage)cardBackgroundCombinedImage
{
  return self->_cardBackgroundCombinedImage;
}

+ (unsigned)currentVersion
{
  return 8;
}

- (void)setNetworkLogoImage:(id)a3
{
}

- (void)setCobrandLogoImage:(id)a3
{
}

- (void)setCardBackgroundImage:(id)a3
{
}

- (void)setBankLogoImage:(id)a3
{
}

- (PKImage)altImage
{
  return self->_altImage;
}

+ (int64_t)imageSetType
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLogoImage, 0);
  objc_storeStrong((id *)&self->_compactBankLogoLightImage, 0);
  objc_storeStrong((id *)&self->_compactBankLogoDarkImage, 0);
  objc_storeStrong((id *)&self->_cardBackgroundCombinedImage, 0);
  objc_storeStrong((id *)&self->_cardBackgroundImage, 0);
  objc_storeStrong((id *)&self->_cobrandLogoImage, 0);
  objc_storeStrong((id *)&self->_networkLogoImage, 0);
  objc_storeStrong((id *)&self->_bankLogoImage, 0);
  objc_storeStrong((id *)&self->_altImage, 0);
  objc_storeStrong((id *)&self->_footerImage, 0);
  objc_storeStrong((id *)&self->_stripImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassLogoImageSet;
  id v5 = [(PKImageSet *)&v7 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_logoImage forKey:@"logoImage"];
  [v4 encodeObject:self->_backgroundImage forKey:@"backgroundImage"];
  [v4 encodeObject:self->_stripImage forKey:@"stripImage"];
  [v4 encodeObject:self->_footerImage forKey:@"footerImage"];
  [v4 encodeObject:self->_altImage forKey:@"altImage"];
  [v4 encodeObject:self->_bankLogoImage forKey:@"bankLogoImage"];
  [v4 encodeObject:self->_networkLogoImage forKey:@"networkLogoImage"];
  [v4 encodeObject:self->_cobrandLogoImage forKey:@"cobrandLogoImage"];
  [v4 encodeObject:self->_cardBackgroundImage forKey:@"cardBackgroundImage"];
  [v4 encodeObject:self->_cardBackgroundCombinedImage forKey:@"cardBackgroundCombinedImage"];
  [v4 encodeObject:self->_thumbnailImage forKey:@"thumbnailImage"];
  [v4 encodeObject:self->_compactBankLogoDarkImage forKey:@"compactBankLogoDarkImage"];
  [v4 encodeObject:self->_compactBankLogoLightImage forKey:@"compactBankLogoLightImage"];
  [v4 encodeObject:self->_secondaryLogoImage forKey:@"secondaryLogoImage"];
}

- (PKImage)logoImage
{
  return self->_logoImage;
}

- (PKPassLogoImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPassLogoImageSet;
  id v5 = [(PKImageSet *)&v36 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoImage"];
    logoImage = v5->_logoImage;
    v5->_logoImage = (PKImage *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundImage"];
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (PKImage *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stripImage"];
    stripImage = v5->_stripImage;
    v5->_stripImage = (PKImage *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerImage"];
    footerImage = v5->_footerImage;
    v5->_footerImage = (PKImage *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altImage"];
    altImage = v5->_altImage;
    v5->_altImage = (PKImage *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankLogoImage"];
    bankLogoImage = v5->_bankLogoImage;
    v5->_bankLogoImage = (PKImage *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkLogoImage"];
    networkLogoImage = v5->_networkLogoImage;
    v5->_networkLogoImage = (PKImage *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cobrandLogoImage"];
    cobrandLogoImage = v5->_cobrandLogoImage;
    v5->_cobrandLogoImage = (PKImage *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardBackgroundImage"];
    cardBackgroundImage = v5->_cardBackgroundImage;
    v5->_cardBackgroundImage = (PKImage *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardBackgroundCombinedImage"];
    cardBackgroundCombinedImage = v5->_cardBackgroundCombinedImage;
    v5->_cardBackgroundCombinedImage = (PKImage *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailImage"];
    thumbnailImage = v5->_thumbnailImage;
    v5->_thumbnailImage = (PKImage *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compactBankLogoDarkImage"];
    compactBankLogoDarkImage = v5->_compactBankLogoDarkImage;
    v5->_compactBankLogoDarkImage = (PKImage *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compactBankLogoLightImage"];
    compactBankLogoLightImage = v5->_compactBankLogoLightImage;
    v5->_compactBankLogoLightImage = (PKImage *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryLogoImage"];
    secondaryLogoImage = v5->_secondaryLogoImage;
    v5->_secondaryLogoImage = (PKImage *)v33;
  }

  return v5;
}

- (void)preheatImages
{
  [(PKImage *)self->_logoImage preheatBitmapData];
  [(PKImage *)self->_backgroundImage preheatBitmapData];
  [(PKImage *)self->_stripImage preheatBitmapData];
  [(PKImage *)self->_footerImage preheatBitmapData];
  [(PKImage *)self->_altImage preheatBitmapData];
  [(PKImage *)self->_bankLogoImage preheatBitmapData];
  [(PKImage *)self->_networkLogoImage preheatBitmapData];
  [(PKImage *)self->_cobrandLogoImage preheatBitmapData];
  [(PKImage *)self->_cardBackgroundImage preheatBitmapData];
  [(PKImage *)self->_cardBackgroundCombinedImage preheatBitmapData];
  [(PKImage *)self->_compactBankLogoDarkImage preheatBitmapData];
  [(PKImage *)self->_compactBankLogoLightImage preheatBitmapData];
  secondaryLogoImage = self->_secondaryLogoImage;
  [(PKImage *)secondaryLogoImage preheatBitmapData];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(PKImageSet *)self _isSetImage:self->_logoImage equalToImage:v5[3]]
      && [(PKImageSet *)self _isSetImage:self->_secondaryLogoImage equalToImage:v5[16]]
      && [(PKImageSet *)self _isSetImage:self->_backgroundImage equalToImage:v5[4]]
      && [(PKImageSet *)self _isSetImage:self->_stripImage equalToImage:v5[6]]
      && [(PKImageSet *)self _isSetImage:self->_footerImage equalToImage:v5[7]]
      && [(PKImageSet *)self _isSetImage:self->_altImage equalToImage:v5[8]]
      && [(PKImageSet *)self _isSetImage:self->_bankLogoImage equalToImage:v5[9]]
      && [(PKImageSet *)self _isSetImage:self->_networkLogoImage equalToImage:v5[10]]
      && [(PKImageSet *)self _isSetImage:self->_cobrandLogoImage equalToImage:v5[11]]
      && [(PKImageSet *)self _isSetImage:self->_cardBackgroundImage equalToImage:v5[12]]
      && [(PKImageSet *)self _isSetImage:self->_cardBackgroundCombinedImage equalToImage:v5[13]]&& [(PKImageSet *)self _isSetImage:self->_compactBankLogoDarkImage equalToImage:v5[14]]&& [(PKImageSet *)self _isSetImage:self->_compactBankLogoLightImage equalToImage:v5[15]];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v29 = [(PKImage *)self->_logoImage imageHash];
  uint64_t v3 = [v29 hash];
  v28 = [(PKImage *)self->_secondaryLogoImage imageHash];
  uint64_t v4 = [v28 hash] + v3;
  uint64_t v27 = [(PKImage *)self->_backgroundImage imageHash];
  uint64_t v5 = [v27 hash];
  v26 = [(PKImage *)self->_stripImage imageHash];
  uint64_t v6 = v4 + v5 + [v26 hash];
  uint64_t v25 = [(PKImage *)self->_footerImage imageHash];
  uint64_t v7 = [v25 hash];
  v24 = [(PKImage *)self->_altImage imageHash];
  uint64_t v8 = v7 + [v24 hash];
  uint64_t v9 = [(PKImage *)self->_bankLogoImage imageHash];
  uint64_t v10 = v6 + v8 + [v9 hash];
  uint64_t v11 = [(PKImage *)self->_networkLogoImage imageHash];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(PKImage *)self->_cobrandLogoImage imageHash];
  uint64_t v14 = v12 + [v13 hash];
  uint64_t v15 = [(PKImage *)self->_cardBackgroundImage imageHash];
  uint64_t v16 = v14 + [v15 hash];
  uint64_t v17 = [(PKImage *)self->_cardBackgroundCombinedImage imageHash];
  uint64_t v18 = v10 + v16 + [v17 hash];
  uint64_t v19 = [(PKImage *)self->_compactBankLogoDarkImage imageHash];
  uint64_t v20 = [v19 hash];
  uint64_t v21 = [(PKImage *)self->_compactBankLogoLightImage imageHash];
  unint64_t v22 = v18 + v20 + [v21 hash];

  return v22;
}

- (PKImage)backgroundImage
{
  return self->_backgroundImage;
}

- (PKImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (PKImage)stripImage
{
  return self->_stripImage;
}

- (PKImage)footerImage
{
  return self->_footerImage;
}

- (PKImage)bankLogoImage
{
  return self->_bankLogoImage;
}

- (PKImage)networkLogoImage
{
  return self->_networkLogoImage;
}

- (PKImage)cobrandLogoImage
{
  return self->_cobrandLogoImage;
}

- (PKImage)cardBackgroundImage
{
  return self->_cardBackgroundImage;
}

- (PKImage)compactBankLogoDarkImage
{
  return self->_compactBankLogoDarkImage;
}

- (PKImage)compactBankLogoLightImage
{
  return self->_compactBankLogoLightImage;
}

- (PKImage)secondaryLogoImage
{
  return self->_secondaryLogoImage;
}

@end