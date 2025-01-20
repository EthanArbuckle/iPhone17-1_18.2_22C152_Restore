@interface MultisportTransitions
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC11WorkoutCore21MultisportTransitions)init;
- (int64_t)hash;
@end

@implementation MultisportTransitions

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_236B4A980();

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
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_236B4AA80((uint64_t)v8);

  sub_236A5C318((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_236B4AD24();

  int64_t v3 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC11WorkoutCore21MultisportTransitions)init
{
  result = (_TtC11WorkoutCore21MultisportTransitions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore21MultisportTransitions__shouldTrackTransitions;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30670);
  char v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore21MultisportTransitions__automaticallySwitchLegs;

  v6(v5, v4);
}

@end