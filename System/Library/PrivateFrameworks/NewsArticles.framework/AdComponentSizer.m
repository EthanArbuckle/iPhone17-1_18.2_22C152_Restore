@interface AdComponentSizer
- (BOOL)requiresSizeChangeForStateChange:(id)a3 fromState:(id)a4;
- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4;
- (_TtC12NewsArticles16AdComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3;
- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3;
@end

@implementation AdComponentSizer

- (_TtC12NewsArticles16AdComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = a7;
  result = (_TtC12NewsArticles16AdComponentSizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles16AdComponentSizer_layoutStore);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles16AdComponentSizer_bannerAdFactory;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1BF7648D4();
  double v7 = v6;
  swift_unknownObjectRelease();

  return v7;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = sub_1BF764D7C(location, length, v7);
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3
{
  id v4 = a3;
  v5 = self;
  unint64_t v6 = sub_1BF7650D0(v4, (SEL *)&selRef_ignoreDocumentMargin);

  return v6;
}

- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3
{
  id v4 = a3;
  v5 = self;
  unint64_t v6 = sub_1BF7650D0(v4, (SEL *)&selRef_ignoreViewportPadding);

  return v6;
}

- (BOOL)requiresSizeChangeForStateChange:(id)a3 fromState:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = self;
  char v8 = sub_1BF765318((uint64_t)a3, (void (*)(char *, uint64_t))a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v8 & 1;
}

@end