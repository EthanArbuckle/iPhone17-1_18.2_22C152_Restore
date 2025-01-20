@interface CRLFreehandDrawingEditor
+ (id)snapToShapeActionSymbolName;
- (BOOL)canCopySubselection;
- (BOOL)canPasteIntoCurrentlySelectedGroups;
- (BOOL)crlaxShouldOfferSnapToShapeFromInfo:(id)a3;
- (BOOL)isEditingFreehandDrawing;
- (BOOL)p_areAllSelectedInfosFreehandDrawings;
- (BOOL)p_currentlyEditingInGroup;
- (BOOL)p_currentlyInFreehandDrawingMode;
- (BOOL)p_hasTransformableDrawingsSelected;
- (BOOL)p_shouldPreventPasteForItemSource:(id)a3;
- (BOOL)p_shouldShowResizeMenuItemForSelectedItems:(id)a3;
- (CGRect)targetRectForEditMenu;
- (CGSize)p_sizeForExportingInfo:(id)a3;
- (NSSet)freehandDrawingInfos;
- (id)createFreehandDrawingsToCopyForSubselection;
- (id)imageURLsOfDrawings;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)p_firstDrawingInfo;
- (id)p_infosToMerge;
- (id)p_infosToSeparate;
- (id)p_pngDataForInfo:(id)a3;
- (id)p_shapeItemsSelectedInFreehandDrawings;
- (id)p_suffixForExportedFileWithIdentifier:(unint64_t)a3 index:(unint64_t)a4 count:(unint64_t)a5;
- (id)p_titleForOptionalEditDrawingAction;
- (id)snapToShapeActionName;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int64_t)editorResponseForCanPasteContentsOfItemSource:(id)a3;
- (unint64_t)p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape;
- (unint64_t)p_randomExportIdentifier;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addContextualMenuItemsToArray:(id)a3;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)copy:(id)a3;
- (void)copyAsText:(id)a3;
- (void)copySubselectionToPasteboard:(id)a3;
- (void)cut:(id)a3;
- (void)didBecomeCurrentEditorForEditorController:(id)a3;
- (void)insertContentsOfFreehandDrawingsFromItemSource:(id)a3 atUnscaledPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)mergeDrawings:(id)a3;
- (void)p_beginFreehandDrawingMode:(id)a3;
- (void)p_fixUpCurrentSelectionPathIfNeeded:(id)a3;
- (void)p_insertFreehandDrawingsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 isCrossDocument:(BOOL)a5 completionHandler:(id)a6;
- (void)p_separateInfos:(id)a3 preserveInitialSelection:(BOOL)a4 actionString:(id)a5;
- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 forceMatchStyle:(BOOL)a5 bakeFormulas:(BOOL)a6 completionHandler:(id)a7;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
- (void)separate:(id)a3;
- (void)snapToShape:(id)a3;
- (void)straighten:(id)a3;
- (void)transform:(id)a3;
- (void)translateHandwrittenText:(id)a3;
@end

@implementation CRLFreehandDrawingEditor

- (BOOL)isEditingFreehandDrawing
{
  return 1;
}

- (BOOL)p_currentlyEditingInGroup
{
  uint64_t v3 = [(CRLBoardItemEditor *)self editorController];
  v4 = [(id)v3 selectionForEditor:self];

  objc_opt_class();
  LOBYTE(v3) = objc_opt_isKindOfClass();

  return v3 & 1;
}

- (NSSet)freehandDrawingInfos
{
  uint64_t v3 = objc_opt_class();

  return (NSSet *)[(CRLBoardItemEditor *)self boardItemsOfClass:v3];
}

- (id)p_infosToSeparate
{
  uint64_t v3 = [(CRLFreehandDrawingEditor *)self p_shapeItemsSelectedInFreehandDrawings];
  v4 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
  if ([v4 count] != (id)1) {
    goto LABEL_4;
  }
  id v5 = [v3 count];
  v6 = [v4 anyObject];
  v7 = [v6 childInfos];
  id v8 = [v7 count];

  if (v5 == v8)
  {
    id v9 = +[NSSet set];
  }
  else
  {
LABEL_4:
    id v9 = v3;
  }
  v10 = v9;

  return v10;
}

- (id)p_infosToMerge
{
  uint64_t v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) childInfos];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)p_shapeItemsSelectedInFreehandDrawings
{
  uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v4 = +[NSMutableSet set];
  id v5 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = v3;
  id v6 = [v3 infosForCurrentSelectionPath];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        long long v13 = sub_1002469D0(v12, v11);
        long long v14 = v13;
        if (v13)
        {
          v15 = [v13 containingGroup];
          unsigned int v16 = [v5 containsObject:v15];

          if (v16) {
            [v4 addObject:v14];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v4;
}

- (BOOL)p_areAllSelectedInfosFreehandDrawings
{
  v2 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 infosForCurrentSelectionPath];
  v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v8 = 0;
            goto LABEL_12;
          }
        }
      }
      id v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (id)p_pngDataForInfo:(id)a3
{
  id v4 = a3;
  id v5 = [CRLCanvasImager alloc];
  uint64_t v6 = [(CRLBoardItemEditor *)self editingCoordinator];
  id v7 = [v6 mainBoard];
  BOOL v8 = [(CRLCanvasImager *)v5 initWithBoard:v7];

  id v16 = v4;
  uint64_t v9 = +[NSArray arrayWithObjects:&v16 count:1];
  [(CRLCanvasImager *)v8 setInfos:v9];

  [(CRLFreehandDrawingEditor *)self p_sizeForExportingInfo:v4];
  double v11 = v10;
  double v13 = v12;

  -[CRLCanvasImager setScaledImageSize:](v8, "setScaledImageSize:", v11, v13);
  long long v14 = [(CRLCanvasImager *)v8 pngData];

  return v14;
}

- (CGSize)p_sizeForExportingInfo:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = (double *)&v28;
  uint64_t v30 = 0x4010000000;
  v31 = "";
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v6 = [v5 layoutForInfoNearestVisibleRect:v4];

  if (v6)
  {
    [v6 frameForCulling];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = v29;
    *((void *)v29 + 4) = v8;
    *((void *)v15 + 5) = v10;
    v15[6] = v11;
    v15[7] = v13;
  }
  else
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002DA368;
    v27[3] = &unk_1014D60A8;
    v27[4] = &v28;
    [v4 withTemporaryLayoutPerform:v27];
    double v12 = v29[6];
    double v14 = v29[7];
  }
  double v16 = sub_1000646A4(v12, v14, 2.0);
  double v18 = v17;
  double v19 = sub_10006729C(1, v16, v17, 1000.0, 1000.0);
  BOOL v20 = v19 > v16;
  if (v21 > v18) {
    BOOL v20 = 1;
  }
  if (!v20) {
    double v19 = v16;
  }
  double v22 = sub_1000674B8(v19);
  double v24 = v23;

  _Block_object_dispose(&v28, 8);
  double v25 = v22;
  double v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)transform:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v3 = [v4 freehandDrawingToolkit];
  [v3 beginDrawingTransformModeIfNeeded];
}

- (void)separate:(id)a3
{
  id v6 = [(CRLFreehandDrawingEditor *)self p_infosToSeparate];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Separate" value:0 table:@"UndoStrings"];
  [(CRLFreehandDrawingEditor *)self p_separateInfos:v6 preserveInitialSelection:0 actionString:v5];
}

- (void)mergeDrawings:(id)a3
{
  id v6 = [(CRLFreehandDrawingEditor *)self p_infosToMerge];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Merge" value:0 table:@"UndoStrings"];
  [(CRLFreehandDrawingEditor *)self p_separateInfos:v6 preserveInitialSelection:1 actionString:v5];
}

