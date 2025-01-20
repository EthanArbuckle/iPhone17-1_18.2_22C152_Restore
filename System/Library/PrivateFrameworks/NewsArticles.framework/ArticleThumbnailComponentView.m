@interface ArticleThumbnailComponentView
- (_TtC12NewsArticles29ArticleThumbnailComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6;
- (void)discardContents;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
@end

@implementation ArticleThumbnailComponentView

- (void)renderContents
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SXComponentView *)&v3 renderContents];
  sub_1BF4C3748();
}

- (void)discardContents
{
  id v2 = self;
  sub_1BF4C3D54();
}

- (void)presentComponentWithChanges:(id)a3
{
  int v3 = *(_DWORD *)&a3.var0 & 0x10101;
  v4 = self;
  sub_1BF4C3E84(v3);
}

- (_TtC12NewsArticles29ArticleThumbnailComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  swift_unknownObjectRetain();
  id v7 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (_TtC12NewsArticles29ArticleThumbnailComponentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29ArticleThumbnailComponentView_linkedContentProvider));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ArticleThumbnailComponentView_articleThumbnailViewRenderer);
  int v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles29ArticleThumbnailComponentView_articleThumbnailView);
}

@end