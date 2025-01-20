@interface ICNoteContext
- (id)addNewNoteByCopyingNote:(id)a3 toFolder:(id)a4;
- (id)adjustedDestinationFolderForNoteContainer:(id)a3 sourceFolder:(id)a4;
- (id)undoablyAddFolderToAccount:(id)a3 moveAction:(id)a4 actionName:(id)a5;
- (id)undoablyCopyFolder:(id)a3 toAccount:(id)a4 copyingNotes:(BOOL)a5 moveAction:(id)a6 actionName:(id)a7;
- (id)undoablyCopyNote:(id)a3 toFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6;
- (id)undoablyCopyNotes:(id)a3 toFolder:(id)a4 actionName:(id)a5;
- (void)copyFolder:(id)a3 toFolder:(id)a4;
- (void)copyNotes:(id)a3 toFolder:(id)a4;
- (void)markNoteAndAttachmentsForDeletion:(id)a3;
- (void)postNotificationsForTrashingOrDeletingNoteIDs:(id)a3;
- (void)postNotificationsForUntrashingOrUndeletingNoteIDs:(id)a3;
- (void)sendNotificationAfterDeletingOrUndeletingNotes;
- (void)sendNotificationBeforeDeletingOrUndeletingNotes:(id)a3;
- (void)undoablyDeleteAttachment:(id)a3;
- (void)undoablyDeleteFolder:(id)a3 markNotesForDeletion:(BOOL)a4 actionName:(id)a5;
- (void)undoablyDeleteFolder:(id)a3 markNotesForDeletion:(BOOL)a4 moveAction:(id)a5 actionName:(id)a6;
- (void)undoablyDeleteNote:(id)a3 moveAction:(id)a4 actionName:(id)a5;
- (void)undoablyDeleteUnusedTagsForSmartFolder:(id)a3;
- (void)undoablyMarkNotes:(id)a3 asCallNotes:(BOOL)a4;
- (void)undoablyMarkNotes:(id)a3 asMathNotes:(BOOL)a4;
- (void)undoablyMarkNotes:(id)a3 asSystemPaper:(BOOL)a4;
- (void)undoablyMoveNoteIDs:(id)a3 toFolderIDs:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7;
- (void)undoablyMoveNotes:(id)a3 toNoteContainer:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7;
- (void)undoablyMoveNotes:(id)a3 toVirtualSmartFolder:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7;
- (void)undoablyMoveNotes:(id)a3 toVirtualSmartFolderType:(id)a4 completionHandler:(id)a5;
- (void)undoablyPersistDeleteEventForObject:(id)a3 fromParentObject:(id)a4 sharedRootObject:(id)a5;
- (void)undoablyProcessNoteIDs:(id)a3 progressStringBlock:(id)a4 workerContext:(id)a5 processNoteBlock:(id)a6 completionHandler:(id)a7;
- (void)undoablyTrashOrDeleteNotes:(id)a3;
- (void)undoablyUndeleteAttachment:(id)a3;
- (void)undoablyUndeleteFolder:(id)a3 didMarkNotesForDeletion:(BOOL)a4 moveAction:(id)a5 actionName:(id)a6;
- (void)undoablyUndeleteNote:(id)a3 moveAction:(id)a4 actionName:(id)a5;
- (void)undoablyUndeleteUnusedTagsForSmartFolder:(id)a3;
- (void)undoablyUnmoveNoteIDs:(id)a3 toFolderIDs:(id)a4 originalToCopyNoteIDs:(id)a5 actionName:(id)a6 noteToFolderIDsForRedo:(id)a7 workerContext:(id)a8;
- (void)unmarkNoteAndAttachmentsForDeletion:(id)a3;
@end

@implementation ICNoteContext

- (void)undoablyDeleteAttachment:(id)a3
{
  id v9 = a3;
  if (([v9 markedForDeletion] & 1) == 0)
  {
    +[ICBaseAttachment deleteAttachment:v9];
    uint64_t v4 = +[NSUndoManager shared];
    [(id)v4 registerUndoWithTarget:self selector:"undoablyUndeleteAttachment:" object:v9];

    v5 = +[NSUndoManager shared];
    LOBYTE(v4) = [v5 ic_isUndoingOrRedoing];

    if ((v4 & 1) == 0)
    {
      v6 = +[NSUndoManager shared];
      v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"Delete Attachment" value:&stru_1000F2510 table:0];
      [v6 setActionName:v8];
    }
  }
}

