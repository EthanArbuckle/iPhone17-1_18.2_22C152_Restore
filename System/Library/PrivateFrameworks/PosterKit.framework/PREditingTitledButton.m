@interface PREditingTitledButton
+ (CGSize)defaultPreferredContentFittingSize;
+ (NSString)editingTitledButtonSymbolName;
+ (NSString)editingTitledButtonTitle;
+ (PREditingTitledButtonMetrics)defaultMetrics;
+ (id)_bestFontForTitle:(id)a3 inMaximumWidth:(double)a4 withMetrics:(PREditingTitledButtonMetrics)a5 titleSize:(CGSize *)a6 fontAttributes:(id *)a7;
+ (id)bestFontForTitle:(id)a3 fittingInWidth:(double)a4;
+ (id)editingTitledButtonSymbolName:(BOOL)a3;
+ (int64_t)editingTitledButtonType;
- (CGSize)preferredContentFittingSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PREditingTitledButton)initWithFrame:(CGRect)a3;
- (PREditingTitledButtonMetrics)metrics;
- (UIEdgeInsets)alignmentRectInsets;
- (id)contentImageWithTitle:(id)a3;
- (id)defaultContentImage;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setFrameFromVisibleFrame:(CGRect)a3;
- (void)setPreferredContentFittingSize:(CGSize)a3;
@end

@implementation PREditingTitledButton

- (PREditingTitledButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PREditingTitledButton;
  v3 = -[PREditingTitledButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_preferredContentFittingSize = &v3->_preferredContentFittingSize;
    [(id)objc_opt_class() defaultPreferredContentFittingSize];
    *(void *)&p_preferredContentFittingSize->width = v6;
    v4->_preferredContentFittingSize.height = v7;
    v8 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v9 = [v8 background];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v10];

    [(PREditingTitledButton *)v4 setConfiguration:v8];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    [(PREditingTitledButton *)v4 addInteraction:v11];
  }
  return v4;
}

- (PREditingTitledButtonMetrics)metrics
{
  v2 = objc_opt_class();
  [v2 defaultMetrics];
  result.var3 = v6;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (PREditingTitledButtonMetrics)defaultMetrics
{
  double v2 = 60.0;
  double v3 = 10.0;
  double v4 = 15.0;
  double v5 = 9.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setPreferredContentFittingSize:(CGSize)a3
{
  if (a3.width != self->_preferredContentFittingSize.width || a3.height != self->_preferredContentFittingSize.height)
  {
    self->_preferredContentFittingSize = a3;
    [(PREditingButton *)self _didInvalidateContentImageMetrics];
    [(PREditingTitledButton *)self invalidateIntrinsicContentSize];
  }
}

+ (CGSize)defaultPreferredContentFittingSize
{
  double v2 = 68.0;
  double v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFrameFromVisibleFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(PREditingTitledButton *)self configuration];
  [v8 contentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[PREditingTitledButton setFrame:](self, "setFrame:", x - v12, y - v10, width + v12 + v16, height + v10 + v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PREditingTitledButton *)self preferredContentFittingSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(PREditingTitledButton *)self configuration];
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

- (UIEdgeInsets)alignmentRectInsets
{
  double v3 = [(PREditingTitledButton *)self configuration];
  [v3 contentInsets];

  [(PREditingTitledButton *)self effectiveUserInterfaceLayoutDirection];
  PRDirectionalEdgeInsetsGetEdgeInsets();
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)contentImageWithTitle:(id)a3
{
  id v4 = a3;
  [(PREditingTitledButton *)self metrics];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PREditingTitledButton *)self preferredContentFittingSize];
  double v14 = v13 - v8;
  long long v44 = *MEMORY[0x1E4F1DB30];
  id v43 = 0;
  double v15 = objc_msgSend((id)objc_opt_class(), "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v4, &v44, &v43, v13 - v8, v6, v8, v10, v12);
  id v16 = v43;
  double v17 = *(double *)&v44;
  if (*(double *)&v44 > v14)
  {
    *(double *)&long long v44 = v14;
    double v17 = v14;
  }
  double v18 = *((double *)&v44 + 1);
  long long v42 = v44;
  double v40 = 0.0;
  double v41 = 0.0;
  double v38 = 0.0;
  double v39 = 0.0;
  if (v15 && CTFontGetLanguageAwareOutsets())
  {
    double v19 = v41;
    if (v41 < v39) {
      double v19 = v39;
    }
    double v20 = v40;
    if (v40 < v38) {
      double v20 = v38;
    }
    double v17 = v17 + v19 + v19;
    double v18 = v18 + v20 + v20;
    double v21 = v19 + 0.0;
    double v22 = v20 + 0.0;
  }
  else
  {
    double v38 = 0.0;
    double v39 = 0.0;
    double v40 = 0.0;
    double v41 = 0.0;
    double v22 = 0.0;
    double v21 = 0.0;
  }
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v17, v18);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __47__PREditingTitledButton_contentImageWithTitle___block_invoke;
  v32 = &unk_1E54DAFE0;
  double v35 = v21;
  double v36 = v22;
  long long v37 = v42;
  id v33 = v4;
  id v34 = v16;
  id v24 = v16;
  id v25 = v4;
  v26 = [v23 imageWithActions:&v29];
  v27 = objc_msgSend(v26, "imageWithAlignmentRectInsets:", v40, v41, v38, v39, v29, v30, v31, v32);

  return v27;
}

