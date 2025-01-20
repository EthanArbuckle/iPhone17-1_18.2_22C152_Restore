@interface PKPassColorProfile
+ (id)profileForDisplayProfile:(id)a3;
- (BOOL)isLight;
- (BOOL)supportsAutomaticForegroundVibrancy;
- (BOOL)supportsAutomaticLabelVibrancy;
- (UIColor)backgroundColor;
- (UIColor)footerBackgroundColor;
- (UIColor)foregroundColor;
- (UIColor)highlightColor;
- (UIColor)labelColor;
- (double)overlayDarkeningAlpha;
- (double)overlayLighteningAlpha;
- (double)regularDarkeningAlpha;
- (double)regularLighteningAlpha;
- (id)_imageForGlyph:(id)a3 color:(id)a4;
- (id)_initWithBackgroundColor:(id)a3 foregroundColor:(id)a4 labelColor:(id)a5;
- (id)foregroundAttributesForFont:(id)a3;
- (id)foregroundColorOverStrip:(BOOL)a3;
- (id)foregroundImageForGlyph:(id)a3;
- (id)labelAttributesForFont:(id)a3;
- (id)labelColorOverStrip:(BOOL)a3;
- (id)labelImageForGlyph:(id)a3;
- (void)_calculateColorsWithBackgroundColor:(id)a3 foregroundColor:(id)a4 labelColor:(id)a5;
@end

@implementation PKPassColorProfile

+ (id)profileForDisplayProfile:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_getAssociatedObject(v3, &ColorProfileCacheKey);
    if (v5) {
      goto LABEL_23;
    }
  }
  if ([v4 passStyle] == 9)
  {
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    v7 = (void *)MEMORY[0x1E4FB1618];
    v8 = [v4 foregroundColor];
    v9 = objc_msgSend(v7, "pkui_colorWithPKColor:", v8);
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_13:
      v13 = v10;

      goto LABEL_14;
    }
LABEL_12:
    id v10 = v9;
    goto LABEL_13;
  }
  int v11 = [v4 showsBackgroundImage];
  v12 = (void *)MEMORY[0x1E4FB1618];
  if (!v11)
  {
    v14 = [v4 backgroundColor];
    v15 = objc_msgSend(v12, "pkui_colorWithPKColor:", v14);
    v16 = [v15 colorWithAlphaComponent:1.0];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    v6 = v18;

    v19 = (void *)MEMORY[0x1E4FB1618];
    v8 = [v4 foregroundColor];
    v9 = objc_msgSend(v19, "pkui_colorWithPKColor:", v8);
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v6 = [MEMORY[0x1E4FB1618] blackColor];
  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  v13 = [v8 colorWithAlphaComponent:0.699999988];
LABEL_14:

  v20 = (void *)MEMORY[0x1E4FB1618];
  v21 = [v4 labelColor];
  v22 = objc_msgSend(v20, "pkui_colorWithPKColor:", v21);

  v5 = [[PKPassColorProfile alloc] _initWithBackgroundColor:v6 foregroundColor:v13 labelColor:v22];
  if ([v4 showsStripImage])
  {
    v23 = (void *)MEMORY[0x1E4FB1618];
    v24 = [v4 stripColor];
    v25 = objc_msgSend(v23, "pkui_colorWithPKColor:", v24);
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    v28 = v27;

    v29 = [PKPassColorProfile alloc];
    v30 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v31 = [(PKPassColorProfile *)v29 _initWithBackgroundColor:v30 foregroundColor:v28 labelColor:v28];
    v32 = (void *)v5[4];
    v5[4] = v31;
  }
  *((unsigned char *)v5 + 40) = [v4 supportsAutomaticForegroundVibrancy];
  *((unsigned char *)v5 + 41) = [v4 supportsAutomaticLabelVibrancy];
  v33 = (void *)MEMORY[0x1E4FB1618];
  v34 = [v4 footerBackgroundColor];
  uint64_t v35 = objc_msgSend(v33, "pkui_colorWithPKColor:", v34);
  v36 = (void *)v5[14];
  v5[14] = v35;

  if (v4 && v5) {
    objc_setAssociatedObject(v4, &ColorProfileCacheKey, v5, (void *)0x301);
  }

LABEL_23:

  return v5;
}

- (id)_initWithBackgroundColor:(id)a3 foregroundColor:(id)a4 labelColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPassColorProfile;
  int v11 = [(PKPassColorProfile *)&v14 init];
  v12 = v11;
  if (v11) {
    [(PKPassColorProfile *)v11 _calculateColorsWithBackgroundColor:v8 foregroundColor:v9 labelColor:v10];
  }

  return v12;
}

