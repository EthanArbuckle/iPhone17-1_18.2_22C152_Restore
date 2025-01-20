@interface PUVideoEditOverlayViewController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedTimeForPlayerTime:(SEL)a3;
- (BOOL)disabledForCinematographyScriptLoad;
- (BOOL)isHidden;
- (CALayer)safeAreaMask;
- (CGRect)rectForFocusStateBadge:(id)a3;
- (NUMediaView)mediaView;
- (PUVideoEditOverlayViewController)initWithMediaView:(id)a3 cineController:(id)a4;
- (PUVideoEditOverlayViewControllerDelegate)overlayControllerDelegate;
- (PXUISubjectTrackingView)trackingView;
- (id)composition;
- (id)compositionController;
- (id)localizedStringForCinematicTrackingBadgeMessage:(int64_t)a3;
- (id)newFocusStatusBadge;
- (id)newTrackingViewWithFrame:(CGRect)a3 initialState:(int64_t)a4;
- (void)_setState:(int64_t)a3 forView:(id)a4 animated:(BOOL)a5;
- (void)enableUIForCinematographyScriptLoad:(BOOL)a3;
- (void)frameTimeDidChange;
- (void)interactionBegan;
- (void)loadView;
- (void)objectTrackingFinishedWithSuccess:(BOOL)a3;
- (void)objectTrackingStartedAtTime:(id *)a3;
- (void)renderDidChange:(BOOL)a3;
- (void)scriptDidUpdate;
- (void)setDisabledForCinematographyScriptLoad:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setMediaView:(id)a3;
- (void)setMessage:(id)a3 forFocusStateBadge:(id)a4;
- (void)setNeedsUpdateTrackingFrame;
- (void)setOverlayControllerDelegate:(id)a3;
- (void)setSafeAreaMask:(id)a3;
- (void)setTrackingInProgressTextForFocusStateBadge:(id)a3;
- (void)setTrackingView:(id)a3;
- (void)showTrackingInformationalString:(id)a3;
- (void)subjectFocusStateDidChange:(int64_t)a3 forBadge:(id)a4 focusedDisparity:(double)a5;
- (void)trackedObjectWasUpdatedAtTime:(id *)a3 shouldStop:(BOOL *)a4;
- (void)trackingWasEdited;
- (void)trackingWasEditedAtTime:(id *)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PUVideoEditOverlayViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAreaMask, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_trackingView, 0);
  objc_destroyWeak((id *)&self->_overlayControllerDelegate);
}

- (void)setDisabledForCinematographyScriptLoad:(BOOL)a3
{
  self->_disabledForCinematographyScriptLoad = a3;
}

- (BOOL)disabledForCinematographyScriptLoad
{
  return self->_disabledForCinematographyScriptLoad;
}

- (void)setSafeAreaMask:(id)a3
{
}

- (void)setMediaView:(id)a3
{
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setTrackingView:(id)a3
{
}

- (PXUISubjectTrackingView)trackingView
{
  return self->_trackingView;
}

- (void)setOverlayControllerDelegate:(id)a3
{
}

- (PUVideoEditOverlayViewControllerDelegate)overlayControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayControllerDelegate);
  return (PUVideoEditOverlayViewControllerDelegate *)WeakRetained;
}

- (void)showTrackingInformationalString:(id)a3
{
}

- (id)localizedStringForCinematicTrackingBadgeMessage:(int64_t)a3
{
  v3 = @"PHOTOEDIT_CINEMATIC_TRACKING_MESSAGE_ON";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return PULocalizedString(v3);
  }
  else {
    return PULocalizedString(@"PHOTOEDIT_CINEMATIC_TRACKING_MESSAGE_OFF");
  }
}

- (void)interactionBegan
{
  id v2 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  [v2 interactionBegan];
}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXUISubjectTrackingView *)self->_trackingView setViewEnabled:1];
  id v5 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  [v5 objectTrackingFinishedWithSuccess:v3];
}

- (void)trackedObjectWasUpdatedAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  v6 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  [v6 trackedObjectWasUpdatedAtTime:&v7 shouldStop:a4];
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  [(PXUISubjectTrackingView *)self->_trackingView setViewEnabled:0];
  id v5 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [v5 objectTrackingStartedAtTime:&v6];
}

