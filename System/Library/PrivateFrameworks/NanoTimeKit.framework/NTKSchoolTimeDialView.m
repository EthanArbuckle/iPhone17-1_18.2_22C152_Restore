@interface NTKSchoolTimeDialView
- (NTKSchoolTimeDialView)initWithFrame:(CGRect)a3 ringWidth:(double)a4;
- (id)_activeHourColor;
- (id)_inactiveHourColor;
- (void)_setupUI;
- (void)setActiveHour:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation NTKSchoolTimeDialView

- (NTKSchoolTimeDialView)initWithFrame:(CGRect)a3 ringWidth:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKSchoolTimeDialView;
  v5 = -[NTKSchoolTimeDialView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_ringWidth = a4;
    [(NTKSchoolTimeDialView *)v5 _setupUI];
  }
  return v6;
}

- (void)_setupUI
{
  v63[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F19A30] currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_8, v3);
    _LayoutConstants___previousCLKDeviceVersion_8 = [v3 version];

    ___LayoutConstants_block_invoke_7(v10, (uint64_t)v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _LayoutConstants___previousCLKDeviceVersion_8;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  double v59 = *(double *)&_LayoutConstants___constants_0_1;

  double v11 = self->_ringWidth * 0.5;
  [(NTKSchoolTimeDialView *)self bounds];
  CGRect v65 = CGRectInset(v64, v11 * 0.5, v11 * 0.5);
  CGFloat x = v65.origin.x;
  CGFloat y = v65.origin.y;
  double width = v65.size.width;
  CGFloat height = v65.size.height;
  v16 = [MEMORY[0x1E4F39C88] layer];
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.double width = width;
  v66.size.CGFloat height = height;
  objc_msgSend(v16, "setPath:", CGPathCreateWithEllipseInRect(v66, 0));
  id v17 = +[NTKSchoolTimeFaceView schoolTimeColor];
  objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

  [v16 setFillColor:0];
  [v16 setLineWidth:v11];
  v18 = [(NTKSchoolTimeDialView *)self layer];
  v53 = v16;
  [v18 addSublayer:v16];

  v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:12];
  double v20 = MEMORY[0x1C1874A70]([(NTKSchoolTimeDialView *)self bounds]);
  double v57 = v21;
  double v58 = v20;
  double v22 = width * 0.5;
  v23 = objc_opt_new();
  [v23 setNumberStyle:0];
  v24 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v23 setLocale:v24];

  v54 = v3;
  v25 = [MEMORY[0x1E4F19A40] metricsWithDevice:v3 identitySizeClass:3];
  v62[0] = &unk_1F16E0AC8;
  v26 = (void *)MEMORY[0x1E4F29238];
  [v25 scaledValue:0 withOverride:-1.0 forSizeClass:0.0];
  v27 = objc_msgSend(v26, "valueWithCGPoint:");
  v63[0] = v27;
  v62[1] = &unk_1F16E0AE0;
  v28 = (void *)MEMORY[0x1E4F29238];
  [v25 scaledValue:0 withOverride:1.0 forSizeClass:0.0];
  v29 = objc_msgSend(v28, "valueWithCGPoint:");
  v63[1] = v29;
  v62[2] = &unk_1F16E0AF8;
  v30 = (void *)MEMORY[0x1E4F29238];
  v60[0] = &unk_1F16E0B10;
  v60[1] = &unk_1F16E0B28;
  v61[0] = &unk_1F16E5F20;
  v61[1] = &unk_1F16E5F20;
  v60[2] = &unk_1F16E0B40;
  v61[2] = &unk_1F16E5F20;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  [v25 scaledValue:v31 withOverrides:-1.0];
  v33 = objc_msgSend(v30, "valueWithCGPoint:", 0.0, v32);
  v63[2] = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];

  double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v55 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v56 = *MEMORY[0x1E4F1DB28];
  double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v37 = *MEMORY[0x1E4FB09E0];
  for (unint64_t i = 1; i != 13; ++i)
  {
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v56, v55, v35, v36);
    v40 = [MEMORY[0x1E4F19A50] compactSoftFontOfSize:v59 weight:v37];
    [v39 setFont:v40];

    v41 = [NSNumber numberWithUnsignedInteger:i];
    v42 = [v23 stringFromNumber:v41];
    [v39 setText:v42];

    v43 = [(NTKSchoolTimeDialView *)self _inactiveHourColor];
    [v39 setTextColor:v43];

    [v39 sizeToFit];
    __double2 v44 = __sincos_stret((double)i * 0.523598776 + -1.57079633);
    double v45 = round(v58 + v22 * v44.__cosval);
    double v46 = round(v57 + v22 * v44.__sinval);
    v47 = [NSNumber numberWithUnsignedInteger:i];
    v48 = [v34 objectForKeyedSubscript:v47];

    if (v48)
    {
      [v48 CGPointValue];
      double v45 = v45 + v49;
      double v46 = v46 + v50;
    }
    objc_msgSend(v39, "setCenter:", v45, v46);
    [(NTKSchoolTimeDialView *)self addSubview:v39];
    v51 = [NSNumber numberWithUnsignedInteger:i];
    [(NSDictionary *)v19 setObject:v39 forKeyedSubscript:v51];
  }
  hourLabels = self->_hourLabels;
  self->_hourLabels = v19;
}

- (void)setActiveHour:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_activeHour != a3)
  {
    BOOL v4 = a4;
    self->_activeHour = a3;
    hourLabels = self->_hourLabels;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v8 = [(NSDictionary *)hourLabels objectForKeyedSubscript:v7];

    id v9 = self->_hourLabels;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_activeHour];
    double v11 = [(NSDictionary *)v9 objectForKeyedSubscript:v10];

    if (v4)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__NTKSchoolTimeDialView_setActiveHour_animated___block_invoke;
      aBlock[3] = &unk_1E62C2400;
      id v16 = v8;
      id v17 = self;
      id v18 = v11;
      v12 = (void (**)(double))_Block_copy(aBlock);
      v12[2](1.0);
    }
    else
    {
      if (v8)
      {
        v13 = [(NTKSchoolTimeDialView *)self _inactiveHourColor];
        [v8 setTextColor:v13];
      }
      if (v11)
      {
        v14 = [(NTKSchoolTimeDialView *)self _activeHourColor];
        [v11 setTextColor:v14];
      }
    }
  }
}

void __48__NTKSchoolTimeDialView_setActiveHour_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) _activeHourColor];
    BOOL v4 = [*(id *)(a1 + 40) _inactiveHourColor];
    v5 = NTKInterpolateBetweenColors();
    [v2 setTextColor:v5];
  }
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v9 = [*(id *)(a1 + 40) _inactiveHourColor];
    uint64_t v7 = [*(id *)(a1 + 40) _activeHourColor];
    uint64_t v8 = NTKInterpolateBetweenColors();
    [v6 setTextColor:v8];
  }
}

- (id)_inactiveHourColor
{
  if (_inactiveHourColor_onceToken != -1) {
    dispatch_once(&_inactiveHourColor_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)_inactiveHourColor___color;
  return v2;
}

void __43__NTKSchoolTimeDialView__inactiveHourColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
  v1 = (void *)_inactiveHourColor___color;
  _inactiveHourColor___color = v0;
}

- (id)_activeHourColor
{
  if (_activeHourColor_onceToken != -1) {
    dispatch_once(&_activeHourColor_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)_activeHourColor___color;
  return v2;
}

void __41__NTKSchoolTimeDialView__activeHourColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] blackColor];
  v1 = (void *)_activeHourColor___color;
  _activeHourColor___color = v0;
}

- (void).cxx_destruct
{
}

@end