@interface DeviceCapabilityObserver
- (_TtC14NanoPhotosSync24DeviceCapabilityObserver)init;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
@end

@implementation DeviceCapabilityObserver

- (_TtC14NanoPhotosSync24DeviceCapabilityObserver)init
{
  swift_defaultActor_initialize();
  result = (_TtC14NanoPhotosSync24DeviceCapabilityObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  uint64_t v9 = sub_100006290(&qword_1000A1380);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    uint64_t v12 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v19, 0, sizeof(v19));
    id v15 = a3;
    swift_retain();
    goto LABEL_6;
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a4 = v13;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
LABEL_6:
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a3;
  v17[5] = self;
  v17[6] = v12;
  v17[7] = a4;
  swift_bridgeObjectRetain();
  id v18 = a3;
  swift_retain();
  sub_100048120((uint64_t)v11, (uint64_t)&unk_1000A2168, (uint64_t)v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000BD30((uint64_t)v19, (uint64_t *)&unk_1000A0BC0);
}

@end