@interface ICInlineAttachment
+ (BOOL)isHashtagStandardizedContent:(id)a3 usedInAccount:(id)a4;
+ (id)canonicalHashtagAttachmentsInContext:(id)a3;
+ (id)cloneInlineAttachmentWithIdentifier:(id)a3 context:(id)a4;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)existingInlineAttachmentWithTokenContentIdentifier:(id)a3 typeUTI:(id)a4 context:(id)a5;
+ (id)newAttachmentWithIdentifier:(id)a3 typeUTI:(id)a4 altText:(id)a5 tokenContentIdentifier:(id)a6 note:(id)a7 parentAttachment:(id)a8;
+ (id)newCalculateGraphExpressionAttachmentWithIdentifier:(id)a3 altText:(id)a4 note:(id)a5 parentAttachment:(id)a6 rightToLeft:(BOOL)a7;
+ (id)newCalculateGraphExpressionAttachmentWithIdentifier:(id)a3 note:(id)a4 parentAttachment:(id)a5 rightToLeft:(BOOL)a6;
+ (id)newCalculateResultAttachmentWithIdentifier:(id)a3 note:(id)a4 parentAttachment:(id)a5 rightToLeft:(BOOL)a6;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newHashtagAttachmentWithIdentifier:(id)a3 forHashtag:(id)a4 note:(id)a5 parentAttachment:(id)a6;
+ (id)newHashtagAttachmentWithIdentifier:(id)a3 hashtagText:(id)a4 creatingHashtagIfNecessary:(BOOL)a5 note:(id)a6 parentAttachment:(id)a7;
+ (id)newLinkAttachmentWithIdentifier:(id)a3 toNote:(id)a4 fromNote:(id)a5 parentAttachment:(id)a6;
+ (id)newMentionAttachmentWithIdentifier:(id)a3 mentionText:(id)a4 userRecordName:(id)a5 note:(id)a6 parentAttachment:(id)a7;
+ (id)noteFromAttachmentRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)predicateForMentionsInContext:(id)a3;
+ (id)predicateForTokenContentIdentifier:(id)a3;
+ (id)predicateForTypeUTI:(id)a3;
+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3;
+ (id)recentlyUsedDatesForHashtagsStandardizedContents:(id)a3 context:(id)a4;
+ (unint64_t)countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 account:(id)a4;
+ (unint64_t)countOfVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 account:(id)a4;
+ (unint64_t)countOfVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 includingTrash:(BOOL)a4 account:(id)a5;
+ (void)changeLinkDestinationFromNote:(id)a3 toNote:(id)a4;
+ (void)enumerateInlineAttachmentsInContext:(id)a3 typeUTI:(id)a4 tokenContentIdentifier:(id)a5 batchSize:(unint64_t)a6 visibleOnly:(BOOL)a7 saveAfterBatch:(BOOL)a8 usingBlock:(id)a9;
+ (void)enumerateLinksToNote:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 context:(id)a7 usingBlock:(id)a8;
+ (void)purgeAttachment:(id)a3;
+ (void)regenerateDerivedDataForInlineAttachments:(id)a3 reason:(id)a4;
+ (void)regenerateTokenContentIdentifierForHashtagAttachmentsInContext:(id)a3 currentTokenContentIdentifier:(id)a4 save:(BOOL)a5;
+ (void)reviveOrTouchHashtag:(id)a3;
- (BOOL)animateInsertion;
- (BOOL)didAddAttachmentDataChangedObservers;
- (BOOL)hasAllMandatoryFields;
- (BOOL)isCalculateGraphExpressionAttachment;
- (BOOL)isCalculateResultAttachment;
- (BOOL)isHashtagAttachment;
- (BOOL)isInICloudAccount;
- (BOOL)isLinkAttachment;
- (BOOL)isMentionAttachment;
- (BOOL)isRightToLeftCalculateAttachment;
- (BOOL)isValidCalculateAttachment;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)saveToArchive:(void *)a3 dataPersister:(id)a4 error:(id *)a5;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)supportsDeletionByTTL;
- (BOOL)supportsEncryptedValuesDictionary;
- (BOOL)updateCalculateGraphExpressionText:(id)a3;
- (BOOL)updateCalculateResult:(id)a3 isRightToLeft:(BOOL)a4;
- (BOOL)updateCalculateText:(id)a3 isValid:(BOOL)a4 isRightToLeft:(BOOL)a5;
- (NSAttributedString)searchableTextContentInNote;
- (NSString)altText;
- (NSString)calculateState;
- (NSString)displayText;
- (NSString)recordType;
- (NSString)tokenContentIdentifier;
- (_NSRange)animatableRange;
- (_NSRange)displayTextRangeForSearchRange:(_NSRange)a3 inSearchableString:(id)a4;
- (id)clone;
- (id)fallbackDisplayText;
- (id)ic_loggingValues;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)nonNilAltText;
- (id)parentAttachmentFromRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)parentEncryptableObject;
- (id)recordZoneName;
- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3;
- (signed)attachmentType;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)deleteFromLocalDatabase;
- (void)loadFromArchive:(const void *)a3 dataPersister:(id)a4 withIdentifierMap:(id)a5;
- (void)markDisplayTextNeedsUpdate;
- (void)markForDeletion;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
- (void)propagateDeletionToHashtagForMarkForDeletion:(BOOL)a3;
- (void)setAltText:(id)a3;
- (void)setAnimateInsertion:(BOOL)a3;
- (void)setCalculateState:(id)a3;
- (void)setDidAddAttachmentDataChangedObservers:(BOOL)a3;
- (void)setTokenContentIdentifier:(id)a3;
- (void)unmarkForDeletion;
- (void)updateMarkedForDeletionStateInlineAttachmentIsInUse:(BOOL)a3;
- (void)willTurnIntoFault;
- (void)writeMergeableFieldStateIfNecessary:(id)a3;
@end

@implementation ICInlineAttachment

- (void)loadFromArchive:(const void *)a3 dataPersister:(id)a4 withIdentifierMap:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (*((unsigned char *)a3 + 32))
  {
    id v11 = [NSString alloc];
    v12 = (uint64_t *)*((void *)a3 + 5);
    if (*((char *)v12 + 23) < 0)
    {
      v12 = (uint64_t *)*v12;
      uint64_t v13 = *(void *)(*((void *)a3 + 5) + 8);
    }
    else
    {
      uint64_t v13 = *((unsigned __int8 *)v12 + 23);
    }
    uint64_t v14 = [v11 initWithBytes:v12 length:v13 encoding:4];
    if (v9)
    {
      v15 = [(ICInlineAttachment *)self identifier];
      [v9 setObject:v15 forKeyedSubscript:v14];
    }
    v10 = (__CFString *)v14;
  }
  else
  {
    v10 = &stru_1F1F2FFF8;
  }
  if ((*((_DWORD *)a3 + 8) & 0x1000000) != 0) {
    uint64_t v16 = *((void *)a3 + 29);
  }
  else {
    uint64_t v16 = 0;
  }
  [(ICCloudSyncingObject *)self requireMinimumSupportedVersionAndPropagateToChildObjects:v16];
  int v17 = *((_DWORD *)a3 + 8);
  if ((v17 & 0x40) != 0)
  {
    id v18 = [NSString alloc];
    v19 = (uint64_t *)*((void *)a3 + 10);
    if (*((char *)v19 + 23) < 0)
    {
      v19 = (uint64_t *)*v19;
      uint64_t v20 = *(void *)(*((void *)a3 + 10) + 8);
    }
    else
    {
      uint64_t v20 = *((unsigned __int8 *)v19 + 23);
    }
    v21 = (void *)[v18 initWithBytes:v19 length:v20 encoding:4];
    [(ICInlineAttachment *)self setTypeUTI:v21];

    int v17 = *((_DWORD *)a3 + 8);
  }
  if ((v17 & 0x20) != 0)
  {
    id v22 = [NSString alloc];
    v23 = (uint64_t *)*((void *)a3 + 9);
    if (*((char *)v23 + 23) < 0)
    {
      v23 = (uint64_t *)*v23;
      uint64_t v24 = *(void *)(*((void *)a3 + 9) + 8);
    }
    else
    {
      uint64_t v24 = *((unsigned __int8 *)v23 + 23);
    }
    v25 = (void *)[v22 initWithBytes:v23 length:v24 encoding:4];
    [(ICInlineAttachment *)self setAltText:v25];
  }
  if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v27 = (uint64_t *)*((void *)a3 + 38);
    if (*((char *)v27 + 23) < 0)
    {
      v27 = (uint64_t *)*v27;
      uint64_t v28 = *(void *)(*((void *)a3 + 38) + 8);
    }
    else
    {
      uint64_t v28 = *((unsigned __int8 *)v27 + 23);
    }
    v29 = (void *)[v26 initWithBytes:v27 length:v28];
    id v40 = 0;
    v30 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v29 options:0 error:&v40];
    id v31 = v40;
    v32 = v31;
    if (!v30 || v31)
    {
      v37 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = [(ICInlineAttachment *)self className];
        v39 = [(ICInlineAttachment *)self identifier];
        *(_DWORD *)buf = 138412802;
        v42 = v38;
        __int16 v43 = 2112;
        v44 = v39;
        __int16 v45 = 2112;
        v46 = v32;
        _os_log_error_impl(&dword_1C3A61000, v37, OS_LOG_TYPE_ERROR, "Error parsing metadata JSON for %@ (%@): %@", buf, 0x20u);
      }
      v34 = v37;
    }
    else
    {
      objc_opt_class();
      v33 = [v30 objectForKeyedSubscript:@"creationDateKey"];
      v34 = ICDynamicCast();

      if (v34)
      {
        v35 = (void *)MEMORY[0x1E4F1C9C8];
        [v34 doubleValue];
        v36 = objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
        [(ICInlineAttachment *)self setCreationDate:v36];
      }
      v37 = [v30 objectForKeyedSubscript:@"tokenContentIdentifierKey"];
      [(ICInlineAttachment *)self setTokenContentIdentifier:v37];
    }
  }
}

