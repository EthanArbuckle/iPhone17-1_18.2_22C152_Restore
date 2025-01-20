@interface _UIWebViewportHandler
- (BOOL)allowsUserScaling;
- (BOOL)avoidsUnsafeArea;
- (BOOL)isClassicViewportMode;
- (BOOL)shouldIgnoreHorizontalScalingConstraints;
- (BOOL)shouldIgnoreScalingConstraints;
- (BOOL)shouldIgnoreVerticalScalingConstraints;
- (CGRect)documentBounds;
- (CGSize)availableViewSize;
- (_UIWebViewportConfiguration)rawViewConfiguration;
- (_UIWebViewportHandlerDelegate)delegate;
- (double)integralInitialScale;
- (double)integralScaleForScale:(double)a3 keepingPointFixed:(CGPoint *)a4;
- (float)initialScale;
- (float)maximumScale;
- (float)minimumScale;
- (float)minimumScaleForViewSize:(CGSize)a3;
- (float)viewportHeight;
- (float)viewportWidth;
- (unsigned)webkitDefinedConfigurationFlags;
- (void)_resolveViewSizeRelativeLengths;
- (void)applyWebKitViewportArgumentsSize:(CGSize)a3 initialScale:(float)a4 minimumScale:(float)a5 maximumScale:(float)a6 allowsUserScaling:(float)a7 allowsShrinkToFit:(float)a8 viewportFit:(id)a9;
- (void)clearWebKitViewportConfigurationFlags;
- (void)overrideViewportConfiguration:(const _UIWebViewportConfiguration *)a3;
- (void)resetViewportConfiguration:(const _UIWebViewportConfiguration *)a3;
- (void)setAvailableViewSize:(CGSize)a3 updateConfigurationSize:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDocumentBounds:(CGRect)a3;
- (void)update:(id)a3;
@end

@implementation _UIWebViewportHandler

- (float)initialScale
{
  if (self->_configuration.initialScale != -1.0
    && ![(_UIWebViewportHandler *)self shouldIgnoreScalingConstraints])
  {
    return self->_configuration.initialScale;
  }
  float width = self->_documentBounds.size.width;
  if (width <= 0.0)
  {
    [(_UIWebViewportHandler *)self viewportWidth];
    float width = v4;
  }
  float v5 = 0.0;
  if (width > 0.0
    && ![(_UIWebViewportHandler *)self shouldIgnoreVerticalScalingConstraints])
  {
    float v5 = self->_availableViewSize.width / width;
  }
  float height = self->_documentBounds.size.height;
  if (height <= 0.0)
  {
    [(_UIWebViewportHandler *)self viewportHeight];
    float height = v7;
  }
  if (height > 0.0
    && self->_availableViewSize.height > (float)(v5 * height)
    && ![(_UIWebViewportHandler *)self shouldIgnoreHorizontalScalingConstraints])
  {
    float v5 = self->_availableViewSize.height / height;
  }
  BOOL v8 = [(_UIWebViewportHandler *)self shouldIgnoreScalingConstraints];
  uint64_t v9 = 68;
  if (v8) {
    uint64_t v9 = 36;
  }
  float result = *(float *)((char *)&self->super.isa + v9);
  if (v5 >= result) {
    float result = v5;
  }
  if (result >= self->_configuration.maximumScale) {
    return self->_configuration.maximumScale;
  }
  return result;
}

- (float)minimumScale
{
  if (self->_configuration.initialScale == -1.0)
  {
    [(_UIWebViewportHandler *)self initialScale];
  }
  else
  {
    float minimumScale = self->_configuration.minimumScale;
    float width = self->_documentBounds.size.width;
    if (width > 0.0)
    {
      float height = self->_documentBounds.size.height;
      if (self->_availableViewSize.width > (float)(minimumScale * width)
        && ![(_UIWebViewportHandler *)self shouldIgnoreVerticalScalingConstraints])
      {
        float minimumScale = self->_availableViewSize.width / width;
      }
      if (self->_availableViewSize.height > (float)(minimumScale * height)
        && ![(_UIWebViewportHandler *)self shouldIgnoreHorizontalScalingConstraints])
      {
        float minimumScale = self->_availableViewSize.height / height;
      }
    }
    float result = self->_configuration.minimumScale;
    if (minimumScale >= result) {
      float result = minimumScale;
    }
    if (result >= self->_configuration.maximumScale) {
      return self->_configuration.maximumScale;
    }
  }
  return result;
}

- (float)maximumScale
{
  return self->_configuration.maximumScale;
}

