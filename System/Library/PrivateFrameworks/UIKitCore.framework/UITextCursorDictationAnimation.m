@interface UITextCursorDictationAnimation
@end

@implementation UITextCursorDictationAnimation

void __46___UITextCursorDictationAnimation_setEnabled___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if (UIRectIsDiscrete(v2, v3, v4, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnimatedCursorShapeBounds:", v2, v3, v4, v5);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [WeakRetained layoutSubviews];
  }
}

uint64_t __46___UITextCursorDictationAnimation_setEnabled___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke_3;
  v3[3] = &unk_1E52D9F70;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke_4;
  v2[3] = &unk_1E52DC3A0;
  v2[4] = v4;
  return +[UIView animateWithDuration:0x20000 delay:v3 options:v2 animations:0.175 completion:0.0];
}

void __46___UITextCursorDictationAnimation_setEnabled___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimatedCursorShapeBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained layoutSubviews];
}

void __46___UITextCursorDictationAnimation_setEnabled___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setSoundReactiveCursorEnabled:1];
  [*(id *)(*(void *)(a1 + 32) + 24) setHidden:0];
  id v2 = +[UIKeyboardImpl activeInstance];
  [v2 presentDictationMenu];
}

void __53___UITextCursorDictationAnimation__displayLinkFired___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [v3 bounds];
  objc_msgSend(WeakRetained, "_cursorShapeRectForBounds:");
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  long long v12 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v21.c = v12;
  *(_OWORD *)&v21.tdouble x = *(_OWORD *)(a1 + 72);
  uint64_t v13 = v5;
  *(void *)&long long v12 = v7;
  uint64_t v14 = v9;
  uint64_t v15 = v11;
  CGRect v22 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &v21);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  if (UIRectIsDiscrete(v22.origin.x, v22.origin.y, v22.size.width, v22.size.height))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnimatedCursorShapeBounds:", x, y, width, height);
    id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [v20 layoutSubviews];
  }
}

@end