- (BOOL)saveToArchive:(void *)a3 dataPersister:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(ICInlineAttachment *)self identifier];

  if (v8)
  {
    id v9 = [(ICInlineAttachment *)self identifier];
    [v9 UTF8String];
    *((_DWORD *)a3 + 8) |= 1u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 5) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  int64_t v10 = [(ICInlineAttachment *)self intrinsicNotesVersionForScenario:1];
  if (v10)
  {
    *((_DWORD *)a3 + 8) |= 0x1000000u;
    *((void *)a3 + 29) = v10;
  }
  id v11 = [(ICInlineAttachment *)self typeUTI];

  if (v11)
  {
    id v12 = [(ICInlineAttachment *)self typeUTI];
    [v12 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x40u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 10) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  uint64_t v13 = [(ICInlineAttachment *)self altText];

  if (v13)
  {
    id v14 = [(ICInlineAttachment *)self altText];
    [v14 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x20u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 9) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
  int v17 = [(ICCloudSyncingObject *)self creationDate];
  [v17 timeIntervalSinceReferenceDate];
  id v18 = objc_msgSend(v16, "numberWithDouble:");
  objc_msgSend(v15, "ic_setNonNilObject:forKey:", v18, @"creationDateKey");

  v19 = [(ICInlineAttachment *)self tokenContentIdentifier];
  objc_msgSend(v15, "ic_setNonNilObject:forKey:", v19, @"tokenContentIdentifierKey");

  if ([v15 count])
  {
    id v31 = 0;
    uint64_t v20 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:&v31];
    id v21 = v31;
    id v22 = v21;
    if (v20) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 0;
    }
    BOOL v24 = v23;
    if (v23)
    {
      id v25 = v20;
      [v25 bytes];
      [v25 length];
      *((_DWORD *)a3 + 9) |= 2u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*((void *)a3 + 38) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
    }
    else
    {
      id v26 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v29 = [(ICInlineAttachment *)self className];
        v30 = [(ICInlineAttachment *)self identifier];
        *(_DWORD *)buf = 138412802;
        v33 = v29;
        __int16 v34 = 2112;
        v35 = v30;
        __int16 v36 = 2112;
        v37 = v22;
        _os_log_error_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_ERROR, "Error converting metadata to JSON for %@ (%@): %@", buf, 0x20u);
      }
    }
  }
  else
  {
    BOOL v24 = 1;
  }

  return v24;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (id)newHashtagAttachmentWithIdentifier:(id)a3 hashtagText:(id)a4 creatingHashtagIfNecessary:(BOOL)a5 note:(id)a6 parentAttachment:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v30 = a7;
  v15 = [v14 account];
  uint64_t v16 = +[ICHashtag hashtagWithDisplayText:v13 account:v15 createIfNecessary:v9];

  int v17 = [v16 displayText];
  id v18 = objc_msgSend(v17, "ic_withHashtagPrefix");
  v19 = v18;
  if (!v18)
  {
    v19 = objc_msgSend(v13, "ic_withHashtagPrefix");
  }
  uint64_t v20 = [v16 standardizedContent];
  id v29 = a1;
  if (v20)
  {
    id v21 = a1;
    id v22 = v12;
    BOOL v23 = v30;
    BOOL v24 = (void *)[v21 newAttachmentWithIdentifier:v12 typeUTI:@"com.apple.notes.inlinetextattachment.hashtag" altText:v19 tokenContentIdentifier:v20 note:v14 parentAttachment:v30];
  }
  else
  {
    +[ICHashtag standardizedHashtagRepresentationForDisplayText:v13];
    v25 = id v28 = v13;
    id v26 = a1;
    id v22 = v12;
    BOOL v23 = v30;
    BOOL v24 = (void *)[v26 newAttachmentWithIdentifier:v12 typeUTI:@"com.apple.notes.inlinetextattachment.hashtag" altText:v19 tokenContentIdentifier:v25 note:v14 parentAttachment:v30];

    id v13 = v28;
  }

  if (!v18) {
  if (v24 && v16)
  }
    [v29 reviveOrTouchHashtag:v16];

  return v24;
}

+ (id)newHashtagAttachmentWithIdentifier:(id)a3 forHashtag:(id)a4 note:(id)a5 parentAttachment:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 displayText];
  v15 = objc_msgSend(v14, "ic_withHashtagPrefix");
  uint64_t v16 = [v10 standardizedContent];
  int v17 = (void *)[a1 newAttachmentWithIdentifier:v13 typeUTI:@"com.apple.notes.inlinetextattachment.hashtag" altText:v15 tokenContentIdentifier:v16 note:v12 parentAttachment:v11];

  if (v10 && v17) {
    [a1 reviveOrTouchHashtag:v10];
  }

  return v17;
}

+ (void)reviveOrTouchHashtag:(id)a3
{
  id v3 = a3;
  if (([v3 needsInitialFetchFromCloud] & 1) == 0)
  {
    if ([v3 markedForDeletion]) {
      [v3 unmarkForDeletion];
    }
    else {
      [v3 updateChangeCountWithReason:@"Touched tag"];
    }
  }
}

+ (id)newMentionAttachmentWithIdentifier:(id)a3 mentionText:(id)a4 userRecordName:(id)a5 note:(id)a6 parentAttachment:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  uint64_t v16 = objc_msgSend(a4, "ic_mentionString");
  int v17 = (void *)[a1 newAttachmentWithIdentifier:v15 typeUTI:@"com.apple.notes.inlinetextattachment.mention" altText:v16 tokenContentIdentifier:v14 note:v13 parentAttachment:v12];

  return v17;
}

+ (id)newLinkAttachmentWithIdentifier:(id)a3 toNote:(id)a4 fromNote:(id)a5 parentAttachment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[ICAppURLUtilities entityURIForNote:v12];
  id v15 = [v12 titleForLinking];

  uint64_t v16 = [v14 absoluteString];
  int v17 = (void *)[a1 newAttachmentWithIdentifier:v13 typeUTI:@"com.apple.notes.inlinetextattachment.link" altText:v15 tokenContentIdentifier:v16 note:v11 parentAttachment:v10];

  return v17;
}

+ (id)newCalculateResultAttachmentWithIdentifier:(id)a3 note:(id)a4 parentAttachment:(id)a5 rightToLeft:(BOOL)a6
{
  if (a6) {
    v6 = @"ICInlineAttachmentCalculateStateInvalidRTL";
  }
  else {
    v6 = @"ICInlineAttachmentCalculateStateInvalidLTR";
  }
  return (id)[a1 newAttachmentWithIdentifier:a3 typeUTI:@"com.apple.notes.inlinetextattachment.calculateresult" altText:0 tokenContentIdentifier:v6 note:a4 parentAttachment:a5];
}

+ (id)newCalculateGraphExpressionAttachmentWithIdentifier:(id)a3 note:(id)a4 parentAttachment:(id)a5 rightToLeft:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = @"ICInlineAttachmentCalculateStateValidLTR";
  if (a6) {
    id v11 = @"ICInlineAttachmentCalculateStateValidRTL";
  }
  id v12 = NSString;
  id v13 = v11;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  int v17 = objc_msgSend(v12, "ic_calculateGraphExpressionString");
  id v18 = v17;
  if (v6)
  {
    uint64_t v19 = objc_msgSend(v17, "ic_rightToLeftString");

    id v18 = (void *)v19;
  }
  uint64_t v20 = (void *)[a1 newAttachmentWithIdentifier:v16 typeUTI:@"com.apple.notes.inlinetextattachment.calculategraphexpression" altText:v18 tokenContentIdentifier:v13 note:v15 parentAttachment:v14];

  return v20;
}

+ (id)newCalculateGraphExpressionAttachmentWithIdentifier:(id)a3 altText:(id)a4 note:(id)a5 parentAttachment:(id)a6 rightToLeft:(BOOL)a7
{
  if (a7) {
    id v8 = @"ICInlineAttachmentCalculateStateValidRTL";
  }
  else {
    id v8 = @"ICInlineAttachmentCalculateStateValidLTR";
  }
  return (id)[a1 newAttachmentWithIdentifier:a3 typeUTI:@"com.apple.notes.inlinetextattachment.calculategraphexpression" altText:a4 tokenContentIdentifier:v8 note:a5 parentAttachment:a6];
}

