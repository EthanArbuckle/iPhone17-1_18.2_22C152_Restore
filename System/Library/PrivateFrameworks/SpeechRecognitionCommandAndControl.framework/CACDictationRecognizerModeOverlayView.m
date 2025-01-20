@interface CACDictationRecognizerModeOverlayView
- (BOOL)didUpdateItems;
- (CACDictationRecognizerModeOverlayView)initWithFrame:(CGRect)a3;
- (CGRect)boundsForLastReload;
- (UIColor)tintColor;
- (id)_createInvertedMaskedImage:(id)a3 withColor:(id)a4;
- (id)_imageForCurrentDictiationRecognizerMode;
- (id)imageBundle;
- (void)_addIconContrasted:(BOOL)a3;
- (void)_updateOverlayImage;
- (void)setBoundsForLastReload:(CGRect)a3;
- (void)setDictationRecognizerMode:(int)a3;
- (void)setDidUpdateItems:(BOOL)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setImageRect:(CGRect)a3 withColor:(id)a4;
- (void)setTintColor:(id)a3;
@end

@implementation CACDictationRecognizerModeOverlayView

- (CACDictationRecognizerModeOverlayView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACDictationRecognizerModeOverlayView;
  return -[CACDictationRecognizerModeOverlayView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImageRect:(CGRect)a3
{
}

- (void)setImageRect:(CGRect)a3 withColor:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  if (!CGRectEqualToRect(self->_imageRect, v12))
  {
    self->_imageRect.origin.CGFloat x = x;
    self->_imageRect.origin.CGFloat y = y;
    self->_imageRect.size.CGFloat width = width;
    self->_imageRect.size.CGFloat height = height;
    objc_storeStrong((id *)&self->_tintColor, a4);
    [(CACDictationRecognizerModeOverlayView *)self _updateOverlayImage];
  }
}

- (void)setDictationRecognizerMode:(int)a3
{
  if (self->_dictationRecognizerMode != a3)
  {
    self->_dictationRecognizerMode = a3;
    [(CACDictationRecognizerModeOverlayView *)self _updateOverlayImage];
  }
}

- (id)_createInvertedMaskedImage:(id)a3 withColor:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F00650];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithImage:v7];
  v9 = [MEMORY[0x263F00640] filterWithName:@"CIColorInvert"];
  [v9 setValue:v8 forKey:*MEMORY[0x263F00968]];
  v28 = [MEMORY[0x263F00628] contextWithOptions:0];
  id v10 = [v9 outputImage];
  [v8 extent];
  v11 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v10);

  size_t Width = CGImageGetWidth(v11);
  size_t Height = CGImageGetHeight(v11);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v11);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v11);
  size_t BytesPerRow = CGImageGetBytesPerRow(v11);
  DataProvider = CGImageGetDataProvider(v11);
  v18 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 1);
  v19 = [v7 _flatImageWithColor:v6];

  id v20 = v19;
  v21 = (CGImage *)[v20 CGImage];

  v22 = CGImageCreateWithMask(v21, v18);
  CGImageRelease(v18);
  v23 = (void *)MEMORY[0x263F827E8];
  [v7 scale];
  double v25 = v24;

  v26 = [v23 imageWithCGImage:v22 scale:0 orientation:v25];
  CGImageRelease(v22);

  return v26;
}

- (void)_updateOverlayImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CACDictationRecognizerModeOverlayView__updateOverlayImage__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__CACDictationRecognizerModeOverlayView__updateOverlayImage__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) removeFromSuperview];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 bounds];

  [*(id *)(a1 + 32) frame];
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    [*(id *)(a1 + 32) _addIconContrasted:1];
  }
  [*(id *)(a1 + 32) _addIconContrasted:0];
  return [*(id *)(a1 + 32) setNeedsDisplay];
}

