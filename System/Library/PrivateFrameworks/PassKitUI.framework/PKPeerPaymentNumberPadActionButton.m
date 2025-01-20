@interface PKPeerPaymentNumberPadActionButton
+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3;
+ (double)adjustSize:(double)a3 forSizeCategory:(unint64_t)a4;
+ (double)fontSizeForSizeCategory:(unint64_t)a3;
- (PKPeerPaymentNumberPadActionButton)initWithSizeCategory:(unint64_t)a3;
- (id)_axIDForAction:(unint64_t)a3;
- (id)_titleForAction:(unint64_t)a3;
- (unint64_t)action;
- (unint64_t)sizeCategory;
- (void)_updateForFontSize;
- (void)layoutSubviews;
- (void)setAction:(unint64_t)a3;
- (void)setSizeCategory:(unint64_t)a3;
@end

@implementation PKPeerPaymentNumberPadActionButton

+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3
{
  [a1 adjustSize:a3 forSizeCategory:70.0];
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)fontSizeForSizeCategory:(unint64_t)a3
{
  [a1 adjustSize:a3 forSizeCategory:36.0];
  return result;
}

+ (double)adjustSize:(double)a3 forSizeCategory:(unint64_t)a4
{
  if ((PKIsPad() & 1) != 0 || PKIsPhone())
  {
    if (a4 == 1)
    {
      double v6 = 0.8;
      return a3 * v6;
    }
    if (!a4)
    {
      double v6 = 0.7;
      return a3 * v6;
    }
  }
  return a3;
}

- (PKPeerPaymentNumberPadActionButton)initWithSizeCategory:(unint64_t)a3
{
  [(id)objc_opt_class() referenceSizeForSizeCategory:a3];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentNumberPadActionButton;
  v11 = -[PKPeerPaymentMessagesButton initWithFrame:](&v14, sel_initWithFrame_, v9, v10, v6, v8);
  v12 = v11;
  if (v11)
  {
    v11->_sizeCategory = a3;
    [(PKPeerPaymentNumberPadActionButton *)v11 _updateForFontSize];
    [(PKPeerPaymentMessagesButton *)v12 setHighlighted:0];
  }
  return v12;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentNumberPadActionButton;
  [(PKPeerPaymentMessagesButton *)&v3 layoutSubviews];
  [(PKPeerPaymentNumberPadActionButton *)self bounds];
  CGRectGetWidth(v4);
  PKFloatRoundToPixel();
  -[PKPeerPaymentNumberPadActionButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
}

- (void)setSizeCategory:(unint64_t)a3
{
  if (self->_sizeCategory != a3)
  {
    self->_sizeCategory = a3;
    [(PKPeerPaymentNumberPadActionButton *)self _updateForFontSize];
  }
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
  if (a3 == 12)
  {
    [(id)objc_opt_class() adjustSize:self->_sizeCategory forSizeCategory:30.0];
    double v5 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:weight:", 6);
    double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"delete.backward" withConfiguration:v5];
    [(PKPeerPaymentNumberPadActionButton *)self setImage:v6 forState:0];

    double v7 = +[PKPeerPaymentTheme primaryTextColor];
    [(PKPeerPaymentNumberPadActionButton *)self setTintColor:v7];

    [(PKPeerPaymentNumberPadActionButton *)self setNeedsLayout];
  }
  else
  {
    double v5 = [(PKPeerPaymentNumberPadActionButton *)self _titleForAction:a3];
    [(PKPeerPaymentNumberPadActionButton *)self setTitle:v5 forState:0];
  }

  id v8 = [(PKPeerPaymentNumberPadActionButton *)self _axIDForAction:a3];
  [(PKPeerPaymentNumberPadActionButton *)self setAccessibilityIdentifier:v8];
}

- (id)_titleForAction:(unint64_t)a3
{
  if (qword_1E94F57C8 != -1) {
    dispatch_once(&qword_1E94F57C8, &__block_literal_global_310);
  }
  switch(a3)
  {
    case 1uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B9180;
      goto LABEL_16;
    case 2uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B9198;
      goto LABEL_16;
    case 3uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B91B0;
      goto LABEL_16;
    case 4uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B91C8;
      goto LABEL_16;
    case 5uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B91E0;
      goto LABEL_16;
    case 6uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B91F8;
      goto LABEL_16;
    case 7uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B9210;
      goto LABEL_16;
    case 8uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B9228;
      goto LABEL_16;
    case 9uLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B9240;
      goto LABEL_16;
    case 0xAuLL:
      double v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      double v6 = [v7 decimalSeparator];

      break;
    case 0xBuLL:
      CGRect v4 = (void *)qword_1E94F57C0;
      double v5 = &unk_1EF2B9258;
LABEL_16:
      double v6 = [v4 stringFromNumber:v5];
      break;
    default:
      double v6 = 0;
      break;
  }

  return v6;
}

uint64_t __54__PKPeerPaymentNumberPadActionButton__titleForAction___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)qword_1E94F57C0;
  qword_1E94F57C0 = (uint64_t)v0;

  v2 = (void *)qword_1E94F57C0;
  objc_super v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  CGRect v4 = (void *)qword_1E94F57C0;

  return [v4 setFormattingContext:2];
}

- (id)_axIDForAction:(unint64_t)a3
{
  if (a3 == 12)
  {
    objc_super v3 = (id *)MEMORY[0x1E4F85468];
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    objc_super v3 = (id *)MEMORY[0x1E4F85458];
LABEL_5:
    id v4 = *v3;
    goto LABEL_7;
  }
  -[PKPeerPaymentNumberPadActionButton _titleForAction:](self, "_titleForAction:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

- (void)_updateForFontSize
{
  double v3 = 36.0;
  if (self->_action == 12) {
    double v3 = 30.0;
  }
  +[PKPeerPaymentNumberPadActionButton adjustSize:self->_sizeCategory forSizeCategory:v3];
  double v5 = v4;
  id v8 = [(PKPeerPaymentNumberPadActionButton *)self titleLabel];
  double v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "pk_textCondensedSemiboldCashFontOfSize:", v5);
  double v7 = objc_msgSend(v6, "pk_fixedWidthFont");
  [v8 setFont:v7];
}

- (unint64_t)action
{
  return self->_action;
}

- (unint64_t)sizeCategory
{
  return self->_sizeCategory;
}

@end