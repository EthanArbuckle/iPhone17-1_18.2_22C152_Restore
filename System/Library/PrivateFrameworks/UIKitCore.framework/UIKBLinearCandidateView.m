@interface UIKBLinearCandidateView
- (id)getConfiguration;
- (unint64_t)focusableVariantCount;
- (void)refreshSelectedCandidate;
- (void)refreshSelectedCandidateAnimated:(BOOL)a3;
- (void)updateCandidateKey;
@end

@implementation UIKBLinearCandidateView

- (void)updateCandidateKey
{
  v3 = +[UIKeyboardImpl activeInstance];
  id v30 = [v3 candidateController];

  v4 = [(UIKBCandidateView *)self candidateKey];

  if (!v4)
  {
    [(UIView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(UIKBLinearCandidateView *)self getConfiguration];
    v14 = objc_msgSend(v30, "newCandidateKeyWithFrame:configuration:", v13, v6, v8, v10, v12);
    [(UIKBCandidateView *)self setCandidateKey:v14];
  }
  v15 = [(UIKBCandidateView *)self candidateKey];
  v16 = [v15 superview];

  if (v16 != self)
  {
    v17 = [(UIKBCandidateView *)self candidateKey];
    [v17 removeFromSuperview];

    v18 = [(UIKBCandidateView *)self candidateKey];
    [v18 setHidden:0];

    v19 = [(UIKBCandidateView *)self candidateKey];
    [(UIView *)self addSubview:v19];
  }
  [(UIView *)self bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(UIKBCandidateView *)self candidateKey];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v29 = [(UIKBCandidateView *)self candidateKey];
  [v29 setAutoresizingMask:18];

  [v30 setActiveCandidateViewType:1];
}

- (id)getConfiguration
{
  return +[UIKeyboardCandidateViewConfiguration configuration];
}

- (void)refreshSelectedCandidate
{
}

- (void)refreshSelectedCandidateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[UIKeyboardImpl activeInstance];
  id v7 = [v5 candidateController];

  double v6 = [(UIKBKeyView *)self key];
  objc_msgSend(v7, "showCandidateAtIndex:animated:scrollPosition:", objc_msgSend(v6, "selectedVariantIndex"), v3, 16);
}

- (unint64_t)focusableVariantCount
{
  v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 candidateController];

  v4 = [v3 candidates];
  double v5 = [v4 candidates];
  unint64_t v6 = [v5 count];

  return v6;
}

@end