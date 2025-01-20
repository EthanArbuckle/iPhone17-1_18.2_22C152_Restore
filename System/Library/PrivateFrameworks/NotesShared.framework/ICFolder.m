@interface ICFolder
+ (BOOL)isTitleValid:(id)a3 account:(id)a4 folder:(id)a5 parentFolder:(id)a6 error:(id *)a7;
+ (BOOL)isTitleValid:(id)a3 account:(id)a4 parentFolder:(id)a5 error:(id *)a6;
+ (BOOL)supportsActivityEvents;
+ (BOOL)supportsUserSpecificRecords;
+ (ICFolder)folderWithIdentifier:(id)a3 context:(id)a4;
+ (NSString)englishTitleForDefaultFolder;
+ (NSString)englishTitleForSystemPaperFolder;
+ (NSString)englishTitleForTrashFolder;
+ (NSString)localizedTitleForDefaultFolder;
+ (NSString)localizedTitleForSystemPaperFolder;
+ (NSString)localizedTitleForTrashFolder;
+ (id)allFoldersInContext:(id)a3;
+ (id)ancestorFolderPredicatesWithBlock:(id)a3;
+ (id)contentInfoTextWithNoteCount:(int64_t)a3 subfolderCount:(int64_t)a4;
+ (id)deduplicatingTitle:(id)a3 account:(id)a4;
+ (id)deduplicatingTitle:(id)a3 forFolder:(id)a4 forNewFolderParent:(id)a5 ofAccount:(id)a6;
+ (id)deduplicatingTitle:(id)a3 forFolder:(id)a4 ofAccount:(id)a5;
+ (id)defaultFolderInContext:(id)a3;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud;
+ (id)keyPathsForValuesAffectingCustomNoteSortType;
+ (id)keyPathsForValuesAffectingDepth;
+ (id)keyPathsForValuesAffectingIsDefaultFolderForAccount;
+ (id)keyPathsForValuesAffectingIsLeaf;
+ (id)keyPathsForValuesAffectingIsTrashFolder;
+ (id)keyPathsForValuesAffectingSupportsCustomNoteSortType;
+ (id)keyPathsForValuesAffectingSupportsEditingNotes;
+ (id)keyPathsForValuesAffectingTitleForTableViewCell;
+ (id)keyPathsForValuesAffectingVisibleNoteContainerChildren;
+ (id)keyPathsForValuesAffectingVisibleNotesCount;
+ (id)localizedNewFolderName;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newFolderInAccount:(id)a3;
+ (id)newFolderInParentFolder:(id)a3;
+ (id)newFolderWithIdentifier:(id)a3 account:(id)a4;
+ (id)newFolderWithIdentifier:(id)a3 account:(id)a4 query:(id)a5;
+ (id)newFolderWithIdentifier:(id)a3 parentFolder:(id)a4;
+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)objc_defaultSmartFolderTitleWithComponents:(id)a3;
+ (id)objc_smartFolderWithQuery:(id)a3 account:(id)a4;
+ (id)objc_smartFolderWithQuery:(id)a3 titleComponents:(id)a4 account:(id)a5;
+ (id)predicateForDeprecatedObjects;
+ (id)predicateForFoldersInFolder:(id)a3;
+ (id)predicateForNotesInFolder:(id)a3;
+ (id)predicateForVisibleCustomFolders;
+ (id)predicateForVisibleFoldersInContext:(id)a3;
+ (id)predicateForVisibleFoldersIncludingHiddenNoteContainers:(BOOL)a3 inContext:(id)a4;
+ (id)predicateForVisibleObjects;
+ (id)purgableFoldersFetchRequest;
+ (id)reservedFolderTitles;
+ (id)rootSharingFolderForNote:(id)a3;
+ (id)shareType;
+ (id)stringByScrubbingStringForFolderName:(id)a3;
+ (id)visibleFoldersInContext:(id)a3;
+ (id)visibleSmartFoldersForHashtagStandardizedContent:(id)a3 account:(id)a4;
+ (unint64_t)countOfFoldersMatchingPredicate:(id)a3 context:(id)a4;
+ (unint64_t)folderDepthLimit;
+ (unint64_t)maximumDepthOfFolders:(id)a3;
+ (unint64_t)maximumDistanceToLeafFolderOfFolders:(id)a3;
+ (void)deleteFolder:(id)a3;
+ (void)purgeFolder:(id)a3;
- (BOOL)allowsExporting;
- (BOOL)allowsImporting;
- (BOOL)canAddSubfolder;
- (BOOL)canBeRootShareObject;
- (BOOL)canBeSharedViaICloud;
- (BOOL)canMoveAddOrDeleteContents;
- (BOOL)containsSharedDescendantFolders;
- (BOOL)containsSharedDescendantFolders:(BOOL *)a3;
- (BOOL)containsSharedNotesOrSharedDescendantFolders;
- (BOOL)containsSharedNotesOrSharedDescendantFolders:(BOOL *)a3;
- (BOOL)hasAllMandatoryFields;
- (BOOL)hasSharedContentsNotSharedViaSharedFolder:(id)a3;
- (BOOL)isAncestorOfFolder:(id)a3;
- (BOOL)isDefaultFolderForAccount;
- (BOOL)isDefaultFolderOrDescendantOfDefaultFolder;
- (BOOL)isDeletable;
- (BOOL)isDeprecated;
- (BOOL)isDescendantOfFolder:(id)a3;
- (BOOL)isEditableSmartFolder;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isInICloudAccount;
- (BOOL)isLeaf;
- (BOOL)isModernCustomFolder;
- (BOOL)isMovable;
- (BOOL)isRenamable;
- (BOOL)isSharedViaSharedFolder:(id)a3;
- (BOOL)isShowingDateHeaders;
- (BOOL)isSmartFolder;
- (BOOL)isSubfolderOfReadonlyFolder;
- (BOOL)isSystemFolder;
- (BOOL)isTitleValid:(id)a3 error:(id *)a4;
- (BOOL)isTrashFolder;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)supportsCustomNoteSortType;
- (BOOL)supportsDateHeaders;
- (BOOL)supportsEditingNotes;
- (BOOL)validate;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)visibleChildFoldersContainsFolderWithTitle:(id)a3;
- (BOOL)wantsUserSpecificRecord;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (ICQueryObjC)smartFolderQueryObjC;
- (NSArray)ancestorFolderObjectIDs;
- (NSArray)authorsExcludingCurrentUser;
- (NSArray)foldersInFolder;
- (NSArray)visibleNotesInFolder;
- (NSString)dataSourceIdentifier;
- (NSString)localizedTitle;
- (NSString)recordType;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (NSString)smartFolderDescriptionObjC;
- (NSString)smartFolderShortDescriptionObjC;
- (id)accountName;
- (id)associatedNoteParticipants;
- (id)cacheKey;
- (id)childCloudObjects;
- (id)customNoteSortType;
- (id)dataForTypeIdentifier:(id)a3;
- (id)fileURLForTypeIdentifier:(id)a3;
- (id)ic_loggingValues;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)pinnedNotesInFolder;
- (id)predicateForAttachmentsInFolder;
- (id)predicateForFoldersInFolder;
- (id)predicateForNotesInFolder;
- (id)predicateForPinnedNotesInFolder;
- (id)predicateForVisibleAttachmentsInFolder;
- (id)predicateForVisibleNotesInFolder;
- (id)recordZoneName;
- (id)recursiveVisibleSubfolders;
- (id)rootSharedFoldersInDescendantsIncludingSelf;
- (id)rootSharedNotesIncludingChildFolders;
- (id)rootSharingFolder;
- (id)searchableTextContent;
- (id)shareType;
- (id)visibleNoteContainerChildren;
- (id)visibleNoteContainerChildrenUnsorted;
- (id)visibleNotesIncludingChildFolders;
- (int64_t)compare:(id)a3;
- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3;
- (int64_t)visibilityTestingType;
- (unint64_t)countOfVisibleNotesInFolder;
- (unint64_t)depth;
- (unint64_t)indexOfVisibleChild:(id)a3;
- (unint64_t)maximumDepthIncludingChildFolders;
- (unint64_t)maximumDistanceToLeafFolder;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (unint64_t)visibleNoteContainerChildrenCount;
- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3;
- (void)awakeFromFetch;
- (void)deleteFromLocalDatabase;
- (void)fixBrokenReferences;
- (void)markForDeletion;
- (void)mergeParentFromRecord:(id)a3;
- (void)objectWasDeletedFromCloudByAnotherDevice;
- (void)recursivelyAddSubfoldersToArray:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCustomNoteSortType:(id)a3;
- (void)setFolderType:(signed __int16)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setNeedsInitialFetchFromCloud:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setSmartFolderQueryJSON:(id)a3;
- (void)setSmartFolderQueryObjC:(id)a3;
- (void)setTitle:(id)a3;
- (void)unmarkForDeletionIncludingParentHierarchy;
- (void)updateChangeCountWithReason:(id)a3;
- (void)updateSortOrder;
@end

@implementation ICFolder

- (BOOL)isSystemFolder
{
  if ([(ICFolder *)self isDefaultFolderForAccount]) {
    return 1;
  }
  return [(ICFolder *)self isTrashFolder];
}

- (BOOL)isSmartFolder
{
  return ![(ICFolder *)self isDefaultFolderForAccount]
      && ![(ICFolder *)self isTrashFolder]
      && [(ICFolder *)self folderType] == 2;
}

