@interface MBPersonaStateManager
- (NSArray)allPersonaStates;
- (_TtC7backupd21MBPersonaStateManager)init;
- (id)objectForKeyedSubscript:(id)a3;
- (id)personaStateForPersonaID:(id)a3;
- (id)restoreSessionForPersonaID:(id)a3;
@end

@implementation MBPersonaStateManager

- (id)restoreSessionForPersonaID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8 = sub_100035790(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_100035A60(v4);

  return v6;
}

- (NSArray)allPersonaStates
{
  v2 = self;
  sub_100035B90();

  type metadata accessor for MBPersonaState();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v3.super.isa;
}

- (id)personaStateForPersonaID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_100035C2C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC7backupd21MBPersonaStateManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd21MBPersonaStateManager_personaIDStateMap) = (Class)&_swiftEmptyDictionarySingleton;
  uint64_t v4 = OBJC_IVAR____TtC7backupd21MBPersonaStateManager_lock;
  type metadata accessor for MBUnfairLock();
  uint64_t v5 = (objc_class *)swift_allocObject();
  uint64_t v6 = self;
  v7 = (_DWORD *)swift_slowAlloc();
  *((void *)v5 + 2) = v7;
  _DWORD *v7 = 0;
  *(Class *)((char *)&self->super.isa + v4) = v5;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return [(MBPersonaStateManager *)&v9 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end