@interface Occurrence
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC11WorkoutCore10Occurrence)init;
- (int64_t)hash;
@end

@implementation Occurrence

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_236A66314();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_236C75478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_236A67084((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_236A5C318((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for Occurrence();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_236A670EC((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_236A5C318((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_236A666CC();

  int64_t v3 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC11WorkoutCore10Occurrence)init
{
  result = (_TtC11WorkoutCore10Occurrence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore10Occurrence_countModificationDate;
  uint64_t v4 = sub_236C73F58();
  char v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC11WorkoutCore10Occurrence_creationDate, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore10Occurrence_modificationDate;

  v6(v5, v4);
}

@end