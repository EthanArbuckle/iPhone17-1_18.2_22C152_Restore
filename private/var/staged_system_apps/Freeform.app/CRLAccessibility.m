@interface CRLAccessibility
+ (BOOL)isFullKeyboardAccessEnabledWithKeyboardAttached;
+ (BOOL)isUsingAccessibilityTextSize;
+ (BOOL)isVoiceControlEnabled;
+ (BOOL)isVoiceOverOrSwitchControlEnabled;
+ (BOOL)shouldRemoveMovementAnimations;
+ (NSString)iOSBoardViewControllerScrollViewIdentifier;
+ (id)currentlyFocusedElement;
+ (id)sharedInstance;
- (BOOL)_isKeyboardVisible;
- (BOOL)_systemVersionIsGreaterOrEqualTo:(id)a3;
- (BOOL)accessibilitySupportLoaded;
- (BOOL)announcementsSuspended;
- (BOOL)isFocusedElementAccessibleDescendantOfElement:(id)a3;
- (BOOL)isKeyboardVisible;
- (BOOL)isQuickSpeakEnabled;
- (BOOL)quickSpeakSupportLoaded;
- (BOOL)shouldFakeQuickSpeakAlwaysSpeaking;
- (BOOL)shouldPreventFocusingCanvasResponderElementOnScreenChange;
- (BOOL)supportsAdvancedTextSearchExperience;
- (BOOL)supportsCharts;
- (BOOL)supportsTableEditing;
- (CGRect)_keyboardFrame;
- (CGRect)keyboardFrame;
- (id)cachedFirstElementForUpcomingPageTurn;
- (id)cachedFirstElementForUpcomingScreenChange;
- (id)canvasViewDescription;
- (id)canvasViewHelp;
- (id)preferencesDomain;
- (unint64_t)firstElementForUpcomingPageTurnResetCount;
- (unint64_t)firstElementForUpcomingScreenChangeResetCount;
- (void)_keyboardWasShown:(id)a3;
- (void)_keyboardWillBeHidden:(id)a3;
- (void)_setKeyboardFrame:(CGRect)a3;
- (void)_setKeyboardVisible:(BOOL)a3;
- (void)addExtraSafeCategoryNamesToCollection:(id)a3;
- (void)addSafeCategoryNamesToCollection:(id)a3;
- (void)dealloc;
- (void)handlePostingAnnouncement:(id)a3 sender:(id)a4 priority:(int)a5 sound:(id)a6;
- (void)loadAccessibilitySupport;
- (void)loadExtraAccessibilitySupport;
- (void)loadQuickSpeakSupport;
- (void)performExtraValidation;
- (void)performValidation;
- (void)preventFocusingCanvasResponderElementOnScreenChangeForInterval:(double)a3;
- (void)resumeAnnouncements;
- (void)setAccessibilitySupportLoaded:(BOOL)a3;
- (void)setCachedFirstElementForUpcomingPageTurn:(id)a3;
- (void)setCachedFirstElementForUpcomingScreenChange:(id)a3;
- (void)setFirstElementForUpcomingPageTurn:(id)a3;
- (void)setFirstElementForUpcomingPageTurnResetCount:(unint64_t)a3;
- (void)setFirstElementForUpcomingScreenChange:(id)a3;
- (void)setFirstElementForUpcomingScreenChangeResetCount:(unint64_t)a3;
- (void)setQuickSpeakSupportLoaded:(BOOL)a3;
- (void)setShouldFakeQuickSpeakAlwaysSpeaking:(BOOL)a3;
- (void)setShouldPreventFocusingCanvasResponderElementOnScreenChange:(BOOL)a3;
- (void)suspendAnnouncements;
- (void)unloadExtraAccessibilitySupport;
@end

@implementation CRLAccessibility

- (BOOL)quickSpeakSupportLoaded
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9838);
}

- (void)setQuickSpeakSupportLoaded:(BOOL)a3
{
}

- (BOOL)shouldFakeQuickSpeakAlwaysSpeaking
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9839);
}

- (void)setShouldFakeQuickSpeakAlwaysSpeaking:(BOOL)a3
{
}

- (BOOL)_isKeyboardVisible
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A983A);
}

- (void)_setKeyboardVisible:(BOOL)a3
{
}

