@interface UIKBCandidateView
- ($5C396DA91E87D63640AC871340DC94CC)visualStyling;
- (BOOL)isTenKey;
- (UIKBCandidateView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIView)candidateKey;
- (id)candidateList;
- (void)clearCandidateKey;
- (void)dealloc;
- (void)displayLayer:(id)a3;
- (void)setCandidateKey:(id)a3;
- (void)setVisualStyling:(id)a3;
- (void)updateCandidateKey;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
@end

@implementation UIKBCandidateView

- (UIKBCandidateView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIKBCandidateView;
  v12 = -[UIKBKeyView initWithFrame:keyplane:key:](&v17, sel_initWithFrame_keyplane_key_, v11, a5, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    [(UIView *)v12 setEnabled:1];
    [(UIView *)v13 setOpaque:0];
    -[UIKBCandidateView setVisualStyling:](v13, "setVisualStyling:", [v11 visualStyling]);
    if ([(UIKBCandidateView *)v13 isTenKey])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__UIKBCandidateView_initWithFrame_keyplane_key___block_invoke;
      v15[3] = &unk_1E52D9F70;
      v16 = v13;
      +[UIView performWithoutAnimation:v15];
    }
  }

  return v13;
}

uint64_t __48__UIKBCandidateView_initWithFrame_keyplane_key___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCandidateKey];
}

- (void)dealloc
{
  [(UIKBCandidateView *)self clearCandidateKey];
  v3.receiver = self;
  v3.super_class = (Class)UIKBCandidateView;
  [(UIKBKeyView *)&v3 dealloc];
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  [(UIKBCandidateView *)self clearCandidateKey];
  [(UIKBCandidateView *)self updateCandidateKey];
}

- (void)displayLayer:(id)a3
{
  id v4 = a3;
  if ([(UIKBCandidateView *)self isTenKey])
  {
    v5 = [(UIKBKeyView *)self screenTraits];
    if ([v5 idiom] == 1)
    {
LABEL_9:

      goto LABEL_10;
    }
    v6 = [(UIKBKeyView *)self screenTraits];
    if ([v6 idiom] == 24)
    {
LABEL_8:

      goto LABEL_9;
    }
    v7 = [(UIKBKeyView *)self screenTraits];
    if ([v7 idiom] == 25)
    {
LABEL_7:

      goto LABEL_8;
    }
    v8 = [(UIKBKeyView *)self screenTraits];
    if ([v8 idiom] == 26)
    {

      goto LABEL_7;
    }
    v9 = [(UIKBKeyView *)self screenTraits];
    uint64_t v10 = [v9 idiom];

    if (v10 != 23)
    {
      v11.receiver = self;
      v11.super_class = (Class)UIKBCandidateView;
      [(UIKBKeyView *)&v11 displayLayer:v4];
    }
  }
LABEL_10:
}

- (id)candidateList
{
  v2 = +[UIKeyboardImpl activeInstance];
  objc_super v3 = [v2 candidateController];

  return v3;
}

- (BOOL)isTenKey
{
  v2 = [(UIKBKeyView *)self key];
  unsigned int v3 = [v2 rendering];

  return (v3 < 0x23) & (0x600000002uLL >> v3);
}

