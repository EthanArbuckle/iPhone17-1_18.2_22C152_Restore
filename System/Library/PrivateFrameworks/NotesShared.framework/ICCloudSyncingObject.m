@interface ICCloudSyncingObject
+ (BOOL)hasAnySharedObjectInContext:(id)a3;
+ (BOOL)needsToReFetchServerRecordValue:(id)a3;
+ (BOOL)supportsActivityEvents;
+ (BOOL)supportsNotesVersionTracking;
+ (BOOL)supportsUserSpecificRecords;
+ (ICCloudSyncingObject)objectWithRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (NSArray)bundleIdentifiersWithReplicaID;
+ (NSSet)mergeableWallClockValueKeyPaths;
+ (id)allCloudObjectIDsInContext:(id)a3 passingTest:(id)a4;
+ (id)allPasswordProtectedObjectsInContext:(id)a3;
+ (id)assetForData:(id)a3;
+ (id)assetForTemporaryURL:(id)a3;
+ (id)assetForURL:(id)a3;
+ (id)cloudObjectWithIdentifier:(id)a3 context:(id)a4;
+ (id)dataForAsset:(id)a3;
+ (id)deletedByThisDeviceOperationQueue;
+ (id)deletedByThisDeviceSet;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)failedToSyncCountsByIdentifier;
+ (id)failureCountQueue;
+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud;
+ (id)keyPathsForValuesAffectingCloudAccount;
+ (id)keyPathsForValuesAffectingIsSharedReadOnly;
+ (id)keyPathsForValuesAffectingIsSharedViaICloud;
+ (id)keyPathsForValuesAffectingNeedsToBeDeletedFromCloud;
+ (id)keyPathsForValuesAffectingNeedsToBePushedToCloud;
+ (id)keyPathsForValuesAffectingServerShareCheckingParent;
+ (id)keyPathsForValuesAffectingZoneOwnerName;
+ (id)mergeUnappliedEncryptedRecordsQueue;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newObjectWithIdentifier:(id)a3 context:(id)a4;
+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)numberOfPushAttemptsToWaitByIdentifier;
+ (id)objectsWithRecordID:(id)a3 context:(id)a4;
+ (id)predicateForDeprecatedObjects;
+ (id)predicateForFetchedFromCloudObjects;
+ (id)predicateForInCloudObjects;
+ (id)predicateForObjectsWithIdentifiers:(id)a3;
+ (id)predicateForPasswordProtectedObjects;
+ (id)predicateForUnmarkedForDeletionObjects;
+ (id)predicateForVisibleObjects;
+ (id)recordSystemFieldsTransformer;
+ (id)shareSystemFieldsTransformer;
+ (id)temporaryAssetDirectoryURL;
+ (id)temporaryAssets;
+ (id)versionsByOperationQueue;
+ (id)versionsByRecordIDByOperation;
+ (int64_t)currentNotesVersion;
+ (void)deleteAllTemporaryAssetFilesForAllObjects;
+ (void)deleteTemporaryAssetFilesForOperation:(id)a3;
+ (void)deleteTemporaryFilesForAsset:(id)a3;
+ (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6;
+ (void)enumerateAllCloudObjectsInContext:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 batchSize:(unint64_t)a7 saveAfterBatch:(BOOL)a8 usingBlock:(id)a9;
+ (void)objc_removeAllCloudSyncingObjectActivityEventsForUnsharedObjectsInContext:(id)a3;
+ (void)resetAllDeletedByThisDeviceProperties;
- (BOOL)allowsExporting;
- (BOOL)allowsImporting;
- (BOOL)canAuthenticate;
- (BOOL)canBeRootShareObject;
- (BOOL)canBeSharedViaICloud;
- (BOOL)canCurrentUserShare;
- (BOOL)canHaveCryptoStrategy;
- (BOOL)cryptoStrategyIsTransient;
- (BOOL)didAddAuthenticationStateObservers;
- (BOOL)didFailToSaveUserSpecificRecordWithID:(id)a3 accountID:(id)a4 error:(id)a5;
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)hasAllMandatoryFields;
- (BOOL)hasContextOptions:(unint64_t)a3;
- (BOOL)hasInvitees;
- (BOOL)hasPassphraseSet;
- (BOOL)hasSuccessfullyPushedLatestVersionToCloud;
- (BOOL)isAuthenticated;
- (BOOL)isDeletable;
- (BOOL)isDeprecated;
- (BOOL)isEncryptableKeyBinaryData:(id)a3;
- (BOOL)isInCloud;
- (BOOL)isInICloudAccount;
- (BOOL)isMergingRecord;
- (BOOL)isMergingUnappliedEncryptedRecord;
- (BOOL)isOwnedByCurrentUser;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)isPasswordProtectedAndLocked;
- (BOOL)isPubliclyShared;
- (BOOL)isPubliclySharedOrHasInvitees;
- (BOOL)isSharedReadOnly;
- (BOOL)isSharedRootObject;
- (BOOL)isSharedThroughParent;
- (BOOL)isSharedViaICloud;
- (BOOL)isUnsupported;
- (BOOL)isValidObject;
- (BOOL)isVisible;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)mergeUnappliedEncryptedRecord;
- (BOOL)mergeUnappliedEncryptedRecordRecursively;
- (BOOL)needsInitialFetchFromCloudCheckingParent;
- (BOOL)needsToBeDeletedFromCloud;
- (BOOL)needsToBePushedToCloud;
- (BOOL)needsToDeleteShare;
- (BOOL)needsToFetchAfterServerRecordChanged:(id)a3;
- (BOOL)needsToLoadDecryptedValues;
- (BOOL)objectFailedToBePushedToCloudWithOperation:(id)a3 recordID:(id)a4 error:(id)a5;
- (BOOL)shareMatchesRecord;
- (BOOL)shouldBeDeletedFromLocalDatabase;
- (BOOL)shouldBeIgnoredForSync;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)supportsDeletionByTTL;
- (BOOL)supportsEncryptedValuesDictionary;
- (BOOL)trustsTimestampsFromReplicaID:(id)a3;
- (BOOL)updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded;
- (BOOL)validateIdentifier:(id *)a3 error:(id *)a4;
- (BOOL)wantsUserSpecificRecord;
- (BOOL)wasCreatedByCurrentUser;
- (BOOL)wasRecentlyDeletedByThisDevice;
- (CKRecord)serverRecord;
- (CKRecord)unappliedEncryptedRecord;
- (CKRecord)userSpecificServerRecord;
- (CKRecordID)recordID;
- (CKRecordID)userSpecificRecordID;
- (CKShare)serverShare;
- (CKShare)serverShareCheckingParent;
- (ICAppContext)appContext;
- (ICCloudSyncingObject)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (ICCloudSyncingObjectCryptoStrategy)cryptoStrategy;
- (ICCloudSyncingObjectCryptoStrategy)cryptoStrategyForMergingEncryptedData;
- (ICMergeableDictionary)replicaIDToNotesVersion;
- (ICTTOrderedSetVersionedDocument)activityEventsDocument;
- (NSArray)allChildCloudObjects;
- (NSArray)ancestorCloudObjects;
- (NSArray)childCloudObjects;
- (NSData)activityEventsData;
- (NSData)primaryEncryptedData;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDate)objc_shareTimestamp;
- (NSDictionary)decryptedValues;
- (NSMutableDictionary)mutableDecryptedValues;
- (NSMutableDictionary)participantHandlesToParticipants;
- (NSSet)deviceReplicaIDs;
- (NSString)debugDescription;
- (NSString)lastUpdateChangeCountReason;
- (NSString)passwordHint;
- (NSString)recordType;
- (NSString)recordZoneName;
- (NSString)userSpecificRecordType;
- (NSString)zoneOwnerName;
- (NSUUID)currentReplicaID;
- (Protocol)cryptoStrategyProtocol;
- (id)associatedNoteParticipants;
- (id)checklistItemToActivityEventsStorage;
- (id)cloudAccount;
- (id)cloudContext;
- (id)decryptedValueForKey:(id)a3;
- (id)deviceManagementRestrictionsManager;
- (id)ic_loggingValues;
- (id)makeCloudKitRecordForApproach:(int64_t)a3;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3;
- (id)mergeDecryptedValue:(id)a3 withOldValue:(id)a4 forKey:(id)a5;
- (id)newlyCreatedRecord;
- (id)notesVersionForReplicaID:(id)a3;
- (id)objc_timestampForChecklistItemWithIdentifier:(id)a3;
- (id)objc_userIDForChecklistItemWithIdentifier:(id)a3;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)ownerRecordName;
- (id)parentCloudObject;
- (id)parentCloudObjectModificationDate;
- (id)parentEncryptableObject;
- (id)participantForHandle:(id)a3;
- (id)participantForUserID:(id)a3;
- (id)persistAddParticipantActivityEventForObject:(id)a3 participant:(id)a4;
- (id)persistCopyActivityEventForObject:(id)a3 originalObject:(id)a4 fromParentObject:(id)a5 toParentObject:(id)a6;
- (id)persistCreateActivityEventForObject:(id)a3 inParentObject:(id)a4;
- (id)persistDeleteActivityEventForObject:(id)a3 fromParentObject:(id)a4;
- (id)persistMentionActivityEventForObject:(id)a3 mentionAttachments:(id)a4;
- (id)persistMoveActivityEventForObject:(id)a3 fromParentObject:(id)a4 toParentObject:(id)a5;
- (id)persistRemoveParticipantActivityEventForObject:(id)a3 participant:(id)a4;
- (id)persistRenameActivityEventForObject:(id)a3;
- (id)persistToggleChecklistItemActivityEventForObject:(id)a3 todo:(id)a4;
- (id)persistedActivityEventsStorage;
- (id)primaryEncryptedDataFromRecord:(id)a3;
- (id)primitiveValueForEncryptableKey:(id)a3;
- (id)serializedValuesToEncrypt;
- (id)shareDescription;
- (id)shareDescriptionForShareParticipants:(id)a3;
- (id)sharedOwnerName;
- (id)sharedOwnerRecordName;
- (id)sharedRootObject;
- (id)shortLoggingDescription;
- (id)validatedCreateCryptoStrategy;
- (id)valueForEncryptableKey:(id)a3;
- (id)viewContext;
- (id)workerManagedObjectContext;
- (int64_t)databaseScope;
- (int64_t)failedToSyncCount;
- (int64_t)intrinsicNotesVersion;
- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3;
- (int64_t)isPushingSameOrLaterThanVersion:(int64_t)a3;
- (int64_t)numberOfPushAttemptsToWaitCount;
- (int64_t)versionForOperation:(id)a3;
- (unint64_t)mergeActivityEventsDocument:(id)a3;
- (unint64_t)mergeReplicaIDToNotesVersion:(id)a3;
- (void)activityEventsDocument;
- (void)addAuthenticationStateObserversIfNeeded;
- (void)addEmailAddressesAndPhoneNumbersToAttributeSet:(id)a3;
- (void)applyRandomCryptoGooIfNeeded;
- (void)assignToPersistentStore:(id)a3;
- (void)authenticationStateDidDeauthenticate:(id)a3;
- (void)authenticationStateWillDeauthenticate:(id)a3;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)clearChangeCountWithReason:(id)a3;
- (void)clearDecryptedData;
- (void)clearReplicaIDsToNotesVersion;
- (void)clearServerRecords;
- (void)cryptoStrategy;
- (void)decrementFailureCounts;
- (void)deleteChangeTokensAndReSync;
- (void)deleteFromLocalDatabase;
- (void)deserializeAndMergeValues:(id)a3;
- (void)didAcceptShare:(id)a3;
- (void)didDeleteUserSpecificRecordID:(id)a3;
- (void)didFetchUserSpecificRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
- (void)didSaveUserSpecificRecord:(id)a3;
- (void)didTurnIntoFault;
- (void)incrementFailureCounts;
- (void)initializeCryptoProperties;
- (void)inlineAssetsForRecord:(id)a3;
- (void)markForDeletion;
- (void)markShareDirtyIfNeededWithReason:(id)a3;
- (void)mergeCryptoFieldsFromRecord:(id)a3;
- (void)mergeCryptoTagAndInitializationVectorFromRecord:(id)a3;
- (void)mergeUnappliedEncryptedRecord;
- (void)mergeUnappliedEncryptedRecordRecursivelyInBackground;
- (void)needsToBePushedToCloud;
- (void)objc_removeAllCloudSyncingObjectActivityEvents;
- (void)objectWasDeletedFromCloud;
- (void)objectWasDeletedFromCloudByAnotherDevice;
- (void)objectWasFetchedButDoesNotExistInCloud;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4;
- (void)objectWillBePushedToCloudWithOperation:(id)a3;
- (void)persistPendingChangesRecursively;
- (void)recordID;
- (void)redactAuthorAttributionsToCurrentUser;
- (void)replicaIDToNotesVersion;
- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:(int64_t)a3;
- (void)resetFailureCounts;
- (void)resetToIntrinsicNotesVersionAndPropagateToChildObjects;
- (void)serializedValuesToEncrypt;
- (void)setActivityEventsData:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setChecklistItemToActivityEventsStorage:(id)a3;
- (void)setCryptoInitializationVector:(id)a3;
- (void)setCryptoIterationCount:(int64_t)a3;
- (void)setCryptoSalt:(id)a3;
- (void)setCryptoStrategyForMergingEncryptedData:(id)a3;
- (void)setCryptoTag:(id)a3;
- (void)setCryptoWrappedKey:(id)a3;
- (void)setCurrentReplicaID:(id)a3;
- (void)setDecryptedValue:(id)a3 forKey:(id)a4;
- (void)setDidAddAuthenticationStateObservers:(BOOL)a3;
- (void)setEncryptedValuesJSON:(id)a3;
- (void)setFailedToSyncCount:(int64_t)a3;
- (void)setHasMissingKeychainItem:(BOOL)a3;
- (void)setInCloud:(BOOL)a3;
- (void)setLastUpdateChangeCountReason:(id)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setMergingRecord:(BOOL)a3;
- (void)setMergingUnappliedEncryptedRecord:(BOOL)a3;
- (void)setNeedsInitialFetchFromCloud:(BOOL)a3;
- (void)setNeedsToBeFetchedFromCloud:(BOOL)a3;
- (void)setNeedsToLoadDecryptedValues:(BOOL)a3;
- (void)setNotesVersion:(id)a3 forReplicaID:(id)a4;
- (void)setNumberOfPushAttemptsToWaitCount:(int64_t)a3;
- (void)setPersistedActivityEventsStorage:(id)a3;
- (void)setPrimaryEncryptedData:(id)a3;
- (void)setPrimitiveValue:(id)a3 forEncryptableKey:(id)a4;
- (void)setServerRecord:(id)a3;
- (void)setServerShare:(id)a3;
- (void)setUnappliedEncryptedRecord:(id)a3;
- (void)setUserSpecificServerRecord:(id)a3;
- (void)setValue:(id)a3 forEncryptableKey:(id)a4;
- (void)setVersion:(int64_t)a3 forOperation:(id)a4;
- (void)setWasRecentlyDeletedByThisDevice:(BOOL)a3;
- (void)shouldBeDeletedFromLocalDatabase;
- (void)unappliedEncryptedRecord;
- (void)unitTest_injectCryptoStrategy:(id)a3;
- (void)unmarkForDeletion;
- (void)unsafelyClearChangeCountWithReason:(id)a3;
- (void)updateChangeCountWithReason:(id)a3;
- (void)updateChangeCountsForUnsavedParentReferences;
- (void)updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded;
- (void)updateParentReferenceIfNecessary;
- (void)updateUserSpecificChangeCountWithReason:(id)a3;
- (void)userSpecificRecordID;
- (void)willSave;
@end

@implementation ICCloudSyncingObject

- (BOOL)isSharedReadOnly
{
  v2 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 currentUserParticipant];
    BOOL v5 = [v4 permission] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)valueForEncryptableKey:(id)a3
{
  id v4 = a3;
  [(ICCloudSyncingObject *)self willAccessValueForKey:v4];
  BOOL v5 = [(ICCloudSyncingObject *)self primitiveValueForEncryptableKey:v4];
  [(ICCloudSyncingObject *)self didAccessValueForKey:v4];

  return v5;
}

- (NSString)zoneOwnerName
{
  [(ICCloudSyncingObject *)self willAccessValueForKey:@"zoneOwnerName"];
  v3 = [(ICCloudSyncingObject *)self primitiveZoneOwnerName];
  [(ICCloudSyncingObject *)self didAccessValueForKey:@"zoneOwnerName"];
  if (!v3)
  {
    id v4 = [(ICCloudSyncingObject *)self parentCloudObject];
    BOOL v5 = v4;
    if (v4)
    {
      v3 = [v4 zoneOwnerName];
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSDate)modificationDate
{
  v3 = NSStringFromSelector(sel_modificationDate);
  [(ICCloudSyncingObject *)self willAccessValueForKey:v3];

  objc_opt_class();
  id v4 = NSStringFromSelector(sel_modificationDate);
  BOOL v5 = [(ICCloudSyncingObject *)self primitiveValueForKey:v4];
  v6 = ICDynamicCast();

  v7 = NSStringFromSelector(sel_modificationDate);
  [(ICCloudSyncingObject *)self didAccessValueForKey:v7];

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(ICCloudSyncingObject *)self serverRecord];
    id v8 = [v9 modificationDate];
  }
  return (NSDate *)v8;
}

- (CKShare)serverShareCheckingParent
{
  v2 = self;
  v3 = 0;
  id v4 = v2;
  while (v4)
  {
    uint64_t v5 = [v4 serverShare];

    uint64_t v6 = [v4 parentCloudObject];

    v3 = (void *)v5;
    id v4 = (void *)v6;
    if (v5)
    {
      if ([(ICCloudSyncingObject *)v2 shareMatchesRecord]) {
        break;
      }
    }
  }

  return (CKShare *)v3;
}

- (BOOL)isUnsupported
{
  uint64_t v3 = +[ICCloudSyncingObject currentNotesVersion];
  if (v3 < [(ICCloudSyncingObject *)self minimumSupportedNotesVersion]) {
    return 1;
  }
  uint64_t v5 = [(ICCloudSyncingObject *)self parentCloudObjectForMinimumSupportedVersionPropagation];
  char v6 = [v5 isUnsupported];

  return v6;
}

+ (int64_t)currentNotesVersion
{
  v2 = (void *)ICDebugDecrementedNotesVersion;
  if (!ICDebugDecrementedNotesVersion)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 objectForKey:@"DebugNotesVersionDecrementAmount"];

    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    if (v4)
    {
      objc_opt_class();
      char v6 = ICDynamicCast();
      uint64_t v7 = [v6 integerValue];
      if (v7 >= 0) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = -v7;
      }

      uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v9 = (15 - v8) & ~((15 - v8) >> 63);
    }
    else
    {
      uint64_t v9 = 15;
    }
    uint64_t v10 = [v5 numberWithInteger:v9];
    v11 = (void *)ICDebugDecrementedNotesVersion;
    ICDebugDecrementedNotesVersion = v10;

    v2 = (void *)ICDebugDecrementedNotesVersion;
    if (!ICDebugDecrementedNotesVersion)
    {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((ICDebugDecrementedNotesVersion) != nil)", "+[ICCloudSyncingObject currentNotesVersion]", 1, 0, @"Expected non-nil value for '%s'", "ICDebugDecrementedNotesVersion");
      v2 = (void *)ICDebugDecrementedNotesVersion;
    }
  }
  return (int)[v2 intValue];
}

- (BOOL)isSharedViaICloud
{
  uint64_t v3 = [(ICCloudSyncingObject *)self serverShare];
  id v4 = objc_msgSend(v3, "ic_nonCurrentUserParticipants");
  if ([v4 count])
  {
    BOOL v5 = [(ICCloudSyncingObject *)self shareMatchesRecord];

    if (v5) {
      return 1;
    }
  }
  else
  {
  }
  char v6 = [(ICCloudSyncingObject *)self serverShare];
  if (v6)
  {
  }
  else
  {
    v16 = [(ICCloudSyncingObject *)self serverRecord];
    v17 = [v16 share];

    if (v17) {
      return 1;
    }
  }
  uint64_t v7 = [(ICCloudSyncingObject *)self zoneOwnerName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ICCloudSyncingObject *)self zoneOwnerName];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F19C08]];

    if (!v10) {
      return 1;
    }
  }
  v11 = [(ICCloudSyncingObject *)self serverShare];
  char v12 = objc_msgSend(v11, "ic_isPublicShare");

  if (v12) {
    return 1;
  }
  v13 = [(ICCloudSyncingObject *)self parentCloudObject];
  v14 = v13;
  if (v13) {
    char v15 = [v13 isSharedViaICloud];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (CKShare)serverShare
{
  serverShare = self->_serverShare;
  if (!serverShare)
  {
    id v4 = [(ICCloudSyncingObject *)self serverShareData];
    if (v4)
    {
      BOOL v5 = [(id)objc_opt_class() shareSystemFieldsTransformer];
      char v6 = [v5 reverseTransformedValue:v4];
      uint64_t v7 = self->_serverShare;
      self->_serverShare = v6;
    }
    serverShare = self->_serverShare;
  }
  return serverShare;
}

- (CKRecord)serverRecord
{
  serverRecord = self->_serverRecord;
  if (!serverRecord)
  {
    id v4 = [(ICCloudSyncingObject *)self serverRecordData];
    if (v4)
    {
      BOOL v5 = [(id)objc_opt_class() recordSystemFieldsTransformer];
      char v6 = [v5 reverseTransformedValue:v4];
      uint64_t v7 = self->_serverRecord;
      self->_serverRecord = v6;
    }
    serverRecord = self->_serverRecord;
  }
  return serverRecord;
}

- (id)primitiveValueForEncryptableKey:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self isPasswordProtected]) {
    [(ICCloudSyncingObject *)self decryptedValueForKey:v4];
  }
  else {
  BOOL v5 = [(ICCloudSyncingObject *)self primitiveValueForKey:v4];
  }

  return v5;
}

- (BOOL)isVisible
{
  if (([(ICCloudSyncingObject *)self markedForDeletion] & 1) != 0
    || ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return ![(ICCloudSyncingObject *)self isDeprecated];
  }
}

- (void)awakeFromFetch
{
  v11.receiver = self;
  v11.super_class = (Class)ICCloudSyncingObject;
  [(ICCloudSyncingObject *)&v11 awakeFromFetch];
  uint64_t v3 = [(ICCloudSyncingObject *)self cloudState];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1C0A8];
    BOOL v5 = (objc_class *)objc_opt_class();
    char v6 = NSStringFromClass(v5);
    uint64_t v7 = [(ICCloudSyncingObject *)self managedObjectContext];
    uint64_t v8 = [v4 insertNewObjectForEntityForName:v6 inManagedObjectContext:v7];

    uint64_t v9 = NSStringFromSelector(sel_cloudState);
    [(ICCloudSyncingObject *)self setPrimitiveValue:v8 forKey:v9];

    int v10 = NSStringFromSelector(sel_cloudSyncingObject);
    [v8 setPrimitiveValue:self forKey:v10];
  }
  [(ICCloudSyncingObject *)self setNeedsToLoadDecryptedValues:1];
  [(ICCloudSyncingObject *)self addAuthenticationStateObserversIfNeeded];
}

- (ICCloudSyncingObject)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICCloudSyncingObject;
  id v4 = [(ICCloudSyncingObject *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_needsToLoadDecryptedValues = 1;
    [(ICCloudSyncingObject *)v4 addAuthenticationStateObserversIfNeeded];
  }
  return v5;
}

- (void)addAuthenticationStateObserversIfNeeded
{
  if (![(ICCloudSyncingObject *)self didAddAuthenticationStateObservers])
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v4 = +[ICAuthenticationState sharedState];
    [v3 addObserver:self selector:sel_authenticationStateWillDeauthenticate_ name:@"ICAuthenticationStateWillDeauthenticateNotification" object:v4];

    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v6 = +[ICAuthenticationState sharedState];
    [v5 addObserver:self selector:sel_authenticationStateDidDeauthenticate_ name:@"ICAuthenticationStateDidDeauthenticateNotification" object:v6];

    [(ICCloudSyncingObject *)self setDidAddAuthenticationStateObservers:1];
  }
}

