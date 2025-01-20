@interface CRLCanvasEditor
+ (BOOL)physicalKeyboardIsSender:(id)a3;
+ (Class)canvasEditorHelperClass;
+ (id)spatialInfoComparator;
- (BOOL)canCopyStyle;
- (BOOL)canGroupBoardItem:(id)a3;
- (BOOL)canGroupWithSender:(id)a3;
- (BOOL)canHandleInsertionOfBoardItems:(id)a3 insertionContext:(id)a4;
- (BOOL)canPasteWithPasteboard:(id)a3 sender:(id)a4;
- (BOOL)canPasteWithSender:(id)a3;
- (BOOL)canSelectAllWithSender:(id)a3;
- (BOOL)canUngroupWithSender:(id)a3;
- (BOOL)canvasEditorCanCopyWithSender:(id)a3;
- (BOOL)canvasEditorCanCutWithSender:(id)a3;
- (BOOL)canvasEditorCanDeleteWithSender:(id)a3;
- (BOOL)canvasEditorCanDeselectAllWithSender:(id)a3;
- (BOOL)canvasEditorCanGroupWithSender:(id)a3;
- (BOOL)canvasEditorCanOptionDragDuplicateWithSender:(id)a3;
- (BOOL)canvasEditorCanPasteWithSender:(id)a3;
- (BOOL)canvasEditorCanSelectAllWithSender:(id)a3;
- (BOOL)canvasEditorCanUngroupWithSender:(id)a3;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)handlesSpacebar;
- (BOOL)insertBoardItemsFromDragAndDrop:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5 insertionContext:(id)a6 alreadyPositionedInputInfos:(BOOL)a7;
- (BOOL)isLayoutSelectable:(id)a3;
- (BOOL)resignFirstResponderWhenKeyboardHides;
- (BOOL)shouldBecomeTextInputEditor;
- (BOOL)shouldBeginTextInputWith:(id)a3;
- (BOOL)shouldPreventQuickSelect;
- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5;
- (BOOL)shouldUseAlternateSelectionHighlight;
- (BOOL)wantsDoneButtonWhenEditing;
- (BOOL)wantsRawArrowKeyEvents;
- (BOOL)wantsToHighlightRep:(id)a3 forDragOperationWithDragInfo:(id)a4 atPoint:(CGPoint)a5 allowNonPlaceholderReplacement:(BOOL)a6;
- (BOOL)wantsToInterceptDeleteEvents;
- (BOOL)wantsToReceiveTextInput;
- (BOOL)wantsVisibleKeyboard;
- (CGPath)newDragAndDropHighlightPathWithInset:(double)a3;
- (CGRect)p_boundingRectForPastingBoardItems:(id)a3;
- (CGSize)sizeForInsertingMediaOfSize:(CGSize)a3;
- (CRLArrangeInspectorDelegate)arrangeInspectorDelegate;
- (CRLCanvasEditor)initWithInteractiveCanvasController:(id)a3;
- (CRLCanvasEditorHelper)canvasEditorHelper;
- (CRLCanvasSelection)canvasSelection;
- (CRLEditorController)editorController;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLPasteboardController)pasteboardController;
- (CRLTextInputReceiving)textInputReceiver;
- (CRLTextSelecting)textSelectionDelegate;
- (NSArray)infosToConnect;
- (NSArray)leadingBarButtonGroups;
- (NSArray)trailingBarButtonGroups;
- (NSSet)infosForSelectAllInRoot;
- (UIInputViewController)inputAccessoryViewController;
- (_TtC8Freeform21CRLConnectionLineItem)connectionLineItemToUseForConnecting;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (id)commandForInsertingBoardItems:(id)a3 below:(id)a4;
- (id)commandForInsertingBoardItems:(id)a3 below:(id)a4 withOffset:(unint64_t)a5;
- (id)createArrangeInspectorDelegate;
- (id)leadingBarButtonGroupsWithDefaultGroups:(id)a3;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)p_commandForPastingProvidedBoardItems:(id)a3 withPasteboard:(id)a4 sender:(id)a5 hasValidGeometries:(BOOL)a6 allowPositionChange:(BOOL)a7;
- (id)p_filterNonDisplayedInfos:(id)a3;
- (id)p_nextInfoInTabSequence:(int64_t)a3;
- (id)p_pasteNativeBoardItemsFromProviders:(id)a3 withPasteboard:(id)a4 selectionPath:(id)a5 sender:(id)a6 hasValidGeometries:(BOOL)a7 allowImageReplacement:(BOOL)a8;
- (id)p_selectableInfosInInfos:(id)a3;
- (id)p_spatiallySortedSelectableBoardItems;
- (id)pasteNativeInfosFromPasteboard:(id)a3 allowImageReplacement:(BOOL)a4;
- (id)permittedActionsForReasons:(unint64_t)a3;
- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (id)selectionBehaviorForInsertingBoardItems:(id)a3;
- (id)selectionPathForDraggingSelectionPath:(id)a3;
- (id)selectionPathWithInfo:(id)a3;
- (id)selectionPathWithInfos:(id)a3;
- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7;
- (id)trailingBarButtonGroupsWithDefaultGroups:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (void)actualSize:(id)a3;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addContextualMenuItemsToArray:(id)a3;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)alignDrawablesByBottomEdge:(id)a3;
- (void)alignDrawablesByHorizontalCenter:(id)a3;
- (void)alignDrawablesByLeftEdge:(id)a3;
- (void)alignDrawablesByRightEdge:(id)a3;
- (void)alignDrawablesByTopEdge:(id)a3;
- (void)alignDrawablesByVerticalCenter:(id)a3;
- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4;
- (void)beginEditingWith:(id)a3;
- (void)bringForward:(id)a3;
- (void)bringToFront:(id)a3;
- (void)canvasInfosDidChange;
- (void)connectWithConnectionLine:(id)a3;
- (void)copy:(id)a3;
- (void)copyBoardItems:(id)a3 toPasteboard:(id)a4 asPDF:(BOOL)a5 nativeOnly:(BOOL)a6;
- (void)copyForKeyboardMovementDuplicationToPasteboard:(id)a3;
- (void)copyToPasteboard:(id)a3 asPDF:(BOOL)a4 nativeOnly:(BOOL)a5 withSender:(id)a6;
- (void)copyToPasteboard:(id)a3 nativeOnly:(BOOL)a4 withSender:(id)a5;
- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)cut:(id)a3;
- (void)delete:(id)a3;
- (void)deselectAll:(id)a3;
- (void)distributeDrawablesEvenly:(id)a3;
- (void)distributeDrawablesHorizontally:(id)a3;
- (void)distributeDrawablesVertically:(id)a3;
- (void)duplicate:(id)a3;
- (void)endEditing;
- (void)enterQuickSelectMode:(id)a3;
- (void)group:(id)a3;
- (void)hideDragAndDropUI;
- (void)hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected;
- (void)insertBacktab:(id)a3;
- (void)insertBoardItems:(id)a3 withInsertionContext:(id)a4 postProcessBlock:(id)a5;
- (void)insertNewline:(id)a3;
- (void)insertTab:(id)a3;
- (void)insertText:(id)a3 replacementRange:(_NSRange)a4;
- (void)lock:(id)a3;
- (void)mask:(id)a3;
- (void)maskWithSelection:(id)a3;
- (void)maskWithShape:(id)a3;
- (void)maskWithShapeType:(id)a3;
- (void)p_insertBoardItems:(id)a3 withInsertionContext:(id)a4;
- (void)paste:(id)a3;
- (void)pasteAsPlainText:(id)a3;
- (void)pasteValues:(id)a3;
- (void)pasteWithPasteboard:(id)a3 selectionPath:(id)a4 forceMatchStyle:(BOOL)a5 sender:(id)a6;
- (void)pasteWithPasteboard:(id)a3 sender:(id)a4;
- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4;
- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a5;
- (void)presentAlignmentTools:(id)a3;
- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6;
- (void)repWasCreated:(id)a3;
- (void)scrollCanvasDown:(id)a3;
- (void)scrollCanvasLeft:(id)a3;
- (void)scrollCanvasPageDown:(id)a3;
- (void)scrollCanvasPageUp:(id)a3;
- (void)scrollCanvasRight:(id)a3;
- (void)scrollCanvasUp:(id)a3;
- (void)scrollToBeginningOfDocument:(id)a3;
- (void)scrollToEndOfDocument:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectParent:(id)a3;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
- (void)sendBackward:(id)a3;
- (void)sendToBack:(id)a3;
- (void)setEditorController:(id)a3;
- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3;
- (void)tabKeyPressed;
- (void)teardown;
- (void)ungroup:(id)a3;
- (void)unlock:(id)a3;
- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4;
- (void)zoomIn:(id)a3;
- (void)zoomOut:(id)a3;
- (void)zoomToFitAllContent:(id)a3;
- (void)zoomToSelection:(id)a3;
@end

