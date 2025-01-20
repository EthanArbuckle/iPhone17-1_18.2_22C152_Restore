@interface TSWPInteractiveCanvasController
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)cellCommentsAllowedForTableInfo:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handleHyperlinksWithTextGRs;
- (BOOL)hyperlinkPopoverIsShown;
- (BOOL)isEditingText;
- (BOOL)isTearingDown;
- (BOOL)shouldRespondToTextHyperlinks;
- (BOOL)showsComments;
- (BOOL)suppressDoubleTapForSelection;
- (BOOL)textRepsShouldTileAggressively;
- (BOOL)zoomColumnAtPoint:(CGPoint)a3;
- (CGImage)textImageFromRect:(CGRect)a3;
- (CGRect)scrollFocusRectForModel:(id)a3 withSelection:(id)a4;
- (id)_repsForStorage:(id)a3;
- (id)beginEditingRepForInfo:(id)a3;
- (id)closestRepToPoint:(CGPoint)a3;
- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4;
- (id)infosToHideForCanvas:(id)a3;
- (id)p_beginEditingPossibleContainedRep:(id *)a3;
- (id)p_repsForStorage:(id)a3;
- (void)dealloc;
- (void)didBeginEditingText;
- (void)gestureSequenceDidEnd;
- (void)gestureSequenceWillBegin;
- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5;
- (void)resumeEditing;
- (void)teardown;
- (void)willEndEditingText;
- (void)withLayoutForModel:(id)a3 withSelection:(id)a4 performBlock:(id)a5;
@end

@implementation TSWPInteractiveCanvasController

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)TSWPInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v3 dealloc];
}

- (void)teardown
{
  self->_isTearingDown = 1;
  v3.receiver = self;
  v3.super_class = (Class)TSWPInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v3 teardown];
  self->_isTearingDown = 0;
}

- (CGRect)scrollFocusRectForModel:(id)a3 withSelection:(id)a4
{
  v6 = (CGRect *)MEMORY[0x263F001A0];
  CGFloat v7 = *MEMORY[0x263F001A0];
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v9 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v10 = *(double *)(MEMORY[0x263F001A0] + 24);
  objc_opt_class();
  v11 = (void *)TSUDynamicCast();
  if ([v11 isRange])
  {
    objc_opt_class();
    [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
    v12 = (void *)TSUDynamicCast();
    if (([v12 selectionLastModifiedWithKnob] & 1) != 0
      || [v12 selectionLastModifiedWithKeyboard])
    {
      __int16 v13 = [v12 currentSelectionFlags];
      uint64_t v14 = [v11 range];
      if (v13 < 0) {
        uint64_t v16 = v15 + v14 - 1;
      }
      else {
        uint64_t v16 = v14;
      }
      v17 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v16, 1);
      if (a3)
      {
        v18 = v17;
        id v19 = [(TSDInteractiveCanvasController *)self infoForModel:a3 withSelection:v17];
        if (v19)
        {
          id v20 = [(TSDInteractiveCanvasController *)self layoutForInfo:v19];
          [v20 rectForSelection:v18];
          double x = v29.origin.x;
          double y = v29.origin.y;
          double width = v29.size.width;
          double height = v29.size.height;
          if (!CGRectEqualToRect(v29, *v6))
          {
            objc_msgSend(v20, "rectInRoot:", x, y, width, height);
            CGRect v31 = CGRectInset(v30, 0.0, -20.0);
            CGFloat v7 = v31.origin.x;
            CGFloat v8 = v31.origin.y;
            CGFloat v9 = v31.size.width;
            CGFloat v10 = v31.size.height;
          }
        }
      }
    }
  }
  double v25 = v7;
  double v26 = v8;
  double v27 = v9;
  double v28 = v10;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)withLayoutForModel:(id)a3 withSelection:(id)a4 performBlock:(id)a5
{
  id v6 = [(TSDInteractiveCanvasController *)self layoutForModel:a3 withSelection:a4];
  CGFloat v7 = (void (*)(id, id))*((void *)a5 + 2);

  v7(a5, v6);
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 0;
}