- (BOOL)didAddAuthenticationStateObservers
{
  return self->_didAddAuthenticationStateObservers;
}

- (void)setDidAddAuthenticationStateObservers:(BOOL)a3
{
  self->_didAddAuthenticationStateObservers = a3;
}

- (void)setNeedsToLoadDecryptedValues:(BOOL)a3
{
  self->_needsToLoadDecryptedValues = a3;
}

- (id)parentCloudObject
{
  return 0;
}

- (BOOL)trustsTimestampsFromReplicaID:(id)a3
{
  uint64_t v3 = [(ICCloudSyncingObject *)self notesVersionForReplicaID:a3];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 integerValue] > 5;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)notesVersionForReplicaID:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend((id)objc_opt_class(), "currentNotesVersion"));
  }
  else
  {
    uint64_t v8 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
    objc_super v7 = [v8 objectForKeyedSubscript:v4];
  }
  return v7;
}

- (ICMergeableDictionary)replicaIDToNotesVersion
{
  if ([(id)objc_opt_class() supportsNotesVersionTracking])
  {
    replicaIDToNotesVersion = self->_replicaIDToNotesVersion;
    if (replicaIDToNotesVersion)
    {
      id v4 = replicaIDToNotesVersion;
      BOOL v5 = self->_replicaIDToNotesVersion;
      self->_replicaIDToNotesVersion = v4;
    }
    else
    {
      uint64_t v8 = [ICMergeableDictionary alloc];
      BOOL v5 = [(ICCloudSyncingObject *)self replicaIDToNotesVersionData];
      uint64_t v9 = [(ICCloudSyncingObject *)self currentReplicaID];
      int v10 = [(ICMergeableDictionary *)v8 initWithData:v5 replicaID:v9];
      objc_super v11 = self->_replicaIDToNotesVersion;
      self->_replicaIDToNotesVersion = v10;
    }
    objc_super v7 = self->_replicaIDToNotesVersion;
  }
  else
  {
    int v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
    }

    objc_super v7 = 0;
  }
  return v7;
}

- (NSUUID)currentReplicaID
{
  currentReplicaID = self->_currentReplicaID;
  if (currentReplicaID)
  {
    uint64_t v3 = currentReplicaID;
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F28B50] mainBundle];
    int v6 = [v5 bundleIdentifier];
    objc_super v7 = ICTestHostBundleIdentifier();
    int v8 = [v6 isEqual:v7];

    uint64_t v9 = [(ICCloudSyncingObject *)self cloudAccount];
    if (v8)
    {
      int v10 = ICNotesAppBundleIdentifier();
      objc_super v11 = [v9 replicaIDForBundleIdentifier:v10];
      char v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        v13 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v3 = v13;
    }
    else
    {
      int v10 = [MEMORY[0x1E4F28B50] mainBundle];
      char v12 = [v10 bundleIdentifier];
      v14 = [v9 replicaIDForBundleIdentifier:v12];
      char v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        v16 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v3 = v16;
    }
  }
  return v3;
}

- (BOOL)mergeUnappliedEncryptedRecordRecursively
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = [(ICCloudSyncingObject *)self mergeUnappliedEncryptedRecord];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ICCloudSyncingObject *)self allChildCloudObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 &= [*(id *)(*((void *)&v10 + 1) + 8 * i) mergeUnappliedEncryptedRecordRecursively];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)allChildCloudObjects
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(ICCloudSyncingObject *)self childCloudObjects];
  uint64_t v5 = [v3 setWithArray:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(ICCloudSyncingObject *)self childCloudObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) allChildCloudObjects];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = [v5 allObjects];

  return (NSArray *)v12;
}

- (NSArray)childCloudObjects
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)mergeUnappliedEncryptedRecord
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self isMergingUnappliedEncryptedRecord]) {
    return 1;
  }
  int v3 = [(ICCloudSyncingObject *)self unappliedEncryptedRecord];

  if (!v3) {
    return 1;
  }
  if ([(ICCloudSyncingObject *)self isAuthenticated])
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      int v15 = 138412290;
      long long v16 = v5;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Merging unapplied encrypted record… {object: %@}", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v6 = [(ICCloudSyncingObject *)self unappliedEncryptedRecord];
    if (v6)
    {
      [(ICCloudSyncingObject *)self setMergingRecord:1];
      [(ICCloudSyncingObject *)self setMergingUnappliedEncryptedRecord:1];
      uint64_t v7 = [(ICCloudSyncingObject *)self cloudAccount];
      uint64_t v8 = [v7 identifier];
      [(ICCloudSyncingObject *)self mergeCloudKitRecord:v6 accountID:v8 approach:0];

      [(ICCloudSyncingObject *)self setMergingUnappliedEncryptedRecord:0];
      [(ICCloudSyncingObject *)self setMergingRecord:0];
      uint64_t v9 = [(ICCloudSyncingObject *)self unappliedEncryptedRecord];

      long long v10 = os_log_create("com.apple.notes", "Crypto");
      long long v11 = v10;
      if (!v9)
      {
        BOOL v12 = 1;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          long long v14 = [(ICCloudSyncingObject *)self shortLoggingDescription];
          int v15 = 138412290;
          long long v16 = v14;
          _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, "Merged unapplied encrypted record {object: %@}", (uint8_t *)&v15, 0xCu);
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObject mergeUnappliedEncryptedRecord](self);
      }
    }
    else
    {
      long long v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObject mergeUnappliedEncryptedRecord](self);
      }
    }
    BOOL v12 = 0;
LABEL_16:

    return v12;
  }
  return 0;
}

- (CKRecord)unappliedEncryptedRecord
{
  p_unappliedEncryptedRecord = &self->_unappliedEncryptedRecord;
  unappliedEncryptedRecord = self->_unappliedEncryptedRecord;
  if (unappliedEncryptedRecord)
  {
    id v4 = unappliedEncryptedRecord;
  }
  else
  {
    uint64_t v6 = [(ICCloudSyncingObject *)self unappliedEncryptedRecordData];
    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(ICCloudSyncingObject *)self unappliedEncryptedRecord];
      }

      id v12 = 0;
      uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
      id v9 = v12;
      if (v9)
      {
        long long v10 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ICCloudSyncingObject unappliedEncryptedRecord]();
        }

        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject unappliedEncryptedRecord]" simulateCrash:1 showAlert:1 format:@"Error unarchiving unapplied encrypted record data"];
        id v4 = 0;
      }
      else
      {
        objc_storeStrong((id *)p_unappliedEncryptedRecord, v8);
        id v4 = v8;
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isMergingUnappliedEncryptedRecord
{
  return self->mergingUnappliedEncryptedRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantHandlesToParticipants, 0);
  objc_storeStrong((id *)&self->_replicaIDToNotesVersion, 0);
  objc_storeStrong((id *)&self->_currentReplicaID, 0);
  objc_storeStrong(&self->_checklistItemToActivityEventsStorage, 0);
  objc_storeStrong(&self->_persistedActivityEventsStorage, 0);
  objc_storeStrong((id *)&self->_activityEventsDocument, 0);
  objc_storeStrong((id *)&self->_unappliedEncryptedRecord, 0);
  objc_storeStrong((id *)&self->_lastUpdateChangeCountReason, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_userSpecificServerRecord, 0);
  objc_storeStrong((id *)&self->_serverShare, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_cryptoStrategyForMergingEncryptedData, 0);
  objc_storeStrong((id *)&self->_cryptoStrategy, 0);
  objc_storeStrong((id *)&self->_decryptedValues, 0);
}

- (void)didTurnIntoFault
{
  v12.receiver = self;
  v12.super_class = (Class)ICCloudSyncingObject;
  [(ICCloudSyncingObject *)&v12 didTurnIntoFault];
  serverRecord = self->_serverRecord;
  self->_serverRecord = 0;

  serverShare = self->_serverShare;
  self->_serverShare = 0;

  userSpecificServerRecord = self->_userSpecificServerRecord;
  self->_userSpecificServerRecord = 0;

  unappliedEncryptedRecord = self->_unappliedEncryptedRecord;
  self->_unappliedEncryptedRecord = 0;

  replicaIDToNotesVersion = self->_replicaIDToNotesVersion;
  self->_replicaIDToNotesVersion = 0;

  activityEventsDocument = self->_activityEventsDocument;
  self->_activityEventsDocument = 0;

  id persistedActivityEventsStorage = self->_persistedActivityEventsStorage;
  self->_id persistedActivityEventsStorage = 0;

  id checklistItemToActivityEventsStorage = self->_checklistItemToActivityEventsStorage;
  self->_id checklistItemToActivityEventsStorage = 0;

  participantHandlesToParticipants = self->_participantHandlesToParticipants;
  self->_participantHandlesToParticipants = 0;
}

- (BOOL)hasInvitees
{
  v2 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
  BOOL v3 = objc_msgSend(v2, "ic_nonOwnerInvitedParticipantsCount") != 0;

  return v3;
}

- (BOOL)isPubliclySharedOrHasInvitees
{
  if ([(ICCloudSyncingObject *)self isPubliclyShared]) {
    return 1;
  }
  return [(ICCloudSyncingObject *)self hasInvitees];
}

- (BOOL)isPubliclyShared
{
  v2 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
  char v3 = objc_msgSend(v2, "ic_isPublicShare");

  return v3;
}

- (BOOL)isPasswordProtectedAndLocked
{
  int v3 = [(ICCloudSyncingObject *)self isPasswordProtected];
  if (v3) {
    LOBYTE(v3) = ![(ICCloudSyncingObject *)self isAuthenticated];
  }
  return v3;
}

void __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectID];
  id v5 = +[ICCloudSyncingObject ic_existingObjectWithID:v2 context:*(void *)(a1 + 40)];

  [v5 mergeUnappliedEncryptedRecordRecursively];
  int v3 = *(void **)(a1 + 40);
  id v4 = [v5 shortLoggingDescription];
  objc_msgSend(v3, "ic_saveWithLogDescription:", @"Merged unapplied encrypted records {object: %@}", v4);
}

- (id)shortLoggingDescription
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(ICCloudSyncingObject *)self recordName];
  uint64_t v6 = [(ICCloudSyncingObject *)self objectID];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %@[%@]>", v4, v5, v6];

  return v7;
}

- (BOOL)hasContextOptions:(unint64_t)a3
{
  id v5 = [(ICCloudSyncingObject *)self appContext];
  if (v5) {
    [(ICCloudSyncingObject *)self appContext];
  }
  else {
  uint64_t v6 = +[ICNoteContext sharedContext];
  }
  char v7 = [v6 hasContextOptions:a3];

  return v7;
}

+ (id)predicateForVisibleObjects
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [a1 predicateForUnmarkedForDeletionObjects];
  id v5 = objc_msgSend(a1, "predicateForFetchedFromCloudObjects", v4);
  v12[1] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  char v7 = [a1 predicateForDeprecatedObjects];
  uint64_t v8 = [v6 notPredicateWithSubpredicate:v7];
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  long long v10 = [v3 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicateForUnmarkedForDeletionObjects
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"markedForDeletion == NO"];
}

+ (id)predicateForFetchedFromCloudObjects
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"needsInitialFetchFromCloud == NO"];
}

+ (id)predicateForDeprecatedObjects
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (BOOL)canAuthenticate
{
  v2 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v3 = [v2 canAuthenticate];

  return v3;
}

- (BOOL)isAuthenticated
{
  v2 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (ICCloudSyncingObjectCryptoStrategy)cryptoStrategy
{
  char v3 = [(ICCloudSyncingObject *)self cryptoStrategyForMergingEncryptedData];

  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject cryptoStrategy]();
    }

    id v5 = [(ICCloudSyncingObject *)self cryptoStrategyForMergingEncryptedData];
    goto LABEL_5;
  }
  BOOL v7 = [(ICCloudSyncingObject *)self canHaveCryptoStrategy];
  p_cryptoStrategy = &self->_cryptoStrategy;
  cryptoStrategy = self->_cryptoStrategy;
  if (v7)
  {
    if (cryptoStrategy)
    {
      id v5 = cryptoStrategy;
LABEL_5:
      uint64_t v6 = v5;
      goto LABEL_14;
    }
    uint64_t v6 = [(ICCloudSyncingObject *)self validatedCreateCryptoStrategy];
    if (![(ICCloudSyncingObject *)self cryptoStrategyIsTransient]) {
      objc_storeStrong((id *)&self->_cryptoStrategy, v6);
    }
  }
  else
  {
    if (cryptoStrategy)
    {
      long long v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject cryptoStrategy]();
      }

      [(ICCloudSyncingObjectCryptoStrategy *)*p_cryptoStrategy invalidateStrategy];
      long long v11 = *p_cryptoStrategy;
      *p_cryptoStrategy = 0;
    }
    uint64_t v6 = 0;
  }
LABEL_14:
  return (ICCloudSyncingObjectCryptoStrategy *)v6;
}

- (ICCloudSyncingObjectCryptoStrategy)cryptoStrategyForMergingEncryptedData
{
  return self->_cryptoStrategyForMergingEncryptedData;
}

- (BOOL)canHaveCryptoStrategy
{
  int v3 = [(ICCloudSyncingObject *)self isPasswordProtected];
  if (v3)
  {
    if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(ICCloudSyncingObject *)self isUnsupported];
    }
  }
  return v3;
}

- (id)workerManagedObjectContext
{
  v2 = [(ICCloudSyncingObject *)self appContext];
  int v3 = [v2 makeBackgroundContext];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = +[ICNoteContext sharedContext];
    id v5 = [v6 workerManagedObjectContext];
  }
  return v5;
}

void __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workerManagedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke_2;
  v4[3] = &unk_1E64A4218;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  [v3 performBlockAndWait:v4];
}

- (id)viewContext
{
  v2 = [(ICCloudSyncingObject *)self appContext];
  id v3 = [v2 viewContext];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = +[ICNoteContext sharedContext];
    id v5 = [v6 managedObjectContext];
  }
  return v5;
}

- (id)deviceManagementRestrictionsManager
{
  v2 = [(ICCloudSyncingObject *)self appContext];
  id v3 = [v2 deviceManagementRestrictionsManager];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[ICDeviceManagementRestrictionsManager sharedManager];
  }
  uint64_t v6 = v5;

  return v6;
}

- (ICAppContext)appContext
{
  return self->_appContext;
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"serverShare", @"zoneOwnerName", @"serverRecord", 0);
}

+ (id)keyPathsForValuesAffectingZoneOwnerName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"parentCloudObject", 0);
}

- (void)mergeUnappliedEncryptedRecordRecursivelyInBackground
{
  id v3 = [(id)objc_opt_class() mergeUnappliedEncryptedRecordsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)mergeUnappliedEncryptedRecordsQueue
{
  if (mergeUnappliedEncryptedRecordsQueue_onceToken != -1) {
    dispatch_once(&mergeUnappliedEncryptedRecordsQueue_onceToken, &__block_literal_global_467);
  }
  v2 = (void *)mergeUnappliedEncryptedRecordsQueue_mergeUnappliedEncryptedRecordsQueue;
  return v2;
}

void __59__ICCloudSyncingObject_mergeUnappliedEncryptedRecordsQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.merge-unapplied-encrypted-records-queue", v2);
  v1 = (void *)mergeUnappliedEncryptedRecordsQueue_mergeUnappliedEncryptedRecordsQueue;
  mergeUnappliedEncryptedRecordsQueue_mergeUnappliedEncryptedRecordsQueue = (uint64_t)v0;
}

- (void)awakeFromInsert
{
  v9.receiver = self;
  v9.super_class = (Class)ICCloudSyncingObject;
  [(ICCloudSyncingObject *)&v9 awakeFromInsert];
  id v3 = (void *)MEMORY[0x1E4F1C0A8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ICCloudSyncingObject *)self managedObjectContext];
  BOOL v7 = [v3 insertNewObjectForEntityForName:v5 inManagedObjectContext:v6];

  uint64_t v8 = NSStringFromSelector(sel_cloudState);
  [(ICCloudSyncingObject *)self setPrimitiveValue:v7 forKey:v8];

  [(ICCloudSyncingObject *)self setNeedsToLoadDecryptedValues:1];
  [(ICCloudSyncingObject *)self addAuthenticationStateObserversIfNeeded];
}

- (void)willSave
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "%@ - willSave - changedValues = [%@]", v4, v5, v6, v7, v8);
}

- (BOOL)validateIdentifier:(id *)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*a3)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      long long v10 = self;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Trying to save an object with a nil identifier: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    *a3 = [v7 UUIDString];
  }
  return 1;
}

+ (id)keyPathsForValuesAffectingCloudAccount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"parentCloudObject.cloudAccount"];
}

- (id)cloudAccount
{
  uint64_t v3 = [(ICCloudSyncingObject *)self parentCloudObject];
  uint64_t v4 = [v3 cloudAccount];

  if (!v4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ICCloudSyncingObject *)self cloudAccount];
    }
  }
  return v4;
}

- (void)assignToPersistentStore:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject assignToPersistentStore:](self);
    }

    goto LABEL_7;
  }
  uint64_t v5 = [(ICCloudSyncingObject *)self managedObjectContext];
  [v5 assignObject:self toPersistentStore:v4];

  uint64_t v6 = [(ICCloudSyncingObject *)self cloudState];

  if (v6)
  {
    uint64_t v7 = [(ICCloudSyncingObject *)self managedObjectContext];
    uint8_t v8 = [(ICCloudSyncingObject *)self cloudState];
    [v7 assignObject:v8 toPersistentStore:v4];

LABEL_7:
  }
}

- (void)setNeedsToBeFetchedFromCloud:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self primitiveValueForKey:@"needsToBeFetchedFromCloud"];
  int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v3) {
      [(ICCloudSyncingObject *)self clearServerRecords];
    }
    [(ICCloudSyncingObject *)self willChangeValueForKey:@"needsToBeFetchedFromCloud"];
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(ICCloudSyncingObject *)self setPrimitiveValue:v7 forKey:@"needsToBeFetchedFromCloud"];

    [(ICCloudSyncingObject *)self didChangeValueForKey:@"needsToBeFetchedFromCloud"];
  }
}

- (void)updateChangeCountWithReason:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ICCloudSyncingObject updateChangeCountWithReason:]();
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([(ICCloudSyncingObject *)self isMergingRecord])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ICCloudSyncingObject updateChangeCountWithReason:]();
    }
    goto LABEL_11;
  }
  int v6 = [(ICCloudSyncingObject *)self cloudState];

  if (!v6)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject updateChangeCountWithReason:]();
    }
    goto LABEL_11;
  }
  [(ICCloudSyncingObject *)self unsafelyUpdateChangeCountWithReason:v4];
LABEL_12:
}

- (void)clearChangeCountWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self cloudState];

  if (v5)
  {
    [(ICCloudSyncingObject *)self unsafelyClearChangeCountWithReason:v4];
  }
  else
  {
    int v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject clearChangeCountWithReason:]();
    }
  }
}

- (void)unsafelyClearChangeCountWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self cloudState];
  [v5 setCurrentLocalVersion:0];

  int v6 = [(ICCloudSyncingObject *)self cloudState];
  [v6 setLatestVersionSyncedToCloud:0];

  uint64_t v7 = [(ICCloudSyncingObject *)self cloudState];
  [v7 setLocalVersionDate:0];

  uint8_t v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObject unsafelyClearChangeCountWithReason:]();
  }
}

- (void)updateUserSpecificChangeCountWithReason:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() supportsUserSpecificRecords] & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:]();
    }
    goto LABEL_10;
  }
  if (![(ICCloudSyncingObject *)self wantsUserSpecificRecord])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:]();
    }
    goto LABEL_10;
  }
  if (([(ICCloudSyncingObject *)self needsToSaveUserSpecificRecord] & 1) == 0)
  {
    [(ICCloudSyncingObject *)self setNeedsToSaveUserSpecificRecord:1];
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:]();
    }
LABEL_10:
  }
}

- (void)clearServerRecords
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Clearing server records… {object: %@}", v4, v5, v6, v7, v8);
}

+ (ICCloudSyncingObject)objectWithRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a4;
  int v9 = [a1 objectsWithRecordID:a3 context:a5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudSyncingObject_objectWithRecordID_accountID_context___block_invoke;
  v13[3] = &unk_1E64A6430;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = objc_msgSend(v9, "ic_objectPassingTest:", v13);

  return (ICCloudSyncingObject *)v11;
}

uint64_t __61__ICCloudSyncingObject_objectWithRecordID_accountID_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 cloudAccount];
  uint64_t v4 = v3;
  if (v3 && *(void *)(a1 + 32))
  {
    uint64_t v5 = [v3 identifier];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)objectsWithRecordID:(id)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 recordName];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", v7];
    int v9 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v6);
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (id)failureCountQueue
{
  if (failureCountQueue_onceToken != -1) {
    dispatch_once(&failureCountQueue_onceToken, &__block_literal_global_26);
  }
  uint64_t v2 = (void *)failureCountQueue_failureCountQueue;
  return v2;
}

void __41__ICCloudSyncingObject_failureCountQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.cloud.failure-counts", v2);
  v1 = (void *)failureCountQueue_failureCountQueue;
  failureCountQueue_failureCountQueue = (uint64_t)v0;
}

+ (id)failedToSyncCountsByIdentifier
{
  if (failedToSyncCountsByIdentifier_onceToken != -1) {
    dispatch_once(&failedToSyncCountsByIdentifier_onceToken, &__block_literal_global_128);
  }
  uint64_t v2 = (void *)failedToSyncCountsByIdentifier_failedToSyncCountsByIdentifier;
  return v2;
}

void __54__ICCloudSyncingObject_failedToSyncCountsByIdentifier__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)failedToSyncCountsByIdentifier_failedToSyncCountsByIdentifier;
  failedToSyncCountsByIdentifier_failedToSyncCountsByIdentifier = v0;
}

- (int64_t)failedToSyncCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__ICCloudSyncingObject_failedToSyncCount__block_invoke;
  v6[3] = &unk_1E64A44A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __41__ICCloudSyncingObject_failedToSyncCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() failedToSyncCountsByIdentifier];
    int64_t v4 = [v3 objectForKey:v2];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 integerValue];
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Trying to get failed to sync count without identifier", v6, 2u);
    }
  }
}

- (void)setFailedToSyncCount:(int64_t)a3
{
  uint64_t v5 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ICCloudSyncingObject_setFailedToSyncCount___block_invoke;
  v6[3] = &unk_1E64A6458;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

void __45__ICCloudSyncingObject_setFailedToSyncCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int64_t v4 = [(id)objc_opt_class() failedToSyncCountsByIdentifier];
    os_log_t v5 = v4;
    if (v3)
    {
      id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
      [v5 setObject:v6 forKey:v2];
    }
    else
    {
      [v4 removeObjectForKey:v2];
    }
  }
  else
  {
    os_log_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Trying to set failed to sync count without identifier", v7, 2u);
    }
  }
}

+ (id)numberOfPushAttemptsToWaitByIdentifier
{
  if (numberOfPushAttemptsToWaitByIdentifier_onceToken != -1) {
    dispatch_once(&numberOfPushAttemptsToWaitByIdentifier_onceToken, &__block_literal_global_131);
  }
  uint64_t v2 = (void *)numberOfPushAttemptsToWaitByIdentifier_numberOfPushAttemptsToWaitByIdentifier;
  return v2;
}

void __62__ICCloudSyncingObject_numberOfPushAttemptsToWaitByIdentifier__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)numberOfPushAttemptsToWaitByIdentifier_numberOfPushAttemptsToWaitByIdentifier;
  numberOfPushAttemptsToWaitByIdentifier_numberOfPushAttemptsToWaitByIdentifier = v0;
}

- (int64_t)numberOfPushAttemptsToWaitCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ICCloudSyncingObject_numberOfPushAttemptsToWaitCount__block_invoke;
  v6[3] = &unk_1E64A44A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __55__ICCloudSyncingObject_numberOfPushAttemptsToWaitCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() numberOfPushAttemptsToWaitByIdentifier];
    int64_t v4 = [v3 objectForKey:v2];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 integerValue];
  }
  else
  {
    os_log_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Trying to get number of push attempts to wait without identifier", v6, 2u);
    }
  }
}

