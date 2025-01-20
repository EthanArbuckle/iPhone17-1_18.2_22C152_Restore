@interface CRLCanvasEditorHelper
+ (BOOL)physicalKeyboardIsSender:(id)a3;
+ (Class)selectionClass;
- (BOOL)allowSelectAllForSender:(id)a3 hasNothingVisiblySelected:(BOOL)a4 hasAtLeastOneThingToSelect:(BOOL)a5;
- (BOOL)canDivideCompoundShape:(id)a3;
- (BOOL)canGroupBoardItems:(id)a3;
- (BOOL)canInsertBoardItems:(id)a3 intoGroup:(id)a4;
- (BOOL)canPasteWithItemSource:(id)a3 sender:(id)a4;
- (BOOL)canPerformMaskWithSender:(id)a3;
- (BOOL)canPerformMaskWithShapeTypeWithSender:(id)a3;
- (BOOL)canPerformMaskWithShapeWithSender:(id)a3;
- (BOOL)canPerformUnmaskWithSender:(id)a3;
- (BOOL)canReplaceBoardItem:(id)a3;
- (BOOL)canUngroupGroupInfo:(id)a3;
- (BOOL)canUngroupWithSelection:(id)a3;
- (BOOL)customPasteMenuDisplayed;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)insertBoardItemsFromDragAndDrop:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5 insertionContext:(id)a6 alreadyPositionedInputInfos:(BOOL)a7;
- (BOOL)isLayoutSelectable:(id)a3;
- (BOOL)p_allowsCanvasScrollingFromKeyboard;
- (BOOL)selectionContainsJustUnlockedObjects;
- (BOOL)selectionIsEmpty;
- (BOOL)shouldAllowPotentiallyKeyboardBasedActionForSender:(id)a3;
- (BOOL)wantsToHighlightRep:(id)a3 forDragOperationWithDragInfo:(id)a4 atPoint:(CGPoint)a5 allowNonPlaceholderReplacement:(BOOL)a6;
- (CGPoint)contentOffsetForDocumentNavigationType:(unint64_t)a3;
- (CGPoint)p_centerOfBoardItems:(id)a3;
- (CGPoint)p_offsetToMoveCenterOfLayout:(id)a3 toPoint:(CGPoint)a4 inRootSpace:(BOOL)a5;
- (CGPoint)p_offsetToMoveLayout:(id)a3 edge:(int)a4 toOffset:(double)a5 inRootSpace:(BOOL)a6;
- (CGRect)p_boundingBoxForLayouts:(id)a3 inRootSpace:(BOOL)a4;
- (CRLCanvasEditor)canvasEditor;
- (CRLCanvasEditorHelper)initWithCanvasEditor:(id)a3;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLiOSContextMenuController)contextMenuController;
- (Class)editorClassForInfos:(id)a3;
- (Class)p_editorClassForBoardItems:(id)a3 shouldIgnoreLockedState:(BOOL)a4;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (id)boardItemsToDelete;
- (id)canvasSelectionPathExcludingInfo:(id)a3;
- (id)canvasSelectionPathIncludingInfo:(id)a3;
- (id)commandForDeletingBoardItemsFromTopLevelContainer:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4;
- (id)commandForDeletingInfosPossiblyFromMultipleContainers:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4;
- (id)commandForDeletingInfosPossiblyFromMultipleContainers:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4 canDeleteNewlyCreatedInfos:(BOOL)a5;
- (id)commandForInsertingBoardItemsIntoTopLevelContainer:(id)a3 below:(id)a4;
- (id)commandForInsertingBoardItemsIntoTopLevelContainer:(id)a3 below:(id)a4 withOffset:(unint64_t)a5;
- (id)commandForReplacingImagePlaceholderInSelection:(id)a3 withBoardItems:(id)a4 isCrossDocument:(BOOL)a5 withSender:(id)a6 outSelectionBehavior:(id *)a7;
- (id)commandToInsertBoardItems:(id)a3 intoContainer:(id)a4 belowBoardItem:(id)a5 withOffset:(unint64_t)a6;
- (id)commandsForUngrouping:(id)a3 objectsToSelect:(id)a4;
- (id)commandsToSwapConnectionsFromRep:(id)a3 toInfo:(id)a4;
- (id)drawablesToLockOrUnlockForInfos:(id)a3;
- (id)infosToDeleteToDeleteInfos:(id)a3;
- (id)insertCopiesOfInfos:(id)a3 forDuplicatingDragOnRep:(id)a4;
- (id)keyboardMovementManipulator;
- (id)layoutsForAlignAndDistribute;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)p_canvasSelectionPathChangingInfo:(id)a3 shouldExclude:(BOOL)a4;
- (id)p_commandForUpdatingMagnetAfterGroupingForCline:(id)a3 withPosition:(id)a4 withGroupLayout:(id)a5 forMagnet:(BOOL)a6;
- (id)p_commandForUpdatingMagnetAfterUngroupingForCline:(id)a3 withPosition:(id)a4 forMagnet:(BOOL)a5;
- (id)p_commandsForGroupingBoardItems:(id)a3 outNewGroup:(id *)a4;
- (id)p_commandsToPrepareForGroupingBoardItems:(id)a3 infosToAdjustForConnectionLines:(id)a4;
- (id)p_getMagnetUnscaledPositionValueForMagnet:(id)a3 withConnectedItem:(id)a4;
- (id)pasteboardController;
- (id)permittedActionsForReasons:(unint64_t)a3;
- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (id)selectionBehaviorForDeletingBoardItems:(id)a3;
- (id)selectionPathByReplacingInfosInSelectionPath:(id)a3 withInfos:(id)a4;
- (id)selectionPathByReplacingInfosInSelectionPath:(id)a3 withInfos:(id)a4 preservingMultipleContainers:(BOOL)a5;
- (id)selectionPathForInsertingBoardItems:(id)a3 byReplacingInfosInSelectionPath:(id)a4 preservingMultipleContainers:(BOOL)a5;
- (id)selectionPathWithInfo:(id)a3;
- (id)selectionPathWithInfos:(id)a3;
- (id)shapeInfoToBeginEditing;
- (id)tooltipForMoveBackward;
- (id)tooltipForMoveForward;
- (id)tooltipForMoveToBack;
- (id)tooltipForMoveToFront;
- (id)topMostContainerForDeletingContainer:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformAlignAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformBringDrawablesForwardActionWithSender:(id)a3;
- (int64_t)canvasEditorCanPerformConnectWithConnectionLineAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformCopyAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformCopyStyleAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformCutAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformDeleteAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformDeselectAllAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformDistributeActionWithSender:(id)a3;
- (int64_t)canvasEditorCanPerformDuplicateAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformGroupActionWithSender:(id)a3;
- (int64_t)canvasEditorCanPerformLockAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformPasteAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformPasteAsPlainTextAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformPastePreservingFormulasAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformPasteValuesAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformSelectAllAction:(SEL)a3 withSender:(id)a4;
- (int64_t)canvasEditorCanPerformSendDrawablesBackwardActionWithSender:(id)a3;
- (int64_t)canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:(id)a3;
- (int64_t)canvasEditorCanPerformUngroupActionWithSender:(id)a3;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addContextualMenuItemsToArray:(id)a3;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)alignDrawablesByEdge:(int)a3;
- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4;
- (void)beginEditingOnKeyInputWithString:(id)a3;
- (void)bringForward:(id)a3;
- (void)bringToFront:(id)a3;
- (void)contextMenuDidHideForContextMenuController:(id)a3;
- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deselectAll:(id)a3;
- (void)distributeDrawablesByEdge:(int)a3;
- (void)distributeDrawablesEvenly;
- (void)duplicate:(id)a3;
- (void)enterQuickSelectMode:(id)a3;
- (void)group:(id)a3;
- (void)hideDragAndDropUI;
- (void)lock:(id)a3;
- (void)mask;
- (void)maskImage:(id)a3 withShape:(id)a4 shouldOpenGroup:(BOOL)a5 shouldBeginEditing:(BOOL)a6;
- (void)maskImage:(id)a3 withShapeType:(int64_t)a4;
- (void)maskWithShape;
- (void)maskWithShapeType:(int64_t)a3;
- (void)moveSelections:(unint64_t)a3;
- (void)p_beginEditingTextShape:(id)a3 replacementRange:(_NSRange)a4 withText:(id)a5;
- (void)p_copy:(id)a3;
- (void)p_fixupGeometryForInsertingBoardItems:(id)a3 intoContainer:(id)a4;
- (void)p_getMagnetUnscaledPositionsFromInfos:(id)a3 withAffectedInfos:(id)a4 withClineHeadMagnets:(id *)a5 withClineTailMagnets:(id *)a6;
- (void)p_maskImage:(id)a3 withShape:(id)a4 shouldOpenGroup:(BOOL)a5 shouldBeginEditing:(BOOL)a6 shouldCenterAroundFaces:(BOOL)a7;
- (void)p_scrollCanvasForScrollType:(unint64_t)a3;
- (void)p_setLockStatusOfSelectedDrawables:(BOOL)a3;
- (void)paste:(id)a3;
- (void)pasteAsPlainText:(id)a3;
- (void)pasteValues:(id)a3;
- (void)perform_delete;
- (void)perform_deleteBoardItems:(id)a3;
- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4;
- (void)prepareGeometryForPastingBoardItems:(id)a3 fromPasteboard:(id)a4 intoContainer:(id)a5 useOriginalPositions:(BOOL)a6;
- (void)presentAlignmentTools:(id)a3;
- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6;
- (void)replaceBoardItem:(id)a3 withBoardItem:(id)a4;
- (void)scrollCanvasDown:(id)a3;
- (void)scrollCanvasLeft:(id)a3;
- (void)scrollCanvasPageDown:(id)a3;
- (void)scrollCanvasPageUp:(id)a3;
- (void)scrollCanvasRight:(id)a3;
- (void)scrollCanvasUp:(id)a3;
- (void)selectParent:(id)a3;
- (void)sendBackward:(id)a3;
- (void)sendToBack:(id)a3;
- (void)setContextMenuController:(id)a3;
- (void)setCustomPasteMenuDisplayed:(BOOL)a3;
- (void)showMiniFormatterToExitDrawingMode:(id)a3;
- (void)teardown;
- (void)ungroup:(id)a3;
- (void)unlock:(id)a3;
- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4;
- (void)zoomIn:(id)a3;
- (void)zoomOut:(id)a3;
@end

@implementation CRLCanvasEditorHelper

- (CRLCanvasEditorHelper)initWithCanvasEditor:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLCanvasEditorHelper;
  v5 = [(CRLCanvasEditorHelper *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mCanvasEditor, v4);
    v6->mTornDown = 0;
    v7 = [CRLKeyboardMovementManipulator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->mCanvasEditor);
    v9 = [WeakRetained interactiveCanvasController];
    v10 = [(CRLKeyboardMovementManipulator *)v7 initWithInteractiveCanvasController:v9];
    mKeyboardManipulator = v6->mKeyboardManipulator;
    v6->mKeyboardManipulator = v10;
  }
  return v6;
}

- (CRLCanvasEditor)canvasEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);

  return (CRLCanvasEditor *)WeakRetained;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  v2 = [(CRLCanvasEditorHelper *)self canvasEditor];
  v3 = [v2 interactiveCanvasController];

  return (CRLInteractiveCanvasController *)v3;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  v2 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  v3 = [v2 editingCoordinator];

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (id)keyboardMovementManipulator
{
  return self->mKeyboardManipulator;
}

- (id)pasteboardController
{
  v2 = [(CRLCanvasEditorHelper *)self canvasEditor];
  v3 = [v2 pasteboardController];

  return v3;
}

- (void)teardown
{
  self->mTornDown = 1;
}

- (void)dealloc
{
  if (!self->mTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1150);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089BA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1170);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:162 isFatal:0 description:"Need to call teardown on the editor helper"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasEditorHelper;
  [(CRLCanvasEditorHelper *)&v6 dealloc];
}

- (BOOL)isLayoutSelectable:(id)a3
{
  id v4 = a3;
  if (![v4 isSelectable]) {
    goto LABEL_6;
  }
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [v4 info];
  v7 = sub_1002469D0(v5, v6);

  if (v7)
  {
    v8 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    v9 = [v8 editingCoordinator];
    v10 = [v9 mainBoard];
    v11 = [v7 id];
    unsigned __int8 v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {

LABEL_6:
      char v17 = 0;
      goto LABEL_7;
    }
  }

  objc_super v13 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  v14 = [v13 editingCoordinator];
  v15 = [v14 followCoordinator];
  unsigned __int8 v16 = [v15 isFollowing];

  char v17 = v16 ^ 1;
LABEL_7:

  return v17;
}

+ (Class)selectionClass
{
  return (Class)objc_opt_class();
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = sub_1002469D0(v7, v6);
  v9 = v8;
  if (v8)
  {
    v10 = [v8 boardItems];
    v11 = [(CRLCanvasEditorHelper *)self editorClassForInfos:v10];
    if (v11)
    {
      unsigned __int8 v12 = v11;
      if ([(objc_class *)v11 isSubclassOfClass:objc_opt_class()])
      {
        id v13 = [v12 alloc];
        v14 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
        v15 = (CRLPathEditor *)[v13 initWithInteractiveCanvasController:v14];

        [(CRLBoardItemEditor *)v15 setBoardItems:v10];
        goto LABEL_28;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E11D0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101089CB8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E11F0);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper nextEditorForSelection:withNewEditorStack:selectionPath:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      v22 = "Unknown editor class";
      v23 = v20;
      v24 = v21;
      uint64_t v25 = 226;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v16 = objc_opt_class();
    v10 = sub_1002469D0(v16, v6);
    if (v10)
    {
      char v17 = [CRLPathEditor alloc];
      v18 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
      v15 = [(CRLBoardItemEditor *)v17 initWithInteractiveCanvasController:v18];

      goto LABEL_28;
    }
    if (v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1190);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101089C30();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E11B0);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper nextEditorForSelection:withNewEditorStack:selectionPath:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      id v28 = v6;
      v22 = "Can't build an editor from the canvas editor with something that isn't a CRLBoardItemSelection (received %@)";
      v23 = v20;
      v24 = v21;
      uint64_t v25 = 210;
LABEL_26:
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, v25, 0, v22, v28);
    }
  }
  v15 = 0;
LABEL_28:

  return v15;
}

- (Class)editorClassForInfos:(id)a3
{
  return [(CRLCanvasEditorHelper *)self p_editorClassForBoardItems:a3 shouldIgnoreLockedState:0];
}

- (Class)p_editorClassForBoardItems:(id)a3 shouldIgnoreLockedState:(BOOL)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [v5 anyObject];
    id v7 = [v6 editorClass];

    if (v7)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v13, "locked", (void)v18) && !a4)
            {
              id v7 = (id)objc_opt_class();
              goto LABEL_23;
            }
            id v14 = [v13 editorClass];
            if (!v14) {
              goto LABEL_21;
            }
            id v15 = v14;
            if (([v14 isSubclassOfClass:v7] & 1) == 0 && v15 != v7)
            {
              id v7 = [v7 superclass];
              if (([v15 isSubclassOfClass:v7] & 1) == 0)
              {
                do
                  id v7 = [v7 superclass];
                while (![v15 isSubclassOfClass:v7]);
              }
              if ((id)objc_opt_class() != v7 && ![v7 isSubclassOfClass:objc_opt_class()])
              {
LABEL_21:
                id v7 = 0;
                goto LABEL_23;
              }
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_23:
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v16 = (objc_class *)v7;

  return v16;
}

- (id)permittedActionsForReasons:(unint64_t)a3
{
  return +[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "deselectAll:", 0);
}

- (id)selectionPathWithInfo:(id)a3
{
  if (a3)
  {
    id v4 = +[NSSet setWithObject:](NSSet, "setWithObject:");
    id v5 = [(CRLCanvasEditorHelper *)self selectionPathWithInfos:v4];
  }
  else
  {
    id v5 = -[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:");
  }

  return v5;
}

- (id)selectionPathWithInfos:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = &off_101557000;
    uint64_t v6 = *(void *)v25;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v7);
        if (([v8 conformsToProtocol:v5[420]] & 1) == 0)
        {
          unsigned int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1210);
          }
          id v10 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v29 = v9;
            __int16 v30 = 2082;
            v31 = "-[CRLCanvasEditorHelper selectionPathWithInfos:]";
            __int16 v32 = 2082;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m";
            __int16 v34 = 1024;
            int v35 = 293;
            __int16 v36 = 2112;
            v37 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1230);
          }
          uint64_t v11 = v5;
          unsigned __int8 v12 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            id v15 = v12;
            uint64_t v16 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v29 = v9;
            __int16 v30 = 2114;
            v31 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper selectionPathWithInfos:]");
          id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
          +[CRLAssertionHandler handleFailureInFunction:v13, v14, 293, 0, "Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", v8 file lineNumber isFatal description];

          id v5 = v11;
        }
        id v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v4);
  }
  char v17 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  long long v18 = [v17 delegate];
  long long v19 = [v18 selectionModelTranslatorForInteractiveCanvasController:v17];
  long long v20 = [v19 selectionPathForInfos:obj];

  return v20;
}

- (id)canvasSelectionPathIncludingInfo:(id)a3
{
  return [(CRLCanvasEditorHelper *)self p_canvasSelectionPathChangingInfo:a3 shouldExclude:0];
}

- (id)canvasSelectionPathExcludingInfo:(id)a3
{
  return [(CRLCanvasEditorHelper *)self p_canvasSelectionPathChangingInfo:a3 shouldExclude:1];
}

- (id)selectionPathByReplacingInfosInSelectionPath:(id)a3 withInfos:(id)a4
{
  return [(CRLCanvasEditorHelper *)self selectionPathByReplacingInfosInSelectionPath:a3 withInfos:a4 preservingMultipleContainers:0];
}

- (id)selectionPathByReplacingInfosInSelectionPath:(id)a3 withInfos:(id)a4 preservingMultipleContainers:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(CRLCanvasEditorHelper *)self p_editorClassForBoardItems:v9 shouldIgnoreLockedState:0])
  {
    id v10 = [[_TtC8Freeform21CRLBoardItemSelection alloc] initWithBoardItems:v9];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = objc_alloc_init(CRLCanvasSelection);
  id v12 = v8;
  id v13 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v14 = [v13 interactiveCanvasController];
  id v15 = [v14 selectionModelTranslator];

  uint64_t v16 = [v15 containerToInsertIntoForSelectionPath:v12];
  char v17 = (void *)v16;
  if (v5)
  {
    long long v18 = [v12 mostSpecificSelectionOfClass:objc_opt_class()];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      long long v19 = [v12 selectionPathPoppingOffSelection:v18];
    }
    else
    {
      long long v19 = v12;
    }
  }
  else
  {
    if (v16
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v9 allObjects],
          long long v20 = objc_claimAutoreleasedReturnValue(),
          unsigned int v21 = [(CRLCanvasEditorHelper *)self canInsertBoardItems:v20 intoGroup:v17], v20, v21))
    {
      uint64_t v22 = [v15 selectionPathForNothingSelectedInsideGroup:v17];
    }
    else
    {
      uint64_t v22 = [(CRLCanvasEditorHelper *)self selectionPathWithInfos:0];
    }
    long long v19 = (void *)v22;
    long long v18 = v12;
  }

  v23 = [v19 mostSpecificSelectionOfClass:objc_opt_class()];
  long long v24 = [v19 selectionPathReplacingMostSpecificLocationOfSelection:v23 withSelection:v11];
  long long v25 = v24;
  if (v10)
  {
    id v26 = [v24 selectionPathWithAppendedSelection:v10];
  }
  else
  {
    id v26 = v24;
  }
  long long v27 = v26;

  return v27;
}

- (id)selectionPathForInsertingBoardItems:(id)a3 byReplacingInfosInSelectionPath:(id)a4 preservingMultipleContainers:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(CRLCanvasEditorHelper *)self selectionPathByReplacingInfosInSelectionPath:a4 withInfos:v8 preservingMultipleContainers:v5];
  id v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v11 = [v10 freehandDrawingToolkit];
  LODWORD(self) = [v11 isInDrawingMode];

  if (self)
  {
    id v34 = [v8 count];
    id v12 = +[NSMutableSet set];
    id v13 = +[NSMutableSet set];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v21 = v14;
            goto LABEL_35;
          }
          [v12 addObject:v19];
          long long v20 = [v19 childItems];
          [v13 addObjectsFromArray:v20];
        }
        id v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    if (v34 && [v13 count])
    {
      id v21 = v9;
      uint64_t v22 = [v21 mostSpecificSelectionOfClass:objc_opt_class()];
      v23 = v22;
      if (v22)
      {
        long long v24 = [v22 boardItems];
        unsigned __int8 v25 = [v24 isEqual:v14];

        if ((v25 & 1) == 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1290);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101089DD4();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E12B0);
          }
          id v26 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v26);
          }
          long long v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper selectionPathForInsertingBoardItems:byReplacingInfosInSelectionPath:preservingMultipleContainers:]");
          id v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
          +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:392 isFatal:0 description:"the default selection should be pointing at the boardItems we're trying to insert"];
        }
        unsigned int v29 = [[_TtC8Freeform17CRLGroupSelection alloc] initWithContainerGroups:v12 hasSelectedItemsInNonGroupContainer:0];
        __int16 v30 = [v21 selectionPathReplacingMostSpecificLocationOfSelection:v23 withSelection:v29];
        v31 = [[_TtC8Freeform21CRLBoardItemSelection alloc] initWithBoardItems:v13];
        id v9 = [v30 selectionPathWithAppendedSelection:v31];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1250);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101089D40();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1270);
        }
        __int16 v32 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v32);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper selectionPathForInsertingBoardItems:byReplacingInfosInSelectionPath:preservingMultipleContainers:]");
        unsigned int v29 = (_TtC8Freeform17CRLGroupSelection *)objc_claimAutoreleasedReturnValue();
        __int16 v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 390, 0, "invalid nil value for '%{public}s'", "boardItemSelection");
        id v9 = v21;
      }

LABEL_35:
    }
  }

  return v9;
}

