@interface ICDocCamScannedDocumentEditor
- (BOOL)moveObjectWithIdentifier:(id)a3 toIndex:(unint64_t)a4;
- (BOOL)setOrientation:(int64_t)a3 forAttachment:(id)a4;
- (BOOL)updateTitle:(id)a3 forSubAttachment:(id)a4;
- (ICAttachment)galleryAttachment;
- (ICAttachmentGalleryModel)galleryModel;
- (ICDocCamScannedDocumentEditor)initWithGalleryAttachment:(id)a3;
- (NSUndoManager)undoManager;
- (id)subAttachmentWithIdentifier:(id)a3;
- (unint64_t)indexForAttachmentWithIdentifier:(id)a3;
- (void)applyFilter:(signed __int16)a3 forAttachmentAtIndex:(unint64_t)a4;
- (void)applyFilter:(signed __int16)a3 forAttachmentWithIdentifier:(id)a4;
- (void)deletePagesAtIndexes:(id)a3;
- (void)movePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)saveAndUpdatePreview:(BOOL)a3;
- (void)setGalleryAttachment:(id)a3;
- (void)setMarkupData:(id)a3 forAttachmentWithIdentifier:(id)a4;
- (void)setOrientation:(int64_t)a3 forAttachmentAtIndex:(unint64_t)a4;
- (void)setQuad:(id)a3 forAttachment:(id)a4;
- (void)setQuad:(id)a3 forAttachmentWithIdentifier:(id)a4;
- (void)setUndoManager:(id)a3;
- (void)undeleteSubAttachment:(id)a3;
- (void)undoablyDeleteSubAttachments:(id)a3 actionName:(id)a4;
- (void)undoablyMoveAttachmentWithIdentifier:(id)a3 toIndex:(unint64_t)a4;
- (void)undoablySetOrientation:(int64_t)a3 forAttachmentIdentifier:(id)a4;
- (void)undoablySetQuad:(id)a3 forAttachment:(id)a4;
- (void)undoablyUndeleteSubAttachments:(id)a3 actionName:(id)a4;
- (void)undoablyUpdateTitle:(id)a3 forAttachmentWithIdentifier:(id)a4 isUserDefined:(BOOL)a5;
- (void)updateDocumentTitle:(id)a3 isUserDefined:(BOOL)a4;
@end

@implementation ICDocCamScannedDocumentEditor

- (ICDocCamScannedDocumentEditor)initWithGalleryAttachment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamScannedDocumentEditor;
  v5 = [(ICDocCamScannedDocumentEditor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(ICDocCamScannedDocumentEditor *)v5 setGalleryAttachment:v4];
    id v7 = objc_alloc_init(MEMORY[0x263F08C50]);
    [(ICDocCamScannedDocumentEditor *)v6 setUndoManager:v7];
  }
  return v6;
}

- (ICAttachmentGalleryModel)galleryModel
{
  objc_opt_class();
  v3 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v4 = [v3 attachmentModel];
  v5 = ICCheckedDynamicCast();

  return (ICAttachmentGalleryModel *)v5;
}

- (void)undeleteSubAttachment:(id)a3
{
  id v3 = a3;
  if ([v3 markedForDeletion])
  {
    [MEMORY[0x263F5AB78] undeleteAttachment:v3];
    objc_msgSend(v3, "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x263F5A978]);
  }
}

- (void)saveAndUpdatePreview:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v11 = v5;
  if (v3)
  {
    [v5 setPreviewUpdateDate:0];

    v6 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v6 setCachedImage:0];

    id v7 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v7 invalidateAttachmentPreviewImages];

    v8 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    objc_super v9 = [v8 managedObjectContext];
    objc_msgSend(v9, "ic_save");

    id v11 = [MEMORY[0x263F5B230] sharedGenerator];
    v10 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v11 generatePreviewIfNeededForAttachment:v10];
  }
  else
  {
    v10 = [v5 managedObjectContext];
    objc_msgSend(v10, "ic_save");
  }
}

