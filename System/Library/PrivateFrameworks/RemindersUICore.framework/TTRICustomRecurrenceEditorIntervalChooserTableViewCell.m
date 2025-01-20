@interface TTRICustomRecurrenceEditorIntervalChooserTableViewCell
+ (NSNumberFormatter)numberFormatter;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (TTRICustomRecurrenceEditorIntervalChooserTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TTRICustomRecurrenceEditorIntervalChooserTableViewCellDelegate)delegate;
- (UITextView)intervalChooserTextView;
- (void)setDelegate:(id)a3;
- (void)setIntervalChooserTextView:(id)a3;
- (void)setIntervalValue:(int64_t)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TTRICustomRecurrenceEditorIntervalChooserTableViewCell

+ (NSNumberFormatter)numberFormatter
{
  if (numberFormatter_onceToken != -1) {
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global);
  }
  v2 = (void *)numberFormatter__numberFormatter;

  return (NSNumberFormatter *)v2;
}

uint64_t __73__TTRICustomRecurrenceEditorIntervalChooserTableViewCell_numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)numberFormatter__numberFormatter;
  numberFormatter__numberFormatter = (uint64_t)v0;

  v2 = [NSNumber numberWithInteger:0];
  [(id)numberFormatter__numberFormatter setMinimum:v2];

  v3 = [NSNumber numberWithInteger:999];
  [(id)numberFormatter__numberFormatter setMaximum:v3];

  [(id)numberFormatter__numberFormatter setMinimumIntegerDigits:1];
  [(id)numberFormatter__numberFormatter setMaximumIntegerDigits:6];
  [(id)numberFormatter__numberFormatter setMaximumFractionDigits:0];
  v4 = (void *)numberFormatter__numberFormatter;

  return [v4 setRoundingMode:1];
}

- (TTRICustomRecurrenceEditorIntervalChooserTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)TTRICustomRecurrenceEditorIntervalChooserTableViewCell;
  v4 = [(TTRIPopupMenuTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v6 setKeyboardType:8];
    v7 = [(TTRIPopupMenuTableViewCell *)v4 titleLabel];
    v8 = [v7 font];
    [v6 setFont:v8];

    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [v6 setTextColor:v9];

    v10 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v6 setBackgroundColor:v10];

    [v6 setClipsToBounds:1];
    v11 = [v6 layer];
    [v11 setCornerRadius:4.0];

    [v6 setAdjustsFontForContentSizeCategory:1];
    v12 = [v6 textContainer];
    [v12 setWidthTracksTextView:1];

    v13 = [v6 textContainer];
    [v13 setLineFragmentPadding:0.0];

    objc_msgSend(v6, "setTextContainerInset:", 0.0, 8.0, 0.0, 8.0);
    [v6 setTextAlignment:1];
    [v6 setScrollEnabled:0];
    v14 = [v6 textContainer];
    [v14 setMaximumNumberOfLines:1];

    [v6 setDelegate:v4];
    [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)v4 setIntervalChooserTextView:v6];
    LODWORD(v15) = 1148829696;
    objc_msgSend(v6, "setLayoutSize:withContentPriority:", *MEMORY[0x1E4F4BED8], *(double *)(MEMORY[0x1E4F4BED8] + 8), v15);
    v16 = [(TTRIPopupMenuTableViewCell *)v4 accessoriesStackView];
    [v16 insertArrangedSubview:v6 atIndex:0];
  }
  return v4;
}

- (void)setIntervalValue:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F28EE0];
  id v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 localizedStringFromNumber:v5 numberStyle:0];
  v7 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];
  [v7 setText:v6];

  id v8 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];
  [v8 invalidateIntrinsicContentSize];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];

  if (v11 == v9)
  {
    v13 = [v9 text];
    v14 = (void *)[v13 mutableCopy];
    objc_msgSend(v14, "replaceCharactersInRange:withString:", location, length, v10);
    if ([v14 containsString:@"\n"]) {
      [v9 resignFirstResponder];
    }
    if ([v14 length])
    {
      double v15 = +[TTRICustomRecurrenceEditorIntervalChooserTableViewCell numberFormatter];
      v16 = [v15 numberFromString:v14];

      if (v16)
      {
        v17 = +[TTRICustomRecurrenceEditorIntervalChooserTableViewCell numberFormatter];
        objc_super v18 = [v17 stringFromNumber:v16];

        char v12 = [v14 isEqualToString:v18];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];

  if (v5 == v4)
  {
    id v6 = [(TTRIPopupMenuTableViewCell *)self accessoriesStackView];
    [v6 invalidateIntrinsicContentSize];
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];

  if (v5 == v4)
  {
    id v6 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];
    id v15 = [v6 text];

    v7 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1F13362B8 numberStyle:0];
    if (![v15 length])
    {
      id v8 = v7;

      id v9 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];
      [v9 setText:v8];

      id v15 = v8;
    }
    id v10 = +[TTRICustomRecurrenceEditorIntervalChooserTableViewCell numberFormatter];
    id v11 = [v10 numberFromString:v15];

    if (v11)
    {
      char v12 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self delegate];
      objc_msgSend(v12, "intervalChooserDidUpdateValue:", (int)objc_msgSend(v11, "intValue"));

      v13 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];
      [v13 invalidateIntrinsicContentSize];
    }
    else
    {
      v14 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self intervalChooserTextView];
      [v14 setText:v7];

      v13 = [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self delegate];
      [v13 intervalChooserDidUpdateValue:1];
    }
  }
}

- (TTRICustomRecurrenceEditorIntervalChooserTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTRICustomRecurrenceEditorIntervalChooserTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextView)intervalChooserTextView
{
  return self->_intervalChooserTextView;
}

- (void)setIntervalChooserTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalChooserTextView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end