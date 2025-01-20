@interface THGlossaryInteractiveCanvasController
- (BOOL)handleGesture:(id)a3;
- (BOOL)handleHyperlinksWithTextGRs;
- (BOOL)shouldPreventBackgroundLayout;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)spellCheckingSuppressed;
- (BOOL)supportsReadingHighlights;
- (BOOL)supportsWritingHighlights;
- (BOOL)usesTiledLayers;
- (CGSize)canvasScrollingOutset;
- (THLinkTraversalDelegate)linkHandler;
- (void)handleHyperlinkGesture:(id)a3;
- (void)p_dismissSearchKeyboard;
- (void)setLinkHandler:(id)a3;
- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5;
- (void)showHyperlinkInfoForField:(id)a3 inRep:(id)a4 openInEditMode:(BOOL)a5;
@end

@implementation THGlossaryInteractiveCanvasController

- (BOOL)shouldPreventBackgroundLayout
{
  return 0;
}

- (BOOL)usesTiledLayers
{
  return 0;
}

- (CGSize)canvasScrollingOutset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)supportsReadingHighlights
{
  return 0;
}

- (BOOL)supportsWritingHighlights
{
  return 0;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  double v2 = +[NSUserDefaults standardUserDefaults];
  double v3 = kTHShowTextOverflowIndicator[0];

  return [(NSUserDefaults *)v2 BOOLForKey:v3];
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v5 setSelection:a3 onModel:a4 withFlags:a5 & 0xFFFFFFFFFFFFFFAFLL];
}

- (void)p_dismissSearchKeyboard
{
  double v2 = +[NSNotification notificationWithName:kTHGlossaryDismissSearchNotification object:self];
  double v3 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v3 postNotification:v2];
}

- (BOOL)handleGesture:(id)a3
{
  [(THGlossaryInteractiveCanvasController *)self p_dismissSearchKeyboard];
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryInteractiveCanvasController;
  return [(THInteractiveCanvasController *)&v6 handleGesture:a3];
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 1;
}

- (void)showHyperlinkInfoForField:(id)a3 inRep:(id)a4 openInEditMode:(BOOL)a5
{
  id v6 = -[THInteractiveCanvasController linkForHyperlinkField:](self, "linkForHyperlinkField:", a3, a4, a5);
  mLinkHandler = self->mLinkHandler;
  if (!mLinkHandler)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryInteractiveCanvasController showHyperlinkInfoForField:inRep:openInEditMode:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryInteractiveCanvasController.m") lineNumber:105 description:@"invalid nil value for '%s'", "mLinkHandler"];
    mLinkHandler = self->mLinkHandler;
  }

  [(THLinkTraversalDelegate *)mLinkHandler followLink:v6];
}

- (void)handleHyperlinkGesture:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    if ([a3 wasTapHold]) {
      +[TSWPEditMenuController hideEditMenu];
    }
    id v5 = -[THInteractiveCanvasController linkForHyperlinkField:](self, "linkForHyperlinkField:", [a3 hitField]);
    [+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController") endUISession];
    mLinkHandler = self->mLinkHandler;
    if (!mLinkHandler)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryInteractiveCanvasController handleHyperlinkGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryInteractiveCanvasController.m") lineNumber:129 description:@"invalid nil value for '%s'", "mLinkHandler"];
      mLinkHandler = self->mLinkHandler;
    }
    [(THLinkTraversalDelegate *)mLinkHandler followLink:v5];
  }
}

- (THLinkTraversalDelegate)linkHandler
{
  return self->mLinkHandler;
}

- (void)setLinkHandler:(id)a3
{
  self->mLinkHandler = (THLinkTraversalDelegate *)a3;
}

@end