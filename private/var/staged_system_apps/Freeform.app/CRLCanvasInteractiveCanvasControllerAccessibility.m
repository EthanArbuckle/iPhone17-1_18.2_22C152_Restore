@interface CRLCanvasInteractiveCanvasControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxElementSupportsChangeTracking:(id)a3;
- (BOOL)_crlaxIsObservingRemoteCommands;
- (BOOL)_crlaxIsTearingDown;
- (BOOL)_crlaxZoomToShowRepForLayoutAndFocus:(id)a3;
- (BOOL)crlaxAllowsCaptionEditing;
- (BOOL)crlaxCurrentSelectionContainsComment;
- (BOOL)crlaxCurrentlyWaitingOnThreadedLayoutAndRender;
- (BOOL)crlaxDocumentIsSharedReadOnly;
- (BOOL)crlaxIsInFollowingMode;
- (BOOL)crlaxKnobElementIsAccessibilityElement:(id)a3;
- (BOOL)crlaxScrollLayoutToVisibleAndFocusTheAssociatedRep:(id)a3;
- (BOOL)crlaxShapeRepsAreIgnored;
- (BOOL)crlaxShouldLabelCanvas;
- (CGPoint)crlaxConvertBoundsToUnscaledPoint:(CGPoint)a3;
- (CGPoint)crlaxConvertUnscaledToBoundsPoint:(CGPoint)a3;
- (CGRect)crlaxConvertBoundsToUnscaledRect:(CGRect)a3;
- (CGRect)crlaxConvertUnscaledRectToRulerUnits:(CGRect)a3;
- (CGRect)crlaxConvertUnscaledToBoundsRect:(CGRect)a3;
- (CRLAccessibilityEditMenuControllerItemProvider)crlaxEditMenuItemProvider;
- (CRLAccessibilityTimer)_crlaxCollaborationOccurredTimer;
- (CRLCanvasAccessibility)crlaxCanvas;
- (CRLCanvasRepAccessibility)crlaxFirstSelectedRep;
- (CRLCanvasRepAccessibility)crlaxFocusedRep;
- (CRLCanvasViewAccessibility)crlaxCanvasView;
- (CRLEditorControllerAccessibility)crlaxEditorController;
- (CRLKeyboardMovementManipulatorAccessibility)crlaxKeyboardMovementManipulator;
- (CRLSubselectionAccessibility)crlaxCanvasSelection;
- (CRLTextInputResponderAccessibility)crlaxTextInputResponder;
- (CRLiOSCanvasViewControllerAccessibility)crlaxCanvasViewController;
- (NSArray)crlaxCustomRotors;
- (NSArray)crlaxFilteredTopLevelReps;
- (NSArray)crlaxTopLevelRepsForHitTesting;
- (NSMutableSet)_crlaxCollaborationModifiers;
- (NSSet)crlaxSelectedReps;
- (NSTimer)_crlaxSelectionAnnouncementTimer;
- (UIAccessibilityCustomRotor)crlaxCommentsRotor;
- (UIAccessibilityCustomRotor)crlaxHighlightsRotor;
- (UIAccessibilityCustomRotor)crlaxNearbyElementsRotor;
- (UIAccessibilityCustomRotor)crlaxTrackedChangesRotor;
- (double)_crlaxConvertPointToRulerValue:(double)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_crlaxCurrentSearchReferenceForRotor:(id)a3;
- (id)_crlaxElementForMovingToSelection;
- (id)_crlaxFirstSelectedRepInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4;
- (id)_crlaxSelectedRepsInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4;
- (id)_crlaxStoredCommentsRotor;
- (id)_crlaxStoredCommentsRotorSearchController;
- (id)_crlaxStoredHighlightsRotor;
- (id)_crlaxStoredHighlightsRotorSearchController;
- (id)_crlaxStoredNearbyElementsRotor;
- (id)_crlaxStoredNearbyElementsRotorSearchController;
- (id)_crlaxStoredTrackedChangesRotor;
- (id)_crlaxStoredTrackedChangesRotorSearchController;
- (id)_crlaxTopLevelInspectorViewControllers;
- (id)_rotorForName:(id)a3;
- (id)crlaxActionMenuItemsForRep:(id)a3;
- (id)crlaxCanvasEditor;
- (id)crlaxCollaboratorCursorDelegate;
- (id)crlaxCommentEditor;
- (id)crlaxCustomRotorResultForRotor:(id)a3 predicate:(id)a4;
- (id)crlaxCustomRotorResultForRotorName:(id)a3 predicate:(id)a4;
- (id)crlaxDelegate;
- (id)crlaxDescriptionOfPointValueConvertedToRulerUnit:(double)a3;
- (id)crlaxFocusTextRangeFromSearchReference:(id)a3;
- (id)crlaxHitTestWithUnscaledPoint:(CGPoint)a3;
- (id)crlaxInfosForCurrentSelectionPath;
- (id)crlaxInfosForSelectionPath:(id)a3;
- (id)crlaxLayoutsForSelectionPath:(id)a3;
- (id)crlaxLocalizedRulerUnitsForCanvas;
- (id)crlaxRepForInfo:(id)a3;
- (id)crlaxRepForLayout:(id)a3;
- (id)crlaxRepForSearchReference:(id)a3;
- (id)crlaxRepsForInfo:(id)a3;
- (id)crlaxResultSearchReferenceForRotor:(id)a3 fromSearchReference:(id)a4 inDirection:(int64_t)a5;
- (id)crlaxRotorSearchControllerForRotor:(id)a3;
- (id)crlaxRulerUnitsInstance;
- (id)crlaxSearchReferenceForSelectionPath:(id)a3;
- (id)crlaxSelectionPathWithInfo:(id)a3;
- (id)crlaxSelectionPathWithInfos:(id)a3;
- (id)p_sentenceUsingFormat:(id)a3 toDescribeRepSelectionOrDeltaWith:(id)a4;
- (void)_crlaxAddArrangeActionsToArray:(id)a3 forRep:(id)a4;
- (void)_crlaxAddMultiSelectionActionsToArray:(id)a3 forRep:(id)a4;
- (void)_crlaxAddSelectionActionsToArray:(id)a3 forRep:(id)a4;
- (void)_crlaxAlignSelectionToBottom;
- (void)_crlaxAlignSelectionToCenter;
- (void)_crlaxAlignSelectionToEdge:(int)a3;
- (void)_crlaxAlignSelectionToLeft;
- (void)_crlaxAlignSelectionToMiddle;
- (void)_crlaxAlignSelectionToRight;
- (void)_crlaxAlignSelectionToTop;
- (void)_crlaxAnnounceSelectedElementCount;
- (void)_crlaxDeselectWithSelectionPath:(id)a3;
- (void)_crlaxGoToArrange;
- (void)_crlaxPostCollaborationOccurredSound;
- (void)_crlaxPostCollaborationOccurredSoundRepeatedly:(int)a3;
- (void)_crlaxScrollAndAnnounceSearchReference:(id)a3 forRotor:(id)a4;
- (void)_crlaxSetCollaborationModifiers:(id)a3;
- (void)_crlaxSetCollaborationOccurredTimer:(id)a3;
- (void)_crlaxSetIsObservingRemoteCommands:(BOOL)a3;
- (void)_crlaxSetIsTearingDown:(BOOL)a3;
- (void)_crlaxSetSelectionAnnouncmentTimer:(id)a3;
- (void)_crlaxSetStoredCommentsRotor:(id)a3;
- (void)_crlaxSetStoredCommentsRotorSearchController:(id)a3;
- (void)_crlaxSetStoredHighlightsRotor:(id)a3;
- (void)_crlaxSetStoredHighlightsRotorSearchController:(id)a3;
- (void)_crlaxSetStoredNearbyElementsRotor:(id)a3;
- (void)_crlaxSetStoredNearbyElementsRotorSearchController:(id)a3;
- (void)_crlaxSetStoredTrackedChangesRotor:(id)a3;
- (void)_crlaxSetStoredTrackedChangesRotorSearchController:(id)a3;
- (void)_crlaxUnregisterForNotifications;
- (void)_crlaxUpdateSelectionWithRep:(id)a3;
- (void)addCommonObservers;
- (void)collaboratorCursorSelectionPathChangedFromSelectionPath:(id)a3 toSelectionPath:(id)a4 collaboratorPresence:(id)a5;
- (void)crlaxAddRepToSelection:(id)a3;
- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4;
- (void)crlaxCancelCollaborationOccurredTimer;
- (void)crlaxCollaboratorDeletedMySelection;
- (void)crlaxDeselectAll;
- (void)crlaxDeselectRep:(id)a3;
- (void)crlaxDidFocusRep:(id)a3;
- (void)crlaxLayoutIfNeeded;
- (void)crlaxLoadAccessibilityInformation;
- (void)crlaxScrollCurrentSelectionToVisible;
- (void)crlaxScrollSelectionPathToVisible:(id)a3;
- (void)crlaxSelectRep:(id)a3;
- (void)crlaxSelectReps:(id)a3;
- (void)crlaxSelectReps:(id)a3 force:(BOOL)a4;
- (void)crlaxWillSelectRep:(id)a3;
- (void)p_editorControllerSelectionPathDidChange:(id)a3;
- (void)removeCommonObservers;
- (void)teardown;
@end

