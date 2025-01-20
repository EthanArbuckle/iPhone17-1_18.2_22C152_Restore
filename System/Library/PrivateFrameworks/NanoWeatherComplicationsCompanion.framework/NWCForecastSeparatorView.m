@interface NWCForecastSeparatorView
+ (UIColor)defaultColor;
+ (void)initialize;
- (CGSize)intrinsicContentSize;
- (NWCForecastSeparatorView)init;
@end

@implementation NWCForecastSeparatorView

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  double v3 = 1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_5);
  }
}

uint64_t __38__NWCForecastSeparatorView_initialize__block_invoke()
{
  DefaultColor = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.25];

  return MEMORY[0x270F9A758]();
}

+ (UIColor)defaultColor
{
  return (UIColor *)(id)DefaultColor;
}

- (NWCForecastSeparatorView)init
{
  v6.receiver = self;
  v6.super_class = (Class)NWCForecastSeparatorView;
  double v2 = -[NWCForecastSeparatorView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v3 = v2;
  if (v2)
  {
    [(NWCForecastSeparatorView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v4) = 1148846080;
    [(NWCForecastSeparatorView *)v3 setContentHuggingPriority:0 forAxis:v4];
  }
  return v3;
}

@end