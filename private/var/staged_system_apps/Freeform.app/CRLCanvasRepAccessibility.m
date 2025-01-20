@interface CRLCanvasRepAccessibility
+ (CGPoint)crlaxCurrentRepDragOffset;
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)CRLAXJumpTextToFormatOptionsString;
+ (id)CRLAXJumpToFormatOptionsString;
+ (id)CRLAXShowFormatOptionsString;
+ (id)bidirectionalConnectionsString;
+ (id)crlaxBoardItemIDForLayout:(id)a3;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxDisambiguatedConnectionDescriptionsForSet:(id)a3;
+ (id)crlaxTargetClassName;
+ (id)disambiguatedConnectionDescriptionFormat;
+ (id)inboundConnectionsString;
+ (id)outboundConnectionsString;
+ (void)crlaxSetCurrentRepDragOffset:(CGPoint)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityTextOperationAction:(id)a3;
- (BOOL)_crlaxCanBeSelected;
- (BOOL)_crlaxCanBeSelectedWithSelectableRepReference:(id *)a3;
- (BOOL)_crlaxKeyCorrespondsToPropertyRequiringAccessToCanvas:(id)a3;
- (BOOL)_crlaxKnobElementCacheIsInvalid;
- (BOOL)_crlaxReaderModePerformCopy;
- (BOOL)_crlaxShouldPreventAccessToCanvas;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)crlaxAllowsCaptionEditing;
- (BOOL)crlaxBezierPathContainsUnscaledCanvasPoint:(CGPoint)a3;
- (BOOL)crlaxContainsCaption;
- (BOOL)crlaxContainsTitle;
- (BOOL)crlaxFullscreenPreviewFile;
- (BOOL)crlaxHasAvailableRepsForConnecting;
- (BOOL)crlaxInReadOnlyMode;
- (BOOL)crlaxIsBeingRemoved;
- (BOOL)crlaxIsCaption;
- (BOOL)crlaxIsContainedTextRep;
- (BOOL)crlaxIsDraggable;
- (BOOL)crlaxIsInDrawingMode;
- (BOOL)crlaxIsInGroup;
- (BOOL)crlaxIsLocked;
- (BOOL)crlaxIsLockedDirectly;
- (BOOL)crlaxIsReadyToLoadChildren;
- (BOOL)crlaxIsSelectable;
- (BOOL)crlaxIsSelected;
- (BOOL)crlaxIsSelectedIgnoringLocking;
- (BOOL)crlaxIsTitle;
- (BOOL)crlaxMayRotate;
- (BOOL)crlaxNeedsEditRotorMenu;
- (BOOL)crlaxNeedsFormatEditOperation;
- (BOOL)crlaxOpenURL;
- (BOOL)crlaxSelect;
- (BOOL)crlaxShouldCreateAccessibilityElementForKnob:(id)a3;
- (BOOL)crlaxShouldCreateKnobs;
- (BOOL)crlaxShouldExposeAsAttachmentToken;
- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm;
- (BOOL)crlaxSupportsChangeTracking;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)crlaxUsesAccessibilityPath;
- (BOOL)crlaxWasExplicitlyFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGAffineTransform)crlaxTransformToConvertNaturalFromLayerRelative;
- (CGPoint)accessibilityActivationPoint;
- (CGPoint)crlaxCenterInUnscaledCanvas;
- (CGPoint)crlaxConvertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)crlaxConvertNaturalPointToScreenSpace:(CGPoint)a3;
- (CGPoint)crlaxConvertNaturalPointToUnscaledCanvas:(CGPoint)a3;
- (CGRect)_crlaxFrameByKnobPositions;
- (CGRect)crlaxConvertLayerRelativeRectToNaturalRect:(CGRect)a3;
- (CGRect)crlaxConvertNaturalRectFromUnscaledCanvas:(CGRect)a3;
- (CGRect)crlaxConvertNaturalRectToScreenSpace:(CGRect)a3;
- (CGRect)crlaxConvertNaturalRectToUnscaledCanvas:(CGRect)a3;
- (CGRect)crlaxFrameInScreenSpace;
- (CGRect)crlaxFrameInUnscaledCanvas;
- (CGRect)crlaxLayerFrameInScaledCanvas;
- (CGRect)crlaxNaturalBounds;
- (CRLCanvasAccessibility)crlaxCanvas;
- (CRLCanvasElementInfo)crlaxInfo;
- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController;
- (CRLCanvasLayoutAccessibility)crlaxLayout;
- (CRLCanvasRep)crlaxRetainedTarget;
- (CRLCanvasRepAccessibility)crlaxParentRep;
- (CRLCanvasRepAccessibility)crlaxRepForSelecting;
- (CRLCanvasViewAccessibility)crlaxCanvasView;
- (CRLRepContainerAccessibilityElement)crlaxAccessibilityElement;
- (CRLiOSCanvasViewControllerAccessibility)crlaxCanvasViewController;
- (NSArray)_crlaxKnobAccessibilityElementsCache;
- (NSArray)crlaxKnobAccessibilityElements;
- (NSArray)preferredFocusEnvironments;
- (NSSet)crlaxBidirectionallyConnectedLayouts;
- (NSSet)crlaxConnectedConnectionLines;
- (NSSet)crlaxConnectedLayouts;
- (NSSet)crlaxInboundConnectedLayouts;
- (NSSet)crlaxOutboundConnectedLayouts;
- (NSSet)crlaxStrictlyInboundConnectedLayouts;
- (NSSet)crlaxStrictlyOutboundConnectedLayouts;
- (NSString)crlaxCaption;
- (NSString)crlaxCaptionLabel;
- (NSString)crlaxCollaboratorDescriptionDirect;
- (NSString)crlaxDescriptionForConnections;
- (NSString)crlaxGroupAndLockStatusString;
- (NSString)crlaxHeightDescription;
- (NSString)crlaxItemTypeDescription;
- (NSString)crlaxKnobLabel;
- (NSString)crlaxLockedHint;
- (NSString)crlaxLockedLabel;
- (NSString)crlaxRotationDescription;
- (NSString)crlaxSummaryDescription;
- (NSString)crlaxTitle;
- (NSString)crlaxTitleLabel;
- (NSString)crlaxUploadStatusDescription;
- (NSString)crlaxWidthDescription;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (double)_crlaxLastBoundsAnnouncementTime;
- (id)_accessibilityParentView;
- (id)_accessibilityTextOperations;
- (id)_adjustActionNamesForSet:(id)a3;
- (id)_crlaxAvailableRepsForConnecting;
- (id)_crlaxAvailableRepsForConnectingSorted;
- (id)_crlaxBidirectionallyConnectedLayoutsViaMultipleUnidirectionalConnectionLines;
- (id)_crlaxBidirectionallyConnectedLayoutsViaSingleBidirectionalConnectionLines;
- (id)_crlaxConnectionLinesConnectingToLayout:(id)a3 inDirection:(int)a4;
- (id)_crlaxDrawableInfo;
- (id)_crlaxDrawableInfoAccessibility;
- (id)_crlaxLayoutsConnectedByStrictlyInboundConnectionLines;
- (id)_crlaxLayoutsConnectedByStrictlyOutboundConnectionLines;
- (id)_crlaxPrimaryTextEditor;
- (id)_crlaxRepContainerElementCache;
- (id)_crlaxRepForConnectionLineMapping;
- (id)_makeNavigateToConnectedElementCustomActionsFor:(id)a3 inCategory:(id)a4 directionType:(int)a5;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)crlaxAvailableRepsForConnecting;
- (id)crlaxCompleteConnectionsCustomContent;
- (id)crlaxDescriptionOfSingleConnectionLineConnectingToLayout:(id)a3 inDirection:(int)a4;
- (id)crlaxKnobElementForTag:(unint64_t)a3 index:(unint64_t)a4 identifier:(id)a5;
- (id)crlaxKnobForTag:(unint64_t)a3 index:(unint64_t)a4 identifier:(id)a5;
- (id)crlaxLabel;
- (id)crlaxLayoutDescription;
- (id)crlaxMostDirectGroupAccessibilityDescription;
- (id)crlaxNewKnobElementForKnob:(id)a3 withIdentifier:(id)a4;
- (id)crlaxReaderModeCopyOperationTitle;
- (id)crlaxReaderModeEditOperationTitle;
- (id)crlaxReaderModeEditOperations;
- (id)crlaxUserInputLabels;
- (id)crlaxValue;
- (id)crlaxValueForKey:(id)a3;
- (id)hitRep:(CGPoint)a3;
- (unint64_t)accessibilityTraits;
- (unint64_t)clraxNumberOfBidirectionalSingleConnectionsForLayout:(id)a3;
- (unint64_t)clraxNumberOfStrictlyInboundConnectionsFromLayout:(id)a3;
- (unint64_t)clraxNumberOfStrictlyOutboundConnectionsToLayout:(id)a3;
- (void)_crlaxGoToFormatInspector;
- (void)_crlaxInvalidateKnobAccessibilityElements:(id)a3;
- (void)_crlaxRotateClockwiseByDegrees:(double)a3;
- (void)_crlaxSetKnobAccessibilityElementsCache:(id)a3;
- (void)_crlaxSetKnobElementCacheIsInvalid:(BOOL)a3;
- (void)_crlaxSetLastBoundsAnnouncementTime:(double)a3;
- (void)_crlaxSetRepContainerElementCache:(id)a3;
- (void)_crlaxSetShouldPreventAccessToCanvas:(BOOL)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)crlaxAddToSelection;
- (void)crlaxChildWillBeRemoved:(id)a3;
- (void)crlaxClearKnobAccessibilityElementCache;
- (void)crlaxDeselectAll;
- (void)crlaxDeselectRep;
- (void)crlaxDidInvalidateChildren;
- (void)crlaxLoadChildrenIntoCollection:(id)a3;
- (void)crlaxPerformExtraCleanupTasksPriorToRemovalFromCanvas;
- (void)crlaxRotateClockwise;
- (void)crlaxRotateCounterclockwise;
- (void)crlaxSetIsBeingRemoved:(BOOL)a3;
- (void)crlaxSetWasExplicitlyFocused:(BOOL)a3;
- (void)dealloc;
- (void)dynamicDragDidBegin;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)i_willBeRemoved;
- (void)invalidateKnobs;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation CRLCanvasRepAccessibility

- (id)_crlaxRepContainerElementCache
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9160);
}

- (void)_crlaxSetRepContainerElementCache:(id)a3
{
}

- (double)_crlaxLastBoundsAnnouncementTime
{
  __CRLAccessibilityGetAssociatedTimeInterval(self, &unk_1016A9161);
  return result;
}

- (void)_crlaxSetLastBoundsAnnouncementTime:(double)a3
{
}

+ (CGPoint)crlaxCurrentRepDragOffset
{
  double v2 = *(double *)&qword_1016A9168;
  double v3 = *(double *)&qword_1016A9170;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (void)crlaxSetCurrentRepDragOffset:(CGPoint)a3
{
  xmmword_1016A9168 = (__int128)a3;
}

- (BOOL)crlaxNeedsEditRotorMenu
{
  return 1;
}

- (CRLRepContainerAccessibilityElement)crlaxAccessibilityElement
{
  double v3 = [(CRLCanvasRepAccessibility *)self _crlaxRepContainerElementCache];

  if (!v3)
  {
    v4 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
    v5 = [v4 crlaxCanvasContainerView];

    if (v5)
    {
      v6 = [[CRLRepContainerAccessibilityElement alloc] initWithRep:self accessibilityParent:v5];
      [(CRLCanvasRepAccessibility *)self _crlaxSetRepContainerElementCache:v6];
    }
  }

  return (CRLRepContainerAccessibilityElement *)[(CRLCanvasRepAccessibility *)self _crlaxRepContainerElementCache];
}

- (CRLiOSCanvasViewControllerAccessibility)crlaxCanvasViewController
{
  double v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  double v3 = [v2 crlaxCanvasViewController];

  return (CRLiOSCanvasViewControllerAccessibility *)v3;
}

- (BOOL)crlaxIsInDrawingMode
{
  double v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v3 = [v2 interactiveCanvasController];
  v4 = [v3 freehandDrawingToolkit];
  unsigned __int8 v5 = [v4 isInDrawingMode];

  return v5;
}

- (BOOL)crlaxNeedsFormatEditOperation
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsSelected]
    || (BOOL v3 = [(CRLCanvasRepAccessibility *)self crlaxIsSelectedIgnoringLocking]))
  {
    LOBYTE(v3) = ![(CRLCanvasRepAccessibility *)self crlaxIsInDrawingMode];
  }
  return v3;
}