- (BOOL)shouldRespondToTextHyperlinks
{
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  objc_super v3 = [(TSDInteractiveCanvasController *)self delegate];

  return [(TSDInteractiveCanvasControllerDelegate *)v3 interactiveCanvasControllerAllowsHyperlinkInteraction];
}

- (id)p_beginEditingPossibleContainedRep:(id *)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPInteractiveCanvasController p_beginEditingPossibleContainedRep:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 205, @"invalid nil value for '%s'", "ioContainedRep");
  }
  objc_opt_class();
  [*a3 parentRep];
  CGFloat v7 = (void *)TSUDynamicCast();
  if (v7)
  {
    CGFloat v8 = v7;
    [v7 willBeginEditingContainedRep];
    id v9 = (id)[v8 containedRep];
    *a3 = v9;
  }
  else
  {
    id v9 = *a3;
  }

  return [(TSDInteractiveCanvasController *)self beginEditingRep:v9];
}

- (id)beginEditingRepForInfo:(id)a3
{
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] layoutIfNeeded];
  objc_opt_class();
  [(TSDInteractiveCanvasController *)self repForInfo:a3];
  v5 = (void *)TSUDynamicCast();
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v10 = objc_msgSend(-[TSDInteractiveCanvasController repForInfo:](self, "repForInfo:", objc_msgSend(a3, "parentInfo")), "repForSelecting");
      if (v10)
      {
        v11 = v10;
        if (([v10 isSelectedIgnoringLocking] & 1) == 0) {
          [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] setSelectionToRep:v11];
        }
      }
    }
    goto LABEL_12;
  }
  uint64_t v14 = [v5 containedRep];
  if (!v14
    || ((v6 = -[TSWPInteractiveCanvasController p_beginEditingPossibleContainedRep:](self, "p_beginEditingPossibleContainedRep:", &v14), objc_opt_class(), CGFloat v7 = (void *)TSUDynamicCast(), v8 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", 0, objc_msgSend((id)objc_msgSend(v7, "storage"), "length")), !objc_msgSend(v7, "pIsSelectionPlaceHolderTextWithSelection:", v8))? (v9 = 16640): (v9 = 0x4000), -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](self, "setSelection:onModel:withFlags:", v8, objc_msgSend(v7, "storage"), v9),
        v8,
        !v6))
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)TSWPInteractiveCanvasController;
    return [(TSDInteractiveCanvasController *)&v13 beginEditingRepForInfo:a3];
  }
  return v6;
}

- (void)resumeEditing
{
  mTextInputResponder = self->super.mTextInputResponder;
  if (mTextInputResponder) {
    [(TSDTextInputResponder *)mTextInputResponder resumeEditing];
  }
  if (![(TSWPInteractiveCanvasController *)self isEditingText]
    && (objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "isFirstResponder") & 1) == 0)
  {
    v4 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
    [v4 becomeFirstResponder];
  }
}

- (CGImage)textImageFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  double MidX = CGRectGetMidX(a3);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = -[TSDInteractiveCanvasController hitRepsAtPoint:withSlop:](self, "hitRepsAtPoint:withSlop:", MidX, CGRectGetMidY(v24), *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_opt_class();
        uint64_t v14 = (void *)TSUDynamicCast();
        if (v14)
        {
          uint64_t v16 = v14;
          objc_msgSend(v14, "convertNaturalRectFromUnscaledCanvas:", x, y, width, height);
          return (CGImage *)objc_msgSend((id)objc_msgSend(v16, "textImageForRect:"), "CGImage");
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)TSWPInteractiveCanvasController;
  return -[TSDInteractiveCanvasController textImageFromRect:](&v17, sel_textImageFromRect_, x, y, width, height);
}

- (BOOL)isEditingText
{
  objc_opt_class();
  [[(TSDTextInputResponder *)self->super.mTextInputResponder editor] selection];
  objc_super v3 = (void *)TSUDynamicCast();
  int v4 = [(TSDTextInputResponder *)self->super.mTextInputResponder isFirstResponder];
  if (v4)
  {
    LOBYTE(v4) = [v3 isValid];
  }
  return v4;
}

