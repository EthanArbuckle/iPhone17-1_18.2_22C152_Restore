@interface CRLiOSDocumentMode
+ (id)modeWithBoardViewController:(id)a3;
- (BOOL)allowGestureInRestrictedGestureMode:(id)a3;
- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3;
- (BOOL)allowsDragOnUnselectedReps;
- (BOOL)allowsEditMask;
- (BOOL)allowsHyperlinkEditing;
- (BOOL)allowsInstantAlpha;
- (BOOL)allowsSystemDragSession;
- (BOOL)cellHoverHighlightShouldBeDisplayed;
- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForEditorController:(id)a3;
- (BOOL)navigatorShouldBeReadOnly;
- (BOOL)shouldAllowTextGesturesInRestrictedGestureMode;
- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4;
- (BOOL)shouldRejectDragOperationForDragInfo:(id)a3;
- (BOOL)shouldRestoreModeAfterDocumentReplaced;
- (BOOL)shouldSelectAndScrollWithApplePencil;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)shouldSuppressKeyboard;
- (BOOL)showApplicationToolbarWhenEnteringMode;
- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3;
- (BOOL)wantsCanvasInRestrictedGestureMode;
- (BOOL)wantsDoneButtonInCompact;
- (BOOL)wantsLegacyEditMenu;
- (BOOL)wantsToEndForDragAndDropInteractions;
- (BOOL)wantsToEndForNonPopoverPresentations;
- (BOOL)wantsToPreventStandardPencilBehaviors;
- (BOOL)wantsToSuppressBottomToolbarInCompact;
- (BOOL)wantsToSuppressMediaReplacementKnobs;
- (BOOL)wantsToSuppressMiniFormatter;
- (BOOL)wantsToSuppressMultiselectionWithSingleBounds;
- (BOOL)wantsToSuppressSelectionKnobs;
- (BOOL)wantsToSuppressZoomInResponseToSelectionChange;
- (CRLiOSDocumentMode)initWithBoardViewController:(id)a3;
- (CRLiOSToolTrayProviding)toolTray;
- (NSArray)editorControllersToObserve;
- (NSUndoManager)undoManager;
- (_TtC8Freeform25CRLiOSBoardViewController)boardViewController;
- (id)allowedKeyCommandsFromKeyCommands:(id)a3;
- (id)contextMenuConfigurationForContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4 onInteractiveCanvasController:(id)a5;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4;
- (id)gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:(id)a3;
- (id)knobValidatorBlock;
- (id)validateSelectionPathIfNeededFromPersistableSelectionPath:(id)a3 withSelectionPathValidator:(id)a4;
- (unint64_t)hash;
- (unint64_t)pencilModeType;
- (void)performBlockIgnoringSelectionChangesToExitHandwritingMode:(id)a3;
- (void)willShowContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4;
@end

@implementation CRLiOSDocumentMode

+ (id)modeWithBoardViewController:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBoardViewController:v3];

  return v4;
}

- (CRLiOSDocumentMode)initWithBoardViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSDocumentMode;
  v5 = [(CRLiOSDocumentMode *)&v12 init];
  if (v5)
  {
    if ([(CRLiOSDocumentMode *)v5 isMemberOfClass:objc_opt_class()])
    {
      int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E4650);
      }
      v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108F76C(v6, v7);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E4670);
      }
      v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v8, v6);
      }
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentMode initWithBoardViewController:]");
      v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentMode.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:27 isFatal:0 description:"Should not be initializing an abstract instance of CRLiOSDocumentMode."];
    }
    objc_storeWeak((id *)&v5->_boardViewController, v4);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSDocumentMode;
  return [(CRLiOSDocumentMode *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDocumentMode;
  return [(CRLiOSDocumentMode *)&v3 hash];
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  return 0;
}

- (id)knobValidatorBlock
{
  return 0;
}

- (id)gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:(id)a3
{
  id v3 = a3;

  return v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  return 0;
}

- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  return 0;
}

- (id)allowedKeyCommandsFromKeyCommands:(id)a3
{
  id v3 = a3;

  return v3;
}

- (NSArray)editorControllersToObserve
{
  id v3 = [(CRLiOSDocumentMode *)self boardViewController];
  objc_super v4 = [v3 editorControllersToObserveForMode:self];

  return (NSArray *)v4;
}

- (BOOL)isValidForEditorController:(id)a3
{
  return 1;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CRLSelectAndScrollWithApplePencil"];

  return v3;
}

- (BOOL)wantsCanvasInRestrictedGestureMode
{
  return 0;
}

- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  return 0;
}

- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)contextMenuConfigurationForContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4 onInteractiveCanvasController:(id)a5
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return 0;
}

- (void)willShowContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4
{
  v5 = [(CRLiOSDocumentMode *)self boardViewController];
  int v6 = [v5 presentedViewController];

  if (v6)
  {
    id v7 = [(CRLiOSDocumentMode *)self boardViewController];
    [v7 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)performBlockIgnoringSelectionChangesToExitHandwritingMode:(id)a3
{
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 0;
}

- (BOOL)wantsToSuppressMediaReplacementKnobs
{
  return 0;
}

- (BOOL)wantsToSuppressMultiselectionWithSingleBounds
{
  return 0;
}

- (BOOL)wantsToSuppressMiniFormatter
{
  return 0;
}

- (BOOL)wantsToSuppressBottomToolbarInCompact
{
  return 0;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 0;
}

- (BOOL)wantsToEndForDragAndDropInteractions
{
  return 0;
}

- (id)validateSelectionPathIfNeededFromPersistableSelectionPath:(id)a3 withSelectionPathValidator:(id)a4
{
  return 0;
}

- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3
{
  return 1;
}

- (BOOL)wantsToSuppressZoomInResponseToSelectionChange
{
  return 0;
}

- (BOOL)wantsToPreventStandardPencilBehaviors
{
  return 0;
}

- (BOOL)allowsInstantAlpha
{
  return 1;
}

- (BOOL)allowsEditMask
{
  return 1;
}

- (BOOL)allowsHyperlinkEditing
{
  return 1;
}

- (BOOL)allowsDragOnUnselectedReps
{
  return 0;
}

- (BOOL)cellHoverHighlightShouldBeDisplayed
{
  return 0;
}

- (BOOL)shouldAllowTextGesturesInRestrictedGestureMode
{
  return 0;
}

- (BOOL)shouldSuppressKeyboard
{
  return 0;
}

- (unint64_t)pencilModeType
{
  return 0;
}

- (BOOL)navigatorShouldBeReadOnly
{
  return 0;
}

- (BOOL)shouldRejectDragOperationForDragInfo:(id)a3
{
  return 0;
}

- (BOOL)allowsSystemDragSession
{
  return 1;
}

- (BOOL)shouldRestoreModeAfterDocumentReplaced
{
  return 1;
}

- (BOOL)showApplicationToolbarWhenEnteringMode
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return 0;
}

- (CRLiOSToolTrayProviding)toolTray
{
  return 0;
}

- (BOOL)wantsDoneButtonInCompact
{
  return 0;
}

- (BOOL)wantsLegacyEditMenu
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (NSUndoManager)undoManager
{
  return 0;
}

- (_TtC8Freeform25CRLiOSBoardViewController)boardViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_boardViewController);

  return (_TtC8Freeform25CRLiOSBoardViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end