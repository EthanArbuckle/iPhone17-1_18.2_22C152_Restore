@interface PKMemoIconCell
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (PKMemoIconCellDelegate)delegate;
- (PKMemoItem)item;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)showEmojiKeyboardIfNeeded;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation PKMemoIconCell

- (void)showEmojiKeyboardIfNeeded
{
  v3 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  v4 = [v3 currentInputMode];
  id v5 = [v4 normalizedIdentifier];

  if (([v5 isEqualToString:*MEMORY[0x1E4FB2BF0]] & 1) == 0) {
    [(UITextView *)self->_emojiTextView resignFirstResponder];
  }
  [(UITextView *)self->_emojiTextView becomeFirstResponder];
}

- (void)setItem:(id)a3
{
  id v28 = a3;
  p_item = &self->_item;
  objc_storeStrong((id *)&self->_item, a3);
  unint64_t v6 = [(PKMemoItem *)self->_item type];
  switch(v6)
  {
    case 0uLL:
    case 3uLL:
      v7 = [(PKMemoItem *)*p_item memo];
      v8 = [v7 emoji];
      uint64_t v9 = [v8 length];

      if (!v9)
      {
        [(UILabel *)self->_emojiLabel removeFromSuperview];
        emojiLabel = self->_emojiLabel;
        self->_emojiLabel = 0;
      }
      [(UITextView *)self->_emojiTextView removeFromSuperview];
      emojiTextView = self->_emojiTextView;
      self->_emojiTextView = 0;

      goto LABEL_5;
    case 1uLL:
      [(UILabel *)self->_emojiLabel removeFromSuperview];
      v17 = self->_emojiLabel;
      self->_emojiLabel = 0;

      [(UITextView *)self->_emojiTextView removeFromSuperview];
      v18 = self->_emojiTextView;
      self->_emojiTextView = 0;

      v12 = [(PKMemoIconCell *)self contentView];
      goto LABEL_18;
    case 2uLL:
      [(UILabel *)self->_emojiLabel removeFromSuperview];
      v19 = self->_emojiLabel;
      self->_emojiLabel = 0;

      v12 = [(PKMemoIconCell *)self contentView];
      goto LABEL_14;
    default:
LABEL_5:
      v12 = [(PKMemoIconCell *)self contentView];
      if (v6 == 3) {
        goto LABEL_8;
      }
      if (v6 == 2)
      {
LABEL_14:
        v20 = self->_emojiTextView;
        if (!v20)
        {
          v21 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
          v22 = self->_emojiTextView;
          self->_emojiTextView = v21;

          v23 = self->_emojiTextView;
          v24 = [MEMORY[0x1E4FB1618] whiteColor];
          [(UITextView *)v23 setTintColor:v24];

          v25 = self->_emojiTextView;
          v26 = [MEMORY[0x1E4FB1618] clearColor];
          [(UITextView *)v25 setBackgroundColor:v26];

          [(UITextView *)self->_emojiTextView setScrollEnabled:0];
          [(UITextView *)self->_emojiTextView setTextAlignment:1];
          [(UITextView *)self->_emojiTextView setDelegate:self];
          [(UITextView *)self->_emojiTextView setKeyboardType:124];
          [(UITextView *)self->_emojiTextView setAutocorrectionType:1];
          [v12 addSubview:self->_emojiTextView];
          v20 = self->_emojiTextView;
        }
        v14 = [(PKMemoItem *)*p_item memo];
        v27 = [v14 emoji];
        [(UITextView *)v20 setText:v27];
      }
      else
      {
        if (v6) {
          goto LABEL_18;
        }
LABEL_8:
        v13 = [(PKMemoItem *)*p_item memo];
        v14 = [v13 emoji];

        if (!self->_emojiLabel && [v14 length])
        {
          v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
          v16 = self->_emojiLabel;
          self->_emojiLabel = v15;

          [(UILabel *)self->_emojiLabel setTextAlignment:1];
          [v12 addSubview:self->_emojiLabel];
        }
        [(UILabel *)self->_emojiLabel setText:v14];
      }

LABEL_18:
      [(PKMemoIconCell *)self setNeedsUpdateConfiguration];

      return;
  }
}