@implementation CRLCanvasEditor

- (BOOL)wantsDoneButtonWhenEditing
{
  return 0;
}

- (BOOL)shouldBeginTextInputWith:(id)a3
{
  v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  v4 = [v3 shapeInfoToBeginEditing];
  BOOL v5 = v4 != 0;

  return v5;
}

- (CRLTextSelecting)textSelectionDelegate
{
  return 0;
}

- (CRLTextInputReceiving)textInputReceiver
{
  return 0;
}

- (BOOL)wantsToReceiveTextInput
{
  return 0;
}

- (BOOL)wantsVisibleKeyboard
{
  return 0;
}

- (BOOL)wantsToInterceptDeleteEvents
{
  return 0;
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 1;
}

- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v7 arrowKeyReceivedInDirection:a3 withModifierKeys:v6];
}

- (void)tabKeyPressed
{
  if ((id)[(CRLCanvasEditor *)self canPerformEditorAction:"insertTab:" withSender:0] == (id)1)
  {
    [(CRLCanvasEditor *)self insertTab:0];
  }
  else
  {
    [(CRLCanvasEditor *)self beginEditingWith:@"\t"];
  }
}

- (void)beginEditingWith:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 beginEditingOnKeyInputWithString:v4];
}

- (void)endEditing
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D0D40);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLCanvasEditor endEditing]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m";
    __int16 v24 = 1024;
    int v25 = 151;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D0D60);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor endEditing]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 151, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLCanvasEditor endEditing]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)setEditorController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
    id v6 = [v5 editorController];

    if (v6 != v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0D80);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101070478();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0DA0);
      }
      id v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor setEditorController:]");
      v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:155 isFatal:0 description:"Unexpected editor controller!"];
    }
  }
}

- (void)delete:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 delete:v4];
}

- (void)cut:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 cut:v4];
}

- (void)lock:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 lock:v4];
}

- (void)unlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 unlock:v4];
}

- (void)deselectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 deselectAll:v4];
}

- (BOOL)isLayoutSelectable:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  unsigned __int8 v6 = [v5 isLayoutSelectable:v4];

  return v6;
}

- (void)duplicate:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 duplicate:v4];
}

- (void)addContextualMenuItemsToArray:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 addContextualMenuItemsToArray:v4];
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v8 addContextualMenuElementsToArray:v7 atPoint:CGPointMake(x, y)];
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  -[CRLCanvasEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    uint64_t v24 = *(void *)v32;
    do
    {
      v12 = 0;
      id v25 = v10;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v12);
        v14 = [v13 crlaxValueForKey:@"children"];
        if ([v14 count])
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (!v16) {
            goto LABEL_22;
          }
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
          while (1)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              __int16 v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              v21 = [v20 title];
              if ([v21 length])
              {
                id v22 = [v20 state];

                if (v22 != (id)1) {
                  continue;
                }
                v21 = [v20 title];
                [v7 addObject:v21];
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (!v17)
            {
              uint64_t v11 = v24;
              id v10 = v25;
              goto LABEL_22;
            }
          }
        }
        id v15 = [v13 title];
        if ([v15 length])
        {
          id v23 = [v13 state];

          if (v23 != (id)1) {
            goto LABEL_23;
          }
          id v15 = [v13 title];
          [v7 addObject:v15];
        }
LABEL_22:

LABEL_23:
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }
}

- (BOOL)shouldPreventQuickSelect
{
  unsigned int v2 = [(CRLCanvasEditor *)self editingCoordinator];
  v3 = [v2 followCoordinator];
  unsigned __int8 v4 = [v3 isFollowing];

  return v4;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v8 addMiniFormatterElementsToArray:v7 atPoint:x, y];
}

- (void)maskWithSelection:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = [(CRLCanvasEditor *)self canvasEditorHelper];
  unsigned int v5 = [v4 canPerformMaskWithShapeWithSender:v6];

  if (v5) {
    [(CRLCanvasEditor *)self maskWithShape:v6];
  }
  else {
    [(CRLCanvasEditor *)self mask:v6];
  }
}

- (void)mask:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 mask];
}

- (void)maskWithShape:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 maskWithShape];
}

- (void)maskWithShapeType:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    unsigned int v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
    [v5 maskWithShapeType:[v4 tag]];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0DC0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070500();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0DE0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor maskWithShapeType:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 285, 0, "Callers to -[CRLCanvasEditor maskWithShape:] must have a -[tag] method to specify the shape type to use for the image mask.");
  }
}

- (void)enterQuickSelectMode:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 enterQuickSelectMode:v4];
}

- (void)presentAlignmentTools:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 presentAlignmentTools:v4];
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v9 = [v8 dragOperationForDragInfo:v7 atUnscaledPoint:x, y];

  return (unint64_t)v9;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  id v10 = [(CRLCanvasEditor *)self canvasEditorHelper];
  LOBYTE(a3) = [v10 handleDragOperation:a3 withDragInfo:v9 atUnscaledPoint:x, y];

  return a3;
}

- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v9 = [v8 repToHighlightForDragInfo:v7 atUnscaledPoint:x, y];

  return v9;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v8 updateDragAndDropUIForPoint:v7 dragInfo:x, y];
}

- (void)hideDragAndDropUI
{
  id v2 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v2 hideDragAndDropUI];
}

- (BOOL)wantsToHighlightRep:(id)a3 forDragOperationWithDragInfo:(id)a4 atPoint:(CGPoint)a5 allowNonPlaceholderReplacement:(BOOL)a6
{
  uint64_t v6 = a6;
  double y = a5.y;
  double x = a5.x;
  id v11 = a4;
  id v12 = a3;
  v13 = [(CRLCanvasEditor *)self canvasEditorHelper];
  LOBYTE(v6) = [v13 wantsToHighlightRep:v12 forDragOperationWithDragInfo:v11 atPoint:v6 allowNonPlaceholderReplacement:x, y];

  return v6;
}

- (BOOL)insertBoardItemsFromDragAndDrop:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5 insertionContext:(id)a6 alreadyPositionedInputInfos:(BOOL)a7
{
  uint64_t v7 = a7;
  double y = a4.y;
  double x = a4.x;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(CRLCanvasEditor *)self canvasEditorHelper];
  LOBYTE(v7) = [v16 insertBoardItemsFromDragAndDrop:v15 atPoint:v14 onRep:v13 insertionContext:v7 atPoint:x onRep:y];

  return v7;
}

- (CGPath)newDragAndDropHighlightPathWithInset:(double)a3
{
  id v4 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v4 visibleBoundsRect];
  CGRect v8 = CGRectInset(v7, a3, a3);
  id v5 = CGPathCreateWithRect(v8, 0);

  return v5;
}

- (void)alignDrawablesByLeftEdge:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 alignDrawablesByEdge:0];
}

- (void)alignDrawablesByRightEdge:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 alignDrawablesByEdge:2];
}

- (void)alignDrawablesByVerticalCenter:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 alignDrawablesByEdge:1];
}

- (void)alignDrawablesByTopEdge:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 alignDrawablesByEdge:3];
}

- (void)alignDrawablesByBottomEdge:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 alignDrawablesByEdge:5];
}

- (void)alignDrawablesByHorizontalCenter:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 alignDrawablesByEdge:4];
}

- (void)distributeDrawablesHorizontally:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 distributeDrawablesByEdge:1];
}

- (void)distributeDrawablesVertically:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 distributeDrawablesByEdge:4];
}

- (void)distributeDrawablesEvenly:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v3 distributeDrawablesEvenly];
}

- (void)bringToFront:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 bringToFront:v4];
}

- (void)bringForward:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 bringForward:v4];
}

- (void)sendBackward:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 sendBackward:v4];
}

- (void)sendToBack:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 sendToBack:v4];
}

- (void)selectParent:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 selectParent:v4];
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v11 presentMediaCompatibilityAlertWithReasons:a3 forMediaType:a4 forSingleMediaObject:v6 completionHandler:v10];
}

+ (Class)canvasEditorHelperClass
{
  return (Class)objc_opt_class();
}

- (CRLCanvasEditor)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasEditor;
  id v5 = [(CRLCanvasEditor *)&v10 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mInteractiveCanvasController, v4);
    CGRect v7 = (CRLCanvasEditorHelper *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "canvasEditorHelperClass")), "initWithCanvasEditor:", v6);
    mCanvasEditorHelper = v6->mCanvasEditorHelper;
    v6->mCanvasEditorHelper = v7;

    v6->mResignFirstResponderWhenKeyboardHides = 1;
  }

  return v6;
}