+ (id)newAttachmentWithIdentifier:(id)a3 typeUTI:(id)a4 altText:(id)a5 tokenContentIdentifier:(id)a6 note:(id)a7 parentAttachment:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  if (![v18 length]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"altText.length" functionName:"+[ICInlineAttachment newAttachmentWithIdentifier:typeUTI:altText:tokenContentIdentifier:note:parentAttachment:]" simulateCrash:1 showAlert:0 format:@"Inline attachment must have a non-empty alt text"];
  }
  uint64_t v20 = [v15 managedObjectContext];
  id v21 = (void *)[a1 newObjectWithIdentifier:v19 context:v20];

  id v22 = [v15 account];
  BOOL v23 = [v22 persistentStore];
  [v21 assignToPersistentStore:v23];

  BOOL v24 = [v15 account];
  [v21 setAccount:v24];

  [v21 setNote:v15];
  [v21 setParentAttachment:v16];
  if ([v15 isPasswordProtected])
  {
    [v21 setIsPasswordProtected:1];
    [v21 initializeCryptoProperties];
  }
  [v21 setTypeUTI:v14];
  [v21 setAltText:v18];

  [v21 setTokenContentIdentifier:v17];
  id v25 = [MEMORY[0x1E4F1C9C8] now];
  [v21 setCreationDate:v25];

  [v15 addInlineAttachmentsObject:v21];
  [v16 addInlineAttachmentsObject:v21];

  return v21;
}

+ (id)cloneInlineAttachmentWithIdentifier:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[ICBaseAttachment attachmentWithIdentifier:v5 context:v6];
  id v8 = v7;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__26;
  id v19 = __Block_byref_object_dispose__26;
  id v20 = 0;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__ICInlineAttachment_cloneInlineAttachmentWithIdentifier_context___block_invoke;
    v12[3] = &unk_1E64A4528;
    id v14 = &v15;
    id v13 = v7;
    [v6 performBlockAndWait:v12];

    BOOL v9 = (void *)v16[5];
  }
  else
  {
    BOOL v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __66__ICInlineAttachment_cloneInlineAttachmentWithIdentifier_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) clone];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)existingInlineAttachmentWithTokenContentIdentifier:(id)a3 typeUTI:(id)a4 context:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 predicateForTypeUTI:a4];
  id v11 = [a1 predicateForTokenContentIdentifier:v8];
  id v12 = [a1 predicateForVisibleObjects];
  id v13 = (void *)MEMORY[0x1E4F28BA0];
  v22[0] = v10;
  v22[1] = v11;
  v22[2] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

  id v16 = [a1 fetchRequest];
  [v16 setPredicate:v15];
  [v16 setFetchLimit:1];
  id v21 = 0;
  uint64_t v17 = [v9 executeFetchRequest:v16 error:&v21];

  id v18 = v21;
  if (v18) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICInlineAttachment existingInlineAttachmentWithTokenContentIdentifier:typeUTI:context:]", 1, 0, @"Failed to fetch inline attachments with standardizedContent %@: %@", v8, v18 functionName simulateCrash showAlert format];
  }
  id v19 = [v17 firstObject];

  return v19;
}

- (id)clone
{
  uint64_t v3 = objc_opt_class();
  v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];
  id v6 = [(ICInlineAttachment *)self typeUTI];
  id v7 = [(ICInlineAttachment *)self altText];
  id v8 = [(ICInlineAttachment *)self tokenContentIdentifier];
  id v9 = [(ICInlineAttachment *)self note];
  id v10 = [(ICInlineAttachment *)self parentAttachment];
  id v11 = (void *)[v3 newAttachmentWithIdentifier:v5 typeUTI:v6 altText:v7 tokenContentIdentifier:v8 note:v9 parentAttachment:v10];

  return v11;
}

+ (id)canonicalHashtagAttachmentsInContext:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"creationDate"];
  v26[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v8 = [v5 expressionForFunction:@"min:" arguments:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v9 setName:@"minCreationDate"];
  [v9 setExpression:v8];
  [v9 setExpressionResultType:900];
  id v10 = +[ICInlineAttachment fetchRequest];
  v25[0] = @"objectID";
  v25[1] = @"tokenContentIdentifier";
  v25[2] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  [v10 setPropertiesToFetch:v11];

  [v10 setPropertiesToGroupBy:&unk_1F1F62C40];
  [v10 setResultType:2];
  id v12 = [a1 predicateForTypeUTI:@"com.apple.notes.inlinetextattachment.hashtag"];
  [v10 setPredicate:v12];

  id v23 = 0;
  id v13 = [v4 executeFetchRequest:v10 error:&v23];
  id v14 = v23;
  if (v14)
  {
    uint64_t v15 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ICInlineAttachment canonicalHashtagAttachmentsInContext:](v14, v15);
    }
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v17 = v15;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v13, "ic_map:", &__block_literal_global_33);
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v17];
    [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    id v22 = v8;
    v19 = id v18 = v4;
    BOOL v24 = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v16 = objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v15, v20, v18);

    id v4 = v18;
    id v8 = v22;
  }

  return v16;
}

uint64_t __59__ICInlineAttachment_canonicalHashtagAttachmentsInContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"objectID"];
}

+ (void)changeLinkDestinationFromNote:(id)a3 toNote:(id)a4
{
  v47[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 managedObjectContext];
  if (!v8) {
    goto LABEL_15;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v7 managedObjectContext];
  if (!v10)
  {

    goto LABEL_15;
  }
  id v11 = (void *)v10;
  id v12 = [v6 managedObjectContext];
  id v13 = [v7 managedObjectContext];

  if (v12 != v13)
  {
LABEL_15:
    v35 = (void *)MEMORY[0x1E4F836F8];
    __int16 v36 = @"From note context must be non-nil and the same as to note context";
LABEL_16:
    [v35 handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICInlineAttachment changeLinkDestinationFromNote:toNote:]" simulateCrash:1 showAlert:0 format:v36];
    goto LABEL_17;
  }
  id v14 = [v7 identifier];
  if (![v14 length])
  {

    goto LABEL_19;
  }
  uint64_t v15 = [v6 identifier];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
LABEL_19:
    v35 = (void *)MEMORY[0x1E4F836F8];
    __int16 v36 = @"From and to notes must have non-empty identifiers";
    goto LABEL_16;
  }
  id v40 = a1;
  uint64_t v17 = +[ICAppURLUtilities entityURIForNote:v6];
  id v18 = +[ICAppURLUtilities entityURIForNote:v7];
  id v19 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v38 = +[ICBaseAttachment predicateForVisibleObjects];
  v47[0] = v38;
  v37 = +[ICInlineAttachment predicateForTypeUTI:@"com.apple.notes.inlinetextattachment.link"];
  v47[1] = v37;
  v39 = v17;
  id v20 = [v17 absoluteString];
  id v21 = +[ICInlineAttachment predicateForTokenContentIdentifier:v20];
  v47[2] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  id v23 = [v19 andPredicateWithSubpredicates:v22];
  id v41 = v6;
  BOOL v24 = [v6 managedObjectContext];
  id v25 = +[ICInlineAttachment ic_objectsMatchingPredicate:v23 context:v24];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v32 = [v18 absoluteString];
        [v31 setTokenContentIdentifier:v32];

        v33 = [v7 titleForLinking];
        [v31 setAltText:v33];

        [v31 updateChangeCountWithReason:@"Updated link destination"];
        id v34 = (id)objc_msgSend(v31, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICInlineAttachmentDataChangedNotification");
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v28);
  }

  [v40 regenerateDerivedDataForInlineAttachments:v26 reason:@"Updated link destination"];
  id v6 = v41;
LABEL_17:
}

+ (void)enumerateLinksToNote:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 context:(id)a7 usingBlock:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v17 = +[ICAppURLUtilities entityURIForNote:a3];
  uint64_t v16 = [v17 absoluteString];
  [a1 enumerateInlineAttachmentsInContext:v15 typeUTI:@"com.apple.notes.inlinetextattachment.link" tokenContentIdentifier:v16 batchSize:a4 visibleOnly:v10 saveAfterBatch:v9 usingBlock:v14];
}

+ (void)enumerateInlineAttachmentsInContext:(id)a3 typeUTI:(id)a4 tokenContentIdentifier:(id)a5 batchSize:(unint64_t)a6 visibleOnly:(BOOL)a7 saveAfterBatch:(BOOL)a8 usingBlock:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  id v18 = objc_opt_new();
  if (v15)
  {
    id v19 = [a1 predicateForTypeUTI:v15];
    objc_msgSend(v18, "ic_addNonNilObject:", v19);
  }
  if (v16)
  {
    id v20 = [a1 predicateForTokenContentIdentifier:v16];
    objc_msgSend(v18, "ic_addNonNilObject:", v20);
  }
  if (v10)
  {
    id v21 = [a1 predicateForVisibleAttachmentsInContext:v25];
    objc_msgSend(v18, "ic_addNonNilObject:", v21);
  }
  id v22 = (void *)MEMORY[0x1E4F28BA0];
  id v23 = (void *)[v18 copy];
  BOOL v24 = [v22 andPredicateWithSubpredicates:v23];

  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v24, 0, 0, v25, a6, v9, v17);
}

