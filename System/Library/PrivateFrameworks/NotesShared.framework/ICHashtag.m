@interface ICHashtag
+ (BOOL)regenerateStandardizedContentForAllHashtagsInContext:(id)a3 hasChanges:(BOOL *)a4;
+ (NSString)localizedSectionTitle;
+ (id)allVisibleHashtagsForAccount:(id)a3;
+ (id)allVisibleHashtagsInContext:(id)a3;
+ (id)canonicalHashtagsInContext:(id)a3;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)hashtagObjectIDWithStandardizedContent:(id)a3 context:(id)a4;
+ (id)hashtagObjectIDsWithStandardizedContents:(id)a3 context:(id)a4;
+ (id)hashtagWithDisplayText:(id)a3 account:(id)a4 createIfNecessary:(BOOL)a5;
+ (id)hashtagWithIdentifier:(id)a3 context:(id)a4;
+ (id)hashtagWithStandardizedContent:(id)a3 account:(id)a4;
+ (id)hashtagWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5;
+ (id)hashtagsWithStandardizedContent:(id)a3 context:(id)a4;
+ (id)hashtagsWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5 context:(id)a6;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newHashtagWithIdentifier:(id)a3 displayText:(id)a4 account:(id)a5;
+ (id)predicateForHashtagWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5;
+ (id)renameHashtagsWithStandardizedContent:(id)a3 newDisplayText:(id)a4 context:(id)a5;
+ (id)standardizedHashtagRepresentationForDisplayText:(id)a3;
+ (void)dedupeHashtagsInAccount:(id)a3;
+ (void)dedupeHashtagsInAccount:(id)a3 atomicityExploitationCallback:(id)a4;
+ (void)enumerateHashtagsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6;
+ (void)purgeHashtag:(id)a3;
- (BOOL)canRenameTagWithNewDisplayText:(id)a3;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isInICloudAccount;
- (BOOL)isMovable;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)supportsDeletionByTTL;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (NSArray)authorsExcludingCurrentUser;
- (NSString)dataSourceIdentifier;
- (NSString)recordType;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (id)dataForTypeIdentifier:(id)a3;
- (id)fileURLForTypeIdentifier:(id)a3;
- (id)ic_loggingValues;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)recordZoneName;
- (id)searchableTextContent;
- (int64_t)visibilityTestingType;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3;
- (void)deleteFromLocalDatabase;
@end

@implementation ICHashtag

+ (id)canonicalHashtagsInContext:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [a1 allVisibleHashtagsInContext:a3];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = [v9 standardizedContent];
        v11 = [v4 objectForKeyedSubscript:v10];
        v12 = v11;
        if (!v11
          || ([v11 creationDate],
              v13 = objc_claimAutoreleasedReturnValue(),
              [v9 creationDate],
              v14 = objc_claimAutoreleasedReturnValue(),
              uint64_t v15 = [v13 compare:v14],
              v14,
              v13,
              v15 >= 1))
        {
          [v4 setObject:v9 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  v16 = (void *)MEMORY[0x1E4F29008];
  v17 = NSStringFromSelector(sel_standardizedContent);
  v18 = [v16 sortDescriptorWithKey:v17 ascending:1];

  v19 = [v4 allValues];
  v28 = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v21 = [v19 sortedArrayUsingDescriptors:v20];

  return v21;
}

+ (id)allVisibleHashtagsInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 predicateForVisibleObjects];
  uint64_t v6 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v5, v4);

  return v6;
}

+ (NSString)localizedSectionTitle
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Tags" value:@"Tags" table:0 allowSiri:1];
}

- (NSString)recordType
{
  return (NSString *)@"Hashtag";
}

