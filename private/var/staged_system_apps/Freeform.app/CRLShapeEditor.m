@interface CRLShapeEditor
+ (BOOL)anyInfoIsAutoresizing:(id)a3;
+ (BOOL)anyInfoIsConnectionLine:(id)a3;
+ (BOOL)anyInfoIsLine:(id)a3;
+ (BOOL)anyInfoIsOpenPath:(id)a3;
+ (BOOL)anyInfoIsStickyNote:(id)a3;
+ (BOOL)anyInfoIsTextBox:(id)a3;
+ (BOOL)anyInfoSupportsTextInspection:(id)a3;
+ (BOOL)anyInfoSupportsVerticalAlignment:(id)a3;
+ (BOOL)infosAreConnectionLines:(id)a3;
+ (BOOL)infosAreLines:(id)a3;
+ (BOOL)infosAreLinesAndConnectionLines:(id)a3;
+ (BOOL)infosAreMixedOpenAndClosedPaths:(id)a3;
+ (BOOL)infosAreMixedOpenPathsAndLines:(id)a3;
+ (BOOL)infosAreOpenPaths:(id)a3;
+ (BOOL)infosAreStickyNotes:(id)a3;
+ (BOOL)infosAreTextBoxes:(id)a3;
+ (BOOL)infosSupportEndpoints:(id)a3;
+ (BOOL)p_leftLineEndIsHeadForInfo:(id)a3;
+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingFill;
+ (id)leftLineEndForShape:(id)a3;
+ (id)rightLineEndForShape:(id)a3;
- (BOOL)allowsChangeShape;
- (BOOL)anyInfoIsLineOrConnectionLine;
- (BOOL)anyInfoSupportsTextInspection;
- (BOOL)anyInfoSupportsVerticalAlignment;
- (BOOL)canDivideCompoundShape;
- (BOOL)canIntersectPaths;
- (BOOL)canMakePathEditable;
- (BOOL)canMakePathSmoothOrSharp;
- (BOOL)canResetTextAndObjectHandles;
- (BOOL)fillInspectorDisclosed;
- (BOOL)infosAreConnectionLines;
- (BOOL)infosAreLines;
- (BOOL)infosAreMixedOpenAndClosedPaths;
- (BOOL)infosAreOpenPaths;
- (BOOL)infosAreTextBoxes;
- (BOOL)infosSupportEndpoints;
- (BOOL)p_allInfosAreStickyNotes;
- (BOOL)p_anyInfoWasAutoresizing;
- (BOOL)p_anyInfoWasLine;
- (BOOL)p_canSetFill;
- (BOOL)p_canSetFillWithAnyInfoIsTextBox:(BOOL)a3;
- (BOOL)p_canSetStrokeWithAnyInfoIsTextBox:(BOOL)a3;
- (BOOL)p_containsOpenPaths;
- (BOOL)p_shapeLacksEnoughStyleToBeSavedAsCustom:(id)a3;
- (BOOL)p_shapesAreMixed;
- (BOOL)p_shapesContainNonLine;
- (BOOL)p_shouldShowInspectorForPointPathSourceOfTypes:(id)a3;
- (BOOL)p_shouldShowInspectorForScalarPathSourceOfType:(unint64_t)a3;
- (BOOL)shouldShowArrowInspector;
- (BOOL)shouldShowCalloutInspector;
- (BOOL)shouldShowLineInspector;
- (BOOL)shouldShowPolygonInspector;
- (BOOL)shouldShowRoundedRectInspector;
- (BOOL)shouldShowStarInspector;
- (BOOL)suppressesFillInspector;
- (BOOL)suppressesPresetInspector;
- (BOOL)suppressesStyleInspector;
- (BOOL)suppressesTextInspector;
- (CGPoint)p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:(id)a3 withOldLayout:(id)a4 withNewInfo:(id)a5 forLineEnd:(unint64_t)a6;
- (CRLPathEditor)nextPathEditor;
- (NSArray)allShapeItems;
- (_TtC8Freeform12CRLShapeItem)anyShapeItem;
- (id)currentGroupActionStringForStrokeSetting;
- (id)leftLineEnd;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)rightLineEnd;
- (id)selectedObjectsSupportingEndpoints;
- (id)selectedObjectsSupportingFill;
- (id)strokeColorPickerTitle;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)changeShapeToUsePathSource:(id)a3;
- (void)dismissShapeLibraryPopover:(id)a3;
- (void)divideCompoundShape:(id)a3;
- (void)intersectPaths:(id)a3;
- (void)makePathEditable:(id)a3;
- (void)makePathSharp:(id)a3;
- (void)makePathSmooth:(id)a3;
- (void)p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:(BOOL)a3 withClineLayout:(id)a4 withShapeItem:(id)a5;
- (void)p_applyTransformFromInfo:(id)a3 toEditablePathSource:(id)a4;
- (void)p_changeShapeOfItem:(id)a3 toUsePathSource:(id)a4;
- (void)performBooleanOperationOnPaths:(unint64_t)a3;
- (void)resetTextAndObjectHandles:(id)a3;
- (void)setFillInspectorDisclosed:(BOOL)a3;
- (void)setLineEnd:(id)a3 isLeftLineEnd:(BOOL)a4;
- (void)setNextPathEditor:(id)a3;
- (void)setP_anyInfoWasAutoresizing:(BOOL)a3;
- (void)setP_anyInfoWasLine:(BOOL)a3;
- (void)setShapeFill:(id)a3;
- (void)showShapeLibraryPopover:(id)a3;
@end

@implementation CRLShapeEditor

