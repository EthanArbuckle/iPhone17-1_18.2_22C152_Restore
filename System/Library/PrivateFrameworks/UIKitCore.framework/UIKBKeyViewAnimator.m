@interface UIKBKeyViewAnimator
+ (id)normalizedAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5;
+ (id)normalizedUnwindAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 offset:(double)a6;
+ (id)normalizedUnwindAnimationWithKeyPath:(id)a3 originallyFromValue:(id)a4 toValue:(id)a5 offset:(double)a6;
+ (id)normalizedUnwindOpacityAnimationWithKeyPath:(id)a3 originallyFromValue:(id)a4 toValue:(id)a5 offset:(double)a6;
- (BOOL)disabled;
- (BOOL)shouldAssertCurrentKeyState:(id)a3;
- (BOOL)shouldPurgeKeyViews;
- (BOOL)shouldTransitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5;
- (CGRect)primaryGlyphNormalizedExitRect;
- (CGRect)secondaryGlyphNormalizedExitRect;
- (Class)_keyViewClassForSpecialtyKey:(id)a3 screenTraits:(id)a4;
- (Class)keyViewClassForKey:(id)a3 renderTraits:(id)a4 screenTraits:(id)a5;
- (double)delayedDeactivationTimeForKeyView:(id)a3;
- (double)keyScale;
- (id)keycapAlternateDualStringTransform:(id)a3;
- (id)keycapAlternateTransform:(id)a3;
- (id)keycapLeftSelectPrimaryTransform;
- (id)keycapLeftSelectRightTransform;
- (id)keycapLeftTransform;
- (id)keycapMeshTransformFromRect:(CGRect)a3 toRect:(CGRect)a4;
- (id)keycapMeshTransformFromRect:(CGRect)a3 toRect:(CGRect)a4 scale:(double)a5;
- (id)keycapNullTransform;
- (id)keycapPrimaryDualStringTransform:(id)a3;
- (id)keycapPrimaryExitTransform;
- (id)keycapPrimaryTransform;
- (id)keycapRightSelectLeftTransform;
- (id)keycapRightSelectPrimaryTransform;
- (id)keycapRightTransform;
- (id)primaryReverseTransform;
- (void)_fadeInKeyView:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)_fadeOutKeyView:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)endTransitionForKeyView:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setKeyScale:(double)a3;
- (void)transitionEndedForKeyView:(id)a3 alternateCount:(unint64_t)a4;
- (void)transitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6;
- (void)transitionOutKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6;
- (void)transitionStartedForKeyView:(id)a3 alternateCount:(unint64_t)a4 toLeft:(BOOL)a5;
- (void)updateTransitionForKeyView:(id)a3 normalizedDragSize:(CGSize)a4;
@end

@implementation UIKBKeyViewAnimator

- (BOOL)shouldPurgeKeyViews
{
  return 0;
}

- (Class)_keyViewClassForSpecialtyKey:(id)a3 screenTraits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 displayType];
  v8 = 0;
  if (v7 > 35)
  {
    if (v7 == 36)
    {
      if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled]&& !_UIApplicationIsStickerPickerService())
      {
        if (v6)
        {
          uint64_t v12 = [v6 idiom];
        }
        else
        {
          v14 = +[UIDevice currentDevice];
          uint64_t v12 = [v14 userInterfaceIdiom];
        }
        uint64_t v10 = +[UIKeyboardEmojiKeyDisplayController classForInputView:v12];
        goto LABEL_16;
      }
    }
    else
    {
      if (v7 != 37) {
        goto LABEL_17;
      }
      if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled])
      {
        if (v6)
        {
          uint64_t v9 = [v6 idiom];
        }
        else
        {
          v13 = +[UIDevice currentDevice];
          uint64_t v9 = [v13 userInterfaceIdiom];
        }
        uint64_t v10 = +[UIKeyboardEmojiKeyDisplayController classForCategoryControl:v9];
        goto LABEL_16;
      }
    }
  }
  else if (v7 == 1)
  {
    [v5 rendering];
  }
  else if (v7 != 12)
  {
    goto LABEL_17;
  }
  uint64_t v10 = objc_opt_class();
LABEL_16:
  v8 = (void *)v10;
LABEL_17:

  return (Class)v8;
}

- (Class)keyViewClassForKey:(id)a3 renderTraits:(id)a4 screenTraits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 blendForm] == 3) {
    int v11 = [v9 controlOpacities] ^ 1;
  }
  else {
    int v11 = 0;
  }
  if (([v9 blurBlending] & 1) != 0
    || ([v9 variantTraits],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 blurBlending] | v11,
        v12,
        v13 == 1)
    || (Class v17 = [(UIKBKeyViewAnimator *)self _keyViewClassForSpecialtyKey:v8 screenTraits:v10]) == 0)
  {
    objc_opt_class();
    v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v17;
  }
  v15 = v14;

  return v15;
}

