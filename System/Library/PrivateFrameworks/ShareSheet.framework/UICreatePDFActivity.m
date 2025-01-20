@interface UICreatePDFActivity
+ (unint64_t)_xpcAttributes;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)previewController:(id)a3 canEditItem:(id)a4;
- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4;
- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3;
- (BOOL)shouldPresentDismissActionsWithoutEditedItemsForPreviewController:(id)a3;
- (QLPreviewController)previewController;
- (UICreatePDFActivityItem)previewURLItem;
- (id)_embeddedActivityViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (id)dismissActionsForPreviewController:(id)a3;
- (id)excludedActivityTypesForPreviewController:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_cleanup;
- (void)_setupQuickLookWithURL:(id)a3 activityItems:(id)a4 isPreview:(BOOL)a5;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)prepareWithActivityItems:(id)a3;
- (void)previewControllerDidDismiss:(id)a3;
- (void)setPreviewController:(id)a3;
- (void)setPreviewURLItem:(id)a3;
@end

@implementation UICreatePDFActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.MarkupAsPDF";
}

- (id)_systemImageName
{
  return @"pencil.tip.crop.circle";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Markup[Markup]" value:@"Markup" table:@"Localizable"];

  return v3;
}

- (void)_setupQuickLookWithURL:(id)a3 activityItems:(id)a4 isPreview:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_alloc_init(UICreatePDFActivityItem);
  previewURLItem = self->_previewURLItem;
  self->_previewURLItem = v10;

  [(UICreatePDFActivityItem *)self->_previewURLItem setPreviewItemURL:v8];
  if (v5)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v18 = [v17 jobName];

      if (v18) {
        goto LABEL_17;
      }
    }
    else
    {
LABEL_10:
    }
    v19 = NSString;
    v20 = [MEMORY[0x1E4F28B50] mainBundle];
    v21 = [v20 localizedInfoDictionary];
    v22 = [v21 objectForKey:@"CFBundleDisplayName"];

    if (!v22)
    {
      v23 = [MEMORY[0x1E4F28B50] mainBundle];
      v24 = [v23 infoDictionary];
      v22 = [v24 objectForKey:@"CFBundleDisplayName"];

      if (!v22)
      {
        v25 = [MEMORY[0x1E4F28B50] mainBundle];
        v26 = [v25 infoDictionary];
        v22 = [v26 objectForKey:@"CFBundleName"];

        if (!v22)
        {
          v27 = _ShareSheetBundle();
          v22 = [v27 localizedStringForKey:@"Untitled[Markup]" value:@"Untitled" table:@"Localizable"];
        }
      }
    }
    v28 = (void *)MEMORY[0x1E4F28C10];
    v29 = [MEMORY[0x1E4F1C9C8] date];
    v30 = [v28 localizedStringFromDate:v29 dateStyle:2 timeStyle:1];
    v18 = [v19 stringWithFormat:@"%@ - %@", v22, v30, (void)v45];

