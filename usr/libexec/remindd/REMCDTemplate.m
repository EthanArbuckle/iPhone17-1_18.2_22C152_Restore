@interface REMCDTemplate
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
- (BOOL)shouldUseResolutionTokenMapForMergingData;
- (BOOL)supportsDeletionByTTL;
- (REMCDTemplate)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void).cxx_construct;
- (void)cleanUpAfterLocalObjectMerge;
- (void)didSave_Swift;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)sortChildrenObjects;
- (void)willSave_Swift;
@end

@implementation REMCDTemplate

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
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
  v12 = (void *)static REMCDTemplate.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDTemplate.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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

- (void)sortChildrenObjects
{
  NSString v2 = self;
  _s7remindd13REMCDTemplateC19sortChildrenObjectsyyF_0();
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDTemplate.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  v3 = (void *)REMCDTemplate.newlyCreatedRecord()();

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
  uint64_t v6 = (void *)_s7remindd13REMCDTemplateC26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = _s7remindd13REMCDTemplateC5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDTemplate.cleanUpAfterLocalObjectMerge()();
}

- (id)objectsToBeDeletedBeforeThisObject
{
  NSString v2 = self;
  id v3 = [(REMCDTemplate *)v2 savedReminders];
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for REMCDSavedReminder();
    sub_10021122C(&qword_10090B668, (void (*)(uint64_t))type metadata accessor for REMCDSavedReminder);
    uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v6 = sub_100209B4C(v5, (uint64_t)type metadata accessor for REMCDSavedReminder, (uint64_t)&qword_10090B668, (uint64_t)type metadata accessor for REMCDSavedReminder, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10020D384);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_10020029C((unint64_t)v6, (void (*)(void))type metadata accessor for REMCDSavedReminder);
    swift_release();
    sub_100200B74(v7);
  }

  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (NSString)cdEntityName
{
  id v2 = [self cdEntityName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  id v2 = self;
  NSString v3 = (REMCDTemplate *)[(REMCDTemplate *)v2 parentAccount];
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = [(REMCDObject *)v3 effectiveMinimumSupportedVersion];

    id v2 = v4;
  }
  else
  {
    int64_t v5 = kREMSupportedVersionUnset;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  sub_10012674C((uint64_t)&off_1008B6C40);
  swift_arrayDestroy();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  LOBYTE(self) = REMCDTemplate.isConnected(toAccountObject:)((NSMutableDictionary)v4);

  return self & 1;
}

- (REMCDTemplate)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDTemplate();
  return [(REMCDTemplate *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) = 0;
  NSSet v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_defaultPublicLinkURLHostname);
  *NSSet v2 = 0x632E64756F6C6369;
  v2[1] = 0xEA00000000006D6FLL;
}

- (void).cxx_destruct
{
}

- (void)willSave_Swift
{
  if ((*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) & 1) == 0)
  {
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) = 1;
    NSSet v2 = self;
    sub_1003FB128();
  }
}

- (void)didSave_Swift
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) = 0;
}

@end