- (id)crlaxLayoutDescription
{
  BOOL v3 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  v4 = [v3 crlaxTarget];
  [v4 alignmentFrameInRoot];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  v14 = [v13 crlaxFirstSelectedRep];
  v15 = [v14 crlaxLayout];
  v16 = [v15 crlaxTarget];
  [v16 alignmentFrameInRoot];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  return +[CRLNearbyElementRotorSearchController nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:](CRLNearbyElementRotorSearchController, "nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:", v6, v8, v10, v12, v18, v20, v22, v24);
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 0;
}

- (id)accessibilityCustomRotors
{
  if ([(CRLCanvasRepAccessibility *)self crlaxSupportsPublicCustomRotors])
  {
    BOOL v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    v4 = [v3 crlaxCustomRotors];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)crlaxReaderModeCopyOperationTitle
{
  double v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Copy" value:0 table:0];

  return v3;
}

- (id)crlaxReaderModeEditOperationTitle
{
  double v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Edit" value:0 table:0];

  return v3;
}

- (id)crlaxReaderModeEditOperations
{
  BOOL v3 = [(CRLCanvasRepAccessibility *)self crlaxReaderModeCopyOperationTitle];
  v7[0] = v3;
  v4 = [(CRLCanvasRepAccessibility *)self crlaxReaderModeEditOperationTitle];
  v7[1] = v4;
  double v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (id)hitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = +[CRLAccessibility sharedInstance];
  if (![v6 needsAccessibilityElements]
    || [(CRLCanvasRepAccessibility *)self isAccessibilityElement])
  {

LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)CRLCanvasRepAccessibility;
    double v7 = -[CRLCanvasRepAccessibility hitRep:](&v10, "hitRep:", x, y);
    goto LABEL_5;
  }
  id v9 = [(CRLCanvasRepAccessibility *)self accessibilityElementCount];

  if ((uint64_t)v9 > 0) {
    goto LABEL_4;
  }
  double v7 = 0;
LABEL_5:

  return v7;
}

- (id)_accessibilityTextOperations
{
  BOOL v3 = +[NSMutableSet set];
  v4 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v5 = [v4 interactiveCanvasController];
  unsigned int v6 = [v5 documentIsSharedReadOnly];

  if (v6)
  {
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"Copy" value:0 table:0];
    [v3 addObject:v8];
  }
  else if ([(CRLCanvasRepAccessibility *)self crlaxNeedsEditRotorMenu])
  {
    v35 = +[CRLAccessibilityEditMenuController sharedController];
    id v9 = +[NSMutableArray array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v10 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    double v11 = [v10 interactiveCanvasController];
    double v12 = [v11 editorController];
    v13 = [v12 currentEditors];

    id v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            [(CRLCanvasRepAccessibility *)self accessibilityActivationPoint];
            [v18 crlaxAddContextualMenuOptionsToArray:v9];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v15);
    }

    double v19 = objc_opt_class();
    double v20 = [(CRLCanvasRepAccessibility *)self crlaxCanvasViewController];
    double v21 = __CRLAccessibilityCastAsSafeCategory(v19, (uint64_t)v20, 0, 0);

    double v22 = [v21 crlaxBasicEditMenuItemNames];
    double v23 = +[NSMutableSet setWithArray:v22];
    double v24 = +[NSSet setWithArray:v9];
    [v23 intersectSet:v24];

    v25 = [v23 allObjects];
    id v26 = [v25 mutableCopy];

    v27 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    v28 = [v27 crlaxEditMenuItemProvider];
    v29 = [v35 editMenuTitlesForItemProvider:v28];
    [v26 addObjectsFromArray:v29];

    v30 = +[NSMutableSet setWithArray:v26];
    uint64_t v31 = [(CRLCanvasRepAccessibility *)self _adjustActionNamesForSet:v30];

    BOOL v3 = (void *)v31;
  }
  v32 = [v3 allObjects];
  id v33 = [v32 copy];

  return v33;
}

- (id)_adjustActionNamesForSet:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"Front" value:0 table:0];
  unsigned int v6 = [v3 member:v5];

  if (v6)
  {
    [v3 removeObject:v6];
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"Bring To Front" value:0 table:0];
    [v3 addObject:v8];
  }
  id v9 = +[NSBundle mainBundle];
  objc_super v10 = [v9 localizedStringForKey:@"Back" value:0 table:0];
  double v11 = [v3 member:v10];

  if (v11)
  {
    [v3 removeObject:v11];
    double v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Send To Back" value:0 table:0];
    [v3 addObject:v13];
  }

  return v3;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasRepAccessibility *)self crlaxNeedsFormatEditOperation])
  {
    double v5 = +[CRLCanvasRepAccessibility CRLAXShowFormatOptionsString];
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      [(CRLCanvasRepAccessibility *)self _crlaxGoToFormatInspector];
      LOBYTE(v7) = 1;
      goto LABEL_15;
    }
  }
  if (![(CRLCanvasRepAccessibility *)self crlaxNeedsEditRotorMenu])
  {
    LOBYTE(v7) = 0;
    goto LABEL_15;
  }
  double v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Send To Back" value:0 table:0];
  unsigned int v10 = [v4 isEqualToString:v9];

  double v11 = +[NSBundle mainBundle];
  double v12 = v11;
  if (v10)
  {
    CFStringRef v13 = @"Back";
  }
  else
  {
    id v14 = [v11 localizedStringForKey:@"Bring To Front" value:0 table:0];
    unsigned int v15 = [v4 isEqualToString:v14];

    if (!v15) {
      goto LABEL_11;
    }
    double v11 = +[NSBundle mainBundle];
    double v12 = v11;
    CFStringRef v13 = @"Front";
  }
  uint64_t v16 = [v11 localizedStringForKey:v13 value:0 table:0];

  id v4 = (id)v16;
LABEL_11:
  double v17 = +[CRLAccessibilityEditMenuController sharedController];
  double v18 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  double v19 = [v18 crlaxEditMenuItemProvider];
  unsigned int v7 = [v17 performActionTitled:v4 forEditMenuProvider:v19];

  if (v7)
  {
    double v20 = [(CRLCanvasRepAccessibility *)self crlaxCanvasViewController];
    unsigned int v21 = [v20 crlaxIsInEyeDropperMode];

    if (v21)
    {
      double v22 = [(CRLCanvasRepAccessibility *)self crlaxCanvasViewController];
      [v22 crlaxCancelEyeDropperMode];
    }
  }

LABEL_15:
  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasRepAccessibility;
  unint64_t v3 = [(CRLCanvasRepAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(CRLCanvasRepAccessibility *)self crlaxIsSelectedIgnoringLocking];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityElements
{
  if ([(CRLCanvasRepAccessibility *)self isAccessibilityElement])
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [(CRLCanvasRepAccessibility *)self crlaxChildren];
  }

  return v3;
}

- (id)accessibilityContainer
{
  unint64_t v3 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  [v3 crlaxEnsureChildrenAreLoaded];

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasRepAccessibility;
  unsigned int v4 = [(CRLCanvasRepAccessibility *)&v6 accessibilityContainer];

  return v4;
}

- (id)accessibilityPath
{
  if (![(CRLCanvasRepAccessibility *)self crlaxUsesAccessibilityPath]) {
    goto LABEL_5;
  }
  if (![(CRLCanvasRepAccessibility *)self crlaxUsesParentAccessibilityPath])
  {
    UIAccessibilityTraits v5 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
    objc_super v6 = [v5 crlaxTarget];
    unsigned __int8 v7 = [v6 isInGroup];

    if ((v7 & 1) == 0)
    {
      double v8 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
      id v9 = [v8 crlaxTarget];
      unsigned int v10 = [v9 pathForClippingConnectionLines];
      id v3 = [v10 copy];

      if ([v3 isEmpty])
      {
        id v4 = 0;
      }
      else
      {
        double v11 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
        long long v40 = *(_OWORD *)&CGAffineTransformIdentity.c;
        long long v41 = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&v46.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&v46.c = v40;
        long long v39 = *(_OWORD *)&CGAffineTransformIdentity.tx;
        *(_OWORD *)&v46.tCGFloat x = v39;
        double v12 = [v11 crlaxInspectorGeometry];
        CFStringRef v13 = v12;
        if (v12)
        {
          [v12 crlaxAngleInRadians];
          *(_OWORD *)&v45.a = v41;
          *(_OWORD *)&v45.c = v40;
          *(_OWORD *)&v45.tCGFloat x = v39;
          CGAffineTransformRotate(&v46, &v45, -v14);
          CGAffineTransform v45 = v46;
          [v3 transformUsingAffineTransform:&v45];
          *(_OWORD *)&v46.a = v41;
          *(_OWORD *)&v46.c = v40;
          *(_OWORD *)&v46.tCGFloat x = v39;
          unsigned int v15 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
          uint64_t v16 = v15;
          if (!v15
            || ([v15 crlaxViewScale],
                CGAffineTransform v44 = v46,
                CGAffineTransformScale(&v45, &v44, v17, v17),
                CGAffineTransform v46 = v45,
                [v3 transformUsingAffineTransform:&v45],
                [v3 bounds],
                v19 == CGSizeZero.width)
            && v18 == CGSizeZero.height)
          {
            id v4 = 0;
          }
          else
          {
            *(_OWORD *)&v46.a = v41;
            *(_OWORD *)&v46.c = v40;
            *(_OWORD *)&v46.tCGFloat x = v39;
            double v20 = [v11 crlaxTarget];
            unsigned int v21 = v20;
            if (v20)
            {
              [v20 transform];
              double v22 = v43;
              [v21 transform];
              double v23 = v42;
            }
            else
            {
              double v23 = 0.0;
              double v22 = 0.0;
            }
            double v24 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
            [v24 crlaxScreenPointFromUnscaledCanvas:v22, v23];
            CGFloat v26 = v25;
            CGFloat v28 = v27;

            CGAffineTransform v44 = v46;
            CGAffineTransformTranslate(&v45, &v44, v26, v28);
            CGAffineTransform v46 = v45;
            [v3 transformUsingAffineTransform:&v45];
            v29 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v3 CGPath]);
            [(CRLCanvasRepAccessibility *)self accessibilityFrame];
            CGRect v49 = CGRectInset(v48, -1.0, -1.0);
            CGFloat x = v49.origin.x;
            CGFloat y = v49.origin.y;
            CGFloat width = v49.size.width;
            CGFloat height = v49.size.height;
            [v29 bounds];
            v51.origin.CGFloat x = v34;
            v51.origin.CGFloat y = v35;
            v51.size.CGFloat width = v36;
            v51.size.CGFloat height = v37;
            v50.origin.CGFloat x = x;
            v50.origin.CGFloat y = y;
            v50.size.CGFloat width = width;
            v50.size.CGFloat height = height;
            if (CGRectContainsRect(v50, v51)) {
              id v4 = v29;
            }
            else {
              id v4 = 0;
            }
          }
        }
        else
        {
          id v4 = 0;
        }
      }
      goto LABEL_23;
    }
