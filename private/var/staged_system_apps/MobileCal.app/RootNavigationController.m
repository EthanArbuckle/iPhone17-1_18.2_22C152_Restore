@interface RootNavigationController
+ (BOOL)_diagnosticsAvailable;
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)_inboxTitleForNotificationCount:(unint64_t)a3;
+ (void)recursiveAnimationRemove:(id)a3;
- (BOOL)_calendarsButtonHasBackground;
- (BOOL)_canChangeSelectedDate;
- (BOOL)_canChangeSelectedEvent;
- (BOOL)_canPerformDeleteKeyCommand;
- (BOOL)_canPerformDuplicateKeyCommand;
- (BOOL)_canSkipViewHierarchyRebuildingWhenTransitioningFromOldCollection:(id)a3 toNewCollection:(id)a4;
- (BOOL)_containsViewControllerRequiringNavBarVisibilityRestoration;
- (BOOL)_dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (BOOL)_isAddEventPopoverDisplayed;
- (BOOL)_isCurrentlyDraggingEvent;
- (BOOL)_isTextEditingInProgress;
- (BOOL)_isThisTheOnlyConnectedScene;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)_nodeContainsViewControllersRequiringTeardown:(id)a3;
- (BOOL)_shouldShowListViewInModeSwitcher;
- (BOOL)_updateCalendarButtonError;
- (BOOL)_updateCalendarButtonSpinner;
- (BOOL)_viewControllerRequiresSystemPresentation:(id)a3;
- (BOOL)_viewControllerTreeIsEligibleForJournalingConsideration:(id)a3;
- (BOOL)_willKeyCommandChangeSelectedDate:(SEL)a3;
- (BOOL)_willKeyCommandChangeSelectedEvent:(SEL)a3;
- (BOOL)allSelectedEventsIndividuallyRepresented;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canManagePresentationStyle;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)dismissPresentedViewController;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (BOOL)extendedLaunchFinished;
- (BOOL)isDateVisible:(id)a3;
- (BOOL)isTransitioningTraitCollection;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldDonateTomorrowActivity;
- (BOOL)shouldHandleCanPerformActionForSelector:(SEL)a3;
- (BOOL)shouldSaveSelectedEvent;
- (BOOL)showingOverriddenToolbarItems;
- (BOOL)wantsManagement;
- (CUIKCalendarModel)model;
- (Class)_classRepresentingViewType:(int64_t)a3 forTraitCollection:(id)a4;
- (Class)classForStackBaseContainerForCurrentTraits;
- (NSDate)lastActiveTime;
- (PaletteView)paletteView;
- (RootNavigationController)initWithModel:(id)a3 targetWindow:(id)a4;
- (UIBarButtonItem)addEventBarButtonItem;
- (UIBarButtonItem)calendarsBarButtonItem;
- (UIBarButtonItem)dividedMonthToggleBarButtonItem;
- (UIBarButtonItem)inboxBarButtonItem;
- (UIBarButtonItem)searchBarButtonItem;
- (UIBarButtonItem)todayBarButtonItem;
- (UINavigationController)reportProblemNavigationController;
- (UISegmentedControl)viewSwitcher;
- (UIWindow)window;
- (ViewSwitcherLayoutHandler)viewSwitcherLayoutHandler;
- (double)_dateLabelMaxWidth;
- (double)_viewSwitcherSegmentWidth;
- (id)_calendarsButtonConfiguration;
- (id)_compactMonthDividedListSwitchBarButtonItem;
- (id)_contactForCurrentIdentity;
- (id)_doneBlock;
- (id)_doneBlockWithCompletion:(id)a3;
- (id)_ensureStackBaseCalendarViewControllerContainerIsPresent;
- (id)_higherScopeCompactCalendarViewControllerRelativeTo:(id)a3;
- (id)_listViewSwitchBarButtonItem;
- (id)_meContact;
- (id)_navBarDateStringFromDate:(id)a3 includingMonth:(BOOL)a4 includingYear:(BOOL)a5 format:(int64_t)a6;
- (id)_navBarStringYearFontForTraitCollection:(id)a3 useSmallerSize:(BOOL)a4 bold:(BOOL)a5;
- (id)_now;
- (id)_popToViewControllerSatisfying:(id)a3;
- (id)_presentedEditor;
- (id)_switcherFontOfSize:(double)a3 isSemibold:(BOOL)a4;
- (id)_topPresentedController;
- (id)_tornDownJournalOfShownViewControllers;
- (id)_viewSwitcherLabelStrings;
- (id)_viewSwitcherSegmentedControl;
- (id)bestDateForNewEvent;
- (id)calendarModel;
- (id)calendarsButtonTitle;
- (id)compactMonthMenu;
- (id)delegatesMenu;
- (id)ekui_futureTraitCollection;
- (id)generateCurrentListToggleBarButtonItemMenu;
- (id)imageForCurrentDayViewMode;
- (id)imageForDayViewMode:(int64_t)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)pasteboardManager;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (id)pushCalendarViewControllerWithViewType:(int64_t)a3 andDate:(id)a4;
- (id)resetToDayView;
- (id)resetToMonthView;
- (id)resetToMonthViewSplit:(BOOL)a3;
- (id)resetToWeekView;
- (id)resetToYearView;
- (id)showInboxAnimated:(BOOL)a3;
- (id)showInboxAnimated:(BOOL)a3 completion:(id)a4;
- (id)showSearchAnimated:(BOOL)a3 becomeFirstResponder:(BOOL)a4 completion:(id)a5;
- (id)topMainViewControllerContainer;
- (id)traitCollection;
- (id)undoManager;
- (int64_t)_preferredCompactSingleDayView;
- (int64_t)_preferredPostTransitionViewFromTraitCollection:(id)a3 toTraitCollection:(id)a4 currentViewType:(int64_t)a5;
- (int64_t)_viewTypeRepresentedByViewSwitcherIndex:(unint64_t)a3;
- (int64_t)activeWidthSizeClass;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)currentDayViewMode;
- (int64_t)currentViewType;
- (unint64_t)_viewSwitcherIndexRepresentingViewType:(int64_t)a3;
- (unint64_t)_viewSwitcherNumSegments;
- (unint64_t)numberOfNotifications;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addButtonsToNavigationBarForViewController:(id)a3;
- (void)_adjustNavBarVisibilityAfterTraitCollectionChange;
- (void)_cancelPressedWhileInReportProblemView;
- (void)_configureViewSwitcherShowingViewController:(id)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_createLeftFixedSpaceBarItemIfNeeded;
- (void)_delegatesChanged:(id)a3;
- (void)_dismissReportProblemController;
- (void)_focusModeConfigurationChanged:(id)a3;
- (void)_forceInboxButtonCreationIfNeeded;
- (void)_identityChanged:(id)a3;
- (void)_initializeCalendarsButton;
- (void)_invalidateNavBarDateStringCache;
- (void)_meContactChangedNoticationReceived:(id)a3;
- (void)_monthWeekScaleChanged:(id)a3;
- (void)_notificationCountChanged:(id)a3;
- (void)_performCustomRotationAnimationForMainWindowWithTransitionCoordinator:(id)a3;
- (void)_presentAdaptiveModalPopoverViewController:(id)a3 relativeToBarButtonItem:(id)a4 permittedArrowDirections:(unint64_t)a5 contentSize:(CGSize)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)_presentAdaptiveModalViewController:(id)a3 withPresentationStyleOverride:(int64_t)a4 relativeToBarButtonItem:(id)a5 withSourceView:(id)a6 sourceRect:(CGRect)a7 permittedArrowDirections:(unint64_t)a8 contentSize:(CGSize)a9 passThroughViews:(id)a10 animated:(BOOL)a11 completion:(id)a12;
- (void)_replayJournal:(id)a3 withRootVC:(id)a4 topMainVC:(id)a5;
- (void)_restoreLastUsedCalendarViewType;
- (void)_saveUserActivityInfo:(id)a3;
- (void)_searchPressed;
- (void)_selectNextEvent;
- (void)_selectPreviousEvent;
- (void)_selectTodayForMainViewControllerContainer:(id)a3 animated:(BOOL)a4;
- (void)_selectedDateChanged:(id)a3;
- (void)_setCurrentDateLabelString:(id)a3;
- (void)_setNavigationStackOfMainViewControllersForTraitsTransitionFromTraitCollection:(id)a3 toNewTraitCollection:(id)a4 withPreTransitionViewType:(int64_t)a5 withPreferredPostTransitionViewType:(int64_t)a6;
- (void)_setNeedsUserActivityUpdate;
- (void)_setSegmentWidthsForViewSwitcher:(id)a3;
- (void)_setUpInitialUserActivityUpdate;
- (void)_showAddSubscribedCalendarWithURL:(id)a3;
- (void)_showCalendarsAnimated:(BOOL)a3 completion:(id)a4;
- (void)_showDebugReportProblemViewController;
- (void)_showNextDateComponentUnitAnimated:(BOOL)a3;
- (void)_showNowForMainViewControllerContainer:(id)a3 animated:(BOOL)a4;
- (void)_showPreviousDateComponentUnitAnimated:(BOOL)a3;
- (void)_showSearchController:(id)a3 withSearchBar:(id)a4 animated:(BOOL)a5 becomeFirstResponder:(BOOL)a6 completion:(id)a7;
- (void)_switchToView:(int64_t)a3;
- (void)_updateAddEventButtonEnabledness;
- (void)_updateAfterExtendedLaunch:(id)a3;
- (void)_updateBackButtonToDate:(id)a3 container:(id)a4;
- (void)_updateCalendarButtonAccessory;
- (void)_updateCalendarsButtonConfiguration;
- (void)_updateCalendarsButtonMenuProvider;
- (void)_updateCalendarsButtonTitle;
- (void)_updateDateLabelFrame;
- (void)_updateFilterLabelAnimate:(BOOL)a3;
- (void)_updateInboxBarButtonItem;
- (void)_updateInteractivePopAllowed;
- (void)_updateLeftFixedSpaceBarButtonItemWidthWithViewController:(id)a3 targetWindowSize:(CGSize)a4;
- (void)_updateNavbarStringForNewStateAfterWindowSizeChange;
- (void)_updatePaletteStateWithViewController:(id)a3;
- (void)_updateUserActivity;
- (void)_updateViewSwitcherFont;
- (void)_updateViewSwitcherSegmentWidthsAfterWindowSizeChange;
- (void)_viewSwitcherSelectedValueChanged:(id)a3;
- (void)addEventPressed;
- (void)addToolbarButtonItemsWithViewController:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)calendarsPressed;
- (void)continueSearchWithTerm:(id)a3 animated:(BOOL)a4 removeViewControllersIncapableOfSearchIfNeeded:(BOOL)a5;
- (void)controllerAppearedTipsConfiguration;
- (void)copy:(id)a3;
- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)didBecomeActive;
- (void)didEnterBackground;
- (void)displayIntegrationAlert:(id)a3;
- (void)doCrossfadeAnimationWithCurrentScreenContents;
- (void)doCrossfadeAnimationWithNavigationViewContents;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (void)handleCloseKeyCommand;
- (void)handleDayKeyCommand;
- (void)handleDeleteKeyCommand;
- (void)handleDismissSplashScreenKeyCommand;
- (void)handleDuplicateKeyCommand;
- (void)handleGoToNextDateComponentUnitCommand;
- (void)handleGoToPreviousDateComponentUnitCommand;
- (void)handleMonthKeyCommand;
- (void)handleNewEventKeyCommand;
- (void)handleRefreshKeyCommand;
- (void)handleSearchKeyCommand;
- (void)handleSelectNextEventCommand;
- (void)handleSelectNextOccurrenceCommand;
- (void)handleSelectPreviousEventCommand;
- (void)handleSelectPreviousOccurrenceCommand;
- (void)handleTodayKeyCommand;
- (void)handleURL:(id)a3 context:(id)a4;
- (void)handleViewAvailabilityCommand;
- (void)handleWeekKeyCommand;
- (void)handleYearKeyCommand;
- (void)inboxPressed;
- (void)inboxViewControllerWantsShowEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5;
- (void)listTogglePressed;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)openCalendarsLinkActionWithCompletion:(id)a3;
- (void)openInboxLinkActionWithCompletion:(id)a3;
- (void)openSearchLinkActionWithCompletion:(id)a3;
- (void)paste:(id)a3;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)performUIAction:(id)a3 block:(id)a4 cancelBlock:(id)a5;
- (void)presentAdaptiveModalPopoverViewController:(id)a3 relativeToSourceRect:(CGRect)a4 withSourceView:(id)a5 passThroughViews:(id)a6 permittedArrowDirections:(unint64_t)a7 contentSize:(CGSize)a8 animated:(BOOL)a9 completion:(id)a10;
- (void)presentAdaptiveModalViewController:(id)a3;
- (void)presentAdaptiveModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentModalViewController:(id)a3 withTransition:(int)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)recursiveAnimationRemoveForSmallLayers:(id)a3;
- (void)recursiveBuildJournal:(id)a3 ofViewControllerSubtree:(id)a4 stopCondition:(id)a5;
- (void)reportProblemViewControllerDidFinish:(id)a3;
- (void)restoreEventDetailViewControllers:(id)a3;
- (void)searchResultsViewController:(id)a3 didSelectEvent:(id)a4;
- (void)selectTodayWithTrigger:(int64_t)a3 animated:(BOOL)a4;
- (void)setAvatarViewVisible:(BOOL)a3;
- (void)setCalendarsBarButtonItem:(id)a3;
- (void)setDividedMonthToggleBarButtonItem:(id)a3;
- (void)setInboxBarButtonItem:(id)a3;
- (void)setLastActiveTime:(id)a3;
- (void)setModel:(id)a3;
- (void)setNavBarStringFromDate:(id)a3 includeMonth:(BOOL)a4 includeYear:(BOOL)a5;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setNumberOfNotifications:(unint64_t)a3;
- (void)setPaletteView:(id)a3;
- (void)setReportProblemNavigationController:(id)a3;
- (void)setShowingOverriddenToolbarItems:(BOOL)a3;
- (void)setTodayBarButtonItem:(id)a3;
- (void)setViewSwitcher:(id)a3;
- (void)setViewSwitcherLayoutHandler:(id)a3;
- (void)setWindow:(id)a3;
- (void)setupPresentationControllerIfStyleIsPopover:(int64_t)a3 barButtonItem:(id)a4 passThroughViews:(id)a5 permittedArrowDirections:(unint64_t)a6 sourceRect:(CGRect)a7 sourceView:(id)a8 viewController:(id)a9;
- (void)showAddEventAnimated:(BOOL)a3;
- (void)showAddEventAnimated:(BOOL)a3 completion:(id)a4;
- (void)showAddEventAnimated:(BOOL)a3 fromBarButtonItem:(id)a4;
- (void)showAddEventAnimated:(BOOL)a3 fromBarButtonItem:(id)a4 withTitle:(id)a5 startDate:(id)a6 exactStartDate:(id)a7 endDate:(id)a8 location:(id)a9 suggestionKey:(id)a10 allDay:(BOOL)a11 completion:(id)a12;
- (void)showCalendar:(id)a3;
- (void)showCalendarsAnimated:(BOOL)a3 completion:(id)a4;
- (void)showContactWithIdentifier:(id)a3;
- (void)showDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5;
- (void)showDate:(id)a3 animated:(BOOL)a4;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showEventWithIdentifier:(id)a3 isSearchResult:(BOOL)a4 date:(id)a5 context:(id)a6;
- (void)showNewEvent:(id)a3;
- (void)todayPressed;
- (void)toggleDayViewMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackButtonToDate:(id)a3;
- (void)updateCompactMonthMenu;
- (void)updateCurrentIdentity;
- (void)updateDayViewModeContainer;
- (void)updateDeviceOrientationForJumpToTodayTip;
- (void)updateListToggleBarButtonItem;
- (void)updateNavigationBarButtonItemsWithViewController:(id)a3;
- (void)updateSelectedDateForJumpToTodayTip;
- (void)updateShouldDisplayJumpToTodayTip;
- (void)updateToolbarItemsWithViewController:(id)a3;
- (void)userActivityWillSave:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)weekViewController:(id)a3 didEditEvent:(id)a4 creationMethod:(unint64_t)a5;
- (void)weekViewController:(id)a3 didSelectEvent:(id)a4;
- (void)willEnterForeground;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RootNavigationController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v4 viewDidLoad];
  [(RootNavigationController *)self _restoreLastUsedCalendarViewType];
}

- (void)_setUpInitialUserActivityUpdate
{
  if (self->_userActivityNeedsUpdate)
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AEE10;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_selectTodayForMainViewControllerContainer:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 shouldPushNextLevelViewControllerWhenTodayIsVisible]) {
    [v6 showTodayAnimated:v4];
  }
  else {
    [(RootNavigationController *)self _showNowForMainViewControllerContainer:v6 animated:v4];
  }
}

- (unint64_t)numberOfNotifications
{
  if (!self->_hasLoadedInitialNotificationCount)
  {
    dispatch_time_t v3 = [(RootNavigationController *)self model];
    self->_numberOfNotifications = (unint64_t)[v3 eventNotificationsForCurrentIdentityCount];

    self->_hasLoadedInitialNotificationCount = 1;
  }
  return self->_numberOfNotifications;
}

- (void)updateToolbarItemsWithViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 allowsOverriddenToolbarItems])
    {
      [(RootNavigationController *)self addToolbarButtonItemsWithViewController:v4];
      goto LABEL_13;
    }
  }
  else
  {
    if ([(RootNavigationController *)self isToolbarHidden]) {
      goto LABEL_13;
    }
    v5 = [v4 toolbarItems];
    id v6 = v5;
    if (v5 && [v5 count])
    {

      goto LABEL_13;
    }
    v7 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Hiding toolbar due to there being no toolbar items for view controller: [%@]", (uint8_t *)&v8, 0xCu);
    }
  }
  if (([(RootNavigationController *)self isToolbarHidden] & 1) == 0)
  {
    [(RootNavigationController *)self setToolbarHidden:1 animated:1];
    [(RootNavigationController *)self setShowingOverriddenToolbarItems:0];
  }
LABEL_13:
}

- (void)_meContactChangedNoticationReceived:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006698;
  v3[3] = &unk_1001D41E8;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)updateNavigationBarButtonItemsWithViewController:(id)a3
{
  id v4 = a3;
  if ([v4 allowsOverriddenRightNavigationBarItems])
  {
    [(RootNavigationController *)self _addButtonsToNavigationBarForViewController:v4];
    [(RootNavigationController *)self _updateAddEventButtonEnabledness];
    if ((id)[(RootNavigationController *)self activeWidthSizeClass] == (id)2)
    {
      [(RootNavigationController *)self _createLeftFixedSpaceBarItemIfNeeded];
      if (!self->_currentDateLabel)
      {
        v5 = (UILabel *)objc_alloc_init((Class)UILabel);
        currentDateLabel = self->_currentDateLabel;
        self->_currentDateLabel = v5;
      }
      labelBarItem = self->_labelBarItem;
      if (!labelBarItem)
      {
        int v8 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_currentDateLabel];
        id v9 = self->_labelBarItem;
        self->_labelBarItem = v8;

        labelBarItem = self->_labelBarItem;
      }
      v17[0] = self->_leftFixedSpaceBarItem;
      v17[1] = labelBarItem;
      v10 = +[NSArray arrayWithObjects:v17 count:2];
      v11 = [v4 navigationItem];
      [v11 setLeftBarButtonItems:v10];
    }
    currentDateLabelString = self->_currentDateLabelString;
    self->_currentDateLabelString = 0;
    v13 = currentDateLabelString;

    [(RootNavigationController *)self _setCurrentDateLabelString:v13];
  }
  else
  {
    v14 = [v4 navigationItem];
    [v14 setHidesBackButton:1];

    v15 = [v4 navigationItem];
    [v15 setLeftBarButtonItems:0];

    v16 = [v4 navigationItem];
    [v16 setRightBarButtonItems:0];
  }
}

+ (id)_inboxTitleForNotificationCount:(unint64_t)a3
{
  if (a3)
  {
    id v3 = objc_alloc((Class)NSString);
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"Inbox (%@)" value:&stru_1001D6918 table:0];
    id v6 = CUIKLocalizedStringForInteger();
    id v7 = [v3 initWithFormat:v5, v6];
  }
  else
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v4 localizedStringForKey:@"Inbox" value:&stru_1001D6918 table:0];
  }

  return v7;
}

- (id)_compactMonthDividedListSwitchBarButtonItem
{
  dividedMonthToggleBarButtonItem = self->_dividedMonthToggleBarButtonItem;
  if (!dividedMonthToggleBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:0 menu:0];
    v5 = self->_dividedMonthToggleBarButtonItem;
    self->_dividedMonthToggleBarButtonItem = v4;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](self->_dividedMonthToggleBarButtonItem, "_setAdditionalSelectionInsets:", 2.0, 0.0, 2.0, 0.0);
    id v6 = [(RootNavigationController *)self compactMonthMenu];
    [(UIBarButtonItem *)self->_dividedMonthToggleBarButtonItem setMenu:v6];

    [(UIBarButtonItem *)self->_dividedMonthToggleBarButtonItem setAccessibilityIdentifier:@"toggle-month-view"];
    dividedMonthToggleBarButtonItem = self->_dividedMonthToggleBarButtonItem;
  }

  return dividedMonthToggleBarButtonItem;
}

- (Class)_classRepresentingViewType:(int64_t)a3 forTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == -1)
  {
LABEL_5:
    id v7 = 0;
  }
  else
  {
    if ([v5 horizontalSizeClass] != (id)1 || objc_msgSend(v6, "verticalSizeClass") != (id)1)
    {
      switch(a3)
      {
        case 0:
        case 1:
        case 3:
        case 4:
          break;
        case 2:
          [v6 horizontalSizeClass];
          break;
        default:
          goto LABEL_5;
      }
    }
    id v7 = objc_opt_class();
  }

  return (Class)v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v5 viewDidAppear:a3];
  if (EKUIShouldSaveStateInPreferences())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C1E4;
    block[3] = &unk_1001D2740;
    block[4] = self;
    if (qword_100216750 != -1) {
      dispatch_once(&qword_100216750, block);
    }
  }
  [(RootNavigationController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  [(RootNavigationController *)self controllerAppearedTipsConfiguration];
}

- (BOOL)_updateCalendarButtonSpinner
{
  id v3 = [(RootNavigationController *)self model];
  BOOL v4 = (uint64_t)[v3 accountsInInitialSyncCount] < 1;

  objc_super v5 = [(UIButton *)self->_calendarsButton configuration];
  unsigned int v6 = [v5 showsActivityIndicator];

  if (((v4 ^ v6) & 1) == 0) {
    [(RootNavigationController *)self _updateCalendarsButtonConfiguration];
  }
  return v4 ^ v6 ^ 1;
}

- (void)_setCurrentDateLabelString:(id)a3
{
  id v5 = a3;
  if (![(NSAttributedString *)self->_currentDateLabelString isEqualToAttributedString:v5])
  {
    objc_storeStrong((id *)&self->_currentDateLabelString, a3);
    currentDateLabelString = self->_currentDateLabelString;
    id v7 = [(PaletteView *)self->_paletteView dateString];
    LOBYTE(currentDateLabelString) = [(NSAttributedString *)currentDateLabelString isEqualToAttributedString:v7];

    if ((currentDateLabelString & 1) == 0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100023DDC;
      v8[3] = &unk_1001D2740;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
    }
  }
}

- (void)_updateAddEventButtonEnabledness
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  id v3 = dispatch_get_global_queue(0, 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000062C0;
  v4[3] = &unk_1001D3068;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
}

- (void)updateCompactMonthMenu
{
  id v3 = [(RootNavigationController *)self model];
  unsigned int v4 = [v3 showMonthAsDivided];

  if (v4)
  {
    id v5 = +[UIImage systemImageNamed:@"list.bullet.below.rectangle"];
    char v6 = &OBJC_IVAR___RootNavigationController__listAction;
  }
  else
  {
    id v7 = +[CUIKPreferences sharedPreferences];
    id v8 = [v7 monthViewScaleSize];

    if (v8 == (id)2)
    {
      id v5 = +[UIImage _systemImageNamed:@"event.compact.2"];
      char v6 = &OBJC_IVAR___RootNavigationController__compactScaleAction;
    }
    else if (v8 == (id)1)
    {
      id v5 = +[UIImage _systemImageNamed:@"event.compact.split.4x1"];
      char v6 = &OBJC_IVAR___RootNavigationController__minimalScaleAction;
    }
    else
    {
      id v5 = +[UIImage _systemImageNamed:@"event.2.text"];
      char v6 = &OBJC_IVAR___RootNavigationController__largeScaleAction;
    }
  }
  id v9 = [v5 imageFlippedForRightToLeftLayoutDirection];

  [*(id *)((char *)&self->super.super.super.super.isa + *v6) setState:1];
  [(UIBarButtonItem *)self->_dividedMonthToggleBarButtonItem setImage:v9];
}

- (void)updateDeviceOrientationForJumpToTodayTip
{
  v2 = [(RootNavigationController *)self window];
  BOOL v3 = (char *)[v2 interfaceOrientation] - 1 < (char *)2;

  id v4 = +[CalendarTipsManager sharedManager];
  [v4 donateIsPortraitOrientation:v3];
}

- (void)_showNowForMainViewControllerContainer:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(RootNavigationController *)self _now];
  id v7 = [(RootNavigationController *)self model];
  [v7 setSelectedDate:v8];

  [v6 selectDate:v8 animated:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(RootNavigationController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(RootNavigationController *)self view];
    id v6 = [v5 window];
    id v7 = [v6 windowScene];
    unsigned __int8 v8 = [v7 interfaceOrientation];

    return 1 << v8;
  }
  else
  {
    v10 = [(RootNavigationController *)self visibleViewController];
    v11 = v10;
    if (v10)
    {
      unint64_t v9 = (unint64_t)[v10 supportedInterfaceOrientations];
    }
    else if ((id)[(RootNavigationController *)self activeWidthSizeClass] == (id)1)
    {
      unint64_t v9 = 26;
    }
    else
    {
      unint64_t v9 = 30;
    }
  }
  return v9;
}