- (void)setFillInspectorDisclosed:(BOOL)a3
{
  *(&self->super.mIsChangingStrokeWidth + 1) = a3;
  v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(CRLBoardItemEditor *)self layouts];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [v4 repForLayout:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        [v10 invalidateKnobs];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (_TtC8Freeform12CRLShapeItem)anyShapeItem
{
  v2 = [(CRLShapeEditor *)self allShapeItems];
  v3 = [v2 firstObject];

  return (_TtC8Freeform12CRLShapeItem *)v3;
}

- (NSArray)allShapeItems
{
  v3 = self;
  v4 = [(CRLBoardItemEditor *)self sortedBoardItemsOfClass:v3];

  return (NSArray *)v4;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [(CRLShapeEditor *)self nextPathEditor];

    if (v10)
    {
      long long v11 = [(CRLShapeEditor *)self nextPathEditor];
    }
    else
    {
      long long v12 = [CRLPathEditor alloc];
      long long v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      long long v11 = [(CRLBoardItemEditor *)v12 initWithInteractiveCanvasController:v13];

      long long v14 = [v7 mostSpecificSelectionOfClass:objc_opt_class()];
      v15 = v14;
      if (v14)
      {
        v16 = [v14 boardItems];
        [(CRLBoardItemEditor *)v11 setBoardItems:v16];
      }
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLShapeEditor;
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](&v19, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  if (+[CRLFeatureFlagGroup isChangeShapeEnabled])
  {
    id v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Change Shape" value:0 table:0];

    v10 = +[UIImage systemImageNamed:@"square.on.circle"];
    long long v11 = +[UICommand commandWithTitle:v9 image:v10 action:"showShapeLibraryPopover:" propertyList:0];

    if ([v7 count])
    {
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = objc_opt_class();
        long long v14 = [v7 objectAtIndexedSubscript:v12];
        v15 = sub_1002469D0(v13, v14);

        if (v15)
        {
          v16 = [v15 identifier];

          if (v16 == @"CRLStyleMenuIdentifier") {
            break;
          }
        }
        if (++v12 >= (unint64_t)[v7 count]) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      uint64_t v12 = -1;
    }
    v20 = v11;
    v17 = +[NSArray arrayWithObjects:&v20 count:1];
    v18 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLShapeMenuIdentifier" options:1 children:v17];

    if (v12 == -1) {
      [v7 addObject:v18];
    }
    else {
      [v7 insertObject:v18 atIndex:v12];
    }
  }
}

+ (BOOL)anyInfoIsLine:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        v9 = sub_1002469D0(v8, v7);
        v10 = v9;
        if (v9 && objc_msgSend(v9, "isLine", (void)v12))
        {

          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

+ (BOOL)anyInfoIsConnectionLine:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
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

+ (BOOL)anyInfoIsStickyNote:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        long long v9 = sub_1002469D0(v8, v7);

        if (v9)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (BOOL)anyInfoIsTextBox:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        long long v9 = sub_1002469D0(v8, v7);
        long long v10 = v9;
        if (v9 && objc_msgSend(v9, "isAutogrowingTextBox", (void)v12))
        {

          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

+ (BOOL)anyInfoIsAutoresizing:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        long long v9 = sub_1002469D0(v8, v7);
        long long v10 = [v7 geometry:v13];
        long long v11 = v10;
        if (v9
          && (![v10 widthValid] || (objc_msgSend(v11, "heightValid") & 1) == 0))
        {

          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

+ (BOOL)anyInfoIsOpenPath:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        long long v9 = sub_1002469D0(v8, v7);
        long long v10 = v9;
        if (v9 && objc_msgSend(v9, "isOpenPath", (void)v12))
        {

          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

+ (BOOL)infosAreLines:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);
        long long v11 = v10;
        if (v10 && (objc_msgSend(v10, "isLine", (void)v14) & 1) == 0)
        {

          BOOL v12 = 0;
          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

+ (BOOL)infosAreLinesAndConnectionLines:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);
        long long v11 = v10;
        if (v10 && objc_msgSend(v10, "isLine", (void)v15))
        {
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            BOOL v13 = 0;
            goto LABEL_14;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

+ (BOOL)infosAreOpenPaths:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);
        long long v11 = v10;
        if (!v10 || (objc_msgSend(v10, "isOpenPath", (void)v14) & 1) == 0)
        {

          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_13:

  return v12;
}

+ (BOOL)infosAreTextBoxes:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);
        long long v11 = v10;
        if (!v10 || (objc_msgSend(v10, "isAutogrowingTextBox", (void)v14) & 1) == 0)
        {

          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_13:

  return v12;
}

+ (BOOL)anyInfoSupportsVerticalAlignment:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = sub_1002469D0(v8, v7);
        long long v10 = v9;
        if (v9 && (objc_msgSend(v9, "isAutogrowingTextBox", (void)v12) & 1) == 0)
        {

          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (BOOL)anyInfoSupportsVerticalAlignment
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor anyInfoSupportsVerticalAlignment:v2];

  return v3;
}

+ (BOOL)anyInfoSupportsTextInspection:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = sub_1002469D0(v8, v7);

        if (v9)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)anyInfoSupportsTextInspection
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor anyInfoSupportsTextInspection:v2];

  return v3;
}

+ (BOOL)infosAreStickyNotes:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

+ (BOOL)infosAreMixedOpenAndClosedPaths:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        long long v12 = sub_1002469D0(v11, v10);
        long long v13 = v12;
        if (v12)
        {
          unsigned __int8 v14 = [v12 isOpenPath];
          v6 |= v14 ^ 1;
          v7 |= v14;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
    char v7 = 0;
  }

  return v7 & v6 & 1;
}

+ (BOOL)infosAreMixedOpenPathsAndLines:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {
    LOBYTE(v6) = 0;
    char v7 = 0;
    goto LABEL_16;
  }
  id v5 = v4;
  int v6 = 0;
  char v7 = 0;
  uint64_t v8 = *(void *)v16;
  while (2)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v3);
      }
      long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      uint64_t v11 = objc_opt_class();
      long long v12 = sub_1002469D0(v11, v10);
      long long v13 = v12;
      if (v12)
      {
        if (objc_msgSend(v12, "isLine", (void)v15))
        {
          char v7 = 1;
        }
        else
        {
          v6 |= [v13 isOpenPath];
          if ((v7 & 1) == 0) {
            goto LABEL_11;
          }
        }
        if (v6)
        {

          LOBYTE(v6) = 1;
          char v7 = 1;
          goto LABEL_16;
        }
      }
LABEL_11:
    }
    id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_16:

  return v7 & v6 & 1;
}

+ (BOOL)infosAreConnectionLines:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          BOOL v8 = 0;
          goto LABEL_11;
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
LABEL_11:

  return v8;
}

+ (BOOL)infosSupportEndpoints:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);
        long long v11 = v10;
        if (v10 && (objc_msgSend(v10, "pathIsOpen", (void)v14) & 1) == 0)
        {

          BOOL v12 = 0;
          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)infosAreOpenPaths
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreOpenPaths:v2];

  return v3;
}

- (BOOL)infosAreMixedOpenAndClosedPaths
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreMixedOpenAndClosedPaths:v2];

  return v3;
}

- (BOOL)infosAreLines
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreLines:v2];

  return v3;
}

- (BOOL)infosAreConnectionLines
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreConnectionLines:v2];

  return v3;
}

- (BOOL)infosAreTextBoxes
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreTextBoxes:v2];

  return v3;
}

- (BOOL)infosSupportEndpoints
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosSupportEndpoints:v2];

  return v3;
}

- (BOOL)suppressesFillInspector
{
  return ![(CRLShapeEditor *)self p_canSetFill];
}

- (BOOL)anyInfoIsLineOrConnectionLine
{
  BOOL v3 = [(CRLBoardItemEditor *)self boardItems];
  if (+[CRLShapeEditor anyInfoIsLine:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CRLBoardItemEditor *)self boardItems];
    BOOL v4 = +[CRLShapeEditor anyInfoIsConnectionLine:v5];
  }
  return v4;
}

- (BOOL)p_allInfosAreStickyNotes
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreStickyNotes:v2];

  return v3;
}

- (BOOL)suppressesTextInspector
{
  return [(CRLShapeEditor *)self suppressesFillInspector];
}

- (BOOL)suppressesStyleInspector
{
  return 0;
}

- (BOOL)suppressesPresetInspector
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor infosAreMixedOpenAndClosedPaths:v2];

  return v3;
}

- (BOOL)p_shouldShowInspectorForScalarPathSourceOfType:(unint64_t)a3
{
  BOOL v4 = self;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(CRLBoardItemEditor *)self boardItems];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    long long v18 = v4;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        BOOL v12 = sub_1002469D0(v11, v10);
        uint64_t v13 = objc_opt_class();
        long long v14 = [v12 pathSource];
        long long v15 = sub_1002469D0(v13, v14);

        if (!v15 || [v15 type] != (id)a3)
        {

          BOOL v16 = 0;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      BOOL v4 = v18;
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v5 = [(CRLBoardItemEditor *)v4 boardItems];
  BOOL v16 = [v5 count] != 0;
LABEL_12:

  return v16;
}

- (BOOL)p_shouldShowInspectorForPointPathSourceOfTypes:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(CRLBoardItemEditor *)self boardItems];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        BOOL v12 = sub_1002469D0(v11, v10);
        uint64_t v13 = objc_opt_class();
        long long v14 = [v12 pathSource];
        long long v15 = sub_1002469D0(v13, v14);

        if (!v15)
        {

LABEL_12:
          BOOL v18 = 0;
          goto LABEL_13;
        }
        BOOL v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 type]);
        unsigned int v17 = [v4 containsObject:v16];

        if (!v17) {
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v5 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v18 = [v5 count] != 0;
LABEL_13:

  return v18;
}

- (BOOL)shouldShowRoundedRectInspector
{
  return [(CRLShapeEditor *)self p_shouldShowInspectorForScalarPathSourceOfType:0];
}