- (void)_addIconContrasted:(BOOL)a3
{
  BOOL v3 = a3;
  v43[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [(CACDictationRecognizerModeOverlayView *)self addSubview:v5];
  id v6 = objc_alloc(MEMORY[0x263F82828]);
  id v7 = [(CACDictationRecognizerModeOverlayView *)self _imageForCurrentDictiationRecognizerMode];
  v8 = (void *)[v6 initWithImage:v7];

  [v8 setContentMode:0];
  p_imageRect = &self->_imageRect;
  objc_msgSend(v8, "setOrigin:", self->_imageRect.origin.x, self->_imageRect.origin.y);
  v42 = v8;
  [v5 addSubview:v8];
  if (v3)
  {
    long long v10 = +[CACAdaptiveBackdropView contrastAdaptiveBackdropViewWithFrame:](CACAdaptiveBackdropView, "contrastAdaptiveBackdropViewWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  else
  {
    long long v10 = objc_opt_new();
  }
  long long v11 = v10;
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v12 = [v11 layer];
  [v12 setCaptureOnly:0];

  uint64_t v13 = *MEMORY[0x263F15D80];
  uint64_t v14 = [v11 layer];
  [v14 setCompositingFilter:v13];

  [v5 addSubview:v11];
  v15 = [(CACDictationRecognizerModeOverlayView *)self layer];
  [v15 setAllowsGroupBlending:0];

  v16 = [(CACDictationRecognizerModeOverlayView *)self _imageForCurrentDictiationRecognizerMode];
  v17 = [MEMORY[0x263F825C8] systemWhiteColor];
  if (v3) {
    [v16 _flatImageWithColor:v17];
  }
  else {
  uint64_t v18 = [(CACDictationRecognizerModeOverlayView *)self _createInvertedMaskedImage:v16 withColor:v17];
  }

  v41 = (void *)v18;
  v19 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v18];
  [v19 setContentMode:0];
  objc_msgSend(v19, "setOrigin:", p_imageRect->origin.x, p_imageRect->origin.y);
  if (v3)
  {
    [v19 frame];
    objc_msgSend(v19, "setFrame:", CACCGRectIncreasedByPercentage(v20, v21, v22, v23, 0.08));
  }
  [v5 addSubview:v19];
  v33 = [MEMORY[0x263EFF980] array];
  v40 = [v11 topAnchor];
  v39 = [v19 topAnchor];
  v37 = [v40 constraintEqualToAnchor:v39 constant:0.0];
  v43[0] = v37;
  v35 = [v11 bottomAnchor];
  v34 = [v19 bottomAnchor];
  double v24 = [v35 constraintEqualToAnchor:v34 constant:0.0];
  v43[1] = v24;
  [v11 leadingAnchor];
  double v25 = v11;
  v26 = v36 = v11;
  v27 = [v19 leadingAnchor];
  [v26 constraintEqualToAnchor:v27 constant:0.0];
  v28 = v38 = v5;
  v43[2] = v28;
  v29 = [v25 trailingAnchor];
  v30 = [v19 trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:0.0];
  v43[3] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
  [v33 addObjectsFromArray:v32];

  [MEMORY[0x263F08938] activateConstraints:v33];
}

- (id)_imageForCurrentDictiationRecognizerMode
{
  v2 = 0;
  switch(self->_dictationRecognizerMode)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v2 = @"dication-mode-commandsonly";
      goto LABEL_5;
    case 2:
      v2 = @"dication-mode-numerical";
      goto LABEL_5;
    case 3:
      v2 = @"dication-mode-alphabetical";
      goto LABEL_5;
    default:
LABEL_5:
      BOOL v3 = (void *)MEMORY[0x263F827E8];
      uint64_t v4 = [(CACDictationRecognizerModeOverlayView *)self imageBundle];
      v2 = [v3 imageNamed:v2 inBundle:v4];

LABEL_6:
      return v2;
  }
}

- (id)imageBundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CACDictationRecognizerModeOverlayView_imageBundle__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  if (imageBundle_onceToken_1 != -1) {
    dispatch_once(&imageBundle_onceToken_1, block);
  }
  return (id)imageBundle_sImageBundle_1;
}

uint64_t __52__CACDictationRecognizerModeOverlayView_imageBundle__block_invoke()
{
  imageBundle_sImageBundle_1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (CGRect)boundsForLastReload
{
  double x = self->_boundsForLastReload.origin.x;
  double y = self->_boundsForLastReload.origin.y;
  double width = self->_boundsForLastReload.size.width;
  double height = self->_boundsForLastReload.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundsForLastReload:(CGRect)a3
{
  self->_boundsForLastReload = a3;
}

- (BOOL)didUpdateItems
{
  return self->_didUpdateItems;
}

- (void)setDidUpdateItems:(BOOL)a3
{
  self->_didUpdateItems = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end