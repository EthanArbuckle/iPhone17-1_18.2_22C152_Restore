@interface REMCDPublicTemplate
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMCDPublicTemplate)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (REMObjectID)remObjectID;
@end

@implementation REMCDPublicTemplate

+ (NSString)cdEntityName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (REMObjectID)remObjectID
{
  NSString v2 = self;
  id v3 = sub_10062D2FC();

  return (REMObjectID *)v3;
}

+ (id)newObjectID
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  id v6 = objc_allocWithZone((Class)REMObjectID);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v6 initWithUUID:isa entityName:v8];

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

+ (id)objectIDWithUUID:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = objc_allocWithZone((Class)REMObjectID);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [v7 initWithUUID:isa entityName:v9];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v10;
}

- (REMCDPublicTemplate)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMCDPublicTemplate *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end