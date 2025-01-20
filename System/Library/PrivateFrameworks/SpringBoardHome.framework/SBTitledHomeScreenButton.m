@interface SBTitledHomeScreenButton
- (CGSize)preferredContentFittingSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)content;
- (SBTitledHomeScreenButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4 type:(int64_t)a5 content:(id)a6;
- (SBTitledHomeScreenButtonMetrics)metrics;
- (id)contentImageWithTitle:(id)a3;
- (id)defaultContentImage;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)type;
- (void)setContent:(id)a3;
- (void)setMetrics:(SBTitledHomeScreenButtonMetrics *)a3;
- (void)setPreferredContentFittingSize:(CGSize)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SBTitledHomeScreenButton

- (SBTitledHomeScreenButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4 type:(int64_t)a5 content:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SBTitledHomeScreenButton;
  v17 = -[SBHomeScreenButton initWithFrame:backgroundView:](&v37, sel_initWithFrame_backgroundView_, v15, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_type = a5;
    objc_storeStrong((id *)&v17->_content, a6);
    v19 = [v15 layer];
    [v19 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v20 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v21 = [v20 background];
    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [v21 setBackgroundColor:v22];

    [(SBTitledHomeScreenButton *)v18 setConfiguration:v20];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v18];
    [(SBTitledHomeScreenButton *)v18 addInteraction:v23];
    v18->_metrics.minimumButtonWidth = 60.0;
    int v24 = __sb__runningInSpringBoard();
    char v25 = v24;
    if (v24)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v18->_metrics.minimumButtonHeight = 26.0;
        goto LABEL_21;
      }
      if (SBFEffectiveHomeButtonType() != 2)
      {
        v18->_metrics.minimumButtonHeight = 26.0;
        if (v25) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    else
    {
      v6 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v6 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
      {
        v18->_metrics.minimumButtonHeight = 26.0;
        goto LABEL_20;
      }
    }
    int v26 = __sb__runningInSpringBoard();
    char v27 = v26;
    if (v26)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v7 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v28 = 26.0;
    if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      double v28 = 28.0;
    }
    v18->_metrics.minimumButtonHeight = v28;
    if ((v27 & 1) == 0) {

    }
    if (v25)
    {
LABEL_21:
      v18->_metrics.minimumHorizontalPadding = 10.0;
      int v30 = __sb__runningInSpringBoard();
      char v31 = v30;
      if (v30)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          v18->_metrics.baselineToTop = 18.0;
          goto LABEL_39;
        }
        if (SBFEffectiveHomeButtonType() != 2)
        {
          v18->_metrics.baselineToTop = 18.0;
          goto LABEL_37;
        }
      }
      else
      {
        v6 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v6 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
        {
          v18->_metrics.baselineToTop = 18.0;
LABEL_38:

          goto LABEL_39;
        }
      }
      int v32 = __sb__runningInSpringBoard();
      char v33 = v32;
      if (v32)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v7 _referenceBounds];
      }
      BSSizeRoundForScale();
      double v34 = 18.0;
      if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
        double v34 = 19.0;
      }
      v18->_metrics.baselineToTop = v34;
      if ((v33 & 1) == 0) {

      }
LABEL_37:
      if ((v31 & 1) == 0) {
        goto LABEL_38;
      }
LABEL_39:
      *(_OWORD *)&v18->_metrics.preferredTitlePointSize = xmmword_1D81E4EC0;

      goto LABEL_40;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_40:

  return v18;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBTitledHomeScreenButton *)self preferredContentFittingSize];
  double v7 = v6;
  double v9 = v8;
  v10 = [(SBTitledHomeScreenButton *)self configuration];
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

- (id)contentImageWithTitle:(id)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v5 setLineBreakMode:4];
  [v5 setAlignment:0];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  [(SBTitledHomeScreenButton *)self metrics];
  [(SBTitledHomeScreenButton *)self preferredContentFittingSize];
  double v7 = v6 - 0.0;
  double v8 = 0.0;
  double v9 = 0;
  v10 = 0;
  double v11 = *MEMORY[0x1E4FB09B8];
  uint64_t v12 = *MEMORY[0x1E4FB06F8];
  uint64_t v13 = *MEMORY[0x1E4FB0738];
  do
  {
    double v14 = v10;
    double v15 = v9;
    double v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v8 weight:v11];

    v48[0] = v12;
    v48[1] = v13;
    v49[0] = v9;
    v49[1] = v5;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

    [v4 sizeWithAttributes:v10];
    double v18 = v17;
    if (v16 <= v7) {
      break;
    }
    double v8 = v8 + -1.0;
  }
  while (v8 >= *((double *)&v47 + 1));
  double v43 = 0.0;
  double v44 = 0.0;
  if (v16 <= v7) {
    double v7 = v16;
  }
  double v41 = 0.0;
  double v42 = 0.0;
  if (v9 && CTFontGetLanguageAwareOutsets())
  {
    double v19 = v44;
    if (v44 < v42) {
      double v19 = v42;
    }
    double v20 = v43;
    if (v43 < v41) {
      double v20 = v41;
    }
    double v21 = v7 + v19 + v19;
    double v22 = v18 + v20 + v20;
    double v23 = v19 + 0.0;
    double v24 = v20 + 0.0;
  }
  else
  {
    double v41 = 0.0;
    double v42 = 0.0;
    double v43 = 0.0;
    double v44 = 0.0;
    double v24 = 0.0;
    double v23 = 0.0;
    double v22 = v18;
    double v21 = v7;
  }
  char v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v21, v22);
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  char v33 = __50__SBTitledHomeScreenButton_contentImageWithTitle___block_invoke;
  double v34 = &unk_1E6AADFA0;
  double v37 = v23;
  double v38 = v24;
  double v39 = v7;
  double v40 = v18;
  id v35 = v4;
  id v36 = v10;
  id v26 = v10;
  id v27 = v4;
  double v28 = [v25 imageWithActions:&v31];
  double v29 = objc_msgSend(v28, "imageWithAlignmentRectInsets:", v43, v44, v41, v42, v31, v32, v33, v34);

  return v29;
}