- (void)setNumberOfPushAttemptsToWaitCount:(int64_t)a3
{
  os_log_t v5 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ICCloudSyncingObject_setNumberOfPushAttemptsToWaitCount___block_invoke;
  v6[3] = &unk_1E64A6458;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

void __59__ICCloudSyncingObject_setNumberOfPushAttemptsToWaitCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int64_t v4 = [(id)objc_opt_class() numberOfPushAttemptsToWaitByIdentifier];
    os_log_t v5 = v4;
    if (v3)
    {
      id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
      [v5 setObject:v6 forKey:v2];
    }
    else
    {
      [v4 removeObjectForKey:v2];
    }
  }
  else
  {
    os_log_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Trying to set number of push attempts to wait without identifier", v7, 2u);
    }
  }
}

- (void)incrementFailureCounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(ICCloudSyncingObject *)self numberOfPushAttemptsToWaitCount]) {
    [(ICCloudSyncingObject *)self setNumberOfPushAttemptsToWaitCount:3];
  }
  [(ICCloudSyncingObject *)self setFailedToSyncCount:[(ICCloudSyncingObject *)self failedToSyncCount] + 1];
  uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(ICCloudSyncingObject *)self className];
    int v5 = [(ICCloudSyncingObject *)self failedToSyncCount];
    int v6 = [(ICCloudSyncingObject *)self failedToSyncCount];
    uint64_t v7 = [(ICCloudSyncingObject *)self loggingDescription];
    int v8 = 138413570;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 1024;
    int v13 = 3;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    int v17 = 6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed. Incrementing failedToSyncCount, failure (%d/%d) before being temporarily ignored. (%d/%d) before deleting change tokens and full re-sync. %@", (uint8_t *)&v8, 0x2Eu);
  }
  if ([(ICCloudSyncingObject *)self failedToSyncCount] >= 6)
  {
    [(ICCloudSyncingObject *)self clearServerRecords];
    [(ICCloudSyncingObject *)self deleteChangeTokensAndReSync];
  }
}

- (void)decrementFailureCounts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self numberOfPushAttemptsToWaitCount] >= 1) {
    [(ICCloudSyncingObject *)self setNumberOfPushAttemptsToWaitCount:[(ICCloudSyncingObject *)self numberOfPushAttemptsToWaitCount] - 1];
  }
  uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(ICCloudSyncingObject *)self className];
    int v5 = [(ICCloudSyncingObject *)self numberOfPushAttemptsToWaitCount];
    int v6 = [(ICCloudSyncingObject *)self loggingDescription];
    int v7 = 138412802;
    int v8 = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Decrementing failure counts for %@, %d push attempts before it is retried. %@", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)deleteChangeTokensAndReSync
{
  OUTLINED_FUNCTION_4();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [v3 className];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_2() failedToSyncCount];
  int64_t v4 = [(id)OUTLINED_FUNCTION_5() loggingDescription];
  int v5 = 138412802;
  int v6 = v1;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 2112;
  int v10 = v4;
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Failed to sync %@ %d times. Now resetting failure counts, deleting change tokens, and trying full re-sync. %@", (uint8_t *)&v5, 0x1Cu);
}

void __51__ICCloudSyncingObject_deleteChangeTokensAndReSync__block_invoke(uint64_t a1)
{
  int v2 = [(id)objc_opt_class() numberOfPushAttemptsToWaitByIdentifier];
  [v2 removeAllObjects];

  id v3 = [(id)objc_opt_class() failedToSyncCountsByIdentifier];
  [v3 removeAllObjects];

  int64_t v4 = [*(id *)(a1 + 32) cloudContext];
  [v4 deleteAllServerChangeTokens];

  [MEMORY[0x1E4F837E8] postBasicEvent:2];
  id v5 = [*(id *)(a1 + 32) cloudContext];
  [v5 syncWithReason:@"DeletedChangeTokensDueToFailures" completionHandler:0];
}

- (void)resetFailureCounts
{
  [(ICCloudSyncingObject *)self setFailedToSyncCount:0];
  [(ICCloudSyncingObject *)self setNumberOfPushAttemptsToWaitCount:0];
}

- (BOOL)shouldBeIgnoredForSync
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self failedToSyncCount] < 3
    || [(ICCloudSyncingObject *)self numberOfPushAttemptsToWaitCount] < 1)
  {
    return 0;
  }
  id v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(ICCloudSyncingObject *)self className];
    int v5 = [(ICCloudSyncingObject *)self failedToSyncCount];
    int v6 = [(ICCloudSyncingObject *)self numberOfPushAttemptsToWaitCount];
    __int16 v7 = [(ICCloudSyncingObject *)self loggingDescription];
    int v9 = 138413314;
    int v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    int v14 = 3;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed %d times. Max number of retries is %d. It will now be ignored for %d push attempts. %@", (uint8_t *)&v9, 0x28u);
  }
  return 1;
}

- (NSString)recordZoneName
{
  return (NSString *)@"Notes";
}

- (NSString)recordType
{
  return (NSString *)&stru_1F1F2FFF8;
}

- (CKRecordID)recordID
{
  id v3 = [(ICCloudSyncingObject *)self managedObjectContext];

  if (v3)
  {
    int64_t v4 = [(ICCloudSyncingObject *)self recordName];
    if ([v4 length])
    {
      os_log_t v5 = [(ICCloudSyncingObject *)self recordZoneName];
      if ([v5 length])
      {
        uint64_t v6 = [(ICCloudSyncingObject *)self zoneOwnerName];
        __int16 v7 = (void *)v6;
        int v8 = (void *)*MEMORY[0x1E4F19C08];
        if (v6) {
          int v8 = (void *)v6;
        }
        id v9 = v8;

        int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v5 ownerName:v9];
        __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v4 zoneID:v10];

        goto LABEL_17;
      }
      int v12 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject recordID](self);
      }
    }
    else
    {
      os_log_t v5 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject recordID](self);
      }
    }
    __int16 v11 = 0;
    goto LABEL_17;
  }
  os_log_t v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObject recordID](self);
  }
  __int16 v11 = 0;
  int64_t v4 = v5;
LABEL_17:

  return (CKRecordID *)v11;
}

- (int64_t)databaseScope
{
  int v2 = [(ICCloudSyncingObject *)self recordID];
  int64_t v3 = [v2 databaseScope];

  return v3;
}

- (BOOL)needsToBeDeletedFromCloud
{
  if ([(ICCloudSyncingObject *)self supportsDeletionByTTL]
    || ![(ICCloudSyncingObject *)self isInCloud])
  {
    return 0;
  }
  return [(ICCloudSyncingObject *)self markedForDeletion];
}

- (BOOL)isInICloudAccount
{
  return 0;
}

- (BOOL)isValidObject
{
  int v2 = self;
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int64_t v3 = [(ICCloudSyncingObject *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ICCloudSyncingObject_isValidObject__block_invoke;
  v5[3] = &unk_1E64A4528;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __37__ICCloudSyncingObject_isValidObject__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newObjectWithIdentifier:(id)a3 context:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__22;
  v24 = __Block_byref_object_dispose__22;
  id v25 = [a1 entity];
  if (!v21[5])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__ICCloudSyncingObject_newObjectWithIdentifier_context___block_invoke;
    v19[3] = &unk_1E64A44D8;
    v19[4] = &v20;
    v19[5] = a1;
    [v7 performBlockAndWait:v19];
  }
  uint64_t v8 = [v7 persistentStoreCoordinator];
  char v9 = [v8 managedObjectModel];
  int v10 = [v9 entitiesByName];
  __int16 v11 = [v21[5] name];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (v12 && v12 != v21[5])
  {
    __int16 v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[ICCloudSyncingObject newObjectWithIdentifier:context:]();
    }

    objc_storeStrong(v21 + 5, v12);
  }
  id v14 = objc_alloc((Class)objc_opt_class());
  __int16 v15 = (void *)[v14 initWithEntity:v21[5] insertIntoManagedObjectContext:v7];
  [v15 setIdentifier:v6];
  int v16 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __int16 v17 = [v15 shortLoggingDescription];
    +[ICCloudSyncingObject newObjectWithIdentifier:context:](v17, buf, v16);
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __56__ICCloudSyncingObject_newObjectWithIdentifier_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) entity];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = (void *)[a1 newObjectWithIdentifier:a3 context:v8];
  [v10 setNeedsInitialFetchFromCloud:1];
  [v10 setInCloud:1];
  __int16 v11 = +[ICAccount accountWithIdentifier:v9 context:v8];

  id v12 = [v11 persistentStore];
  [v10 assignToPersistentStore:v12];

  return v10;
}

+ (id)cloudObjectWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (objc_msgSend(v6, "ic_trimmedString"),
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    int v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", v6];
    __int16 v11 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v10, v7);
    id v12 = [v11 lastObject];
  }
  else
  {
    __int16 v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ICCloudSyncingObject cloudObjectWithIdentifier:context:](v13);
    }

    id v12 = 0;
  }

  return v12;
}

+ (id)allCloudObjectIDsInContext:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__22;
  v21 = __Block_byref_object_dispose__22;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  __int16 v13 = __63__ICCloudSyncingObject_allCloudObjectIDsInContext_passingTest___block_invoke;
  id v14 = &unk_1E64A6480;
  id v8 = v7;
  id v15 = v8;
  int v16 = &v17;
  [a1 enumerateAllCloudObjectsInContext:v6 batchSize:20 saveAfterBatch:0 usingBlock:&v11];
  uint64_t v9 = objc_msgSend((id)v18[5], "copy", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __63__ICCloudSyncingObject_allCloudObjectIDsInContext_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  if (!v6 || (v7 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3), id v5 = v10, v7))
  {
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = [v5 objectID];
    [v8 addObject:v9];

    id v5 = v10;
  }
}

+ (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
}

+ (void)enumerateAllCloudObjectsInContext:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 batchSize:(unint64_t)a7 saveAfterBatch:(BOOL)a8 usingBlock:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __155__ICCloudSyncingObject_enumerateAllCloudObjectsInContext_predicate_sortDescriptors_relationshipKeyPathsForPrefetching_batchSize_saveAfterBatch_usingBlock___block_invoke;
  v26 = &unk_1E64A64A8;
  id v27 = v16;
  id v17 = v16;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = _Block_copy(&aBlock);
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v20, v19, v18, v21, a7, v9, v22, aBlock, v24, v25, v26);
}

void __155__ICCloudSyncingObject_enumerateAllCloudObjectsInContext_predicate_sortDescriptors_relationshipKeyPathsForPrefetching_batchSize_saveAfterBatch_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ([v6 isInICloudAccount])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v6, a3);
    }
  }
}

- (id)newlyCreatedRecord
{
  return [(ICCloudSyncingObject *)self makeCloudKitRecordForApproach:0 mergeableFieldState:0];
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3
{
  return [(ICCloudSyncingObject *)self makeCloudKitRecordForApproach:a3 mergeableFieldState:0];
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    int v7 = [(ICCloudSyncingObject *)self serverRecord];
    uint64_t v8 = objc_msgSend(v7, "ic_copyWithUserFields:", 0);
  }
  else
  {
    if (a3) {
      goto LABEL_11;
    }
    int v7 = [(ICCloudSyncingObject *)self serverRecord];
    uint64_t v8 = [v7 copy];
  }
  BOOL v9 = (void *)v8;

  if (v9)
  {
    uint64_t v10 = [(ICCloudSyncingObject *)self recordName];
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [v9 recordID];
    __int16 v13 = [v12 recordName];
    id v14 = [(ICCloudSyncingObject *)self recordName];
    char v15 = objc_msgSend(v13, "ic_isCaseInsensitiveEqualToString:", v14);

    if (v15) {
      goto LABEL_17;
    }
    id v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:]();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:]" simulateCrash:1 showAlert:1 format:@"Object has server record with mismatched record name"];
  }
LABEL_11:
  id v17 = [(ICCloudSyncingObject *)self recordID];
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    id v19 = [(ICCloudSyncingObject *)self recordType];
    BOOL v9 = (void *)[v18 initWithRecordType:v19 recordID:v17];
  }
  else
  {
    id v19 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](self);
    }

    BOOL v9 = 0;
  }

LABEL_17:
  id v20 = [(ICCloudSyncingObject *)self parentCloudObject];
  id v21 = [v20 recordID];
  id v22 = v21;
  if (v21)
  {
    v23 = [v21 zoneID];
    uint64_t v24 = [v9 recordID];
    id v25 = [v24 zoneID];
    int v26 = [v23 isEqual:v25];

    if (v26)
    {
      [v9 setParent:0];
      id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v22 action:0];
      [v9 setParent:v27];
    }
  }
  else if (objc_msgSend(v9, "ic_isOwnedByCurrentUser"))
  {
    [v9 setParent:0];
  }
  if ([(ICCloudSyncingObject *)self shouldSyncMinimumSupportedNotesVersion])
  {
    v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion"));
    [v9 setObject:v28 forKeyedSubscript:@"MinimumSupportedNotesVersion"];
  }
  if (!a3)
  {
    if ([(id)objc_opt_class() supportsActivityEvents]
      && (![(ICCloudSyncingObject *)self isPasswordProtected]
       || ![(ICCloudSyncingObject *)self needsToLoadDecryptedValues]))
    {
      v29 = [(ICCloudSyncingObject *)self activityEventsData];

      if (v29)
      {
        v30 = [(ICCloudSyncingObject *)self activityEventsData];
        objc_msgSend(v9, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v30, @"ActivityEventsData", 0);
      }
    }
    if ([(id)objc_opt_class() supportsNotesVersionTracking])
    {
      v31 = [(ICCloudSyncingObject *)self replicaIDToNotesVersionData];

      if (v31)
      {
        v32 = [(ICCloudSyncingObject *)self replicaIDToNotesVersionData];
        objc_msgSend(v9, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v32, @"ReplicaIDToNotesVersionData", 0);
      }
    }
    if ([(ICCloudSyncingObject *)self supportsDeletionByTTL]
      && ([(ICCloudSyncingObject *)self isOwnedByCurrentUser]
       || ![(ICCloudSyncingObject *)self isSharedRootObject]))
    {
      v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"));
      [v9 setObject:v33 forKeyedSubscript:@"Deleted"];
    }
    if (([(ICCloudSyncingObject *)self isPasswordProtected] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v34 = [(ICCloudSyncingObject *)self cryptoSalt];
      [v9 setObject:v34 forKeyedSubscript:@"CryptoSalt"];

      v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[ICCloudSyncingObject cryptoIterationCount](self, "cryptoIterationCount"));
      [v9 setObject:v35 forKeyedSubscript:@"CryptoIterationCount"];

      v36 = [(ICCloudSyncingObject *)self cryptoInitializationVector];
      [v9 setObject:v36 forKeyedSubscript:@"CryptoInitializationVector"];

      v37 = [(ICCloudSyncingObject *)self cryptoTag];
      [v9 setObject:v37 forKeyedSubscript:@"CryptoTag"];

      v38 = [(ICCloudSyncingObject *)self cryptoWrappedKey];
      [v9 setObject:v38 forKeyedSubscript:@"CryptoWrappedKey"];

      v39 = [(ICCloudSyncingObject *)self passwordHint];
      v40 = [v39 dataUsingEncoding:4];
      v41 = [v9 encryptedValues];
      [v41 setObject:v40 forKeyedSubscript:@"PasswordHint"];
    }
    if ([(ICCloudSyncingObject *)self supportsEncryptedValuesDictionary]
      && ([(ICCloudSyncingObject *)self encryptedValuesJSON],
          v42 = objc_claimAutoreleasedReturnValue(),
          v42,
          v42))
    {
      v43 = [(ICCloudSyncingObject *)self encryptedValuesJSON];
      objc_msgSend(v9, "ic_setInlineableDataAsset:forKeyPrefix:approach:", v43, @"EncryptedValues", 0);
    }
    else
    {
      v44 = [(ICCloudSyncingObject *)self encryptedValuesJSON];

      if (v44)
      {
        v45 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](self);
        }

        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:]" simulateCrash:1 showAlert:1 format:@"Encrypted values being ignored for sync"];
      }
    }
  }

  return v9;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5
{
  return [(ICCloudSyncingObject *)self mergeCloudKitRecord:a3 accountID:a4 approach:a5 mergeableFieldState:0];
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v8 = a3;
  BOOL v9 = [v8 recordID];
  uint64_t v10 = [(ICCloudSyncingObject *)self recordID];
  char v11 = objc_msgSend(v9, "ic_hasEqualRecordNameWithRecordID:", v10);

  uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
  __int16 v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:]();
    }

    id v14 = [v8 objectForKeyedSubscript:@"MinimumSupportedNotesVersion"];

    if (v14)
    {
      char v15 = [v8 objectForKeyedSubscript:@"MinimumSupportedNotesVersion"];
      -[ICCloudSyncingObject setMinimumSupportedNotesVersion:](self, "setMinimumSupportedNotesVersion:", [v15 unsignedIntegerValue]);
    }
    if (!a5)
    {
      id v16 = [v8 objectForKeyedSubscript:@"Deleted"];

      if (v16)
      {
        id v17 = [v8 objectForKeyedSubscript:@"Deleted"];
        uint64_t v18 = [v17 BOOLValue];

        if (v18 != [(ICCloudSyncingObject *)self markedForDeletion])
        {
          id v19 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](self);
          }

          [(ICCloudSyncingObject *)self setMarkedForDeletion:v18];
        }
      }
      [(ICCloudSyncingObject *)self mergeCryptoFieldsFromRecord:v8];
      id v20 = objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"ActivityEventsData");
      if (v20)
      {
        id v21 = [ICTTOrderedSetVersionedDocument alloc];
        id v22 = [(ICCloudSyncingObject *)self currentReplicaID];
        v23 = [(ICTTVersionedDocument *)v21 initWithData:v20 replicaID:v22];
        [(ICCloudSyncingObject *)self mergeActivityEventsDocument:v23];
      }
      uint64_t v24 = objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"ReplicaIDToNotesVersionData");
      if (v24)
      {
        id v25 = [ICMergeableDictionary alloc];
        int v26 = [(ICCloudSyncingObject *)self currentReplicaID];
        id v27 = [(ICMergeableDictionary *)v25 initWithData:v24 replicaID:v26];

        [(ICCloudSyncingObject *)self mergeReplicaIDToNotesVersion:v27];
      }
      if ([(ICCloudSyncingObject *)self isPasswordProtected]
        && ![(ICCloudSyncingObject *)self mergeEncryptedDataFromRecord:v8])
      {
        v28 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](self);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.4();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:]" simulateCrash:1 showAlert:1 format:@"Record mismatch when merging remote record"];
    [MEMORY[0x1E4F837E8] postBasicEvent:9];
  }

  return v11;
}

- (void)setUnappliedEncryptedRecord:(id)a3
{
  id v5 = a3;
  id v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObject setUnappliedEncryptedRecord:]();
  }

  if (!v5)
  {
    int v7 = 0;
    goto LABEL_10;
  }
  if ([(ICCloudSyncingObject *)self isPasswordProtected])
  {
    [(ICCloudSyncingObject *)self inlineAssetsForRecord:v5];
    id v11 = 0;
    int v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v11];
    id v8 = v11;
    if (v8)
    {
      BOOL v9 = v8;
      uint64_t v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObject setUnappliedEncryptedRecord:]();
      }

      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject setUnappliedEncryptedRecord:]" simulateCrash:1 showAlert:1 format:@"Error archiving unapplied encrypted record"];
      goto LABEL_14;
    }
LABEL_10:
    objc_storeStrong((id *)&self->_unappliedEncryptedRecord, a3);
    [(ICCloudSyncingObject *)self setUnappliedEncryptedRecordData:v7];
    goto LABEL_14;
  }
  int v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ICCloudSyncingObject setUnappliedEncryptedRecord:](self);
  }

LABEL_14:
}

- (void)inlineAssetsForRecord:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self supportsEncryptedValuesDictionary]) {
    objc_msgSend(v4, "ic_inlineDataAssetForKeyPrefix:", @"EncryptedValues");
  }
}

- (void)mergeCryptoFieldsFromRecord:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObject mergeCryptoFieldsFromRecord:]();
  }

  id v6 = [v4 objectForKeyedSubscript:@"CryptoSalt"];

  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"CryptoSalt"];
    [(ICCloudSyncingObject *)self setCryptoSalt:v7];
  }
  id v8 = [v4 objectForKeyedSubscript:@"CryptoIterationCount"];

  if (v8)
  {
    BOOL v9 = [v4 objectForKeyedSubscript:@"CryptoIterationCount"];
    -[ICCloudSyncingObject setCryptoIterationCount:](self, "setCryptoIterationCount:", [v9 unsignedIntegerValue]);
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"CryptoWrappedKey"];

  if (v10)
  {
    id v11 = [v4 objectForKeyedSubscript:@"CryptoWrappedKey"];
    [(ICCloudSyncingObject *)self setCryptoWrappedKey:v11];
  }
  uint64_t v12 = [v4 encryptedValues];
  __int16 v13 = [v12 objectForKeyedSubscript:@"PasswordHint"];
  id v14 = objc_msgSend(v13, "ic_stringValue");
  [(ICCloudSyncingObject *)self setPasswordHint:v14];

  char v15 = [(ICCloudSyncingObject *)self cryptoSalt];

  if (v15) {
    [(ICCloudSyncingObject *)self setIsPasswordProtected:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICCloudSyncingObject *)self mergeCryptoTagAndInitializationVectorFromRecord:v4];
  }
}

- (void)mergeCryptoTagAndInitializationVectorFromRecord:(id)a3
{
  id v8 = a3;
  id v4 = [v8 objectForKeyedSubscript:@"CryptoInitializationVector"];

  if (v4)
  {
    id v5 = [v8 objectForKeyedSubscript:@"CryptoInitializationVector"];
    [(ICCloudSyncingObject *)self setCryptoInitializationVector:v5];
  }
  id v6 = [v8 objectForKeyedSubscript:@"CryptoTag"];

  if (v6)
  {
    int v7 = [v8 objectForKeyedSubscript:@"CryptoTag"];
    [(ICCloudSyncingObject *)self setCryptoTag:v7];
  }
}

- (BOOL)needsToBePushedToCloud
{
  if (([(ICCloudSyncingObject *)self needsToBeFetchedFromCloud] & 1) != 0
    || [(ICCloudSyncingObject *)self needsInitialFetchFromCloud])
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject needsToBePushedToCloud](self);
    }
LABEL_5:

    return 0;
  }
  if ([(ICCloudSyncingObject *)self hasSuccessfullyPushedLatestVersionToCloud])
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject needsToBePushedToCloud](self);
    }
    goto LABEL_5;
  }
  id v5 = [(ICCloudSyncingObject *)self cloudState];
  int64_t v6 = -[ICCloudSyncingObject isPushingSameOrLaterThanVersion:](self, "isPushingSameOrLaterThanVersion:", [v5 currentLocalVersion]);

  if (v6)
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.8(self);
    }
    goto LABEL_5;
  }
  if ([(ICCloudSyncingObject *)self markedForDeletion]
    && ![(ICCloudSyncingObject *)self isInCloud])
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.7(self);
    }
    goto LABEL_5;
  }
  int v7 = [(ICCloudSyncingObject *)self parentCloudObject];
  if ([v7 markedForDeletion])
  {
    id v8 = [(ICCloudSyncingObject *)self parentCloudObject];
    char v9 = [v8 isInCloud];

    if ((v9 & 1) == 0)
    {
      uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject needsToBePushedToCloud].cold.6();
      }
      goto LABEL_5;
    }
  }
  else
  {
  }
  uint64_t v10 = [(ICCloudSyncingObject *)self parentCloudObject];
  if ([v10 needsInitialFetchFromCloud])
  {
    id v11 = [(ICCloudSyncingObject *)self parentCloudObject];
    char v12 = [v11 isInCloud];

    if ((v12 & 1) == 0)
    {
      uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject needsToBePushedToCloud].cold.5();
      }
      goto LABEL_5;
    }
  }
  else
  {
  }
  if ([(ICCloudSyncingObject *)self isSharedReadOnly])
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject needsToBePushedToCloud](self);
    }
    goto LABEL_5;
  }
  if ([(ICCloudSyncingObject *)self isPasswordProtected])
  {
    __int16 v13 = [(ICCloudSyncingObject *)self unappliedEncryptedRecord];
    if (v13 || [(ICCloudSyncingObject *)self isMergingUnappliedEncryptedRecord])
    {
      char v14 = [(ICCloudSyncingObject *)self markedForDeletion];

      if ((v14 & 1) == 0)
      {
        uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudSyncingObject needsToBePushedToCloud].cold.4(self);
        }
        goto LABEL_5;
      }
    }
  }
  return 1;
}

