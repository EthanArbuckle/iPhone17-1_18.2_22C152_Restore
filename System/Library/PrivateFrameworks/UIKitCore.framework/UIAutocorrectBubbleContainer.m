@interface UIAutocorrectBubbleContainer
- (BOOL)isViewAnimating;
- (CGRect)referenceRect;
- (NSLayoutConstraint)bubbleTopConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)highlightWidthConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSLayoutConstraint)xConstraint;
- (NSLayoutConstraint)yConstraint;
- (NSString)typedText;
- (UIAutocorrectBubble)bubble;
- (UIAutocorrectBubbleContainer)init;
- (UIView)fakeTextSelectionHighlight;
- (UIView)typedTextAnimationPlaceholder;
- (id)createTypedTextViewWithTypedText:(id)a3;
- (void)animateAutocorrectionAccepted;
- (void)dismissAutocorrectBubble;
- (void)performReset;
- (void)reset;
- (void)setBubble:(id)a3;
- (void)setBubbleTopConstraint:(id)a3;
- (void)setFakeTextSelectionHighlight:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHighlightWidthConstraint:(id)a3;
- (void)setReferenceRect:(CGRect)a3;
- (void)setTypedText:(id)a3;
- (void)setTypedTextAnimationPlaceholder:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)setXConstraint:(id)a3;
- (void)setYConstraint:(id)a3;
- (void)updateBubbleWithAutocorrectionText:(id)a3 referenceRect:(CGRect)a4;
- (void)updateFakeTextSelectionHighlightForRect:(CGRect)a3;
- (void)updateSelfWithRect:(CGRect)a3;
- (void)updateWithAutocorrectionText:(id)a3 typedText:(id)a4 referenceTextView:(id)a5 referenceRect:(CGRect)a6;
@end

@implementation UIAutocorrectBubbleContainer

- (UIAutocorrectBubbleContainer)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIAutocorrectBubbleContainer;
  v2 = [(UIView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UIView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIAutocorrectBubbleContainer setReferenceRect:](v3, "setReferenceRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
  return v3;
}

- (void)updateWithAutocorrectionText:(id)a3 typedText:(id)a4 referenceTextView:(id)a5 referenceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a3;
  [(UIAutocorrectBubbleContainer *)self setTypedText:a4];
  -[UIAutocorrectBubbleContainer updateFakeTextSelectionHighlightForRect:](self, "updateFakeTextSelectionHighlightForRect:", x, y, width, height);
  -[UIAutocorrectBubbleContainer updateBubbleWithAutocorrectionText:referenceRect:](self, "updateBubbleWithAutocorrectionText:referenceRect:", v12, x, y, width, height);

  -[UIAutocorrectBubbleContainer updateSelfWithRect:](self, "updateSelfWithRect:", x, y, width, height);
  [(UIView *)self layoutIfNeeded];
}

- (void)updateFakeTextSelectionHighlightForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v41[4] = *MEMORY[0x1E4F143B8];
  v6 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];

  if (!v6)
  {
    v7 = objc_alloc_init(UIView);
    [(UIAutocorrectBubbleContainer *)self setFakeTextSelectionHighlight:v7];

    v8 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    v10 = [v9 layer];
    [v10 setCornerRadius:2.0];

    v11 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    id v12 = [v11 layer];
    [v12 setMaskedCorners:3];

    v13 = +[UIColor systemBlueColor];
    v14 = [v13 colorWithAlphaComponent:0.349999994];
    v15 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    [v15 setBackgroundColor:v14];
  }
  v16 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
  v17 = [v16 superview];

  if (v17 != self)
  {
    v18 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    [(UIView *)self addSubview:v18];

    v19 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    v20 = [v19 widthAnchor];
    v21 = [v20 constraintEqualToConstant:0.0];
    [(UIAutocorrectBubbleContainer *)self setHighlightWidthConstraint:v21];

    v36 = (void *)MEMORY[0x1E4F5B268];
    v40 = [(UIAutocorrectBubbleContainer *)self highlightWidthConstraint];
    v41[0] = v40;
    v39 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    v38 = [v39 leadingAnchor];
    v37 = [(UIView *)self leadingAnchor];
    v22 = [v38 constraintEqualToAnchor:v37];
    v41[1] = v22;
    v23 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    v24 = [v23 topAnchor];
    v25 = [(UIView *)self topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v41[2] = v26;
    v27 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    v28 = [v27 heightAnchor];
    v29 = [v28 constraintEqualToConstant:height];
    v41[3] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
    [v36 activateConstraints:v30];

    v31 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
    [(UIView *)self bringSubviewToFront:v31];
  }
  v32 = [(UIAutocorrectBubbleContainer *)self highlightWidthConstraint];
  [v32 constant];
  double v34 = v33;

  if (v34 != width)
  {
    v35 = [(UIAutocorrectBubbleContainer *)self highlightWidthConstraint];
    [v35 setConstant:width];
  }
}

