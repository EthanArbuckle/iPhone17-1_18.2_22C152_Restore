@interface PXPlacesMapView
+ ($12569EB6952B655774F5ECF42E55FE6C)MKMapRectForCoordinateRegion:(id *)a3;
+ ($12569EB6952B655774F5ECF42E55FE6C)canonicalMapRect:(id)result;
+ ($12569EB6952B655774F5ECF42E55FE6C)mapRectForNearbyQueriesFromRect:(id)a3 atScale:(double)a4 targetViewSize:(CGSize)a5;
+ (PXPlacesMapView)mapViewWithMarkedLocation:(id)a3 regionRadius:(double)a4 frame:(CGRect)a5;
- ($12569EB6952B655774F5ECF42E55FE6C)ppt_cityMapRect;
- (PXObservable)observable;
- (PXPlacesMapView)initWithCoder:(id)a3;
- (PXPlacesMapView)initWithFrame:(CGRect)a3;
- (PXPlacesMapViewDelegate)mapViewDelegate;
- (double)_px_zoomLevel;
- (double)_radiansFromDegrees:(double)a3;
- (double)_sampleMapDistanceFromViewPoint:(CGPoint)a3 toViewPoint:(CGPoint)a4;
- (double)pitch;
- (id)currentViewPort;
- (id)currentViewPortWithThumbnailOverscan;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)ppt_visibleMapRectBlockForQueue:(id)a3 delay:(double)a4;
- (int64_t)panningGestureMinimumNumberOfTouches;
- (void)_commonInit;
- (void)awakeFromNib;
- (void)deselectAllAnnotationsAnimated:(BOOL)a3;
- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishLoadingMap:(id)a3;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)mapViewWillStartLocatingUser:(id)a3;
- (void)ppt_performPlacesScrollTest:(id)a3 iterations:(int64_t)a4 screenDelta:(int64_t)a5 delay:(double)a6 completion:(id)a7;
- (void)ppt_performPlacesZoomTest:(id)a3 iterations:(int64_t)a4 delay:(double)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setMapViewDelegate:(id)a3;
- (void)setPanningGestureMinimumNumberOfTouches:(int64_t)a3;
- (void)setPitch:(double)a3;
- (void)setPreferredConfiguration:(id)a3;
@end

@implementation PXPlacesMapView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_destroyWeak((id *)&self->_mapViewDelegate);
}

- (PXObservable)observable
{
  return self->_observable;
}

- (void)setMapViewDelegate:(id)a3
{
}

- (PXPlacesMapViewDelegate)mapViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);
  return (PXPlacesMapViewDelegate *)WeakRetained;
}

- (void)ppt_performPlacesZoomTest:(id)a3 iterations:(int64_t)a4 delay:(double)a5 completion:(id)a6
{
  id v9 = a6;
  [(PXPlacesMapView *)self ppt_cityMapRect];
  -[PXPlacesMapView setVisibleMapRect:animated:](self, "setVisibleMapRect:animated:", 0);
  v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v11 = dispatch_queue_create("scrollQueue", v10);

  v12 = [(PXPlacesMapView *)self ppt_visibleMapRectBlockForQueue:v11 delay:a5];
  if (a4 >= 1)
  {
    do
    {
      [(PXPlacesMapView *)self visibleMapRect];
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;
      MKMapRect v32 = MKMapRectOffset(v31, v31.size.width / -3.0, 0.0);
      MKMapRect v33 = MKMapRectInset(v32, width / 3.0, height / 3.0);
      double v23 = v33.origin.y;
      double v24 = v33.origin.x;
      double v21 = v33.size.height;
      double v22 = v33.size.width;
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      MKMapRect v34 = MKMapRectInset(v33, width / 3.0, height / 3.0);
      double v27 = v34.origin.y;
      double v28 = v34.origin.x;
      double v25 = v34.size.height;
      double v26 = v34.size.width;
      v34.origin.double x = x;
      v34.origin.double y = y;
      v34.size.double width = width;
      v34.size.double height = height;
      MKMapRect v35 = MKMapRectOffset(v34, width / 3.0, 0.0);
      MKMapRect v36 = MKMapRectInset(v35, width / 3.0, height / 3.0);
      double v17 = v36.origin.x;
      double v18 = v36.origin.y;
      double v19 = v36.size.width;
      double v20 = v36.size.height;
      v12[2](v12, v24, v23, v22, v21);
      v12[2](v12, x, y, width, height);
      v12[2](v12, v28, v27, v26, v25);
      v12[2](v12, x, y, width, height);
      v12[2](v12, v17, v18, v19, v20);
      v12[2](v12, x, y, width, height);
      --a4;
    }
    while (a4);
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke;
    block[3] = &unk_1E5DD3128;
    id v30 = v9;
    dispatch_async(v11, block);
  }
}

