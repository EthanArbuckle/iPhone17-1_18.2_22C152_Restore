@interface PKLabelViewController
- (NSAttributedString)attributedText;
- (PKLabelViewController)init;
- (PKLabelViewController)initWithAttributedText:(id)a3;
- (UIEdgeInsets)contentInsets;
- (void)loadView;
- (void)setAttributedText:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKLabelViewController

- (PKLabelViewController)init
{
  return 0;
}

- (PKLabelViewController)initWithAttributedText:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKLabelViewController;
  v5 = [(PKLabelViewController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v6;

    long long v8 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v5->_contentInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v5->_contentInsets.bottom = v8;
  }

  return v5;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)PKLabelViewController;
  [(PKLabelViewController *)&v8 loadView];
  objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  [(UITextView *)self->_textView setAttributedText:self->_attributedText];
  [(UITextView *)self->_textView setTextAlignment:1];
  v5 = self->_textView;
  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITextView *)v5 setBackgroundColor:v6];

  [(UITextView *)self->_textView setEditable:0];
  v7 = [(PKLabelViewController *)self view];
  [v7 addSubview:self->_textView];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKLabelViewController;
  [(PKLabelViewController *)&v9 viewWillLayoutSubviews];
  textView = self->_textView;
  id v4 = [(PKLabelViewController *)self view];
  [v4 bounds];
  -[UITextView setFrame:](textView, "setFrame:", v5 + self->_contentInsets.left, v6 + self->_contentInsets.top, v7 - (self->_contentInsets.left + self->_contentInsets.right), v8 - (self->_contentInsets.top + self->_contentInsets.bottom));
}

- (void)setAttributedText:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToAttributedString:self->_attributedText] & 1) == 0)
  {
    id v4 = (NSAttributedString *)[v7 copy];
    attributedText = self->_attributedText;
    self->_attributedText = v4;

    double v6 = [(PKLabelViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    id v6 = [(PKLabelViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];
  }
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end