LABEL_5:
    id v4 = 0;
    goto LABEL_24;
  }
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  id v4 = [v3 accessibilityPath];
LABEL_23:

LABEL_24:

  return v4;
}

- (BOOL)crlaxUsesAccessibilityPath
{
  return 1;
}

- (id)accessibilityHint
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  unsigned int v4 = [v3 crlaxIsInFollowingMode];

  if (v4)
  {
    UIAccessibilityTraits v5 = +[CRLFollowAccessibilityExperienceCoordinator magicTapInstruction];
  }
  else if ([(CRLCanvasRepAccessibility *)self _crlaxCanBeSelected])
  {
    objc_super v6 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    unsigned __int8 v7 = [v6 crlaxSelectedReps];
    id v8 = [v7 count];

    id v9 = +[NSBundle mainBundle];
    unsigned int v10 = v9;
    if (v8) {
      CFStringRef v11 = @"Use the actions rotor to add to selection";
    }
    else {
      CFStringRef v11 = @"Double tap to select.";
    }
    UIAccessibilityTraits v5 = [v9 localizedStringForKey:v11 value:0 table:0];
  }
  else
  {
    UIAccessibilityTraits v5 = 0;
  }
  double v12 = [(CRLCanvasRepAccessibility *)self crlaxLockedHint];
  double v19 = __CRLAccessibilityStringForVariables(1, v12, v13, v14, v15, v16, v17, v18, (uint64_t)v5);

  return v19;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  unsigned int v4 = [v3 crlaxTarget];
  UIAccessibilityTraits v5 = [v4 layerHost];
  objc_super v6 = [v5 asiOSCVC];
  unsigned __int8 v7 = [v6 isCurrentlyInQuickSelectMode];

  CGFloat MidX = -1.0;
  double MidY = -1.0;
  if ((v7 & 1) == 0)
  {
    [(CRLCanvasRepAccessibility *)self crlaxCGRectValueForKey:@"_accessibilityVisibleFrame"];
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    CGFloat MidX = CGRectGetMidX(v16);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v17);
  }
  double v14 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v14;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if ([(CRLCanvasRepAccessibility *)self _crlaxCanBeSelected]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasRepAccessibility;
  return [(CRLCanvasRepAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (BOOL)accessibilityActivate
{
  id v3 = +[CRLAccessibility sharedInstance];
  [v3 setFirstElementForUpcomingScreenChange:0];

  objc_super v4 = +[CRLAccessibility sharedInstance];
  [v4 setShouldPreventFocusingCanvasResponderElementOnScreenChange:0];

  return [(CRLCanvasRepAccessibility *)self crlaxSelect];
}

- (id)_accessibilityParentView
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasRepAccessibility;
  id v3 = [(CRLCanvasRepAccessibility *)&v5 _accessibilityParentView];
  if (!v3)
  {
    id v3 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  }

  return v3;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityCustomActions
{
  id v3 = +[NSMutableArray array];
  if ([(CRLCanvasRepAccessibility *)self isAccessibilityElement])
  {
    objc_super v4 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    objc_super v5 = [v4 crlaxActionMenuItemsForRep:self];
    [v3 addObjectsFromArray:v5];
  }
  if ([(CRLCanvasRepAccessibility *)self crlaxNeedsFormatEditOperation])
  {
    objc_super v6 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    if ([v6 crlaxIsInFollowingMode])
    {
    }
    else
    {
      unsigned int v7 = [(CRLCanvasRepAccessibility *)self crlaxIsSelectable];

      if (v7)
      {
        char v102 = 0;
        id v8 = [(CRLCanvasRepAccessibility *)self crlaxCanvasViewController];
        id v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v102);
        if (v102) {
          goto LABEL_42;
        }
        CFStringRef v11 = (void *)v10;

        double v12 = [v11 miniFormatterPresenter];
        unsigned int v13 = [v12 isPresentingMiniFormatter];

        if (v13) {
          +[CRLCanvasRepAccessibility CRLAXJumpToFormatOptionsString];
        }
        else {
        double v14 = +[CRLCanvasRepAccessibility CRLAXShowFormatOptionsString];
        }
        id v15 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v14 target:self selector:"_crlaxGoToFormatInspector"];
        [v3 addObject:v15];
      }
    }
  }
  char v102 = 0;
  CGRect v16 = [(CRLCanvasRepAccessibility *)self crlaxInfo];
  CGRect v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = __CRLAccessibilityCastAsClass(v17, (uint64_t)v16, 1, &v102);
  if (v102) {
    goto LABEL_42;
  }
  double v19 = (void *)v18;

  if ([(CRLCanvasRepAccessibility *)self crlaxIsInDrawingMode] && v19)
  {
    double v20 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    unsigned int v21 = [v20 crlaxEditorController];
    double v22 = [v21 crlaxTarget];
    double v23 = [v22 mostSpecificCurrentEditorOfClass:objc_opt_class()];

    if ([v23 crlaxShouldOfferSnapToShapeFromInfo:v19])
    {
      double v24 = [v23 snapToShapeActionName];
      double v25 = +[CRLFreehandDrawingEditor snapToShapeActionSymbolName];
      id v26 = objc_alloc((Class)UIAccessibilityCustomAction);
      double v27 = v19;
      CGFloat v28 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
      v29 = +[UIImage systemImageNamed:v25 withConfiguration:v28];
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_10017F0E4;
      v98[3] = &unk_1014DC180;
      id v99 = v24;
      id v100 = v25;
      id v101 = v23;
      id v30 = v25;
      id v31 = v24;
      id v32 = [v26 initWithName:v31 image:v29 actionHandler:v98];

      double v19 = v27;
      [v3 addObject:v32];
    }
  }
  if ([(CRLCanvasRepAccessibility *)self crlaxIsSelectable]
    && [(CRLCanvasRepAccessibility *)self crlaxIsSelected])
  {
    id v33 = objc_alloc((Class)UIAccessibilityCustomAction);
    CGFloat v34 = +[NSBundle mainBundle];
    CGFloat v35 = [v34 localizedStringForKey:@"Deselect All" value:0 table:0];
    id v36 = [v33 initWithName:v35 target:self selector:"crlaxDeselectAll"];

    [v3 addObject:v36];
  }
  if ([(CRLCanvasRepAccessibility *)self crlaxMayRotate])
  {
    id v37 = objc_alloc((Class)UIAccessibilityCustomAction);
    v91 = v19;
    long long v38 = +[NSBundle mainBundle];
    long long v39 = [v38 localizedStringForKey:@"Rotate 90 degrees clockwise" value:0 table:0];
    long long v40 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    long long v41 = +[UIImage systemImageNamed:@"rotate.right.fill" withConfiguration:v40];
    id v42 = [v37 initWithName:v39 image:v41 target:self selector:"crlaxRotateClockwise"];

    id v43 = objc_alloc((Class)UIAccessibilityCustomAction);
    CGAffineTransform v44 = +[NSBundle mainBundle];
    CGAffineTransform v45 = [v44 localizedStringForKey:@"Rotate 90 degrees counterclockwise" value:0 table:0];
    CGAffineTransform v46 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v47 = +[UIImage systemImageNamed:@"rotate.left.fill" withConfiguration:v46];
    id v48 = [v43 initWithName:v45 image:v47 target:self selector:"crlaxRotateCounterclockwise"];

    double v19 = v91;
    v104[0] = v42;
    v104[1] = v48;
    CGRect v49 = +[NSArray arrayWithObjects:v104 count:2];
    [v3 addObjectsFromArray:v49];
  }
  if (![(CRLCanvasRepAccessibility *)self crlaxIsSelectable]) {
    goto LABEL_34;
  }
  CGRect v50 = [(CRLCanvasRepAccessibility *)self crlaxInboundConnectedLayouts];
  CGRect v51 = +[CRLCanvasRepAccessibility inboundConnectionsString];
  v52 = [(CRLCanvasRepAccessibility *)self _makeNavigateToConnectedElementCustomActionsFor:v50 inCategory:v51 directionType:2];
  [v3 addObjectsFromArray:v52];

  v53 = [(CRLCanvasRepAccessibility *)self crlaxOutboundConnectedLayouts];
  v54 = +[CRLCanvasRepAccessibility outboundConnectionsString];
  v55 = [(CRLCanvasRepAccessibility *)self _makeNavigateToConnectedElementCustomActionsFor:v53 inCategory:v54 directionType:4];
  [v3 addObjectsFromArray:v55];

  char v102 = 0;
  v56 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  v57 = (objc_class *)objc_opt_class();
  v58 = __CRLAccessibilityCastAsClass(v57, (uint64_t)v56, 1, &v102);
  if (v102) {
LABEL_42:
  }
    abort();
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v59 = v58;
  id v60 = [v59 countByEnumeratingWithState:&v94 objects:v103 count:16];
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = *(void *)v95;
    do
    {
      for (i = 0; i != v61; i = (char *)i + 1)
      {
        if (*(void *)v95 != v62) {
          objc_enumerationMutation(v59);
        }
        uint64_t v64 = *(void *)(*((void *)&v94 + 1) + 8 * i);
        v65 = objc_opt_class();
        id v66 = (id)__CRLAccessibilityCastAsSafeCategory(v65, v64, 1, &v102);
        if (v102) {
          goto LABEL_42;
        }
      }
      id v61 = [v59 countByEnumeratingWithState:&v94 objects:v103 count:16];
    }
    while (v61);
  }

  v67 = +[NSBundle mainBundle];
  v68 = [v67 localizedStringForKey:@"Connection Lines" value:0 table:0];
  v69 = [(CRLCanvasRepAccessibility *)self _makeNavigateToConnectedElementCustomActionsFor:v59 inCategory:v68 directionType:0];
  [v3 addObjectsFromArray:v69];

LABEL_34:
  v70 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  unsigned int v71 = [v70 crlaxIsInFollowingMode];

  if (v71)
  {
    v72 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    v73 = [v72 crlaxTarget];
    v74 = [v73 editingCoordinator];
    v75 = [v74 followCoordinator];
    v76 = [v75 accessibilityExperienceCoordinator];

    v77 = [v76 lastFollowedParticipant];
    v78 = [v77 shortDisplayName];

    id v79 = [v78 length];
    v80 = +[NSBundle mainBundle];
    v81 = v80;
    if (v79)
    {
      uint64_t v82 = [v80 localizedStringForKey:@"Pause following %@" value:0 table:0];

      v83 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v82, v78);
      v81 = (void *)v82;
    }
    else
    {
      v83 = [v80 localizedStringForKey:@"Pause following" value:0 table:0];
    }

    id v84 = objc_alloc((Class)UIAccessibilityCustomAction);
    v85 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v86 = +[UIImage systemImageNamed:@"pause.fill" withConfiguration:v85];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10017F168;
    v92[3] = &unk_1014CC028;
    id v93 = v76;
    id v87 = v76;
    id v88 = [v84 initWithName:v83 image:v86 actionHandler:v92];

    [v3 addObject:v88];
  }
  id v89 = [v3 copy];

  return v89;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  objc_super v4 = [v3 repForDragging];

  uint64_t v5 = objc_opt_class();
  objc_super v6 = [v4 info];
  unsigned int v7 = sub_1002469D0(v5, v6);

  id v8 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  id v9 = [v8 crlaxTarget];

  if ([v4 isSelected] && objc_msgSend(v7, "allowedToBeDragAndDropped"))
  {
    uint64_t v10 = [v9 canvasEditor];
    unsigned int v11 = [v10 canvasEditorCanCopyWithSender:0];

    double v12 = 0;
    if (v11)
    {
      [v4 crlaxCGRectValueForKey:@"_accessibilityVisibleFrame"];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      unsigned int v21 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
      double v22 = [v21 crlaxTarget];
      [v22 convertRect:0 fromView:v14, v16, v18, v20];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;

      id v31 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
      id v32 = +[NSBundle mainBundle];
      id v33 = [v32 localizedStringForKey:@"Drag Item" value:0 table:0];
      double v34 = sub_100065738(v24, v26, v28, v30);
      double v36 = v35;
      id v37 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
      id v38 = [v31 initWithName:v33 point:v37 inView:v34];

      id v40 = v38;
      double v12 = +[NSArray arrayWithObjects:&v40 count:1];
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)accessibilityDropPointDescriptors
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  objc_super v4 = [v3 repForSelecting];

  [v4 crlaxCGRectValueForKey:@"_accessibilityVisibleFrame"];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  double v14 = [v13 crlaxTarget];
  [v14 convertRect:0 fromView:v6, v8, v10, v12];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  id v23 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  CGFloat v24 = +[NSBundle mainBundle];
  double v25 = [v24 localizedStringForKey:@"Drop Item" value:0 table:0];
  double v26 = sub_100065738(v16, v18, v20, v22);
  double v28 = v27;
  double v29 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  id v30 = [v23 initWithName:v25 point:v29 inView:v26];

  id v33 = v30;
  id v31 = +[NSArray arrayWithObjects:&v33 count:1];

  return v31;
}

