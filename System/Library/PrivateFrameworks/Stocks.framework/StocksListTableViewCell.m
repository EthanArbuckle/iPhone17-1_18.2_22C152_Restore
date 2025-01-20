@interface StocksListTableViewCell
+ (double)cellHeightForStackStatus:(BOOL)a3;
- (BOOL)shouldStackView;
- (CGRect)changeButtonRect;
- (Stock)stock;
- (StocksListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)changeSignNegative:(BOOL)a3;
- (int64_t)rowDataType;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBoxContentsAlpha:(double)a3 includeChangeSign:(BOOL)a4;
- (void)setBoxValueFromRowDataType;
- (void)setRowDataType:(int64_t)a3;
- (void)setShouldStackView:(BOOL)a3;
- (void)setShowsRowSeparator:(BOOL)a3;
- (void)setStock:(id)a3;
- (void)updateValues;
@end

@implementation StocksListTableViewCell

+ (double)cellHeightForStackStatus:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
  [v4 _scaledValueForValue:36.0];
  double v6 = v5 + 0.0;
  [v4 _scaledValueForValue:20.0];
  double v8 = v6 + v7;
  if (v3)
  {
    [v4 _scaledValueForValue:36.0];
    double v10 = v9;
    [v4 _scaledValueForValue:28.0];
    double v8 = v8 + v10 + v11;
  }

  return v8;
}

- (StocksListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v53.receiver = self;
  v53.super_class = (Class)StocksListTableViewCell;
  v4 = [(StocksListTableViewCell *)&v53 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = [MEMORY[0x263F1C550] blackColor];
    [(StocksListTableViewCell *)v4 setBackgroundColor:v5];

    uint64_t v6 = objc_opt_new();
    symbolLabel = v4->_symbolLabel;
    v4->_symbolLabel = (UILabel *)v6;

    double v8 = v4->_symbolLabel;
    uint64_t v9 = *MEMORY[0x263F1D300];
    double v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
    [(UILabel *)v8 setFont:v10];

    [(UILabel *)v4->_symbolLabel setAdjustsFontForContentSizeCategory:1];
    double v11 = v4->_symbolLabel;
    v12 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    v13 = v4->_symbolLabel;
    v14 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v4->_symbolLabel setBaselineAdjustment:1];
    [(StocksListTableViewCell *)v4 addSubview:v4->_symbolLabel];
    uint64_t v15 = objc_opt_new();
    priceLabel = v4->_priceLabel;
    v4->_priceLabel = (UILabel *)v15;

    v17 = v4->_priceLabel;
    v18 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v9];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v4->_priceLabel setAdjustsFontForContentSizeCategory:1];
    v19 = v4->_priceLabel;
    v20 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v19 setBackgroundColor:v20];

    v21 = v4->_priceLabel;
    v22 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v4->_priceLabel setBaselineAdjustment:1];
    [(UILabel *)v4->_priceLabel setTextAlignment:2];
    [(StocksListTableViewCell *)v4 addSubview:v4->_priceLabel];
    v23 = [StocksListBoxView alloc];
    v24 = (void *)MEMORY[0x263F1C6B0];
    v25 = +[StocksBundles getBundle:1];
    v26 = [(StocksListTableViewCell *)v4 traitCollection];
    v27 = [v24 imageNamed:@"ButtonMask" inBundle:v25 compatibleWithTraitCollection:v26];
    double v28 = CeilToPixel(4.5);
    v29 = objc_msgSend(v27, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v28, 0.0, CeilToPixel(4.5));
    uint64_t v30 = [(StocksListBoxView *)v23 initWithBackgroundMask:v29];
    boxView = v4->_boxView;
    v4->_boxView = (StocksListBoxView *)v30;

    [(StocksListTableViewCell *)v4 addSubview:v4->_boxView];
    uint64_t v32 = objc_opt_new();
    boxLabel = v4->_boxLabel;
    v4->_boxLabel = (UILabel *)v32;

    v34 = v4->_boxLabel;
    v35 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v34 setBackgroundColor:v35];

    v36 = v4->_boxLabel;
    v37 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v9];
    [(UILabel *)v36 setFont:v37];

    [(UILabel *)v4->_boxLabel setAdjustsFontForContentSizeCategory:1];
    v38 = v4->_boxLabel;
    v39 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v38 setTextColor:v39];

    [(UILabel *)v4->_boxLabel setBaselineAdjustment:1];
    [(UILabel *)v4->_boxLabel setAdjustsFontSizeToFitWidth:1];
    [(StocksListTableViewCell *)v4 addSubview:v4->_boxLabel];
    id v40 = objc_alloc(MEMORY[0x263F1C6D0]);
    v41 = (void *)MEMORY[0x263F1C6B0];
    v42 = +[StocksBundles getBundle:1];
    v43 = [(StocksListTableViewCell *)v4 traitCollection];
    v44 = [v41 imageNamed:@"PlusSign" inBundle:v42 compatibleWithTraitCollection:v43];
    uint64_t v45 = [v40 initWithImage:v44];
    changeSignView = v4->_changeSignView;
    v4->_changeSignView = (UIImageView *)v45;

    [(StocksListTableViewCell *)v4 addSubview:v4->_changeSignView];
    v47 = [MEMORY[0x263F1C550] blackColor];
    [(StocksListTableViewCell *)v4 setBackgroundColor:v47];

    [(StocksListTableViewCell *)v4 setBoxValueFromRowDataType];
    id v48 = objc_alloc(MEMORY[0x263F1CB60]);
    [(StocksListTableViewCell *)v4 bounds];
    v49 = objc_msgSend(v48, "initWithFrame:");
    [(StocksListTableViewCell *)v4 setSelectedBackgroundView:v49];

    v50 = [MEMORY[0x263F1C550] colorWithWhite:0.22 alpha:1.0];
    v51 = [(StocksListTableViewCell *)v4 selectedBackgroundView];
    [v51 setBackgroundColor:v50];
  }
  return v4;
}

