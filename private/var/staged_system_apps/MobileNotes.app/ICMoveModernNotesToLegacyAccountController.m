@interface ICMoveModernNotesToLegacyAccountController
+ (id)alertForUnsupportedAttachmentsDestinationStore:(id)a3 continueHandler:(id)a4;
+ (id)localizedAlertMessageForCopyingNotesForAccount:(id)a3;
+ (id)localizedAlertMessageForMovingNotesForAccount:(id)a3;
+ (id)localizedAlertTitle;
- (ICMoveModernNotesToLegacyAccountController)init;
- (NSMutableArray)createdLegacyNotes;
- (NSMutableArray)notesToDelete;
- (NSOperationQueue)operationQueue;
- (void)addOperationToCopyOrMoveNotes:(id)a3 toFolder:(id)a4 copyOnly:(BOOL)a5;
- (void)asyncFinishCopyOnly:(BOOL)a3;
- (void)cancel;
- (void)finishAfterCopyingNotesCopyOnly:(BOOL)a3;
- (void)setCreatedLegacyNotes:(id)a3;
- (void)setNotesToDelete:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)waitUntilFinishedWithDispatchTimeout:(unint64_t)a3;
@end

@implementation ICMoveModernNotesToLegacyAccountController

- (ICMoveModernNotesToLegacyAccountController)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICMoveModernNotesToLegacyAccountController;
  v2 = [(ICMoveModernNotesToLegacyAccountController *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(ICMoveModernNotesToLegacyAccountController *)v2 setOperationQueue:v3];

    v4 = [(ICMoveModernNotesToLegacyAccountController *)v2 operationQueue];
    [v4 setName:@"com.apple.notes.move-modern-notes-to-HTML-account-queue"];

    v5 = [(ICMoveModernNotesToLegacyAccountController *)v2 operationQueue];
    [v5 setMaxConcurrentOperationCount:1];

    v6 = +[NSMutableArray array];
    [(ICMoveModernNotesToLegacyAccountController *)v2 setNotesToDelete:v6];

    v7 = +[NSMutableArray array];
    [(ICMoveModernNotesToLegacyAccountController *)v2 setCreatedLegacyNotes:v7];
  }
  return v2;
}

- (void)addOperationToCopyOrMoveNotes:(id)a3 toFolder:(id)a4 copyOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = +[NotesApp sharedNotesApp];
  v11 = [v10 noteContext];

  id v12 = [v8 count];
  if (v12)
  {
    unint64_t v13 = (unint64_t)v12;
    unint64_t v14 = 0;
    v24 = v27;
    id v25 = v8;
    do
    {
      unint64_t v15 = v14 + 5;
      if (v14 + 5 >= v13) {
        unint64_t v16 = v13;
      }
      else {
        unint64_t v16 = v14 + 5;
      }
      v17 = [v8 subarrayWithRange:v14, v16 - v14, v24];
      id v18 = objc_alloc((Class)ICCopyModernNotesToLegacyAccountOperation);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v27[0] = sub_100109A48;
      v27[1] = &unk_10062A2C8;
      BOOL v28 = v5;
      v27[2] = self;
      BOOL v19 = v5;
      id v20 = [v18 initWithNotes:v17 toFolder:v9 legacyContext:v11 didCopyBlock:v26];
      [(ICMoveModernNotesToLegacyAccountController *)self operationQueue];
      v21 = self;
      v23 = v22 = v11;
      [v23 addOperation:v20];

      v11 = v22;
      self = v21;

      BOOL v5 = v19;
      id v8 = v25;
      unint64_t v14 = v16;
    }
    while (v13 > v15);
  }
}

- (void)cancel
{
  id v3 = [(ICMoveModernNotesToLegacyAccountController *)self operationQueue];
  [v3 cancelAllOperations];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(ICMoveModernNotesToLegacyAccountController *)self createdLegacyNotes];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v9 isMarkedForDeletion] & 1) == 0) {
          [v9 markForDeletion];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)waitUntilFinishedWithDispatchTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = dispatch_get_global_queue(-2, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100109CD4;
  v8[3] = &unk_100625860;
  v8[4] = self;
  dispatch_semaphore_t v9 = v5;
  uint64_t v7 = v5;
  dispatch_async(v6, v8);

  dispatch_semaphore_wait(v7, a3);
}

