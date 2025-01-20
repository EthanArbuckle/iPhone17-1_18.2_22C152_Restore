@interface ICFolder
+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4;
+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4 toAccount:(id)a5 moveAction:(id)a6 noteMovedBlock:(id)a7;
+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4 toAccount:(id)a5 noteMovedBlock:(id)a6;
+ (id)undoablyMoveNote:(id)a3 toFolder:(id)a4;
+ (id)undoablyMoveNote:(id)a3 toFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6;
+ (void)undoablyMoveNotes:(id)a3 toFolder:(id)a4 isCopy:(BOOL)a5 noteMovedBlock:(id)a6;
- (void)undoablySetParentFolder:(id)a3;
- (void)undoablySetParentFolder:(id)a3 moveAction:(id)a4;
- (void)undoablySetTitle:(id)a3;
- (void)updateChangeCountRecursivelyWithReason:(id)a3;
@end

@implementation ICFolder

- (void)undoablySetTitle:(id)a3
{
  id v4 = a3;
  v5 = +[NSUndoManager shared];
  v6 = [v5 prepareWithInvocationTarget:self];
  v7 = [(ICFolder *)self title];
  [v6 undoablySetTitle:v7];

  uint64_t v8 = +[NSUndoManager shared];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Set Folder Name" value:&stru_1000F2510 table:0];
  [(id)v8 setActionName:v10];

  [(ICFolder *)self setTitle:v4];
  v11 = +[NSDate now];
  [(ICFolder *)self setDateForLastTitleModification:v11];

  [(ICFolder *)self updateChangeCountWithReason:@"Set folder title"];
  v12 = +[NSUndoManager shared];
  LOBYTE(v8) = [v12 isUndoing];

  if ((v8 & 1) == 0)
  {
    v13 = [(ICFolder *)self persistRenameActivityEventForObject:self];
    v14 = +[NSUndoManager shared];
    [v14 registerUndoForCloudSyncingObjectActivityEvent:v13 cloudSyncingObject:self];
  }
  v15 = [(ICFolder *)self managedObjectContext];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000099F0;
  v16[3] = &unk_1000EE0C0;
  v16[4] = self;
  [v15 performBlock:v16];
}

- (void)undoablySetParentFolder:(id)a3
{
  id v4 = a3;
  v5 = [[ICCloudSyncingObjectMoveAction alloc] initWithFolder:self toParentObject:v4 isCopy:0];
  [(ICFolder *)self undoablySetParentFolder:v4 moveAction:v5];
}

- (void)undoablySetParentFolder:(id)a3 moveAction:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  v7 = [(ICFolder *)self parent];

  if (v7) {
    [(ICFolder *)self parent];
  }
  else {
  uint64_t v8 = [(ICFolder *)self account];
  }
  [v8 undoablyRemoveFromOrder:self];

  v9 = +[NSUndoManager shared];
  unsigned __int8 v10 = [v9 isUndoing];

  if (v18 && (v10 & 1) == 0) {
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v18 oldObject:self newObject:self];
  }
  v11 = +[NSUndoManager shared];
  v12 = [v11 prepareWithInvocationTarget:self];
  v13 = [(ICFolder *)self parent];
  [v12 undoablySetParentFolder:v13 moveAction:v18];

  v14 = +[NSUndoManager shared];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Move Folder" value:&stru_1000F2510 table:0];
  [v14 setActionName:v16];

  [(ICFolder *)self setParent:v6];
  v17 = +[NSDate now];
  [(ICFolder *)self setParentModificationDate:v17];

  [(ICFolder *)self updateChangeCountWithReason:@"Set parent folder"];
}

- (void)updateChangeCountRecursivelyWithReason:(id)a3
{
  id v4 = a3;
  [(ICFolder *)self updateChangeCountWithReason:v4];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v23 = self;
  v5 = [(ICFolder *)self notes];
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v10 updateChangeCountWithReason:v4];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v11 = [v10 attachments];
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
              [v16 updateChangeCountWithReason:v4];
              v17 = [v16 media];
              [v17 updateChangeCountWithReason:v4];
            }
            id v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v13);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = [(ICFolder *)v23 children];
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)k) updateChangeCountRecursivelyWithReason:v4];
      }
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }
}

+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4 toAccount:(id)a5 noteMovedBlock:(id)a6
{
  return [a1 undoablyMoveFolder:a3 toNoteContainer:a4 toAccount:a5 moveAction:0 noteMovedBlock:a6];
}