- (BOOL)canHandleGesture:(id)a3
{
  [a3 unscaledLocationForICC:self];
  double v6 = v5;
  double v8 = v7;
  id v9 = -[TSDInteractiveCanvasController hitRep:](self, "hitRep:");
  objc_opt_class();
  uint64_t v10 = TSUDynamicCast();
  if (v10
    && ((uint64_t v11 = (void *)v10,
         objc_opt_class(),
         -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor"), uint64_t v12 = [(id)TSUDynamicCast() storage], v12 != objc_msgSend(v11, "storage"))&& (objc_msgSend(v11, "shouldBeginEditingWithGesture:", a3) & 1) != 0|| (__CFString *)objc_msgSend(a3, "gestureKind") == @"TSWPTapAndTouch"&& (objc_msgSend(v11, "convertNaturalPointFromUnscaledCanvas:", v6, v8), objc_msgSend(v11, "footnoteReferenceAttachmentAtPoint:"))))
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    if (![(TSWPInteractiveCanvasController *)self handleHyperlinksWithTextGRs]
      || ![(TSWPInteractiveCanvasController *)self shouldRespondToTextHyperlinks])
    {
      goto LABEL_11;
    }
    uint64_t v13 = (void *)TSUProtocolCast();
    uint64_t v14 = v13;
    if (!v13) {
      goto LABEL_14;
    }
    objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
    double v16 = v15;
    double v18 = v17;
    objc_opt_class();
    objc_msgSend(v14, "smartFieldAtPoint:", v16, v18);
    if (TSUDynamicCast()
      && ([(TSDInteractiveCanvasController *)self delegate], (objc_opt_respondsToSelector() & 1) != 0))
    {
      LOBYTE(v14) = [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasController:self allowsHyperlinkWithGesture:a3 forRep:v9];
    }
    else
    {
LABEL_11:
      LOBYTE(v14) = 0;
    }
  }
LABEL_14:
  objc_opt_class();
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  long long v19 = (void *)TSUDynamicCast();
  if (!v19)
  {
    long long v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPInteractiveCanvasController canHandleGesture:]"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 462, @"invalid nil value for '%s'", "cvc");
    if ((v14 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_18:
    LOBYTE(v22) = 1;
    return (char)v22;
  }
  if (v14) {
    goto LABEL_18;
  }
LABEL_19:
  if (objc_msgSend((id)objc_msgSend(v19, "hyperlinkGestureRecognizer"), "isEnabled"))
  {
LABEL_20:
    LOBYTE(v22) = 0;
    return (char)v22;
  }
  LODWORD(v22) = [(TSWPInteractiveCanvasController *)self handleHyperlinksWithTextGRs];
  if (v22)
  {
    LODWORD(v22) = [(TSWPInteractiveCanvasController *)self shouldRespondToTextHyperlinks];
    if (v22)
    {
      v22 = (void *)TSUProtocolCast();
      if (v22)
      {
        uint64_t v23 = v22;
        objc_msgSend(v22, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
        double v25 = v24;
        double v27 = v26;
        objc_opt_class();
        objc_msgSend(v23, "smartFieldAtPoint:", v25, v27);
        v22 = (void *)TSUDynamicCast();
        if (v22)
        {
          if ((__CFString *)[a3 gestureKind] != @"TSWPImmediateSingleTap")
          {
            if ((__CFString *)[a3 gestureKind] != @"TSWPLongPress") {
              goto LABEL_20;
            }
            LODWORD(v22) = [(TSDInteractiveCanvasController *)self inReadMode];
            if (!v22) {
              return (char)v22;
            }
          }
          goto LABEL_18;
        }
      }
    }
  }
  return (char)v22;
}

- (BOOL)handleGesture:(id)a3
{
  [a3 unscaledLocationForICC:self];
  double v6 = v5;
  double v8 = v7;
  id v9 = -[TSDInteractiveCanvasController hitRep:](self, "hitRep:");
  objc_opt_class();
  uint64_t v10 = (void *)TSUDynamicCast();
  id v32 = v10;
  objc_opt_class();
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  uint64_t v11 = (void *)TSUDynamicCast();
  if (!v11)
  {
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPInteractiveCanvasController handleGesture:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 495, @"invalid nil value for '%s'", "cvc");
  }
  [v11 cancelDelayedTapAction];
  if (![(TSWPInteractiveCanvasController *)self handleHyperlinksWithTextGRs]) {
    goto LABEL_11;
  }
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasController:self allowsHyperlinkWithGesture:a3 forRep:v9])
  {
    goto LABEL_11;
  }
  uint64_t v14 = (void *)TSUProtocolCast();
  if (!v14) {
    goto LABEL_11;
  }
  double v15 = v14;
  objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
  double v17 = v16;
  double v19 = v18;
  objc_opt_class();
  objc_msgSend(v15, "smartFieldAtPoint:", v17, v19);
  uint64_t v20 = TSUDynamicCast();
  if (!v20
    || (uint64_t v21 = v20, [a3 gestureState] != 3)
    || (uint64_t v22 = [v11 actionForHyperlink:v21 inRep:v15 gesture:a3]) == 0)
  {
LABEL_11:
    if (!v10) {
      goto LABEL_28;
    }
    objc_opt_class();
    [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
    double v24 = (void *)TSUDynamicCast();
    if (!v24 || (uint64_t v25 = [v24 storage], v25 == objc_msgSend(v10, "storage")))
    {
      objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
      uint64_t v23 = objc_msgSend(v10, "footnoteReferenceAttachmentAtPoint:");
      if (!v23)
      {
LABEL_18:
        if (v23) {
          return v23;
        }
        objc_opt_class();
        [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
        id v28 = (id)TSUDynamicCast();
        uint64_t v29 = [v28 storage];
        if (v29 != [v10 storage]
          && [v10 shouldBeginEditingWithGesture:a3])
        {
          int v30 = objc_msgSend((id)objc_msgSend(v28, "selection"), "isValid");
          id v28 = [(TSWPInteractiveCanvasController *)self p_beginEditingPossibleContainedRep:&v32];
          if (![v32 canEditWithEditor:v28]) {
            id v28 = 0;
          }
          [a3 setTargetRep:v32];
          if (v30 && (__CFString *)[a3 gestureKind] == @"TSWPImmediateSingleTap") {
            [v28 setIsBecomingActive:1];
          }
        }
        if (v28)
        {
          LOBYTE(v23) = [(TSDGestureDispatcher *)[(TSDInteractiveCanvasController *)self gestureDispatcher] handleGesture:a3 withTarget:v28];
          return v23;
        }
LABEL_28:
        LOBYTE(v23) = 0;
        return v23;
      }
      uint64_t v26 = v23;
      double v27 = [(TSDInteractiveCanvasController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        LOBYTE(v23) = [(TSDInteractiveCanvasControllerDelegate *)v27 interactiveCanvasController:self tappedOnFootnoteAttachment:v26];
        goto LABEL_18;
      }
    }
    LOBYTE(v23) = 0;
    goto LABEL_18;
  }
  [v11 startDelayedTapAction:v22];
  LOBYTE(v23) = 1;
  return v23;
}

- (void)gestureSequenceWillBegin
{
  objc_opt_class();
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  objc_super v3 = (void *)TSUDynamicCast();
  if (!v3)
  {
    int v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPInteractiveCanvasController gestureSequenceWillBegin]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 627, @"invalid nil value for '%s'", "cvc");
  }

  [v3 gestureSequenceWillBegin];
}

- (void)gestureSequenceDidEnd
{
  objc_opt_class();
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  objc_super v3 = (void *)TSUDynamicCast();
  if (!v3)
  {
    int v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPInteractiveCanvasController gestureSequenceDidEnd]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 635, @"invalid nil value for '%s'", "cvc");
  }

  [v3 gestureSequenceDidEnd];
}

