@interface ICCompatibilityAlertHelper
+ (id)oneTimeAlertKeyForAccount:(id)a3;
+ (void)showAttachmentCompatibilityAlertInAccountIfNeeded:(id)a3 parentViewController:(id)a4 completion:(id)a5;
+ (void)showCompatibilityAlertForAccountIfNeeded:(id)a3 title:(id)a4 alertMessage:(id)a5 defaultButtonTitle:(id)a6 secondaryButtonTitle:(id)a7 postscript:(id)a8 parentViewController:(id)a9 hasShownAlertKey:(id)a10 minimumNotesVersion:(int64_t)a11 completion:(id)a12;
+ (void)showCompatibilityAlertForInlineAttachmentsInAccountIfNeeded:(id)a3 parentViewController:(id)a4 completion:(id)a5;
+ (void)showCompatibilityAlertWithDeviceMessage:(id)a3 title:(id)a4 alertMessage:(id)a5 defaultButtonTitle:(id)a6 secondaryButtonTitle:(id)a7 postscript:(id)a8 parentViewController:(id)a9 completion:(id)a10;
+ (void)suppressOneTimeAttachmentUpgradeAlertForAcccount:(id)a3;
@end

@implementation ICCompatibilityAlertHelper

+ (void)showCompatibilityAlertForAccountIfNeeded:(id)a3 title:(id)a4 alertMessage:(id)a5 defaultButtonTitle:(id)a6 secondaryButtonTitle:(id)a7 postscript:(id)a8 parentViewController:(id)a9 hasShownAlertKey:(id)a10 minimumNotesVersion:(int64_t)a11 completion:(id)a12
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  v25 = (void *)MEMORY[0x1E4F83330];
  id v26 = a3;
  v27 = [v25 sharedController];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __210__ICCompatibilityAlertHelper_showCompatibilityAlertForAccountIfNeeded_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_hasShownAlertKey_minimumNotesVersion_completion___block_invoke;
  v37[3] = &unk_1E5FDC0C8;
  id v45 = v24;
  id v46 = a1;
  id v38 = v23;
  id v39 = v17;
  id v40 = v18;
  id v41 = v19;
  id v42 = v20;
  id v43 = v21;
  id v44 = v22;
  id v28 = v22;
  id v29 = v21;
  id v30 = v20;
  id v31 = v19;
  id v32 = v18;
  id v33 = v17;
  id v34 = v24;
  id v35 = v23;
  [v27 messageForAccount:v26 minimumNotesVersion:a11 completionHandler:v37];
}

void __210__ICCompatibilityAlertHelper_showCompatibilityAlertForAccountIfNeeded_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_hasShownAlertKey_minimumNotesVersion_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[4];
  v6 = v3;
  id v13 = a1[11];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  id v10 = a1[8];
  id v11 = a1[9];
  id v12 = a1[10];
  id v4 = v3;
  performBlockOnMainThread();
}

uint64_t __210__ICCompatibilityAlertHelper_showCompatibilityAlertForAccountIfNeeded_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_hasShownAlertKey_minimumNotesVersion_completion___block_invoke_2(uint64_t result)
{
  if (isShowingCompatibilityAlert) {
    return result;
  }
  uint64_t v1 = result;
  objc_opt_class();
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:*(void *)(v1 + 32)];
  id v4 = ICDynamicCast();
  int v5 = [v4 BOOLValue];

  if (!v5)
  {
    if (!*(void *)(v1 + 40)) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v6 = [MEMORY[0x1E4F83330] sharedController];
  if (([v6 fakesIncompatibleDevicesForDebugging] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(v1 + 40);

  if (v7)
  {
LABEL_7:
    id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKey:*(void *)(v1 + 32)];

    return [*(id *)(v1 + 104) showCompatibilityAlertWithDeviceMessage:*(void *)(v1 + 40) title:*(void *)(v1 + 48) alertMessage:*(void *)(v1 + 56) defaultButtonTitle:*(void *)(v1 + 64) secondaryButtonTitle:*(void *)(v1 + 72) postscript:*(void *)(v1 + 80) parentViewController:*(void *)(v1 + 88) completion:*(void *)(v1 + 96)];
  }
LABEL_9:
  result = *(void *)(v1 + 96);
  if (result)
  {
    id v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

+ (void)showCompatibilityAlertWithDeviceMessage:(id)a3 title:(id)a4 alertMessage:(id)a5 defaultButtonTitle:(id)a6 secondaryButtonTitle:(id)a7 postscript:(id)a8 parentViewController:(id)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v34 = a6;
  id v33 = a7;
  id v18 = a8;
  id v32 = a9;
  id v19 = a10;
  isShowingCompatibilityAlert = 1;
  id v31 = v15;
  if (v18 && [v18 length])
  {
    id v20 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@:\n\n%@\n\n%@" value:@"%@:\n\n%@\n\n%@" table:0 allowSiri:1];
    objc_msgSend(NSString, "localizedStringWithFormat:", v20, v17, v15, v18);
  }
  else
  {
    id v20 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@:\n\n%@" value:@"%@:\n\n%@" table:0 allowSiri:1];
    objc_msgSend(NSString, "localizedStringWithFormat:", v20, v17, v15, v30);
  id v21 = };

  id v22 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v16 message:v21 preferredStyle:1];
  id v23 = (void *)MEMORY[0x1E4FB1410];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke;
  v37[3] = &unk_1E5FDAA38;
  id v24 = v16;
  id v25 = v19;
  id v38 = v25;
  id v26 = [v23 actionWithTitle:v33 style:0 handler:v37];
  [v22 addAction:v26];
  v27 = (void *)MEMORY[0x1E4FB1410];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke_2;
  v35[3] = &unk_1E5FDAA38;
  id v36 = v25;
  id v28 = v25;
  id v29 = [v27 actionWithTitle:v34 style:0 handler:v35];
  [v22 addAction:v29];
  [v32 presentViewController:v22 animated:1 completion:0];
}

uint64_t __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke(uint64_t a1)
{
  isShowingCompatibilityAlert = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 1);
  }
  return result;
}

