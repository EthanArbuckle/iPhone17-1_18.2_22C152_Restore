@interface ICBrickGalleryAttachmentView
- (ICGalleryAttachmentEditorController)galleryEditorController;
- (void)didChangeAttachmentTitle;
- (void)didChangeMergeableData;
- (void)galleryAttachmentEditorControllerDeleteAttachment;
- (void)galleryAttachmentEditorControllerDidDismiss;
- (void)openAttachment;
- (void)setGalleryEditorController:(id)a3;
@end

@implementation ICBrickGalleryAttachmentView

- (void)openAttachment
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 identifier];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "No sub attachments downloaded for %@", (uint8_t *)&v4, 0xCu);
}

- (void)didChangeAttachmentTitle
{
  v3 = [(ICBrickGalleryAttachmentView *)self galleryEditorController];
  [v3 attachmentTitleDidChange];

  [(ICBrickTextAttachmentView *)self requestAttachmentContentUpdate];
}

- (void)didChangeMergeableData
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICBrickGalleryAttachmentView_didChangeMergeableData__block_invoke;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__ICBrickGalleryAttachmentView_didChangeMergeableData__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) requestAttachmentContentUpdate];
  v2 = [*(id *)(a1 + 32) galleryEditorController];
  char v3 = [v2 updateDocumentViewControllerFromModel];

  if ((v3 & 1) == 0)
  {
    int v4 = *(void **)(a1 + 32);
    [v4 setGalleryEditorController:0];
  }
}

- (void)galleryAttachmentEditorControllerDidDismiss
{
}

- (void)galleryAttachmentEditorControllerDeleteAttachment
{
}

- (ICGalleryAttachmentEditorController)galleryEditorController
{
  return self->_galleryEditorController;
}

- (void)setGalleryEditorController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end