- (void)selectTodayWithTrigger:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 == 2)
  {
    id v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      model = self->_model;
      id v7 = v5;
      unsigned __int8 v8 = [(CUIKCalendarModel *)model selectedDate];
      *(_DWORD *)buf = 136315394;
      v15 = "-[RootNavigationController selectTodayWithTrigger:animated:]";
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: WithinTimeout trigger specified with model date [%@]; will not select today",
        buf,
        0x16u);
    }
  }
  else
  {
    BOOL v9 = a4;
    id v11 = [(RootNavigationController *)self topMainViewControllerContainer];
    id v12 = v11;
    if (v11)
    {
      v13 = v11;
      if (a3 == 1)
      {
        [v11 setShouldRespondToApplicationDidBecomeActiveStateChange:1];
        [(RootNavigationController *)self _selectTodayForMainViewControllerContainer:v13 animated:v9];
        id v11 = [v13 setShouldRespondToApplicationDidBecomeActiveStateChange:0];
      }
      else
      {
        id v11 = [(RootNavigationController *)self _selectTodayForMainViewControllerContainer:v11 animated:v9];
      }
      id v12 = v13;
    }
    _objc_release_x1(v11, v12);
  }
}

- (void)_updateInteractivePopAllowed
{
  BOOL v3 = [(RootNavigationController *)self navigationItem];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
  {
    id v5 = [(RootNavigationController *)self window];
    int IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy();

    if (IsCompactInViewHierarchy)
    {
      id v9 = [(RootNavigationController *)self topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      unsigned __int8 v8 = [(RootNavigationController *)self interactivePopGestureRecognizer];
      [v8 setEnabled:(isKindOfClass & 1) == 0];
    }
    else
    {
      id v9 = [(RootNavigationController *)self interactivePopGestureRecognizer];
      [v9 setEnabled:0];
    }
  }
}

- (BOOL)_updateCalendarButtonError
{
  BOOL v3 = [(RootNavigationController *)self model];
  char v4 = [(RootNavigationController *)self model];
  id v5 = [v4 sourceForSelectedIdentity];
  if ((uint64_t)[v3 displayableAccountErrorsForSource:v5] < 1)
  {
    int v7 = 0;
  }
  else
  {
    id v6 = [(RootNavigationController *)self model];
    int v7 = [v6 accountsInInitialSyncCount] == 0;
  }
  int showingAccountErrors = self->_showingAccountErrors;
  if (showingAccountErrors != v7)
  {
    [(RootNavigationController *)self _updateCalendarsButtonConfiguration];
    self->_int showingAccountErrors = v7;
  }
  return showingAccountErrors != v7;
}

- (id)_listViewSwitchBarButtonItem
{
  int64_t v3 = [(RootNavigationController *)self currentDayViewMode];
  if (!self->_listToggleBarButtonItem || self->_lastListToggleBarButtonDayViewMode != v3)
  {
    self->_lastListToggleBarButtonDayViewMode = v3;
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      char v4 = [(RootNavigationController *)self generateCurrentListToggleBarButtonItemMenu];
      id v5 = objc_alloc((Class)UIBarButtonItem);
      id v6 = [(RootNavigationController *)self imageForCurrentDayViewMode];
      int v7 = (UIBarButtonItem *)[v5 initWithImage:v6 menu:v4];
      listToggleBarButtonItem = self->_listToggleBarButtonItem;
      self->_listToggleBarButtonItem = v7;
    }
    else
    {
      id v9 = objc_alloc((Class)UIBarButtonItem);
      v10 = +[UIImage systemImageNamed:@"list.bullet"];
      id v11 = [v10 imageFlippedForRightToLeftLayoutDirection];
      id v12 = (UIBarButtonItem *)[v9 initWithImage:v11 style:0 target:self action:"listTogglePressed"];
      v13 = self->_listToggleBarButtonItem;
      self->_listToggleBarButtonItem = v12;

      char v4 = [(RootNavigationController *)self model];
      -[UIBarButtonItem setSelected:](self->_listToggleBarButtonItem, "setSelected:", [v4 showDayAsList]);
    }
  }
  [(UIBarButtonItem *)self->_listToggleBarButtonItem setAccessibilityIdentifier:@"toggle-day-list-view"];
  v14 = self->_listToggleBarButtonItem;

  return v14;
}

- (void)_saveUserActivityInfo:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [(RootNavigationController *)self currentViewType];
  if (v4 > 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1001C14F8[v4];
  }
  id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
  unsigned int v7 = [(RootNavigationController *)self shouldDonateTomorrowActivity];
  if (v6)
  {
    id v8 = [objc_alloc((Class)CUIKUserActivityCalendarEvent) initWithEvent:v6 view:v5];
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    if (v7) {
      id v9 = (objc_class *)CUIKUserActivityTomorrow;
    }
    else {
      id v9 = (objc_class *)CUIKUserActivityCalendarDate;
    }
    id v10 = [v9 alloc];
    id v11 = [(CUIKCalendarModel *)self->_model selectedDate];
    id v12 = [v11 date];
    v13 = [(CUIKCalendarModel *)self->_model calendar];
    id v8 = [v10 initWithDate:v12 view:v5 calendar:v13];

    if (!v8) {
      goto LABEL_7;
    }
  }
  [v8 updateActivity:v14];
LABEL_7:
}

- (id)_ensureStackBaseCalendarViewControllerContainerIsPresent
{
  int64_t v3 = [(RootNavigationController *)self classForStackBaseContainerForCurrentTraits];
  unint64_t v4 = [(RootNavigationController *)self viewControllers];
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 currentChildViewController];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [v5 firstObject];
      unsigned __int8 v10 = [(id)objc_opt_class() isEqual:v3];

      if (v10)
      {
        id v11 = 0;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v12 = [v3 alloc];
  v13 = [(RootNavigationController *)self model];
  id v14 = [(RootNavigationController *)self window];
  id v11 = [v12 initWithModel:v13 window:v14];

  id v17 = v11;
  v15 = +[NSArray arrayWithObjects:&v17 count:1];
  [(RootNavigationController *)self setViewControllers:v15];

LABEL_8:

  return v11;
}

- (void)_forceInboxButtonCreationIfNeeded
{
  int64_t v3 = [(RootNavigationController *)self inboxBarButtonItem];

  if (v3)
  {
    [(RootNavigationController *)self _updateInboxBarButtonItem];
  }
  else
  {
    [objc_opt_class() _inboxTitleForNotificationCount:[self numberOfNotifications]];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v4 = [[ToolbarBarButtonItem alloc] initWithTitle:v6 target:self action:"inboxPressed"];
    [(RootNavigationController *)self setInboxBarButtonItem:v4];
    uint64_t v5 = [(RootNavigationController *)self inboxBarButtonItem];
    [v5 setAccessibilityIdentifier:@"inbox-button"];
  }
}

- (UIBarButtonItem)inboxBarButtonItem
{
  return self->_inboxBarButtonItem;
}

- (void)_updateAfterExtendedLaunch:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015A8C;
  void v5[3] = &unk_1001D28A8;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)_now
{
  v2 = [(RootNavigationController *)self model];
  int64_t v3 = [v2 calendar];
  id v4 = [v3 timeZone];

  id v5 = objc_alloc((Class)EKCalendarDate);
  id v6 = CUIKNowComponents();
  id v7 = [v5 initWithDateComponents:v6 timeZone:v4];

  return v7;
}

- (void)_updateUserActivity
{
  if ((+[EKFeatureSet isContinuitySupported] & 1) != 0
    || +[EKFeatureSet areContextualRemindersSupported])
  {
    int64_t v3 = +[UIApplication sharedApplication];
    if ([(NSUserActivity *)v3 applicationState])
    {
LABEL_4:

      goto LABEL_5;
    }
    BOOL userActivityNeedsUpdate = self->_userActivityNeedsUpdate;

    if (userActivityNeedsUpdate)
    {
      id v5 = +[CUIKPreferences sharedPreferences];
      unsigned __int8 v6 = [v5 disableContinuity];

      if ((v6 & 1) == 0)
      {
        id v7 = [(CUIKCalendarModel *)self->_model selectedOccurrence];

        unsigned int v8 = [(RootNavigationController *)self shouldDonateTomorrowActivity];
        if (v7)
        {
          uint64_t v9 = 144;
          int64_t v3 = self->_userActivityForEvent;
          if (v3)
          {
LABEL_18:
            id v14 = [(CUIKCalendarModel *)self->_model selectedOccurrence];

            if (v14)
            {
              v15 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
              id v16 = objc_alloc((Class)CSSearchableItemAttributeSet);
              id v17 = [(NSUserActivity *)v3 activityType];
              id v18 = [v16 initWithItemContentType:v17];

              v19 = [v15 title];
              [v18 setContentDescription:v19];

              v20 = [v15 structuredLocation];
              v21 = [v20 title];
              [v18 setNamedLocation:v21];

              v22 = [v20 geoLocation];
              v23 = v22;
              if (v22)
              {
                [v22 coordinate];
                if (CLLocationCoordinate2DIsValid(v35))
                {
                  [v23 coordinate];
                  v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  [v18 setLatitude:v24];

                  [v23 coordinate];
                  v26 = +[NSNumber numberWithDouble:v25];
                  [v18 setLongitude:v26];

                  [v18 setSupportsNavigation:&__kCFBooleanTrue];
                }
              }
              v27 = [v15 virtualConference];
              v28 = [v27 firstPhoneNumber];
              v29 = v28;
              if (v28)
              {
                id v30 = v28;
              }
              else
              {
                id v30 = [v15 conferenceURLForDisplay];
              }
              v31 = v30;

              if (objc_msgSend(v31, "cal_hasSchemeTel"))
              {
                v32 = [v31 absoluteString];
                v34 = v32;
                v33 = +[NSArray arrayWithObjects:&v34 count:1];
                [v18 setPhoneNumbers:v33];

                [v18 setSupportsPhoneCall:&__kCFBooleanTrue];
              }
              [v18 setSupportsNavigation:&__kCFBooleanTrue];
              [(NSUserActivity *)v3 setContentAttributeSet:v18];
            }
            [(NSUserActivity *)v3 becomeCurrent];
            [(NSUserActivity *)v3 setNeedsSave:1];
            goto LABEL_4;
          }
          id v10 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.calendar.continuity.event_selection"];
        }
        else
        {
          unsigned int v11 = v8;
          id v12 = &OBJC_IVAR___RootNavigationController__userActivityForDateInView;
          if (v8) {
            id v12 = &OBJC_IVAR___RootNavigationController__tomorrowUA;
          }
          int64_t v3 = (NSUserActivity *)*(id *)((char *)&self->super.super.super.super.isa + *v12);
          if (v3) {
            goto LABEL_18;
          }
          id v10 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.calendar.continuity.date_selection"];
          if (v11) {
            uint64_t v9 = 152;
          }
          else {
            uint64_t v9 = 136;
          }
        }
        int64_t v3 = (NSUserActivity *)v10;
        v13 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
        *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)v3;

        [(NSUserActivity *)v3 setDelegate:self];
        goto LABEL_18;
      }
    }
  }
LABEL_5:
  self->_BOOL userActivityNeedsUpdate = 0;
}

- (void)controllerAppearedTipsConfiguration
{
  int64_t v3 = +[CalendarTipsManager sharedManager];
  [v3 configureTipsCenter];

  id v4 = +[CalendarTipsManager sharedManager];
  id v5 = [(RootNavigationController *)self topViewController];
  unsigned __int8 v6 = [(RootNavigationController *)self todayBarButtonItem];
  [v4 addObserversForController:v5 todayButton:v6];

  [(RootNavigationController *)self updateDeviceOrientationForJumpToTodayTip];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(RootNavigationController *)self _updateInteractivePopAllowed];
  id v5 = [(RootNavigationController *)self topViewController];
  [(RootNavigationController *)self _updatePaletteStateWithViewController:v5];

  unsigned __int8 v6 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  [(RootNavigationController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v8 viewWillAppear:v3];
  id v7 = [(RootNavigationController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v13 loadView];
  id v4 = [(RootNavigationController *)self view];
  id v5 = +[UIColor systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  id v6 = objc_alloc((Class)UIView);
  id v7 = [(RootNavigationController *)self view];
  [v7 bounds];
  id v8 = [v6 initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v14), 50.0)];

  uint64_t v9 = (_UINavigationBarPalette *)[objc_alloc((Class)_UINavigationBarPalette) initWithContentView:v8];
  palette = self->_palette;
  self->_palette = v9;

  unsigned int v11 = [[PaletteView alloc] initWithBarPalette:self->_palette];
  paletteView = self->_paletteView;
  self->_paletteView = v11;

  [(PaletteView *)self->_paletteView setAutoresizingMask:2];
  [(_UINavigationBarPalette *)self->_palette addSubview:self->_paletteView];
}

- (void)_restoreLastUsedCalendarViewType
{
  if ((EKUIShouldSaveStateInPreferences() & 1) != 0
    || [(RootNavigationController *)self _isThisTheOnlyConnectedScene])
  {
    BOOL v3 = +[CUIKPreferences sharedPreferences];
    id v4 = [v3 lastViewMode];
    uint64_t v5 = (uint64_t)[v4 integerValue];

    switch(v5)
    {
      case -1:
      case 3:
        goto LABEL_4;
      case 2:
        id v8 = [(RootNavigationController *)self model];
        [v8 setShowDayAsList:0];

        int64_t v9 = +[MultiDayWeekView numMultiDays];
        id v7 = [(RootNavigationController *)self model];
        [v7 setNumDaysToShow:v9];
        uint64_t v5 = 2;
        goto LABEL_7;
      case 4:
        id v7 = [(RootNavigationController *)self model];
        [v7 setShowDayAsList:1];
        uint64_t v5 = 4;
        goto LABEL_7;
      default:
        break;
    }
  }
  else
  {
LABEL_4:
    id v6 = [(RootNavigationController *)self model];
    [v6 setShowDayAsList:0];

    id v7 = [(RootNavigationController *)self model];
    [v7 setNumDaysToShow:1];
    uint64_t v5 = 3;
LABEL_7:
  }
  id v10 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109120;
    v13[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Root Navigation Controller restoring last view type: %d", (uint8_t *)v13, 8u);
  }
  unsigned int v11 = [(CUIKCalendarModel *)self->_model selectedDate];
  id v12 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:v5 andDate:v11];
}

- (BOOL)shouldDonateTomorrowActivity
{
  v2 = [(CUIKCalendarModel *)self->_model selectedDay];
  BOOL v3 = CUIKTodayComponents();
  id v4 = [v2 timeZone];
  uint64_t v5 = +[EKCalendarDate calendarDateWithDateComponents:v3 timeZone:v4];

  LOBYTE(v4) = [v2 differenceInDays:v5] == (id)1;
  return (char)v4;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v4 viewDidLayoutSubviews];
  BOOL v3 = [(RootNavigationController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (id)pushCalendarViewControllerWithViewType:(int64_t)a3 andDate:(id)a4
{
  id v6 = a4;
  [(CUIKCalendarModel *)self->_model setSelectedDate:v6];
  id v7 = [(RootNavigationController *)self _ensureStackBaseCalendarViewControllerContainerIsPresent];
  id v8 = [(RootNavigationController *)self ekui_futureTraitCollection];
  int64_t v9 = [(RootNavigationController *)self _classRepresentingViewType:a3 forTraitCollection:v8];

  if (v9)
  {
    id v38 = v6;
    [(RootNavigationController *)self viewControllers];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v11)
    {
      id v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v40;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [v10 lastObject];
          BOOL v18 = v17 == v16;
        }
        else
        {
          BOOL v18 = 0;
        }
        v13 |= v18;
        if (v12 == (id)++v15)
        {
          id v12 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v12) {
            goto LABEL_4;
          }

          goto LABEL_20;
        }
      }
      id v19 = v16;
      id v20 = [v10 lastObject];

      if (v19)
      {
        if (v20 != v19)
        {
          id v21 = [(RootNavigationController *)self popToViewController:v19 animated:0];
          goto LABEL_36;
        }
        v37 = [v19 currentChildViewController];
        id v6 = v38;
        [v37 selectDate:v38 animated:0];

        goto LABEL_37;
      }
LABEL_20:
      if ((v13 & 1) == 0) {
        goto LABEL_22;
      }
      id v22 = [(RootNavigationController *)self popViewControllerAnimated:0];
      v23 = [(RootNavigationController *)self viewControllers];
      id v19 = [v23 lastObject];
    }
    else
    {

LABEL_22:
      v24 = [(RootNavigationController *)self viewControllers];
      double v25 = [v24 firstObject];

      id v19 = v25;
      v26 = [(RootNavigationController *)self topMainViewControllerContainer];
      [v26 beginAppearanceTransition:0 animated:0];

      v27 = [(RootNavigationController *)self topMainViewControllerContainer];
      [v27 endAppearanceTransition];

      id v28 = [(RootNavigationController *)self popToRootViewControllerAnimated:0];
      if (v19)
      {
        id v29 = v19;
        while (1)
        {
          id v30 = v29;
          id v29 = v19;

          id v19 = [v29 pushedNextLevelMainViewControllerContainerAnimated:0];

          if (objc_opt_isKindOfClass()) {
            break;
          }
          v31 = [(RootNavigationController *)self window];
          int IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy();

          if (IsCompactInViewHierarchy)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v33 = v19;
              if ([v33 allowsOverriddenRightNavigationBarItems])
              {
                v34 = [v33 navigationItem];
                CLLocationCoordinate2D v35 = [v34 rightBarButtonItems];

                if (!v35) {
                  [(RootNavigationController *)self _addButtonsToNavigationBarForViewController:v33];
                }
              }
            }
          }
          if (!v19) {
            goto LABEL_34;
          }
        }
      }
      else
      {
        id v29 = 0;
LABEL_34:
        id v29 = v29;
        id v19 = v29;
      }
    }
LABEL_36:
    id v6 = v38;
LABEL_37:
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)updateBackButtonToDate:(id)a3
{
  id v14 = a3;
  objc_super v4 = [(RootNavigationController *)self traitCollection];
  if ([v4 horizontalSizeClass] == (id)1)
  {
    uint64_t v5 = [(RootNavigationController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [(RootNavigationController *)self childViewControllers];
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 2)
  {
    unint64_t v9 = 1;
    do
    {
      id v10 = [(RootNavigationController *)self childViewControllers];
      id v11 = [v10 objectAtIndexedSubscript:v9];
      [(RootNavigationController *)self _updateBackButtonToDate:v14 container:v11];

      ++v9;
      id v12 = [(RootNavigationController *)self childViewControllers];
      id v13 = [v12 count];
    }
    while (v9 < (unint64_t)v13);
  }
LABEL_8:
}

- (RootNavigationController)initWithModel:(id)a3 targetWindow:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)RootNavigationController;
  unint64_t v9 = [(RootNavigationController *)&v28 init];
  id v10 = v9;
  if (v9)
  {
    p_model = (id *)&v9->_model;
    objc_storeStrong((id *)&v9->_model, a3);
    [(RootNavigationController *)v10 setDelegate:v10];
    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v10 selector:"_notificationCountChanged:" name:CUIKCalendarModelNotificationCountsChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_calendarErrorCountChanged:" name:CUIKCalendarModelAccountErrorCountChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_accountsInInitialSyncCountChanged" name:CUIKCalendarModelAccountsInInitialSyncCountChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_calendarsChanged:" name:CUIKCalendarModelCalendarsChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_focusModeConfigurationChanged:" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
    [v12 addObserver:v10 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
    [v12 addObserver:v10 selector:"_timeZoneChanged:" name:CUIKCalendarModelTimeZoneChangedNotification object:0];
    [v12 addObserver:v10 selector:"_selectedDateChanged:" name:CUIKCalendarModelSelectedDateChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_filterChanged:" name:CUIKCalendarModelFilterChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_identityChanged:" name:CUIKCalendarModelIdentityChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_delegatesChanged:" name:CUIKCalendarModelDelegatesChangedNotification object:*p_model];
    [v12 addObserver:v10 selector:"_updateAfterExtendedLaunch:" name:CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification object:*p_model];
    [v12 addObserver:v10 selector:"_updateAfterExtendedLaunch:" name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];
    [v12 addObserver:v10 selector:"_meContactChangedNoticationReceived:" name:CalMeCardChangedNotification object:0];
    [v12 addObserver:v10 selector:"_monthWeekScaleChanged:" name:CUIKPreferencesNotification_MonthWeekScale object:0];
    v10->_BOOL userActivityNeedsUpdate = 1;
    id v13 = +[EKUISemiConstantCache sharedInstance];
    v10->_regularBackgroundedViewType = -1;
    v10->_compactBackgroundedViewType = -1;
    objc_storeWeak((id *)&v10->_window, v8);
    id v14 = [*p_model undoManager];
    uint64_t v15 = [v14 undoableEditor];

    id v16 = objc_alloc((Class)CUIKIPendingReminderTracker);
    id v17 = [*p_model eventStore];
    id v18 = [v16 initWithEventStore:v17];

    [v7 setPendingReminderTracker:v18];
    id v19 = objc_alloc((Class)CUIKIReminderEditor);
    id v20 = [*p_model eventStore];
    id v21 = [*p_model undoManager];
    id v22 = [v19 initWithEventStore:v20 undoManager:v21 alertDisplayer:v10 pendingReminderTracker:v18];

    id v23 = objc_alloc((Class)CUIKCompositeEditor);
    v29[0] = v15;
    v29[1] = v22;
    v24 = +[NSArray arrayWithObjects:v29 count:2];
    id v25 = [v23 initWithEditors:v24];

    v26 = [*p_model undoManager];
    [v26 setUndoableEditor:v25];
  }
  return v10;
}

- (void)addToolbarButtonItemsWithViewController:(id)a3
{
  id v4 = a3;
  [(RootNavigationController *)self setToolbarHidden:0 animated:0];
  uint64_t v5 = [(RootNavigationController *)self todayBarButtonItem];

  if (!v5)
  {
    id v6 = [ToolbarBarButtonItem alloc];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"Today" value:&stru_1001D6918 table:0];
    unint64_t v9 = [(ToolbarBarButtonItem *)v6 initWithTitle:v8 target:self action:"todayPressed"];

    [(RootNavigationController *)self setTodayBarButtonItem:v9];
    id v10 = [(RootNavigationController *)self todayBarButtonItem];
    [v10 setAccessibilityIdentifier:@"today-button"];
  }
  [(RootNavigationController *)self _updateFilterLabel];
  id v11 = [(RootNavigationController *)self calendarsBarButtonItem];

  if (v11) {
    [(RootNavigationController *)self _updateCalendarButtonAccessory];
  }
  else {
    [(RootNavigationController *)self _initializeCalendarsButton];
  }
  [(RootNavigationController *)self _forceInboxButtonCreationIfNeeded];
  id v12 = [v4 toolbarItems];

  if (!v12)
  {
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    uint64_t v15 = [(RootNavigationController *)self todayBarButtonItem];
    id v16 = [(RootNavigationController *)self calendarsBarButtonItem];
    v19[2] = v16;
    v19[3] = v14;
    id v17 = [(RootNavigationController *)self inboxBarButtonItem];
    v19[4] = v17;
    id v18 = +[NSArray arrayWithObjects:v19 count:5];

    [v4 setToolbarItems:v18 animated:0];
    [(RootNavigationController *)self _updateCalendarsButtonConfiguration];
  }
  [(RootNavigationController *)self setShowingOverriddenToolbarItems:1];
}

- (UIBarButtonItem)todayBarButtonItem
{
  return self->_todayBarButtonItem;
}

- (UIBarButtonItem)calendarsBarButtonItem
{
  return self->_calendarsBarButtonItem;
}

- (void)_updateCalendarsButtonConfiguration
{
  [(UIButton *)self->_calendarsButton setNeedsUpdateConfiguration];
  id v5 = [(UIButton *)self->_calendarsButton superview];
  BOOL v3 = [(UIButton *)self->_calendarsButton configuration];
  id v4 = [v3 title];
  [v5 setAccessibilityLabel:v4];
}

- (id)generateCurrentListToggleBarButtonItemMenu
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Single Day" value:&stru_1001D6918 table:0];
  id v5 = [(RootNavigationController *)self imageForDayViewMode:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  void v29[2] = sub_1000AF1C8;
  v29[3] = &unk_1001D42D0;
  v29[4] = self;
  id v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"singleDayAction" handler:v29];

  id v7 = [(RootNavigationController *)self model];
  if ([v7 showDayAsList])
  {
  }
  else
  {
    id v8 = [(RootNavigationController *)self model];
    uint64_t v9 = (uint64_t)[v8 numDaysToShow];

    if (v9 < 2)
    {
      uint64_t v10 = 1;
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  [v6 setState:v10];
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"Multi Day" value:&stru_1001D6918 table:0];
  id v13 = [(RootNavigationController *)self imageForDayViewMode:1];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000AF1D4;
  v28[3] = &unk_1001D42D0;
  v28[4] = self;
  id v14 = +[UIAction actionWithTitle:v12 image:v13 identifier:@"multiDayAction" handler:v28];

  uint64_t v15 = [(RootNavigationController *)self model];
  if ([v15 showDayAsList])
  {
  }
  else
  {
    id v16 = [(RootNavigationController *)self model];
    id v17 = [v16 numDaysToShow];

    if (v17 == (id)2)
    {
      uint64_t v18 = 1;
      goto LABEL_11;
    }
  }
  uint64_t v18 = 0;
LABEL_11:
  [v14 setState:v18];
  id v19 = +[NSBundle bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"List" value:&stru_1001D6918 table:0];
  id v21 = [(RootNavigationController *)self imageForDayViewMode:2];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000AF1E0;
  v27[3] = &unk_1001D42D0;
  v27[4] = self;
  id v22 = +[UIAction actionWithTitle:v20 image:v21 identifier:@"listAction" handler:v27];

  id v23 = [(RootNavigationController *)self model];
  LODWORD(v19) = [v23 showDayAsList];

  [v22 setState:v19];
  [v6 setAccessibilityIdentifier:@"single-day"];
  [v14 setAccessibilityIdentifier:@"multi-day"];
  [v22 setAccessibilityIdentifier:@"list-view"];
  v30[0] = v6;
  v30[1] = v14;
  v30[2] = v22;
  v24 = +[NSArray arrayWithObjects:v30 count:3];
  id v25 = +[UIMenu menuWithTitle:&stru_1001D6918 image:0 identifier:0 options:1 children:v24];

  return v25;
}

- (id)imageForDayViewMode:(int64_t)a3
{
  if (a3 == 2)
  {
    CFStringRef v3 = @"list.dash";
LABEL_6:
    self = +[UIImage systemImageNamed:v3];
    goto LABEL_8;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_8;
    }
    CFStringRef v3 = @"calendar.day.timeline.leading";
    goto LABEL_6;
  }
  self = +[UIImage _systemImageNamed:@"calendar.multiday.timeline.leading"];
LABEL_8:

  return self;
}