- (void)asyncFinishCopyOnly:(BOOL)a3
{
  dispatch_semaphore_t v5 = dispatch_get_global_queue(-2, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100109DC0;
  v6[3] = &unk_100625D18;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)finishAfterCopyingNotesCopyOnly:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_semaphore_t v5 = +[ICAppDelegate sharedInstance];
  id v6 = [v5 undoManager];

  BOOL v7 = +[NSBundle mainBundle];
  id v8 = v7;
  if (v3) {
    CFStringRef v9 = @"Copy %lu Notes";
  }
  else {
    CFStringRef v9 = @"Move %lu Notes";
  }
  long long v10 = [v7 localizedStringForKey:v9 value:&stru_10063F3D8 table:0];
  long long v11 = [(ICMoveModernNotesToLegacyAccountController *)self createdLegacyNotes];
  long long v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, [v11 count]);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v13 = [(ICMoveModernNotesToLegacyAccountController *)self notesToDelete];
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v19 = [v18 managedObjectContext];
        if (v19)
        {
          id v20 = (void *)v19;
          unsigned __int8 v21 = [v18 markedForDeletion];

          if ((v21 & 1) == 0) {
            +[ICNote deleteNote:v18];
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  v22 = +[ICNoteContext sharedContext];
  [v22 save];

  v23 = +[NotesApp sharedNotesApp];
  v24 = [v23 noteContext];
  id v25 = [v24 managedObjectContext];
  [v25 ic_save];
}

+ (id)localizedAlertTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Unsupported Attachments" value:&stru_10063F3D8 table:0];

  return v3;
}

+ (id)localizedAlertMessageForMovingNotesForAccount:(id)a3
{
  unsigned int v3 = [a3 supportsAttachments];
  v4 = +[NSBundle mainBundle];
  dispatch_semaphore_t v5 = v4;
  if (v3) {
    CFStringRef v6 = @"You’re moving notes to an account that doesn’t support some attachments. If you continue, unsupported attachments may look different.";
  }
  else {
    CFStringRef v6 = @"You’re moving notes to an account that doesn’t support attachments. If you continue, all attachments will be removed.";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

  return v7;
}

+ (id)localizedAlertMessageForCopyingNotesForAccount:(id)a3
{
  unsigned int v3 = [a3 supportsAttachments];
  v4 = +[NSBundle mainBundle];
  dispatch_semaphore_t v5 = v4;
  if (v3) {
    CFStringRef v6 = @"You’re copying notes to an account that doesn’t support some attachments. If you continue, unsupported attachments may look different.";
  }
  else {
    CFStringRef v6 = @"You’re moving notes to an account that doesn’t support attachments. If you continue, all attachments will be removed.";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

  return v7;
}

+ (id)alertForUnsupportedAttachmentsDestinationStore:(id)a3 continueHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = +[ICMoveModernNotesToLegacyAccountController localizedAlertTitle];
  id v8 = [v6 account];

  CFStringRef v9 = +[ICMoveModernNotesToLegacyAccountController localizedAlertMessageForMovingNotesForAccount:v8];

  long long v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];
  long long v11 = +[NSBundle mainBundle];
  long long v12 = [v11 localizedStringForKey:@"Continue" value:&stru_10063F3D8 table:0];
  long long v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v5];

  [v10 addAction:v13];
  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];
  uint64_t v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
  [v10 addAction:v16];

  if (+[UIDevice ic_isVision]) {
    uint64_t v17 = -2;
  }
  else {
    uint64_t v17 = 7;
  }
  [v10 setModalPresentationStyle:v17];

  return v10;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSMutableArray)notesToDelete
{
  return self->_notesToDelete;
}

- (void)setNotesToDelete:(id)a3
{
}

- (NSMutableArray)createdLegacyNotes
{
  return self->_createdLegacyNotes;
}

- (void)setCreatedLegacyNotes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdLegacyNotes, 0);
  objc_storeStrong((id *)&self->_notesToDelete, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end