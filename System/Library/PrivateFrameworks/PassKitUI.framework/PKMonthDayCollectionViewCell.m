@interface PKMonthDayCollectionViewCell
- (BOOL)isEnabled;
- (PKMonthDayCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)dayNumber;
- (void)layoutSubviews;
- (void)setDayNumber:(int64_t)a3;
- (void)setDayNumber:(int64_t)a3 withTitle:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKMonthDayCollectionViewCell

- (PKMonthDayCollectionViewCell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PKMonthDayCollectionViewCell;
  v3 = -[PKMonthDayCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dayLabel = v3->_dayLabel;
    v3->_dayLabel = v4;

    v6 = v3->_dayLabel;
    v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
    [(UILabel *)v6 setFont:v7];

    v8 = [MEMORY[0x1E4FB1618] separatorColor];
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topLine = v3->_topLine;
    v3->_topLine = v9;

    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomLine = v3->_bottomLine;
    v3->_bottomLine = v11;

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    leftLine = v3->_leftLine;
    v3->_leftLine = v13;

    [(UIView *)v3->_topLine setBackgroundColor:v8];
    [(UIView *)v3->_leftLine setBackgroundColor:v8];
    [(UIView *)v3->_bottomLine setBackgroundColor:v8];
    [(PKMonthDayCollectionViewCell *)v3 addSubview:v3->_topLine];
    [(PKMonthDayCollectionViewCell *)v3 addSubview:v3->_bottomLine];
    [(PKMonthDayCollectionViewCell *)v3 addSubview:v3->_leftLine];
    [(PKMonthDayCollectionViewCell *)v3 addSubview:v3->_dayLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKMonthDayCollectionViewCell;
  [(PKMonthDayCollectionViewCell *)&v13 layoutSubviews];
  [(PKMonthDayCollectionViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_topLine, "setFrame:", 0.0, 0.0);
  -[UIView setFrame:](self->_leftLine, "setFrame:", 0.0, 0.0, 1.0, v10);
  -[UIView setFrame:](self->_bottomLine, "setFrame:", 0.0, v10 + -1.0, v8, 1.0);
  [(UIView *)self->_topLine setHidden:(unint64_t)(self->_dayNumber - 1) < 7];
  [(UIView *)self->_bottomLine setHidden:(unint64_t)(self->_dayNumber - 1) < 0x1C];
  [(UIView *)self->_leftLine setHidden:self->_dayNumber % 7 == 1];
  dayLabel = self->_dayLabel;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  double MidX = CGRectGetMidX(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  -[UILabel setCenter:](dayLabel, "setCenter:", MidX, CGRectGetMidY(v15));
}

- (void)setDayNumber:(int64_t)a3 withTitle:(id)a4
{
  self->_dayNumber = a3;
  [(UILabel *)self->_dayLabel setText:a4];
  [(UILabel *)self->_dayLabel sizeToFit];
  [(PKMonthDayCollectionViewCell *)self setNeedsLayout];

  [(PKMonthDayCollectionViewCell *)self layoutIfNeeded];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (a3)
  {
    dayLabel = self->_dayLabel;
    if ([(PKMonthDayCollectionViewCell *)self isSelected]) {
      [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    else {
    CGFloat v6 = [MEMORY[0x1E4FB1618] labelColor];
    }
    [(UILabel *)dayLabel setTextColor:v6];

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  id v7 = (id)v5;
  [(UILabel *)self->_dayLabel setTextColor:v5];
}

- (void)setSelected:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKMonthDayCollectionViewCell;
  -[PKMonthDayCollectionViewCell setSelected:](&v10, sel_setSelected_);
  if (!self->_enabled)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
    goto LABEL_8;
  }
  dayLabel = self->_dayLabel;
  if (!a3)
  {
    double v8 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)dayLabel setTextColor:v8];

    goto LABEL_7;
  }
  CGFloat v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UILabel *)dayLabel setTextColor:v6];

LABEL_5:
  uint64_t v7 = [(PKMonthDayCollectionViewCell *)self tintColor];
LABEL_8:
  double v9 = (void *)v7;
  [(PKMonthDayCollectionViewCell *)self setBackgroundColor:v7];
}

- (int64_t)dayNumber
{
  return self->_dayNumber;
}

- (void)setDayNumber:(int64_t)a3
{
  self->_dayNumber = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_leftLine, 0);
  objc_storeStrong((id *)&self->_topLine, 0);

  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end