@interface UITextMagnifierRanged
+ (Class)renderClass;
+ (id)activeRangedMagnifier;
+ (id)sharedRangedMagnifier;
- (BOOL)isHorizontal;
- (BOOL)terminalPointPlacedCarefully;
- (BOOL)wasPlacedCarefullyAtTime:(double)a3;
- (CGPoint)adjustMagnificationPoint:(CGPoint)a3;
- (CGPoint)clipPoint:(CGPoint)a3 inRect:(CGRect)a4;
- (CGRect)caretRectClosestToPoint:(CGPoint)a3;
- (UITextMagnifierRanged)initWithFrame;
- (double)offsetFromMagnificationPoint;
- (int)horizontalMovement;
- (int)horizontalMovementAtTime:(double)a3;
- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7;
- (void)setIsHorizontal:(BOOL)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrameAndOffset;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation UITextMagnifierRanged

+ (id)activeRangedMagnifier
{
  return (id)SharedInstance_0;
}

+ (id)sharedRangedMagnifier
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
    v6 = (void *)SharedInstance_0;
    if (!SharedInstance_0)
    {
      v7 = [[UITextMagnifierRanged alloc] initWithFrame];
      v8 = (void *)SharedInstance_0;
      SharedInstance_0 = (uint64_t)v7;

      v6 = (void *)SharedInstance_0;
    }
    id v5 = v6;
  }
  return v5;
}

+ (Class)renderClass
{
  return (Class)objc_opt_class();
}

- (UITextMagnifierRanged)initWithFrame
{
  v6.receiver = self;
  v6.super_class = (Class)UITextMagnifierRanged;
  v2 = -[UITextMagnifier initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 139.0, 55.0);
  v3 = v2;
  if (v2)
  {
    v2->_isHorizontal = 1;
    v2->_isAnimating = 0;
    v2->_delayedAnimationType = 0;
    char v4 = v2;
  }

  return v3;
}

- (void)setIsHorizontal:(BOOL)a3
{
  self->_isHorizontal = a3;
  if (!self->_isAnimating) {
    [(UITextMagnifierRanged *)self updateFrameAndOffset];
  }
  [(UIView *)self->super._magnifierRenderer update];
  autoscrollRenderer = self->super._autoscrollRenderer;
  [(UIView *)autoscrollRenderer update];
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)UITextMagnifierRanged;
  -[UITextMagnifier setMagnificationPoint:](&v6, sel_setMagnificationPoint_);
  -[UITextMagnifier setAnimationPoint:](self, "setAnimationPoint:", x, y);
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3 = [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint historyCovers:0.2];
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint distanceCoveredInInterval:0.2];
  return v4 < 20.0 && v3;
}

- (int)horizontalMovementAtTime:(double)a3
{
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint distanceCoveredInInterval:3.40282347e38];
  float v5 = v4;
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint displacementInInterval:0.5];
  double v7 = fabs(v6);
  double v9 = fabs(v8) * 4.0;
  BOOL v10 = v7 >= 16.0 && v9 <= v7;
  if (v10 && v7 * 1.5 >= v5) {
    return (int)v6;
  }
  else {
    return 0;
  }
}

- (BOOL)wasPlacedCarefullyAtTime:(double)a3
{
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint distanceCoveredInInterval:0.5 priorTo:a3];
  return v3 < 10.0;
}

- (int)horizontalMovement
{
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint distanceCoveredInInterval:3.40282347e38];
  float v4 = v3;
  [(UITextMagnifierTimeWeightedPoint *)self->super._weightedPoint displacementInInterval:0.5];
  double v6 = fabs(v5);
  double v8 = fabs(v7) * 4.0;
  BOOL v9 = v6 >= 16.0 && v8 <= v6;
  if (v9 && v6 * 1.5 >= v4) {
    return (int)v5;
  }
  else {
    return 0;
  }
}

- (void)zoomUpAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__UITextMagnifierRanged_zoomUpAnimation__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(UITextMagnifier *)self beginZoomUpAnimation:v2 withDuration:0.1];
}

