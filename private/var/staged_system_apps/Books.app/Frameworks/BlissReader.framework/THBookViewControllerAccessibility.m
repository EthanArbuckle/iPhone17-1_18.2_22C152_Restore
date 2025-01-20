@interface THBookViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsGlossaryOpenedFromPopover;
- (BOOL)_thaxShouldPreventToolbarNavbarHiding;
- (BOOL)shouldAutohideNavigationBar;
- (BOOL)thaxIsTOCVisible;
- (IMTheme)_thaxTheme;
- (THDocumentViewControllerAccessibility)thaxDocumentViewController;
- (THTOCViewControllerAccessibility)_thaxSelectedTOCViewController;
- (THToolbarControllerAccessibility)thaxToolbarController;
- (UIBarButtonItem)_thaxBuyButtonItem;
- (UIBarButtonItem)_thaxCloseButtonItem;
- (UIButton)_thaxBookmarkToolbarButton;
- (UIButton)_thaxCloseButton;
- (UIButton)_thaxCloseTOCButton;
- (UIButton)_thaxDisplaySettingsToolbarButton;
- (UIButton)_thaxNotesToolbarButton;
- (UIButton)_thaxSearchToolbarButton;
- (UIButton)_thaxTocGlossaryButton;
- (id)__accessibilityImageNameForButton:(id)a3;
- (id)_thaxFullscreenNotesViewOriginatingButton;
- (id)childViewControllerForStatusBarHidden;
- (id)p_popoverPassthroughViews;
- (id)thaxChapterBrowserController:(id)a3 tocTileModelAtIndex:(unint64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axShowToolbarIfAppropriate;
- (void)_thaxApplyAccessibilityInfo;
- (void)_thaxHideDVCElements;
- (void)_thaxSetFullscreenNotesViewOriginatingButton:(id)a3;
- (void)_thaxSetGlossaryOpenedFromPopover:(BOOL)a3;
- (void)_thaxShowDVCElements;
- (void)_thaxUpdateSpeakScreenColorsForCurrentTheme;
- (void)applyAppearanceStyle:(int64_t)a3;
- (void)donePressedFromToolbar:(id)a3;
- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)hideGlossaryWithDestinationViewController:(id)a3;
- (void)p_applyAccessibilityLabelForButton:(id)a3 withImageNamed:(id)a4;
- (void)p_showDVC;
- (void)p_showDVCAnimated:(BOOL)a3 withLink:(id)a4;
- (void)p_showGlossary;
- (void)removeTOC;
- (void)showFullscreenNotesView:(id)a3;
- (void)showTOC;
- (void)showToolbarAnimated:(BOOL)a3;
- (void)thaxPerformBlock:(id)a3 allowsToolbarHideRequest:(BOOL)a4;
- (void)tsaxLoadAccessibilityInformation;
- (void)updateBookmarkButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THBookViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THBookViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_thaxIsGlossaryOpenedFromPopover
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A53);
}

- (void)_thaxSetGlossaryOpenedFromPopover:(BOOL)a3
{
}

- (id)_thaxFullscreenNotesViewOriginatingButton
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A54);
}

- (void)_thaxSetFullscreenNotesViewOriginatingButton:(id)a3
{
}

- (THDocumentViewControllerAccessibility)thaxDocumentViewController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THDocumentViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"documentViewController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THToolbarControllerAccessibility)thaxToolbarController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THToolbarControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"toolbarController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)thaxPerformBlock:(id)a3 allowsToolbarHideRequest:(BOOL)a4
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  if (a4)
  {
    char v5 = [(THBookViewControllerAccessibility *)self thaxDocumentViewController];
    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_27FDF4;
      v6[3] = &unk_46C3A0;
      v6[4] = v5;
      v6[5] = a3;
      v6[6] = &v7;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
        abort();
      }
    }
  }
  if (!*((unsigned char *)v8 + 24)) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_axShowToolbarIfAppropriate
{
  if ([(THBookViewControllerAccessibility *)self _thaxShouldPreventToolbarNavbarHiding])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_27FEB8;
    v3[3] = &unk_456DE0;
    v3[4] = self;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
      abort();
    }
  }
}