uint64_t __47__PREditingTitledButton_contentImageWithTitle___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 format];
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

+ (id)bestFontForTitle:(id)a3 fittingInWidth:(double)a4
{
  id v6 = a3;
  [a1 defaultMetrics];
  double v11 = objc_msgSend(a1, "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v6, 0, 0, a4 - v7, v8, v7, v9, v10);

  return v11;
}

+ (id)_bestFontForTitle:(id)a3 inMaximumWidth:(double)a4 withMetrics:(PREditingTitledButtonMetrics)a5 titleSize:(CGSize *)a6 fontAttributes:(id *)a7
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
    double v15 = 0;
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
  id v24 = a7;
  double v15 = 0;
  double v14 = 0;
  double v18 = *MEMORY[0x1E4FB09B8];
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  uint64_t v20 = *MEMORY[0x1E4FB0738];
  do
  {
    double v21 = v14;
    double v22 = v15;
    double v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:", var2, v18, v24);

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

+ (int64_t)editingTitledButtonType
{
  return 1;
}

+ (NSString)editingTitledButtonTitle
{
  return (NSString *)&stru_1ED9A3120;
}

+ (NSString)editingTitledButtonSymbolName
{
  return (NSString *)&stru_1ED9A3120;
}

+ (id)editingTitledButtonSymbolName:(BOOL)a3
{
  return &stru_1ED9A3120;
}

- (id)defaultContentImage
{
  if ([(id)objc_opt_class() editingTitledButtonType] == 1)
  {
    if (defaultContentImage_onceToken != -1) {
      dispatch_once(&defaultContentImage_onceToken, &__block_literal_global_10);
    }
    double v3 = [(id)objc_opt_class() editingTitledButtonTitle];
    uint64_t v4 = [(PREditingTitledButton *)self contentImageWithTitle:v3];
    double v5 = (void *)defaultContentImage_image;
    defaultContentImage_image = v4;
  }
  else
  {
    [(PREditingTitledButton *)self metrics];
    double v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:v6];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    double v9 = objc_opt_class();
    if (v7 == v8) {
      objc_msgSend(v9, "editingTitledButtonSymbolName:", -[PREditingTitledButton isSelected](self, "isSelected"));
    }
    else {
    double v5 = [v9 editingTitledButtonSymbolName];
    }
    uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v5 withConfiguration:v3];
    double v11 = (void *)defaultContentImage_image;
    defaultContentImage_image = v10;

    id v12 = (void *)defaultContentImage_image;
    id v13 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v14 = [v12 imageWithTintColor:v13 renderingMode:1];
    double v15 = (void *)defaultContentImage_image;
    defaultContentImage_image = v14;
  }
  double v16 = (void *)defaultContentImage_image;
  return v16;
}

void __44__PREditingTitledButton_defaultContentImage__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4FB2420];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_113];
}

void __44__PREditingTitledButton_defaultContentImage__block_invoke_2()
{
  uint64_t v0 = (void *)defaultContentImage_image;
  defaultContentImage_image = 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6 = (void *)MEMORY[0x1E4FB1AD8];
  id v7 = a5;
  [(PREditingTitledButton *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 identifier];

  CGFloat v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  int64_t v5 = [(PREditingButton *)self style];
  if ((unint64_t)(v5 - 1) < 2)
  {
    uint64_t v6 = [(PREditingButton *)self backgroundColorView];
LABEL_5:
    id v7 = (void *)v6;
    goto LABEL_7;
  }
  if (!v5)
  {
    uint64_t v6 = [(PREditingButton *)self backgroundView];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:
  double v8 = self;
  double v9 = v8;
  if (v8)
  {
    double v10 = [(PREditingTitledButton *)v8 configuration];
    [v10 contentInsets];
    double v29 = v11;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v13 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v29 = *MEMORY[0x1E4FB12A8];
    double v15 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v17 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  }
  [v7 _cornerRadius];
  [(PREditingTitledButton *)v9 bounds];
  double v22 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithPillRect:cornerRadius:", PRDirectionalEdgeInsetsInsetRect(-[PREditingTitledButton effectiveUserInterfaceLayoutDirection](v9, "effectiveUserInterfaceLayoutDirection"), v18, v19, v20, v21, v29, v13, v15, v17));
  id v23 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [v23 setShadowPath:v22];
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v23];
  id v25 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v24];
  v26 = [MEMORY[0x1E4FB1AE0] shapeWithPath:v22];
  v27 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v25 shape:v26];

  return v27;
}

- (CGSize)preferredContentFittingSize
{
  double width = self->_preferredContentFittingSize.width;
  double height = self->_preferredContentFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end