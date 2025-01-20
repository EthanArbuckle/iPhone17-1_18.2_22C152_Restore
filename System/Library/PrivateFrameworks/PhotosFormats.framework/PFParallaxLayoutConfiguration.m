@interface PFParallaxLayoutConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4 orientation:(int64_t)a5;
+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4 startingWithConfiguration:(id)a5 orientation:(int64_t)a6;
+ (id)deviceConfigurationForOrientation:(int64_t)a3;
+ (id)genericConfigurationForOrientation:(int64_t)a3;
+ (id)genericPadConfigurationForOrientation:(int64_t)a3;
+ (id)layoutConfigurationFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutConfiguration:(id)a3;
- (CGRect)inactiveTimeRect;
- (CGRect)timeOverlapCheckBottom;
- (CGRect)timeOverlapCheckTop;
- (CGRect)timeRect;
- (CGRect)unsafeRect;
- (CGSize)parallaxPadding;
- (CGSize)parallaxPaddingPct;
- (CGSize)screenSize;
- (PFParallaxLayoutConfiguration)init;
- (PFParallaxLayoutConfiguration)initWithCoder:(id)a3;
- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 denormalizedYDownTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6;
- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 normalizedTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6;
- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 normalizedYDownTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6;
- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 timeRect:(CGRect)a5 inactiveTimeRect:(CGRect)a6 parallaxPadding:(CGSize)a7;
- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 timeRect:(CGRect)a4 inactiveTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6;
- (double)screenScale;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFParallaxLayoutConfiguration

- (CGSize)parallaxPadding
{
  double width = self->_parallaxPadding.width;
  double height = self->_parallaxPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)inactiveTimeRect
{
  double x = self->_inactiveTimeRect.origin.x;
  double y = self->_inactiveTimeRect.origin.y;
  double width = self->_inactiveTimeRect.size.width;
  double height = self->_inactiveTimeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)timeRect
{
  double x = self->_timeRect.origin.x;
  double y = self->_timeRect.origin.y;
  double width = self->_timeRect.size.width;
  double height = self->_timeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PFParallaxLayoutConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeSizeForKey:@"screenSize"];
  double v31 = v6;
  double v32 = v5;
  [v4 decodeRectForKey:@"timeRect"];
  double v29 = v8;
  double v30 = v7;
  double v28 = v9;
  double v11 = v10;
  [v4 decodeRectForKey:@"inactiveTimeRect"];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [v4 decodeSizeForKey:@"parallaxPadding"];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration])
  {
    double v24 = 2.0;
  }
  else
  {
    double v24 = 3.0;
  }
  if ([v4 containsValueForKey:@"version"])
  {
    [v4 decodeDoubleForKey:@"screenScale"];
    double v24 = v25;
  }
  v26 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", v32, v31, v24, v30, v29, v28, v11, v13, v15, v17, v19, v21, v23);

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:2 forKey:@"version"];
  [(PFParallaxLayoutConfiguration *)self screenSize];
  objc_msgSend(v4, "encodeSize:forKey:", @"screenSize");
  [(PFParallaxLayoutConfiguration *)self timeRect];
  objc_msgSend(v4, "encodeRect:forKey:", @"timeRect");
  [(PFParallaxLayoutConfiguration *)self inactiveTimeRect];
  objc_msgSend(v4, "encodeRect:forKey:", @"inactiveTimeRect");
  [(PFParallaxLayoutConfiguration *)self parallaxPadding];
  objc_msgSend(v4, "encodeSize:forKey:", @"parallaxPadding");
  [(PFParallaxLayoutConfiguration *)self screenScale];
  objc_msgSend(v4, "encodeDouble:forKey:", @"screenScale");
}