+ (id)keyPathsForValuesAffectingNeedsToBePushedToCloud
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"needsToBeFetchedFromCloud", @"needsInitialFetchFromCloud", 0);
}

- (BOOL)hasSuccessfullyPushedLatestVersionToCloud
{
  uint64_t v3 = [(ICCloudSyncingObject *)self cloudState];
  uint64_t v4 = [v3 latestVersionSyncedToCloud];
  id v5 = [(ICCloudSyncingObject *)self cloudState];
  LOBYTE(v4) = v4 >= [v5 currentLocalVersion];

  return v4;
}

- (BOOL)needsToFetchAfterServerRecordChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        char v10 = [(id)objc_opt_class() needsToReFetchServerRecordValue:v9];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)needsToReFetchServerRecordValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 fileURL];
    BOOL v6 = v5 == 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            if (objc_msgSend(a1, "needsToReFetchServerRecordValue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
            {

              BOOL v6 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (void)objectWasDeletedFromCloud
{
  [(ICCloudSyncingObject *)self setInCloud:0];
  [(ICCloudSyncingObject *)self resetFailureCounts];
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Marking %@ for deletion after being deleted from cloud by another device", v4, v5, v6, v7, v8);
}

- (void)objectWillBePushedToCloudWithOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudSyncingObject *)self cloudState];
  -[ICCloudSyncingObject setVersion:forOperation:](self, "setVersion:forOperation:", [v5 currentLocalVersion], v4);
}

- (BOOL)objectFailedToBePushedToCloudWithOperation:(id)a3 recordID:(id)a4 error:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(ICCloudSyncingObject *)self cloudContext];
  char v12 = [v8 database];
  long long v13 = [v11 accountIDForDatabase:v12];

  uint64_t v14 = [v10 code];
  BOOL v15 = 1;
  if (v14 <= 19)
  {
    if ((unint64_t)(v14 - 6) < 2) {
      goto LABEL_35;
    }
    if (v14 == 11)
    {
      v29 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v39 = objc_msgSend(v9, "ic_loggingDescription");
        v40 = objc_msgSend(v8, "ic_loggingDescription");
        int v46 = 138413058;
        v47 = v13;
        __int16 v48 = 2112;
        v49 = v39;
        __int16 v50 = 2112;
        v51 = v40;
        __int16 v52 = 2112;
        id v53 = v10;
        _os_log_debug_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_DEBUG, "Invalid cached server record in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);
      }
      [(ICCloudSyncingObject *)self setServerRecord:0];
    }
    else
    {
      if (v14 == 14)
      {
        id v17 = [v10 userInfo];
        uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

        if (v18)
        {
          id v19 = [v18 recordID];
          id v20 = [(ICCloudSyncingObject *)self recordID];
          int v21 = objc_msgSend(v19, "ic_hasEqualRecordNameWithRecordID:", v20);

          if (!v21)
          {
            v31 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v44 = objc_msgSend(v18, "ic_loggingDescription");
              v45 = objc_msgSend(v8, "ic_loggingDescription");
              int v46 = 138413058;
              v47 = v13;
              __int16 v48 = 2112;
              v49 = v44;
              __int16 v50 = 2112;
              v51 = v45;
              __int16 v52 = 2112;
              id v53 = v10;
              _os_log_error_impl(&dword_1C3A61000, v31, OS_LOG_TYPE_ERROR, "Non-matching server record changed in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);
            }
            [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
            [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject objectFailedToBePushedToCloudWithOperation:recordID:error:]" simulateCrash:1 showAlert:1 format:@"Record mismatch when merging oplock result"];
            [MEMORY[0x1E4F837E8] postBasicEvent:8];
            BOOL v15 = 0;
            goto LABEL_34;
          }
          BOOL v22 = [(ICCloudSyncingObject *)self needsToFetchAfterServerRecordChanged:v18];
          v23 = os_log_create("com.apple.notes", "Cloud");
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (!v22)
          {
            if (v24)
            {
              v32 = objc_msgSend(v18, "ic_loggingDescription");
              v33 = objc_msgSend(v8, "ic_loggingDescription");
              int v46 = 138413058;
              v47 = v13;
              __int16 v48 = 2112;
              v49 = v32;
              __int16 v50 = 2112;
              v51 = v33;
              __int16 v52 = 2112;
              id v53 = v10;
              _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_INFO, "Server record changed in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);
            }
            [(ICCloudSyncingObject *)self objectWasFetchedFromCloudWithRecord:v18 accountID:v13];
            BOOL v15 = 1;
            goto LABEL_34;
          }
          if (v24)
          {
            id v25 = objc_msgSend(v18, "ic_loggingDescription");
            int v26 = objc_msgSend(v8, "ic_loggingDescription");
            int v46 = 138413058;
            v47 = v13;
            __int16 v48 = 2112;
            v49 = v25;
            __int16 v50 = 2112;
            v51 = v26;
            __int16 v52 = 2112;
            id v53 = v10;
            id v27 = "Server record changed (needs refetch) in account ID %@: %@ %@: %@";
LABEL_26:
            _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v46, 0x2Au);
          }
        }
        else
        {
          v23 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            id v25 = [(ICCloudSyncingObject *)self shortLoggingDescription];
            int v26 = objc_msgSend(v8, "ic_loggingDescription");
            int v46 = 138413058;
            v47 = v13;
            __int16 v48 = 2112;
            v49 = v25;
            __int16 v50 = 2112;
            v51 = v26;
            __int16 v52 = 2112;
            id v53 = v10;
            id v27 = "Server record changed with no server record in the error in account ID %@: %@ %@: %@";
            goto LABEL_26;
          }
        }

        BOOL v15 = 1;
        [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
LABEL_34:

        goto LABEL_35;
      }
LABEL_20:
      v30 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v41 = objc_msgSend(v9, "ic_loggingDescription");
        v42 = objc_msgSend(v8, "ic_loggingDescription");
        v43 = [v10 userInfo];
        int v46 = 138413314;
        v47 = v13;
        __int16 v48 = 2112;
        v49 = v41;
        __int16 v50 = 2112;
        v51 = v42;
        __int16 v52 = 2112;
        id v53 = v10;
        __int16 v54 = 2112;
        v55 = v43;
        _os_log_error_impl(&dword_1C3A61000, v30, OS_LOG_TYPE_ERROR, "Error pushing in account ID %@: %@ %@: %@\nuserInfo: %@", (uint8_t *)&v46, 0x34u);
      }
    }
LABEL_23:
    BOOL v15 = 1;
    goto LABEL_35;
  }
  switch(v14)
  {
    case 20:
    case 22:
    case 26:
      break;
    case 30:
      long long v16 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v35 = objc_msgSend(v9, "ic_loggingDescription");
        v36 = objc_msgSend(v8, "ic_loggingDescription");
        int v46 = 138412802;
        v47 = v13;
        __int16 v48 = 2112;
        v49 = v35;
        __int16 v50 = 2112;
        v51 = v36;
        _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Already Shared error in account ID %@: for %@ %@", (uint8_t *)&v46, 0x20u);
      }
      [(ICCloudSyncingObject *)self setServerShare:0];
      BOOL v15 = 1;
      [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
      break;
    case 31:
      v28 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v37 = objc_msgSend(v9, "ic_loggingDescription");
        v38 = objc_msgSend(v8, "ic_loggingDescription");
        int v46 = 138413058;
        v47 = v13;
        __int16 v48 = 2112;
        v49 = v37;
        __int16 v50 = 2112;
        v51 = v38;
        __int16 v52 = 2112;
        id v53 = v10;
        _os_log_error_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_ERROR, "Reference violation for server record in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);
      }
      [(ICCloudSyncingObject *)self fixBrokenReferences];
      goto LABEL_23;
    default:
      goto LABEL_20;
  }
LABEL_35:
  [(id)objc_opt_class() deleteTemporaryAssetFilesForOperation:v8];

  return v15;
}

- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(ICCloudSyncingObject *)self versionForOperation:v7];
  id v9 = [(ICCloudSyncingObject *)self cloudState];
  uint64_t v10 = [v9 latestVersionSyncedToCloud];

  if (v8 > v10)
  {
    BOOL v11 = [(ICCloudSyncingObject *)self cloudState];
    [v11 setLatestVersionSyncedToCloud:v8];
  }
  [(id)objc_opt_class() deleteTemporaryAssetFilesForOperation:v7];

  [(ICCloudSyncingObject *)self resetFailureCounts];
  [(ICCloudSyncingObject *)self setInCloud:1];
  uint64_t v12 = [(ICCloudSyncingObject *)self serverRecord];
  if (!v12) {
    goto LABEL_8;
  }
  long long v13 = (void *)v12;
  uint64_t v14 = [(ICCloudSyncingObject *)self serverRecord];
  BOOL v15 = [v14 modificationDate];
  long long v16 = [v6 modificationDate];
  char v17 = objc_msgSend(v15, "ic_isLaterThanDate:", v16);

  if (v17)
  {
    uint64_t v18 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v6 recordID];
      id v20 = [v19 recordName];
      int v21 = 138412290;
      BOOL v22 = v20;
      _os_log_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_DEFAULT, "Tried to cache a record that is older than or equal to our current version: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
LABEL_8:
    [(ICCloudSyncingObject *)self setServerRecord:v6];
  }
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4
{
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    goto LABEL_6;
  }
  uint64_t v10 = [(ICCloudSyncingObject *)self serverRecord];
  BOOL v11 = [v10 recordChangeTag];
  uint64_t v12 = [v8 recordChangeTag];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
LABEL_6:
    [(ICCloudSyncingObject *)self setMergingRecord:1];
    [(ICCloudSyncingObject *)self mergeCloudKitRecord:v8 accountID:v9 approach:0];
    [(ICCloudSyncingObject *)self setMergingRecord:0];
    uint64_t v15 = [(ICCloudSyncingObject *)self serverRecord];
    if (!v15) {
      goto LABEL_11;
    }
    long long v16 = (void *)v15;
    char v17 = [(ICCloudSyncingObject *)self serverRecord];
    uint64_t v18 = [v17 modificationDate];
    id v19 = [v8 modificationDate];
    char v20 = objc_msgSend(v18, "ic_isLaterThanDate:", v19);

    if (v20)
    {
      int v21 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](v8);
      }
    }
    else
    {
LABEL_11:
      [(ICCloudSyncingObject *)self setServerRecord:v8];
    }
    BOOL v22 = [v8 share];
    if (v22)
    {
    }
    else
    {
      uint64_t v23 = [(ICCloudSyncingObject *)self serverShare];

      if (v23)
      {
        BOOL v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](self);
        }

        [(ICCloudSyncingObject *)self setServerShare:0];
      }
    }
    [(ICCloudSyncingObject *)self setNeedsInitialFetchFromCloud:0];
    [(ICCloudSyncingObject *)self setInCloud:1];
    if (![(ICCloudSyncingObject *)self supportsDeletionByTTL]) {
      [(ICCloudSyncingObject *)self setMarkedForDeletion:0];
    }
    [(ICCloudSyncingObject *)self updateParentReferenceIfNecessary];
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](v8);
    }
  }
  [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:0];
}

- (void)objectWasFetchedButDoesNotExistInCloud
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICCloudSyncingObject *)self recordID];
  int v4 = objc_msgSend(v3, "ic_isOwnedByCurrentUser");

  if (v4)
  {
    [(ICCloudSyncingObject *)self setServerRecord:0];
    [(ICCloudSyncingObject *)self setNeedsInitialFetchFromCloud:0];
    [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:0];
    [(ICCloudSyncingObject *)self setInCloud:0];
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Deleting shared %@ because it no longer exists in cloud", (uint8_t *)&v7, 0xCu);
    }
    [(ICCloudSyncingObject *)self deleteFromLocalDatabase];
  }
}

+ (BOOL)supportsActivityEvents
{
  return 0;
}

- (NSData)activityEventsData
{
  return (NSData *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"activityEventsData"];
}

- (void)setActivityEventsData:(id)a3
{
  id persistedActivityEventsStorage = self->_persistedActivityEventsStorage;
  self->_id persistedActivityEventsStorage = 0;
  id v6 = a3;

  id checklistItemToActivityEventsStorage = self->_checklistItemToActivityEventsStorage;
  self->_id checklistItemToActivityEventsStorage = 0;

  [(ICCloudSyncingObject *)self setValue:v6 forEncryptableKey:@"activityEventsData"];
}

- (ICTTOrderedSetVersionedDocument)activityEventsDocument
{
  if ([(id)objc_opt_class() supportsActivityEvents])
  {
    activityEventsDocument = self->_activityEventsDocument;
    if (!activityEventsDocument)
    {
      int v4 = [ICTTOrderedSetVersionedDocument alloc];
      id v5 = [(ICCloudSyncingObject *)self activityEventsData];
      id v6 = [(ICCloudSyncingObject *)self currentReplicaID];
      int v7 = [(ICTTVersionedDocument *)v4 initWithData:v5 replicaID:v6];
      id v8 = self->_activityEventsDocument;
      self->_activityEventsDocument = v7;

      id persistedActivityEventsStorage = self->_persistedActivityEventsStorage;
      self->_id persistedActivityEventsStorage = 0;

      id checklistItemToActivityEventsStorage = self->_checklistItemToActivityEventsStorage;
      self->_id checklistItemToActivityEventsStorage = 0;

      activityEventsDocument = self->_activityEventsDocument;
    }
    BOOL v11 = activityEventsDocument;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject activityEventsDocument](self);
    }

    BOOL v11 = 0;
  }
  return v11;
}

- (unint64_t)mergeActivityEventsDocument:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() supportsActivityEvents])
  {
    id v5 = [(ICCloudSyncingObject *)self activityEventsDocument];
    unint64_t v6 = [v5 mergeWithOrderedSetVersionedDocument:v4];

    if (v6 == 2)
    {
      int v7 = [(ICCloudSyncingObject *)self activityEventsDocument];
      id v8 = [v7 serialize];
      [(ICCloudSyncingObject *)self setActivityEventsData:v8];

      unint64_t v6 = 2;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (int64_t)intrinsicNotesVersion
{
  return [(ICCloudSyncingObject *)self intrinsicNotesVersionForScenario:0];
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  if ([(ICCloudSyncingObject *)self isUnsupported]
    || [(ICCloudSyncingObject *)self needsInitialFetchFromCloudCheckingParent])
  {
    return [(ICCloudSyncingObject *)self minimumSupportedNotesVersion];
  }
  else if (a3 == 1 || ![(ICCloudSyncingObject *)self isPasswordProtected])
  {
    return 0;
  }
  else
  {
    unint64_t v6 = [(ICCloudSyncingObject *)self cryptoStrategy];
    int64_t v7 = [v6 intrinsicNotesVersion];

    return v7;
  }
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 0;
}

- (void)resetToIntrinsicNotesVersionAndPropagateToChildObjects
{
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:(int64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self isUnsupported])
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:]();
    }
LABEL_7:
    unint64_t v6 = v5;
    goto LABEL_8;
  }
  if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud])
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:](self);
    }
    goto LABEL_7;
  }
  int64_t v7 = [(ICCloudSyncingObject *)self parentCloudObjectForMinimumSupportedVersionPropagation];
  unint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = [v7 minimumSupportedNotesVersion];
  }
  else {
    uint64_t v8 = 0;
  }
  int64_t v9 = [(ICCloudSyncingObject *)self intrinsicNotesVersion];
  if (v8 <= v9) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = v8;
  }
  if (v10 <= a3) {
    int64_t v11 = a3;
  }
  else {
    int64_t v11 = v10;
  }
  if ([(ICCloudSyncingObject *)self minimumSupportedNotesVersion] != v11)
  {
    uint64_t v12 = [(ICCloudSyncingObject *)self minimumSupportedNotesVersion];
    char v13 = os_log_create("com.apple.notes", "Cloud");
    uint64_t v14 = v13;
    if (v12 <= v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:]();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(ICCloudSyncingObject *)self minimumSupportedNotesVersion];
      long long v16 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      *(_DWORD *)buf = 134218498;
      int64_t v34 = v15;
      __int16 v35 = 2048;
      int64_t v36 = v11;
      __int16 v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEFAULT, "Downgrading minimumSupportedNotesVersion from %lld to %lld for object: %@", buf, 0x20u);
    }
    [(ICCloudSyncingObject *)self setMinimumSupportedNotesVersion:v11];
    [(ICCloudSyncingObject *)self updateChangeCountWithReason:@"Updated minimum version"];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = [(ICCloudSyncingObject *)self childCloudObjectsForMinimumSupportedVersionPropagation];
  uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int v26 = v6;
    uint64_t v19 = *(void *)v29;
    char v20 = obj;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v20);
        }
        BOOL v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v23 = (void *)MEMORY[0x1C877DB80]();
        BOOL v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          id v25 = [v22 shortLoggingDescription];
          *(_DWORD *)buf = 134218242;
          int64_t v34 = a3;
          __int16 v35 = 2112;
          int64_t v36 = (int64_t)v25;
          _os_log_debug_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_DEBUG, "Propagating minimumSupportedNotesVersion %lld to child object: %@", buf, 0x16u);

          char v20 = obj;
        }

        [v22 requireMinimumSupportedVersionAndPropagateToChildObjects:a3];
      }
      uint64_t v18 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
    id v5 = v20;
    unint64_t v6 = v26;
  }
  else
  {
    id v5 = obj;
  }
LABEL_8:
}

- (BOOL)allowsExporting
{
  return 0;
}

- (BOOL)allowsImporting
{
  return 0;
}

+ (NSArray)bundleIdentifiersWithReplicaID
{
  if (bundleIdentifiersWithReplicaID_onceToken != -1) {
    dispatch_once(&bundleIdentifiersWithReplicaID_onceToken, &__block_literal_global_192);
  }
  uint64_t v2 = (void *)bundleIdentifiersWithReplicaID_bundleIdentifiersWithReplicaID;
  return (NSArray *)v2;
}

void __54__ICCloudSyncingObject_bundleIdentifiersWithReplicaID__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = ICNotesAppBundleIdentifier();
  v5[0] = v0;
  v1 = ICIntentsExtensionBundleIdentifier();
  v5[1] = v1;
  uint64_t v2 = ICSharingExtensionBundleIdentifier();
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  id v4 = (void *)bundleIdentifiersWithReplicaID_bundleIdentifiersWithReplicaID;
  bundleIdentifiersWithReplicaID_bundleIdentifiersWithReplicaID = v3;
}

- (NSSet)deviceReplicaIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v3, "ic_addNonNilObject:", self->_currentReplicaID);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(), "bundleIdentifiersWithReplicaID", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int64_t v10 = [(ICCloudSyncingObject *)self cloudAccount];
        int64_t v11 = [v10 replicaIDForBundleIdentifier:v9];
        objc_msgSend(v3, "ic_addNonNilObject:", v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[v3 copy];
  return (NSSet *)v12;
}

- (void)setCurrentReplicaID:(id)a3
{
}

+ (BOOL)supportsNotesVersionTracking
{
  return 0;
}

- (void)setNotesVersion:(id)a3 forReplicaID:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v20) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = v20;
  }
  unint64_t v11 = v10;
  if (v9 == v8) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v8;
  }
  unint64_t v13 = v12;
  if (v11 | v13)
  {
    long long v14 = (void *)v13;
    if (v11) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {

LABEL_15:
      long long v17 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
      [v17 setObject:v20 forKeyedSubscript:v6];

      uint64_t v18 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
      uint64_t v19 = [v18 encodedData];
      [(ICCloudSyncingObject *)self setReplicaIDToNotesVersionData:v19];

      goto LABEL_16;
    }
    char v16 = [(id)v11 isEqual:v13];

    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (unint64_t)mergeReplicaIDToNotesVersion:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(id)objc_opt_class() supportsNotesVersionTracking])
  {
    unint64_t v13 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = [(ICCloudSyncingObject *)self replicaIDToNotesVersionData];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
  uint64_t v8 = [v7 allKeys];
  uint64_t v9 = [(ICCloudSyncingObject *)self deviceReplicaIDs];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
LABEL_4:
    [(ICCloudSyncingObject *)self willChangeValueForKey:@"replicaIDToNotesVersion"];
    unint64_t v11 = [v4 encodedData];
    [(ICCloudSyncingObject *)self setReplicaIDToNotesVersionData:v11];

    replicaIDToNotesVersion = self->_replicaIDToNotesVersion;
    self->_replicaIDToNotesVersion = 0;

    [(ICCloudSyncingObject *)self didChangeValueForKey:@"replicaIDToNotesVersion"];
LABEL_5:
    unint64_t v13 = 2;
    goto LABEL_7;
  }
  BOOL v15 = [v4 replicaID];
  char v16 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
  long long v17 = [v16 replicaID];
  int v18 = [v15 isEqual:v17];

  if (v18)
  {
    uint64_t v19 = [ICMergeableDictionary alloc];
    id v20 = [v4 encodedData];
    int v21 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v22 = [(ICMergeableDictionary *)v19 initWithData:v20 replicaID:v21];

    id v4 = (id)v22;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v4 allKeys];
  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v43)
  {
    char v40 = 0;
    uint64_t v42 = *(void *)v45;
    while (1)
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v45 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v25 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
        uint64_t v26 = [v25 objectForKeyedSubscript:v24];
        if (v26)
        {
          id v27 = (void *)v26;
          [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
          v29 = long long v28 = self;
          long long v30 = [v29 objectForKeyedSubscript:v24];
          long long v31 = v4;
          v32 = [v4 objectForKeyedSubscript:v24];
          char v33 = [v30 isEqual:v32];

          if (v33)
          {
            id v4 = v31;
            self = v28;
            continue;
          }
          int64_t v34 = [(ICCloudSyncingObject *)v28 deviceReplicaIDs];
          int v35 = [v34 containsObject:v24];

          self = v28;
          if (v35)
          {
            id v25 = [(ICCloudSyncingObject *)v28 replicaIDToNotesVersion];
            int64_t v36 = [v25 objectForKeyedSubscript:v24];
            id v4 = v31;
            [v31 setObject:v36 forKeyedSubscript:v24];
          }
          else
          {
            id v4 = v31;
            id v25 = [v31 objectForKeyedSubscript:v24];
            int64_t v36 = [(ICCloudSyncingObject *)v28 replicaIDToNotesVersion];
            [v36 setObject:v25 forKeyedSubscript:v24];
            char v40 = 1;
          }
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (!v43) {
        goto LABEL_27;
      }
    }
  }
  char v40 = 0;
LABEL_27:

  __int16 v37 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
  unint64_t v13 = [v37 mergeWithDictionary:v4];

  if ((v40 & 1) != 0 || v13 == 2)
  {
    v38 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
    uint64_t v39 = [v38 encodedData];
    [(ICCloudSyncingObject *)self setReplicaIDToNotesVersionData:v39];

    goto LABEL_5;
  }
LABEL_7:

  return v13;
}