- (BOOL)crlaxIsReadyToLoadChildren
{
  return +[NSThread isMainThread];
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4 = a3;
  char v43 = 0;
  double v5 = self;
  double v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v43);
  if (v43) {
    goto LABEL_30;
  }
  double v8 = (void *)v7;

  double v28 = v8;
  [v8 childReps];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) crlaxAccessibilityElement];
        if (v14)
        {
          [v4 addObject:v14];
          [v14 crlaxEnsureChildrenAreLoaded];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v11);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10017F90C;
  v37[3] = &unk_1014CBE78;
  v37[4] = v5;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v38 = v15;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v37)) {
LABEL_30:
  }
    abort();

  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        CGFloat v22 = (char *)[v21 accessibilityElementCount];
        if (([v21 isAccessibilityElement] & 1) != 0
          || (unint64_t)(v22 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
        {
          [v4 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v18);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = v4;
  id v24 = [v23 countByEnumeratingWithState:&v29 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * (void)k) setAccessibilityContainer:v5];
      }
      id v25 = [v23 countByEnumeratingWithState:&v29 objects:v44 count:16];
    }
    while (v25);
  }
}

- (void)crlaxChildWillBeRemoved:(id)a3
{
}

- (void)crlaxDidInvalidateChildren
{
}

- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (BOOL)crlaxSelect
{
  id v26 = 0;
  unsigned int v3 = [(CRLCanvasRepAccessibility *)self _crlaxCanBeSelectedWithSelectableRepReference:&v26];
  id v4 = v26;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 crlaxIsSelected])
    {
      char v25 = 0;
      id v5 = v4;
      double v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v25);
      if (!v25)
      {
        id v8 = (id)v7;

        id v9 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
        id v10 = [v9 crlaxTarget];
        [(CRLCanvasRepAccessibility *)self accessibilityActivationPoint];
        [v10 convertPoint:0 fromView:];
        double v12 = v11;
        double v14 = v13;

        id v15 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
        [v15 crlaxConvertBoundsToUnscaledPoint:v12, v14];
        double v17 = v16;
        double v19 = v18;

        CGFloat v20 = [v8 beginEditingChildrenIfAllowedAtUnscaledPoint:0 pickingDeepestChild:v17, v19];
        BOOL v21 = v20 != 0;

LABEL_9:
        goto LABEL_10;
      }
    }
    else
    {
      [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10017FB24;
      v23[3] = &unk_1014CBBB0;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = v8;
      if (!__CRLAccessibilityPerformSafeBlock((uint64_t)v23))
      {

        [v8 crlaxSelectRep:v4];
        CRLAccessibilityPostLayoutChangedNotification(0);
        BOOL v21 = 1;
        goto LABEL_9;
      }
    }
    abort();
  }
  BOOL v21 = 0;
LABEL_10:

  return v21;
}

- (void)dealloc
{
  [(CRLCanvasRepAccessibility *)self crlaxAccessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v3 dealloc];
}

- (void)dynamicDragDidBegin
{
  v2.receiver = self;
  v2.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v2 dynamicDragDidBegin];
  [objc_opt_class() crlaxSetCurrentRepDragOffset:CGPointZero.x, CGPointZero.y];
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v26 dynamicallyResizingWithTracker:v4];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v5 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    if (![v5 isBeingResized])
    {
LABEL_9:

      goto LABEL_10;
    }
    double v6 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
    uint64_t v7 = [v6 crlaxTarget];
    unsigned __int8 v8 = [v7 isBeingResized];

    if ((v8 & 1) == 0)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(CRLCanvasRepAccessibility *)self _crlaxLastBoundsAnnouncementTime];
      if (Current - v10 > 0.5)
      {
        double v11 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
        id v5 = [v11 crlaxRulerUnitsInstance];

        if ((unint64_t)[v5 crlaxRulerUnits] >= 2) {
          CFStringRef v12 = @"%.0f %@";
        }
        else {
          CFStringRef v12 = @"%.2f %@";
        }
        [v4 crlaxCGRectValueForKey:@"currentBoundsForStandardKnobs"];
        double v14 = v13;
        double v16 = v15;
        double v17 = [v5 crlaxLocalizedCompatibleRulerUnitsForCanvas];
        double v18 = [v17 lowercaseString];

        [v5 crlaxConvertPointsToRulerUnits:v14];
        CGFloat v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v19, v18);
        [v5 crlaxConvertPointsToRulerUnits:v16];
        CGFloat v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v21, v18);
        id v23 = +[NSBundle mainBundle];
        id v24 = [v23 localizedStringForKey:@"Width: %1$@, Height: %2$@", 0, 0 value table];
        char v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v20, v22);

        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v25);
        [(CRLCanvasRepAccessibility *)self _crlaxSetLastBoundsAnnouncementTime:Current];

        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (id)crlaxCompleteConnectionsCustomContent
{
  objc_super v3 = objc_opt_new();
  id v4 = [(CRLCanvasRepAccessibility *)self crlaxInboundConnectedLayouts];
  id v5 = [v4 count];

  if (v5)
  {
    double v6 = +[NSString stringWithFormat:@"%ld", v5];
    uint64_t v7 = +[CRLCanvasRepAccessibility inboundConnectionsString];
    unsigned __int8 v8 = +[AXCustomContent customContentWithLabel:v7 value:v6];
    [v3 addObject:v8];
  }
  id v9 = [(CRLCanvasRepAccessibility *)self crlaxOutboundConnectedLayouts];
  id v10 = [v9 count];

  if (v10)
  {
    double v11 = +[NSString stringWithFormat:@"%ld", v10];
    CFStringRef v12 = +[CRLCanvasRepAccessibility outboundConnectionsString];
    double v13 = +[AXCustomContent customContentWithLabel:v12 value:v11];
    [v3 addObject:v13];
  }

  return v3;
}

- (void)crlaxPerformExtraCleanupTasksPriorToRemovalFromCanvas
{
  [(CRLCanvasRepAccessibility *)self setAccessibilityContainer:0];
  objc_super v3 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  [v3 crlaxInvalidateChildren];

  id v4 = [(CRLCanvasRepAccessibility *)self _crlaxRepContainerElementCache];
  [v4 crlaxInvalidateChildren];

  id v5 = [(CRLCanvasRepAccessibility *)self _crlaxRepContainerElementCache];
  [v5 setRep:0];

  double v6 = [(CRLCanvasRepAccessibility *)self _crlaxRepContainerElementCache];
  [v6 crlaxAccessibilityUnregister];

  [(CRLCanvasRepAccessibility *)self crlaxAccessibilityUnregister];
}

- (id)_crlaxPrimaryTextEditor
{
  objc_super v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  objc_super v3 = [v2 crlaxTarget];
  id v4 = [v3 editorController];
  id v5 = [v4 textInputEditor];

  double v6 = NSProtocolFromString(@"CRLCanvasEditor");
  if (([v5 conformsToProtocol:v6] & 1) == 0)
  {
    uint64_t v7 = [v2 crlaxCanvasEditor];

    if ([v7 conformsToProtocol:v6])
    {
      id v5 = v7;
    }
    else
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_crlaxCanBeSelectedWithSelectableRepReference:(id *)a3
{
  id v5 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
  double v6 = v5;
  if (v5 && ![(CRLCanvasRepAccessibility *)v5 crlaxIsSelected])
  {
    BOOL v9 = 1;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v7 = [(CRLCanvasRepAccessibility *)self crlaxAncestorOfType:objc_opt_class()];
  BOOL v9 = v6 != self && v7 == v6;

  if (a3)
  {
LABEL_10:
    if (v9) {
      id v10 = v6;
    }
    else {
      id v10 = 0;
    }
    *a3 = v10;
  }
LABEL_14:

  return v9;
}

- (BOOL)_crlaxCanBeSelected
{
  return [(CRLCanvasRepAccessibility *)self _crlaxCanBeSelectedWithSelectableRepReference:0];
}

- (void)_crlaxGoToFormatInspector
{
  objc_super v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  [v3 crlaxGoToFormatInspector];

  char v16 = 0;
  id v4 = [(CRLCanvasRepAccessibility *)self crlaxCanvasViewController];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v16);
  if (v16) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)v6;

  char v15 = 0;
  unsigned __int8 v8 = [v7 miniFormatterPresenter];
  BOOL v9 = [v8 crlaxMiniFormatterViewController];

  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = __CRLAccessibilityCastAsClass(v10, (uint64_t)v9, 1, &v15);
  if (v15) {
LABEL_4:
  }
    abort();
  CFStringRef v12 = (void *)v11;

  double v13 = [v12 crlaxAccessibilityViews];
  double v14 = [v13 firstObject];

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v14);
}

- (BOOL)_crlaxReaderModePerformCopy
{
  objc_super v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  id v4 = [v3 crlaxTarget];

  id v5 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
  uint64_t v6 = [v5 crlaxTarget];

  uint64_t v7 = [v4 canvasEditor];
  unsigned __int8 v8 = [v6 info];
  BOOL v9 = [v7 selectionPathWithInfo:v8];

  id v10 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  +[CRLAccessibilityReaderModeCopyOperator performCopyOperationWithSelectionPath:v9 interactiveCanvasController:v4 sender:v10];

  return 1;
}

- (id)_makeNavigateToConnectedElementCustomActionsFor:(id)a3 inCategory:(id)a4 directionType:(int)a5
{
  id v7 = a3;
  id v34 = a4;
  id v32 = (id)objc_opt_new();
  long long v33 = +[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:v7];
  unsigned __int8 v8 = +[NSBundle mainBundle];
  double v28 = [v8 localizedStringForKey:@"Go to %@" value:0 table:0];

  BOOL v9 = +[NSBundle mainBundle];
  long long v29 = [v9 localizedStringForKey:@"Follow %1$@ to %2$@" value:0 table:0];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        char v15 = +[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:v14];
        if (v15)
        {
          char v37 = 0;
          id v16 = v14;
          double v17 = objc_opt_class();
          uint64_t v18 = __CRLAccessibilityCastAsSafeCategory(v17, (uint64_t)v16, 1, &v37);
          if (v37) {
            abort();
          }
          uint64_t v19 = (void *)v18;

          CGFloat v20 = [(CRLCanvasRepAccessibility *)self crlaxDescriptionOfSingleConnectionLineConnectingToLayout:v16 inDirection:a5];
          uint64_t v21 = [v33 objectForKeyedSubscript:v15];
          if ([v20 length]) {
            +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v29, v20, v21);
          }
          else {
          CGFloat v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v21, v27);
          }
          id v23 = objc_alloc((Class)UIAccessibilityCustomAction);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100180704;
          v35[3] = &unk_1014DC1A8;
          v35[4] = self;
          id v36 = v19;
          id v24 = v19;
          id v25 = [v23 initWithName:v22 actionHandler:v35];
          [v25 setLocalizedActionRotorCategory:v34];
          [v32 addObject:v25];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  return v32;
}