@implementation CRLCanvasInteractiveCanvasControllerAccessibility

- (id)_crlaxStoredTrackedChangesRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C0);
}

- (void)_crlaxSetStoredTrackedChangesRotor:(id)a3
{
}

- (id)_crlaxStoredCommentsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C1);
}

- (void)_crlaxSetStoredCommentsRotor:(id)a3
{
}

- (id)_crlaxStoredHighlightsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C2);
}

- (void)_crlaxSetStoredHighlightsRotor:(id)a3
{
}

- (id)_crlaxStoredTrackedChangesRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C3);
}

- (void)_crlaxSetStoredTrackedChangesRotorSearchController:(id)a3
{
}

- (id)_crlaxStoredCommentsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C4);
}

- (void)_crlaxSetStoredCommentsRotorSearchController:(id)a3
{
}

- (id)_crlaxStoredHighlightsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C5);
}

- (void)_crlaxSetStoredHighlightsRotorSearchController:(id)a3
{
}

- (id)_crlaxStoredNearbyElementsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C6);
}

- (void)_crlaxSetStoredNearbyElementsRotor:(id)a3
{
}

- (id)_crlaxStoredNearbyElementsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A95C7);
}

- (void)_crlaxSetStoredNearbyElementsRotorSearchController:(id)a3
{
}

- (CRLiOSCanvasViewControllerAccessibility)crlaxCanvasViewController
{
  char v9 = 0;
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  v3 = [v2 layerHost];
  v4 = [v3 asiOSCVC];

  v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v9);
  if (v9) {
    abort();
  }
  v7 = (void *)v6;

  return (CRLiOSCanvasViewControllerAccessibility *)v7;
}

- (CRLTextInputResponderAccessibility)crlaxTextInputResponder
{
  char v8 = 0;
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  v3 = [v2 textInputResponder];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLTextInputResponderAccessibility *)v6;
}

- (id)_crlaxElementForMovingToSelection
{
  v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTextInputResponder];
  v4 = [v3 crlaxFocusedElement];

  if (!v4)
  {
    uint64_t v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxFocusedRep];
    v4 = [v5 crlaxFocusedElement];
  }

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxConvertBoundsToUnscaledPoint:](self, "crlaxConvertBoundsToUnscaledPoint:", x, y);
  double v9 = v8;
  double v11 = v10;
  v12 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxHitTestWithUnscaledPoint:](self, "crlaxHitTestWithUnscaledPoint:");
  if ([v12 isAccessibilityElement]) {
    goto LABEL_4;
  }
  v13 = [v12 _accessibilityHitTest:v7 withEvent:v9, v11];

  if ([v13 isAccessibilityElement])
  {
    v12 = v13;
LABEL_4:
    id v14 = v12;
    v13 = v14;
    goto LABEL_6;
  }
  id v14 = 0;
LABEL_6:

  return v14;
}

- (CRLAccessibilityEditMenuControllerItemProvider)crlaxEditMenuItemProvider
{
  v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxEditorController];
  v4 = [v3 crlaxTextInputEditor];
  uint64_t v5 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLAccessibilityEditMenuControllerItemProvider, v4, 0, 0);

  if (!v5)
  {
    uint64_t v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasViewController];
    uint64_t v5 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLAccessibilityEditMenuControllerItemProvider, v6, 0, 0);
  }

  return (CRLAccessibilityEditMenuControllerItemProvider *)v5;
}

- (id)crlaxActionMenuItemsForRep:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxAddSelectionActionsToArray:v5 forRep:v4];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxAddMultiSelectionActionsToArray:v5 forRep:v4];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxAddArrangeActionsToArray:v5 forRep:v4];

  return v5;
}

- (void)_crlaxAddSelectionActionsToArray:(id)a3 forRep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 crlaxIsSelected] & 1) == 0)
  {
    double v8 = [v7 crlaxRepForSelecting];
    if ([v8 crlaxIsSelected])
    {
    }
    else
    {
      if ([v7 crlaxIsSelectable])
      {
      }
      else
      {
        double v9 = [v7 crlaxRepForSelecting];
        unsigned __int8 v10 = [v9 crlaxIsSelectable];

        if ((v10 & 1) == 0) {
          goto LABEL_12;
        }
      }
      double v11 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxElementForMovingToSelection];
      if (v11)
      {
        v12 = +[NSBundle mainBundle];
        v13 = [v12 localizedStringForKey:@"Move to selected item" value:0 table:0];

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1002D10D0;
        v20[3] = &unk_1014EA8D8;
        id v21 = v11;
        +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v13 actionBlock:v20];
      }
      id v14 = [v7 crlaxRepForSelecting];
      if (v14)
      {
        v15 = +[NSBundle mainBundle];
        v16 = [v15 localizedStringForKey:@"Select" value:0 table:0];

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1002D10F0;
        v17[3] = &unk_1014EA900;
        id v18 = v14;
        id v19 = v7;
        +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v16 actionBlock:v17];
      }
    }
  }
LABEL_12:
}