uint64_t __40__UITextMagnifierRanged_zoomUpAnimation__block_invoke(uint64_t a1)
{
  memset(&v15, 0, sizeof(v15));
  v2 = *(unsigned __int8 **)(a1 + 32);
  int v3 = v2[536];
  [v2 bounds];
  double v6 = (v4 + v5) * 0.5;
  double v9 = (v7 + v8) * 0.5;
  if (v3) {
    double v6 = 0.0;
  }
  else {
    double v9 = 0.0;
  }
  CGAffineTransformMakeTranslation(&v15, v6, v9);
  CGAffineTransform v13 = v15;
  CGAffineTransformScale(&v14, &v13, 0.25, 0.25);
  BOOL v10 = *(void **)(a1 + 32);
  CGAffineTransform v12 = v14;
  [v10 setTransform:&v12];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)zoomDownAnimation
{
  [(UITextMagnifier *)self animationPoint];
  if (self->_isHorizontal) {
    double v4 = v4 + 8.0;
  }
  else {
    double v3 = v3 + 8.0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke;
  v6[3] = &unk_1E52DD178;
  v6[4] = self;
  *(double *)&v6[5] = v3;
  *(double *)&v6[6] = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke_2;
  v5[3] = &unk_1E52DD178;
  v5[4] = self;
  *(double *)&v5[5] = v3;
  *(double *)&v5[6] = v4;
  [(UITextMagnifier *)self beginZoomDownAnimation:v6 withDuration:v5 postponeHandler:0.2];
}

uint64_t __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 416) = *(_OWORD *)(a1 + 40);
  [*(id *)(a1 + 32) updateFrameAndOffset];
  memset(&v13, 0, sizeof(v13));
  v2 = *(unsigned __int8 **)(a1 + 32);
  int v3 = v2[536];
  [v2 bounds];
  double v6 = (v4 + v5) * 0.5;
  double v9 = (v7 + v8) * 0.5;
  if (v3) {
    double v6 = 0.0;
  }
  else {
    double v9 = 0.0;
  }
  CGAffineTransformMakeTranslation(&v13, v6, v9);
  CGAffineTransform v11 = v13;
  CGAffineTransformScale(&v12, &v11, 0.25, 0.25);
  CGAffineTransform v13 = v12;
  [*(id *)(a1 + 32) setTransform:&v12];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = v2 + 69;
  id v6 = [v2 superview];
  objc_msgSend(v6, "convertPoint:fromView:", *(void *)(*(void *)(a1 + 32) + 408), *(double *)(a1 + 40), *(double *)(a1 + 48));
  void *v3 = v4;
  v3[1] = v5;
}

- (double)offsetFromMagnificationPoint
{
  return self->_magnifierOffsetFromTouch + self->_touchOffsetFromMagnificationPoint;
}

- (void)updateFrameAndOffset
{
  if (self->_isHorizontal) {
    double v3 = 139.0;
  }
  else {
    double v3 = 55.0;
  }
  if (self->_isHorizontal) {
    double v4 = 55.0;
  }
  else {
    double v4 = 139.0;
  }
  -[UIView setSize:](self, "setSize:", v3, v4);
  if (self->super._target)
  {
    uint64_t v5 = [(UIView *)self superview];
    [(UITextMagnifier *)self magnificationPoint];
    objc_msgSend(v5, "convertPoint:fromView:", self->super._target);
    double x = v6;
    double y = v8;
  }
  else
  {
    double x = self->_delayedAnimationPoint.x;
    double y = self->_delayedAnimationPoint.y;
  }
  BOOL v10 = +[UIPeripheralHost sharedInstance];
  objc_msgSend(v10, "offHostPointForPoint:", x, y);
  double v12 = v11;
  double v14 = v13;

  BOOL isHorizontal = self->_isHorizontal;
  [(UIView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  self->_magnifierOffsetFromTouch = 48.0;
  [(UITextMagnifierRanged *)self offsetFromMagnificationPoint];
  if (isHorizontal)
  {
    double v21 = v4 + v20 - (v14 + v19 * 0.5);
    if (v21 > 0.0) {
      self->_magnifierOffsetFromTouch = self->_magnifierOffsetFromTouch - v21;
    }
    [(UITextMagnifierRanged *)self offsetFromMagnificationPoint];
    double v14 = v14 - v22;
  }
  else
  {
    double v23 = v3 + v20 - (v12 + v17 * 0.5);
    if (v23 > 0.0) {
      self->_magnifierOffsetFromTouch = self->_magnifierOffsetFromTouch - v23;
    }
    [(UITextMagnifierRanged *)self offsetFromMagnificationPoint];
    double v12 = v12 - v24;
  }
  if (fabs(round(v12) + 0.5) != INFINITY && fabs(round(v14) + 0.5) != INFINITY)
  {
    -[UIView setCenter:](self, "setCenter:");
  }
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
  double v16 = +[UITextMagnifierCaret sharedCaretMagnifier];
  [v16 stopMagnifying:0];

  double v17 = round(y);
  if (v17 < 0.0) {
    double v17 = 0.0;
  }
  self->_touchOffsetFromMagnificationPoint = v17;
  v18.receiver = self;
  v18.super_class = (Class)UITextMagnifierRanged;
  -[UITextMagnifier beginMagnifyingTarget:text:magnificationPoint:offset:animated:](&v18, sel_beginMagnifyingTarget_text_magnificationPoint_offset_animated_, v15, v14, v7, v11, v10, x, y);
}

- (void)stopMagnifying:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextMagnifierRanged;
  [(UITextMagnifier *)&v4 stopMagnifying:a3];
  self->_touchOffsetFromMagnificationPoint = 0.0;
}

- (CGPoint)clipPoint:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  if (a3.x >= CGRectGetMinX(a4))
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    if (v9 <= CGRectGetMaxX(v16)) {
      goto LABEL_6;
    }
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v17);
  }
  else
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double MaxX = CGRectGetMinX(v15);
  }
  double v9 = MaxX;
