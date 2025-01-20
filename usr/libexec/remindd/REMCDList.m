@interface REMCDList
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (id)cdEntityName;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 context:(id)a5;
+ (id)propertiesThatShouldTriggerReindexing;
+ (id)recordTypes;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)isShared;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)shouldUseResolutionTokenMapForMergingData;
- (BOOL)supportsDeletionByTTL;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (NSData)reminderIDsMergeableOrdering;
- (NSString)displayName;
- (id)_parentZoneMismatchErrorDebugDescription;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)recordType;
- (id)recordZoneName;
- (id)shareTitle;
- (id)shareType;
- (int64_t)compare:(id)a3;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)debug_lowLevelRemoveFromParent;
- (void)incrementSpotlightIndexCount;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)objectWasDeletedFromCloudByAnotherDevice;
- (void)restoreParentReferenceAfterUnmarkingForDeletion;
- (void)setReminderIDsMergeableOrdering:(id)a3;
- (void)sortChildrenObjects;
- (void)updateObjectWithShare:(id)a3;
@end

@implementation REMCDList

- (NSData)reminderIDsMergeableOrdering
{
  [(REMCDList *)self willAccessValueForKey:@"reminderIDsOrdering"];
  [(REMCDList *)self willAccessValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
  v3 = [(REMCDList *)self primitiveValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
  [(REMCDList *)self didAccessValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
  [(REMCDList *)self didAccessValueForKey:@"reminderIDsOrdering"];

  return (NSData *)v3;
}

- (void)setReminderIDsMergeableOrdering:(id)a3
{
  id v4 = a3;
  [(REMCDObject *)self willChangeValueForKey:@"reminderIDsOrdering"];
  [(REMCDObject *)self willChangeValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
  [(REMCDList *)self setPrimitiveValue:v4 forKey:@"reminderIDsMergeableOrdering_v2_JSON"];

  [(REMCDObject *)self didChangeValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];

  [(REMCDObject *)self didChangeValueForKey:@"reminderIDsOrdering"];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = REMDynamicCast();

  if (v5 && ([v5 name], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v5 name];
    v8 = [(REMCDList *)self name];
    id v9 = [v8 compare:v7];
  }
  else
  {
    id v9 = 0;
  }

  return (int64_t)v9;
}

- (BOOL)validateForInsert:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)REMCDList;
  BOOL v5 = -[REMCDObject validateForInsert:](&v9, "validateForInsert:");
  if (v5)
  {
    v6 = [(REMCDList *)self account];

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        v7 = [(REMCDObject *)self remObjectID];
        *a3 = +[REMError validationErrorListHasNoAccount:v7];
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)REMCDList;
  BOOL v4 = [(REMCDList *)&v10 validateForDelete:a3];
  if (v4)
  {
    BOOL v5 = [(REMCDObject *)self remObjectID];
    v6 = [v5 stringRepresentation];

    v7 = +[REMUserDefaults daemonUserDefaults];
    [v7 removeMuteNotificationOptionsForSharedList:v6];

    v8 = +[REMUserDefaults daemonUserDefaults];
    [v8 removeHideEmptySectionsForGroceryList:v6];
  }
  return v4;
}

- (id)_parentZoneMismatchErrorDebugDescription
{
  v3 = [(REMCDList *)self sharees];
  BOOL v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"sharees.count: %lu, sharingStatus: %d", [v3 count], (int)-[REMCDList sharingStatus](self, "sharingStatus"));

  return v4;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMList cdEntityName];
}

- (BOOL)isShared
{
  v2 = self;
  v3 = [(REMCDList *)self sharees];
  LOBYTE(v2) = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", [v3 count], (int)-[REMCDList sharingStatus](v2, "sharingStatus"));

  return (char)v2;
}

- (void)incrementSpotlightIndexCount
{
  if ([(REMCDList *)self spotlightIndexCount] == (id)0x7FFFFFFFFFFFFFFFLL) {
    v3 = 0;
  }
  else {
    v3 = (char *)[(REMCDList *)self spotlightIndexCount] + 1;
  }

  [(REMCDList *)self setSpotlightIndexCount:v3];
}