- (BOOL)shouldShowPolygonInspector
{
  return [(CRLShapeEditor *)self p_shouldShowInspectorForScalarPathSourceOfType:1];
}

- (BOOL)shouldShowStarInspector
{
  return [(CRLShapeEditor *)self p_shouldShowInspectorForPointPathSourceOfTypes:&off_10155CB78];
}

- (BOOL)shouldShowArrowInspector
{
  return [(CRLShapeEditor *)self p_shouldShowInspectorForPointPathSourceOfTypes:&off_10155CB90];
}

- (BOOL)shouldShowCalloutInspector
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = [(CRLBoardItemEditor *)self boardItems];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        long long v10 = sub_1002469D0(v9, v8);
        uint64_t v11 = objc_opt_class();
        BOOL v12 = [v10 pathSource];
        uint64_t v13 = sub_1002469D0(v11, v12);

        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v3 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v14 = [v3 count] != 0;
LABEL_11:

  return v14;
}

- (BOOL)shouldShowLineInspector
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    uint64_t v6 = &unk_101657000;
    p_cache = &OBJC_METACLASS_____CRLTextEditorAccessibility_super.cache;
    long long v22 = v2;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = sub_1002469D0(v10, v9);
        BOOL v12 = [v11 pathSource];
        if ([v12 isMemberOfClass:objc_opt_class()])
        {
        }
        else
        {
          uint64_t v13 = [v11 pathSource];
          [v13 bezierPath];
          uint64_t v14 = v5;
          long long v15 = p_cache;
          v17 = long long v16 = v6;
          unsigned __int8 v18 = [v17 isLineSegment];

          uint64_t v6 = v16;
          p_cache = v15;
          uint64_t v5 = v14;

          v2 = v22;
          if ((v18 & 1) == 0)
          {

            BOOL v19 = 0;
            goto LABEL_13;
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v19 = [v2 count] != 0;
LABEL_13:

  return v19;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("makePathEditable:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self canMakePathEditable];
  }
  else if ("intersectPaths:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self canIntersectPaths];
  }
  else if ("makePathSmooth:" == a3 || "makePathSharp:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self canMakePathSmoothOrSharp];
  }
  else if ("resetTextAndObjectHandles:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self canResetTextAndObjectHandles];
  }
  else if ("divideCompoundShape:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self canDivideCompoundShape];
  }
  else if ("setShapeFill:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self p_canSetFill];
  }
  else if ("setLineEnd:isLeftLineEnd:" == a3)
  {
    unsigned int v8 = [(CRLShapeEditor *)self anyInfoIsLineOrConnectionLine];
  }
  else
  {
    if ("showShapeLibraryPopover:" != a3)
    {
      v11.receiver = self;
      v11.super_class = (Class)CRLShapeEditor;
      int64_t v9 = [(CRLStyledEditor *)&v11 canPerformEditorAction:a3 withSender:v6];
      goto LABEL_25;
    }
    unsigned int v8 = [(CRLShapeEditor *)self allowsChangeShape];
  }
  if (v8) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = -1;
  }
LABEL_25:

  return v9;
}

- (BOOL)canMakePathEditable
{
  id v3 = [(CRLBoardItemEditor *)self layouts];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(CRLBoardItemEditor *)self layouts];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = [v5 repForLayout:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          unsigned int v12 = [v11 canMakePathEditable];

          if (!v12)
          {
            LOBYTE(v4) = 0;
            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v4) = 1;
LABEL_12:
  }
  return (char)v4;
}

- (BOOL)canMakePathSmoothOrSharp
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canIntersectPaths
{
  BOOL v3 = [(CRLBoardItemEditor *)self layouts];
  if ((unint64_t)[v3 count] < 2)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers] ^ 1;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CRLBoardItemEditor *)self layouts];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) canBeIntersected])
        {
          LOBYTE(v5) = 0;
          goto LABEL_14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v5;
}

- (BOOL)canResetTextAndObjectHandles
{
  BOOL v3 = [(CRLBoardItemEditor *)self editorController];
  id v4 = [v3 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  if (v4 == self)
  {
    id v6 = [(CRLBoardItemEditor *)self layouts];
    BOOL v5 = [v6 count] != 0;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [(CRLBoardItemEditor *)self layouts];
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          if (![*(id *)(*((void *)&v13 + 1) + 8 * i) canResetTextAndObjectHandles])
          {
            BOOL v5 = 0;
            goto LABEL_13;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canDivideCompoundShape
{
  BOOL v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v4 = [v3 canvasEditor];
  BOOL v5 = [v4 canvasEditorHelper];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CRLBoardItemEditor *)self layouts];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 shapeInfo];
        unsigned int v13 = [v5 canDivideCompoundShape:v12];

        if (!v13 || ![v11 canBeDivided])
        {
          BOOL v14 = 0;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_13:

  return v14;
}

- (BOOL)p_shapeLacksEnoughStyleToBeSavedAsCustom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stroke];
  BOOL v5 = +[CRLStroke emptyStroke];
  if ([v4 isEqual:v5])
  {
    id v6 = [v3 fill];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)makePathSharp:(id)a3
{
  id v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v4 = [v3 editorController];
  id v7 = [v4 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  BOOL v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Make Sharp" value:0 table:@"UndoStrings"];
  [v7 editPathsOnPathEditableRepsWithActionString:v6 usingBlock:&stru_1014E2F60 filterWithBlock:&stru_1014E2F80];
}

- (void)makePathSmooth:(id)a3
{
  id v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v4 = [v3 editorController];
  id v7 = [v4 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  BOOL v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Make Smooth" value:0 table:@"UndoStrings"];
  [v7 editPathsOnPathEditableRepsWithActionString:v6 usingBlock:&stru_1014E2FA0 filterWithBlock:&stru_1014E2FC0];
}

- (void)makePathEditable:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self editorController];
  BOOL v5 = [v4 selectionPath];
  v30 = [v4 mostSpecificCurrentEditorOfClass:objc_opt_class()];
  v32 = v4;
  if (!v30)
  {
    id v6 = objc_alloc_init(CRLPathSelection);
    id v7 = [v4 selectionPath];
    uint64_t v8 = [v7 selectionPathWithAppendedSelection:v6];

    BOOL v5 = (void *)v8;
  }
  uint64_t v9 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v10 = [v9 commandController];
  objc_super v11 = [CRLCommandSelectionBehavior alloc];
  v29 = v9;
  long long v12 = [v9 canvasEditor];
  unsigned int v13 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v14 = [v12 selectionPathWithInfos:v13];
  v31 = v5;
  long long v15 = [(CRLCommandSelectionBehavior *)v11 initWithForwardSelectionPath:v5 reverseSelectionPath:v14];

  [v10 openGroupWithSelectionBehavior:v15];
  long long v16 = +[NSBundle mainBundle];
  long long v17 = [v16 localizedStringForKey:@"Make Editable" value:0 table:@"UndoStrings"];
  v28 = v10;
  [v10 setCurrentGroupActionString:v17];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v18 = [(CRLBoardItemEditor *)self boardItems];
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v24 = objc_opt_class();
        long long v25 = [(CRLBoardItemEditor *)self interactiveCanvasController];
        long long v26 = [v25 repForInfo:v23];
        v27 = sub_1002469D0(v24, v26);

        if (v27 && ([v27 isPathEditable] & 1) == 0)
        {
          [v27 dynamicOperationDidBeginWithRealTimeCommands:0];
          [v27 dynamicMovePathKnobDidBegin];
          [v27 dynamicMovePathKnobDidEndWithTracker:0];
          [v27 dynamicOperationDidEnd];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v20);
  }

  [v28 closeGroup];
  [v32 setSelectionPath:v31];
}

