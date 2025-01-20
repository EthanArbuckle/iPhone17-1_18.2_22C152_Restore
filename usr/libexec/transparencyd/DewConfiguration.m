@interface DewConfiguration
- (_TtC13transparencyd16DewConfiguration)init;
- (_TtC13transparencyd16DewConfiguration)initWithSettings:(id)a3;
@end

@implementation DewConfiguration

- (_TtC13transparencyd16DewConfiguration)initWithSettings:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  type metadata accessor for DewGlobalOverrides();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectRetain();
  *(void *)(v5 + 16) = sub_100091A84((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v5 + 24) = 0;
  v6 = (_TtC13transparencyd16DewConfiguration *)(*(uint64_t (**)(uint64_t, id))(ObjectType + 104))(v5, a3);
  swift_deallocPartialClassInstance();
  return v6;
}

- (_TtC13transparencyd16DewConfiguration)init
{
  result = (_TtC13transparencyd16DewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13transparencyd16DewConfiguration_logger;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end