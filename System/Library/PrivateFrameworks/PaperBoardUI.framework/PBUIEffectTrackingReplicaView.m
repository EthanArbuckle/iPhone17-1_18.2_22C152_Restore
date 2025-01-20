@interface PBUIEffectTrackingReplicaView
- (BOOL)hasPortalProvider;
- (BOOL)hasSnapshotProvider;
- (BOOL)isFullscreen;
- (BOOL)observesSnapshotValidity;
- (BOOL)requiresSnapshotTreatment;
- (BOOL)shouldMatchWallpaperPosition;
- (BOOL)showsSnapshot;
- (NSString)reason;
- (PBUIEffectTrackingReplicaView)initWithFrame:(CGRect)a3;
- (PBUIEffectTrackingReplicaViewDelegate)delegate;
- (PBUIFakeBlurObserver)observer;
- (PBUIPosterReplicaPortalProviding)portalProvider;
- (PBUIPosterReplicaSnapshotProviding)snapshotProvider;
- (double)effectWeight;
- (double)zoomScale;
- (id)setNeedsReconfiguration;
- (int64_t)effectiveStyle;
- (int64_t)style;
- (uint64_t)portalView;
- (uint64_t)setObservesSnapshotValidity:(uint64_t)result;
- (uint64_t)snapshotViewStyle;
- (uint64_t)snapshotsView;
- (unint64_t)transformOptions;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)offsetWallpaperBy:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectWeight:(double)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setPortalProvider:(id)a3;
- (void)setPortalView:(uint64_t)a1;
- (void)setReason:(id)a3;
- (void)setRequiresSnapshotTreatment:(BOOL)a3;
- (void)setShouldMatchWallpaperPosition:(BOOL)a3;
- (void)setShowsSnapshot:(BOOL)a3;
- (void)setSnapshotProvider:(id)a3;
- (void)setSnapshotsView:(uint64_t)a1;
- (void)setStyle:(int64_t)a3;
- (void)setTransformOptions:(unint64_t)a3;
- (void)setZoomScale:(double)a3;
@end

@implementation PBUIEffectTrackingReplicaView

- (PBUIEffectTrackingReplicaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PBUIEffectTrackingReplicaView;
  v7 = -[PBUIEffectTrackingReplicaView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[PBUISnapshotReplicaView initWithFrame:]([PBUISnapshotReplicaView alloc], "initWithFrame:", x, y, width, height);
    snapshotsView = v7->_snapshotsView;
    v7->_snapshotsView = v8;

    v10 = -[PBUIPortalReplicaEffectView initWithFrame:]([PBUIPortalReplicaEffectView alloc], "initWithFrame:", x, y, width, height);
    portalView = v7->_portalView;
    v7->_portalView = v10;

    -[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:]((uint64_t)v7, 1);
    [(PBUIEffectTrackingReplicaView *)v7 addSubview:v7->_snapshotsView];
    [(PBUIEffectTrackingReplicaView *)v7 addSubview:v7->_portalView];
    [(PBUIPortalReplicaEffectView *)v7->_portalView setAutoresizingMask:18];
    [(PBUISnapshotReplicaView *)v7->_snapshotsView setAutoresizingMask:18];
    [(PBUIEffectTrackingReplicaView *)v7 setAutoresizingMask:18];
  }
  return v7;
}

- (uint64_t)setObservesSnapshotValidity:(uint64_t)result
{
  if (result)
  {
    char v2 = a2;
    uint64_t v3 = result;
    if (*(unsigned __int8 *)(result + 410) != a2)
    {
      v4 = *(void **)(result + 472);
      if (a2) {
        result = [v4 addObserver:v3 forKeyPath:@"valid" options:1 context:&PrivateKVOContext];
      }
      else {
        result = [v4 removeObserver:v3 forKeyPath:@"valid" context:&PrivateKVOContext];
      }
      *(unsigned char *)(v3 + 410) = v2;
    }
  }
  return result;
}

- (void)dealloc
{
  -[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)PBUIEffectTrackingReplicaView;
  [(PBUIEffectTrackingReplicaView *)&v3 dealloc];
}

- (void)setReason:(id)a3
{
  v4 = (NSString *)[a3 copy];
  reason = self->_reason;
  self->_reason = v4;

  id v6 = [NSString stringWithFormat:@"EffectTrackingView | %@", self->_reason];
  [(PBUIPortalReplicaView *)self->_portalView setReason:v6];
  [(PBUISnapshotReplicaView *)self->_snapshotsView setReason:v6];
}

- (void)setEffectWeight:(double)a3
{
  self->_effectWeight = a3;
}

- (void)invalidate
{
  -[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:]((uint64_t)self, 0);
  [(PBUISnapshotReplicaView *)self->_snapshotsView invalidate];
  portalView = self->_portalView;
  [(PBUIPortalReplicaView *)portalView invalidate];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
  }
}

