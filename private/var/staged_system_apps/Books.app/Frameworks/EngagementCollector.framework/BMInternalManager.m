@interface BMInternalManager
- (BMInternalManager)init;
- (BMInternalManager)initWithConfiguration:(id)a3;
- (void)dealloc;
- (void)onDidReceiveAppDidBackground:(id)a3;
- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4;
- (void)submitEvent:(id)a3;
@end

@implementation BMInternalManager

- (BMInternalManager)initWithConfiguration:(id)a3
{
  return (BMInternalManager *)Manager.init(configuration:)(a3);
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem))
  {
    v3 = self;
    swift_retain();
    sub_38030();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Manager();
  [(BMInternalManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();

  swift_release();
}

- (void)submitEvent:(id)a3
{
  v3 = self;
  sub_1E8B4();
}

- (void)onDidReceiveAppDidBackground:(id)a3
{
  uint64_t v4 = sub_37E20();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37E10();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BMInternalManager_configuration);
  if (v8 && *((unsigned char *)v8 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData) == 1)
  {
    v9 = self;
    id v10 = v8;
    sub_13724();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BMInternalManager)init
{
  result = (BMInternalManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  Manager.propertyDidChange(_:propertyConfiguration:)(a3, v7);
  swift_unknownObjectRelease();
}

@end