- (void)undoablyUndeleteAttachment:(id)a3
{
  id v5 = a3;
  +[ICBaseAttachment undeleteAttachment:v5];
  uint64_t v4 = +[NSUndoManager shared];
  [v4 registerUndoWithTarget:self selector:"undoablyDeleteAttachment:" object:v5];

  [v5 ic_postNotificationOnMainThreadWithName:ICAttachmentPreviewImagesDidUpdateNotification];
}

- (id)undoablyCopyNote:(id)a3 toFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    v14 = +[NSBundle mainBundle];
    id v13 = [v14 localizedStringForKey:@"Copy Note" value:&stru_1000F2510 table:0];
  }
  v15 = [(ICNoteContext *)self addNewNoteByCopyingNote:v10 toFolder:v11];
  v16 = v15;
  if (v15)
  {
    [v15 updateChangeCountWithReason:@"Copied note"];
    v17 = +[NSUndoManager shared];
    unsigned __int8 v18 = [v17 isUndoing];
    if (v12 && (v18 & 1) == 0)
    {
      id v19 = [v12 type];

      if (v19 == (id)4)
      {
LABEL_9:
        v20 = +[NSUndoManager shared];
        v21 = [v20 prepareWithInvocationTarget:self];
        [v21 undoablyDeleteNote:v16 moveAction:v12 actionName:v13];

        v22 = +[NSUndoManager shared];
        [v22 setActionName:v13];

        id v23 = v16;
        goto LABEL_10;
      }
      objc_opt_class();
      v17 = ICDynamicCast();
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v12 oldObject:v17 newObject:v16];
    }

    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (id)undoablyCopyNotes:(id)a3 toFolder:(id)a4 actionName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  if (!v29)
  {
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"Copy %lu Notes" value:&stru_1000F2510 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, [v7 count]);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v26 = v7;
  id v11 = [v7 copy];
  id v12 = (char *)[v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = ICCheckedProtocolCast();
        if (v16)
        {
          objc_opt_class();
          v17 = ICDynamicCast();
          unsigned __int8 v18 = v17;
          if (v8)
          {
            id v19 = v8;
          }
          else
          {
            id v19 = [v17 folder];
          }
          v20 = v19;
          if (v18) {
            v21 = [[ICCloudSyncingObjectMoveAction alloc] initWithNote:v18 toFolder:v19 isCopy:1];
          }
          else {
            v21 = 0;
          }
          v22 = [(ICNoteContext *)self undoablyCopyNote:v16 toFolder:v20 moveAction:v21 actionName:v29];
          [v28 ic_addNonNilObject:v22];
        }
      }
      id v13 = (char *)[v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  id v23 = +[NSUndoManager shared];
  [v23 setActionName:v29];

  id v24 = [v28 copy];

  return v24;
}

- (id)adjustedDestinationFolderForNoteContainer:(id)a3 sourceFolder:(id)a4
{
  id v4 = a3;
  id v5 = [v4 noteContainerAccount];
  objc_opt_class();
  v6 = ICDynamicCast();

  if ([v6 isSmartFolder] || !v6)
  {
    id v7 = [v5 defaultFolder];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (void)undoablyMoveNotes:(id)a3 toNoteContainer:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v29 = a6;
  id v28 = a7;
  long long v31 = v14;
  if (!v14)
  {
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Move %lu Notes" value:&stru_1000F2510 table:0];
    long long v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, [v12 count]);
  }
  long long v30 = +[NSManagedObject ic_permanentObjectIDsFromObjects:v12];
  v17 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v38;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v23 = [v22 folder];
        id v24 = [(ICNoteContext *)self adjustedDestinationFolderForNoteContainer:v13 sourceFolder:v23];

        v25 = [v24 objectID];
        v26 = [v22 objectID];
        [v17 setObject:v25 forKeyedSubscript:v26];
      }
      id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v19);
  }

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10001E160;
  v35[4] = sub_10001E170;
  id v36 = [v13 managedObjectContext];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001E178;
  v32[3] = &unk_1000EE800;
  id v27 = v28;
  id v33 = v27;
  v34 = v35;
  [(ICNoteContext *)self undoablyMoveNoteIDs:v30 toFolderIDs:v17 actionName:v31 workerContext:v29 completionHandler:v32];

  _Block_object_dispose(v35, 8);
}