+ (id)propertiesThatShouldTriggerReindexing
{
  return +[NSSet setWithArray:&off_1008D7880];
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(REMCDObject *)self remObjectID];
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
      [v4 setObject:&off_1008D7300 forKeyedSubscript:v5];
      objc_super v9 = [(REMCDList *)self parentList];

      if (v9) {
        [(REMCDList *)self parentList];
      }
      else {
      objc_super v10 = [(REMCDList *)self parentAccount];
      }
      unsigned int v8 = [v10 isConnectedToAccountObject:v4];

      if (v8) {
        v11 = &off_1008D7318;
      }
      else {
        v11 = &off_1008D7330;
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

- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 name];
  unsigned int v9 = [v8 isEqualToString:@"reminders"];

  if (v9)
  {
    objc_opt_class();
    objc_super v10 = REMCheckedDynamicCast();
    v11 = [v10 parentReminder];
    unsigned __int8 v12 = v11 == 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)REMCDList;
    unsigned __int8 v12 = [(REMCDObject *)&v14 shouldCascadeMarkAsDeleteInto:v6 forRelationship:v7];
  }

  return v12;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObjects:@"parentList", @"parentAccount", 0];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  v3 = [(REMCDList *)self parentList];

  if (v3)
  {
    id v4 = [(REMCDList *)self parentList];
    id v5 = [v4 effectiveMinimumSupportedVersion];
  }
  else
  {
    id v4 = [(REMCDList *)self parentAccount];
    if (v4)
    {
      id v6 = [(REMCDList *)self parentAccount];
      id v5 = [v6 effectiveMinimumSupportedVersion];
    }
    else
    {
      id v5 = (id)kREMSupportedVersionUnset;
    }
  }

  return (int64_t)v5;
}

- (void)debug_lowLevelRemoveFromParent
{
  [(REMCDList *)self setParentList:0];

  [(REMCDList *)self setParentAccount:0];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDList"];
}

- (NSString)displayName
{
  v3 = [(REMCDList *)self name];

  if (v3)
  {
    id v4 = [(REMCDList *)self name];
    id v5 = +[REMDisplayNameUtils displayNameFromListName:v4 isPlaceholder:[(REMCDObject *)self isPlaceholder]];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
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
  unsigned __int8 v12 = (void *)static REMCDList.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDList.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

  return v11;
}

+ (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)static REMCDList.newPlaceholderObject(for:account:context:)(v8, (uint64_t)a4, (uint64_t)v10);

  return v11;
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  NSArray v2 = self;
  if (![(REMCDObject *)v2 isOwnedByCurrentUser]) {
    [(REMCDObject *)v2 updateSharedObjectOwnerName:0];
  }
  v3.receiver = v2;
  v3.super_class = (Class)REMCDList;
  [(REMCDObject *)&v3 objectWasDeletedFromCloudByAnotherDevice];
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

- (void)sortChildrenObjects
{
  NSString v2 = self;
  sub_1002F8428();
  sub_1002F88CC();
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDList.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  objc_super v3 = (void *)REMCDList.newlyCreatedRecord()();

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

- (id)shareTitle
{
  NSString v2 = self;
  id v3 = [(REMCDList *)v2 name];
  if (!v3)
  {
    v7.receiver = v2;
    v7.super_class = (Class)REMCDList;
    id v3 = [(REMCDObject *)&v7 shareTitle];
  }
  id v4 = v3;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)shareType
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (void)updateObjectWithShare:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  objc_super v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  REMCDList.update(with:)(v9);
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 1;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  REMCDList.existingLocalObjectToMerge(with:)(v7, (NSPredicate_optional *)a3);
  CKShare_optional v9 = v8;

  return v9;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = (REMCDObject *)a3;
  id v5 = self;
  LOBYTE(self) = REMCDList.merge(withLocalObject:)(v4);

  return self & 1;
}

- (id)objectsToBeDeletedBeforeThisObject
{
  NSString v2 = self;
  REMCDList.objectsToBeDeletedBeforeThisObject()();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)restoreParentReferenceAfterUnmarkingForDeletion
{
  NSString v2 = self;
  id v3 = [(REMCDList *)v2 account];
  [(REMCDList *)v2 setParentAccount:v3];
}

@end