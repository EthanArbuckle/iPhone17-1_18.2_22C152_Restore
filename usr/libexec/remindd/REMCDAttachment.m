@interface REMCDAttachment
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (id)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)recordTypes;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)supportsDeletionByTTL;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)debug_lowLevelRemoveFromParent;
- (void)fixBrokenReferences;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
@end

@implementation REMCDAttachment

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAttachment"];
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = [(REMCDAttachment *)self reminder];
  unsigned __int8 v6 = [v5 isConnectedToAccountObject:v4];

  return v6;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObject:@"reminder"];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  v3 = [(REMCDAttachment *)self reminder];
  if (v3)
  {
    id v4 = [(REMCDAttachment *)self reminder];
    id v5 = [v4 effectiveMinimumSupportedVersion];
  }
  else
  {
    id v5 = (id)kREMSupportedVersionUnset;
  }

  return (int64_t)v5;
}

- (void)debug_lowLevelRemoveFromParent
{
}

+ (BOOL)isAbstract
{
  return 1;
}

+ (id)cdEntityName
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromClass((Class)a1);
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v9 = +[REMLogStore utility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100754A34(v9);
    }
  }
  v7 = +[REMAttachment cdEntityName];

  return v7;
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
  v12 = (void *)static REMCDAttachment.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)static REMCDAttachment.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  REMCDAttachment.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  v3 = (void *)REMCDAttachment.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDAttachment *)v2 reminder];

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)_sSo15REMCDAttachmentC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = _sSo15REMCDAttachmentC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDAttachment.cleanUpAfterLocalObjectMerge()();
}

- (void)fixBrokenReferences
{
  NSString v2 = self;
  REMCDAttachment.fixBrokenReferences()();
}

@end