- (int64_t)currentDayViewMode
{
  CFStringRef v3 = [(RootNavigationController *)self model];
  unsigned __int8 v4 = [v3 showDayAsList];

  if (v4) {
    return 2;
  }
  BOOL v6 = (_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl();
  id v7 = [(RootNavigationController *)self model];
  int64_t v5 = (uint64_t)[v7 numDaysToShow] > 1 && v6;

  return v5;
}

- (id)compactMonthMenu
{
  objc_initWeak(&location, self);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000AF1EC;
  v49[3] = &unk_1001D42F8;
  objc_copyWeak(&v50, &location);
  v49[4] = self;
  CFStringRef v3 = objc_retainBlock(v49);
  unsigned __int8 v4 = +[NSBundle bundleForClass:objc_opt_class()];
  int64_t v5 = [v4 localizedStringForKey:@"Compact" value:&stru_1001D6918 table:0];
  BOOL v6 = +[UIImage _systemImageNamed:@"event.compact.split.4x1"];
  id v7 = [v6 imageFlippedForRightToLeftLayoutDirection];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000AF384;
  v47[3] = &unk_1001D4320;
  id v8 = v3;
  id v48 = v8;
  uint64_t v9 = +[UIAction actionWithTitle:v5 image:v7 identifier:0 handler:v47];
  minimalScaleAction = self->_minimalScaleAction;
  self->_minimalScaleAction = v9;

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"Stacked" value:&stru_1001D6918 table:0];
  id v13 = +[UIImage _systemImageNamed:@"event.compact.2"];
  id v14 = [v13 imageFlippedForRightToLeftLayoutDirection];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000AF39C;
  v45[3] = &unk_1001D4320;
  uint64_t v15 = v8;
  id v46 = v15;
  id v16 = +[UIAction actionWithTitle:v12 image:v14 identifier:0 handler:v45];
  compactScaleAction = self->_compactScaleAction;
  self->_compactScaleAction = v16;

  uint64_t v18 = +[NSBundle bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"Details" value:&stru_1001D6918 table:0];
  id v20 = +[UIImage _systemImageNamed:@"event.2.text"];
  id v21 = [v20 imageFlippedForRightToLeftLayoutDirection];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000AF3B4;
  v43[3] = &unk_1001D4320;
  id v22 = v15;
  id v44 = v22;
  id v23 = +[UIAction actionWithTitle:v19 image:v21 identifier:0 handler:v43];
  largeScaleAction = self->_largeScaleAction;
  self->_largeScaleAction = v23;

  id v25 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"List" value:&stru_1001D6918 table:0];
  v27 = +[UIImage systemImageNamed:@"list.bullet.below.rectangle"];
  objc_super v28 = [v27 imageFlippedForRightToLeftLayoutDirection];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000AF420;
  v41[3] = &unk_1001D4320;
  id v29 = v22;
  id v42 = v29;
  id v30 = +[UIAction actionWithTitle:v26 image:v28 identifier:0 handler:v41];
  listAction = self->_listAction;
  self->_listAction = v30;

  [(UIAction *)self->_minimalScaleAction setAccessibilityIdentifier:@"minimal-button"];
  [(UIAction *)self->_compactScaleAction setAccessibilityIdentifier:@"summary-button"];
  [(UIAction *)self->_largeScaleAction setAccessibilityIdentifier:@"large-button"];
  [(UIAction *)self->_listAction setAccessibilityIdentifier:@"list-button"];
  v32 = self->_compactScaleAction;
  v53[0] = self->_minimalScaleAction;
  v53[1] = v32;
  v53[2] = self->_largeScaleAction;
  id v33 = +[NSArray arrayWithObjects:v53 count:3];
  v34 = +[UIMenu menuWithTitle:&stru_1001D6918 image:0 identifier:0 options:1 children:v33];

  CLLocationCoordinate2D v35 = self->_listAction;
  v52[0] = v34;
  v52[1] = v35;
  v36 = +[NSArray arrayWithObjects:v52 count:2];
  v37 = +[UIMenu menuWithTitle:&stru_1001D6918 image:0 identifier:0 options:33 children:v36];
  compactMonthMenu = self->_compactMonthMenu;
  self->_compactMonthMenu = v37;

  [(RootNavigationController *)self updateCompactMonthMenu];
  long long v39 = self->_compactMonthMenu;

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

  return v39;
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)_initializeCalendarsButton
{
  if (qword_100216760 != -1) {
    dispatch_once(&qword_100216760, &stru_1001D4258);
  }
  CFStringRef v3 = +[UIButton buttonWithType:1];
  calendarsButton = self->_calendarsButton;
  self->_calendarsButton = v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADE0;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_100216758, block);
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000FFD0;
  v22[3] = &unk_1001D42A8;
  objc_copyWeak(&v23, &location);
  [(UIButton *)self->_calendarsButton setConfigurationUpdateHandler:v22];
  [(UIButton *)self->_calendarsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1144733696;
  [(UIButton *)self->_calendarsButton setContentCompressionResistancePriority:0 forAxis:v5];
  [(UIButton *)self->_calendarsButton addTarget:self action:"calendarsPressed" forControlEvents:64];
  [(RootNavigationController *)self _updateCalendarsButtonMenuProvider];
  BOOL v6 = objc_opt_new();
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:UIAccessibilityTraitButton];
  [(UIButton *)self->_calendarsButton setIsAccessibilityElement:0];
  [(UIButton *)self->_calendarsButton setAccessibilityElementsHidden:1];
  [v6 addSubview:self->_calendarsButton];
  id v7 = [(UIButton *)self->_calendarsButton widthAnchor];
  id v8 = [v6 widthAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  uint64_t v10 = [(UIButton *)self->_calendarsButton heightAnchor];
  id v11 = [v6 heightAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  id v13 = [(UIButton *)self->_calendarsButton centerXAnchor];
  id v14 = [v6 centerXAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v16 = [(UIButton *)self->_calendarsButton centerYAnchor];
  id v17 = [v6 centerYAnchor];
  uint64_t v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  [(RootNavigationController *)self _updateFilterLabel];
  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v6];
  id v20 = [(RootNavigationController *)self calendarsButtonTitle];
  [v19 setTitle:v20];

  [(RootNavigationController *)self setCalendarsBarButtonItem:v19];
  id v21 = [(RootNavigationController *)self calendarsBarButtonItem];
  [v21 setAccessibilityIdentifier:@"calendars-button"];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (id)topMainViewControllerContainer
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(RootNavigationController *)self viewControllers];
  CFStringRef v3 = [v2 reverseObjectEnumerator];

  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (v9) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  uint64_t v10 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v20 = v12;
    id v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "The top view controller does not conform to the [%@] class", buf, 0xCu);
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

- (id)ekui_futureTraitCollection
{
  CFStringRef v3 = objc_getAssociatedObject(self, [(RootNavigationController *)self ekui_futureTraitCollectionCategoryPropertyKey]);
  if (!v3)
  {
    CFStringRef v3 = [(RootNavigationController *)self traitCollection];
  }

  return v3;
}

- (id)traitCollection
{
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  CFStringRef v3 = [(RootNavigationController *)&v8 traitCollection];
  if (EKUIOverriddenTraitsBasedOnWindowGeometryIsEnforced())
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000AEA94;
    v7[3] = &unk_1001D41C0;
    v7[4] = self;
    id v4 = [v3 traitCollectionByModifyingTraits:v7];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)_calendarsButtonConfiguration
{
  unsigned __int8 v3 = [(RootNavigationController *)self _calendarsButtonHasBackground];
  id v4 = [(RootNavigationController *)self model];
  uint64_t v5 = (uint64_t)[v4 accountsInInitialSyncCount];

  uint64_t v6 = [(RootNavigationController *)self model];
  uint64_t v7 = [(RootNavigationController *)self model];
  objc_super v8 = [v7 sourceForSelectedIdentity];
  BOOL v10 = (uint64_t)[v6 displayableAccountErrorsForSource:v8] > 0 && v5 < 1;

  if (v3)
  {
    id v11 = +[UIButtonConfiguration filledButtonConfiguration];
    +[UIColor systemWhiteColor];
  }
  else
  {
    id v11 = +[UIButtonConfiguration plainButtonConfiguration];
    CalendarAppTintColor();
  id v12 = };
  id v13 = +[UIFont systemFontOfSize:17.0];
  [v11 setTitleLineBreakMode:5];
  id v14 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v13, NSFontAttributeName, v12, NSForegroundColorAttributeName, 0);
  if (UIAccessibilityButtonShapesEnabled())
  {
    long long v15 = +[NSNumber numberWithInteger:1];
    [v14 setObject:v15 forKey:NSUnderlineStyleAttributeName];
  }
  id v16 = objc_alloc((Class)NSAttributedString);
  long long v17 = [(RootNavigationController *)self calendarsButtonTitle];
  id v18 = [v16 initWithString:v17 attributes:v14];
  [v11 setAttributedTitle:v18];

  [v11 setTitleAlignment:2];
  if (v5 >= 1)
  {
    [v11 setShowsActivityIndicator:1];
    [v11 setImagePadding:8.0];
  }
  if (v10)
  {
    [v13 pointSize];
    id v19 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 0, 2);
    id v20 = +[UIImage systemImageNamed:@"exclamationmark.circle" withConfiguration:v19];
    [v11 setImage:v20];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AEFEC;
    v25[3] = &unk_1001D4238;
    id v26 = v12;
    [v11 setImageColorTransformer:v25];
  }
  if (v3)
  {
    id v21 = 0;
  }
  else
  {
    id v21 = +[UIColor clearColor];
  }
  id v22 = [v11 background];
  [v22 setBackgroundColor:v21];

  if ((v3 & 1) == 0) {
  id v23 = [v11 background];
  }
  [v23 setCornerRadius:5.0];

  [v11 contentInsets];
  [v11 setContentInsets:];

  return v11;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (id)calendarsButtonTitle
{
  unsigned __int8 v3 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];

  if (v3)
  {
    id v4 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
    [v4 title];
  }
  else
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    [v4 localizedStringForKey:@"Calendars" value:&stru_1001D6918 table:0];
  uint64_t v5 = };

  if (self->_showingAccountErrors)
  {
    id v6 = [@" " stringByAppendingString:v5];
  }
  else
  {
    id v6 = v5;
  }
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)_calendarsButtonHasBackground
{
  v2 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_addButtonsToNavigationBarForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RootNavigationController *)self addEventBarButtonItem];
  v17[0] = v5;
  id v6 = [(RootNavigationController *)self searchBarButtonItem];
  v17[1] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v17 count:2];

  if ((id)[(RootNavigationController *)self activeWidthSizeClass] == (id)1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v8 = [v4 supportedToggleMode];
      if (v8 == 2)
      {
        uint64_t v9 = [(RootNavigationController *)self _compactMonthDividedListSwitchBarButtonItem];
      }
      else
      {
        if (v8 != 1) {
          goto LABEL_9;
        }
        uint64_t v9 = [(RootNavigationController *)self _listViewSwitchBarButtonItem];
      }
      BOOL v10 = (void *)v9;
      if (v9)
      {
        uint64_t v11 = [v7 arrayByAddingObject:v9];

        uint64_t v7 = (void *)v11;
      }
    }
  }
LABEL_9:
  id v12 = [v4 navigationItem];
  id v13 = [v12 rightBarButtonItems];
  unsigned __int8 v14 = [v13 isEqual:v7];

  if ((v14 & 1) == 0)
  {
    long long v15 = [v4 navigationItem];
    [v15 setRightBarButtonItems:&__NSArray0__struct animated:0];

    id v16 = [v4 navigationItem];
    [v16 setRightBarButtonItems:v7 animated:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  [(RootNavigationController *)self setEkui_futureTraitCollection:0];
  self->_traitCollectionChangeShouldResultInCompactDayView = 0;
  [(RootNavigationController *)self _adjustNavBarVisibilityAfterTraitCollectionChange];
  uint64_t v5 = [(RootNavigationController *)self topViewController];
  [(RootNavigationController *)self _updatePaletteStateWithViewController:v5];

  v6.receiver = self;
  v6.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v6 traitCollectionDidChange:v4];
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  id v4 = [(RootNavigationController *)self topMainViewControllerContainer];
  if (([v4 currentChildViewControllerIsLoaded] & 1) == 0)
  {
    uint64_t v5 = [(RootNavigationController *)self topViewController];

    if (v4 == v5) {
      [v4 setupForViewAppearance];
    }
  }
  [(RootNavigationController *)self _updateViewSwitcherSegmentWidthsAfterWindowSizeChange];
  [(RootNavigationController *)self _updateNavbarStringForNewStateAfterWindowSizeChange];
  objc_super v6 = [(RootNavigationController *)self topViewController];
  if (v4 == v6)
  {
    BOOL extendedLaunchOver = self->_extendedLaunchOver;

    if (extendedLaunchOver)
    {
      [(RootNavigationController *)self updateNavigationBarButtonItemsWithViewController:v4];
      [(RootNavigationController *)self updateToolbarItemsWithViewController:v4];
    }
  }
  else
  {
  }
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v8 viewWillLayoutSubviews];
}

- (void)_updateNavbarStringForNewStateAfterWindowSizeChange
{
  if ((id)[(RootNavigationController *)self activeWidthSizeClass] == (id)2)
  {
    id v3 = [(RootNavigationController *)self topMainViewControllerContainer];
    if (objc_opt_respondsToSelector()) {
      [v3 updateNavigationBarDisplayedDateString];
    }
  }
}

- (void)_updateViewSwitcherSegmentWidthsAfterWindowSizeChange
{
  if ((id)[(RootNavigationController *)self activeWidthSizeClass] == (id)2)
  {
    id v3 = [(RootNavigationController *)self viewSwitcher];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(RootNavigationController *)self _setSegmentWidthsForViewSwitcher:v3];
      [(RootNavigationController *)self _updateDateLabelFrame];
    }
  }
}

- (int64_t)activeWidthSizeClass
{
  v2 = [(RootNavigationController *)self ekui_futureTraitCollection];
  id v3 = [v2 horizontalSizeClass];

  return (int64_t)v3;
}

- (UIBarButtonItem)searchBarButtonItem
{
  [(UIBarButtonItem *)self->_searchBarButtonItem setAccessibilityIdentifier:@"searchbar-button"];
  searchBarButtonItem = self->_searchBarButtonItem;
  if (!searchBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:12 target:self action:"_searchPressed"];
    uint64_t v5 = CalendarAppTintColor();
    [(UIBarButtonItem *)v4 setTintColor:v5];

    objc_super v6 = self->_searchBarButtonItem;
    self->_searchBarButtonItem = v4;

    searchBarButtonItem = self->_searchBarButtonItem;
  }

  return searchBarButtonItem;
}

- (int64_t)currentViewType
{
  v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  if (!v2) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v3 = 1;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v3 = 2;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v3 = 3;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v3 = 4;
      goto LABEL_15;
    }
    id v4 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "While trying to save last used view mode, the top view controller was not a recognized mode in set {Year, Month, Week, Day}.", v6, 2u);
    }
LABEL_14:
    int64_t v3 = -1;
    goto LABEL_15;
  }
  int64_t v3 = 0;
LABEL_15:

  return v3;
}

- (UIBarButtonItem)addEventBarButtonItem
{
  [(UIBarButtonItem *)self->_addEventBarButtonItem setAccessibilityIdentifier:@"add-plus-button"];
  addEventBarButtonItem = self->_addEventBarButtonItem;
  if (!addEventBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"addEventPressed"];
    uint64_t v5 = CalendarAppTintColor();
    [(UIBarButtonItem *)v4 setTintColor:v5];

    objc_super v6 = self->_addEventBarButtonItem;
    self->_addEventBarButtonItem = v4;

    addEventBarButtonItem = self->_addEventBarButtonItem;
  }

  return addEventBarButtonItem;
}

- (void)_adjustNavBarVisibilityAfterTraitCollectionChange
{
  self->_isTransitioningTraitCollection = 0;
  if (self->_shouldSetNavBarVisibilityAfterTraitCollectionTransition)
  {
    self->_shouldSetNavBarVisibilityAfterTraitCollectionTransition = 0;
    [(RootNavigationController *)self setNavigationBarHidden:self->_hideNavBarAfterTraitCollectionTransition animated:0];
  }
}

- (void)_updatePaletteStateWithViewController:(id)a3
{
  id v17 = a3;
  [(RootNavigationController *)self updateCurrentIdentity];
  if (objc_opt_respondsToSelector())
  {
    id v4 = v17;
    uint64_t v5 = +[UIColor clearColor];
    [(PaletteView *)self->_paletteView setBackgroundColor:v5];

    [(PaletteView *)self->_paletteView setOpaqueBackground:0];
    [v4 updatePalette:self->_paletteView];
    if ([(PaletteView *)self->_paletteView hasContent])
    {
      [(PaletteView *)self->_paletteView sizeToFit];
      [(_UINavigationBarPalette *)self->_palette frame];
      double v7 = v6;
      [(_UINavigationBarPalette *)self->_palette frame];
      double v9 = v8;
      [(PaletteView *)self->_paletteView frame];
      double v11 = v10;
      [(PaletteView *)self->_paletteView frame];
      -[_UINavigationBarPalette setFrame:](self->_palette, "setFrame:", v7, v9, v11);
      [(PaletteView *)self->_paletteView frame];
      [(_UINavigationBarPalette *)self->_palette setPreferredHeight:v12];
      [(_UINavigationBarPalette *)self->_palette setNeedsLayout];
      palette = self->_palette;
      unsigned __int8 v14 = [v4 navigationItem];
      long long v15 = v14;
      id v16 = palette;
    }
    else
    {
      unsigned __int8 v14 = [v4 navigationItem];
      long long v15 = v14;
      id v16 = 0;
    }
    [v14 _setBottomPalette:v16];
  }
  else
  {
    [(PaletteView *)self->_paletteView removeAllContent];
    [(PaletteView *)self->_paletteView layoutIfNeeded];
    id v4 = [v17 navigationItem];
    [v4 _setBottomPalette:0];
  }
}

- (void)updateCurrentIdentity
{
  [(RootNavigationController *)self _updateCalendarsButtonTitle];
  id v3 = [(RootNavigationController *)self _contactForCurrentIdentity];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v3 = [(PaletteView *)self->_paletteView setAvatarContact:v3];
    id v4 = v5;
  }

  _objc_release_x1(v3, v4);
}

- (void)_updateCalendarsButtonTitle
{
  uint64_t v3 = [(RootNavigationController *)self calendarsButtonTitle];
  calendarsButton = self->_calendarsButton;
  if (calendarsButton)
  {
    uint64_t v7 = v3;
    id v5 = [(UIButton *)calendarsButton titleForState:0];
    unsigned __int8 v6 = [v5 isEqualToString:v7];

    uint64_t v3 = v7;
    if ((v6 & 1) == 0)
    {
      calendarsButton = (UIButton *)[(RootNavigationController *)self _updateCalendarsButtonConfiguration];
      uint64_t v3 = v7;
    }
  }

  _objc_release_x1(calendarsButton, v3);
}

- (id)_contactForCurrentIdentity
{
  if ([(CUIKCalendarModel *)self->_model containsDelegateSources])
  {
    uint64_t v3 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
    id v4 = v3;
    if (v3) {
      contactForSource(v3);
    }
    else {
    id v5 = [(RootNavigationController *)self _meContact];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    double v10 = v8;
  }
  else {
    double v10 = 0;
  }
  id v51 = v10;
  double v11 = [(RootNavigationController *)self transitionCoordinator];
  double v12 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  [(RootNavigationController *)self _updatePaletteStateWithViewController:v8];
  if (v11)
  {
    if ([v11 initiallyInteractive])
    {
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000B373C;
      v58[3] = &unk_1001D2DF0;
      v58[4] = self;
      id v13 = &v59;
      id v59 = v8;
      [v11 notifyWhenInteractionChangesUsingBlock:v58];
    }
    else
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1000B37CC;
      v56[3] = &unk_1001D2DF0;
      v56[4] = self;
      id v13 = &v57;
      id v57 = v8;
      [v11 animateAlongsideTransition:0 completion:v56];
    }
  }
  id v50 = v11;
  unsigned __int8 v14 = [(RootNavigationController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();

  uint64_t v15 = [v7 disappearingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [v7 viewControllers];
    unsigned __int8 v17 = [v16 containsObject:v15];

    if ((v17 & 1) == 0)
    {
      id v18 = [(RootNavigationController *)self model];
      [v18 setSelectedOccurrence:0];
    }
  }
  v49 = (void *)v15;
  id v19 = v51;
  if (isKindOfClass)
  {
    if (EKUIShouldSaveStateInPreferences())
    {
      id v20 = +[CUIKPreferences sharedPreferences];
      id v21 = +[NSNumber numberWithInteger:[(RootNavigationController *)self currentViewType]];
      [v20 setLastViewMode:v21];
    }
    if ([(RootNavigationController *)self currentViewType])
    {
      int64_t v22 = [(RootNavigationController *)self currentViewType];
      id v23 = [(RootNavigationController *)self model];
      v24 = [v23 persistedSceneState];
      [v24 setLastUsedNonYearView:v22];
    }
    [(RootNavigationController *)self updateNavigationBarButtonItemsWithViewController:v8];
    if (objc_opt_respondsToSelector())
    {
      id v25 = [v8 navigationBarTintColor];
      if (v25)
      {
        id v26 = [(RootNavigationController *)self navigationBar];
        [v26 setBarTintColor:v25];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v27 = [v8 toolBarTintColor];
      if (v27)
      {
        objc_super v28 = [(RootNavigationController *)self toolbar];
        [v28 setBarTintColor:v27];
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v8 navigationBarTintColor], (id v29 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v30 = [(RootNavigationController *)self navigationBar];
      [v30 setBarTintColor:0];

      id v29 = 0;
    }
  }
  [(RootNavigationController *)self updateToolbarItemsWithViewController:v8];
  v31 = v50;
  if ((id)[(RootNavigationController *)self activeWidthSizeClass] == (id)2)
  {
    if (isKindOfClass) {
      [(RootNavigationController *)self _configureViewSwitcherShowingViewController:v8];
    }
    v32 = [(RootNavigationController *)self view];
    [v32 bounds];
    -[RootNavigationController _updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:](self, "_updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:", v51, v33, v34);

    if (objc_opt_respondsToSelector())
    {
      [v51 updateNavigationBarDisplayedDateString];
    }
    else
    {
      id v47 = objc_alloc_init((Class)NSAttributedString);
      [(RootNavigationController *)self _setCurrentDateLabelString:v47];
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0 || ([v8 useCustomBackButton] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v48 = v7;
      CLLocationCoordinate2D v35 = [(RootNavigationController *)self viewControllers];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v36 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v53;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v53 != v38) {
              objc_enumerationMutation(v35);
            }
            long long v40 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v41 = [v40 navigationItem];
              [v41 setTitleView:0];

              id v42 = [v40 hidesBackButton];
              v43 = [v40 navigationItem];
              [v43 setHidesBackButton:v42];

              id v44 = [v40 navigationItem];
              [v44 setLeftBarButtonItems:0];
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v37);
      }
      v45 = [(RootNavigationController *)self model];
      id v46 = [v45 selectedDate];
      [(RootNavigationController *)self updateBackButtonToDate:v46];

      id v7 = v48;
      v31 = v50;
      id v19 = v51;
    }
  }
  [(RootNavigationController *)self _setNeedsUserActivityUpdate];
  [(RootNavigationController *)self updateShouldDisplayJumpToTodayTip];
}

- (void)_updateBackButtonToDate:(id)a3 container:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  id v8 = v6;
  double v9 = [(RootNavigationController *)self _higherScopeCompactCalendarViewControllerRelativeTo:v8];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v8 shouldUpdateOwnBackButtonWhenTopViewController])
  {
    double v10 = [v8 updateBackButtonWhileTopViewControllerToDate:v14];
    if (v10)
    {
      double v11 = [v9 parentViewController];
      double v12 = [v11 navigationItem];
      [v12 setBackButtonTitle:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v9 invalidateBackButtonDate];
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_11;
    }
    double v10 = [v9 parentViewController];
    [v10 updateBackButtonToDate:v14];
  }

