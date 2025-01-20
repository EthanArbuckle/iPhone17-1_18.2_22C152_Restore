@interface ICAccount
+ (BOOL)clearAccountForAppleCloudKitTable;
+ (BOOL)hasActiveCloudKitAccountInContext:(id)a3;
+ (BOOL)hasModernAccountInContext:(id)a3;
+ (BOOL)hidesCallNotesInCustomFolders;
+ (BOOL)hidesMathNotesInCustomFolders;
+ (BOOL)hidesSystemPaperNotesInCustomFolders;
+ (BOOL)isCloudKitAccountAvailable;
+ (BOOL)isCloudKitAccountAvailableInContext:(id)a3;
+ (ICAccount)accountWithIdentifier:(id)a3 context:(id)a4;
+ (ICAccountUtilities)accountUtilities;
+ (id)accountsWithAccountType:(int)a3 context:(id)a4;
+ (id)activeAccountWithUserRecordName:(id)a3 context:(id)a4;
+ (id)allAccountIdentifiersInContext:(id)a3;
+ (id)allAccountsInContext:(id)a3;
+ (id)allActiveAccountsInContext:(id)a3;
+ (id)allActiveAccountsInContext:(id)a3 sortDescriptors:(id)a4 relationshipKeyPathsForPrefetching:(id)a5;
+ (id)allActiveAccountsInContextSortedByAccountType:(id)a3;
+ (id)allActiveAccountsInContextWithDefaultBeingFirstIfApplicable:(id)a3;
+ (id)allActiveCloudKitAccountsInContext:(id)a3;
+ (id)allCloudKitAccountsInContext:(id)a3;
+ (id)allCloudObjectIDsInContext:(id)a3 passingTest:(id)a4;
+ (id)cloudKitAccountInContext:(id)a3;
+ (id)cloudKitAccountWithIdentifier:(id)a3 context:(id)a4;
+ (id)cloudKitIfMigratedElseLocalAccountInContext:(id)a3;
+ (id)defaultAccountInContext:(id)a3;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)inMemoryAccountInContext:(id)a3;
+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud;
+ (id)keyPathsForValuesAffectingLocalizedName;
+ (id)keyPathsForValuesAffectingVisibleNoteContainerChildren;
+ (id)localAccountInContext:(id)a3;
+ (id)localizedLocalAccountName;
+ (id)localizedLocalAccountNameMidSentence;
+ (id)mostRecentSystemPaperNoteInManagedObjectContext:(id)a3;
+ (id)newAccountWithIdentifier:(id)a3 type:(int)a4 context:(id)a5;
+ (id)newAccountWithIdentifier:(id)a3 type:(int)a4 context:(id)a5 persistentStore:(id)a6;
+ (id)newLocalAccountInContext:(id)a3;
+ (id)passwordProtectedNoteIdentifiersInAccountIdentifier:(id)a3 context:(id)a4;
+ (id)standardFolderIdentifierWithPrefix:(id)a3 accountIdentifier:(id)a4 accountType:(int)a5;
+ (unint64_t)numberOfCloudKitAccountsInContext:(id)a3 onlyMigrated:(BOOL)a4;
+ (void)deleteAccount:(id)a3;
+ (void)deleteAccountWithBatchDelete:(id)a3;
+ (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6;
+ (void)initialize;
+ (void)initializeLocalAccountNamesInBackground;
+ (void)localeDidChange:(id)a3;
+ (void)setAccountUtilities:(id)a3;
+ (void)setHidesCallNotesInCustomFolders:(BOOL)a3;
+ (void)setHidesMathNotesInCustomFolders:(BOOL)a3;
+ (void)setHidesSystemPaperNotesInCustomFolders:(BOOL)a3;
- (BOOL)allowsExporting;
- (BOOL)allowsImporting;
- (BOOL)canBeSharedViaICloud;
- (BOOL)canHaveCryptoStrategy;
- (BOOL)canPasswordProtectNotes;
- (BOOL)containsSharedFolders;
- (BOOL)cryptoStrategyIsTransient;
- (BOOL)didAddObservers;
- (BOOL)didAddTrashObservers;
- (BOOL)hasAnyCustomFoldersIncludingSystem:(BOOL)a3;
- (BOOL)isAllNotesContainer;
- (BOOL)isDataSeparated;
- (BOOL)isDeletable;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isInICloudAccount;
- (BOOL)isLeaf;
- (BOOL)isLocalAccount;
- (BOOL)isManaged;
- (BOOL)isMovable;
- (BOOL)isPrimaryiCloudAccount;
- (BOOL)isShowingDateHeaders;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)needsToBeDeletedFromCloud;
- (BOOL)needsToBePushedToCloud;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (BOOL)shouldBeDeletedFromLocalDatabase;
- (BOOL)shouldExcludeFilesFromCloudBackup;
- (BOOL)supportsDateHeaders;
- (BOOL)supportsEditingNotes;
- (BOOL)supportsLegacyTombstones;
- (BOOL)visibleRootFoldersContainFolderWithTitle:(id)a3;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (ICAccountProxy)accountProxy;
- (ICFolder)defaultFolder;
- (ICFolder)trashFolder;
- (NSArray)authorsExcludingCurrentUser;
- (NSDate)lastSyncDate;
- (NSPersistentStore)persistentStore;
- (NSPersonNameComponents)fullName;
- (NSString)altDSID;
- (NSString)dataSourceIdentifier;
- (NSString)dsid;
- (NSString)localizedName;
- (NSString)primaryEmail;
- (NSString)recordType;
- (NSString)searchIndexingIdentifier;
- (NSString)username;
- (id)accountDataCreateIfNecessary;
- (id)accountFilesDirectoryURL;
- (id)accountFilesDirectoryURLInApplicationDataContainer;
- (id)allChildObjects;
- (id)allItemsFolderLocalizedTitle;
- (id)cacheKey;
- (id)cryptoStrategyProtocol;
- (id)customNoteSortTypeValue;
- (id)customRootLevelFolders;
- (id)dataForTypeIdentifier:(id)a3;
- (id)defaultFolderIdentifier;
- (id)exportableMediaDirectoryURL;
- (id)fallbackImageDirectoryURL;
- (id)fallbackPDFDirectoryURL;
- (id)fileURLForTypeIdentifier:(id)a3;
- (id)folderWithIdentifier:(id)a3;
- (id)ic_loggingIdentifier;
- (id)ic_loggingValues;
- (id)localizedNameMidSentence;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)mediaDirectoryURL;
- (id)passwordProtectedNotes;
- (id)predicateForAttachmentsInAccount;
- (id)predicateForCustomFolders;
- (id)predicateForFolders;
- (id)predicateForNotesInAccount;
- (id)predicateForPinnedNotes;
- (id)predicateForSearchableAttachments;
- (id)predicateForVisibleAttachments;
- (id)predicateForVisibleAttachmentsIncludingTrash;
- (id)predicateForVisibleFolders;
- (id)predicateForVisibleNotes;
- (id)predicateForVisibleNotesIncludingTrash;
- (id)previewImageDirectoryURL;
- (id)recordZoneName;
- (id)replicaIDForBundleIdentifier:(id)a3;
- (id)reservedAccountFolderTitles;
- (id)searchableTextContent;
- (id)standardFolderIdentifierWithPrefix:(id)a3;
- (id)subFolderIdentifiersOrderedSet;
- (id)subFolderOrderMergeableData;
- (id)systemPaperBundlesDirectoryURL;
- (id)systemPaperDirectoryURL;
- (id)systemPaperNotes;
- (id)systemPaperTemporaryDirectoryURL;
- (id)temporaryDirectoryURL;
- (id)trashFolderIdentifier;
- (id)uniqueUserParticipants;
- (id)visibleFolders;
- (id)visibleFoldersWithParent:(id)a3;
- (id)visibleNoteContainerChildren;
- (id)visibleNoteContainers;
- (id)visibleNotes;
- (id)visibleSubFolders;
- (int64_t)compare:(id)a3;
- (int64_t)visibilityTestingType;
- (signed)resolvedLockedNotesMode;
- (unint64_t)indexOfCustomRootLevelFolder:(id)a3;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (unint64_t)visibleAttachmentsIncludingTrashCount;
- (unint64_t)visibleCustomFoldersCount;
- (unint64_t)visibleInCloudNotesIncludingTrashCount;
- (unint64_t)visibleNotesCount;
- (unint64_t)visibleNotesIncludingTrashCount;
- (void)addTrashObserversIfNecessary;
- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)createDefaultFolder;
- (void)createStandardFolders;
- (void)createTrashFolder;
- (void)dealloc;
- (void)deleteUnusedHashtagsWithStandardizedContent:(id)a3;
- (void)ensureCriticalPaperDirectoriesExist;
- (void)managedObjectContextDidSave:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performBlockInPersonaContext:(id)a3;
- (void)performBlockInPersonaContextIfNecessary:(id)a3;
- (void)prepareForDeletion;
- (void)removeTrashObserversIfNecessary;
- (void)setAccountProxy:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setDefaultFolder:(id)a3;
- (void)setDidAddObservers:(BOOL)a3;
- (void)setDidAddTrashObservers:(BOOL)a3;
- (void)setDidChooseToMigrate:(BOOL)a3;
- (void)setFullName:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPrimaryEmail:(id)a3;
- (void)setResolvedLockedNotesMode:(signed __int16)a3;
- (void)setSubFolderOrderMergeableData:(id)a3;
- (void)setTrashFolder:(id)a3;
- (void)setUserRecordName:(id)a3;
- (void)systemPaperTemporaryDirectoryURL;
- (void)uniqueUserParticipants;
- (void)updateAccountNameForAccountListSorting;
- (void)updateFullNameAndEmail:(id)a3;
- (void)updateSubFolderMergeableDataChangeCount;
- (void)updateTrashFolderHiddenNoteContainerState;
- (void)willTurnIntoFault;
@end

@implementation ICAccount

id __64__ICAccount_Management__initializeLocalAccountNamesInBackground__block_invoke()
{
  id v0 = +[ICAccount localizedLocalAccountName];
  return +[ICAccount localizedLocalAccountNameMidSentence];
}

- (NSString)localizedName
{
  v3 = [(ICAccount *)self identifier];
  int v4 = [v3 isEqualToString:@"InMemoryAccount"];

  if (v4 || [(ICAccount *)self accountType] != 3)
  {
    v5 = [(ICAccount *)self name];
  }
  else
  {
    v5 = +[ICAccount localizedLocalAccountName];
  }
  return (NSString *)v5;
}

+ (id)localizedLocalAccountName
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  v3 = (void *)localizedLocalAccountName;
  if (localizedLocalAccountName) {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = +[ICAccount localizedLocalAccountNameMidSentence:0];
    v5 = (void *)localizedLocalAccountName;
    localizedLocalAccountName = v4;

    v3 = (void *)localizedLocalAccountName;
LABEL_4:
    v6 = v3;
    goto LABEL_5;
  }
  v6 = @"On My Device";
LABEL_5:
  objc_sync_exit(v2);

  return v6;
}

- (id)mediaDirectoryURL
{
  v2 = [(ICAccount *)self accountFilesDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83630] isDirectory:1];

  return v3;
}

- (id)accountFilesDirectoryURL
{
  v3 = [(id)objc_opt_class() accountUtilities];
  uint64_t v4 = [(ICAccount *)self identifier];
  v5 = [v3 applicationDocumentsURLForAccountIdentifier:v4];

  uint64_t v6 = [(ICAccount *)self identifier];
  if (v6
    && (v7 = (void *)v6,
        char v8 = [(ICAccount *)self storeDataSeparately],
        v7,
        (v8 & 1) != 0))
  {
    v9 = [v5 URLByAppendingPathComponent:*MEMORY[0x1E4F83650] isDirectory:1];

    v10 = [(ICAccount *)self identifier];
    id v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:1];
  }
  else
  {
    id v11 = v5;
    v9 = v11;
  }

  return v11;
}

+ (ICAccountUtilities)accountUtilities
{
  v2 = (void *)_accountUtilities;
  if (!_accountUtilities)
  {
    uint64_t v3 = [MEMORY[0x1E4F836D8] sharedInstance];
    uint64_t v4 = (void *)_accountUtilities;
    _accountUtilities = v3;

    v2 = (void *)_accountUtilities;
  }
  return (ICAccountUtilities *)v2;
}

