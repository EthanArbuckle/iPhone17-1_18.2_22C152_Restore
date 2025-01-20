@interface CACGestureLivePreviewOverlayManager
- (BOOL)isOverlay;
- (BOOL)isPhysiciallyInteractiveOverlay;
- (CACGestureLivePreviewViewController)gestureViewController;
- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5;
- (void)removeTrackingForFingerIdentifier:(id)a3;
- (void)setGestureViewController:(id)a3;
- (void)showGestureLivePreviewViewer;
@end

@implementation CACGestureLivePreviewOverlayManager

- (void)showGestureLivePreviewViewer
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __67__CACGestureLivePreviewOverlayManager_showGestureLivePreviewViewer__block_invoke_2;
  v2[3] = &unk_264D11A68;
  v2[4] = self;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:&__block_literal_global_5 updateHandler:v2];
}

CACGestureLivePreviewViewController *__67__CACGestureLivePreviewOverlayManager_showGestureLivePreviewViewer__block_invoke()
{
  v0 = objc_alloc_init(CACGestureLivePreviewViewController);
  return v0;
}

uint64_t __67__CACGestureLivePreviewOverlayManager_showGestureLivePreviewViewer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setGestureViewController:a2];
}

- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CACGestureLivePreviewOverlayManager *)self gestureViewController];
  [v10 addPointsToLiveRecordingGesturePreviewByFingerIdentifier:v9 forces:v8 atTime:a5];
}

- (void)removeTrackingForFingerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CACGestureLivePreviewOverlayManager *)self gestureViewController];
  [v5 removeTrackingForFingerIdentifier:v4];
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)isPhysiciallyInteractiveOverlay
{
  return 1;
}

- (CACGestureLivePreviewViewController)gestureViewController
{
  return self->_gestureViewController;
}

- (void)setGestureViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end