- (void)intersectPaths:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    -[CRLShapeEditor performBooleanOperationOnPaths:](self, "performBooleanOperationOnPaths:", [v4 tag]);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2FE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108CE54();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3000);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor intersectPaths:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 791, 0, "Callers to -[CRLShapeEditor intersectPaths:] must have a -[tag] method to specify what kind of intersection to perform.");
  }
}

- (void)performBooleanOperationOnPaths:(unint64_t)a3
{
  BOOL v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 editingCoordinator];
  id v7 = [v6 commandController];

  v73 = +[NSMutableArray array];
  uint64_t v8 = [(CRLBoardItemEditor *)self boardItems];
  uint64_t v9 = [v5 topLevelZOrderedSiblingsOfInfos:v8];

  uint64_t v10 = [(CRLBoardItemEditor *)self boardItems];
  objc_super v11 = [v9 crl_arrayWithObjectsInSet:v10];

  if ((unint64_t)[v11 count] >= 2)
  {
    unint64_t v67 = a3;
    v69 = v11;
    v70 = self;
    v72 = v9;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v80;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v80 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          long long v18 = [v5 canvasEditor];
          id v19 = [v18 selectionPathWithInfo:v17];

          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_100219D6C;
          v77[3] = &unk_1014D6E80;
          id v78 = v73;
          [v5 forLayoutNearestVisibleRectForInfosForSelectionPath:v19 performBlock:v77];
        }
        id v14 = [v12 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v14);
    }

    switch(v67)
    {
      case 0uLL:
        id v20 = +[CRLBezierPath uniteBezierPaths:v73];
        uint64_t v21 = +[NSBundle mainBundle];
        long long v22 = v21;
        CFStringRef v23 = @"Unite Shapes";
        goto LABEL_15;
      case 1uLL:
        id v20 = +[CRLBezierPath intersectBezierPaths:v73];
        uint64_t v21 = +[NSBundle mainBundle];
        long long v22 = v21;
        CFStringRef v23 = @"Intersect Shapes";
        goto LABEL_15;
      case 2uLL:
        id v20 = +[CRLBezierPath subtractBezierPaths:v73];
        uint64_t v21 = +[NSBundle mainBundle];
        long long v22 = v21;
        CFStringRef v23 = @"Subtract Shapes";
        goto LABEL_15;
      case 3uLL:
        id v20 = +[CRLBezierPath excludeBezierPaths:v73];
        uint64_t v21 = +[NSBundle mainBundle];
        long long v22 = v21;
        CFStringRef v23 = @"Exclude Shapes";
LABEL_15:
        uint64_t v24 = [v21 localizedStringForKey:v23 value:0 table:@"UndoStrings"];
        long long v25 = v70;

        break;
      default:
        uint64_t v24 = 0;
        id v20 = 0;
        long long v25 = self;
        break;
    }
    if ((uint64_t)[v20 elementCount] >= 2)
    {
      v63 = v12;
      uint64_t v26 = [v12 objectAtIndexedSubscript:0];
      v27 = (objc_class *)objc_opt_class();
      v28 = [(CRLBoardItemEditor *)v25 editingCoordinator];
      v29 = [v28 boardItemFactory];
      v65 = (void *)v26;
      [v29 makeDuplicateOfBoardItem:v26];
      v31 = v30 = v24;
      v32 = sub_10024715C(v27, v31);

      long long v33 = [v5 canvasEditor];
      long long v34 = [CRLCanvasCommandSelectionBehavior alloc];
      long long v35 = +[NSSet setWithObject:v32];
      long long v36 = [(CRLCanvasCommandSelectionBehavior *)v34 initWithCanvasEditor:v33 type:3 constructedInfos:v35];

      v64 = v36;
      [v7 openGroupWithSelectionBehavior:v36];
      [v7 enableProgressiveEnqueuingInCurrentGroup];
      v66 = v30;
      [v7 setCurrentGroupActionString:v30];
      v59 = +[NSMutableSet setWithArray:v63];
      v37 = +[NSMutableSet setWithArray:v9];
      [v37 minusSet:v59];
      [v20 bounds];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      v68 = v20;
      v46 = +[CRLBezierPathSource pathSourceWithBezierPath:v20];
      v47 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v39, v41, v43, v45);
      v62 = v33;
      v48 = [v33 canvasEditorHelper];
      v83 = v32;
      v49 = +[NSArray arrayWithObjects:&v83 count:1];
      v50 = [v63 lastObject];
      uint64_t v51 = [v48 commandForInsertingBoardItemsIntoTopLevelContainer:v49 below:v50];

      v61 = (void *)v51;
      [v7 enqueueCommand:v51];
      v60 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v32 pathSource:v46];
      [v7 enqueueCommand:];
      v52 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v32 geometry:v47];
      [v7 enqueueCommand:v52];
      [v5 layoutIfNeeded];
      v53 = [(CRLBoardItemEditor *)v70 editingCoordinator];
      v71 = v37;
      v54 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v37);

      if ([v54 count])
      {
        v55 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v54];
        [v7 enqueueCommand:v55];
      }
      v56 = [v62 canvasEditorHelper];
      v57 = [v56 commandForDeletingInfosPossiblyFromMultipleContainers:v59 shouldRemoveEmptyContainers:0];

      [v7 enqueueCommand:v57];
      [v7 closeGroup];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100219E38;
      v74[3] = &unk_1014CBE78;
      id v75 = v5;
      id v76 = v32;
      id v58 = v32;
      [v75 performBlockOnMainThreadAfterLayoutIfNecessary:v74];

      uint64_t v9 = v72;
      uint64_t v24 = v66;
      id v20 = v68;
    }

    objc_super v11 = v69;
  }
}