- (id)p_canvasSelectionPathChangingInfo:(id)a3 shouldExclude:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v8 = [v7 editorController];

  id v9 = [v8 selectionPath];
  id v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v11 = [v10 infosForSelectionPath:v9];

  id v12 = [v11 mutableCopy];
  id v13 = [v9 mostSpecificSelectionOfClass:objc_opt_class()];
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 boardItems];
    unsigned int v16 = [v15 isEqual:v11];

    if (v16)
    {
      uint64_t v17 = +[NSMutableSet set];

      id v12 = (id)v17;
    }
  }
  if (!v12)
  {
    id v12 = +[NSMutableSet set];
  }
  if (v4) {
    [v12 removeObject:v6];
  }
  else {
    [v12 addObject:v6];
  }
  id v18 = [v12 count];
  if (!v14 || v18)
  {
    id v26 = [(CRLCanvasEditorHelper *)self selectionPathWithInfos:v12];
  }
  else
  {
    id v28 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    long long v19 = [v28 selectionModelTranslator];
    long long v20 = [v14 containerGroups];
    [v20 firstObject];
    id v21 = v9;
    uint64_t v22 = v11;
    v23 = v8;
    unsigned __int8 v25 = v24 = v6;
    id v26 = [v19 selectionPathForNothingSelectedInsideGroup:v25];

    id v6 = v24;
    id v8 = v23;
    uint64_t v11 = v22;
    id v9 = v21;
  }

  return v26;
}

- (BOOL)shouldAllowPotentiallyKeyboardBasedActionForSender:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() physicalKeyboardIsSender:v4];

  if (!v5) {
    return 1;
  }
  id v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 shouldAllowKeyCommands];

  return v7;
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___CRLiOSPhysicalKeyboardAwareSender]) {
    unsigned __int8 v4 = [v3 crl_representsPhysicalKeyboard];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)canPasteWithItemSource:(id)a3 sender:(id)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = [(CRLCanvasEditorHelper *)self pasteboardController];

    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E12D0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101089E5C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E12F0);
      }
      unsigned __int8 v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper canPasteWithItemSource:sender:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 478, 0, "invalid nil value for '%{public}s'", "self.pasteboardController");
    }
    id v10 = [(CRLCanvasEditorHelper *)self pasteboardController];
    uint64_t v11 = +[CRLPasteboard generalPasteboard];
    id v5 = [v10 ingestibleItemSourceForPasteboard:v11];
  }
  unsigned __int8 v12 = [v5 canProduceBoardItems];

  return v12;
}

- (int64_t)canvasEditorCanPerformDeleteAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v6])
  {
    unsigned __int8 v7 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if (([v7 canvasEditorCanDeleteWithSender:v6] & ("delete:" == a3)) != 0) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)canvasEditorCanPerformCopyAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  int64_t v7 = -1;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v6]&& "copy:" == a3)
  {
    int64_t v8 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v8 canvasEditorCanCopyWithSender:v6]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  return v7;
}

- (int64_t)canvasEditorCanPerformCopyStyleAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  unsigned int v7 = [v6 canvasEditorCanCopyStyleWithSender:v5];

  if (v7) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)canvasEditorCanPerformCutAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v5])
  {
    id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
    unsigned int v7 = [v6 canvasEditorCanCutWithSender:v5];

    if (v7) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)canvasEditorCanPerformPasteAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(CRLCanvasEditorHelper *)self canvasEditor];
  int64_t v8 = [v7 interactiveCanvasController];
  id v9 = [v8 layerHost];
  id v10 = [v9 asiOSCVC];

  uint64_t v11 = objc_opt_class();
  unsigned __int8 v12 = [v10 presentedViewController];
  id v13 = sub_1002469D0(v11, v12);
  if (v13)
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v15 = objc_opt_class();
    unsigned int v16 = [v10 presentedViewController];
    uint64_t v17 = sub_1002469D0(v15, v16);
    BOOL v14 = v17 == 0;
  }
  int64_t v18 = -1;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v6]&& v14&& "paste:" == a3)
  {
    long long v19 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v19 canvasEditorCanPasteWithSender:v6]) {
      int64_t v18 = 1;
    }
    else {
      int64_t v18 = -1;
    }
  }
  return v18;
}

- (int64_t)canvasEditorCanPerformPasteAsPlainTextAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v5])
  {
    id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v6 canvasEditorCanPasteAsPlainTextWithSender:v5]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformPasteValuesAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v5])
  {
    id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v6 canvasEditorCanPasteValuesWithSender:v5]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformPastePreservingFormulasAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v5])
  {
    id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v6 canvasEditorCanPasteWithSender:v5]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformDuplicateAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(id)objc_opt_class() physicalKeyboardIsSender:v6];
  unsigned int v8 = [(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v6];
  if ([v6 isEqual:@"CRLMiniFormatter"])
  {
    int isKindOfClass = 1;
    if (!v8)
    {
LABEL_3:
      int64_t v10 = -1;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    if (!v8) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [(CRLCanvasEditorHelper *)self canvasEditor];
  if (([v11 canvasEditorCanDuplicateWithSender:v6] & (v7 | isKindOfClass) & ("duplicate:" == a3)) != 0) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = -1;
  }

LABEL_9:
  return v10;
}

- (int64_t)canvasEditorCanPerformSelectAllAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if ([(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v5])
  {
    id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v6 canvasEditorCanSelectAllWithSender:v5]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (BOOL)allowSelectAllForSender:(id)a3 hasNothingVisiblySelected:(BOOL)a4 hasAtLeastOneThingToSelect:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v5)
  {
    id v9 = [(CRLCanvasEditorHelper *)self canvasEditor];
    int64_t v10 = [v9 interactiveCanvasController];
    uint64_t v11 = [v10 layerHost];
    unsigned __int8 v12 = [v11 asiOSCVC];
    if ([v12 allowedToEnterQuickSelectMode])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 1;
    }

    if (v6 && (isKindOfClass & 1) != 0) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = +[CRLCanvasEditor physicalKeyboardIsSender:v8];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)canvasEditorCanPerformDeselectAllAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  unsigned int v7 = [v6 canvasEditorCanDeselectAllWithSender:v5];

  if (v7) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)canvasEditorCanPerformGroupActionWithSender:(id)a3
{
  id v4 = a3;
  if (![(CRLCanvasEditorHelper *)self shouldAllowPotentiallyKeyboardBasedActionForSender:v4])goto LABEL_14; {
  id v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  }
  unsigned __int8 v6 = [v5 documentIsSharedReadOnly];

  if (v6) {
    goto LABEL_14;
  }
  unsigned int v7 = [(CRLCanvasEditorHelper *)self canvasEditor];
  unsigned int v8 = [v7 canvasEditorCanGroupWithSender:v4];

  if (v8)
  {
    id v9 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    int64_t v10 = [v9 selectionModelTranslator];
    uint64_t v11 = [(CRLCanvasEditorHelper *)self canvasEditor];
    unsigned __int8 v12 = [v11 editorController];
    id v13 = [v12 selectionPath];
    BOOL v14 = [v10 boardItemsForSelectionPath:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v27;
      int64_t v19 = 1;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          id v21 = [*(id *)(*((void *)&v26 + 1) + 8 * i) containingGroup:v26];
          uint64_t v22 = v21;
          if (v21)
          {
            uint64_t v23 = [v21 childInfos];
            id v24 = +[NSSet setWithArray:v23];

            LOBYTE(v23) = [v24 isEqualToSet:v15];
            if (v23)
            {

              int64_t v19 = -1;
              goto LABEL_18;
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v19 = 1;
    }
LABEL_18:
  }
  else
  {
LABEL_14:
    int64_t v19 = -1;
  }

  return v19;
}

- (int64_t)canvasEditorCanPerformUngroupActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 documentIsSharedReadOnly];

  if (v6)
  {
    int64_t v7 = -1;
  }
  else
  {
    unsigned int v8 = [(CRLCanvasEditorHelper *)self canvasEditor];
    if ([v8 canvasEditorCanUngroupWithSender:v4]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  return v7;
}

- (int64_t)canvasEditorCanPerformConnectWithConnectionLineAction:(SEL)a3 withSender:(id)a4
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v5 = [v4 canvasEditor];
  unsigned __int8 v6 = [v5 infosToConnect];
  if ([v6 count] == (id)2) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformAlignAction:(SEL)a3 withSender:(id)a4
{
  id v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  if ([v5 documentIsSharedReadOnly])
  {
    int64_t v6 = -1;
  }
  else
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self layoutsForAlignAndDistribute];
    if ((unint64_t)[v7 count] > 1) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = -1;
    }
  }
  return v6;
}

- (int64_t)canvasEditorCanPerformDistributeActionWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  if ([v4 documentIsSharedReadOnly])
  {
    int64_t v5 = -1;
  }
  else
  {
    int64_t v6 = [(CRLCanvasEditorHelper *)self layoutsForAlignAndDistribute];
    if ((unint64_t)[v6 count] > 2) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = -1;
    }
  }
  return v5;
}

- (BOOL)canPerformMaskWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  int64_t v5 = [v4 selectionModelTranslator];
  int64_t v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  int64_t v7 = [v6 editorController];
  unsigned int v8 = [v7 selectionPath];
  id v9 = [v5 boardItemsForSelectionPath:v8];

  if ([v9 count] == (id)1)
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v9 anyObject];
    unsigned __int8 v12 = sub_1002469D0(v10, v11);

    if (v12 && ([v12 locked] & 1) == 0)
    {
      BOOL v14 = +[CRLImageProviderPool sharedPool];
      id v15 = [v12 imageAssetPayload];
      id v16 = [v14 providerForAsset:v15 shouldValidate:1];

      unsigned int v13 = [v16 isError] ^ 1;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)canPerformUnmaskWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  int64_t v5 = [v4 selectionModelTranslator];
  int64_t v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  int64_t v7 = [v6 editorController];
  unsigned int v8 = [v7 selectionPath];
  id v9 = [v5 boardItemsForSelectionPath:v8];

  if ([v9 count] == (id)1)
  {
    uint64_t v10 = [v9 anyObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v10 locked] & 1) == 0) {
      unsigned __int8 v11 = [v10 maskCanBeReset];
    }
    else {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)canPerformMaskWithShapeWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  int64_t v5 = [v4 selectionModelTranslator];
  int64_t v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  int64_t v7 = [v6 editorController];
  unsigned int v8 = [v7 selectionPath];
  id v9 = [v5 boardItemsForSelectionPath:v8];

  if ([v9 count] == (id)2
    && ([v4 hasSelectedInfosInMultipleContainers] & 1) == 0)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = v9;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v27 = 0;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = sub_1002469D0(v17, v16);
          int64_t v19 = v18;
          if (v18 && ([v18 locked] & 1) == 0)
          {
            uint64_t v20 = objc_opt_class();
            id v21 = sub_1002469D0(v20, v16);
            uint64_t v22 = objc_opt_class();
            uint64_t v23 = [v4 repForInfo:v19];
            id v24 = sub_1002469D0(v22, v23);

            if (v21)
            {
              BYTE4(v27) = 1;
            }
            else if (v24)
            {
              LOBYTE(v27) = [v24 canBeUsedForImageMask];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v27 = 0;
    }

    char v10 = BYTE4(v27) & v27;
    id v9 = v26;
  }
  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)canPerformMaskWithShapeTypeWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  int64_t v5 = [v4 selectionModelTranslator];
  int64_t v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  int64_t v7 = [v6 editorController];
  unsigned int v8 = [v7 selectionPath];
  id v9 = [v5 boardItemsForSelectionPath:v8];

  if ([v9 count] == (id)1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v15 = objc_opt_class();
          id v16 = sub_1002469D0(v15, v14);
          uint64_t v17 = v16;
          if (v16 && (objc_msgSend(v16, "locked", (void)v19) & 1) == 0)
          {

            LOBYTE(v11) = 1;
            goto LABEL_14;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (int64_t)canvasEditorCanPerformLockAction:(SEL)a3 withSender:(id)a4
{
  int64_t v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 documentIsSharedReadOnly];

  if (v7) {
    return -1;
  }
  id v9 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v10 = [v9 selectionModelTranslator];
  id v11 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v12 = [v11 editorController];
  id v13 = [v12 selectionPath];
  uint64_t v14 = [v10 boardItemsForSelectionPath:v13];

  [(CRLCanvasEditorHelper *)self drawablesToLockOrUnlockForInfos:v14];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v19);
        uint64_t v21 = objc_opt_class();
        long long v22 = sub_1002469D0(v21, v20);
        uint64_t v23 = v22;
        if (v22
          && ("lock:" == a3) != objc_msgSend(v22, "locked", (void)v25)
          && [v23 isLockable])
        {

          int64_t v8 = 1;
          goto LABEL_15;
        }

        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  int64_t v8 = -1;
LABEL_15:

  return v8;
}

- (BOOL)canUngroupWithSelection:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v5 = [v4 infosOfClass:objc_opt_class()];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([(CRLCanvasEditorHelper *)self canUngroupGroupInfo:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)canUngroupGroupInfo:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isFreehandDrawing] & 1) == 0) {
    unsigned int v5 = [v4 locked] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)canDivideCompoundShape:(id)a3
{
  return 1;
}

- (id)tooltipForMoveToBack
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Move selected objects to the back layer." value:0 table:0];

  return v3;
}

- (id)tooltipForMoveToFront
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Move selected objects to the front layer." value:0 table:0];

  return v3;
}

- (id)tooltipForMoveBackward
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Move selected objects backward one layer." value:0 table:0];

  return v3;
}

- (id)tooltipForMoveForward
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Move selected objects forward one layer." value:0 table:0];

  return v3;
}

- (BOOL)selectionIsEmpty
{
  id v3 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v5 = [v4 selectionModelTranslator];

  id v6 = [v3 editorController];
  id v7 = [v6 selectionPath];
  uint64_t v8 = [v5 infosForSelectionPath:v7];

  LOBYTE(v6) = [v8 count] == 0;
  return (char)v6;
}

- (BOOL)selectionContainsJustUnlockedObjects
{
  id v3 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v5 = [v4 selectionModelTranslator];

  id v6 = [v3 editorController];
  id v7 = [v6 selectionPath];
  uint64_t v8 = [v5 unlockedBoardItemsForSelectionPath:v7];

  id v9 = [v3 editorController];
  BOOL v10 = [v9 selectionPath];
  id v11 = [v5 boardItemsForSelectionPath:v10];

  id v12 = [v8 count];
  BOOL v13 = v12 == [v11 count] && [v8 count] != 0;

  return v13;
}

- (int64_t)canvasEditorCanPerformBringDrawablesForwardActionWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned __int8 v5 = [v4 documentIsSharedReadOnly];

  if (v5) {
    return -1;
  }
  id v7 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v8 = [v7 arrangeInspectorDelegate];
  unsigned int v9 = [v8 canBringDrawablesForward];
  if (([(CRLCanvasEditorHelper *)self selectionContainsJustUnlockedObjects] & v9) != 0) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

- (int64_t)canvasEditorCanPerformSendDrawablesBackwardActionWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned __int8 v5 = [v4 documentIsSharedReadOnly];

  if (v5) {
    return -1;
  }
  id v7 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v8 = [v7 arrangeInspectorDelegate];
  unsigned int v9 = [v8 canSendDrawablesBackward];
  if (([(CRLCanvasEditorHelper *)self selectionContainsJustUnlockedObjects] & v9) != 0) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("cut:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformCutAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("copy:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformCopyAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("delete:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformDeleteAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("paste:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformPasteAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if (sel_isEqual(a3, "duplicate:"))
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformDuplicateAction:a3 withSender:v6];
LABEL_63:
    int64_t v8 = v7;
    goto LABEL_64;
  }
  if ("pasteAsPlainText:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformPasteAsPlainTextAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("pasteValues:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformPasteValuesAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("selectAll:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformSelectAllAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("deselectAll:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformDeselectAllAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("group:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformGroupActionWithSender:v6];
    goto LABEL_63;
  }
  if ("ungroup:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformUngroupActionWithSender:v6];
    goto LABEL_63;
  }
  int64_t v8 = 1;
  if ("zoomIn:" == a3 || "zoomOut:" == a3) {
    goto LABEL_64;
  }
  if ("showMiniFormatterToExitDrawingMode:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:v6];
    goto LABEL_63;
  }
  if ("selectParent:" == a3)
  {
    unsigned int v9 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    BOOL v10 = [v9 topLevelContainerRepForEditing];
    int64_t v8 = v10 != 0;

    goto LABEL_64;
  }
  if ("connectWithConnectionLine:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformConnectWithConnectionLineAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("alignDrawablesByLeftEdge:" == a3
    || "alignDrawablesByRightEdge:" == a3
    || "alignDrawablesByTopEdge:" == a3
    || "alignDrawablesByBottomEdge:" == a3
    || "alignDrawablesByHorizontalCenter:" == a3
    || "alignDrawablesByVerticalCenter:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformAlignAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("distributeDrawablesHorizontally:" == a3
    || "distributeDrawablesVertically:" == a3
    || "distributeDrawablesEvenly:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformDistributeActionWithSender:v6];
    goto LABEL_63;
  }
  if ("bringToFront:" == a3 || "bringForward:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformBringDrawablesForwardActionWithSender:v6];
    goto LABEL_63;
  }
  if ("sendBackward:" == a3 || "sendToBack:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformSendDrawablesBackwardActionWithSender:v6];
    goto LABEL_63;
  }
  if ("mask:" == a3)
  {
    unsigned int v12 = [(CRLCanvasEditorHelper *)self canPerformUnmaskWithSender:v6];
    goto LABEL_73;
  }
  if ("maskWithShape:" == a3)
  {
    unsigned int v12 = [(CRLCanvasEditorHelper *)self canPerformMaskWithShapeWithSender:v6];
    goto LABEL_73;
  }
  if ("maskWithSelection:" == a3)
  {
    if ([(CRLCanvasEditorHelper *)self canPerformMaskWithShapeWithSender:v6]
      || [(CRLCanvasEditorHelper *)self canPerformMaskWithSender:v6])
    {
      int64_t v8 = 1;
    }
    else
    {
      int64_t v8 = -1;
    }
    goto LABEL_64;
  }
  if ("maskWithShapeType:" == a3)
  {
    unsigned int v12 = [(CRLCanvasEditorHelper *)self canPerformMaskWithShapeTypeWithSender:v6];
    goto LABEL_73;
  }
  if ("lock:" == a3 || "unlock:" == a3)
  {
    int64_t v7 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformLockAction:a3 withSender:v6];
    goto LABEL_63;
  }
  if ("scrollCanvasPageUp:" == a3
    || "scrollCanvasPageDown:" == a3
    || "scrollCanvasUp:" == a3
    || "scrollCanvasDown:" == a3
    || "scrollCanvasLeft:" == a3
    || "scrollCanvasRight:" == a3)
  {
    unsigned int v12 = [(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard];
LABEL_73:
    if (v12) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
    goto LABEL_64;
  }
  if ("enterQuickSelectMode:" != a3)
  {
    if ("presentAlignmentTools:" != a3)
    {
      int64_t v8 = 0;
      goto LABEL_64;
    }
    unsigned int v12 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:5];
    goto LABEL_73;
  }
  BOOL v13 = [(CRLCanvasEditorHelper *)self canvasEditor];
  long long v14 = [v13 interactiveCanvasController];
  long long v15 = [v14 layerHost];
  id v16 = [v15 asiOSCVC];

  if ([v16 allowedToEnterQuickSelectMode]) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = -1;
  }

LABEL_64:
  return v8;
}

- (id)topMostContainerForDeletingContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 parentInfo];
  int64_t v7 = sub_1002469D0(v5, v6);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v8 = [v7 childInfos];
    unsigned int v9 = +[NSSet setWithArray:v8];

    BOOL v10 = +[NSSet setWithObject:v4];
    unsigned int v11 = [v9 isEqualToSet:v10];

    if (v11)
    {
      id v12 = [(CRLCanvasEditorHelper *)self topMostContainerForDeletingContainer:v7];
    }
    else
    {
      id v12 = v4;
    }
    id v20 = v12;

    if (v20) {
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  if (v7)
  {
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1310);
    }
    long long v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089F84(v14, (uint64_t)v7, v13);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1330);
    }
    long long v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper topMostContainerForDeletingContainer:]");
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    uint64_t v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1046, 0, "Starting container had a parent info of an unexpected class %{public}@", v19);
  }
  id v20 = v4;
  if (!v20)
  {
LABEL_18:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1350);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089EF0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1370);
    }
    uint64_t v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v21);
    }
    long long v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper topMostContainerForDeletingContainer:]");
    uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1050, 0, "invalid nil value for '%{public}s'", "result");
  }
LABEL_27:

  return v20;
}

- (id)selectionBehaviorForDeletingBoardItems:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self infosToDeleteToDeleteInfos:a3];
  uint64_t v5 = +[NSMutableSet set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = [v11 parentInfo:v26];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v14 = [v11 parentInfo];
          [v5 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] < 2 && objc_msgSend(v5, "count") == (id)1)
  {
    long long v15 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v16 = [v15 delegate];
    id v17 = [v16 selectionModelTranslatorForInteractiveCanvasController:v15];
    uint64_t v18 = [v5 anyObject];
    long long v19 = [v17 selectionPathForNothingSelectedInsideGroup:v18];
  }
  else
  {
    long long v19 = -[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:", 0, (void)v26);
  }
  id v20 = [CRLCommandSelectionBehavior alloc];
  uint64_t v21 = [(CRLCanvasEditorHelper *)self canvasEditor];
  long long v22 = [v21 editorController];
  uint64_t v23 = [v22 selectionPath];
  id v24 = [(CRLCommandSelectionBehavior *)v20 initWithForwardSelectionPath:v19 reverseSelectionPath:v23 selectionFlags:4];

  return v24;
}

- (id)boardItemsToDelete
{
  v2 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v3 = [v2 selectionModelTranslator];
  id v4 = [v2 editorController];
  uint64_t v5 = [v4 selectionPath];
  id v6 = [v3 unlockedBoardItemsForSelectionPath:v5];

  return v6;
}

- (void)perform_delete
{
  id v3 = [(CRLCanvasEditorHelper *)self boardItemsToDelete];
  [(CRLCanvasEditorHelper *)self perform_deleteBoardItems:v3];
}