- (id)setNeedsReconfiguration
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    objc_msgSend(result[60], "requestStyle:", objc_msgSend(result, "style"));
    if (*(unsigned char *)(v1 + 408)) {
      uint64_t v2 = *(void *)(v1 + 440);
    }
    else {
      uint64_t v2 = 0;
    }
    [*(id *)(v1 + 472) setEffectiveStyle:v2];
    unsigned int v3 = [*(id *)(v1 + 472) isValid];
    if (*(unsigned char *)(v1 + 409)) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    [*(id *)(v1 + 472) setHidden:v4 ^ 1];
    if ((v4 ^ 1)) {
      [(id)v1 addSubview:*(void *)(v1 + 480)];
    }
    else {
      [*(id *)(v1 + 480) removeFromSuperview];
    }
    [*(id *)(v1 + 480) setHidden:v4];
    return (id *)-[PBUIEffectTrackingReplicaView setObservesSnapshotValidity:](v1, 1);
  }
  return result;
}

- (void)setShowsSnapshot:(BOOL)a3
{
  if (self->_showsSnapshot != a3)
  {
    self->_showsSnapshot = a3;
    -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
  }
}

- (uint64_t)snapshotViewStyle
{
  if (result)
  {
    if (*(unsigned char *)(result + 408)) {
      return *(void *)(result + 440);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)snapshotsView
{
  if (result) {
    return *(void *)(result + 472);
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PrivateKVOContext)
  {
    if (objc_msgSend(a3, "isEqualToString:", @"valid", a4, a5))
    {
      v7 = self ? self->_snapshotsView : 0;
      if ([(PBUISnapshotReplicaView *)v7 isValid])
      {
        id v8 = [(PBUIEffectTrackingReplicaView *)self delegate];
        [v8 effectTrackingReplicaViewHasValidSnapshot:self];
      }
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PBUIEffectTrackingReplicaView;
    -[PBUIEffectTrackingReplicaView observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setPortalProvider:(id)a3
{
  [(PBUIPortalReplicaView *)self->_portalView setProvider:a3];
  -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
}

- (PBUIPosterReplicaPortalProviding)portalProvider
{
  return [(PBUIPortalReplicaView *)self->_portalView provider];
}

- (void)setSnapshotProvider:(id)a3
{
  [(PBUISnapshotReplicaView *)self->_snapshotsView setProvider:a3];
  -[PBUIEffectTrackingReplicaView setNeedsReconfiguration]((id *)&self->super.super.super.isa);
}

- (PBUIPosterReplicaSnapshotProviding)snapshotProvider
{
  return [(PBUISnapshotReplicaView *)self->_snapshotsView provider];
}

- (BOOL)hasSnapshotProvider
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 472) provider];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)hasPortalProvider
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 480) provider];
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)offsetWallpaperBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[PBUISnapshotReplicaView offsetWallpaperBy:](self->_snapshotsView, "offsetWallpaperBy:");
  portalView = self->_portalView;
  -[PBUIPortalReplicaEffectView offsetWallpaperBy:](portalView, "offsetWallpaperBy:", x, y);
}

- (int64_t)effectiveStyle
{
  return self->_style;
}

- (BOOL)shouldMatchWallpaperPosition
{
  if ([(PBUISnapshotReplicaView *)self->_snapshotsView shouldMatchWallpaperPosition]) {
    return 1;
  }
  portalView = self->_portalView;
  return [(PBUIPortalReplicaView *)portalView shouldMatchWallpaperPosition];
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  BOOL v3 = a3;
  -[PBUISnapshotReplicaView setShouldMatchWallpaperPosition:](self->_snapshotsView, "setShouldMatchWallpaperPosition:");
  portalView = self->_portalView;
  [(PBUIPortalReplicaView *)portalView setShouldMatchWallpaperPosition:v3];
}

- (void)setFullscreen:(BOOL)a3
{
}

- (BOOL)isFullscreen
{
  return ![(PBUIEffectTrackingReplicaView *)self shouldMatchWallpaperPosition];
}

- (PBUIFakeBlurObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PBUIFakeBlurObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)setTransformOptions:(unint64_t)a3
{
  self->_transformOptions = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)requiresSnapshotTreatment
{
  return self->_requiresSnapshotTreatment;
}

- (void)setRequiresSnapshotTreatment:(BOOL)a3
{
  self->_requiresSnapshotTreatment = a3;
}

- (double)effectWeight
{
  return self->_effectWeight;
}

- (BOOL)showsSnapshot
{
  return self->_showsSnapshot;
}

- (NSString)reason
{
  return self->_reason;
}

- (PBUIEffectTrackingReplicaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIEffectTrackingReplicaViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)observesSnapshotValidity
{
  if (result) {
    return *(unsigned char *)(result + 410) != 0;
  }
  return result;
}

- (void)setSnapshotsView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 472), a2);
  }
}

- (uint64_t)portalView
{
  if (result) {
    return *(void *)(result + 480);
  }
  return result;
}

- (void)setPortalView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 480), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_snapshotsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end