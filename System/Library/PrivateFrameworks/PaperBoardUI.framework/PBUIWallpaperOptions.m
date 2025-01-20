@interface PBUIWallpaperOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8;
+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10;
+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperKitData:(id)a11;
+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperMode:(int64_t)a11 wallpaperStatus:(int64_t)a12;
+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperMode:(int64_t)a11 wallpaperStatus:(int64_t)a12 wallpaperKitData:(id)a13;
+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 supportsRotation:(BOOL)a8 rotationAngle:(double)a9 portrait:(BOOL)a10 hasVideo:(BOOL)a11 stillTimeInVideo:(double)a12 wallpaperMode:(int64_t)a13 wallpaperStatus:(int64_t)a14;
- (BOOL)hasVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLooselyEqualToWallpaperOptions:(id)a3;
- (BOOL)isMagnifyEnabled;
- (BOOL)isPortrait;
- (BOOL)parallaxEnabled;
- (BOOL)supportsCropping;
- (BOOL)supportsRotation;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (CGRect)cropRect;
- (CGSize)bestWallpaperSizeForWallpaperSize:(CGSize)a3 wallpaperScale:(double)a4 deviceType:(int64_t)a5 imageScale:(double)a6;
- (NSData)persistentDataRepresentation;
- (NSDictionary)wallpaperKitData;
- (NSString)description;
- (NSString)name;
- (PBUIWallpaperOptions)init;
- (PBUIWallpaperOptions)initWithCoder:(id)a3;
- (PBUIWallpaperOptions)initWithContentsOfURL:(id)a3;
- (PBUIWallpaperOptions)initWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 supportsRotation:(BOOL)a8 rotationAngle:(double)a9 portrait:(BOOL)a10 hasVideo:(BOOL)a11 stillTimeInVideo:(double)a12 wallpaperMode:(int64_t)a13 wallpaperStatus:(int64_t)a14 wallpaperKitData:(id)a15;
- (PBUIWallpaperOptions)initWithPersistentDataRepresentation:(id)a3;
- (PBUIWallpaperOptions)initWithStream:(id)a3;
- (double)parallaxFactor;
- (double)rotationAngle;
- (double)stillTimeInVideo;
- (double)zoomScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)persistentPropertyList;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)wallpaperMode;
- (int64_t)wallpaperStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setMagnifyEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParallaxFactor:(double)a3;
- (void)setPortrait:(BOOL)a3;
- (void)setRotationAngle:(double)a3;
- (void)setStillTimeInVideo:(double)a3;
- (void)setSupportsCropping:(BOOL)a3;
- (void)setSupportsRotation:(BOOL)a3;
- (void)setWallpaperKitData:(id)a3;
- (void)setWallpaperMode:(int64_t)a3;
- (void)setWallpaperStatus:(int64_t)a3;
- (void)setZoomScale:(double)a3;
@end

@implementation PBUIWallpaperOptions

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v13 = a6;
  id v17 = a3;
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v17, v13, 0, v8, 0, 0, a4, a5, x, y, width, height, 0.0, 0.0, 0, 0);

  return v18;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v17 = a6;
  id v21 = a3;
  v22 = objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v21, v17, 0, v12, v11, 0, a4, a5, x, y, width, height, 0.0, a10, 0, 0);

  return v22;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperKitData:(id)a11
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v18 = a6;
  id v23 = a11;
  id v24 = a3;
  v25 = objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v24, v18, 0, v13, v12, 0, a4, a5, x, y, width, height, 0.0, a10, 0, v23);

  return v25;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperMode:(int64_t)a11 wallpaperStatus:(int64_t)a12
{
  BOOL v15 = a9;
  BOOL v16 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v21 = a6;
  id v25 = a3;
  v26 = objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v25, v21, 0, v16, v15, a11, a4, a5, x, y, width, height, 0.0, a10, a12, 0);

  return v26;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 supportsRotation:(BOOL)a8 rotationAngle:(double)a9 portrait:(BOOL)a10 hasVideo:(BOOL)a11 stillTimeInVideo:(double)a12 wallpaperMode:(int64_t)a13 wallpaperStatus:(int64_t)a14
{
  BOOL v15 = a11;
  BOOL v16 = a10;
  BOOL v17 = a8;
  BOOL v18 = a6;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v28 = a3;
  v29 = objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v28, v18, v17, v16, v15, a13, a4, a5, x, y, width, height, a9, a12, a14, 0);

  return v29;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperMode:(int64_t)a11 wallpaperStatus:(int64_t)a12 wallpaperKitData:(id)a13
{
  BOOL v15 = a9;
  BOOL v16 = a8;
  BOOL v17 = a6;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v27 = a13;
  id v28 = a3;
  v29 = objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v28, v17, 0, v16, v15, a11, a4, a5, x, y, width, height, 0.0, a10, a12, v27);

  return v29;
}

