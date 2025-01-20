@interface PBUIWallpaperLegibilityTreatment
+ (BOOL)supportsSecureCoding;
- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)needsDimmingTreatment;
- (BOOL)needsLuminanceTreatment;
- (PBUIWallpaperLegibilityTreatment)initWithCoder:(id)a3;
- (UIColor)averageColor;
- (id)colorByDimmingColor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)luminanceTreatmentFilters;
- (id)makeDimmingLayer;
- (id)makeGradientLayer;
- (id)makeLuminanceBackdropLayer;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)luminanceTreatmentFilters;
- (void)setAverageColor:(id)a3;
- (void)setNeedsDimmingTreatment:(BOOL)a3;
- (void)setNeedsLuminanceTreatment:(BOOL)a3;
@end

@implementation PBUIWallpaperLegibilityTreatment

- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = v6;
  if (*(_WORD *)&self->_needsLuminanceTreatment)
  {
    [v6 setAllowsGroupBlending:0];
    if (self->_needsDimmingTreatment)
    {
      v8 = [(PBUIWallpaperLegibilityTreatment *)self makeDimmingLayer];
      dimmingLayer = self->_dimmingLayer;
      self->_dimmingLayer = v8;

      [(CALayer *)self->_dimmingLayer setDelegate:self];
      [v7 addSublayer:self->_dimmingLayer];
    }
    if (self->_needsLuminanceTreatment)
    {
      v10 = [(PBUIWallpaperLegibilityTreatment *)self makeLuminanceBackdropLayer];
      luminanceBackdropLayer = self->_luminanceBackdropLayer;
      self->_luminanceBackdropLayer = v10;

      [(CABackdropLayer *)self->_luminanceBackdropLayer setDelegate:self];
      v12 = self->_luminanceBackdropLayer;
      [v7 bounds];
      -[CABackdropLayer setFrame:](v12, "setFrame:");
      [v7 addSublayer:self->_luminanceBackdropLayer];
    }
    if (self->_needsDimmingTreatment)
    {
      averageColor = self->_averageColor;
      if (averageColor)
      {
        v14 = averageColor;
      }
      else
      {
        v14 = [MEMORY[0x1E4F428B8] grayColor];
      }
      v15 = v14;
      v16 = [MEMORY[0x1E4F39BE8] layer];
      dimmedColorLayer = self->_dimmedColorLayer;
      self->_dimmedColorLayer = v16;

      v18 = [(PBUIWallpaperLegibilityTreatment *)self colorByDimmingColor:v15];
      v19 = self->_dimmedColorLayer;
      id v20 = v18;
      -[CALayer setBackgroundColor:](v19, "setBackgroundColor:", [v20 CGColor]);
      [(CALayer *)self->_dimmedColorLayer setCompositingFilter:*MEMORY[0x1E4F3A2A0]];
      [(CALayer *)self->_dimmedColorLayer setDelegate:self];
      v21 = self->_dimmedColorLayer;
      [v7 bounds];
      -[CALayer setFrame:](v21, "setFrame:");
      [v7 addSublayer:self->_dimmedColorLayer];
    }
    if (self->_needsLuminanceTreatment)
    {
      v22 = [(PBUIWallpaperLegibilityTreatment *)self makeGradientLayer];
      gradientLayer = self->_gradientLayer;
      self->_gradientLayer = v22;

      [(CAGradientLayer *)self->_gradientLayer setDelegate:self];
      v24 = self->_gradientLayer;
      [v7 bounds];
      -[CAGradientLayer setFrame:](v24, "setFrame:");
      [v7 addSublayer:self->_gradientLayer];
    }
    [v7 setShouldRasterize:self->_needsDimmingTreatment];
  }

  return 1;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v5 = a3;
  v3 = [v5 superlayer];
  v4 = v3;
  if (v3)
  {
    [v3 bounds];
    objc_msgSend(v5, "setFrame:");
  }
}

- (id)luminanceTreatmentFilters
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = PBUIWallpaperTreatmentBundle();
  if (!v2) {
    -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters]();
  }
  v3 = v2;
  CFURLRef v4 = [v2 URLForResource:@"WallpaperLuminanceMap" withExtension:@"png"];
  if (!v4) {
    -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters]();
  }
  CFURLRef v5 = v4;
  id v6 = CGImageSourceCreateWithURL(v4, 0);
  if (!v6) {
LABEL_12:
  }
    -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters]();
  v7 = v6;
  if (!CGImageSourceGetCount(v6))
  {
    CFRelease(v7);
    goto LABEL_12;
  }
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v7);
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, PrimaryImageIndex, 0);
  CFRelease(v7);
  if (!ImageAtIndex) {
    goto LABEL_12;
  }
  v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A268]];
  [v10 setValue:ImageAtIndex forKey:@"inputColorMap"];

  v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
  [v11 setValue:&unk_1F162C730 forKey:@"inputAmount"];
  v14[0] = v11;
  v14[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  return v12;
}

