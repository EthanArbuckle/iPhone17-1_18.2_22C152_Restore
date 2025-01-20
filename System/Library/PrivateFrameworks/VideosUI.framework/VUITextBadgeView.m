@interface VUITextBadgeView
+ (BOOL)_viewBackgroundImageNeedsUpdatingWithFrame:(CGRect)a3 currentBackgroundImage:(id)a4;
+ (id)badgeWithLayout:(id)a3 existing:(id)a4;
- (BOOL)_textBadgeBackgroundImageNeedsUpdating;
- (BOOL)backgroundImageForMaterialRenderingHasChanged;
- (BOOL)isAccessibilityElement;
- (BOOL)isUppercased;
- (CGSize)_textSize;
- (CGSize)glyphSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)gradientBgColors;
- (NSAttributedString)attributedTitle;
- (NSOperation)pendingOperation;
- (NSOperationQueue)operationQueue;
- (NSTimer)expiryUpdateTimer;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (UIEdgeInsets)padding;
- (UIImage)backgroundImage;
- (UIImage)backgroundImageForMaterialRendering;
- (UIView)imageView;
- (VUIRentalExpirationLabel)rentalExpirationLabel;
- (VUITextBadgeView)initWithFrame:(CGRect)a3;
- (VUITextBadgeViewDelegate)delegate;
- (double)layerCornerRadius;
- (double)minHeight;
- (double)strokeSize;
- (id)accessibilityLabel;
- (int)blendMode;
- (unint64_t)badgeKind;
- (void)_cancelPendingOperation;
- (void)_configureWithLayout:(id)a3;
- (void)_imageLoaded;
- (void)_invalidateTimer;
- (void)_redrawTextBadgeWithDuration:(double)a3;
- (void)_redrawView:(id)a3 withDuration:(double)a4;
- (void)_setBackgroundImageForMaterialRendering:(id)a3;
- (void)_updateBackgroundImagesWithCompletedOperation:(id)a3;
- (void)_updateBackgroundMaterialImagesWithBackgroundImageSize:(CGSize)a3 performSynchronously:(BOOL)a4 overlayViewFrame:(CGRect)a5;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rentalExpirationLabelNeedsRelayout:(id)a3;
- (void)reset;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageForMaterialRendering:(id)a3;
- (void)setBackgroundImageForMaterialRendering:(id)a3 imageSize:(CGSize)a4 overlayViewFrame:(CGRect)a5;
- (void)setBackgroundImageForMaterialRendering:(id)a3 imageSize:(CGSize)a4 overlayViewFrame:(CGRect)a5 operationQueue:(id)a6;
- (void)setBackgroundImageForMaterialRenderingHasChanged:(BOOL)a3;
- (void)setBadgeKind:(unint64_t)a3;
- (void)setBlendMode:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setExpiryUpdateTimer:(id)a3;
- (void)setGlyphSize:(CGSize)a3;
- (void)setGradientBgColors:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIsUppercased:(BOOL)a3;
- (void)setLayerCornerRadius:(double)a3;
- (void)setMinHeight:(double)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPendingOperation:(id)a3;
- (void)setRentalExpirationLabel:(id)a3;
- (void)setStrokeSize:(double)a3;
- (void)setTintColor:(id)a3;
@end

@implementation VUITextBadgeView

- (VUITextBadgeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUITextBadgeView;
  v3 = -[VUITextBadgeView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(VUITextBadgeView *)v3 setBackgroundColor:v4];

    [(VUITextBadgeView *)v3 setContentMode:3];
    [(VUITextBadgeView *)v3 setClearsContextBeforeDrawing:1];
  }
  return v3;
}

+ (id)badgeWithLayout:(id)a3 existing:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v8 = v7;
  [v7 reset];
  [v8 _configureWithLayout:v6];

  return v8;
}

