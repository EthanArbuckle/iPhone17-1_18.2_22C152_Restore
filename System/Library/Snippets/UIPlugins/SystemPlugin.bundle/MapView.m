@interface MapView
- (CGSize)preferredContentSize;
- (_TtC12SystemPluginP33_30CD189B0D53C4A0B858877D5A35DB877MapView)initWithConfiguration:(id)a3;
- (_TtC12SystemPluginP33_30CD189B0D53C4A0B858877D5A35DB877MapView)initWithMapItem:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation MapView

- (CGSize)preferredContentSize
{
  v2 = self;
  sub_1F59C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
}

- (_TtC12SystemPluginP33_30CD189B0D53C4A0B858877D5A35DB877MapView)initWithMapItem:(id)a3
{
  id v3 = a3;
  sub_1F610();
}

- (_TtC12SystemPluginP33_30CD189B0D53C4A0B858877D5A35DB877MapView)initWithConfiguration:(id)a3
{
  id v3 = a3;
  sub_1F670();
}

@end