- (BOOL)isTrashFolder
{
  int v3 = [(ICFolder *)self folderType];
  if (v3 != 1)
  {
    v4 = [(ICFolder *)self identifier];
    char v5 = [v4 hasPrefix:@"TrashFolder"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)awakeFromFetch
{
  v4.receiver = self;
  v4.super_class = (Class)ICFolder;
  [(ICCloudSyncingObject *)&v4 awakeFromFetch];
  [(ICFolder *)self updateSortOrder];
  if ([(ICFolder *)self folderType] == 1) {
    BOOL v3 = [(ICFolder *)self visibleNotesCount] == 0;
  }
  else {
    BOOL v3 = [(ICFolder *)self isDeprecated];
  }
  [(ICFolder *)self setIsHiddenNoteContainer:v3];
}

- (BOOL)isDeprecated
{
  return [(ICFolder *)self folderType] == 3;
}

- (void)updateSortOrder
{
  if ([(ICFolder *)self isDefaultFolderOrDescendantOfDefaultFolder])
  {
    uint64_t v3 = 1;
  }
  else if ([(ICFolder *)self folderType] == 1)
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 2;
  }
  [(ICFolder *)self setSortOrder:v3];
}

- (BOOL)isDefaultFolderOrDescendantOfDefaultFolder
{
  uint64_t v3 = [(ICFolder *)self parent];

  if (v3)
  {
    objc_super v4 = [(ICFolder *)self parent];
    char v5 = [v4 isDefaultFolderOrDescendantOfDefaultFolder];

    return v5;
  }
  else
  {
    return [(ICFolder *)self isDefaultFolderForAccount];
  }
}

- (int64_t)compare:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(ICFolder *)self isDefaultFolderForAccount])
    {
      int64_t v6 = -1;
LABEL_57:

      goto LABEL_58;
    }
    if ([v5 isDefaultFolderForAccount])
    {
      int64_t v6 = 1;
      goto LABEL_57;
    }
    int v14 = [(ICFolder *)self sortOrder];
    if (v14 != [v5 sortOrder])
    {
      int v25 = [(ICFolder *)self sortOrder];
      if (v25 > (int)[v5 sortOrder]) {
        int64_t v6 = 1;
      }
      else {
        int64_t v6 = -1;
      }
      goto LABEL_57;
    }
    v15 = [(ICFolder *)self parent];
    v16 = [v5 parent];

    if (v15 != v16)
    {
      v17 = self;
      id v18 = v5;
      unint64_t v19 = [(ICFolder *)v17 depth];
      unint64_t v20 = [v18 depth];
      unint64_t v21 = v20;
      v22 = v17;
      if (v19 <= v20)
      {
        v24 = v18;
        if (v20 > v19)
        {
          v24 = v18;
          do
          {
            v27 = v24;
            v24 = [v24 parent];

            --v21;
          }
          while (v21 > v19);
          v22 = v17;
        }
      }
      else
      {
        do
        {
          v23 = v22;
          v22 = [v22 parent];

          --v19;
        }
        while (v19 > v21);
        v24 = v18;
      }
      v28 = [v22 parent];
      v29 = [v24 parent];

      if (v28 == v29)
      {
        v30 = v22;
        v31 = v24;
      }
      else
      {
        do
        {
          v30 = [v22 parent];

          v31 = [v24 parent];

          v32 = [v30 parent];
          v33 = [v31 parent];

          v24 = v31;
          v22 = v30;
        }
        while (v32 != v33);
      }
      if ([v30 isEqual:v31])
      {
        unint64_t v34 = [(ICFolder *)v17 depth];
        if (v34 < [v18 depth]) {
          int64_t v6 = -1;
        }
        else {
          int64_t v6 = 1;
        }
      }
      else
      {
        int64_t v6 = [v30 compare:v31];
      }

      goto LABEL_57;
    }
    v26 = [(ICFolder *)self parent];
    if (v26) {
      [(ICFolder *)self parent];
    }
    else {
    v35 = [(ICFolder *)self account];
    }
    v36 = [v35 subFolderIdentifiersOrderedSet];

    if (v36 && [v36 count])
    {
      v37 = [(ICFolder *)self identifier];
      unint64_t v38 = [v36 indexOfObject:v37];

      v39 = [v5 identifier];
      unint64_t v40 = [v36 indexOfObject:v39];

      if (v38 != 0x7FFFFFFFFFFFFFFFLL && v38 == v40) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"indexOfSelf != indexOfOther || indexOfSelf == NSNotFound" functionName:"-[ICFolder compare:]" simulateCrash:1 showAlert:0 format:@"trying to compare folders that have the same ordering index"];
      }
      if (v38 != 0x7FFFFFFFFFFFFFFFLL && v40 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v38 < v40) {
          int64_t v6 = -1;
        }
        else {
          int64_t v6 = 1;
        }
        goto LABEL_56;
      }
      if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v6 = -1;
      }
      else {
        int64_t v6 = 1;
      }
      BOOL v41 = v40 == 0x7FFFFFFFFFFFFFFFLL || v38 == 0x7FFFFFFFFFFFFFFFLL;
      if (v38 != v40 && v41) {
        goto LABEL_56;
      }
    }
    v42 = [(ICFolder *)self localizedTitle];
    v43 = [v5 localizedTitle];
    int64_t v6 = [v42 localizedStandardCompare:v43];

LABEL_56:
    goto LABEL_57;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    int64_t v6 = 1;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v45 = 138412802;
      v46 = v9;
      __int16 v47 = 2112;
      v48 = v11;
      __int16 v49 = 2112;
      v50 = v13;
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Trying to compare an %@ with a non-%@: %@", (uint8_t *)&v45, 0x20u);
    }
    int64_t v6 = 0;
  }
LABEL_58:

  return v6;
}

- (BOOL)isDefaultFolderForAccount
{
  uint64_t v3 = [(ICFolder *)self account];
  id v4 = [v3 standardFolderIdentifierWithPrefix:@"DefaultFolder"];

  id v5 = [(ICFolder *)self identifier];
  int64_t v6 = v5;
  if (v4) {
    char v7 = [v5 isEqualToString:v4];
  }
  else {
    char v7 = [v5 hasPrefix:@"DefaultFolder"];
  }
  BOOL v8 = v7;

  return v8;
}

- (NSString)localizedTitle
{
  if ([(ICFolder *)self isDefaultFolderForAccount])
  {
    uint64_t v3 = +[ICFolder localizedTitleForDefaultFolder];
LABEL_5:
    id v4 = (__CFString *)v3;
    goto LABEL_9;
  }
  if ([(ICFolder *)self folderType] == 1)
  {
    uint64_t v3 = +[ICFolder localizedTitleForTrashFolder];
    goto LABEL_5;
  }
  uint64_t v5 = [(ICFolder *)self title];
  int64_t v6 = (void *)v5;
  char v7 = &stru_1F1F2FFF8;
  if (v5) {
    char v7 = (__CFString *)v5;
  }
  id v4 = v7;

LABEL_9:
  return (NSString *)v4;
}

- (BOOL)supportsEditingNotes
{
  return [(ICFolder *)self folderType] != 1;
}

+ (id)ancestorFolderPredicatesWithBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (+[ICFolder folderDepthLimit])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 1;
    do
    {
      char v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = v6;
      do
      {
        [v7 addObject:@"parent"];
        --v8;
      }
      while (v8);
      v9 = [v7 componentsJoinedByString:@"."];
      v10 = v3[2](v3, v9);
      [v4 addObject:v10];

      ++v5;
      ++v6;
    }
    while (v5 < +[ICFolder folderDepthLimit]);
  }

  return v4;
}

+ (unint64_t)folderDepthLimit
{
  return 4;
}

- (unint64_t)countOfVisibleNotesInFolder
{
  uint64_t v3 = [(ICFolder *)self predicateForVisibleNotesInFolder];
  id v4 = [(ICFolder *)self managedObjectContext];
  unint64_t v5 = +[ICNote countOfNotesMatchingPredicate:v3 context:v4];

  return v5;
}

- (id)predicateForVisibleNotesInFolder
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (![(ICFolder *)self isSmartFolder]) {
    goto LABEL_4;
  }
  uint64_t v3 = [(ICFolder *)self smartFolderQuery];
  id v4 = [v3 entityName];
  unint64_t v5 = +[ICNote entity];
  uint64_t v6 = [v5 name];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
    v9 = [(ICFolder *)self smartFolderQuery];
    v10 = [v9 predicate];
    v26[0] = v10;
    v11 = [(ICFolder *)self account];
    v12 = [v11 identifier];
    v13 = +[ICNote predicateForNotesInAccountWithIdentifier:v12];
    v26[1] = v13;
    int v14 = +[ICCloudSyncingObject predicateForFetchedFromCloudObjects];
    v26[2] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    v16 = [v8 andPredicateWithSubpredicates:v15];
  }
  else
  {
LABEL_4:
    int v17 = [(ICFolder *)self folderType];
    if (v17 == 1)
    {
      uint64_t v18 = 1;
      uint64_t v19 = 1;
      uint64_t v20 = 1;
    }
    else
    {
      uint64_t v19 = +[ICAccount hidesSystemPaperNotesInCustomFolders] ^ 1;
      uint64_t v18 = +[ICAccount hidesMathNotesInCustomFolders] ^ 1;
      uint64_t v20 = +[ICAccount hidesCallNotesInCustomFolders] ^ 1;
    }
    unint64_t v21 = [(ICFolder *)self predicateForNotesInFolder];
    v22 = [(ICFolder *)self managedObjectContext];
    v23 = +[ICNote predicateForVisibleNotesIncludingTrash:v17 == 1 includingSystemPaper:v19 includingMathNotes:v18 includingCallNotes:v20 inContext:v22];
    v25[1] = v23;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v9];
  }

  return v16;
}

- (id)predicateForNotesInFolder
{
  uint64_t v3 = objc_opt_class();
  return (id)[v3 predicateForNotesInFolder:self];
}

+ (id)predicateForNotesInFolder:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"folder == %@", a3];
}

+ (id)predicateForVisibleFoldersIncludingHiddenNoteContainers:(BOOL)a3 inContext:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend(a1, "predicateForVisibleObjects", a3, a4);
  v15[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v7 = (void *)[v6 mutableCopy];

  if (!a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"owner != self && isHiddenNoteContainer == NO"];
    v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"owner == self && SUBQUERY(owner.ownerInverse, $noteContainer, $noteContainer.markedForDeletion != YES).@count > 3", v8];
    v14[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

    v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];
    [v7 addObject:v11];
  }
  v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];

  return v12;
}

