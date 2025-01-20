@interface ICGalleryAttachmentEditorController
+ (id)activityTypeOrder;
- (BOOL)browserMode;
- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4;
- (BOOL)openEditorOnViewController:(id)a3 pageIndex:(unint64_t)a4 sourceView:(id)a5;
- (BOOL)shouldAllowEditing;
- (BOOL)updateDocumentViewControllerFromModel;
- (BOOL)useCustomRecropTransition;
- (CGSize)extractedDocumentControllerImageSizeForDocument:(id)a3;
- (ICAttachment)galleryAttachment;
- (ICAttachmentPreviewImageCache)thumbnailCache;
- (ICDocCamDocumentInfoCollection)documentInfoCollection;
- (ICDocCamExtractedDocumentViewController)extractedDocumentController;
- (ICDocCamImageCache)imageCache;
- (ICDocCamScannedDocumentEditor)editor;
- (ICGalleryAttachmentEditorController)initWithGalleryAttachment:(id)a3 browserMode:(BOOL)a4 delegate:(id)a5;
- (ICGalleryAttachmentEditorControllerDelegate)delegate;
- (ICNAEventReporter)eventReporter;
- (NSIndexPath)indexPathForRecrop;
- (UIImage)filteredImageForRecrop;
- (UIImage)unfilteredImageForRecrop;
- (UIView)sourceViewForZoomTransition;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)attachmentUIState;
- (id)documentCameraControllerCreateDataCryptorIfNecessary;
- (id)extractedDocumentControllerImageForDocument:(id)a3;
- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3;
- (id)extractedDocumentControllerTitle;
- (id)extractedDocumentControllerUncroppedImageForDocument:(id)a3;
- (id)extractedDocumentControllerUndoManager;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)scanDataDelegateWithIdentifier:(id)a3;
- (int64_t)orientationForRecrop;
- (void)applicationWillTerminate:(id)a3;
- (void)attachmentDidLoad:(id)a3;
- (void)attachmentTitleDidChange;
- (void)dealloc;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7;
- (void)documentCameraControllerDidCancel:(id)a3;
- (void)documentCameraControllerDidCancelWithPresentingViewController:(id)a3;
- (void)documentCameraControllerDidRetake:(id)a3 pageCount:(unint64_t)a4;
- (void)documentCameraPresentingViewController:(id)a3 didFinishWithInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7;
- (void)eventReporterLostSession:(id)a3;
- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5;
- (void)extractedDocumentController:(id)a3 shareDocument:(id)a4 sender:(id)a5;
- (void)extractedDocumentController:(id)a3 startMarkupOnDocument:(id)a4 inkStyle:(unint64_t)a5 startPresentBlock:(id)a6 dismissCompletionBlock:(id)a7;
- (void)extractedDocumentControllerDidApplyFilter:(signed __int16)a3 forDocument:(id)a4;
- (void)extractedDocumentControllerDidChangeTitle:(id)a3;
- (void)extractedDocumentControllerDidDeleteDocument:(id)a3;
- (void)extractedDocumentControllerDidMovePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 forDocument:(id)a5;
- (void)extractedDocumentControllerDidRotateDocument:(id)a3;
- (void)extractedDocumentControllerDidSelectCopyFromMenuForDocument:(id)a3;
- (void)extractedDocumentControllerDidSelectShareFromMenuForDocument:(id)a3 sourceRect:(CGRect)a4 sourceView:(id)a5;
- (void)extractedDocumentControllerDidTapAddImage;
- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3;
- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3 scanDataDelegate:(id)a4;
- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3;
- (void)extractedDocumentControllerLoadThumbnailForDocument:(id)a3 size:(CGSize)a4 completionBlock:(id)a5;
- (void)movePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewImageDidUpdate:(id)a3;
- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4;
- (void)setBrowserMode:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentInfoCollection:(id)a3;
- (void)setEditor:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setExtractedDocumentController:(id)a3;
- (void)setFilteredImageForRecrop:(id)a3;
- (void)setGalleryAttachment:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setIndexPathForRecrop:(id)a3;
- (void)setOrientationForRecrop:(int64_t)a3;
- (void)setSourceViewForZoomTransition:(id)a3;
- (void)setThumbnailCache:(id)a3;
- (void)setUnfilteredImageForRecrop:(id)a3;
- (void)setUseCustomRecropTransition:(BOOL)a3;
- (void)updateDocInfoForAttachment:(id)a3;
@end

@implementation ICGalleryAttachmentEditorController

- (ICGalleryAttachmentEditorController)initWithGalleryAttachment:(id)a3 browserMode:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICGalleryAttachmentEditorController;
  v10 = [(ICGalleryAttachmentEditorController *)&v29 init];
  v11 = v10;
  if (v10)
  {
    [(ICGalleryAttachmentEditorController *)v10 setDelegate:v9];
    [(ICGalleryAttachmentEditorController *)v11 setGalleryAttachment:v8];
    v12 = [[ICDocCamScannedDocumentEditor alloc] initWithGalleryAttachment:v8];
    [(ICGalleryAttachmentEditorController *)v11 setEditor:v12];

    [(ICGalleryAttachmentEditorController *)v11 setBrowserMode:v6];
    objc_opt_class();
    v13 = [v8 attachmentModel];
    v14 = ICCheckedDynamicCast();

    if ([v8 isPasswordProtected])
    {
      id v15 = objc_alloc(MEMORY[0x263F5AC08]);
      v16 = [v8 identifier];
      v17 = (void *)[v15 initWithObjectIdentifier:v16];
    }
    else
    {
      v17 = 0;
    }
    v18 = (void *)[objc_alloc(MEMORY[0x263F3AA10]) initWithDataCryptorDelegate:v17];
    [(ICGalleryAttachmentEditorController *)v11 setImageCache:v18];

    id v19 = objc_alloc_init(MEMORY[0x263F5ABA0]);
    [(ICGalleryAttachmentEditorController *)v11 setThumbnailCache:v19];

    id v20 = objc_alloc_init(MEMORY[0x263F3A9F8]);
    [(ICGalleryAttachmentEditorController *)v11 setDocumentInfoCollection:v20];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __86__ICGalleryAttachmentEditorController_initWithGalleryAttachment_browserMode_delegate___block_invoke;
    v27[3] = &unk_2640BAC50;
    v21 = v11;
    v28 = v21;
    [v14 enumerateSubAttachmentsWithBlock:v27];
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v21 selector:sel_applicationWillTerminate_ name:*MEMORY[0x263F833C8] object:0];

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v21 selector:sel_previewImageDidUpdate_ name:*MEMORY[0x263F5A978] object:0];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v21 selector:sel_attachmentDidLoad_ name:*MEMORY[0x263F5A948] object:0];

    v25 = [(ICGalleryAttachmentEditorController *)v21 galleryAttachment];
    objc_msgSend(v25, "ic_addObserver:forKeyPath:context:", v21, @"mergeableData", &compoundliteral_4);
  }
  return v11;
}

void __86__ICGalleryAttachmentEditorController_initWithGalleryAttachment_browserMode_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x210546100]();
  v7 = [v14 identifier];

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F3A9F0]) initWithDelegate:*(void *)(a1 + 32)];
    objc_msgSend(v8, "setCurrentFilter:", objc_msgSend(v14, "imageFilterType"));
    id v9 = [v14 identifier];
    [v8 setScanDataDelegateIdentifier:v9];

    objc_msgSend(v8, "setCurrentOrientation:", (int)objc_msgSend(v14, "orientation"));
    v10 = [v14 croppingQuad];
    [v8 setImageQuad:v10];

    v11 = [*(id *)(a1 + 32) documentInfoCollection];
    v12 = [v11 docInfos];
    [v12 addObject:v8];
  }
  v13 = [MEMORY[0x263F5B230] sharedGenerator];
  [v13 postProcessIfNeededForAttachment:v14];
}