- (double)delayedDeactivationTimeForKeyView:(id)a3
{
  id v3 = a3;
  v4 = [v3 key];
  if ([v4 displayTypeHint] == 10)
  {
    id v5 = [v3 layerForRenderFlags:4];
    id v6 = [v5 animationForKey:@"pan opacity"];

    if (v6)
    {
      [v3 endingTransitionDuration];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.059;
    }
  }
  else
  {
    double v8 = 0.059;
  }

  return v8;
}

- (void)_fadeOutKeyView:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke;
  aBlock[3] = &unk_1E52E8040;
  id v9 = v7;
  id v20 = v9;
  uint64_t v21 = 0;
  BOOL v22 = a4 > 0.0;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke_2;
  v14[3] = &unk_1E52F9EE0;
  id v11 = v9;
  id v15 = v11;
  uint64_t v17 = 0;
  id v12 = v8;
  id v16 = v12;
  BOOL v18 = a4 > 0.0;
  int v13 = (void (**)(void *, uint64_t))_Block_copy(v14);
  if (a4 == 0.0)
  {
    v10[2](v10);
    v13[2](v13, 1);
  }
  else
  {
    +[UIView animateWithDuration:50331648 delay:v10 options:v13 animations:a4 completion:0.0];
  }
}

void __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) popupMenu];
    int v3 = [v2 isVisible];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) popupMenu];
      [v4 setAlpha:0.0];
    }
  }
}

void __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEndingTransitionDuration:0.0];
  [*(id *)(a1 + 32) alpha];
  if (fabs(v2) == fabs(*(double *)(a1 + 48)))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) popupMenu];
    [v4 alpha];
    double v6 = v5;

    if (v6 == 0.0)
    {
      id v7 = [*(id *)(a1 + 32) popupMenu];
      [v7 setAlpha:1.0];

      id v8 = [*(id *)(a1 + 32) popupMenu];
      [v8 hide];
    }
  }
}

- (void)_fadeInKeyView:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  [v7 setAlpha:0.0];
  if (a4 <= 0.0)
  {
    [v7 setAlpha:1.0];
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke;
    v11[3] = &unk_1E52D9F70;
    id v12 = v7;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke_2;
    v9[3] = &unk_1E52D9FE8;
    id v10 = v8;
    +[UIView animateWithDuration:50331648 delay:v11 options:v9 animations:a4 completion:0.0];
  }
}

uint64_t __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (CGRect)primaryGlyphNormalizedExitRect
{
  double v2 = 0.89;
  double v3 = 0.5;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v2;
  result.origin.x = v3;
  return result;
}

- (CGRect)secondaryGlyphNormalizedExitRect
{
  double v2 = 0.13;
  double v3 = 0.5;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v2;
  result.origin.x = v3;
  return result;
}

- (id)keycapMeshTransformFromRect:(CGRect)a3 toRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  [(UIKBKeyViewAnimator *)self keyScale];
  double v14 = v13;
  double v15 = 2.0;
  if (v14 > 0.0) {
    [(UIKBKeyViewAnimator *)self keyScale];
  }
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", v11, v10, v9, v8, x, y, width, height, *(void *)&v15);
}

- (id)keycapMeshTransformFromRect:(CGRect)a3 toRect:(CGRect)a4 scale:(double)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a5 != 1.0)
  {
    double v5 = (a5 + -1.0) * 0.5;
    a3.origin.CGFloat x = 1.0 / a5 * (a3.origin.x + v5);
    a3.origin.CGFloat y = 1.0 / a5 * (a3.origin.y + v5);
    a3.size.double width = a3.size.width * (1.0 / a5);
    a3.size.double height = a3.size.height * (1.0 / a5);
    a4.origin.CGFloat x = 1.0 / a5 * (a4.origin.x + v5);
    a4.origin.CGFloat y = 1.0 / a5 * (a4.origin.y + v5);
    a4.size.double width = a4.size.width * (1.0 / a5);
    a4.size.double height = a4.size.height * (1.0 / a5);
  }
  memset(v13, 0, 32);
  v13[2] = xmmword_186B943D0;
  v13[3] = xmmword_186B89740;
  __asm { FMOV            V17.2D, #1.0 }
  v13[4] = xmmword_186B943E0;
  v13[5] = _Q17;
  v13[6] = _Q17;
  v13[7] = xmmword_186B999C0;
  v13[8] = xmmword_186B8C800;
  v13[9] = xmmword_186B86ED0;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  CGFloat v16 = a4.origin.x;
  CGFloat v17 = a4.origin.y;
  uint64_t v18 = 0x3FE0000000000000;
  double v19 = a3.origin.x + a3.size.width;
  CGFloat v20 = a3.origin.y;
  double v21 = a4.origin.x + a4.size.width;
  CGFloat v22 = a4.origin.y;
  uint64_t v23 = 0x3FE0000000000000;
  double v24 = a3.origin.x + a3.size.width;
  double v25 = a3.origin.y + a3.size.height;
  double v26 = a4.origin.x + a4.size.width;
  double v27 = a4.origin.y + a4.size.height;
  uint64_t v28 = 0x3FE0000000000000;
  CGFloat v29 = a3.origin.x;
  double v30 = a3.origin.y + a3.size.height;
  CGFloat v31 = a4.origin.x;
  double v32 = a4.origin.y + a4.size.height;
  uint64_t v33 = 0x3FE0000000000000;
  long long v34 = xmmword_186B999D0;
  int32x4_t v35 = vdupq_n_s32(0x7F7FFFFFu);
  long long v36 = xmmword_186B999E0;
  int32x4_t v37 = v35;
  long long v38 = xmmword_186B999F0;
  int32x4_t v39 = v35;
  long long v40 = xmmword_186B99A00;
  int32x4_t v41 = v35;
  long long v42 = xmmword_186B99A10;
  int32x4_t v43 = v35;
  double v11 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:8 vertices:v13 faceCount:5 faces:&v34 depthNormalization:*MEMORY[0x1E4F39ED8]];
  return v11;
}