- (void)didBeginEditingText
{
  objc_opt_class();
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  objc_super v3 = (void *)TSUDynamicCast();
  if ([v3 onlyAllowTextSwipesWhenEditing])
  {
    [v3 addSwipeGestureRecognizers];
  }
}

- (void)willEndEditingText
{
  objc_opt_class();
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  objc_super v3 = (void *)TSUDynamicCast();
  if ([v3 onlyAllowTextSwipesWhenEditing])
  {
    [v3 removeSwipeGestureRecognizers];
  }
}

- (BOOL)suppressDoubleTapForSelection
{
  return 0;
}

- (BOOL)textRepsShouldTileAggressively
{
  return 0;
}

- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_opt_class();
  double v8 = (void *)TSUDynamicCast();
  if (v8 && (id v9 = v8, (id)[v8 storage] == a4))
  {
    [a5 addObject:v9];
  }
  else
  {
    uint64_t v10 = (void *)TSUProtocolCast();
    if (v10)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = objc_msgSend(v10, "childReps", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            [(TSWPInteractiveCanvasController *)self p_recursivelyAddRep:*(void *)(*((void *)&v16 + 1) + 8 * i) forStorage:a4 toSet:a5];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

- (id)_repsForStorage:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(TSWPInteractiveCanvasController *)self p_repsForStorage:a3];

  return (id)[v3 setWithSet:v4];
}