+ (void)regenerateDerivedDataForInlineAttachments:(id)a3 reason:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "ic_compactMap:", &__block_literal_global_94);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = [v13 attachmentModel];
        [v14 regenerateTextContentInNote];

        [v13 updateChangeCountWithReason:v6];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  id v15 = objc_msgSend(v5, "ic_map:", &__block_literal_global_98);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v15, 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if ([v21 regenerateTitle:1 snippet:1])
        {
          [v21 markShareDirtyIfNeededWithReason:v6];
          [v21 updateChangeCountWithReason:v6];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

uint64_t __71__ICInlineAttachment_regenerateDerivedDataForInlineAttachments_reason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 parentAttachment];
}

uint64_t __71__ICInlineAttachment_regenerateDerivedDataForInlineAttachments_reason___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 note];
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 1;
}

- (id)parentEncryptableObject
{
  uint64_t v3 = [(ICInlineAttachment *)self note];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ICInlineAttachment *)self account];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isCalculateResultAttachment
{
  uint64_t v2 = [(ICInlineAttachment *)self typeUTI];
  char v3 = [v2 isEqualToString:@"com.apple.notes.inlinetextattachment.calculateresult"];

  return v3;
}

- (BOOL)isCalculateGraphExpressionAttachment
{
  uint64_t v2 = [(ICInlineAttachment *)self typeUTI];
  char v3 = [v2 isEqualToString:@"com.apple.notes.inlinetextattachment.calculategraphexpression"];

  return v3;
}

- (BOOL)isLinkAttachment
{
  uint64_t v2 = [(ICInlineAttachment *)self typeUTI];
  char v3 = [v2 isEqualToString:@"com.apple.notes.inlinetextattachment.link"];

  return v3;
}

- (BOOL)isMentionAttachment
{
  uint64_t v2 = [(ICInlineAttachment *)self typeUTI];
  char v3 = [v2 isEqualToString:@"com.apple.notes.inlinetextattachment.mention"];

  return v3;
}

- (BOOL)isHashtagAttachment
{
  uint64_t v2 = [(ICInlineAttachment *)self typeUTI];
  char v3 = [v2 isEqualToString:@"com.apple.notes.inlinetextattachment.hashtag"];

  return v3;
}

+ (id)predicateForTypeUTI:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"typeUTI == %@", a3];
}

+ (id)predicateForTokenContentIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"tokenContentIdentifier == %@", a3];
}

+ (id)predicateForMentionsInContext:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 predicateForTypeUTI:@"com.apple.notes.inlinetextattachment.mention"];
  id v6 = [a1 predicateForVisibleAttachmentsInContext:v4];

  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

- (NSString)tokenContentIdentifier
{
  char v3 = NSStringFromSelector(sel_tokenContentIdentifier);
  id v4 = [(ICCloudSyncingObject *)self valueForEncryptableKey:v3];

  return (NSString *)v4;
}

- (void)setTokenContentIdentifier:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_tokenContentIdentifier);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ICCloudSyncingObject *)self setValue:v4 forEncryptableKey:v5];
}

- (NSString)altText
{
  char v3 = NSStringFromSelector(sel_altText);
  id v4 = [(ICCloudSyncingObject *)self valueForEncryptableKey:v3];

  return (NSString *)v4;
}

- (void)setAltText:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_altText);
  [(ICCloudSyncingObject *)self setValue:v4 forEncryptableKey:v5];

  [(ICInlineAttachment *)self markDisplayTextNeedsUpdate];
}

- (id)nonNilAltText
{
  uint64_t v2 = [(ICInlineAttachment *)self altText];
  char v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_1F1F2FFF8;
  }
  id v4 = v2;

  return v4;
}

- (id)fallbackDisplayText
{
  if ([(ICInlineAttachment *)self isHashtagAttachment])
  {
    char v3 = NSString;
    uint64_t v4 = objc_msgSend(NSString, "ic_hashtagCharacterString");
LABEL_5:
    id v5 = (void *)v4;
    id v6 = objc_msgSend(NSString, "ic_ellipsisCharacterString");
    id v7 = [v3 stringWithFormat:@"%@%@", v5, v6];

LABEL_14:
    goto LABEL_15;
  }
  if ([(ICInlineAttachment *)self isMentionAttachment])
  {
    char v3 = NSString;
    uint64_t v4 = objc_msgSend(NSString, "ic_mentionCharacterString");
    goto LABEL_5;
  }
  if ([(ICInlineAttachment *)self isCalculateResultAttachment])
  {
    BOOL v8 = [(ICInlineAttachment *)self isRightToLeftCalculateAttachment];
    uint64_t v9 = objc_msgSend(NSString, "ic_calculateEqualsSignString");
LABEL_10:
    id v5 = v9;
    if (v8) {
      objc_msgSend(v9, "ic_rightToLeftString");
    }
    else {
    id v7 = objc_msgSend(v9, "ic_leftToRightString");
    }
    goto LABEL_14;
  }
  if ([(ICInlineAttachment *)self isCalculateGraphExpressionAttachment])
  {
    BOOL v8 = [(ICInlineAttachment *)self isRightToLeftCalculateAttachment];
    uint64_t v9 = objc_msgSend(NSString, "ic_calculateGraphExpressionString");
    goto LABEL_10;
  }
  id v7 = objc_msgSend(NSString, "ic_ellipsisCharacterString");
LABEL_15:
  return v7;
}

- (NSString)displayText
{
  if ([(NSString *)self->_displayText length])
  {
    char v3 = self->_displayText;
    goto LABEL_22;
  }
  uint64_t v4 = [(ICInlineAttachment *)self altText];
  if ([v4 length]) {
    [(ICInlineAttachment *)self altText];
  }
  else {
  char v3 = [(ICInlineAttachment *)self fallbackDisplayText];
  }

  if ([(ICInlineAttachment *)self isHashtagAttachment])
  {
    id v5 = [(ICInlineAttachment *)self tokenContentIdentifier];
    id v6 = [(ICInlineAttachment *)self note];
    id v7 = [v6 account];
    BOOL v8 = +[ICHashtag hashtagWithStandardizedContent:v5 account:v7];

    uint64_t v9 = [v8 displayText];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      uint64_t v11 = [v8 displayText];
      uint64_t v12 = objc_msgSend(v11, "ic_withHashtagPrefix");

      char v3 = (NSString *)v12;
    }
  }
  else if ([(ICInlineAttachment *)self isLinkAttachment])
  {
    id v13 = [(ICInlineAttachment *)self tokenContentIdentifier];
    BOOL v8 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier(v13);

    if (v8)
    {
      id v14 = +[ICAppURLUtilities noteIdentifierFromNotesAppURL:v8];
      id v15 = [(ICInlineAttachment *)self managedObjectContext];
      id v16 = +[ICNote noteWithIdentifier:v14 context:v15];

      uint64_t v17 = [v16 titleForLinking];
      if ([v17 length])
      {
        uint64_t v18 = v17;

        char v3 = v18;
      }
    }
  }
  else
  {
    if (![(ICInlineAttachment *)self isCalculateResultAttachment]
      && ![(ICInlineAttachment *)self isCalculateGraphExpressionAttachment])
    {
      goto LABEL_21;
    }
    if ([(ICInlineAttachment *)self isValidCalculateAttachment]) {
      [(ICInlineAttachment *)self altText];
    }
    else {
      [(ICInlineAttachment *)self fallbackDisplayText];
    }
    BOOL v8 = v3;
    char v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  uint64_t v19 = (NSString *)[(NSString *)v3 copy];
  displayText = self->_displayText;
  self->_displayText = v19;

LABEL_22:
  return v3;
}

- (void)markDisplayTextNeedsUpdate
{
  displayText = self->_displayText;
  self->_displayText = (NSString *)&stru_1F1F2FFF8;
}

- (signed)attachmentType
{
  char v3 = [(ICInlineAttachment *)self typeUTI];
  char v4 = [v3 isEqualToString:@"com.apple.notes.inlinetextattachment.hashtag"];

  if (v4) {
    return 1;
  }
  id v6 = [(ICInlineAttachment *)self typeUTI];
  char v7 = [v6 isEqualToString:@"com.apple.notes.inlinetextattachment.mention"];

  if (v7) {
    return 2;
  }
  BOOL v8 = [(ICInlineAttachment *)self typeUTI];
  char v9 = [v8 isEqualToString:@"com.apple.notes.inlinetextattachment.link"];

  if (v9) {
    return 3;
  }
  uint64_t v10 = [(ICInlineAttachment *)self typeUTI];
  char v11 = [v10 isEqualToString:@"com.apple.notes.inlinetextattachment.calculateresult"];

  if (v11) {
    return 4;
  }
  uint64_t v12 = [(ICInlineAttachment *)self typeUTI];
  int v13 = [v12 isEqualToString:@"com.apple.notes.inlinetextattachment.calculategraphexpression"];

  if (v13) {
    return 5;
  }
  else {
    return 0;
  }
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  if (![(ICCloudSyncingObject *)self isUnsupported]
    && ![(ICCloudSyncingObject *)self needsInitialFetchFromCloudCheckingParent])
  {
    id v5 = [(ICInlineAttachment *)self typeUTI];

    if (v5)
    {
      if (([(ICInlineAttachment *)self isPasswordProtected] & 1) == 0)
      {
        BOOL v8 = [(ICInlineAttachment *)self typeUTI];
        char v9 = [v8 isEqualToString:@"com.apple.notes.inlinetextattachment.calculateresult"];

        if ((v9 & 1) != 0
          || ([(ICInlineAttachment *)self typeUTI],
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              char v11 = [v10 isEqualToString:@"com.apple.notes.inlinetextattachment.calculategraphexpression"], v10, (v11 & 1) != 0))
        {
          int64_t v6 = 15;
LABEL_12:
          v18.receiver = self;
          v18.super_class = (Class)ICInlineAttachment;
          int64_t result = [(ICCloudSyncingObject *)&v18 intrinsicNotesVersionForScenario:a3];
          if (v6 > result) {
            return v6;
          }
          return result;
        }
        uint64_t v12 = [(ICInlineAttachment *)self typeUTI];
        char v13 = [v12 isEqualToString:@"com.apple.notes.inlinetextattachment.link"];

        if ((v13 & 1) == 0)
        {
          id v14 = [(ICInlineAttachment *)self typeUTI];
          char v15 = [v14 isEqualToString:@"com.apple.notes.inlinetextattachment.hashtag"];

          if (v15)
          {
            int64_t v6 = 7;
          }
          else
          {
            id v16 = [(ICInlineAttachment *)self typeUTI];
            int v17 = [v16 isEqualToString:@"com.apple.notes.inlinetextattachment.mention"];

            if (v17) {
              int64_t v6 = 7;
            }
            else {
              int64_t v6 = 6;
            }
          }
          goto LABEL_12;
        }
      }
      int64_t v6 = 13;
      goto LABEL_12;
    }
  }
  return [(ICInlineAttachment *)self minimumSupportedNotesVersion];
}