- (void)perform_deleteBoardItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v6 = [v5 commandController];

  id v7 = [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:v4 shouldRemoveEmptyContainers:1];
  if (v7)
  {
    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1390);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A06C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E13B0);
      }
      id v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper perform_deleteBoardItems:]");
      BOOL v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1106 isFatal:0 description:"can't delete without a command controller"];
    }
    unsigned int v11 = +[NSMutableArray array];
    id v12 = +[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:v4];
    int v13 = [(CRLCanvasEditorHelper *)self editingCoordinator];
    long long v14 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    long long v15 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v12 infosToRemove:v4 editingCoordinator:v13 withIcc:v14];

    if ([v15 count]) {
      [v11 addObjectsFromArray:v15];
    }
    [v11 addObject:v7];
    id v16 = [(CRLCanvasEditorHelper *)self selectionBehaviorForDeletingBoardItems:v4];
    id v17 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v11];
    [v6 enqueueCommand:v17 withSelectionBehavior:v16];
  }
}

- (void)delete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLCanvasEditorHelper *)self canvasEditor];
  unsigned int v6 = [v5 canvasEditorCanDeleteWithSender:v4];

  if (v6)
  {
    id v7 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v8 = [v7 editingCoordinator];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001E9C78;
    v9[3] = &unk_1014CE260;
    v9[4] = self;
    [v8 canPerformUserActionUsingBlock:v9];
  }
}

- (void)p_copy:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditorHelper *)self canvasEditor];
  [v5 copy:v4];
}

- (void)cut:(id)a3
{
  id v10 = a3;
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  unsigned int v5 = [v4 canvasEditorCanCutWithSender:v10];

  if (v5)
  {
    unsigned int v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v7 = [v6 commandController];

    [v7 openGroup];
    id v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"Cut" value:0 table:@"UndoStrings"];
    [v7 setCurrentGroupActionString:v9];

    [(CRLCanvasEditorHelper *)self p_copy:v10];
    [(CRLCanvasEditorHelper *)self perform_delete];
    [v7 closeGroup];
  }
}

- (void)paste:(id)a3
{
  id v12 = a3;
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  if ([v4 canvasEditorCanPasteWithSender:v12])
  {
    unsigned int v5 = [v4 interactiveCanvasController];
    unsigned int v6 = [v5 topLevelContainerRepForEditing];

    if (v6)
    {
      id v7 = [v4 selectionPathWithInfos:0];
      id v8 = [v4 editorController];
      [v8 setSelectionPath:v7];
    }
    uint64_t v9 = +[CRLPasteboard generalPasteboard];
    id v10 = [v4 editorController];
    unsigned int v11 = [v10 selectionPath];
    [v4 pasteWithPasteboard:v9 selectionPath:v11 forceMatchStyle:0 sender:v12];
  }
}

- (void)pasteAsPlainText:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v6 = [v5 editingCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001EA084;
  v8[3] = &unk_1014E13D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 canPerformUserActionUsingBlock:v8];
}

- (void)pasteValues:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v6 = [v5 editingCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001EA204;
  v8[3] = &unk_1014E13D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 canPerformUserActionUsingBlock:v8];
}

- (void)duplicate:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v6 = [v5 editingCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001EA384;
  v8[3] = &unk_1014E13D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 canPerformUserActionUsingBlock:v8];
}

- (void)deselectAll:(id)a3
{
  id v6 = [(CRLCanvasEditorHelper *)self selectionPathWithInfos:0];
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  unsigned int v5 = [v4 editorController];
  [v5 setSelectionPath:v6];
}

- (void)p_setLockStatusOfSelectedDrawables:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v6 = [v5 commandController];

  id v7 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v8 = [v7 infosForCurrentSelectionPath];

  id v9 = [(CRLCanvasEditorHelper *)self drawablesToLockOrUnlockForInfos:v8];
  id v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v11 = [v10 editorController];
  id v12 = [v11 selectionPath];

  if (v3 || (id v13 = [v9 count], v13 != objc_msgSend(v8, "count")))
  {
    long long v14 = [(CRLCanvasEditorHelper *)self canvasEditor];
    uint64_t v15 = [v14 selectionPathWithInfos:v9];

    id v12 = (void *)v15;
  }
  id v16 = [CRLCommandSelectionBehavior alloc];
  id v17 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v18 = [v17 editorController];
  long long v19 = [v18 selectionPath];
  id v20 = [(CRLCommandSelectionBehavior *)v16 initWithForwardSelectionPath:v12 reverseSelectionPath:v19 selectionFlags:1024];

  [v6 openGroupWithSelectionBehavior:v20];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v9;
  id v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
  uint64_t v23 = v21;
  if (!v22) {
    goto LABEL_21;
  }
  id v24 = v22;
  long long v36 = v12;
  char v25 = 0;
  uint64_t v26 = *(void *)v38;
  do
  {
    for (i = 0; i != v24; i = (char *)i + 1)
    {
      if (*(void *)v38 != v26) {
        objc_enumerationMutation(v21);
      }
      long long v28 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      uint64_t v29 = objc_opt_class();
      long long v30 = sub_1002469D0(v29, v28);
      long long v31 = v30;
      if (v30 && ([v30 isLockable] & 1) != 0
        || !v3 && [v31 locked])
      {
        __int16 v32 = [[_TtC8Freeform19CRLCommandSetLocked alloc] initWithBoardItem:v31 locked:v3];
        [v6 enqueueCommand:v32];

        char v25 = 1;
      }
    }
    id v24 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v24);

  id v12 = v36;
  if (v25)
  {
    v33 = +[NSBundle mainBundle];
    id v34 = v33;
    if (v3) {
      CFStringRef v35 = @"Lock";
    }
    else {
      CFStringRef v35 = @"Unlock";
    }
    uint64_t v23 = [v33 localizedStringForKey:v35 value:0 table:@"UndoStrings"];

    [v6 setCurrentGroupActionString:v23];
LABEL_21:
  }
  [v6 closeGroup];
}

- (void)lock:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v5 = [v4 delegate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001EAABC;
  v15[3] = &unk_1014CBE78;
  v15[4] = v4;
  v15[5] = self;
  id v6 = objc_retainBlock(v15);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v4 selectionModelTranslator];
    id v8 = [(CRLCanvasEditorHelper *)self canvasEditor];
    id v9 = [v8 editorController];
    id v10 = [v9 selectionPath];
    unsigned int v11 = [v7 boardItemsForSelectionPath:v10];
    id v12 = [(CRLCanvasEditorHelper *)self drawablesToLockOrUnlockForInfos:v11];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001EAAFC;
    v13[3] = &unk_1014CE158;
    long long v14 = v6;
    [v5 interactiveCanvasController:v4 didRequestToLockSelectedCanvasElements:v12 animated:1 completionQueue:0 completionHandler:v13];
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)unlock:(id)a3
{
}

- (id)drawablesToLockOrUnlockForInfos:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)p_commandsToPrepareForGroupingBoardItems:(id)a3 infosToAdjustForConnectionLines:(id)a4
{
  id v6 = a4;
  id v7 = +[NSMutableSet setWithArray:a3];
  id v8 = [(CRLCanvasEditorHelper *)self editingCoordinator];
  id v9 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v10 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v6 infosToRemove:v7 editingCoordinator:v8 withIcc:v9];

  return v10;
}

- (id)p_commandsForGroupingBoardItems:(id)a3 outNewGroup:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  uint64_t v7 = +[CRLGroupItem groupGeometryFromChildrenInfos:v5];
  id v8 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v9 = [v8 editingCoordinator];
  id v10 = [v9 boardItemFactory];
  long long v39 = (void *)v7;
  unsigned int v11 = [v10 makeGroupItemWithGeometry:v7];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v12 = v5;
  uint64_t v13 = (uint64_t)[v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v46 + 1) + 8 * i) aspectRatioLocked])
        {
          uint64_t v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v13 = (uint64_t)[v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v11 setAspectRatioLocked:v13];
  uint64_t v16 = objc_opt_class();
  id v17 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v18 = [v17 topLevelContainerInfoForEditing];
  long long v19 = sub_1002469D0(v16, v18);

  if (!v19)
  {
    id v20 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v21 = [v20 board];
    long long v19 = [v21 rootContainer];
  }
  id v22 = [v19 childInfos];
  uint64_t v23 = [v12 lastObject];
  id v24 = [v22 indexOfObject:v23];

  if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    char v25 = [v19 childInfos];
    id v24 = [v25 count];
  }
  long long v38 = v19;
  long long v37 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v19 boardItem:v11 index:v24];
  [v6 addObject:];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v12;
  id v26 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(obj);
        }
        long long v30 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
        long long v31 = [v30 geometry];
        __int16 v32 = [v11 geometry];
        v33 = [v31 geometryRelativeToGeometry:v32];

        id v34 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v30 geometry:v33];
        [v6 addObject:v34];
        CFStringRef v35 = [[_TtC8Freeform28CRLCommandReparentBoardItems alloc] initWithDestinationContainer:v11 boardItem:v30];
        [v6 addObject:v35];
      }
      id v27 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v27);
  }

  if (a4) {
    *a4 = v11;
  }

  return v6;
}

- (void)group:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  long long v42 = [v4 commandController];
  id v5 = [v4 selectionModelTranslator];
  id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v7 = [v6 editorController];
  id v8 = [v7 selectionPath];
  id v9 = [v5 unlockedBoardItemsForSelectionPath:v8];

  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * (void)v15);
        id v17 = [(CRLCanvasEditorHelper *)self canvasEditor];
        unsigned int v18 = [v17 canGroupBoardItem:v16];

        if (v18) {
          [v10 addObject:v16];
        }
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v13);
  }

  long long v19 = [v4 topLevelZOrderedSiblingsOfInfos:v10];
  uint64_t v20 = [v19 crl_arrayWithObjectsInSet:v10];

  [v42 openGroup];
  [v42 enableProgressiveEnqueuingInCurrentGroup];
  id v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"Group" value:0 table:@"UndoStrings"];
  [v42 setCurrentGroupActionString:v22];

  id v23 = objc_alloc_init((Class)NSMapTable);
  id v24 = objc_alloc_init((Class)NSMapTable);
  v41 = [v4 topLevelZOrderedSiblingsOfInfos:v10];
  id v49 = v24;
  id v50 = v23;
  [(CRLCanvasEditorHelper *)self p_getMagnetUnscaledPositionsFromInfos:v41 withAffectedInfos:v10 withClineHeadMagnets:&v50 withClineTailMagnets:&v49];
  id v37 = v50;

  id v36 = v49;
  char v25 = +[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:v10];
  long long v39 = (void *)v20;
  long long v40 = [(CRLCanvasEditorHelper *)self p_commandsToPrepareForGroupingBoardItems:v20 infosToAdjustForConnectionLines:v25];

  id v26 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  [(CRLCommandGroup *)v26 addCommands:v40];
  [v42 enqueueCommand:v26];
  id v48 = 0;
  CFStringRef v35 = [(CRLCanvasEditorHelper *)self p_commandsForGroupingBoardItems:v20 outNewGroup:&v48];
  id v27 = v48;
  uint64_t v28 = [CRLCanvasCommandSelectionBehavior alloc];
  [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v29 = v38 = v4;
  long long v30 = +[NSSet setWithObject:v27];
  long long v31 = [(CRLCanvasCommandSelectionBehavior *)v28 initWithCanvasEditor:v29 type:3 constructedInfos:v30];

  __int16 v32 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  [(CRLCommandGroup *)v32 addCommands:v35];
  [v42 enqueueCommand:v32];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001EB490;
  v43[3] = &unk_1014E1400;
  id v44 = v37;
  long long v45 = self;
  long long v46 = v42;
  id v47 = v36;
  id v33 = v36;
  id v34 = v37;
  [v27 withTemporaryLayoutPerform:v43];
  [v42 closeGroupWithSelectionBehavior:v31];
}

- (void)p_getMagnetUnscaledPositionsFromInfos:(id)a3 withAffectedInfos:(id)a4 withClineHeadMagnets:(id *)a5 withClineTailMagnets:(id *)a6
{
  id v37 = a5;
  id v7 = a3;
  id v8 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v44;
    uint64_t v39 = *(void *)v44;
    do
    {
      id v12 = 0;
      id v40 = v10;
      do
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = sub_1002469D0(v14, v13);
          uint64_t v16 = [v15 connectionLinePathSource];
          unsigned int v17 = [v8 containsObject:v15];
          unsigned int v18 = [(CRLCanvasEditorHelper *)self editingCoordinator];
          long long v19 = [v18 mainBoard];
          uint64_t v20 = [v15 getConnectedToWithBoardItemOwner:v19];

          unsigned int v21 = [v8 containsObject:v20];
          id v22 = [(CRLCanvasEditorHelper *)self editingCoordinator];
          id v23 = [v22 mainBoard];
          id v24 = [v15 getConnectedFromWithBoardItemOwner:v23];

          unsigned int v25 = [v8 containsObject:v24];
          unsigned int v26 = v25;
          if (v17)
          {
            if (v20) {
              int v27 = v21;
            }
            else {
              int v27 = 1;
            }
            if (((v27 | v25) & 1) != 0 || !v24) {
              goto LABEL_24;
            }
          }
          else if (v21 & v25)
          {
LABEL_24:

            uint64_t v11 = v39;
            id v10 = v40;
            goto LABEL_25;
          }
          uint64_t v28 = [v16 headMagnet:v37];
          if (v28) {
            unsigned int v29 = v21;
          }
          else {
            unsigned int v29 = 0;
          }

          if (v29 == 1)
          {
            id v30 = *v37;
            long long v31 = [v16 headMagnet];
            __int16 v32 = [(CRLCanvasEditorHelper *)self p_getMagnetUnscaledPositionValueForMagnet:v31 withConnectedItem:v20];
            [v30 setObject:v32 forKey:v15];
          }
          id v33 = [v16 tailMagnet];
          if (!v33) {
            unsigned int v26 = 0;
          }

          if (v26 == 1)
          {
            id v34 = *a6;
            CFStringRef v35 = [v16 tailMagnet];
            id v36 = [(CRLCanvasEditorHelper *)self p_getMagnetUnscaledPositionValueForMagnet:v35 withConnectedItem:v24];
            [v34 setObject:v36 forKey:v15];
          }
          goto LABEL_24;
        }
LABEL_25:
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v10);
  }
}

- (id)p_getMagnetUnscaledPositionValueForMagnet:(id)a3 withConnectedItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v9 = [v8 layoutForInfo:v6];

  [v7 magnetNormalizedPosition];
  long long v19 = v11;
  long long v20 = v10;

  id v12 = [v9 pureGeometry];
  id v13 = v12;
  if (v12)
  {
    [v12 fullTransform:v19, v20];
    float64x2_t v14 = v22;
    float64x2_t v15 = v23;
    float64x2_t v16 = v24;
  }
  else
  {
    float64x2_t v16 = 0uLL;
    float64x2_t v14 = 0uLL;
    float64x2_t v15 = 0uLL;
  }
  float64x2_t v21 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, *(double *)&v19), v14, *(double *)&v20));

  unsigned int v17 = +[NSValue valueWithCGPoint:*(_OWORD *)&v21];

  return v17;
}

- (id)p_commandForUpdatingMagnetAfterGroupingForCline:(id)a3 withPosition:(id)a4 withGroupLayout:(id)a5 forMagnet:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  [a4 CGPointValue];
  double v30 = v11;
  double v31 = v13;
  if (v10) {
    [v10 pureTransformInRoot:v11, v12];
  }
  else {
    memset(&v33, 0, sizeof(v33));
  }
  CGAffineTransformInvert(&v34, &v33);
  float64x2_t v32 = vaddq_f64(*(float64x2_t *)&v34.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v34.c, v30), *(float64x2_t *)&v34.a, v31));
  float64x2_t v14 = [v10 pureGeometry];
  [v14 size];
  double v15 = sub_100064070();
  double v18 = sub_100066AA4(v32.f64[0], v32.f64[1], v15, v16, v17);
  double v20 = v19;

  float64x2_t v21 = [v9 connectionLinePathSource];
  id v22 = [v21 copy];

  float64x2_t v23 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", 7, v18, v20);
  if (v6)
  {
    [v22 setHeadMagnet:v23];
    uint64_t v24 = 1;
  }
  else
  {
    [v22 setTailMagnet:v23];
    uint64_t v24 = 0;
  }

  uint64_t v25 = objc_opt_class();
  unsigned int v26 = [v10 info];
  int v27 = sub_1002469D0(v25, v26);

  uint64_t v28 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v9 connectedItem:v27 chirality:v24 pathSource:v22];

  return v28;
}

- (id)commandsForUngrouping:(id)a3 objectsToSelect:(id)a4
{
  id v5 = a3;
  id v45 = a4;
  id v47 = v5;
  BOOL v6 = [v5 childItems];
  long long v46 = [v6 crl_arrayOfObjectsPassingTest:&stru_1014E1420];

  if ([v46 count])
  {
    id v7 = +[NSMutableArray array];
    [v45 addObjectsFromArray:v46];
    memset(&v75, 0, sizeof(v75));
    if (v5) {
      [v5 transformInRoot];
    }
    uint64_t v8 = objc_opt_class();
    id v9 = [v47 parentInfo];
    id v48 = sub_1002469D0(v8, v9);

    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x5010000000;
    v71 = "";
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1001EC5B4;
    v67[3] = &unk_1014D60A8;
    v67[4] = &v68;
    [v47 withTemporaryLayoutPerform:v67];
    id v10 = (objc_class *)objc_opt_class();
    double v11 = [v47 parentItem];
    id v50 = sub_10024715C(v10, v11);

    uint64_t v12 = [v50 childInfos];
    id v13 = [v12 indexOfObject:v47];

    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      float64x2_t v14 = [v50 childInfos];
      id v13 = [v14 count];
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    double v15 = [v46 reverseObjectEnumerator];
    id v16 = [v15 countByEnumeratingWithState:&v63 objects:v77 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v64;
      id obj = v15;
      do
      {
        double v18 = 0;
        do
        {
          if (*(void *)v64 != v17) {
            objc_enumerationMutation(obj);
          }
          double v19 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v18);
          double v20 = [v19 geometry];
          if (v19
            && [v19 wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent]
            && ([v19 supportsParentRotation] & 1) == 0)
          {
            uint64_t v25 = [v19 geometry];
            unsigned int v26 = v25;
            if (v25) {
              [v25 transform];
            }
            else {
              memset(v62, 0, sizeof(v62));
            }
            BOOL v27 = sub_10007F7EC((double *)v62);
            CGAffineTransform t2 = v75;
            uint64_t v28 = +[CRLCounterRotateInfo infoGeometryForTransformInRoot:&t2 isChildFlipped:v27];

            memset(&t2, 0, sizeof(t2));
            if (v28) {
              [v28 transform];
            }
            else {
              memset(&v61, 0, sizeof(v61));
            }
            CGAffineTransform v60 = v75;
            CGAffineTransformConcat(&t2, &v61, &v60);
            memset(&v60, 0, sizeof(v60));
            if (v20) {
              [v20 fullTransform];
            }
            else {
              memset(&v59, 0, sizeof(v59));
            }
            CGAffineTransform v58 = t2;
            CGAffineTransformConcat(&v60, &v59, &v58);
            CGAffineTransform v58 = v60;
            if (v48)
            {
              memset(&v57, 0, sizeof(v57));
              [v48 transformInRoot];
              CGAffineTransform v56 = v57;
              unsigned int v29 = +[CRLCounterRotateInfo infoGeometryForTransformInRoot:&v56 isChildFlipped:0];
              double v30 = v29;
              memset(&v56, 0, sizeof(v56));
              if (v29) {
                [v29 transform];
              }
              else {
                memset(&v55, 0, sizeof(v55));
              }
              CGAffineTransform v54 = v57;
              CGAffineTransformConcat(&v56, &v55, &v54);
              CGAffineTransform v54 = v56;
              CGAffineTransformInvert(&v53, &v54);
              CGAffineTransform v54 = v60;
              CGAffineTransformConcat(&v58, &v54, &v53);
            }
            id v31 = [v20 widthValid];
            id v32 = [v20 heightValid];
            CGAffineTransform v57 = v58;
            id v22 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v57 widthValid:v31 heightValid:v32];
          }
          else
          {
            if (v20) {
              [v20 fullTransform];
            }
            else {
              memset(&t1, 0, sizeof(t1));
            }
            long long v21 = *((_OWORD *)v69 + 3);
            *(_OWORD *)&t2.a = *((_OWORD *)v69 + 2);
            *(_OWORD *)&t2.c = v21;
            *(_OWORD *)&t2.tx = *((_OWORD *)v69 + 4);
            CGAffineTransformConcat(&v52, &t1, &t2);
            id v22 = +[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v52, [v20 widthValid], objc_msgSend(v20, "heightValid"));
          }
          float64x2_t v23 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v19 geometry:v22];
          [v7 addObject:v23];
          uint64_t v24 = [[_TtC8Freeform28CRLCommandReparentBoardItems alloc] initWithDestinationContainer:v50 boardItem:v19 index:v13];
          [v7 addObject:v24];

          double v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        double v15 = obj;
        id v33 = [obj countByEnumeratingWithState:&v63 objects:v77 count:16];
        id v16 = v33;
      }
      while (v33);
    }

    CGAffineTransform v34 = +[NSSet setWithObject:v47];
    CFStringRef v35 = [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:v34 shouldRemoveEmptyContainers:0];

    if (v35)
    {
      [v7 addObject:v35];
    }
    else
    {
      int v38 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1440);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A0F4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1460);
      }
      uint64_t v39 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
      {
        id v40 = +[CRLAssertionHandler packedBacktraceString];
        sub_10106CDAC(v40, (uint8_t *)&t2, v38, (os_log_t)v39);
      }

      v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandsForUngrouping:objectsToSelect:]");
      long long v42 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 1574, 0, "invalid nil value for '%{public}s'", "delCommand");
    }
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    id v36 = +[NSSet setWithObject:v5];
    id v37 = [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:v36 shouldRemoveEmptyContainers:1];
    v78 = v37;
    id v7 = +[NSArray arrayWithObjects:&v78 count:1];
  }

  return v7;
}

