@interface REMCDAlarmTrigger
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (NSString)alarmReferenceCKRecordType;
+ (id)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)recordTypes;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)isTemporal;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)supportsDeletionByTTL;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)modelObject;
- (id)newlyCreatedRecord;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)debug_lowLevelRemoveFromParent;
- (void)fixBrokenReferences;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)setAlarm:(id)a3;
@end

@implementation REMCDAlarmTrigger

+ (BOOL)isAbstract
{
  return 1;
}

+ (id)cdEntityName
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v9 = +[REMLogStore utility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10074E0D0(v9);
    }
  }
  v7 = +[REMAlarmTrigger cdEntityName];

  return v7;
}

- (BOOL)isTemporal
{
  return 0;
}

- (void)setAlarm:(id)a3
{
  id v4 = a3;
  [(REMCDObject *)self willChangeValueForKey:@"alarm"];
  [(REMCDAlarmTrigger *)self setPrimitiveValue:v4 forKey:@"alarm"];
  [(REMCDObject *)self didChangeValueForKey:@"alarm"];
  id v6 = [(REMCDAlarmTrigger *)self alarm];
  v5 = [v6 reminder];
  [v5 updateDisplayDateWithAlarm:v4];
}

- (id)modelObject
{
  uint64_t v3 = objc_opt_class();
  id v4 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Abstract method called -[%@ %@]", v3, v4);

  return 0;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = [(REMCDAlarmTrigger *)self alarm];
  unsigned __int8 v6 = [v5 isConnectedToAccountObject:v4];

  return v6;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObject:@"alarm"];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  uint64_t v3 = [(REMCDAlarmTrigger *)self alarm];
  if (v3)
  {
    id v4 = [(REMCDAlarmTrigger *)self alarm];
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

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAlarmTrigger"];
}

+ (NSString)alarmReferenceCKRecordType
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
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
  v12 = (void *)static REMCDAlarmTrigger.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)static REMCDAlarmTrigger.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  return [(REMCDAlarmTrigger *)self isExtraneous] ^ 1;
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
  REMCDAlarmTrigger.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  uint64_t v3 = (void *)REMCDAlarmTrigger.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDAlarmTrigger *)v2 alarm];

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
  uint64_t v6 = (void *)_sSo17REMCDAlarmTriggerC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = _sSo17REMCDAlarmTriggerC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDAlarmTrigger.cleanUpAfterLocalObjectMerge()();
}

- (void)fixBrokenReferences
{
  NSString v2 = self;
  REMCDAlarmTrigger.fixBrokenReferences()();
}

@end