- (void)updateDocumentTitle:(id)a3 isUserDefined:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v7 = [v8 identifier];
  [(ICDocCamScannedDocumentEditor *)self undoablyUpdateTitle:v6 forAttachmentWithIdentifier:v7 isUserDefined:v4];
}

- (BOOL)updateTitle:(id)a3 forSubAttachment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  unint64_t v9 = [(ICDocCamScannedDocumentEditor *)self indexForAttachmentWithIdentifier:v8];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [v7 identifier];
    [(ICDocCamScannedDocumentEditor *)self undoablyUpdateTitle:v6 forAttachmentWithIdentifier:v10 isUserDefined:0];
  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)undoablyUpdateTitle:(id)a3 forAttachmentWithIdentifier:(id)a4 isUserDefined:(BOOL)a5
{
  BOOL v5 = a5;
  id v32 = a3;
  id v8 = (void *)MEMORY[0x263F5AB78];
  id v9 = a4;
  v10 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v11 = [v10 managedObjectContext];
  v12 = [v8 attachmentWithIdentifier:v9 includeDeleted:0 context:v11];

  v13 = [v12 identifier];
  v14 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  v15 = [v14 identifier];
  char v16 = [v13 isEqualToString:v15];

  v17 = [v12 title];
  [v12 setTitle:v32];
  if (v5) {
    [v12 setUserTitle:v32];
  }
  v18 = [v12 note];
  int v19 = [v18 regenerateTitle:1 snippet:0];

  if (v19)
  {
    v20 = [v12 note];
    [v20 markShareDirtyIfNeededWithReason:@"Updated doc scan user title"];

    v21 = [v12 note];
    [v21 updateChangeCountWithReason:@"Updated doc scan user title"];
  }
  [v12 updateChangeCountWithReason:@"Updated doc scan user title"];
  [v12 attachmentDidChange];
  if (v16)
  {
    v22 = @"Change Document Name";
  }
  else
  {
    v23 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v23 updateChangeCountWithReason:@"Updated doc scan user title"];

    v24 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v24 attachmentDidChange];

    v22 = @"Change Image Name";
  }
  v25 = [v12 managedObjectContext];
  objc_msgSend(v25, "ic_save");

  v26 = [(ICDocCamScannedDocumentEditor *)self undoManager];
  v27 = [v26 prepareWithInvocationTarget:self];
  v28 = [v12 identifier];
  [v27 undoablyUpdateTitle:v17 forAttachmentWithIdentifier:v28 isUserDefined:v5];

  v29 = [(ICDocCamScannedDocumentEditor *)self undoManager];
  v30 = [MEMORY[0x263F086E0] mainBundle];
  v31 = [v30 localizedStringForKey:v22 value:&stru_26C10E100 table:0];
  [v29 setActionName:v31];
}

- (BOOL)moveObjectWithIdentifier:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  id v8 = [v7 attachmentIdentifiersOrderedSet];
  uint64_t v9 = [v8 indexOfObject:v6];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [(ICDocCamScannedDocumentEditor *)self movePageFromIndex:v9 toIndex:a4];
  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)movePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  id v8 = [v7 attachmentIdentifiersOrderedSet];
  id v10 = [v8 objectAtIndex:a3];

  [(ICDocCamScannedDocumentEditor *)self undoablyMoveAttachmentWithIdentifier:v10 toIndex:a4];
  uint64_t v9 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v9 regenerateTitle];
}