- (void)teardown
{
  id v3 = [(CRLCanvasEditor *)self pasteboardController];
  [v3 fulfillPasteboardPromises];

  [(CRLCanvasEditorHelper *)self->mCanvasEditorHelper teardown];

  objc_storeWeak((id *)&self->mInteractiveCanvasController, 0);
}

- (CRLEditorController)editorController
{
  id v2 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v3 = [v2 editorController];

  return (CRLEditorController *)v3;
}

- (CRLCanvasEditorHelper)canvasEditorHelper
{
  return self->mCanvasEditorHelper;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mInteractiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  id v2 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v3 = [v2 editingCoordinator];

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (CRLCanvasSelection)canvasSelection
{
  id v3 = [(CRLCanvasEditor *)self editorController];
  id v4 = [v3 currentEditors];
  unsigned int v5 = [v4 containsObject:self];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    CGRect v7 = [(CRLCanvasEditor *)self editorController];
    CGRect v8 = [v7 selectionForEditor:self];
    id v9 = sub_1002469D0(v6, v8);
  }
  else
  {
    id v9 = 0;
  }

  return (CRLCanvasSelection *)v9;
}

- (id)selectionPathWithInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  uint64_t v6 = [v5 selectionPathWithInfo:v4];

  return v6;
}

- (id)selectionPathWithInfos:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  uint64_t v6 = [v5 selectionPathWithInfos:v4];

  return v6;
}

- (id)selectionPathForDraggingSelectionPath:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)canvasInfosDidChange
{
  id v3 = [(CRLCanvasEditor *)self editorController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008B7CC;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  [v3 performBlockAfterSettingSelection:v4];
}

- (void)repWasCreated:(id)a3
{
  id v3 = a3;
  if ([v3 isSelectedIgnoringLocking]) {
    [v3 becameSelected];
  }
}

- (id)p_filterNonDisplayedInfos:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = objc_alloc((Class)NSSet);
  id WeakRetained = objc_loadWeakRetained((id *)&self->mInteractiveCanvasController);
  CGRect v8 = [WeakRetained infosToDisplay];
  id v9 = [v6 initWithArray:v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v11)
  {

LABEL_14:
    unsigned int v19 = v10;
    goto LABEL_15;
  }
  id v12 = v11;
  char v13 = 0;
  uint64_t v14 = *(void *)v23;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      id v17 = sub_10006B444(v16);
      unsigned int v18 = [v9 containsObject:v17];

      if (v18) {
        [v5 addObject:v16];
      }
      else {
        char v13 = 1;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v12);

  unsigned int v19 = v5;
  if ((v13 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  id v20 = v19;

  return v20;
}

- (BOOL)shouldUseAlternateSelectionHighlight
{
  return 0;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v12 = [v11 nextEditorForSelection:v10 withNewEditorStack:v9 selectionPath:v8];

  return v12;
}

- (BOOL)shouldBecomeTextInputEditor
{
  return 1;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0E00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070588();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0E20);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:582 isFatal:0 description:"Canvas editor expects canvas selection!"];
  }
  return 0;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v5 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0E40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070610();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0E60);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor selectionDidChangeFromSelection:toSelection:withFlags:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:589 isFatal:0 description:"Canvas editor expects canvas selection!"];
  }
}

- (void)hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected
{
  id v10 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v2 = [v10 layerHost];
  id v3 = [v2 asiOSCVC];

  id v4 = [v3 delegate];
  id v5 = [v4 currentDocumentMode];

  uint64_t v6 = objc_opt_class();
  id v7 = sub_1002469D0(v6, v5);
  id v8 = [v10 freehandDrawingToolkit];
  unsigned int v9 = [v8 isLassoSelectionForMixedTypeEnabledInDrawingMode];

  if (v9) {
    [v7 hideEditMenuForLassoSelection];
  }
}

- (CRLPasteboardController)pasteboardController
{
  pasteboardController = self->_pasteboardController;
  if (!pasteboardController)
  {
    id v4 = [CRLPasteboardController alloc];
    id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
    uint64_t v6 = [v5 editingCoordinator];
    id v7 = [(CRLPasteboardController *)v4 initWithDelegate:v6];
    id v8 = self->_pasteboardController;
    self->_pasteboardController = v7;

    pasteboardController = self->_pasteboardController;
  }

  return pasteboardController;
}

- (id)permittedActionsForReasons:(unint64_t)a3
{
  id v4 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v5 = [v4 permittedActionsForReasons:a3];

  uint64_t v6 = +[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "copy:", 0);
  id v7 = [v5 setByAddingObjectsFromSet:v6];

  return v7;
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  id v4 = a3;
  LOBYTE(a1) = objc_msgSend(objc_msgSend(a1, "canvasEditorHelperClass"), "physicalKeyboardIsSender:", v4);

  return (char)a1;
}

- (BOOL)canHandleInsertionOfBoardItems:(id)a3 insertionContext:(id)a4
{
  return 1;
}

- (BOOL)canPasteWithPasteboard:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLCanvasEditor *)self pasteboardController];
  unsigned int v9 = [v8 ingestibleItemSourceForPasteboard:v7];

  id v10 = [(CRLCanvasEditor *)self canvasEditorHelper];
  LOBYTE(self) = [v10 canPasteWithItemSource:v9 sender:v6];

  return (char)self;
}

- (void)pasteWithPasteboard:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CRLCanvasEditor *)self editorController];
  id v8 = [v9 selectionPath];
  [(CRLCanvasEditor *)self pasteWithPasteboard:v7 selectionPath:v8 forceMatchStyle:0 sender:v6];
}

- (BOOL)canCopyStyle
{
  return 0;
}

- (BOOL)canvasEditorCanDeleteWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v5 = [v4 selectionModelTranslator];
  id v6 = [(CRLCanvasEditor *)self editorController];
  id v7 = [v6 selectionPath];
  id v8 = [v5 unlockedBoardItemsForSelectionPath:v7];

  LOBYTE(v6) = [v8 count] != 0;
  return (char)v6;
}

- (BOOL)canvasEditorCanCopyWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v5 = [v4 selectionModelTranslator];
  id v6 = [(CRLCanvasEditor *)self editorController];
  id v7 = [v6 selectionPath];
  id v8 = [v5 boardItemsForSelectionPath:v7];

  if ([v8 count])
  {
    id v9 = +[NSMutableSet set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v15, "shouldBeIgnoredWhenCopying", (void)v18) & 1) == 0) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    BOOL v16 = [v9 count] != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)canvasEditorCanCutWithSender:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasEditor *)self canvasEditorCanDeleteWithSender:v4]) {
    BOOL v5 = [(CRLCanvasEditor *)self canvasEditorCanCopyWithSender:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canPasteWithSender:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  unsigned __int8 v6 = [v5 canPasteWithItemSource:0 sender:v4];

  return v6;
}

- (BOOL)canvasEditorCanPasteWithSender:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  unsigned __int8 v6 = [v5 canPasteWithItemSource:0 sender:v4];

  return v6;
}

- (BOOL)canvasEditorCanOptionDragDuplicateWithSender:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 freehandDrawingToolkit];
  unsigned __int8 v7 = [v6 isInDrawingMode];

  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(CRLCanvasEditor *)self canvasEditorCanCopyWithSender:v4];
  }

  return v8;
}

- (BOOL)canSelectAllWithSender:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 freehandDrawingToolkit];
  unsigned __int8 v7 = [v6 isLassoSelectionForMixedTypeEnabledInDrawingMode];

  BOOL v8 = [v5 freehandDrawingToolkit];
  unsigned int v9 = [v8 isInDrawingMode];

  if (!v9 || (v7 & 1) != 0)
  {
    long long v18 = [v5 selectionModelTranslator];
    long long v19 = [(CRLCanvasEditor *)self editorController];
    long long v20 = [v19 selectionPath];
    id v15 = [v18 boardItemsForSelectionPath:v20];

    long long v32 = 0u;
    long long v33 = 0u;
    BOOL v17 = [v15 count] == 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v21 = [(CRLCanvasEditor *)self infosForSelectAllInRoot];
    uint64_t v14 = (uint64_t)[v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      long long v30 = v15;
      id v31 = v4;
      uint64_t v22 = *(void *)v33;
      long long v23 = &selRef_invalidateSizedImageIfNeededForBakedMaskPathFromBlock_;
      while (2)
      {
        uint64_t v24 = 0;
        long long v25 = v23;
        do
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v21);
          }
          __int16 v26 = *(void **)(*((void *)&v32 + 1) + 8 * v24);
          if (objc_opt_respondsToSelector() & 1) != 0 && ([v26 isSelectable])
          {
            uint64_t v14 = 1;
            goto LABEL_15;
          }
          ++v24;
        }
        while (v14 != v24);
        uint64_t v14 = (uint64_t)[v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
        long long v23 = v25;
        if (v14) {
          continue;
        }
        break;
      }