- (void)prepareForReuse
{
  [(StocksListTableViewCell *)self setStock:0];
  v3.receiver = self;
  v3.super_class = (Class)StocksListTableViewCell;
  [(StocksListTableViewCell *)&v3 prepareForReuse];
}

- (void)setStock:(id)a3
{
  double v5 = (Stock *)a3;
  p_stock = &self->_stock;
  if (self->_stock != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_stock, a3);
    p_stock = (Stock **)[(StocksListTableViewCell *)self updateValues];
    double v5 = v7;
  }

  MEMORY[0x270F9A758](p_stock, v5);
}

- (void)setBoxContentsAlpha:(double)a3 includeChangeSign:(BOOL)a4
{
  BOOL v4 = a4;
  -[UILabel setAlpha:](self->_boxLabel, "setAlpha:");
  if (v4)
  {
    changeSignView = self->_changeSignView;
    [(UIImageView *)changeSignView setAlpha:a3];
  }
}

- (void)setShouldStackView:(BOOL)a3
{
  self->_shouldStackView = a3;
  BOOL v4 = !a3;
  [(UILabel *)self->_symbolLabel setAdjustsFontSizeToFitWidth:v4];
  priceLabel = self->_priceLabel;

  [(UILabel *)priceLabel setAdjustsFontSizeToFitWidth:v4];
}

- (void)updateValues
{
  stock = self->_stock;
  if (stock)
  {
    symbolLabel = self->_symbolLabel;
    double v5 = [(Stock *)stock listName];
    [(UILabel *)symbolLabel setText:v5];

    uint64_t v6 = [(Stock *)self->_stock price];

    if (v6)
    {
      double v7 = [(Stock *)self->_stock formattedPriceDroppingFractionDigitsIfLengthExceeds:10];
    }
    else
    {
      double v7 = &stru_26D5DA820;
    }
    [(UILabel *)self->_priceLabel setText:v7];
    BOOL v9 = [(Stock *)self->_stock changeIsNegative];
    boxView = self->_boxView;
    double v11 = +[StocksStyle sharedStyle];
    v12 = v11;
    if (v9) {
      [v11 lossColor];
    }
    else {
    v13 = [v11 gainColor];
    }
    [(StocksListBoxView *)boxView setImageMaskColor:v13];

    [(StocksListTableViewCell *)self setNeedsLayout];
    BOOL v8 = self->_stock == 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  [(UILabel *)self->_symbolLabel setHidden:v8];
  [(UILabel *)self->_priceLabel setHidden:self->_stock == 0];
  [(UILabel *)self->_boxLabel setHidden:self->_stock == 0];
  v14 = self->_boxView;
  uint64_t v15 = [(Stock *)self->_stock change];
  [(StocksListBoxView *)v14 setHidden:v15 == 0];

  [(StocksListTableViewCell *)self setBoxValueFromRowDataType];
}

- (id)changeSignNegative:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[StocksBundles getBundle:1];
  if (!v3 || changeSignNegative__minusSign)
  {
    if (changeSignNegative__plusSign) {
      goto LABEL_7;
    }
    double v10 = (void *)MEMORY[0x263F1C6B0];
    double v7 = [(StocksListTableViewCell *)self traitCollection];
    uint64_t v11 = [v10 imageNamed:@"PlusSign" inBundle:v5 compatibleWithTraitCollection:v7];
    BOOL v9 = (void *)changeSignNegative__plusSign;
    changeSignNegative__plusSign = v11;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F1C6B0];
    double v7 = [(StocksListTableViewCell *)self traitCollection];
    uint64_t v8 = [v6 imageNamed:@"MinusSign" inBundle:v5 compatibleWithTraitCollection:v7];
    BOOL v9 = (void *)changeSignNegative__minusSign;
    changeSignNegative__minusSign = v8;
  }