- (void)undoablyMoveNotes:(id)a3 toVirtualSmartFolder:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v12 count])
  {
    v17 = [v13 accountObjectID];
    if (v17)
    {
      id v18 = [(ICNoteContext *)self managedObjectContext];
      id v19 = [v13 accountObjectID];
      uint64_t v20 = [v18 objectWithID:v19];
    }
    else
    {
      id v18 = [v12 firstObject];
      uint64_t v20 = [v18 account];
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001E43C;
    v27[3] = &unk_1000EE828;
    id v28 = v20;
    id v21 = v20;
    v22 = [v12 ic_objectsPassingTest:v27];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001E4A4;
    v23[3] = &unk_1000EE850;
    v23[4] = self;
    id v24 = v12;
    id v25 = v13;
    id v26 = v16;
    [(ICNoteContext *)self undoablyMoveNotes:v22 toNoteContainer:v21 actionName:v14 workerContext:v15 completionHandler:v23];
  }
  else if (v16)
  {
    (*((void (**)(id, id))v16 + 2))(v16, v12);
  }
}

- (void)undoablyMoveNotes:(id)a3 toVirtualSmartFolderType:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  if ([v8 isEqual:ICVirtualSmartFolderItemIdentifierTypeSystemPaper])
  {
    [(ICNoteContext *)self undoablyMarkNotes:v10 asSystemPaper:1];
    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    v9[2](v9, v10);
    goto LABEL_10;
  }
  if ([v8 isEqual:ICVirtualSmartFolderItemIdentifierTypeCallNotes])
  {
    [(ICNoteContext *)self undoablyMarkNotes:v10 asCallNotes:1];
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    if ([v8 isEqual:ICVirtualSmartFolderItemIdentifierTypeMathNotes])
    {
      [(ICNoteContext *)self undoablyMarkNotes:v10 asMathNotes:1];
      if (!v9) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteContext(UndoSupport) undoablyMoveNotes:toVirtualSmartFolderType:completionHandler:]", 1, 0, @"Cannot move notes into Virtual Smart Folder");
    if (v9) {
      v9[2](v9, &__NSArray0__struct);
    }
  }
LABEL_10:
}

- (void)undoablyDeleteNote:(id)a3 moveAction:(id)a4 actionName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 markedForDeletion] & 1) == 0)
  {
    id v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000B62DC(v8);
    }

    if (!v10)
    {
      id v12 = +[NSUndoManager shared];
      unsigned __int8 v13 = [v12 ic_isUndoingOrRedoing];

      if (v13)
      {
        id v10 = 0;
      }
      else
      {
        id v14 = +[NSBundle mainBundle];
        id v10 = [v14 localizedStringForKey:@"Delete Note" value:&stru_1000F2510 table:0];
      }
    }
    id v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:ICNoteWillBeDeletedNotification object:v8];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = [v8 attachments];
    id v17 = [v16 copy];

    id v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v38;
      do
      {
        id v21 = 0;
        do
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v17);
          }
          [(ICNoteContext *)self undoablyDeleteAttachment:*(void *)(*((void *)&v37 + 1) + 8 * (void)v21)];
          id v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v19);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = [v8 inlineAttachments];
    id v23 = [v22 copy];

    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        id v27 = 0;
        do
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          [(ICNoteContext *)self undoablyDeleteAttachment:*(void *)(*((void *)&v33 + 1) + 8 * (void)v27)];
          id v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v25);
    }

    [v8 markForDeletion];
    if ([v8 requiresLegacyTombstoneAfterDeletion]) {
      +[ICLegacyTombstone addLegacyTombstoneForNote:v8];
    }
    id v28 = +[NSUndoManager shared];
    unsigned __int8 v29 = [v28 isUndoing];

    if (v9 && (v29 & 1) == 0) {
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v9 oldObject:v8 newObject:0];
    }
    long long v30 = +[NSUndoManager shared];
    long long v31 = [v30 prepareWithInvocationTarget:self];
    [v31 undoablyUndeleteNote:v8 moveAction:v9 actionName:v10];

    if (v10)
    {
      long long v32 = +[NSUndoManager shared];
      [v32 setActionName:v10];
    }
  }
}

