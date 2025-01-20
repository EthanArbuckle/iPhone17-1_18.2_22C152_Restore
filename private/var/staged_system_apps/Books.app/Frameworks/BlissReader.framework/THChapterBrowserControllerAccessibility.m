@interface THChapterBrowserControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsShowingContent;
- (BOOL)_thaxShouldOutputCurrentChapterForPageChange;
- (BOOL)_thaxShouldOutputCurrentChapterForPageThumbnailsScrollStatus;
- (BOOL)introMediaControllerIsActive;
- (id)_axSectionIdentifierOfChapterAtIndex:(unsigned int)a3;
- (id)_axTileModelOfChapterAtIndex:(unsigned int)a3;
- (id)_axTitleOfChapterAtIndex:(unsigned int)a3;
- (id)_thaxBackgroundScrollView;
- (id)_thaxChapterPageControl;
- (id)_thaxPagesScrollView;
- (id)thaxDelegate;
- (id)thaxScrollStatusStringForScrollView:(id)a3;
- (id)thaxTitleForPageIndex:(unint64_t)a3 numberOfPages:(unint64_t)a4;
- (unint64_t)_axNumberOfRegularChapters;
- (void)_axClearWeakReferencesToSelf;
- (void)_axDidChangePageUsingChapterPageControl:(BOOL)a3;
- (void)_axDidInitiatePullThrough;
- (void)_axRefreshShowingContentFlag;
- (void)_thaxSetShouldOutputCurrentChapterForPageChange:(BOOL)a3;
- (void)_thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:(BOOL)a3;
- (void)_thaxSetShowingContent:(BOOL)a3;
- (void)dealloc;
- (void)introMediaControllerShouldAdvancePast:(id)a3;
- (void)p_backgroundScrollingDidEnd;
- (void)p_pageThumbScrollingDidEnd;
- (void)p_releaseOutlets;
- (void)p_thumbnailAnimationDidStopWithContext:(id)a3;
- (void)p_updatePageThumbnails:(BOOL)a3;
- (void)relinquishIntroMediaViewController;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)setBackgroundScrollView:(id)a3;
- (void)setChapterIndex:(unsigned int)a3;
- (void)setIntroMediaViewController:(id)a3;
- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4;
- (void)setPagesScrollView:(id)a3;
- (void)takeChapterIndexFrom:(id)a3;
- (void)thaxFollowLink:(id)a3;
- (void)thaxScrollView:(id)a3 scrollElementToVisible:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillUnload;
- (void)willTransitionFromChapterIndex:(unsigned int)a3;
@end

@implementation THChapterBrowserControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THChapterBrowserController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_thaxShouldOutputCurrentChapterForPageThumbnailsScrollStatus
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A60);
}

- (void)_thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:(BOOL)a3
{
}

- (BOOL)_thaxShouldOutputCurrentChapterForPageChange
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A61);
}

- (void)_thaxSetShouldOutputCurrentChapterForPageChange:(BOOL)a3
{
}

- (BOOL)_thaxIsShowingContent
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A62);
}

- (void)_thaxSetShowingContent:(BOOL)a3
{
}

- (id)thaxDelegate
{
  return [(THChapterBrowserControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

- (void)thaxFollowLink:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_28BDB0;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)setBackgroundScrollView:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_28BE68;
  v6[3] = &unk_456F28;
  v6[4] = [(THChapterBrowserControllerAccessibility *)self _thaxBackgroundScrollView];
  v6[5] = a3;
  v6[6] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  v5.receiver = self;
  v5.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v5 setBackgroundScrollView:a3];
}

- (void)setPagesScrollView:(id)a3
{
  id v5 = [(THChapterBrowserControllerAccessibility *)self _thaxPagesScrollView];
  [a3 setAccessibilityContainerType:0];
  [a3 setAccessibilityLabel:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_28C004;
  v8[3] = &unk_456DE0;
  v8[4] = v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    goto LABEL_4;
  }
  [a3 setAccessibilityContainerType:4];
  [a3 setAccessibilityLabel:THAccessibilityLocalizedString(@"page.thumbnails")];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_28C054;
  v7[3] = &unk_456E38;
  v7[4] = a3;
  v7[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
LABEL_4:
  }
    abort();
  v6.receiver = self;
  v6.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v6 setPagesScrollView:a3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 viewDidLoad];
  id v3 = [(THChapterBrowserControllerAccessibility *)self _thaxChapterPageControl];
  [v3 setIsAccessibilityElement:1];
  [v3 thaxSetDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 viewWillAppear:a3];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_28C1C4;
  v3[3] = &unk_457278;
  BOOL v4 = a3;
  v3[4] = self;
  [(THChapterBrowserControllerAccessibility *)self _axPerformBlockAffectingMediaControllerState:v3];
}

