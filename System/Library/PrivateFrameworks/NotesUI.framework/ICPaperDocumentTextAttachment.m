@interface ICPaperDocumentTextAttachment
+ (BOOL)isEnabled;
+ (void)initialize;
- (BOOL)canDragWithoutSelecting;
- (BOOL)isLegacyMediaType;
- (BOOL)viewportShouldSnapToAttachmentView;
- (ICPDFEncryptionStateChecker)encryptionStateChecker;
- (ICPaperDocumentTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (NSURL)pdfURL;
- (id)_paperBundleURL;
- (id)attachmentAsNSTextAttachment;
- (id)fileType;
- (id)inlineViews;
- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5;
- (id)supportedPresentationSizes;
- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3;
- (void)attachmentView:(id)a3 didMoveToWindow:(id)a4;
- (void)attachmentView:(id)a3 willMoveToWindow:(id)a4;
- (void)paperDidChange;
- (void)setEncryptionStateChecker:(id)a3;
- (void)setViewportShouldSnapToAttachmentView:(BOOL)a3;
@end

@implementation ICPaperDocumentTextAttachment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E4FB0870];
    Class v3 = NSClassFromString(&cfstr_Icpaperdocumen.isa);
    uint64_t v4 = *MEMORY[0x1E4F836B0];
    [v2 registerTextAttachmentViewProviderClass:v3 forFileType:v4];
  }
}

+ (BOOL)isEnabled
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICPaperDocumentTextAttachment;
  if (!objc_msgSendSuper2(&v5, sel_isEnabled) || !ICInternalSettingsIsPDFsInNotesEnabled()) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  char v3 = objc_msgSend(v2, "ic_canEditNotes");

  return v3;
}

- (ICPaperDocumentTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5 = a3;
  v6 = [(ICPaperDocumentTextAttachment *)self fileType];
  v9.receiver = self;
  v9.super_class = (Class)ICPaperDocumentTextAttachment;
  v7 = [(ICSystemPaperTextAttachment *)&v9 initWithData:v5 ofType:v6];

  return v7;
}

- (id)fileType
{
  return (id)*MEMORY[0x1E4F836B0];
}

- (id)attachmentAsNSTextAttachment
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICPaperDocumentTextAttachment *)self isLegacyMediaType];
  uint64_t v4 = [(ICAbstractTextAttachment *)self attachment];
  id v5 = v4;
  if (v3)
  {
    int v6 = [v4 attachmentType];

    if (v6 == 6
      || ([(ICAbstractTextAttachment *)self attachment],
          v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 attachmentType],
          v13,
          v14 == 11))
    {
      v15 = (objc_class *)objc_opt_class();
    }
    else
    {
      v15 = 0;
    }
    id v21 = [v15 alloc];
    id v20 = [(ICAbstractTextAttachment *)self attachment];
    v19 = (void *)[v21 initWithAttachment:v20];
    v12 = [v19 attachmentAsNSTextAttachment];
  }
  else
  {
    int v7 = [v4 isPasswordProtected];

    if (v7)
    {
      v8 = [(ICAbstractTextAttachment *)self attachment];
      objc_super v9 = [v8 fallbackPDFData];

      id v10 = objc_alloc(MEMORY[0x1E4FB0870]);
      v11 = [MEMORY[0x1E4F832A0] fallbackPDFUTI];
      v12 = (void *)[v10 initWithData:v9 ofType:v11];

      goto LABEL_13;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F28CF0]);
    v17 = [(ICAbstractTextAttachment *)self attachment];
    v18 = [v17 previewItemURL];
    id v26 = 0;
    v19 = (void *)[v16 initWithURL:v18 options:0 error:&v26];
    id v20 = v26;

    if (v19)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
      [v12 setFileWrapper:v19];
    }
    else
    {
      v23 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(ICAbstractTextAttachment *)self attachment];
        v25 = [v24 shortLoggingDescription];
        *(_DWORD *)buf = 138412546;
        v28 = v25;
        __int16 v29 = 2112;
        id v30 = v20;
        _os_log_impl(&dword_1B08EB000, v23, OS_LOG_TYPE_DEFAULT, "Failed to create fallback PDF file wrapper for attachment %@ error: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }

LABEL_13:
  return v12;
}