- (BOOL)isEqualToLayoutConfiguration:(id)a3
{
  id v4 = a3;
  [v4 screenSize];
  double v6 = v5;
  double v8 = v7;
  [(PFParallaxLayoutConfiguration *)self screenSize];
  BOOL v11 = v6 == v10 && v8 == v9;
  if (v11
    && ([v4 timeRect],
        double v13 = v12,
        double v15 = v14,
        double v17 = v16,
        double v19 = v18,
        [(PFParallaxLayoutConfiguration *)self timeRect],
        vabdd_f64(v13, v23) <= 0.00000999999975)
    && vabdd_f64(v15, v20) <= 0.00000999999975
    && vabdd_f64(v17, v21) <= 0.00000999999975
    && vabdd_f64(v19, v22) <= 0.00000999999975)
  {
    [(PFParallaxLayoutConfiguration *)self screenScale];
    double v27 = v26;
    [v4 screenScale];
    BOOL v24 = vabdd_f64(v27, v28) <= 0.1;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PFParallaxLayoutConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PFParallaxLayoutConfiguration *)self isEqualToLayoutConfiguration:v4];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  [v3 setObject:&unk_1EF7CAA30 forKeyedSubscript:@"version"];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_screenSize);
  [v3 setObject:DictionaryRepresentation forKeyedSubscript:@"screenSize"];

  CFDictionaryRef v5 = CGRectCreateDictionaryRepresentation(self->_timeRect);
  [v3 setObject:v5 forKeyedSubscript:@"timeRect"];

  CFDictionaryRef v6 = CGRectCreateDictionaryRepresentation(self->_inactiveTimeRect);
  [v3 setObject:v6 forKeyedSubscript:@"inactiveTimeRect"];

  CFDictionaryRef v7 = CGSizeCreateDictionaryRepresentation(self->_parallaxPadding);
  [v3 setObject:v7 forKeyedSubscript:@"parallaxPadding"];

  double v8 = [NSNumber numberWithDouble:self->_screenScale];
  [v3 setObject:v8 forKeyedSubscript:@"screenScale"];

  return v3;
}

- (id)debugDescription
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PFParallaxLayoutConfiguration *)self screenSize];
  double v6 = v5;
  double v8 = v7;
  [(PFParallaxLayoutConfiguration *)self timeRect];
  double v10 = v3 + v9 * v6;
  double v12 = v4 + v11 * v8;
  double v14 = v6 * v13;
  double v16 = v8 * v15;
  [(PFParallaxLayoutConfiguration *)self inactiveTimeRect];
  double v18 = v3 + v17 * v6;
  double v20 = v4 + v19 * v8;
  double v34 = v8 * v22;
  double v35 = v6 * v21;
  double v23 = NSString;
  uint64_t v24 = objc_opt_class();
  *(double *)v39 = v6;
  *(double *)&v39[1] = v8;
  double v25 = [MEMORY[0x1E4F29238] valueWithBytes:v39 objCType:"{CGSize=dd}"];
  *(double *)v38 = v10;
  *(double *)&v38[1] = v12;
  *(double *)&v38[2] = v14;
  *(double *)&v38[3] = v16;
  double v26 = [MEMORY[0x1E4F29238] valueWithBytes:v38 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  *(double *)v37 = v18;
  *(double *)&v37[1] = v20;
  *(double *)&v37[2] = v35;
  *(double *)&v37[3] = v34;
  double v27 = [MEMORY[0x1E4F29238] valueWithBytes:v37 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  double v28 = (void *)MEMORY[0x1E4F29238];
  [(PFParallaxLayoutConfiguration *)self parallaxPadding];
  v36[0] = v29;
  v36[1] = v30;
  double v31 = [v28 valueWithBytes:v36 objCType:"{CGSize=dd}"];
  double v32 = [v23 stringWithFormat:@"<%@:%p screen=%@ time=%@ inactiveTime=%@ parallaxPadding=%@>", v24, self, v25, v26, v27, v31];

  return v32;
}

- (id)description
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PFParallaxLayoutConfiguration *)self screenSize];
  double v6 = v5;
  double v8 = v7;
  [(PFParallaxLayoutConfiguration *)self timeRect];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%0.0fx%0.0f time=(%0.0f,%0.0f,%0.0f,%0.0f)]", *(void *)&v6, *(void *)&v8, v3 + v9 * v6, v4 + v10 * v8, v6 * v11, v8 * v12);
}

- (CGSize)parallaxPaddingPct
{
  [(PFParallaxLayoutConfiguration *)self screenSize];
  double v4 = v3;
  double v6 = v5;
  [(PFParallaxLayoutConfiguration *)self parallaxPadding];
  double v8 = v7 / v4;
  double v10 = v9 / v6;
  result.double height = v10;
  result.double width = v8;
  return result;
}

