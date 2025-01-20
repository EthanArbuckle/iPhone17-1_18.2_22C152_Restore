@interface THDocumentViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxAllowsToolbarHideRequests;
- (BOOL)_thaxOverscrollToNextChapter;
- (BOOL)_thaxOverscrollToPreviousChapter;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollLeftPage;
- (BOOL)accessibilityScrollLeftPageSupported;
- (BOOL)accessibilityScrollRightPage;
- (BOOL)accessibilityScrollRightPageSupported;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)followLink:(id)a3;
- (BOOL)thaxInFlowMode;
- (BOOL)thaxScrollView:(id)a3 shouldOverrideAccessibilityContentInsetWithValue:(UIEdgeInsets *)a4;
- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3;
- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3;
- (THDocumentRootAccessibility)thaxDocumentRoot;
- (THScrollViewAccessibility)thaxCanvasScrollView;
- (THTSDCanvasViewAccessibility)_thaxCanvasView;
- (THWiOSExpandedViewControllerAccessibility)thaxExpandedViewController;
- (id)thaxCurrentPageNumberUsingPhysicalBookFormatString:(BOOL)a3;
- (id)thaxScrollStatusStringForScrollView:(id)a3;
- (id)thaxSuffixOfScrollStatusStringForScrollView:(id)a3;
- (unint64_t)_thaxLastSeenAbsolutePaginatedPageIndex;
- (unint64_t)thaxChapterCount;
- (unint64_t)thaxCurrentAbsolutePageIndex;
- (unint64_t)thaxCurrentChapter;
- (void)_axClearWeakReferencesToSelf;
- (void)_thaxApplyAccessibilityScrollingInfo;
- (void)_thaxHorizontalOverscrollNextChapter;
- (void)_thaxHorizontalOverscrollPreviousChapter;
- (void)_thaxSetAllowsToolbarHideRequests:(BOOL)a3;
- (void)_thaxSetLastSeenAbsolutePaginatedPageIndex:(unint64_t)a3;
- (void)_thaxShowToolbar;
- (void)_thaxVerticalOverscrollNextChapter;
- (void)_thaxVerticalOverscrollPreviousChapter;
- (void)_tsaxDidUpdateCurrentPage;
- (void)dealloc;
- (void)expandedViewControllerDidDismiss:(id)a3;
- (void)hideToolbarAnimated:(BOOL)a3;
- (void)interactiveCanvasControllerDidStopScrolling:(id)a3;
- (void)p_updateVisibleInfosWithPaddingOptions:(int)a3 force:(BOOL)a4;
- (void)p_voiceOverStatusDidChange;
- (void)thaxDismissExpandedViewController;
- (void)thaxPerformActionAllowingToolbarHideRequestsWithBlock:(id)a3;
- (void)thaxPresentRepExpanded:(id)a3;
- (void)tsaxLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillUnload;
@end

@implementation THDocumentViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THDocumentViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_thaxAllowsToolbarHideRequests
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A55);
}

- (void)_thaxSetAllowsToolbarHideRequests:(BOOL)a3
{
}

- (unint64_t)_thaxLastSeenAbsolutePaginatedPageIndex
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_573A56);
}

- (void)_thaxSetLastSeenAbsolutePaginatedPageIndex:(unint64_t)a3
{
}

- (THScrollViewAccessibility)thaxCanvasScrollView
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THScrollViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"canvasScrollView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxInFlowMode
{
  return [(THDocumentViewControllerAccessibility *)self tsaxBoolValueForKey:@"inFlowMode"];
}

- (unint64_t)thaxCurrentChapter
{
  return (unint64_t)[(THDocumentViewControllerAccessibility *)self tsaxUnsignedIntegerValueForKey:@"currentChapter"];
}

- (unint64_t)thaxChapterCount
{
  v2 = [(THTOCModelAccessibility *)[(THDocumentRootAccessibility *)[(THDocumentViewControllerAccessibility *)self thaxDocumentRoot] thaxTOCModel] thaxTiles];

  return [(NSArray *)v2 count];
}

