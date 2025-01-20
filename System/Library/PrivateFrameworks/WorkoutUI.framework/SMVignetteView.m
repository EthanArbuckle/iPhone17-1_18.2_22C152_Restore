@interface SMVignetteView
- (SMVignetteView)initWithCoder:(id)a3;
- (SMVignetteView)initWithCornerRadius:(double)a3;
- (SMVignetteView)initWithFrame:(CGRect)a3;
- (void)updateWithActiveAppearance:(int64_t)a3;
@end

@implementation SMVignetteView

- (SMVignetteView)initWithCornerRadius:(double)a3
{
  return (SMVignetteView *)VignetteView.init(cornerRadius:)(a3);
}

- (SMVignetteView)initWithCoder:(id)a3
{
  result = (SMVignetteView *)sub_261B8F9C8();
  __break(1u);
  return result;
}

- (void)updateWithActiveAppearance:(int64_t)a3
{
  v4 = self;
  sub_261B1B900(a3);
}

- (SMVignetteView)initWithFrame:(CGRect)a3
{
  result = (SMVignetteView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end