- (void)awakeFromFetch
{
  v7.receiver = self;
  v7.super_class = (Class)ICInlineAttachment;
  [(ICCloudSyncingObject *)&v7 awakeFromFetch];
  if (![(ICInlineAttachment *)self didAddAttachmentDataChangedObservers])
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v4 = [(ICInlineAttachment *)self objectID];
    [v3 addObserver:self selector:sel_markDisplayTextNeedsUpdate name:@"ICInlineAttachmentDataChangedNotification" object:v4];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_markDisplayTextNeedsUpdate name:@"ICAccountDidAddHashtagNotification" object:0];

    int64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_markDisplayTextNeedsUpdate name:@"ICAccountDidPurgeHashtagNotification" object:0];

    [(ICInlineAttachment *)self setDidAddAttachmentDataChangedObservers:1];
  }
}

- (void)awakeFromInsert
{
  v7.receiver = self;
  v7.super_class = (Class)ICInlineAttachment;
  [(ICCloudSyncingObject *)&v7 awakeFromInsert];
  if (![(ICInlineAttachment *)self didAddAttachmentDataChangedObservers])
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v4 = [(ICInlineAttachment *)self objectID];
    [v3 addObserver:self selector:sel_markDisplayTextNeedsUpdate name:@"ICInlineAttachmentDataChangedNotification" object:v4];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_markDisplayTextNeedsUpdate name:@"ICAccountDidAddHashtagNotification" object:0];

    int64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_markDisplayTextNeedsUpdate name:@"ICAccountDidPurgeHashtagNotification" object:0];

    [(ICInlineAttachment *)self setDidAddAttachmentDataChangedObservers:1];
  }
}

- (void)willTurnIntoFault
{
  [(ICInlineAttachment *)self markDisplayTextNeedsUpdate];
  v3.receiver = self;
  v3.super_class = (Class)ICInlineAttachment;
  [(ICInlineAttachment *)&v3 willTurnIntoFault];
}

- (_NSRange)animatableRange
{
  if ([(ICInlineAttachment *)self isMentionAttachment])
  {
    objc_super v3 = [(ICInlineAttachment *)self displayText];
    uint64_t v4 = objc_msgSend(v3, "ic_range");
    uint64_t v6 = v5;
  }
  else
  {
    if (![(ICInlineAttachment *)self isCalculateResultAttachment])
    {
      uint64_t v6 = 0;
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    objc_super v7 = [(ICInlineAttachment *)self displayText];
    BOOL v8 = objc_msgSend(NSString, "ic_calculateEqualsSignString");
    uint64_t v9 = [v7 rangeOfString:v8];
    uint64_t v11 = v10;

    uint64_t v4 = v9 + v11;
    objc_super v3 = [(ICInlineAttachment *)self displayText];
    uint64_t v6 = [v3 length] - (v9 + v11);
  }

LABEL_7:
  NSUInteger v12 = v4;
  NSUInteger v13 = v6;
  result.length = v13;
  result.location = v12;
  return result;
}

- (NSAttributedString)searchableTextContentInNote
{
  uint64_t v2 = [(ICInlineAttachment *)self altText];
  uint64_t v3 = objc_msgSend(v2, "ic_stringByRemovingLanguageDirectionCharacters");
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = &stru_1F1F2FFF8;
  }
  uint64_t v6 = v5;

  objc_super v7 = objc_msgSend(NSString, "ic_thinSpaceCharacterString");
  BOOL v8 = [(__CFString *)v6 stringByReplacingOccurrencesOfString:v7 withString:&stru_1F1F2FFF8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
  return (NSAttributedString *)v9;
}

- (_NSRange)displayTextRangeForSearchRange:(_NSRange)a3 inSearchableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  BOOL v8 = [(ICInlineAttachment *)self note];
  uint64_t v9 = [v8 rangeForAttachment:self];
  uint64_t v11 = v10;

  NSUInteger v12 = [(ICInlineAttachment *)self parentAttachment];

  NSUInteger v13 = 0;
  NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v12 && v11)
  {
    v23[0] = 0;
    v23[1] = 0;
    id v15 = (id)[v7 attribute:@"ICAttachmentSearchable" atIndex:location effectiveRange:v23];
    id v16 = [(ICInlineAttachment *)self note];
    uint64_t v17 = [v16 textOffsetAtSearchIndex:v23[0] inSearchableString:v7];

    objc_super v18 = [(ICInlineAttachment *)self nonNilAltText];
    v26.NSUInteger location = objc_msgSend(v18, "ic_range");
    v26.NSUInteger length = v19;
    v24.NSUInteger location = location - v9 - v17;
    v24.NSUInteger length = length;
    NSRange v20 = NSIntersectionRange(v24, v26);
    NSUInteger v14 = v20.location;
    NSUInteger v13 = v20.length;
  }
  NSUInteger v21 = v14;
  NSUInteger v22 = v13;
  result.NSUInteger length = v22;
  result.NSUInteger location = v21;
  return result;
}

- (void)updateMarkedForDeletionStateInlineAttachmentIsInUse:(BOOL)a3
{
  uint64_t v5 = [(ICInlineAttachment *)self typeUTI];

  if (v5)
  {
    if (a3) {
      int v6 = 0;
    }
    else {
      int v6 = [(ICInlineAttachment *)self needsInitialFetchFromCloud] ^ 1;
    }
    if (![(ICInlineAttachment *)self markedForDeletion] || (v6 & 1) != 0)
    {
      if (([(ICInlineAttachment *)self markedForDeletion] & 1) == 0 && ((v6 ^ 1) & 1) == 0)
      {
        [(ICInlineAttachment *)self markForDeletion];
      }
    }
    else
    {
      [(ICInlineAttachment *)self unmarkForDeletion];
    }
  }
}

- (void)markForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)ICInlineAttachment;
  [(ICCloudSyncingObject *)&v4 markForDeletion];
  [(ICInlineAttachment *)self propagateDeletionToHashtagForMarkForDeletion:1];
  uint64_t v3 = [(ICInlineAttachment *)self note];
  [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
}

- (void)unmarkForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)ICInlineAttachment;
  [(ICCloudSyncingObject *)&v4 unmarkForDeletion];
  [(ICInlineAttachment *)self propagateDeletionToHashtagForMarkForDeletion:0];
  uint64_t v3 = [(ICInlineAttachment *)self note];
  [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
}

- (id)ic_loggingValues
{
  v15.receiver = self;
  v15.super_class = (Class)ICInlineAttachment;
  uint64_t v3 = [(ICCloudSyncingObject *)&v15 ic_loggingValues];
  objc_super v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(ICInlineAttachment *)self managedObjectContext];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __38__ICInlineAttachment_ic_loggingValues__block_invoke;
  NSUInteger v12 = &unk_1E64A4218;
  id v13 = v4;
  NSUInteger v14 = self;
  id v6 = v4;
  [v5 performBlockAndWait:&v9];

  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __38__ICInlineAttachment_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) tokenContentIdentifier];
  uint64_t v3 = objc_msgSend(v2, "ic_sha256");
  objc_super v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"tokenContentIdentifierHash"];

  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = [*(id *)(a1 + 40) displayText];
  BOOL v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"displayTextLength"];

  uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v10 = [*(id *)(a1 + 40) altText];
  uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"altTextLength"];

  uint64_t v12 = [*(id *)(a1 + 40) creationDate];
  id v13 = (void *)v12;
  if (v12) {
    NSUInteger v14 = (__CFString *)v12;
  }
  else {
    NSUInteger v14 = @"nil";
  }
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"creationDate"];

  if ([*(id *)(a1 + 40) isUnsupported]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isUnsupported"];
  }
  if ([*(id *)(a1 + 40) isHashtagAttachment]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isHashtagAttachment"];
  }
  if ([*(id *)(a1 + 40) isMentionAttachment])
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isMentionAttachment"];
    objc_super v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "mentionNotificationState"));
    [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:@"mentionNotificationState"];

    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "mentionNotificationAttemptCount"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:@"mentionNotificationAttemptCount"];
  }
}

