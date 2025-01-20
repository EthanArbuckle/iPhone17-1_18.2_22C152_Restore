@interface SXMediaComponentView
- (BOOL)isDisplayingMedia;
- (BOOL)shouldSubmitMediaExposureEventForExposedBounds:(CGRect)a3;
- (CGRect)visibleBounds;
- (SXAnalyticsReporting)analyticsReporting;
- (SXMediaComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8;
- (SXMediaExposureEvent)mediaExposureEvent;
- (double)maximumVisibleY;
- (double)minimumVisibleY;
- (id)mediaEventForClass:(Class)a3;
- (unint64_t)analyticsGalleryType;
- (unint64_t)analyticsMediaType;
- (unint64_t)analyticsVideoType;
- (void)calculateVisibleBounds;
- (void)createMediaExposureEventIfNeeded;
- (void)finishMediaExposureEventIfNeeded;
- (void)setIsDisplayingMedia:(BOOL)a3;
- (void)setMaximumVisibleY:(double)a3;
- (void)setMediaExposureEvent:(id)a3;
- (void)setMinimumVisibleY:(double)a3;
- (void)setVisibleBounds:(CGRect)a3;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
- (void)visibleBoundsChanged;
@end

@implementation SXMediaComponentView

- (SXMediaComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)SXMediaComponentView;
  v20 = [(SXComponentView *)&v34 initWithDOMObjectProvider:v14 viewport:v15 presentationDelegate:v16 componentStyleRendererFactory:v17];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_analyticsReporting, a7);
    objc_initWeak(&location, v21);
    if (objc_opt_respondsToSelector())
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke;
      v31[3] = &unk_264651108;
      objc_copyWeak(&v32, &location);
      [v19 performOnApplicationWindowDidBecomeBackground:v31];
      objc_destroyWeak(&v32);
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_2;
    v29[3] = &unk_264651108;
    objc_copyWeak(&v30, &location);
    [v19 performOnApplicationDidEnterBackground:v29];
    if (objc_opt_respondsToSelector())
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_3;
      v27[3] = &unk_264651108;
      objc_copyWeak(&v28, &location);
      [v19 performOnApplicationWindowDidBecomeForeground:v27];
      objc_destroyWeak(&v28);
    }
    if (objc_opt_respondsToSelector())
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_4;
      v25[3] = &unk_264651108;
      objc_copyWeak(&v26, &location);
      [v19 performOnApplicationWillEnterForeground:v25];
      objc_destroyWeak(&v26);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_5;
    v23[3] = &unk_264651108;
    objc_copyWeak(&v24, &location);
    [v19 performOnApplicationDidBecomeActive:v23];
    v21->_minimumVisibleY = 1.79769313e308;
    v21->_maximumVisibleY = 2.22507386e-308;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v21;
}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained submitEvents];
}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained submitEvents];
}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createMediaExposureEventIfNeeded];
}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createMediaExposureEventIfNeeded];
}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createMediaExposureEventIfNeeded];
}

- (void)createMediaExposureEventIfNeeded
{
  v3 = [(SXMediaComponentView *)self mediaExposureEvent];
  if (!v3)
  {
    BOOL v4 = [(SXComponentView *)self visibilityState] == 1;
    v3 = 0;
    if (v4)
    {
      if (![(SXMediaComponentView *)self isDisplayingMedia]) {
        return;
      }
      id v5 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
      [(SXMediaComponentView *)self setMediaExposureEvent:v5];
      v3 = v5;
    }
  }
}

- (void)finishMediaExposureEventIfNeeded
{
  v3 = [(SXMediaComponentView *)self mediaExposureEvent];

  if (v3)
  {
    BOOL v4 = [(SXMediaComponentView *)self mediaExposureEvent];
    id v5 = [v4 startDate];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    if (v7 >= 0.0) {
      double v8 = v7;
    }
    else {
      double v8 = -v7;
    }
    [(SXComponentView *)self contentFrame];
    double MinX = CGRectGetMinX(v23);
    [(SXMediaComponentView *)self minimumVisibleY];
    double v11 = v10;
    [(SXComponentView *)self contentFrame];
    double Width = CGRectGetWidth(v24);
    [(SXMediaComponentView *)self maximumVisibleY];
    double v14 = v13;
    [(SXMediaComponentView *)self minimumVisibleY];
    BOOL v16 = -[SXMediaComponentView shouldSubmitMediaExposureEventForExposedBounds:](self, "shouldSubmitMediaExposureEventForExposedBounds:", MinX, v11, Width, v14 - v15);
    if (v8 >= 1.0 && v16)
    {
      id v18 = [(SXMediaComponentView *)self mediaExposureEvent];
      [(SXMediaComponentView *)self willSubmitMediaExposureEvent:v18];

      id v19 = [(SXMediaComponentView *)self mediaExposureEvent];
      [v19 determineEndDate];

      v20 = [(SXMediaComponentView *)self analyticsReporting];
      v21 = [(SXMediaComponentView *)self mediaExposureEvent];
      [v20 reportEvent:v21];

      [(SXMediaComponentView *)self setMediaExposureEvent:0];
    }
  }
}

- (unint64_t)analyticsGalleryType
{
  return 0;
}