- (BOOL)allowsUserScaling
{
  return self->_configuration.allowsUserScaling
      || [(_UIWebViewportHandler *)self shouldIgnoreScalingConstraints];
}

- (BOOL)avoidsUnsafeArea
{
  return self->_configuration.avoidsUnsafeArea;
}

- (BOOL)shouldIgnoreHorizontalScalingConstraints
{
  if (!self->_configuration.allowsShrinkToFit) {
    return 0;
  }
  BOOL result = self->_documentBounds.size.width > self->_availableViewSize.width;
  if (!self->_widthIsDeviceWidth
    && ((self->_webkitDefinedConfigurationFlags & 2) == 0 || self->_configuration.initialScale != 1.0))
  {
    return 0;
  }
  return result;
}

- (BOOL)shouldIgnoreVerticalScalingConstraints
{
  BOOL allowsShrinkToFit = self->_configuration.allowsShrinkToFit;
  if (allowsShrinkToFit)
  {
    if (!self->_heightIsDeviceHeight) {
      return 0;
    }
    BOOL allowsShrinkToFit = self->_documentBounds.size.height > self->_availableViewSize.height;
    if (self->_widthIsDeviceWidth) {
      return 0;
    }
  }
  return allowsShrinkToFit;
}

- (BOOL)shouldIgnoreScalingConstraints
{
  int v3 = dyld_program_sdk_at_least();
  if (v3)
  {
    if ([(_UIWebViewportHandler *)self shouldIgnoreHorizontalScalingConstraints])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(_UIWebViewportHandler *)self shouldIgnoreVerticalScalingConstraints];
    }
  }
  return v3;
}

- (_UIWebViewportConfiguration)rawViewConfiguration
{
  CGSize size = self[2].size;
  retstr->CGSize size = *(CGSize *)&self[1].initialScale;
  *(CGSize *)&retstr->initialScale = size;
  return self;
}

- (void)update:(id)a3
{
  BOOL v5 = [(_UIWebViewportHandler *)self allowsUserScaling];
  [(_UIWebViewportHandler *)self initialScale];
  float v7 = v6;
  [(_UIWebViewportHandler *)self minimumScale];
  float v9 = v8;
  [(_UIWebViewportHandler *)self maximumScale];
  float v11 = v10;
  [(_UIWebViewportHandler *)self viewportWidth];
  float v13 = v12;
  [(_UIWebViewportHandler *)self viewportHeight];
  float v15 = v14;
  BOOL v16 = [(_UIWebViewportHandler *)self avoidsUnsafeArea];
  self->_isInUpdateBlock = 1;
  (*((void (**)(id))a3 + 2))(a3);
  self->_isInUpdateBlock = 0;
  if (!self->_initialConfigurationHasBeenSentToDelegate
    || v5 != [(_UIWebViewportHandler *)self allowsUserScaling]
    || ([(_UIWebViewportHandler *)self initialScale], v7 != v17)
    || ([(_UIWebViewportHandler *)self minimumScale], v9 != v18)
    || ([(_UIWebViewportHandler *)self maximumScale], v11 != v19))
  {
    [(_UIWebViewportHandlerDelegate *)self->_delegate viewportHandlerDidChangeScales:self];
  }
  [(_UIWebViewportHandler *)self viewportWidth];
  float v21 = v20;
  [(_UIWebViewportHandler *)self viewportHeight];
  if (!self->_initialConfigurationHasBeenSentToDelegate || v13 != v21 || v15 != v22) {
    -[_UIWebViewportHandlerDelegate viewportHandler:didChangeViewportSize:](self->_delegate, "viewportHandler:didChangeViewportSize:", self, v21, v22);
  }
  BOOL v23 = [(_UIWebViewportHandler *)self avoidsUnsafeArea];
  if (v16 != v23) {
    [(_UIWebViewportHandlerDelegate *)self->_delegate viewportHandler:self didChangeAvoidsUnsafeArea:v23];
  }
  self->_initialConfigurationHasBeenSentToDelegate = 1;
}

- (void)setDocumentBounds:(CGRect)a3
{
  self->_documentBounds = a3;
}

- (void)setAvailableViewSize:(CGSize)a3 updateConfigurationSize:(BOOL)a4
{
  self->_availableViewSize = a3;
  if (a4) {
    [(_UIWebViewportHandler *)self _resolveViewSizeRelativeLengths];
  }
}