uint64_t __172__ICCompatibilityAlertHelper_showCompatibilityAlertWithDeviceMessage_title_alertMessage_defaultButtonTitle_secondaryButtonTitle_postscript_parentViewController_completion___block_invoke_2(uint64_t a1)
{
  isShowingCompatibilityAlert = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

+ (void)showCompatibilityAlertForInlineAttachmentsInAccountIfNeeded:(id)a3 parentViewController:(id)a4 completion:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F83770];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v18 = [v8 localizedFrameworkStringForKey:@"Note Hidden on Some Devices" value:@"Note Hidden on Some Devices" table:0 allowSiri:1];
  id v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes with tags or mentions are only viewable on iOS 14.5, iPadOS 14.5, and macOS 11.3 and later. Your devices that need upgrading", @"Notes with tags or mentions are only viewable on iOS 14.5, iPadOS 14.5, and macOS 11.3 and later. Your devices that need upgrading", 0, 1 value table allowSiri];
  id v13 = NSString;
  v14 = [v11 identifier];
  id v15 = [v13 stringWithFormat:@"ICInlineAttachmentOneTimeAlertKey-%@", v14];

  id v16 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  id v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Learn More" value:@"Learn More" table:0 allowSiri:1];
  [a1 showCompatibilityAlertForAccountIfNeeded:v11 title:v18 alertMessage:v12 defaultButtonTitle:v16 secondaryButtonTitle:v17 postscript:0 parentViewController:v10 hasShownAlertKey:v15 minimumNotesVersion:6 completion:v9];
}

+ (void)showAttachmentCompatibilityAlertInAccountIfNeeded:(id)a3 parentViewController:(id)a4 completion:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F83770];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v17 = [v8 localizedFrameworkStringForKey:@"Edit Attachment?" value:@"Edit Attachment?" table:0 allowSiri:1];
  id v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Editing this attachment will make it read-only on your devices using an older OS version" value:@"Editing this attachment will make it read-only on your devices using an older OS version" table:0 allowSiri:1];
  id v13 = +[ICCompatibilityAlertHelper oneTimeAlertKeyForAccount:v11];
  v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You can continue editing this attachment or discard the change you made." value:@"You can continue editing this attachment or discard the change you made." table:0 allowSiri:1];
  id v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Continue Editing" value:@"Continue Editing" table:0 allowSiri:1];
  id v16 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Discard Changes" value:@"Discard Changes" table:0 allowSiri:1];
  [a1 showCompatibilityAlertForAccountIfNeeded:v11 title:v17 alertMessage:v12 defaultButtonTitle:v15 secondaryButtonTitle:v16 postscript:v14 parentViewController:v10 hasShownAlertKey:v13 minimumNotesVersion:13 completion:v9];
}

+ (id)oneTimeAlertKeyForAccount:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 identifier];
  int v5 = [v3 stringWithFormat:@"ICAttachmentOneTimeAlertKey-%lld-%@", 15, v4];

  return v5;
}

+ (void)suppressOneTimeAttachmentUpgradeAlertForAcccount:(id)a3
{
  id v4 = +[ICCompatibilityAlertHelper oneTimeAlertKeyForAccount:a3];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:v4];
}

@end