- (NSArray)preferredFocusEnvironments
{
  id v4 = self;
  objc_super v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  objc_super v2 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  objc_super v3 = [v2 crlaxTarget];

  return (UIFocusEnvironment *)v3;
}

- (UIFocusItemContainer)focusItemContainer
{
  objc_super v2 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  objc_super v3 = [v2 crlaxTarget];

  return (UIFocusItemContainer *)v3;
}

- (void)setNeedsFocusUpdate
{
  id v3 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRepAccessibility *)self parentFocusEnvironment];
  unsigned __int8 v6 = [v5 shouldUpdateFocusInContext:v4];

  return v6;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)crlaxWasExplicitlyFocused
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9D68);
}

- (void)crlaxSetWasExplicitlyFocused:(BOOL)a3
{
}

- (NSArray)_crlaxKnobAccessibilityElementsCache
{
  return (NSArray *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9D69);
}

- (void)_crlaxSetKnobAccessibilityElementsCache:(id)a3
{
}

- (BOOL)_crlaxShouldPreventAccessToCanvas
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9D6A);
}

- (void)_crlaxSetShouldPreventAccessToCanvas:(BOOL)a3
{
}

- (BOOL)_crlaxKnobElementCacheIsInvalid
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9D6B);
}

- (void)_crlaxSetKnobElementCacheIsInvalid:(BOOL)a3
{
}

- (BOOL)crlaxIsBeingRemoved
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9D6C);
}

- (void)crlaxSetIsBeingRemoved:(BOOL)a3
{
}

- (id)accessibilityLabel
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxLabel];
  if ([(CRLCanvasRepAccessibility *)self crlaxIsContainedTextRep])
  {
    char v40 = 0;
    id v4 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    id v5 = [v4 parentRep];

    unsigned __int8 v6 = objc_opt_class();
    uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v40);
    if (v40) {
      goto LABEL_14;
    }
    unsigned __int8 v8 = (void *)v7;

    BOOL v9 = [v8 crlaxLabel];
    id v10 = [(CRLCanvasRepAccessibility *)self crlaxCollaboratorDescription];
    uint64_t v17 = __CRLAccessibilityStringForVariables(1, v9, v11, v12, v13, v14, v15, v16, (uint64_t)v10);

    id v3 = (void *)v17;
  }
  if (!v3)
  {
    char v39 = 0;
    objc_super v26 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    uint64_t v27 = [v26 info];

    double v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = __CRLAccessibilityCastAsClass(v28, (uint64_t)v27, 1, &v39);
    if (!v39)
    {
      uint64_t v18 = (void *)v29;

      long long v30 = [v18 localizedName];
      if ([v30 length])
      {
        long long v31 = [(CRLCanvasRepAccessibility *)self crlaxGroupAndLockStatusString];
        id v25 = __CRLAccessibilityStringForVariables(1, v30, v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      }
      else
      {
        id v25 = 0;
      }

      goto LABEL_11;
    }
LABEL_14:
    abort();
  }
  uint64_t v18 = [(CRLCanvasRepAccessibility *)self crlaxGroupAndLockStatusString];
  id v25 = __CRLAccessibilityStringForVariables(1, v3, v19, v20, v21, v22, v23, v24, (uint64_t)v18);
LABEL_11:

  return v25;
}

- (id)accessibilityValue
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxValue];
  id v4 = [(CRLCanvasRepAccessibility *)self crlaxCollaboratorDescription];
  uint64_t v11 = __CRLAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  return v11;
}

- (id)accessibilityUserInputLabels
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxUserInputLabels];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLCanvasRepAccessibility;
    id v3 = [(CRLCanvasRepAccessibility *)&v5 accessibilityUserInputLabels];
  }

  return v3;
}

- (CRLCanvasRep)crlaxRetainedTarget
{
  if ([(CRLCanvasRepAccessibility *)self _crlaxShouldPreventAccessToCanvas])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  }

  return (CRLCanvasRep *)v3;
}

- (CGRect)crlaxFrameInUnscaledCanvas
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v4 = [v3 crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting];
  objc_super v5 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  uint64_t v6 = v5;
  if (v4) {
    [v5 frameInUnscaledCanvasForMarqueeSelecting];
  }
  else {
    [v5 frameInUnscaledCanvas];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)crlaxLayerFrameInScaledCanvas
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxRetainedTarget];
  [v2 layerFrameInScaledCanvas];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGPoint)crlaxCenterInUnscaledCanvas
{
  [(CRLCanvasRepAccessibility *)self crlaxFrameInUnscaledCanvas];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (CGRect)crlaxFrameInScreenSpace
{
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
  [(CRLCanvasRepAccessibility *)self crlaxFrameInUnscaledCanvas];
  [v3 crlaxScreenFrameFromUnscaledCanvas:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CRLCanvasAccessibility)crlaxCanvas
{
  char v8 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v3 = [v2 canvas];

  double v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  double v6 = (void *)v5;

  return (CRLCanvasAccessibility *)v6;
}

- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  char v8 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
  double v3 = [v2 crlaxInteractiveCanvasController];

  double v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  double v6 = (void *)v5;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v6;
}

- (CRLCanvasViewAccessibility)crlaxCanvasView
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  double v3 = [v2 crlaxCanvasView];

  return (CRLCanvasViewAccessibility *)v3;
}

- (CRLCanvasRepAccessibility)crlaxParentRep
{
  char v8 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v3 = [v2 parentRep];

  double v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  double v6 = (void *)v5;

  return (CRLCanvasRepAccessibility *)v6;
}

- (CRLCanvasElementInfo)crlaxInfo
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v3 = [v2 info];

  return (CRLCanvasElementInfo *)v3;
}

- (CRLCanvasLayoutAccessibility)crlaxLayout
{
  char v8 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v3 = [v2 layout];

  double v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  double v6 = (void *)v5;

  return (CRLCanvasLayoutAccessibility *)v6;
}

- (BOOL)crlaxIsSelectedIgnoringLocking
{
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v4 = [v3 isSelectedIgnoringLocking];

  if (v4) {
    return 1;
  }
  double v6 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  double v7 = [v6 crlaxTarget];
  unsigned __int8 v8 = [v7 isSelectedIgnoringLocking];

  return v8;
}

- (BOOL)crlaxIsSelected
{
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v4 = [v3 isSelected];

  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    double v6 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
    if ([v6 crlaxIsSelected])
    {
      double v7 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
      objc_opt_class();
      char v5 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5 & 1;
}

- (BOOL)crlaxIsSelectable
{
  id v2 = self;
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (CRLCanvasRepAccessibility)crlaxRepForSelecting
{
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];

  if (v3)
  {
    char v9 = 0;
    unsigned __int8 v4 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    char v5 = [v4 repForSelecting];

    double v6 = objc_opt_class();
    uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v9);
    if (v9) {
      abort();
    }
    double v3 = (void *)v7;
  }

  return (CRLCanvasRepAccessibility *)v3;
}

- (BOOL)crlaxShouldCreateKnobs
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 shouldCreateKnobs];

  return v3;
}

- (BOOL)crlaxIsDraggable
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  unsigned __int8 v3 = [v2 crlaxIsDraggable];

  return v3;
}

- (CGRect)crlaxNaturalBounds
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  [v2 naturalBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (NSString)crlaxHeightDescription
{
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  double v4 = [v3 crlaxInspectorGeometry];
  [v4 crlaxSize];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    double v9 = 0;
  }
  else
  {
    double v7 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    double v8 = [v7 crlaxDescriptionOfPointValueConvertedToRulerUnit:v6];

    double v9 = +[NSString stringWithFormat:@"%1$@", v8];
  }

  return (NSString *)v9;
}

- (NSString)crlaxWidthDescription
{
  double v3 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  double v4 = [v3 crlaxInspectorGeometry];
  [v4 crlaxSize];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    double v9 = 0;
  }
  else
  {
    double v7 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
    double v8 = [v7 crlaxDescriptionOfPointValueConvertedToRulerUnit:v6];

    double v9 = +[NSString stringWithFormat:@"%1$@", v8];
  }

  return (NSString *)v9;
}

- (NSString)crlaxRotationDescription
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  double v3 = [v2 crlaxInspectorGeometry];
  [v3 crlaxAngleInDegrees];
  double v5 = v4;

  if (v5 == 0.0)
  {
    double v8 = 0;
  }
  else
  {
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"%.0f degrees" value:0 table:0];
    double v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, *(void *)&v5);
  }

  return (NSString *)v8;
}

- (id)accessibilityCustomContent
{
  double v3 = objc_opt_new();
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(CRLCanvasRepAccessibility *)self crlaxLayoutDescription];
  }
  else
  {
    double v4 = 0;
  }
  if ([v4 length])
  {
    double v5 = +[NSBundle mainBundle];
    double v6 = [v5 localizedStringForKey:@"Nearby" value:0 table:0];
    double v7 = +[AXCustomContent customContentWithLabel:v6 value:v4];
    [v3 addObject:v7];
  }
  double v8 = [(CRLCanvasRepAccessibility *)self crlaxHeightDescription];
  if ([v8 length])
  {
    double v9 = +[NSBundle mainBundle];
    double v10 = [v9 localizedStringForKey:@"Height" value:0 table:0];
    double v11 = +[AXCustomContent customContentWithLabel:v10 value:v8];
    [v3 addObject:v11];
  }
  double v12 = [(CRLCanvasRepAccessibility *)self crlaxWidthDescription];
  if ([v12 length])
  {
    double v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"Width" value:0 table:0];
    double v15 = +[AXCustomContent customContentWithLabel:v14 value:v12];
    [v3 addObject:v15];
  }
  double v16 = [(CRLCanvasRepAccessibility *)self crlaxRotationDescription];
  if ([v16 length])
  {
    double v17 = +[NSBundle mainBundle];
    double v18 = [v17 localizedStringForKey:@"Rotation" value:0 table:0];
    uint64_t v19 = +[AXCustomContent customContentWithLabel:v18 value:v16];
    [v3 addObject:v19];
  }
  if (objc_opt_respondsToSelector())
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10048EE84;
    v29[3] = &unk_1014CBE78;
    id v30 = v3;
    long long v31 = self;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v29)) {
      abort();
    }
  }
  uint64_t v20 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  uint64_t v21 = [v20 count];

  uint64_t v22 = [(CRLCanvasRepAccessibility *)self crlaxConnectedLayouts];
  uint64_t v23 = [v22 count];

  if (v21 - v23 >= 1)
  {
    uint64_t v24 = +[NSString stringWithFormat:@"%ld", v21 - v23];
    id v25 = +[NSBundle mainBundle];
    objc_super v26 = [v25 localizedStringForKey:@"Incomplete connections" value:0 table:0];
    uint64_t v27 = +[AXCustomContent customContentWithLabel:v26 value:v24];
    [v3 addObject:v27];
  }

  return v3;
}

- (BOOL)crlaxIsLocked
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isLocked];

  return v3;
}