- (THDocumentRootAccessibility)thaxDocumentRoot
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THDocumentRootAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"documentRoot"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)thaxPerformActionAllowingToolbarHideRequestsWithBlock:(id)a3
{
  if ([(THDocumentViewControllerAccessibility *)self _thaxAllowsToolbarHideRequests])
  {
    char v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    [(THDocumentViewControllerAccessibility *)self _thaxSetAllowsToolbarHideRequests:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(THDocumentViewControllerAccessibility *)self _thaxSetAllowsToolbarHideRequests:0];
  }
}

- (void)thaxPresentRepExpanded:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2817E4;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)thaxDismissExpandedViewController
{
  v2 = [(THDocumentViewControllerAccessibility *)self thaxExpandedViewController];

  [(THWiOSExpandedViewControllerAccessibility *)v2 thaxDismiss];
}

- (void)viewWillUnload
{
  [(THDocumentViewControllerAccessibility *)self _axClearWeakReferencesToSelf];
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v3 viewWillUnload];
}

- (void)dealloc
{
  [(THDocumentViewControllerAccessibility *)self _axClearWeakReferencesToSelf];
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v3 dealloc];
}

- (void)p_voiceOverStatusDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v3 p_voiceOverStatusDidChange];
  if ([+[TSAccessibility sharedInstance] needsAccessibilityElements])
  {
    [(THDocumentViewControllerAccessibility *)self _thaxShowToolbar];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v3 viewDidLoad];
  [(THDocumentViewControllerAccessibility *)self _thaxApplyAccessibilityScrollingInfo];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(THDocumentViewControllerAccessibility *)self _thaxSetLastSeenAbsolutePaginatedPageIndex:[(THDocumentViewControllerAccessibility *)self thaxCurrentAbsolutePageIndex]];
  if (![(THDocumentViewControllerAccessibility *)self thaxInFlowMode]) {
    [(THDocumentViewControllerAccessibility *)self _tsaxDidUpdateCurrentPage];
  }
}

- (void)expandedViewControllerDidDismiss:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v4 expandedViewControllerDidDismiss:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  if (UIAccessibilityIsVoiceOverRunning() && (objc_opt_respondsToSelector() & 1) != 0) {
    [(THDocumentViewControllerAccessibility *)self showToolbarAnimated:0];
  }
}

- (void)hideToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()
    || [(THDocumentViewControllerAccessibility *)self _thaxAllowsToolbarHideRequests])
  {
    v5.receiver = self;
    v5.super_class = (Class)THDocumentViewControllerAccessibility;
    [(THDocumentViewControllerAccessibility *)&v5 hideToolbarAnimated:v3];
  }
}

- (BOOL)followLink:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THDocumentViewControllerAccessibility;
  BOOL v3 = [(THDocumentViewControllerAccessibility *)&v5 followLink:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  return v3;
}

