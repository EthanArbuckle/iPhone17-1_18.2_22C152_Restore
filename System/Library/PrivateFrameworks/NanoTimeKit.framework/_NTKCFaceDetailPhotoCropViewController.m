@interface _NTKCFaceDetailPhotoCropViewController
- (NTKCompanionCustomPhotosEditor)editor;
- (NTKDigitalTimeLabelStyle)timeStyle;
- (NTKFace)face;
- (_NTKCFaceDetailPhotoCropViewController)initWithIndex:(unint64_t)a3 inPhotosEditor:(id)a4 forFace:(id)a5 timeStyle:(id)a6 completionHandler:(id)a7;
- (unint64_t)index;
- (void)_cancelPressed;
- (void)_deletePressed;
- (void)_donePressed;
- (void)dismissWithSaving:(BOOL)a3;
- (void)setEditor:(id)a3;
- (void)setFace:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setTimeStyle:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _NTKCFaceDetailPhotoCropViewController

- (_NTKCFaceDetailPhotoCropViewController)initWithIndex:(unint64_t)a3 inPhotosEditor:(id)a4 forFace:(id)a5 timeStyle:(id)a6 completionHandler:(id)a7
{
  v33[5] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  v16 = [(_NTKCFaceDetailPhotoCropViewController *)&v32 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    [(_NTKCFaceDetailPhotoCropViewController *)v16 setIndex:a3];
    [(_NTKCFaceDetailPhotoCropViewController *)v17 setEditor:v12];
    [(_NTKCFaceDetailPhotoCropViewController *)v17 setFace:v13];
    [(_NTKCFaceDetailPhotoCropViewController *)v17 setTimeStyle:v14];
    v18 = [(_NTKCFaceDetailPhotoCropViewController *)v17 navigationItem];
    [v18 setHidesBackButton:1];

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:16 target:v17 action:sel__deletePressed];
    deleteButton = v17->_deleteButton;
    v17->_deleteButton = (UIBarButtonItem *)v19;

    [(UIBarButtonItem *)v17->_deleteButton setEnabled:[(NTKCompanionCustomPhotosEditor *)v17->_editor photosCount] > 1];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v17 action:sel__cancelPressed];
    cancelButton = v17->_cancelButton;
    v17->_cancelButton = (UIBarButtonItem *)v21;

    v33[0] = v17->_cancelButton;
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v33[1] = v23;
    v33[2] = v17->_deleteButton;
    v24 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v33[3] = v24;
    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v17 action:sel__donePressed];
    v33[4] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
    [(_NTKCFaceDetailPhotoCropViewController *)v17 setToolbarItems:v26];

    v28 = NTKCCustomizationLocalizedString(@"PHOTOS_CROP_TITLE", @"Move and Scale", v27);
    [(_NTKCFaceDetailPhotoCropViewController *)v17 setTitle:v28];

    v29 = _Block_copy(v15);
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v29;
  }
  return v17;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  [(_NTKCFaceDetailPhotoCropViewController *)&v41 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x1E4F39C88] layer];
  reverseMask = self->_reverseMask;
  self->_reverseMask = v5;

  id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:1.0];
  -[CAShapeLayer setFillColor:](self->_reverseMask, "setFillColor:", [v7 CGColor]);

  v8 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  v9 = [v8 layer];
  [v9 addSublayer:self->_reverseMask];

  v10 = [NTKCCenteringScrollView alloc];
  v11 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  [v11 bounds];
  id v12 = -[NTKCCenteringScrollView initWithFrame:](v10, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v12;

  id v14 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(NTKCCenteringScrollView *)self->_scrollView setBackgroundColor:v14];

  [(NTKCCenteringScrollView *)self->_scrollView setMinimumZoomScale:0.1];
  if ([(NTKCompanionCustomPhotosEditor *)self->_editor canChangeOriginalCropOfPhotoAtIndex:self->_index])
  {
    [(NTKCompanionCustomPhotosEditor *)self->_editor minimumNormalizedCropSizeForPhotoAtIndex:self->_index];
    double v16 = 1.0 / v15;
    double v18 = 1.0 / v17;
    if (v16 >= v18) {
      double v16 = v18;
    }
    [(NTKCCenteringScrollView *)self->_scrollView setMaximumZoomRatio:v16];
  }
  else
  {
    [(NTKCCenteringScrollView *)self->_scrollView setMaximumZoomRatio:1.0];
    [(NTKCCenteringScrollView *)self->_scrollView setScrollEnabled:0];
    [(UIBarButtonItem *)self->_cancelButton setEnabled:0];
  }
  uint64_t v19 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  [v19 addSubview:self->_scrollView];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E62C2120;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  editor = self->_editor;
  unint64_t index = self->_index;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_2;
  v38[3] = &unk_1E62C2170;
  v38[4] = self;
  id v39 = v20;
  id v23 = v20;
  [(NTKCompanionCustomPhotosEditor *)editor imageInPhotoLibraryForPhotoAtIndex:index completion:v38];
  v24 = [MEMORY[0x1E4F39C88] layer];
  mask = self->_mask;
  self->_mask = v24;

  [(CAShapeLayer *)self->_mask setFillRule:*MEMORY[0x1E4F39FB8]];
  id v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  -[CAShapeLayer setFillColor:](self->_mask, "setFillColor:", [v26 CGColor]);

  uint64_t v27 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  v28 = [v27 layer];
  [v28 addSublayer:self->_mask];

  v29 = (UIView *)objc_opt_new();
  timeContainer = self->_timeContainer;
  self->_timeContainer = v29;

  [(UIView *)self->_timeContainer setUserInteractionEnabled:0];
  v31 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  [v31 addSubview:self->_timeContainer];

  objc_super v32 = [MEMORY[0x1E4F19A30] currentDevice];
  v33 = +[CLKUITimeLabel labelWithOptions:0 forDevice:v32];
  time = self->_time;
  self->_time = v33;

  [(NTKDigitalTimeLabel *)self->_time setUsesLegibility:1];
  v35 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
  [(NTKDigitalTimeLabel *)self->_time setTextColor:v35];

  v36 = +[NTKDate faceDate];
  v37 = [(CLKUITimeLabel *)self->_time timeFormatter];
  [v37 setOverrideDate:v36];

  [(NTKDigitalTimeLabel *)self->_time setStyle:self->_timeStyle];
  [(UIView *)self->_timeContainer addSubview:self->_time];
}

