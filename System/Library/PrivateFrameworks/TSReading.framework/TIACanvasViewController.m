@interface TIACanvasViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)wantsHyperlinkGestureRecognizer;
- (TSAInteractiveCanvasController)interactiveCanvasController;
- (UIGestureRecognizer)hyperlinkGestureRecognizer;
- (id)commonGestureRecognizers;
- (id)p_LocalGestureRecognizers;
- (void)setHyperlinkGestureRecognizer:(id)a3;
- (void)setUpGestureRecognizers;
@end

@implementation TIACanvasViewController

- (id)commonGestureRecognizers
{
  v3.receiver = self;
  v3.super_class = (Class)TIACanvasViewController;
  return [(NSArray *)[(TSDiOSCanvasViewController *)&v3 commonGestureRecognizers] arrayByAddingObjectsFromArray:[(TIACanvasViewController *)self p_LocalGestureRecognizers]];
}

- (void)setUpGestureRecognizers
{
  v4.receiver = self;
  v4.super_class = (Class)TIACanvasViewController;
  [(TSWPiOSCanvasViewController *)&v4 setUpGestureRecognizers];
  if ([(TIACanvasViewController *)self wantsHyperlinkGestureRecognizer])
  {
    if (![(TIACanvasViewController *)self hyperlinkGestureRecognizer])
    {
      objc_super v3 = [[TSAHyperlinkGestureRecognizer alloc] initWithTarget:self action:sel_handleHyperlinkGesture_];
      [(TIACanvasViewController *)self setHyperlinkGestureRecognizer:v3];
      [(TSAHyperlinkGestureRecognizer *)v3 setDelegate:self];
      [(TSAHyperlinkGestureRecognizer *)v3 setIcc:[(TIACanvasViewController *)self interactiveCanvasController]];
    }
    objc_msgSend((id)-[TIACanvasViewController view](self, "view"), "addGestureRecognizer:", -[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
    [(UITapGestureRecognizer *)self->super.super.mSingleTapGestureRecognizer requireGestureRecognizerToFail:[(TIACanvasViewController *)self hyperlinkGestureRecognizer]];
    [(TSDRepDragGestureRecognizer *)self->super.super.mRepDragGestureRecognizer requireGestureRecognizerToFail:[(TIACanvasViewController *)self hyperlinkGestureRecognizer]];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)TIACanvasViewController;
  return [(TSDiOSCanvasViewController *)&v8 gestureRecognizer:a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:a4];
}

- (void)setHyperlinkGestureRecognizer:(id)a3
{
  self->super._hyperlinkGestureRecognizer = (UIGestureRecognizer *)a3;
}

- (UIGestureRecognizer)hyperlinkGestureRecognizer
{
  return self->super._hyperlinkGestureRecognizer;
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 1;
}

- (TSAInteractiveCanvasController)interactiveCanvasController
{
  objc_opt_class();

  return (TSAInteractiveCanvasController *)TSUDynamicCast();
}

- (id)p_LocalGestureRecognizers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(UIGestureRecognizer *)[(TIACanvasViewController *)self hyperlinkGestureRecognizer] isEnabled])
  {
    objc_msgSend(v3, "addObject:", -[TIACanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
  }

  return v3;
}

@end