- (BOOL)updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() supportsNotesVersionTracking])
  {
    if (([(ICCloudSyncingObject *)self isDeleted] & 1) != 0
      || [(ICCloudSyncingObject *)self markedForDeletion])
    {
      uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded](self);
      }
      BOOL v4 = 0;
      uint64_t v5 = v3;
      goto LABEL_15;
    }
    id v6 = [(ICCloudSyncingObject *)self cloudAccount];
    uint64_t v7 = ICNotesAppBundleIdentifier();
    uint64_t v5 = [v6 replicaIDForBundleIdentifier:v7];

    if (v5)
    {
      if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud])
      {
        uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded](self);
        }
      }
      else if ([(ICCloudSyncingObject *)self isPasswordProtected] {
             && ![(ICCloudSyncingObject *)self isAuthenticated])
      }
      {
        uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.5(self);
        }
      }
      else
      {
        if (![(ICCloudSyncingObject *)self isPasswordProtected]
          || ([(ICCloudSyncingObject *)self unappliedEncryptedRecord],
              uint64_t v9 = objc_claimAutoreleasedReturnValue(),
              v9,
              !v9))
        {
          int v10 = [(ICCloudSyncingObject *)self notesVersionForReplicaID:v5];
          uint64_t v11 = [v10 integerValue];

          uint64_t v12 = [(id)objc_opt_class() currentNotesVersion];
          uint64_t v13 = v12;
          if (v11 >= v12)
          {
            if (v11 == v12)
            {
              BOOL v4 = 0;
              goto LABEL_16;
            }
            if (v11 > v12)
            {
              uint64_t v24 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                id v25 = [(ICCloudSyncingObject *)self objectID];
                *(_DWORD *)buf = 138412290;
                v32 = v25;
                _os_log_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_INFO, "Device Notes version is greater than current Notes version {objectID: %@}", buf, 0xCu);
              }
            }
          }
          else
          {
            do
            {
              ++v11;
              long long v14 = [(ICCloudSyncingObject *)self cloudState];
              uint64_t v15 = [v14 currentLocalVersion];

              [(ICCloudSyncingObject *)self willUpdateDeviceReplicaIDsToNotesVersion:v11];
              char v16 = [(ICCloudSyncingObject *)self cloudState];
              uint64_t v17 = [v16 currentLocalVersion];

              if (v17 != v15) {
                [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.cloudState.currentLocalVersion == currentLocalVersion" functionName:"-[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded]" simulateCrash:1 showAlert:0 format:@"Updating the device replica IDs must not update the object's change count"];
              }
            }
            while (v13 != v11);
          }
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v3 = [(ICCloudSyncingObject *)self deviceReplicaIDs];
          uint64_t v18 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v27 != v20) {
                  objc_enumerationMutation(v3);
                }
                uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
                uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:v13];
                [(ICCloudSyncingObject *)self setNotesVersion:v23 forReplicaID:v22];
              }
              uint64_t v19 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
              BOOL v4 = 1;
            }
            while (v19);
          }
          else
          {
            BOOL v4 = 1;
          }
LABEL_15:

LABEL_16:
          return v4;
        }
        uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.4(self);
        }
      }
    }
    else
    {
      uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded](self);
      }
    }

    BOOL v4 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (void)clearReplicaIDsToNotesVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
  BOOL v4 = [v3 allKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(ICCloudSyncingObject *)self ic_loggingDescription];
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Clearing replicaIDToNotesVersion for: %@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v8 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
    [v8 removeAllObjects];

    uint64_t v9 = [(ICCloudSyncingObject *)self replicaIDToNotesVersion];
    int v10 = [v9 encodedData];
    [(ICCloudSyncingObject *)self setReplicaIDToNotesVersionData:v10];
  }
}

+ (BOOL)supportsUserSpecificRecords
{
  return 0;
}

- (BOOL)wantsUserSpecificRecord
{
  return 0;
}

- (NSString)userSpecificRecordType
{
  uint64_t v2 = [(ICCloudSyncingObject *)self recordType];
  uint64_t v3 = +[ICUserSpecificRecordIDParser userSpecificRecordTypeForSharedRecordType:v2];

  return (NSString *)v3;
}

- (CKRecordID)userSpecificRecordID
{
  uint64_t v3 = [(ICCloudSyncingObject *)self managedObjectContext];

  if (v3)
  {
    BOOL v4 = [(ICCloudSyncingObject *)self recordID];
    if (v4)
    {
      uint64_t v5 = [(ICCloudSyncingObject *)self cloudAccount];
      os_log_t v6 = [v5 userRecordName];

      if ([v6 length])
      {
        uint64_t v7 = [(ICCloudSyncingObject *)self zoneOwnerName];
        uint64_t v8 = (void *)v7;
        uint64_t v9 = *MEMORY[0x1E4F19C08];
        if (v7) {
          int v10 = (void *)v7;
        }
        else {
          int v10 = (void *)*MEMORY[0x1E4F19C08];
        }
        int v11 = v10;

        if ([v11 isEqualToString:v9]) {
          os_log_t v12 = v6;
        }
        else {
          os_log_t v12 = v11;
        }
        uint64_t v13 = v12;
        long long v14 = [ICUserSpecificRecordIDParser alloc];
        uint64_t v15 = [(ICCloudSyncingObject *)self recordType];
        char v16 = [(ICUserSpecificRecordIDParser *)v14 initWithSharedRecordType:v15 sharedRecordID:v4 userRecordName:v6 ownerName:v13];

        uint64_t v17 = [(ICUserSpecificRecordIDParser *)v16 recordID];

        goto LABEL_21;
      }
      uint64_t v18 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject userSpecificRecordID](self);
      }
    }
    else
    {
      os_log_t v6 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject userSpecificRecordID](self);
      }
    }
    uint64_t v17 = 0;
  }
  else
  {
    os_log_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject userSpecificRecordID](self);
    }
    uint64_t v17 = 0;
    BOOL v4 = v6;
  }
LABEL_21:

  return (CKRecordID *)v17;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  BOOL v4 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
  uint64_t v5 = (void *)[v4 copy];

  if (!v5)
  {
LABEL_7:
    os_log_t v12 = [(ICCloudSyncingObject *)self userSpecificRecordID];
    if (v12)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1A2D8]);
      char v16 = [(ICCloudSyncingObject *)self userSpecificRecordType];
      uint64_t v17 = [(ICCloudSyncingObject *)self userSpecificRecordID];
      uint64_t v5 = (void *)[v15 initWithRecordType:v16 recordID:v17];
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:]" simulateCrash:1 showAlert:0 format:@"Asking for user specific record but no record ID could be created"];
      uint64_t v5 = 0;
    }
    goto LABEL_10;
  }
  os_log_t v6 = [(ICCloudSyncingObject *)self recordName];

  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = [ICUserSpecificRecordIDParser alloc];
  uint64_t v8 = [v5 recordID];
  uint64_t v9 = [v8 recordName];
  int v10 = [(ICUserSpecificRecordIDParser *)v7 initWithRecordName:v9];
  int v11 = [(ICUserSpecificRecordIDParser *)v10 sharedRecordID];
  os_log_t v12 = [v11 recordName];

  uint64_t v13 = [(ICCloudSyncingObject *)self recordName];
  LOBYTE(v9) = objc_msgSend(v12, "ic_isCaseInsensitiveEqualToString:", v13);

  if ((v9 & 1) == 0)
  {
    long long v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:]();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:]" simulateCrash:1 showAlert:1 format:@"Object has user-specific server record with mismatched record name"];
    goto LABEL_7;
  }
LABEL_10:

LABEL_11:
  if ([(ICCloudSyncingObject *)self supportsDeletionByTTL])
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"));
    [v5 setObject:v18 forKeyedSubscript:@"Deleted"];
  }
  return v5;
}

- (void)didFetchUserSpecificRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    goto LABEL_5;
  }
  int v10 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
  int v11 = [v10 recordChangeTag];
  os_log_t v12 = [v8 recordChangeTag];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
LABEL_5:
    [(ICCloudSyncingObject *)self mergeDataFromUserSpecificRecord:v8 accountID:v9];
    id v15 = [ICUserSpecificRecordIDParser alloc];
    char v16 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
    uint64_t v17 = [v16 recordID];
    uint64_t v18 = [v17 recordName];
    uint64_t v19 = [(ICUserSpecificRecordIDParser *)v15 initWithRecordName:v18];

    if (v19)
    {
      uint64_t v20 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
      int v21 = [v20 modificationDate];
      uint64_t v22 = [v8 modificationDate];
      char v23 = objc_msgSend(v21, "ic_isEarlierThanDate:", v22);

      if ((v23 & 1) == 0)
      {
        long long v14 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:]((uint64_t)v9, v8);
        }
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v24 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:]();
      }
    }
    [(ICCloudSyncingObject *)self setUserSpecificServerRecord:v8];
    goto LABEL_14;
  }
  long long v14 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:]((uint64_t)v9, v8);
  }
LABEL_9:

LABEL_14:
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  return 1;
}

- (void)didSaveUserSpecificRecord:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
  if (!v5) {
    goto LABEL_3;
  }
  os_log_t v6 = (void *)v5;
  uint64_t v7 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
  id v8 = [v7 modificationDate];
  id v9 = [v4 modificationDate];
  int v10 = objc_msgSend(v8, "ic_isEarlierThanDate:", v9);

  if (!v10)
  {
    int v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v12 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
      char v13 = objc_msgSend(v12, "ic_loggingDescription");
      long long v14 = objc_msgSend(v4, "ic_loggingDescription");
      int v15 = 138412546;
      char v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEFAULT, "Tried to cache user-specific record older than or equal to ours: ours=%@ theirs=%@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
LABEL_3:
    [(ICCloudSyncingObject *)self setUserSpecificServerRecord:v4];
  }
  [(ICCloudSyncingObject *)self setNeedsToSaveUserSpecificRecord:0];
}

- (BOOL)didFailToSaveUserSpecificRecordWithID:(id)a3 accountID:(id)a4 error:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v10 code];
  if (v11 > 0x1A) {
    goto LABEL_15;
  }
  if (((1 << v11) & 0x45000C0) == 0)
  {
    if (v11 == 11)
    {
      int v21 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = objc_msgSend(v8, "ic_loggingDescription");
        int v33 = 138412546;
        id v34 = v9;
        __int16 v35 = 2112;
        int64_t v36 = v22;
        _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_INFO, "Invalid cached user-specific server record in account ID %@: %@", (uint8_t *)&v33, 0x16u);
      }
      [(ICCloudSyncingObject *)self setUserSpecificServerRecord:0];
      goto LABEL_3;
    }
    if (v11 == 14)
    {
      long long v14 = [v10 userInfo];
      int v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

      if (v15)
      {
        char v16 = [v15 recordID];
        __int16 v17 = [(ICCloudSyncingObject *)self userSpecificRecordID];
        int v18 = objc_msgSend(v16, "ic_hasEqualRecordNameWithRecordID:", v17);

        if (!v18)
        {
          long long v26 = [(ICCloudSyncingObject *)self userSpecificRecordID];

          long long v27 = os_log_create("com.apple.notes", "Cloud");
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          if (v26)
          {
            if (v28)
            {
              long long v30 = objc_msgSend(v15, "ic_loggingDescription");
              long long v31 = [(ICCloudSyncingObject *)self userSpecificRecordID];
              v32 = [v31 recordName];
              int v33 = 138413058;
              id v34 = v9;
              __int16 v35 = 2112;
              int64_t v36 = v30;
              __int16 v37 = 2112;
              id v38 = v32;
              __int16 v39 = 2112;
              id v40 = v10;
              _os_log_error_impl(&dword_1C3A61000, v27, OS_LOG_TYPE_ERROR, "Non-matching user-specific server record changed in account ID %@; record=%@; expectedRecordName=%@; error=%@",
                (uint8_t *)&v33,
                0x2Au);
            }
            [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject didFailToSaveUserSpecificRecordWithID:accountID:error:]" simulateCrash:1 showAlert:1 format:@"User-specific record mismatch when merging oplock result"];
            [MEMORY[0x1E4F837E8] postBasicEvent:8];
          }
          else
          {
            if (v28) {
              -[ICCloudSyncingObject didFailToSaveUserSpecificRecordWithID:accountID:error:]();
            }

            [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject didFailToSaveUserSpecificRecordWithID:accountID:error:]" simulateCrash:1 showAlert:1 format:@"Missed merge of user-specific record because record ID was missing"];
          }
          BOOL v12 = 0;
          goto LABEL_30;
        }
        uint64_t v19 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = objc_msgSend(v15, "ic_loggingDescription");
          int v33 = 138412546;
          id v34 = v9;
          __int16 v35 = 2112;
          int64_t v36 = v20;
          _os_log_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_INFO, "User-specific server record changed in account ID %@: %@", (uint8_t *)&v33, 0x16u);
        }
        [(ICCloudSyncingObject *)self didFetchUserSpecificRecord:v15 accountID:v9 force:0];
      }
      else
      {
        uint64_t v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = [(ICCloudSyncingObject *)self shortLoggingDescription];
          int v33 = 138412802;
          id v34 = v9;
          __int16 v35 = 2112;
          int64_t v36 = v25;
          __int16 v37 = 2112;
          id v38 = v10;
          _os_log_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_INFO, "User-specific server record changed with no server record in the error in account ID %@: %@: %@", (uint8_t *)&v33, 0x20u);
        }
      }
      BOOL v12 = 1;
LABEL_30:

      goto LABEL_4;
    }
LABEL_15:
    char v23 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v29 = objc_msgSend(v8, "ic_loggingDescription");
      int v33 = 138412802;
      id v34 = v9;
      __int16 v35 = 2112;
      int64_t v36 = v29;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_error_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_ERROR, "Error pushing user-specific record in account ID %@: %@: %@", (uint8_t *)&v33, 0x20u);
    }
  }
LABEL_3:
  BOOL v12 = 1;
LABEL_4:

  return v12;
}

- (void)didDeleteUserSpecificRecordID:(id)a3
{
}

+ (id)temporaryAssets
{
  if (temporaryAssets_onceToken != -1) {
    dispatch_once(&temporaryAssets_onceToken, &__block_literal_global_216);
  }
  uint64_t v2 = (void *)temporaryAssets_temporaryAssets;
  return v2;
}

void __39__ICCloudSyncingObject_temporaryAssets__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)temporaryAssets_temporaryAssets;
  temporaryAssets_temporaryAssets = v0;
}

+ (id)assetForData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  os_log_t v6 = [v5 UUIDString];

  uint64_t v7 = [a1 temporaryAssetDirectoryURL];
  id v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:0];

  if (!v8)
  {
    id v10 = 0;
    goto LABEL_7;
  }
  id v14 = 0;
  int v9 = [v4 writeToURL:v8 options:0 error:&v14];
  id v10 = v14;
  if (!v9)
  {
LABEL_7:
    BOOL v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ICCloudSyncingObject assetForData:]();
    }

    unint64_t v11 = 0;
    goto LABEL_10;
  }
  unint64_t v11 = [a1 assetForTemporaryURL:v8];
LABEL_10:

LABEL_11:
  return v11;
}

+ (id)assetForURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 path],
        os_log_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 fileExistsAtPath:v6],
        v6,
        v5,
        !v7))
  {
    char v16 = 0;
    goto LABEL_14;
  }
  id v8 = [MEMORY[0x1E4F29128] UUID];
  int v9 = [v8 UUIDString];

  id v10 = [a1 temporaryAssetDirectoryURL];
  unint64_t v11 = [v10 URLByAppendingPathComponent:v9 isDirectory:0];

  if (!v11)
  {
    id v14 = 0;
    goto LABEL_10;
  }
  BOOL v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  int v13 = [v12 copyItemAtURL:v4 toURL:v11 error:&v19];
  id v14 = v19;

  if (!v13)
  {
LABEL_10:
    __int16 v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = v4;
      __int16 v22 = 2112;
      char v23 = v11;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "Error cloning file (%@) for creating temporary asset (%@) {error: %@}", buf, 0x20u);
    }

    char v16 = 0;
    goto LABEL_13;
  }
  int v15 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[ICCloudSyncingObject assetForURL:]();
  }

  char v16 = [a1 assetForTemporaryURL:v11];
LABEL_13:

LABEL_14:
  return v16;
}

+ (id)assetForTemporaryURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [a1 temporaryAssets];
    objc_sync_enter(v5);
    os_log_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithFileURL:v4];
    int v7 = [a1 temporaryAssets];
    [v7 addObject:v6];

    id v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[ICCloudSyncingObject assetForTemporaryURL:]();
    }

    objc_sync_exit(v5);
  }
  else
  {
    os_log_t v6 = 0;
  }

  return v6;
}

+ (id)dataForAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fileURL];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9B8];
    os_log_t v6 = [v3 fileURL];
    id v11 = 0;
    int v7 = [v5 dataWithContentsOfURL:v6 options:0 error:&v11];
    id v8 = v11;

    if (v8)
    {
      int v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ICCloudSyncingObject dataForAsset:]();
      }
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ICCloudSyncingObject dataForAsset:](v8);
    }
    int v7 = 0;
  }

  return v7;
}

+ (id)temporaryAssetDirectoryURL
{
  if (temporaryAssetDirectoryURL_onceToken != -1) {
    dispatch_once(&temporaryAssetDirectoryURL_onceToken, &__block_literal_global_220);
  }
  uint64_t v2 = (void *)temporaryAssetDirectoryURL_url;
  return v2;
}

void __50__ICCloudSyncingObject_temporaryAssetDirectoryURL__block_invoke()
{
  uint64_t v0 = NSString;
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 bundleIdentifier];
  id v3 = [v0 stringWithFormat:@"%@-%@", v2, @"TemporaryAssetFiles"];

  id v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = NSTemporaryDirectory();
  os_log_t v6 = [v4 fileURLWithPath:v5];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v3 isDirectory:1];
  id v8 = (void *)temporaryAssetDirectoryURL_url;
  temporaryAssetDirectoryURL_url = v7;

  int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v10 = [v9 createDirectoryAtURL:temporaryAssetDirectoryURL_url withIntermediateDirectories:1 attributes:0 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    BOOL v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __50__ICCloudSyncingObject_temporaryAssetDirectoryURL__block_invoke_cold_1();
    }
  }
}

+ (void)deleteTemporaryAssetFilesForOperation:(id)a3
{
  id v4 = a3;
  if (deleteTemporaryAssetFilesForOperation__onceToken != -1) {
    dispatch_once(&deleteTemporaryAssetFilesForOperation__onceToken, &__block_literal_global_230);
  }
  uint64_t v5 = [a1 temporaryAssets];
  objc_sync_enter(v5);
  os_log_t v6 = [a1 temporaryAssets];
  uint64_t v7 = [v6 count];

  objc_sync_exit(v5);
  if (v7)
  {
    objc_initWeak(&location, a1);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_2;
    aBlock[3] = &unk_1E64A64D0;
    objc_copyWeak(&v18, &location);
    id v8 = v4;
    id v17 = v8;
    int v9 = _Block_copy(aBlock);
    char v10 = deleteTemporaryAssetFilesForOperation__deleteTemporaryAssetFilesQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_233;
    v12[3] = &unk_1E64A64F8;
    id v15 = a1;
    id v13 = v8;
    id v14 = v9;
    id v11 = v9;
    dispatch_async(v10, v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.notes.cloud.deleteTemporaryAssetFiles", attr);
  uint64_t v2 = (void *)deleteTemporaryAssetFilesForOperation__deleteTemporaryAssetFilesQueue;
  deleteTemporaryAssetFilesForOperation__deleteTemporaryAssetFilesQueue = (uint64_t)v1;
}

void __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [WeakRetained temporaryAssets];
    int v9 = [v8 containsObject:v5];

    if (v9)
    {
      id v10 = v5;
      id v11 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        BOOL v12 = [v10 fileURL];
        id v13 = [v6 recordID];
        id v14 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
        int v15 = 138412802;
        char v16 = v12;
        __int16 v17 = 2112;
        id v18 = v13;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "Deleting temporary files for asset (%@) record (%@) operation (%@)", (uint8_t *)&v15, 0x20u);
      }
      [WeakRetained deleteTemporaryFilesForAsset:v10];
    }
  }
}

void __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_233(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id obj = [*(id *)(a1 + 48) temporaryAssets];
  objc_sync_enter(obj);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) recordsToSave];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    uint64_t v15 = *(void *)v29;
    __int16 v17 = v2;
    do
    {
      uint64_t v16 = 0;
      uint64_t v18 = v3;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v2);
        }
        id v4 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v5 = objc_msgSend(v4, "allKeys", obj);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v25;
          do
          {
            uint64_t v19 = v6;
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v25 != v7) {
                objc_enumerationMutation(v5);
              }
              int v9 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v22 = 0u;
                long long v23 = 0u;
                long long v20 = 0u;
                long long v21 = 0u;
                id v10 = v9;
                uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
                if (v11)
                {
                  uint64_t v12 = *(void *)v21;
                  do
                  {
                    for (uint64_t j = 0; j != v11; ++j)
                    {
                      if (*(void *)v21 != v12) {
                        objc_enumerationMutation(v10);
                      }
                      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
                    }
                    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
                  }
                  while (v11);
                }

                uint64_t v2 = v17;
                uint64_t v3 = v18;
              }
              else
              {
                (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
              }
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v6);
        }

        ++v16;
      }
      while (v16 != v3);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v3);
  }

  objc_sync_exit(obj);
}

+ (void)deleteTemporaryFilesForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [a1 temporaryAssets];
  objc_sync_enter(v5);
  uint64_t v6 = [a1 temporaryAssets];
  [v6 removeObject:v4];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v4 fileURL];
  id v12 = 0;
  char v9 = [v7 removeItemAtURL:v8 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICCloudSyncingObject deleteTemporaryFilesForAsset:]();
    }
  }
  objc_sync_exit(v5);
}

+ (void)deleteAllTemporaryAssetFilesForAllObjects
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [a1 temporaryAssetDirectoryURL];
  id v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:&__block_literal_global_236];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v17 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        id v13 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v17);
        id v18 = 0;
        char v14 = [v13 removeItemAtURL:v12 error:&v18];
        id v15 = v18;

        if ((v14 & 1) == 0)
        {
          uint64_t v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            id v24 = v15;
            _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Error deleting temporary asset file: %@", buf, 0xCu);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }
}

uint64_t __65__ICCloudSyncingObject_deleteAllTemporaryAssetFilesForAllObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__ICCloudSyncingObject_deleteAllTemporaryAssetFilesForAllObjects__block_invoke_cold_1();
  }

  return 1;
}

- (BOOL)isDeletable
{
  return 1;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(ICCloudSyncingObject *)self isDeletable])
  {
    id v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.5(self);
    }
LABEL_10:

LABEL_11:
    BOOL v4 = 0;
    goto LABEL_12;
  }
  if (([(ICCloudSyncingObject *)self markedForDeletion] & 1) == 0)
  {
    id v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.4(self);
    }
    goto LABEL_10;
  }
  if ([(ICCloudSyncingObject *)self wasRecentlyDeletedByThisDevice])
  {
    id v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase](self);
    }
    goto LABEL_10;
  }
  if ([(ICCloudSyncingObject *)self isInICloudAccount]
    && [(ICCloudSyncingObject *)self isInCloud]
    && ![(ICCloudSyncingObject *)self hasSuccessfullyPushedLatestVersionToCloud])
  {
    id v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase](self);
    }
    goto LABEL_10;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ICCloudSyncingObject *)self objectsToBeDeletedBeforeThisObject];
  uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 shouldBeDeletedFromLocalDatabase] & 1) == 0)
        {
          uint64_t v11 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase]();
          }

          if ([v10 needsInitialFetchFromCloud]) {
            [v10 setNeedsToBeFetchedFromCloud:1];
          }
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v4 = 1;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v4 = 1;
  }
LABEL_12:

  return v4;
}

- (void)deleteFromLocalDatabase
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Trying to delete an object of unknown type from the local database: %@", v2);
}

- (id)objectsToBeDeletedBeforeThisObject
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)keyPathsForValuesAffectingNeedsToBeDeletedFromCloud
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"markedForDeletion", 0);
}

- (void)markForDeletion
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Marking %@ for deletion", v4, v5, v6, v7, v8);
}

- (void)unmarkForDeletion
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Unmarking %@ for deletion", v4, v5, v6, v7, v8);
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObject setMarkedForDeletion:](v3, self);
  }

  [(ICCloudSyncingObject *)self willChangeValueForKey:@"markedForDeletion"];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v6 forKey:@"markedForDeletion"];

  [(ICCloudSyncingObject *)self didChangeValueForKey:@"markedForDeletion"];
}

- (BOOL)supportsDeletionByTTL
{
  return 0;
}

- (NSDate)creationDate
{
  BOOL v3 = NSStringFromSelector(sel_creationDate);
  [(ICCloudSyncingObject *)self willAccessValueForKey:v3];

  objc_opt_class();
  uint64_t v4 = NSStringFromSelector(sel_creationDate);
  uint64_t v5 = [(ICCloudSyncingObject *)self primitiveValueForKey:v4];
  uint64_t v6 = ICDynamicCast();

  uint64_t v7 = NSStringFromSelector(sel_creationDate);
  [(ICCloudSyncingObject *)self didAccessValueForKey:v7];

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(ICCloudSyncingObject *)self serverRecord];
    id v8 = [v9 creationDate];
  }
  return (NSDate *)v8;
}