- (id)recordZoneName
{
  return @"Notes";
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a3;
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E4F836F8];
    v12 = [(ICHashtag *)self className];
    v13 = ICStringFromSyncingApproach(a5);
    [v11 handleFailedAssertWithCondition:"__objc_no", "-[ICHashtag(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v12, v13 functionName simulateCrash showAlert format];

LABEL_5:
    BOOL v23 = 0;
    goto LABEL_6;
  }
  v25.receiver = self;
  v25.super_class = (Class)ICHashtag;
  if (![(ICCloudSyncingObject *)&v25 mergeCloudKitRecord:v10 accountID:a4 approach:0 mergeableFieldState:a6])goto LABEL_5; {
  v14 = [v10 recordID];
  }
  uint64_t v15 = [v14 recordName];
  [(ICHashtag *)self setIdentifier:v15];

  v16 = [v10 objectForKeyedSubscript:@"CreationDate"];
  [(ICHashtag *)self setCreationDate:v16];

  v17 = [v10 encryptedValues];
  v18 = [v17 objectForKeyedSubscript:@"DisplayTextEncrypted"];
  v19 = objc_msgSend(v18, "ic_stringValue");
  [(ICHashtag *)self setDisplayText:v19];

  v20 = [v10 encryptedValues];
  v21 = [v20 objectForKeyedSubscript:@"StandardizedContentEncrypted"];
  v22 = objc_msgSend(v21, "ic_stringValue");
  [(ICHashtag *)self setStandardizedContent:v22];

  BOOL v23 = 1;
LABEL_6:

  return v23;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v7 = [(ICHashtag *)self className];
    v8 = ICStringFromSyncingApproach(a3);
    [v6 handleFailedAssertWithCondition:"__objc_no", "-[ICHashtag(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v7, v8 functionName simulateCrash showAlert format];

    v9 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICHashtag;
    v9 = [(ICCloudSyncingObject *)&v21 makeCloudKitRecordForApproach:0 mergeableFieldState:a4];
    id v10 = [(ICCloudSyncingObject *)self creationDate];

    if (v10)
    {
      v11 = [(ICCloudSyncingObject *)self creationDate];
      [v9 setObject:v11 forKeyedSubscript:@"CreationDate"];
    }
    v12 = [(ICHashtag *)self displayText];

    if (v12)
    {
      v13 = [(ICHashtag *)self displayText];
      v14 = objc_msgSend(v13, "ic_dataValue");
      uint64_t v15 = [v9 encryptedValues];
      [v15 setObject:v14 forKeyedSubscript:@"DisplayTextEncrypted"];
    }
    v16 = [(ICHashtag *)self standardizedContent];

    if (v16)
    {
      v17 = [(ICHashtag *)self standardizedContent];
      v18 = objc_msgSend(v17, "ic_dataValue");
      v19 = [v9 encryptedValues];
      [v19 setObject:v18 forKeyedSubscript:@"StandardizedContentEncrypted"];
    }
  }
  return v9;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [a3 recordName];
  v8 = +[ICHashtag hashtagWithIdentifier:v7 context:v6];

  return v8;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[ICAccount cloudKitAccountWithIdentifier:v7 context:a5];
  id v10 = [v8 recordID];
  v11 = [v10 recordName];
  id v12 = +[ICHashtag newHashtagWithIdentifier:v11 displayText:&stru_1F1F2FFF8 account:v9];

  [v9 addHashtagsObject:v12];
  v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v12 setCreationDate:v13];

  [v12 mergeCloudKitRecord:v8 accountID:v7 approach:0];
  [v12 setServerRecord:v8];

  [v12 setInCloud:1];
  [v12 clearChangeCountWithReason:@"Created tag"];
  [v12 updateParentReferenceIfNecessary];

  return v12;
}

- (BOOL)isInICloudAccount
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICHashtag *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ICHashtag_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A44A8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__ICHashtag_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInCloud])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) account];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 accountType] == 1;
  }
}