- (void)_calculateColorsWithBackgroundColor:(id)a3 foregroundColor:(id)a4 labelColor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char data = 0;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, DeviceGray, 0);
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  self->_backgroundLightness = _ColorLightness(self->_backgroundColor, v13, &data);
  objc_storeStrong((id *)&self->_foregroundColor, a4);
  self->_foregroundLightness = _ColorLightness(self->_foregroundColor, v13, &data);
  backgroundColor = self->_backgroundColor;
  double v15 = (self->_backgroundLightness + -0.400000006) * 1.20000005;
  if (v15 >= 0.0) {
    double v16 = v15 + 0.25;
  }
  else {
    double v16 = 0.25;
  }
  double v32 = 0.0;
  double v33 = 0.0;
  [(UIColor *)backgroundColor getHue:0 saturation:&v33 brightness:&v32 alpha:0];
  double v17 = (v33 + v32 * 2.0) / 3.0 + -0.800000012;
  double v18 = v17 * 1.5;
  BOOL v19 = v17 < 0.0;
  double v20 = 0.0;
  if (!v19) {
    double v20 = v18;
  }
  if (v20 <= 0.300000012) {
    double v21 = v20;
  }
  else {
    double v21 = 0.300000012;
  }
  if (v11)
  {
    v22 = (UIColor *)v11;
  }
  else
  {
    if ([(PKPassColorProfile *)self isLight]) {
      _NewColorByAdjustingColor(self->_backgroundColor, 1, v16 * 0.7, v21);
    }
    else {
    v22 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }
  labelColor = self->_labelColor;
  self->_labelColor = v22;

  self->_labelLightness = _ColorLightness(self->_labelColor, v13, &data);
  self->_overlayDarkeningAlpha = v16;
  self->_regularDarkeningAlpha = v21;
  v24 = self->_backgroundColor;
  double v32 = 0.0;
  double v33 = 0.0;
  [(UIColor *)v24 getHue:0 saturation:&v33 brightness:&v32 alpha:0];
  double v25 = (v33 + v32 * 2.0) / 3.0 + -0.800000012;
  double v26 = v25 * 1.20000005;
  BOOL v19 = v25 < 0.0;
  double v27 = 0.0;
  if (!v19) {
    double v27 = v26;
  }
  if (v27 <= 0.300000012) {
    double v28 = v27;
  }
  else {
    double v28 = 0.300000012;
  }
  _NewColorByAdjustingColor(self->_backgroundColor, 0, 0.800000012, v28);
  v29 = (UIColor *)objc_claimAutoreleasedReturnValue();
  highlightColor = self->_highlightColor;
  self->_highlightColor = v29;

  self->_overlayLighteningAlpha = 0.800000012;
  self->_regularLighteningAlpha = v28;
  CFRelease(DeviceGray);
  CFRelease(v13);
}

- (BOOL)supportsAutomaticLabelVibrancy
{
  return self->_supportsAutomaticLabelVibrancy;
}

- (BOOL)supportsAutomaticForegroundVibrancy
{
  return self->_supportsAutomaticForegroundVibrancy;
}

- (id)foregroundColorOverStrip:(BOOL)a3
{
  if (a3 && self->_stripProfile) {
    self = self->_stripProfile;
  }
  id v3 = [(PKPassColorProfile *)self foregroundColor];

  return v3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (id)labelColorOverStrip:(BOOL)a3
{
  if (a3 && self->_stripProfile) {
    self = self->_stripProfile;
  }
  id v3 = [(PKPassColorProfile *)self labelColor];

  return v3;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (BOOL)isLight
{
  return self->_backgroundLightness > 0.219999999;
}

- (id)foregroundAttributesForFont:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4FB0700];
  id v4 = a3;
  v5 = [(PKPassColorProfile *)self foregroundColor];
  v8[1] = *MEMORY[0x1E4FB06F8];
  v9[0] = v5;
  v9[1] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)labelAttributesForFont:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4FB0700];
  id v4 = a3;
  v5 = [(PKPassColorProfile *)self labelColor];
  v8[1] = *MEMORY[0x1E4FB06F8];
  v9[0] = v5;
  v9[1] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)labelImageForGlyph:(id)a3
{
  return (id)[a3 imageWithTintColor:self->_labelColor renderingMode:1];
}

- (id)foregroundImageForGlyph:(id)a3
{
  return [(PKPassColorProfile *)self _imageForGlyph:a3 color:self->_foregroundColor];
}

- (id)_imageForGlyph:(id)a3 color:(id)a4
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v7 = a4;
  id v8 = a3;
  [v8 size];
  double width = v17.width;
  double height = v17.height;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v12 = v7;
  v13 = (CGColor *)[v12 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v13);
  v18.origin.x = v5;
  v18.origin.y = v6;
  v18.size.double width = width;
  v18.size.double height = height;
  CGContextFillRect(CurrentContext, v18);
  objc_msgSend(v8, "drawInRect:blendMode:alpha:", 22, v5, v6, width, height, 1.0);

  objc_super v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)overlayDarkeningAlpha
{
  return self->_overlayDarkeningAlpha;
}

- (double)regularDarkeningAlpha
{
  return self->_regularDarkeningAlpha;
}

- (double)overlayLighteningAlpha
{
  return self->_overlayLighteningAlpha;
}

- (double)regularLighteningAlpha
{
  return self->_regularLighteningAlpha;
}

- (UIColor)footerBackgroundColor
{
  return self->_footerBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_stripProfile, 0);
}

@end