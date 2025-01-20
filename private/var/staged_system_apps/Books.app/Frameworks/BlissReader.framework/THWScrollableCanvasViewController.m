@interface THWScrollableCanvasViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)shouldHideCanvasLayerInMagnifier;
- (BOOL)wantsHyperlinkGestureRecognizer;
- (TSUColor)magnifierBackgroundColor;
- (id)backgroundColorForMagnifier;
- (void)dealloc;
- (void)setMagnifierBackgroundColor:(id)a3;
- (void)teardown;
@end

@implementation THWScrollableCanvasViewController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasViewController;
  [(THWScrollableCanvasViewController *)&v3 dealloc];
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("menuCopy:" != a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)THWScrollableCanvasViewController;
  return -[THWScrollableCanvasViewController canPerformAction:withSender:](&v5, "canPerformAction:withSender:");
}

- (void)teardown
{
  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasViewController;
  [(THWScrollableCanvasViewController *)&v3 teardown];

  self->_magnifierBackgroundColor = 0;
}

- (id)backgroundColorForMagnifier
{
  if (![(THWScrollableCanvasViewController *)self magnifierBackgroundColor]) {
    [(THWScrollableCanvasViewController *)self setMagnifierBackgroundColor:+[TSUColor whiteColor]];
  }

  return [(THWScrollableCanvasViewController *)self magnifierBackgroundColor];
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 0;
}

- (TSUColor)magnifierBackgroundColor
{
  return self->_magnifierBackgroundColor;
}

- (void)setMagnifierBackgroundColor:(id)a3
{
}

@end