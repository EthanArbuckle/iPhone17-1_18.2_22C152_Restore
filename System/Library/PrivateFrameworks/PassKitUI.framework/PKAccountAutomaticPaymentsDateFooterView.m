@interface PKAccountAutomaticPaymentsDateFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKMonthDayCollectionViewController)collectionViewController;
- (void)layoutSubviews;
- (void)setCollectionViewController:(id)a3;
@end

@implementation PKAccountAutomaticPaymentsDateFooterView

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PKAccountAutomaticPaymentsDateFooterView;
  [(PKAccountAutomaticPaymentsDateFooterView *)&v19 layoutSubviews];
  [(PKAccountAutomaticPaymentsDateFooterView *)self bounds];
  double v4 = v3;
  v5 = [(PKMonthDayCollectionViewController *)self->_collectionViewController collectionView];
  -[PKMonthDayCollectionViewController sizeThatFits:](self->_collectionViewController, "sizeThatFits:", v4, 0.0);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v7 = v6;
  objc_msgSend(v5, "setFrame:");
  v8 = [(PKAccountAutomaticPaymentsDateFooterView *)self textLabel];
  [v8 frame];
  objc_msgSend(v8, "sizeThatFits:", v4 + -30.0, 0.0);
  double v10 = v9;
  double v12 = v11;
  double v13 = v7 + 8.0;
  double v14 = 15.0;
  if (self->_collectionViewController && PKIsVision())
  {
    PKRectCenteredXInRect();
    double v14 = v15;
    double v13 = v16;
    double v10 = v17;
    double v12 = v18;
  }
  objc_msgSend(v8, "setFrame:", v14, v13, v10, v12);
}

- (void)setCollectionViewController:(id)a3
{
  id v8 = a3;
  v5 = [(PKMonthDayCollectionViewController *)self->_collectionViewController collectionView];
  [v5 removeFromSuperview];

  objc_storeStrong((id *)&self->_collectionViewController, a3);
  if (self->_collectionViewController)
  {
    double v6 = [(PKAccountAutomaticPaymentsDateFooterView *)self contentView];
    double v7 = [(PKMonthDayCollectionViewController *)self->_collectionViewController collectionView];
    [v6 addSubview:v7];
  }
  [(PKAccountAutomaticPaymentsDateFooterView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[PKMonthDayCollectionViewController sizeThatFits:](self->_collectionViewController, "sizeThatFits:");
  double v7 = v6;
  id v8 = [(PKAccountAutomaticPaymentsDateFooterView *)self textLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;

  double v11 = v7 + v10 + 16.0;
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (PKMonthDayCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void).cxx_destruct
{
}

@end