@interface PKDateSelectorCollectionViewCell
- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment;
- (BOOL)canBecomeFirstResponder;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)date;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (PKDateSelectorCollectionViewCell)init;
- (PKDateSelectorCollectionViewCell)initWithFrame:(CGRect)a3;
- (PKDateSelectorCollectionViewCellDelegate)delegate;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_didUpdateDate:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentAlignment:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumDate:(id)a3;
- (void)setMinimumDate:(id)a3;
@end

@implementation PKDateSelectorCollectionViewCell

- (PKDateSelectorCollectionViewCell)init
{
  return -[PKDateSelectorCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKDateSelectorCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKDateSelectorCollectionViewCell;
  v3 = -[PKDateSelectorCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
    datePicker = v3->_datePicker;
    v3->_datePicker = v4;

    [(UIDatePicker *)v3->_datePicker setDatePickerMode:1];
    [(UIDatePicker *)v3->_datePicker setPreferredDatePickerStyle:3];
    [(UIDatePicker *)v3->_datePicker addTarget:v3 action:sel__didUpdateDate_ forControlEvents:4096];
    v6 = [(PKDateSelectorCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_datePicker];
  }
  return v3;
}

- (void)setDate:(id)a3
{
  p_date = &self->_date;
  objc_storeStrong((id *)&self->_date, a3);
  id v6 = a3;
  [(UIDatePicker *)self->_datePicker setDate:*p_date];
}

- (void)_didUpdateDate:(id)a3
{
  v4 = [a3 date];
  date = self->_date;
  self->_date = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dateSelectorCollectionViewCell:self didUpdateDate:self->_date];
}

- (NSDate)minimumDate
{
  return [(UIDatePicker *)self->_datePicker minimumDate];
}

- (void)setMinimumDate:(id)a3
{
}

- (NSDate)maximumDate
{
  return [(UIDatePicker *)self->_datePicker maximumDate];
}

- (void)setMaximumDate:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDateSelectorCollectionViewCell;
  id v4 = a3;
  [(PKDateSelectorCollectionViewCell *)&v6 setBackgroundColor:v4];
  v5 = [(PKDateSelectorCollectionViewCell *)self contentView];
  [v5 setBackgroundColor:v4];

  [(UIDatePicker *)self->_datePicker setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDateSelectorCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDateSelectorCollectionViewCell;
  [(PKDateSelectorCollectionViewCell *)&v4 layoutSubviews];
  double v3 = [(PKDateSelectorCollectionViewCell *)self contentView];
  [v3 bounds];
  -[PKDateSelectorCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width = a3.size.width;
  -[UIDatePicker sizeThatFits:](self->_datePicker, "sizeThatFits:", a3.size.width, 1.79769313e308);
  double v8 = v7;
  if (!a4)
  {
    PKSizeAlignedInRect();
    -[UIDatePicker setFrame:](self->_datePicker, "setFrame:");
  }
  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PKDateSelectorCollectionViewCell;
  objc_super v4 = [(PKDateSelectorCollectionViewCell *)&v17 preferredLayoutAttributesFittingAttributes:a3];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  -[PKDateSelectorCollectionViewCell sizeThatFits:](self, "sizeThatFits:", v9, v10);
  double v12 = v11;
  double v14 = v13;
  v15 = (void *)[v4 copy];
  objc_msgSend(v15, "setFrame:", v6, v8, v12, v14);

  return v15;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSDate)date
{
  return self->_date;
}

- (PKDateSelectorCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDateSelectorCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_contentAlignment;
}

- (void)setContentAlignment:(id)a3
{
  self->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end