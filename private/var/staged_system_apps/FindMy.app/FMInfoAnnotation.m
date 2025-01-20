@interface FMInfoAnnotation
@end

@implementation FMInfoAnnotation

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy16FMInfoAnnotation_unknownItem;
  uint64_t v4 = type metadata accessor for FMIPUnknownItem();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy16FMInfoAnnotation_updateQueue);
}

@end