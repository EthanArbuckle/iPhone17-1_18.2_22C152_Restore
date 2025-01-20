@interface PKAddDebitCardHeroView
- (CGSize)sizeThatFits:(CGSize)result;
- (PKAddDebitCardHeroView)initWithPassSnapShot:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKAddDebitCardHeroView

- (PKAddDebitCardHeroView)initWithPassSnapShot:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAddDebitCardHeroView;
  v5 = [(PKAddDebitCardHeroView *)&v16 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    v7 = PKUIImageNamed(@"AddDebitCard");
    uint64_t v8 = [v6 initWithImage:v7];
    debitCardView = v5->_debitCardView;
    v5->_debitCardView = (UIImageView *)v8;

    [(PKAddDebitCardHeroView *)v5 addSubview:v5->_debitCardView];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    passSnapshotView = v5->_passSnapshotView;
    v5->_passSnapshotView = (UIImageView *)v10;

    [(UIImageView *)v5->_passSnapshotView setContentMode:1];
    [(UIImageView *)v5->_passSnapshotView setAccessibilityIgnoresInvertColors:1];
    [(PKAddDebitCardHeroView *)v5 addSubview:v5->_passSnapshotView];
    v12 = [(UIImageView *)v5->_passSnapshotView layer];
    [v12 setShouldRasterize:1];
    [v12 setRasterizationScale:PKUIScreenScale()];
    id v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.25 alpha:1.0];
    objc_msgSend(v12, "setShadowColor:", objc_msgSend(v13, "CGColor"));

    LODWORD(v14) = 1041865114;
    [v12 setShadowOpacity:v14];
    objc_msgSend(v12, "setShadowOffset:", 0.0, 4.0);
    [v12 setShadowRadius:4.0];
  }
  return v5;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKAddDebitCardHeroView;
  [(PKAddDebitCardHeroView *)&v8 layoutSubviews];
  [(PKAddDebitCardHeroView *)self bounds];
  double v4 = v3 * 0.5 + -146.5;
  [(UIImageView *)self->_debitCardView frame];
  [(UIImageView *)self->_debitCardView setFrame:v4];
  [(UIImageView *)self->_passSnapshotView frame];
  double v6 = v5;
  PKFloatRoundToPixel();
  -[UIImageView setFrame:](self->_passSnapshotView, "setFrame:", v4 + 62.0, v6, 243.0, v7);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 183.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debitCardView, 0);

  objc_storeStrong((id *)&self->_passSnapshotView, 0);
}

@end