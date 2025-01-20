@interface ICAttachmentActivityViewController
+ (id)makeWithAttachment:(id)a3 quickLookItemDelegate:(id)a4 completion:(id)a5;
- (BOOL)ignoreAttachmentsForCopyToPasteboard;
- (BOOL)inhibitPDFGenerationForActivityType:(id)a3;
- (BOOL)writeGalleryPDFDataToPasteboardIfNecessaryForActivity:(id)a3 attachments:(id)a4;
- (NSArray)attachments;
- (id)activityTypesThatInhibitPDFGeneration;
- (void)_performActivity:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setIgnoreAttachmentsForCopyToPasteboard:(BOOL)a3;
@end

@implementation ICAttachmentActivityViewController

+ (id)makeWithAttachment:(id)a3 quickLookItemDelegate:(id)a4 completion:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 activityItems];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [v7 media];
    v13 = v12;
    if (v12
      && [v12 hasFile]
      && ([v13 isPasswordProtected] & 1) == 0
      && (objc_msgSend(MEMORY[0x263F82670], "ic_isVision") & 1) == 0)
    {
      v28 = objc_alloc_init(NotesQuickLookActivityItem);
      [(NotesQuickLookActivityItem *)v28 setDelegate:v8];
      v35[0] = v7;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
      [(NotesQuickLookActivityItem *)v28 setPreviewItems:v29];

      uint64_t v30 = [v11 arrayByAddingObject:v28];

      v31 = objc_alloc_init(NotesQuickLookActivity);
      v14 = [MEMORY[0x263EFFA68] arrayByAddingObject:v31];

      v11 = (void *)v30;
    }
    else
    {
      v14 = (void *)MEMORY[0x263EFFA68];
    }
    if (ICDebugModeEnabled())
    {
      id v15 = objc_alloc(MEMORY[0x263F5B458]);
      v16 = [v7 identifier];
      v17 = (void *)[v15 initWithIdentifier:v16];

      v18 = [v14 arrayByAddingObject:v17];

      v19 = (void *)[objc_alloc(MEMORY[0x263F5B2D8]) initWithObject:v7 activityType:1];
      v14 = [v18 arrayByAddingObject:v19];
    }
    v20 = [[ICAttachmentActivityViewController alloc] initWithActivityItems:v11 applicationActivities:v14];
    v21 = objc_msgSend(MEMORY[0x263EFF8C0], "ic_arrayFromNonNilObject:", v7);
    [(ICAttachmentActivityViewController *)v20 setAttachments:v21];

    v22 = [v7 note];
    v23 = [v22 account];
    -[ICAttachmentActivityViewController setIsContentManaged:](v20, "setIsContentManaged:", [v23 isManaged]);

    uint64_t v24 = *MEMORY[0x263F5AE08];
    v34[0] = *MEMORY[0x263F6BD08];
    v34[1] = v24;
    v34[2] = *MEMORY[0x263F6BD58];
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];
    [(ICAttachmentActivityViewController *)v20 setExcludedActivityTypes:v25];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
      uint64_t v26 = -2;
    }
    else {
      uint64_t v26 = 7;
    }
    [(ICAttachmentActivityViewController *)v20 setModalPresentationStyle:v26];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __90__ICAttachmentActivityViewController_makeWithAttachment_quickLookItemDelegate_completion___block_invoke;
    v32[3] = &unk_2640BB7D8;
    id v33 = v9;
    [(ICAttachmentActivityViewController *)v20 setCompletionWithItemsHandler:v32];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __90__ICAttachmentActivityViewController_makeWithAttachment_quickLookItemDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  BOOL v6 = [(ICAttachmentActivityViewController *)self inhibitPDFGenerationForActivityType:v5];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICAttachmentActivityViewController;
    [(ICAttachmentActivityViewController *)&v11 _performActivity:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F5B308];
    id v8 = [(ICAttachmentActivityViewController *)self attachments];
    id v9 = [(ICAttachmentActivityViewController *)self view];
    uint64_t v10 = [v9 window];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__ICAttachmentActivityViewController__performActivity___block_invoke;
    v12[3] = &unk_2640B9510;
    v12[4] = self;
    id v13 = v4;
    [v7 generatePDFsIfNecessaryForGalleryAttachments:v8 displayWindow:v10 presentingViewController:self completionHandler:v12];
  }
}

void __55__ICAttachmentActivityViewController__performActivity___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = [*(id *)(a1 + 32) attachments];
    char v6 = [v2 writeGalleryPDFDataToPasteboardIfNecessaryForActivity:v4 attachments:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      v9.receiver = *(id *)(a1 + 32);
      v9.super_class = (Class)ICAttachmentActivityViewController;
      objc_msgSendSuper2(&v9, sel__performActivity_, v7);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    [v8 _cancel];
  }
}

- (BOOL)inhibitPDFGenerationForActivityType:(id)a3
{
  id v4 = a3;
  if (-[ICAttachmentActivityViewController ignoreAttachmentsForCopyToPasteboard](self, "ignoreAttachmentsForCopyToPasteboard")&& ([v4 isEqualToString:*MEMORY[0x263F6BCE8]] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [(ICAttachmentActivityViewController *)self activityTypesThatInhibitPDFGeneration];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (BOOL)writeGalleryPDFDataToPasteboardIfNecessaryForActivity:(id)a3 attachments:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a4;
  char v6 = [a3 activityType];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F6BCE8]];

  if (v7)
  {
    id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v25 = v5;
      char v9 = 0;
      uint64_t v10 = *(void *)v31;
      uint64_t v26 = (void *)*MEMORY[0x263F1DBF0];
      uint64_t v27 = *MEMORY[0x263F5AA90];
      unint64_t v11 = 0x263F82000uLL;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v13 attachmentType] == 11)
          {
            [MEMORY[0x263F5B308] pdfURLForAttachment:v13];
            uint64_t v14 = v8;
            uint64_t v15 = v10;
            v17 = unint64_t v16 = v11;
            v18 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v17];
            v19 = [v13 pasteboardData];
            v20 = [v19 persistenceData];

            id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            objc_msgSend(v21, "ic_setNonNilObject:forKey:", v20, v27);
            v22 = [v26 identifier];
            objc_msgSend(v21, "ic_setNonNilObject:forKey:", v18, v22);

            [v29 addObject:v21];
            unint64_t v11 = v16;
            uint64_t v10 = v15;
            uint64_t v8 = v14;
          }
          v23 = [*(id *)(v11 + 2584) generalPasteboard];
          [v23 setItems:v29];

          if ([v29 count]) {
            char v9 = 1;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v8);
      LOBYTE(v8) = v9 & 1;
      id v5 = v25;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)activityTypesThatInhibitPDFGeneration
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.mobilenotes.markup";
  v4[1] = @"com.apple.mobilenotes.findInNote";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (BOOL)ignoreAttachmentsForCopyToPasteboard
{
  return self->_ignoreAttachmentsForCopyToPasteboard;
}

- (void)setIgnoreAttachmentsForCopyToPasteboard:(BOOL)a3
{
  self->_ignoreAttachmentsForCopyToPasteboard = a3;
}

- (void).cxx_destruct
{
}

@end