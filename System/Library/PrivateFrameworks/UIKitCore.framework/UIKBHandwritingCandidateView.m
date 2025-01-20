@interface UIKBHandwritingCandidateView
+ (double)shadowYForBounds:(CGRect)a3 shadowHeight:(double)a4;
- (UIKBHandwritingCandidateView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (void)updateCandidateKey;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
@end

@implementation UIKBHandwritingCandidateView

- (UIKBHandwritingCandidateView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)UIKBHandwritingCandidateView;
  v5 = -[UIKBCandidateView initWithFrame:keyplane:key:](&v10, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__UIKBHandwritingCandidateView_initWithFrame_keyplane_key___block_invoke;
    v8[3] = &unk_1E52D9F70;
    v9 = v5;
    +[UIView performWithoutAnimation:v8];
  }
  return v6;
}

uint64_t __59__UIKBHandwritingCandidateView_initWithFrame_keyplane_key___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCandidateKey];
}

+ (double)shadowYForBounds:(CGRect)a3 shadowHeight:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  return MinY + (CGRectGetHeight(v11) - a4) * 0.5;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  [(UIKBCandidateView *)self clearCandidateKey];
  [(UIKBHandwritingCandidateView *)self updateCandidateKey];
}

- (void)updateCandidateKey
{
  v3 = [(UIKBKeyView *)self factory];
  v4 = [(UIKBKeyView *)self key];
  v5 = [(UIKBKeyView *)self keyplane];
  id v35 = [v3 traitsForKey:v4 onKeyplane:v5];

  v6 = [v35 geometry];
  [v6 frame];
  v7 = objc_msgSend(v35, "geometry", CGRectGetMinY(v37));
  [v7 paddedFrame];
  CGRectGetMinY(v38);

  v8 = [v35 geometry];
  [v8 frame];
  v9 = objc_msgSend(v35, "geometry", CGRectGetMaxX(v39));
  [v9 paddedFrame];
  CGRectGetMaxX(v40);

  objc_super v10 = [v35 geometry];
  [v10 frame];
  CGRect v11 = objc_msgSend(v35, "geometry", CGRectGetMaxY(v41));
  [v11 paddedFrame];
  CGRectGetMaxY(v42);

  v12 = [v35 geometry];
  [v12 frame];
  v13 = objc_msgSend(v35, "geometry", CGRectGetMinX(v43));
  [v13 paddedFrame];
  CGRectGetMinX(v44);

  v14 = +[UIKeyboardImpl activeInstance];
  v15 = [v14 candidateController];

  v16 = [(UIKBCandidateView *)self candidateKey];

  if (!v16)
  {
    if (([(UIKBCandidateView *)self visualStyling] & 0x3F) == 1
      || ([(UIKBCandidateView *)self visualStyling] & 0x3F) == 0x18
      || ([(UIKBCandidateView *)self visualStyling] & 0x3F) == 0x19)
    {
      v17 = off_1E52D3F28;
    }
    else
    {
      v17 = off_1E52D3F28;
      if (([(UIKBCandidateView *)self visualStyling] & 0x3F) != 0x1A
        && ([(UIKBCandidateView *)self visualStyling] & 0x3F) != 0x17)
      {
        v17 = off_1E52D3F20;
      }
    }
    v18 = [(__objc2_class *)*v17 configuration];
    [(UIView *)self bounds];
    v19 = objc_msgSend(v15, "newCandidateKeyWithFrame:configuration:", v18);
    [(UIKBCandidateView *)self setCandidateKey:v19];
  }
  v20 = [(UIKBCandidateView *)self candidateKey];
  v21 = [v20 superview];

  if (v21 != self)
  {
    v22 = [(UIKBCandidateView *)self candidateKey];
    [v22 removeFromSuperview];

    v23 = [(UIKBCandidateView *)self candidateKey];
    [v23 setHidden:0];

    v24 = [(UIKBCandidateView *)self candidateKey];
    [(UIView *)self addSubview:v24];
  }
  [(UIView *)self bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [(UIKBCandidateView *)self candidateKey];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  v34 = [(UIKBCandidateView *)self candidateKey];
  [v34 setAutoresizingMask:18];

  [v15 setActiveCandidateViewType:1];
}

@end