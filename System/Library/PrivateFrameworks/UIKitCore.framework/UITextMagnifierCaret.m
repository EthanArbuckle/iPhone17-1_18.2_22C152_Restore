@interface UITextMagnifierCaret
+ (Class)renderClass;
+ (id)activeCaretMagnifier;
+ (id)sharedCaretMagnifier;
- (BOOL)isHorizontal;
- (BOOL)terminalPointPlacedCarefully;
- (CGPoint)offset;
- (UITextMagnifierCaret)initWithFrame;
- (double)offsetFromMagnificationPoint;
- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7;
- (void)remove;
- (void)setOffset:(CGPoint)a3;
- (void)updateFrameAndOffset;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation UITextMagnifierCaret

+ (id)activeCaretMagnifier
{
  return (id)SharedInstance;
}

+ (id)sharedCaretMagnifier
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v3 = [v2 preferencesActions];
  char v4 = [v3 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v6 = +[UIKeyboardImpl activeInstance];
    v7 = [v6 textInputTraits];
    int v8 = [v7 textLoupeVisibility];

    v9 = (void *)SharedInstance;
    if (!SharedInstance && v8 != 1)
    {
      v10 = [[UITextMagnifierCaret alloc] initWithFrame];
      v11 = (void *)SharedInstance;
      SharedInstance = (uint64_t)v10;

      v9 = (void *)SharedInstance;
    }
    if (v8 == 1) {
      v9 = 0;
    }
    id v5 = v9;
  }
  return v5;
}

+ (Class)renderClass
{
  return (Class)objc_opt_class();
}

- (UITextMagnifierCaret)initWithFrame
{
  v3.receiver = self;
  v3.super_class = (Class)UITextMagnifierCaret;
  return -[UITextMagnifier initWithFrame:](&v3, sel_initWithFrame_, 0.0, 0.0, 127.0, 127.0);
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3 = [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint historyCovers:0.5];
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint distanceCoveredInInterval:0.5];
  return v4 < 10.0 && v3;
}

- (void)zoomUpAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__UITextMagnifierCaret_zoomUpAnimation__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(UITextMagnifier *)self beginZoomUpAnimation:v2 withDuration:0.075];
}

uint64_t __39__UITextMagnifierCaret_zoomUpAnimation__block_invoke(uint64_t a1)
{
  memset(&v9, 0, sizeof(v9));
  [*(id *)(a1 + 32) bounds];
  CGAffineTransformMakeTranslation(&v9, 0.0, (v2 + v3) * 0.5);
  CGAffineTransform v7 = v9;
  CGAffineTransformScale(&v8, &v7, 0.25, 0.25);
  float v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v8;
  return [v4 setTransform:&v6];
}

- (void)zoomDownAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__UITextMagnifierCaret_zoomDownAnimation__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(UITextMagnifier *)self beginZoomDownAnimation:v2 withDuration:0 postponeHandler:0.15];
}

void __41__UITextMagnifierCaret_zoomDownAnimation__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) text];
  double v4 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  CGAffineTransform v7 = [v2 selectedTextRange];
  CGAffineTransform v8 = [v7 start];

  if (v8)
  {
    [v2 caretRectForPosition:v8];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [*(id *)(a1 + 32) superview];
    objc_msgSend(v17, "convertRect:fromView:", *(void *)(*(void *)(a1 + 32) + 408), v10, v12, v14, v16);
    double v19 = v18;
    double v21 = v20;

    v22 = +[UIPeripheralHost sharedInstance];
    objc_msgSend(v22, "offHostPointForPoint:", v19, v21);
  }
  v28.origin.x = v4;
  v28.origin.y = v3;
  v28.size.width = v6;
  v28.size.height = v5;
  if (!CGRectIsEmpty(v28))
  {
    [*(id *)(a1 + 32) frame];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", round(v4 + v6 * 0.5 - v24 * 0.5), round(v3 + v5 * 0.5 - v23 * 0.5));
  }
  CGAffineTransformMakeScale(&v27, 0.00787401575, 0.00787401575);
  v25 = *(void **)(a1 + 32);
  CGAffineTransform v26 = v27;
  [v25 setTransform:&v26];
}

- (void)remove
{
  v3.receiver = self;
  v3.super_class = (Class)UITextMagnifierCaret;
  [(UITextMagnifier *)&v3 remove];
  -[UITextMagnifier setFrame:](self, "setFrame:", 0.0, 0.0, 127.0, 127.0);
}

- (void)updateFrameAndOffset
{
  objc_super v3 = [(UIView *)self superview];
  [(UITextMagnifier *)self magnificationPoint];
  objc_msgSend(v3, "convertPoint:fromView:", self->super._target);
  double v5 = v4;
  double v7 = v6;

  CGAffineTransform v8 = +[UIPeripheralHost sharedInstance];
  objc_msgSend(v8, "offHostPointForPoint:", v5, v7);
  double v10 = v9;
  double v12 = v11;

  [(UIView *)self bounds];
  double v14 = v13;
  double v16 = v15 * 0.5;
  double v17 = v12 + v15 * 0.5;
  double v18 = [(UIView *)self window];
  [v18 safeAreaInsets];
  double v20 = v19;

  if (v17 + -60.0 >= v20 + 75.0) {
    double v21 = 60.0;
  }
  else {
    double v21 = v17 - (v20 + 75.0);
  }
  if (v12 - v21 >= 32.0) {
    double v22 = v21;
  }
  else {
    double v22 = v12 + -32.0;
  }
  if (v22 < 1.0) {
    double v22 = 1.0;
  }
  self->_yOffset = v22;
  [(UITextMagnifierCaret *)self offset];
  double v24 = v10 + v23;
  [(UITextMagnifierCaret *)self offset];
  double v26 = floor(v14 * 0.5);
  double v27 = v14 * 0.5 - v26 + floor(v24);
  double v28 = v16 - v26 + floor(v12 + v25 - v21);
  -[UIView setCenter:](self, "setCenter:", v27, v28);
}

- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  double v10 = a5.y;
  double v11 = a5.x;
  id v14 = a4;
  id v15 = a3;
  double v16 = +[UITextMagnifierRanged sharedRangedMagnifier];
  [v16 stopMagnifying:0];

  -[UITextMagnifierCaret setOffset:](self, "setOffset:", x, y);
  v17.receiver = self;
  v17.super_class = (Class)UITextMagnifierCaret;
  -[UITextMagnifier beginMagnifyingTarget:text:magnificationPoint:offset:animated:](&v17, sel_beginMagnifyingTarget_text_magnificationPoint_offset_animated_, v15, v14, v7, v11, v10, x, y);
}

- (BOOL)isHorizontal
{
  return 1;
}

- (double)offsetFromMagnificationPoint
{
  return self->_yOffset;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end