- (void)deleteFromLocalDatabase
{
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
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
  id v2 = [(ICHashtag *)self objectID];
  v3 = [v2 URIRepresentation];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  id v2 = [(ICHashtag *)self account];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  id v4 = [(ICCloudSyncingObject *)self creationDate];
  [v3 setContentCreationDate:v4];

  uint64_t v5 = [(ICCloudSyncingObject *)self creationDate];
  [v3 setAddedDate:v5];

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  v3 = [(ICHashtag *)self userActivityContentAttributeSet];
  id v4 = [(ICHashtag *)self displayText];
  [v3 setDisplayName:v4];
  [v3 setTextContent:v4];
  objc_msgSend(v3, "setIc_searchResultType:", 4);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  [v3 setDataOwnerType:&unk_1F1F62790];
  if (objc_opt_respondsToSelector()) {
    [(ICHashtag *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)searchableTextContent
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICHashtag *)self displayText];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(ICHashtag *)self standardizedContent];
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

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (id)hashtagWithDisplayText:(id)a3 account:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 standardizedHashtagRepresentationForDisplayText:v8];
  v11 = [a1 hashtagWithStandardizedContent:v10 account:v9];
  if (!v11 && v5)
  {
    id v12 = [MEMORY[0x1E4F29128] UUID];
    v13 = [v12 UUIDString];

    v11 = (void *)[a1 newHashtagWithIdentifier:v13 displayText:v8 account:v9];
    [v11 updateChangeCountWithReason:@"Created tag"];
  }
  return v11;
}

+ (id)newHashtagWithIdentifier:(id)a3 displayText:(id)a4 account:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 managedObjectContext];
  id v12 = (void *)[a1 newObjectWithIdentifier:v10 context:v11];

  v13 = [MEMORY[0x1E4F1C9C8] now];
  [v12 setCreationDate:v13];

  v14 = objc_msgSend(v9, "ic_withoutHashtagPrefix");
  [v12 setDisplayText:v14];

  uint64_t v15 = [a1 standardizedHashtagRepresentationForDisplayText:v9];

  [v12 setStandardizedContent:v15];
  v16 = [v8 persistentStore];
  [v12 assignToPersistentStore:v16];

  [v8 addHashtagsObject:v12];
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v12, @"ICAccountDidAddHashtagNotificationHashtagKey", 0);
  [v17 postNotificationName:@"ICAccountDidAddHashtagNotification" object:v8 userInfo:v18];

  return v12;
}

- (BOOL)canRenameTagWithNewDisplayText:(id)a3
{
  id v4 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:a3];
  BOOL v5 = [(ICHashtag *)self account];
  uint64_t v6 = +[ICHashtag hashtagWithStandardizedContent:v4 account:v5];

  if (v6)
  {
    id v7 = [(ICHashtag *)self standardizedContent];
    char v8 = [v7 isEqualToString:v4];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (id)hashtagWithIdentifier:(id)a3 context:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  char v8 = [v6 predicateWithFormat:@"identifier = %@", a3];
  id v9 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v7);

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)hashtagsWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5 context:(id)a6
{
  BOOL v7 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (a3)
  {
    v11 = [a1 predicateForHashtagWithStandardizedContent:a3 onlyVisible:v7 account:a5];
    id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v16[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    v14 = objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v11, v13, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((standardizedContent) != nil)", "+[ICHashtag hashtagsWithStandardizedContent:onlyVisible:account:context:]", 1, 0, @"Expected non-nil value for '%s'", "standardizedContent");
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

+ (id)hashtagsWithStandardizedContent:(id)a3 context:(id)a4
{
  return (id)[a1 hashtagsWithStandardizedContent:a3 onlyVisible:1 account:0 context:a4];
}

+ (id)hashtagObjectIDsWithStandardizedContents:(id)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __62__ICHashtag_hashtagObjectIDsWithStandardizedContents_context___block_invoke;
  v14 = &unk_1E64A8E58;
  id v15 = v6;
  id v16 = a1;
  id v7 = v6;
  char v8 = objc_msgSend(a3, "ic_flatMap:", &v11);
  id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v8, v11, v12, v13, v14);

  return v9;
}

id __62__ICHashtag_hashtagObjectIDsWithStandardizedContents_context___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 40) hashtagsWithStandardizedContent:a2 context:*(void *)(a1 + 32)];
  v3 = objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_59);

  return v3;
}

uint64_t __62__ICHashtag_hashtagObjectIDsWithStandardizedContents_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

+ (id)hashtagObjectIDWithStandardizedContent:(id)a3 context:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v13 count:1];

  id v10 = objc_msgSend(a1, "hashtagObjectIDsWithStandardizedContents:context:", v9, v7, v13, v14);

  uint64_t v11 = [v10 anyObject];

  return v11;
}

