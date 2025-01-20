@interface ActionCoordinator
- (ActionCoordinator)initWithPlatformController:(id)a3;
- (AppCoordinator)appCoordinator;
- (BOOL)_canCaptureSearchStateForCardItem:(id)a3 previousItemInStack:(id)a4;
- (BOOL)_isBuildingMultipointRoute;
- (BOOL)_shouldPresentAddStopSearchResults;
- (BOOL)canEnterPedestrianAR;
- (BOOL)chromeDidClearMapSelection;
- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3;
- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3;
- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3;
- (BOOL)chromeDidSelectETAMarkerForRoute:(id)a3;
- (BOOL)chromeDidSelectFlyoverTourLabelMarker:(id)a3;
- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3;
- (BOOL)chromeDidSelectOfflineAnnotationMarker:(id)a3;
- (BOOL)chromeDidSelectRouteAnnotations:(id)a3;
- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3;
- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5;
- (BOOL)chromeDidSelectTransitLineMarker:(id)a3;
- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3;
- (BOOL)chromeDidSelectWaypointMarkerForAddress:(id)a3;
- (BOOL)chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:(id)a3;
- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3;
- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3;
- (BOOL)clusterIsPartOfVenues:(id)a3;
- (BOOL)is3dModeSelected;
- (BOOL)isExiting3dMode;
- (BOOL)isPedestrianARActive;
- (BOOL)isPedestrianARShowingFailureView;
- (BOOL)isPresentingAddStopSearchResults;
- (BOOL)isRoutePlanningPresented;
- (BOOL)isTeachableMomentCardActive;
- (BOOL)isWeatherPopoverActive;
- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveURL:(id)a4;
- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveVCard:(id)a4;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)pptTestCanResizePlacecard;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (BOOL)searchSessionShouldUpdateEVChargers;
- (BOOL)shouldAddStopInRoutePlanning;
- (BOOL)shouldDismissPlaceCardOnClearMapSelection;
- (BOOL)shouldReusePlaceCardViewController:(id)a3;
- (BOOL)shouldShowSearchOverlay;
- (BOOL)viewController:(id)a3 shouldDisplayTransitSchedulesForMapItem:(id)a4 departureSequence:(id)a5;
- (ContaineeProtocol)currentViewController;
- (ControlContainerViewController)containerViewController;
- (DirectionItem)currentDirectionItem;
- (GEOMapServiceTraits)newTraits;
- (GEOTransitLineItem)currentTransitLineItem;
- (LineCardViewController)lineCardVC;
- (MKLookAroundView)currentLookAroundView;
- (MKMapItem)currentMapItem;
- (MapCameraFraming)mapCameraController;
- (MapSelectionManager)mapSelectionManager;
- (PersonalizedItemManager)personalizedItemManager;
- (PersonalizedItemSource)suggestionsItemSource;
- (PlaceCardItem)currentPlaceCardItem;
- (PlaceCardViewController)placeCardViewController;
- (PlaceCardViewController)placeCardViewControllerIfLoaded;
- (PlatformController)platformController;
- (RouteAnnotationContaineeViewController)routeAnnotationVC;
- (RouteAnnotationsController)routeAnnotationsController;
- (RoutePlanningDataCoordinator)routePlanningDataCoordinator;
- (RoutePlanningOverviewViewController)routePlanningOverviewViewController;
- (RoutePlanningOverviewViewController)routePlanningOverviewViewControllerIfLoaded;
- (SearchPinsManager)searchPinsManager;
- (SearchSession)currentSearchSession;
- (SearchSessionManager)searchSessionManager;
- (SearchViewController)searchViewControllerIfLoaded;
- (SettingsController)settingsController;
- (SimpleResultsViewController)simpleListResultsVC;
- (TrafficIncidentContaineeViewController)trafficIncidentVC;
- (TransitLineSelectionActionController)lineSelectionAction;
- (UIScrollView)pptTestScrollView;
- (UIScrollView)pptTestScrollViewForDirectionsDetails;
- (UIScrollView)pptTestScrollViewForProactive;
- (UIView)incidentsVCSourceView;
- (UIViewController)pptTestContaineeForDirectionsDetails;
- (UserLocationSearchResult)userLocationSearchResult;
- (VenueCardCoordinator)venueCardCoordinator;
- (VenuesManager)venuesManager;
- (double)isTouristHere;
- (id)_filteredFeaturesFromTransitSystems:(id)a3 allFeatures:(id)a4;
- (id)_hikingToken;
- (id)_newPlaceCardViewControllerForReuse;
- (id)_searchResultFromMapsFavoriteItem:(id)a3;
- (id)_searchResultFromMapsSuggestionsEntry:(id)a3;
- (id)autosharingVC;
- (id)incidentsVC;
- (id)mapSelectionStateForVenueCardItem:(id)a3 savePlaceCardSelectionState:(BOOL)a4;
- (id)mapView;
- (id)placeCardForRoutePlanningViewController;
- (id)placeCardForVenuesViewController:(id)a3;
- (id)reportsHomeViewController;
- (id)resultsViewController;
- (id)routeAnnotationsProvider;
- (id)routeData;
- (id)routeOptionsVC;
- (id)routePlanningMapController;
- (id)routeSearchVC;
- (id)routeStepsVC;
- (id)routingAppsVC;
- (id)searchFieldItemForVenueCardItem:(id)a3 previousItemInStack:(id)a4;
- (id)searchInfoForVenueCardItem:(id)a3 previousItemInStack:(id)a4;
- (id)searchModeViewController;
- (id)settingsViewController;
- (id)shortcutEditSessionController;
- (id)timePickingVC;
- (id)traitsForRouteSearchViewController:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)mapApplicationState;
- (int64_t)_excludedContentForPlaceCardItem:(id)a3;
- (int64_t)displayedViewMode;
- (int64_t)visibleViewModeBeforeDoingDirectionItem;
- (void)_cancelUserInteractions;
- (void)_carPlayWantsToDisplayEVOnboarding:(id)a3;
- (void)_cleanUpVenuesStackForNonVenuePlaceCardItem:(id)a3;
- (void)_cleanupRoutePlanningIfNeededAnimated:(BOOL)a3;
- (void)_dismissMacToolTipIfNeeded;
- (void)_enterRoutePlanningOverviewAnimated:(BOOL)a3 completion:(id)a4;
- (void)_enterRoutePlanningOverviewAnimated:(BOOL)a3 saveMapCamera:(BOOL)a4 completion:(id)a5;
- (void)_exitRoutePlanningIfNeededAnimated:(BOOL)a3 restoreStashedMapSelection:(BOOL)a4;
- (void)_prepareToReceiveDrop;
- (void)_presentMacRouteEditingWithEditRequired:(unint64_t)a3 index:(unint64_t)a4;
- (void)_presentVenuesPlaceCardItem:(id)a3 shouldSaveSelectionState:(BOOL)a4 source:(unint64_t)a5 resetPlaceCardViewControllerBlock:(id)a6;
- (void)_promptForCurrentLocationConfirmationWithDirectionItem:(id)a3 userInfo:(id)a4;
- (void)_promptForEditRequired:(unint64_t)a3 forWaypointAtIndex:(unint64_t)a4 inDirectionItem:(id)a5 userInfo:(id)a6;
- (void)_refreshSettingsTip;
- (void)_setHikingFeaturesForPlaceCardItem:(id)a3;
- (void)_setHikingToken:(id)a3;
- (void)_setRouteSelectionMapState;
- (void)_setTopographicalFeaturesForPlaceCardItem:(id)a3;
- (void)_viewControllerShowOfflineMaps:(id)a3 completionHandler:(id)a4;
- (void)actionControlDidDeactivate:(id)a3;
- (void)addContainerViewControllerObservers;
- (void)addRatingsForMapItem:(id)a3;
- (void)autosharingController:(id)a3 didUpdateContacts:(id)a4;
- (void)autosharingController:(id)a3 wantsToSearchWithExistingContacts:(id)a4 selectionHandler:(id)a5;
- (void)chromeViewController:(id)a3 didUpdateViewMode:(int64_t)a4;
- (void)clearMapSelection;
- (void)clearSearch;
- (void)clearSearchIfOriginatedFromWaypointEditor;
- (void)clearSearchPins;
- (void)clearSharedTrips;
- (void)closeRoutePlanningViewController:(id)a3 withSender:(id)a4;
- (void)closeSettingsIfNeeded;
- (void)closeSharedTripDetail;
- (void)closeStopDetail;
- (void)closeVenueFloorCardViewController:(id)a3;
- (void)closeVenueViewController:(id)a3;
- (void)collectionPickerClosed:(id)a3;
- (void)collectionPickerNewCollection:(id)a3;
- (void)confirmDeleteCollections:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 completion:(id)a6;
- (void)confirmDeleteSharedTripWithSummary:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 completion:(id)a6;
- (void)containeeViewController:(id)a3 didCreateKeyboardProxy:(id)a4;
- (void)containerViewControllerDidResignContainee:(id)a3 toContainee:(id)a4;
- (void)containerViewControllerWillPresentContainee:(id)a3 overContainee:(id)a4;
- (void)dealloc;
- (void)defaultZoom;
- (void)deferPresentingMapPopoversInsideBlock:(id)a3;
- (void)deleteMarkedLocation:(id)a3;
- (void)didDismissViewController:(id)a3 mapItem:(id)a4;
- (void)didRequestDirectionsForSharedTrip:(id)a3;
- (void)didSaveCustomRoute:(id)a3;
- (void)didSelectStopWithMapItem:(id)a3;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)dismissLastVenuePlaceCard;
- (void)dismissPedestrianARTeachableMomentCardIfNecessary;
- (void)dismissPlaceCardViewController:(id)a3;
- (void)dismissRoutePlanningPlaceCardIfNeeded;
- (void)displayAlertWithTitle:(id)a3 message:(id)a4 postAlertSearchType:(unsigned int)a5;
- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4;
- (void)endSearch;
- (void)endSearchForTesting;
- (void)ensureMapSelectionVisible;
- (void)ensureRoutePlanningContentIsVisible;
- (void)enterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6;
- (void)enterPedestrianAR;
- (void)enterPedestrianAR:(id)a3;
- (void)exit3dMode;
- (void)exitLookAround;
- (void)exitPedestrianAR;
- (void)exitRoutePlanningIfNeededAnimated:(BOOL)a3;
- (void)finishExitFrom3dMode;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5;
- (void)incidentReportSubmissionContaineeDidFinish:(id)a3;
- (void)lineCardViewController:(id)a3 displayMapRegion:(id)a4;
- (void)lineCardViewController:(id)a3 doDirectionItem:(id)a4;
- (void)lineCardViewController:(id)a3 selectMapItem:(id)a4;
- (void)lineCardViewController:(id)a3 showIncidents:(id)a4;
- (void)lineCardViewControllerDidAppear:(id)a3;
- (void)locationRefinementViewController:(id)a3 didSelectCoordinate:(CLLocationCoordinate2D)a4;
- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapItem:(id)a4;
- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapKitHandle:(id)a4 title:(id)a5;
- (void)mapsDragDestinationHandler:(id)a3 didReceiveString:(id)a4 nearCoordinate:(CLLocationCoordinate2D)a5;
- (void)markedLocationRefinementViewControllerDidCancel:(id)a3;
- (void)markedLocationRefinementViewControllerSelectedRemoveMarkedLocation:(id)a3;
- (void)placeCardViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 placeMUID:(unint64_t)a6 completion:(id)a7;
- (void)placeCardViewController:(id)a3 didRequestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a4;
- (void)placeCardViewController:(id)a3 didUpdateForViewMode:(int64_t)a4;
- (void)placeCardViewController:(id)a3 didUpdateLinkedPlacesFromPlaceCardItem:(id)a4;
- (void)placeCardViewController:(id)a3 displayStoreViewControllerForAppWithiTunesIdentifier:(id)a4;
- (void)placeCardViewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5;
- (void)placeCardViewController:(id)a3 editLocationOfMarkedLocation:(id)a4;
- (void)placeCardViewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6;
- (void)placeCardViewController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5;
- (void)placeCardViewController:(id)a3 mapItemDidChange:(id)a4;
- (void)placeCardViewController:(id)a3 placeCardItemWillChange:(id)a4;
- (void)placeCardViewController:(id)a3 presentCategoryPlacesListForMapItem:(id)a4 searchCategory:(id)a5;
- (void)placeCardViewController:(id)a3 presentPOIEnrichmentWithCoordinator:(id)a4;
- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4;
- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6;
- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4;
- (void)placeCardViewController:(id)a3 selectMapItem:(id)a4 address:(id)a5;
- (void)placeCardViewController:(id)a3 selectTransitLineItem:(id)a4;
- (void)placeCardViewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldShowDataManagementAfterDownload:(BOOL)a6;
- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4;
- (void)placeCardViewController:(id)a3 showTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (void)placeCardViewController:(id)a3 willReusePlaceCardItem:(id)a4;
- (void)placeCardViewControllerDidTapHikingTip:(id)a3;
- (void)placeCardViewControllerRemovedObservingHandle:(id)a3;
- (void)placeCardViewControllerWillBecomeCurrent:(id)a3;
- (void)placeCardViewControllerWillResignCurrent:(id)a3;
- (void)placeViewControllerViewContactsClosed;
- (void)poiEnrichmentCoordinator:(id)a3 openURL:(id)a4;
- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4;
- (void)poiEnrichmentCoordinatorDidFinish:(id)a3;
- (void)popContainee;
- (void)pptAssertSearch;
- (void)pptSelectACSuggestionMatchingAddress:(id)a3;
- (void)pptSelectFirstCuratedGuide;
- (void)pptSelectFirstGuidePublisher;
- (void)pptSelectSeeAllCuratedCollections;
- (void)pptTestAutocompleteSearchForFieldItem:(id)a3;
- (void)pptTestCreateCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 animated:(BOOL)a4;
- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4;
- (void)pptTestDoDirectionItem:(id)a3;
- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5;
- (void)pptTestEnterSearchMode;
- (void)pptTestMaximizePlaceCardAnimated:(BOOL)a3;
- (void)pptTestMediumizePlaceCardAnimated:(BOOL)a3;
- (void)pptTestMinimizePlaceCardAnimated:(BOOL)a3;
- (void)pptTestOpenCollections;
- (void)pptTestOpenFirstCollection;
- (void)pptTestOpenRecents;
- (void)pptTestOpenSettings;
- (void)pptTestPresentDirectionsDetails;
- (void)pptTestPresentPlaceCardForSearchResult:(id)a3 animated:(BOOL)a4;
- (void)pptTestPresentPlacecardWithMapItem:(id)a3;
- (void)pptTestPresentVenueForMapItem:(id)a3 searchCategory:(id)a4;
- (void)pptTestSearchCancel;
- (void)pptTestSearchEndEditing;
- (void)pptTestSearchForFieldItem:(id)a3;
- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3;
- (void)pptTestSearchRetainQueryForSelectedSearchCompletion:(id)a3;
- (void)pptTestSelectVenueSearchResult:(id)a3;
- (void)pptTestStartNavigation;
- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)presentAutosharingContactSearchWithContacts:(id)a3 selectionHandler:(id)a4;
- (void)presentChinaAlertForSharedTrip:(id)a3;
- (void)presentEditNoteViewControllerWithInitialText:(id)a3 libraryAccessProvider:(id)a4 placeMUID:(unint64_t)a5 completion:(id)a6;
- (void)presentEducationScreenWithAssetURLs:(id)a3 titleText:(id)a4 bodyText:(id)a5;
- (void)presentGuidesHomeWithGuideLocation:(id)a3;
- (void)presentLPRWithVehicle:(id)a3 scenario:(int64_t)a4 presenter:(id)a5 completionBlock:(id)a6;
- (void)presentLineCardForItem:(id)a3 labelMarker:(id)a4 loading:(BOOL)a5 overDisambiguation:(BOOL)a6 preferredLayout:(unint64_t)a7;
- (void)presentLineCardForItem:(id)a3 loading:(BOOL)a4 overDisambiguation:(BOOL)a5;
- (void)presentLineCardForItem:(id)a3 loading:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6;
- (void)presentLoadingResults;
- (void)presentMacToolTipForLinkType:(int64_t)a3;
- (void)presentOfflineMapsSelectorFromTipWithRegion:(id)a3 name:(id)a4;
- (void)presentPOIEnrichmentInformedConsentWithPresentationContext:(int64_t)a3 completion:(id)a4;
- (void)presentPlaceCard:(id)a3;
- (void)presentPlaceCard:(id)a3 canReplaceCurrentIfNecessary:(BOOL)a4;
- (void)presentPlaceCardForItem:(id)a3 addToHistory:(BOOL)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6;
- (void)presentPlaceCardForItem:(id)a3 addToHistory:(BOOL)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6 replaceCurrentCard:(BOOL)a7;
- (void)presentPreferredNetworksOnboardingForVehicle:(id)a3;
- (void)presentRouteLibraryWithAvailableRoutes:(id)a3 unavailableRoutes:(id)a4;
- (void)presentRoutePlanningViewType:(int64_t)a3;
- (void)presentScheduleForStep:(id)a3;
- (void)presentSearch;
- (void)presentSearchAndRestoreSearchItem:(id)a3;
- (void)presentSearchAnimated:(BOOL)a3;
- (void)presentSharedTrip:(id)a3;
- (void)presentSharedTrip:(id)a3 inPopoverFromView:(id)a4;
- (void)presentSharedTrips;
- (void)presentSimpleList:(id)a3;
- (void)presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:(id)a3;
- (void)presentVehicleOnboardingWithVehicles:(id)a3 completion:(id)a4;
- (void)presentVenueCategoryWithVenueCategoryItem:(id)a3;
- (void)presentWalletDCIViewControllerWithTransitSystems:(id)a3 callbackDelegate:(id)a4;
- (void)presentWalletTopUpViewControllerWithTransitIdentifier:(id)a3 callbackDelegate:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)receivedVenueEVChargersUpdate:(id)a3;
- (void)refreshCurrentSearch;
- (void)refreshRoutePlanningTimingIfNeeded;
- (void)removeContainerViewControllerObserver;
- (void)restoreSearchForItem:(id)a3 withResults:(id)a4;
- (void)restoreSearchForItem:(id)a3 withResults:(id)a4 sessionOrigin:(unint64_t)a5;
- (void)retainSearchQueryForSelectedSearchResult:(id)a3;
- (void)routePlanningDataCoordinator:(id)a3 isEnabled:(BOOL)a4;
- (void)routePlanningUpdatedWaypoints:(id)a3;
- (void)routeSearchViewControllerDidDismiss:(id)a3 shouldExitRoutePlanning:(BOOL)a4;
- (void)routeStepsViewController:(id)a3 wantsToDisplayAdvisory:(id)a4;
- (void)routeStepsViewController:(id)a3 wantsToDisplayScheduleForTransitStep:(id)a4;
- (void)routeStepsViewController:(id)a3 wantsToShareItem:(id)a4 fromView:(id)a5;
- (void)searchSessionManagerReceiveEVChargersUpdate:(id)a3;
- (void)searchSessionManagerSessionDidFail;
- (void)searchSessionManagerSessionDidInvalidate;
- (void)searchSessionManagerSessionDidReceiveUpdate;
- (void)select3dMode;
- (void)selectWaypointSearchFieldIndex:(unint64_t)a3 exitPlanningIfCancelTapped:(BOOL)a4;
- (void)setAppCoordinator:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setCurrentDirectionItem:(id)a3;
- (void)setCurrentDirectionItem:(id)a3 withOptions:(id)a4;
- (void)setCurrentTransitLineItem:(id)a3;
- (void)setCurrentTransitLineItem:(id)a3 zoomToMapRegion:(BOOL)a4;
- (void)setCurrentTransitLineItem:(id)a3 zoomToMapRegion:(BOOL)a4 preferredLayout:(unint64_t)a5;
- (void)setIncidentsVCSourceView:(id)a3;
- (void)setIsRoutePlanningPresented:(BOOL)a3;
- (void)setLineSelectionAction:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRoutePlanningAdvisoriesInfo:(id)a3;
- (void)setRoutePlanningAdvisory:(id)a3;
- (void)setRoutePlanningIncidentsSourceView:(id)a3;
- (void)setUserTrackingViewUserTrackingMode:(int64_t)a3;
- (void)setViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setVisibleViewModeBeforeDoingDirectionItem:(int64_t)a3;
- (void)shortcutEditSessionControllerFinished:(id)a3 shortcutWasReplacedBy:(id)a4;
- (void)showAnnouncementForFlyover:(id)a3;
- (void)showCuratedCollectionViewController:(id)a3 replaceViewController:(BOOL)a4 completion:(id)a5;
- (void)showNearbyTeachableMomentCard;
- (void)showPedestrianARFeatureIntroTeachableMomentCard;
- (void)showPedestrianARRaiseToEnterTeachableMomentCard;
- (void)showVLF;
- (void)simpleResultsViewContoller:(id)a3 didStapOnAddStopWithSearchResult:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 didTapOnCallWithSearchResult:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 didTapOnFlyoverWithSearchResult:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 didTapOnLookAroundWithSearchResult:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 didTapOnWebsiteWithSearchResult:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 selectClusteredLabelMarker:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 selectContainmentParentMapItem:(id)a4 resultsList:(id)a5;
- (void)simpleResultsViewContoller:(id)a3 selectDirectionItem:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 selectSearchResult:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 selectTappableEntry:(id)a4 resultsList:(id)a5;
- (void)simpleResultsViewContoller:(id)a3 showCuratedCollection:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 showCuratedCollectionsList:(id)a4 title:(id)a5;
- (void)simpleResultsViewContoller:(id)a3 showUserGeneratedCollection:(id)a4;
- (void)switchRoutePlanningTransportTypeToType:(int64_t)a3;
- (void)timingViewController:(id)a3 didPickTiming:(id)a4;
- (void)toggleRoutePlanning;
- (void)transitSchedulesViewController:(id)a3 wantsToDisplayIncidents:(id)a4 fromView:(id)a5;
- (void)transitSchedulesViewController:(id)a3 wantsToShowInfoForLine:(id)a4;
- (void)updateFloatingControlsWithSearchSession:(id)a3;
- (void)updateHistoricalLocations;
- (void)updateMapApplicationState:(int)a3;
- (void)updateRedoSearchFloatingControl:(BOOL)a3;
- (void)updateResultsViewContent;
- (void)updateRouteAnnotations;
- (void)updateSearchFieldWithSearchFieldItem:(id)a3;
- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)viewController:(id)a3 addItemsFromACToCollection:(id)a4;
- (void)viewController:(id)a3 addStopForSearchFieldItem:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 addStopForSearchResult:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 confirmDeleteCollections:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (void)viewController:(id)a3 continueRideBookingSessionWithApplicationIdentifier:(id)a4;
- (void)viewController:(id)a3 createDroppedPin:(id)a4;
- (void)viewController:(id)a3 createMarkedLocationAtCoordinate:(CLLocationCoordinate2D)a4 floorOrdinal:(int)a5;
- (void)viewController:(id)a3 createNewCollectionWithSession:(id)a4;
- (void)viewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5;
- (void)viewController:(id)a3 dismissMenuControllerAnimated:(BOOL)a4;
- (void)viewController:(id)a3 displayStoreViewControllerForAppWithiTunesIdentifier:(id)a4 clientIdentifier:(id)a5;
- (void)viewController:(id)a3 displayTableBookingFor:(id)a4;
- (void)viewController:(id)a3 displayTransitSchedulesForDepartureSequence:(id)a4 withTimeZone:(id)a5 scheduleWindowStartDate:(id)a6 includeAllDirections:(BOOL)a7;
- (void)viewController:(id)a3 displayTransitSchedulesForMapItem:(id)a4 departureSequence:(id)a5;
- (void)viewController:(id)a3 doAudioCallToSearchResult:(id)a4;
- (void)viewController:(id)a3 doDirectionIntent:(id)a4 withSearchResults:(id)a5;
- (void)viewController:(id)a3 doDirectionIntentWithLocalSearchCompletion:(id)a4;
- (void)viewController:(id)a3 doDirectionItem:(id)a4 allowToPromptEditing:(BOOL)a5 withUserInfo:(id)a6;
- (void)viewController:(id)a3 doDirectionItem:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5 refinementsQuery:(id)a6;
- (void)viewController:(id)a3 doShareSheetForShareItem:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 downloadOfflineRegionForRouteData:(id)a4;
- (void)viewController:(id)a3 editCollection:(id)a4;
- (void)viewController:(id)a3 editCollection:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (void)viewController:(id)a3 editLocationForParkedCar:(id)a4;
- (void)viewController:(id)a3 editLocationOfMarkedLocation:(id)a4;
- (void)viewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6;
- (void)viewController:(id)a3 editRoute:(id)a4;
- (void)viewController:(id)a3 editShortcut:(id)a4;
- (void)viewController:(id)a3 editShortcut:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6;
- (void)viewController:(id)a3 enterFlyoverForMapItem:(id)a4;
- (void)viewController:(id)a3 enterRouteCreationWith:(id)a4;
- (void)viewController:(id)a3 enterRouteCreationWithRoute:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 focusSearchResult:(id)a4;
- (void)viewController:(id)a3 openCommuteEntry:(id)a4;
- (void)viewController:(id)a3 openFavoriteItem:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 openMapsSuggestionEntry:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 openPlainTextFileURL:(id)a4;
- (void)viewController:(id)a3 openSearchResult:(id)a4;
- (void)viewController:(id)a3 openTransitIncidents:(id)a4 fromView:(id)a5 withUserInfo:(id)a6;
- (void)viewController:(id)a3 openTransitLineCard:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6;
- (void)viewController:(id)a3 openURL:(id)a4;
- (void)viewController:(id)a3 openWebsiteForSearchResult:(id)a4;
- (void)viewController:(id)a3 pickCollectionWithSession:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6;
- (void)viewController:(id)a3 presentCluster:(id)a4;
- (void)viewController:(id)a3 presentCollectionPickerContaineeViewController:(id)a4;
- (void)viewController:(id)a3 presentMenuController:(id)a4 animated:(BOOL)a5 fromChrome:(BOOL)a6 completion:(id)a7;
- (void)viewController:(id)a3 presentParentMapItem:(id)a4;
- (void)viewController:(id)a3 presentPlacesForMapItem:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6;
- (void)viewController:(id)a3 presentPlacesWithPlacesCardItem:(id)a4 source:(unint64_t)a5;
- (void)viewController:(id)a3 presentRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7;
- (void)viewController:(id)a3 presentReportDetail:(id)a4 fromEntryPoint:(int)a5;
- (void)viewController:(id)a3 presentVenueFloorCardViewController:(id)a4;
- (void)viewController:(id)a3 presentVenueForMapItem:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6;
- (void)viewController:(id)a3 presentVenueFromAutoCompleteWithVenueIdentifier:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6;
- (void)viewController:(id)a3 presentVenueWithVenueCardItem:(id)a4 source:(unint64_t)a5;
- (void)viewController:(id)a3 presentVenuesClusteredSearchResult:(id)a4;
- (void)viewController:(id)a3 removeDroppedPin:(id)a4;
- (void)viewController:(id)a3 removeMapsSuggestionsEntry:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 startBlock:(id)a7 completionBlock:(id)a8;
- (void)viewController:(id)a3 removeShortcut:(id)a4;
- (void)viewController:(id)a3 selectClientResolvedItem:(id)a4 fromSearchInfo:(id)a5 withUserInfo:(id)a6;
- (void)viewController:(id)a3 selectDroppedPin:(id)a4;
- (void)viewController:(id)a3 selectLastDirectionsDestinationComposedWaypoint:(id)a4;
- (void)viewController:(id)a3 selectMapItem:(id)a4 address:(id)a5 addToHistory:(BOOL)a6 source:(unint64_t)a7;
- (void)viewController:(id)a3 selectParkedCar:(id)a4 andPerformAction:(int64_t)a5;
- (void)viewController:(id)a3 selectParkedCar:(id)a4 andPerformAction:(int64_t)a5 selectPOIOnMap:(BOOL)a6;
- (void)viewController:(id)a3 selectPersonalizedItem:(id)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6;
- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7;
- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7 replaceCurrentCard:(BOOL)a8;
- (void)viewController:(id)a3 selectTransitLineItem:(id)a4 zoomToMapRegion:(BOOL)a5;
- (void)viewController:(id)a3 selectTransitLineItem:(id)a4 zoomToMapRegion:(BOOL)a5 preferredLayout:(unint64_t)a6;
- (void)viewController:(id)a3 selectVenueSearchResult:(id)a4 source:(unint64_t)a5;
- (void)viewController:(id)a3 showAddShortcut:(id)a4;
- (void)viewController:(id)a3 showCollection:(id)a4;
- (void)viewController:(id)a3 showCollection:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 showCollectionWithID:(id)a4;
- (void)viewController:(id)a3 showCuratedCollection:(id)a4;
- (void)viewController:(id)a3 showCuratedCollection:(id)a4 replaceViewController:(BOOL)a5 completion:(id)a6;
- (void)viewController:(id)a3 showCuratedCollectionIdentifier:(id)a4;
- (void)viewController:(id)a3 showCuratedCollectionIdentifier:(id)a4 replaceViewController:(BOOL)a5 completion:(id)a6;
- (void)viewController:(id)a3 showCuratedCollectionsList:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6 completion:(id)a7;
- (void)viewController:(id)a3 showFavoritesType:(int64_t)a4;
- (void)viewController:(id)a3 showFullyClientizedCuratedCollection:(id)a4 replaceViewController:(BOOL)a5;
- (void)viewController:(id)a3 showGuidesHome:(id)a4;
- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5;
- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 dismissalBlock:(id)a6;
- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 route:(id)a6 shouldUseSessionlessAnalytics:(BOOL)a7 dismissalBlock:(id)a8 postDismissalBlock:(id)a9;
- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 route:(id)a6 shouldUseSessionlessAnalytics:(BOOL)a7 shouldShowDataManagementAfterDownload:(BOOL)a8 shouldShowDataManagementAfterDownloadIfRegionDiffers:(BOOL)a9 dismissalBlock:(id)a10;
- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldUseSessionlessAnalytics:(BOOL)a6;
- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldUseSessionlessAnalytics:(BOOL)a6 dismissalBlock:(id)a7 postDismissalBlock:(id)a8;
- (void)viewController:(id)a3 startDirectionsToRouteData:(id)a4;
- (void)viewController:(id)a3 startNavigationWithRouteCollection:(id)a4 navigationDetailsOptions:(NavigationDetailsOptions *)a5;
- (void)viewController:(id)a3 startRideBookingSessionWithRideBookingRideOption:(id)a4;
- (void)viewControllerCloseSettingsTip:(id)a3;
- (void)viewControllerClosed:(id)a3 animated:(BOOL)a4;
- (void)viewControllerDoLastDirectionItem:(id)a3;
- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4;
- (void)viewControllerOpenNearby:(id)a3 animated:(BOOL)a4;
- (void)viewControllerOpenSettings:(id)a3;
- (void)viewControllerPresentNearbyTransitDepartures:(id)a3;
- (void)viewControllerPresentPOIEnrichmentWithCoordinator:(id)a3;
- (void)viewControllerPresentRatingsHistory:(id)a3;
- (void)viewControllerPresentSearchEditing;
- (void)viewControllerPresentSearchEndEditing;
- (void)viewControllerPresentSearchEndEditingAnimated:(BOOL)a3;
- (void)viewControllerPresentUserProfile:(id)a3;
- (void)viewControllerPresentUserProfilePreferences:(id)a3 withTabType:(int64_t)a4;
- (void)viewControllerPresentVirtualGarage:(id)a3;
- (void)viewControllerRemoveSearchResultFocus:(id)a3;
- (void)viewControllerShowAddItemsFromACToLibraryView:(id)a3;
- (void)viewControllerShowAllCollections;
- (void)viewControllerShowCitySelectorFromGuideLocation:(id)a3;
- (void)viewControllerShowCollections:(id)a3;
- (void)viewControllerShowExpiredOfflineMaps:(id)a3;
- (void)viewControllerShowLibraryPlacesView:(id)a3;
- (void)viewControllerShowLibraryRootView:(id)a3;
- (void)viewControllerShowMyRecents:(id)a3 includeRecentSearches:(BOOL)a4;
- (void)viewControllerShowMyShortcuts:(id)a3;
- (void)viewControllerShowOfflineMaps:(id)a3;
- (void)viewControllerShowPhotoCredit:(id)a3;
- (void)viewControllerShowPhotoThumbnailGalleryWithMapItem:(id)a3 albumIndex:(unint64_t)a4;
- (void)viewControllerShowPublisher:(id)a3;
- (void)viewControllerShowPublisher:(id)a3 replaceViewController:(BOOL)a4;
- (void)viewControllerShowPublisherWithID:(id)a3;
- (void)viewControllerShowPublisherWithID:(id)a3 numberOfCollections:(unint64_t)a4 replaceViewController:(BOOL)a5;
- (void)viewControllerShowReports:(id)a3;
- (void)viewControllerShowReports:(id)a3 fromEntryPoint:(int)a4;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation ActionCoordinator

- (void)presentSearchAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = [(ActionCoordinator *)self searchModeViewController];
  [WeakRetained presentController:v5 animated:v3 useDefaultContaineeLayout:1];
}

- (void)updateHistoricalLocations
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  v2 = [v3 chromeViewController];
  [v2 updateHistoricalLocations];
}

- (void)updateRouteAnnotations
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  v2 = [v3 chromeViewController];
  [v2 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (id)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained chromeViewController];
  v4 = [v3 mapView];

  return v4;
}

- (PersonalizedItemManager)personalizedItemManager
{
  v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  v4 = [v3 personalizedItemManager];

  return (PersonalizedItemManager *)v4;
}

- (void)containerViewControllerWillPresentContainee:(id)a3 overContainee:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
    }
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
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_10:
              }
                [(SearchViewController *)self->_searchModeViewController clearRetainedSearchQuery];
            }
          }
        }
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(ActionCoordinator *)self mapSelectionManager];
    [v7 setIgnoreSelectionChanges:1];
  }
  [(ActionCoordinator *)self updateRouteAnnotations];
}

- (SettingsController)settingsController
{
  v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  v4 = [v3 settingsController];

  return (SettingsController *)v4;
}

- (void)closeSettingsIfNeeded
{
  v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  v4 = [v3 topMostPresentedViewController];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [v5 presentingViewController];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1006ECA84;
      v8[3] = &unk_1012E5D08;
      id v9 = v5;
      id v7 = v5;
      [v6 dismissViewControllerAnimated:0 completion:v8];
    }
  }
}

- (void)setContainerViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained != obj)
  {
    [(ActionCoordinator *)self removeContainerViewControllerObserver];
    id v5 = objc_storeWeak((id *)&self->_containerViewController, obj);
    id v6 = [obj chromeViewController];
    [v6 setViewModeDelegate:self];

    [(ActionCoordinator *)self addContainerViewControllerObservers];
    [(ActionCoordinator *)self presentSearchAnimated:0];
    [(ActionCoordinator *)self _refreshSettingsTip];
  }
}

- (void)viewControllerClosed:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v19 = (PlaceCardViewController *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(ActionCoordinator *)self searchPinsManager];
    [v6 clearLinkedPlacesAndPolygon];

    id v7 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
    [v7 resetConfiguration];

    id v8 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
    [v8 cancelFetchingPlaceEnrichment];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(ActionCoordinator *)self mapSelectionManager];
    [v9 clearSelection];

    [(ActionCoordinator *)self clearSearch];
    parkedCarViewController = self->_parkedCarViewController;
    self->_parkedCarViewController = 0;
  }
  [(ActionCoordinator *)self closeSettingsIfNeeded];
  if ([(SearchSessionManager *)self->_searchSessionManager singleResultMode])
  {
    v11 = +[UIDevice currentDevice];
    id v12 = [v11 userInterfaceIdiom];

    if (v12 != (id)5) {
      [(ActionCoordinator *)self clearSearch];
    }
  }
  if (v19)
  {
    if (self->_placeCardForRoutePlanningViewController == v19) {
      [(ActionCoordinator *)self _setRouteSelectionMapState];
    }
    v13 = [(ActionCoordinator *)self venueCardCoordinator];
    v14 = [v13 topViewController];

    if (v14 == v19)
    {
      v15 = [(ActionCoordinator *)self venueCardCoordinator];
      [v15 popVenueCardItem:0];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ActionCoordinator *)self _cleanupRoutePlanningIfNeededAnimated:0];
  }
  v16 = [(ActionCoordinator *)self containerViewController];
  [v16 popLastViewControllerFromViewController:v19 animated:v4 useDefaultContaineeLayout:0];

  v17 = [(ActionCoordinator *)self containerViewController];
  v18 = [v17 viewIfLoaded];
  [v18 endEditing:1];
}

- (ActionCoordinator)initWithPlatformController:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ActionCoordinator;
  id v6 = [(ActionCoordinator *)&v14 init];
  if (v6)
  {
    id v7 = sub_10010A144();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v16 = v6;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with platform controller: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_platformController, a3);
    id v8 = [[RoutePlanningDataCoordinator alloc] initWithPlatformController:v6->_platformController];
    routePlanningDataCoordinator = v6->_routePlanningDataCoordinator;
    v6->_routePlanningDataCoordinator = v8;

    [(RoutePlanningDataCoordinator *)v6->_routePlanningDataCoordinator setDelegate:v6];
    v10 = objc_alloc_init(SearchSessionManager);
    searchSessionManager = v6->_searchSessionManager;
    v6->_searchSessionManager = v10;

    [(SearchSessionManager *)v6->_searchSessionManager setDelegate:v6];
    [(SearchSessionManager *)v6->_searchSessionManager setCoordinator:v6];
    [(SearchSessionManager *)v6->_searchSessionManager addObserver:v6];
    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"_carPlayWantsToDisplayEVOnboarding:" name:@"EVOnboardingCarPlayHintSelectedNotification" object:0];
  }
  return v6;
}

- (void)addContainerViewControllerObservers
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    id v5 = +[NSNotificationCenter defaultCenter];
    id v6 = objc_loadWeakRetained((id *)p_containerViewController);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100041D0C;
    v15[3] = &unk_1012E6730;
    objc_copyWeak(&v16, &location);
    id v7 = [v5 addObserverForName:@"ContainerWillPresentContaineeNotification" object:v6 queue:0 usingBlock:v15];
    id containerViewControllerWillPresentContaineeObserver = self->_containerViewControllerWillPresentContaineeObserver;
    self->_id containerViewControllerWillPresentContaineeObserver = v7;

    id v9 = +[NSNotificationCenter defaultCenter];
    id v10 = objc_loadWeakRetained((id *)p_containerViewController);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1006E03AC;
    v13[3] = &unk_1012E6730;
    objc_copyWeak(&v14, &location);
    v11 = [v9 addObserverForName:@"ContainerDidResignContaineeNotification" object:v10 queue:0 usingBlock:v13];
    id containerViewControllerDidResignContaineeObserver = self->_containerViewControllerDidResignContaineeObserver;
    self->_id containerViewControllerDidResignContaineeObserver = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (PersonalizedItemSource)suggestionsItemSource
{
  v2 = [(ActionCoordinator *)self searchModeViewController];
  id v3 = [v2 suggestionsItemSource];

  return (PersonalizedItemSource *)v3;
}

- (id)searchModeViewController
{
  searchModeViewController = self->_searchModeViewController;
  if (!searchModeViewController)
  {
    BOOL v4 = objc_alloc_init(SearchViewController);
    id v5 = self->_searchModeViewController;
    self->_searchModeViewController = v4;

    [(ControlContaineeViewController *)self->_searchModeViewController setDelegate:self];
    id v6 = [(ActionCoordinator *)self personalizedItemManager];
    [(SearchViewController *)self->_searchModeViewController setPersonalizedItemManager:v6];

    id v7 = [(ActionCoordinator *)self containerViewController];
    id v8 = [v7 chromeViewController];

    id v9 = [v8 traitCollection];
    id v10 = [v9 horizontalSizeClass];

    if (sub_1000BBB44(v8) == 1 && v10 == (id)2) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = [(ContaineeViewController *)self->_searchModeViewController cardPresentationController];
    [v13 setDefaultContaineeLayout:v12];

    searchModeViewController = self->_searchModeViewController;
  }

  return searchModeViewController;
}

- (GEOMapServiceTraits)newTraits
{
  v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  BOOL v4 = [v3 currentTraits];

  return v4;
}

- (BOOL)isExiting3dMode
{
  return self->_isExiting3dMode;
}

- (VenuesManager)venuesManager
{
  venuesManager = self->_venuesManager;
  if (!venuesManager)
  {
    BOOL v4 = [VenuesManager alloc];
    id v5 = [(ActionCoordinator *)self mapView];
    id v6 = [(ActionCoordinator *)self containerViewController];
    id v7 = [v6 chromeViewController];
    id v8 = [v7 userLocationView];
    id v9 = [(VenuesManager *)v4 initWithActionCoordinator:self mapView:v5 userLocationView:v8];
    id v10 = self->_venuesManager;
    self->_venuesManager = v9;

    v11 = self->_venuesManager;
    uint64_t v12 = [(ActionCoordinator *)self searchPinsManager];
    [v12 setVenuesManager:v11];

    v13 = self->_venuesManager;
    id v14 = [(ActionCoordinator *)self searchPinsManager];
    [(VenuesManager *)v13 addChangeObserver:v14];

    venuesManager = self->_venuesManager;
  }

  return venuesManager;
}

- (BOOL)isRoutePlanningPresented
{
  return self->_isRoutePlanningPresented;
}

- (MKMapItem)currentMapItem
{
  v2 = [(ActionCoordinator *)self currentPlaceCardItem];
  id v3 = [v2 mapItem];

  return (MKMapItem *)v3;
}

- (ContaineeProtocol)currentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained currentViewController];

  return (ContaineeProtocol *)v3;
}

- (SearchSession)currentSearchSession
{
  return [(SearchSessionManager *)self->_searchSessionManager currentSearchSession];
}

- (GEOTransitLineItem)currentTransitLineItem
{
  v2 = [(ActionCoordinator *)self currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 lineItem];
  }
  else
  {
    id v3 = 0;
  }

  return (GEOTransitLineItem *)v3;
}

- (SearchPinsManager)searchPinsManager
{
  v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  BOOL v4 = [v3 searchPinsManager];

  return (SearchPinsManager *)v4;
}

- (id)routeAnnotationsProvider
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector()) {
    id v5 = (RoutePlanningMapController *)v4;
  }
  else {
    id v5 = 0;
  }

  routePlanningMapController = v5;
  if (v5) {
    goto LABEL_8;
  }
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    routePlanningMapController = self->_routePlanningMapController;
LABEL_8:
    id v7 = routePlanningMapController;
    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

- (void)_refreshSettingsTip
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  uint64_t v4 = sub_1000BBB44(v3);

  if (v4 != 5)
  {
    id v5 = [(ActionCoordinator *)self containerViewController];
    id v9 = [v5 floatingControlsPresentationController];

    id v6 = [(ActionCoordinator *)self settingsController];
    id v7 = [v6 settingsTipController];

    id v8 = [v7 observers];
    [v8 registerObserver:self];

    if ([v9 settingsTipState])
    {
      if ([v7 impressionState] != (id)1) {
        [v9 setSettingsTipState:0];
      }
    }
    else if ([v7 shouldShowTip])
    {
      [v9 setSettingsTipState:1];
      [v7 settingsTipShown];
    }
  }
}

- (ControlContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ControlContainerViewController *)WeakRetained;
}

- (void)setAppCoordinator:(id)a3
{
}

- (void)removeContainerViewControllerObserver
{
  if (self->_containerViewControllerWillPresentContaineeObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_containerViewControllerWillPresentContaineeObserver];

    id containerViewControllerWillPresentContaineeObserver = self->_containerViewControllerWillPresentContaineeObserver;
    self->_id containerViewControllerWillPresentContaineeObserver = 0;
  }
  if (self->_containerViewControllerDidResignContaineeObserver)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self->_containerViewControllerDidResignContaineeObserver];

    id containerViewControllerDidResignContaineeObserver = self->_containerViewControllerDidResignContaineeObserver;
    self->_id containerViewControllerDidResignContaineeObserver = 0;
  }
}

- (id)mapSelectionStateForVenueCardItem:(id)a3 savePlaceCardSelectionState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___VenueRoutePlanningCardItem]) {
    goto LABEL_2;
  }
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___VenueClusterCardItem]) {
    goto LABEL_4;
  }
  if (![v6 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem])
  {
    if (![v6 conformsToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem])
    {
LABEL_4:
      id v8 = 0;
      goto LABEL_5;
    }
LABEL_2:
    id v7 = [(ActionCoordinator *)self mapSelectionManager];
    id v8 = [v7 selectionStateIncludingCamera:1 includeNotCustomLabelMarkers:0];

    goto LABEL_5;
  }
  routePlanningSelectionRestorationState = self->_routePlanningSelectionRestorationState;
  if (!routePlanningSelectionRestorationState)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_2;
  }
  id v8 = routePlanningSelectionRestorationState;
LABEL_5:

  return v8;
}

- (id)searchInfoForVenueCardItem:(id)a3 previousItemInStack:(id)a4
{
  if ([(ActionCoordinator *)self _canCaptureSearchStateForCardItem:a3 previousItemInStack:a4])
  {
    id v5 = [(ActionCoordinator *)self currentSearchSession];
    id v6 = [v5 currentResultsSearchInfo];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)searchFieldItemForVenueCardItem:(id)a3 previousItemInStack:(id)a4
{
  if ([(ActionCoordinator *)self _canCaptureSearchStateForCardItem:a3 previousItemInStack:a4])
  {
    id v5 = [(ActionCoordinator *)self currentSearchSession];
    id v6 = [v5 searchFieldItem];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_canCaptureSearchStateForCardItem:(id)a3 previousItemInStack:(id)a4
{
  id v6 = a3;
  if ([a4 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem])
  {
    id v7 = [(ActionCoordinator *)self currentSearchSession];
    id v8 = [v7 currentResultsSearchInfo];
    unsigned __int8 v9 = [v8 singleResultMode];

    if (v9) {
      goto LABEL_3;
    }
  }
  if (([v6 conformsToProtocol:&OBJC_PROTOCOL___VenueRoutePlanningCardItem] & 1) != 0
    || ([v6 conformsToProtocol:&OBJC_PROTOCOL___VenueClusterCardItem] & 1) != 0
    || ([v6 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem] & 1) != 0)
  {
    goto LABEL_10;
  }
  v11 = [(ActionCoordinator *)self venueCardCoordinator];
  if (([v11 isCardStackEmpty] & 1) == 0)
  {
    unsigned __int8 v12 = [v6 conformsToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem];

    if ((v12 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    BOOL v10 = 1;
    goto LABEL_11;
  }

LABEL_3:
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)placeCardViewController:(id)a3 placeCardItemWillChange:(id)a4
{
  id v5 = a4;
  id v6 = [v5 mapItem];
  unsigned int v7 = [v6 _hasMUID];

  if (v7)
  {
    id v8 = sub_10065F778();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v9 = [v5 mapItem];
      int v10 = 134217984;
      id v11 = [v9 _muid];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Place Card placeCardItemWillChange to muid %llu.", (uint8_t *)&v10, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([v5 isDroppedPin])
  {
    id v8 = sub_10065F778();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Place Card placeCardItemWillChange to dropped pin.", (uint8_t *)&v10, 2u);
    }
    goto LABEL_7;
  }
LABEL_8:
  [(ActionCoordinator *)self _setHikingFeaturesForPlaceCardItem:v5];
}

- (void)placeCardViewController:(id)a3 mapItemDidChange:(id)a4
{
  id v5 = a4;
  id v6 = sub_10065F778();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    id v12 = [v5 _muid];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Place Card mapItemDidChange to muid %llu.", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = [(ActionCoordinator *)self containerViewController];
  id v8 = [v7 chromeViewController];
  [v8 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

  unsigned __int8 v9 = [(ActionCoordinator *)self containerViewController];
  int v10 = [v9 chromeViewController];
  [v10 updateComponentsIfNeeded];
}

- (void)placeCardViewController:(id)a3 selectMapItem:(id)a4 address:(id)a5
{
}

- (void)placeCardViewController:(id)a3 selectTransitLineItem:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  unsigned int v7 = [(ActionCoordinator *)self containerViewController];
  BOOL v8 = sub_1000BBB44(v7) != 5;

  [(ActionCoordinator *)self viewController:v9 selectTransitLineItem:v6 zoomToMapRegion:v8 preferredLayout:2];
}

- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4
{
}

- (void)placeCardViewController:(id)a3 editLocationOfMarkedLocation:(id)a4
{
}

- (void)placeCardViewController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  id v9 = a4;
  if (sub_1000BBB44(v20) == 5) {
    [(ActionCoordinator *)self viewControllerGoPreviousState:v20 withSender:0];
  }
  int v10 = [v8 window];
  [v8 bounds];
  [v10 convertRect:v8 fromView:];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = +[MKLookAroundEntryPoint entryPointWithMapItem:v9 wantsCloseUpView:1 triggerAction:6060];

  -[ActionCoordinator enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:](self, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v19, v8, 1, v12, v14, v16, v18);
}

- (void)placeCardViewController:(id)a3 displayStoreViewControllerForAppWithiTunesIdentifier:(id)a4
{
}

- (void)placeCardViewController:(id)a3 presentCategoryPlacesListForMapItem:(id)a4 searchCategory:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (objc_msgSend(v9, "_browseCategory_isVenueItem")) {
    [(ActionCoordinator *)self viewController:v10 presentVenueForMapItem:v9 searchCategory:v8 source:4];
  }
  else {
    [(ActionCoordinator *)self viewController:v10 presentPlacesForMapItem:v9 searchCategory:v8 source:4];
  }
}

- (void)placeCardViewController:(id)a3 didUpdateLinkedPlacesFromPlaceCardItem:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self searchPinsManager];
  [v6 showLinkedPlacesAndPolygonForPlaceCardItem:v5];
}

- (void)placeCardViewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ActionCoordinator *)self viewControllerPresentSearchEndEditing];
  [(ActionCoordinator *)self viewController:v10 doSearchItem:v9 withUserInfo:v8];
}

- (void)placeCardViewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  double v14 = [v10 placeCardItem];
  double v15 = [v14 searchResult];
  double v16 = v15;
  if (v15) {
    double v17 = v15;
  }
  else {
    double v17 = [[SearchResult alloc] initWithMapItem:v11];
  }
  double v18 = v17;

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10065FEE8;
  v30[3] = &unk_1012E6690;
  objc_copyWeak(&v32, &location);
  v19 = v18;
  v31 = v19;
  id v20 = objc_retainBlock(v30);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10065FF50;
  v27[3] = &unk_1012F3668;
  id v21 = v12;
  id v28 = v21;
  v29 = v20;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10065FFA0;
  v24[3] = &unk_1012F3690;
  id v22 = v13;
  id v25 = v22;
  v23 = v29;
  id v26 = v23;
  [(ActionCoordinator *)self viewController:v10 editNameOfMapItem:v11 saveHandler:v27 cancelHandler:v24];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void)placeCardViewController:(id)a3 showTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return [(ActionCoordinator *)self viewController:a3 shouldDisplayTransitSchedulesForMapItem:a4 departureSequence:a5];
}

- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
}

- (void)placeCardViewController:(id)a3 presentPOIEnrichmentWithCoordinator:(id)a4
{
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v5 = a4;
  id v7 = [(ActionCoordinator *)self containerViewController];
  id v6 = [v7 chromeViewController];
  [v6 copy:v5];
}

- (void)placeCardViewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldShowDataManagementAfterDownload:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v15 = a3;
  id v12 = [v15 placeCardItem];
  id v13 = [v12 isHomeWorkSchoolAddress];

  LOBYTE(v14) = 1;
  [(ActionCoordinator *)self viewController:v15 showOfflineMapRegionSelectorForRegion:v11 name:v10 route:0 shouldUseSessionlessAnalytics:v13 shouldShowDataManagementAfterDownload:v6 shouldShowDataManagementAfterDownloadIfRegionDiffers:v14 dismissalBlock:0];
}

- (void)placeCardViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 placeMUID:(unint64_t)a6 completion:(id)a7
{
}

- (void)placeCardViewControllerRemovedObservingHandle:(id)a3
{
  BOOL v4 = [(ActionCoordinator *)self containerViewController];
  id v5 = [v4 chromeViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100660210;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  [v5 popToRootContextAnimated:0 completion:v6];
}

- (void)placeCardViewController:(id)a3 willReusePlaceCardItem:(id)a4
{
  id v5 = a4;
  BOOL v6 = sub_10065F778();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Place Card is reusing its Place Card Item, will set hiking features for existing mapItem.", v7, 2u);
  }

  [(ActionCoordinator *)self _setHikingFeaturesForPlaceCardItem:v5];
}

- (void)placeCardViewControllerWillResignCurrent:(id)a3
{
  BOOL v4 = sub_10065F778();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Place Card is resigning current, will deselect trails and disable topographic features if needed.", v6, 2u);
  }

  id v5 = [(ActionCoordinator *)self mapSelectionManager];
  [v5 deselectTrails];

  [(ActionCoordinator *)self _setTopographicalFeaturesForPlaceCardItem:0];
}

- (void)placeCardViewControllerWillBecomeCurrent:(id)a3
{
  id v4 = a3;
  id v5 = sub_10065F778();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Place Card is becoming current, will select trails and enable topographic features if needed.", v7, 2u);
  }

  BOOL v6 = [v4 placeCardItem];

  if (v6) {
    [(ActionCoordinator *)self _setHikingFeaturesForPlaceCardItem:v6];
  }
}

- (void)placeCardViewController:(id)a3 didRequestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v8 = [(ActionCoordinator *)self containerViewController];
  BOOL v6 = [v8 chromeViewController];
  id v7 = [v6 mapView];
  [v7 requestHikingToolTipRegionIDForLocation:latitude longitude:longitude];
}

- (void)placeCardViewControllerDidTapHikingTip:(id)a3
{
  id v4 = a3;
  id v6 = [(ActionCoordinator *)self appCoordinator];
  id v5 = [v4 mapItem];

  [v6 enterRouteCreationWithRoute:0 originMapItem:v5 destinationMapItem:0 userInfo:0 completion:0];
}

- (void)placeCardViewController:(id)a3 didUpdateForViewMode:(int64_t)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 isActive];
  id v7 = sub_10065F778();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "View mode has changed, so hiking features need to be recalculated.", buf, 2u);
    }

    id v7 = [v5 placeCardItem];
    if (v7) {
      [(ActionCoordinator *)self _setHikingFeaturesForPlaceCardItem:v7];
    }
  }
  else if (v8)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "View mode has changed but place card is inactive, no work to do.", v9, 2u);
  }
}

- (id)_hikingToken
{
  return objc_getAssociatedObject(self, "_hikingToken");
}

- (void)_setHikingToken:(id)a3
{
}

- (void)_setHikingFeaturesForPlaceCardItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mapItem];
  unsigned int v6 = [v5 _mapsui_trailSelectionInfoForMap];

  id v7 = sub_10065F778();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v14 = 134217984;
      id v15 = [v6 trailID];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Trail selection info found, selecting trail with ID %llu.", (uint8_t *)&v14, 0xCu);
    }

    id v9 = [(ActionCoordinator *)self mapSelectionManager];
    id v10 = [v6 trailID];
    id v11 = [v6 trailName];
    id v12 = +[NSLocale currentLocale];
    id v13 = [v12 localeIdentifier];
    [v9 selectTrailWithId:v10 name:v11 locale:v13];
  }
  else
  {
    if (v8)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No trail selection info found, deselecting all trails.", (uint8_t *)&v14, 2u);
    }

    id v9 = [(ActionCoordinator *)self mapSelectionManager];
    [v9 deselectTrails];
  }

  [(ActionCoordinator *)self _setTopographicalFeaturesForPlaceCardItem:v4];
}

- (void)_setTopographicalFeaturesForPlaceCardItem:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self containerViewController];
  unsigned int v6 = [v5 chromeViewController];

  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v7 = sub_10065F778();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Route planning is currently presented, will not toggle topographic lines.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_29;
  }
  BOOL v8 = [v4 mapItem];

  if (!v8)
  {
    id v9 = sub_10065F778();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PlaceCard is changing to a nil mapItem. Disabling topographic features.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_9;
  }
  if ([(ActionCoordinator *)self displayedViewMode])
  {
    id v9 = sub_10065F778();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "View mode is not Explore, so disabling topographic features.", (uint8_t *)&buf, 2u);
    }
LABEL_9:

    [(ActionCoordinator *)self _setHikingToken:0];
    goto LABEL_29;
  }
  id v10 = [v4 mapItem];
  id v11 = [v10 _geoMapItem];
  id v12 = [v11 _placeData];

  if ([v12 hasMapDisplayType])
  {
    unsigned int v13 = [v12 mapDisplayType];
    int v14 = sub_10065F778();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v13 == 1;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PlaceCard mapItem has a mapDisplayType, toggling topographic features to %d.", (uint8_t *)&buf, 8u);
    }

    if (v13 == 1)
    {
      id v15 = [(ActionCoordinator *)self _hikingToken];
      BOOL v16 = v15 == 0;

      if (v16)
      {
        double v17 = [v6 acquireHikingMapToken];
        [(ActionCoordinator *)self _setHikingToken:v17];
      }
    }
    else
    {
      [(ActionCoordinator *)self _setHikingToken:0];
    }
  }
  else if (([v4 isDroppedPin] & 1) != 0 {
         || [v10 _isMapItemTypeAddress])
  }
  {
    double v18 = sub_10065F778();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "PlaceCard mapItem is a dropped pin, checking if it is inside of a hiking region.", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    [v10 _coordinate];
    double v20 = v19;
    double v22 = v21;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100660C40;
    v24[3] = &unk_1012F36B8;
    objc_copyWeak(&v26, &buf);
    id v25 = v6;
    [v25 checkIfCoordinate:v24 isInHikingContextualRegionWithCompletionHandler:v20, v22];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&buf);
  }
  else
  {
    v23 = sub_10065F778();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "PlaceCard mapItem lacks a mapDisplayType, will not toggle.", (uint8_t *)&buf, 2u);
    }
  }
LABEL_29:
}

- (void)dealloc
{
  id v3 = sub_10010A144();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 134349056;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(SearchSessionManager *)self->_searchSessionManager removeObserver:self];
  [(ActionCoordinator *)self removeContainerViewControllerObserver];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ActionCoordinator;
  [(ActionCoordinator *)&v5 dealloc];
}

- (void)clearMapSelection
{
  id v2 = [(ActionCoordinator *)self mapSelectionManager];
  [v2 clearSelection];
}

- (void)clearSearch
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 floatingControlsPresentationController];
  [v4 setSearchSession:0];

  [(SearchSessionManager *)self->_searchSessionManager clearSearchSession];
  objc_super v5 = [(ActionCoordinator *)self searchPinsManager];
  [v5 clearSearchPins];

  unsigned int v6 = [(ActionCoordinator *)self searchModeViewController];
  [v6 cleanSearch];

  id v7 = +[MapsOfflineUIHelper sharedHelper];
  LODWORD(v4) = [v7 isUsingOfflineMaps];

  if (v4)
  {
    id v8 = [(ActionCoordinator *)self searchModeViewController];
    [v8 resetOfflineTextSearchSupport];
  }
}

- (void)clearSearchIfOriginatedFromWaypointEditor
{
  id v3 = [(ActionCoordinator *)self searchSessionManager];
  id v4 = [v3 currentSearchSession];
  unsigned int v5 = [v4 isAddStopFromWaypointEditor];

  if (v5)
  {
    [(ActionCoordinator *)self clearSearch];
  }
}

- (void)clearSearchPins
{
  id v2 = [(ActionCoordinator *)self searchPinsManager];
  [v2 clearSearchPins];
}

- (void)endSearch
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  [v2 endSearch];
}

- (void)endSearchForTesting
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  [v2 endSearchForTesting];
}

- (void)presentSearchAndRestoreSearchItem:(id)a3
{
  id v4 = a3;
  [(ActionCoordinator *)self clearSearch];
  [(ActionCoordinator *)self presentSearch];
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 restoreSearchItem:v4];
}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4
{
}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4 sessionOrigin:(unint64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  if (([v8 isSearchAlongRoute] & 1) == 0) {
    [(SearchSessionManager *)self->_searchSessionManager restoreSearchForItem:v9 withResults:v8 sessionOrigin:a5];
  }
}

- (void)setCurrentDirectionItem:(id)a3 withOptions:(id)a4
{
  id v9 = (DirectionItem *)a3;
  id v7 = a4;
  if (self->_currentDirectionItem != v9)
  {
    objc_storeStrong((id *)&self->_currentDirectionItem, a3);
    if ([self->_currentDirectionItem isVenueItem])
    {
      id v8 = [(ActionCoordinator *)self venueCardCoordinator];
      [v8 pushVenueCardItem:self->_currentDirectionItem source:4];
    }
    [(ActionCoordinator *)self viewController:0 doDirectionItem:self->_currentDirectionItem withUserInfo:v7];
  }
}

- (void)setCurrentTransitLineItem:(id)a3
{
}

- (void)setCurrentTransitLineItem:(id)a3 zoomToMapRegion:(BOOL)a4
{
}

- (void)setCurrentTransitLineItem:(id)a3 zoomToMapRegion:(BOOL)a4 preferredLayout:(unint64_t)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = [(ActionCoordinator *)self currentTransitLineItem];

  id v9 = v10;
  if (v8 != v10)
  {
    [(ActionCoordinator *)self viewController:0 selectTransitLineItem:v10 zoomToMapRegion:v6 preferredLayout:a5];
    id v9 = v10;
  }
}

- (PlaceCardItem)currentPlaceCardItem
{
  id v2 = [(ActionCoordinator *)self currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 placeCardItem];
  }
  else
  {
    id v3 = 0;
  }

  return (PlaceCardItem *)v3;
}

- (MKLookAroundView)currentLookAroundView
{
  id v2 = [(ActionCoordinator *)self currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 lookAroundView];
  }
  else
  {
    id v3 = 0;
  }

  return (MKLookAroundView *)v3;
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(ActionCoordinator *)self containerViewController];
  BOOL v6 = [v5 chromeViewController];
  id v7 = [v6 errorString];

  id v8 = +[UIDevice currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  if (v7)
  {
    v4[2](v4, v7);
    goto LABEL_23;
  }
  id v10 = [(ActionCoordinator *)self currentMapItem];

  if (v10 && v9 != (id)5)
  {
    id v11 = [(ActionCoordinator *)self currentMapItem];
    uint64_t v12 = [v11 name];
    goto LABEL_6;
  }
  if ([(ActionCoordinator *)self isRoutePlanningPresented] && v9 != (id)5)
  {
    int v14 = [self->_currentDirectionItem endMapItem];
    id v15 = [v14 name];

    if (v15)
    {
      id v11 = +[NSBundle mainBundle];
      BOOL v16 = [v11 localizedStringForKey:@"[App switcher title] Directions to <destination>" value:@"localized string not found" table:0];
      double v17 = [self->_currentDirectionItem endMapItem];
      double v18 = [v17 name];
      unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v18);

LABEL_11:
      if (v13)
      {
        v4[2](v4, v13);

        goto LABEL_23;
      }
      goto LABEL_13;
    }
    id v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"[App switcher title] Directions" value:@"localized string not found" table:0];
LABEL_6:
    unsigned int v13 = (void *)v12;
    goto LABEL_11;
  }
LABEL_13:
  double v19 = +[UIDevice currentDevice];
  if ([v19 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    double v20 = +[UIDevice currentDevice];
    id v21 = [v20 userInterfaceIdiom];

    if (v21 != (id)5) {
      goto LABEL_23;
    }
  }
  id v22 = [(ActionCoordinator *)self currentSearchSession];

  if (v22)
  {
    v23 = [(ActionCoordinator *)self currentSearchSession];
    v24 = [v23 searchInfo];
    id v25 = [v24 headerDisplayName];
    id v26 = v25;
    if (v25)
    {
      id v22 = v25;
    }
    else
    {
      v27 = [(ActionCoordinator *)self currentSearchSession];
      id v28 = [v27 searchFieldItem];
      id v22 = [v28 title];
    }
  }
  v29 = [(ActionCoordinator *)self mapView];
  [v29 centerCoordinate];
  double v31 = v30;
  double v33 = v32;

  v34 = [(ActionCoordinator *)self mapView];
  [v34 visibleMapRect];
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;

  id v43 = objc_alloc_init((Class)CLGeocoder);
  id v44 = [objc_alloc((Class)CLLocation) initWithLatitude:v31 longitude:v33];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1006DD040;
  v46[3] = &unk_1012F5558;
  id v47 = v22;
  v48 = v4;
  uint64_t v49 = v36;
  uint64_t v50 = v38;
  uint64_t v51 = v40;
  uint64_t v52 = v42;
  id v45 = v22;
  [v43 reverseGeocodeLocation:v44 completionHandler:v46];

LABEL_23:
}

- (UserLocationSearchResult)userLocationSearchResult
{
  id v2 = [(ActionCoordinator *)self mapView];
  id v3 = [v2 userLocation];

  id v4 = [v3 annotation];

  return (UserLocationSearchResult *)v4;
}

- (RouteAnnotationsController)routeAnnotationsController
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 routeAnnotationsController];

  return (RouteAnnotationsController *)v4;
}

- (RoutePlanningOverviewViewController)routePlanningOverviewViewController
{
  routePlanningOverviewViewController = self->_routePlanningOverviewViewController;
  if (!routePlanningOverviewViewController)
  {
    id v4 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v5 = +[RoutePlanningOverviewViewController routePlanningOverviewViewControllerWithDataCoordinator:v4];
    BOOL v6 = self->_routePlanningOverviewViewController;
    self->_routePlanningOverviewViewController = v5;

    [(ControlContaineeViewController *)self->_routePlanningOverviewViewController setDelegate:self];
    [(RoutePlanningOverviewViewController *)self->_routePlanningOverviewViewController loadViewIfNeeded];
    routePlanningOverviewViewController = self->_routePlanningOverviewViewController;
  }

  return routePlanningOverviewViewController;
}

- (RoutePlanningOverviewViewController)routePlanningOverviewViewControllerIfLoaded
{
  return self->_routePlanningOverviewViewController;
}

- (void)_dismissMacToolTipIfNeeded
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  uint64_t v4 = sub_1000BBB44(v3);

  if (v4 == 5)
  {
    profileTipVC = self->_profileTipVC;
    if (profileTipVC)
    {
      id v6 = [(MacUserProfileTipViewController *)profileTipVC presentingViewController];
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)viewControllerPresentUserProfile:(id)a3
{
  uint64_t v4 = [UserProfileContaineeViewController alloc];
  id v5 = +[GEOUserAccountInfo primaryICloudAccount];
  id v6 = [(UserProfileContaineeViewController *)v4 initWithAccount:v5 delegate:self];
  userProfileVC = self->_userProfileVC;
  self->_userProfileVC = v6;

  [(ContaineeViewController *)self->_userProfileVC setContaineeDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:self->_userProfileVC animated:1 completion:&stru_1012F5578];
}

- (void)presentMacToolTipForLinkType:(int64_t)a3
{
  [(ActionCoordinator *)self _dismissMacToolTipIfNeeded];
  id v5 = [[MacUserProfileTipViewController alloc] initWithUserProfileLinkType:a3];
  profileTipVC = self->_profileTipVC;
  self->_profileTipVC = v5;

  id v7 = [(ActionCoordinator *)self searchModeViewController];
  id v23 = [v7 sourceViewForProfileTipPopoverWithViewController:self->_profileTipVC];

  if (v23)
  {
    unsigned int v8 = [v23 _mapsui_isRTL];
    [(MacUserProfileTipViewController *)self->_profileTipVC setModalPresentationStyle:7];
    if (v8) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = 4;
    }
    id v10 = [(MacUserProfileTipViewController *)self->_profileTipVC popoverPresentationController];
    [v10 setPermittedArrowDirections:v9];

    id v11 = [(MacUserProfileTipViewController *)self->_profileTipVC popoverPresentationController];
    [v11 setDelegate:self];

    uint64_t v12 = [(MacUserProfileTipViewController *)self->_profileTipVC popoverPresentationController];
    [v12 setSourceView:v23];

    [v23 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    id v21 = [(MacUserProfileTipViewController *)self->_profileTipVC popoverPresentationController];
    [v21 setSourceRect:v14, v16, v18, v20];

    id v22 = [(ActionCoordinator *)self containerViewController];
    [v22 _maps_topMostPresentViewController:self->_profileTipVC animated:1 completion:0];
  }
}

- (void)viewControllerPresentUserProfilePreferences:(id)a3 withTabType:(int64_t)a4
{
  [(ActionCoordinator *)self _dismissMacToolTipIfNeeded];
  id v6 = [(ActionCoordinator *)self containerViewController];
  uint64_t v7 = sub_1000BBB44(v6);

  if (v7 == 5)
  {
    id WeakRetained = +[UIApplication sharedMapsDelegate];
    [WeakRetained presentMacPreferencesTabWithType:a4];
  }
  else
  {
    unsigned int v8 = [[TravelPreferencesViewController alloc] initWithCompletionHandler:&stru_1012F55D8];
    travelPreferencesVC = self->_travelPreferencesVC;
    self->_travelPreferencesVC = v8;

    [(ContaineeViewController *)self->_travelPreferencesVC setContaineeDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:self->_travelPreferencesVC animated:1];
  }
}

- (void)viewControllerPresentRatingsHistory:(id)a3
{
  [(ActionCoordinator *)self _dismissMacToolTipIfNeeded];
  uint64_t v4 = [[RatingsHistoryViewController alloc] initWithNibName:0 bundle:0];
  ratingsHistoryVC = self->_ratingsHistoryVC;
  self->_ratingsHistoryVC = v4;

  [(ContaineeViewController *)self->_ratingsHistoryVC setContaineeDelegate:self];
  [(ControlContaineeViewController *)self->_ratingsHistoryVC setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:self->_ratingsHistoryVC animated:1];
}

- (void)viewControllerPresentVirtualGarage:(id)a3
{
  [(ActionCoordinator *)self _dismissMacToolTipIfNeeded];
  uint64_t v4 = objc_alloc_init(VehicleListViewController);
  vehicleListVC = self->_vehicleListVC;
  self->_vehicleListVC = v4;

  [(ContaineeViewController *)self->_vehicleListVC setContaineeDelegate:self];
  [(ControlContaineeViewController *)self->_vehicleListVC setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:self->_vehicleListVC animated:1];
}

- (void)presentRouteLibraryWithAvailableRoutes:(id)a3 unavailableRoutes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [MapsRouteListViewController alloc];
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = &__NSArray0__struct;
  }
  id v11 = [(MapsRouteListViewController *)v8 initWithAvailableRoutes:v9 unavailableRoutes:v6 isAllSavedRoutes:1];

  [(ContaineeViewController *)v11 setContaineeDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v11 animated:1];
}

- (SimpleResultsViewController)simpleListResultsVC
{
  simpleListResultsVC = self->_simpleListResultsVC;
  if (!simpleListResultsVC)
  {
    uint64_t v4 = [SimpleResultsViewController alloc];
    id v5 = [(ActionCoordinator *)self appCoordinator];
    id v6 = [(SimpleResultsViewController *)v4 initWithShareDelegate:v5];
    id v7 = self->_simpleListResultsVC;
    self->_simpleListResultsVC = v6;

    [(SimpleResultsViewController *)self->_simpleListResultsVC setResultsDelegate:self];
    [(SimpleResultsViewController *)self->_simpleListResultsVC setCoordinator:self];
    [(ContaineeViewController *)self->_simpleListResultsVC setContaineeDelegate:self];
    [(SimpleResultsViewController *)self->_simpleListResultsVC setEnableQuickActionMenu:1];
    [(ContaineeViewController *)self->_simpleListResultsVC setPreferredPresentationStyle:3];
    id v8 = [(SimpleResultsViewController *)self->_simpleListResultsVC view];
    simpleListResultsVC = self->_simpleListResultsVC;
  }

  return simpleListResultsVC;
}

- (BOOL)_shouldPresentAddStopSearchResults
{
  unsigned __int8 v4 = [(ActionCoordinator *)self isRoutePlanningPresented];
  if ((v4 & 1) != 0
    || ([(RouteSearchViewController *)self->_routeSearchVC presentingViewController],
        (id v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [self->_currentDirectionItem items];
    BOOL v6 = [v5 count] != 0;

    if (v4) {
      return v6;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isPresentingAddStopSearchResults
{
  id v3 = [(ActionCoordinator *)self mapView];
  if (sub_1000BBB44(v3) == 5 && [(ActionCoordinator *)self isRoutePlanningPresented])
  {
    unsigned __int8 v4 = [(ActionCoordinator *)self currentSearchSession];

    if (v4) {
      return 1;
    }
  }
  else
  {
  }
  BOOL v6 = [self->_addStopResultsViewController presentingViewController];
  if (v6)
  {
    id v7 = [self->_currentDirectionItem items];
    BOOL v5 = [v7 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)resultsViewController
{
  id v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    BOOL v5 = [(ActionCoordinator *)self searchModeViewController];
  }
  else
  {
    if ([(ActionCoordinator *)self _shouldPresentAddStopSearchResults])
    {
      addStopResultsViewController = self->_addStopResultsViewController;
      if (!addStopResultsViewController)
      {
        id v7 = objc_alloc_init(ResultsViewController);
        id v8 = self->_addStopResultsViewController;
        self->_addStopResultsViewController = v7;

        [(ControlContaineeViewController *)self->_addStopResultsViewController setDelegate:self];
        [(ContaineeViewController *)self->_addStopResultsViewController setContaineeDelegate:self];
        [self->_addStopResultsViewController setIsPresentingAddStopResultsFromWaypointEditor:1];
        addStopResultsViewController = self->_addStopResultsViewController;
      }
    }
    else
    {
      addStopResultsViewController = self->_resultsViewController;
      if (!addStopResultsViewController)
      {
        uint64_t v9 = objc_alloc_init(ResultsViewController);
        resultsViewController = self->_resultsViewController;
        self->_resultsViewController = v9;

        [(ControlContaineeViewController *)self->_resultsViewController setDelegate:self];
        [(ContaineeViewController *)self->_resultsViewController setContaineeDelegate:self];
        addStopResultsViewController = self->_resultsViewController;
      }
    }
    BOOL v5 = addStopResultsViewController;
  }

  return v5;
}

- (SearchViewController)searchViewControllerIfLoaded
{
  return self->_searchModeViewController;
}

- (id)settingsViewController
{
  id v3 = objc_alloc_init(SettingsViewController);
  [(ActionCoordinator *)self mapView];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_1006DDE7C;
  double v13 = &unk_1012E5D58;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  double v15 = self;
  id v4 = v14;
  [(SettingsViewController *)v3 setDismissSettingsViewControllerHandler:&v10];
  self = (ActionCoordinator *)((char *)self + 456);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  BOOL v6 = [WeakRetained chromeViewController:v10, v11, v12, v13];
  id v7 = [v6 settingsController];
  [(SettingsViewController *)v3 setSettingsController:v7];

  [(SettingsViewController *)v3 setModalPresentationStyle:4];
  id v8 = objc_loadWeakRetained((id *)&self->super.isa);
  [(SettingsViewController *)v3 setTransitioningDelegate:v8];

  return v3;
}

- (id)placeCardForRoutePlanningViewController
{
  placeCardForRoutePlanningViewController = self->_placeCardForRoutePlanningViewController;
  if (!placeCardForRoutePlanningViewController)
  {
    id v4 = objc_alloc_init(PlaceCardViewController);
    BOOL v5 = self->_placeCardForRoutePlanningViewController;
    self->_placeCardForRoutePlanningViewController = v4;

    [(PlaceCardViewController *)self->_placeCardForRoutePlanningViewController setExcludedContent:22];
    [(PlaceCardViewController *)self->_placeCardForRoutePlanningViewController setPlaceCardDelegate:self];
    [(InfoCardViewController *)self->_placeCardForRoutePlanningViewController setContaineeDelegate:self];
    placeCardForRoutePlanningViewController = self->_placeCardForRoutePlanningViewController;
  }

  return placeCardForRoutePlanningViewController;
}

- (id)placeCardForVenuesViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ActionCoordinator *)self venueCardCoordinator];
  BOOL v6 = [v5 viewControllerForCardItem:v4];

  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  [v9 setPlaceCardDelegate:self];
  [v9 setContaineeDelegate:self];

  return v9;
}

- (PlaceCardViewController)placeCardViewController
{
  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    id v4 = [(ActionCoordinator *)self _newPlaceCardViewControllerForReuse];
    BOOL v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    placeCardViewController = self->_placeCardViewController;
  }

  return placeCardViewController;
}

- (id)_newPlaceCardViewControllerForReuse
{
  id v3 = objc_alloc_init(PlaceCardViewController);
  [(PlaceCardViewController *)v3 setPlaceCardDelegate:self];
  [(InfoCardViewController *)v3 setContaineeDelegate:self];
  [(PlaceCardViewController *)v3 setPlaceCardDismissalDelegate:self];
  return v3;
}

- (PlaceCardViewController)placeCardViewControllerIfLoaded
{
  return self->_placeCardViewController;
}

- (LineCardViewController)lineCardVC
{
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    p_lineCardForRoutePlanningViewController = (id *)&self->_lineCardForRoutePlanningViewController;
    lineCardForRoutePlanningViewController = self->_lineCardForRoutePlanningViewController;
    if (lineCardForRoutePlanningViewController) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  p_lineCardForRoutePlanningViewController = (id *)&self->_lineCardViewController;
  lineCardForRoutePlanningViewController = self->_lineCardViewController;
  if (!lineCardForRoutePlanningViewController)
  {
LABEL_3:
    BOOL v5 = objc_alloc_init(LineCardViewController);
    id v6 = *p_lineCardForRoutePlanningViewController;
    id *p_lineCardForRoutePlanningViewController = v5;

    [*p_lineCardForRoutePlanningViewController setContaineeDelegate:self];
    [*p_lineCardForRoutePlanningViewController setLineCardDelegate:self];
    [*p_lineCardForRoutePlanningViewController setPreferredPresentationStyle:3];
    lineCardForRoutePlanningViewController = (LineCardViewController *)*p_lineCardForRoutePlanningViewController;
  }
LABEL_4:

  return lineCardForRoutePlanningViewController;
}

- (MapSelectionManager)mapSelectionManager
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 mapSelectionManager];

  return (MapSelectionManager *)v4;
}

- (MapCameraFraming)mapCameraController
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 mapCameraController];

  return (MapCameraFraming *)v4;
}

- (RoutePlanningDataCoordinator)routePlanningDataCoordinator
{
  return self->_routePlanningDataCoordinator;
}

- (id)routePlanningMapController
{
  routePlanningMapController = self->_routePlanningMapController;
  if (!routePlanningMapController)
  {
    id v4 = [RoutePlanningMapController alloc];
    BOOL v5 = [(ActionCoordinator *)self containerViewController];
    id v6 = [v5 chromeViewController];
    id v7 = [(RoutePlanningMapController *)v4 initWithChromeViewController:v6];
    id v8 = self->_routePlanningMapController;
    self->_routePlanningMapController = v7;

    [(RoutePlanningMapController *)self->_routePlanningMapController setActionCoordinator:self];
    id v9 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    [(RoutePlanningMapController *)self->_routePlanningMapController setDataCoordinator:v9];

    id v10 = [(ActionCoordinator *)self personalizedItemManager];
    [(RoutePlanningMapController *)self->_routePlanningMapController setPersonalizedItemManager:v10];

    routePlanningMapController = self->_routePlanningMapController;
  }

  return routePlanningMapController;
}

- (id)routeSearchVC
{
  routeSearchVC = self->_routeSearchVC;
  if (!routeSearchVC
    || ([(RouteSearchViewController *)routeSearchVC dataCoordinator],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    BOOL v5 = [(ActionCoordinator *)self routePlanningOverviewViewController];
    id v6 = [v5 routeSearchViewController];

    if (v6)
    {
      id v7 = [(ActionCoordinator *)self routePlanningOverviewViewController];
      id v8 = [v7 routeSearchViewController];
    }
    else
    {
      id v9 = [RouteSearchViewController alloc];
      id v7 = [(ActionCoordinator *)self routePlanningDataCoordinator];
      id v8 = [(RouteSearchViewController *)v9 initWithDelegate:self dataCoordinator:v7];
    }
    id v10 = self->_routeSearchVC;
    self->_routeSearchVC = v8;
  }
  uint64_t v11 = self->_routeSearchVC;

  return v11;
}

- (id)routeStepsVC
{
  routeStepsVC = self->_routeStepsVC;
  if (!routeStepsVC)
  {
    id v4 = [[RouteStepsViewController alloc] initWithNibName:0 bundle:0];
    BOOL v5 = self->_routeStepsVC;
    self->_routeStepsVC = v4;

    [(ContaineeViewController *)self->_routeStepsVC setContaineeDelegate:self];
    [(RouteStepsViewController *)self->_routeStepsVC setDelegate:self];
    id v6 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    [(RouteStepsViewController *)self->_routeStepsVC setDataCoordinator:v6];

    routeStepsVC = self->_routeStepsVC;
  }

  return routeStepsVC;
}

- (id)timePickingVC
{
  id v3 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  id v4 = [v3 routeCollection];
  BOOL v5 = [v4 currentRoute];

  id v6 = [RoutePlanningTimingViewController alloc];
  id v7 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  id v8 = [v7 timing];
  if (v5) {
    id v9 = [v5 shouldShowSchedule];
  }
  else {
    id v9 = 0;
  }
  id v10 = [(RoutePlanningTimingViewController *)v6 initWithCurrentTiming:v8 shouldShowArriveBy:v9 pickerDelegate:self];

  return v10;
}

- (id)routeOptionsVC
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  uint64_t v4 = sub_1000BBB44(v3);

  if (v4 == 5) {
    uint64_t BOOL = GEOConfigGetBOOL();
  }
  else {
    uint64_t BOOL = 0;
  }
  id v6 = [RoutePlanningOptionsViewController alloc];
  id v7 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1006DE7A4;
  v25[3] = &unk_1012F5600;
  v25[4] = self;
  id v8 = [(RoutePlanningOptionsViewController *)v6 initWithDataCoordinator:v7 automaticallySaveChanges:BOOL completionHandler:v25];

  id v9 = [(RoutePlanningOptionsViewController *)v8 traitCollection];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 == (id)5)
  {
    uint64_t v11 = [(ActionCoordinator *)self routePlanningOverviewViewController];
    uint64_t v12 = [v11 routeOptionsPopoverSourceView];

    [(RoutePlanningOptionsViewController *)v8 setModalPresentationStyle:7];
    double v13 = [(RoutePlanningOptionsViewController *)v8 popoverPresentationController];
    [v13 setSourceView:v12];

    [v12 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    id v22 = [(RoutePlanningOptionsViewController *)v8 popoverPresentationController];
    [v22 setSourceRect:v15, v17, v19, v21];

    id v23 = [(RoutePlanningOptionsViewController *)v8 popoverPresentationController];
    [v23 setPermittedArrowDirections:12];
  }

  return v8;
}

- (id)incidentsVC
{
  if (!self->_incidentsVC)
  {
    id v3 = [RouteIncidentsViewController alloc];
    uint64_t v4 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    BOOL v5 = [(RouteIncidentsViewController *)v3 initWithDataCoordination:v4];
    incidentsVC = self->_incidentsVC;
    self->_incidentsVC = v5;

    [(ContaineeViewController *)self->_incidentsVC setContaineeDelegate:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v8 = [WeakRetained traitCollection];
  id v9 = [v8 userInterfaceIdiom];

  if (v9 == (id)5)
  {
    [(RouteIncidentsViewController *)self->_incidentsVC setModalPresentationStyle:7];
    id v10 = objc_loadWeakRetained((id *)&self->_incidentsVCSourceView);
    uint64_t v11 = [(RouteIncidentsViewController *)self->_incidentsVC popoverPresentationController];
    [v11 setSourceView:v10];

    id v12 = objc_loadWeakRetained((id *)&self->_incidentsVCSourceView);
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(RouteIncidentsViewController *)self->_incidentsVC popoverPresentationController];
    [v21 setSourceRect:v14, v16, v18, v20];

    id v22 = [(RouteIncidentsViewController *)self->_incidentsVC popoverPresentationController];
    [v22 setPermittedArrowDirections:12];
  }
  id v23 = self->_incidentsVC;

  return v23;
}

- (id)routingAppsVC
{
  id v3 = [RoutePlanningRoutingAppsController alloc];
  uint64_t v4 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  BOOL v5 = [(RoutePlanningRoutingAppsController *)v3 initWithDataCoordination:v4];

  [(ContaineeViewController *)v5 setContaineeDelegate:self];

  return v5;
}

- (TrafficIncidentContaineeViewController)trafficIncidentVC
{
  trafficIncidentViewController = self->_trafficIncidentViewController;
  if (!trafficIncidentViewController)
  {
    uint64_t v4 = objc_alloc_init(TrafficIncidentContaineeViewController);
    BOOL v5 = self->_trafficIncidentViewController;
    self->_trafficIncidentViewController = v4;

    [(ContaineeViewController *)self->_trafficIncidentViewController setContaineeDelegate:self];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1006DEAA0;
    v7[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    [(TrafficIncidentContaineeViewController *)self->_trafficIncidentViewController setDismissHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    trafficIncidentViewController = self->_trafficIncidentViewController;
  }

  return trafficIncidentViewController;
}

- (RouteAnnotationContaineeViewController)routeAnnotationVC
{
  routeAnnotationVC = self->_routeAnnotationVC;
  if (!routeAnnotationVC)
  {
    uint64_t v4 = objc_alloc_init(RouteAnnotationContaineeViewController);
    BOOL v5 = self->_routeAnnotationVC;
    self->_routeAnnotationVC = v4;

    [(ContaineeViewController *)self->_routeAnnotationVC setContaineeDelegate:self];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1006DEC0C;
    v7[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    [(RouteAnnotationContaineeViewController *)self->_routeAnnotationVC setDismissHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    routeAnnotationVC = self->_routeAnnotationVC;
  }

  return routeAnnotationVC;
}

- (id)autosharingVC
{
  autosharingVC = self->_autosharingVC;
  if (!autosharingVC)
  {
    uint64_t v4 = [[SharedTripAutosharingContaineeViewController alloc] initWithContacts:&__NSArray0__struct];
    BOOL v5 = self->_autosharingVC;
    self->_autosharingVC = v4;

    [(SharedTripAutosharingContaineeViewController *)self->_autosharingVC setDelegate:self];
    autosharingVC = self->_autosharingVC;
  }

  return autosharingVC;
}

- (VenueCardCoordinator)venueCardCoordinator
{
  venueCardCoordinator = self->_venueCardCoordinator;
  if (!venueCardCoordinator)
  {
    uint64_t v4 = [VenueCardCoordinator alloc];
    BOOL v5 = [(ActionCoordinator *)self venuesManager];
    id v6 = [(VenueCardCoordinator *)v4 initWithActionCoordinator:self venueChangeNotifier:v5];
    id v7 = self->_venueCardCoordinator;
    self->_venueCardCoordinator = v6;

    [(VenueCardCoordinator *)self->_venueCardCoordinator setDataSource:self];
    venueCardCoordinator = self->_venueCardCoordinator;
  }

  return venueCardCoordinator;
}

- (SearchSessionManager)searchSessionManager
{
  return self->_searchSessionManager;
}

- (void)setIsRoutePlanningPresented:(BOOL)a3
{
  if (self->_isRoutePlanningPresented != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL isRoutePlanningPresented = self->_isRoutePlanningPresented;
      v8[0] = 67109376;
      v8[1] = isRoutePlanningPresented;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing isRoutePlanningPresented from %d to %d", (uint8_t *)v8, 0xEu);
    }

    self->_BOOL isRoutePlanningPresented = v3;
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"RoutePlanningPresentedDidChangeNotification" object:self];
  }
}

- (double)isTouristHere
{
  [(SearchViewController *)self->_searchModeViewController isTouristHereValue];
  return result;
}

- (void)presentSimpleList:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [(ActionCoordinator *)self containerViewController];
  id v5 = [v4 currentViewController];

  if (v5 == v17)
  {
    uint64_t v11 = [(ActionCoordinator *)self containerViewController];
    id v12 = [v11 containeeLayout];

    if (v12 != (id)1) {
      goto LABEL_10;
    }
    double v13 = [v17 cardPresentationController];
    [v13 wantsLayout:2];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v7 = [WeakRetained currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
    BOOL v10 = v9;
    if (isKindOfClass)
    {
      [v9 replaceCurrentWithController:v17 moveToContaineeLayout:2];

      [(PlaceCardViewController *)self->_placeCardViewController resetState];
      goto LABEL_10;
    }
    double v14 = [v9 currentViewController];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    id v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
    double v13 = v16;
    if (v15) {
      [v16 replaceCurrentWithController:v17 moveToContaineeLayout:2];
    }
    else {
      [v16 presentController:v17];
    }
  }

LABEL_10:
  [(ActionCoordinator *)self ensureMapSelectionVisible];
}

- (void)presentPlaceCard:(id)a3
{
}

- (void)presentPlaceCard:(id)a3 canReplaceCurrentIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (PlaceCardViewController *)a3;
  id v7 = [(ActionCoordinator *)self containerViewController];
  id v8 = [v7 currentViewController];

  id v9 = [(ContaineeViewController *)v6 cardPresentationController];
  [v9 setHidden:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_placeCardViewController)
  {
    BOOL v10 = [(ActionCoordinator *)self containerViewController];
    [v10 removeControllerFromStack:self->_placeCardViewController];
  }
  [(ActionCoordinator *)self ensureMapSelectionVisible];
  uint64_t v11 = [(ActionCoordinator *)self containerViewController];
  id v12 = [v11 chromeViewController];
  [v12 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController || v8 != placeCardViewController)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (sub_1000BBB44(v6) != 5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id WeakRetained = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
          [(PlaceCardViewController *)WeakRetained replaceCurrentWithController:v6];
          goto LABEL_38;
        }
      }
      if (!v4) {
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([(ActionCoordinator *)self currentSearchSession],
            id v17 = objc_claimAutoreleasedReturnValue(),
            unsigned int v18 = [v17 singleResultMode],
            v17,
            !v18))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([(ActionCoordinator *)self currentSearchSession],
              double v19 = objc_claimAutoreleasedReturnValue(),
              unsigned int v20 = [v19 isSingleResultToShowAsPlacecard],
              v19,
              !v20))
        {
LABEL_50:
          double v21 = [(PlaceCardViewController *)v6 placeCardItem];
          if ([v21 isVenueItem])
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              [(ActionCoordinator *)self presentSearchAnimated:0];
            }
          }
          else
          {
          }
          if (!v4 || !v8 || sub_1000BBB44(v8) == 5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            id WeakRetained = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
            [(PlaceCardViewController *)WeakRetained presentController:v6];
            goto LABEL_38;
          }
        }
      }
      double v14 = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
      id WeakRetained = v14;
      goto LABEL_7;
    }
    id WeakRetained = v8;
    id v16 = [(PlaceCardViewController *)v6 placeCardItem];
    if ([v16 isVenueItem])
    {
    }
    else
    {
      id v26 = [(PlaceCardViewController *)v6 placeCardItem];
      v27 = [v26 mapItem];
      unsigned int v28 = [(PlaceCardViewController *)WeakRetained containsMapItem:v27];

      if (v28)
      {
        id v29 = objc_loadWeakRetained((id *)&self->_containerViewController);
        [v29 presentController:v6];
LABEL_25:

        goto LABEL_38;
      }
    }
    id v29 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v29 replaceCurrentWithController:v6 moveToContaineeLayout:2];
    goto LABEL_25;
  }
  double v14 = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
  id WeakRetained = v14;
  if (v8 != v6)
  {
LABEL_7:
    [(PlaceCardViewController *)v14 replaceCurrentWithController:v6 moveToContaineeLayout:2];
LABEL_38:
    char v25 = 1;
    goto LABEL_39;
  }
  [(PlaceCardViewController *)v14 removeControllerFromStack:self->_simpleListResultsVC];

  id v23 = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v24 = [v23 containerStyle];

  if (v24 != (id)1)
  {
    char v25 = 0;
    goto LABEL_40;
  }
  id WeakRetained = [(ContaineeViewController *)v6 cardPresentationController];
  [(PlaceCardViewController *)WeakRetained wantsLayout:2];
  char v25 = 0;
LABEL_39:

LABEL_40:
  if ([(TransitLineSelectionActionController *)self->_lineSelectionAction isActive])
  {
    uint64_t v30 = [(PlaceCardViewController *)v6 placeCardItem];
    double v31 = (void *)v30;
    if (v30)
    {
      CFStringRef v35 = @"ActionControllerDeactivationItemKey";
      uint64_t v36 = v30;
      double v32 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    }
    else
    {
      double v32 = 0;
    }
    [(TransitLineSelectionActionController *)self->_lineSelectionAction deactivateWithContext:v32];
  }
  if ((v25 & 1) == 0)
  {
    double v33 = [(ActionCoordinator *)self containerViewController];
    v34 = [v33 chromeViewController];
    [v34 updateComponentsIfNeeded];
  }
}

- (void)presentLineCardForItem:(id)a3 loading:(BOOL)a4 overDisambiguation:(BOOL)a5
{
}

- (void)presentLineCardForItem:(id)a3 loading:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = a5;
  char v15 = [(ActionCoordinator *)self lineCardVC];
  [v15 setLineItem:v13 labelMarker:0 loading:v11 preferredLayout:0];
  lineSelectionAction = self->_lineSelectionAction;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1006DF68C;
  v21[3] = &unk_1012F5628;
  v21[4] = self;
  id v22 = v13;
  id v23 = v15;
  id v17 = v15;
  id v18 = v13;
  [(TransitLineSelectionActionController *)lineSelectionAction selectLine:v18 zoomToMapRegion:0 onActivation:v21];
  [v17 setModalPresentationStyle:7];
  double v19 = [v17 popoverPresentationController];
  [v19 setDelegate:self];
  [v19 setSourceView:v14];

  [v19 setSourceRect:x, y, width, height];
  [v19 setPermittedArrowDirections:12];
  unsigned int v20 = [(ActionCoordinator *)self containerViewController];
  [v20 _maps_topMostPresentViewController:v17 animated:1 completion:0];
}

- (void)presentLineCardForItem:(id)a3 labelMarker:(id)a4 loading:(BOOL)a5 overDisambiguation:(BOOL)a6 preferredLayout:(unint64_t)a7
{
  BOOL v9 = a5;
  id v32 = a4;
  id v12 = a3;
  id v13 = [(ActionCoordinator *)self lineCardVC];
  uint64_t v14 = sub_1000BBB44(v13);

  char v15 = [(ActionCoordinator *)self lineCardVC];
  [v15 setLineItem:v12 labelMarker:v32 loading:v9 preferredLayout:a7];

  id v16 = [(ActionCoordinator *)self containerViewController];
  id v17 = [v16 currentViewController];

  if (v14 == 5)
  {
    id v18 = [(ActionCoordinator *)self lineCardVC];
    [v18 setPreferredPresentationStyle:3];

    double v19 = [(ActionCoordinator *)self lineCardVC];
    unsigned int v20 = [v19 macPopoverPresentationController];

    if (v32)
    {
      double v21 = [(ActionCoordinator *)self lineCardVC];
      [v21 setModalPresentationStyle:7];

      [v32 coordinate];
      CLLocationDegrees v23 = v22;
      [v32 coordinate];
      CLLocationCoordinate2D v25 = CLLocationCoordinate2DMake(v23, v24);
      [v20 setCoordinate:v25.latitude, v25.longitude];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      unsigned int v28 = [(ActionCoordinator *)self lineCardVC];
      [v28 setModalPresentationStyle:7];

      id v29 = [(ActionCoordinator *)self placeCardViewController];
      uint64_t v30 = [v29 macPopoverPresentationController];
      [v30 coordinate];
      [v20 setCoordinate:];

      [(ActionCoordinator *)self dismissPlaceCardViewController:self->_placeCardViewController];
    }
    v27 = [(ActionCoordinator *)self containerViewController];
    double v31 = [(ActionCoordinator *)self lineCardVC];
    [v27 presentController:v31];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0 && !a6)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    if (isKindOfClass)
    {
LABEL_9:
      unsigned int v20 = [(ActionCoordinator *)self containerViewController];
      v27 = [(ActionCoordinator *)self lineCardVC];
      [v20 replaceCurrentWithController:v27 moveToContaineeLayout:a7];
    }
    else
    {
      unsigned int v20 = [(ActionCoordinator *)self containerViewController];
      v27 = [(ActionCoordinator *)self lineCardVC];
      [v20 presentController:v27];
    }
  }

LABEL_15:
}

- (void)ensureMapSelectionVisible
{
  BOOL v3 = [(ActionCoordinator *)self mapView];
  [v3 _edgeInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(ActionCoordinator *)self containerViewController];
  id v13 = [v12 containerStyle];

  if (v13 == (id)1)
  {
    uint64_t v14 = [(ActionCoordinator *)self containerViewController];
    char v15 = [v14 currentViewController];
    [v15 heightForLayout:2];
    double v9 = v16;
  }
  +[LookAroundButtonContainerViewController expandedHeight];
  double v18 = v9 + v17;
  double v19 = [(ActionCoordinator *)self mapSelectionManager];
  unsigned int v20 = [v19 labelMarker];

  double v21 = [(ActionCoordinator *)self venuesManager];
  id v25 = 0;
  id v26 = 0;
  [v21 getMinZoom:&v26 maxZoom:&v25 forDisplayingLabelMarker:v20];
  id v22 = v26;
  id v23 = v25;

  CLLocationDegrees v24 = [(ActionCoordinator *)self mapCameraController];
  [v24 frameLabelMarker:v20 edgeInsets:v22 minZoom:v23 maxZoom:0 completion:v5, v7, v18, v11];

  [(VenuesManager *)self->_venuesManager displayFloorForSelectedLabelMarker:v20];
}

- (void)presentSearch
{
}

- (void)viewControllerPresentSearchEditing
{
  [(ActionCoordinator *)self exitRoutePlanningIfNeededAnimated:0];
  [(ActionCoordinator *)self clearSearch];
  [(ActionCoordinator *)self presentSearchAnimated:1];
  id v3 = [(ActionCoordinator *)self searchModeViewController];
  [v3 searchBarBecomeFirstResponder];
}

- (void)viewControllerPresentSearchEndEditing
{
}

- (void)viewControllerPresentSearchEndEditingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(ActionCoordinator *)self exitRoutePlanningIfNeededAnimated:0];
  [(ActionCoordinator *)self presentSearchAnimated:v3];
  [(ActionCoordinator *)self clearSearch];
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 endEditing];
}

- (void)presentSharedTrips
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v4 = sub_1000BBB44(WeakRetained);

  if (v4 != 5)
  {
    id v5 = [(ActionCoordinator *)self appCoordinator];
    [v5 openSharedTrips];
  }
}

- (void)presentSharedTrip:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v7 = sub_1000BBB44(WeakRetained);

  if (v7 == 5) {
    [(ActionCoordinator *)self _exitRoutePlanningIfNeededAnimated:1 restoreStashedMapSelection:0];
  }
  id v8 = [(ActionCoordinator *)self appCoordinator];
  [v8 openSharedTrip:v5];
}

- (void)presentSharedTrip:(id)a3 inPopoverFromView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v10 = [[SharedTripContaineeViewController alloc] initWithSharedTrip:v7];

  [(ControlContaineeViewController *)v10 setDelegate:self];
  [(SharedTripContaineeViewController *)v10 setActionDelegate:self];
  [(SharedTripContaineeViewController *)v10 setModalPresentationStyle:7];
  id v8 = [(SharedTripContaineeViewController *)v10 popoverPresentationController];
  [v8 setSourceView:v6];

  [v8 setPermittedArrowDirections:12];
  double v9 = [(ActionCoordinator *)self containerViewController];
  [v9 _maps_topMostPresentViewController:v10 animated:1 completion:0];
}

- (void)presentChinaAlertForSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self appCoordinator];
  [v5 presentChinaAlertForSharedTrip:v4];
}

- (void)presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self appCoordinator];
  [v5 presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:v4];
}

- (void)clearSharedTrips
{
  id v2 = [(ActionCoordinator *)self appCoordinator];
  [v2 closeSharedTrips];
}

- (void)presentLoadingResults
{
  BOOL v3 = [(ActionCoordinator *)self resultsViewController];
  id v4 = [v3 cardPresentationController];
  [v4 setHidden:0];

  if (!MapsFeature_IsEnabled_SearchAndDiscovery()) {
    goto LABEL_7;
  }
  id v5 = [(ActionCoordinator *)self currentViewController];
  if (v5 == self->_routeSearchVC
    || [(ActionCoordinator *)self isPresentingAddStopSearchResults])
  {
    goto LABEL_6;
  }
  id v6 = +[UIDevice currentDevice];
  if ([v6 userInterfaceIdiom] == (id)5)
  {

LABEL_6:
    goto LABEL_7;
  }
  unsigned __int8 v8 = [(ActionCoordinator *)self isRoutePlanningPresented];

  if ((v8 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    double v10 = [(ActionCoordinator *)self searchModeViewController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1006E019C;
    v11[3] = &unk_1012E6160;
    v11[4] = self;
    id v12 = v3;
    [WeakRetained presentController:v10 animated:1 completion:v11];

    goto LABEL_8;
  }
LABEL_7:
  id v7 = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v7 presentController:v3];

LABEL_8:
}

- (void)presentVenueCategoryWithVenueCategoryItem:(id)a3
{
  id v11 = a3;
  id v4 = [(ActionCoordinator *)self venueCardCoordinator];
  id v5 = [v4 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  unsigned __int8 v8 = [v7 contentDownloader];

  [v8 searchWillStart];
  if ([v11 isAutoCompleteCategory])
  {
    double v9 = [v11 venueIdentifier];
    double v10 = [v11 searchCategory];
    [(ActionCoordinator *)self viewController:0 presentVenueFromAutoCompleteWithVenueIdentifier:v9 searchCategory:v10 source:2];
  }
}

- (void)presentGuidesHomeWithGuideLocation:(id)a3
{
  id v4 = a3;
  id v5 = [GuidesHomeViewController alloc];
  id v6 = [(ActionCoordinator *)self newTraits];
  id v7 = [(GuidesHomeViewController *)v5 initWithGuideLocation:v4 withTraits:v6];

  [(ContaineeViewController *)v7 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v7 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v7 animated:1];

  guideHomeVC = self->_guideHomeVC;
  self->_guideHomeVC = v7;
}

- (void)containerViewControllerDidResignContainee:(id)a3 toContainee:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(ActionCoordinator *)self mapSelectionManager];
    [v7 setIgnoreSelectionChanges:0];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(RoutePlanningMapController *)self->_routePlanningMapController setSelectCurrentRoute:1];
    }
  }
  [(ActionCoordinator *)self updateRouteAnnotations];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    collectionCreateVCDidDismissHandler = (void (**)(void))self->_collectionCreateVCDidDismissHandler;
    if (collectionCreateVCDidDismissHandler)
    {
      collectionCreateVCDidDismissHandler[2]();
      id v9 = self->_collectionCreateVCDidDismissHandler;
      self->_collectionCreateVCDidDismissHandler = 0;
    }
  }
}

- (void)viewController:(id)a3 openFavoriteItem:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 mkMapItem];
  unsigned __int8 v33 = [v9 isAlreadyThere];
  id v12 = [v10 objectForKeyedSubscript:@"MSGEntryForceShowPlacecardOnTap"];
  unsigned __int8 v32 = [v12 BOOLValue];

  id v13 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v31 = [v13 isAuthorizedForPreciseLocation];

  uint64_t v14 = [(ActionCoordinator *)self containerViewController];
  char v15 = [v14 traitCollection];
  BOOL v16 = [v15 userInterfaceIdiom] == (id)1;

  unsigned __int8 v17 = [v11 _canGetDirections];
  id v18 = [v10 mutableCopy];

  [v18 setObject:&off_1013A8320 forKeyedSubscript:@"DirectionsSessionInitiatorKey"];
  id v19 = [v18 copy];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1006E093C;
  v48[3] = &unk_1012F5650;
  v48[4] = self;
  unsigned int v20 = objc_retainBlock(v48);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1006E0B10;
  v45[3] = &unk_1012F5678;
  v45[4] = self;
  id v21 = v8;
  id v46 = v21;
  id v22 = v19;
  id v47 = v22;
  id v23 = objc_retainBlock(v45);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1006E0D74;
  v34[3] = &unk_1012F56A0;
  id v24 = v11;
  id v35 = v24;
  uint64_t v36 = self;
  unsigned __int8 v40 = v17;
  unsigned __int8 v41 = v33;
  unsigned __int8 v42 = v31;
  BOOL v43 = v16;
  unsigned __int8 v44 = v32;
  id v25 = v20;
  id v38 = v25;
  id v26 = v9;
  id v37 = v26;
  v27 = v23;
  id v39 = v27;
  unsigned int v28 = objc_retainBlock(v34);
  id v29 = [v26 type];
  if ((unint64_t)v29 >= 4)
  {
    if (v29 == (id)6)
    {
      [(ActionCoordinator *)self viewControllerPresentNearbyTransitDepartures:v21];
      +[GEOAPPortal captureUserAction:214 target:8 value:0];
      goto LABEL_9;
    }
    if (v29 != (id)5) {
      goto LABEL_9;
    }
  }
  if ([v26 isShortcutForSetup])
  {
    uint64_t v30 = +[ShortcutEditSession addSessionWithShortcut:v26];
    [(ActionCoordinator *)self viewController:v21 showAddShortcut:v30];
  }
  else
  {
    ((void (*)(void *, id))v28[2])(v28, v26);
  }
LABEL_9:
}

- (void)viewController:(id)a3 openMapsSuggestionEntry:(id)a4 withUserInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 containsKey:@"MapsSuggestionsRoutingNotAvailableKey"]) {
    unsigned int v10 = [v8 BOOLeanForKey:@"MapsSuggestionsRoutingNotAvailableKey"];
  }
  else {
    unsigned int v10 = 0;
  }
  unsigned __int8 v11 = [v8 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"];
  id v12 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v13 = [v12 isAuthorizedForPreciseLocation];

  uint64_t v14 = [(ActionCoordinator *)self containerViewController];
  char v15 = [v14 traitCollection];
  BOOL v16 = [v15 userInterfaceIdiom] == (id)1;

  unsigned __int8 v17 = [v9 objectForKeyedSubscript:@"MSGEntryForceShowPlacecardOnTap"];
  LOBYTE(v15) = [v17 BOOLValue];

  id v18 = [v8 MKMapItem];
  id v19 = [v9 mutableCopy];

  [v19 setObject:&off_1013A8320 forKeyedSubscript:];
  v116 = v19;
  id v20 = [v19 copy];
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_1006E2218;
  v142[3] = &unk_1012F56C8;
  v142[4] = self;
  id v21 = v7;
  id v143 = v21;
  id v22 = v20;
  id v144 = v22;
  id v23 = objc_retainBlock(v142);
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472;
  v138[2] = sub_1006E2418;
  v138[3] = &unk_1012F56F0;
  v138[4] = self;
  id v24 = v8;
  id v139 = v24;
  id v118 = v21;
  id v140 = v118;
  id v117 = v22;
  id v141 = v117;
  id v25 = objc_retainBlock(v138);
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_1006E26A0;
  v127[3] = &unk_1012F5718;
  id v128 = v18;
  v129 = self;
  char v133 = v10;
  unsigned __int8 v134 = v11;
  unsigned __int8 v135 = v13;
  BOOL v136 = v16;
  id v26 = v128;
  char v137 = (char)v15;
  v27 = v23;
  id v131 = v27;
  id v28 = v24;
  id v130 = v28;
  id v29 = v25;
  id v132 = v29;
  uint64_t v30 = objc_retainBlock(v127);
  switch((unint64_t)[v28 type])
  {
    case 1uLL:
    case 2uLL:
    case 0x13uLL:
      if (![v28 isShortcutForSetup]) {
        goto LABEL_5;
      }
      unsigned __int8 v31 = +[ShortcutEditSession editSessionWithSuggestion:v28];
      [(ActionCoordinator *)self viewController:v118 showAddShortcut:v31];

      goto LABEL_6;
    case 3uLL:
    case 4uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x17uLL:
      goto LABEL_5;
    case 5uLL:
    case 0x15uLL:
      ((void (*)(void *, id))v27[2])(v27, v28);
      goto LABEL_6;
    case 7uLL:
      id v38 = +[ParkedCarManager sharedManager];
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472;
      v125[2] = sub_1006E2970;
      v125[3] = &unk_1012F5740;
      v125[4] = self;
      id v126 = v118;
      [v38 fetchParkedCar:v125];

      goto LABEL_6;
    case 8uLL:
      if (v26)
      {
        id v39 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v26 _muid], 1);
        [v39 setTappedProactiveTrayItem:1];
        [v39 setMuid:[v26 _muid]];
        unsigned __int8 v40 = [v26 _restaurantLink_firstProviderIdentifier];
        [v39 setAppID:v40];

        ((void (*)(void *, id))v27[2])(v27, v28);
      }
      goto LABEL_6;
    case 9uLL:
      if (sub_10008034C())
      {
        unsigned __int8 v41 = [v28 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
        v114 = [v28 stringForKey:@"MapsSuggestionsRideBookingRideIDKey"];
        unsigned __int8 v42 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v41 rideIdentifier:v114];
        [v42 setTappedProactiveTrayItem:1];
        BOOL v43 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v112 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m");
          id v44 = [objc_alloc((Class)NSString) initWithFormat:@"Continuing the RideBookingSession with identifier: %@", v41];
          *(_DWORD *)id buf = 136315394;
          v146 = v112;
          __int16 v147 = 2112;
          id v148 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
        }
        if (v41)
        {
          id v45 = [(ActionCoordinator *)self appCoordinator];
          [v45 continueRideBookingSessionWithApplicationIdentifier:v41];
        }
      }
      goto LABEL_6;
    case 0xAuLL:
      id v46 = [v28 stringForKey:@"MapsSuggestionsCarPlayEnergyQueryString"];
      id v47 = objc_alloc_init(SearchFieldItem);
      [(SearchFieldItem *)v47 setSearchString:v46];
      [(ActionCoordinator *)self viewController:v118 doSearchItem:v47 withUserInfo:&off_1013AECB8];

      goto LABEL_6;
    case 0xBuLL:
      id v113 = objc_alloc_init((Class)NSMutableArray);
      v110 = +[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:v28];
      [v113 addObjectsFromArray:v110];
      v48 = sub_1005768D4();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = (char *)[v110 count];
        *(_DWORD *)id buf = 134217984;
        v146 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Extracted %lu items from MSG entry.", buf, 0xCu);
      }

      uint64_t v50 = [v110 firstObject];
      uint64_t v51 = [v50 searchResult];
      unsigned __int8 v52 = [v51 isDynamicCurrentLocation];

      if (v52)
      {
        sub_1005768D4();
        v53 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id buf = 0;
        }
      }
      else
      {
        v53 = objc_alloc_init(SearchFieldItem);
        v55 = +[SearchResult currentLocationSearchResult];
        [(SearchFieldItem *)v53 setSearchResult:v55];

        [v113 insertObject:v53 atIndex:0];
      }

      v56 = sub_1005768D4();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        v146 = (char *)v113;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Attempting to resume route to %@", buf, 0xCu);
      }

      v57 = [DirectionItem alloc];
      unsigned int v58 = [v28 transportType] - 1;
      if (v58 > 5) {
        uint64_t v59 = 1;
      }
      else {
        uint64_t v59 = qword_100F71B88[v58];
      }
      v111 = [(DirectionItem *)v57 initWithItems:v113 transportType:v59];
      if (!v10) {
        goto LABEL_53;
      }
      id v60 = [v113 count];
      v61 = sub_1005768D4();
      BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
      if ((unint64_t)v60 > 2)
      {
        if (v62)
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "MPR resume route marked as unroutable, but assuming it actually is.", buf, 2u);
        }

LABEL_53:
        if ([v28 containsKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"])
        {
          v72 = [v28 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
          v73 = [DrivePreferences alloc];
          v74 = [v72 automobileOptions];
          v75 = +[NSUserDefaults standardUserDefaults];
          v76 = [(DrivePreferences *)v73 initWithAutomobileOptions:v74 defaults:v75];
          [(DirectionItem *)v111 setDrivePreferences:v76];

          v77 = [TransitPreferences alloc];
          v78 = [v72 transitOptions];
          v79 = +[NSUserDefaults standardUserDefaults];
          v80 = [(TransitPreferences *)v77 initWithTransitOptions:v78 defaults:v79];
          [(DirectionItem *)v111 setTransitPreferences:v80];

          v81 = [WalkPreferences alloc];
          v82 = [v72 walkingOptions];
          v83 = +[NSUserDefaults standardUserDefaults];
          v84 = [(WalkPreferences *)v81 initWithWalkingOptions:v82 defaults:v83];
          [(DirectionItem *)v111 setWalkPreferences:v84];

          v85 = [CyclePreferences alloc];
          v86 = [v72 cyclingOptions];
          v87 = +[NSUserDefaults standardUserDefaults];
          v88 = [(CyclePreferences *)v85 initWithCyclingOptions:v86 defaults:v87];
          [(DirectionItem *)v111 setCyclePreferences:v88];
        }
        v63 = +[NSMutableDictionary dictionaryWithDictionary:v117];
        [(SearchFieldItem *)v63 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DirectionsBeginNavigationSessionImmediatelyKey"];
        [(SearchFieldItem *)v63 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DirectionsIsResumedNavigationSessionKey"];
        [(SearchFieldItem *)v63 setObject:&off_1013A8320 forKeyedSubscript:@"DirectionsSessionInitiatorKey"];
        if ([v28 containsKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"])
        {
          v89 = [v28 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
          v90 = [DrivePreferences alloc];
          v91 = [v89 automobileOptions];
          v92 = +[NSUserDefaults standardUserDefaults];
          v93 = [(DrivePreferences *)v90 initWithAutomobileOptions:v91 defaults:v92];
          [(DirectionItem *)v111 setDrivePreferences:v93];

          v94 = [TransitPreferences alloc];
          v95 = [v89 transitOptions];
          v96 = +[NSUserDefaults standardUserDefaults];
          v97 = [(TransitPreferences *)v94 initWithTransitOptions:v95 defaults:v96];
          [(DirectionItem *)v111 setTransitPreferences:v97];

          v98 = [WalkPreferences alloc];
          v99 = [v89 walkingOptions];
          v100 = +[NSUserDefaults standardUserDefaults];
          v101 = [(WalkPreferences *)v98 initWithWalkingOptions:v99 defaults:v100];
          [(DirectionItem *)v111 setWalkPreferences:v101];

          v102 = [CyclePreferences alloc];
          v103 = [v89 cyclingOptions];
          v104 = +[NSUserDefaults standardUserDefaults];
          v105 = [(CyclePreferences *)v102 initWithCyclingOptions:v103 defaults:v104];
          [(DirectionItem *)v111 setCyclePreferences:v105];

          v106 = [v89 resumeRouteHandleStorage];
          [(SearchFieldItem *)v63 setObject:v106 forKeyedSubscript:@"DirectionsResumeRouteHandleStorageKey"];
        }
        v107 = [v28 sharingContacts];
        [(SearchFieldItem *)v63 setObject:v107 forKeyedSubscript:@"DirectionsPreviousContactsForTripSharing"];
        [(ActionCoordinator *)self viewController:v118 doDirectionItem:v111 withUserInfo:v63];
        v108 = +[MKMapService sharedService];
        if ((unint64_t)[v113 count] <= 2) {
          uint64_t v109 = 74;
        }
        else {
          uint64_t v109 = 305;
        }
        [v108 captureUserAction:v109 onTarget:8 eventValue:0];
      }
      else
      {
        if (v62)
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "NOT Resuming route as it's marked as unroutable", buf, 2u);
        }

        v63 = objc_alloc_init(SearchFieldItem);
        v64 = [SearchResult alloc];
        v65 = [v28 MKMapItem];
        v66 = [(SearchResult *)v64 initWithMapItem:v65];
        [(SearchFieldItem *)v63 setSearchResult:v66];

        [(ActionCoordinator *)self viewController:v118 doSearchItem:v63 withUserInfo:0];
      }

LABEL_6:
      return;
    case 0xCuLL:
      unsigned __int8 v32 = objc_alloc_init(SearchFieldItem);
      unsigned __int8 v33 = [v28 stringForKey:@"MapsSuggestionsAppConnectionValueKey"];
      [(SearchFieldItem *)v32 setAddressString:v33];

      if (v26)
      {
        v34 = [[SearchResult alloc] initWithMapItem:v26];
        [(SearchFieldItem *)v32 setSearchResult:v34];
        id v35 = [(SearchFieldItem *)v32 searchResult];
        [v35 setHasIncompleteMetadata:1];

        [(ActionCoordinator *)self viewController:v118 doSearchItem:v32 withUserInfo:v117];
      }
      else
      {
        v34 = [v28 URLForKey:@"MapsSuggestionsAppConnectionMapItemURL"];
        v67 = [(SearchResult *)v34 absoluteString];
        BOOL v68 = [v67 length] == 0;

        if (!v68)
        {
          v115 = +[MKMapItem mapItemsFromURL:v34 options:0];
          v69 = [v115 firstObject];
          v70 = [[SearchResult alloc] initWithMapItem:v69];
          [(SearchFieldItem *)v32 setSearchResult:v70];
          v71 = [(SearchFieldItem *)v32 searchResult];
          [v71 setHasIncompleteMetadata:1];
        }
        [(ActionCoordinator *)self viewController:0 doSearchItem:v32 withUserInfo:0];
      }

      goto LABEL_6;
    case 0x14uLL:
      objc_initWeak((id *)buf, self);
      v54 = +[VGVirtualGarageService sharedService];
      v120[0] = _NSConcreteStackBlock;
      v120[1] = 3221225472;
      v120[2] = sub_1006E2B90;
      v120[3] = &unk_1012E6E78;
      objc_copyWeak(&v121, (id *)buf);
      [v54 virtualGarageGetListOfUnpairedVehiclesWithReply:v120];

      objc_destroyWeak(&v121);
      objc_destroyWeak((id *)buf);
      goto LABEL_6;
    case 0x16uLL:
      uint64_t v36 = [v28 uniqueIdentifier];
      unsigned int v37 = [v36 isEqualToString:@"NearbyTransit"];

      if (v37)
      {
        [(ActionCoordinator *)self viewControllerPresentNearbyTransitDepartures:v118];
        +[GEOAPPortal captureUserAction:214 target:8 value:0];
      }
      goto LABEL_6;
    case 0x18uLL:
      if (isLikelyMeetup())
      {
LABEL_5:
        ((void (*)(void *, id))v30[2])(v30, v28);
      }
      else if (isRecentlyShared())
      {
        objc_initWeak((id *)buf, self);
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = sub_1006E2990;
        v122[3] = &unk_1012F5768;
        objc_copyWeak(&v124, (id *)buf);
        id v123 = v118;
        +[MapsAutocompletePerson autoCompletePersonFrom:v28 completionHandler:v122];

        objc_destroyWeak(&v124);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_6;
    default:
      goto LABEL_6;
  }
}

- (void)viewController:(id)a3 openCommuteEntry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(SearchFieldItem);
  id v9 = +[SearchResult currentLocationSearchResult];
  [(SearchFieldItem *)v8 setSearchResult:v9];

  unsigned int v10 = objc_alloc_init(SearchFieldItem);
  unsigned __int8 v11 = [(ActionCoordinator *)self _searchResultFromMapsSuggestionsEntry:v6];

  [(SearchFieldItem *)v10 setSearchResult:v11];
  id v12 = [DirectionItem alloc];
  v18[0] = v8;
  v18[1] = v10;
  unsigned __int8 v13 = +[NSArray arrayWithObjects:v18 count:2];
  uint64_t v14 = [(DirectionItem *)v12 initWithItems:v13 transportType:1];

  CFStringRef v16 = @"DirectionsSessionInitiatorKey";
  unsigned __int8 v17 = &off_1013A8320;
  char v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [(ActionCoordinator *)self viewController:v7 doDirectionItem:v14 allowToPromptEditing:0 withUserInfo:v15];
}

- (id)_searchResultFromMapsSuggestionsEntry:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)24)
  {
    id v4 = [v3 findMyWaypoint];
    if (!v4)
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315906;
        unsigned __int8 v13 = "-[ActionCoordinator _searchResultFromMapsSuggestionsEntry:]";
        __int16 v14 = 2080;
        char v15 = "ActionCoordinator.m";
        __int16 v16 = 1024;
        int v17 = 1873;
        __int16 v18 = 2080;
        id v19 = "findMyWaypoint != nil";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
      }

      if (sub_100BB36BC())
      {
        unsigned int v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          unsigned __int8 v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    id v5 = [[SearchResult alloc] initWithComposedWaypoint:v4];
  }
  else
  {
    id v4 = [[MapsLocationOfInterest alloc] initWithMapsSuggestionEntry:v3];
    if (v4)
    {
      id v6 = [SearchResult alloc];
      id v7 = [(MapsLocationOfInterest *)v4 mapItem];
      id v5 = [(SearchResult *)v6 initWithMapItem:v7];

      [(SearchResult *)v5 setLocationOfInterest:v4];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_searchResultFromMapsFavoriteItem:(id)a3
{
  id v3 = a3;
  id v4 = [[MapsLocationOfInterest alloc] initWithMapsFavoriteItem:v3];

  if (v4)
  {
    id v5 = [SearchResult alloc];
    id v6 = [(MapsLocationOfInterest *)v4 mapItem];
    id v7 = [(SearchResult *)v5 initWithMapItem:v6];

    [(SearchResult *)v7 setLocationOfInterest:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)viewController:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [MapsWebLinkPresenter alloc];
  id v7 = [(ActionCoordinator *)self containerViewController];
  id v8 = [(MapsWebLinkPresenter *)v6 initWithPresentingViewController:v7];

  [(MapsWebLinkPresenter *)v8 presentWebURL:v5];
}

- (void)viewController:(id)a3 openPlainTextFileURL:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UINavigationController);
  id v7 = [[PlainTextAttributionViewController alloc] initWithFileURL:v5];

  id v9 = [v6 initWithRootViewController:v7];
  if (!sub_1000BBB44(v9)) {
    [v9 setModalPresentationStyle:2];
  }
  id v8 = [(ActionCoordinator *)self containerViewController];
  [v8 _maps_topMostPresentViewController:v9 animated:1 completion:0];
}

- (void)viewController:(id)a3 openTransitIncidents:(id)a4 fromView:(id)a5 withUserInfo:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    unsigned __int8 v11 = [(ActionCoordinator *)self containerViewController];
    int v12 = [v11 traitCollection];
    id v13 = [v12 userInterfaceIdiom];

    if (v13 == (id)5)
    {
      if (v10)
      {
        __int16 v14 = [[MapsIncidentsViewController alloc] initWithTransitIncidents:v9];
        [(MapsIncidentsViewController *)v14 setModalPresentationStyle:7];
        char v15 = [(MapsIncidentsViewController *)v14 popoverPresentationController];
        [v15 setPermittedArrowDirections:12];
        [v15 setSourceView:v10];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
        [WeakRetained _maps_topMostPresentViewController:v14 animated:1 completion:0];

LABEL_10:
        goto LABEL_11;
      }
      __int16 v14 = [[MapsTransitIncidentsContaineeViewController alloc] initWithTransitIncidents:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        [v19 _maps_topMostPresentViewController:v14 animated:1 completion:0];
        goto LABEL_10;
      }
      int v17 = (MapsTransitIncidentsContaineeViewController *)v14;
    }
    else
    {
      int v17 = [[MapsTransitIncidentsContaineeViewController alloc] initWithTransitIncidents:v9];
      __int16 v14 = (MapsIncidentsViewController *)v17;
    }
    [(ContaineeViewController *)v17 setContaineeDelegate:self];
    [(MapsIncidentsViewController *)v14 setPreferredPresentationStyle:6];
    id v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v18 presentController:v14 animated:1 completion:0];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)viewControllerRemoveSearchResultFocus:(id)a3
{
  id v6 = [(ActionCoordinator *)self mapView];
  id v4 = [(ActionCoordinator *)self mapSelectionManager];
  [v4 setIgnoreSelectionChanges:1];

  [v6 _deselectLabelMarkerAnimated:1];
  id v5 = [(ActionCoordinator *)self mapSelectionManager];
  [v5 setIgnoreSelectionChanges:0];
}

- (void)viewController:(id)a3 focusSearchResult:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self mapSelectionManager];
  id v7 = [(ActionCoordinator *)self mapView];
  id v8 = [(ActionCoordinator *)self searchPinsManager];
  id v9 = [v8 customPOIsController];
  id v10 = [v5 personalizedItemKey];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1006E372C;
  v13[3] = &unk_1012F5790;
  id v14 = v7;
  id v15 = v6;
  __int16 v16 = self;
  id v11 = v6;
  id v12 = v7;
  [v9 customFeatureForKey:v10 completion:v13];
}

- (void)viewController:(id)a3 openSearchResult:(id)a4
{
  id v9 = a4;
  id v5 = a4;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = +[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v6, v9);

  id v8 = [(ActionCoordinator *)self searchPinsManager];
  [v8 setSearchPinsFromSearchInfo:v7 scrollToResults:1 displayPlaceCardForResult:v5 animated:1 completion:0];
}

- (void)viewController:(id)a3 selectPersonalizedItem:(id)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6
{
  BOOL v6 = a6;
  id v20 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v20 parkedCar], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (PlaceCardItem *)v9;
    [(ActionCoordinator *)self viewController:0 selectParkedCar:v9 andPerformAction:0];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && ([v20 incidentReport], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  }
  {
    id v10 = (PlaceCardItem *)v11;
    id v12 = +[MKMapService sharedService];
    [v12 captureUserAction:1031 onTarget:511 eventValue:0];

    id v13 = [(ActionCoordinator *)self trafficIncidentVC];
    [v13 setIncidentReport:v10];

    id v14 = [(ActionCoordinator *)self containerViewController];
    id v15 = [v14 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int v17 = [(ActionCoordinator *)self containerViewController];
    id v18 = [(ActionCoordinator *)self trafficIncidentVC];
    if (isKindOfClass) {
      [v17 replaceCurrentWithController:v18 moveToContaineeDefaultLayout:1];
    }
    else {
      [v17 presentController:v18 animated:1 useDefaultContaineeLayout:1];
    }
  }
  else
  {
    id v10 = [[PlaceCardItem alloc] initWithPersonalizedItem:v20];
    id v19 = [v20 address];
    [(ActionCoordinator *)self presentPlaceCardForItem:v10 addToHistory:v19 == 0 source:a5 saveSelectionState:v6];
  }
}

- (void)viewController:(id)a3 selectMapItem:(id)a4 address:(id)a5 addToHistory:(BOOL)a6 source:(unint64_t)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [[PlaceCardItem alloc] initWithMapItem:v12 address:v11];

  [(ActionCoordinator *)self presentPlaceCardForItem:v13 addToHistory:v8 source:a7 saveSelectionState:1];
}

- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7
{
}

- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7 replaceCurrentCard:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v16 = [v15 parkedCar];
    [(ActionCoordinator *)self viewController:0 selectParkedCar:v16 andPerformAction:0];
  }
  else
  {
    int v17 = [v15 mapItem];
    unsigned int v18 = [v17 _hasHikeInfo];

    if (v18)
    {
      objc_initWeak(&location, self);
      id v19 = [(ActionCoordinator *)self appCoordinator];
      id v20 = [v15 mapItem];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1006E3E10;
      v33[3] = &unk_1012F0708;
      objc_copyWeak(v34, &location);
      v34[1] = (id)a6;
      [v19 enterRouteCreationWithMapItem:v20 completion:v33];

      objc_destroyWeak(v34);
      objc_destroyWeak(&location);
    }
    else
    {
      id v21 = [[PlaceCardItem alloc] initWithSearchResult:v15];
      id v22 = +[CustomLocationManager sharedManager];
      id v23 = [(ActionCoordinator *)self newTraits];
      [v22 processSearchResult:v15 traits:v23];

      if (a6 == 8)
      {
        id v24 = [(ActionCoordinator *)self currentSearchSession];
        unsigned int v25 = [v24 singleResultMode];

        if (v25)
        {
          uint64_t v30 = [(ActionCoordinator *)self searchSessionManager];
          id v26 = [v30 currentSearchSession];
          unsigned __int8 v32 = [v26 searchFieldItem];

          v27 = [v32 punchInDetails];
          unsigned __int8 v31 = [v27 completedSearchQuery];

          id v29 = [(ActionCoordinator *)self searchModeViewController];
          id v28 = [v15 retainedSearchMetadata];
          [v29 retainSpotlightQuery:v31 metadata:v28];
        }
      }
      [(ActionCoordinator *)self presentPlaceCardForItem:v21 addToHistory:v11 source:a6 saveSelectionState:v9 replaceCurrentCard:v8];
    }
  }
}

- (void)presentPlaceCardForItem:(id)a3 addToHistory:(BOOL)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6
{
}

- (void)presentPlaceCardForItem:(id)a3 addToHistory:(BOOL)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6 replaceCurrentCard:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1006E41D4;
  v36[3] = &unk_1012F57B8;
  v36[4] = self;
  id v13 = objc_retainBlock(v36);
  id v14 = [(ActionCoordinator *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1006E4344;
    v31[3] = &unk_1012F57E0;
    id v20 = v13;
    v34 = v20;
    id v21 = v12;
    id v32 = v21;
    unsigned __int8 v33 = self;
    BOOL v35 = a4;
    id v22 = objc_retainBlock(v31);
    if ([v21 isVenueItem] && (objc_msgSend(v21, "isDroppedPin") & 1) == 0)
    {
      [(ActionCoordinator *)self _presentVenuesPlaceCardItem:v21 shouldSaveSelectionState:v8 source:a5 resetPlaceCardViewControllerBlock:v22];
LABEL_25:

      __int16 v16 = v34;
      goto LABEL_26;
    }
    [(ActionCoordinator *)self _cleanUpVenuesStackForNonVenuePlaceCardItem:v21];
    id v23 = [(ActionCoordinator *)self mapView];
    if (sub_1000BBB44(v23) == 5)
    {
    }
    else
    {
      unsigned int v24 = [(ActionCoordinator *)self isRoutePlanningPresented];

      if (v24)
      {
        uint64_t v25 = [(ActionCoordinator *)self placeCardForRoutePlanningViewController];
        goto LABEL_21;
      }
    }
    placeCardViewController = self->_placeCardViewController;
    if (placeCardViewController)
    {
      v27 = [(PlaceCardViewController *)placeCardViewController placeCardItem];
      if (v20[2](v20, v27, v21))
      {
      }
      else
      {
        unsigned __int8 v28 = [(ActionCoordinator *)self shouldReusePlaceCardViewController:self->_placeCardViewController];

        if ((v28 & 1) == 0)
        {
          if (sub_1000BBB44(self->_placeCardViewController) != 5)
          {
            id v29 = [(ActionCoordinator *)self _newPlaceCardViewControllerForReuse];
            int v30 = 1;
            goto LABEL_22;
          }
          [(ActionCoordinator *)self dismissPlaceCardViewController:self->_placeCardViewController];
        }
      }
    }
    uint64_t v25 = [(ActionCoordinator *)self placeCardViewController];
LABEL_21:
    id v29 = (id)v25;
    int v30 = 0;
LABEL_22:
    ((void (*)(void *, id))v22[2])(v22, v29);
    [(ActionCoordinator *)self presentPlaceCard:v29 canReplaceCurrentIfNecessary:v7];
    if (v30) {
      objc_storeStrong((id *)&self->_placeCardViewController, v29);
    }

    goto LABEL_25;
  }
  __int16 v16 = [(ActionCoordinator *)self currentViewController];
  int v17 = [v16 placeCardItem];
  if (!((unsigned int (*)(void *, id, void *))v13[2])(v13, v12, v17))
  {

    goto LABEL_7;
  }
  unsigned int v18 = [v17 searchResult];
  id v19 = [v18 autocompletePerson];

  if (!v19) {
    [(ActionCoordinator *)self ensureMapSelectionVisible];
  }
  +[PPTNotificationCenter postNotificationIfNeededWithName:MKPlaceViewControllerDidShowNotification object:v16 userInfo:0];

LABEL_26:
}

- (int64_t)_excludedContentForPlaceCardItem:(id)a3
{
  id v4 = a3;
  if ([(ActionCoordinator *)self isRoutePlanningPresented]) {
    int64_t v5 = 18;
  }
  else {
    int64_t v5 = 16;
  }
  BOOL v6 = [(ActionCoordinator *)self venuesManager];
  if ((objc_msgSend(v6, "isUserAtVenueWithID:", objc_msgSend(v4, "venueID")) & 1) == 0)
  {
    BOOL v7 = [(ActionCoordinator *)self venuesManager];
    BOOL v8 = [v4 personalizedItem];
    [v8 coordinate];
    if ((objc_msgSend(v7, "isUserAtSameVenueAsCoordinate:") & 1) == 0)
    {
      BOOL v9 = [v4 chargeStationWaypointInfo];
      if (!v9)
      {
        unsigned __int8 v12 = [v4 isCurrentLocation];

        if ((v12 & 1) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
  }

LABEL_10:
  v5 |= 1uLL;
LABEL_11:
  placeCardViewController = self->_placeCardViewController;
  if (placeCardViewController && sub_1000BBB44(placeCardViewController) == 5) {
    v5 |= 0x400uLL;
  }

  return v5;
}

- (void)_cleanUpVenuesStackForNonVenuePlaceCardItem:(id)a3
{
  if (([a3 isVenueItem] & 1) == 0)
  {
    unsigned __int8 v4 = [(ActionCoordinator *)self _isBuildingMultipointRoute];
    int64_t v5 = [(ActionCoordinator *)self venueCardCoordinator];
    id v6 = [v5 venueIdForCurrentCardStack];

    if (v6)
    {
      if ((v4 & 1) == 0)
      {
        [(ActionCoordinator *)self _cleanupRoutePlanningIfNeededAnimated:0];
        BOOL v7 = [(ActionCoordinator *)self venueCardCoordinator];
        [v7 removeAllCards];

        [(ActionCoordinator *)self presentSearch];
      }
    }
  }
}

- (void)_presentVenuesPlaceCardItem:(id)a3 shouldSaveSelectionState:(BOOL)a4 source:(unint64_t)a5 resetPlaceCardViewControllerBlock:(id)a6
{
  BOOL v8 = a4;
  id v26 = a3;
  id v10 = (void (**)(id, void *))a6;
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    BOOL v11 = [(ActionCoordinator *)self currentViewController];
    unsigned __int8 v12 = [(ActionCoordinator *)self venueCardCoordinator];
    id v13 = [v12 topViewController];

    if (v11 == v13)
    {
      id v14 = [(ActionCoordinator *)self venueCardCoordinator];
      [v14 popVenueCardItem:0];
    }
  }
  id v15 = [(ActionCoordinator *)self venueCardCoordinator];
  id v16 = [v15 pushVenueCardItem:v26 source:a5 savePlaceCardSelectionState:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (sub_1000BBB44(WeakRetained) == 5 || v16 != (id)3)
  {
    id v19 = [(ActionCoordinator *)self currentViewController];
    id v20 = [(ActionCoordinator *)self resultsViewController];
    BOOL v18 = v19 == v20;
  }
  else
  {
    BOOL v18 = 1;
  }

  if (![(ActionCoordinator *)self _isBuildingMultipointRoute]) {
    [(ActionCoordinator *)self _exitRoutePlanningIfNeededAnimated:0 restoreStashedMapSelection:0];
  }
  if (a5 == 4 && v8)
  {
    id v21 = [(ActionCoordinator *)self mapSelectionManager];
    [v21 clearSelection];
  }
  id v22 = [(ActionCoordinator *)self venueCardCoordinator];
  unsigned int v23 = [v22 isCardStackEmpty];

  if (v23)
  {
    unsigned int v24 = [(ActionCoordinator *)self searchPinsManager];
    [v24 clearLinkedPlacesAndPolygon];
  }
  uint64_t v25 = [(ActionCoordinator *)self placeCardForVenuesViewController:v26];
  v10[2](v10, v25);

  [(ActionCoordinator *)self presentPlaceCard:v25 canReplaceCurrentIfNecessary:v18];
}

- (void)viewController:(id)a3 selectTransitLineItem:(id)a4 zoomToMapRegion:(BOOL)a5
{
}

- (void)viewController:(id)a3 selectTransitLineItem:(id)a4 zoomToMapRegion:(BOOL)a5 preferredLayout:(unint64_t)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = [(ActionCoordinator *)self lineCardVC];
  BOOL v11 = [v10 labelMarker];
  [(ActionCoordinator *)self presentLineCardForItem:v9 labelMarker:v11 loading:sub_1003A1138(v9) overDisambiguation:0 preferredLayout:a6];
  lineSelectionAction = self->_lineSelectionAction;
  if (!lineSelectionAction)
  {
    id v13 = [TransitLineSelectionActionController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v15 = [(TransitLineSelectionActionController *)v13 initWithContainerViewController:WeakRetained actionCoordinator:self];
    id v16 = self->_lineSelectionAction;
    self->_lineSelectionAction = v15;

    lineSelectionAction = self->_lineSelectionAction;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1006E49FC;
  v20[3] = &unk_1012F5808;
  v20[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v23 = v11;
  unint64_t v24 = a6;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  [(TransitLineSelectionActionController *)lineSelectionAction selectLine:v19 zoomToMapRegion:v7 onActivation:v20];
}

- (void)viewController:(id)a3 enterFlyoverForMapItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"SearchViewPreventAutoPresentingKeyboard_rdar_126940251" object:0];
  }
  id v10 = [(ActionCoordinator *)self appCoordinator];
  [v10 enterFlyoverForMapItem:v6];
}

- (void)viewControllerShowMyRecents:(id)a3 includeRecentSearches:(BOOL)a4
{
  id v6 = [[MyRecentsViewController alloc] initIncludingRecentSearches:a4];
  [v6 setContaineeDelegate:self];
  [v6 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v6 animated:1];
}

- (void)viewControllerShowMyShortcuts:(id)a3
{
  int64_t v5 = [[MyShortcutsViewController alloc] initWithNibName:0 bundle:0];
  [(ContaineeViewController *)v5 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v5 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5 animated:1];
}

- (void)viewController:(id)a3 showAddShortcut:(id)a4
{
  id v11 = a4;
  int64_t v5 = +[MapsOfflineUIHelper sharedHelper];
  id v6 = [v5 alertControllerForAttemptedAddShortcut];

  if (v6)
  {
    id v7 = [(ActionCoordinator *)self containerViewController];
    id WeakRetained = [(AddShortcutViewController *)v7 chromeViewController];
    [WeakRetained _maps_topMostPresentViewController:v6 animated:1 completion:0];
LABEL_5:

    goto LABEL_7;
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v7 = [[AddShortcutViewController alloc] initWithShortcutEditSession:v11];
    [(ControlContaineeViewController *)v7 setDelegate:self];
    [(ContaineeViewController *)v7 setContaineeDelegate:self];
    shortcutEditSessionController = self->_shortcutEditSessionController;
    self->_shortcutEditSessionController = 0;

    id v10 = [(ActionCoordinator *)self shortcutEditSessionController];
    [(AddShortcutViewController *)v7 setSessionController:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v7 animated:1];
    goto LABEL_5;
  }
  id v7 = [(ActionCoordinator *)self shortcutEditSessionController];
  [(AddShortcutViewController *)v7 showAddShortcut:v11];
LABEL_7:
}

- (void)viewController:(id)a3 editShortcut:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = +[MapsOfflineUIHelper sharedHelper];
  BOOL v8 = [v7 alertControllerForAttemptedShowMyShortcut];

  if (v8)
  {
    id v9 = [(ActionCoordinator *)self containerViewController];
    id v10 = [v9 chromeViewController];
    [v10 _maps_topMostPresentViewController:v8 animated:1 completion:0];
  }
  else
  {
    shortcutEditSessionController = self->_shortcutEditSessionController;
    self->_shortcutEditSessionController = 0;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v14;
    }
    else {
      id v12 = 0;
    }
    id v13 = [(ActionCoordinator *)self shortcutEditSessionController];
    [v13 setRequestInitiator:v12];

    id v9 = [(ActionCoordinator *)self shortcutEditSessionController];
    [v9 editShortcut:v6];
  }
}

- (void)viewController:(id)a3 removeShortcut:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self shortcutEditSessionController];
  [v6 removeShortcut:v5];
}

- (void)viewController:(id)a3 openTransitLineCard:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  p_containerViewController = &self->_containerViewController;
  id v13 = a5;
  id v14 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v16 = [WeakRetained view];
  [v16 convertRect:v13 fromView:x, y, width, height];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  uint64_t v25 = sub_1003A1138(v14);
  id v27 = objc_loadWeakRetained((id *)p_containerViewController);
  id v26 = [v27 view];
  -[ActionCoordinator presentLineCardForItem:loading:sourceView:sourceRect:](self, "presentLineCardForItem:loading:sourceView:sourceRect:", v14, v25, v26, v18, v20, v22, v24);
}

- (void)viewController:(id)a3 editShortcut:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  p_containerViewController = &self->_containerViewController;
  id v13 = a5;
  id v14 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v16 = [WeakRetained view];
  [v16 convertRect:v13 fromView:x, y, width, height];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  shortcutEditSessionController = self->_shortcutEditSessionController;
  self->_shortcutEditSessionController = 0;

  id v28 = [(ActionCoordinator *)self shortcutEditSessionController];
  id v26 = objc_loadWeakRetained((id *)p_containerViewController);
  id v27 = [v26 view];
  [v28 editShortcut:v14 sourceView:v27 sourceRect:v18, v20, v22, v24];
}

- (id)shortcutEditSessionController
{
  p_shortcutEditSessionController = &self->_shortcutEditSessionController;
  shortcutEditSessionController = self->_shortcutEditSessionController;
  if (shortcutEditSessionController)
  {
    unsigned __int8 v4 = shortcutEditSessionController;
  }
  else
  {
    unsigned __int8 v4 = objc_alloc_init(ShortcutEditSessionControllerImpl);
    [(ShortcutEditSessionControllerImpl *)v4 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [(ShortcutEditSessionControllerImpl *)v4 setContainerViewController:WeakRetained];

    objc_storeStrong((id *)p_shortcutEditSessionController, v4);
  }

  return v4;
}

- (void)shortcutEditSessionControllerFinished:(id)a3 shortcutWasReplacedBy:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  shortcutEditSessionController = self->_shortcutEditSessionController;
  self->_shortcutEditSessionController = 0;

  if (v6)
  {
    if (self->_placeCardViewController)
    {
      BOOL v8 = [v12 requestInitiator];
      placeCardViewController = self->_placeCardViewController;

      if (v8 == placeCardViewController)
      {
        id v10 = [(ActionCoordinator *)self _searchResultFromMapsFavoriteItem:v6];
        id v11 = [(ActionCoordinator *)self mapSelectionManager];
        [v11 injectAndSelectSearchResult:v10];
      }
    }
  }
}

- (void)viewControllerShowLibraryRootView:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v6 = [WeakRetained currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = objc_alloc_init(_TtC4Maps21LibraryViewController);
    [(ContaineeViewController *)v9 setContaineeDelegate:self];
    [(LibraryViewController *)v9 setActionDelegate:self];
    id v8 = objc_loadWeakRetained((id *)p_containerViewController);
    [v8 presentController:v9 animated:1];
  }
}

- (void)viewControllerShowLibraryPlacesView:(id)a3
{
  id v5 = objc_alloc_init(_TtC4Maps27LibraryPlacesViewController);
  [(ContaineeViewController *)v5 setContaineeDelegate:self];
  [(LibraryPlacesViewController *)v5 setActionDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5 animated:1];
}

- (void)viewControllerShowCollections:(id)a3
{
  +[CATransaction setFrameStallSkipRequest:1];
  id v5 = [[CollectionListViewController alloc] initWithNibName:0 bundle:0];
  [(ContaineeViewController *)v5 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v5 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5 animated:1];
}

- (void)viewController:(id)a3 showCollection:(id)a4
{
}

- (void)viewController:(id)a3 showCollection:(id)a4 completion:(id)a5
{
  double v21 = (SearchViewController *)a3;
  id v7 = a4;
  +[CATransaction setFrameStallSkipRequest:1];
  if ([v7 handlerType] == (id)1)
  {
    [(ActionCoordinator *)self viewController:v21 createNewCollectionWithSession:0];
    goto LABEL_22;
  }
  if ([v7 handlerType] == (id)4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = (CollectionViewController *)v7;
      id v9 = [(CollectionViewController *)v8 curatedCollectionIdentifier];

      if (v9)
      {
        id v10 = [(CollectionViewController *)v8 curatedCollectionIdentifier];
        [(ActionCoordinator *)self viewController:v21 showCuratedCollectionIdentifier:v10];
      }
      goto LABEL_21;
    }
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled]
    || (id v11 = objc_loadWeakRetained((id *)&self->_containerViewController),
        uint64_t v12 = sub_1000BBB44(v11),
        v11,
        v12 != 5))
  {
    id v8 = [[CollectionViewController alloc] initWithCollection:v7];
    [(ContaineeViewController *)v8 setContaineeDelegate:self];
    [(ControlContaineeViewController *)v8 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v8 animated:1];

    id v17 = [v7 showAction];
    if (self->_searchModeViewController == v21)
    {
      LODWORD(v18) = 8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        LODWORD(v18) = 251;
      }
      else {
        LODWORD(v18) = 201;
      }
    }
    if ([v7 handlerType] == (id)3) {
      uint64_t v18 = 256;
    }
    else {
      uint64_t v18 = v18;
    }
    double v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 bucketedNumberOfItems]);
    double v20 = +[NSString stringWithFormat:@"%@", v19];

    +[GEOAPPortal captureUserAction:v17 target:v18 value:v20];
LABEL_21:

    goto LABEL_22;
  }
  id v13 = [(ActionCoordinator *)self containerViewController];
  id v14 = [v13 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(ActionCoordinator *)self dismissPlaceCardViewController:self->_placeCardViewController];
    +[GEOAPPortal captureUserAction:2067 target:201 value:0];
  }
  [(SearchViewController *)self->_searchModeViewController showCollection:v7];
LABEL_22:
}

- (void)viewController:(id)a3 editCollection:(id)a4
{
  id v8 = a4;
  id v5 = [(ActionCoordinator *)self containerViewController];
  id v6 = [v5 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(ActionCoordinator *)self dismissPlaceCardViewController:self->_placeCardViewController];
  }
  [(SearchViewController *)self->_searchModeViewController editCollection:v8];
}

- (void)viewController:(id)a3 addItemsFromACToCollection:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v10 = v5;
    id v6 = +[MapsOfflineUIHelper sharedHelper];
    id v7 = [v6 alertControllerForAttemptedAddCollection];

    if (v7)
    {
      id v8 = [(ActionCoordinator *)self containerViewController];
      id WeakRetained = [(CollectionAddViewController *)v8 chromeViewController];
      [WeakRetained _maps_topMostPresentViewController:v7 animated:1 completion:0];
    }
    else
    {
      id v8 = [(AddFromACViewController *)[CollectionAddViewController alloc] initWithNibName:0 bundle:0];
      [(ContaineeViewController *)v8 setContaineeDelegate:self];
      [(ControlContaineeViewController *)v8 setDelegate:self];
      [(CollectionAddViewController *)v8 setEditSession:v10];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      [WeakRetained presentController:v8 animated:1];
    }

    id v5 = v10;
  }
}

- (void)viewControllerShowAddItemsFromACToLibraryView:(id)a3
{
  unsigned __int8 v4 = +[MapsOfflineUIHelper sharedHelper];
  id v7 = [v4 alertControllerForAttemptedAddCollection];

  if (v7)
  {
    id v5 = [(ActionCoordinator *)self containerViewController];
    id WeakRetained = [(LibraryAddCollectionItemViewController *)v5 chromeViewController];
    [WeakRetained _maps_topMostPresentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v5 = [[_TtC4Maps38LibraryAddCollectionItemViewController alloc] initWithNibName:0 bundle:0];
    [(ContaineeViewController *)v5 setContaineeDelegate:self];
    [(ControlContaineeViewController *)v5 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v5 animated:1];
  }
}

- (void)viewController:(id)a3 pickCollectionWithSession:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = -[CollectionPicker initWithCollectionEditSession:sourceView:sourceRect:]([CollectionPicker alloc], "initWithCollectionEditSession:sourceView:sourceRect:", v14, v15, x, y, width, height);
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = v16;

  [(CollectionPicker *)self->_collectionPicker setDelegate:self];
  objc_initWeak(&location, self);
  uint64_t v18 = self->_collectionPicker;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1006E5CBC;
  v22[3] = &unk_1012F5830;
  objc_copyWeak(&v24, &location);
  id v19 = v13;
  id v23 = v19;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1006E5D24;
  v20[3] = &unk_1012F5858;
  objc_copyWeak(&v21, &location);
  [(CollectionPicker *)v18 viewControllerToPresentIfContainee:v22 ifAlertController:v20];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)viewController:(id)a3 createNewCollectionWithSession:(id)a4
{
  id v6 = (SearchViewController *)a3;
  id v7 = a4;
  id v8 = +[MapsOfflineUIHelper sharedHelper];
  id v9 = [v8 alertControllerForAttemptedAddCollection];

  if (!v9)
  {
    if (!+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      uint64_t v13 = sub_1000BBB44(WeakRetained);

      if (v13 == 5)
      {
        [(ActionCoordinator *)self viewController:v6 addItemsFromACToCollection:v7];
        goto LABEL_22;
      }
    }
    id v14 = [v7 collection];
    if ([v14 handlerType] == (id)3)
    {
      uint64_t v15 = 256;
    }
    else if (self->_searchModeViewController == v6)
    {
      uint64_t v15 = 8;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v6) {
        unsigned int v17 = 0;
      }
      else {
        unsigned int v17 = 201;
      }
      if (isKindOfClass) {
        uint64_t v15 = 251;
      }
      else {
        uint64_t v15 = v17;
      }
    }

    uint64_t v18 = [[CollectionCreateViewController alloc] initWithEditSession:v7];
    [(ContaineeViewController *)v18 setContaineeDelegate:self];
    [(CollectionCreateViewController *)v18 setTarget:v15];
    id collectionCreateVCDidDismissHandler = self->_collectionCreateVCDidDismissHandler;
    self->_id collectionCreateVCDidDismissHandler = 0;

    double v20 = objc_loadWeakRetained((id *)&self->_containerViewController);
    if (sub_1000BBB44(v20) == 5)
    {
      objc_opt_class();
      char v21 = objc_opt_isKindOfClass();

      if ((v21 & 1) == 0)
      {
LABEL_21:
        id v25 = objc_loadWeakRetained((id *)&self->_containerViewController);
        [v25 presentController:v18 animated:1];

        goto LABEL_22;
      }
      double v22 = [(SearchViewController *)v6 placeCardItem];
      double v20 = [v22 mapItem];

      if (v20)
      {
        objc_initWeak(&location, self);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1006E6060;
        v26[3] = &unk_1012E6690;
        objc_copyWeak(&v28, &location);
        id v27 = v20;
        id v23 = objc_retainBlock(v26);
        id v24 = self->_collectionCreateVCDidDismissHandler;
        self->_id collectionCreateVCDidDismissHandler = v23;

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }

    goto LABEL_21;
  }
  id v10 = [(ActionCoordinator *)self containerViewController];
  id v11 = [v10 chromeViewController];
  [v11 _maps_topMostPresentViewController:v9 animated:1 completion:0];

LABEL_22:
}

- (void)viewController:(id)a3 confirmDeleteCollections:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
}

- (void)viewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6
{
  id v8 = +[UIViewController _maps_viewControllerForRenamingMapItem:a4 saveHandler:a5 cancelHandler:a6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained _maps_topMostPresentViewController:v8 animated:1 completion:0];
}

- (void)viewController:(id)a3 editCollection:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  collectionEditCoordinator = self->_collectionEditCoordinator;
  if (collectionEditCoordinator) {
    [(MacCollectionEditCoordinator *)collectionEditCoordinator dismiss];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  char v21 = [WeakRetained view];
  [v21 convertRect:v17 fromView:x, y, width, height];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  objc_initWeak(&location, self);
  int v30 = [MacCollectionEditCoordinator alloc];
  id v31 = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v32 = [v31 view];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1006E6374;
  v36[3] = &unk_1012E9950;
  objc_copyWeak(&v38, &location);
  id v33 = v18;
  id v37 = v33;
  v34 = -[MacCollectionEditCoordinator initWithCollection:presentingViewController:sourceView:sourceRect:completion:](v30, "initWithCollection:presentingViewController:sourceView:sourceRect:completion:", v16, v31, v32, v36, v23, v25, v27, v29);
  BOOL v35 = self->_collectionEditCoordinator;
  self->_collectionEditCoordinator = v34;

  [(MacCollectionEditCoordinator *)self->_collectionEditCoordinator present];
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

- (void)viewController:(id)a3 presentCollectionPickerContaineeViewController:(id)a4
{
  id v5 = a4;
  [v5 setContaineeDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5 animated:1 completion:0];
}

- (void)collectionPickerClosed:(id)a3
{
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;
}

- (void)collectionPickerNewCollection:(id)a3
{
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;
  id v5 = a3;

  id v6 = [v5 editSession];

  [(ActionCoordinator *)self viewController:0 createNewCollectionWithSession:v6];
}

- (void)viewController:(id)a3 showCuratedCollection:(id)a4
{
}

- (void)viewController:(id)a3 showCuratedCollection:(id)a4 replaceViewController:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)MKMapItemIdentifier);
  id v14 = [v11 collectionIdentifier];

  id v15 = [v13 initWithGEOMapItemIdentifier:v14];
  [(ActionCoordinator *)self viewController:v12 showCuratedCollectionIdentifier:v15 replaceViewController:v6 completion:v10];
}

- (void)viewController:(id)a3 showCuratedCollectionIdentifier:(id)a4
{
}

- (void)viewController:(id)a3 showCuratedCollectionIdentifier:(id)a4 replaceViewController:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = [[CuratedCollectionViewController alloc] initWithCuratedCollectionIdentifier:v10];

  [(ActionCoordinator *)self showCuratedCollectionViewController:v11 replaceViewController:v6 completion:v9];
  if (self->_curatedCollectionsVC)
  {
    id v12 = [(ActionCoordinator *)self containerViewController];
    [v12 removeControllerFromStack:self->_curatedCollectionsVC];

    curatedCollectionsVC = self->_curatedCollectionsVC;
  }
  else
  {
    curatedCollectionsVC = 0;
  }
  self->_curatedCollectionsVC = v11;
}

- (void)viewController:(id)a3 showFullyClientizedCuratedCollection:(id)a4 replaceViewController:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [[CuratedCollectionViewController alloc] initWithFullyClientizedPlaceCollection:v7];

  [(ActionCoordinator *)self showCuratedCollectionViewController:v8 replaceViewController:v5 completion:0];
  if (self->_curatedCollectionsVC)
  {
    id v9 = [(ActionCoordinator *)self containerViewController];
    [v9 removeControllerFromStack:self->_curatedCollectionsVC];

    curatedCollectionsVC = self->_curatedCollectionsVC;
  }
  else
  {
    curatedCollectionsVC = 0;
  }
  self->_curatedCollectionsVC = v8;
}

- (void)showCuratedCollectionViewController:(id)a3 replaceViewController:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  [v8 setContaineeDelegate:self];
  [v8 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v11 = WeakRetained;
  if (v6)
  {
    [WeakRetained replaceCurrentWithController:v8];

    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1006E6844;
    v12[3] = &unk_1012EAFC0;
    id v13 = v9;
    [v11 presentController:v8 animated:1 completion:v12];
  }
}

- (void)viewController:(id)a3 showCuratedCollectionsList:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [CuratedCollectionsListViewController alloc];
  id v16 = [(ActionCoordinator *)self newTraits];
  id v17 = [(CuratedCollectionsListViewController *)v15 initWithCuratedCollections:v14 usingTitle:v13 usingCollectionIds:v12 withTraits:v16];

  [(ContaineeViewController *)v17 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v17 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  double v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  double v26 = sub_1006E69FC;
  double v27 = &unk_1012EB2E0;
  id v19 = v17;
  double v28 = v19;
  id v20 = v11;
  id v29 = v20;
  [WeakRetained presentController:v19 animated:1 completion:&v24];

  if (v19)
  {
    char v21 = [(ActionCoordinator *)self containerViewController];
    [v21 removeControllerFromStack:self->_collectionsListVC];
  }
  collectionsListVC = self->_collectionsListVC;
  self->_collectionsListVC = v19;
  double v23 = v19;
}

- (void)viewControllerShowPublisher:(id)a3
{
}

- (void)viewControllerShowPublisher:(id)a3 replaceViewController:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)MKMapItemIdentifier);
  id v8 = [v6 identifier];
  id v10 = [v7 initWithGEOMapItemIdentifier:v8];

  id v9 = [v6 totalCollectionCount];
  [(ActionCoordinator *)self viewControllerShowPublisherWithID:v10 numberOfCollections:v9 replaceViewController:v4];
}

- (void)viewController:(id)a3 showGuidesHome:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_citySelectorVC)
  {
    id v7 = [(ActionCoordinator *)self containerViewController];
    [v7 popLastViewControllerFromViewController:self->_citySelectorVC animated:1 useDefaultContaineeLayout:1];

    id v8 = [(ActionCoordinator *)self containerViewController];
    unsigned int v9 = [v8 controllerIsInStack:self->_guideHomeVC];

    if (v9)
    {
      guideHomeVC = self->_guideHomeVC;
LABEL_7:
      [(GuidesHomeViewController *)guideHomeVC setGuideLocation:v6];
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      guideHomeVC = self->_guideHomeVC;
      if (guideHomeVC) {
        goto LABEL_7;
      }
    }
  }
  [(ActionCoordinator *)self presentGuidesHomeWithGuideLocation:v6];
LABEL_9:
}

- (void)viewControllerShowPublisherWithID:(id)a3
{
}

- (void)viewControllerShowPublisherWithID:(id)a3 numberOfCollections:(unint64_t)a4 replaceViewController:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = [PublisherViewController alloc];
  id v10 = [(ActionCoordinator *)self newTraits];
  id v11 = [(PublisherViewController *)v9 initWithPublisherId:v8 numberOfCollections:a4 withTraits:v10];

  [(ContaineeViewController *)v11 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v11 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v13 = WeakRetained;
  if (v5) {
    [WeakRetained replaceCurrentWithController:v11];
  }
  else {
    [WeakRetained presentController:v11 animated:1];
  }

  if (self->_publisherVC)
  {
    id v14 = [(ActionCoordinator *)self containerViewController];
    [v14 removeControllerFromStack:self->_publisherVC];

    publisherVC = self->_publisherVC;
  }
  else
  {
    publisherVC = 0;
  }
  self->_publisherVC = v11;
}

- (void)viewControllerShowAllCollections
{
  id v3 = objc_alloc_init(AllCollectionsViewController);
  BOOL v4 = [(ActionCoordinator *)self newTraits];
  [(AllCollectionsViewController *)v3 setTraits:v4];

  [(ContaineeViewController *)v3 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v3 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v3 animated:1];

  if (self->_allCollectionsVC)
  {
    id v6 = [(ActionCoordinator *)self containerViewController];
    [v6 removeControllerFromStack:self->_allCollectionsVC];

    allCollectionsVC = self->_allCollectionsVC;
  }
  else
  {
    allCollectionsVC = 0;
  }
  self->_allCollectionsVC = v3;
}

- (void)viewControllerShowCitySelectorFromGuideLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[CitySelectorViewController alloc] initWithSourceGuideLocation:v4];

  id v6 = [(ActionCoordinator *)self newTraits];
  [(CitySelectorViewController *)v5 setTraits:v6];

  [(ContaineeViewController *)v5 setContaineeDelegate:self];
  [(ControlContaineeViewController *)v5 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5 animated:1];

  if (self->_citySelectorVC)
  {
    id v8 = [(ActionCoordinator *)self containerViewController];
    [v8 removeControllerFromStack:self->_citySelectorVC];

    citySelectorVC = self->_citySelectorVC;
  }
  else
  {
    citySelectorVC = 0;
  }
  self->_citySelectorVC = v5;
}

- (void)viewControllerShowPhotoThumbnailGalleryWithMapItem:(id)a3 albumIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 _geoMapItem];
  id v8 = [v7 _captionedPhotoAlbums];
  id v9 = [v8 count];

  if ((unint64_t)v9 < 2) {
    +[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:v6 withStartingIndex:0];
  }
  else {
  id v11 = +[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:v6 albumIndex:a4];
  }

  [v11 setDelegate:self];
  id v10 = [(ActionCoordinator *)self containerViewController];
  [v11 setPresentingViewController:v10];

  [v11 setPlaceCardDismissalDelegate:self];
  [v11 setPresentationContext:1];
  [(ActionCoordinator *)self viewControllerPresentPOIEnrichmentWithCoordinator:v11];
}

- (void)viewControllerShowOfflineMaps:(id)a3
{
}

- (void)viewControllerShowExpiredOfflineMaps:(id)a3
{
}

- (void)_viewControllerShowOfflineMaps:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  id v6 = +[MapsOfflineUIHelper sharedHelper];
  id v7 = [v6 alertControllerForAttemptedDataManagementDisplay];

  id v8 = [(ActionCoordinator *)self containerViewController];
  id v9 = [v8 chromeViewController];
  id v10 = v9;
  if (v7)
  {
    [v9 _maps_topMostPresentViewController:v7 animated:1 completion:0];

    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    id v11 = [v9 topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (v5)
      {
        id v13 = [(ActionCoordinator *)self containerViewController];
        id v14 = [v13 chromeViewController];
        id v15 = [v14 topContext];
        ((void (**)(id, void *))v5)[2](v5, v15);
      }
    }
    else
    {
      id v16 = objc_alloc_init(OfflineMapsManagementContext);
      id v17 = [(ActionCoordinator *)self containerViewController];
      id v18 = [v17 chromeViewController];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1006E7204;
      v20[3] = &unk_1012E5F78;
      char v21 = v16;
      double v22 = v5;
      id v19 = v16;
      [v18 pushContext:v19 animated:1 completion:v20];
    }
  }
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5
{
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 dismissalBlock:(id)a6
{
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldUseSessionlessAnalytics:(BOOL)a6
{
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 route:(id)a6 shouldUseSessionlessAnalytics:(BOOL)a7 shouldShowDataManagementAfterDownload:(BOOL)a8 shouldShowDataManagementAfterDownloadIfRegionDiffers:(BOOL)a9 dismissalBlock:(id)a10
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1006E73DC;
  v24[3] = &unk_1012F58C0;
  objc_copyWeak(&v28, &location);
  id v21 = v20;
  id v27 = v21;
  BOOL v29 = a8;
  BOOL v30 = a9;
  id v22 = v17;
  id v25 = v22;
  id v23 = v16;
  id v26 = v23;
  [(ActionCoordinator *)self viewController:v23 showOfflineMapRegionSelectorForRegion:v22 name:v18 route:v19 shouldUseSessionlessAnalytics:v11 dismissalBlock:v24 postDismissalBlock:0];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldUseSessionlessAnalytics:(BOOL)a6 dismissalBlock:(id)a7 postDismissalBlock:(id)a8
{
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 route:(id)a6 shouldUseSessionlessAnalytics:(BOOL)a7 dismissalBlock:(id)a8 postDismissalBlock:(id)a9
{
  BOOL v31 = a7;
  id v14 = a3;
  id v15 = a4;
  id v32 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  if (GEOSupportsOfflineMaps())
  {
    id v19 = v14;
    id v20 = +[MapsOfflineUIHelper sharedHelper];
    id v21 = [v20 alertControllerForAttemptedRegionDownload];

    id v22 = [(ActionCoordinator *)self containerViewController];
    id v23 = [v22 chromeViewController];
    double v24 = v23;
    if (v21)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1006E77C4;
      v33[3] = &unk_1012F3690;
      id v34 = v17;
      id v35 = v18;
      [v24 _maps_topMostPresentViewController:v21 animated:1 completion:v33];

      id v14 = v19;
    }
    else
    {
      [v23 topContext];
      id v25 = v30 = v15;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v15 = v30;
      id v14 = v19;
      if ((isKindOfClass & 1) == 0)
      {
        id v27 = [[OfflineRegionSelectorContext alloc] initWithRegion:v30 name:v32];
        [(OfflineRegionSelectorContext *)v27 setShouldUseSessionlessAnalytics:v31];
        [(OfflineRegionSelectorContext *)v27 setRoute:v16];
        [(OfflineRegionSelectorContext *)v27 setDismissalBlock:v17];
        [(OfflineRegionSelectorContext *)v27 setPostDismissalBlock:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(OfflineRegionSelectorContext *)v27 setDownloadDelegate:v19];
        }
        id v28 = [(ActionCoordinator *)self containerViewController];
        BOOL v29 = [v28 chromeViewController];
        [v29 pushContext:v27 animated:1 completion:0];

        id v15 = v30;
      }
    }
  }
}

- (void)viewController:(id)a3 presentParentMapItem:(id)a4
{
  id v5 = a4;
  id v6 = [v5 _venueInfo];

  if (v6)
  {
    [(ActionCoordinator *)self viewController:0 selectMapItem:v5 address:0 addToHistory:1 source:4];
LABEL_5:
    id v8 = [[SearchResult alloc] initWithMapItem:v5];
    id v12 = v8;
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    id v10 = +[SearchInfo searchInfoWithResults:v9];

    BOOL v11 = [(ActionCoordinator *)self searchPinsManager];
    [v11 setSearchPinsFromSearchInfo:v10 scrollToResults:1 displayPlaceCardForResult:v8 animated:1 completion:0];

    goto LABEL_6;
  }
  if (![v5 _hasHikeInfo]) {
    goto LABEL_5;
  }
  id v7 = [(ActionCoordinator *)self appCoordinator];
  [v7 enterRouteCreationWithMapItem:v5 completion:0];

LABEL_6:
}

- (void)viewController:(id)a3 presentPlacesForMapItem:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[PlacesSearchCardItem alloc] initWithMapItem:v11 searchCategory:v10];

  [(ActionCoordinator *)self viewController:v12 presentPlacesWithPlacesCardItem:v13 source:a6];
}

- (void)viewController:(id)a3 presentRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (sub_1000BBB44(v12) == 5
    && ([v15 _venueInfo],
        id v17 = objc_claimAutoreleasedReturnValue(),
        unsigned int v18 = [v17 venueFeatureType],
        v17,
        v18 == 1))
  {
    id v19 = [v15 _browseCategories];
    id v20 = [v19 firstObject];

    id v21 = [[VenueSearchCardItem alloc] initWithMapItem:v15 searchCategory:v20];
    [(ActionCoordinator *)self viewController:v12 presentVenueWithVenueCardItem:v21 source:4];
  }
  else
  {
    id v35 = v14;
    id v36 = v12;
    id v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v23 = v13;
    id v24 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [[SearchResult alloc] initWithMapItem:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          if (v28) {
            [v22 addObject:v28];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v25);
    }

    BOOL v29 = [SimilarResultsViewController alloc];
    id v30 = [(ActionCoordinator *)self appCoordinator];
    BOOL v31 = [(SimpleResultsViewController *)v29 initWithShareDelegate:v30];

    [(SimpleResultsViewController *)v31 setResultsDelegate:self];
    [(SimpleResultsViewController *)v31 setCoordinator:self];
    [(ContaineeViewController *)v31 setContaineeDelegate:self];
    [(SimpleResultsViewController *)v31 setEnableQuickActionMenu:1];
    id v14 = v35;
    [(SimilarResultsViewController *)v31 setHeaderTitle:v35];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v31];

    [(SimpleResultsViewController *)v31 setSearchResults:v22];
    [(SimilarResultsViewController *)v31 setOriginalMapItem:v15];
    [(SimilarResultsViewController *)v31 setAnalyticsDelegate:v16];
    id v33 = +[SearchInfo searchInfoWithResults:v22];
    id v34 = [(ActionCoordinator *)self searchPinsManager];
    [v34 setSearchPinsFromSearchInfo:v33 scrollToResults:1 displayPlaceCardForResult:0 animated:1 completion:0];

    id v12 = v36;
  }
}

- (void)viewController:(id)a3 showFavoritesType:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[CollectionManager sharedManager];
  id v8 = [v7 collectionForFavoritesType:a4];

  if (v8) {
    [(ActionCoordinator *)self viewController:v6 showCollection:v8];
  }
  else {
    [(ActionCoordinator *)self viewControllerShowCollections:v6];
  }
}

- (void)viewController:(id)a3 showCollectionWithID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CollectionManager sharedManager];
  id v9 = [v8 collectionWithIdentifier:v6];

  if (v9) {
    [(ActionCoordinator *)self viewController:v7 showCollection:v9];
  }
  else {
    [(ActionCoordinator *)self viewControllerShowCollections:v7];
  }
}

- (void)viewController:(id)a3 displayTableBookingFor:(id)a4
{
  id v11 = a4;
  id v5 = [(ActionCoordinator *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(ActionCoordinator *)self currentViewController];
    id v8 = [v7 placeCardItem];
    unsigned int v9 = [v11 isEqual:v8];

    if (v9)
    {
      [v7 setShouldPresentSecondaryActionWhenReady:1];
      goto LABEL_6;
    }
  }
  id v7 = [(ActionCoordinator *)self placeCardViewController];
  [v7 resetState];
  [v7 setPlaceCardItem:v11 withHistory:1];
  [v7 setShouldPresentSecondaryActionWhenReady:1];
  [(ActionCoordinator *)self presentPlaceCard:v7];
  id v10 = [(ActionCoordinator *)self appCoordinator];
  [v10 setNeedsUserActivityUpdate];

LABEL_6:
}

- (void)viewController:(id)a3 selectParkedCar:(id)a4 andPerformAction:(int64_t)a5
{
}

- (void)viewController:(id)a3 selectParkedCar:(id)a4 andPerformAction:(int64_t)a5 selectPOIOnMap:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = +[ParkedCarManager sharedManager];
  [v10 informCoreRoutineOfEngagementWithParkedCar:v9];

  parkedCarViewController = self->_parkedCarViewController;
  if (!parkedCarViewController)
  {
    id v12 = objc_alloc_init(ParkedCarInfoCardViewController);
    id v13 = self->_parkedCarViewController;
    self->_parkedCarViewController = v12;

    [(InfoCardViewController *)self->_parkedCarViewController setContaineeDelegate:self];
    parkedCarViewController = self->_parkedCarViewController;
  }
  [(ParkedCarInfoCardViewController *)parkedCarViewController setParkedCar:v9];
  [(ParkedCarInfoCardViewController *)self->_parkedCarViewController setDelegate:self];
  id v14 = [(ActionCoordinator *)self containerViewController];
  id v15 = [v14 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned int v18 = WeakRetained;
  id v19 = self->_parkedCarViewController;
  if (isKindOfClass) {
    [WeakRetained replaceCurrentWithController:v19 moveToContaineeLayout:2];
  }
  else {
    [WeakRetained presentController:v19];
  }

  id v20 = [(ActionCoordinator *)self mapView];
  [v9 coordinate];
  double v22 = v21;
  double v24 = v23;
  [v20 convertCoordinate:v20 toPointToView:v20];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [v20 bounds];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  [v20 _edgeInsets];
  CGFloat v38 = v32 + v37;
  CGFloat v41 = v34 - (v39 + v40);
  v70.size.double height = v36 - (v37 + v42);
  v70.origin.double x = v30 + v39;
  v70.origin.double y = v38;
  v70.size.double width = v41;
  v69.double x = v26;
  v69.double y = v28;
  BOOL v43 = CGRectContainsPoint(v70, v69);
  [v9 horizontalAccuracy];
  CLLocationDistance v44 = 1000.0;
  CLLocationDistance v45 = 1000.0;
  if (v46 > 1000.0)
  {
    [v9 horizontalAccuracy];
    CLLocationDistance v45 = v47;
  }
  [v9 horizontalAccuracy];
  if (v48 > 1000.0)
  {
    [v9 horizontalAccuracy];
    CLLocationDistance v44 = v49;
  }
  v68.double latitude = v22;
  v68.double longitude = v24;
  MKCoordinateRegionMakeWithDistance(v68, v45, v44);
  MKMapRectForCoordinateRegion();
  [v20 mapRectThatFits:];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  [v20 visibleMapRect];
  if (v58 <= v55) {
    double v60 = v55;
  }
  else {
    double v60 = v58;
  }
  if (v59 >= v57) {
    double v61 = v57;
  }
  else {
    double v61 = v59;
  }
  double v62 = v60 / v61;
  if (v62 <= 4.0 && v43)
  {
LABEL_23:
    if (!v6) {
      goto LABEL_25;
    }
LABEL_24:
    v64 = [(ActionCoordinator *)self searchPinsManager];
    v65 = [v64 customPOIsController];
    v66 = +[ParkedCar personalizedItemKey];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1006E8338;
    v67[3] = &unk_1012F58E8;
    v67[4] = self;
    [v65 customFeatureForKey:v66 completion:v67];

    goto LABEL_25;
  }
  if (v62 <= 4.0)
  {
    [v20 setCenterCoordinate:1 v22, v24];
    goto LABEL_23;
  }
  [v20 setVisibleMapRect:1 v51, v53, v55, v57];
  if (v6) {
    goto LABEL_24;
  }
LABEL_25:
  [(ParkedCarInfoCardViewController *)self->_parkedCarViewController performAction:a5];
}

- (void)viewController:(id)a3 selectDroppedPin:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 type] == 3)
  {
    id v8 = [(ActionCoordinator *)self mapSelectionManager];
    [v8 selectSearchResult:v7 animated:1];
  }
}

- (void)viewController:(id)a3 editLocationForParkedCar:(id)a4
{
}

- (void)viewController:(id)a3 removeMapsSuggestionsEntry:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 startBlock:(id)a7 completionBlock:(id)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1006E8914;
  v56[3] = &unk_1012F5960;
  id v22 = v20;
  id v58 = v22;
  id v23 = v18;
  id v57 = v23;
  id v24 = v21;
  id v59 = v24;
  double v25 = objc_retainBlock(v56);
  id v26 = [v23 availableRemovalBehaviors];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = sub_100103E9C;
  v54[4] = sub_1001047D8;
  id v55 = 0;
  uint64_t v27 = 0;
  switch((unint64_t)v26)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 2uLL:
      goto LABEL_3;
    case 4uLL:
    case 8uLL:
      uint64_t v27 = 1;
LABEL_3:
      ((void (*)(void *, id, uint64_t))v25[2])(v25, v26, v27);
      break;
    default:
      CGFloat v28 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "More than 1 removalBehavior present. Showing Action Sheet", buf, 2u);
      }

      CGFloat v41 = self;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      double v30 = [WeakRetained traitCollection];
      BOOL v31 = [v30 userInterfaceIdiom] == (id)5;

      double v32 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:v31];
      CLLocationDistance v44 = _NSConcreteStackBlock;
      uint64_t v45 = 3221225472;
      double v46 = sub_1006E8BD8;
      double v47 = &unk_1012F59B0;
      double v51 = v54;
      id v52 = v26;
      id v48 = v23;
      id v33 = v32;
      id v49 = v33;
      double v50 = v25;
      MapsSuggestionsRemovalBehaviorEnumerate();
      double v34 = +[NSBundle mainBundle];
      double v35 = [v34 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1006E8F68;
      v42[3] = &unk_1012E6E08;
      id v43 = v24;
      double v36 = +[UIAlertAction actionWithTitle:v35 style:1 handler:v42];
      [v33 addAction:v36];

      if (v19)
      {
        double v37 = [v33 popoverPresentationController];
        [v37 setSourceView:v19];

        CGFloat v38 = [v33 popoverPresentationController];
        [v38 setSourceRect:x, y, width, height];

        double v39 = [v33 popoverPresentationController];
        [v39 setPermittedArrowDirections:12];
      }
      double v40 = [(ActionCoordinator *)v41 containerViewController];
      [v40 _maps_topMostPresentViewController:v33 animated:1 completion:0];

      break;
  }
  _Block_object_dispose(v54, 8);
}

- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4
{
  id v6 = (RouteIncidentsViewController *)a3;
  id v7 = a4;
  if (self->_incidentsVC == v6
    || (RouteIncidentsViewController *)self->_routeStepsVC == v6
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_4:
    [(ActionCoordinator *)self closeRoutePlanningViewController:v6 withSender:v7];
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    if ((RouteIncidentsViewController *)self->_placeCardViewController == v6
      || (RouteIncidentsViewController *)self->_placeCardForRoutePlanningViewController == v6)
    {
      id v11 = [(ActionCoordinator *)self searchPinsManager];
      [v11 clearLinkedPlacesAndPolygon];

      id v12 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
      [v12 resetConfiguration];

      id v13 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
      [v13 cancelFetchingPlaceEnrichment];
    }
    if ((RouteIncidentsViewController *)self->_lineCardViewController != v6)
    {
      id v14 = [(TransitLineSelectionActionController *)self->_lineSelectionAction disambiguationVC];

      if (v14)
      {
        id v15 = [(ActionCoordinator *)self containerViewController];
        id v16 = [(TransitLineSelectionActionController *)self->_lineSelectionAction disambiguationVC];
        [v15 removeControllerFromStack:v16];
      }
    }
    id v17 = [(ActionCoordinator *)self venueCardCoordinator];
    id v18 = [v17 topViewController];

    if (v18 == v6)
    {
      [(ActionCoordinator *)self closeVenueViewController:v6];
      goto LABEL_5;
    }
    if ((RouteIncidentsViewController *)self->_placeCardViewController == v6)
    {
      id v20 = +[UIDevice currentDevice];
      if ([v20 userInterfaceIdiom] == (id)5)
      {
      }
      else
      {
        unsigned int v23 = [(SearchSessionManager *)self->_searchSessionManager singleResultMode];

        if (v23) {
          [(ActionCoordinator *)self clearSearch];
        }
      }
      id v24 = +[UIDevice currentDevice];
      if ([v24 userInterfaceIdiom] == (id)5)
      {
      }
      else
      {
        double v25 = [(ActionCoordinator *)self currentSearchSession];
        unsigned int v26 = [v25 isSingleResultToShowAsPlacecard];

        if (v26) {
          [(ActionCoordinator *)self clearSearch];
        }
      }
      uint64_t v27 = [(ActionCoordinator *)self containerViewController];
      CGFloat v28 = [v27 chromeViewController];
      [v28 setNeedsUpdateComponent:@"lookAroundButton" animated:1];
    }
    else
    {
      if ((RouteIncidentsViewController *)self->_placeCardForRoutePlanningViewController == v6)
      {
        [(ActionCoordinator *)self _setRouteSelectionMapState];
        id v21 = [(ActionCoordinator *)self containerViewController];
        [v21 popLastViewControllerFromViewController:v6 animated:1 useDefaultContaineeLayout:0];

        dispatch_time_t v22 = dispatch_time(0, 250000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1006E95CC;
        block[3] = &unk_1012E5D08;
        block[4] = self;
        dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
        goto LABEL_5;
      }
      if ((RouteIncidentsViewController *)self->_routePlanningOverviewViewController == v6) {
        goto LABEL_4;
      }
      if ((RouteIncidentsViewController *)self->_autosharingVC == v6)
      {
        BOOL v31 = [(PlatformController *)self->_platformController currentSession];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v32 = v31;
        }
        else {
          double v32 = 0;
        }
        id v33 = v32;

        double v29 = [(SharedTripAutosharingContaineeViewController *)self->_autosharingVC contacts];
        [v33 setAutomaticSharingContacts:v29];

        goto LABEL_40;
      }
      if ((RouteIncidentsViewController *)self->_lineCardViewController == v6
        || (RouteIncidentsViewController *)self->_lineCardForRoutePlanningViewController == v6)
      {
        [(TransitLineSelectionActionController *)self->_lineSelectionAction deactivateWithContext:0];
        goto LABEL_5;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(ActionCoordinator *)self closeVenueFloorCardViewController:v6];
        goto LABEL_5;
      }
      if ((RouteIncidentsViewController *)self->_simpleListResultsVC != v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v34 = [(ActionCoordinator *)self containerViewController];
          [v34 popLastViewControllerFromViewController:v6 animated:1 useDefaultContaineeLayout:0];

          [(ActionCoordinator *)self updateRouteAnnotations];
          goto LABEL_5;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v35 = [(ActionCoordinator *)self containerViewController];
          [v35 popLastViewControllerFromViewController:v6 animated:1 useDefaultContaineeLayout:0];

          double v30 = [(ActionCoordinator *)self searchPinsManager];
          [v30 clearSearchPins];
          goto LABEL_42;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (id)[(SearchViewController *)self->_searchModeViewController currentDataSourceType] == (id)1)
          {
            goto LABEL_41;
          }
          goto LABEL_58;
        }
        if (![(ResultsViewController *)self->_resultsViewController hasResults]) {
LABEL_58:
        }
          [(ActionCoordinator *)self clearSearch];
LABEL_41:
        double v30 = [(ActionCoordinator *)self containerViewController];
        [v30 popLastViewControllerFromViewController:v6 animated:1 useDefaultContaineeLayout:0];
LABEL_42:

        goto LABEL_5;
      }
    }
    double v29 = [(ActionCoordinator *)self mapSelectionManager];
    [v29 clearSelection];
LABEL_40:

    goto LABEL_41;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v9 = [WeakRetained _maps_mapsSceneDelegate];
  id v10 = [v9 topMostPresentedViewController];

  if ([(RouteIncidentsViewController *)v10 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol])
  {

    goto LABEL_9;
  }
  if (v10 != v6)
  {
    id v19 = [(RouteIncidentsViewController *)v6 presentedViewController];

    if (v19 == v10) {
      [(RouteIncidentsViewController *)v10 dismissViewControllerAnimated:1 completion:0];
    }
  }

LABEL_5:
}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v10];

  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v13 = sub_1000BBB44(WeakRetained);

    if (v13 != 5)
    {
      id v14 = +[NSNumber numberWithBool:[(ActionCoordinator *)self isRoutePlanningPresented]];
      [v11 setObject:v14 forKeyedSubscript:@"IsRoutePlanningPresented"];
    }
  }
  id v15 = sub_100576A04();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v9 title];
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    dispatch_time_t v22 = v16;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "doSearchItem viewController: %@ title: %@ userInfo: %@", (uint8_t *)&v19, 0x20u);
  }
  searchSessionManager = self->_searchSessionManager;
  id v18 = [(SearchViewController *)self->_searchModeViewController recentAutocompleteSessionData];
  [(SearchSessionManager *)searchSessionManager performSearchForSearchItem:v9 withUserInfo:v11 recentAutocompleteSessionData:v18];
}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5 refinementsQuery:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_100576A04();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v11 title];
    int v32 = 138412802;
    id v33 = v10;
    __int16 v34 = 2112;
    double v35 = v15;
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "doSearchItemWithRefinement viewController: %@ title: %@ userInfo: %@", (uint8_t *)&v32, 0x20u);
  }
  uint64_t v16 = [v12 objectForKeyedSubscript:@"ResultRefinementsBarSearch"];
  if (v16)
  {
    id v17 = (void *)v16;
    id v18 = [v12 objectForKeyedSubscript:@"AutoRedoSearch"];

    if (!v18)
    {
      int v19 = [(ActionCoordinator *)self searchPinsManager];
      [v19 clearSearchPins];
    }
  }
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    id v20 = [v11 completion];
    __int16 v21 = [v20 mapItem];
    dispatch_time_t v22 = [v21 _enrichmentInfo];

    if (v22)
    {
      placeEnrichmentAPIController = self->_placeEnrichmentAPIController;
      if (placeEnrichmentAPIController)
      {
        [(MUPlaceEnrichmentAPIController *)placeEnrichmentAPIController resetConfiguration];
        [(MUPlaceEnrichmentAPIController *)self->_placeEnrichmentAPIController cancelFetchingPlaceEnrichment];
      }
      id v24 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
      double v25 = self->_placeEnrichmentAPIController;
      self->_placeEnrichmentAPIController = v24;

      unsigned int v26 = self->_placeEnrichmentAPIController;
      uint64_t v27 = [v11 completion];
      CGFloat v28 = [v27 mapItem];
      double v29 = [(ActionCoordinator *)self newTraits];
      [(MUPlaceEnrichmentAPIController *)v26 configureWithMapItem:v28 traits:v29];

      [(MUPlaceEnrichmentAPIController *)self->_placeEnrichmentAPIController fetchPlaceEnrichment:0];
    }
  }
  searchSessionManager = self->_searchSessionManager;
  BOOL v31 = [(SearchViewController *)self->_searchModeViewController recentAutocompleteSessionData];
  [(SearchSessionManager *)searchSessionManager performSearchForSearchItem:v11 withUserInfo:v12 refinementsQuery:v13 recentAutocompleteSessionData:v31];
}

- (void)viewController:(id)a3 selectClientResolvedItem:(id)a4 fromSearchInfo:(id)a5 withUserInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    id v13 = [a6 mutableCopy];
  }
  else
  {
    id v13 = +[NSMutableDictionary dictionary];
  }
  id v14 = v13;
  [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ReuseSearchSession"];
  id v15 = [v14 copy];
  uint64_t v16 = objc_alloc_init(ClientTypeResolver);
  switch([v11 itemType])
  {
    case 1u:
    case 2u:
    case 6u:
      id v17 = [(ClientTypeResolver *)v16 personalizedItemSource];
      id v18 = [v11 itemType];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1006E9D28;
      v30[3] = &unk_1012F59D8;
      void v30[4] = self;
      id v31 = v15;
      [v17 addressOrLOIWithType:v18 completion:v30];

      int v19 = v31;
      goto LABEL_7;
    case 3u:
      id v20 = [(ClientTypeResolver *)v16 parkedCarSource];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1006E9E1C;
      v28[3] = &unk_1012F5740;
      v28[4] = self;
      id v29 = v10;
      [v20 objectWithCompletion:v28];

      int v19 = v29;
LABEL_7:

      goto LABEL_14;
    case 4u:
      __int16 v21 = [(ActionCoordinator *)self userLocationSearchResult];

      if (!v21) {
        goto LABEL_14;
      }
      dispatch_time_t v22 = [(ActionCoordinator *)self userLocationSearchResult];
      __int16 v23 = +[SearchFieldItem searchFieldItemWithObject:v22];

      [(ActionCoordinator *)self viewController:0 doSearchItem:v23 withUserInfo:v15];
      goto LABEL_13;
    case 5u:
      id v24 = [v11 resultIndex];
      __int16 v23 = [v12 results];
      if (v24 >= [v23 count]) {
        goto LABEL_13;
      }
      double v25 = [v12 results];
      uint64_t v26 = [v25 objectAtIndexedSubscript:[v11 resultIndex]];

      if (!v26) {
        goto LABEL_14;
      }
      uint64_t v27 = +[SearchFieldItem searchFieldItemWithObject:v26];
      [(ActionCoordinator *)self viewController:0 doSearchItem:v27 withUserInfo:v15];

      __int16 v23 = (void *)v26;
LABEL_13:

LABEL_14:
      return;
    default:
      goto LABEL_14;
  }
}

- (void)viewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 macPopoverPresentationController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1006E9F18;
    v9[3] = &unk_1012E6EA8;
    id v10 = v7;
    [v8 dismissAnimated:1 completion:v9];
  }
}

- (BOOL)_isBuildingMultipointRoute
{
  if (![(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v3 = [(RouteSearchViewController *)self->_routeSearchVC presentingViewController];

    if (!v3) {
      return 0;
    }
  }
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v4 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v5 = [v4 transportType];
  }
  else
  {
    id v5 = [self->_currentDirectionItem transportType];
  }
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v6 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v7 = [v6 waypointRequests];
    id v8 = [v7 count];
  }
  else
  {
    id v6 = [self->_currentDirectionItem items];
    id v8 = [v6 count];
  }

  BOOL result = 0;
  switch((unint64_t)v5)
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_13;
      }
      BOOL result = 1;
      break;
    case 1uLL:
      BOOL result = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      break;
    case 2uLL:
LABEL_13:
      BOOL result = MapsFeature_IsEnabled_Maps182();
      break;
    case 5uLL:
      BOOL result = MapsFeature_IsEnabled_Maps420();
      break;
    default:
      break;
  }
  if (!v8) {
    return 0;
  }
  return result;
}

- (BOOL)shouldAddStopInRoutePlanning
{
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v3 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    unsigned __int8 v4 = [v3 canAddStop];
  }
  else
  {
    unsigned __int8 v4 = [self->_currentDirectionItem canAddStop];
  }
  if (![(ActionCoordinator *)self _isBuildingMultipointRoute]
    && ![(ActionCoordinator *)self isPresentingAddStopSearchResults])
  {
    return 0;
  }
  return v4;
}

- (void)toggleRoutePlanning
{
  id v3 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  unsigned int v4 = [v3 isSuspended];

  id v5 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  id v9 = v5;
  if (v4)
  {
    [v5 resume];
LABEL_5:

    return;
  }
  unsigned int v6 = [v5 isEnabled];

  if (v6)
  {
    id v9 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    [v9 suspend];
    goto LABEL_5;
  }
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    [(ActionCoordinator *)self _exitRoutePlanningIfNeededAnimated:1 restoreStashedMapSelection:1];
  }
  else
  {
    [(ActionCoordinator *)self routeSearchVC];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1006EA27C;
    v10[3] = &unk_1012E7D28;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v11;
    id v8 = objc_retainBlock(v10);
    [(ActionCoordinator *)self _enterRoutePlanningOverviewAnimated:1 completion:v8];
  }
}

- (void)dismissRoutePlanningPlaceCardIfNeeded
{
  if (![(ActionCoordinator *)self isRoutePlanningPresented]) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v4 = sub_1000BBB44(WeakRetained);
  uint64_t v5 = 24;
  if (v4 == 5) {
    uint64_t v5 = 16;
  }
  id v15 = *(id *)((char *)&self->super.isa + v5);

  id v6 = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v7 = [v6 currentViewController];
  if (!v7)
  {

    goto LABEL_12;
  }
  id v8 = (void *)v7;
  id v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v10 = [v9 currentViewController];

  id v11 = v15;
  if (v10 == v15)
  {
    id v12 = [(ActionCoordinator *)self mapSelectionManager];
    [v12 clearSelectionAnimated:1];

    id v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
    if (sub_1000BBB44(v13) != 5)
    {

      goto LABEL_12;
    }
    id v14 = [(ActionCoordinator *)self currentSearchSession];

    id v11 = v15;
    if (v14)
    {
      [(ActionCoordinator *)self clearSearch];
LABEL_12:
      id v11 = v15;
    }
  }
}

- (void)viewController:(id)a3 doDirectionIntent:(id)a4 withSearchResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(DirectionIntentItemProvider);
  int v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  __int16 v21 = sub_1006EA540;
  dispatch_time_t v22 = &unk_1012F5A00;
  __int16 v23 = self;
  id v12 = v8;
  id v24 = v12;
  [(DirectionIntentItemProvider *)v11 directionItemWithDirectionIntent:v10 searchResults:v9 completion:&v19];

  int Card = -[ContainerViewController delaysFirstCardPresentation]_0();
  id v14 = [(ActionCoordinator *)self containerViewController];
  id v15 = v14;
  if (!Card)
  {
    p_resultsViewController = &self->_resultsViewController;
    goto LABEL_5;
  }
  uint64_t v16 = [v14 currentViewController];
  p_resultsViewController = &self->_resultsViewController;
  resultsViewController = self->_resultsViewController;

  if (v16 != resultsViewController)
  {
    id v15 = [(ActionCoordinator *)self containerViewController];
LABEL_5:
    [v15 removeControllerFromStack:*p_resultsViewController];
  }
}

- (void)viewController:(id)a3 doDirectionIntentWithLocalSearchCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(DirectionIntentItemProvider);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1006EA6C8;
  v10[3] = &unk_1012F5A00;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(DirectionIntentItemProvider *)v8 directionItemWithLocalSearchCompletion:v7 completion:v10];
}

- (void)viewController:(id)a3 doDirectionItem:(id)a4 withUserInfo:(id)a5
{
}

- (void)viewController:(id)a3 addStopForSearchResult:(id)a4 withUserInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[SearchFieldItem searchFieldItemWithObject:a4];
  [(ActionCoordinator *)self viewController:v9 addStopForSearchFieldItem:v10 withUserInfo:v8];
}

- (void)viewController:(id)a3 addStopForSearchFieldItem:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ActionCoordinator *)self isRoutePlanningPresented]
    || ([(RouteSearchViewController *)self->_routeSearchVC presentingViewController],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v12 = (void *)v11,
        [(RouteSearchViewController *)self->_routeSearchVC dataCoordinator],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    id v14 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v15 = [v14 directionItemForCurrentSession];

    uint64_t v16 = [v15 items];
    id v17 = +[NSMutableArray arrayWithArray:v16];

    uint64_t v18 = [(RouteSearchViewController *)self->_routeSearchVC presentingViewController];
    if (v18
      && (int v19 = (void *)v18,
          unint64_t v20 = [(RouteSearchViewController *)self->_routeSearchVC _currentlySelectedIndexForAddStop], v19, v20 != 0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_12:
      id v21 = [v17 count];
      dispatch_time_t v22 = sub_1005768D4();
      __int16 v23 = v22;
      if (v20 >= (unint64_t)v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v24 = [v17 count];
          id v25 = [v15 transportType];
          CFStringRef v26 = @"NO";
          switch((unint64_t)v25)
          {
            case 0uLL:
              if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0
                && (MapsFeature_IsEnabled_Maps420() & 1) == 0
                && !MapsFeature_IsEnabled_Maps182())
              {
                goto LABEL_31;
              }
              goto LABEL_33;
            case 1uLL:
              if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0) {
                goto LABEL_31;
              }
              goto LABEL_33;
            case 2uLL:
              if (MapsFeature_IsEnabled_Maps182()) {
                goto LABEL_33;
              }
              goto LABEL_31;
            case 5uLL:
              if (MapsFeature_IsEnabled_Maps420()) {
LABEL_33:
              }
                CFStringRef v26 = @"YES";
              else {
LABEL_31:
              }
                CFStringRef v26 = @"NO";
              break;
            default:
              break;
          }
          int v34 = 134218498;
          unint64_t v35 = v20;
          __int16 v36 = 2048;
          id v37 = v24;
          __int16 v38 = 2112;
          CFStringRef v39 = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Will not add or replace stop, index out of bounds (%lu/%lu) or not permitted (mpr permitted: %@)", (uint8_t *)&v34, 0x20u);
        }
        goto LABEL_35;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v34 = 134217984;
        unint64_t v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Performing fresh directions with replaced stop at index %lu", (uint8_t *)&v34, 0xCu);
      }

      [v17 replaceObjectAtIndex:v20 withObject:v9];
    }
    else
    {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      switch((unint64_t)[v15 transportType])
      {
        case 0uLL:
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0
            && (MapsFeature_IsEnabled_Maps420() & 1) == 0
            && !MapsFeature_IsEnabled_Maps182())
          {
            goto LABEL_12;
          }
          break;
        case 1uLL:
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0) {
            goto LABEL_12;
          }
          break;
        case 2uLL:
          if ((MapsFeature_IsEnabled_Maps182() & 1) == 0) {
            goto LABEL_12;
          }
          break;
        case 5uLL:
          if ((MapsFeature_IsEnabled_Maps420() & 1) == 0) {
            goto LABEL_12;
          }
          break;
        default:
          goto LABEL_12;
      }
      uint64_t v27 = sub_1005768D4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Performing fresh directions with added stop", (uint8_t *)&v34, 2u);
      }

      [v17 addObject:v9];
    }
    CGFloat v28 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v29 = [v28 transportType];

    double v30 = [DirectionItem alloc];
    id v31 = [v17 copy];
    __int16 v23 = [(DirectionItem *)v30 initWithItems:v31 transportType:v29];

    id v32 = [v10 mutableCopy];
    [v32 setObject:0 forKeyedSubscript:@"AppendDirectionItem"];
    id v33 = [v32 copy];
    [(ActionCoordinator *)self viewController:v8 doDirectionItem:v23 withUserInfo:v33];

    [(ActionCoordinator *)self clearSearch];
LABEL_35:

    goto LABEL_36;
  }
  [(RouteSearchViewController *)self->_routeSearchVC replaceSelectedFieldWithItem:v9];
LABEL_36:
}

- (void)viewController:(id)a3 doDirectionItem:(id)a4 allowToPromptEditing:(BOOL)a5 withUserInfo:(id)a6
{
  BOOL v7 = a5;
  id v10 = (RouteSearchViewController *)a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 items];
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v14 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v15 = [v14 directionItemForCurrentSession];

    if (!v15) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = self->_currentDirectionItem;
    if (!v15)
    {
LABEL_7:
      if (([v11 isEquivalentAsWaypointToDirectionItem:v15] & 1) == 0)
      {
        [(MKLocationManagerOperation *)self->_locationUpdateOperationForRouting cancel];
        unint64_t v20 = (DirectionItem *)[v11 copy];
        currentDirectionItem = self->_currentDirectionItem;
        self->_currentDirectionItem = v20;

        if ([self->_currentDirectionItem isVenueItem])
        {
          if (![(ActionCoordinator *)self isRoutePlanningPresented])
          {
            dispatch_time_t v22 = [(ActionCoordinator *)self venueCardCoordinator];
            [v22 pushVenueCardItem:self->_currentDirectionItem source:4];

            __int16 v23 = [(ActionCoordinator *)self searchPinsManager];
            [v23 clearLinkedPlacesAndPolygon];
          }
        }
      }
      if ([v13 count] == (id)1)
      {
        id v24 = [v12 objectForKeyedSubscript:@"AppendDirectionItem"];
        unsigned __int8 v25 = [v24 BOOLValue];

        if ((v25 & 1) == 0)
        {
          CFStringRef v26 = sub_1005768D4();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v13 firstObject];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "DirectionItem unexpectedly had only 1 waypoint: %@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v70 = 0x2020000000;
      BOOL v71 = 0;
      BOOL v71 = (unint64_t)[v13 count] > 1;
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_1006EB4E0;
      v64[3] = &unk_1012F2B68;
      id v65 = v13;
      p_long long buf = &buf;
      [v65 enumerateObjectsUsingBlock:v64];
      CGFloat v28 = [v11 persistentData];
      if (v28)
      {
        id v29 = [v11 persistentData];
        BOOL v30 = ((unint64_t)[v29 source] & 0xFFFFFFFFFFFFFFFELL) == 2;
      }
      else
      {
        BOOL v30 = 0;
      }

      if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
        char v31 = v30;
      }
      else {
        char v31 = 1;
      }
      if ((v31 & 1) == 0)
      {
        __int16 v36 = +[NSBundle mainBundle];
        id v37 = [v36 localizedStringForKey:@"Cannot Provide Directions" value:@"localized string not found" table:0];
        __int16 v38 = +[NSBundle mainBundle];
        CFStringRef v39 = [v38 localizedStringForKey:@"Cannot get directions to and from the same location." value:@"localized string not found" table:0];
        [(ActionCoordinator *)self displayAlertWithTitle:v37 message:v39 postAlertSearchType:2];

LABEL_62:
        _Block_object_dispose(&buf, 8);
        goto LABEL_63;
      }
      id v32 = [v12 objectForKeyedSubscript:@"AllowApproximateCurrentLocation"];
      [v11 setAllowApproximateUserLocation:v32];

      uint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
      id v33 = [v11 editRequired:&v63];
      id v34 = v33;
      if (!v7 || !v33)
      {
        if (v33)
        {
          double v40 = +[NSBundle mainBundle];
          CGFloat v41 = [v40 localizedStringForKey:@"Cannot Provide Directions" value:@"localized string not found" table:0];

          [(ActionCoordinator *)self displayAlertWithTitle:v41 message:0 postAlertSearchType:2];
        }
        else
        {
          int64_t v42 = [self->_currentDirectionItem transportType];
          id v43 = sub_1005768D4();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            if ((unint64_t)(v42 - 1) > 4) {
              CFStringRef v44 = @"Undefined";
            }
            else {
              CFStringRef v44 = *(&off_1012F5E68 + v42 - 1);
            }
            *(_DWORD *)v67 = 138412290;
            CFStringRef v68 = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Initial transport type from direction item: %@", v67, 0xCu);
          }

          if (v42)
          {
            if (v42 == 4)
            {
              if (sub_10008034C())
              {
                int64_t v42 = 4;
              }
              else
              {
                id v49 = sub_1005768D4();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v67 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Detected rideshare transport type when ride booking is not enabled; changing to driving",
                    v67,
                    2u);
                }

                int64_t v42 = 1;
              }
            }
            double v50 = +[MapsSuggestionsPredictor sharedPredictor];
            double v51 = v50;
            if ((unint64_t)(v42 - 1) > 4) {
              uint64_t v52 = 4;
            }
            else {
              uint64_t v52 = dword_100F71B50[v42 - 1];
            }
            [v50 capturePredictedTransportationMode:v52];
          }
          [self->_currentDirectionItem setTransportType:v42];
          self->_visibleViewModeBeforeDoingDirectionItem = [(ActionCoordinator *)self displayedViewMode];
          CGFloat v41 = [v12 objectForKeyedSubscript:@"GEOMapServiceTraits"];
          if (!v41) {
            CGFloat v41 = [(ActionCoordinator *)self newTraits];
          }
          double v53 = [v12 objectForKeyedSubscript:@"GEOMapServiceTraits_Source"];

          if (v53)
          {
            double v54 = [v12 objectForKeyedSubscript:@"GEOMapServiceTraits_Source"];
            -[GEOMapServiceTraits setSource:](v41, "setSource:", [v54 integerValue]);
          }
          id v55 = [v12 mutableCopy];
          double v56 = [v12 objectForKeyedSubscript:@"DirectionsSourceKey"];
          BOOL v57 = [v56 integerValue] == (id)5;

          if (v57)
          {
            BOOL v58 = 1;
          }
          else if (v10)
          {
            BOOL v58 = self->_routeSearchVC == v10;
          }
          else
          {
            BOOL v58 = 0;
          }
          id v59 = +[NSNumber numberWithBool:v58];
          [v55 setObject:v59 forKeyedSubscript:@"DisableNotReachableErrorInRoutePlanning"];

          double v60 = [(ActionCoordinator *)self routePlanningDataCoordinator];
          double v61 = self->_currentDirectionItem;
          id v62 = [v55 copy];
          [v60 startWithDirectionItem:v61 traits:v41 userInfo:v62];
        }
        goto LABEL_62;
      }
      if (v33 == (id)3)
      {
        unint64_t v35 = [v12 objectForKeyedSubscript:@"GEOMapServiceTraits_Source"];
        if ([v35 integerValue] == (id)1)
        {

          goto LABEL_35;
        }
        uint64_t v45 = [v12 objectForKeyedSubscript:@"DirectionsSourceKey"];
        BOOL v46 = [v45 integerValue] == (id)2;

        if (v46)
        {
LABEL_35:
          double v47 = [v12 objectForKeyedSubscript:@"AllowApproximateCurrentLocation"];
          BOOL v48 = v47 == 0;

          if (v48)
          {
            [(ActionCoordinator *)self _promptForCurrentLocationConfirmationWithDirectionItem:v11 userInfo:v12];
            goto LABEL_62;
          }
        }
      }
      [(ActionCoordinator *)self _promptForEditRequired:v34 forWaypointAtIndex:v63 inDirectionItem:v11 userInfo:v12];
      goto LABEL_62;
    }
  }
  uint64_t v16 = [v12 objectForKeyedSubscript:@"AppendDirectionItem"];
  unsigned int v17 = [v16 BOOLValue];

  if (!v17) {
    goto LABEL_7;
  }
  uint64_t v18 = [v11 items];
  int v19 = [v18 firstObject];

  [(ActionCoordinator *)self viewController:v10 addStopForSearchFieldItem:v19 withUserInfo:v12];
LABEL_63:
}

- (void)_promptForCurrentLocationConfirmationWithDirectionItem:(id)a3 userInfo:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  BOOL v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Get Directions from Approximate Location" value:@"localized string not found" table:0];
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"Your current location can’t be used by Maps because of your privacy settings." value:@"localized string not found" table:0];
  id v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Use Approximate Location" value:@"localized string not found" table:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  id v34[2] = sub_1006EB8E4;
  v34[3] = &unk_1012F5A28;
  id v14 = v6;
  id v35 = v14;
  __int16 v36 = self;
  id v15 = v11;
  id v37 = v15;
  id v16 = v28;
  id v38 = v16;
  unsigned int v17 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v34];

  [v15 addAction:v17];
  uint64_t v18 = +[NSBundle mainBundle];
  int v19 = [v18 localizedStringForKey:@"Choose Location" value:@"localized string not found" table:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1006EB978;
  v29[3] = &unk_1012F5A28;
  id v30 = v14;
  char v31 = self;
  id v32 = v15;
  id v33 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  __int16 v23 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v29];

  [v21 addAction:v23];
  id v24 = +[NSBundle mainBundle];
  unsigned __int8 v25 = [v24 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
  CFStringRef v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:0];

  [v21 addAction:v26];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained _maps_topMostPresentViewController:v21 animated:1 completion:0];
}

- (void)_promptForEditRequired:(unint64_t)a3 forWaypointAtIndex:(unint64_t)a4 inDirectionItem:(id)a5 userInfo:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (!a3) {
    goto LABEL_20;
  }
  id v12 = [(ActionCoordinator *)self containerViewController];
  uint64_t v13 = sub_1000BBB44(v12);

  if (v13 == 5)
  {
    [(ActionCoordinator *)self _presentMacRouteEditingWithEditRequired:a3 index:a4];
    goto LABEL_20;
  }
  if (a3 - 2 < 2)
  {
    unsigned __int8 v17 = [v10 hasCurrentLocationOnlyAsOriginWaypoint];
    id v14 = +[NSBundle mainBundle];
    id v15 = v14;
    if (v17) {
      CFStringRef v16 = @"Choose Start";
    }
    else {
      CFStringRef v16 = @"Set Current Location";
    }
    goto LABEL_13;
  }
  if (a3 == 4)
  {
    id v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"Choose Destination";
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    id v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"Choose Start";
LABEL_13:
    uint64_t v18 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:0];

    goto LABEL_14;
  }
  uint64_t v18 = 0;
LABEL_14:
  uint64_t v35 = 0;
  __int16 v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_100103E9C;
  CFStringRef v39 = sub_1001047D8;
  id v40 = 0;
  int v19 = [RouteSearchViewController alloc];
  id v20 = [v10 items];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1006EBDC0;
  v29[3] = &unk_1012F5A78;
  void v29[4] = self;
  id v32 = &v35;
  id v30 = v10;
  unint64_t v33 = a3;
  unint64_t v34 = a4;
  id v31 = v11;
  id v21 = [(RouteSearchViewController *)v19 initWithDelegate:self items:v20 waypointIndex:a4 selectionHandler:v29];
  id v22 = (void *)v36[5];
  void v36[5] = (uint64_t)v21;

  [(id)v36[5] setTitle:v18];
  objc_storeStrong((id *)&self->_routeSearchVC, (id)v36[5]);
  if ([(id)v36[5] modalPresentationStyle] == (id)7)
  {
    __int16 v23 = [(id)v36[5] popoverPresentationController];
    id v24 = [v23 delegate];

    if (!v24)
    {
      unsigned __int8 v25 = [(id)v36[5] popoverPresentationController];
      [v25 setDelegate:self];
    }
    CFStringRef v26 = [(ActionCoordinator *)self containerViewController];
    [v26 _maps_topMostPresentViewController:v36[5] animated:1 completion:0];
  }
  else
  {
    CFStringRef v26 = [(ActionCoordinator *)self containerViewController];
    uint64_t v27 = v36[5];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1006EC00C;
    v28[3] = &unk_1012F5AA0;
    v28[4] = &v35;
    void v28[5] = a4;
    [v26 presentController:v27 animated:1 completion:v28];
  }

  _Block_object_dispose(&v35, 8);
LABEL_20:
}

- (void)viewController:(id)a3 enterRouteCreationWith:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v6];

  id v8 = [v9 buildRoute];
  [(ActionCoordinator *)self viewController:v7 enterRouteCreationWithRoute:v8 withUserInfo:0];
}

- (void)viewController:(id)a3 enterRouteCreationWithRoute:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(ActionCoordinator *)self newTraits];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_1006EC250;
  v18[3] = &unk_1012E9860;
  id v12 = v9;
  id v19 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006EC334;
  v15[3] = &unk_1012F5AC8;
  objc_copyWeak(&v17, &location);
  id v13 = v10;
  id v16 = v13;
  id v14 = [v12 _maps_convertToNavigableRouteWithTraits:v11 errorHandler:v18 completionHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)viewControllerDoLastDirectionItem:(id)a3
{
}

- (void)viewController:(id)a3 selectLastDirectionsDestinationComposedWaypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  currentDirectionItem = self->_currentDirectionItem;
  if (currentDirectionItem)
  {
    id v9 = [currentDirectionItem items];
    id v10 = [v9 count];

    if ((unint64_t)v10 < 3)
    {
      if (v7)
      {
        id v13 = [[SearchResult alloc] initWithComposedWaypoint:v7];
      }
      else
      {
        id v14 = [self->_currentDirectionItem items];
        id v15 = [v14 lastObject];

        id v16 = [v15 waypoint];
        id v13 = [v16 pin];
      }
      id v17 = sub_10000AF10();
      uint64_t v18 = v17;
      if (v13)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Asked to select destination for last direction item: %@", (uint8_t *)&buf, 0xCu);
        }

        id v19 = [(ActionCoordinator *)self searchPinsManager];
        [v19 clearDirectionsPins];

        id v20 = [(ActionCoordinator *)self containerViewController];
        BOOL v21 = sub_1000BBB44(v20) == 5;

        if (v21)
        {
          uint64_t v18 = +[SearchFieldItem searchFieldItemWithObject:v13];
          [(ActionCoordinator *)self viewController:0 doSearchItem:v18 withUserInfo:0];
        }
        else
        {
          id v24 = [(ActionCoordinator *)self searchPinsManager];
          unsigned int v25 = [v24 canSelectPin:v13];

          CFStringRef v26 = [(ActionCoordinator *)self searchPinsManager];
          uint64_t v27 = v26;
          if (v25)
          {
            [v26 selectAndShowSearchResult:v13 animated:1];
          }
          else
          {
            uint64_t v45 = v13;
            id v28 = +[NSArray arrayWithObjects:&v45 count:1];
            [v27 setSearchPins:v28 selectedPin:v13 animated:1];
          }
          id v29 = +[MKLocationManager sharedLocationManager];
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v43 = 0x2020000000;
          char v44 = 0;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1006EC8BC;
          v37[3] = &unk_1012F5AF0;
          p_long long buf = &buf;
          uint64_t v18 = v29;
          id v38 = v18;
          CFStringRef v39 = v13;
          id v40 = self;
          id v30 = objc_retainBlock(v37);
          id v31 = [v18 lastLocation];

          if (v31)
          {
            ((void (*)(void *))v30[2])(v30);
          }
          else
          {
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_1006ECA1C;
            v35[3] = &unk_1012F1628;
            id v32 = v30;
            id v36 = v32;
            unint64_t v33 = [v18 singleLocationUpdateWithHandler:v35];
            [v33 start];
            dispatch_time_t v34 = dispatch_time(0, 3000000000);
            dispatch_after(v34, (dispatch_queue_t)&_dispatch_main_q, v32);
          }
          _Block_object_dispose(&buf, 8);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v22 = [self->_currentDirectionItem items];
        __int16 v23 = [v22 lastObject];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Asked to select destination for last direction item, but could not create SearchResult from item: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v11 = sub_10000AF10();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Asked to select destination for last direction item, but it was MPR so popping to Home instead", (uint8_t *)&buf, 2u);
      }

      [(ActionCoordinator *)self viewControllerPresentSearchEndEditing];
    }
  }
  else
  {
    id v12 = sub_10000AF10();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Asked to select destination for last direction item, but no direction item found", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)viewControllerOpenNearby:(id)a3 animated:(BOOL)a4
{
  [(ActionCoordinator *)self presentSearchAnimated:a4];
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 searchBarBecomeFirstResponder];
}

- (void)viewControllerOpenSettings:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v6 = [WeakRetained chromeViewController];
  id v7 = objc_loadWeakRetained((id *)p_containerViewController);
  id v8 = [v7 chromeContext];
  unsigned int v9 = [v6 isTopContext:v8];

  if (v9)
  {
    [(ActionCoordinator *)self _cancelUserInteractions];
    id v10 = [(ActionCoordinator *)self mapView];
    [v10 setCompassEnabled:0];

    id v11 = objc_loadWeakRetained((id *)p_containerViewController);
    id v12 = [(ActionCoordinator *)self settingsViewController];
    [v11 _maps_topMostPresentViewController:v12 animated:1 completion:0];

    id v13 = objc_loadWeakRetained((id *)p_containerViewController);
    [v13 setUseBackdropFullScreen:1];

    id v14 = +[MKMapService sharedService];
    [v14 captureUserAction:5001 onTarget:[ActionCoordinator currentMapViewTargetForAnalytics] eventValue:0];
  }
}

- (void)viewControllerCloseSettingsTip:(id)a3
{
  id v4 = [(ActionCoordinator *)self settingsController];
  id v3 = [v4 settingsTipController];
  [v3 settingsTipClosed];
}

- (void)viewController:(id)a3 startNavigationWithRouteCollection:(id)a4 navigationDetailsOptions:(NavigationDetailsOptions *)a5
{
  id v7 = a4;
  id v8 = [(ActionCoordinator *)self searchSessionManager];
  unsigned int v9 = [v8 currentSearchSession];
  [v9 resetEVChargerTimers];

  id v10 = [(ActionCoordinator *)self appCoordinator];
  long long v11 = *(_OWORD *)&a5->guidanceType;
  v12[0] = *(_OWORD *)&a5->shouldSimulateLocations;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a5->isReconnecting;
  unint64_t navigationModeContext = a5->navigationModeContext;
  [v10 startNavigationWithRouteCollection:v7 navigationDetailsOptions:v12];
}

- (void)viewController:(id)a3 startRideBookingSessionWithRideBookingRideOption:(id)a4
{
  id v5 = a4;
  [(ActionCoordinator *)self setIsRoutePlanningPresented:0];
  id v6 = [(ActionCoordinator *)self appCoordinator];
  [v6 startRideBookingSessionWithRideBookingRideOption:v5];
}

- (void)viewController:(id)a3 continueRideBookingSessionWithApplicationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self appCoordinator];
  [v6 continueRideBookingSessionWithApplicationIdentifier:v5];
}

- (void)viewController:(id)a3 removeDroppedPin:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (!v13)
  {
    id v7 = [(ActionCoordinator *)self currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unsigned int v9 = [(ActionCoordinator *)self currentViewController];
      id v10 = [v9 placeCardItem];
      unsigned int v11 = [v10 isDroppedPin];

      if (v11)
      {
        uint64_t v12 = [(ActionCoordinator *)self currentViewController];
      }
      else
      {
        uint64_t v12 = 0;
      }
      id v13 = (id)v12;
    }
    else
    {
      id v13 = 0;
    }
  }
  [(ActionCoordinator *)self deleteMarkedLocation:v6];
  [(ActionCoordinator *)self viewControllerClosed:v13 animated:1];
}

- (void)viewController:(id)a3 createDroppedPin:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  if ([v8 hasFloorOrdinal]) {
    uint64_t v7 = (uint64_t)[v8 floorOrdinal];
  }
  else {
    uint64_t v7 = 0x7FFFFFFFLL;
  }
  [v8 coordinate];
  -[ActionCoordinator viewController:createMarkedLocationAtCoordinate:floorOrdinal:](self, "viewController:createMarkedLocationAtCoordinate:floorOrdinal:", v6, v7);
}

- (void)viewController:(id)a3 createMarkedLocationAtCoordinate:(CLLocationCoordinate2D)a4 floorOrdinal:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v17 = a3;
  unsigned int v9 = +[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", v5, latitude, longitude);
  id v10 = [(ActionCoordinator *)self containerViewController];
  unsigned int v11 = [v10 chromeViewController];
  uint64_t v12 = [v11 customSearchManager];
  id v13 = [(ActionCoordinator *)self containerViewController];
  id v14 = [v13 chromeViewController];
  id v15 = [v14 mapView];
  [v12 setCustomSearchResult:v9 animated:1 shouldSelectOnMap:v15];

  if (v9)
  {
    id v16 = [(ActionCoordinator *)self searchPinsManager];
    [v16 setDroppedPin:v9 animated:1 shouldSelect:1];

    [(ActionCoordinator *)self viewController:v17 selectSearchResult:v9 addToHistory:0 source:3 saveSelectionState:1];
  }
}

- (void)viewController:(id)a3 editLocationOfMarkedLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[MarkedLocationRefinementViewController alloc] initWithMarkedLocation:v7];

  [(LocationRefinementViewController *)v8 setDelegate:self];
  [(MarkedLocationRefinementViewController *)v8 setOriginalPresenterViewController:v6];
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1006ED240;
  id v17 = &unk_1012E5D58;
  uint64_t v18 = self;
  id v10 = v9;
  id v19 = v10;
  unsigned int v11 = objc_retainBlock(&v14);
  if (sub_1000BBB44(v6) == 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = v6;
    id v13 = [v12 placeCardDelegate:v14, v15, v16, v17, v18];
    [v13 placeCardViewController:v12 dismissAnimated:1 completion:v11];
  }
  else
  {
    ((void (*)(void ***))v11[2])(v11);
  }
}

- (void)viewController:(id)a3 displayStoreViewControllerForAppWithiTunesIdentifier:(id)a4 clientIdentifier:(id)a5
{
  if (a4)
  {
    id v7 = (__CFString *)a5;
    id v8 = a4;
    id v9 = objc_alloc_init((Class)SKStoreProductViewController);
    [v9 setDelegate:self];
    if (v7) {
      CFStringRef v10 = v7;
    }
    else {
      CFStringRef v10 = &stru_101324E70;
    }
    [v9 setClientIdentifier:v10];

    id v14 = SKStoreProductParameterITunesItemIdentifier;
    id v15 = v8;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    [v9 loadProductWithParameters:v11 completionBlock:&stru_1012F5B30];
    id v12 = [(ActionCoordinator *)self containerViewController];
    id v13 = [v12 chromeViewController];
    [v13 _maps_topMostPresentViewController:v9 animated:1 completion:0];
  }
}

- (void)viewController:(id)a3 doShareSheetForShareItem:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(ActionCoordinator *)self appCoordinator];
  unsigned int v11 = [v10 view];

  [v12 shareItem:v9 sourceView:v11 completion:v8];
}

- (void)viewController:(id)a3 doAudioCallToSearchResult:(id)a4
{
  id v5 = a4;
  id v6 = [v5 mapItem];
  id v7 = [v6 phoneNumber];

  if (v7 && (id v8 = [(NSString *)v7 length]) != 0)
  {
    sub_1006ED724(v8, v7);
  }
  else if ([v5 isAddressBookResult])
  {
    id v9 = [v5 address];
    id v10 = [v9 contact];

    unsigned int v11 = [v10 phoneNumbers];
    id v12 = [v11 count];

    id v13 = [v10 phoneNumbers];
    id v14 = [v13 count];

    if (v12 == (id)1)
    {
      id v15 = [v10 phoneNumbers];
      id v16 = [v15 lastObject];
      id v17 = [v16 value];

      uint64_t v18 = [v17 stringValue];
      sub_1006ED724(v18, (NSString *)v18);
    }
    else if ((unint64_t)v14 >= 2)
    {
      id v19 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
      id v20 = [v10 phoneNumbers];
      uint64_t v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      id v29 = sub_1006ED78C;
      id v30 = &unk_1012F5B98;
      id v31 = v19;
      id v32 = &stru_1012F5B70;
      id v21 = v19;
      [v20 enumerateObjectsUsingBlock:&v27];

      id v22 = +[NSBundle mainBundle];
      __int16 v23 = [v22 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
      id v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:0];
      [v21 addAction:v24];

      unsigned int v25 = [(ActionCoordinator *)self containerViewController];
      CFStringRef v26 = [v25 chromeViewController];
      [v26 _maps_topMostPresentViewController:v21 animated:1 completion:0];
    }
  }
}

- (void)viewController:(id)a3 openWebsiteForSearchResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1006EDC80;
  v35[3] = &unk_1012F5BC0;
  void v35[4] = self;
  id v8 = v6;
  id v36 = v8;
  id v9 = objc_retainBlock(v35);
  id v10 = [v7 mapItem];
  unsigned int v11 = [v10 url];

  if (!v11)
  {
    if (![v7 isAddressBookResult]) {
      goto LABEL_10;
    }
    id v12 = [v7 address];
    id v13 = [v12 contact];

    id v14 = [v13 urlAddresses];
    id v15 = [v14 count];

    id v16 = [v13 urlAddresses];
    id v17 = [v16 count];

    if (v15 == (id)1)
    {
      uint64_t v18 = [v13 urlAddresses];
      id v19 = [v18 lastObject];
      id v20 = [v19 value];
      id v21 = +[NSURL URLWithString:v20];

      ((void (*)(void *, id))v9[2])(v9, v21);
    }
    else
    {
      if ((unint64_t)v17 < 2)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v22 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
      __int16 v23 = [v13 urlAddresses];
      id v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      id v31 = sub_1006EDC90;
      id v32 = &unk_1012F5B98;
      id v33 = v22;
      dispatch_time_t v34 = v9;
      id v21 = v22;
      [v23 enumerateObjectsUsingBlock:&v29];

      id v24 = +[NSBundle mainBundle];
      unsigned int v25 = [v24 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
      CFStringRef v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:0];
      [v21 addAction:v26];

      uint64_t v27 = [(ActionCoordinator *)self containerViewController];
      uint64_t v28 = [v27 chromeViewController];
      [v28 _maps_topMostPresentViewController:v21 animated:1 completion:0];
    }
    goto LABEL_9;
  }
  ((void (*)(void *, void *))v9[2])(v9, v11);
LABEL_10:
}

- (void)viewController:(id)a3 presentCluster:(id)a4
{
  id v32 = a4;
  unsigned int v5 = [v32 isCluster];
  id v6 = v32;
  if (v5)
  {
    id v7 = [v32 clusterFeatureAnnotations];
    id v8 = [v7 firstObject];

    if ([(ActionCoordinator *)self clusterIsPartOfVenues:v32])
    {
      id v9 = [[LabelMarkerVenueCardItem alloc] initWithLabelMarker:v32];
      id v10 = [(ActionCoordinator *)self venueCardCoordinator];
      unsigned int v11 = [v10 topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v13 = [(ActionCoordinator *)self venueCardCoordinator];
        [v13 popVenueCardItem:0];
      }
      id v14 = [(ActionCoordinator *)self venueCardCoordinator];
      [v14 pushVenueCardItem:v9 source:5];

      id v15 = [(ActionCoordinator *)self venueCardCoordinator];
      id v16 = [v15 viewControllerForCardItem:v9];

      id v17 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      id v19 = v18;

      [v19 setContaineeDelegate:self];
      [v19 setPreferredPresentationStyle:3];
      [v19 setResultsDelegate:self];
      [v19 setCoordinator:self];
      [v19 setEnableQuickActionMenu:1];
      [v19 setDisplayDistance:0];
      id v20 = [v19 view];
      id v21 = [(ActionCoordinator *)self currentSearchSession];
      id v22 = [v21 searchInfo];
      [v19 setCluster:v32 sortAlphabetically:1 originalSearchInfo:v22];

      [(ActionCoordinator *)self presentSimpleList:v19];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_14:

        id v6 = v32;
        goto LABEL_15;
      }
      __int16 v23 = [(ActionCoordinator *)self simpleListResultsVC];
      id v24 = [v23 cluster];

      if (v24 != v32)
      {
        unsigned int v25 = [(ActionCoordinator *)self simpleListResultsVC];
        [v25 clearCluster];
      }
      CFStringRef v26 = [(ActionCoordinator *)self simpleListResultsVC];
      [v26 setDisplayDistance:1];

      uint64_t v27 = [(ActionCoordinator *)self simpleListResultsVC];
      uint64_t v28 = [(ResultsViewController *)self->_resultsViewController currentLocation];
      [v27 updateCurrentLocation:v28 isClusterResult:1];

      id v29 = [(ActionCoordinator *)self simpleListResultsVC];
      uint64_t v30 = [(ActionCoordinator *)self currentSearchSession];
      id v31 = [v30 searchInfo];
      [v29 setCluster:v32 sortAlphabetically:0 originalSearchInfo:v31];

      id v9 = [(ActionCoordinator *)self simpleListResultsVC];
      [(ActionCoordinator *)self presentSimpleList:v9];
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (void)showVLF
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = [(ActionCoordinator *)self containerViewController];
    id v6 = [v15 currentViewController];
    [v6 handleVLFPuckTapped];
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [(ActionCoordinator *)self containerViewController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1006EE400;
    v16[3] = &unk_1012E6998;
    objc_copyWeak(&v17, &location);
    unsigned __int8 v8 = [v7 showVLFCrowdsourcingPermissionCardWithContaineeDelegate:self delegate:self completion:v16];

    if ((v8 & 1) == 0)
    {
      id v9 = [(ActionCoordinator *)self containerViewController];
      id v10 = [v9 chromeViewController];
      unsigned int v11 = [v10 userLocationView];

      if ([v11 isVLFBannerVisible]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = [v11 isVLFPuckVisible];
      }
      id v13 = [[VLFContaineeViewController alloc] initWithEntryPoint:v12];
      [(ContaineeViewController *)v13 setContaineeDelegate:self];
      id v14 = [(ActionCoordinator *)self containerViewController];
      [v14 presentController:v13];
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (BOOL)clusterIsPartOfVenues:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ActionCoordinator *)self venueCardCoordinator];
  id v6 = [v5 venueIdForCurrentCardStack];

  id v20 = v6;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [v4 clusterFeatureAnnotations];
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      id v19 = v4;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation, v19))
          {
            id v13 = [v12 searchResult];
            id v14 = [v13 mapItem];
            id v15 = [v14 _venueInfo];
            id v16 = [v15 venueIdentifier];
            id v17 = [v16 venueID];

            if (v17 != v20)
            {
              LOBYTE(v6) = 0;
              goto LABEL_13;
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      LOBYTE(v6) = 1;
LABEL_13:
      id v4 = v19;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (BOOL)viewController:(id)a3 shouldDisplayTransitSchedulesForMapItem:(id)a4 departureSequence:(id)a5
{
  return +[TransitSchedulesViewController shouldShowScheduleForTransitMapItem:a4 sequence:a5];
}

- (void)viewController:(id)a3 displayTransitSchedulesForMapItem:(id)a4 departureSequence:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v10 = [[TransitSchedulesViewController alloc] initWithTransitMapItem:v8 departureSequence:v7];

  [(TransitSchedulesViewController *)v10 setActionCoordinator:self];
  [(ContaineeViewController *)v10 setContaineeDelegate:self];
  [(TransitSchedulesViewController *)v10 setTransitSchedulesDelegate:self];
  [(ControlContaineeViewController *)v10 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v10 animated:1 useDefaultContaineeLayout:0];

  if ([(ActionCoordinator *)self isRoutePlanningPresented]) {
    [(RoutePlanningMapController *)self->_routePlanningMapController setSelectCurrentRoute:0];
  }
  +[GEOAPPortal captureUserAction:21 target:[(ActionCoordinator *)self currentUITargetForAnalytics] value:0];
}

- (void)viewControllerPresentNearbyTransitDepartures:(id)a3
{
  id v4 = [(ActionCoordinator *)self containerViewController];
  uint64_t v5 = sub_1000BBB44(v4);

  if (v5 != 5
    || ([(ActionCoordinator *)self currentViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) == 0))
  {
    id v9 = [[_TtC4Maps27NearbyTransitViewController alloc] initWithActionCoordinator:self];
    [(ContaineeViewController *)v9 setContaineeDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v9 animated:1 useDefaultContaineeLayout:0];
  }
}

- (void)showNearbyTeachableMomentCard
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = sub_10005C134();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = 0;
      id v7 = "The Nearby teachable moment card is already visible; can't show twice";
      id v8 = (uint8_t *)&v16;
      id v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unint64_t v12 = (unint64_t)[WeakRetained containerStyle];

  if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    id v6 = sub_1005768D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      id v7 = "Not showing Nearby teachable moment card because the phone is in landscape";
      id v8 = buf;
      id v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  id v14 = objc_alloc_init(_TtC4Maps44NearbyTeachableMomentContaineeViewController);
  [(ContaineeViewController *)v14 setContaineeDelegate:self];
  id v13 = [(ActionCoordinator *)self containerViewController];
  [v13 presentController:v14 animated:1];
}

- (void)viewController:(id)a3 displayTransitSchedulesForDepartureSequence:(id)a4 withTimeZone:(id)a5 scheduleWindowStartDate:(id)a6 includeAllDirections:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v15 = [[TransitSchedulesViewController alloc] initWithDepartureSequence:v13 timeZone:v12 scheduleWindowStartDate:v11 includeAllDirections:v7];

  [(TransitSchedulesViewController *)v15 setActionCoordinator:self];
  [(ContaineeViewController *)v15 setContaineeDelegate:self];
  [(TransitSchedulesViewController *)v15 setTransitSchedulesDelegate:self];
  [(ControlContaineeViewController *)v15 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v15 animated:1 useDefaultContaineeLayout:0];

  +[GEOAPPortal captureUserAction:21 target:[(ActionCoordinator *)self currentUITargetForAnalytics] value:0];
}

- (void)transitSchedulesViewController:(id)a3 wantsToShowInfoForLine:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  BOOL v7 = [(ActionCoordinator *)self containerViewController];
  BOOL v8 = sub_1000BBB44(v7) != 5;

  [(ActionCoordinator *)self viewController:v9 selectTransitLineItem:v6 zoomToMapRegion:v8];
}

- (void)transitSchedulesViewController:(id)a3 wantsToDisplayIncidents:(id)a4 fromView:(id)a5
{
}

- (void)incidentReportSubmissionContaineeDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained popLastViewControllerAnimated:1];
}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[NavTrafficIncidentReportSubmissionContaineeViewController alloc] initWithItem:v7 report:v6];

  [(ContaineeViewController *)v9 setContaineeDelegate:self];
  [(NavTrafficIncidentReportSubmissionContaineeViewController *)v9 setReportingDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v9 animated:1 useDefaultContaineeLayout:1];
}

- (void)viewController:(id)a3 presentMenuController:(id)a4 animated:(BOOL)a5 fromChrome:(BOOL)a6 completion:(id)a7
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v18 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = v18;
  if (v9)
  {
    id v7 = [(ActionCoordinator *)self containerViewController];
    id v15 = [v7 chromeViewController];
  }
  __int16 v16 = [v13 macMenuPresentationController];
  [v16 setContainerViewController:v15];

  if (v9)
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v13 animated:v10 completion:v14];
}

- (void)viewController:(id)a3 dismissMenuControllerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  p_containerViewController = &self->_containerViewController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  [WeakRetained popLastViewControllerFromViewController:v6 animated:v4 useDefaultContaineeLayout:0];
}

- (void)viewController:(id)a3 presentVenueFromAutoCompleteWithVenueIdentifier:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[VenueAutoCompleteSearchCardItem alloc] initWithVenueIdentifier:v11 searchCategory:v10];

  [(ActionCoordinator *)self viewController:v12 presentVenueWithVenueCardItem:v13 source:a6];
}

- (void)viewController:(id)a3 presentVenueForMapItem:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[VenueSearchCardItem alloc] initWithMapItem:v11 searchCategory:v10];

  [(ActionCoordinator *)self viewController:v12 presentVenueWithVenueCardItem:v13 source:a6];
}

- (void)viewController:(id)a3 presentVenueWithVenueCardItem:(id)a4 source:(unint64_t)a5
{
  id v18 = a4;
  if ([v18 isVenueItem])
  {
    id v7 = [(ActionCoordinator *)self venueCardCoordinator];
    [v7 pushVenueCardItem:v18 source:a5];

    BOOL v8 = [(ActionCoordinator *)self mapSelectionManager];
    [v8 clearSelection];

    BOOL v9 = [(ActionCoordinator *)self searchPinsManager];
    [v9 clearLinkedPlacesAndPolygon];

    id v10 = [(ActionCoordinator *)self containerViewController];
    uint64_t v11 = sub_1000BBB44(v10);

    if (v11 == 5)
    {
      id v12 = [(ActionCoordinator *)self searchModeViewController];
      [v12 presentVenueWithVenueCardItem:v18];
    }
    else
    {
      id v13 = [(ActionCoordinator *)self venueCardCoordinator];
      id v14 = [v13 viewControllerForCardItem:v18];

      id v12 = v14;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = v12;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      [v16 setContaineeDelegate:self];
      [v16 setDelegate:self];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      [WeakRetained presentController:v16 animated:1 useDefaultContaineeLayout:1];
    }
  }
}

- (void)viewController:(id)a3 presentPlacesWithPlacesCardItem:(id)a4 source:(unint64_t)a5
{
  id v6 = a4;
  id v7 = [(ActionCoordinator *)self mapSelectionManager];
  [v7 clearSelection];

  BOOL v8 = [(ActionCoordinator *)self searchPinsManager];
  [v8 clearLinkedPlacesAndPolygon];

  BOOL v9 = [PlaceCategoryItem alloc];
  id v10 = [v6 searchCategory];
  uint64_t v11 = [v6 mapItem];
  id v12 = [v11 _muid];
  id v13 = [v6 searchCategory];

  id v15 = -[PlaceCategoryItem initWithSearchCategory:parentMuid:displayMode:](v9, "initWithSearchCategory:parentMuid:displayMode:", v10, v12, [v13 displayMode]);
  id v14 = +[SearchFieldItem searchFieldItemWithObject:v15];
  [(ActionCoordinator *)self viewController:0 doSearchItem:v14 withUserInfo:0];
}

- (void)viewController:(id)a3 selectVenueSearchResult:(id)a4 source:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ActionCoordinator *)self currentSearchSession];
  uint64_t v11 = [v10 currentResultsSearchInfo];
  unsigned int v12 = [v11 shouldInjectSearchResults];

  if (v12)
  {
    id v13 = [(ActionCoordinator *)self searchPinsManager];
    [v13 selectAndShowSearchResult:v9 animated:1];
  }
  else
  {
    [(ActionCoordinator *)self viewController:v8 selectSearchResult:v9 addToHistory:1 source:a5 saveSelectionState:1];
    id v13 = [(ActionCoordinator *)self searchPinsManager];
    id v15 = v9;
    id v14 = +[NSArray arrayWithObjects:&v15 count:1];
    [v13 setSearchPins:v14 selectedPin:v9 animated:1];
  }
}

- (void)viewController:(id)a3 presentVenuesClusteredSearchResult:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self venueCardCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1006EF744;
  v8[3] = &unk_1012F5BE8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 popVenueCardItem:v8];
}

- (void)closeVenueViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self venueCardCoordinator];
  id v6 = [v5 topViewController];

  if (v6 == v4)
  {
    id v7 = [(ActionCoordinator *)self containerViewController];
    id v8 = [v7 chromeViewController];
    [v8 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

    id v9 = [(ActionCoordinator *)self mapSelectionManager];
    [v9 clearSelection];

    id v10 = [(ActionCoordinator *)self searchPinsManager];
    [v10 clearLinkedPlacesAndPolygon];

    uint64_t v11 = [(ActionCoordinator *)self venueCardCoordinator];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1006EF900;
    _OWORD v12[3] = &unk_1012F5BE8;
    void v12[4] = self;
    id v13 = v4;
    [v11 popVenueCardItem:v12];
  }
}

- (void)viewController:(id)a3 presentVenueFloorCardViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self containerViewController];
  [v6 presentController:v5 animated:1];
}

- (void)closeVenueFloorCardViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(ActionCoordinator *)self containerViewController];
  id v5 = [v4 currentViewController];

  id v6 = [(ActionCoordinator *)self containerViewController];
  if (v5 == v7) {
    [v6 popLastViewControllerFromViewController:v7 animated:1 useDefaultContaineeLayout:0];
  }
  else {
    [v6 removeControllerFromStack:v7];
  }
}

- (void)dismissLastVenuePlaceCard
{
  id v3 = [(ActionCoordinator *)self venueCardCoordinator];
  id v7 = [v3 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(ActionCoordinator *)self mapSelectionManager];
    [v4 clearSelection];

    id v5 = [(ActionCoordinator *)self containerViewController];
    [v5 removeControllerFromStack:v7];

    id v6 = [(ActionCoordinator *)self venueCardCoordinator];
    [v6 popVenueCardItem:0];
  }
}

- (BOOL)shouldReusePlaceCardViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presentingViewController];

  id v6 = [(ActionCoordinator *)self currentViewController];

  return v6 == v4 || v5 == 0;
}

- (void)dismissPlaceCardViewController:(id)a3
{
  if (self->_placeCardViewController == a3)
  {
    id v4 = a3;
    id v5 = [(ActionCoordinator *)self containerViewController];
    [v5 popLastViewControllerFromViewController:v4 animated:1 useDefaultContaineeLayout:0];

    placeCardViewController = self->_placeCardViewController;
    self->_placeCardViewController = 0;
  }
}

- (BOOL)shouldDismissPlaceCardOnClearMapSelection
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = 0;
  }
  else
  {
    objc_opt_class();
    char v5 = objc_opt_isKindOfClass() ^ 1;
  }

  return v5 & 1;
}

- (void)enterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  p_containerViewController = &self->_containerViewController;
  id v14 = a4;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v17 = [WeakRetained chromeViewController];
  id v18 = objc_loadWeakRetained((id *)p_containerViewController);
  id v19 = [v18 chromeContext];
  unsigned int v20 = [v17 isTopContext:v19];

  if (v20) {
    [(ActionCoordinator *)self _cancelUserInteractions];
  }
  id v21 = [(ActionCoordinator *)self appCoordinator];
  [v21 enterLookAroundWithEntryPoint:v15 lookAroundView:v14 showsFullScreen:v10 originFrame:CGRectMake(x, y, width, height)];
}

- (void)exitLookAround
{
  id v2 = [(ActionCoordinator *)self appCoordinator];
  [v2 exitLookAround];
}

- (void)_cancelUserInteractions
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v4 = [WeakRetained chromeViewController];
  char v5 = [v4 view];
  unsigned int v6 = [v5 isUserInteractionEnabled];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_containerViewController);
    id v8 = [v7 chromeViewController];
    id v9 = [v8 view];
    [v9 setUserInteractionEnabled:0];

    id v12 = objc_loadWeakRetained((id *)p_containerViewController);
    BOOL v10 = [v12 chromeViewController];
    uint64_t v11 = [v10 view];
    [v11 setUserInteractionEnabled:1];
  }
}

- (void)didRequestDirectionsForSharedTrip:(id)a3
{
  id v3 = [a3 destinationWaypointMapItem];
  id v4 = +[MKMapItem _itemWithGeoMapItem:v3];
  id v9 = v4;
  char v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = MKLaunchOptionsDirectionsModeKey;
  id v8 = MKLaunchOptionsDirectionsModeDefault;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  +[MKMapItem openMapsWithItems:v5 launchOptions:v6 completionHandler:&stru_1012F5C08];
}

- (void)didSelectStopWithMapItem:(id)a3
{
  id v4 = a3;
  char v5 = [[PlaceCardItem alloc] initWithMapItem:v4];
  unsigned int v6 = [(ActionCoordinator *)self containerViewController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006F0410;
  v9[3] = &unk_1012E66E0;
  void v9[4] = self;
  id v10 = v4;
  uint64_t v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 dismissViewControllerAnimated:1 completion:v9];
}

- (void)closeSharedTripDetail
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)closeStopDetail
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ActionCoordinator *)self containerViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)presentAutosharingContactSearchWithContacts:(id)a3 selectionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v7 = [[ContactSearchViewController alloc] initWithInitialContacts:v10 selectionHandler:v6];
    id v8 = [(ContaineeViewController *)v7 cardPresentationController];
    [v8 setPresentedModally:1];

    [(ContaineeViewController *)v7 setContaineeDelegate:self];
    id v9 = [(ActionCoordinator *)self containerViewController];
    [v9 presentController:v7 animated:1];
  }
}

- (void)deleteMarkedLocation:(id)a3
{
  id v3 = [(ActionCoordinator *)self searchPinsManager];
  [v3 clearDroppedPin];

  id v4 = +[CustomSearchManager sharedManager];
  [v4 setCustomSearchResult:0 animated:1 shouldSelectOnMap:0 context:@"__internal_MapsDroppedPinContextSwipe"];
}

- (void)confirmDeleteCollections:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v22 = a4;
  p_containerViewController = &self->_containerViewController;
  id v14 = a6;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v17 = [WeakRetained traitCollection];
  id v18 = +[UIAlertController _maps_confirmationAlertControllerForDeletingCollections:userInterfaceIdiom:completion:](UIAlertController, "_maps_confirmationAlertControllerForDeletingCollections:userInterfaceIdiom:completion:", v15, [v17 userInterfaceIdiom], v14);

  if (v22)
  {
    id v19 = [v18 popoverPresentationController];
    [v19 setSourceView:v22];

    unsigned int v20 = [v18 popoverPresentationController];
    [v20 setSourceRect:x, y, width, height];
  }
  id v21 = objc_loadWeakRetained((id *)p_containerViewController);
  [v21 _maps_topMostPresentViewController:v18 animated:1 completion:0];
}

- (void)confirmDeleteSharedTripWithSummary:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v22 = a4;
  p_containerViewController = &self->_containerViewController;
  id v14 = a6;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v17 = [WeakRetained traitCollection];
  id v18 = +[UIAlertController _maps_confirmationAlertControllerForBlockingTripInSummary:userInterfaceIdiom:completion:](UIAlertController, "_maps_confirmationAlertControllerForBlockingTripInSummary:userInterfaceIdiom:completion:", v15, [v17 userInterfaceIdiom], v14);

  if (v22)
  {
    id v19 = [v18 popoverPresentationController];
    [v19 setSourceView:v22];

    unsigned int v20 = [v18 popoverPresentationController];
    [v20 setSourceRect:x, y, width, height];
  }
  id v21 = objc_loadWeakRetained((id *)p_containerViewController);
  [v21 _maps_topMostPresentViewController:v18 animated:1 completion:0];
}

- (void)placeViewControllerViewContactsClosed
{
  id v3 = [(ActionCoordinator *)self mapSelectionManager];
  [v3 clearSelection];

  dispatch_time_t v4 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006F0A88;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)containeeViewController:(id)a3 didCreateKeyboardProxy:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self searchModeViewController];
  [v6 keyboardProxyViewCreated:v5];
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  [v6 dismissViewControllerAnimated:1 completion:0];
  id v7 = [v6 clientIdentifier];

  unsigned int v8 = [v7 isEqualToString:@"RidesharingStoreProductClientIdentifier"];
  if (a4 == 4 && v8)
  {
    id v11 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v9 = [v11 rideOptionStateObserver];
    id v10 = [v9 analyticsBookingSession];
    [v10 setInstalledApp:1];
  }
}

- (void)exit3dMode
{
  *(_WORD *)&self->_is3dModeSelected = 256;
  id v3 = [(ActionCoordinator *)self mapView];
  [v3 _exit3DMode];

  if (!+[SettingsController deviceSupportsGlobe])
  {
    dispatch_time_t v4 = [(ActionCoordinator *)self settingsController];
    unsigned int v5 = [v4 in3DMode];

    int64_t v6 = [(ActionCoordinator *)self displayedViewMode];
    if (v6 != 5 || v5)
    {
      if (v6 == 6) {
        char v8 = v5;
      }
      else {
        char v8 = 1;
      }
      if (v8) {
        goto LABEL_11;
      }
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = 1;
    }
    id v9 = [(ActionCoordinator *)self settingsController];
    [v9 setMapViewMode:v7 animated:0];
  }
LABEL_11:
  id v10 = +[MKMapService sharedService];
  [v10 captureUserAction:5010 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v11 = [(ActionCoordinator *)self containerViewController];
  [v11 refreshControls];
}

- (void)finishExitFrom3dMode
{
  self->_isExiting3dMode = 0;
}

- (void)select3dMode
{
  id v3 = [(ActionCoordinator *)self mapView];
  unsigned int v4 = [v3 _isPitched];

  if (!v4)
  {
    if (!+[SettingsController deviceSupportsGlobe])
    {
      int64_t v5 = [(ActionCoordinator *)self displayedViewMode];
      if (v5 == 1)
      {
        uint64_t v6 = 5;
        goto LABEL_10;
      }
      if (v5 == 2)
      {
        uint64_t v6 = 6;
LABEL_10:
        uint64_t v7 = [(ActionCoordinator *)self settingsController];
        [v7 setMapViewMode:v6 animated:0];
      }
    }
    char v8 = +[MKMapService sharedService];
    [v8 captureUserAction:5009 onTarget:[self currentUITargetForAnalytics] eventValue:0];

    id v9 = [(ActionCoordinator *)self mapView];
    [v9 _enter3DMode];

    self->_is3dModeSelected = 1;
    return;
  }

  [(ActionCoordinator *)self exit3dMode];
}

- (int64_t)displayedViewMode
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 displayedViewMode];

  return (int64_t)v4;
}

- (void)setViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(ActionCoordinator *)self settingsController];
  id v8 = [v7 bestMapViewModeForViewMode:a3];

  id v9 = [(ActionCoordinator *)self settingsController];
  [v9 setMapViewMode:v8 animated:v4];
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ActionCoordinator *)self containerViewController];
  uint64_t v6 = [v7 chromeViewController];
  [v6 updateViewMode:a3 animated:v4 preserveMapSelection:1];
}

- (void)chromeViewController:(id)a3 didUpdateViewMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ActionCoordinator *)self containerViewController];
  id v8 = [v7 chromeViewController];

  if (v8 == v6)
  {
    if ([(ActionCoordinator *)self isRoutePlanningPresented])
    {
      id v9 = [(ActionCoordinator *)self routePlanningDataCoordinator];
      id v10 = (char *)[v9 transportType];
      if (v10)
      {
        id v11 = v10;
        switch(a4)
        {
          case -1:
            goto LABEL_18;
          case 0:
          case 1:
          case 2:
          case 5:
          case 6:
            if (v10 != (char *)3) {
              break;
            }
            if (a4 == 3)
            {
LABEL_18:
              if (a4 == 3) {
                uint64_t v17 = 3;
              }
              else {
                uint64_t v17 = 1;
              }
              if (a4 == -1) {
                uint64_t v18 = 0;
              }
              else {
                uint64_t v18 = v17;
              }
              id v19 = sub_10057624C();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                int64_t v20 = a4 + 1;
                if (unint64_t)(a4 + 1) < 9 && ((0x1DFu >> v20))
                {
                  id v21 = *(&off_1012F5DE0 + v20);
                }
                else
                {
                  id v21 = +[NSString stringWithFormat:@"<Unknown: %ld>", a4];
                }
                id v22 = v21;
                long long v23 = v22;
                if ((unint64_t)(v11 - 2) > 3) {
                  CFStringRef v24 = @"Drive";
                }
                else {
                  CFStringRef v24 = *(&off_1012F5E48 + (void)(v11 - 2));
                }
                uint64_t v25 = (uint64_t)*(&off_1012F5E28 + v18);
                *(_DWORD *)long long buf = 138543874;
                id v38 = v22;
                __int16 v39 = 2114;
                CFStringRef v40 = v24;
                __int16 v41 = 2114;
                uint64_t v42 = v25;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "view mode %{public}@ isn't supported by transport type %{public}@; will switch to default transport type %{public}@",
                  buf,
                  0x20u);
              }
              [self->_currentDirectionItem setTransportType:v18];
              [v9 updateTransportType:v18];
            }
            else
            {
LABEL_7:
              id v12 = sub_10057624C();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                if (unint64_t)a4 < 8 && ((0xEFu >> a4))
                {
                  id v13 = *(&off_1012F5DA0 + a4);
                }
                else
                {
                  id v13 = +[NSString stringWithFormat:@"<Unknown: %ld>", a4];
                }
                if ((unint64_t)(v11 - 2) > 3) {
                  CFStringRef v26 = @"Drive";
                }
                else {
                  CFStringRef v26 = *(&off_1012F5E48 + (void)(v11 - 2));
                }
                *(_DWORD *)long long buf = 138543618;
                id v38 = v13;
                __int16 v39 = 2114;
                CFStringRef v40 = v26;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "view mode %{public}@ isn't supported by transport type %{public}@; will attempt to replace the transport type",
                  buf,
                  0x16u);
              }
              uint64_t v27 = [(ActionCoordinator *)self containerViewController];
              uint64_t v28 = [v27 chromeViewController];
              id v29 = [v28 defaultTransportTypeFinder];

              objc_initWeak((id *)buf, self);
              currentDirectionItem = self->_currentDirectionItem;
              v34[0] = _NSConcreteStackBlock;
              v34[1] = 3221225472;
              id v34[2] = sub_1006F1404;
              v34[3] = &unk_1012F5C30;
              objc_copyWeak(v36, (id *)buf);
              v36[1] = (id)a4;
              id v35 = v9;
              [v29 transportTypeForDirectionItem:currentDirectionItem ignoreMapType:0 completion:v34];

              objc_destroyWeak(v36);
              objc_destroyWeak((id *)buf);
            }
            break;
          case 3:
            if (v10 == (char *)3) {
              break;
            }
            goto LABEL_18;
          case 7:
            if (v10 != (char *)1 && v10 != (char *)4) {
              goto LABEL_18;
            }
            break;
          default:
            goto LABEL_7;
        }
      }
      id v31 = [(ActionCoordinator *)self settingsController];
      unsigned int v32 = [v31 userRequestingViewModeChange];

      if (v32) {
        [(RoutePlanningMapController *)self->_routePlanningMapController saveOriginalMapViewModeAs:a4];
      }
    }
    else
    {
      id v14 = [(ActionCoordinator *)self lineSelectionAction];
      unsigned int v15 = [v14 isActive];

      if (a4 != 3 && v15)
      {
        id v16 = [(ActionCoordinator *)self lineSelectionAction];
        [v16 deactivateWithContext:0];
      }
    }
    id v33 = [(ActionCoordinator *)self placeCardViewController];
    [v33 updateForViewMode:a4];
  }
}

- (void)setUserTrackingViewUserTrackingMode:(int64_t)a3
{
  id v4 = [(ActionCoordinator *)self mapView];
  [v4 setUserTrackingMode:a3];
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4 postAlertSearchType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = [(ActionCoordinator *)self containerViewController];
  id v10 = [v12 chromeViewController];
  id v11 = [v10 interruptionManager];
  [v11 displayAlertWithTitle:v9 message:v8 postAlertSearchType:v5];
}

- (int)mapApplicationState
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 mapView];
  int v5 = [v4 _applicationState];

  return v5;
}

- (void)updateMapApplicationState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v6 chromeViewController];
  int v5 = [v4 mapView];
  [v5 _setApplicationState:v3];
}

- (void)refreshCurrentSearch
{
  uint64_t v3 = [(ActionCoordinator *)self resultsViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (MapsFeature_IsEnabled_SearchAndDiscovery())
    {
      int v5 = [(ActionCoordinator *)self containerViewController];
      id v6 = [v5 chromeViewController];
      [v6 setNeedsUpdateComponent:@"redoSearchButton" animated:1];

      id v7 = [(ActionCoordinator *)self currentViewController];
      id v8 = [(ActionCoordinator *)self searchModeViewController];

      id v9 = [(ActionCoordinator *)self currentViewController];
      if (v7 != v8)
      {
        id v13 = v9;
        id v10 = [(ActionCoordinator *)self resultsViewController];

        if (v13 != v10) {
          return;
        }
        id v9 = [(ActionCoordinator *)self currentViewController];
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = [(ActionCoordinator *)self resultsViewController];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0) {
      return;
    }
  }
  id v9 = [(ActionCoordinator *)self resultsViewController];
LABEL_8:
  id v14 = v9;
  [v9 refreshCurrentSearch];
}

- (BOOL)shouldShowSearchOverlay
{
  uint64_t v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 != (id)5)
  {
    id v9 = [(ActionCoordinator *)self currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v11 = [(ActionCoordinator *)self currentViewController];
    id v6 = v11;
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();

      if ((v12 & 1) == 0) {
        return 0;
      }
      id v11 = [(ActionCoordinator *)self currentViewController];
      id v6 = v11;
    }
    unsigned __int8 v8 = [v11 shouldShowSearchOverlay];
LABEL_17:

    return v8;
  }
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    int v5 = [(ActionCoordinator *)self currentSearchSession];
    id v6 = [v5 searchInfo];

    id v7 = [v6 searchRedoButtonThreshold];
    if (v7 && ([v6 shouldAllowManualRedoButton] & 1) != 0)
    {
      unsigned __int8 v8 = 1;
    }
    else if ([v6 canRedoSearch])
    {
      id v13 = [v6 searchAutoRedoThreshold];
      unsigned __int8 v8 = v13 != 0;
    }
    else
    {
      unsigned __int8 v8 = 0;
    }

    goto LABEL_17;
  }
  return 1;
}

- (void)defaultZoom
{
  uint64_t v3 = [(ActionCoordinator *)self mapView];
  [v3 centerCoordinate];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(ActionCoordinator *)self mapView];
  [v8 setCenterCoordinate:1 zoomLevel:v5 animated:16.0];
}

- (void)zoomIn
{
  uint64_t v3 = [(ActionCoordinator *)self mapView];
  [v3 startLinearZoomIn:1];

  double v4 = [(ActionCoordinator *)self mapView];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v4 selector:"stopZoomingWithInertia" object:0];

  id v5 = [(ActionCoordinator *)self mapView];
  [v5 performSelector:"stopZoomingWithInertia" withObject:0 afterDelay:0.3];
}

- (void)zoomOut
{
  uint64_t v3 = [(ActionCoordinator *)self mapView];
  [v3 startLinearZoomIn:0];

  double v4 = [(ActionCoordinator *)self mapView];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v4 selector:"stopZoomingWithInertia" object:0];

  id v5 = [(ActionCoordinator *)self mapView];
  [v5 performSelector:"stopZoomingWithInertia" withObject:0 afterDelay:0.3];
}

- (void)actionControlDidDeactivate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [(ActionCoordinator *)self containerViewController];
    double v7 = [v6 currentViewController];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      id v9 = [(ActionCoordinator *)self lineCardVC];
      [(ActionCoordinator *)self viewControllerClosed:v9 animated:1];
    }
    id v10 = [(ActionCoordinator *)self lineCardVC];
    [v10 resetNearestStation];
  }
}

- (void)updateRedoSearchFloatingControl:(BOOL)a3
{
  id v5 = [(ActionCoordinator *)self resultsViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v7 = sub_1000BBB44(WeakRetained);

    if (v7 != 5) {
      return;
    }
  }
  char v8 = [(ActionCoordinator *)self containerViewController];
  id v9 = [v8 chromeViewController];
  id v18 = [v9 redoSearchOverlay];

  id v10 = [(ActionCoordinator *)self searchModeViewController];
  [v10 didUpdateSearchResults];

  id v11 = [(ActionCoordinator *)self currentSearchSession];
  char v12 = [v11 searchInfo];
  id v13 = [v12 results];
  id v14 = [v13 count];

  id v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (sub_1000BBB44(v15) != 5)
  {

LABEL_9:
    uint64_t v16 = 1;
    [v18 shouldHideFloatingControl:1 animated:1];
    goto LABEL_10;
  }

  uint64_t v16 = 2;
  if (!a3)
  {
    uint64_t v17 = v18;
    if (!v14) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v17 = v18;
LABEL_11:
  [v17 updateSearchOverlayWithState:v16];
}

- (void)showAnnouncementForFlyover:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = [TopBannerItem alloc];
    id v6 = objc_alloc((Class)NSAttributedString);
    uint64_t v7 = [v4 announcement];
    char v8 = (void *)v7;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    else {
      CFStringRef v9 = &stru_101324E70;
    }
    id v10 = [v6 initWithString:v9];
    id v11 = +[NSBundle mainBundle];
    char v12 = [v11 localizedStringForKey:@"Start" value:@"localized string not found" table:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1006F2170;
    v16[3] = &unk_1012F5C58;
    objc_copyWeak(&v17, &location);
    id v13 = [(TopBannerItem *)v5 initWithType:1 layout:0 userInfo:v4 attributedString:v10 icon:0 buttonText:v12 buttonAction:v16];

    id v19 = v13;
    id v14 = +[NSArray arrayWithObjects:&v19 count:1];
    id v15 = [(ActionCoordinator *)self containerViewController];
    [v15 updateTopBannerViewWithTopBannerItems:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)searchSessionManagerSessionDidReceiveUpdate
{
  [(ActionCoordinator *)self updateResultsViewContent];
  uint64_t v3 = [(ActionCoordinator *)self appCoordinator];
  [v3 setNeedsUserActivityUpdate];

  [(ActionCoordinator *)self updateRedoSearchFloatingControl:0];
}

- (BOOL)searchSessionShouldUpdateEVChargers
{
  uint64_t v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 topMostPresentedViewController];
  id v5 = [(ActionCoordinator *)self resultsViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)searchSessionManagerReceiveEVChargersUpdate:(id)a3
{
  id v7 = a3;
  id v4 = [(ActionCoordinator *)self resultsViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ActionCoordinator *)self resultsViewController];
    [v6 refreshEVChargers:v7];
  }
}

- (void)searchSessionManagerSessionDidInvalidate
{
  uint64_t v3 = [(ActionCoordinator *)self venueCardCoordinator];
  id v4 = [v3 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 contentDownloader];

  [v7 searchDidCancel];
  id v13 = [(ActionCoordinator *)self currentViewController];
  id v8 = [(ActionCoordinator *)self resultsViewController];
  if (v13 == v8)
  {

LABEL_9:
    id v11 = [self->_addStopResultsViewController presentingViewController];

    if (v11)
    {
      addStopResultsViewController = self->_addStopResultsViewController;
    }
    else
    {
      [(ResultsViewController *)self->_resultsViewController searchDidCancel:1];
      addStopResultsViewController = self->_resultsViewController;
    }
    [(ActionCoordinator *)self containeeViewControllerGoToPreviousState:addStopResultsViewController withSender:0];
    return;
  }
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    CFStringRef v9 = [(ActionCoordinator *)self currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    goto LABEL_9;
  }
}

- (void)searchSessionManagerSessionDidFail
{
  [(ActionCoordinator *)self updateResultsViewContent];
  [(ActionCoordinator *)self updateRedoSearchFloatingControl:1];
  uint64_t v3 = [(ActionCoordinator *)self venueCardCoordinator];
  id v4 = [v3 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 contentDownloader];

  [v7 searchDidFail];
}

- (void)updateFloatingControlsWithSearchSession:(id)a3
{
  id v4 = a3;
  id v6 = [(ActionCoordinator *)self containerViewController];
  id v5 = [v6 floatingControlsPresentationController];
  [v5 setSearchSession:v4];
}

- (void)updateResultsViewContent
{
  uint64_t v3 = [(ActionCoordinator *)self resultsViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(ActionCoordinator *)self resultsViewController];
    [v5 updateSearchSession];
  }
}

- (void)presentLPRWithVehicle:(id)a3 scenario:(int64_t)a4 presenter:(id)a5 completionBlock:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  char v12 = objc_alloc_init(LPRFlowController);
  lprOnboardingController = self->_lprOnboardingController;
  self->_lprOnboardingController = v12;

  id v14 = self->_lprOnboardingController;
  if (v10)
  {
    [(LPRFlowController *)self->_lprOnboardingController presentLPRFlowWithVehicle:v16 scenario:a4 presenter:v10 completionBlock:v11];
  }
  else
  {
    id v15 = [(ActionCoordinator *)self containerViewController];
    [(LPRFlowController *)v14 presentLPRFlowWithVehicle:v16 scenario:a4 presenter:v15 completionBlock:v11];
  }
}

- (void)retainSearchQueryForSelectedSearchResult:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 retainSearchQueryForSelectedSearchResult:v4];
}

- (void)updateSearchFieldWithSearchFieldItem:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 updateSearchFieldWithItem:v4];
}

- (void)receivedVenueEVChargersUpdate:(id)a3
{
  id v12 = a3;
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)5)
  {
    id v6 = [(ActionCoordinator *)self searchModeViewController];
    [v6 venueDidReceiveEVChargersUpdate:v12];
  }
  else
  {
    id v7 = [(ActionCoordinator *)self venueCardCoordinator];
    id v6 = [v7 topViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      id v10 = [v9 contentDownloader];

      if (v10)
      {
        id v11 = [v9 contentDownloader];
        [v11 searchDidReceiveEVChargerUpdates:v12];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[UIDevice currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  if (v11 == (id)5)
  {
    id v12 = [(ActionCoordinator *)self searchModeViewController];
    [v12 handleVenueSearchResultsWithSelectedSearchResult:v21 searchFieldItem:v9 browseCategories:v8];
  }
  else
  {
    id v13 = [(ActionCoordinator *)self venueCardCoordinator];
    id v14 = [v13 topViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v12 = v15;

    uint64_t v16 = [v21 firstObject];
    [(VenuesManager *)self->_venuesManager displayFloorForSelectedSearchResult:v16];
    id v17 = [v9 venueCategoryItem];

    unsigned int v18 = [v17 isAutoCompleteCategory];
    if (v18)
    {
      id v19 = [v12 contentDownloader];
      [v19 searchDidReceiveAutoCompleteSubcategories:v8];
    }
    int64_t v20 = [v12 contentDownloader];
    [v20 searchDidReceiveResults:v21];

    id v9 = (id)v16;
  }
}

- (void)routePlanningDataCoordinator:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [(ActionCoordinator *)self platformController];
    id v8 = [v7 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = [v6 directionItemForCurrentSession];
    if (![self->_currentDirectionItem isEquivalentAsWaypointToDirectionItem:v11])objc_storeStrong((id *)&self->_currentDirectionItem, v11); {
    if (v10)
    }
    {
      id v12 = [v10 configuration];
      -[ActionCoordinator _enterRoutePlanningOverviewAnimated:saveMapCamera:completion:](self, "_enterRoutePlanningOverviewAnimated:saveMapCamera:completion:", 1, [v12 shouldRestoreCamera], 0);
    }
    else
    {
      id v13 = [(ActionCoordinator *)self platformController];
      id v14 = [v13 currentSession];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136315906;
          int64_t v20 = "-[ActionCoordinator routePlanningDataCoordinator:isEnabled:]";
          __int16 v21 = 2080;
          id v22 = "ActionCoordinator.m";
          __int16 v23 = 1024;
          int v24 = 5137;
          __int16 v25 = 2080;
          CFStringRef v26 = "[self.platformController.currentSession isKindOfClass:[RideBookingPlanningSession class]]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
        }

        if (sub_100BB36BC())
        {
          id v17 = sub_1005762E4();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            unsigned int v18 = +[NSThread callStackSymbols];
            int v19 = 138412290;
            int64_t v20 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
          }
        }
      }
      [(ActionCoordinator *)self _enterRoutePlanningOverviewAnimated:1 completion:0];
    }

    goto LABEL_14;
  }
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v10 = [(ActionCoordinator *)self currentViewController];
    [(ActionCoordinator *)self closeRoutePlanningViewController:v10 withSender:0];
LABEL_14:
  }
}

- (void)_enterRoutePlanningOverviewAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)_enterRoutePlanningOverviewAnimated:(BOOL)a3 saveMapCamera:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v72 = a3;
  id v7 = a5;
  +[CATransaction setFrameStallSkipRequest:1];
  id v8 = [(ActionCoordinator *)self routePlanningOverviewViewController];
  id v9 = [(ActionCoordinator *)self currentViewController];

  id v10 = sub_1005768D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = objc_retainBlock(v7);
    *(_DWORD *)long long buf = 134350082;
    v75 = self;
    __int16 v76 = 1024;
    *(_DWORD *)v77 = v72;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v5;
    __int16 v78 = 2112;
    id v79 = v11;
    __int16 v80 = 1024;
    BOOL v81 = v9 != v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated: %d saveMapCamera: %d completion: %@ presentOverview: %d", buf, 0x28u);
  }
  if (v9 != v8 && ![self->_currentDirectionItem isVenueItem])
  {
    id v12 = [(ActionCoordinator *)self currentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      id v14 = v8;
      uint64_t v15 = sub_1000BBB44(WeakRetained);

      BOOL v16 = v15 == 5;
      id v8 = v14;
      if (!v16)
      {
        id v17 = sub_1005768D4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134349056;
          v75 = self;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated, saving selection state", buf, 0xCu);
        }

        unsigned int v18 = [(ActionCoordinator *)self mapSelectionManager];
        int v19 = [v18 selectionStateIncludingCamera:v5 includeNotCustomLabelMarkers:1];
        routePlanningSelectionRestorationState = self->_routePlanningSelectionRestorationState;
        self->_routePlanningSelectionRestorationState = v19;

        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  unsigned int v18 = [(ActionCoordinator *)self platformController];
  uint64_t v21 = [v18 previousSession];
  if (!v21)
  {
LABEL_17:

    goto LABEL_18;
  }
  id v22 = (void *)v21;
  BOOL v71 = v9;
  __int16 v23 = v8;
  int v24 = [(ActionCoordinator *)self platformController];
  __int16 v25 = [v24 previousSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_16:
    id v8 = v23;
    id v9 = v71;
    goto LABEL_17;
  }
  id v70 = v7;
  CFStringRef v26 = [(ActionCoordinator *)self platformController];
  uint64_t v27 = [v26 previousSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v7 = v70;
    goto LABEL_16;
  }
  double v61 = [(ActionCoordinator *)self platformController];
  id v62 = [v61 previousSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v8 = v23;
  id v7 = v70;
  id v9 = v71;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v63 = sub_1005768D4();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134349056;
      v75 = self;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated, deleting selection state", buf, 0xCu);
    }

    unsigned int v18 = self->_routePlanningSelectionRestorationState;
    self->_routePlanningSelectionRestorationState = 0;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v28 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  unint64_t v29 = (unint64_t)[(ActionCoordinator *)self displayedViewMode] + 1;
  if (v29 > 7) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = dword_100F71B64[v29];
  }
  id v31 = sub_100018584();
  [v31 setMapType:v30];

  unsigned int v32 = +[CarDisplayController sharedInstance];
  [v32 updateMapsSuggestionsSignalForMapType:v30];

  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    BOOL v33 = 0;
  }
  else
  {
    dispatch_time_t v34 = [(ActionCoordinator *)self currentViewController];
    BOOL v33 = v34 == self->_routeSearchVC;
  }
  if (![(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v35 = sub_1005768D4();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134349056;
      v75 = self;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated: Route planning is not currently presented", buf, 0xCu);
    }

    id v36 = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v37 = sub_1000BBB44(v36);

    if (v37 == 5)
    {
      id v38 = [(ActionCoordinator *)self appCoordinator];
      [v38 closeSharedTrips];

      [(ActionCoordinator *)self clearSearch];
    }
    __int16 v39 = [(ActionCoordinator *)self containerViewController];
    CFStringRef v40 = [v39 topMostPresentedViewController];
    objc_opt_class();
    char v41 = objc_opt_isKindOfClass();

    if (v41)
    {
      uint64_t v42 = v8;
      uint64_t v43 = sub_10057637C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        char v44 = [(ActionCoordinator *)self containerViewController];
        uint64_t v45 = [v44 topMostPresentedViewController];
        *(_DWORD *)long long buf = 134349314;
        v75 = self;
        __int16 v76 = 2112;
        *(void *)v77 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%{public}p] _enterRoutePlanningOverviewAnimated: Need to present a RoutePlanning VC but there is an SFSafariViewController (%@) present. Dismissing it first.", buf, 0x16u);
      }
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_1006F36F0;
      v73[3] = &unk_1012E5D08;
      v73[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:v73];
      id v8 = v42;
    }
    [(ActionCoordinator *)self setIsRoutePlanningPresented:1];
    int64_t v46 = [(ActionCoordinator *)self displayedViewMode];
    double v47 = [(ActionCoordinator *)self routePlanningMapController];
    [v47 saveOriginalMapViewModeAs:v46];

    [v28 refreshRidesharingOptionsIfVisible];
    id v48 = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v49 = sub_1000BBB44(v48);

    if (v49 == 5) {
      [v28 refreshVirtualGarage];
    }
    [v28 setupDataForCurrentObservers];
  }
  double v50 = sub_1005768D4();
  BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);
  if (v9 != v8)
  {
    if (v51)
    {
      *(_DWORD *)long long buf = 134349312;
      v75 = self;
      __int16 v76 = 1024;
      *(_DWORD *)v77 = v33;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated: Presenting route planning now with edited direction intent: %d", buf, 0x12u);
    }

    uint64_t v52 = [(ActionCoordinator *)self currentViewController];
    routeSearchVC = self->_routeSearchVC;

    if (v52 == routeSearchVC)
    {
      double v54 = self->_routeSearchVC;
      self->_routeSearchVC = 0;
    }
    [(ActionCoordinator *)self _setRouteSelectionMapState];
    if (v33)
    {
      id v55 = +[DirectionsHistoryRecordingHelper destinationGEOMapItemToRecordWithDirectionItem:self->_currentDirectionItem];
      if (v55) {
        +[HistoryEntryRecentsItem saveGeoMapItem:v55];
      }
      double v56 = [(ActionCoordinator *)self containerViewController];
      BOOL v57 = [(ActionCoordinator *)self containerViewController];
      BOOL v58 = [v57 currentViewController];
      [v56 popLastViewControllerFromViewController:v58 animated:v72 useDefaultContaineeLayout:0];
    }
    id v59 = objc_loadWeakRetained((id *)&self->_containerViewController);
    if (sub_1000BBB44(v59) == 5 && ![v28 desiredTransportType])
    {
      id v64 = [v28 requestState];

      if (v64) {
        goto LABEL_48;
      }
      id v65 = [(ActionCoordinator *)self containerViewController];
      v66 = [v65 chromeViewController];
      id v59 = [v66 defaultTransportTypeFinder];

      unsigned int v67 = [v59 geoIdealTransportTypeForOrigin:0 destination:kCLLocationCoordinate2DInvalid.latitude ignoreMapType:kCLLocationCoordinate2DInvalid.longitude] - 1;
      if (v67 > 5) {
        uint64_t v68 = 1;
      }
      else {
        uint64_t v68 = qword_100F71B88[v67];
      }
      [v28 updateTransportType:v68];
    }

LABEL_48:
    id v60 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v60 presentController:v8 animated:v72 useDefaultContaineeLayout:1 completion:v7];

    goto LABEL_52;
  }
  if (v51)
  {
    *(_DWORD *)long long buf = 134349056;
    v75 = self;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated: Route planning is already presented; will update route selection map state",
      buf,
      0xCu);
  }

  [(ActionCoordinator *)self _setRouteSelectionMapState];
LABEL_52:
}

- (void)exitRoutePlanningIfNeededAnimated:(BOOL)a3
{
}

- (void)_exitRoutePlanningIfNeededAnimated:(BOOL)a3 restoreStashedMapSelection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = sub_1005768D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v23 = 134349568;
    int v24 = self;
    __int16 v25 = 1024;
    BOOL v26 = v5;
    __int16 v27 = 1024;
    BOOL v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] _exitRoutePlanningIfNeededAnimated: %d, restoreStashedMapSelection: %d", (uint8_t *)&v23, 0x18u);
  }

  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    [(ActionCoordinator *)self clearSearchIfOriginatedFromWaypointEditor];
    id v8 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v9 = [v8 resolvedWaypointSet];
    id v10 = [v9 destination];

    [(ActionCoordinator *)self _cleanupRoutePlanningIfNeededAnimated:v5];
    id v11 = [(ActionCoordinator *)self routePlanningOverviewViewController];
    id v12 = [(ActionCoordinator *)self currentViewController];
    id v13 = [(ActionCoordinator *)self venueCardCoordinator];
    id v14 = [v13 topViewController];

    if (v12 == v14)
    {
      uint64_t v15 = [(ActionCoordinator *)self venueCardCoordinator];
      [v15 popVenueCardItem:0];
    }
    BOOL v16 = [(ActionCoordinator *)self containerViewController];
    [v16 popLastViewControllerFromViewController:v11 animated:v5 useDefaultContaineeLayout:0];

    if (!v4) {
      goto LABEL_14;
    }
    id v17 = self->_routePlanningSelectionRestorationState;
    if (v17)
    {
      unsigned int v18 = [(ActionCoordinator *)self mapSelectionManager];
      [v18 restoreSelectionState:v17 animated:v5];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      uint64_t v20 = sub_1000BBB44(WeakRetained);

      if (v20 != 5)
      {
LABEL_13:

LABEL_14:
        uint64_t v21 = sub_1005768D4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "_exitRoutePlanningIfNeededAnimated, deleting selection state", (uint8_t *)&v23, 2u);
        }

        routePlanningSelectionRestorationState = self->_routePlanningSelectionRestorationState;
        self->_routePlanningSelectionRestorationState = 0;

        goto LABEL_17;
      }
    }
    [(ActionCoordinator *)self viewController:0 selectLastDirectionsDestinationComposedWaypoint:v10];
    goto LABEL_13;
  }
  id v10 = sub_1005768D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v23 = 134349056;
    int v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] _exitRoutePlanningIfNeededAnimated: Route planning is not presented; ignoring",
      (uint8_t *)&v23,
      0xCu);
  }
LABEL_17:
}

- (void)_cleanupRoutePlanningIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    [(ActionCoordinator *)self setIsRoutePlanningPresented:0];
    BOOL v5 = [(ActionCoordinator *)self platformController];
    id v6 = [v5 currentSession];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v8 = [(ActionCoordinator *)self routePlanningMapController];
      [v8 clearMapState:v3];

      [(RoutePlanningMapController *)self->_routePlanningMapController restoreOriginalMapViewMode:v3];
      [(ActionCoordinator *)self updateMapApplicationState:0];
    }
    id v9 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    [v9 stop];

    id v11 = [(ActionCoordinator *)self containerViewController];
    id v10 = [v11 chromeViewController];
    [v10 setNeedsUpdateComponent:@"lookAroundButton" animated:1];
  }
}

- (void)_setRouteSelectionMapState
{
  BOOL v3 = [(ActionCoordinator *)self mapSelectionManager];
  unsigned int v4 = [v3 hasSelection];

  if (v4)
  {
    BOOL v5 = [(ActionCoordinator *)self mapSelectionManager];
    [v5 clearSelection];
  }
  [(ActionCoordinator *)self updateMapApplicationState:1];
  id v6 = [(ActionCoordinator *)self routePlanningMapController];
  [v6 setSelectCurrentRoute:1];
}

- (void)routePlanningUpdatedWaypoints:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v16 = v4;
    BOOL v5 = [(ActionCoordinator *)self containerViewController];
    id v6 = [v5 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v4 = v16;
    if (isKindOfClass)
    {
      id v8 = [(ActionCoordinator *)self containerViewController];
      id v9 = [v8 currentViewController];

      id v10 = [v16 origin];
      id v11 = [v10 geoMapItem];
      id v12 = [v11 timezone];
      [v9 setOriginTimeZone:v12];

      id v13 = [v16 destination];
      id v14 = [v13 geoMapItem];
      uint64_t v15 = [v14 timezone];
      [v9 setDestinationTimeZone:v15];

      id v4 = v16;
    }
  }
}

- (void)presentRoutePlanningViewType:(int64_t)a3
{
  BOOL v5 = sub_1005768D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "presentRoutePlanningViewType: %ld", buf, 0xCu);
  }

  switch(a3)
  {
    case 0:
      [(ActionCoordinator *)self _enterRoutePlanningOverviewAnimated:1 completion:0];
      return;
    case 1:
      id v8 = [(ActionCoordinator *)self routeSearchVC];
      [v8 setPauseSelectionUpdates:1];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1006F41DC;
      v29[3] = &unk_1012E7D28;
      id v9 = v8;
      id v30 = v9;
      id v6 = objc_retainBlock(v29);
      [v9 updateFieldsWithCurrentDirectionItem];
      id v10 = [(ActionCoordinator *)self containerViewController];
      id v11 = [v10 traitCollection];
      id v12 = [v11 userInterfaceIdiom];

      if (v12 != (id)5)
      {
        BOOL v26 = [(ActionCoordinator *)self containerViewController];
        [v26 removeControllerFromStack:v9];

        id v7 = (RoutePlanningEbikeOptionsViewController *)v9;
        __int16 v27 = +[MKMapService sharedService];
        [v27 captureUserAction:3006 onTarget:[self currentUITargetForAnalytics] eventValue:0];

        break;
      }
      if ([self->_currentDirectionItem transportType])
      {
        id v13 = [(ActionCoordinator *)self routePlanningDataCoordinator];
        [v13 updateTransportType:[self->_currentDirectionItem transportType]];
      }
      [(ActionCoordinator *)self _enterRoutePlanningOverviewAnimated:1 completion:v6];

      return;
    case 2:
      uint64_t v14 = [(ActionCoordinator *)self routeStepsVC];
      goto LABEL_15;
    case 3:
      uint64_t v14 = [(ActionCoordinator *)self timePickingVC];
      goto LABEL_15;
    case 4:
      uint64_t v14 = [(ActionCoordinator *)self routeOptionsVC];
      goto LABEL_15;
    case 5:
      uint64_t v14 = [(ActionCoordinator *)self incidentsVC];
      goto LABEL_15;
    case 6:
      uint64_t v14 = [(ActionCoordinator *)self routingAppsVC];
LABEL_15:
      id v7 = (RoutePlanningEbikeOptionsViewController *)v14;
      goto LABEL_16;
    case 7:
      id v7 = [(ActionCoordinator *)self autosharingVC];
      int v19 = [(PlatformController *)self->_platformController currentSession];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = v20;

      id v22 = [v21 automaticSharingContacts];

      if (v22) {
        int v23 = v22;
      }
      else {
        int v23 = &__NSArray0__struct;
      }
      [(RoutePlanningEbikeOptionsViewController *)v7 setContacts:v23];

      goto LABEL_16;
    case 8:
      int v24 = [RoutePlanningEbikeOptionsViewController alloc];
      __int16 v25 = [(ActionCoordinator *)self routePlanningDataCoordinator];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1006F421C;
      v28[3] = &unk_1012F5600;
      v28[4] = self;
      id v7 = [(RoutePlanningOptionsViewController *)v24 initWithDataCoordinator:v25 automaticallySaveChanges:0 completionHandler:v28];

LABEL_16:
      id v6 = 0;
      break;
    default:
      id v6 = 0;
      id v7 = 0;
      break;
  }
  if ([(RoutePlanningEbikeOptionsViewController *)v7 modalPresentationStyle] == (id)7)
  {
    uint64_t v15 = [(RoutePlanningEbikeOptionsViewController *)v7 popoverPresentationController];
    id v16 = [v15 delegate];

    if (!v16)
    {
      id v17 = [(RoutePlanningEbikeOptionsViewController *)v7 popoverPresentationController];
      [v17 setDelegate:self];
    }
    unsigned int v18 = [(ActionCoordinator *)self containerViewController];
    [v18 _maps_topMostPresentViewController:v7 animated:1 completion:0];
  }
  else
  {
    unsigned int v18 = [(ActionCoordinator *)self containerViewController];
    [v18 presentController:v7 animated:1 completion:v6];
  }
}

- (void)refreshRoutePlanningTimingIfNeeded
{
  BOOL v3 = [(ActionCoordinator *)self containerViewController];
  id v11 = [v3 currentOrPendingViewController];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = v11;
  if (isKindOfClass)
  {
    id v6 = v11;
    id v7 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v8 = [v7 routeCollection];
    id v9 = [v8 currentRoute];

    if (v9) {
      id v10 = [v9 shouldShowSchedule];
    }
    else {
      id v10 = 0;
    }
    [v6 setShowArriveBy:v10 animated:1];

    BOOL v5 = v11;
  }
}

- (void)switchRoutePlanningTransportTypeToType:(int64_t)a3
{
  id v4 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  [v4 updateTransportType:a3];
}

- (void)_carPlayWantsToDisplayEVOnboarding:(id)a3
{
  id v4 = a3;
  if ([(EVOnboardingController *)self->_vehicleOnboardingController state] < 1
    || [(EVOnboardingController *)self->_vehicleOnboardingController state] > 4)
  {
    BOOL v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"EVOnboardingCarPlayVehicleKey"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [v5 objectForKeyedSubscript:@"EVOnboardingCarPlayDictionaryKey"];
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v8 = sub_1005761B4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v16 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_carPlayWantsToDisplayEVOnboarding: will display onboarding for vehicle: %@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        uint64_t v14 = v6;
        id v9 = +[NSArray arrayWithObjects:&v14 count:1];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1006F469C;
        v11[3] = &unk_1012E6690;
        objc_copyWeak(&v13, (id *)buf);
        id v7 = v7;
        id v12 = v7;
        [(ActionCoordinator *)self presentVehicleOnboardingWithVehicles:v9 completion:v11];

        objc_destroyWeak(&v13);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v10 = sub_1005761B4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v16 = v5;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "_carPlayWantsToDisplayEVOnboarding: Received invalid dictionaryKey object through notification: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v7 = sub_1005761B4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "_carPlayWantsToDisplayEVOnboarding: Received invalid vehicle object through notification: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v5 = sub_1005761B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "_carPlayWantsToDisplayEVOnboarding: will not present another CP onboarding as we have already presented one.", buf, 2u);
    }
  }
}

- (void)presentEditNoteViewControllerWithInitialText:(id)a3 libraryAccessProvider:(id)a4 placeMUID:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_retainBlock(v12);
  id noteEditorCompletionBlock = self->_noteEditorCompletionBlock;
  self->_id noteEditorCompletionBlock = v13;

  uint64_t v15 = [[_TtC4Maps27PlaceNoteEditViewController alloc] initWithNote:v10];
  objc_initWeak(&location, self);
  int v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_1006F4874;
  id v22 = &unk_1012F5C80;
  objc_copyWeak(v26, &location);
  id v16 = v11;
  id v23 = v16;
  int v24 = self;
  v26[1] = (id)a5;
  id v17 = v10;
  id v25 = v17;
  [(PlaceNoteEditViewController *)v15 setDismissHandler:&v19];
  unsigned int v18 = [(ActionCoordinator *)self containerViewController];
  [v18 presentController:v15 animated:1];

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)presentVehicleOnboardingWithVehicles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1005761B4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self;
    if (!v9)
    {
      uint64_t v14 = @"<nil>";
      goto LABEL_10;
    }
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      id v12 = [(ActionCoordinator *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        uint64_t v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    uint64_t v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543874;
    uint64_t v20 = v14;
    __int16 v21 = 2080;
    id v22 = "-[ActionCoordinator presentVehicleOnboardingWithVehicles:completion:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s, vehicles: %@", buf, 0x20u);
  }
  uint64_t v15 = [[EVOnboardingController alloc] initWithUnpairedVehicles:v6];
  vehicleOnboardingController = self->_vehicleOnboardingController;
  self->_vehicleOnboardingController = v15;

  id v17 = self->_vehicleOnboardingController;
  unsigned int v18 = [(ActionCoordinator *)self containerViewController];
  [(EVOnboardingController *)v17 presentInViewController:v18 animated:1 completion:v7];
}

- (void)presentPreferredNetworksOnboardingForVehicle:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1005761B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(ActionCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543874;
    id v17 = v11;
    __int16 v18 = 2080;
    int v19 = "-[ActionCoordinator presentPreferredNetworksOnboardingForVehicle:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s, vehicle: %@", buf, 0x20u);
  }
  id v12 = [[PreferredNetworksOnboardingController alloc] initWithVehicle:v4];
  preferredNetworksOnboardingController = self->_preferredNetworksOnboardingController;
  self->_preferredNetworksOnboardingController = v12;

  uint64_t v14 = self->_preferredNetworksOnboardingController;
  uint64_t v15 = [(ActionCoordinator *)self containerViewController];
  [(PreferredNetworksOnboardingController *)v14 presentInViewController:v15 animated:1 completion:0];
}

- (void)_presentMacRouteEditingWithEditRequired:(unint64_t)a3 index:(unint64_t)a4
{
  [(ActionCoordinator *)self presentRoutePlanningViewType:1];
  if (a3)
  {
    id v9 = [self->_currentDirectionItem items];
    id v7 = [(ActionCoordinator *)self routeSearchVC];
    [v7 updateWithItems:v9];

    if ((unint64_t)[v9 count] > a4)
    {
      id v8 = [(ActionCoordinator *)self routeSearchVC];
      [v8 selectFieldIndex:a4];
    }
  }
}

- (void)closeRoutePlanningViewController:(id)a3 withSender:(id)a4
{
  id v6 = (RouteIncidentsViewController *)a3;
  id v7 = (RouteIncidentsViewController *)a4;
  id v8 = sub_1005768D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v30 = 138412546;
    *(void *)&void v30[4] = v6;
    __int16 v31 = 2112;
    int64_t v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "closeRoutePlanningViewController: %@ sender: %@", v30, 0x16u);
  }

  id v9 = [(ActionCoordinator *)self containerViewController];
  id v10 = [v9 traitCollection];
  if ([v10 userInterfaceIdiom] != (id)5)
  {

LABEL_7:
    id v12 = [(ActionCoordinator *)self currentViewController];

    if (v12 != v6)
    {
      id v13 = sub_1005768D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [(ActionCoordinator *)self currentViewController];
        *(_DWORD *)id v30 = 138412546;
        *(void *)&void v30[4] = v14;
        __int16 v31 = 2112;
        int64_t v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Aborting closing route planning as %@ does not equal %@", v30, 0x16u);
      }
LABEL_42:

      goto LABEL_43;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [(RouteIncidentsViewController *)v6 presentedViewController];

      if (v15)
      {
        id v16 = [(ActionCoordinator *)self containerViewController];
        [v16 dismissViewControllerAnimated:1 completion:0];

        goto LABEL_43;
      }
    }
    id v13 = [(ActionCoordinator *)self routePlanningOverviewViewControllerIfLoaded];
    if (v13)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v13 == v6 || (isKindOfClass & 1) == 0) {
        goto LABEL_22;
      }
      __int16 v18 = sub_1005768D4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v30 = 0;
        int v19 = "The overview VC does not point to the current overview VC being dismissed";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, v30, 2u);
      }
    }
    else
    {
      __int16 v18 = sub_1005768D4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v30 = 0;
        int v19 = "The overview VC is not set at the point of closing";
        goto LABEL_20;
      }
    }

LABEL_22:
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();
    id v21 = [(ActionCoordinator *)self platformController];
    id v22 = [v21 currentSession];
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = 0;
      }
      else
      {
        BOOL v26 = [(ActionCoordinator *)self platformController];
        __int16 v27 = [v26 previousSession];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v23 = 0;
        }
        else {
          uint64_t v23 = [(SearchViewController *)self->_searchModeViewController shouldRetainSearchQuery] ^ 1;
        }
      }
      [(ActionCoordinator *)self _exitRoutePlanningIfNeededAnimated:1 restoreStashedMapSelection:v23];
    }
    else
    {
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();

      if (v24)
      {
        id v25 = [(ActionCoordinator *)self containerViewController];
        [v25 popLastViewControllerFromViewController:v6 animated:1 useDefaultContaineeLayout:0];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v25 = [(ActionCoordinator *)self containerViewController];
          [v25 popLastViewControllerAnimated:1];
        }
        else
        {
          unsigned int v28 = [(ActionCoordinator *)self isRoutePlanningPresented];
          id v25 = [(ActionCoordinator *)self containerViewController];
          if (v28) {
            [(ActionCoordinator *)self routePlanningOverviewViewController];
          }
          else {
          unint64_t v29 = [(ActionCoordinator *)self routeSearchVC];
          }
          [v25 popLastViewControllerFromViewController:v29 animated:1 useDefaultContaineeLayout:0 v30];
        }
      }
    }
    if (self->_incidentsVC == v6) {
      [(RouteIncidentsViewController *)v6 resetForDismiss];
    }
    if ((RouteIncidentsViewController *)self->_routeSearchVC == v6)
    {
      self->_routeSearchVC = 0;
    }
    goto LABEL_42;
  }
  id v11 = [(RouteIncidentsViewController *)v6 modalPresentationStyle];

  if (v11 != (id)7) {
    goto LABEL_7;
  }
  [(RouteIncidentsViewController *)v6 dismissViewControllerAnimated:1 completion:0];
LABEL_43:
}

- (void)setRoutePlanningIncidentsSourceView:(id)a3
{
}

- (void)setRoutePlanningAdvisoriesInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self incidentsVC];
  [v5 setAdvisoriesInfo:v4];
}

- (void)setRoutePlanningAdvisory:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self incidentsVC];
  [v5 setAdvisory:v4];
}

- (void)presentScheduleForStep:(id)a3
{
  id v4 = a3;
  id v8 = [[TransitSchedulesViewController alloc] initWithTransitRouteStep:v4];

  [(TransitSchedulesViewController *)v8 setActionCoordinator:self];
  [(ContaineeViewController *)v8 setContaineeDelegate:self];
  [(TransitSchedulesViewController *)v8 setTransitSchedulesDelegate:self];
  [(ControlContaineeViewController *)v8 setDelegate:self];
  if (sub_1000BBB44(v8) != 5)
  {
    id v5 = [(ContaineeViewController *)v8 cardPresentationController];
    [v5 setPresentedModally:0];

    id v6 = [(ContaineeViewController *)v8 cardPresentationController];
    [v6 setTakesAvailableHeight:0];
  }
  id v7 = [(ActionCoordinator *)self containerViewController];
  [v7 presentController:v8 animated:1];
}

- (void)selectWaypointSearchFieldIndex:(unint64_t)a3 exitPlanningIfCancelTapped:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ActionCoordinator *)self routeSearchVC];
  [v6 setExitRoutePlanningOnCancel:v4];
  [v6 selectFieldIndex:a3];
}

- (void)ensureRoutePlanningContentIsVisible
{
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    routePlanningMapController = self->_routePlanningMapController;
    [(RoutePlanningMapController *)routePlanningMapController updateCameraIfPossible];
  }
}

- (void)presentPOIEnrichmentInformedConsentWithPresentationContext:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(ActionCoordinator *)self containerViewController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006F56A0;
  v9[3] = &unk_1012EC3B8;
  id v10 = v6;
  id v8 = v6;
  +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:v7 presentationContext:a3 completion:v9];
}

- (void)addRatingsForMapItem:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v4 isPlaceHolderPlace:0];

  id v5 = +[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:v6 initialOverallState:0 entryPoint:0 originTarget:@"SEARCH_TRAY"];
  [v5 setSubmissionStatusDelegate:self];
  [v5 setPresentationContext:2];
  [(ActionCoordinator *)self viewControllerPresentPOIEnrichmentWithCoordinator:v5];
}

- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4
{
  placeCardViewController = self->_placeCardViewController;
  id v6 = (void (**)(id, id))a4;
  [(ActionCoordinator *)self dismissPlaceCardViewController:placeCardViewController];
  id v7 = [(ActionCoordinator *)self containerViewController];
  v6[2](v6, v7);
}

- (void)poiEnrichmentCoordinatorDidFinish:(id)a3
{
  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = 0;
}

- (void)poiEnrichmentCoordinator:(id)a3 openURL:(id)a4
{
  id v6 = a4;
  id v7 = [a3 presentingViewController];
  [(ActionCoordinator *)self viewController:v7 openURL:v6];
}

- (void)viewControllerPresentPOIEnrichmentWithCoordinator:(id)a3
{
  id v13 = a3;
  p_poiEnrichmentCoordinator = &self->_poiEnrichmentCoordinator;
  objc_storeStrong((id *)&self->_poiEnrichmentCoordinator, a3);
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setDelegate:self];
  id v6 = [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator presentationDelegate];

  if (!v6) {
    [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPresentationDelegate:self];
  }
  id v7 = [(UGCPOIEnrichmentCoordinator *)*p_poiEnrichmentCoordinator placeCardDismissalDelegate];

  if (!v7) {
    [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPlaceCardDismissalDelegate:self];
  }
  id v8 = [(UGCPOIEnrichmentCoordinator *)*p_poiEnrichmentCoordinator containerViewController];

  if (!v8)
  {
    id v9 = [(ActionCoordinator *)self containerViewController];
    [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setContainerViewController:v9];
  }
  id v10 = [(UGCPOIEnrichmentCoordinator *)*p_poiEnrichmentCoordinator containeeDelegate];

  if (!v10) {
    [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setContaineeDelegate:self];
  }
  id v11 = [(UGCPOIEnrichmentCoordinator *)*p_poiEnrichmentCoordinator presentingViewController];

  if (!v11)
  {
    id v12 = [(ActionCoordinator *)self containerViewController];
    [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPresentingViewController:v12];
  }
  [(UGCPOIEnrichmentCoordinator *)*p_poiEnrichmentCoordinator present];
}

- (void)viewControllerShowPhotoCredit:(id)a3
{
  id v8 = a3;
  id v4 = [[PhotoCreditViewController alloc] initWithCompletionHandler:&stru_1012F5CC0];
  [(ContaineeViewController *)v4 setContaineeDelegate:self];
  id v5 = [(ActionCoordinator *)self containerViewController];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 == 5)
  {
    [v8 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v4 animated:1];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v26 = a3;
  if ([(ActionCoordinator *)self isRoutePlanningPresented])
  {
    id v7 = [(ActionCoordinator *)self containerViewController];
    id v8 = [v7 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      -[RoutePlanningMapController didTapMapView:atPoint:](self->_routePlanningMapController, "didTapMapView:atPoint:", v26, x, y);
    }
  }
  id v10 = [(ActionCoordinator *)self containerViewController];
  id v11 = [v10 chromeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(ActionCoordinator *)self containerViewController];
    id v13 = [v12 chromeViewController];
    unsigned int v14 = [v13 mapViewShouldHandleTapToDeselect:v26];

    if (!v14) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v15 = [(ActionCoordinator *)self mapSelectionManager];
  unsigned int v16 = [v15 hasSelection];

  if (v16)
  {
    id v17 = [(ActionCoordinator *)self containerViewController];
    __int16 v18 = [v17 chromeViewController];
    [v18 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

    int v19 = [(ActionCoordinator *)self mapSelectionManager];
    [v19 clearSelection];
  }
  else
  {
    char v20 = [(ActionCoordinator *)self lineSelectionAction];
    unsigned int v21 = [v20 isActive];

    if (v21)
    {
      int v19 = [(ActionCoordinator *)self lineSelectionAction];
      [v19 deactivateWithContext:0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      uint64_t v23 = [WeakRetained currentViewController];
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();

      if ((v24 & 1) == 0) {
        goto LABEL_15;
      }
      int v19 = objc_loadWeakRetained((id *)&self->_containerViewController);
      id v25 = [v19 currentViewController];
      [(ActionCoordinator *)self viewControllerClosed:v25 animated:1];
    }
  }

LABEL_15:
}

- (void)deferPresentingMapPopoversInsideBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)pptTestPresentPlaceCardForSearchResult:(id)a3 animated:(BOOL)a4
{
}

- (BOOL)pptTestCanResizePlacecard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained containerStyle];

  return (((unint64_t)v3 - 2) & 0xFFFFFFFFFFFFFFFALL) != 0;
}

- (void)pptTestMaximizePlaceCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setLayoutIfSupported:3 animated:v3];
}

- (void)pptTestMinimizePlaceCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setLayoutIfSupported:1 animated:v3];
}

- (void)pptTestMediumizePlaceCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setLayoutIfSupported:2 animated:v3];
}

- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3
{
  id v4 = [(ActionCoordinator *)self searchModeViewController];
  [v4 selectNearbyCategoryAtIndex:a3];
}

- (void)pptTestSearchRetainQueryForSelectedSearchCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 retainSearchQueryForSelectedAutocompleteItem:v4 forTimeInterval:1.79769313e308];
}

- (void)pptTestAutocompleteSearchForFieldItem:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 updateSearchFieldWithItem:v4];
}

- (void)pptTestSearchEndEditing
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  [v2 endEditing];
}

- (void)pptAssertSearch
{
  BOOL v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  id v5 = [(ActionCoordinator *)self currentViewController];
  if (v4 != (id)5)
  {
    id v6 = v5;
    [(ActionCoordinator *)self searchModeViewController];

    id v5 = v6;
  }
}

- (void)pptTestSearchForFieldItem:(id)a3
{
  id v4 = a3;
  [(ActionCoordinator *)self pptAssertSearch];
  id v5 = +[UIApplication sharedApplication];
  [v5 sendAction:"resignFirstResponder" toTarget:0 fromSender:0 forEvent:0];

  [(ActionCoordinator *)self viewController:0 doSearchItem:v4 withUserInfo:0];
  id v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)5)
  {
    id v8 = [(ActionCoordinator *)self searchModeViewController];
    [v8 pptSetSearchDataSource];
  }
}

- (void)pptTestEnterSearchMode
{
  +[CATransaction setFrameStallSkipRequest:1];
  [(ActionCoordinator *)self pptAssertSearch];
  BOOL v3 = [(ActionCoordinator *)self searchModeViewController];
  [v3 pptSearchBarShouldProvideTextChangeNotification];

  id v4 = [(ActionCoordinator *)self currentViewController];
  id v5 = [v4 cardPresentationController];
  [v5 wantsLayout:3];

  id v6 = [(ActionCoordinator *)self searchModeViewController];
  [v6 searchBarBecomeFirstResponder];
}

- (void)pptTestSearchCancel
{
  [(ActionCoordinator *)self pptAssertSearch];
  id v3 = [(ActionCoordinator *)self searchModeViewController];
  [v3 conformsToProtocol:&OBJC_PROTOCOL___UISearchBarDelegate];
  [v3 searchBarCancelButtonClicked:0];
}

- (void)pptSelectFirstCuratedGuide
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  [v2 pptSelectFirstCuratedCollection];
}

- (void)pptSelectACSuggestionMatchingAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self searchModeViewController];
  [v5 pptSelectACSuggestionMatchingAddress:v4];
}

- (void)pptSelectSeeAllCuratedCollections
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  [v2 pptSelectSeeAllCuratedCollections];
}

- (void)pptSelectFirstGuidePublisher
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  [v2 pptSelectFirstGuidePublisher];
}

- (void)pptTestCreateCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  +[SearchResult customSearchResultWithCoordinate:](SearchResult, "customSearchResultWithCoordinate:", a4, a3.latitude, a3.longitude);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ActionCoordinator *)self viewController:0 removeDroppedPin:0];
  [(ActionCoordinator *)self viewController:0 createDroppedPin:v5];
}

- (void)pptTestPresentDirectionsDetails
{
}

- (UIViewController)pptTestContaineeForDirectionsDetails
{
  return (UIViewController *)self->_routeStepsVC;
}

- (UIScrollView)pptTestScrollViewForDirectionsDetails
{
  return [(RouteStepsViewController *)self->_routeStepsVC scrollViewForDirectionsDetailsOfCurrentRoute];
}

- (void)pptTestDoDirectionItem:(id)a3
{
  CFStringRef v6 = @"DirectionsSessionInitiatorKey";
  id v7 = &off_1013A8338;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(ActionCoordinator *)self viewController:0 doDirectionItem:v4 withUserInfo:v5];
}

- (void)pptTestStartNavigation
{
  id v2 = [(ActionCoordinator *)self routePlanningOverviewViewController];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestNavigationProtocol]) {
    [v2 pptTestStartNavigation];
  }
}

- (void)pptTestOpenSettings
{
}

- (void)pptTestPresentPlacecardWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [[PlaceCardItem alloc] initWithMapItem:v4];

  [(ActionCoordinator *)self presentPlaceCardForItem:v5 addToHistory:0 source:0 saveSelectionState:1];
}

- (void)pptTestPresentVenueForMapItem:(id)a3 searchCategory:(id)a4
{
}

- (void)pptTestSelectVenueSearchResult:(id)a3
{
}

- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
}

- (int)currentUITargetForAnalytics
{
  id v3 = [(ActionCoordinator *)self currentViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(ActionCoordinator *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentUITargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  id v3 = [(ActionCoordinator *)self currentViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(ActionCoordinator *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentMapViewTargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (void)locationRefinementViewController:(id)a3 didSelectCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[ActionCoordinator viewController:createMarkedLocationAtCoordinate:floorOrdinal:](self, "viewController:createMarkedLocationAtCoordinate:floorOrdinal:", v8, 0x7FFFFFFFLL, latitude, longitude);
    id v7 = [v8 presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)markedLocationRefinementViewControllerSelectedRemoveMarkedLocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 originalMarkedLocation];
  int v6 = [v4 presentingViewController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006F6880;
  v9[3] = &unk_1012E66E0;
  void v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 dismissViewControllerAnimated:1 completion:v9];
}

- (void)markedLocationRefinementViewControllerDidCancel:(id)a3
{
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_prepareToReceiveDrop
{
  [(ActionCoordinator *)self exitRoutePlanningIfNeededAnimated:0];

  [(ActionCoordinator *)self presentSearchAnimated:0];
}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapItem:(id)a4
{
  id v5 = a4;
  [(ActionCoordinator *)self _prepareToReceiveDrop];
  id v7 = [[SearchResult alloc] initWithMapItem:v5];

  int v6 = +[SearchFieldItem searchFieldItemWithObject:v7];
  [(ActionCoordinator *)self viewController:0 doSearchItem:v6 withUserInfo:&__NSDictionary0__struct];
}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveVCard:(id)a4
{
  id v5 = a4;
  [(ActionCoordinator *)self _prepareToReceiveDrop];
  int v6 = [v5 postalAddresses];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [[AddressBookAddress alloc] initWithContact:v5 addressValue:v7];
    id v9 = +[SearchFieldItem searchFieldItemWithObject:v8];
    [(ActionCoordinator *)self viewController:0 doSearchItem:v9 withUserInfo:&__NSDictionary0__struct];
  }
  return v7 != 0;
}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveURL:(id)a4
{
  id v5 = a4;
  [(ActionCoordinator *)self _prepareToReceiveDrop];
  int v6 = +[UIApplication _maps_keyMapsSceneDelegate];
  id v7 = [v6 entryPointsCoordinator];
  id v8 = [(ActionCoordinator *)self containerViewController];
  id v9 = [v8 view];
  id v10 = [v9 window];
  id v11 = [v10 windowScene];
  id v12 = [v11 session];
  id v13 = [(ActionCoordinator *)self containerViewController];
  unsigned int v14 = [v13 view];
  [v14 bounds];
  [v7 openURL:v5 session:v12 sceneOptions:0 mkOptions:0 windowSize:v15 v16];

  return 1;
}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveString:(id)a4 nearCoordinate:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v8 = a4;
  [(ActionCoordinator *)self _prepareToReceiveDrop];
  id v9 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v9 setSearchString:v8];

  -[SearchFieldItem setCoordinateHint:](v9, "setCoordinateHint:", latitude, longitude);
  [(ActionCoordinator *)self viewController:0 doSearchItem:v9 withUserInfo:&__NSDictionary0__struct];
}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapKitHandle:(id)a4 title:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(ActionCoordinator *)self _prepareToReceiveDrop];
  id v9 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v9 setMapKitHandle:v8];

  [(SearchFieldItem *)v9 setMapKitHandleTitle:v7];
  [(ActionCoordinator *)self viewController:0 doSearchItem:v9 withUserInfo:&__NSDictionary0__struct];
}

- (UIScrollView)pptTestScrollViewForProactive
{
  id v2 = [(ActionCoordinator *)self searchModeViewController];
  id v3 = [v2 scrollViewForProactive];

  return (UIScrollView *)v3;
}

- (void)pptTestOpenRecents
{
}

- (void)pptTestOpenCollections
{
}

- (void)pptTestOpenFirstCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained currentViewController];

  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___PPTTestPresentCollectionProtocol]) {
    [v3 pptPresentFirstCollection];
  }
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if ([WeakRetained containeeLayout] == (id)5)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_containerViewController);
    BOOL v4 = [v5 containeeLayout] != (id)4;
  }
  return v4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 3) {
    unint64_t v6 = a3 + 1;
  }
  else {
    unint64_t v6 = 0;
  }
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v9 = [WeakRetained containeeLayout];

  if (v9 == (id)v6)
  {
    v15[0] = @"ContainerLayout";
    id v10 = +[NSNumber numberWithUnsignedInteger:v6];
    v15[1] = @"ContainerContainee";
    v16[0] = v10;
    id v11 = objc_loadWeakRetained((id *)p_containerViewController);
    id v12 = [v11 currentViewController];
    v16[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayLayoutDidUpdateNotification" object:self userInfo:v13];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)p_containerViewController);
    [v14 setLayoutIfSupported:v6 animated:v4];
  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      return 1;
    case 2:
      id v7 = +[UIDevice currentDevice];
      id v8 = [v7 userInterfaceIdiom];

      uint64_t v9 = [(ActionCoordinator *)self currentViewController];
      BOOL v4 = (void *)v9;
      if (v8 == (id)5)
      {
        BOOL v6 = v9 == 0;
LABEL_11:

        return v6;
      }
      id v5 = [(ActionCoordinator *)self searchModeViewController];
LABEL_10:
      BOOL v6 = v4 == v5;

      goto LABEL_11;
    case 1:
      BOOL v4 = [(ActionCoordinator *)self currentViewController];
      id v5 = [(ActionCoordinator *)self placeCardViewController];
      goto LABEL_10;
  }
  return 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  BOOL v4 = a3;
  id v10 = [(ActionCoordinator *)self routePlanningOverviewViewControllerIfLoaded];
  uint64_t v6 = [(ActionCoordinator *)self currentViewController];
  id v7 = (void *)v6;
  if (v10 && (id)v6 == v10)
  {
    [(ActionCoordinator *)self closeRoutePlanningViewController:v10 withSender:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained popLastViewControllerAnimated:v4];

    uint64_t v9 = [(ActionCoordinator *)self containerViewController];
    [v9 popLastViewControllerFromViewController:v7 animated:v4 useDefaultContaineeLayout:0];
  }
}

- (UIScrollView)pptTestScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained currentViewController];

  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v3 pptTestScrollView];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (UIScrollView *)v4;
}

- (void)didDismissViewController:(id)a3 mapItem:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self mapSelectionManager];
  [v6 selectMapItem:v5 animated:1];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 presentedViewController];
  incidentsVC = self->_incidentsVC;

  if (v4 == incidentsVC)
  {
    [(RouteIncidentsViewController *)self->_incidentsVC resetForDismiss];
  }
  else
  {
    id v6 = [v9 presentedViewController];
    id v7 = [(ActionCoordinator *)self lineCardVC];
    if (v6 == v7)
    {
      unsigned int v8 = [(TransitLineSelectionActionController *)self->_lineSelectionAction isActive];

      if (v8) {
        [(TransitLineSelectionActionController *)self->_lineSelectionAction deactivateWithContext:0];
      }
    }
    else
    {
    }
  }
}

- (void)timingViewController:(id)a3 didPickTiming:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  [v6 updateTiming:v5];
}

- (BOOL)isPedestrianARActive
{
  id v2 = [(ActionCoordinator *)self appCoordinator];
  id v3 = [v2 chromeViewController];
  BOOL v4 = [v3 topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = +[MNNavigationService sharedService];
    BOOL v5 = [v6 state] == (id)3;
  }
  return v5;
}

- (BOOL)isPedestrianARShowingFailureView
{
  if (![(ActionCoordinator *)self isPedestrianARActive]) {
    return 0;
  }
  id v3 = [(ActionCoordinator *)self appCoordinator];
  BOOL v4 = [v3 chromeViewController];
  BOOL v5 = [v4 topContext];
  id v6 = [v5 fullscreenViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    unsigned __int8 v9 = [v8 isShowingFailureView];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)canEnterPedestrianAR
{
  if (!+[PedestrianARSessionTask isPedestrianARModeSupported])
  {
    id v7 = sub_1005768D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      unsigned __int8 v9 = "Cannot enter pedestrian AR because it's not supported on the current device";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, 2u);
    }
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  id v3 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  BOOL v4 = [v3 routeCollection];
  id v5 = [v4 count];

  if (!v5)
  {
    id v7 = sub_1005768D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      unsigned __int8 v9 = "Cannot enter pedestrian AR without a route";
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  id v6 = [(ActionCoordinator *)self platformController];
  id v7 = [v6 pedestrianARSessionStateManager];

  if (([v7 shouldShowPedestrianAR] & 1) == 0)
  {
    id v10 = sub_1005768D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v7 debugDescription];
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Cannot enter pedestrian AR for state manager: %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (void)enterPedestrianAR
{
  id v3 = sub_1005768D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will enter pedestrian AR from route planning", buf, 2u);
  }

  if ([(ActionCoordinator *)self canEnterPedestrianAR])
  {
    objc_initWeak(&location, self);
    BOOL v4 = [(ActionCoordinator *)self containerViewController];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1006F7A3C;
    v25[3] = &unk_1012E6998;
    objc_copyWeak(&v26, &location);
    unsigned __int8 v5 = [v4 showVLFCrowdsourcingPermissionCardWithContaineeDelegate:self delegate:self completion:v25];

    if (v5)
    {
LABEL_23:
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      return;
    }
    id v6 = [(ActionCoordinator *)self containerViewController];
    id v7 = [v6 currentViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
    id v9 = v8;

    id v10 = [(ActionCoordinator *)self containerViewController];
    id v11 = [v10 currentViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v9)
    {
      id v14 = sub_1005768D4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Feature intro teachable moment card is active; dismissing it before entering AR",
          buf,
          2u);
      }
    }
    else
    {
      if (!v13)
      {
LABEL_22:
        uint64_t v24 = 0;
        long long v22 = 0u;
        long long v23 = 0u;
        *(_OWORD *)long long buf = 0u;
        +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions];
        *(void *)&long long v22 = 2;
        *((void *)&v23 + 1) = 0;
        double v16 = [(ActionCoordinator *)self appCoordinator];
        id v17 = [(ActionCoordinator *)self routePlanningDataCoordinator];
        __int16 v18 = [v17 routeCollection];
        v19[0] = *(_OWORD *)buf;
        v19[1] = v22;
        v19[2] = v23;
        uint64_t v20 = v24;
        [v16 startNavigationWithRouteCollection:v18 navigationDetailsOptions:v19];

        goto LABEL_23;
      }
      id v14 = sub_1005768D4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Raise to enter teachable moment card is active; dismissing it before entering AR",
          buf,
          2u);
      }
      id v7 = v11;
    }

    [(ActionCoordinator *)self containeeViewControllerGoToPreviousState:v7 withSender:0];
    goto LABEL_22;
  }
  double v15 = sub_1005768D4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Cannot enter pedestrian AR at the moment", buf, 2u);
  }
}

- (void)exitPedestrianAR
{
  id v2 = [(ActionCoordinator *)self appCoordinator];
  [v2 exitPedestrianAR];
}

- (BOOL)isTeachableMomentCardActive
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isWeatherPopoverActive
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  id v3 = [v2 _maps_mapsSceneDelegate];
  BOOL v4 = [v3 topMostPresentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)showPedestrianARFeatureIntroTeachableMomentCard
{
  if ([(ActionCoordinator *)self isTeachableMomentCardActive])
  {
    id v3 = sub_1005768D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "The Pedestrian AR feature intro teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }
  }
  else
  {
    unsigned __int8 v5 = [[PedestrianARFeatureIntroTeachableMomentContaineeViewController alloc] initWithCoordinator:self];
    [(ContaineeViewController *)v5 setContaineeDelegate:self];
    BOOL v4 = [(ActionCoordinator *)self containerViewController];
    [v4 presentController:v5 animated:1];
  }
}

- (void)showPedestrianARRaiseToEnterTeachableMomentCard
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  BOOL v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = sub_1005768D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The Pedestrian AR raise to enter teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }
  }
  else
  {
    BOOL v8 = objc_alloc_init(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    [(ContaineeViewController *)v8 setContaineeDelegate:self];
    id v7 = [(ActionCoordinator *)self containerViewController];
    [v7 presentController:v8 animated:1];
  }
}

- (void)dismissPedestrianARTeachableMomentCardIfNecessary
{
  if ([(ActionCoordinator *)self isTeachableMomentCardActive]) {
    goto LABEL_3;
  }
  id v3 = [(ActionCoordinator *)self containerViewController];
  BOOL v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_3:
    id v6 = sub_1005768D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(ActionCoordinator *)self containerViewController];
      BOOL v8 = [v7 currentViewController];
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dismissing Pedestrian AR teachable moment card: %@", (uint8_t *)&v12, 0xCu);
    }
    id v9 = [(ActionCoordinator *)self containerViewController];
    id v10 = [(ActionCoordinator *)self containerViewController];
    id v11 = [v10 currentViewController];
    [v9 removeControllerFromStack:v11];
  }
}

- (void)enterPedestrianAR:(id)a3
{
  _os_activity_label_useraction((void *)&_mh_execute_header, "Tapped pedestrian AR button");

  [(ActionCoordinator *)self enterPedestrianAR];
}

- (id)reportsHomeViewController
{
  reportsHomeViewController = self->_reportsHomeViewController;
  if (!reportsHomeViewController)
  {
    BOOL v4 = objc_alloc_init(RAPHomeViewController);
    unsigned __int8 v5 = self->_reportsHomeViewController;
    self->_reportsHomeViewController = v4;

    [(ContaineeViewController *)self->_reportsHomeViewController setContaineeDelegate:self];
    [(ControlContaineeViewController *)self->_reportsHomeViewController setDelegate:self];
    reportsHomeViewController = self->_reportsHomeViewController;
  }

  return reportsHomeViewController;
}

- (void)viewControllerShowReports:(id)a3
{
}

- (void)viewControllerShowReports:(id)a3 fromEntryPoint:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0)
  {
    [(ActionCoordinator *)self _dismissMacToolTipIfNeeded];
    +[CATransaction setFrameStallSkipRequest:1];
    id v6 = [(ActionCoordinator *)self reportsHomeViewController];
    [v6 setEntryPoint:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v7 = [(ActionCoordinator *)self reportsHomeViewController];
    [WeakRetained presentController:v7 animated:1];
  }
}

- (void)viewController:(id)a3 presentReportDetail:(id)a4 fromEntryPoint:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v11 = [WeakRetained _maps_mapsSceneDelegate];
  int v12 = [v11 rapPresenter];
  unsigned int v13 = [v12 presentOfflineAlertIfNecessaryWithCompletion:0];

  if (v13)
  {
    id v14 = sub_100109EF8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = 0;
      double v15 = "can't present ReportDetail because Maps is offline";
      double v16 = (uint8_t *)&v22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v9 || ([v9 reportID], id v17 = objc_claimAutoreleasedReturnValue(), v17, !v17))
  {
    id v14 = sub_100109EF8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = 0;
      double v15 = "can't present ReportDetail because rapRecord or reportID is nil";
      double v16 = (uint8_t *)&v21;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  rapNotificationDetailsCoordinator = self->_rapNotificationDetailsCoordinator;
  if (!rapNotificationDetailsCoordinator)
  {
    int v19 = [[_TtC4Maps33RAPNotificationDetailsCoordinator alloc] initWithParentViewController:v8];
    uint64_t v20 = self->_rapNotificationDetailsCoordinator;
    self->_rapNotificationDetailsCoordinator = v19;

    [(RAPNotificationDetailsCoordinator *)self->_rapNotificationDetailsCoordinator setCoordinator:self];
    rapNotificationDetailsCoordinator = self->_rapNotificationDetailsCoordinator;
  }
  [(RAPNotificationDetailsCoordinator *)rapNotificationDetailsCoordinator presentRAPNotificationDetailsViewControllerWithRapRecord:v9 entryPoint:v5];
LABEL_13:
}

- (void)presentEducationScreenWithAssetURLs:(id)a3 titleText:(id)a4 bodyText:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v13 = [[TransitPayEducationScreenViewController alloc] initWithAssetURLs:v10 titleText:v9 bodyText:v8];

  id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
  int v12 = [(ActionCoordinator *)self containerViewController];
  [v12 _maps_topMostPresentViewController:v11 animated:1 completion:0];
}

- (id)_filteredFeaturesFromTransitSystems:(id)a3 allFeatures:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = v5;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v24;
        id v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
              double v16 = [v9 identifiers];
              id v17 = [v15 identifier];
              unsigned int v18 = [v16 containsObject:v17];

              if (v18)
              {
                id v19 = [v9 copy];
                [v7 addObject:v19];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v12);
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
  }

  id v20 = [v7 copy];

  return v20;
}

- (void)presentWalletDCIViewControllerWithTransitSystems:(id)a3 callbackDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if ([v7 count])
    {
      id v9 = objc_alloc_init((Class)PKPaymentSetupConfiguration);
      [v9 setReferrerIdentifier:@"maps"];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1006F8C14;
      v14[3] = &unk_1012F5D10;
      v14[4] = self;
      id v15 = v7;
      id v16 = v9;
      id v17 = v8;
      SEL v18 = a2;
      id v10 = v9;
      +[PKPaymentSetupViewController paymentSetupFeaturesForConfiguration:v10 completion:v14];

      goto LABEL_13;
    }
    uint64_t v13 = sub_100021338();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      __int16 v21 = 1024;
      int v22 = 6527;
      __int16 v23 = 2082;
      uint64_t v24 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      __int16 v25 = 2082;
      long long v26 = "transitSystems.count == 0u";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems.count cannot be 0", buf, 0x26u);
    }

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      __int16 v21 = 1024;
      int v22 = 6527;
      __int16 v23 = 2082;
      uint64_t v24 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      __int16 v25 = 2082;
      long long v26 = "transitSystems.count == 0u";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems.count cannot be 0";
      goto LABEL_12;
    }
  }
  else
  {
    id v11 = sub_100021338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      __int16 v21 = 1024;
      int v22 = 6526;
      __int16 v23 = 2082;
      uint64_t v24 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      __int16 v25 = 2082;
      long long v26 = "transitSystems == nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems cannot be nil", buf, 0x26u);
    }

    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      __int16 v21 = 1024;
      int v22 = 6526;
      __int16 v23 = 2082;
      uint64_t v24 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      __int16 v25 = 2082;
      long long v26 = "transitSystems == nil";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems cannot be nil";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, v12, buf, 0x26u);
    }
  }
LABEL_13:
}

- (void)presentWalletTopUpViewControllerWithTransitIdentifier:(id)a3 callbackDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100021338();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Showing Wallet Top-Up View Controller", v11, 2u);
  }

  id v9 = [objc_alloc((Class)PKPerformActionSetupViewController) initWithPassIdentifier:v7];
  [v9 setDelegate:v6];

  id v10 = [(ActionCoordinator *)self containerViewController];
  [v10 _maps_topMostPresentViewController:v9 animated:1 completion:0];
}

- (void)presentOfflineMapsSelectorFromTipWithRegion:(id)a3 name:(id)a4
{
}

- (id)traitsForRouteSearchViewController:(id)a3
{
  id v3 = [(ActionCoordinator *)self newTraits];

  return v3;
}

- (void)routeSearchViewControllerDidDismiss:(id)a3 shouldExitRoutePlanning:(BOOL)a4
{
  if (a4) {
    [(ActionCoordinator *)self exitRoutePlanningIfNeededAnimated:1];
  }
  else {
    [(ActionCoordinator *)self closeRoutePlanningViewController:a3 withSender:0];
  }
}

- (void)routeStepsViewController:(id)a3 wantsToShareItem:(id)a4 fromView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ActionCoordinator *)self appCoordinator];
  [v9 shareItem:v8 sourceView:v7 completion:0];
}

- (void)routeStepsViewController:(id)a3 wantsToDisplayScheduleForTransitStep:(id)a4
{
}

- (void)routeStepsViewController:(id)a3 wantsToDisplayAdvisory:(id)a4
{
  [(ActionCoordinator *)self setRoutePlanningAdvisory:a4];

  [(ActionCoordinator *)self presentRoutePlanningViewType:5];
}

- (void)autosharingController:(id)a3 didUpdateContacts:(id)a4
{
}

- (void)autosharingController:(id)a3 wantsToSearchWithExistingContacts:(id)a4 selectionHandler:(id)a5
{
}

- (void)viewController:(id)a3 startDirectionsToRouteData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  id v8 = +[MKLocationManager sharedLocationManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006F9260;
  v11[3] = &unk_1012F5D38;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  id v9 = v7;
  id v12 = v9;
  id v10 = [v8 singleLocationUpdateWithHandler:v11];

  [v10 start];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)viewController:(id)a3 editRoute:(id)a4
{
  objc_storeStrong((id *)&self->_routeDataToEdit, a4);
  id v6 = a4;
  id v7 = [MapsSaveRouteContainee alloc];

  id v9 = [(MapsSaveRouteContainee *)v7 initWithDelegate:self isEditing:1 showInitialKeyboard:1];
  id v8 = [(ActionCoordinator *)self containerViewController];
  [v8 presentController:v9 animated:1];
}

- (void)viewController:(id)a3 downloadOfflineRegionForRouteData:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [v6 boundingMapRegion];
  uint64_t v8 = +[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:v7];

  id v9 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v6];
  id v10 = [v9 buildRoute];
  id v11 = [v6 userProvidedName];
  int v22 = (void *)v8;
  if ([v11 length]) {
    [v6 userProvidedName];
  }
  else {
  id v12 = [v6 routeName];
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100103E9C;
  v28[4] = sub_1001047D8;
  id v13 = [(ActionCoordinator *)self iosBasedChromeViewController];
  id v29 = [v13 acquireHikingMapToken];

  id v14 = [(ActionCoordinator *)self iosChromeViewController];
  id v15 = [v14 mapView];
  id v16 = [v15 _mapLayer];
  unsigned __int8 v17 = [v16 applicationSubState];

  SEL v18 = [(ActionCoordinator *)self iosChromeViewController];
  id v19 = [v18 mapView];
  id v20 = [v19 _mapLayer];
  [v20 setApplicationSubState:1];

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1006F9AAC;
  v24[3] = &unk_1012F5D60;
  void v24[4] = v28;
  objc_copyWeak(&v25, &location);
  unsigned __int8 v26 = v17;
  LOBYTE(v21) = 1;
  [(ActionCoordinator *)self viewController:v23 showOfflineMapRegionSelectorForRegion:v22 name:v12 route:v10 shouldUseSessionlessAnalytics:0 shouldShowDataManagementAfterDownload:0 shouldShowDataManagementAfterDownloadIfRegionDiffers:v21 dismissalBlock:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);
}

- (id)routeData
{
  return self->_routeDataToEdit;
}

- (void)popContainee
{
  id v2 = [(ActionCoordinator *)self containerViewController];
  [v2 popLastViewControllerAnimated:1];
}

- (void)didSaveCustomRoute:(id)a3
{
  routeDataToEdit = self->_routeDataToEdit;
  self->_routeDataToEdit = 0;

  [(ActionCoordinator *)self popContainee];
}

- (BOOL)is3dModeSelected
{
  return self->_is3dModeSelected;
}

- (DirectionItem)currentDirectionItem
{
  return self->_currentDirectionItem;
}

- (void)setCurrentDirectionItem:(id)a3
{
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (TransitLineSelectionActionController)lineSelectionAction
{
  return self->_lineSelectionAction;
}

- (void)setLineSelectionAction:(id)a3
{
}

- (int64_t)visibleViewModeBeforeDoingDirectionItem
{
  return self->_visibleViewModeBeforeDoingDirectionItem;
}

- (void)setVisibleViewModeBeforeDoingDirectionItem:(int64_t)a3
{
  self->_visibleViewModeBeforeDoingDirectionItem = a3;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (UIView)incidentsVCSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incidentsVCSourceView);

  return (UIView *)WeakRetained;
}

- (void)setIncidentsVCSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_incidentsVCSourceView);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_simpleListResultsVC, 0);
  objc_storeStrong((id *)&self->_lineSelectionAction, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_currentDirectionItem, 0);
  objc_storeStrong(&self->_collectionCreateVCDidDismissHandler, 0);
  objc_storeStrong((id *)&self->_routeDataToEdit, 0);
  objc_storeStrong(&self->_noteEditorCompletionBlock, 0);
  objc_storeStrong((id *)&self->_rapNotificationDetailsCoordinator, 0);
  objc_storeStrong((id *)&self->_reportsHomeViewController, 0);
  objc_storeStrong((id *)&self->_placeEnrichmentAPIController, 0);
  objc_storeStrong((id *)&self->_vehicleListVC, 0);
  objc_storeStrong((id *)&self->_profileTipVC, 0);
  objc_storeStrong((id *)&self->_ratingsHistoryVC, 0);
  objc_storeStrong((id *)&self->_travelPreferencesVC, 0);
  objc_storeStrong((id *)&self->_userProfileVC, 0);
  objc_storeStrong((id *)&self->_guideHomeVC, 0);
  objc_storeStrong((id *)&self->_collectionsListVC, 0);
  objc_storeStrong((id *)&self->_citySelectorVC, 0);
  objc_storeStrong((id *)&self->_allCollectionsVC, 0);
  objc_storeStrong((id *)&self->_publisherVC, 0);
  objc_storeStrong((id *)&self->_curatedCollectionsVC, 0);
  objc_storeStrong((id *)&self->_collectionEditCoordinator, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentCoordinator, 0);
  objc_storeStrong((id *)&self->_searchSessionManager, 0);
  objc_storeStrong((id *)&self->_shortcutEditSessionController, 0);
  objc_storeStrong(&self->_containerViewControllerDidResignContaineeObserver, 0);
  objc_storeStrong(&self->_containerViewControllerWillPresentContaineeObserver, 0);
  objc_storeStrong((id *)&self->_collectionPicker, 0);
  objc_storeStrong((id *)&self->_venuesManager, 0);
  objc_storeStrong((id *)&self->_venueCardCoordinator, 0);
  objc_storeStrong((id *)&self->_locationUpdateOperationForRouting, 0);
  objc_storeStrong((id *)&self->_trafficIncidentViewController, 0);
  objc_storeStrong((id *)&self->_autosharingVC, 0);
  objc_storeStrong((id *)&self->_routeAnnotationVC, 0);
  objc_storeStrong((id *)&self->_addStopResultsViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_incidentsVC, 0);
  objc_storeStrong((id *)&self->_routeStepsVC, 0);
  objc_storeStrong((id *)&self->_routeSearchVC, 0);
  objc_storeStrong((id *)&self->_routePlanningMapController, 0);
  objc_storeStrong((id *)&self->_routePlanningDataCoordinator, 0);
  objc_storeStrong((id *)&self->_lineCardForRoutePlanningViewController, 0);
  objc_storeStrong((id *)&self->_lineCardViewController, 0);
  objc_storeStrong((id *)&self->_parkedCarViewController, 0);
  objc_storeStrong((id *)&self->_mapSelectionManager, 0);
  objc_storeStrong((id *)&self->_searchModeViewController, 0);
  objc_storeStrong((id *)&self->_lprOnboardingController, 0);
  objc_storeStrong((id *)&self->_preferredNetworksOnboardingController, 0);
  objc_storeStrong((id *)&self->_vehicleOnboardingController, 0);
  objc_storeStrong((id *)&self->_routePlanningOverviewViewController, 0);
  objc_storeStrong((id *)&self->_placeCardForRoutePlanningViewController, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);

  objc_storeStrong((id *)&self->_routePlanningSelectionRestorationState, 0);
}

- (void)simpleResultsViewContoller:(id)a3 selectSearchResult:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(ActionCoordinator *)self venueCardCoordinator];
  id v8 = [v7 topViewController];

  if (v8 == v12)
  {
    [(ActionCoordinator *)self viewController:0 presentVenuesClusteredSearchResult:v6];
  }
  else
  {
    if (sub_1000BBB44(v12) == 5) {
      [(ActionCoordinator *)self viewControllerGoPreviousState:v12 withSender:0];
    }
    id v9 = [v6 mapItem];
    unsigned int v10 = [v9 _hasHikeInfo];

    if (v10)
    {
      [(ActionCoordinator *)self viewController:0 selectSearchResult:v6 addToHistory:1 source:6 saveSelectionState:0];
    }
    else
    {
      id v11 = [(ActionCoordinator *)self mapSelectionManager];
      [v11 selectSearchResult:v6 animated:1];
    }
  }
}

- (void)simpleResultsViewContoller:(id)a3 selectClusteredLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self mapSelectionManager];
  [v6 selectLabelMarker:v5 animated:1];
}

- (void)simpleResultsViewContoller:(id)a3 selectDirectionItem:(id)a4
{
  CFStringRef v9 = @"DirectionsSessionInitiatorKey";
  unsigned int v10 = &off_1013A8B48;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(ActionCoordinator *)self viewController:v7 doDirectionItem:v6 withUserInfo:v8];
}

- (void)simpleResultsViewContoller:(id)a3 didTapOnLookAroundWithSearchResult:(id)a4
{
  [a4 mapItem:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 _hasLookAroundStorefront])
  {
    id v5 = +[MKLookAroundEntryPoint entryPointWithMapItem:v6 wantsCloseUpView:1];
    -[ActionCoordinator enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:](self, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v5, 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
}

- (void)simpleResultsViewContoller:(id)a3 didTapOnCallWithSearchResult:(id)a4
{
  [a4 mapItem:a3];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v8 phoneNumber];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = +[UIApplication sharedApplication];
    id v7 = [v8 phoneNumber];
    [v6 callPhoneNumber:v7 completion:0];
  }
}

- (void)simpleResultsViewContoller:(id)a3 didTapOnWebsiteWithSearchResult:(id)a4
{
  id v4 = a4;
  id v7 = +[UIApplication sharedApplication];
  id v5 = [v4 mapItem];

  id v6 = [v5 url];
  [v7 openURL:v6 withCompletionHandler:0];
}

- (void)simpleResultsViewContoller:(id)a3 didTapOnFlyoverWithSearchResult:(id)a4
{
  id v6 = a3;
  id v7 = [a4 mapItem];
  [(ActionCoordinator *)self viewController:v6 enterFlyoverForMapItem:v7];
}

- (void)simpleResultsViewContoller:(id)a3 selectContainmentParentMapItem:(id)a4 resultsList:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [[SearchResult alloc] initWithMapItem:v8];

  CFStringRef v9 = [v7 arrayByAddingObject:v11];

  unsigned int v10 = [(ActionCoordinator *)self searchPinsManager];
  [v10 setSearchPins:v9 selectedPin:v11 animated:1];
}

- (void)simpleResultsViewContoller:(id)a3 selectTappableEntry:(id)a4 resultsList:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [[SearchResult alloc] initWithMapItem:v8];

  CFStringRef v9 = [v7 arrayByAddingObject:v11];

  unsigned int v10 = [(ActionCoordinator *)self searchPinsManager];
  [v10 setSearchPins:v9 selectedPin:v11 animated:1];
}

- (void)simpleResultsViewContoller:(id)a3 showCuratedCollection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007F056C;
  v6[3] = &unk_1012E5D58;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(ActionCoordinator *)v7 viewController:v5 showCuratedCollection:a4 replaceViewController:0 completion:v6];
}

- (void)simpleResultsViewContoller:(id)a3 showCuratedCollectionsList:(id)a4 title:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1007F0674;
  v8[3] = &unk_1012E5D58;
  CFStringRef v9 = self;
  id v10 = a3;
  id v7 = v10;
  [(ActionCoordinator *)v9 viewController:v7 showCuratedCollectionsList:a4 usingTitle:a5 usingCollectionIds:0 completion:v8];
}

- (void)simpleResultsViewContoller:(id)a3 showUserGeneratedCollection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007F0770;
  v6[3] = &unk_1012E5D58;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(ActionCoordinator *)v7 viewController:v5 showCollection:a4 completion:v6];
}

- (void)simpleResultsViewContoller:(id)a3 didStapOnAddStopWithSearchResult:(id)a4
{
  CFStringRef v9 = @"DirectionsSessionInitiatorKey";
  id v10 = &off_1013A8B48;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(ActionCoordinator *)self viewController:v7 addStopForSearchResult:v6 withUserInfo:v8];
}

- (void)lineCardViewController:(id)a3 doDirectionItem:(id)a4
{
  CFStringRef v9 = @"DirectionsSessionInitiatorKey";
  id v10 = &off_1013AB6E0;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(ActionCoordinator *)self viewController:v7 doDirectionItem:v6 withUserInfo:v8];
}

- (void)lineCardViewController:(id)a3 selectMapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D016F4;
  v14[3] = &unk_1012E66E0;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = objc_retainBlock(v14);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(ActionCoordinator *)self macContainerViewController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100D01768;
    _OWORD v12[3] = &unk_1012E6EA8;
    id v13 = v10;
    [v11 deferPresentingMapPopoversInsideBlock:v12];
  }
  else
  {
    ((void (*)(void *))v10[2])(v10);
  }
}

- (void)lineCardViewController:(id)a3 displayMapRegion:(id)a4
{
  id v5 = a4;
  id v6 = [(ActionCoordinator *)self mapCameraController];
  [v6 displayMapRegion:v5 animated:1 completion:0];
}

- (void)lineCardViewController:(id)a3 showIncidents:(id)a4
{
}

- (void)lineCardViewControllerDidAppear:(id)a3
{
  id v8 = a3;
  id v4 = [(ActionCoordinator *)self lineSelectionAction];
  id v5 = [v8 lineItem];
  unsigned __int8 v6 = [v4 isShowingLineForLineItem:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [v8 lineItem];
    [(ActionCoordinator *)self viewController:v8 selectTransitLineItem:v7 zoomToMapRegion:0];
  }
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  id v4 = a3;
  if ([v4 isTransitLine]
    && [(ActionCoordinator *)self isRoutePlanningPresented])
  {
    goto LABEL_4;
  }
  id v5 = [v4 waypointInfo];
  unsigned __int8 v6 = [v5 waypoint];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_4:
    char v8 = 0;
  }
  else
  {
    id v9 = [(ActionCoordinator *)self containerViewController];
    id v10 = [v9 currentViewController];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    char v8 = v11 ^ 1;
  }

  return v8 & 1;
}

- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3
{
  id v4 = a3;
  if ([v4 isCluster])
  {
    id v5 = [v4 clusterWaypointInfos];
    unsigned __int8 v6 = [v5 _maps_compactMap:&stru_1013222F8];

    id v7 = [v6 count];
    BOOL v8 = v7 != 0;
    if (v7)
    {
      id v9 = [(ActionCoordinator *)self simpleListResultsVC];
      id v10 = [v9 cluster];

      if (v10 != v4)
      {
        char v11 = [(ActionCoordinator *)self simpleListResultsVC];
        [v11 clearCluster];
      }
      id v12 = [(ActionCoordinator *)self simpleListResultsVC];
      [v12 setDisplayDistance:1];

      id v13 = [(ActionCoordinator *)self simpleListResultsVC];
      id v14 = [(ActionCoordinator *)self currentSearchSession];
      id v15 = [v14 searchInfo];
      [v13 setCluster:v4 sortAlphabetically:0 originalSearchInfo:v15 searchResults:v6];

      id v16 = [(ActionCoordinator *)self simpleListResultsVC];
      [(ActionCoordinator *)self presentSimpleList:v16];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  id v4 = [a3 annotation];
  [(ActionCoordinator *)self viewController:0 selectSearchResult:v4 addToHistory:0 source:1 saveSelectionState:0];

  return 1;
}

- (BOOL)chromeDidClearMapSelection
{
  id v3 = [(ActionCoordinator *)self containerViewController];
  id v4 = [v3 currentOrPendingViewController];

  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ([(ActionCoordinator *)self shouldDismissPlaceCardOnClearMapSelection])
    {
      [(ActionCoordinator *)self viewControllerClosed:v4 animated:1];
    }
  }
  else
  {
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    void v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    +[NSArray arrayWithObjects:v16 count:4];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(v4, "isMemberOfClass:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
          {
            [(ActionCoordinator *)self viewControllerClosed:v4 animated:1];
            goto LABEL_14;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return 1;
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parkedCar];
  if (v5)
  {

    id v6 = 0;
LABEL_3:
    id v7 = [v4 personalizedItem];
    [(ActionCoordinator *)self viewController:0 selectPersonalizedItem:v7 source:1 saveSelectionState:0];

    goto LABEL_4;
  }
  id v6 = [v4 searchResult];
  if (!v6) {
    goto LABEL_3;
  }
  id v9 = [(ActionCoordinator *)self venueCardCoordinator];
  id v10 = [v9 topViewController];
  long long v11 = [(ActionCoordinator *)self currentViewController];
  if (v10 == v11)
  {
    long long v12 = [(ActionCoordinator *)self currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(ActionCoordinator *)self viewController:0 presentVenuesClusteredSearchResult:v6];
      goto LABEL_4;
    }
  }
  else
  {
  }
  if ([v6 type] == 3) {
    goto LABEL_3;
  }
  long long v14 = [(ActionCoordinator *)self currentSearchSession];
  if ([v14 singleResultMode])
  {
    id v15 = [(ActionCoordinator *)self currentSearchSession];
    id v16 = [v15 searchFieldItem];
    unsigned __int8 v17 = [v16 searchResult];

    if (v17 == v6) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  SEL v18 = [v6 autocompletePerson];
  if (v18)
  {
    BOOL v19 = 0;
  }
  else
  {
    id v20 = [v6 findMyHandle];
    BOOL v19 = v20 == 0;
  }
  if ([v6 locationType] == 4)
  {
    uint64_t v21 = +[MKMapService sharedService];
    [v21 captureUserAction:404 onTarget:502 eventValue:0];
  }
  int v22 = [(ActionCoordinator *)self containerViewController];
  if (sub_1000BBB44(v22) == 5)
  {
    id v23 = [(ActionCoordinator *)self currentViewController];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();

    if (v24) {
      uint64_t v25 = 6;
    }
    else {
      uint64_t v25 = 1;
    }
  }
  else
  {

    uint64_t v25 = 1;
  }
  [(ActionCoordinator *)self viewController:0 selectSearchResult:v6 addToHistory:v19 source:v25 saveSelectionState:0];
LABEL_4:

  return 1;
}

- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)MKMapItemIdentifier);
  id v6 = [v4 featureID];
  [v4 coordinate];
  double v8 = v7;
  [v4 coordinate];
  id v9 = [v5 initWithMUID:v6 resultProviderID:0 coordinate:v8];
  id v10 = +[MKMapService sharedService];
  id v19 = v9;
  long long v11 = +[NSArray arrayWithObjects:&v19 count:1];
  long long v12 = [(ActionCoordinator *)self newTraits];
  long long v13 = [v10 ticketForIdentifiers:v11 traits:v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100D1DF78;
  v16[3] = &unk_1012E7B20;
  id v17 = v4;
  SEL v18 = self;
  id v14 = v4;
  [v13 submitWithHandler:v16 networkActivity:0];

  return 1;
}

- (BOOL)chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self currentSearchSession];
  id v6 = [v5 searchInfo];

  double v7 = [v6 autocompletePerson];
  double v8 = [v7 handle];
  id v9 = [v8 handle];
  id v10 = [v9 handleIdentifier];
  if (![v4 isEqualToString:v10])
  {

    goto LABEL_7;
  }
  long long v11 = [v6 results];
  id v12 = [v11 count];

  if (!v12)
  {
LABEL_7:
    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_100D1E3BC;
    v18[3] = &unk_101322320;
    id v19 = v4;
    objc_copyWeak(&v20, (id *)buf);
    +[MapsAutocompletePerson autoCompletePersonWithHandleIdentifier:v19 completionHandler:v18];
    objc_destroyWeak(&v20);

    objc_destroyWeak((id *)buf);
    goto LABEL_8;
  }
  long long v13 = [(ActionCoordinator *)self searchPinsManager];
  id v14 = [v6 results];
  id v15 = [v14 firstObject];
  [v13 setSearchPinsFromSearchInfo:v6 scrollToResults:1 displayPlaceCardForResult:v15 animated:1 completion:0];

  id v16 = sub_1005768D4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Using the same search session to select a waypoint: %@", buf, 0xCu);
  }

LABEL_8:
  return 1;
}

- (BOOL)chromeDidSelectWaypointMarkerForAddress:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 contact];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D1E694;
  v7[3] = &unk_101322348;
  objc_copyWeak(&v8, &location);
  +[MapsAutocompletePerson autoCompletePersonWithContact:v5 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)chromeDidSelectFlyoverTourLabelMarker:(id)a3
{
  id v4 = [a3 flyoverTourIdentifier];
  id v5 = +[MKMapService sharedService];
  long long v11 = v4;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];
  double v7 = [(ActionCoordinator *)self newTraits];
  id v8 = [v5 ticketForIdentifiers:v6 traits:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D1E924;
  v10[3] = &unk_1012E7610;
  void v10[4] = self;
  [v8 submitWithHandler:v10 networkActivity:0];

  return 1;
}

- (BOOL)chromeDidSelectTransitLineMarker:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self lineSelectionAction];

  if (!v5)
  {
    id v6 = [TransitLineSelectionActionController alloc];
    double v7 = [(ActionCoordinator *)self containerViewController];
    id v8 = [(TransitLineSelectionActionController *)v6 initWithContainerViewController:v7 actionCoordinator:self];
    [(ActionCoordinator *)self setLineSelectionAction:v8];
  }
  id v9 = [(ActionCoordinator *)self lineSelectionAction];
  unsigned __int8 v10 = [v9 isShowingLineForLabelMarker:v4];

  if ((v10 & 1) == 0)
  {
    long long v11 = [(ActionCoordinator *)self lineCardVC];
    id v12 = [v4 _maps_numLines];
    BOOL v13 = (unint64_t)v12 > 1;
    id v14 = [v4 _maps_loadedLineItems];

    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    BOOL v15 = (unint64_t)v12 < 2 && v14 == 0;
    char v16 = v15;
    if (v15)
    {
      id v17 = [[IncompleteTransitLineItem alloc] initWithLabelMarker:v4];
      [(ActionCoordinator *)self presentLineCardForItem:v17 labelMarker:v4 loading:1 overDisambiguation:(unint64_t)v12 > 1 preferredLayout:0];

      SEL v18 = [v11 lineItem];
      id v19 = [v18 muid];
      v32[3] = (uint64_t)v19;
    }
    id v20 = [(ActionCoordinator *)self lineSelectionAction];
    id v21 = [v4 _maps_lineShouldZoomMapRegionOnSelection];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100D1EC20;
    v25[3] = &unk_101322370;
    void v25[4] = self;
    BOOL v29 = v13;
    id v22 = v4;
    id v26 = v22;
    id v23 = v11;
    id v27 = v23;
    long long v28 = &v31;
    char v30 = v16;
    [v20 selectLineForLabelMarker:v22 zoomToMapRegion:v21 onActivation:v25];

    [v22 set_maps_lineShouldZoomMapRegionOnSelection:0];
    _Block_object_dispose(&v31, 8);
  }
  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  long long v11 = [(ActionCoordinator *)self trafficIncidentVC];
  [v11 setIncident:v10];

  id v12 = [(ActionCoordinator *)self trafficIncidentVC];
  uint64_t v13 = sub_1000BBB44(v12);

  if (v13 == 5)
  {
    id v14 = [(ActionCoordinator *)self trafficIncidentVC];
    [v14 setPreferredPresentationStyle:3];

    BOOL v15 = [(ActionCoordinator *)self trafficIncidentVC];
    [v15 setModalPresentationStyle:7];

    char v16 = [(ActionCoordinator *)self trafficIncidentVC];
    id v17 = [v16 macPopoverPresentationController];

    [v8 doubleValue];
    CLLocationDegrees v19 = v18;
    [v9 doubleValue];
    CLLocationCoordinate2D v21 = CLLocationCoordinate2DMake(v19, v20);
    [v17 setCoordinate:v21.latitude, v21.longitude];
  }
  id v22 = [(ActionCoordinator *)self containerViewController];
  id v23 = [v22 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v25 = [(ActionCoordinator *)self containerViewController];
  id v26 = [(ActionCoordinator *)self trafficIncidentVC];
  if (isKindOfClass) {
    [v25 replaceCurrentWithController:v26 moveToContaineeDefaultLayout:1];
  }
  else {
    [v25 presentController:v26 animated:1 useDefaultContaineeLayout:1];
  }

  id v27 = +[MKMapService sharedService];
  [v27 captureUserAction:1031 onTarget:511 eventValue:0];

  return 1;
}

- (BOOL)chromeDidSelectETAMarkerForRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(ActionCoordinator *)self routePlanningDataCoordinator];
  [v5 updateCurrentRoute:v4];

  [(ActionCoordinator *)self presentRoutePlanningViewType:0];
  id v6 = +[MKMapService sharedService];
  uint64_t v7 = [(ActionCoordinator *)self currentMapViewTargetForAnalytics];
  id v8 = [v4 _maps_routeIndex];

  [v6 captureUserAction:3015 onTarget:v7 eventValue:0 routeIndex:v8];
  return 1;
}

- (BOOL)chromeDidSelectRouteAnnotations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    id v6 = [(ActionCoordinator *)self routeAnnotationVC];
    [v6 setRouteAnnotation:v5];

    uint64_t v7 = [v5 styleAttributes];
    int v8 = FeatureStyleAttributesFind();

    if (v8)
    {
      id v9 = +[NSNumber numberWithInt:0];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = [(ActionCoordinator *)self routePlanningDataCoordinator];
    id v11 = [v10 transportType];

    if (v11 == (id)5 || v11 == (id)2)
    {
      if (v11 == (id)2) {
        uint64_t v12 = 312;
      }
      else {
        uint64_t v12 = 67;
      }
      uint64_t v13 = +[MKMapService sharedService];
      uint64_t v14 = [(ActionCoordinator *)self currentMapViewTargetForAnalytics];
      BOOL v15 = [v9 stringValue];
      [v13 captureUserAction:v12 onTarget:v14 eventValue:v15];
    }
    char v16 = [(ActionCoordinator *)self routeAnnotationVC];
    uint64_t v17 = sub_1000BBB44(v16);

    if (v17 == 5)
    {
      double v18 = [(ActionCoordinator *)self routeAnnotationVC];
      [v18 setPreferredPresentationStyle:3];

      CLLocationDegrees v19 = [(ActionCoordinator *)self routeAnnotationVC];
      [v19 setModalPresentationStyle:7];

      CLLocationDegrees v20 = [(ActionCoordinator *)self routeAnnotationVC];
      CLLocationCoordinate2D v21 = [v20 macPopoverPresentationController];

      [v5 position];
      CLLocationDegrees v23 = v22;
      [v5 position];
      CLLocationCoordinate2D v25 = CLLocationCoordinate2DMake(v23, v24);
      [v21 setCoordinate:v25.latitude, v25.longitude];
    }
    id v26 = [(ActionCoordinator *)self containerViewController];
    id v27 = [v26 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v29 = [(ActionCoordinator *)self containerViewController];
    char v30 = [(ActionCoordinator *)self routeAnnotationVC];
    if (isKindOfClass) {
      [v29 replaceCurrentWithController:v30 moveToContaineeDefaultLayout:1];
    }
    else {
      [v29 presentController:v30 animated:1 useDefaultContaineeLayout:1];
    }
  }
  return 1;
}

- (BOOL)chromeDidSelectOfflineAnnotationMarker:(id)a3
{
  id v4 = a3;
  double x = MKMapRectNull.origin.x;
  double y = MKMapRectNull.origin.y;
  double v36 = y;
  if (objc_msgSend(v4, "_maps_isOfflineAnnotation"))
  {
    uint64_t v7 = [v4 featureAnnotation];
    int v8 = [v7 subscription];
    id v9 = [v8 region];
    GEOMapRectForMapRegion();
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v14;
  }
  else
  {
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    if (!objc_msgSend(v4, "_maps_isOfflineClusterAnnotation")) {
      goto LABEL_14;
    }
    uint64_t v7 = [v4 clusterFeatureAnnotations];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v7);
          }
          CLLocationDegrees v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CLLocationCoordinate2D v21 = [v20 subscription];
            double v22 = [v21 region];
            GEOMapRectForMapRegion();
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            double v30 = v29;

            v42.origin.double x = x;
            v42.origin.double y = y;
            v42.size.double width = width;
            v42.size.double height = height;
            v44.origin.double x = v24;
            v44.origin.double y = v26;
            v44.size.double width = v28;
            v44.size.double height = v30;
            MKMapRect v43 = MKMapRectUnion(v42, v44);
            double x = v43.origin.x;
            double y = v43.origin.y;
            double width = v43.size.width;
            double height = v43.size.height;
          }
        }
        id v17 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v17);
    }
  }

LABEL_14:
  BOOL v31 = y != v36 || x != MKMapRectNull.origin.x;
  if (v31)
  {
    long long v32 = [(ActionCoordinator *)self mapSelectionManager];
    uint64_t v33 = [v32 mapView];
    [v33 setVisibleMapRect:CGRectMake(1, x, y, width, height) edgePadding:UIEdgeInsetsMake(35.0, 35.0, 35.0, 35.0) animated:35.0];

    uint64_t v34 = [(ActionCoordinator *)self mapSelectionManager];
    [v34 clearSelection];
  }
  return v31;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  return 1;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 isVLFPuckVisible])
  {
    id v5 = [(ActionCoordinator *)self platformController];
    id v6 = [v5 auxiliaryTasksManager];
    uint64_t v7 = [v6 auxilaryTaskForClass:objc_opt_class()];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D1F6C0;
    block[3] = &unk_1012E5D08;
    id v12 = v7;
    id v8 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

@end