- (CGRect)timeOverlapCheckTop
{
  double v3 = +[PFParallaxLayoutTextOverlapParameters systemParameters];
  [v3 bottomAreaHeight];
  double v5 = v4;

  [(PFParallaxLayoutConfiguration *)self timeRect];
  double v8 = v7 + v6 * 0.0;
  double v11 = v9 + v5 * v10;
  double v12 = (1.0 - v5) * v10;
  result.size.double height = v12;
  result.size.double width = v6;
  result.origin.double y = v11;
  result.origin.double x = v8;
  return result;
}

- (CGRect)timeOverlapCheckBottom
{
  double v3 = +[PFParallaxLayoutTextOverlapParameters systemParameters];
  [v3 bottomAreaHeight];
  double v5 = v4;

  [(PFParallaxLayoutConfiguration *)self timeRect];
  double v8 = v7 + v6 * 0.0;
  double v11 = v9 + v10 * 0.0;
  double v12 = v5 * v10;
  result.size.double height = v12;
  result.size.double width = v6;
  result.origin.double y = v11;
  result.origin.double x = v8;
  return result;
}

- (CGRect)unsafeRect
{
  [(PFParallaxLayoutConfiguration *)self timeRect];
  double v5 = 1.0 - v3;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (PFParallaxLayoutConfiguration)init
{
  double v2 = (PFParallaxLayoutConfiguration *)_PFAssertFailHandler();
  return [(PFParallaxLayoutConfiguration *)v2 initWithScreenSize:v8 screenScale:v4 timeRect:v9 inactiveTimeRect:v6 parallaxPadding:v7];
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 timeRect:(CGRect)a5 inactiveTimeRect:(CGRect)a6 parallaxPadding:(CGSize)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v14 = a3.height;
  CGFloat v12 = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)PFParallaxLayoutConfiguration;
  CGRect result = [(PFParallaxLayoutConfiguration *)&v15 init];
  result->_screenScale = a4;
  result->_screenSize.CGFloat width = v12;
  result->_timeRect.origin.CGFloat y = y;
  result->_timeRect.size.CGFloat width = width;
  result->_timeRect.size.CGFloat height = height;
  result->_inactiveTimeRect.origin.CGFloat x = x;
  result->_inactiveTimeRect.origin.CGFloat y = y;
  result->_inactiveTimeRect.size.CGFloat width = width;
  result->_inactiveTimeRect.size.CGFloat height = height;
  result->_screenSize.CGFloat height = v14;
  result->_parallaxPadding.CGFloat width = v16;
  result->_parallaxPadding.CGFloat height = v17;
  result->_timeRect.origin.CGFloat x = x;
  return result;
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 timeRect:(CGRect)a4 inactiveTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  double height = a3.height;
  double width = a3.width;
  double v9 = PFDeviceScreenScale();

  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", width, height, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 normalizedTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", a3.width, a3.height, a4, *(void *)&a5.origin.x, *(void *)&a5.origin.y, *(void *)&a5.size.width, *(void *)&a5.size.height, *(void *)&a6.width, *(void *)&a6.height);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 normalizedYDownTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:normalizedTimeRect:parallaxPadding:", a3.width, a3.height, a4, a5.origin.x, *(double *)(MEMORY[0x1E4F8A248] + 8)+ *(double *)(MEMORY[0x1E4F8A248] + 24)- (a5.origin.y+ a5.size.height), a5.size.width);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 denormalizedYDownTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double v8 = a5.origin.x - *MEMORY[0x1E4F1DAD8];
  double v9 = 0.0;
  double v10 = 0.0;
  if (a3.width != 0.0)
  {
    double v8 = v8 / a3.width;
    double v10 = width / a3.width;
  }
  double v11 = a5.origin.y - *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (a3.height != 0.0)
  {
    double v11 = v11 / a3.height;
    double v9 = height / a3.height;
  }
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", *(void *)&v8, *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24) - (v9 + v11), *(void *)&v10, *(void *)&v9, *(void *)&a6.width, *(void *)&a6.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)layoutConfigurationFromDictionary:(id)a3 error:(id *)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    _PFAssertFailHandler();
  }
  CGRect v6 = v5;
  size.double width = 0.0;
  size.double height = 0.0;
  CFDictionaryRef v7 = [v5 objectForKeyedSubscript:@"screenSize"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v8 = CGSizeMakeWithDictionaryRepresentation(v7, &size);

    if (v8)
    {
      memset(&rect, 0, sizeof(rect));
      CFDictionaryRef v9 = [v6 objectForKeyedSubscript:@"timeRect"];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        BOOL v10 = CGRectMakeWithDictionaryRepresentation(v9, &rect);

        if (v10)
        {
          memset(&v32, 0, sizeof(v32));
          CFDictionaryRef v11 = [v6 objectForKeyedSubscript:@"inactiveTimeRect"];
          if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            BOOL v12 = CGRectMakeWithDictionaryRepresentation(v11, &v32);

            if (v12)
            {
              v31.double width = 0.0;
              v31.double height = 0.0;
              CFDictionaryRef v13 = [v6 objectForKeyedSubscript:@"parallaxPadding"];
              if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                BOOL v14 = CGSizeMakeWithDictionaryRepresentation(v13, &v31);

                if (v14) {
                  goto LABEL_43;
                }
              }
              else
              {
              }
              CGSize v31 = (CGSize)*MEMORY[0x1E4F1DB30];
LABEL_43:
              double v26 = [v6 objectForKeyedSubscript:@"version"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v27 = [v6 objectForKeyedSubscript:@"screenScale"];
                if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration])
                {
                  double v28 = 2.0;
                }
                else
                {
                  double v28 = 3.0;
                }
                [v27 doubleValue];
                if (v29 != 0.0) {
                  double v28 = v29;
                }
              }
              else
              {
                double v28 = PFDeviceScreenScale();
              }
              uint64_t v30 = [PFParallaxLayoutConfiguration alloc];
              double v18 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](v30, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", size.width, size.height, v28, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, *(void *)&v32.origin.x, *(void *)&v32.origin.y, *(void *)&v32.size.width, *(void *)&v32.size.height, *(void *)&v31.width, *(void *)&v31.height);

LABEL_40:
LABEL_32:

              goto LABEL_22;
            }
          }
          else
          {
          }
          if (a4)
          {
            double v23 = (void *)MEMORY[0x1E4F28C58];
            v35[0] = @"PFNonLocalizedFailureReason";
            v35[1] = @"PFRelatedObject";
            if (v11) {
              uint64_t v24 = (__CFString *)v11;
            }
            else {
              uint64_t v24 = @"nil";
            }
            v36[0] = @"Invalid inactive time rect";
            v36[1] = v24;
            double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
            *a4 = [v23 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v25];
          }
          double v18 = 0;
          goto LABEL_40;
        }
      }
      else
      {
      }
      if (a4)
      {
        double v20 = (void *)MEMORY[0x1E4F28C58];
        v37[0] = @"PFNonLocalizedFailureReason";
        v37[1] = @"PFRelatedObject";
        if (v9) {
          double v21 = (__CFString *)v9;
        }
        else {
          double v21 = @"nil";
        }
        v38[0] = @"Invalid time rect";
        v38[1] = v21;
        double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        *a4 = [v20 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v22];
      }
      double v18 = 0;
      goto LABEL_32;
    }
  }
  else
  {
  }
  if (a4)
  {
    objc_super v15 = (void *)MEMORY[0x1E4F28C58];
    v39[0] = @"PFNonLocalizedFailureReason";
    v39[1] = @"PFRelatedObject";
    if (v7) {
      CGFloat v16 = (__CFString *)v7;
    }
    else {
      CGFloat v16 = @"nil";
    }
    v40[0] = @"Invalid screen size";
    v40[1] = v16;
    CGFloat v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    *a4 = [v15 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v17];
  }
  double v18 = 0;