- (void)ungroup:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  v80 = [v4 commandController];
  if (!v80)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1480);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A188();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E14A0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper ungroup:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1585 isFatal:0 description:"can't ungroup without a command controller"];
  }
  uint64_t v8 = [v4 selectionModelTranslator];
  id v9 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v10 = [v9 editorController];
  double v11 = [v10 selectionPath];
  v77 = [v8 boardItemsForSelectionPath:v11];

  uint64_t v12 = [v4 selectionModelTranslator];
  id v13 = [(CRLCanvasEditorHelper *)self canvasEditor];
  float64x2_t v14 = [v13 editorController];
  double v15 = [v14 selectionPath];
  uint64_t v16 = [v12 unlockedBoardItemsForSelectionPath:v15];

  uint64_t v17 = +[NSMutableSet set];
  v82 = +[NSMutableArray array];
  double v18 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  double v19 = +[NSBundle mainBundle];
  double v20 = [v19 localizedStringForKey:@"Ungroup" value:0 table:@"UndoStrings"];
  v81 = v18;
  [(CRLCommandGroup *)v18 setActionString:v20];

  long long v21 = [v4 topLevelZOrderedSiblingsOfInfos:v16];
  id v22 = [v21 crl_arrayWithObjectsInSet:v16];

  v85 = +[NSMutableSet set];
  v83 = v22;
  id v23 = [v22 count];
  if ((uint64_t)v23 - 1 >= 0)
  {
    uint64_t v24 = (uint64_t)v23;
    do
    {
      --v24;
      uint64_t v25 = objc_opt_class();
      unsigned int v26 = [v83 objectAtIndexedSubscript:v24];
      BOOL v27 = sub_1002469D0(v25, v26);

      if ([(CRLCanvasEditorHelper *)self canUngroupGroupInfo:v27])
      {
        uint64_t v28 = [(CRLCanvasEditorHelper *)self commandsForUngrouping:v27 objectsToSelect:v17];
        [v82 addObjectsFromArray:v28];

        [v85 addObject:v27];
      }
    }
    while (v24 > 0);
  }
  id v29 = objc_alloc_init((Class)NSMapTable);
  id v30 = objc_alloc_init((Class)NSMapTable);
  [v4 topLevelZOrderedSiblingsOfInfos:v16];
  id v102 = v30;
  CGAffineTransform v75 = v103 = v29;
  -[CRLCanvasEditorHelper p_getMagnetUnscaledPositionsFromInfos:withAffectedInfos:withClineHeadMagnets:withClineTailMagnets:](self, "p_getMagnetUnscaledPositionsFromInfos:withAffectedInfos:withClineHeadMagnets:withClineTailMagnets:");
  id v84 = v103;

  id v31 = v102;
  uint64_t v32 = +[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:v85];
  id v33 = [(CRLCanvasEditorHelper *)self editingCoordinator];
  [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  CGAffineTransform v34 = v79 = (void *)v17;
  long long v74 = (void *)v32;
  uint64_t v35 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v32 infosToRemove:v85 editingCoordinator:v33 withIcc:v34];

  long long v72 = (void *)v35;
  [(CRLCommandGroup *)v81 addCommands:v35];
  [(CRLCommandGroup *)v81 addCommands:v82];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v36 = v77;
  id v37 = [v36 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v38; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v99 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v98 + 1) + 8 * i);
        if (([v85 containsObject:v41] & 1) == 0) {
          [v79 addObject:v41];
        }
      }
      id v38 = [v36 countByEnumeratingWithState:&v98 objects:v107 count:16];
    }
    while (v38);
  }

  id v42 = [v79 count];
  long long v43 = [CRLCanvasCommandSelectionBehavior alloc];
  long long v44 = [(CRLCanvasEditorHelper *)self canvasEditor];
  if (v42) {
    id v45 = [(CRLCanvasCommandSelectionBehavior *)v43 initWithCanvasEditor:v44 type:3 constructedInfos:v79];
  }
  else {
    id v45 = [(CRLCanvasCommandSelectionBehavior *)v43 initWithCanvasEditor:v44 type:1];
  }
  long long v46 = v45;
  long long v73 = v36;
  v76 = (void *)v16;

  [v80 openGroupWithSelectionBehavior:v46];
  [v80 enableProgressiveEnqueuingInCurrentGroup];
  v71 = v46;
  [v80 enqueueCommand:v81 withSelectionBehavior:v46];
  v78 = v4;
  [v4 layoutIfNeeded];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v47 = [v84 keyEnumerator];
  id v48 = [v47 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v95;
    long long v51 = &__NSArray0__struct;
    do
    {
      CGAffineTransform v52 = 0;
      CGAffineTransform v53 = v51;
      do
      {
        if (*(void *)v95 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v54 = *(void *)(*((void *)&v94 + 1) + 8 * (void)v52);
        CGAffineTransform v55 = [v84 objectForKey:v54];
        CGAffineTransform v56 = [(CRLCanvasEditorHelper *)self p_commandForUpdatingMagnetAfterUngroupingForCline:v54 withPosition:v55 forMagnet:1];
        long long v51 = [v53 arrayByAddingObjectsFromArray:v56];

        CGAffineTransform v52 = (char *)v52 + 1;
        CGAffineTransform v53 = v51;
      }
      while (v49 != v52);
      id v49 = [v47 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v49);
  }
  else
  {
    long long v51 = &__NSArray0__struct;
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  CGAffineTransform v57 = [v31 keyEnumerator];
  id v58 = [v57 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v91;
    do
    {
      CGAffineTransform v61 = 0;
      v62 = v51;
      do
      {
        if (*(void *)v91 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v63 = *(void *)(*((void *)&v90 + 1) + 8 * (void)v61);
        long long v64 = [v31 objectForKey:v63];
        long long v65 = [(CRLCanvasEditorHelper *)self p_commandForUpdatingMagnetAfterUngroupingForCline:v63 withPosition:v64 forMagnet:0];
        long long v51 = [v62 arrayByAddingObjectsFromArray:v65];

        CGAffineTransform v61 = (char *)v61 + 1;
        v62 = v51;
      }
      while (v59 != v61);
      id v59 = [v57 countByEnumeratingWithState:&v90 objects:v105 count:16];
    }
    while (v59);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v66 = v51;
  id v67 = [v66 countByEnumeratingWithState:&v86 objects:v104 count:16];
  if (v67)
  {
    id v68 = v67;
    uint64_t v69 = *(void *)v87;
    do
    {
      for (j = 0; j != v68; j = (char *)j + 1)
      {
        if (*(void *)v87 != v69) {
          objc_enumerationMutation(v66);
        }
        [v80 enqueueCommand:*(void *)(*((void *)&v86 + 1) + 8 * (void)j)];
      }
      id v68 = [v66 countByEnumeratingWithState:&v86 objects:v104 count:16];
    }
    while (v68);
  }

  [v80 closeGroup];
}

- (id)p_commandForUpdatingMagnetAfterUngroupingForCline:(id)a3 withPosition:(id)a4 forMagnet:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v13 = [v12 layoutForInfo:v8];
  float64x2_t v14 = sub_1002469D0(v11, v13);

  if (v5) {
    uint64_t v15 = 11;
  }
  else {
    uint64_t v15 = 10;
  }
  [v9 CGPointValue];
  double v43 = v17;
  double v44 = v16;

  double v18 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1001ED374;
  v48[3] = &unk_1014E14C8;
  id v19 = v14;
  id v49 = v19;
  uint64_t v50 = v15;
  double v20 = [v18 hitRep:v48 passingTest:v44];

  if (v20)
  {
    uint64_t v21 = [v20 repForSelecting];
    if (v21)
    {
      id v22 = (void *)v21;
      id v23 = [v20 repForSelecting];
      uint64_t v24 = [v23 layout];

      if (v24)
      {
        uint64_t v25 = [v20 repForSelecting];
        unsigned int v26 = [v25 layout];

        if (v26) {
          [v26 pureTransformInRoot];
        }
        else {
          memset(&v46, 0, sizeof(v46));
        }
        CGAffineTransformInvert(&v47, &v46);
        float64x2_t v45 = vaddq_f64(*(float64x2_t *)&v47.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47.c, v43), *(float64x2_t *)&v47.a, v44));
        BOOL v27 = [v26 pureGeometry];
        [v27 size];
        double v28 = sub_100064070();
        double v31 = sub_100066AA4(v45.f64[0], v45.f64[1], v28, v29, v30);
        double v33 = v32;

        CGAffineTransform v34 = [v8 connectionLinePathSource];
        id v35 = [v34 copy];

        id v36 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", 7, v31, v33);
        if (v5)
        {
          [v35 setHeadMagnet:v36];
          uint64_t v37 = 1;
        }
        else
        {
          [v35 setTailMagnet:v36];
          uint64_t v37 = 0;
        }

        uint64_t v38 = objc_opt_class();
        uint64_t v39 = [v26 info];
        id v40 = sub_1002469D0(v38, v39);

        uint64_t v41 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v8 connectedItem:v40 chirality:v37 pathSource:v35];
        [v10 addObject:v41];
      }
    }
  }

  return v10;
}

- (BOOL)canGroupBoardItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasEditorHelper *)self canvasEditor];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        float64x2_t v14 = [v13 parentInfo:(void)v19];

        if (v14)
        {
          uint64_t v15 = [v13 parentInfo];
          double v16 = v15;
          if (v10)
          {

            if (v10 != v16) {
              goto LABEL_17;
            }
          }
          else
          {
            id v10 = v15;
          }
        }
        else
        {
          char v9 = 1;
          if (v10) {
            goto LABEL_17;
          }
        }
        if (![v5 canGroupBoardItem:v13])
        {
LABEL_17:
          char v17 = 0;
          goto LABEL_19;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      char v17 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v9 = 0;
    id v10 = 0;
    char v17 = 1;
  }
LABEL_19:

  return v17 & (v9 ^ 1 | (v10 == 0));
}

- (BOOL)canInsertBoardItems:(id)a3 intoGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CRLCanvasEditorHelper *)self canGroupBoardItems:v6])
  {
    unsigned int v8 = [v7 isFreehandDrawing];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          float64x2_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (v8)
          {
            if (([v14 isAllowedInFreehandDrawings] & 1) == 0) {
              goto LABEL_19;
            }
          }
          else if ((objc_msgSend(v14, "supportsParentRotation", (void)v23) & 1) == 0 && v7)
          {
            while (1)
            {
              uint64_t v15 = [v7 geometry];
              [v15 angle];
              double v17 = v16;

              if (v17 != 0.0 && fabs(v17) >= 0.00999999978) {
                break;
              }
              uint64_t v18 = objc_opt_class();
              long long v19 = [v7 parentInfo];
              uint64_t v20 = sub_1002469D0(v18, v19);

              id v7 = (id)v20;
              if (!v20) {
                goto LABEL_15;
              }
            }
LABEL_19:
            BOOL v21 = 0;
            goto LABEL_21;
          }
LABEL_15:
          ;
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        BOOL v21 = 1;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v21 = 1;
    }
LABEL_21:
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)selectParent:(id)a3
{
  id v9 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  BOOL v5 = [v9 topLevelContainerRepForEditing];
  id v6 = [v5 info];
  id v7 = [v4 selectionPathWithInfo:v6];
  unsigned int v8 = [v9 editorController];
  [v8 setSelectionPath:v7];
}

- (int64_t)canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  BOOL v5 = [v4 freehandDrawingToolkit];
  unsigned int v6 = [v5 isLassoAbleToSelectMixedType];

  if (!v6) {
    return -1;
  }
  id v7 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v8 = [v7 freehandDrawingToolkit];
  if ([v8 isInDrawingMode])
  {
    id v9 = [v7 editorController];
    id v10 = [v9 selectionPath];

    id v11 = [v7 selectionModelTranslator];
    uint64_t v12 = [v11 boardItemsForSelectionPath:v10];

    if ([v12 count])
    {
      id v13 = +[NSMutableArray array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v26 = v12;
      float64x2_t v14 = [v12 allObjects];
      id v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v19 isMemberOfClass:objc_opt_class()])
            {
              uint64_t v20 = objc_opt_class();
              BOOL v21 = sub_1002469D0(v20, v19);
              long long v22 = [v21 allNestedChildrenItemsExcludingGroups];
              [v13 addObjectsFromArray:v22];
            }
            else
            {
              [v13 addObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v16);
      }

      long long v23 = [v13 crl_arrayByTransformingWithBlock:&stru_1014E1508];
      if ([v23 count]) {
        int64_t v24 = -1;
      }
      else {
        int64_t v24 = 1;
      }

      uint64_t v12 = v26;
    }
    else
    {
      int64_t v24 = -1;
    }
  }
  else
  {
    int64_t v24 = -1;
  }

  return v24;
}

- (void)showMiniFormatterToExitDrawingMode:(id)a3
{
  id v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v3 = [v12 layerHost];
  id v4 = [v3 asiOSCVC];

  BOOL v5 = [v4 delegate];
  unsigned int v6 = [v5 currentDocumentMode];

  uint64_t v7 = objc_opt_class();
  unsigned int v8 = sub_1002469D0(v7, v6);
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 boardViewController];
    id v11 = [v10 documentModeController];
    [v11 resetToDefaultModeAnimated:1];
  }
}

- (void)mask
{
  id v20 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v3 = objc_opt_class();
  id v4 = [v20 selectionModelTranslator];
  BOOL v5 = [v20 editorController];
  unsigned int v6 = [v5 selectionPath];
  uint64_t v7 = [v4 unlockedBoardItemsForSelectionPath:v6];
  unsigned int v8 = [v7 anyObject];
  id v9 = sub_1002469D0(v3, v8);

  id v10 = [v9 maskInfo];

  if (!v10)
  {
    id v11 = [CRLCanvasCommandSelectionBehavior alloc];
    id v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v13 = [v12 canvasEditor];
    float64x2_t v14 = [(CRLCanvasCommandSelectionBehavior *)v11 initWithCanvasEditor:v13];

    id v15 = [v9 defaultMaskInfo];
    id v16 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v9 maskInfo:v15];
    uint64_t v17 = [v20 commandController];
    [v17 enqueueCommand:v16 withSelectionBehavior:v14];
  }
  uint64_t v18 = [v20 repForInfo:v9];
  long long v19 = [v18 imageLayout];
  if (([v19 isInMaskEditMode] & 1) == 0) {
    [v18 editMaskWithHUD:1];
  }
}

- (void)maskWithShape
{
  uint64_t v3 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [v3 selectionModelTranslator];
  BOOL v5 = [v3 editorController];
  unsigned int v6 = [v5 selectionPath];
  uint64_t v7 = [v4 unlockedBoardItemsForSelectionPath:v6];

  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v8)
  {

    id v10 = 0;
    goto LABEL_17;
  }
  id v9 = v8;
  int64_t v24 = self;
  long long v25 = v3;
  id v10 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v7);
      }
      float64x2_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v11;
        id v16 = v10;
        id v11 = v14;
      }
      else
      {
        objc_opt_class();
        id v15 = v10;
        id v16 = v14;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
      }
      id v17 = v14;

      id v10 = v16;
    }
    id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v9);

  if (!v11)
  {
    uint64_t v3 = v25;
LABEL_17:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1528);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A2A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1548);
    }
    uint64_t v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    long long v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper maskWithShape]");
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1853, 0, "invalid nil value for '%{public}s'", "imageInfo");

    id v11 = 0;
    if (!v10) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
  uint64_t v3 = v25;
  if (v10)
  {
    [(CRLCanvasEditorHelper *)v24 p_maskImage:v11 withShape:v10 shouldOpenGroup:1 shouldBeginEditing:1 shouldCenterAroundFaces:0];
    goto LABEL_35;
  }
LABEL_26:
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E1568);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10108A210();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E1588);
  }
  BOOL v21 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v21);
  }
  long long v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper maskWithShape]");
  long long v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1854, 0, "invalid nil value for '%{public}s'", "shapeInfo");

  id v10 = 0;
LABEL_35:
}

- (void)maskWithShapeType:(int64_t)a3
{
  BOOL v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned int v6 = [v5 selectionModelTranslator];
  uint64_t v7 = [v5 editorController];
  id v8 = [v7 selectionPath];
  id v9 = [v6 unlockedBoardItemsForSelectionPath:v8];

  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      float64x2_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v14;

    if (!v15) {
      goto LABEL_12;
    }
    [(CRLCanvasEditorHelper *)self maskImage:v15 withShapeType:a3];
  }
  else
  {
LABEL_9:

LABEL_12:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E15A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A338();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E15C8);
    }
    id v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper maskWithShapeType:]");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v17, 1874, 0, "invalid nil value for '%{public}s'", "imageInfo");
  }
}

- (void)maskImage:(id)a3 withShape:(id)a4 shouldOpenGroup:(BOOL)a5 shouldBeginEditing:(BOOL)a6
{
}

- (void)p_maskImage:(id)a3 withShape:(id)a4 shouldOpenGroup:(BOOL)a5 shouldBeginEditing:(BOOL)a6 shouldCenterAroundFaces:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v84 = a6;
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  float64x2_t v14 = [v13 commandController];
  BOOL v83 = v8;
  if (v8)
  {
    id v15 = [CRLCanvasCommandSelectionBehavior alloc];
    id v16 = [(CRLCanvasEditorHelper *)self canvasEditor];
    id v17 = +[NSSet setWithObject:v11];
    long long v18 = [(CRLCanvasCommandSelectionBehavior *)v15 initWithCanvasEditor:v16 type:3 constructedInfos:v17];

    [v14 openGroupWithSelectionBehavior:v18];
  }
  v93[0] = 0;
  [(CRLCanvasEditorHelper *)self willMaskImage:v11 withShapeInfo:v12 additionalData:v93];
  uint64_t v19 = objc_opt_class();
  long long v20 = [v13 layoutForInfo:v12];
  long long v21 = sub_1002469D0(v19, v20);

  long long v22 = [v12 geometry];
  v82 = v21;
  if (v21)
  {
    long long v23 = [v21 pureGeometry];
    int64_t v24 = v23;
    if (v23) {
      [v23 fullTransform];
    }
    else {
      memset(v92, 0, sizeof(v92));
    }
    uint64_t v25 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v92];

    long long v22 = (void *)v25;
  }
  long long v26 = [v11 geometry];
  long long v27 = [v22 geometryRelativeToGeometry:v26];

  long long v88 = v27;
  if (v7)
  {
    long long v28 = [v11 imageAssetPayload];
    [v11 geometry];
    v30 = long long v29 = v22;
    [v30 size];
    double v32 = v31;
    double v34 = v33;
    [v88 transformedBounds];
    double v36 = v35;
    double v38 = v37;
    [v88 center];
    +[CRLImageFaceAnalyzer maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:](CRLImageFaceAnalyzer, "maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:", v28, v11, v32, v34, v36, v38, v39, v40);
    double x = v41;
    double y = v43;

    long long v22 = v29;
    long long v27 = v88;
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  v85 = v13;
  float64x2_t v45 = [v12 pathSource];
  id v46 = [v45 copy];

  v81 = v22;
  [v22 size];
  [v46 scaleToNaturalSize];
  v80 = [[CRLMaskInfo alloc] initWithImageItem:v11 geometry:v27 pathSource:v46];
  v79 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v11 maskInfo:v80];
  [v14 enqueueCommand:];
  if (v7)
  {
    [v27 center];
    if (!sub_1000640F4(x, y, v47, v48))
    {
      [v27 center];
      double v51 = sub_100064680(v49, v50, x);
      CGAffineTransform v52 = [v11 geometry];
      id v53 = [v52 mutableCopy];

      [v53 size];
      double v54 = sub_100064070();
      double v58 = sub_100065738(v54, v55, v56, v57);
      double v60 = sub_100064698(v58, v59, v51);
      if (v53)
      {
        double v86 = v60;
        double v78 = v61;
        [v53 transform];
        double v61 = v78;
        double v60 = v86;
        float64x2_t v63 = v89;
        float64x2_t v62 = v90;
        float64x2_t v64 = v91;
      }
      else
      {
        float64x2_t v64 = 0uLL;
        float64x2_t v63 = 0uLL;
        float64x2_t v62 = 0uLL;
      }
      [v53 setCenter:vaddq_f64(v64, vmlaq_n_f64(vmulq_n_f64(v62, v61), v63, v60))];
      id v65 = [v27 mutableCopy];
      [v65 setCenter:x, y];
      id v66 = [[_TtC8Freeform30CRLCommandSetImageItemGeometry alloc] initWithImageItem:v11 imageGeometry:v53 maskGeometry:v65 maskPathSource:v46];
      [v14 enqueueCommand:v66];
    }
  }
  long long v87 = v12;
  id v67 = +[NSSet setWithObject:v12];
  id v68 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  uint64_t v69 = +[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:v67];
  uint64_t v70 = [(CRLCanvasEditorHelper *)self editingCoordinator];
  v71 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  long long v72 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v69 infosToRemove:v67 editingCoordinator:v70 withIcc:v71];
  [(CRLCommandGroup *)v68 addCommands:v72];

  [v14 enqueueCommand:v68];
  long long v73 = [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:v67 shouldRemoveEmptyContainers:1];
  [v14 enqueueCommand:v73];
  [(CRLCanvasEditorHelper *)self didMaskImage:v11 additionalData:v93[0]];
  long long v74 = +[NSBundle mainBundle];
  CGAffineTransform v75 = [v74 localizedStringForKey:@"Mask with Shape" value:0 table:0];
  [v14 setCurrentGroupActionString:v75];

  if (v83) {
    [v14 closeGroup];
  }
  v76 = v88;
  if (v84)
  {
    [v85 layoutIfNeeded];
    v77 = [v85 repForInfo:v11];
    [v77 editMaskWithHUD:1];

    v76 = v88;
  }
}

- (void)maskImage:(id)a3 withShapeType:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [[CRLCanvasInfoGeometry alloc] initWithSize:sub_1004C840C(a4)];
  [(CRLCanvasInfoGeometry *)v7 size];
  BOOL v8 = +[CRLPathSource pathSourceForShapeType:naturalSize:](CRLPathSource, "pathSourceForShapeType:naturalSize:", a4);
  if (a4 == 4)
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = sub_10024715C(v9, v8);
    id v11 = v10;
    if (v10) {
      [v10 setIsCurveContinuous:1];
    }
  }
  id v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v13 = [v12 commandController];
  float64x2_t v14 = [CRLCanvasCommandSelectionBehavior alloc];
  id v15 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v16 = [(CRLCanvasCommandSelectionBehavior *)v14 initWithCanvasEditor:v15];

  double v47 = v16;
  [v13 openGroupWithSelectionBehavior:v16];
  id v49 = 0;
  [(CRLCanvasEditorHelper *)self willMaskImage:v6 withShapeInfo:0 additionalData:&v49];
  double v48 = v12;
  [v12 repForInfo:v6];
  id v17 = v46 = self;
  long long v18 = [v17 imageLayout];
  uint64_t v19 = [v6 imageAssetPayload];
  long long v20 = [v6 geometry];
  [v20 size];
  double v22 = v21;
  double v24 = v23;
  [(CRLCanvasInfoGeometry *)v7 transformedBounds];
  double v26 = v25;
  double v28 = v27;
  [v18 imageGeometry];
  long long v29 = v7;
  v31 = long long v30 = v8;
  [v31 size];
  double v32 = sub_100064070();
  double v36 = sub_100065738(v32, v33, v34, v35);
  +[CRLImageFaceAnalyzer maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:](CRLImageFaceAnalyzer, "maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:", v19, v6, v22, v24, v26, v28, v36, v37);
  double v39 = v38;
  double v41 = v40;

  [v30 naturalSize];
  double v43 = [(CRLCanvasInfoGeometry *)v29 geometryWithNewBounds:sub_10006402C(v39, v41, v42)];
  double v44 = [[CRLMaskInfo alloc] initWithImageItem:v6 geometry:v43 pathSource:v30];
  float64x2_t v45 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v6 maskInfo:v44];
  [v13 enqueueCommand:v45];
  [(CRLCanvasEditorHelper *)v46 didMaskImage:v6 additionalData:v49];

  [v13 closeGroup];
  if (([v18 isInMaskEditMode] & 1) == 0) {
    [v17 editMaskWithHUD:1];
  }
}

