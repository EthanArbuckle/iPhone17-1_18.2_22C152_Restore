@interface AdContext
- (_TtC7NewsUI29AdContext)init;
@end

@implementation AdContext

- (_TtC7NewsUI29AdContext)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI29AdContext_qToken);
  void *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI29AdContext_previewID);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI29AdContext_previewSessionID);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI29AdContext_maximumAdRequestsForCurrentAdPreviewID;
  *(void *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AdContext();
  return [(AdContext *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end