- (void)straighten:(id)a3
{
  id v4 = a3;
  id v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v5 = [v10 layerHost];
  id v6 = [v5 asiOSCVC];

  uint64_t v7 = [v6 delegate];
  uint64_t v8 = [v7 pencilKitCanvasViewControllerForCanvasViewController:v6];

  uint64_t v9 = [v8 smartSelectionManager];
  [v9 straighten:v4];
}

- (void)copyAsText:(id)a3
{
  id v4 = a3;
  id v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v5 = [v10 layerHost];
  id v6 = [v5 asiOSCVC];

  uint64_t v7 = [v6 delegate];
  uint64_t v8 = [v7 pencilKitCanvasViewControllerForCanvasViewController:v6];

  uint64_t v9 = [v8 smartSelectionManager];
  [v9 copyAsText:v4];
}

- (void)translateHandwrittenText:(id)a3
{
  id v4 = a3;
  id v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v5 = [v10 layerHost];
  id v6 = [v5 asiOSCVC];

  uint64_t v7 = [v6 delegate];
  uint64_t v8 = [v7 pencilKitCanvasViewControllerForCanvasViewController:v6];

  uint64_t v9 = [v8 smartSelectionManager];
  [v9 translate:v4];
}

- (id)p_firstDrawingInfo
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 anyObject];
  id v6 = sub_1002469D0(v3, v5);

  return v6;
}

- (BOOL)p_hasTransformableDrawingsSelected
{
  v2 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 infosForCurrentSelectionPath];
  id v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 selectionPath];
  [(CRLFreehandDrawingEditor *)self p_fixUpCurrentSelectionPathIfNeeded:v5];

  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingEditor;
  [(CRLBoardItemEditor *)&v6 didBecomeCurrentEditorForEditorController:v4];
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  long long v10 = [(CRLBoardItemEditor *)self editorController];
  long long v11 = [v10 selectionPath];
  [(CRLFreehandDrawingEditor *)self p_fixUpCurrentSelectionPathIfNeeded:v11];

  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingEditor;
  [(CRLGroupEditor *)&v12 selectionDidChangeFromSelection:v9 toSelection:v8 withFlags:a5];
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CRLFreehandDrawingEditor *)self p_fixUpCurrentSelectionPathIfNeeded:v8];
  v13.receiver = self;
  v13.super_class = (Class)CRLFreehandDrawingEditor;
  long long v11 = [(CRLGroupEditor *)&v13 nextEditorForSelection:v10 withNewEditorStack:v9 selectionPath:v8];

  return v11;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(CRLFreehandDrawingEditor *)self p_currentlyEditingInGroup];
  id v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned int v9 = [(CRLFreehandDrawingEditor *)self p_currentlyInFreehandDrawingMode];
  if ("transform:" == a3)
  {
    unsigned int v16 = [(CRLFreehandDrawingEditor *)self p_hasTransformableDrawingsSelected];
    double v17 = [v8 freehandDrawingToolkit];
    unsigned int v18 = [v17 wantsToSuppressKnobsOnTransformReps];

    BOOL v19 = (v16 & v18) == 0;
LABEL_14:
    if (v19) {
      int64_t v15 = -1;
    }
    else {
      int64_t v15 = 1;
    }
    goto LABEL_79;
  }
  if ("separate:" == a3 || "mergeDrawings:" == a3)
  {
    long long v11 = [(CRLFreehandDrawingEditor *)self p_infosToSeparate];
    objc_super v12 = [(CRLFreehandDrawingEditor *)self p_infosToMerge];
    id v13 = [v11 count];
    id v14 = [v12 count];
    if ("separate:" == a3)
    {
      if (v13 == v14)
      {
        int64_t v15 = -1;
      }
      else
      {
        if ([v11 count]) {
          char v25 = v7;
        }
        else {
          char v25 = 0;
        }
        if (v25) {
          int64_t v15 = 1;
        }
        else {
          int64_t v15 = -1;
        }
      }
    }
    else if (v7)
    {
      int64_t v15 = -1;
      if (v13 == v14 && [v12 count]) {
        int64_t v15 = 1;
      }
    }
    else
    {
      double v23 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
      if ((unint64_t)[v23 count] > 1) {
        int64_t v15 = 1;
      }
      else {
        int64_t v15 = -1;
      }
    }
  }
  else
  {
    unsigned int v20 = v9;
    if ("p_beginFreehandDrawingMode:" == a3)
    {
      double v22 = [v8 freehandDrawingToolkit];
      if (([v22 canBeginFreehandDrawingMode] & (v20 ^ 1)) != 0) {
        int64_t v15 = 1;
      }
      else {
        int64_t v15 = -1;
      }
    }
    else
    {
      if ("snapToShape:" == a3)
      {
        double v24 = [(CRLFreehandDrawingEditor *)self p_infosToSnapToShape];
        if ([v24 count])
        {
          int64_t v15 = -1;
          if ([(CRLFreehandDrawingEditor *)self p_areAllSelectedInfosFreehandDrawings]&& [(CRLFreehandDrawingEditor *)self p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape])
          {
            int64_t v15 = 1;
          }
        }
        else
        {
          int64_t v15 = -1;
        }
        goto LABEL_78;
      }
      if ("straighten:" != a3 && "copyAsText:" != a3)
      {
        if ("translateHandwrittenText:" != a3)
        {
          int v21 = v7 | v9;
          if ("group:" == a3 && (v21 & 1) != 0) {
            goto LABEL_24;
          }
          int v31 = "copy:" == a3 ? v7 | v9 : 0;
          if (v31 != 1)
          {
            if ("cut:" != a3) {
              int v21 = 0;
            }
            if (v21 != 1)
            {
              if ("delete:" == a3) {
                unsigned int v35 = v9;
              }
              else {
                unsigned int v35 = 0;
              }
              if (v35 != 1) {
                goto LABEL_74;
              }
              v36 = [(CRLBoardItemEditor *)self editorController];
              v37 = [v36 currentEditors];
              v38 = [v37 lastObject];

              if (v38 != self)
              {
LABEL_74:
                v40.receiver = self;
                v40.super_class = (Class)CRLFreehandDrawingEditor;
                int64_t v15 = [(CRLGroupEditor *)&v40 canPerformEditorAction:a3 withSender:v6];
                goto LABEL_79;
              }
              goto LABEL_24;
            }
            long long v32 = [v8 canvasEditor];
            long long v33 = [v32 canvasEditorHelper];
            unsigned int v34 = [v33 shouldAllowPotentiallyKeyboardBasedActionForSender:v6];

            if (!v34)
            {
LABEL_24:
              int64_t v15 = -1;
              goto LABEL_79;
            }
          }
          BOOL v19 = ![(CRLFreehandDrawingEditor *)self canCopySubselection];
          goto LABEL_14;
        }
        double v26 = [v8 layerHost];
        double v24 = [v26 asiOSCVC];

        v27 = [v24 delegate];
        uint64_t v28 = [v27 pencilKitCanvasViewControllerForCanvasViewController:v24];

        v29 = [v28 smartSelectionManager];
        if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1)&& [v29 canTranslate])
        {
          uint64_t v30 = [(CRLFreehandDrawingEditor *)self p_infosToSnapToShape];
          if ([v30 count]
            && [(CRLFreehandDrawingEditor *)self p_areAllSelectedInfosFreehandDrawings])
          {
            if ([(CRLFreehandDrawingEditor *)self p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape])
            {
              int64_t v15 = 1;
            }
            else
            {
              int64_t v15 = -1;
            }
          }
          else
          {
            int64_t v15 = 1;
          }
        }
        else
        {
          int64_t v15 = -1;
        }

LABEL_78:
        goto LABEL_79;
      }
      if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1]) {
        int64_t v15 = 1;
      }
      else {
        int64_t v15 = -1;
      }
    }
  }
