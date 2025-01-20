@interface REUpNextAccessoryView
+ (void)initialize;
- (REUpNextAccessoryView)initWithFrame:(CGRect)a3;
- (id)viewForLastBaselineLayout;
- (void)configureWithDescription:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation REUpNextAccessoryView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0_1 = 0x4030800000000000;
    kActiveLayout_2_1 = 0x400C000000000000;
    kActiveLayout_1_1 = 0x4000000000000000;
  }
}

- (REUpNextAccessoryView)initWithFrame:(CGRect)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)REUpNextAccessoryView;
  v3 = -[REUpNextAccessoryView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_0_1 weight:*MEMORY[0x263F1D330]];
    id v5 = objc_alloc(MEMORY[0x263F32120]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:options:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (CLKUIColoringLabel *)v6;

    v27 = v4;
    [(CLKUIColoringLabel *)v3->_label setFont:v4];
    [(CLKUIColoringLabel *)v3->_label setNowProvider:&__block_literal_global_2];
    v8 = v3->_label;
    v9 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v8 setTextColor:v9];

    [(CLKUIColoringLabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_label setLineBreakMode:4];
    [(CLKUIColoringLabel *)v3->_label setNumberOfLines:1];
    LODWORD(v10) = 1148846080;
    [(CLKUIColoringLabel *)v3->_label setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [(CLKUIColoringLabel *)v3->_label setContentCompressionResistancePriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(CLKUIColoringLabel *)v3->_label setContentHuggingPriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(CLKUIColoringLabel *)v3->_label setContentHuggingPriority:0 forAxis:v13];
    v14 = [(REUpNextAccessoryView *)v3 layer];
    [v14 setCornerRadius:*(double *)&kActiveLayout_1_1];

    v15 = [(REUpNextAccessoryView *)v3 layer];
    [v15 setCornerCurve:*MEMORY[0x263F15A20]];

    [(REUpNextAccessoryView *)v3 addSubview:v3->_label];
    v31 = [(CLKUIColoringLabel *)v3->_label leadingAnchor];
    v30 = [(REUpNextAccessoryView *)v3 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:*(double *)&kActiveLayout_2_1];
    v33[0] = v29;
    v28 = [(CLKUIColoringLabel *)v3->_label trailingAnchor];
    v16 = [(REUpNextAccessoryView *)v3 trailingAnchor];
    v17 = [v28 constraintEqualToAnchor:v16 constant:-*(double *)&kActiveLayout_2_1];
    v33[1] = v17;
    v18 = [(CLKUIColoringLabel *)v3->_label firstBaselineAnchor];
    v19 = [(REUpNextAccessoryView *)v3 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:-*(double *)&kActiveLayout_2_1];
    v33[2] = v20;
    v21 = [(REUpNextAccessoryView *)v3 topAnchor];
    v22 = [(CLKUIColoringLabel *)v3->_label firstBaselineAnchor];
    [v4 capHeight];
    v24 = [v21 constraintEqualToAnchor:v22 constant:-(v23 + *(double *)&kActiveLayout_2_1)];
    v33[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];

    [MEMORY[0x263F08938] activateConstraints:v25];
  }
  return v3;
}

uint64_t __39__REUpNextAccessoryView_initWithFrame___block_invoke()
{
  return [MEMORY[0x263EFF910] date];
}

- (void)configureWithDescription:(id)a3
{
  p_accessoryDescription = &self->_accessoryDescription;
  id v9 = a3;
  if ((-[REAccessoryDescription isEqual:](*p_accessoryDescription, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryDescription, a3);
    label = self->_label;
    v7 = [(REAccessoryDescription *)*p_accessoryDescription textProvider];
    [(CLKUIColoringLabel *)label setTextProvider:v7];

    v8 = [(REAccessoryDescription *)*p_accessoryDescription backgroundColor];
    [(REUpNextAccessoryView *)self setBackgroundColor:v8];
  }
}

- (void)setTextColor:(id)a3
{
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_accessoryDescription, 0);
}

@end