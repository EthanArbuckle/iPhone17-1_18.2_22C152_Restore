@interface REMCDBaseSection
+ (NSString)cdEntityName;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (REMCDBaseSection)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (REMCDObject)parentCDObject;
@end

@implementation REMCDBaseSection

- (REMCDObject)parentCDObject
{
  result = (REMCDObject *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (NSString)cdEntityName
{
  id v2 = [self cdEntityName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = REMCDBaseSection.isConnected(toAccountObject:)((NSMutableDictionary)v4);

  return self & 1;
}

- (REMCDBaseSection)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDBaseSection();
  return [(REMCDBaseSection *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end