- (void)updateCandidateKey
{
  unsigned int v3 = [(UIKBKeyView *)self factory];
  id v4 = [(UIKBKeyView *)self key];
  v5 = [(UIKBKeyView *)self keyplane];
  id v55 = [v3 traitsForKey:v4 onKeyplane:v5];

  v6 = [v55 geometry];
  [v6 roundRectRadius];
  double v8 = v7;

  v9 = [v55 geometry];
  char v10 = [v9 roundRectCorners];

  objc_super v11 = [v55 geometry];
  [v11 frame];
  double MinY = CGRectGetMinY(v57);
  v13 = [v55 geometry];
  [v13 paddedFrame];
  double v14 = MinY - CGRectGetMinY(v58);

  v15 = [v55 geometry];
  [v15 frame];
  double MaxX = CGRectGetMaxX(v59);
  objc_super v17 = [v55 geometry];
  [v17 paddedFrame];
  double v18 = MaxX - CGRectGetMaxX(v60);

  v19 = [v55 geometry];
  [v19 frame];
  double MaxY = CGRectGetMaxY(v61);
  v21 = [v55 geometry];
  [v21 paddedFrame];
  double v22 = MaxY - CGRectGetMaxY(v62);

  v23 = [v55 geometry];
  [v23 frame];
  double MinX = CGRectGetMinX(v63);
  v25 = [v55 geometry];
  [v25 paddedFrame];
  double v26 = MinX - CGRectGetMinX(v64);

  v27 = +[UIKeyboardImpl activeInstance];
  v28 = [v27 candidateController];

  [(UIView *)self bounds];
  double v30 = v29 - v26;
  double v32 = v31 - (v18 - v26);
  double v34 = v33 - v14;
  double v36 = v35 - (v22 - v14);
  v37 = [(UIKBCandidateView *)self candidateKey];

  if (!v37)
  {
    if (([(UIKBCandidateView *)self visualStyling] & 0x3F) == 1
      && ([(UIKBCandidateView *)self visualStyling] & 0x80) != 0)
    {
      v38 = +[UIKeyboardCandidateViewConfiguration configuration];
    }
    else
    {
      v38 = 0;
    }
    if (([(UIKBCandidateView *)self visualStyling] & 0x3F) == 3)
    {
      [(UIView *)self frame];
      v39 = off_1E52D3F18;
      if (v40 > 84.0) {
        v39 = off_1E52D3FD0;
      }
    }
    else
    {
      v39 = off_1E52D3FC8;
    }
    v41 = [(__objc2_class *)*v39 configuration];

    v42 = objc_msgSend(v28, "newCandidateKeyWithFrame:configuration:", v41, v30, v34, v32, v36);
    [(UIKBCandidateView *)self setCandidateKey:v42];
  }
  v43 = [(UIKBCandidateView *)self candidateKey];
  v44 = [v43 superview];

  if (v44 != self)
  {
    v45 = [(UIKBCandidateView *)self candidateKey];
    [v45 removeFromSuperview];

    v46 = [(UIKBCandidateView *)self candidateKey];
    [v46 setHidden:0];

    v47 = [(UIKBCandidateView *)self candidateKey];
    [(UIView *)self addSubview:v47];
  }
  v48 = [(UIKBCandidateView *)self candidateKey];
  objc_msgSend(v48, "setFrame:", v30, v34, v32, v36);

  v49 = [(UIKBCandidateView *)self candidateKey];
  [v49 setAutoresizingMask:18];

  v50 = [(UIKBCandidateView *)self candidateKey];
  [v50 _setContinuousCornerRadius:v8];

  v51 = [(UIKBCandidateView *)self candidateKey];
  v52 = [v51 layer];
  [v52 setMaskedCorners:v10 & 0xF];

  v53 = [(UIKBCandidateView *)self candidateKey];
  v54 = [v53 layer];
  [v54 setMasksToBounds:1];

  [v28 setActiveCandidateViewType:1];
  [v28 updateStates];
}

- (void)clearCandidateKey
{
  unsigned int v3 = +[UIKeyboardImpl activeInstance];
  id v7 = [v3 candidateController];

  id v4 = [v7 candidateKey];
  v5 = [v4 superview];

  if (v5 == self)
  {
    v6 = [v7 candidateKey];
    [v6 removeFromSuperview];
  }
}

- ($5C396DA91E87D63640AC871340DC94CC)visualStyling
{
  return ($5C396DA91E87D63640AC871340DC94CC)*(void *)&self->_visualStyling;
}

- (void)setVisualStyling:(id)a3
{
  *(void *)&self->_visualStyling = *(void *)&a3;
}

- (UIView)candidateKey
{
  return self->_candidateKey;
}

- (void)setCandidateKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end