LABEL_6:
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  if (v8 < CGRectGetMinY(v18))
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v19);
LABEL_10:
    double v8 = MinY;
    goto LABEL_11;
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (v8 > CGRectGetMaxY(v20))
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double MinY = CGRectGetMaxY(v21);
    goto LABEL_10;
  }
LABEL_11:
  double v12 = v9;
  double v13 = v8;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (CGRect)caretRectClosestToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextMagnifier *)self text];
  double v8 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  int v11 = [v6 _usesAsynchronousProtocol];
  double v12 = [v6 selectedTextRange];
  double v13 = v12;
  if (!v11)
  {
    if (v12)
    {
      v31 = [v6 selectedTextRange];
      v32 = objc_msgSend(v6, "closestPositionToPoint:withinRange:", v31, x, y);

      if (!v32)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v32 = objc_msgSend(v6, "closestPositionToPoint:", x, y);
      if (!v32) {
        goto LABEL_14;
      }
    }
    [v6 caretRectForPosition:v32];
    double v8 = v33;
    double v7 = v34;
    double v9 = v35;
    double v10 = v36;
    goto LABEL_14;
  }
  double v41 = v10;
  double v42 = v9;
  double v43 = v7;
  double v44 = v8;
  id v14 = [v12 start];
  [v6 caretRectForPosition:v14];
  double v8 = v15;
  double v7 = v16;
  double v45 = v18;
  double v46 = v17;

  CGRect v19 = [v6 selectedTextRange];
  CGRect v20 = [v19 end];
  [v6 caretRectForPosition:v20];
  double v22 = v21;
  double v24 = v23;
  double v9 = v25;
  double v10 = v26;

  double v27 = vabdd_f64(v8, x);
  double v28 = v22 - x;
  double v29 = vabdd_f64(v7, y);
  if (self->_isHorizontal)
  {
    double v28 = v24 - y;
    double v27 = v29;
  }
  BOOL v30 = v27 < fabs(v28);
  if (v30)
  {
    double v9 = v46;
    double v10 = v45;
  }
  else
  {
    double v7 = v24;
  }
  if (!v30) {
    double v8 = v22;
  }
  v47.origin.double x = v8;
  v47.origin.double y = v7;
  v47.size.CGFloat width = v9;
  v47.size.CGFloat height = v10;
  if (CGRectIsEmpty(v47))
  {
    double v10 = v41;
    double v9 = v42;
    double v7 = v43;
    double v8 = v44;
  }
LABEL_15:

  double v37 = v8;
  double v38 = v7;
  double v39 = v9;
  double v40 = v10;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (CGPoint)adjustMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextMagnifier *)self text];
  double v7 = [v6 textInputView];

  objc_msgSend(v7, "convertPoint:fromView:", self->super._target, x, y);
  double v9 = v8;
  double v11 = v10;
  if (v7)
  {
    [v7 bounds];
    -[UITextMagnifierRanged clipPoint:inRect:](self, "clipPoint:inRect:", v9, v11, v12, v13, v14, v15);
    double v9 = v16;
    double v11 = v17;
  }
  -[UITextMagnifierRanged caretRectClosestToPoint:](self, "caretRectClosestToPoint:", v9, v11);
  double v18 = v29.origin.x;
  double v19 = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  if (!CGRectIsNull(v29))
  {
    if (self->_isHorizontal) {
      double v11 = round(v19 + height / 1.3);
    }
    else {
      double v9 = round(v18 + width / 1.3);
    }
  }
  objc_msgSend(v7, "convertPoint:toView:", self->super._target, v9, v11);
  double v23 = v22;
  double v25 = v24;

  double v26 = v23;
  double v27 = v25;
  result.double y = v27;
  result.double x = v26;
  return result;
}

- (BOOL)isHorizontal
{
  return self->_isHorizontal;
}

@end