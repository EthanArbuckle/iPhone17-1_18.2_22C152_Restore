@interface NTKAnalogFaceView
+ (Class)_timeViewClass;
- (BOOL)_canStartTimeScrubbing;
- (BOOL)_contentViewsAreOpaque;
- (BOOL)_isAnalog;
- (BOOL)_isComplicationSlotInsideDial:(id)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_shouldRasterizeForegroundContainerViewForEditMode:(int64_t)a3;
- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3;
- (BOOL)_timeViewBehindContentView;
- (CGPoint)_contentCenterOffset;
- (NTKAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIView)dialComplicationContainerView;
- (UIView)timeViewContainer;
- (double)_timeViewScale;
- (id)_complicationContainerViewForSlot:(id)a3;
- (int64_t)_backgroundedTimeViewEditModes;
- (void)_applyDataMode;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_cleanupAfterEditing;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_createTimeViewIfNecessary;
- (void)_handleLocaleDidChange;
- (void)_loadContentToReplaceUnadornedSnapshot;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_setContentViewsOpaque:(BOOL)a3;
- (void)_setTimeViewBehindContentView:(BOOL)a3;
- (void)_unloadSnapshotContentViews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setTimeViewContainer:(id)a3;
@end

@implementation NTKAnalogFaceView

- (NTKAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKAnalogFaceView;
  v5 = [(NTKFaceView *)&v18 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKAnalogFaceView *)v5 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    timeViewContainer = v5->_timeViewContainer;
    v5->_timeViewContainer = (UIView *)v7;

    v9 = v5->_timeViewContainer;
    v10 = [(NTKFaceView *)v5 rootContainerView];
    [(UIView *)v9 addSubview:v10];

    [(NTKAnalogFaceView *)v5 insertSubview:v5->_timeViewContainer atIndex:0];
    v11 = [(NTKFaceView *)v5 foregroundContainerView];
    v12 = [v11 layer];
    v13 = [(NTKFaceView *)v5 device];
    [v13 screenScale];
    objc_msgSend(v12, "setRasterizationScale:");

    v14 = objc_alloc_init(NTKContainerView);
    dialComplicationContainerView = v5->_dialComplicationContainerView;
    v5->_dialComplicationContainerView = &v14->super;

    v16 = [(NTKFaceView *)v5 complicationContainerView];
    [v16 addSubview:v5->_dialComplicationContainerView];
  }
  return v5;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v27 layoutSubviews];
  uint64_t v3 = [(NTKAnalogFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = MEMORY[0x1C1874A70](v3);
  double v14 = v13;
  [(NTKAnalogFaceView *)self _contentCenterOffset];
  double v16 = v12 + v15;
  [(NTKAnalogFaceView *)self _contentCenterOffset];
  double v18 = v14 + v17;
  -[UIView setFrame:](self->_timeViewContainer, "setFrame:", v5, v7, v9, v11);
  v19 = [(NTKFaceView *)self contentView];
  objc_msgSend(v19, "setCenter:", v16, v18);

  v20 = [(NTKFaceView *)self contentView];
  objc_msgSend(v20, "setBounds:", v5, v7, v9, v11);

  v21 = [(NTKFaceView *)self timeView];
  objc_msgSend(v21, "setCenter:", v16, v18);

  v22 = [(NTKFaceView *)self timeView];
  objc_msgSend(v22, "setBounds:", v5, v7, v9, v11);

  v23 = [(NTKFaceView *)self complicationContainerView];
  objc_msgSend(v23, "setCenter:", v12, v14);

  v24 = [(NTKFaceView *)self complicationContainerView];
  objc_msgSend(v24, "setBounds:", v5, v7, v9, v11);

  [(NTKAnalogFaceView *)self _updateDateComplicationPositionIfNecessary];
  dialComplicationContainerView = self->_dialComplicationContainerView;
  v26 = [(NTKFaceView *)self complicationContainerView];
  [v26 bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](dialComplicationContainerView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_loadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v4 _loadSnapshotContentViews];
  [(NTKAnalogFaceView *)self _createTimeViewIfNecessary];
  uint64_t v3 = [(NTKFaceView *)self timeView];
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));

  [(NTKAnalogFaceView *)self _setContentViewsOpaque:1];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v4 _unloadSnapshotContentViews];
  uint64_t v3 = [(NTKFaceView *)self timeView];
  [v3 removeFromSuperview];

  [(NTKFaceView *)self setTimeView:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v2 dealloc];
}

- (BOOL)_canStartTimeScrubbing
{
  return 1;
}

- (void)_handleLocaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v3 _handleLocaleDidChange];
  [(NTKFaceView *)self reloadSnapshotContentViews];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_applyDataMode
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v4 _applyDataMode];
  objc_super v3 = [(NTKFaceView *)self timeView];
  objc_msgSend(v3, "setDataMode:", -[NTKFaceView dataMode](self, "dataMode"));
}

- (void)_applyShowContentForUnadornedSnapshot
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v4 _applyShowContentForUnadornedSnapshot];
  objc_super v3 = [(NTKFaceView *)self timeView];
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));
}

- (void)_loadContentToReplaceUnadornedSnapshot
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v3 _loadContentToReplaceUnadornedSnapshot];
  [(NTKAnalogFaceView *)self _updateDateComplicationPositionIfNecessary];
}

