@interface CRLiOSDocumentModeFindReplace
- (BOOL)allowsDragOnUnselectedReps;
- (BOOL)allowsEditMask;
- (BOOL)allowsPencilAnnotations;
- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4;
- (BOOL)shouldSelectAndScrollWithApplePencil;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3;
- (BOOL)wantsToEndForNonPopoverPresentations;
- (BOOL)wantsToSuppressSelectionKnobs;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLiOSDocumentModeFindReplace)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4;
- (unint64_t)hash;
- (void)handleAlternateContextMenuBehaviorAtPoint:(CGPoint)a3;
- (void)modeDidEndForMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4;
- (void)setInteractiveCanvasController:(id)a3;
@end

@implementation CRLiOSDocumentModeFindReplace

- (CRLiOSDocumentModeFindReplace)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSDocumentModeFindReplace;
  v7 = [(CRLiOSDocumentMode *)&v10 initWithBoardViewController:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_interactiveCanvasController, v6);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 5;
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSDocumentModeFindReplace;
  [(CRLiOSDocumentMode *)&v12 modeWillBeginFromMode:a3 forced:a4];
  v5 = [(CRLiOSDocumentModeFindReplace *)self interactiveCanvasController];
  id v6 = [v5 editorController];

  v7 = [(CRLiOSDocumentModeFindReplace *)self interactiveCanvasController];
  v8 = [v7 selectionModelTranslator];
  v9 = [v8 selectionPathForInfos:0];

  [v6 setSelectionPath:v9];
  objc_super v10 = [(CRLiOSDocumentModeFindReplace *)self interactiveCanvasController];
  v11 = [v10 textInputResponder];
  [v11 setDisallowBecomingFirstResponder:1];
}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CRLiOSDocumentModeFindReplace *)self interactiveCanvasController];
  v8 = [v7 textInputResponder];
  [v8 setDisallowBecomingFirstResponder:0];

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSDocumentModeFindReplace;
  [(CRLiOSDocumentMode *)&v9 modeWillEndForMode:v6 forced:v4];
}

- (void)modeDidEndForMode:(id)a3 forced:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSDocumentModeFindReplace;
  [(CRLiOSDocumentMode *)&v11 modeDidEndForMode:a3 forced:a4];
  v5 = [(CRLiOSDocumentMode *)self boardViewController];
  id v6 = [v5 findReplaceInteraction];
  [v6 dismissFindNavigator];

  v7 = [(CRLiOSDocumentModeFindReplace *)self interactiveCanvasController];
  v8 = [v7 layerHost];
  objc_super v9 = [v8 asiOSCVC];
  [v9 becomeFirstResponderIfAppropriate];

  objc_super v10 = [(CRLiOSDocumentModeFindReplace *)self interactiveCanvasController];
  [v10 setShowGrayOverlay:0];
}

- (BOOL)allowsEditMask
{
  return 0;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 1;
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 1;
}

- (BOOL)allowsDragOnUnselectedReps
{
  return 0;
}

- (BOOL)allowsPencilAnnotations
{
  return 0;
}

- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  return 1;
}

- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return 1;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  BOOL v4 = [(CRLiOSDocumentMode *)self boardViewController];
  v5 = [v4 findReplaceInteraction];
  [v5 dismissFindNavigator];

  return 1;
}

- (void)handleAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  id v4 = [(CRLiOSDocumentMode *)self boardViewController];
  id v3 = [v4 documentModeController];
  [v3 performSelector:"resetToDefaultModeAnimated:" withObject:&__kCFBooleanTrue afterDelay:0.0];
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end