- (void)_configureWithLayout:(id)a3
{
  id v4 = a3;
  -[VUITextBadgeView setBadgeKind:](self, "setBadgeKind:", [v4 badgeKind]);
  [v4 padding];
  -[VUITextBadgeView setPadding:](self, "setPadding:");
  id v5 = [v4 tintColor];
  [(VUITextBadgeView *)self setTintColor:v5];

  -[VUITextBadgeView setIsUppercased:](self, "setIsUppercased:", [v4 isUppercased]);
  -[VUITextBadgeView setBlendMode:](self, "setBlendMode:", [v4 blendMode]);
  [v4 minHeight];
  -[VUITextBadgeView setMinHeight:](self, "setMinHeight:");
  [v4 layerCornerRadius];
  -[VUITextBadgeView setLayerCornerRadius:](self, "setLayerCornerRadius:");
  id v6 = [v4 backgroundColor];
  [(VUITextBadgeView *)self setBackgroundColor:v6];

  id v7 = [v4 gradientBgColors];

  [(VUITextBadgeView *)self setGradientBgColors:v7];
}

- (void)setImageView:(id)a3
{
  p_imageView = &self->_imageView;
  v9 = (UIView *)a3;
  if (*p_imageView != v9)
  {
    objc_storeStrong((id *)&self->_imageView, a3);
    [(VUITextBadgeView *)self vui_setNeedsDisplay];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v7 = *MEMORY[0x1E4FB3DF8];
      [v6 removeObserver:self name:*MEMORY[0x1E4FB3DF8] object:0];

      if (*p_imageView)
      {
        v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v8 addObserver:self selector:sel__imageLoaded name:v7 object:*p_imageView];
      }
    }
  }
}

- (id)accessibilityLabel
{
  attributedTitle = self->_attributedTitle;
  if (attributedTitle)
  {
    attributedTitle = [attributedTitle string];
  }
  return attributedTitle;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setBadgeKind:(unint64_t)a3
{
  if (self->_badgeKind != a3)
  {
    self->_badgeKind = a3;
    [(VUITextBadgeView *)self setClipsToBounds:1];
    [(VUITextBadgeView *)self vui_setNeedsDisplay];
  }
}

- (void)setLayerCornerRadius:(double)a3
{
  if (self->_layerCornerRadius != a3)
  {
    [(VUITextBadgeView *)self setVuiClipsToBounds:1];
    self->_layerCornerRadius = a3;
    id v5 = [(VUITextBadgeView *)self layer];
    [v5 setCornerRadius:self->_layerCornerRadius];

    [(VUITextBadgeView *)self vui_setNeedsDisplay];
  }
}

- (void)setAttributedTitle:(id)a3
{
  if (self->_attributedTitle != a3)
  {
    id v4 = (NSAttributedString *)[a3 copy];
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    [(VUITextBadgeView *)self vui_setNeedsDisplay];
  }
}

- (void)setRentalExpirationLabel:(id)a3
{
  id v5 = (VUIRentalExpirationLabel *)a3;
  p_rentalExpirationLabel = &self->_rentalExpirationLabel;
  if (self->_rentalExpirationLabel != v5)
  {
    v8 = v5;
    uint64_t v7 = [(VUILabel *)v5 vuiAttributedText];
    [(VUITextBadgeView *)self setAttributedTitle:v7];

    [(VUIRentalExpirationLabel *)v8 setDelegate:self];
    [(VUIRentalExpirationLabel *)*p_rentalExpirationLabel invalidateTimer];
    [(VUITextBadgeView *)self vui_addSubview:v8 oldView:*p_rentalExpirationLabel];
    objc_storeStrong((id *)&self->_rentalExpirationLabel, a3);
    [(VUITextBadgeView *)self vui_setNeedsDisplay];
    [(VUITextBadgeView *)self setClipsToBounds:1];
    [(VUITextBadgeView *)self layoutIfNeeded];
    id v5 = v8;
  }
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  id v4 = [a3 vuiAttributedText];
  [(VUITextBadgeView *)self setAttributedTitle:v4];

  id v5 = [(VUITextBadgeView *)self delegate];
  [v5 textBadgeViewContentsUpdated:self];
}

- (void)reset
{
  [(VUITextBadgeView *)self _invalidateTimer];
  [(VUITextBadgeView *)self setAttributedTitle:0];
  v3 = [(VUITextBadgeView *)self imageView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUITextBadgeView *)self imageView];
    [v5 setImage:0];
  }
  [(VUITextBadgeView *)self setLayerCornerRadius:0.0];
  [(VUITextBadgeView *)self setRentalExpirationLabel:0];
  [(VUITextBadgeView *)self _setBackgroundImageForMaterialRendering:0];
  [(VUITextBadgeView *)self _cancelPendingOperation];
}

