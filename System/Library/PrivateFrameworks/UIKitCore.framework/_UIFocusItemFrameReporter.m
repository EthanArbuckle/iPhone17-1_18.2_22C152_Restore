@interface _UIFocusItemFrameReporter
- (BOOL)_rect:(CGRect)a3 differsFromRect:(CGRect)a4 lowerThreshold:(double)a5 upperThreshold:(double)a6;
- (BOOL)isEnabled;
- (CGRect)_globalFrameForFocusedItemInSystem:(id)a3;
- (UIFocusSystem)focusSystem;
- (_UIFocusItemFrameReporter)initWithFocusSystem:(id)a3;
- (void)_cancelRepeatingFrameUpdate;
- (void)_focusSystemEnabledStateDidChange:(id)a3;
- (void)_reportFocusFrameForCurrentlyFocusedItem;
- (void)_reportFocusFrameUpdateForGlobalFrame:(CGRect)a3;
- (void)_scheduleRepeatingFrameUpdate;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _UIFocusItemFrameReporter

- (_UIFocusItemFrameReporter)initWithFocusSystem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusItemFrameReporter;
  v5 = [(_UIFocusItemFrameReporter *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusSystem, v4);
    -[_UIFocusItemFrameReporter setEnabled:](v6, "setEnabled:", [v4 _isEnabled]);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__focusSystemEnabledStateDidChange_ name:@"_UIFocusSystemEnabledStateDidChangeNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIFocusSystemEnabledStateDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusItemFrameReporter;
  [(_UIFocusItemFrameReporter *)&v4 dealloc];
}

- (void)_reportFocusFrameForCurrentlyFocusedItem
{
  if (self->_enabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      [(_UIFocusItemFrameReporter *)self _globalFrameForFocusedItemInSystem:WeakRetained];
      -[_UIFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:");
      id WeakRetained = v4;
    }
  }
}

- (void)_reportFocusFrameUpdateForGlobalFrame:(CGRect)a3
{
  if (self->_enabled)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    CGFloat y = a3.origin.y;
    double x = a3.origin.x;
    v8 = [(_UIFocusItemFrameReporter *)self focusSystem];
    objc_super v9 = [v8 _focusedWindow];

    if (v9)
    {
      v10 = [v9 _windowHostingScene];
      v11 = [v10 _effectiveUIClientSettings];
      [v11 screenFocusedFrame];
      double v44 = v13;
      double v45 = v12;
      double v42 = v15;
      double v43 = v14;

      [v9 frame];
      double v17 = v16;
      double v19 = v18;
      double v39 = v20;
      double v40 = v21;
      [v9 safeAreaInsets];
      CGFloat v22 = y;
      double v24 = v23;
      double v26 = v25;
      double v38 = v27;
      double v29 = v28;
      v47.origin.double x = x;
      double v41 = v22;
      v47.origin.CGFloat y = v22;
      v47.size.double width = width;
      v47.size.double height = height;
      if (CGRectIsNull(v47))
      {
        double v30 = v41;
      }
      else
      {
        double v31 = v17 + v26;
        double v32 = v19 + v24;
        double v33 = v39 - (v26 + v29);
        double v34 = v40 - (v24 + v38);
        if (v33 < width) {
          double width = v33;
        }
        if (v34 < height) {
          double height = v34;
        }
        v48.origin.double x = v31;
        v48.origin.CGFloat y = v32;
        v48.size.double width = v33;
        v48.size.double height = v34;
        double MinX = CGRectGetMinX(v48);
        v49.origin.double x = v31;
        v49.origin.CGFloat y = v32;
        v49.size.double width = v33;
        v49.size.double height = v34;
        double x = fmax(MinX, fmin(x, CGRectGetMaxX(v49) - width));
        v50.origin.double x = v31;
        v50.origin.CGFloat y = v32;
        v50.size.double width = v33;
        v50.size.double height = v34;
        double MinY = CGRectGetMinY(v50);
        v51.origin.double x = v31;
        v51.origin.CGFloat y = v32;
        v51.size.double width = v33;
        v51.size.double height = v34;
        double v30 = fmax(MinY, fmin(v41, CGRectGetMaxY(v51) - height));
      }
      if (-[_UIFocusItemFrameReporter _rect:differsFromRect:lowerThreshold:upperThreshold:](self, "_rect:differsFromRect:lowerThreshold:upperThreshold:", x, v30, width, height, v45, v44, v43, v42, 0x3FECCCCCCCCCCCCDLL, 0x3FF199999999999ALL))
      {
        v37 = [v9 _windowHostingScene];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __67___UIFocusItemFrameReporter__reportFocusFrameUpdateForGlobalFrame___block_invoke;
        v46[3] = &__block_descriptor_64_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        *(double *)&v46[4] = x;
        *(double *)&v46[5] = v30;
        *(double *)&v46[6] = width;
        *(double *)&v46[7] = height;
        [v37 _updateUIClientSettingsWithBlock:v46];
      }
    }
  }
}