- (id)standardFolderIdentifierWithPrefix:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(ICAccount *)self identifier];
  v7 = objc_msgSend(v5, "standardFolderIdentifierWithPrefix:accountIdentifier:accountType:", v4, v6, -[ICAccount accountType](self, "accountType"));

  return v7;
}

+ (id)standardFolderIdentifierWithPrefix:(id)a3 accountIdentifier:(id)a4 accountType:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    if (a5 == 1) {
      v10 = @"CloudKit";
    }
    else {
      v10 = (__CFString *)v8;
    }
    v12 = [NSString stringWithFormat:@"%@-%@", v7, v10];
  }
  else
  {
    id v11 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount standardFolderIdentifierWithPrefix:accountIdentifier:accountType:]();
    }

    v12 = 0;
  }

  return v12;
}

- (id)subFolderIdentifiersOrderedSet
{
  id v3 = [(ICAccount *)self accountDataCreateIfNecessary];
  id v4 = [(ICAccount *)self accountData];

  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.accountData) != nil)", "-[ICAccount subFolderIdentifiersOrderedSet]", 1, 0, @"Expected non-nil value for '%s'", "self.accountData");
  }
  v7.receiver = self;
  v7.super_class = (Class)ICAccount;
  v5 = [(ICNoteContainer *)&v7 subFolderIdentifiersOrderedSet];
  return v5;
}

- (id)accountDataCreateIfNecessary
{
  id v3 = [(ICAccount *)self accountData];

  if (!v3)
  {
    id v4 = +[ICAccountData newAccountDataForAccount:self];
    [(ICAccount *)self setAccountData:v4];
  }
  v5 = [(ICAccount *)self accountData];
  int v6 = [v5 markedForDeletion];

  if (v6)
  {
    objc_super v7 = [(ICAccount *)self accountData];
    [v7 setMarkedForDeletion:0];
  }
  return (id)[(ICAccount *)self accountData];
}

- (id)subFolderOrderMergeableData
{
  v2 = [(ICAccount *)self accountData];
  id v3 = [v2 mergeableData];

  return v3;
}

+ (id)localizedLocalAccountNameMidSentence
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (void *)localizedLocalAccountNameMidSentence;
  if (localizedLocalAccountNameMidSentence) {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = +[ICAccount localizedLocalAccountNameMidSentence:1];
    v5 = (void *)localizedLocalAccountNameMidSentence;
    localizedLocalAccountNameMidSentence = v4;

    id v3 = (void *)localizedLocalAccountNameMidSentence;
LABEL_4:
    int v6 = v3;
    goto LABEL_5;
  }
  int v6 = @"on my device";
LABEL_5:
  objc_sync_exit(v2);

  return v6;
}

- (id)replicaIDForBundleIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ICAccount *)self managedObjectContext];
  uint64_t v6 = [v5 concurrencyType];

  if (v6 == 2)
  {
    objc_super v7 = [(ICAccount *)self replicaIDToBundleIdentifier];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v9 = objc_msgSend((id)objc_opt_class(), "bundleIdentifiersWithReplicaID", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            v15 = [MEMORY[0x1E4F29128] UUID];
            [v8 setObject:v15 forKeyedSubscript:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }

      v16 = (void *)[v8 copy];
      [(ICAccount *)self setReplicaIDToBundleIdentifier:v16];
    }
    v17 = [(ICAccount *)self replicaIDToBundleIdentifier];
    v18 = [v17 objectForKeyedSubscript:v4];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)canBeSharedViaICloud
{
  return 0;
}

- (BOOL)isManaged
{
  id v3 = [(ICAccount *)self identifier];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  v5 = +[ICAccount accountUtilities];
  uint64_t v6 = [(ICAccount *)self identifier];
  char v7 = [v5 isManagedACAccountWithIdentifier:v6];

  return v7;
}

- (BOOL)isPrimaryiCloudAccount
{
  id v3 = [(ICAccount *)self identifier];
  if ([v3 length])
  {
    int v4 = [(ICAccount *)self accountType];

    if (v4 != 1) {
      return 0;
    }
    id v3 = +[ICAccount accountUtilities];
    v5 = [(ICAccount *)self identifier];
    uint64_t v6 = [v3 iCloudACAccountWithIdentifier:v5];
    char v7 = objc_msgSend(v6, "ic_isPrimaryAppleAccount");
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)awakeFromFetch
{
  v5.receiver = self;
  v5.super_class = (Class)ICAccount;
  [(ICCloudSyncingObject *)&v5 awakeFromFetch];
  id v3 = [(ICAccount *)self identifier];
  int v4 = [v3 isEqualToString:@"LocalAccount"];

  if (v4) {
    [(ICAccount *)self setAccountType:3];
  }
}

- (void)setAccountType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(ICAccount *)self accountType] != a3)
  {
    [(ICAccount *)self willChangeValueForKey:@"accountType"];
    objc_super v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
    [(ICAccount *)self setPrimitiveValue:v5 forKey:@"accountType"];

    [(ICAccount *)self didChangeValueForKey:@"accountType"];
    [(ICAccount *)self updateAccountNameForAccountListSorting];
  }
}

- (BOOL)isShowingDateHeaders
{
  BOOL v2 = [(ICAccount *)self supportsDateHeaders];
  if (v2) {
    LOBYTE(v2) = [MEMORY[0x1E4F83730] defaultDateHeadersType] == 2;
  }
  return v2;
}

- (BOOL)supportsDateHeaders
{
  BOOL v2 = [(ICNoteContainer *)self customNoteSortType];
  BOOL v3 = [v2 resolvedCustomSortTypeOrder] != 3;

  return v3;
}

uint64_t __54__ICAccount_updateTrashFolderHiddenNoteContainerState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) visibleNotesCount];
    uint64_t result = [*(id *)(a1 + 32) isHiddenNoteContainer];
    if ((v3 == 0) != result)
    {
      int v4 = *(void **)(a1 + 32);
      return [v4 setIsHiddenNoteContainer:v3 == 0];
    }
  }
  return result;
}

- (unint64_t)visibleNotesIncludingTrashCount
{
  uint64_t v3 = [(ICAccount *)self predicateForVisibleNotesIncludingTrash];
  int v4 = [(ICAccount *)self managedObjectContext];
  unint64_t v5 = +[ICNote countOfNotesMatchingPredicate:v3 context:v4];

  return v5;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  int v4 = [(ICAccount *)self name];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(ICAccount *)self willChangeValueForKey:@"name"];
    [(ICAccount *)self setPrimitiveValue:v6 forKey:@"name"];
    [(ICAccount *)self didChangeValueForKey:@"name"];
    [(ICAccount *)self updateAccountNameForAccountListSorting];
  }
}

- (id)predicateForVisibleNotesIncludingTrash
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  int v4 = [(ICAccount *)self predicateForNotesInAccount];
  v10[0] = v4;
  char v5 = [(ICAccount *)self managedObjectContext];
  id v6 = +[ICNote predicateForVisibleNotesIncludingTrash:1 includingSystemPaper:1 includingMathNotes:1 includingCallNotes:1 inContext:v5];
  v10[1] = v6;
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v3 andPredicateWithSubpredicates:v7];

  return v8;
}

- (BOOL)hasAnyCustomFoldersIncludingSystem:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v5 = [(ICAccount *)self visibleFolders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v3)
        {
          uint64_t v11 = [(ICAccount *)self trashFolder];
          if ([v10 isEqual:v11])
          {
          }
          else
          {
            uint64_t v12 = [(ICAccount *)self defaultFolder];
            int v13 = [v10 isEqual:v12];

            if (!v13)
            {
LABEL_15:
              BOOL v14 = 1;
              goto LABEL_16;
            }
          }
        }
        else if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isModernCustomFolder])
        {
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

- (id)visibleFolders
{
  BOOL v3 = [(ICAccount *)self predicateForVisibleFolders];
  int v4 = [(ICAccount *)self managedObjectContext];
  char v5 = +[ICFolder foldersMatchingPredicate:v3 context:v4];

  return v5;
}

- (id)predicateForVisibleFolders
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28BA0]);
  int v4 = [(ICAccount *)self managedObjectContext];
  char v5 = +[ICFolder predicateForVisibleFoldersInContext:v4];
  v10[0] = v5;
  uint64_t v6 = [(ICAccount *)self predicateForFolders];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = (void *)[v3 initWithType:1 subpredicates:v7];

  return v8;
}

- (id)predicateForFolders
{
  BOOL v2 = (void *)MEMORY[0x1E4F28F60];
  id v3 = [(ICAccount *)self identifier];
  int v4 = [v2 predicateWithFormat:@"account.identifier == %@", v3];

  return v4;
}

- (ICFolder)defaultFolder
{
  defaultFolder = self->_defaultFolder;
  if (!defaultFolder)
  {
    int v4 = [(ICAccount *)self defaultFolderIdentifier];
    char v5 = [(ICAccount *)self folderWithIdentifier:v4];
    uint64_t v6 = self->_defaultFolder;
    self->_defaultFolder = v5;

    uint64_t v7 = self->_defaultFolder;
    if (!v7)
    {
      [(ICAccount *)self createDefaultFolder];
      uint64_t v7 = self->_defaultFolder;
    }
    int v8 = [(ICFolder *)v7 markedForDeletion];
    defaultFolder = self->_defaultFolder;
    if (v8)
    {
      [(ICFolder *)defaultFolder setMarkedForDeletion:0];
      defaultFolder = self->_defaultFolder;
    }
  }
  return defaultFolder;
}

- (id)defaultFolderIdentifier
{
  return [(ICAccount *)self standardFolderIdentifierWithPrefix:@"DefaultFolder"];
}

+ (BOOL)hasActiveCloudKitAccountInContext:(id)a3
{
  return +[ICAccount numberOfCloudKitAccountsInContext:a3 onlyMigrated:1] != 0;
}

unint64_t __61__ICAccount_Management__isCloudKitAccountAvailableInContext___block_invoke(uint64_t a1)
{
  unint64_t result = +[ICAccount numberOfCloudKitAccountsInContext:*(void *)(a1 + 32) onlyMigrated:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)updateTrashFolderHiddenNoteContainerState
{
  BOOL v2 = [(ICAccount *)self trashFolder];
  id v3 = [v2 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ICAccount_updateTrashFolderHiddenNoteContainerState__block_invoke;
  v5[3] = &unk_1E64A4240;
  id v6 = v2;
  id v4 = v2;
  [v3 performBlockAndWait:v5];
}

- (void)addTrashObserversIfNecessary
{
  if ([(ICCloudSyncingObject *)self hasContextOptions:721457])
  {
    if (![(ICAccount *)self didAddTrashObservers])
    {
      id v3 = [(ICAccount *)self trashFolder];

      if (v3)
      {
        id v4 = [(ICAccount *)self trashFolder];
        objc_msgSend(v4, "ic_addObserver:forKeyPath:context:explicitOptions:", self, @"notes", compoundliteral, 4);

        [(ICAccount *)self setDidAddTrashObservers:1];
        id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v5 = *MEMORY[0x1E4F1BE28];
        id v6 = [(ICAccount *)self managedObjectContext];
        [v7 addObserver:self selector:sel_managedObjectContextDidSave_ name:v5 object:v6];
      }
    }
  }
}

- (void)dealloc
{
  [(ICAccount *)self removeAllObserversIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)ICAccount;
  [(ICAccount *)&v3 dealloc];
}

- (void)willTurnIntoFault
{
  v5.receiver = self;
  v5.super_class = (Class)ICAccount;
  [(ICNoteContainer *)&v5 willTurnIntoFault];
  [(ICAccount *)self removeAllObserversIfNecessary];
  trashFolder = self->_trashFolder;
  self->_trashFolder = 0;

  defaultFolder = self->_defaultFolder;
  self->_defaultFolder = 0;
}

- (void)removeTrashObserversIfNecessary
{
  if ([(ICAccount *)self didAddTrashObservers])
  {
    objc_super v3 = [(ICAccount *)self trashFolder];
    objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, @"notes", compoundliteral);

    [(ICAccount *)self setDidAddTrashObservers:0];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4F1BE28];
    objc_super v5 = [(ICAccount *)self managedObjectContext];
    [v6 removeObserver:self name:v4 object:v5];
  }
}