LABEL_15:
      id v15 = v30;
      id v4 = v31;
    }
  }
  else
  {
    id v10 = [v5 layoutController];
    id v11 = [v10 rootLayout];
    id v12 = [v11 children];
    uint64_t v13 = +[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:v12];
    uint64_t v14 = [v13 count] != 0;

    id v15 = [v5 editorController];
    BOOL v16 = [v15 mostSpecificCurrentEditorOfClass:objc_opt_class()];
    BOOL v17 = v16 == 0;
  }
  long long v27 = [(CRLCanvasEditor *)self canvasEditorHelper];
  unsigned __int8 v28 = [v27 allowSelectAllForSender:v4 hasNothingVisiblySelected:v17 hasAtLeastOneThingToSelect:v14];

  return v28;
}

- (BOOL)canvasEditorCanSelectAllWithSender:(id)a3
{
  return [(CRLCanvasEditor *)self canSelectAllWithSender:a3];
}

- (BOOL)canvasEditorCanDeselectAllWithSender:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 selectionModelTranslator];
  unsigned __int8 v7 = [(CRLCanvasEditor *)self editorController];
  BOOL v8 = [v7 selectionPath];
  unsigned int v9 = [v6 boardItemsForSelectionPath:v8];

  if ([v9 count]) {
    unsigned __int8 v10 = 1;
  }
  else {
    unsigned __int8 v10 = [(id)objc_opt_class() physicalKeyboardIsSender:v4];
  }

  return v10;
}

- (BOOL)canGroupWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditor *)self interactiveCanvasController];
  uint64_t v5 = [v4 selectionModelTranslator];
  unsigned __int8 v6 = [(CRLCanvasEditor *)self editorController];
  unsigned __int8 v7 = [v6 selectionPath];
  BOOL v8 = [(id)v5 boardItemsForSelectionPath:v7];

  unsigned int v9 = [(CRLCanvasEditor *)self interactiveCanvasController];
  LOBYTE(v5) = [v9 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    unint64_t v10 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      unint64_t v10 = 0;
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          if (-[CRLCanvasEditor canGroupBoardItem:](self, "canGroupBoardItem:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
          {
            if (v10)
            {
              unint64_t v10 = 2;
              goto LABEL_16;
            }
            unint64_t v10 = 1;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
LABEL_16:
  }
  return v10 > 1;
}

- (BOOL)canvasEditorCanGroupWithSender:(id)a3
{
  return [(CRLCanvasEditor *)self canGroupWithSender:a3];
}

- (BOOL)canUngroupWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditor *)self editorController];
  uint64_t v5 = [v4 selectionPath];
  unsigned __int8 v6 = [v5 mostSpecificSelectionOfClass:objc_opt_class()];

  unsigned __int8 v7 = [(CRLCanvasEditor *)self canvasEditorHelper];
  LOBYTE(v4) = [v7 canUngroupWithSelection:v6];

  return (char)v4;
}

- (BOOL)canvasEditorCanUngroupWithSender:(id)a3
{
  return [(CRLCanvasEditor *)self canUngroupWithSender:a3];
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v21[0] = "deleteBackward:";
  v21[1] = "deleteForward:";
  v21[2] = "deleteToBeginningOfLine:";
  v21[3] = "deleteToEndOfLine:";
  v21[4] = "deleteWordBackward:";
  v21[5] = "deleteWordForward:";
  v21[6] = "insertTab:";
  v21[7] = "insertBacktab:";
  v21[8] = "scrollToBeginningOfDocument:";
  v21[9] = "scrollToEndOfDocument:";
  unsigned __int8 v7 = [(CRLCanvasEditor *)self canvasEditorHelper];
  int64_t v8 = (int64_t)[v7 canPerformEditorAction:a3 withSender:v6];

  if (!v8)
  {
    uint64_t v9 = 0;
    int64_t v8 = 1;
    while (!sel_isEqual(a3, (SEL)v21[v9]))
    {
      if (++v9 == 10)
      {
        int64_t v8 = 0;
        break;
      }
    }
    unint64_t v10 = [(CRLCanvasEditor *)self interactiveCanvasController];
    id v11 = v10;
    if ("select:" == a3)
    {
      int64_t v8 = -1;
    }
    else if ("zoomToFitAllContent:" == a3)
    {
      BOOL v16 = [v10 board];
      long long v17 = [v16 rootContainer];
      long long v18 = [v17 childItems];
      if ([v18 count]) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = -1;
      }
    }
    else if ("zoomToSelection:" == a3)
    {
      if ([v10 canZoomToCurrentSelection]) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = -1;
      }
    }
    else if ("actualSize:" == a3)
    {
      [v10 viewScale];
      if (v19 == 1.0) {
        int64_t v8 = -1;
      }
      else {
        int64_t v8 = 1;
      }
    }
    else if ("saveSelectedBoardItemsAsStencil:" == a3)
    {
      id v12 = [v10 selectionModelTranslator];
      id v13 = [(CRLCanvasEditor *)self editorController];
      uint64_t v14 = [v13 selectionPath];
      id v15 = [v12 boardItemsForSelectionPath:v14];
      if ([v15 count]) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = -1;
      }
    }
  }

  return v8;
}

- (void)copyToPasteboard:(id)a3 asPDF:(BOOL)a4 nativeOnly:(BOOL)a5 withSender:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v15 = a3;
  if ([(CRLCanvasEditor *)self canvasEditorCanCopyWithSender:0])
  {
    uint64_t v9 = [(CRLCanvasEditor *)self interactiveCanvasController];
    unint64_t v10 = [v9 selectionModelTranslator];
    id v11 = [(CRLCanvasEditor *)self interactiveCanvasController];
    id v12 = [v11 editorController];
    id v13 = [v12 selectionPath];
    uint64_t v14 = [v10 unlockedBoardItemsForSelectionPath:v13];

    [(CRLCanvasEditor *)self copyBoardItems:v14 toPasteboard:v15 asPDF:v7 nativeOnly:v6];
  }
}

- (void)copyBoardItems:(id)a3 toPasteboard:(id)a4 asPDF:(BOOL)a5 nativeOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v12 = +[NSMutableSet set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v18, "shouldBeIgnoredWhenCopying", (void)v24) & 1) == 0) {
          [v12 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  id v19 = v12;
  long long v20 = [v11 topLevelZOrderedSiblingsOfInfos:v19];
  long long v21 = [v20 crl_arrayWithObjectsInSet:v19];

  if (v21 && [v21 count])
  {
    uint64_t v22 = [(CRLCanvasEditor *)self pasteboardController];
    id v23 = [v22 newCopyAssistantWithPasteboard:v10];
    [v22 copyBoardItems:v21 toPasteboard:v10 asPDF:0 writeAssistant:v23 nativeOnly:v6 icc:v11];
  }
}

- (void)copyToPasteboard:(id)a3 nativeOnly:(BOOL)a4 withSender:(id)a5
{
}

- (void)copy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CRLPasteboard generalPasteboard];
  [(CRLCanvasEditor *)self copyToPasteboard:v5 nativeOnly:0 withSender:v4];

  id v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  BOOL v6 = [v7 canvasEditor];
  [v6 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
}

- (void)copyForKeyboardMovementDuplicationToPasteboard:(id)a3
{
}

- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4
{
}

- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a5
{
  BOOL v52 = a5;
  id v7 = a3;
  id v53 = a4;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v62;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v19 = sub_100246DEC(v12, v13, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL___CRLFittingOnInsertion);
        if (v19)
        {
          long long v20 = [(CRLCanvasEditor *)self interactiveCanvasController];
          long long v21 = [v20 board];
          [v19 scaleDownSizeToFitWithinSize:v21 board:600.0, 600.0];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v9);
  }
  uint64_t v22 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v22 visibleUnscaledRect];
  double v27 = sub_100065738(v23, v24, v25, v26);
  double v29 = v28;

  long long v30 = v53;
  if ([v53 hasPreferredCenter])
  {
    [v53 preferredCenter];
    double v27 = v31;
    double v29 = v32;
  }
  long long v33 = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:]([CRLBoardItemPositioner alloc], "initWithCanvasEditor:targetCenter:validGeometries:", self, 0, v27, v29);
  [(CRLBoardItemPositioner *)v33 positionBoardItems:v7 ignoreCanvasBackgroundAlignmentProvidedSnapping:v52];
  uint64_t v34 = objc_opt_class();
  long long v35 = [(CRLCanvasEditor *)self interactiveCanvasController];
  v36 = [v35 topLevelContainerInfoForEditing];
  v37 = sub_1002469D0(v34, v36);

  if (v37)
  {
    v38 = [(CRLCanvasEditor *)self canvasEditorHelper];
    unsigned int v39 = [v38 canInsertBoardItems:v7 intoGroup:v37];

    if (v39)
    {
      memset(&v60, 0, sizeof(v60));
      v40 = [(CRLCanvasEditor *)self interactiveCanvasController];
      v41 = [v40 topLevelContainerRepForEditing];
      v42 = [v41 layout];
      v43 = v42;
      if (v42) {
        [v42 transformInRoot];
      }
      else {
        memset(&v60, 0, sizeof(v60));
      }

      CGAffineTransform v58 = v60;
      CGAffineTransformInvert(&v59, &v58);
      CGAffineTransform v60 = v59;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v44 = v7;
      id v45 = [v44 countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v55;
        do
        {
          for (j = 0; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v55 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
            v50 = [v49 geometry];
            CGAffineTransform v59 = v60;
            v51 = [v50 geometryByAppendingTransform:&v59];
            [v49 setGeometry:v51];
          }
          id v46 = [v44 countByEnumeratingWithState:&v54 objects:v65 count:16];
        }
        while (v46);
      }

      long long v30 = v53;
    }
  }
}