LABEL_22:

  return v18;
}

+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4 startingWithConfiguration:(id)a5 orientation:(int64_t)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  CFDictionaryRef v11 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v12 = +[PFWallpaperCompoundDeviceConfiguration knownDeviceConfigurations];
  CFDictionaryRef v13 = [v12 allValues];
  BOOL v14 = [v11 setWithArray:v13];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v62 objects:v72 count:16];
  CGFloat v17 = v10;
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v63;
    CGFloat v17 = v10;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v15);
        }
        double v21 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        switch(a6)
        {
          case 1:
            if (!v17) {
              goto LABEL_12;
            }
            [v17 screenSize];
            double v23 = v22;
            double v25 = v24;
            double v26 = [v21 portraitConfiguration];
            [v26 screenSize];
            BOOL v29 = __114__PFParallaxLayoutConfiguration_bestConfigurationForScreenSize_screenScale_startingWithConfiguration_orientation___block_invoke(width, height, v23, v25, v27, v28);

            if (v29)
            {
LABEL_12:
              uint64_t v30 = [v21 portraitConfiguration];
LABEL_16:
              v39 = (void *)v30;

              CGFloat v17 = v39;
              continue;
            }
            break;
          case 2:
            if (!v17) {
              goto LABEL_15;
            }
            [v17 screenSize];
            double v32 = v31;
            double v34 = v33;
            double v35 = [v21 landscapeConfiguration];
            [v35 screenSize];
            BOOL v38 = __114__PFParallaxLayoutConfiguration_bestConfigurationForScreenSize_screenScale_startingWithConfiguration_orientation___block_invoke(width, height, v32, v34, v36, v37);

            if (v38)
            {
LABEL_15:
              uint64_t v30 = [v21 landscapeConfiguration];
              goto LABEL_16;
            }
            break;
          case 0:
            _PFAssertFailHandler();
            break;
        }
      }
      uint64_t v18 = [v15 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v18);
  }

  id v40 = objc_alloc((Class)a1);
  [v17 timeRect];
  double v59 = v42;
  Class v61 = v41;
  double v58 = v43;
  double v45 = v44;
  [v17 inactiveTimeRect];
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  [v17 parallaxPadding];
  v56 = objc_msgSend(v40, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", width, height, a4, *(double *)&v61, v59, v58, v45, v47, v49, v51, v53, v54, v55);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    double v67 = width;
    __int16 v68 = 2048;
    double v69 = height;
    __int16 v70 = 2114;
    v71 = v56;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Best layout configuration for screen size %0.0fx%0.0f: %{public}@", buf, 0x20u);
  }

  return v56;
}