- (void)updateBubbleWithAutocorrectionText:(id)a3 referenceRect:(CGRect)a4
{
  double height = a4.size.height;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(UIAutocorrectBubbleContainer *)self bubble];

  if (!v7)
  {
    v8 = objc_alloc_init(UIAutocorrectBubble);
    [(UIAutocorrectBubbleContainer *)self setBubble:v8];

    v9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_didTapAutocorrectionBubble];
    v10 = [(UIAutocorrectBubbleContainer *)self bubble];
    [v10 addGestureRecognizer:v9];
  }
  v11 = [(UIView *)self subviews];
  id v12 = [(UIAutocorrectBubbleContainer *)self bubble];
  char v13 = [v11 containsObject:v12];

  if ((v13 & 1) == 0)
  {
    v14 = [(UIAutocorrectBubbleContainer *)self bubble];
    [(UIView *)self addSubview:v14];

    v15 = [(UIAutocorrectBubbleContainer *)self bubble];
    [(UIView *)self bringSubviewToFront:v15];

    v16 = [(UIAutocorrectBubbleContainer *)self bubble];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(UIAutocorrectBubbleContainer *)self bubble];
    v18 = [v17 topAnchor];
    v19 = [(UIView *)self topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:height];
    [(UIAutocorrectBubbleContainer *)self setBubbleTopConstraint:v20];

    v21 = (void *)MEMORY[0x1E4F5B268];
    v22 = [(UIAutocorrectBubbleContainer *)self bubbleTopConstraint];
    v29[0] = v22;
    v23 = [(UIAutocorrectBubbleContainer *)self bubble];
    v24 = [v23 leadingAnchor];
    v25 = [(UIView *)self leadingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:0.0];
    v29[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v21 activateConstraints:v27];
  }
  v28 = [(UIAutocorrectBubbleContainer *)self bubble];
  [v28 updateWithAutocorrectionText:v6];
}

