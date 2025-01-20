@interface _WGBrokenWidgetView
- (_WGBrokenWidgetView)init;
@end

@implementation _WGBrokenWidgetView

- (_WGBrokenWidgetView)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BROKEN_WIDGET_EXPLANATION" value:&stru_26D5C79B8 table:@"Widgets"];
  v7.receiver = self;
  v7.super_class = (Class)_WGBrokenWidgetView;
  v5 = [(WGExplanatoryView *)&v7 initWithGlyph:0 andExplanation:v4];

  return v5;
}

@end