- (id)thaxChapterBrowserController:(id)a3 tocTileModelAtIndex:(unint64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_27FFDC;
  v12 = sub_27FFEC;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_27FFF8;
  v7[3] = &unk_46BE20;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  v7[7] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  char v5 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v5, v4, 1, &v8);
  if ((_BYTE)v8) {
    abort();
  }
  return result;
}

- (BOOL)thaxIsTOCVisible
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2800FC;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(THToolbarControllerAccessibility *)[(THBookViewControllerAccessibility *)self thaxToolbarController] thaxForceSetToolbarHidden:1];
  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v5 viewWillAppear:v3];
  [(THBookViewControllerAccessibility *)self _thaxApplyAccessibilityInfo];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (BOOL)shouldAutohideNavigationBar
{
  if ([(THBookViewControllerAccessibility *)self _thaxShouldPreventToolbarNavbarHiding])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  return [(THBookViewControllerAccessibility *)&v4 shouldAutohideNavigationBar];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(THBookViewControllerAccessibility *)self _axShowToolbarIfAppropriate];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)showTOC
{
  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v3 showTOC];
  [(THBookViewControllerAccessibility *)self _thaxHideDVCElements];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)removeTOC
{
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
}

- (void)donePressedFromToolbar:(id)a3
{
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
}

- (void)showToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(THTOCViewControllerAccessibility *)[(THBookViewControllerAccessibility *)self _thaxSelectedTOCViewController] thaxIntroMediaControllerIsActive]|| ![(THBookViewControllerAccessibility *)self _thaxShouldPreventToolbarNavbarHiding])
  {
    v5.receiver = self;
    v5.super_class = (Class)THBookViewControllerAccessibility;
    [(THBookViewControllerAccessibility *)&v5 showToolbarAnimated:v3];
  }
}

- (void)p_showDVC
{
  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v3 p_showDVC];
  [(THBookViewControllerAccessibility *)self _thaxShowDVCElements];
}

- (void)p_showDVCAnimated:(BOOL)a3 withLink:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v5 p_showDVCAnimated:a3 withLink:a4];
  [(THBookViewControllerAccessibility *)self _thaxShowDVCElements];
}

- (id)__accessibilityImageNameForButton:(id)a3
{
  id v3 = [a3 tsaxValueForKey:@"_accessibilityImagePath"];

  return [v3 lastPathComponent];
}

- (void)p_applyAccessibilityLabelForButton:(id)a3 withImageNamed:(id)a4
{
  if ([a4 hasPrefix:@"list.bullet"])
  {
    CFStringRef v6 = @"toc.and.glossary.button";
LABEL_11:
    uint64_t v7 = THAccessibilityLocalizedString((uint64_t)v6);
    [a3 setAccessibilityLabel:v7];
    return;
  }
  if ([a4 hasPrefix:@"rectangle"])
  {
    CFStringRef v6 = @"annotation.button";
    goto LABEL_11;
  }
  if ([a4 hasPrefix:@"sun.max"])
  {
    CFStringRef v6 = @"brightness.button";
    goto LABEL_11;
  }
  if ([a4 hasPrefix:@"textformat.size"])
  {
    CFStringRef v6 = @"font.size.and.brightness.button";
    goto LABEL_11;
  }
  if ([a4 hasPrefix:@"magnifyingglass"])
  {
    CFStringRef v6 = @"search.button";
    goto LABEL_11;
  }
  if ([a4 hasPrefix:@"bookmark"])
  {
    [a3 setAccessibilityLabel:THAccessibilityLocalizedString(@"bookmark.button")];
    char v8 = THAccessibilityLocalizedString(@"bookmark.button.hint.iOS");
    [a3 setAccessibilityHint:v8];
  }
  else
  {
    if ([a4 hasPrefix:@"chevron.backward"])
    {
      CFStringRef v6 = @"library.button";
      goto LABEL_11;
    }
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No label found for image named: %@", v10, v11, v12, v13, v14, (uint64_t)a4))abort(); {
    }
      }
  }
}