+ (id)hashtagWithStandardizedContent:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 managedObjectContext];
  id v9 = [a1 hashtagsWithStandardizedContent:v7 onlyVisible:1 account:v6 context:v8];

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)hashtagWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v8 managedObjectContext];
  uint64_t v11 = [a1 hashtagsWithStandardizedContent:v9 onlyVisible:v5 account:v8 context:v10];

  uint64_t v12 = [v11 firstObject];

  return v12;
}

+ (id)allVisibleHashtagsForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 predicateForHashtagWithStandardizedContent:0 onlyVisible:1 account:v4];
  id v6 = [v4 managedObjectContext];

  id v7 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v5, v6);

  return v7;
}

+ (void)enumerateHashtagsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
}

+ (id)predicateForHashtagWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_opt_new();
  if (v6)
  {
    uint64_t v11 = [a1 predicateForVisibleObjects];
    [v10 addObject:v11];
  }
  if (v9)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    id v13 = [v9 identifier];
    uint64_t v14 = [v12 predicateWithFormat:@"account.identifier == %@", v13];
    [v10 addObject:v14];
  }
  if ([v8 length])
  {
    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"standardizedContent == %@", v8];
    [v10 addObject:v15];
  }
  id v16 = (void *)MEMORY[0x1E4F28BA0];
  v17 = (void *)[v10 copy];
  v18 = [v16 andPredicateWithSubpredicates:v17];

  return v18;
}

+ (void)purgeHashtag:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  BOOL v5 = [v3 defaultCenter];
  [v5 postNotificationName:@"ICAccountDidPurgeHashtagNotification" object:0 userInfo:0];

  id v6 = [v4 managedObjectContext];
  [v6 deleteObject:v4];
}

+ (id)standardizedHashtagRepresentationForDisplayText:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  BOOL v5 = [v3 currentLocale];
  id v6 = [v4 stringByFoldingWithOptions:257 locale:v5];

  id v7 = objc_msgSend(v6, "ic_trimmedString");

  id v8 = (void *)MEMORY[0x1E4F28B88];
  id v9 = objc_msgSend(NSString, "ic_hashtagCharacterString");
  id v10 = [v8 characterSetWithCharactersInString:v9];
  uint64_t v11 = objc_msgSend(v7, "ic_stringByTrimmingLeadingCharactersInSet:", v10);

  uint64_t v12 = [v11 uppercaseString];

  return v12;
}

+ (void)dedupeHashtagsInAccount:(id)a3
{
}