- (CGRect)_keyboardFrame
{
  double AssociatedCGRect = __CRLAccessibilityGetAssociatedCGRect(self, &unk_1016A983B);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = AssociatedCGRect;
  return result;
}

- (void)_setKeyboardFrame:(CGRect)a3
{
}

- (id)cachedFirstElementForUpcomingScreenChange
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A983C);
}

- (void)setCachedFirstElementForUpcomingScreenChange:(id)a3
{
}

- (unint64_t)firstElementForUpcomingScreenChangeResetCount
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_1016A983D);
}

- (void)setFirstElementForUpcomingScreenChangeResetCount:(unint64_t)a3
{
}

- (id)cachedFirstElementForUpcomingPageTurn
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A983E);
}

- (void)setCachedFirstElementForUpcomingPageTurn:(id)a3
{
}

- (unint64_t)firstElementForUpcomingPageTurnResetCount
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_1016A983F);
}

- (void)setFirstElementForUpcomingPageTurnResetCount:(unint64_t)a3
{
}

- (BOOL)shouldPreventFocusingCanvasResponderElementOnScreenChange
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9840);
}

- (void)setShouldPreventFocusingCanvasResponderElementOnScreenChange:(BOOL)a3
{
}

- (BOOL)_systemVersionIsGreaterOrEqualTo:(id)a3
{
  return [(NSString *)[+[UIDevice currentDevice] systemVersion] compare:a3 options:64] != NSOrderedAscending;
}

- (void)_keyboardWasShown:(id)a3
{
  [(CRLAccessibility *)self _setKeyboardVisible:1];
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", UIKeyboardFrameEndUserInfoKey), "CGRectValue");

  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:");
}

- (void)_keyboardWillBeHidden:(id)a3
{
  [(CRLAccessibility *)self _setKeyboardVisible:0];
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;

  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, y, width, height);
}

- (id)preferencesDomain
{
  return @"com.apple.Accessibility";
}