- (PBUIWallpaperOptions)initWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 supportsRotation:(BOOL)a8 rotationAngle:(double)a9 portrait:(BOOL)a10 hasVideo:(BOOL)a11 stillTimeInVideo:(double)a12 wallpaperMode:(int64_t)a13 wallpaperStatus:(int64_t)a14 wallpaperKitData:(id)a15
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v29 = a3;
  id v30 = a15;
  v38.receiver = self;
  v38.super_class = (Class)PBUIWallpaperOptions;
  v31 = [(PBUIWallpaperOptions *)&v38 init];
  if (v31)
  {
    uint64_t v32 = [v29 copy];
    name = v31->_name;
    v31->_name = (NSString *)v32;

    v31->_cropRect.origin.CGFloat x = x;
    v31->_cropRect.origin.CGFloat y = y;
    v31->_cropRect.size.CGFloat width = width;
    v31->_cropRect.size.CGFloat height = height;
    v31->_supportsCropping = a6;
    v31->_supportsRotation = a8;
    v31->_parallaxFactor = a4;
    v31->_zoomScale = a5;
    v31->_portrait = a10;
    v31->_hasVideo = a11;
    v31->_rotationAngle = a9;
    v31->_stillTimeInVideo = a12;
    v31->_wallpaperMode = a13;
    v31->_wallpaperStatus = a14;
    uint64_t v34 = [v30 copy];
    wallpaperKitData = v31->_wallpaperKitData;
    v31->_wallpaperKitData = (NSDictionary *)v34;

    v36 = v31;
  }

  return v31;
}

- (PBUIWallpaperOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)PBUIWallpaperOptions;
  result = [(PBUIWallpaperOptions *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_parallaxFactor = _Q0;
    result->_rotationAngle = 0.0;
    result->_portrait = 1;
  }
  return result;
}

- (PBUIWallpaperOptions)initWithContentsOfURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA10];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithURL:v5];

  [v6 open];
  v7 = [(PBUIWallpaperOptions *)self initWithStream:v6];
  [v6 close];

  return v7;
}

- (PBUIWallpaperOptions)initWithPersistentDataRepresentation:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA10];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  [v6 open];
  v7 = [(PBUIWallpaperOptions *)self initWithStream:v6];
  [v6 close];

  return v7;
}