- (void)updateSelfWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v39[4] = *MEMORY[0x1E4F143B8];
  [(UIAutocorrectBubbleContainer *)self referenceRect];
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  if (!CGRectEqualToRect(v40, v41))
  {
    uint64_t v8 = [(UIAutocorrectBubbleContainer *)self xConstraint];
    if (!v8) {
      goto LABEL_9;
    }
    v9 = (void *)v8;
    uint64_t v10 = [(UIAutocorrectBubbleContainer *)self yConstraint];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [(UIAutocorrectBubbleContainer *)self widthConstraint];
      if (v12)
      {
        char v13 = (void *)v12;
        v14 = [(UIAutocorrectBubbleContainer *)self heightConstraint];

        if (v14)
        {
LABEL_13:
          v37 = [(UIAutocorrectBubbleContainer *)self xConstraint];
          [v37 setConstant:x];

          v38 = [(UIAutocorrectBubbleContainer *)self yConstraint];
          [v38 setConstant:y];

          -[UIAutocorrectBubbleContainer setReferenceRect:](self, "setReferenceRect:", x, y, width, height);
          return;
        }
LABEL_9:
        v15 = [(UIView *)self widthAnchor];
        v16 = [(UIAutocorrectBubbleContainer *)self bubble];
        v17 = [v16 widthAnchor];
        v18 = [v15 constraintEqualToAnchor:v17];
        [(UIAutocorrectBubbleContainer *)self setWidthConstraint:v18];

        v19 = [(UIView *)self heightAnchor];
        v20 = [v19 constraintEqualToConstant:height + 19.0];
        [(UIAutocorrectBubbleContainer *)self setHeightConstraint:v20];

        v21 = [(UIView *)self leftAnchor];
        uint64_t v22 = [(UIView *)self superview];
        v23 = [(id)v22 leftAnchor];
        v24 = [v21 constraintEqualToAnchor:v23 constant:x];
        [(UIAutocorrectBubbleContainer *)self setXConstraint:v24];

        v25 = [(UIView *)self superview];
        objc_opt_class();
        LOBYTE(v22) = objc_opt_isKindOfClass();

        if (v22)
        {
          v26 = [(UIView *)self superview];
          v27 = [(UIView *)self topAnchor];
          v28 = [v26 contentLayoutGuide];
          v29 = [v28 topAnchor];
          v30 = [v27 constraintEqualToAnchor:v29 constant:y];
          [(UIAutocorrectBubbleContainer *)self setYConstraint:v30];
        }
        else
        {
          v26 = [(UIView *)self topAnchor];
          v27 = [(UIView *)self superview];
          v28 = [v27 topAnchor];
          v29 = [v26 constraintEqualToAnchor:v28 constant:y];
          [(UIAutocorrectBubbleContainer *)self setYConstraint:v29];
        }

        v31 = (void *)MEMORY[0x1E4F5B268];
        v32 = [(UIAutocorrectBubbleContainer *)self widthConstraint];
        v39[0] = v32;
        double v33 = [(UIAutocorrectBubbleContainer *)self heightConstraint];
        v39[1] = v33;
        double v34 = [(UIAutocorrectBubbleContainer *)self xConstraint];
        v39[2] = v34;
        v35 = [(UIAutocorrectBubbleContainer *)self yConstraint];
        v39[3] = v35;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
        [v31 activateConstraints:v36];

        goto LABEL_13;
      }
    }
    goto LABEL_9;
  }
}

- (id)createTypedTextViewWithTypedText:(id)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_alloc_init(UITextView);
  [(UITextView *)v5 setText:v4];

  id v6 = +[UIColor whiteColor];
  [(UITextView *)v5 setTextColor:v6];

  v7 = +[UIColor blackColor];
  [(UIView *)v5 setBackgroundColor:v7];

  -[UITextView setTextContainerInset:](v5, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = [(UITextView *)v5 textContainer];
  [v8 setLineFragmentPadding:0.0];

  v9 = [off_1E52D39B8 systemFontOfSize:16.0 weight:*(double *)off_1E52D6BF8];
  [(UITextView *)v5 setFont:v9];

  [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v5 setAlpha:1.0];
  [(UIView *)self addSubview:v5];
  uint64_t v10 = [(UIAutocorrectBubbleContainer *)self bubble];
  [(UIView *)self insertSubview:v5 below:v10];

  uint64_t v22 = (void *)MEMORY[0x1E4F5B268];
  v23 = [(UIView *)v5 widthAnchor];
  v24 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
  [v24 size];
  v11 = objc_msgSend(v23, "constraintEqualToConstant:");
  v25[0] = v11;
  uint64_t v12 = [(UIView *)v5 heightAnchor];
  char v13 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
  [v13 size];
  v15 = [v12 constraintLessThanOrEqualToConstant:v14];
  v25[1] = v15;
  v16 = [(UIView *)v5 leadingAnchor];
  v17 = [(UIView *)self leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v25[2] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  [v22 activateConstraints:v19];

  [(UIAutocorrectBubbleContainer *)self setTypedTextAnimationPlaceholder:v5];
  v20 = [(UIAutocorrectBubbleContainer *)self typedTextAnimationPlaceholder];

  return v20;
}

- (void)dismissAutocorrectBubble
{
  v3 = +[UIKeyboardImpl activeInstance];
  [v3 fadeAutocorrectPrompt];

  [(UIAutocorrectBubbleContainer *)self performReset];
}

- (void)animateAutocorrectionAccepted
{
  v3 = [(UIAutocorrectBubbleContainer *)self typedText];
  id v4 = [(UIAutocorrectBubbleContainer *)self createTypedTextViewWithTypedText:v3];

  [(UIView *)self layoutIfNeeded];
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_5;
  v5[3] = &unk_1E52DC3A0;
  +[UIView animateKeyframesWithDuration:0 delay:v6 options:v5 animations:0.5 completion:0.0];
}

uint64_t __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_2;
  v5[3] = &unk_1E52D9F70;
  v5[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v5 relativeDuration:0.0 animations:0.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_3;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_4;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.75 animations:0.25];
}

