@interface PXMemoriesInlineProblemReportViewController
- (BOOL)didDismissMailWindow;
- (NSArray)features;
- (PHMemory)memory;
- (PXMemoriesInlineProblemReportViewController)initWithMemory:(id)a3 features:(id)a4;
- (UIActivityIndicatorView)reportCaptureInProgressActivityIndicator;
- (UILabel)reportCaptureInProgressLabel;
- (void)_showMailComposeWindow;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setDidDismissMailWindow:(BOOL)a3;
- (void)setFeatures:(id)a3;
- (void)setMemory:(id)a3;
- (void)setReportCaptureInProgressActivityIndicator:(id)a3;
- (void)setReportCaptureInProgressLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXMemoriesInlineProblemReportViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportCaptureInProgressActivityIndicator, 0);
  objc_storeStrong((id *)&self->_reportCaptureInProgressLabel, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (void)setDidDismissMailWindow:(BOOL)a3
{
  self->_didDismissMailWindow = a3;
}

- (BOOL)didDismissMailWindow
{
  return self->_didDismissMailWindow;
}

- (void)setReportCaptureInProgressActivityIndicator:(id)a3
{
}

- (UIActivityIndicatorView)reportCaptureInProgressActivityIndicator
{
  return self->_reportCaptureInProgressActivityIndicator;
}

- (void)setReportCaptureInProgressLabel:(id)a3
{
}

- (UILabel)reportCaptureInProgressLabel
{
  return self->_reportCaptureInProgressLabel;
}

- (void)setFeatures:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (void)setMemory:(id)a3
{
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v6 = a3;
  [(PXMemoriesInlineProblemReportViewController *)self setDidDismissMailWindow:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PXMemoriesInlineProblemReportViewController_mailComposeController_didFinishWithResult_error___block_invoke;
  v7[3] = &unk_1E5DD36F8;
  v7[4] = self;
  [v6 dismissViewControllerAnimated:0 completion:v7];
}

uint64_t __95__PXMemoriesInlineProblemReportViewController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_showMailComposeWindow
{
  v3 = [(PXMemoriesInlineProblemReportViewController *)self reportCaptureInProgressActivityIndicator];
  [v3 startAnimating];

  v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke(uint64_t a1)
{
  v2 = [PXMemoriesInlineProblemReporter alloc];
  v3 = [*(id *)(a1 + 32) memory];
  v4 = [*(id *)(a1 + 32) features];
  v5 = [(PXMemoriesInlineProblemReporter *)v2 initWithMemory:v3 features:v4];

  id v6 = [(PXMemoriesInlineProblemReporter *)v5 feedbackMailViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_2;
  v9[3] = &unk_1E5DD32A8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 setMailComposeDelegate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setModalTransitionStyle:2];
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_3;
    v10[3] = &unk_1E5DD36F8;
    v10[4] = v3;
    [v3 presentViewController:v4 animated:1 completion:v10];
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Unable to create E-Mail" message:@"You need to set up at least one account in Mail in order to report the issue." preferredStyle:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_4;
    v9[3] = &unk_1E5DD0030;
    void v9[4] = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:v9];
    [v5 addAction:v6];
    uint64_t v7 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_5;
    v8[3] = &unk_1E5DD36F8;
    v8[4] = v7;
    [v7 presentViewController:v5 animated:1 completion:v8];
  }
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reportCaptureInProgressActivityIndicator];
  [v1 stopAnimating];
}

uint64_t __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reportCaptureInProgressActivityIndicator];
  [v1 stopAnimating];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXMemoriesInlineProblemReportViewController;
  [(PXMemoriesInlineProblemReportViewController *)&v4 viewWillAppear:a3];
  if (![(PXMemoriesInlineProblemReportViewController *)self didDismissMailWindow]) {
    [(PXMemoriesInlineProblemReportViewController *)self _showMailComposeWindow];
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PXMemoriesInlineProblemReportViewController;
  [(PXMemoriesInlineProblemReportViewController *)&v13 viewDidLoad];
  v3 = [(PXMemoriesInlineProblemReportViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTextAlignment:1];
  [v6 setNumberOfLines:2];
  uint64_t v7 = PXLocalizedStringFromTable(@"Capturing Data.\nPlease wait…", @"PhotosUICore");
  [v6 setText:v7];

  [v3 addSubview:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v8];
  v9 = _NSDictionaryOfVariableBindings(&cfstr_ProgresslabelA.isa, v6, v8, 0);
  id v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[activityIndicator]-4-[progressLabel]" options:512 metrics:0 views:v9];
  [v3 addConstraints:v10];

  uint64_t v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v11];

  v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v12];

  [(PXMemoriesInlineProblemReportViewController *)self setReportCaptureInProgressLabel:v6];
  [(PXMemoriesInlineProblemReportViewController *)self setReportCaptureInProgressActivityIndicator:v8];
}

- (PXMemoriesInlineProblemReportViewController)initWithMemory:(id)a3 features:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PXMemoriesInlineProblemReportViewController *)self initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_features, a4);
  }

  return v10;
}

@end