LABEL_79:

  return v15;
}

- (BOOL)p_currentlyInFreehandDrawingMode
{
  v2 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v3 = [v2 freehandDrawingToolkit];
  unsigned __int8 v4 = [v3 isInDrawingMode];

  return v4;
}

- (BOOL)p_shouldPreventPasteForItemSource:(id)a3
{
  id v4 = a3;
  if ([(CRLFreehandDrawingEditor *)self p_currentlyInFreehandDrawingMode]) {
    unsigned int v5 = [v4 hasOnlyNativeFreehandDrawingBoardItems] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (int64_t)editorResponseForCanPasteContentsOfItemSource:(id)a3
{
  id v4 = a3;
  if ([(CRLFreehandDrawingEditor *)self p_shouldPreventPasteForItemSource:v4])
  {
    int64_t v5 = -1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingEditor;
    int64_t v5 = [(CRLGroupEditor *)&v7 editorResponseForCanPasteContentsOfItemSource:v4];
  }

  return v5;
}

- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 forceMatchStyle:(BOOL)a5 bakeFormulas:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  int64_t v15 = [v14 canvasEditor];
  unsigned int v16 = [v15 pasteboardController];

  double v17 = [v16 ingestibleItemSourceForPasteboard:v12];
  double v24 = sub_100246AC8(v17, 1, v18, v19, v20, v21, v22, v23, (uint64_t)&OBJC_PROTOCOL___CRLIngestibleItemSource);

  if ([(CRLFreehandDrawingEditor *)self p_shouldPreventPasteForItemSource:v24])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAF48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A128();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAF68);
    }
    char v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v25);
    }
    double v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:]");
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:391 isFatal:0 description:"Asked to paste when we said we did not want to!"];
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CRLFreehandDrawingEditor;
    [(CRLGroupEditor *)&v28 pasteWithPasteboard:v12 atIndex:a4 forceMatchStyle:v9 bakeFormulas:v8 completionHandler:v13];
  }
}

- (BOOL)canPasteIntoCurrentlySelectedGroups
{
  return 1;
}

- (BOOL)canCopySubselection
{
  if ([(CRLFreehandDrawingEditor *)self p_currentlyEditingInGroup])
  {
    uint64_t v3 = [(CRLBoardItemEditor *)self editorController];
    id v4 = [v3 selectionPath];
    int64_t v5 = [v4 orderedSelections];
    id v6 = [v5 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v8 = isKindOfClass ^ 1;
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (void)copy:(id)a3
{
  id v6 = +[CRLPasteboard generalPasteboard];
  [(CRLFreehandDrawingEditor *)self copySubselectionToPasteboard:v6];
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  int64_t v5 = [v4 canvasEditor];
  [v5 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
}

- (id)createFreehandDrawingsToCopyForSubselection
{
  if (![(CRLFreehandDrawingEditor *)self canCopySubselection])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAF88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A300();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAFA8);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A258(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]");
    int64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:424 isFatal:0 description:"Should not ask for subselection freehand drawings if we cannot copy subselection!"];
  }
  id v57 = +[NSMutableArray array];
  v61 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v59 = [v61 canvasEditor];
  v55 = [v61 infosForCurrentSelectionPath];
  id v6 = [v61 topLevelZOrderedSiblingsOfInfos:v55];
  [v6 crl_arrayWithObjectsInSet:v55];

  v62 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v77;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v77 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        id v13 = sub_1002469D0(v12, v11);
        id v14 = v13;
        if (v13)
        {
          int64_t v15 = [v13 containingGroup];
          unsigned int v16 = [v15 isFreehandDrawing];

          if (v16) {
            [v62 addObject:v14];
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v8);
  }

  if ([v62 count])
  {
    double v17 = [v61 editingCoordinator];
    v66 = [v17 boardItemFactory];

    uint64_t v18 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
    uint64_t v19 = [v61 topLevelZOrderedSiblingsOfInfos:v18];
    uint64_t v20 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
    uint64_t v21 = [v19 crl_arrayWithObjectsInSet:v20];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v56 = v21;
    id v60 = [v56 countByEnumeratingWithState:&v72 objects:v91 count:16];
    if (v60)
    {
      uint64_t v22 = 0;
      uint64_t v58 = *(void *)v73;
      do
      {
        v63 = 0;
        do
        {
          if (*(void *)v73 != v58) {
            objc_enumerationMutation(v56);
          }
          uint64_t v23 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v63);
          *(void *)v80 = 0;
          *(void *)v81 = v80;
          *(void *)&v81[8] = 0x3032000000;
          *(void *)&v81[16] = sub_1002DBFDC;
          *(void *)&v81[24] = sub_1002DBFEC;
          *(void *)&v81[32] = 0;
          double v24 = [v59 selectionPathWithInfo:v23];
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_1002DBFF4;
          v71[3] = &unk_1014E79D0;
          v71[4] = v23;
          v71[5] = v80;
          [v61 forLayoutNearestVisibleRectForInfosForSelectionPath:v24 performBlock:v71];

          v65 = [v66 makeFreehandDrawingItemWithGeometry:*(void *)(*(void *)v81 + 40)];
          char v25 = +[NSMutableArray array];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v26 = v62;
          id v27 = [v26 countByEnumeratingWithState:&v67 objects:v90 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v68;
            do
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v68 != v28) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v30 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
                int v31 = [v30 parentInfo];
                BOOL v32 = v31 == v23;

                if (v32)
                {
                  long long v33 = (objc_class *)objc_opt_class();
                  unsigned int v34 = [v66 makeDuplicateOfBoardItem:v30];
                  unsigned int v35 = sub_10024715C(v33, v34);

                  [v25 addObject:v35];
                  ++v22;
                }
              }
              id v27 = [v26 countByEnumeratingWithState:&v67 objects:v90 count:16];
            }
            while (v27);
          }

          v36 = [v61 board];
          [v65 beforeInsertionAddNewItems:v25 board:v36 error:0];

          v37 = [v65 childInfos];
          BOOL v38 = [v37 count] == 0;

          if (v38)
          {
            unsigned int v39 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014EB008);
            }
            objc_super v40 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v83 = v39;
              __int16 v84 = 2082;
              v85 = "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]";
              __int16 v86 = 2082;
              v87 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m";
              __int16 v88 = 1024;
              int v89 = 486;
              _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Every freehand info should have at least one child!", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014EB028);
            }
            v41 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
            {
              v46 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v83 = v39;
              __int16 v84 = 2114;
              v85 = v46;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]");
            v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
            +[CRLAssertionHandler handleFailureInFunction:v42 file:v43 lineNumber:486 isFatal:0 description:"Every freehand info should have at least one child!"];
          }
          v44 = [v65 childInfos];
          BOOL v45 = [v44 count] == 0;

          if (!v45) {
            [v57 addObject:v65];
          }

          _Block_object_dispose(v80, 8);
          v63 = (char *)v63 + 1;
        }
        while (v63 != v60);
        id v60 = [v56 countByEnumeratingWithState:&v72 objects:v91 count:16];
      }
      while (v60);
    }
    else
    {
      uint64_t v22 = 0;
    }

    if (v22 != [v62 count])
    {
      unsigned int v47 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB048);
      }
      v48 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v53 = v48;
        id v54 = [v62 count];
        *(_DWORD *)v80 = 67110402;
        *(_DWORD *)&v80[4] = v47;
        *(_WORD *)v81 = 2082;
        *(void *)&v81[2] = "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]";
        *(_WORD *)&v81[10] = 2082;
        *(void *)&v81[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m";
        *(_WORD *)&v81[20] = 1024;
        *(_DWORD *)&v81[22] = 492;
        *(_WORD *)&v81[26] = 2048;
        *(void *)&v81[28] = v54;
        *(_WORD *)&v81[36] = 2048;
        *(void *)&v81[38] = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected to handle %zi shapes but instead did %zi", v80, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB068);
      }
      v49 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109A1B0(v49);
      }
      v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]");
      v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 492, 0, "Expected to handle %zi shapes but instead did %zi", [v62 count], v22);
    }
  }

  return v57;
}