- (void)subjectFocusStateDidChange:(int64_t)a3 forBadge:(id)a4 focusedDisparity:(double)a5
{
  id v14 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = @"UNKNOWN";
  if (a3 == 2) {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = @"PHOTOEDIT_CINEMATIC_FOCUS_STATE_HARD";
  }
  if (a3 == 4) {
    v8 = @"PHOTOEDIT_CINEMATIC_FOCUS_STATE_FIXED";
  }
  else {
    v8 = v7;
  }
  v9 = PULocalizedString(v8);
  if ((unint64_t)(a3 - 3) <= 1 && a5 != 0.0)
  {
    v10 = PULocalizedString(@"PHOTOEDIT_CINEMATIC_FOCUS_STATE_FIXED_DISTANCE_FMT");
    double v13 = 1.0 / a5;
    v12 = v9;
    uint64_t v11 = PUStringWithValidatedFormat();

    v9 = (void *)v11;
  }
  objc_msgSend(v14, "_setText:", v9, v12, *(void *)&v13);
}

- (void)_setState:(int64_t)a3 forView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  switch(a3)
  {
    case 1:
      uint64_t v6 = 0;
      goto LABEL_7;
    case 2:
      uint64_t v6 = 0;
      uint64_t v7 = 1;
      break;
    case 3:
    case 4:
      uint64_t v6 = 0;
      uint64_t v7 = 3;
      break;
    case 5:
      uint64_t v6 = 1;
LABEL_7:
      uint64_t v7 = 2;
      break;
    default:
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      break;
  }
  id v8 = a4;
  [v8 setShape:v7 animated:v5];
  [v8 setIsPulsing:v6];
}

- (void)setMessage:(id)a3 forFocusStateBadge:(id)a4
{
}

- (void)setTrackingInProgressTextForFocusStateBadge:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUVideoEditOverlayViewController.m" lineNumber:255 description:@"Unexpected focus state badge view class"];
  }
  BOOL v5 = PULocalizedString(@"PHOTOEDIT_CINEMATIC_TRACKING_IN_PROGRESS");
  [v7 _setText:v5];
}

- (CGRect)rectForFocusStateBadge:(id)a3
{
  objc_msgSend(a3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v5 = v4;
  double v7 = v6;
  id v8 = [(PUVideoEditOverlayViewController *)self mediaView];
  [v8 frame];
  double v10 = (v9 - v5) * 0.5;
  [v8 imageFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(PUVideoEditOverlayViewController *)self view];
  objc_msgSend(v8, "convertRect:toView:", v19, v12, v14, v16, v18);
  double v21 = v20 + 9.0;

  v22 = [(PUVideoEditOverlayViewController *)self view];
  [v22 safeAreaInsets];
  double v24 = v23 + 20.0;

  if (v21 < v24) {
    double v21 = v24;
  }

  double v25 = v10;
  double v26 = v21;
  double v27 = v5;
  double v28 = v7;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)newFocusStatusBadge
{
  id v2 = objc_alloc(MEMORY[0x1E4F57D38]);
  BOOL v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v4 = [MEMORY[0x1E4FB1618] blackColor];
  double v5 = [v4 colorWithAlphaComponent:0.8];
  [v3 _setFillColor:v5];

  double v6 = [MEMORY[0x1E4FB1618] whiteColor];
  double v7 = [v6 colorWithAlphaComponent:0.8];
  [v3 _setContentColor:v7];

  return v3;
}

- (id)newTrackingViewWithFrame:(CGRect)a3 initialState:(int64_t)a4
{
  double v6 = -[PUCinematicSubjectIndicator initWithFrame:]([PUCinematicSubjectIndicator alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PUVideoEditOverlayViewController *)self _setState:a4 forView:v6 animated:0];
  return v6;
}

- (id)composition
{
  id v2 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  BOOL v3 = [v2 compositionController];
  double v4 = [v3 composition];

  return v4;
}

- (id)compositionController
{
  id v2 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  BOOL v3 = [v2 compositionController];

  return v3;
}

- (void)trackingWasEditedAtTime:(id *)a3
{
  double v4 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [v4 cinematographyWasEditedAtTime:&v5];
}

- (void)trackingWasEdited
{
  id v2 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
  long long v3 = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [v2 cinematographyWasEditedAtTime:&v3];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedTimeForPlayerTime:(SEL)a3
{
  *retstr = *a4;
  double v7 = [(PUVideoEditOverlayViewController *)self compositionController];
  id v8 = [v7 trimAdjustmentController];

  if (v8)
  {
    double v9 = [(PUVideoEditOverlayViewController *)self overlayControllerDelegate];
    int v10 = [v9 hasTrimmedVideo];

    if (v10)
    {
      [v8 startTime];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
      CMTimeAdd(&v14, (CMTime *)&v12, &rhs);
      *(CMTime *)retstr = v14;
    }
  }

  return result;
}

- (void)setNeedsUpdateTrackingFrame
{
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUVideoEditOverlayViewController *)self setDisabledForCinematographyScriptLoad:!a3];
  [(PXUISubjectTrackingView *)self->_trackingView enableUIForCinematographyScriptLoad:v3];
  trackingView = self->_trackingView;
  [(PXUISubjectTrackingView *)trackingView setViewEnabled:v3];
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(PUVideoEditOverlayViewController *)self view];
  int v8 = [v7 isHidden];
  uint64_t v9 = [(PUVideoEditOverlayViewController *)self disabledForCinematographyScriptLoad] | v5;
  if (v8 != v9)
  {
    if (v4)
    {
      [v7 setHidden:0];
      double v10 = 1.0;
      if (v8) {
        double v11 = 0.0;
      }
      else {
        double v11 = 1.0;
      }
      [v7 setAlpha:v11];
      if (v9) {
        double v10 = 0.0;
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (void *)MEMORY[0x1E4FB1EB0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke;
      v19[3] = &unk_1E5F2E0A8;
      id v20 = v7;
      double v21 = v10;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      double v15 = __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke_2;
      double v16 = &unk_1E5F2BA20;
      id v17 = v20;
      char v18 = v9;
      [v12 animateWithDuration:v19 animations:&v13 completion:0.2];
    }
    else
    {
      [v7 setAlpha:1.0];
      [v7 setHidden:v9];
    }
  }
  -[PXUISubjectTrackingView setViewEnabled:](self->_trackingView, "setViewEnabled:", v9 ^ 1, v13, v14, v15, v16);
}

uint64_t __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __55__PUVideoEditOverlayViewController_setHidden_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setHidden:v2];
}