- (PBUIWallpaperOptions)initWithStream:(id)a3
{
  v4 = [MEMORY[0x1E4F28F98] propertyListWithStream:a3 options:0 format:0 error:0];
  if (v4)
  {
    id v5 = [(PBUIWallpaperOptions *)self init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"Name"];
      v7 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v9 = [v6 copy];
        name = v5->_name;
        v5->_name = (NSString *)v9;
      }
      BOOL v11 = [v4 objectForKey:@"CropRect"];
      BOOL v12 = self;
      char v13 = objc_opt_isKindOfClass();

      if (v13) {
        v5->_cropRect = CGRectFromString(v11);
      }
      v14 = [v4 objectForKey:@"RotationAngle"];
      if (objc_opt_respondsToSelector())
      {
        [v14 doubleValue];
        v5->_rotationAngle = v15;
      }
      BOOL v16 = [v4 objectForKey:@"ParallaxFactor"];
      if (objc_opt_respondsToSelector())
      {
        [v16 doubleValue];
        v5->_parallaxFactor = v17;
      }
      BOOL v18 = [v4 objectForKey:@"SupportsCropping"];
      if (objc_opt_respondsToSelector()) {
        v5->_supportsCropping = [v18 BOOLValue];
      }
      v19 = [v4 objectForKey:@"SupportsRotation"];
      if (objc_opt_respondsToSelector()) {
        v5->_supportsRotation = [v19 BOOLValue];
      }
      objc_super v38 = v14;
      v20 = [v4 objectForKey:@"MagnifyEnabled"];
      if (objc_opt_respondsToSelector()) {
        v5->_magnifyEnabled = [v20 BOOLValue];
      }
      uint64_t v34 = v20;
      v37 = v16;
      BOOL v21 = [v4 objectForKey:@"ZoomScale"];
      if (objc_opt_respondsToSelector())
      {
        [v21 doubleValue];
        v5->_zoomScale = v22;
      }
      v40 = v6;
      id v23 = [v4 objectForKey:@"Portrait"];
      if (objc_opt_respondsToSelector()) {
        v5->_portrait = [v23 BOOLValue];
      }
      id v24 = [v4 objectForKey:@"HasVideo"];
      if (objc_opt_respondsToSelector()) {
        v5->_hasVideo = [v24 BOOLValue];
      }
      v39 = v11;
      id v25 = [v4 objectForKey:@"StillTimeInVideo"];
      if (objc_opt_respondsToSelector())
      {
        [v25 doubleValue];
        v5->_stillTimeInVideo = v26;
      }
      v35 = v19;
      v36 = v18;
      id v27 = [v4 objectForKey:@"WallpaperMode"];
      if (objc_opt_respondsToSelector())
      {
        [v27 doubleValue];
        v5->_wallpaperMode = (uint64_t)v28;
      }
      id v29 = [v4 objectForKey:@"WallpaperKitData"];
      id v30 = self;
      char v31 = objc_opt_isKindOfClass();

      if (v31) {
        objc_storeStrong((id *)&v5->_wallpaperKitData, v29);
      }
    }
    self = v5;
    uint64_t v32 = self;
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

- (BOOL)parallaxEnabled
{
  return BSFloatIsZero() ^ 1;
}

