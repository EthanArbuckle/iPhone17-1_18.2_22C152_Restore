@interface THLayerContainingView
- (BOOL)allowLayerDelegate;
- (void)addSublayer:(id)a3;
- (void)removeSublayer:(id)a3;
- (void)setAllowLayerDelegate:(BOOL)a3;
@end

@implementation THLayerContainingView

- (void)addSublayer:(id)a3
{
  TSUScreenScale();
  [a3 setContentsScale:];
  id v5 = [(THLayerContainingView *)self layer];

  [v5 addSublayer:a3];
}

- (void)removeSublayer:(id)a3
{
  id v5 = [a3 superlayer];
  if (v5 == [(THLayerContainingView *)self layer])
  {
    [a3 removeFromSuperlayer];
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THLayerContainingView removeSublayer:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THLayerContainingView.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:33 description:@"this isn't one of our sublayers"];
  }
}

- (BOOL)allowLayerDelegate
{
  return self->_allowLayerDelegate;
}

- (void)setAllowLayerDelegate:(BOOL)a3
{
  self->_allowLayerDelegate = a3;
}

@end