- (void)dealloc
{
  [(ICAttachment *)self->_galleryAttachment ic_removeObserver:self forKeyPath:@"mergeableData" context:&compoundliteral_4];
  v3 = [(ICDocCamExtractedDocumentViewController *)self->_extractedDocumentController presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  [(ICDocCamImageCache *)self->_imageCache deleteAllImages];
  v5.receiver = self;
  v5.super_class = (Class)ICGalleryAttachmentEditorController;
  [(ICGalleryAttachmentEditorController *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([(ICGalleryAttachmentEditorController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/iOS/ICGalleryAttachmentEditorController.m"])
  {
    char v13 = [(ICGalleryAttachmentEditorController *)self ic_shouldIgnoreObserveValue:v11 ofObject:v12 forKeyPath:v10];

    if (a6 == &compoundliteral_4 && (v13 & 1) == 0)
    {
      id v14 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
      if ([v14 faultingState])
      {
      }
      else
      {
        int v15 = [v10 isEqualToString:@"mergeableData"];

        if (v15) {
          [(ICGalleryAttachmentEditorController *)self updateDocumentViewControllerFromModel];
        }
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ICGalleryAttachmentEditorController;
    [(ICGalleryAttachmentEditorController *)&v16 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v3 = [(ICGalleryAttachmentEditorController *)self imageCache];
  [v3 deleteAllImages];
}

- (void)previewImageDidUpdate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [v4 object];

  ICCheckedDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = (void *)MEMORY[0x263F5AB78];
  v7 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v8 = [v7 managedObjectContext];
  id v9 = objc_msgSend(v6, "ic_existingObjectWithID:context:", v12, v8);

  id v10 = [v9 parentAttachment];
  id v11 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];

  if (v10 == v11) {
    [(ICGalleryAttachmentEditorController *)self updateDocInfoForAttachment:v9];
  }
}

- (void)attachmentDidLoad:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [v4 object];

  ICCheckedDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = (void *)MEMORY[0x263F5AB78];
  v7 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v8 = [v7 managedObjectContext];
  id v9 = objc_msgSend(v6, "ic_existingObjectWithID:context:", v12, v8);

  id v10 = [v9 parentAttachment];
  id v11 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];

  if (v10 == v11) {
    [(ICGalleryAttachmentEditorController *)self updateDocInfoForAttachment:v9];
  }
}

- (void)updateDocInfoForAttachment:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 identifier];
  if (v5 && ([v4 markedForDeletion] & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v6 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
    v7 = [v6 docInfos];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        char v13 = [v12 scanDataDelegateIdentifier];
        char v14 = [v13 isEqualToString:v5];

        if (v14) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v15 = v12;

      if (!v15) {
        goto LABEL_14;
      }
      [v15 setCroppedAndFilteredImageUUID:0];
      objc_msgSend(v15, "setCurrentFilter:", objc_msgSend(v4, "imageFilterType"));
      objc_msgSend(v15, "setCurrentOrientation:", (int)objc_msgSend(v4, "orientation"));
      objc_super v16 = [v4 croppingQuad];
      [v15 setImageQuad:v16];

      v17 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
      [v17 didUpdateDocumentImage:v15];
    }
    else
    {
LABEL_11:

LABEL_14:
      [(ICGalleryAttachmentEditorController *)self updateDocumentViewControllerFromModel];
    }
  }
}

- (void)movePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v6 = [(ICGalleryAttachmentEditorController *)self editor];
  [v6 movePageFromIndex:a3 toIndex:a4];
}

- (BOOL)updateDocumentViewControllerFromModel
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  objc_opt_class();
  id v3 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v4 = [v3 attachmentModel];
  objc_super v5 = ICCheckedDynamicCast();

  id v6 = (void *)MEMORY[0x263EFF9A0];
  v7 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
  uint64_t v8 = [v7 docInfos];
  uint64_t v9 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v10 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
  uint64_t v11 = [v10 docInfos];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_super v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v17 = [v16 scanDataDelegateIdentifier];

        if (v17)
        {
          long long v18 = [v16 scanDataDelegateIdentifier];
          [v9 setObject:v16 forKeyedSubscript:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v13);
  }

  long long v19 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
  long long v20 = [v19 currentDocument];

  id v21 = objc_alloc_init(MEMORY[0x263F3A9F8]);
  uint64_t v43 = MEMORY[0x263EF8330];
  uint64_t v44 = 3221225472;
  v45 = __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke;
  v46 = &unk_2640BAC78;
  id v47 = v9;
  v48 = self;
  id v22 = v21;
  id v49 = v22;
  id v23 = v9;
  [v5 enumerateSubAttachmentsWithBlock:&v43];
  v24 = [v22 docInfos];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = [v22 docInfos];
    v27 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
    v28 = [v27 docInfos];
    char v29 = [v26 isEqualToArray:v28];

    if ((v29 & 1) == 0)
    {
      v30 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
      v31 = [v30 docInfos];
      [v31 removeAllObjects];

      v32 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
      v33 = [v32 docInfos];
      v34 = [v22 docInfos];
      [v33 addObjectsFromArray:v34];

      if (v20)
      {
        v35 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
        v36 = [v35 docInfos];
        if (![v36 count])
        {
LABEL_16:

          goto LABEL_17;
        }
        v37 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
        v38 = [v37 docInfos];
        uint64_t v42 = [v38 indexOfObject:v20];

        if (v42 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v35 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
          v36 = [v35 docInfos];
          uint64_t v39 = [v36 firstObject];

          long long v20 = (void *)v39;
          goto LABEL_16;
        }
      }
LABEL_17:
      v40 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
      [v40 didUpdateDocumentInfoArrayNewCurrentDocument:v20];
    }
  }

  return v25 != 0;
}

void __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if (v7
      || (v7 = (void *)[objc_alloc(MEMORY[0x263F3A9F0]) initWithDelegate:*(void *)(a1 + 40)],
          [v7 setScanDataDelegateIdentifier:v6],
          v7))
    {
      if (v5)
      {
        objc_msgSend(v7, "setCurrentFilter:", objc_msgSend(v5, "imageFilterType"));
        objc_msgSend(v7, "setCurrentOrientation:", (int)objc_msgSend(v5, "orientation"));
        uint64_t v8 = [v5 croppingQuad];
        [v7 setImageQuad:v8];
      }
      uint64_t v9 = [*(id *)(a1 + 48) docInfos];
      [v9 addObject:v7];
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke_cold_1(v10);
    }
  }
}

- (BOOL)shouldAllowEditing
{
  if ([(ICGalleryAttachmentEditorController *)self browserMode])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    int v3 = [v4 isReadOnly] ^ 1;
  }
  return v3;
}

