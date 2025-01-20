@interface PKPaymentDocumentSubmissionIDCaptureViewController
- (PKPaymentDocumentSubmissionIDCaptureViewController)initWithController:(id)a3 context:(int64_t)a4 featureIdentifier:(unint64_t)a5;
- (unint64_t)onPresentationRemoveViewControllersAfterMarker;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidCancel:(id)a3;
- (void)cancel;
- (void)captureController:(id)a3 didChangeStateTo:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)updateUIWithState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentDocumentSubmissionIDCaptureViewController

- (PKPaymentDocumentSubmissionIDCaptureViewController)initWithController:(id)a3 context:(int64_t)a4 featureIdentifier:(unint64_t)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  v10 = [(CRCameraReader *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_featureIdentifier = a5;
    objc_storeStrong((id *)&v10->_captureController, a3);
    if ([(PKPaymentDocumentSubmissionController *)v11->_captureController side])
    {
      uint64_t v16 = *MEMORY[0x1E4F5CD20];
      v12 = &v16;
    }
    else
    {
      v17[0] = *MEMORY[0x1E4F5CD28];
      v12 = v17;
    }
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [(CRCameraReader *)v11 setOutputObjectTypes:v13];

    [(CRCameraReader *)v11 setDelegate:v11];
    [(CRCameraReader *)v11 setHidePlacementText:1];
    v11->_reachedTimeout = 0;
    v11->_context = a4;
  }

  return v11;
}

- (void)dealloc
{
  timerTryAgain = self->_timerTryAgain;
  if (timerTryAgain) {
    [(NSTimer *)timerTryAgain invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  [(CRCameraReader *)&v4 dealloc];
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  [(CRCameraReader *)&v15 loadView];
  v3 = [(PKPaymentDocumentSubmissionIDCaptureViewController *)self view];
  cameraView = self->_cameraView;
  self->_cameraView = v3;

  [(UIView *)self->_cameraView setClipsToBounds:1];
  v5 = [PKCameraCaptureInstructionView alloc];
  v6 = -[PKCameraCaptureInstructionView initWithFrame:context:primaryAction:primaryActionTitle:secondaryAction:secondaryActionTitle:](v5, "initWithFrame:context:primaryAction:primaryActionTitle:secondaryAction:secondaryActionTitle:", self->_context, 0, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  cameraInstructionView = self->_cameraInstructionView;
  self->_cameraInstructionView = v6;

  v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  cameraInstructionContainerView = self->_cameraInstructionContainerView;
  self->_cameraInstructionContainerView = v8;

  v10 = self->_cameraInstructionContainerView;
  v11 = PKProvisioningBackgroundColor();
  [(UIView *)v10 setBackgroundColor:v11];

  [(UIView *)self->_cameraInstructionContainerView addSubview:self->_cameraInstructionView];
  id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(UIView *)self->_cameraView frame];
  v13 = objc_msgSend(v12, "initWithFrame:");
  v14 = self->_cameraView;
  [v13 bounds];
  -[UIView setFrame:](v14, "setFrame:");
  [v13 addSubview:self->_cameraView];
  [v13 addSubview:self->_cameraInstructionContainerView];
  [(PKPaymentDocumentSubmissionIDCaptureViewController *)self setView:v13];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  [(PKPaymentDocumentSubmissionIDCaptureViewController *)&v10 viewDidLoad];
  v3 = [(PKPaymentDocumentSubmissionIDCaptureViewController *)self view];
  objc_super v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  if ((self->_featureIdentifier | 2) == 3)
  {
    v5 = [(PKPaymentDocumentSubmissionIDCaptureViewController *)self navigationItem];
    [v5 setBackBarButtonItem:0];
    buttonCancel = self->_buttonCancel;
    if (!buttonCancel)
    {
      v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
      v8 = self->_buttonCancel;
      self->_buttonCancel = v7;

      buttonCancel = self->_buttonCancel;
    }
    [v5 setLeftBarButtonItem:buttonCancel];
    id v9 = [(PKPaymentDocumentSubmissionIDCaptureViewController *)self navigationItem];
    [v9 setHidesBackButton:1];
  }
  PKPaymentSetupApplyContextAppearance(self->_context, v3);
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  [(CRCameraReader *)&v20 viewDidLayoutSubviews];
  v3 = [(PKPaymentDocumentSubmissionIDCaptureViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  -[PKCameraCaptureInstructionView sizeThatFits:](self->_cameraInstructionView, "sizeThatFits:", v9, v11 - v14);
  memset(&slice, 0, sizeof(slice));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  CGFloat v17 = v15 + v15 + v16 + fmax(v11 - (v13 + v15) - (v15 + v16) + -337.0, 0.0);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v18, v17, CGRectMaxYEdge);
  -[UIView setFrame:](self->_cameraView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  -[UIView setFrame:](self->_cameraInstructionContainerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  [(UIView *)self->_cameraInstructionContainerView bounds];
  CGRect v18 = v22;
  CGRectDivide(v22, &slice, &v18, v15, CGRectMaxYEdge);
  -[PKCameraCaptureInstructionView setFrame:](self->_cameraInstructionView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  [(UIView *)self->_cameraView setNeedsLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  [(CRCameraReader *)&v7 viewWillAppear:a3];
  [(CRCameraReader *)self start];
  [(PKPaymentDocumentSubmissionController *)self->_captureController setDelegate:self];
  self->_reachedTimeout = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKPaymentDocumentSubmissionIDCaptureViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_1E59D3980;
  v6[4] = self;
  double v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v6 block:10.0];
  timerTryAgain = self->_timerTryAgain;
  self->_timerTryAgain = v4;

  [(PKPaymentDocumentSubmissionIDCaptureViewController *)self updateUIWithState:[(PKPaymentDocumentSubmissionController *)self->_captureController state]];
}

uint64_t __69__PKPaymentDocumentSubmissionIDCaptureViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1536) = 1;
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = [v1[188] state];

  return [v1 updateUIWithState:v2];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentDocumentSubmissionIDCaptureViewController;
  [(PKPaymentDocumentSubmissionIDCaptureViewController *)&v9 viewDidAppear:a3];
  if (os_variant_has_internal_ui())
  {
    double v4 = PKCIPInputFile();
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      if ([v5 fileExistsAtPath:v4])
      {
        double v6 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithContentsOfFile:v4];
        objc_super v7 = PKLogFacilityTypeGetObject();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          if (v8)
          {
            *(_DWORD *)buf = 138412290;
            double v11 = v4;
            _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Using CIP capture image override at path: '%@'", buf, 0xCu);
          }

          [(PKPaymentDocumentSubmissionController *)self->_captureController capturedImage:v6];
        }
        else
        {
          if (v8)
          {
            *(_DWORD *)buf = 138412290;
            double v11 = v4;
            _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Could not load data for file at path: '%@'", buf, 0xCu);
          }

          double v6 = 0;
        }
      }
      else
      {
        double v6 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v11 = v4;
          _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Warning: File does not exist at path: '%@'", buf, 0xCu);
        }
      }
    }
  }
}

