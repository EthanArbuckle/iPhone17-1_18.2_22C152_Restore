@interface TFFeedbackFormLongTextCell
+ (CGSize)_sizeToFitText:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5;
+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6;
+ (UIEdgeInsets)_textViewInsetsInTraitEnvironment:(id)a3;
+ (double)_adjustedTextViewHeightForCandidateHeight:(double)a3 font:(id)a4;
+ (id)_createTextViewFontForTraitCollection:(id)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TFFeedbackEntryLongText)longTextEntry;
- (TFFeedbackFormLongTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextView)textView;
- (unint64_t)displayableDataType;
- (void)_prepareForDisplayWithTraitCollection:(id)a3;
- (void)_updateCellHeightForTextIfNecessary;
- (void)_updateCellHeightForTextUpdatesInTableView:(id)a3;
- (void)applyContentsOfEntry:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisplayedDataString:(id)a3;
- (void)setLongTextEntry:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TFFeedbackFormLongTextCell

- (TFFeedbackFormLongTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackFormLongTextCell;
  v4 = [(TFFeedbackFormBaseCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CAC8]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    v8 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v8];

    [(UITextView *)v4->_textView setDelegate:v4];
    v9 = [(TFFeedbackFormLongTextCell *)v4 traitCollection];
    v10 = +[TFFeedbackFormLongTextCell _createTextViewFontForTraitCollection:v9];
    [(UITextView *)v4->_textView setFont:v10];

    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    v11 = [(UITextView *)v4->_textView textContainer];
    [v11 setLineFragmentPadding:0.0];

    v12 = [(UITextView *)v4->_textView textContainer];
    [v12 setLineBreakMode:0];

    [(UITextView *)v4->_textView setScrollEnabled:0];
    v13 = [(TFFeedbackFormLongTextCell *)v4 contentView];
    [v13 addSubview:v4->_textView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TFFeedbackFormLongTextCell;
  [(TFFeedbackFormBaseCell *)&v21 layoutSubviews];
  [(TFFeedbackFormLongTextCell *)self _updateCellHeightForTextIfNecessary];
  +[TFFeedbackFormLongTextCell _textViewInsetsInTraitEnvironment:self];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TFFeedbackFormLongTextCell *)self contentView];
  [v11 bounds];
  double v13 = v6 + v12;
  double v15 = v4 + v14;
  double v17 = v16 - (v6 + v10);
  double v19 = v18 - (v4 + v8);

  v20 = [(TFFeedbackFormLongTextCell *)self textView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(TFFeedbackFormLongTextCell *)self textView];
  double v7 = [v6 text];
  +[TFFeedbackFormLongTextCell _sizeToFitText:fittingSize:inTraitEnvironment:](TFFeedbackFormLongTextCell, "_sizeToFitText:fittingSize:inTraitEnvironment:", v7, self, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormLongTextCell;
  [(TFFeedbackFormLongTextCell *)&v5 traitCollectionDidChange:a3];
  double v4 = [(TFFeedbackFormLongTextCell *)self traitCollection];
  [(TFFeedbackFormLongTextCell *)self _prepareForDisplayWithTraitCollection:v4];

  [(TFFeedbackFormLongTextCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)TFFeedbackFormLongTextCell;
  [(TFFeedbackFormLongTextCell *)&v10 prepareForReuse];
  double v3 = [(TFFeedbackFormLongTextCell *)self textView];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    objc_super v5 = [(TFFeedbackFormLongTextCell *)self longTextEntry];

    if (v5)
    {
      double v6 = [(TFFeedbackFormBaseCell *)self updateProxy];
      double v7 = [(TFFeedbackFormLongTextCell *)self longTextEntry];
      double v8 = [(TFFeedbackFormLongTextCell *)self textView];
      double v9 = [v8 text];
      [v6 didUpdateEntry:v7 toString:v9 editInProgress:0];
    }
  }
  [(TFFeedbackFormLongTextCell *)self setLongTextEntry:0];
}

- (void)applyContentsOfEntry:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] == 1)
  {
    [(TFFeedbackFormLongTextCell *)self setLongTextEntry:v4];
    objc_super v5 = [MEMORY[0x263F1C550] placeholderTextColor];
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    double v7 = [(TFFeedbackFormLongTextCell *)self longTextEntry];
    double v8 = [v7 placeholder];
    v14[0] = *MEMORY[0x263F1C238];
    double v9 = [(TFFeedbackFormLongTextCell *)self textView];
    objc_super v10 = [v9 font];
    v14[1] = *MEMORY[0x263F1C240];
    v15[0] = v10;
    v15[1] = v5;
    double v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    double v12 = (void *)[v6 initWithString:v8 attributes:v11];
    double v13 = [(TFFeedbackFormLongTextCell *)self textView];
    [v13 setAttributedPlaceholder:v12];
  }
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a6;
  id v13 = v11;
  id v14 = a4;
  double v15 = [v13 identifier];
  double v16 = [v14 stringForIdentifier:v15];

  if (!v16 || ![v16 length])
  {
    uint64_t v17 = [v13 placeholder];

    double v16 = (void *)v17;
  }
  objc_msgSend(a1, "_sizeToFitText:fittingSize:inTraitEnvironment:", v16, v12, width, height);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (unint64_t)displayableDataType
{
  return 0;
}