- (void)_crlaxAddMultiSelectionActionsToArray:(id)a3 forRep:(id)a4
{
  id v6 = a3;
  id v7 = [a4 crlaxRepForSelecting];
  if (v7)
  {
    double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectedReps];
    if ([v8 count])
    {
      if (![v7 crlaxIsSelectedIgnoringLocking])
      {
        v12 = +[NSBundle mainBundle];
        unsigned __int8 v10 = [v12 localizedStringForKey:@"Add to selection" value:0 table:0];

        v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        v15 = sub_1002D1304;
        v16 = &unk_1014EA900;
        v17 = self;
        id v18 = v7;
        double v11 = &v13;
        goto LABEL_7;
      }
      if ((unint64_t)[v8 count] >= 2)
      {
        double v9 = +[NSBundle mainBundle];
        unsigned __int8 v10 = [v9 localizedStringForKey:@"Remove from selection" value:0 table:0];

        id v19 = _NSConcreteStackBlock;
        uint64_t v20 = 3221225472;
        id v21 = sub_1002D12E0;
        v22 = &unk_1014EA900;
        v23 = self;
        v24 = v7;
        double v11 = &v19;
LABEL_7:
        +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", v6, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
}

- (void)_crlaxAddArrangeActionsToArray:(id)a3 forRep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectedReps];
  if ((unint64_t)[v8 count] >= 2)
  {
    double v9 = [v7 crlaxRepForSelecting];
    unsigned int v10 = [v8 containsObject:v9];

    if (v10)
    {
      double v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"Arrange" value:0 table:0];

      v13 = +[NSBundle mainBundle];
      v26 = [v13 localizedStringForKey:@"Align left edges to leftmost edge" value:0 table:0];

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1002D1820;
      v33[3] = &unk_1014EA8D8;
      v33[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v26 categoryName:v12 actionBlock:v33];
      uint64_t v14 = +[NSBundle mainBundle];
      v25 = [v14 localizedStringForKey:@"Align to horizontal center" value:0 table:0];

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1002D1840;
      v32[3] = &unk_1014EA8D8;
      v32[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v25 categoryName:v12 actionBlock:v32];
      v15 = +[NSBundle mainBundle];
      v24 = [v15 localizedStringForKey:@"Align right edges to rightmost edge" value:0 table:0];

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1002D1860;
      v31[3] = &unk_1014EA8D8;
      v31[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v24 categoryName:v12 actionBlock:v31];
      v16 = +[NSBundle mainBundle];
      v23 = [v16 localizedStringForKey:@"Align top edges to topmost edge" value:0 table:0];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1002D1880;
      v30[3] = &unk_1014EA8D8;
      v30[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v23 categoryName:v12 actionBlock:v30];
      v17 = +[NSBundle mainBundle];
      v22 = [v17 localizedStringForKey:@"Align to vertical center" value:0 table:0];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1002D18A0;
      v29[3] = &unk_1014EA8D8;
      v29[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v22 categoryName:v12 actionBlock:v29];
      id v18 = +[NSBundle mainBundle];
      id v19 = [v18 localizedStringForKey:@"Align bottom edges to bottommost edge" value:0 table:0];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1002D18C0;
      v28[3] = &unk_1014EA8D8;
      v28[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v19 categoryName:v12 actionBlock:v28];
      uint64_t v20 = +[NSBundle mainBundle];
      id v21 = [v20 localizedStringForKey:@"Go to arrange inspector" value:0 table:0];

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1002D18E0;
      v27[3] = &unk_1014EA8D8;
      v27[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v6 withName:v21 categoryName:v12 actionBlock:v27];
    }
  }
}

- (void)_crlaxUpdateSelectionWithRep:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v6 = [v4 crlaxTarget];

  [v5 updateSelectionForInteractionWithRep:v6 extendingSelection:1];

  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxAnnounceSelectedElementCount];
}

- (void)_crlaxAnnounceSelectedElementCount
{
  v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectedReps];
  id v4 = [v3 count];

  CRLAccessibilityStringsDictKey(@"multiselection.elements.selected.announcement");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v4);
  id v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  CRLAccessibilityPostAnnouncementNotification(v6, v5);
}

- (void)_crlaxAlignSelectionToLeft
{
}

- (void)_crlaxAlignSelectionToCenter
{
}

- (void)_crlaxAlignSelectionToRight
{
}

- (void)_crlaxAlignSelectionToTop
{
}

- (void)_crlaxAlignSelectionToMiddle
{
}

- (void)_crlaxAlignSelectionToBottom
{
}

- (void)_crlaxAlignSelectionToEdge:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasEditor];
  __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLCanvasEditor, v4, 0, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [v6 canvasEditorHelper];
  [v5 alignDrawablesByEdge:v3];
}

- (void)_crlaxGoToArrange
{
}

- (id)_crlaxTopLevelInspectorViewControllers
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  uint64_t v5 = [v4 crlaxValueForKey:@"topLevelInspectorViewControllers"];
  id v6 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v5, 0, 0);

  return v6;
}

- (void)crlaxCollaboratorDeletedMySelection
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Participant deleted selection" value:0 table:0];

  CRLAccessibilityPostHighPriorityAnnouncementNotification(0, v3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)crlaxWillSelectRep:(id)a3
{
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasViewController];
  unsigned int v5 = [v4 crlaxIsInEyeDropperMode];

  if (v5)
  {
    id v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasViewController];
    [v6 crlaxCancelEyeDropperMode];
  }
}

- (BOOL)crlaxKnobElementIsAccessibilityElement:(id)a3
{
  return [a3 isAccessibilityElement];
}

- (NSArray)crlaxCustomRotors
{
  id v3 = +[NSMutableArray array];
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCommentsRotor];
  [v3 addObject:v4];

  unsigned int v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxHighlightsRotor];
  [v3 addObject:v5];

  id v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectedReps];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxNearbyElementsRotor];
    [v3 addObject:v8];
  }

  return (NSArray *)v3;
}

- (UIAccessibilityCustomRotor)crlaxTrackedChangesRotor
{
  id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredTrackedChangesRotor];
  if (!v3)
  {
    id v4 = +[NSBundle mainBundle];
    unsigned int v5 = [v4 localizedStringForKey:@"Tracked Changes" value:0 table:0];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002D1ED0;
    v9[3] = &unk_1014E7940;
    objc_copyWeak(&v11, &location);
    id v6 = v5;
    id v10 = v6;
    id v7 = objc_retainBlock(v9);
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:v6 itemSearchBlock:v7];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxCommentsRotor
{
  id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredCommentsRotor];
  if (!v3)
  {
    id v4 = +[NSBundle mainBundle];
    unsigned int v5 = [v4 localizedStringForKey:@"Comments" value:0 table:0];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002D2098;
    v9[3] = &unk_1014E7940;
    objc_copyWeak(&v11, &location);
    id v6 = v5;
    id v10 = v6;
    id v7 = objc_retainBlock(v9);
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:v6 itemSearchBlock:v7];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxHighlightsRotor
{
  id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredHighlightsRotor];
  if (!v3)
  {
    id v4 = +[NSBundle mainBundle];
    unsigned int v5 = [v4 localizedStringForKey:@"Highlights" value:0 table:0];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002D2260;
    v9[3] = &unk_1014E7940;
    objc_copyWeak(&v11, &location);
    id v6 = v5;
    id v10 = v6;
    id v7 = objc_retainBlock(v9);
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:v6 itemSearchBlock:v7];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxNearbyElementsRotor
{
  id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredNearbyElementsRotor];
  if (!v3)
  {
    id v4 = +[NSBundle mainBundle];
    unsigned int v5 = [v4 localizedStringForKey:@"Nearby Elements" value:0 table:0];

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002D2488;
    v12[3] = &unk_1014E7940;
    objc_copyWeak(&v14, &location);
    id v6 = v5;
    id v13 = v6;
    id v7 = objc_retainBlock(v12);
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:v6 itemSearchBlock:v7];
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredNearbyElementsRotor:v3];
    double v8 = [CRLNearbyElementRotorSearchController alloc];
    double v9 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    id v10 = [(CRLRotorSearchController *)v8 initWithInteractiveCanvasController:v9];
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredNearbyElementsRotorSearchController:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (id)crlaxCustomRotorResultForRotorName:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _rotorForName:a3];
  double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCustomRotorResultForRotor:v7 predicate:v6];

  return v8;
}

- (id)crlaxCustomRotorResultForRotor:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxCurrentSearchReferenceForRotor:v6];
  id v9 = [v7 searchDirection];

  id v10 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxResultSearchReferenceForRotor:v6 fromSearchReference:v8 inDirection:v9];
  if (v10)
  {
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxScrollAndAnnounceSearchReference:v10 forRotor:v6];
    id v11 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxFocusElementFromSearchReference:v10];
    v12 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxFocusTextRangeFromSearchReference:v10];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v11);
    id v13 = [objc_alloc((Class)UIAccessibilityCustomRotorItemResult) initWithTargetElement:v11 targetRange:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_crlaxCurrentSearchReferenceForRotor:(id)a3
{
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRotorSearchControllerForRotor:a3];
  if ([v4 shouldChangeSelectionPath])
  {
    unsigned int v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    id v6 = [v5 editorController];
    id v7 = [v6 selectionPath];
    double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSearchReferenceForSelectionPath:v7];
  }
  else
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = +[CRLAccessibility currentlyFocusedElement];
    unsigned int v5 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v10, 0, 0);

    id v6 = [v5 repForSelecting];
    id v11 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    v12 = [v11 canvasEditor];
    id v13 = [v6 info];
    id v7 = [v12 selectionPathWithInfo:v13];

    double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSearchReferenceForSelectionPath:v7];
    id v14 = [v6 layout];
    [v14 alignmentFrameInRoot];
    [v8 setSearchReferenceLayoutFrame:];
  }

  return v8;
}

- (id)crlaxSearchReferenceForSelectionPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 orderedSelections];
  unsigned int v5 = [v4 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 boardItems];
    id v7 = [v6 anyObject];

    if (v7)
    {
      double v8 = +[CRLCanvasSearchReference searchReferenceWithBoardItem:v7 selectionPath:v3];
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)crlaxRotorSearchControllerForRotor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTrackedChangesRotor];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredTrackedChangesRotorSearchController];
LABEL_9:
    id v14 = (void *)v7;
    goto LABEL_10;
  }
  double v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCommentsRotor];
  unsigned int v9 = [v4 isEqual:v8];

  if (v9)
  {
    uint64_t v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredCommentsRotorSearchController];
    goto LABEL_9;
  }
  id v10 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxHighlightsRotor];
  unsigned int v11 = [v4 isEqual:v10];

  if (v11)
  {
    uint64_t v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredHighlightsRotorSearchController];
    goto LABEL_9;
  }
  v12 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxNearbyElementsRotor];
  unsigned int v13 = [v4 isEqual:v12];

  if (v13)
  {
    uint64_t v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredNearbyElementsRotorSearchController];
    goto LABEL_9;
  }
  id v14 = 0;
LABEL_10:

  return v14;
}

- (id)crlaxResultSearchReferenceForRotor:(id)a3 fromSearchReference:(id)a4 inDirection:(int64_t)a5
{
  id v8 = a4;
  unsigned int v9 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRotorSearchControllerForRotor:a3];
  id v10 = [v9 searchReferenceAfterReference:v8 inRotorDirection:a5];

  return v10;
}

- (id)crlaxFocusTextRangeFromSearchReference:(id)a3
{
  return 0;
}

- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTrackedChangesRotor];
  if ([v6 isEqual:v7]) {
    goto LABEL_4;
  }
  id v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCommentsRotor];
  if ([v6 isEqual:v8])
  {

LABEL_4:
LABEL_5:
    v15 = __CRLAccessibilityStringForVariables(1, 0, v9, v10, v11, v12, v13, v14, 0);
    id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v15];
    if (![0 length])
    {
LABEL_8:
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v16);

      goto LABEL_9;
    }
    v17 = v15;
    id v18 = 0;
LABEL_7:
    id v19 = [v17 rangeOfString:v18];
    [v16 addAttribute:@"UIAccessibilityTokenLowPitch" value:&__kCFBooleanTrue range:v19, v20];
    goto LABEL_8;
  }
  id v21 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxHighlightsRotor];
  unsigned __int8 v22 = [v6 isEqual:v21];

  if (v22) {
    goto LABEL_5;
  }
  v23 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxNearbyElementsRotor];
  unsigned int v24 = [v6 isEqual:v23];

  if (v24)
  {
    v25 = (objc_class *)objc_opt_class();
    v26 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxStoredNearbyElementsRotorSearchController];
    v27 = __CRLAccessibilityCastAsClass(v25, (uint64_t)v26, 0, 0);
    v15 = [v27 nearbyDescriptionForSearchReference:v28];

    id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v15];
    if (![v15 length]) {
      goto LABEL_8;
    }
    v17 = v15;
    id v18 = v15;
    goto LABEL_7;
  }
LABEL_9:
}

- (id)_rotorForName:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCustomRotors];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_crlaxScrollAndAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  [v8 scrollSearchReferenceToVisible:v6 scrollOptions:8];
  uint64_t v9 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRotorSearchControllerForRotor:v7];
  unsigned int v10 = [v9 shouldChangeSelectionPath];

  if (v10)
  {
    unsigned __int8 v11 = [v8 editorController];
    uint64_t v12 = [v6 selectionPath];
    [v11 setSelectionPath:v12 withFlags:0];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002D2F68;
  v15[3] = &unk_1014CBE50;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v15, 2.0);
}

- (id)crlaxRepForSearchReference:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v6 = [v4 selectionPath];
  id v7 = [v5 infosForSelectionPath:v6];

  if (![v7 count])
  {
    uint64_t v9 = [v4 infoForSelectionPath];
    unsigned int v10 = (objc_class *)objc_opt_class();
    id v8 = sub_100246E2C(v9, v10, 1, v11, v12, v13, v14, v15, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

    if (v8) {
      goto LABEL_6;
    }
LABEL_8:
    id v17 = 0;
    goto LABEL_9;
  }
  if ([v7 count] != (id)1)
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v8 = [v7 anyObject];
  if (!v8) {
    goto LABEL_8;
  }
LABEL_6:
  id v16 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v17 = [v16 repForInfo:v8 createIfNeeded:1];

LABEL_9:
  id v18 = v17;

  return v18;
}

- (BOOL)_crlaxElementSupportsChangeTracking:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  unsigned int v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  if (v5) {
    unsigned __int8 v6 = [v5 crlaxSupportsChangeTracking];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)crlaxTargetClassName
{
  return @"CRLInteractiveCanvasController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  unsigned int v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (NSMutableSet)_crlaxCollaborationModifiers
{
  return (NSMutableSet *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9A20);
}

- (void)_crlaxSetCollaborationModifiers:(id)a3
{
}

- (CRLAccessibilityTimer)_crlaxCollaborationOccurredTimer
{
  return (CRLAccessibilityTimer *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9A21);
}

- (void)_crlaxSetCollaborationOccurredTimer:(id)a3
{
}

- (NSTimer)_crlaxSelectionAnnouncementTimer
{
  return (NSTimer *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9A22);
}

- (void)_crlaxSetSelectionAnnouncmentTimer:(id)a3
{
}

- (BOOL)_crlaxIsObservingRemoteCommands
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9A23);
}

- (void)_crlaxSetIsObservingRemoteCommands:(BOOL)a3
{
}

- (BOOL)_crlaxIsTearingDown
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9A24);
}

- (void)_crlaxSetIsTearingDown:(BOOL)a3
{
}

- (id)crlaxDelegate
{
  return [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxValueForKey:@"delegate"];
}

- (id)crlaxCollaboratorCursorDelegate
{
  return [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxValueForKey:@"collaboratorCursorDelegate"];
}

- (BOOL)crlaxShapeRepsAreIgnored
{
  return 0;
}

- (CRLCanvasViewAccessibility)crlaxCanvasView
{
  char v8 = 0;
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 canvasView];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned __int8 v6 = (void *)v5;

  return (CRLCanvasViewAccessibility *)v6;
}

- (CRLCanvasAccessibility)crlaxCanvas
{
  char v8 = 0;
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 canvas];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned __int8 v6 = (void *)v5;

  return (CRLCanvasAccessibility *)v6;
}

- (CRLEditorControllerAccessibility)crlaxEditorController
{
  char v8 = 0;
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 editorController];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned __int8 v6 = (void *)v5;

  return (CRLEditorControllerAccessibility *)v6;
}

- (id)crlaxCanvasEditor
{
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxValueForKey:@"canvasEditor"];
  id v3 = NSProtocolFromString(@"CRLCanvasEditor");
  if (([v2 conformsToProtocol:v3] & 1) == 0)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Object doesn't conform to CRLCanvasEditor protocol!", v5, v6, v7, v8, v9, v11))abort(); {
    }
      }

    v2 = 0;
  }

  return v2;
}

- (CRLKeyboardMovementManipulatorAccessibility)crlaxKeyboardMovementManipulator
{
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasEditor];
  id v3 = [v2 crlaxValueForKey:@"canvasEditorHelper"];

  char v9 = 0;
  id v4 = [v3 crlaxValueForKey:@"keyboardMovementManipulator"];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v9);
  if (v9) {
    abort();
  }
  uint64_t v7 = (void *)v6;

  return (CRLKeyboardMovementManipulatorAccessibility *)v7;
}