- (CGSize)bestWallpaperSizeForWallpaperSize:(CGSize)a3 wallpaperScale:(double)a4 deviceType:(int64_t)a5 imageScale:(double)a6
{
  double width = a3.width;
  double height = a3.height;
  [(PBUIWallpaperOptions *)self cropRect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(PBUIWallpaperOptions *)self zoomScale];
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, v18, v18);
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, a6, a6);
  CGAffineTransform v46 = v48;
  v50.origin.CGFloat x = v11;
  v50.origin.CGFloat y = v13;
  v50.size.double width = v15;
  v50.size.double height = v17;
  CGRect v51 = CGRectApplyAffineTransform(v50, &v46);
  double v19 = v51.size.width;
  double v20 = v51.size.height;
  CGAffineTransform v46 = v47;
  CGRect v52 = CGRectApplyAffineTransform(v51, &v46);
  CGFloat x = v52.origin.x;
  CGFloat y = v52.origin.y;
  double v22 = v52.size.width;
  double v23 = v52.size.height;
  [(PBUIWallpaperOptions *)self parallaxFactor];
  +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", a5, [(PBUIWallpaperOptions *)self isPortrait], width, height, v24);
  double v26 = v25;
  double v28 = v27;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, a4, a4);
  double v29 = v28 * v46.c + v46.a * v26;
  double v30 = v28 * v46.d + v46.b * v26;
  if (v29 < v22 && v30 < v23)
  {
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.double width = v22;
    v53.size.double height = v23;
    double v32 = CGRectGetWidth(v53);
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.double width = v22;
    v54.size.double height = v23;
    double v33 = v32 / CGRectGetHeight(v54);
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.double width = v22;
    v55.size.double height = v23;
    double v34 = CGRectGetWidth(v55);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.double width = v22;
    v56.size.double height = v23;
    CGFloat v35 = CGRectGetHeight(v56);
    BOOL v36 = v34 <= v35;
    if (v34 <= v35) {
      double v37 = v30 * v33;
    }
    else {
      double v37 = v29;
    }
    if (v36) {
      double v38 = v30;
    }
    else {
      double v38 = v29 * v33;
    }
    CGAffineTransform v44 = v47;
    CGAffineTransformInvert(&v45, &v44);
    double v19 = v38 * v45.c + v45.a * v37;
    double v20 = v38 * v45.d + v45.b * v37;
  }
  double v39 = v19;
  double v40 = v20;
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PBUIWallpaperOptions);
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_name copy];
    name = v4->_name;
    v4->_name = (NSString *)v5;

    CGSize size = self->_cropRect.size;
    v4->_cropRect.origin = self->_cropRect.origin;
    v4->_cropRect.CGSize size = size;
    v4->_rotationAngle = self->_rotationAngle;
    v4->_parallaxFactor = self->_parallaxFactor;
    v4->_supportsCropping = self->_supportsCropping;
    v4->_supportsRotation = self->_supportsRotation;
    v4->_magnifyEnabled = self->_magnifyEnabled;
    v4->_zoomScale = self->_zoomScale;
    v4->_portrait = self->_portrait;
    v4->_hasVideo = self->_hasVideo;
    v4->_stillTimeInVideo = self->_stillTimeInVideo;
    v4->_wallpaperMode = self->_wallpaperMode;
    uint64_t v8 = [(NSDictionary *)self->_wallpaperKitData copy];
    wallpaperKitData = v4->_wallpaperKitData;
    v4->_wallpaperKitData = (NSDictionary *)v8;

    double v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBUIWallpaperOptions *)a3;
  if (self == v4)
  {
    char v45 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      uint64_t v8 = [(PBUIWallpaperOptions *)self name];
      uint64_t v9 = [(PBUIWallpaperOptions *)v7 name];
      int v10 = BSEqualObjects();

      if (!v10) {
        goto LABEL_19;
      }
      [(PBUIWallpaperOptions *)self cropRect];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      [(PBUIWallpaperOptions *)v7 cropRect];
      v48.origin.CGFloat x = v19;
      v48.origin.CGFloat y = v20;
      v48.size.double width = v21;
      v48.size.double height = v22;
      v47.origin.CGFloat x = v12;
      v47.origin.CGFloat y = v14;
      v47.size.double width = v16;
      v47.size.double height = v18;
      if (!CGRectEqualToRect(v47, v48)) {
        goto LABEL_19;
      }
      [(PBUIWallpaperOptions *)self rotationAngle];
      double v24 = v23;
      [(PBUIWallpaperOptions *)v7 rotationAngle];
      if (v24 != v25) {
        goto LABEL_19;
      }
      [(PBUIWallpaperOptions *)self parallaxFactor];
      double v27 = v26;
      [(PBUIWallpaperOptions *)v7 parallaxFactor];
      if (v27 != v28) {
        goto LABEL_19;
      }
      BOOL v29 = [(PBUIWallpaperOptions *)self supportsCropping];
      if (v29 != [(PBUIWallpaperOptions *)v7 supportsCropping]) {
        goto LABEL_19;
      }
      BOOL v30 = [(PBUIWallpaperOptions *)self supportsRotation];
      if (v30 != [(PBUIWallpaperOptions *)v7 supportsRotation]) {
        goto LABEL_19;
      }
      BOOL v31 = [(PBUIWallpaperOptions *)self isMagnifyEnabled];
      if (v31 != [(PBUIWallpaperOptions *)v7 isMagnifyEnabled]) {
        goto LABEL_19;
      }
      [(PBUIWallpaperOptions *)self zoomScale];
      double v33 = v32;
      [(PBUIWallpaperOptions *)v7 zoomScale];
      if (v33 != v34) {
        goto LABEL_19;
      }
      BOOL v35 = [(PBUIWallpaperOptions *)self isPortrait];
      if (v35 == [(PBUIWallpaperOptions *)v7 isPortrait]
        && (BOOL v36 = [(PBUIWallpaperOptions *)self hasVideo],
            v36 == [(PBUIWallpaperOptions *)v7 hasVideo])
        && ([(PBUIWallpaperOptions *)self stillTimeInVideo],
            double v38 = v37,
            [(PBUIWallpaperOptions *)v7 stillTimeInVideo],
            v38 == v39)
        && (int64_t v40 = [(PBUIWallpaperOptions *)self wallpaperMode],
            v40 == [(PBUIWallpaperOptions *)v7 wallpaperMode]))
      {
        uint64_t v41 = [(PBUIWallpaperOptions *)self wallpaperKitData];
        if (v41)
        {
          v42 = (void *)v41;
          v43 = [(PBUIWallpaperOptions *)self wallpaperKitData];
          CGAffineTransform v44 = [(PBUIWallpaperOptions *)v7 wallpaperKitData];
          char v45 = [v43 isEqual:v44];
        }
        else
        {
          char v45 = 1;
        }
      }
      else
      {
LABEL_19:
        char v45 = 0;
      }
    }
    else
    {
      char v45 = 0;
    }
  }

  return v45;
}

