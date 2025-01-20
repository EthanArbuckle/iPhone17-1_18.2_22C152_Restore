@interface SBUISystemApertureTextContentProvider
+ (id)_textColorForTextStyle:(int64_t)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (SBUISystemApertureContentViewContaining)contentContainer;
- (SBUISystemApertureTextContentProvider)initWithAttributedText:(id)a3 style:(int64_t)a4;
- (SBUISystemApertureTextContentProvider)initWithText:(id)a3 style:(int64_t)a4;
- (UIColor)contentColor;
- (UIView)providedView;
- (id)_initWithText:(id)a3 attributedText:(id)a4 style:(int64_t)a5;
- (id)_providedView;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)setAttributedText:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setContentContainer:(id)a3;
- (void)setFontWeight:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)swapInText:(id)a3 textColor:(id)a4;
- (void)swapInText:(id)a3 textColor:(id)a4 fittingSize:(CGSize)a5;
@end

@implementation SBUISystemApertureTextContentProvider

- (SBUISystemApertureTextContentProvider)initWithText:(id)a3 style:(int64_t)a4
{
  return (SBUISystemApertureTextContentProvider *)[(SBUISystemApertureTextContentProvider *)self _initWithText:a3 attributedText:0 style:a4];
}

- (SBUISystemApertureTextContentProvider)initWithAttributedText:(id)a3 style:(int64_t)a4
{
  return (SBUISystemApertureTextContentProvider *)[(SBUISystemApertureTextContentProvider *)self _initWithText:0 attributedText:a3 style:a4];
}

- (id)_initWithText:(id)a3 attributedText:(id)a4 style:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBUISystemApertureTextContentProvider;
  v10 = [(SBUISystemApertureTextContentProvider *)&v21 init];
  if (v10)
  {
    v11 = [SBUISystemApertureLabel alloc];
    v12 = -[SBUISystemApertureLabel initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v13 = v12;
    if (v8) {
      [(SBUISystemApertureLabel *)v12 setText:v8];
    }
    if (v9) {
      [(SBUISystemApertureLabel *)v13 setAttributedText:v9];
    }
    v14 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredFontForTextStyle:", a5);
    [(SBUISystemApertureLabel *)v13 setFont:v14];

    [(SBUISystemApertureLabel *)v13 setAdjustsFontForContentSizeCategory:1];
    v15 = [(id)objc_opt_class() _textColorForTextStyle:a5];
    [(SBUISystemApertureLabel *)v13 setTextColor:v15];

    v16 = -[_SBUISystemApertureTextContainerView initWithContentLabel:]((id *)[_SBUISystemApertureTextContainerView alloc], v13);
    label = v10->_label;
    v10->_label = v13;
    v18 = v13;

    providedView = v10->_providedView;
    v10->_providedView = (UIView *)v16;
  }
  return v10;
}

- (NSString)text
{
  return (NSString *)[(SBUISystemApertureLabel *)self->_label text];
}

- (void)setText:(id)a3
{
  [(SBUISystemApertureLabel *)self->_label setText:a3];
  uint64_t v4 = -[SBUISystemApertureTextContentProvider _providedView]((id *)&self->super.isa);
  id v8 = (id)v4;
  if (v4)
  {
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*(double *)(v4 + 416) != *MEMORY[0x1E4F1DB30] || *(double *)(v4 + 424) != v5)
    {
      *(void *)(v4 + 416) = *MEMORY[0x1E4F1DB30];
      *(double *)(v4 + 424) = v5;
      [(id)v4 setNeedsLayout];
      uint64_t v4 = (uint64_t)v8;
    }
  }
  [(id)v4 setNeedsLayout];
  v7 = [(SBUISystemApertureTextContentProvider *)self contentContainer];
  [v7 preferredContentSizeDidInvalidateForContentViewProvider:self];
}

- (id)_providedView
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)[(SBUISystemApertureLabel *)self->_label attributedText];
}

- (void)setAttributedText:(id)a3
{
  [(SBUISystemApertureLabel *)self->_label setAttributedText:a3];
  uint64_t v4 = -[SBUISystemApertureTextContentProvider _providedView]((id *)&self->super.isa);
  [v4 setNeedsLayout];

  id v5 = [(SBUISystemApertureTextContentProvider *)self contentContainer];
  [v5 preferredContentSizeDidInvalidateForContentViewProvider:self];
}

