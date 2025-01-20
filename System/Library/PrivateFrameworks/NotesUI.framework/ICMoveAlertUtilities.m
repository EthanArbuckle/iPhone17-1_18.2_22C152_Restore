@interface ICMoveAlertUtilities
+ (BOOL)suppressesAlerts;
+ (void)postAlertForFolderDepthLimitWithPresentingViewController:(id)a3 completionHandler:(id)a4;
+ (void)postAlertForMovingFolderWithSharedNotes:(id)a3 sharedSubfolders:(id)a4 destination:(id)a5 presentingViewController:(id)a6 shareHandler:(id)a7 cancelHandler:(id)a8;
+ (void)postAlertForMovingLockedNotesToOtherAccountIsCopy:(BOOL)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
+ (void)postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes:(unint64_t)a3 guiltyObjects:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6;
+ (void)postAlertForMovingNotesContainingSharedNotesToSharedFolder:(id)a3 destination:(id)a4 presentingViewController:(id)a5 shareHandler:(id)a6 cancelHandler:(id)a7;
+ (void)postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:(id)a3 completionHandler:(id)a4;
+ (void)postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:(id)a3 presentingViewController:(id)a4;
+ (void)postAlertForOwnerStoppedSharingCurrentFolderWithPresentingViewController:(id)a3 completionHandler:(id)a4;
+ (void)postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
+ (void)postAlertForSharingFolderWithSharedNotes:(id)a3 sharedSubfolders:(id)a4 presentingViewController:(id)a5 shareHandler:(id)a6 cancelHandler:(id)a7;
+ (void)postAlertForUnsupportedAttachmentsInLegacyAccount:(id)a3 presentingViewController:(id)a4;
+ (void)postAlertWithOKButtonWithTitle:(id)a3 message:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6;
+ (void)postAlertWithProceedAndCancelButtonsWithTitle:(id)a3 message:(id)a4 proceedTitle:(id)a5 presentingViewController:(id)a6 proceedHandler:(id)a7 cancelHandler:(id)a8;
+ (void)setSuppressesAlerts:(BOOL)a3;
@end

@implementation ICMoveAlertUtilities

+ (BOOL)suppressesAlerts
{
  return _suppressesAlerts;
}

+ (void)setSuppressesAlerts:(BOOL)a3
{
  _suppressesAlerts = a3;
}

+ (void)postAlertWithOKButtonWithTitle:(id)a3 message:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void))a6;
  if ([(id)objc_opt_class() suppressesAlerts])
  {
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
    v14 = (void *)MEMORY[0x1E4FB1410];
    v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __106__ICMoveAlertUtilities_postAlertWithOKButtonWithTitle_message_presentingViewController_completionHandler___block_invoke;
    v17[3] = &unk_1E5FDAA38;
    v18 = v12;
    v16 = [v14 actionWithTitle:v15 style:0 handler:v17];

    [v13 addAction:v16];
    [v11 presentViewController:v13 animated:1 completion:0];
  }
}

uint64_t __106__ICMoveAlertUtilities_postAlertWithOKButtonWithTitle_message_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)postAlertWithProceedAndCancelButtonsWithTitle:(id)a3 message:(id)a4 proceedTitle:(id)a5 presentingViewController:(id)a6 proceedHandler:(id)a7 cancelHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(void))a7;
  id v18 = a8;
  if (![(id)objc_opt_class() suppressesAlerts] && v13 && v14)
  {
    v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:v14 preferredStyle:1];
    v20 = (void *)MEMORY[0x1E4FB1410];
    v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke;
    v30[3] = &unk_1E5FDAA38;
    id v31 = v18;
    v22 = [v20 actionWithTitle:v21 style:1 handler:v30];

    [v19 addAction:v22];
    v23 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke_2;
    v28 = &unk_1E5FDAA38;
    v29 = v17;
    v24 = [v23 actionWithTitle:v15 style:0 handler:&v25];
    objc_msgSend(v19, "addAction:", v24, v25, v26, v27, v28);
    [v19 setPreferredAction:v24];
    [v16 presentViewController:v19 animated:1 completion:0];
  }
  else if (v17)
  {
    v17[2](v17);
  }
}

