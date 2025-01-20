@interface PXCMMPhotoKitMessageComposeActionPerformer
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)performUserInteractionTask;
@end

@implementation PXCMMPhotoKitMessageComposeActionPerformer

- (void).cxx_destruct
{
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = (MFMessageComposeViewController *)a3;
  if (a4 == 2)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1008, @"Message Compose reported send failure");
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      char v10 = 1;
      goto LABEL_9;
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1007, @"User cancelled Message Compose");
  }
  v8 = (MFMessageComposeViewController *)v7;
  v9 = PLSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Failed to send CMM message with error: %@", buf, 0xCu);
  }

  char v10 = 0;
LABEL_9:
  if (v6 && self->_messageComposeViewController == v6)
  {
    int v14 = 1;
  }
  else
  {
    v11 = PLSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      messageComposeViewController = self->_messageComposeViewController;
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      __int16 v31 = 2112;
      v32 = messageComposeViewController;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Unexpected controller: %@ expected: %@", buf, 0x16u);
    }

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1007, @"Unexpected controller");

    int v14 = 0;
    char v10 = 0;
    v8 = (MFMessageComposeViewController *)v13;
  }
  objc_initWeak((id *)buf, self);
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __95__PXCMMPhotoKitMessageComposeActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke;
  v25 = &unk_1E5DD0928;
  objc_copyWeak(&v27, (id *)buf);
  char v28 = v10;
  v15 = v8;
  v26 = v15;
  v16 = _Block_copy(&aBlock);
  v17 = v16;
  if (v14)
  {
    if (![(PXActionPerformer *)self dismissViewController:v6 completionHandler:v16])
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      v19 = PXLocalizedStringFromTable(@"PXCMMShareError", @"PhotosUICore");
      v20 = objc_msgSend(v18, "px_errorWithDomain:code:underlyingError:localizedDescription:", @"PXCMMErrorDomain", -1005, 0, @"%@", v19, aBlock, v23, v24, v25);

      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v20];
    }
  }
  else
  {
    (*((void (**)(void *))v16 + 2))(v16);
  }
  [(MFMessageComposeViewController *)v6 setMessageComposeDelegate:0];
  v21 = self->_messageComposeViewController;
  self->_messageComposeViewController = 0;

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __95__PXCMMPhotoKitMessageComposeActionPerformer_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)performUserInteractionTask
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v4 = PLSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(PXCMMShowMessageComposeActionPerformer *)self shareURL];
    v6 = objc_msgSend(v5, "pl_redactedShareURL");
    *(_DWORD *)buf = 138412546;
    v47 = self;
    __int16 v48 = 2114;
    v49 = v6;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Performer: %@ Presenting Message Compose for URL %{public}@", buf, 0x16u);
  }
  if (([getMFMessageComposeViewControllerClass() canSendText] & 1) == 0)
  {
    char v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1010, @"Unable to send text");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v10];
    goto LABEL_37;
  }
  PLSharingGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ActionPerformerMessageComposeViewController", " enableTelemetry=YES ", buf, 2u);
    }
  }

  char v10 = [(PXCMMShowMessageComposeActionPerformer *)self shareURL];
  int v11 = PLIsMobileSlideShow();
  if (v11)
  {
    uint64_t v12 = PXMessageForMomentShareURL(v10);
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (MFMessageComposeViewController *)objc_alloc_init((Class)getMFMessageComposeViewControllerClass());
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = v13;

  [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:self];
  if (v12)
  {
    [(MFMessageComposeViewController *)self->_messageComposeViewController setMessage:v12];
    goto LABEL_20;
  }
  v15 = PLSharingGetLog();
  v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "pl_redactedShareURL");
      v17 = (PXCMMPhotoKitMessageComposeActionPerformer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v17;
      v18 = "Message Compose Action: Unable to create MSMessage for URL: %{public}@. Falling back to plain link";
      v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_18:
      _os_log_impl(&dword_1A9AE7000, v19, v20, v18, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "pl_redactedShareURL");
    v17 = (PXCMMPhotoKitMessageComposeActionPerformer *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v17;
    v18 = "Share Sheet: Live Bubbles not supported. Sending moment share URL as text: %{public}@";
    v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }

  v21 = [v10 absoluteString];
  [(MFMessageComposeViewController *)self->_messageComposeViewController setBody:v21];

LABEL_20:
  SEL v39 = a2;
  v40 = (void *)v12;
  PLSharingGetLog();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, self);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, OS_SIGNPOST_INTERVAL_END, v24, "ActionPerformerMessageComposeViewController", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v25 = [MEMORY[0x1E4F1CA48] array];
  v26 = [(PXCMMActionPerformer *)self session];
  id v27 = [v26 viewModel];
  char v28 = [v27 recipients];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v29 = v28;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "suggestedTransport", v39, v40, (void)v41);
        uint64_t v35 = [v34 addressKind];
        if ((unint64_t)(v35 - 1) >= 2)
        {
          if (!v35)
          {
            v38 = [MEMORY[0x1E4F28B00] currentHandler];
            [v38 handleFailureInMethod:v39 object:self file:@"PXCMMPhotoKitMessageComposeActionPerformer.m" lineNumber:84 description:@"Code which should be unreachable has been reached"];

            abort();
          }
        }
        else
        {
          v36 = [v34 address];
          [v25 addObject:v36];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v31);
  }

  [(MFMessageComposeViewController *)self->_messageComposeViewController setRecipients:v25];
  if (!self->_messageComposeViewController
    || !-[PXActionPerformer presentViewController:](self, "presentViewController:"))
  {
    v37 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to present the message compose view controller", v39);
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v37];
  }
LABEL_37:
}

@end