- (id)commandForReplacingImagePlaceholderInSelection:(id)a3 withBoardItems:(id)a4 isCrossDocument:(BOOL)a5 withSender:(id)a6 outSelectionBehavior:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  float64x2_t v14 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v15 = [v14 selectionModelTranslator];
  id v16 = [v15 boardItemsForSelectionPath:v13];

  if ([v11 count] != (id)1 || objc_msgSend(v16, "count") != (id)1)
  {
    long long v20 = 0;
    goto LABEL_22;
  }
  uint64_t v17 = objc_opt_class();
  long long v18 = [v16 anyObject];
  uint64_t v19 = sub_1002469D0(v17, v18);

  if (v19 && ([v19 locked] & 1) == 0)
  {
    double v21 = [v11 firstObject];
    uint64_t v22 = objc_opt_class();
    double v23 = sub_1002469D0(v22, v21);
    float64x2_t v64 = v21;
    if (!v23)
    {
      double v31 = [v14 editingCoordinator];
      float64x2_t v63 = [v31 boardItemFactory];

      double v38 = sub_100246AC8(v21, 1, v32, v33, v34, v35, v36, v37, (uint64_t)&OBJC_PROTOCOL___CRLIngestibleBoardItemProvider);
      if (!v38) {
        goto LABEL_25;
      }
      float64x2_t v45 = v38;
      id v46 = [v38 newBoardItemWithFactory:v63 bakedSize:0];
      uint64_t v47 = objc_opt_class();
      double v23 = sub_1002469D0(v47, v46);

      double v38 = v45;
      double v21 = v64;
      if (v23)
      {
      }
      else
      {
LABEL_25:
        float64x2_t v62 = v38;
        id v49 = sub_100246AC8(v21, 1, v39, v40, v41, v42, v43, v44, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardImageDataProvider);
        if (v49)
        {
          double v50 = v49;
          uint64_t v51 = [v49 imageData];
          id v60 = v50;
          CGAffineTransform v52 = [v50 thumbnailImageData];
          double v61 = (void *)v51;
          if (v51)
          {
            double v59 = v52;
            id v53 = [CRLImageDataHelper alloc];
            double v54 = [v63 assetOwner];
            double v58 = [(CRLImageDataHelper *)v53 initWithImageData:v51 assetOwner:v54];

            CGFloat v55 = [CRLCanvasInfoGeometry alloc];
            [(CRLImageDataHelper *)v58 naturalSize];
            CGFloat v56 = -[CRLCanvasInfoGeometry initWithSize:](v55, "initWithSize:");
            CGFloat v57 = v63;
            double v23 = [v63 makeImageItemWithGeometry:v56 imageData:v61 thumbnailData:v59];

            double v21 = v64;
            CGAffineTransform v52 = v59;
          }
          else
          {
            double v23 = 0;
            CGFloat v57 = v63;
          }

          id v49 = v60;
        }
        else
        {
          double v23 = 0;
          CGFloat v57 = v63;
        }

        if (!v23)
        {
          long long v20 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    double v24 = [v23 imageAssetPayload];

    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      double v26 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
      double v27 = [v26 repForInfo:v19];
      double v28 = sub_1002469D0(v25, v27);

      if ([v28 shouldAllowReplacementFromPaste]
        && (!+[CRLCanvasEditor physicalKeyboardIsSender:](CRLCanvasEditor, "physicalKeyboardIsSender:", v12)|| ([v23 imageAssetPayload], long long v29 = objc_claimAutoreleasedReturnValue(), v30 = objc_msgSend(v28, "canPasteDataFromPhysicalKeyboard:", v29), v29, v30)))
      {
        long long v20 = [v28 commandForAcceptingPasteWithImageInfo:v23 outSelectionBehavior:a7];
      }
      else
      {
        long long v20 = 0;
      }
    }
    else
    {
      long long v20 = 0;
    }
    double v21 = v64;
    goto LABEL_20;
  }
  long long v20 = 0;
LABEL_21:

LABEL_22:

  return v20;
}

- (BOOL)canReplaceBoardItem:(id)a3
{
  return 1;
}

- (void)replaceBoardItem:(id)a3 withBoardItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[NSSet setWithObject:v7];
  id v15 = v6;
  id v9 = +[NSArray arrayWithObjects:&v15 count:1];
  id v10 = [(CRLCanvasEditorHelper *)self commandForInsertingBoardItemsIntoTopLevelContainer:v9 below:v7];

  id v11 = [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:v8 shouldRemoveEmptyContainers:0];
  id v12 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);

  [(CRLCommandGroup *)v12 addCommand:v10];
  [(CRLCommandGroup *)v12 addCommand:v11];
  id v13 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  float64x2_t v14 = [v13 commandController];
  [v14 enqueueCommand:v12];
}

- (id)commandForInsertingBoardItemsIntoTopLevelContainer:(id)a3 below:(id)a4
{
  return [(CRLCanvasEditorHelper *)self commandForInsertingBoardItemsIntoTopLevelContainer:a3 below:a4 withOffset:0];
}

- (id)commandForInsertingBoardItemsIntoTopLevelContainer:(id)a3 below:(id)a4 withOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v11 = [v10 topLevelContainerInfoForEditing];
  id v12 = (objc_class *)objc_opt_class();
  long long v18 = sub_100246E2C(v11, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

  if (v18)
  {
    uint64_t v19 = [(CRLCanvasEditorHelper *)self commandToInsertBoardItems:v8 intoContainer:v18 belowBoardItem:v9 withOffset:a5];
  }
  else
  {
    long long v20 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    double v21 = [v20 editingCoordinator];
    uint64_t v22 = [v21 mainBoard];
    double v23 = [v22 rootContainer];
    uint64_t v19 = [(CRLCanvasEditorHelper *)self commandToInsertBoardItems:v8 intoContainer:v23 belowBoardItem:v9 withOffset:a5];
  }

  return v19;
}

- (id)commandToInsertBoardItems:(id)a3 intoContainer:(id)a4 belowBoardItem:(id)a5 withOffset:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = sub_10024715C(v12, v10);
  if (v13)
  {
    uint64_t v14 = [v10 childInfos];
    uint64_t v15 = (char *)[v14 indexOfObject:v11];

    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = [v10 childInfos];
      uint64_t v15 = (char *)[v16 count];
    }
    BOOL v17 = (unint64_t)v15 >= a6;
    long long v18 = &v15[-a6];
    if (!v17)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1628);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A460();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1648);
      }
      double v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v24);
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Offset for index was too large.", v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:]");
      uint64_t v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:]");
      uint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v32 file:v33 lineNumber:2148 isFatal:1 description:"Offset for index was too large."];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v34, v35);
      abort();
    }
    uint64_t v19 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v13 boardItems:v9 index:v18];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E15E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A3CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1608);
    }
    long long v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:]");
    uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 2142, 0, "invalid nil value for '%{public}s'", "containerItem");

    uint64_t v19 = 0;
  }

  return v19;
}

- (id)commandForDeletingBoardItemsFromTopLevelContainer:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v8 = [v7 topLevelContainerInfoForEditing];

  if (v8)
  {
    id v9 = [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:v6 shouldRemoveEmptyContainers:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)commandForDeletingInfosPossiblyFromMultipleContainers:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4
{
  return [(CRLCanvasEditorHelper *)self commandForDeletingInfosPossiblyFromMultipleContainers:a3 shouldRemoveEmptyContainers:a4 canDeleteNewlyCreatedInfos:0];
}

- (id)commandForDeletingInfosPossiblyFromMultipleContainers:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4 canDeleteNewlyCreatedInfos:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 count])
  {
    id v8 = v7;
    id v40 = v7;
    BOOL v39 = v5;
    if (v6)
    {
      uint64_t v9 = [(CRLCanvasEditorHelper *)self infosToDeleteToDeleteInfos:v8];

      id v8 = (id)v9;
    }
    uint64_t v41 = +[NSMutableSet set];
    id v45 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = [v14 parentInfo];
          BOOL v17 = sub_1002469D0(v15, v16);

          if (v17)
          {
            long long v18 = [v45 objectForKeyedSubscript:v17];
            if (!v18)
            {
              long long v18 = +[NSMutableSet set];
              [v45 setObject:v18 forKey:v17];
            }
            uint64_t v19 = (objc_class *)objc_opt_class();
            long long v20 = sub_10024715C(v19, v14);
            [v18 addObject:v20];
          }
          else
          {
            [v41 addObject:v14];
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v11);
    }

    double v21 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
    if ([v45 count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v22 = v45;
      id v23 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v43 = *(void *)v47;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            uint64_t v26 = v21;
            if (*(void *)v47 != v43) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
            uint64_t v28 = +[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:v27];
            uint64_t v29 = [(CRLCanvasEditorHelper *)self editingCoordinator];
            uint64_t v30 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
            uint64_t v31 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v28 infosToRemove:v27 editingCoordinator:v29 withIcc:v30];

            double v21 = v26;
            if ([v31 count]) {
              [(CRLCommandGroup *)v26 addCommands:v31];
            }
            uint64_t v32 = [[_TtC8Freeform26CRLCommandDeleteBoardItems alloc] initWithBoardItemsToDelete:v27];
            [(CRLCommandGroup *)v26 addCommand:v32];
          }
          id v24 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v24);
      }
    }
    if ([v41 count])
    {
      uint64_t v33 = [[_TtC8Freeform26CRLCommandDeleteBoardItems alloc] initWithBoardItemsToDelete:v41 canDeleteNewlyCreatedItems:v39];
      [(CRLCommandGroup *)v21 addCommand:v33];
    }
    if ([(CRLCommandGroup *)v21 isEmpty])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      CKRecordID v34 = v21;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1668);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A4E8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1688);
      }
      Swift::String v35 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v35);
      }
      uint64_t v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:canDeleteNewlyCreatedInfos:]");
      uint64_t v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v36, v37, 2223, 0, "Shouldn't vend an empty command group: %@", v34 file lineNumber isFatal description];

      double v21 = v34;
    }

    id v7 = v40;
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

- (id)infosToDeleteToDeleteInfos:(id)a3
{
  id v32 = [a3 mutableCopy];
  uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
  BOOL v4 = &off_10163D000;
  while (1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [v32 copy];
    id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v5) {
      break;
    }
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      id v30 = v6;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v9);
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = [v10 parentInfo];
        uint64_t v13 = sub_1002469D0(v11, v12);

        if (v13)
        {
          uint64_t v14 = [v3 objectForKeyedSubscript:v13];
          if (!v14)
          {
            uint64_t v15 = [v13 childInfos];
            uint64_t v14 = +[NSSet setWithArray:v15];

            [v3 setObject:v14 forKeyedSubscript:v13];
          }
          if ([v14 isSubsetOfSet:v32])
          {
            uint64_t v16 = v8;
            BOOL v17 = v3;
            long long v18 = v4;
            uint64_t v19 = objc_opt_class();
            long long v20 = [v13 parentInfo];
            double v21 = sub_1002469D0(v19, v20);

            id v22 = [v21 childInfos];
            id v23 = [v22 count];

            if (v23 == (id)1)
            {
              do
              {
                id v24 = [v21 parentInfo];

                uint64_t v25 = [v24 childInfos];
                id v26 = [v25 count];

                double v21 = v24;
              }
              while (v26 == (id)1);
            }
            else
            {
              id v24 = v21;
            }
            uint64_t v27 = [v13 allNestedChildrenItemsIncludingGroups];
            uint64_t v28 = +[NSSet setWithArray:v27];
            [v32 minusSet:v28];

            [v32 addObject:v13];
            char v7 = 1;
            BOOL v4 = v18;
            uint64_t v3 = v17;
            uint64_t v8 = v16;
            id v6 = v30;
          }
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);

    if ((v7 & 1) == 0) {
      goto LABEL_22;
    }
  }

LABEL_22:

  return v32;
}

- (id)commandsToSwapConnectionsFromRep:(id)a3 toInfo:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  id v29 = +[NSMutableArray array];
  char v7 = [v6 layout];
  uint64_t v8 = [v7 connectedLayouts];
  id v9 = [v8 count];

  if (v9)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = [v6 layout];
    uint64_t v11 = [v10 connectedLayouts];

    id obj = v11;
    id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v12) {
      goto LABEL_15;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) connectionLineInfo];
        BOOL v17 = [(CRLCanvasEditorHelper *)self editingCoordinator];
        long long v18 = [v17 mainBoard];
        uint64_t v19 = [v16 getConnectedFromWithBoardItemOwner:v18];

        long long v20 = [(CRLCanvasEditorHelper *)self editingCoordinator];
        double v21 = [v20 mainBoard];
        id v22 = [v16 getConnectedToWithBoardItemOwner:v21];

        id v23 = [v6 info];

        if (v19 == v23)
        {
          uint64_t v25 = 0;
        }
        else
        {
          id v24 = [v6 info];

          if (v22 != v24) {
            goto LABEL_13;
          }
          uint64_t v25 = 1;
        }
        id v26 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v16 connectedItem:v31 chirality:v25];
        if (v26)
        {
          uint64_t v27 = v26;
          [v29 addObject:v26];
        }
LABEL_13:
      }
      id v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (!v13)
      {
LABEL_15:

        break;
      }
    }
  }

  return v29;
}

- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4
{
  id v5 = a3;
  id v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  char v7 = [v6 topLevelContainerInfoForEditing];
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v14 = sub_100246E2C(v7, v8, 1, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

  if (v14)
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = sub_1002469D0(v15, v14);
    if (v16 && [(CRLCanvasEditorHelper *)self canInsertBoardItems:v5 intoGroup:v16])
    {
      memset(&v35, 0, sizeof(v35));
      BOOL v17 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
      long long v18 = [v17 topLevelContainerRepForEditing];
      uint64_t v19 = [v18 layout];
      long long v20 = v19;
      if (v19) {
        [v19 transformInRoot];
      }
      else {
        memset(&v35, 0, sizeof(v35));
      }

      CGAffineTransform v33 = v35;
      CGAffineTransformInvert(&v34, &v33);
      CGAffineTransform v35 = v34;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = v5;
      id v22 = [v21 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v27 = [v26 geometry];
            CGAffineTransform v34 = v35;
            uint64_t v28 = [v27 geometryByAppendingTransform:&v34];
            [v26 setGeometry:v28];
          }
          id v23 = [v21 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v23);
      }
    }
  }
}

- (void)p_fixupGeometryForInsertingBoardItems:(id)a3 intoContainer:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = sub_1002469D0(v8, v7);

    if (v9 && [(CRLCanvasEditorHelper *)self canInsertBoardItems:v6 intoGroup:v9])
    {
      uint64_t v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
      uint64_t v11 = [(CRLCanvasEditorHelper *)self canvasEditor];
      uint64_t v12 = [v11 selectionPathWithInfo:v9];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001F0AC0;
      v13[3] = &unk_1014E16B0;
      id v14 = v9;
      id v15 = v6;
      [v10 forLayoutNearestVisibleRectForInfosForSelectionPath:v12 performBlock:v13];
    }
  }
}

- (void)prepareGeometryForPastingBoardItems:(id)a3 fromPasteboard:(id)a4 intoContainer:(id)a5 useOriginalPositions:(BOOL)a6
{
  BOOL v6 = a6;
  id v30 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v13 = v12;
  if (v6)
  {
    id v14 = [v30 name];
    unsigned __int8 v15 = [v14 isEqualToString:@"com.apple.freeform.Canvas.CRLCanvasRepNoPositionOffsetPasteboardName"];

    if (v15)
    {
      uint64_t v16 = 0;
    }
    else
    {
      long long v20 = [CRLBoardItemPositioner alloc];
      id v21 = [(CRLCanvasEditorHelper *)self canvasEditor];
      uint64_t v16 = [(CRLBoardItemPositioner *)v20 initWithCanvasEditor:v21];

      [(CRLBoardItemPositioner *)v16 setAvoidCollisions:0];
    }
  }
  else
  {
    BOOL v17 = [v12 infosForCurrentSelectionPath];
    if ([v17 count])
    {
      [(CRLCanvasEditorHelper *)self p_centerOfBoardItems:v17];
    }
    else
    {
      [v13 visibleUnscaledRect];
      double v18 = sub_100065738(v22, v23, v24, v25);
    }
    double v26 = v18;
    double v27 = v19;
    uint64_t v28 = [CRLBoardItemPositioner alloc];
    long long v29 = [(CRLCanvasEditorHelper *)self canvasEditor];
    uint64_t v16 = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:](v28, "initWithCanvasEditor:targetCenter:validGeometries:", v29, 1, v26, v27);

    [(CRLBoardItemPositioner *)v16 setShouldPreserveRelativePositions:1];
  }
  [(CRLBoardItemPositioner *)v16 positionBoardItems:v11];
  [(CRLCanvasEditorHelper *)self p_fixupGeometryForInsertingBoardItems:v11 intoContainer:v10];
}

- (CGPoint)p_centerOfBoardItems:(id)a3
{
  id v4 = a3;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = [v4 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    CGFloat v37 = height;
    CGFloat v38 = width;
    CGFloat v39 = y;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v12);
        id v14 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
        unsigned __int8 v15 = [v14 layoutForInfo:v13];

        if (v15)
        {
          uint64_t v16 = [v15 pureGeometryInRoot];
          [v16 frame];
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;

          v56.origin.CGFloat x = x;
          v56.origin.CGFloat y = y;
          v56.size.CGFloat width = width;
          v56.size.CGFloat height = height;
          v59.origin.CGFloat y = v39;
          v59.origin.CGFloat x = CGRectZero.origin.x;
          v59.size.CGFloat height = v37;
          v59.size.CGFloat width = v38;
          if (CGRectEqualToRect(v56, v59))
          {
            CGFloat height = v24;
            CGFloat width = v22;
            CGFloat y = v20;
            CGFloat x = v18;
          }
          else
          {
            v57.origin.CGFloat x = x;
            v57.origin.CGFloat y = y;
            v57.size.CGFloat width = width;
            v57.size.CGFloat height = height;
            v60.origin.CGFloat x = v18;
            v60.origin.CGFloat y = v20;
            v60.size.CGFloat width = v22;
            v60.size.CGFloat height = v24;
            CGRect v58 = CGRectUnion(v57, v60);
            CGFloat x = v58.origin.x;
            CGFloat y = v58.origin.y;
            CGFloat width = v58.size.width;
            CGFloat height = v58.size.height;
          }
        }
        else
        {
          unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E16D0);
          }
          double v26 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v45 = v25;
            __int16 v46 = 2082;
            long long v47 = "-[CRLCanvasEditorHelper p_centerOfBoardItems:]";
            __int16 v48 = 2082;
            long long v49 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m";
            __int16 v50 = 1024;
            int v51 = 2386;
            __int16 v52 = 2082;
            long long v53 = "layout";
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E16F0);
          }
          double v27 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            id v30 = v27;
            long long v31 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v45 = v25;
            __int16 v46 = 2114;
            long long v47 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          uint64_t v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper p_centerOfBoardItems:]");
          long long v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 2386, 0, "invalid nil value for '%{public}s'", "layout");
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v4 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v10);
  }
  double v32 = sub_100065738(x, y, width, height);
  double v34 = v33;

  double v35 = v32;
  double v36 = v34;
  result.CGFloat y = v36;
  result.CGFloat x = v35;
  return result;
}

- (id)insertCopiesOfInfos:(id)a3 forDuplicatingDragOnRep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v9 = [v8 interactiveCanvasController];
  id v10 = [v9 editorController];
  uint64_t v11 = [v9 topLevelZOrderedSiblingsOfInfos:v6];
  uint64_t v12 = [v11 crl_arrayWithObjectsInSet:v6];

  uint64_t v13 = [v9 editingCoordinator];
  id v14 = [v13 boardItemFactory];
  unsigned __int8 v15 = [v14 makeDuplicateOfBoardItems:v12];

  uint64_t v16 = +[CRLInsertionContext nonInteractiveInsertionContext];
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = sub_1001F1504;
  CGFloat v24 = sub_1001F1514;
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001F151C;
  v19[3] = &unk_1014E1718;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = &v20;
  [v10 enumerateEditorsOnStackUsingBlock:v19];
  [(id)v21[5] insertBoardItems:v15 withInsertionContext:v16 postProcessBlock:0];
  double v17 = +[NSSet setWithArray:v15];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (void)enterQuickSelectMode:(id)a3
{
  uint64_t v3 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v4 = [v3 interactiveCanvasController];
  id v5 = [v4 layerHost];
  id v6 = [v5 asiOSCVC];

  [v6 enterQuickSelectMode];
}

- (void)presentAlignmentTools:(id)a3
{
  uint64_t v3 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v4 = [v3 interactiveCanvasController];
  id v5 = [v4 layerHost];
  id v6 = [v5 asiOSCVC];

  [v6 presentAlignmentTools];
}

- (void)bringToFront:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v3 = [v4 arrangeInspectorDelegate];
  [v3 moveToFrontForArrangeInspector];
}

- (void)bringForward:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v3 = [v4 arrangeInspectorDelegate];
  [v3 moveFrontForArrangeInspector];
}

- (void)sendBackward:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v3 = [v4 arrangeInspectorDelegate];
  [v3 moveBackForArrangeInspector];
}

- (void)sendToBack:(id)a3
{
  id v4 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v3 = [v4 arrangeInspectorDelegate];
  [v3 moveToBackForArrangeInspector];
}

