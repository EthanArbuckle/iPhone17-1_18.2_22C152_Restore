@interface ICAttachmentGalleryModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)attachmentHasMergeableData;
- (BOOL)canSaveURL;
- (BOOL)canSaveURLWithOtherAttachments;
- (BOOL)hasPreviews;
- (BOOL)hasThumbnailImage;
- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4;
- (BOOL)providesStandaloneTitleForNote;
- (BOOL)shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:(id)a3;
- (ICCROrderedSet)attachmentIdentifiersOrderedSet;
- (ICTTOrderedSetVersionedDocument)attachmentIdentifiersOrderedSetDocument;
- (NSArray)subAttachmentIdentifiers;
- (id)firstSubAttachment;
- (id)previewImageTypeUTI;
- (id)searchableStringArray;
- (id)searchableTextContent;
- (id)singleSubAttachmentAtIndex:(unint64_t)a3;
- (id)standaloneTitleForNote;
- (id)subAttachmentIdentifierAtIndex:(unint64_t)a3;
- (id)titleForSubAttachment:(id)a3;
- (int64_t)previewImageOrientation;
- (signed)sectionForSubAttachments;
- (unint64_t)indexOfSubAttachmentWithIdentifier:(id)a3;
- (unint64_t)subAttachmentCount;
- (void)addSubAttachment:(id)a3;
- (void)attachmentDidRefresh:(BOOL)a3;
- (void)attachmentWillRefresh:(BOOL)a3;
- (void)attachmentWillTurnIntoFault;
- (void)enumerateSubAttachmentsWithBlock:(id)a3;
- (void)insertSubAttachment:(id)a3 atIndex:(unint64_t)a4;
- (void)removeSubAttachment:(id)a3;
- (void)setAttachmentIdentifiersOrderedSetDocument:(id)a3;
- (void)undeleteSubAttachments;
- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3;
- (void)updateAttachmentMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3;
- (void)writeMergeableData;
@end

@implementation ICAttachmentGalleryModel

- (void)attachmentWillTurnIntoFault
{
  if (![(ICAttachmentModel *)self isMergeableDataDirty])
  {
    attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
    self->_attachmentIdentifiersOrderedSetDocument = 0;
  }
}

- (void)attachmentWillRefresh:(BOOL)a3
{
  if (![(ICAttachmentModel *)self isMergeableDataDirty])
  {
    attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
    self->_attachmentIdentifiersOrderedSetDocument = 0;
  }
}

- (void)attachmentDidRefresh:(BOOL)a3
{
  if (self->_attachmentIdentifiersOrderedSetDocument
    && [(ICAttachmentModel *)self isMergeableDataDirty])
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentGalleryModel attachmentDidRefresh:](self);
    }
  }
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)canSaveURL
{
  return 1;
}

- (BOOL)canSaveURLWithOtherAttachments
{
  return 0;
}

- (id)previewImageTypeUTI
{
  return (id)[(id)*MEMORY[0x1E4F44410] identifier];
}