void __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke_2;
  block[3] = &unk_1E5DD3128;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ppt_performPlacesScrollTest:(id)a3 iterations:(int64_t)a4 screenDelta:(int64_t)a5 delay:(double)a6 completion:(id)a7
{
  id v11 = a7;
  [(PXPlacesMapView *)self ppt_cityMapRect];
  -[PXPlacesMapView setVisibleMapRect:animated:](self, "setVisibleMapRect:animated:", 0);
  v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v13 = dispatch_queue_create("scrollQueue", v12);

  v14 = [(PXPlacesMapView *)self ppt_visibleMapRectBlockForQueue:v13 delay:a6];
  if (a4 >= 1)
  {
    double v23 = (double)a5;
    double v24 = (double)-a5;
    do
    {
      [(PXPlacesMapView *)self visibleMapRect];
      double x = v39.origin.x;
      double y = v39.origin.y;
      double width = v39.size.width;
      double height = v39.size.height;
      MKMapRect v40 = MKMapRectOffset(v39, 0.0, v39.size.height * v24);
      double v35 = v40.origin.y;
      double v36 = v40.origin.x;
      double v33 = v40.size.height;
      double v34 = v40.size.width;
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      MKMapRect v41 = MKMapRectOffset(v40, 0.0, height * v23);
      double v27 = v41.origin.y;
      double v28 = v41.origin.x;
      double v25 = v41.size.height;
      double v26 = v41.size.width;
      v41.origin.double x = x;
      v41.origin.double y = y;
      v41.size.double width = width;
      v41.size.double height = height;
      MKMapRect v42 = MKMapRectOffset(v41, width * v24, 0.0);
      double v29 = v42.origin.x;
      double v30 = v42.origin.y;
      double v31 = v42.size.height;
      double v32 = v42.size.width;
      v42.origin.double x = x;
      v42.origin.double y = y;
      v42.size.double width = width;
      v42.size.double height = height;
      MKMapRect v43 = MKMapRectOffset(v42, width * v23, 0.0);
      double v19 = v43.origin.x;
      double v20 = v43.origin.y;
      double v21 = v43.size.width;
      double v22 = v43.size.height;
      v14[2](v14, v36, v35, v34, v33);
      v14[2](v14, v28, v27, v26, v25);
      v14[2](v14, x, y, width, height);
      v14[2](v14, v29, v30, v32, v31);
      v14[2](v14, v19, v20, v21, v22);
      v14[2](v14, x, y, width, height);
      --a4;
    }
    while (a4);
  }
  if (v11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke;
    block[3] = &unk_1E5DD3128;
    id v38 = v11;
    dispatch_async(v13, block);
  }
}

void __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke_2;
  block[3] = &unk_1E5DD3128;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)ppt_visibleMapRectBlockForQueue:(id)a3 delay:(double)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke;
  aBlock[3] = &unk_1E5DBE528;
  id v11 = v6;
  v12 = self;
  double v13 = a4;
  id v7 = v6;
  v8 = _Block_copy(aBlock);

  return v8;
}

void __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke(void *a1, double a2, double a3, double a4, double a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_2;
  v6[3] = &unk_1E5DD3658;
  v5 = a1[4];
  v6[4] = a1[5];
  *(double *)&v6[5] = a2;
  *(double *)&v6[6] = a3;
  *(double *)&v6[7] = a4;
  *(double *)&v6[8] = a5;
  v6[9] = a1[6];
  dispatch_async(v5, v6);
}