- (id)layoutsForAlignAndDistribute
{
  uint64_t v3 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v4 = [(CRLCanvasEditorHelper *)self editingCoordinator];
  id v5 = [v4 mainBoard];

  id v6 = [v3 selectionModelTranslator];
  id v7 = [v3 editorController];
  uint64_t v8 = [v7 selectionPath];
  id v9 = [v6 unlockedBoardItemsForSelectionPath:v8];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001F19C0;
  v16[3] = &unk_1014E1740;
  v16[4] = v5;
  id v10 = +[NSPredicate predicateWithBlock:v16];
  uint64_t v11 = [v9 filteredSetUsingPredicate:v10];

  uint64_t v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v13 = [v12 layoutController];
  id v14 = [v13 layoutsForInfos:v11];

  return v14;
}

- (void)alignDrawablesByEdge:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v6 = [v5 commandController];

  id v7 = [CRLCanvasCommandSelectionBehavior alloc];
  uint64_t v8 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  [(CRLCommandSelectionBehavior *)v9 setSelectionFlags:[(CRLCommandSelectionBehavior *)v9 selectionFlags] | 4];
  [v6 openGroupWithSelectionBehavior:v9];
  float64x2_t v64 = v9;
  switch((int)v3)
  {
    case 0:
      id v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Align Left";
      goto LABEL_9;
    case 1:
      id v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Align Center";
      goto LABEL_9;
    case 2:
      id v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Align Right";
      goto LABEL_9;
    case 3:
      id v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Align Top";
      goto LABEL_9;
    case 4:
      id v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Align Middle";
      goto LABEL_9;
    case 5:
      id v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Align Bottom";
LABEL_9:
      uint64_t v13 = [v10 localizedStringForKey:v12 value:0 table:@"UndoStrings"];

      break;
    default:
      uint64_t v13 = 0;
      break;
  }
  float64x2_t v63 = (void *)v13;
  [v6 setCurrentGroupActionString:v13];
  id v14 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v15 = [v14 hasSelectedInfosInMultipleContainers];

  uint64_t v16 = [(CRLCanvasEditorHelper *)self layoutsForAlignAndDistribute];
  id v75 = 0;
  [(CRLCanvasEditorHelper *)self willRepositionLayouts:v16 additionalData:&v75];
  id v65 = v6;
  id v66 = self;
  if ([v16 count] == (id)1)
  {
    double v17 = [v16 anyObject];
    CGFloat v18 = [v17 parentLayoutForProvidingGuides];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v19 = [(CRLCanvasEditorHelper *)self canvasEditor];
      uint64_t v20 = [v19 interactiveCanvasController];
      [v20 canvas];
      double v21 = v62 = v17;
      [v21 unscaledSize];

      double v22 = sub_100064070();
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      long long v29 = [(CRLCanvasEditorHelper *)self canvasEditor];
      id v30 = [v29 interactiveCanvasController];
      long long v31 = [v30 canvas];
      unsigned int v32 = [v31 isAnchoredAtRight];

      double v17 = v62;
      double v33 = 0.0;
      if (v32) {
        double v33 = v26;
      }
      double v34 = v22 - v33;
    }
    else
    {
      [v18 alignmentFrame];
      double v34 = sub_100064070();
      double v24 = v39;
      double v26 = v40;
      double v28 = v41;
    }
  }
  else
  {
    [(CRLCanvasEditorHelper *)self p_boundingBoxForLayouts:v16 inRootSpace:v15];
    double v34 = v35;
    double v24 = v36;
    double v26 = v37;
    double v28 = v38;
  }
  id v42 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:[v16 count]];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v43 = v16;
  id v44 = [v43 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v45; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v72 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        [(CRLCanvasEditorHelper *)v66 p_offsetToMoveLayout:v48 edge:v3 toOffset:v15 inRootSpace:sub_100063FC4(v3, v34, v24, v26, v28)];
        long long v49 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [v42 setObject:v49 forKey:v48];
      }
      id v45 = [v43 countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v45);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v50 = v43;
  id v51 = [v50 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v68;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v50);
        }
        CGFloat v55 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
        CGRect v56 = [v42 objectForKeyedSubscript:v55];
        [v56 CGPointValue];
        double v58 = v57;
        double v60 = v59;

        id v61 = [v55 newCommandToMoveByOffset:v42 whenDistributingLayoutsByOffsets:v58];
        if (v61) {
          [v65 enqueueCommand:v61];
        }
      }
      id v52 = [v50 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v52);
  }

  [(CRLCanvasEditorHelper *)v66 didRepositionLayouts:v50 additionalData:&v75];
  [v65 closeGroup];
}

- (void)distributeDrawablesByEdge:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v6 = [v5 commandController];

  id v7 = [CRLCanvasCommandSelectionBehavior alloc];
  long long v72 = self;
  uint64_t v8 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  [v6 openGroupWithSelectionBehavior:v9];
  long long v70 = v9;
  if ((v3 - 3) < 3)
  {
    id v10 = +[NSBundle mainBundle];
    uint64_t v11 = v10;
    CFStringRef v12 = @"Distribute Vertically";
    goto LABEL_5;
  }
  if (v3 <= 2)
  {
    id v10 = +[NSBundle mainBundle];
    uint64_t v11 = v10;
    CFStringRef v12 = @"Distribute Horizontally";
LABEL_5:
    uint64_t v13 = [v10 localizedStringForKey:v12 value:0 table:@"UndoStrings"];

    goto LABEL_6;
  }
  uint64_t v13 = 0;
LABEL_6:
  [v6 setCurrentGroupActionString:v13];
  id v14 = [(CRLCanvasEditorHelper *)v72 layoutsForAlignAndDistribute];
  id v84 = 0;
  [(CRLCanvasEditorHelper *)v72 willRepositionLayouts:v14 additionalData:&v84];
  id v15 = [(CRLCanvasEditorHelper *)v72 interactiveCanvasController];
  unsigned int v16 = [v15 hasSelectedInfosInMultipleContainers];

  double v17 = [v14 allObjects];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_1001F2590;
  v81[3] = &unk_1014E1760;
  char v83 = v16;
  int v82 = v3;
  CGFloat v18 = [v17 sortedArrayUsingComparator:v81];

  id v19 = [v18 count];
  uint64_t v20 = [v18 objectAtIndexedSubscript:0];
  double v21 = v20;
  long long v71 = v6;
  long long v69 = (void *)v13;
  if (v16)
  {
    [v20 alignmentFrameInRoot];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    id v30 = [v18 lastObject];
    [v30 alignmentFrameInRoot];
  }
  else
  {
    [v20 alignmentFrame];
    double v23 = v35;
    double v25 = v36;
    double v27 = v37;
    double v29 = v38;

    id v30 = [v18 lastObject];
    [v30 alignmentFrame];
  }
  double v39 = v31;
  double v40 = v32;
  double v41 = v33;
  double v42 = v34;

  double v43 = sub_100063FC4(v3, v23, v25, v27, v29);
  uint64_t v44 = v3;
  double v45 = sub_100063FC4(v3, v39, v40, v41, v42);
  long long v68 = v14;
  id v46 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:[v14 count]];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v47 = v18;
  id v48 = [v47 countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (v48)
  {
    id v49 = v48;
    int v50 = 0;
    double v51 = (v45 - v43) / (float)((float)(unint64_t)v19 + -1.0);
    uint64_t v52 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v49; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v78 != v52) {
          objc_enumerationMutation(v47);
        }
        uint64_t v54 = *(void *)(*((void *)&v77 + 1) + 8 * i);
        [(CRLCanvasEditorHelper *)v72 p_offsetToMoveLayout:v54 edge:v44 toOffset:v16 inRootSpace:v43 + v51 * (double)(v50 + (int)i)];
        CGFloat v55 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [v46 setObject:v55 forKey:v54];
      }
      id v49 = [v47 countByEnumeratingWithState:&v77 objects:v86 count:16];
      v50 += (int)i;
    }
    while (v49);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v56 = v47;
  id v57 = [v56 countByEnumeratingWithState:&v73 objects:v85 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v74;
    do
    {
      for (j = 0; j != v58; j = (char *)j + 1)
      {
        if (*(void *)v74 != v59) {
          objc_enumerationMutation(v56);
        }
        id v61 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
        float64x2_t v62 = [v46 objectForKeyedSubscript:v61];
        [v62 CGPointValue];
        double v64 = v63;
        double v66 = v65;

        id v67 = [v61 newCommandToMoveByOffset:v46 whenDistributingLayoutsByOffsets:v64];
        if (v67) {
          [v71 enqueueCommand:v67];
        }
      }
      id v58 = [v56 countByEnumeratingWithState:&v73 objects:v85 count:16];
    }
    while (v58);
  }

  [(CRLCanvasEditorHelper *)v72 didRepositionLayouts:v68 additionalData:&v84];
  [v71 closeGroup];
}

- (void)distributeDrawablesEvenly
{
  uint64_t v3 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v4 = [v3 hasSelectedInfosInMultipleContainers];

  id v5 = [(CRLCanvasEditorHelper *)self layoutsForAlignAndDistribute];
  v129 = self;
  [(CRLCanvasEditorHelper *)self p_boundingBoxForLayouts:v5 inRootSpace:v4];
  double v10 = sub_100065738(v6, v7, v8, v9);
  double v12 = v11;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  id v15 = [v5 count];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v143 objects:v150 count:16];
  if (v17)
  {
    id v18 = v17;
    double v19 = 1.0 / (double)(unint64_t)v15;
    uint64_t v20 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v144 != v20) {
          objc_enumerationMutation(v16);
        }
        double v22 = *(void **)(*((void *)&v143 + 1) + 8 * i);
        if (v4) {
          [v22 alignmentFrameInRoot];
        }
        else {
          [v22 alignmentFrame];
        }
        double v27 = sub_100065738(v23, v24, v25, v26);
        double v29 = sub_100064680(v27, v28, v10);
        if (v29 >= 0.0)
        {
          if (v29 == 0.0) {
            double v30 = fabs(v30);
          }
        }
        else
        {
          double v29 = sub_1000646A4(v29, v30, -1.0);
        }
        double v31 = sub_100064660(v29, v30);
        double v33 = sub_1000646A4(v31, v32, v19);
        double x = sub_100064698(x, y, v33);
        double y = v34;
      }
      id v18 = [v16 countByEnumeratingWithState:&v143 objects:v150 count:16];
    }
    while (v18);
  }

  double v35 = sub_100064660(x, y);
  double v37 = v36;
  double v38 = [(CRLCanvasEditorHelper *)v129 interactiveCanvasController];
  double v39 = [v38 commandController];

  double v40 = +[NSBundle mainBundle];
  double v41 = [v40 localizedStringForKey:@"Distribute Evenly" value:0 table:@"UndoStrings"];

  if ((v35 == 0.0 || fabs(v35) < 0.00999999978) && (v37 == 1.0 || fabs(v37 + -1.0) < 0.00999999978))
  {
    [v39 openGroup];
    [v39 setCurrentGroupActionString:v41];
    v121 = v129;
    uint64_t v122 = 4;
LABEL_55:
    [(CRLCanvasEditorHelper *)v121 distributeDrawablesByEdge:v122];
    [v39 closeGroup];
    goto LABEL_56;
  }
  if ((v35 == 1.0 || fabs(v35 + -1.0) < 0.00999999978) && (v37 == 0.0 || fabs(v37) < 0.00999999978))
  {
    [v39 openGroup];
    [v39 setCurrentGroupActionString:v41];
    v121 = v129;
    uint64_t v122 = 1;
    goto LABEL_55;
  }
  double v42 = [CRLCanvasCommandSelectionBehavior alloc];
  double v43 = [(CRLCanvasEditorHelper *)v129 canvasEditor];
  uint64_t v44 = [(CRLCanvasCommandSelectionBehavior *)v42 initWithCanvasEditor:v43 type:2];

  v125 = v44;
  [v39 openGroupWithSelectionBehavior:v44];
  v126 = v41;
  [v39 setCurrentGroupActionString:v41];
  id v142 = 0;
  [(CRLCanvasEditorHelper *)v129 willRepositionLayouts:v16 additionalData:&v142];
  id v45 = objc_alloc_init((Class)NSMutableSet);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v127 = v16;
  id obj = v16;
  id v46 = [obj countByEnumeratingWithState:&v138 objects:v149 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v139;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v139 != v48) {
          objc_enumerationMutation(obj);
        }
        int v50 = *(void **)(*((void *)&v138 + 1) + 8 * (void)j);
        if (v4) {
          [v50 alignmentFrameInRoot];
        }
        else {
          [v50 alignmentFrame];
        }
        double v55 = sub_100065738(v51, v52, v53, v54);
        double v57 = sub_100064680(v55, v56, v10);
        double v59 = sub_10006468C(v57, v58, v35, v37);
        double v60 = sub_1000646A4(v35, v37, v59);
        id v61 = +[NSValue valueWithCGPoint:sub_100064698(v10, v12, v60)];
        float64x2_t v62 = +[CRLPair pairWithFirst:v50 second:v61];

        [v45 addObject:v62];
      }
      id v47 = [obj countByEnumeratingWithState:&v138 objects:v149 count:16];
    }
    while (v47);
  }

  double v63 = [v45 allObjects];
  double v64 = [v63 sortedArrayUsingComparator:&stru_1014E17A0];

  id v65 = [v64 count];
  double v66 = [v64 objectAtIndex:0];
  id v67 = [v64 lastObject];
  long long v68 = [v66 first];
  long long v69 = v68;
  if (v4)
  {
    [v68 frameInRoot:v67, v66];
    CGFloat v71 = v70;
    CGFloat v73 = v72;
    CGFloat v75 = v74;
    CGFloat v77 = v76;

    long long v78 = [v67 first];
    [v78 frameInRoot];
  }
  else
  {
    [v68 frame:v67, v66];
    CGFloat v71 = v83;
    CGFloat v73 = v84;
    CGFloat v75 = v85;
    CGFloat v77 = v86;

    long long v78 = [v67 first];
    [v78 frame];
  }
  CGFloat v87 = v79;
  CGFloat v88 = v80;
  CGFloat v89 = v81;
  CGFloat v90 = v82;

  id v91 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:[obj count]];
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v92 = v64;
  id v93 = [v92 countByEnumeratingWithState:&v134 objects:v148 count:16];
  if (v93)
  {
    id v94 = v93;
    double v95 = sub_100065738(v87, v88, v89, v90);
    double v97 = v96;
    double v98 = sub_100065738(v71, v73, v75, v77);
    double v100 = v99;
    double v101 = sub_100064680(v95, v97, v98);
    double v103 = sub_1000646A4(v101, v102, 1.0 / (double)((unint64_t)v65 - 1));
    uint64_t v104 = *(void *)v135;
    do
    {
      for (k = 0; k != v94; k = (char *)k + 1)
      {
        if (*(void *)v135 != v104) {
          objc_enumerationMutation(v92);
        }
        v106 = [*(id *)(*((void *)&v134 + 1) + 8 * (void)k) first];
        -[CRLCanvasEditorHelper p_offsetToMoveCenterOfLayout:toPoint:inRootSpace:](v129, "p_offsetToMoveCenterOfLayout:toPoint:inRootSpace:", v106, v4, v98, v100);
        v107 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [v91 setObject:v107 forKey:v106];

        double v98 = sub_100064698(v98, v100, v103);
        double v100 = v108;
      }
      id v94 = [v92 countByEnumeratingWithState:&v134 objects:v148 count:16];
    }
    while (v94);
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v109 = v92;
  id v110 = [v109 countByEnumeratingWithState:&v130 objects:v147 count:16];
  if (v110)
  {
    id v111 = v110;
    uint64_t v112 = *(void *)v131;
    do
    {
      for (m = 0; m != v111; m = (char *)m + 1)
      {
        if (*(void *)v131 != v112) {
          objc_enumerationMutation(v109);
        }
        v114 = [*(id *)(*((void *)&v130 + 1) + 8 * (void)m) first];
        v115 = [v91 objectForKeyedSubscript:v114];
        [v115 CGPointValue];
        double v117 = v116;
        double v119 = v118;

        id v120 = [v114 newCommandToMoveByOffset:v91 whenDistributingLayoutsByOffsets:v117];
        if (v120) {
          [v39 enqueueCommand:v120];
        }
      }
      id v111 = [v109 countByEnumeratingWithState:&v130 objects:v147 count:16];
    }
    while (v111);
  }

  [(CRLCanvasEditorHelper *)v129 didRepositionLayouts:obj additionalData:&v142];
  [v39 closeGroup];

  id v16 = v127;
  double v41 = v126;
LABEL_56:
}

- (CGRect)p_boundingBoxForLayouts:(id)a3 inRootSpace:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v5);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
        if (v4) {
          [v14 alignmentFrameInRoot];
        }
        else {
          [v14 alignmentFrame];
        }
        CGFloat v19 = v15;
        CGFloat v20 = v16;
        CGFloat v21 = v17;
        CGFloat v22 = v18;
        v32.origin.CGFloat x = x;
        v32.origin.CGFloat y = y;
        v32.size.CGFloat width = width;
        v32.size.CGFloat height = height;
        if (CGRectIsNull(v32))
        {
          CGFloat height = v22;
          CGFloat width = v21;
          CGFloat y = v20;
          CGFloat x = v19;
        }
        else
        {
          v33.origin.CGFloat x = x;
          v33.origin.CGFloat y = y;
          v33.size.CGFloat width = width;
          v33.size.CGFloat height = height;
          v36.origin.CGFloat x = v19;
          v36.origin.CGFloat y = v20;
          v36.size.CGFloat width = v21;
          v36.size.CGFloat height = v22;
          CGRect v34 = CGRectUnion(v33, v36);
          CGFloat x = v34.origin.x;
          CGFloat y = v34.origin.y;
          CGFloat width = v34.size.width;
          CGFloat height = v34.size.height;
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGPoint)p_offsetToMoveCenterOfLayout:(id)a3 toPoint:(CGPoint)a4 inRootSpace:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  CGFloat v9 = v8;
  if (v5) {
    [v8 alignmentFrameInRoot];
  }
  else {
    [v8 alignmentFrame];
  }
  double v14 = sub_100065738(v10, v11, v12, v13);
  double v15 = sub_100064680(x, y, v14);
  tdouble x = v15;
  tdouble y = v16;
  if (v5)
  {
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeTranslation(&v24, v15, v16);
    CGFloat v19 = [v9 parent];
    CGFloat v20 = v19;
    if (v19) {
      [v19 transformInRoot];
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    sub_10007FC38(&v24, v23, &v25);

    tdouble y = v25.ty;
    tdouble x = v25.tx;
  }

  double v21 = tx;
  double v22 = ty;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)p_offsetToMoveLayout:(id)a3 edge:(int)a4 toOffset:(double)a5 inRootSpace:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  CGFloat v10 = v9;
  if (v6) {
    [v9 alignmentFrameInRoot];
  }
  else {
    [v9 alignmentFrame];
  }
  double v15 = a5 - sub_100063FC4(v8, v11, v12, v13, v14);
  CGFloat v16 = +[CRLSwappableAxesGeometry geometryWithXAxisAlongEdge:v8];
  [v16 pointX:v15, 0.0];
  tdouble x = v17;
  [v16 pointY:v15];
  tdouble y = v19;
  if (v6)
  {
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v26, tx, v19);
    double v21 = [v10 parent];
    double v22 = v21;
    if (v21) {
      [v21 transformInRoot];
    }
    else {
      memset(v25, 0, sizeof(v25));
    }
    sub_10007FC38(&v26, v25, &v27);

    tdouble y = v27.ty;
    tdouble x = v27.tx;
  }

  double v23 = tx;
  double v24 = ty;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (BOOL)p_allowsCanvasScrollingFromKeyboard
{
  v2 = [(CRLCanvasEditorHelper *)self canvasEditor];
  uint64_t v3 = [v2 interactiveCanvasController];
  BOOL v4 = [v3 layerHost];
  BOOL v5 = [v4 asUIKitHost];

  LOBYTE(v2) = [v5 allowsCanvasScrollingFromKeyboard];
  return (char)v2;
}

- (CGPoint)contentOffsetForDocumentNavigationType:(unint64_t)a3
{
  BOOL v4 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  [v4 visibleBoundsRectUsingSizeOfEnclosingScrollView];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 viewScale];
  double v14 = v13;
  [v4 contentOffset];
  double v16 = v15;
  double v18 = v17;
  switch(a3)
  {
    case 0uLL:
      v26.origin.double x = v6;
      v26.origin.double y = v8;
      v26.size.CGFloat width = v10;
      v26.size.CGFloat height = v12;
      double Height = CGRectGetHeight(v26);
      double v20 = -0.05;
      goto LABEL_9;
    case 1uLL:
      v27.origin.double x = v6;
      v27.origin.double y = v8;
      v27.size.CGFloat width = v10;
      v27.size.CGFloat height = v12;
      double Height = CGRectGetHeight(v27);
      double v20 = 0.05;
      goto LABEL_9;
    case 2uLL:
      v28.origin.double x = v6;
      v28.origin.double y = v8;
      v28.size.CGFloat width = v10;
      v28.size.CGFloat height = v12;
      double Width = CGRectGetWidth(v28);
      double v22 = -0.05;
      goto LABEL_6;
    case 3uLL:
      v29.origin.double x = v6;
      v29.origin.double y = v8;
      v29.size.CGFloat width = v10;
      v29.size.CGFloat height = v12;
      double Width = CGRectGetWidth(v29);
      double v22 = 0.05;
LABEL_6:
      double v16 = v16 + Width * v22 / v14;
      break;
    case 4uLL:
      v30.origin.double x = v6;
      v30.origin.double y = v8;
      v30.size.CGFloat width = v10;
      v30.size.CGFloat height = v12;
      double Height = CGRectGetHeight(v30);
      double v20 = -0.8;
      goto LABEL_9;
    case 5uLL:
      v31.origin.double x = v6;
      v31.origin.double y = v8;
      v31.size.CGFloat width = v10;
      v31.size.CGFloat height = v12;
      double Height = CGRectGetHeight(v31);
      double v20 = 0.8;
LABEL_9:
      double v18 = v18 + Height * v20 / v14;
      break;
    default:
      break;
  }

  double v23 = v16;
  double v24 = v18;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (void)p_scrollCanvasForScrollType:(unint64_t)a3
{
  id v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  [(CRLCanvasEditorHelper *)self contentOffsetForDocumentNavigationType:a3];
  double v6 = v5;
  double v8 = v7;
  [v10 viewScale];
  [v10 clampedUnscaledContentOffset:v6 forViewScale:v8];
  [v10 setContentOffset:1];
}