- (void)paperDidChange
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Received debounced paperDidChange for paper document %@", v4, v5, v6, v7, 2u);
}

uint64_t __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasPaperForm:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setDidRunPaperFormDetection:0];
}

void __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke_3;
  v5[3] = &unk_1E5FD91D0;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 performBlockAndWait:v5];
}

uint64_t __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAttachmentChangeCountAndSave:*(void *)(a1 + 40)];
}

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken != -1) {
    dispatch_once(&supportedPresentationSizes_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)supportedPresentationSizes_supportedSizes;
  return v2;
}

void __59__ICPaperDocumentTextAttachment_supportedPresentationSizes__block_invoke()
{
  v0 = (void *)supportedPresentationSizes_supportedSizes;
  supportedPresentationSizes_supportedSizes = (uint64_t)&unk_1F09A3EC0;
}

- (ICPDFEncryptionStateChecker)encryptionStateChecker
{
  if (!self->_encryptionStateChecker)
  {
    uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
    int v4 = [v3 attachmentType];

    if (v4 == 6)
    {
      uint64_t v5 = [(ICAbstractTextAttachment *)self attachment];
      id v6 = [v5 media];
      uint64_t v7 = [v6 mediaURL];

      if (v7)
      {
        v8 = [[ICPDFEncryptionStateChecker alloc] initWithPDFURL:v7];
        encryptionStateChecker = self->_encryptionStateChecker;
        self->_encryptionStateChecker = v8;
      }
    }
  }
  id v10 = self->_encryptionStateChecker;
  return v10;
}

- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICPaperDocumentTextAttachment;
  unsigned int v5 = [(ICBaseTextAttachment *)&v12 effectiveAttachmentViewSizeForTextContainer:v4];
  if (v5 != 1)
  {
    id v6 = ICProtocolCast();
    if ([v6 insideSystemPaper])
    {
      LOWORD(v5) = 1;
    }
    else
    {
      uint64_t v7 = [(ICAbstractTextAttachment *)self attachment];
      int v8 = [v7 attachmentType];

      if (v8 == 6)
      {
        objc_super v9 = [(ICPaperDocumentTextAttachment *)self encryptionStateChecker];
        uint64_t v10 = [v9 encryptionState];

        if (v10 != 2) {
          LOWORD(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (void)attachmentView:(id)a3 willMoveToWindow:(id)a4
{
  if (!a4)
  {
    id v6 = a3;
    uint64_t v7 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
    [v7 removeObject:v6];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"ICSystemPaperTextAttachmentWillDisappearNotification" object:v6];
  }
}

- (void)attachmentView:(id)a3 didMoveToWindow:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
    [v6 addObject:v5];

    [(ICInlineCanvasTextAttachment *)self updatePaletteVisibility];
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"ICSystemPaperTextAttachmentDidAppearNotification" object:v5];
  }
}

- (id)inlineViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        ICGatherInterestingSubviewsFromViewInArray(*(void **)(*((void *)&v11 + 1) + 8 * i), v3);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_super v9 = (void *)[v3 copy];
  return v9;
}

- (BOOL)isLegacyMediaType
{
  uint64_t v2 = self;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  int v4 = [v3 attachmentType];

  char v5 = v4 - 3;
  if (v4 - 3) < 0xD && ((0x1909u >> v5))
  {
    LODWORD(v2) = (0x109u >> v5) & 1;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v7 = [(ICAbstractTextAttachment *)v2 attachment];
    int v8 = [v7 attachmentType];
    objc_super v9 = [(ICAbstractTextAttachment *)v2 attachment];
    uint64_t v10 = [v9 shortLoggingDescription];
    LOBYTE(v2) = 1;
    [v6 handleFailedAssertWithCondition:"__objc_no", "-[ICPaperDocumentTextAttachment isLegacyMediaType]", 1, 0, @"Unexpected type %hd for attachment %@", v8, v10 functionName simulateCrash showAlert format];
  }
  return (char)v2;
}