void __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) fakeTextSelectionHighlight];
  [v1 setAlpha:0.0];
}

uint64_t __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bubbleTopConstraint];
  [v2 setConstant:1.0];

  v3 = *(void **)(a1 + 32);
  return [v3 layoutIfNeeded];
}

void __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) typedTextAnimationPlaceholder];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) bubble];
  [v3 setAlpha:0.0];
}

uint64_t __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) performReset];
}

- (void)reset
{
  if (![(UIAutocorrectBubbleContainer *)self isViewAnimating])
  {
    [(UIAutocorrectBubbleContainer *)self performReset];
  }
}

- (BOOL)isViewAnimating
{
  v2 = [(UIAutocorrectBubbleContainer *)self bubble];
  id v3 = [v2 layer];
  id v4 = [v3 animationKeys];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)performReset
{
  [(UIAutocorrectBubbleContainer *)self setBubbleTopConstraint:0];
  [(UIAutocorrectBubbleContainer *)self setHighlightWidthConstraint:0];
  [(UIAutocorrectBubbleContainer *)self setWidthConstraint:0];
  [(UIAutocorrectBubbleContainer *)self setHeightConstraint:0];
  [(UIAutocorrectBubbleContainer *)self setXConstraint:0];
  [(UIAutocorrectBubbleContainer *)self setYConstraint:0];
  -[UIAutocorrectBubbleContainer setReferenceRect:](self, "setReferenceRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  id v3 = [(UIAutocorrectBubbleContainer *)self fakeTextSelectionHighlight];
  [v3 removeFromSuperview];

  id v4 = [(UIAutocorrectBubbleContainer *)self bubble];
  [v4 removeFromSuperview];

  [(UIAutocorrectBubbleContainer *)self setFakeTextSelectionHighlight:0];
  [(UIAutocorrectBubbleContainer *)self setBubble:0];
  BOOL v5 = [(UIAutocorrectBubbleContainer *)self typedTextAnimationPlaceholder];
  [v5 removeFromSuperview];

  [(UIAutocorrectBubbleContainer *)self setTypedTextAnimationPlaceholder:0];
  [(UIView *)self removeFromSuperview];
}

- (NSString)typedText
{
  return self->_typedText;
}

- (void)setTypedText:(id)a3
{
}

- (CGRect)referenceRect
{
  double x = self->_referenceRect.origin.x;
  double y = self->_referenceRect.origin.y;
  double width = self->_referenceRect.size.width;
  double height = self->_referenceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setReferenceRect:(CGRect)a3
{
  self->_referenceRect = a3;
}

- (UIAutocorrectBubble)bubble
{
  return self->_bubble;
}

- (void)setBubble:(id)a3
{
}

- (UIView)fakeTextSelectionHighlight
{
  return self->_fakeTextSelectionHighlight;
}

- (void)setFakeTextSelectionHighlight:(id)a3
{
}

- (UIView)typedTextAnimationPlaceholder
{
  return self->_typedTextAnimationPlaceholder;
}

- (void)setTypedTextAnimationPlaceholder:(id)a3
{
}

- (NSLayoutConstraint)highlightWidthConstraint
{
  return self->_highlightWidthConstraint;
}

- (void)setHighlightWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)bubbleTopConstraint
{
  return self->_bubbleTopConstraint;
}

- (void)setBubbleTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)xConstraint
{
  return self->_xConstraint;
}

- (void)setXConstraint:(id)a3
{
}

- (NSLayoutConstraint)yConstraint
{
  return self->_yConstraint;
}

- (void)setYConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_yConstraint, 0);
  objc_storeStrong((id *)&self->_xConstraint, 0);
  objc_storeStrong((id *)&self->_bubbleTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightWidthConstraint, 0);
  objc_storeStrong((id *)&self->_typedTextAnimationPlaceholder, 0);
  objc_storeStrong((id *)&self->_fakeTextSelectionHighlight, 0);
  objc_storeStrong((id *)&self->_bubble, 0);
  objc_storeStrong((id *)&self->_typedText, 0);
}

@end