- (void)sendNotificationBeforeDeletingOrUndeletingNotes:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"ICNoteContextWillUndoablyDeleteOrUndeleteNotes" object:v3];
}

- (void)sendNotificationAfterDeletingOrUndeletingNotes
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"ICNoteContextDidUndoablyDeleteOrUndeleteNotes" object:0];
}

- (void)undoablyUndeleteNote:(id)a3 moveAction:(id)a4 actionName:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSUndoManager shared];
  unsigned __int8 v11 = [v10 ic_isUndoingOrRedoing];

  if (v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    if (v9) {
      goto LABEL_6;
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "actionName", "-[ICNoteContext(UndoSupport) undoablyUndeleteNote:moveAction:actionName:]", 1, 0, @"actionName cannot be nil");
    id v9 = +[NSBundle mainBundle];
    uint64_t v12 = [v9 localizedStringForKey:@"Delete Note" value:&stru_1000F2510 table:0];
  }

  id v9 = (id)v12;
LABEL_6:
  [v19 unmarkForDeletion];
  unsigned __int8 v13 = [v19 legacyContentHashAtImport];

  if (v13) {
    +[ICLegacyTombstone removeLegacyTombstoneForNote:v19];
  }
  id v14 = +[NSUndoManager shared];
  unsigned __int8 v15 = [v14 isUndoing];

  if (v8 && (v15 & 1) == 0) {
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v8 oldObject:0 newObject:v19];
  }
  id v16 = +[NSUndoManager shared];
  id v17 = [v16 prepareWithInvocationTarget:self];
  [v17 undoablyDeleteNote:v19 moveAction:v8 actionName:v9];

  if (v9)
  {
    id v18 = +[NSUndoManager shared];
    [v18 setActionName:v9];
  }
}

- (void)undoablyTrashOrDeleteNotes:(id)a3
{
  id v4 = a3;
  if (+[ICNote containsUndeletableNotes:v4])
  {
    id v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B6360();
    }
  }
  else
  {
    v6 = +[NSUndoManager shared];
    id v7 = [v6 prepareWithInvocationTarget:self];
    [v7 sendNotificationAfterDeletingOrUndeletingNotes];

    [(ICNoteContext *)self sendNotificationBeforeDeletingOrUndeletingNotes:v4];
    id v8 = [v4 firstObject];
    id v9 = [v8 folder];
    LODWORD(v6) = [v9 isTrashFolder];
    id v10 = +[NSBundle mainBundle];
    unsigned __int8 v11 = v10;
    if (v6) {
      CFStringRef v12 = @"Delete %lu Notes";
    }
    else {
      CFStringRef v12 = @"Trash %lu Notes";
    }
    unsigned __int8 v13 = [v10 localizedStringForKey:v12 value:&stru_1000F2510 table:0];
    id v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, [v4 count]);

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v4;
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v20 = [v19 folder];
          id v21 = [v19 sharedRootObject];
          [(ICNoteContext *)self undoablyPersistDeleteEventForObject:v19 fromParentObject:v20 sharedRootObject:v21];

          id v22 = [v19 undoablyTrashOrDeleteWithMoveAction:0 actionName:v5];
        }
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    [(ICNoteContext *)self sendNotificationAfterDeletingOrUndeletingNotes];
    id v23 = +[NSUndoManager shared];
    id v24 = [v23 prepareWithInvocationTarget:self];
    [v24 sendNotificationBeforeDeletingOrUndeletingNotes:v14];

    id v25 = +[NSUndoManager shared];
    [v25 setActionName:v5];
  }
}

