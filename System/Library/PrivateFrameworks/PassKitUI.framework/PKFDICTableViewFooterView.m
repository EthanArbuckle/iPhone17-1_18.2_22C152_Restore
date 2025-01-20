@interface PKFDICTableViewFooterView
- (CGSize)_layoutSubviewsInBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKFDICTableViewFooterView)initWithReuseIdentifier:(id)a3 feature:(unint64_t)a4 displayingBankName:(BOOL)a5 footerText:(id)a6;
- (void)layoutSubviews;
@end

@implementation PKFDICTableViewFooterView

- (PKFDICTableViewFooterView)initWithReuseIdentifier:(id)a3 feature:(unint64_t)a4 displayingBankName:(BOOL)a5 footerText:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKFDICTableViewFooterView;
  v11 = [(PKFDICTableViewFooterView *)&v21 initWithReuseIdentifier:a3];
  if (v11)
  {
    v12 = [[PKFDICSignageView alloc] initWithFeature:a4 displayingBankName:v6];
    fdicView = v11->_fdicView;
    v11->_fdicView = v12;

    v14 = [(PKFDICTableViewFooterView *)v11 contentView];
    [v14 addSubview:v11->_fdicView];

    if ([v10 length])
    {
      v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      footerLabel = v11->_footerLabel;
      v11->_footerLabel = v15;

      [(UILabel *)v11->_footerLabel setText:v10];
      [(UILabel *)v11->_footerLabel setNumberOfLines:0];
      v17 = [(id)objc_opt_class() _defaultFontForTableViewStyle:1 isSectionHeader:0];
      [(UILabel *)v11->_footerLabel setFont:v17];
      v18 = [(id)objc_opt_class() _defaultTextColorForTableViewStyle:1 isSectionHeader:0];
      [(UILabel *)v11->_footerLabel setTextColor:v18];
      v19 = [(PKFDICTableViewFooterView *)v11 contentView];
      [v19 addSubview:v11->_footerLabel];
    }
  }

  return v11;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKFDICTableViewFooterView;
  [(PKFDICTableViewFooterView *)&v4 layoutSubviews];
  v3 = [(PKFDICTableViewFooterView *)self contentView];
  [v3 bounds];
  -[PKFDICTableViewFooterView _layoutSubviewsInBounds:isTemplateLayout:](self, "_layoutSubviewsInBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v4 = [(PKFDICTableViewFooterView *)self contentView];
  [v4 bounds];
  -[PKFDICTableViewFooterView _layoutSubviewsInBounds:isTemplateLayout:](self, "_layoutSubviewsInBounds:isTemplateLayout:", 1);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_layoutSubviewsInBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(PKFDICTableViewFooterView *)self contentView];
  [v10 layoutMargins];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  CGFloat v19 = x + v14;
  double v20 = y + v12;
  double v21 = v14 + v18;
  double v22 = width;
  double v23 = v16;
  CGFloat v24 = v19;
  double v25 = v22 - v21;
  double v26 = height - (v12 + v23);
  remainder.origin.double x = v19;
  remainder.origin.double y = v20;
  remainder.size.CGFloat width = v22 - v21;
  remainder.size.double height = v26;
  memset(&v37, 0, sizeof(v37));
  v27 = [(PKFDICTableViewFooterView *)self contentView];
  [v27 _shouldReverseLayoutDirection];

  footerLabel = self->_footerLabel;
  if (footerLabel)
  {
    -[UILabel sizeThatFits:](footerLabel, "sizeThatFits:", v25, 1.79769313e308);
    CGFloat v30 = v29;
    v40.origin.double x = v24;
    v40.origin.double y = v20;
    v40.size.CGFloat width = v25;
    v40.size.double height = v26;
    CGRectDivide(v40, &v37, &remainder, v30, CGRectMinYEdge);
    double v31 = v12 + v30;
    if (!a4) {
      -[UILabel setFrame:](self->_footerLabel, "setFrame:", *(_OWORD *)&v37.origin, *(_OWORD *)&v37.size);
    }
    CGRectDivide(remainder, &v37, &remainder, 16.0, CGRectMinYEdge);
    double v12 = v31 + 16.0;
    double v25 = remainder.size.width;
  }
  -[PKFDICSignageView sizeThatFits:](self->_fdicView, "sizeThatFits:", v25, 1.79769313e308);
  double v33 = v32;
  CGRectDivide(remainder, &v37, &remainder, v32, CGRectMinYEdge);
  if (!a4)
  {
    fdicView = self->_fdicView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[PKFDICSignageView setFrame:](fdicView, "setFrame:");
  }
  double v35 = v23 + v12 + v33;
  double v36 = v22;
  result.double height = v35;
  result.CGFloat width = v36;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdicView, 0);

  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end