LABEL_11:
  id v13 = [(RootNavigationController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (id)_higherScopeCompactCalendarViewControllerRelativeTo:(id)a3
{
  id v4 = a3;
  id v5 = [(RootNavigationController *)self viewControllers];
  uint64_t v6 = (uint64_t)[v5 indexOfObject:v4];

  id v7 = 0;
  if (!v4 || v6 == 0x7FFFFFFFFFFFFFFFLL || v6 < 1) {
    goto LABEL_12;
  }
  id v8 = 0;
  uint64_t v9 = v6 + 1;
  while (1)
  {
    double v10 = [(RootNavigationController *)self viewControllers];
    double v11 = [v10 objectAtIndex:v9 - 2];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_8:

    if ((unint64_t)--v9 < 2)
    {
      id v7 = 0;
      goto LABEL_11;
    }
  }
  id v12 = v11;

  uint64_t v13 = [v12 childViewControllerForCompactWidthRegularHeight];
  if (!v13)
  {
    id v8 = v12;
    goto LABEL_8;
  }
  id v7 = (void *)v13;

  id v8 = v12;
LABEL_11:

LABEL_12:

  return v7;
}

- (void)_selectedDateChanged:(id)a3
{
  [(RootNavigationController *)self _setNeedsUserActivityUpdate];

  [(RootNavigationController *)self updateSelectedDateForJumpToTodayTip];
}

- (void)_setNeedsUserActivityUpdate
{
  if (!self->_userActivityNeedsUpdate)
  {
    self->_BOOL userActivityNeedsUpdate = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AEE08;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateSelectedDateForJumpToTodayTip
{
  if (self->_extendedLaunchOver)
  {
    CUIKTodayDate();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [(CUIKCalendarModel *)self->_model selectedDate];
    id v4 = [v3 calendarDateForDay];
    id v5 = [v4 date];

    uint64_t v6 = [(CUIKCalendarModel *)self->_model calendar];
    id v7 = [v6 dateByAddingUnit:16 value:-5 toDate:v14 options:0];

    id v8 = [(CUIKCalendarModel *)self->_model calendar];
    unsigned int v9 = [v5 isBeforeDayForDate:v7 inCalendar:v8];

    double v10 = [(CUIKCalendarModel *)self->_model calendar];
    double v11 = [v10 dateByAddingUnit:16 value:5 toDate:v14 options:0];

    id v12 = [(CUIKCalendarModel *)self->_model calendar];
    LODWORD(v10) = [v5 isAfterDayForDate:v11 inCalendar:v12];

    uint64_t v13 = +[CalendarTipsManager sharedManager];
    [v13 donateIsSelectedDateFiveDaysAwayFromToday:v9 | v10];
  }
}

- (void)willEnterForeground
{
  self->_compactBackgroundedViewType = -1;
  self->_regularBackgroundedViewType = -1;
}

- (void)userActivityWillSave:(id)a3
{
}

- (void)updateShouldDisplayJumpToTodayTip
{
  if (self->_extendedLaunchOver)
  {
    int64_t v3 = [(RootNavigationController *)self currentViewType];
    int64_t v4 = [(RootNavigationController *)self currentViewType];
    if (v3 == 3
      || v4 == 4
      && ([(RootNavigationController *)self traitCollection],
          id v5 = objc_claimAutoreleasedReturnValue(),
          id v6 = [v5 horizontalSizeClass],
          v5,
          v6 == (id)1))
    {
      id v7 = +[CalendarTipsManager sharedManager];
      id v8 = [(RootNavigationController *)self topViewController];
      [v7 updatePresentedControllerTo:v8];

      unsigned int v9 = +[CalendarTipsManager sharedManager];
      id v11 = v9;
      uint64_t v10 = 1;
    }
    else
    {
      unsigned int v9 = +[CalendarTipsManager sharedManager];
      id v11 = v9;
      uint64_t v10 = 0;
    }
    [v9 donateShouldDisplayTip:v10];
  }
}

- (void)setViewSwitcherLayoutHandler:(id)a3
{
}

- (void)setTodayBarButtonItem:(id)a3
{
}

- (void)setShowingOverriddenToolbarItems:(BOOL)a3
{
  self->_showingOverriddenToolbarItems = a3;
}

- (void)setInboxBarButtonItem:(id)a3
{
}

- (void)setCalendarsBarButtonItem:(id)a3
{
}

- (void)setAvatarViewVisible:(BOOL)a3
{
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  [(RootNavigationController *)self _updateInteractivePopAllowed];

  [(RootNavigationController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (id)imageForCurrentDayViewMode
{
  int64_t v3 = [(RootNavigationController *)self currentDayViewMode];

  return [(RootNavigationController *)self imageForDayViewMode:v3];
}

- (BOOL)extendedLaunchFinished
{
  return self->_extendedLaunchOver;
}

- (void)didBecomeActive
{
}

- (Class)classForStackBaseContainerForCurrentTraits
{
  return (Class)objc_opt_class();
}

- (void)_updateCalendarsButtonMenuProvider
{
  if ([(CUIKCalendarModel *)self->_model containsDelegateSources])
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000AEFA0;
    v4[3] = &unk_1001D4210;
    objc_copyWeak(&v5, &location);
    [(UIButton *)self->_calendarsButton _setMenuProvider:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    calendarsButton = self->_calendarsButton;
    [(UIButton *)calendarsButton _setMenuProvider:0];
  }
}

- (void)_updateCalendarButtonAccessory
{
  if (self->_extendedLaunchOver && self->_calendarsButton)
  {
    [(RootNavigationController *)self _updateCalendarButtonSpinner];
    [(RootNavigationController *)self _updateCalendarButtonError];
  }
}

- (void)dealloc
{
  int64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CUIKCalendarModelNotificationCountsChangedNotification object:self->_model];
  [v3 removeObserver:self name:CUIKCalendarModelCalendarsChangedNotification object:self->_model];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
  [v3 removeObserver:self name:CUIKLocaleChangedNotification object:0];
  [v3 removeObserver:self name:CUIKCalendarModelTimeZoneChangedNotification object:0];
  [v3 removeObserver:self name:CUIKCalendarModelSelectedDateChangedNotification object:0];
  [v3 removeObserver:self name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:0];
  [v3 removeObserver:self name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];
  [v3 removeObserver:self name:CalMeCardChangedNotification object:0];
  [v3 removeObserver:self name:CUIKPreferencesNotification_MonthWeekScale object:0];
  userActivityForDateInView = self->_userActivityForDateInView;
  if (userActivityForDateInView)
  {
    [(NSUserActivity *)userActivityForDateInView setDelegate:0];
    [(NSUserActivity *)self->_userActivityForDateInView invalidate];
    id v5 = self->_userActivityForDateInView;
    self->_userActivityForDateInView = 0;
  }
  userActivityForEvent = self->_userActivityForEvent;
  if (userActivityForEvent)
  {
    [(NSUserActivity *)userActivityForEvent setDelegate:0];
    [(NSUserActivity *)self->_userActivityForEvent invalidate];
    id v7 = self->_userActivityForEvent;
    self->_userActivityForEvent = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationController;
  [(RootNavigationController *)&v8 dealloc];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache];
  int64_t v4 = +[CUIKPreferences sharedPreferences];
  +[EKDayTimeView defaultHourScale];
  *(float *)&double v5 = v5;
  id v6 = +[NSNumber numberWithFloat:v5];
  [v4 setDayViewHourScale:v6];

  id v7 = +[CUIKPreferences sharedPreferences];
  +[EKDayTimeView defaultHourScale];
  *(float *)&double v8 = v8;
  unsigned int v9 = +[NSNumber numberWithFloat:v8];
  [v7 setWeekViewHourScale:v9];

  [(RootNavigationController *)self _updateViewSwitcherFont];
}

- (void)_focusModeConfigurationChanged:(id)a3
{
  [(RootNavigationController *)self _updateFilterLabelAnimate:1];
  id v4 = [(RootNavigationController *)self topViewController];
  [(RootNavigationController *)self _updatePaletteStateWithViewController:v4];
}

- (void)_identityChanged:(id)a3
{
  [(RootNavigationController *)self updateCurrentIdentity];
  [(RootNavigationController *)self _updateCalendarButtonAccessory];
  [(RootNavigationController *)self _updateAddEventButtonEnabledness];

  [(RootNavigationController *)self _notificationCountChanged:0];
}

- (void)_delegatesChanged:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      double v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) sourceIdentifier];
        uint64_t v10 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
        id v11 = [v10 sourceIdentifier];
        unsigned __int8 v12 = [v9 isEqualToString:v11];

        if (v12)
        {

          goto LABEL_11;
        }
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(CUIKCalendarModel *)self->_model updateSourceForSelectedIdentity:0 selectedCalendars:0];
LABEL_11:
  [(RootNavigationController *)self updateCurrentIdentity];
  [(RootNavigationController *)self _updateAddEventButtonEnabledness];
  [(RootNavigationController *)self _updateCalendarsButtonMenuProvider];
}

- (void)_createLeftFixedSpaceBarItemIfNeeded
{
  if (!self->_leftFixedSpaceBarItem)
  {
    int64_t v3 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    leftFixedSpaceBarItem = self->_leftFixedSpaceBarItem;
    self->_leftFixedSpaceBarItem = v3;
    _objc_release_x1(v3, leftFixedSpaceBarItem);
  }
}

- (id)_meContact
{
  cachedMeContact = self->_cachedMeContact;
  if (!cachedMeContact)
  {
    id v4 = +[CalContactsProvider defaultProvider];
    id v5 = [v4 unifiedMeContact];

    if (v5)
    {
      id v6 = +[ContactsUtils defaultContactKeysToFetch];
      uint64_t v7 = +[ContactsUtils contactForContact:v5 keysToFetch:v6];
    }
    else
    {
      uint64_t v7 = (CNContact *)objc_alloc_init((Class)CNContact);
    }
    double v8 = self->_cachedMeContact;
    self->_cachedMeContact = v7;

    cachedMeContact = self->_cachedMeContact;
  }

  return cachedMeContact;
}

- (void)_updateFilterLabelAnimate:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(RootNavigationController *)self calendarsBarButtonItem];
    id v5 = [v4 customView];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AF0E8;
    v6[3] = &unk_1001D2740;
    v6[4] = self;
    +[UIView transitionWithView:v5 duration:5242884 options:v6 animations:0 completion:0.2];
  }
  else
  {
    [(RootNavigationController *)self _updateFilterLabel];
  }
}

- (void)_updateInboxBarButtonItem
{
  [objc_opt_class() _inboxTitleForNotificationCount:[self numberOfNotifications]];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [(RootNavigationController *)self inboxBarButtonItem];
  [v3 setTitle:v4];
}

- (void)updateListToggleBarButtonItem
{
  id v3 = [(RootNavigationController *)self generateCurrentListToggleBarButtonItemMenu];
  [(UIBarButtonItem *)self->_listToggleBarButtonItem setMenu:v3];
}

- (void)_monthWeekScaleChanged:(id)a3
{
  id v4 = [(RootNavigationController *)self compactMonthMenu];
  [(UIBarButtonItem *)self->_dividedMonthToggleBarButtonItem setMenu:v4];
}

- (BOOL)_isCurrentlyDraggingEvent
{
  v2 = [(RootNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if ([v3 currentChildViewControllerIsLoaded])
    {
      id v4 = [v3 currentChildViewController];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 currentlyEditingEventsWithGestures])
  {
    id v5 = kCalUILogHandle;
    BOOL v6 = 1;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      unsigned int v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Main view controller is currently editing events with gestures: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_searchPressed
{
}

- (void)openSearchLinkActionWithCompletion:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AF730;
  v7[3] = &unk_1001D4388;
  id v8 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AF760;
  void v5[3] = &unk_1001D3038;
  id v6 = v8;
  id v4 = v8;
  [(RootNavigationController *)self performUIAction:@"Search Button link action" block:v7 cancelBlock:v5];
}

- (void)addEventPressed
{
}

- (void)listTogglePressed
{
}

- (void)performUIAction:(id)a3 block:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v12 = v11;
    long long v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    id v29 = v14;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[UserStateLog] Action -> %{public}@ %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  int64_t v22 = sub_1000AFAE8;
  id v23 = &unk_1001D4410;
  objc_copyWeak(&v27, (id *)buf);
  id v15 = v8;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  id v17 = v9;
  id v26 = v17;
  id v18 = objc_retainBlock(&v20);
  id v19 = +[CalendarTipsManager sharedManager];
  [v19 dismissTipDueToUserNavigationWithCompletionBlock:v18];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)toggleDayViewMode:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      uint64_t v7 = [(RootNavigationController *)self model];
      [v7 setShowDayAsList:1];
LABEL_8:

      break;
    case 1:
      id v9 = [(RootNavigationController *)self model];
      [v9 setShowDayAsList:0];

      int64_t v10 = +[MultiDayWeekView numMultiDays];
      id v6 = [(RootNavigationController *)self model];
      uint64_t v7 = v6;
      uint64_t v8 = v10;
      goto LABEL_7;
    case 0:
      id v5 = [(RootNavigationController *)self model];
      [v5 setShowDayAsList:0];

      id v6 = [(RootNavigationController *)self model];
      uint64_t v7 = v6;
      uint64_t v8 = 1;
LABEL_7:
      [v6 setNumDaysToShow:v8];
      goto LABEL_8;
  }
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    id v11 = [(RootNavigationController *)self imageForCurrentDayViewMode];
    [(UIBarButtonItem *)self->_listToggleBarButtonItem setImage:v11];
  }
  else
  {
    [(UIBarButtonItem *)self->_listToggleBarButtonItem setSelected:a3 == 2];
  }
  [(RootNavigationController *)self updateDayViewModeContainer];

  [(RootNavigationController *)self updateListToggleBarButtonItem];
}

- (void)updateDayViewModeContainer
{
  id v3 = [(RootNavigationController *)self window];
  char IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  if (IsRegularInViewHierarchy) {
    return;
  }
  id v19 = [(RootNavigationController *)self topMainViewControllerContainer];
  if ([v19 representsDayInViewHierarchy])
  {
    int64_t v5 = [(RootNavigationController *)self currentDayViewMode];
    if (v5 == 2)
    {
      uint64_t v7 = [ListViewContainerViewController alloc];
      uint64_t v8 = [(RootNavigationController *)self model];
      id v9 = [(RootNavigationController *)self window];
      int64_t v10 = [(MainViewControllerContainer *)v7 initWithModel:v8 window:v9];

      id v11 = [(ListViewContainerViewController *)v10 currentChildViewController];
      [v11 setAllowExtendedHeightCells:1];
    }
    else
    {
      if (v5 == 1)
      {
        id v6 = MultiDayWeekViewContainerViewController;
      }
      else
      {
        if (v5)
        {
          int64_t v10 = 0;
          goto LABEL_12;
        }
        id v6 = DayViewContainerViewController;
      }
      id v12 = [v6 alloc];
      id v11 = [(RootNavigationController *)self model];
      long long v13 = [(RootNavigationController *)self window];
      int64_t v10 = (ListViewContainerViewController *)[v12 initWithModel:v11 window:v13];
    }
LABEL_12:
    long long v14 = [(RootNavigationController *)self viewControllers];
    id v15 = (char *)[v14 count];

    id v16 = [(RootNavigationController *)self viewControllers];
    id v17 = [v16 subarrayWithRange:0, v15 - 1];

    id v18 = [v17 arrayByAddingObject:v10];

    [(RootNavigationController *)self doCrossfadeAnimationWithNavigationViewContents];
    [(RootNavigationController *)self setViewControllers:v18 animated:0];
  }
}

- (void)todayPressed
{
  id v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    int64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[UserStateLog] Action -> %{public}@ today button tapped", (uint8_t *)&v8, 0xCu);
  }
  CalAnalyticsSendEvent();
  uint64_t v7 = +[CalendarTipsManager sharedManager];
  [v7 donateTodayButtonPressed];

  [(RootNavigationController *)self selectTodayWithTrigger:0 animated:1];
}

- (void)calendarsPressed
{
}

- (void)openCalendarsLinkActionWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(RootNavigationController *)self ekui_futureTraitCollection];
  if ([v5 horizontalSizeClass] == (id)1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B025C;
    v8[3] = &unk_1001D4388;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B026C;
    v6[3] = &unk_1001D3038;
    id v7 = v9;
    [(RootNavigationController *)self performUIAction:@"Calendars Button Link Action" block:v8 cancelBlock:v6];
  }
}

- (void)inboxPressed
{
}

- (void)openInboxLinkActionWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B0364;
  void v5[3] = &unk_1001D4388;
  id v6 = a3;
  id v4 = v6;
  [(RootNavigationController *)self performUIAction:@"Calendars Button Link Action" block:v5 cancelBlock:v4];
}

- (BOOL)dismissPresentedViewController
{
  return [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:1 completion:0];
}

- (id)_presentedEditor
{
  v2 = [(RootNavigationController *)self presentedViewController];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 presentedViewController];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (BOOL)_dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(RootNavigationController *)self presentedViewController];
  if (!v7)
  {
    BOOL v9 = 1;
    BOOL v15 = 1;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  int v8 = [(RootNavigationController *)self _presentedEditor];
  BOOL v9 = v8 != 0;
  int64_t v10 = kCalUILogHandle;
  BOOL v11 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      id v12 = v10;
      long long v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will not show calendar view because an editor [%@] is being presented.", buf, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Dismissing view controller: [%@]", buf, 0xCu);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_1000B0648;
    v17[3] = &unk_1001D3518;
    v17[4] = self;
    id v18 = v6;
    char v19 = 1;
    [(RootNavigationController *)self dismissViewControllerAnimated:v4 completion:v17];
  }
  BOOL v15 = v8 == 0;

  if (v6)
  {
LABEL_11:
    if (v9) {
      (*((void (**)(id, BOOL))v6 + 2))(v6, v15);
    }
  }
LABEL_13:

  return v15;
}

- (id)showInboxAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RootNavigationController *)self dismissPresentedViewController])
  {
    uint64_t v5 = [(RootNavigationController *)self _popToViewControllerSatisfying:&stru_1001D4490];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(RootNavigationController *)self showInboxAnimated:v3 completion:0];

      goto LABEL_7;
    }
    int v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "The current top view controller does not allow the invitations view to be displayed above it.", v10, 2u);
    }
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)showInboxAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(RootNavigationController *)self model];
  [v7 startNotificationMonitor];

  int v8 = [InboxViewController alloc];
  BOOL v9 = [(RootNavigationController *)self model];
  int64_t v10 = [(InboxViewController *)v8 initWithModel:v9 destination:0];

  [(InboxViewController *)v10 setDelegate:self];
  [(RootNavigationController *)self _forceInboxButtonCreationIfNeeded];
  BOOL v11 = [(RootNavigationController *)self inboxBarButtonItem];
  EKUIContainedControllerIdealWidth();
  double v13 = v12;
  EKUIContainedControllerIdealWidth();
  double v15 = v14;
  EKUIGoldenRatioPhi();
  -[RootNavigationController _presentAdaptiveModalPopoverViewController:relativeToBarButtonItem:permittedArrowDirections:contentSize:animated:completion:](self, "_presentAdaptiveModalPopoverViewController:relativeToBarButtonItem:permittedArrowDirections:contentSize:animated:completion:", v10, v11, 2, v4, v6, v13, v15 * v16);

  return v10;
}

- (void)inboxViewControllerWantsShowEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v9 showEvent:v8 animated:v6 showMode:a5 context:0];
}

- (void)showCalendarsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B0A3C;
  v6[3] = &unk_1001D3688;
  BOOL v9 = a3;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(RootNavigationController *)v7 _dismissPresentedViewControllerAnimated:v4 completion:v6];
}

- (void)_showCalendarsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [CalendarsViewController alloc];
  id v8 = [(RootNavigationController *)self model];
  BOOL v9 = [(CalendarsViewController *)v7 initWithModel:v8 destination:0];
  calendarsViewController = self->_calendarsViewController;
  self->_calendarsViewController = v9;

  BOOL v11 = [(RootNavigationController *)self _doneBlock];
  [(CalendarsViewController *)self->_calendarsViewController setDoneBlock:v11];

  double v12 = self->_calendarsViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B0B6C;
  v14[3] = &unk_1001D2808;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [(RootNavigationController *)self presentViewController:v12 animated:v4 completion:v14];
}

- (void)showCalendar:(id)a3
{
}

- (id)delegatesMenu
{
  if ([(CUIKCalendarModel *)self->_model containsDelegateSources])
  {
    val = self;
    BOOL v3 = [(RootNavigationController *)self model];
    id v26 = [v3 sortedEnabledDelegates];

    id v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v26, "count") + 1);
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v25 = [v4 localizedStringForKey:@"Switch delegate account…" value:&stru_1001D6918 table:0];

    objc_initWeak(location, val);
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"My Calendar" value:&stru_1001D6918 table:0];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000B10C0;
    v37[3] = &unk_1001D44B8;
    objc_copyWeak(&v38, location);
    id v7 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v37];

    id v8 = [(RootNavigationController *)val model];
    BOOL v9 = [v8 sourceForSelectedIdentity];
    BOOL v10 = v9 == 0;

    if (v10) {
      [v7 setState:1];
    }
    [v29 addObject:v7];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    BOOL v11 = [(RootNavigationController *)val model];
    id obj = [v11 sortedEnabledDelegates];

    id v12 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v12)
    {
      uint64_t v28 = *(void *)v34;
      do
      {
        id v13 = 0;
        double v14 = v7;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v13);
          double v16 = CUIKDisplayedTitleForSource();
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1000B1124;
          v31[3] = &unk_1001D44E0;
          objc_copyWeak(&v32, location);
          v31[4] = v15;
          id v7 = +[UIAction actionWithTitle:v16 image:0 identifier:0 handler:v31];

          id v17 = [v15 sourceIdentifier];
          id v18 = [(RootNavigationController *)val model];
          char v19 = [v18 sourceForSelectedIdentity];
          id v20 = [v19 sourceIdentifier];
          unsigned int v21 = [v17 isEqualToString:v20];

          if (v21) {
            [v7 setState:1];
          }
          [v29 addObject:v7];
          objc_destroyWeak(&v32);
          id v13 = (char *)v13 + 1;
          double v14 = v7;
        }
        while (v12 != v13);
        id v12 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v12);
    }

    int64_t v22 = +[UIMenu menuWithTitle:v25 children:v29];

    objc_destroyWeak(&v38);
    objc_destroyWeak(location);
  }
  else
  {
    id v23 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "No delegates menu because there are no other identites available", (uint8_t *)location, 2u);
    }
    int64_t v22 = 0;
  }

  return v22;
}

- (void)showAddEventAnimated:(BOOL)a3
{
}

- (void)showAddEventAnimated:(BOOL)a3 fromBarButtonItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(RootNavigationController *)self bestDateForNewEvent];
  LOBYTE(v7) = 0;
  [(RootNavigationController *)self showAddEventAnimated:v4 fromBarButtonItem:v6 withTitle:0 startDate:v8 exactStartDate:0 endDate:0 location:0 suggestionKey:0 allDay:v7 completion:0];
}

- (void)showAddEventAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(RootNavigationController *)self bestDateForNewEvent];
  LOBYTE(v7) = 0;
  [(RootNavigationController *)self showAddEventAnimated:v4 fromBarButtonItem:0 withTitle:0 startDate:v8 exactStartDate:0 endDate:0 location:0 suggestionKey:0 allDay:v7 completion:v6];
}

- (void)showAddEventAnimated:(BOOL)a3 fromBarButtonItem:(id)a4 withTitle:(id)a5 startDate:(id)a6 exactStartDate:(id)a7 endDate:(id)a8 location:(id)a9 suggestionKey:(id)a10 allDay:(BOOL)a11 completion:(id)a12
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000B1474;
  void v30[3] = &unk_1001D4528;
  v30[4] = self;
  id v31 = v18;
  id v32 = v19;
  id v33 = a8;
  BOOL v39 = a11;
  id v34 = a9;
  id v35 = v20;
  id v36 = a10;
  id v37 = v17;
  BOOL v40 = a3;
  id v38 = a12;
  id v21 = v38;
  id v22 = v17;
  id v23 = v36;
  id v24 = v20;
  id v25 = v34;
  id v26 = v33;
  id v27 = v19;
  id v28 = v18;
  [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:v30];
}

- (void)showNewEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v5 showEvent:v4 animated:1 showMode:0 context:0];
}

- (id)_doneBlock
{
  return [(RootNavigationController *)self _doneBlockWithCompletion:0];
}

- (id)_doneBlockWithCompletion:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B17D4;
  v7[3] = &unk_1001D4578;
  void v7[4] = self;
  id v8 = a3;
  id v3 = v8;
  id v4 = objc_retainBlock(v7);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (void)presentModalViewController:(id)a3 withTransition:(int)a4
{
  [(RootNavigationController *)self presentAdaptiveModalViewController:a3 animated:a4 != 0 completion:0];
}

- (void)presentAdaptiveModalViewController:(id)a3
{
}

- (void)presentAdaptiveModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  LOBYTE(v5) = a4;
  -[RootNavigationController _presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:](self, "_presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:", a3, -1, 0, 0, -1, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, CGSizeZero.width, CGSizeZero.height, v5, a5);
}