- (void)undoablyMarkNotes:(id)a3 asSystemPaper:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICNoteContext *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F03C;
  v11[3] = &unk_1000EE878;
  BOOL v14 = v4;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v8 = v6;
  [v7 performBlockAndWait:v11];

  id v9 = +[NSUndoManager shared];
  id v10 = [v9 prepareWithInvocationTarget:self];
  [v10 undoablyMarkNotes:v8 asSystemPaper:!v4];
}

- (void)undoablyMarkNotes:(id)a3 asMathNotes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICNoteContext *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F23C;
  v11[3] = &unk_1000EE878;
  BOOL v14 = v4;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v8 = v6;
  [v7 performBlockAndWait:v11];

  id v9 = +[NSUndoManager shared];
  id v10 = [v9 prepareWithInvocationTarget:self];
  [v10 undoablyMarkNotes:v8 asMathNotes:!v4];
}

- (void)undoablyMarkNotes:(id)a3 asCallNotes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICNoteContext *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F43C;
  v11[3] = &unk_1000EE878;
  BOOL v14 = v4;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v8 = v6;
  [v7 performBlockAndWait:v11];

  id v9 = +[NSUndoManager shared];
  id v10 = [v9 prepareWithInvocationTarget:self];
  [v10 undoablyMarkNotes:v8 asCallNotes:!v4];
}

- (id)undoablyAddFolderToAccount:(id)a3 moveAction:(id)a4 actionName:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = v8;
    id v10 = a4;
    id v11 = a3;
  }
  else
  {
    id v12 = a4;
    id v13 = a3;
    BOOL v14 = +[NSBundle mainBundle];
    id v9 = [v14 localizedStringForKey:@"Add Folder" value:&stru_1000F2510 table:0];
  }
  id v15 = +[ICFolder newFolderInAccount:a3];

  id v16 = +[NSUndoManager shared];
  uint64_t v17 = [v16 prepareWithInvocationTarget:self];
  [v17 undoablyDeleteFolder:v15 markNotesForDeletion:1 moveAction:a4 actionName:v9];

  id v18 = +[NSUndoManager shared];
  [v18 setActionName:v9];

  return v15;
}

- (id)undoablyCopyFolder:(id)a3 toAccount:(id)a4 copyingNotes:(BOOL)a5 moveAction:(id)a6 actionName:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v15)
  {
    id v16 = +[NSBundle mainBundle];
    id v15 = [v16 localizedStringForKey:@"Copy Folder" value:&stru_1000F2510 table:0];
  }
  uint64_t v17 = [(ICNoteContext *)self undoablyAddFolderToAccount:v13 moveAction:v14 actionName:v15];
  id v18 = [v12 customNoteSortType];
  [v17 setCustomNoteSortType:v18];

  objc_opt_class();
  id v19 = ICDynamicCast();
  uint64_t v20 = [v19 smartFolderQueryJSON];
  [v17 setSmartFolderQueryJSON:v20];

  if (v9) {
    [(ICNoteContext *)self copyFolder:v12 toFolder:v17];
  }
  [v17 updateChangeCountRecursivelyWithReason:@"Copied folder"];

  return v17;
}

- (void)undoablyDeleteFolder:(id)a3 markNotesForDeletion:(BOOL)a4 actionName:(id)a5
{
}