- (void)layoutSubviews
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)PKMemoIconCell;
  [(PKMemoIconCell *)&v45 layoutSubviews];
  [(PKMemoIconCell *)self bounds];
  if (v3 != self->_priorBoundsSize.width || v4 != self->_priorBoundsSize.height)
  {
    self->_priorBoundsSize.width = v3;
    self->_priorBoundsSize.height = v4;
    [(PKMemoIconCell *)self setNeedsUpdateConfiguration];
  }
  unint64_t v6 = [(PKMemoIconCell *)self contentView];
  [v6 bounds];
  double v8 = v7;
  PKSizeAlignedInRect();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = v8 * 0.55;
  unint64_t v18 = [(PKMemoItem *)self->_item type];
  switch(v18)
  {
    case 3uLL:
      goto LABEL_9;
    case 2uLL:
      -[UITextView setFrame:](self->_emojiTextView, "setFrame:", v10, v12, v14, v16);
      v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v17];
      v22 = [MEMORY[0x1E4FB1910] sharedInputModeController];
      v23 = [v22 currentInputMode];
      unsigned int v24 = [v23 isDefaultRightToLeft];

      id v25 = objc_alloc_init(MEMORY[0x1E4FB0860]);
      v26 = [(UITextView *)self->_emojiTextView text];
      [v6 bounds];
      double v28 = v27;
      double v30 = v29;
      uint64_t v31 = *MEMORY[0x1E4FB0818];
      v47[0] = *MEMORY[0x1E4FB06F8];
      v47[1] = v31;
      v48[0] = v21;
      v32 = [NSNumber numberWithInteger:v24];
      v46 = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      v48[1] = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
      objc_msgSend(v26, "boundingRectWithSize:options:attributes:context:", 33, v34, v25, v28, v30);
      double v36 = v35;

      [(UITextView *)self->_emojiTextView contentOffset];
      double v38 = v37;
      v39 = [(UITextView *)self->_emojiTextView textContainer];
      [v39 size];
      double v41 = v40;
      [(UITextView *)self->_emojiTextView zoomScale];
      double v43 = (v41 - v36 * v42) * 0.5;

      double v44 = 0.0;
      if (v43 >= 0.0) {
        double v44 = v43;
      }
      -[UITextView setContentOffset:](self->_emojiTextView, "setContentOffset:", v38, -v44);
      [(UITextView *)self->_emojiTextView setFont:v21];

      break;
    case 0uLL:
LABEL_9:
      emojiLabel = self->_emojiLabel;
      v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v17];
      [(UILabel *)emojiLabel setFont:v20];

      -[UILabel setFrame:](self->_emojiLabel, "setFrame:", v10, v12, v14, v16);
      break;
  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)PKMemoIconCell;
  [(PKMemoIconCell *)&v29 updateConfigurationUsingState:a3];
  double v4 = [(PKMemoIconCell *)self backgroundConfiguration];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PKMemoIconCell *)self defaultBackgroundConfiguration];
  }
  double v7 = v6;

  double v8 = [(PKMemoItem *)self->_item memo];
  uint64_t v9 = [v8 color];
  [v7 setCornerRadius:10.0];
  if (v9) {
    PKPeerPaymentMessageColorFromSemanticColor(v9);
  }
  else {
  double v10 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
  }
  [v7 setBackgroundColor:v10];

  double v11 = 0;
  unint64_t v12 = [(PKMemoItem *)self->_item type];
  switch(v12)
  {
    case 0uLL:
      double v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [v7 setStrokeColor:v16];

      [v7 setStrokeOutset:1.0];
      double v11 = 0;
      break;
    case 1uLL:
    case 3uLL:
      double v13 = [(PKMemoItem *)self->_item memo];
      double v14 = [v13 emoji];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        double v11 = 0;
      }
      else
      {
        double v17 = [MEMORY[0x1E4FB1830] configurationWithPointSize:self->_priorBoundsSize.height * 0.6];
        unint64_t v18 = (void *)MEMORY[0x1E4FB1830];
        v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v30[0] = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        v21 = [v18 configurationWithPaletteColors:v20];
        v22 = [v17 configurationByApplyingConfiguration:v21];

        if (v12 == 1) {
          v23 = @"plus";
        }
        else {
          v23 = @"emoji.face.grinning";
        }
        double v11 = [MEMORY[0x1E4FB1818] _systemImageNamed:v23 withConfiguration:v22];
        [v7 setImageContentMode:4];
      }
      goto LABEL_15;
    case 2uLL:
LABEL_15:
      [v7 setStrokeWidth:0.0];
      break;
    default:
      break;
  }
  [v7 setImage:v11];
  double height = self->_priorBoundsSize.height;
  if (self->_priorBoundsSize.width == height)
  {
    double v26 = *MEMORY[0x1E4FB12A8];
    double v25 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v27 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v28 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  }
  else
  {
    double v25 = (self->_priorBoundsSize.width - height) * 0.5;
    double v26 = 0.0;
    double v27 = 0.0;
    double v28 = v25;
  }
  objc_msgSend(v7, "setBackgroundInsets:", v26, v25, v27, v28);
  [(PKMemoIconCell *)self setBackgroundConfiguration:v7];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  double v11 = [v9 text];
  unint64_t v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  if ([v12 length] && !CEMStringIsSingleEmoji())
  {
    if (!CEMStringIsSingleEmoji())
    {
      BOOL v16 = 0;
      goto LABEL_6;
    }
    [v9 setText:v10];
    v19 = [(PKMemoItem *)self->_item memo];
    [v19 setEmoji:v10];

    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    BOOL v16 = 0;
    if (WeakRetained) {
      goto LABEL_4;
    }
  }
  else
  {
    double v13 = [(PKMemoItem *)self->_item memo];
    [v13 setEmoji:v12];

    p_delegate = &self->_delegate;
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);

    BOOL v16 = 1;
    if (v15)
    {
LABEL_4:
      id v17 = objc_loadWeakRetained((id *)p_delegate);
      [v17 cell:self didUpdateText:v12];
    }
  }
  [(PKMemoIconCell *)self setNeedsLayout];
LABEL_6:

  return v16;
}

- (PKMemoItem)item
{
  return self->_item;
}

- (PKMemoIconCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKMemoIconCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_emojiTextView, 0);

  objc_storeStrong((id *)&self->_emojiLabel, 0);
}

@end