- (id)keycapNullTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.28, 0.77, 0.44);
}

- (id)keycapPrimaryTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.45, 0.77, 0.44);
}

- (id)keycapPrimaryDualStringTransform:(id)a3
{
  id v4 = a3;
  double v5 = [v4 keyplane];
  uint64_t v6 = [v5 visualStyling] & 0x3F;

  if (v6 == 23)
  {
    id v7 = [v4 factory];
    double v8 = [v4 key];
    double v9 = [v4 keyplane];
    [v7 dualStringKeyBottomTextOffset:v8 keyplane:v9];
    double v11 = v10;
    double v13 = v12;

    double v14 = [v4 key];
    [v14 frame];
    double v16 = v11 / v15 + 0.115;

    CGFloat v17 = [v4 key];
    [v17 frame];
    double v19 = v13 / v18 + 0.28;

    uint64_t v20 = -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, v16, v19, 0.77, 0.44);
  }
  else
  {
    int v21 = [v4 isDynamicKey];
    double v22 = 2.0;
    if (v21) {
      double v22 = 1.0;
    }
    uint64_t v20 = -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.38, 0.77, 0.44, *(void *)&v22);
  }
  uint64_t v23 = (void *)v20;

  return v23;
}

- (id)keycapAlternateTransform:(id)a3
{
  id v4 = a3;
  double v5 = [v4 key];
  uint64_t v6 = [v5 secondaryDisplayStrings];
  id v7 = [v6 firstObject];
  double v8 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  BOOL v9 = [v7 rangeOfCharacterFromSet:v8] == 0x7FFFFFFFFFFFFFFFLL;

  double v10 = dbl_186B99A20[v9];
  LODWORD(v5) = [v4 isDynamicKey];

  double v11 = 2.0;
  if (v5) {
    double v11 = 1.0;
  }
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, 0.25, 0.13, 0.5, v10, *(void *)&v11);
}

- (id)keycapAlternateDualStringTransform:(id)a3
{
  id v4 = a3;
  double v5 = [v4 keyplane];
  uint64_t v6 = [v5 visualStyling] & 0x3F;

  if (v6 == 23)
  {
    id v7 = [v4 factory];
    double v8 = [v4 key];
    BOOL v9 = [v4 keyplane];
    [v7 dualStringKeyTopTextOffset:v8 keyplane:v9];
    double v11 = v10;
    double v13 = v12;

    double v14 = [v4 key];
    [v14 frame];
    double v16 = v11 / v15 + 0.115;

    CGFloat v17 = [v4 key];
    [v17 frame];
    double v19 = v13 / v18 + 0.28;

    uint64_t v20 = -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, v16, v19, 0.77, 0.44);
  }
  else
  {
    int v21 = [v4 isDynamicKey];
    double v22 = 2.0;
    if (v21) {
      double v22 = 1.0;
    }
    uint64_t v20 = -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.135, 0.77, 0.44, *(void *)&v22);
  }
  uint64_t v23 = (void *)v20;

  return v23;
}

- (id)primaryReverseTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0x3FF0000000000000);
}

- (id)keycapLeftTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, -0.065, 0.13, 0.65, 0.286);
}

- (id)keycapRightTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.415, 0.13, 0.65, 0.286);
}

- (id)keycapPrimaryExitTransform
{
  [(UIKBKeyViewAnimator *)self primaryGlyphNormalizedExitRect];
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, v3, v4, v5, v6);
}

- (id)keycapLeftSelectPrimaryTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.218, 0.7, 1.0, 0.44);
}

- (id)keycapLeftSelectRightTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.879, 0.21, 0.65, 0.286);
}

- (id)keycapRightSelectPrimaryTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, -0.218, 0.7, 1.0, 0.44);
}

- (id)keycapRightSelectLeftTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, -0.529, 0.21, 0.65, 0.286);
}

+ (id)normalizedAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F39B48];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v7 animationWithKeyPath:v10];
  [v11 setBeginTime:1.0e-100];
  LODWORD(v7) = [v10 isEqualToString:@"opacity"];

  double v12 = 0.4;
  if (!v7) {
    double v12 = 1.0;
  }
  [v11 setDuration:v12];
  [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v11 setRemovedOnCompletion:0];
  [v11 setFromValue:v9];

  [v11 setToValue:v8];
  return v11;
}