- (void)_presentAdaptiveModalPopoverViewController:(id)a3 relativeToBarButtonItem:(id)a4 permittedArrowDirections:(unint64_t)a5 contentSize:(CGSize)a6 animated:(BOOL)a7 completion:(id)a8
{
  double height = a6.height;
  double width = a6.width;
  id v15 = a8;
  id v16 = a4;
  id v17 = a3;
  id v19 = [(RootNavigationController *)self view];
  LOBYTE(v18) = a7;
  -[RootNavigationController _presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:](self, "_presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:", v17, 7, v16, v19, a5, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, width, height, v18, v15);
}

- (void)presentAdaptiveModalPopoverViewController:(id)a3 relativeToSourceRect:(CGRect)a4 withSourceView:(id)a5 passThroughViews:(id)a6 permittedArrowDirections:(unint64_t)a7 contentSize:(CGSize)a8 animated:(BOOL)a9 completion:(id)a10
{
  LOBYTE(v10) = a9;
  -[RootNavigationController _presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:](self, "_presentAdaptiveModalViewController:withPresentationStyleOverride:relativeToBarButtonItem:withSourceView:sourceRect:permittedArrowDirections:contentSize:passThroughViews:animated:completion:", a3, 7, 0, a5, a7, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a8.width, a8.height, v10, a10);
}

- (void)setupPresentationControllerIfStyleIsPopover:(int64_t)a3 barButtonItem:(id)a4 passThroughViews:(id)a5 permittedArrowDirections:(unint64_t)a6 sourceRect:(CGRect)a7 sourceView:(id)a8 viewController:(id)a9
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v23 = a4;
  id v19 = a5;
  id v20 = a8;
  if (a3 != 7) {
    goto LABEL_10;
  }
  id v21 = [a9 popoverPresentationController];
  [v21 _setIgnoreBarButtonItemSiblings:1];
  [v21 setDelegate:self];
  [v21 setPermittedArrowDirections:a6];
  if (v23) {
    [v21 setBarButtonItem:v23];
  }
  if (!v20)
  {
    id v22 = [(RootNavigationController *)self view];
    [v21 setSourceView:v22];

    if (!v19) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [v21 setSourceView:v20];
  if (v19) {
LABEL_6:
  }
    [v21 setPassthroughViews:v19];
LABEL_7:
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (!CGRectIsNull(v25)) {
    [v21 setSourceRect:x, y, width, height];
  }

LABEL_10:
}

- (void)_presentAdaptiveModalViewController:(id)a3 withPresentationStyleOverride:(int64_t)a4 relativeToBarButtonItem:(id)a5 withSourceView:(id)a6 sourceRect:(CGRect)a7 permittedArrowDirections:(unint64_t)a8 contentSize:(CGSize)a9 passThroughViews:(id)a10 animated:(BOOL)a11 completion:(id)a12
{
  double height = a9.height;
  double width = a9.width;
  double v18 = a7.size.height;
  double v19 = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v23 = a3;
  id v24 = a5;
  id v25 = a6;
  id v50 = a10;
  id v26 = a12;
  id v27 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000B2058;
  v51[3] = &unk_1001D2808;
  id v28 = v26;
  v51[4] = self;
  id v52 = v28;
  id v29 = objc_retainBlock(v51);
  if (objc_opt_respondsToSelector())
  {
    __int16 v30 = [(RootNavigationController *)self _doneBlock];
    [v23 performSelector:"setDoneBlock:" withObject:v30];
  }
  if (a4 == -1)
  {
    id v31 = [(RootNavigationController *)self view];
    BOOL v32 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    if (v32) {
      a4 = 1;
    }
    else {
      a4 = 7;
    }
  }
  [v23 setModalPresentationStyle:a4, a8];
  BOOL v33 = CGSizeZero.width == width;
  if (CGSizeZero.height != height) {
    BOOL v33 = 0;
  }
  if (a4 == 1 || v33)
  {
    EKUIContainedControllerIdealWidth();
    double width = v34;
    EKUIContainedControllerIdealWidth();
    double v36 = v35;
    EKUIGoldenRatioPhi();
    double height = v36 * v37;
  }
  id v38 = v25;
  [v23 setPreferredContentSize:CGSizeMake(width, height)];
  if (v24)
  {
    int64_t v39 = a4;
    BOOL v40 = v50;
    -[RootNavigationController setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:](self, "setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:", v39, v24, v50, v49, v25, v23, x, y, v19, v18);
    long long v41 = (id)kCalUILogHandle;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v43 = v23;
      if (isKindOfClass)
      {
        v43 = [v23 topViewController];
      }
      *(_DWORD *)buf = 138412290;
      long long v54 = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[83058884] presenting adaptive vc %@", buf, 0xCu);
      if (isKindOfClass) {

      }
      id v38 = v25;
      BOOL v40 = v50;
    }

    [(RootNavigationController *)self presentViewController:v23 animated:a11 completion:v29];
  }
  else
  {
    id v44 = [(RootNavigationController *)self topMainViewControllerContainer];
    objc_opt_class();
    char v45 = objc_opt_isKindOfClass();
    id v46 = v44;
    if (v45)
    {
      [v23 setModalPresentationStyle:[v44 presentationStyleOverrideForChildViewControllers]];
      id v46 = self;
    }
    [(RootNavigationController *)v46 showViewController:v23 sender:self animated:a11 completion:v29];
    int64_t v47 = a4;
    BOOL v40 = v50;
    -[RootNavigationController setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:](self, "setupPresentationControllerIfStyleIsPopover:barButtonItem:passThroughViews:permittedArrowDirections:sourceRect:sourceView:viewController:", v47, 0, v50, v49, v25, v23, x, y, v19, v18);
  }
}

- (void)continueSearchWithTerm:(id)a3 animated:(BOOL)a4 removeViewControllersIncapableOfSearchIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  unsigned __int8 v21 = 0;
  BOOL v9 = [(RootNavigationController *)self topViewController];
  uint64_t v10 = [v9 navigationItem];
  BOOL v11 = [v10 rightBarButtonItems];
  id v12 = [(RootNavigationController *)self searchBarButtonItem];
  unsigned __int8 v13 = [v11 containsObject:v12];

  unsigned __int8 v21 = v13;
  if (v5 && !*((unsigned char *)v19 + 24))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_1000B2290;
    v17[3] = &unk_1001D45C8;
    v17[4] = self;
    void v17[5] = &v18;
    [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:v17];
  }
  if (v8 && *((unsigned char *)v19 + 24))
  {
    double v14 = [(RootNavigationController *)self presentedViewController];

    if (v14) {
      [(RootNavigationController *)self dismissViewControllerAnimated:0 completion:0];
    }
    id v15 = [(RootNavigationController *)self showSearchAnimated:v6 becomeFirstResponder:0 completion:0];
    id v16 = [v15 searchBar];
    [v16 setText:v8];
  }
  _Block_object_dispose(&v18, 8);
}

- (id)showSearchAnimated:(BOOL)a3 becomeFirstResponder:(BOOL)a4 completion:(id)a5
{
  BOOL v44 = a3;
  id v6 = a5;
  uint64_t v7 = [SearchResultsNavigationController alloc];
  id v8 = [(RootNavigationController *)self model];
  BOOL v9 = [(RootNavigationController *)self window];
  uint64_t v10 = [(SearchResultsNavigationController *)v7 initWithModel:v8 window:v9];

  BOOL v11 = [(SearchResultsNavigationController *)v10 searchResultsViewController];
  [v11 setSearchResultsDelegate:self];
  id v12 = [(SearchResultsNavigationController *)v10 toolbar];
  unsigned __int8 v13 = [v12 standardAppearance];
  id v14 = [v13 copy];
  id v15 = [(SearchResultsNavigationController *)v10 toolbar];
  [v15 setScrollEdgeAppearance:v14];

  id v16 = [[AdaptiveSearchController alloc] initWithSearchResultsController:v10];
  [(AdaptiveSearchController *)v16 setObscuresBackgroundDuringPresentation:1];
  [(AdaptiveSearchController *)v16 setHidesNavigationBarDuringPresentation:0];
  [(AdaptiveSearchController *)v16 setSearchResultsUpdater:v11];
  [(AdaptiveSearchController *)v16 setDelegate:v10];
  [(AdaptiveSearchController *)v16 setModalPresentationStyle:2];
  id v17 = [(SearchResultsNavigationController *)v10 view];
  [v17 bounds];
  -[AdaptiveSearchController setPreferredContentSize:](v16, "setPreferredContentSize:", v18, v19);

  uint64_t v20 = [(RootNavigationController *)self view];
  [(AdaptiveSearchController *)v16 _setShouldRespectPreferredContentSize:EKUICurrentWindowInterfaceParadigm_ShouldUseLargeFormatInterface()];

  unsigned __int8 v21 = [(AdaptiveSearchController *)v16 presentationController];
  [v21 setDelegate:self];

  id v22 = [(AdaptiveSearchController *)v16 searchBar];
  [(SearchResultsNavigationController *)v10 setSearchBar:v22];
  id v23 = [(SearchResultsNavigationController *)v10 searchResultsViewController];
  [v22 setDelegate:v23];

  id v24 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  [v22 layoutSubviews];
  id v25 = [(RootNavigationController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();

  id v26 = [(RootNavigationController *)self view];
  [v26 layoutMargins];
  double v28 = v27;
  double v30 = v29;

  [v22 setContentInset:0.0, v28, 0.0, v30];
  [v22 setShowsCancelButton:1 animated:0];
  id v31 = [v22 cancelButton];
  BOOL v32 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v33 = [v32 localizedStringForKey:@"Cancel - show search animated" value:@"Cancel" table:0];
  [v31 setTitle:v33 forState:0];

  double v34 = CalendarAppTintColor();
  [v31 setTitleColor:v34 forState:0];

  double v35 = CalendarAppTintColor();
  [v31 setTintColor:v35];

  double v36 = +[NSBundle bundleForClass:objc_opt_class()];
  double v37 = [v36 localizedStringForKey:@"Placeholder used in the search bar in the calendar occurrences list" value:@"Search" table:0];
  [v22 setPlaceholder:v37];

  [v22 _setBackdropStyle:2005];
  v52.receiver = self;
  v52.super_class = (Class)RootNavigationController;
  id v38 = [(RootNavigationController *)&v52 traitCollection];
  int64_t v39 = [v38 traitCollectionByModifyingTraits:&stru_1001D4608];

  [(SearchResultsNavigationController *)v10 setEkui_futureTraitCollection:v39];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000B2838;
  v46[3] = &unk_1001D4630;
  v46[4] = self;
  int64_t v47 = v16;
  BOOL v50 = v44;
  BOOL v51 = a4;
  id v48 = v22;
  id v49 = v6;
  id v40 = v6;
  id v41 = v22;
  id v42 = v16;
  [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:v44 completion:v46];

  return v11;
}

- (void)_showSearchController:(id)a3 withSearchBar:(id)a4 animated:(BOOL)a5 becomeFirstResponder:(BOOL)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B2950;
  v16[3] = &unk_1001D4658;
  BOOL v21 = a6;
  id v17 = a4;
  id v18 = v12;
  double v19 = self;
  id v20 = a7;
  id v13 = v12;
  id v14 = v20;
  id v15 = v17;
  [(RootNavigationController *)self presentViewController:v13 animated:v9 completion:v16];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 5;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4 = a3;
  BOOL v5 = [v4 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = (int64_t)[v4 presentationStyle];
  }

  return v7;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5 = a3;
  [v5 setDelegate:0];
  int64_t v7 = [(RootNavigationController *)self _doneBlock];
  v7[2](v7, v5, 0);

  id v6 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v6 invalidateManagedNavigationController];
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  id v3 = [v2 currentChildViewController];

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 eventViewControllerShouldHideInlineEditButton];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = [(RootNavigationController *)self topMainViewControllerContainer];
  id v8 = [v7 currentChildViewController];

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v9 = [v8 eventViewDelegateShouldShowNextOccurrenceOfEvent:v6 forward:v4];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(RootNavigationController *)self topMainViewControllerContainer];
  int64_t v7 = [v6 currentChildViewController];

  if (v7)
  {
    if (v4) {
      [v9 nextOccurrence];
    }
    else {
    id v8 = [v9 previousOccurrence];
    }
    if (v8) {
      [v7 showEvent:v8 animated:1 showMode:[v9 isBirthday] ^ 1 context:0];
    }
  }
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = v45;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000B313C;
    v45[3] = &unk_1001D2808;
    id v5 = &v46;
    id v13 = v10;
    void v45[4] = self;
    id v46 = v13;
  }
  else
  {
    id v12 = 0;
  }
  id v14 = objc_retainBlock(v12);
  if (a4 == 1)
  {
    id v15 = [v9 event];
    id v16 = [v15 calendar];
    id v17 = [v16 sharingStatus];

    if (v17)
    {
      if (v14)
      {
        id v38 = _NSConcreteStackBlock;
        uint64_t v39 = 3221225472;
        id v40 = sub_1000B31A0;
        id v41 = &unk_1001D2808;
        id v42 = self;
        id v43 = v11;
        id v18 = objc_retainBlock(&v38);

        id v14 = v18;
      }
      else
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_1000B3198;
        v44[3] = &unk_1001D2740;
        v44[4] = self;
        id v14 = objc_retainBlock(v44);
      }
    }
  }
  double v19 = [(RootNavigationController *)self topMainViewControllerContainer];
  id v20 = [v19 currentChildViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    BOOL v21 = [(RootNavigationController *)self topMainViewControllerContainer];
    [v21 currentChildViewController];
    double v37 = self;
    int64_t v22 = a4;
    id v23 = v11;
    id v24 = v9;
    id v25 = v14;
    v27 = id v26 = v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v5 = v26;
    id v14 = v25;
    id v9 = v24;
    BOOL v11 = v23;
    a4 = v22;
    self = v37;

    if ((isKindOfClass & 1) == 0)
    {
      [v9 setInternalEditViewDelegate:0];
      double v30 = [(RootNavigationController *)v37 _doneBlockWithCompletion:v14];
      ((void (**)(void, id, void))v30)[2](v30, v9, 0);
      id v31 = [(RootNavigationController *)v37 topMainViewControllerContainer];
      [v31 invalidateManagedNavigationController];
      goto LABEL_24;
    }
  }
  double v29 = [(RootNavigationController *)self topMainViewControllerContainer];
  double v30 = [v29 currentChildViewController];

  id v31 = [v9 event];
  if (a4 == 1)
  {
    BOOL v32 = [v9 calendarToMakeVisibleOnSave];
    BOOL v33 = [v32 objectID];

    if (v33)
    {
      double v34 = [(RootNavigationController *)self model];
      [v34 ensureCalendarVisibleWithId:v33];
    }
    [v30 editorDidSaveEvent:v31];
    double v35 = [v9 internalEditViewDelegate];

    if (v35 == self) {
      [(RootNavigationController *)self dismissViewControllerAnimated:1 completion:v14];
    }
  }
  else if (a4)
  {
    if (a4 == 2) {
      [v30 editorDidDeleteEvent:v31];
    }
  }
  else
  {
    [v30 editorDidCancelEditingEvent:v31];
    double v36 = [v9 internalEditViewDelegate];

    if (v36 == self) {
      [(RootNavigationController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
LABEL_24:

  if (v11) {
}
  }

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  id v3 = [(RootNavigationController *)self model];
  BOOL v4 = [v3 pasteboardManager];

  return v4;
}

- (id)calendarModel
{
  return self->_model;
}

- (void)attemptDisplayReviewPrompt
{
  id v5 = [(RootNavigationController *)self window];
  id v3 = [v5 windowScene];
  BOOL v4 = [(RootNavigationController *)self model];
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:v3 calendarModel:v4];
}

- (void)searchResultsViewController:(id)a3 didSelectEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v6 showEvent:v5 animated:1 showMode:1 context:0];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 presentedViewController];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___PopoverContentView];

  if (v5)
  {
    id v6 = [v3 presentedViewController];
    unsigned __int8 v7 = [v6 canDismiss];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v6 = a3;
  id v3 = [v6 presentedViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PresentationDismissal];

  if (v4)
  {
    unsigned int v5 = [v6 presentedViewController];
    [v5 didAttemptToDismiss];
  }
}

- (BOOL)_isThisTheOnlyConnectedScene
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 connectedScenes];

  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (+[CalendarSceneManager isSceneCalendarAppScene:v8])
        {
          id v9 = [v8 _sceneIdentifier];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
          BOOL v11 = [WeakRetained windowScene];
          id v12 = [v11 _sceneIdentifier];
          unsigned int v13 = [v9 isEqualToString:v12];

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)_showNextDateComponentUnitAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v4 navigateToNextDateComponentUnitAnimated:v3];
}

- (void)_showPreviousDateComponentUnitAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v4 navigateToPreviousDateComponentUnitAnimated:v3];
}

- (void)_selectNextEvent
{
  id v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v2 navigateToNextSelectableItem];
}

- (void)_selectPreviousEvent
{
  id v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v2 navigateToPreviousSelectableItem];
}

- (id)_popToViewControllerSatisfying:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [(RootNavigationController *)self viewControllers];
    uint64_t v6 = [v5 reverseObjectEnumerator];

    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
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
          BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v4[2](v4, v11))
          {
            id v12 = v11;

            if (v12)
            {
              unsigned int v13 = kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v21 = v12;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Popping to view controller: [%@]", buf, 0xCu);
              }
              id v14 = [(RootNavigationController *)self popToViewController:v12 animated:0];
            }
            goto LABEL_16;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = 0;
  }
  else
  {
    id v12 = [(RootNavigationController *)self topViewController];
  }
LABEL_16:

  return v12;
}

- (void)doCrossfadeAnimationWithNavigationViewContents
{
  BOOL v3 = [(RootNavigationController *)self presentedViewController];

  if (!v3)
  {
    [(RootNavigationController *)self doCrossfadeAnimationWithCurrentScreenContents];
  }
}

- (void)doCrossfadeAnimationWithCurrentScreenContents
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1000B3BC0;
  unsigned int v13 = sub_1000B3BD0;
  BOOL v3 = [(RootNavigationController *)self view];
  id v4 = [v3 window];
  id v14 = [v4 snapshotViewAfterScreenUpdates:0];

  id v5 = [(RootNavigationController *)self view];
  uint64_t v6 = [v5 superview];

  [v6 addSubview:v10[5]];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B3BD8;
  v8[3] = &unk_1001D4680;
  void v8[4] = &v9;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B3BEC;
  v7[3] = &unk_1001D46A8;
  void v7[4] = &v9;
  +[UIView animateWithDuration:196610 delay:v8 options:v7 animations:0.2 completion:0.0];

  _Block_object_dispose(&v9, 8);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(RootNavigationController *)self model];
      unsigned int v11 = [v10 showMonthAsDivided];

      if (v11) {
        id v12 = CompactDividedMonthDayAnimator;
      }
      else {
        id v12 = CompactMonthDayAnimator;
      }
      goto LABEL_30;
    }
    if (objc_opt_isKindOfClass())
    {
      long long v16 = [(RootNavigationController *)self model];
      unsigned int v17 = [v16 showMonthAsDivided];

      if (v17) {
        id v12 = CompactDividedMonthMultiDayAnimator;
      }
      else {
        id v12 = CompactMonthMultiDayAnimator;
      }
      goto LABEL_30;
    }
    if (objc_opt_isKindOfClass())
    {
      long long v20 = [YearMonthAnimator alloc];
      id v21 = [(RootNavigationController *)self model];
      int64_t v22 = [(YearMonthAnimator *)v20 initWithModel:v21 paletteView:self->_paletteView reverse:1];

      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_47;
      }
      id v23 = [v8 currentChildViewController];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v23 dividedListMode])
      {
        id v24 = [v23 dateForCurrentMonthOnScreen];
        [(YearMonthAnimator *)v22 setSelectedDate:v24];
      }
      goto LABEL_46;
    }
    if (objc_opt_isKindOfClass())
    {
      BOOL v33 = [(RootNavigationController *)self model];
      unsigned int v34 = [v33 showMonthAsDivided];

      if (v34) {
        id v12 = DividedMonthListAnimator;
      }
      else {
        id v12 = CompactMonthListAnimator;
      }
      goto LABEL_30;
    }
LABEL_37:
    int64_t v22 = 0;
    goto LABEL_47;
  }
  if (objc_opt_isKindOfClass())
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_37;
    }
    unsigned int v13 = [(RootNavigationController *)self model];
    unsigned int v14 = [v13 showMonthAsDivided];

    if (v14)
    {
      id v15 = CompactDividedMonthDayAnimator;
      goto LABEL_44;
    }
    BOOL v27 = (_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl();
    double v35 = [(RootNavigationController *)self model];
    uint64_t v36 = (uint64_t)[v35 numDaysToShow];

    if (!v27 || v36 < 2)
    {
      id v15 = CompactMonthDayAnimator;
      goto LABEL_44;
    }
LABEL_42:
    id v15 = CompactMonthMultiDayAnimator;
    goto LABEL_44;
  }
  if (objc_opt_isKindOfClass())
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_37;
    }
    long long v18 = [(RootNavigationController *)self model];
    unsigned int v19 = [v18 showMonthAsDivided];

    if (v19)
    {
      id v15 = CompactDividedMonthMultiDayAnimator;
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  if (objc_opt_isKindOfClass())
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_37;
    }
    id v25 = [(RootNavigationController *)self model];
    unsigned int v26 = [v25 showMonthAsDivided];

    if (v26) {
      id v15 = DividedMonthListAnimator;
    }
    else {
      id v15 = CompactMonthListAnimator;
    }
LABEL_44:
    id v37 = [v15 alloc];
    id v23 = [(RootNavigationController *)self model];
    paletteView = self->_paletteView;
    double v30 = v37;
    id v31 = v23;
    uint64_t v32 = 1;
    goto LABEL_45;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  id v12 = YearMonthAnimator;
LABEL_30:
  id v28 = [v12 alloc];
  id v23 = [(RootNavigationController *)self model];
  paletteView = self->_paletteView;
  double v30 = v28;
  id v31 = v23;
  uint64_t v32 = 0;
LABEL_45:
  int64_t v22 = (YearMonthAnimator *)[v30 initWithModel:v31 paletteView:paletteView reverse:v32];
LABEL_46:

LABEL_47:

  return v22;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  BOOL v3 = [a3 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 0;
}

- (BOOL)_viewControllerTreeIsEligibleForJournalingConsideration:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___EKUIManagedViewController])
  {
    unsigned __int8 v4 = [v3 wantsManagement];
  }
  else
  {
    NSClassFromString(@"MFMailComposeViewController");
    unsigned __int8 v4 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        unsigned __int8 v4 = 0;
      }
    }
  }

  return v4;
}

- (void)recursiveBuildJournal:(id)a3 ofViewControllerSubtree:(id)a4 stopCondition:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t (**)(id, void *))a5;
  if (!v9) {
    goto LABEL_36;
  }
  if ([(RootNavigationController *)self _viewControllerTreeIsEligibleForJournalingConsideration:v9])
  {
    unsigned int v11 = [v9 presentedViewController];
    [(RootNavigationController *)self recursiveBuildJournal:v8 ofViewControllerSubtree:v11 stopCondition:v10];

    id v12 = [v9 presentingViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !v12
      || [(RootNavigationController *)self _nodeContainsViewControllersRequiringTeardown:v9])
    {
      id v13 = v9;
      unsigned int v14 = [v13 topViewController];
      for (char i = v10[2](v10, v14); (i & 1) == 0; char i = v10[2](v10, v14))
      {
        long long v16 = [v13 viewControllers];
        id v17 = [v16 count];

        if (!v17) {
          goto LABEL_26;
        }
        uint64_t v18 = [v13 topViewController];
        if (!v18)
        {
          id v28 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Unexpected nil topViewController", buf, 2u);
          }
          goto LABEL_26;
        }
        unsigned int v19 = (void *)v18;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 addPushedViewController:v19 withPresenter:v12];
        }
        long long v20 = [v13 viewControllers];
        double v30 = v19;
        id v21 = +[NSArray arrayWithObjects:&v30 count:1];
        int64_t v22 = [v20 arrayByExcludingObjectsInArray:v21];

        [v13 setViewControllers:v22 animated:0];
        unsigned int v14 = [v13 topViewController];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_27:
        if (v12)
        {
          if ([v12 conformsToProtocol:&OBJC_PROTOCOL___EnqueueableDismissOperationProtocol])[v12 setAllowsEnqueuedDismissal:0]; {
          if ((objc_opt_respondsToSelector() & 1) == 0 || [v9 canBeDirectlyManaged])
          }
            [v8 addPresentedViewController:v9 withPresenter:v12];
          [v12 dismissViewControllerAnimated:0 completion:0];
          if ([v12 conformsToProtocol:&OBJC_PROTOCOL___EnqueueableDismissOperationProtocol])[v12 setAllowsEnqueuedDismissal:1]; {
        }
          }

        goto LABEL_36;
      }
      id v13 = v9;
      unsigned int v14 = [v13 topViewController];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 canRequirePushOrPresentation])
      {
        [v8 addPresentedViewController:v14 withPresenter:v12];
        id v25 = [v13 viewControllers];
        double v29 = v14;
        unsigned int v26 = +[NSArray arrayWithObjects:&v29 count:1];
        BOOL v27 = [v25 arrayByExcludingObjectsInArray:v26];

        [v13 setViewControllers:v27 animated:0];
      }
    }

LABEL_26:
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(@"_UIDatePickerNumericKeyboardViewController"), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(@"DDParsecCollectionViewController"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v23 = [v9 presentingViewController];
    [v23 dismissViewControllerAnimated:0 completion:0];
  }
  id v24 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "-[RootNavigationController recursiveBuildJournal:ofViewControllerSubtree:stopCondition:]";
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: Dropping UIViewController subtree descended from node: %@", buf, 0x16u);
  }
