@interface PKEnterCurrencyAmountPassTableHeaderFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKEnterCurrencyAmountPassTableHeaderFooterView)initWithCurrenyAmount:(id)a3 pass:(id)a4;
- (PKEnterCurrencyAmountPassView)amountPassView;
- (PKEnterCurrencyAmountPassViewDelegate)delegate;
- (double)_bottomPadding;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation PKEnterCurrencyAmountPassTableHeaderFooterView

- (PKEnterCurrencyAmountPassTableHeaderFooterView)initWithCurrenyAmount:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKEnterCurrencyAmountPassTableHeaderFooterView;
  v8 = -[PKEnterCurrencyAmountPassTableHeaderFooterView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    v9 = [[PKEnterCurrencyAmountPassView alloc] initWithCurrenyAmount:v6 pass:v7 withdrawal:1];
    amountPassView = v8->_amountPassView;
    v8->_amountPassView = v9;

    v11 = [(PKEnterCurrencyAmountPassTableHeaderFooterView *)v8 contentView];
    [v11 addSubview:v8->_amountPassView];
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(PKEnterCurrencyAmountPassTableHeaderFooterView *)self _bottomPadding];
  double v9 = v7 + v8;
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKEnterCurrencyAmountPassTableHeaderFooterView;
  [(PKEnterCurrencyAmountPassTableHeaderFooterView *)&v14 layoutSubviews];
  v3 = [(PKEnterCurrencyAmountPassTableHeaderFooterView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 layoutMargins];
  -[PKEnterCurrencyAmountPassView setFrame:](self->_amountPassView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);
}

- (double)_bottomPadding
{
  v2 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView pass];
  if (v2) {
    double v3 = 72.0;
  }
  else {
    double v3 = 42.0;
  }

  return v3;
}

- (PKEnterCurrencyAmountPassViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKEnterCurrencyAmountPassViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKEnterCurrencyAmountPassView)amountPassView
{
  return self->_amountPassView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountPassView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end