@interface SafariViewController
- (_TtC17PromotedContentUI20SafariViewController)initWithURL:(id)a3 configuration:(id)a4;
- (_TtC17PromotedContentUI20SafariViewController)initWithURL:(id)a3 entersReaderIfAvailable:(BOOL)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SafariViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B5D00EB0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1B5D01750(a3);
}

- (_TtC17PromotedContentUI20SafariViewController)initWithURL:(id)a3 configuration:(id)a4
{
  uint64_t v5 = sub_1B5DB9868();
  MEMORY[0x1F4188790](v5 - 8);
  sub_1B5DB9828();
  id v6 = a4;
  result = (_TtC17PromotedContentUI20SafariViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17PromotedContentUI20SafariViewController)initWithURL:(id)a3 entersReaderIfAvailable:(BOOL)a4
{
  uint64_t v4 = sub_1B5DB9868();
  MEMORY[0x1F4188790](v4 - 8);
  sub_1B5DB9828();
  result = (_TtC17PromotedContentUI20SafariViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B5CEF924((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime, (uint64_t *)&unk_1EB8493A0);
  v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate;
  sub_1B5CF6804((uint64_t)v3);
}

@end