- (NSArray)ancestorCloudObjects
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(ICCloudSyncingObject *)self parentCloudObject];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 parentCloudObject];

      uint64_t v5 = (void *)v6;
    }
    while (v6);
  }
  uint64_t v7 = (void *)[v3 copy];

  return (NSArray *)v7;
}

- (id)parentCloudObjectModificationDate
{
  return 0;
}

- (void)updateParentReferenceIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 shortLoggingDescription];
  uint64_t v7 = [a1 serverRecord];
  id v8 = [v7 parent];
  uint64_t v9 = [v8 recordID];
  uint64_t v10 = objc_msgSend(v9, "ic_loggingDescription");
  uint64_t v11 = objc_msgSend(a2, "ic_loggingDescription");
  OUTLINED_FUNCTION_31();
  long long v14 = v10;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_15(&dword_1C3A61000, a3, v12, "Server record for %@ parent %@ is different from expected parent %@. Re-saving record.", v13);
}

- (void)updateChangeCountsForUnsavedParentReferences
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ICCloudSyncingObject *)self childCloudObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [v7 serverRecord];
        uint64_t v9 = [v8 parent];

        if (!v9) {
          [v7 updateChangeCountWithReason:@"Updated parent reference"];
        }
        [v7 updateChangeCountsForUnsavedParentReferences];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (BOOL)needsToDeleteShare
{
  if (![(ICCloudSyncingObject *)self markedForDeletion]) {
    return 0;
  }
  uint64_t v3 = [(ICCloudSyncingObject *)self serverShare];
  if (v3) {
    BOOL v4 = [(ICCloudSyncingObject *)self shareMatchesRecord];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)canCurrentUserShare
{
  uint64_t v3 = [(ICCloudSyncingObject *)self serverShare];

  if (!v3) {
    return 1;
  }
  BOOL v4 = [(ICCloudSyncingObject *)self serverShare];
  uint64_t v5 = [v4 currentUserParticipant];
  if ([v5 role] == 1)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [(ICCloudSyncingObject *)self serverShare];
    id v8 = [v7 currentUserParticipant];
    BOOL v6 = [v8 role] == 2;
  }
  return v6;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isSharedViaICloud", @"cloudAccount.accountType", @"isPasswordProtected", @"isUnsupported", 0);
}

- (BOOL)canBeSharedViaICloud
{
  if ([(ICCloudSyncingObject *)self isPasswordProtected]) {
    return 0;
  }
  uint64_t v3 = [(ICCloudSyncingObject *)self cloudAccount];
  int v4 = [v3 accountType];

  if (v4 != 1) {
    return 0;
  }
  else {
    return ![(ICCloudSyncingObject *)self isUnsupported];
  }
}

- (BOOL)isSharedThroughParent
{
  uint64_t v3 = [(ICCloudSyncingObject *)self serverShare];
  if (v3 && [(ICCloudSyncingObject *)self shareMatchesRecord])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [(ICCloudSyncingObject *)self serverRecord];
    BOOL v6 = [v5 share];
    if (v6)
    {
      char v4 = 0;
    }
    else
    {
      uint64_t v7 = [(ICCloudSyncingObject *)self parentCloudObject];
      char v4 = [v7 isSharedViaICloud];
    }
  }

  return v4;
}

- (BOOL)canBeRootShareObject
{
  return 0;
}

- (BOOL)isOwnedByCurrentUser
{
  uint64_t v2 = [(ICCloudSyncingObject *)self recordID];
  char v3 = objc_msgSend(v2, "ic_isOwnedByCurrentUser");

  return v3;
}

- (BOOL)wasCreatedByCurrentUser
{
  char v3 = [(ICCloudSyncingObject *)self cloudAccount];
  char v4 = [(ICCloudSyncingObject *)self serverRecord];
  if ([(ICCloudSyncingObject *)self isInICloudAccount])
  {
    char v5 = 1;
    if ([(ICCloudSyncingObject *)self isInCloud] && v4 && v3)
    {
      BOOL v6 = [v4 creatorUserRecordID];
      uint64_t v7 = [v6 recordName];
      id v8 = [v3 userRecordName];
      if (([v7 isEqualToString:v8] & 1) == 0)
      {
        uint64_t v9 = [v4 creatorUserRecordID];
        long long v10 = [v9 recordName];
        char v5 = [v10 isEqualToString:*MEMORY[0x1E4F19C08]];
      }
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)isSharedRootObject
{
  char v3 = [(ICCloudSyncingObject *)self serverRecord];
  char v4 = [v3 share];

  if (v4) {
    return 1;
  }
  BOOL v6 = [(ICCloudSyncingObject *)self serverShare];
  if (v6) {
    BOOL v5 = [(ICCloudSyncingObject *)self shareMatchesRecord];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)sharedRootObject
{
  if ([(ICCloudSyncingObject *)self isSharedRootObject])
  {
    char v3 = self;
  }
  else
  {
    char v4 = [(ICCloudSyncingObject *)self parentCloudObject];
    char v3 = [v4 sharedRootObject];
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingIsSharedReadOnly
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"serverShareCheckingParent"];
}

- (id)associatedNoteParticipants
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)ownerRecordName
{
  if ([(ICCloudSyncingObject *)self isInICloudAccount])
  {
    if ([(ICCloudSyncingObject *)self isOwnedByCurrentUser])
    {
      char v3 = [(ICCloudSyncingObject *)self zoneOwnerName];
      char v4 = v3;
      if (!v3 || [v3 isEqualToString:*MEMORY[0x1E4F19C08]])
      {
        BOOL v5 = [(ICCloudSyncingObject *)self cloudAccount];
        uint64_t v6 = [v5 userRecordName];

        char v4 = (void *)v6;
      }
    }
    else if ([(ICCloudSyncingObject *)self isSharedViaICloud])
    {
      char v4 = [(ICCloudSyncingObject *)self sharedOwnerRecordName];
    }
    else
    {
      char v4 = 0;
    }
    uint64_t v7 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)sharedOwnerRecordName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self isSharedViaICloud]
    && ![(ICCloudSyncingObject *)self isOwnedByCurrentUser])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v4 = [(ICCloudSyncingObject *)self serverShare];
    BOOL v5 = [v4 participants];

    char v3 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v8 role] == 1)
          {
            uint64_t v9 = [v8 userIdentity];
            long long v10 = [v9 userRecordID];
            char v3 = [v10 recordName];

            goto LABEL_14;
          }
        }
        char v3 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    char v3 = 0;
  }
  long long v11 = (void *)[v3 copy];

  return v11;
}

- (id)sharedOwnerName
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self isSharedViaICloud]
    && ![(ICCloudSyncingObject *)self isOwnedByCurrentUser])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    char v4 = [(ICCloudSyncingObject *)self serverShare];
    BOOL v5 = [v4 participants];

    char v3 = (void *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 role] == 1)
          {
            char v3 = objc_msgSend(v8, "ic_participantName");
            goto LABEL_14;
          }
        }
        char v3 = (void *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingServerShareCheckingParent
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"serverShare"];
}

- (void)markShareDirtyIfNeededWithReason:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self isSharedRootObject]
    && ([(ICCloudSyncingObject *)self isShareDirty] & 1) == 0
    && ![(ICCloudSyncingObject *)self isSharedReadOnly])
  {
    [(ICCloudSyncingObject *)self setIsShareDirty:1];
    BOOL v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject markShareDirtyIfNeededWithReason:]();
    }
  }
}

- (void)didAcceptShare:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self serverShare];

  if (!v5)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      id v8 = objc_msgSend(v4, "ic_loggingDescription");
      int v11 = 138412546;
      long long v12 = v7;
      __int16 v13 = 2112;
      long long v14 = v8;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "No server share for %@, setting to %@", (uint8_t *)&v11, 0x16u);
    }
    [(ICCloudSyncingObject *)self setServerShare:v4];
  }
  if ([(ICCloudSyncingObject *)self markedForDeletion])
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      int v11 = 138412290;
      long long v12 = v10;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Undeleting shared %@", (uint8_t *)&v11, 0xCu);
    }
    [(ICCloudSyncingObject *)self unmarkForDeletion];
  }
}

- (id)shareDescription
{
  char v3 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
  id v4 = [v3 participants];

  BOOL v5 = [(ICCloudSyncingObject *)self shareDescriptionForShareParticipants:v4];

  return v5;
}

- (id)shareDescriptionForShareParticipants:(id)a3
{
  id v4 = a3;
  if (![(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    uint64_t v9 = 0;
    goto LABEL_28;
  }
  if (![(ICCloudSyncingObject *)self isOwnedByCurrentUser])
  {
    BOOL v5 = objc_msgSend(v4, "ic_objectPassingTest:", &__block_literal_global_304);
    long long v10 = objc_msgSend(v5, "ic_participantName");
    if (v10)
    {
      int v11 = NSString;
      long long v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared by %@" value:@"Shared by %@" table:0 allowSiri:1];
      objc_msgSend(v11, "localizedStringWithFormat:", v12, v10, v19);
      uint64_t v9 = LABEL_20:;
      goto LABEL_21;
    }
    uint64_t v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared to you" value:@"Shared to you" table:0 allowSiri:1];
    goto LABEL_25;
  }
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1A3B0], "ic_displayableNames:maximumNamesCount:", v4, 2);
  if ([v4 count] == 2 && objc_msgSend(v5, "count") == 1)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = (void *)MEMORY[0x1E4F83770];
    id v8 = @"Shared with %@";
LABEL_12:
    long long v10 = [v7 localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
    long long v12 = [v5 firstObject];
    uint64_t v18 = v12;
LABEL_19:
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v18, v19);
    goto LABEL_20;
  }
  if ([v4 count] == 3 && objc_msgSend(v5, "count") == 1)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = (void *)MEMORY[0x1E4F83770];
    id v8 = @"Shared with %@ and 1 other";
    goto LABEL_12;
  }
  if ([v4 count] != 3 || objc_msgSend(v5, "count") != 2)
  {
    if ((unint64_t)[v4 count] >= 4 && objc_msgSend(v5, "count"))
    {
      uint64_t v6 = NSString;
      long long v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared with %@ and %lu others" value:@"Shared with %@ and %lu others" table:0 allowSiri:1];
      long long v12 = [v5 firstObject];
      uint64_t v18 = v12;
      uint64_t v19 = [v4 count] - 2;
      goto LABEL_19;
    }
    if ((unint64_t)[v4 count] < 2)
    {
      uint64_t v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared by me" value:@"Shared by me" table:0 allowSiri:1];
      goto LABEL_27;
    }
    long long v16 = NSString;
    long long v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared with %lu others" value:@"Shared with %lu others" table:0 allowSiri:1];
    uint64_t v15 = objc_msgSend(v16, "localizedStringWithFormat:", v10, objc_msgSend(v4, "count") - 1);
LABEL_25:
    uint64_t v9 = (void *)v15;
    goto LABEL_26;
  }
  __int16 v13 = NSString;
  long long v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared with %@ and %@" value:@"Shared with %@ and %@" table:0 allowSiri:1];
  long long v12 = [v5 firstObject];
  long long v14 = [v5 lastObject];
  uint64_t v9 = objc_msgSend(v13, "localizedStringWithFormat:", v10, v12, v14);

LABEL_21:
LABEL_26:

LABEL_27:
LABEL_28:

  return v9;
}

BOOL __61__ICCloudSyncingObject_shareDescriptionForShareParticipants___block_invoke(uint64_t a1, void *a2)
{
  return [a2 role] == 1;
}

- (id)participantForUserID:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    if (([v4 isEqualToString:*MEMORY[0x1E4F19C08]] & 1) != 0
      || ([(ICCloudSyncingObject *)self cloudAccount],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          [v5 userRecordName],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v4 isEqualToString:v6],
          v6,
          v5,
          v7))
    {
      id v8 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
      uint64_t v9 = [v8 currentUserParticipant];
    }
    else
    {
      id v8 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
      uint64_t v9 = objc_msgSend(v8, "ic_participantWithUserRecordName:", v4);
    }
    long long v10 = (void *)v9;
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)participantHandlesToParticipants
{
  participantHandlesToParticipants = self->_participantHandlesToParticipants;
  if (participantHandlesToParticipants)
  {
    id v4 = participantHandlesToParticipants;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  BOOL v5 = self->_participantHandlesToParticipants;
  self->_participantHandlesToParticipants = v4;

  uint64_t v6 = self->_participantHandlesToParticipants;
  return v6;
}

- (id)participantForHandle:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    BOOL v5 = [(ICCloudSyncingObject *)self participantHandlesToParticipants];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      int v7 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
      id v8 = objc_msgSend(v7, "ic_participantWithHandle:", v4);
      uint64_t v9 = [(ICCloudSyncingObject *)self participantHandlesToParticipants];
      [v9 setObject:v8 forKeyedSubscript:v4];
    }
    long long v10 = [(ICCloudSyncingObject *)self participantHandlesToParticipants];
    int v11 = [v10 objectForKeyedSubscript:v4];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

+ (BOOL)hasAnySharedObjectInContext:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  BOOL v5 = [v3 fetchRequestWithEntityName:@"ICCloudSyncingObject"];
  [v5 setFetchLimit:1];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"serverShareData != nil"];
  [v5 setPredicate:v6];

  uint64_t v10 = 0;
  int v7 = [v4 executeFetchRequest:v5 error:&v10];

  if (v10) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [v7 count] != 0;
  }

  return v8;
}

- (BOOL)shareMatchesRecord
{
  char v3 = [(ICCloudSyncingObject *)self serverShare];
  id v4 = [v3 rootRecordID];
  BOOL v5 = [v4 recordName];
  if (v5)
  {
    uint64_t v6 = [(ICCloudSyncingObject *)self serverShare];
    int v7 = [v6 rootRecordID];
    BOOL v8 = [v7 recordName];
    uint64_t v9 = [(ICCloudSyncingObject *)self recordID];
    uint64_t v10 = [v9 recordName];
    char v11 = [v8 isEqualToString:v10];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)unitTest_injectCryptoStrategy:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ICCloudSyncingObject_unitTest_injectCryptoStrategy___block_invoke;
  v7[3] = &unk_1E64A4218;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __54__ICCloudSyncingObject_unitTest_injectCryptoStrategy___block_invoke(uint64_t a1)
{
}

- (id)validatedCreateCryptoStrategy
{
  char v3 = [(ICCloudSyncingObject *)self cryptoStrategyProtocol];
  id v4 = +[ICCryptoStrategyFactory makeCryptoStrategyForObject:self andValidateProtocolConformance:v3];

  return v4;
}

- (BOOL)cryptoStrategyIsTransient
{
  if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud]) {
    return 1;
  }
  id v4 = [(ICCloudSyncingObject *)self primaryEncryptedData];
  BOOL v3 = v4 == 0;

  return v3;
}

- (Protocol)cryptoStrategyProtocol
{
  return (Protocol *)&unk_1F1F64D18;
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v9 = [v8 encryptFileFromURL:v7 toURL:v6];

  return v9;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self cryptoStrategy];
  if (v5) {
    goto LABEL_2;
  }
  id v7 = [(ICCloudSyncingObject *)self primaryEncryptedDataFromRecord:v4];
  if ([v7 length])
  {
    id v8 = [(ICCloudSyncingObject *)self cryptoStrategyProtocol];
    BOOL v5 = +[ICCryptoStrategyFactory makeCryptoStrategyForObject:self withCipherMatchingEncryptedData:v7 andValidateProtocolConformance:v8];

    if (v5)
    {
LABEL_2:
      [(ICCloudSyncingObject *)self setCryptoStrategyForMergingEncryptedData:v5];
      char v6 = [v5 mergeEncryptedDataFromRecord:v4];
      [(ICCloudSyncingObject *)self setCryptoStrategyForMergingEncryptedData:0];

      goto LABEL_10;
    }
  }
  else
  {
  }
  char v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    int v12 = 138412290;
    __int16 v13 = v10;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Object cannot have crypto strategy, but is asked to decrypt and merge data from record {object: %@}", (uint8_t *)&v12, 0xCu);
  }
  [(ICCloudSyncingObject *)self setUnappliedEncryptedRecord:v4];
  char v6 = 0;
LABEL_10:

  return v6;
}

- (BOOL)hasPassphraseSet
{
  uint64_t v2 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v3 = [v2 hasPassphraseSet];

  return v3;
}

- (NSString)passwordHint
{
  uint64_t v2 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v3 = [v2 passphraseHint];

  return (NSString *)v3;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v6 = [v5 isPassphraseCorrect:v4];

  return v6;
}

- (NSData)primaryEncryptedData
{
  if ([(ICCloudSyncingObject *)self supportsEncryptedValuesDictionary])
  {
    char v3 = [(ICCloudSyncingObject *)self encryptedValuesJSON];
  }
  else
  {
    char v3 = 0;
  }
  return (NSData *)v3;
}

- (void)setPrimaryEncryptedData:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self supportsEncryptedValuesDictionary]) {
    [(ICCloudSyncingObject *)self setEncryptedValuesJSON:v4];
  }
}

- (id)primaryEncryptedDataFromRecord:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self supportsEncryptedValuesDictionary])
  {
    BOOL v5 = objc_msgSend(v4, "ic_inlineableDataAssetForKeyPrefix:", @"EncryptedValues");
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setCryptoTag:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self cryptoTag];
  [(ICCloudSyncingObject *)self willChangeValueForKey:@"cryptoTag"];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v4 forKey:@"cryptoTag"];
  [(ICCloudSyncingObject *)self didChangeValueForKey:@"cryptoTag"];
  char v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    char v9 = 0;
  }
  else {
    char v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(ICCloudSyncingObject *)self setCryptoTag:v14];
    }
    goto LABEL_19;
  }
  char v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
  }
  else
  {
    int v13 = [(id)v8 isEqual:v10];

    if (v13) {
      goto LABEL_15;
    }
  }
  uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    uint64_t v17 = [(ICCloudSyncingObject *)self identifier];
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    long long v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 hash];
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoTag.hash = %lu", (uint8_t *)&v18, 0x20u);
  }
LABEL_19:
}

- (void)setCryptoInitializationVector:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self cryptoInitializationVector];
  [(ICCloudSyncingObject *)self willChangeValueForKey:@"cryptoInitializationVector"];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v4 forKey:@"cryptoInitializationVector"];
  [(ICCloudSyncingObject *)self didChangeValueForKey:@"cryptoInitializationVector"];
  char v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    char v9 = 0;
  }
  else {
    char v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(ICCloudSyncingObject *)self setCryptoInitializationVector:v14];
    }
    goto LABEL_19;
  }
  char v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
  }
  else
  {
    int v13 = [(id)v8 isEqual:v10];

    if (v13) {
      goto LABEL_15;
    }
  }
  uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    uint64_t v17 = [(ICCloudSyncingObject *)self identifier];
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    long long v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 hash];
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoInitializationVector.hash = %lu", (uint8_t *)&v18, 0x20u);
  }
LABEL_19:
}

- (void)setCryptoSalt:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICCloudSyncingObject *)self cryptoSalt];
  [(ICCloudSyncingObject *)self willChangeValueForKey:@"cryptoSalt"];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v4 forKey:@"cryptoSalt"];
  [(ICCloudSyncingObject *)self didChangeValueForKey:@"cryptoSalt"];
  char v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    char v9 = 0;
  }
  else {
    char v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(ICCloudSyncingObject *)self setCryptoSalt:v14];
    }
    goto LABEL_19;
  }
  char v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
  }
  else
  {
    int v13 = [(id)v8 isEqual:v10];

    if (v13) {
      goto LABEL_15;
    }
  }
  uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    uint64_t v17 = [(ICCloudSyncingObject *)self identifier];
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    long long v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 hash];
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoSalt.hash = %lu", (uint8_t *)&v18, 0x20u);
  }
LABEL_19:
}

- (void)setCryptoIterationCount:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ICCloudSyncingObject *)self cryptoIterationCount];
  [(ICCloudSyncingObject *)self willChangeValueForKey:@"cryptoIterationCount"];
  char v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v6 forKey:@"cryptoIterationCount"];

  [(ICCloudSyncingObject *)self didChangeValueForKey:@"cryptoIterationCount"];
  id v7 = os_log_create("com.apple.notes", "Crypto");
  unint64_t v8 = v7;
  if (v5 == a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(ICCloudSyncingObject *)self setCryptoIterationCount:v8];
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v9 = objc_opt_class();
    id v10 = v9;
    char v11 = [(ICCloudSyncingObject *)self identifier];
    int v12 = 138412802;
    int v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    int64_t v17 = a3;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoIterationCount = %lld", (uint8_t *)&v12, 0x20u);
  }
}

- (void)setCryptoWrappedKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self cryptoWrappedKey];
  [(ICCloudSyncingObject *)self willChangeValueForKey:@"cryptoWrappedKey"];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v4 forKey:@"cryptoWrappedKey"];
  [(ICCloudSyncingObject *)self didChangeValueForKey:@"cryptoWrappedKey"];
  char v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    char v9 = 0;
  }
  else {
    char v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    __int16 v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(ICCloudSyncingObject *)self setCryptoWrappedKey:v14];
    }
    goto LABEL_19;
  }
  char v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
  }
  else
  {
    int v13 = [(id)v8 isEqual:v10];

    if (v13) {
      goto LABEL_15;
    }
  }
  __int16 v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    int64_t v17 = [(ICCloudSyncingObject *)self identifier];
    int v18 = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    long long v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 hash];
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoWrappedKey.hash = %lu", (uint8_t *)&v18, 0x20u);
  }
LABEL_19:
}

- (void)setEncryptedValuesJSON:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self encryptedValuesJSON];
  [(ICCloudSyncingObject *)self willChangeValueForKey:@"encryptedValuesJSON"];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v4 forKey:@"encryptedValuesJSON"];
  [(ICCloudSyncingObject *)self didChangeValueForKey:@"encryptedValuesJSON"];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    char v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudSyncingObject setEncryptedValuesJSON:]();
    }
  }
}

- (void)persistPendingChangesRecursively
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(ICCloudSyncingObject *)self persistPendingChanges];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  char v3 = [(ICCloudSyncingObject *)self allChildCloudObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) persistPendingChangesRecursively];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)clearDecryptedData
{
  char v3 = [(ICCloudSyncingObject *)self mutableDecryptedValues];
  [v3 removeAllObjects];

  [(ICCloudSyncingObject *)self setNeedsToLoadDecryptedValues:1];
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 0;
}

- (NSDictionary)decryptedValues
{
  decryptedValues = self->_decryptedValues;
  if (decryptedValues)
  {
    uint64_t v4 = decryptedValues;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v5 = self->_decryptedValues;
  self->_decryptedValues = v4;

  uint64_t v6 = self->_decryptedValues;
  return v6;
}

- (NSMutableDictionary)mutableDecryptedValues
{
  objc_opt_class();
  char v3 = [(ICCloudSyncingObject *)self decryptedValues];
  uint64_t v4 = ICCheckedDynamicCast();

  return (NSMutableDictionary *)v4;
}

- (id)serializedValuesToEncrypt
{
  char v3 = [(ICCloudSyncingObject *)self decryptedValues];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if ([v4 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke;
    v12[3] = &unk_1E64A6540;
    void v12[4] = self;
    id v5 = v4;
    id v13 = v5;
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    id v11 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v11];
    id v7 = v11;
    long long v8 = v7;
    if (!v6 || v7)
    {
      long long v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObject serializedValuesToEncrypt]();
      }

      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject serializedValuesToEncrypt]" simulateCrash:1 showAlert:1 format:@"Error converting decrypted values to JSON"];
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([*(id *)(a1 + 32) isEncryptableKeyBinaryData:v5] & 1) == 0)
    {
      id v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke_cold_1();
      }
    }
    long long v8 = [v6 base64EncodedStringWithOptions:0];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
  }
}

- (void)deserializeAndMergeValues:(id)a3
{
  if (a3)
  {
    id v10 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v10];
    id v5 = v10;
    id v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__ICCloudSyncingObject_deserializeAndMergeValues___block_invoke;
      v9[3] = &unk_1E64A6568;
      v9[4] = self;
      [v4 enumerateKeysAndObjectsUsingBlock:v9];
    }
    else
    {
      long long v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObject deserializeAndMergeValues:]();
      }

      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject deserializeAndMergeValues:]" simulateCrash:1 showAlert:1 format:@"Error parsing decrypted JSON"];
    }
  }
}