+ (unint64_t)countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 account:(id)a4
{
  return [a1 countOfVisibleInlineAttachmentsForHashtagStandardizedContent:a3 includingTrash:0 account:a4];
}

+ (unint64_t)countOfVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 account:(id)a4
{
  return [a1 countOfVisibleInlineAttachmentsForHashtagStandardizedContent:a3 includingTrash:1 account:a4];
}

+ (unint64_t)countOfVisibleInlineAttachmentsForHashtagStandardizedContent:(id)a3 includingTrash:(BOOL)a4 account:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a1 predicateForTokenContentIdentifier:a3];
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note.account == %@", v8];
  uint64_t v11 = [a1 predicateForVisibleObjects];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v10, v9, v11, 0);
  if (!a4)
  {
    id v13 = [v8 managedObjectContext];
    NSUInteger v14 = +[ICBaseAttachment predicateForVisibleAttachmentsInContext:v13];

    [v12 addObject:v14];
  }
  objc_super v15 = (void *)MEMORY[0x1E4F28BA0];
  id v16 = (void *)[v12 copy];
  uint64_t v17 = [v15 andPredicateWithSubpredicates:v16];

  objc_super v18 = [a1 fetchRequest];
  [v18 setPredicate:v17];
  [v18 setIncludesSubentities:0];
  NSUInteger v19 = [v8 managedObjectContext];
  id v23 = 0;
  unint64_t v20 = [v19 countForFetchRequest:v18 error:&v23];
  id v21 = v23;

  if (v21)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICInlineAttachment countOfVisibleInlineAttachmentsForHashtagStandardizedContent:includingTrash:account:]", 1, 0, @"Failed to fetch count of inline attachments for hashtag standardized content: %@", v21 functionName simulateCrash showAlert format];
    unint64_t v20 = 0;
  }

  return v20;
}

+ (BOOL)isHashtagStandardizedContent:(id)a3 usedInAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:v7 account:v6];
  uint64_t v9 = +[ICFolder visibleSmartFoldersForHashtagStandardizedContent:v7 account:v6];

  uint64_t v10 = [v9 count];
  return (v8 | v10) != 0;
}

- (void)propagateDeletionToHashtagForMarkForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICInlineAttachment *)self isHashtagAttachment])
  {
    uint64_t v5 = [(ICInlineAttachment *)self note];
    id v6 = [v5 account];

    id v7 = objc_opt_class();
    uint64_t v8 = [(ICInlineAttachment *)self tokenContentIdentifier];
    int v9 = [v7 isHashtagStandardizedContent:v8 usedInAccount:v6];

    if (v3)
    {
      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [(ICInlineAttachment *)self tokenContentIdentifier];
        uint64_t v11 = [(ICInlineAttachment *)self note];
        uint64_t v12 = [v11 account];
        id v13 = +[ICHashtag hashtagWithStandardizedContent:v10 account:v12];

        if (([v13 markedForDeletion] & 1) == 0)
        {
          NSUInteger v14 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[ICInlineAttachment propagateDeletionToHashtagForMarkForDeletion:](v13);
          }

          [v13 markForDeletion];
        }
LABEL_13:
      }
    }
    else if (v9)
    {
      objc_super v15 = [(ICInlineAttachment *)self tokenContentIdentifier];
      id v13 = +[ICHashtag hashtagWithStandardizedContent:v15 onlyVisible:0 account:v6];

      if ([v13 markedForDeletion])
      {
        id v16 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[ICInlineAttachment propagateDeletionToHashtagForMarkForDeletion:](v13);
        }

        [v13 unmarkForDeletion];
      }
      goto LABEL_13;
    }
  }
}

+ (id)recentlyUsedDatesForHashtagsStandardizedContents:(id)a3 context:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ICInlineAttachment recentlyUsedDatesForHashtagsStandardizedContents:context:](v8);
  }

  int v9 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"creationDate"];
  v53[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  uint64_t v12 = [v9 expressionForFunction:@"max:" arguments:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v13 setName:@"maxCreationDate"];
  id v41 = (void *)v12;
  [v13 setExpression:v12];
  [v13 setExpressionResultType:900];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"tokenContentIdentifier IN %@", v6];
  uint64_t v15 = [a1 predicateForVisibleObjects];
  id v16 = (void *)MEMORY[0x1E4F28BA0];
  v39 = (void *)v15;
  id v40 = (void *)v14;
  v52[0] = v14;
  v52[1] = v15;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];

  NSUInteger v19 = [a1 fetchRequest];
  uint64_t v38 = (void *)v18;
  [v19 setPredicate:v18];
  [v19 setPropertiesToGroupBy:&unk_1F1F62C58];
  v51[0] = @"tokenContentIdentifier";
  v51[1] = v13;
  unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  [v19 setPropertiesToFetch:v20];

  [v19 setResultType:2];
  id v49 = 0;
  id v21 = [v7 executeFetchRequest:v19 error:&v49];
  id v22 = v49;
  long long v42 = v7;
  long long v43 = v6;
  v37 = v22;
  if (v22)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICInlineAttachment recentlyUsedDatesForHashtagsStandardizedContents:context:]", 1, 0, @"Failed to fetch last used dates for hashtags: %@", v22 functionName simulateCrash showAlert format];
  }
  else
  {
    id v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_DEFAULT, "Fetched last used dates for hashtags", buf, 2u);
    }
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v31 = [v30 objectForKeyedSubscript:@"tokenContentIdentifier"];
        uint64_t v32 = [v30 objectForKeyedSubscript:@"maxCreationDate"];
        v33 = (void *)v32;
        if (v31) {
          BOOL v34 = v32 == 0;
        }
        else {
          BOOL v34 = 1;
        }
        if (!v34) {
          [v24 setObject:v32 forKeyedSubscript:v31];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v27);
  }

  v35 = (void *)[v24 copy];
  return v35;
}

+ (void)regenerateTokenContentIdentifierForHashtagAttachmentsInContext:(id)a3 currentTokenContentIdentifier:(id)a4 save:(BOOL)a5
{
  BOOL v5 = a5;
  v40[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [a1 predicateForTokenContentIdentifier:a4];
  uint64_t v10 = [a1 predicateForTypeUTI:@"com.apple.notes.inlinetextattachment.hashtag"];
  uint64_t v11 = [a1 predicateForVisibleObjects];
  uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
  v40[0] = v9;
  v40[1] = v10;
  v40[2] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  uint64_t v14 = [v12 andPredicateWithSubpredicates:v13];

  uint64_t v15 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v14, v8);
  if ([v15 count])
  {
    BOOL v34 = v14;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v28 = v15;
      long long v29 = v11;
      BOOL v30 = v5;
      id v31 = v10;
      uint64_t v32 = v9;
      v33 = v8;
      int v19 = 0;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v16);
          }
          id v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v23 = [v22 altText];

          if (v23)
          {
            id v24 = [v22 altText];
            id v25 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:v24];

            uint64_t v26 = [v22 tokenContentIdentifier];
            char v27 = [v26 isEqualToString:v25];

            if ((v27 & 1) == 0)
            {
              [v22 setTokenContentIdentifier:v25];
              [v22 updateChangeCountWithReason:@"Changed token content identifier"];
              int v19 = 1;
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v18);

      int v9 = v32;
      id v8 = v33;
      uint64_t v10 = v31;
      uint64_t v15 = v28;
      uint64_t v11 = v29;
      uint64_t v14 = v34;
      if ((v30 & v19) == 1) {
        objc_msgSend(v33, "ic_save");
      }
    }
    else
    {
    }
  }
}

- (NSString)calculateState
{
  if (![(ICInlineAttachment *)self isCalculateResultAttachment]
    && ![(ICInlineAttachment *)self isCalculateGraphExpressionAttachment])
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isCalculateResultAttachment || self.isCalculateGraphExpressionAttachment" functionName:"-[ICInlineAttachment calculateState]" simulateCrash:1 showAlert:0 format:@"Getting Calculate state for inline attachment of wrong type"];
  }
  return [(ICInlineAttachment *)self tokenContentIdentifier];
}

- (void)setCalculateState:(id)a3
{
  id v4 = a3;
  if (![(ICInlineAttachment *)self isCalculateResultAttachment]
    && ![(ICInlineAttachment *)self isCalculateGraphExpressionAttachment])
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isCalculateResultAttachment || self.isCalculateGraphExpressionAttachment" functionName:"-[ICInlineAttachment setCalculateState:]" simulateCrash:1 showAlert:0 format:@"Setting Calculate state for inline attachment of wrong type"];
  }
  [(ICInlineAttachment *)self setTokenContentIdentifier:v4];
}

- (BOOL)isValidCalculateAttachment
{
  BOOL v3 = [(ICInlineAttachment *)self tokenContentIdentifier];
  if ([v3 isEqual:@"ICInlineAttachmentCalculateStateValidLTR"])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(ICInlineAttachment *)self tokenContentIdentifier];
    char v4 = [v5 isEqual:@"ICInlineAttachmentCalculateStateValidRTL"];
  }
  return v4;
}