- (void)resetTextAndObjectHandles:(id)a3
{
  id v45 = a3;
  id v4 = [(CRLBoardItemEditor *)self editingCoordinator];
  BOOL v5 = [v4 commandController];

  [v5 openGroup];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = [(CRLBoardItemEditor *)self boardItems];
  id v50 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v84;
    v46 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v84 != v49)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v53 = v6;
        uint64_t v8 = *(void **)(*((void *)&v83 + 1) + 8 * v6);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = sub_1002469D0(v9, v8);
        objc_super v11 = v10;
        if (v10)
        {
          uint64_t v77 = 0;
          id v78 = &v77;
          uint64_t v79 = 0x3032000000;
          long long v80 = sub_10021A660;
          long long v81 = sub_10021A670;
          id v12 = [v10 pathSource];
          id v82 = [v12 bezierPath];

          id v13 = [v8 geometry];
          if ([v13 heightValid])
          {
            id v14 = [v8 geometry];
            unsigned __int8 v15 = [v14 widthValid];

            if (v15) {
              goto LABEL_12;
            }
          }
          else
          {
          }
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_10021A678;
          v76[3] = &unk_1014D60A8;
          v76[4] = &v77;
          [v8 withTemporaryLayoutPerform:v76];
LABEL_12:
          uint64_t v69 = 0;
          v70 = &v69;
          uint64_t v71 = 0x5010000000;
          v72 = "";
          long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
          long long v73 = *(_OWORD *)&CGAffineTransformIdentity.a;
          long long v74 = v16;
          long long v75 = *(_OWORD *)&CGAffineTransformIdentity.tx;
          uint64_t v62 = 0;
          v63 = &v62;
          uint64_t v64 = 0x5010000000;
          v65 = "";
          long long v66 = v73;
          long long v67 = v16;
          long long v68 = v75;
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_10021A6F4;
          v61[3] = &unk_1014D60A8;
          v61[4] = &v69;
          [v8 withTemporaryLayoutPerform:v61];
          uint64_t v17 = [v11 parentInfo];
          if (v17)
          {
            do
            {
              if ([v17 conformsToProtocol:&OBJC_PROTOCOL___CRLContainerInfo]) {
                break;
              }
              uint64_t v18 = objc_opt_class();
              id v19 = sub_1002469D0(v18, v17);
              id v20 = v19;
              if (v19)
              {
                v60[0] = _NSConcreteStackBlock;
                v60[1] = 3221225472;
                v60[2] = sub_10021A798;
                v60[3] = &unk_1014E3028;
                v60[4] = &v69;
                v60[5] = &v62;
                [v19 withTemporaryLayoutPerform:v60];
              }
              uint64_t v21 = [v17 parentInfo];

              uint64_t v17 = (void *)v21;
            }
            while (v21);
          }
          long long v22 = (void *)v78[5];
          long long v23 = *((_OWORD *)v70 + 3);
          *(_OWORD *)&v59.a = *((_OWORD *)v70 + 2);
          *(_OWORD *)&v59.c = v23;
          *(_OWORD *)&v59.tdouble x = *((_OWORD *)v70 + 4);
          [v22 transformUsingAffineTransform:&v59];
          [(id)v78[5] bounds];
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          v32 = +[CRLBezierPathSource pathSourceWithBezierPath:v78[5]];
          long long v33 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v25, v27, v29, v31);
          long long v34 = *((_OWORD *)v63 + 3);
          *(_OWORD *)&v59.a = *((_OWORD *)v63 + 2);
          *(_OWORD *)&v59.c = v34;
          *(_OWORD *)&v59.tdouble x = *((_OWORD *)v63 + 4);
          CGAffineTransformInvert(&v58, &v59);
          v52 = [(CRLCanvasInfoGeometry *)v33 geometryByAppendingTransform:&v58];

          uint64_t v51 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v11 geometry:v52];
          long long v35 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v11 pathSource:v32];
          [v5 openGroup];
          long long v36 = +[NSBundle mainBundle];
          v37 = [v36 localizedStringForKey:@"Reset Text and Object Handles" value:0 table:@"UndoStrings"];
          [v5 setCurrentGroupActionString:v37];

          [v5 enableProgressiveEnqueuingInCurrentGroup];
          [v5 enqueueCommand:v51];
          [v5 enqueueCommand:v35];
          double v38 = [(CRLBoardItemEditor *)self interactiveCanvasController];
          double v39 = [v38 layoutForInfo:v11];

          if (v39)
          {
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            double v40 = [v39 connectedLayouts];
            id v41 = [v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
            v48 = v32;
            if (v41)
            {
              uint64_t v42 = *(void *)v55;
              do
              {
                for (i = 0; i != v41; i = (char *)i + 1)
                {
                  if (*(void *)v55 != v42) {
                    objc_enumerationMutation(v40);
                  }
                  uint64_t v44 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                  [(CRLShapeEditor *)self p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:1 withClineLayout:v44 withShapeItem:v11];
                  [(CRLShapeEditor *)self p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:0 withClineLayout:v44 withShapeItem:v11];
                }
                id v41 = [v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
              }
              while (v41);
            }

            BOOL v5 = v46;
            v32 = v48;
          }
          [v5 closeGroup];

          _Block_object_dispose(&v62, 8);
          _Block_object_dispose(&v69, 8);
          _Block_object_dispose(&v77, 8);
        }
        uint64_t v6 = v53 + 1;
      }
      while ((id)(v53 + 1) != v50);
      id v50 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
    }
    while (v50);
  }

  [v5 closeGroup];
}

- (void)p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:(BOOL)a3 withClineLayout:(id)a4 withShapeItem:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 connectionLineInfo];
  objc_super v11 = [v10 connectionLinePathSource];
  id v12 = [v11 copy];

  id v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v14 = [v13 board];
  if (v6)
  {
    id v15 = [v10 getConnectedToWithBoardItemOwner:v14];

    if (v15 != v9) {
      goto LABEL_15;
    }
    long long v16 = [v12 headMagnet];
  }
  else
  {
    id v15 = [v10 getConnectedFromWithBoardItemOwner:v14];

    if (v15 != v9) {
      goto LABEL_15;
    }
    long long v16 = [v12 tailMagnet];
  }
  uint64_t v17 = v16;
  if (v16 && ([v16 magnetType] == (id)7 || objc_msgSend(v17, "magnetType") == (id)6))
  {
    if (v6) {
      [v8 headMagnetCanvasPosition];
    }
    else {
      [v8 tailMagnetCanvasPosition];
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10021AB04;
    v25[3] = &unk_1014E3050;
    uint64_t v28 = v18;
    uint64_t v29 = v19;
    BOOL v30 = v6;
    id v20 = v12;
    id v26 = v20;
    id v27 = v17;
    id v21 = v17;
    [v9 withTemporaryLayoutPerform:v25];

    long long v22 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v10 connectedItem:v9 chirality:v6 pathSource:v20];
    long long v23 = [(CRLBoardItemEditor *)self editingCoordinator];
    double v24 = [v23 commandController];
    [v24 enqueueCommand:v22];
  }
  else
  {
  }
  id v15 = v9;
LABEL_15:
}