- (NSString)crlaxLockedLabel
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsLocked])
  {
    id v2 = +[NSBundle mainBundle];
    unsigned __int8 v3 = [v2 localizedStringForKey:@"Locked" value:0 table:0];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)crlaxLockedHint
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsLocked])
  {
    id v2 = +[NSBundle mainBundle];
    unsigned __int8 v3 = [v2 localizedStringForKey:@"Locked items cannot be edited" value:0 table:0];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)crlaxContainsTitle
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTitle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)crlaxContainsCaption
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxCaption];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)crlaxIsTitle
{
  return 0;
}

- (BOOL)crlaxIsCaption
{
  return 0;
}

- (NSString)crlaxTitle
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxDrawableInfoAccessibility];
  BOOL v3 = [v2 crlaxUserProvidedTitle];

  return (NSString *)v3;
}

- (NSString)crlaxCaption
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxDrawableInfoAccessibility];
  BOOL v3 = [v2 crlaxUserProvidedCaption];

  return (NSString *)v3;
}

- (NSString)crlaxTitleLabel
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxDrawableInfoAccessibility];
  BOOL v3 = [v2 crlaxUserProvidedTitleLabel];

  return (NSString *)v3;
}

- (NSString)crlaxCaptionLabel
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxDrawableInfoAccessibility];
  BOOL v3 = [v2 crlaxUserProvidedCaptionLabel];

  return (NSString *)v3;
}

- (NSString)crlaxItemTypeDescription
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxDrawableInfoAccessibility];
  BOOL v3 = [v2 crlaxTypeDescription];

  return (NSString *)v3;
}

- (id)_crlaxDrawableInfo
{
  BOOL v3 = (objc_class *)objc_opt_class();
  double v4 = [(CRLCanvasRepAccessibility *)self crlaxInfo];
  double v5 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v4, 0, 0);

  return v5;
}

- (id)_crlaxDrawableInfoAccessibility
{
  BOOL v3 = objc_opt_class();
  double v4 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v5 = [v4 info];
  double v6 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v5, 0, 0);

  return v6;
}

- (BOOL)crlaxInReadOnlyMode
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  unsigned __int8 v3 = [v2 crlaxDocumentIsSharedReadOnly];

  return v3;
}

- (NSArray)crlaxKnobAccessibilityElements
{
  char v66 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxRetainedTarget];
  unsigned __int8 v3 = [v2 knobs];

  double v4 = (objc_class *)objc_opt_class();
  double v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v66);
  if (v66) {
LABEL_43:
  }
    abort();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v63;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v63 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        double v12 = objc_opt_class();
        id v13 = (id)__CRLAccessibilityCastAsSafeCategory(v12, v11, 1, &v66);
        if (v66) {
          goto LABEL_43;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v8);
  }

  double v14 = self;
  if ([(CRLCanvasRepAccessibility *)self _crlaxKnobElementCacheIsInvalid]
    || ([(CRLCanvasRepAccessibility *)self _crlaxKnobAccessibilityElementsCache],
        double v15 = objc_claimAutoreleasedReturnValue(),
        id v16 = [v15 count],
        id v17 = [v6 count],
        v15,
        v16 != v17))
  {
    v52 = +[NSMutableArray array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v49 = v6;
    id v18 = v6;
    id v19 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v59;
      id v51 = v18;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v59 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
          char v66 = 0;
          id v24 = v23;
          id v25 = objc_opt_class();
          uint64_t v26 = __CRLAccessibilityCastAsSafeCategory(v25, (uint64_t)v24, 1, &v66);
          if (v66) {
            goto LABEL_43;
          }
          uint64_t v27 = (void *)v26;

          if (v27)
          {
            if ([v27 crlaxKnobTag])
            {
              double v28 = [(CRLCanvasRepAccessibility *)v14 crlaxTarget];
              uint64_t v29 = [v28 interactiveCanvasController];
              unsigned int v30 = [v29 documentIsSharedReadOnly];

              long long v31 = [v27 crlaxTarget];
              unsigned int v32 = [v31 worksWhenDocumentIsSharedReadOnly];

              if (!v30 || v32)
              {
                if (-[CRLCanvasRepAccessibility crlaxShouldCreateAccessibilityElementForKnob:](v14, "crlaxShouldCreateAccessibilityElementForKnob:", v27, v49))
                {
                  long long v56 = 0u;
                  long long v57 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  uint64_t v33 = [(CRLCanvasRepAccessibility *)v14 _crlaxKnobAccessibilityElementsCache];
                  id v34 = [v33 countByEnumeratingWithState:&v54 objects:v67 count:16];
                  if (v34)
                  {
                    id v35 = v34;
                    uint64_t v36 = *(void *)v55;
LABEL_25:
                    uint64_t v37 = 0;
                    while (1)
                    {
                      if (*(void *)v55 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      long long v38 = *(void **)(*((void *)&v54 + 1) + 8 * v37);
                      if ([v38 isEqualToKnob:v27]) {
                        break;
                      }
                      if (v35 == (id)++v37)
                      {
                        id v35 = [v33 countByEnumeratingWithState:&v54 objects:v67 count:16];
                        if (v35) {
                          goto LABEL_25;
                        }
                        goto LABEL_31;
                      }
                    }
                    id v39 = v38;

                    double v14 = self;
                    if (v39) {
                      goto LABEL_34;
                    }
                  }
                  else
                  {
LABEL_31:

                    double v14 = self;
                  }
                  char v40 = [v27 crlaxIdentifier];
                  id v39 = [(CRLCanvasRepAccessibility *)v14 crlaxNewKnobElementForKnob:v27 withIdentifier:v40];

LABEL_34:
                  [v39 setParentRep:v14];
                  [v52 crlaxAddObjectIfNotNil:v39];

                  id v18 = v51;
                }
              }
            }
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v20);
    }

    long long v41 = [(CRLCanvasRepAccessibility *)v14 _crlaxKnobAccessibilityElementsCache];

    if (v41)
    {
      long long v42 = [(CRLCanvasRepAccessibility *)v14 _crlaxKnobAccessibilityElementsCache];
      char v43 = +[NSMutableSet setWithArray:v42];

      CGAffineTransform v44 = +[NSSet setWithArray:v52];
      [v43 minusSet:v44];

      CGAffineTransform v45 = [v43 allObjects];
      [(CRLCanvasRepAccessibility *)v14 _crlaxInvalidateKnobAccessibilityElements:v45];
    }
    -[CRLCanvasRepAccessibility _crlaxSetKnobAccessibilityElementsCache:](v14, "_crlaxSetKnobAccessibilityElementsCache:", v52, v49);
    [(CRLCanvasRepAccessibility *)v14 _crlaxSetKnobElementCacheIsInvalid:0];

    id v6 = v50;
  }
  CGAffineTransform v46 = [(CRLCanvasRepAccessibility *)v14 _crlaxKnobAccessibilityElementsCache];
  id v47 = [v46 copy];

  return (NSArray *)v47;
}

- (NSString)crlaxKnobLabel
{
  return (NSString *)&stru_101538650;
}

- (id)crlaxKnobForTag:(unint64_t)a3 index:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  double v10 = [v9 knobs];

  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
      id v16 = objc_opt_class();
      id v17 = __CRLAccessibilityCastAsSafeCategory(v16, v15, 0, 0);
      id v18 = v17;
      if (v17)
      {
        if ([v17 crlaxKnobTag] == (id)a3 && objc_msgSend(v18, "crlaxNodeIndex") == (id)a4)
        {
          id v19 = [v18 crlaxIdentifier];

          if (v19 == v8) {
            break;
          }
        }
      }

      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    id v18 = 0;
  }

  return v18;
}

- (id)crlaxKnobElementForTag:(unint64_t)a3 index:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  [(CRLCanvasRepAccessibility *)self crlaxKnobAccessibilityElements];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v14, "knobTag", (void)v18) == (id)a3 && objc_msgSend(v14, "knobNodeIndex") == (id)a4)
        {
          id v15 = [v14 crlaxIdentifier];

          if (v15 == v8)
          {
            id v16 = v14;
            goto LABEL_13;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)crlaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (NSString)crlaxSummaryDescription
{
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)self accessibilityLabel];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)crlaxCollaboratorDescriptionDirect
{
  unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned int v4 = [v3 shouldShowCollaboratorCursorHighlight];

  if (v4)
  {
    double v5 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    id v6 = [v5 p_currentCollaboratorPresence];
    id v7 = [v6 displayName];

    if ([v7 length])
    {
      id v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"Selected by %@" value:0 table:0];

      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return (NSString *)v10;
}

- (BOOL)crlaxSupportsChangeTracking
{
  return 0;
}

- (CGAffineTransform)crlaxTransformToConvertNaturalFromLayerRelative
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x5010000000;
  id v11 = "";
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10048FD94;
  v7[3] = &unk_1014CB090;
  v7[4] = self;
  v7[5] = &v8;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  unsigned int v4 = v9;
  long long v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tCGFloat x = *((_OWORD *)v4 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (BOOL)crlaxIsInGroup
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 layout];
  unsigned __int8 v4 = [v3 isInGroup];

  return v4;
}

- (NSString)crlaxGroupAndLockStatusString
{
  unsigned __int8 v3 = +[NSMutableArray array];
  unsigned int v4 = [(CRLCanvasRepAccessibility *)self crlaxIsLockedDirectly];
  if (![(CRLCanvasRepAccessibility *)self crlaxIsLocked])
  {
    unsigned int v5 = 0;
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unsigned int v5 = ![(CRLCanvasRepAccessibility *)self crlaxIsLockedDirectly];
  if (v4)
  {
LABEL_5:
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"locked" value:0 table:0];
    [v3 addObject:v7];
  }
LABEL_6:
  if (![(CRLCanvasRepAccessibility *)self crlaxIsInGroup]) {
    goto LABEL_15;
  }
  uint64_t v8 = [(CRLCanvasRepAccessibility *)self crlaxMostDirectGroupAccessibilityDescription];
  if ([v8 length])
  {
    id v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"in %@, group", 0, 0 value table];

    id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8);
    [v3 addObject:v11];

    if (!v5) {
      goto LABEL_14;
    }
  }
  else if ((v5 & 1) == 0)
  {
    long long v12 = +[NSBundle mainBundle];
    long long v13 = v12;
    CFStringRef v14 = @"in group";
    goto LABEL_13;
  }
  long long v12 = +[NSBundle mainBundle];
  long long v13 = v12;
  CFStringRef v14 = @"in locked group";
LABEL_13:
  id v15 = [v12 localizedStringForKey:v14 value:0 table:0];
  [v3 addObject:v15];

LABEL_14:
LABEL_15:
  id v16 = [v3 componentsJoinedByString:@", "];

  return (NSString *)v16;
}

- (BOOL)crlaxIsLockedDirectly
{
  char v8 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxInfo];
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClassAndProtocol(v3, (Protocol *)&OBJC_PROTOCOL___CRLCanvasLockableElementInfo, v2, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned int v5 = (void *)v4;

  if (v5) {
    unsigned __int8 v6 = [v5 locked];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)crlaxDeselectAll
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  [v2 crlaxDeselectAll];
}

- (void)crlaxDeselectRep
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  [v3 crlaxDeselectRep:self];
}

- (void)crlaxAddToSelection
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  [v3 crlaxAddRepToSelection:self];
}

- (void)crlaxRotateClockwise
{
}

- (void)crlaxRotateCounterclockwise
{
}