- (NSArray)crlaxTopLevelRepsForHitTesting
{
  if ([(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxValueForKey:@"topLevelRepsForHitTesting"];
  }

  return (NSArray *)v3;
}

- (NSSet)crlaxSelectedReps
{
  id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasEditor];
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSelectedRepsInCanvasEditor:v3 preferExplicitlyFocusedReps:0];

  return (NSSet *)v4;
}

- (CRLCanvasRepAccessibility)crlaxFirstSelectedRep
{
  id v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasEditor];
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxFirstSelectedRepInCanvasEditor:v3 preferExplicitlyFocusedReps:0];

  return (CRLCanvasRepAccessibility *)v4;
}

- (CRLSubselectionAccessibility)crlaxCanvasSelection
{
  char v8 = 0;
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasEditor];
  id v3 = [v2 crlaxValueForKey:@"canvasSelection"];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLSubselectionAccessibility *)v6;
}

- (BOOL)crlaxCurrentlyWaitingOnThreadedLayoutAndRender
{
  return 0;
}

- (id)_crlaxSelectedRepsInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  BOOL v42 = a4;
  id v5 = a3;
  char v54 = 0;
  uint64_t v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  uint64_t v7 = [v6 selectionModelTranslator];
  v41 = self;
  char v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxEditorController];
  char v9 = [v8 crlaxSelectionPath];
  unsigned int v10 = [v9 crlaxTarget];
  uint64_t v11 = [v7 boardItemsForSelectionPath:v10];

  uint64_t v12 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, v11, 1, &v54);
  if (v54) {
LABEL_38:
  }
    abort();
  uint64_t v13 = (void *)v12;
  v39 = v5;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v15)
  {
    id v17 = 0;
    goto LABEL_35;
  }
  id v16 = v15;
  id v17 = 0;
  uint64_t v18 = *(void *)v51;
  BOOL v19 = v42;
  uint64_t v20 = v41;
  uint64_t v44 = *(void *)v51;
  id v40 = v14;
  do
  {
    id v21 = 0;
    id v45 = v16;
    do
    {
      if (*(void *)v51 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v22 = *(void *)(*((void *)&v50 + 1) + 8 * (void)v21);
      if (!v19) {
        goto LABEL_27;
      }
      v23 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)v20 crlaxRepsForInfo:*(void *)(*((void *)&v50 + 1) + 8 * (void)v21)];
      id v24 = [v23 count];
      if (v24 == (id)1)
      {
        char v54 = 0;
        v25 = [v23 anyObject];
        v26 = objc_opt_class();
        uint64_t v27 = __CRLAccessibilityCastAsSafeCategory(v26, (uint64_t)v25, 1, &v54);
        if (v54) {
          goto LABEL_38;
        }
        id v28 = (void *)v27;
      }
      else
      {
        if (!v24)
        {

          id v16 = v45;
LABEL_27:
          id v28 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)v20 crlaxRepForInfo:v22];
          if (!v28) {
            goto LABEL_31;
          }
          goto LABEL_28;
        }
        v43 = v17;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v29 = v23;
        id v30 = [v29 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v47;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v47 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              char v54 = 0;
              id v35 = v34;
              v36 = objc_opt_class();
              uint64_t v37 = __CRLAccessibilityCastAsSafeCategory(v36, (uint64_t)v35, 1, &v54);
              if (v54) {
                goto LABEL_38;
              }
              id v28 = (void *)v37;

              if ([v28 crlaxWasExplicitlyFocused]) {
                goto LABEL_23;
              }
            }
            id v31 = [v29 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v31);
          id v28 = 0;
LABEL_23:
          BOOL v19 = v42;
          id v14 = v40;
          uint64_t v20 = v41;
        }
        else
        {
          id v28 = 0;
        }

        id v17 = v43;
      }
      uint64_t v18 = v44;

      id v16 = v45;
      if (!v28) {
        goto LABEL_27;
      }
LABEL_28:
      if (!v17)
      {
        id v17 = +[NSMutableSet set];
      }
      [v17 addObject:v28];

LABEL_31:
      id v21 = (char *)v21 + 1;
    }
    while (v21 != v16);
    id v16 = [v14 countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v16);
LABEL_35:

  return v17;
}

- (id)_crlaxFirstSelectedRepInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSelectedRepsInCanvasEditor:a3 preferExplicitlyFocusedReps:a4];
  if ([v4 count])
  {
    id v5 = [v4 allObjects];
    uint64_t v6 = [v5 sortedArrayUsingComparator:&stru_1014F60C8];

    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (CRLCanvasRepAccessibility)crlaxFocusedRep
{
  uint64_t v41 = 0;
  BOOL v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = sub_1003CF024;
  id v45 = sub_1003CF034;
  id v46 = 0;
  id v3 = &OBJC_PROTOCOL___CRLCanvasEditor;
  id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxEditorController];
  id v5 = [v4 crlaxCurrentEditors];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1003CF03C;
  v37[3] = &unk_1014F60F0;
  id v40 = &v41;
  uint64_t v6 = v3;
  v38 = v6;
  v39 = self;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v37];
  id v7 = v42[5];
  if (!v7)
  {
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxInfosForCurrentSelectionPath];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 countByEnumeratingWithState:&v33 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v34;
      do
      {
        uint64_t v11 = 0;
        id v27 = v9;
        do
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRepsForInfo:](self, "crlaxRepsForInfo:", *(void *)(*((void *)&v33 + 1) + 8 * v11), v27);
          uint64_t v28 = v11;
          uint64_t v13 = v6;
          id v14 = v5;
          id v15 = v8;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v16 = v12;
          id v17 = [v16 countByEnumeratingWithState:&v29 objects:v47 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v30;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                if ([v20 crlaxWasExplicitlyFocused])
                {
                  objc_storeStrong(v42 + 5, v20);
                  id v8 = v15;
                  id v5 = v14;
                  uint64_t v6 = v13;

                  goto LABEL_19;
                }
              }
              id v17 = [v16 countByEnumeratingWithState:&v29 objects:v47 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v8 = v15;
          id v5 = v14;
          uint64_t v6 = v13;

          uint64_t v11 = v28 + 1;
        }
        while ((id)(v28 + 1) != v27);
        id v9 = [v8 countByEnumeratingWithState:&v33 objects:v48 count:16];
      }
      while (v9);
    }
LABEL_19:

    id v7 = v42[5];
    if (!v7)
    {
      id v21 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxInfosForCurrentSelectionPath];
      uint64_t v22 = [v21 anyObject];
      uint64_t v23 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRepForInfo:v22];
      id v24 = v42[5];
      v42[5] = (id)v23;

      id v7 = v42[5];
    }
  }
  id v25 = v7;

  _Block_object_dispose(&v41, 8);

  return (CRLCanvasRepAccessibility *)v25;
}

- (NSArray)crlaxFilteredTopLevelReps
{
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvas];
  id v3 = [v2 crlaxTopLevelReps];

  return (NSArray *)v3;
}

- (BOOL)crlaxDocumentIsSharedReadOnly
{
  v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 documentIsSharedReadOnly];

  return v3;
}

- (BOOL)crlaxAllowsCaptionEditing
{
  return 0;
}

- (BOOL)crlaxShouldLabelCanvas
{
  return 1;
}

