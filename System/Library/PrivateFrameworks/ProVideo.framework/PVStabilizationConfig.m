@interface PVStabilizationConfig
+ (BOOL)supportsSecureCoding;
+ (id)configWithHomography:(double)a3 cleanAperture:(double)a4 cropRect:(double)a5 fillMode:(double)a6;
- (BOOL)isValid;
- (BOOL)isValidWithReason:(id *)a3;
- (CGRect)cleanAperture;
- (CGRect)cropRect;
- (CGRect)normalizedCleanAperture;
- (PVStabilizationConfig)initWithCoder:(id)a3;
- (PVStabilizationConfig)initWithHomography:(double)a3 cleanAperture:(double)a4 cropRect:(double)a5 fillMode:(double)a6;
- (__n128)homography;
- (__n128)setHomography:(__n128)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)fillMode;
- (void)encodeWithCoder:(id)a3;
- (void)setCleanAperture:(CGRect)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setFillMode:(int)a3;
@end

@implementation PVStabilizationConfig

+ (id)configWithHomography:(double)a3 cleanAperture:(double)a4 cropRect:(double)a5 fillMode:(double)a6
{
  v18 = objc_msgSend([a1 alloc], "initWithHomography:cleanAperture:cropRect:fillMode:", a10, a2, a3, a4, a5, a6, a7, a8, a16, a17, a18);

  return v18;
}

- (PVStabilizationConfig)initWithHomography:(double)a3 cleanAperture:(double)a4 cropRect:(double)a5 fillMode:(double)a6
{
  v30.receiver = a1;
  v30.super_class = (Class)PVStabilizationConfig;
  v24 = [(PVStabilizationConfig *)&v30 init];
  v25 = v24;
  if (v24)
  {
    -[PVStabilizationConfig setHomography:](v24, "setHomography:", a2, a3, a4);
    -[PVStabilizationConfig setCleanAperture:](v25, "setCleanAperture:", a5, a6, a7, a8);
    -[PVStabilizationConfig setCropRect:](v25, "setCropRect:", a12, a13, a14, a15);
    [(PVStabilizationConfig *)v25 setFillMode:a10];
  }
  return v25;
}

- (CGRect)normalizedCleanAperture
{
  double width = self->_cleanAperture.size.width;
  double height = self->_cleanAperture.size.height;
  double v4 = fmax(width, height);
  double v5 = width / v4;
  double v6 = height / v4;
  double v7 = *MEMORY[0x1E4F1DAD8] - v5 * 0.5;
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) - v6 * 0.5;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isValid
{
  return [(PVStabilizationConfig *)self isValidWithReason:0];
}

- (BOOL)isValidWithReason:(id *)a3
{
  double width = self->_cleanAperture.size.width;
  if (width > -0.0000001 && width < 0.0000001
    || (double height = self->_cleanAperture.size.height, height > -0.0000001) && height < 0.0000001)
  {
    if (a3)
    {
      double v5 = @"Clean aperture has zero area";
LABEL_7:
      BOOL result = 0;
      *a3 = v5;
      return result;
    }
    return 0;
  }
  if (width < 2.0 || height < 2.0)
  {
    if (a3)
    {
      double v5 = @"Clean aperture has side shorter than 2. Only pixel based clean aperture is supported.";
      goto LABEL_7;
    }
    return 0;
  }
  double v8 = self->_cropRect.size.width;
  if (v8 > -0.0000001 && v8 < 0.0000001 || (double v9 = self->_cropRect.size.height, v9 > -0.0000001) && v9 < 0.0000001)
  {
    if (a3)
    {
      double v5 = @"Crop rect has zero area";
      goto LABEL_7;
    }
    return 0;
  }
  if (v8 > 1.5 || v9 > 1.5)
  {
    if (a3)
    {
      double v5 = @"Crop rect has side longer than 1.5. Only normalized crop rect is supported.";
      goto LABEL_7;
    }
    return 0;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F29238];
  id v10 = a3;
  [(PVStabilizationConfig *)self homography];
  double v5 = objc_msgSend(v4, "valueWithSIMDFloat3x3:");
  [v10 encodeObject:v5 forKey:@"homography"];

  double v6 = (void *)MEMORY[0x1E4F29238];
  [(PVStabilizationConfig *)self cleanAperture];
  double v7 = objc_msgSend(v6, "valueWithCGRect:");
  [v10 encodeObject:v7 forKey:@"cleanAperture"];

  double v8 = (void *)MEMORY[0x1E4F29238];
  [(PVStabilizationConfig *)self cropRect];
  double v9 = objc_msgSend(v8, "valueWithCGRect:");
  [v10 encodeObject:v9 forKey:@"cropRect"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[PVStabilizationConfig fillMode](self, "fillMode"), @"fillMode");
}

