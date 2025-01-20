@interface PXPeopleBootstrapConfirmationPreviewViewController
- (BOOL)useLowMemoryMode;
- (PHAsset)keyAsset;
- (PHPerson)person;
- (PXPeopleBootstrapConfirmationPreviewViewController)initWithPerson:(id)a3 keyAsset:(id)a4 useLowMemoryMode:(BOOL)a5;
- (int)requestID;
- (void)dealloc;
- (void)loadView;
- (void)setRequestID:(int)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleBootstrapConfirmationPreviewViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setRequestID:(int)a3
{
  self->_requestID = a3;
}

- (int)requestID
{
  return self->_requestID;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)PXPeopleBootstrapConfirmationPreviewViewController;
  [(PXPeopleBootstrapConfirmationPreviewViewController *)&v23 viewDidLoad];
  v4 = [(PXPeopleBootstrapConfirmationPreviewViewController *)self keyAsset];
  v5 = [(PXPeopleBootstrapConfirmationPreviewViewController *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;

  double v8 = (double)(unint64_t)[v4 pixelWidth] / v7;
  double v9 = (double)(unint64_t)[v4 pixelHeight] / v7;
  -[PXPeopleBootstrapConfirmationPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);
  v10 = [(PXPeopleBootstrapConfirmationPreviewViewController *)self view];
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationPreviewViewController.m", 58, @"%@ should be an instance inheriting from %@, but it is nil", @"self.view", v17 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    v19 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationPreviewViewController.m", 58, @"%@ should be an instance inheriting from %@, but it is %@", @"self.view", v17, v19 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  id v11 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v11 setSynchronous:0];
  [v11 setNetworkAccessAllowed:1];
  [v11 setAllowSecondaryDegradedImage:1];
  [v11 setResizeMode:1];
  [v11 setDeliveryMode:0];
  objc_msgSend(v11, "setUseLowMemoryMode:", -[PXPeopleBootstrapConfirmationPreviewViewController useLowMemoryMode](self, "useLowMemoryMode"));
  v12 = [MEMORY[0x1E4F390D0] defaultManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke;
  v20[3] = &unk_1E5DCBF98;
  id v21 = v10;
  id v22 = v4;
  id v13 = v4;
  id v14 = v10;
  -[PXPeopleBootstrapConfirmationPreviewViewController setRequestID:](self, "setRequestID:", objc_msgSend(v12, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, 0, v11, v20, v8, v9));
}

void __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke_2;
  id v14 = &unk_1E5DD32A8;
  id v15 = *(id *)(a1 + 32);
  id v6 = v5;
  id v16 = v6;
  id v7 = a3;
  dispatch_async(MEMORY[0x1E4F14428], &v11);
  double v8 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F39698], v11, v12, v13, v14);

  if (v8)
  {
    double v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)buf = 138412802;
      v18 = v10;
      __int16 v19 = 2112;
      v20 = v8;
      __int16 v21 = 2080;
      id v22 = "-[PXPeopleBootstrapConfirmationPreviewViewController viewDidLoad]_block_invoke";
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Error fetching image for asset UUID: %@ error: %@ function: %s", buf, 0x20u);
    }
  }
}

uint64_t __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v3 setContentMode:2];
  [(PXPeopleBootstrapConfirmationPreviewViewController *)self setView:v3];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F390D0] defaultManager];
  objc_msgSend(v3, "cancelImageRequest:", -[PXPeopleBootstrapConfirmationPreviewViewController requestID](self, "requestID"));

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapConfirmationPreviewViewController;
  [(PXPeopleBootstrapConfirmationPreviewViewController *)&v4 dealloc];
}

- (PXPeopleBootstrapConfirmationPreviewViewController)initWithPerson:(id)a3 keyAsset:(id)a4 useLowMemoryMode:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleBootstrapConfirmationPreviewViewController;
  uint64_t v11 = [(PXPeopleBootstrapConfirmationPreviewViewController *)&v14 initWithNibName:0 bundle:0];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_person, a3);
    objc_storeStrong((id *)&v12->_keyAsset, a4);
    v12->_useLowMemoryMode = a5;
  }

  return v12;
}

@end