- (BOOL)didAddTrashObservers
{
  return self->_didAddTrashObservers;
}

- (ICFolder)trashFolder
{
  trashFolder = self->_trashFolder;
  if (!trashFolder)
  {
    uint64_t v4 = [(ICAccount *)self trashFolderIdentifier];
    objc_super v5 = [(ICAccount *)self folderWithIdentifier:v4];
    id v6 = self->_trashFolder;
    self->_trashFolder = v5;

    id v7 = self->_trashFolder;
    if (!v7)
    {
      [(ICAccount *)self createTrashFolder];
      id v7 = self->_trashFolder;
    }
    if ([(ICFolder *)v7 markedForDeletion]) {
      [(ICFolder *)self->_trashFolder setMarkedForDeletion:0];
    }
    [(ICAccount *)self addTrashObserversIfNecessary];
    trashFolder = self->_trashFolder;
  }
  return trashFolder;
}

- (id)trashFolderIdentifier
{
  return [(ICAccount *)self standardFolderIdentifierWithPrefix:@"TrashFolder"];
}

- (void)setDidAddTrashObservers:(BOOL)a3
{
  self->_didAddTrashObservers = a3;
}

+ (id)localAccountInContext:(id)a3
{
  objc_super v3 = [a1 accountWithIdentifier:@"LocalAccount" context:a3];
  uint64_t v4 = v3;
  if (v3 && ([v3 didChooseToMigrate] & 1) == 0) {
    [v4 setDidChooseToMigrate:1];
  }
  return v4;
}

+ (ICAccount)accountWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  int v8 = [v6 predicateWithFormat:@"identifier == %@", a3];
  v9 = [a1 accountsMatchingPredicate:v8 context:v7];

  uint64_t v10 = [v9 firstObject];

  return (ICAccount *)v10;
}

- (id)folderWithIdentifier:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", a3];
  v12[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"account", self];
  v12[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  id v7 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  int v8 = [(ICAccount *)self managedObjectContext];
  v9 = +[ICFolder foldersMatchingPredicate:v7 context:v8];
  uint64_t v10 = [v9 firstObject];

  return v10;
}

+ (unint64_t)numberOfCloudKitAccountsInContext:(id)a3 onlyMigrated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  id v7 = [v5 fetchRequestWithEntityName:@"ICAccount"];
  int v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"accountType == %d", 1);
  uint64_t v10 = objc_msgSend(v8, "arrayWithObjects:", v9, 0);

  if (v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"didChooseToMigrate == YES"];
    [v10 addObject:v11];
  }
  uint64_t v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  [v7 setPredicate:v12];

  id v18 = 0;
  unint64_t v13 = [v6 countForFetchRequest:v7 error:&v18];

  id v14 = v18;
  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ICAccount(Management) numberOfCloudKitAccountsInContext:onlyMigrated:]();
    }
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 != 0) {
    unint64_t v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->primaryEmail, 0);
  objc_storeStrong((id *)&self->fullName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_accountProxy, 0);
  objc_storeStrong((id *)&self->_trashFolder, 0);
  objc_storeStrong((id *)&self->_defaultFolder, 0);
}

- (id)predicateForVisibleNotes
{
  objc_super v3 = [(ICCloudSyncingObject *)self viewContext];
  BOOL v4 = (void *)MEMORY[0x1E4F1CA48];
  objc_super v5 = [(ICAccount *)self predicateForNotesInAccount];
  id v6 = [v4 arrayWithObject:v5];

  id v7 = +[ICNote predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:](ICNote, "predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:", 0, +[ICAccount hidesSystemPaperNotesInCustomFolders](ICAccount, "hidesSystemPaperNotesInCustomFolders") ^ 1, +[ICAccount hidesMathNotesInCustomFolders](ICAccount, "hidesMathNotesInCustomFolders") ^ 1, +[ICAccount hidesCallNotesInCustomFolders] ^ 1, v3);
  objc_msgSend(v6, "ic_addNonNilObject:", v7);

  int v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];

  return v8;
}

+ (BOOL)hidesSystemPaperNotesInCustomFolders
{
  BOOL v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ICAccountHidesSystemPaperNotesInCustomFolders"];

  return v3;
}

+ (BOOL)hidesMathNotesInCustomFolders
{
  BOOL v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ICAccountHidesMathNotesInCustomFolders"];

  return v3;
}

+ (BOOL)hidesCallNotesInCustomFolders
{
  BOOL v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ICAccountHidesCallNotesInCustomFolders"];

  return v3;
}

- (id)predicateForNotesInAccount
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"folder.account == %@", self];
}

+ (BOOL)isCloudKitAccountAvailableInContext:(id)a3
{
  id v3 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v4 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v4);
  objc_super v5 = [(id)accountForAppleCloudKitTable objectEnumerator];
  id v6 = [v5 nextObject];

  if (v6)
  {
    id v7 = [v6 managedObjectContext];

    if (v7) {
      *((unsigned char *)v20 + 24) = 1;
    }
  }

  objc_sync_exit(v4);
  if (*((unsigned char *)v20 + 24)) {
    goto LABEL_9;
  }
  id v8 = (id)accountsForAppleCloudKitTable;
  objc_sync_enter(v8);
  v9 = [(id)accountsForAppleCloudKitTable objectEnumerator];
  uint64_t v10 = [v9 nextObject];

  uint64_t v11 = [v10 objectEnumerator];
  uint64_t v12 = [v11 nextObject];

  if (v12)
  {
    unint64_t v13 = [v12 managedObjectContext];

    if (v13) {
      *((unsigned char *)v20 + 24) = 1;
    }
  }

  objc_sync_exit(v8);
  if (*((unsigned char *)v20 + 24))
  {
LABEL_9:
    BOOL v14 = 1;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__ICAccount_Management__isCloudKitAccountAvailableInContext___block_invoke;
    v16[3] = &unk_1E64A4528;
    id v18 = &v19;
    id v17 = v3;
    [v17 performBlockAndWait:v16];

    BOOL v14 = *((unsigned char *)v20 + 24) != 0;
  }
  _Block_object_dispose(&v19, 8);

  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    id v4 = (void *)accountForAppleCloudKitTable;
    accountForAppleCloudKitTable = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    id v6 = (void *)accountsForAppleCloudKitTable;
    accountsForAppleCloudKitTable = v5;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:a1 selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
}

+ (void)initializeLocalAccountNamesInBackground
{
  BOOL v2 = dispatch_get_global_queue(2, 0);
  dispatch_async(v2, &__block_literal_global_636);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICAccount *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/Shared/CoreData/ICAccount.m"])
  {
    char v13 = [(ICAccount *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == compoundliteral && (v13 & 1) == 0)
    {
      [(ICAccount *)self updateTrashFolderHiddenNoteContainerState];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICAccount;
    [(ICAccount *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 3;
}

- (unint64_t)searchResultType
{
  return 3;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  return ![(ICCloudSyncingObject *)self isVisible];
}

- (BOOL)isMovable
{
  return 0;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)@"Modern";
}

- (NSString)searchIndexingIdentifier
{
  BOOL v2 = [(ICAccount *)self objectID];
  uint64_t v3 = [v2 URIRepresentation];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  return (CSSearchableItemAttributeSet *)v2;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  uint64_t v3 = [(ICAccount *)self userActivityContentAttributeSet];
  id v4 = [(ICAccount *)self name];
  if (![v4 length])
  {
    uint64_t v5 = [(ICAccount *)self username];

    id v4 = (void *)v5;
  }
  [v3 setDisplayName:v4];
  [v3 setTextContent:v4];
  objc_msgSend(v3, "setIc_searchResultType:", 3);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if ([(ICAccount *)self isManaged]) {
    id v6 = &unk_1F1F62730;
  }
  else {
    id v6 = &unk_1F1F62748;
  }
  [v3 setDataOwnerType:v6];
  if (objc_opt_respondsToSelector()) {
    [(ICAccount *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)searchableTextContent
{
  BOOL v2 = [(ICAccount *)self name];
  uint64_t v3 = v2;
  if (!v2) {
    BOOL v2 = &stru_1F1F2FFF8;
  }
  id v4 = v2;

  return v4;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

+ (void)setAccountUtilities:(id)a3
{
}

- (BOOL)isDataSeparated
{
  uint64_t v3 = [(ICAccount *)self identifier];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = +[ICAccount accountUtilities];
  id v6 = [(ICAccount *)self identifier];
  id v7 = [v5 iCloudACAccountWithIdentifier:v6];

  LOBYTE(v6) = objc_msgSend(v7, "ic_shouldCreateSeparatePersistentStore");
  return (char)v6;
}

- (BOOL)isLocalAccount
{
  BOOL v2 = [(ICAccount *)self identifier];
  char v3 = [v2 isEqualToString:@"LocalAccount"];

  return v3;
}

- (NSString)dsid
{
  if (!self->_dsid)
  {
    char v3 = [(ICAccount *)self identifier];
    if ([v3 length])
    {
      int v4 = [(ICAccount *)self accountType];

      if (v4 != 1) {
        goto LABEL_6;
      }
      char v3 = +[ICAccount accountUtilities];
      uint64_t v5 = [(ICAccount *)self identifier];
      id v6 = [v3 iCloudACAccountWithIdentifier:v5];
      objc_msgSend(v6, "aa_personID");
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      dsid = self->_dsid;
      self->_dsid = v7;
    }
  }
LABEL_6:
  v9 = self->_dsid;
  return v9;
}

- (NSString)altDSID
{
  if (!self->_altDSID)
  {
    char v3 = [(ICAccount *)self identifier];
    if ([v3 length])
    {
      int v4 = [(ICAccount *)self accountType];

      if (v4 != 1) {
        goto LABEL_6;
      }
      char v3 = +[ICAccount accountUtilities];
      uint64_t v5 = [(ICAccount *)self identifier];
      id v6 = [v3 iCloudACAccountWithIdentifier:v5];
      objc_msgSend(v6, "aa_altDSID");
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      altDSID = self->_altDSID;
      self->_altDSID = v7;
    }
  }
LABEL_6:
  v9 = self->_altDSID;
  return v9;
}

- (NSString)username
{
  if (!self->_username)
  {
    char v3 = [(ICAccount *)self identifier];
    if ([v3 length])
    {
      int v4 = [(ICAccount *)self accountType];

      if (v4 != 1) {
        goto LABEL_6;
      }
      char v3 = +[ICAccount accountUtilities];
      uint64_t v5 = [(ICAccount *)self identifier];
      id v6 = [v3 iCloudACAccountWithIdentifier:v5];
      id v7 = [v6 username];
      username = self->_username;
      self->_username = v7;
    }
  }
LABEL_6:
  v9 = self->_username;
  return v9;
}

- (id)cacheKey
{
  BOOL v2 = NSString;
  char v3 = [(ICAccount *)self identifier];
  int v4 = [v2 stringWithFormat:@"%@:%@", v3, 0];

  return v4;
}

+ (void)localeDidChange:(id)a3
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  char v3 = (void *)localizedLocalAccountName;
  localizedLocalAccountName = 0;

  int v4 = (void *)localizedLocalAccountNameMidSentence;
  localizedLocalAccountNameMidSentence = 0;

  objc_sync_exit(obj);
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)ICAccount;
  [(ICCloudSyncingObject *)&v3 awakeFromInsert];
  [(ICAccount *)self setOwner:self];
  [(ICAccount *)self setSortOrder:0];
  [(ICAccount *)self setNestedTitleForSorting:&stru_1F1F2FFF8];
  [(ICAccount *)self setIsHiddenNoteContainer:1];
  [(ICAccount *)self setStoreDataSeparately:1];
}

- (void)prepareForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)ICAccount;
  [(ICAccount *)&v4 prepareForDeletion];
  [(ICAccount *)self removeAllObserversIfNecessary];
  objc_super v3 = +[ICAuthenticationState sharedState];
  [v3 removeMainKeyFromKeychainForObject:self];
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  if (a3)
  {
    objc_super v3 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[ICAccount setMarkedForDeletion:]();
    }
  }
  else
  {
    [(ICAccount *)self willChangeValueForKey:@"markedForDeletion"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    [(ICAccount *)self setPrimitiveValue:v5 forKey:@"markedForDeletion"];

    [(ICAccount *)self didChangeValueForKey:@"markedForDeletion"];
  }
}

- (id)customNoteSortTypeValue
{
  return 0;
}

- (void)performBlockInPersonaContext:(id)a3
{
  id v4 = a3;
  id v6 = +[ICAccount accountUtilities];
  uint64_t v5 = [(ICAccount *)self identifier];
  [v6 performBlockInPersonaContext:v4 forAccountIdentifier:v5];
}

- (void)performBlockInPersonaContextIfNecessary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ICAccount_performBlockInPersonaContextIfNecessary___block_invoke;
  v6[3] = &unk_1E64A56A0;
  id v7 = v4;
  id v5 = v4;
  [(ICAccount *)self performBlockInPersonaContext:v6];
}

uint64_t __53__ICAccount_performBlockInPersonaContextIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)createStandardFolders
{
  id v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Existing folder's account isn't deleted. Faulting it by checking its identifier: (%@)", a1, 0xCu);
}

- (void)createDefaultFolder
{
  objc_super v3 = [(ICAccount *)self defaultFolderIdentifier];
  id v4 = +[ICFolder newFolderWithIdentifier:v3 account:self];
  defaultFolder = self->_defaultFolder;
  self->_defaultFolder = v4;

  id v6 = +[ICFolder englishTitleForDefaultFolder];
  [(ICFolder *)self->_defaultFolder setTitle:v6];

  [(ICFolder *)self->_defaultFolder setSortOrder:1];
  id v7 = self->_defaultFolder;
  [(ICFolder *)v7 updateChangeCountWithReason:@"Created default folder"];
}

- (void)createTrashFolder
{
  objc_super v3 = [(ICAccount *)self trashFolderIdentifier];
  id v4 = +[ICFolder newFolderWithIdentifier:v3 account:self];
  trashFolder = self->_trashFolder;
  self->_trashFolder = v4;

  id v6 = +[ICFolder englishTitleForTrashFolder];
  [(ICFolder *)self->_trashFolder setTitle:v6];

  [(ICFolder *)self->_trashFolder setFolderType:1];
  [(ICFolder *)self->_trashFolder setIsHiddenNoteContainer:1];
  [(ICFolder *)self->_trashFolder setSortOrder:3];
  [(ICAccount *)self addTrashObserversIfNecessary];
  id v7 = self->_trashFolder;
  [(ICFolder *)v7 updateChangeCountWithReason:@"Created trash folder"];
}

+ (id)keyPathsForValuesAffectingLocalizedName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"accountType", @"name", 0);
}