- (void)_resolveViewSizeRelativeLengths
{
  *(_WORD *)&self->_widthIsDeviceWidth = 0;
  double width = self->_viewportArgumentsSize.width;
  p_availableViewSize = &self->_availableViewSize;
  if (width == -2.0)
  {
    self->_widthIsDeviceWidth = 1;
    p_double height = &self->_availableViewSize;
  }
  else
  {
    if (width != -3.0) {
      goto LABEL_6;
    }
    p_double height = (CGSize *)&self->_availableViewSize.height;
  }
  double width = p_height->width;
LABEL_6:
  if (width >= 0.0)
  {
    double v6 = fmax(width, 10.0);
    if (v6 > 10000.0) {
      double v6 = 10000.0;
    }
    self->_configuration.size.double width = v6;
    unsigned int v5 = self->_webkitDefinedConfigurationFlags | 0x10;
  }
  else
  {
    if (width != -1.0) {
      goto LABEL_13;
    }
    self->_configuration.size.double width = self->_defaultConfiguration.size.width;
    unsigned int v5 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFEF;
  }
  self->_unsigned int webkitDefinedConfigurationFlags = v5;
LABEL_13:
  double height = self->_viewportArgumentsSize.height;
  if (height != -2.0)
  {
    if (height != -3.0) {
      goto LABEL_17;
    }
    self->_heightIsDeviceHeight = 1;
    p_availableViewSize = (CGSize *)&self->_availableViewSize.height;
  }
  double height = p_availableViewSize->width;
LABEL_17:
  if (height >= 0.0)
  {
    double v9 = fmax(height, 10.0);
    if (v9 > 10000.0) {
      double v9 = 10000.0;
    }
    self->_configuration.size.double height = v9;
    unsigned int webkitDefinedConfigurationFlags = self->_webkitDefinedConfigurationFlags | 0x20;
  }
  else
  {
    unsigned int webkitDefinedConfigurationFlags = self->_webkitDefinedConfigurationFlags;
    if (height != -1.0) {
      goto LABEL_24;
    }
    self->_configuration.size.double height = self->_defaultConfiguration.size.height;
    webkitDefinedConfigurationFlags &= ~0x20u;
  }
  self->_unsigned int webkitDefinedConfigurationFlags = webkitDefinedConfigurationFlags;
LABEL_24:
  if ((webkitDefinedConfigurationFlags & 0x32) != 0)
  {
    if ((webkitDefinedConfigurationFlags & 2) != 0)
    {
      if ((webkitDefinedConfigurationFlags & 0x10) != 0)
      {
        if ((webkitDefinedConfigurationFlags & 0x20) == 0) {
          self->_configuration.size.double height = -1.0;
        }
      }
      else
      {
        self->_configuration.size.double width = -1.0;
      }
    }
    else
    {
      self->_configuration.initialScale = -1.0;
    }
  }
}

