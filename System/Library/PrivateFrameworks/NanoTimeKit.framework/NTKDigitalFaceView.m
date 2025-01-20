@interface NTKDigitalFaceView
- (BOOL)_timeLabelUsesLegibility;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (int64_t)viewMode;
- (unint64_t)_timeLabelOptions;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_createTimeViewIfNecessary;
- (void)_loadSnapshotContentViews;
- (void)_unloadSnapshotContentViews;
- (void)invalidateDigitalTimeLabelStyle;
- (void)layoutSubviews;
- (void)setViewMode:(int64_t)a3;
- (void)setViewMode:(int64_t)a3 updateTimeViewStyle:(BOOL)a4;
@end

@implementation NTKDigitalFaceView

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDigitalFaceView;
  [(NTKFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKDigitalFaceView *)self _createTimeViewIfNecessary];
  [(NTKDigitalFaceView *)self setViewMode:0];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalFaceView;
  [(NTKFaceView *)&v4 _unloadSnapshotContentViews];
  objc_super v3 = [(NTKFaceView *)self timeView];
  [v3 removeFromSuperview];

  [(NTKFaceView *)self setTimeView:0];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKDigitalFaceView;
  [(NTKFaceView *)&v7 layoutSubviews];
  objc_super v3 = [(NTKFaceView *)self timeView];
  [v3 setFrameUsingCurrentStyle];

  objc_super v4 = [(NTKFaceView *)self rootContainerView];
  v5 = [(NTKFaceView *)self timeView];
  v6 = [(NTKFaceView *)self complicationContainerView];
  [v4 insertSubview:v5 belowSubview:v6];
}

- (void)setViewMode:(int64_t)a3
{
}

- (void)setViewMode:(int64_t)a3 updateTimeViewStyle:(BOOL)a4
{
  self->_viewMode = a3;
  if (a4) {
    [(NTKDigitalFaceView *)self invalidateDigitalTimeLabelStyle];
  }
}

- (void)invalidateDigitalTimeLabelStyle
{
  [(NTKDigitalFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTKFaceView *)self timeView];
  v12 = -[NTKDigitalFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", self->_viewMode, v4, v6, v8, v10);
  [v11 setStyle:v12];

  [(NTKDigitalFaceView *)self setNeedsLayout];
}

- (unint64_t)_timeLabelOptions
{
  return 0;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = [(NTKFaceView *)self device];
  double v9 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 0, v8, x, y, width, height, 0.0);

  return v9;
}

- (BOOL)_timeLabelUsesLegibility
{
  return 0;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)NTKDigitalFaceView;
  -[NTKFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v7, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  double v6 = [(NTKFaceView *)self timeView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v6, "setAlpha:");
}

- (void)_createTimeViewIfNecessary
{
  double v3 = [(NTKFaceView *)self timeView];

  if (!v3)
  {
    unint64_t v4 = [(NTKDigitalFaceView *)self _timeLabelOptions];
    double v5 = [(NTKFaceView *)self device];
    id v9 = +[CLKUITimeLabel labelWithOptions:v4 forDevice:v5];

    objc_msgSend(v9, "setUsesLegibility:", -[NTKDigitalFaceView _timeLabelUsesLegibility](self, "_timeLabelUsesLegibility"));
    double v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [v9 setTextColor:v6];

    objc_super v7 = +[NTKTimeOffsetManager sharedManager];
    [v7 timeOffset];
    objc_msgSend(v9, "setTimeOffset:");

    [(NTKFaceView *)self setTimeView:v9];
    double v8 = [(NTKFaceView *)self rootContainerView];
    [v8 addSubview:v9];

    [(NTKDigitalFaceView *)self invalidateDigitalTimeLabelStyle];
  }
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

@end