- (void)viewDidLayoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  [(_NTKCFaceDetailPhotoCropViewController *)&v56 viewDidLayoutSubviews];
  v3 = [(_NTKCFaceDetailPhotoCropViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(_NTKCFaceDetailPhotoCropViewController *)self face];
  id v13 = [v12 device];
  [v13 screenBounds];
  CGFloat v49 = v15;
  CGFloat v50 = v14;
  CGFloat v51 = v17;
  CGFloat v52 = v16;

  double v18 = [(_NTKCFaceDetailPhotoCropViewController *)self face];
  uint64_t v19 = [v18 device];
  [v19 screenCornerRadius];
  double rect_8 = v20;

  -[NTKCCenteringScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  -[NTKCCenteringScrollView setContentInset:](self->_scrollView, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  UIRectCenteredIntegralRectScale();
  CGFloat rect = v21;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [(NTKCCenteringScrollView *)self->_scrollView safeAreaInsets];
  double v29 = v28;
  [(NTKCCenteringScrollView *)self->_scrollView safeAreaInsets];
  CGFloat v31 = v29 - v30;
  v57.origin.double x = rect;
  v57.origin.double y = v23;
  v57.size.double width = v25;
  v57.size.double height = v27;
  CGRect v58 = CGRectOffset(v57, 0.0, v31);
  double x = v58.origin.x;
  double y = v58.origin.y;
  double width = v58.size.width;
  double height = v58.size.height;
  -[CAShapeLayer setFrame:](self->_mask, "setFrame:", v5, v7, v9, v11);
  v36 = (void *)MEMORY[0x1E4FB14C0];
  [(CAShapeLayer *)self->_mask bounds];
  v37 = objc_msgSend(v36, "bezierPathWithRect:");
  v38 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, rect_8);
  [v37 appendPath:v38];

  id v39 = v37;
  -[CAShapeLayer setPath:](self->_mask, "setPath:", [v39 CGPath]);
  -[CAShapeLayer setFrame:](self->_reverseMask, "setFrame:", x, y, width, height);
  v40 = (void *)MEMORY[0x1E4FB14C0];
  [(CAShapeLayer *)self->_reverseMask bounds];
  objc_msgSend(v40, "bezierPathWithRoundedRect:cornerRadius:");
  id v41 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_reverseMask, "setPath:", [v41 CGPath]);

  timeContainer = self->_timeContainer;
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v55[0] = *MEMORY[0x1E4F1DAB8];
  v55[1] = v43;
  v55[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)timeContainer setTransform:v55];
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->_timeContainer setFrame:0];
  v59.origin.double x = v50;
  v59.origin.double y = v49;
  v59.size.double width = v52;
  v59.size.double height = v51;
  double v44 = 272.0 / CGRectGetWidth(v59);
  v60.origin.double x = v50;
  v60.origin.double y = v49;
  v60.size.double width = v52;
  v60.size.double height = v51;
  double v45 = 340.0 / CGRectGetHeight(v60);
  if (v44 >= v45) {
    double v45 = v44;
  }
  CGAffineTransformMakeScale(&v54, v45, v45);
  v46 = self->_timeContainer;
  CGAffineTransform v53 = v54;
  [(UIView *)v46 setTransform:&v53];
  [(NTKDigitalTimeLabel *)self->_time setFrameUsingCurrentStyle];
  -[NTKCCenteringScrollView setMinimumDisplaySize:](self->_scrollView, "setMinimumDisplaySize:", width, height);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NTKCFaceDetailPhotoCropViewController;
  [(_NTKCFaceDetailPhotoCropViewController *)&v5 viewWillDisappear:a3];
  id completionHandler = (void (**)(void))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2]();
  }
}

