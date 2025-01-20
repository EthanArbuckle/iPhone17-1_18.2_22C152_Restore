@interface PUPhotoCommentEntryView
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (BOOL)textViewShouldEndEditing:(id)a3;
- (PUPhotoCommentEntryView)initWithFrame:(CGRect)a3;
- (PUPhotoCommentEntryViewDelegate)delegate;
- (UIButton)postButton;
- (UILabel)placeholderLabel;
- (UITextView)textView;
- (double)preferredHeight;
- (id)trimmedText;
- (void)clearText;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation PUPhotoCommentEntryView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_postButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->placeholderLabel, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoCommentEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoCommentEntryViewDelegate *)WeakRetained;
}

- (UIButton)postButton
{
  return self->_postButton;
}

- (UITextView)textView
{
  return self->_textView;
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)textViewDidEndEditing:(id)a3
{
  [(UIButton *)self->_postButton setHidden:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained photoCommentEntryViewDidEndEditing:self];
}

- (void)textViewDidBeginEditing:(id)a3
{
  [(UIButton *)self->_postButton setHidden:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 photoCommentEntryViewDidBeginEditing:self];
  }
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = [v7 photoCommentEntryViewShouldEndEditing:self];

  return v8;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained photoCommentEntryViewWillBeginEditing:self];

  char v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    placeholderLabel = self->_placeholderLabel;
    [(UILabel *)placeholderLabel frame];
    double v10 = v9;
    [(UILabel *)self->_placeholderLabel frame];
    double v12 = v11;
    [(UITextView *)self->_textView frame];
    double v14 = v13;
    [(UILabel *)self->_placeholderLabel frame];
    -[UILabel setFrame:](placeholderLabel, "setFrame:", v10, v12, v14);
  }
  return 1;
}

- (void)textViewDidChange:(id)a3
{
  id v10 = [(PUPhotoCommentEntryView *)self trimmedText];
  BOOL v4 = [v10 length] != 0;
  uint64_t v5 = [(UITextView *)self->_textView hasText];
  [(UIButton *)self->_postButton setEnabled:v4];
  [(UILabel *)self->_placeholderLabel setHidden:v5];
  [(PUPhotoCommentEntryView *)self frame];
  double v7 = v6;
  [(PUPhotoCommentEntryView *)self preferredHeight];
  if (v7 != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained photoCommentEntryViewHeightDidChange:self];
  }
}

- (void)layoutSubviews
{
  [(PUPhotoCommentEntryView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPhotoCommentEntryView semanticContentAttribute](self, "semanticContentAttribute"));
  [(UITextView *)self->_textView textContainerInset];
  double v39 = v12;
  [(UIButton *)self->_postButton frame];
  double v14 = v13;
  double v16 = v15;
  if (v11) {
    double v17 = 15.0;
  }
  else {
    double v17 = v8 - v13 + -15.0;
  }
  id v40 = [(UIButton *)self->_postButton titleLabel];
  [v40 _lastLineBaseline];
  -[UIButton convertPoint:fromView:](self->_postButton, "convertPoint:fromView:", v40, 0.0, v18);
  -[UIButton setFrame:](self->_postButton, "setFrame:", v17, v10 - v16 + -22.0 + v16 - v19, v14, v16);
  [(UIButton *)self->_postButton layoutIfNeeded];
  double v20 = v8 + -10.0 - v14 + -5.0 + -15.0;
  double v21 = v10 + -1.0 + -6.0 + -3.0;
  if (v11)
  {
    v42.origin.x = v4;
    v42.origin.y = v6;
    v42.size.width = v8;
    v42.size.height = v10;
    double v22 = CGRectGetMaxX(v42) - v20 + -10.0;
  }
  else
  {
    double v22 = 10.0;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v22, 7.0, v20, v21);
  [(UILabel *)self->_placeholderLabel frame];
  double v24 = v23;
  double v26 = v25;
  [(UITextView *)self->_textView frame];
  CGFloat v28 = v27;
  double v30 = v29;
  if (v11)
  {
    v43.origin.y = 7.0;
    v43.origin.x = v22;
    v43.size.width = v20;
    v43.size.height = v21;
    double MaxX = CGRectGetMaxX(v43);
    v44.origin.x = v28;
    v44.origin.y = v30;
    v44.size.width = v24;
    v44.size.height = v26;
    double v32 = MaxX - CGRectGetWidth(v44) + -5.0;
  }
  else
  {
    double v32 = v27 + 5.0;
  }
  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v32, v39 + v30, v24, v26);
  v33 = [MEMORY[0x1E4FB1438] sharedApplication];
  v34 = [v33 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v34);

  if (IsAccessibilityCategory)
  {
    postButton = self->_postButton;
    [(UIButton *)postButton center];
    double v38 = v37;
    [(UILabel *)self->_placeholderLabel center];
    [(UIButton *)postButton setCenter:v38];
  }
}

