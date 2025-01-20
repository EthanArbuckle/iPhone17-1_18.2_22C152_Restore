@interface CHPaletteViewControllerSizingDelegate
- (CGRect)bounds;
- (CGSize)size;
- (CHPaletteViewControllerSizingDelegate)init;
- (UIView)view;
- (void)setView:(id)a3;
@end

@implementation CHPaletteViewControllerSizingDelegate

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view));
}

- (void)setView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view) = (Class)a3;
  id v3 = a3;
}

- (CGRect)bounds
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view);
  if (v2)
  {
    [v2 bounds];
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v3 = 0.0;
    double v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view);
  if (v2)
  {
    [v2 size];
  }
  else
  {
    double v4 = 0.0;
    double v3 = 0.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CHPaletteViewControllerSizingDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteViewControllerSizingDelegate();
  return [(CHPaletteViewControllerSizingDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end