- (void)dealloc
{
  [(VUITextBadgeView *)self _invalidateTimer];
  v3 = [(VUITextBadgeView *)self imageView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4FB3DF8] object:0];
  }
  [(VUITextBadgeView *)self _cancelPendingOperation];
  v6.receiver = self;
  v6.super_class = (Class)VUITextBadgeView;
  [(VUITextBadgeView *)&v6 dealloc];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  if (a4)
  {
    -[VUITextBadgeView sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_attributedTitle)
  {
    [(VUITextBadgeView *)self _textSize];
    double height = v4;
    VUIRoundValue();
    double v7 = v6 + 0.0;
  }
  else
  {
    double height = 0.0;
    double v7 = 0.0;
  }
  imageView = self->_imageView;
  if (imageView)
  {
    if (v7 > 0.0) {
      double v7 = v7 + 4.0;
    }
    double v7 = v7 + self->_glyphSize.width;
    if (self->_glyphSize.height >= height) {
      double height = self->_glyphSize.height;
    }
  }
  if (v7 > 0.0) {
    double v7 = v7 + self->_padding.left + self->_padding.right;
  }
  if (height > 0.0) {
    double height = height + self->_padding.top + self->_padding.bottom;
  }
  double minHeight = self->_minHeight;
  if (height >= minHeight || minHeight <= 0.0) {
    double minHeight = height;
  }
  if (imageView && !self->_attributedTitle) {
    double v7 = minHeight;
  }
  result.double height = minHeight;
  result.width = v7;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double v7 = +[VUIBezierPath bezierPathWithRect:](VUIBezierPath, "bezierPathWithRect:", 0.0, 0.0, width, height);
  v8 = v7;
  if (self->_backgroundImage)
  {
    CGContextAddPath(CurrentContext, (CGPathRef)[v7 vuiCGPath]);
    CGContextClip(CurrentContext);
    -[UIImage drawAtPoint:](self->_backgroundImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  unint64_t badgeKind = self->_badgeKind;
  if (badgeKind == 1)
  {
    v19 = [(VUITextBadgeView *)self backgroundColor];
    [v19 set];

    [v8 setLineWidth:self->_strokeSize];
    [v8 stroke];
    goto LABEL_14;
  }
  if (badgeKind == 3)
  {
    v20 = [MEMORY[0x1E4FB1618] clearColor];
LABEL_13:
    v21 = v20;
    [v20 set];

    [v8 fill];
    goto LABEL_14;
  }
  if (badgeKind != 2) {
    goto LABEL_14;
  }
  if (![(NSArray *)self->_gradientBgColors count])
  {
    v20 = [(VUITextBadgeView *)self backgroundColor];
    goto LABEL_13;
  }
  v10 = [(NSArray *)self->_gradientBgColors objectAtIndexedSubscript:0];
  v11 = [(NSArray *)self->_gradientBgColors objectAtIndexedSubscript:1];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)locations = xmmword_1E38FE180;
  id v13 = v10;
  v40[0] = [v13 CGColor];
  id v14 = v11;
  v40[1] = objc_msgSend(v14, "CGColor", v40[0]);
  CFArrayRef v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  CGGradientRef v16 = CGGradientCreateWithColors(DeviceRGB, v15, locations);
  if (v16)
  {
    v17 = v16;
    v45.origin.x = 0.0;
    v45.origin.y = 0.0;
    v45.size.double width = width;
    v45.size.double height = height;
    CGFloat MaxX = CGRectGetMaxX(v45);
    CGContextSaveGState(CurrentContext);
    CGContextAddPath(CurrentContext, (CGPathRef)[v8 vuiCGPath]);
    CGContextClip(CurrentContext);
    v43.x = 0.0;
    v43.y = 0.0;
    v44.y = 0.0;
    v44.x = MaxX;
    CGContextDrawLinearGradient(CurrentContext, v17, v43, v44, 3u);
    CGContextRestoreGState(CurrentContext);
    CGGradientRelease(v17);
  }
  CFRelease(DeviceRGB);

LABEL_14:
  p_padding = &self->_padding;
  double left = self->_padding.left;
  v24 = [(VUITextBadgeView *)self imageView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v26 = [(VUITextBadgeView *)self imageView];
    v27 = [v26 image];

    p_imageView = &self->_imageView;
    if (self->_imageView && v27)
    {
      if (self->_tintColor)
      {
        uint64_t v29 = objc_msgSend(v27, "vui_imageWithColor:");

        v27 = (void *)v29;
      }
      double v30 = self->_glyphSize.width;
      double v31 = self->_glyphSize.height;
      if (!self->_attributedTitle) {
        double left = (width - v30) * 0.5;
      }
      VUIRoundValue();
      objc_msgSend(v27, "drawInRect:", left, v32, v30, v31);
      double left = v30 + 4.0 + left;
    }
  }
  else
  {
    v27 = 0;
    p_imageView = &self->_imageView;
  }
  if (self->_attributedTitle)
  {
    CGContextSetBlendMode(CurrentContext, (CGBlendMode)self->_blendMode);
    v33 = (void *)[(NSAttributedString *)self->_attributedTitle mutableCopy];
    id v34 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    v35 = v34;
    if (*p_imageView)
    {
      double width = width - left - p_padding->right;
    }
    else
    {
      [v34 setAlignment:1];
      double left = 0.0;
    }
    objc_msgSend(v33, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v35, 0, objc_msgSend(v33, "length"));
    v36 = [v33 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    [v36 capHeight];
    VUIRoundValue();
    double v38 = v37 + p_padding->top;
    VUIRoundValue();
    objc_msgSend(v33, "drawWithRect:options:context:", 32, 0, left, v38, width, v39);
  }
  CGContextRestoreGState(CurrentContext);
}

- (void)_invalidateTimer
{
  [(NSTimer *)self->_expiryUpdateTimer invalidate];
  expiryUpdateTimer = self->_expiryUpdateTimer;
  self->_expiryUpdateTimer = 0;
}

- (CGSize)_textSize
{
  attributedTitle = self->_attributedTitle;
  if (attributedTitle)
  {
    if (self->_imageView) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 11;
    }
    -[NSAttributedString boundingRectWithSize:options:context:](attributedTitle, "boundingRectWithSize:options:context:", v4, 0, 1.79769313e308, 1.79769313e308);
    double v5 = [(NSAttributedString *)self->_attributedTitle attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    double v6 = v5;
    if (self->_isUppercased)
    {
      [v5 capHeight];
    }
    else
    {
      -[NSAttributedString boundingRectWithSize:options:context:](self->_attributedTitle, "boundingRectWithSize:options:context:", 3, 0, 1.79769313e308, 1.79769313e308);
      [v6 ascender];
      [v6 capHeight];
      [v6 descender];
    }
    VUIRoundValue();
    double v7 = v9;
    VUIRoundValue();
    double v8 = v10;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v11 = v7;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_imageLoaded
{
  [(VUITextBadgeView *)self vui_setNeedsDisplay];
  [(VUITextBadgeView *)self forceDisplayIfNeeded];
}

- (void)_setBackgroundImageForMaterialRendering:(id)a3
{
}

- (void)setBackgroundImageForMaterialRendering:(id)a3 imageSize:(CGSize)a4 overlayViewFrame:(CGRect)a5 operationQueue:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.height;
  double v12 = a4.width;
  CGGradientRef v16 = (UIImage *)a3;
  id v15 = a6;
  objc_storeStrong((id *)&self->_operationQueue, a6);
  if (self->_backgroundImageForMaterialRendering != v16)
  {
    self->_backgroundImageForMaterialRenderingHasChanged = 1;
    objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, a3);
    -[VUITextBadgeView _updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:](self, "_updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:", 0, v12, v11, x, y, width, height);
  }
}

- (void)setBackgroundImageForMaterialRendering:(id)a3 imageSize:(CGSize)a4 overlayViewFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.height;
  double v10 = a4.width;
  id v13 = (UIImage *)a3;
  if (self->_backgroundImageForMaterialRendering != v13)
  {
    self->_backgroundImageForMaterialRenderingHasChanged = 1;
    id v14 = v13;
    objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, a3);
    -[VUITextBadgeView _updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:](self, "_updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:", 0, v10, v9, x, y, width, height);
    id v13 = v14;
  }
}