- (BOOL)isRightToLeftCalculateAttachment
{
  BOOL v3 = [(ICInlineAttachment *)self tokenContentIdentifier];
  if ([v3 isEqual:@"ICInlineAttachmentCalculateStateValidRTL"])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(ICInlineAttachment *)self tokenContentIdentifier];
    char v4 = [v5 isEqual:@"ICInlineAttachmentCalculateStateInvalidRTL"];
  }
  return v4;
}

- (BOOL)updateCalculateResult:(id)a3 isRightToLeft:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(ICInlineAttachment *)self isCalculateResultAttachment]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isCalculateResultAttachment" functionName:"-[ICInlineAttachment updateCalculateResult:isRightToLeft:]" simulateCrash:1 showAlert:0 format:@"Updating Calculate result for inline attachment of wrong type"];
  }
  id v7 = [v6 formattedResult];
  id v8 = NSString;
  int v9 = objc_msgSend(NSString, "ic_calculateEqualsSignString");
  if (v7)
  {
    uint64_t v10 = [v6 formattedResult];
    uint64_t v11 = [v8 stringWithFormat:@"%@%@", v9, v10];

    int v9 = (void *)v11;
  }

  BOOL v12 = [(ICInlineAttachment *)self updateCalculateText:v9 isValid:v6 != 0 isRightToLeft:v4];
  return v12;
}

- (BOOL)updateCalculateGraphExpressionText:(id)a3
{
  id v4 = a3;
  if (![(ICInlineAttachment *)self isCalculateGraphExpressionAttachment]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isCalculateGraphExpressionAttachment" functionName:"-[ICInlineAttachment updateCalculateGraphExpressionText:]" simulateCrash:1 showAlert:0 format:@"Updating Calculate text for inline attachment of wrong type"];
  }
  BOOL v5 = [(ICInlineAttachment *)self altText];
  id v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    int v9 = 0;
  }
  else {
    int v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {

    goto LABEL_17;
  }
  uint64_t v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {

    goto LABEL_19;
  }
  char v14 = [(id)v8 isEqual:v10];

  if (v14)
  {
LABEL_17:
    BOOL v13 = 0;
    goto LABEL_23;
  }
LABEL_19:
  [(ICInlineAttachment *)self setAltText:v4];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v16 = [(ICInlineAttachment *)self objectID];
    [v15 postNotificationName:@"ICInlineAttachmentDataChangedNotification" object:v16];
  }
  else
  {
    id v17 = (id)[(ICInlineAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICInlineAttachmentDataChangedNotification"];
  }
  BOOL v13 = 1;
LABEL_23:

  return v13;
}

- (BOOL)updateCalculateText:(id)a3 isValid:(BOOL)a4 isRightToLeft:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (![(ICInlineAttachment *)self isCalculateResultAttachment]
    && ![(ICInlineAttachment *)self isCalculateGraphExpressionAttachment])
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isCalculateResultAttachment || self.isCalculateGraphExpressionAttachment" functionName:"-[ICInlineAttachment updateCalculateText:isValid:isRightToLeft:]" simulateCrash:1 showAlert:0 format:@"Updating Calculate text for inline attachment of wrong type"];
  }
  if (a5)
  {
    objc_msgSend(v8, "ic_rightToLeftString");
    int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = @"ICInlineAttachmentCalculateStateValidRTL";
    uint64_t v11 = @"ICInlineAttachmentCalculateStateInvalidRTL";
  }
  else
  {
    objc_msgSend(v8, "ic_leftToRightString");
    int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = @"ICInlineAttachmentCalculateStateValidLTR";
    uint64_t v11 = @"ICInlineAttachmentCalculateStateInvalidLTR";
  }

  if (v6) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  BOOL v13 = v12;
  char v14 = [(ICInlineAttachment *)self calculateState];
  uint64_t v15 = (__CFString *)*MEMORY[0x1E4F1D260];
  if ((__CFString *)*MEMORY[0x1E4F1D260] == v13) {
    id v16 = 0;
  }
  else {
    id v16 = v13;
  }
  id v17 = v16;
  if (v15 == v14) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v14;
  }
  int v19 = v18;
  if (v15 == v13 && v19 == 0)
  {

LABEL_28:
    int v24 = 0;
    goto LABEL_30;
  }
  id v21 = v19;
  if (v15 == v13 || v19 == 0)
  {
  }
  else
  {
    char v23 = [(__CFString *)v17 isEqual:v19];

    if (v23) {
      goto LABEL_28;
    }
  }
  [(ICInlineAttachment *)self setCalculateState:v13];
  int v24 = 1;
LABEL_30:
  id v25 = [(ICInlineAttachment *)self altText];
  if (v15 == v9) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = v9;
  }
  unint64_t v27 = v26;
  if (v15 == v25) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = v25;
  }
  unint64_t v29 = v28;
  if (v27 | v29)
  {
    BOOL v30 = (void *)v29;
    if (v27 && v29)
    {
      char v31 = [(id)v27 isEqual:v29];

      if (v31)
      {
        if (v24) {
          goto LABEL_46;
        }
LABEL_43:
        BOOL v32 = 0;
        goto LABEL_50;
      }
    }
    else
    {
    }
    [(ICInlineAttachment *)self setAltText:v9];
  }
  else
  {

    if ((v24 & 1) == 0) {
      goto LABEL_43;
    }
  }
LABEL_46:
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v34 = [(ICInlineAttachment *)self objectID];
    [v33 postNotificationName:@"ICInlineAttachmentDataChangedNotification" object:v34];
  }
  else
  {
    id v35 = (id)[(ICInlineAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICInlineAttachmentDataChangedNotification"];
  }
  BOOL v32 = 1;
LABEL_50:

  return v32;
}

- (BOOL)animateInsertion
{
  return self->_animateInsertion;
}

- (void)setAnimateInsertion:(BOOL)a3
{
  self->_animateInsertion = a3;
}

- (BOOL)didAddAttachmentDataChangedObservers
{
  return self->_didAddAttachmentDataChangedObservers;
}

- (void)setDidAddAttachmentDataChangedObservers:(BOOL)a3
{
  self->_didAddAttachmentDataChangedObservers = a3;
}

- (void).cxx_destruct
{
}

+ (void)purgeAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v4 = [v7 note];
    [v4 removeInlineAttachmentsObject:v7];

    BOOL v5 = [v7 parentAttachment];
    [v5 removeInlineAttachmentsObject:v7];

    BOOL v6 = [v7 managedObjectContext];
    [v6 deleteObject:v7];
  }
}

+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3
{
  return +[ICUnsupportedObjectPredicateHelper predicateForSupportedInlineAttachmentsInContext:a3];
}

- (NSString)recordType
{
  return (NSString *)@"InlineAttachment";
}

