@interface SXViewportDebuggerOverlayView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setBorderColor:(id *)a1;
@end

@implementation SXViewportDebuggerOverlayView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setBorderColor:(id *)a1
{
  id v5 = a2;
  if (a1)
  {
    v4 = [a1 layer];
    if (v5)
    {
      [v4 setBorderWidth:1.0];

      v4 = [a1 layer];
      objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));
    }
    else
    {
      [v4 setBorderWidth:0.0];
    }

    objc_storeStrong(a1 + 51, a2);
  }
}

- (void).cxx_destruct
{
}

@end