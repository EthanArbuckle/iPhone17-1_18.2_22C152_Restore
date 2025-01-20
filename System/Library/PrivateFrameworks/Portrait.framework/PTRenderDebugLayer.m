@interface PTRenderDebugLayer
- (PTRenderDebugLayer)initWithMetalContext:(id)a3 renderEffects:(id)a4;
- (double)getBiasedDisparityVisualizationRange:;
@end

@implementation PTRenderDebugLayer

- (PTRenderDebugLayer)initWithMetalContext:(id)a3 renderEffects:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PTRenderDebugLayer;
  v4 = [(PTRenderDebugLayer *)&v8 init];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (double)getBiasedDisparityVisualizationRange:
{
  return 0.0;
}

@end