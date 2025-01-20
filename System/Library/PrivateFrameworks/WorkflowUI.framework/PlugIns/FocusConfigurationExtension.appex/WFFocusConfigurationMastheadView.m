@interface WFFocusConfigurationMastheadView
- (NSString)subtitle;
- (NSString)title;
- (WFFocusConfigurationMastheadView)initWithBundleIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5;
- (WFFocusConfigurationMastheadView)initWithCoder:(id)a3;
- (WFFocusConfigurationMastheadView)initWithFrame:(CGRect)a3;
- (WFFocusConfigurationMastheadView)initWithSymbolName:(id)a3 color:(id)a4 title:(id)a5 subtitle:(id)a6;
@end

@implementation WFFocusConfigurationMastheadView

- (NSString)title
{
  FocusConfigurationMastheadView.title.getter();
  NSString v2 = sub_1000207D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)subtitle
{
  FocusConfigurationMastheadView.subtitle.getter();
  if (v2)
  {
    NSString v3 = sub_1000207D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  return (NSString *)v3;
}

- (WFFocusConfigurationMastheadView)initWithBundleIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  uint64_t v6 = sub_1000207E0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1000207E0();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_1000207E0();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (WFFocusConfigurationMastheadView *)FocusConfigurationMastheadView.init(bundleIdentifier:title:subtitle:)(v6, v8, v9, v11, v12, v14);
}

- (WFFocusConfigurationMastheadView)initWithSymbolName:(id)a3 color:(id)a4 title:(id)a5 subtitle:(id)a6
{
  uint64_t v8 = sub_1000207E0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1000207E0();
  uint64_t v13 = v12;
  if (a6)
  {
    a6 = (id)sub_1000207E0();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
  }
  return (WFFocusConfigurationMastheadView *)FocusConfigurationMastheadView.init(symbolName:color:title:subtitle:)(v8, v10, a4, v11, v13, (uint64_t)a6, v15);
}

- (WFFocusConfigurationMastheadView)initWithCoder:(id)a3
{
}

- (WFFocusConfigurationMastheadView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_10001D8B4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration), *(void *)&self->iconConfiguration[OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration], *(void **)&self->iconConfiguration[OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration + 8], self->iconConfiguration[OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration + 16]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end