- (void)undoablyMoveAttachmentWithIdentifier:(id)a3 toIndex:(unint64_t)a4
{
  id v33 = a3;
  id v6 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  unint64_t v7 = [v6 subAttachmentCount] - 1;

  if (v7 >= a4) {
    unint64_t v8 = a4;
  }
  else {
    unint64_t v8 = v7;
  }
  uint64_t v9 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  id v10 = [v9 attachmentIdentifiersOrderedSet];
  uint64_t v11 = [v10 indexOfObject:v33];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 != v8)
  {
    v12 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
    v13 = [v12 attachmentIdentifiersOrderedSet];
    [v13 moveObject:v33 toIndex:v8];

    v14 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
    [v14 setMergeableDataDirty:1];

    v15 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v15 saveMergeableDataIfNeeded];

    char v16 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v16 updateChangeCountWithReason:@"Moved gallery page"];

    v17 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v17 attachmentDidChange];

    v18 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    int v19 = [v18 managedObjectContext];
    objc_msgSend(v19, "ic_saveWithLogDescription:", @"Moved gallery page");

    v20 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    v21 = [v20 attachmentModel];
    unsigned int v22 = [v21 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v33];
    if (v11) {
      unsigned int v23 = v22;
    }
    else {
      unsigned int v23 = 1;
    }
    if (v8) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 1;
    }

    [(ICDocCamScannedDocumentEditor *)self saveAndUpdatePreview:v24];
    v25 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    v26 = [v25 prepareWithInvocationTarget:self];
    [v26 undoablyMoveAttachmentWithIdentifier:v33 toIndex:v11];

    v27 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    v28 = [MEMORY[0x263F086E0] mainBundle];
    v29 = [v28 localizedStringForKey:@"Move Scan" value:&stru_26C10E100 table:0];
    [v27 setActionName:v29];

    v30 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    v31 = [v30 objectID];

    if (v31)
    {
      id v32 = [MEMORY[0x263F08A00] defaultCenter];
      [v32 postNotificationName:*MEMORY[0x263F5A978] object:v31];
    }
  }
}

- (void)undoablyUndeleteSubAttachments:(id)a3 actionName:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v35 = a4;
  v38 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  unint64_t v7 = [v6 allKeys];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __75__ICDocCamScannedDocumentEditor_undoablyUndeleteSubAttachments_actionName___block_invoke;
  v43[3] = &unk_2640B7FB8;
  id v37 = v6;
  id v44 = v37;
  unint64_t v8 = [v7 sortedArrayUsingComparator:v43];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x263F5AB78];
        char v16 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
        v17 = [v16 managedObjectContext];
        v18 = [v15 attachmentWithIdentifier:v14 includeDeleted:1 context:v17];

        if (v18)
        {
          [(ICDocCamScannedDocumentEditor *)self undeleteSubAttachment:v18];
          int v19 = [v37 objectForKeyedSubscript:v14];
          unint64_t v20 = [v19 unsignedIntegerValue];

          v21 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
          unint64_t v22 = [v21 subAttachmentCount];

          if (v20 >= v22) {
            unint64_t v23 = v22;
          }
          else {
            unint64_t v23 = v20;
          }
          uint64_t v24 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
          [v24 insertSubAttachment:v18 atIndex:v23];

          if (v11)
          {
            char v11 = 1;
          }
          else
          {
            v25 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
            char v26 = [v25 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v14];
            if (v23) {
              char v11 = v26;
            }
            else {
              char v11 = 1;
            }
          }
          [v38 addObject:v14];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  v27 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v27 saveMergeableDataIfNeeded];

  v28 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v28 updateChangeCountWithReason:@"Undeleted gallery page"];

  v29 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  v30 = [v29 managedObjectContext];
  objc_msgSend(v30, "ic_saveWithLogDescription:", @"Undeleted gallery page");

  [(ICDocCamScannedDocumentEditor *)self saveAndUpdatePreview:v11 & 1];
  if ([v38 count])
  {
    v31 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    id v32 = [v31 prepareWithInvocationTarget:self];
    [v32 undoablyDeleteSubAttachments:v38 actionName:v35];

    if (v35)
    {
      id v33 = [(ICDocCamScannedDocumentEditor *)self undoManager];
      [v33 setActionName:v35];
    }
  }
  v34 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v34 regenerateTitle];
}