uint64_t __50__SBTitledHomeScreenButton_contentImageWithTitle___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 format];
  [v3 scale];
  UIRectIntegralWithScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  return objc_msgSend(v12, "drawWithRect:options:attributes:context:", 1, v13, 0, v5, v7, v9, v11);
}

- (id)defaultContentImage
{
  if ([(SBTitledHomeScreenButton *)self type] == 1)
  {
    if (defaultContentImage_onceToken != -1) {
      dispatch_once(&defaultContentImage_onceToken, &__block_literal_global_10);
    }
    v3 = [(SBTitledHomeScreenButton *)self content];
    uint64_t v4 = [(SBTitledHomeScreenButton *)self contentImageWithTitle:v3];
    double v5 = (void *)defaultContentImage_image;
    defaultContentImage_image = v4;
  }
  else
  {
    [(SBTitledHomeScreenButton *)self metrics];
    v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:0.0];
    double v6 = (void *)MEMORY[0x1E4FB1818];
    double v7 = [(SBTitledHomeScreenButton *)self content];
    uint64_t v8 = [v6 systemImageNamed:v7 withConfiguration:v3];
    double v9 = (void *)defaultContentImage_image;
    defaultContentImage_image = v8;
  }
  double v10 = (void *)defaultContentImage_image;
  return v10;
}

void __47__SBTitledHomeScreenButton_defaultContentImage__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4FB2420];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_16_0];
}

void __47__SBTitledHomeScreenButton_defaultContentImage__block_invoke_2()
{
  uint64_t v0 = (void *)defaultContentImage_image;
  defaultContentImage_image = 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6 = (void *)MEMORY[0x1E4FB1AD8];
  id v7 = a5;
  [(SBTitledHomeScreenButton *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 identifier];

  double v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  double v6 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v5];
  id v7 = self;
  double v8 = v7;
  if (v7)
  {
    double v9 = [(SBTitledHomeScreenButton *)v7 configuration];
    [v9 contentInsets];
    double v25 = v10;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v25 = *MEMORY[0x1E4FB12A8];
    double v14 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v16 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  }
  double v17 = [(SBHomeScreenButton *)v8 backgroundView];
  [v17 _cornerRadius];

  [(SBTitledHomeScreenButton *)v8 frame];
  double v22 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", SBHDirectionalEdgeInsetsInsetRect(-[SBTitledHomeScreenButton effectiveUserInterfaceLayoutDirection](v8, "effectiveUserInterfaceLayoutDirection"), v18, v19, v20, v21, v25, v12, v14, v16));
  double v23 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v22];

  return v23;
}

- (CGSize)preferredContentFittingSize
{
  double width = self->_preferredContentFittingSize.width;
  double height = self->_preferredContentFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentFittingSize:(CGSize)a3
{
  self->_preferredContentFittingSize = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (SBTitledHomeScreenButtonMetrics)metrics
{
  long long v3 = *(_OWORD *)&self[16].minimumTitlePointSize;
  *(_OWORD *)&retstr->minimumButtonWidth = *(_OWORD *)&self[16].baselineToTop;
  *(_OWORD *)&retstr->minimumHorizontalPadding = v3;
  *(_OWORD *)&retstr->preferredTitlePointSize = *(_OWORD *)&self[17].minimumButtonHeight;
  return self;
}

- (void)setMetrics:(SBTitledHomeScreenButtonMetrics *)a3
{
  long long v4 = *(_OWORD *)&a3->minimumHorizontalPadding;
  long long v3 = *(_OWORD *)&a3->preferredTitlePointSize;
  *(_OWORD *)&self->_metrics.minimumButtonWidth = *(_OWORD *)&a3->minimumButtonWidth;
  *(_OWORD *)&self->_metrics.minimumHorizontalPadding = v4;
  *(_OWORD *)&self->_metrics.preferredTitlePointSize = v3;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end