- (void)_updateBackgroundMaterialImagesWithBackgroundImageSize:(CGSize)a3 performSynchronously:(BOOL)a4 overlayViewFrame:(CGRect)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_backgroundImageForMaterialRendering)
  {
    double height = a5.size.height;
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    BOOL v9 = a4;
    double v10 = a3.height;
    double v11 = a3.width;
    [(VUITextBadgeView *)self _cancelPendingOperation];
    id v13 = [[VUIOverlayBackgroundMaterialImagesOperation alloc] initWithSourceBackgroundImage:self->_backgroundImageForMaterialRendering];
    -[VUIOverlayBackgroundMaterialImagesOperation setResizedBackgroundImageSize:](v13, "setResizedBackgroundImageSize:", v11, v10);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(VUITextBadgeView *)self _textBadgeBackgroundImageNeedsUpdating])
    {
      id v15 = [VUIOverlayWithMaterialRendering alloc];
      [(VUITextBadgeView *)self frame];
      v20 = [(VUIOverlayWithMaterialRendering *)v15 initWithIdentifier:@"textBadge", x, y, width, height, v16, v17, v18, v19 rect croppedRect];
      [v14 addObject:v20];
    }
    [(VUIOverlayBackgroundMaterialImagesOperation *)v13 setOverlayMaterialRequests:v14];
    if (v9)
    {
      [(VUIOverlayBackgroundMaterialImagesOperation *)v13 start];
      [(VUITextBadgeView *)self _updateBackgroundImagesWithCompletedOperation:v13];
    }
    else
    {
      objc_initWeak(&location, self);
      v21 = (void *)MEMORY[0x1E4F28B48];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __113__VUITextBadgeView__updateBackgroundMaterialImagesWithBackgroundImageSize_performSynchronously_overlayViewFrame___block_invoke;
      v32[3] = &unk_1E6DF5490;
      objc_copyWeak(&v34, &location);
      v22 = v13;
      v33 = v22;
      v23 = [v21 blockOperationWithBlock:v32];
      [v23 addDependency:v22];
      v24 = [MEMORY[0x1E4F28F08] mainQueue];
      [v24 addOperation:v23];

      [(NSOperationQueue *)self->_operationQueue addOperation:v22];
      objc_storeStrong((id *)&self->_pendingOperation, v13);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v25 = [&unk_1F3F3E3F0 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v29 != v26) {
              objc_enumerationMutation(&unk_1F3F3E3F0);
            }
            [(NSOperation *)self->_pendingOperation addObserver:self forKeyPath:*(void *)(*((void *)&v28 + 1) + 8 * i) options:3 context:VUITextBadgeViewPendingOperationContext];
          }
          uint64_t v25 = [&unk_1F3F3E3F0 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v25);
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
  }
}