- (void)copySubselectionToPasteboard:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 canvasEditor];
  id v8 = [v6 pasteboardController];

  objc_super v7 = [(CRLFreehandDrawingEditor *)self createFreehandDrawingsToCopyForSubselection];
  [v8 copyUninsertedFreehandDrawingItems:v7 toPasteboard:v4];
}

- (void)cut:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];

  [v6 openGroup];
  objc_super v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Cut" value:0 table:@"UndoStrings"];
  [v6 setCurrentGroupActionString:v8];

  [(CRLFreehandDrawingEditor *)self copy:v4];
  uint64_t v9 = [(CRLBoardItemEditor *)self editorController];
  id v10 = [v9 editorForEditAction:"delete:" withSender:v4];

  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB088);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A410();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB0A8);
    }
    long long v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor cut:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 513, 0, "invalid nil value for '%{public}s'", "deleteEditor");
  }
  [v10 performSelector:"delete:" withObject:v4];
  [v6 closeGroup];
}

- (void)insertContentsOfFreehandDrawingsFromItemSource:(id)a3 atUnscaledPoint:(CGPoint)a4 completionHandler:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  id v10 = a5;
  if (([v9 hasOnlyNativeFreehandDrawingBoardItems] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB0C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A4A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB0E8);
    }
    long long v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor insertContentsOfFreehandDrawingsFromItemSource:atUnscaledPoint:completionHandler:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:520 isFatal:0 description:"Should only call this if we have freehand drawings to insert!"];
  }
  if ([v9 hasOnlyNativeFreehandDrawingBoardItems])
  {
    id v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    int64_t v15 = [v14 editingCoordinator];
    [v15 suspendCollaborationWithReason:@"CRLFreehandEditorInsertingAsyncDrawables"];

    unsigned int v16 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    double v17 = [v16 editingCoordinator];
    uint64_t v18 = [v17 boardItemFactory];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002DC9EC;
    v20[3] = &unk_1014EB158;
    v20[4] = self;
    CGFloat v22 = x;
    CGFloat v23 = y;
    id v21 = v10;
    id v19 = [v9 loadProvidersForNativeBoardItemsWithBoardItemFactory:v18 loadHandler:v20];
  }
}

- (void)p_insertFreehandDrawingsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 isCrossDocument:(BOOL)a5 completionHandler:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  v62 = (void (**)(id, void *))a6;
  id v70 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  v64 = self;
  long long v11 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v12 = [v11 editingCoordinator];
  long long v72 = [v12 boardItemFactory];

  uint64_t v90 = 0;
  v91 = (CGFloat *)&v90;
  uint64_t v92 = 0x4010000000;
  v93 = "";
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v95 = size;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v87;
    do
    {
      unsigned int v16 = 0;
      do
      {
        if (*(void *)v87 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v16);
        uint64_t v18 = objc_opt_class();
        id v19 = [v17 newBoardItemWithFactory:v72 bakedSize:0];
        uint64_t v20 = sub_1002469D0(v18, v19);

        if (v20)
        {
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_1002DD66C;
          v85[3] = &unk_1014D60A8;
          v85[4] = &v90;
          [v20 withTemporaryLayoutPerform:v85];
          [v70 addObject:v20];
        }
        else
        {
          unsigned int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EB178);
          }
          CGFloat v22 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.a) = 67110146;
            HIDWORD(buf.a) = v21;
            LOWORD(buf.b) = 2082;
            *(void *)((char *)&buf.b + 2) = "-[CRLFreehandDrawingEditor p_insertFreehandDrawingsFromProviders:atUnscale"
                                              "dPoint:isCrossDocument:completionHandler:]";
            WORD1(buf.c) = 2082;
            *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreeha"
                                              "ndDrawingEditor.m";
            WORD2(buf.d) = 1024;
            *(_DWORD *)((char *)&buf.d + 6) = 553;
            WORD1(buf.tx) = 2082;
            *(void *)((char *)&buf.tx + 4) = "drawable";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EB198);
          }
          CGFloat v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            id v26 = +[CRLAssertionHandler packedBacktraceString];
            LODWORD(buf.a) = 67109378;
            HIDWORD(buf.a) = v21;
            LOWORD(buf.b) = 2114;
            *(void *)((char *)&buf.b + 2) = v26;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
          }
          double v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_insertFreehandDrawingsFromProviders:atUnscaledPoint:isCrossDocument:completionHandler:]");
          char v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 553, 0, "invalid nil value for '%{public}s'", "drawable");
        }
        unsigned int v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v14);
  }

  v65 = [(CRLFreehandDrawingEditor *)v64 p_firstDrawingInfo];
  id v27 = [(CRLBoardItemEditor *)v64 interactiveCanvasController];
  v63 = [v27 layoutForInfo:v65];

  double v28 = sub_100065738(v91[4], v91[5], v91[6], v91[7]);
  double v29 = sub_100064680(x, y, v28);
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeTranslation(&buf, v29, v30);
  int v31 = [v63 parent];
  BOOL v32 = v31;
  if (v31) {
    [v31 transformInRoot];
  }
  else {
    memset(&v82, 0, sizeof(v82));
  }
  CGAffineTransformInvert(&t2, &v82);
  CGAffineTransform t1 = buf;
  CGAffineTransformConcat(&v84, &t1, &t2);
  CGAffineTransform buf = v84;

  long long v33 = +[NSMutableArray array];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v66 = v70;
  id v68 = [v66 countByEnumeratingWithState:&v77 objects:v97 count:16];
  if (v68)
  {
    uint64_t v67 = *(void *)v78;
    do
    {
      for (i = 0; i != v68; i = (char *)i + 1)
      {
        if (*(void *)v78 != v67) {
          objc_enumerationMutation(v66);
        }
        unsigned int v34 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        unsigned int v35 = [v34 childInfos];
        id v36 = [v35 countByEnumeratingWithState:&v73 objects:v96 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v74;
          do
          {
            for (j = 0; j != v36; j = (char *)j + 1)
            {
              if (*(void *)v74 != v37) {
                objc_enumerationMutation(v35);
              }
              unsigned int v39 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
              uint64_t v40 = objc_opt_class();
              v41 = sub_1002469D0(v40, v39);
              if (v41)
              {
                v42 = [v34 ungroupedGeometryForChildItem:v41];
                [v41 setGeometry:v42];

                v43 = [v41 geometry];
                CGAffineTransform v84 = buf;
                v44 = [v43 geometryByAppendingTransform:&v84];
                [v41 setGeometry:v44];

                [v41 setParentInfo:0];
                [v33 addObject:v41];
              }
            }
            id v36 = [v35 countByEnumeratingWithState:&v73 objects:v96 count:16];
          }
          while (v36);
        }
      }
      id v68 = [v66 countByEnumeratingWithState:&v77 objects:v97 count:16];
    }
    while (v68);
  }

  BOOL v45 = [(CRLBoardItemEditor *)v64 interactiveCanvasController];
  v46 = [v45 canvasEditor];
  unsigned int v47 = [v46 canvasEditorHelper];
  [v47 prepareGeometryForInsertingNativelySourcedShapes:v33 intoFreehandDrawing:v65];

  v48 = [_TtC8Freeform26CRLCommandInsertBoardItems alloc];
  v49 = [v65 childInfos];
  v50 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:](v48, "initWithParentContainer:boardItems:index:", v65, v33, [v49 count]);

  v51 = [(CRLBoardItemEditor *)v64 interactiveCanvasController];
  v52 = [v51 selectionModelTranslator];
  v53 = [v52 selectionPathForNothingSelectedInsideGroup:v65];

  id v54 = [(CRLBoardItemEditor *)v64 interactiveCanvasController];
  v55 = [v54 canvasEditor];
  id v56 = [v55 canvasEditorHelper];
  id v57 = +[NSSet setWithArray:v33];
  uint64_t v58 = [v56 selectionPathByReplacingInfosInSelectionPath:v53 withInfos:v57];

  v59 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v58 reverseSelectionPath:v53];
  id v60 = [(CRLBoardItemEditor *)v64 interactiveCanvasController];
  v61 = [v60 commandController];
  [v61 enqueueCommand:v50 withSelectionBehavior:v59];

  if (v62) {
    v62[2](v62, v33);
  }

  _Block_object_dispose(&v90, 8);
}