uint64_t __75__ICDocCamScannedDocumentEditor_undoablyUndeleteSubAttachments_actionName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 objectForKeyedSubscript:a2];
  unint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)undoablyDeleteSubAttachments:(id)a3 actionName:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v44 = a4;
  unint64_t v7 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  v48 = [v7 attachmentIdentifiersOrderedSet];

  unint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v14 = [v48 indexOfObject:v13];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = [NSNumber numberWithUnsignedInteger:v14];
          [v8 setObject:v15 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v10);
  }

  char v16 = [v8 allKeys];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __73__ICDocCamScannedDocumentEditor_undoablyDeleteSubAttachments_actionName___block_invoke;
  v53[3] = &unk_2640B7FB8;
  id v47 = v8;
  id v54 = v47;
  v17 = [v16 sortedArrayUsingComparator:v53];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v43 = v17;
  id v45 = [v17 reverseObjectEnumerator];
  uint64_t v18 = [v45 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 0;
    uint64_t v21 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v50 != v21) {
          objc_enumerationMutation(v45);
        }
        uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        uint64_t v24 = (void *)MEMORY[0x263F5AB78];
        v25 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
        char v26 = [v25 managedObjectContext];
        v27 = [v24 attachmentWithIdentifier:v23 context:v26];

        v28 = [v47 objectForKeyedSubscript:v23];
        uint64_t v29 = [v28 unsignedIntegerValue];

        if (v27) {
          BOOL v30 = v29 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v30 = 1;
        }
        if (!v30)
        {
          if (v20)
          {
            char v20 = 1;
          }
          else
          {
            v31 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
            char v32 = [v31 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v23];
            char v20 = v29 ? v32 : 1;
          }
          id v33 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
          [v33 removeSubAttachment:v27];

          if (([v27 markedForDeletion] & 1) == 0) {
            [MEMORY[0x263F5AB78] deleteAttachment:v27];
          }
        }
      }
      uint64_t v19 = [v45 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v19);
  }
  else
  {
    char v20 = 0;
  }

  v34 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v34 saveMergeableDataIfNeeded];

  id v35 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v35 updateChangeCountWithReason:@"Deleted gallery page"];

  v36 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v36 attachmentDidChange];

  id v37 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  v38 = [v37 managedObjectContext];
  objc_msgSend(v38, "ic_saveWithLogDescription:", @"Deleted gallery page");

  [(ICDocCamScannedDocumentEditor *)self saveAndUpdatePreview:v20 & 1];
  if ([v47 count])
  {
    long long v39 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    long long v40 = [v39 prepareWithInvocationTarget:self];
    [v40 undoablyUndeleteSubAttachments:v47 actionName:v44];

    if (v44)
    {
      long long v41 = [(ICDocCamScannedDocumentEditor *)self undoManager];
      [v41 setActionName:v44];
    }
  }
  long long v42 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v42 regenerateTitle];
}

uint64_t __73__ICDocCamScannedDocumentEditor_undoablyDeleteSubAttachments_actionName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 objectForKeyedSubscript:a2];
  unint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)deletePagesAtIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  char v16 = __Block_byref_object_dispose_;
  BOOL v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "subAttachmentCount"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__ICDocCamScannedDocumentEditor_deletePagesAtIndexes___block_invoke;
  v11[3] = &unk_2640B7FE0;
  v11[4] = self;
  v11[5] = &v12;
  [v4 enumerateIndexesUsingBlock:v11];
  if ([(id)v13[5] count])
  {
    unint64_t v7 = NSString;
    unint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"DELETE_%lu_SCANNED_IMAGES" value:&stru_26C10E100 table:0];
    uint64_t v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, objc_msgSend((id)v13[5], "count"));

    [(ICDocCamScannedDocumentEditor *)self undoablyDeleteSubAttachments:v13[5] actionName:v10];
  }
  _Block_object_dispose(&v12, 8);
}