void __50__ICCloudSyncingObject_deserializeAndMergeValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if ([*(id *)(a1 + 32) isEncryptableKeyBinaryData:v5])
  {
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
  }
  long long v8 = [*(id *)(a1 + 32) decryptedValues];
  long long v9 = [v8 objectForKeyedSubscript:v5];

  id v10 = [*(id *)(a1 + 32) mergeDecryptedValue:v7 withOldValue:v9 forKey:v5];
  if (v10 != v9)
  {
    id v11 = [*(id *)(a1 + 32) mutableDecryptedValues];
    [v11 setObject:v10 forKeyedSubscript:v5];
  }
  if ([v5 isEqualToString:@"mergeableData"])
  {
    objc_opt_class();
    BOOL v12 = ICDynamicCast();
    if (v12)
    {
      id v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v12 length];
        uint64_t v15 = [*(id *)(a1 + 32) className];
        id v16 = [*(id *)(a1 + 32) identifier];
        int v19 = 134218498;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        __int16 v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Decrypted mergeableData size is %lu for %@ (%@)", (uint8_t *)&v19, 0x20u);
      }
    }
    else
    {
      if (!v7)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int64_t v17 = [*(id *)(a1 + 32) className];
        int v18 = [*(id *)(a1 + 32) identifier];
        int v19 = 138412546;
        uint64_t v20 = (uint64_t)v17;
        __int16 v21 = 2112;
        __int16 v22 = v18;
        _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Decrypted mergeableData is not NSData for %@ (%@)", (uint8_t *)&v19, 0x16u);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)initializeCryptoProperties
{
  id v4 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v3 = [(ICCloudSyncingObject *)self parentEncryptableObject];
  [v4 initializeCryptoPropertiesFromObject:v3];
}

- (id)mergeDecryptedValue:(id)a3 withOldValue:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() mergeableWallClockValueKeyPaths];
  int v12 = [v11 containsObject:v10];

  if (v12 && v9)
  {
    id v13 = [[ICTTMergeableWallClockValue alloc] initWithData:v9];
    uint64_t v14 = [[ICTTMergeableWallClockValue alloc] initWithData:v8];
    if (![(ICTTMergeableWallClockValue *)v13 merge:v14])
    {
      uint64_t v15 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObject mergeDecryptedValue:withOldValue:forKey:]((uint64_t)v10, self);
      }
    }
    id v16 = [(ICTTMergeableWallClockValue *)v13 serialize];
  }
  else
  {
    id v16 = v8;
  }

  return v16;
}

- (id)decryptedValueForKey:(id)a3
{
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self isAuthenticated])
  {
    id v5 = [(ICCloudSyncingObject *)self cryptoStrategy];
    [v5 loadDecryptedValuesIfNecessary];
  }
  id v6 = [(ICCloudSyncingObject *)self decryptedValues];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (void)setDecryptedValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(ICCloudSyncingObject *)self isAuthenticated])
  {
    id v8 = [(ICCloudSyncingObject *)self cryptoStrategy];
    [v8 loadDecryptedValuesIfNecessary];

    id v9 = [(ICCloudSyncingObject *)self mutableDecryptedValues];
    [v9 setObject:v7 forKeyedSubscript:v6];

    id v10 = [(ICCloudSyncingObject *)self cryptoStrategy];
    [v10 saveEncryptedJSON];
  }
  else
  {
    id v10 = [(ICCloudSyncingObject *)self mutableDecryptedValues];
    [v10 setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)setValue:(id)a3 forEncryptableKey:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [(ICCloudSyncingObject *)self willChangeValueForKey:v7];
  [(ICCloudSyncingObject *)self setPrimitiveValue:v6 forEncryptableKey:v7];

  [(ICCloudSyncingObject *)self didChangeValueForKey:v7];
}

- (void)setPrimitiveValue:(id)a3 forEncryptableKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(ICCloudSyncingObject *)self isPasswordProtected]) {
    [(ICCloudSyncingObject *)self setDecryptedValue:v7 forKey:v6];
  }
  else {
    [(ICCloudSyncingObject *)self setPrimitiveValue:v7 forKey:v6];
  }
}

- (BOOL)isEncryptableKeyBinaryData:(id)a3
{
  id v3 = a3;
  if (([v3 isEqual:@"sidecarMainKey"] & 1) != 0
    || ([v3 isEqual:@"activityEventsData"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(id)objc_opt_class() mergeableWallClockValueKeyPaths];
    char v4 = [v5 containsObject:v3];
  }
  return v4;
}

+ (NSSet)mergeableWallClockValueKeyPaths
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (id)parentEncryptableObject
{
  return 0;
}

- (void)applyRandomCryptoGooIfNeeded
{
  id v3 = [(ICCloudSyncingObject *)self cryptoTag];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", 0);
    [(ICCloudSyncingObject *)self setCryptoTag:v5];
  }
  id v6 = [(ICCloudSyncingObject *)self cryptoInitializationVector];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", 0);
    [(ICCloudSyncingObject *)self setCryptoInitializationVector:v8];
  }
  id v9 = [(ICCloudSyncingObject *)self cryptoWrappedKey];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", 0);
    [(ICCloudSyncingObject *)self setCryptoWrappedKey:v11];
  }
  int v12 = [(ICCloudSyncingObject *)self cryptoSalt];
  uint64_t v13 = [v12 length];

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [(ICCloudSyncingObject *)self setCryptoSalt:v14];
  }
}

- (void)setHasMissingKeychainItem:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(ICCloudSyncingObject *)self hasMissingKeychainItem] != a3)
  {
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Setting object has missing Keychain item… {object: %@, hasMissingKeychainItem: %@}", (uint8_t *)&v12, 0x16u);
    }
    id v8 = NSStringFromSelector(sel_hasMissingKeychainItem);
    [(ICCloudSyncingObject *)self willChangeValueForKey:v8];

    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    uint64_t v10 = NSStringFromSelector(sel_hasMissingKeychainItem);
    [(ICCloudSyncingObject *)self setPrimitiveValue:v9 forKey:v10];

    id v11 = NSStringFromSelector(sel_hasMissingKeychainItem);
    [(ICCloudSyncingObject *)self didChangeValueForKey:v11];
  }
}

- (void)authenticationStateWillDeauthenticate:(id)a3
{
  id v11 = a3;
  if (([(ICCloudSyncingObject *)self ic_isTransitioning] & 1) == 0)
  {
    objc_opt_class();
    uint64_t v4 = [v11 userInfo];
    id v5 = [v4 objectForKeyedSubscript:@"ICAuthenticationStateKeyObjectID"];
    id v6 = ICCheckedDynamicCast();

    if (!v6
      || ([(ICCloudSyncingObject *)self objectID],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v6 isEqual:v7],
          v7,
          v8))
    {
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        id v9 = [(ICCloudSyncingObject *)self managedObjectContext];
        if ([v9 concurrencyType] == 2)
        {
          BOOL v10 = [(ICCloudSyncingObject *)self isAuthenticated];

          if (v10) {
            [(ICCloudSyncingObject *)self persistPendingChanges];
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  id v4 = a3;
  if (([(ICCloudSyncingObject *)self ic_isTransitioning] & 1) == 0)
  {
    objc_opt_class();
    id v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"ICAuthenticationStateKeyObjectID"];
    uint64_t v7 = ICCheckedDynamicCast();

    if (!v7
      || ([(ICCloudSyncingObject *)self objectID],
          int v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqual:v8],
          v8,
          v9))
    {
      BOOL v10 = [(ICCloudSyncingObject *)self managedObjectContext];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__ICCloudSyncingObject_authenticationStateDidDeauthenticate___block_invoke;
      v11[3] = &unk_1E64A4240;
      v11[4] = self;
      [v10 performBlock:v11];
    }
  }
}

uint64_t __61__ICCloudSyncingObject_authenticationStateDidDeauthenticate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "ic_isTransitioning");
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isPasswordProtected];
    if (result)
    {
      BOOL v3 = *(void **)(a1 + 32);
      return [v3 clearDecryptedData];
    }
  }
  return result;
}

+ (id)versionsByOperationQueue
{
  if (versionsByOperationQueue_onceToken != -1) {
    dispatch_once(&versionsByOperationQueue_onceToken, &__block_literal_global_485);
  }
  uint64_t v2 = (void *)versionsByOperationQueue_sVersionsByOperationQueue;
  return v2;
}

void __48__ICCloudSyncingObject_versionsByOperationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.cloud.versions-by-operation", v2);
  uint64_t v1 = (void *)versionsByOperationQueue_sVersionsByOperationQueue;
  versionsByOperationQueue_sVersionsByOperationQueue = (uint64_t)v0;
}

+ (id)versionsByRecordIDByOperation
{
  if (versionsByRecordIDByOperation_onceToken != -1) {
    dispatch_once(&versionsByRecordIDByOperation_onceToken, &__block_literal_global_488);
  }
  uint64_t v2 = (void *)versionsByRecordIDByOperation_sVersionsByRecordIDByOperation;
  return v2;
}

void __53__ICCloudSyncingObject_versionsByRecordIDByOperation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  uint64_t v1 = (void *)versionsByRecordIDByOperation_sVersionsByRecordIDByOperation;
  versionsByRecordIDByOperation_sVersionsByRecordIDByOperation = v0;
}

- (int64_t)versionForOperation:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v5 = [(ICCloudSyncingObject *)self recordID];
  id v6 = [(id)objc_opt_class() versionsByOperationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ICCloudSyncingObject_versionForOperation___block_invoke;
  v11[3] = &unk_1E64A5820;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  __int16 v14 = &v15;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, v11);

  int64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __44__ICCloudSyncingObject_versionForOperation___block_invoke(void *a1)
{
  uint64_t v2 = [(id)objc_opt_class() versionsByRecordIDByOperation];
  id v4 = [v2 objectForKey:a1[5]];

  if (a1[6])
  {
    BOOL v3 = objc_msgSend(v4, "objectForKeyedSubscript:");
    *(void *)(*(void *)(a1[7] + 8) + 24) = [v3 longLongValue];
  }
}

- (void)setVersion:(int64_t)a3 forOperation:(id)a4
{
  id v6 = a4;
  id v7 = [(id)objc_opt_class() versionsByOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICCloudSyncingObject_setVersion_forOperation___block_invoke;
  block[3] = &unk_1E64A4710;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __48__ICCloudSyncingObject_setVersion_forOperation___block_invoke(uint64_t a1)
{
  id v5 = [(id)objc_opt_class() versionsByRecordIDByOperation];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  BOOL v3 = [*(id *)(a1 + 32) recordID];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 48)];
    [v2 setObject:v4 forKeyedSubscript:v3];
  }
}

- (int64_t)isPushingSameOrLaterThanVersion:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(id)objc_opt_class() versionsByOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICCloudSyncingObject_isPushingSameOrLaterThanVersion___block_invoke;
  block[3] = &unk_1E64A6000;
  block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  int64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __56__ICCloudSyncingObject_isPushingSameOrLaterThanVersion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) recordID];
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v3 = objc_msgSend((id)objc_opt_class(), "versionsByRecordIDByOperation", 0);
    id v4 = [v3 objectEnumerator];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) objectForKeyedSubscript:v2];
          id v10 = v9;
          if (v9 && [v9 longLongValue] >= *(void *)(a1 + 48))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

+ (id)deletedByThisDeviceOperationQueue
{
  if (deletedByThisDeviceOperationQueue_onceToken != -1) {
    dispatch_once(&deletedByThisDeviceOperationQueue_onceToken, &__block_literal_global_491);
  }
  uint64_t v2 = (void *)deletedByThisDeviceOperationQueue_sDeletedByThisDeviceOperationQueue;
  return v2;
}

void __57__ICCloudSyncingObject_deletedByThisDeviceOperationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.cloud.deleted-by-this-device", v2);
  uint64_t v1 = (void *)deletedByThisDeviceOperationQueue_sDeletedByThisDeviceOperationQueue;
  deletedByThisDeviceOperationQueue_sDeletedByThisDeviceOperationQueue = (uint64_t)v0;
}

+ (id)deletedByThisDeviceSet
{
  if (deletedByThisDeviceSet_onceToken != -1) {
    dispatch_once(&deletedByThisDeviceSet_onceToken, &__block_literal_global_494);
  }
  uint64_t v2 = (void *)deletedByThisDeviceSet_sDeletedByThisDeviceMutableSet;
  return v2;
}

void __46__ICCloudSyncingObject_deletedByThisDeviceSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = (void *)deletedByThisDeviceSet_sDeletedByThisDeviceMutableSet;
  deletedByThisDeviceSet_sDeletedByThisDeviceMutableSet = v0;
}

- (void)setWasRecentlyDeletedByThisDevice:(BOOL)a3
{
  [(ICCloudSyncingObject *)self ic_obtainPermanentObjectIDIfNecessary];
  uint64_t v5 = [(id)objc_opt_class() deletedByThisDeviceOperationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__ICCloudSyncingObject_setWasRecentlyDeletedByThisDevice___block_invoke;
  v6[3] = &unk_1E64A6590;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

void __58__ICCloudSyncingObject_setWasRecentlyDeletedByThisDevice___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v4 = [(id)objc_opt_class() deletedByThisDeviceSet];
  BOOL v3 = [*(id *)(a1 + 32) objectID];
  if (v2) {
    [v4 addObject:v3];
  }
  else {
    [v4 removeObject:v3];
  }
}

- (BOOL)wasRecentlyDeletedByThisDevice
{
  int v2 = self;
  [(ICCloudSyncingObject *)self ic_obtainPermanentObjectIDIfNecessary];
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(id)objc_opt_class() deletedByThisDeviceOperationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ICCloudSyncingObject_wasRecentlyDeletedByThisDevice__block_invoke;
  v5[3] = &unk_1E64A4528;
  void v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __54__ICCloudSyncingObject_wasRecentlyDeletedByThisDevice__block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() deletedByThisDeviceSet];
  int v2 = [*(id *)(a1 + 32) objectID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 containsObject:v2];
}

+ (void)resetAllDeletedByThisDeviceProperties
{
  id v3 = [(id)objc_opt_class() deletedByThisDeviceOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICCloudSyncingObject_resetAllDeletedByThisDeviceProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void __61__ICCloudSyncingObject_resetAllDeletedByThisDeviceProperties__block_invoke()
{
  id v0 = [(id)objc_opt_class() deletedByThisDeviceSet];
  [v0 removeAllObjects];
}

- (void)setInCloud:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICCloudSyncingObject *)self cloudState];
  [v4 setInCloud:v3];
}

- (BOOL)isInCloud
{
  int v2 = [(ICCloudSyncingObject *)self cloudState];
  char v3 = [v2 isInCloud];

  return v3;
}

- (BOOL)isDeprecated
{
  return 0;
}

- (BOOL)needsInitialFetchFromCloudCheckingParent
{
  if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud]) {
    return 1;
  }
  id v4 = [(ICCloudSyncingObject *)self parentCloudObjectForMinimumSupportedVersionPropagation];
  char v5 = [v4 needsInitialFetchFromCloudCheckingParent];

  return v5;
}

+ (id)recordSystemFieldsTransformer
{
  if (recordSystemFieldsTransformer_onceToken != -1) {
    dispatch_once(&recordSystemFieldsTransformer_onceToken, &__block_literal_global_497);
  }
  int v2 = (void *)recordSystemFieldsTransformer_recordSystemFieldsTransformer;
  return v2;
}

void __53__ICCloudSyncingObject_recordSystemFieldsTransformer__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1A2D8], "ic_systemFieldsValueTransformer");
  uint64_t v1 = (void *)recordSystemFieldsTransformer_recordSystemFieldsTransformer;
  recordSystemFieldsTransformer_recordSystemFieldsTransformer = v0;
}

+ (id)shareSystemFieldsTransformer
{
  if (shareSystemFieldsTransformer_onceToken != -1) {
    dispatch_once(&shareSystemFieldsTransformer_onceToken, &__block_literal_global_499);
  }
  int v2 = (void *)shareSystemFieldsTransformer_shareSystemFieldsTransformer;
  return v2;
}

void __52__ICCloudSyncingObject_shareSystemFieldsTransformer__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1A390], "ic_systemFieldsValueTransformer");
  uint64_t v1 = (void *)shareSystemFieldsTransformer_shareSystemFieldsTransformer;
  shareSystemFieldsTransformer_shareSystemFieldsTransformer = v0;
}

- (void)setServerRecord:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(ICCloudSyncingObject *)self recordName];
  BOOL v7 = [v5 recordID];
  uint64_t v8 = [v7 recordName];

  if (v6 && v8 && (objc_msgSend(v8, "ic_isCaseInsensitiveEqualToString:", v6) & 1) == 0)
  {
    long long v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObject setServerRecord:]();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject setServerRecord:]" simulateCrash:1 showAlert:1 format:@"Setting server record with mismatched record name"];
  }
  else if (([(CKRecord *)self->_serverRecord isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverRecord, a3);
    if (v5)
    {
      char v9 = [(id)objc_opt_class() recordSystemFieldsTransformer];
      id v10 = [v9 transformedValue:v5];
      [(ICCloudSyncingObject *)self setServerRecordData:v10];

      long long v11 = [v5 recordID];
      long long v12 = [v11 zoneID];
      os_log_t v13 = [v12 ownerName];

      if (([v13 isEqualToString:*MEMORY[0x1E4F19C08]] & 1) == 0) {
        [(ICCloudSyncingObject *)self setZoneOwnerName:v13];
      }
    }
    else
    {
      [(ICCloudSyncingObject *)self setServerRecordData:0];
      os_log_t v13 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [(ICCloudSyncingObject *)self shortLoggingDescription];
        int v16 = 138412290;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Clearing serverRecord for: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)setServerShare:(id)a3
{
  id v7 = a3;
  if ((-[CKShare isEqual:](self->_serverShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverShare, a3);
    if (v7)
    {
      id v5 = [(id)objc_opt_class() shareSystemFieldsTransformer];
      uint64_t v6 = [v5 transformedValue:v7];
      [(ICCloudSyncingObject *)self setServerShareData:v6];
    }
    else
    {
      [(ICCloudSyncingObject *)self setServerShareData:0];
    }
    [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  }
}

- (void)setUserSpecificServerRecord:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(ICCloudSyncingObject *)self recordName];
  id v7 = (void *)v6;
  if (!v5 || !v6)
  {
LABEL_6:
    if (([(CKRecord *)self->_userSpecificServerRecord isEqual:v5] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_userSpecificServerRecord, a3);
      if (v5)
      {
        long long v14 = [(id)objc_opt_class() recordSystemFieldsTransformer];
        uint64_t v15 = [v14 transformedValue:v5];
        [(ICCloudSyncingObject *)self setUserSpecificServerRecordData:v15];
      }
      else
      {
        [(ICCloudSyncingObject *)self setUserSpecificServerRecordData:0];
      }
    }
    goto LABEL_13;
  }
  uint64_t v8 = [ICUserSpecificRecordIDParser alloc];
  char v9 = [v5 recordID];
  id v10 = [v9 recordName];
  long long v11 = [(ICUserSpecificRecordIDParser *)v8 initWithRecordName:v10];
  long long v12 = [(ICUserSpecificRecordIDParser *)v11 sharedRecordID];
  os_log_t v13 = [v12 recordName];

  if (!v13 || (objc_msgSend(v13, "ic_isCaseInsensitiveEqualToString:", v7) & 1) != 0)
  {

    goto LABEL_6;
  }
  int v16 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ICCloudSyncingObject setUserSpecificServerRecord:]();
  }

  [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObject setUserSpecificServerRecord:]" simulateCrash:1 showAlert:1 format:@"Setting user-specific server record with mismatched shared record name"];
LABEL_13:
}

- (CKRecord)userSpecificServerRecord
{
  userSpecificServerRecord = self->_userSpecificServerRecord;
  if (!userSpecificServerRecord)
  {
    id v4 = [(ICCloudSyncingObject *)self userSpecificServerRecordData];
    if (v4)
    {
      id v5 = [(id)objc_opt_class() recordSystemFieldsTransformer];
      uint64_t v6 = [v5 reverseTransformedValue:v4];
      id v7 = self->_userSpecificServerRecord;
      self->_userSpecificServerRecord = v6;
    }
    userSpecificServerRecord = self->_userSpecificServerRecord;
  }
  return userSpecificServerRecord;
}

- (void)setNeedsInitialFetchFromCloud:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICCloudSyncingObject *)self needsInitialFetchFromCloud] != a3)
  {
    [(ICCloudSyncingObject *)self willChangeValueForKey:@"needsInitialFetchFromCloud"];
    id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(ICCloudSyncingObject *)self setPrimitiveValue:v5 forKey:@"needsInitialFetchFromCloud"];

    [(ICCloudSyncingObject *)self didChangeValueForKey:@"needsInitialFetchFromCloud"];
    if (v3)
    {
      [(ICCloudSyncingObject *)self clearChangeCountWithReason:@"Set as needing initial fetch"];
    }
  }
}

- (BOOL)hasAllMandatoryFields
{
  int v2 = [(ICCloudSyncingObject *)self identifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)debugDescription
{
  v4.receiver = self;
  v4.super_class = (Class)ICCloudSyncingObject;
  int v2 = [(ICCloudSyncingObject *)&v4 description];
  return (NSString *)v2;
}

- (id)ic_loggingValues
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v4 = [(ICCloudSyncingObject *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__ICCloudSyncingObject_ic_loggingValues__block_invoke;
  v8[3] = &unk_1E64A4218;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [v4 performBlockAndWait:v8];

  id v6 = v5;
  return v6;
}

void __40__ICCloudSyncingObject_ic_loggingValues__block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v3 = [*(id *)(a1 + 40) cloudState];
  objc_super v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "inCloud"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"inCloud"];

  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [*(id *)(a1 + 40) cloudState];
  id v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "latestVersionSyncedToCloud"));
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"latestVersionSyncedToCloud"];

  uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = [*(id *)(a1 + 40) cloudState];
  id v10 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "currentLocalVersion"));
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"currentLocalVersion"];

  long long v11 = [*(id *)(a1 + 40) cloudState];
  uint64_t v12 = [v11 localVersionDate];
  os_log_t v13 = (void *)v12;
  if (v12) {
    long long v14 = (__CFString *)v12;
  }
  else {
    long long v14 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"localVersionDate"];

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "hasAllMandatoryFields"));
  [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:@"hasAllMandatoryFields"];

  if ([*(id *)(a1 + 40) wantsUserSpecificRecord])
  {
    int v16 = [*(id *)(a1 + 40) userSpecificRecordID];
    uint64_t v17 = [v16 recordName];
    uint64_t v18 = (void *)v17;
    if (v17) {
      int v19 = (__CFString *)v17;
    }
    else {
      int v19 = @"nil";
    }
    [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:@"userSpecificRecordID"];
  }
  if ([*(id *)(a1 + 40) isPasswordProtected])
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isPasswordProtected"];
    uint64_t v20 = [*(id *)(a1 + 40) cryptoInitializationVector];
    __int16 v21 = (void *)v20;
    if (v20) {
      __int16 v22 = (__CFString *)v20;
    }
    else {
      __int16 v22 = @"nil";
    }
    [*(id *)(a1 + 32) setObject:v22 forKeyedSubscript:@"cryptoInitializationVector"];

    uint64_t v23 = [*(id *)(a1 + 40) cryptoTag];
    uint64_t v24 = (void *)v23;
    if (v23) {
      uint64_t v25 = (__CFString *)v23;
    }
    else {
      uint64_t v25 = @"nil";
    }
    [*(id *)(a1 + 32) setObject:v25 forKeyedSubscript:@"cryptoTag"];

    uint64_t v26 = [*(id *)(a1 + 40) cryptoWrappedKey];
    long long v27 = (void *)v26;
    if (v26) {
      long long v28 = (__CFString *)v26;
    }
    else {
      long long v28 = @"nil";
    }
    [*(id *)(a1 + 32) setObject:v28 forKeyedSubscript:@"cryptoWrappedKey"];
  }
  if ([*(id *)(a1 + 40) markedForDeletion]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"markedForDeletion"];
  }
  if ([*(id *)(a1 + 40) needsToBePushedToCloud]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"needsToBePushedToCloud"];
  }
  if ([*(id *)(a1 + 40) needsToBeFetchedFromCloud]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"needsToBeFetchedFromCloud"];
  }
  if ([*(id *)(a1 + 40) needsInitialFetchFromCloud]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"needsInitialFetchFromCloud"];
  }
  if ([*(id *)(a1 + 40) needsToBeDeletedFromCloud]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"needsToBeDeletedFromCloud"];
  }
  if ([*(id *)(a1 + 40) failedToSyncCount] >= 1)
  {
    long long v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "failedToSyncCount"));
    [*(id *)(a1 + 32) setObject:v29 forKeyedSubscript:@"failedToSyncCount"];
  }
  if ([*(id *)(a1 + 40) numberOfPushAttemptsToWaitCount] >= 1)
  {
    long long v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberOfPushAttemptsToWaitCount"));
    [*(id *)(a1 + 32) setObject:v30 forKeyedSubscript:@"numberOfPushAttemptsToWaitCount"];
  }
  long long v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "minimumSupportedNotesVersion"));
  [*(id *)(a1 + 32) setObject:v31 forKeyedSubscript:@"minimumSupportedNotesVersion"];

  v32 = [*(id *)(a1 + 40) serverShare];

  if (v32)
  {
    int v33 = [*(id *)(a1 + 40) serverShare];
    id v34 = objc_msgSend(v33, "ic_loggingDescription");
    [*(id *)(a1 + 32) setObject:v34 forKeyedSubscript:@"serverShare"];
  }
  uint64_t v35 = [*(id *)(a1 + 40) serverRecord];

  if (v35)
  {
    id v37 = [*(id *)(a1 + 40) serverRecord];
    int64_t v36 = objc_msgSend(v37, "ic_loggingDescription");
    [*(id *)(a1 + 32) setObject:v36 forKeyedSubscript:@"serverRecord"];
  }
}