- (void)cancel
{
}

- (void)updateUIWithState:(int64_t)a3
{
  id v5 = [(PKCameraCaptureInstructionView *)self->_cameraInstructionView headerView];
  if (a3 == 2)
  {
    [(CRCameraReader *)self setEnableAltIDCardScan:self->_reachedTimeout];
    double v6 = [(PKPaymentDocumentSubmissionController *)self->_captureController preferredLanguage];
    [(PKPaymentDocumentSubmissionController *)self->_captureController side];
    objc_super v7 = [v5 titleLabel];
    BOOL v8 = PKLocalizedApplyFeatureString();
    [v7 setText:v8];

    objc_super v9 = [v5 subtitleLabel];
    uint64_t v12 = PKLocalizedApplyFeatureString();
    [v9 setText:v12];
  }
  else
  {
    [(NSTimer *)self->_timerTryAgain invalidate];
    timerTryAgain = self->_timerTryAgain;
    self->_timerTryAgain = 0;

    self->_reachedTimeout = 0;
    double v11 = [(PKPaymentDocumentSubmissionController *)self->_captureController nextViewController];
    double v6 = v11;
    if (v11)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PKPaymentDocumentSubmissionIDCaptureViewController_updateUIWithState___block_invoke;
      v15[3] = &unk_1E59CA870;
      v15[4] = self;
      id v16 = v11;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }

  int64_t context = self->_context;
  double v14 = [(PKPaymentDocumentSubmissionIDCaptureViewController *)self view];
  PKPaymentSetupApplyContextAppearance(context, v14);
}

void __72__PKPaymentDocumentSubmissionIDCaptureViewController_updateUIWithState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  objc_msgSend(v2, "pk_presentPaymentSetupViewController:animated:completion:", *(void *)(a1 + 40), 1, 0);
}

- (void)captureController:(id)a3 didChangeStateTo:(int64_t)a4
{
}

- (void)cameraReaderDidCancel:(id)a3
{
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [v9 count];
  double v6 = v9;
  if (v5)
  {
    objc_super v7 = [v9 firstObject];
    BOOL v8 = [v7 imageValue];
    if (v8)
    {
      PKAnalyticsSendEventForFeature();
      [(PKPaymentDocumentSubmissionController *)self->_captureController capturedImage:v8];
    }

    double v6 = v9;
  }
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  captureController = self->_captureController;
  if (captureController) {
    [(PKPaymentDocumentSubmissionController *)captureController captureFailedWithError:a4];
  }
}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonCancel, 0);
  objc_storeStrong((id *)&self->_timerTryAgain, 0);
  objc_storeStrong((id *)&self->_cameraInstructionView, 0);
  objc_storeStrong((id *)&self->_cameraInstructionContainerView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);

  objc_storeStrong((id *)&self->_captureController, 0);
}

@end