- (PVStabilizationConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homography"];
  [v5 SIMDFloat3x3Value];
  double v31 = v7;
  double v32 = v6;
  double v30 = v8;
  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cleanAperture"];
  [v9 CGRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cropRect"];
  [v18 CGRectValue];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v27 = [v4 decodeIntegerForKey:@"fillMode"];

  v28 = -[PVStabilizationConfig initWithHomography:cleanAperture:cropRect:fillMode:](self, "initWithHomography:cleanAperture:cropRect:fillMode:", v27, v32, v31, v30, v11, v13, v15, v17, v20, v22, v24, v26);
  return v28;
}

- (void)setFillMode:(int)a3
{
  if (self->_fillMode != a3)
  {
    if (a3 >= 0xF) {
      int v3 = 0;
    }
    else {
      int v3 = a3;
    }
    self->_fillMode = v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PVStabilizationConfig alloc];
  [(PVStabilizationConfig *)self homography];
  double v22 = v6;
  double v23 = v5;
  double v21 = v7;
  [(PVStabilizationConfig *)self cleanAperture];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(PVStabilizationConfig *)self cropRect];
  return -[PVStabilizationConfig initWithHomography:cleanAperture:cropRect:fillMode:](v4, "initWithHomography:cleanAperture:cropRect:fillMode:", [(PVStabilizationConfig *)self fillMode], v23, v22, v21, v9, v11, v13, v15, v16, v17, v18, v19);
}

- (id)description
{
  id v34 = 0;
  BOOL v3 = [(PVStabilizationConfig *)self isValidWithReason:&v34];
  id v4 = NSString;
  v33.receiver = self;
  v33.super_class = (Class)PVStabilizationConfig;
  double v5 = (__CFString *)v34;
  double v6 = [(PVStabilizationConfig *)&v33 description];
  [(PVStabilizationConfig *)self homography];
  double v7 = NSStringFromSIMDFloat3x3(4, v36);
  [(PVStabilizationConfig *)self cleanAperture];
  *((void *)&v9 + 1) = v8;
  *((void *)&v11 + 1) = v10;
  v32[0] = v9;
  v32[1] = v11;
  double v12 = NSStringFromSIMDDouble4(v32, 3);
  [(PVStabilizationConfig *)self normalizedCleanAperture];
  *((void *)&v14 + 1) = v13;
  *((void *)&v16 + 1) = v15;
  v31[0] = v14;
  v31[1] = v16;
  uint64_t v17 = NSStringFromSIMDDouble4(v31, 3);
  [(PVStabilizationConfig *)self cropRect];
  *((void *)&v19 + 1) = v18;
  *((void *)&v21 + 1) = v20;
  v30[0] = v19;
  v30[1] = v21;
  double v22 = NSStringFromSIMDDouble4(v30, 3);
  unsigned int v23 = [(PVStabilizationConfig *)self fillMode];
  if (v23 >= 0xF) {
    unsigned int v24 = 0;
  }
  else {
    unsigned int v24 = v23;
  }
  uint64_t v25 = PVViewContentModeNames[v24];
  uint64_t v26 = @"N";
  if (v3) {
    uint64_t v26 = @"Y";
  }
  uint64_t v27 = &stru_1F119C770;
  if (v5) {
    uint64_t v27 = v5;
  }
  v28 = [v4 stringWithFormat:@"%@\nhomography:\n%@\ncleanAperture: %@\ncleanAperture (normalized/centered): %@\ncropRect: %@\nfillMode: %s\nisValid: %@ %@", v6, v7, v12, v17, v22, v25, v26, v27];

  return v28;
}

- (__n128)homography
{
  return a1[5];
}

- (__n128)setHomography:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (CGRect)cleanAperture
{
  double x = self->_cleanAperture.origin.x;
  double y = self->_cleanAperture.origin.y;
  double width = self->_cleanAperture.size.width;
  double height = self->_cleanAperture.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCleanAperture:(CGRect)a3
{
  self->_cleanAperture = a3;
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

- (int)fillMode
{
  return self->_fillMode;
}

@end