- (BOOL)openEditorOnViewController:(id)a3 pageIndex:(unint64_t)a4 sourceView:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ICGalleryAttachmentEditorController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(ICGalleryAttachmentEditorController *)self delegate];
    [v12 galleryAttachmentEditorControllerWillShow];
  }
  uint64_t v13 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
  uint64_t v14 = [v13 docInfos];
  unint64_t v15 = [v14 count];

  if (v15 <= a4)
  {
    long long v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ICGalleryAttachmentEditorController openEditorOnViewController:pageIndex:sourceView:](v18);
    }
    BOOL v22 = 0;
  }
  else
  {
    objc_super v16 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
    v17 = [v16 docInfos];
    long long v18 = [v17 objectAtIndexedSubscript:a4];

    long long v19 = [(ICGalleryAttachmentEditorController *)self editor];
    long long v20 = [v18 scanDataDelegateIdentifier];
    id v21 = [v19 subAttachmentWithIdentifier:v20];

    BOOL v22 = v21 != 0;
    if (v21)
    {
      [MEMORY[0x263F3AA48] setCachedItem:0];
      if ([(ICGalleryAttachmentEditorController *)self shouldAllowEditing]) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = 2;
      }
      v24 = v8;
      id v25 = v9;
      id v26 = objc_alloc(MEMORY[0x263F3AA00]);
      v27 = [(ICGalleryAttachmentEditorController *)self documentInfoCollection];
      v28 = [(ICGalleryAttachmentEditorController *)self imageCache];
      char v29 = v26;
      id v9 = v25;
      id v8 = v24;
      v30 = (void *)[v29 initWithDelegate:self documentInfoCollection:v27 imageCache:v28 currentIndex:a4 mode:v23];

      [v30 setDelegate:self];
      [v30 setTransitioningDelegate:self];
      [v30 setModalPresentationStyle:4];
      [(ICGalleryAttachmentEditorController *)self setSourceViewForZoomTransition:v9];
      objc_opt_class();
      v31 = [v30 topViewController];
      v32 = ICCheckedDynamicCast();
      [(ICGalleryAttachmentEditorController *)self setExtractedDocumentController:v32];

      v33 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
      [v33 setTransitioningDelegate:self];

      v34 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
      [v34 setModalPresentationStyle:4];

      v35 = [v24 presentedViewController];

      if (v35)
      {
        v36 = [v24 presentedViewController];
        [v36 presentViewController:v30 animated:1 completion:0];
      }
      else
      {
        [v24 presentViewController:v30 animated:1 completion:0];
      }

      BOOL v22 = 1;
    }
    else
    {
      v37 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[ICGalleryAttachmentEditorController openEditorOnViewController:pageIndex:sourceView:](v18, v37);
      }
    }
  }

  return v22;
}

- (void)attachmentTitleDidChange
{
  id v5 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
  int v3 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v4 = [v3 title];
  [v5 didUpdateDocumentTitle:v4];
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  int v3 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  int v4 = [v3 isPasswordProtected];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F5AC08]);
    id v6 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    v7 = [v6 identifier];
    id v8 = (void *)[v5 initWithObjectIdentifier:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ICGalleryAttachmentEditorController *)self editor];
  char v11 = [v9 scanDataDelegateIdentifier];
  uint64_t v12 = [v10 subAttachmentWithIdentifier:v11];

  if (v12)
  {
    uint64_t v13 = [v12 unprocessedDocumentImage];
    uint64_t v14 = [v12 croppingQuad];
    uint64_t v15 = (int)[v12 orientation];
    id v16 = objc_alloc(MEMORY[0x263F3AA28]);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __86__ICGalleryAttachmentEditorController_extractedDocumentController_didTapRecrop_index___block_invoke;
    v40[3] = &unk_2640BACA0;
    id v37 = v9;
    id v17 = v9;
    id v41 = v17;
    uint64_t v42 = self;
    id v43 = v12;
    id v44 = v8;
    int64_t v45 = a5;
    int64_t v36 = a5;
    v38 = (void *)v14;
    uint64_t v18 = v14;
    id v19 = v44;
    long long v20 = (void *)[v16 initWithImage:v13 quad:v18 scanDataDelegate:v43 orientation:v15 completionHandler:v40];
    [v20 setShowImageAsAspectFit:1];
    [(ICGalleryAttachmentEditorController *)self setUseCustomRecropTransition:1];
    id v21 = [v19 navigationController];
    [v21 setDelegate:self];

    BOOL v22 = [v20 navigationController];
    [v22 setDelegate:self];

    uint64_t v23 = [v17 croppedAndFilteredImageUUID];

    if (v23)
    {
      v24 = [(ICGalleryAttachmentEditorController *)self imageCache];
      id v25 = [v17 croppedAndFilteredImageUUID];
      id v26 = [v24 getImage:v25];
    }
    else
    {
      id v26 = [(ICGalleryAttachmentEditorController *)self extractedDocumentControllerImageForDocument:v17];
    }
    id v39 = v8;
    char v29 = [v17 croppedButNotFilteredImageUUID];

    if (v29)
    {
      v30 = [(ICGalleryAttachmentEditorController *)self imageCache];
      v31 = [v17 croppedButNotFilteredImageUUID];
      v32 = [v30 getImage:v31];
    }
    else
    {
      v32 = [v19 croppedButNotFilteredImageForDocInfo:v17];
    }
    v33 = [MEMORY[0x263F088C8] indexPathForItem:v36 inSection:0];
    [(ICGalleryAttachmentEditorController *)self setIndexPathForRecrop:v33];

    [(ICGalleryAttachmentEditorController *)self setFilteredImageForRecrop:v26];
    v34 = objc_msgSend(objc_alloc(MEMORY[0x263F827E8]), "initWithCGImage:scale:orientation:", objc_msgSend(v32, "ic_CGImage"), objc_msgSend(v17, "currentOrientation"), 1.0);
    [(ICGalleryAttachmentEditorController *)self setUnfilteredImageForRecrop:v34];

    -[ICGalleryAttachmentEditorController setOrientationForRecrop:](self, "setOrientationForRecrop:", [v17 currentOrientation]);
    v35 = [v19 navigationController];
    [v35 pushViewController:v20 animated:1];

    id v8 = v39;
    id v9 = v37;
  }
  else
  {
    v27 = (void *)MEMORY[0x263F5AE60];
    v28 = [v9 scanDataDelegateIdentifier];
    [v27 handleFailedAssertWithCondition:"__objc_no", "-[ICGalleryAttachmentEditorController extractedDocumentController:didTapRecrop:index:]", 1, 0, @"Trying to recrop attachment with identifier, but identifier is not sub-attachment of gallery: %@", v28 functionName simulateCrash showAlert format];
  }
}

void __86__ICGalleryAttachmentEditorController_extractedDocumentController_didTapRecrop_index___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v22 = a3;
  id v7 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) setImageQuad:v7];
    id v8 = [*(id *)(a1 + 40) editor];
    [v8 setQuad:v7 forAttachment:*(void *)(a1 + 48)];

    [*(id *)(a1 + 56) didUpdateDocumentImage:*(void *)(a1 + 32)];
  }
  id v9 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];

  uint64_t v10 = *(void **)(a1 + 40);
  if (v9)
  {
    char v11 = [v10 imageCache];
    uint64_t v12 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];
    uint64_t v13 = [v11 getImage:v12];
  }
  else
  {
    uint64_t v13 = [v10 extractedDocumentControllerImageForDocument:*(void *)(a1 + 32)];
  }
  uint64_t v14 = [*(id *)(a1 + 32) croppedButNotFilteredImageUUID];

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 40) imageCache];
    id v16 = [*(id *)(a1 + 32) croppedButNotFilteredImageUUID];
    id v17 = [v15 getImage:v16];
  }
  else
  {
    id v17 = [*(id *)(a1 + 56) croppedButNotFilteredImageForDocInfo:*(void *)(a1 + 32)];
  }
  uint64_t v18 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 64) inSection:0];
  [*(id *)(a1 + 40) setIndexPathForRecrop:v18];

  [*(id *)(a1 + 40) setFilteredImageForRecrop:v13];
  id v19 = objc_msgSend(objc_alloc(MEMORY[0x263F827E8]), "initWithCGImage:scale:orientation:", objc_msgSend(v17, "ic_CGImage"), objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), 1.0);
  [*(id *)(a1 + 40) setUnfilteredImageForRecrop:v19];

  objc_msgSend(*(id *)(a1 + 40), "setOrientationForRecrop:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
  long long v20 = [*(id *)(a1 + 56) navigationController];
  id v21 = (id)[v20 popViewControllerAnimated:1];
}

