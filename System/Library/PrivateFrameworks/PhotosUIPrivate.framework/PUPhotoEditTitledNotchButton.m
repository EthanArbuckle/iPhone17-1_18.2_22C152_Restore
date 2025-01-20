@interface PUPhotoEditTitledNotchButton
+ (CGSize)defaultPreferredContentFittingSize;
+ (PUPhotoEditTitledNotchButtonMetrics)defaultMetrics;
+ (id)_bestFontForTitle:(id)a3 inMaximumWidth:(double)a4 withMetrics:(PUPhotoEditTitledNotchButtonMetrics)a5 titleSize:(CGSize *)a6 fontAttributes:(id *)a7;
+ (id)bestFontForTitle:(id)a3 fittingInWidth:(double)a4;
+ (int64_t)editingTitledButtonType;
- (CGSize)preferredContentFittingSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PUPhotoEditTitledNotchButton)initWithFrame:(CGRect)a3;
- (PUPhotoEditTitledNotchButtonMetrics)metrics;
- (UIColor)textColor;
- (UIEdgeInsets)alignmentRectInsets;
- (id)contentImageWithTitle:(id)a3;
- (id)defaultContentImage;
- (id)largeContentImage;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setFrameFromVisibleFrame:(CGRect)a3;
- (void)setPreferredContentFittingSize:(CGSize)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4 fallbackSymbolName:(id)a5;
@end

@implementation PUPhotoEditTitledNotchButton

- (void).cxx_destruct
{
}

- (CGSize)preferredContentFittingSize
{
  double width = self->_preferredContentFittingSize.width;
  double height = self->_preferredContentFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (id)largeContentImage
{
  v3 = [(PUPhotoEditLegacyNotchButton *)self symbolName];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = [(PUPhotoEditLegacyNotchButton *)self symbolName];
    v6 = [v4 _systemImageNamed:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  v6 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v5];
  v7 = self;
  v8 = v7;
  if (v7)
  {
    v9 = [(PUPhotoEditTitledNotchButton *)v7 configuration];
    [v9 contentInsets];
    double v11 = v10;
    double v13 = v12;
    double v34 = v14;
    double v16 = v15;
  }
  else
  {
    double v11 = *MEMORY[0x1E4FB12A8];
    double v13 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v16 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    double v34 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  }
  v17 = [(PUPhotoEditLegacyNotchButton *)v8 backgroundView];
  [v17 _cornerRadius];
  double v19 = v18;

  [(PUPhotoEditTitledNotchButton *)v8 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  uint64_t v28 = [(PUPhotoEditTitledNotchButton *)v8 effectiveUserInterfaceLayoutDirection];
  if (v28) {
    double v29 = v16;
  }
  else {
    double v29 = v13;
  }
  if (v28) {
    double v30 = v13;
  }
  else {
    double v30 = v16;
  }
  v31 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v21 + v29, v11 + v23, v25 - (v29 + v30), v27 - (v11 + v34), v19);
  v32 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v31];

  return v32;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4FB1AD8];
  id v7 = a5;
  [(PUPhotoEditTitledNotchButton *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 identifier];

  v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)defaultContentImage
{
  if ([(PUPhotoEditLegacyNotchButton *)self notchButtonType] == 1)
  {
    if (defaultContentImage_onceToken != -1) {
      dispatch_once(&defaultContentImage_onceToken, &__block_literal_global_101);
    }
    v3 = [(PUPhotoEditLegacyNotchButton *)self notchButtonTitle];
    uint64_t v4 = [(PUPhotoEditTitledNotchButton *)self contentImageWithTitle:v3];
    v5 = (void *)defaultContentImage_image;
    defaultContentImage_image = v4;
  }
  else
  {
    [(PUPhotoEditTitledNotchButton *)self metrics];
    v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:v6];
    id v7 = (void *)MEMORY[0x1E4FB1818];
    double v8 = [(PUPhotoEditLegacyNotchButton *)self symbolName];
    uint64_t v9 = [v7 systemImageNamed:v8 withConfiguration:v3];
    double v10 = (void *)defaultContentImage_image;
    defaultContentImage_image = v9;

    double v11 = (void *)defaultContentImage_image;
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v12 = [v11 imageWithTintColor:v5 renderingMode:1];
    double v13 = (void *)defaultContentImage_image;
    defaultContentImage_image = v12;
  }
  double v14 = (void *)defaultContentImage_image;
  return v14;
}

void __51__PUPhotoEditTitledNotchButton_defaultContentImage__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4FB2420];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_106_99442];
}

void __51__PUPhotoEditTitledNotchButton_defaultContentImage__block_invoke_2()
{
  uint64_t v0 = (void *)defaultContentImage_image;
  defaultContentImage_image = 0;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  [(PUPhotoEditLegacyNotchButton *)self _updateContentImage];
}

