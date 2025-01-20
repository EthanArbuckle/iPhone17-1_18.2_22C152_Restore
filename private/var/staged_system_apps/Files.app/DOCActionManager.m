@interface DOCActionManager
+ (BOOL)canCreateNewFolderIn:(id)a3;
+ (BOOL)canImportIn:(id)a3;
+ (BOOL)canMove:(id)a3 to:(id)a4;
+ (BOOL)canShowInfoIn:(id)a3;
- (NSArray)actions;
- (NSArray)associatedActionManagers;
- (NSArray)forbiddenActionIdentifiers;
- (_TtC5Files16DOCActionManager)init;
- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5;
- (void)setActions:(id)a3;
- (void)setAssociatedActionManagers:(id)a3;
- (void)setForbiddenActionIdentifiers:(id)a3;
@end

@implementation DOCActionManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files16DOCActionManager_actionManagerDelegate);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_managedPermission);
}

- (void)setAssociatedActionManagers:(id)a3
{
  type metadata accessor for DOCActionManager();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_associatedActionManagers) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (_TtC5Files16DOCActionManager)init
{
  uint64_t ObjectType = swift_getObjectType();
  id v3 = [self defaultManager];
  id v4 = [self defaultPermission];
  v5 = (_TtC5Files16DOCActionManager *)(*(uint64_t (**)(id, id))(ObjectType + 248))(v3, v4);
  swift_deallocPartialClassInstance();
  return v5;
}

- (NSArray)forbiddenActionIdentifiers
{
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_forbiddenActionIdentifiers) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (NSArray)associatedActionManagers
{
  type metadata accessor for DOCActionManager();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)actions
{
  sub_10009E6C4(0, &qword_100708700);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setActions:(id)a3
{
  sub_10009E6C4(0, &qword_100708700);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_actions) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

+ (BOOL)canMove:(id)a3 to:(id)a4
{
  sub_1000CBE70((uint64_t *)&unk_100706730);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = (void *)FPActionReparent;
  swift_unknownObjectRetain();
  char v7 = sub_1000301E0(v6, v5);
  char v8 = v7;
  if (a4)
  {
    if ((v7 & 1) == 0)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      char v8 = 0;
      return v8 & 1;
    }
    v9 = (void *)FPActionImportHere;
    sub_1000CBE70((uint64_t *)&unk_1007084E0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1005A04F0;
    *(void *)(inited + 32) = a4;
    unint64_t v12 = inited;
    specialized Array._endMutation()();
    swift_unknownObjectRetain();
    char v8 = sub_1000301E0(v9, v12);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

+ (BOOL)canCreateNewFolderIn:(id)a3
{
  return sub_1003DADF0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000FFC4);
}

+ (BOOL)canImportIn:(id)a3
{
  return sub_1003DADF0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000C134);
}

+ (BOOL)canShowInfoIn:(id)a3
{
  return a3 != 0;
}

- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  sub_10009E6C4(0, &qword_100708ED0);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  unint64_t v12 = self;
  DOCActionManager.perform(actionWithIdentifier:with:completionHandler:)(v7, v9, v10, (uint64_t)sub_100180CF4, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end