+ (id)normalizedUnwindAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 offset:(double)a6
{
  id v9 = (void *)MEMORY[0x1E4F39B48];
  id v10 = a5;
  id v11 = a4;
  double v12 = [v9 animationWithKeyPath:a3];
  [v12 setTimeOffset:(1.0 - a6) * 0.150000006];
  [v12 setDuration:0.150000006];
  [v12 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v12 setRemovedOnCompletion:1];
  [v12 setFromValue:v11];

  [v12 setToValue:v10];
  return v12;
}

+ (id)normalizedUnwindOpacityAnimationWithKeyPath:(id)a3 originallyFromValue:(id)a4 toValue:(id)a5 offset:(double)a6
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F39BD8];
  id v10 = a5;
  id v11 = a4;
  double v12 = [v9 animationWithKeyPath:a3];
  v18[0] = v10;
  v18[1] = v10;
  v18[2] = v11;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [v12 setValues:v13];

  [v12 setKeyTimes:&unk_1ED3F00D0];
  double v14 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  v17[0] = v14;
  v17[1] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  [v12 setTimingFunctions:v15];
  [v12 setTimeOffset:(1.0 - a6) * 0.200000003];
  [v12 setDuration:0.200000003];
  [v12 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v12 setRemovedOnCompletion:1];

  return v12;
}

+ (id)normalizedUnwindAnimationWithKeyPath:(id)a3 originallyFromValue:(id)a4 toValue:(id)a5 offset:(double)a6
{
  id v9 = (void *)MEMORY[0x1E4F39B48];
  id v10 = a5;
  id v11 = a4;
  double v12 = [v9 animationWithKeyPath:a3];
  double v13 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v12 setTimingFunction:v13];

  [v12 setTimeOffset:(1.0 - a6) * 0.200000003];
  [v12 setDuration:0.200000003];
  [v12 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v12 setRemovedOnCompletion:1];
  [v12 setFromValue:v10];

  [v12 setToValue:v11];
  return v12;
}

- (BOOL)shouldAssertCurrentKeyState:(id)a3
{
  return 0;
}

- (BOOL)shouldTransitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5
{
  return 1;
}

- (void)transitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  id v37 = a3;
  id v10 = (void (**)(id, uint64_t))a6;
  id v11 = [v37 key];
  int v12 = [v37 isDynamicKey];
  double v13 = 2.0;
  if (v12) {
    double v13 = 1.0;
  }
  [(UIKBKeyViewAnimator *)self setKeyScale:v13];
  if ([v11 displayTypeHint] == 10)
  {
    int v14 = [v11 displayType];
    if (a4 != 4 && a5 == 4)
    {
      int v15 = v14;
      double v16 = [v37 layerForRenderFlags:4];
      if (v15 == 7) {
        [(UIKBKeyViewAnimator *)self keycapPrimaryDualStringTransform:v37];
      }
      else {
      CGFloat v17 = [(UIKBKeyViewAnimator *)self keycapPrimaryTransform];
      }
      [v16 setMeshTransform:v17];

      [v16 setShouldRasterize:1];
      double v18 = [v11 secondaryRepresentedStrings];
      uint64_t v19 = [v18 count];

      if (v19 == 1)
      {
        uint64_t v20 = [v37 layerForRenderFlags:16];
        double v22 = v20;
        if (v15 == 7)
        {
          LODWORD(v21) = 1.0;
          [v20 setOpacity:v21];
          uint64_t v23 = [(UIKBKeyViewAnimator *)self keycapAlternateDualStringTransform:v37];
        }
        else
        {
          uint64_t v33 = [v37 renderConfig];
          int v34 = [v33 lightKeyboard];
          LODWORD(v35) = 1050253722;
          if (v34) {
            *(float *)&double v35 = 0.25;
          }
          [v22 setOpacity:v35];

          uint64_t v23 = [(UIKBKeyViewAnimator *)self keycapAlternateTransform:v37];
        }
        long long v36 = (void *)v23;
        [v22 setMeshTransform:v23];

        [v22 setShouldRasterize:1];
      }
      else
      {
        double v24 = [v11 secondaryRepresentedStrings];
        uint64_t v25 = [v24 count];

        if (v25 != 2)
        {
LABEL_25:

          goto LABEL_26;
        }
        double v22 = [v37 layerForRenderFlags:16];
        double v26 = [v37 renderConfig];
        if ([v26 lightKeyboard]) {
          *(float *)&double v27 = 0.25;
        }
        else {
          *(float *)&double v27 = 0.3;
        }
        [v22 setOpacity:v27];

        uint64_t v28 = [(UIKBKeyViewAnimator *)self keycapLeftTransform];
        [v22 setMeshTransform:v28];

        [v22 setShouldRasterize:1];
        CGFloat v29 = [v37 layerForRenderFlags:32];
        double v30 = [v37 renderConfig];
        if ([v30 lightKeyboard]) {
          *(float *)&double v31 = 0.25;
        }
        else {
          *(float *)&double v31 = 0.3;
        }
        [v29 setOpacity:v31];

        double v32 = [(UIKBKeyViewAnimator *)self keycapRightTransform];
        [v29 setMeshTransform:v32];

        [v29 setShouldRasterize:1];
      }

      goto LABEL_25;
    }
  }
