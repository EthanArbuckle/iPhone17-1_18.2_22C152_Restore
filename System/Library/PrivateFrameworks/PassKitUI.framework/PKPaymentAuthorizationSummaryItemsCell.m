@interface PKPaymentAuthorizationSummaryItemsCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentAuthorizationSummaryItemsCell)initWithLayout:(id)a3 reuseIdentifier:(id)a4;
- (PKPaymentAuthorizationSummaryItemsView)summaryItemsView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PKPaymentAuthorizationSummaryItemsCell

- (PKPaymentAuthorizationSummaryItemsCell)initWithLayout:(id)a3 reuseIdentifier:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  v7 = [(PKPaymentAuthorizationSummaryItemsCell *)&v16 initWithStyle:0 reuseIdentifier:a4];
  v8 = v7;
  if (v7)
  {
    [(PKPaymentAuthorizationSummaryItemsCell *)v7 setSelectionStyle:0];
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPaymentAuthorizationSummaryItemsCell *)v8 setBackgroundColor:v9];

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    constraints = v8->_constraints;
    v8->_constraints = v10;

    v12 = [[PKPaymentAuthorizationSummaryItemsView alloc] initWithLayout:v6];
    summaryItemsView = v8->_summaryItemsView;
    v8->_summaryItemsView = v12;

    v14 = [(PKPaymentAuthorizationSummaryItemsCell *)v8 contentView];
    [v14 addSubview:v8->_summaryItemsView];
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  [(PKPaymentAuthorizationSummaryItemsCell *)&v2 dealloc];
}

- (void)prepareForReuse
{
  [(PKPaymentAuthorizationSummaryItemsView *)self->_summaryItemsView removeLabelsAndValues];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  [(PKTableViewCell *)&v3 prepareForReuse];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationSummaryItemsCell;
  [(PKPaymentAuthorizationSummaryItemsCell *)&v11 layoutSubviews];
  summaryItemsView = self->_summaryItemsView;
  v4 = [(PKPaymentAuthorizationSummaryItemsCell *)self contentView];
  [v4 bounds];
  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](summaryItemsView, "sizeThatFits:", v5, v6);
  double v8 = v7;
  double v10 = v9;

  -[PKPaymentAuthorizationSummaryItemsView setFrame:](self->_summaryItemsView, "setFrame:", 0.0, 0.0, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](self->_summaryItemsView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKPaymentAuthorizationSummaryItemsView)summaryItemsView
{
  return self->_summaryItemsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryItemsView, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end