- (CGPoint)crlaxConvertBoundsToUnscaledPoint:(CGPoint)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003CF2B0;
  v7[3] = &unk_1014D3490;
  v7[4] = self;
  v7[5] = &v9;
  CGPoint v8 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v10[4];
  double v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v5 = v3;
  double v6 = v4;
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGRect)crlaxConvertBoundsToUnscaledRect:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  id v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003CF3E8;
  v11[3] = &unk_1014F6118;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGPoint)crlaxConvertUnscaledToBoundsPoint:(CGPoint)a3
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  CGRect v12 = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003CF50C;
  v7[3] = &unk_1014D3490;
  v7[4] = self;
  v7[5] = &v9;
  CGPoint v8 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v10[4];
  double v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v5 = v3;
  double v6 = v4;
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGRect)crlaxConvertUnscaledToBoundsRect:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  id v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003CF644;
  v11[3] = &unk_1014F6118;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (id)crlaxRepForInfo:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    double v5 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = sub_1003CF024;
    long long v18 = sub_1003CF034;
    id v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003CF814;
    v11[3] = &unk_1014CEE50;
    uint64_t v13 = &v14;
    v11[4] = self;
    id v12 = v4;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
      abort();
    }

    id v6 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    LOBYTE(v14) = 0;
    id v7 = v6;
    double v8 = objc_opt_class();
    uint64_t v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 1, &v14);
    if ((_BYTE)v14) {
      abort();
    }
    double v5 = (void *)v9;
  }

  return v5;
}

- (id)crlaxRepsForInfo:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    double v5 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = sub_1003CF024;
    long long v18 = sub_1003CF034;
    id v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003CF9F4;
    v11[3] = &unk_1014CEE50;
    uint64_t v13 = &v14;
    v11[4] = self;
    id v12 = v4;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
      abort();
    }

    id v6 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    LOBYTE(v14) = 0;
    id v7 = v6;
    double v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v7, 1, &v14);
    if ((_BYTE)v14) {
      abort();
    }
    double v5 = (void *)v9;
  }

  return v5;
}

- (id)crlaxRepForLayout:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1003CF024;
  long long v17 = sub_1003CF034;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003CFBC0;
  v10[3] = &unk_1014CEE50;
  id v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10)) {
    abort();
  }

  id v4 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  id v5 = v4;
  id v6 = objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v13);
  if ((_BYTE)v13) {
    abort();
  }
  double v8 = (void *)v7;

  return v8;
}

- (id)crlaxHitTestWithUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v29 = 0;
  id v28 = 0;
  id v6 = -[CRLCanvasInteractiveCanvasControllerAccessibility hitKnobAtPoint:inputType:returningRep:](self, "hitKnobAtPoint:inputType:returningRep:", 1, &v28);
  id v7 = v28;
  double v8 = objc_opt_class();
  uint64_t v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v29);
  if (v29) {
    goto LABEL_21;
  }
  double v10 = (void *)v9;

  if (!v10)
  {
LABEL_14:
    if (objc_opt_respondsToSelector()) {
      -[CRLCanvasInteractiveCanvasControllerAccessibility hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y);
    }
    else {
    uint64_t v20 = -[CRLCanvasInteractiveCanvasControllerAccessibility hitRep:](self, "hitRep:", x, y);
    }
    goto LABEL_18;
  }
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (!v7)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"A knob was hit, but no rep returned!", v12, v13, v14, v15, v16, (uint64_t)v28))goto LABEL_21; {
    }
      }
  }
  id v17 = [v10 crlaxKnobTag];
  id v18 = [v10 crlaxNodeIndex];
  id v19 = [v10 crlaxIdentifier];
  uint64_t v20 = [v7 crlaxKnobElementForTag:v17 index:v18 identifier:v19];

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (!v20)
    {
      int v21 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(v21, 0, @"Knob element not found!", v22, v23, v24, v25, v26, (uint64_t)v28))LABEL_21:abort(); {
    }
      }
  }
  if (![(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRespondsToSelector:"crlaxKnobElementIsAccessibilityElement:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasInteractiveCanvasControllerAccessibilityExtras]|| ![(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxKnobElementIsAccessibilityElement:v20])
  {

    goto LABEL_14;
  }
  if (!v20) {
    goto LABEL_14;
  }
LABEL_18:

  return v20;
}

- (void)crlaxSelectRep:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectReps:](self, "crlaxSelectReps:", v5, v6);
  }
}

- (void)crlaxAddRepToSelection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectedReps];
    if (([v5 containsObject:v8] & 1) == 0)
    {
      id v6 = [v5 allObjects];
      id v7 = [v6 arrayByAddingObject:v8];
      [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectReps:v7];
    }
    id v4 = v8;
  }
}

- (void)crlaxSelectReps:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = __CRLAccessibilityCastAsSafeCategory(v12, v11, 0, 0);
        if ([v13 crlaxIsSelectable])
        {
          uint64_t v14 = [v13 crlaxTarget];
          uint64_t v15 = [v14 info];

          if (v15)
          {
            [v4 addObject:v15];
            if (!v8) {
              id v8 = v13;
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  if ([v4 count])
  {
    if ([(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRespondsToSelector:"crlaxWillSelectRep:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasInteractiveCanvasControllerAccessibilityExtras])[(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxWillSelectRep:v8]; {
    uint64_t v16 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectionPathWithInfos:v4];
    }
    id v17 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxEditorController];
    [v17 crlaxSetSelectionPath:v16];

    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxDidFocusRep:v8];
  }
}

- (void)crlaxSelectReps:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  long long v22 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = __CRLAccessibilityCastAsSafeCategory(v13, v12, 0, 0);
        uint64_t v15 = v14;
        if (v4)
        {
          uint64_t v16 = [v14 crlaxTarget];
          id v17 = [v16 info];

          if (v17)
          {
            [v22 addObject:v17];
            if (!v9) {
              id v9 = v15;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  if ([v22 count])
  {
    id v18 = self;
    if ([(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRespondsToSelector:"crlaxWillSelectRep:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasInteractiveCanvasControllerAccessibilityExtras])[(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxWillSelectRep:v9]; {
    long long v19 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectionPathWithInfos:](self, "crlaxSelectionPathWithInfos:", v22, self);
    }
    long long v20 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)v18 crlaxEditorController];
    [v20 crlaxSetSelectionPath:v19];

    [(CRLCanvasInteractiveCanvasControllerAccessibility *)v18 crlaxDidFocusRep:v9];
  }
}

- (id)crlaxSelectionPathWithInfo:(id)a3
{
  BOOL v4 = +[NSSet setWithObject:a3];
  id v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxSelectionPathWithInfos:v4];

  return v5;
}

- (id)crlaxSelectionPathWithInfos:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1003CF024;
  id v17 = sub_1003CF034;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003D0528;
  v10[3] = &unk_1014CEE50;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10)) {
    abort();
  }

  id v4 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  id v5 = v4;
  id v6 = objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v13);
  if ((_BYTE)v13) {
    abort();
  }
  id v8 = (void *)v7;

  return v8;
}

- (void)crlaxDidFocusRep:(id)a3
{
  id v4 = a3;
  id v5 = [v4 crlaxInfo];
  if (v5)
  {
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRepsForInfo:v5];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
          char v16 = 0;
          id v12 = v11;
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v12, 1, &v16);
          if (v16) {
            abort();
          }
          uint64_t v15 = (void *)v14;

          [v15 crlaxSetWasExplicitlyFocused:[v15 isEqual:v4]];
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (id)crlaxInfosForSelectionPath:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_1003CF024;
  long long v17 = sub_1003CF034;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003D0898;
  v10[3] = &unk_1014CEE50;
  id v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10)) {
    abort();
  }

  id v4 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  id v5 = v4;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v13);
  if ((_BYTE)v13) {
    abort();
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)crlaxInfosForCurrentSelectionPath
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1003CF024;
  uint64_t v13 = sub_1003CF034;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003D0A38;
  v8[3] = &unk_1014CB090;
  v8[4] = self;
  v8[5] = &v9;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  id v2 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  LOBYTE(v9) = 0;
  id v3 = v2;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v9);
  if ((_BYTE)v9) {
    abort();
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)crlaxLayoutsForSelectionPath:(id)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_1003CF024;
  long long v17 = sub_1003CF034;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003D0C00;
  v10[3] = &unk_1014CEE50;
  id v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10)) {
    abort();
  }

  id v4 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  id v5 = v4;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v13);
  if ((_BYTE)v13) {
    abort();
  }
  id v8 = (void *)v7;

  return v8;
}