- (unint64_t)analyticsMediaType
{
  return 0;
}

- (unint64_t)analyticsVideoType
{
  return 0;
}

- (id)mediaEventForClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  objc_msgSend(v4, "setMediaType:", -[SXMediaComponentView analyticsMediaType](self, "analyticsMediaType"));
  objc_msgSend(v4, "setGalleryType:", -[SXMediaComponentView analyticsGalleryType](self, "analyticsGalleryType"));
  objc_msgSend(v4, "setVideoType:", -[SXMediaComponentView analyticsVideoType](self, "analyticsVideoType"));
  id v5 = [(SXComponentView *)self component];
  double v6 = [v5 identifier];
  [v4 setMediaId:v6];

  double v7 = [(SXComponentView *)self component];
  double v8 = [v7 analytics];
  v9 = [v8 jsonDictionary];
  [v4 setMetaData:v9];

  return v4;
}

- (BOOL)shouldSubmitMediaExposureEventForExposedBounds:(CGRect)a3
{
  double Height = CGRectGetHeight(a3);
  [(SXComponentView *)self absoluteFrame];
  return Height >= CGRectGetHeight(v6) * 0.5;
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SXMediaComponentView;
  -[SXComponentView visibilityStateDidChangeFromState:](&v8, sel_visibilityStateDidChangeFromState_);
  if ([(SXComponentView *)self visibilityState] == 1)
  {
    [(SXMediaComponentView *)self createMediaExposureEventIfNeeded];
    id v5 = [(SXComponentView *)self viewport];
    [v5 addViewportChangeListener:self forOptions:2];

    [(SXMediaComponentView *)self calculateVisibleBounds];
  }
  else
  {
    int64_t v6 = [(SXComponentView *)self visibilityState];
    if (a3 == 1 && v6 == 2)
    {
      [(SXMediaComponentView *)self submitEvents];
      double v7 = [(SXComponentView *)self viewport];
      [v7 removeViewportChangeListener:self forOptions:2];
    }
  }
}

- (void)setVisibleBounds:(CGRect)a3
{
  self->_visibleBounds = a3;
  [(SXMediaComponentView *)self visibleBoundsChanged];
}

- (void)calculateVisibleBounds
{
  [(SXComponentView *)self absoluteFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(SXComponentView *)self viewport];
  [v11 dynamicBounds];
  v34.origin.CGFloat x = v12;
  v34.origin.CGFloat y = v13;
  v34.size.CGFloat width = v14;
  v34.size.CGFloat height = v15;
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  CGRect v28 = CGRectIntersection(v27, v34);
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;

  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  if (CGRectIsNull(v29))
  {
    double v20 = *MEMORY[0x263F001A8];
    double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v23 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    CGRect v24 = [(SXComponentView *)self viewport];
    [v24 dynamicBounds];
    double MinY = CGRectGetMinY(v30);
    [(SXComponentView *)self absoluteFrame];
    double v21 = MinY - CGRectGetMinY(v31);

    double v20 = 0.0;
    if (v21 < 0.0) {
      double v21 = 0.0;
    }
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double v23 = CGRectGetWidth(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v22 = CGRectGetHeight(v33);
  }
  -[SXMediaComponentView setVisibleBounds:](self, "setVisibleBounds:", v20, v21, v23, v22);
}

- (void)visibleBoundsChanged
{
  [(SXMediaComponentView *)self visibleBounds];
  if (CGRectEqualToRect(v10, *MEMORY[0x263F001A8]))
  {
    [(SXMediaComponentView *)self setMinimumVisibleY:1.79769313e308];
    double MaxY = 2.22507386e-308;
  }
  else
  {
    [(SXMediaComponentView *)self minimumVisibleY];
    double v5 = v4;
    [(SXMediaComponentView *)self visibleBounds];
    double MinY = CGRectGetMinY(v11);
    if (v5 < MinY) {
      double MinY = v5;
    }
    [(SXMediaComponentView *)self setMinimumVisibleY:MinY];
    [(SXMediaComponentView *)self maximumVisibleY];
    double v8 = v7;
    [(SXMediaComponentView *)self visibleBounds];
    double MaxY = CGRectGetMaxY(v12);
    if (v8 >= MaxY) {
      double MaxY = v8;
    }
  }
  [(SXMediaComponentView *)self setMaximumVisibleY:MaxY];
}

- (void)setIsDisplayingMedia:(BOOL)a3
{
  if (self->_isDisplayingMedia != a3)
  {
    self->_isDisplayingMedia = a3;
    [(SXMediaComponentView *)self createMediaExposureEventIfNeeded];
  }
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (BOOL)isDisplayingMedia
{
  return self->_isDisplayingMedia;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SXMediaExposureEvent)mediaExposureEvent
{
  return self->_mediaExposureEvent;
}

- (void)setMediaExposureEvent:(id)a3
{
}

- (double)minimumVisibleY
{
  return self->_minimumVisibleY;
}

- (void)setMinimumVisibleY:(double)a3
{
  self->_minimumVisibleY = a3;
}

- (double)maximumVisibleY
{
  return self->_maximumVisibleY;
}

- (void)setMaximumVisibleY:(double)a3
{
  self->_maximumVisibleY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaExposureEvent, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
}

@end