- (NSURL)pdfURL
{
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  if ([v3 attachmentType] == 6)
  {
    int v4 = [(ICAbstractTextAttachment *)self attachment];
    char v5 = [v4 media];
    uint64_t v6 = [v5 mediaURL];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSURL *)v6;
}

- (id)_paperBundleURL
{
  if ([(ICPaperDocumentTextAttachment *)self isLegacyMediaType])
  {
    uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
    int v4 = [v3 temporaryPaperBundleURL];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICPaperDocumentTextAttachment;
    int v4 = [(ICSystemPaperTextAttachment *)&v6 _paperBundleURL];
  }
  return v4;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  objc_super v6 = [(ICAbstractTextAttachment *)self attachment];
  int v7 = [v6 preferredViewSize];

  if (v7 != 1)
  {
    objc_super v9 = [(ICAbstractTextAttachment *)self attachment];
    int v10 = [v9 attachmentType];

    if (v10 == 11)
    {
      long long v11 = [(ICAbstractTextAttachment *)self attachment];
      long long v12 = [v11 galleryModel];
      long long v13 = [v12 firstSubAttachment];

      if (v13)
      {
        long long v14 = +[ICGalleryAttachmentUtilities imageForSubAttachment:v13 rotateForMacImageGallery:1 allowCached:1];
        v15 = (void *)MEMORY[0x1E4F442D8];
        uint64_t v16 = [v13 typeUTI];
        id v17 = [v15 typeWithIdentifier:v16];
LABEL_11:

LABEL_14:
        if (v14)
        {
          v28 = [ICPrintableTextAttachment alloc];
          __int16 v29 = [MEMORY[0x1E4F1C9B8] data];
          id v30 = [v17 identifier];
          uint64_t v31 = [(ICPrintableTextAttachment *)v28 initWithData:v29 ofType:v30];

          [(ICPrintableTextAttachment *)v31 setImage:v14];
          [v14 size];
          double v33 = v32;
          [v14 size];
          -[ICPrintableTextAttachment setBounds:](v31, "setBounds:", 0.0, 0.0, v33, v34);
          int v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v31];
        }
        else
        {
          int v8 = 0;
        }

        goto LABEL_18;
      }
      id v17 = 0;
    }
    else
    {
      id v17 = (id)*MEMORY[0x1E4F44450];
      v18 = [(ICAbstractTextAttachment *)self attachment];
      int v19 = [v18 attachmentType];

      if (v19 == 6)
      {
        id v20 = (void *)MEMORY[0x1E4F1C9B8];
        id v21 = [(ICPaperDocumentTextAttachment *)self pdfURL];
        [v20 dataWithContentsOfURL:v21];
      }
      else
      {
        id v21 = [(ICAbstractTextAttachment *)self attachment];
        [v21 fallbackPDFData];
      long long v13 = };

      if (v13)
      {
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F38DA0]) initWithData:v13];
        v22 = [v16 pageAtIndex:0];
        [v22 boundsForBox:1];
        TSDScaleSizeWithinSize();
        double v24 = v23;
        double v26 = v25;
        CGColorSpaceRef v27 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        long long v14 = objc_msgSend(MEMORY[0x1E4F83458], "renderedImageForPage:scale:size:colorSpace:", objc_msgSend(v22, "pageRef"), v27, 1.0, v24, v26);
        CFRelease(v27);

        goto LABEL_11;
      }
    }
    long long v14 = 0;
    goto LABEL_14;
  }
  int v8 = 0;
LABEL_18:
  return v8;
}

- (BOOL)canDragWithoutSelecting
{
  return 1;
}

- (BOOL)viewportShouldSnapToAttachmentView
{
  return self->_viewportShouldSnapToAttachmentView;
}

- (void)setViewportShouldSnapToAttachmentView:(BOOL)a3
{
  self->_viewportShouldSnapToAttachmentView = a3;
}

- (void)setEncryptionStateChecker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end