- (BOOL)isLooselyEqualToWallpaperOptions:(id)a3
{
  id v4 = a3;
  if ([(PBUIWallpaperOptions *)self isEqual:v4]) {
    goto LABEL_2;
  }
  [(PBUIWallpaperOptions *)self cropRect];
  CGFloat v8 = v7;
  v41.origin.CGFloat x = v9;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v4 cropRect];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(PBUIWallpaperOptions *)self zoomScale];
  CGFloat rect_24 = v22;
  [v4 zoomScale];
  CGFloat v24 = v23;
  CGFloat rect_8 = v21;
  v43.origin.CGFloat x = v8;
  v43.origin.CGFloat y = v41.origin.x;
  v43.size.CGFloat width = v11;
  v43.size.CGFloat height = v13;
  CGFloat rect_16 = v15;
  v56.origin.CGFloat x = v15;
  CGFloat v25 = v17;
  v56.origin.CGFloat y = v17;
  v56.size.CGFloat width = v19;
  v56.size.CGFloat height = v21;
  BOOL v5 = 0;
  if (!CGRectEqualToRect(v43, v56) && rect_24 == v24)
  {
    CGAffineTransformMakeScale(&v42, rect_24, rect_24);
    v44.origin.CGFloat x = v8;
    v44.origin.CGFloat y = v41.origin.x;
    v44.size.CGFloat width = v11;
    v44.size.CGFloat height = v13;
    CGRect v45 = CGRectApplyAffineTransform(v44, &v42);
    CGFloat x = v45.origin.x;
    CGFloat y = v45.origin.y;
    CGFloat width = v45.size.width;
    CGFloat height = v45.size.height;
    CGAffineTransformMakeScale((CGAffineTransform *)&v41.origin.y, v24, v24);
    v46.size.CGFloat height = rect_8;
    v46.origin.CGFloat x = rect_16;
    v46.origin.CGFloat y = v25;
    v46.size.CGFloat width = v19;
    CGRect v47 = CGRectApplyAffineTransform(v46, (CGAffineTransform *)&v41.origin.y);
    CGFloat v30 = v47.origin.x;
    CGFloat v31 = v47.origin.y;
    CGFloat v32 = v47.size.width;
    CGFloat v33 = v47.size.height;
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    v57.origin.CGFloat x = v30;
    v57.origin.CGFloat y = v31;
    v57.size.CGFloat width = v32;
    v57.size.CGFloat height = v33;
    if (CGRectEqualToRect(v47, v57))
    {
LABEL_2:
      BOOL v5 = 1;
      goto LABEL_3;
    }
    v41.origin.CGFloat x = x;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v48);
    v49.origin.CGFloat x = v30;
    v49.origin.CGFloat y = v31;
    v49.size.CGFloat width = v32;
    v49.size.CGFloat height = v33;
    if (vabdd_f64(MinX, CGRectGetMinX(v49)) >= 1.0) {
      goto LABEL_11;
    }
    v50.origin.CGFloat x = v41.origin.x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v50);
    v51.origin.CGFloat x = v30;
    v51.origin.CGFloat y = v31;
    v51.size.CGFloat width = v32;
    v51.size.CGFloat height = v33;
    if (vabdd_f64(MinY, CGRectGetMinY(v51)) >= 1.0) {
      goto LABEL_11;
    }
    v52.origin.CGFloat x = v41.origin.x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    double v36 = CGRectGetWidth(v52);
    v53.origin.CGFloat x = v30;
    v53.origin.CGFloat y = v31;
    v53.size.CGFloat width = v32;
    v53.size.CGFloat height = v33;
    if (vabdd_f64(v36, CGRectGetWidth(v53)) >= 1.0)
    {
LABEL_11:
      BOOL v5 = 0;
    }
    else
    {
      v54.origin.CGFloat x = v41.origin.x;
      v54.origin.CGFloat y = y;
      v54.size.CGFloat width = width;
      v54.size.CGFloat height = height;
      double v37 = CGRectGetHeight(v54);
      v55.origin.CGFloat x = v30;
      v55.origin.CGFloat y = v31;
      v55.size.CGFloat width = v32;
      v55.size.CGFloat height = v33;
      BOOL v5 = vabdd_f64(v37, CGRectGetHeight(v55)) < 1.0;
    }
  }