- (void)_cancelPressed
{
  [(NTKCCenteringScrollView *)self->_scrollView cropRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NTKCompanionCustomPhotosEditor *)self->_editor originalCropForPhotoAtIndex:self->_index];
  v28.origin.double x = v11;
  v28.origin.double y = v12;
  v28.size.double width = v13;
  v28.size.double height = v14;
  v27.origin.double x = v4;
  v27.origin.double y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  if (CGRectEqualToRect(v27, v28))
  {
    self->_cancelConfirmed = 1;
  }
  else if (!self->_cancelConfirmed)
  {
    double v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    double v16 = (void *)MEMORY[0x1E4FB1410];
    double v18 = NTKCCustomizationLocalizedString(@"PHOTOS_CROP_CANCEL", @"Discard Changes", v17);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56___NTKCFaceDetailPhotoCropViewController__cancelPressed__block_invoke;
    v25[3] = &unk_1E62C0AA8;
    v25[4] = self;
    uint64_t v19 = [v16 actionWithTitle:v18 style:0 handler:v25];
    [v15 addAction:v19];

    double v20 = (void *)MEMORY[0x1E4FB1410];
    double v22 = NTKCCustomizationLocalizedString(@"PHOTOS_CANCEL_BUTTON", @"Cancel", v21);
    CGFloat v23 = [v20 actionWithTitle:v22 style:1 handler:0];
    [v15 addAction:v23];

    double v24 = [(_NTKCFaceDetailPhotoCropViewController *)self parentViewController];
    [v24 presentViewController:v15 animated:1 completion:0];

    return;
  }
  self->_cancelConfirmed = 0;

  [(_NTKCFaceDetailPhotoCropViewController *)self dismissWithSaving:0];
}

- (void)_deletePressed
{
  if (self->_deleteConfirmed)
  {
    self->_deleteConfirmed = 0;
    [(NTKCompanionCustomPhotosEditor *)self->_editor deletePhotoAtIndex:self->_index];
    [(_NTKCFaceDetailPhotoCropViewController *)self dismissWithSaving:0];
  }
  else
  {
    CGFloat v4 = NTKCCustomizationLocalizedString(@"PHOTOS_DELETE_CONFIRMATION_SINGULAR", @"Delete Confirmation", v2);
    double v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v4 preferredStyle:0];
    double v7 = NTKCCustomizationLocalizedString(@"PHOTOS_DELETE_BUTTON_SINGULAR", @"Delete Photos", v6);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56___NTKCFaceDetailPhotoCropViewController__deletePressed__block_invoke;
    v13[3] = &unk_1E62C0AA8;
    v13[4] = self;
    CGFloat v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v7 style:2 handler:v13];
    [v5 addAction:v8];

    double v9 = (void *)MEMORY[0x1E4FB1410];
    CGFloat v11 = NTKCCustomizationLocalizedString(@"PHOTOS_CANCEL_BUTTON", @"Cancel", v10);
    CGFloat v12 = [v9 actionWithTitle:v11 style:1 handler:0];
    [v5 addAction:v12];

    [(_NTKCFaceDetailPhotoCropViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_donePressed
{
}

- (void)dismissWithSaving:(BOOL)a3
{
  if (a3)
  {
    [(NTKCCenteringScrollView *)self->_scrollView cropRect];
    if (!CGRectIsEmpty(v14))
    {
      [(NTKCCenteringScrollView *)self->_scrollView cropRect];
      double x = v4;
      double y = v6;
      double width = v8;
      double height = v10;
      double photoScale = self->_photoScale;
      if (photoScale != 0.0)
      {
        CGAffineTransformMakeScale(&v13, photoScale, self->_photoScale);
        v15.origin.double x = x;
        v15.origin.double y = y;
        v15.size.double width = width;
        v15.size.double height = height;
        CGRect v16 = CGRectApplyAffineTransform(v15, &v13);
        double x = v16.origin.x;
        double y = v16.origin.y;
        double width = v16.size.width;
        double height = v16.size.height;
      }
      -[NTKCompanionCustomPhotosEditor setOriginalCrop:forPhotoAtIndex:](self->_editor, "setOriginalCrop:forPhotoAtIndex:", self->_index, x, y, width, height);
    }
  }
  [(_NTKCFaceDetailPhotoCropViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_unint64_t index = a3;
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NTKDigitalTimeLabelStyle)timeStyle
{
  return self->_timeStyle;
}

- (void)setTimeStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStyle, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_timeContainer, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_reverseMask, 0);
}

@end