+ (id)predicateForVisibleObjects
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ICFolder;
  uint64_t v3 = objc_msgSendSuper2(&v8, sel_predicateForVisibleObjects);
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"owner.didChooseToMigrate == YES"];
  v9[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateForVisibleFoldersInContext:(id)a3
{
  return (id)[a1 predicateForVisibleFoldersIncludingHiddenNoteContainers:0 inContext:a3];
}

+ (id)predicateForDeprecatedObjects
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ICFolder;
  uint64_t v3 = objc_msgSendSuper2(&v8, sel_predicateForDeprecatedObjects);
  v9[0] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folderType != %d", 3);
  v9[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 4;
}

- (unint64_t)searchResultType
{
  return 4;
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

- (NSString)dataSourceIdentifier
{
  return (NSString *)@"Modern";
}

- (NSString)searchIndexingIdentifier
{
  v2 = [(ICFolder *)self objectID];
  uint64_t v3 = [v2 URIRepresentation];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  v2 = [(ICFolder *)self account];
  uint64_t v3 = [v2 identifier];

  return (NSString *)v3;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  id v4 = [(ICFolder *)self dateForLastTitleModification];
  [v3 setContentModificationDate:v4];

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  uint64_t v3 = [(ICFolder *)self userActivityContentAttributeSet];
  id v4 = [(ICFolder *)self title];
  [v3 setDisplayName:v4];
  [v3 setTextContent:v4];
  objc_msgSend(v3, "setIc_searchResultType:", 4);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  unint64_t v5 = [(ICFolder *)self account];
  if ([v5 isManaged]) {
    uint64_t v6 = &unk_1F1F62898;
  }
  else {
    uint64_t v6 = &unk_1F1F628B0;
  }
  [v3 setDataOwnerType:v6];

  if (objc_opt_respondsToSelector()) {
    [(ICFolder *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)searchableTextContent
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICFolder *)self title];
  if (v4) {
    [v3 addObject:v4];
  }
  unint64_t v5 = [(ICFolder *)self localizedTitle];
  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [v3 componentsJoinedByString:@" "];

  return v6;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

- (void)unmarkForDeletionIncludingParentHierarchy
{
  [(ICCloudSyncingObject *)self unmarkForDeletion];
  id v3 = [(ICFolder *)self parent];
  [v3 unmarkForDeletionIncludingParentHierarchy];
}

- (id)recordZoneName
{
  return @"Notes";
}

- (NSString)recordType
{
  return (NSString *)@"Folder";
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!a5)
  {
    v64.receiver = self;
    v64.super_class = (Class)ICFolder;
    if (![(ICCloudSyncingObject *)&v64 mergeCloudKitRecord:v10 accountID:a4 approach:0 mergeableFieldState:a6])goto LABEL_6; {
    [(ICFolder *)self unmarkForDeletionIncludingParentHierarchy];
    }
    int v14 = [v10 recordID];
    v15 = [v14 recordName];
    [(ICFolder *)self setIdentifier:v15];

    v16 = [v10 objectForKeyedSubscript:@"TitleModificationDate"];
    [(ICFolder *)self needsInitialFetchFromCloud];
    int v17 = [(ICFolder *)self title];
    uint64_t v18 = [v17 length];

    uint64_t v19 = [(ICFolder *)self dateForLastTitleModification];
    if (v19)
    {
      uint64_t v20 = [(ICFolder *)self dateForLastTitleModification];
      int v21 = objc_msgSend(v16, "ic_isLaterThanDate:", v20);
    }
    else
    {
      int v21 = 1;
    }

    v24 = [(ICCloudSyncingObject *)self userSpecificServerRecord];
    if (v24) {
      BOOL v25 = [(ICCloudSyncingObject *)self isSharedRootObject];
    }
    else {
      BOOL v25 = 0;
    }

    if (v18 && ((v25 | v21 ^ 1) & 1) != 0)
    {
LABEL_20:
      unint64_t v34 = [v10 objectForKeyedSubscript:@"ImportedFromLegacy"];

      if (v34)
      {
        v35 = [v10 objectForKeyedSubscript:@"ImportedFromLegacy"];
        -[ICFolder setImportedFromLegacy:](self, "setImportedFromLegacy:", [v35 BOOLValue]);
      }
      v36 = [(ICFolder *)self identifier];
      if ([v36 hasPrefix:@"TrashFolder"])
      {
        int v37 = [(ICFolder *)self folderType];

        if (v37 != 1)
        {
          unint64_t v38 = [(ICFolder *)self identifier];
          int v39 = [v38 isEqualToString:@"TrashFolder"];

          if (v39)
          {
            id v58 = v10;
            unint64_t v40 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3A61000, v40, OS_LOG_TYPE_DEFAULT, "Downloaded the old trash folder from the cloud. Deleting it now.", buf, 2u);
            }

            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            BOOL v41 = [(ICFolder *)self notes];
            v42 = (void *)[v41 copy];

            uint64_t v43 = [v42 countByEnumeratingWithState:&v59 objects:v65 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v60;
              do
              {
                for (uint64_t i = 0; i != v44; ++i)
                {
                  if (*(void *)v60 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  __int16 v47 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                  v48 = [v47 account];
                  __int16 v49 = [v48 trashFolder];
                  [v47 setFolder:v49];

                  v50 = [MEMORY[0x1E4F1C9C8] date];
                  [v47 setFolderModificationDate:v50];

                  [v47 updateChangeCountWithReason:@"Moved to trash folder"];
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v65 count:16];
              }
              while (v44);
            }

            +[ICFolder deleteFolder:self];
            BOOL v22 = 0;
            id v10 = v58;
LABEL_46:

            goto LABEL_7;
          }
          [(ICFolder *)self setFolderType:1];
        }
      }
      else
      {
      }
      uint64_t v51 = [(ICFolder *)self identifier];
      int v52 = [v51 hasPrefix:@"SystemPaper"];

      if (v52)
      {
        v53 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3A61000, v53, OS_LOG_TYPE_DEFAULT, "Downloaded the old System Paper folder from the cloud. Deleting it now.", buf, 2u);
        }

        +[ICFolder deleteFolder:self];
        BOOL v22 = 0;
      }
      else
      {
        v54 = objc_msgSend(v10, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"MergeableData");
        if (v54)
        {
          [(ICFolder *)self mergeWithMergeableData:v54];
          [(ICFolder *)self saveMergeableDataIfNeeded];
        }
        v55 = [v10 encryptedValues];
        v56 = [v55 objectForKeyedSubscript:@"SmartFolderQueryJSONEncrypted"];

        v57 = objc_msgSend(v56, "ic_stringValue");
        [(ICFolder *)self setSmartFolderQueryJSON:v57];
        if (v57) {
          [(ICFolder *)self setFolderType:2];
        }
        [(ICFolder *)self mergeParentFromRecord:v10];

        BOOL v22 = 1;
      }
      goto LABEL_46;
    }
    [(ICFolder *)self setDateForLastTitleModification:v16];
    v26 = [v10 encryptedValues];
    v27 = [v26 objectForKeyedSubscript:@"TitleEncrypted"];

    if (v27)
    {
      uint64_t v28 = objc_msgSend(v27, "ic_stringValue");
    }
    else
    {
      v29 = [v10 objectForKeyedSubscript:@"Title"];

      if (!v29)
      {
LABEL_19:
        v31 = [(ICFolder *)self title];
        v32 = [(ICFolder *)self account];
        v33 = +[ICFolder deduplicatingTitle:v31 forFolder:self ofAccount:v32];
        [(ICFolder *)self setTitle:v33];

        goto LABEL_20;
      }
      uint64_t v28 = [v10 objectForKeyedSubscript:@"Title"];
    }
    v30 = (void *)v28;
    [(ICFolder *)self setTitle:v28];

    goto LABEL_19;
  }
  v11 = (void *)MEMORY[0x1E4F836F8];
  v12 = [(ICFolder *)self className];
  v13 = ICStringFromSyncingApproach(a5);
  [v11 handleFailedAssertWithCondition:"__objc_no", "-[ICFolder(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v12, v13 functionName simulateCrash showAlert format];

LABEL_6:
  BOOL v22 = 0;
LABEL_7:

  return v22;
}

- (void)mergeParentFromRecord:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"ParentModificationDate"];
  if (!v5
    || ([(ICFolder *)self parentModificationDate],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    id v10 = [(ICFolder *)self parentModificationDate];

    v11 = os_log_create("com.apple.notes", "Cloud");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        -[ICFolder(CloudKit) mergeParentFromRecord:](self);
      }

      goto LABEL_31;
    }
    if (v12) {
      -[ICFolder(CloudKit) mergeParentFromRecord:](self);
    }

LABEL_14:
    v11 = [v4 objectForKeyedSubscript:@"ParentFolder"];
    v13 = [v4 share];

    int v14 = [v11 recordID];
    int v15 = objc_msgSend(v14, "ic_isOwnedByCurrentUser");

    v16 = [v4 recordID];
    BOOL v17 = +[ICUserSpecificRecordIDParser isUserSpecificRecordID:v16];

    if (v11)
    {
      if (v13) {
        int v18 = v15;
      }
      else {
        int v18 = 1;
      }
      if (v18 != 1) {
        goto LABEL_31;
      }
      uint64_t v19 = [(ICFolder *)self account];
      uint64_t v20 = [v19 identifier];

      int v21 = [v11 recordID];
      BOOL v22 = [(ICFolder *)self managedObjectContext];
      v23 = (void *)v20;
      id v24 = +[ICFolder existingCloudObjectForRecordID:v21 accountID:v20 context:v22];

      if (!v24)
      {
        v30 = v23;
        BOOL v25 = [v11 recordID];
        v26 = [v25 recordName];

        v27 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          [(ICFolder(CloudKit) *)self mergeParentFromRecord:v27];
        }

        uint64_t v28 = [(ICFolder *)self account];
        id v24 = +[ICFolder newFolderWithIdentifier:v26 account:v28];

        [v24 setNeedsInitialFetchFromCloud:1];
        v23 = v30;
      }
      [(ICFolder *)self setParent:v24];
    }
    else
    {
      if (![(ICCloudSyncingObject *)self isOwnedByCurrentUser])
      {
LABEL_31:

        goto LABEL_32;
      }
      [(ICFolder *)self setParent:0];
    }
    if (v13) {
      BOOL v29 = 0;
    }
    else {
      BOOL v29 = v17;
    }
    if (!v29) {
      [(ICFolder *)self setParentModificationDate:v5];
    }
    goto LABEL_31;
  }
  int v7 = [(ICFolder *)self parentModificationDate];
  char v8 = objc_msgSend(v5, "ic_isLaterThanDate:", v7);

  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(ICFolder(CloudKit) *)self mergeParentFromRecord:v9];
  }

  if (v8) {
    goto LABEL_14;
  }
LABEL_32:
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  v33.receiver = self;
  v33.super_class = (Class)ICFolder;
  uint64_t v6 = [(ICCloudSyncingObject *)&v33 makeCloudKitRecordForApproach:a3 mergeableFieldState:a4];
  if ([(ICCloudSyncingObject *)self isOwnedByCurrentUser]
    || ![(ICCloudSyncingObject *)self isSharedRootObject])
  {
    int v7 = [(ICFolder *)self dateForLastTitleModification];

    if (v7)
    {
      char v8 = [(ICFolder *)self dateForLastTitleModification];
      [v6 setObject:v8 forKeyedSubscript:@"TitleModificationDate"];
    }
    v9 = [(ICFolder *)self title];

    if (v9)
    {
      id v10 = [(ICFolder *)self title];
      v11 = [v10 dataUsingEncoding:4];
      BOOL v12 = [v6 encryptedValues];
      [v12 setObject:v11 forKeyedSubscript:@"TitleEncrypted"];
    }
    v13 = [(ICFolder *)self parent];
    int v14 = [v13 recordID];

    uint64_t v15 = [v14 zoneID];
    if (!v15) {
      goto LABEL_27;
    }
    v16 = (void *)v15;
    BOOL v17 = [v14 zoneID];
    int v18 = [v6 recordID];
    uint64_t v19 = [v18 zoneID];
    int v20 = [v17 isEqual:v19];

    if (v20)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1A348]);
      BOOL v22 = (void *)[v21 initWithRecordID:v14 action:*MEMORY[0x1E4F19D98]];
      [v6 setObject:v22 forKeyedSubscript:@"ParentFolder"];
    }
    else
    {
LABEL_27:
      if ([(ICCloudSyncingObject *)self isOwnedByCurrentUser]) {
        [v6 setObject:0 forKeyedSubscript:@"ParentFolder"];
      }
    }
    v23 = [(ICFolder *)self parentModificationDate];

    if (v23)
    {
      id v24 = [(ICFolder *)self parentModificationDate];
      [v6 setObject:v24 forKeyedSubscript:@"ParentModificationDate"];
    }
    BOOL v25 = [(ICFolder *)self mergeableData];

    if (v25)
    {
      v26 = [(ICFolder *)self mergeableData];
      objc_msgSend(v6, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v26, @"MergeableData", a3);
    }
  }
  if (!a3)
  {
    [v6 setWantsChainPCS:1];
    if ([(ICFolder *)self importedFromLegacy])
    {
      v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICFolder importedFromLegacy](self, "importedFromLegacy"));
      [v6 setObject:v27 forKeyedSubscript:@"ImportedFromLegacy"];
    }
    uint64_t v28 = [(ICFolder *)self smartFolderQueryJSON];

    if (v28)
    {
      BOOL v29 = [(ICFolder *)self smartFolderQueryJSON];
      v30 = [v29 dataUsingEncoding:4];
      v31 = [v6 encryptedValues];
      [v31 setObject:v30 forKeyedSubscript:@"SmartFolderQueryJSONEncrypted"];
    }
  }
  return v6;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a3;
  char v8 = +[ICAccount cloudKitAccountWithIdentifier:a4 context:a5];
  v9 = [v7 recordName];

  id v10 = [v8 folderWithIdentifier:v9];

  return v10;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[ICAccount cloudKitAccountWithIdentifier:v7 context:a5];
  id v10 = [v8 recordID];
  v11 = [v10 recordName];
  id v12 = +[ICFolder newFolderWithIdentifier:v11 account:v9];

  [v12 mergeCloudKitRecord:v8 accountID:v7 approach:0];
  [v12 setServerRecord:v8];

  [v12 setInCloud:1];
  [v12 clearChangeCountWithReason:@"Created folder"];
  [v12 updateParentReferenceIfNecessary];

  return v12;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ICFolder;
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_msgSendSuper2(&v12, sel_newPlaceholderObjectForRecordName_accountID_context_, a3, v8, v7);
  id v10 = +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v8, v7, v12.receiver, v12.super_class);

  [v9 setAccount:v10];
  return v9;
}