LABEL_3:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PBUIWallpaperOptions *)self supportsCropping];
  BOOL v4 = [(PBUIWallpaperOptions *)self isMagnifyEnabled];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(PBUIWallpaperOptions *)self isPortrait]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(PBUIWallpaperOptions *)self hasVideo];
  uint64_t v9 = 8;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 | v7 | v9;
  BOOL v11 = [(PBUIWallpaperOptions *)self supportsRotation];
  uint64_t v12 = 16;
  if (!v11) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v10 | v12;
  double v14 = [(PBUIWallpaperOptions *)self name];
  double v15 = (double)(unint64_t)(v13 + [v14 hash]);
  [(PBUIWallpaperOptions *)self parallaxFactor];
  double v17 = v16 + v15;
  [(PBUIWallpaperOptions *)self zoomScale];
  double v19 = v18 + v17;
  [(PBUIWallpaperOptions *)self stillTimeInVideo];
  double v21 = v20 + v19 + (double)[(PBUIWallpaperOptions *)self wallpaperMode];
  [(PBUIWallpaperOptions *)self rotationAngle];
  double v23 = v22 + v21;
  CGFloat v24 = [(PBUIWallpaperOptions *)self wallpaperKitData];
  unint64_t v25 = (unint64_t)(v23 + (double)(unint64_t)[v24 hash]);

  return v25;
}

- (id)persistentPropertyList
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [(PBUIWallpaperOptions *)self name];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"Name"];
  }
  uint64_t v5 = NSNumber;
  [(PBUIWallpaperOptions *)self parallaxFactor];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"ParallaxFactor"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled"));
  [v3 setObject:v7 forKeyedSubscript:@"MagnifyEnabled"];

  BOOL v8 = NSNumber;
  [(PBUIWallpaperOptions *)self zoomScale];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"ZoomScale"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping"));
  [v3 setObject:v10 forKeyedSubscript:@"SupportsCropping"];

  BOOL v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation"));
  [v3 setObject:v11 forKeyedSubscript:@"SupportsRotation"];

  [(PBUIWallpaperOptions *)self cropRect];
  uint64_t v12 = NSStringFromCGRect(v23);
  [v3 setObject:v12 forKeyedSubscript:@"CropRect"];

  uint64_t v13 = NSNumber;
  [(PBUIWallpaperOptions *)self rotationAngle];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  [v3 setObject:v14 forKeyedSubscript:@"RotationAngle"];

  double v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperOptions isPortrait](self, "isPortrait"));
  [v3 setObject:v15 forKeyedSubscript:@"Portrait"];

  double v16 = objc_msgSend(NSNumber, "numberWithBool:", -[PBUIWallpaperOptions hasVideo](self, "hasVideo"));
  [v3 setObject:v16 forKeyedSubscript:@"HasVideo"];

  double v17 = NSNumber;
  [(PBUIWallpaperOptions *)self stillTimeInVideo];
  double v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"StillTimeInVideo"];

  double v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode"));
  [v3 setObject:v19 forKeyedSubscript:@"WallpaperMode"];

  double v20 = [(PBUIWallpaperOptions *)self wallpaperKitData];
  [v3 setObject:v20 forKeyedSubscript:@"WallpaperKitData"];

  return v3;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CAA8];
  id v7 = a3;
  BOOL v8 = (void *)[[v6 alloc] initWithURL:v7 append:0];

  [v8 open];
  uint64_t v9 = [(PBUIWallpaperOptions *)self persistentPropertyList];
  LOBYTE(a4) = [MEMORY[0x1E4F28F98] writePropertyList:v9 toStream:v8 format:200 options:0 error:a4] != 0;
  [v8 close];

  return (char)a4;
}

