@interface PXSettingsGraphExportViewController
- (void)_exportGraph;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PXSettingsGraphExportViewController

- (void)_exportGraph
{
  if ([getMFMailComposeViewControllerClass() canSendMail])
  {
    v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Privacy Warning", @"By sending this email, you agree on sharing your photos metadata, and all its associated calendar, contact and social events", 1 message preferredStyle];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__PXSettingsGraphExportViewController__exportGraph__block_invoke;
    v7[3] = &unk_1E5DD0030;
    v7[4] = self;
    v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Agree" style:0 handler:v7];
    [v3 addAction:v4];
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Email", @"Can't send email, do you have an account setup?", 1 message preferredStyle];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_3;
  v6[3] = &unk_1E5DD0030;
  v6[4] = self;
  v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:v6];
  [v3 addAction:v5];
  [(PXSettingsGraphExportViewController *)self presentViewController:v3 animated:1 completion:0];
}

void __51__PXSettingsGraphExportViewController__exportGraph__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v16 = 0;
  v3 = [v2 exportGraphForPurpose:@"default" error:&v16];
  id v4 = v16;

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v9 = objc_alloc_init((Class)getMFMailComposeViewControllerClass());
    [v9 setMailComposeDelegate:*(void *)(a1 + 32)];
    v11 = [NSString stringWithFormat:@"[PhotosGraph] Graph Export"];
    [v9 setSubject:v11];

    [v9 setToRecipients:&unk_1F02D3490];
    v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
    if (v12)
    {
      v13 = [v3 lastPathComponent];
      [v9 addAttachmentData:v12 mimeType:@"application/octet-stream" fileName:v13];

      v14 = 0;
    }
    else
    {
      v14 = [NSString stringWithFormat:@"Cannot attach graph at path %@", v3];
      NSLog(&cfstr_Error_1.isa, v14);
    }
    [v9 setMessageBody:v14 isHTML:0];
    [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4FB1418];
    v7 = [v4 localizedDescription];
    v8 = objc_msgSend(@"Can't send email, the graph failed to export. Error: ", "stringByAppendingString:", v7);
    id v9 = [v6 alertControllerWithTitle:@"Failed to export graph" message:v8 preferredStyle:1];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_2;
    v15[3] = &unk_1E5DD0030;
    v15[4] = *(void *)(a1 + 32);
    v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:v15];
    [v9 addAction:v10];
    [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
  }
}

void __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

void __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__PXSettingsGraphExportViewController_mailComposeController_didFinishWithResult_error___block_invoke;
  v5[3] = &unk_1E5DD36F8;
  v5[4] = self;
  -[PXSettingsGraphExportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

void __87__PXSettingsGraphExportViewController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXSettingsGraphExportViewController;
  [(PXSettingsGraphExportViewController *)&v4 viewDidAppear:a3];
  if (self->_exportGraphOnViewDidAppear)
  {
    self->_exportGraphOnViewDidAppear = 0;
    [(PXSettingsGraphExportViewController *)self _exportGraph];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PXSettingsGraphExportViewController;
  [(PXSettingsGraphExportViewController *)&v5 viewDidLoad];
  self->_exportGraphOnViewDidAppear = 1;
  [(PXSettingsGraphExportViewController *)self setTitle:@"Export Graph"];
  v3 = [(PXSettingsGraphExportViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];
}

@end