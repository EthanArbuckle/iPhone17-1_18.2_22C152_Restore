@interface SUCreditCardReaderInfoView
- (SUCreditCardReaderInfoView)initWithFrame:(CGRect)a3;
- (UILabel)addCardDetailLabel;
- (UILabel)addCardLabel;
- (void)layoutSubviews;
- (void)setAddCardDetailLabel:(id)a3;
- (void)setAddCardLabel:(id)a3;
@end

@implementation SUCreditCardReaderInfoView

- (SUCreditCardReaderInfoView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SUCreditCardReaderInfoView;
  v3 = -[SUCreditCardReaderInfoView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(SUCreditCardReaderInfoView *)v3 setAddCardLabel:v4];

    v5 = [(SUCreditCardReaderInfoView *)v3 addCardLabel];
    [v5 setTextAlignment:1];

    v6 = [(SUCreditCardReaderInfoView *)v3 addCardLabel];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CREDIT_CARD_ADD" value:&stru_26DB8C5F8 table:0];
    [v6 setText:v8];

    v9 = [(SUCreditCardReaderInfoView *)v3 addCardLabel];
    v10 = [MEMORY[0x263F1C658] systemFontOfSize:32.0 weight:*MEMORY[0x263F1D328]];
    [v9 setFont:v10];

    v11 = [(SUCreditCardReaderInfoView *)v3 addCardLabel];
    [(SUCreditCardReaderInfoView *)v3 addSubview:v11];

    id v12 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(SUCreditCardReaderInfoView *)v3 setAddCardDetailLabel:v12];

    v13 = [(SUCreditCardReaderInfoView *)v3 addCardDetailLabel];
    [v13 setTextAlignment:1];

    v14 = [(SUCreditCardReaderInfoView *)v3 addCardDetailLabel];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"CREDIT_CARD_POSITION" value:&stru_26DB8C5F8 table:0];
    [v14 setText:v16];

    v17 = [(SUCreditCardReaderInfoView *)v3 addCardDetailLabel];
    v18 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
    [v17 setFont:v18];

    v19 = [(SUCreditCardReaderInfoView *)v3 addCardDetailLabel];
    [(SUCreditCardReaderInfoView *)v3 addSubview:v19];
  }
  return v3;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SUCreditCardReaderInfoView;
  [(SUCreditCardReaderInfoView *)&v22 layoutSubviews];
  v3 = [(SUCreditCardReaderInfoView *)self addCardLabel];
  [(SUCreditCardReaderInfoView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;

  [(SUCreditCardReaderInfoView *)self bounds];
  CGFloat v10 = CGRectGetMidX(v23) - v7 * 0.5;
  v11 = [(SUCreditCardReaderInfoView *)self addCardLabel];
  objc_msgSend(v11, "setFrame:", v10, 25.0, v7, v9);

  id v12 = [(SUCreditCardReaderInfoView *)self addCardDetailLabel];
  [(SUCreditCardReaderInfoView *)self bounds];
  objc_msgSend(v12, "sizeThatFits:", v13, v14);
  double v16 = v15;
  double v18 = v17;

  [(SUCreditCardReaderInfoView *)self bounds];
  CGFloat v19 = CGRectGetMidX(v24) - v16 * 0.5;
  v25.origin.y = 25.0;
  v25.origin.x = v10;
  v25.size.width = v7;
  v25.size.height = v9;
  CGFloat v20 = CGRectGetMaxY(v25) + 16.0;
  objc_super v21 = [(SUCreditCardReaderInfoView *)self addCardDetailLabel];
  objc_msgSend(v21, "setFrame:", v19, v20, v16, v18);
}

- (UILabel)addCardDetailLabel
{
  return self->_addCardDetailLabel;
}

- (void)setAddCardDetailLabel:(id)a3
{
}

- (UILabel)addCardLabel
{
  return self->_addCardLabel;
}

- (void)setAddCardLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addCardLabel, 0);

  objc_storeStrong((id *)&self->_addCardDetailLabel, 0);
}

@end