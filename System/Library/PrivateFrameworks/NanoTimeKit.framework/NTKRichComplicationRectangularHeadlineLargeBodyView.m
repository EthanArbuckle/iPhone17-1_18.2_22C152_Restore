@interface NTKRichComplicationRectangularHeadlineLargeBodyView
- (CGSize)_bodySize;
- (CLKUIColoringLabel)headerLabel;
- (NTKRichComplicationRectangularHeadlineLargeBodyView)init;
- (id)body;
- (id)headerTextProviderFromTemplate:(id)a3;
- (void)_editingDidEnd;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setHeaderLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularHeadlineLargeBodyView

- (NTKRichComplicationRectangularHeadlineLargeBodyView)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKRichComplicationRectangularHeadlineLargeBodyView;
  v2 = [(NTKRichComplicationRectangularBaseView *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(CDRichComplicationView *)v2 device];
    uint64_t v5 = [(NTKRichComplicationRectangularBaseView *)v3 _createAndAddColoringLabelWithFontSize:1 weight:_LayoutConstants_39(v4) usesTextProviderTintColoring:*MEMORY[0x1E4FB09E0]];
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v5;

    [(CLKUIColoringLabel *)v3->_headerLabel setNumberOfLines:1];
    uint64_t v7 = [(NTKRichComplicationRectangularHeadlineLargeBodyView *)v3 body];
    body = v3->_body;
    v3->_body = (UIView *)v7;

    [(NTKRichComplicationRectangularHeadlineLargeBodyView *)v3 addSubview:v3->_body];
  }
  return v3;
}

- (CGSize)_bodySize
{
  os_unfair_lock_lock((os_unfair_lock_t)&_bodySize___lock);
  id WeakRetained = objc_loadWeakRetained(&_bodySize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v4 = WeakRetained;
  id v5 = [(CDRichComplicationView *)self device];
  id v6 = objc_loadWeakRetained(&_bodySize___cachedDevice);
  if (v5 != v6)
  {

    goto LABEL_5;
  }
  uint64_t v7 = [(CDRichComplicationView *)self device];
  uint64_t v8 = [v7 version];
  uint64_t v9 = _bodySize___previousCLKDeviceVersion;

  if (v8 != v9)
  {
LABEL_5:
    objc_super v10 = [(CDRichComplicationView *)self device];
    objc_storeWeak(&_bodySize___cachedDevice, v10);

    id v11 = objc_loadWeakRetained(&_bodySize___cachedDevice);
    _bodySize___previousCLKDeviceVersion = [v11 version];

    [(CDRichComplicationView *)self device];
    objc_claimAutoreleasedReturnValue();
    CDGraphicLargeRectangularComplicationLargeImageHeight();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_bodySize___lock);
  v12 = [(CDRichComplicationView *)self device];
  double v13 = NTKWhistlerLargeRectangularComplicationSize();

  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v15 = v13 + v14 * -2.0;
  double v16 = *(double *)&_bodySize_sizeHeight;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)NTKRichComplicationRectangularHeadlineLargeBodyView;
  [(NTKRichComplicationRectangularHeadlineLargeBodyView *)&v24 layoutSubviews];
  [(NTKRichComplicationRectangularHeadlineLargeBodyView *)self bounds];
  double v4 = v3;
  id v5 = [(CDRichComplicationView *)self device];
  double v6 = _LayoutConstants_39(v5);
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CLKUIColoringLabel *)self->_headerLabel font];
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v13 = v4 + v12 * -2.0;
  [v11 ascender];
  CLKRoundForDevice();
  double v15 = v14;
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v17 = v16;
  [v11 lineHeight];
  CLKRoundForDevice();
  -[CLKUIColoringLabel setFrame:](self->_headerLabel, "setFrame:", v17, v8 - v15, v13, v18);
  [(CLKUIColoringLabel *)self->_headerLabel setMaxWidth:v13];
  double v19 = v8 + v10;
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v21 = v20;
  [(NTKRichComplicationRectangularHeadlineLargeBodyView *)self _bodySize];
  -[UIView setFrame:](self->_body, "setFrame:", v21, v19, v22, v23);
}

- (void)_editingDidEnd
{
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v14 = a3;
  id v5 = [v14 tintColor];

  if (v5)
  {
    headerLabel = self->_headerLabel;
    double v7 = [v14 tintColor];
    [(CLKUIColoringLabel *)headerLabel setColor:v7];
  }
  double v8 = [v14 metadata];
  double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19690]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[CLKUIColoringLabel setTwoToneStyleInMonochrome:](self->_headerLabel, "setTwoToneStyleInMonochrome:", [v9 integerValue]);
  }
  double v10 = [(NTKRichComplicationRectangularHeadlineLargeBodyView *)self headerTextProviderFromTemplate:v14];
  [(CLKUIColoringLabel *)self->_headerLabel setTextProvider:v10];
  BOOL v13 = 1;
  if ([v14 isLinkedOnOrAfterGrace])
  {
    id v11 = [(CDRichComplicationView *)self device];
    char v12 = [v11 isRunningGraceOrLater];

    if (v12) {
      BOOL v13 = 0;
    }
  }
  [(CLKUIColoringLabel *)self->_headerLabel setUppercase:v13];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (CLKUIColoringLabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

- (id)body
{
  return 0;
}

- (id)headerTextProviderFromTemplate:(id)a3
{
  return 0;
}

@end