- (void)performExtraValidation
{
  __CRLAccessibilityValidateIsKindOfClass(@"_UIShareInvitationRemoteViewController", @"_UIRemoteViewController");
  __CRLAccessibilityValidateClassMethodComplete(@"_UIRemoteViewController", @"__shouldHostRemoteTextEffectsWindow", "B", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityFrameForSorting", "{CGRect={CGPoint=dd}{CGSize=dd}}", v7, v8, v9, v10, v11, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityHasTextOperations", "B", v12, v13, v14, v15, v16, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityLoadAccessibilityInformation", "v", v17, v18, v19, v20, v21, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityOverridesInstructionsHint", "B", v22, v23, v24, v25, v26, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityParentView", "@", v27, v28, v29, v30, v31, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityPerformCustomActionWithIdentifier:", "B", v32, v33, v34, v35, v36, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityScrollToVisible", "B", v37, v38, v39, v40, v41, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityTextOperationAction:", "B", v42, v43, v44, v45, v46, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityTextViewTextOperationResponder", "@", v47, v48, v49, v50, v51, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityTextOperations", "@", v52, v53, v54, v55, v56, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"accessibilityMenuActions", "@", v57, v58, v59, v60, v61, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"NSObject", @"accessibilityEditOperationAction:", "B", v62, v63, v64, v65, v66, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(@"PHAsset", @"filename", "@", v67, v68, v69, v70, v71, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"PHAsset", @"mediaType", "q", v72, v73, v74, v75, v76, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"PHAsset", @"mediaSubtypes", "Q", v77, v78, v79, v80, v81, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIApplication", @"_accessibilitySoftwareKeyboardActive", "B", v82, v83, v84, v85, v86, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIApplication", @"_unswizzledTargetInChainForAction:sender:", "@", v87, v88, v89, v90, v91, ":");
  __CRLAccessibilityValidateIsKindOfClass(@"UILayoutContainerView", @"UIView");
  __CRLAccessibilityValidateInstanceMethodComplete(@"UILayoutContainerView", @"delegate", "@", v92, v93, v94, v95, v96, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UINavigationController", @"didShowViewController:animated:", "v", v97, v98, v99, v100, v101, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(@"UINavigationController", @"navigationTransitionView", "@", v102, v103, v104, v105, v106, 0);
  __CRLAccessibilityValidateIvarType(@"UINavigationController", "_topPalette", "_UINavigationControllerPalette");
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"_accessibilityScrollStatusPrefersVertical", "B", v107, v108, v109, v110, v111, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"accessibilityApplyScrollContent:sendScrollStatus:animated:", "v", v112, v113, v114, v115, v116, "{CGPoint=dd}");
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"accessibilityShouldEnableScrollIndicator:", "B", v117, v118, v119, v120, v121, "@");
  __CRLAccessibilityValidateIvarType(@"UISlider", "_visualElement", "UIView<_UISliderVisualElement>");
  __CRLAccessibilityValidateInstanceMethodComplete(@"_UISlideriOSVisualElement", @"_setValue:andSendAction:", "v", v122, v123, v124, v125, v126, "f");
  __CRLAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityChildren", "@", v127, v128, v129, v130, v131, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityClearChildren", "v", v132, v133, v134, v135, v136, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityRetrieveTableViewCellText", "@", v137, v138, v139, v140, v141, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityRetrieveTableViewIvarsText", "@", v142, v143, v144, v145, v146, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityTableViewCellSubclassShouldExist", "B", v147, v148, v149, v150, v151, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_tableView", "@", v152, v153, v154, v155, v156, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIView", @"_accessibilityViewController", "@", v157, v158, v159, v160, v161, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIView", @"_accessibleSubviews", "@", v162, v163, v164, v165, v166, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIWindow", @"firstResponder", "@", v167, v168, v169, v170, v171, 0);
  __CRLAccessibilityValidateClassMethod(@"UICalloutBar", @"sharedCalloutBar");
  __CRLAccessibilityValidateInstanceMethod(@"NSObject", @"_accessibilityShouldUseViewHierarchyForFindingScrollParent");
  __CRLAccessibilityValidateInstanceMethod(@"UIApplication", @"_accessibilityElementFirst:last:forFocus:parameters:");
  __CRLAccessibilityValidateInstanceMethod(@"UIApplication", @"_accessibilityMainWindow");
  __CRLAccessibilityValidateInstanceMethod(@"UIDimmingView", @"passthroughViews");
  __CRLAccessibilityValidateInstanceMethod(@"UIPopoverController", @"dimmingViewWasTapped:");
  __CRLAccessibilityValidateInstanceMethod(@"UIScrollView", @"_accessibilityScrollAnimationDurationDelay");
  __CRLAccessibilityValidateInstanceMethod(@"UIScrollView", @"_accessibilityScrollStatus");
  __CRLAccessibilityValidateInstanceMethod(@"UIScrollView", @"_accessibilityScrollStatusFormatString");
  __CRLAccessibilityValidateInstanceMethod(@"UITableViewCell", @"editControlWasClicked:");
  __CRLAccessibilityValidateInstanceMethod(@"UIView", @"_accessibleSubviews");
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"_setContentOffset:duration:animationCurve:", "v", v172, v173, v174, v175, v176, "{CGPoint=dd}");
}

- (void)addExtraSafeCategoryNamesToCollection:(id)a3
{
  [a3 addObject:@"CRLNSObjectAccessibility_iOS"];
  [a3 addObject:@"CRLUIApplicationAccessibility"];
  [a3 addObject:@"CRLUIButtonAccessibility"];
  [a3 addObject:@"CRLUICollectionViewCellAccessibility"];
  [a3 addObject:@"CRLUILabelAccessibility"];
  [a3 addObject:@"CRLUILayoutContainerViewAccessibility"];
  [a3 addObject:@"CRLUIMenuControllerAccessibility"];
  [a3 addObject:@"CRLUINavigationItemAccessibility"];
  [a3 addObject:@"CRLUIPageControlAccessibility"];
  [a3 addObject:@"CRLUIAccessibilityPickerComponentAccessibility"];
  [a3 addObject:@"CRLUIReferenceLibraryViewControllerAccessibility"];
  [a3 addObject:@"CRLUIScrollViewAccessibility"];
  [a3 addObject:@"CRLUISliderAccessibility"];
  [a3 addObject:@"CRLUITableViewCellAccessibility"];
  [a3 addObject:@"CRLUITextEffectsRemoteViewAccessibility"];
  [a3 addObject:@"CRLUIViewAccessibility"];
  [a3 addObject:@"CRLUIViewControllerAccessibility"];
  [a3 addObject:@"CRLUIWindowAccessibility"];
  [a3 addObject:@"CRLiOSBoardViewControllerAccessibility"];
  [a3 addObject:@"CRLToolsChooserViewControllerAccessibility"];
  [a3 addObject:@"CRLShapeLayoutAccessibility"];
  [a3 addObject:@"CRLCheckableTableViewCellAccessibility"];
  [a3 addObject:@"CRLDisclosureTableViewCellAccessibility"];
  [a3 addObject:@"CRLDoubleSegmentedControlTableViewCellAccessibility"];
  [a3 addObject:@"CRLiOSCanvasViewControllerAccessibility"];
  [a3 addObject:@"CRLSegmentedControlTableViewCellAccessibility"];
  [a3 addObject:@"CRLSwitchTableViewCellAccessibility"];
  [a3 addObject:@"CRLTickedSliderAccessibility"];
  [a3 addObject:@"CRLTextInputResponderAccessibility"];
  [a3 addObject:@"CRLScrollViewAccessibility"];
  [a3 addObject:@"CRLEditableTextViewCellAccessibility"];
  [a3 addObject:@"CRLPopoverBasedViewControllerAccessibility"];
  [a3 addObject:@"CRLStepperAccessibility"];
  [a3 addObject:@"CRLNavigationControllerAccessibility"];

  [a3 addObject:@"CRLSegmentedControlAccessibility"];
}

