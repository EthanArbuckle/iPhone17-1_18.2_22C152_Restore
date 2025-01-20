@interface RCPlatterWaveformSlice
- (BOOL)amplitudeNeedsUpdate;
- (RCPlatterWaveformSlice)init;
- (UIView)view;
- (double)amplitude;
- (void)setAmplitude:(double)a3;
- (void)setAmplitudeNeedsUpdate:(BOOL)a3;
- (void)setView:(id)a3;
- (void)setupView;
@end

@implementation RCPlatterWaveformSlice

- (RCPlatterWaveformSlice)init
{
  v5.receiver = self;
  v5.super_class = (Class)RCPlatterWaveformSlice;
  v2 = [(RCPlatterWaveformSlice *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RCPlatterWaveformSlice *)v2 setupView];
  }
  return v3;
}

- (void)setupView
{
  id v8 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(RCPlatterWaveformSlice *)self setView:v8];
  v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 platterWaveformSliceWidth];
  double v5 = v4;
  [v8 setFrame:0.0, 0.0, v5, v5];
  v6 = [v8 layer];
  [v6 setCornerRadius:v5 * 0.5];

  v7 = [v8 layer];
  [v7 setAllowsEdgeAntialiasing:1];
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (BOOL)amplitudeNeedsUpdate
{
  return self->_amplitudeNeedsUpdate;
}

- (void)setAmplitudeNeedsUpdate:(BOOL)a3
{
  self->_amplitudeNeedsUpdate = a3;
}

- (void).cxx_destruct
{
}

@end