LABEL_26:
  if (v10) {
    v10[2](v10, 1);
  }
}

- (void)transitionOutKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  int v12 = [v11 key];
  double v13 = 0.0;
  id v14 = v12;
  if (a4 != 4
    && a4 > a5
    && [v12 interactionType] != 20
    && ([v14 displayType] == 13 || objc_msgSend(v14, "displayType") == 5))
  {
    double v13 = 0.5;
  }
  [v11 changeBackgroundToActiveIfNecessary];
  [(UIKBKeyViewAnimator *)self _fadeOutKeyView:v11 duration:v10 completion:v13];
}

- (void)transitionStartedForKeyView:(id)a3 alternateCount:(unint64_t)a4 toLeft:(BOOL)a5
{
  BOOL v5 = a5;
  id v74 = a3;
  id v8 = [v74 layerForRenderFlags:4];
  int v9 = [v74 isDynamicKey];
  double v10 = 2.0;
  if (v9) {
    double v10 = 1.0;
  }
  [(UIKBKeyViewAnimator *)self setKeyScale:v10];
  id v11 = [v8 animationForKey:@"pan transform"];

  if (a4 != 1 || v11)
  {
    if (a4 != 2) {
      goto LABEL_48;
    }
    uint64_t v18 = [v8 animationForKey:@"pan transform left"];

    uint64_t v19 = [v8 animationForKey:@"pan transform right"];

    BOOL v20 = !v19 || v5;
    BOOL v21 = v18 && v5;
    if (v21 || !v20) {
      goto LABEL_48;
    }
    if (v18 | v19)
    {
      if (v18) {
        double v22 = @"pan transform left";
      }
      else {
        double v22 = @"pan transform right";
      }
      [v8 removeAnimationForKey:v22];
    }
    int v12 = [v74 layerForRenderFlags:16];
    uint64_t v23 = [v74 layerForRenderFlags:32];
    [v8 setShouldRasterize:0];
    [v12 setShouldRasterize:0];
    [v23 setShouldRasterize:0];
    [v8 setSpeed:0.0];
    [v12 setSpeed:0.0];
    v70 = v23;
    [v23 setSpeed:0.0];
    uint64_t v69 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F1FE8 toValue:&unk_1ED3F48F0];
    v68 = [(UIKBKeyViewAnimator *)self keycapPrimaryTransform];
    if (v5)
    {
      v66 = [(UIKBKeyViewAnimator *)self keycapLeftSelectPrimaryTransform];
      uint64_t v72 = objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:");
      double v24 = objc_opt_class();
      uint64_t v25 = NSNumber;
      double v26 = [v74 renderConfig];
      if ([v26 lightKeyboard]) {
        double v27 = 0.25;
      }
      else {
        double v27 = 0.3;
      }
      uint64_t v28 = [v25 numberWithDouble:v27];
      uint64_t v67 = [v24 normalizedAnimationWithKeyPath:@"opacity" fromValue:v28 toValue:&unk_1ED3F1FE8];

      uint64_t v29 = [(UIKBKeyViewAnimator *)self keycapLeftTransform];
      [(UIKBKeyViewAnimator *)self keycapLeftSelectLeftTransform];
      double v30 = v65 = (void *)v29;
      double v31 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v29 toValue:v30];
      double v32 = objc_opt_class();
      uint64_t v33 = NSNumber;
      int v34 = [v74 renderConfig];
      if ([v34 lightKeyboard]) {
        double v35 = 0.25;
      }
      else {
        double v35 = 0.3;
      }
      long long v36 = [v33 numberWithDouble:v35];
      v73 = [v32 normalizedAnimationWithKeyPath:@"opacity" fromValue:v36 toValue:&unk_1ED3F48F0];

      id v37 = [(UIKBKeyViewAnimator *)self keycapRightTransform];
      long long v38 = [(UIKBKeyViewAnimator *)self keycapLeftSelectRightTransform];
      int32x4_t v39 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v37 toValue:v38];
      long long v40 = @"pan transform left";
    }
    else
    {
      v66 = [(UIKBKeyViewAnimator *)self keycapRightSelectPrimaryTransform];
      uint64_t v72 = objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:");
      v54 = objc_opt_class();
      v55 = NSNumber;
      v56 = [v74 renderConfig];
      if ([v56 lightKeyboard]) {
        double v57 = 0.25;
      }
      else {
        double v57 = 0.3;
      }
      v58 = [v55 numberWithDouble:v57];
      uint64_t v67 = [v54 normalizedAnimationWithKeyPath:@"opacity" fromValue:v58 toValue:&unk_1ED3F48F0];

      uint64_t v59 = [(UIKBKeyViewAnimator *)self keycapLeftTransform];
      [(UIKBKeyViewAnimator *)self keycapRightSelectLeftTransform];
      double v30 = v65 = (void *)v59;
      double v31 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v59 toValue:v30];
      v60 = objc_opt_class();
      v61 = NSNumber;
      v62 = [v74 renderConfig];
      if ([v62 lightKeyboard]) {
        double v63 = 0.25;
      }
      else {
        double v63 = 0.3;
      }
      v64 = [v61 numberWithDouble:v63];
      v73 = [v60 normalizedAnimationWithKeyPath:@"opacity" fromValue:v64 toValue:&unk_1ED3F1FE8];

      id v37 = [(UIKBKeyViewAnimator *)self keycapRightTransform];
      long long v38 = [(UIKBKeyViewAnimator *)self keycapRightSelectRightTransform];
      int32x4_t v39 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v37 toValue:v38];
      long long v40 = @"pan transform right";
    }

    int32x4_t v41 = (void *)v69;
    [v8 addAnimation:v69 forKey:@"pan opacity"];
    [v8 addAnimation:v72 forKey:v40];
    v48 = (void *)v67;
    [v12 addAnimation:v67 forKey:@"pan opacity"];
    [v12 addAnimation:v31 forKey:@"pan transform"];
    v50 = v70;
    v53 = (void *)v72;
    [v70 addAnimation:v73 forKey:@"pan opacity"];
    [v70 addAnimation:v39 forKey:@"pan transform"];
  }
  else
  {
    int v12 = [v74 layerForRenderFlags:16];
    [v8 setShouldRasterize:0];
    [v12 setShouldRasterize:0];
    [v8 setSpeed:0.0];
    [v12 setSpeed:0.0];
    double v13 = [v74 key];
    int v14 = [v13 displayType];

    double v15 = 1.0;
    if (v14 != 7)
    {
      double v16 = [v74 renderConfig];
      if ([v16 lightKeyboard]) {
        double v15 = 0.25;
      }
      else {
        double v15 = 0.3;
      }
    }
    [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F1FE8 toValue:&unk_1ED3F48F0];
    uint64_t v17 = v71 = v8;
    if (v14 == 7) {
      [(UIKBKeyViewAnimator *)self keycapPrimaryDualStringTransform:v74];
    }
    else {
    int32x4_t v41 = [(UIKBKeyViewAnimator *)self keycapPrimaryTransform];
    }
    uint64_t v42 = [(UIKBKeyViewAnimator *)self keycapPrimaryExitTransform];
    uint64_t v43 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v41 toValue:v42];
    uint64_t v44 = objc_opt_class();
    v45 = [NSNumber numberWithDouble:v15];
    uint64_t v46 = [v44 normalizedAnimationWithKeyPath:@"opacity" fromValue:v45 toValue:&unk_1ED3F1FE8];

    BOOL v47 = v14 == 7;
    v48 = (void *)v43;
    if (v47) {
      [(UIKBKeyViewAnimator *)self keycapAlternateDualStringTransform:v74];
    }
    else {
    uint64_t v49 = [(UIKBKeyViewAnimator *)self keycapAlternateTransform:v74];
    }
    v50 = (void *)v17;
    uint64_t v51 = [(UIKBKeyViewAnimator *)self keycapNullTransform];
    v73 = (void *)v49;
    v52 = [(id)objc_opt_class() normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v49 toValue:v51];
    id v8 = v71;
    [v71 addAnimation:v50 forKey:@"pan opacity"];
    [v71 addAnimation:v48 forKey:@"pan transform"];
    [v12 addAnimation:v46 forKey:@"pan opacity"];
    [v12 addAnimation:v52 forKey:@"pan transform"];

    v53 = (void *)v42;
    double v31 = (void *)v46;
    int32x4_t v39 = (void *)v51;
  }

