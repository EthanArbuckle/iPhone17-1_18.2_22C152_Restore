@interface WFTextScrollView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)isAdjustmentEnabled;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGSize)intrinsicContentSize;
- (UITextView)textView;
- (UITextViewDelegate)textViewDelegate;
- (WFTextScrollView)initWithTextView:(id)a3;
- (_NSRange)selectedRange;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustmentEnabled:(BOOL)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setTextViewDelegate:(id)a3;
- (void)textUpdated;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation WFTextScrollView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textViewDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (_NSRange)selectedRange
{
  p_selectedRange = &self->_selectedRange;
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = p_selectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextViewDelegate:(id)a3
{
}

- (UITextViewDelegate)textViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textViewDelegate);
  return (UITextViewDelegate *)WeakRetained;
}

- (void)setAdjustmentEnabled:(BOOL)a3
{
  self->_adjustmentEnabled = a3;
}

- (BOOL)isAdjustmentEnabled
{
  return self->_adjustmentEnabled;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFTextScrollView;
  if (-[WFTextScrollView respondsToSelector:](&v8, sel_respondsToSelector_, [v4 selector]))
  {
    [v4 invokeWithTarget:self];
  }
  else
  {
    v5 = [(WFTextScrollView *)self textViewDelegate];
    [v4 selector];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(WFTextScrollView *)self textViewDelegate];
      [v4 invokeWithTarget:v7];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFTextScrollView;
  if (-[WFTextScrollView respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFTextScrollView;
    v5 = [(WFTextScrollView *)&v8 methodSignatureForSelector:a3];
  }
  else
  {
    char v6 = [(WFTextScrollView *)self textViewDelegate];
    v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFTextScrollView;
  if (-[WFTextScrollView respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(WFTextScrollView *)self textViewDelegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v7 = a3;
  char v4 = [(WFTextScrollView *)self textViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(WFTextScrollView *)self textViewDelegate];
    [v6 textViewDidEndEditing:v7];
  }
  if ([(WFTextScrollView *)self isFirstResponder]) {
    [(WFTextScrollView *)self resignFirstResponder];
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v18 = a3;
  char v4 = [(WFTextScrollView *)self textViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(WFTextScrollView *)self textViewDelegate];
    [v6 textViewDidChangeSelection:v18];
  }
  if (!self->_adjustmentEnabled)
  {
    -[WFTextScrollView setContentOffset:](self, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    goto LABEL_12;
  }
  unint64_t v7 = [(WFTextScrollView *)self selectedRange];
  uint64_t v8 = [v18 selectedRange];
  -[WFTextScrollView setSelectedRange:](self, "setSelectedRange:", v8, v9);
  unint64_t v10 = [(WFTextScrollView *)self selectedRange];
  v11 = [v18 selectedTextRange];
  v12 = v11;
  if (v10 >= v7)
  {
    v17 = [v11 end];
    v14 = [v18 positionFromPosition:v17 offset:1];

    if (!v14)
    {
      v15 = [v18 selectedTextRange];
      uint64_t v16 = [v15 end];
      goto LABEL_10;
    }
  }
  else
  {
    v13 = [v11 start];
    v14 = [v18 positionFromPosition:v13 offset:-1];

    if (!v14)
    {
      v15 = [v18 selectedTextRange];
      uint64_t v16 = [v15 start];
LABEL_10:
      v14 = (void *)v16;
    }
  }
  [v18 caretRectForPosition:v14];
  -[WFTextScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0);

LABEL_12:
}

- (void)textUpdated
{
  [(WFTextScrollView *)self invalidateIntrinsicContentSize];
  if (self->_adjustmentEnabled)
  {
    [(WFTextScrollView *)self setNeedsLayout];
    [(WFTextScrollView *)self layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)WFTextScrollView;
  [(WFTextScrollView *)&v31 layoutSubviews];
  if (!self->_adjustmentEnabled)
  {
    [(WFTextScrollView *)self frame];
    -[WFTextScrollView setContentSize:](self, "setContentSize:", v25, v26);
    [(WFTextScrollView *)self frame];
    double v28 = v27;
    [(WFTextScrollView *)self frame];
    double v30 = v29;
    v20 = [(WFTextScrollView *)self textView];
    unint64_t v7 = v20;
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = v28;
    double v24 = v30;
    goto LABEL_13;
  }
  [(WFTextScrollView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  unint64_t v7 = [(WFTextScrollView *)self textView];
  uint64_t v8 = [(WFTextScrollView *)self textView];
  uint64_t v9 = [v8 attributedText];
  [v9 size];
  double v11 = v10 + 10.0;

  if (v11 >= v4) {
    double v12 = v11;
  }
  else {
    double v12 = v4;
  }
  v32.size.double width = ceil(v12);
  v32.origin.CGFloat x = 0.0;
  v32.origin.CGFloat y = 0.0;
  v32.size.CGFloat height = v6;
  CGRect v33 = CGRectIntegral(v32);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  double width = v33.size.width;
  CGFloat height = v33.size.height;
  [(WFTextScrollView *)self contentSize];
  if (width != v18 || v6 != v17) {
    -[WFTextScrollView setContentSize:](self, "setContentSize:", width, v6);
  }
  [v7 frame];
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.double width = width;
  v35.size.CGFloat height = height;
  if (!CGRectEqualToRect(v34, v35))
  {
    v20 = v7;
    double v21 = x;
    double v22 = y;
    double v23 = width;
    double v24 = height;
LABEL_13:
    objc_msgSend(v20, "setFrame:", v21, v22, v23, v24);
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(WFTextScrollView *)self textView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isFirstResponder
{
  return [(UITextView *)self->_textView isFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(UITextView *)self->_textView resignFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(UITextView *)self->_textView becomeFirstResponder];
}

- (BOOL)canBecomeFocused
{
  return [(UITextView *)self->_textView canBecomeFocused];
}

- (BOOL)canBecomeFirstResponder
{
  return [(UITextView *)self->_textView canBecomeFirstResponder];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83BE8] object:self->_textView];

  v4.receiver = self;
  v4.super_class = (Class)WFTextScrollView;
  [(WFTextScrollView *)&v4 dealloc];
}

- (WFTextScrollView)initWithTextView:(id)a3
{
  id v5 = a3;
  double v6 = [(WFTextScrollView *)self init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_textView, a3);
    v7->_adjustmentEnabled = 1;
    [v5 setDelegate:v7];
    [(WFTextScrollView *)v7 addSubview:v5];
    double v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_textUpdated name:*MEMORY[0x263F83BE8] object:v5];

    [(WFTextScrollView *)v7 setScrollEnabled:0];
    [(WFTextScrollView *)v7 setScrollsToTop:0];
    LODWORD(v9) = 1132068864;
    [(WFTextScrollView *)v7 setContentCompressionResistancePriority:0 forAxis:v9];
    double v10 = v7;
  }

  return v7;
}

@end