- (CGSize)sizeForInsertingMediaOfSize:(CGSize)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)selectionBehaviorForInsertingBoardItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CRLCanvasCommandSelectionBehavior alloc];
  BOOL v6 = +[NSSet setWithArray:v4];

  id v7 = [(CRLCanvasCommandSelectionBehavior *)v5 initWithCanvasEditor:self type:0 constructedInfos:v6];

  return v7;
}

- (void)insertBoardItems:(id)a3 withInsertionContext:(id)a4 postProcessBlock:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  uint64_t v10 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v11 = [v10 commandController];
  if ([v8 shouldEndEditing]) {
    [v10 endEditing];
  }
  if ([v8 shouldEndEditing])
  {
    id v12 = [(CRLCanvasEditor *)self selectionBehaviorForInsertingBoardItems:v15];
  }
  else
  {
    id v12 = 0;
  }
  [v11 openGroupWithSelectionBehavior:v12];
  uint64_t v13 = +[NSBundle mainBundle];
  uint64_t v14 = [v13 localizedStringForKey:@"Insert" value:0 table:@"UndoStrings"];
  [v11 setCurrentGroupActionString:v14];

  [(CRLCanvasEditor *)self p_insertBoardItems:v15 withInsertionContext:v8];
  if (v9) {
    v9[2](v9);
  }
  [v11 closeGroup];
  sub_1005046A8(self, v15);
}

- (void)p_insertBoardItems:(id)a3 withInsertionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v9 = [v8 commandController];
  if (([v9 isGroupOpen] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0E80);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070698();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0EA0);
    }
    uint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor p_insertBoardItems:withInsertionContext:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:1069 isFatal:0 description:"Expected a command group to be open."];
  }
  uint64_t v13 = [(CRLCanvasEditor *)self interactiveCanvasController];
  uint64_t v14 = [v13 board];
  id v15 = [v14 rootContainer];

  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [v8 topLevelContainerInfoForEditing];
  uint64_t v18 = sub_1002469D0(v16, v17);

  long long v30 = v18;
  double v31 = v8;
  if (v18)
  {
    id v19 = [(CRLCanvasEditor *)self canvasEditorHelper];
    unsigned int v20 = [v19 canInsertBoardItems:v6 intoGroup:v18];

    if (v20)
    {
      id v21 = v18;

      id v15 = v21;
    }
  }
  id v22 = v7;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v6;
  id v24 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
  double v32 = v22;
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      double v27 = 0;
      double v28 = v22;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v23);
        }
        double v29 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v15 boardItem:*(void *)(*((void *)&v33 + 1) + 8 * (void)v27)];
        [v9 enqueueCommand:v29];
        id v22 = [v28 insertionContextFromInsertionContextWithNextZOrder];

        double v27 = (char *)v27 + 1;
        double v28 = v22;
      }
      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v25);
  }
}

- (void)pasteWithPasteboard:(id)a3 selectionPath:(id)a4 forceMatchStyle:(BOOL)a5 sender:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(CRLCanvasEditor *)self pasteboardController];
  v48[0] = 0;
  if ([v13 hasNativeTypesOnPasteboard:v10])
  {
    uint64_t v14 = [v13 providersForNativeBoardItemsAndTextFromPasteboard:v10 validGeometries:v48];
    id v15 = v14;
    if (v14 && [v14 count]) {
      id v16 = [(CRLCanvasEditor *)self p_pasteNativeBoardItemsFromProviders:v15 withPasteboard:v10 selectionPath:v11 sender:v12 hasValidGeometries:v48[0] allowImageReplacement:1];
    }
    uint64_t v17 = 0;
  }
  else
  {
    switch((unint64_t)[v13 preferredImportableDataTypeOnPasteboard:v10 detectImportableURLsInText:!v7])
    {
      case 1uLL:
        uint64_t v18 = [v13 providersForBoardItemsFromImportedRichTextFromPasteboard:v10];
        goto LABEL_20;
      case 2uLL:
        goto LABEL_18;
      case 3uLL:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0EC0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101070720();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0EE0);
        }
        id v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v19);
        }
        unsigned int v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor pasteWithPasteboard:selectionPath:forceMatchStyle:sender:]");
        id v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
        +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:1106 isFatal:0 description:"Should not be given file promises in normal paste logic! App being copied from is misbehaving."];

LABEL_18:
        uint64_t v18 = [v13 providersForBoardItemsImportedFromPasteboard:v10];
        goto LABEL_20;
      case 4uLL:
        uint64_t v18 = [v13 providersForBoardItemsFromImportedTextFromPasteboard:v10];
LABEL_20:
        uint64_t v17 = v18;
        if (v18 && [v18 count])
        {
          id v22 = [[CRLPasteboardMultipleImportableBoardItemProvider alloc] initWithImportableBoardItemProviders:v17];
          [(CRLPasteboardMultipleImportableBoardItemProvider *)v22 setAlertPresenter:self];
          id v23 = [(CRLCanvasEditor *)self interactiveCanvasController];
          id v24 = [v23 editingCoordinator];
          [v24 suspendCollaborationWithReason:@"CRLCanvasEditorPastingImportableBoardItems"];

          id v25 = [(CRLCanvasEditor *)self interactiveCanvasController];
          uint64_t v26 = +[NSBundle mainBundle];
          [v26 localizedStringForKey:@"Pasting…" value:0 table:0];
          long long v36 = v38 = v11;

          v37 = v12;
          double v27 = v25;
          double v28 = [v25 layerHost];
          double v29 = [(CRLPasteboardMultipleImportableBoardItemProvider *)v22 progress];
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_10008E2AC;
          v46[3] = &unk_1014CBBB0;
          long long v30 = v22;
          uint64_t v47 = v30;
          double v31 = [v28 beginModalOperationWithPresentedLocalizedMessage:v36 progress:v29 cancelHandler:v46];

          double v32 = v27;
          id v12 = v37;
          long long v33 = [v32 editingCoordinator];
          long long v34 = [v33 boardItemFactory];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10008E2B4;
          v39[3] = &unk_1014D0F08;
          v39[4] = v32;
          v39[5] = v31;
          v40 = v30;
          v41 = self;
          id v42 = v38;
          id v43 = v37;
          id v44 = v10;
          char v45 = 0;
          long long v35 = v30;
          [(CRLPasteboardMultipleImportableBoardItemProvider *)v35 provideBoardItemsWithFactory:v34 completionHandler:v39];

          id v11 = v38;
        }
        break;
      default:
        uint64_t v17 = 0;
        break;
    }
    id v15 = 0;
  }
}