- (unint64_t)p_randomExportIdentifier
{
  return vcvtmd_u64_f64(sub_100407E9C(100000.0, 999999.0));
}

- (id)p_suffixForExportedFileWithIdentifier:(unint64_t)a3 index:(unint64_t)a4 count:(unint64_t)a5
{
  if (a5 < 2) {
    +[NSString stringWithFormat:@"%zd", a3, v7];
  }
  else {
  int64_t v5 = +[NSString stringWithFormat:@"%zd-%zd", a3, a4];
  }

  return v5;
}

- (id)imageURLsOfDrawings
{
  CGFloat v30 = +[NSMutableArray array];
  id v42 = 0;
  uint64_t v3 = [[CRLTemporaryDirectory alloc] initWithError:&v42];
  id v4 = v42;
  if (v4)
  {
    id v5 = v4;
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB1B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A52C((uint64_t)v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB1D8);
    }
    uint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor imageURLsOfDrawings]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8, v9, 619, 0, "Failed to create a temporary directory for sharing drawings as images: %@", v5 file lineNumber isFatal description];
  }
  else
  {
    double v29 = v3;
    id v8 = [(CRLTemporaryDirectory *)v3 path];
    unint64_t v34 = [(CRLFreehandDrawingEditor *)self p_randomExportIdentifier];
    id v10 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
    id v33 = [v10 count];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
    id v35 = [obj countByEnumeratingWithState:&v38 objects:v53 count:16];
    if (v35)
    {
      uint64_t v36 = 0;
      id v5 = 0;
      uint64_t v32 = *(void *)v39;
      do
      {
        long long v11 = 0;
        do
        {
          uint64_t v12 = v5;
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(obj);
          }
          id v13 = [(CRLFreehandDrawingEditor *)self p_pngDataForInfo:*(void *)(*((void *)&v38 + 1) + 8 * (void)v11)];
          id v14 = [(CRLFreehandDrawingEditor *)self p_suffixForExportedFileWithIdentifier:v34 index:(char *)v11 + v36 count:v33];
          uint64_t v15 = +[NSString stringWithFormat:@"drawing%@.png", v14];
          unsigned int v16 = v8;
          double v17 = [v8 stringByAppendingPathComponent:v15];
          uint64_t v18 = +[NSURL fileURLWithPath:v17];

          id v37 = v12;
          unsigned int v19 = [v13 writeToURL:v18 options:1 error:&v37];
          id v5 = v37;

          if (v19)
          {
            [v30 addObject:v18];
          }
          else if (v5)
          {
            unsigned int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014EB1F8);
            }
            unsigned int v21 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CGAffineTransform buf = 67110146;
              unsigned int v44 = v20;
              __int16 v45 = 2082;
              v46 = "-[CRLFreehandDrawingEditor imageURLsOfDrawings]";
              __int16 v47 = 2082;
              v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m";
              __int16 v49 = 1024;
              int v50 = 635;
              __int16 v51 = 2112;
              id v52 = v5;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to write drawing image data to temporary directory while sharing: %@", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014EB218);
            }
            CGFloat v22 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              char v25 = v22;
              id v26 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)CGAffineTransform buf = 67109378;
              unsigned int v44 = v20;
              __int16 v45 = 2114;
              v46 = v26;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            CGFloat v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor imageURLsOfDrawings]");
            double v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
            +[CRLAssertionHandler handleFailureInFunction:v23, v24, 635, 0, "Failed to write drawing image data to temporary directory while sharing: %@", v5 file lineNumber isFatal description];
          }
          long long v11 = (char *)v11 + 1;
          id v8 = v16;
        }
        while (v35 != v11);
        id v35 = [obj countByEnumeratingWithState:&v38 objects:v53 count:16];
        v36 += (uint64_t)v11;
      }
      while (v35);
    }
    else
    {
      id v5 = 0;
    }

    uint64_t v3 = v29;
    [(CRLTemporaryDirectory *)v29 leakTemporaryDirectory];
  }

  id v27 = [v30 copy];

  return v27;
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v82.receiver = self;
  v82.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](&v82, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  long long v69 = v7;
  if ([(CRLFreehandDrawingEditor *)self p_currentlyInFreehandDrawingMode])
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v8 = [v7 copy];
    id v9 = [v8 countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v9)
    {
      id v10 = v9;
      id v66 = self;
      uint64_t v11 = *(void *)v79;
      while (1)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v79 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = sub_1002469D0(v14, v13);
          unsigned int v16 = v15;
          if (v15)
          {
            double v17 = [v15 identifier];
            if ([v17 isEqualToString:@"CRLAlignMenuIdentifier"])
            {
            }
            else
            {
              uint64_t v18 = [v16 identifier];
              unsigned int v19 = [v18 isEqualToString:@"CRLDistributeMenuIdentifier"];

              id v7 = v69;
              if (!v19) {
                goto LABEL_12;
              }
            }
            [v7 removeObjectIdenticalTo:v13];
          }
LABEL_12:
        }
        id v10 = [v8 countByEnumeratingWithState:&v78 objects:v85 count:16];
        if (!v10)
        {

          unsigned int v20 = (char *)[v7 count];
          goto LABEL_26;
        }
      }
    }

    unsigned int v20 = (char *)[v7 count];
  }
  else
  {
    id v66 = self;
    unsigned int v20 = (char *)[v7 count];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v21 = v7;
    id v22 = [v21 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v75;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v75 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
          uint64_t v27 = objc_opt_class();
          double v28 = sub_1002469D0(v27, v26);
          double v29 = v28;
          if (v28 && sel_isEqual((SEL)[v28 action], "delete:")) {
            unsigned int v20 = (char *)[v21 indexOfObjectIdenticalTo:v26] + 1;
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }
      while (v23);
    }

    id v7 = v69;
LABEL_26:
    self = v66;
  }
  if ([(CRLFreehandDrawingEditor *)self p_currentlyEditingInGroup])
  {
    CGFloat v30 = +[NSBundle mainBundle];
    int v31 = [v30 localizedStringForKey:@"Resize" value:0 table:0];
    uint64_t v32 = +[UIImage crl_internalSystemImageNamed:@"square.resize"];
    uint64_t v33 = +[UICommand commandWithTitle:v31 image:v32 action:"transform:" propertyList:0];

    id v68 = (void *)v33;
    [v7 insertObject:v33 atIndex:v20];
    unint64_t v34 = +[NSBundle mainBundle];
    id v35 = [v34 localizedStringForKey:@"Duplicate" value:0 table:0];
    uint64_t v36 = +[UIImage systemImageNamed:@"plus.rectangle.on.rectangle"];
    uint64_t v37 = +[UICommand commandWithTitle:v35 image:v36 action:"duplicate:" propertyList:0];

    uint64_t v67 = (void *)v37;
    [v7 insertObject:v37 atIndex:v20 + 1];
    long long v38 = +[NSBundle mainBundle];
    long long v39 = [v38 localizedStringForKey:@"Separate" value:0 table:0];
    long long v40 = +[UIImage systemImageNamed:@"square.split.1x2"];
    long long v41 = +[UICommand commandWithTitle:v39 image:v40 action:"separate:" propertyList:0];

    [v7 insertObject:v41 atIndex:v20 + 2];
    id v42 = [(CRLFreehandDrawingEditor *)self snapToShapeActionName];
    v43 = +[CRLFreehandDrawingEditor snapToShapeActionSymbolName];
    unsigned int v44 = +[UIImage systemImageNamed:v43];
    __int16 v45 = +[UICommand commandWithTitle:v42 image:v44 action:"snapToShape:" propertyList:0];

    id v7 = v69;
    [v69 insertObject:v45 atIndex:v20 + 3];
    if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
    {
      v46 = +[NSBundle mainBundle];
      __int16 v47 = [v46 localizedStringForKey:@"Straighten" value:0 table:0];
      v48 = +[UIImage systemImageNamed:@"wrench.adjustable"];
      v65 = +[UICommand commandWithTitle:v47 image:v48 action:"straighten:" propertyList:0];

      [v69 insertObject:v65 atIndex:v20 + 4];
      __int16 v49 = +[NSBundle mainBundle];
      int v50 = [v49 localizedStringForKey:@"Copy as Text" value:0 table:0];
      __int16 v51 = +[UIImage systemImageNamed:@"textformat"];
      id v52 = +[UICommand commandWithTitle:v50 image:v51 action:"copyAsText:" propertyList:0];

      [v69 insertObject:v52 atIndex:v20 + 5];
      v53 = +[NSBundle mainBundle];
      id v54 = [v53 localizedStringForKey:@"Translate" value:0 table:0];
      v55 = +[UIImage systemImageNamed:@"translate"];
      id v56 = +[UICommand commandWithTitle:v54 image:v55 action:"translateHandwrittenText:" propertyList:0];

      id v7 = v69;
      [v69 insertObject:v56 atIndex:v20 + 6];
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v57 = [v7 copy:v65];
  id v58 = [v57 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v71;
    while (2)
    {
      for (k = 0; k != v59; k = (char *)k + 1)
      {
        if (*(void *)v71 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = *(void **)(*((void *)&v70 + 1) + 8 * (void)k);
        uint64_t v63 = objc_opt_class();
        v64 = sub_1002469D0(v63, v62);
        if ([v64 action] == "group:")
        {
          [v7 removeObjectIdenticalTo:v62];

          goto LABEL_41;
        }
      }
      id v59 = [v57 countByEnumeratingWithState:&v70 objects:v83 count:16];
      if (v59) {
        continue;
      }
      break;
    }
  }
LABEL_41:
}

- (id)snapToShapeActionName
{
  unint64_t v2 = [(CRLFreehandDrawingEditor *)self p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape];
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2 == 2) {
    CFStringRef v5 = @"Snap to Shapes";
  }
  else {
    CFStringRef v5 = @"Snap to Shape";
  }
  int v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (BOOL)crlaxShouldOfferSnapToShapeFromInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int v6 = sub_1002469D0(v5, v4);

  id v7 = [(CRLFreehandDrawingEditor *)self p_infosToSnapToShape];
  BOOL v8 = [v7 containsObject:v6]
    && -[CRLFreehandDrawingEditor canPerformEditorAction:withSender:](self, "canPerformEditorAction:withSender:", "snapToShape:", 0)&& [v6 canSnapToShape]&& -[CRLFreehandDrawingEditor p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape](self, "p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape") != 0;

  return v8;
}

+ (id)snapToShapeActionSymbolName
{
  return @"star";
}

- (void)addContextualMenuItemsToArray:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CRLFreehandDrawingEditor;
  [(CRLBoardItemEditor *)&v46 addContextualMenuItemsToArray:v4];
  if ([(CRLFreehandDrawingEditor *)self p_currentlyEditingInGroup])
  {
    uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    int v6 = [v5 freehandDrawingToolkit];
    unsigned __int8 v7 = [v6 isLassoAbleToSelectMixedType];

    BOOL v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Resize" value:0 table:0];

    id v10 = [objc_alloc((Class)UIMenuItem) initWithTitle:v9 action:"transform:"];
    if (v7)
    {
      uint64_t v11 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      uint64_t v12 = [v11 infosForCurrentSelectionPath];
      id v13 = [v12 allObjects];
      unsigned int v14 = [(CRLFreehandDrawingEditor *)self p_shouldShowResizeMenuItemForSelectedItems:v13];

      if (v14) {
        [v4 addObject:v10];
      }
    }
    else
    {
      [v4 addObject:v10];
    }
    uint64_t v15 = +[NSBundle mainBundle];
    unsigned int v16 = [v15 localizedStringForKey:@"Duplicate" value:0 table:0];

    id v17 = [objc_alloc((Class)UIMenuItem) initWithTitle:v16 action:"duplicate:"];
    [v4 addObject:v17];
    uint64_t v18 = +[NSBundle mainBundle];
    unsigned int v19 = [v18 localizedStringForKey:@"Separate" value:0 table:0];

    id v20 = [objc_alloc((Class)UIMenuItem) initWithTitle:v19 action:"separate:"];
    [v4 addObject:v20];
    unint64_t v21 = [(CRLFreehandDrawingEditor *)self p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape];
    id v22 = +[NSBundle mainBundle];
    id v23 = v22;
    if (v21 == 2) {
      CFStringRef v24 = @"Snap to Shapes";
    }
    else {
      CFStringRef v24 = @"Snap to Shape";
    }
    char v25 = [v22 localizedStringForKey:v24 value:0 table:0];

    id v26 = [objc_alloc((Class)UIMenuItem) initWithTitle:v25 action:"snapToShape:"];
    [v4 addObject:v26];
  }
  long long v41 = self;
  uint64_t v27 = +[NSBundle mainBundle];
  double v28 = [v27 localizedStringForKey:@"Merge" value:0 table:0];

  id v29 = [objc_alloc((Class)UIMenuItem) initWithTitle:v28 action:"mergeDrawings:"];
  [v4 addObject:v29];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v30 = [v4 copy];
  id v31 = [v30 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v43;
    unint64_t v34 = &selRef_firstTapLocation;
    while (2)
    {
      id v35 = 0;
      uint64_t v36 = v34;
      uint64_t v37 = v34[211];
      do
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v38 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v35);
        if ([v38 action] == v37)
        {
          [v4 removeObject:v38];
          goto LABEL_21;
        }
        id v35 = (char *)v35 + 1;
      }
      while (v32 != v35);
      id v32 = [v30 countByEnumeratingWithState:&v42 objects:v47 count:16];
      unint64_t v34 = v36;
      if (v32) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if (![(CRLFreehandDrawingEditor *)v41 p_currentlyInFreehandDrawingMode])
  {
    long long v39 = [(CRLFreehandDrawingEditor *)v41 p_titleForOptionalEditDrawingAction];
    if (v39)
    {
      id v40 = [objc_alloc((Class)UIMenuItem) initWithTitle:v39 action:"p_beginFreehandDrawingMode:"];
      [v4 insertObject:v40 atIndex:0];
    }
  }
}