- (void)extractedDocumentControllerDidTapAddImage
{
  if ([(ICGalleryAttachmentEditorController *)self documentCameraController:0 canAddImages:1])
  {
    id v3 = objc_alloc(MEMORY[0x263F3AA30]);
    int v4 = [(ICGalleryAttachmentEditorController *)self imageCache];
    id v19 = (id)[v3 initWithImageCache:v4 docCamDelegate:self remoteDocCamDelegate:self];

    [v19 setModalTransitionStyle:2];
    id v5 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
    id v6 = [v5 navigationController];
    [v6 presentViewController:v19 animated:1 completion:0];

    id v7 = [(ICGalleryAttachmentEditorController *)self eventReporter];
    id v8 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    id v9 = [v8 galleryModel];
    objc_msgSend(v7, "pushStartDocScanPageCountData:", objc_msgSend(v9, "subAttachmentCount"));

    uint64_t v10 = [(ICGalleryAttachmentEditorController *)self eventReporter];
    char v11 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    uint64_t v12 = [v11 identifier];
    [v10 pushDocScanDataWithID:v12 actionType:3 stage:1];

    uint64_t v13 = [(ICGalleryAttachmentEditorController *)self eventReporter];
    uint64_t v14 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    uint64_t v15 = [v14 note];
    id v16 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    id v17 = [v16 galleryModel];
    objc_msgSend(v13, "submitDocScanEventForNote:pageCount:", v15, objc_msgSend(v17, "subAttachmentCount"));
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x263F3AA58];
    id v19 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
    objc_msgSend(v18, "warnAboutMaxScansReachedForViewController:completionHandler:");
  }
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3 scanDataDelegate:(id)a4
{
  id v6 = a4;
  id v7 = [(ICGalleryAttachmentEditorController *)self delegate];
  id v8 = objc_msgSend(v7, "ic_viewControllerManager");

  objc_opt_class();
  id v9 = ICDynamicCast();

  objc_opt_class();
  uint64_t v10 = [(ICGalleryAttachmentEditorController *)self sourceViewForZoomTransition];
  char v11 = ICDynamicCast();

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    uint64_t v13 = [v8 currentAttachmentPresenter];
    [v13 scrollCollectionViewToIndexPath:v12];
    uint64_t v14 = [v13 transitionViewForAttachment:v9 atIndexPath:v12];
    [(ICGalleryAttachmentEditorController *)self setSourceViewForZoomTransition:v14];
  }
  uint64_t v15 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__ICGalleryAttachmentEditorController_extractedDocumentControllerDidTapDone_scanDataDelegate___block_invoke;
  v16[3] = &unk_2640B8140;
  v16[4] = self;
  [v15 dismissViewControllerAnimated:1 completion:v16];
}

uint64_t __94__ICGalleryAttachmentEditorController_extractedDocumentControllerDidTapDone_scanDataDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExtractedDocumentController:0];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 galleryAttachmentEditorControllerDidDismiss];

  id v3 = *(void **)(a1 + 32);

  return [v3 setSourceViewForZoomTransition:0];
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3
{
}

- (void)extractedDocumentControllerDidRotateDocument:(id)a3
{
  id v7 = a3;
  int v4 = [(ICGalleryAttachmentEditorController *)self editor];
  id v5 = [v7 scanDataDelegateIdentifier];
  uint64_t v6 = [v4 indexForAttachmentWithIdentifier:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "setOrientation:forAttachmentAtIndex:", objc_msgSend(v7, "currentOrientation"), v6);
  }
}

- (void)extractedDocumentControllerDidApplyFilter:(signed __int16)a3 forDocument:(id)a4
{
  id v8 = a4;
  id v5 = [(ICGalleryAttachmentEditorController *)self editor];
  uint64_t v6 = [v8 scanDataDelegateIdentifier];
  uint64_t v7 = [v5 indexForAttachmentWithIdentifier:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v5, "applyFilter:forAttachmentAtIndex:", objc_msgSend(v8, "currentFilter"), v7);
  }
}

- (void)extractedDocumentControllerDidDeleteDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(ICGalleryAttachmentEditorController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    id v8 = [v7 galleryModel];
    uint64_t v9 = [v8 subAttachmentCount];

    uint64_t v10 = [(ICGalleryAttachmentEditorController *)self editor];
    char v11 = [v4 scanDataDelegateIdentifier];
    uint64_t v12 = [v10 indexForAttachmentWithIdentifier:v11];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_opt_class();
      uint64_t v13 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
      uint64_t v14 = [v13 attachmentModel];
      uint64_t v15 = ICCheckedDynamicCast();

      if (v12 || [v15 subAttachmentCount] != 1)
      {
        id v16 = [MEMORY[0x263F088D0] indexSetWithIndex:v12];
        [v10 deletePagesAtIndexes:v16];
      }
      else
      {
        id v16 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __84__ICGalleryAttachmentEditorController_extractedDocumentControllerDidDeleteDocument___block_invoke;
        v26[3] = &unk_2640B8140;
        v26[4] = self;
        [v16 dismissViewControllerAnimated:1 completion:v26];
      }
    }
    id v17 = [(ICGalleryAttachmentEditorController *)self eventReporter];
    [v17 pushStartDocScanPageCountData:v9];

    uint64_t v18 = [(ICGalleryAttachmentEditorController *)self eventReporter];
    id v19 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    long long v20 = [v19 identifier];
    [v18 pushDocScanDataWithID:v20 actionType:4 stage:2];

    id v21 = [(ICGalleryAttachmentEditorController *)self eventReporter];
    id v22 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    uint64_t v23 = [v22 note];
    v24 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    id v25 = [v24 galleryModel];
    objc_msgSend(v21, "submitDocScanEventForNote:pageCount:", v23, objc_msgSend(v25, "subAttachmentCount"));
  }
}

void __84__ICGalleryAttachmentEditorController_extractedDocumentControllerDidDeleteDocument___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 galleryAttachmentEditorControllerDeleteAttachment];
}

- (void)extractedDocumentControllerDidMovePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 forDocument:(id)a5
{
  id v8 = a5;
  id v11 = [(ICGalleryAttachmentEditorController *)self editor];
  uint64_t v9 = [v8 scanDataDelegateIdentifier];

  uint64_t v10 = [v11 indexForAttachmentWithIdentifier:v9];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v11 movePageFromIndex:a3 toIndex:a4];
  }
}

- (id)extractedDocumentControllerTitle
{
  id v3 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v4 = [v3 title];
  uint64_t v5 = [v4 length];
  char v6 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  uint64_t v7 = v6;
  if (v5) {
    [v6 title];
  }
  else {
  id v8 = [v6 defaultTitle];
  }

  return v8;
}

- (void)extractedDocumentControllerDidChangeTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ICGalleryAttachmentEditorController *)self editor];
  [v5 updateDocumentTitle:v4 isUserDefined:1];
}