- (void)willTransitionFromChapterIndex:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 willTransitionFromChapterIndex:*(void *)&a3];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)setChapterIndex:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 setChapterIndex:*(void *)&a3];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)setIntroMediaViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 setIntroMediaViewController:a3];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility setIntroMediaViewController:showIt:](&v6, "setIntroMediaViewController:showIt:", a3);
  if (v4) {
    [(THChapterBrowserControllerAccessibility *)self _axHideToolbar];
  }
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 introMediaControllerShouldAdvancePast:a3];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
  [(THChapterBrowserControllerAccessibility *)self _thaxSetShouldOutputCurrentChapterForPageChange:1];
}

- (void)relinquishIntroMediaViewController
{
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v3 relinquishIntroMediaViewController];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)takeChapterIndexFrom:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 takeChapterIndexFrom:a3];
  [(THChapterBrowserControllerAccessibility *)self _axDidChangePageUsingChapterPageControl:1];
}

- (void)p_backgroundScrollingDidEnd
{
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v3 p_backgroundScrollingDidEnd];
  [(THChapterBrowserControllerAccessibility *)self _axDidChangePageUsingChapterPageControl:0];
}

- (void)p_releaseOutlets
{
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v3 p_releaseOutlets];
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)p_pageThumbScrollingDidEnd
{
  unsigned __int8 v3 = [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"mPullThroughInProgress"];
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 p_pageThumbScrollingDidEnd];
  if ((v3 & 1) == 0
    && [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"mPullThroughInProgress"])
  {
    [(THChapterBrowserControllerAccessibility *)self _axDidInitiatePullThrough];
  }
  [(THChapterBrowserControllerAccessibility *)self _axRefreshShowingContentFlag];
}

- (void)p_thumbnailAnimationDidStopWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v4 p_thumbnailAnimationDidStopWithContext:a3];
  if (UIAccessibilityIsVoiceOverRunning()) {
    [(THChapterBrowserControllerAccessibility *)self _axShowToolbar];
  }
}

- (void)p_updatePageThumbnails:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v3 p_updatePageThumbnails:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(THChapterBrowserControllerAccessibility *)self _thaxPagesScrollView] == a3)
  {
    unsigned __int8 v7 = [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"mPullThroughInProgress"];
    v8.receiver = self;
    v8.super_class = (Class)THChapterBrowserControllerAccessibility;
    [(THChapterBrowserControllerAccessibility *)&v8 scrollViewDidEndDragging:a3 willDecelerate:v4];
    if ((v7 & 1) == 0)
    {
      if ([(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"mPullThroughInProgress"])[(THChapterBrowserControllerAccessibility *)self _axDidInitiatePullThrough]; {
    }
      }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THChapterBrowserControllerAccessibility;
    [(THChapterBrowserControllerAccessibility *)&v8 scrollViewDidEndDragging:a3 willDecelerate:v4];
  }
}

- (BOOL)introMediaControllerIsActive
{
  THChapterBrowserControllerAccessibility *v3 = [self thaxDelegate].tsaxValueForKey:@"visibleViewController"];
  v5.receiver = self;
  v5.super_class = (Class)THChapterBrowserControllerAccessibility;
  BOOL result = [(THChapterBrowserControllerAccessibility *)&v5 introMediaControllerIsActive];
  if (v3 != self) {
    return 0;
  }
  return result;
}

- (void)viewWillUnload
{
  [(THChapterBrowserControllerAccessibility *)self _axClearWeakReferencesToSelf];
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v3 viewWillUnload];
}

- (void)dealloc
{
  [(THChapterBrowserControllerAccessibility *)self _axClearWeakReferencesToSelf];
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  [(THChapterBrowserControllerAccessibility *)&v3 dealloc];
}