- (id)p_titleForOptionalEditDrawingAction
{
  unint64_t v2 = [(CRLFreehandDrawingEditor *)self freehandDrawingInfos];
  id v3 = [v2 count];

  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = v4;
  if (v3 == (id)1) {
    CFStringRef v6 = @"Edit Drawing";
  }
  else {
    CFStringRef v6 = @"Edit Drawings";
  }
  unsigned __int8 v7 = [v4 localizedStringForKey:v6 value:0 table:0];

  return v7;
}

- (CGRect)targetRectForEditMenu
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  unsigned __int8 v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  BOOL v8 = [v7 layerHost];
  id v9 = [v8 asiOSCVC];

  if ([(CRLFreehandDrawingEditor *)self p_currentlyInFreehandDrawingMode])
  {
    id v10 = [v7 editorController];
    uint64_t v11 = [v10 mostSpecificCurrentEditorOfClass:0];

    if (v11 == self)
    {
      [v9 lastTapPoint];
      [v7 convertUnscaledToBoundsPoint:];
      sub_100064698(v12, v13, 0.0);
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v14, v15);
      CGFloat x = v16;
      CGFloat y = v17;
      CGFloat width = v18;
      CGFloat height = v19;
    }
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v12, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  if (![(CRLFreehandDrawingEditor *)self p_currentlyInFreehandDrawingMode])
  {
    BOOL v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Edit Drawing" value:0 table:0];
    id v10 = +[CRLImage crl_quickInspectorImageNamed:@"scribble"];
    uint64_t v11 = +[CRLQuickInspectorElement elementWithName:v9 image:v10 type:2 options:0x1000000 action:"p_beginFreehandDrawingMode:" parent:0 children:0];

    [v7 insertObject:v11 atIndex:[v7 count]];
  }
}