- (BOOL)hasThumbnailImage
{
  v3 = [(ICAttachmentGalleryModel *)self firstSubAttachment];
  v4 = [(ICAttachmentModel *)self attachment];
  if ([v4 markedForDeletion])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [v3 media];
    v7 = [v6 mediaURL];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (id)firstSubAttachment
{
  v3 = [(ICAttachmentGalleryModel *)self subAttachmentCount];
  if (v3)
  {
    v3 = [(ICAttachmentGalleryModel *)self singleSubAttachmentAtIndex:0];
  }
  return v3;
}

- (BOOL)attachmentHasMergeableData
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__ICAttachmentGalleryModel_attachmentHasMergeableData__block_invoke;
  v6[3] = &unk_1E64A4528;
  v6[4] = self;
  v6[5] = &v7;
  [v4 performBlockAndWait:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __54__ICAttachmentGalleryModel_attachmentHasMergeableData__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) attachment];
  v2 = [v3 mergeableData];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (id)titleForSubAttachment:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 parentAttachment];
  v6 = [(ICAttachmentModel *)self attachment];

  if (v5 == v6
    && ([(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v4 identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v7 indexOfObject:v8],
        v8,
        v7,
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@ %ld" value:@"%@ %ld" table:0 allowSiri:1];
    v12 = NSString;
    v13 = [(ICAttachmentModel *)self attachment];
    v14 = [v13 title];
    char v10 = objc_msgSend(v12, "localizedStringWithFormat:", v11, v14, v9 + 1);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  BOOL v5 = [(ICAttachmentModel *)self attachment];
  v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__ICAttachmentGalleryModel_shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier___block_invoke;
  v10[3] = &unk_1E64A44A8;
  v10[4] = self;
  v10[5] = &v11;
  [v6 performBlockAndWait:v10];

  uint64_t v7 = (void *)v12[5];
  if (v7) {
    char v8 = [v7 isEqualToString:v4];
  }
  else {
    char v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __90__ICAttachmentGalleryModel_shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) attachment];
  if (([v6 markedForDeletion] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) subAttachmentCount];

    if (!v2) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) firstSubAttachment];
    uint64_t v3 = [v6 identifier];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (void)addSubAttachment:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  uint64_t v5 = [v4 count];

  [(ICAttachmentGalleryModel *)self insertSubAttachment:v6 atIndex:v5];
}

- (void)insertSubAttachment:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ICAttachmentModel *)self attachment];
  [v7 addSubAttachmentsObject:v6];

  char v8 = [(ICAttachmentModel *)self attachment];
  [v6 setParentAttachment:v8];

  [v6 updateChangeCountWithReason:@"Inserted subattachment"];
  uint64_t v9 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  char v10 = [v6 identifier];

  [v9 insertObject:v10 atIndex:a4];
  [(ICAttachmentModel *)self setMergeableDataDirty:1];
}

- (void)removeSubAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  [v5 removeSubAttachmentsObject:v4];

  id v6 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  uint64_t v7 = [v4 identifier];

  [v6 removeObject:v7];
  [(ICAttachmentModel *)self setMergeableDataDirty:1];
}

- (void)enumerateSubAttachmentsWithBlock:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *, unint64_t, unsigned char *))a3;
  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  id v6 = [v5 subAttachments];

  id v7 = objc_alloc(MEMORY[0x1E4F28E10]);
  v31 = self;
  char v8 = [(ICAttachmentModel *)self attachment];
  uint64_t v9 = [v8 subAttachments];
  char v10 = objc_msgSend(v7, "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, objc_msgSend(v9, "count"));

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v17 = [v16 identifier];
        [v10 setObject:v16 forKey:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v13);
  }

  v18 = [(ICAttachmentGalleryModel *)v31 subAttachmentIdentifiers];
  unsigned __int8 v32 = 0;
  if ([v18 count])
  {
    unint64_t v20 = 0;
    *(void *)&long long v19 = 138412546;
    long long v30 = v19;
    do
    {
      v21 = objc_msgSend(v18, "objectAtIndex:", v20, v30);
      if (!v21) {
        goto LABEL_21;
      }
      v22 = [v10 objectForKey:v21];
      if (v22)
      {
        v23 = v22;
        v24 = [v22 parentAttachment];
        v25 = [(ICAttachmentModel *)v31 attachment];

        if (v24 == v25) {
          goto LABEL_20;
        }
        v26 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[ICAttachmentGalleryModel enumerateSubAttachmentsWithBlock:](v37, v23, &v38, v26);
        }
      }
      else
      {
        v26 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v28 = [(ICAttachmentModel *)v31 attachment];
          v29 = [v28 identifier];
          *(_DWORD *)buf = v30;
          v40 = v21;
          __int16 v41 = 2112;
          v42 = v29;
          _os_log_error_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_ERROR, "Attachment not found: %@, when enumerating: %@", buf, 0x16u);
        }
        v23 = v26;
      }

      v23 = 0;
LABEL_20:
      v4[2](v4, v23, v21, v20, &v32);
      int v27 = v32;

      if (v27)
      {

        break;
      }
LABEL_21:

      ++v20;
    }
    while (v20 < [v18 count]);
  }
}