- (id)recordZoneName
{
  return @"Notes";
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v38.receiver = self;
  v38.super_class = (Class)ICInlineAttachment;
  BOOL v13 = [(ICCloudSyncingObject *)&v38 mergeCloudKitRecord:v10 accountID:v11 approach:a5 mergeableFieldState:v12];
  if (v13)
  {
    [(ICInlineAttachment *)self writeMergeableFieldStateIfNecessary:v12];
    char v14 = [v10 recordID];
    uint64_t v15 = [v14 recordName];
    [(ICInlineAttachment *)self setIdentifier:v15];

    objc_opt_class();
    id v16 = [v10 encryptedValues];
    id v17 = [v16 objectForKeyedSubscript:@"UTIEncrypted"];
    uint64_t v18 = ICCheckedDynamicCast();
    int v19 = objc_msgSend(v18, "ic_stringValue");
    [(ICInlineAttachment *)self setTypeUTI:v19];

    uint64_t v20 = [(ICInlineAttachment *)self managedObjectContext];
    id v21 = [(id)objc_opt_class() noteFromAttachmentRecord:v10 accountID:v11 context:v20];
    if (v21)
    {
      [(ICInlineAttachment *)self setNote:v21];
      id v22 = [(ICInlineAttachment *)self note];
      [v22 addInlineAttachmentsObject:self];
    }
    char v23 = [(ICInlineAttachment *)self parentAttachmentFromRecord:v10 accountID:v11 context:v20];
    if (v23)
    {
      [(ICBaseAttachment *)self setParentAttachment:v23];
      int v24 = [(ICInlineAttachment *)self parentAttachment];
      [v24 addInlineAttachmentsObject:self];
    }
    id v25 = [v10 objectForKeyedSubscript:@"CreationDate"];
    [(ICInlineAttachment *)self setCreationDate:v25];

    if (([(ICInlineAttachment *)self isPasswordProtected] & 1) == 0)
    {
      objc_opt_class();
      uint64_t v26 = [v10 encryptedValues];
      [v26 objectForKeyedSubscript:@"AltTextEncrypted"];
      v27 = long long v36 = v21;
      uint64_t v28 = ICCheckedDynamicCast();
      objc_msgSend(v28, "ic_stringValue");
      unint64_t v29 = v37 = v20;
      [(ICInlineAttachment *)self setAltText:v29];

      objc_opt_class();
      BOOL v30 = [v10 encryptedValues];
      char v31 = [v30 objectForKeyedSubscript:@"TokenContentIdentifierEncrypted"];
      BOOL v32 = ICCheckedDynamicCast();
      v33 = objc_msgSend(v32, "ic_stringValue");
      [(ICInlineAttachment *)self setTokenContentIdentifier:v33];

      uint64_t v20 = v37;
      id v21 = v36;
    }
    id v34 = (id)[(ICInlineAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICInlineAttachmentDataChangedNotification", v36];
  }
  return v13;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)ICInlineAttachment;
  id v6 = a4;
  id v7 = [(ICCloudSyncingObject *)&v31 makeCloudKitRecordForApproach:a3 mergeableFieldState:v6];
  id v8 = [(ICInlineAttachment *)self note];
  int v9 = [v8 recordID];

  id v10 = [(ICInlineAttachment *)self parentAttachment];
  id v11 = [v10 recordID];

  [(ICInlineAttachment *)self writeMergeableFieldStateIfNecessary:v6];
  id v12 = (void *)MEMORY[0x1E4F19D98];
  if (v9)
  {
    BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v9 action:*MEMORY[0x1E4F19D98]];
    [v7 setObject:v13 forKeyedSubscript:@"Note"];
  }
  if (v11)
  {
    char v14 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v11 action:*v12];
    [v7 setObject:v14 forKeyedSubscript:@"ParentAttachment"];
  }
  uint64_t v15 = [(ICInlineAttachment *)self altText];

  if (v15)
  {
    id v16 = [(ICInlineAttachment *)self altText];
    id v17 = objc_msgSend(v16, "ic_dataValue");
    uint64_t v18 = [v7 encryptedValues];
    [v18 setObject:v17 forKeyedSubscript:@"AltTextEncrypted"];
  }
  int v19 = [(ICCloudSyncingObject *)self creationDate];

  if (v19)
  {
    uint64_t v20 = [(ICCloudSyncingObject *)self creationDate];
    [v7 setObject:v20 forKeyedSubscript:@"CreationDate"];
  }
  id v21 = [(ICInlineAttachment *)self tokenContentIdentifier];

  if (v21)
  {
    id v22 = [(ICInlineAttachment *)self tokenContentIdentifier];
    char v23 = objc_msgSend(v22, "ic_dataValue");
    int v24 = [v7 encryptedValues];
    [v24 setObject:v23 forKeyedSubscript:@"TokenContentIdentifierEncrypted"];
  }
  id v25 = [(ICInlineAttachment *)self typeUTI];

  if (v25)
  {
    uint64_t v26 = [(ICInlineAttachment *)self typeUTI];
    unint64_t v27 = objc_msgSend(v26, "ic_dataValue");
    uint64_t v28 = [v7 encryptedValues];
    [v28 setObject:v27 forKeyedSubscript:@"UTIEncrypted"];
  }
  else
  {
    unint64_t v29 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v26 = [(ICCloudSyncingObject *)self loggingDescription];
    [v29 handleFailedAssertWithCondition:"__objc_no", "-[ICInlineAttachment(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 1, @"Trying to create a record for an inline attachment that is of an unknown type: %@", v26 functionName simulateCrash showAlert format];
  }

  return v7;
}

- (void)writeMergeableFieldStateIfNecessary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(ICInlineAttachment *)self identifier];
    BOOL v5 = [v6 dataUsingEncoding:4];
    [v4 setObject:v5 forKey:@"TokenContentIdentifierEncrypted"];
  }
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6 = a5;
  id v7 = [a3 recordName];
  id v8 = +[ICBaseAttachment attachmentWithIdentifier:v7 context:v6];

  return v8;
}

+ (id)noteFromAttachmentRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"Note"];
  id v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 recordID];
    id v14 = +[ICNote existingCloudObjectForRecordID:v13 accountID:v9 context:v10];

    if (v14) {
      goto LABEL_10;
    }
    uint64_t v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      char v23 = [a1 className];
      unint64_t v27 = [v8 recordID];
      int v24 = [v27 recordName];
      id v25 = [v12 recordID];
      uint64_t v26 = [v25 recordName];
      *(_DWORD *)buf = 138413058;
      unint64_t v29 = v23;
      __int16 v30 = 2112;
      objc_super v31 = v24;
      __int16 v32 = 2112;
      id v33 = v26;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a note (%@) that we don't know about yet in account ID %@", buf, 0x2Au);
    }
    id v16 = +[ICAccount cloudKitAccountWithIdentifier:v9 context:v10];
    id v14 = +[ICNote newNoteWithoutIdentifierInAccount:v16];
    id v17 = [v12 recordID];
    uint64_t v18 = [v17 recordName];
    [v14 setIdentifier:v18];

    [v14 setNeedsInitialFetchFromCloud:1];
  }
  else
  {
    id v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [a1 className];
      id v21 = [v8 recordID];
      id v22 = [v21 recordName];
      *(_DWORD *)buf = 138412802;
      unint64_t v29 = v20;
      __int16 v30 = 2112;
      objc_super v31 = v22;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Found an %@ (%@) in the cloud with no note in account ID %@", buf, 0x20u);
    }
    id v14 = 0;
  }

LABEL_10:
  return v14;
}

- (id)parentAttachmentFromRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"ParentAttachment"];
  id v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 recordID];
    id v14 = +[ICAttachment existingCloudObjectForRecordID:v13 accountID:v9 context:v10];

    if (!v14)
    {
      uint64_t v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = [(ICInlineAttachment *)self className];
        int v24 = [v8 recordID];
        id v21 = [v24 recordName];
        char v23 = [v12 recordID];
        id v22 = [v23 recordName];
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        __int16 v29 = 2112;
        __int16 v30 = v22;
        _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a parent attachment (%@) that we don't know about yet", buf, 0x20u);
      }
      id v16 = [v12 recordID];
      id v17 = [v16 recordName];
      uint64_t v18 = [(ICInlineAttachment *)self note];
      id v14 = +[ICBaseAttachment newAttachmentWithIdentifier:v17 note:v18];

      [v14 setNeedsInitialFetchFromCloud:1];
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 noteFromAttachmentRecord:v9 accountID:v8 context:a5];
  id v11 = [v9 recordID];
  id v12 = [v11 recordName];
  BOOL v13 = [v10 addInlineAttachmentWithIdentifier:v12];

  id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v13 setCreationDate:v14];

  [v13 mergeCloudKitRecord:v9 accountID:v8 approach:0];
  [v13 setServerRecord:v9];

  [v13 setInCloud:1];
  [v13 clearChangeCountWithReason:@"Created inline attachment"];
  [v13 updateParentReferenceIfNecessary];
  id v15 = (id)objc_msgSend(v13, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICAttachmentDidLoadNotification");

  return v13;
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)ICInlineAttachment;
  [(ICCloudSyncingObject *)&v7 objectWasFetchedFromCloudWithRecord:a3 accountID:a4 force:a5];
  id v6 = (id)[(ICInlineAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentDidLoadNotification"];
}

- (BOOL)isInICloudAccount
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ICInlineAttachment *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ICInlineAttachment_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A44A8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __49__ICInlineAttachment_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInCloud])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) note];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInICloudAccount];
  }
}

- (BOOL)hasAllMandatoryFields
{
  v16.receiver = self;
  v16.super_class = (Class)ICInlineAttachment;
  unsigned int v3 = [(ICCloudSyncingObject *)&v16 hasAllMandatoryFields];
  id v4 = [(ICInlineAttachment *)self note];
  int v5 = v3 & [v4 hasAllMandatoryFields];

  uint64_t v6 = [(ICInlineAttachment *)self typeUTI];
  if (![v6 length]) {
    int v5 = 0;
  }

  objc_super v7 = [(ICInlineAttachment *)self parentAttachment];

  if (v7)
  {
    uint64_t v8 = [(ICInlineAttachment *)self parentAttachment];
    v5 &= [v8 hasAllMandatoryFields];
  }
  if ([(ICInlineAttachment *)self isPasswordProtected])
  {
    char v9 = [(ICInlineAttachment *)self encryptedValuesJSON];
    BOOL v10 = [v9 length] == 0;
  }
  else
  {
    id v11 = [(ICInlineAttachment *)self tokenContentIdentifier];
    uint64_t v12 = [v11 length];

    char v9 = [(ICInlineAttachment *)self altText];
    uint64_t v13 = [v9 length];
    if (v12) {
      BOOL v10 = v13 == 0;
    }
    else {
      BOOL v10 = 1;
    }
  }
  char v14 = !v10;

  return v5 & v14;
}

- (void)deleteFromLocalDatabase
{
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

+ (void)canonicalHashtagAttachmentsInContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [a1 debugDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Failed fetching canonical hashtag attachment identifiers: %@", (uint8_t *)&v4, 0xCu);
}

- (void)propagateDeletionToHashtagForMarkForDeletion:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Marking hashtag for deletion because there are no more references to it: %@", v4, v5, v6, v7, 2u);
}

- (void)propagateDeletionToHashtagForMarkForDeletion:(void *)a1 .cold.2(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Unmarking hashtag for deletion because there is a new reference to it: %@", v4, v5, v6, v7, 2u);
}

+ (void)recentlyUsedDatesForHashtagsStandardizedContents:(os_log_t)log context:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Fetching last used dates for hashtags", v1, 2u);
}

@end