- (void)p_beginFreehandDrawingMode:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v3 = [v4 freehandDrawingToolkit];
  [v3 beginDrawingModeIfNeededForTouchType:1];
}

- (void)p_separateInfos:(id)a3 preserveInitialSelection:(BOOL)a4 actionString:(id)a5
{
  BOOL v125 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v10 = [v9 canvasEditor];
  uint64_t v11 = [v9 commandController];
  objc_super v12 = [(CRLBoardItemEditor *)self editingCoordinator];
  double v13 = [v12 mainBoard];

  v127 = self;
  CKRecordID v14 = [(CRLBoardItemEditor *)self editingCoordinator];
  Swift::String v15 = [v14 boardItemFactory];

  if ([v7 count])
  {
    v122 = v13;
    v126 = v10;
    [v11 openGroup];
    [v11 enableProgressiveEnqueuingInCurrentGroup];
    v123 = v11;
    id v121 = v8;
    [v11 setCurrentGroupActionString:v8];
    double v16 = [v9 topLevelZOrderedSiblingsOfInfos:v7];
    id v124 = v7;
    double v17 = [v16 crl_arrayWithObjectsInSet:v7];

    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_1002DFD20;
    v142[3] = &unk_1014EB240;
    v120 = v15;
    v142[4] = v15;
    double v18 = [v17 crl_arrayByTransformingWithBlock:v142];
    double v19 = +[NSMutableArray array];
    v130 = v17;
    v131 = v9;
    if ([v17 count])
    {
      unint64_t v20 = 0;
      v128 = v18;
      do
      {
        double v21 = [v17 objectAtIndexedSubscript:v20];
        double v22 = [v18 objectAtIndexedSubscript:v20];
        double v23 = (objc_class *)objc_opt_class();
        CFStringRef v24 = [v21 containingGroup];
        char v25 = sub_10024715C(v23, v24);

        id v26 = [v9 layoutForInfo:v25];
        if (([v19 containsObject:v25] & 1) == 0) {
          [v19 addObject:v25];
        }
        uint64_t v27 = [v21 geometry];
        double v28 = [v26 geometry];
        id v29 = [v26 computeInfoGeometryFromPureLayoutGeometry:v28];
        [v27 geometryWithParentGeometry:v29];
        v31 = id v30 = v19;

        [v22 setGeometry:v31];
        double v19 = v30;

        ++v20;
        double v17 = v130;
        id v9 = v131;
        double v18 = v128;
      }
      while (v20 < (unint64_t)[v130 count]);
    }
    if ([v19 count] == (id)1)
    {
      id v32 = [v19 firstObject];
      uint64_t v33 = objc_opt_class();
      unint64_t v34 = [v9 layoutForInfo:v32];
      id v35 = sub_1002469D0(v33, v34);

      uint64_t v36 = [CRLCanvasInfoGeometry alloc];
      uint64_t v37 = [v35 pureGeometry];
      long long v38 = v37;
      if (v37) {
        [v37 fullTransform];
      }
      else {
        memset(v141, 0, 48);
      }
      long long v39 = [(CRLCanvasInfoGeometry *)v36 initWithFullTransform:v141 widthValid:1 heightValid:1];
    }
    else
    {
      long long v39 = +[CRLGroupItem groupGeometryFromChildrenInfos:v18];
    }
    id v40 = [v9 editingCoordinator];
    long long v41 = [v40 boardItemFactory];
    v118 = v39;
    long long v42 = [v41 makeFreehandDrawingItemWithGeometry:v39];

    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v43 = v18;
    uint64_t v44 = (uint64_t)[v43 countByEnumeratingWithState:&v137 objects:v145 count:16];
    v119 = v19;
    if (v44)
    {
      uint64_t v45 = *(void *)v138;
      while (2)
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v138 != v45) {
            objc_enumerationMutation(v43);
          }
          if ([*(id *)(*((void *)&v137 + 1) + 8 * i) aspectRatioLocked])
          {
            uint64_t v44 = 1;
            goto LABEL_23;
          }
        }
        uint64_t v44 = (uint64_t)[v43 countByEnumeratingWithState:&v137 objects:v145 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    [v42 setAspectRatioLocked:v44];
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v47 = v43;
    id v48 = [v47 countByEnumeratingWithState:&v133 objects:v144 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v134;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v134 != v50) {
            objc_enumerationMutation(v47);
          }
          id v52 = *(void **)(*((void *)&v133 + 1) + 8 * (void)j);
          v53 = [v52 geometry];
          id v54 = [v42 geometry];
          v55 = [v53 geometryRelativeToGeometry:v54];

          [v52 setGeometry:v55];
        }
        id v49 = [v47 countByEnumeratingWithState:&v133 objects:v144 count:16];
      }
      while (v49);
    }

    id v132 = 0;
    [v42 beforeInsertionAddNewItems:v47 board:v122 error:&v132];
    p_vtable = CRLiOSImageHUDSlider.vtable;
    id v57 = v131;
    id v117 = v132;
    if (v117)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB260);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109A70C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB280);
      }
      id v58 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v58);
      }
      id v59 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:]");
      uint64_t v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v59, v60, 970, 0, "expected nil value for '%{public}s'", "insertionError");
    }
    uint64_t v61 = +[NSSet setWithObject:v42];
    v62 = (void *)v61;
    if (v125)
    {
      uint64_t v63 = [(CRLBoardItemEditor *)v127 editorController];
      v64 = [v63 selectionPath];

      v65 = [v131 canvasEditor];
      id v66 = [(CRLFreehandDrawingEditor *)v127 freehandDrawingInfos];
      uint64_t v67 = [v65 selectionPathWithInfos:v66];
      id v68 = [(CRLBoardItemEditor *)v127 editorController];
      [v68 setSelectionPath:v67];

      long long v69 = [CRLCanvasCommandSelectionBehavior alloc];
      long long v70 = [v131 canvasEditor];
      long long v71 = v62;
      long long v72 = [(CRLCanvasCommandSelectionBehavior *)v69 initWithCanvasEditor:v70 type:3 constructedInfos:v62];

      long long v73 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v64];
      [(CRLCommandSelectionBehavior *)v72 setPersistableReverseSelectionPath:v73];

      p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
    }
    else
    {
      long long v71 = (void *)v61;
      long long v72 = 0;
    }
    uint64_t v74 = [v126 selectionPathWithInfos:0];
    long long v75 = [v131 editorController];
    v129 = (void *)v74;
    [v75 setSelectionPath:v74];

    long long v76 = [(CRLFreehandDrawingEditor *)v127 freehandDrawingInfos];
    long long v77 = [v76 anyObject];

    long long v78 = [v77 parentInfo];
    long long v79 = (objc_class *)objc_opt_class();
    uint64_t v85 = sub_100246E2C(v78, v79, 1, v80, v81, v82, v83, v84, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

    long long v86 = [v126 canvasEditorHelper];
    v143 = v42;
    long long v87 = +[NSArray arrayWithObjects:&v143 count:1];
    v115 = (void *)v85;
    v116 = v77;
    uint64_t v88 = [v86 commandToInsertBoardItems:v87 intoContainer:v85 belowBoardItem:v77 withOffset:0];

    *(void *)&v114[4] = v88;
    if (v88)
    {
      long long v89 = &off_1014C1000;
      uint64_t v90 = v123;
      [v123 enqueueCommand:v88];
      id v91 = v124;
    }
    else
    {
      *(void *)v114 = [p_vtable + 152 _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB2A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109A678();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB2C0);
      }
      uint64_t v92 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v92);
      }
      v93 = p_vtable + 152;
      v94 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:]");
      long long v89 = &off_1014C1000;
      CGSize v95 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
      [v93 handleFailureInFunction:v94 file:v95 lineNumber:1011 isFatal:0 description:@"invalid nil value for '%{public}s'", "insertCommand"];

      uint64_t v90 = v123;
      id v91 = v124;
      id v57 = v131;
    }
    [v90 openGroup];
    v96 = [v126 selectionPathWithInfos:v91];
    v97 = [v57 editorController];
    [v97 setSelectionPath:v96];

    v98 = [v126 canvasEditorHelper];
    [v98 delete:v127];

    [v90 closeGroup];
    v99 = [v57 editorController];
    [v99 setSelectionPath:v129];

    if (!v125)
    {
      v100 = [CRLCanvasCommandSelectionBehavior alloc];
      v101 = [v57 canvasEditor];
      v102 = [(CRLCanvasCommandSelectionBehavior *)v100 initWithCanvasEditor:v101 type:3 constructedInfos:v71];

      long long v72 = v102;
    }
    id v10 = v126;
    v103 = [v126 selectionPathWithInfos:v71];
    v104 = [v57 editorController];
    [v104 setSelectionPath:v103];

    v105 = [v126 arrangeInspectorDelegate];
    [v105 moveToFrontForArrangeInspector];

    if (!v72)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB2E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109A5E4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB300);
      }
      v106 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v106);
      }
      v107 = -[__objc2_class stringWithUTF8String:](v89[107], "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:]");
      v108 = [(__objc2_class *)v89[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v107, v108, 1034, 0, "invalid nil value for '%{public}s'", "selectionBehavior");

      id v10 = v126;
    }
    uint64_t v11 = v123;
    [v123 closeGroupWithSelectionBehavior:v72];
    v109 = [(CRLBoardItemEditor *)v127 interactiveCanvasController];
    v110 = [v109 freehandDrawingToolkit];
    [v110 endDrawingModeIfNeeded];

    v111 = [v10 selectionPathWithInfos:v71];
    v112 = [(CRLBoardItemEditor *)v127 interactiveCanvasController];
    v113 = [v112 editorController];
    [v113 setSelectionPath:v111];

    id v7 = v124;
    id v8 = v121;
    double v13 = v122;
    id v9 = v131;
    Swift::String v15 = v120;
  }
}