- (void)undoablyDeleteFolder:(id)a3 markNotesForDeletion:(BOOL)a4 moveAction:(id)a5 actionName:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 isDeletable])
  {
    if (([v10 markedForDeletion] & 1) == 0)
    {
      if (!v12)
      {
        id v13 = +[NSBundle mainBundle];
        id v12 = [v13 localizedStringForKey:@"Delete Folder" value:&stru_1000F2510 table:0];
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v14 = [v10 notes:v11];
      id v15 = [v14 copy];

      id v16 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v45;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v45 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v21 = [v20 undoablyTrashOrDeleteWithMoveAction:0 actionName:v12];
            if (v8)
            {
              [(ICNoteContext *)self undoablyDeleteNote:v20 moveAction:0 actionName:v12];
              if (v21) {
                [(ICNoteContext *)self undoablyDeleteNote:v21 moveAction:0 actionName:v12];
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v17);
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v22 = [v10 children];
      id v23 = [v22 copy];

      id v24 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v41;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v41 != v26) {
              objc_enumerationMutation(v23);
            }
            [(ICNoteContext *)self undoablyDeleteFolder:*(void *)(*((void *)&v40 + 1) + 8 * (void)j) markNotesForDeletion:v8 moveAction:0 actionName:v12];
          }
          id v25 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v25);
      }

      long long v28 = [v10 parent];

      if (v28) {
        [v10 parent];
      }
      else {
      long long v30 = [v10 account];
      }
      id v11 = v37;
      [v30 undoablyRemoveFromOrder:v10];

      [v10 markForDeletion];
      [(ICNoteContext *)self undoablyDeleteUnusedTagsForSmartFolder:v10];
      if ([v10 importedFromLegacy]) {
        +[ICLegacyTombstone addLegacyTombstoneForFolder:v10];
      }
      long long v31 = +[NSUndoManager shared];
      unsigned __int8 v32 = [v31 isUndoing];

      if (v37 && (v32 & 1) == 0) {
        +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v37 oldObject:v10 newObject:0];
      }
      long long v33 = +[NSUndoManager shared];
      long long v34 = [v33 prepareWithInvocationTarget:self];
      [v34 undoablyUndeleteFolder:v10 didMarkNotesForDeletion:v8 moveAction:v37 actionName:v12];

      long long v35 = +[NSUndoManager shared];
      [v35 setActionName:v12];
    }
    long long v36 = [v10 managedObjectContext];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001FC30;
    v38[3] = &unk_1000EE0C0;
    long long v39 = v10;
    [v36 performBlock:v38];

    long long v29 = v39;
  }
  else
  {
    long long v29 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000B6394();
    }
  }
}

- (void)undoablyUndeleteFolder:(id)a3 didMarkNotesForDeletion:(BOOL)a4 moveAction:(id)a5 actionName:(id)a6
{
  BOOL v8 = a4;
  id v18 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!v11)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "actionName", "-[ICNoteContext(UndoSupport) undoablyUndeleteFolder:didMarkNotesForDeletion:moveAction:actionName:]", 1, 0, @"actionName is nil");
    id v12 = +[NSBundle mainBundle];
    id v11 = [v12 localizedStringForKey:@"Delete Folder" value:&stru_1000F2510 table:0];
  }
  [v18 unmarkForDeletion];
  if ([v18 importedFromLegacy]) {
    +[ICLegacyTombstone removeLegacyTombstoneForFolder:v18];
  }
  id v13 = +[NSUndoManager shared];
  unsigned __int8 v14 = [v13 isUndoing];

  if (v10 && (v14 & 1) == 0) {
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v10 oldObject:0 newObject:v18];
  }
  id v15 = +[NSUndoManager shared];
  id v16 = [v15 prepareWithInvocationTarget:self];
  [v16 undoablyDeleteFolder:v18 markNotesForDeletion:v8 moveAction:v10 actionName:v11];

  id v17 = +[NSUndoManager shared];
  [v17 setActionName:v11];
}

- (void)undoablyPersistDeleteEventForObject:(id)a3 fromParentObject:(id)a4 sharedRootObject:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSUndoManager shared];
  unsigned __int8 v11 = [v10 isUndoing];

  if ((v11 & 1) == 0)
  {
    id v12 = [v9 persistDeleteActivityEventForObject:v16 fromParentObject:v8];
    id v13 = +[NSUndoManager shared];
    [v13 registerUndoForCloudSyncingObjectActivityEvent:v12 cloudSyncingObject:v9];
  }
  unsigned __int8 v14 = +[NSUndoManager shared];
  id v15 = [v14 prepareWithInvocationTarget:self];
  [v15 undoablyPersistDeleteEventForObject:v16 fromParentObject:v8 sharedRootObject:v9];
}

- (void)undoablyDeleteUnusedTagsForSmartFolder:(id)a3
{
  id v4 = a3;
  [v4 managedObjectContext];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned __int8 v11 = sub_100020014;
  id v12 = &unk_1000EE0E8;
  id v13 = v4;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v14;
  id v6 = v4;
  [v5 performBlockAndWait:&v9];
  id v7 = +[NSUndoManager shared];
  id v8 = [v7 prepareWithInvocationTarget:self];
  [v8 undoablyUndeleteUnusedTagsForSmartFolder:v6];
}