- (void)setHidden:(BOOL)a3
{
}

- (BOOL)isHidden
{
  uint64_t v2 = [(PUVideoEditOverlayViewController *)self view];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)scriptDidUpdate
{
}

- (void)frameTimeDidChange
{
  [(PXUISubjectTrackingView *)self->_trackingView setNeedsUpdateFrameTime];
  trackingView = self->_trackingView;
  [(PXUISubjectTrackingView *)trackingView scriptDidUpdate];
}

- (void)renderDidChange:(BOOL)a3
{
}

- (CALayer)safeAreaMask
{
  v30[6] = *MEMORY[0x1E4F143B8];
  safeAreaMask = self->_safeAreaMask;
  if (!safeAreaMask)
  {
    BOOL v4 = (CALayer *)objc_opt_new();
    id v5 = [MEMORY[0x1E4FB1618] clearColor];
    -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", [v5 CGColor]);

    double v6 = +[PUPhotoEditProtoSettings sharedInstance];
    int v7 = [v6 toolbarShadowsEnabled];

    if (v7)
    {
      int v8 = objc_opt_new();
      uint64_t v9 = +[PUPhotoEditProtoSettings sharedInstance];
      int v10 = [v9 debugTrackerMask];

      if (v10)
      {
        id v27 = [MEMORY[0x1E4FB1618] redColor];
        v30[0] = [v27 CGColor];
        id v11 = [MEMORY[0x1E4FB1618] redColor];
        v30[1] = [v11 CGColor];
        id v12 = [MEMORY[0x1E4FB1618] greenColor];
        v30[2] = [v12 CGColor];
        id v13 = [MEMORY[0x1E4FB1618] greenColor];
        v30[3] = [v13 CGColor];
        id v14 = [MEMORY[0x1E4FB1618] redColor];
        v30[4] = [v14 CGColor];
        id v15 = [MEMORY[0x1E4FB1618] redColor];
        v30[5] = [v15 CGColor];
        double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:6];
        [v8 setColors:v16];

        LODWORD(v17) = 0.5;
        [(CALayer *)v4 setOpacity:v17];
      }
      else
      {
        id v28 = [MEMORY[0x1E4FB1618] clearColor];
        v29[0] = [v28 CGColor];
        id v19 = [MEMORY[0x1E4FB1618] clearColor];
        v29[1] = [v19 CGColor];
        id v20 = [MEMORY[0x1E4FB1618] whiteColor];
        v29[2] = [v20 CGColor];
        id v21 = [MEMORY[0x1E4FB1618] whiteColor];
        v29[3] = [v21 CGColor];
        id v22 = [MEMORY[0x1E4FB1618] clearColor];
        v29[4] = [v22 CGColor];
        id v23 = [MEMORY[0x1E4FB1618] clearColor];
        v29[5] = [v23 CGColor];
        double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
        [v8 setColors:v24];
      }
    }
    else
    {
      int v8 = objc_opt_new();
      id v18 = [MEMORY[0x1E4FB1618] whiteColor];
      objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));
    }
    [(CALayer *)v4 addSublayer:v8];

    double v25 = self->_safeAreaMask;
    self->_safeAreaMask = v4;

    safeAreaMask = self->_safeAreaMask;
  }
  return safeAreaMask;
}

