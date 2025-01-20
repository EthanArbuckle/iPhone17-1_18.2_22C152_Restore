@interface PXUIButton
+ (id)buttonWithWithCursorEffect:(int64_t)a3 target:(id)a4 action:(SEL)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_pointerRectForCurrentState;
- (PXUIButton)initWithFrame:(CGRect)a3;
- (PXUIButtonConfiguration)px_configuration;
- (UIPointerInteraction)pointerInteraction;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setPx_configuration:(id)a3;
@end

@implementation PXUIButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_px_configuration, 0);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (PXUIButtonConfiguration)px_configuration
{
  return self->_px_configuration;
}

- (CGRect)_pointerRectForCurrentState
{
  [(PXUIButton *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(PXUIButton *)self state];
  CGFloat v12 = *MEMORY[0x1E4F1DB20];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v16 = [(PXUIButton *)self titleForState:v11];

  if (v16)
  {
    v17 = [(PXUIButton *)self titleLabel];
    [v17 frame];
    CGFloat v12 = v18;
    CGFloat v13 = v19;
    CGFloat v14 = v20;
    CGFloat v15 = v21;
  }
  v32.origin.x = v12;
  v32.origin.y = v13;
  v32.size.width = v14;
  v32.size.height = v15;
  if (CGRectIsNull(v32))
  {
    v22 = [(PXUIButton *)self imageForState:v11];

    if (v22)
    {
      v23 = [(PXUIButton *)self imageView];
      [v23 frame];
      CGFloat v12 = v24;
      CGFloat v13 = v25;
      CGFloat v14 = v26;
      CGFloat v15 = v27;
    }
  }
  v33.origin.x = v12;
  v33.origin.y = v13;
  v33.size.width = v14;
  v33.size.height = v15;
  if (!CGRectIsNull(v33)) {
    PXPointAdd();
  }
  double v28 = v4;
  double v29 = v6;
  double v30 = v8;
  double v31 = v10;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PXUIButton *)self px_configuration];
  uint64_t v9 = [v8 cursorEffect];
  if (v9)
  {
    if (v9 != 1 && v9 != 2)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v12 = [NSString stringWithUTF8String:"Class _ClassForCursorEffect(PXUIButtonCursorEffect)"];
      [v11 handleFailureInFunction:v12 file:@"PXUIButton.m" lineNumber:26 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    objc_opt_class();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  objc_msgSend(v10, "effectWithPreview:", objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D48]), "initWithView:", self));
  objc_claimAutoreleasedReturnValue();
  PXEdgeInsetsMake();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  px_configuration = self->_px_configuration;
  id v6 = a5;
  if ([(PXUIButtonConfiguration *)px_configuration cursorEffect]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXUIButton;
  -[PXUIButton setHighlighted:](&v9, sel_setHighlighted_);
  double v5 = [(PXUIButton *)self px_configuration];
  int v6 = [v5 allowAnimatedHighlighting];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__PXUIButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E5DCFE98;
    v7[4] = self;
    BOOL v8 = a3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.25];
  }
}

uint64_t __29__PXUIButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1 = 0.5;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXUIButton;
  BOOL v5 = -[PXUIButton pointInside:withEvent:](&v7, sel_pointInside_withEvent_, a4);
  [(PXUIButton *)self bounds];
  if (!CGRectIsEmpty(v8))
  {
    [(PXUIButton *)self px_configuration];
    [(id)objc_claimAutoreleasedReturnValue() hitTestOutset];
    sub_1AB23B20C();
  }
  return v5;
}

- (void)setPx_configuration:(id)a3
{
  double v4 = (PXUIButtonConfiguration *)a3;
  px_configuration = self->_px_configuration;
  if (px_configuration != v4)
  {
    id v10 = v4;
    uint64_t v6 = [(PXUIButtonConfiguration *)px_configuration cursorEffect];
    if (v6 != [(PXUIButtonConfiguration *)v10 cursorEffect])
    {
      objc_super v7 = [(PXUIButton *)self pointerInteraction];
      [v7 invalidate];
    }
    CGRect v8 = (PXUIButtonConfiguration *)[(PXUIButtonConfiguration *)v10 copy];
    objc_super v9 = self->_px_configuration;
    self->_px_configuration = v8;

    double v4 = v10;
  }
}

- (PXUIButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXUIButton;
  double v3 = -[PXUIButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = objc_alloc_init(PXUIButtonConfiguration);
    px_configuration = v3->_px_configuration;
    v3->_px_configuration = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v6;

    [(PXUIButton *)v3 addInteraction:v3->_pointerInteraction];
  }
  return v3;
}

+ (id)buttonWithWithCursorEffect:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init((Class)a1);
  id v10 = +[PXUIButtonConfiguration configurationWithCursorEffect:a3];
  objc_msgSend(v9, "setPx_configuration:", v10);

  [v9 addTarget:v8 action:a5 forControlEvents:0x2000];
  return v9;
}

@end