- (void)updateBookmarkButton
{
  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v5 updateBookmarkButton];
  id v3 = [(THBookViewControllerAccessibility *)self tsaxValueForKey:@"bookmarkToolbarButton"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 isSelected])
    {
      [v3 setAccessibilityValue:THAccessibilityLocalizedString(@"bookmark.button.is.bookmarked")];
      unint64_t v4 = (unint64_t)[v3 accessibilityTraits];
      [v3 setAccessibilityTraits:v4 & ~UIAccessibilityTraitSelected];
    }
    else
    {
      [v3 setAccessibilityValue:0];
    }
  }
}

- (void)p_showGlossary
{
  if ([self tsaxBoolValueForKey:@"isPopoverVisible"])[self _thaxSetGlossaryOpenedFromPopover:1];
  v3.receiver = self;
  }
  v3.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v3 p_showGlossary];
  [(THBookViewControllerAccessibility *)self _thaxHideDVCElements];
  [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:0];
}

- (void)hideGlossaryWithDestinationViewController:(id)a3
{
  unsigned int v5 = [(THBookViewControllerAccessibility *)self tsaxBoolValueForKey:@"isGlossaryVisible"];
  v6.receiver = self;
  v6.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v6 hideGlossaryWithDestinationViewController:a3];
  if (v5)
  {
    if ([(THBookViewControllerAccessibility *)self _thaxIsGlossaryOpenedFromPopover]) {
      [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"tocGlossaryButton"]];
    }
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
  [(THBookViewControllerAccessibility *)self _thaxSetGlossaryOpenedFromPopover:0];
}

- (void)showFullscreenNotesView:(id)a3
{
  [(THBookViewControllerAccessibility *)self _thaxSetFullscreenNotesViewOriginatingButton:[+[TSAccessibility sharedInstance] currentlyFocusedElement]];
  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v5 showFullscreenNotesView:a3];
  [(THBookViewControllerAccessibility *)self _thaxHideDVCElements];
}

- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v7 hideFullscreenNotesView:a3 andSearchForText:a4 animated:a5 completion:a6];
  [(THBookViewControllerAccessibility *)self _axShowToolbarIfAppropriate];
  [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:[(THBookViewControllerAccessibility *)self _thaxFullscreenNotesViewOriginatingButton]];
  [(THBookViewControllerAccessibility *)self _thaxSetFullscreenNotesViewOriginatingButton:0];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (id)childViewControllerForStatusBarHidden
{
  objc_super v3 = [(THBookViewControllerAccessibility *)self thaxDocumentViewController];
  if (!UIAccessibilityIsVoiceOverRunning()
    || ![(THDocumentViewControllerAccessibility *)v3 thaxExpandedViewController])
  {
    v5.receiver = self;
    v5.super_class = (Class)THBookViewControllerAccessibility;
    return [(THBookViewControllerAccessibility *)&v5 childViewControllerForStatusBarHidden];
  }
  return v3;
}

- (id)p_popoverPassthroughViews
{
  if ([+[TSAccessibility sharedInstance] needsAccessibilityElements])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  return [(THBookViewControllerAccessibility *)&v4 p_popoverPassthroughViews];
}

- (void)applyAppearanceStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v4 applyAppearanceStyle:a3];
  [(THBookViewControllerAccessibility *)self _thaxUpdateSpeakScreenColorsForCurrentTheme];
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  [(THBookViewControllerAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THBookViewControllerAccessibility *)self _thaxApplyAccessibilityInfo];
}

- (UIButton)_thaxBookmarkToolbarButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"bookmarkToolbarButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_thaxDisplaySettingsToolbarButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"displaySettingsToolbarButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_thaxSearchToolbarButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"searchToolbarButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_thaxNotesToolbarButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"notesToolbarButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_thaxTocGlossaryButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"tocGlossaryButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIBarButtonItem)_thaxBuyButtonItem
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIBarButtonItem *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"buyButtonItem"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_thaxCloseButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"closeButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIBarButtonItem)_thaxCloseButtonItem
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIBarButtonItem *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"closeButtonItem"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_thaxCloseTOCButton
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"closeTOCButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THTOCViewControllerAccessibility)_thaxSelectedTOCViewController
{
  char v13 = 0;
  objc_super v3 = objc_opt_class();
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_27FFDC;
  uint64_t v11 = sub_27FFEC;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_281068;
  v6[3] = &unk_4573D8;
  v6[4] = self;
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  id result = (THTOCViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, v4, 1, &v13);
  if (v13) {
    abort();
  }
  return result;
}

- (IMTheme)_thaxTheme
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id result = (IMTheme *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THBookViewControllerAccessibility *)self tsaxValueForKey:@"theme"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)_thaxApplyAccessibilityInfo
{
  [(UIBarButtonItem *)[(THBookViewControllerAccessibility *)self _thaxCloseButtonItem] setAccessibilityLabel:THAccessibilityLocalizedString(@"library.button")];
  [(UIButton *)[(THBookViewControllerAccessibility *)self _thaxBookmarkToolbarButton] setAccessibilityLabel:THAccessibilityLocalizedString(@"bookmark.button")];
  [(UIButton *)[(THBookViewControllerAccessibility *)self _thaxBookmarkToolbarButton] setAccessibilityHint:THAccessibilityLocalizedString(@"bookmark.button.hint.iOS")];
  [(UIButton *)[(THBookViewControllerAccessibility *)self _thaxDisplaySettingsToolbarButton] setAccessibilityLabel:THAccessibilityLocalizedString(@"font.size.and.brightness.button")];
  [(UIButton *)[(THBookViewControllerAccessibility *)self _thaxSearchToolbarButton] setAccessibilityLabel:THAccessibilityLocalizedString(@"search.button")];
  [(UIButton *)[(THBookViewControllerAccessibility *)self _thaxNotesToolbarButton] setAccessibilityLabel:THAccessibilityLocalizedString(@"annotation.button")];
  [(UIButton *)[(THBookViewControllerAccessibility *)self _thaxTocGlossaryButton] setAccessibilityLabel:THAccessibilityLocalizedString(@"toc.and.glossary.button")];
  [(UIBarButtonItem *)[(THBookViewControllerAccessibility *)self _thaxBuyButtonItem] setAccessibilityLabel:THAccessibilityLocalizedString(@"buy.button")];

  [(THBookViewControllerAccessibility *)self _thaxUpdateSpeakScreenColorsForCurrentTheme];
}

- (void)_thaxShowDVCElements
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THDocumentViewControllerAccessibility *)[(THBookViewControllerAccessibility *)self thaxDocumentViewController] tsaxValueForKey:@"view"], 1, &v5);
  if (v5) {
    abort();
  }
  [v4 setAccessibilityElementsHidden:0];
  [(THBookViewControllerAccessibility *)self _axShowToolbarIfAppropriate];
}

- (void)_thaxHideDVCElements
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THDocumentViewControllerAccessibility *)[(THBookViewControllerAccessibility *)self thaxDocumentViewController] tsaxValueForKey:@"view"], 1, &v5);
  if (v5) {
    abort();
  }
  [v4 setAccessibilityElementsHidden:1];
}

- (void)_thaxUpdateSpeakScreenColorsForCurrentTheme
{
  objc_super v2 = [(THBookViewControllerAccessibility *)self _thaxTheme];
  [+[IMCommonCoreAccessibility sharedInstance] setPreferredSpeakScreenHighlightColor:[(IMTheme *)v2 speakScreenHighlightColor]];
  id v3 = [(IMTheme *)v2 speakScreenUnderlineColor];
  uint64_t v4 = +[IMCommonCoreAccessibility sharedInstance];

  [(IMCommonCoreAccessibility *)v4 setPreferredSpeakScreenUnderlineColor:v3];
}

- (BOOL)_thaxShouldPreventToolbarNavbarHiding
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    return 1;
  }

  return THAccessibilityIsFKAEnabledWithKeyboardAttached();
}

@end