- (void)undoablyUndeleteUnusedTagsForSmartFolder:(id)a3
{
  id v4 = a3;
  [v4 managedObjectContext];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned __int8 v11 = sub_1000201D4;
  id v12 = &unk_1000EE0E8;
  id v13 = v4;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v14;
  id v6 = v4;
  [v5 performBlockAndWait:&v9];
  id v7 = +[NSUndoManager shared];
  id v8 = [v7 prepareWithInvocationTarget:self];
  [v8 undoablyDeleteUnusedTagsForSmartFolder:v6];
}

- (id)addNewNoteByCopyingNote:(id)a3 toFolder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 isPasswordProtected])
  {
    id v7 = v5;
    if ([v7 isAuthenticated])
    {
      id v8 = +[ICNote duplicateNote:v7 intoFolder:v6 isPasswordProtected:1 removeOriginalNote:0];
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000B6408(v7);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = +[ICNote newEmptyNoteInFolder:v6];
    if (([v5 copyValuesToNote:v8] & 1) == 0) {
      +[ICNote deleteNote:v8];
    }
  }
  [v8 updateChangeCountWithReason:@"Copied note"];

  return v8;
}

- (void)copyNotes:(id)a3 toFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = (char *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      unsigned __int8 v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = ICCheckedProtocolCast();
        if (v12) {
          id v13 = [(ICNoteContext *)self addNewNoteByCopyingNote:v12 toFolder:v7];
        }

        ++v11;
      }
      while (v9 != v11);
      id v9 = (char *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)copyFolder:(id)a3 toFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "sourceFolder", "-[ICNoteContext(UndoSupport) copyFolder:toFolder:]", 1, 0, @"sourceFolder is nil");
    if (v8) {
      goto LABEL_3;
    }
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "targetFolder", "-[ICNoteContext(UndoSupport) copyFolder:toFolder:]", 1, 0, @"targetFolder is nil");
LABEL_3:
  if (v6 == v8)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "sourceFolder != targetFolder", "-[ICNoteContext(UndoSupport) copyFolder:toFolder:]", 1, 0, @"Should not copy to the same folder %@", v6);
  }
  else if (v6 && v8)
  {
    id v9 = [v6 titleForCopying];
    [v8 setTitle:v9];

    uint64_t v10 = [v6 notesForCopying];
    [(ICNoteContext *)self copyNotes:v10 toFolder:v8];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v6;
    unsigned __int8 v11 = [v6 subfoldersForCopying];
    id v12 = (char *)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = ICCheckedProtocolCast();
          if (v16)
          {
            id v17 = +[ICFolder newFolderInParentFolder:v8];
            [(ICNoteContext *)self copyFolder:v16 toFolder:v17];
          }
          ++v15;
        }
        while (v13 != v15);
        id v13 = (char *)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    id v6 = v18;
  }
}

- (void)markNoteAndAttachmentsForDeletion:(id)a3
{
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 attachments];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 markedForDeletion] & 1) == 0) {
          +[ICAttachment deleteAttachment:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v3 markForDeletion];
  if ([v3 requiresLegacyTombstoneAfterDeletion]) {
    +[ICLegacyTombstone addLegacyTombstoneForNote:v3];
  }
}

- (void)unmarkNoteAndAttachmentsForDeletion:(id)a3
{
  id v3 = a3;
  [v3 unmarkForDeletion];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v20 = v3;
  id v4 = [v3 attachments];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v9 = ICAttachmentPreviewImagesDidUpdateNotification;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v11 unmarkForDeletion];
        long long v12 = [v11 media];
        [v12 unmarkForDeletion];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v13 = [v11 previewImages];
        id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) unmarkForDeletion];
            }
            id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v15);
        }

        id v18 = [v11 ic_postNotificationOnMainThreadAfterSaveWithName:v9];
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v19 = [v20 legacyContentHashAtImport];

  if (v19) {
    +[ICLegacyTombstone removeLegacyTombstoneForNote:v20];
  }
}

