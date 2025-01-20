@interface REMCDAlarm
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (id)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)recordTypes;
- (BOOL)didHandleMarkingExtraneousAlarmDuringWillSave;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)isSnooze;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)supportsDeletionByTTL;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)modelObject;
- (id)newlyCreatedRecord;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)debug_lowLevelRemoveFromParent;
- (void)didSave;
- (void)fixBrokenReferences;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)setDidHandleMarkingExtraneousAlarmDuringWillSave:(BOOL)a3;
- (void)setReminder:(id)a3;
- (void)willSave;
@end

@implementation REMCDAlarm

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = [(REMCDAlarm *)self reminder];
  unsigned __int8 v6 = [v5 isConnectedToAccountObject:v4];

  return v6;
}

- (id)modelObject
{
  v3 = [(REMCDAlarm *)self trigger];
  id v4 = [v3 modelObject];

  v5 = [(REMCDAlarm *)self identifier];
  id v6 = objc_alloc((Class)REMAlarm);
  v7 = +[REMAlarm objectIDWithUUID:v5];
  id v8 = [v6 initWithTrigger:v4 objectID:v7];

  return v8;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObject:@"reminder"];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  v3 = [(REMCDAlarm *)self reminder];
  if (v3)
  {
    id v4 = [(REMCDAlarm *)self reminder];
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
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarm cdEntityName];
}

- (BOOL)isSnooze
{
  v2 = [(REMCDAlarm *)self originalAlarmUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setReminder:(id)a3
{
  id v4 = a3;
  [(REMCDObject *)self willChangeValueForKey:@"reminder"];
  [(REMCDAlarm *)self setPrimitiveValue:v4 forKey:@"reminder"];

  id v5 = [(REMCDAlarm *)self reminder];
  [v5 updateDisplayDateWithAlarm:self];

  [(REMCDObject *)self didChangeValueForKey:@"reminder"];
}

- (void)willSave
{
  if (![(REMCDAlarm *)self didHandleMarkingExtraneousAlarmDuringWillSave])
  {
    [(REMCDAlarm *)self setDidHandleMarkingExtraneousAlarmDuringWillSave:1];
    if ([(REMCDAlarm *)self markedForDeletion])
    {
      BOOL v3 = [(REMCDAlarm *)self reminder];
      if (v3)
      {
      }
      else
      {
        uint64_t v4 = [(REMCDAlarm *)self trigger];
        if (v4)
        {
          id v5 = (void *)v4;
          id v6 = [(REMCDAlarm *)self trigger];
          if ([v6 markedForDeletion])
          {
            v7 = [(REMCDAlarm *)self trigger];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              [(REMCDAlarm *)self setIsExtraneous:1];
            }
          }
          else
          {
          }
        }
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)REMCDAlarm;
  [(REMCDObject *)&v9 willSave];
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDAlarm;
  [(REMCDObject *)&v3 didSave];
  [(REMCDAlarm *)self setDidHandleMarkingExtraneousAlarmDuringWillSave:0];
}

- (BOOL)didHandleMarkingExtraneousAlarmDuringWillSave
{
  return self->didHandleMarkingExtraneousAlarmDuringWillSave;
}

- (void)setDidHandleMarkingExtraneousAlarmDuringWillSave:(BOOL)a3
{
  self->didHandleMarkingExtraneousAlarmDuringWillSave = a3;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAlarm"];
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
  v12 = (void *)static REMCDAlarm.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDAlarm.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  return [(REMCDAlarm *)self isExtraneous] ^ 1;
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
  REMCDAlarm.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  objc_super v3 = (void *)REMCDAlarm.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDAlarm *)v2 reminder];

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
  uint64_t v6 = (void *)_sSo10REMCDAlarmC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = _sSo10REMCDAlarmC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDAlarm.cleanUpAfterLocalObjectMerge()();
}

- (id)objectsToBeDeletedBeforeThisObject
{
  NSString v2 = self;
  id v3 = [(REMCDAlarm *)v2 trigger];
  if (v3)
  {
    id v4 = v3;
    sub_100094134((uint64_t *)&unk_10090A050);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100776E40;
    *(void *)(v5 + 56) = sub_1000963CC(0, (unint64_t *)&unk_100910DD0);
    *(void *)(v5 + 32) = v4;
  }

  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)fixBrokenReferences
{
  NSString v2 = self;
  REMCDAlarm.fixBrokenReferences()();
}

@end