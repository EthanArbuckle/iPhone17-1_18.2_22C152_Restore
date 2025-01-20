@interface _PageRenderMetricsVisualizer.MetricsVisualizerUIWindow
- (BOOL)canBecomeKeyWindow;
- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithCoder:(id)a3;
- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithFrame:(CGRect)a3;
- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithWindowScene:(id)a3;
- (void)hideDebugUIWindow;
@end

@implementation _PageRenderMetricsVisualizer.MetricsVisualizerUIWindow

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithWindowScene:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = [(_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow *)&v9 initWithWindowScene:v4];
  double v6 = *MEMORY[0x263F83C48];
  v7 = v5;
  -[_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow setWindowLevel:](v7, sel_setWindowLevel_, v6, v9.receiver, v9.super_class);
  [(_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow *)v7 setUserInteractionEnabled:0];

  return v7;
}

- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithCoder:(id)a3
{
  result = (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *)sub_21915B5B8();
  __break(1u);
  return result;
}

- (void)hideDebugUIWindow
{
}

- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithFrame:(CGRect)a3
{
  result = (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end