- (id)trimmedText
{
  v2 = [(UITextView *)self->_textView text];
  double v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  CGFloat v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(UITextView *)self->_textView setText:v4];
    [(UILabel *)self->_placeholderLabel setHidden:1];
    [(UIButton *)self->_postButton setEnabled:1];
  }
}

- (void)clearText
{
  [(UITextView *)self->_textView setText:0];
  [(UILabel *)self->_placeholderLabel setHidden:0];
  postButton = self->_postButton;
  [(UIButton *)postButton setEnabled:0];
}

- (double)preferredHeight
{
  double v3 = [(UITextView *)self->_textView layoutManager];
  id v4 = [(UITextView *)self->_textView textContainer];
  [v3 ensureLayoutForTextContainer:v4];

  [(UITextView *)self->_textView layoutIfNeeded];
  [(UITextView *)self->_textView contentSize];
  if (v5 < 0.0) {
    return 44.0;
  }
  double v7 = v5 + 1.0 + 6.0 + 3.0;
  double result = 44.0;
  if (v7 >= 44.0)
  {
    double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1)
    {
      double v10 = 80.0;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
      unint64_t v12 = [v11 statusBarOrientation] - 1;

      if (v12 >= 2) {
        double v10 = 40.0;
      }
      else {
        double v10 = 60.0;
      }
    }
    [(UITextView *)self->_textView textContainerInset];
    double result = v14 + v10 + v13 + 1.0 + 6.0 + 3.0;
    if (v7 <= result) {
      return v7;
    }
  }
  return result;
}

- (PUPhotoCommentEntryView)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)PUPhotoCommentEntryView;
  double v3 = -[PUPhotoCommentEntryView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    postButton = v3->_postButton;
    v3->_postButton = (UIButton *)v4;

    CGFloat v6 = v3->_postButton;
    double v7 = PLLocalizedFrameworkString();
    [(UIButton *)v6 setTitle:v7 forState:0];

    double v8 = [(UIButton *)v3->_postButton titleLabel];
    uint64_t v9 = [MEMORY[0x1E4F8A5D8] sharedCache];
    double v10 = [v9 commentSendButtonFont];
    [v8 setFont:v10];

    [(UIButton *)v3->_postButton sizeToFit];
    [(UIButton *)v3->_postButton setHidden:1];
    [(UIButton *)v3->_postButton layoutIfNeeded];
    id v11 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    textView = v3->_textView;
    v3->_textView = (UITextView *)v16;

    [(UITextView *)v3->_textView setDelegate:v3];
    double v18 = v3->_textView;
    double v19 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v18 setTextColor:v19];

    double v20 = v3->_textView;
    double v21 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v20 setBackgroundColor:v21];

    double v22 = v3->_textView;
    double v23 = [MEMORY[0x1E4F8A5D8] sharedCache];
    double v24 = [v23 commentEntryFont];
    [(UITextView *)v22 setFont:v24];

    [(UITextView *)v3->_textView sizeToFit];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
    placeholderLabel = v3->_placeholderLabel;
    v3->_placeholderLabel = (UILabel *)v25;

    double v27 = v3->_placeholderLabel;
    CGFloat v28 = [MEMORY[0x1E4FB1618] placeholderTextColor];
    [(UILabel *)v27 setTextColor:v28];

    double v29 = v3->_placeholderLabel;
    double v30 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v29 setBackgroundColor:v30];

    v31 = v3->_placeholderLabel;
    double v32 = [MEMORY[0x1E4F8A5D8] sharedCache];
    v33 = [v32 commentEntryFont];
    [(UILabel *)v31 setFont:v33];

    v34 = v3->_placeholderLabel;
    v35 = PLLocalizedFrameworkString();
    [(UILabel *)v34 setText:v35];

    [(UILabel *)v3->_placeholderLabel sizeToFit];
    [(PUPhotoCommentEntryView *)v3 addSubview:v3->_placeholderLabel];
    [(PUPhotoCommentEntryView *)v3 addSubview:v3->_textView];
    [(UITextView *)v3->_textView setScrollsToTop:0];
    [(PUPhotoCommentEntryView *)v3 addSubview:v3->_postButton];
    [(PUPhotoCommentEntryView *)v3 clearText];
  }
  return v3;
}

@end