+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4 toAccount:(id)a5 moveAction:(id)a6 noteMovedBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void))a7;
  id v17 = v12;
  objc_opt_class();
  id v18 = ICDynamicCast();
  unsigned int v19 = [v18 canMoveAddOrDeleteContents];
  if (!v14 && !v19)
  {
    id v20 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000B54FC(v17, v20);
    }
    uint64_t v21 = v20;
    v22 = v17;
    goto LABEL_45;
  }
  v23 = [v17 title];
  id v20 = +[ICFolder deduplicatingTitle:v23 forFolder:v17 forNewFolderParent:v18 ofAccount:v14];
  if (v20 && ([v23 isEqualToString:v20] & 1) == 0) {
    [v17 undoablySetTitle:v20];
  }
  if (v18) {
    id v24 = v18;
  }
  else {
    id v24 = v14;
  }
  v53 = v23;
  if (+[ICMoveDecision shouldCopyThenDeleteWhenMovingObject:v17 toNoteContainer:v24])
  {
    v50 = v20;
    long long v25 = +[ICNoteContext sharedContext];
    v22 = [v25 undoablyCopyFolder:v17 toAccount:v14 copyingNotes:0 moveAction:v15 actionName:0];

    long long v26 = [v17 title];
    [v22 setTitle:v26];

    v51 = v18;
    [v22 setParent:v18];
    if (v15) {
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v15 oldObject:0 newObject:v22];
    }
    id v52 = v15;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v27 = [v17 subfoldersForCopying];
    id v28 = [v27 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v61;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v61 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = [a1 undoablyMoveFolder:*(void *)(*((void *)&v60 + 1) + 8 * i) toNoteContainer:v22 toAccount:v14 moveAction:0 noteMovedBlock:v16];
        }
        id v29 = [v27 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v29);
    }

    if (([v17 isSmartFolder] & 1) == 0)
    {
      id v48 = v17;
      id v49 = v13;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v33 = [v17 visibleNotes];
      id v34 = [v33 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v57;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v57 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
            id v39 = [a1 undoablyMoveNote:v38 toFolder:v22 moveAction:0 actionName:0];
            if (v16) {
              v16[2](v16, v38);
            }
          }
          id v35 = [v33 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v35);
      }

      id v17 = v48;
      id v13 = v49;
    }
    v40 = +[ICNoteContext sharedContext];
    id v15 = v52;
    [v40 undoablyDeleteFolder:v17 markNotesForDeletion:1 moveAction:v52 actionName:0];

    id v20 = v50;
    id v18 = v51;
    if (v51) {
      goto LABEL_34;
    }
LABEL_36:
    v41 = v14;
    goto LABEL_37;
  }
  [v17 undoablySetParentFolder:v18 moveAction:v15];
  v22 = v17;
  if (!v18) {
    goto LABEL_36;
  }
LABEL_34:
  v41 = v18;
LABEL_37:
  v42 = [v41 subFolderIdentifiersOrderedSet];
  if (!v42) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((orderedIdentifiers) != nil)", "+[ICFolder(UndoSupport) undoablyMoveFolder:toNoteContainer:toAccount:moveAction:noteMovedBlock:]", 1, 0, @"Expected non-nil value for '%s'", "orderedIdentifiers");
  }
  if ([v42 count])
  {
    id v43 = [v42 count];
    if (v18) {
      v44 = v18;
    }
    else {
      v44 = v14;
    }
    [v44 undoablySetOrder:v43 ofChild:v22];
  }

  uint64_t v21 = v53;
LABEL_45:

  v45 = [v22 managedObjectContext];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10000A43C;
  v54[3] = &unk_1000EE0C0;
  id v46 = v22;
  id v55 = v46;
  [v45 performBlock:v54];

  return v46;
}

+ (id)undoablyMoveFolder:(id)a3 toNoteContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 noteContainerAccount];
  v9 = [a1 undoablyMoveFolder:v7 toNoteContainer:v6 toAccount:v8 moveAction:0 noteMovedBlock:0];

  return v9;
}

+ (void)undoablyMoveNotes:(id)a3 toFolder:(id)a4 isCopy:(BOOL)a5 noteMovedBlock:(id)a6
{
  BOOL v23 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void))a6;
  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Move %lu Notes" value:&stru_1000F2510 table:0];
  id v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, [v9 count]);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v9;
  id v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v18);
        id v20 = [[ICCloudSyncingObjectMoveAction alloc] initWithNote:v19 toFolder:v10 isCopy:v23];
        id v21 = [a1 undoablyMoveNote:v19 toFolder:v10 moveAction:v20 actionName:v14];
        if (v11) {
          v11[2](v11, v19);
        }

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

+ (id)undoablyMoveNote:(id)a3 toFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isSystemPaper])
  {
    id v13 = +[ICNoteContext sharedContext];
    id v26 = v9;
    id v14 = +[NSArray arrayWithObjects:&v26 count:1];
    [v13 undoablyMarkNotes:v14 asSystemPaper:0];
  }
  id v15 = [v9 folder];

  if (v15 == v10)
  {
    id v24 = v9;
    id v18 = v10;
    goto LABEL_14;
  }
  id v16 = +[ICNoteContext sharedContext];
  uint64_t v17 = [v9 folder];
  id v18 = [v16 adjustedDestinationFolderForNoteContainer:v10 sourceFolder:v17];

  unsigned __int8 v19 = +[ICMoveDecision shouldCopyThenDeleteWhenMovingObject:v9 toNoteContainer:v18];
  unsigned __int8 v20 = [v11 isCopy];
  if (v19)
  {
    if (([v11 isCopy] & 1) == 0)
    {
      id v21 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1000B5594(v18, v9, v21);
      }

      v22 = [v9 folder];
      uint64_t v23 = [v9 undoablyCopyAndDeleteFromFolder:v22 destinationFolder:v18 moveAction:v11 actionName:v12];
      goto LABEL_12;
    }
LABEL_11:
    v22 = +[ICNoteContext sharedContext];
    uint64_t v23 = [v22 undoablyCopyNote:v9 toFolder:v18 moveAction:v11 actionName:0];
LABEL_12:
    id v24 = (id)v23;

    goto LABEL_14;
  }
  if (v20) {
    goto LABEL_11;
  }
  [v9 undoablySetFolder:v18];
  id v24 = v9;
LABEL_14:

  return v24;
}

+ (id)undoablyMoveNote:(id)a3 toFolder:(id)a4
{
  return [a1 undoablyMoveNote:a3 toFolder:a4 moveAction:0 actionName:0];
}

@end