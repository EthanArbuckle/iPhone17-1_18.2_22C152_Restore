@interface REMCDDueDateDeltaAlert
+ (BOOL)conformsToREMChangeTrackingIdentifiable;
+ (NSString)cdEntityName;
+ (id)objectIDWithUUID:(id)a3;
- (REMCDDueDateDeltaAlert)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (REMObjectID)remObjectID;
- (id)remChangedObjectID;
- (id)remObjectIDWithError:(id *)a3;
@end

@implementation REMCDDueDateDeltaAlert

- (REMCDDueDateDeltaAlert)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMCDDueDateDeltaAlert *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

+ (NSString)cdEntityName
{
  swift_getObjCClassMetadata();
  sub_100094134((uint64_t *)&unk_100920C20);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (id)remChangedObjectID
{
  NSString v2 = self;
  id v3 = REMCDDueDateDeltaAlert.remChangedObjectID()();

  return v3;
}

- (REMObjectID)remObjectID
{
  NSString v2 = self;
  id v3 = REMCDDueDateDeltaAlert.remObjectID.getter();

  return (REMObjectID *)v3;
}

- (id)remObjectIDWithError:(id *)a3
{
  id v3 = self;
  REMCDDueDateDeltaAlert.checkedREMObjectID()();
  v5 = v4;

  return v5;
}

+ (id)objectIDWithUUID:(id)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13[1] = ObjCClassMetadata;
  sub_100094134((uint64_t *)&unk_100920C20);
  String.init<A>(describing:)();
  id v8 = objc_allocWithZone((Class)REMObjectID);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v8 initWithUUID:isa entityName:v10];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

@end