- (BOOL)isInICloudAccount
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ICFolder *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ICFolder_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A4528;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__ICFolder_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) account];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 accountType] == 1;
}

- (void)fixBrokenReferences
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICCloudSyncingObject *)self loggingDescription];
    BOOL v41 = [(ICFolder *)self parent];
    unint64_t v5 = [v41 loggingDescription];
    uint64_t v6 = [(ICFolder *)self notes];
    id v7 = [v6 allObjects];
    uint64_t v8 = [v7 valueForKey:@"loggingDescription"];
    char v9 = [(ICFolder *)self children];
    id v10 = [v9 allObjects];
    v11 = [v10 valueForKey:@"loggingDescription"];
    *(_DWORD *)buf = 138413058;
    *(void *)v54 = v4;
    *(_WORD *)&v54[8] = 2112;
    *(void *)&v54[10] = v5;
    __int16 v55 = 2112;
    v56 = v8;
    __int16 v57 = 2112;
    id v58 = v11;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for folder: %@\n\tParent: %@\n\tNotes: %@\n\tChildren: %@", buf, 0x2Au);
  }
  if (![(ICFolder *)self markedForDeletion])
  {
    v16 = [(ICCloudSyncingObject *)self serverShare];
    if (v16)
    {
    }
    else
    {
      int v37 = [(ICCloudSyncingObject *)self serverRecord];
      unint64_t v38 = [v37 share];

      if (!v38) {
        return;
      }
    }
    [(ICCloudSyncingObject *)self setServerShare:0];
    [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
    return;
  }
  if ([(ICFolder *)self visibleNotesCount])
  {
    objc_super v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(ICFolder *)self visibleNotesCount];
      int v14 = [(ICFolder *)self identifier];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = v13;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v14;
      _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEFAULT, "Found a deleted folder with %d undeleted notes: %@", buf, 0x12u);
    }
    uint64_t v15 = v12;
LABEL_36:

    [(ICCloudSyncingObject *)self unmarkForDeletion];
    if ([(ICFolder *)self importedFromLegacy]) {
      +[ICLegacyTombstone removeLegacyTombstoneForFolder:self];
    }
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v42 = self;
    uint64_t v15 = [(ICFolder *)self children];
    uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v15);
          }
          if (([*(id *)(*((void *)&v47 + 1) + 8 * i) markedForDeletion] & 1) == 0)
          {
            objc_super v12 = os_log_create("com.apple.notes", "Cloud");
            self = v42;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v39 = [(ICFolder *)v42 identifier];
              *(_DWORD *)buf = 138412290;
              *(void *)v54 = v39;
              _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEFAULT, "Found a deleted folder with at least one undeleted child folder: %@", buf, 0xCu);
            }
            goto LABEL_36;
          }
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v21 = [(ICFolder *)v42 notes];
    uint64_t v22 = [v21 count];

    v23 = os_log_create("com.apple.notes", "Cloud");
    id v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v25 = [(ICFolder *)v42 identifier];
        *(_DWORD *)buf = 138412290;
        *(void *)v54 = v25;
        _os_log_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_DEFAULT, "Broken references because we still have notes in folder (%@)", buf, 0xCu);
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v26 = [(ICFolder *)v42 notes];
      v27 = (void *)[v26 copy];

      uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v44;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v43 + 1) + 8 * v31);
            objc_super v33 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              [(ICFolder(CloudKit) *)buf fixBrokenReferences];
            }

            unint64_t v34 = [(ICFolder *)v42 account];
            v35 = [v34 trashFolder];
            [v32 setFolder:v35];

            v36 = [MEMORY[0x1E4F1C9C8] date];
            [v32 setFolderModificationDate:v36];

            [v32 updateChangeCountWithReason:@"Moved to trash folder"];
            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v29);
      }
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        unint64_t v40 = [(ICCloudSyncingObject *)v42 shortLoggingDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)v54 = v40;
        _os_log_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_INFO, "Broken reference for %@, but not un-deleting or moving any notes", buf, 0xCu);
      }
    }
  }
}

- (BOOL)hasAllMandatoryFields
{
  v6.receiver = self;
  v6.super_class = (Class)ICFolder;
  if (![(ICCloudSyncingObject *)&v6 hasAllMandatoryFields]) {
    return 0;
  }
  id v3 = [(ICFolder *)self title];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)deleteFromLocalDatabase
{
}

- (id)objectsToBeDeletedBeforeThisObject
{
  v11.receiver = self;
  v11.super_class = (Class)ICFolder;
  id v3 = [(ICCloudSyncingObject *)&v11 objectsToBeDeletedBeforeThisObject];
  BOOL v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(ICFolder *)self notes];
  objc_super v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  id v7 = [(ICFolder *)self children];
  uint64_t v8 = [v7 allObjects];
  [v4 addObjectsFromArray:v8];

  char v9 = (void *)[v4 copy];
  return v9;
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)ICFolder;
  [(ICCloudSyncingObject *)&v21 objectWasDeletedFromCloudByAnotherDevice];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(ICFolder *)self children];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      if (([v8 hasSuccessfullyPushedLatestVersionToCloud] & 1) == 0
        && ([v8 isInCloud] & 1) != 0)
      {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = [(ICFolder *)self notes];
    uint64_t v9 = [v3 countByEnumeratingWithState:&v13 objects:v22 count:16];
    if (!v9)
    {
LABEL_18:

      return;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_12:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v3);
      }
      if (![*(id *)(*((void *)&v13 + 1) + 8 * v12) hasSuccessfullyPushedLatestVersionToCloud])break; {
      if (v10 == ++v12)
      }
      {
        uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v22 count:16];
        if (v10) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
  }

  [(ICFolder *)self unmarkForDeletionIncludingParentHierarchy];
}

+ (BOOL)supportsUserSpecificRecords
{
  return 1;
}

- (BOOL)wantsUserSpecificRecord
{
  BOOL v3 = [(ICNoteContainer *)self isSharedViaICloud];
  if (v3) {
    LOBYTE(v3) = ![(ICCloudSyncingObject *)self isOwnedByCurrentUser];
  }
  return v3;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ICFolder;
  uint64_t v4 = [(ICCloudSyncingObject *)&v15 makeUserSpecificCloudKitRecordForApproach:a3];
  uint64_t v5 = [(ICFolder *)self title];

  if (v5)
  {
    uint64_t v6 = [(ICFolder *)self title];
    uint64_t v7 = [v6 dataUsingEncoding:4];
    uint64_t v8 = [v4 encryptedValues];
    [v8 setObject:v7 forKeyedSubscript:@"TitleEncrypted"];
  }
  uint64_t v9 = [(ICFolder *)self parent];
  uint64_t v10 = [v9 recordID];

  if (v10 && objc_msgSend(v10, "ic_isOwnedByCurrentUser"))
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v10 action:1];
    [v4 setObject:v11 forKeyedSubscript:@"ParentFolder"];
  }
  else
  {
    [v4 setObject:0 forKeyedSubscript:@"ParentFolder"];
  }
  uint64_t v12 = [(ICFolder *)self parentModificationDate];

  if (v12)
  {
    long long v13 = [(ICFolder *)self parentModificationDate];
    [v4 setObject:v13 forKeyedSubscript:@"ParentModificationDate"];
  }
  return v4;
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICFolder;
  BOOL v7 = [(ICCloudSyncingObject *)&v12 mergeDataFromUserSpecificRecord:v6 accountID:a4];
  if (v7)
  {
    uint64_t v8 = [v6 encryptedValues];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"TitleEncrypted"];

    if (v9)
    {
      uint64_t v10 = objc_msgSend(v9, "ic_stringValue");
      [(ICFolder *)self setTitle:v10];
    }
    [(ICFolder *)self mergeParentFromRecord:v6];
  }
  return v7;
}

+ (id)reservedFolderTitles
{
  if (reservedFolderTitles_onceToken != -1) {
    dispatch_once(&reservedFolderTitles_onceToken, &__block_literal_global_44);
  }
  id v2 = (void *)reservedFolderTitles_reservedFolderTitles;
  return v2;
}

void __32__ICFolder_reservedFolderTitles__block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = ICSharedFrameworkBundleIdentifier();
  BOOL v3 = [v1 bundleWithIdentifier:v2];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = v3;
  id obj = [v3 localizations];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [v19 URLForResource:@"Localizable" withExtension:@"strings" subdirectory:0 localization:*(void *)(*((void *)&v20 + 1) + 8 * v7)];
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v8];
        uint64_t v10 = +[ICFolder englishTitleForDefaultFolder];
        uint64_t v11 = [v9 objectForKey:v10];

        if (v11) {
          [v0 addObject:v11];
        }
        objc_super v12 = +[ICFolder englishTitleForTrashFolder];
        long long v13 = [v9 objectForKey:v12];

        if (v13) {
          [v0 addObject:v13];
        }
        long long v14 = +[ICFolder englishTitleForSystemPaperFolder];
        objc_super v15 = [v9 objectForKey:v14];

        if (v15) {
          [v0 addObject:v15];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  uint64_t v16 = [v0 copy];
  long long v17 = (void *)reservedFolderTitles_reservedFolderTitles;
  reservedFolderTitles_reservedFolderTitles = v16;
}

+ (id)deduplicatingTitle:(id)a3 account:(id)a4
{
  return (id)[a1 deduplicatingTitle:a3 forFolder:0 ofAccount:a4];
}

+ (id)deduplicatingTitle:(id)a3 forFolder:(id)a4 ofAccount:(id)a5
{
  return (id)[a1 deduplicatingTitle:a3 forFolder:a4 forNewFolderParent:0 ofAccount:a5];
}

+ (id)deduplicatingTitle:(id)a3 forFolder:(id)a4 forNewFolderParent:(id)a5 ofAccount:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_super v12 = a6;
  long long v13 = v12;
  if (!v10 && !v11 && !v12)
  {
    long long v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ICFolder deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:](v13);
    }
    id v14 = 0;
    goto LABEL_30;
  }
  if (v12)
  {
    if (!v11) {
      goto LABEL_18;
    }
LABEL_12:
    if (v13)
    {
      objc_super v15 = [v11 account];

      if (v15 != v13)
      {
        uint64_t v16 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[ICFolder deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:]((uint64_t)v13, v11);
        }
      }
    }
    goto LABEL_18;
  }
  if (v11)
  {
    long long v13 = [v11 account];
    goto LABEL_12;
  }
  long long v13 = [v10 account];