- (void)scrollCanvasUp:(id)a3
{
  if ([(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard])
  {
    [(CRLCanvasEditorHelper *)self p_scrollCanvasForScrollType:0];
  }
}

- (void)scrollCanvasDown:(id)a3
{
  if ([(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard])
  {
    [(CRLCanvasEditorHelper *)self p_scrollCanvasForScrollType:1];
  }
}

- (void)scrollCanvasLeft:(id)a3
{
  if ([(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard])
  {
    [(CRLCanvasEditorHelper *)self p_scrollCanvasForScrollType:2];
  }
}

- (void)scrollCanvasRight:(id)a3
{
  if ([(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard])
  {
    [(CRLCanvasEditorHelper *)self p_scrollCanvasForScrollType:3];
  }
}

- (void)scrollCanvasPageDown:(id)a3
{
  if ([(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard])
  {
    [(CRLCanvasEditorHelper *)self p_scrollCanvasForScrollType:5];
  }
}

- (void)scrollCanvasPageUp:(id)a3
{
  if ([(CRLCanvasEditorHelper *)self p_allowsCanvasScrollingFromKeyboard])
  {
    [(CRLCanvasEditorHelper *)self p_scrollCanvasForScrollType:4];
  }
}

- (void)zoomIn:(id)a3
{
  id v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v3 = [v6 layerHost];
  BOOL v4 = [v3 asiOSCVC];

  double v5 = [[_TtC8Freeform16CRLiOSZoomHelper alloc] initWithInteractiveCanvasController:v6 zoomTrackerDelegate:v4];
  [(CRLiOSZoomHelper *)v5 incrementZoomLevel];
}

- (void)zoomOut:(id)a3
{
  id v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  uint64_t v3 = [v6 layerHost];
  BOOL v4 = [v3 asiOSCVC];

  double v5 = [[_TtC8Freeform16CRLiOSZoomHelper alloc] initWithInteractiveCanvasController:v6 zoomTrackerDelegate:v4];
  [(CRLiOSZoomHelper *)v5 decrementZoomLevel];
}

- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4
{
  id v32 = a4;
  id v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 editingDisabled];

  if ((v7 & 1) == 0)
  {
    double v8 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    double v9 = [v8 layerHost];
    id v10 = [v9 asiOSCVC];
    [v10 hideEditMenu];

    id v11 = [v32 rawValue];
    CGFloat v12 = +[CRLTextInputModifierKeyMask none];
    id v13 = [v12 rawValue];

    if (v11 == v13)
    {
      [(CRLCanvasEditorHelper *)self moveSelections:a3];
    }
    else
    {
      id v14 = [v32 rawValue];
      double v15 = +[CRLTextInputModifierKeyMask shift];
      id v16 = [v15 rawValue];

      if (v14 == v16)
      {
        switch(a3)
        {
          case 1uLL:
            double v17 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v17;
            double v19 = -10.0;
            goto LABEL_16;
          case 2uLL:
            double v17 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v17;
            double v19 = 10.0;
LABEL_16:
            double v30 = 0.0;
            goto LABEL_17;
          case 3uLL:
            double v17 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v17;
            double v19 = 0.0;
            double v30 = -10.0;
            goto LABEL_17;
          case 4uLL:
            double v17 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v17;
            double v19 = 0.0;
            double v30 = 10.0;
LABEL_17:
            [v17 moveSelectionByDelta:v19, v30];
            goto LABEL_24;
          default:
            goto LABEL_25;
        }
      }
      id v20 = [v32 rawValue];
      double v21 = +[CRLTextInputModifierKeyMask option];
      id v22 = [v21 rawValue];

      if (v20 == v22)
      {
        switch(a3)
        {
          case 1uLL:
            double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v23;
            double v24 = -1.0;
            goto LABEL_22;
          case 2uLL:
            double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v23;
            double v24 = 1.0;
            goto LABEL_22;
          case 3uLL:
            double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v23;
            double v24 = 0.0;
            double v31 = -1.0;
            goto LABEL_23;
          case 4uLL:
            double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
            double v18 = v23;
            double v24 = 0.0;
            double v31 = 1.0;
            goto LABEL_23;
          default:
            break;
        }
      }
      else
      {
        id v25 = [v32 rawValue];
        CGRect v26 = +[CRLTextInputModifierKeyMask option];
        unint64_t v27 = (unint64_t)[v26 rawValue];
        CGRect v28 = +[CRLTextInputModifierKeyMask shift];
        unint64_t v29 = (unint64_t)[v28 rawValue] | v27;

        if (v25 == (id)v29)
        {
          switch(a3)
          {
            case 1uLL:
              double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
              double v18 = v23;
              double v24 = -10.0;
              goto LABEL_22;
            case 2uLL:
              double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
              double v18 = v23;
              double v24 = 10.0;
LABEL_22:
              double v31 = 0.0;
              goto LABEL_23;
            case 3uLL:
              double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
              double v18 = v23;
              double v24 = 0.0;
              double v31 = -10.0;
              goto LABEL_23;
            case 4uLL:
              double v23 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
              double v18 = v23;
              double v24 = 0.0;
              double v31 = 10.0;
LABEL_23:
              [v23 duplicateSelectionMovingByDelta:v24, v31];
LABEL_24:

              break;
            default:
              break;
          }
        }
      }
    }
  }
LABEL_25:
}

- (void)moveSelections:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      BOOL v4 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
      double v5 = -1.0;
      goto LABEL_4;
    case 2uLL:
      BOOL v4 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
      double v5 = 1.0;
LABEL_4:
      double v6 = 0.0;
      goto LABEL_7;
    case 3uLL:
      BOOL v4 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
      double v5 = 0.0;
      double v6 = -1.0;
      goto LABEL_7;
    case 4uLL:
      BOOL v4 = [(CRLCanvasEditorHelper *)self keyboardMovementManipulator];
      double v5 = 0.0;
      double v6 = 1.0;
LABEL_7:
      id v7 = v4;
      [v4 moveSelectionByDelta:v5, v6];

      break;
    default:
      return;
  }
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v12 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v11 = [v12 layerHost];
  [v11 presentMediaCompatibilityAlertWithReasons:a3 forMediaType:a4 forSingleMediaObject:v6 completionHandler:v10];
}

- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  double v9 = [v8 hitRep:x, y];

  id v10 = [v9 repForSelecting];
  if (v10
    && -[CRLCanvasEditorHelper wantsToHighlightRep:forDragOperationWithDragInfo:atPoint:allowNonPlaceholderReplacement:](self, "wantsToHighlightRep:forDragOperationWithDragInfo:atPoint:allowNonPlaceholderReplacement:", v10, v7, 0, x, y))
  {
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  if (!self->mDragAndDropHighlightDecorator)
  {
    double v5 = [CRLDragAndDropCanvasHighlightDecorator alloc];
    BOOL v6 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v7 = [(CRLDragAndDropCanvasHighlightDecorator *)v5 initWithInteractiveCanvasController:v6];
    mDragAndDropHighlightDecorator = self->mDragAndDropHighlightDecorator;
    self->mDragAndDropHighlightDecorator = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
    id v10 = (const CGPath *)[WeakRetained newDragAndDropHighlightPathWithInset:1.0];

    [(CRLDragAndDropCanvasHighlightDecorator *)self->mDragAndDropHighlightDecorator beginHighlightingWithPath:v10];
    CGPathRelease(v10);
  }
  id v11 = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v12 = [v11 newDragAndDropHighlightPathWithInset:1.0];

  [(CRLDragAndDropCanvasHighlightDecorator *)self->mDragAndDropHighlightDecorator setHighlightPath:v12];

  CFRelease(v12);
}

- (void)hideDragAndDropUI
{
  [(CRLDragAndDropCanvasHighlightDecorator *)self->mDragAndDropHighlightDecorator endHighlighting];
  mDragAndDropHighlightDecorator = self->mDragAndDropHighlightDecorator;
  self->mDragAndDropHighlightDecorator = 0;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  return 1;
}

- (BOOL)wantsToHighlightRep:(id)a3 forDragOperationWithDragInfo:(id)a4 atPoint:(CGPoint)a5 allowNonPlaceholderReplacement:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  if (v8
    && ([v8 isLocked] & 1) == 0
    && ([v8 isInDynamicOperation] & 1) == 0
    && [v9 numberOfDraggingItems] == (id)1)
  {
    id v10 = [v9 promisedUTIs];
    id v11 = [v9 itemSource];
    if ([v11 hasNativeBoardItems]
      && ([v11 hasSingleNativeImageBoardItem] & 1) == 0
      && ![v11 hasSingleNativeMovieBoardItem])
    {
      unsigned __int8 v23 = 0;
LABEL_26:

      goto LABEL_13;
    }
    uint64_t v12 = objc_opt_class();
    id v13 = sub_1002469D0(v12, v8);
    uint64_t v14 = objc_opt_class();
    double v15 = sub_1002469D0(v14, v8);
    uint64_t v16 = objc_opt_class();
    double v17 = sub_1002469D0(v16, v8);
    uint64_t v18 = objc_opt_class();
    double v19 = sub_1002469D0(v18, v8);
    if (!v13)
    {
      if (v15 && [v15 canBeUsedForImageMask])
      {
        unint64_t v29 = v19;
        double v31 = 0;
        id v20 = v11;
        double v21 = v15;
        id v22 = +[CRLBoardItemImporter supportedImageFileUTTypes];
        goto LABEL_16;
      }
      if (!v17)
      {
        id v22 = 0;
        unsigned __int8 v23 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    double v30 = v19;
    double v31 = v13;
    id v20 = v11;
    double v21 = v15;
    +[CRLBoardItemImporter supportedImageFileUTTypes];
    v26 = id v25 = v10;
    +[CRLIngestionTypes supportedMovieUTTypes];
    CGRect v28 = v27 = v17;
    id v22 = [v26 arrayByAddingObjectsFromArray:v28];

    double v17 = v27;
    id v10 = v25;
LABEL_16:
    if (v22)
    {
      double v15 = v21;
      id v11 = v20;
      double v19 = v29;
      if (!v29 || a6 || [v29 shouldAllowReplacementFromDrop]) {
        unsigned __int8 v23 = [v10 crl_conformsToAnyUTType:v22];
      }
      else {
        unsigned __int8 v23 = 0;
      }
      id v13 = v31;
    }
    else
    {
      unsigned __int8 v23 = 0;
      double v15 = v21;
      id v11 = v20;
      double v19 = v29;
      id v13 = v31;
    }
    goto LABEL_25;
  }
  unsigned __int8 v23 = 0;
LABEL_13:

  return v23;
}

- (BOOL)insertBoardItemsFromDragAndDrop:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5 insertionContext:(id)a6 alreadyPositionedInputInfos:(BOOL)a7
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = v14;
  id v17 = v15;
  uint64_t v18 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  double v19 = [v18 commandController];

  id v20 = +[NSBundle mainBundle];
  double v21 = [v20 localizedStringForKey:@"Insert" value:0 table:@"UndoStrings"];

  id v22 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  [v22 endEditing];

  [v19 openGroup];
  [v19 enableProgressiveEnqueuingInCurrentGroup];
  id v23 = [v13 count];
  id v24 = 0;
  if (!v16 || v23 != (id)1) {
    goto LABEL_51;
  }
  uint64_t v25 = [v16 info];
  if (!v25)
  {
    id v24 = 0;
    goto LABEL_51;
  }
  CGRect v26 = (void *)v25;
  BOOL v124 = a7;
  unsigned __int8 v27 = [v16 isLocked];

  if ((v27 & 1) == 0)
  {
    v123 = v21;
    id v116 = v17;
    CGRect v28 = [v13 lastObject];
    uint64_t v29 = objc_opt_class();
    double v118 = v16;
    double v30 = [v16 info];
    double v31 = sub_1002469D0(v29, v30);

    uint64_t v32 = objc_opt_class();
    uint64_t v33 = sub_1002469D0(v32, v28);
    uint64_t v34 = objc_opt_class();
    v121 = sub_1002469D0(v34, v28);
    uint64_t v35 = objc_opt_class();
    id v120 = v28;
    CGRect v36 = sub_1002469D0(v35, v28);
    double v37 = (void *)v33;
    uint64_t v38 = objc_opt_class();
    double v39 = sub_1002469D0(v38, v31);
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = sub_1002469D0(v40, v31);
    uint64_t v42 = objc_opt_class();
    double v119 = v31;
    double v43 = v31;
    uint64_t v44 = v37;
    uint64_t v45 = sub_1002469D0(v42, v43);
    id v46 = (void *)v45;
    double v117 = v36;
    uint64_t v122 = (void *)v41;
    v115 = (void *)v45;
    if (v37 && v39)
    {
      id v47 = [v39 maskInfo];

      if (!v47)
      {
        uint64_t v48 = [_TtC8Freeform17CRLCommandSetMask alloc];
        id v49 = [v39 defaultMaskInfo];
        int v50 = [(CRLCommandSetMask *)v48 initWithImageItem:v39 maskInfo:v49];

        [v19 enqueueCommand:v50];
      }
      CGFloat v51 = [_TtC8Freeform22CRLCommandReplaceImage alloc];
      CGFloat v52 = [v37 imageAssetPayload];
      CGFloat v53 = [v37 thumbnailAssetPayload];
      CGFloat v54 = [(CRLCommandReplaceImage *)v51 initWithImageItem:v39 imageData:v52 thumbnailData:v53];

      [v19 enqueueCommand:v54];
      double v55 = +[NSBundle mainBundle];
      uint64_t v56 = [v55 localizedStringForKey:@"Replace with Image" value:0 table:@"UndoStrings"];

      id v24 = 0;
      char v57 = 1;
      v123 = (void *)v56;
      a7 = v124;
      id v46 = v115;
      id v17 = v116;
LABEL_50:

      double v21 = v123;
      uint64_t v16 = v118;
      if (v57) {
        goto LABEL_54;
      }
      goto LABEL_51;
    }
    v114 = v39;
    if (!v36 || !v45 || ([v121 isAudioOnly] & 1) != 0)
    {
      id v24 = 0;
      char v57 = 0;
      a7 = v124;
      id v17 = v116;
      if (v44)
      {
        if (!v122)
        {
          id v46 = v115;
          goto LABEL_50;
        }
        uint64_t v112 = v44;
        uint64_t v58 = objc_opt_class();
        double v59 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
        double v60 = [v59 repForInfo:v122];
        id v61 = sub_1002469D0(v58, v60);

        if (v61 && [v61 canBeUsedForImageMask])
        {
          uint64_t v62 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, x, y);
          id v109 = [(CRLCanvasEditorHelper *)self canvasEditor];
          double v63 = [v61 info];
          double v64 = [v109 selectionPathWithInfo:v63];
          id v65 = [(CRLCanvasEditorHelper *)self canvasEditor];
          double v66 = [v65 editorController];
          [v66 setSelectionPath:v64];

          id v67 = [(CRLCanvasEditorHelper *)self canvasEditor];
          id v110 = (void *)v62;
          [v67 prepareGeometryForInsertingBoardItems:v13 withInsertionContext:v62];

          long long v68 = [CRLCanvasCommandSelectionBehavior alloc];
          long long v69 = [(CRLCanvasEditorHelper *)self canvasEditor];
          double v70 = +[NSSet setWithObject:v120];
          CGFloat v71 = [(CRLCanvasCommandSelectionBehavior *)v68 initWithCanvasEditor:v69 type:3 constructedInfos:v70];

          double v72 = +[NSArray arrayWithObject:v120];
          uint64_t v73 = [(CRLCanvasEditorHelper *)self commandForInsertingBoardItemsIntoTopLevelContainer:v72 below:v119];

          v107 = (void *)v73;
          double v108 = v71;
          [v19 enqueueCommand:v73 withSelectionBehavior:v71];
          double v74 = [(CRLCanvasEditorHelper *)self commandsToSwapConnectionsFromRep:v61 toInfo:v112];
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v75 = [v74 countByEnumeratingWithState:&v125 objects:v133 count:16];
          if (v75)
          {
            id v76 = v75;
            uint64_t v77 = *(void *)v126;
            do
            {
              for (uint64_t i = 0; i != v76; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v126 != v77) {
                  objc_enumerationMutation(v74);
                }
                [v19 enqueueCommand:*(void *)(*((void *)&v125 + 1) + 8 * i)];
              }
              id v76 = [v74 countByEnumeratingWithState:&v125 objects:v133 count:16];
            }
            while (v76);
          }
          double v79 = v61;
          [(CRLCanvasEditorHelper *)self maskImage:v112 withShape:v122 shouldOpenGroup:0 shouldBeginEditing:0];
          double v80 = +[NSBundle mainBundle];
          uint64_t v81 = [v80 localizedStringForKey:@"Mask With Shape" value:0 table:@"UndoStrings"];

          uint64_t v44 = v112;
          id v24 = v112;

          char v57 = 1;
          v123 = (void *)v81;
          a7 = v124;
        }
        else
        {
          double v79 = v61;
          char v57 = 0;
          id v24 = 0;
          a7 = v124;
          uint64_t v44 = v112;
        }
        id v46 = v115;
      }
      goto LABEL_49;
    }
    v113 = v37;
    [v36 takePropertiesFromReplacedBoardItem:v46];
    id v17 = v116;
    if ([v36 isAnimatedImage]
      && ([v46 isAnimatedImage] & 1) == 0)
    {
      [v36 setIsLooping:1];
    }
    double v82 = [(CRLCanvasEditorHelper *)self commandsToSwapConnectionsFromRep:v118 toInfo:v36];
    double v83 = [CRLCanvasCommandSelectionBehavior alloc];
    uint64_t v84 = [(CRLCanvasEditorHelper *)self canvasEditor];
    double v85 = v36;
    double v86 = (void *)v84;
    CGFloat v87 = +[NSSet setWithObject:v85];
    CGFloat v88 = [(CRLCanvasCommandSelectionBehavior *)v83 initWithCanvasEditor:v86 type:3 constructedInfos:v87];

    id v111 = v88;
    [v19 openGroupWithSelectionBehavior:v88];
    [(CRLCanvasEditorHelper *)self replaceBoardItem:v119 withBoardItem:v120];
    [v19 closeGroup];
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v89 = v82;
    id v90 = [v89 countByEnumeratingWithState:&v129 objects:v134 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v130;
      do
      {
        for (j = 0; j != v91; j = (char *)j + 1)
        {
          if (*(void *)v130 != v92) {
            objc_enumerationMutation(v89);
          }
          [v19 enqueueCommand:*(void *)(*((void *)&v129 + 1) + 8 * (void)j)];
        }
        id v91 = [v89 countByEnumeratingWithState:&v129 objects:v134 count:16];
      }
      while (v91);
    }

    uint64_t v44 = v113;
    if (v113)
    {
      id v94 = +[NSBundle mainBundle];
      uint64_t v95 = [v94 localizedStringForKey:@"Replace with Image" value:0 table:@"UndoStrings"];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        a7 = v124;
        id v46 = v115;
        goto LABEL_48;
      }
      uint64_t v96 = objc_opt_class();
      id v94 = sub_1002469D0(v96, v117);
      unsigned int v97 = [v94 isAudioOnly];
      double v98 = +[NSBundle mainBundle];
      double v99 = v98;
      uint64_t v44 = 0;
      if (v97) {
        CFStringRef v100 = @"Replace with Audio";
      }
      else {
        CFStringRef v100 = @"Replace with Video";
      }
      uint64_t v95 = [v98 localizedStringForKey:v100 value:0 table:@"UndoStrings"];

      v123 = v99;
    }
    a7 = v124;
    id v46 = v115;

    v123 = (void *)v95;
LABEL_48:

    id v24 = 0;
    char v57 = 1;
LABEL_49:
    double v39 = v114;
    goto LABEL_50;
  }
  id v24 = 0;
  a7 = v124;
LABEL_51:
  if (!a7)
  {
    double v101 = [(CRLCanvasEditorHelper *)self canvasEditor];
    [v101 prepareGeometryForInsertingBoardItems:v13 withInsertionContext:v17];
  }
  double v102 = [(CRLCanvasEditorHelper *)self canvasEditor];
  [v102 insertBoardItems:v13 withInsertionContext:v17 postProcessBlock:0];

LABEL_54:
  [v19 setCurrentGroupActionString:v21];
  [v19 closeGroup];
  if (v24)
  {
    double v103 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    [v103 layoutIfNeeded];

    uint64_t v104 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    v105 = [v104 repForInfo:v24];

    [v105 editMaskWithHUD:1];
  }

  return 1;
}

