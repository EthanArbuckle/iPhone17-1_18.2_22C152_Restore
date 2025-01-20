@interface ICSharedRecentlyDeletedSharedNoteUtilities
+ (id)messageForSharedNotesType:(unint64_t)a3;
+ (id)notesSharedViaICloudFromNotes:(id)a3;
+ (id)titleForSharedNotesType:(unint64_t)a3;
+ (unint64_t)sharedNoteTypeForNotes:(id)a3;
+ (void)showAlertsIfNecessaryForDeletingSharedNotes:(id)a3 noteDeleteType:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6;
@end

@implementation ICSharedRecentlyDeletedSharedNoteUtilities

+ (void)showAlertsIfNecessaryForDeletingSharedNotes:(id)a3 noteDeleteType:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  if (a4 || (uint64_t v12 = [a1 sharedNoteTypeForNotes:v13], v12 == 1))
  {
    if (v11) {
      v11[2](v11, 1);
    }
  }
  else
  {
    [a1 showDeletingSharedNotesAlertWithType:v12 displayWindow:v10 completionHandler:v11];
  }
}

+ (id)titleForSharedNotesType:(unint64_t)a3
{
  return 0;
}

+ (id)messageForSharedNotesType:(unint64_t)a3
{
  return 0;
}

+ (unint64_t)sharedNoteTypeForNotes:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 notesSharedViaICloudFromNotes:v4];
  if (![v5 count])
  {
    unint64_t v11 = 1;
    goto LABEL_35;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v34 + 1) + 8 * i) isSharedRootObject])
      {

        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = v6;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              if (objc_msgSend(v19, "isOwnedByCurrentUser", (void)v30))
              {
                v20 = v12;
                id v21 = v19;
              }
              else
              {
                v20 = v13;
                id v21 = v4;
              }
              [v20 addObject:v21];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v16);
        }

        if ([v4 count] == 1)
        {
          BOOL v22 = [v12 count] == 1;
          uint64_t v23 = 7;
          uint64_t v24 = 4;
        }
        else
        {
          uint64_t v25 = [v4 count];
          uint64_t v26 = [v14 count];
          uint64_t v27 = [v12 count];
          if (v25 == v26)
          {
            if (v27 == [v14 count])
            {
              unint64_t v11 = 5;
LABEL_34:

              goto LABEL_35;
            }
            uint64_t v28 = [v13 count];
            BOOL v22 = v28 == [v14 count];
            uint64_t v23 = 5;
            uint64_t v24 = 8;
          }
          else
          {
            BOOL v22 = v27 == 0;
            uint64_t v23 = 6;
            uint64_t v24 = 9;
          }
        }
        if (v22) {
          unint64_t v11 = v24;
        }
        else {
          unint64_t v11 = v23;
        }
        goto LABEL_34;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_10:

  if ([v6 count] == 1) {
    unint64_t v11 = 2;
  }
  else {
    unint64_t v11 = 3;
  }
LABEL_35:

  return v11;
}

+ (id)notesSharedViaICloudFromNotes:(id)a3
{
  return (id)objc_msgSend(a3, "ic_objectsPassingTest:", &__block_literal_global_31);
}

uint64_t __76__ICSharedRecentlyDeletedSharedNoteUtilities_notesSharedViaICloudFromNotes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  v3 = ICDynamicCast();

  if (v3) {
    uint64_t v4 = [v3 isSharedViaICloud];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

@end