- (void)crlaxScrollCurrentSelectionToVisible
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003D0CC4;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (BOOL)crlaxScrollLayoutToVisibleAndFocusTheAssociatedRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v6 = [v5 canvasEditor];
  uint64_t v7 = [v4 crlaxTarget];
  id v8 = [v7 info];
  uint64_t v9 = [v6 selectionPathWithInfo:v8];

  uint64_t v10 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  [v10 scrollToSelectionPath:v9 scrollOptions:0];

  id v11 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  [v11 layoutIfNeeded];

  id v12 = [v4 crlaxRepForLayout];
  uint64_t v13 = [v12 crlaxTarget];

  if (v13) {
    BOOL v14 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxZoomToShowRepForLayoutAndFocus:v4];
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_crlaxZoomToShowRepForLayoutAndFocus:(id)a3
{
  id v4 = [a3 crlaxRepForLayout];
  id v5 = [v4 crlaxTarget];

  if (v5)
  {
    id v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    [v6 visibleUnscaledRect];
    double v8 = v7;
    double v10 = v9;

    [v5 frameInUnscaledCanvas];
    if (v14 > v10 || v13 > v8)
    {
      double v16 = v11;
      double v17 = v12;
      if (v14 >= v10) {
        double v10 = v14;
      }
      if (v13 >= v8) {
        double v8 = v13;
      }
      id v18 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
      [v18 zoomWithAnimationToUnscaledRect:v16 withDuration:v17 withDuration:v10 withDuration:v8 withDuration:0.0];
    }
    CRLAccessibilityPostLayoutChangedNotification(v5);
  }

  return v5 != 0;
}

- (void)crlaxScrollSelectionPathToVisible:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003D0F78;
  v4[3] = &unk_1014CBE78;
  v4[4] = self;
  id v3 = a3;
  id v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

- (void)crlaxLayoutIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003D0FFC;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (BOOL)crlaxIsInFollowingMode
{
  id v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 editingCoordinator];
  id v4 = [v3 followCoordinator];
  unsigned __int8 v5 = [v4 isFollowing];

  return v5;
}

- (id)crlaxLocalizedRulerUnitsForCanvas
{
  id v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRulerUnitsInstance];
  id v3 = [v2 crlaxLocalizedCompatibleRulerUnitsForCanvas];

  return v3;
}

- (CGRect)crlaxConvertUnscaledRectToRulerUnits:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxConvertPointToRulerValue:a3.origin.x];
  double v8 = v7;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxConvertPointToRulerValue:y];
  double v10 = v9;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxConvertPointToRulerValue:width];
  double v12 = v11;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxConvertPointToRulerValue:height];
  double v14 = v13;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.double height = v14;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)crlaxDescriptionOfPointValueConvertedToRulerUnit:(double)a3
{
  unsigned __int8 v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRulerUnitsInstance];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxConvertPointToRulerValue:a3];
  double v7 = [objc_opt_class() crlaxLocalizedDescriptionForUnits:[v5 crlaxRulerUnits] value:v6];

  return v7;
}

- (id)crlaxRulerUnitsInstance
{
  [NSClassFromString(@"CRLRulerUnits") crlaxValueForKey:@"instance"];
  char v7 = 0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  unsigned __int8 v5 = (void *)v4;

  return v5;
}

- (double)_crlaxConvertPointToRulerValue:(double)a3
{
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxRulerUnitsInstance];
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003D1370;
  v9[3] = &unk_1014CC6B8;
  double v11 = &v13;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v4;
  double v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v9)) {
    abort();
  }

  double v5 = v14[3];
  _Block_object_dispose(&v13, 8);
  float v6 = v5 * 100.0;
  double v7 = (float)(roundf(v6) / 100.0);

  return v7;
}

- (id)crlaxCommentEditor
{
  id v2 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxEditorController];
  id v3 = [v2 crlaxEditorForEditAction:"addOrShowComment:" withSender:0];

  return v3;
}

- (void)addCommonObservers
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v3 addCommonObservers];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxRegisterForNotifications];
}

- (void)removeCommonObservers
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v3 removeCommonObservers];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxUnregisterForNotifications];
}

- (void)_crlaxUnregisterForNotifications
{
  if ([(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxIsObservingRemoteCommands])
  {
    objc_super v3 = +[NSNotificationCenter defaultCenter];
    id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxValueForKey:@"documentRoot"];
    [v3 removeObserver:self name:@"CRLCommandControllerReceivedIncomingCommand" object:v4];

    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetIsObservingRemoteCommands:0];
  }
}

- (void)crlaxCancelCollaborationOccurredTimer
{
  objc_super v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxCollaborationOccurredTimer];

  if (v3)
  {
    id v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxCollaborationOccurredTimer];
    [v4 cancel];

    id v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxCollaborationModifiers];
    [v5 removeAllObjects];
  }
}

- (void)_crlaxPostCollaborationOccurredSound
{
  objc_super v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxCollaborationOccurredTimer];
  if (!v3)
  {
    objc_super v3 = [[CRLAccessibilityTimer alloc] initWithTargetSerialQueue:&_dispatch_main_q];
    [(CRLAccessibilityTimer *)v3 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetCollaborationOccurredTimer:v3];
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003D16B0;
  v4[3] = &unk_1014CBE78;
  v4[4] = self;
  id v5 = 0;
  [(CRLAccessibilityTimer *)v3 afterDelay:v4 processBlock:4.0];
  CRLAccessibilityPostHighPriorityAnnouncementNotificationWithSound(0, 0, @"AXAnnouncementCollaborationOccurredSound");
}

- (void)_crlaxPostCollaborationOccurredSoundRepeatedly:(int)a3
{
  if (a3 >= 1)
  {
    block[5] = v6;
    block[6] = v5;
    block[15] = v3;
    block[16] = v4;
    int64_t v8 = 0;
    uint64_t v9 = 500000000 * a3;
    do
    {
      dispatch_time_t v10 = dispatch_time(0, v8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003D18BC;
      block[3] = &unk_1014CBBB0;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
      v8 += 500000000;
    }
    while (v9 != v8);
  }
}

- (void)collaboratorCursorSelectionPathChangedFromSelectionPath:(id)a3 toSelectionPath:(id)a4 collaboratorPresence:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v46 collaboratorCursorSelectionPathChangedFromSelectionPath:v8 toSelectionPath:v9 collaboratorPresence:v10];
  double v11 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  double v12 = [v11 infoForSelectionPath:v9];

  if (v12)
  {
    char v45 = 0;
    uint64_t v13 = +[CRLAccessibility currentlyFocusedElement];
    double v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = __CRLAccessibilityCastAsClass(v14, (uint64_t)v13, 1, &v45);
    if (!v45)
    {
      uint64_t v16 = (void *)v15;

      uint64_t v44 = v16;
      double v17 = [v16 repForSelecting];
      id v18 = [v17 info];

      char v45 = 0;
      id v19 = v17;
      long long v20 = objc_opt_class();
      uint64_t v21 = __CRLAccessibilityCastAsSafeCategory(v20, (uint64_t)v19, 1, &v45);
      if (!v45)
      {
        long long v22 = (void *)v21;

        uint64_t v43 = v22;
        long long v23 = [v22 crlaxContainedRep];
        long long v24 = [v23 crlaxTarget];
        long long v25 = [v24 info];

        if (v12 == v18)
        {
          [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxPostCollaborationOccurredSound];
LABEL_21:
          long long v26 = v44;
          goto LABEL_22;
        }
        if (v12 == v25)
        {
          id v40 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
          uint64_t v41 = [v40 infoForSelectionPath:v8];

          long long v26 = v44;
          if (v41)
          {
            BOOL v42 = [v19 info];

            if (v41 == v42) {
              [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxPostCollaborationOccurredSoundRepeatedly:2];
            }
          }

          goto LABEL_22;
        }
        long long v26 = v44;
        if (![(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxIsInFollowingMode])
        {
LABEL_22:

          goto LABEL_23;
        }
        id v27 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
        id v28 = [v27 editingCoordinator];
        char v29 = [v28 followCoordinator];
        long long v30 = [v29 accessibilityExperienceCoordinator];

        long long v31 = [v10 owner];
        long long v32 = [v30 lastFollowedParticipant];

        if (v31 != v32)
        {
LABEL_20:

          goto LABEL_21;
        }
        long long v33 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
        long long v34 = [v33 repForInfo:v12];

        if (!v34)
        {
LABEL_19:

          goto LABEL_20;
        }
        char v45 = 0;
        id v35 = v9;
        long long v36 = objc_opt_class();
        uint64_t v37 = __CRLAccessibilityCastAsSafeCategory(v36, (uint64_t)v35, 1, &v45);
        if (!v45)
        {
          v38 = (void *)v37;

          v39 = [v38 crlaxMostSpecificTextSelection];

          if (v39) {
            [v30 submitEventForEditOf:v34];
          }
          else {
            [v30 submitEventForSelectionOf:v34];
          }

          goto LABEL_19;
        }
      }
    }
    abort();
  }
LABEL_23:
}