- (id)_complicationContainerViewForSlot:(id)a3
{
  id v4 = a3;
  if ([(NTKAnalogFaceView *)self _isComplicationSlotInsideDial:v4])
  {
    double v5 = self->_dialComplicationContainerView;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKAnalogFaceView;
    double v5 = [(NTKFaceView *)&v8 _complicationContainerViewForSlot:v4];
  }
  double v6 = v5;

  return v6;
}

- (BOOL)_isAnalog
{
  return 1;
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v3 _prepareForEditing];
  [(NTKAnalogFaceView *)self _setContentViewsOpaque:0];
  [(NTKAnalogFaceView *)self _updateDateComplicationPositionIfNecessary];
}

- (void)_cleanupAfterEditing
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogFaceView;
  [(NTKFaceView *)&v5 _cleanupAfterEditing];
  [(NTKAnalogFaceView *)self _updateDateComplicationPositionIfNecessary];
  [(NTKAnalogFaceView *)self _setContentViewsOpaque:1];
  objc_super v3 = [(NTKFaceView *)self foregroundContainerView];
  id v4 = [v3 layer];
  [v4 setShouldRasterize:0];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _configureForEditMode:](&v5, sel__configureForEditMode_);
  [(NTKAnalogFaceView *)self _setTimeViewBehindContentView:[(NTKAnalogFaceView *)self _timeViewBehindContentForEditMode:a3]];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKAnalogFaceView;
  -[NTKFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v18, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  if (a3 >= 0.5) {
    int64_t v9 = a5;
  }
  else {
    int64_t v9 = a4;
  }
  [(NTKAnalogFaceView *)self _setTimeViewBehindContentView:[(NTKAnalogFaceView *)self _timeViewBehindContentForEditMode:v9]];
  [(NTKAnalogFaceView *)self _shouldRasterizeForegroundContainerViewForEditMode:a5];
  [(NTKAnalogFaceView *)self _shouldRasterizeForegroundContainerViewForEditMode:a4];
  CLKInterpolateBetweenFloatsUnclipped();
  double v11 = v10;
  int v12 = v10 == 1.0;
  double v13 = [(NTKFaceView *)self foregroundContainerView];
  double v14 = [v13 layer];
  int v15 = [v14 shouldRasterize];

  if (v12 != v15)
  {
    double v16 = [(NTKFaceView *)self foregroundContainerView];
    double v17 = [v16 layer];
    [v17 setShouldRasterize:v11 == 1.0];
  }
}

- (void)_setContentViewsOpaque:(BOOL)a3
{
  if (self->__contentViewsOpaque != a3)
  {
    self->__contentViewsOpaque = a3;
    id v4 = [(NTKFaceView *)self contentView];
    [v4 setOpaque:self->__contentViewsOpaque];
  }
}

- (double)_timeViewScale
{
  return 1.0;
}

+ (Class)_timeViewClass
{
  return (Class)objc_opt_class();
}

- (void)_configureTimeView:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v7 = [v3 whiteColor];
  objc_super v5 = [v4 minuteHandView];
  [v5 setColor:v7];

  double v6 = [v4 hourHandView];

  [v6 setColor:v7];
}

- (CGPoint)_contentCenterOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)_backgroundedTimeViewEditModes
{
  return 0;
}

- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3
{
  return 0;
}

- (BOOL)_shouldRasterizeForegroundContainerViewForEditMode:(int64_t)a3
{
  return a3 != 1;
}

- (void)_setTimeViewBehindContentView:(BOOL)a3
{
  if (self->__timeViewBehindContentView != a3)
  {
    self->__BOOL timeViewBehindContentView = a3;
    id v4 = [(NTKFaceView *)self timeView];
    BOOL timeViewBehindContentView = self->__timeViewBehindContentView;
    id v8 = v4;
    double v6 = [v4 superview];
    id v7 = v6;
    if (timeViewBehindContentView) {
      [v6 sendSubviewToBack:v8];
    }
    else {
      [v6 bringSubviewToFront:v8];
    }
  }
}

- (BOOL)_isComplicationSlotInsideDial:(id)a3
{
  return 0;
}

- (void)_createTimeViewIfNecessary
{
  double v3 = [(NTKFaceView *)self timeView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)[(id)objc_opt_class() _timeViewClass]);
    objc_super v5 = [(NTKFaceView *)self device];
    id v6 = (id)[v4 initForDevice:v5];

    [(NTKAnalogFaceView *)self bounds];
    objc_msgSend(v6, "setFrame:");
    [(NTKFaceView *)self setTimeView:v6];
    [(UIView *)self->_timeViewContainer addSubview:v6];
    [(NTKAnalogFaceView *)self _configureTimeView:v6];
  }
}

- (UIView)dialComplicationContainerView
{
  return self->_dialComplicationContainerView;
}

- (UIView)timeViewContainer
{
  return self->_timeViewContainer;
}

- (void)setTimeViewContainer:(id)a3
{
}

- (BOOL)_contentViewsAreOpaque
{
  return self->__contentViewsOpaque;
}

- (BOOL)_timeViewBehindContentView
{
  return self->__timeViewBehindContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeViewContainer, 0);

  objc_storeStrong((id *)&self->_dialComplicationContainerView, 0);
}

@end