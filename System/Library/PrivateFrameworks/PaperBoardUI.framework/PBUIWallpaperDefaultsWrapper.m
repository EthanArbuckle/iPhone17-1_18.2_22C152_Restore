@interface PBUIWallpaperDefaultsWrapper
+ (id)homeScreenWrapperForLegacyDefaults:(id)a3;
+ (id)lockScreenWrapperForLegacyDefaults:(id)a3;
- (BOOL)hasVideo;
- (BOOL)magnifyEnabled;
- (BOOL)portrait;
- (BOOL)supportsCropping;
- (BOOL)wallpaperWasUserSet;
- (CGRect)cropRect;
- (NSData)colorData;
- (NSData)gradientData;
- (NSData)imageHashData;
- (NSDictionary)wallpaperKitData;
- (NSDictionary)wallpaperOptions;
- (NSString)colorName;
- (NSString)wallpaperIdentifier;
- (NSString)wallpaperName;
- (PBUIWallpaperDefaultsWrapper)initWithWallpaperDefaultsDict:(id)a3;
- (double)parallaxFactor;
- (double)stillTimeInVideo;
- (double)zoomScale;
- (id)wallpaperDefaultsDict;
- (int64_t)wallpaperMode;
- (void)setColorData:(id)a3;
- (void)setColorName:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setGradientData:(id)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setImageHashData:(id)a3;
- (void)setMagnifyEnabled:(BOOL)a3;
- (void)setParallaxFactor:(double)a3;
- (void)setPortrait:(BOOL)a3;
- (void)setStillTimeInVideo:(double)a3;
- (void)setSupportsCropping:(BOOL)a3;
- (void)setWallpaperIdentifier:(id)a3;
- (void)setWallpaperKitData:(id)a3;
- (void)setWallpaperMode:(int64_t)a3;
- (void)setWallpaperName:(id)a3;
- (void)setWallpaperOptions:(id)a3;
- (void)setWallpaperWasUserSet:(BOOL)a3;
- (void)setZoomScale:(double)a3;
@end

@implementation PBUIWallpaperDefaultsWrapper

