@interface SUICWEdgeLight
- (SUICEdgeLightMaskMetalLayer)wedge;
- (SUICWEdgeLight)initWithDelegate:(id)a3;
- (void)_drawFrame:(id)a3;
- (void)setWedge:(id)a3;
@end

@implementation SUICWEdgeLight

- (SUICWEdgeLight)initWithDelegate:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUICWEdgeLight;
  v5 = [(SUICWEdgeLight *)&v7 init];
  if (v5 == self) {
    [(SUICWEdgeLight *)self setWedge:v4];
  }

  return v5;
}

- (void)_drawFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(SUICWEdgeLight *)self wedge];
  [v5 _drawFrame:v4];
}

- (SUICEdgeLightMaskMetalLayer)wedge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wedge);

  return (SUICEdgeLightMaskMetalLayer *)WeakRetained;
}

- (void)setWedge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end