LABEL_7:
  v12 = &changeSignNegative__minusSign;
  if (!v3) {
    v12 = &changeSignNegative__plusSign;
  }
  id v13 = (id)*v12;

  return v13;
}

- (void)setBoxValueFromRowDataType
{
  changeSignView = self->_changeSignView;
  if (self->_stock) {
    BOOL v4 = self->_rowDataType == 2;
  }
  else {
    BOOL v4 = 1;
  }
  [(UIImageView *)changeSignView setHidden:v4];
  stock = self->_stock;
  if (stock)
  {
    if (self->_rowDataType == 2)
    {
      boxLabel = self->_boxLabel;
      double v7 = [(Stock *)stock change];
      if (v7)
      {
        uint64_t v8 = [(Stock *)self->_stock marketcap];
        BOOL v9 = +[Stock localizedMagnitudeAbbreviatedStringWithString:v8];
        [(UILabel *)boxLabel setText:v9];
      }
      else
      {
        [(UILabel *)boxLabel setText:&stru_26D5DA820];
      }
    }
    else
    {
      uint64_t v10 = [(Stock *)stock changeIsNegative];
      uint64_t v11 = [(Stock *)self->_stock change];
      if (v11)
      {
        [(Stock *)self->_stock formattedChangePercent:self->_rowDataType == 0];
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &stru_26D5DA820;
      }

      id v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      double v7 = [(__CFString *)v12 stringByTrimmingCharactersInSet:v13];

      [(UILabel *)self->_boxLabel setText:v7];
      if ([v7 length]
        && (+[Stock BlankValueString],
            v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v7 isEqualToString:v14],
            v14,
            !v15))
      {
        v16 = self->_changeSignView;
        v17 = [(StocksListTableViewCell *)self changeSignNegative:v10];
        [(UIImageView *)v16 setImage:v17];
      }
      else
      {
        [(UIImageView *)self->_changeSignView setHidden:1];
      }
    }

    v18 = +[StocksPreferences sharedPreferences];
    int v19 = [v18 textAttachmentDirectionIsRightToLeft];

    uint64_t v20 = 2;
    if (v19) {
      uint64_t v20 = 0;
    }
    if (self->_rowDataType == 2) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
    [(UILabel *)self->_boxLabel setTextAlignment:v21];
    [(UILabel *)self->_boxLabel sizeToFit];
    [(StocksListTableViewCell *)self setNeedsLayout];
  }
}

- (void)setRowDataType:(int64_t)a3
{
  if (self->_rowDataType != a3)
  {
    self->_rowDataType = a3;
    [(StocksListTableViewCell *)self setBoxValueFromRowDataType];
  }
}