- (void)_crlaxRotateClockwiseByDegrees:(double)a3
{
  unsigned int v5 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  unsigned __int8 v6 = [v5 repForRotating];

  id v7 = [[CRLCanvasRepRotateTracker alloc] initWithRep:v6];
  char v8 = objc_alloc_init(CRLCanvasRepAccessibilityRotationTrackerManipulator);
  [(CRLCanvasRepAccessibilityRotationTrackerManipulator *)v8 setRotationTracker:v7];
  id v9 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  uint64_t v10 = [v9 crlaxTarget];

  id v11 = [v10 tmCoordinator];
  [v11 registerTrackerManipulator:v8];
  [v11 takeControlWithTrackerManipulator:v8];
  long long v12 = [v10 dynamicOperationController];
  [v12 beginOperation];
  id v13 = objc_alloc((Class)NSSet);
  id v16 = v6;
  CFStringRef v14 = +[NSArray arrayWithObjects:&v16 count:1];
  id v15 = [v13 initWithArray:v14];

  [v12 startTransformingReps:v15];
  [(CRLCanvasRepRotateTracker *)v7 addRotateDelta:a3 * 0.0174532925];
  [v12 handleTrackerManipulator:v8];
  [(CRLCanvasRepAccessibilityRotationTrackerManipulator *)v8 setDoneWithDynamicOperation:1];
  [v12 handleTrackerManipulator:v8];
  [v10 layoutIfNeeded];
}

- (BOOL)crlaxMayRotate
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  uint64_t v4 = [v3 repForRotating];
  unsigned int v5 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  if (v4 != v5
    || [(CRLCanvasRepAccessibility *)self crlaxIsInGroup]
    || [(CRLCanvasRepAccessibility *)self crlaxIsLocked]
    || [(CRLCanvasRepAccessibility *)self crlaxInReadOnlyMode])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    char v8 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    if ([v8 containsUnknownContent])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      id v9 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
      unsigned int v6 = [v9 crlaxIsInFollowingMode] ^ 1;
    }
  }

  return v6;
}

- (BOOL)crlaxIsContainedTextRep
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  id v3 = [v2 parentRep];

  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)crlaxNewKnobElementForKnob:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [CRLCanvasKnobAccessibilityElement alloc];
  id v9 = [v7 crlaxKnobTag];
  id v10 = [v7 crlaxNodeIndex];

  id v11 = [(CRLCanvasKnobAccessibilityElement *)v8 initWithKnobTag:v9 nodeIndex:v10 parentRep:self identifier:v6];
  return v11;
}

- (CGPoint)crlaxConvertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  long long v12 = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100490628;
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
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (CGRect)crlaxConvertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  id v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100490760;
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
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGPoint)crlaxConvertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  CGRect v12 = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100490884;
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
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (CGRect)crlaxConvertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  id v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004909BC;
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
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGPoint)crlaxConvertNaturalPointToScreenSpace:(CGPoint)a3
{
  -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToScreenSpace:](self, "crlaxConvertNaturalRectToScreenSpace:", a3.x, a3.y, 0.0, 0.0);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGRect)crlaxConvertNaturalRectToScreenSpace:(CGRect)a3
{
  -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToUnscaledCanvas:](self, "crlaxConvertNaturalRectToUnscaledCanvas:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGRect v12 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  [v12 crlaxConvertUnscaledToBoundsRect:v5, v7, v9, v11];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  long long v21 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  long long v22 = [v21 crlaxCanvasView];

  [v22 crlaxFrameFromBounds:v14, v16, v18, v20];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (CGRect)crlaxConvertLayerRelativeRectToNaturalRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CRLCanvasRepAccessibility *)self crlaxTransformToConvertNaturalFromLayerRelative];
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)crlaxBezierPathContainsUnscaledCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  double v6 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  CGAffineTransform v7 = [v6 layout];
  CGRect v8 = [v7 pathForClippingConnectionLines];

  -[CRLCanvasRepAccessibility crlaxConvertNaturalPointFromUnscaledCanvas:](v5, "crlaxConvertNaturalPointFromUnscaledCanvas:", x, y);
  LOBYTE(v5) = [v8 containsPoint:];

  return (char)v5;
}

- (void)crlaxClearKnobAccessibilityElementCache
{
  double v3 = [(CRLCanvasRepAccessibility *)self _crlaxKnobAccessibilityElementsCache];
  [(CRLCanvasRepAccessibility *)self _crlaxInvalidateKnobAccessibilityElements:v3];

  [(CRLCanvasRepAccessibility *)self _crlaxSetKnobAccessibilityElementsCache:0];
}

- (BOOL)crlaxShouldCreateAccessibilityElementForKnob:(id)a3
{
  return [a3 crlaxKnobTag] != 0;
}

- (BOOL)crlaxOpenURL
{
  char v8 = 0;
  id v2 = self;
  double v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  double v5 = (void *)v4;

  if (v5)
  {
    double v6 = [v5 item];
    +[CRLURLEditor openItemURLFor:v6];
  }
  return v5 != 0;
}

- (NSString)crlaxDescriptionForConnections
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self accessibilityLabel];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  double v5 = [(CRLCanvasRepAccessibility *)self accessibilityValue];
  if ([v5 length]) {
    [v3 addObject:v5];
  }
  if ([v3 count])
  {
    double v6 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    double v6 = 0;
  }

  return (NSString *)v6;
}

- (NSSet)crlaxConnectedConnectionLines
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxRepForConnectionLineMapping];
  char v20 = 0;
  id v3 = [v2 layout];
  uint64_t v4 = [v3 connectedLayouts];

  double v5 = (objc_class *)objc_opt_class();
  double v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v20);
  if (v20) {
LABEL_13:
  }
    abort();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
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
        double v13 = objc_opt_class();
        id v14 = (id)__CRLAccessibilityCastAsSafeCategory(v13, v12, 1, &v20);
        if (v20) {
          goto LABEL_13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  return (NSSet *)v7;
}

- (NSSet)crlaxConnectedLayouts
{
  id v3 = [(CRLCanvasRepAccessibility *)self _crlaxRepForConnectionLineMapping];
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  double v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v3 layout:v15];
        double v13 = [v11 crlaxOppositeConnectedLayoutFrom:v12];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return (NSSet *)v5;
}

- (NSSet)crlaxInboundConnectedLayouts
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxBidirectionallyConnectedLayouts];
  uint64_t v4 = +[NSMutableSet setWithSet:v3];

  double v5 = [(CRLCanvasRepAccessibility *)self crlaxStrictlyInboundConnectedLayouts];
  [v4 unionSet:v5];

  return (NSSet *)v4;
}

- (NSSet)crlaxStrictlyInboundConnectedLayouts
{
  id v3 = [(CRLCanvasRepAccessibility *)self _crlaxLayoutsConnectedByStrictlyInboundConnectionLines];
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxBidirectionallyConnectedLayouts];
  double v5 = [v3 crl_setBySubtractingSet:v4];

  return (NSSet *)v5;
}

- (NSSet)crlaxOutboundConnectedLayouts
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxBidirectionallyConnectedLayouts];
  uint64_t v4 = +[NSMutableSet setWithSet:v3];

  double v5 = [(CRLCanvasRepAccessibility *)self crlaxStrictlyOutboundConnectedLayouts];
  [v4 unionSet:v5];

  return (NSSet *)v4;
}

- (NSSet)crlaxStrictlyOutboundConnectedLayouts
{
  id v3 = [(CRLCanvasRepAccessibility *)self _crlaxLayoutsConnectedByStrictlyOutboundConnectionLines];
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxBidirectionallyConnectedLayouts];
  double v5 = [v3 crl_setBySubtractingSet:v4];

  return (NSSet *)v5;
}

- (NSSet)crlaxBidirectionallyConnectedLayouts
{
  id v3 = [(CRLCanvasRepAccessibility *)self _crlaxBidirectionallyConnectedLayoutsViaSingleBidirectionalConnectionLines];
  uint64_t v4 = +[NSMutableSet setWithSet:v3];

  double v5 = [(CRLCanvasRepAccessibility *)self _crlaxBidirectionallyConnectedLayoutsViaMultipleUnidirectionalConnectionLines];
  [v4 unionSet:v5];

  return (NSSet *)v4;
}

- (id)crlaxAvailableRepsForConnecting
{
  return [(CRLCanvasRepAccessibility *)self _crlaxAvailableRepsForConnectingSorted];
}

- (BOOL)crlaxHasAvailableRepsForConnecting
{
  id v2 = [(CRLCanvasRepAccessibility *)self _crlaxAvailableRepsForConnecting];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)crlaxDescriptionOfSingleConnectionLineConnectingToLayout:(id)a3 inDirection:(int)a4
{
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self _crlaxConnectionLinesConnectingToLayout:a3 inDirection:*(void *)&a4];
  if ([v4 count] == (id)1)
  {
    double v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v5 crlaxTarget];
    id v7 = [v6 shapeInfo];
    id v8 = [v7 accessibilityDescription];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)clraxNumberOfStrictlyInboundConnectionsFromLayout:(id)a3
{
  BOOL v3 = [(CRLCanvasRepAccessibility *)self _crlaxConnectionLinesConnectingToLayout:a3 inDirection:1];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unint64_t)clraxNumberOfStrictlyOutboundConnectionsToLayout:(id)a3
{
  BOOL v3 = [(CRLCanvasRepAccessibility *)self _crlaxConnectionLinesConnectingToLayout:a3 inDirection:3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unint64_t)clraxNumberOfBidirectionalSingleConnectionsForLayout:(id)a3
{
  BOOL v3 = [(CRLCanvasRepAccessibility *)self _crlaxConnectionLinesConnectingToLayout:a3 inDirection:5];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

+ (id)crlaxDisambiguatedConnectionDescriptionsForSet:(id)a3
{
  id v3 = a3;
  id v49 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v3 count]];
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v3 count]];
  char v62 = 0;
  id v5 = v3;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v62);
  if (v62) {
LABEL_37:
  }
    abort();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v59;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v59 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        id v14 = objc_opt_class();
        id v15 = (id)__CRLAccessibilityCastAsSafeCategory(v14, v13, 1, &v62);
        if (v62) {
          goto LABEL_37;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v10);
  }

  char v43 = v5;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v55;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
        long long v22 = [v21 crlaxDescriptionForConnections];
        id v23 = [v4 objectForKeyedSubscript:v22];
        if (!v23) {
          id v23 = objc_alloc_init((Class)NSMutableArray);
        }
        [v23 addObject:v21];
        [v4 setObject:v23 forKeyedSubscript:v22];
      }
      id v18 = [v16 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v18);
  }
  long long v42 = v16;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [v4 allKeys];
  id v47 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v51;
    id v46 = v4;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v24;
        uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * v24);
        double v26 = [v4 objectForKeyedSubscript:v25];
        if ([v26 count])
        {
          unint64_t v27 = 1;
          do
          {
            double v28 = [v26 objectAtIndexedSubscript:v27 - 1];
            double v29 = [v28 crlaxTarget];
            double v30 = +[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:v29];

            if (v30)
            {
              if ([v26 count] == (id)1)
              {
                [v49 setObject:v25 forKeyedSubscript:v30];
              }
              else
              {
                double v31 = +[CRLCanvasRepAccessibility disambiguatedConnectionDescriptionFormat];
                uint64_t v32 = v25;
                id v33 = [v26 count];
                double v34 = [v28 crlaxTarget];
                [v34 frameInRoot];
                v67.double x = sub_1000674F0(v35, v36);
                uint64_t v37 = NSStringFromCGPoint(v67);
                id v41 = v33;
                uint64_t v25 = v32;
                long long v38 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v32, v27, v41, v37);
                [v49 setObject:v38 forKeyedSubscript:v30];
              }
            }
          }
          while (v27++ < (unint64_t)[v26 count]);
        }

        uint64_t v24 = v48 + 1;
        id v4 = v46;
      }
      while ((id)(v48 + 1) != v47);
      id v47 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v47);
  }

  return v49;
}

+ (id)crlaxBoardItemIDForLayout:(id)a3
{
  id v3 = a3;
  char v10 = 0;
  id v4 = [v3 info];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v10);
  if (v10) {
    abort();
  }
  id v7 = (void *)v6;

  id v8 = [v7 id];

  return v8;
}