void __54__ICDocCamScannedDocumentEditor_deletePagesAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) galleryModel];
  id v6 = [v4 subAttachmentIdentifierAtIndex:a2];

  BOOL v5 = v6;
  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    BOOL v5 = v6;
  }
}

- (BOOL)setOrientation:(int64_t)a3 forAttachment:(id)a4
{
  id v6 = [a4 identifier];
  unint64_t v7 = [(ICDocCamScannedDocumentEditor *)self indexForAttachmentWithIdentifier:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(ICDocCamScannedDocumentEditor *)self setOrientation:a3 forAttachmentAtIndex:v7];
  }
  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setOrientation:(int64_t)a3 forAttachmentAtIndex:(unint64_t)a4
{
  unint64_t v7 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  id v10 = [v7 singleSubAttachmentAtIndex:a4];

  unint64_t v8 = v10;
  if (v10)
  {
    uint64_t v9 = [v10 identifier];
    [(ICDocCamScannedDocumentEditor *)self undoablySetOrientation:a3 forAttachmentIdentifier:v9];

    unint64_t v8 = v10;
  }
}

- (void)undoablySetOrientation:(int64_t)a3 forAttachmentIdentifier:(id)a4
{
  id v33 = a4;
  id v6 = (void *)MEMORY[0x263F5AB78];
  unint64_t v7 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  unint64_t v8 = [v7 managedObjectContext];
  uint64_t v9 = [v6 attachmentWithIdentifier:v33 context:v8];

  int v10 = [v9 orientation];
  uint64_t v11 = v10;
  if (v9) {
    BOOL v12 = v10 == a3;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    [v9 setOrientation:(__int16)a3];
    uint64_t v13 = [v9 attachmentModel];
    [v13 updateAttachmentSize];

    [v9 setOcrSummary:0];
    [v9 updateChangeCountWithReason:@"Changed doc scan page orientation"];
    [v9 setPreviewUpdateDate:0];
    uint64_t v14 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    v15 = [v14 attachmentModel];
    int v16 = [v15 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v33];

    if (v16)
    {
      id v17 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v17 setPreviewUpdateDate:0];

      uint64_t v18 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v18 setCachedImage:0];

      uint64_t v19 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v19 invalidateAttachmentPreviewImages];
    }
    char v20 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v20 attachmentDidChange];

    uint64_t v21 = [v9 managedObjectContext];
    objc_msgSend(v21, "ic_save");

    unint64_t v22 = [MEMORY[0x263F5B230] sharedGenerator];
    [v22 postProcessIfNeededForAttachment:v9];

    uint64_t v23 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v24 = *MEMORY[0x263F5A978];
    v25 = [v9 objectID];
    [v23 postNotificationName:v24 object:v25];

    if (v16)
    {
      char v26 = [MEMORY[0x263F5B230] sharedGenerator];
      v27 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v26 generatePreviewIfNeededForAttachment:v27];
    }
    v28 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    uint64_t v29 = [v28 prepareWithInvocationTarget:self];
    [v29 undoablySetOrientation:v11 forAttachmentIdentifier:v33];

    BOOL v30 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    v31 = [MEMORY[0x263F086E0] mainBundle];
    char v32 = [v31 localizedStringForKey:@"Rotate Scan" value:&stru_26C10E100 table:0];
    [v30 setActionName:v32];
  }
}

