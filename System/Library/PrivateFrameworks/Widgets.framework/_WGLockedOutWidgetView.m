@interface _WGLockedOutWidgetView
- (_WGLockedOutWidgetView)initWithExplanation:(id)a3;
@end

@implementation _WGLockedOutWidgetView

- (_WGLockedOutWidgetView)initWithExplanation:(id)a3
{
  v4 = (void *)MEMORY[0x263F1C6B0];
  v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  v7 = [v5 bundleForClass:objc_opt_class()];
  v8 = [v4 imageNamed:@"TimerWidgetGlyph" inBundle:v7];

  v11.receiver = self;
  v11.super_class = (Class)_WGLockedOutWidgetView;
  v9 = [(WGExplanatoryView *)&v11 initWithGlyph:v8 andExplanation:v6];

  return v9;
}

@end