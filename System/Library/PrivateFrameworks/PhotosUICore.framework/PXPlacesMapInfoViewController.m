@interface PXPlacesMapInfoViewController
- (PXPlacesMapInfoViewController)init;
- (PXPlacesMapInfoViewController)initWithCoder:(id)a3;
- (PXPlacesMapInfoViewController)initWithMapModeController:(id)a3;
- (PXPlacesMapInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPlacesMapModeController)mapModeController;
- (void)mapTypeChanged:(id)a3;
- (void)tapped3dButton:(id)a3;
- (void)tappedDimView:(id)a3;
- (void)tappedDone:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPlacesMapInfoViewController

- (void).cxx_destruct
{
}

- (PXPlacesMapModeController)mapModeController
{
  return self->_mapModeController;
}

- (void)mapTypeChanged:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v8 selectedSegmentIndex];
    if (v4 == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4 == 1;
    }
    v6 = [(PXPlacesMapInfoViewController *)self mapModeController];
    [v6 setMapStyle:v5];
  }
  v7 = [(PXPlacesMapInfoViewController *)self presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)tapped3dButton:(id)a3
{
  uint64_t v4 = [(PXPlacesMapInfoViewController *)self mapModeController];
  char v5 = [v4 togglePerspectiveIfPossible];

  if ((v5 & 1) == 0) {
    PXAssertGetLog();
  }
  v6 = [(PXPlacesMapInfoViewController *)self presentingViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)tappedDimView:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(PXPlacesMapInfoViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)tappedDone:(id)a3
{
  id v3 = [(PXPlacesMapInfoViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v48[3] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)PXPlacesMapInfoViewController;
  [(PXPlacesMapInfoViewController *)&v47 viewDidLoad];
  id v3 = PXLocalizedStringFromTable(@"PXPlacesFullSizeViewTitle", @"PhotosUICore");
  [(PXPlacesMapInfoViewController *)self setTitle:v3];

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_tappedDone_];
  char v5 = [(PXPlacesMapInfoViewController *)self navigationItem];
  v46 = (void *)v4;
  [v5 setRightBarButtonItem:v4];

  id v6 = objc_alloc(MEMORY[0x1E4FB1C10]);
  v7 = PXLocalizedStringFromTable(@"PXPlacesMapTypeStandardButtonTitle", @"PhotosUICore");
  v48[0] = v7;
  id v8 = PXLocalizedStringFromTable(@"PXPlacesMapTypeHybridButtonTitle", @"PhotosUICore");
  v48[1] = v8;
  v9 = PXLocalizedStringFromTable(@"PXPlacesMapTypeSatelliteButtonTitle", @"PhotosUICore");
  v48[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  v11 = (void *)[v6 initWithItems:v10];

  v12 = [(PXPlacesMapInfoViewController *)self mapModeController];
  uint64_t v13 = [v12 mapStyle];
  if (v13 == 2) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = v13 == 1;
  }
  [v11 setSelectedSegmentIndex:v14];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addTarget:self action:sel_mapTypeChanged_ forControlEvents:4096];
  v15 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v16 = PXLocalizedStringFromTable(@"PXPlaces3dMapButtonTitle", @"PhotosUICore");
  v17 = [(PXPlacesMapInfoViewController *)self mapModeController];
  char v18 = [v17 supportsPerspectiveToggling];

  if (v18)
  {
    v19 = [(PXPlacesMapInfoViewController *)self mapModeController];
    int v20 = [v19 is3DPerspectiveActive];

    if (v20)
    {
      uint64_t v21 = PXLocalizedStringFromTable(@"PXPlaces2dMapButtonTitle", @"PhotosUICore");

      v16 = (void *)v21;
    }
  }
  else
  {
    [v15 setEnabled:0];
  }
  v45 = v16;
  [v15 setTitle:v16 forState:0];
  [v15 addTarget:self action:sel_tapped3dButton_ forControlEvents:64];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v22 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [MEMORY[0x1E4FB1618] blackColor];
  [v22 setBackgroundColor:v23];

  [v22 setAlpha:0.5];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tappedDimView_];
  [v22 addGestureRecognizer:v24];

  id v25 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v25 setBackgroundColor:v26];

  [v25 addSubview:v11];
  [v25 addSubview:v15];
  v27 = _NSDictionaryOfVariableBindings(&cfstr_Maptypecontrol.isa, v11, v15, 0);
  [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[mapTypeControl]-[map3dControl]-|" options:0 metrics:0 views:v27];
  v28 = v11;
  v29 = v44 = v11;
  [v25 addConstraints:v29];

  v30 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[mapTypeControl]-|" options:0 metrics:0 views:v27];
  [v25 addConstraints:v30];

  v31 = (void *)MEMORY[0x1E4F28DC8];
  v32 = [v28 superview];
  v33 = [v31 constraintWithItem:v15 attribute:9 relatedBy:0 toItem:v32 attribute:9 multiplier:1.0 constant:0.0];
  [v25 addConstraint:v33];

  v34 = [(PXPlacesMapInfoViewController *)self view];
  v35 = [MEMORY[0x1E4FB1618] clearColor];
  [v34 setBackgroundColor:v35];

  [v34 addSubview:v22];
  [v34 addSubview:v25];
  v36 = [v22 topAnchor];
  v37 = [v34 safeAreaLayoutGuide];
  v38 = [v37 topAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = _NSDictionaryOfVariableBindings(&cfstr_DimviewButtonc.isa, v22, v25, 0);
  v41 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[dimView][buttonContainer]|" options:0 metrics:0 views:v40];
  [v34 addConstraints:v41];

  v42 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[dimView]|" options:0 metrics:0 views:v40];
  [v34 addConstraints:v42];

  v43 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[buttonContainer]|" options:0 metrics:0 views:v40];
  [v34 addConstraints:v43];
}

- (PXPlacesMapInfoViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapInfoViewController.m", 80, @"%s is not available as initializer", "-[PXPlacesMapInfoViewController initWithCoder:]");

  abort();
}

- (PXPlacesMapInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapInfoViewController.m", 76, @"%s is not available as initializer", "-[PXPlacesMapInfoViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapInfoViewController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapInfoViewController.m", 72, @"%s is not available as initializer", "-[PXPlacesMapInfoViewController init]");

  abort();
}

- (PXPlacesMapInfoViewController)initWithMapModeController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapInfoViewController;
  id v6 = [(PXPlacesMapInfoViewController *)&v9 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapModeController, a3);
    [(PXPlacesMapInfoViewController *)v7 setModalPresentationStyle:5];
  }

  return v7;
}

@end