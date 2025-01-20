@interface WATodayPadViewStyle
+ (id)styleForScreenWithSize:(CGSize)a3 orientation:(int64_t)a4;
- (UIFont)conditionsFont;
- (UIFont)locationFont;
- (UIFont)temperatureFont;
- (WATodayPadViewStyle)init;
- (WATodayPadViewStyle)initWithFormat:(unint64_t)a3 orientation:(int64_t)a4;
- (double)conditionsImageLeadingMargin;
- (double)conditionsLabelBaselineToBottom;
- (double)conditionsLabelBaselineToLocationLabelBaseline;
- (double)labelLeadingMargin;
- (double)locationLabelBaselineToTemperatureLabelBaseline;
- (double)temperatureLabelBaselineToConditionsImageViewBottom;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)orientation;
- (unint64_t)format;
- (void)_setupForDefaultWithOrientation:(int64_t)a3;
- (void)_setupForGigantorWithOrientation:(int64_t)a3;
- (void)setConditionsFont:(id)a3;
- (void)setConditionsImageLeadingMargin:(double)a3;
- (void)setConditionsLabelBaselineToBottom:(double)a3;
- (void)setConditionsLabelBaselineToLocationLabelBaseline:(double)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setLabelLeadingMargin:(double)a3;
- (void)setLocationFont:(id)a3;
- (void)setLocationLabelBaselineToTemperatureLabelBaseline:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTemperatureFont:(id)a3;
- (void)setTemperatureLabelBaselineToConditionsImageViewBottom:(double)a3;
@end

@implementation WATodayPadViewStyle

+ (id)styleForScreenWithSize:(CGSize)a3 orientation:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [WATodayPadViewStyle alloc];
  if (width >= height) {
    double v8 = width;
  }
  else {
    double v8 = height;
  }
  v9 = [(WATodayPadViewStyle *)v7 initWithFormat:v8 >= 1366.0 orientation:a4];
  return v9;
}

- (WATodayPadViewStyle)initWithFormat:(unint64_t)a3 orientation:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WATodayPadViewStyle;
  v6 = [(WATodayPadViewStyle *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (a3) {
      [(WATodayPadViewStyle *)v6 _setupForGigantorWithOrientation:a4];
    }
    else {
      [(WATodayPadViewStyle *)v6 _setupForDefaultWithOrientation:a4];
    }
  }
  return v7;
}

- (WATodayPadViewStyle)init
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  BOOL v7 = v6 >= 1366.0;
  double v8 = [MEMORY[0x263F1C5C0] currentDevice];
  objc_super v9 = -[WATodayPadViewStyle initWithFormat:orientation:](self, "initWithFormat:orientation:", v7, [v8 orientation]);

  return v9;
}

- (void)_setupForGigantorWithOrientation:(int64_t)a3
{
  [(WATodayPadViewStyle *)self setFormat:1];
  [(WATodayPadViewStyle *)self setOrientation:a3];
  double v5 = [MEMORY[0x263F1C658] systemFontOfSize:50.0 weight:*MEMORY[0x263F1D328]];
  [(WATodayPadViewStyle *)self setTemperatureFont:v5];

  double v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D268]];
  id v10 = [v6 fontDescriptor];

  BOOL v7 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:32770 options:0];
  double v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];
  [(WATodayPadViewStyle *)self setLocationFont:v8];

  objc_super v9 = [MEMORY[0x263F1C658] fontWithDescriptor:v10 size:0.0];
  [(WATodayPadViewStyle *)self setConditionsFont:v9];

  [(WATodayPadViewStyle *)self setLabelLeadingMargin:16.0];
  [(WATodayPadViewStyle *)self setConditionsImageLeadingMargin:8.0];
  [(WATodayPadViewStyle *)self setTemperatureLabelBaselineToConditionsImageViewBottom:-40.0];
  [(WATodayPadViewStyle *)self setLocationLabelBaselineToTemperatureLabelBaseline:25.0];
  [(WATodayPadViewStyle *)self setConditionsLabelBaselineToLocationLabelBaseline:20.0];
  [(WATodayPadViewStyle *)self setConditionsLabelBaselineToBottom:0.0];
}