- (PBUIWallpaperDefaultsWrapper)initWithWallpaperDefaultsDict:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PBUIWallpaperDefaultsWrapper;
  v5 = [(PBUIWallpaperDefaultsWrapper *)&v44 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"SBWallpaperParallaxFactorKey"];

    if (v6)
    {
      v7 = [v4 objectForKey:@"SBWallpaperParallaxFactorKey"];
      [v7 floatValue];
      [(PBUIWallpaperDefaultsWrapper *)v5 setParallaxFactor:v8];
    }
    v9 = [v4 objectForKey:@"SBWallpaperZoomScaleKey"];

    if (v9)
    {
      v10 = [v4 objectForKey:@"SBWallpaperZoomScaleKey"];
      [v10 floatValue];
      [(PBUIWallpaperDefaultsWrapper *)v5 setZoomScale:v11];
    }
    v12 = [v4 objectForKey:@"SBWallpaperCropRectStringKey"];

    if (v12)
    {
      v13 = [v4 objectForKey:@"SBWallpaperCropRectStringKey"];
      CGRect v45 = CGRectFromString(v13);
      -[PBUIWallpaperDefaultsWrapper setCropRect:](v5, "setCropRect:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
    }
    v14 = [v4 objectForKey:@"SBWallpaperSupportsCroppingKey"];

    if (v14)
    {
      v15 = [v4 objectForKey:@"SBWallpaperSupportsCroppingKey"];
      -[PBUIWallpaperDefaultsWrapper setSupportsCropping:](v5, "setSupportsCropping:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKey:@"SBWallpaperMagnifyEnabledKey"];

    if (v16)
    {
      v17 = [v4 objectForKey:@"SBWallpaperMagnifyEnabledKey"];
      -[PBUIWallpaperDefaultsWrapper setMagnifyEnabled:](v5, "setMagnifyEnabled:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKey:@"SBWallpaperPortraitKey"];

    if (v18)
    {
      v19 = [v4 objectForKey:@"SBWallpaperPortraitKey"];
      -[PBUIWallpaperDefaultsWrapper setPortrait:](v5, "setPortrait:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKey:@"SBWallpaperNameKey"];

    if (v20)
    {
      v21 = [v4 objectForKey:@"SBWallpaperNameKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setWallpaperName:v21];
    }
    v22 = [v4 objectForKey:@"SBWallpaperImageHashDataKey"];

    if (v22)
    {
      v23 = [v4 objectForKey:@"SBWallpaperImageHashDataKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setImageHashData:v23];
    }
    v24 = [v4 objectForKey:@"SBWallpaperHasVideoKey"];

    if (v24)
    {
      v25 = [v4 objectForKey:@"SBWallpaperHasVideoKey"];
      -[PBUIWallpaperDefaultsWrapper setHasVideo:](v5, "setHasVideo:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKey:@"SBWallpaperStillTimeInVideoKey"];

    if (v26)
    {
      v27 = [v4 objectForKey:@"SBWallpaperStillTimeInVideoKey"];
      [v27 floatValue];
      [(PBUIWallpaperDefaultsWrapper *)v5 setStillTimeInVideo:v28];
    }
    v29 = [v4 objectForKey:@"SBWallpaperColorDataKey"];

    if (v29)
    {
      v30 = [v4 objectForKey:@"SBWallpaperColorDataKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setColorData:v30];
    }
    v31 = [v4 objectForKey:@"SBWallpaperColorNameKey"];

    if (v31)
    {
      v32 = [v4 objectForKey:@"SBWallpaperColorNameKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setColorName:v32];
    }
    v33 = [v4 objectForKey:@"SBWallpaperGradientDataKey"];

    if (v33)
    {
      v34 = [v4 objectForKey:@"SBWallpaperGradientDataKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setGradientData:v34];
    }
    v35 = [v4 objectForKey:@"kSBProceduralWallpaperHomeDefaultKey"];

    if (v35)
    {
      v36 = [v4 objectForKey:@"kSBProceduralWallpaperHomeDefaultKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setWallpaperIdentifier:v36];
    }
    v37 = [v4 objectForKey:@"kSBProceduralWallpaperHomeOptionsKey"];

    if (v37)
    {
      v38 = [v4 objectForKey:@"kSBProceduralWallpaperHomeOptionsKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setWallpaperOptions:v38];
    }
    v39 = [v4 objectForKey:@"kSBProceduralWallpaperHomeUserSetKey"];

    if (v39)
    {
      v40 = [v4 objectForKey:@"kSBProceduralWallpaperHomeUserSetKey"];
      -[PBUIWallpaperDefaultsWrapper setWallpaperWasUserSet:](v5, "setWallpaperWasUserSet:", [v40 BOOLValue]);
    }
    v41 = [v4 objectForKey:@"SBWallpaperWallpaperKitDataKey"];

    if (v41)
    {
      v42 = [v4 objectForKey:@"SBWallpaperWallpaperKitDataKey"];
      [(PBUIWallpaperDefaultsWrapper *)v5 setWallpaperKitData:v42];
    }
  }

  return v5;
}

+ (id)lockScreenWrapperForLegacyDefaults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PBUIWallpaperDefaultsWrapper);
  [v3 lockScreenParallaxFactor];
  -[PBUIWallpaperDefaultsWrapper setParallaxFactor:](v4, "setParallaxFactor:");
  [v3 lockScreenZoomScale];
  -[PBUIWallpaperDefaultsWrapper setZoomScale:](v4, "setZoomScale:");
  v5 = [v3 lockScreenCropRectString];
  CGRect v17 = CGRectFromString(v5);
  -[PBUIWallpaperDefaultsWrapper setCropRect:](v4, "setCropRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);

  -[PBUIWallpaperDefaultsWrapper setSupportsCropping:](v4, "setSupportsCropping:", [v3 lockScreenSupportsCropping]);
  -[PBUIWallpaperDefaultsWrapper setMagnifyEnabled:](v4, "setMagnifyEnabled:", [v3 lockScreenMagnifyEnabled]);
  -[PBUIWallpaperDefaultsWrapper setPortrait:](v4, "setPortrait:", [v3 lockScreenPortrait]);
  v6 = [v3 lockScreenWallpaperName];
  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperName:v6];

  v7 = [v3 lockScreenImageHashData];
  [(PBUIWallpaperDefaultsWrapper *)v4 setImageHashData:v7];

  [v3 lockScreenStillTimeInVideo];
  [(PBUIWallpaperDefaultsWrapper *)v4 setHasVideo:v8 != 0.0];
  [v3 lockScreenStillTimeInVideo];
  -[PBUIWallpaperDefaultsWrapper setStillTimeInVideo:](v4, "setStillTimeInVideo:");
  v9 = [v3 lockScreenColorData];
  [(PBUIWallpaperDefaultsWrapper *)v4 setColorData:v9];

  v10 = [v3 lockScreenColorName];
  [(PBUIWallpaperDefaultsWrapper *)v4 setColorName:v10];

  float v11 = [v3 lockScreenGradientData];
  [(PBUIWallpaperDefaultsWrapper *)v4 setGradientData:v11];

  v12 = [v3 lockScreenWallpaperIdentifier];
  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperIdentifier:v12];

  v13 = [v3 lockScreenWallpaperOptions];
  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperOptions:v13];

  -[PBUIWallpaperDefaultsWrapper setWallpaperWasUserSet:](v4, "setWallpaperWasUserSet:", [v3 lockScreenWallpaperWasUserSet]);
  v14 = [v3 lockScreenWallpaperKitData];

  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperKitData:v14];
  return v4;
}

+ (id)homeScreenWrapperForLegacyDefaults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PBUIWallpaperDefaultsWrapper);
  [v3 homeScreenParallaxFactor];
  -[PBUIWallpaperDefaultsWrapper setParallaxFactor:](v4, "setParallaxFactor:");
  [v3 homeScreenZoomScale];
  -[PBUIWallpaperDefaultsWrapper setZoomScale:](v4, "setZoomScale:");
  v5 = [v3 homeScreenCropRectString];
  CGRect v16 = CGRectFromString(v5);
  -[PBUIWallpaperDefaultsWrapper setCropRect:](v4, "setCropRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

  -[PBUIWallpaperDefaultsWrapper setSupportsCropping:](v4, "setSupportsCropping:", [v3 homeScreenSupportsCropping]);
  -[PBUIWallpaperDefaultsWrapper setMagnifyEnabled:](v4, "setMagnifyEnabled:", [v3 homeScreenMagnifyEnabled]);
  -[PBUIWallpaperDefaultsWrapper setPortrait:](v4, "setPortrait:", [v3 homeScreenPortrait]);
  v6 = [v3 homeScreenWallpaperName];
  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperName:v6];

  v7 = [v3 homeScreenImageHashData];
  [(PBUIWallpaperDefaultsWrapper *)v4 setImageHashData:v7];

  double v8 = [v3 homeScreenColorData];
  [(PBUIWallpaperDefaultsWrapper *)v4 setColorData:v8];

  v9 = [v3 homeScreenColorName];
  [(PBUIWallpaperDefaultsWrapper *)v4 setColorName:v9];

  v10 = [v3 homeScreenGradientData];
  [(PBUIWallpaperDefaultsWrapper *)v4 setGradientData:v10];

  float v11 = [v3 homeScreenWallpaperIdentifier];
  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperIdentifier:v11];

  v12 = [v3 homeScreenWallpaperOptions];
  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperOptions:v12];

  -[PBUIWallpaperDefaultsWrapper setWallpaperWasUserSet:](v4, "setWallpaperWasUserSet:", [v3 homeScreenWallpaperWasUserSet]);
  v13 = [v3 homeScreenWallpaperKitData];

  [(PBUIWallpaperDefaultsWrapper *)v4 setWallpaperKitData:v13];
  return v4;
}

- (id)wallpaperDefaultsDict
{
  [(PBUIWallpaperDefaultsWrapper *)self cropRect];
  if (CGRectEqualToRect(v26, *MEMORY[0x1E4F1DB28]))
  {
    id v3 = 0;
  }
  else
  {
    [(PBUIWallpaperDefaultsWrapper *)self cropRect];
    id v3 = NSStringFromCGRect(v27);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = NSNumber;
  [(PBUIWallpaperDefaultsWrapper *)self parallaxFactor];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"SBWallpaperParallaxFactorKey"];

  v7 = NSNumber;
  [(PBUIWallpaperDefaultsWrapper *)self zoomScale];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:@"SBWallpaperZoomScaleKey"];

  [v4 setObject:v3 forKeyedSubscript:@"SBWallpaperCropRectStringKey"];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperDefaultsWrapper supportsCropping](self, "supportsCropping"));
  [v4 setObject:v9 forKeyedSubscript:@"SBWallpaperSupportsCroppingKey"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperDefaultsWrapper magnifyEnabled](self, "magnifyEnabled"));
  [v4 setObject:v10 forKeyedSubscript:@"SBWallpaperMagnifyEnabledKey"];

  float v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperDefaultsWrapper portrait](self, "portrait"));
  [v4 setObject:v11 forKeyedSubscript:@"SBWallpaperPortraitKey"];

  v12 = [(PBUIWallpaperDefaultsWrapper *)self wallpaperName];
  [v4 setObject:v12 forKeyedSubscript:@"SBWallpaperNameKey"];

  v13 = [(PBUIWallpaperDefaultsWrapper *)self imageHashData];
  [v4 setObject:v13 forKeyedSubscript:@"SBWallpaperImageHashDataKey"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperDefaultsWrapper hasVideo](self, "hasVideo"));
  [v4 setObject:v14 forKeyedSubscript:@"SBWallpaperHasVideoKey"];

  v15 = NSNumber;
  [(PBUIWallpaperDefaultsWrapper *)self stillTimeInVideo];
  CGRect v16 = objc_msgSend(v15, "numberWithDouble:");
  [v4 setObject:v16 forKeyedSubscript:@"SBWallpaperStillTimeInVideoKey"];

  CGRect v17 = [(PBUIWallpaperDefaultsWrapper *)self colorData];
  [v4 setObject:v17 forKeyedSubscript:@"SBWallpaperColorDataKey"];

  v18 = [(PBUIWallpaperDefaultsWrapper *)self colorName];
  [v4 setObject:v18 forKeyedSubscript:@"SBWallpaperColorNameKey"];

  v19 = [(PBUIWallpaperDefaultsWrapper *)self gradientData];
  [v4 setObject:v19 forKeyedSubscript:@"SBWallpaperGradientDataKey"];

  v20 = [(PBUIWallpaperDefaultsWrapper *)self wallpaperIdentifier];
  [v4 setObject:v20 forKeyedSubscript:@"kSBProceduralWallpaperHomeDefaultKey"];

  v21 = [(PBUIWallpaperDefaultsWrapper *)self wallpaperOptions];
  [v4 setObject:v21 forKeyedSubscript:@"kSBProceduralWallpaperHomeOptionsKey"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperDefaultsWrapper wallpaperWasUserSet](self, "wallpaperWasUserSet"));
  [v4 setObject:v22 forKeyedSubscript:@"kSBProceduralWallpaperHomeUserSetKey"];

  v23 = [(PBUIWallpaperDefaultsWrapper *)self wallpaperKitData];
  [v4 setObject:v23 forKeyedSubscript:@"SBWallpaperWallpaperKitDataKey"];

  return v4;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (BOOL)supportsCropping
{
  return self->_supportsCropping;
}