- (id)localizedNameMidSentence
{
  objc_super v3 = [(ICAccount *)self identifier];
  int v4 = [v3 isEqualToString:@"InMemoryAccount"];

  if (v4 || [(ICAccount *)self accountType] != 3)
  {
    id v5 = [(ICAccount *)self name];
  }
  else
  {
    id v5 = +[ICAccount localizedLocalAccountNameMidSentence];
  }
  return v5;
}

- (NSPersistentStore)persistentStore
{
  BOOL v2 = [(ICAccount *)self objectID];
  objc_super v3 = [v2 persistentStore];

  return (NSPersistentStore *)v3;
}

- (BOOL)isLeaf
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)supportsLegacyTombstones
{
  return [(ICAccount *)self accountType] == 1;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(ICAccount *)self accountType];
    int v7 = [v5 accountType];
    int v8 = [(ICAccount *)self accountType];
    if (v6 == v7)
    {
      if (v8 != 1) {
        goto LABEL_18;
      }
      v9 = [MEMORY[0x1E4F837A0] persistentStoreURL];
      id v10 = [(ICAccount *)self persistentStore];
      id v11 = [v10 URL];
      int v12 = [v11 isEqual:v9];

      char v13 = [v5 persistentStore];
      objc_super v14 = [v13 URL];
      int v15 = [v14 isEqual:v9];

      if (v12 && !v15)
      {
        int64_t v16 = -1;
LABEL_19:

        goto LABEL_20;
      }

      if ((v12 | v15 ^ 1) == 1)
      {
LABEL_18:
        v9 = [(ICAccount *)self name];
        id v18 = [v5 name];
        int64_t v16 = [v9 localizedCaseInsensitiveCompare:v18];

        goto LABEL_19;
      }
    }
    else
    {
      if (v8 == 1)
      {
        int64_t v16 = -1;
LABEL_20:

        goto LABEL_21;
      }
      if ([v5 accountType] != 1) {
        goto LABEL_18;
      }
    }
    int64_t v16 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    int64_t v16 = -1;
  }
  else
  {
    id v17 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      [(ICAccount *)(uint64_t)self compare:v17];
    }

    int64_t v16 = 0;
  }
LABEL_21:

  return v16;
}

- (unint64_t)visibleCustomFoldersCount
{
  objc_super v3 = [(ICAccount *)self predicateForCustomFolders];
  id v4 = [(ICAccount *)self managedObjectContext];
  unint64_t v5 = +[ICFolder countOfFoldersMatchingPredicate:v3 context:v4];

  return v5;
}

- (BOOL)containsSharedFolders
{
  if ([(ICAccount *)self accountType] != 1) {
    return 0;
  }
  objc_super v3 = [(ICAccount *)self visibleFolders];
  char v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &__block_literal_global_25);

  return v4;
}

uint64_t __34__ICAccount_containsSharedFolders__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSharedViaICloud];
}

- (id)customRootLevelFolders
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(ICAccount *)self predicateForVisibleFolders];
  v12[0] = v3;
  char v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"parent == nil"];
  v12[1] = v4;
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"sortOrder == %d", 2);
  v12[2] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  int v7 = [(ICAccount *)self folders];
  int v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  v9 = [v7 filteredSetUsingPredicate:v8];

  id v10 = [v9 allObjects];

  return v10;
}

- (unint64_t)indexOfCustomRootLevelFolder:(id)a3
{
  id v4 = a3;
  if ([v4 sortOrder] != 2) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"folder.sortOrder == ICNoteContainerSortOrderFolder" functionName:"-[ICAccount indexOfCustomRootLevelFolder:]" simulateCrash:1 showAlert:0 format:@"Grabbing index of non-custom folder"];
  }
  unint64_t v5 = [(ICAccount *)self subFolderIdentifiersOrderedSet];
  int v6 = [v4 identifier];
  unint64_t v7 = [v5 indexOfObject:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [(ICAccount *)self customRootLevelFolders];
    v9 = [v8 sortedArrayUsingSelector:sel_compare_];
    unint64_t v7 = [v9 indexOfObject:v4];
  }
  return v7;
}

- (id)predicateForCustomFolders
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICAccount *)self predicateForVisibleFolders];
  [v3 addObject:v4];

  unint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  int v6 = [(ICAccount *)self defaultFolderIdentifier];
  unint64_t v7 = [v5 predicateWithFormat:@"identifier != %@", v6];
  [v3 addObject:v7];

  int v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = [(ICAccount *)self trashFolderIdentifier];
  id v10 = [v8 predicateWithFormat:@"identifier != %@", v9];
  [v3 addObject:v10];

  id v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  return v11;
}

- (id)predicateForPinnedNotes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1E4F28BA0];
  objc_super v3 = [(ICAccount *)self predicateForNotesInAccount];
  v8[0] = v3;
  id v4 = +[ICNote predicateForPinnedNotes];
  v8[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  int v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

- (id)visibleFoldersWithParent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v6 = [(ICAccount *)self visibleFolders];
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
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 parent];

        if (v12 == v4) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)visibleRootFoldersContainFolderWithTitle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICAccount *)self visibleFoldersWithParent:0];
  int v6 = [v5 valueForKey:@"title"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = +[ICFolder reservedFolderTitles];
  [v7 unionSet:v8];

  uint64_t v9 = [(ICAccount *)self reservedAccountFolderTitles];
  [v7 unionSet:v9];

  LOBYTE(v9) = [v7 containsObject:v4];
  return (char)v9;
}

- (id)reservedAccountFolderTitles
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v3 = [(ICAccount *)self allItemsFolderLocalizedTitle];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)visibleNoteContainers
{
  objc_super v3 = [(ICAccount *)self visibleFolders];
  id v4 = [(ICAccount *)self accountProxy];
  unint64_t v5 = [v3 arrayByAddingObject:v4];

  return v5;
}

+ (id)keyPathsForValuesAffectingVisibleNoteContainerChildren
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"visibleFolders"];
}

- (id)visibleNoteContainerChildren
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(ICAccount *)self visibleFolders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 parent];
        if (v10)
        {
        }
        else if (([v9 isHiddenNoteContainer] & 1) == 0)
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v11 = [v3 sortedArrayUsingSelector:sel_compare_];
  id v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = [v12 count];
  long long v14 = [(ICAccount *)self trashFolder];
  unsigned int v15 = [v12 containsObject:v14];

  if (v13 - (unint64_t)v15 >= 2)
  {
    long long v16 = [(ICAccount *)self accountProxy];
    [v12 insertObject:v16 atIndex:0];
  }
  return v12;
}

- (id)uniqueUserParticipants
{
  v80[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(ICAccount *)self managedObjectContext];
  uint64_t v4 = +[ICNote predicateForVisibleNotesInContext:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"folder.account == %@", self];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"serverShareData != nil", self);
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v64 = (void *)v5;
  v65 = (void *)v4;
  v80[0] = v4;
  v80[1] = v5;
  v80[2] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
  uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];

  id v10 = [(ICAccount *)self managedObjectContext];
  uint64_t v11 = +[ICFolder predicateForVisibleFoldersInContext:v10];

  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"account == %@", self];
  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  v60 = (void *)v12;
  v61 = (void *)v11;
  v79[0] = v11;
  v79[1] = v12;
  v63 = (void *)v6;
  v79[2] = v6;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

  long long v16 = +[ICNote fetchRequest];
  v62 = (void *)v9;
  [v16 setPredicate:v9];
  long long v17 = [(ICAccount *)self managedObjectContext];
  id v76 = 0;
  v58 = v16;
  uint64_t v18 = [v17 executeFetchRequest:v16 error:&v76];
  id v19 = v76;

  if (v19)
  {
    long long v20 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ICAccount uniqueUserParticipants]();
    }
  }
  long long v21 = +[ICFolder fetchRequest];
  [v21 setPredicate:v15];
  char v22 = [(ICAccount *)self managedObjectContext];
  id v75 = v19;
  v56 = v21;
  uint64_t v23 = [v22 executeFetchRequest:v21 error:&v75];
  id v24 = v75;

  if (v24)
  {
    uint64_t v25 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ICAccount uniqueUserParticipants]();
    }
  }
  v55 = v24;
  v59 = (void *)v15;
  v57 = (void *)v18;
  v26 = [MEMORY[0x1E4F1CA48] arrayWithArray:v18];
  v54 = (void *)v23;
  [v26 addObjectsFromArray:v23];
  v53 = v26;
  v27 = objc_msgSend(v26, "ic_flatMap:", &__block_literal_global_151);
  v28 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v27;
  uint64_t v29 = [obj countByEnumeratingWithState:&v71 objects:v78 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v72 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        v34 = [v33 userIdentity];
        v35 = [v34 userRecordID];
        v36 = [v35 recordName];

        if (v36)
        {
          v37 = NSString;
          v38 = objc_msgSend(v33, "ic_participantName");
          v39 = [v37 stringWithFormat:@"%@_%@", v38, v36];

          v40 = [v28 allKeys];
          char v41 = [v40 containsObject:v39];

          if ((v41 & 1) == 0) {
            [v28 setObject:v33 forKeyedSubscript:v39];
          }
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v71 objects:v78 count:16];
    }
    while (v30);
  }

  v42 = [v28 allKeys];
  v43 = [v42 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  v44 = [MEMORY[0x1E4F1CA48] array];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v45 = v43;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v68 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = [v28 objectForKeyedSubscript:*(void *)(*((void *)&v67 + 1) + 8 * j)];
        objc_msgSend(v44, "ic_addNonNilObject:", v50);
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v67 objects:v77 count:16];
    }
    while (v47);
  }

  v51 = (void *)[v44 copy];
  return v51;
}

id __35__ICAccount_uniqueUserParticipants__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 serverShare];
  objc_super v3 = objc_msgSend(v2, "ic_acceptedParticipants");
  uint64_t v4 = objc_msgSend(v3, "ic_objectsPassingTest:", &__block_literal_global_154);

  return v4;
}