+ (id)allPasswordProtectedObjectsInContext:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithFormat:@"isPasswordProtected==YES"];
  id v6 = +[ICCloudSyncingObject ic_objectsMatchingPredicate:v5 context:v4];

  return v6;
}

+ (id)predicateForPasswordProtectedObjects
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"isPasswordProtected == YES"];
}

+ (id)predicateForInCloudObjects
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudState.inCloud == YES"];
}

+ (id)predicateForObjectsWithIdentifiers:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", a3];
}

- (void)redactAuthorAttributionsToCurrentUser
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = [(ICCloudSyncingObject *)self childCloudObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) redactAuthorAttributionsToCurrentUser];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)cloudContext
{
  int v2 = [(ICCloudSyncingObject *)self appContext];
  uint64_t v3 = [v2 cloudContext];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[ICCloudContext sharedContext];
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)needsToLoadDecryptedValues
{
  return self->_needsToLoadDecryptedValues;
}

- (BOOL)isMergingRecord
{
  return self->mergingRecord;
}

- (void)setMergingRecord:(BOOL)a3
{
  self->mergingRecord = a3;
}

- (void)setMergingUnappliedEncryptedRecord:(BOOL)a3
{
  self->mergingUnappliedEncryptedRecord = a3;
}

- (void)setCryptoStrategyForMergingEncryptedData:(id)a3
{
}

- (void)setAppContext:(id)a3
{
}

- (NSString)lastUpdateChangeCountReason
{
  return self->_lastUpdateChangeCountReason;
}

- (void)setLastUpdateChangeCountReason:(id)a3
{
}

- (id)persistedActivityEventsStorage
{
  return self->_persistedActivityEventsStorage;
}

- (void)setPersistedActivityEventsStorage:(id)a3
{
}

- (id)checklistItemToActivityEventsStorage
{
  return self->_checklistItemToActivityEventsStorage;
}

- (void)setChecklistItemToActivityEventsStorage:(id)a3
{
}

- (void)addEmailAddressesAndPhoneNumbersToAttributeSet:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
  long long v7 = [v6 participants];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v12 isCurrentUser] & 1) == 0)
        {
          os_log_t v13 = [v12 userIdentity];
          long long v14 = [v13 lookupInfo];
          uint64_t v15 = [v14 emailAddress];
          objc_msgSend(v4, "ic_addNonNilObject:", v15);

          int v16 = [v12 userIdentity];
          uint64_t v17 = [v16 lookupInfo];
          uint64_t v18 = [v17 phoneNumber];
          objc_msgSend(v5, "ic_addNonNilObject:", v18);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v4 count])
  {
    int v19 = (void *)[v4 copy];
    [v21 setEmailAddresses:v19];
  }
  if ([v5 count])
  {
    uint64_t v20 = (void *)[v5 copy];
    [v21 setPhoneNumbers:v20];
  }
}

- (NSDate)objc_shareTimestamp
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FB1B8);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  ICCloudSyncingObject.shareTimestamp.getter(v5);

  uint64_t v7 = sub_1C3DB8AF8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_1C3DB8A88();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (id)objc_timestampForChecklistItemWithIdentifier:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FB1B8);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C3DB9C38();
  uint64_t v9 = v8;
  uint64_t v10 = self;
  ICCloudSyncingObject.timestampForChecklistItem(identifier:)(v7, v9, (uint64_t)v6);

  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1C3DB8AF8();
  uint64_t v12 = *(void *)(v11 - 8);
  os_log_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    os_log_t v13 = (void *)sub_1C3DB8A88();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (id)objc_userIDForChecklistItemWithIdentifier:(id)a3
{
  uint64_t v4 = sub_1C3DB9C38();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = ICCloudSyncingObject.userIdForChecklistItem(identifier:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v10 = (void *)sub_1C3DB9BF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)persistCreateActivityEventForObject:(id)a3 inParentObject:(id)a4
{
  return sub_1C3D808AC(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, void *))ICCloudSyncingObject.persistCreateActivityEvent(forObject:inParentObject:));
}

- (id)persistMoveActivityEventForObject:(id)a3 fromParentObject:(id)a4 toParentObject:(id)a5
{
  Swift::String v8 = (ICCloudSyncingObject *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  uint64_t v12 = (void *)ICCloudSyncingObject.persistMoveActivityEvent(forObject:fromParentObject:toParentObject:)(v8, (ICCloudSyncingObject_optional *)a4, (ICCloudSyncingObject_optional *)a5);

  return v12;
}

- (id)persistCopyActivityEventForObject:(id)a3 originalObject:(id)a4 fromParentObject:(id)a5 toParentObject:(id)a6
{
  id v10 = (ICCloudSyncingObject *)a3;
  uint64_t v11 = (ICCloudSyncingObject *)a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = self;
  uint64_t v15 = (void *)ICCloudSyncingObject.persistCopyActivityEvent(forObject:originalObject:fromParentObject:toParentObject:)(v10, v11, (ICCloudSyncingObject_optional *)a5, (ICCloudSyncingObject_optional *)a6);

  return v15;
}

- (id)persistRenameActivityEventForObject:(id)a3
{
  uint64_t v5 = sub_1C3DB8AF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  Swift::String v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PersistedActivityEvent.Activities();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  id v12 = a3;
  id v13 = self;
  sub_1C3DB8AE8();
  long long v14 = ICCloudSyncingObject.persist(activity:for:timestamp:)((uint64_t)v11, (ICCloudSyncingObject *)a3, (uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1C3D8C368((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for PersistedActivityEvent.Activities);

  return v14;
}

- (id)persistDeleteActivityEventForObject:(id)a3 fromParentObject:(id)a4
{
  return sub_1C3D808AC(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, void *))ICCloudSyncingObject.persistDeleteActivityEvent(forObject:fromParentObject:));
}

- (id)persistAddParticipantActivityEventForObject:(id)a3 participant:(id)a4
{
  uint64_t v6 = (ICCloudSyncingObject *)a3;
  id v7 = a4;
  Swift::String v8 = self;
  uint64_t v9 = (void *)ICCloudSyncingObject.persistAddParticipantActivityEvent(forObject:participant:)(v6, (CKShareParticipant)v7);

  return v9;
}

- (id)persistRemoveParticipantActivityEventForObject:(id)a3 participant:(id)a4
{
  uint64_t v6 = (ICCloudSyncingObject *)a3;
  id v7 = a4;
  Swift::String v8 = self;
  uint64_t v9 = (void *)ICCloudSyncingObject.persistRemoveParticipantActivityEvent(forObject:participant:)(v6, (CKShareParticipant)v7);

  return v9;
}

- (id)persistToggleChecklistItemActivityEventForObject:(id)a3 todo:(id)a4
{
  uint64_t v7 = sub_1C3DB8AF8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PersistedActivityEvent.Activities();
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA388D90) + 48);
  uint64_t v15 = (ICCloudSyncingObject *)a3;
  id v16 = a4;
  uint64_t v17 = self;
  id v18 = objc_msgSend(v16, sel_uuid);
  sub_1C3DB8B58();

  v13[v14] = objc_msgSend(v16, sel_done);
  swift_storeEnumTagMultiPayload();
  sub_1C3DB8AE8();
  int v19 = ICCloudSyncingObject.persist(activity:for:timestamp:)((uint64_t)v13, v15, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1C3D8C368((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for PersistedActivityEvent.Activities);

  return v19;
}

- (id)persistMentionActivityEventForObject:(id)a3 mentionAttachments:(id)a4
{
  sub_1C3C4C8B4(0, &qword_1EA388DE8);
  uint64_t v6 = sub_1C3DBA018();
  uint64_t v7 = (ICCloudSyncingObject *)a3;
  uint64_t v8 = self;
  uint64_t v9 = (void *)ICCloudSyncingObject.persistMentionActivityEvent(forObject:mentionAttachments:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)objc_removeAllCloudSyncingObjectActivityEvents
{
  int v2 = self;
  ICCloudSyncingObject.removeAllCloudSyncingObjectActivityEvents()();
}

+ (void)objc_removeAllCloudSyncingObjectActivityEventsForUnsharedObjectsInContext:(id)a3
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a3;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_1C3D8C3E4;
  *(void *)(v5 + 24) = v4;
  void v8[4] = sub_1C3D8C3C8;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1C3D7A8B4;
  v8[3] = &block_descriptor_31_0;
  uint64_t v6 = _Block_copy(v8);
  id v7 = a3;
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_performBlockAndWait_, v6);
  _Block_release(v6);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  swift_release();
  if (v6) {
    __break(1u);
  }
}

- (void)assignToPersistentStore:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Trying to assign cloud object %@ to nil persistent store", v4, v5, v6, v7, v8);
}

- (void)updateChangeCountWithReason:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_30(&dword_1C3A61000, v2, v3, "Refusing to update change count for a placeholder object {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)updateChangeCountWithReason:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_30(&dword_1C3A61000, v2, v3, "Refusing to update change count during record merge {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)updateChangeCountWithReason:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Refusing to update change count for object with missing cloud state {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyUpdateChangeCountWithReason:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, long long a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_18();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_20();
  a13 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = [v26 shortLoggingDescription];
  long long v28 = (void *)MEMORY[0x1E4F28ED0];
  long long v29 = [v23 cloudState];
  long long v30 = objc_msgSend(v28, "numberWithLongLong:", objc_msgSend(v29, "currentLocalVersion"));
  OUTLINED_FUNCTION_31();
  *(void *)((char *)&a10 + 6) = v22;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_15(&dword_1C3A61000, v21, v31, "Updated change count {object: %@, reason: %@, count: %@}", &a9);

  OUTLINED_FUNCTION_21();
}

- (void)unsafelyUpdateChangeCountWithReason:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Setting change count to zero to prevent integer overflow {object: %@}", v4, v5, v6, v7, v8);
}

- (void)clearChangeCountWithReason:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Refusing to clear change count for object with missing cloud state {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyClearChangeCountWithReason:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cleared change count {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)updateUserSpecificChangeCountWithReason:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Marked user-specific record as needing sync {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)updateUserSpecificChangeCountWithReason:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Refusing to mark user-specific record as needing sync because object that doesn't want user-specific records {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)updateUserSpecificChangeCountWithReason:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Refusing to mark user-specific record as needing sync because object that doesn't support user-specific records {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)recordID
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Cannot create record ID for object without record zone name {object: %@}", v4, v5, v6, v7, v8);
}

+ (void)newObjectWithIdentifier:(os_log_t)log context:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Creating %@", buf, 0xCu);
}

+ (void)newObjectWithIdentifier:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_28(&dword_1C3A61000, v1, v2, "Entity from context %p does not equal entity from class %p", v3, v4);
}

+ (void)cloudObjectWithIdentifier:(os_log_t)log context:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Trying to fetch cloud syncing object without an identifier", v1, 2u);
}

- (void)makeCloudKitRecordForApproach:(void *)a1 mergeableFieldState:.cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Encrypted values being ignored for sync because the object (%@) says it doesn't support it.", v4, v5, v6, v7, v8);
}

- (void)makeCloudKitRecordForApproach:(void *)a1 mergeableFieldState:.cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Trying to create record without record ID for %@", v4, v5, v6, v7, v8);
}

- (void)makeCloudKitRecordForApproach:mergeableFieldState:.cold.3()
{
  OUTLINED_FUNCTION_12();
  [v1 recordName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() recordID];
  uint64_t v3 = [v2 recordName];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Object has server record with mismatched record name {objectRecordName: %@, serverRecordName: %@}", v6, v7, v8, v9, v10);
}

- (void)mergeCloudKitRecord:(void *)a1 accountID:approach:mergeableFieldState:.cold.1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot merge encrypted data from record {object: %@}", v4, v5, v6, v7, v8);
}

- (void)mergeCloudKitRecord:(void *)a1 accountID:approach:mergeableFieldState:.cold.2(void *a1)
{
  uint64_t v7 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_29(&dword_1C3A61000, v1, v2, "Setting marked for deletion to %d when merging data from record: %@", v3, v4, v5, v6, 2u);
}

- (void)mergeCloudKitRecord:accountID:approach:mergeableFieldState:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend(v0, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  id v3 = v2;
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Merging incoming record (identifier=%@, approach=%@)", v6, v7, v8, v9, v10);
}

- (void)mergeCloudKitRecord:accountID:approach:mergeableFieldState:.cold.4()
{
  OUTLINED_FUNCTION_12();
  [v1 recordID];
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4_2() recordID];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Incoming record (%@) does not match local record (%@)", v5, v6, v7, v8, v9);
}

- (void)unappliedEncryptedRecord
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  __int16 v5 = 2080;
  uint64_t v6 = "-[ICCloudSyncingObject unappliedEncryptedRecord]";
  __int16 v7 = 1024;
  int v8 = 971;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Unarchiving unapplied encrypted record… {object: %@}%s:%d", v4, 0x1Cu);
}

- (void)setUnappliedEncryptedRecord:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error archiving unapplied encrypted record {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)setUnappliedEncryptedRecord:(void *)a1 .cold.2(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot set unapplied encrypted record for an object that is not password-protected {object: %@}", v4, v5, v6, v7, v8);
}

- (void)setUnappliedEncryptedRecord:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [v2 shortLoggingDescription];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:v1 != 0];
  int v5 = 138413058;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  __int16 v9 = 2080;
  uint8_t v8 = v4;
  uint8_t v10 = "-[ICCloudSyncingObject setUnappliedEncryptedRecord:]";
  __int16 v11 = 1024;
  int v12 = 988;
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Setting unapplied encrypted record… {object: %@, hasRecord: %@}%s:%d", (uint8_t *)&v5, 0x26u);
}

- (void)mergeCryptoFieldsFromRecord:.cold.1()
{
  OUTLINED_FUNCTION_12();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "ic_loggingDescription");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Merging crypto info for object (%@): %@", v5, v6, v7, v8, v9);
}

- (void)needsToBePushedToCloud
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not pushing because we already have an operation pushing this version %@", v4, v5, v6, v7, v8);
}

- (void)objectWasFetchedFromCloudWithRecord:(void *)a1 accountID:force:.cold.1(void *a1)
{
  id v1 = [a1 serverShare];
  uint64_t v2 = objc_msgSend(v1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v3, v4, "Object fetched does not have a share removing our severShare: %@", v5, v6, v7, v8, v9);
}

- (void)objectWasFetchedFromCloudWithRecord:(void *)a1 accountID:force:.cold.2(void *a1)
{
  id v1 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Object fetched is older or equal to then our current record: %@", v4, v5, v6, v7, v8);
}

- (void)objectWasFetchedFromCloudWithRecord:(void *)a1 accountID:force:.cold.3(void *a1)
{
  id v1 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not merging fetched record with same change tag %@", v4, v5, v6, v7, v8);
}

- (void)activityEventsDocument
{
  id v1 = [a1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Trying to access activity events document on an object that doesn't support it — returning nil {objectID: %@}", v4, v5, v6, v7, v8);
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:.cold.1()
{
  OUTLINED_FUNCTION_4();
  [v0 minimumSupportedNotesVersion];
  OUTLINED_FUNCTION_4_2();
  [(id)objc_opt_class() currentNotesVersion];
  id v1 = [(id)OUTLINED_FUNCTION_5() shortLoggingDescription];
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "minimumSupportedVersion: Not evaluating because (%lld) is unsupported (%lld): %@", v4, v5, v6, v7, v8);
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:(void *)a1 .cold.2(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "minimumSupportedVersion: Not evaluating because object is a placeholder: %@", v4, v5, v6, v7, v8);
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  [v1 minimumSupportedNotesVersion];
  uint64_t v2 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v3, v4, "Upgrading minimumSupportedNotesVersion from %lld to %lld for object: %@", v5, v6, v7, v8, 2u);
}

- (void)replicaIDToNotesVersion
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectID];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_FAULT, "Trying to access Notes version tracking on an object that doesn't support it — returning nil {objectID: %@}", v4, 0xCu);
}

- (void)updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded
{
  id v1 = [a1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not authenticated for object — not updating replica ID to Notes version {objectID: %@}", v4, v5, v6, v7, v8);
}

- (void)userSpecificRecordID
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Cannot create user-specific record ID for object without user record name {object: %@}", v4, v5, v6, v7, v8);
}

- (void)makeUserSpecificCloudKitRecordForApproach:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 recordName];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Object has user-specific server record with mismatched record name {objectRecordName: %@, serverRecordName: %@}", v4, v5, v6, v7, v8);
}

- (void)didFetchUserSpecificRecord:accountID:force:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 userSpecificServerRecord];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "didFetchUserSpecificRecord:accountID:force: :: Local user specific server record is invalid, will replace local record with server record. Local record = %@, server record = %@", v4, v5, v6, v7, v8);
}

- (void)didFetchUserSpecificRecord:(uint64_t)a1 accountID:(void *)a2 force:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Fetched user-specific record that was older than our current one for account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)didFetchUserSpecificRecord:(uint64_t)a1 accountID:(void *)a2 force:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Not merging user-specific record with same change tag for account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)didFailToSaveUserSpecificRecordWithID:accountID:error:.cold.1()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend(v1, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "User-specific record (%@) synced down but local user-specific record ID is nil when merging oplock result: %@", v5, v6, v7, v8, v9);
}

+ (void)assetForData:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error writing temporary asset file {error: %@}", v2);
}

+ (void)assetForURL:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_28(&dword_1C3A61000, v0, v1, "Cloned source file (%@) to temporary asset file (%@)");
}

+ (void)assetForTemporaryURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Created temporary asset for file URL: %@", v1, 0xCu);
}

+ (void)dataForAsset:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error reading data for CKAsset with nil fileURL.", v1, 2u);
}

+ (void)dataForAsset:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error reading temporary asset file {error: %@}", v2);
}

void __50__ICCloudSyncingObject_temporaryAssetDirectoryURL__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error creating temporary assets directory: %@", v2);
}

+ (void)deleteTemporaryFilesForAsset:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error deleting file for temporary asset: %@", v2);
}

void __65__ICCloudSyncingObject_deleteAllTemporaryAssetFilesForAllObjects__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error while enumerating all temporary asset files: %@", v2);
}

- (void)shouldBeDeletedFromLocalDatabase
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Attempted to purge an object (%@) that isn't deletable", v4, v5, v6, v7, v8);
}

- (void)setMarkedForDeletion:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint8_t v8 = [a2 shortLoggingDescription];
  OUTLINED_FUNCTION_29(&dword_1C3A61000, v2, v3, "Setting markedForDeletion %d on %@", v4, v5, v6, v7, 2u);
}

- (void)setServerShareIfNewer:.cold.1()
{
  OUTLINED_FUNCTION_12();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "ic_loggingDescription");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "No server share for %@, setting to %@", v5, v6, v7, v8, v9);
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_20();
  a14 = *MEMORY[0x1E4F143B8];
  [v27 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  long long v28 = [(id)OUTLINED_FUNCTION_33() serverShare];
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  long long v29 = objc_msgSend((id)OUTLINED_FUNCTION_17(), "ic_loggingDescription");
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15(&dword_1C3A61000, v23, v30, "Existing server share for %@ %@ has the same change tag as %@", &a9);

  OUTLINED_FUNCTION_21();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_20();
  a14 = *MEMORY[0x1E4F143B8];
  [v27 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  long long v28 = [(id)OUTLINED_FUNCTION_33() serverShare];
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  long long v29 = objc_msgSend((id)OUTLINED_FUNCTION_17(), "ic_loggingDescription");
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15(&dword_1C3A61000, v23, v30, "Existing server share for %@ %@ is newer than %@", &a9);

  OUTLINED_FUNCTION_21();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_20();
  a14 = *MEMORY[0x1E4F143B8];
  [v27 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  long long v28 = [(id)OUTLINED_FUNCTION_33() serverShare];
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  long long v29 = objc_msgSend((id)OUTLINED_FUNCTION_17(), "ic_loggingDescription");
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15(&dword_1C3A61000, v23, v30, "Replacing old server share for %@ %@ with %@", &a9);

  OUTLINED_FUNCTION_21();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_20();
  a14 = *MEMORY[0x1E4F143B8];
  [v27 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  long long v28 = [(id)OUTLINED_FUNCTION_33() serverShare];
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  long long v29 = objc_msgSend((id)OUTLINED_FUNCTION_17(), "ic_loggingDescription");
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15(&dword_1C3A61000, v23, v30, "Replacing server share without metadata for %@ %@ with %@", &a9);

  OUTLINED_FUNCTION_21();
}

- (void)markShareDirtyIfNeededWithReason:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Marked share as needing sync {object: %@, reason: %@}", v4, v5, v6, v7, v8);
}

- (void)cryptoStrategy
{
  OUTLINED_FUNCTION_4();
  id v1 = [v0 cryptoStrategyForMergingEncryptedData];
  objc_opt_class();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() shortLoggingDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Using overridden crypto strategy (%@) for merging object: %@", v5, v6, v7, v8, 2u);
}

- (void)setEncryptedValuesJSON:.cold.1()
{
  OUTLINED_FUNCTION_12();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "encryptedValuesJSON changed for object (%@): encryptedValuesJSON.hash = %lu", v4, v5, v6, v7, v8);
}

- (void)serializedValuesToEncrypt
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v2 = [v1 className];
  uint64_t v3 = [v0 identifier];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Error converting decrypted values to JSON for %@ (%@): %@", v6, v7, v8, v9, v10);
}

void __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Converting %@ to base 64 for JSON, but it's not marked as data", v2);
}

- (void)deserializeAndMergeValues:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v2 = [v1 className];
  uint64_t v3 = [v0 identifier];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Error parsing decrypted JSON for %@ (%@): %@", v6, v7, v8, v9, v10);
}

- (void)mergeUnappliedEncryptedRecord
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error merging unapplied encrypted record {object: %@}", v4, v5, v6, v7, v8);
}

- (void)mergeDecryptedValue:(uint64_t)a1 withOldValue:(void *)a2 forKey:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Failed to merge decrypted value for key (%@): %@", v5, v6, v7, v8, 2u);
}

- (void)setServerRecord:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Setting server record with mismatched record name {objectRecordName: %@, serverRecordName: %@}");
}

- (void)setUserSpecificServerRecord:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Setting user-specific server record with mismatched shared record name {serverRecordName: %@, objectRecordName: %@}");
}

@end