uint64_t __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_3;
  block[3] = &unk_1E5DD3630;
  void block[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
  return usleep((*(double *)(a1 + 72) * 1000000.0));
}

uint64_t __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleMapRect:animated:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- ($12569EB6952B655774F5ECF42E55FE6C)ppt_cityMapRect
{
  double v2 = 42852201.5;
  double v3 = 103675449.0;
  double v4 = 133435.2;
  double v5 = 181471.8;
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  double v5 = [(PXPlacesMapView *)self observable];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PXPlacesMapView_mapView_canEnter3DModeDidChange___block_invoke;
  v6[3] = &unk_1E5DD0FA8;
  v6[4] = self;
  [v5 performChanges:v6];
}

void __51__PXPlacesMapView_mapView_canEnter3DModeDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observable];
  [v1 signalChange:8];
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  double v5 = [(PXPlacesMapView *)self observable];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PXPlacesMapView_mapView_didBecomePitched___block_invoke;
  v6[3] = &unk_1E5DD0FA8;
  v6[4] = self;
  [v5 performChanges:v6];
}

void __44__PXPlacesMapView_mapView_didBecomePitched___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observable];
  [v1 signalChange:4];
}

- (void)mapViewWillStartLocatingUser:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPlacesMapView *)self mapViewDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PXPlacesMapView *)self mapViewDelegate];
    [v7 mapViewWillStartLocatingUser:v4];
  }
  v8 = [(PXPlacesMapView *)self observable];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PXPlacesMapView_mapViewWillStartLocatingUser___block_invoke;
  v9[3] = &unk_1E5DD0FA8;
  v9[4] = self;
  [v8 performChanges:v9];
}

void __48__PXPlacesMapView_mapViewWillStartLocatingUser___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observable];
  [v1 signalChange:32];
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [(PXPlacesMapView *)self mapViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PXPlacesMapView *)self mapViewDelegate];
    [v8 mapViewDidFinishRenderingMap:self fullyRendered:v4];
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a4;
  char v6 = [(PXPlacesMapView *)self mapViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PXPlacesMapView *)self mapViewDelegate];
    id v9 = [v8 mapView:self rendererForOverlay:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  char v7 = [(PXPlacesMapView *)self mapViewDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(PXPlacesMapView *)self mapViewDelegate];
    [v9 mapView:v10 didSelectAnnotationView:v6];
  }
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  id v8 = a4;
  id v5 = [(PXPlacesMapView *)self mapViewDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(PXPlacesMapView *)self mapViewDelegate];
    [v7 mapView:self didAddAnnotationViews:v8];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [(PXPlacesMapView *)self mapViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PXPlacesMapView *)self mapViewDelegate];
    [v8 mapView:self regionDidChangeAnimated:v4];
  }
  id v9 = [(PXPlacesMapView *)self observable];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PXPlacesMapView_mapView_regionDidChangeAnimated___block_invoke;
  v10[3] = &unk_1E5DD0FA8;
  v10[4] = self;
  [v9 performChanges:v10];
}

void __51__PXPlacesMapView_mapView_regionDidChangeAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observable];
  [v1 signalChange:1];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  char v6 = [(PXPlacesMapView *)self mapViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PXPlacesMapView *)self mapViewDelegate];
    id v9 = [v8 mapView:self viewForAnnotation:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  BOOL v4 = [(PXPlacesMapView *)self observable];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PXPlacesMapView_mapViewDidFinishLoadingMap___block_invoke;
  v5[3] = &unk_1E5DD0FA8;
  v5[4] = self;
  [v4 performChanges:v5];
}

void __46__PXPlacesMapView_mapViewDidFinishLoadingMap___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observable];
  [v1 signalChange:16];
}