LABEL_17:
    if ((unint64_t)[v18 length] >= 0x81)
    {
      uint64_t v31 = [v18 rangeOfComposedCharacterSequenceAtIndex:128];
      uint64_t v33 = [v18 substringToIndex:v31 + v32];

      v18 = (void *)v33;
    }
    uint64_t v34 = SanitizeStringForUseAsFileName_onceToken;
    id v35 = v18;
    if (v34 != -1) {
      dispatch_once(&SanitizeStringForUseAsFileName_onceToken, &__block_literal_global_228);
    }
    v36 = [v35 componentsSeparatedByCharactersInSet:SanitizeStringForUseAsFileName___illegalFileNameCharacters];

    v37 = [v36 componentsJoinedByString:@" | "];

    v38 = [v8 pathExtension];
    v39 = [v37 stringByAppendingPathExtension:v38];

    v40 = [v8 URLByDeletingLastPathComponent];
    v41 = [v40 URLByAppendingPathComponent:v39];

    v42 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v42 removeItemAtURL:v41 error:0];

    v43 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v44 = [v43 moveItemAtURL:v8 toURL:v41 error:0];

    if (v44) {
      [(UICreatePDFActivityItem *)self->_previewURLItem setPreviewItemURL:v41];
    }
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICreatePDFActivity;
  if ([(UIPrintActivity *)&v7 canPerformWithActivityItems:v4]
    && ![(UIPrintActivity *)self isContentManaged]
    && (_UIActivityItemTypes() & 0xA0) != 0)
  {
    BOOL v5 = !_UIActivityHasAtMoreThan(v4, 128, 1);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (QLPreviewController *)objc_alloc_init(getQLPreviewControllerClass());
  previewController = self->_previewController;
  self->_previewController = v5;

  [(QLPreviewController *)self->_previewController setAppearanceActions:4];
  _UIShimSetIsContentManaged(self->_previewController, [(UIPrintActivity *)self isContentManaged]);
  [(QLPreviewController *)self->_previewController setDataSource:self];
  uint64_t v33 = self;
  [(QLPreviewController *)self->_previewController setDelegate:self];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
LABEL_3:
    uint64_t v11 = 0;
    uint64_t v34 = v9;
    while (1)
    {
      if (*(void *)v39 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(UIImage **)(*((void *)&v38 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(UIImage *)v12 isFileURL]) {
          break;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = v10;
        id v16 = v7;
        v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        v18 = [v17 temporaryDirectory];
        v19 = [MEMORY[0x1E4F29128] UUID];
        v20 = [v19 UUIDString];
        v21 = [v20 stringByAppendingPathExtension:@".png"];
        uint64_t v13 = [v18 URLByAppendingPathComponent:v21];

        v22 = UIImagePNGRepresentation(v12);
        int v23 = [v22 writeToURL:v13 atomically:1];

        if (v23)
        {
          id v7 = v16;
          uint64_t v10 = v15;
          uint64_t v9 = v34;
          goto LABEL_14;
        }
        uint64_t v14 = 0;
        id v7 = v16;
        uint64_t v10 = v15;
        uint64_t v9 = v34;
LABEL_16:

        if (v14)
        {
          [(UICreatePDFActivity *)v33 _setupQuickLookWithURL:v14 activityItems:v7 isPreview:0];

          goto LABEL_21;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
    uint64_t v13 = v12;
    if ([MEMORY[0x1E4F934B0] canPrintURL:v13]
      && ([(objc_class *)getQLPreviewControllerClass() canPreviewItem:v13] & 1) != 0)
    {
LABEL_14:
      uint64_t v13 = v13;
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = 0;
    }
    goto LABEL_16;
  }
LABEL_19:

  v37.receiver = v33;
  v37.super_class = (Class)UICreatePDFActivity;
  [(UIPrintActivity *)&v37 prepareWithActivityItems:v7];
  v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;

  v29 = [(UIPrintActivity *)v33 printInteractionController];
  [v29 _setupPrintPanel:0];

  v30 = [(UIPrintActivity *)v33 printInteractionController];
  uint64_t v31 = -[UICreatePDFActivityPrintPaper initWithPaperSize:]([UICreatePDFActivityPrintPaper alloc], "initWithPaperSize:", v26 + -144.0, v28 + -72.0);
  [v30 setPaper:v31];

  uint64_t v32 = [(UIPrintActivity *)v33 printInteractionController];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke;
  v35[3] = &unk_1E5A22990;
  v35[4] = v33;
  id v36 = v7;
  [v32 _generatePrintPreview:v35];

LABEL_21:
}

void __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke_2;
  block[3] = &unk_1E5A21A28;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupQuickLookWithURL:*(void *)(a1 + 40) activityItems:*(void *)(a1 + 48) isPreview:1];
  [*(id *)(*(void *)(a1 + 32) + 168) reloadData];
  id v2 = [*(id *)(a1 + 32) printInteractionController];
  [v2 _cleanPrintState];
}

- (id)_embeddedActivityViewController
{
  return 0;
}

- (id)activityViewController
{
  return self->_previewController;
}

- (void)_cleanup
{
  previewURLItem = self->_previewURLItem;
  self->_previewURLItem = 0;

  previewController = self->_previewController;
  self->_previewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)UICreatePDFActivity;
  [(UIPrintActivity *)&v5 _cleanup];
}

- (BOOL)previewController:(id)a3 canEditItem:(id)a4
{
  return 1;
}

- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4
{
  return 1;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UICreatePDFActivity *)self activityType];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  previewURLItem = self->_previewURLItem;
  if (previewURLItem) {
    objc_super v5 = previewURLItem;
  }
  else {
    objc_super v5 = (UICreatePDFActivityItem *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:&stru_1EF308000];
  }
  return v5;
}

- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3
{
  return 0;
}

- (BOOL)shouldPresentDismissActionsWithoutEditedItemsForPreviewController:(id)a3
{
  return 1;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(UICreatePDFActivityItem *)self->_previewURLItem previewItemURL];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.down"];
    Class QLDismissActionClass = (Class)getQLDismissActionClass();
    uint64_t v9 = _ShareSheetBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"Save File to...[Markup]" value:@"Save File To…" table:@"Localizable"];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __58__UICreatePDFActivity_dismissActionsForPreviewController___block_invoke;
    v21 = &unk_1E5A229B8;
    v22 = self;
    id v23 = v4;
    uint64_t v11 = [(objc_class *)QLDismissActionClass actionWithTitle:v10 image:v7 alertStyle:0 shouldDismissQuickLookAutomatically:0 handler:&v18];

    objc_msgSend(v5, "addObject:", v11, v18, v19, v20, v21, v22);
  }
  id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  Class v13 = (Class)getQLDismissActionClass();
  uint64_t v14 = _ShareSheetBundle();
  uint64_t v15 = [v14 localizedStringForKey:@"Delete PDF[Markup]" value:@"Delete PDF" table:@"Localizable"];
  id v16 = [(objc_class *)v13 actionWithTitle:v15 image:v12 alertStyle:2 shouldDismissQuickLookAutomatically:1 handler:&__block_literal_global_19];

  [v5 addObject:v16];
  return v5;
}

void __58__UICreatePDFActivity_dismissActionsForPreviewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = [v7 firstObject];
    objc_super v5 = [v4 editedFileURL];

    if (v5)
    {
LABEL_3:
      v6 = (void *)[objc_alloc(MEMORY[0x1E4FB16F0]) initWithURL:v5 inMode:2];
      [v6 setDelegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) presentViewController:v6 animated:1 completion:0];

      goto LABEL_6;
    }
  }
  else
  {
    objc_super v5 = [*(id *)(*(void *)(a1 + 32) + 176) previewItemURL];
    if (v5) {
      goto LABEL_3;
    }
  }
  [*(id *)(a1 + 32) activityDidFinish:0];
LABEL_6:
}

- (void)previewControllerDidDismiss:(id)a3
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setPreviewController:(id)a3
{
}

- (UICreatePDFActivityItem)previewURLItem
{
  return self->_previewURLItem;
}

- (void)setPreviewURLItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURLItem, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
}

@end