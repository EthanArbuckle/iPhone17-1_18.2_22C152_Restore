@interface FMItemAnnotation
@end

@implementation FMItemAnnotation

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy16FMItemAnnotation_item;
  uint64_t v4 = type metadata accessor for FMIPItem();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy16FMItemAnnotation_updateQueue);
}

@end