- (void)p_updateVisibleInfosWithPaddingOptions:(int)a3 force:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v5 p_updateVisibleInfosWithPaddingOptions:*(void *)&a3 force:a4];
  [(THTSDCanvasViewAccessibility *)[(THDocumentViewControllerAccessibility *)self _thaxCanvasView] tsaxInvalidateChildrenEventually];
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v5 interactiveCanvasControllerDidStopScrolling:a3];
  objc_super v4 = [(THDocumentViewControllerAccessibility *)self thaxCurrentAbsolutePageIndex];
  if (v4 != (void *)[(THDocumentViewControllerAccessibility *)self _thaxLastSeenAbsolutePaginatedPageIndex])
  {
    [(THDocumentViewControllerAccessibility *)self _thaxSetLastSeenAbsolutePaginatedPageIndex:v4];
    if (![(THDocumentViewControllerAccessibility *)self thaxInFlowMode]) {
      [(THDocumentViewControllerAccessibility *)self _tsaxDidUpdateCurrentPage];
    }
  }
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  [(THDocumentViewControllerAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THDocumentViewControllerAccessibility *)self _thaxApplyAccessibilityScrollingInfo];
  [(THDocumentViewControllerAccessibility *)self _thaxShowToolbar];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THDocumentViewControllerAccessibility;
  if (-[THDocumentViewControllerAccessibility accessibilityScroll:](&v6, "accessibilityScroll:")) {
    return 1;
  }
  if (a3 == 5)
  {
    if ([(THDocumentViewControllerAccessibility *)self thaxInFlowMode]) {
      return [(THDocumentViewControllerAccessibility *)self accessibilityScrollDownPage];
    }
    else {
      return [(THDocumentViewControllerAccessibility *)self accessibilityScrollLeftPage];
    }
  }
  else if (a3 == 6)
  {
    if ([(THDocumentViewControllerAccessibility *)self thaxInFlowMode]) {
      return [(THDocumentViewControllerAccessibility *)self accessibilityScrollUpPage];
    }
    else {
      return [(THDocumentViewControllerAccessibility *)self accessibilityScrollRightPage];
    }
  }
  else
  {
    return 0;
  }
}

- (BOOL)accessibilityScrollLeftPage
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_281D50;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  return 1;
}

- (BOOL)accessibilityScrollRightPage
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_281DD0;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  return 1;
}

- (BOOL)accessibilityScrollDownPage
{
  return [(THDocumentViewControllerAccessibility *)self _thaxOverscrollToNextChapter];
}

- (BOOL)accessibilityScrollUpPage
{
  return [(THDocumentViewControllerAccessibility *)self _thaxOverscrollToPreviousChapter];
}

- (BOOL)accessibilityScrollRightPageSupported
{
  return ![(THDocumentViewControllerAccessibility *)self thaxInFlowMode];
}

- (BOOL)accessibilityScrollLeftPageSupported
{
  return ![(THDocumentViewControllerAccessibility *)self thaxInFlowMode];
}

- (void)_thaxHorizontalOverscrollPreviousChapter
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_281E94;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)_thaxHorizontalOverscrollNextChapter
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_281F10;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)_thaxVerticalOverscrollPreviousChapter
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_281F8C;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)_thaxVerticalOverscrollNextChapter
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_282008;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (BOOL)_thaxOverscrollToPreviousChapter
{
  unint64_t v3 = [(THDocumentViewControllerAccessibility *)self thaxCurrentChapter];
  if (v3)
  {
    if ([(THDocumentViewControllerAccessibility *)self thaxInFlowMode]) {
      [(THDocumentViewControllerAccessibility *)self _thaxVerticalOverscrollPreviousChapter];
    }
    else {
      [(THDocumentViewControllerAccessibility *)self _thaxHorizontalOverscrollPreviousChapter];
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2820C0;
    v5[3] = &unk_456DE0;
    v5[4] = self;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 1.0);
  }
  return v3 != 0;
}

- (BOOL)_thaxOverscrollToNextChapter
{
  unint64_t v3 = [(THDocumentViewControllerAccessibility *)self thaxCurrentChapter];
  objc_super v4 = (char *)[(THDocumentViewControllerAccessibility *)self thaxChapterCount] - 1;
  if (v3 < (unint64_t)v4)
  {
    if ([(THDocumentViewControllerAccessibility *)self thaxInFlowMode]) {
      [(THDocumentViewControllerAccessibility *)self _thaxVerticalOverscrollNextChapter];
    }
    else {
      [(THDocumentViewControllerAccessibility *)self _thaxHorizontalOverscrollNextChapter];
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_2821B4;
    v6[3] = &unk_456DE0;
    v6[4] = self;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v6, 1.0);
  }
  return v3 < (unint64_t)v4;
}

- (void)_axClearWeakReferencesToSelf
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_282254;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)_thaxShowToolbar
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_282308;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
  TSAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return ![(THDocumentViewControllerAccessibility *)self thaxInFlowMode];
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return ![(THDocumentViewControllerAccessibility *)self thaxInFlowMode];
}