void __113__VUITextBadgeView__updateBackgroundMaterialImagesWithBackgroundImageSize_performSynchronously_overlayViewFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateBackgroundImagesWithCompletedOperation:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_updateBackgroundImagesWithCompletedOperation:(id)a3
{
  id v10 = a3;
  char v4 = [v10 isCancelled];
  double v5 = v10;
  if ((v4 & 1) == 0)
  {
    double v6 = [v10 resizedSourceBackgroundImage];
    if (v6) {
      objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, v6);
    }
    double v7 = [v10 overlayMaterialImageByIdentifier];
    double v8 = v7;
    if (v7)
    {
      BOOL v9 = [v7 objectForKey:@"textBadge"];
      if (v9)
      {
        [(VUITextBadgeView *)self setBackgroundImage:v9];
        [(VUITextBadgeView *)self _redrawTextBadgeWithDuration:0.2];
      }
      self->_backgroundImageForMaterialRenderingHasChanged = 0;
    }
    double v5 = v10;
  }
}

- (void)_redrawTextBadgeWithDuration:(double)a3
{
}

- (void)_redrawView:(id)a3 withDuration:(double)a4
{
  id v5 = a3;
  [v5 setNeedsDisplay];
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__VUITextBadgeView__redrawView_withDuration___block_invoke;
  v8[3] = &unk_1E6DF3D58;
  id v9 = v5;
  id v7 = v5;
  [v6 transitionWithView:v7 duration:5242880 options:v8 animations:0 completion:a4];
}