- (id)thaxTitleForPageIndex:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  if (![(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"hasIntroPage"])
  {
LABEL_4:
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    id v7 = [[self _axSectionIdentifierOfChapterAtIndex:a3] integerValue];
    if ((uint64_t)v7 < 1)
    {
      v13 = 0;
    }
    else
    {
      uint64_t v8 = (uint64_t)v7;
      int64_t v9 = [(THChapterBrowserControllerAccessibility *)self _axNumberOfRegularChapters];
      if (v8 <= v9)
      {
        uint64_t v14 = v9;
        v15 = THAccessibilityLocalizedString(@"chapter.number.of.number %@ %@");
        id v16 = TSAccessibilityLocalizedUnsignedInteger(v8);
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16, TSAccessibilityLocalizedUnsignedInteger(v14));
      }
      else
      {
        v10 = THAccessibilityLocalizedString(@"chapter.number %@");
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, TSAccessibilityLocalizedUnsignedInteger(v8), v24);
      }
      v13 = v11;
    }
    id v17 = [(THChapterBrowserControllerAccessibility *)self _axTitleOfChapterAtIndex:a3];
    return __TSAccessibilityStringForVariables(1, v13, v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  }
  if (a3)
  {
    --a3;
    --a4;
    goto LABEL_4;
  }

  return THAccessibilityLocalizedString(@"introduction.media");
}

- (void)_axRefreshShowingContentFlag
{
  uint64_t v3 = [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"introMediaControllerIsActive"] ^ 1;

  [(THChapterBrowserControllerAccessibility *)self _thaxSetShowingContent:v3];
}

- (void)_axDidChangePageUsingChapterPageControl:(BOOL)a3
{
  unsigned int v5 = [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"hasIntroPage"];
  unsigned int v6 = [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"introMediaControllerIsActive"];
  if ([(THChapterBrowserControllerAccessibility *)self _thaxShouldOutputCurrentChapterForPageChange])
  {
    UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, [-[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl") accessibilityValue]);
    [(THChapterBrowserControllerAccessibility *)self _thaxSetShouldOutputCurrentChapterForPageChange:0];
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if ((v5 & v6) == 1) {
      [(THChapterBrowserControllerAccessibility *)self _axHideToolbar];
    }
    else {
      [(THChapterBrowserControllerAccessibility *)self _axShowToolbar];
    }
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  if (v5)
  {
    if ((([(THChapterBrowserControllerAccessibility *)self _thaxIsShowingContent] | v6) & 1) == 0
      && !a3)
    {
      id v7 = [[self thaxDelegate] tsaxValueForKey:@"closeButton"];
      UIAccessibilityPostNotification(TSAccessibilityMoveToElementNotification, v7);
    }
    [(THChapterBrowserControllerAccessibility *)self _thaxSetShowingContent:v6 ^ 1];
  }
  objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"previousChapterViewController"), "tsaxValueForKey:", @"interactiveCanvasController"), "tsaxValueForKey:", @"canvasView"), "tsaxInvalidateChildrenEventually");
  objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"chapterViewController"), "tsaxValueForKey:", @"interactiveCanvasController"), "tsaxValueForKey:", @"canvasView"), "tsaxInvalidateChildrenEventually");
  objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"nextChapterViewController"), "tsaxValueForKey:", @"interactiveCanvasController"), "tsaxValueForKey:", @"canvasView"), "tsaxInvalidateChildrenEventually");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_28CB58;
  v8[3] = &unk_456DE0;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
}

- (void)_axDidInitiatePullThrough
{
}

- (id)_axTileModelOfChapterAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(THChapterBrowserControllerAccessibility *)self thaxDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v5 chapterBrowserController:self tocTileModelAtIndex:v3];
}

- (id)_axTitleOfChapterAtIndex:(unsigned int)a3
{
  id v3 = [(THChapterBrowserControllerAccessibility *)self _axTileModelOfChapterAtIndex:*(void *)&a3];

  return [v3 tsaxValueForKey:@"frontTitleText"];
}