- (void)applyFilter:(signed __int16)a3 forAttachmentWithIdentifier:(id)a4
{
  uint64_t v4 = a3;
  id v29 = a4;
  id v6 = (void *)MEMORY[0x263F5AB78];
  unint64_t v7 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  unint64_t v8 = [v7 managedObjectContext];
  uint64_t v9 = [v6 attachmentWithIdentifier:v29 context:v8];

  uint64_t v10 = [v9 imageFilterType];
  if (v9) {
    BOOL v11 = v10 == v4;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = [MEMORY[0x263F5B230] sharedGenerator];
    [v13 cancelIfNeededForAttachment:v9];

    [v9 setImageFilterType:v4];
    [v9 setOcrSummary:0];
    [v9 updateChangeCountWithReason:@"Applied doc scan page filter"];
    [v9 setPreviewUpdateDate:0];
    uint64_t v14 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    v15 = [v14 attachmentModel];
    int v16 = [v15 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v29];

    if (v16)
    {
      id v17 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v17 setPreviewUpdateDate:0];

      uint64_t v18 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v18 setCachedImage:0];

      uint64_t v19 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
      [v19 invalidateAttachmentPreviewImages];
    }
    char v20 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v20 attachmentDidChange];

    uint64_t v21 = [v9 managedObjectContext];
    objc_msgSend(v21, "ic_save");

    unint64_t v22 = [MEMORY[0x263F5B230] sharedGenerator];
    [v22 generatePreviewIfNeededForAttachment:v9];

    uint64_t v23 = [MEMORY[0x263F5B230] sharedGenerator];
    [v23 postProcessIfNeededForAttachment:v9];

    uint64_t v24 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    v25 = [v24 prepareWithInvocationTarget:self];
    [v25 applyFilter:v12 forAttachmentWithIdentifier:v29];

    char v26 = [(ICDocCamScannedDocumentEditor *)self undoManager];
    v27 = [MEMORY[0x263F086E0] mainBundle];
    v28 = [v27 localizedStringForKey:@"Set Scan Filter" value:&stru_26C10E100 table:0];
    [v26 setActionName:v28];
  }
}

- (void)applyFilter:(signed __int16)a3 forAttachmentAtIndex:(unint64_t)a4
{
  uint64_t v5 = a3;
  unint64_t v7 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  id v10 = [v7 singleSubAttachmentAtIndex:a4];

  unint64_t v8 = [v10 identifier];

  if (v8)
  {
    uint64_t v9 = [v10 identifier];
    [(ICDocCamScannedDocumentEditor *)self applyFilter:v5 forAttachmentWithIdentifier:v9];
  }
}

- (void)setQuad:(id)a3 forAttachmentWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(ICDocCamScannedDocumentEditor *)self subAttachmentWithIdentifier:a4];
  [(ICDocCamScannedDocumentEditor *)self setQuad:v6 forAttachment:v7];
}

- (void)setQuad:(id)a3 forAttachment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 croppingQuad];
  char v8 = [v9 isEqual:v7];

  if ((v8 & 1) == 0) {
    [(ICDocCamScannedDocumentEditor *)self undoablySetQuad:v9 forAttachment:v6];
  }
}

- (void)undoablySetQuad:(id)a3 forAttachment:(id)a4
{
  id v25 = a4;
  id v6 = a3;
  id v7 = [v25 croppingQuad];
  [v25 setCroppingQuad:v6];

  [v25 setOcrSummary:0];
  char v8 = [v25 attachmentModel];
  [v8 updateAttachmentSize];

  [v25 updateChangeCountWithReason:@"Set doc scan page cropping"];
  [v25 setPreviewUpdateDate:0];
  id v9 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v10 = [v9 attachmentModel];
  BOOL v11 = [v25 identifier];
  int v12 = [v10 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v11];

  if (v12)
  {
    uint64_t v13 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v13 setPreviewUpdateDate:0];

    uint64_t v14 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v14 setCachedImage:0];

    v15 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v15 invalidateAttachmentPreviewImages];
  }
  int v16 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v16 attachmentDidChange];

  id v17 = [v25 managedObjectContext];
  objc_msgSend(v17, "ic_save");

  uint64_t v18 = [MEMORY[0x263F5B230] sharedGenerator];
  [v18 generatePreviewIfNeededForAttachment:v25];

  uint64_t v19 = [MEMORY[0x263F5B230] sharedGenerator];
  [v19 postProcessIfNeededForAttachment:v25];

  char v20 = [(ICDocCamScannedDocumentEditor *)self undoManager];
  uint64_t v21 = [v20 prepareWithInvocationTarget:self];
  [v21 undoablySetQuad:v7 forAttachment:v25];

  unint64_t v22 = [(ICDocCamScannedDocumentEditor *)self undoManager];
  uint64_t v23 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v24 = [v23 localizedStringForKey:@"Set Crop" value:&stru_26C10E100 table:0];
  [v22 setActionName:v24];
}

