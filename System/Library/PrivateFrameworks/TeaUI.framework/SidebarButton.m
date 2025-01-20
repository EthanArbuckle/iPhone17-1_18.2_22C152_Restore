@interface SidebarButton
- (CGSize)intrinsicContentSize;
- (NSString)accessibilityLabel;
- (_TtC5TeaUI13SidebarButton)initWithCoder:(id)a3;
- (_TtC5TeaUI13SidebarButton)initWithFrame:(CGRect)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation SidebarButton

- (_TtC5TeaUI13SidebarButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5FE45B8();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1B5FE4678();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1B5FE4754();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_1B61B20C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_1B61B20F0();
  }
  uint64_t v4 = self;
  sub_1B5FE4970();
}

- (_TtC5TeaUI13SidebarButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end