- (void)divideCompoundShape:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  BOOL v5 = [(CRLBoardItemEditor *)self editingCoordinator];
  id v76 = [v5 boardItemFactory];
  v65 = v5;
  BOOL v6 = [v5 commandController];
  [v6 openGroup];
  [v6 enableProgressiveEnqueuingInCurrentGroup];
  uint64_t v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Break Apart" value:0 table:@"UndoStrings"];
  [v6 setCurrentGroupActionString:v8];

  uint64_t v77 = +[NSMutableSet set];
  id v9 = [(CRLBoardItemEditor *)self boardItems];
  uint64_t v64 = [v4 topLevelZOrderedSiblingsOfInfos:v9];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v10 = [(CRLBoardItemEditor *)self boardItems];
  id v11 = [v10 countByEnumeratingWithState:&v83 objects:v88 count:16];
  if (!v11)
  {

LABEL_33:
    [v6 closeGroup:v61, v62];
    goto LABEL_34;
  }
  id v12 = v11;
  char v13 = 0;
  id v14 = &off_1014C1000;
  uint64_t v15 = *(void *)v84;
  long long v73 = v6;
  uint64_t v61 = *(void *)v84;
  uint64_t v62 = v10;
  v63 = v4;
  do
  {
    long long v16 = 0;
    id v66 = v12;
    do
    {
      if (*(void *)v84 != v15) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v16);
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = sub_1002469D0(v18, v17);
      id v20 = v19;
      if (v19)
      {
        id v21 = [v19 pathSource];
        long long v22 = [v21 bezierPath];

        long long v23 = v22;
        double v24 = [v22 visuallyDistinctSubregions];
        if ((unint64_t)[v24 count] < 2)
        {
          [v77 addObject:v20];
        }
        else
        {
          uint64_t v71 = v23;
          id v78 = -[__objc2_class arrayWithCapacity:](v14[76], "arrayWithCapacity:", [v24 count]);
          uint64_t v25 = objc_opt_class();
          id v26 = sub_1002469D0(v25, v20);
          id v27 = [v26 textStorage];
          uint64_t v28 = [v27 string];
          v72 = v16;
          long long v68 = v27;
          uint64_t v69 = v26;
          long long v67 = v28;
          if (v27) {
            LODWORD(v29) = [v28 isEqualToString:&stru_101538650] ^ 1;
          }
          else {
            LOBYTE(v29) = 0;
          }
          id v74 = objc_alloc_init(v14[76]);
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v70 = v24;
          id obj = v24;
          id v30 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v80;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v80 != v32) {
                  objc_enumerationMutation(obj);
                }
                long long v34 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                long long v35 = [v20 geometry:v61, v62];
                [v34 bounds];
                long long v36 = [v35 geometryWithNewBounds:];

                v37 = +[CRLBezierPathSource pathSourceWithBezierPath:v34];
                double v38 = (objc_class *)objc_opt_class();
                double v39 = [v76 makeDuplicateOfBoardItem:v20];
                double v40 = sub_10024715C(v38, v39);

                [v40 setGeometry:v36];
                [v40 setPathSource:v37];
                uint64_t v41 = objc_opt_class();
                uint64_t v42 = sub_1002469D0(v41, v40);
                if ((v42 == 0) | v29 & 1)
                {
                  LOBYTE(v29) = (v42 == 0) & v29;
                }
                else
                {
                  double v43 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
                  uint64_t v29 = [v42 textStorage];
                  id v44 = [(id)v29 range];
                  v46 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v43, "initWithShapeItem:range:text:", v42, v44, v45, &stru_101538650);

                  [v74 addObject:v46];
                  LOBYTE(v29) = 0;
                }
                [v78 addObject:v40];
                [v77 addObject:v40];
              }
              id v31 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
            }
            while (v31);
          }

          v47 = +[NSMutableSet setWithObject:v20];
          v48 = +[NSMutableSet setWithArray:v64];
          [v48 minusSet:v47];
          id v4 = v63;
          uint64_t v49 = [v63 canvasEditor];
          id v50 = [v49 commandForInsertingBoardItems:v78 below:v20];

          [v73 enqueueCommand:v50];
          if ([v74 count])
          {
            uint64_t v51 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v74];
            [v73 enqueueCommand:v51];
          }
          [v63 layoutIfNeeded:v61, v62];
          v52 = +[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:v48 infosToRemove:v47 editingCoordinator:v65 withIcc:v63];
          if ([v52 count])
          {
            uint64_t v53 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v52];
            [v73 enqueueCommand:v53];
          }
          long long v54 = [v63 canvasEditor];
          long long v55 = [v54 canvasEditorHelper];
          long long v56 = +[NSSet setWithObject:v20];
          long long v57 = [v55 commandForDeletingInfosPossiblyFromMultipleContainers:v56 shouldRemoveEmptyContainers:0];

          [v73 enqueueCommand:v57];
          char v13 = 1;
          uint64_t v15 = v61;
          uint64_t v10 = v62;
          id v12 = v66;
          id v14 = &off_1014C1000;
          long long v23 = v71;
          long long v16 = v72;
          double v24 = v70;
        }
      }
      long long v16 = (char *)v16 + 1;
    }
    while (v16 != v12);
    id v12 = [v10 countByEnumeratingWithState:&v83 objects:v88 count:16];
  }
  while (v12);

  BOOL v6 = v73;
  if ((v13 & 1) == 0) {
    goto LABEL_33;
  }
  CGAffineTransform v58 = [CRLCanvasCommandSelectionBehavior alloc];
  CGAffineTransform v59 = [v4 canvasEditor];
  v60 = [(CRLCanvasCommandSelectionBehavior *)v58 initWithCanvasEditor:v59 type:3 constructedInfos:v77];

  [v73 closeGroupWithSelectionBehavior:v60];
LABEL_34:
}

- (void)p_applyTransformFromInfo:(id)a3 toEditablePathSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v9 = [v8 canvasEditor];
  uint64_t v10 = [v9 selectionPathWithInfo:v7];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021B430;
  v12[3] = &unk_1014D6E80;
  id v13 = v6;
  id v11 = v6;
  [v8 forLayoutNearestVisibleRectForInfosForSelectionPath:v10 performBlock:v12];
}

- (void)setLineEnd:(id)a3 isLeftLineEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v24 = a3;
  id v6 = [(CRLBoardItemEditor *)self editingCoordinator];
  id v7 = [v6 commandController];

  id v8 = [CRLCanvasCommandSelectionBehavior alloc];
  id v9 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v10 = [v9 canvasEditor];
  id v11 = [(CRLCanvasCommandSelectionBehavior *)v8 initWithCanvasEditor:v10];

  long long v22 = v11;
  [v7 openGroupWithSelectionBehavior:v11];
  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Stroke Line End Style" value:0 table:@"UndoStrings"];
  [v7 setCurrentGroupActionString:v13];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CRLBoardItemEditor *)self boardItems];
  id v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v17);
        uint64_t v19 = objc_opt_class();
        id v20 = sub_1002469D0(v19, v18);
        id v21 = [[_TtC8Freeform20CRLCommandSetLineEnd alloc] initWithShapeItem:v20 lineEnd:v24 chirality:[objc_opt_class() p_leftLineEndIsHeadForInfo:v20] ^ v4];
        [v7 enqueueCommand:v21];

        uint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  [v7 closeGroup];
}

- (id)selectedObjectsSupportingFill
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 objectsPassingTest:&stru_1014E3090];

  return v3;
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingFill
{
  return +[NSSet setWithObject:@"infos"];
}

- (id)selectedObjectsSupportingEndpoints
{
  v2 = [(CRLBoardItemEditor *)self layouts];
  id v3 = [v2 objectsPassingTest:&stru_1014E30B0];

  return v3;
}

- (BOOL)p_containsOpenPaths
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = +[CRLShapeEditor anyInfoIsOpenPath:v2];

  return v3;
}

+ (BOOL)p_leftLineEndIsHeadForInfo:(id)a3
{
  return [a3 isTailEndOnLeftBestGuess] ^ 1;
}

- (id)leftLineEnd
{
  BOOL v3 = (objc_class *)objc_opt_class();
  BOOL v4 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v5 = [v4 anyObject];
  id v6 = sub_10024715C(v3, v5);

  id v7 = [(id)objc_opt_class() leftLineEndForShape:v6];

  return v7;
}

+ (id)leftLineEndForShape:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(a1, "p_leftLineEndIsHeadForInfo:", v4)) {
    [v4 headLineEnd];
  }
  else {
  BOOL v5 = [v4 tailLineEnd];
  }

  return v5;
}

- (id)rightLineEnd
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v5 = [v4 anyObject];
  id v6 = sub_10024715C(v3, v5);

  id v7 = [(id)objc_opt_class() rightLineEndForShape:v6];

  return v7;
}

+ (id)rightLineEndForShape:(id)a3
{
  id v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "p_leftLineEndIsHeadForInfo:", v3)) {
    [v3 tailLineEnd];
  }
  else {
  id v4 = [v3 headLineEnd];
  }

  return v4;
}

- (id)strokeColorPickerTitle
{
  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeEditor;
  id v3 = [(CRLStyledEditor *)&v9 strokeColorPickerTitle];
  LODWORD(v2) = [(CRLShapeEditor *)v2 infosAreOpenPaths];
  id v4 = +[NSBundle mainBundle];
  BOOL v5 = v4;
  if (v2) {
    CFStringRef v6 = @"Stroke Color";
  }
  else {
    CFStringRef v6 = @"Border Color";
  }
  id v7 = [v4 localizedStringForKey:v6 value:0 table:0];

  return v7;
}

- (id)currentGroupActionStringForStrokeSetting
{
  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeEditor;
  id v3 = [(CRLStyledEditor *)&v9 currentGroupActionStringForStrokeSetting];
  LODWORD(v2) = [(CRLShapeEditor *)v2 infosAreOpenPaths];
  id v4 = +[NSBundle mainBundle];
  BOOL v5 = v4;
  if (v2) {
    CFStringRef v6 = @"Stroke Setting";
  }
  else {
    CFStringRef v6 = @"Border Setting";
  }
  id v7 = [v4 localizedStringForKey:v6 value:0 table:@"UndoStrings"];

  return v7;
}