- (void)undoablyProcessNoteIDs:(id)a3 progressStringBlock:(id)a4 workerContext:(id)a5 processNoteBlock:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    id v14 = [(ICNoteContext *)self snapshotManagedObjectContext];
  }
  id v17 = objc_alloc_init((Class)ICLongRunningTaskController);
  [v17 setProgressStringBlock:v13];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10001E160;
  v30[4] = sub_10001E170;
  id v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100020D8C;
  v25[3] = &unk_1000EE8C8;
  id v18 = v12;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  long long v29 = v30;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100021134;
  v22[3] = &unk_1000EE8F0;
  id v21 = v16;
  id v23 = v21;
  long long v24 = v30;
  [v17 startTask:v25 completionBlock:v22];

  _Block_object_dispose(v30, 8);
}

- (void)undoablyUnmoveNoteIDs:(id)a3 toFolderIDs:(id)a4 originalToCopyNoteIDs:(id)a5 actionName:(id)a6 noteToFolderIDsForRedo:(id)a7 workerContext:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  id v20 = +[NSUndoManager shared];
  id v21 = [v20 prepareWithInvocationTarget:self];
  [v21 undoablyMoveNoteIDs:v19 toFolderIDs:v17 actionName:v18 workerContext:v16 completionHandler:0];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100021374;
  v24[3] = &unk_1000EE958;
  id v25 = v14;
  id v26 = v15;
  id v27 = self;
  id v22 = v15;
  id v23 = v14;
  [(ICNoteContext *)self undoablyProcessNoteIDs:v19 progressStringBlock:&stru_1000EE930 workerContext:v16 processNoteBlock:v24 completionHandler:0];
}

- (void)undoablyMoveNoteIDs:(id)a3 toFolderIDs:(id)a4 actionName:(id)a5 workerContext:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v27 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = +[NSUndoManager shared];
  [v16 beginUndoGrouping];

  id v17 = +[NSMutableDictionary dictionary];
  id v18 = +[NSMutableDictionary dictionary];
  id v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002195C;
  v36[3] = &unk_1000EE9A0;
  id v37 = v12;
  id v38 = v17;
  id v39 = v18;
  long long v40 = self;
  id v41 = v19;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100021D9C;
  v28[3] = &unk_1000EE9C8;
  v28[4] = self;
  id v29 = v38;
  id v30 = v39;
  id v31 = v27;
  id v32 = v37;
  id v33 = v13;
  id v34 = v41;
  id v35 = v14;
  id v20 = v41;
  id v21 = v14;
  id v22 = v13;
  id v23 = v37;
  id v24 = v27;
  id v25 = v39;
  id v26 = v38;
  [(ICNoteContext *)self undoablyProcessNoteIDs:v15 progressStringBlock:&stru_1000EE978 workerContext:v22 processNoteBlock:v36 completionHandler:v28];
}

- (void)postNotificationsForUntrashingOrUndeletingNoteIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteContext *)self managedObjectContext];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = ICNoteWillMoveFromRecentlyDeletedFolderNotification;
    uint64_t v10 = ICNoteWillBeUndeletedNotification;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = +[ICNote ic_existingObjectWithID:*(void *)(*((void *)&v18 + 1) + 8 * (void)v11) context:v5];
        unsigned int v13 = [v12 markedForDeletion];
        id v14 = +[NSNotificationCenter defaultCenter];
        id v15 = v14;
        if (v13) {
          uint64_t v16 = v10;
        }
        else {
          uint64_t v16 = v9;
        }
        [v14 postNotificationName:v16 object:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)postNotificationsForTrashingOrDeletingNoteIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteContext *)self managedObjectContext];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = ICNoteWillMoveToRecentlyDeletedFolderNotification;
    uint64_t v10 = ICNoteWillBeDeletedNotification;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = +[ICNote ic_existingObjectWithID:*(void *)(*((void *)&v19 + 1) + 8 * (void)v11) context:v5];
        unsigned int v13 = [v12 folder];
        unsigned int v14 = [v13 isTrashFolder];

        id v15 = +[NSNotificationCenter defaultCenter];
        uint64_t v16 = v15;
        if (v14) {
          uint64_t v17 = v10;
        }
        else {
          uint64_t v17 = v9;
        }
        [v15 postNotificationName:v17 object:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

@end