LABEL_18:
  long long v17 = [v13 visibleFoldersWithParent:v11];
  long long v18 = (void *)[v17 mutableCopy];

  if (v10) {
    [v18 removeObject:v10];
  }
  uint64_t v28 = v18;
  long long v19 = [v18 valueForKey:@"title"];
  long long v20 = [v13 reservedAccountFolderTitles];
  long long v21 = [v19 setByAddingObjectsFromSet:v20];

  id v22 = v9;
  if ([v21 containsObject:v22])
  {
    uint64_t v23 = 1;
    uint64_t v24 = v22;
    do
    {
      uint64_t v25 = v24;
      uint64_t v24 = [NSString localizedStringWithFormat:@"%@ %lu", v22, v23];

      char v26 = [v21 containsObject:v24];
      if (v23 == -1) {
        break;
      }
      ++v23;
    }
    while ((v26 & 1) != 0);
  }
  else
  {
    uint64_t v24 = v22;
  }
  if ([v21 containsObject:v24]) {
    id v14 = 0;
  }
  else {
    id v14 = v24;
  }

LABEL_30:
  return v14;
}

+ (id)localizedNewFolderName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Folder" value:@"New Folder" table:0 allowSiri:1];
}

+ (id)stringByScrubbingStringForFolderName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];

  uint64_t v6 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v8 = [v3 componentsSeparatedByCharactersInSet:v7];

    uint64_t v6 = [v8 componentsJoinedByString:@" "];
  }
  if ((unint64_t)[v6 length] >= 0x81)
  {
    uint64_t v9 = objc_msgSend(v6, "ic_substringToIndex:", 128);

    uint64_t v6 = (void *)v9;
  }

  return v6;
}

+ (id)keyPathsForValuesAffectingCustomNoteSortType
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"customNoteSortTypeValue"];
}

- (id)cacheKey
{
  id v3 = NSString;
  uint64_t v4 = [(ICFolder *)self account];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(ICFolder *)self identifier];
  uint64_t v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return v7;
}

- (void)setCustomNoteSortType:(id)a3
{
  uint64_t v4 = [a3 valueRepresentation];
  [(ICFolder *)self setCustomNoteSortTypeValue:v4];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(ICFolder *)self setCustomNoteSortTypeModificationDate:v5];
}

- (id)customNoteSortType
{
  if ([(ICFolder *)self supportsCustomNoteSortType])
  {
    id v3 = (void *)MEMORY[0x1E4F83758];
    uint64_t v4 = [(ICFolder *)self customNoteSortTypeValue];
    id v5 = [v3 folderNoteSortTypeFromValue:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingSupportsCustomNoteSortType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isTrashFolder", 0);
}

- (BOOL)supportsCustomNoteSortType
{
  return ![(ICFolder *)self isTrashFolder];
}

- (BOOL)isRenamable
{
  if ([(ICFolder *)self isSystemFolder]) {
    return 0;
  }
  else {
    return ![(ICNoteContainer *)self isSharedReadOnly];
  }
}

- (BOOL)isSubfolderOfReadonlyFolder
{
  id v3 = [(ICCloudSyncingObject *)self serverShare];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(ICNoteContainer *)self isSharedReadOnly];
  }

  return v4;
}

- (BOOL)isDeletable
{
  if ([(ICFolder *)self isSystemFolder]) {
    return 0;
  }
  else {
    return ![(ICFolder *)self isSubfolderOfReadonlyFolder];
  }
}

+ (id)keyPathsForValuesAffectingIsLeaf
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"visibleNoteContainerChildren"];
}

- (BOOL)isLeaf
{
  id v2 = [(ICFolder *)self visibleNoteContainerChildren];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingDepth
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"parent"];
}

- (unint64_t)depth
{
  id v2 = [(ICFolder *)self parent];
  objc_opt_class();
  unint64_t v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = v2;
    do
    {
      ++v3;
      id v2 = [v4 parent];

      objc_opt_class();
      BOOL v4 = v2;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }

  return v3;
}

+ (unint64_t)maximumDepthOfFolders:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) maximumDepthIncludingChildFolders];
        if (v6 <= v9) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)maximumDepthIncludingChildFolders
{
  if ([(ICFolder *)self isLeaf])
  {
    return [(ICFolder *)self depth];
  }
  else
  {
    uint64_t v4 = [(ICFolder *)self visibleSubFolders];
    unint64_t v5 = +[ICFolder maximumDepthOfFolders:v4];

    return v5;
  }
}

- (unint64_t)maximumDistanceToLeafFolder
{
  if ([(ICFolder *)self isLeaf]) {
    return 0;
  }
  unint64_t v4 = [(ICFolder *)self maximumDepthIncludingChildFolders];
  return v4 - [(ICFolder *)self depth];
}

+ (unint64_t)maximumDistanceToLeafFolderOfFolders:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) maximumDistanceToLeafFolder];
        if (v6 <= v9) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isDescendantOfFolder:(id)a3
{
  id v4 = a3;
  if (v4 && ([(ICFolder *)self parent], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v6 = (void *)v5;
    do
    {
      uint64_t v7 = [v6 identifier];
      uint64_t v8 = [v4 identifier];
      char v9 = [v7 isEqualToString:v8];

      if (v9) {
        break;
      }
      uint64_t v10 = [v6 parent];

      unint64_t v6 = (void *)v10;
    }
    while (v10);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)associatedNoteParticipants
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ICFolder *)self notes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) participants];
        uint64_t v10 = [v9 allObjects];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isMovable
{
  id v3 = [(ICFolder *)self account];
  id v4 = [v3 defaultFolder];
  if (v4 == self)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    uint64_t v5 = [(ICFolder *)self account];
    uint64_t v6 = [v5 trashFolder];
    if (v6 == self) {
      LOBYTE(v7) = 0;
    }
    else {
      BOOL v7 = ![(ICFolder *)self isSubfolderOfReadonlyFolder];
    }
  }
  return v7;
}

- (BOOL)canMoveAddOrDeleteContents
{
  if ([(ICNoteContainer *)self isSharedReadOnly]) {
    return 0;
  }
  else {
    return ![(ICFolder *)self isSmartFolder];
  }
}

- (BOOL)canAddSubfolder
{
  BOOL v3 = [(ICFolder *)self canMoveAddOrDeleteContents];
  if (v3)
  {
    if ([(ICFolder *)self isDefaultFolderForAccount]
      || [(ICFolder *)self isTrashFolder])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = ![(ICFolder *)self isSmartFolder];
    }
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingIsTrashFolder
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"folderType", @"identifier", 0);
}

+ (id)keyPathsForValuesAffectingVisibleNoteContainerChildren
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"children"];
}

- (id)visibleNoteContainerChildrenUnsorted
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(ICFolder *)self children];
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
        char v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 markedForDeletion] & 1) == 0
          && ([v9 isUnsupported] & 1) == 0
          && ([v9 isHiddenNoteContainer] & 1) == 0)
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)visibleNoteContainerChildren
{
  id v2 = [(ICFolder *)self visibleNoteContainerChildrenUnsorted];
  BOOL v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (unint64_t)visibleNoteContainerChildrenCount
{
  id v2 = [(ICFolder *)self visibleNoteContainerChildrenUnsorted];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)indexOfVisibleChild:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNoteContainer *)self subFolderIdentifiersOrderedSet];
  uint64_t v6 = [v4 identifier];
  unint64_t v7 = [v5 indexOfObject:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(ICFolder *)self visibleSubFolders];
    unint64_t v7 = [v8 indexOfObject:v4];
  }
  return v7;
}

- (void)setNeedsInitialFetchFromCloud:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICFolder *)self needsInitialFetchFromCloud] != a3)
  {
    uint64_t v5 = [(ICFolder *)self account];
    [v5 willChangeValueForKey:@"visibleFolders"];

    uint64_t v6 = [(ICFolder *)self account];
    [v6 willChangeValueForKey:@"visibleNoteContainers"];

    v9.receiver = self;
    v9.super_class = (Class)ICFolder;
    [(ICCloudSyncingObject *)&v9 setNeedsInitialFetchFromCloud:v3];
    unint64_t v7 = [(ICFolder *)self account];
    [v7 didChangeValueForKey:@"visibleFolders"];

    uint64_t v8 = [(ICFolder *)self account];
    [v8 didChangeValueForKey:@"visibleNoteContainers"];
  }
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(ICFolder *)self title];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(ICFolder *)self willChangeValueForKey:@"title"];
    [(ICFolder *)self setPrimitiveValue:v6 forKey:@"title"];
    [(ICFolder *)self didChangeValueForKey:@"title"];
  }
}

- (void)setParent:(id)a3
{
  long long v13 = (ICFolder *)a3;
  id v4 = [(ICFolder *)self parent];

  char v5 = v13;
  if (v4 != v13)
  {
    if (v13 == self)
    {
      id v6 = (void *)MEMORY[0x1E4F836F8];
      unint64_t v7 = @"Cannot set a folder's parent to be itself";
    }
    else
    {
      if (![(ICFolder *)v13 isDescendantOfFolder:self])
      {
        uint64_t v8 = [(ICFolder *)self parent];
        objc_super v9 = [(ICFolder *)self account];
        [v9 willChangeValueForKey:@"visibleNoteContainerChildren"];

        [(ICFolder *)self willChangeValueForKey:@"parent"];
        [(ICFolder *)self willChangeValueForKey:@"parentCloudObject"];
        [v8 willChangeValueForKey:@"children"];
        [(ICFolder *)v13 willChangeValueForKey:@"children"];
        [(ICFolder *)self setPrimitiveValue:v13 forKey:@"parent"];
        uint64_t v10 = [v8 mutableSetValueForKey:@"children"];
        [v10 removeObject:self];

        long long v11 = [(ICFolder *)v13 mutableSetValueForKey:@"children"];
        [v11 addObject:self];

        [v8 didChangeValueForKey:@"children"];
        [(ICFolder *)v13 didChangeValueForKey:@"children"];
        [(ICFolder *)self didChangeValueForKey:@"parent"];
        [(ICFolder *)self didChangeValueForKey:@"parentCloudObject"];
        long long v12 = [(ICFolder *)self account];
        [v12 didChangeValueForKey:@"visibleNoteContainerChildren"];

        [(ICFolder *)self updateSortOrder];
        [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
        [v8 markShareDirtyIfNeededWithReason:@"Reparented folder"];
        [(ICCloudSyncingObject *)v13 markShareDirtyIfNeededWithReason:@"Reparented folder"];

        goto LABEL_8;
      }
      id v6 = (void *)MEMORY[0x1E4F836F8];
      unint64_t v7 = @"Cannot set a folder's parent to be its descendant";
    }
    [v6 handleFailedAssertWithCondition:"NO" functionName:"-[ICFolder setParent:]" simulateCrash:1 showAlert:1 alertMessage:@"An issue occured when moving a folder. Do you want to file a radar?" format:v7];
LABEL_8:
    char v5 = v13;
  }
}

+ (id)keyPathsForValuesAffectingIsDefaultFolderForAccount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"identifier"];
}

- (BOOL)isAncestorOfFolder:(id)a3
{
  id v4 = a3;
  char v5 = [(ICFolder *)self account];
  id v6 = [v4 account];

  if (v5 == v6)
  {
    uint64_t v8 = [v4 parent];
    objc_super v9 = v8;
    if (v8) {
      BOOL v7 = v8 == self || [(ICFolder *)self isAncestorOfFolder:v8];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSArray)ancestorFolderObjectIDs
{
  id v2 = [(ICCloudSyncingObject *)self ancestorCloudObjects];
  BOOL v3 = objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_103);

  return (NSArray *)v3;
}

id __35__ICFolder_ancestorFolderObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = ICDynamicCast();

  id v4 = [v3 objectID];

  return v4;
}

