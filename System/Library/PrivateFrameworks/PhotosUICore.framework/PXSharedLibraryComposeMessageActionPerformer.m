@interface PXSharedLibraryComposeMessageActionPerformer
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)performActionWithInvitationURL:(id)a3 originatorDisplayName:(id)a4 recipients:(id)a5 completionHandler:(id)a6;
- (void)performUserInteractionTask;
@end

@implementation PXSharedLibraryComposeMessageActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_invitationURL, 0);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:0];
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = 0;

  if (!a4)
  {
    v11 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Compose Message Action: Message send: user cancelled or MessagesViewServices crashed", buf, 2u);
    }

    v9 = PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Compose Message Action");
    goto LABEL_14;
  }
  if (a4 == 2)
  {
    v12 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Compose Message Action: Message send: failed", buf, 2u);
    }

    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Message send: failed");
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    v9 = 0;
LABEL_14:
    char v10 = 0;
    goto LABEL_15;
  }
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Compose Message Action: Message send: successful", buf, 2u);
  }

  v9 = 0;
  char v10 = 1;
LABEL_15:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__PXSharedLibraryComposeMessageActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke;
  v16[3] = &unk_1E5DD21E8;
  v16[4] = self;
  char v18 = v10;
  id v13 = v9;
  id v17 = v13;
  if (![(PXActionPerformer *)self dismissViewController:v6 completionHandler:v16])
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXSharedLibraryErrorDomain" code:-1000 userInfo:0];
    v15 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Compose Message Action: Failed to dismiss the message compose view controller", buf, 2u);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v14];
  }
}

uint64_t __97__PXSharedLibraryComposeMessageActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)performUserInteractionTask
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = +[PXSharedLibrarySettings sharedInstance];
  uint64_t v4 = [v3 simulateErrorType];

  if (v4 == 7)
  {
    v5 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Simulated Error: Send Invite Failed", v16, 2u);
    }

    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Send Invite Failed");
    goto LABEL_19;
  }
  if (([getMFMessageComposeViewControllerClass_295455() canSendText] & 1) == 0)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"MFMessageComposeViewController can't send text");
    v14 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      v15 = "Compose Message Action: MFMessageComposeViewController can't send text";
LABEL_17:
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    }
LABEL_18:

LABEL_19:
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6, *(void *)v16);
    goto LABEL_20;
  }
  v7 = (MFMessageComposeViewController *)objc_alloc_init((Class)getMFMessageComposeViewControllerClass_295455());
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = v7;

  [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:self];
  if (!self->_messageComposeViewController)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Failed to create MFMessageComposeViewController");
    v14 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      v15 = "Compose Message Action: Failed to create the MFMessageComposeViewController";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v9 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    invitationURL = self->_invitationURL;
    recipients = self->_recipients;
    *(_DWORD *)v16 = 138412546;
    *(void *)&v16[4] = invitationURL;
    __int16 v17 = 2112;
    char v18 = recipients;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Compose Message Action: Will send message with invitation URL: %@, recipients: %@", v16, 0x16u);
  }

  id v6 = PXSharedLibraryLinkMetadataDataRepresentationForInvitationURL(self->_invitationURL, self->_displayName);
  [(MFMessageComposeViewController *)self->_messageComposeViewController addRichLinkData:v6 withWebpageURL:self->_invitationURL];
  [(MFMessageComposeViewController *)self->_messageComposeViewController setBody:0];
  [(MFMessageComposeViewController *)self->_messageComposeViewController setShouldHideClearPluginButton:1];
  [(MFMessageComposeViewController *)self->_messageComposeViewController setRecipients:self->_recipients];
  if (![(PXActionPerformer *)self presentViewController:self->_messageComposeViewController])
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Failed to present MFMessageComposeViewController");
    id v13 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Compose Message Action: Failed to present MFMessageComposeViewController", v16, 2u);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v12];
  }
LABEL_20:
}

- (void)performActionWithInvitationURL:(id)a3 originatorDisplayName:(id)a4 recipients:(id)a5 completionHandler:(id)a6
{
  v11 = (NSURL *)a3;
  id v23 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXSharedLibraryComposeMessageActionPerformer+iOS.m", 38, @"Invalid parameter not satisfying: %@", @"invitationURL" object file lineNumber description];
  }
  if (v23)
  {
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryComposeMessageActionPerformer+iOS.m", 39, @"Invalid parameter not satisfying: %@", @"displayName" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryComposeMessageActionPerformer+iOS.m", 40, @"Invalid parameter not satisfying: %@", @"recipients" object file lineNumber description];

LABEL_5:
  invitationURL = self->_invitationURL;
  self->_invitationURL = v11;
  v15 = v11;

  v16 = (NSString *)[v23 copy];
  displayName = self->_displayName;
  self->_displayName = v16;

  char v18 = (NSArray *)[v12 copy];
  recipients = self->_recipients;
  self->_recipients = v18;

  [(PXActionPerformer *)self performActionWithCompletionHandler:v13];
}

@end