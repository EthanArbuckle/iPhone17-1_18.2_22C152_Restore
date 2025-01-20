@interface PUImportOneUpPreviewingViewController
- (CGSize)sizeForImportItemViewModel:(id)a3;
- (PUImportOneUpPreviewingViewController)initWithImportItemViewModel:(id)a3 startingImage:(id)a4 mediaProvider:(id)a5;
- (PUImportOneUpTransitionView)previewView;
- (PXImportItemViewModel)importItemViewModel;
- (PXImportMediaProvider)mediaProvider;
- (void)setImportItemViewModel:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)updatePreferredContentSize;
- (void)viewDidLoad;
@end

@implementation PUImportOneUpPreviewingViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_importItemViewModel, 0);
}

- (void)setPreviewView:(id)a3
{
}

- (PUImportOneUpTransitionView)previewView
{
  return self->_previewView;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXImportMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setImportItemViewModel:(id)a3
{
}

- (PXImportItemViewModel)importItemViewModel
{
  return self->_importItemViewModel;
}

- (CGSize)sizeForImportItemViewModel:(id)a3
{
  v3 = [a3 importAsset];
  [v3 orientedPixelSize];
  double v6 = v5;
  double v7 = v4;
  if (v5 == *MEMORY[0x1E4F1DB30] && v4 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 bounds];
    double v6 = v10;
    double v7 = v11;
  }
  double v12 = round(v6);
  double v13 = round(v7);
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)updatePreferredContentSize
{
  v3 = [(PUImportOneUpPreviewingViewController *)self importItemViewModel];
  [(PUImportOneUpPreviewingViewController *)self sizeForImportItemViewModel:v3];
  double v5 = v4;
  double v7 = v6;

  if (v5 / v7 >= 0.75) {
    double v8 = v5 / v7;
  }
  else {
    double v8 = 0.75;
  }
  v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 bounds];
  PURectWithAspectRatioFittingRect(v8, v10, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;

  -[PUImportOneUpPreviewingViewController setPreferredContentSize:](self, "setPreferredContentSize:", v15, v17);
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PUImportOneUpPreviewingViewController;
  [(PUImportOneUpPreviewingViewController *)&v16 viewDidLoad];
  v3 = [(PUImportOneUpPreviewingViewController *)self view];
  double v4 = [(PUImportOneUpPreviewingViewController *)self previewView];
  [v3 addSubview:v4];

  double v5 = [(PUImportOneUpPreviewingViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(PUImportOneUpPreviewingViewController *)self previewView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  double v15 = [(PUImportOneUpPreviewingViewController *)self previewView];
  [v15 setAutoresizingMask:18];

  [(PUImportOneUpPreviewingViewController *)self updatePreferredContentSize];
}

- (PUImportOneUpPreviewingViewController)initWithImportItemViewModel:(id)a3 startingImage:(id)a4 mediaProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUImportOneUpPreviewingViewController;
  double v12 = [(PUImportOneUpPreviewingViewController *)&v17 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_importItemViewModel, a3);
    objc_storeStrong((id *)&v13->_mediaProvider, a5);
    double v14 = [[PUImportOneUpTransitionView alloc] initWithImportItem:v13->_importItemViewModel startingImage:v10 mediaProvider:v13->_mediaProvider];
    previewView = v13->_previewView;
    v13->_previewView = v14;
  }
  return v13;
}

@end