- (id)contentImageWithTitle:(id)a3
{
  id v4 = a3;
  [(PUPhotoEditTitledNotchButton *)self metrics];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PUPhotoEditTitledNotchButton *)self preferredContentFittingSize];
  double v14 = v13 - v8;
  long long v48 = *MEMORY[0x1E4F1DB30];
  id v47 = 0;
  double v15 = objc_msgSend((id)objc_opt_class(), "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v4, &v48, &v47, v13 - v8, v6, v8, v10, v12);
  id v16 = v47;
  v17 = [(PUPhotoEditTitledNotchButton *)self textColor];

  if (v17)
  {
    if (v16) {
      id v18 = (id)[v16 mutableCopy];
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    double v19 = v18;
    double v20 = [(PUPhotoEditTitledNotchButton *)self textColor];
    [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    id v16 = v19;
  }
  double v21 = *(double *)&v48;
  if (*(double *)&v48 > v14)
  {
    *(double *)&long long v48 = v14;
    double v21 = v14;
  }
  double v22 = *((double *)&v48 + 1);
  long long v46 = v48;
  double v44 = 0.0;
  double v45 = 0.0;
  double v42 = 0.0;
  double v43 = 0.0;
  if (v15 && CTFontGetLanguageAwareOutsets())
  {
    double v23 = v45;
    if (v45 < v43) {
      double v23 = v43;
    }
    double v24 = v44;
    if (v44 < v42) {
      double v24 = v42;
    }
    double v21 = v21 + v23 + v23;
    double v22 = v22 + v24 + v24;
    double v25 = v23 + 0.0;
    double v26 = v24 + 0.0;
  }
  else
  {
    double v42 = 0.0;
    double v43 = 0.0;
    double v44 = 0.0;
    double v45 = 0.0;
    double v26 = 0.0;
    double v25 = 0.0;
  }
  double v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v21, v22);
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __54__PUPhotoEditTitledNotchButton_contentImageWithTitle___block_invoke;
  v36 = &unk_1E5F2DFC8;
  double v39 = v25;
  double v40 = v26;
  long long v41 = v46;
  id v37 = v4;
  id v38 = v16;
  id v28 = v16;
  id v29 = v4;
  double v30 = [v27 imageWithActions:&v33];
  v31 = objc_msgSend(v30, "imageWithAlignmentRectInsets:", v44, v45, v42, v43, v33, v34, v35, v36);

  return v31;
}

uint64_t __54__PUPhotoEditTitledNotchButton_contentImageWithTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 format];
  [v3 scale];
  UIRectIntegralWithScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  return objc_msgSend(v12, "drawWithRect:options:attributes:context:", 1, v13, 0, v5, v7, v9, v11);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4 fallbackSymbolName:(id)a5
{
  double v8 = (__CFString *)a3;
  id v9 = a5;
  if (!a4)
  {
    if (setTitle_forState_fallbackSymbolName__onceToken != -1) {
      dispatch_once(&setTitle_forState_fallbackSymbolName__onceToken, &__block_literal_global_99448);
    }
    if ([(__CFString *)v8 length])
    {
      if (setTitle_forState_fallbackSymbolName__forceFallback)
      {
        uint64_t v10 = 0;
        double v11 = &stru_1F06BE7B8;
LABEL_7:
        id v12 = v9;
LABEL_14:
        [(PUPhotoEditLegacyNotchButton *)self setNotchButtonTitle:v11];
        [(PUPhotoEditLegacyNotchButton *)self setSymbolName:v12];
        [(PUPhotoEditLegacyNotchButton *)self setNotchButtonType:v10];
        [(PUPhotoEditLegacyNotchButton *)self _updateContentImage];
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = [v9 length];
      uint64_t v10 = 0;
      double v11 = &stru_1F06BE7B8;
      if (v13) {
        goto LABEL_7;
      }
      id v12 = v9;
      if (setTitle_forState_fallbackSymbolName__forceFallback) {
        goto LABEL_14;
      }
    }
    id v12 = 0;
    if (v8) {
      double v11 = v8;
    }
    else {
      double v11 = &stru_1F06BE7B8;
    }
    uint64_t v10 = 1;
    goto LABEL_14;
  }
LABEL_15:
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditTitledNotchButton;
  [(PUPhotoEditTitledNotchButton *)&v14 setTitle:&stru_1F06BE7B8 forState:a4];
}

void __69__PUPhotoEditTitledNotchButton_setTitle_forState_fallbackSymbolName___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  setTitle_forState_fallbackSymbolName__forceFallback = [v0 BOOLForKey:@"NSDoubleLocalizedStrings"];
}