- (void)setMarkupData:(id)a3 forAttachmentWithIdentifier:(id)a4
{
  id v28 = a4;
  id v6 = (void *)MEMORY[0x263F5AB78];
  id v7 = a3;
  char v8 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v9 = [v8 managedObjectContext];
  id v10 = [v6 attachmentWithIdentifier:v28 context:v9];

  BOOL v11 = [v10 markupModelData];
  [v10 setMarkupModelData:v7];

  [v10 updateChangeCountWithReason:@"Applied doc scan page mark-up"];
  [v10 setPreviewUpdateDate:0];
  int v12 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  uint64_t v13 = [v12 attachmentModel];
  int v14 = [v13 shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:v28];

  if (v14)
  {
    v15 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v15 setPreviewUpdateDate:0];

    int v16 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v16 setCachedImage:0];

    id v17 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
    [v17 invalidateAttachmentPreviewImages];
  }
  uint64_t v18 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  [v18 attachmentDidChange];

  uint64_t v19 = [v10 managedObjectContext];
  objc_msgSend(v19, "ic_save");

  char v20 = [MEMORY[0x263F5B230] sharedGenerator];
  [v20 generatePreviewIfNeededForAttachment:v10];

  uint64_t v21 = [(ICDocCamScannedDocumentEditor *)self undoManager];
  unint64_t v22 = [v21 prepareWithInvocationTarget:self];
  [v22 setMarkupData:v11 forAttachmentWithIdentifier:v28];

  uint64_t v23 = [(ICDocCamScannedDocumentEditor *)self undoManager];
  uint64_t v24 = [MEMORY[0x263F086E0] mainBundle];
  id v25 = v24;
  if (v7) {
    char v26 = @"Apply Markup";
  }
  else {
    char v26 = @"Discard Markup";
  }
  v27 = [v24 localizedStringForKey:v26 value:&stru_26C10E100 table:0];
  [v23 setActionName:v27];
}

- (id)subAttachmentWithIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F5AB78];
  id v5 = a3;
  id v6 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];
  id v7 = [v6 managedObjectContext];
  char v8 = [v4 attachmentWithIdentifier:v5 context:v7];

  id v9 = [v8 parentAttachment];
  id v10 = [(ICDocCamScannedDocumentEditor *)self galleryAttachment];

  if (v9 == v10)
  {
    id v13 = v8;
  }
  else
  {
    BOOL v11 = (void *)MEMORY[0x263F5AE60];
    int v12 = [v8 identifier];
    [v11 handleFailedAssertWithCondition:"__objc_no", "-[ICDocCamScannedDocumentEditor subAttachmentWithIdentifier:]", 1, 0, @"Trying to get sub attachment with identifier, but the parent is not the gallery attachment. %@", v12 functionName simulateCrash showAlert format];

    id v13 = 0;
  }

  return v13;
}

- (unint64_t)indexForAttachmentWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [(ICDocCamScannedDocumentEditor *)self galleryModel];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__ICDocCamScannedDocumentEditor_indexForAttachmentWithIdentifier___block_invoke;
  v9[3] = &unk_2640B8008;
  id v6 = v4;
  id v10 = v6;
  BOOL v11 = &v12;
  [v5 enumerateSubAttachmentsWithBlock:v9];

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __66__ICDocCamScannedDocumentEditor_indexForAttachmentWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a3 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
    *a5 = 1;
  }
  return result;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
}

- (ICAttachment)galleryAttachment
{
  return self->_galleryAttachment;
}

- (void)setGalleryAttachment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryAttachment, 0);

  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end