- (unint64_t)indexOfSubAttachmentWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAttachmentGalleryModel *)self subAttachmentIdentifiers];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (unint64_t)subAttachmentCount
{
  if (![(ICAttachmentGalleryModel *)self attachmentHasMergeableData]) {
    return 0;
  }
  uint64_t v3 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  unint64_t v4 = [v3 count];

  return v4;
}

- (NSArray)subAttachmentIdentifiers
{
  if ([(ICAttachmentGalleryModel *)self attachmentHasMergeableData])
  {
    uint64_t v3 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
    unint64_t v4 = [v3 allObjects];
  }
  else
  {
    unint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v4;
}

- (id)subAttachmentIdentifierAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)singleSubAttachmentAtIndex:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[ICAttachmentGalleryModel subAttachmentIdentifierAtIndex:](self, "subAttachmentIdentifierAtIndex:");
  if (!v5)
  {
    long long v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(ICAttachmentGalleryModel *)self singleSubAttachmentAtIndex:v19];
    }
LABEL_21:

    id v15 = 0;
    goto LABEL_22;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v6 = [(ICAttachmentModel *)self attachment];
  id v7 = [v6 subAttachments];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (!v8)
  {
LABEL_10:
    id v15 = v7;
LABEL_16:

LABEL_17:
    long long v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v20 = [(ICAttachmentModel *)self attachment];
      v21 = [v20 identifier];
      *(_DWORD *)buf = 138412802;
      v28 = v5;
      __int16 v29 = 2112;
      long long v30 = v21;
      __int16 v31 = 2048;
      unint64_t v32 = a3;
      _os_log_debug_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_DEBUG, "Sub attachment %@ not found in %@ at index %ld", buf, 0x20u);
    }
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v24;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v24 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
    uint64_t v13 = [v12 identifier];
    char v14 = [v13 isEqualToString:v5];

    if (v14) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v15 = v12;

  if (!v15) {
    goto LABEL_17;
  }
  id v16 = [v15 parentAttachment];
  v17 = [(ICAttachmentModel *)self attachment];

  if (v16 != v17)
  {
    v18 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentGalleryModel singleSubAttachmentAtIndex:](v15);
    }

    goto LABEL_16;
  }
LABEL_22:

  return v15;
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  unint64_t v4 = NSString;
  uint64_t v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_SCANNED_DOCUMENTS_%lu" value:@"NOTE_LIST_SCANNED_DOCUMENTS_%lu" table:0 allowSiri:1];
  unint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (ICTTOrderedSetVersionedDocument)attachmentIdentifiersOrderedSetDocument
{
  attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
  if (!attachmentIdentifiersOrderedSetDocument)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    unint64_t v20 = __Block_byref_object_copy__3;
    v21 = __Block_byref_object_dispose__3;
    id v22 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy__3;
    id v15 = __Block_byref_object_dispose__3;
    id v16 = 0;
    unint64_t v4 = [(ICAttachmentModel *)self attachment];
    uint64_t v5 = [v4 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__ICAttachmentGalleryModel_attachmentIdentifiersOrderedSetDocument__block_invoke;
    v10[3] = &unk_1E64A4818;
    v10[4] = self;
    v10[5] = &v17;
    void v10[6] = &v11;
    [v5 performBlockAndWait:v10];

    unint64_t v6 = [ICTTOrderedSetVersionedDocument alloc];
    id v7 = [(ICTTVersionedDocument *)v6 initWithData:v18[5] replicaID:v12[5]];
    uint64_t v8 = self->_attachmentIdentifiersOrderedSetDocument;
    self->_attachmentIdentifiersOrderedSetDocument = v7;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v17, 8);

    attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
  }
  return attachmentIdentifiersOrderedSetDocument;
}

