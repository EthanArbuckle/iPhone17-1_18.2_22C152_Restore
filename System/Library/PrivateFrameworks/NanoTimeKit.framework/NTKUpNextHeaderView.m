@interface NTKUpNextHeaderView
- (CLKTextProvider)textProvider;
- (NTKUpNextHeaderView)initWithFrame:(CGRect)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation NTKUpNextHeaderView

- (NTKUpNextHeaderView)initWithFrame:(CGRect)a3
{
  v38[3] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)NTKUpNextHeaderView;
  v3 = -[NTKUpNextHeaderView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CLKRenderingContext sharedRenderingContext];
    id v5 = [v4 device];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_23);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_23);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_23);
      if (v8 == v5)
      {
        uint64_t v9 = [v5 version];
        uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_23;

        if (v9 == v10)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_23);
          double v13 = *(double *)&_LayoutConstants_constants_0_3;
          double v14 = *(double *)&_LayoutConstants_constants_1_3;
          double v15 = *(double *)&_LayoutConstants_constants_2_3;
          double v16 = *(double *)&_LayoutConstants_constants_3_2;

          id v17 = objc_alloc((Class)off_1E62BDB58);
          uint64_t v18 = objc_msgSend(v17, "initWithFrame:options:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          label = v3->_label;
          v3->_label = (CLKUIColoringLabel *)v18;

          v20 = v3->_label;
          v21 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15 weight:*MEMORY[0x1E4FB09E0]];
          [(CLKUIColoringLabel *)v20 setFont:v21];

          v22 = v3->_label;
          v23 = [MEMORY[0x1E4FB1618] whiteColor];
          [(CLKUIColoringLabel *)v22 setTextColor:v23];

          [(CLKUIColoringLabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
          v24 = v3->_label;
          v25 = [MEMORY[0x1E4FB1618] clearColor];
          [(CLKUIColoringLabel *)v24 setBackgroundColor:v25];

          [(CLKUIColoringLabel *)v3->_label setTextAlignment:0];
          [(NTKUpNextHeaderView *)v3 addSubview:v3->_label];
          v36 = [(CLKUIColoringLabel *)v3->_label leadingAnchor];
          v26 = [(NTKUpNextHeaderView *)v3 leadingAnchor];
          v27 = [v36 constraintEqualToAnchor:v26 constant:v13];
          v38[0] = v27;
          v28 = [(CLKUIColoringLabel *)v3->_label trailingAnchor];
          v29 = [(NTKUpNextHeaderView *)v3 trailingAnchor];
          v30 = [v28 constraintEqualToAnchor:v29 constant:v16 * -1.5];
          v38[1] = v30;
          v31 = [(CLKUIColoringLabel *)v3->_label lastBaselineAnchor];
          v32 = [(NTKUpNextHeaderView *)v3 bottomAnchor];
          v33 = [v31 constraintEqualToAnchor:v32 constant:-v14];
          v38[2] = v33;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];

          [MEMORY[0x1E4F28DC8] activateConstraints:v34];
          return v3;
        }
      }
      else
      {
      }
    }
    id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_23, v5);
    _LayoutConstants___previousCLKDeviceVersion_23 = [v5 version];

    ___LayoutConstants_block_invoke_20(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  return v3;
}

- (void)setTextProvider:(id)a3
{
  v4 = (CLKTextProvider *)[a3 copy];
  textProvider = self->_textProvider;
  self->_textProvider = v4;

  label = self->_label;
  v7 = self->_textProvider;
  [(CLKUIColoringLabel *)label setTextProvider:v7];
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end