uint64_t __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __145__ICMoveAlertUtilities_postAlertWithProceedAndCancelButtonsWithTitle_message_proceedTitle_presentingViewController_proceedHandler_cancelHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes:(unint64_t)a3 guiltyObjects:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  id v14 = a5;
  id v10 = (void (**)(void))a6;
  if (objc_msgSend(a4, "ic_containsObjectPassingTest:", &__block_literal_global_26))
  {
    if (a3 == 1) {
      id v11 = @"Your note wasn’t moved.";
    }
    else {
      id v11 = @"Your notes weren’t moved.";
    }
    v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
    id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked notes can’t be shared." value:@"Locked notes can’t be shared." table:0 allowSiri:1];
    [a1 postAlertWithOKButtonWithTitle:v12 message:v13 presentingViewController:v14 completionHandler:v10];
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

uint64_t __155__ICMoveAlertUtilities_postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes_guiltyObjects_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPasswordProtected];
}

+ (void)postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = a3;
  int v11 = objc_msgSend(v10, "ic_containsObjectPassingTest:", &__block_literal_global_27);
  int v12 = objc_msgSend(v10, "ic_containsObjectPassingTest:", &__block_literal_global_29);

  id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Can’t Share Folder" value:@"Can’t Share Folder" table:0 allowSiri:1];
  if (v11 && v12)
  {
    id v14 = (void *)MEMORY[0x1E4F83770];
    id v15 = @"You can’t share folders that contain items shared with you or locked notes.";
  }
  else if (v11)
  {
    id v14 = (void *)MEMORY[0x1E4F83770];
    id v15 = @"You can’t share folders that contain locked notes.";
  }
  else
  {
    if (!v12)
    {
      v17 = 0;
      goto LABEL_12;
    }
    id v14 = (void *)MEMORY[0x1E4F83770];
    id v15 = @"You can’t share folders that contain items shared with you.";
  }
  uint64_t v16 = [v14 localizedFrameworkStringForKey:v15 value:v15 table:0 allowSiri:1];
  v17 = (void *)v16;
  if (v13 && v16)
  {
    [a1 postAlertWithOKButtonWithTitle:v13 message:v16 presentingViewController:v8 completionHandler:v9];
    goto LABEL_16;
  }
LABEL_12:
  id v18 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:presentingViewController:completionHandler:](v18);
  }

  if (v9) {
    v9[2](v9);
  }
LABEL_16:
}

uint64_t __145__ICMoveAlertUtilities_postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPasswordProtected];
}

uint64_t __145__ICMoveAlertUtilities_postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSharedRootObject]) {
    uint64_t v3 = [v2 isOwnedByCurrentUser] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (void)postAlertForOwnerStoppedSharingCurrentFolderWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 localizedFrameworkStringForKey:@"Sharing Stopped" value:@"Sharing Stopped" table:0 allowSiri:1];
  id v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"The owner stopped sharing this folder. It’s no longer available." value:@"The owner stopped sharing this folder. It’s no longer available." table:0 allowSiri:1];
  [a1 postAlertWithOKButtonWithTitle:v10 message:v9 presentingViewController:v8 completionHandler:v7];
}

+ (void)postAlertForSharingFolderWithSharedNotes:(id)a3 sharedSubfolders:(id)a4 presentingViewController:(id)a5 shareHandler:(id)a6 cancelHandler:(id)a7
{
  id v24 = a3;
  int v12 = (void *)MEMORY[0x1E4F83770];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = [v12 localizedFrameworkStringForKey:@"Sharing this folder will change who can read and edit all notes within it." value:@"Sharing this folder will change who can read and edit all notes within it." table:0 allowSiri:1];
  uint64_t v18 = [v16 count];

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E4F83770];
    v20 = @"This folder already contains shared notes and folders. People who currently have access to these may lose it.";
  }
  else if ([v24 count] == 1)
  {
    v19 = (void *)MEMORY[0x1E4F83770];
    v20 = @"This folder already contains a shared note. People who currently have access to this note may lose it.";
  }
  else
  {
    unint64_t v21 = [v24 count];
    v19 = (void *)MEMORY[0x1E4F83770];
    if (v21 < 2) {
      v20 = @"This folder is shared. People who currently have access to it may lose it.";
    }
    else {
      v20 = @"This folder already contains shared notes. People who currently have access to these notes may lose it.";
    }
  }
  v22 = [v19 localizedFrameworkStringForKey:v20 value:v20 table:0 allowSiri:1];
  v23 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Share" value:@"Share" table:0 allowSiri:1];
  [a1 postAlertWithProceedAndCancelButtonsWithTitle:v17 message:v22 proceedTitle:v23 presentingViewController:v15 proceedHandler:v14 cancelHandler:v13];
}