uint64_t __45__VUITextBadgeView__redrawView_withDuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) forceDisplayIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:1.0];
}

- (void)_cancelPendingOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [&unk_1F3F3E408 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(&unk_1F3F3E408);
        }
        [(NSOperation *)self->_pendingOperation removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1F3F3E408 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  [(NSOperation *)self->_pendingOperation cancel];
  pendingOperation = self->_pendingOperation;
  self->_pendingOperation = 0;
}

- (BOOL)_textBadgeBackgroundImageNeedsUpdating
{
  if (!self->_backgroundImageForMaterialRendering) {
    return 0;
  }
  if (self->_backgroundImageForMaterialRenderingHasChanged) {
    return 1;
  }
  [(VUITextBadgeView *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(VUITextBadgeView *)self backgroundImage];
  char v13 = objc_msgSend((id)objc_opt_class(), "_viewBackgroundImageNeedsUpdatingWithFrame:currentBackgroundImage:", v12, v5, v7, v9, v11);

  return v13;
}

+ (BOOL)_viewBackgroundImageNeedsUpdatingWithFrame:(CGRect)a3 currentBackgroundImage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (CGRectEqualToRect(v13, *MEMORY[0x1E4F1DB28]))
  {
    BOOL v9 = 0;
  }
  else if (v8)
  {
    [v8 size];
    BOOL v9 = height != v11 || width != v10;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)VUITextBadgeViewPendingOperationContext == a6)
  {
    pendingOperation = self->_pendingOperation;
    self->_pendingOperation = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VUITextBadgeView;
    -[VUITextBadgeView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (double)strokeSize
{
  return self->_strokeSize;
}

- (void)setStrokeSize:(double)a3
{
  self->_strokeSize = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIView)imageView
{
  return self->_imageView;
}

- (VUIRentalExpirationLabel)rentalExpirationLabel
{
  return self->_rentalExpirationLabel;
}

- (VUITextBadgeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUITextBadgeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)backgroundImageForMaterialRendering
{
  return self->_backgroundImageForMaterialRendering;
}

- (void)setBackgroundImageForMaterialRendering:(id)a3
{
}

- (unint64_t)badgeKind
{
  return self->_badgeKind;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_double minHeight = a3;
}

- (NSArray)gradientBgColors
{
  return self->_gradientBgColors;
}

- (void)setGradientBgColors:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)isUppercased
{
  return self->_isUppercased;
}

- (void)setIsUppercased:(BOOL)a3
{
  self->_isUppercased = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)layerCornerRadius
{
  return self->_layerCornerRadius;
}

- (CGSize)glyphSize
{
  double width = self->_glyphSize.width;
  double height = self->_glyphSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setGlyphSize:(CGSize)a3
{
  self->_glyphSize = a3;
}

- (NSTimer)expiryUpdateTimer
{
  return self->_expiryUpdateTimer;
}

- (void)setExpiryUpdateTimer:(id)a3
{
}

- (NSOperation)pendingOperation
{
  return self->_pendingOperation;
}

- (void)setPendingOperation:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (BOOL)backgroundImageForMaterialRenderingHasChanged
{
  return self->_backgroundImageForMaterialRenderingHasChanged;
}

- (void)setBackgroundImageForMaterialRenderingHasChanged:(BOOL)a3
{
  self->_backgroundImageForMaterialRenderingHasChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperation, 0);
  objc_storeStrong((id *)&self->_expiryUpdateTimer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_gradientBgColors, 0);
  objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rentalExpirationLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end