- (void)viewDidLayoutSubviews
{
  v37[6] = *MEMORY[0x1E4F143B8];
  char v3 = [(PUVideoEditOverlayViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  double v6 = +[PUPhotoEditProtoSettings sharedInstance];
  int v7 = [v6 toolbarShadowsEnabled];

  if (v7)
  {
    int v8 = [(PUVideoEditOverlayViewController *)self safeAreaMask];
    uint64_t v9 = [v8 sublayers];
    int v10 = [v9 firstObject];

    id v11 = [(PUVideoEditOverlayViewController *)self view];
    [v11 bounds];
    objc_msgSend(v8, "setFrame:");

    [v8 bounds];
    objc_msgSend(v10, "setFrame:");
    id v12 = [(PUVideoEditOverlayViewController *)self view];
    [v12 frame];
    double v14 = v13;

    double v15 = v5 / v14;
    v37[0] = &unk_1F078D1A0;
    double v16 = 20.0 / v14;
    double v17 = [NSNumber numberWithDouble:v15];
    v37[1] = v17;
    id v18 = [NSNumber numberWithDouble:v15 + v16];
    v37[2] = v18;
    double v19 = 1.0 - v15;
    id v20 = [NSNumber numberWithDouble:v19 - v16];
    v37[3] = v20;
    id v21 = [NSNumber numberWithDouble:v19];
    v37[4] = v21;
    v37[5] = &unk_1F078D1B0;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
    [v10 setLocations:v22];

    id v23 = [(PXUISubjectTrackingView *)self->_trackingView layer];
    [v23 setMask:v8];

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  if (v5 > 0.0)
  {
    int v8 = [(PUVideoEditOverlayViewController *)self safeAreaMask];
    [(PXUISubjectTrackingView *)self->_trackingView bounds];
    objc_msgSend(v8, "setFrame:");
    [v8 frame];
    double v25 = v24;
    [v8 frame];
    double v27 = v26 - v5;
    id v28 = [v8 sublayers];
    v29 = [v28 firstObject];
    objc_msgSend(v29, "setFrame:", 0.0, v5, v25, v27);

    int v10 = [(PXUISubjectTrackingView *)self->_trackingView layer];
    [v10 setMask:v8];
    goto LABEL_5;
  }
  v35 = [(PXUISubjectTrackingView *)self->_trackingView layer];
  v36 = [v35 mask];

  if (v36)
  {
    int v8 = [(PXUISubjectTrackingView *)self->_trackingView layer];
    [v8 setMask:0];
    goto LABEL_6;
  }
LABEL_7:
  v30 = +[PUPhotoEditProtoSettings sharedInstance];
  int v31 = [v30 debugTrackerMask];

  if (v31)
  {
    v32 = [(PUVideoEditOverlayViewController *)self view];
    v33 = [v32 layer];
    v34 = [(PUVideoEditOverlayViewController *)self safeAreaMask];
    [v33 addSublayer:v34];
  }
}

- (void)loadView
{
}

- (PUVideoEditOverlayViewController)initWithMediaView:(id)a3 cineController:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUVideoEditOverlayViewController.m", 34, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  double v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PUVideoEditOverlayViewController.m", 35, @"Invalid parameter not satisfying: %@", @"cineController != nil" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PUVideoEditOverlayViewController;
  id v11 = [(PUVideoEditOverlayViewController *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F90890]) initWithMediaView:v8 cineController:v10];
    trackingView = v11->_trackingView;
    v11->_trackingView = (PXUISubjectTrackingView *)v12;

    [(PXUISubjectTrackingView *)v11->_trackingView setDelegate:v11];
    objc_storeStrong((id *)&v11->_mediaView, a3);
  }

  return v11;
}

@end