- (void)addContextualMenuItemsToArray:(id)a3
{
  id v7 = a3;
  if ([(CRLCanvasEditorHelper *)self canPerformMaskWithShapeWithSender:0])
  {
    BOOL v4 = +[NSBundle mainBundle];
    double v5 = [v4 localizedStringForKey:@"Mask with Shape" value:0 table:0];

    id v6 = [objc_alloc((Class)UIMenuItem) initWithTitle:v5 action:"maskWithShape:"];
    [v7 addObject:v6];
  }
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  -[CRLCanvasEditorHelper addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
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
      uint64_t v12 = 0;
      id v25 = v10;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v12);
        id v14 = [v13 crlaxValueForKey:@"children"];
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
            for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              double v21 = [v20 title];
              if ([v21 length])
              {
                id v22 = [v20 state];

                if (v22 != (id)1) {
                  continue;
                }
                double v21 = [v20 title];
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
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v128 = a3;
  long long v125 = (char *)[v128 count];
  BOOL v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"BACK_CONTEXT_MENU" value:@"Back" table:0];

  id v6 = +[UIImage systemImageNamed:@"square.3.stack.3d.bottom.filled"];
  id v7 = +[UICommand commandWithTitle:v5 image:v6 action:"sendToBack:" propertyList:0];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Front" value:0 table:0];
  id v10 = +[UIImage systemImageNamed:@"square.3.stack.3d.top.filled"];
  uint64_t v11 = +[UICommand commandWithTitle:v9 image:v10 action:"bringToFront:" propertyList:0];

  v141[0] = v7;
  v141[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v141 count:2];
  id v13 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLZOrderMenuIdentifier" options:1 children:v12];

  [v13 setPreferredElementSize:1];
  [v128 insertObject:v13 atIndex:v125];

  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"Cut" value:0 table:0];
  id v16 = +[UIImage systemImageNamed:@"scissors"];
  long long v129 = +[UICommand commandWithTitle:v15 image:v16 action:"cut:" propertyList:0];

  id v17 = +[NSBundle mainBundle];
  uint64_t v18 = [v17 localizedStringForKey:@"Copy" value:0 table:0];
  double v19 = +[UIImage systemImageNamed:@"doc.on.doc"];
  id v20 = +[UICommand commandWithTitle:v18 image:v19 action:"copy:" propertyList:0];

  double v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"Paste" value:0 table:0];
  id v23 = +[UIImage systemImageNamed:@"doc.on.clipboard"];
  uint64_t v24 = +[UICommand commandWithTitle:v22 image:v23 action:"paste:" propertyList:0];

  id v25 = +[NSBundle mainBundle];
  CGRect v26 = [v25 localizedStringForKey:@"Duplicate" value:0 table:0];
  long long v27 = +[UIImage systemImageNamed:@"plus.square.on.square"];
  long long v28 = +[UICommand commandWithTitle:v26 image:v27 action:"duplicate:" propertyList:0];

  long long v29 = +[NSBundle mainBundle];
  long long v30 = [v29 localizedStringForKey:@"Lock" value:0 table:0];
  long long v31 = +[UIImage systemImageNamed:@"lock"];
  long long v32 = +[UICommand commandWithTitle:v30 image:v31 action:"lock:" propertyList:0];

  v140[0] = v129;
  v140[1] = v20;
  v140[2] = v24;
  v140[3] = v28;
  v140[4] = v32;
  long long v33 = +[NSArray arrayWithObjects:v140 count:5];
  long long v34 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLCutCopyPasteMenuIdentifier" options:1 children:v33];

  [v128 insertObject:v34 atIndex:v125 + 1];
  long long v131 = v125 + 2;

  uint64_t v35 = [(CRLCanvasEditorHelper *)self canvasEditor];
  CGRect v36 = [v35 editorController];
  double v37 = [v36 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  long long v130 = v37;
  if (v37)
  {
    uint64_t v38 = [v37 makeSelectionSpecificMenuElements];
    if ([v38 count])
    {
      double v39 = &off_1014C1000;
      uint64_t v40 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v38];
      [v128 insertObject:v40 atIndex:v131];
      long long v131 = v125 + 3;

      uint64_t v41 = &off_1014C1000;
      uint64_t v42 = &off_1014C1000;
    }
    else
    {
      uint64_t v41 = &off_1014C1000;
      uint64_t v42 = &off_1014C1000;
      double v39 = &off_1014C1000;
    }
  }
  else
  {
    uint64_t v41 = &off_1014C1000;
    uint64_t v42 = &off_1014C1000;
    double v39 = &off_1014C1000;
  }
  double v43 = v42[212];
  uint64_t v44 = +[NSBundle mainBundle];
  uint64_t v45 = [v44 localizedStringForKey:@"Copy Style" value:0 table:0];
  id v46 = [(__objc2_class *)v41[239] imageNamed:@"sf_tb_style_copy"];
  long long v126 = [(__objc2_class *)v43 commandWithTitle:v45 image:v46 action:"copyStyle:" propertyList:0];

  id v47 = v42[212];
  uint64_t v48 = +[NSBundle mainBundle];
  id v49 = [v48 localizedStringForKey:@"Paste Style" value:0 table:0];
  int v50 = [(__objc2_class *)v41[239] imageNamed:@"sf_tb_style_paste"];
  CGFloat v51 = [(__objc2_class *)v47 commandWithTitle:v49 image:v50 action:"pasteStyle:" propertyList:0];

  CGFloat v52 = v39[252];
  v139[0] = v126;
  v139[1] = v51;
  CGFloat v53 = +[NSArray arrayWithObjects:v139 count:2];
  CGFloat v54 = [(__objc2_class *)v52 menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v53];

  double v55 = +[NSBundle mainBundle];
  uint64_t v56 = [v55 localizedStringForKey:@"Save as Insert Style" value:0 table:0];
  char v57 = +[UICommand commandWithTitle:v56 image:0 action:"saveDefaultInsertionPreset:" propertyList:0];

  uint64_t v58 = v39[252];
  double v59 = +[NSBundle mainBundle];
  double v60 = [v59 localizedStringForKey:@"Style" value:0 table:0];
  id v61 = [(__objc2_class *)v41[239] systemImageNamed:@"eyedropper"];
  v138[0] = v54;
  v138[1] = v57;
  uint64_t v62 = +[NSArray arrayWithObjects:v138 count:2];
  double v63 = [(__objc2_class *)v58 menuWithTitle:v60 image:v61 identifier:@"CRLStyleMenuIdentifier" options:0 children:v62];

  [v128 insertObject:v63 atIndex:v131];
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled])
  {
    double v64 = +[NSBundle mainBundle];
    id v65 = [v64 localizedStringForKey:@"Add Connection Line" value:0 table:0];
    double v66 = +[UIImage imageNamed:@"circle.square.square.diagram"];
    id v67 = +[UICommand commandWithTitle:v65 image:v66 action:"connectWithConnectionLine:" propertyList:0];

    long long v137 = v67;
    long long v68 = +[NSArray arrayWithObjects:&v137 count:1];
    long long v69 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v68];

    [v128 addObject:v69];
  }
  double v70 = +[NSBundle mainBundle];
  CGFloat v71 = [v70 localizedStringForKey:@"Constrain Proportions" value:0 table:0];
  double v72 = +[UIImage systemImageNamed:@"square.split.bottomrightquarter"];
  uint64_t v73 = +[UICommand commandWithTitle:v71 image:v72 action:"toggleAspectRatioLock:" propertyList:0];

  double v74 = [v130 aspectRatioLockControlState];
  [v73 setState:[v74 stateValue]];
  long long v136 = v73;
  id v75 = +[NSArray arrayWithObjects:&v136 count:1];
  id v76 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v75];

  [v128 addObject:v76];
  uint64_t v77 = +[NSBundle mainBundle];
  long long v78 = [v77 localizedStringForKey:@"Description" value:0 table:0];
  double v79 = +[UIImage _systemImageNamed:@"accessibility"];
  double v80 = +[UICommand commandWithTitle:v78 image:v79 action:"editAccessibilityDescription:" propertyList:0];

  long long v135 = v80;
  uint64_t v81 = +[NSArray arrayWithObjects:&v135 count:1];
  double v82 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLDescriptionMenuIdentifier" options:1 children:v81];

  [v128 addObject:v82];
  if (!v130
    || ([v130 boardItems],
        double v83 = objc_claimAutoreleasedReturnValue(),
        id v84 = [v83 count],
        v83,
        (unint64_t)v84 >= 2))
  {
    double v85 = +[NSBundle mainBundle];
    double v86 = [v85 localizedStringForKey:@"Select Objects…" value:0 table:0];
    CGFloat v87 = +[UIImage systemImageNamed:@"square.dashed"];
    CGFloat v88 = +[UICommand commandWithTitle:v86 image:v87 action:"enterQuickSelectMode:" propertyList:0];

    long long v134 = v88;
    id v89 = +[NSArray arrayWithObjects:&v134 count:1];
    id v90 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v89];

    [v128 addObject:v90];
  }
  id v91 = v131 + 1;
  if (+[CRLFeatureFlagGroup isStencilsEnabled])
  {
    uint64_t v92 = [v130 boardItems];
    id v93 = [v92 count];

    if (v93)
    {
      id v94 = +[NSBundle mainBundle];
      uint64_t v95 = [v94 localizedStringForKey:@"Save to Library…" value:0 table:0];
      uint64_t v96 = +[UIImage systemImageNamed:@"books.vertical"];
      unsigned int v97 = +[UICommand commandWithTitle:v95 image:v96 action:"saveSelectedBoardItemsAsStencil:" propertyList:0];

      long long v133 = v97;
      double v98 = +[NSArray arrayWithObjects:&v133 count:1];
      double v99 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v98];

      [v128 addObject:v99];
    }
  }
  CFStringRef v100 = +[NSBundle mainBundle];
  double v101 = [v100 localizedStringForKey:@"Delete" value:0 table:0];
  double v102 = +[UIImage systemImageNamed:@"trash"];
  double v103 = +[UICommand commandWithTitle:v101 image:v102 action:"delete:" propertyList:0];

  [v103 setAttributes:2];
  long long v132 = v103;
  uint64_t v104 = +[NSArray arrayWithObjects:&v132 count:1];
  v105 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v104];

  [v128 addObject:v105];
  if ([(CRLCanvasEditorHelper *)self canPerformMaskWithShapeWithSender:0])
  {
    v106 = +[NSBundle mainBundle];
    v107 = [v106 localizedStringForKey:@"Mask with Shape" value:0 table:0];
    double v108 = +[UIImage imageNamed:@"dash.square.on.circle"];
    id v109 = +[UICommand commandWithTitle:v107 image:v108 action:"maskWithShape:" propertyList:0];

    [v128 insertObject:v109 atIndex:v91];
    id v91 = v131 + 2;
  }
  id v110 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v111 = [v110 freehandDrawingToolkit];
  unsigned int v112 = [v111 isInDrawingMode];

  if (v112)
  {
    v113 = +[NSBundle mainBundle];
    v114 = [v113 localizedStringForKey:@"Select All" value:0 table:0];
    v115 = +[UIImage systemImageNamed:@"square.dashed"];
    id v116 = +[UICommand commandWithTitle:v114 image:v115 action:"selectAll:" propertyList:0];

    [v128 insertObject:v116 atIndex:v91++];
  }
  double v117 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  if ([v117 documentIsSharedReadOnly]) {
    goto LABEL_25;
  }
  double v118 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  unsigned int v119 = +[CRLGenerativePlaygroundHelper iccHasGenerativePlaygroundInputSelection:v118];

  if (v119)
  {
    id v120 = +[NSBundle mainBundle];
    v121 = [v120 localizedStringForKey:@"Add to Playground" value:0 table:0];
    uint64_t v122 = +[UIImage systemImageNamed:@"apple.image.playground"];
    double v117 = +[UICommand commandWithTitle:v121 image:v122 action:"presentGenerativePlaygroundForCurrentSelection:" propertyList:0];

    v123 = (char *)[v128 indexOfObjectPassingTest:&stru_1014E17E0];
    if (v123 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      BOOL v124 = v91;
    }
    else {
      BOOL v124 = v123 + 1;
    }
    [v128 insertObject:v117 atIndex:v124];
LABEL_25:
  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = a3;
  id v76 = (char *)[v5 count];
  id v6 = [(CRLCanvasEditorHelper *)self layoutsForAlignAndDistribute];
  id v7 = [v6 count];

  int64_t v8 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformUngroupActionWithSender:@"CRLMiniFormatter"];
  int64_t v9 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformGroupActionWithSender:@"CRLMiniFormatter"];
  id v10 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v75 = [v10 infosForCurrentSelectionPath];

  p_vtable = &OBJC_METACLASS___CRLWPShapeLayout.vtable;
  uint64_t v77 = v5;
  if ((unint64_t)v7 > 1 || (v9 != 1 ? (BOOL v12 = v8 == 1) : (BOOL v12 = 1), v12))
  {
    +[NSBundle mainBundle];
    id v13 = v74 = v8;
    id v14 = [v13 localizedStringForKey:@"Align Objects…" value:0 table:0];
    id v15 = +[CRLImage crl_quickInspectorImageNamed:@"rectangle.3.group"];
    id v16 = +[NSBundle mainBundle];
    id v17 = [v16 localizedStringForKey:@"Arrange" value:0 table:0];
    uint64_t v18 = +[CRLQuickInspectorElement elementWithName:v14 image:v15 type:2 options:0x4000 crlaxLabel:v17];

    int64_t v8 = v74;
    [v18 setTag:0];
    if ((unint64_t)v7 >= 2 && v9 == 1 && v74 == 1)
    {
      double v19 = +[NSBundle mainBundle];
      id v20 = v19;
      CFStringRef v21 = @"Align, distribute, group, or ungroup selected objects";
    }
    else
    {
      if ((unint64_t)v7 < 2)
      {
        p_vtable = &OBJC_METACLASS___CRLWPShapeLayout.vtable;
        if (v9 == 1)
        {
          long long v29 = +[NSBundle mainBundle];
          long long v30 = [v29 localizedStringForKey:@"Group selected objects" value:0 table:0];
          [v18 setToolTip:v30];

          id v23 = v76;
          id v5 = v77;
        }
        else
        {
          id v23 = v76;
          id v5 = v77;
          if (v74 == 1)
          {
            long long v33 = +[NSBundle mainBundle];
            long long v34 = [v33 localizedStringForKey:@"Ungroup selected objects" value:0 table:0];
            [v18 setToolTip:v34];

            id v5 = v77;
          }
        }
        goto LABEL_29;
      }
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v24 = v75;
      id v25 = (char *)[v24 countByEnumeratingWithState:&v78 objects:v82 count:16];
      if (v25)
      {
        CGRect v26 = v25;
        uint64_t v27 = *(void *)v79;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v79 != v27) {
              objc_enumerationMutation(v24);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }

            long long v31 = +[NSBundle mainBundle];
            long long v32 = [v31 localizedStringForKey:@"Align, distribute, or group selected objects", 0, 0 value table];
            [v18 setToolTip:v32];

            id v23 = v76;
            id v5 = v77;
            p_vtable = (void **)(&OBJC_METACLASS___CRLWPShapeLayout + 24);
            int64_t v8 = v74;
            goto LABEL_29;
          }
          CGRect v26 = (char *)[v24 countByEnumeratingWithState:&v78 objects:v82 count:16];
          int64_t v8 = v74;
          if (v26) {
            continue;
          }
          break;
        }
      }

      double v19 = +[NSBundle mainBundle];
      id v20 = v19;
      CFStringRef v21 = @"Align, distribute, group, or combine shapes";
    }
    id v22 = [v19 localizedStringForKey:v21 value:0 table:0];
    [v18 setToolTip:v22];

    id v23 = v76;
    id v5 = v77;
    p_vtable = (void **)(&OBJC_METACLASS___CRLWPShapeLayout + 24);
LABEL_29:
    [v5 addObject:v18];
    id v76 = v23 + 1;
  }
  if ((id)[(CRLCanvasEditorHelper *)self canvasEditorCanPerformDuplicateAction:"duplicate:" withSender:@"CRLMiniFormatter"] == (id)1)
  {
    uint64_t v35 = v5;
    CGRect v36 = p_vtable + 472;
    double v37 = +[NSBundle mainBundle];
    uint64_t v38 = [v37 localizedStringForKey:@"Duplicate" value:0 table:0];
    double v39 = +[CRLImage crl_quickInspectorImageNamed:@"plus.square.on.square"];
    uint64_t v40 = [v36 elementWithName:v38 image:v39 type:0 action:"duplicate:" parent:0 children:0];

    [v35 insertObject:v40 atIndex:v76];
    uint64_t v41 = v76 + 1;
  }
  else
  {
    uint64_t v41 = v76;
  }
  if ((id)[(CRLCanvasEditorHelper *)self canvasEditorCanPerformDeleteAction:"delete:" withSender:@"CRLMiniFormatter"] == (id)1)
  {
    uint64_t v42 = +[NSBundle mainBundle];
    double v43 = [v42 localizedStringForKey:@"Delete" value:0 table:0];
    uint64_t v44 = +[CRLImage crl_quickInspectorImageNamed:@"trash"];
    uint64_t v45 = +[CRLQuickInspectorElement elementWithName:v43 image:v44 type:0 action:"delete:" parent:0 children:0];

    id v46 = (void **)(&OBJC_METACLASS___CRLWPShapeLayout + 24);
    [v45 setTag:23];
    id v47 = +[CRLColor redColor];
    [v45 setTintColor:v47];

    [v77 insertObject:v45 atIndex:v41++];
  }
  else
  {
    id v46 = &OBJC_METACLASS___CRLWPShapeLayout.vtable;
  }
  uint64_t v48 = v46 + 472;
  id v49 = +[NSBundle mainBundle];
  int v50 = [v49 localizedStringForKey:@"Lock" value:0 table:0];
  CGFloat v51 = +[CRLImage crl_quickInspectorImageNamed:@"lock"];
  CGFloat v52 = [v48 elementWithName:v50 image:v51 type:1 action:"lock:" parent:0 children:0];

  int64_t v53 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformLockAction:"lock:" withSender:0];
  int64_t v54 = [(CRLCanvasEditorHelper *)self canvasEditorCanPerformLockAction:"unlock:" withSender:0];
  if (v53 == 1)
  {
    double v55 = v77;
    [v77 insertObject:v52 atIndex:v41];
    if (v54 != 1 && v8 != 1) {
      goto LABEL_48;
    }
    uint64_t v56 = v41 + 1;
    char v57 = +[NSBundle mainBundle];
    uint64_t v58 = [v57 localizedStringForKey:@"Lock" value:0 table:0];
    +[CRLImage crl_quickInspectorImageNamed:@"lock"];
    v60 = double v59 = v41;
    id v61 = +[CRLQuickInspectorElement elementWithName:v58 image:v60 type:2 action:"lock:" parent:0 children:0];

    [v61 setTag:21];
    uint64_t v62 = +[NSBundle mainBundle];
    double v63 = [v62 localizedStringForKey:@"Lock selected objects" value:0 table:0];
    [v61 setToolTip:v63];

    double v55 = v77;
    [v77 insertObject:v61 atIndex:v56];
    uint64_t v41 = v59 + 2;
  }
  else
  {
    double v55 = v77;
  }
  if (v54 == 1)
  {
    double v64 = +[NSBundle mainBundle];
    id v65 = [v64 localizedStringForKey:@"Unlock" value:0 table:0];
    double v66 = +[CRLImage crl_quickInspectorImageNamed:@"lock.open"];
    id v67 = +[CRLQuickInspectorElement elementWithName:v65 image:v66 type:2 action:"unlock:" parent:0 children:0];

    [v67 setTag:22];
    if ([v75 count] == (id)1)
    {
      long long v68 = [v75 anyObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      double v70 = +[NSBundle mainBundle];
      CGFloat v71 = v70;
      if (isKindOfClass) {
        CFStringRef v72 = @"Unlock this group";
      }
      else {
        CFStringRef v72 = @"Unlock this object";
      }
    }
    else
    {
      double v70 = +[NSBundle mainBundle];
      CGFloat v71 = v70;
      CFStringRef v72 = @"Unlock selected objects";
    }
    uint64_t v73 = [v70 localizedStringForKey:v72 value:0 table:0];
    double v55 = v77;
    [v67 setToolTip:v73];

    [v77 insertObject:v67 atIndex:v41];
  }
LABEL_48:
}

- (void)contextMenuDidHideForContextMenuController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasEditorHelper *)self contextMenuController];

  if (v5 == v4)
  {
    [(CRLCanvasEditorHelper *)self setContextMenuController:0];
    [(CRLCanvasEditorHelper *)self setCustomPasteMenuDisplayed:0];
  }
}

- (id)shapeInfoToBeginEditing
{
  uint64_t v3 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  id v4 = [v3 editorController];
  id v5 = [v3 selectionModelTranslator];
  id v6 = [(CRLCanvasEditorHelper *)self canvasEditor];
  id v7 = [v4 textInputEditor];
  if (v7 == v6)
  {
    int64_t v9 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
    id v10 = [v9 editorController];
    uint64_t v11 = [v10 selectionPath];
    BOOL v12 = [v5 boardItemsForSelectionPath:v11];

    if ([v12 count] == (id)1)
    {
      id v13 = [v12 crl_onlyObject];
      if ([v13 locked])
      {
        id v8 = 0;
      }
      else
      {
        uint64_t v14 = objc_opt_class();
        id v15 = sub_1002469D0(v14, v13);
        if (v15)
        {
          id v16 = (objc_class *)objc_opt_class();
          id v17 = [v3 repForInfo:v15];
          uint64_t v18 = sub_10024715C(v16, v17);

          double v19 = v18;
          if ([v18 canBeginEditing]) {
            id v8 = v15;
          }
          else {
            id v8 = 0;
          }
        }
        else
        {
          id v8 = 0;
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)beginEditingOnKeyInputWithString:(id)a3
{
  id v10 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLCanvasEditorHelper *)self shapeInfoToBeginEditing];
  id v6 = sub_1002469D0(v4, v5);

  if (v6)
  {
    id v7 = [v6 textStorage];
    id v8 = [v7 range];
    -[CRLCanvasEditorHelper p_beginEditingTextShape:replacementRange:withText:](self, "p_beginEditingTextShape:replacementRange:withText:", v6, v8, v9, v10);
  }
}

- (void)p_beginEditingTextShape:(id)a3 replacementRange:(_NSRange)a4 withText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(CRLCanvasEditorHelper *)self interactiveCanvasController];
  if (+[CRLWPEditor canEditTextIn:v9 using:v11])
  {
    BOOL v12 = [v11 selectionModelTranslator];
    id v13 = [v9 textStorage];
    uint64_t v14 = [v12 selectionPathForRange:location, length, v13];

    id v15 = [v11 editorController];
    [v15 setSelectionPath:v14];

    uint64_t v20 = 0;
    CFStringRef v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_1001F1504;
    id v24 = sub_1001F1514;
    id v25 = 0;
    id v16 = [v11 editorController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001F6FB0;
    v19[3] = &unk_1014D1520;
    v19[4] = &v20;
    [v16 enumerateEditorsOnStackUsingBlock:v19];

    id v17 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", location, length);
    uint64_t v18 = [(id)v21[5] textInputReceiver];
    [v18 replace:v17 with:v10];

    _Block_object_dispose(&v20, 8);
  }
}

- (CRLiOSContextMenuController)contextMenuController
{
  return self->mContextMenuController;
}

- (void)setContextMenuController:(id)a3
{
}

- (BOOL)customPasteMenuDisplayed
{
  return self->mCustomPasteMenuDisplayed;
}

- (void)setCustomPasteMenuDisplayed:(BOOL)a3
{
  self->mCustomPasteMenuDisplayed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContextMenuController, 0);
  objc_storeStrong((id *)&self->mDragAndDropHighlightDecorator, 0);
  objc_storeStrong((id *)&self->mKeyboardManipulator, 0);

  objc_destroyWeak((id *)&self->mCanvasEditor);
}

@end