- (BOOL)crlaxFullscreenPreviewFile
{
  char v7 = 0;
  id v2 = self;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  id v5 = (void *)v4;

  if (v5) {
    [v5 enterPreviewMode];
  }

  return v5 != 0;
}

- (void)i_willBeRemoved
{
  [(CRLCanvasRepAccessibility *)self crlaxSetIsBeingRemoved:1];
  [(CRLCanvasRepAccessibility *)self _crlaxSetShouldPreventAccessToCanvas:1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100491B4C;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  CRLAccessibilityPerformBlockOnMainThread(v4);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v3 i_willBeRemoved];
}

- (void)invalidateKnobs
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v3 invalidateKnobs];
  [(CRLCanvasRepAccessibility *)self _crlaxSetKnobElementCacheIsInvalid:1];
}

- (void)becameSelected
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v5 becameSelected];
  objc_super v3 = +[CRLAccessibility sharedInstance];
  [v3 setFirstElementForUpcomingScreenChange:self];

  dispatch_time_t v4 = dispatch_time(0, 500000000);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &stru_1014FD788);
}

- (void)becameNotSelected
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v3 becameNotSelected];
  id v2 = +[CRLAccessibility sharedInstance];
  [v2 setFirstElementForUpcomingScreenChange:0];
}

- (id)crlaxValueForKey:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasRepAccessibility *)self _crlaxShouldPreventAccessToCanvas]
    && [(CRLCanvasRepAccessibility *)self _crlaxKeyCorrespondsToPropertyRequiringAccessToCanvas:v4])
  {
    objc_super v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLCanvasRepAccessibility;
    objc_super v5 = [(CRLCanvasRepAccessibility *)&v7 crlaxValueForKey:v4];
  }

  return v5;
}

- (void)_crlaxInvalidateKnobAccessibilityElements:(id)a3
{
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setParentRep:0];
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)_crlaxKeyCorrespondsToPropertyRequiringAccessToCanvas:(id)a3
{
  unint64_t v4 = 0;
  long long v9 = *(_OWORD *)off_1014FD7A8;
  long long v10 = *(_OWORD *)off_1014FD7B8;
  long long v11 = *(_OWORD *)off_1014FD7C8;
  long long v12 = *(_OWORD *)off_1014FD7D8;
  do
  {
    unsigned __int8 v5 = [a3 isEqualToString:*((void *)&v9 + v4) v9, v10, v11, v12];
    BOOL v6 = v5;
    if (v4 > 6) {
      break;
    }
    ++v4;
  }
  while ((v5 & 1) == 0);
  for (uint64_t i = 56; i != -8; i -= 8)

  return v6;
}

- (id)_crlaxRepForConnectionLineMapping
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  if ([(CRLCanvasRepAccessibility *)self crlaxIsContainedTextRep])
  {
    unint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
    uint64_t v5 = [v4 parentRep];

    id v3 = (void *)v5;
  }

  return v3;
}

- (id)_crlaxConnectionLinesConnectingToLayout:(id)a3 inDirection:(int)a4
{
  id v5 = a3;
  id v18 = +[NSMutableArray array];
  BOOL v6 = [(CRLCanvasRepAccessibility *)self _crlaxRepForConnectionLineMapping];
  objc_super v7 = [v6 layout];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v8 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 crlaxOppositeConnectedLayoutFrom:v7];
        if (v14 == v5)
        {
          unsigned int v15 = [v13 crlaxIsVisuallyPointingAt:v7];
          unsigned int v16 = [v13 crlaxIsVisuallyPointingAt:v5];
          switch(a4)
          {
            case 0:
              goto LABEL_17;
            case 1:
              if ((v15 ^ 1 | v16)) {
                break;
              }
              goto LABEL_17;
            case 2:
              if (!v15) {
                break;
              }
              goto LABEL_17;
            case 3:
              if ((v16 & ~v15 & 1) == 0) {
                break;
              }
              goto LABEL_17;
            case 4:
              if ((v16 & 1) == 0) {
                break;
              }
              goto LABEL_17;
            case 5:
              if (v15 & v16) {
LABEL_17:
              }
                [v18 addObject:v13];
              break;
            default:
              break;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v18;
}

- (id)_crlaxAvailableRepsForConnecting
{
  char v22 = 0;
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v22);
  if (v22) {
    abort();
  }
  BOOL v6 = (void *)v5;

  id v7 = objc_alloc((Class)NSMutableArray);
  long long v8 = [v6 canvas];
  id v9 = [v8 topLevelReps];
  id v10 = [v7 initWithArray:v9];

  uint64_t v11 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
  LODWORD(v9) = [v10 containsObject:v11];

  if (v9)
  {
    if ([v10 count])
    {
      for (unint64_t i = 0; i < (unint64_t)[v10 count]; ++i)
      {
        uint64_t v13 = [v10 objectAtIndexedSubscript:i];
        id v14 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
        if (v13 == v14)
        {
          char isKindOfClass = 1;
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }

        unsigned int v16 = [(CRLCanvasRepAccessibility *)self crlaxTarget];
        objc_opt_class();
        char v17 = objc_opt_isKindOfClass();

        if (v17)
        {
          id v18 = [v13 layout];
          if ([v18 isInGroup])
          {
          }
          else
          {
            unsigned __int8 v19 = +[CRLConnectionLineRep canConnectToRep:v13];

            if (!(isKindOfClass & 1 | ((v19 & 1) == 0))) {
              goto LABEL_14;
            }
          }
        }
        else if ((isKindOfClass & 1) == 0 {
               && ([v13 shouldCreateConnectionLineKnobs] & 1) != 0)
        }
        {
          goto LABEL_14;
        }
        [v10 removeObjectAtIndex:i--];
LABEL_14:
      }
    }
    id v20 = v10;
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

- (id)_crlaxAvailableRepsForConnectingSorted
{
  [(CRLCanvasRepAccessibility *)self crlaxFrameInUnscaledCanvas];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = [(CRLCanvasRepAccessibility *)self _crlaxAvailableRepsForConnecting];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004924E4;
  v14[3] = &unk_1014FD7E8;
  v14[4] = v4;
  v14[5] = v6;
  v14[6] = v8;
  v14[7] = v10;
  long long v12 = [v11 sortedArrayUsingComparator:v14];

  return v12;
}

- (id)_crlaxLayoutsConnectedByStrictlyInboundConnectionLines
{
  uint64_t v3 = [(CRLCanvasRepAccessibility *)self _crlaxRepForConnectionLineMapping];
  uint64_t v4 = [v3 layout];
  uint64_t v5 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  uint64_t v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v4, (void)v15))
        {
          uint64_t v13 = [v12 crlaxOppositeConnectedLayoutFrom:v4];
          if (v13 && ([v12 crlaxIsVisuallyPointingAt:v13] & 1) == 0) {
            [v6 addObject:v13];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_crlaxLayoutsConnectedByStrictlyOutboundConnectionLines
{
  uint64_t v3 = [(CRLCanvasRepAccessibility *)self _crlaxRepForConnectionLineMapping];
  uint64_t v4 = [v3 layout];
  uint64_t v5 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  uint64_t v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v12 crlaxOppositeConnectedLayoutFrom:v4];
        if (v13
          && [v12 crlaxIsVisuallyPointingAt:v13]
          && ([v12 crlaxIsVisuallyPointingAt:v4] & 1) == 0)
        {
          [v6 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_crlaxBidirectionallyConnectedLayoutsViaSingleBidirectionalConnectionLines
{
  uint64_t v3 = [(CRLCanvasRepAccessibility *)self _crlaxRepForConnectionLineMapping];
  uint64_t v4 = [v3 layout];
  uint64_t v5 = [(CRLCanvasRepAccessibility *)self crlaxConnectedConnectionLines];
  uint64_t v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v12 crlaxOppositeConnectedLayoutFrom:v4];
        if (v13
          && [v12 crlaxIsVisuallyPointingAt:v4]
          && [v12 crlaxIsVisuallyPointingAt:v13])
        {
          [v6 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_crlaxBidirectionallyConnectedLayoutsViaMultipleUnidirectionalConnectionLines
{
  uint64_t v3 = [(CRLCanvasRepAccessibility *)self _crlaxLayoutsConnectedByStrictlyInboundConnectionLines];
  uint64_t v4 = +[NSMutableSet setWithSet:v3];

  uint64_t v5 = [(CRLCanvasRepAccessibility *)self _crlaxLayoutsConnectedByStrictlyOutboundConnectionLines];
  uint64_t v6 = [v4 crl_setByIntersectingSet:v5];

  return v6;
}

- (CGRect)_crlaxFrameByKnobPositions
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxKnobAccessibilityElements];
  if ([v2 count])
  {
    uint64_t v3 = [v2 objectAtIndexedSubscript:0];
    [v3 accessibilityFrame];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v2;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        long long v16 = 0;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)v16) accessibilityFrame:(void)v25];
          v33.origin.CGFloat x = v17;
          v33.origin.CGFloat y = v18;
          v33.size.CGFloat width = v19;
          v33.size.CGFloat height = v20;
          v30.origin.CGFloat x = x;
          v30.origin.CGFloat y = y;
          v30.size.CGFloat width = width;
          v30.size.CGFloat height = height;
          CGRect v31 = CGRectUnion(v30, v33);
          CGFloat x = v31.origin.x;
          CGFloat y = v31.origin.y;
          CGFloat width = v31.size.width;
          CGFloat height = v31.size.height;
          long long v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)crlaxMostDirectGroupAccessibilityDescription
{
  char v20 = 0;
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v20);
  if (v20) {
    goto LABEL_13;
  }
  uint64_t v5 = (void *)v4;

  if (v5)
  {
    double v6 = 0;
    while (1)
    {
      char v19 = 0;
      id v7 = [v5 crlaxTarget];
      double v8 = [v7 info];

      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v19);
      if (v19) {
        break;
      }
      uint64_t v11 = (void *)v10;

      id v12 = [v11 accessibilityDescription];

      if ([v12 length]) {
        goto LABEL_10;
      }
      char v18 = 0;
      id v13 = [v5 crlaxParentRep];
      id v14 = objc_opt_class();
      uint64_t v15 = __CRLAccessibilityCastAsSafeCategory(v14, (uint64_t)v13, 1, &v18);
      if (v18) {
        break;
      }
      long long v16 = (void *)v15;

      double v6 = v12;
      uint64_t v5 = v16;
      if (!v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    abort();
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)crlaxLabel
{
  return 0;
}

- (id)crlaxValue
{
  return 0;
}

- (id)crlaxUserInputLabels
{
  return 0;
}

+ (id)CRLAXJumpToFormatOptionsString
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Jump to format options" value:0 table:0];

  return v3;
}

+ (id)CRLAXJumpTextToFormatOptionsString
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Jump to text format options" value:0 table:0];

  return v3;
}

+ (id)CRLAXShowFormatOptionsString
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Show format options" value:0 table:0];

  return v3;
}

+ (id)inboundConnectionsString
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Inbound Connections" value:0 table:0];

  return v3;
}

+ (id)outboundConnectionsString
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Outbound Connections" value:0 table:0];

  return v3;
}

+ (id)bidirectionalConnectionsString
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Bidirectional Connections" value:0 table:0];

  return v3;
}

+ (id)disambiguatedConnectionDescriptionFormat
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"%1$@ (%2$lu of %3$lu) at %4$@" value:0 table:0];

  return v3;
}

- (BOOL)crlaxAllowsCaptionEditing
{
  return self->_crlaxAllowsCaptionEditing;
}

- (NSString)crlaxUploadStatusDescription
{
  return self->_crlaxUploadStatusDescription;
}

- (void).cxx_destruct
{
}

@end