+ (void)postAlertForMovingFolderWithSharedNotes:(id)a3 sharedSubfolders:(id)a4 destination:(id)a5 presentingViewController:(id)a6 shareHandler:(id)a7 cancelHandler:(id)a8
{
  id v39 = a3;
  id v40 = a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  objc_opt_class();
  uint64_t v18 = ICDynamicCast();
  objc_opt_class();
  v19 = ICDynamicCast();
  objc_opt_class();
  v20 = ICDynamicCast();

  char v21 = [v19 isSharedViaICloud];
  v22 = [v18 localizedName];
  v23 = v22;
  id v38 = a1;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    uint64_t v25 = [v19 localizedTitle];
    uint64_t v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [v20 title];
    }
    id v24 = v27;
  }
  if (v21)
  {
    if ([v40 count] == 1)
    {
      v28 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Move Shared Folder?" value:@"Move Shared Folder?" table:0 allowSiri:1];
      v29 = NSString;
      v30 = (void *)MEMORY[0x1E4F83770];
      id v31 = @"If you move this folder, only people added to the shared folder “%@” will be able to access it.";
    }
    else
    {
      v28 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Move Shared Folders?" value:@"Move Shared Folders?" table:0 allowSiri:1];
      v29 = NSString;
      v30 = (void *)MEMORY[0x1E4F83770];
      id v31 = @"If you move these folders, only people added to the shared folder “%@” will be able to access them.";
    }
    v34 = [v30 localizedFrameworkStringForKey:v31 value:v31 table:0 allowSiri:1];
    v35 = objc_msgSend(v29, "localizedStringWithFormat:", v34, v24);
  }
  else
  {
    v28 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Moving this folder will change who can read and edit all notes within it." value:@"Moving this folder will change who can read and edit all notes within it." table:0 allowSiri:1];
    if ([v40 count])
    {
      v32 = (void *)MEMORY[0x1E4F83770];
      v33 = @"This folder already contains shared notes and folders. People who currently have access to these may lose it.";
    }
    else if ([v39 count] == 1)
    {
      v32 = (void *)MEMORY[0x1E4F83770];
      v33 = @"This folder already contains a shared note. People who currently have access to this note may lose it.";
    }
    else
    {
      unint64_t v36 = [v39 count];
      v32 = (void *)MEMORY[0x1E4F83770];
      if (v36 < 2) {
        v33 = @"This folder is shared. People who currently have access to it may lose it.";
      }
      else {
        v33 = @"This folder already contains shared notes. People who currently have access to these notes may lose it.";
      }
    }
    v35 = [v32 localizedFrameworkStringForKey:v33 value:v33 table:0 allowSiri:1];
  }
  v37 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Move Anyway" value:@"Move Anyway" table:0 allowSiri:1];
  [v38 postAlertWithProceedAndCancelButtonsWithTitle:v28 message:v35 proceedTitle:v37 presentingViewController:v16 proceedHandler:v15 cancelHandler:v14];
}

+ (void)postAlertForMovingNotesContainingSharedNotesToSharedFolder:(id)a3 destination:(id)a4 presentingViewController:(id)a5 shareHandler:(id)a6 cancelHandler:(id)a7
{
  id v39 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v39 count])
  {
    objc_opt_class();
    id v16 = ICDynamicCast();
    objc_opt_class();
    id v17 = ICDynamicCast();
    objc_opt_class();
    uint64_t v18 = ICDynamicCast();
    char v19 = [v17 isSharedViaICloud];
    id v38 = v16;
    v20 = [v16 localizedName];
    char v21 = v20;
    v37 = v17;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      v23 = [v17 localizedTitle];
      id v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = [v18 title];
      }
      id v22 = v25;
    }
    uint64_t v26 = [v39 count];
    if (v19)
    {
      id v36 = a1;
      if (v26 == 1)
      {
        id v27 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Move Shared Note?" value:@"Move Shared Note?" table:0 allowSiri:1];
        v28 = NSString;
        v29 = (void *)MEMORY[0x1E4F83770];
        v30 = @"If you move this note, only people added to the shared folder “%@” will be able to access it.";
      }
      else
      {
        id v27 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Move Shared Notes?" value:@"Move Shared Notes?" table:0 allowSiri:1];
        v28 = NSString;
        v29 = (void *)MEMORY[0x1E4F83770];
        v30 = @"If you move these notes, only people added to the shared folder “%@” will be able to access them.";
      }
      v33 = [v29 localizedFrameworkStringForKey:v30 value:v30 table:0 allowSiri:1];
      v34 = objc_msgSend(v28, "localizedStringWithFormat:", v33, v22);

      a1 = v36;
    }
    else
    {
      if (v26 == 1)
      {
        id v27 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Moving this note will change who can read and edit it." value:@"Moving this note will change who can read and edit it." table:0 allowSiri:1];
        id v31 = (void *)MEMORY[0x1E4F83770];
        v32 = @"People who currently have access to this note may lose it.";
      }
      else
      {
        id v27 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Moving these notes will change who can read and edit them." value:@"Moving these notes will change who can read and edit them." table:0 allowSiri:1];
        id v31 = (void *)MEMORY[0x1E4F83770];
        v32 = @"There are shared notes among them. People who currently have access to these notes may lose it.";
      }
      v34 = [v31 localizedFrameworkStringForKey:v32 value:v32 table:0 allowSiri:1];
    }
    v35 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Move Anyway" value:@"Move Anyway" table:0 allowSiri:1];
    [a1 postAlertWithProceedAndCancelButtonsWithTitle:v27 message:v34 proceedTitle:v35 presentingViewController:v13 proceedHandler:v14 cancelHandler:v15];
  }
}