- (id)p_pasteNativeBoardItemsFromProviders:(id)a3 withPasteboard:(id)a4 selectionPath:(id)a5 sender:(id)a6 hasValidGeometries:(BOOL)a7 allowImageReplacement:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = v17;
  id v44 = v16;
  if (v8)
  {
    id v19 = [(CRLCanvasEditor *)self canvasEditorHelper];
    id v49 = 0;
    unsigned int v20 = [v19 commandForReplacingImagePlaceholderInSelection:v16 withBoardItems:v14 isCrossDocument:0 withSender:v18 outSelectionBehavior:&v49];
    id v21 = (CRLCanvasCommandSelectionBehavior *)v49;

    if (v20)
    {
      id v22 = 0;
      if (!v21) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
    BOOL v39 = v9;
    v40 = v21;
    id v41 = v18;
    id v42 = v15;
  }
  else
  {
    BOOL v39 = v9;
    id v41 = v17;
    id v42 = v15;
    v40 = 0;
  }
  id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v14 count]];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v43 = v14;
  id v24 = v14;
  id v25 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v46;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        long long v30 = [(CRLCanvasEditor *)self interactiveCanvasController];
        double v31 = [v30 editingCoordinator];
        double v32 = [v31 boardItemFactory];
        id v33 = [v29 newBoardItemWithFactory:v32 bakedSize:0];

        if (v33) {
          [v23 addObject:v33];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v26);
  }

  uint64_t v18 = v41;
  id v15 = v42;
  unsigned int v20 = [(CRLCanvasEditor *)self p_commandForPastingProvidedBoardItems:v23 withPasteboard:v42 sender:v41 hasValidGeometries:v39 allowPositionChange:1];
  if (v20)
  {
    id v22 = v23;
    id v14 = v43;
    id v21 = v40;
    if (!v40)
    {
LABEL_18:
      long long v34 = [CRLCanvasCommandSelectionBehavior alloc];
      if (v22) {
        long long v35 = v22;
      }
      else {
        long long v35 = &__NSArray0__struct;
      }
      long long v36 = +[NSSet setWithArray:v35];
      id v21 = [(CRLCanvasCommandSelectionBehavior *)v34 initWithCanvasEditor:self type:0 constructedInfos:v36];
    }
LABEL_22:
    id v23 = [(CRLCanvasEditor *)self interactiveCanvasController];
    v37 = [v23 commandController];
    [v37 enqueueCommand:v20 withSelectionBehavior:v21];

    goto LABEL_24;
  }
  id v22 = 0;
  id v14 = v43;
  id v21 = v40;
LABEL_24:

  return v22;
}

- (id)pasteNativeInfosFromPasteboard:(id)a3 allowImageReplacement:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  BOOL v8 = [(CRLCanvasEditor *)self pasteboardController];
  if ([v8 hasNativeTypesOnPasteboard:v6])
  {
    unsigned __int8 v15 = 0;
    BOOL v9 = [v8 providersForNativeBoardItemsAndTextFromPasteboard:v6 validGeometries:&v15];
    id v10 = v9;
    if (v9 && [v9 count])
    {
      id v11 = [v7 editorController];
      id v12 = [v11 selectionPath];
      uint64_t v13 = [(CRLCanvasEditor *)self p_pasteNativeBoardItemsFromProviders:v10 withPasteboard:v6 selectionPath:v12 sender:0 hasValidGeometries:v15 allowImageReplacement:v4];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)commandForInsertingBoardItems:(id)a3 below:(id)a4 withOffset:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 parentContainerItem];
  id v11 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v12 = v11;
  if (v10) {
    [v11 commandToInsertBoardItems:v9 intoContainer:v10 belowBoardItem:v8 withOffset:a5];
  }
  else {
  uint64_t v13 = [v11 commandForInsertingBoardItemsIntoTopLevelContainer:v9 below:v8 withOffset:a5];
  }

  return v13;
}

- (id)commandForInsertingBoardItems:(id)a3 below:(id)a4
{
  return [(CRLCanvasEditor *)self commandForInsertingBoardItems:a3 below:a4 withOffset:0];
}

- (void)paste:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 paste:v4];

  id v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v6 = [v7 canvasEditor];
  [v6 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
}

- (void)pasteAsPlainText:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 pasteAsPlainText:v4];
}

- (void)pasteValues:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 pasteValues:v4];
}

- (CGRect)p_boundingRectForPastingBoardItems:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x4010000000;
  unsigned int v20 = "";
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v22 = size;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008ED5C;
  v14[3] = &unk_1014D0F70;
  id v5 = v3;
  id v15 = v5;
  id v16 = &v17;
  +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:v5 useInBlock:v14];
  double v6 = v18[4];
  double v7 = v18[5];
  double v8 = v18[6];
  double v9 = v18[7];

  _Block_object_dispose(&v17, 8);
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)p_commandForPastingProvidedBoardItems:(id)a3 withPasteboard:(id)a4 sender:(id)a5 hasValidGeometries:(BOOL)a6 allowPositionChange:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (![v12 count])
  {
    id v43 = 0;
    goto LABEL_28;
  }
  id v15 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v15 visibleUnscaledRect];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(CRLCanvasEditor *)self p_boundingRectForPastingBoardItems:v12];
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  if (!v8 || !v7)
  {
    if (v7) {
      goto LABEL_5;
    }
LABEL_13:
    CGFloat v39 = v28;
    CGFloat v40 = v29;
    CGFloat v41 = v30;
    CGFloat v42 = v31;
    goto LABEL_14;
  }
  if (sub_100064278(v17, v19, v21, v23, v24, v25, v26, v27)) {
    goto LABEL_13;
  }
LABEL_5:
  double v32 = [v15 layerHost];
  id v33 = [v32 asiOSCVC];
  [v33 lastTapPoint];
  double v35 = v34;
  double v37 = v36;

  BOOL v38 = CGPointZero.x == v35 && CGPointZero.y == v37;
  if (!v38 && ![(id)objc_opt_class() physicalKeyboardIsSender:v14]) {
    goto LABEL_15;
  }
  [v15 visibleUnscaledRect];
LABEL_14:
  double v35 = sub_100065738(v39, v40, v41, v42);
  double v37 = v44;
LABEL_15:
  long long v45 = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:]([CRLBoardItemPositioner alloc], "initWithCanvasEditor:targetCenter:validGeometries:", self, v8, v35, v37);
  [(CRLBoardItemPositioner *)v45 setShouldPreserveRelativePositions:1];
  long long v46 = [v13 name];
  unsigned int v47 = [v46 isEqualToString:@"com.apple.freeform.Canvas.CRLCanvasRepNoPositionOffsetPasteboardName"];

  if (v47)
  {

    long long v45 = 0;
  }
  id v43 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  if ([v12 count])
  {
    long long v48 = +[NSSet set];
    id v49 = [(CRLCanvasEditor *)self editingCoordinator];
    v50 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v12 infosToRemove:v48 editingCoordinator:v49 withIcc:v15];
    [(CRLCommandGroup *)v43 addCommands:v50];
  }
  v51 = [(CRLCanvasEditor *)self interactiveCanvasController];
  BOOL v52 = [v51 board];
  id v53 = [v52 rootContainer];

  [(CRLBoardItemPositioner *)v45 positionBoardItems:v12];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v54 = v12;
  id v55 = [v54 countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v55)
  {
    id v56 = v55;
    long long v62 = v15;
    id v63 = v14;
    uint64_t v57 = *(void *)v65;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v65 != v57) {
          objc_enumerationMutation(v54);
        }
        CGAffineTransform v59 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v53 boardItem:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        [(CRLCommandGroup *)v43 addCommand:v59];
      }
      id v56 = [v54 countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v56);

    id v54 = +[NSBundle mainBundle];
    CGAffineTransform v60 = [v54 localizedStringForKey:@"Paste" value:0 table:0];
    [(CRLCommandGroup *)v43 setActionString:v60];

    id v14 = v63;
    id v15 = v62;
  }

LABEL_28:

  return v43;
}