- (void)setAccount:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(ICFolder *)self account];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    [(ICFolder *)self willChangeValueForKey:@"account"];
    [(ICFolder *)self setPrimitiveValue:v4 forKey:@"account"];
    id v6 = [v5 mutableSetValueForKey:@"folders"];
    [v6 removeObject:self];

    BOOL v7 = [v4 mutableSetValueForKey:@"folders"];
    [v7 addObject:self];

    [(ICFolder *)self didChangeValueForKey:@"account"];
    [(ICFolder *)self setOwner:v4];
    uint64_t v8 = [v4 accountNameForAccountListSorting];
    [(ICFolder *)self setAccountNameForAccountListSorting:v8];

    [(ICFolder *)self updateSortOrder];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    objc_super v9 = [(ICFolder *)self children];
    uint64_t v10 = (void *)[v9 copy];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v14++) setAccount:v4];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v15 = [(ICFolder *)self notes];
    uint64_t v16 = (void *)[v15 copy];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v20++) setAccount:v4];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v18);
    }

    long long v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      [(ICFolder *)v4 setAccount:v21];
    }
  }
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  if ([(ICCloudSyncingObject *)self isUnsupported]
    || [(ICCloudSyncingObject *)self needsInitialFetchFromCloudCheckingParent])
  {
    return [(ICFolder *)self minimumSupportedNotesVersion];
  }
  else
  {
    if ([(ICFolder *)self isSmartFolder])
    {
      id v6 = [(ICFolder *)self smartFolderQuery];
      uint64_t v7 = [v6 minimumSupportedVersion];
    }
    else if ([(ICCloudSyncingObject *)self isSharedRootObject])
    {
      uint64_t v7 = 4;
    }
    else
    {
      uint64_t v7 = 0;
    }
    v8.receiver = self;
    v8.super_class = (Class)ICFolder;
    int64_t result = [(ICCloudSyncingObject *)&v8 intrinsicNotesVersionForScenario:a3];
    if (v7 > result) {
      return v7;
    }
  }
  return result;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (id)contentInfoTextWithNoteCount:(int64_t)a3 subfolderCount:(int64_t)a4
{
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (a4)
  {
    uint64_t v7 = NSString;
    objc_super v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%lu Folders" value:@"%lu Folders" table:0 allowSiri:1];
    objc_super v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, a4);

    [v6 addObject:v9];
  }
  if (a3)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%lu Notes" value:@"%lu Notes" table:0 allowSiri:1];
    uint64_t v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, a3);

    [v6 addObject:v12];
  }
  if ([v6 count])
  {
    uint64_t v13 = [v6 componentsJoinedByString:@" · "];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)markForDeletion
{
  v1 = [a1 serverShare];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "A shared folder is deleted but may have not been unshared yet: %@, share: %@", v4, v5, v6, v7, v8);
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(ICFolder *)self isDeletable])
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Delete");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICFolder setMarkedForDeletion:](self);
    }
  }
  else
  {
    [(ICFolder *)self willChangeValueForKey:@"markedForDeletion"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(ICFolder *)self setPrimitiveValue:v5 forKey:@"markedForDeletion"];

    [(ICFolder *)self didChangeValueForKey:@"markedForDeletion"];
    id v7 = [(ICFolder *)self account];
    [v7 setMarkedForDeletion:0];
  }
}

- (void)updateChangeCountWithReason:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICFolder;
  [(ICCloudSyncingObject *)&v11 updateChangeCountWithReason:v4];
  uint64_t v5 = [(ICFolder *)self changedValues];
  uint64_t v6 = NSStringFromSelector(sel_title);
  id v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {

LABEL_4:
    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:v4];
    goto LABEL_5;
  }
  uint8_t v8 = [(ICFolder *)self changedValues];
  objc_super v9 = NSStringFromSelector(sel_parent);
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v10) {
    goto LABEL_4;
  }
LABEL_5:
}

- (BOOL)supportsDateHeaders
{
  if ([(ICFolder *)self isTrashFolder]) {
    return 0;
  }
  id v4 = [(ICFolder *)self customNoteSortType];
  BOOL v3 = [v4 resolvedCustomSortTypeOrder] != 3;

  return v3;
}

- (BOOL)isShowingDateHeaders
{
  int v3 = [(ICFolder *)self supportsDateHeaders];
  if (v3)
  {
    int v3 = [(ICFolder *)self dateHeadersType];
    if (v3) {
      LOBYTE(v3) = v3 == 2;
    }
    else {
      LOBYTE(v3) = [MEMORY[0x1E4F83730] defaultDateHeadersType] == 2;
    }
  }
  return v3;
}

- (BOOL)validateForInsert:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICFolder;
  BOOL v4 = [(ICFolder *)&v6 validateForInsert:a3];
  if (v4) {
    LOBYTE(v4) = [(ICFolder *)self validate];
  }
  return v4;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICFolder;
  BOOL v4 = [(ICFolder *)&v6 validateForUpdate:a3];
  if (v4) {
    LOBYTE(v4) = [(ICFolder *)self validate];
  }
  return v4;
}

- (BOOL)validate
{
  unint64_t v3 = [(ICFolder *)self depth];
  if (v3 > +[ICFolder folderDepthLimit])
  {
    BOOL v4 = [(ICFolder *)self parent];
    uint64_t v5 = [v4 parent];
    [(ICFolder *)self setParent:v5];
  }
  uint64_t v6 = [(ICFolder *)self title];
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = (void *)v6;
  uint8_t v8 = [(ICFolder *)self title];
  objc_super v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
LABEL_5:
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(id)objc_opt_class() localizedNewFolderName];
    uint64_t v14 = [(ICFolder *)self parent];
    long long v15 = [(ICFolder *)self account];
    uint64_t v16 = [v12 deduplicatingTitle:v13 forFolder:self forNewFolderParent:v14 ofAccount:v15];
    [(ICFolder *)self setTitle:v16];
  }
  return 1;
}

- (BOOL)isTitleValid:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ICFolder *)self account];
  uint8_t v8 = [(ICFolder *)self parent];
  LOBYTE(a4) = +[ICFolder isTitleValid:v6 account:v7 folder:self parentFolder:v8 error:a4];

  return (char)a4;
}

+ (BOOL)isTitleValid:(id)a3 account:(id)a4 parentFolder:(id)a5 error:(id *)a6
{
  return [a1 isTitleValid:a3 account:a4 folder:0 parentFolder:a5 error:a6];
}

+ (BOOL)isTitleValid:(id)a3 account:(id)a4 folder:(id)a5 parentFolder:(id)a6 error:(id *)a7
{
  v34[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11) {
    long long v15 = v11;
  }
  else {
    long long v15 = &stru_1F1F2FFF8;
  }
  uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v17 = [(__CFString *)v15 stringByTrimmingCharactersInSet:v16];

  if (![v17 length])
  {
    if (a7)
    {
      uint64_t v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Please choose a different name." value:@"Please choose a different name." table:0 allowSiri:1];
      long long v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Folder names can’t be blank." value:@"Folder names can’t be blank." table:0 allowSiri:1];
      goto LABEL_10;
    }
LABEL_19:
    char v22 = 0;
    uint64_t v18 = 0;
    long long v21 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)[v17 length] >= 0x81)
  {
    if (a7)
    {
      uint64_t v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Please choose a different name." value:@"Please choose a different name." table:0 allowSiri:1];
      uint64_t v19 = NSString;
      uint64_t v20 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Folder names can’t be longer than %d characters." value:@"Folder names can’t be longer than %d characters." table:0 allowSiri:1];
      long long v21 = objc_msgSend(v19, "localizedStringWithFormat:", v20, 128);

LABEL_10:
      char v22 = 0;
LABEL_17:
      if ((v22 & 1) == 0)
      {
        uint64_t v30 = *MEMORY[0x1E4F285A0];
        v33[0] = *MEMORY[0x1E4F28568];
        v33[1] = v30;
        v34[0] = v18;
        v34[1] = v21;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
        *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:1024 userInfo:v31];

        char v22 = 0;
      }
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  long long v23 = [v12 visibleFoldersWithParent:v14];
  long long v24 = (void *)[v23 mutableCopy];

  if (v13) {
    [v24 removeObject:v13];
  }
  long long v25 = [v24 valueForKey:@"title"];
  long long v26 = (void *)[v25 mutableCopy];

  long long v27 = +[ICFolder reservedFolderTitles];
  [v26 unionSet:v27];

  long long v28 = [v12 reservedAccountFolderTitles];
  [v26 unionSet:v28];

  int v29 = [v26 containsObject:v17];
  long long v21 = 0;
  char v22 = v29 ^ 1;
  uint64_t v18 = 0;
  if (a7 && v29)
  {
    uint64_t v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Name Taken" value:@"Name Taken" table:0 allowSiri:1];
    long long v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Please choose a different name." value:@"Please choose a different name." table:0 allowSiri:1];
  }

  if (a7) {
    goto LABEL_17;
  }
LABEL_20:

  return v22;
}

- (BOOL)visibleChildFoldersContainsFolderWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICFolder *)self account];
  id v6 = [v5 visibleFoldersWithParent:self];

  id v7 = [v6 valueForKey:@"title"];
  char v8 = [v7 containsObject:v4];

  return v8;
}

- (id)accountName
{
  uint64_t v2 = [(ICFolder *)self account];
  unint64_t v3 = [v2 localizedName];

  return v3;
}

- (id)visibleNotesIncludingChildFolders
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(ICFolder *)self visibleNotes];
  uint64_t v5 = [v3 arrayWithArray:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(ICFolder *)self children];
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
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) visibleNotesIncludingChildFolders];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
}

- (id)recursiveVisibleSubfolders
{
  unint64_t v3 = [(ICFolder *)self visibleNoteContainerChildrenUnsorted];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(ICFolder *)self recursivelyAddSubfoldersToArray:v5];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (void)recursivelyAddSubfoldersToArray:(id)a3
{
  id v4 = a3;
  id v5 = [(ICFolder *)self visibleNoteContainerChildrenUnsorted];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICFolder_recursivelyAddSubfoldersToArray___block_invoke;
  v7[3] = &unk_1E64A7540;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __44__ICFolder_recursivelyAddSubfoldersToArray___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  [v4 recursivelyAddSubfoldersToArray:*(void *)(a1 + 32)];
}

+ (id)keyPathsForValuesAffectingVisibleNotesCount
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"notes", 0);
}

+ (id)keyPathsForValuesAffectingTitleForTableViewCell
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"parent", 0);
}

+ (id)keyPathsForValuesAffectingSupportsEditingNotes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"folderType"];
}

+ (NSString)localizedTitleForDefaultFolder
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes" value:@"Notes" table:0 allowSiri:1];
}

+ (NSString)englishTitleForDefaultFolder
{
  return (NSString *)@"Notes";
}

+ (NSString)localizedTitleForTrashFolder
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Recently Deleted" value:@"Recently Deleted" table:0 allowSiri:1];
}

+ (NSString)englishTitleForTrashFolder
{
  return (NSString *)@"Recently Deleted";
}