- (UIEdgeInsets)alignmentRectInsets
{
  id v3 = [(PUPhotoEditTitledNotchButton *)self configuration];
  [v3 contentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(PUPhotoEditTitledNotchButton *)self effectiveUserInterfaceLayoutDirection];
  if (v12) {
    double v13 = v11;
  }
  else {
    double v13 = v7;
  }
  if (v12) {
    double v14 = v7;
  }
  else {
    double v14 = v11;
  }
  double v15 = v5;
  double v16 = v9;
  result.right = v14;
  result.bottom = v16;
  result.left = v13;
  result.top = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUPhotoEditTitledNotchButton *)self preferredContentFittingSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(PUPhotoEditTitledNotchButton *)self configuration];
  [v10 contentInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  BOOL v19 = width == *MEMORY[0x1E4F1DB30];
  if (height != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    BOOL v19 = 0;
  }
  if (height > v16 + v9 + v12 || v19) {
    double v21 = v16 + v9 + v12;
  }
  else {
    double v21 = height;
  }
  if (width > v18 + v7 + v14) {
    BOOL v19 = 1;
  }
  if (v19) {
    double v22 = v18 + v7 + v14;
  }
  else {
    double v22 = width;
  }
  result.double height = v21;
  result.double width = v22;
  return result;
}

- (void)setFrameFromVisibleFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(PUPhotoEditTitledNotchButton *)self configuration];
  [v8 contentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[PUPhotoEditTitledNotchButton setFrame:](self, "setFrame:", x - v12, y - v10, width + v12 + v16, height + v10 + v14);
}

- (void)setPreferredContentFittingSize:(CGSize)a3
{
  if (a3.width != self->_preferredContentFittingSize.width || a3.height != self->_preferredContentFittingSize.height)
  {
    self->_preferredContentFittingSize = a3;
    [(PUPhotoEditLegacyNotchButton *)self _didInvalidateContentImageMetrics];
    [(PUPhotoEditTitledNotchButton *)self invalidateIntrinsicContentSize];
  }
}

- (PUPhotoEditTitledNotchButtonMetrics)metrics
{
  id v2 = objc_opt_class();
  [v2 defaultMetrics];
  result.var3 = v6;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (PUPhotoEditTitledNotchButton)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditTitledNotchButton;
  double v3 = -[PUPhotoEditLegacyNotchButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    p_preferredContentFittingSize = &v3->_preferredContentFittingSize;
    [(id)objc_opt_class() defaultPreferredContentFittingSize];
    *(void *)&p_preferredContentFittingSize->double width = v6;
    v4->_preferredContentFittingSize.double height = v7;
    double v8 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    double v9 = [MEMORY[0x1E4FB1618] clearColor];
    double v10 = [v8 background];
    [v10 setBackgroundColor:v9];

    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBaseForegroundColor:v11];

    [(PUPhotoEditTitledNotchButton *)v4 setConfiguration:v8];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    [(PUPhotoEditTitledNotchButton *)v4 addInteraction:v12];
    [(PUPhotoEditLegacyNotchButton *)v4 setNotchButtonType:1];
    [(PUPhotoEditTitledNotchButton *)v4 setShowsLargeContentViewer:1];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PUPhotoEditTitledNotchButton *)v4 addInteraction:v13];
  }
  return v4;
}

+ (int64_t)editingTitledButtonType
{
  return 1;
}

+ (id)_bestFontForTitle:(id)a3 inMaximumWidth:(double)a4 withMetrics:(PUPhotoEditTitledNotchButtonMetrics)a5 titleSize:(CGSize *)a6 fontAttributes:(id *)a7
{
  double var3 = a5.var3;
  double var2 = a5.var2;
  v26[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v13 setLineBreakMode:4];
  [v13 setAlignment:0];
  if (var2 < var3)
  {
    double v14 = 0;
    objc_super v15 = 0;
    double v16 = *MEMORY[0x1E4F1DB30];
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (!a6) {
      goto LABEL_9;
    }
LABEL_8:
    a6->double width = v16;
    a6->double height = v17;
    goto LABEL_9;
  }
  double v24 = a7;
  objc_super v15 = 0;
  double v14 = 0;
  double v18 = *MEMORY[0x1E4FB09B8];
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  uint64_t v20 = *MEMORY[0x1E4FB0738];
  do
  {
    double v21 = v14;
    double v22 = v15;
    objc_super v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:", var2, v18, v24);

    v25[0] = v19;
    v25[1] = v20;
    v26[0] = v15;
    v26[1] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

    [v12 sizeWithAttributes:v14];
    if (v16 <= a4) {
      break;
    }
    double var2 = var2 + -1.0;
  }
  while (var2 >= var3);
  a7 = v24;
  if (a6) {
    goto LABEL_8;
  }
LABEL_9:
  if (a7) {
    *a7 = v14;
  }

  return v15;
}

+ (id)bestFontForTitle:(id)a3 fittingInWidth:(double)a4
{
  id v6 = a3;
  [a1 defaultMetrics];
  double v11 = objc_msgSend(a1, "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v6, 0, 0, a4 - v7, v8, v7, v9, v10);

  return v11;
}

+ (CGSize)defaultPreferredContentFittingSize
{
  double v2 = 68.0;
  double v3 = 28.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (PUPhotoEditTitledNotchButtonMetrics)defaultMetrics
{
  double v2 = 60.0;
  double v3 = 10.0;
  double v4 = 15.0;
  double v5 = 9.0;
  result.double var3 = v5;
  result.double var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end