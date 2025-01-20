@interface _UIMotionAnalyzer
- (BOOL)applyHysteresisWithReceivedEventTimestamp:(double)a3 timeSinceLastNewMotionEvent:(double)a4 slowUpdatesEnabled:(BOOL)a5 returningShouldToggleSlowUpdates:(BOOL *)a6 logger:(id)a7;
- (_UIMotionAnalyzer)init;
- (_UIMotionAnalyzer)initWithSettings:(id)a3;
- (_UIMotionAnalyzerSettings)settings;
- (_UIViewerRelativeDevicePose)viewerRelativeDevicePose;
- (id)description;
@end

@implementation _UIMotionAnalyzer

- (_UIMotionAnalyzerSettings)settings
{
  return self->_settings;
}

- (_UIViewerRelativeDevicePose)viewerRelativeDevicePose
{
  return self->_viewerRelativeDevicePose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewerRelativeDevicePose, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (_UIMotionAnalyzer)initWithSettings:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIMotionAnalyzer;
  v6 = [(_UIMotionAnalyzer *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = objc_alloc_init(_UIViewerRelativeDevicePose);
    viewerRelativeDevicePose = v7->_viewerRelativeDevicePose;
    v7->_viewerRelativeDevicePose = v8;

    v10 = v7;
  }

  return v7;
}

- (_UIMotionAnalyzer)init
{
  v3 = objc_alloc_init(_UIMotionAnalyzerSettings);
  v4 = [(_UIMotionAnalyzer *)self initWithSettings:v3];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  settings = self->_settings;
  v7 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  v8 = [v3 stringWithFormat:@"<%@: %p settings=%@ viewerRelativeDevicePose=%@>", v5, self, settings, v7];

  return v8;
}

- (BOOL)applyHysteresisWithReceivedEventTimestamp:(double)a3 timeSinceLastNewMotionEvent:(double)a4 slowUpdatesEnabled:(BOOL)a5 returningShouldToggleSlowUpdates:(BOOL *)a6 logger:(id)a7
{
  return 0;
}

@end