+ (NSString)localizedTitleForSystemPaperFolder
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Quick Notes" value:@"Quick Notes" table:0 allowSiri:1];
}

+ (NSString)englishTitleForSystemPaperFolder
{
  return (NSString *)@"Quick Notes";
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICFolder;
  unint64_t v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(ICFolder *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__ICFolder_ic_loggingValues__block_invoke;
  void v9[3] = &unk_1E64A4218;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = v6;
  return v7;
}

void __28__ICFolder_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) account];
  uint64_t v3 = [v2 identifier];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"account"];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", objc_msgSend(*(id *)(a1 + 40), "folderType"));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"folderType"];

  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSmartFolder"));
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"isSmartFolder"];

  id v8 = [*(id *)(a1 + 40) smartFolderQueryJSON];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) smartFolderQueryJSON];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"smartFolderQueryJSON"];
  }
  id v10 = [*(id *)(a1 + 40) parent];
  uint64_t v11 = [v10 identifier];

  if (v11)
  {
    objc_super v12 = [*(id *)(a1 + 40) parent];
    id v13 = [v12 identifier];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"parent"];
  }
  long long v14 = [*(id *)(a1 + 40) children];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    long long v16 = [*(id *)(a1 + 40) children];
    long long v17 = [v16 allObjects];
    uint64_t v18 = [v17 valueForKey:@"recordName"];
    [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"children"];
  }
  uint64_t v19 = [*(id *)(a1 + 40) notes];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    id v23 = [*(id *)(a1 + 40) notes];
    long long v21 = [v23 allObjects];
    char v22 = [v21 valueForKey:@"recordName"];
    [*(id *)(a1 + 32) setObject:v22 forKeyedSubscript:@"notes"];
  }
}

- (BOOL)containsSharedDescendantFolders:(BOOL *)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(ICFolder *)self recursiveVisibleSubfolders];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICFolder_containsSharedDescendantFolders___block_invoke;
  v7[3] = &unk_1E64A7568;
  void v7[4] = &v8;
  v7[5] = &v12;
  v7[6] = a3;
  [v4 enumerateObjectsUsingBlock:v7];
  if (a3) {
    *a3 = *((unsigned char *)v13 + 24);
  }
  char v5 = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __44__ICFolder_containsSharedDescendantFolders___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  int v6 = [v8 isSharedViaICloud];
  uint64_t v7 = *(void *)(a1[4] + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    if (!v6) {
      goto LABEL_7;
    }
  }
  else
  {
    *(unsigned char *)(v7 + 24) = v6;
    if (!v6) {
      goto LABEL_7;
    }
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v8 isOwnedByCurrentUser];
  }
LABEL_7:
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24) && (!a1[6] || !*(unsigned char *)(*(void *)(a1[5] + 8) + 24))) {
    *a4 = 1;
  }
}

- (BOOL)containsSharedDescendantFolders
{
  return [(ICFolder *)self containsSharedDescendantFolders:0];
}

- (BOOL)containsSharedNotesOrSharedDescendantFolders:(BOOL *)a3
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v13[0] = 1;
  BOOL v5 = [(ICFolder *)self containsSharedDescendantFolders:v13];
  *((unsigned char *)v15 + 24) = v5;
  if (v5)
  {
    if (!a3) {
      goto LABEL_6;
    }
    if (!*((unsigned char *)v11 + 24))
    {
LABEL_5:
      *a3 = *((unsigned char *)v11 + 24);
      goto LABEL_6;
    }
  }
  int v6 = [(ICFolder *)self visibleNotesIncludingChildFolders];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ICFolder_containsSharedNotesOrSharedDescendantFolders___block_invoke;
  void v9[3] = &unk_1E64A7590;
  void v9[4] = &v14;
  v9[5] = &v10;
  v9[6] = a3;
  [v6 enumerateObjectsUsingBlock:v9];

  if (a3) {
    goto LABEL_5;
  }
LABEL_6:
  char v7 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __57__ICFolder_containsSharedNotesOrSharedDescendantFolders___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  int v6 = [v8 isSharedViaICloud];
  uint64_t v7 = *(void *)(a1[4] + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    if (!v6) {
      goto LABEL_7;
    }
  }
  else
  {
    *(unsigned char *)(v7 + 24) = v6;
    if (!v6) {
      goto LABEL_7;
    }
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v8 isOwnedByCurrentUser];
  }
LABEL_7:
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24) && (!a1[6] || !*(unsigned char *)(*(void *)(a1[5] + 8) + 24))) {
    *a4 = 1;
  }
}

- (BOOL)containsSharedNotesOrSharedDescendantFolders
{
  return [(ICFolder *)self containsSharedNotesOrSharedDescendantFolders:0];
}

- (id)rootSharedFoldersInDescendantsIncludingSelf
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(ICCloudSyncingObject *)self isSharedRootObject]) {
    [v3 addObject:self];
  }
  id v4 = [(ICFolder *)self recursiveVisibleSubfolders];
  BOOL v5 = objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_184);
  [v3 addObjectsFromArray:v5];

  int v6 = (void *)[v3 copy];
  return v6;
}

uint64_t __55__ICFolder_rootSharedFoldersInDescendantsIncludingSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSharedRootObject];
}

- (id)rootSharedNotesIncludingChildFolders
{
  uint64_t v2 = [(ICFolder *)self visibleNotesIncludingChildFolders];
  uint64_t v3 = objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_187);

  return v3;
}

uint64_t __48__ICFolder_rootSharedNotesIncludingChildFolders__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSharedRootObject];
}

- (id)rootSharingFolder
{
  if ([(ICNoteContainer *)self isSharedViaICloud])
  {
    uint64_t v3 = self;
    if (v3)
    {
      do
      {
        if ([(ICCloudSyncingObject *)v3 isSharedRootObject]) {
          break;
        }
        uint64_t v4 = [(ICFolder *)v3 parent];

        uint64_t v3 = (ICFolder *)v4;
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

+ (id)rootSharingFolderForNote:(id)a3
{
  uint64_t v3 = [a3 folder];
  uint64_t v4 = [v3 rootSharingFolder];

  return v4;
}

- (BOOL)isSharedViaSharedFolder:(id)a3
{
  id v4 = a3;
  if ([(ICNoteContainer *)self isSharedViaICloud]
    && [v4 isSharedViaICloud])
  {
    BOOL v5 = [(ICFolder *)self rootSharingFolder];
    int v6 = [v5 identifier];
    uint64_t v7 = [v4 identifier];
    if ([v6 isEqualToString:v7]) {
      char v8 = 1;
    }
    else {
      char v8 = [v4 isDescendantOfFolder:v5];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)hasSharedContentsNotSharedViaSharedFolder:(id)a3
{
  id v4 = a3;
  if ([(ICNoteContainer *)self isSharedViaICloud]
    && ![(ICFolder *)self isSharedViaSharedFolder:v4]
    || ([(ICFolder *)self rootSharedNotesIncludingChildFolders],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    char v7 = 1;
  }
  else
  {
    char v8 = [(ICFolder *)self rootSharedFoldersInDescendantsIncludingSelf];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__ICFolder_hasSharedContentsNotSharedViaSharedFolder___block_invoke;
    v10[3] = &unk_1E64A75B8;
    id v11 = v4;
    char v7 = objc_msgSend(v8, "ic_containsObjectPassingTest:", v10);
  }
  return v7;
}

uint64_t __54__ICFolder_hasSharedContentsNotSharedViaSharedFolder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSharedViaSharedFolder:*(void *)(a1 + 32)] ^ 1;
}

- (id)childCloudObjects
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICFolder *)self notes];
  BOOL v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [(ICFolder *)self children];
  char v7 = [v6 allObjects];
  [v3 addObjectsFromArray:v7];

  return v3;
}

- (BOOL)canBeRootShareObject
{
  return ![(ICFolder *)self isDefaultFolderForAccount]
      && [(ICFolder *)self folderType] == 0;
}

+ (id)shareType
{
  return @"com.apple.notes.folder";
}

- (id)shareType
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 shareType];
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICFolder;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingCanBeSharedViaICloud);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"folderType"];
  [v3 addObject:@"isDefaultFolderForAccount"];
  [v3 addObject:@"isSharedThroughParent"];
  return v3;
}

- (BOOL)canBeSharedViaICloud
{
  BOOL v3 = [(ICFolder *)self isModernCustomFolder];
  if (v3)
  {
    if ([(ICFolder *)self isSmartFolder])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)ICFolder;
      LOBYTE(v3) = [(ICNoteContainer *)&v5 canBeSharedViaICloud];
    }
  }
  return v3;
}

- (BOOL)isModernCustomFolder
{
  return ![(ICFolder *)self isSystemFolder];
}

- (void)setFolderType:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ([(ICFolder *)self folderType] != a3)
  {
    if ((v3 & 0xFFFFFFFE) == 2
      && ([(ICFolder *)self isDefaultFolderForAccount]
       || [(ICFolder *)self isTrashFolder]))
    {
      objc_super v5 = (void *)MEMORY[0x1E4F836F8];
      [v5 handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICFolder setFolderType:]" simulateCrash:1 showAlert:1 format:@"Attempting to set the default or trash folder as a smart folder"];
    }
    else
    {
      int64_t v6 = [(ICCloudSyncingObject *)self intrinsicNotesVersion];
      [(ICFolder *)self willChangeValueForKey:@"folderType"];
      char v7 = [MEMORY[0x1E4F28ED0] numberWithShort:v3];
      [(ICFolder *)self setPrimitiveValue:v7 forKey:@"folderType"];

      [(ICFolder *)self didChangeValueForKey:@"folderType"];
      if ([(ICCloudSyncingObject *)self intrinsicNotesVersion] != v6) {
        [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
      }
      if (v3 == 2)
      {
        id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        char v8 = [(ICFolder *)self account];
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self, @"ICAccountDidAddSmartFolderNotificationFolderKey", 0);
        [v10 postNotificationName:@"ICSmartFolderAddedNotification" object:v8 userInfo:v9];
      }
    }
  }
}

- (void)setSmartFolderQueryJSON:(id)a3
{
  id v6 = a3;
  id v4 = [(ICFolder *)self smartFolderQueryJSON];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(ICFolder *)self willChangeValueForKey:@"smartFolderQueryJSON"];
    [(ICFolder *)self setPrimitiveValue:v6 forKey:@"smartFolderQueryJSON"];
    [(ICFolder *)self didChangeValueForKey:@"smartFolderQueryJSON"];
    if (v6) {
      [(ICFolder *)self setFolderType:2];
    }
    [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  }
}

- (BOOL)isEditableSmartFolder
{
  BOOL v3 = [(ICFolder *)self isSmartFolder];
  if (v3)
  {
    id v4 = [(ICFolder *)self smartFolderQuery];
    char v5 = [v4 canBeEdited];

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (id)visibleSmartFoldersForHashtagStandardizedContent:(id)a3 account:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    char v8 = [a1 fetchRequest];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folderType == %d", 2);
    id v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = [v7 identifier];
    uint64_t v12 = [v10 predicateWithFormat:@"account.identifier == %@", v11];

    id v13 = [a1 predicateForVisibleObjects];
    uint64_t v14 = (void *)MEMORY[0x1E4F28BA0];
    char v22 = (void *)v9;
    v27[0] = v9;
    v27[1] = v12;
    v27[2] = v13;
    char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];

    [v8 setPredicate:v16];
    [v8 setReturnsObjectsAsFaults:0];
    char v17 = [v7 managedObjectContext];
    id v26 = 0;
    uint64_t v18 = [v17 executeFetchRequest:v8 error:&v26];
    id v19 = v26;
    if (v19)
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICFolder visibleSmartFoldersForHashtagStandardizedContent:account:]", 1, 0, @"Failed to fetch count of smart folders for hashtag standardized content: %@", v19 functionName simulateCrash showAlert format];
      uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke;
      v23[3] = &unk_1E64A7608;
      id v24 = v7;
      id v25 = v6;
      uint64_t v20 = objc_msgSend(v18, "ic_compactMap:", v23);
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

