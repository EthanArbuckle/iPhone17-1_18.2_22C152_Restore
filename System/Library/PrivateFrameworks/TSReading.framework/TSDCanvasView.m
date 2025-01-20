@interface TSDCanvasView
+ (Class)layerClass;
- (BOOL)isInteractingWithLink;
- (BOOL)mightHaveLinks;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3;
- (TSDCanvasLayer)canvasLayer;
- (TSDCanvasLayerHosting)layerHost;
- (TSDCanvasView)rootCanvasView;
- (TSDInteractiveCanvasController)controller;
- (TSKScrollView)enclosingScrollView;
- (UITextLinkInteraction)hyperLinkDelegate;
- (id)_textImageFromRect:(CGRect)a3;
- (id)_textInputForReveal;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)_requestTextItemConstrainedToLineAtPoint:(CGPoint)a3 resultHandler:(id)a4;
- (void)cancelInteractionWithLink;
- (void)setController:(id)a3;
- (void)setHyperLinkDelegate:(id)a3;
- (void)setLayerHost:(id)a3;
- (void)startInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)tapLinkAtPoint:(CGPoint)a3;
- (void)teardown;
- (void)updateInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3;
@end

@implementation TSDCanvasView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setController:(id)a3
{
  if (!self->mController
    || (v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v6 = [NSString stringWithUTF8String:"-[TSDCanvasView setController:]"],
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasView.m"), 38, @"shouldn't try to set canvasView's controller more than once"), !self->mController))
  {
    self->mController = (TSDInteractiveCanvasController *)a3;
    [(TSDCanvasLayer *)[(TSDCanvasView *)self canvasLayer] setController:a3];
    uint64_t v7 = [a3 layerHost];
    [(TSDCanvasView *)self setLayerHost:v7];
  }
}

- (void)teardown
{
  self->mController = 0;
  [(TSDCanvasLayer *)[(TSDCanvasView *)self canvasLayer] teardown];
  if (TSUSupportsTextInteraction()) {
    self->mHyperLinkDelegate = 0;
  }
}

- (TSDCanvasLayer)canvasLayer
{
  objc_opt_class();
  [(TSDCanvasView *)self layer];

  return (TSDCanvasLayer *)TSUDynamicCast();
}

- (TSKScrollView)enclosingScrollView
{
  objc_opt_class();
  [(TSDCanvasView *)self superview];

  return (TSKScrollView *)TSUDynamicCast();
}

- (TSDCanvasView)rootCanvasView
{
  v2 = self;
  uint64_t v3 = [(TSDCanvasView *)self superview];
  if (v3)
  {
    v4 = (TSDCanvasView *)v3;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v2 = v4;
      }
      v4 = (TSDCanvasView *)[(TSDCanvasView *)v4 superview];
    }
    while (v4);
  }
  return v2;
}

- (BOOL)mightHaveLinks
{
  int v3 = TSUSupportsTextInteraction();
  if (v3)
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    LOBYTE(v3) = [(UITextLinkInteraction *)mHyperLinkDelegate mightHaveLinks];
  }
  return v3;
}

- (void)tapLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    -[UITextLinkInteraction tapLinkAtPoint:](mHyperLinkDelegate, "tapLinkAtPoint:", x, y);
  }
}

- (BOOL)isInteractingWithLink
{
  int v3 = TSUSupportsTextInteraction();
  if (v3)
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    LOBYTE(v3) = [(UITextLinkInteraction *)mHyperLinkDelegate isInteractingWithLink];
  }
  return v3;
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    -[UITextLinkInteraction startInteractionWithLinkAtPoint:](mHyperLinkDelegate, "startInteractionWithLinkAtPoint:", x, y);
  }
}

- (void)updateInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    -[UITextLinkInteraction updateInteractionWithLinkAtPoint:](mHyperLinkDelegate, "updateInteractionWithLinkAtPoint:", x, y);
  }
}

- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    -[UITextLinkInteraction validateInteractionWithLinkAtPoint:](mHyperLinkDelegate, "validateInteractionWithLinkAtPoint:", x, y);
  }
}

- (void)cancelInteractionWithLink
{
  if (TSUSupportsTextInteraction())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    [(UITextLinkInteraction *)mHyperLinkDelegate cancelInteractionWithLink];
  }
}

- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    -[UITextLinkInteraction startLongInteractionWithLinkAtPoint:](mHyperLinkDelegate, "startLongInteractionWithLinkAtPoint:", x, y);
  }
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = TSUSupportsTextInteraction();
  if (v6)
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    LOBYTE(v6) = -[UITextLinkInteraction willInteractWithLinkAtPoint:](mHyperLinkDelegate, "willInteractWithLinkAtPoint:", x, y);
  }
  return v6;
}

- (void)_requestTextItemConstrainedToLineAtPoint:(CGPoint)a3 resultHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if TSUSupportsTextInteraction() && (objc_opt_respondsToSelector())
  {
    mHyperLinkDelegate = self->mHyperLinkDelegate;
    -[UITextLinkInteraction _requestTextItemConstrainedToLineAtPoint:resultHandler:](mHyperLinkDelegate, "_requestTextItemConstrainedToLineAtPoint:resultHandler:", a4, x, y);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TSDCanvasView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  mController = self->mController;
  if (mController)
  {
    [(TSDInteractiveCanvasController *)mController delegate];
    if (objc_opt_respondsToSelector())
    {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:expandBoundsForHitTesting:]([(TSDInteractiveCanvasController *)self->mController delegate], "interactiveCanvasController:expandBoundsForHitTesting:", self->mController, v8, v10, v12, v14);
      double v8 = v16;
      double v10 = v17;
      double v12 = v18;
      double v14 = v19;
    }
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  CGFloat v24 = x;
  CGFloat v25 = y;

  return CGRectContainsPoint(*(CGRect *)&v20, *(CGPoint *)&v24);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if ((id)[(TSDCanvasView *)self layer] == a3
    && (id v8 = [(TSDInteractiveCanvasController *)self->mController i_currentAnimation]) != 0)
  {
    return (id)[v8 actionForLayer:a3 forKey:a4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDCanvasView;
    return [(TSDCanvasView *)&v9 actionForLayer:a3 forKey:a4];
  }
}

- (id)_textInputForReveal
{
  return [(TSDInteractiveCanvasController *)self->mController textInputResponder];
}

- (id)_textImageFromRect:(CGRect)a3
{
  id result = -[TSDInteractiveCanvasController textImageFromRect:](self->mController, "textImageFromRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    id v4 = result;
    v5 = (void *)MEMORY[0x263F1C6B0];
    return (id)[v5 imageWithCGImage:v4];
  }
  return result;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->mLayerHost;
}

- (void)setLayerHost:(id)a3
{
  self->mLayerHost = (TSDCanvasLayerHosting *)a3;
}

- (TSDInteractiveCanvasController)controller
{
  return self->mController;
}

- (UITextLinkInteraction)hyperLinkDelegate
{
  return self->mHyperLinkDelegate;
}

- (void)setHyperLinkDelegate:(id)a3
{
  self->mHyperLinkDelegate = (UITextLinkInteraction *)a3;
}

@end