- (void)extractedDocumentController:(id)a3 shareDocument:(id)a4 sender:(id)a5
{
  v61[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICGalleryAttachmentEditorController *)self editor];
  uint64_t v12 = [v9 scanDataDelegateIdentifier];
  uint64_t v13 = [v11 indexForAttachmentWithIdentifier:v12];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    uint64_t v14 = [v9 scanDataDelegate];
    uint64_t v15 = ICDynamicCast();

    if (!v15)
    {
LABEL_22:

      goto LABEL_23;
    }
    long long v53 = v15;
    id v16 = [v8 scanCollectionDataDelegate];
    id v17 = [v16 activityItems];
    uint64_t v18 = [v9 croppedAndFilteredImageUUID];

    if (v18)
    {
      id v19 = [(ICGalleryAttachmentEditorController *)self imageCache];
      long long v20 = [v9 croppedAndFilteredImageUUID];
      uint64_t v21 = [v19 getImage:v20];

      id v22 = (void *)v21;
      if (!v21) {
        goto LABEL_21;
      }
    }
    else
    {
      id v22 = [(ICGalleryAttachmentEditorController *)self extractedDocumentControllerImageForDocument:v9];
      if (!v22)
      {
LABEL_21:

        uint64_t v15 = v53;
        goto LABEL_22;
      }
    }
    long long v52 = v16;
    id v49 = v22;
    if ([(ICGalleryAttachmentEditorController *)self shouldAllowEditing])
    {
      long long v50 = [v8 currentImageView];
      [v22 size];
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      v27 = [ICMarkupActivity alloc];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke;
      v58[3] = &__block_descriptor_48_e47__CGRect__CGPoint_dd__CGSize_dd__16__0__UIView_8l;
      v58[4] = v24;
      v58[5] = v26;
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke_2;
      v54[3] = &unk_2640BACE8;
      id v55 = v9;
      v56 = self;
      id v57 = v8;
      id v28 = [(ICMarkupActivity *)v27 initFromView:v50 presentingViewController:v57 frameBlock:v58 completionBlock:v54];
      [v28 setInkStyle:1];
      v61[0] = v28;
      char v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:1];
      v30 = [[ICMarkupActivityItem alloc] initWithAttachment:v53];
      uint64_t v31 = [v17 arrayByAddingObject:v30];

      id v17 = (void *)v31;
    }
    else
    {
      char v29 = 0;
    }
    if (+[ICDocCamArchiveExporter archiveExportingEnabled])
    {
      v32 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
      v33 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
      v34 = +[ICDocCamArchiveExporter exportAsArchiveActivityWithBarButtonItem:v10 presentingVC:v32 fromGalleryAttachment:v33];

      uint64_t v35 = objc_msgSend(v29, "ic_arrayByAddingNonNilObject:", v34);

      char v29 = (void *)v35;
    }
    int64_t v36 = [[ICAttachmentActivityViewController alloc] initWithActivityItems:v17 applicationActivities:v29];
    id v37 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];

    if (!v37) {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.galleryAttachment) != nil)", "-[ICGalleryAttachmentEditorController extractedDocumentController:shareDocument:sender:]", 1, 0, @"Expected non-nil value for '%s'", "self.galleryAttachment");
    }
    long long v51 = v17;
    v38 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    if (v38)
    {
      id v39 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
      v60 = v39;
      v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
      [(ICAttachmentActivityViewController *)v36 setAttachments:v40];
    }
    else
    {
      [(ICAttachmentActivityViewController *)v36 setAttachments:MEMORY[0x263EFFA68]];
    }

    id v41 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    uint64_t v42 = [v41 note];
    id v43 = [v42 account];
    -[ICAttachmentActivityViewController setIsContentManaged:](v36, "setIsContentManaged:", [v43 isManaged]);

    uint64_t v44 = *MEMORY[0x263F6BCF8];
    v59[0] = *MEMORY[0x263F5AE08];
    v59[1] = v44;
    v59[2] = *MEMORY[0x263F6BD58];
    int64_t v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
    [(ICAttachmentActivityViewController *)v36 setExcludedActivityTypes:v45];

    v46 = [(id)objc_opt_class() activityTypeOrder];
    [(ICAttachmentActivityViewController *)v36 setActivityTypeOrder:v46];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
      uint64_t v47 = -2;
    }
    else {
      uint64_t v47 = 7;
    }
    [(ICAttachmentActivityViewController *)v36 setModalPresentationStyle:v47];
    [v8 presentViewController:v36 animated:1 completion:0];
    v48 = [(ICAttachmentActivityViewController *)v36 popoverPresentationController];
    [v48 setBarButtonItem:v10];
    [v48 setPermittedArrowDirections:3];

    id v17 = v51;
    id v16 = v52;
    id v22 = v49;
    goto LABEL_21;
  }
LABEL_23:
}

uint64_t __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F827E8];
  [a2 bounds];

  return objc_msgSend(v2, "ic_aspectFitImageFrameForViewWithFrame:imageSize:");
}

void __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke_2(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F827E8] imageWithData:a2];
    if (v3)
    {
      id v8 = v3;
      id v4 = [a1[4] croppedAndFilteredImageUUID];

      id v5 = [a1[5] imageCache];
      char v6 = [a1[4] metaData];
      if (v4)
      {
        uint64_t v7 = [a1[4] croppedAndFilteredImageUUID];
        [v5 replaceImage:v8 metaData:v6 uuid:v7];
      }
      else
      {
        uint64_t v7 = [v5 setImage:v8 metaData:v6];
        [a1[4] setCroppedAndFilteredImageUUID:v7];
      }

      [a1[6] didUpdateDocumentImage:a1[4]];
      id v3 = v8;
    }
  }
}

+ (id)activityTypeOrder
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F6BCF8];
  v6[0] = @"com.apple.mobilenotes.markup";
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263F6BCE8];
  v6[2] = *MEMORY[0x263F6BD40];
  v6[3] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

- (void)extractedDocumentControllerDidSelectShareFromMenuForDocument:(id)a3 sourceRect:(CGRect)a4 sourceView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v25[1] = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a3;
  objc_opt_class();
  uint64_t v13 = [v12 scanDataDelegate];

  uint64_t v14 = ICDynamicCast();

  uint64_t v15 = [ICAttachmentActivityViewController alloc];
  id v16 = [v14 activityItems];
  id v17 = [(ICAttachmentActivityViewController *)v15 initWithActivityItems:v16 applicationActivities:0];

  if (v14)
  {
    id v18 = v14;
LABEL_4:
    v25[0] = v18;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    [(ICAttachmentActivityViewController *)v17 setAttachments:v19];

    goto LABEL_5;
  }
  id v18 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  if (v18) {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((attachment) != nil)", "-[ICGalleryAttachmentEditorController extractedDocumentControllerDidSelectShareFromMenuForDocument:sourceRect:sourceView:]", 1, 0, @"Expected non-nil value for '%s'", "attachment");
  [(ICAttachmentActivityViewController *)v17 setAttachments:MEMORY[0x263EFFA68]];
LABEL_5:
  long long v20 = [v18 note];
  uint64_t v21 = [v20 account];
  -[ICAttachmentActivityViewController setIsContentManaged:](v17, "setIsContentManaged:", [v21 isManaged]);

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    uint64_t v22 = -2;
  }
  else {
    uint64_t v22 = 7;
  }
  [(ICAttachmentActivityViewController *)v17 setModalPresentationStyle:v22];
  uint64_t v23 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
  [v23 presentViewController:v17 animated:1 completion:0];

  uint64_t v24 = [(ICAttachmentActivityViewController *)v17 popoverPresentationController];
  objc_msgSend(v24, "setSourceRect:", x, y, width, height);
  [v24 setSourceView:v11];

  [v24 setPermittedArrowDirections:3];
}

- (void)extractedDocumentControllerDidSelectCopyFromMenuForDocument:(id)a3
{
  id v5 = [a3 scanDataDelegate];
  uint64_t v3 = [v5 image];
  id v4 = [MEMORY[0x263F82A18] generalPasteboard];
  [v4 setImage:v3];
}

