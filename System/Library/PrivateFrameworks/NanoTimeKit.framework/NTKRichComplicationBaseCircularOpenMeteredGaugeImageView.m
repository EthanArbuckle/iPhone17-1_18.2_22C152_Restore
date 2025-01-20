@interface NTKRichComplicationBaseCircularOpenMeteredGaugeImageView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (int64_t)progressFillStyle;
- ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstraintsWithDevice:(SEL)a3 family:(id)a4;
- (CDRichComplicationCurvedProgressView)progressView;
- (CDRichComplicationImageView)centerImageView;
- (CLKUIColoringLabel)smallLabel;
- (NTKRichComplicationBaseCircularOpenMeteredGaugeImageView)initWithFamily:(int64_t)a3;
- (double)_smallLabelFontWeight;
- (int64_t)_innerFilterStyle;
- (int64_t)_outerFilterStyle;
- (int64_t)tritiumUpdateMode;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setCenterImageView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setProgressView:(id)a3;
- (void)setSmallLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularOpenMeteredGaugeImageView

- (int64_t)_outerFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)_innerFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

- (NTKRichComplicationBaseCircularOpenMeteredGaugeImageView)initWithFamily:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v20, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v6 = [(CDRichComplicationView *)v4 device];
    [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)v5 _layoutConstraintsWithDevice:v6 family:a3];

    id v7 = objc_alloc((Class)off_1E62BD620);
    v8 = [(CDRichComplicationView *)v5 device];
    uint64_t v9 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v8, -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _outerFilterStyle](v5, "_outerFilterStyle"), objc_msgSend((id)objc_opt_class(), "progressFillStyle"), 0.0, 0.0, 0.0, 6.28318531 - 0.0);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v9;

    [(CDRichComplicationCurvedProgressView *)v5->_progressView setFilterProvider:v5];
    v11 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v11 addSubview:v5->_progressView];

    id v12 = objc_alloc((Class)off_1E62BD628);
    v13 = [(CDRichComplicationView *)v5 device];
    uint64_t v14 = [v12 initWithDevice:v13 useAccentColor:1];
    centerImageView = v5->_centerImageView;
    v5->_centerImageView = (CDRichComplicationImageView *)v14;

    [(CDRichComplicationImageView *)v5->_centerImageView setPaused:[(CDRichComplicationView *)v5 paused]];
    [(CDRichComplicationImageView *)v5->_centerImageView setFilterProvider:v5];
    v16 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v16 addSubview:v5->_centerImageView];

    uint64_t v17 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    smallLabel = v5->_smallLabel;
    v5->_smallLabel = (CLKUIColoringLabel *)v17;

    [(CLKUIColoringLabel *)v5->_smallLabel setUppercase:0];
  }
  return v5;
}

- (void)layoutSubviews
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  [(NTKRichComplicationCircularBaseView *)&v46 layoutSubviews];
  int v3 = [(CDRichComplicationView *)self device];
  [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self _layoutConstraintsWithDevice:v3 family:[(CDRichComplicationView *)self family]];

  v4 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self progressView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  uint64_t v14 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self centerImageView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self _smallLabelFontWeight];
  double v26 = v25;
  v27 = [NSNumber numberWithDouble:0.0];
  v48[0] = v27;
  v28 = [NSNumber numberWithDouble:0.0];
  v48[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v30 = [NSNumber numberWithDouble:0.0];
  v47[0] = v30;
  v31 = [NSNumber numberWithDouble:0.0];
  v47[1] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:v24 fontWeight:v29 possibleMaxWidths:v32 possibleFontSizes:v26];

  v33 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  [v33 frame];

  v34 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  v35 = [v34 font];
  [v35 ascender];

  v36 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  -[CDRichComplicationView setPaused:](&v6, sel_setPaused_);
  double v5 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self centerImageView];
  [v5 setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self centerImageView];
  v4 = [v3 tritiumUpdateMode];

  if (v4)
  {
    unint64_t v5 = [v4 integerValue];
    if (v5 >= 2) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

+ (int64_t)progressFillStyle
{
  return 2;
}

- (double)_smallLabelFontWeight
{
  return *MEMORY[0x1E4FB09E0];
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstraintsWithDevice:(SEL)a3 family:(id)a4
{
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_39);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_39);
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    id v10 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_39);
    if (v10 == v7)
    {
      uint64_t v11 = [v7 version];
      uint64_t v12 = _LayoutConstants___previousCLKDeviceVersion_39;

      if (v11 == v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&_LayoutConstants___cachedDevice_39, v7);
  _LayoutConstants___previousCLKDeviceVersion_39 = [v7 version];

  ___LayoutConstants_block_invoke_36(v14, v7);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_39);
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  if (a5 == 12)
  {
    double v16 = &_LayoutConstants__constantsGraphicExtraLarge;
  }
  else
  {
    if (a5 != 10)
    {
      double v15 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _layoutConstraintsWithDevice:family:](a5, v15);
      }
    }
    double v16 = &_LayoutConstants__constants_0;
  }
  long long v17 = v16[1];
  *(_OWORD *)&retstr->var0 = *v16;
  *(_OWORD *)&retstr->var2 = v17;
  long long v18 = v16[3];
  *(_OWORD *)&retstr->var4 = v16[2];
  *(_OWORD *)&retstr->var6 = v18;

  return result;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  v4 = (void (**)(id, void *))a3;
  [(CDRichComplicationView *)&v6 _enumerateLabelsWithBlock:v4];
  unint64_t v5 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  v4[2](v4, v5);
}

- (void)_editingDidEnd
{
  id v2 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  [v2 editingDidEnd];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  unint64_t v5 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self centerImageView];
  [v5 transitionToMonochromeWithFraction:a3];

  objc_super v6 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  objc_msgSend(v6, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _innerFilterStyle](self, "_innerFilterStyle"), a3);

  id v7 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self progressView];
  [v7 transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  BOOL v3 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self centerImageView];
  [v3 updateMonochromeColor];

  v4 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  objc_msgSend(v4, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _innerFilterStyle](self, "_innerFilterStyle"));

  id v5 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self progressView];
  [v5 updateMonochromeColor];
}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (CDRichComplicationImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
{
}

- (CLKUIColoringLabel)smallLabel
{
  return self->_smallLabel;
}

- (void)setSmallLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallLabel, 0);
  objc_storeStrong((id *)&self->_centerImageView, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

- (void)_layoutConstraintsWithDevice:(uint64_t)a1 family:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  BOOL v3 = "const OpenMeteredGaugeViewLayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

@end