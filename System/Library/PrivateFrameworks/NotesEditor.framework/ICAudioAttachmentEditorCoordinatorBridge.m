@interface ICAudioAttachmentEditorCoordinatorBridge
+ (void)renameAttachment:(id)a3 presentingViewController:(id)a4;
@end

@implementation ICAudioAttachmentEditorCoordinatorBridge

+ (void)renameAttachment:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  v6 = (objc_class *)MEMORY[0x263F3AA40];
  id v7 = a4;
  id v8 = [v6 alloc];
  v9 = [v5 title];
  v10 = (void *)[v8 initWithExistingTitle:v9];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__ICAudioAttachmentEditorCoordinatorBridge_renameAttachment_presentingViewController___block_invoke;
  v12[3] = &unk_2640B9D28;
  id v13 = v5;
  id v11 = v5;
  [v10 showFromViewController:v7 completion:v12];
}

void __86__ICAudioAttachmentEditorCoordinatorBridge_renameAttachment_presentingViewController___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [[ICDocCamScannedDocumentEditor alloc] initWithGalleryAttachment:*(void *)(a1 + 32)];
    [(ICDocCamScannedDocumentEditor *)v4 updateDocumentTitle:v3 isUserDefined:1];
  }
}

@end