uint64_t __35__ICAccount_uniqueUserParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 userIdentity];
  objc_super v3 = [v2 userRecordID];
  uint64_t v4 = [v3 recordName];
  uint64_t v5 = [v4 isEqual:*MEMORY[0x1E4F19C08]] ^ 1;

  return v5;
}

- (ICAccountProxy)accountProxy
{
  accountProxy = self->_accountProxy;
  if (!accountProxy)
  {
    uint64_t v4 = +[ICAccountProxy accountProxyWithAccount:self];
    uint64_t v5 = self->_accountProxy;
    self->_accountProxy = v4;

    accountProxy = self->_accountProxy;
  }
  return accountProxy;
}

- (id)allItemsFolderLocalizedTitle
{
  objc_super v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"All %@" value:@"All %@" table:0 allowSiri:1];
  uint64_t v4 = NSString;
  uint64_t v5 = [(ICAccount *)self localizedNameMidSentence];
  uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v3, v5);

  return v6;
}

- (id)allChildObjects
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v48 = self;
  uint64_t v4 = [(ICAccount *)self folders];
  uint64_t v5 = [v4 allObjects];

  if (v5)
  {
    [v3 addObjectsFromArray:v5];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v38 = v5;
    id obj = (id)[v5 copy];
    uint64_t v41 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          uint64_t v8 = [v7 identifier];
          uint64_t v9 = +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:v8 type:2];

          id v10 = [(ICAccount *)v48 managedObjectContext];
          id v45 = (void *)v9;
          uint64_t v11 = +[ICLegacyTombstone legacyTombstoneWithIdentifier:v9 context:v10];

          if (v11) {
            [v3 addObject:v11];
          }
          uint64_t v12 = [v7 notes];
          uint64_t v13 = [v12 allObjects];

          if (v13)
          {
            v43 = v11;
            uint64_t v44 = i;
            [v3 addObjectsFromArray:v13];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            v42 = v13;
            id v46 = v13;
            uint64_t v49 = [v46 countByEnumeratingWithState:&v55 objects:v64 count:16];
            if (v49)
            {
              uint64_t v47 = *(void *)v56;
              do
              {
                for (uint64_t j = 0; j != v49; ++j)
                {
                  if (*(void *)v56 != v47) {
                    objc_enumerationMutation(v46);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                  long long v16 = [v15 identifier];
                  uint64_t v17 = +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:v16 type:2];

                  uint64_t v18 = [(ICAccount *)v48 managedObjectContext];
                  v50 = (void *)v17;
                  id v19 = +[ICLegacyTombstone legacyTombstoneWithIdentifier:v17 context:v18];

                  if (v19) {
                    [v3 addObject:v19];
                  }
                  long long v20 = [v15 attachments];
                  long long v21 = [v20 allObjects];

                  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v21);
                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v51 = 0u;
                  long long v52 = 0u;
                  id v22 = v21;
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v63 count:16];
                  if (v23)
                  {
                    uint64_t v24 = v23;
                    uint64_t v25 = *(void *)v52;
                    do
                    {
                      for (uint64_t k = 0; k != v24; ++k)
                      {
                        if (*(void *)v52 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        v27 = *(void **)(*((void *)&v51 + 1) + 8 * k);
                        v28 = [v27 media];

                        if (v28)
                        {
                          uint64_t v29 = [v27 media];
                          [v3 addObject:v29];
                        }
                        uint64_t v30 = [v27 previewImages];

                        if (v30)
                        {
                          uint64_t v31 = [v27 previewImages];
                          v32 = [v31 allObjects];
                          [v3 addObjectsFromArray:v32];
                        }
                      }
                      uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v63 count:16];
                    }
                    while (v24);
                  }

                  v33 = [v15 inlineAttachments];
                  v34 = [v33 allObjects];
                  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v34);
                }
                uint64_t v49 = [v46 countByEnumeratingWithState:&v55 objects:v64 count:16];
              }
              while (v49);
            }

            uint64_t v11 = v43;
            uint64_t i = v44;
            uint64_t v13 = v42;
          }
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      }
      while (v41);
    }

    uint64_t v5 = v38;
  }
  v35 = [(ICAccount *)v48 hashtags];
  v36 = [v35 allObjects];
  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v36);

  return v3;
}

- (BOOL)shouldExcludeFilesFromCloudBackup
{
  return [(ICAccount *)self accountType] == 1;
}

- (id)accountFilesDirectoryURLInApplicationDataContainer
{
  objc_super v3 = [(id)objc_opt_class() accountUtilities];
  uint64_t v4 = [(ICAccount *)self identifier];
  uint64_t v5 = [v3 applicationDataContainerURLForAccountIdentifier:v4];

  uint64_t v6 = [(ICAccount *)self identifier];

  if (v6)
  {
    uint64_t v7 = [v5 URLByAppendingPathComponent:@"Documents" isDirectory:1];

    uint64_t v8 = [v7 URLByAppendingPathComponent:*MEMORY[0x1E4F83650] isDirectory:1];

    uint64_t v9 = [(ICAccount *)self identifier];
    uint64_t v5 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];
  }
  id v10 = v5;

  return v10;
}

- (id)fallbackImageDirectoryURL
{
  BOOL v2 = [(ICAccount *)self accountFilesDirectoryURL];
  objc_super v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83620] isDirectory:1];

  return v3;
}

- (id)fallbackPDFDirectoryURL
{
  BOOL v2 = [(ICAccount *)self accountFilesDirectoryURL];
  objc_super v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83628] isDirectory:1];

  return v3;
}

- (id)exportableMediaDirectoryURL
{
  BOOL v2 = [(ICAccount *)self accountFilesDirectoryURL];
  objc_super v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83618] isDirectory:1];

  return v3;
}

- (id)previewImageDirectoryURL
{
  BOOL v2 = [(ICAccount *)self accountFilesDirectoryURL];
  objc_super v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83640] isDirectory:1];

  return v3;
}

- (void)deleteUnusedHashtagsWithStandardizedContent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (!+[ICInlineAttachment isHashtagStandardizedContent:v9 usedInAccount:self])
        {
          id v10 = +[ICHashtag hashtagWithStandardizedContent:v9 account:self];
          [v10 markForDeletion];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)temporaryDirectoryURL
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__21;
  uint64_t v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__ICAccount_temporaryDirectoryURL__block_invoke;
  v4[3] = &unk_1E64A45A0;
  v4[4] = &v5;
  [(ICAccount *)self performBlockInPersonaContext:v4];
  if (v6[5])
  {
    BOOL v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  }
  else
  {
    BOOL v2 = 0;
  }
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__ICAccount_temporaryDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = NSTemporaryDirectory();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)systemPaperTemporaryDirectoryURL
{
  uint64_t v3 = +[ICAccount accountUtilities];
  id v4 = [(ICAccount *)self identifier];
  uint64_t v5 = [v3 applicationDocumentsURLForAccountIdentifier:v4];

  uint64_t v6 = [v5 URLByAppendingPathComponent:@"Library" isDirectory:1];
  uint64_t v7 = [v6 URLByAppendingPathComponent:@"Caches" isDirectory:1];
  uint64_t v8 = [v7 URLByAppendingPathComponent:*MEMORY[0x1E4F83638] isDirectory:1];

  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v11 = v16;

  if ((v10 & 1) == 0)
  {
    long long v12 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICAccount systemPaperTemporaryDirectoryURL]();
    }

    long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = [v13 temporaryDirectory];

    uint64_t v8 = (void *)v14;
  }

  return v8;
}

- (void)ensureCriticalPaperDirectoriesExist
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a1, "ic_loggingIdentifier");
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Failed to create paper bundle URL for account (%@): %@", (uint8_t *)&v6, 0x16u);
}

- (id)systemPaperDirectoryURL
{
  uint64_t v2 = [(ICAccount *)self accountFilesDirectoryURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83638] isDirectory:1];

  return v3;
}

- (id)systemPaperBundlesDirectoryURL
{
  uint64_t v2 = [(ICAccount *)self systemPaperDirectoryURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F83610] isDirectory:1];

  return v3;
}

- (id)systemPaperNotes
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICAccount *)self predicateForNotesInAccount];
  v10[0] = v3;
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isSystemPaper == YES"];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  int v6 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  uint64_t v7 = [(ICAccount *)self managedObjectContext];
  __int16 v8 = +[ICNote notesMatchingPredicate:v6 context:v7];

  return v8;
}

+ (id)mostRecentSystemPaperNoteInManagedObjectContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "+[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:]";
    __int16 v15 = 1024;
    int v16 = 1017;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  uint64_t v5 = +[ICNote systemPaperNotesFetchRequest];
  [v5 setFetchLimit:1];
  id v12 = 0;
  int v6 = [v3 executeFetchRequest:v5 error:&v12];

  id v7 = v12;
  if (v7)
  {
    __int16 v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:]();
    }
  }
  if ([v6 count])
  {
    uint64_t v9 = [v6 firstObject];
    uint64_t v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:](v9);
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:]();
    }
    uint64_t v9 = 0;
  }

  return v9;
}

+ (void)setHidesSystemPaperNotesInCustomFolders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"ICAccountHidesSystemPaperNotesInCustomFolders"];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICAccountHidesSystemPaperNotesInCustomFoldersDidChangeNotification" object:0 userInfo:0];
}

+ (void)setHidesMathNotesInCustomFolders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"ICAccountHidesMathNotesInCustomFolders"];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICAccountHidesMathNotesInCustomFoldersDidChangeNotification" object:0 userInfo:0];
}

+ (void)setHidesCallNotesInCustomFolders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"ICAccountHidesCallNotesInCustomFolders"];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICAccountHidesCallNotesInCustomFoldersDidChangeNotification" object:0 userInfo:0];
}

- (void)updateFullNameAndEmail:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICAccount *)self accountType] == 1)
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      int v16 = "-[ICAccount updateFullNameAndEmail:]";
      __int16 v17 = 1024;
      int v18 = 1096;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Fetching user's full name and primary email address… {account: %@}%s:%d", buf, 0x1Cu);
    }
    objc_initWeak((id *)buf, self);
    id v7 = [(ICCloudSyncingObject *)self cloudContext];
    __int16 v8 = [(ICAccount *)self identifier];
    uint64_t v9 = [v7 containerForAccountID:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__ICAccount_updateFullNameAndEmail___block_invoke;
    void v10[3] = &unk_1E64A62C0;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v4;
    [v9 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __36__ICAccount_updateFullNameAndEmail___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = os_log_create("com.apple.notes", "Cloud");
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setFullName:v9];

  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  [v13 setPrimaryEmail:v8];

  performBlockOnMainThread();
}

- (BOOL)canHaveCryptoStrategy
{
  return 1;
}

- (id)cryptoStrategyProtocol
{
  return &unk_1F1F64D18;
}

- (BOOL)cryptoStrategyIsTransient
{
  return 1;
}

- (signed)resolvedLockedNotesMode
{
  uint64_t v3 = [(ICAccount *)self accountData];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  id v5 = [(ICAccount *)self accountData];
  int v6 = [v5 lockedNotesMode];

  if (!v6) {
    return 1;
  }
  id v7 = [(ICAccount *)self accountData];
  signed __int16 v8 = [v7 lockedNotesMode];

  return v8;
}

- (void)setResolvedLockedNotesMode:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [(ICAccount *)self accountData];
  if (v5
    && (int v6 = (void *)v5,
        [(ICAccount *)self accountData],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 lockedNotesMode],
        v7,
        v6,
        v8 == v3))
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICAccount setResolvedLockedNotesMode:](self, v3);
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICAccount setResolvedLockedNotesMode:](self, v3);
    }

    id v11 = [(ICAccount *)self accountDataCreateIfNecessary];
    [v11 setLockedNotesMode:v3];

    id v9 = [(ICAccount *)self accountData];
    [v9 updateChangeCountWithReason:@"Set locked notes mode"];
  }
}

- (id)passwordProtectedNotes
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [(ICAccount *)self predicateForNotesInAccount];
  uint64_t v5 = +[ICCloudSyncingObject predicateForVisibleObjects];
  v12[1] = v5;
  int v6 = +[ICCloudSyncingObject predicateForPasswordProtectedObjects];
  v12[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  int v8 = [v3 andPredicateWithSubpredicates:v7];

  id v9 = [(ICAccount *)self managedObjectContext];
  uint64_t v10 = +[ICNote notesMatchingPredicate:v8 context:v9];

  return v10;
}