- (int64_t)textAlignment
{
  return [(SBUISystemApertureLabel *)self->_label textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  int64_t v3 = a3;
  if ((a3 | 2) == 2)
  {
    BOOL v5 = a3 == 0;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      int64_t v3 = 2 * v5;
    }
  }
  label = self->_label;
  [(SBUISystemApertureLabel *)label setTextAlignment:v3];
}

- (int64_t)numberOfLines
{
  return [(SBUISystemApertureLabel *)self->_label numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
}

- (void)setFontWeight:(double)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self->_label;
  BOOL v5 = [(SBUISystemApertureLabel *)v4 font];
  v6 = [v5 fontDescriptor];

  v7 = [v6 fontAttributes];
  uint64_t v8 = *MEMORY[0x1E4F43848];
  id v9 = [v7 objectForKey:*MEMORY[0x1E4F43848]];
  v10 = (void *)[v9 mutableCopy];

  v11 = [NSNumber numberWithDouble:a3];
  [v10 setObject:v11 forKey:*MEMORY[0x1E4F43940]];

  uint64_t v15 = v8;
  v16[0] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v13 = [v6 fontDescriptorByAddingAttributes:v12];

  v14 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v13 size:0.0];
  [(SBUISystemApertureLabel *)v4 setFont:v14];
}

- (void)swapInText:(id)a3 textColor:(id)a4
{
}

- (void)swapInText:(id)a3 textColor:(id)a4 fittingSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  id v10 = a3;
  v11 = -[SBUISystemApertureTextContentProvider _providedView]((id *)&self->super.isa);
  label = self->_label;
  ++self->_textSwapTransitionCount;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke;
  v17[3] = &unk_1E5CCC760;
  id v18 = v11;
  v19 = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke_2;
  v15[3] = &unk_1E5CCC788;
  v15[4] = self;
  id v16 = v18;
  id v13 = v18;
  v14 = label;
  -[SBUISystemApertureLabel performTextSwapAnimationWithText:textColor:fittingSize:sizeWillChangeBlock:didSetPropertiesBlock:](v14, "performTextSwapAnimationWithText:textColor:fittingSize:sizeWillChangeBlock:didSetPropertiesBlock:", v10, v9, v17, v15, width, height);
}

void __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(double **)(a1 + 32);
  if (v4)
  {
    if (v4[52] != a2 || v4[53] != a3)
    {
      v4[52] = a2;
      v4[53] = a3;
      [v4 setNeedsLayout];
    }
  }
  id v6 = [*(id *)(a1 + 40) contentContainer];
  [v6 preferredContentSizeDidInvalidateForContentViewProvider:*(void *)(a1 + 40)];
}

uint64_t __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2 || (*(void *)(v1 + 16) = v2 - 1, !*(void *)(*(void *)(result + 32) + 16)))
  {
    result = *(void *)(result + 40);
    if (result)
    {
      double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (*(double *)(result + 416) != *MEMORY[0x1E4F1DB30] || *(double *)(result + 424) != v3)
      {
        *(void *)(result + 416) = *MEMORY[0x1E4F1DB30];
        *(double *)(result + 424) = v3;
        return [(id)result setNeedsLayout];
      }
    }
  }
  return result;
}

- (UIColor)contentColor
{
  return (UIColor *)[(SBUISystemApertureLabel *)self->_label textColor];
}

- (void)setContentColor:(id)a3
{
}

+ (id)_textColorForTextStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
  {
  }
  else
  {
    if (a3 == 3) {
      objc_msgSend(MEMORY[0x1E4F428B8], "secondaryLabelColor", v3);
    }
    else {
      objc_msgSend(MEMORY[0x1E4F428B8], "labelColor", v3);
    }
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (UIView)providedView
{
  return self->_providedView;
}

- (SBUISystemApertureContentViewContaining)contentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  return (SBUISystemApertureContentViewContaining *)WeakRetained;
}

- (void)setContentContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_providedView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end