- (NSSet)infosForSelectAllInRoot
{
  id v2 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v3 = [v2 infosToDisplay];
  id v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  double v6 = [v5 topLevelContainerRepForEditing];

  BOOL v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  BOOL v8 = [v7 freehandDrawingToolkit];
  unsigned int v9 = [v8 isInDrawingMode];

  if (v9)
  {
    id v59 = v4;
    double v10 = +[NSSet set];
    double v11 = [(CRLCanvasEditor *)self selectionPathWithInfos:v10];
    id v12 = [(CRLCanvasEditor *)self editorController];
    [v12 setSelectionPath:v11];

    id v13 = +[NSMutableSet set];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v14 = [(CRLCanvasEditor *)self interactiveCanvasController];
    id v15 = [v14 layoutController];
    double v16 = [v15 rootLayout];
    double v17 = [v16 children];
    double v18 = +[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:v17];

    id v19 = [v18 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v65;
      do
      {
        double v22 = 0;
        do
        {
          if (*(void *)v65 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = [*(id *)(*((void *)&v64 + 1) + 8 * (void)v22) children];
          double v24 = [v23 crl_arrayByTransformingWithBlock:&stru_1014D0FB0];
          [v13 addObjectsFromArray:v24];

          double v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v20);
    }

    double v25 = +[NSMutableSet set];
    double v26 = [v13 allObjects];
    [v25 addObjectsFromArray:v26];

    double v27 = [(CRLCanvasEditor *)self interactiveCanvasController];
    double v28 = [v27 freehandDrawingToolkit];
    unsigned int v29 = [v28 isLassoAbleToSelectMixedType];

    if (v29)
    {
      if (v6)
      {
        uint64_t v30 = objc_opt_class();
        double v31 = [v6 containerInfo];
        double v32 = [v31 childInfos];
        uint64_t v33 = sub_1002469D0(v30, v32);
        double v34 = (void *)v33;
        double v35 = &__NSArray0__struct;
        if (v33) {
          double v35 = (void *)v33;
        }
        id v36 = v35;
      }
      else
      {
        double v31 = [(CRLCanvasEditor *)self infosForSelectAllInRoot];
        id v36 = [v31 allObjects];
      }

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v40 = v36;
      id v41 = [v40 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v61;
        do
        {
          double v44 = 0;
          do
          {
            if (*(void *)v61 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v44);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v25 addObject:v45];
            }
            double v44 = (char *)v44 + 1;
          }
          while (v42 != v44);
          id v42 = [v40 countByEnumeratingWithState:&v60 objects:v68 count:16];
        }
        while (v42);
      }
    }
    id v39 = [v25 copy];

    id v4 = v59;
  }
  else if (v6)
  {
    double v37 = [v6 containerInfo];
    BOOL v38 = [v37 childInfos];
    id v39 = +[NSSet setWithArray:v38];
  }
  else
  {
    id v39 = [(CRLCanvasEditor *)self infosForSelectAllInRoot];
  }
  long long v46 = [(CRLCanvasEditor *)self p_selectableInfosInInfos:v39];
  unsigned int v47 = +[NSSet setWithArray:v46];

  long long v48 = [(CRLCanvasEditor *)self selectionPathWithInfos:v47];
  id v49 = [(CRLCanvasEditor *)self editorController];
  [v49 setSelectionPath:v48];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = [(CRLCanvasEditor *)self interactiveCanvasController];
    v51 = [v50 layerHost];
    BOOL v52 = [v51 asiOSCVC];
    unsigned __int8 v53 = [v52 isCurrentlyInQuickSelectMode];

    if ((v53 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mInteractiveCanvasController);
      id v55 = [WeakRetained layerHost];
      id v56 = [v55 miniFormatterPresenter];
      uint64_t v57 = [(CRLCanvasEditor *)self editorController];
      CGAffineTransform v58 = [v57 selectionPath];
      [v56 presentMiniFormatterForSelectionPath:v58];
    }
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:0]) {
    [(CRLCanvasEditor *)self hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
  }
}

- (void)group:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 group:v4];
}

- (void)ungroup:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 ungroup:v4];
}

- (BOOL)canGroupBoardItem:(id)a3
{
  return _[a3 canBeGrouped];
}

- (NSArray)infosToConnect
{
  id v2 = [(CRLCanvasEditor *)self interactiveCanvasController];
  if ([v2 isDraggingToInsertBoardItems])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [v2 editorController];
    id v5 = [v4 selectionPath];
    id v3 = +[CRLConnectionLineRep infosToConnectFromSelectionPath:v5 withInteractiveCanvasController:v2];
  }

  return (NSArray *)v3;
}

- (void)connectWithConnectionLine:(id)a3
{
  id v4 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v5 = [v4 editingCoordinator];
  double v6 = [v5 boardItemFactory];

  BOOL v7 = [(CRLCanvasEditor *)self connectionLineItemToUseForConnecting];
  if (v7)
  {
    BOOL v8 = [(CRLCanvasEditor *)self interactiveCanvasController];
    unsigned int v9 = [v8 editingCoordinator];
    double v10 = [v9 boardItemFactory];
    double v11 = [v10 makeDuplicateOfBoardItem:v7];
  }
  else
  {
    double v11 = [v6 makeShapeItemWithShapeType:19];
  }
  id v12 = [(CRLCanvasEditor *)self infosToConnect];
  id v13 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v14 = [v13 commandController];
  id v15 = [v6 blockToRunCommandToPostProcessWithNewBoardItem:v11 shapeType:2 infosToConnect:v12 commandController:v14];

  double v16 = +[CRLInsertionContext nonInteractiveInsertionContext];
  uint64_t v21 = v11;
  double v17 = +[NSArray arrayWithObjects:&v21 count:1];
  [(CRLCanvasEditor *)self prepareGeometryForInsertingBoardItems:v17 withInsertionContext:v16];

  id v20 = v11;
  double v18 = +[NSArray arrayWithObjects:&v20 count:1];
  [(CRLCanvasEditor *)self insertBoardItems:v18 withInsertionContext:v16 postProcessBlock:v15];

  id v19 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v19 donateTipEventObjectsConnectedWithConnectionLine];
}

- (_TtC8Freeform21CRLConnectionLineItem)connectionLineItemToUseForConnecting
{
  id v3 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v4 = [v3 board];
  id v5 = [v4 rootContainer];

  id v6 = [v5 childItems];
  BOOL v7 = (char *)[v6 count];

  if ((uint64_t)(v7 - 1) < 0)
  {
LABEL_7:
    unsigned int v9 = [(CRLCanvasEditor *)self interactiveCanvasController];
    id v15 = [v9 highestZOrderConnectionLineLayoutAcrossBoard];
    id v6 = [v15 connectionLineInfo];
  }
  else
  {
    while (1)
    {
      --v7;
      BOOL v8 = [v5 childItems];
      unsigned int v9 = [v8 objectAtIndexedSubscript:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v10 = (objc_class *)objc_opt_class();
        double v11 = sub_10024715C(v10, v9);
        id v12 = [(CRLCanvasEditor *)self infosToConnect];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000900C4;
        v17[3] = &unk_1014D0FD8;
        id v13 = v11;
        id v18 = v13;
        id v19 = self;
        unsigned int v14 = [v12 crl_containsObjectPassingTest:v17];

        if (v14) {
          id v6 = v13;
        }

        if (v14) {
          break;
        }
      }

      if ((uint64_t)v7 <= 0) {
        goto LABEL_7;
      }
    }
  }

  return (_TtC8Freeform21CRLConnectionLineItem *)v6;
}

- (id)p_nextInfoInTabSequence:(int64_t)a3
{
  id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v6 = [v5 selectionModelTranslator];
  BOOL v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  BOOL v8 = [v7 editorController];
  unsigned int v9 = [v8 selectionPath];
  double v10 = [v6 boardItemsForSelectionPath:v9];

  id v11 = [v10 count];
  id v12 = [(CRLCanvasEditor *)self p_spatiallySortedSelectableBoardItems];
  id v13 = [v12 mutableCopy];

  if (![v13 count])
  {
    id v40 = 0;
    goto LABEL_52;
  }
  if (v11) {
    goto LABEL_3;
  }
  if (a3 == 1)
  {
    uint64_t v41 = [v13 lastObject];
    goto LABEL_51;
  }
  if (a3)
  {
LABEL_3:
    int64_t v56 = a3;
    unsigned int v14 = [v13 count];
    if ((unint64_t)(v14 - 1) >= 2)
    {
      unint64_t v15 = (unint64_t)(v14 - 2);
      do
      {
        double v16 = [v13 objectAtIndexedSubscript:v15 + 1];
        double v17 = [v16 geometry];

        id v18 = [v13 objectAtIndexedSubscript:v15];
        id v19 = [v18 geometry];

        [v19 size];
        double v21 = v20;
        double v22 = [(CRLCanvasEditor *)self interactiveCanvasController];
        double v23 = [v22 canvas];
        unsigned int v24 = [v23 isAnchoredAtRight];

        if (v24)
        {
          [v17 transformedBounds];
          double MaxX = CGRectGetMaxX(v63);
          [v17 transformedBounds];
          double MinY = CGRectGetMinY(v64);
          [v19 transformedBounds];
          double v27 = CGRectGetMaxX(v65);
          [v19 transformedBounds];
          double v28 = CGRectGetMinY(v66);
          if (MaxX > v27) {
            goto LABEL_9;
          }
        }
        else
        {
          [v17 position];
          double v30 = v29;
          double MinY = v31;
          [v19 position];
          double v33 = v32;
          double v28 = v34;
          if (v30 < v33)
          {
LABEL_9:
            if (v28 >= MinY - v21 * 0.33 && v28 < v21 * 0.33 + MinY) {
              [v13 exchangeObjectAtIndex:v15 + 1 withObjectAtIndex:v15];
            }
          }
        }
      }
      while (v15-- > 1);
    }
    if (v11 == (id)1)
    {
      double v10 = v55;
      double v37 = [v55 anyObject];
      BOOL v38 = (char *)[v13 indexOfObject:v37];

      int64_t v39 = v56;
    }
    else
    {
      id v42 = +[NSMutableIndexSet indexSet];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      double v10 = v55;
      id v43 = v55;
      id v44 = [v43 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v58;
        do
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v58 != v46) {
              objc_enumerationMutation(v43);
            }
            [v42 addIndex:[v13 indexOfObject:*(void *)(*((void *)&v57 + 1) + 8 * i)]];
          }
          id v45 = [v43 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }
        while (v45);
      }

      int64_t v39 = v56;
      if (v56 == 1) {
        long long v48 = (char *)[v42 firstIndex];
      }
      else {
        long long v48 = (char *)[v42 lastIndex];
      }
      BOOL v38 = v48;
    }
    if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0FF8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010707A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1018);
      }
      id v49 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v49);
      }
      v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor p_nextInfoInTabSequence:]");
      v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:v50 file:v51 lineNumber:1619 isFatal:0 description:"couldn't find selected info in all drawables!"];

      if (v56 == 1)
      {
LABEL_43:
        BOOL v52 = v38 - 1;
LABEL_49:
        unint64_t v53 = (unint64_t)v52 % (unint64_t)[v13 count];
        goto LABEL_50;
      }
    }
    else
    {
      if (v39 == 1 && !v38)
      {
        unint64_t v53 = (unint64_t)[v13 count] - 1;
LABEL_50:
        uint64_t v41 = [v13 objectAtIndex:v53];
        goto LABEL_51;
      }
      if (v39 == 1) {
        goto LABEL_43;
      }
    }
    BOOL v52 = v38 + 1;
    goto LABEL_49;
  }
  uint64_t v41 = [v13 firstObject];