- (double)_px_zoomLevel
{
  [(PXPlacesMapView *)self region];
  double v4 = v3;
  [(PXPlacesMapView *)self bounds];
  double result = 20.0 - log2(v4 * 85445659.4 * 3.14159265 / (v5 * 180.0));
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)_radiansFromDegrees:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

- (double)_sampleMapDistanceFromViewPoint:(CGPoint)a3 toViewPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[PXPlacesMapView convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self, a3.x, a3.y);
  MKMapPoint v7 = MKMapPointForCoordinate(v10);
  -[PXPlacesMapView convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self, x, y);
  MKMapPoint v8 = MKMapPointForCoordinate(v11);
  return sqrt((v7.x - v8.x) * (v7.x - v8.x) + (v7.y - v8.y) * (v7.y - v8.y));
}

- (void)deselectAllAnnotationsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v5 = [(PXPlacesMapView *)self selectedAnnotations];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        CLLocationCoordinate2D v11 = [(PXPlacesMapView *)self viewForAnnotation:v10];
        [v11 setSelected:0 animated:0];

        [(PXPlacesMapView *)self deselectAnnotation:v10 animated:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)currentViewPortWithThumbnailOverscan
{
  BOOL v3 = [(PXPlacesMapView *)self currentViewPort];
  [v3 mapRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PXPlacesMapView *)self frame];
  double v13 = v12 * 0.5;
  [(PXPlacesMapView *)self frame];
  double v15 = v14 * 0.5;
  [v3 scale];
  double v17 = v16 * v13;
  [v3 scale];
  objc_msgSend(v3, "setMapRect:", v5 - v17, v7 - v18 * v15, v9 + v17 * 2.0, v11 + v18 * v15 * 2.0);
  return v3;
}

- (id)currentViewPort
{
  [(PXPlacesMapView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(PXPlacesMapView *)self camera];
  [v7 heading];
  double v9 = v8;

  double v10 = [(PXPlacesMapView *)self camera];
  [v10 pitch];
  double v12 = v11;

  double v13 = [PXPlacesMapViewPort alloc];
  [(PXPlacesMapView *)self visibleMapRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(PXPlacesMapView *)self _px_zoomLevel];
  double v23 = -[PXPlacesMapViewPort initWithMapRect:andViewSize:zoomLevel:pitch:](v13, "initWithMapRect:andViewSize:zoomLevel:pitch:", v15, v17, v19, v21, v4, v6, v22, v12);
  if (v9 == 0.0)
  {
    double v29 = -1.0;
  }
  else
  {
    CGFloat v24 = v4 * 0.5 + -5.0 + 5.0;
    CGFloat v25 = v6 * 0.5 + -5.0 + 5.0;
    [(PXPlacesMapView *)self _radiansFromDegrees:v9];
    CGFloat v27 = v26;
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeTranslation(&v42, v24, v25);
    memset(&v41, 0, sizeof(v41));
    CGAffineTransformMakeRotation(&v41, v27);
    memset(&v40, 0, sizeof(v40));
    CGAffineTransform v37 = v42;
    CGAffineTransformInvert(&t1, &v37);
    CGAffineTransform v37 = v41;
    CGAffineTransformConcat(&v39, &t1, &v37);
    CGAffineTransform v37 = v42;
    CGAffineTransformConcat(&v40, &v39, &v37);
    -[PXPlacesMapView _sampleMapDistanceFromViewPoint:toViewPoint:](self, "_sampleMapDistanceFromViewPoint:toViewPoint:", v40.tx + (v25 + -5.0) * v40.c + v40.a * (v24 + -5.0), v40.ty + (v25 + -5.0) * v40.d + v40.b * (v24 + -5.0), v40.tx + (v25 + -5.0) * v40.c + v40.a * (v24 + 5.0), v40.ty + (v25 + -5.0) * v40.d + v40.b * (v24 + 5.0));
    double v29 = v28;
  }
  if (v12 > 45.0)
  {
    -[PXPlacesMapView _sampleMapDistanceFromViewPoint:toViewPoint:](self, "_sampleMapDistanceFromViewPoint:toViewPoint:", v4 * 0.5, v6 * 0.5 + -5.0, v4 * 0.5, v6 * 0.5 + 5.0);
    double v31 = v30;
    [(PXPlacesMapView *)self _radiansFromDegrees:v12];
    double v29 = v31 * cos(v32);
  }
  if (v29 != -1.0)
  {
    [(PXPlacesMapViewPort *)v23 scale];
    double v34 = v29 / 10.0;
    if (v29 / 10.0 <= currentScale)
    {
      double currentScale = self->_currentScale;
      if (v34 >= currentScale)
      {
        double currentScale = v29 / 10.0;
      }
      else if (vabdd_f64(currentScale, v34) / currentScale * 100.0 < 80.0)
      {
        double currentScale = v29 / 10.0;
      }
    }
    -[PXPlacesMapViewPort setScale:](v23, "setScale:", currentScale, v34);
  }
  [(PXPlacesMapViewPort *)v23 scale];
  self->_double currentScale = v35;
  return v23;
}

- (void)setDelegate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PXPlacesMapView.m" lineNumber:97 description:@"Do not set this delegate. Use mapViewDelegate instead."];
}

