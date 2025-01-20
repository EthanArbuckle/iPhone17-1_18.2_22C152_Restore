@interface REMCDSavedAttachment
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
- (REMCDSavedAttachment)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)fixBrokenReferences;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)prepareForDeletion;
@end

@implementation REMCDSavedAttachment

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
  v12 = (void *)static REMCDSavedAttachment.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDSavedAttachment.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDSavedAttachment.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  v3 = (void *)REMCDSavedAttachment.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDSavedAttachment *)v2 reminder];

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
  uint64_t v6 = (void *)_s7remindd20REMCDSavedAttachmentC26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = _s7remindd20REMCDSavedAttachmentC5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDSavedAttachment.cleanUpAfterLocalObjectMerge()();
}

- (void)fixBrokenReferences
{
  NSString v2 = self;
  REMCDSavedAttachment.fixBrokenReferences()();
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (NSString)cdEntityName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (void)prepareForDeletion
{
  NSString v2 = self;
  REMCDSavedAttachment.prepareForDeletion()();
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  NSString v2 = self;
  id v3 = (REMCDSavedAttachment *)[(REMCDSavedAttachment *)v2 reminder];
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = [(REMCDObject *)v3 effectiveMinimumSupportedVersion];

    NSString v2 = v4;
  }
  else
  {
    int64_t v5 = kREMSupportedVersionUnset;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  sub_10012674C((uint64_t)&off_1008B7740);
  swift_arrayDestroy();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  LOBYTE(self) = REMCDSavedAttachment.isConnected(toAccountObject:)((NSMutableDictionary)v4);

  return self & 1;
}

- (REMCDSavedAttachment)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMCDSavedAttachment *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end