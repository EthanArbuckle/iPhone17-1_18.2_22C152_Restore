@interface ICNote
+ (id)undoablyDuplicateNotes:(id)a3;
- (id)undoablyCopyAndDeleteFromFolder:(id)a3 destinationFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6;
- (id)undoablyDuplicate;
- (id)undoablyTrashOrDelete;
- (id)undoablyTrashOrDeleteWithMoveAction:(id)a3 actionName:(id)a4;
- (void)donateDeleteNoteIntent;
- (void)undoablyDeleteUnusedHashtags;
- (void)undoablySetFolder:(id)a3;
@end

@implementation ICNote

- (void)undoablySetFolder:(id)a3
{
  id v4 = a3;
  v5 = +[NSUndoManager shared];
  uint64_t v6 = [v5 prepareWithInvocationTarget:self];
  v7 = [(ICNote *)self folder];
  [(id)v6 undoablySetFolder:v7];

  v8 = +[NSUndoManager shared];
  LOBYTE(v6) = [v8 ic_isUndoingOrRedoing];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v9 = [v4 isTrashFolder];
    if ((v9 & 1) != 0
      || ([(ICNote *)self folder],
          v8 = objc_claimAutoreleasedReturnValue(),
          ([v8 isTrashFolder] & 1) != 0))
    {
      v10 = +[NSBundle mainBundle];
      v11 = [v10 localizedStringForKey:@"Trash Note" value:&stru_10063F3D8 table:0];

      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
      v12 = +[NSBundle mainBundle];
      v11 = [v12 localizedStringForKey:@"Move Note" value:&stru_10063F3D8 table:0];
    }
LABEL_8:
    v13 = +[NSUndoManager shared];
    [v13 setActionName:v11];
  }
  v14 = [(ICNote *)self folder];
  unsigned __int8 v15 = [v14 isTrashFolder];

  if (v15)
  {
    v16 = &ICNoteWillMoveFromRecentlyDeletedFolderNotification;
  }
  else
  {
    if (![v4 isTrashFolder]) {
      goto LABEL_14;
    }
    [(ICNote *)self undoablyDeleteUnusedHashtags];
    [(ICNote *)self notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder];
    v16 = &ICNoteWillMoveToRecentlyDeletedFolderNotification;
  }
  v17 = +[NSNotificationCenter defaultCenter];
  [v17 postNotificationName:*v16 object:self];

LABEL_14:
  if ([v4 isSmartFolder])
  {
    v18 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1004DABBC(v18);
    }

    v19 = [v4 account];
    uint64_t v20 = [v19 defaultFolder];

    id v4 = (id)v20;
  }
  v21 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1004DAAF8(v4, self, v21);
  }

  v22 = [[ICCloudSyncingObjectMoveAction alloc] initWithNote:self toFolder:v4 isCopy:0];
  [(ICNote *)self setFolder:v4];
  v23 = +[NSDate now];
  [(ICNote *)self setFolderModificationDate:v23];

  [(ICNote *)self updateChangeCountWithReason:@"Set folder"];
  v24 = +[NSUndoManager shared];
  unsigned __int8 v25 = [v24 isUndoing];

  if ((v25 & 1) == 0 && v22) {
    +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v22 oldObject:self newObject:self];
  }
}

- (void)donateDeleteNoteIntent
{
  id v2 = +[ICIntentsUtilities interactionForDeleteNote:self];
  +[ICIntentsUtilities donateInteraction:v2];
}

