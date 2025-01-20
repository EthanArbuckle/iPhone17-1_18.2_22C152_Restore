@interface PXSettingsHighlightEstimatesExportViewController
- (BOOL)exportHighlightEstimatesOnViewDidAppear;
- (NSDictionary)highlightEstimatesDictionary;
- (UITextView)textView;
- (void)_fetchHighlightEstimatesDictionary;
- (void)_sendEmail:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setExportHighlightEstimatesOnViewDidAppear:(BOOL)a3;
- (void)setHighlightEstimatesDictionary:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PXSettingsHighlightEstimatesExportViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightEstimatesDictionary, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)setHighlightEstimatesDictionary:(id)a3
{
}

- (NSDictionary)highlightEstimatesDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 992, 1);
}

- (void)setTextView:(id)a3
{
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setExportHighlightEstimatesOnViewDidAppear:(BOOL)a3
{
  self->_exportHighlightEstimatesOnViewDidAppear = a3;
}

- (BOOL)exportHighlightEstimatesOnViewDidAppear
{
  return self->_exportHighlightEstimatesOnViewDidAppear;
}

- (void)_sendEmail:(id)a3
{
  if ([getMFMailComposeViewControllerClass_169299() canSendMail])
  {
    v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Privacy Warning", @"By sending this email, you agree on sharing your photos metadata.", 1 message preferredStyle];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke;
    v8[3] = &unk_1E5DD0030;
    v8[4] = self;
    v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Agree" style:0 handler:v8];
    [v4 addAction:v5];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Email", @"Can't send email, do you have an account setup?", 1 message preferredStyle];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke_261;
  v7[3] = &unk_1E5DD0030;
  v7[4] = self;
  v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:v7];
  [v4 addAction:v6];
  [(PXSettingsHighlightEstimatesExportViewController *)self presentViewController:v4 animated:1 completion:0];
}

void __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_169299());
  [v2 setMailComposeDelegate:*(void *)(a1 + 32)];
  v3 = [NSString stringWithFormat:@"[PhotosGraph] Library Estimates Export"];
  [v2 setSubject:v3];

  [v2 setToRecipients:&unk_1F02D4AC8];
  v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [*(id *)(a1 + 32) highlightEstimatesDictionary];
  id v16 = 0;
  v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v16];
  id v7 = v16;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to archive highlightEstimatesDictionary, error: %@", buf, 0xCu);
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v8 setDateFormat:@"YYYY-MM-dd"];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [v8 stringFromDate:v9];

  v11 = NSString;
  if (v6)
  {
    v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    v13 = [v12 name];
    v14 = [v11 stringWithFormat:@"library-estimates-%@-%@.plist", v13, v10];

    [v2 addAttachmentData:v6 mimeType:@"application/octet-stream" fileName:v14];
    v15 = 0;
  }
  else
  {
    v15 = [NSString stringWithFormat:@"Cannot attach library estimates data."];
    NSLog(&cfstr_Error_1.isa, v15);
  }
  [v2 setMessageBody:v15 isHTML:0];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
}

void __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke_261(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)_fetchHighlightEstimatesDictionary
{
  v3 = [(PXSettingsHighlightEstimatesExportViewController *)self textView];
  [v3 setText:@"\nFetching library estimates.\nThis might take a while…"];

  objc_initWeak(&location, self);
  v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__PXSettingsHighlightEstimatesExportViewController__fetchHighlightEstimatesDictionary__block_invoke;
  v5[3] = &unk_1E5DC1968;
  objc_copyWeak(&v6, &location);
  [v4 requestHighlightEstimatesWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __86__PXSettingsHighlightEstimatesExportViewController__fetchHighlightEstimatesDictionary__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7;
  v9;
  v8;
  px_dispatch_on_main_queue();
}

void __86__PXSettingsHighlightEstimatesExportViewController__fetchHighlightEstimatesDictionary__block_invoke_2(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = [WeakRetained textView];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 setHighlightEstimatesDictionary:v5];

    [v4 setText:*(void *)(a1 + 48)];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Export" style:0 target:WeakRetained action:sel__sendEmail_];
    id v9 = [WeakRetained navigationController];
    [v9 setToolbarHidden:0 animated:1];

    v11[0] = v7;
    v11[1] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [WeakRetained setToolbarItems:v10 animated:1];
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Fetching library estimates failed due to error:\n\n%@", *(void *)(a1 + 40)];
    [v4 setText:v7];
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__PXSettingsHighlightEstimatesExportViewController_mailComposeController_didFinishWithResult_error___block_invoke;
  v5[3] = &unk_1E5DD36F8;
  void v5[4] = self;
  -[PXSettingsHighlightEstimatesExportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

void __100__PXSettingsHighlightEstimatesExportViewController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXSettingsHighlightEstimatesExportViewController;
  -[PXSettingsHighlightEstimatesExportViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  uint64_t v5 = [(PXSettingsHighlightEstimatesExportViewController *)self navigationController];
  [v5 setToolbarHidden:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXSettingsHighlightEstimatesExportViewController;
  [(PXSettingsHighlightEstimatesExportViewController *)&v4 viewDidAppear:a3];
  if ([(PXSettingsHighlightEstimatesExportViewController *)self exportHighlightEstimatesOnViewDidAppear])
  {
    [(PXSettingsHighlightEstimatesExportViewController *)self setExportHighlightEstimatesOnViewDidAppear:0];
    [(PXSettingsHighlightEstimatesExportViewController *)self _fetchHighlightEstimatesDictionary];
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PXSettingsHighlightEstimatesExportViewController;
  [(PXSettingsHighlightEstimatesExportViewController *)&v7 viewDidLoad];
  [(PXSettingsHighlightEstimatesExportViewController *)self setExportHighlightEstimatesOnViewDidAppear:1];
  BOOL v3 = [(PXSettingsHighlightEstimatesExportViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  [v3 bounds];
  uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
  [v5 setAutoresizingMask:18];
  [v5 setEditable:0];
  [v3 addSubview:v5];
  [(PXSettingsHighlightEstimatesExportViewController *)self setTextView:v5];
  [(PXSettingsHighlightEstimatesExportViewController *)self setTitle:@"Export Library Estimates"];
  objc_super v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v6];
}

@end