- (unint64_t)p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape
{
  id v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v4 = [(CRLFreehandDrawingEditor *)self p_infosToSnapToShape];
  uint64_t v5 = [[CRLFreehandDrawingSnapToShapeHelper alloc] initWithInteractiveCanvasController:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  unint64_t v7 = (unint64_t)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7)
  {

    goto LABEL_19;
  }
  int v8 = 0;
  uint64_t v9 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v11, "canSnapToShape", (void)v15))
      {
        objc_super v12 = [(CRLFreehandDrawingSnapToShapeHelper *)v5 unscaledPKStrokesBySnappingShapeItem:v11];
        double v13 = v12;
        if (v12 && [v12 count])
        {
          if (v8 > 0)
          {

LABEL_17:
            unint64_t v7 = 2;
            goto LABEL_19;
          }
          ++v8;
        }
      }
    }
    unint64_t v7 = (unint64_t)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7) {
      continue;
    }
    break;
  }

  unint64_t v7 = v8 == 1;
  if (v8 >= 2) {
    goto LABEL_17;
  }
LABEL_19:

  return v7;
}

- (void)snapToShape:(id)a3
{
  id v4 = [(CRLFreehandDrawingEditor *)self p_infosToSnapToShape];
  uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];
  CFStringRef v24 = v5;
  unint64_t v7 = [[CRLFreehandDrawingSnapToShapeHelper alloc] initWithInteractiveCanvasController:v5];
  int v8 = +[NSMutableSet set];
  [v6 openGroup];
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"Snap to Shapes" value:0 table:@"UndoStrings"];
    [v6 setCurrentGroupActionString:v10];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v16 canSnapToShape])
        {
          long long v17 = [(CRLFreehandDrawingSnapToShapeHelper *)v7 unscaledPKStrokesBySnappingShapeItem:v16];
          id v25 = 0;
          long long v18 = [(CRLFreehandDrawingSnapToShapeHelper *)v7 commandForSnappingShapeItem:v16 toStrokesInUnscaledSpace:v17 outCreatedAndModifiedShapes:&v25];
          id v19 = v25;
          [v8 addObjectsFromArray:v19];
          [v6 enqueueCommand:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  unint64_t v20 = [CRLCanvasCommandSelectionBehavior alloc];
  double v21 = [v24 canvasEditor];
  double v22 = [(CRLCanvasCommandSelectionBehavior *)v20 initWithCanvasEditor:v21 type:3 constructedInfos:v8];

  [v6 closeGroupWithSelectionBehavior:v22];
  double v23 = [v24 canvasEditor];
  [v23 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
}

- (void)p_fixUpCurrentSelectionPathIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  if (([v5 isInDynamicOperation] & 1) == 0
    && ![(CRLFreehandDrawingEditor *)self p_currentlyInFreehandDrawingMode])
  {
    id v6 = [v4 mostSpecificSelectionOfClass:objc_opt_class()];
    if ([v6 containsKindOfClass:objc_opt_class()])
    {
      [v5 editorController];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1002E0440;
      v8[3] = &unk_1014CBE50;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = v5;
      id v11 = v6;
      id v7 = v9;
      [v7 performBlockAfterSettingSelection:v8];
    }
  }
}

- (BOOL)p_shouldShowResizeMenuItemForSelectedItems:(id)a3
{
  id v3 = [a3 crl_arrayByTransformingWithBlock:&stru_1014EB340];
  id v4 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class(), (void)v18))
        {
          uint64_t v11 = objc_opt_class();
          id v12 = sub_1002469D0(v11, v10);
          id v13 = [v12 allNestedChildrenItemsExcludingGroups];
          [v4 addObjectsFromArray:v13];
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v4 crl_arrayByTransformingWithBlock:&stru_1014EB380];
  if ([v14 count])
  {
    id v15 = [v14 count];
    BOOL v16 = v15 == [v4 count];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

@end