+ (void)dedupeHashtagsInAccount:(id)a3 atomicityExploitationCallback:(id)a4
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v66 = a4;
  id v7 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:](v6, v7);
  }

  id v8 = (void *)MEMORY[0x1E4F28C68];
  id v9 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"creationDate"];
  v87[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
  uint64_t v11 = [v8 expressionForFunction:@"min:" arguments:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v12 setName:@"minCreationDate"];
  [v12 setExpression:v11];
  [v12 setExpressionResultType:900];
  id v13 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v14 = +[ICCloudSyncingObject predicateForVisibleObjects];
  v86[0] = v14;
  id v15 = (void *)MEMORY[0x1E4F28F60];
  id v16 = [v6 identifier];
  v17 = [v15 predicateWithFormat:@"account.identifier == %@", v16];
  v86[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
  uint64_t v19 = [v13 andPredicateWithSubpredicates:v18];

  v20 = (void *)v19;
  objc_super v21 = [a1 fetchRequest];
  [v21 setPredicate:v19];
  [v21 setPropertiesToGroupBy:&unk_1F1F62D30];
  v85[0] = @"standardizedContent";
  v85[1] = v12;
  v85[2] = @"objectID";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:3];
  [v21 setPropertiesToFetch:v22];

  [v21 setResultType:2];
  BOOL v23 = [v6 managedObjectContext];
  id v77 = 0;
  long long v24 = [v23 executeFetchRequest:v21 error:&v77];
  id v25 = v77;

  if (v25)
  {
    long long v26 = (void *)MEMORY[0x1E4F836F8];
    long long v27 = [v6 identifier];
    [v26 handleFailedAssertWithCondition:"__objc_no", "+[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:]", 1, 0, @"Failed to fetch unique hashtags for account %@: %@", v27, v25 functionName simulateCrash showAlert format];
    v28 = v66;
  }
  else
  {
    id v67 = a1;
    v60 = v21;
    id v61 = v12;
    v62 = v11;
    v63 = v20;
    v29 = os_log_create("com.apple.notes", "CoreData");
    v65 = v24;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v24 count];
      v31 = [v6 identifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v82 = v30;
      __int16 v83 = 2112;
      v84 = v31;
      _os_log_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_DEFAULT, "Found %lu unique hashtags for account: %@", buf, 0x16u);

      long long v24 = v65;
    }
    v64 = v6;

    long long v27 = [MEMORY[0x1E4F1CA80] set];
    v32 = [MEMORY[0x1E4F1CA80] set];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v33 = v24;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v74 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          v39 = [v38 objectForKeyedSubscript:@"objectID"];
          [v27 addObject:v39];

          v40 = [v38 objectForKeyedSubscript:@"standardizedContent"];
          [v32 addObject:v40];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v35);
    }

    v28 = v66;
    if (v66) {
      (*((void (**)(id))v66 + 2))(v66);
    }
    v41 = [v67 fetchRequest];
    v42 = (void *)MEMORY[0x1E4F28BA0];
    v20 = v63;
    v79[0] = v63;
    v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"standardizedContent IN %@", v32];
    v79[1] = v43;
    v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (self IN %@)", v27];
    v79[2] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
    v46 = [v42 andPredicateWithSubpredicates:v45];
    [v41 setPredicate:v46];

    id v6 = v64;
    v47 = [v64 managedObjectContext];
    id v72 = 0;
    v48 = [v47 executeFetchRequest:v41 error:&v72];
    id v25 = v72;

    if (v25)
    {
      v49 = (void *)MEMORY[0x1E4F836F8];
      v50 = [v64 identifier];
      [v49 handleFailedAssertWithCondition:"__objc_no", "+[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:]", 1, 0, @"Failed to fetch hashtags to delete for account %@: %@", v50, v25 functionName simulateCrash showAlert format];
    }
    else
    {
      v59 = v41;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v58 = v48;
      id v51 = v48;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v68 objects:v78 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v53; ++j)
          {
            if (*(void *)v69 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            v57 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
              +[ICHashtag dedupeHashtagsInAccount:&v82 atomicityExploitationCallback:v57];
            }

            [v56 markForDeletion];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v68 objects:v78 count:16];
        }
        while (v53);
      }

      id v6 = v64;
      v50 = [v64 managedObjectContext];
      objc_msgSend(v50, "ic_save");
      v28 = v66;
      v20 = v63;
      id v25 = 0;
      v41 = v59;
      v48 = v58;
    }

    id v12 = v61;
    uint64_t v11 = v62;
    objc_super v21 = v60;
    long long v24 = v65;
  }
}

+ (BOOL)regenerateStandardizedContentForAllHashtagsInContext:(id)a3 hasChanges:(BOOL *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 predicateForHashtagWithStandardizedContent:0 onlyVisible:1 account:0];
  id v25 = v6;
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v7, v6);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9)
  {

    BOOL v20 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  v22 = v7;
  BOOL v23 = a4;
  char v24 = 0;
  uint64_t v11 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v14 = (void *)MEMORY[0x1C877DB80]();
      id v15 = [v13 displayText];
      id v16 = [a1 standardizedHashtagRepresentationForDisplayText:v15];

      v17 = [v13 standardizedContent];
      char v18 = [v16 isEqualToString:v17];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = [v13 standardizedContent];
        +[ICInlineAttachment regenerateTokenContentIdentifierForHashtagAttachmentsInContext:v25 currentTokenContentIdentifier:v19 save:0];

        [v13 setStandardizedContent:v16];
        [v13 updateChangeCountWithReason:@"Regenerated standardized content"];
        char v24 = 1;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v10);

  if (v24)
  {
    objc_msgSend(v25, "ic_save");
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }
  id v7 = v22;
  a4 = v23;
  if (v23) {
LABEL_16:
  }
    *a4 = v20;
