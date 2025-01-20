@interface StocksStyle
+ (id)sharedStyle;
- (StocksStyle)init;
- (id)boldFontOfSize:(double)a3;
- (id)chartHighlightColor;
- (id)fontOfSize:(double)a3;
- (id)gainColor;
- (id)lightFontOfSize:(double)a3;
- (id)lossColor;
- (id)mediumFontOfSize:(double)a3;
- (void)resetLocale;
@end

@implementation StocksStyle

+ (id)sharedStyle
{
  v2 = (void *)_sharedInstance;
  if (!_sharedInstance)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)_sharedInstance;
    _sharedInstance = v3;

    v2 = (void *)_sharedInstance;
  }

  return v2;
}

- (StocksStyle)init
{
  v5.receiver = self;
  v5.super_class = (Class)StocksStyle;
  v2 = [(StocksStyle *)&v5 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_resetLocale name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (void)resetLocale
{
  mainFont = self->_mainFont;
  self->_mainFont = 0;

  chartLabelFont = self->_chartLabelFont;
  self->_chartLabelFont = 0;
}

- (id)gainColor
{
  v2 = +[StocksPreferences sharedPreferences];
  char v3 = [v2 isChangeColorSwapped];

  if (v3) {
    [MEMORY[0x263F1C550] systemRedColor];
  }
  else {
  v4 = [MEMORY[0x263F1C550] systemGreenColor];
  }

  return v4;
}

- (id)lossColor
{
  v2 = +[StocksPreferences sharedPreferences];
  char v3 = [v2 isChangeColorSwapped];

  if (v3) {
    [MEMORY[0x263F1C550] systemGreenColor];
  }
  else {
  v4 = [MEMORY[0x263F1C550] systemRedColor];
  }

  return v4;
}

- (id)chartHighlightColor
{
  chartHighlightColor = self->_chartHighlightColor;
  if (!chartHighlightColor)
  {
    v4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.584313725 blue:1.0 alpha:1.0];
    objc_super v5 = self->_chartHighlightColor;
    self->_chartHighlightColor = v4;

    chartHighlightColor = self->_chartHighlightColor;
  }

  return chartHighlightColor;
}

- (id)lightFontOfSize:(double)a3
{
  return (id)[MEMORY[0x263F1C658] systemFontOfSize:a3];
}

- (id)fontOfSize:(double)a3
{
  return (id)[MEMORY[0x263F1C658] systemFontOfSize:a3];
}

- (id)mediumFontOfSize:(double)a3
{
  return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:a3];
}

- (id)boldFontOfSize:(double)a3
{
  return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartLabelFont, 0);
  objc_storeStrong((id *)&self->_mainFont, 0);

  objc_storeStrong((id *)&self->_chartHighlightColor, 0);
}

@end