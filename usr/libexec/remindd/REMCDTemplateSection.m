@interface REMCDTemplateSection
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (NSString)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)recordTypes;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)shouldUseResolutionTokenMapForMergingData;
- (BOOL)supportsDeletionByTTL;
- (REMCDObject)parentCDObject;
- (REMCDTemplateSection)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)fixBrokenReferences;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
@end

@implementation REMCDTemplateSection

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
  v12 = (void *)static REMCDTemplateSection.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDTemplateSection.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDTemplateSection.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  v3 = (void *)REMCDTemplateSection.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDTemplateSection *)v2 template];

  return v3;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)_s7remindd20REMCDTemplateSectionC26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = _s7remindd20REMCDTemplateSectionC5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDTemplateSection.cleanUpAfterLocalObjectMerge()();
}

- (void)fixBrokenReferences
{
  NSString v2 = self;
  REMCDTemplateSection.fixBrokenReferences()();
}

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
}

+ (BOOL)isAbstract
{
  return 0;
}

- (REMCDObject)parentCDObject
{
  NSString v2 = self;
  id v3 = [(REMCDTemplateSection *)v2 template];

  return (REMCDObject *)v3;
}

+ (NSString)cdEntityName
{
  sub_1000963CC(0, &qword_10090B630);
  id v2 = [(id)swift_getObjCClassFromMetadata() cdEntityName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  id v2 = self;
  NSString v3 = (REMCDTemplateSection *)[(REMCDTemplateSection *)v2 template];
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
  sub_10012674C((uint64_t)&off_1008B42C0);
  swift_arrayDestroy();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (REMCDTemplateSection)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDTemplateSection();
  return [(REMCDBaseSection *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end