- (void)applyWebKitViewportArgumentsSize:(CGSize)a3 initialScale:(float)a4 minimumScale:(float)a5 maximumScale:(float)a6 allowsUserScaling:(float)a7 allowsShrinkToFit:(float)a8 viewportFit:(id)a9
{
  double width = a3.width;
  if (a5 >= 0.0)
  {
    float minimumScale = fmaxf(a5, 0.1);
    if (minimumScale > 10.0) {
      float minimumScale = 10.0;
    }
    self->_configuration.float minimumScale = minimumScale;
    unsigned int v15 = self->_webkitDefinedConfigurationFlags | 4;
    goto LABEL_7;
  }
  if (a5 == -1.0)
  {
    float minimumScale = self->_defaultConfiguration.minimumScale;
    self->_configuration.float minimumScale = minimumScale;
    unsigned int v15 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFFB;
LABEL_7:
    self->_unsigned int webkitDefinedConfigurationFlags = v15;
    goto LABEL_9;
  }
  float minimumScale = self->_configuration.minimumScale;
LABEL_9:
  if (a6 >= 0.0)
  {
    if (minimumScale >= a6) {
      float maximumScale = minimumScale;
    }
    else {
      float maximumScale = a6;
    }
    if (maximumScale > 10.0) {
      float maximumScale = 10.0;
    }
    unsigned int v17 = self->_webkitDefinedConfigurationFlags | 8;
  }
  else
  {
    if (a6 != -1.0) {
      goto LABEL_19;
    }
    float maximumScale = self->_defaultConfiguration.maximumScale;
    unsigned int v17 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFF7;
  }
  self->_configuration.float maximumScale = maximumScale;
  self->_unsigned int webkitDefinedConfigurationFlags = v17;
LABEL_19:
  if (a4 >= 0.0)
  {
    if (minimumScale < a4) {
      float minimumScale = a4;
    }
    if (minimumScale > self->_configuration.maximumScale) {
      float minimumScale = self->_configuration.maximumScale;
    }
    self->_configuration.initialScale = minimumScale;
    unsigned int v18 = self->_webkitDefinedConfigurationFlags | 2;
  }
  else
  {
    if (a4 != -1.0) {
      goto LABEL_28;
    }
    self->_configuration.initialScale = self->_defaultConfiguration.initialScale;
    unsigned int v18 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFFD;
  }
  self->_unsigned int webkitDefinedConfigurationFlags = v18;
LABEL_28:
  self->_viewportArgumentsSize.double width = width;
  self->_viewportArgumentsSize.double height = a3.height;
  [(_UIWebViewportHandler *)self _resolveViewSizeRelativeLengths];
  unint64_t v19 = [+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL;
  BOOL v21 = width == 320.0 && v19 == 1;
  self->_classicViewportMode = v21;
  if (a7 >= 0.0)
  {
    self->_configuration.allowsUserScaling = a7 != 0.0;
    unsigned int v22 = self->_webkitDefinedConfigurationFlags | 0x40;
  }
  else
  {
    if (a7 != -1.0) {
      goto LABEL_39;
    }
    self->_configuration.allowsUserScaling = self->_defaultConfiguration.allowsUserScaling;
    unsigned int v22 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFBF;
  }
  self->_unsigned int webkitDefinedConfigurationFlags = v22;
LABEL_39:
  if (a8 >= 0.0)
  {
    self->_configuration.BOOL allowsShrinkToFit = a8 != 0.0;
    unsigned int v23 = self->_webkitDefinedConfigurationFlags | 0x80;
    goto LABEL_43;
  }
  if (a8 == -1.0)
  {
    self->_configuration.BOOL allowsShrinkToFit = self->_defaultConfiguration.allowsShrinkToFit;
    unsigned int v23 = self->_webkitDefinedConfigurationFlags & 0xFFFFFF7F;
LABEL_43:
    self->_unsigned int webkitDefinedConfigurationFlags = v23;
  }
  if (a9 && ([a9 isEqualToString:@"auto"] & 1) == 0)
  {
    self->_configuration.avoidsUnsafeArea = [a9 isEqualToString:@"cover"] ^ 1;
    unsigned int v24 = self->_webkitDefinedConfigurationFlags | 0x100;
  }
  else
  {
    self->_configuration.avoidsUnsafeArea = self->_defaultConfiguration.avoidsUnsafeArea;
    unsigned int v24 = self->_webkitDefinedConfigurationFlags & 0xFFFFFEFF;
  }
  self->_unsigned int webkitDefinedConfigurationFlags = v24;
}

- (void)clearWebKitViewportConfigurationFlags
{
  self->_unsigned int webkitDefinedConfigurationFlags = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_viewportArgumentsSize = _Q0;
}

- (void)overrideViewportConfiguration:(const _UIWebViewportConfiguration *)a3
{
  long long v3 = *(_OWORD *)&a3->initialScale;
  self->_configuration.CGSize size = a3->size;
  *(_OWORD *)&self->_configuration.initialScale = v3;
}

- (void)resetViewportConfiguration:(const _UIWebViewportConfiguration *)a3
{
  self->_initialConfigurationHasBeenSentToDelegate = 0;
  long long v3 = *(_OWORD *)&a3->initialScale;
  self->_defaultConfiguration.CGSize size = a3->size;
  *(_OWORD *)&self->_defaultConfiguration.initialScale = v3;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_viewportArgumentsSize = _Q0;
  -[_UIWebViewportHandler overrideViewportConfiguration:](self, "overrideViewportConfiguration:");
}

- (float)viewportWidth
{
  double width = self->_configuration.size.width;
  float initialScale = self->_configuration.initialScale;
  if (width != -1.0)
  {
    if (initialScale == -1.0) {
      float initialScale = self->_configuration.maximumScale;
    }
    double v5 = initialScale;
    float v6 = width * v5;
    double v7 = v6;
    double v8 = self->_availableViewSize.width;
    if (v8 > v7) {
      double width = v8 / v5;
    }
    return round(width);
  }
  if (initialScale != -1.0 && self->_configuration.size.height == -1.0)
  {
    double v9 = self->_availableViewSize.width;
    double height = initialScale;
LABEL_11:
    double width = v9 / height;
    return round(width);
  }
  double v11 = self->_availableViewSize.width;
  if (self->_availableViewSize.height > 0.0)
  {
    [(_UIWebViewportHandler *)self viewportHeight];
    double v9 = v11 * v12;
    double height = self->_availableViewSize.height;
    goto LABEL_11;
  }
  return v11;
}

- (float)viewportHeight
{
  double height = self->_configuration.size.height;
  float initialScale = self->_configuration.initialScale;
  if (height != -1.0)
  {
    if (initialScale == -1.0) {
      float initialScale = self->_configuration.maximumScale;
    }
    double v5 = initialScale;
    float v6 = height * v5;
    double v7 = v6;
    double v8 = self->_availableViewSize.height;
    if (v8 > v7) {
      double height = v8 / v5;
    }
    return ceil(height);
  }
  if (initialScale != -1.0 && self->_configuration.size.width == -1.0)
  {
    double v9 = self->_availableViewSize.height;
    double width = initialScale;
LABEL_11:
    double height = v9 / width;
    return ceil(height);
  }
  double v11 = self->_availableViewSize.height;
  if (self->_availableViewSize.width > 0.0)
  {
    [(_UIWebViewportHandler *)self viewportWidth];
    double v9 = v11 * v12;
    double width = self->_availableViewSize.width;
    goto LABEL_11;
  }
  return v11;
}

- (double)integralInitialScale
{
  [(_UIWebViewportHandler *)self initialScale];
  double v4 = v3;
  [(_UIWebViewportHandler *)self integralScaleForScale:0 keepingPointFixed:v4];
  return result;
}

- (double)integralScaleForScale:(double)a3 keepingPointFixed:(CGPoint *)a4
{
  double width = self->_documentBounds.size.width;
  if (width == 0.0)
  {
    double v5 = 1.0;
    if (a3 != 0.0) {
      double v5 = a3;
    }
  }
  else
  {
    double v5 = round(width * a3) / width;
  }
  if (a3 != 0.0 && a4 != 0) {
    *(float64x2_t *)a4 = vrndaq_f64(vdivq_f64(vmulq_n_f64(*(float64x2_t *)a4, v5), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)));
  }
  return v5;
}

