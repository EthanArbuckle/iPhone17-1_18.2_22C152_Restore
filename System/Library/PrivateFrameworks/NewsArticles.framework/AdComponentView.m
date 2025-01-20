@interface AdComponentView
- (_TtC12NewsArticles15AdComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6;
- (void)presentComponentWithChanges:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)renderContents;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
@end

@implementation AdComponentView

- (void)presentComponentWithChanges:(id)a3
{
  int v3 = *(_DWORD *)&a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(SXComponentView *)&v5 presentComponentWithChanges:*(void *)&v3 & 0x10101];
  sub_1BF4CA5EC();
}

- (void)renderContents
{
  v2 = self;
  sub_1BF4CAA58();
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1BF7E4728();
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1BF7E39C8();
  uint64_t v10 = v9;

  sub_1BF4CAE3C((uint64_t)v11, v8, v10);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  id v4 = self;
  sub_1BF4CB068(a3);
}

- (_TtC12NewsArticles15AdComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  swift_unknownObjectRetain();
  id v7 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (_TtC12NewsArticles15AdComponentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles15AdComponentView_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles15AdComponentView____lazy_storage___debugView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_bannerAdFactory);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_bannerAdRenderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_integrator);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_tracker);
  swift_release();
  sub_1BF4CCB98((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_layoutAttributes, &qword_1EBA5B048, MEMORY[0x1E4F7AFF0]);
}

@end