@interface PGMicroPIPButtonView
+ (id)button;
- (PGHostedWindowHostingHandle)hostedWindowHostingHandle;
- (void)layoutSubviews;
- (void)setHostedWindowHostingHandle:(id)a3;
@end

@implementation PGMicroPIPButtonView

+ (id)button
{
  v2 = (id *)objc_alloc_init((Class)a1);
  if (v2)
  {
    v3 = [PGLayerHostView alloc];
    [v2 bounds];
    uint64_t v4 = -[PGLayerHostView initWithFrame:](v3, "initWithFrame:");
    id v5 = v2[51];
    v2[51] = (id)v4;

    [v2[51] setUserInteractionEnabled:0];
    v6 = [v2[51] layer];
    [v6 setAllowsHitTesting:0];

    [v2 insertSubview:v2[51] atIndex:0];
    [v2 setClipsToBounds:1];
  }

  return v2;
}

- (PGHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return [(PGLayerHostView *)self->_layerHostView hostedWindowHostingHandle];
}

- (void)setHostedWindowHostingHandle:(id)a3
{
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PGMicroPIPButtonView;
  [(PGMicroPIPButtonView *)&v4 layoutSubviews];
  layerHostView = self->_layerHostView;
  [(PGMicroPIPButtonView *)self bounds];
  -[PGLayerHostView setFrame:](layerHostView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end