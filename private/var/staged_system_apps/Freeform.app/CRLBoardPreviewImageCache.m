@interface CRLBoardPreviewImageCache
- (_TtC8Freeform25CRLBoardPreviewImageCache)init;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
@end

@implementation CRLBoardPreviewImageCache

- (void)dealloc
{
  v2 = self;
  sub_100616A58();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform25CRLBoardPreviewImageCache____lazy_storage___defaultUnsupportedImage);
}

- (_TtC8Freeform25CRLBoardPreviewImageCache)init
{
  result = (_TtC8Freeform25CRLBoardPreviewImageCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10062E950((uint64_t)v7);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v7);
}

@end