- (void)setSupportsCropping:(BOOL)a3
{
  self->_supportsCropping = a3;
}

- (BOOL)magnifyEnabled
{
  return self->_magnifyEnabled;
}

- (void)setMagnifyEnabled:(BOOL)a3
{
  self->_magnifyEnabled = a3;
}

- (BOOL)portrait
{
  return self->_portrait;
}

- (void)setPortrait:(BOOL)a3
{
  self->_portrait = a3;
}

- (NSString)wallpaperName
{
  return self->_wallpaperName;
}

- (void)setWallpaperName:(id)a3
{
}

- (NSData)imageHashData
{
  return self->_imageHashData;
}

- (void)setImageHashData:(id)a3
{
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (void)setWallpaperMode:(int64_t)a3
{
  self->_wallpaperMode = a3;
}

- (NSDictionary)wallpaperKitData
{
  return self->_wallpaperKitData;
}

- (void)setWallpaperKitData:(id)a3
{
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void)setStillTimeInVideo:(double)a3
{
  self->_stillTimeInVideo = a3;
}

- (NSString)wallpaperIdentifier
{
  return self->_wallpaperIdentifier;
}

- (void)setWallpaperIdentifier:(id)a3
{
}

- (NSDictionary)wallpaperOptions
{
  return self->_wallpaperOptions;
}

- (void)setWallpaperOptions:(id)a3
{
}

- (BOOL)wallpaperWasUserSet
{
  return self->_wallpaperWasUserSet;
}

- (void)setWallpaperWasUserSet:(BOOL)a3
{
  self->_wallpaperWasUserSet = a3;
}

- (NSData)colorData
{
  return self->_colorData;
}

- (void)setColorData:(id)a3
{
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void)setColorName:(id)a3
{
}

- (NSData)gradientData
{
  return self->_gradientData;
}

- (void)setGradientData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientData, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_colorData, 0);
  objc_storeStrong((id *)&self->_wallpaperOptions, 0);
  objc_storeStrong((id *)&self->_wallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_wallpaperKitData, 0);
  objc_storeStrong((id *)&self->_imageHashData, 0);
  objc_storeStrong((id *)&self->_wallpaperName, 0);
}

@end