LABEL_36:
}

- (BOOL)_nodeContainsViewControllersRequiringTeardown:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    unsigned __int8 v4 = [v3 viewControllers];
    id v5 = (char *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (char i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
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
          BOOL v9 = 1;
          goto LABEL_16;
        }
        uint64_t v6 = (char *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        BOOL v9 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_containsViewControllerRequiringNavBarVisibilityRestoration
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(RootNavigationController *)self viewControllers];
  id v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (char i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  long long v8 = [(RootNavigationController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  long long v9 = [(RootNavigationController *)self topViewController];
  [(RootNavigationController *)self navigationController:self willShowViewController:v9 animated:0];

  v19.receiver = self;
  v19.super_class = (Class)RootNavigationController;
  -[RootNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v19, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  if (!CGAffineTransformIsIdentity(&v18)) {
    [(RootNavigationController *)self _performCustomRotationAnimationForMainWindowWithTransitionCoordinator:v7];
  }
  long long v10 = [(RootNavigationController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();

  [(RootNavigationController *)self topMainViewControllerContainer];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B4AB4;
  v14[3] = &unk_1001D4048;
  v14[4] = self;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v16 = width;
  double v17 = height;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B4B84;
  v12[3] = &unk_1001D2DF0;
  v12[4] = self;
  id v13 = v15;
  id v11 = v15;
  [v7 animateAlongsideTransition:v14 completion:v12];
}

- (void)_performCustomRotationAnimationForMainWindowWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(RootNavigationController *)self presentedViewController];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(RootNavigationController *)self ekui_futureTraitCollection];
    if ([v6 horizontalSizeClass] == (id)2)
    {
      id v7 = [(RootNavigationController *)self ekui_futureTraitCollection];
      id v8 = [v7 verticalSizeClass];

      if (v8 == (id)2) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v17 = 0;
    CGAffineTransform v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = sub_1000B3BC0;
    id v21 = sub_1000B3BD0;
    long long v9 = [(RootNavigationController *)self view];
    long long v10 = [v9 window];
    id v22 = [v10 snapshotViewAfterScreenUpdates:0];

    id v11 = [(RootNavigationController *)self topViewController];
    long long v12 = [v11 view];
    id v13 = [v12 superview];

    [v13 addSubview:v18[5]];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B4E60;
    v16[3] = &unk_1001D4680;
    void v16[4] = &v17;
    +[UIView animateWithDuration:v16 animations:0 completion:0.15];
    v14[4] = &v17;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B4E74;
    v15[3] = &unk_1001D46D0;
    v15[4] = self;
    v15[5] = &v17;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000B50D0;
    v14[3] = &unk_1001D46F8;
    [v4 animateAlongsideTransition:v15 completion:v14];

    _Block_object_dispose(&v17, 8);
  }
LABEL_8:
}

+ (void)recursiveAnimationRemove:(id)a3
{
}

- (void)recursiveAnimationRemoveForSmallLayers:(id)a3
{
  if (a3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [a3 sublayers];
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (char i = 0; i != v6; char i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [(RootNavigationController *)self recursiveAnimationRemoveForSmallLayers:v9];
          [v9 bounds];
          double v11 = v10;
          long long v12 = [(RootNavigationController *)self view];
          id v13 = [v12 layer];
          [v13 bounds];
          double v15 = v14;

          if (v11 < v15) {
            [v9 removeAllAnimations];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isTransitioningTraitCollection)
  {
    self->_hideNavBarAfterTraitCollectionTransition = a3;
    self->_shouldSetNavBarVisibilityAfterTraitCollectionTransition = 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)RootNavigationController;
    [(RootNavigationController *)&v4 setNavigationBarHidden:a3 animated:a4];
  }
}

- (id)_tornDownJournalOfShownViewControllers
{
  id v3 = [(RootNavigationController *)self topMainViewControllerContainer];
  objc_super v4 = [v3 currentChildViewController];

  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 shouldJournalMainViewControllerParent] ^ 1;
  }
  else {
    char v5 = 0;
  }
  id v6 = [v4 viewControllerToShowFrom];
  uint64_t v7 = objc_alloc_init(ViewControllerJournal);
  id v8 = [(RootNavigationController *)self window];
  long long v9 = [v8 rootViewController];
  [(RootNavigationController *)self recursiveBuildJournal:v7 ofViewControllerSubtree:v9 stopCondition:&stru_1001D4718];

  [(RootNavigationController *)self recursiveBuildJournal:v7 ofViewControllerSubtree:v4 stopCondition:&stru_1001D4718];
  if ((v5 & 1) == 0) {
    [(RootNavigationController *)self recursiveBuildJournal:v7 ofViewControllerSubtree:v6 stopCondition:&stru_1001D4718];
  }
  double v10 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v11 = v10;
    long long v12 = [v4 ekui_futureTraitCollection];
    int v14 = 136315650;
    double v15 = "-[RootNavigationController _tornDownJournalOfShownViewControllers]";
    __int16 v16 = 2112;
    long long v17 = v4;
    __int16 v18 = 2112;
    long long v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s: Oldtopmain: %@, futureTraits: %@", (uint8_t *)&v14, 0x20u);
  }

  return v7;
}

- (BOOL)_viewControllerRequiresSystemPresentation:(id)a3
{
  id v3 = a3;
  NSClassFromString(@"DDParsecCollectionViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_replayJournal:(id)a3 withRootVC:(id)a4 topMainVC:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (RootNavigationController *)a5;
  double v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = v11;
    id v13 = objc_opt_class();
    id v14 = v13;
    *(_DWORD *)buf = 138412802;
    id v97 = v8;
    __int16 v98 = 2112;
    v99 = v13;
    __int16 v100 = 2112;
    id v101 = (id)objc_opt_class();
    id v15 = v101;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[_replayJournal:%@ withRootVC:%@ topMainVC:%@]", buf, 0x20u);
  }
  __int16 v16 = [v8 nextJournaledViewController];
  long long v17 = v16;
  if (v16)
  {
    __int16 v18 = [v16 viewController];
    v70 = self;
    v76 = v10;
    if (![v18 conformsToProtocol:&OBJC_PROTOCOL___EKEventOrIntegrationEditView])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (-[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___CNContactViewControllerDelegate))[v18 setDelegate:v10]; {
        }
          }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;
            uint64_t v29 = [v19 events];
            [v19 setTransitioningDelegate:0];
            if (-[RootNavigationController conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___EKExpandedReminderStackViewControllerDelegate))[v19 setEKExpandedReminderStackViewControllerDelegate:v10]; {
            objc_opt_class();
            }
            int isKindOfClass = objc_opt_isKindOfClass();
            int v33 = isKindOfClass;
            if (isKindOfClass)
            {
              int v73 = isKindOfClass;
              uint64_t v36 = (void *)kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
              {
                id v37 = v36;
                id v38 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                id v97 = v38;
                id v39 = v38;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Skipping presentation of %@ because we don't need expanded reminders view on list view", buf, 0xCu);
              }
              int v33 = v73;
            }
            goto LABEL_30;
          }
        }
        [(RootNavigationController *)v10 reconfigureViewController:v18];
        uint64_t v29 = 0;
        goto LABEL_41;
      }
      unsigned __int8 v26 = [(RootNavigationController *)v10 conformsToProtocol:&OBJC_PROTOCOL___EKEventViewDelegatePrivateAllInProcess];
      BOOL v27 = v10;
      if ((v26 & 1) == 0)
      {
        if ([(RootNavigationController *)v10 conformsToProtocol:&OBJC_PROTOCOL___EKEventViewDelegate])BOOL v27 = v10; {
        else
        }
          BOOL v27 = self;
      }
      [v18 setDelegate:v27];
      uint64_t v28 = [v18 event];
      id v19 = (id)v28;
      if (!v28)
      {
        int v33 = 0;
        uint64_t v29 = 0;
LABEL_30:

        [(RootNavigationController *)v10 reconfigureViewController:v18];
        if ((v33 & 1) != 0 || !v29)
        {
LABEL_42:
          v77 = v17;
          v71 = (void *)v29;
          int v74 = v33;
          if ([v17 displayType] == (id)1)
          {
            uint64_t v40 = [v17 presentingViewController];
            if (v40)
            {
              id v41 = (void *)v40;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
LABEL_56:
                      v87[0] = _NSConcreteStackBlock;
                      v87[1] = 3221225472;
                      v87[2] = sub_1000B5ED8;
                      v87[3] = &unk_1001D3BA0;
                      id v45 = v41;
                      id v88 = v45;
                      id v46 = v18;
                      id v89 = v46;
                      v90 = self;
                      id v72 = v9;
                      id v91 = v9;
                      id v92 = v8;
                      v93 = v10;
                      int64_t v47 = objc_retainBlock(v87);
                      id v48 = [v45 presentedViewController];
                      id v49 = [v45 viewControllerToShowFrom];
                      BOOL v50 = [(RootNavigationController *)self ekui_futureTraitCollection];
                      id v51 = [v50 horizontalSizeClass];
                      BOOL v52 = v51 == (id)1;

                      if ([v46 conformsToProtocol:&OBJC_PROTOCOL___EKUIManagedViewController])
                      {
                        if (objc_opt_respondsToSelector()) {
                          unsigned __int8 v53 = [v46 canRequirePushOrPresentation];
                        }
                        else {
                          unsigned __int8 v53 = 0;
                        }
                        if (objc_opt_respondsToSelector())
                        {
                          [(RootNavigationController *)v70 ekui_futureTraitCollection];
                          long long v55 = v49;
                          id v57 = v56 = v8;
                          unsigned __int8 v54 = [v46 prefersPushForSizeClass:[v57 horizontalSizeClass]];

                          id v8 = v56;
                          id v49 = v55;
                          BOOL v52 = v51 == (id)1;
                        }
                        else
                        {
                          unsigned __int8 v54 = 0;
                        }
                        if ([v46 canManagePresentationStyle])
                        {
                          if (v51 == (id)1) {
                            uint64_t v58 = -2;
                          }
                          else {
                            uint64_t v58 = 3;
                          }
                          [v46 setModalPresentationStyle:v58];
                        }
                      }
                      else
                      {
                        unsigned __int8 v54 = 0;
                        unsigned __int8 v53 = 0;
                      }
                      if (v48) {
                        BOOL v59 = v48 == v49;
                      }
                      else {
                        BOOL v59 = 1;
                      }
                      int v60 = !v59;
                      if ((v74 | v60))
                      {
                        if ((v74 & 1) == 0)
                        {
                          v61 = (void *)kCalUILogHandle;
                          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
                          {
                            v62 = v61;
                            id v63 = v8;
                            v64 = objc_opt_class();
                            id v75 = v64;
                            v65 = objc_opt_class();
                            id v66 = v65;
                            v67 = objc_opt_class();
                            *(_DWORD *)buf = 138412802;
                            id v97 = v64;
                            __int16 v98 = 2112;
                            v99 = v65;
                            __int16 v100 = 2112;
                            id v101 = v67;
                            id v68 = v67;
                            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Skipping presentation of %@ because %@ already has a presentation up (%@)", buf, 0x20u);

                            id v8 = v63;
                          }
                        }
                        ((void (*)(void *))v47[2])(v47);
                      }
                      else
                      {
                        v78[0] = _NSConcreteStackBlock;
                        v78[1] = 3221225472;
                        v78[2] = sub_1000B616C;
                        v78[3] = &unk_1001D4740;
                        id v79 = v77;
                        BOOL v84 = v52;
                        id v80 = v45;
                        v81 = v70;
                        id v82 = v46;
                        unsigned __int8 v85 = v53;
                        unsigned __int8 v86 = v54;
                        v83 = v47;
                        v69 = objc_retainBlock(v78);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          +[UIView performWithoutAnimation:v69];
                        }
                        else {
                          ((void (*)(void *))v69[2])(v69);
                        }
                      }
                      long long v17 = v77;

                      id v9 = v72;
                      double v10 = v76;
                      goto LABEL_85;
                    }
                  }
                }
              }
            }
          }
          NSClassFromString(@"MFMailComposeViewController");
          char v42 = objc_opt_isKindOfClass();
          if ([v18 prefersToBePresentedFromApplicationRootViewController]
            && ([(RootNavigationController *)self presentedViewController],
                id v43 = objc_claimAutoreleasedReturnValue(),
                v43,
                !v43))
          {
            BOOL v44 = self;
          }
          else if (v42 & 1 | ((objc_opt_respondsToSelector() & 1) == 0))
          {
            BOOL v44 = [v9 viewControllerToShowFrom];
          }
          else
          {
            BOOL v44 = (RootNavigationController *)v9;
          }
          id v41 = v44;
          goto LABEL_56;
        }
        id v34 = [(RootNavigationController *)self model];
        [v34 setSelectedOccurrences:v29];

LABEL_41:
        int v33 = 0;
        goto LABEL_42;
      }
      uint64_t v94 = v28;
      uint64_t v29 = +[NSArray arrayWithObjects:&v94 count:1];
LABEL_29:
      int v33 = 0;
      goto LABEL_30;
    }
    id v19 = v18;
    if (([(RootNavigationController *)v10 requiresSelfAsEventEditorDelegate] & 1) == 0)
    {
      long long v20 = [v19 internalEditViewDelegate];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = [v19 internalEditViewDelegate];
        [v21 view];
        v23 = id v22 = v17;
        id v24 = [v23 window];
        id v25 = [(RootNavigationController *)self window];

        long long v17 = v22;
        BOOL v59 = v24 == v25;
        self = v70;
        double v10 = v76;
        if (v59)
        {
LABEL_25:
          uint64_t v31 = [v19 event];
          uint64_t v32 = (void *)v31;
          if (v31)
          {
            uint64_t v95 = v31;
            uint64_t v29 = +[NSArray arrayWithObjects:&v95 count:1];
          }
          else
          {
            uint64_t v29 = 0;
          }

          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    if ([(RootNavigationController *)v10 conformsToProtocol:&OBJC_PROTOCOL___EKEventOrIntegrationEditViewDelegate])double v30 = v10; {
    else
    }
      double v30 = self;
    [v19 setInternalEditViewDelegate:v30];
    goto LABEL_25;
  }
LABEL_85:
}

- (int64_t)_preferredCompactSingleDayView
{
  if ([(CUIKCalendarModel *)self->_model showDayAsList]) {
    return 4;
  }
  else {
    return 3;
  }
}

- (int64_t)_preferredPostTransitionViewFromTraitCollection:(id)a3 toTraitCollection:(id)a4 currentViewType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 horizontalSizeClass];
  if (v10 != [v9 horizontalSizeClass]
    || (id v11 = [v8 verticalSizeClass], v11 != objc_msgSend(v9, "verticalSizeClass")))
  {
    long long v12 = [(RootNavigationController *)self window];
    id v13 = [v12 windowScene];
    if ([v13 activationState] == (id)2)
    {
      id v14 = [v8 horizontalSizeClass];
      id v15 = [v9 horizontalSizeClass];

      if (v14 != v15)
      {
        if ([v9 horizontalSizeClass] == (id)1)
        {
          uint64_t v16 = 200;
LABEL_16:
          a5 = *(int64_t *)((char *)&self->super.super.super.super.isa + v16);
          goto LABEL_13;
        }
        if ([v9 horizontalSizeClass] == (id)2)
        {
          uint64_t v16 = 192;
          goto LABEL_16;
        }
      }
    }
    else
    {
    }
    if (a5 == 4 && [v8 horizontalSizeClass] == (id)1 && objc_msgSend(v9, "horizontalSizeClass") == (id)2) {
      a5 = 3;
    }
    else {
      a5 = -1;
    }
  }
LABEL_13:

  return a5;
}

- (BOOL)_canSkipViewHierarchyRebuildingWhenTransitioningFromOldCollection:(id)a3 toNewCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 verticalSizeClass];
  if (v7 == [v6 verticalSizeClass])
  {
    id v8 = [v5 horizontalSizeClass];
    BOOL v9 = v8 == [v6 horizontalSizeClass];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RootNavigationController *)self traitCollection];
  unsigned int v9 = [(RootNavigationController *)self _canSkipViewHierarchyRebuildingWhenTransitioningFromOldCollection:v8 toNewCollection:v6];

  if (v9)
  {
    id v10 = [(RootNavigationController *)self window];
    EKUIPushFallbackSizingContextWithViewHierarchy();

    v49.receiver = self;
    v49.super_class = (Class)RootNavigationController;
    [(RootNavigationController *)&v49 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
    id v11 = [(RootNavigationController *)self window];
    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
  else
  {
    self->_isTransitioningTraitCollection = 1;
    long long v12 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [(RootNavigationController *)self traitCollection];
      *(_DWORD *)buf = 138412546;
      id v51 = v6;
      __int16 v52 = 2112;
      unsigned __int8 v53 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[51150180] willTransitionToTraitCollection: %@ from %@", buf, 0x16u);
    }
    id v11 = [(RootNavigationController *)self topMainViewControllerContainer];
    uint64_t v15 = [v11 preferredPreSizeClassTransitionSelectedDate];
    if (v15) {
      [(CUIKCalendarModel *)self->_model setSelectedDate:v15];
    }
    id v37 = (void *)v15;
    [(CUIKCalendarModel *)self->_model setSelectedDateChangesDelayedUntilAfterTransition:1];
    [(RootNavigationController *)self _updateInteractivePopAllowed];
    if ([(RootNavigationController *)self isNavigationBarHidden]
      && [v6 horizontalSizeClass] == (id)2
      && [(RootNavigationController *)self _containsViewControllerRequiringNavBarVisibilityRestoration])
    {
      [(RootNavigationController *)self setNavigationBarHidden:0];
    }
    uint64_t v16 = [(RootNavigationController *)self traitCollection];
    int64_t v17 = [(RootNavigationController *)self currentViewType];
    __int16 v18 = [(RootNavigationController *)self firstResponder];
    int64_t v19 = [(RootNavigationController *)self currentViewType];
    long long v20 = [(RootNavigationController *)self topMainViewControllerContainer];
    unsigned int v21 = [v20 shouldAdaptEventViewControllers];

    if (v21)
    {
      id v22 = [(RootNavigationController *)self _tornDownJournalOfShownViewControllers];
    }
    else
    {
      id v22 = 0;
    }
    [(RootNavigationController *)self setEkui_futureTraitCollection:v6];
    id v23 = [(RootNavigationController *)self window];
    EKUIPushFallbackSizingContextWithViewHierarchy();

    v48.receiver = self;
    v48.super_class = (Class)RootNavigationController;
    [(RootNavigationController *)&v48 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
    id v24 = [(RootNavigationController *)self window];
    EKUIPopFallbackSizingContextWithViewHierarchy();

    if ([v16 horizontalSizeClass] == (id)2
      && [v6 horizontalSizeClass] == (id)1
      && v19 == 2)
    {
      id v25 = [(RootNavigationController *)self model];
      self->_traitCollectionChangeShouldResultInCompactDayView = [v25 showDayAsList] ^ 1;
    }
    else
    {
      self->_traitCollectionChangeShouldResultInCompactDayView = 0;
    }
    [(PaletteView *)self->_paletteView updateForChangeToTraitCollection:v6];
    int64_t v26 = [(RootNavigationController *)self _preferredPostTransitionViewFromTraitCollection:v16 toTraitCollection:v6 currentViewType:v19];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000B6C80;
    v42[3] = &unk_1001D4768;
    v42[4] = self;
    id v27 = v16;
    id v43 = v27;
    id v44 = v6;
    int64_t v46 = v17;
    int64_t v47 = v26;
    id v28 = v22;
    id v45 = v28;
    uint64_t v29 = objc_retainBlock(v42);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000B6D88;
    v39[3] = &unk_1001D2DF0;
    id v30 = v18;
    id v40 = v30;
    id v41 = self;
    uint64_t v31 = objc_retainBlock(v39);
    if (v7 && [v7 isAnimated])
    {
      if (+[ApplicationTester testingSessionStarted])
      {
        uint64_t v32 = +[UIApplication sharedApplication];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1000B6E38;
        v38[3] = &unk_1001D2740;
        v38[4] = self;
        [v32 installCACommitCompletionBlock:v38];
      }
      int v33 = [(RootNavigationController *)self window];
      EKUIPushFallbackSizingContextWithViewHierarchy();

      ((void (*)(void *, void))v29[2])(v29, 0);
      id v34 = [(RootNavigationController *)self window];
      EKUIPopFallbackSizingContextWithViewHierarchy();

      [v7 animateAlongsideTransition:0 completion:v31];
    }
    else
    {
      double v35 = [(RootNavigationController *)self window];
      EKUIPushFallbackSizingContextWithViewHierarchy();

      ((void (*)(void *, void))v29[2])(v29, 0);
      uint64_t v36 = [(RootNavigationController *)self window];
      EKUIPopFallbackSizingContextWithViewHierarchy();

      ((void (*)(void *, void))v31[2])(v31, 0);
    }
    [(CUIKCalendarModel *)self->_model setSelectedDateChangesDelayedUntilAfterTransition:0];
  }
}

- (void)_setNavigationStackOfMainViewControllersForTraitsTransitionFromTraitCollection:(id)a3 toNewTraitCollection:(id)a4 withPreTransitionViewType:(int64_t)a5 withPreferredPostTransitionViewType:(int64_t)a6
{
  id v46 = a3;
  id v10 = a4;
  id v11 = [(RootNavigationController *)self _ensureStackBaseCalendarViewControllerContainerIsPresent];
  if ([v46 horizontalSizeClass] != (id)1 || objc_msgSend(v46, "verticalSizeClass") != (id)1)
  {
    if ([v10 horizontalSizeClass] == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1)
    {
      if (!self->_traitCollectionChangeShouldResultInCompactDayView)
      {
        long long v12 = [(RootNavigationController *)self viewControllers];
        id v13 = +[NSMutableArray arrayWithArray:v12];
        id v14 = [(RootNavigationController *)self topMainViewControllerContainer];
        uint64_t v15 = (char *)[v12 indexOfObject:v14];
        uint64_t v16 = [WeekViewContainerViewController alloc];
        model = self->_model;
        __int16 v18 = [(RootNavigationController *)self window];
        int64_t v19 = [(MainViewControllerContainer *)v16 initWithModel:model window:v18];

        long long v20 = [(RootNavigationController *)self ekui_futureTraitCollection];
        [(WeekViewContainerViewController *)v19 setEkui_futureTraitCollection:v20];

        [v13 insertObject:v19 atIndex:v15 + 1];
        [(RootNavigationController *)self setViewControllers:v13 animated:0];

LABEL_30:
        int v38 = 0;
        goto LABEL_37;
      }
    }
    else if ([v46 horizontalSizeClass] == (id)1 && objc_msgSend(v10, "horizontalSizeClass") == (id)2)
    {
      if (!self->_traitCollectionChangeShouldResultInCompactDayView && (unint64_t)(a5 - 2) <= 2)
      {
        unsigned int v21 = [(RootNavigationController *)self viewControllers];
        if ((unint64_t)[v21 count] >= 2)
        {
          id v22 = [(RootNavigationController *)self viewControllers];
          id v23 = [v22 objectAtIndexedSubscript:1];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = [v23 nextLevelWeekViewController];
            if (v24)
            {
              id v25 = +[NSMutableArray arrayWithArray:v21];
              int64_t v26 = v25;
              if (a5 == 2) {
                [v25 removeLastObject];
              }
              [v26 insertObject:v24 atIndex:2];
              if ([v26 count] == (id)3) {
                [v24 setupForViewAppearance];
              }
              id v27 = [v26 lastObject];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0
                && ([v26 lastObject], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                id v30 = v29;
                uint64_t v31 = [v29 currentChildViewController];
                [v31 viewWillAppear:0];

                [(RootNavigationController *)self setViewControllers:v26];
                uint64_t v32 = [v30 currentChildViewController];
                [v32 viewDidAppear:0];
              }
              else
              {
                [(RootNavigationController *)self setViewControllers:v26];
              }
            }
          }
        }
      }
    }
    else if ([v46 horizontalSizeClass] == (id)2 && objc_msgSend(v10, "horizontalSizeClass") == (id)1)
    {
      int v33 = [(RootNavigationController *)self model];
      unsigned int v34 = [v33 showDayAsList];

      if (v34)
      {
        [(RootNavigationController *)self updateDayViewModeContainer];
      }
      else if (self->_traitCollectionChangeShouldResultInCompactDayView)
      {
        double v35 = [(RootNavigationController *)self model];
        if ((uint64_t)[v35 numDaysToShow] >= 2) {
          uint64_t v36 = 2;
        }
        else {
          uint64_t v36 = 3;
        }

        long long v12 = [(CUIKCalendarModel *)self->_model selectedDate];
        id v37 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:v36 andDate:v12];
        goto LABEL_30;
      }
    }
  }
  int v38 = 1;
LABEL_37:
  id v39 = [v10 horizontalSizeClass];
  BOOL v41 = a6 != 4 || v39 != (id)2;
  if (a6 != -1 && v38 && v41)
  {
    char v42 = [(CUIKCalendarModel *)self->_model selectedDate];
    id v43 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:a6 andDate:v42];
  }
  id v44 = [(RootNavigationController *)self topViewController];
  [(RootNavigationController *)self navigationController:self willShowViewController:v44 animated:0];
  id v45 = [(RootNavigationController *)self view];
  [v45 setNeedsLayout];
}