- (id)_axSectionIdentifierOfChapterAtIndex:(unsigned int)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_28CD08;
  v11 = sub_28CD18;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_28CD24;
  v5[3] = &unk_46C4A0;
  unsigned int v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  id v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (unint64_t)_axNumberOfRegularChapters
{
  id v3 = [(THChapterBrowserControllerAccessibility *)self thaxDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  unsigned int v4 = [v3 chapterCountForChapterBrowserController:self];
  if (!v4) {
    return 0;
  }
  unsigned int v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  do
  {
    id v8 = [[self _axSectionIdentifierOfChapterAtIndex:v7] integerValue];
    if ((id)(v6 + 1) != v8)
    {
      if (v6) {
        return v6;
      }
      id v8 = 0;
    }
    uint64_t v7 = (v7 + 1);
    unint64_t v6 = (unint64_t)v8;
  }
  while (v5 != v7);
  return v6;
}

- (void)_axClearWeakReferencesToSelf
{
  [self _thaxChapterPageControl].thaxSetDelegate:0;
  [self->_thaxPagesScrollView thaxSetScrollingDelegate:0];
  id v3 = [(THChapterBrowserControllerAccessibility *)self _thaxBackgroundScrollView];

  [v3 thaxSetScrollingDelegate:0];
}

- (id)thaxScrollStatusStringForScrollView:(id)a3
{
  if ([(THChapterBrowserControllerAccessibility *)self _thaxPagesScrollView] == a3)
  {
    [a3 frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    [a3 contentOffset];
    CGFloat v11 = v10;
    id v12 = [a3 subviews];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v13)
    {
      id v14 = v13;
      v15 = 0;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v18 frame];
          v45.origin.x = v19;
          v45.origin.y = v20;
          v45.size.width = v21;
          v45.size.height = v22;
          v44.origin.y = 0.0;
          v44.origin.x = v11;
          v44.size.width = v7;
          v44.size.height = v9;
          if (CGRectIntersectsRect(v44, v45))
          {
            NSClassFromString(@"THPageThumbnailView");
            if (objc_opt_isKindOfClass())
            {
              if (!v15) {
                v15 = objc_opt_new();
              }
              [v15 addObject:v18];
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    if ((unint64_t)[v15 count] < 2)
    {
      unsigned int v5 = 0;
    }
    else
    {
      [v15 sortUsingSelector:NSSelectorFromString(@"accessibilityCompareGeometry:")];
      char v37 = 0;
      v25 = objc_opt_class();
      Class v26 = __TSAccessibilityCastAsSafeCategory(v25, (uint64_t)[v15 firstObject], 1, &v37);
      if (v37
        || (Class v27 = v26,
            char v37 = 0,
            v28 = objc_opt_class(),
            Class v29 = __TSAccessibilityCastAsSafeCategory(v28, (uint64_t)[v15 lastObject], 1, &v37),
            v37))
      {
        abort();
      }
      unsigned int v5 = +[NSString stringWithFormat:THAccessibilityLocalizedString(@"thumbnails.number.to.number %@ %@"), [(objc_class *)v27 thaxLocalizedPageNumber], [(objc_class *)v29 thaxLocalizedPageNumber]];
    }

    if ([(THChapterBrowserControllerAccessibility *)self _thaxShouldOutputCurrentChapterForPageThumbnailsScrollStatus])
    {
      id v30 = [[self _thaxChapterPageControl] accessibilityValue];
      unsigned int v5 = __TSAccessibilityStringForVariables(1, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v5);
      [(THChapterBrowserControllerAccessibility *)self _thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:0];
    }
    return v5;
  }
  if ([(THChapterBrowserControllerAccessibility *)self _thaxBackgroundScrollView] != a3) {
    return 0;
  }
  id v23 = [(THChapterBrowserControllerAccessibility *)self _thaxChapterPageControl];

  return [v23 accessibilityValue];
}

- (void)thaxScrollView:(id)a3 scrollElementToVisible:(id)a4
{
  if ([(THChapterBrowserControllerAccessibility *)self _thaxPagesScrollView] == a3)
  {
    NSClassFromString(@"THPageThumbnailView");
    if (objc_opt_isKindOfClass())
    {
      if (TSAccessibilityShouldPerformValidationChecks())
      {
        if ([a4 accessibilityElementIsFocused])
        {
          int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"%@ was supposed to receive the accessibilityScrollToVisible message before becoming the focused element.", v8, v9, v10, v11, v12, (uint64_t)a4))abort(); {
        }
          }
      }
      [a3 frame];
      double v14 = v13;
      uint64_t v64 = 0;
      v65 = (double *)&v64;
      uint64_t v66 = 0x3010000000;
      v67 = &unk_41622E;
      CGPoint v68 = CGPointZero;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v58 = sub_28D644;
      v59 = &unk_46C4E8;
      id v60 = a3;
      v61 = &v64;
      double v62 = v13;
      uint64_t v63 = v15;
      uint64_t v16 = sub_28D644((uint64_t)v57);
      id v17 = [(NSArray *)v16 indexOfObject:a4];
      if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
      uint64_t v18 = [(NSArray *)v16 count];
      if ((unint64_t)v18 >= 3
        && (unint64_t)v17 <= 1
        && objc_msgSend(-[NSArray objectAtIndex:](v16, "objectAtIndex:", v17 + 1), "accessibilityElementIsFocused")&& (objc_msgSend(-[NSArray objectAtIndex:](v16, "objectAtIndex:", 0), "frame"), CGRectGetMinX(v69) < v65[4]))
      {
        uint64_t v19 = 0;
        double v20 = -1.0;
        int v21 = 1;
      }
      else
      {
        if ((unint64_t)v18 < 3
          || v17 < v18 - 2
          || !objc_msgSend(-[NSArray objectAtIndex:](v16, "objectAtIndex:", v17 - 1), "accessibilityElementIsFocused")|| (objc_msgSend(-[NSArray lastObject](v16, "lastObject"), "frame"), CGRectGetMaxX(v70) <= v14 + v65[4]))
        {
LABEL_7:
          _Block_object_dispose(&v64, 8);
          return;
        }
        int v21 = 0;
        double v20 = 1.0;
        uint64_t v19 = 2;
      }
      [a3 contentOffset];
      double v23 = v22;
      double v25 = v24 + v20 * (v14 * 0.4);
      [a3 setContentOffset:0 animated:v25];
      Class v26 = v58((uint64_t)v57);
      unsigned int v27 = [a4 tsaxUnsignedIntValueForKey:@"chapterIndex"];
      v28 = (char *)v27;
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x3052000000;
      v54 = sub_28CD08;
      v55 = sub_28CD18;
      uint64_t v56 = 0;
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_28D8A8;
      v46[3] = &unk_46C510;
      v46[5] = &v47;
      v46[6] = v27;
      v46[4] = &v51;
      [(NSArray *)v26 enumerateObjectsWithOptions:v19 usingBlock:v46];
      Class v29 = v48;
      if (*((unsigned char *)v48 + 24)) {
        goto LABEL_29;
      }
      if (v27)
      {
        id v30 = [self _thaxChapterPageControl].thaxNumberOfPages;
        unsigned int v31 = [(THChapterBrowserControllerAccessibility *)self tsaxBoolValueForKey:@"hasIntroPage"];
        if (v30) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
        Class v29 = v48;
        *((unsigned char *)v48 + 24) = &v30[-v32 - 1] == v28;
        if (&v30[-v32 - 1] == v28) {
          goto LABEL_29;
        }
        uint64_t v33 = (void *)v52[5];
        if (!v33) {
          goto LABEL_29;
        }
        [v33 frame];
        if (v21)
        {
          CGFloat MinX = CGRectGetMinX(*(CGRect *)&v34);
          Class v29 = v48;
          if (MinX <= v25) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v34);
        Class v29 = v48;
        if (MaxX >= v14 + v25)
        {
LABEL_29:
          if (*((unsigned char *)v29 + 24))
          {
            long long v39 = (void *)v52[5];
            if (v39)
            {
              [v39 frame];
              if (v21) {
                double v44 = CGRectGetMinX(*(CGRect *)&v40);
              }
              else {
                double v44 = CGRectGetMaxX(*(CGRect *)&v40) - v14;
              }
              [a3 setContentOffset:0 animated:v44];
            }
          }
          _Block_object_dispose(&v47, 8);
          _Block_object_dispose(&v51, 8);
          goto LABEL_7;
        }
      }
LABEL_28:
      *((unsigned char *)v29 + 24) = 1;
      goto LABEL_29;
    }
  }
}

- (id)_thaxChapterPageControl
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THChapterBrowserControllerAccessibility *)self tsaxValueForKey:@"chapterPageControl"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxPagesScrollView
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THChapterBrowserControllerAccessibility *)self tsaxValueForKey:@"pagesScrollView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxBackgroundScrollView
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THChapterBrowserControllerAccessibility *)self tsaxValueForKey:@"backgroundScrollView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end