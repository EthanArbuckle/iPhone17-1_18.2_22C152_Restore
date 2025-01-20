@interface PKWeekdaySelectionCollectionViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKWeekdaySelectionCollectionViewCell)init;
- (PKWeekdaySelectionCollectionViewCell)initWithFrame:(CGRect)a3;
- (PKWeekdaySelectionCollectionViewCell)initWithSize:(CGSize)a3;
- (PKWeekdaySelectorDelegate)delegate;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedDays:(id)a3 possibleDays:(id)a4;
@end

@implementation PKWeekdaySelectionCollectionViewCell

- (PKWeekdaySelectionCollectionViewCell)init
{
  return -[PKWeekdaySelectionCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKWeekdaySelectionCollectionViewCell)initWithSize:(CGSize)a3
{
  return -[PKWeekdaySelectionCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
}

- (PKWeekdaySelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKWeekdaySelectionCollectionViewCell;
  v3 = -[PKWeekdaySelectionCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKWeekdaySelector);
    weekdaySelector = v3->_weekdaySelector;
    v3->_weekdaySelector = v4;

    v6 = [(PKWeekdaySelectionCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_weekdaySelector];
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKWeekdaySelectionCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKWeekdaySelectionCollectionViewCell;
  [(PKWeekdaySelectionCollectionViewCell *)&v4 layoutSubviews];
  double v3 = [(PKWeekdaySelectionCollectionViewCell *)self contentView];
  [v3 bounds];
  -[PKWeekdaySelectionCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width = a3.size.width;
  -[PKWeekdaySelector sizeThatFits:](self->_weekdaySelector, "sizeThatFits:", a3.size.width, 1.79769313e308);
  double v9 = v8;
  if (!a4) {
    -[PKWeekdaySelector setFrame:](self->_weekdaySelector, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8) + 15.0, v7, v8);
  }
  double v10 = v9 + 30.0;
  double v11 = width;
  result.height = v10;
  result.CGFloat width = v11;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKWeekdaySelectionCollectionViewCell;
  id v4 = a3;
  [(PKWeekdaySelectionCollectionViewCell *)&v6 setBackgroundColor:v4];
  v5 = [(PKWeekdaySelectionCollectionViewCell *)self contentView];
  [v5 setBackgroundColor:v4];

  [(PKWeekdaySelector *)self->_weekdaySelector setBackgroundColor:v4];
}

- (void)setSelectedDays:(id)a3 possibleDays:(id)a4
{
}

- (PKWeekdaySelectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKWeekdaySelectorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_weekdaySelector, 0);
}

@end