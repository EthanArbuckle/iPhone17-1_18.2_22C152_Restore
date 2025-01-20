@interface NTKWhistlerSubdialsTimeView
- (CGSize)_hourTickSize;
- (CGSize)_minuteTickSize;
- (NSArray)fontScaleFactorForNumberSystemOverrides;
- (NTKWhistlerAnalogColorPalette)palette;
- (NTKWhistlerSubdialsTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5;
- (double)_minuteTickInset;
- (id)_digitalLabelFont;
- (id)_digitalTimeLabelColorForColorPalette:(id)a3;
- (id)_hourMinuteHandFillColorForColorPalette:(id)a3;
- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3;
- (id)_secondHandColorForColorPalette:(id)a3;
- (unint64_t)_hourTickCount;
- (unint64_t)_minuteTickCount;
- (void)setFontScaleFactorForNumberSystemOverrides:(id)a3;
- (void)setForcedNumberSystemForDigitalTimeLabel:(unint64_t)a3;
- (void)setPalette:(id)a3;
@end

@implementation NTKWhistlerSubdialsTimeView

- (NTKWhistlerSubdialsTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWhistlerSubdialsTimeView;
  return -[NTKDualTimeView initWithFrame:style:andDevice:](&v6, sel_initWithFrame_style_andDevice_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKWhistlerAnalogColorPalette)palette
{
  palette = self->_palette;
  if (!palette)
  {
    v4 = [NTKWhistlerAnalogColorPalette alloc];
    v5 = [(NTKDualTimeView *)self device];
    objc_super v6 = [(NTKWhistlerAnalogColorPalette *)v4 initWithDevice:v5];
    v7 = self->_palette;
    self->_palette = v6;

    palette = self->_palette;
  }
  return palette;
}

- (double)_minuteTickInset
{
  v2 = [(NTKDualTimeView *)self device];
  _LayoutConstants_20(v2, (uint64_t)v5);
  double v3 = v5[0];

  return v3;
}

- (CGSize)_hourTickSize
{
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  v2 = [(NTKDualTimeView *)self device];
  _LayoutConstants_20(v2, (uint64_t)&v5);

  double v3 = *((double *)&v5 + 1);
  double v4 = *(double *)&v6;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_minuteTickSize
{
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  v2 = [(NTKDualTimeView *)self device];
  _LayoutConstants_20(v2, (uint64_t)&v5);

  double v3 = *((double *)&v6 + 1);
  double v4 = *(double *)&v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (unint64_t)_hourTickCount
{
  v2 = [(NTKDualTimeView *)self device];
  _LayoutConstants_20(v2, (uint64_t)v5);
  unint64_t v3 = v6;

  return v3;
}

- (unint64_t)_minuteTickCount
{
  v2 = [(NTKDualTimeView *)self device];
  _LayoutConstants_20(v2, (uint64_t)v5);
  unint64_t v3 = v6;

  return v3;
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", a3);
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  unint64_t v3 = [(NTKDualTimeView *)self colorPalette];
  int v4 = [v3 isWhiteColor];

  if (v4) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  long long v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v5;
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  int v4 = [(NTKDualTimeView *)self colorPalette];
  if ([v4 isMulticolor]) {
    goto LABEL_4;
  }
  long long v5 = [(NTKDualTimeView *)self colorPalette];
  if ([v5 isWhiteColor])
  {

LABEL_4:
LABEL_5:
    unint64_t v6 = [MEMORY[0x1E4FB1618] systemRedColor];
    goto LABEL_6;
  }
  uint64_t v8 = [(NTKDualTimeView *)self colorPalette];
  char v9 = [v8 isBlackColor];

  if (v9) {
    goto LABEL_5;
  }
  v10 = [(NTKDualTimeView *)self colorPalette];
  unint64_t v6 = [v10 primaryColor];

LABEL_6:
  return v6;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  id v4 = a3;
  long long v5 = [(NTKWhistlerSubdialsTimeView *)self palette];
  unint64_t v6 = [v5 hourTicksColorForColorPalette:v4];

  return v6;
}

- (id)_digitalLabelFont
{
  unint64_t v3 = [(NTKDualTimeView *)self device];
  int v4 = NTKShowIndicScriptNumerals(v3);

  if (v4)
  {
    [(NTKDualTimeView *)self _digitalTimeLabelFontSize];
    double v6 = v5;
    if (self->_numberSystem != -1)
    {
      long long v7 = [(NTKWhistlerSubdialsTimeView *)self fontScaleFactorForNumberSystemOverrides];
      uint64_t v8 = [v7 objectAtIndexedSubscript:self->_numberSystem];
      [v8 doubleValue];

      char v9 = [(NTKDualTimeView *)self device];
      CLKRoundForDevice();
      double v6 = v10;
    }
    v11 = +[NTKSFCompactFont numericFontOfSize:v6 weight:*MEMORY[0x1E4FB09D8]];
    v12 = [v11 CLKFontWithAlternativePunctuation];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKWhistlerSubdialsTimeView;
    v12 = [(NTKDualTimeView *)&v14 _digitalLabelFont];
  }
  return v12;
}

- (void)setForcedNumberSystemForDigitalTimeLabel:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKWhistlerSubdialsTimeView;
  -[NTKDualTimeView setForcedNumberSystemForDigitalTimeLabel:](&v5, sel_setForcedNumberSystemForDigitalTimeLabel_);
  self->_numberSystem = a3;
  [(NTKDualTimeView *)self _refreshDigitalTimeLabel];
}

- (NSArray)fontScaleFactorForNumberSystemOverrides
{
  fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  if (!fontScaleFactorForNumberSystemOverrides)
  {
    self->_fontScaleFactorForNumberSystemOverrides = (NSArray *)&unk_1F16E9CE8;

    fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  }
  return fontScaleFactorForNumberSystemOverrides;
}

- (void)setPalette:(id)a3
{
}

- (void)setFontScaleFactorForNumberSystemOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end