- (void)loadExtraAccessibilitySupport
{
  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"_keyboardWasShown:" name:UIKeyboardDidShowNotification object:0];

  [(NSNotificationCenter *)v3 addObserver:self selector:"_keyboardWillBeHidden:" name:UIKeyboardWillHideNotification object:0];
}

- (void)unloadExtraAccessibilitySupport
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:UIKeyboardDidShowNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;

  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, y, width, height);
}

- (void)handlePostingAnnouncement:(id)a3 sender:(id)a4 priority:(int)a5 sound:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  if (![(CRLAccessibility *)self announcementsSuspended])
  {
    if (a6) {
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a6);
    }
    if ([a3 length])
    {
      if (v7 == 5)
      {
        id argument = a3;
      }
      else
      {
        id v16 = [objc_alloc((Class)NSNumber) initWithInt:v7];
        id v17 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v16, @"UIAccessibilityTokenAnnouncementPriority", 0];

        id argument = [objc_alloc((Class)NSAttributedString) initWithString:a3 attributes:v17];
      }
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, argument);
    }
    else
    {
      int ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
      if (!a6)
      {
        if (ShouldPerformValidationChecks)
        {
          int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Nil or empty announcement requested without sound played.", v11, v12, v13, v14, v15, v18))abort(); {
        }
          }
      }
    }
  }
}

- (void)loadQuickSpeakSupport
{
  if (![(CRLAccessibility *)self quickSpeakSupportLoaded]
    && NSClassFromString(@"AXQuickSpeak"))
  {
    [(CRLAccessibility *)self setQuickSpeakSupportLoaded:1];
    if (CRLAccessibilityShouldPerformValidationChecks()) {
      __CRLAccessibilityValidateInstanceMethod(@"AXQuickSpeak", @"isSpeaking");
    }
    CRLAccessibilityInstallSafeCategory(@"CRLAXQuickSpeak");
  }
}