+ (void)postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 localizedFrameworkStringForKey:@"Notes couldn’t be moved." value:@"Notes couldn’t be moved." table:0 allowSiri:1];
  id v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared notes can’t be moved to a different account." value:@"Shared notes can’t be moved to a different account." table:0 allowSiri:1];
  [a1 postAlertWithOKButtonWithTitle:v10 message:v9 presentingViewController:v8 completionHandler:v7];
}

+ (void)postAlertForMovingLockedNotesToOtherAccountIsCopy:(BOOL)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F83770];
  id v9 = a5;
  id v10 = a4;
  id v13 = [v8 localizedFrameworkStringForKey:@"One or more notes are locked." value:@"One or more notes are locked." table:0 allowSiri:1];
  if (a3) {
    int v11 = @"You must remove the lock from this note to copy it to a different account.";
  }
  else {
    int v11 = @"You must remove the lock from this note to move it to a different account.";
  }
  id v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
  [a1 postAlertWithOKButtonWithTitle:v13 message:v12 presentingViewController:v10 completionHandler:v9];
}

+ (void)postAlertForFolderDepthLimitWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  id v8 = a3;
  id v12 = [v6 localizedFrameworkStringForKey:@"Can’t move folder" value:@"Can’t move folder" table:0 allowSiri:1];
  uint64_t v9 = [MEMORY[0x1E4F83380] folderDepthLimit] + 1;
  id v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"FOLDER_DEPTH_LIMIT_MESSAGE_%lu" value:@"FOLDER_DEPTH_LIMIT_MESSAGE_%lu" table:0 allowSiri:1];
  int v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v10, v9);
  [a1 postAlertWithOKButtonWithTitle:v12 message:v11 presentingViewController:v8 completionHandler:v7];
}

+ (void)postAlertForUnsupportedAttachmentsInLegacyAccount:(id)a3 presentingViewController:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 localizedFrameworkStringForKey:@"The folder couldn’t be added because one or more notes have attachments." value:@"The folder couldn’t be added because one or more notes have attachments." table:0 allowSiri:1];
  uint64_t v9 = [v8 localizedAttachmentsNotSupportedReason];

  [a1 postAlertWithOKButtonWithTitle:v10 message:v9 presentingViewController:v7 completionHandler:0];
}

+ (void)postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:(id)a3 presentingViewController:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F83770];
  id v7 = a4;
  id v8 = a3;
  id v13 = [v6 localizedFrameworkStringForKey:@"Can’t Move Folder" value:@"Can’t Move Folder" table:0 allowSiri:1];
  uint64_t v9 = NSString;
  id v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Smart Folders using Shared and Mentions filters can’t be moved to the “%@” account." value:@"Smart Folders using Shared and Mentions filters can’t be moved to the “%@” account." table:0 allowSiri:1];
  int v11 = [v8 localizedName];

  id v12 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);

  [a1 postAlertWithOKButtonWithTitle:v13 message:v12 presentingViewController:v7 completionHandler:0];
}

+ (void)postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:(os_log_t)log presentingViewController:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "alert title or message is not set when running postAlertForMovingFolderContainingLockedOrJoinedNotesWithGuiltyObjects:CompletionHandler:", v1, 2u);
}

@end