- (void)_setupForDefaultWithOrientation:(int64_t)a3
{
  [(WATodayPadViewStyle *)self setFormat:0];
  [(WATodayPadViewStyle *)self setOrientation:a3];
  double v5 = 44.0;
  if ((unint64_t)(a3 - 1) < 2) {
    double v5 = 50.0;
  }
  double v6 = [MEMORY[0x263F1C658] systemFontOfSize:v5 weight:*MEMORY[0x263F1D328]];
  [(WATodayPadViewStyle *)self setTemperatureFont:v6];

  uint64_t v7 = *MEMORY[0x263F1D280];
  id v10 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:32770 options:0];
  double v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v10 size:0.0];
  [(WATodayPadViewStyle *)self setLocationFont:v8];

  objc_super v9 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v7];
  [(WATodayPadViewStyle *)self setConditionsFont:v9];

  [(WATodayPadViewStyle *)self setLabelLeadingMargin:16.0];
  [(WATodayPadViewStyle *)self setConditionsImageLeadingMargin:8.0];
  [(WATodayPadViewStyle *)self setTemperatureLabelBaselineToConditionsImageViewBottom:-40.0];
  [(WATodayPadViewStyle *)self setLocationLabelBaselineToTemperatureLabelBaseline:20.0];
  [(WATodayPadViewStyle *)self setConditionsLabelBaselineToLocationLabelBaseline:20.0];
  [(WATodayPadViewStyle *)self setConditionsLabelBaselineToBottom:0.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [+[WATodayPadViewStyle allocWithZone:a3] init];
  double v5 = [(WATodayPadViewStyle *)self temperatureFont];
  [(WATodayPadViewStyle *)v4 setTemperatureFont:v5];

  double v6 = [(WATodayPadViewStyle *)self locationFont];
  [(WATodayPadViewStyle *)v4 setLocationFont:v6];

  uint64_t v7 = [(WATodayPadViewStyle *)self conditionsFont];
  [(WATodayPadViewStyle *)v4 setConditionsFont:v7];

  [(WATodayPadViewStyle *)self labelLeadingMargin];
  -[WATodayPadViewStyle setLabelLeadingMargin:](v4, "setLabelLeadingMargin:");
  [(WATodayPadViewStyle *)self conditionsImageLeadingMargin];
  -[WATodayPadViewStyle setConditionsImageLeadingMargin:](v4, "setConditionsImageLeadingMargin:");
  [(WATodayPadViewStyle *)self temperatureLabelBaselineToConditionsImageViewBottom];
  -[WATodayPadViewStyle setTemperatureLabelBaselineToConditionsImageViewBottom:](v4, "setTemperatureLabelBaselineToConditionsImageViewBottom:");
  [(WATodayPadViewStyle *)self locationLabelBaselineToTemperatureLabelBaseline];
  -[WATodayPadViewStyle setLocationLabelBaselineToTemperatureLabelBaseline:](v4, "setLocationLabelBaselineToTemperatureLabelBaseline:");
  [(WATodayPadViewStyle *)self conditionsLabelBaselineToLocationLabelBaseline];
  -[WATodayPadViewStyle setConditionsLabelBaselineToLocationLabelBaseline:](v4, "setConditionsLabelBaselineToLocationLabelBaseline:");
  [(WATodayPadViewStyle *)self conditionsLabelBaselineToBottom];
  -[WATodayPadViewStyle setConditionsLabelBaselineToBottom:](v4, "setConditionsLabelBaselineToBottom:");
  return v4;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (UIFont)locationFont
{
  return self->_locationFont;
}

- (void)setLocationFont:(id)a3
{
}

- (UIFont)temperatureFont
{
  return self->_temperatureFont;
}

- (void)setTemperatureFont:(id)a3
{
}

- (UIFont)conditionsFont
{
  return self->_conditionsFont;
}

- (void)setConditionsFont:(id)a3
{
}

- (double)labelLeadingMargin
{
  return self->_labelLeadingMargin;
}

- (void)setLabelLeadingMargin:(double)a3
{
  self->_labelLeadingMargin = a3;
}

- (double)conditionsImageLeadingMargin
{
  return self->_conditionsImageLeadingMargin;
}

- (void)setConditionsImageLeadingMargin:(double)a3
{
  self->_conditionsImageLeadingMargin = a3;
}

- (double)temperatureLabelBaselineToConditionsImageViewBottom
{
  return self->_temperatureLabelBaselineToConditionsImageViewBottom;
}

- (void)setTemperatureLabelBaselineToConditionsImageViewBottom:(double)a3
{
  self->_temperatureLabelBaselineToConditionsImageViewBottom = a3;
}

- (double)locationLabelBaselineToTemperatureLabelBaseline
{
  return self->_locationLabelBaselineToTemperatureLabelBaseline;
}

- (void)setLocationLabelBaselineToTemperatureLabelBaseline:(double)a3
{
  self->_locationLabelBaselineToTemperatureLabelBaseline = a3;
}

- (double)conditionsLabelBaselineToLocationLabelBaseline
{
  return self->_conditionsLabelBaselineToLocationLabelBaseline;
}

- (void)setConditionsLabelBaselineToLocationLabelBaseline:(double)a3
{
  self->_conditionsLabelBaselineToLocationLabelBaseline = a3;
}

- (double)conditionsLabelBaselineToBottom
{
  return self->_conditionsLabelBaselineToBottom;
}

- (void)setConditionsLabelBaselineToBottom:(double)a3
{
  self->_conditionsLabelBaselineToBottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionsFont, 0);
  objc_storeStrong((id *)&self->_temperatureFont, 0);
  objc_storeStrong((id *)&self->_locationFont, 0);
}

@end