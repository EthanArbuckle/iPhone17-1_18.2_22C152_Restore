@interface REMCDManualSortHint
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (NSString)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)recordTypes;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)supportsDeletionByTTL;
- (REMCDManualSortHint)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void).cxx_construct;
- (void)cleanUpAfterLocalObjectMerge;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
@end

@implementation REMCDManualSortHint

+ (NSString)cdEntityName
{
  id v2 = [self cdEntityName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  v4 = (REMCDManualSortHint *)a3;
  v5 = self;
  v6 = (REMCDManualSortHint *)[(REMCDManualSortHint *)v5 account];
  if (v6)
  {
    v7 = v6;
    unsigned __int8 v8 = [(REMCDManualSortHint *)v6 isConnectedToAccountObject:v4];

    v4 = v5;
    v5 = v7;
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  return kREMSupportedVersionUnset;
}

- (REMCDManualSortHint)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDManualSortHint();
  return [(REMCDManualSortHint *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  NSSet v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___REMCDManualSortHint_separatorInConcatenatedContainerIDsWithLocalContainerIDPrefix);
  *NSSet v2 = 31868;
  v2[1] = 0xE200000000000000;
  NSString v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___REMCDManualSortHint_separatorInConcatenatedElementIDsWithLocalElementIDPrefix);
  *NSString v3 = 31868;
  v3[1] = 0xE200000000000000;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (id)recordTypes
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a5;
  v12 = (void *)sub_100509368(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1005094E0(v8, v9, (uint64_t)v10);

  return v11;
}

- (id)recordZoneName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (id)recordType
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  uint64_t v7 = self;
  sub_100509984(v6);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  NSString v3 = sub_10050AADC();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDManualSortHint *)v2 account];

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_10050D6A8();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10050D870();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  sub_10050C108();
}

@end