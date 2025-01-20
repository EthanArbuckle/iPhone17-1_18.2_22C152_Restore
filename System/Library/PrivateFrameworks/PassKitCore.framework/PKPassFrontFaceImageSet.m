@interface PKPassFrontFaceImageSet
+ (BOOL)supportsSecureCoding;
+ (id)archiveName;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (BOOL)isEqual:(id)a3;
- (CGRect)cobrandLogoRect;
- (CGRect)logoRect;
- (CGRect)stripRect;
- (CGRect)thumbnailRect;
- (NSData)transactionEffectEmitterShapeSVGData;
- (PKColor)faceImageAverageColor;
- (PKImage)backgroundParallaxCrossDissolveImage;
- (PKImage)backgroundParallaxEmitterImage;
- (PKImage)backgroundParallaxImage;
- (PKImage)dynamicLayerStaticFallbackImage;
- (PKImage)faceImage;
- (PKImage)faceShadowImage;
- (PKImage)footerImage;
- (PKImage)foregroundParallaxCrossDissolveImage;
- (PKImage)foregroundParallaxEmitterImage;
- (PKImage)foregroundParallaxImage;
- (PKImage)neutralEmitterImage;
- (PKImage)neutralImage;
- (PKImage)staticOverlayEmitterImage;
- (PKImage)staticOverlayImage;
- (PKImage)transactionEffectEmitterImage;
- (PKPassFrontFaceImageSet)initWithCoder:(id)a3;
- (PKPassFrontFaceImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setBackgroundParallaxCrossDissolveImage:(id)a3;
- (void)setBackgroundParallaxEmitterImage:(id)a3;
- (void)setBackgroundParallaxImage:(id)a3;
- (void)setCobrandLogoRect:(CGRect)a3;
- (void)setDynamicLayerStaticFallbackImage:(id)a3;
- (void)setFaceImage:(id)a3;
- (void)setFaceImageAverageColor:(id)a3;
- (void)setFaceShadowImage:(id)a3;
- (void)setFooterImage:(id)a3;
- (void)setForegroundParallaxCrossDissolveImage:(id)a3;
- (void)setForegroundParallaxEmitterImage:(id)a3;
- (void)setForegroundParallaxImage:(id)a3;
- (void)setLogoRect:(CGRect)a3;
- (void)setNeutralEmitterImage:(id)a3;
- (void)setNeutralImage:(id)a3;
- (void)setStaticOverlayEmitterImage:(id)a3;
- (void)setStaticOverlayImage:(id)a3;
- (void)setStripRect:(CGRect)a3;
- (void)setThumbnailRect:(CGRect)a3;
- (void)setTransactionEffectEmitterImage:(id)a3;
- (void)setTransactionEffectEmitterShapeSVGData:(id)a3;
@end

@implementation PKPassFrontFaceImageSet

- (PKPassFrontFaceImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PKPassFrontFaceImageSet;
  v5 = [(PKImageSet *)&v54 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceImage"];
    faceImage = v5->_faceImage;
    v5->_faceImage = (PKImage *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceImageAverageColor"];
    faceImageAverageColor = v5->_faceImageAverageColor;
    v5->_faceImageAverageColor = (PKColor *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceShadowImage"];
    faceShadowImage = v5->_faceShadowImage;
    v5->_faceShadowImage = (PKImage *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerImage"];
    footerImage = v5->_footerImage;
    v5->_footerImage = (PKImage *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoRect"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cobrandLogoRect"];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailRect"];
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stripRect"];
    p_x = &v5->_logoRect.origin.x;
    if (v15)
    {
      NSRect v55 = NSRectFromString(v15);
      CGFloat *p_x = v55.origin.x;
      v5->_logoRect.origin.y = v55.origin.y;
      v5->_logoRect.size.width = v55.size.width;
      v5->_logoRect.size.height = v55.size.height;
    }
    else
    {
      CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)p_x = *MEMORY[0x1E4F1DB20];
      v5->_logoRect.size = v20;
    }
    v21 = &v5->_cobrandLogoRect.origin.x;
    if (v16)
    {
      NSRect v56 = NSRectFromString(v16);
      CGFloat *v21 = v56.origin.x;
      v5->_cobrandLogoRect.origin.y = v56.origin.y;
      v5->_cobrandLogoRect.size.width = v56.size.width;
      v5->_cobrandLogoRect.size.height = v56.size.height;
    }
    else
    {
      CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)v21 = *MEMORY[0x1E4F1DB20];
      v5->_cobrandLogoRect.size = v22;
    }
    v23 = &v5->_thumbnailRect.origin.x;
    if (v17)
    {
      NSRect v57 = NSRectFromString(v17);
      CGFloat *v23 = v57.origin.x;
      v5->_thumbnailRect.origin.y = v57.origin.y;
      v5->_thumbnailRect.size.width = v57.size.width;
      v5->_thumbnailRect.size.height = v57.size.height;
    }
    else
    {
      CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)v23 = *MEMORY[0x1E4F1DB20];
      v5->_thumbnailRect.size = v24;
    }
    v25 = &v5->_stripRect.origin.x;
    if (v18)
    {
      NSRect v58 = NSRectFromString(v18);
      CGFloat *v25 = v58.origin.x;
      v5->_stripRect.origin.y = v58.origin.y;
      v5->_stripRect.size.width = v58.size.width;
      v5->_stripRect.size.height = v58.size.height;
    }
    else
    {
      CGSize v26 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)v25 = *MEMORY[0x1E4F1DB20];
      v5->_stripRect.size = v26;
    }
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicLayerStaticFallbackImage"];
    dynamicLayerStaticFallbackImage = v5->_dynamicLayerStaticFallbackImage;
    v5->_dynamicLayerStaticFallbackImage = (PKImage *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundParallaxEmitterImage"];
    backgroundParallaxEmitterImage = v5->_backgroundParallaxEmitterImage;
    v5->_backgroundParallaxEmitterImage = (PKImage *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundParallaxImage"];
    backgroundParallaxImage = v5->_backgroundParallaxImage;
    v5->_backgroundParallaxImage = (PKImage *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundParallaxCrossDissolveImage"];
    backgroundParallaxCrossDissolveImage = v5->_backgroundParallaxCrossDissolveImage;
    v5->_backgroundParallaxCrossDissolveImage = (PKImage *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"neutralEmitterImage"];
    neutralEmitterImage = v5->_neutralEmitterImage;
    v5->_neutralEmitterImage = (PKImage *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"neutralImage"];
    neutralImage = v5->_neutralImage;
    v5->_neutralImage = (PKImage *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundParallaxEmitterImage"];
    foregroundParallaxEmitterImage = v5->_foregroundParallaxEmitterImage;
    v5->_foregroundParallaxEmitterImage = (PKImage *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundParallaxImage"];
    foregroundParallaxImage = v5->_foregroundParallaxImage;
    v5->_foregroundParallaxImage = (PKImage *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundParallaxCrossDissolveImage"];
    foregroundParallaxCrossDissolveImage = v5->_foregroundParallaxCrossDissolveImage;
    v5->_foregroundParallaxCrossDissolveImage = (PKImage *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticOverlayEmitterImage"];
    staticOverlayEmitterImage = v5->_staticOverlayEmitterImage;
    v5->_staticOverlayEmitterImage = (PKImage *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticOverlayImage"];
    staticOverlayImage = v5->_staticOverlayImage;
    v5->_staticOverlayImage = (PKImage *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionEffectEmitterImage"];
    transactionEffectEmitterImage = v5->_transactionEffectEmitterImage;
    v5->_transactionEffectEmitterImage = (PKImage *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionEffectEmitterShapeImage"];
    transactionEffectEmitterShapeSVGData = v5->_transactionEffectEmitterShapeSVGData;
    v5->_transactionEffectEmitterShapeSVGData = (NSData *)v51;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKColor)faceImageAverageColor
{
  return self->_faceImageAverageColor;
}

+ (unsigned)currentVersion
{
  return 28;
}

+ (id)archiveName
{
  return @"FrontFace";
}

- (PKImage)faceShadowImage
{
  return self->_faceShadowImage;
}

- (PKImage)faceImage
{
  return self->_faceImage;
}

- (CGRect)cobrandLogoRect
{
  double x = self->_cobrandLogoRect.origin.x;
  double y = self->_cobrandLogoRect.origin.y;
  double width = self->_cobrandLogoRect.size.width;
  double height = self->_cobrandLogoRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (int64_t)imageSetType
{
  return 0;
}

- (CGRect)thumbnailRect
{
  double x = self->_thumbnailRect.origin.x;
  double y = self->_thumbnailRect.origin.y;
  double width = self->_thumbnailRect.size.width;
  double height = self->_thumbnailRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
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

- (PKPassFrontFaceImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v64.receiver = self;
  v64.super_class = (Class)PKPassFrontFaceImageSet;
  uint64_t v13 = [(PKImageSet *)&v64 initWithDisplayProfile:v10 fileURL:v11 screenScale:v12 suffix:a5];
  if (v13)
  {
    context = (void *)MEMORY[0x192FDC630]();
    v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    if (!v14)
    {
      v15 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [MEMORY[0x1E4F28B50] mainBundle];
        v17 = id v16 = v10;
        v18 = [v17 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        v66 = v18;
        __int16 v67 = 2112;
        id v68 = v11;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Could not instantiate bundle for process(%@): %@", buf, 0x16u);

        id v10 = v16;
      }
    }
    id v63 = v10;
    id v19 = v10;
    uint64_t v20 = PKPassFrontFaceImage(v19, v14, &v13->_logoRect.origin.x, &v13->_thumbnailRect.origin.x, &v13->_stripRect.origin.x, (uint64_t)&v13->_faceImageAverageColor, v12, a5);
    faceImage = v13->_faceImage;
    v13->_faceImage = (PKImage *)v20;

    uint64_t v22 = PKPassFrontFaceShadowImage(v13->_faceImage);
    faceShadowImage = v13->_faceShadowImage;
    v13->_faceShadowImage = (PKImage *)v22;

    CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v13->_cobrandLogoRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v13->_cobrandLogoRect.size = v24;
    v25 = +[PKImage imageNamed:@"cobrandLogo" inBundle:v14];
    CGSize v26 = v25;
    if (v25)
    {
      [v25 size];
      v13->_cobrandLogoRect.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
      v13->_cobrandLogoRect.size.double width = v27;
      v13->_cobrandLogoRect.size.double height = v28;
    }
    uint64_t v29 = +[PKImage imageNamed:@"footer" inBundle:v14];
    v30 = +[PKImageResizingConstraints constraintsWithMaxSize:](PKImageResizingConstraints, "constraintsWithMaxSize:", 286.0, 15.0);
    [v29 scale];
    objc_msgSend(v30, "setOutputScale:");
    uint64_t v31 = [v29 resizedImageWithConstraints:v30];
    footerImage = v13->_footerImage;
    v13->_footerImage = (PKImage *)v31;

    uint64_t v33 = PKPassFrontFaceDynamicLayerImage(v19, @"dynamicLayerStaticFallback", v14, 0, v12, a5);
    dynamicLayerStaticFallbackImage = v13->_dynamicLayerStaticFallbackImage;
    v13->_dynamicLayerStaticFallbackImage = (PKImage *)v33;

    uint64_t v35 = PKPassFrontFaceDynamicLayerEmitterImage(v19, @"backgroundParallaxEmitter", v14, v12, a5);
    backgroundParallaxEmitterImage = v13->_backgroundParallaxEmitterImage;
    v13->_backgroundParallaxEmitterImage = (PKImage *)v35;

    uint64_t v37 = PKPassFrontFaceDynamicLayerImage(v19, @"backgroundParallax", v14, 1, v12, a5);
    backgroundParallaxImage = v13->_backgroundParallaxImage;
    v13->_backgroundParallaxImage = (PKImage *)v37;

    uint64_t v39 = PKPassFrontFaceDynamicLayerImage(v19, @"backgroundParallaxCrossDissolve", v14, 1, v12, a5);
    backgroundParallaxCrossDissolveImage = v13->_backgroundParallaxCrossDissolveImage;
    v13->_backgroundParallaxCrossDissolveImage = (PKImage *)v39;

    uint64_t v41 = PKPassFrontFaceDynamicLayerEmitterImage(v19, @"neutralEmitter", v14, v12, a5);
    neutralEmitterImage = v13->_neutralEmitterImage;
    v13->_neutralEmitterImage = (PKImage *)v41;

    uint64_t v43 = PKPassFrontFaceDynamicLayerImage(v19, @"neutral", v14, 0, v12, a5);
    neutralImage = v13->_neutralImage;
    v13->_neutralImage = (PKImage *)v43;

    uint64_t v45 = PKPassFrontFaceDynamicLayerEmitterImage(v19, @"foregroundParallaxEmitter", v14, v12, a5);
    foregroundParallaxEmitterImage = v13->_foregroundParallaxEmitterImage;
    v13->_foregroundParallaxEmitterImage = (PKImage *)v45;

    uint64_t v47 = PKPassFrontFaceDynamicLayerImage(v19, @"foregroundParallax", v14, 1, v12, a5);
    foregroundParallaxImage = v13->_foregroundParallaxImage;
    v13->_foregroundParallaxImage = (PKImage *)v47;

    uint64_t v49 = PKPassFrontFaceDynamicLayerImage(v19, @"foregroundParallaxCrossDissolve", v14, 1, v12, a5);
    foregroundParallaxCrossDissolveImage = v13->_foregroundParallaxCrossDissolveImage;
    v13->_foregroundParallaxCrossDissolveImage = (PKImage *)v49;

    uint64_t v51 = PKPassFrontFaceDynamicLayerEmitterImage(v19, @"staticOverlayEmitter", v14, v12, a5);
    staticOverlayEmitterImage = v13->_staticOverlayEmitterImage;
    v13->_staticOverlayEmitterImage = (PKImage *)v51;

    uint64_t v53 = PKPassFrontFaceDynamicLayerImage(v19, @"staticOverlay", v14, 0, v12, a5);
    staticOverlayImage = v13->_staticOverlayImage;
    v13->_staticOverlayImage = (PKImage *)v53;

    uint64_t v55 = PKPassFrontFaceDynamicLayerEmitterImage(v19, @"transactionEffectEmitter", v14, v12, a5);

    transactionEffectEmitterImage = v13->_transactionEffectEmitterImage;
    v13->_transactionEffectEmitterImage = (PKImage *)v55;

    if (v14)
    {
      NSRect v57 = (void *)MEMORY[0x1E4F1C9B8];
      NSRect v58 = [v14 URLForResource:@"transactionEffectShape" withExtension:@"svg"];
      uint64_t v59 = [v57 dataWithContentsOfURL:v58];
      transactionEffectEmitterShapeSVGData = v13->_transactionEffectEmitterShapeSVGData;
      v13->_transactionEffectEmitterShapeSVGData = (NSData *)v59;
    }
    id v10 = v63;
  }

  return v13;
}

- (void)preheatImages
{
  [(PKImage *)self->_faceImage preheatBitmapData];
  [(PKImage *)self->_dynamicLayerStaticFallbackImage preheatBitmapData];
  [(PKImage *)self->_backgroundParallaxEmitterImage preheatBitmapData];
  [(PKImage *)self->_backgroundParallaxImage preheatBitmapData];
  [(PKImage *)self->_backgroundParallaxCrossDissolveImage preheatBitmapData];
  [(PKImage *)self->_neutralEmitterImage preheatBitmapData];
  [(PKImage *)self->_neutralImage preheatBitmapData];
  [(PKImage *)self->_foregroundParallaxEmitterImage preheatBitmapData];
  [(PKImage *)self->_foregroundParallaxImage preheatBitmapData];
  [(PKImage *)self->_foregroundParallaxCrossDissolveImage preheatBitmapData];
  [(PKImage *)self->_staticOverlayEmitterImage preheatBitmapData];
  [(PKImage *)self->_staticOverlayImage preheatBitmapData];
  transactionEffectEmitterImage = self->_transactionEffectEmitterImage;
  [(PKImage *)transactionEffectEmitterImage preheatBitmapData];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassFrontFaceImageSet;
  id v5 = [(PKImageSet *)&v11 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_faceImage forKey:@"faceImage"];
  [v4 encodeObject:self->_faceImageAverageColor forKey:@"faceImageAverageColor"];
  [v4 encodeObject:self->_faceShadowImage forKey:@"faceShadowImage"];
  [v4 encodeObject:self->_footerImage forKey:@"footerImage"];
  if (CGRectIsNull(self->_logoRect))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = NSStringFromRect(self->_logoRect);
  }
  if (CGRectIsNull(self->_cobrandLogoRect))
  {
    v8 = 0;
  }
  else
  {
    v8 = NSStringFromRect(self->_cobrandLogoRect);
  }
  if (CGRectIsNull(self->_thumbnailRect))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = NSStringFromRect(self->_thumbnailRect);
  }
  if (CGRectIsNull(self->_stripRect))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = NSStringFromRect(self->_stripRect);
  }
  [v4 encodeObject:v7 forKey:@"logoRect"];
  [v4 encodeObject:v8 forKey:@"cobrandLogoRect"];
  [v4 encodeObject:v9 forKey:@"thumbnailRect"];
  [v4 encodeObject:v10 forKey:@"stripRect"];
  [v4 encodeObject:self->_dynamicLayerStaticFallbackImage forKey:@"dynamicLayerStaticFallbackImage"];
  [v4 encodeObject:self->_backgroundParallaxEmitterImage forKey:@"backgroundParallaxEmitterImage"];
  [v4 encodeObject:self->_backgroundParallaxImage forKey:@"backgroundParallaxImage"];
  [v4 encodeObject:self->_backgroundParallaxCrossDissolveImage forKey:@"backgroundParallaxCrossDissolveImage"];
  [v4 encodeObject:self->_neutralEmitterImage forKey:@"neutralEmitterImage"];
  [v4 encodeObject:self->_neutralImage forKey:@"neutralImage"];
  [v4 encodeObject:self->_foregroundParallaxEmitterImage forKey:@"foregroundParallaxEmitterImage"];
  [v4 encodeObject:self->_foregroundParallaxImage forKey:@"foregroundParallaxImage"];
  [v4 encodeObject:self->_foregroundParallaxCrossDissolveImage forKey:@"foregroundParallaxCrossDissolveImage"];
  [v4 encodeObject:self->_staticOverlayEmitterImage forKey:@"staticOverlayEmitterImage"];
  [v4 encodeObject:self->_staticOverlayImage forKey:@"staticOverlayImage"];
  [v4 encodeObject:self->_transactionEffectEmitterImage forKey:@"transactionEffectEmitterImage"];
  [v4 encodeObject:self->_transactionEffectEmitterShapeSVGData forKey:@"transactionEffectEmitterShapeImage"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (CGRectEqualToRect(self->_logoRect, *((CGRect *)v5 + 5))
      && CGRectEqualToRect(self->_cobrandLogoRect, *((CGRect *)v5 + 6))
      && CGRectEqualToRect(self->_thumbnailRect, *((CGRect *)v5 + 7))
      && CGRectEqualToRect(self->_stripRect, *((CGRect *)v5 + 8)))
    {
      v6 = [(PKImage *)self->_faceImage imageHash];
      uint64_t v7 = [*((id *)v5 + 3) imageHash];
      if ([v6 isEqual:v7])
      {
        v8 = [(PKImage *)self->_faceShadowImage imageHash];
        uint64_t v9 = [*((id *)v5 + 5) imageHash];
        if ([v8 isEqual:v9])
        {
          id v10 = [(PKImage *)self->_footerImage imageHash];
          objc_super v11 = [*((id *)v5 + 6) imageHash];
          BOOL v12 = [v10 isEqual:v11]
             && [(PKImageSet *)self _isSetImage:self->_dynamicLayerStaticFallbackImage equalToImage:*((void *)v5 + 7)]&& [(PKImageSet *)self _isSetImage:self->_backgroundParallaxEmitterImage equalToImage:*((void *)v5 + 8)]&& [(PKImageSet *)self _isSetImage:self->_backgroundParallaxImage equalToImage:*((void *)v5 + 9)]&& [(PKImageSet *)self _isSetImage:self->_backgroundParallaxCrossDissolveImage equalToImage:*((void *)v5 + 10)]
             && [(PKImageSet *)self _isSetImage:self->_neutralEmitterImage equalToImage:*((void *)v5 + 11)]&& [(PKImageSet *)self _isSetImage:self->_neutralImage equalToImage:*((void *)v5 + 12)]&& [(PKImageSet *)self _isSetImage:self->_foregroundParallaxEmitterImage equalToImage:*((void *)v5 + 13)]&& [(PKImageSet *)self _isSetImage:self->_foregroundParallaxImage equalToImage:*((void *)v5 + 14)]
             && [(PKImageSet *)self _isSetImage:self->_foregroundParallaxCrossDissolveImage equalToImage:*((void *)v5 + 15)]&& [(PKImageSet *)self _isSetImage:self->_staticOverlayEmitterImage equalToImage:*((void *)v5 + 16)]&& [(PKImageSet *)self _isSetImage:self->_staticOverlayImage equalToImage:*((void *)v5 + 17)]&& [(PKImageSet *)self _isSetImage:self->_transactionEffectEmitterImage equalToImage:*((void *)v5 + 18)]
             && [(NSData *)self->_transactionEffectEmitterShapeSVGData isEqualToData:*((void *)v5 + 19)];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v34 = [(PKImage *)self->_faceImage imageHash];
  uint64_t v3 = [v34 hash];
  uint64_t v33 = [(PKImage *)self->_faceShadowImage imageHash];
  uint64_t v4 = [v33 hash] + v3;
  v32 = [(PKImage *)self->_footerImage imageHash];
  uint64_t v5 = [v32 hash];
  uint64_t v31 = [(PKImage *)self->_dynamicLayerStaticFallbackImage imageHash];
  uint64_t v6 = v4 + v5 + [v31 hash];
  v30 = [(PKImage *)self->_backgroundParallaxEmitterImage imageHash];
  uint64_t v7 = [v30 hash];
  uint64_t v29 = [(PKImage *)self->_backgroundParallaxImage imageHash];
  uint64_t v8 = v7 + [v29 hash];
  CGFloat v28 = [(PKImage *)self->_backgroundParallaxCrossDissolveImage imageHash];
  uint64_t v9 = v6 + v8 + [v28 hash];
  CGFloat v27 = [(PKImage *)self->_neutralEmitterImage imageHash];
  uint64_t v10 = [v27 hash];
  CGSize v26 = [(PKImage *)self->_neutralImage imageHash];
  uint64_t v11 = v10 + [v26 hash];
  BOOL v12 = [(PKImage *)self->_foregroundParallaxEmitterImage imageHash];
  uint64_t v13 = v11 + [v12 hash];
  v14 = [(PKImage *)self->_foregroundParallaxImage imageHash];
  uint64_t v15 = v9 + v13 + [v14 hash];
  id v16 = [(PKImage *)self->_foregroundParallaxCrossDissolveImage imageHash];
  uint64_t v17 = [v16 hash];
  v18 = [(PKImage *)self->_staticOverlayEmitterImage imageHash];
  uint64_t v19 = v17 + [v18 hash];
  uint64_t v20 = [(PKImage *)self->_staticOverlayImage imageHash];
  uint64_t v21 = v19 + [v20 hash];
  uint64_t v22 = [(PKImage *)self->_transactionEffectEmitterImage imageHash];
  uint64_t v23 = v21 + [v22 hash];
  unint64_t v24 = v15 + v23 + [(NSData *)self->_transactionEffectEmitterShapeSVGData hash];

  return v24;
}

- (void)setFaceImage:(id)a3
{
}

- (void)setFaceImageAverageColor:(id)a3
{
}

- (void)setFaceShadowImage:(id)a3
{
}

- (PKImage)footerImage
{
  return self->_footerImage;
}

- (void)setFooterImage:(id)a3
{
}

- (void)setLogoRect:(CGRect)a3
{
  self->_logoRect = a3;
}

- (void)setCobrandLogoRect:(CGRect)a3
{
  self->_cobrandLogoRect = a3;
}

- (void)setThumbnailRect:(CGRect)a3
{
  self->_thumbnailRect = a3;
}

- (CGRect)stripRect
{
  double x = self->_stripRect.origin.x;
  double y = self->_stripRect.origin.y;
  double width = self->_stripRect.size.width;
  double height = self->_stripRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStripRect:(CGRect)a3
{
  self->_stripRect = a3;
}

- (PKImage)dynamicLayerStaticFallbackImage
{
  return self->_dynamicLayerStaticFallbackImage;
}

- (void)setDynamicLayerStaticFallbackImage:(id)a3
{
}

- (PKImage)backgroundParallaxEmitterImage
{
  return self->_backgroundParallaxEmitterImage;
}

- (void)setBackgroundParallaxEmitterImage:(id)a3
{
}

- (PKImage)backgroundParallaxImage
{
  return self->_backgroundParallaxImage;
}

- (void)setBackgroundParallaxImage:(id)a3
{
}

- (PKImage)backgroundParallaxCrossDissolveImage
{
  return self->_backgroundParallaxCrossDissolveImage;
}

- (void)setBackgroundParallaxCrossDissolveImage:(id)a3
{
}

- (PKImage)neutralEmitterImage
{
  return self->_neutralEmitterImage;
}

- (void)setNeutralEmitterImage:(id)a3
{
}

- (PKImage)neutralImage
{
  return self->_neutralImage;
}

- (void)setNeutralImage:(id)a3
{
}

- (PKImage)foregroundParallaxEmitterImage
{
  return self->_foregroundParallaxEmitterImage;
}

- (void)setForegroundParallaxEmitterImage:(id)a3
{
}

- (PKImage)foregroundParallaxImage
{
  return self->_foregroundParallaxImage;
}

- (void)setForegroundParallaxImage:(id)a3
{
}

- (PKImage)foregroundParallaxCrossDissolveImage
{
  return self->_foregroundParallaxCrossDissolveImage;
}

- (void)setForegroundParallaxCrossDissolveImage:(id)a3
{
}

- (PKImage)staticOverlayEmitterImage
{
  return self->_staticOverlayEmitterImage;
}

- (void)setStaticOverlayEmitterImage:(id)a3
{
}

- (PKImage)staticOverlayImage
{
  return self->_staticOverlayImage;
}

- (void)setStaticOverlayImage:(id)a3
{
}

- (PKImage)transactionEffectEmitterImage
{
  return self->_transactionEffectEmitterImage;
}

- (void)setTransactionEffectEmitterImage:(id)a3
{
}

- (NSData)transactionEffectEmitterShapeSVGData
{
  return self->_transactionEffectEmitterShapeSVGData;
}

- (void)setTransactionEffectEmitterShapeSVGData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionEffectEmitterShapeSVGData, 0);
  objc_storeStrong((id *)&self->_transactionEffectEmitterImage, 0);
  objc_storeStrong((id *)&self->_staticOverlayImage, 0);
  objc_storeStrong((id *)&self->_staticOverlayEmitterImage, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxCrossDissolveImage, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxImage, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxEmitterImage, 0);
  objc_storeStrong((id *)&self->_neutralImage, 0);
  objc_storeStrong((id *)&self->_neutralEmitterImage, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxCrossDissolveImage, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxImage, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxEmitterImage, 0);
  objc_storeStrong((id *)&self->_dynamicLayerStaticFallbackImage, 0);
  objc_storeStrong((id *)&self->_footerImage, 0);
  objc_storeStrong((id *)&self->_faceShadowImage, 0);
  objc_storeStrong((id *)&self->_faceImageAverageColor, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
}

@end