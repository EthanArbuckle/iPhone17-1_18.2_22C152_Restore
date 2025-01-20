@interface REMCKSharedEntitySyncActivity
+ (BOOL)conformsToREMChangeTrackingIdentifiable;
+ (NSString)cdEntityName;
- (REMCKSharedEntitySyncActivity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)remChangedObjectID;
- (void)willSave;
@end

@implementation REMCKSharedEntitySyncActivity

+ (NSString)cdEntityName
{
  swift_getObjCClassMetadata();
  sub_100094134(&qword_10090F108);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)willSave
{
  NSString v2 = self;
  sub_100235B28();
}

- (REMCKSharedEntitySyncActivity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMCKSharedEntitySyncActivity *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (id)remChangedObjectID
{
  NSString v2 = self;
  id v3 = sub_100235E34();

  return v3;
}

@end