- (CGSize)extractedDocumentControllerImageSizeForDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  if (!v5) {
    goto LABEL_4;
  }
  char v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x263F5AB78];
  id v8 = [v4 scanDataDelegateIdentifier];
  id v9 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v10 = [v9 managedObjectContext];
  id v11 = [v7 attachmentWithIdentifier:v8 context:v10];

  if (v11)
  {
    [v11 sizeWidth];
    double v13 = v12;
    [v11 sizeHeight];
    double v15 = v14;
  }
  else
  {
LABEL_4:
    double v13 = *MEMORY[0x263F001B0];
    double v15 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (id)extractedDocumentControllerImageForDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x263F5AB78];
    uint64_t v7 = [v4 scanDataDelegateIdentifier];
    id v8 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
    id v9 = [v8 managedObjectContext];
    id v10 = [v6 attachmentWithIdentifier:v7 context:v9];

    if (v10)
    {
      uint64_t v5 = [MEMORY[0x263F5B318] imageForSubAttachment:v10];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)extractedDocumentControllerUncroppedImageForDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  if (!v5)
  {
    id v11 = 0;
    goto LABEL_7;
  }
  char v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x263F5AB78];
  id v8 = [v4 scanDataDelegateIdentifier];
  id v9 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v10 = [v9 managedObjectContext];
  id v11 = [v7 attachmentWithIdentifier:v8 context:v10];

  if (!v11)
  {
LABEL_7:
    id v18 = 0;
    goto LABEL_13;
  }
  double v12 = [v11 media];
  int v13 = [v12 isPasswordProtected];

  double v14 = [v11 media];
  double v15 = v14;
  if (!v13)
  {
    double v16 = [v14 mediaURL];

    if (v16)
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x263F827E8], "ic_imageWithContentsOfURL:", v16);
      goto LABEL_10;
    }
LABEL_11:
    id v18 = 0;
    goto LABEL_12;
  }
  double v16 = [v14 decryptedData];

  if (!v16) {
    goto LABEL_11;
  }
  uint64_t v17 = [MEMORY[0x263F827E8] imageWithData:v16];
LABEL_10:
  id v18 = (void *)v17;
LABEL_12:

LABEL_13:

  return v18;
}

- (void)extractedDocumentControllerLoadThumbnailForDocument:(id)a3 size:(CGSize)a4 completionBlock:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  if (!v11) {
    goto LABEL_4;
  }
  double v12 = (void *)v11;
  int v13 = (void *)MEMORY[0x263F5AB78];
  double v14 = [v9 scanDataDelegateIdentifier];
  double v15 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  double v16 = [v15 managedObjectContext];
  uint64_t v17 = [v13 attachmentWithIdentifier:v14 context:v16];

  if (v17)
  {
    id v18 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
    id v19 = [v18 view];
    long long v20 = objc_msgSend(v19, "ic_appearanceInfo");
    uint64_t v21 = [(ICGalleryAttachmentEditorController *)self thumbnailCache];
    uint64_t v22 = [v17 objectID];
    uint64_t v23 = [v22 URIRepresentation];
    uint64_t v24 = [v23 absoluteString];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    void v25[2] = __112__ICGalleryAttachmentEditorController_extractedDocumentControllerLoadThumbnailForDocument_size_completionBlock___block_invoke;
    v25[3] = &unk_2640BAD10;
    id v26 = v10;
    objc_msgSend(v17, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v20, v21, v24, 0, v25, 0, width, height, 1.0, 0);
  }
  else
  {
LABEL_4:
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __112__ICGalleryAttachmentEditorController_extractedDocumentControllerLoadThumbnailForDocument_size_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5AB78];
  uint64_t v5 = [a3 scanDataDelegateIdentifier];
  char v6 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  uint64_t v7 = [v6 managedObjectContext];
  id v8 = [v4 attachmentWithIdentifier:v5 context:v7];

  id v9 = [v8 markupModelData];

  return v9;
}

- (void)extractedDocumentController:(id)a3 startMarkupOnDocument:(id)a4 inkStyle:(unint64_t)a5 startPresentBlock:(id)a6 dismissCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  double v16 = (void *)MEMORY[0x263F5AB78];
  uint64_t v17 = [v13 scanDataDelegateIdentifier];
  id v18 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v19 = [v18 managedObjectContext];
  long long v20 = [v16 attachmentWithIdentifier:v17 context:v19];

  if (v20)
  {
    unint64_t v27 = a5;
    uint64_t v21 = [v12 currentImageView];
    uint64_t v22 = [v13 croppedAndFilteredImageUUID];

    if (v22)
    {
      uint64_t v23 = [(ICGalleryAttachmentEditorController *)self imageCache];
      uint64_t v24 = [v13 croppedAndFilteredImageUUID];
      uint64_t v25 = [v23 getImage:v24];
    }
    else
    {
      uint64_t v25 = [(ICGalleryAttachmentEditorController *)self extractedDocumentControllerImageForDocument:v13];
    }
    id v26 = [(ICGalleryAttachmentEditorController *)self imageCache];
    objc_initWeak(&location, v26);

    if (v25)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke;
      v32[3] = &unk_2640BAD38;
      id v33 = v25;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke_2;
      v28[3] = &unk_2640BAD60;
      objc_copyWeak(&v31, &location);
      id v29 = v13;
      id v30 = v12;
      +[ICMarkupPresenter markupAttachment:v20 fromView:v21 presentingViewController:v30 inkStyle:v27 frameBlock:v32 startPresentBlock:v14 completionBlock:v28 dismissCompletionBlock:v15];

      objc_destroyWeak(&v31);
    }
    objc_destroyWeak(&location);
  }
}

uint64_t __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F827E8];
  [a2 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 32) size];

  return objc_msgSend(v3, "ic_aspectFitImageFrameForViewWithFrame:imageSize:", v5, v7, v9, v11, v12, v13);
}

void __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke_2(id *a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v8)
  {
    double v4 = objc_msgSend(MEMORY[0x263F827E8], "imageWithData:");
    if (v4)
    {
      double v5 = [a1[4] croppedAndFilteredImageUUID];

      double v6 = [a1[4] metaData];
      if (v5)
      {
        double v7 = [a1[4] croppedAndFilteredImageUUID];
        [WeakRetained replaceImage:v4 metaData:v6 uuid:v7];
      }
      else
      {
        double v7 = [WeakRetained setImage:v4 metaData:v6];
        [a1[4] setCroppedAndFilteredImageUUID:v7];
      }

      [a1[5] didUpdateDocumentImage:a1[4]];
    }
  }
}

- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x263F5AB78];
  id v14 = v4;
  double v6 = [v4 scanDataDelegateIdentifier];
  double v7 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v8 = [v7 managedObjectContext];
  double v9 = [v5 attachmentWithIdentifier:v6 context:v8];

  double v10 = [v9 markupModelData];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    double v12 = [(ICGalleryAttachmentEditorController *)self editor];
    double v13 = [v14 scanDataDelegateIdentifier];
    [v12 setMarkupData:0 forAttachmentWithIdentifier:v13];
  }
}

- (id)extractedDocumentControllerUndoManager
{
  uint64_t v2 = [(ICGalleryAttachmentEditorController *)self editor];
  uint64_t v3 = [v2 undoManager];

  return v3;
}