id __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 smartFolderQuery];
  char v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = [v4 tagSelectionWithManagedObjectContext:v5];

  id v7 = [v6 tagIdentifiers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke_2;
  v12[3] = &unk_1E64A75E0;
  id v13 = *(id *)(a1 + 40);
  LODWORD(v5) = objc_msgSend(v7, "ic_containsObjectPassingTest:", v12);
  char v8 = [v6 unresolvedTagIdentifiers];
  LODWORD(a1) = [v8 containsObject:*(void *)(a1 + 40)];

  if (v5 | a1) {
    uint64_t v9 = v3;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

uint64_t __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (BOOL)allowsExporting
{
  return 1;
}

- (BOOL)allowsImporting
{
  return [(ICFolder *)self folderType] - 4 < 0xFFFFFFFD;
}

+ (id)newFolderInAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  char v8 = (void *)[a1 newFolderWithIdentifier:v7 account:v5];

  return v8;
}

+ (id)newFolderWithIdentifier:(id)a3 account:(id)a4
{
  return (id)[a1 newFolderWithIdentifier:a3 account:a4 query:0];
}

+ (id)newFolderWithIdentifier:(id)a3 account:(id)a4 query:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v12 = NSStringFromClass((Class)a1);
    [v11 handleFailedAssertWithCondition:"account", "+[ICFolder(Management) newFolderWithIdentifier:account:query:]", 1, 0, @"Trying to create a %@ with no account", v12 functionName simulateCrash showAlert format];
  }
  id v13 = [v9 managedObjectContext];
  uint64_t v14 = (void *)[a1 newObjectWithIdentifier:v8 context:v13];

  char v15 = [v9 persistentStore];
  [v14 assignToPersistentStore:v15];

  [v14 setAccount:v9];
  if (v10) {
    [v14 setSmartFolderQuery:v10];
  }

  return v14;
}

+ (id)newFolderInParentFolder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = (void *)[a1 newFolderWithIdentifier:v7 parentFolder:v5];

  return v8;
}

+ (id)newFolderWithIdentifier:(id)a3 parentFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1E4F836F8];
    id v9 = NSStringFromClass((Class)a1);
    [v8 handleFailedAssertWithCondition:"parentFolder", "+[ICFolder(Management) newFolderWithIdentifier:parentFolder:]", 1, 0, @"Trying to create a %@ with no parent folder", v9 functionName simulateCrash showAlert format];
  }
  id v10 = [v7 account];
  id v11 = (void *)[a1 newFolderWithIdentifier:v6 account:v10];

  [v11 setParent:v7];
  return v11;
}

+ (void)deleteFolder:(id)a3
{
  id v28 = a1;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "Delete");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ICFolder(Management) deleteFolder:](v3, v4);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  int v29 = v3;
  id v5 = [v3 notes];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    id v10 = &off_1E64A3000;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_msgSend(v10[244], "deleteNote:", v12, v28);
        id v13 = os_log_create("com.apple.notes", "Delete");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v32 = [v12 account];
          uint64_t v31 = [v32 trashFolder];
          uint64_t v30 = [v31 identifier];
          char v17 = [v12 identifier];
          uint64_t v18 = [v12 account];
          [v18 identifier];
          v20 = id v19 = v6;
          *(_DWORD *)buf = 138412802;
          long long v43 = v30;
          __int16 v44 = 2112;
          long long v45 = v17;
          __int16 v46 = 2112;
          long long v47 = v20;
          _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "Setting trash folder %@ to note %@ in account %@", buf, 0x20u);

          id v6 = v19;
          id v10 = &off_1E64A3000;
        }
        uint64_t v14 = [v12 account];
        char v15 = [v14 trashFolder];
        [v12 setFolder:v15];

        uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
        [v12 setFolderModificationDate:v16];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v8);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v21 = [v29 children];
  char v22 = (void *)[v21 copy];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  id v24 = v28;
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v24, "deleteFolder:", *(void *)(*((void *)&v33 + 1) + 8 * j), v28);
      }
      uint64_t v25 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v25);
  }

  [v29 markForDeletion];
  if ([v29 importedFromLegacy]) {
    +[ICLegacyTombstone addLegacyTombstoneForFolder:v29];
  }
}

+ (id)purgableFoldersFetchRequest
{
  uint64_t v2 = +[ICFolder fetchRequest];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title MATCHES \"(^%@|^%@).*\", @"DefaultFolder", @"TrashFolder""];
  [v2 setPredicate:v3];

  return v2;
}

+ (void)purgeFolder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  [v4 deleteObject:v3];
}

+ (id)defaultFolderInContext:(id)a3
{
  id v3 = +[ICAccount defaultAccountInContext:a3];
  id v4 = [v3 defaultFolder];

  return v4;
}

+ (ICFolder)folderWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"%K == %@", @"identifier", a3];
  uint64_t v9 = [a1 foldersMatchingPredicate:v8 context:v7];

  id v10 = [v9 firstObject];

  return (ICFolder *)v10;
}

+ (id)allFoldersInContext:(id)a3
{
  return (id)[a1 foldersMatchingPredicate:0 context:a3];
}

+ (id)visibleFoldersInContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 predicateForVisibleFoldersInContext:v4];
  id v6 = [a1 foldersMatchingPredicate:v5 context:v4];

  return v6;
}

+ (unint64_t)countOfFoldersMatchingPredicate:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  uint64_t v8 = [v6 fetchRequestWithEntityName:@"ICFolder"];
  [v8 setPredicate:v5];
  id v13 = 0;
  unint64_t v9 = [v7 countForFetchRequest:v8 error:&v13];

  id v10 = v13;
  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICFolder(Management) countOfFoldersMatchingPredicate:context:]((uint64_t)v5, (uint64_t)v10, v11);
    }
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)predicateForVisibleCustomFolders
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"folderType == %d AND identifier != '%@*' AND identifier != '@%*'", 0, @"TrashFolder", @"DefaultFolder"];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = +[ICFolder predicateForVisibleObjects];
  v8[0] = v4;
  v8[1] = v2;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v3 andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateForFoldersInFolder:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ == %K", a3, @"parent"];
}

- (NSArray)visibleNotesInFolder
{
  id v3 = [(ICFolder *)self predicateForVisibleNotesInFolder];
  id v4 = [(ICFolder *)self managedObjectContext];
  id v5 = +[ICNote notesMatchingPredicate:v3 context:v4];

  return (NSArray *)v5;
}

- (id)pinnedNotesInFolder
{
  id v3 = [(ICFolder *)self predicateForPinnedNotesInFolder];
  id v4 = [(ICFolder *)self managedObjectContext];
  id v5 = +[ICNote notesMatchingPredicate:v3 context:v4];

  return v5;
}

- (NSArray)foldersInFolder
{
  id v3 = [(ICFolder *)self predicateForFoldersInFolder];
  id v4 = [(ICFolder *)self managedObjectContext];
  id v5 = +[ICFolder foldersMatchingPredicate:v3 context:v4];

  return (NSArray *)v5;
}

- (id)predicateForFoldersInFolder
{
  id v3 = objc_opt_class();
  return (id)[v3 predicateForFoldersInFolder:self];
}

- (id)predicateForPinnedNotesInFolder
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ICFolder *)self predicateForNotesInFolder];
  v7[0] = v2;
  id v3 = +[ICNote predicateForPinnedNotes];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v4];
  return v5;
}

- (id)predicateForAttachmentsInFolder
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"note.folder == %@", self];
}

- (id)predicateForVisibleAttachmentsInFolder
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(ICFolder *)self managedObjectContext];
  id v4 = +[ICBaseAttachment predicateForVisibleAttachmentsInContext:v3];
  v9[0] = v4;
  id v5 = [(ICFolder *)self predicateForAttachmentsInFolder];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v6];
  return v7;
}

+ (BOOL)supportsActivityEvents
{
  return 1;
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ICFolder.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);
}

- (ICQueryObjC)smartFolderQueryObjC
{
  uint64_t v2 = self;
  id v3 = ICFolder.smartFolderQuery.getter();

  return (ICQueryObjC *)v3;
}

- (void)setSmartFolderQueryObjC:(id)a3
{
  id v5 = a3;
  id v6 = self;
  ICFolder.smartFolderQuery.setter(a3);
}

- (NSString)smartFolderDescriptionObjC
{
  return (NSString *)sub_1C3D2EFA0(self, (uint64_t)a2, (void (*)(void))ICFolder.smartFolderDescription.getter);
}

- (NSString)smartFolderShortDescriptionObjC
{
  return (NSString *)sub_1C3D2EFA0(self, (uint64_t)a2, (void (*)(void))ICFolder.smartFolderShortDescription.getter);
}

+ (id)objc_smartFolderWithQuery:(id)a3 titleComponents:(id)a4 account:(id)a5
{
  uint64_t v8 = sub_1C3DBA018();
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_msgSend(a1, sel_newFolderInAccount_, v10);
  objc_msgSend(v11, sel_setSmartFolderQueryObjC_, v9);
  if (*(void *)(v8 + 16))
  {
    uint64_t v12 = self;
    id v13 = (void *)sub_1C3DB9FF8();
    id v14 = objc_msgSend(v12, sel_objc_defaultSmartFolderTitleWithComponents_, v13);

    objc_msgSend(v11, sel_setTitle_, v14);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }

  return v11;
}

+ (id)objc_smartFolderWithQuery:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)sub_1C3DB9FF8();
  id v9 = objc_msgSend(a1, sel_objc_smartFolderWithQuery_titleComponents_account_, v6, v8, v7);

  return v9;
}

+ (id)objc_defaultSmartFolderTitleWithComponents:(id)a3
{
  uint64_t v3 = sub_1C3DBA018();
  _sSo8ICFolderC11NotesSharedE23defaultSmartFolderTitle10componentsSSSaySSG_tFZ_0(v3);
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_1C3DB9BF8();
  swift_bridgeObjectRelease();
  return v4;
}

+ (void)deduplicatingTitle:(uint64_t)a1 forFolder:(void *)a2 forNewFolderParent:ofAccount:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 account];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Folder account mismatch %@ expects %@", v5, v6, v7, v8, v9);
}

+ (void)deduplicatingTitle:(os_log_t)log forFolder:forNewFolderParent:ofAccount:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Must supply at least a folder, the new folder parent, or account", v1, 2u);
}

- (void)setAccount:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 identifier];
  uint64_t v6 = [a2 identifier];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Setting account (%@) on folder (%@)", (uint8_t *)&v7, 0x16u);
}

- (void)setMarkedForDeletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  uint64_t v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Trying to mark an un-deletable folder (%@) for deletion: %@", v5, v6, v7, v8, v9);
}

@end