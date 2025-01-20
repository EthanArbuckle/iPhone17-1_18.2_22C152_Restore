@interface PKAccountBillPaymentCheckmarkRingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (LAUICheckmarkLayer)checkmarkLayer;
- (PKAccountBillPaymentCheckmarkRingView)initWithRingView:(id)a3;
- (PKBillPaymentRingView)ringView;
- (void)layoutSubviews;
- (void)setCheckmarkLayer:(id)a3;
- (void)setRingView:(id)a3;
@end

@implementation PKAccountBillPaymentCheckmarkRingView

- (PKAccountBillPaymentCheckmarkRingView)initWithRingView:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountBillPaymentCheckmarkRingView;
  v6 = -[PKAccountBillPaymentCheckmarkRingView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ringView, a3);
    [(PKAccountBillPaymentCheckmarkRingView *)v7 addSubview:v7->_ringView];
    v8 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
    checkmarkLayer = v7->_checkmarkLayer;
    v7->_checkmarkLayer = v8;

    [(LAUICheckmarkLayer *)v7->_checkmarkLayer setLineWidthScale:1.4];
    [(LAUICheckmarkLayer *)v7->_checkmarkLayer setRevealed:0 animated:0];
    v10 = [(PKAccountBillPaymentCheckmarkRingView *)v7 layer];
    [v10 addSublayer:v7->_checkmarkLayer];
  }
  return v7;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKAccountBillPaymentCheckmarkRingView;
  [(PKAccountBillPaymentCheckmarkRingView *)&v23 layoutSubviews];
  [(PKAccountBillPaymentCheckmarkRingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[PKBillPaymentRingView sizeThatFits:](self->_ringView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v8 = v7;
  double v10 = v9;
  -[PKBillPaymentRingView setBounds:](self->_ringView, "setBounds:", v4, v6, v7, v9);
  PKSizeScaleAspectFit();
  double v12 = v11;
  double v14 = v13;
  ringView = self->_ringView;
  CATransform3DMakeScale(&v22, v11 / v8, v13 / v10, 1.0);
  [(PKBillPaymentRingView *)ringView setTransform3D:&v22];
  v16 = self->_ringView;
  double v17 = *MEMORY[0x1E4F1DAD8];
  double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v19 = [(PKBillPaymentRingView *)v16 layer];
  [v19 anchorPoint];
  -[PKBillPaymentRingView setPosition:](v16, "setPosition:", v17 + v20 * v12, v18 + v21 * v14);

  [(LAUICheckmarkLayer *)self->_checkmarkLayer aspectSize];
  PKSizeScaleAspectFit();
  PKSizeAlignedInRect();
  -[LAUICheckmarkLayer setFrame:](self->_checkmarkLayer, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKBillPaymentRingView sizeThatFits:](self->_ringView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  PKSizeScaleAspectFit();
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKBillPaymentRingView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
}

- (LAUICheckmarkLayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (void)setCheckmarkLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);

  objc_storeStrong((id *)&self->_ringView, 0);
}

@end