- (int64_t)panningGestureMinimumNumberOfTouches
{
  double v2 = [(PXPlacesMapView *)self _panningGestureRecognizer];
  int64_t v3 = [v2 minimumNumberOfTouches];

  return v3;
}

- (void)setPanningGestureMinimumNumberOfTouches:(int64_t)a3
{
  id v4 = [(PXPlacesMapView *)self _panningGestureRecognizer];
  [v4 setMinimumNumberOfTouches:a3];
}

- (void)setPitch:(double)a3
{
  id v5 = [(PXPlacesMapView *)self camera];
  id v6 = (id)[v5 copy];

  [v6 setPitch:a3];
  [(PXPlacesMapView *)self setCamera:v6 animated:1];
}

- (double)pitch
{
  double v2 = [(PXPlacesMapView *)self camera];
  [v2 pitch];
  double v4 = v3;

  return v4;
}

- (void)setPreferredConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPlacesMapView *)self preferredConfiguration];

  v8.receiver = self;
  v8.super_class = (Class)PXPlacesMapView;
  [(PXPlacesMapView *)&v8 setPreferredConfiguration:v4];

  if (v5 != v4)
  {
    id v6 = [(PXPlacesMapView *)self observable];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PXPlacesMapView_setPreferredConfiguration___block_invoke;
    v7[3] = &unk_1E5DD0FA8;
    v7[4] = self;
    [v6 performChanges:v7];
  }
}

void __45__PXPlacesMapView_setPreferredConfiguration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observable];
  [v1 signalChange:2];
}

- (void)_commonInit
{
  [(PXPlacesMapView *)self setUserInteractionEnabled:1];
  id v3 = objc_alloc_init(MEMORY[0x1E4F31028]);
  [(PXPlacesMapView *)self setPreferredConfiguration:v3];

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapView;
  [(PXPlacesMapView *)&v6 setDelegate:self];
  id v4 = (PXObservable *)objc_alloc_init((Class)off_1E5DA74F0);
  observable = self->_observable;
  self->_observable = v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)PXPlacesMapView;
  [(PXPlacesMapView *)&v3 awakeFromNib];
  [(PXPlacesMapView *)self _commonInit];
}

- (PXPlacesMapView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapView;
  objc_super v3 = [(PXPlacesMapView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PXPlacesMapView *)v3 _commonInit];
  }
  return v4;
}

- (PXPlacesMapView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapView;
  objc_super v3 = -[PXPlacesMapView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PXPlacesMapView *)v3 _commonInit];
  }
  return v4;
}