LABEL_51:
  id v40 = (void *)v41;
LABEL_52:

  return v40;
}

+ (id)spatialInfoComparator
{
  return &stru_1014D1058;
}

- (id)p_spatiallySortedSelectableBoardItems
{
  id v3 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v4 = [v3 topLevelContainerRepForEditing];

  if (v4)
  {
    id v5 = [v4 containerInfo];
    uint64_t v6 = [v5 childInfos];
LABEL_13:
    unsigned int v9 = (void *)v6;
    goto LABEL_14;
  }
  BOOL v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  unsigned int v8 = [v7 hasSelectedInfosInMultipleContainers];

  if (!v8)
  {
    id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
    uint64_t v6 = [v5 infosToDisplay];
    goto LABEL_13;
  }
  unsigned int v9 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v10 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v5 = [v10 containersForSelection];

  id v11 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v5);
        }
        unint64_t v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) childInfos];
        [v9 addObjectsFromArray:v15];
      }
      id v12 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
LABEL_14:

  double v16 = [(CRLCanvasEditor *)self p_selectableInfosInInfos:v9];
  double v17 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v18 = [v17 canvas];
  unsigned int v19 = [v18 isAnchoredAtRight];

  if (v19) {
    double v20 = &stru_1014D1078;
  }
  else {
    double v20 = &stru_1014D1058;
  }
  double v21 = [v16 sortedArrayUsingComparator:v20];

  return v21;
}

- (id)p_selectableInfosInInfos:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  uint64_t v6 = [(CRLCanvasEditor *)self interactiveCanvasController];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v6 repForInfo:v12];
        unsigned int v14 = [v13 repForSelecting];

        if (v14 == v13) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)insertTab:(id)a3
{
  unsigned __int8 v4 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:0];
  id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  uint64_t v6 = [v5 freehandDrawingToolkit];
  unsigned int v7 = [v6 isInDrawingMode];

  if (!v7 || (v4 & 1) == 0)
  {
    id v10 = [(CRLCanvasEditor *)self p_nextInfoInTabSequence:0];
    id v8 = [(CRLCanvasEditor *)self selectionPathWithInfo:v10];
    id v9 = [(CRLCanvasEditor *)self editorController];
    [v9 setSelectionPath:v8];
  }
}

- (void)insertBacktab:(id)a3
{
  unsigned __int8 v4 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:0];
  id v5 = [(CRLCanvasEditor *)self interactiveCanvasController];
  uint64_t v6 = [v5 freehandDrawingToolkit];
  unsigned int v7 = [v6 isInDrawingMode];

  if (!v7 || (v4 & 1) == 0)
  {
    id v10 = [(CRLCanvasEditor *)self p_nextInfoInTabSequence:1];
    id v8 = [(CRLCanvasEditor *)self selectionPathWithInfo:v10];
    id v9 = [(CRLCanvasEditor *)self editorController];
    [v9 setSelectionPath:v8];
  }
}

- (BOOL)handlesSpacebar
{
  return 1;
}

- (void)insertText:(id)a3 replacementRange:(_NSRange)a4
{
  id v5 = a3;
  id v6 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v6 beginEditingOnKeyInputWithString:v5];
}

- (void)insertNewline:(id)a3
{
  id v4 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v3 = +[NSString string];
  [v4 beginEditingOnKeyInputWithString:v3];
}

- (id)createArrangeInspectorDelegate
{
  id v2 = [[CRLDrawableZOrderArranger alloc] initWithCanvasEditor:self];

  return v2;
}

- (CRLArrangeInspectorDelegate)arrangeInspectorDelegate
{
  mZOrderArranger = self->mZOrderArranger;
  if (!mZOrderArranger)
  {
    id v4 = [(CRLCanvasEditor *)self createArrangeInspectorDelegate];
    id v5 = self->mZOrderArranger;
    self->mZOrderArranger = v4;

    mZOrderArranger = self->mZOrderArranger;
  }

  return mZOrderArranger;
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  id v10 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v3 = [v10 layerHost];
  id v4 = [v3 canvasLayer];
  [v4 contentInset];
  double v6 = v5;

  [v10 contentOffset];
  double v8 = v7;
  [v10 viewScale];
  [v10 setContentOffset:1 scrollOptions:v8, v6 / v9];
}

- (void)scrollToEndOfDocument:(id)a3
{
  id v14 = [(CRLCanvasEditor *)self interactiveCanvasController];
  id v3 = [v14 canvasView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [v14 contentOffset];
  double v13 = v12;
  v16.origin.double x = v5;
  v16.origin.double y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  [v14 setContentOffset:1 scrollOptions:v13 CGRectGetMaxY(v16)];
}

- (void)zoomIn:(id)a3
{
  double v4 = (CRLCanvasEditor *)a3;
  CGFloat v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v7 = v5;
  if (v4) {
    double v6 = v4;
  }
  else {
    double v6 = self;
  }
  [v5 zoomIn:v6];
}

- (void)zoomOut:(id)a3
{
  double v4 = (CRLCanvasEditor *)a3;
  CGFloat v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  id v7 = v5;
  if (v4) {
    double v6 = v4;
  }
  else {
    double v6 = self;
  }
  [v5 zoomOut:v6];
}

- (void)zoomToFitAllContent:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v3 zoomToFitAllContent];
}

- (void)zoomToSelection:(id)a3
{
  id v3 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v3 zoomToCurrentSelection];
}

- (void)actualSize:(id)a3
{
  double v4 = [(CRLCanvasEditor *)self interactiveCanvasController];
  CGFloat v5 = [v4 editingCoordinator];
  double v6 = [v5 followCoordinator];
  [v6 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:1];

  id v7 = [(CRLCanvasEditor *)self interactiveCanvasController];
  [v7 setViewScale:1.0];
}

- (id)leadingBarButtonGroupsWithDefaultGroups:(id)a3
{
  return &__NSArray0__struct;
}

- (id)trailingBarButtonGroupsWithDefaultGroups:(id)a3
{
  return &__NSArray0__struct;
}

- (void)scrollCanvasPageUp:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 scrollCanvasPageUp:v4];
}

- (void)scrollCanvasPageDown:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 scrollCanvasPageDown:v4];
}

- (void)scrollCanvasUp:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 scrollCanvasUp:v4];
}

- (void)scrollCanvasDown:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 scrollCanvasDown:v4];
}

- (void)scrollCanvasLeft:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 scrollCanvasLeft:v4];
}

- (void)scrollCanvasRight:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditor *)self canvasEditorHelper];
  [v5 scrollCanvasRight:v4];
}

- (UIInputViewController)inputAccessoryViewController
{
  return self->inputAccessoryViewController;
}

- (NSArray)leadingBarButtonGroups
{
  return self->leadingBarButtonGroups;
}

- (NSArray)trailingBarButtonGroups
{
  return self->trailingBarButtonGroups;
}

- (BOOL)resignFirstResponderWhenKeyboardHides
{
  return self->mResignFirstResponderWhenKeyboardHides;
}

- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3
{
  self->mResignFirstResponderWhenKeyboardHides = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->trailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->leadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->inputAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_pasteboardController, 0);
  objc_storeStrong((id *)&self->mInputView, 0);
  objc_storeStrong((id *)&self->mZOrderArranger, 0);
  objc_storeStrong((id *)&self->mCanvasEditorHelper, 0);

  objc_destroyWeak((id *)&self->mInteractiveCanvasController);
}

@end