LABEL_17:

  return 1;
}

+ (id)renameHashtagsWithStandardizedContent:(id)a3 newDisplayText:(id)a4 context:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v7 = a4;
  id v8 = a5;
  if (![v7 length]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"newDisplayText.length" functionName:"+[ICHashtag renameHashtagsWithStandardizedContent:newDisplayText:context:]" simulateCrash:1 showAlert:0 format:@"Hashtag must have a non-empty display text"];
  }
  uint64_t v9 = &off_1E64A3000;
  uint64_t v10 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:v7];
  v42 = v7;
  uint64_t v11 = objc_msgSend(v7, "ic_withHashtagPrefix");
  v41 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = +[ICAccount allActiveAccountsInContext:v8];
  uint64_t v45 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v45)
  {
    uint64_t v43 = *(void *)v61;
    id v44 = v8;
    v50 = v11;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v12;
        uint64_t v13 = *(void *)(*((void *)&v60 + 1) + 8 * v12);
        uint64_t v14 = [v9[208] hashtagWithStandardizedContent:v51 account:v13];
        [v14 markForDeletion];
        v48 = v14;
        if (v14)
        {
          id v15 = [v9[208] hashtagWithDisplayText:v42 account:v13 createIfNecessary:1];
          [v41 addObject:v15];
        }
        uint64_t v47 = v13;
        id v16 = (void *)MEMORY[0x1E4F28BA0];
        v17 = +[ICBaseAttachment predicateForVisibleObjects];
        v66[0] = v17;
        char v18 = +[ICInlineAttachment predicateForTypeUTI:@"com.apple.notes.inlinetextattachment.hashtag"];
        v66[1] = v18;
        uint64_t v19 = +[ICInlineAttachment predicateForTokenContentIdentifier:v51];
        v66[2] = v19;
        BOOL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
        objc_super v21 = [v16 andPredicateWithSubpredicates:v20];
        v22 = +[ICInlineAttachment ic_objectsMatchingPredicate:v21 context:v8];

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v57 != v26) {
                objc_enumerationMutation(v23);
              }
              long long v28 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              [v28 setTokenContentIdentifier:v10];
              [v28 setAltText:v50];
              [v28 updateChangeCountWithReason:@"Renamed tag"];
              id v29 = (id)objc_msgSend(v28, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICInlineAttachmentDataChangedNotification");
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v65 count:16];
          }
          while (v25);
        }
        v46 = v23;

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v30 = +[ICFolder visibleSmartFoldersForHashtagStandardizedContent:v51 account:v47];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v53 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void **)(*((void *)&v52 + 1) + 8 * j);
              uint64_t v36 = [v35 smartFolderQuery];
              v37 = [v36 replacingTagIdentifier:v51 withNewTagIdentifier:v10];
              [v35 setSmartFolderQuery:v37];

              [v35 updateChangeCountWithReason:@"Renamed tag"];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v64 count:16];
          }
          while (v32);
        }

        +[ICInlineAttachment regenerateDerivedDataForInlineAttachments:v46 reason:@"Renamed tag"];
        uint64_t v11 = v50;
        uint64_t v12 = v49 + 1;
        id v8 = v44;
        uint64_t v9 = &off_1E64A3000;
      }
      while (v49 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v45);
  }

  v38 = (void *)[v41 copy];
  return v38;
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICHashtag;
  v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(ICHashtag *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__ICHashtag_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E64A4218;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = v6;
  return v7;
}

void __29__ICHashtag_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) creationDate];
  v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"creationDate"];

  id v8 = [*(id *)(a1 + 40) standardizedContent];
  uint64_t v5 = objc_msgSend(v8, "ic_sha256");
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"standardizedContentHash"];
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ICHashtag.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);
}

+ (void)dedupeHashtagsInAccount:(void *)a3 atomicityExploitationCallback:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = objc_msgSend(a2, "ic_loggingDescription");
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Deleting duplicate hashtag: %@", a1, 0xCu);
}

+ (void)dedupeHashtagsInAccount:(void *)a1 atomicityExploitationCallback:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Attempting to de-dupe hashtags for account: %@", (uint8_t *)&v4, 0xCu);
}

@end