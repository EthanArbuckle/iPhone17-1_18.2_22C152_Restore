@interface NTKUpNextAccessoryView
- (NTKUpNextAccessoryView)initWithFrame:(CGRect)a3;
- (id)viewForLastBaselineLayout;
- (void)configureWithDescription:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation NTKUpNextAccessoryView

- (NTKUpNextAccessoryView)initWithFrame:(CGRect)a3
{
  v45[4] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)NTKUpNextAccessoryView;
  v3 = -[NTKUpNextAccessoryView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CLKRenderingContext sharedRenderingContext];
    id v5 = [v4 device];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_29);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_29);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_29);
      if (v8 == v5)
      {
        uint64_t v9 = [v5 version];
        uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_29;

        if (v9 == v10)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_29);
          double v13 = *(double *)&_LayoutConstants_constants_0_6;
          double v14 = *(double *)&_LayoutConstants_constants_1_6;
          double v15 = *(double *)&_LayoutConstants_constants_2_6;

          v16 = [MEMORY[0x1E4F19A50] systemFontOfSize:v13 weight:*MEMORY[0x1E4FB09D0]];
          id v17 = objc_alloc((Class)off_1E62BDB58);
          uint64_t v18 = objc_msgSend(v17, "initWithFrame:options:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          label = v3->_label;
          v3->_label = (CLKUIColoringLabel *)v18;

          v39 = v16;
          [(CLKUIColoringLabel *)v3->_label setFont:v16];
          v20 = v3->_label;
          v21 = [MEMORY[0x1E4FB1618] whiteColor];
          [(CLKUIColoringLabel *)v20 setTextColor:v21];

          [(CLKUIColoringLabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v3->_label setLineBreakMode:4];
          [(CLKUIColoringLabel *)v3->_label setNumberOfLines:1];
          [(CLKUIColoringLabel *)v3->_label setNowProvider:&__block_literal_global_81];
          LODWORD(v22) = 1148846080;
          [(CLKUIColoringLabel *)v3->_label setContentCompressionResistancePriority:0 forAxis:v22];
          LODWORD(v23) = 1148846080;
          [(CLKUIColoringLabel *)v3->_label setContentCompressionResistancePriority:1 forAxis:v23];
          LODWORD(v24) = 1148846080;
          [(CLKUIColoringLabel *)v3->_label setContentHuggingPriority:1 forAxis:v24];
          LODWORD(v25) = 1148846080;
          [(CLKUIColoringLabel *)v3->_label setContentHuggingPriority:0 forAxis:v25];
          v26 = [(NTKUpNextAccessoryView *)v3 layer];
          [v26 setCornerRadius:v14];

          v27 = [(NTKUpNextAccessoryView *)v3 layer];
          [v27 setCornerCurve:*MEMORY[0x1E4F39EA8]];

          [(NTKUpNextAccessoryView *)v3 addSubview:v3->_label];
          v43 = [(CLKUIColoringLabel *)v3->_label leadingAnchor];
          v42 = [(NTKUpNextAccessoryView *)v3 leadingAnchor];
          v41 = [v43 constraintEqualToAnchor:v42 constant:v15];
          v45[0] = v41;
          v40 = [(CLKUIColoringLabel *)v3->_label trailingAnchor];
          v28 = [(NTKUpNextAccessoryView *)v3 trailingAnchor];
          v29 = [v40 constraintEqualToAnchor:v28 constant:-v15];
          v45[1] = v29;
          v30 = [(CLKUIColoringLabel *)v3->_label firstBaselineAnchor];
          v31 = [(NTKUpNextAccessoryView *)v3 bottomAnchor];
          v32 = [v30 constraintEqualToAnchor:v31 constant:-v15];
          v45[2] = v32;
          v33 = [(NTKUpNextAccessoryView *)v3 topAnchor];
          v34 = [(CLKUIColoringLabel *)v3->_label firstBaselineAnchor];
          [v16 capHeight];
          v36 = [v33 constraintEqualToAnchor:v34 constant:-(v15 + v35)];
          v45[3] = v36;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];

          [MEMORY[0x1E4F28DC8] activateConstraints:v37];
          return v3;
        }
      }
      else
      {
      }
    }
    id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_29, v5);
    _LayoutConstants___previousCLKDeviceVersion_29 = [v5 version];

    ___LayoutConstants_block_invoke_26(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  return v3;
}

uint64_t __40__NTKUpNextAccessoryView_initWithFrame___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (void)configureWithDescription:(id)a3
{
  p_accessoryDescription = &self->_accessoryDescription;
  id v9 = a3;
  if ((-[REAccessoryDescription isEqual:](*p_accessoryDescription, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryDescription, a3);
    [(CLKUIColoringLabel *)self->_label setText:0];
    label = self->_label;
    v7 = [(REAccessoryDescription *)*p_accessoryDescription textProvider];
    [(CLKUIColoringLabel *)label setTextProvider:v7];

    id v8 = [(REAccessoryDescription *)*p_accessoryDescription backgroundColor];
    [(NTKUpNextAccessoryView *)self setBackgroundColor:v8];
  }
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_accessoryDescription, 0);
}

@end