void __67__ICAttachmentGalleryModel_attachmentIdentifiersOrderedSetDocument__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 mergeableData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) currentReplicaID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (ICCROrderedSet)attachmentIdentifiersOrderedSet
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSetDocument];
  uint64_t v4 = [v3 orderedSet];
  uint64_t v5 = ICCheckedDynamicCast();

  return (ICCROrderedSet *)v5;
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentGalleryModel mergeWithMergeableData:mergeableFieldState:](v6);
  }

  uint64_t v7 = [ICTTOrderedSetVersionedDocument alloc];
  uint64_t v8 = [(ICAttachmentModel *)self currentReplicaID];
  uint64_t v9 = [(ICTTVersionedDocument *)v7 initWithData:v5 replicaID:v8];

  uint64_t v10 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSetDocument];
  uint64_t v11 = [v10 mergeWithOrderedSetVersionedDocument:v9];

  BOOL v12 = v11 == 2;
  if (v11 == 2)
  {
    uint64_t v13 = [(ICAttachmentModel *)self attachment];
    char v14 = [v13 previewUpdateDate];
    id v15 = [(ICAttachmentModel *)self attachment];
    id v16 = [v15 modificationDate];
    uint64_t v17 = [v14 compare:v16];

    if (v17 != -1)
    {
      v18 = [(ICAttachmentModel *)self attachment];
      [v18 setPreviewUpdateDate:0];
    }
    uint64_t v19 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentGalleryModel mergeWithMergeableData:mergeableFieldState:](v19);
    }

    [(ICAttachmentModel *)self setMergeableDataDirty:1];
  }

  return v12;
}

- (void)writeMergeableData
{
  if ([(ICAttachmentModel *)self isMergeableDataDirty]) {
    [(ICAttachmentModel *)self setMergeableDataDirty:0];
  }
  id v5 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSetDocument];
  uint64_t v3 = [v5 serialize];
  uint64_t v4 = [(ICAttachmentModel *)self attachment];
  [v4 setMergeableData:v3];
}

- (signed)sectionForSubAttachments
{
  return 7;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  uint64_t v6 = [v5 allObjects];

  uint64_t v7 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
  [v7 removeAllObjects];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 138412290;
    long long v18 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        char v14 = objc_msgSend(v4, "objectForKeyedSubscript:", v13, v18);
        id v15 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v25 = v13;
          __int16 v26 = 2112;
          int v27 = v14;
          _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Update sub attachment after load: %@ => %@", buf, 0x16u);
        }

        if (v14)
        {
          id v16 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
          [v16 addObject:v14];
        }
        else
        {
          id v16 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            uint64_t v25 = v13;
            _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Unable to map from %@ to new identifier", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }

  if ([obj count])
  {
    [(ICAttachmentModel *)self setMergeableDataDirty:1];
    uint64_t v17 = [(ICAttachmentModel *)self attachment];
    [v17 saveMergeableDataIfNeeded];
  }
}

- (void)updateAttachmentMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)ICAttachmentGalleryModel;
  [(ICAttachmentModel *)&v34 updateAttachmentMarkedForDeletionStateAttachmentIsInUse:a3];
  id v4 = [(ICAttachmentModel *)self attachment];
  if (([v4 needsInitialFetchFromCloud] & 1) == 0)
  {
    id v5 = [(ICAttachmentModel *)self attachment];
    char v6 = [v5 hasChanges];

    if (v6) {
      return;
    }
    uint64_t v7 = [(ICAttachmentModel *)self attachment];
    char v8 = [v7 markedForDeletion];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v29 = self;
    long long v9 = [(ICAttachmentModel *)self attachment];
    id v4 = [v9 subAttachments];

    uint64_t v10 = [v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v31;
      *(void *)&long long v11 = 138412546;
      long long v28 = v11;
      char v14 = self;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v4);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
          if ((v8 & 1) != 0
            || ([(ICAttachmentGalleryModel *)v14 attachmentIdentifiersOrderedSet],
                uint64_t v17 = objc_claimAutoreleasedReturnValue(),
                [v16 identifier],
                long long v18 = objc_claimAutoreleasedReturnValue(),
                char v19 = [v17 containsObject:v18],
                v18,
                v17,
                (v19 & 1) == 0))
          {
            if ((objc_msgSend(v16, "markedForDeletion", v28) & 1) == 0)
            {
              long long v21 = os_log_create("com.apple.notes", "CoreData");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                long long v22 = [v16 identifier];
                long long v23 = [(ICAttachmentModel *)v14 attachment];
                long long v24 = [v23 identifier];
                *(_DWORD *)buf = v28;
                long long v36 = v22;
                __int16 v37 = 2112;
                uint64_t v38 = v24;
                _os_log_debug_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_DEBUG, "Gallery model deleting subattachment %@ %@", buf, 0x16u);

                char v14 = v29;
              }

              +[ICAttachment deleteAttachment:v16];
            }
          }
          else if ([v16 markedForDeletion])
          {
            long long v20 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v25 = [v16 identifier];
              __int16 v26 = [(ICAttachmentModel *)v29 attachment];
              int v27 = [v26 identifier];
              *(_DWORD *)buf = v28;
              long long v36 = v25;
              __int16 v37 = 2112;
              uint64_t v38 = v27;
              _os_log_debug_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_DEBUG, "Gallery model un-deleting subattachment %@ %@", buf, 0x16u);

              char v14 = v29;
            }

            +[ICAttachment undeleteAttachment:v16];
          }
          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = [v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v12);
    }
  }
}