- (BOOL)isQuickSpeakEnabled
{
  BOOL v3 = [(CRLAccessibility *)self quickSpeakSupportLoaded];
  if (v3)
  {
    BOOL v4 = [(CRLAccessibility *)self shouldFakeQuickSpeakAlwaysSpeaking];
    [(CRLAccessibility *)self setShouldFakeQuickSpeakAlwaysSpeaking:1];
    unsigned __int8 v5 = [(CRLAccessibility *)self crlaxBoolValueForKey:@"_accessibilityShouldShowPauseBubble"];
    [(CRLAccessibility *)self setShouldFakeQuickSpeakAlwaysSpeaking:v4];
    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isKeyboardVisible
{
  return [(CRLAccessibility *)self _isKeyboardVisible];
}

- (CGRect)keyboardFrame
{
  [(CRLAccessibility *)self _keyboardFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isFocusedElementAccessibleDescendantOfElement:(id)a3
{
  char v9 = 0;
  id v4 = [a3 crlaxValueForKey:@"_accessibleSubviews"];
  double v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v9);
  if (v9) {
    abort();
  }
  uint64_t v7 = (void *)v6;
  if (+[CRLAccessibility currentlyFocusedElement] == a3) {
    return 1;
  }
  else {
    return [v7 containsObject:[CRLAccessibility currentlyFocusedElement]];
  }
}

- (void)setFirstElementForUpcomingScreenChange:(id)a3
{
  if ([(CRLAccessibility *)self cachedFirstElementForUpcomingScreenChange] != a3)
  {
    [(CRLAccessibility *)self setCachedFirstElementForUpcomingScreenChange:a3];
    [(CRLAccessibility *)self setFirstElementForUpcomingScreenChangeResetCount:(char *)[(CRLAccessibility *)self firstElementForUpcomingScreenChangeResetCount]+ 1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100384DB0;
    v5[3] = &unk_1014F2F60;
    v5[4] = self;
    CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 5.0);
  }
}

- (void)setFirstElementForUpcomingPageTurn:(id)a3
{
  if ([(CRLAccessibility *)self cachedFirstElementForUpcomingPageTurn] != a3)
  {
    [(CRLAccessibility *)self setCachedFirstElementForUpcomingPageTurn:a3];
    [(CRLAccessibility *)self setFirstElementForUpcomingPageTurnResetCount:(char *)[(CRLAccessibility *)self firstElementForUpcomingPageTurnResetCount]+ 1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100384ED0;
    v5[3] = &unk_1014F2F60;
    v5[4] = self;
    CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 5.0);
  }
}

- (void)preventFocusingCanvasResponderElementOnScreenChangeForInterval:(double)a3
{
  if (!qword_1016A9848)
  {
    qword_1016A9848 = [[CRLAccessibilityTimer alloc] initWithTargetSerialQueue:&_dispatch_main_q];
    [(id)qword_1016A9848 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  [(CRLAccessibility *)self setShouldPreventFocusingCanvasResponderElementOnScreenChange:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10038500C;
  v5[3] = &unk_1014F2F60;
  v5[4] = self;
  [(id)qword_1016A9848 afterDelay:v5 processBlock:a3];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003C4A88;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A98C8 != -1) {
    dispatch_once(&qword_1016A98C8, block);
  }
  double v2 = (void *)qword_1016A98C0;

  return v2;
}

- (void)dealloc
{
  if [(CRLAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityExtras]&& (objc_opt_respondsToSelector())
  {
    [(CRLAccessibility *)self unloadExtraAccessibilitySupport];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLAccessibility;
  [(CRLAccessibility *)&v3 dealloc];
}

+ (BOOL)isUsingAccessibilityTextSize
{
  double v2 = +[UITraitCollection currentTraitCollection];
  objc_super v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

+ (BOOL)isVoiceControlEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

+ (BOOL)isFullKeyboardAccessEnabledWithKeyboardAttached
{
  int v2 = _AXSFullKeyboardAccessEnabled();
  if (v2) {
    LOBYTE(v2) = GSEventIsHardwareKeyboardAttached() != 0;
  }
  return v2;
}

+ (BOOL)isVoiceOverOrSwitchControlEnabled
{
  if (+[CRLAccessibility isVoiceOverEnabled]) {
    return 1;
  }

  return +[CRLAccessibility isSwitchControlEnabled];
}

+ (BOOL)shouldRemoveMovementAnimations
{
  if (+[CRLAccessibility isVoiceOverEnabled]) {
    return 1;
  }

  return +[CRLAccessibility isPreferCrossFadeTransitionsEnabled];
}

+ (id)currentlyFocusedElement
{
  return UIAccessibilityFocusedElement(UIAccessibilityNotificationVoiceOverIdentifier);
}

- (void)performValidation
{
  int v2 = (_UNKNOWN **)qword_1016A98D0;
  if (!qword_1016A98D0)
  {
    qword_1016A98D0 = (uint64_t)&off_10155CF20;

    int v2 = &off_10155CF20;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(NSString **)(*((void *)&v24 + 1) + 8 * i);
        Class v9 = NSClassFromString(v8);
        if (v9)
        {
          Class v10 = v9;
          if ([(objc_class *)v9 conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityValidator])
          {
            [(objc_class *)v10 performValidations];
            if ([(objc_class *)v10 conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityValidatorExtras])[(objc_class *)v10 performPlatformSpecificValidations]; {
            continue;
            }
          }
          if (!CRLAccessibilityShouldPerformValidationChecks()) {
            continue;
          }
          int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          int v17 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"%@ must conform to the CRLAccessibilityValidator protocol", v19, v20, v21, v22, v23, (uint64_t)v8);
        }
        else
        {
          if (!CRLAccessibilityShouldPerformValidationChecks()) {
            continue;
          }
          int v11 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          int v17 = __CRLAccessibilityHandleValidationErrorWithDescription(v11, 0, @"Couldn't find validator class %@", v12, v13, v14, v15, v16, (uint64_t)v8);
        }
        if (v17) {
          abort();
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
  id v3 = a3;
  [v3 addObject:@"CRLCALayerAccessibility"];
  [v3 addObject:@"CRLFindReplaceControllerAccessibility"];
  [v3 addObject:@"CRLInteractiveCanvasControllerAccessibility"];
  [v3 addObject:@"CRLUndoManagerAccessibility"];
  [v3 addObject:@"CRLAngleGradientFillAccessibility"];
  [v3 addObject:@"CRLAudioRepAccessibility"];
  [v3 addObject:@"CRLBoardItemAccessibility"];
  [v3 addObject:@"CRLMovieItemAccessibility"];
  [v3 addObject:@"CRLBoardItemSelectionAccessibility"];
  [v3 addObject:@"CRLBrushStrokeAccessibility"];
  [v3 addObject:@"CRLCalligraphyStrokeAccessibility"];
  [v3 addObject:@"CRLCanvasAccessibility"];
  [v3 addObject:@"CRLCanvasEditorHelperAccessibility"];
  [v3 addObject:@"CRLCanvasInteractiveCanvasControllerAccessibility"];
  [v3 addObject:@"CRLCanvasKnobAccessibility"];
  [v3 addObject:@"CRLCanvasLayerAccessibility"];
  [v3 addObject:@"CRLCanvasLayoutAccessibility"];
  [v3 addObject:@"CRLCanvasLayoutGeometryAccessibility"];
  [v3 addObject:@"CRLCanvasMovieKnobAccessibility"];
  [v3 addObject:@"CRLCanvasRepAccessibility"];
  [v3 addObject:@"CRLUnknownRepAccessibility"];
  [v3 addObject:@"CRLCanvasKnobTrackerAccessibility"];
  [v3 addObject:@"CRLCanvasResizeKnobTrackerAccessibility"];
  [v3 addObject:@"CRLShapeControlKnobTrackerAccessibility"];
  [v3 addObject:@"CRLShapeConnectionLineKnobTrackerAccessibility"];
  [v3 addObject:@"CRLConnectionLineKnobTrackerAccessibility"];
  [v3 addObject:@"CRLShapeLineSegmentKnobTrackerAccessibility"];
  [v3 addObject:@"CRLCanvasViewAccessibility"];
  [v3 addObject:@"CRLColorFillAccessibility"];
  [v3 addObject:@"CRLConnectionLinePathSourceAccessibility"];
  [v3 addObject:@"CRLConnectionLineRepAccessibility"];
  [v3 addObject:@"CRLConnectionLineAbstractLayoutAccessibility"];
  [v3 addObject:@"CRLContainerRepAccessibility"];
  [v3 addObject:@"CRLDropShadowAccessibility"];
  [v3 addObject:@"CRLEditorControllerAccessibility"];
  [v3 addObject:@"CRLFillAccessibility"];
  [v3 addObject:@"CRLFreehandDrawingRepAccessibility"];
  [v3 addObject:@"CRLGradientFillAccessibility"];
  [v3 addObject:@"CRLGradientFillStopAccessibility"];
  [v3 addObject:@"CRLGroupItemAccessibility"];
  [v3 addObject:@"CRLGroupRepAccessibility"];
  [v3 addObject:@"CRLImageFillAccessibility"];
  [v3 addObject:@"CRLImageItemAccessibility"];
  [v3 addObject:@"CRLImageLayoutAccessibility"];
  [v3 addObject:@"CRLImageRepAccessibility"];
  [v3 addObject:@"CRLItemGeometryAccessibility"];
  [v3 addObject:@"CRLKeyboardMovementManipulatorAccessibility"];
  [v3 addObject:@"CRLLineEndAccessibility"];
  [v3 addObject:@"CRLMovieItemAccessibility"];
  [v3 addObject:@"CRLMovieRepAccessibility"];
  [v3 addObject:@"CRLPathSourceAccessibility"];
  [v3 addObject:@"CRLScalarPathSourceAccessibility"];
  [v3 addObject:@"CRLShadowAccessibility"];
  [v3 addObject:@"CRLShapeItemAccessibility"];
  [v3 addObject:@"CRLShapeRepAccessibility"];
  [v3 addObject:@"CRLSmartStrokeAccessibility"];
  [v3 addObject:@"CRLStrokeAccessibility"];
  [v3 addObject:@"CRLStrokePatternAccessibility"];
  [v3 addObject:@"CRLAVPlayerControllerAccessibility"];
  [v3 addObject:@"CRLRulerUnitsAccessibility"];
  [v3 addObject:@"CRLSelectionPathAccessibility"];
  [v3 addObject:@"CRLSubselectionAccessibility"];
  [v3 addObject:@"CRLColumnAccessibility"];
  [v3 addObject:@"CRLHyperlinkFieldAccessibility"];
  [v3 addObject:@"CRLLineSpacingAccessibility"];
  [v3 addObject:@"CRLTabsAccessibility"];
  [v3 addObject:@"CRLTextEditorAccessibility"];
  [v3 addObject:@"CRLTextInteractiveCanvasControllerAccessibility"];
  [v3 addObject:@"CRLTextLayoutAccessibility"];
  [v3 addObject:@"CRLTextRepAccessibility"];
  [v3 addObject:@"CRLWPAttachmentAccessibility"];
  [v3 addObject:@"CRLWPSearchReferenceAccessibility"];
  [v3 addObject:@"CRLWPSelectionAccessibility"];
  [v3 addObject:@"CRLWPShapeItemAccessibility"];
  [v3 addObject:@"CRLWPShapeRepAccessibility"];
  [v3 addObject:@"CRLWPSmartFieldAccessibility"];
  [v3 addObject:@"CRLWPStorageAccessibility"];
  [v3 addObject:@"CRLBezierPathAccessibility"];
  [v3 addObject:@"CRLColorAccessibility"];
}

- (void)loadAccessibilitySupport
{
  if (![(CRLAccessibility *)self accessibilitySupportLoaded])
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      [(CRLAccessibility *)self performValidation];
      if ([(CRLAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityExtras])
      {
        if (objc_opt_respondsToSelector()) {
          [(CRLAccessibility *)self performExtraValidation];
        }
      }
    }
    id v3 = (id)objc_opt_new();
    -[CRLAccessibility addSafeCategoryNamesToCollection:](self, "addSafeCategoryNamesToCollection:");
    if [(CRLAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityExtras]&& (objc_opt_respondsToSelector())
    {
      [(CRLAccessibility *)self addExtraSafeCategoryNamesToCollection:v3];
    }
    CRLAccessibilityInstallSafeCategories(v3);
    if [(CRLAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityExtras]&& (objc_opt_respondsToSelector())
    {
      [(CRLAccessibility *)self loadExtraAccessibilitySupport];
    }
    [(CRLAccessibility *)self setAccessibilitySupportLoaded:1];
  }
}

- (BOOL)supportsCharts
{
  return 1;
}

- (BOOL)supportsTableEditing
{
  return 1;
}

- (BOOL)supportsAdvancedTextSearchExperience
{
  return 0;
}

- (id)canvasViewDescription
{
  int v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Canvas" value:0 table:0];

  return v3;
}

- (id)canvasViewHelp
{
  int v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Format, move, and resize items within the Canvas", 0, 0 value table];

  return v3;
}

- (void)suspendAnnouncements
{
  self->_announcementsSuspended = 1;
}

- (void)resumeAnnouncements
{
  self->_announcementsSuspended = 0;
}

+ (NSString)iOSBoardViewControllerScrollViewIdentifier
{
  return (NSString *)@"iOS Board View Scroll View";
}

- (BOOL)announcementsSuspended
{
  return self->_announcementsSuspended;
}

- (BOOL)accessibilitySupportLoaded
{
  return self->_accessibilitySupportLoaded;
}

- (void)setAccessibilitySupportLoaded:(BOOL)a3
{
  self->_accessibilitySupportLoaded = a3;
}

@end