- (void)setDisplayedDataString:(id)a3
{
  id v4 = a3;
  id v5 = [(TFFeedbackFormLongTextCell *)self textView];
  [v5 setText:v4];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v8 = a3;
  id v4 = [(TFFeedbackFormLongTextCell *)self longTextEntry];

  if (v4)
  {
    id v5 = [(TFFeedbackFormBaseCell *)self updateProxy];
    id v6 = [(TFFeedbackFormLongTextCell *)self longTextEntry];
    double v7 = [v8 text];
    [v5 didUpdateEntry:v6 toString:v7 editInProgress:0];
  }
}

+ (UIEdgeInsets)_textViewInsetsInTraitEnvironment:(id)a3
{
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:a3];

  MEMORY[0x270F05FE0](15);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (CGSize)_sizeToFitText:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5
{
  double width = a4.width;
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  +[TFFeedbackFormLongTextCell _textViewInsetsInTraitEnvironment:v8];
  double v11 = v10;
  double v13 = v12;
  double v16 = width - v14 - v15;
  uint64_t v17 = [v8 traitCollection];

  double v18 = [a1 _createTextViewFontForTraitCollection:v17];

  uint64_t v32 = *MEMORY[0x263F1C238];
  v33[0] = v18;
  double v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 3, v19, 0, v16, 1.79769313e308);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v35.origin.x = v21;
  v35.origin.y = v23;
  v35.size.double width = v25;
  v35.size.double height = v27;
  [a1 _adjustedTextViewHeightForCandidateHeight:v18 font:CGRectGetHeight(v35)];
  double v29 = v28;

  double v30 = ceil(v13 + v11 + v29);
  double v31 = width;
  result.double height = v30;
  result.double width = v31;
  return result;
}

+ (double)_adjustedTextViewHeightForCandidateHeight:(double)a3 font:(id)a4
{
  objc_msgSend(a4, "tf_computeFittedLineHeight");
  double result = v5 * 3.0;
  if (result <= a3) {
    return a3;
  }
  return result;
}

- (void)_updateCellHeightForTextIfNecessary
{
  [(TFFeedbackFormLongTextCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(TFFeedbackFormLongTextCell *)self textView];
  id v8 = [v7 text];
  +[TFFeedbackFormLongTextCell _sizeToFitText:fittingSize:inTraitEnvironment:](TFFeedbackFormLongTextCell, "_sizeToFitText:fittingSize:inTraitEnvironment:", v8, self, v4, 1.79769313e308);
  double v10 = v9;

  if (v6 != v10)
  {
    double v11 = [(TFFeedbackFormBaseCell *)self updateProxy];
    double v12 = [(TFFeedbackFormLongTextCell *)self longTextEntry];
    double v13 = [(TFFeedbackFormLongTextCell *)self textView];
    double v14 = [v13 text];
    [v11 didUpdateEntry:v12 toString:v14 editInProgress:1];

    [(TFFeedbackFormLongTextCell *)self setNeedsDisplay];
    id v15 = [(TFFeedbackFormLongTextCell *)self _tableView];
    [(TFFeedbackFormLongTextCell *)self _updateCellHeightForTextUpdatesInTableView:v15];
  }
}

- (void)_updateCellHeightForTextUpdatesInTableView:(id)a3
{
  double v3 = (void *)MEMORY[0x263F1CB60];
  id v4 = a3;
  uint64_t v5 = [v3 areAnimationsEnabled];
  [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
  [v4 performBatchUpdates:&__block_literal_global_10 completion:0];

  double v6 = (void *)MEMORY[0x263F1CB60];

  [v6 setAnimationsEnabled:v5];
}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  id v5 = +[TFFeedbackFormLongTextCell _createTextViewFontForTraitCollection:a3];
  id v4 = [(TFFeedbackFormLongTextCell *)self textView];
  [v4 setFont:v5];
}

+ (id)_createTextViewFontForTraitCollection:(id)a3
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260] compatibleWithTraitCollection:a3];
}

- (UITextView)textView
{
  return self->_textView;
}

- (TFFeedbackEntryLongText)longTextEntry
{
  return self->_longTextEntry;
}

- (void)setLongTextEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTextEntry, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end