- (void)_scheduleRepeatingFrameUpdate
{
  if (self->_enabled)
  {
    if (!self->_focusedFrameUpdateTimer)
    {
      objc_initWeak(&location, self);
      v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
      self->_focusedFrameUpdateTimer = v3;

      v5 = self->_focusedFrameUpdateTimer;
      dispatch_time_t v6 = dispatch_time(0, 0);
      dispatch_source_set_timer(v5, v6, 0xBEBC200uLL, 0x2FAF080uLL);
      v7 = self->_focusedFrameUpdateTimer;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58___UIFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke;
      v8[3] = &unk_1E52DC308;
      objc_copyWeak(&v9, &location);
      dispatch_source_set_event_handler(v7, v8);
      dispatch_resume((dispatch_object_t)self->_focusedFrameUpdateTimer);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(_UIFocusItemFrameReporter *)self _cancelRepeatingFrameUpdate];
  }
}

- (void)_cancelRepeatingFrameUpdate
{
  focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
  if (focusedFrameUpdateTimer)
  {
    dispatch_source_cancel(focusedFrameUpdateTimer);
    id v4 = self->_focusedFrameUpdateTimer;
    self->_focusedFrameUpdateTimer = 0;
  }
}

- (void)_focusSystemEnabledStateDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [(_UIFocusItemFrameReporter *)self focusSystem];
  id v5 = [v4 object];

  dispatch_time_t v6 = v7;
  if (v5 == v7)
  {
    -[_UIFocusItemFrameReporter setEnabled:](self, "setEnabled:", [v7 _isEnabled]);
    dispatch_time_t v6 = v7;
  }
}

- (BOOL)_rect:(CGRect)a3 differsFromRect:(CGRect)a4 lowerThreshold:(double)a5 upperThreshold:(double)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  BOOL IsNull = CGRectIsNull(a3);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (IsNull != CGRectIsNull(v22)) {
    return 1;
  }
  v23.origin.CGFloat x = v13;
  v23.origin.CGFloat y = v12;
  v23.size.double width = v11;
  v23.size.double height = v10;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  CGRect v24 = CGRectIntersection(v23, v25);
  double v15 = v24.size.width;
  double v16 = v24.size.height;
  if (CGRectIsNull(v24)) {
    return 1;
  }
  double v17 = v11 * v10 / (v15 * v16);
  if (v17 < a5 || v17 > a6) {
    return 1;
  }
  BOOL v20 = v10 / height < a5;
  if (v10 / height > a6) {
    BOOL v20 = 1;
  }
  BOOL v21 = v11 / width < a5;
  if (v11 / width > a6) {
    BOOL v21 = 1;
  }
  return v21 || v20;
}

- (CGRect)_globalFrameForFocusedItemInSystem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 focusedItem];
  id v5 = [v4 parentFocusEnvironment];
  dispatch_time_t v6 = [v5 focusItemContainer];

  if (v4 && v6)
  {
    id v7 = [v3 focusItemContainer];
    v8 = [v7 coordinateSpace];

    id v9 = [v6 coordinateSpace];
    [v4 frame];
    objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB20];
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      [(_UIFocusItemFrameReporter *)self _scheduleRepeatingFrameUpdate];
    }
    else
    {
      [(_UIFocusItemFrameReporter *)self _cancelRepeatingFrameUpdate];
      -[_UIFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      self->_enabled = 0;
    }
  }
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_focusedFrameUpdateTimer, 0);
}

@end