- (BOOL)canPasswordProtectNotes
{
  uint64_t v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v4 = [v3 currentUser];
  uint64_t v5 = [v4 userType];

  return [(ICAccount *)self accountType] != 1 || v5 != 1;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)visibleNotes
{
  uint64_t v3 = [(ICAccount *)self predicateForVisibleNotes];
  id v4 = [(ICAccount *)self managedObjectContext];
  uint64_t v5 = +[ICNote notesMatchingPredicate:v3 context:v4];

  return v5;
}

- (unint64_t)visibleNotesCount
{
  uint64_t v3 = [(ICAccount *)self predicateForVisibleNotes];
  id v4 = [(ICAccount *)self managedObjectContext];
  unint64_t v5 = +[ICNote countOfNotesMatchingPredicate:v3 context:v4];

  return v5;
}

- (unint64_t)visibleInCloudNotesIncludingTrashCount
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  unint64_t v5 = [(ICAccount *)self predicateForVisibleNotesIncludingTrash];
  int v6 = +[ICCloudSyncingObject predicateForInCloudObjects];
  id v7 = objc_msgSend(v4, "arrayWithObjects:", v5, v6, 0);
  int v8 = [v3 andPredicateWithSubpredicates:v7];

  id v9 = [(ICAccount *)self managedObjectContext];
  unint64_t v10 = +[ICNote countOfNotesMatchingPredicate:v8 context:v9];

  return v10;
}

- (unint64_t)visibleAttachmentsIncludingTrashCount
{
  uint64_t v3 = [(ICAccount *)self predicateForVisibleAttachmentsIncludingTrash];
  id v4 = [(ICAccount *)self managedObjectContext];
  unint64_t v5 = +[ICAttachment countOfAttachmentsMatchingPredicate:v3 context:v4];

  return v5;
}

- (BOOL)isAllNotesContainer
{
  return 1;
}

- (void)setDidChooseToMigrate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICAccount *)self didChooseToMigrate] != a3)
  {
    [(ICAccount *)self willChangeValueForKey:@"didChooseToMigrate"];
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(ICAccount *)self setPrimitiveValue:v5 forKey:@"didChooseToMigrate"];

    [(ICAccount *)self didChangeValueForKey:@"didChooseToMigrate"];
    +[ICMigrationUtilities updateLegacyAccountMigrationStateForModernAccount:self];
  }
}

- (void)updateAccountNameForAccountListSorting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICAccount *)self localizedName];
  id v4 = (void *)v3;
  unint64_t v5 = &stru_1F1F2FFF8;
  if (v3) {
    unint64_t v5 = (__CFString *)v3;
  }
  int v6 = v5;

  id v7 = [NSString stringWithFormat:@"%ld_%@", (int)-[ICAccount accountType](self, "accountType"), v6];
  [(ICAccount *)self setAccountNameForAccountListSorting:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = [(ICAccount *)self ownerInverse];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [(ICAccount *)self accountNameForAccountListSorting];
        [v13 setAccountNameForAccountListSorting:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)predicateForAttachmentsInAccount
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"note.folder.account == %@", self];
}

- (id)predicateForVisibleAttachments
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [(ICAccount *)self predicateForAttachmentsInAccount];
  v10[0] = v4;
  unint64_t v5 = [(ICAccount *)self managedObjectContext];
  int v6 = +[ICBaseAttachment predicateForVisibleAttachmentsInContext:v5];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  int v8 = [v3 andPredicateWithSubpredicates:v7];

  return v8;
}

- (id)predicateForVisibleAttachmentsIncludingTrash
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [(ICAccount *)self predicateForAttachmentsInAccount];
  v10[0] = v4;
  unint64_t v5 = [(ICAccount *)self managedObjectContext];
  int v6 = +[ICBaseAttachment predicateForVisibleAttachmentsIncludingTrashInContext:v5];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  int v8 = [v3 andPredicateWithSubpredicates:v7];

  return v8;
}

- (id)predicateForSearchableAttachments
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [(ICAccount *)self managedObjectContext];
  unint64_t v5 = +[ICAttachment predicateForSearchableAttachmentsInContext:v4];
  v10[0] = v5;
  int v6 = [(ICAccount *)self predicateForAttachmentsInAccount];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  int v8 = [v3 andPredicateWithSubpredicates:v7];

  return v8;
}

- (BOOL)supportsEditingNotes
{
  return 1;
}

- (void)managedObjectContextDidSave:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICCloudSyncingObject *)self hasContextOptions:1])
  {
    unint64_t v5 = [(ICAccount *)self managedObjectContext];
    int v6 = [v4 object];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      int v8 = [v4 userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            long long v16 = [(ICAccount *)self trashFolder];
            long long v17 = [v16 objectID];

            if (v15 == v17)
            {
              [(ICAccount *)self updateTrashFolderHiddenNoteContainerState];
              goto LABEL_13;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
}

- (id)ic_loggingIdentifier
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__21;
  uint64_t v11 = __Block_byref_object_dispose__21;
  id v12 = 0;
  uint64_t v3 = [(ICAccount *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__ICAccount_ic_loggingIdentifier__block_invoke;
  v6[3] = &unk_1E64A4528;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__ICAccount_ic_loggingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICAccount;
  uint64_t v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(ICAccount *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__ICAccount_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E64A4218;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = v6;
  return v7;
}

void __29__ICAccount_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) dsid];
  uint64_t v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"dsid"];

  uint64_t v5 = [*(id *)(a1 + 40) userRecordName];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"userRecordName"];

  int v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didChooseToMigrate"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"didChooseToMigrate"];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didFinishMigration"));
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"didFinishMigration"];

  id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didMigrateOnMac"));
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"didMigrateOnMac"];

  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  objc_super v12 = [*(id *)(a1 + 40) notes];
  uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"noteCount"];

  uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
  long long v15 = [*(id *)(a1 + 40) folders];
  long long v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:@"folderCount"];

  long long v17 = [*(id *)(a1 + 40) serverSideUpdateTaskContinuationToken];
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:@"serverSideUpdateTaskContinuationToken"];

  long long v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskFailureCount"));
  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"serverSideUpdateTaskFailureCount"];

  long long v19 = [*(id *)(a1 + 40) serverSideUpdateTaskLastAttemptedBuild];
  [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:@"serverSideUpdateTaskLastAttemptedBuild"];

  long long v20 = [*(id *)(a1 + 40) serverSideUpdateTaskLastAttemptedVersion];
  [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:@"serverSideUpdateTaskLastAttemptedVersion"];

  long long v21 = [*(id *)(a1 + 40) serverSideUpdateTaskLastCompletedBuild];
  [*(id *)(a1 + 32) setObject:v21 forKeyedSubscript:@"serverSideUpdateTaskLastCompletedBuild"];

  id v22 = [*(id *)(a1 + 40) serverSideUpdateTaskLastCompletedVersion];
  [*(id *)(a1 + 32) setObject:v22 forKeyedSubscript:@"serverSideUpdateTaskLastCompletedVersion"];
}

- (id)visibleSubFolders
{
  uint64_t v2 = [(ICAccount *)self customRootLevelFolders];
  uint64_t v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (void)setSubFolderOrderMergeableData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAccount *)self accountData];
  [v5 setMergeableData:v4];
}

- (void)updateSubFolderMergeableDataChangeCount
{
  id v2 = [(ICAccount *)self accountData];
  [v2 updateChangeCountWithReason:@"Updated subfolders"];
}

- (void)setUserRecordName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    int v10 = 138413058;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    __int16 v14 = 2080;
    id v13 = v4;
    long long v15 = "-[ICAccount setUserRecordName:]";
    __int16 v16 = 1024;
    int v17 = 1458;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Setting user record name… {account: %@, userRecordName: %@}%s:%d", (uint8_t *)&v10, 0x26u);
  }
  id v7 = NSStringFromSelector(sel_userRecordName);
  [(ICAccount *)self willChangeValueForKey:v7];

  int v8 = NSStringFromSelector(sel_userRecordName);
  [(ICAccount *)self setPrimitiveValue:v4 forKey:v8];

  uint64_t v9 = NSStringFromSelector(sel_userRecordName);
  [(ICAccount *)self didChangeValueForKey:v9];
}

- (BOOL)allowsImporting
{
  return 1;
}

- (BOOL)allowsExporting
{
  return 1;
}

- (BOOL)didAddObservers
{
  return self->_didAddObservers;
}

- (void)setDidAddObservers:(BOOL)a3
{
  self->_didAddObservers = a3;
}

- (void)setDefaultFolder:(id)a3
{
}

- (void)setTrashFolder:(id)a3
{
}

- (void)setAccountProxy:(id)a3
{
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
}

- (NSPersonNameComponents)fullName
{
  return self->fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)primaryEmail
{
  return self->primaryEmail;
}

- (void)setPrimaryEmail:(id)a3
{
}

+ (id)newAccountWithIdentifier:(id)a3 type:(int)a4 context:(id)a5
{
  return (id)[a1 newAccountWithIdentifier:a3 type:*(void *)&a4 context:a5 persistentStore:0];
}

+ (id)newAccountWithIdentifier:(id)a3 type:(int)a4 context:(id)a5 persistentStore:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  if (a5)
  {
    __int16 v12 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ICAccount" inManagedObjectContext:a5];
    [v12 setIdentifier:v10];
    [v12 setAccountType:v8];
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      long long v15 = +[ICNoteContext sharedContext];
      id v13 = [v15 persistentStoreForAccountID:v10];
    }
    [v12 assignToPersistentStore:v13];
    [v12 createStandardFolders];
  }
  else
  {
    __int16 v14 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ICAccount(Management) newAccountWithIdentifier:type:context:persistentStore:](a2);
    }

    __int16 v12 = 0;
  }

  return v12;
}

+ (id)newLocalAccountInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 accountWithIdentifier:@"LocalAccount" context:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v12 = 0;
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Trying to add the local account, but it already exists", v12, 2u);
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v9 = [v8 currentUser];

    if ([v9 userType] == 1 && !objc_msgSend(v9, "isTransientUser"))
    {

      id v6 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[a1 newAccountWithIdentifier:@"LocalAccount" type:3 context:v4];
    [v6 setDidChooseToMigrate:1];
  }
  id v10 = [a1 localizedLocalAccountName];
  [v6 setName:v10];

LABEL_9:
  return v6;
}

+ (id)inMemoryAccountInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 accountWithIdentifier:@"InMemoryAccount" context:v4];
  if (!v5)
  {
    uint64_t v5 = (void *)[a1 newAccountWithIdentifier:@"InMemoryAccount" type:3 context:v4];
    [v5 setDidChooseToMigrate:1];
    [v5 setName:@"In-Memory"];
  }

  return v5;
}

+ (void)deleteAccount:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ICAccount(Management) deleteAccount:](v3);
  }

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICAccountWillBeDeletedNotification" object:v3];

  [v3 removeAllObserversIfNecessary];
  if ([v3 storeDataSeparately])
  {
    id v6 = [v3 accountFilesDirectoryURL];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v3 managedObjectContext];
  [v7 deleteObject:v3];

  if (v6)
  {
    uint64_t v8 = +[ICFileUtilities coordinateDeleteItemAt:v6];
    if (v8)
    {
      uint64_t v9 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ICAccount(Management) deleteAccount:]();
      }
    }
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"ICAccountWasDeletedNotification" object:v3];
}