- (void)documentCameraPresentingViewController:(id)a3 didFinishWithInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  BOOL v8 = a6;
  id v31 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v8 && !a7) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"!(warnUser && !closeViewController)" functionName:"-[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]" simulateCrash:1 showAlert:0 format:@"Cannot warn user if not closing the view controller"];
  }
  BOOL v30 = a7;
  id v14 = [v12 docInfos];
  uint64_t v15 = [v14 count];

  if (!v15) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"docInfoCollection.docInfos.count > 0" functionName:"-[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]" simulateCrash:1 showAlert:0 format:@"This should never be called with a count of 0."];
  }
  double v16 = [(ICGalleryAttachmentEditorController *)self eventReporter];
  uint64_t v17 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v18 = [v17 identifier];
  [v16 pushDocScanDataWithID:v18 actionType:3 stage:2];

  id v19 = [(ICGalleryAttachmentEditorController *)self eventReporter];
  long long v20 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  uint64_t v21 = [v20 note];
  uint64_t v22 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  uint64_t v23 = [v22 galleryModel];
  uint64_t v24 = [v23 subAttachmentCount];
  uint64_t v25 = [v12 docInfos];
  objc_msgSend(v19, "submitDocScanEventForNote:pageCount:", v21, objc_msgSend(v25, "count") + v24);

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__14;
  v37[4] = __Block_byref_object_dispose__14;
  id v26 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
  id v38 = [v26 currentDocument];

  unint64_t v27 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke;
  block[3] = &unk_2640BADB0;
  block[4] = self;
  id v33 = v12;
  id v34 = v13;
  uint64_t v35 = v37;
  BOOL v36 = v30;
  id v28 = v13;
  id v29 = v12;
  dispatch_async(v27, block);

  _Block_object_dispose(v37, 8);
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F5B318];
  uint64_t v3 = [*(id *)(a1 + 32) galleryAttachment];
  id v4 = [*(id *)(a1 + 40) docInfos];
  double v5 = [v2 createAndAddSubAttachmentsToGalleryAttachment:v3 fromDocuments:v4 imageCache:*(void *)(a1 + 48) context:0];

  if ([v5 count])
  {
    double v6 = [*(id *)(a1 + 32) galleryAttachment];
    double v7 = [v6 managedObjectContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2;
    v12[3] = &unk_2640BAD88;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    uint64_t v14 = v9;
    double v10 = *(void **)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    id v15 = v10;
    id v16 = v5;
    [v7 performBlockAndWait:v12];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_107;
    v11[3] = &unk_2640B8140;
    v11[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF980];
  uint64_t v3 = [*(id *)(a1 + 32) docInfos];
  v67 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) docInfos];
  uint64_t v4 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v81;
    uint64_t v66 = *(void *)v81;
    do
    {
      uint64_t v7 = 0;
      uint64_t v68 = v5;
      do
      {
        if (*(void *)v81 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v80 + 1) + 8 * v7);
        uint64_t v9 = [v8 scanDataDelegateIdentifier];

        if (v9)
        {
          double v10 = (void *)MEMORY[0x263F5AB78];
          uint64_t v11 = [v8 scanDataDelegateIdentifier];
          id v12 = [*(id *)(a1 + 40) galleryAttachment];
          id v13 = [v12 managedObjectContext];
          uint64_t v14 = [v10 attachmentWithIdentifier:v11 context:v13];

          if (v14)
          {
            v70 = v14;
            id v15 = [*(id *)(a1 + 40) documentInfoCollection];
            id v16 = [v15 docInfos];
            uint64_t v17 = [v16 count];

            if (v17)
            {
              unint64_t v18 = 0;
              while (1)
              {
                id v19 = [v8 scanDataDelegateIdentifier];
                long long v20 = [*(id *)(a1 + 40) documentInfoCollection];
                uint64_t v21 = [v20 docInfos];
                uint64_t v22 = [v21 objectAtIndexedSubscript:v18];
                uint64_t v23 = [v22 scanDataDelegateIdentifier];
                char v24 = [v19 isEqualToString:v23];

                if (v24) {
                  break;
                }
                ++v18;
                uint64_t v25 = [*(id *)(a1 + 40) documentInfoCollection];
                id v26 = [v25 docInfos];
                unint64_t v27 = [v26 count];

                if (v27 <= v18) {
                  goto LABEL_12;
                }
              }
              id v28 = [*(id *)(a1 + 40) documentInfoCollection];
              id v29 = [v28 docInfos];
              [v29 replaceObjectAtIndex:v18 withObject:v8];
            }
            else
            {
LABEL_12:
              id v28 = [*(id *)(a1 + 40) documentInfoCollection];
              id v29 = [v28 docInfos];
              [v29 addObject:v8];
            }

            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
            v32 = *(void **)(a1 + 48);
            id v31 = [v8 croppedAndFilteredImageUUID];
            BOOL v30 = [v32 getImageURL:v31 async:0];
            objc_msgSend(v67, "ic_addNonNilObject:", v30);
            uint64_t v6 = v66;
            uint64_t v5 = v68;
            uint64_t v14 = v70;
          }
          else
          {
            BOOL v30 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_cold_1(v86, v8, &v87, v30);
            }
            id v31 = v30;
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
    }
    while (v5);
  }

  objc_opt_class();
  id v33 = [MEMORY[0x263F5AEB0] objectForKey:@"ICShouldSavePhotosAndVideosToCameraRollKey"];
  id v34 = ICDynamicCast();
  int v35 = [v34 BOOLValue];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v36 = v67;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    unint64_t v39 = 0;
    uint64_t v40 = *(void *)v77;
    uint64_t v41 = *MEMORY[0x263EFF688];
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v77 != v40) {
          objc_enumerationMutation(v36);
        }
        id v43 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        id v75 = 0;
        [v43 getResourceValue:&v75 forKey:v41 error:0];
        if (v75)
        {
          unint64_t v44 = [v75 unsignedIntegerValue];
          if (v39 <= v44) {
            unint64_t v39 = v44;
          }
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v38);
  }
  else
  {
    unint64_t v39 = 0;
  }

  int64_t v45 = [*(id *)(a1 + 40) galleryAttachment];
  v46 = [v45 note];

  int v47 = [v46 canAddAttachment];
  int v48 = [v46 attachmentExceedsMaxSizeAllowed:v39];
  if (![v46 isPasswordProtected] && v35 | v48 | v47 ^ 1)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v49 = v36;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v71 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v72 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v71 + 1) + 8 * j);
          id v55 = (void *)MEMORY[0x210546100]();
          v56 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v54];
          UIImageDataWriteToSavedPhotosAlbum();
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v71 objects:v84 count:16];
      }
      while (v51);
    }
  }
  id v57 = [*(id *)(a1 + 40) extractedDocumentController];
  [v57 didUpdateDocumentInfoArrayNewCurrentDocument:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  v58 = NSString;
  v59 = [MEMORY[0x263F086E0] mainBundle];
  v60 = [v59 localizedStringForKey:@"ADD_%lu_SCANNED_IMAGES" value:&stru_26C10E100 table:0];
  v61 = objc_msgSend(v58, "localizedStringWithFormat:", v60, objc_msgSend(*(id *)(a1 + 56), "count"));

  v62 = [*(id *)(a1 + 40) editor];
  v63 = [v62 undoManager];
  v64 = [v63 prepareWithInvocationTarget:v62];
  [v64 undoablyDeleteSubAttachments:*(void *)(a1 + 56) actionName:v61];

  v65 = [v62 undoManager];
  [v65 setActionName:v61];
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_107(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) extractedDocumentController];
  uint64_t v3 = [v2 navigationController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_108;
  v4[3] = &unk_2640B8140;
  v4[4] = *(void *)(a1 + 32);
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_108(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (void)documentCameraControllerDidCancelWithPresentingViewController:(id)a3
{
  uint64_t v4 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
  uint64_t v5 = [v4 navigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __101__ICGalleryAttachmentEditorController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke;
  v6[3] = &unk_2640B8140;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

void __101__ICGalleryAttachmentEditorController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [a3 presentingViewController];
  [(ICGalleryAttachmentEditorController *)self documentCameraPresentingViewController:v12 didFinishWithInfoCollection:v11 imageCache:v10 warnUser:v6 closeViewController:1];
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  BOOL v7 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 presentingViewController];
  [(ICGalleryAttachmentEditorController *)self documentCameraPresentingViewController:v13 didFinishWithInfoCollection:v12 imageCache:v11 warnUser:v7 closeViewController:1];
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  id v4 = [a3 presentingViewController];
  [(ICGalleryAttachmentEditorController *)self documentCameraControllerDidCancelWithPresentingViewController:v4];
}

- (void)documentCameraControllerDidRetake:(id)a3 pageCount:(unint64_t)a4
{
  BOOL v6 = [(ICGalleryAttachmentEditorController *)self eventReporter];
  BOOL v7 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v8 = [v7 identifier];
  [v6 pushDocScanDataWithID:v8 actionType:2 stage:1];

  id v13 = [(ICGalleryAttachmentEditorController *)self eventReporter];
  uint64_t v9 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v10 = [v9 note];
  id v11 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v12 = [v11 galleryModel];
  objc_msgSend(v13, "submitDocScanEventForNote:pageCount:", v10, objc_msgSend(v12, "subAttachmentCount") + a4);
}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v7 = [(ICGalleryAttachmentEditorController *)self galleryAttachment];
  id v8 = [v7 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__ICGalleryAttachmentEditorController_documentCameraController_canAddImages___block_invoke;
  v10[3] = &unk_2640BADD8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a4;
  [v8 performBlockAndWait:v10];

  LOBYTE(a4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return a4;
}

void __77__ICGalleryAttachmentEditorController_documentCameraController_canAddImages___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) galleryAttachment];
  objc_opt_class();
  uint64_t v2 = [v6 attachmentModel];
  uint64_t v3 = ICCheckedDynamicCast();

  unint64_t v4 = *(void *)(a1 + 48) + [v3 subAttachmentCount];
  uint64_t v5 = [MEMORY[0x263F5ABD8] sharedConfiguration];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 <= [v5 maxSubAttachmentsPerAttachment];
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 presentingViewController];
  id v8 = [v7 imageCache];

  [(ICGalleryAttachmentEditorController *)self documentCameraPresentingViewController:v9 didFinishWithInfoCollection:v6 imageCache:v8 warnUser:1 closeViewController:1];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  if ([(ICGalleryAttachmentEditorController *)self useCustomRecropTransition])
  {
    id v8 = objc_alloc(MEMORY[0x263F3AA38]);
    id v9 = [(ICGalleryAttachmentEditorController *)self filteredImageForRecrop];
    id v10 = [(ICGalleryAttachmentEditorController *)self unfilteredImageForRecrop];
    int64_t v11 = [(ICGalleryAttachmentEditorController *)self orientationForRecrop];
    id v12 = [(ICGalleryAttachmentEditorController *)self indexPathForRecrop];
    uint64_t v13 = (void *)[v8 initWithImage:v9 unfilteredImage:v10 orientation:v11 indexPath:v12 duration:0 completion:0.65];

    [(ICGalleryAttachmentEditorController *)self setFilteredImageForRecrop:0];
    [(ICGalleryAttachmentEditorController *)self setUnfilteredImageForRecrop:0];
    [v13 setPresenting:a4 == 1];
    if (([v13 presenting] & 1) == 0) {
      [(ICGalleryAttachmentEditorController *)self setUseCustomRecropTransition:0];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F5AB78];
  unint64_t v4 = (void *)MEMORY[0x263F5ACA0];
  id v5 = a3;
  id v6 = [v4 sharedContext];
  id v7 = [v6 managedObjectContext];
  id v8 = [v3 attachmentWithIdentifier:v5 context:v7];

  return v8;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSClassFromString(&cfstr_Icdoccamextrac.isa);
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = (objc_class *)[[v8 alloc] initWithPresentedViewController:v6 presentingViewController:v7];
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  Class v9 = NSClassFromString(&cfstr_Icdoccamextrac_0.isa);
  if (v9 && (id v10 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = [v10 alloc];
    id v12 = [(ICGalleryAttachmentEditorController *)self sourceViewForZoomTransition];
    uint64_t v13 = (void *)[v11 initWithPresentedController:v7 presentingController:v8 thumbnailView:v12 duration:1 isPresenting:0.25];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(&cfstr_Icdoccamextrac_0.isa);
  if (v5 && (id v6 = v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 alloc];
    id v8 = [(ICGalleryAttachmentEditorController *)self sourceViewForZoomTransition];
    Class v9 = (void *)[v7 initWithPresentedController:v4 presentingController:0 thumbnailView:v8 duration:0 isPresenting:0.25];
  }
  else
  {
    Class v9 = 0;
  }

  return v9;
}

- (id)attachmentUIState
{
  return 0;
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter)
  {
    if ([MEMORY[0x263F5A768] isOptedInForAnalytics])
    {
      uint64_t v3 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
      id v4 = [v3 viewIfLoaded];

      if (v4)
      {
        id v5 = objc_alloc(MEMORY[0x263F5A768]);
        uint64_t v6 = *MEMORY[0x263F5A778];
        id v7 = [(ICGalleryAttachmentEditorController *)self extractedDocumentController];
        id v8 = [v7 view];
        Class v9 = (ICNAEventReporter *)[v5 initWithSubTrackerName:v6 view:v8];
        eventReporter = self->_eventReporter;
        self->_eventReporter = v9;

        id v11 = [MEMORY[0x263F08A00] defaultCenter];
        [v11 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
      }
    }
  }
  id v12 = self->_eventReporter;

  return v12;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (ICAttachment)galleryAttachment
{
  return self->_galleryAttachment;
}

- (void)setGalleryAttachment:(id)a3
{
}

- (ICDocCamExtractedDocumentViewController)extractedDocumentController
{
  return self->_extractedDocumentController;
}

- (void)setExtractedDocumentController:(id)a3
{
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (ICAttachmentPreviewImageCache)thumbnailCache
{
  return self->_thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
}

- (ICDocCamScannedDocumentEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (ICGalleryAttachmentEditorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICGalleryAttachmentEditorControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)browserMode
{
  return self->_browserMode;
}

- (void)setBrowserMode:(BOOL)a3
{
  self->_browserMode = a3;
}

- (BOOL)useCustomRecropTransition
{
  return self->_useCustomRecropTransition;
}

- (void)setUseCustomRecropTransition:(BOOL)a3
{
  self->_useCustomRecropTransition = a3;
}

- (int64_t)orientationForRecrop
{
  return self->_orientationForRecrop;
}

- (void)setOrientationForRecrop:(int64_t)a3
{
  self->_orientationForRecrop = a3;
}

- (NSIndexPath)indexPathForRecrop
{
  return self->_indexPathForRecrop;
}

- (void)setIndexPathForRecrop:(id)a3
{
}

- (UIImage)filteredImageForRecrop
{
  return self->_filteredImageForRecrop;
}

- (void)setFilteredImageForRecrop:(id)a3
{
}

- (UIImage)unfilteredImageForRecrop
{
  return self->_unfilteredImageForRecrop;
}

- (void)setUnfilteredImageForRecrop:(id)a3
{
}

- (UIView)sourceViewForZoomTransition
{
  return self->_sourceViewForZoomTransition;
}

- (void)setSourceViewForZoomTransition:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_sourceViewForZoomTransition, 0);
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_filteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_indexPathForRecrop, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
  objc_storeStrong((id *)&self->_extractedDocumentController, 0);

  objc_storeStrong((id *)&self->_galleryAttachment, 0);
}

void __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Did not get an attachment identifier when enumerating sub attachments.", v1, 2u);
}

- (void)openEditorOnViewController:(void *)a1 pageIndex:(NSObject *)a2 sourceView:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 scanDataDelegateIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Unable to open gallery attachment editor since attachment was missing: %@", (uint8_t *)&v4, 0xCu);
}

- (void)openEditorOnViewController:(os_log_t)log pageIndex:sourceView:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Unable to open gallery attachment editor since index was out of bounds", v1, 2u);
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 scanDataDelegateIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_20BE60000, a4, OS_LOG_TYPE_ERROR, "Unable to find attachment for retrieving image url: %@", a1, 0xCu);
}

@end