- (void)crlaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v3 crlaxLoadAccessibilityInformation];
  if (![(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxIsTearingDown]) {
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxRegisterForNotifications];
  }
}

- (void)crlaxDeselectAll
{
  objc_super v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  uint64_t v4 = [v3 canvasEditor];
  id v5 = [v4 selectionPathWithInfos:0];

  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxDeselectWithSelectionPath:v5];
}

- (void)crlaxDeselectRep:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    id v5 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self infosForCurrentSelectionPath];
    id v6 = [v5 mutableCopy];

    double v7 = [v13 crlaxInfo];
    if (v7)
    {
      id v8 = [v13 crlaxInfo];
      [v6 removeObject:v8];

      id v9 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
      id v10 = [v9 canvasEditor];
      id v11 = [v6 copy];
      double v12 = [v10 selectionPathWithInfos:v11];

      [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxDeselectWithSelectionPath:v12];
    }

    id v4 = v13;
  }
}

- (void)_crlaxDeselectWithSelectionPath:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v5 = [v6 editorController];
  [v5 setSelectionPath:v4 withFlags:0x2000];
}

- (void)p_editorControllerSelectionPathDidChange:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v48 p_editorControllerSelectionPathDidChange:v4];
  id v5 = [v4 userInfo];
  char v47 = 0;
  id v6 = [v5 objectForKeyedSubscript:@"CRLEditorControllerOldSelectionPathKey"];
  double v7 = objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v47);
  if (v47) {
    abort();
  }
  id v9 = (void *)v8;

  uint64_t v44 = v9;
  id v10 = [v9 crlaxMostSpecificSelectionOfClass:[CRLAccessibilitySafeCategory crlaxTargetClass](CRLBoardItemSelectionAccessibility, "crlaxTargetClass")];
  id v11 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxEditorController];
  double v12 = [v11 crlaxSelectionPath];

  id v13 = v12;
  double v14 = [v12 crlaxMostSpecificSelectionOfClass:[CRLAccessibilitySafeCategory crlaxTargetClass](CRLBoardItemSelectionAccessibility, "crlaxTargetClass")];
  uint64_t v15 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  uint64_t v16 = [v15 layerHost];
  double v17 = [v16 asiOSCVC];
  unsigned int v18 = [v17 isCurrentlyInQuickSelectMode];

  if (v18 && v10 != v14)
  {
    id v19 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSelectionAnnouncementTimer];
    [v19 invalidate];

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1003D2344;
    v45[3] = &unk_1014F6140;
    v45[4] = self;
    id v20 = v14;
    id v46 = v20;
    uint64_t v21 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v45 block:2.0];
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetSelectionAnnouncmentTimer:v21];

    long long v22 = [v10 crlaxInfos];
    id v23 = [v22 mutableCopy];

    long long v24 = [v20 crlaxInfos];
    [v23 minusSet:v24];

    long long v25 = [v20 crlaxInfos];
    id v26 = [v25 mutableCopy];

    id v27 = [v10 crlaxInfos];
    [v26 minusSet:v27];

    unint64_t v28 = (unint64_t)[v23 count];
    unint64_t v29 = (unint64_t)[v26 count];
    if (!(v28 | v29))
    {
LABEL_21:

      goto LABEL_22;
    }
    id v30 = (id)v29;
    id v40 = v23;
    v39 = v13;
    long long v31 = +[NSBundle mainBundle];
    uint64_t v41 = [v31 localizedStringForKey:@"Added %@ to selection" value:0 table:0];

    long long v32 = +[NSBundle mainBundle];
    long long v33 = [v32 localizedStringForKey:@"Removed %@ from selection" value:0 table:0];

    long long v34 = +[NSBundle mainBundle];
    uint64_t v38 = [v34 localizedStringForKey:@"%@. %@." value:0 table:0];

    id v35 = +[NSBundle mainBundle];
    uint64_t v43 = [v35 localizedStringForKey:@"Selection changed" value:0 table:0];

    if (v28)
    {
      BOOL v42 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self p_sentenceUsingFormat:v33 toDescribeRepSelectionOrDeltaWith:v40];
    }
    else
    {
      BOOL v42 = 0;
    }
    id v13 = v39;
    if (v30)
    {
      id v30 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self p_sentenceUsingFormat:v41 toDescribeRepSelectionOrDeltaWith:v26];
      id v36 = v43;
      if (v28)
      {
        if (v42)
        {
          uint64_t v37 = (void *)v38;
          if (v30)
          {
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v42, v30);
            id v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else if (v30)
      {
        id v30 = v30;
        id v36 = v30;
        uint64_t v37 = (void *)v38;
        goto LABEL_18;
      }
    }
    else
    {
      id v36 = v43;
      if (v28)
      {
        uint64_t v37 = (void *)v38;
        if (v42)
        {
          id v36 = v42;
          id v30 = 0;
          goto LABEL_18;
        }
LABEL_20:
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v36);

        id v23 = v40;
        goto LABEL_21;
      }
    }
    uint64_t v37 = (void *)v38;
    goto LABEL_20;
  }
LABEL_22:
}

- (id)p_sentenceUsingFormat:(id)a3 toDescribeRepSelectionOrDeltaWith:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@", ", 0, 0 value table];

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@" " value:0 table:0];

  double v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"and %@" value:0 table:0];

  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  long long v25 = sub_1003D26BC;
  id v26 = &unk_1014F6168;
  id v27 = self;
  unint64_t v29 = &v30;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v14;
  [v7 enumerateObjectsUsingBlock:&v23];
  if (*((unsigned char *)v31 + 24))
  {
    uint64_t v15 = 0;
  }
  else
  {
    if ((unint64_t)[v14 count] >= 2)
    {
      uint64_t v16 = (char *)[v14 count];
      double v17 = [v14 lastObject];
      unsigned int v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v17, v23, v24, v25, v26, v27);
      [v14 replaceObjectAtIndex:v16 - 1 withObject:v18];
    }
    if ((unint64_t)[v14 count] <= 2) {
      id v19 = v11;
    }
    else {
      id v19 = v9;
    }
    id v20 = v19;
    uint64_t v21 = [v14 componentsJoinedByString:v20];
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v21);
  }
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (void)teardown
{
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetIsTearingDown:1];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCancelCollaborationOccurredTimer];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetCollaborationOccurredTimer:0];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetCollaborationModifiers:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v3 teardown];
  [(CRLCanvasInteractiveCanvasControllerAccessibility *)self _crlaxSetIsTearingDown:0];
}

- (BOOL)crlaxCurrentSelectionContainsComment
{
  return self->_crlaxCurrentSelectionContainsComment;
}

@end