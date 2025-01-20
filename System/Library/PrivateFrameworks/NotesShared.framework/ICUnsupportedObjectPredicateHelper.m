@interface ICUnsupportedObjectPredicateHelper
+ (id)predicateForSupportedAttachmentsInContext:(id)a3;
+ (id)predicateForSupportedFoldersInContext:(id)a3;
+ (id)predicateForSupportedInlineAttachmentsInContext:(id)a3;
+ (id)predicateForSupportedNotesInContext:(id)a3;
+ (id)unsupportedAttachmentIdentifiersWithContext:(id)a3;
+ (id)unsupportedFolderIdentifiersWithContext:(id)a3;
+ (id)unsupportedInlineAttachmentIdentifiersWithContext:(id)a3;
+ (void)recursivelyAddAttachment:(id)a3 toMutableSet:(id)a4;
+ (void)recursivelyAddFolder:(id)a3 toMutableSet:(id)a4;
@end

@implementation ICUnsupportedObjectPredicateHelper

+ (id)predicateForSupportedFoldersInContext:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a1 unsupportedFolderIdentifiersWithContext:a3];
  v5 = [v3 predicateWithFormat:@"NOT (identifier IN %@)", v4];

  return v5;
}

+ (id)predicateForSupportedNotesInContext:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  v6 = objc_msgSend(v4, "predicateWithFormat:", @"minimumSupportedNotesVersion <= %d", +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v7 = (void *)MEMORY[0x1E4F28F60];
  v8 = [a1 unsupportedFolderIdentifiersWithContext:v5];

  v9 = [v7 predicateWithFormat:@"NOT (folder.identifier IN %@)", v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v6;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)predicateForSupportedAttachmentsInContext:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  v6 = [a1 unsupportedAttachmentIdentifiersWithContext:v5];
  v7 = [v4 predicateWithFormat:@"NOT (identifier IN %@)", v6];

  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"note.minimumSupportedNotesVersion <= %d", +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [a1 unsupportedFolderIdentifiersWithContext:v5];

  v11 = [v9 predicateWithFormat:@"NOT (note.folder.identifier IN %@)", v10];

  v12 = (void *)MEMORY[0x1E4F28BA0];
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v14 = [v12 andPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateForSupportedInlineAttachmentsInContext:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  v6 = [a1 unsupportedInlineAttachmentIdentifiersWithContext:v5];
  v7 = [v4 predicateWithFormat:@"NOT (identifier IN %@)", v6];

  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"note.minimumSupportedNotesVersion <= %d", +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [a1 unsupportedFolderIdentifiersWithContext:v5];

  v11 = [v9 predicateWithFormat:@"NOT (note.folder.identifier IN %@)", v10];

  v12 = (void *)MEMORY[0x1E4F28BA0];
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v14 = [v12 andPredicateWithSubpredicates:v13];

  return v14;
}

+ (void)recursivelyAddFolder:(id)a3 toMutableSet:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 markedForDeletion] & 1) == 0 && (objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) == 0)
  {
    [v7 addObject:v6];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = objc_msgSend(v6, "children", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [a1 recursivelyAddFolder:*(void *)(*((void *)&v13 + 1) + 8 * v12++) toMutableSet:v7];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

+ (id)unsupportedFolderIdentifiersWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__48;
  long long v16 = __Block_byref_object_dispose__48;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__ICUnsupportedObjectPredicateHelper_unsupportedFolderIdentifiersWithContext___block_invoke;
  v8[3] = &unk_1E64A6000;
  id v5 = v4;
  uint64_t v10 = &v12;
  id v11 = a1;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __78__ICUnsupportedObjectPredicateHelper_unsupportedFolderIdentifiersWithContext___block_invoke(uint64_t a1)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v2 = +[ICFolder predicateForVisibleObjects];
  v30[0] = v2;
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"minimumSupportedNotesVersion > %d", +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v30[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];

  id v5 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
  id v6 = +[ICFolder ic_objectsMatchingPredicate:v5 context:*(void *)(a1 + 32)];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 48) recursivelyAddFolder:*(void *)(*((void *)&v24 + 1) + 8 * v12++) toMutableSet:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v19 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) identifier];
        [v18 addObject:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
}

+ (void)recursivelyAddAttachment:(id)a3 toMutableSet:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 markedForDeletion] & 1) == 0 && (objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) == 0)
  {
    id v8 = [v6 note];
    char v9 = [v8 needsInitialFetchFromCloud];

    if ((v9 & 1) == 0)
    {
      [v7 addObject:v6];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v10 = objc_msgSend(v6, "subAttachments", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [a1 recursivelyAddAttachment:*(void *)(*((void *)&v15 + 1) + 8 * v14++) toMutableSet:v7];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }
    }
  }
}

+ (id)unsupportedAttachmentIdentifiersWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__48;
  long long v16 = __Block_byref_object_dispose__48;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__ICUnsupportedObjectPredicateHelper_unsupportedAttachmentIdentifiersWithContext___block_invoke;
  v8[3] = &unk_1E64A6000;
  id v5 = v4;
  uint64_t v10 = &v12;
  id v11 = a1;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __82__ICUnsupportedObjectPredicateHelper_unsupportedAttachmentIdentifiersWithContext___block_invoke(uint64_t a1)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v2 = +[ICBaseAttachment predicateForVisibleObjects];
  v30[0] = v2;
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"minimumSupportedNotesVersion > %d", +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v30[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];

  id v5 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
  id v6 = +[ICAttachment ic_objectsMatchingPredicate:v5 context:*(void *)(a1 + 32)];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 48) recursivelyAddAttachment:*(void *)(*((void *)&v24 + 1) + 8 * v12++) toMutableSet:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v19 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) identifier];
        [v18 addObject:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
}

+ (id)unsupportedInlineAttachmentIdentifiersWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__48;
  uint64_t v17 = __Block_byref_object_dispose__48;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __88__ICUnsupportedObjectPredicateHelper_unsupportedInlineAttachmentIdentifiersWithContext___block_invoke;
  uint64_t v10 = &unk_1E64A44A8;
  id v4 = v3;
  id v11 = v4;
  uint64_t v12 = &v13;
  [v4 performBlockAndWait:&v7];
  id v5 = objc_msgSend((id)v14[5], "copy", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __88__ICUnsupportedObjectPredicateHelper_unsupportedInlineAttachmentIdentifiersWithContext___block_invoke(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = +[ICBaseAttachment predicateForVisibleObjects];
  v19[0] = v2;
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"minimumSupportedNotesVersion > %d", +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v19[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  id v5 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
  id v6 = +[ICInlineAttachment ic_objectsMatchingPredicate:v5 context:*(void *)(a1 + 32)];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) identifier];
        [v12 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

@end