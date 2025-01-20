@interface PKPaymentSetupProductCell
+ (id)reuseIdentifier;
- (BOOL)drawsTopSeperator;
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupProductCell)init;
- (double)textLabelOffset;
- (id)pk_childrenForAppearance;
- (void)_updateDisplay;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)setDrawsTopSeperator:(BOOL)a3;
- (void)setProduct:(id)a3;
- (void)setTextLabelOffset:(double)a3;
@end

@implementation PKPaymentSetupProductCell

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupProductCell;
  [(PKTableViewCell *)&v3 pk_applyAppearance:a3];
}

- (PKPaymentSetupProductCell)init
{
  objc_super v3 = [(id)objc_opt_class() reuseIdentifier];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupProductCell;
  v4 = [(PKPaymentSetupProductCell *)&v8 initWithStyle:0 reuseIdentifier:v3];

  if (v4)
  {
    v5 = [(PKPaymentSetupProductCell *)v4 textLabel];
    v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v5 setFont:v6];
  }
  return v4;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setProduct:(id)a3
{
  v5 = (PKPaymentSetupProduct *)a3;
  if (self->_product != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_product, a3);
    [(PKPaymentSetupProductCell *)self _updateDisplay];
    v5 = v6;
  }
}

- (void)_updateDisplay
{
  id v4 = [(PKPaymentSetupProductCell *)self textLabel];
  objc_super v3 = [(PKPaymentSetupProduct *)self->_product displayName];
  [v4 setText:v3];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupProductCell;
  [(PKPaymentSetupProductCell *)&v14 layoutSubviews];
  if (self->_textLabelOffset > 0.0)
  {
    objc_super v3 = [(PKPaymentSetupProductCell *)self textLabel];
    [v3 frame];
    double v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;

    double textLabelOffset = self->_textLabelOffset;
    v15.origin.x = textLabelOffset;
    v15.origin.y = v5;
    v15.size.width = v7;
    v15.size.height = v9;
    double Width = CGRectGetWidth(v15);
    [(PKPaymentSetupProductCell *)self bounds];
    if (Width >= CGRectGetWidth(v16) - self->_textLabelOffset)
    {
      [(PKPaymentSetupProductCell *)self bounds];
      double v12 = CGRectGetWidth(v18) - self->_textLabelOffset;
    }
    else
    {
      v17.origin.x = textLabelOffset;
      v17.origin.y = v5;
      v17.size.width = v7;
      v17.size.height = v9;
      double v12 = CGRectGetWidth(v17);
    }
    v13 = [(PKPaymentSetupProductCell *)self textLabel];
    objc_msgSend(v13, "setFrame:", textLabelOffset, v5, v12, v9);
  }
}

- (void)drawRect:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProductCell;
  -[PKPaymentSetupProductCell drawRect:](&v9, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_drawsTopSeperator)
  {
    [(PKPaymentSetupProductCell *)self contentScaleFactor];
    CGFloat v5 = 1.0 / v4;
    CurrentContext = UIGraphicsGetCurrentContext();
    id v7 = [MEMORY[0x1E4FB1618] separatorColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);

    double v8 = UIGraphicsGetCurrentContext();
    [(PKPaymentSetupProductCell *)self bounds];
    v11.size.width = CGRectGetWidth(v10);
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.height = v5;
    CGContextFillRect(v8, v11);
  }
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (double)textLabelOffset
{
  return self->_textLabelOffset;
}

- (void)setTextLabelOffset:(double)a3
{
  self->_double textLabelOffset = a3;
}

- (BOOL)drawsTopSeperator
{
  return self->_drawsTopSeperator;
}

- (void)setDrawsTopSeperator:(BOOL)a3
{
  self->_drawsTopSeperator = a3;
}

- (void).cxx_destruct
{
}

@end