+ (id)undoablyDuplicateNotes:(id)a3
{
  id v3 = a3;
  if ([v3 count]
    && (+[ICNote containsUnduplicatableNotes:v3] & 1) == 0)
  {
    v5 = +[ICNoteContext sharedContext];
    uint64_t v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Duplicate Notes" value:&stru_10063F3D8 table:0];
    id v4 = [v5 undoablyCopyNotes:v3 toFolder:0 actionName:v7];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)undoablyDuplicate
{
  if ([(ICNote *)self isDuplicatable])
  {
    id v3 = [ICCloudSyncingObjectMoveAction alloc];
    id v4 = [(ICNote *)self folder];
    v5 = [(ICCloudSyncingObjectMoveAction *)v3 initWithNote:self toFolder:v4 isCopy:1];

    uint64_t v6 = +[ICNoteContext sharedContext];
    v7 = [(ICNote *)self folder];
    v8 = +[NSBundle mainBundle];
    unsigned __int8 v9 = [v8 localizedStringForKey:@"Duplicate Note" value:&stru_10063F3D8 table:0];
    v10 = [v6 undoablyCopyNote:self toFolder:v7 moveAction:v5 actionName:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)undoablyTrashOrDelete
{
  return [(ICNote *)self undoablyTrashOrDeleteWithMoveAction:0 actionName:0];
}

- (id)undoablyTrashOrDeleteWithMoveAction:(id)a3 actionName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ICNote *)self isSharedViaICloud]
    || ([(ICNote *)self isOwnedByCurrentUser] & 1) != 0)
  {
    if (([(ICNote *)self isEmpty] & 1) != 0
      || ([(ICNote *)self folder],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 isTrashFolder],
          v8,
          v9))
    {
      v10 = +[NSNotificationCenter defaultCenter];
      [v10 postNotificationName:ICNoteWillBeDeletedNotification object:self];

      +[ICNote deleteNote:self];
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1004DAC00(self, v14);
      }

      unsigned __int8 v15 = [(ICNote *)self account];
      v16 = [v15 trashFolder];
      [(ICNote *)self undoablySetFolder:v16];
    }
LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  if ([(ICNote *)self isSharedRootObject])
  {
    v11 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1004DAD20(self, v11);
    }

    v12 = [(ICNote *)self account];
    v13 = [v12 trashFolder];
    [(ICNote *)self setFolder:v13];

    [(ICNote *)self markForDeletion];
    goto LABEL_13;
  }
  v19 = [(ICNote *)self folder];
  uint64_t v20 = [(ICNote *)self account];
  v21 = [v20 trashFolder];
  v17 = [(ICNote *)self undoablyCopyAndDeleteFromFolder:v19 destinationFolder:v21 moveAction:v6 actionName:v7];

LABEL_14:
  [(ICNote *)self donateDeleteNoteIntent];

  return v17;
}

- (id)undoablyCopyAndDeleteFromFolder:(id)a3 destinationFolder:(id)a4 moveAction:(id)a5 actionName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[NSUndoManager shared];
  unsigned __int8 v15 = +[ICNoteContext sharedContext];
  v16 = [v15 addNewNoteByCopyingNote:self toFolder:v11];

  if (v16)
  {
    +[ICInlineAttachment changeLinkDestinationFromNote:self toNote:v16];
    [v16 unmarkForDeletion];
    [(ICNote *)self markForDeletion];
    unsigned __int8 v17 = [v14 isUndoing];
    if (v12 && (v17 & 1) == 0) {
      +[ICCloudSyncingObject undoablyPersistActivityEventsForMoveAction:v12 oldObject:self newObject:v16];
    }
    v18 = [v14 prepareWithInvocationTarget:v16];
    id v19 = [v18 undoablyCopyAndDeleteFromFolder:v11 destinationFolder:v10 moveAction:v12 actionName:v13];

    if (v13) {
      [v14 setActionName:v13];
    }
    id v20 = v16;
  }

  return v16;
}

- (void)undoablyDeleteUnusedHashtags
{
  id v3 = [(ICNote *)self account];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ICNote *)self inlineAttachments];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isHashtagAttachment])
        {
          id v11 = [v10 tokenContentIdentifier];
          if ((unint64_t)+[ICInlineAttachment countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:account:](ICInlineAttachment, "countOfNonTrashFolderVisibleInlineAttachmentsForHashtagStandardizedContent:account:", v11, v3) <= 1)+[ICHashtag undoablyMarkForDeletion:1 standardizedContent:v11 account:v3]; {
        }
          }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

@end