- (id)p_repsForStorage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF9C0] set];
  double v6 = [(TSDInteractiveCanvasController *)self infosToDisplay];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TSWPInteractiveCanvasController *)self p_recursivelyAddRep:[(TSDInteractiveCanvasController *)self repForInfo:*(void *)(*((void *)&v12 + 1) + 8 * v10++)] forStorage:a3 toSet:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = [(TSWPInteractiveCanvasController *)self _repsForStorage:a4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v23;
  double v11 = INFINITY;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      [v13 frameInUnscaledCanvas];
      CGFloat v14 = v29.origin.x;
      CGFloat v15 = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      v28.double x = x;
      v28.double y = y;
      if (CGRectContainsPoint(v29, v28)) {
        return v13;
      }
      v30.origin.double x = v14;
      v30.origin.double y = v15;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double MidX = CGRectGetMidX(v30);
      v31.origin.double x = v14;
      v31.origin.double y = v15;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v31);
      double v20 = TSDDistance(x, y, MidX, MidY);
      if (v20 < v11)
      {
        double v11 = v20;
        uint64_t v9 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  return v9;
}

- (id)closestRepToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = [(TSDInteractiveCanvasController *)self topLevelRepsForHitTesting];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v23;
  double v10 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v5);
      }
      objc_opt_class();
      long long v12 = (void *)TSUDynamicCast();
      if (v12)
      {
        long long v13 = v12;
        [v12 frameInUnscaledCanvas];
        CGFloat v14 = v29.origin.x;
        CGFloat v15 = v29.origin.y;
        CGFloat width = v29.size.width;
        CGFloat height = v29.size.height;
        v28.double x = x;
        v28.double y = y;
        if (CGRectContainsPoint(v29, v28)) {
          return v13;
        }
        v30.origin.double x = v14;
        v30.origin.double y = v15;
        v30.size.CGFloat width = width;
        v30.size.CGFloat height = height;
        double MidX = CGRectGetMidX(v30);
        v31.origin.double x = v14;
        v31.origin.double y = v15;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v31);
        double v20 = TSDDistance(x, y, MidX, MidY);
        if (v20 < v10)
        {
          double v10 = v20;
          uint64_t v8 = v13;
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    long long v13 = v8;
  }
  while (v7);
  return v13;
}

- (BOOL)zoomColumnAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)hyperlinkPopoverIsShown
{
  return 0;
}

- (BOOL)cellCommentsAllowedForTableInfo:(id)a3
{
  return 1;
}

- (BOOL)showsComments
{
  return 0;
}

- (id)infosToHideForCanvas:(id)a3
{
  return 0;
}

- (BOOL)isTearingDown
{
  return self->_isTearingDown;
}

@end