+ (PXPlacesMapView)mapViewWithMarkedLocation:(id)a3 regionRadius:(double)a4 frame:(CGRect)a5
{
  if (a3)
  {
    double height = a5.size.height;
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    double v10 = (objc_class *)MEMORY[0x1E4F30FD8];
    id v11 = a3;
    id v12 = objc_alloc_init(v10);
    [v11 coordinate];
    objc_msgSend(v12, "setCoordinate:");
    double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F30F50]), "initWithFrame:", x, y, width, height);
    [v11 coordinate];
    double v15 = v14;
    double v17 = v16;

    MEMORY[0x1AD109A20](v15, v17, a4 + a4, a4 + a4);
    objc_msgSend(v13, "setRegion:");
    [v13 setMapType:0];
    [v13 addAnnotation:v12];
  }
  else
  {
    double v13 = 0;
  }
  return (PXPlacesMapView *)v13;
}

+ ($12569EB6952B655774F5ECF42E55FE6C)canonicalMapRect:(id)result
{
  double var1 = result.var0.var1;
  double v4 = *(double *)(MEMORY[0x1E4F30DA0] + 16);
  if (result.var0.var0 >= 0.0)
  {
    if (result.var0.var0 > v4) {
      result.var0.double var0 = result.var0.var0 - v4;
    }
  }
  else
  {
    result.var0.double var0 = result.var0.var0 + v4;
  }
  double var0 = 0.0;
  double v6 = 0.0;
  if (var1 >= 0.0)
  {
    double v6 = var1;
    if (var1 > *(double *)(MEMORY[0x1E4F30DA0] + 24)) {
      double v6 = *(double *)(MEMORY[0x1E4F30DA0] + 24);
    }
  }
  if (result.var1.var0 >= 0.0)
  {
    double var0 = result.var1.var0;
    if (result.var1.var0 > v4) {
      double var0 = *(double *)(MEMORY[0x1E4F30DA0] + 16);
    }
  }
  double v7 = 0.0;
  if (result.var1.var1 >= 0.0)
  {
    double v8 = *(double *)(MEMORY[0x1E4F30DA0] + 24);
    double v7 = result.var1.var1;
    if (result.var1.var1 + v6 > v8) {
      double v7 = v8 - v6;
    }
  }
  double v9 = var0;
  double v10 = v7;
  result.var1.double var1 = v10;
  result.var1.double var0 = v9;
  result.var0.double var1 = v6;
  return result;
}

+ ($12569EB6952B655774F5ECF42E55FE6C)mapRectForNearbyQueriesFromRect:(id)a3 atScale:(double)a4 targetViewSize:(CGSize)a5
{
  objc_msgSend(a1, "canonicalMapRect:", a3.var0.var0 + a3.var1.var0 * 0.5 - a5.width * a4 * 0.5, a3.var0.var1 + a3.var1.var1 * 0.5 - a5.height * a4 * 0.5, a5.width * a4, a5.height * a4);
  result.var1.double var1 = v8;
  result.var1.double var0 = v7;
  result.var0.double var1 = v6;
  result.var0.double var0 = v5;
  return result;
}

+ ($12569EB6952B655774F5ECF42E55FE6C)MKMapRectForCoordinateRegion:(id *)a3
{
  double v7 = v4;
  double v8 = v3;
  double v9 = v5 * 0.5;
  double v10 = v6 * 0.5;
  CLLocationCoordinate2D v19 = CLLocationCoordinate2DMake(v3 + v5 * 0.5, v4 - v6 * 0.5);
  MKMapPoint v11 = MKMapPointForCoordinate(v19);
  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v8 - v9, v7 + v10);
  MKMapPoint v12 = MKMapPointForCoordinate(v20);
  if (v11.x >= v12.x) {
    double x = v12.x;
  }
  else {
    double x = v11.x;
  }
  if (v11.y >= v12.y) {
    double y = v12.y;
  }
  else {
    double y = v11.y;
  }
  double v15 = -(v11.x - v12.x);
  if (v11.x - v12.x >= 0.0) {
    double v15 = v11.x - v12.x;
  }
  if (v11.y - v12.y >= 0.0) {
    double v16 = v11.y - v12.y;
  }
  else {
    double v16 = -(v11.y - v12.y);
  }
  double v17 = x;
  double v18 = y;
  result.var1.double var1 = v16;
  result.var1.double var0 = v15;
  result.var0.double var1 = v18;
  result.var0.double var0 = v17;
  return result;
}

@end