LABEL_48:
}

- (void)transitionEndedForKeyView:(id)a3 alternateCount:(unint64_t)a4
{
  id v89 = a3;
  double v6 = [v89 layerForRenderFlags:4];
  [v6 timeOffset];
  [v89 setEndingTransitionDuration:v7 * 0.200000003];
  int v8 = [v89 isDynamicKey];
  double v9 = 2.0;
  if (v8) {
    double v9 = 1.0;
  }
  [(UIKBKeyViewAnimator *)self setKeyScale:v9];
  double v10 = [v6 animationForKey:@"pan transform"];

  if (a4 == 1 && v10)
  {
    [v89 changeBackgroundToEnabled];
    id v11 = [v89 layerForRenderFlags:16];
    [v6 setShouldRasterize:1];
    [v11 setShouldRasterize:1];
    [v6 timeOffset];
    double v13 = v12;
    [v11 timeOffset];
    double v15 = v14;
    LODWORD(v14) = 1.0;
    [v6 setSpeed:v14];
    LODWORD(v16) = 1.0;
    [v11 setSpeed:v16];
    [v6 setTimeOffset:0.0];
    [v11 setTimeOffset:0.0];
    uint64_t v17 = [v89 key];
    int v18 = [v17 displayType];

    double v19 = 1.0;
    if (v18 != 7)
    {
      BOOL v20 = [v89 renderConfig];
      if ([v20 lightKeyboard]) {
        double v19 = 0.25;
      }
      else {
        double v19 = 0.3;
      }
    }
    BOOL v21 = [(id)objc_opt_class() normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:&unk_1ED3F1FE8 toValue:&unk_1ED3F48F0 offset:v13];
    v86 = v11;
    if (v18 == 7) {
      [(UIKBKeyViewAnimator *)self keycapPrimaryDualStringTransform:v89];
    }
    else {
    uint64_t v56 = [(UIKBKeyViewAnimator *)self keycapPrimaryTransform];
    }
    uint64_t v57 = [(UIKBKeyViewAnimator *)self keycapPrimaryExitTransform];
    uint64_t v42 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v56 toValue:v57 offset:v13];
    v58 = objc_opt_class();
    uint64_t v59 = [NSNumber numberWithDouble:v19];
    v60 = [v58 normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:v59 toValue:&unk_1ED3F1FE8 offset:v15];

    if (v18 == 7)
    {
      v61 = (void *)v57;
      v62 = (void *)v56;
      [(UIKBKeyViewAnimator *)self keycapAlternateDualStringTransform:v89];
    }
    else
    {
      v61 = (void *)v57;
      v62 = (void *)v56;
      [(UIKBKeyViewAnimator *)self keycapAlternateTransform:v89];
    uint64_t v63 = };
    v54 = [(UIKBKeyViewAnimator *)self keycapNullTransform];
    v88 = (void *)v63;
    v64 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v63 toValue:v54 offset:v15];
    [v6 addAnimation:v21 forKey:@"pan opacity"];
    [v6 addAnimation:v42 forKey:@"pan transform"];
    v65 = v86;
    [v86 addAnimation:v60 forKey:@"pan opacity"];
    [v86 addAnimation:v64 forKey:@"pan transform"];

    v66 = v62;
    double v35 = v61;
    goto LABEL_27;
  }
  if (a4 == 2)
  {
    uint64_t v22 = [v6 animationForKey:@"pan transform left"];

    uint64_t v23 = [v6 animationForKey:@"pan transform right"];
    uint64_t v24 = v22 | v23;

    if (v24)
    {
      uint64_t v25 = [v89 layerForRenderFlags:16];
      BOOL v21 = [v89 layerForRenderFlags:32];
      [v6 setShouldRasterize:1];
      [v25 setShouldRasterize:1];
      [v21 setShouldRasterize:1];
      [v6 timeOffset];
      double v27 = v26;
      [v25 timeOffset];
      double v29 = v28;
      [v21 timeOffset];
      double v31 = v30;
      LODWORD(v30) = 1.0;
      [v6 setSpeed:v30];
      LODWORD(v32) = 1.0;
      [v25 setSpeed:v32];
      LODWORD(v33) = 1.0;
      [v21 setSpeed:v33];
      [v6 setTimeOffset:0.0];
      [v25 setTimeOffset:0.0];
      [v21 setTimeOffset:0.0];
      uint64_t v81 = [(id)objc_opt_class() normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:&unk_1ED3F1FE8 toValue:&unk_1ED3F48F0 offset:v27];
      uint64_t v34 = [(UIKBKeyViewAnimator *)self keycapPrimaryTransform];
      v85 = (void *)v34;
      v87 = v25;
      if (v22)
      {
        v83 = [(UIKBKeyViewAnimator *)self keycapLeftSelectPrimaryTransform];
        double v35 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v34 toValue:v83 offset:v27];
        long long v36 = objc_opt_class();
        id v37 = NSNumber;
        long long v38 = [v89 renderConfig];
        if ([v38 lightKeyboard]) {
          double v39 = 0.25;
        }
        else {
          double v39 = 0.3;
        }
        long long v40 = [v37 numberWithDouble:v39];
        uint64_t v41 = [v36 normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:v40 toValue:&unk_1ED3F1FE8 offset:v29];

        uint64_t v42 = (void *)v41;
        uint64_t v43 = [(UIKBKeyViewAnimator *)self keycapLeftTransform];
        v82 = [(UIKBKeyViewAnimator *)self keycapLeftSelectLeftTransform];
        uint64_t v84 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v43 toValue:v82 offset:v29];
        uint64_t v44 = objc_opt_class();
        v45 = NSNumber;
        uint64_t v46 = [v89 renderConfig];
        if ([v46 lightKeyboard]) {
          double v47 = 0.25;
        }
        else {
          double v47 = 0.3;
        }
        v48 = v45;
        uint64_t v49 = (void *)v43;
        v50 = [v48 numberWithDouble:v47];
        v88 = [v44 normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:v50 toValue:&unk_1ED3F48F0 offset:v31];

        uint64_t v51 = [(UIKBKeyViewAnimator *)self keycapRightTransform];
        v52 = [(UIKBKeyViewAnimator *)self keycapLeftSelectRightTransform];
        v53 = (void *)v51;
        v54 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v51 toValue:v52 offset:v31];
        v55 = @"pan transform left";
      }
      else
      {
        v83 = [(UIKBKeyViewAnimator *)self keycapRightSelectPrimaryTransform];
        double v35 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v34 toValue:v83 offset:v27];
        uint64_t v67 = objc_opt_class();
        v68 = NSNumber;
        uint64_t v69 = [v89 renderConfig];
        if ([v69 lightKeyboard]) {
          double v70 = 0.25;
        }
        else {
          double v70 = 0.3;
        }
        v71 = [v68 numberWithDouble:v70];
        uint64_t v72 = [v67 normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:v71 toValue:&unk_1ED3F48F0 offset:v29];

        uint64_t v42 = (void *)v72;
        uint64_t v73 = [(UIKBKeyViewAnimator *)self keycapLeftTransform];
        v82 = [(UIKBKeyViewAnimator *)self keycapRightSelectLeftTransform];
        uint64_t v84 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v73 toValue:v82 offset:v29];
        id v74 = objc_opt_class();
        v75 = NSNumber;
        v76 = [v89 renderConfig];
        if ([v76 lightKeyboard]) {
          double v77 = 0.25;
        }
        else {
          double v77 = 0.3;
        }
        v78 = v75;
        uint64_t v49 = (void *)v73;
        v79 = [v78 numberWithDouble:v77];
        v88 = [v74 normalizedUnwindOpacityAnimationWithKeyPath:@"opacity" originallyFromValue:v79 toValue:&unk_1ED3F1FE8 offset:v31];

        uint64_t v80 = [(UIKBKeyViewAnimator *)self keycapRightTransform];
        v52 = [(UIKBKeyViewAnimator *)self keycapRightSelectRightTransform];
        v53 = (void *)v80;
        v54 = [(id)objc_opt_class() normalizedUnwindAnimationWithKeyPath:@"meshTransform" originallyFromValue:v80 toValue:v52 offset:v31];
        v55 = @"pan transform right";
      }
      v66 = (void *)v81;

      [v6 addAnimation:v81 forKey:@"pan opacity"];
      [v6 addAnimation:v35 forKey:v55];
      [v87 addAnimation:v42 forKey:@"pan opacity"];
      [v87 addAnimation:v84 forKey:@"pan transform"];
      v65 = v87;
      v60 = (void *)v84;
      [v21 addAnimation:v88 forKey:@"pan opacity"];
      [v21 addAnimation:v54 forKey:@"pan transform"];
