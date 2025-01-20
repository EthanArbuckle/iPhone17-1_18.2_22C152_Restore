@interface PKPassPlaceHolderImageSet
+ (BOOL)supportsSecureCoding;
+ (id)archiveName;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (BOOL)isEqual:(id)a3;
- (CGRect)logoRect;
- (PKColor)placeHolderImageAverageColor;
- (PKImage)placeHolderImage;
- (PKPassPlaceHolderImageSet)initWithCoder:(id)a3;
- (PKPassPlaceHolderImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (id)_initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6 frontFaceImageSet:(id)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setLogoRect:(CGRect)a3;
- (void)setPlaceHolderImage:(id)a3;
- (void)setPlaceHolderImageAverageColor:(id)a3;
@end

@implementation PKPassPlaceHolderImageSet

- (PKPassPlaceHolderImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  return (PKPassPlaceHolderImageSet *)[(PKPassPlaceHolderImageSet *)self _initWithDisplayProfile:a3 fileURL:a4 screenScale:a6 suffix:0 frontFaceImageSet:a5];
}

- (id)_initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6 frontFaceImageSet:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PKPassPlaceHolderImageSet;
  v16 = [(PKImageSet *)&v37 initWithDisplayProfile:v12 fileURL:v13 screenScale:v14 suffix:a5];
  if (v16)
  {
    uint64_t v17 = MEMORY[0x192FDC630]();
    v18 = (void *)v17;
    if (v15)
    {
      id v19 = v12;
      [v15 logoRect];
      v16->_logoRect.origin.x = v20;
      v16->_logoRect.origin.y = v21;
      v16->_logoRect.size.width = v22;
      v16->_logoRect.size.height = v23;
      uint64_t v24 = [v15 faceImageAverageColor];
      placeHolderImageAverageColor = v16->_placeHolderImageAverageColor;
      v16->_placeHolderImageAverageColor = (PKColor *)v24;

      v26 = [v15 faceImage];
      uint64_t v27 = PKPassPartialFrontFaceImage(v26, v19);

      placeHolderImage = v16->_placeHolderImage;
      v16->_placeHolderImage = (PKImage *)v27;
    }
    else
    {
      v36 = (void *)v17;
      v26 = [MEMORY[0x1E4F28B50] bundleWithURL:v13];
      if (!v26)
      {
        v29 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [MEMORY[0x1E4F28B50] mainBundle];
          v31 = [v30 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          v39 = v31;
          __int16 v40 = 2112;
          id v41 = v13;
          _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Could not instantiate bundle for process(%@): %@", buf, 0x16u);
        }
      }
      id v32 = v12;
      placeHolderImage = PKPassFrontFaceImage(v32, v26, &v16->_logoRect.origin.x, 0, 0, (uint64_t)&v16->_placeHolderImageAverageColor, v14, a5);
      uint64_t v33 = PKPassPartialFrontFaceImage(placeHolderImage, v32);

      v34 = v16->_placeHolderImage;
      v16->_placeHolderImage = (PKImage *)v33;

      v18 = v36;
    }
  }

  return v16;
}

+ (int64_t)imageSetType
{
  return 2;
}

+ (id)archiveName
{
  return @"PlaceHolder";
}

+ (unsigned)currentVersion
{
  return 20;
}

- (void)preheatImages
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassPlaceHolderImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassPlaceHolderImageSet;
  v5 = [(PKImageSet *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeHolderImage"];
    placeHolderImage = v5->_placeHolderImage;
    v5->_placeHolderImage = (PKImage *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeHolderImageAverageColor"];
    placeHolderImageAverageColor = v5->_placeHolderImageAverageColor;
    v5->_placeHolderImageAverageColor = (PKColor *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoRect"];
    id v12 = v11;
    p_x = &v5->_logoRect.origin.x;
    if (v11)
    {
      NSRect v17 = NSRectFromString(v11);
      CGFloat *p_x = v17.origin.x;
      v5->_logoRect.origin.y = v17.origin.y;
      v5->_logoRect.size.width = v17.size.width;
      v5->_logoRect.size.height = v17.size.height;
    }
    else
    {
      CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)p_x = *MEMORY[0x1E4F1DB20];
      v5->_logoRect.size = v14;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassPlaceHolderImageSet;
  id v5 = [(PKImageSet *)&v9 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_placeHolderImage forKey:@"placeHolderImage"];
  [v4 encodeObject:self->_placeHolderImageAverageColor forKey:@"placeHolderImageAverageColor"];
  p_logoRect = &self->_logoRect;
  if (CGRectIsNull(*p_logoRect))
  {
    v8 = 0;
  }
  else
  {
    v8 = NSStringFromRect(*p_logoRect);
  }
  [v4 encodeObject:v8 forKey:@"logoRect"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (char *)v4;
    v6 = [(PKImage *)self->_placeHolderImage imageHash];
    uint64_t v7 = [*((id *)v5 + 3) imageHash];
    if ([v6 isEqual:v7]) {
      BOOL v8 = CGRectEqualToRect(self->_logoRect, *(CGRect *)(v5 + 40));
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(PKImage *)self->_placeHolderImage imageHash];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PKImage)placeHolderImage
{
  return self->_placeHolderImage;
}

- (void)setPlaceHolderImage:(id)a3
{
}

- (PKColor)placeHolderImageAverageColor
{
  return self->_placeHolderImageAverageColor;
}

- (void)setPlaceHolderImageAverageColor:(id)a3
{
}

- (CGRect)logoRect
{
  double x = self->_logoRect.origin.x;
  double y = self->_logoRect.origin.y;
  double width = self->_logoRect.size.width;
  double height = self->_logoRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLogoRect:(CGRect)a3
{
  self->_logoRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolderImageAverageColor, 0);
  objc_storeStrong((id *)&self->_placeHolderImage, 0);
}

@end