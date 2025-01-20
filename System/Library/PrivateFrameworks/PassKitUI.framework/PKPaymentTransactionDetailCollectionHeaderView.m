@interface PKPaymentTransactionDetailCollectionHeaderView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentTransactionDetailCollectionHeaderView)init;
- (PKPaymentTransactionDetailCollectionHeaderView)initWithFrame:(CGRect)a3;
- (PKPaymentTransactionDetailCollectionHeaderView)initWithSize:(CGSize)a3;
- (PKPaymentTransactionDetailHeaderView)headerView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PKPaymentTransactionDetailCollectionHeaderView

- (PKPaymentTransactionDetailCollectionHeaderView)init
{
  return -[PKPaymentTransactionDetailCollectionHeaderView initWithSize:](self, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (PKPaymentTransactionDetailCollectionHeaderView)initWithSize:(CGSize)a3
{
  return -[PKPaymentTransactionDetailCollectionHeaderView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
}

- (PKPaymentTransactionDetailCollectionHeaderView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailCollectionHeaderView;
  return -[PKPaymentTransactionDetailCollectionHeaderView initWithFrame:](&v4, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKPaymentTransactionDetailHeaderView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    objc_super v4 = objc_alloc_init(PKPaymentTransactionDetailHeaderView);
    v5 = self->_headerView;
    self->_headerView = v4;

    [(PKPaymentTransactionDetailHeaderView *)self->_headerView setInBridge:PKBridgeUsesDarkAppearance()];
    v6 = [(PKPaymentTransactionDetailCollectionHeaderView *)self contentView];
    [v6 addSubview:self->_headerView];

    headerView = self->_headerView;
  }

  return headerView;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailCollectionHeaderView;
  [(PKPaymentTransactionDetailCollectionHeaderView *)&v4 layoutSubviews];
  v3 = [(PKPaymentTransactionDetailCollectionHeaderView *)self contentView];
  [v3 bounds];
  -[PKPaymentTransactionDetailCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentTransactionDetailCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[PKPaymentTransactionDetailHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.size.width, 1.79769313e308);
  double v11 = v10;
  if (!a4) {
    -[PKPaymentTransactionDetailHeaderView setFrame:](self->_headerView, "setFrame:", x, y, width, height);
  }
  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailCollectionHeaderView;
  [(PKPaymentTransactionDetailCollectionHeaderView *)&v4 prepareForReuse];
  [(PKPaymentTransactionDetailHeaderView *)self->_headerView removeFromSuperview];
  headerView = self->_headerView;
  self->_headerView = 0;
}

- (void).cxx_destruct
{
}

@end