- (void)restoreEventDetailViewControllers:(id)a3
{
  id v4 = a3;
  id v25 = [(RootNavigationController *)self topMainViewControllerContainer];
  id v5 = [v25 currentChildViewController];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = &objc_retain_x2_ptr;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (char i = 0; i != v7; char i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(RootNavigationController *)v5 conformsToProtocol:&OBJC_PROTOCOL___EKEventEditViewDelegate])long long v12 = v5; {
          else
          }
            long long v12 = self;
          [v11 setEditViewDelegate:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [(RootNavigationController *)v5 reconfigureViewController:v11];
            goto LABEL_20;
          }
          unsigned __int8 v13 = [(RootNavigationController *)v5 conformsToProtocol:&OBJC_PROTOCOL___EKEventViewDelegatePrivateAllInProcess];
          id v14 = v5;
          if ((v13 & 1) == 0)
          {
            if ([(RootNavigationController *)v5 conformsToProtocol:&OBJC_PROTOCOL___EKEventViewDelegate])id v14 = v5; {
            else
            }
              id v14 = self;
          }
          [v11 setDelegate:v14];
        }
        uint64_t v15 = [v11 event];
        [(RootNavigationController *)v5 reconfigureViewController:v11];
        if (v15)
        {
          [(RootNavigationController *)self model];
          id v16 = v7;
          uint64_t v17 = v9;
          v19 = __int16 v18 = v8;
          long long v20 = [v15 startCalendarDate];
          [v19 setSelectedDate:v20];

          unsigned int v21 = [(RootNavigationController *)self model];
          [v21 setSelectedOccurrence:v15];

          id v22 = [v15 startCalendarDate];
          [(RootNavigationController *)v5 selectDate:v22 animated:0];

          id v8 = v18;
          uint64_t v9 = v17;
          id v7 = v16;
        }
LABEL_20:
        if (objc_opt_respondsToSelector())
        {
          id v23 = v5;
        }
        else
        {
          id v23 = [(RootNavigationController *)v5 viewControllerToShowFrom];
        }
        id v24 = v23;
        [(RootNavigationController *)v23 showViewController:v11 sender:self animated:0 completion:0];
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }
}

- (BOOL)shouldSaveSelectedEvent
{
  id v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  id v3 = [v2 currentChildViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 selectedEventWasAutoSelected] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)didEnterBackground
{
  int64_t v3 = [(RootNavigationController *)self currentViewType];
  unsigned int v4 = [(RootNavigationController *)self traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)2)
  {
    self->_compactBackgroundedViewType = -1;
  }
  else
  {
    id v6 = [(RootNavigationController *)self traitCollection];
    id v7 = [v6 horizontalSizeClass];

    if (v7 == (id)1)
    {
      self->_compactBackgroundedViewType = v3;
      int64_t v3 = -1;
    }
    else
    {
      int64_t v3 = -1;
      self->_compactBackgroundedViewType = -1;
    }
  }
  self->_regularBackgroundedViewType = v3;
}

- (id)bestDateForNewEvent
{
  int64_t v3 = [(RootNavigationController *)self topViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(RootNavigationController *)self topViewController];
    id v6 = [v5 bestDateForNewEvent];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
}

- (void)showDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B788C;
  v8[3] = &unk_1001D4790;
  uint64_t v9 = self;
  id v10 = a3;
  BOOL v11 = a4;
  BOOL v12 = v5;
  id v7 = v10;
  [(RootNavigationController *)v9 _dismissPresentedViewControllerAnimated:v5 completion:v8];
}

- (BOOL)isDateVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RootNavigationController *)self topMainViewControllerContainer];
  if (!v5)
  {
    id v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "No top main view controller to query if a date is visible.", v9, 2u);
    }
  }
  unsigned __int8 v7 = [v5 isDateVisible:v4];

  return v7;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  id v6 = [(RootNavigationController *)self topMainViewControllerContainer];
  if (!v6)
  {
    unsigned __int8 v7 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No top main view controller to query if a date is visible.", v8, 2u);
    }
  }
  [v6 currentlyVisibleDateRangeFromStartDate:a3 toEndDate:a4];
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B7B08;
  v11[3] = &unk_1001D47D8;
  BOOL v12 = self;
  id v13 = a3;
  BOOL v16 = a4;
  id v14 = a6;
  unint64_t v15 = a5;
  id v9 = v14;
  id v10 = v13;
  [(RootNavigationController *)v12 _dismissPresentedViewControllerAnimated:0 completion:v11];
}

- (void)showContactWithIdentifier:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B7CD4;
  void v5[3] = &unk_1001D28A8;
  id v6 = a3;
  unsigned __int8 v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)weekViewController:(id)a3 didEditEvent:(id)a4 creationMethod:(unint64_t)a5
{
  id v14 = a4;
  unsigned __int8 v7 = +[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:v14 model:self->_model creationMethod:a5 eventEditViewDelegate:self];
  [(RootNavigationController *)self presentModalViewController:v7 withTransition:8];
  uint64_t v8 = [v14 title];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v14 title];
    if ([v10 length])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_6;
      }
      id v9 = [v7 viewControllers];
      id v10 = [v9 lastObject];
      BOOL v12 = [v10 navigationItem];
      id v13 = [v12 rightBarButtonItem];
      [v13 setEnabled:1];
    }
  }
LABEL_6:
}

- (void)weekViewController:(id)a3 didSelectEvent:(id)a4
{
}

- (void)_invalidateNavBarDateStringCache
{
  self->_navBarDateStringCache = 0;
  _objc_release_x1();
}

- (void)setNavBarStringFromDate:(id)a3 includeMonth:(BOOL)a4 includeYear:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!self->_navBarDateStringCache)
  {
    id v9 = (NSMutableDictionary *)objc_opt_new();
    navBarDateStringCache = self->_navBarDateStringCache;
    self->_navBarDateStringCache = v9;
  }
  BOOL v11 = objc_opt_new();
  if (v6) {
    uint64_t v12 = (uint64_t)[v8 month];
  }
  else {
    uint64_t v12 = -1;
  }
  [v11 setMonth:v12];
  if (v5) {
    uint64_t v13 = (uint64_t)[v8 year];
  }
  else {
    uint64_t v13 = -1;
  }
  [v11 setYear:v13];
  id v14 = [(RootNavigationController *)self window];
  unint64_t v15 = [(RootNavigationController *)self traitCollection];
  BOOL v16 = paletteTitleFont(v14, v15);
  [v11 setFont:v16];

  uint64_t v17 = [(NSMutableDictionary *)self->_navBarDateStringCache objectForKeyedSubscript:v11];
  if (!v17)
  {
    uint64_t v17 = [(RootNavigationController *)self _navBarDateStringFromDate:v8 includingMonth:v6 includingYear:v5 format:0];
    if (!v17)
    {
      [(RootNavigationController *)self _dateLabelMaxWidth];
      double v19 = v18;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v20 = [&off_1001DCAB8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v17 = 0;
        uint64_t v22 = *(void *)v27;
        while (2)
        {
          id v23 = 0;
          id v24 = v17;
          do
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(&off_1001DCAB8);
            }
            uint64_t v17 = -[RootNavigationController _navBarDateStringFromDate:includingMonth:includingYear:format:](self, "_navBarDateStringFromDate:includingMonth:includingYear:format:", v8, v6, v5, [*(id *)(*((void *)&v26 + 1) + 8 * (void)v23) integerValue]);

            [v17 size];
            if (v25 < v19)
            {
              [(NSMutableDictionary *)self->_navBarDateStringCache setObject:v17 forKeyedSubscript:v11];
              goto LABEL_22;
            }
            id v23 = (char *)v23 + 1;
            id v24 = v17;
          }
          while (v21 != v23);
          id v21 = [&off_1001DCAB8 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
  }
LABEL_22:
  [(RootNavigationController *)self _setCurrentDateLabelString:v17];
}

- (id)_navBarDateStringFromDate:(id)a3 includingMonth:(BOOL)a4 includingYear:(BOOL)a5 format:(int64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (v10)
  {
    if (v8 && !a5)
    {
      BOOL v11 = [(RootNavigationController *)self window];
      uint64_t v12 = [(RootNavigationController *)self traitCollection];
      uint64_t v13 = paletteTitleFont(v11, v12);

      if (a6 == 2)
      {
        [v10 month];
        uint64_t v14 = CUIKStringVeryShortAbbreviationForMonth();
      }
      else if (a6 == 1)
      {
        [v10 month];
        uint64_t v14 = CUIKStringAbbreviationForMonth();
      }
      else
      {
        if (a6)
        {
          double v18 = 0;
          goto LABEL_22;
        }
        [v10 month];
        uint64_t v14 = CUIKStringForMonthNumber();
      }
      double v18 = (void *)v14;
LABEL_22:
      int v33 = +[NSLocale currentLocale];
      uint64_t v22 = [v18 capitalizedStringWithLocale:v33];

      id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v22];
      id v29 = [v16 length];
      long long v30 = v16;
      NSAttributedStringKey v31 = NSFontAttributeName;
      uint64_t v32 = v13;
LABEL_23:
      [v30 addAttribute:v31 value:v32 range:0];
LABEL_34:

      goto LABEL_35;
    }
    if (!v8)
    {
      BOOL v24 = (unint64_t)(a6 - 1) < 2;
      double v25 = [(RootNavigationController *)self traitCollection];
      double v18 = [(RootNavigationController *)self _navBarStringYearFontForTraitCollection:v25 useSmallerSize:v24 bold:1];

      long long v26 = [v10 date];
      uint64_t v13 = CUIKStringForYear();

      id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v13];
      [v16 addAttribute:NSFontAttributeName value:v18 range:0, [v16 length]];
      long long v27 = [v10 date];
      int IsThisYear = CUIKNSDateIsThisYear();

      if (!IsThisYear)
      {
LABEL_35:

        id v41 = objc_alloc_init((Class)NSMutableParagraphStyle);
        [v41 setLineBreakMode:2];
        [v16 addAttribute:NSParagraphStyleAttributeName value:v41 range:0, [v16 length]];

        goto LABEL_36;
      }
      uint64_t v22 = CalendarAppTintColor();
      id v29 = [v16 length];
      long long v30 = v16;
      NSAttributedStringKey v31 = NSForegroundColorAttributeName;
      uint64_t v32 = v22;
      goto LABEL_23;
    }
    uint64_t v17 = [(RootNavigationController *)self traitCollection];
    double v18 = [(RootNavigationController *)self _navBarStringYearFontForTraitCollection:v17 useSmallerSize:1 bold:0];

    double v19 = [(RootNavigationController *)self window];
    id v20 = [(RootNavigationController *)self traitCollection];
    uint64_t v13 = paletteTitleFont(v19, v20);

    if (a6 == 2)
    {
      unsigned int v34 = [v10 date];
      uint64_t v22 = CUIKVeryShortStringForMonthYear();

      [v10 month];
      uint64_t v23 = CUIKStringVeryShortAbbreviationForMonth();
    }
    else if (a6 == 1)
    {
      double v35 = [v10 date];
      uint64_t v22 = CUIKShortStringForMonthYear();

      [v10 month];
      uint64_t v23 = CUIKStringAbbreviationForMonth();
    }
    else
    {
      if (a6)
      {
        uint64_t v36 = 0;
        uint64_t v22 = 0;
        goto LABEL_28;
      }
      id v21 = [v10 date];
      uint64_t v22 = CUIKStringForMonthYear();

      [v10 month];
      uint64_t v23 = CUIKStringForMonthNumber();
    }
    uint64_t v36 = (void *)v23;
LABEL_28:
    id v37 = [v36 lowercaseString];
    int v38 = [v22 lowercaseString];
    id v39 = [v38 rangeOfString:v37];
    uint64_t v43 = v40;
    if (v22) {
      id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v22];
    }
    else {
      id v16 = 0;
    }
    [v16 addAttribute:NSFontAttributeName value:v18 range:0, [v16 length]];
    if (v39 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [v16 addAttribute:NSFontAttributeName value:v13 range:v39];
    }

    goto LABEL_34;
  }
  unint64_t v15 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v45 = "-[RootNavigationController _navBarDateStringFromDate:includingMonth:includingYear:format:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s called with nil date", buf, 0xCu);
  }
  id v16 = 0;
LABEL_36:

  return v16;
}

- (void)_updateDateLabelFrame
{
  [(UILabel *)self->_currentDateLabel frame];
  double v4 = v3;
  double v6 = v5;
  [(RootNavigationController *)self _dateLabelMaxWidth];
  currentDateLabel = self->_currentDateLabel;

  -[UILabel setFrame:](currentDateLabel, "setFrame:", v4, v6, v7, 38.0);
}

- (void)_updateLeftFixedSpaceBarButtonItemWidthWithViewController:(id)a3 targetWindowSize:(CGSize)a4
{
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(RootNavigationController *)self _createLeftFixedSpaceBarItemIfNeeded];
    [v9 leftBarButtonBlankFixedSpaceWidth];
    double v5 = [(RootNavigationController *)self view];
    EKUILayoutMarginsForFullscreenLayoutRectWithSize();
    double v7 = v6;
    CalRoundToScreenScale();
    [(UIBarButtonItem *)self->_leftFixedSpaceBarItem setWidth:v7 + v8];
  }
  else
  {
    [(UIBarButtonItem *)self->_leftFixedSpaceBarItem setWidth:0.0];
  }
}

- (double)_dateLabelMaxWidth
{
  double v3 = [(RootNavigationController *)self view];
  [v3 bounds];
  double MidX = CGRectGetMidX(v17);
  [(RootNavigationController *)self _viewSwitcherSegmentWidth];
  double v6 = MidX + v5 * -0.5 * (double)[(RootNavigationController *)self _viewSwitcherNumSegments];

  double v7 = [(RootNavigationController *)self topMainViewControllerContainer];
  double v8 = [(RootNavigationController *)self view];
  [v8 bounds];
  -[RootNavigationController _updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:](self, "_updateLeftFixedSpaceBarButtonItemWidthWithViewController:targetWindowSize:", v7, v9, v10);

  [(UIBarButtonItem *)self->_leftFixedSpaceBarItem width];
  double v12 = v6 + v11 * -1.5;
  uint64_t v13 = [(RootNavigationController *)self view];
  [v13 layoutMargins];
  double v15 = v12 + v14 * -2.0;

  return v15;
}

- (id)_navBarStringYearFontForTraitCollection:(id)a3 useSmallerSize:(BOOL)a4 bold:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  double v8 = v7;
  if (v5)
  {
    double v9 = [(RootNavigationController *)self window];
    double v10 = paletteTitleFont(v9, v8);
  }
  else
  {
    id v11 = [v7 userInterfaceIdiom];

    double v12 = &UIFontTextStyleTitle2;
    if (v11) {
      double v12 = &UIFontTextStyleLargeTitle;
    }
    double v10 = +[UIFont _preferredFontForTextStyle:*v12 maximumContentSizeCategory:UIContentSizeCategoryMedium];
  }

  return v10;
}

- (unint64_t)_viewSwitcherIndexRepresentingViewType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 5) {
    return 0;
  }
  else {
    return qword_1001C1520[a3 + 1];
  }
}

- (int64_t)_viewTypeRepresentedByViewSwitcherIndex:(unint64_t)a3
{
  if (a3 > 4) {
    return -1;
  }
  else {
    return qword_1001C1550[a3];
  }
}

- (void)_viewSwitcherSelectedValueChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[RootNavigationController _viewTypeRepresentedByViewSwitcherIndex:](self, "_viewTypeRepresentedByViewSwitcherIndex:", [v4 selectedSegmentIndex]);
  if (v5 != (void *)[(RootNavigationController *)self currentViewType])
  {
    double v6 = [(RootNavigationController *)self topMainViewControllerContainer];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B8C64;
    v8[3] = &unk_1001D2A40;
    void v8[4] = self;
    void v8[5] = v5;
    unsigned int v7 = [v6 performModalDialogsIfNeededWithContinue:v8];

    if (v7) {
      [v4 setSelectedSegmentIndex:[self _viewSwitcherIndexRepresentingViewType:[self currentViewType]]];
    }
  }
}

- (void)_configureViewSwitcherShowingViewController:(id)a3
{
  id v4 = [(RootNavigationController *)self viewSwitcher];
  [v4 setSelectedSegmentIndex:[self _viewSwitcherIndexRepresentingViewType:[self currentViewType]]];
}

- (BOOL)_shouldShowListViewInModeSwitcher
{
  double v3 = +[CUIKPreferences sharedPreferences];
  if ([v3 showExperimentalUI])
  {
    id v4 = [(RootNavigationController *)self window];
    if (EKUICurrentHeightSizeClassIsRegular())
    {
      BOOL v5 = [(RootNavigationController *)self window];
      char IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
    }
    else
    {
      char IsRegularInViewHierarchy = 0;
    }
  }
  else
  {
    char IsRegularInViewHierarchy = 0;
  }

  return IsRegularInViewHierarchy;
}

- (id)_viewSwitcherLabelStrings
{
  double v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Day" value:&stru_1001D6918 table:0];
  v12[0] = v4;
  BOOL v5 = [v3 localizedStringForKey:@"Week" value:&stru_1001D6918 table:0];
  v12[1] = v5;
  double v6 = [v3 localizedStringForKey:@"Month" value:&stru_1001D6918 table:0];
  v12[2] = v6;
  unsigned int v7 = [v3 localizedStringForKey:@"Year" value:&stru_1001D6918 table:0];
  v12[3] = v7;
  double v8 = +[NSArray arrayWithObjects:v12 count:4];

  id v9 = [objc_alloc((Class)NSMutableArray) initWithArray:v8];
  if ([(RootNavigationController *)self _shouldShowListViewInModeSwitcher])
  {
    double v10 = [v3 localizedStringForKey:@"List" value:&stru_1001D6918 table:0];
    [v9 addObject:v10];
  }

  return v9;
}

- (UISegmentedControl)viewSwitcher
{
  viewSwitcherSegmentedControl = self->_viewSwitcherSegmentedControl;
  if (viewSwitcherSegmentedControl)
  {
    double v3 = viewSwitcherSegmentedControl;
  }
  else
  {
    double v3 = [(RootNavigationController *)self _viewSwitcherSegmentedControl];
  }

  return v3;
}

- (id)_viewSwitcherSegmentedControl
{
  viewSwitcherSegmentedControl = self->_viewSwitcherSegmentedControl;
  if (!viewSwitcherSegmentedControl)
  {
    id v4 = [(RootNavigationController *)self _viewSwitcherLabelStrings];
    BOOL v5 = (UISegmentedControl *)[objc_alloc((Class)UISegmentedControl) initWithItems:v4];
    double v6 = self->_viewSwitcherSegmentedControl;
    self->_viewSwitcherSegmentedControl = v5;

    unsigned int v7 = self->_viewSwitcherSegmentedControl;
    double v8 = CalendarAppTintColor();
    [(UISegmentedControl *)v7 setTintColor:v8];

    [(UISegmentedControl *)self->_viewSwitcherSegmentedControl setApportionsSegmentWidthsByContent:1];
    [(UISegmentedControl *)self->_viewSwitcherSegmentedControl setSpringLoaded:1];
    [(UISegmentedControl *)self->_viewSwitcherSegmentedControl setAccessibilityIdentifier:@"views-switcher"];
    [(UISegmentedControl *)self->_viewSwitcherSegmentedControl addTarget:self action:"_viewSwitcherSelectedValueChanged:" forControlEvents:4096];

    viewSwitcherSegmentedControl = self->_viewSwitcherSegmentedControl;
  }
  [(RootNavigationController *)self _setSegmentWidthsForViewSwitcher:viewSwitcherSegmentedControl];
  [(RootNavigationController *)self _updateViewSwitcherFont];
  [(UISegmentedControl *)self->_viewSwitcherSegmentedControl setSelectedSegmentIndex:[(RootNavigationController *)self _viewSwitcherIndexRepresentingViewType:[(RootNavigationController *)self currentViewType]]];
  id v9 = self->_viewSwitcherSegmentedControl;

  return v9;
}

- (id)_switcherFontOfSize:(double)a3 isSemibold:(BOOL)a4
{
  if (a4) {
    +[UIFont systemFontOfSize:a3 weight:UIFontWeightSemibold];
  }
  else {
  id v4 = +[UIFont systemFontOfSize:a3];
  }

  return v4;
}

- (double)_viewSwitcherSegmentWidth
{
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x4052C00000000000;
  double v3 = [(RootNavigationController *)self _viewSwitcherLabelStrings];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B9264;
  v6[3] = &unk_1001D4800;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)_viewSwitcherNumSegments
{
  if ([(RootNavigationController *)self _shouldShowListViewInModeSwitcher]) {
    return 5;
  }
  else {
    return 4;
  }
}

- (void)_setSegmentWidthsForViewSwitcher:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    unint64_t v5 = [(RootNavigationController *)self _viewSwitcherNumSegments];
    [(RootNavigationController *)self _viewSwitcherSegmentWidth];
    id v4 = v9;
    if (v5)
    {
      double v7 = v6;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [v9 setWidth:i forSegmentAtIndex:v7];
        id v4 = v9;
      }
    }
  }
}

- (void)_updateViewSwitcherFont
{
  double v3 = [(RootNavigationController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  double v5 = 17.0;
  if (UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraLarge) != NSOrderedDescending)
  {
    double v5 = 15.0;
    if (UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraLarge) != NSOrderedDescending)
    {
      if (UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryLarge) == NSOrderedDescending) {
        double v5 = 14.0;
      }
      else {
        double v5 = 13.0;
      }
    }
  }
  [(RootNavigationController *)self _viewSwitcherSegmentWidth];
  double v7 = v6;
  do
  {
    double v8 = v5;
    if (v5 <= 13.0) {
      break;
    }
    uint64_t v18 = 0;
    double v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v9 = [(RootNavigationController *)self _viewSwitcherLabelStrings];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_1000B9700;
    v17[3] = &unk_1001D4828;
    *(double *)&void v17[6] = v5;
    v17[4] = self;
    void v17[5] = &v18;
    [v9 enumerateObjectsUsingBlock:v17];

    double v10 = v19[3];
    double v5 = v5 + -1.0;
    _Block_object_dispose(&v18, 8);
  }
  while (v10 > v7);
  id v11 = [(RootNavigationController *)self viewSwitcher];
  NSAttributedStringKey v24 = NSFontAttributeName;
  double v12 = [(RootNavigationController *)self _switcherFontOfSize:0 isSemibold:v8];
  double v25 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v11 setTitleTextAttributes:v13 forState:0];

  double v14 = [(RootNavigationController *)self viewSwitcher];
  NSAttributedStringKey v22 = NSFontAttributeName;
  double v15 = [(RootNavigationController *)self _switcherFontOfSize:1 isSemibold:v8];
  uint64_t v23 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [v14 setTitleTextAttributes:v16 forState:4];
}