+ (void)deleteAccountWithBatchDelete:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v5;
    _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Deleting modern account with batch delete %@", buf, 0xCu);
  }

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICAccountWillBeDeletedNotification" object:v4];

  [v4 removeAllObserversIfNecessary];
  int v8 = [v4 storeDataSeparately];
  v37 = (void *)v5;
  if (v8)
  {
    uint64_t v35 = [v4 accountFilesDirectoryURL];
    uint64_t v36 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v33 = +[ICMedia mediaIdentifiersForAccount:v4];
    uint64_t v34 = +[ICAttachmentPreviewImage attachmentPreviewImageIdentifiersForAccount:v4];
    +[ICAttachment attachmentIdentifiersForAccount:v4];
    v36 = uint64_t v35 = 0;
  }
  uint64_t v9 = +[ICAuthenticationState sharedState];
  [v9 removeMainKeysFromKeychainForAccount:v4];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ICAccount"];
  id v11 = (void *)MEMORY[0x1E4F28F60];
  __int16 v12 = [v4 identifier];
  id v13 = [v11 predicateWithFormat:@"identifier == %@", v12];
  [v10 setPredicate:v13];

  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v10];
  long long v15 = (void *)MEMORY[0x1C877DB80]([v14 setResultType:0]);
  __int16 v16 = [v4 managedObjectContext];
  id v39 = 0;
  id v17 = (id)[v16 executeRequest:v14 error:&v39];
  id v18 = v39;
  if (v18)
  {
    long long v19 = v18;
    id v20 = a1;
    long long v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[ICAccount(Management) deleteAccountWithBatchDelete:].cold.4();
    }

    id v22 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(Management) deleteAccountWithBatchDelete:]();
    }

    [v20 deleteAccount:v4];
  }
  id v38 = 0;
  [v16 save:&v38];
  id v23 = v38;
  if (v23)
  {
    uint64_t v24 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[ICAccount(Management) deleteAccountWithBatchDelete:]();
    }
  }
  if (v8)
  {
    uint64_t v25 = (void *)v35;
    v26 = +[ICFileUtilities coordinateDeleteItemAt:v35];
    v27 = (void *)v33;
    v28 = (void *)v34;
    uint64_t v29 = (void *)v36;
    if (v26)
    {
      uint64_t v30 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        +[ICAccount(Management) deleteAccount:]();
      }
    }
  }
  else
  {
    v27 = (void *)v33;
    +[ICMedia purgeMediaFilesForIdentifiers:v33 account:v4];
    v28 = (void *)v34;
    +[ICAttachmentPreviewImage purgePreviewImageFilesForIdentifiers:v34 account:v4];
    uint64_t v29 = (void *)v36;
    +[ICAttachment purgeAttachmentFilesForIdentifiers:v36 account:v4];
    uint64_t v25 = (void *)v35;
  }
  uint64_t v31 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = (uint64_t)v37;
    _os_log_impl(&dword_1C3A61000, v31, OS_LOG_TYPE_INFO, "Completed batch delete for modern account %@", buf, 0xCu);
  }

  v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v32 postNotificationName:@"ICAccountWasDeletedNotification" object:v4];
}

+ (id)cloudKitAccountWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  uint64_t v9 = 0;
  if (v7 && v8)
  {
    if ([MEMORY[0x1E4F83738] isRunningUnitTests])
    {
      uint64_t v9 = [a1 accountWithIdentifier:v6 context:v7];
      goto LABEL_20;
    }
    id v10 = (id)accountsForAppleCloudKitTable;
    objc_sync_enter(v10);
    id v11 = [(id)accountsForAppleCloudKitTable objectForKey:v7];
    uint64_t v12 = [v11 objectForKey:v6];
    uint64_t v9 = (void *)v12;
    if (v12) {
      goto LABEL_6;
    }
    long long v15 = +[ICAccount accountUtilities];
    __int16 v16 = [v15 iCloudACAccountWithIdentifier:v6];

    if (!objc_msgSend(v16, "ic_isNotesEnabled"))
    {
      uint64_t v9 = 0;
      goto LABEL_18;
    }
    uint64_t v9 = [a1 accountWithIdentifier:v6 context:v7];

    if (v9)
    {
LABEL_6:
      id v13 = [v9 managedObjectContext];

      if (v13)
      {
        if (([v9 isDeleted] & 1) == 0)
        {
          if (v12)
          {
LABEL_19:

            objc_sync_exit(v10);
            goto LABEL_20;
          }
          goto LABEL_14;
        }
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = [a1 accountWithIdentifier:v6 context:v7];
      }

      uint64_t v9 = (void *)v14;
    }
LABEL_14:
    __int16 v16 = (void *)[v11 mutableCopy];
    [v16 setObject:v9 forKeyedSubscript:v6];
    id v17 = (void *)accountsForAppleCloudKitTable;
    id v18 = (void *)[v16 copy];
    [v17 setObject:v18 forKey:v7];

LABEL_18:
    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

+ (id)cloudKitAccountInContext:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__21;
  id v46 = __Block_byref_object_dispose__21;
  id v47 = 0;
  uint64_t v5 = +[ICAccount accountUtilities];
  id v6 = [v5 primaryICloudACAccount];

  id v7 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v6 identifier];
    +[ICAccount(Management) cloudKitAccountInContext:v7];
  }

  id v9 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v9);
  uint64_t v10 = [(id)accountForAppleCloudKitTable objectForKey:v4];
  id v11 = (void *)v43[5];
  v43[5] = v10;

  objc_sync_exit(v9);
  uint64_t v12 = (void *)v43[5];
  if (v12)
  {
    id v13 = [v12 managedObjectContext];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      id v20 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        +[ICAccount(Management) cloudKitAccountInContext:]();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_651;
      v32[3] = &unk_1E64A62E8;
      uint64_t v35 = &v42;
      id v36 = a1;
      id v33 = v6;
      id v34 = v4;
      [v34 performBlockAndWait:v32];
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      long long v15 = [(id)v43[5] managedObjectContext];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_2;
      v27[3] = &unk_1E64A6310;
      v27[4] = &v28;
      v27[5] = &v42;
      [v15 performBlockAndWait:v27];

      if (*((unsigned char *)v29 + 24))
      {
        __int16 v16 = os_log_create("com.apple.notes", "Accounts");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          +[ICAccount(Management) cloudKitAccountInContext:].cold.4();
        }

        id v17 = (void *)v43[5];
        v43[5] = 0;
      }
      _Block_object_dispose(&v28, 8);
    }
  }
  else if (objc_msgSend(v6, "ic_isNotesEnabled"))
  {
    id v18 = [v6 identifier];
    if (v18)
    {
      long long v19 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        +[ICAccount(Management) cloudKitAccountInContext:]();
      }

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke;
      v37[3] = &unk_1E64A62E8;
      uint64_t v40 = &v42;
      id v41 = a1;
      id v38 = v18;
      id v39 = v4;
      [v39 performBlockAndWait:v37];
    }
  }
  else
  {
    long long v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(Management) cloudKitAccountInContext:]();
    }
  }
  id v22 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v22);
  [(id)accountForAppleCloudKitTable setObject:v43[5] forKey:v4];
  objc_sync_exit(v22);

  id v23 = [(id)v43[5] managedObjectContext];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_652;
  v26[3] = &unk_1E64A45A0;
  v26[4] = &v42;
  [v23 performBlockAndWait:v26];

  id v24 = (id)v43[5];
  _Block_object_dispose(&v42, 8);

  return v24;
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) accountWithIdentifier:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_651(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  id v6 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v2 accountWithIdentifier:v6 context:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isDeleted];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_652(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_652_cold_1(a1, v2);
  }
}

+ (id)cloudKitIfMigratedElseLocalAccountInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cloudKitAccountInContext:v4];
  id v6 = v5;
  if (v5 && [v5 didChooseToMigrate])
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [a1 allActiveCloudKitAccountsInContext:v4];
    if ([v8 count]) {
      [v8 firstObject];
    }
    else {
    id v7 = [a1 localAccountInContext:v4];
    }
  }
  return v7;
}

+ (id)defaultAccountInContext:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = (const __CFString *)ICSettingsBundleID();
  CFPreferencesAppSynchronize(v5);
  CFStringRef v6 = (const __CFString *)ICSettingsBundleID();
  id v7 = (void *)CFPreferencesCopyAppValue(@"DefaultNotesAccount", v6);
  uint64_t v8 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ICAccount(Management) defaultAccountInContext:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }

  if ([MEMORY[0x1E4F83738] isRunningUnitTests])
  {
    long long v15 = +[ICDefaultAccountUtilities _defaultAccountIdentifierForTests];
    if ([v15 length])
    {
      id v16 = v15;

      id v17 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        +[ICAccount(Management) defaultAccountInContext:]();
      }

      id v7 = v16;
    }
  }
  if (v7)
  {
    id v18 = +[ICAccount accountWithIdentifier:v7 context:v4];
    long long v19 = v18;
    if (v18 && [v18 didChooseToMigrate])
    {
      id v20 = v19;
      long long v19 = v20;
      goto LABEL_20;
    }
  }
  else
  {
    long long v19 = 0;
  }
  if (![v7 isEqualToString:*MEMORY[0x1E4F82D38]]
    || ([a1 localAccountInContext:v4],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 didChooseToMigrate],
        v21,
        !v22)
    || ([a1 localAccountInContext:v4], (id v20 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v23 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(Management) defaultAccountInContext:]();
    }

    id v20 = [a1 cloudKitIfMigratedElseLocalAccountInContext:v4];
  }
LABEL_20:
  id v24 = v20;

  return v24;
}

+ (id)activeAccountWithUserRecordName:(id)a3 context:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  CFStringRef v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"didChooseToMigrate == YES && userRecordName == %@", a3];
  uint64_t v9 = (void *)MEMORY[0x1E4F29008];
  uint64_t v10 = NSStringFromSelector(sel_accountType);
  uint64_t v11 = [v9 sortDescriptorWithKey:v10 ascending:1];

  v16[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v13 = objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v8, v12, v7);

  uint64_t v14 = [v13 firstObject];

  return v14;
}

+ (id)allAccountsInContext:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F29008];
  id v5 = a3;
  CFStringRef v6 = (void *)[[v4 alloc] initWithKey:@"name" ascending:1];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  uint64_t v8 = objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", 0, v7, v5);

  return v8;
}

+ (id)allAccountIdentifiersInContext:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1C877DB80]();
  id v5 = +[ICAccount fetchRequest];
  [v5 setResultType:2];
  [v5 setPropertiesToFetch:&unk_1F1F62C28];
  CFStringRef v6 = [v3 executeFetchRequest:v5 error:0];
  id v7 = [v6 valueForKey:@"identifier"];
  if (v7) {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)passwordProtectedNoteIdentifiersInAccountIdentifier:(id)a3 context:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"folder.account.identifier == %@", a3];
  v13[0] = v7;
  uint64_t v8 = +[ICCloudSyncingObject predicateForPasswordProtectedObjects];
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  uint64_t v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v9];
  uint64_t v11 = +[ICNote noteIdentifiersMatchingPredicate:v10 context:v6];

  return v11;
}

+ (id)allActiveAccountsInContext:(id)a3
{
  return (id)[a1 allActiveAccountsInContext:a3 sortDescriptors:0 relationshipKeyPathsForPrefetching:0];
}

+ (id)allActiveAccountsInContextSortedByAccountType:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F29008];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithKey:@"accountType" ascending:1];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = [a1 allActiveAccountsInContext:v5 sortDescriptors:v7 relationshipKeyPathsForPrefetching:0];

  return v8;
}

+ (id)allActiveAccountsInContextWithDefaultBeingFirstIfApplicable:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allActiveAccountsInContext:v4];
  id v6 = +[ICAccount defaultAccountInContext:v4];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__ICAccount_Management__allActiveAccountsInContextWithDefaultBeingFirstIfApplicable___block_invoke;
  void v13[3] = &unk_1E64A6338;
  id v14 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v5, "ic_objectsPassingTest:", v13);
  uint64_t v9 = [v8 firstObject];

  if (v9)
  {
    uint64_t v10 = (void *)[v5 mutableCopy];
    [v10 removeObject:v9];
    [v10 insertObject:v9 atIndex:0];
    uint64_t v11 = [v10 copy];

    id v5 = (void *)v11;
  }

  return v5;
}

uint64_t __85__ICAccount_Management__allActiveAccountsInContextWithDefaultBeingFirstIfApplicable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (id)allActiveAccountsInContext:(id)a3 sortDescriptors:(id)a4 relationshipKeyPathsForPrefetching:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_msgSend(v8, "predicateWithFormat:", @"accountType != %d || didChooseToMigrate == YES", 1);
  uint64_t v13 = objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:", v12, v10, v9, 0, v11);

  return v13;
}

+ (id)allCloudKitAccountsInContext:(id)a3
{
  return (id)[a1 accountsWithAccountType:1 context:a3];
}

+ (id)allActiveCloudKitAccountsInContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "predicateWithFormat:", @"accountType == %d && didChooseToMigrate == YES", 1);
  id v7 = [a1 accountsMatchingPredicate:v6 context:v5];

  return v7;
}

+ (id)accountsWithAccountType:(int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "predicateWithFormat:", @"accountType == %d", v4);
  id v9 = [a1 accountsMatchingPredicate:v8 context:v7];

  return v9;
}

+ (BOOL)isCloudKitAccountAvailable
{
  char v3 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v4 = +[ICNoteContext sharedContext];
  id v5 = v4;
  if (v3) {
    [v4 managedObjectContext];
  }
  else {
  id v6 = [v4 workerManagedObjectContext];
  }

  char v7 = [a1 isCloudKitAccountAvailableInContext:v6];
  return v7;
}

+ (BOOL)clearAccountForAppleCloudKitTable
{
  id v2 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v2);
  uint64_t v3 = [(id)accountForAppleCloudKitTable count];
  BOOL v4 = v3 != 0;
  if (v3)
  {
    id v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(Management) clearAccountForAppleCloudKitTable]();
    }

    [(id)accountForAppleCloudKitTable removeAllObjects];
  }
  objc_sync_exit(v2);

  id v6 = (id)accountsForAppleCloudKitTable;
  objc_sync_enter(v6);
  if ([(id)accountsForAppleCloudKitTable count])
  {
    char v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(Management) clearAccountForAppleCloudKitTable]();
    }

    [(id)accountsForAppleCloudKitTable removeAllObjects];
    BOOL v4 = 1;
  }
  objc_sync_exit(v6);

  return v4;
}

+ (BOOL)hasModernAccountInContext:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ICAccount_Management__hasModernAccountInContext___block_invoke;
  v7[3] = &unk_1E64A44A8;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __51__ICAccount_Management__hasModernAccountInContext___block_invoke(uint64_t a1)
{
  id v2 = +[ICAccount allActiveAccountsInContext:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

- (BOOL)isInICloudAccount
{
  id v2 = self;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ICAccount *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ICAccount_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A4528;
  void v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__ICAccount_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accountType];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 1;
  return result;
}

- (id)recordZoneName
{
  return (id)*MEMORY[0x1E4F19D88];
}

- (NSString)recordType
{
  return (NSString *)(id)*MEMORY[0x1E4F19D80];
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

- (BOOL)needsToBePushedToCloud
{
  id v3 = [(ICAccount *)self userRecordName];
  if ([v3 length])
  {
    v6.receiver = self;
    v6.super_class = (Class)ICAccount;
    BOOL v4 = [(ICCloudSyncingObject *)&v6 needsToBePushedToCloud];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a3;
  uint64_t v8 = +[ICAccount cloudKitAccountWithIdentifier:a4 context:a5];
  char v9 = v8;
  id v10 = 0;
  if (v7)
  {
    if (v8)
    {
      id v10 = [v8 userRecordName];
      if (v10)
      {
        id v11 = [v9 userRecordName];
        uint64_t v12 = [v7 recordName];
        int v13 = [v11 isEqualToString:v12];

        if (v13) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
      }
    }
  }

  return v10;
}

+ (id)allCloudObjectIDsInContext:(id)a3 passingTest:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[ICAccount allCloudKitAccountsInContext:a3];
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__ICAccount_CloudKit__allCloudObjectIDsInContext_passingTest___block_invoke;
    v18[3] = &unk_1E64A6D68;
    long long v19 = v5;
    id v7 = objc_msgSend(v6, "ic_objectsPassingTest:", v18);
    uint64_t v8 = objc_msgSend(v7, "ic_compactMap:", &__block_literal_global_36);

    char v9 = v19;
  }
  else
  {
    char v9 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(CloudKit) allCloudObjectIDsInContext:passingTest:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

uint64_t __62__ICAccount_CloudKit__allCloudObjectIDsInContext_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, a4);
  }
  else {
    return 1;
  }
}

uint64_t __62__ICAccount_CloudKit__allCloudObjectIDsInContext_passingTest___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

+ (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  id v8 = a3;
  id v9 = a6;
  uint64_t v10 = +[ICAccount allCloudKitAccountsInContext:v8];
  if (v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__ICAccount_CloudKit__enumerateAllCloudObjectsInContext_batchSize_saveAfterBatch_usingBlock___block_invoke;
    v19[3] = &unk_1E64A6DB0;
    id v20 = v9;
    [v10 enumerateObjectsUsingBlock:v19];
    if (v7) {
      objc_msgSend(v8, "ic_saveWithLogDescription:", @"Saving after enumerating all accounts");
    }
    uint64_t v11 = v20;
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[ICAccount(CloudKit) enumerateAllCloudObjectsInContext:batchSize:saveAfterBatch:usingBlock:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t __93__ICAccount_CloudKit__enumerateAllCloudObjectsInContext_batchSize_saveAfterBatch_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  return 0;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a3;
  if (!a5)
  {
    v44.receiver = self;
    v44.super_class = (Class)ICAccount;
    if (![(ICCloudSyncingObject *)&v44 mergeCloudKitRecord:v10 accountID:a4 approach:0 mergeableFieldState:a6])goto LABEL_9; {
    uint64_t v14 = [v10 recordID];
    }
    uint64_t v15 = [v14 recordName];
    [(ICAccount *)self setUserRecordName:v15];

    uint64_t v16 = [v10 objectForKeyedSubscript:@"DidChooseToMigrate"];
    uint64_t v17 = v16;
    if (!v16
      || (int v18 = [v16 BOOLValue],
          v18 == [(ICAccount *)self didChooseToMigrate]))
    {
      int v21 = 0;
    }
    else
    {
      id v19 = (id)[(ICAccount *)self ic_postNotificationOnMainThreadAfterSaveWithName:*MEMORY[0x1E4F836A8]];
      -[ICAccount setDidChooseToMigrate:](self, "setDidChooseToMigrate:", [v17 BOOLValue]);
      id v20 = (id)[(ICAccount *)self ic_postNotificationOnMainThreadAfterSaveWithName:*MEMORY[0x1E4F836A0]];
      if (([(ICAccount *)self didChooseToMigrate] & 1) == 0) {
        +[ICNoteContext setLegacyNotesDisabled:0];
      }
      int v21 = 1;
    }
    id v24 = [v10 objectForKeyedSubscript:@"DidFinishMigration"];
    uint64_t v25 = v24;
    if (v24)
    {
      int v26 = [v24 BOOLValue];
      if (v26 != [(ICAccount *)self didFinishMigration])
      {
        -[ICAccount setDidFinishMigration:](self, "setDidFinishMigration:", [v25 BOOLValue]);
        int v21 = 1;
      }
    }
    v27 = [v10 objectForKeyedSubscript:@"DidMigrateOnMac"];
    uint64_t v28 = v27;
    if (!v27
      || (int v29 = [v27 BOOLValue],
          v29 == [(ICAccount *)self didMigrateOnMac]))
    {
      if (!v21)
      {
LABEL_24:

        BOOL v22 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      -[ICAccount setDidMigrateOnMac:](self, "setDidMigrateOnMac:", [v28 BOOLValue]);
    }
    uint64_t v30 = +[ICNoteContext sharedContext];
    char v31 = [v30 primaryICloudACAccount];

    if (v31)
    {
      v32 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[ICAccount(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:](v32, v33, v34, v35, v36, v37, v38, v39);
      }

      uint64_t v40 = [(ICAccount *)self didChooseToMigrate];
      uint64_t v41 = [(ICAccount *)self didFinishMigration];
      uint64_t v42 = [(ICAccount *)self didMigrateOnMac];
      v43 = [v31 accountStore];
      +[ICMigrationUtilities saveDidChooseToMigrate:v40 didFinishMigration:v41 didMigrateOnMac:v42 toACAccount:v31 inStore:v43 completionHandler:0];
    }
    goto LABEL_24;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F836F8];
  uint64_t v12 = [(ICAccount *)self className];
  uint64_t v13 = ICStringFromSyncingApproach(a5);
  [v11 handleFailedAssertWithCondition:"__objc_no", "-[ICAccount(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v12, v13 functionName simulateCrash showAlert format];

LABEL_9:
  BOOL v22 = 0;
LABEL_10:

  return v22;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  if (a3)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F836F8];
    BOOL v7 = [(ICAccount *)self className];
    id v8 = ICStringFromSyncingApproach(a3);
    [v6 handleFailedAssertWithCondition:"__objc_no", "-[ICAccount(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v7, v8 functionName simulateCrash showAlert format];

    id v9 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICAccount;
    id v9 = [(ICCloudSyncingObject *)&v20 makeCloudKitRecordForApproach:0 mergeableFieldState:a4];
    id v10 = [(ICAccount *)self cryptoVerifier];
    [v9 setObject:v10 forKeyedSubscript:@"CryptoVerifier"];

    uint64_t v11 = [(ICAccount *)self cryptoSalt];
    [v9 setObject:v11 forKeyedSubscript:@"CryptoSalt"];

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[ICAccount cryptoIterationCount](self, "cryptoIterationCount"));
    [v9 setObject:v12 forKeyedSubscript:@"CryptoIterationCount"];

    uint64_t v13 = [(ICCloudSyncingObject *)self passwordHint];
    uint64_t v14 = [v13 dataUsingEncoding:4];
    uint64_t v15 = [v9 encryptedValues];
    [v15 setObject:v14 forKeyedSubscript:@"PasswordHint"];

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAccount didChooseToMigrate](self, "didChooseToMigrate"));
    [v9 setObject:v16 forKeyedSubscript:@"DidChooseToMigrate"];

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAccount didFinishMigration](self, "didFinishMigration"));
    [v9 setObject:v17 forKeyedSubscript:@"DidFinishMigration"];

    int v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAccount didMigrateOnMac](self, "didMigrateOnMac"));
    [v9 setObject:v18 forKeyedSubscript:@"DidMigrateOnMac"];
  }
  return v9;
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ICAccount.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);
}

- (void)setMarkedForDeletion:.cold.1()
{
  id v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v1, v2, "Trying to set an account marked for deletion: %@", v3, v4, v5, v6, v7);
}

+ (void)standardFolderIdentifierWithPrefix:accountIdentifier:accountType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "No identifier for account when trying to get standard %@ identifier", v2, v3, v4, v5, v6);
}

- (void)compare:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (objc_class *)objc_opt_class();
  uint8_t v7 = NSStringFromClass(v6);
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  int v10 = 138412802;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Trying to compare an %@ with a non-%@: %@", (uint8_t *)&v10, 0x20u);
}

- (void)uniqueUserParticipants
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching shared notes: %@", v2, v3, v4, v5, v6);
}

- (void)systemPaperTemporaryDirectoryURL
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error creating temporary directory for system paper — falling back to system's temporary directory {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)mostRecentSystemPaperNoteInManagedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "No notes in system paper folder.", v2, v3, v4, v5, v6);
}

+ (void)mostRecentSystemPaperNoteInManagedObjectContext:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Suggesting most recently modified system paper note: %@", v4, v5, v6, v7, v8);
}

+ (void)mostRecentSystemPaperNoteInManagedObjectContext:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Encountered error while trying to fetch most recent system paper note: %@", v2, v3, v4, v5, v6);
}

void __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetched user's full name and primary email address", v2, v3, v4, v5, v6);
}

void __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching user's full name and primary email address {error: %@}", v2, v3, v4, v5, v6);
}

- (void)setResolvedLockedNotesMode:(void *)a1 .cold.1(void *a1, __int16 a2)
{
  uint64_t v3 = [a1 shortLoggingDescription];
  uint64_t v4 = NSStringFromAccountDataLockedNotesMode(a2);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Setting locked notes mode… {account: %@, mode: %@}", v7, v8, v9, v10, v11);
}

- (void)setResolvedLockedNotesMode:(void *)a1 .cold.2(void *a1, __int16 a2)
{
  uint64_t v3 = [a1 shortLoggingDescription];
  uint64_t v4 = NSStringFromAccountDataLockedNotesMode(a2);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Not setting locked notes mode because it hasn't changed {account: %@, mode: %@}", v7, v8, v9, v10, v11);
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_652_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectID];
  int v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) didChooseToMigrate];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Returning account for primary iCloud Apple Account {accountID: %@, didChooseToMigrate: %d}", (uint8_t *)&v6, 0x12u);
}

@end