- (void)undeleteSubAttachments
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  id v4 = [v3 subAttachments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = [(ICAttachmentGalleryModel *)self attachmentIdentifiersOrderedSet];
        long long v11 = [v9 identifier];
        int v12 = [v10 containsObject:v11];

        if (v12) {
          +[ICAttachment undeleteAttachment:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)providesStandaloneTitleForNote
{
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  id v4 = [v3 title];

  if (v4)
  {
    uint64_t v5 = [(ICAttachmentModel *)self attachment];
    uint64_t v6 = [v5 defaultTitle];
    int v7 = [v4 isEqualToString:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)standaloneTitleForNote
{
  uint64_t v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 title];

  return v3;
}

- (id)searchableTextContent
{
  uint64_t v2 = [(ICAttachmentGalleryModel *)self searchableStringArray];
  uint64_t v3 = [v2 componentsJoinedByString:@" "];

  return v3;
}

- (id)searchableStringArray
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ICAttachmentGalleryModel_searchableStringArray__block_invoke;
  v6[3] = &unk_1E64A4840;
  id v4 = v3;
  id v7 = v4;
  [(ICAttachmentGalleryModel *)self enumerateSubAttachmentsWithBlock:v6];

  return v4;
}

void __49__ICAttachmentGalleryModel_searchableStringArray__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 summary];
  objc_msgSend(v2, "ic_addNonNilObject:", v3);
}

- (int64_t)previewImageOrientation
{
  v7.receiver = self;
  v7.super_class = (Class)ICAttachmentGalleryModel;
  id v3 = [(ICAttachmentModel *)&v7 previewImageOrientation];
  if ([(ICAttachmentGalleryModel *)self subAttachmentCount])
  {
    id v4 = [(ICAttachmentGalleryModel *)self firstSubAttachment];
    uint64_t v5 = [v4 attachmentModel];
    id v3 = (id)[v5 previewImageOrientation];
  }
  return (int64_t)v3;
}

- (void)setAttachmentIdentifiersOrderedSetDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)attachmentDidRefresh:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 attachment];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v3, v4, "Had a dirty attachment gallery document after refresh: %@", v5, v6, v7, v8, 2u);
}

- (void)enumerateSubAttachmentsWithBlock:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 shortLoggingDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Parent attachment not synced yet for: %@", a1, 0xCu);
}

- (void)singleSubAttachmentAtIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 attachment];
  uint64_t v6 = [v5 identifier];
  int v7 = 134218242;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Unable to find identifier at index: %ld, for attachment: %@", (uint8_t *)&v7, 0x16u);
}

- (void)singleSubAttachmentAtIndex:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Parent attachment not synced yet for: %@", v4, v5, v6, v7, 2u);
}

- (void)mergeWithMergeableData:(os_log_t)log mergeableFieldState:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Gallery updated", v1, 2u);
}

- (void)mergeWithMergeableData:(os_log_t)log mergeableFieldState:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Gallery mergeWithMergeableData", v1, 2u);
}

@end