- (void)_notificationCountChanged:(id)a3
{
  if (qword_100216770 != -1) {
    dispatch_once(&qword_100216770, &stru_1001D4848);
  }
  id v4 = [(RootNavigationController *)self model];
  double v5 = qword_100216768;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B9954;
  v7[3] = &unk_1001D28A8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleURL:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v69 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Preparing to handle URL: [%@]", buf, 0xCu);
  }
  id v9 = [v6 scheme];
  double v10 = [(RootNavigationController *)self model];
  id v11 = [v6 searchResultIdentifier];

  if (v11)
  {
    double v12 = [v6 searchResultIdentifier];
    uint64_t v13 = [v12 stringValue];
  }
  else
  {
    uint64_t v13 = 0;
  }
  if ([v9 isEqualToString:_EKEventURLScheme])
  {
    double v14 = [v10 eventStore];
    double v15 = [v14 _eventWithURI:v6 checkValid:1];

    if (v15)
    {
      id v16 = [v15 calendar];
      CGRect v17 = [v16 source];
      [v10 updateSourceForSelectedIdentity:v17 selectedCalendars:0];

      [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:0];
      if ([v15 allowsParticipationStatusModifications]
        && ([v15 participationStatus] == (id)1 || !objc_msgSend(v15, "participationStatus")))
      {
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_1000BA278;
        v66[3] = &unk_1001D28A8;
        v66[4] = self;
        id v67 = v15;
        +[UIView performWithoutAnimation:v66];
      }
      else
      {
        [(RootNavigationController *)self showEvent:v15 animated:0 showMode:1 context:v7];
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if ([v9 isEqualToString:@"calinvite"])
  {
    uint64_t v18 = [v6 resourceSpecifier];
    double v15 = +[NSURL URLWithString:v18];

    double v19 = [v10 eventStore];
    uint64_t v20 = [v19 _eventWithURI:v15 checkValid:1];

    if (v20)
    {
      model = self->_model;
      [v20 calendar];
      NSAttributedStringKey v22 = v61 = v11;
      [v22 source];
      uint64_t v58 = v15;
      id v23 = v6;
      NSAttributedStringKey v24 = self;
      double v25 = v9;
      long long v26 = v13;
      long long v27 = v10;
      v29 = id v28 = v7;
      [(CUIKCalendarModel *)model updateSourceForSelectedIdentity:v29 selectedCalendars:0];

      id v7 = v28;
      double v10 = v27;
      uint64_t v13 = v26;
      id v9 = v25;
      self = v24;
      id v6 = v23;
      double v15 = v58;

      id v11 = v61;
      [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:0];
      [(RootNavigationController *)self showEvent:v20 animated:0 showMode:1 context:v7];
    }

    goto LABEL_24;
  }
  if ([v9 isEqualToString:@"calinvitelist"]
    && [v10 allEventNotificationsCount])
  {
    [v10 setSelectedOccurrence:0];
    id v30 = [(RootNavigationController *)self showInboxAnimated:0];
LABEL_25:
    NSAttributedStringKey v31 = 0;
    uint64_t v32 = 0;
    goto LABEL_26;
  }
  if (([v9 isEqualToString:@"calsubcal"] & 1) != 0
    || [v9 isEqualToString:@"webcal"])
  {
    double v15 = +[MainWindowRootViewController sanitizeCalSubCal:v6];
    if (v15) {
      [(RootNavigationController *)self _showAddSubscribedCalendarWithURL:v15];
    }
    goto LABEL_24;
  }
  if (![v9 isEqualToString:@"calshow"]) {
    goto LABEL_25;
  }
  int v33 = [v6 host];
  if (![v33 isEqual:@"familyCalendar"])
  {
    v62 = v11;
    double v35 = [v6 resourceSpecifier];
    if ([(id)objc_opt_class() _diagnosticsAvailable]
      && [v35 rangeOfString:@"?calendardiagnostics=reporttraveladvisoryproblem"] == (id)0x7FFFFFFFFFFFFFFFLL
      && [v35 rangeOfString:@"?calendardiagnostics=reportproblem"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(RootNavigationController *)self _showDebugReportProblemViewController];
      NSAttributedStringKey v31 = 0;
      unsigned int v34 = v35;
      uint64_t v32 = 0;
      goto LABEL_58;
    }
    id v56 = v33;
    uint64_t v36 = (char *)[v35 rangeOfString:@"?eventid="];
    id v57 = v35;
    if (v36 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v38 = [v35 rangeOfString:@"?contactid="];
      if (v38 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v32 = 0;
        goto LABEL_49;
      }
      id v43 = v38;
      uint64_t v44 = v39;
      uint64_t v59 = [v35 substringToIndex:v38];
      unint64_t v45 = (unint64_t)v43 + v44;
      if ((unint64_t)[v35 length] <= v45)
      {
        uint64_t v32 = 0;
      }
      else
      {
        uint64_t v32 = [v35 substringFromIndex:v45];
      }
    }
    else
    {
      uint64_t v40 = v36;
      uint64_t v41 = v37;
      uint64_t v59 = [v35 substringToIndex:v36];
      if (&v40[v41] >= [v35 length])
      {
        uint64_t v32 = 0;
      }
      else
      {
        uint64_t v42 = [v35 substringFromIndex:];

        uint64_t v32 = 0;
        uint64_t v13 = (void *)v42;
      }
      id v11 = v62;
    }
    id v46 = (id)v59;
    if (v59)
    {
LABEL_50:
      int v60 = v46;
      if ([v46 length])
      {
        id v55 = v7;
        NSAttributedStringKey v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(int)[v46 intValue]);
        int64_t v47 = [(RootNavigationController *)self currentViewType];
        if (v47 == -1)
        {
          if (EKUIShouldSaveStateInPreferences())
          {
            objc_super v48 = +[CUIKPreferences sharedPreferences];
            objc_super v49 = [v48 lastViewMode];
            int64_t v47 = (int64_t)[v49 integerValue];
          }
          else
          {
            int64_t v47 = -1;
          }
        }
        -[RootNavigationController _dismissPresentedViewControllerAnimated:completion:](self, "_dismissPresentedViewControllerAnimated:completion:", 0, 0, v47);
        id v51 = [v10 calendar];
        __int16 v52 = [v51 timeZone];
        BOOL v50 = +[EKCalendarDate calendarDateWithDate:v31 timeZone:v52];

        id v53 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:v54 andDate:v50];
        [(RootNavigationController *)self showDate:v50 andTime:1 animated:0];
        id v7 = v55;
        id v11 = v62;
      }
      else
      {
        NSAttributedStringKey v31 = 0;
        BOOL v50 = v13;
        uint64_t v13 = 0;
      }

      int v33 = v56;
      unsigned int v34 = v57;
      goto LABEL_58;
    }
LABEL_49:
    id v46 = v57;
    goto LABEL_50;
  }
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000BA2D4;
  v63[3] = &unk_1001D4898;
  id v64 = v10;
  v65 = self;
  [(RootNavigationController *)self showCalendarsAnimated:1 completion:v63];
  NSAttributedStringKey v31 = 0;
  uint64_t v32 = 0;
  unsigned int v34 = v64;
LABEL_58:

LABEL_26:
  if ([v13 length])
  {
    [(RootNavigationController *)self showEventWithIdentifier:v13 isSearchResult:v11 != 0 date:v31 context:v7];
  }
  else if ([v32 length])
  {
    [(RootNavigationController *)self showContactWithIdentifier:v32];
  }
}

- (void)showEventWithIdentifier:(id)a3 isSearchResult:(BOOL)a4 date:(id)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v27 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v27 length])
  {
    double v12 = [v27 componentsSeparatedByString:@"_"];
    if ((unint64_t)[v12 count] < 2)
    {
      id v14 = (id)kCADMainDatabaseID;
      id v16 = [v27 intValue];
    }
    else
    {
      uint64_t v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [v13 intValue];

      double v15 = [v12 objectAtIndexedSubscript:1];
      id v16 = [v15 intValue];
    }
    CGRect v17 = +[EKObjectID objectIDWithEntityType:2 rowID:v16 databaseID:v14];
    if ((int)v16 < 1 || (v14 & 0x80000000) != 0) {
      goto LABEL_13;
    }
    model = self->_model;
    if (!v10 || v8)
    {
      uint64_t v20 = [(CUIKCalendarModel *)model closestOccurrenceToTomorrowForEventObjectID:v17];
      if (!v20)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      double v19 = [(CUIKCalendarModel *)model eventStore];
      uint64_t v20 = [v19 eventForObjectID:v17 occurrenceDate:v10];

      if (!v20) {
        goto LABEL_13;
      }
    }
    uint64_t v21 = self->_model;
    NSAttributedStringKey v22 = [v20 calendar];
    id v23 = [v22 source];
    [(CUIKCalendarModel *)v21 updateSourceForSelectedIdentity:v23 selectedCalendars:0];

    NSAttributedStringKey v24 = self->_model;
    double v25 = [v20 calendar];
    long long v26 = [v25 objectID];
    [(CUIKCalendarModel *)v24 ensureCalendarVisibleWithId:v26];

    [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:0];
    [(RootNavigationController *)self showEvent:v20 animated:0 showMode:1 context:v11];

    goto LABEL_13;
  }
LABEL_14:
}

+ (BOOL)_diagnosticsAvailable
{
  if (qword_100216780 != -1) {
    dispatch_once(&qword_100216780, &stru_1001D48B8);
  }
  return byte_100216778;
}

- (void)_showDebugReportProblemViewController
{
  double v3 = [(RootNavigationController *)self reportProblemNavigationController];

  if (!v3 && objc_opt_class())
  {
    id v7 = [objc_alloc((Class)CalendarDebugReportProblemViewController) initWithStyle:2];
    [v7 setReportProblemDelegate:self];
    id v4 = objc_alloc_init((Class)UINavigationController);
    [(RootNavigationController *)self setReportProblemNavigationController:v4];
    [v4 pushViewController:v7 animated:0];
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelPressedWhileInReportProblemView"];
    id v6 = [v7 navigationItem];
    [v6 setRightBarButtonItem:v5];

    [(RootNavigationController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_showAddSubscribedCalendarWithURL:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BA834;
  v4[3] = &unk_1001D3188;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(RootNavigationController *)v5 _dismissPresentedViewControllerAnimated:0 completion:v4];
}

- (void)_dismissReportProblemController
{
  [(RootNavigationController *)self dismissViewControllerAnimated:1 completion:0];

  [(RootNavigationController *)self setReportProblemNavigationController:0];
}

- (void)_cancelPressedWhileInReportProblemView
{
}

- (void)reportProblemViewControllerDidFinish:(id)a3
{
}

- (id)resetToYearView
{
  id v3 = 0;
  if ([(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:0])
  {
    id v4 = [(RootNavigationController *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      *(void *)&long long v6 = 138412290;
      long long v19 = v6;
      do
      {
        id v7 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          BOOL v8 = v7;
          id v9 = [(RootNavigationController *)self topViewController];
          *(_DWORD *)buf = v19;
          uint64_t v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Popping top view controller: [%@].", buf, 0xCu);
        }
        id v10 = -[RootNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0, v19);
        id v11 = [(RootNavigationController *)self topViewController];
        objc_opt_class();
        char v12 = objc_opt_isKindOfClass();
      }
      while ((v12 & 1) == 0);
    }
    uint64_t v13 = [(RootNavigationController *)self viewControllers];
    id v14 = [v13 objectAtIndex:0];
    id v3 = [v14 currentChildViewController];

    double v15 = [(RootNavigationController *)self model];
    id v16 = [v15 selectedDate];

    CGRect v17 = [v16 date];
    [v3 showDate:v17 animated:0];
  }

  return v3;
}

- (id)resetToMonthView
{
  id v3 = [(RootNavigationController *)self resetToYearView];

  if (v3)
  {
    id v4 = [(RootNavigationController *)self model];
    id v5 = [v4 selectedDate];

    long long v6 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:1 andDate:v5];
    id v7 = [v6 currentChildViewController];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)resetToMonthViewSplit:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RootNavigationController *)self resetToMonthView];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = +[CUIKPreferences sharedPreferences];
      uint64_t v8 = (uint64_t)[v7 monthViewScaleSize];

      if (v3)
      {
        uint64_t v8 = 1;
      }
      else if (v8 == 3)
      {
        id v9 = +[CUIKPreferences sharedPreferences];
        uint64_t v8 = (uint64_t)[v9 monthViewEventScaleSize];
      }
      [v6 animateToMonthWeekSize:v8 divided:v3];
      [(RootNavigationController *)self updateDividedMonthBarButtonItem];
    }
    id v10 = v5;
  }

  return v5;
}

- (id)resetToDayView
{
  BOOL v3 = [(RootNavigationController *)self resetToMonthView];

  if (v3)
  {
    id v4 = [(CUIKCalendarModel *)self->_model selectedDate];
    id v5 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:3 andDate:v4];

    id v6 = [(RootNavigationController *)self viewControllers];
    id v7 = [v6 lastObject];
    uint64_t v8 = [v7 currentChildViewController];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)resetToWeekView
{
  BOOL v3 = [(RootNavigationController *)self resetToYearView];

  if (v3)
  {
    id v4 = [(CUIKCalendarModel *)self->_model selectedDate];
    id v5 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:2 andDate:v4];

    id v6 = [(RootNavigationController *)self viewControllers];
    id v7 = [v6 lastObject];
    uint64_t v8 = [v7 currentChildViewController];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_topPresentedController
{
  id v2 = self;
  BOOL v3 = [(RootNavigationController *)v2 presentedViewController];

  if (v3)
  {
    do
    {
      id v4 = [(RootNavigationController *)v2 presentedViewController];

      id v5 = [(RootNavigationController *)v4 presentedViewController];

      id v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }

  return v4;
}

- (BOOL)shouldHandleCanPerformActionForSelector:(SEL)a3
{
  BOOL v5 = -[RootNavigationController _willKeyCommandChangeSelectedDate:](self, "_willKeyCommandChangeSelectedDate:")
    || [(RootNavigationController *)self _willKeyCommandChangeSelectedEvent:a3];
  if ("handleDayKeyCommand" == a3
    || "handleWeekKeyCommand" == a3
    || "handleMonthKeyCommand" == a3
    || "handleYearKeyCommand" == a3
    || "paste:" == a3
    || "copy:" == a3
    || "cut:" == a3
    || "handleDeleteKeyCommand" == a3
    || "handleDuplicateKeyCommand" == a3
    || "handleViewAvailabilityCommand" == a3)
  {
    return 1;
  }
  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RootNavigationController;
  unsigned __int8 v7 = [(RootNavigationController *)&v21 canPerformAction:a3 withSender:v6];
  uint64_t v8 = [(RootNavigationController *)self traitCollection];
  if ([v8 horizontalSizeClass] != (id)1)
  {

    goto LABEL_14;
  }
  if ("handleDayKeyCommand" == a3 || "handleWeekKeyCommand" == a3 || "handleMonthKeyCommand" == a3)
  {

LABEL_13:
    unsigned __int8 v7 = 0;
    goto LABEL_14;
  }

  if ("handleYearKeyCommand" == a3) {
    goto LABEL_13;
  }
LABEL_14:
  if ([(RootNavigationController *)self _willKeyCommandChangeSelectedEvent:a3])
  {
    unsigned __int8 v11 = [(RootNavigationController *)self _canChangeSelectedEvent];
  }
  else
  {
    if (![(RootNavigationController *)self _willKeyCommandChangeSelectedDate:a3]) {
      goto LABEL_19;
    }
    unsigned __int8 v11 = [(RootNavigationController *)self _canChangeSelectedDate];
  }
  unsigned __int8 v7 = v11;
LABEL_19:
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0)
  {
    if ("paste:" == a3)
    {
      char v12 = [(CUIKCalendarModel *)self->_model pasteboardManager];
      unsigned __int8 v7 = [v12 canPerformPaste];
    }
    if ("copy:" == a3)
    {
      CGRect v17 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
      uint64_t v18 = 1;
    }
    else
    {
      if ("cut:" != a3)
      {
        if ("handleViewAvailabilityCommand" != a3) {
          goto LABEL_37;
        }
        uint64_t v13 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
        if ([v13 count] == (id)1)
        {
          id v14 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
          double v15 = [v14 firstObject];

          if (!v15 || ![v15 hasAttendees])
          {
            unsigned __int8 v7 = 0;
            goto LABEL_36;
          }
          uint64_t v13 = [v15 calendar];
          id v16 = [v13 source];
          unsigned __int8 v7 = [v16 supportsAvailabilityRequests];
        }
        else
        {
          double v15 = 0;
          unsigned __int8 v7 = 0;
        }

LABEL_36:
LABEL_37:
        if ("handleDeleteKeyCommand" == a3)
        {
          unsigned __int8 v19 = [(RootNavigationController *)self _canPerformDeleteKeyCommand];
        }
        else
        {
          if ("handleDuplicateKeyCommand" != a3) {
            goto LABEL_42;
          }
          unsigned __int8 v19 = [(RootNavigationController *)self _canPerformDuplicateKeyCommand];
        }
        unsigned __int8 v7 = v19;
        goto LABEL_42;
      }
      CGRect v17 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
      uint64_t v18 = 0;
    }
    unsigned __int8 v7 = +[CUIKPasteboardUtilities allEventsValidForAction:v18 fromEvents:v17];

    goto LABEL_42;
  }
  unsigned __int8 v7 = 0;
LABEL_42:

  return v7;
}

- (BOOL)_willKeyCommandChangeSelectedEvent:(SEL)a3
{
  return "handleSelectNextEventCommand" == a3
      || "handleSelectPreviousEventCommand" == a3
      || "handleSelectNextOccurrenceCommand" == a3
      || "handleSelectPreviousOccurrenceCommand" == a3;
}

- (BOOL)_willKeyCommandChangeSelectedDate:(SEL)a3
{
  return "handleGoToNextDateComponentUnitCommand" == a3 || "handleGoToPreviousDateComponentUnitCommand" == a3;
}

- (BOOL)_canChangeSelectedEvent
{
  if ([(RootNavigationController *)self _isTextEditingInProgress]
    || [(RootNavigationController *)self _isAddEventPopoverDisplayed])
  {
    return 0;
  }
  id v4 = [(RootNavigationController *)self topMainViewControllerContainer];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v4 mainViewControllerCanChangeSelectedEvent];
  }
  else {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (BOOL)_canChangeSelectedDate
{
  if ([(RootNavigationController *)self _isTextEditingInProgress]
    || [(RootNavigationController *)self _isAddEventPopoverDisplayed])
  {
    return 0;
  }
  id v4 = [(RootNavigationController *)self topMainViewControllerContainer];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v4 mainViewControllerCanChangeSelectedDate];
  }
  else {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (BOOL)_isTextEditingInProgress
{
  id v2 = [(RootNavigationController *)self firstResponder];
  unsigned __int8 v3 = [v2 conformsToProtocol:&OBJC_PROTOCOL___UIKeyInput];

  return v3;
}

- (BOOL)_isAddEventPopoverDisplayed
{
  id v2 = [(RootNavigationController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)handleTodayKeyCommand
{
}

- (void)_switchToView:(int64_t)a3
{
  if (!self->_viewSwitchKeyCommandsTemporarilyLockedOut)
  {
    BOOL v5 = [(RootNavigationController *)self presentedViewController];

    if (!v5)
    {
      id v6 = [(RootNavigationController *)self traitCollection];
      id v7 = [v6 horizontalSizeClass];

      if (v7 == (id)2 && [(RootNavigationController *)self currentViewType] != a3)
      {
        self->_viewSwitchKeyCommandsTemporarilyLockedOut = 1;
        uint64_t v8 = [(RootNavigationController *)self topMainViewControllerContainer];
        id v9 = [v8 bestDateForNewEvent];

        id v10 = [(RootNavigationController *)self pushCalendarViewControllerWithViewType:a3 andDate:v9];
        dispatch_time_t v11 = dispatch_time(0, 250000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000BB598;
        block[3] = &unk_1001D2740;
        block[4] = self;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (void)handleDayKeyCommand
{
}

- (void)handleWeekKeyCommand
{
}

- (void)handleMonthKeyCommand
{
}

- (void)handleYearKeyCommand
{
}

- (void)handleRefreshKeyCommand
{
  unsigned __int8 v3 = +[DADConnection sharedConnection];
  [v3 resetTimersAndWarnings];

  id v6 = [(RootNavigationController *)self model];
  id v4 = [v6 eventStore];
  id v5 = [v4 refreshEverythingIfNecessary:1];
}

- (void)handleGoToNextDateComponentUnitCommand
{
}

- (void)handleGoToPreviousDateComponentUnitCommand
{
}

- (void)handleSelectNextEventCommand
{
}

- (void)handleSelectPreviousEventCommand
{
}

- (void)handleSelectNextOccurrenceCommand
{
  id v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v2 showNextOccurrenceOfSelectableItem];
}

- (void)handleSelectPreviousOccurrenceCommand
{
  id v2 = [(RootNavigationController *)self topMainViewControllerContainer];
  [v2 showPreviousOccurrenceOfSelectableItem];
}

- (void)handleNewEventKeyCommand
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1000BB7D4;
  id v7 = &unk_1001D41E8;
  objc_copyWeak(&v8, &location);
  id v2 = objc_retainBlock(&v4);
  unsigned __int8 v3 = +[CalendarTipsManager sharedManager];
  [v3 dismissTipDueToUserNavigationWithCompletionBlock:v2];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleSearchKeyCommand
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1000BB9A8;
  id v7 = &unk_1001D41E8;
  objc_copyWeak(&v8, &location);
  id v2 = objc_retainBlock(&v4);
  unsigned __int8 v3 = +[CalendarTipsManager sharedManager];
  [v3 dismissTipDueToUserNavigationWithCompletionBlock:v2];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleCloseKeyCommand
{
  unsigned __int8 v3 = [(RootNavigationController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(RootNavigationController *)self _dismissPresentedViewControllerAnimated:0 completion:0];
  }
  else
  {
    uint64_t v5 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(RootNavigationController *)self topMainViewControllerContainer];
      id v8 = [v7 currentChildViewController];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v11 = [(RootNavigationController *)self topMainViewControllerContainer];
        id v10 = [v11 currentChildViewController];
        [v10 performSelector:"handleCloseKeyCommand"];
      }
    }
  }
}

- (void)handleDismissSplashScreenKeyCommand
{
  id v2 = [(RootNavigationController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 dismissSplashScreen];
  }
}

- (void)handleViewAvailabilityCommand
{
  unsigned __int8 v3 = [(RootNavigationController *)self _topPresentedController];
  id v4 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  uint64_t v5 = [v4 firstObject];
  id v6 = +[EKUIAvailabilityViewController presentAvailabilityViewControllerForEvent:v5 fromViewController:v3];

  objc_initWeak(&location, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BBD60;
  v7[3] = &unk_1001D48E0;
  objc_copyWeak(&v8, &location);
  void v7[4] = self;
  [v6 setSaveBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)_canPerformDeleteKeyCommand
{
  unsigned __int8 v3 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  if ([v3 count])
  {
    id v4 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
    if (+[EKUIContextMenuActions eventsAllDeletable:v4])BOOL v5 = [(RootNavigationController *)self allSelectedEventsIndividuallyRepresented]; {
    else
    }
      BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)handleDeleteKeyCommand
{
  if ([(RootNavigationController *)self _canPerformDeleteKeyCommand])
  {
    id v4 = [(RootNavigationController *)self _topPresentedController];
    unsigned __int8 v3 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
    +[EKUIContextMenuActions deleteEvents:v3 presentationController:v4];
  }
}

- (BOOL)allSelectedEventsIndividuallyRepresented
{
  unsigned __int8 v3 = [(RootNavigationController *)self topMainViewControllerContainer];
  id v4 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  unsigned __int8 v5 = [v3 allEventsIndividuallyRepresented:v4];

  return v5;
}

- (BOOL)_canPerformDuplicateKeyCommand
{
  unsigned __int8 v3 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  if ([v3 count])
  {
    id v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    unsigned __int8 v5 = [v4 calendarToPasteTo];
    if (v5)
    {
      id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
      if (+[CUIKPasteboardUtilities allEventsValidForAction:2 fromEvents:v6])BOOL v7 = [(RootNavigationController *)self allSelectedEventsIndividuallyRepresented]; {
      else
      }
        BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)handleDuplicateKeyCommand
{
  if ([(RootNavigationController *)self _canPerformDuplicateKeyCommand])
  {
    id v5 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    unsigned __int8 v3 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
    id v4 = +[NSSet setWithArray:v3];
    [v5 duplicateEvents:v4 withDateMode:3 delegate:self];
  }
}

- (void)paste:(id)a3
{
  id v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
  [v4 pasteEventsWithDateMode:0 delegate:self];
}

- (void)cut:(id)a3
{
  id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  if ([v6 count])
  {
    id v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    id v5 = +[NSSet setWithArray:v6];
    [v4 cutEvents:v5 delegate:self];
  }
}

- (void)copy:(id)a3
{
  id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  if ([v6 count])
  {
    id v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    id v5 = +[NSSet setWithArray:v6];
    [v4 copyEvents:v5 delegate:self];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)pasteboardManager
{
  id v2 = [(RootNavigationController *)self model];
  unsigned __int8 v3 = [v2 pasteboardManager];

  return v3;
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5 = a4;
  id v6 = [(RootNavigationController *)self _topPresentedController];
  [v5 presentFromSource:v6];
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5) {
    [(RootNavigationController *)self attemptDisplayReviewPrompt];
  }
}

- (void)displayIntegrationAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RootNavigationController *)self parentViewController];
  id v6 = (void *)v5;
  if (v5) {
    BOOL v7 = (RootNavigationController *)v5;
  }
  else {
    BOOL v7 = self;
  }
  id v8 = v7;

  id v9 = [objc_alloc((Class)EKUIIntegrationAlertDisplayer) initWithViewController:v8 options:0];
  [v9 displayIntegrationAlert:v4];
}

- (id)undoManager
{
  return [(CUIKCalendarModel *)self->_model undoManager];
}

- (void)setModel:(id)a3
{
}

- (NSDate)lastActiveTime
{
  return self->_lastActiveTime;
}

- (void)setLastActiveTime:(id)a3
{
}

- (void)setViewSwitcher:(id)a3
{
}

- (void)setWindow:(id)a3
{
}

- (void)setNumberOfNotifications:(unint64_t)a3
{
  self->_numberOfNotifications = a3;
}

- (ViewSwitcherLayoutHandler)viewSwitcherLayoutHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewSwitcherLayoutHandler);

  return (ViewSwitcherLayoutHandler *)WeakRetained;
}

- (void)setPaletteView:(id)a3
{
}

- (BOOL)isTransitioningTraitCollection
{
  return self->_isTransitioningTraitCollection;
}

- (UINavigationController)reportProblemNavigationController
{
  return self->_reportProblemNavigationController;
}

- (void)setReportProblemNavigationController:(id)a3
{
}

- (BOOL)showingOverriddenToolbarItems
{
  return self->_showingOverriddenToolbarItems;
}

- (UIBarButtonItem)dividedMonthToggleBarButtonItem
{
  return self->_dividedMonthToggleBarButtonItem;
}

- (void)setDividedMonthToggleBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividedMonthToggleBarButtonItem, 0);
  objc_storeStrong((id *)&self->_calendarsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_inboxBarButtonItem, 0);
  objc_storeStrong((id *)&self->_reportProblemNavigationController, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_todayBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_viewSwitcherLayoutHandler);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_viewSwitcher, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_cachedMeContact, 0);
  objc_storeStrong((id *)&self->_calendarsViewController, 0);
  objc_storeStrong((id *)&self->_calendarsButton, 0);
  objc_storeStrong((id *)&self->_tomorrowUA, 0);
  objc_storeStrong((id *)&self->_userActivityForEvent, 0);
  objc_storeStrong((id *)&self->_userActivityForDateInView, 0);
  objc_storeStrong((id *)&self->_navBarDateStringCache, 0);
  objc_storeStrong((id *)&self->_labelBarItem, 0);
  objc_storeStrong((id *)&self->_leftFixedSpaceBarItem, 0);
  objc_storeStrong((id *)&self->_currentDateLabel, 0);
  objc_storeStrong((id *)&self->_currentDateLabelString, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_viewSwitcherSegmentedControl, 0);
  objc_storeStrong((id *)&self->_listAction, 0);
  objc_storeStrong((id *)&self->_largeScaleAction, 0);
  objc_storeStrong((id *)&self->_minimalScaleAction, 0);
  objc_storeStrong((id *)&self->_compactScaleAction, 0);
  objc_storeStrong((id *)&self->_compactMonthMenu, 0);
  objc_storeStrong((id *)&self->_searchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addEventBarButtonItem, 0);

  objc_storeStrong((id *)&self->_listToggleBarButtonItem, 0);
}

@end