- (BOOL)p_shapesContainNonLine
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self;
  id v4 = -[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v3, 0);

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = sub_1002469D0(v9, v8);
        if (v10)
        {
          id v11 = +[NSSet setWithObject:v10];
          if (!+[CRLShapeEditor infosAreLines:v11]
            && !+[CRLShapeEditor infosAreConnectionLines:v11])
          {

            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v5;
}

- (BOOL)p_shapesAreMixed
{
  id v3 = [(CRLBoardItemEditor *)self boardItems];
  if (+[CRLShapeEditor infosAreStickyNotes:v3]
    || +[CRLShapeEditor infosAreLines:v3]
    || +[CRLShapeEditor infosAreConnectionLines:v3])
  {
    BOOL v4 = 0;
  }
  else if (+[CRLShapeEditor anyInfoIsStickyNote:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = [(CRLShapeEditor *)self anyInfoIsLineOrConnectionLine];
  }

  return v4;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CRLShapeEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v38, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  id v8 = [(CRLBoardItemEditor *)self boardItems];
  unsigned int v9 = +[CRLShapeEditor infosAreLinesAndConnectionLines:v8];

  uint64_t v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"Set Fill" value:0 table:0];
  id v12 = +[CRLImage crl_quickInspectorImageNamed:@"circle.fill"];
  long long v13 = +[CRLQuickInspectorElement elementWithName:v11 image:v12 type:2 options:4];

  [v13 setTag:1];
  long long v14 = +[NSBundle mainBundle];
  long long v15 = [v14 localizedStringForKey:@"Choose a fill color" value:0 table:0];
  [v13 setToolTip:v15];

  long long v16 = +[NSBundle mainBundle];
  uint64_t v17 = [v16 localizedStringForKey:@"Set Stroke" value:0 table:0];
  uint64_t v18 = +[CRLImage crl_quickInspectorImageNamed:@"line.diagonal"];
  uint64_t v19 = +[CRLQuickInspectorElement elementWithName:v17 image:v18 type:2 options:8];

  [v19 setTag:2];
  id v20 = +[NSBundle mainBundle];
  id v21 = v20;
  char v37 = v9;
  BOOL v22 = v9 == 0;
  long long v23 = v7;
  if (v22) {
    CFStringRef v24 = @"Choose a border style";
  }
  else {
    CFStringRef v24 = @"Choose a line style or set line width";
  }
  long long v25 = [v20 localizedStringForKey:v24 value:0 table:0];
  [v19 setToolTip:v25];

  long long v26 = +[NSBundle mainBundle];
  long long v27 = [v26 localizedStringForKey:@"Set Line Ends" value:0 table:0];
  long long v28 = +[CRLImage crl_quickInspectorImageNamed:@"line.diagonal.arrow"];
  uint64_t v29 = +[CRLQuickInspectorElement elementWithName:v27 image:v28 type:2 options:32];

  [v29 setTag:6];
  uint64_t v30 = +[NSBundle mainBundle];
  id v31 = [(id)v30 localizedStringForKey:@"Choose a line end type" value:0 table:0];
  [v29 setToolTip:v31];

  uint64_t v32 = [(CRLBoardItemEditor *)self boardItems];
  LOBYTE(v30) = +[CRLShapeEditor anyInfoIsStickyNote:v32];

  if ((v30 & 1) == 0)
  {
    if ([(CRLShapeEditor *)self p_shapesAreMixed])
    {
      if ((v37 & 1) != 0
        || ([(CRLBoardItemEditor *)self boardItems],
            long long v33 = objc_claimAutoreleasedReturnValue(),
            unsigned int v34 = +[CRLShapeEditor infosAreOpenPaths:v33],
            v33,
            v34))
      {
        [v23 addObject:v19];
LABEL_14:
        [v23 addObject:v29];
      }
    }
    else
    {
      long long v35 = [(CRLBoardItemEditor *)self boardItems];
      BOOL v36 = +[CRLShapeEditor anyInfoIsTextBox:v35];

      if ([(CRLShapeEditor *)self p_canSetFillWithAnyInfoIsTextBox:v36]) {
        [v23 addObject:v13];
      }
      if ([(CRLShapeEditor *)self p_canSetStrokeWithAnyInfoIsTextBox:v36]) {
        [v23 addObject:v19];
      }
      if ([(CRLShapeEditor *)self infosSupportEndpoints]) {
        goto LABEL_14;
      }
    }
  }
}

- (BOOL)p_canSetFill
{
  id v3 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v4 = +[CRLShapeEditor anyInfoIsTextBox:v3];

  return [(CRLShapeEditor *)self p_canSetFillWithAnyInfoIsTextBox:v4];
}

- (BOOL)p_canSetFillWithAnyInfoIsTextBox:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  else {
    return ![(CRLShapeEditor *)self anyInfoIsLineOrConnectionLine];
  }
}

- (BOOL)p_canSetStrokeWithAnyInfoIsTextBox:(BOOL)a3
{
  return !a3;
}

- (void)setShapeFill:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v6 = [v5 commandController];
  id v7 = [CRLCommandSelectionBehavior alloc];
  id v8 = [v5 editorController];
  unsigned int v9 = [v8 selectionPath];
  long long v23 = v5;
  uint64_t v10 = [v5 editorController];
  id v11 = [v10 selectionPath];
  id v12 = [(CRLCommandSelectionBehavior *)v7 initWithForwardSelectionPath:v9 reverseSelectionPath:v11];

  BOOL v22 = v12;
  [v6 openGroupWithSelectionBehavior:v12];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v13 = [(CRLBoardItemEditor *)self boardItems];
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v17);
        uint64_t v19 = (objc_class *)objc_opt_class();
        id v20 = sub_10024715C(v19, v18);
        if (v20)
        {
          id v21 = [[_TtC8Freeform17CRLCommandSetFill alloc] initWithShapeItem:v20 fill:v4];
          [v6 enqueueCommand:v21];
        }
        uint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  [v6 closeGroup];
}

- (void)showShapeLibraryPopover:(id)a3
{
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled", a3)|| +[CRLFeatureFlagGroup isChangeShapeEnabled])
  {
    +[CRLShapeLibraryPopoverHelper showShapeLibraryForEditor:self];
  }
}

- (void)dismissShapeLibraryPopover:(id)a3
{
}

- (BOOL)allowsChangeShape
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = objc_opt_class();
        id v8 = sub_1002469D0(v7, v6);
        unsigned int v9 = v8;
        if (v8 && [v8 allowsChangeShape])
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)changeShapeToUsePathSource:(id)a3
{
  id v4 = a3;
  if ([(CRLShapeEditor *)self allowsChangeShape]
    && [v4 canUseToChangeShape])
  {
    id v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    uint64_t v6 = [v5 commandController];

    uint64_t v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v8 = [v7 canvasEditor];
    unsigned int v9 = [v8 canvasEditorHelper];

    uint64_t v10 = [(CRLBoardItemEditor *)self boardItems];
    long long v24 = [v9 selectionPathWithInfos:v10];

    id v11 = objc_alloc_init((Class)NSMutableSet);
    [v6 openGroup];
    [v6 enableProgressiveEnqueuingInCurrentGroup];
    long long v12 = +[NSBundle mainBundle];
    long long v13 = [v12 localizedStringForKey:@"Change Shape" value:0 table:@"UndoStrings"];
    [v6 setCurrentGroupActionString:v13];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v14 = [(CRLBoardItemEditor *)self boardItems];
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v20 = (objc_class *)objc_opt_class();
          id v21 = sub_10024715C(v20, v19);
          if ([v21 allowsChangeShape])
          {
            [v11 addObject:v21];
            [(CRLShapeEditor *)self p_changeShapeOfItem:v21 toUsePathSource:v4];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    BOOL v22 = [v9 selectionPathWithInfos:v11];
    long long v23 = [[CRLCommandSelectionBehavior alloc] initWithCommitSelectionPath:v24 forwardSelectionPath:v22 reverseSelectionPath:v24];
    [v6 closeGroupWithSelectionBehavior:v23];
  }
}

- (void)p_changeShapeOfItem:(id)a3 toUsePathSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v104 = self;
  id v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v106 = [v8 commandController];

  unsigned int v9 = [v6 geometry];
  [v9 size];
  if (v10 == 0.0)
  {
  }
  else
  {
    id v11 = [v6 geometry];
    [v11 size];
    double v13 = v12;

    if (v13 != 0.0) {
      goto LABEL_14;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E30D0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10108CFEC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E30F0);
  }
  long long v14 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v14);
  }
  id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:]");
  id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"];
  +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:1532 isFatal:0 description:"Cannot change shape from a shape whose width or height is zero"];