- (NSData)persistentDataRepresentation
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToMemory];
  [v3 open];
  BOOL v4 = [(PBUIWallpaperOptions *)self persistentPropertyList];
  uint64_t v5 = [MEMORY[0x1E4F28F98] writePropertyList:v4 toStream:v3 format:200 options:0 error:0];
  [v3 close];
  if (!v5
    || ([v3 propertyForKey:*MEMORY[0x1E4F1C4C0]], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to make persistentDataRepresentation" userInfo:0];
    objc_exception_throw(v9);
  }
  id v7 = (void *)v6;

  return (NSData *)v7;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperOptions *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(PBUIWallpaperOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = [(PBUIWallpaperOptions *)self name];
  id v6 = (id)[v4 appendObject:v5 withName:@"name"];

  [(PBUIWallpaperOptions *)self cropRect];
  id v7 = (id)objc_msgSend(v4, "appendRect:withName:", @"cropRect");
  [(PBUIWallpaperOptions *)self rotationAngle];
  id v8 = (id)objc_msgSend(v4, "appendFloat:withName:", @"rotationAngle");
  [(PBUIWallpaperOptions *)self parallaxFactor];
  id v9 = (id)objc_msgSend(v4, "appendFloat:withName:", @"parallaxFactor");
  id v10 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping"), @"supportsCropping");
  id v11 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation"), @"supportsRotation");
  id v12 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled"), @"magnifyEnabled");
  [(PBUIWallpaperOptions *)self zoomScale];
  id v13 = (id)objc_msgSend(v4, "appendFloat:withName:", @"zoomScale");
  id v14 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions isPortrait](self, "isPortrait"), @"portrait");
  id v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions hasVideo](self, "hasVideo"), @"hasVideo");
  [(PBUIWallpaperOptions *)self stillTimeInVideo];
  id v16 = (id)objc_msgSend(v4, "appendFloat:withName:", @"stillTimeInVideo");
  double v17 = PBUIStringForWallpaperMode([(PBUIWallpaperOptions *)self wallpaperMode]);
  [v4 appendString:v17 withName:@"wallpaperMode"];

  double v18 = [(PBUIWallpaperOptions *)self wallpaperKitData];
  id v19 = (id)[v4 appendObject:v18 withName:@"wallpaperKitData"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIWallpaperOptions *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(PBUIWallpaperOptions *)self name];
  [v9 encodeObject:v4 forKey:@"name"];

  [(PBUIWallpaperOptions *)self cropRect];
  objc_msgSend(v9, "encodeCGRect:forKey:", @"cropRect");
  [(PBUIWallpaperOptions *)self rotationAngle];
  objc_msgSend(v9, "encodeDouble:forKey:", @"rotationAngle");
  [(PBUIWallpaperOptions *)self parallaxFactor];
  objc_msgSend(v9, "encodeDouble:forKey:", @"parallaxFactor");
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping"), @"supportsCropping");
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation"), @"supportsRotation");
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled"), @"magnifyEnabled");
  [(PBUIWallpaperOptions *)self zoomScale];
  objc_msgSend(v9, "encodeDouble:forKey:", @"zoomScale");
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions isPortrait](self, "isPortrait"), @"portrait");
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions hasVideo](self, "hasVideo"), @"hasVideo");
  [(PBUIWallpaperOptions *)self stillTimeInVideo];
  objc_msgSend(v9, "encodeDouble:forKey:", @"stillTimeInVideo");
  objc_msgSend(v9, "encodeInteger:forKey:", -[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode"), @"wallpaperMode");
  objc_msgSend(v9, "encodeInteger:forKey:", -[PBUIWallpaperOptions wallpaperStatus](self, "wallpaperStatus"), @"wallpaperStatus");
  uint64_t v5 = [(PBUIWallpaperOptions *)self wallpaperKitData];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28F98];
    id v7 = [(PBUIWallpaperOptions *)self wallpaperKitData];
    id v8 = [v6 dataWithPropertyList:v7 format:200 options:0 error:0];

    [v9 encodeObject:v8 forKey:@"wallpaperKitData"];
  }
}

