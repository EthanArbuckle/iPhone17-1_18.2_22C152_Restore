@interface REUpNextHeaderView
+ (void)initialize;
- (NSAttributedString)attributedText;
- (REUpNextHeaderView)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (int64_t)textAlignment;
- (void)setAttributedText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation REUpNextHeaderView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_2_3 = 0x4030000000000000;
    kActiveLayout_0_3 = 0x3FF0000000000000;
    kActiveLayout_1_3 = 0x401E000000000000;
  }
}

- (REUpNextHeaderView)initWithFrame:(CGRect)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)REUpNextHeaderView;
  v3 = -[REUpNextHeaderView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    v7 = v3->_label;
    v8 = [MEMORY[0x263F1C658] systemFontOfSize:*(double *)&kActiveLayout_2_3 weight:*MEMORY[0x263F1D340]];
    [(UILabel *)v7 setFont:v8];

    v9 = v3->_label;
    v10 = [MEMORY[0x263F1C550] blackColor];
    [(UILabel *)v9 setTextColor:v10];

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = v3->_label;
    v12 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    [(UILabel *)v3->_label setTextAlignment:4];
    [(REUpNextHeaderView *)v3 addSubview:v3->_label];
    v23 = [(UILabel *)v3->_label leadingAnchor];
    v13 = [(REUpNextHeaderView *)v3 leadingAnchor];
    v14 = [v23 constraintEqualToAnchor:v13 constant:*(double *)&kActiveLayout_0_3];
    v25[0] = v14;
    v15 = [(UILabel *)v3->_label trailingAnchor];
    v16 = [(REUpNextHeaderView *)v3 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:-*(double *)&kActiveLayout_0_3];
    v25[1] = v17;
    v18 = [(UILabel *)v3->_label lastBaselineAnchor];
    v19 = [(REUpNextHeaderView *)v3 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:-*(double *)&kActiveLayout_1_3];
    v25[2] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];

    [MEMORY[0x263F08938] activateConstraints:v21];
  }
  return v3;
}

- (void)setAttributedText:(id)a3
{
  id v4 = (NSAttributedString *)[a3 copy];
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  label = self->_label;
  v7 = self->_attributedText;

  [(UILabel *)label setAttributedText:v7];
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_label textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (UIColor)textColor
{
  return [(UILabel *)self->_label textColor];
}

- (void)setTextColor:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end