- (void)setShowsRowSeparator:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)StocksListTableViewCell;
  [(StocksListTableViewCell *)&v70 layoutSubviews];
  int v3 = [(StocksListTableViewCell *)self _shouldReverseLayoutDirection];
  BOOL v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
  double v59 = RoundToPixel(0.5);
  [v4 _scaledValueForValue:36.0];
  double v69 = v5;
  [v4 _scaledValueForValue:28.0];
  double v57 = v6;
  [v4 _scaledValueForValue:RoundToPixel(93.0)];
  double v8 = v7;
  [v4 _scaledValueForValue:31.5];
  double v10 = v9;
  [(StocksListTableViewCell *)self bounds];
  CGFloat v56 = v12;
  CGFloat v54 = v13;
  double v15 = v14;
  double v64 = v11;
  double v16 = v11 + -16.0;
  double v17 = v8;
  double v18 = v11 + -16.0 - v8;
  double v66 = 16.0;
  if (v3) {
    double v19 = 16.0;
  }
  else {
    double v19 = v11 + -16.0 - v8;
  }
  [(UILabel *)self->_symbolLabel sizeToFit];
  [(UILabel *)self->_priceLabel sizeToFit];
  [(UILabel *)self->_boxLabel sizeToFit];
  [(UILabel *)self->_symbolLabel frame];
  double v21 = v20;
  double v68 = v22;
  double v60 = v16 - v22;
  double v62 = v23;
  [(UILabel *)self->_priceLabel frame];
  CGFloat v26 = v25;
  double v67 = v27;
  CGFloat rect = v28;
  double v63 = v15;
  CGFloat v58 = v10;
  if (self->_shouldStackView)
  {
    CGFloat v29 = v24;
    double v30 = 16.0;
    if (v3)
    {
      v71.origin.x = v56;
      v71.origin.y = v54;
      v71.size.width = v64;
      v71.size.height = v15;
      CGFloat v31 = CGRectGetWidth(v71) + -16.0;
      v72.origin.x = v29;
      v72.origin.y = v26;
      v72.size.width = v67;
      v72.size.height = rect;
      double v66 = v31 - CGRectGetWidth(v72);
      v73.origin.x = v56;
      v73.origin.y = v54;
      v73.size.width = v64;
      v73.size.height = v63;
      double v30 = CGRectGetWidth(v73) + -16.0 - v17;
    }
    double v55 = v30;
    [v4 ascender];
    [v4 ascender];
    double v53 = v57 + v69 * 2.0 - v32;
  }
  else
  {
    double v55 = v19;
    double v34 = v17;
    double v53 = (v15 - v10) * 0.5;
    if (v3)
    {
      double v35 = 16.0;
      double v36 = v10;
      double v33 = (v15 - v10) * 0.5;
      double MaxX = CGRectGetMaxX(*(CGRect *)(&v34 - 2));
      double v38 = MaxX + RoundToPixel(8.0);
      double v39 = v67;
      CGFloat v40 = rect;
      double v41 = v38;
    }
    else
    {
      double v42 = v18 - v67 - RoundToPixel(8.0);
      double v38 = 16.0;
      CGFloat v26 = v21;
      double v39 = v68;
      CGFloat v40 = v62;
      double v41 = v42;
    }
    double v66 = v41;
    CGFloat v43 = v26;
    CGRectGetMaxX(*(CGRect *)&v38);
    [v4 ascender];
  }
  [v4 ascender];
  double v44 = 0.0;
  if (self->_rowDataType != 2)
  {
    [(UIImageView *)self->_changeSignView bounds];
    double v44 = v45 + 2.0;
  }
  [(UILabel *)self->_boxLabel frame];
  v74.size.width = v17 + -16.0 - v44;
  CGRectGetHeight(v74);
  [(UIImageView *)self->_changeSignView frame];
  double v47 = v46;
  id v48 = +[StocksPreferences sharedPreferences];
  int v49 = [v48 textAttachmentDirectionIsRightToLeft];

  double v50 = v55 + 8.0;
  if (v49)
  {
    v75.origin.x = v55;
    v75.origin.y = v53;
    v75.size.width = v17;
    v75.size.height = v58;
    double v51 = CGRectGetMaxX(v75) + -8.0 - v47;
  }
  else
  {
    double v51 = v55 + 8.0;
    double v50 = v50 + v44;
  }
  double v52 = 16.0;
  if (v3) {
    double v52 = v60;
  }
  double v61 = v52;
  [(UIImageView *)self->_changeSignView setFrame:RoundRectToPixel(v51)];
  [(UILabel *)self->_boxLabel setFrame:RoundRectToPixel(v50)];
  [(StocksListBoxView *)self->_boxView setFrame:RoundRectToPixel(v55)];
  [(UILabel *)self->_symbolLabel setFrame:RoundRectToPixel(v61)];
  [(UILabel *)self->_priceLabel setFrame:RoundRectToPixel(v66)];
  -[UIView setFrame:](self->_rowSeparatorView, "setFrame:", 16.0, v63 - v59, v64 + -32.0);
}

- (CGRect)changeButtonRect
{
  [(StocksListBoxView *)self->_boxView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (Stock)stock
{
  return self->_stock;
}

- (int64_t)rowDataType
{
  return self->_rowDataType;
}

- (BOOL)shouldStackView
{
  return self->_shouldStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_rowSeparatorView, 0);
  objc_storeStrong((id *)&self->_changeSignView, 0);
  objc_storeStrong((id *)&self->_boxView, 0);
  objc_storeStrong((id *)&self->_boxLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);

  objc_storeStrong((id *)&self->_symbolLabel, 0);
}

@end