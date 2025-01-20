@interface FMClusterAnnotation
- (BOOL)isEqual:(id)a3;
@end

@implementation FMClusterAnnotation

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_10017B9DC((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_100067244((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for FMClusterAnnotation();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_1003FAE3C(v8, (char *)self);

LABEL_9:
  sub_100067244((uint64_t)v11);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy19FMClusterAnnotation_updateQueue);
}

@end