- (THWiOSExpandedViewControllerAccessibility)thaxExpandedViewController
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (THWiOSExpandedViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"expandedViewController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)_tsaxDidUpdateCurrentPage
{
  if ([(TSDCanvasViewAccessibility *)[(THDocumentViewControllerAccessibility *)self _thaxCanvasView] tsaxCanMoveAXFocusIntoContent])
  {
    id v3 = [+[TSAccessibility sharedInstance] currentlyFocusedElement];
    NSClassFromString(@"THWPRep");
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 thaxIsPageNumberTextRep])
    {
      UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;
      UIAccessibilityPostNotification(v4, 0);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_2824B4;
      v5[3] = &unk_456DE0;
      [(THTSDCanvasViewAccessibility *)[(THDocumentViewControllerAccessibility *)self _thaxCanvasView] tsaxInvalidateChildrenEventuallyWithCompletion:v5];
    }
  }
}

- (THTSDCanvasViewAccessibility)_thaxCanvasView
{
  id v2 = [self tsaxValueForKey:@"canvasViewController"] tsaxValueForKey:@"canvasView"];
  char v5 = 0;
  id v3 = objc_opt_class();
  result = (THTSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)thaxCurrentPageNumberUsingPhysicalBookFormatString:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(THDocumentViewControllerAccessibility *)self thaxCurrentAbsolutePageIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v6 = v4;
  if (v3) {
    CFStringRef v7 = @"page.number.in.physical.book %@";
  }
  else {
    CFStringRef v7 = @"page.number %@";
  }
  v8 = THAccessibilityLocalizedString((uint64_t)v7);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, TSAccessibilityLocalizedUnsignedInteger(v6 + 1));
}

- (unint64_t)thaxCurrentAbsolutePageIndex
{
  return (unint64_t)[(THDocumentViewControllerAccessibility *)self tsaxUnsignedIntegerValueForKey:@"currentAbsolutePageIndex"];
}

- (id)thaxScrollStatusStringForScrollView:(id)a3
{
  if ([(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"canvasScrollView"] != a3) {
    return 0;
  }
  id v5 = [(THDocumentViewControllerAccessibility *)self thaxCurrentPageNumberUsingPhysicalBookFormatString:0];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  id v7 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:kCFBooleanTrue, @"AXPageScrollShouldSpeakElement", 0];
  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:v7];

  return v8;
}

- (id)thaxSuffixOfScrollStatusStringForScrollView:(id)a3
{
  if ([(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"canvasScrollView"] != a3) {
    return 0;
  }

  return [(THDocumentViewControllerAccessibility *)self thaxCurrentPageNumberUsingPhysicalBookFormatString:1];
}

- (BOOL)thaxScrollView:(id)a3 shouldOverrideAccessibilityContentInsetWithValue:(UIEdgeInsets *)a4
{
  if ([(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"canvasScrollView"] != a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v16) = 0;
    return (char)v16;
  }
  [a3 contentInset];
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  id v15 = [(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"leftOverscrollView"];
  if (v15)
  {
    [v15 bounds];
    double v10 = v10 + CGRectGetWidth(v18);
    id v16 = [(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"rightOverscrollView"];
    if (!v16) {
      goto LABEL_10;
    }
  }
  else
  {
    id v16 = [(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"rightOverscrollView"];
    if (!v16) {
      return (char)v16;
    }
  }
  [v16 bounds];
  double v14 = v14 + CGRectGetWidth(v19);
LABEL_10:
  a4->top = v8;
  a4->left = v10;
  LOBYTE(v16) = 1;
  a4->bottom = v12;
  a4->right = v14;
  return (char)v16;
}

- (void)_thaxApplyAccessibilityScrollingInfo
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_282930;
  v3[3] = &unk_456E38;
  v3[4] = [(THDocumentViewControllerAccessibility *)self tsaxValueForKey:@"canvasScrollView"];
  void v3[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

@end