- (id)makeDimmingLayer
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 0.1);
  [v2 setBackgroundColor:SRGB];
  CGColorRelease(SRGB);
  [v2 setCompositingFilter:*MEMORY[0x1E4F3A078]];
  return v2;
}

- (id)makeLuminanceBackdropLayer
{
  v3 = [MEMORY[0x1E4F39B40] layer];
  CFURLRef v4 = [(PBUIWallpaperLegibilityTreatment *)self luminanceTreatmentFilters];
  [v3 setFilters:v4];

  return v3;
}

- (id)colorByDimmingColor:(id)a3
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  v3 = [MEMORY[0x1E4F428B8] colorWithRed:v7 * -0.589999974 + v8 * -0.300000012 + v6 * -0.109999999 + v5 * 0.0 + 1.0 green:v7 * -0.589999974 + v8 * -0.300000012 + v6 * -0.109999999 + v5 * 0.0 + 1.0 blue:v7 * -0.589999974 + v8 * -0.300000012 + v6 * -0.109999999 + v5 * 0.0 + 1.0 alpha:v7 * 0.0 + v8 * 0.0 + v6 * 0.0 + v5 * 0.5 + 0.0];
  return v3;
}

- (id)makeGradientLayer
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F39BD0] layer];
  CFIndex v3 = [&unk_1F162C5B8 count];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, MEMORY[0x1E4F1D510]);
  double v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
  if (v3)
  {
    double v6 = (CGFloat *)&qword_1BC53F380;
    do
    {
      components[0] = 0.0;
      components[1] = *v6;
      CGColorRef v7 = CGColorCreate(v5, components);
      if (v7)
      {
        CGColorRef v8 = v7;
        CFArrayAppendValue(Mutable, v7);
        CFRelease(v8);
      }
      ++v6;
      --v3;
    }
    while (v3);
  }
  [v2 setColors:Mutable];
  CFRelease(Mutable);
  CGColorSpaceRelease(v5);
  [v2 setLocations:&unk_1F162C5B8];
  objc_msgSend(v2, "setStartPoint:", 0.5, 0.0);
  objc_msgSend(v2, "setEndPoint:", 0.5, 1.0);
  v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A078]];
  [v2 setCompositingFilter:v9];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setNeedsDimmingTreatment:self->_needsDimmingTreatment];
  [v4 setNeedsLuminanceTreatment:self->_needsLuminanceTreatment];
  averageColor = self->_averageColor;
  if (averageColor)
  {
    double v6 = (void *)[(UIColor *)averageColor copy];
    [v4 setAverageColor:v6];
  }
  else
  {
    [v4 setAverageColor:0];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUIWallpaperLegibilityTreatment)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(PBUIWallpaperLegibilityTreatment *)self init];
  if (v5)
  {
    v5->_needsDimmingTreatment = [v4 decodeBoolForKey:@"NeedsDimmingTreatment"];
    v5->_needsLuminanceTreatment = [v4 decodeBoolForKey:@"NeedsLuminanceTreatment"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AverageColor"];
    averageColor = v5->_averageColor;
    v5->_averageColor = (UIColor *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL needsDimmingTreatment = self->_needsDimmingTreatment;
  id v5 = a3;
  [v5 encodeBool:needsDimmingTreatment forKey:@"NeedsDimmingTreatment"];
  [v5 encodeBool:self->_needsLuminanceTreatment forKey:@"NeedsLuminanceTreatment"];
  [v5 encodeObject:self->_averageColor forKey:@"AverageColor"];
}

- (BOOL)needsLuminanceTreatment
{
  return self->_needsLuminanceTreatment;
}

- (void)setNeedsLuminanceTreatment:(BOOL)a3
{
  self->_needsLuminanceTreatment = a3;
}

- (BOOL)needsDimmingTreatment
{
  return self->_needsDimmingTreatment;
}

- (void)setNeedsDimmingTreatment:(BOOL)a3
{
  self->_BOOL needsDimmingTreatment = a3;
}

- (UIColor)averageColor
{
  return self->_averageColor;
}

- (void)setAverageColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColor, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_luminanceBackdropLayer, 0);
  objc_storeStrong((id *)&self->_dimmedColorLayer, 0);
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
}

- (void)luminanceTreatmentFilters
{
}

@end