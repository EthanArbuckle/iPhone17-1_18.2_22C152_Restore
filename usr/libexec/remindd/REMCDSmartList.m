@interface REMCDSmartList
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (id)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)recordTypes;
- (BOOL)didCleanUpManualSortHintOnMarkingForDeletion;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)shouldUseResolutionTokenMapForMergingData;
- (BOOL)supportsDeletionByTTL;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)debug_lowLevelRemoveFromParent;
- (void)didSave_Swift;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)setDidCleanUpManualSortHintOnMarkingForDeletion:(BOOL)a3;
- (void)sortChildrenObjects;
- (void)willSave_Swift;
@end

@implementation REMCDSmartList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDSmartList"];
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = [(REMCDObject *)self remObjectID];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:v5];
    v7 = v6;
    if (v6)
    {
      LOBYTE(v8) = [v6 integerValue] == (id)1;
    }
    else
    {
      [v4 setObject:&off_1008D72B8 forKeyedSubscript:v5];
      v9 = [(REMCDSmartList *)self parentList];

      if (v9) {
        [(REMCDSmartList *)self parentList];
      }
      else {
      v10 = [(REMCDSmartList *)self parentAccount];
      }
      unsigned int v8 = [v10 isConnectedToAccountObject:v4];

      if (v8) {
        v11 = &off_1008D72D0;
      }
      else {
        v11 = &off_1008D72E8;
      }
      [v4 setObject:v11 forKeyedSubscript:v5];
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObjects:@"parentAccount", @"parentList", 0];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  v3 = (void *)REMSmartListTypeCustom;
  id v4 = [(REMCDSmartList *)self smartListType];
  LODWORD(v3) = [v3 isEqual:v4];

  if (!v3) {
    return kREMSupportedVersionUnset;
  }
  v5 = [(REMCDSmartList *)self parentList];

  if (v5)
  {
    v6 = [(REMCDSmartList *)self parentList];
    id v7 = [v6 effectiveMinimumSupportedVersion];

    return (int64_t)v7;
  }
  v10 = [(REMCDSmartList *)self parentAccount];
  if (v10)
  {
    v11 = [(REMCDSmartList *)self parentAccount];
    id v9 = [v11 effectiveMinimumSupportedVersion];
  }
  else
  {
    id v9 = (id)kREMSupportedVersionUnset;
  }

  return (int64_t)v9;
}

- (void)debug_lowLevelRemoveFromParent
{
  v3 = (void *)REMSmartListTypeCustom;
  id v4 = [(REMCDSmartList *)self smartListType];
  LODWORD(v3) = [v3 isEqual:v4];

  if (v3)
  {
    [(REMCDSmartList *)self setParentList:0];
    [(REMCDSmartList *)self setParentAccount:0];
  }
  else
  {
    v5 = +[REMLogStore write];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10074F1B0(v5);
    }
  }
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMSmartList cdEntityName];
}

- (BOOL)didCleanUpManualSortHintOnMarkingForDeletion
{
  return self->didCleanUpManualSortHintOnMarkingForDeletion;
}

- (void)setDidCleanUpManualSortHintOnMarkingForDeletion:(BOOL)a3
{
  self->didCleanUpManualSortHintOnMarkingForDeletion = a3;
}

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
  v12 = (void *)static REMCDSmartList.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDSmartList.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  _sSo14REMCDSmartListC7reminddE19sortChildrenObjectsyyF_0();
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDSmartList.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  v3 = (void *)REMCDSmartList.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  REMCDSmartList.parentCloud()(v3);
  v5 = v4;

  return v5;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)_sSo14REMCDSmartListC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = _sSo14REMCDSmartListC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDSmartList.cleanUpAfterLocalObjectMerge()();
}

- (void)willSave_Swift
{
  NSString v2 = self;
  if (![(REMCDSmartList *)v2 didCleanUpManualSortHintOnMarkingForDeletion])
  {
    [(REMCDSmartList *)v2 setDidCleanUpManualSortHintOnMarkingForDeletion:1];
    sub_10040BCD0();
  }
}

- (void)didSave_Swift
{
}

@end