BOOL __114__PFParallaxLayoutConfiguration_bestConfigurationForScreenSize_screenScale_startingWithConfiguration_orientation___block_invoke(double a1, double a2, double a3, double a4, double a5, double a6)
{
  if (a3 == *MEMORY[0x1E4F1DB30] && a4 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return 1;
  }
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v13 = hypot(a1 - *MEMORY[0x1E4F1DAD8], a2 - v12);
  double v14 = hypot(a3 - v11, a4 - v12);
  return vabdd_f64(v13, hypot(a5 - v11, a6 - v12)) < vabdd_f64(v13, v14);
}

+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4 orientation:(int64_t)a5
{
  return (id)objc_msgSend(a1, "bestConfigurationForScreenSize:screenScale:startingWithConfiguration:orientation:", 0, a5, a3.width, a3.height, a4);
}

+ (id)deviceConfigurationForOrientation:(int64_t)a3
{
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      double v4 = +[PFWallpaperCompoundDeviceConfiguration deviceConfiguration];
      uint64_t v5 = [v4 landscapeConfiguration];
      goto LABEL_7;
    }
    if (a3) {
      goto LABEL_8;
    }
    _PFAssertFailHandler();
  }
  double v4 = +[PFWallpaperCompoundDeviceConfiguration deviceConfiguration];
  uint64_t v5 = [v4 portraitConfiguration];
LABEL_7:
  SEL v3 = (void *)v5;

LABEL_8:

  return v3;
}

+ (id)genericPadConfigurationForOrientation:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = 1668.0;
    double v4 = 2388.0;
  }
  else
  {
    double v3 = 2388.0;
    double v4 = 1668.0;
  }
  uint64_t v5 = [a1 bestConfigurationForScreenSize:v3 screenScale:v4 orientation:2.0];

  return v5;
}

+ (id)genericConfigurationForOrientation:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = 1170.0;
    double v4 = 2532.0;
  }
  else
  {
    double v3 = 2388.0;
    double v4 = 1668.0;
  }
  uint64_t v5 = [a1 bestConfigurationForScreenSize:v3 screenScale:v4 orientation:3.0];

  return v5;
}

@end