LABEL_14:
  [v7 naturalSize];
  if (v17 == 0.0 || ([v7 naturalSize], v18 == 0.0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3110);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108CF64();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3130);
    }
    uint64_t v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:]");
    id v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:1533 isFatal:0 description:"Cannot change shape to a shape whose width and height are both nonzero."];
  }
  BOOL v22 = [v6 geometry];
  [v22 size];
  double v24 = v23;
  long long v25 = [v6 geometry];
  [v25 size];
  double v27 = v24 / v26;

  [v7 naturalSize];
  double v29 = v28;
  [v7 naturalSize];
  double v31 = v29 / v30;
  id v32 = [v7 copy];
  long long v33 = v7;
  BOOL v34 = vabdd_f64(v27, v31) < 0.00999999978 || v27 == v31;
  long long v35 = [v6 geometry];
  [v35 size];
  double v37 = v36;
  v101 = v33;
  if (v34)
  {
    [v32 scaleToNaturalSize:v36];
  }
  else
  {
    objc_super v38 = [v6 geometry];
    [v38 size];
    double v40 = v37 * v39;

    [v33 naturalSize];
    double v42 = v41;
    [v33 naturalSize];
    double v44 = sqrt(v40 / (v42 * v43));
    [v33 naturalSize];
    [v32 scaleToNaturalSize:sub_1000646A4(v45, v46, v44)];
  }
  v47 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v6 pathSource:v32];
  v102 = v32;
  if (([v106 isGroupOpen] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    v48 = v47;
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3150);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108CEDC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3170);
    }
    uint64_t v49 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v49);
    }
    id v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:]");
    uint64_t v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v50 file:v51 lineNumber:1565 isFatal:0 description:"Changing shapes is only supported from within an open command group."];

    v47 = v48;
  }
  v100 = v47;
  [v106 enqueueCommand:v47];
  if (!v34)
  {
    [v32 naturalSize];
    double v53 = v52;
    double v55 = v54;
    long long v56 = [v6 geometry];
    [v56 center];
    double v58 = v57;
    double v60 = v59;

    uint64_t v61 = [CRLCanvasInfoGeometry alloc];
    uint64_t v62 = [v6 geometry];
    [v62 angle];
    uint64_t v64 = -[CRLCanvasInfoGeometry initWithPosition:size:angle:](v61, "initWithPosition:size:angle:", v58 - v53 * 0.5, v60 - v55 * 0.5, v53, v55, v63);

    v65 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v6 geometry:v64];
    [v106 enqueueCommand:v65];
  }
  id v66 = [(CRLBoardItemEditor *)v104 interactiveCanvasController];
  v105 = v6;
  long long v67 = [v66 layoutForInfo:v6];

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = [v67 connectedLayouts];
  id v68 = [obj countByEnumeratingWithState:&v107 objects:v111 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v108;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        if (*(void *)v108 != v70) {
          objc_enumerationMutation(obj);
        }
        v72 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        long long v73 = [v72 connectionLineInfo];
        id v74 = [v73 connectionLinePathSource];
        id v75 = [v74 copy];

        id v76 = [v72 connectedTo];

        if (v76 == v67)
        {
          [(CRLShapeEditor *)v104 p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:v72 withOldLayout:v67 withNewInfo:v105 forLineEnd:11];
          double v93 = v92;
          double v95 = v94;
          v96 = [v75 headMagnet];
          [v96 setMagnetNormalizedPosition:v93, v95];

          v97 = [_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc];
          uint64_t v98 = objc_opt_class();
          long long v85 = [v72 connectedTo];
          long long v86 = [v85 info];
          v87 = sub_1002469D0(v98, v86);
          v88 = v97;
          v89 = v73;
          v90 = v87;
          uint64_t v91 = 1;
        }
        else
        {
          uint64_t v77 = [v72 connectedFrom];

          if (v77 != v67) {
            goto LABEL_53;
          }
          [(CRLShapeEditor *)v104 p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:v72 withOldLayout:v67 withNewInfo:v105 forLineEnd:10];
          double v79 = v78;
          double v81 = v80;
          long long v82 = [v75 tailMagnet];
          [v82 setMagnetNormalizedPosition:v79, v81];

          long long v83 = [_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc];
          uint64_t v84 = objc_opt_class();
          long long v85 = [v72 connectedFrom];
          long long v86 = [v85 info];
          v87 = sub_1002469D0(v84, v86);
          v88 = v83;
          v89 = v73;
          v90 = v87;
          uint64_t v91 = 0;
        }
        v99 = [(CRLCommandSetConnectionLineConnection *)v88 initWithConnectionLine:v89 connectedItem:v90 chirality:v91 pathSource:v75];

        [v106 enqueueCommand:v99];
LABEL_53:
      }
      id v69 = [obj countByEnumeratingWithState:&v107 objects:v111 count:16];
    }
    while (v69);
  }
}

- (CGPoint)p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:(id)a3 withOldLayout:(id)a4 withNewInfo:(id)a5 forLineEnd:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6 == 11) {
    id v12 = [v9 headMagnetType];
  }
  else {
    id v12 = [v9 tailMagnetType];
  }
  id v13 = v12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3010000000;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  v35[3] = "";
  if (a6 == 11) {
    [v9 headMagnetCanvasPosition];
  }
  else {
    [v9 tailMagnetCanvasPosition];
  }
  uint64_t v36 = v14;
  uint64_t v37 = v15;
  uint64_t v29 = 0;
  double v30 = (double *)&v29;
  uint64_t v31 = 0x3010000000;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  id v32 = "";
  if (a6 == 11) {
    [v9 headMagnetNormalizedPosition];
  }
  else {
    [v9 tailMagnetNormalizedPosition];
  }
  uint64_t v33 = v16;
  uint64_t v34 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10021D610;
  v23[3] = &unk_1014E3198;
  id v27 = v13;
  long long v25 = v35;
  id v18 = v9;
  unint64_t v28 = a6;
  id v24 = v18;
  double v26 = &v29;
  [v11 withTemporaryLayoutPerform:v23];
  double v19 = v30[4];
  double v20 = v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  double v21 = v19;
  double v22 = v20;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (BOOL)fillInspectorDisclosed
{
  return *(&self->super.mIsChangingStrokeWidth + 1);
}

- (CRLPathEditor)nextPathEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)(&self->mFillInspectorDisclosed + 1));

  return (CRLPathEditor *)WeakRetained;
}

- (void)setNextPathEditor:(id)a3
{
}

- (BOOL)p_anyInfoWasLine
{
  return BYTE1(self->mNextPathEditor);
}

- (void)setP_anyInfoWasLine:(BOOL)a3
{
  BYTE1(self->mNextPathEditor) = a3;
}

- (BOOL)p_anyInfoWasAutoresizing
{
  return BYTE2(self->mNextPathEditor);
}

- (void)setP_anyInfoWasAutoresizing:(BOOL)a3
{
  BYTE2(self->mNextPathEditor) = a3;
}

- (void).cxx_destruct
{
}

@end