@interface PXVisualDiagnosticsViewController
- (PDFDocument)document;
- (PDFView)documentView;
- (void)_handleActionBarButtonItem:(id)a3;
- (void)_handleDoneBarButtonItem:(id)a3;
- (void)_handleTapToRadarButton:(id)a3;
- (void)_updateDocumentView;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)setDocument:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXVisualDiagnosticsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentView, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (PDFView)documentView
{
  return self->_documentView;
}

- (PDFDocument)document
{
  return self->_document;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v6 = [(PXVisualDiagnosticsViewController *)self document];
  v5 = [v6 documentURL];
  [v4 addAttachment:v5];
}

- (void)_handleActionBarButtonItem:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXVisualDiagnosticsViewController__handleActionBarButtonItem___block_invoke;
  aBlock[3] = &unk_1E5DD0FA8;
  id v22 = v4;
  id v5 = v4;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  v7 = [(PXVisualDiagnosticsViewController *)self document];
  v8 = [v7 documentURL];
  v6[2](v6, v8);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItems:v5 applicationActivities:0];
  [(PXVisualDiagnosticsViewController *)self presentViewController:v9 animated:1 completion:0];
  v10 = [(PXVisualDiagnosticsViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v10 safeAreaInsets];
  double v18 = v17;
  v19 = [v9 popoverPresentationController];
  [v19 setSourceView:v10];

  v20 = [v9 popoverPresentationController];
  objc_msgSend(v20, "setSourceRect:", v12, v14, v16, v18);
}

uint64_t __64__PXVisualDiagnosticsViewController__handleActionBarButtonItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)_handleTapToRadarButton:(id)a3
{
  id v4 = objc_alloc_init(PXRadarConfiguration);
  [(PXRadarConfiguration *)v4 addDiagnosticProvider:self];
  [(PXRadarConfiguration *)v4 setComponent:1];
  [(PXRadarConfiguration *)v4 setKeywordIDs:&unk_1F02D38F8];
  [(PXRadarConfiguration *)v4 setAttachmentsIncludeAnyUserAsset:0];
  PXFileRadarWithConfiguration(v4);
}

- (void)_handleDoneBarButtonItem:(id)a3
{
}

- (void)_updateDocumentView
{
  id v4 = [(PXVisualDiagnosticsViewController *)self document];
  v3 = [(PXVisualDiagnosticsViewController *)self documentView];
  [v3 setDocument:v4];
}

- (void)setDocument:(id)a3
{
  id v4 = (PDFDocument *)[a3 copy];
  document = self->_document;
  self->_document = v4;

  [(PXVisualDiagnosticsViewController *)self _invalidateDocumentView];
}

- (void)viewDidLoad
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PXVisualDiagnosticsViewController;
  [(PXVisualDiagnosticsViewController *)&v14 viewDidLoad];
  v3 = [(PXVisualDiagnosticsViewController *)self view];
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v4 = (void *)getPDFViewClass_softClass;
  uint64_t v19 = getPDFViewClass_softClass;
  if (!getPDFViewClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getPDFViewClass_block_invoke;
    v15[3] = &unk_1E5DD2B08;
    v15[4] = &v16;
    __getPDFViewClass_block_invoke((uint64_t)v15);
    id v4 = (void *)v17[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v16, 8);
  id v6 = [v5 alloc];
  [v3 bounds];
  v7 = (PDFView *)objc_msgSend(v6, "initWithFrame:");
  documentView = self->_documentView;
  self->_documentView = v7;

  [(PDFView *)self->_documentView setAutoresizingMask:18];
  [v3 addSubview:self->_documentView];
  [(PXVisualDiagnosticsViewController *)self _updateDocumentView];
  [(PXVisualDiagnosticsViewController *)self setTitle:@"Visual Diagnostics"];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDoneBarButtonItem_];
  v10 = [(PXVisualDiagnosticsViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v9];

  double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__handleActionBarButtonItem_];
  v20[0] = v11;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  double v13 = [(PXVisualDiagnosticsViewController *)self navigationItem];
  [v13 setRightBarButtonItems:v12];
}

@end