LABEL_27:
    }
  }
}

- (void)updateTransitionForKeyView:(id)a3 normalizedDragSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v21 = a3;
  double v7 = [v21 key];
  int v8 = [v21 isDynamicKey];
  double v9 = 2.0;
  if (v8) {
    double v9 = 1.0;
  }
  [(UIKBKeyViewAnimator *)self setKeyScale:v9];
  if ([v7 displayTypeHint] == 10)
  {
    double v10 = [v7 secondaryRepresentedStrings];
    uint64_t v11 = [v10 count];

    if (v11 == 2)
    {
      double v12 = [v21 layerForRenderFlags:4];
      double v13 = [v21 layerForRenderFlags:16];
      double v16 = [v21 layerForRenderFlags:32];
      double v17 = -width;
      if (width >= 0.0) {
        double v17 = width;
      }
      double v18 = fmin((v17 + -0.07) / 0.3, 1.0);
      if (v18 < 0.0) {
        double v18 = 0.0;
      }
      double v19 = fmin(height + -0.07 + height + -0.07, 1.0);
      if (v19 < 0.0) {
        double v19 = 0.0;
      }
      if (v18 >= v19) {
        double v20 = v19;
      }
      else {
        double v20 = v18;
      }
      [(UIKBKeyViewAnimator *)self transitionStartedForKeyView:v21 alternateCount:2 toLeft:width < 0.0];
      [v12 setTimeOffset:v20];
      [v13 setTimeOffset:v20];
      [v16 setTimeOffset:v20];
    }
    else
    {
      if (v11 != 1) {
        goto LABEL_21;
      }
      double v12 = [v21 layerForRenderFlags:4];
      double v13 = [v21 layerForRenderFlags:16];
      [(UIKBKeyViewAnimator *)self transitionStartedForKeyView:v21 alternateCount:1 toLeft:0];
      double v14 = fmin(height + -0.07 + height + -0.07, 1.0);
      if (v14 >= 0.0) {
        double v15 = v14;
      }
      else {
        double v15 = 0.0;
      }
      [v12 setTimeOffset:v15];
      [v13 setTimeOffset:v15];
    }
  }
LABEL_21:
}

- (void)endTransitionForKeyView:(id)a3
{
  id v9 = a3;
  double v4 = [v9 key];
  int v5 = [v9 isDynamicKey];
  double v6 = 2.0;
  if (v5) {
    double v6 = 1.0;
  }
  [(UIKBKeyViewAnimator *)self setKeyScale:v6];
  if ([v4 displayTypeHint] == 10)
  {
    double v7 = [v4 secondaryRepresentedStrings];
    uint64_t v8 = [v7 count];

    if (v8) {
      [(UIKBKeyViewAnimator *)self transitionEndedForKeyView:v9 alternateCount:v8];
    }
  }
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (double)keyScale
{
  return self->_keyScale;
}

- (void)setKeyScale:(double)a3
{
  self->_keyScale = a3;
}

@end