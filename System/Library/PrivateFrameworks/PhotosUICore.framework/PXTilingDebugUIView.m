@interface PXTilingDebugUIView
- (PXTilingControllerDebugInfo)_debugInfo;
- (PXTilingDebugUIView)init;
- (void)_setDebugInfo:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)tilingControllerDidUpdateDebugInfo:(id)a3;
@end

@implementation PXTilingDebugUIView

- (void).cxx_destruct
{
}

- (PXTilingControllerDebugInfo)_debugInfo
{
  return self->__debugInfo;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = [(PXTilingDebugUIView *)self _debugInfo];
  objc_msgSend(v9, "drawInRect:inContext:", CurrentContext, x, y, width, height);
}

- (void)tilingControllerDidUpdateDebugInfo:(id)a3
{
  id v4 = [a3 debugInfo];
  [(PXTilingDebugUIView *)self _setDebugInfo:v4];
}

- (void)_setDebugInfo:(id)a3
{
  v5 = (PXTilingControllerDebugInfo *)a3;
  if (self->__debugInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__debugInfo, a3);
    [(PXTilingDebugUIView *)self setNeedsDisplay];
    v5 = v6;
  }
}

- (PXTilingDebugUIView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXTilingDebugUIView;
  v2 = [(PXTilingDebugUIView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_debugWidth = 100.0;
    [(PXTilingDebugUIView *)v2 setOpaque:0];
    [(PXTilingDebugUIView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

@end