- (PBUIWallpaperOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PBUIWallpaperOptions;
  uint64_t v5 = [(PBUIWallpaperOptions *)&v23 init];
  if (v5)
  {
    id v6 = self;
    id v7 = [v4 decodeObjectOfClass:v6 forKey:@"name"];
    uint64_t v8 = [v7 copy];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    [v4 decodeCGRectForKey:@"cropRect"];
    v5->_cropRect.origin.CGFloat x = v10;
    v5->_cropRect.origin.CGFloat y = v11;
    v5->_cropRect.size.CGFloat width = v12;
    v5->_cropRect.size.CGFloat height = v13;
    [v4 decodeDoubleForKey:@"rotationAngle"];
    v5->_rotationAngle = v14;
    [v4 decodeDoubleForKey:@"parallaxFactor"];
    v5->_parallaxFactor = v15;
    v5->_supportsCropping = [v4 decodeBoolForKey:@"supportsCropping"];
    v5->_supportsRotation = [v4 decodeBoolForKey:@"supportsRotation"];
    v5->_magnifyEnabled = [v4 decodeBoolForKey:@"magnifyEnabled"];
    [v4 decodeDoubleForKey:@"zoomScale"];
    v5->_zoomScale = v16;
    v5->_portrait = [v4 decodeBoolForKey:@"portrait"];
    v5->_hasVideo = [v4 decodeBoolForKey:@"hasVideo"];
    [v4 decodeDoubleForKey:@"stillTimeInVideo"];
    v5->_stillTimeInVideo = v17;
    v5->_wallpaperMode = [v4 decodeIntegerForKey:@"wallpaperMode"];
    v5->_wallpaperStatus = [v4 decodeIntegerForKey:@"wallpaperStatus"];
    double v18 = self;
    id v19 = [v4 decodeObjectOfClass:v18 forKey:@"wallpaperKitData"];

    if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F28F98] propertyListWithData:v19 options:0 format:0 error:0];
      wallpaperKitData = v5->_wallpaperKitData;
      v5->_wallpaperKitData = (NSDictionary *)v20;
    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (BOOL)isMagnifyEnabled
{
  return self->_magnifyEnabled;
}

- (void)setMagnifyEnabled:(BOOL)a3
{
  self->_magnifyEnabled = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (BOOL)supportsCropping
{
  return self->_supportsCropping;
}

- (void)setSupportsCropping:(BOOL)a3
{
  self->_supportsCropping = a3;
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

- (BOOL)supportsRotation
{
  return self->_supportsRotation;
}

- (void)setSupportsRotation:(BOOL)a3
{
  self->_supportsRotation = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (BOOL)isPortrait
{
  return self->_portrait;
}

- (void)setPortrait:(BOOL)a3
{
  self->_portrait = a3;
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

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (void)setWallpaperMode:(int64_t)a3
{
  self->_wallpaperMode = a3;
}

- (int64_t)wallpaperStatus
{
  return self->_wallpaperStatus;
}

- (void)setWallpaperStatus:(int64_t)a3
{
  self->_wallpaperStatus = a3;
}

- (NSDictionary)wallpaperKitData
{
  return self->_wallpaperKitData;
}

- (void)setWallpaperKitData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperKitData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end