- (float)minimumScaleForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_configuration.initialScale != -1.0
    || ((p_availableViewSize = &self->_availableViewSize, self->_availableViewSize.width == a3.width)
      ? (BOOL v7 = self->_availableViewSize.height == a3.height)
      : (BOOL v7 = 0),
        v7))
  {
    [(_UIWebViewportHandler *)self minimumScale];
  }
  else
  {
    CGSize v17 = *p_availableViewSize;
    double v9 = self->_documentBounds.size.width;
    double v8 = self->_documentBounds.size.height;
    self->_availableViewSize = a3;
    [(_UIWebViewportHandler *)self viewportWidth];
    double v11 = self->_documentBounds.size.width;
    double v12 = v10;
    if (v11 == v10)
    {
      if (v11 >= v10) {
        double v9 = self->_documentBounds.size.width;
      }
      else {
        double v9 = v10;
      }
      double v8 = self->_documentBounds.size.height;
      [(_UIWebViewportHandler *)self viewportHeight];
      double v14 = v13;
      if (v8 < v14) {
        double v8 = v14;
      }
      double v11 = self->_documentBounds.size.width;
    }
    if (v11 <= 0.0) {
      double v15 = v12;
    }
    else {
      double v15 = v9;
    }
    float result = width / v15;
    CGSize *p_availableViewSize = v17;
    if (v11 > 0.0 && v8 * result < height) {
      float result = height / v8;
    }
    if (result < self->_configuration.minimumScale) {
      float result = self->_configuration.minimumScale;
    }
    if (result >= self->_configuration.maximumScale) {
      float result = self->_configuration.maximumScale;
    }
    if (result < 0.1) {
      return 0.1;
    }
  }
  return result;
}

- (_UIWebViewportHandlerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIWebViewportHandlerDelegate *)a3;
}

- (CGRect)documentBounds
{
  double x = self->_documentBounds.origin.x;
  double y = self->_documentBounds.origin.y;
  double width = self->_documentBounds.size.width;
  double height = self->_documentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)availableViewSize
{
  double width = self->_availableViewSize.width;
  double height = self->_availableViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)webkitDefinedConfigurationFlags
{
  return self->_webkitDefinedConfigurationFlags;
}

- (BOOL)isClassicViewportMode
{
  return self->_classicViewportMode;
}

@end