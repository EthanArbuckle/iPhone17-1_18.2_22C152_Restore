@interface VKMapView
+ (BOOL)_elevatedGroundIsAvailable;
+ (BOOL)_elevatedGroundIsEnabled;
+ (BOOL)_globeIsAvailable;
+ (BOOL)_globeIsEnabled;
+ (void)updateUserLocationAnnotationStateForNavigationPuck:(id)a3 isPuckEnabled:(BOOL)a4 synchronizedState:(void *)a5;
- ($1AB5FA073B851C12C2339EC22442E995)centerCoordinate;
- ($6EFE6C6748B912A6EAC8A8E593ED1344)mapDisplayStyle;
- ($E5C720D6BB068A42F0C2CD001350366C)vehicleState;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPoint:(CGPoint)a3 toCoordinateFromLayer:(id)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPoint:(CGPoint)a3 toMapPointFromLayer:(id)a4;
- ($FF918C85BF8E73478720C66798E418D4)annotationTrackingBehavior;
- (BOOL)_advancedLightingAllowed;
- (BOOL)_advancedWaterAllowed;
- (BOOL)_buildingHeightsAllowed;
- (BOOL)_colorizedBuildingsAllowed;
- (BOOL)_createDisplayLayer;
- (BOOL)_daVinciDataAvailable;
- (BOOL)_hillshadeIsAvailable;
- (BOOL)_modernMapAllowed;
- (BOOL)_realTimeEVChargerIsEnabled;
- (BOOL)_roundedBuildingsAllowed;
- (BOOL)buildingFootprintsDisabled;
- (BOOL)canEnter3DMode;
- (BOOL)canEnter3DModeFlyoverForTileSize:(int64_t)a3;
- (BOOL)canRotate;
- (BOOL)canShowFlyover;
- (BOOL)canShowFlyoverAnimation;
- (BOOL)canZoomInForTileSize:(int64_t)a3;
- (BOOL)canZoomOutForTileSize:(int64_t)a3;
- (BOOL)cancelPendingMove;
- (BOOL)compressedBuildingsEnabled;
- (BOOL)debugLayoutContinuously;
- (BOOL)displayedFloorIsDefaultForVenueBuilding:(id)a3;
- (BOOL)enableAdvancedLighting;
- (BOOL)enableAdvancedWater;
- (BOOL)enableBuildingHeights;
- (BOOL)enableColorizedBuildings;
- (BOOL)enableDebugLabelHighlighting;
- (BOOL)enableGlobe;
- (BOOL)enableRoundedBuildings;
- (BOOL)gridDisabled;
- (BOOL)hasTraffic;
- (BOOL)iconsShouldAlignToPixels;
- (BOOL)isAnimatingToTrackAnnotation;
- (BOOL)isCameraInHikingBoundary;
- (BOOL)isCameraInHikingBufferRegion;
- (BOOL)isDimmingBaseMap;
- (BOOL)isEffectivelyHidden;
- (BOOL)isFlyoverUnificationEnabled;
- (BOOL)isFullyDrawn;
- (BOOL)isFullyPitched;
- (BOOL)isGesturing;
- (BOOL)isLabelMarkerSelectionEnabled;
- (BOOL)isLoadingMuninMetadata;
- (BOOL)isMKRenderingSelectionBalloon;
- (BOOL)isOfflineMode;
- (BOOL)isOfflineRegionSelector;
- (BOOL)isPitchable;
- (BOOL)isPitched;
- (BOOL)isPointValidForGesturing:(CGPoint)a3;
- (BOOL)isShowingCuratedElevatedGround;
- (BOOL)isShowingFlyover;
- (BOOL)labelsDisabled;
- (BOOL)loadMuninAvailability;
- (BOOL)localizeLabels;
- (BOOL)moveToMarker:(id)a3 withHeading:(double)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)moveToStorefrontView:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)polygonsDisabled;
- (BOOL)rastersDisabled;
- (BOOL)renderInverseFills;
- (BOOL)renderOverlayPolygons;
- (BOOL)rendersInBackground;
- (BOOL)roadsDisabled;
- (BOOL)shouldHideOffscreenSelectedAnnotation;
- (BOOL)shouldLoadFallbackTiles;
- (BOOL)shouldLoadMapMargin;
- (BOOL)showsBuildings;
- (BOOL)showsContourLabels;
- (BOOL)showsHiking;
- (BOOL)showsHillshade;
- (BOOL)showsLabels;
- (BOOL)showsLiveEVData;
- (BOOL)showsPhysicalFeatureLabels;
- (BOOL)showsPointLabels;
- (BOOL)showsPointsOfInterest;
- (BOOL)showsRoadLabels;
- (BOOL)showsRoadShields;
- (BOOL)showsTopographicFeatures;
- (BOOL)showsVenues;
- (BOOL)staysCenteredDuringPinch;
- (BOOL)staysCenteredDuringRotation;
- (BOOL)stylesheetIsDevResource;
- (BOOL)supportsGPUFrameCaptureToDestination;
- (BOOL)supportsMapType:(int)a3;
- (BOOL)supportsNightMode;
- (BOOL)tapAtPoint:(CGPoint)a3;
- (BOOL)trackingCameraShouldHandleGestures;
- (BOOL)trafficEnabled;
- (BOOL)trafficIncidentsEnabled;
- (BOOL)transitLinesDisabled;
- (BOOL)virtualParallaxEnabled;
- (BOOL)wantsTimerTick;
- (CADisplay)hostDisplay;
- (CGPoint)convertCoordinate:(id)a3 toCameraModelPointToLayer:(id)a4;
- (CGPoint)convertCoordinate:(id)a3 toPointToLayer:(id)a4;
- (CGPoint)convertMapPoint:(id)a3 toPointToLayer:(id)a4;
- (GEOMapRegion)mapRegion;
- (GEOMapRegion)mapRegionIgnoringEdgeInsets;
- (GEOPOICategoryFilter)pointsOfInterestFilter;
- (NSArray)labelMarkers;
- (NSArray)visibleTileSets;
- (VKEdgeInsets)edgeInsets;
- (VKEdgeInsets)fullyOccludedEdgeInsets;
- (VKEdgeInsets)labelEdgeInsets;
- (VKEdgeInsets)labelEdgeWidths;
- (VKLabelMarker)selectedLabelMarker;
- (VKLabelSelectionFilter)labelSelectionFilter;
- (VKMapCanvas)mapCanvas;
- (VKMapView)initWithDescriptor:(id)a3;
- (VKMapView)initWithLayer:(id)a3;
- (VKMapViewCameraDelegate)cameraDelegate;
- (VKMapViewDelegate)mapDelegate;
- (VKMetrics)metrics;
- (VKPolylineOverlay)focusedLabelsPolyline;
- (VKPuckAnimator)userLocationAnimator;
- (VKSceneConfiguration)sceneConfiguration;
- (__CFString)initWithDescriptor:;
- (const)mapEngine;
- (double)altitude;
- (double)currentZoomLevelForTileSize:(int64_t)a3;
- (double)distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 fromLayer:(id)a5 withPrecision:(int64_t)a6;
- (double)durationToAnimateToMapRegion:(id)a3;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevelForTileSize:(int64_t)a3;
- (double)minPitch;
- (double)minimumZoomLevelForTileSize:(int64_t)a3;
- (double)pitch;
- (double)presentationYaw;
- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3;
- (double)trackingZoomScale;
- (double)yaw;
- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3;
- (float)currentZoomLevel;
- (float)styleZOffsetScale;
- (float)worldSpaceWidthOfView;
- (float)zoomToRevealVenueBuildingFloorplan:(id)a3;
- (float)zoomToRevealVenueFloorplan:(id)a3;
- (id).cxx_construct;
- (id)_mapDelegateQueue;
- (id)activeLogics;
- (id)annotationCoordinateTest;
- (id)annotationRectTest;
- (id)arWalkingDebugOutput;
- (id)attributionsForCurrentRegion;
- (id)buildingMarkerAtPoint:(CGPoint)a3;
- (id)clearVenueBuildingFloorSelections;
- (id)consoleString:(BOOL)a3;
- (id)currentCanvas;
- (id)currentMarker;
- (id)debugLabelString:(BOOL)a3;
- (id)detailedDescription;
- (id)detailedDescriptionDictionaryRepresentation;
- (id)iconForStyleAttributes:(id)a3 contentScale:(double)a4 size:(int64_t)a5 transparent:(BOOL)a6;
- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7;
- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8;
- (id)initWithDescriptor:;
- (id)labelMarkerForCustomFeatureAnnotation:(id)a3;
- (id)labelMarkerForCustomFeatureAnnotation:(id)a3 dataSource:(id)a4;
- (id)labelMarkerForSelectionAtPoint:(CGPoint)a3 selectableLabelsOnly:(BOOL)a4;
- (id)markerAtPoint:(CGPoint)a3;
- (id)muninMarkerAtCoordinate:(id)a3;
- (id)muninMarkerAtCoordinate:(id)a3 completeMarkerHandler:(id)a4;
- (id)navigationPuck;
- (id)onscreenImageResources;
- (id)pptTileStatisticsForMapType:(int)a3 latitude:(double)a4 longitude:(double)a5 zoom:(float)a6 width:(double)a7 height:(double)a8 rect:(id)a9;
- (id)rapMarkerAtPoint:(CGPoint)a3;
- (id)resolveMapCameraController;
- (id)roadLabelTilesInScene;
- (id)routeContext;
- (id)secondaryCanvas;
- (id)selectedTransitLineIDs;
- (id)setARWalkingFeatureSet:(id)a3;
- (id)testStatistics;
- (id)tileStatistics;
- (id)transitLineMarkersForSelectionAtPoint:(CGPoint)a3;
- (id)transitLineMarkersInCurrentViewport;
- (id)venueAtLocation:(id)a3;
- (id)venueAtLocation:(id)a3 withMarginForError:(BOOL)a4;
- (id)venueAtLocation:(id)a3 withMarginForError:(BOOL)a4 includeNonRevealedVenues:(BOOL)a5;
- (id)venueBuildingWithFocus;
- (id)venueWithFocus;
- (id)venueWithID:(unint64_t)a3;
- (int)arMode;
- (int)arSceneType;
- (int)flyoverMode;
- (int)mapType;
- (int64_t)applicationUILayout;
- (int64_t)carDisplayConfig;
- (int64_t)carDisplayType;
- (int64_t)currentMapMode;
- (int64_t)displayRate;
- (int64_t)getCurrentSetARInterfaceOrientation;
- (int64_t)labelScaleFactor;
- (int64_t)navigationDisplayRate;
- (int64_t)navigationShieldSize;
- (int64_t)shieldIdiom;
- (int64_t)shieldSize;
- (int64_t)targetDisplay;
- (int64_t)terrainMode;
- (optional<double>)puckAnimator:(id)a3 getElevationWithCoordinate:(const void *)a4;
- (signed)defaultFloorOrdinalForVenueBuilding:(id)a3;
- (signed)displayedFloorOrdinalForVenueBuilding:(id)a3;
- (uint64_t)activeLogics;
- (uint64_t)initWithDescriptor:;
- (unint64_t)getSceneState;
- (unint64_t)navCameraMode;
- (unordered_map<unsigned)clientStyleAttributes;
- (unsigned)applicationState;
- (unsigned)applicationSubState;
- (unsigned)displayedSearchResultsType;
- (unsigned)emphasis;
- (unsigned)mapKitClientMode;
- (unsigned)mapKitUsage;
- (unsigned)mapsUsage;
- (void)_applyMapDisplayStyle:(id)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)_closeLoaderConnection:(BOOL)a3;
- (void)_configureDefaultSettings;
- (void)_createGlobe;
- (void)_forceLayoutForSuspensionSnapShot;
- (void)_labelSettings;
- (void)_notifyDelegateFlyoverTourLabelChanged:(id)a3;
- (void)_postDelegateCallbackBlock:(id)a3;
- (void)_reconfigurePermissions;
- (void)_runFlyoverTourStateChange:(int)a3 completion:(id)a4;
- (void)_setARSession:(id)a3;
- (void)_setFloorSwitcherZoomPadding:(float)a3;
- (void)_setThermalPressureLevel:(unint64_t)a3;
- (void)_setupThermalMonitor;
- (void)_shutdownThermalMonitor;
- (void)_updateBackgroundColor;
- (void)_updateBuildingCompressionSetting;
- (void)_updateCameraThermalOptions;
- (void)_updateMapDisplayStyle;
- (void)_updateOnlyShowRoadClosures;
- (void)_updateThermalPressureLevel;
- (void)activateInternalSettings;
- (void)activeARWalkingFeatureDidUpdate:(id)a3;
- (void)activeLogics;
- (void)addCustomFeatureDataSource:(id)a3;
- (void)addExternalAnchor:(id)a3;
- (void)addOverlay:(id)a3;
- (void)addPersistentRouteOverlay:(id)a3;
- (void)addRouteOverlay:(id)a3;
- (void)arController:(id)a3 arSessionWasInterrupted:(unint64_t)a4;
- (void)arController:(id)a3 didChangeTrackingState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)arController:(id)a3 didEncounterError:(id)a4;
- (void)arControllerSessionInterruptionEnded:(id)a3;
- (void)arWalkingElevationRequestFailure:(id)a3;
- (void)arWalkingFeatureSetStateDidUpdate:(id)a3;
- (void)clearPreviouslySelectedLabelMarker;
- (void)clearScene;
- (void)closeLoaderConnection;
- (void)dealloc;
- (void)debugHighlightFeatureMarker:(const void *)a3;
- (void)debugHighlightLabelAtPoint:(CGPoint)a3;
- (void)deselectFeatureId;
- (void)deselectLabelMarker;
- (void)deselectTrails;
- (void)deselectTransitLineMarker;
- (void)deselectVenuePoiFeatureId;
- (void)didEnterBackground;
- (void)didFinishLoadingData;
- (void)didFinishLoadingDataWithError:(id)a3;
- (void)didFinishSnapshotting;
- (void)didPresent;
- (void)didReceiveFlushTileCaches;
- (void)didReceiveLocalChanged;
- (void)didReceiveMemoryWarning;
- (void)didStartLoadingData;
- (void)didUpdateSceneStatus:(unsigned __int8)a3;
- (void)didUpdateVerticalYawTo:(double)a3;
- (void)disableMapDisplayStyleDebugOverride;
- (void)disableTestStatistics;
- (void)disableTileStatistics;
- (void)enableMapDisplayStyleDebugOverride:(id)a3;
- (void)enableTestStatistics;
- (void)enableTileStatistics;
- (void)enableViewDataLoading:(BOOL)a3;
- (void)enter3DMode;
- (void)enterARModeAtCoordinate:(id)a3;
- (void)enterARWalking:(id)a3;
- (void)enterMuninForMarker:(id)a3 withHeading:(double)a4;
- (void)enterMuninForStorefrontView:(id)a3 secondaryStorefrontView:(id)a4;
- (void)exit3DMode;
- (void)exitARMode;
- (void)exitARWalking;
- (void)flushTileLoads;
- (void)forceCameraUpdateForFrameResize;
- (void)forceLayout;
- (void)forceResolveCameraController;
- (void)goToTileX:(int)a3 Y:(int)a4 Z:(int)a5 tileSize:(int)a6;
- (void)initWithDescriptor:;
- (void)injectDebugARFeatures:(id)a3;
- (void)injectDebugARUserRouteCoordinate:(PolylineCoordinate)a3;
- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4;
- (void)insertOverlay:(id)a3 belowOverlay:(id)a4;
- (void)labelManagerDidLayout;
- (void)labelMarkerDidChangeState:(const void *)a3;
- (void)location:(id)a3 isInHikingContextualRegion:(BOOL)a4;
- (void)locationInHikingToolTipRegion:(unint64_t)a3;
- (void)map:(id)a3 canShowFlyoverDidChange:(BOOL)a4;
- (void)map:(id)a3 didEnterARMode:(BOOL)a4;
- (void)mapController:(id)a3 requestsDisplayRate:(int64_t)a4;
- (void)mapDidFinishChangingMapDisplayStyle:(id)a3;
- (void)mapDidReloadStylesheet:(id)a3;
- (void)moveToFlyoverTourStartPosition:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)muninJunctionDidChange:(const void *)a3 currentRoad:(const void *)a4 localize:(BOOL)a5;
- (void)navigationCameraReturnToPuck;
- (void)nearestVenueDidChange:(const void *)a3 building:(const void *)a4;
- (void)openLoaderConnection;
- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7;
- (void)pauseFlyoverTourAnimation;
- (void)pauseTracking;
- (void)performStylesheetDidChange;
- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4;
- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4;
- (void)projectCoordinate:(id)a3 toPoint:(CGPoint *)a4;
- (void)puckAnimator:(id)a3 runAnimation:(id)a4;
- (void)puckAnimator:(id)a3 updatedPosition:(const void *)a4 course:(const void *)a5 polylineCoordinate:(PolylineCoordinate)a6;
- (void)puckAnimatorDidStop:(id)a3;
- (void)puckLocationTracingEvent:(id)a3;
- (void)reconfigureFlyoverIfNeeded;
- (void)reloadStylesheet;
- (void)removeCustomFeatureDataSource:(id)a3;
- (void)removeExternalAnchor:(id)a3;
- (void)removeOverlay:(id)a3;
- (void)removePersistentRouteOverlay:(id)a3;
- (void)removeRouteOverlay:(id)a3;
- (void)renderInContext:(CGContext *)a3;
- (void)requestHikingContextualRegionDoesIntersectForLocation:(id)a3;
- (void)requestHikingToolTipRegionIDForLocation:(id)a3;
- (void)resetTestStatistics;
- (void)resetTileStatistics;
- (void)resumeFlyoverTourAnimation;
- (void)runAnimation:(id)a3;
- (void)selectLabelMarker:(id)a3;
- (void)selectLabelMarker:(id)a3 completion:(id)a4;
- (void)selectTransitLineMarker:(id)a3;
- (void)selectedLabelMarkerDidCompleteLayout:(const void *)a3;
- (void)selectedLabelMarkerWillDisappear:(const void *)a3;
- (void)setARInterfaceOrientation:(int64_t)a3;
- (void)setARMode:(int)a3;
- (void)setARSceneType:(int)a3;
- (void)setARWalkingFeatures:(id)a3;
- (void)setAnnotationTrackingBehavior:(id *)a3;
- (void)setApplicationState:(unsigned __int8)a3;
- (void)setApplicationState:(unsigned __int8)a3 displayedSearchResultsType:(unsigned __int8)a4;
- (void)setApplicationSubState:(unsigned __int8)a3;
- (void)setApplicationUILayout:(int64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCameraDelegate:(id)a3;
- (void)setCameraFramingInsets:(VKEdgeInsets)a3;
- (void)setCameraHorizontalOffset:(double)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setCanonicalSkyHeight:(double)a3;
- (void)setCarDisplayConfig:(int64_t)a3 animated:(BOOL)a4;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 timingCurve:(id)a8 completion:(id)a9;
- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setClientLocalizedStrings:(id)a3;
- (void)setCompressedBuildingsEnabled:(BOOL)a3;
- (void)setContentsScale:(double)a3;
- (void)setCurrentLocationText:(id)a3;
- (void)setDebugLayoutContinuously:(BOOL)a3;
- (void)setDesiredMapMode:(int64_t)a3;
- (void)setDimmingBaseMap:(BOOL)a3;
- (void)setDimmingBaseMap:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setDisableBuildingFootprints:(BOOL)a3;
- (void)setDisableGrid:(BOOL)a3;
- (void)setDisableLabels:(BOOL)a3;
- (void)setDisablePolygons:(BOOL)a3;
- (void)setDisableRasters:(BOOL)a3;
- (void)setDisableRoads:(BOOL)a3;
- (void)setDisableShadows:(BOOL)a3;
- (void)setDisableTransitLines:(BOOL)a3;
- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forVenueBuilding:(id)a4;
- (void)setDisplayedSearchResultsType:(unsigned __int8)a3;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setEdgeInsets:(VKEdgeInsets)a3 duration:(double)a4 timingFunction:(id)a5 completionHandler:(id)a6;
- (void)setEmphasis:(unsigned __int8)a3 animated:(BOOL)a4;
- (void)setEnableAdvancedLighting:(BOOL)a3;
- (void)setEnableAdvancedWater:(BOOL)a3;
- (void)setEnableBuildingHeights:(BOOL)a3;
- (void)setEnableColorizedBuildings:(BOOL)a3;
- (void)setEnableGlobe:(BOOL)a3;
- (void)setEnableRoundedBuildings:(BOOL)a3;
- (void)setExternalTrafficFeatures:(id)a3 areRouteTrafficFeaturesActive:(BOOL)a4;
- (void)setFlyoverMode:(int)a3;
- (void)setFocusedLabelsPolyline:(id)a3;
- (void)setFullyOccludedEdgeInsets:(VKEdgeInsets)a3;
- (void)setGesturing:(BOOL)a3;
- (void)setHasVehicleHeading:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHiddenTrafficIncidentFeatures:(id)a3;
- (void)setHostDisplay:(id)a3;
- (void)setIconsShouldAlignToPixels:(BOOL)a3;
- (void)setIsMKRenderingSelectionBalloon:(BOOL)a3;
- (void)setIsPitchable:(BOOL)a3;
- (void)setLabelEdgeInsets:(VKEdgeInsets)a3;
- (void)setLabelEdgeWidths:(VKEdgeInsets)a3;
- (void)setLabelExclusionRegions:(id)a3;
- (void)setLabelMarkerSelectionEnabled:(BOOL)a3;
- (void)setLabelScaleFactor:(int64_t)a3;
- (void)setLabelSelectionFilter:(id)a3;
- (void)setLoadMuninAvailability:(BOOL)a3;
- (void)setLoadMuninMetadata:(BOOL)a3;
- (void)setLocalizeLabels:(BOOL)a3;
- (void)setMapDelegate:(id)a3;
- (void)setMapDisplayStyle:(id)a3;
- (void)setMapDisplayStyle:(id)a3 animated:(BOOL)a4;
- (void)setMapDisplayStyle:(id)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setMapKitClientMode:(unsigned __int8)a3;
- (void)setMapKitUsage:(unsigned __int8)a3;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 completion:(id)a7;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8;
- (void)setMapType:(int)a3;
- (void)setMapType:(int)a3 animated:(BOOL)a4;
- (void)setModernMapEnabled:(BOOL)a3;
- (void)setNavCameraMode:(unint64_t)a3;
- (void)setNavContext:(id)a3;
- (void)setNavigationShieldSize:(int64_t)a3;
- (void)setNeedsLayout;
- (void)setOfflineMode:(BOOL)a3;
- (void)setOfflineRegionSelector:(BOOL)a3;
- (void)setPointsOfInterestFilter:(id)a3;
- (void)setPreferredUnits:(unint64_t)a3;
- (void)setPreviouslySelectedLabelMarker:(id)a3;
- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setRenderInverseFills:(BOOL)a3;
- (void)setRenderOverlayPolygons:(BOOL)a3;
- (void)setRendersInBackground:(BOOL)a3;
- (void)setRouteContext:(id)a3;
- (void)setRouteLineSplitAnnotation:(id)a3;
- (void)setRouteUserOffset:(PolylineCoordinate)a3;
- (void)setScreenLabelFeatures:(id)a3;
- (void)setSelectedBuildingFeatureIds:(id)a3;
- (void)setSelectedFeatureId:(unint64_t)a3;
- (void)setSelectedTrailId:(unint64_t)a3;
- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5;
- (void)setSelectedVenuePoiFeatureId:(unint64_t)a3;
- (void)setShieldIdiom:(int64_t)a3;
- (void)setShieldSize:(int64_t)a3;
- (void)setShouldLoadFallbackTiles:(BOOL)a3;
- (void)setShouldLoadMapMargin:(BOOL)a3;
- (void)setShowsBuildings:(BOOL)a3;
- (void)setShowsContourLabels:(BOOL)a3;
- (void)setShowsHiking:(BOOL)a3;
- (void)setShowsHiking:(BOOL)a3 withTopographicFeatures:(BOOL)a4;
- (void)setShowsHillshade:(BOOL)a3;
- (void)setShowsLabels:(BOOL)a3;
- (void)setShowsLiveEVData:(BOOL)a3;
- (void)setShowsPhysicalFeatureLabels:(BOOL)a3;
- (void)setShowsPointLabels:(BOOL)a3;
- (void)setShowsPointsOfInterest:(BOOL)a3;
- (void)setShowsRoadLabels:(BOOL)a3;
- (void)setShowsRoadShields:(BOOL)a3;
- (void)setShowsVenues:(BOOL)a3;
- (void)setSkippedRouteLineSplitAnnotation:(id)a3;
- (void)setStaysCenteredDuringPinch:(BOOL)a3;
- (void)setStaysCenteredDuringRotation:(BOOL)a3;
- (void)setStyleZOffsetScale:(float)a3;
- (void)setSupportedEVConnectorTypes:(id)a3;
- (void)setTargetDisplay:(int64_t)a3;
- (void)setTerrainMode:(int64_t)a3;
- (void)setTrackingZoomScale:(double)a3;
- (void)setTrafficEnabled:(BOOL)a3;
- (void)setTrafficIncidentsEnabled:(BOOL)a3;
- (void)setUseSmallCache:(BOOL)a3;
- (void)setVehicleState:(id)a3;
- (void)setVirtualParallaxEnabled:(BOOL)a3;
- (void)setYaw:(double)a3 animated:(BOOL)a4;
- (void)snapMapAfterModeChange;
- (void)startFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4 completion:(id)a5;
- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 completion:(id)a5;
- (void)startPanningAtPoint:(CGPoint)a3;
- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)startPitchingWithFocusPoint:(CGPoint)a3;
- (void)startRotatingWithFocusPoint:(CGPoint)a3;
- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7;
- (void)stopFlyoverAnimation;
- (void)stopPanningAtPoint:(CGPoint)a3;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)stopPitchingWithFocusPoint:(CGPoint)a3;
- (void)stopRotatingWithFocusPoint:(CGPoint)a3;
- (void)stopSnappingAnimations;
- (void)stopTracking;
- (void)stopTrackingAnnotation;
- (void)tileGroupDidChange;
- (void)tileGroupWillChange;
- (void)tileStatistics;
- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 pounceCompletionHandler:(id)a7;
- (void)updateLightingLogic;
- (void)updatePanWithTranslation:(CGPoint)a3;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4;
- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4;
- (void)willEnterForeground;
- (void)willLayoutWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)willStopPanningAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)zoomToLevel:(double)a3 withFocusPoint:(CGPoint)a4;
@end

@implementation VKMapView

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  v4 = [(VKMapView *)self currentCanvas];
  v5 = [v4 cameraController];
  [v5 zoomLevelAdjustmentForTileSize:a3];
  double v7 = v6;

  return v7;
}

- (BOOL)canRotate
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];
  char v4 = [v3 canRotate];

  return v4;
}

- (GEOMapRegion)mapRegionIgnoringEdgeInsets
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];
  char v4 = [v3 mapRegionIgnoringEdgeInsets];

  return (GEOMapRegion *)v4;
}

- (double)maximumZoomLevelForTileSize:(int64_t)a3
{
  char v4 = [(VKMapView *)self currentCanvas];
  v5 = [v4 cameraController];
  [v5 maximumZoomLevelForTileSize:a3];
  double v7 = v6;

  return v7;
}

- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3
{
  char v4 = [(VKMapView *)self currentCanvas];
  v5 = [v4 cameraController];
  [v5 topDownMinimumZoomLevelForTileSize:a3];
  double v7 = v6;

  return v7;
}

- (BOOL)canEnter3DMode
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 canEnter3DMode];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (double)currentZoomLevelForTileSize:(int64_t)a3
{
  char v4 = [(VKMapView *)self currentCanvas];
  v5 = [v4 cameraController];
  [v5 currentZoomLevelForTileSize:a3];
  double v7 = v6;

  return v7;
}

- (double)altitude
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];
  [v3 altitude];
  double v5 = v4;

  return v5;
}

- (double)pitch
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];
  [v3 pitch];
  double v5 = v4;

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)centerCoordinate
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];
  [v3 centerCoordinate];
  double v5 = v4;
  double v7 = v6;

  double v8 = 0.0;
  double v9 = v5;
  double v10 = v7;
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (double)presentationYaw
{
  v2 = [(VKMapView *)self currentCanvas];
  v3 = [v2 cameraController];
  [v3 heading];
  double v5 = v4;

  return v5;
}

- (BOOL)wantsTimerTick
{
  v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 wantsTimerTick];

  return v3;
}

- (id)currentCanvas
{
  if (!*(unsigned char *)(*((void *)self + 48) + 1241)
    && ([(VKMapView *)self mapType] == 4
     || [(VKMapView *)self mapType] == 3
     || [(VKMapView *)self mapType] == 10))
  {
    char v3 = &OBJC_IVAR___VKMapView__globe;
  }
  else
  {
    char v3 = &OBJC_IVAR___VKMapView__canvas;
  }
  double v4 = *(void **)((char *)self + *v3);
  return v4;
}

- (void)activateInternalSettings
{
  if (os_variant_has_internal_ui())
  {
    char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v7 = [v3 persistentDomainForName:@"com.apple.Maps"];

    double v4 = [v7 objectForKey:@"ActivateMapInspectorOnLaunch"];
    double v5 = v4;
    if (v4 && [v4 isEqual:&unk_1EF5BB070])
    {
      double v6 = +[MIController sharedController];
      [v6 activateController:self];
    }
  }
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
}

- (void)didPresent
{
  id v4 = [(VKMapView *)self currentCanvas];
  [v4 didPresent];

  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)self + 15);
    [v6 mapLayerDidDraw:self];
  }
}

- (BOOL)rendersInBackground
{
  return *(unsigned char *)(*((void *)self + 48) + 1178);
}

- (BOOL)isPitchable
{
  v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 cameraController];
  char v4 = [v3 isPitchEnabled];

  return v4;
}

- (id)resolveMapCameraController
{
  if ([(VKMapView *)self enableGlobe]
    && (+[VKDebugSettings sharedSettings],
        char v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 daVinciCameraController],
        v3,
        (v4 & 1) != 0))
  {
    double v5 = &OBJC_IVAR___VKMapView__davinciMapCameraController;
  }
  else
  {
    double v5 = &OBJC_IVAR___VKMapView__mapCameraController;
  }
  id v6 = *(void **)((char *)self + *v5);
  return v6;
}

- (BOOL)enableGlobe
{
  uint64_t v2 = *((void *)self + 48);
  if (!v2) {
    return 0;
  }
  char v3 = *(uint64_t **)(v2 + 1128);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4 != v5)
  {
    while (*(unsigned char *)v4 != 22)
    {
      v4 += 16;
      if (v4 == v5) {
        return 0;
      }
    }
  }
  return v4 != v5 && *(void *)(v4 + 8) != 0;
}

- (BOOL)isGesturing
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 cameraController];
  char v4 = [v3 isGesturing];

  return v4;
}

- (void)_setupThermalMonitor
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __42__VKMapView_Thermal___setupThermalMonitor__block_invoke;
  double v10 = &unk_1E5A8C320;
  objc_copyWeak(&v11, &location);
  char v3 = (void *)MEMORY[0x1A6239EB0](&v7);
  char v4 = [(VKMapView *)self _mapDelegateQueue];
  BOOL v5 = notify_register_dispatch((const char *)*MEMORY[0x1E4F14918], (int *)self + 129, v4, v3) == 0;

  if (v5)
  {
    [(VKMapView *)self _updateThermalPressureLevel];
  }
  else
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v6 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v14 = self;
      _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_ERROR, "[VKMapView:%p] Failed to register for thermal pressure notifications", buf, 0xCu);
    }
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateThermalPressureLevel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  if (notify_get_state(*((_DWORD *)self + 129), &state64))
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    char v3 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v6 = self;
      _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_ERROR, "[VKMapView:%p] Failed to get thermal pressure level", buf, 0xCu);
    }
  }
  else if (state64 != *((void *)self + 65))
  {
    -[VKMapView _setThermalPressureLevel:](self, "_setThermalPressureLevel:");
    [(VKMapView *)self _updateCameraThermalOptions];
  }
}

- (void)didStartLoadingData
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__VKMapView_didStartLoadingData__block_invoke;
  v2[3] = &unk_1E5A960A0;
  v2[4] = self;
  [(VKMapView *)self _postDelegateCallbackBlock:v2];
}

- (void)didFinishLoadingData
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__VKMapView_didFinishLoadingData__block_invoke;
  v2[3] = &unk_1E5A960A0;
  v2[4] = self;
  [(VKMapView *)self _postDelegateCallbackBlock:v2];
}

- (void)labelManagerDidLayout
{
  if (!*((unsigned char *)self + 582))
  {
    *((unsigned char *)self + 582) = 1;
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    char v3 = (id)GEOGetVectorKitVKDefaultLog_log;
    char v4 = v3;
    os_signpost_id_t v5 = *(void *)(*((void *)self + 48) + 1216);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_INTERVAL_END, v5, "LabelsCompletedFirstLayout", "", buf, 2u);
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__VKMapView_labelManagerDidLayout__block_invoke;
  v6[3] = &unk_1E5A960A0;
  v6[4] = self;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

- (void)didUpdateSceneStatus:(unsigned __int8)a3
{
  char v4 = 0;
  uint64_t v5 = a3;
  switch(a3)
  {
    case 0u:
      goto LABEL_7;
    case 1u:
      uint64_t v5 = 1;
      goto LABEL_7;
    case 2u:
      goto LABEL_6;
    case 3u:
      char v4 = 1;
      uint64_t v5 = 3;
      goto LABEL_6;
    case 4u:
      char v4 = 1;
      uint64_t v5 = 4;
      goto LABEL_6;
    default:
      char v4 = 0;
      uint64_t v5 = 0;
LABEL_6:
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __34__VKMapView_didUpdateSceneStatus___block_invoke;
      v7[3] = &unk_1E5A8C1E0;
      v7[4] = self;
      char v8 = v4;
      [(VKMapView *)self _postDelegateCallbackBlock:v7];
LABEL_7:
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __34__VKMapView_didUpdateSceneStatus___block_invoke_2;
      v6[3] = &unk_1E5A8C190;
      v6[4] = self;
      void v6[5] = v5;
      [(VKMapView *)self _postDelegateCallbackBlock:v6];
      return;
  }
}

- (void)_postDelegateCallbackBlock:(id)a3
{
  dispatch_block_t block = a3;
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);

  if (WeakRetained)
  {
    uint64_t v5 = [(VKMapView *)self _mapDelegateQueue];
    dispatch_async(v5, block);
  }
}

- (id)_mapDelegateQueue
{
  uint64_t v2 = *((void *)self + 48);
  char v3 = *(id **)(v2 + 8);
  char v4 = *(std::__shared_weak_count **)(v2 + 16);
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    id v5 = *v3;
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  else
  {
    id v5 = *v3;
  }
  return v5;
}

- (VKEdgeInsets)labelEdgeWidths
{
  uint64_t v2 = (float *)*((void *)self + 48);
  float v3 = v2[236];
  float v4 = v2[237];
  float v5 = v2[238];
  float v6 = v2[239];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (VKEdgeInsets)labelEdgeInsets
{
  uint64_t v2 = (float *)*((void *)self + 48);
  float v3 = v2[232];
  float v4 = v2[233];
  float v5 = v2[234];
  float v6 = v2[235];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)yaw
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  float v3 = [v2 cameraController];
  [v3 heading];
  double v5 = v4;

  return v5;
}

- (unsigned)applicationState
{
  return *((unsigned char *)self + 192);
}

- (void)setDisplayedSearchResultsType:(unsigned __int8)a3
{
}

- (int64_t)applicationUILayout
{
  return *((void *)self + 25);
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 timingCurve:(id)a8 completion:(id)a9
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v17 = a8;
  v18 = (void (**)(id, void))a9;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  v19 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v22 = 134219521;
    v23 = self;
    __int16 v24 = 2049;
    double v25 = var0;
    __int16 v26 = 2049;
    double v27 = var1;
    __int16 v28 = 2049;
    double v29 = a4;
    __int16 v30 = 2048;
    double v31 = a5;
    __int16 v32 = 2048;
    double v33 = a6;
    __int16 v34 = 2048;
    double v35 = a7;
    _os_log_impl(&dword_1A1780000, v19, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set center coodinate: (%{private}f, %{private}f), altitude: %{private}f, yaw: %f, pitch: %f, duration: %f", (uint8_t *)&v22, 0x48u);
  }
  v20 = [(VKMapView *)self currentCanvas];
  v21 = [v20 cameraController];

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v21, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 0, v17, v18, var0, var1, a4, a5, a6, a7);
  }
  else if (v18)
  {
    v18[2](v18, 0);
  }
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  v16 = (void (**)(id, void))a8;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v17 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v20 = 134219010;
    v21 = self;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2048;
    double v25 = a4;
    __int16 v26 = 2048;
    double v27 = a5;
    __int16 v28 = 2048;
    double v29 = a6;
    _os_log_impl(&dword_1A1780000, v17, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set map region: %@, pitch: %f, yaw: %f, animation duration: %f", (uint8_t *)&v20, 0x34u);
  }
  v18 = [(VKMapView *)self currentCanvas];
  v19 = [v18 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 setMapRegion:v14 pitch:v15 yaw:v16 duration:a4 timingCurve:a5 completion:a6];
  }
  else if (v16)
  {
    v16[2](v16, 0);
  }
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v9 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v12 = 134218754;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2048;
    double v17 = a4;
    __int16 v18 = 2048;
    double v19 = a5;
    _os_log_impl(&dword_1A1780000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set map region: %@, pitch: %f, yaw: %f", (uint8_t *)&v12, 0x2Au);
  }
  double v10 = [(VKMapView *)self currentCanvas];
  id v11 = [v10 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 setMapRegion:v8 pitch:0 yaw:0 duration:a4 timingCurve:a5 completion:0.0];
  }
}

- (GEOMapRegion)mapRegion
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  float v3 = [v2 cameraController];
  double v4 = [v3 mapRegion];

  return (GEOMapRegion *)v4;
}

- (VKEdgeInsets)edgeInsets
{
  if (*((void *)self + 19))
  {
    float v2 = *((float *)self + 40);
    float v3 = *((float *)self + 41);
    float v4 = *((float *)self + 42);
    float v5 = *((float *)self + 43);
  }
  else
  {
    float v6 = [(VKMapView *)self currentCanvas];
    [v6 edgeInsets];
    float v2 = v7;
    float v3 = v8;
    float v4 = v9;
    float v5 = v10;
  }
  float v11 = v2;
  float v12 = v3;
  float v13 = v4;
  float v14 = v5;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)didEnterBackground
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  float v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    float v13 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Did enter background", (uint8_t *)&v12, 0xCu);
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
  }
  float v4 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  float v5 = v4;
  os_signpost_id_t v6 = *(void *)(*((void *)self + 48) + 1216);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Foreground", "", (uint8_t *)&v12, 2u);
  }

  uint64_t v7 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView didEnterBackground]");
  BOOL v8 = [(VKMapView *)self isEffectivelyHidden];
  [*((id *)self + 5) didReceiveMemoryWarning:v8 beAggressive:0];
  [*((id *)self + 6) didReceiveMemoryWarning:v8 beAggressive:0];
  md::MapEngine::prune(v7, !v8);
  if (!*((unsigned char *)self + 240)) {
    md::MapEngine::prune(v7, 0);
  }
  float v9 = +[VKSharedResourcesManager sharedResources];
  [v9 purgeDecompressSessionCachedBuffers];

  uint64_t v10 = *((void *)self + 48);
  *(unsigned char *)(v10 + 1177) = 1;
  (*(void (**)(void))(**(void **)(*(void *)(v10 + 24) + 8) + 40))(*(void *)(*(void *)(v10 + 24)
                                                                                                 + 8));
  [*(id *)(v10 + 824) didEnterBackground];
  md::MapEngine::updateRunLoopStatus((md::MapEngine *)v10);
  *((unsigned char *)self + 240) = 1;
  if (*((unsigned char *)self + 392))
  {
    if (![(VKMapView *)self rendersInBackground])
    {
      uint64_t v11 = *((void *)self + 48);
      [*(id *)(v11 + 840) setRenderSource:0];
      [*(id *)(v11 + 840) destroyRenderTarget];
    }
  }
}

- (BOOL)isEffectivelyHidden
{
  char v3 = [(VKMapView *)self isHidden];
  uint64_t v4 = [(VKMapView *)self superlayer];
  float v5 = (void *)v4;
  if (!v4 || (v3 & 1) != 0)
  {
    os_signpost_id_t v6 = (void *)v4;
  }
  else
  {
    do
    {
      char v3 = [v5 isHidden];
      os_signpost_id_t v6 = [v5 superlayer];

      if (v6) {
        char v7 = v3;
      }
      else {
        char v7 = 1;
      }
      float v5 = v6;
    }
    while ((v7 & 1) == 0);
  }

  return v3;
}

- (void)projectCoordinate:(id)a3 toPoint:(CGPoint *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = [(VKMapView *)self currentCanvas];
  objc_msgSend(v9, "convertCoordinateToPoint:", var0, var1);
  a4->x = v7;
  a4->y = v8;
}

- (id)annotationCoordinateTest
{
  float v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 annotationCoordinateTest];

  return v3;
}

- (id)annotationRectTest
{
  float v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 annotationRectTest];

  return v3;
}

- (id)venueWithFocus
{
  float v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_26;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v3 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v5 = 0xEC9B77B4222D22FFLL % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  os_signpost_id_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    goto LABEL_26;
  }
  CGFloat v7 = (void *)*v6;
  if (!v7) {
    goto LABEL_26;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0xEC9B77B4222D22FFLL)
      {
        if (v7[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_26;
      }
      CGFloat v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_26;
    }
LABEL_11:
    CGFloat v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_26;
    }
  }
  if (v7[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11)
  {
    if (*(unsigned char *)(v11 + 56))
    {
      uint64_t v12 = *(void *)(v11 + 568);
      if (v12)
      {
        float v13 = [[VKVenueFeatureMarker alloc] initWithVenue:v12 localize:[(VKMapView *)self localizeLabels]];
        goto LABEL_27;
      }
    }
  }
LABEL_26:
  float v13 = 0;
LABEL_27:
  return v13;
}

- (void)willLayoutWithTimestamp:(double)a3 withContext:(void *)a4
{
  id v6 = [(VKMapView *)self currentCanvas];
  [v6 updateWithTimestamp:a4 withContext:a3];
}

- (void)setLabelEdgeWidths:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v10 = 134219008;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    double v13 = top;
    __int16 v14 = 2048;
    double v15 = bottom;
    __int16 v16 = 2048;
    double v17 = left;
    __int16 v18 = 2048;
    double v19 = right;
    _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label edge widths: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v10, 0x34u);
  }
  unint64_t v9 = (float *)*((void *)self + 48);
  v9[236] = top;
  v9[237] = left;
  v9[238] = bottom;
  v9[239] = right;
  LOBYTE(v10) = 1;
  md::MapEngine::setNeedsTick((uint64_t)v9, &v10);
}

- (void)setIconsShouldAlignToPixels:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(VKMapView *)self iconsShouldAlignToPixels] != a3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      id v6 = "NO";
      if (v3) {
        id v6 = "YES";
      }
      int v7 = 134218242;
      uint64_t v8 = self;
      __int16 v9 = 2080;
      int v10 = v6;
      _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set icons should align to pixels: %s", (uint8_t *)&v7, 0x16u);
    }
    *(unsigned char *)(*((void *)self + 48) + 976) = v3;
    [(VKMapView *)self setNeedsLayout];
  }
}

- (BOOL)iconsShouldAlignToPixels
{
  return *(unsigned char *)(*((void *)self + 48) + 976);
}

- (void)setNeedsLayout
{
  uint64_t v2 = *((void *)self + 48);
  char v3 = 1;
  md::MapEngine::setNeedsTick(v2, &v3);
}

- (optional<double>)puckAnimator:(id)a3 getElevationWithCoordinate:(const void *)a4
{
  uint8x8_t v4 = *(unsigned __int8 **)(*((void *)self + 48) + 904);
  if (v4)
  {
    md::MapDataAccess::heightAtCoordinate(v4, a4);
    *(void *)&v5.type = v5.data[0];
  }
  else
  {
    v5.type = 0.0;
  }
  result._value = v5;
  result._hasValue = (char)v4;
  return result;
}

- (void)didUpdateVerticalYawTo:(double)a3
{
  if (*((double *)self + 23) != a3)
  {
    *((double *)self + 23) = a3;
    id v4 = [(VKMapView *)self mapDelegate];
    [v4 mapLayer:self didUpdateVerticalYawTo:*((double *)self + 23)];
  }
}

- (void)addPersistentRouteOverlay:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  ValueUnion v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = [(VKMapView *)self targetDisplay];
    if (v6 > 2) {
      int v7 = &stru_1EF593218;
    }
    else {
      int v7 = off_1E5A8C388[v6];
    }
    int v9 = 134218498;
    int v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Adding persistent route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v8 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView addPersistentRouteOverlay:]");
  md::RouteOverlayContainer::addOverlay(*(void *)(*(void *)(v8 + 896) + 16), v4, 1);
}

- (int64_t)targetDisplay
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    id v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        id v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    id v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        id v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(unsigned __int8 *)(v4[5] + 161);
}

- (void)closeLoaderConnection
{
}

- (void)setLabelScaleFactor:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(VKMapView *)self labelScaleFactor] != a3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218240;
      int v10 = self;
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label scale factor: %ld", (uint8_t *)&v9, 0x16u);
    }
    unint64_t v6 = [(VKMapView *)self _labelSettings];
    if ((unint64_t)a3 >= 6) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = a3;
    }
    md::LabelSettings_Presentation::setLabelScaleFactor(*(md::LabelManager **)(*(void *)v6 + 24), *(void *)(*(void *)v6 + 40), v7);
    uint64_t v8 = (void *)*((void *)self + 67);
    *((void *)self + 67) = 0;
  }
}

- (int64_t)labelScaleFactor
{
  unsigned int v2 = *(unsigned __int8 *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 48);
  if (v2 >= 6) {
    return 1;
  }
  else {
    return v2;
  }
}

- (void)setShieldSize:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(VKMapView *)self shieldSize] != a3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v8 = 134218240;
      int v9 = self;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shield size: %ld", (uint8_t *)&v8, 0x16u);
    }
    unint64_t v6 = [(VKMapView *)self _labelSettings];
    md::LabelSettings_Presentation::setShieldSize(*(md::LabelManager **)(*(void *)v6 + 24), *(void *)(*(void *)v6 + 40), +[VKInternalIconManager convertSizeGroup:a3]);
    unsigned __int8 v7 = (void *)*((void *)self + 67);
    *((void *)self + 67) = 0;
  }
}

- (int64_t)shieldSize
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 1);
  return +[VKInternalIconManager convertGrlSizeGroup:v2];
}

- (void)setShowsVenues:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = "NO";
    if (v3) {
      unint64_t v6 = "YES";
    }
    int v9 = 134218242;
    __int16 v10 = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows venues: %s", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v9) = 0;
  md::MapEngineSettings::set(v7, &v9, (void *)v3);
  int v8 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsVenues(*(md::LabelSettings_Presentation **)(*(void *)v8 + 24), *(void *)(*(void *)v8 + 40), v3);
}

- (void)setClientLocalizedStrings:(id)a3
{
  id v4 = (VKClientLocalizedStrings *)a3;
  md::LabelSettings::setClientLocalizedStrings((md::LabelSettings *)[(VKMapView *)self _labelSettings], v4);
}

- (void)setLabelMarkerSelectionEnabled:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = "NO";
    if (v3) {
      unint64_t v6 = "YES";
    }
    int v8 = 134218242;
    int v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label marker selection enabled: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Markers::setSelectionEnabled(*(md::LabelSettings_Markers **)(v7[2] + 24), *(void *)(v7[2] + 40), v3);
}

- (void)setShowsPointsOfInterest:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = "NO";
    if (v3) {
      unint64_t v6 = "YES";
    }
    int v8 = 134218242;
    int v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows points of interest: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsPOIs(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (void)setLocalizeLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = "NO";
    if (v3) {
      unint64_t v6 = "YES";
    }
    int v8 = 134218242;
    int v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set localized labels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setLocalizeLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (void)setTrafficIncidentsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = "NO";
    if (v3) {
      unint64_t v6 = "YES";
    }
    int v18 = 134218242;
    double v19 = self;
    __int16 v20 = 2080;
    v21 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set traffic incidents enabled: %s", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v18) = 3;
  md::MapEngineSettings::set(v7, &v18, (void *)v3);
  int v8 = [(VKMapView *)self _labelSettings];
  if (!v3) {
    goto LABEL_14;
  }
  int v9 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  if (v10 != v11)
  {
    while (*(unsigned char *)v10 != 2)
    {
      v10 += 16;
      if (v10 == v11) {
        goto LABEL_14;
      }
    }
  }
  if (v10 == v11) {
LABEL_14:
  }
    unsigned int v12 = 0;
  else {
    unsigned int v12 = *(void *)(v10 + 8) != 0;
  }
  md::LabelSettings::setTrafficEnabled(*((md::LabelSettings **)v8 + 3), *((void *)v8 + 5), v12);
  uint64_t v13 = [(VKMapView *)self _labelSettings];
  if (!v3) {
    goto LABEL_22;
  }
  __int16 v14 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  if (v15 != v16)
  {
    while (*(unsigned char *)v15 != 4)
    {
      v15 += 16;
      if (v15 == v16) {
        goto LABEL_22;
      }
    }
  }
  if (v15 == v16) {
LABEL_22:
  }
    unsigned int v17 = 0;
  else {
    unsigned int v17 = *(void *)(v15 + 8) != 0;
  }
  md::LabelSettings::setTrafficClosuresEnabled(*((md::LabelSettings **)v13 + 3), *((void *)v13 + 5), v17);
}

- (void)setLabelSelectionFilter:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)self + 77);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)self + 77, obj);
    objc_storeStrong((id *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 312), a3);
  }
}

- (void)clearPreviouslySelectedLabelMarker
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  BOOL v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    LODWORD(v5) = 134217984;
    *(void *)((char *)&v5 + 4) = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] clearPreviouslySelectedLabelMarker", (uint8_t *)&v5, 0xCu);
  }
  id v4 = *(md::LabelManager **)(*(void *)([(VKMapView *)self _labelSettings] + 16) + 24);
  *(void *)&long long v5 = &unk_1EF56F210;
  *((void *)&v5 + 1) = v4;
  unint64_t v6 = &v5;
  md::LabelManager::queueCommand(v4, 61, 1, &v5);
  if (v6 == &v5)
  {
    (*(void (**)(long long *))(v5 + 32))(&v5);
  }
  else if (v6)
  {
    (*(void (**)(void))(*(void *)v6 + 40))();
  }
}

- (void)addCustomFeatureDataSource:(id)a3
{
  id v4 = a3;
  md::LabelSettings::addCustomFeatureDataSource((uint64_t)[(VKMapView *)self _labelSettings], v4);
}

- (void)setExternalTrafficFeatures:(id)a3 areRouteTrafficFeaturesActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  id v47 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6) {
      uint64_t v8 = [v6 count];
    }
    else {
      uint64_t v8 = 0;
    }
    int v9 = "NO";
    *(_DWORD *)buf = 134218498;
    v53 = self;
    if (v4) {
      int v9 = "YES";
    }
    __int16 v54 = 2048;
    uint64_t v55 = v8;
    __int16 v56 = 2080;
    v57 = v9;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set external traffic features - count:%zu, areRouteTrafficFeaturesActive:%s", buf, 0x20u);
  }

  md::LabelSettings::setExternalTrafficFeatures((uint64_t)[(VKMapView *)self _labelSettings], v6, v4);
  uint64_t v10 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (v10)
  {
    int8x8_t v11 = v10[2];
    if (v11)
    {
      uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
      v12.i16[0] = vaddlv_u8(v12);
      if (v12.u32[0] > 1uLL)
      {
        uint64_t v13 = 0x5CBBA028798243FLL;
        if (*(void *)&v11 <= 0x5CBBA028798243FuLL) {
          uint64_t v13 = 0x5CBBA028798243FuLL % *(void *)&v11;
        }
      }
      else
      {
        uint64_t v13 = (*(void *)&v11 - 1) & 0x5CBBA028798243FLL;
      }
      __int16 v14 = *(void **)(*(void *)&v10[1] + 8 * v13);
      if (v14)
      {
        uint64_t v15 = (void *)*v14;
        if (v15)
        {
          if (v12.u32[0] < 2uLL)
          {
            uint64_t v16 = *(void *)&v11 - 1;
            while (1)
            {
              uint64_t v18 = v15[1];
              if (v18 == 0x5CBBA028798243FLL)
              {
                if (v15[2] == 0x5CBBA028798243FLL) {
                  goto LABEL_32;
                }
              }
              else if ((v18 & v16) != v13)
              {
                goto LABEL_65;
              }
              uint64_t v15 = (void *)*v15;
              if (!v15) {
                goto LABEL_65;
              }
            }
          }
          do
          {
            unint64_t v17 = v15[1];
            if (v17 == 0x5CBBA028798243FLL)
            {
              if (v15[2] == 0x5CBBA028798243FLL)
              {
LABEL_32:
                double v19 = (void *)v15[5];
                if (v19)
                {
                  id v20 = v6;
                  v19[26] = v19[25];
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  id obj = v20;
                  uint64_t v21 = [obj countByEnumeratingWithState:&v48 objects:buf count:16];
                  if (v21)
                  {
                    uint64_t v22 = *(void *)v49;
                    uint64_t v45 = *(void *)v49;
                    do
                    {
                      for (uint64_t i = 0; i != v21; ++i)
                      {
                        if (*(void *)v49 != v22) {
                          objc_enumerationMutation(obj);
                        }
                        id v24 = *(id *)(*((void *)&v48 + 1) + 8 * i);
                        if (([v24 isIncident] & 1) == 0)
                        {
                          uint64_t v25 = [v24 routeOffset];
                          uint64_t v26 = v25;
                          __int16 v28 = (uint64_t *)v19[26];
                          unint64_t v27 = v19[27];
                          if ((unint64_t)v28 >= v27)
                          {
                            uint64_t v30 = (char *)v19[25];
                            uint64_t v31 = ((char *)v28 - v30) >> 3;
                            unint64_t v32 = v31 + 1;
                            if ((unint64_t)(v31 + 1) >> 61) {
                              abort();
                            }
                            uint64_t v33 = v27 - (void)v30;
                            if (v33 >> 2 > v32) {
                              unint64_t v32 = v33 >> 2;
                            }
                            if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
                              unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
                            }
                            else {
                              unint64_t v34 = v32;
                            }
                            if (v34)
                            {
                              if (v34 >> 61) {
                                std::__throw_bad_array_new_length[abi:nn180100]();
                              }
                              unint64_t v35 = v34;
                              uint64_t v36 = (char *)operator new(8 * v34);
                              unint64_t v34 = v35;
                            }
                            else
                            {
                              uint64_t v36 = 0;
                            }
                            v37 = (uint64_t *)&v36[8 * v31];
                            uint64_t *v37 = v26;
                            double v29 = v37 + 1;
                            if (v28 != (uint64_t *)v30)
                            {
                              unint64_t v38 = (char *)(v28 - 1) - v30;
                              if (v38 < 0x58) {
                                goto LABEL_70;
                              }
                              if ((unint64_t)(v30 - v36) < 0x20) {
                                goto LABEL_70;
                              }
                              uint64_t v39 = (v38 >> 3) + 1;
                              v40 = &v36[8 * v31 - 16];
                              v41 = v28 - 2;
                              uint64_t v42 = v39 & 0x3FFFFFFFFFFFFFFCLL;
                              do
                              {
                                long long v43 = *(_OWORD *)v41;
                                *((_OWORD *)v40 - 1) = *((_OWORD *)v41 - 1);
                                *(_OWORD *)v40 = v43;
                                v40 -= 32;
                                v41 -= 4;
                                v42 -= 4;
                              }
                              while (v42);
                              v37 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
                              v28 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
                              if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
                              {
LABEL_70:
                                do
                                {
                                  uint64_t v44 = *--v28;
                                  *--v37 = v44;
                                }
                                while (v28 != (uint64_t *)v30);
                              }
                              __int16 v28 = (uint64_t *)v19[25];
                            }
                            v19[25] = v37;
                            v19[26] = v29;
                            v19[27] = &v36[8 * v34];
                            if (v28) {
                              operator delete(v28);
                            }
                          }
                          else
                          {
                            *__int16 v28 = v25;
                            double v29 = v28 + 1;
                          }
                          v19[26] = v29;
                          id v6 = v47;
                          uint64_t v22 = v45;
                        }
                      }
                      uint64_t v21 = [obj countByEnumeratingWithState:&v48 objects:buf count:16];
                    }
                    while (v21);
                  }
                }
                break;
              }
            }
            else
            {
              if (v17 >= *(void *)&v11) {
                v17 %= *(void *)&v11;
              }
              if (v17 != v13) {
                break;
              }
            }
            uint64_t v15 = (void *)*v15;
          }
          while (v15);
        }
      }
    }
  }
LABEL_65:
}

- (VKLabelMarker)selectedLabelMarker
{
  uint64_t v2 = *(void *)(*(void *)([(VKMapView *)self _labelSettings] + 16) + 40) + 32;
  return +[VKLabelMarker markerWithLabelMarker:v2];
}

- (void)_labelSettings
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x20A1ED17D78F322BLL;
    if (v3 <= 0x20A1ED17D78F322BLL) {
      unint64_t v5 = 0x20A1ED17D78F322BLL % v3;
    }
    BOOL v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        BOOL v4 = (void *)*v4;
      while (v4[1] != 0x20A1ED17D78F322BLL);
    }
    while (v4[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    BOOL v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        BOOL v4 = (void *)*v4;
      while (v4[1] != 0x20A1ED17D78F322BLL);
    }
    while (v4[2] != 0x20A1ED17D78F322BLL);
  }
  return *(void **)(v4[5] + 144);
}

void __34__VKMapView_labelManagerDidLayout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerLabelsDidLayout:*(void *)(a1 + 32)];
  }
}

- (void)willEnterForeground
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    uint8x8_t v12 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Will enter foreground", (uint8_t *)&v11, 0xCu);
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
  }
  id v4 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  unint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(*((void *)self + 48) + 1216);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Foreground", "", (uint8_t *)&v11, 2u);
  }

  *((unsigned char *)self + 392) = 0;
  BOOL v7 = [(VKMapView *)self _createDisplayLayer];
  uint64_t v8 = (md::MapEngine *)*((void *)self + 48);
  if (*((unsigned char *)self + 240) && !*((unsigned char *)v8 + 1178))
  {
    int v9 = [(VKMapView *)self userLocationAnimator];
    [v9 resetCourse];

    uint64_t v10 = [(VKMapView *)self userLocationAnimator];
    [v10 processLocationUpdates];

    uint64_t v8 = (md::MapEngine *)*((void *)self + 48);
  }
  *((unsigned char *)v8 + 97) = 1;
  *((unsigned char *)v8 + 1177) = 0;
  md::MapEngine::updateRunLoopStatus(v8);
  *((unsigned char *)self + 240) = 0;
  if (v7) {
    [(VKMapView *)self forceLayout];
  }
}

- (VKPuckAnimator)userLocationAnimator
{
  return (VKPuckAnimator *)*((void *)self + 28);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  [(VKMapView *)self bounds];
  v67.origin.double x = v8;
  v67.origin.double y = v9;
  v67.size.double width = v10;
  v67.size.double height = v11;
  v66.origin.double x = x;
  v66.origin.double y = y;
  v66.size.double width = width;
  v66.size.double height = height;
  if (!CGRectEqualToRect(v66, v67))
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    uint8x8_t v12 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219008;
      __int16 v56 = self;
      __int16 v57 = 2048;
      double v58 = width;
      __int16 v59 = 2048;
      double v60 = height;
      __int16 v61 = 2048;
      double v62 = x;
      __int16 v63 = 2048;
      double v64 = y;
      _os_log_impl(&dword_1A1780000, v12, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set bounds, size(%f, %f), origin: (%f, %f)", buf, 0x34u);
    }
    v54.receiver = self;
    v54.super_class = (Class)VKMapView;
    -[VKMapView setBounds:](&v54, sel_setBounds_, x, y, width, height);
    uint64_t v13 = *((void *)self + 48);
    if (v13)
    {
      id v14 = *(id *)(v13 + 840);
      [(VKMapView *)self bounds];
      objc_msgSend(v14, "setBounds:");
      int v15 = *((_DWORD *)self + 9);
      BOOL v17 = v15 == 10 || (v15 - 3) < 2;
      if (*((unsigned char *)self + 32) && v17)
      {
        int v18 = 0;
      }
      else
      {
        if (*((unsigned char *)self + 32)) {
          BOOL v19 = v15 == 11;
        }
        else {
          BOOL v19 = 0;
        }
        int v18 = !v19;
      }
      [v14 size];
      if (v20 > 0.0)
      {
        [v14 size];
        if (v21 > 0.0)
        {
          [v14 size];
          double v23 = v22;
          [v14 size];
          double v24 = trunc(v23);
          double v26 = trunc(v25);
          [*((id *)self + 57) setAspectRatio:v24 / v26];
          uint64_t v27 = *((void *)self + 48);
          __int16 v28 = *(double **)(v27 + 1064);
          double v29 = *(std::__shared_weak_count **)(v27 + 1072);
          if (v29) {
            atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          double v31 = v28[46];
          double v30 = v28[47];
          if (v30 >= v31)
          {
            double v37 = v28[57];
          }
          else
          {
            double v32 = v30 * v31;
            double v33 = v30 / v31;
            if (v32 <= 0.0) {
              double v34 = 1.0;
            }
            else {
              double v34 = v33;
            }
            long double v35 = tan(v28[57] * 0.5);
            long double v36 = atan(v34 * v35);
            double v37 = v36 + v36;
          }
          if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
          uint64_t v38 = *((void *)self + 48);
          uint64_t v39 = *(void *)(v38 + 1064);
          v40 = *(std::__shared_weak_count **)(v38 + 1072);
          if (v40) {
            atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          *(double *)(v39 + 368) = fmax(v24, 0.0);
          *(double *)(v39 + 376) = fmax(v26, 0.0);
          double v41 = *(float *)(v39 + 448);
          *(double *)(v39 + 384) = fmax(v41 * v24, 0.0);
          *(double *)(v39 + 392) = fmax(v41 * v26, 0.0);
          if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
          }
          if (v18)
          {
            uint64_t v42 = *((void *)self + 48);
            long long v43 = *(double **)(v42 + 1064);
            uint64_t v44 = *(std::__shared_weak_count **)(v42 + 1072);
            if (v44) {
              atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            double v46 = v43[46];
            double v45 = v43[47];
            if (v45 < v46)
            {
              double v47 = v45 * v46;
              double v48 = v46 / v45;
              if (v47 <= 0.0) {
                double v49 = 1.0;
              }
              else {
                double v49 = v48;
              }
              long double v50 = tan(v37 * 0.5);
              long double v51 = atan(v49 * v50);
              double v37 = v51 + v51;
            }
            v43[57] = v37;
            if (v44)
            {
              if (!atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
                std::__shared_weak_count::__release_weak(v44);
              }
            }
          }
        }
      }
      uint64_t v52 = *((void *)self + 48);
      buf[0] = 1;
      md::MapEngine::setNeedsTick(v52, buf);
      v53 = [(VKMapView *)self currentCanvas];
      [v53 updateCameraForFrameResize];
    }
  }
}

- (BOOL)_createDisplayLayer
{
  uint64_t v3 = *((void *)self + 48);
  [*(id *)(v3 + 840) setRenderSource:*(void *)(v3 + 48)];
  [*(id *)(v3 + 840) createRenderTarget];
  uint64_t v4 = *((void *)self + 48);
  LOBYTE(v23) = 1;
  md::MapEngine::setNeedsTick(v4, &v23);
  id v5 = *(id *)(*((void *)self + 48) + 840);
  [(VKMapView *)self contentsScale];
  objc_msgSend(v5, "setContentScale:");
  [(VKMapView *)self bounds];
  objc_msgSend(v5, "setBounds:");
  [v5 size];
  if (v6 > 0.0)
  {
    [v5 size];
    if (v7 > 0.0)
    {
      [v5 size];
      double v9 = v8;
      [v5 size];
      [*((id *)self + 57) setAspectRatio:v9 / v10];
      uint64_t v11 = *((void *)self + 48);
      uint64_t v12 = *(void *)(v11 + 1064);
      uint64_t v13 = *(std::__shared_weak_count **)(v11 + 1072);
      uint64_t v23 = v12;
      double v24 = v13;
      if (v13) {
        atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      objc_msgSend(v5, "size", v23, v24);
      double v15 = v14;
      [v5 size];
      double v16 = trunc(v15);
      double v18 = trunc(v17);
      *(double *)(v12 + 368) = fmax(v16, 0.0);
      *(double *)(v12 + 376) = fmax(v18, 0.0);
      double v19 = *(float *)(v12 + 448);
      *(double *)(v12 + 384) = fmax(v19 * v16, 0.0);
      *(double *)(v12 + 392) = fmax(v19 * v18, 0.0);
      if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  char v20 = [*(id *)(*((void *)self + 48) + 824) insertDisplayLayer:self];
  double v21 = [(VKMapView *)self currentCanvas];
  [v21 updateCameraForFrameResize];

  return v20;
}

- (BOOL)supportsMapType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VKMapView *)self contentsScale];
  if (v3 <= 0xA && ((1 << v3) & 0x418) != 0 && !*(unsigned char *)(*((void *)self + 48) + 1241)) {
    double v6 = off_1E5A8B0F0;
  }
  else {
    double v6 = off_1E5A8B170;
  }
  if (v5 <= 1.0) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  double v8 = *v6;
  return [(__objc2_class *)v8 supportsMapType:v3 scale:v7];
}

- (BOOL)isPitched
{
  char v2 = [(VKMapView *)self currentCanvas];
  uint64_t v3 = [v2 cameraController];
  char v4 = [v3 isPitched];

  return v4;
}

- (void)setLoadMuninAvailability:(BOOL)a3
{
  uint64_t v3 = *(void *)(*((void *)self + 48) + 1128);
  char v4 = 19;
  md::MapEngineSettings::set(v3, &v4, (void *)a3);
}

- (void)setShowsBuildings:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    double v6 = "NO";
    if (v3) {
      double v6 = "YES";
    }
    int v8 = 134218242;
    double v9 = self;
    __int16 v10 = 2080;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows buildings: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v8) = 1;
  md::MapEngineSettings::set(v7, &v8, (void *)v3);
}

- (void)setShowsLiveEVData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    double v6 = "NO";
    if (v3) {
      double v6 = "YES";
    }
    *(_DWORD *)__int16 v10 = 134218242;
    *(void *)&v10[4] = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows liveData: %s", v10, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  v10[0] = 36;
  if (v3) {
    unint64_t v8 = [(VKMapView *)self _realTimeEVChargerIsEnabled];
  }
  else {
    unint64_t v8 = 0;
  }
  md::MapEngineSettings::set(v7, v10, (void *)v8);
  uint64_t v9 = *((void *)self + 48);
  v10[0] = 1;
  md::MapEngine::setNeedsTick(v9, v10);
}

- (void)_configureDefaultSettings
{
  objc_initWeak(location, self);
  [(VKMapView *)self setEnableGlobe:0];
  BOOL v3 = (void *)*((void *)self + 73);
  v26[1] = (id)MEMORY[0x1E4F143A8];
  v26[2] = (id)3221225472;
  v26[3] = __38__VKMapView__configureDefaultSettings__block_invoke;
  v26[4] = &unk_1E5A8C208;
  objc_copyWeak(&v27, location);
  char v4 = MapsFeature_AddBlockListener();
  [v3 addObject:v4];

  [(VKMapView *)self setEnableRoundedBuildings:1];
  double v5 = (void *)*((void *)self + 73);
  v25[1] = (id)MEMORY[0x1E4F143A8];
  v25[2] = (id)3221225472;
  v25[3] = __38__VKMapView__configureDefaultSettings__block_invoke_2;
  v25[4] = &unk_1E5A8C208;
  objc_copyWeak(v26, location);
  double v6 = MapsFeature_AddBlockListener();
  [v5 addObject:v6];

  [(VKMapView *)self setEnableColorizedBuildings:1];
  uint64_t v7 = (void *)*((void *)self + 73);
  v24[1] = (id)MEMORY[0x1E4F143A8];
  v24[2] = (id)3221225472;
  v24[3] = __38__VKMapView__configureDefaultSettings__block_invoke_3;
  v24[4] = &unk_1E5A8C208;
  objc_copyWeak(v25, location);
  unint64_t v8 = MapsFeature_AddBlockListener();
  [v7 addObject:v8];

  [(VKMapView *)self setEnableBuildingHeights:1];
  uint64_t v9 = (void *)*((void *)self + 73);
  v23[1] = (id)MEMORY[0x1E4F143A8];
  v23[2] = (id)3221225472;
  v23[3] = __38__VKMapView__configureDefaultSettings__block_invoke_4;
  v23[4] = &unk_1E5A8C208;
  objc_copyWeak(v24, location);
  __int16 v10 = MapsFeature_AddBlockListener();
  [v9 addObject:v10];

  [(VKMapView *)self setEnableAdvancedWater:1];
  __int16 v11 = (void *)*((void *)self + 73);
  v22[1] = (id)MEMORY[0x1E4F143A8];
  v22[2] = (id)3221225472;
  v22[3] = __38__VKMapView__configureDefaultSettings__block_invoke_5;
  v22[4] = &unk_1E5A8C208;
  objc_copyWeak(v23, location);
  uint64_t v12 = MapsFeature_AddBlockListener();
  [v11 addObject:v12];

  [(VKMapView *)self setEnableAdvancedLighting:1];
  uint64_t v13 = (void *)*((void *)self + 73);
  v21[1] = (id)MEMORY[0x1E4F143A8];
  v21[2] = (id)3221225472;
  v21[3] = __38__VKMapView__configureDefaultSettings__block_invoke_6;
  v21[4] = &unk_1E5A8C208;
  objc_copyWeak(v22, location);
  double v14 = MapsFeature_AddBlockListener();
  [v13 addObject:v14];

  [(VKMapView *)self setTerrainMode:0];
  double v15 = (void *)*((void *)self + 73);
  v20[1] = (id)MEMORY[0x1E4F143A8];
  v20[2] = (id)3221225472;
  v20[3] = __38__VKMapView__configureDefaultSettings__block_invoke_7;
  v20[4] = &unk_1E5A8C208;
  objc_copyWeak(v21, location);
  double v16 = MapsFeature_AddBlockListener();
  [v15 addObject:v16];

  [(VKMapView *)self setModernMapEnabled:MapsFeature_IsEnabled_Maps298()];
  double v17 = (void *)*((void *)self + 73);
  objc_copyWeak(v20, location);
  double v18 = MapsFeature_AddBlockListener();
  [v17 addObject:v18];

  double v19 = +[VKDebugSettings sharedSettings];
  -[VKMapView setCompressedBuildingsEnabled:](self, "setCompressedBuildingsEnabled:", [v19 compressedBuildingsDisabled] ^ 1);

  md::MapEngine::updateDaVinciPOILabelsAvailable(*((md::MapEngine **)self + 48));
  [(VKMapView *)self setRenderOverlayPolygons:1];
  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);
}

- (void)setRenderOverlayPolygons:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 11;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setModernMapEnabled:(BOOL)a3
{
  uint64_t v3 = *(void *)(*((void *)self + 48) + 1128);
  char v4 = 25;
  md::MapEngineSettings::set(v3, &v4, (void *)a3);
}

- (void)setEnableRoundedBuildings:(BOOL)a3
{
  *((unsigned char *)self + 577) = a3;
  uint64_t v4 = [(VKMapView *)self _roundedBuildingsAllowed] & a3;
  uint64_t v5 = +[VKDebugSettings sharedSettings];
  [v5 setDaVinciRoundBuildings:v4];

  char v6 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v6[567], "-[VKMapView setEnableRoundedBuildings:]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v6);
}

- (void)setEnableColorizedBuildings:(BOOL)a3
{
  *((unsigned char *)self + 578) = a3;
  uint64_t v3 = [(VKMapView *)self _colorizedBuildingsAllowed] & a3;
  id v4 = +[VKDebugSettings sharedSettings];
  [v4 setDaVinciColorBuildings:v3];
}

- (void)setEnableBuildingHeights:(BOOL)a3
{
  *((unsigned char *)self + 579) = a3;
  uint64_t v4 = [(VKMapView *)self _buildingHeightsAllowed] & a3;
  uint64_t v5 = +[VKDebugSettings sharedSettings];
  [v5 setDaVinciBuildingHeights:v4];

  char v6 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v6[567], "-[VKMapView setEnableBuildingHeights:]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v6);
}

- (void)setEnableAdvancedWater:(BOOL)a3
{
  *((unsigned char *)self + 581) = a3;
  uint64_t v3 = [(VKMapView *)self _advancedWaterAllowed] & a3;
  id v4 = +[VKDebugSettings sharedSettings];
  [v4 setDaVinciWaterEnabled:v3];
}

- (void)setEnableAdvancedLighting:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)self + 580) = a3;
  if ([(VKMapView *)self _daVinciDataAvailable]) {
    uint64_t v5 = [(VKMapView *)self _advancedLightingAllowed] & v3;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = +[VKDebugSettings sharedSettings];
  [v6 setDaVinciAdvancedLightingEnabled:v5];
}

- (void)setCompressedBuildingsEnabled:(BOOL)a3
{
  *((unsigned char *)self + 416) = a3;
  [(VKMapView *)self _updateBuildingCompressionSetting];
}

- (void)_updateBuildingCompressionSetting
{
  uint64_t v2 = *((void *)self + 48);
  char v3 = *(unsigned char *)(v2 + 1240);
  uint64_t v4 = *(void *)(v2 + 1128);
  char v5 = 24;
  md::MapEngineSettings::set(v4, &v5, (void *)(*((unsigned char *)self + 416) & v3));
}

- (BOOL)_roundedBuildingsAllowed
{
  return MEMORY[0x1F411C538](self, a2);
}

- (BOOL)_colorizedBuildingsAllowed
{
  return MEMORY[0x1F411C520](self, a2);
}

- (BOOL)_buildingHeightsAllowed
{
  return MEMORY[0x1F411C518](self, a2);
}

- (BOOL)_advancedWaterAllowed
{
  return MEMORY[0x1F411C510](self, a2);
}

- (BOOL)_advancedLightingAllowed
{
  return MEMORY[0x1F411C508](self, a2);
}

- (void)setShouldLoadFallbackTiles:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  char v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    id v6 = "NO";
    if (v3) {
      id v6 = "YES";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set should load fallback tiles display: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v8) = 7;
  md::MapEngineSettings::set(v7, &v8, (void *)v3);
}

- (void)setShowsHiking:(BOOL)a3 withTopographicFeatures:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOConfigGetBOOL())
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    uint64_t v7 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      double v15 = self;
      _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows hiking is overridden", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v5) {
      BOOL v5 = [(VKMapView *)self _hikingIsAvailable];
    }
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    int v8 = (void *)(v5 & v4);
    uint64_t v9 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = "NO";
      if (v5) {
        __int16 v11 = "YES";
      }
      else {
        __int16 v11 = "NO";
      }
      int v14 = 134218498;
      double v15 = self;
      double v17 = v11;
      __int16 v16 = 2080;
      if (v8) {
        __int16 v10 = "YES";
      }
      __int16 v18 = 2080;
      double v19 = v10;
      _os_log_impl(&dword_1A1780000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows hiking: %s with topograpic features: %s", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = *(void *)(*((void *)self + 48) + 1128);
    LOBYTE(v14) = 33;
    md::MapEngineSettings::set(v12, &v14, (void *)v5);
    uint64_t v13 = *(void *)(*((void *)self + 48) + 1128);
    LOBYTE(v14) = 34;
    md::MapEngineSettings::set(v13, &v14, v8);
  }
}

- (void)setEnableGlobe:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*((void *)self + 63) + 2)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = a3;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  BOOL v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    id v6 = "NO";
    if (v4) {
      id v6 = "YES";
    }
    int v14 = 134218242;
    double v15 = self;
    __int16 v16 = 2080;
    double v17 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] setEnableGlobe:%s", (uint8_t *)&v14, 0x16u);
  }
  *((unsigned char *)self + 576) = v4;
  [*((id *)self + 5) setForceRasterizationForGlobe:v4];
  if ([(VKMapView *)self _daVinciDataAvailable]) {
    BOOL v7 = v4 & +[VKMapView _globeIsEnabled];
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v8 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v14) = 22;
  md::MapEngineSettings::set(v8, &v14, (void *)v7);
  uint64_t v9 = *(void *)(*((void *)self + 48) + 896);
  if (v9) {
    md::World::setEnableGlobe(*(void *)(v9 + 32), *(void *)(v9 + 40), v7);
  }
  __int16 v10 = [*((id *)self + 5) cameraController];
  BOOL v11 = v10 == *((void **)self + 33);

  if (!v11)
  {
    uint64_t v12 = (void *)*((void *)self + 5);
    if (*((unsigned char *)self + 32) && *((_DWORD *)self + 9) == 11)
    {
      [*((id *)self + 5) setCameraController:*((void *)self + 35)];
    }
    else
    {
      uint64_t v13 = [(VKMapView *)self resolveMapCameraController];
      [v12 setCameraController:v13];
    }
  }
}

- (BOOL)_daVinciDataAvailable
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(*((void *)self + 48) + 896) + 24) + 56);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v3 != v4)
  {
    while (*(_WORD *)v3 != 29)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  if (v3 == v4) {
    return 0;
  }
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(v3 + 8) + 64))(&v6);
  return (_BYTE)v6 != 0;
}

- (void)setTerrainMode:(int64_t)a3
{
  if (*(unsigned char *)(*((void *)self + 63) + 3)) {
    a3 = 0;
  }
  *((void *)self + 71) = a3;
  if ([(VKMapView *)self _daVinciDataAvailable]
    && +[VKMapView _elevatedGroundIsEnabled])
  {
    uint64_t v5 = *(void *)(*((void *)self + 48) + 1128);
    char v13 = 29;
    md::MapEngineSettings::set(v5, &v13, (void *)a3);
    uint64_t v6 = *(void *)(*((void *)self + 48) + 1128);
    char v12 = 21;
    BOOL v7 = (unint64_t)(a3 - 1) < 3;
    uint64_t v8 = &v12;
  }
  else
  {
    uint64_t v9 = *(void *)(*((void *)self + 48) + 1128);
    char v11 = 29;
    md::MapEngineSettings::set(v9, &v11, 0);
    uint64_t v6 = *(void *)(*((void *)self + 48) + 1128);
    char v10 = 21;
    uint64_t v8 = &v10;
    BOOL v7 = 0;
  }
  md::MapEngineSettings::set(v6, v8, (void *)v7);
}

+ (BOOL)_elevatedGroundIsEnabled
{
  if (!MapsFeature_IsEnabled_ShelbyvilleTerrain()) {
    return 0;
  }
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  uint64_t v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v2 = [v3 supportsAdvancedMap];

  return v2;
}

+ (BOOL)_globeIsEnabled
{
  if (!MapsFeature_IsEnabled_ShelbyvilleGlobe()) {
    return 0;
  }
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  uint64_t v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v2 = [v3 supportsAdvancedMap];

  return v2;
}

- (VKMapView)initWithDescriptor:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  [v30 contentScale];
  checkForBogusContentScale(v4);
  v32.receiver = self;
  v32.super_class = (Class)VKMapView;
  uint64_t v5 = [(VKMapView *)&v32 init];

  if (v5)
  {
    *((unsigned char *)v5 + 528) = 0;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v7 = (void *)*((void *)v5 + 73);
    *((void *)v5 + 73) = v6;

    os_signpost_id_t v31 = 0;
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    uint64_t v8 = (id)GEOGetVectorKitVKDefaultLog_log;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v5);

    os_signpost_id_t v31 = v9;
    long double v35 = (void (**)(void **))&unk_1EF56C1B0;
    long double v36 = &v31;
    double v37 = (void **)&v35;
    v33[0] = &unk_1EF56C1F8;
    v33[1] = &v31;
    double v34 = v33;
    v38[3] = v38;
    v38[0] = &unk_1EF56C1F8;
    v38[1] = &v31;
    if (GEOGetVectorKitPerformanceLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_17);
    }
    char v10 = (id)GEOGetVectorKitPerformanceLog_log;
    char v11 = v10;
    os_signpost_id_t v12 = *v36;
    if (*v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CreateVKMapView", "", (uint8_t *)buf, 2u);
    }

    if (v34 == v33)
    {
      (*(void (**)(void *))(v33[0] + 32))(v33);
      char v13 = v30;
    }
    else
    {
      char v13 = v30;
      if (v34) {
        (*(void (**)(void))(*v34 + 40))();
      }
    }
    if (v37 == (void **)&v35)
    {
      v35[4]((void **)&v35);
    }
    else if (v37)
    {
      (*((void (**)(void))*v37 + 5))();
    }
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    int v14 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v13 shouldRasterize];
      int v16 = [v13 inBackground];
      [v13 contentScale];
      uint64_t v18 = v17;
      double v19 = gss::to_string([v13 carDisplayType]);
      buf[0] = 134219010;
      *(void *)&buf[1] = v5;
      __int16 v40 = 1024;
      int v41 = v15;
      __int16 v42 = 1024;
      int v43 = v16;
      v44[0] = 2048;
      *(void *)&v44[1] = v18;
      v44[5] = 2080;
      double v45 = v19;
      _os_log_impl(&dword_1A1780000, v14, OS_LOG_TYPE_INFO, "[VKMapView:%p] Creating VKMapView, rasterize=%i inBkgd=%i contentScale=%f carDisplayType=%s", (uint8_t *)buf, 0x2Cu);
    }

    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    uint64_t v20 = (id)GEOGetVectorKitVKDefaultLog_log;
    double v21 = v20;
    os_signpost_id_t v22 = v31;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "LoadRequiredLayers", "", (uint8_t *)buf, 2u);
    }

    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    uint64_t v23 = (id)GEOGetVectorKitVKDefaultLog_log;
    double v24 = v23;
    os_signpost_id_t v25 = v31;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "LoadAllLayers", "", (uint8_t *)buf, 2u);
    }

    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    double v26 = (id)GEOGetVectorKitVKDefaultLog_log;
    id v27 = v26;
    os_signpost_id_t v28 = v31;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v28, "LabelsCompletedFirstLayout", "", (uint8_t *)buf, 2u);
    }

    operator new();
  }

  return 0;
}

- (void)initWithDescriptor:
{
}

- (void)setContentsScale:(double)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (vabdd_f64(*((double *)self + 76), a3) <= 2.22044605e-16) {
    return;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set contents scale: %f", buf, 0x16u);
  }
  *((double *)self + 76) = a3;
  v68.receiver = self;
  v68.super_class = (Class)VKMapView;
  [(VKMapView *)&v68 setContentsScale:a3];
  uint64_t v6 = *((void *)self + 48);
  if (!v6) {
    goto LABEL_160;
  }
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v6 + 4536), "-[VKMapView setContentsScale:]");
  float v7 = a3;
  uint64_t v8 = *(md::World **)(v6 + 896);
  uint64_t v9 = *((void *)v8 + 4);
  uint64_t v10 = *((void *)v8 + 5);
  uint64_t v11 = v9;
  if (v9 != v10)
  {
    uint64_t v11 = *((void *)v8 + 4);
    while (*(_WORD *)v11 != 1)
    {
      v11 += 16;
      if (v11 == v10) {
        goto LABEL_15;
      }
    }
  }
  if (v11 != v10)
  {
    uint64_t v12 = *(void *)(v11 + 8);
    if (v12)
    {
      atomic_store(LODWORD(v7), (unsigned int *)(v12 + 800));
      uint64_t v9 = *((void *)v8 + 4);
      uint64_t v10 = *((void *)v8 + 5);
    }
  }
LABEL_15:
  if (v9 != v10)
  {
    uint64_t v13 = v9;
    while (*(_WORD *)v13 != 59)
    {
      v13 += 16;
      if (v13 == v10) {
        goto LABEL_23;
      }
    }
    if (v13 != v10)
    {
      uint64_t v14 = *(void *)(v13 + 8);
      if (v14)
      {
        atomic_store(LODWORD(v7), (unsigned int *)(v14 + 800));
        uint64_t v9 = *((void *)v8 + 4);
        uint64_t v10 = *((void *)v8 + 5);
      }
    }
LABEL_23:
    if (v9 != v10)
    {
      uint64_t v15 = v9;
      while (*(_WORD *)v15 != 6)
      {
        v15 += 16;
        if (v15 == v10) {
          goto LABEL_31;
        }
      }
      if (v15 != v10)
      {
        uint64_t v16 = *(void *)(v15 + 8);
        if (v16)
        {
          atomic_store(LODWORD(v7), (unsigned int *)(v16 + 792));
          uint64_t v9 = *((void *)v8 + 4);
          uint64_t v10 = *((void *)v8 + 5);
        }
      }
LABEL_31:
      if (v9 != v10)
      {
        uint64_t v17 = v9;
        while (*(_WORD *)v17 != 14)
        {
          v17 += 16;
          if (v17 == v10) {
            goto LABEL_41;
          }
        }
        if (v17 != v10)
        {
          uint64_t v18 = *(void *)(v17 + 8);
          if (v18)
          {
            atomic_store(LODWORD(v7), (unsigned int *)(v18 + 768));
            uint64_t v9 = *((void *)v8 + 4);
            uint64_t v10 = *((void *)v8 + 5);
          }
        }
LABEL_41:
        while (v9 != v10)
        {
          if (*(_WORD *)v9 == 11)
          {
            if (v9 != v10)
            {
              uint64_t v67 = *(void *)(v9 + 8);
              if (v67) {
                atomic_store(LODWORD(v7), (unsigned int *)(v67 + 624));
              }
            }
            break;
          }
          v9 += 16;
        }
      }
    }
  }
  uint64_t v19 = *((void *)v8 + 7);
  uint64_t v20 = *((void *)v8 + 8);
  uint64_t v21 = v19;
  if (v19 != v20)
  {
    uint64_t v21 = *((void *)v8 + 7);
    while (*(_WORD *)v21 != 11)
    {
      v21 += 16;
      if (v21 == v20) {
        goto LABEL_50;
      }
    }
  }
  if (v21 != v20)
  {
    uint64_t v22 = *(void *)(v21 + 8);
    if (v22) {
      *(float *)(v22 + 24) = v7;
    }
  }
LABEL_50:
  uint64_t v23 = *((void *)v8 + 4);
  uint64_t v24 = *((void *)v8 + 5);
  if (v23 != v24)
  {
    while (*(_WORD *)v23 != 12)
    {
      v23 += 16;
      if (v23 == v24) {
        goto LABEL_57;
      }
    }
  }
  if (v23 != v24)
  {
    uint64_t v25 = *(void *)(v23 + 8);
    if (v25)
    {
      atomic_store(LODWORD(v7), (unsigned int *)(v25 + 624));
      uint64_t v19 = *((void *)v8 + 7);
      uint64_t v20 = *((void *)v8 + 8);
    }
  }
LABEL_57:
  if (v19 != v20)
  {
    uint64_t v26 = v19;
    while (*(_WORD *)v26 != 12)
    {
      v26 += 16;
      if (v26 == v20) {
        goto LABEL_65;
      }
    }
    if (v26 != v20)
    {
      uint64_t v27 = *(void *)(v26 + 8);
      if (v27) {
        *(float *)(v27 + 24) = v7;
      }
    }
  }
LABEL_65:
  uint64_t v28 = *((void *)v8 + 4);
  uint64_t v29 = *((void *)v8 + 5);
  if (v28 != v29)
  {
    while (*(_WORD *)v28 != 71)
    {
      v28 += 16;
      if (v28 == v29) {
        goto LABEL_72;
      }
    }
  }
  if (v28 != v29)
  {
    uint64_t v30 = *(void *)(v28 + 8);
    if (v30)
    {
      atomic_store(LODWORD(v7), (unsigned int *)(v30 + 624));
      uint64_t v19 = *((void *)v8 + 7);
      uint64_t v20 = *((void *)v8 + 8);
    }
  }
LABEL_72:
  if (v19 != v20)
  {
    uint64_t v31 = v19;
    while (*(_WORD *)v31 != 71)
    {
      v31 += 16;
      if (v31 == v20) {
        goto LABEL_80;
      }
    }
    if (v31 != v20)
    {
      uint64_t v32 = *(void *)(v31 + 8);
      if (v32) {
        *(float *)(v32 + 24) = v7;
      }
    }
  }
LABEL_80:
  uint64_t v33 = *((void *)v8 + 4);
  uint64_t v34 = *((void *)v8 + 5);
  if (v33 != v34)
  {
    while (*(_WORD *)v33 != 72)
    {
      v33 += 16;
      if (v33 == v34) {
        goto LABEL_89;
      }
    }
  }
  if (v33 != v34)
  {
    uint64_t v35 = *(void *)(v33 + 8);
    if (v35)
    {
      atomic_store(LODWORD(v7), (unsigned int *)(v35 + 624));
      uint64_t v19 = *((void *)v8 + 7);
      uint64_t v20 = *((void *)v8 + 8);
    }
  }
LABEL_89:
  while (v19 != v20)
  {
    if (*(_WORD *)v19 == 72)
    {
      if (v19 != v20)
      {
        uint64_t v41 = *(void *)(v19 + 8);
        if (v41) {
          *(float *)(v41 + 24) = v7;
        }
      }
      break;
    }
    v19 += 16;
  }
  uint64_t v36 = *((void *)v8 + 4);
  uint64_t v37 = *((void *)v8 + 5);
  uint64_t v38 = v36;
  if (v36 != v37)
  {
    uint64_t v38 = *((void *)v8 + 4);
    while (*(_WORD *)v38 != 16)
    {
      v38 += 16;
      if (v38 == v37) {
        goto LABEL_98;
      }
    }
  }
  if (v38 != v37)
  {
    uint64_t v39 = *(void *)(v38 + 8);
    if (v39)
    {
      atomic_store(LODWORD(v7), (unsigned int *)(v39 + 856));
      uint64_t v36 = *((void *)v8 + 4);
      uint64_t v37 = *((void *)v8 + 5);
    }
  }
LABEL_98:
  if (v36 != v37)
  {
    uint64_t v40 = v36;
    while (*(_WORD *)v40 != 17)
    {
      v40 += 16;
      if (v40 == v37) {
        goto LABEL_111;
      }
    }
    if (v40 != v37)
    {
      uint64_t v42 = *(void *)(v40 + 8);
      if (v42)
      {
        atomic_store(LODWORD(v7), (unsigned int *)(v42 + 808));
        uint64_t v36 = *((void *)v8 + 4);
        uint64_t v37 = *((void *)v8 + 5);
      }
    }
LABEL_111:
    while (v36 != v37)
    {
      if (*(_WORD *)v36 == 41)
      {
        if (v36 != v37)
        {
          uint64_t v66 = *(void *)(v36 + 8);
          if (v66) {
            atomic_store(LODWORD(v7), (unsigned int *)(v66 + 800));
          }
        }
        break;
      }
      v36 += 16;
    }
  }
  uint64_t v43 = *(void *)(*((void *)v8 + 3) + 56);
  uint64_t v44 = (unsigned __int16 *)&md::MapResourceTypeList;
  do
  {
    double v45 = *(unsigned __int16 **)(v43 + 32);
    uint64_t v46 = *(unsigned __int16 **)(v43 + 40);
    if (v45 != v46)
    {
      while (*v45 != *v44)
      {
        v45 += 8;
        if (v45 == v46) {
          goto LABEL_113;
        }
      }
    }
    if (v45 != v46)
    {
      uint64_t v47 = *((void *)v45 + 1);
      if (v47)
      {
        float v48 = a3;
        (*(void (**)(uint64_t, float))(*(void *)v47 + 96))(v47, v48);
      }
    }
LABEL_113:
    ++v44;
  }
  while (v44 != word_1A2900380);
  md::World::clearAllData(v8);
  [*(id *)(v6 + 840) setContentScale:v7];
  double v49 = *(int8x8_t **)(v6 + 1120);
  int8x8_t v50 = v49[2];
  if (!*(void *)&v50) {
    goto LABEL_141;
  }
  uint8x8_t v51 = (uint8x8_t)vcnt_s8(v50);
  v51.i16[0] = vaddlv_u8(v51);
  if (v51.u32[0] > 1uLL)
  {
    uint64_t v52 = 0x2FED70A4459DFCA1;
    if (*(void *)&v50 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v52 = 0x2FED70A4459DFCA1uLL % *(void *)&v50;
    }
  }
  else
  {
    uint64_t v52 = (*(void *)&v50 - 1) & 0x2FED70A4459DFCA1;
  }
  v53 = *(void **)(*(void *)&v49[1] + 8 * v52);
  if (!v53 || (objc_super v54 = (void *)*v53) == 0)
  {
LABEL_141:
    double v58 = 0;
    goto LABEL_142;
  }
  if (v51.u32[0] < 2uLL)
  {
    uint64_t v55 = *(void *)&v50 - 1;
    while (1)
    {
      uint64_t v57 = v54[1];
      if (v57 == 0x2FED70A4459DFCA1)
      {
        if (v54[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_168;
        }
      }
      else if ((v57 & v55) != v52)
      {
        goto LABEL_141;
      }
      objc_super v54 = (void *)*v54;
      if (!v54) {
        goto LABEL_141;
      }
    }
  }
  while (1)
  {
    unint64_t v56 = v54[1];
    if (v56 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v56 >= *(void *)&v50) {
      v56 %= *(void *)&v50;
    }
    if (v56 != v52) {
      goto LABEL_141;
    }
LABEL_131:
    objc_super v54 = (void *)*v54;
    if (!v54) {
      goto LABEL_141;
    }
  }
  if (v54[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_131;
  }
LABEL_168:
  double v58 = (float *)v54[5];
LABEL_142:
  v58[30] = v7;
  (*(void (**)(float *))(*(void *)v58 + 16))(v58);
  uint64_t v59 = *(void *)(v6 + 1120);
  unint64_t v60 = *(void *)(v59 + 16);
  if ((v60 & (v60 - 1)) != 0)
  {
    unint64_t v62 = 0x20A1ED17D78F322BLL;
    if (v60 <= 0x20A1ED17D78F322BLL) {
      unint64_t v62 = 0x20A1ED17D78F322BLL % v60;
    }
    __int16 v61 = *(void **)(*(void *)(v59 + 8) + 8 * v62);
    do
    {
      do
        __int16 v61 = (void *)*v61;
      while (v61[1] != 0x20A1ED17D78F322BLL);
    }
    while (v61[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    __int16 v61 = *(void **)(*(void *)(v59 + 8) + 8 * ((v60 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        __int16 v61 = (void *)*v61;
      while (v61[1] != 0x20A1ED17D78F322BLL);
    }
    while (v61[2] != 0x20A1ED17D78F322BLL);
  }
  uint64_t v63 = v61[5];
  **(float **)(v63 + 152) = v7;
  for (uint64_t i = *(void **)(v63 + 192); i; uint64_t i = (void *)*i)
  {
    uint64_t v65 = (float *)i[3];
    if (v65[886] != v7)
    {
      v65[886] = v7;
      *(void *)buf = &unk_1EF56E298;
      *(void *)&buf[8] = v65;
      *(void *)&uint8_t buf[16] = LODWORD(v7);
      v70 = buf;
      md::LabelManager::queueCommand((md::LabelManager *)v65, 3, 1, buf);
      if (v70 == buf)
      {
        (*(void (**)(unsigned char *))(*(void *)buf + 32))(buf);
      }
      else if (v70)
      {
        (*(void (**)(void))(*(void *)v70 + 40))();
      }
    }
  }
LABEL_160:
  [*((id *)self + 6) setContentsScale:a3];
}

- (void)setCanonicalSkyHeight:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    float v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set sky height: %f", (uint8_t *)&v6, 0x16u);
  }
  [*((id *)self + 5) setCanonicalSkyHeight:a3];
}

- (void)openLoaderConnection
{
  if (!*((unsigned char *)self + 128))
  {
    *((unsigned char *)self + 128) = 1;
    id v3 = [MEMORY[0x1E4F64AC8] modernLoader];
    [v3 openForClient:*((void *)self + 17)];

    id v4 = [MEMORY[0x1E4F64918] modernManager];
    [v4 openServerConnection];
  }
}

- (void)setDisableShadows:(BOOL)a3
{
  uint64_t v3 = *((void *)self + 48);
  id v4 = *(int8x8_t **)(v3 + 1120);
  int8x8_t v5 = v4[2];
  if (v5)
  {
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v7 = 0x91E65CD7F1A7A7FALL;
      if (*(void *)&v5 <= 0x91E65CD7F1A7A7FALL) {
        unint64_t v7 = 0x91E65CD7F1A7A7FALL % *(void *)&v5;
      }
    }
    else
    {
      unint64_t v7 = (*(void *)&v5 - 1) & 0x91E65CD7F1A7A7FALL;
    }
    __int16 v8 = *(void **)(*(void *)&v4[1] + 8 * v7);
    if (v8)
    {
      double v9 = (void *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          uint64_t v10 = *(void *)&v5 - 1;
          while (1)
          {
            uint64_t v12 = v9[1];
            if (v12 == 0x91E65CD7F1A7A7FALL)
            {
              if (v9[2] == 0x91E65CD7F1A7A7FALL) {
                goto LABEL_22;
              }
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            double v9 = (void *)*v9;
            if (!v9) {
              return;
            }
          }
        }
        do
        {
          unint64_t v11 = v9[1];
          if (v11 == 0x91E65CD7F1A7A7FALL)
          {
            if (v9[2] == 0x91E65CD7F1A7A7FALL)
            {
LABEL_22:
              uint64_t v13 = v9[5];
              if (v13)
              {
                *(unsigned char *)(v13 + 136) = a3;
                char v14 = 1;
                md::MapEngine::setNeedsTick(v3, &v14);
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(void *)&v5) {
              v11 %= *(void *)&v5;
            }
            if (v11 != v7) {
              return;
            }
          }
          double v9 = (void *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setDisableBuildingFootprints:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v8 = 13;
  if (*(unsigned char *)(*((void *)self + 63) + 1)) {
    *(void *)&a3 = 1;
  }
  else {
    BOOL v5 = a3;
  }
  md::MapEngineSettings::set(v4, &v8, (void *)a3);
  uint64_t v6 = *((void *)self + 48);
  char v7 = 1;
  md::MapEngine::setNeedsTick(v6, &v7);
}

- (void)disableMapDisplayStyleDebugOverride
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*((unsigned char *)self + 592)) {
      uint64_t v4 = @"Night";
    }
    else {
      uint64_t v4 = @"Day";
    }
    int v5 = 134218242;
    uint64_t v6 = self;
    __int16 v7 = 2080;
    uint64_t v8 = [(__CFString *)v4 UTF8String];
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Map display style debug override disabled, setting time of day to: %s", (uint8_t *)&v5, 0x16u);
  }

  *((unsigned char *)self + 598) = 0;
  [(VKMapView *)self _applyMapDisplayStyle:*((unsigned int *)self + 148) | ((unint64_t)*((unsigned __int16 *)self + 298) << 32) animated:1 duration:1.0];
}

- (void)_updateBackgroundColor
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  md::GridLogic::defaultBackgroundColor(&v5, [(VKMapView *)self mapType], [(VKMapView *)self mapDisplayStyle], [(VKMapView *)self emphasis]);
  uint64_t v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)&v5);
  float64x2_t v7 = vcvtq_f64_f32(*(float32x2_t *)((char *)&v5 + 8));
  uint64_t v4 = CGColorCreate(v3, components);
  [(VKMapView *)self setBackgroundColor:v4];
  CGColorRelease(v4);
  CGColorSpaceRelease(v3);
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)mapDisplayStyle
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  uint64_t v6 = gss::ClientStyleState<gss::PropertyID>::targetMapDisplayStyle(*(void *)(v4[5] + 208));
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)(v6 & 0xFFFFFFFFFFLL | ((unint64_t)((v6 & 0xFF0000000000) == 0x10000000000) << 40));
}

- (unsigned)emphasis
{
  return *((unsigned char *)self + 144);
}

- (BOOL)isShowingCuratedElevatedGround
{
  uint64_t v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x17767EADC5B287BLL;
    if (*(void *)&v3 <= 0x17767EADC5B287BuLL) {
      uint64_t v5 = 0x17767EADC5B287BuLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x17767EADC5B287BLL;
  }
  uint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    return 0;
  }
  float64x2_t v7 = (void *)*v6;
  if (!v7) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x17767EADC5B287BLL)
      {
        if (v7[2] == 0x17767EADC5B287BLL) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      float64x2_t v7 = (void *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x17767EADC5B287BLL) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    float64x2_t v7 = (void *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (v7[2] != 0x17767EADC5B287BLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11)
  {
    if (*(unsigned char *)(v11 + 56))
    {
      uint64_t v12 = *(void *)(v11 + 160);
      if (*(unsigned char *)(v12 + 80)) {
        return *(unsigned char *)(v12 + 82) != 0;
      }
    }
  }
  return 0;
}

- (void)snapMapAfterModeChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__VKMapView_snapMapAfterModeChange__block_invoke;
  v2[3] = &unk_1E5A960A0;
  v2[4] = self;
  [(VKMapView *)self _postDelegateCallbackBlock:v2];
}

- (void)setMapDelegate:(id)a3
{
}

- (void)puckAnimator:(id)a3 runAnimation:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  float64x2_t v7 = [(VKMapView *)self navigationPuck];
  +[VKMapView updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:](VKMapView, "updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:", v8, [v7 enabled], *((void *)self + 48) + 928);

  [(VKMapView *)self runAnimation:v6];
}

- (id)navigationPuck
{
  uint64_t v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_24;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = 0xBEC1A12372CEEC00;
    if (*(void *)&v3 <= 0xBEC1A12372CEEC00) {
      unint64_t v5 = 0xBEC1A12372CEEC00 % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v3 - 1) & 0xBEC1A12372CEEC00;
  }
  id v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    goto LABEL_24;
  }
  float64x2_t v7 = (void *)*v6;
  if (!v7) {
    goto LABEL_24;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0xBEC1A12372CEEC00)
      {
        if (v7[2] == 0xBEC1A12372CEEC00) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_24;
      }
      float64x2_t v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_24;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0xBEC1A12372CEEC00) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_24;
    }
LABEL_11:
    float64x2_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_24;
    }
  }
  if (v7[2] != 0xBEC1A12372CEEC00) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11)
  {
    id v12 = *(id *)(v11 + 160);
    goto LABEL_25;
  }
LABEL_24:
  id v12 = 0;
LABEL_25:
  return v12;
}

- (void)runAnimation:(id)a3
{
  int8x8_t v3 = (md::MapEngine *)*((void *)self + 48);
  id v4 = a3;
  (*(void (**)(void *))(**((void **)v3 + 13) + 24))(*((void **)v3 + 13));
  md::MapEngine::updateRunLoopStatus(v3);
}

+ (void)updateUserLocationAnnotationStateForNavigationPuck:(id)a3 isPuckEnabled:(BOOL)a4 synchronizedState:(void *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (v6)
  {
    *((unsigned char *)a5 + 84) = 1;
  }
  else
  {
    *((unsigned char *)a5 + 84) = 2;
    id v10 = v7;
    uint64_t v8 = [v7 target];
    [v8 collisionSize];
    *(float *)&double v9 = v9;
    *((_DWORD *)a5 + 20) = LODWORD(v9);

    id v7 = v10;
  }
}

- (void)setIsPitchable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "NO";
    if (v3) {
      BOOL v6 = "YES";
    }
    int v9 = 134218242;
    id v10 = self;
    __int16 v11 = 2080;
    id v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set is pitchable: %s", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(VKMapView *)self currentCanvas];
  uint64_t v8 = [v7 cameraController];
  [v8 setIsPitchEnabled:v3];
}

- (void)addExternalAnchor:(id)a3
{
  id v76 = a3;
  uint64_t v4 = *((void *)self + 48);
  unint64_t v5 = *(int8x8_t **)(v4 + 1120);
  int8x8_t v6 = v5[2];
  if (!*(void *)&v6) {
    goto LABEL_153;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v8 = 0x79FE0BD9535D5C4DLL;
    if (*(void *)&v6 <= 0x79FE0BD9535D5C4DuLL) {
      uint64_t v8 = 0x79FE0BD9535D5C4DuLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v6 - 1) & 0x79FE0BD9535D5C4DLL;
  }
  int v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
  if (!v9) {
    goto LABEL_153;
  }
  id v10 = (void *)*v9;
  if (!v10) {
    goto LABEL_153;
  }
  if (v7.u32[0] < 2uLL)
  {
    uint64_t v11 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == 0x79FE0BD9535D5C4DLL)
      {
        if (v10[2] == 0x79FE0BD9535D5C4DLL) {
          goto LABEL_22;
        }
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_153;
      }
      id v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_153;
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == 0x79FE0BD9535D5C4DLL) {
      break;
    }
    if (v12 >= *(void *)&v6) {
      v12 %= *(void *)&v6;
    }
    if (v12 != v8) {
      goto LABEL_153;
    }
LABEL_11:
    id v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_153;
    }
  }
  if (v10[2] != 0x79FE0BD9535D5C4DLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v14 = v10[5];
  if (!v14) {
    goto LABEL_153;
  }
  id v15 = v76;
  uint64_t v16 = (void *)(v14 + 192);
  __p = operator new(0x28uLL);
  *(void *)__p = 0;
  *((void *)__p + 1) = 0;
  id v17 = v15;
  *((void *)__p + 2) = &unk_1EF5595F8;
  *((void *)__p + 3) = v17;
  *((void *)__p + 1) = [v17 hash];
  unint64_t v18 = [*((id *)__p + 3) hash];
  *((void *)__p + 1) = v18;
  unint64_t v19 = *(void *)(v14 + 184);
  if (!v19) {
    goto LABEL_43;
  }
  uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v19);
  v20.i16[0] = vaddlv_u8(v20);
  if (v20.u32[0] > 1uLL)
  {
    unint64_t v21 = v18;
    if (v19 <= v18) {
      unint64_t v21 = v18 % v19;
    }
  }
  else
  {
    unint64_t v21 = (v19 - 1) & v18;
  }
  uint64_t v22 = *(void **)(*(void *)(v14 + 176) + 8 * v21);
  if (!v22 || (uint64_t v23 = (void *)*v22) == 0)
  {
LABEL_43:
    float v27 = (float)(unint64_t)(*(void *)(v14 + 200) + 1);
    float v28 = *(float *)(v14 + 208);
    if (!v19 || (float)(v28 * (float)v19) < v27)
    {
      BOOL v29 = 1;
      if (v19 >= 3) {
        BOOL v29 = (v19 & (v19 - 1)) != 0;
      }
      unint64_t v30 = v29 | (2 * v19);
      unint64_t v31 = vcvtps_u32_f32(v27 / v28);
      if (v30 <= v31) {
        size_t prime = v31;
      }
      else {
        size_t prime = v30;
      }
      if (prime == 1)
      {
        size_t prime = 2;
      }
      else if ((prime & (prime - 1)) != 0)
      {
        size_t prime = std::__next_prime(prime);
        unint64_t v19 = *(void *)(v14 + 184);
      }
      if (prime > v19) {
        goto LABEL_55;
      }
      if (prime >= v19) {
        goto LABEL_80;
      }
      unint64_t v44 = vcvtps_u32_f32((float)*(unint64_t *)(v14 + 200) / *(float *)(v14 + 208));
      if (v19 < 3 || (uint8x8_t v45 = (uint8x8_t)vcnt_s8((int8x8_t)v19), v45.i16[0] = vaddlv_u8(v45), v45.u32[0] > 1uLL))
      {
        unint64_t v44 = std::__next_prime(v44);
      }
      else
      {
        uint64_t v46 = 1 << -(char)__clz(v44 - 1);
        if (v44 >= 2) {
          unint64_t v44 = v46;
        }
      }
      if (prime <= v44) {
        size_t prime = v44;
      }
      if (prime >= v19)
      {
        unint64_t v19 = *(void *)(v14 + 184);
      }
      else
      {
        if (prime)
        {
LABEL_55:
          if (prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v33 = operator new(8 * prime);
          uint64_t v34 = *(void **)(v14 + 176);
          *(void *)(v14 + 176) = v33;
          if (v34) {
            operator delete(v34);
          }
          uint64_t v35 = 0;
          *(void *)(v14 + 184) = prime;
          do
            *(void *)(*(void *)(v14 + 176) + 8 * v35++) = 0;
          while (prime != v35);
          uint64_t v36 = (void *)*v16;
          if (!*v16) {
            goto LABEL_79;
          }
          size_t v37 = v36[1];
          size_t v38 = prime - 1;
          if ((prime & (prime - 1)) == 0)
          {
            size_t v39 = v37 & v38;
            *(void *)(*(void *)(v14 + 176) + 8 * v39) = v16;
            for (uint64_t i = (void *)*v36; *v36; uint64_t i = (void *)*v36)
            {
              size_t v41 = i[1] & v38;
              if (v41 == v39)
              {
                uint64_t v36 = i;
              }
              else
              {
                uint64_t v42 = *(void *)(v14 + 176);
                if (*(void *)(v42 + 8 * v41))
                {
                  *uint64_t v36 = *i;
                  uint64_t v43 = 8 * v41;
                  *uint64_t i = **(void **)(*(void *)(v14 + 176) + v43);
                  **(void **)(*(void *)(v14 + 176) + v43) = i;
                }
                else
                {
                  *(void *)(v42 + 8 * v41) = v36;
                  uint64_t v36 = i;
                  size_t v39 = v41;
                }
              }
            }
LABEL_79:
            unint64_t v19 = prime;
            goto LABEL_80;
          }
          if (v37 >= prime) {
            v37 %= prime;
          }
          *(void *)(*(void *)(v14 + 176) + 8 * v37) = v16;
          uint64_t v47 = (void *)*v36;
          if (!*v36) {
            goto LABEL_79;
          }
          while (1)
          {
            size_t v51 = v47[1];
            if (v51 >= prime) {
              v51 %= prime;
            }
            if (v51 != v37)
            {
              uint64_t v52 = *(void *)(v14 + 176);
              if (!*(void *)(v52 + 8 * v51))
              {
                *(void *)(v52 + 8 * v51) = v36;
                goto LABEL_84;
              }
              *uint64_t v36 = *v47;
              uint64_t v50 = 8 * v51;
              *uint64_t v47 = **(void **)(*(void *)(v14 + 176) + v50);
              **(void **)(*(void *)(v14 + 176) + v50) = v47;
              uint64_t v47 = v36;
            }
            size_t v51 = v37;
LABEL_84:
            uint64_t v36 = v47;
            uint64_t v47 = (void *)*v47;
            size_t v37 = v51;
            if (!v47) {
              goto LABEL_79;
            }
          }
        }
        v75 = *(void **)(v14 + 176);
        *(void *)(v14 + 176) = 0;
        if (v75) {
          operator delete(v75);
        }
        unint64_t v19 = 0;
        *(void *)(v14 + 184) = 0;
      }
    }
LABEL_80:
    unint64_t v48 = *((void *)__p + 1);
    uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v19);
    v49.i16[0] = vaddlv_u8(v49);
    if (v49.u32[0] > 1uLL)
    {
      if (v48 >= v19) {
        v48 %= v19;
      }
    }
    else
    {
      v48 &= v19 - 1;
    }
    v53 = *(void **)(*(void *)(v14 + 176) + 8 * v48);
    if (v53)
    {
      *(void *)__p = *v53;
    }
    else
    {
      *(void *)__p = *(void *)(v14 + 192);
      *(void *)(v14 + 192) = __p;
      *(void *)(*(void *)(v14 + 176) + 8 * v48) = v16;
      if (!*(void *)__p)
      {
LABEL_101:
        ++*(void *)(v14 + 200);
        goto LABEL_102;
      }
      unint64_t v54 = *(void *)(*(void *)__p + 8);
      if (v49.u32[0] > 1uLL)
      {
        if (v54 >= v19) {
          v54 %= v19;
        }
      }
      else
      {
        v54 &= v19 - 1;
      }
      v53 = (void *)(*(void *)(v14 + 176) + 8 * v54);
    }
    void *v53 = __p;
    goto LABEL_101;
  }
  uint64_t v24 = *((void *)__p + 3);
  if (v20.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v26 = v23[1];
      if (v26 == v18)
      {
        if (v23[3] == v24) {
          goto LABEL_124;
        }
      }
      else if ((v26 & (v19 - 1)) != v21)
      {
        goto LABEL_43;
      }
      uint64_t v23 = (void *)*v23;
      if (!v23) {
        goto LABEL_43;
      }
    }
  }
  while (1)
  {
    unint64_t v25 = v23[1];
    if (v25 == v18) {
      break;
    }
    if (v25 >= v19) {
      v25 %= v19;
    }
    if (v25 != v21) {
      goto LABEL_43;
    }
LABEL_33:
    uint64_t v23 = (void *)*v23;
    if (!v23) {
      goto LABEL_43;
    }
  }
  if (v23[3] != v24) {
    goto LABEL_33;
  }
LABEL_124:
  uint64_t v65 = (void (***)(void))__p;
  __p = 0;
  if (v65)
  {
    (*v65[2])();
    operator delete(v65);
  }
LABEL_102:

  [*(id *)(*((void *)self + 48) + 840) size];
  uint64_t v55 = *(uint64_t **)(*((void *)self + 48) + 920);
  int8x8_t v56 = (int8x8_t)v55[1];
  if (!*(void *)&v56)
  {
    uint64_t v59 = 0;
    goto LABEL_151;
  }
  uint8x8_t v57 = (uint8x8_t)vcnt_s8(v56);
  v57.i16[0] = vaddlv_u8(v57);
  if (v57.u32[0] > 1uLL)
  {
    uint64_t v58 = 0x1AF456233693CD46;
    if (*(void *)&v56 <= 0x1AF456233693CD46uLL) {
      uint64_t v58 = 0x1AF456233693CD46uLL % *(void *)&v56;
    }
  }
  else
  {
    uint64_t v58 = (*(void *)&v56 - 1) & 0x1AF456233693CD46;
  }
  uint64_t v60 = *v55;
  __int16 v61 = *(void **)(v60 + 8 * v58);
  if (!v61) {
    goto LABEL_128;
  }
  unint64_t v62 = (void *)*v61;
  if (!v62) {
    goto LABEL_128;
  }
  if (v57.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v64 = v62[1];
      if (v64 == 0x1AF456233693CD46)
      {
        if (v62[2] == 0x1AF456233693CD46) {
          goto LABEL_126;
        }
      }
      else if ((v64 & (*(void *)&v56 - 1)) != v58)
      {
        goto LABEL_128;
      }
      unint64_t v62 = (void *)*v62;
      if (!v62) {
        goto LABEL_128;
      }
    }
  }
  while (2)
  {
    unint64_t v63 = v62[1];
    if (v63 != 0x1AF456233693CD46)
    {
      if (v63 >= *(void *)&v56) {
        v63 %= *(void *)&v56;
      }
      if (v63 != v58) {
        goto LABEL_128;
      }
      goto LABEL_113;
    }
    if (v62[2] != 0x1AF456233693CD46)
    {
LABEL_113:
      unint64_t v62 = (void *)*v62;
      if (!v62) {
        goto LABEL_128;
      }
      continue;
    }
    break;
  }
LABEL_126:
  uint64_t v66 = v62[5];
  if (*(void *)(v66 + 8) == 0x1AF456233693CD46)
  {
    uint64_t v59 = *(void *)(v66 + 32);
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v59 = 0;
LABEL_129:
  if (v57.u32[0] > 1uLL)
  {
    uint64_t v67 = 0x63B6FE00C0848868;
    if (*(void *)&v56 <= 0x63B6FE00C0848868uLL) {
      uint64_t v67 = 0x63B6FE00C0848868uLL % *(void *)&v56;
    }
  }
  else
  {
    uint64_t v67 = (*(void *)&v56 - 1) & 0x63B6FE00C0848868;
  }
  objc_super v68 = *(void **)(v60 + 8 * v67);
  if (!v68) {
    goto LABEL_151;
  }
  v69 = (void *)*v68;
  if (!v69) {
    goto LABEL_151;
  }
  if (v57.u32[0] < 2uLL)
  {
    uint64_t v70 = *(void *)&v56 - 1;
    while (1)
    {
      uint64_t v72 = v69[1];
      if (v72 == 0x63B6FE00C0848868)
      {
        if (v69[2] == 0x63B6FE00C0848868) {
          goto LABEL_149;
        }
      }
      else if ((v72 & v70) != v67)
      {
        goto LABEL_151;
      }
      v69 = (void *)*v69;
      if (!v69) {
        goto LABEL_151;
      }
    }
  }
  while (2)
  {
    unint64_t v71 = v69[1];
    if (v71 != 0x63B6FE00C0848868)
    {
      if (v71 >= *(void *)&v56) {
        v71 %= *(void *)&v56;
      }
      if (v71 != v67) {
        goto LABEL_151;
      }
      goto LABEL_138;
    }
    if (v69[2] != 0x63B6FE00C0848868)
    {
LABEL_138:
      v69 = (void *)*v69;
      if (!v69) {
        goto LABEL_151;
      }
      continue;
    }
    break;
  }
LABEL_149:
  uint64_t v73 = v69[5];
  if (*(void *)(v73 + 8) == 0x63B6FE00C0848868)
  {
    uint64_t v74 = *(void *)(v73 + 32);
    goto LABEL_152;
  }
LABEL_151:
  uint64_t v74 = 0;
LABEL_152:
  objc_msgSend(v17, "prepare:cameraContext:anchorContext:", v59, v74, v76, __p, v14 + 192);
  uint64_t v4 = *((void *)self + 48);
LABEL_153:
  objc_msgSend(v76, "setDisplayLayer:", *(void *)(v4 + 840), v76);
}

- (void)setEdgeInsets:(VKEdgeInsets)a3 duration:(double)a4 timingFunction:(id)a5 completionHandler:(id)a6
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  VKEdgeInsets v62 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(VKMapView *)self currentCanvas];
  [v15 edgeInsets];
  unint64_t v60 = __PAIR64__(v17, v16);
  unint64_t v61 = __PAIR64__(v19, v18);

  BOOL v21 = *(void *)&v62.top != v60 || *(void *)&v62.bottom != v61;
  [*((id *)self + 19) stop];
  if (v21)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    uint64_t v22 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219008;
      uint64_t v64 = self;
      __int16 v65 = 2048;
      double v66 = top;
      __int16 v67 = 2048;
      double v68 = bottom;
      __int16 v69 = 2048;
      double v70 = left;
      __int16 v71 = 2048;
      double v72 = right;
      _os_log_impl(&dword_1A1780000, v22, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set edge insets: top: %f, bottom: %f, left: %f, right: %f", buf, 0x34u);
    }
    if (a4 > 0.0 && v13)
    {
      *((VKEdgeInsets *)self + 10) = v62;
      uint64_t v23 = [[VKTimedAnimation alloc] initWithDuration:a4];
      uint64_t v24 = (void *)*((void *)self + 19);
      *((void *)self + 19) = v23;

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke;
      v58[3] = &unk_1E5A8C510;
      id v59 = v13;
      [*((id *)self + 19) setTimingFunction:v58];
      unint64_t v25 = [(VKMapView *)self currentCanvas];
      [v25 edgeInsets];
      int v27 = v26;
      int v29 = v28;
      int v31 = v30;
      int v33 = v32;

      objc_initWeak((id *)buf, self);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_2;
      v51[3] = &unk_1E5A8C230;
      objc_copyWeak(&v52, (id *)buf);
      int v53 = v27;
      int v54 = v29;
      int v55 = v31;
      int v56 = v33;
      VKEdgeInsets v57 = v62;
      [*((id *)self + 19) setStepHandler:v51];
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      uint64_t v47 = __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_3;
      unint64_t v48 = &unk_1E5A98E30;
      objc_copyWeak(&v50, (id *)buf);
      id v49 = v14;
      [*((id *)self + 19) setCompletionHandler:&v45];
      uint64_t v34 = [(VKMapView *)self currentCanvas];
      uint64_t v35 = [v34 cameraController];
      [v35 setEdgeInsetsAnimating:1];

      [(VKMapView *)self runAnimation:*((void *)self + 19)];
      objc_destroyWeak(&v50);
      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)buf);

      goto LABEL_26;
    }
    uint64_t v36 = [(VKMapView *)self currentCanvas];
    *(float *)&double v37 = top;
    *(float *)&double v38 = left;
    *(float *)&double v39 = bottom;
    *(float *)&double v40 = right;
    objc_msgSend(v36, "setEdgeInsets:", v37, v38, v39, v40);

    *(VKEdgeInsets *)(*((void *)self + 48) + 960) = v62;
    uint64_t v41 = *((void *)self + 48);
    uint64_t v42 = *(float **)(v41 + 1064);
    uint64_t v43 = *(std::__shared_weak_count **)(v41 + 1072);
    if (v43)
    {
      atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
      v42[108] = top;
      v42[109] = left;
      v42[110] = bottom;
      v42[111] = right;
      if (atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        if (!v14) {
          goto LABEL_25;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
        if (!v14)
        {
LABEL_25:
          uint64_t v44 = *((void *)self + 48);
          buf[0] = 1;
          md::MapEngine::setNeedsTick(v44, buf);
          goto LABEL_26;
        }
      }
    }
    else
    {
      v42[108] = top;
      v42[109] = left;
      v42[110] = bottom;
      v42[111] = right;
      if (!v14) {
        goto LABEL_25;
      }
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    goto LABEL_25;
  }
  if (v14) {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
LABEL_26:
}

- (void)puckAnimatorDidStop:(id)a3
{
  *(unsigned char *)(*((void *)self + 48) + 1012) = 0;
  [*((id *)self + 33) puckAnimatorDidStop:a3];
}

void __34__VKMapView_didUpdateSceneStatus___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerDidChangeSceneState:*(void *)(a1 + 32) withState:*(void *)(a1 + 40)];
  }
}

void __33__VKMapView_didFinishLoadingData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerDidFinishLoadingTiles:*(void *)(a1 + 32)];
  }
}

void __32__VKMapView_didStartLoadingData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerDidStartLoadingTiles:*(void *)(a1 + 32)];
  }
}

- (void)setMapType:(int)a3 animated:(BOOL)a4
{
  BOOL v123 = a4;
  uint64_t v4 = *(void *)&a3;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  int8x8_t v6 = (char *)self + 32;
  if (*((unsigned char *)self + 32) && *((_DWORD *)self + 9) == a3) {
    return;
  }
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((void *)self + 48) + 4536), "-[VKMapView setMapType:animated:]");
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint8x8_t v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((v4 - 1) > 0xA) {
      uint64_t v8 = @"VKMapTypeStandard";
    }
    else {
      uint64_t v8 = off_1E5A8C3A0[(v4 - 1)];
    }
    int v9 = "NO";
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    if (v123) {
      int v9 = "YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2080;
    uint64_t v153 = (uint64_t)v9;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set map type: %@, animated: %s", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(*((void *)self + 48) + 1128);
  buf[0] = 20;
  md::MapEngineSettings::set(v10, buf, (void *)v4);
  v124 = [(VKMapView *)self currentCanvas];
  uint64_t v11 = [v124 cameraController];
  BOOL v12 = [v11 regionChangeCount] == 0;

  if (!v12)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v13 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v14 = *((_DWORD *)v6 + 1) - 1;
      if (v14 > 0xA) {
        id v15 = @"VKMapTypeStandard";
      }
      else {
        id v15 = off_1E5A8C3A0[v14];
      }
      if ((v4 - 1) > 0xA) {
        unsigned int v16 = @"VKMapTypeStandard";
      }
      else {
        unsigned int v16 = off_1E5A8C3A0[(v4 - 1)];
      }
      unsigned int v17 = [v124 cameraController];
      uint64_t v18 = [v17 regionChangeCount];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v153 = v18;
      _os_log_impl(&dword_1A1780000, v13, OS_LOG_TYPE_INFO, "OldMapType : %@, NewMapType: %@, regionCount number: %lu", buf, 0x20u);
    }
  }
  v126 = v124;
  BOOL v19 = [(VKMapView *)self canShowFlyover];
  BOOL v20 = [(VKMapView *)self isShowingFlyover];
  unsigned int v125 = [(VKMapView *)self mapType];
  int v120 = v20;
  int v121 = v19;
  uint64_t v21 = *((void *)self + 48);
  if (!*(unsigned char *)(v21 + 1241))
  {
    unsigned int v22 = (v125 < 0xB) & (0x418u >> v125);
    if (v4 <= 0xA && ((1 << v4) & 0x418) != 0)
    {
      int v122 = 1;
      if (((v125 < 0xB) & (0x418u >> v125)) != 0)
      {
        unsigned int v22 = 1;
        goto LABEL_60;
      }
    }
    else
    {
      int v122 = 0;
      if (((v125 < 0xB) & (0x418u >> v125)) == 0)
      {
        unsigned int v22 = 0;
        goto LABEL_60;
      }
    }
    uint64_t v23 = *(void *)(v21 + 104);
    memset(buf, 0, sizeof(buf));
    std::mutex::lock((std::mutex *)(v23 + 40));
    uint64_t v24 = *(uint64_t ***)(v23 + 120);
    if (v24)
    {
      unint64_t v25 = 0;
      do
      {
        int v26 = v24[3];
        char v27 = [v26 runsForever];

        if ((v27 & 1) == 0)
        {
          if ((unint64_t)v25 >= *(void *)&buf[16])
          {
            unint64_t v25 = std::vector<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__push_back_slow_path<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>((void **)buf, v24[3]);
          }
          else
          {
            *(void *)unint64_t v25 = &unk_1EF5593D8;
            *((void *)v25 + 1) = 0;
            int v28 = v24[3];
            int v29 = (void *)*((void *)v25 + 1);
            *((void *)v25 + 1) = v28;

            v25 += 24;
          }
          *(void *)&buf[8] = v25;
        }
        uint64_t v24 = (uint64_t **)*v24;
      }
      while (v24);
    }
    else
    {
      unint64_t v25 = 0;
    }
    for (uint64_t i = *(uint64_t ***)(v23 + 160); i; uint64_t i = (uint64_t **)*i)
    {
      uint64_t v41 = i[3];
      char v42 = [v41 runsForever];

      if ((v42 & 1) == 0)
      {
        if ((unint64_t)v25 < *(void *)&buf[16])
        {
          *(void *)unint64_t v25 = &unk_1EF5593D8;
          *((void *)v25 + 1) = 0;
          double v39 = i[3];
          double v40 = (void *)*((void *)v25 + 1);
          *((void *)v25 + 1) = v39;

          v25 += 24;
        }
        else
        {
          unint64_t v25 = std::vector<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__push_back_slow_path<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>((void **)buf, i[3]);
        }
        *(void *)&buf[8] = v25;
      }
    }
    std::mutex::unlock((std::mutex *)(v23 + 40));
    int v31 = *(char **)buf;
    if (*(char **)buf == v25)
    {
      if (!*(void *)buf)
      {
LABEL_58:
        uint64_t v21 = *((void *)self + 48);
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v32 = *(void *)buf;
      do
      {
        id v33 = *(id *)(v32 + 8);
        [v33 stop];

        v32 += 24;
      }
      while ((char *)v32 != v25);
      if (!v31) {
        goto LABEL_58;
      }
      if (v31 != v25)
      {
        uint64_t v34 = v25 - 24;
        uint64_t v35 = v34;
        uint64_t v36 = v34;
        do
        {
          double v37 = *(void (***)(char *))v36;
          v36 -= 24;
          (*v37)(v35);
          v34 -= 24;
          BOOL v38 = v35 == v31;
          uint64_t v35 = v36;
        }
        while (!v38);
        unint64_t v25 = *(char **)buf;
      }
    }
    *(void *)&buf[8] = v31;
    operator delete(v25);
    goto LABEL_58;
  }
  int v122 = 0;
  unsigned int v22 = 0;
LABEL_60:
  id v43 = *(id *)(v21 + 1104);
  [v43 setIsChangingMapType:1];

  if (!*v6) {
    *int8x8_t v6 = 1;
  }
  *((_DWORD *)v6 + 1) = v4;
  uint64_t v44 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v45 = v44[2];
  if (!*(void *)&v45) {
    goto LABEL_82;
  }
  uint8x8_t v46 = (uint8x8_t)vcnt_s8(v45);
  v46.i16[0] = vaddlv_u8(v46);
  if (v46.u32[0] > 1uLL)
  {
    uint64_t v47 = 0x2FED70A4459DFCA1;
    if (*(void *)&v45 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v47 = 0x2FED70A4459DFCA1uLL % *(void *)&v45;
    }
  }
  else
  {
    uint64_t v47 = (*(void *)&v45 - 1) & 0x2FED70A4459DFCA1;
  }
  unint64_t v48 = *(void **)(*(void *)&v44[1] + 8 * v47);
  if (!v48 || (id v49 = (void *)*v48) == 0)
  {
LABEL_82:
    int v53 = 0;
    goto LABEL_83;
  }
  if (v46.u32[0] < 2uLL)
  {
    uint64_t v50 = *(void *)&v45 - 1;
    while (1)
    {
      uint64_t v52 = v49[1];
      if (v52 == 0x2FED70A4459DFCA1)
      {
        if (v49[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_177;
        }
      }
      else if ((v52 & v50) != v47)
      {
        goto LABEL_82;
      }
      id v49 = (void *)*v49;
      if (!v49) {
        goto LABEL_82;
      }
    }
  }
  while (1)
  {
    unint64_t v51 = v49[1];
    if (v51 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v51 >= *(void *)&v45) {
      v51 %= *(void *)&v45;
    }
    if (v51 != v47) {
      goto LABEL_82;
    }
LABEL_72:
    id v49 = (void *)*v49;
    if (!v49) {
      goto LABEL_82;
    }
  }
  if (v49[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_72;
  }
LABEL_177:
  int v53 = (md::StyleLogic *)v49[5];
LABEL_83:
  md::StyleLogic::updateConfiguration(v53, v4);
  uint64_t v54 = *((void *)self + 48);
  uint64_t v55 = *(void *)(v54 + 1120);
  unint64_t v56 = *(void *)(v55 + 16);
  if ((v56 & (v56 - 1)) != 0)
  {
    unint64_t v58 = 0x20A1ED17D78F322BLL;
    if (v56 <= 0x20A1ED17D78F322BLL) {
      unint64_t v58 = 0x20A1ED17D78F322BLL % v56;
    }
    VKEdgeInsets v57 = *(void **)(*(void *)(v55 + 8) + 8 * v58);
    do
    {
      do
        VKEdgeInsets v57 = (void *)*v57;
      while (v57[1] != 0x20A1ED17D78F322BLL);
    }
    while (v57[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    VKEdgeInsets v57 = *(void **)(*(void *)(v55 + 8) + 8 * ((v56 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        VKEdgeInsets v57 = (void *)*v57;
      while (v57[1] != 0x20A1ED17D78F322BLL);
    }
    while (v57[2] != 0x20A1ED17D78F322BLL);
  }
  *(_DWORD *)(v57[5] + 220) = *((_DWORD *)v6 + 1);
  if (v122)
  {
    md::MapEngine::createFlyoverRenderer(v54);
    [(VKMapView *)self _createGlobe];
    if (v22)
    {
      v127 = v126;
    }
    else
    {
      [*((id *)self + 5) setCameraHorizontalOffset:0 duration:0.0 timingFunction:0.0];
      v127 = (std::mutex *)*((id *)self + 6);

      [*((id *)self + 5) edgeInsets];
      objc_msgSend(*((id *)self + 6), "setEdgeInsets:");
      unint64_t v61 = (void *)MEMORY[0x1E4F1C978];
      VKEdgeInsets v62 = [*((id *)self + 5) overlays];
      unint64_t v63 = [v61 arrayWithArray:v62];

      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v64 = v63;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v146 objects:v151 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v147;
        do
        {
          for (uint64_t j = 0; j != v65; ++j)
          {
            if (*(void *)v147 != v66) {
              objc_enumerationMutation(v64);
            }
            uint64_t v68 = *(void *)(*((void *)&v146 + 1) + 8 * j);
            [*((id *)self + 5) removeOverlay:v68];
            [*((id *)self + 6) addOverlay:v68];
          }
          uint64_t v65 = [v64 countByEnumeratingWithState:&v146 objects:v151 count:16];
        }
        while (v65);
      }
    }
    [*((id *)self + 6) setMapType:v4];
    [*((id *)self + 5) setMapType:v4];
    goto LABEL_120;
  }
  if (*(unsigned char *)(v54 + 1241))
  {
    int v59 = 1;
    unint64_t v60 = v126;
    goto LABEL_136;
  }
  int v69 = v22 ^ 1;
  if (*((void *)self + 6)) {
    char v70 = v22 ^ 1;
  }
  else {
    char v70 = 1;
  }
  v127 = v126;
  if ((v70 & 1) == 0)
  {
    v127 = (std::mutex *)*((id *)self + 5);

    [*((id *)self + 6) edgeInsets];
    objc_msgSend(*((id *)self + 5), "setEdgeInsets:");
    __int16 v71 = (void *)MEMORY[0x1E4F1C978];
    double v72 = [*((id *)self + 6) overlays];
    uint64_t v73 = [v71 arrayWithArray:v72];

    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v74 = v73;
    uint64_t v75 = [v74 countByEnumeratingWithState:&v142 objects:v150 count:16];
    if (v75)
    {
      uint64_t v76 = *(void *)v143;
      do
      {
        for (uint64_t k = 0; k != v75; ++k)
        {
          if (*(void *)v143 != v76) {
            objc_enumerationMutation(v74);
          }
          uint64_t v78 = *(void *)(*((void *)&v142 + 1) + 8 * k);
          [*((id *)self + 6) removeOverlay:v78];
          [*((id *)self + 5) addOverlay:v78];
        }
        uint64_t v75 = [v74 countByEnumeratingWithState:&v142 objects:v150 count:16];
      }
      while (v75);
    }

    int v69 = v22 ^ 1;
  }
  [*((id *)self + 5) setMapType:v4 animated:v69 & v123];
  [*((id *)self + 6) setMapType:v4];
LABEL_120:
  if (v127 == v126)
  {
    unint64_t v60 = v126;
    int v59 = 1;
  }
  else
  {
    -[std::mutex transferStateFromCanvas:](v127, "transferStateFromCanvas:");
    [(std::mutex *)v127 didBecomeActive];
    [(VKMapView *)self performStylesheetDidChange];
    [(VKMapView *)self didUpdateVerticalYawTo:0.0];
    v79 = [(std::mutex *)v126 cameraController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v81 = [(std::mutex *)v126 cameraController];
    }
    else
    {
      v81 = 0;
    }
    v82 = [(std::mutex *)v127 cameraController];
    objc_opt_class();
    char v83 = objc_opt_isKindOfClass();

    if (v83)
    {
      v84 = v127;
      v85 = [(std::mutex *)v127 cameraController];
      if (!v81) {
        goto LABEL_130;
      }
LABEL_129:
      [v81 centerCoordinateDistanceRange];
      long long v138 = v140;
      uint64_t v139 = v141;
      [v85 setCenterCoordinateDistanceRange:&v138];
      v86 = [v81 regionRestriction];
      [v85 setRegionRestriction:v86];

      v84 = v127;
    }
    else
    {
      v85 = 0;
      v84 = v127;
      if (v81) {
        goto LABEL_129;
      }
    }
LABEL_130:
    int v87 = [v81 canEnter3DMode];
    uint64_t v88 = [v85 canEnter3DMode];
    if (v87 != v88)
    {
      id v89 = *(id *)(*((void *)self + 48) + 1104);
      char v90 = objc_opt_respondsToSelector();

      v84 = v127;
      if (v90)
      {
        id v91 = *(id *)(*((void *)self + 48) + 1104);
        [v91 mapLayerCanEnter3DModeDidChange:v88];

        v84 = v127;
      }
    }
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __33__VKMapView_setMapType_animated___block_invoke;
    v136[3] = &unk_1E5A99EC0;
    v136[4] = self;
    unint64_t v60 = v84;
    v137 = v60;
    [(VKMapView *)self _postDelegateCallbackBlock:v136];
    [(VKMapView *)self layoutIfNeeded];
    uint64_t v92 = *((void *)self + 48);
    buf[0] = 1;
    md::MapEngine::setNeedsTick(v92, buf);
    [(std::mutex *)v60 updateCameraForFrameResize];
    if (v60 == *((std::mutex **)self + 6)) {
      [(std::mutex *)v60 waitForLoading];
    }
    [(std::mutex *)v126 didBecomeInActive];

    int v59 = 0;
  }
LABEL_136:
  int v93 = [(VKMapView *)self canShowFlyover];
  int v94 = [(VKMapView *)self isShowingFlyover];
  if (v121 != v93)
  {
    v134[0] = MEMORY[0x1E4F143A8];
    v134[1] = 3221225472;
    v134[2] = __33__VKMapView_setMapType_animated___block_invoke_2;
    v134[3] = &unk_1E5A8C1E0;
    v134[4] = self;
    char v135 = v93;
    [(VKMapView *)self _postDelegateCallbackBlock:v134];
  }
  if (v120 != v94)
  {
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __33__VKMapView_setMapType_animated___block_invoke_3;
    v132[3] = &unk_1E5A8C1E0;
    v132[4] = self;
    char v133 = v94;
    [(VKMapView *)self _postDelegateCallbackBlock:v132];
  }
  uint64_t v95 = *((void *)self + 48);
  if (*(unsigned char *)(v95 + 1241))
  {
    if (*((_DWORD *)self + 99) == -1)
    {
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __33__VKMapView_setMapType_animated___block_invoke_5;
      v128[3] = &unk_1E5A8C1E0;
      v128[4] = self;
      char v129 = v93;
      [(VKMapView *)self _postDelegateCallbackBlock:v128];
    }
    else
    {
      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      v130[2] = __33__VKMapView_setMapType_animated___block_invoke_4;
      v130[3] = &unk_1E5A8C1E0;
      v130[4] = self;
      char v131 = v94;
      [(VKMapView *)self _postDelegateCallbackBlock:v130];
    }
    uint64_t v95 = *((void *)self + 48);
  }
  id v96 = *(id *)(v95 + 1104);
  [v96 setIsChangingMapType:0];

  v97 = v60;
  [(VKMapView *)self setNeedsLayout];
  md::MapEngine::updateRunLoopStatus(*((md::MapEngine **)self + 48));
  uint64_t v98 = (uint64_t)[(VKMapView *)self mapDisplayStyle];
  v99 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v100 = *v99;
  uint64_t v101 = v99[1];
  if (v100 != v101)
  {
    while (*(unsigned char *)v100 != 2)
    {
      v100 += 16;
      if (v100 == v101) {
        goto LABEL_151;
      }
    }
  }
  if (v100 == v101) {
LABEL_151:
  }
    uint64_t v102 = 0;
  else {
    uint64_t v102 = *(void *)(v100 + 8);
  }
  BOOL v103 = (v59 & v123) == 1
      && ((v125 < 0xB) & (0x49Eu >> v125)) == ((v4 < 0xB) & (0x49Eu >> v4));
  unint64_t v104 = (unint64_t)(v102 != 0) << 8;
  if (v4 == 8) {
    unint64_t v104 = 512;
  }
  [(VKMapView *)self setMapDisplayStyle:v98 & 0xFFFFFF00FFLL | ((unint64_t)((v4 & 0xFFFFFFFD) != 1) << 40) | v104 animated:v103 duration:0.6];
  if (((v122 | v59) & 1) == 0)
  {
    id v105 = *(id *)(*((void *)self + 48) + 1104);
    char v106 = objc_opt_respondsToSelector();

    if (v106)
    {
      id v107 = *(id *)(*((void *)self + 48) + 1104);
      [v107 mapLayerWillChangeRegionAnimated:0];
    }
    id v108 = *(id *)(*((void *)self + 48) + 1104);
    char v109 = objc_opt_respondsToSelector();

    if (v109)
    {
      id v110 = *(id *)(*((void *)self + 48) + 1104);
      [v110 mapLayerDidChangeVisibleRegion];
    }
    id v111 = *(id *)(*((void *)self + 48) + 1104);
    char v112 = objc_opt_respondsToSelector();

    v97 = v60;
    if (v112)
    {
      id v113 = *(id *)(*((void *)self + 48) + 1104);
      [v113 mapLayerDidChangeRegionAnimated:0];

      v97 = v60;
    }
  }
  if (v4 == 11)
  {
    v114 = [(VKMapView *)self currentCanvas];
    id v115 = *((id *)self + 35);
    [v114 setCameraController:v115];

    v97 = v60;
LABEL_171:
    if (v125 == 9 && v97 == *((std::mutex **)self + 5))
    {
      v116 = [(VKMapView *)self currentCanvas];
      id v117 = [(VKMapView *)self resolveMapCameraController];
      [v116 setCameraController:v117];
      goto LABEL_174;
    }
  }
  else
  {
    if (v125 == 11 && v97 == *((std::mutex **)self + 5))
    {
      v118 = [(VKMapView *)self currentCanvas];
      v119 = [(VKMapView *)self resolveMapCameraController];
      [v118 setCameraController:v119];

      v97 = v60;
      if (v4 != 9) {
        goto LABEL_171;
      }
    }
    else if (v4 != 9)
    {
      goto LABEL_171;
    }
    v116 = [(VKMapView *)self currentCanvas];
    id v117 = *((id *)self + 38);
    [v116 setCameraController:v117];
LABEL_174:

    v97 = v60;
  }
  [(VKMapView *)self _updateBackgroundColor];
}

- (int)mapType
{
  if (*((unsigned char *)self + 32)) {
    return *((_DWORD *)self + 9);
  }
  else {
    return 0;
  }
}

- (void)setEmphasis:(unsigned __int8)a3 animated:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*((unsigned __int8 *)self + 144) == a3) {
    return;
  }
  BOOL v4 = a4;
  int v5 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint8x8_t v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v5 == 2) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = v5 == 1;
    }
    int v25 = 134218242;
    int v26 = self;
    __int16 v27 = 2080;
    int v28 = gss::to_string(v8);
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set emphasis: %s", (uint8_t *)&v25, 0x16u);
  }

  *((unsigned char *)self + 144) = v5;
  float v9 = 0.0;
  if (v4)
  {
    uint64_t v10 = +[VKDebugSettings sharedSettings];
    [v10 transitionTimeMultiplier];
    float v12 = v11;

    float v9 = v12 * 0.6;
  }
  id v13 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v14 = v13[2];
  if (!*(void *)&v14) {
    goto LABEL_31;
  }
  uint8x8_t v15 = (uint8x8_t)vcnt_s8(v14);
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    uint64_t v16 = 0x2FED70A4459DFCA1;
    if (*(void *)&v14 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v16 = 0x2FED70A4459DFCA1uLL % *(void *)&v14;
    }
  }
  else
  {
    uint64_t v16 = (*(void *)&v14 - 1) & 0x2FED70A4459DFCA1;
  }
  unsigned int v17 = *(void **)(*(void *)&v13[1] + 8 * v16);
  if (!v17 || (uint64_t v18 = (void *)*v17) == 0)
  {
LABEL_31:
    uint64_t v22 = 0;
    goto LABEL_32;
  }
  if (v15.u32[0] < 2uLL)
  {
    uint64_t v19 = *(void *)&v14 - 1;
    while (1)
    {
      uint64_t v21 = v18[1];
      if (v21 == 0x2FED70A4459DFCA1)
      {
        if (v18[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_37;
        }
      }
      else if ((v21 & v19) != v16)
      {
        goto LABEL_31;
      }
      uint64_t v18 = (void *)*v18;
      if (!v18) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v20 = v18[1];
    if (v20 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v20 >= *(void *)&v14) {
      v20 %= *(void *)&v14;
    }
    if (v20 != v16) {
      goto LABEL_31;
    }
LABEL_21:
    uint64_t v18 = (void *)*v18;
    if (!v18) {
      goto LABEL_31;
    }
  }
  if (v18[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_21;
  }
LABEL_37:
  uint64_t v22 = v18[5];
LABEL_32:
  if (v5 == 2) {
    int v23 = 2;
  }
  else {
    int v23 = v5 == 1;
  }
  md::StyleLogic::setEmphasis(v22, v23, v9);
  uint64_t v24 = *((void *)self + 48);
  LOBYTE(v25) = 1;
  md::MapEngine::setNeedsTick(v24, &v25);
  [(VKMapView *)self _updateOnlyShowRoadClosures];
  [(VKMapView *)self _updateBackgroundColor];
}

- (void)setMapKitUsage:(unsigned __int8)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*((unsigned __int8 *)self + 211) == a3) {
    return;
  }
  unsigned int v3 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  int v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218242;
    int v25 = self;
    __int16 v26 = 2080;
    __int16 v27 = gss::to_string(v3);
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set mapKitUsage: %s", (uint8_t *)&v24, 0x16u);
  }

  *((unsigned char *)self + 211) = v3;
  int v6 = *((unsigned __int8 *)self + 209);
  BOOL v7 = v3 != 0;
  *((unsigned char *)self + 209) = v7;
  unsigned int v8 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v9 = v8[2];
  if (!*(void *)&v9) {
    goto LABEL_26;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v11 = 0x2FED70A4459DFCA1;
    if (*(void *)&v9 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v11 = 0x2FED70A4459DFCA1uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v11 = (*(void *)&v9 - 1) & 0x2FED70A4459DFCA1;
  }
  float v12 = *(void **)(*(void *)&v8[1] + 8 * v11);
  if (!v12 || (id v13 = (void *)*v12) == 0)
  {
LABEL_26:
    uint64_t v17 = 0;
    goto LABEL_27;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == 0x2FED70A4459DFCA1)
      {
        if (v13[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_40;
        }
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_26;
      }
      id v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v13[1];
    if (v15 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v11) {
      goto LABEL_26;
    }
LABEL_16:
    id v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_26;
    }
  }
  if (v13[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_16;
  }
LABEL_40:
  uint64_t v17 = v13[5];
LABEL_27:
  md::StyleLogic::setUsage(v17, v7, v3);
  BOOL v18 = *((unsigned char *)self + 209) == 0;
  *((unsigned char *)self + 210) = v18;
  uint64_t v19 = *((void *)self + 48);
  uint64_t v20 = *(void *)(v19 + 1120);
  unint64_t v21 = *(void *)(v20 + 16);
  if ((v21 & (v21 - 1)) != 0)
  {
    unint64_t v23 = 0x20A1ED17D78F322BLL;
    if (v21 <= 0x20A1ED17D78F322BLL) {
      unint64_t v23 = 0x20A1ED17D78F322BLL % v21;
    }
    uint64_t v22 = *(void **)(*(void *)(v20 + 8) + 8 * v23);
    do
    {
      do
        uint64_t v22 = (void *)*v22;
      while (v22[1] != 0x20A1ED17D78F322BLL);
    }
    while (v22[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    uint64_t v22 = *(void **)(*(void *)(v20 + 8) + 8 * ((v21 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        uint64_t v22 = (void *)*v22;
      while (v22[1] != 0x20A1ED17D78F322BLL);
    }
    while (v22[2] != 0x20A1ED17D78F322BLL);
  }
  *(unsigned char *)(v22[5] + 224) = v18;
  LOBYTE(v24) = 1;
  md::MapEngine::setNeedsTick(v19, &v24);
  if (v6 != *((unsigned __int8 *)self + 209)) {
    [(VKMapView *)self _updateOnlyShowRoadClosures];
  }
}

- (void)setTrafficEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  int v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = "NO";
    if (v3) {
      int v6 = "YES";
    }
    int v15 = 134218242;
    uint64_t v16 = self;
    __int16 v17 = 2080;
    BOOL v18 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set trafficEnabled: %s", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v15) = 2;
  md::MapEngineSettings::set(v7, &v15, (void *)v3);
  unsigned int v8 = [(VKMapView *)self _labelSettings];
  if (!v3) {
    goto LABEL_14;
  }
  int8x8_t v9 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  if (v10 != v11)
  {
    while (*(unsigned char *)v10 != 3)
    {
      v10 += 16;
      if (v10 == v11) {
        goto LABEL_14;
      }
    }
  }
  if (v10 == v11) {
LABEL_14:
  }
    unsigned int v12 = 0;
  else {
    unsigned int v12 = *(void *)(v10 + 8) != 0;
  }
  md::LabelSettings::setTrafficEnabled(*((md::LabelSettings **)v8 + 3), *((void *)v8 + 5), v12);
  uint64_t v13 = (uint64_t)[(VKMapView *)self mapDisplayStyle];
  if ((v13 & 0xFE00) == 0)
  {
    uint64_t v14 = 256;
    if (!v3) {
      uint64_t v14 = 0;
    }
    [(VKMapView *)self setMapDisplayStyle:v13 & 0xFFFFFFFF00FFLL | v14];
  }
  [(VKMapView *)self _updateOnlyShowRoadClosures];
}

- (void)_updateOnlyShowRoadClosures
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)self + 144) == 2 && !*((unsigned char *)self + 209)) {
    unsigned int BOOL = GEOConfigGetBOOL();
  }
  else {
    unsigned int BOOL = 0;
  }
  BOOL v4 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  if (v5 != v6)
  {
    while (*(unsigned char *)v5 != 4)
    {
      v5 += 16;
      if (v5 == v6) {
        goto LABEL_10;
      }
    }
  }
  if (v5 == v6) {
LABEL_10:
  }
    uint64_t v7 = 0;
  else {
    uint64_t v7 = *(void *)(v5 + 8);
  }
  if (v7 != BOOL)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    unsigned int v8 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v23 = 134218240;
      int v24 = self;
      __int16 v25 = 1024;
      unsigned int v26 = BOOL;
      _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set onlyShowRoadClosures: %i", (uint8_t *)&v23, 0x12u);
    }
    uint64_t v9 = *(void *)(*((void *)self + 48) + 1128);
    LOBYTE(v23) = 4;
    md::MapEngineSettings::set(v9, &v23, (void *)BOOL);
    uint64_t v10 = [(VKMapView *)self _labelSettings];
    if (!BOOL) {
      goto LABEL_24;
    }
    uint64_t v11 = *(uint64_t **)(*((void *)self + 48) + 1128);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    if (v12 != v13)
    {
      while (*(unsigned char *)v12 != 3)
      {
        v12 += 16;
        if (v12 == v13) {
          goto LABEL_24;
        }
      }
    }
    if (v12 == v13) {
LABEL_24:
    }
      unsigned int v14 = 0;
    else {
      unsigned int v14 = *(void *)(v12 + 8) != 0;
    }
    md::LabelSettings::setTrafficClosuresEnabled(*((md::LabelSettings **)v10 + 3), *((void *)v10 + 5), v14);
    uint64_t v15 = *(void *)(*((void *)self + 48) + 896);
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 32);
      uint64_t v17 = *(void *)(v15 + 40);
      uint64_t v18 = v16;
      if (v16 != v17)
      {
        uint64_t v18 = v16;
        while (*(_WORD *)v18 != 52)
        {
          v18 += 16;
          if (v18 == v17) {
            goto LABEL_34;
          }
        }
      }
      if (v18 != v17)
      {
        uint64_t v19 = *(void *)(v18 + 8);
        if (v19) {
          *(unsigned char *)(v19 + 785) = BOOL;
        }
      }
LABEL_34:
      if (v16 != v17)
      {
        uint64_t v20 = v16;
        while (*(_WORD *)v20 != 53)
        {
          v20 += 16;
          if (v20 == v17) {
            goto LABEL_44;
          }
        }
        if (v20 != v17)
        {
          uint64_t v21 = *(void *)(v20 + 8);
          if (v21) {
            *(unsigned char *)(v21 + 785) = BOOL;
          }
        }
LABEL_44:
        while (v16 != v17)
        {
          if (*(_WORD *)v16 == 2)
          {
            if (v16 != v17)
            {
              uint64_t v22 = *(void *)(v16 + 8);
              if (v22) {
                *(unsigned char *)(v22 + 802) = BOOL;
              }
            }
            return;
          }
          v16 += 16;
        }
      }
    }
  }
}

- (void)setMapDisplayStyle:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  uint64_t v6 = a4;
  unint64_t v7 = *(void *)&a3.var0;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int var3 = a3.var3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  unint64_t v11 = 0x1E9546000;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if ((_BYTE)v7) {
      uint64_t v12 = @"Night";
    }
    else {
      uint64_t v12 = @"Day";
    }
    uint64_t v24 = [(__CFString *)v12 UTF8String];
    unsigned int v26 = v6;
    uint64_t v13 = @"None";
    if (BYTE1(v7) == 1) {
      uint64_t v13 = @"Traffic";
    }
    if (BYTE1(v7) == 2) {
      unsigned int v14 = @"Transit";
    }
    else {
      unsigned int v14 = v13;
    }
    uint64_t v15 = [(__CFString *)v14 UTF8String];
    uint64_t v16 = &stru_1EF593218;
    if (BYTE2(v7) <= 9u) {
      uint64_t v16 = off_1E5A8C3F8[SBYTE2(v7)];
    }
    uint64_t v17 = [(__CFString *)v16 UTF8String];
    uint64_t v18 = @"Route Creation";
    if (var3 != 1) {
      uint64_t v18 = &stru_1EF593218;
    }
    if (var3) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = @"Default";
    }
    uint64_t v20 = [(__CFString *)v19 UTF8String];
    if (BYTE4(v7) > 4u) {
      uint64_t v21 = &stru_1EF593218;
    }
    else {
      uint64_t v21 = off_1E5A8C448[SBYTE4(v7)];
    }
    uint64_t v22 = [(__CFString *)v21 UTF8String];
    int v23 = *((unsigned __int8 *)self + 598);
    *(_DWORD *)buf = 134220290;
    uint64_t v28 = self;
    __int16 v29 = 2080;
    uint64_t v30 = v25;
    __int16 v31 = 2080;
    uint64_t v32 = v15;
    __int16 v33 = 2080;
    uint64_t v34 = v17;
    __int16 v35 = 2080;
    uint64_t v36 = v20;
    unint64_t v11 = 0x1E9546000uLL;
    __int16 v37 = 2080;
    uint64_t v38 = v22;
    __int16 v39 = 1024;
    int v40 = (v7 >> 40) & 1;
    __int16 v41 = 1024;
    uint64_t v6 = v26;
    unsigned int v42 = v26;
    __int16 v43 = 2048;
    double v44 = a5;
    __int16 v45 = 1024;
    int v46 = v23;
    _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] SetDisplayStyle (timePeriod:%s overlayType:%s applicationState:%s applicationSubState:%s searchResultsType:%s mapHasLabels:%d) animated:%d duration:%f _displayOverrideEnabled:%d", buf, 0x5Au);
  }

  *((_WORD *)self + 296) = v7;
  *((unsigned char *)self + 594) = BYTE2(v7);
  *((unsigned char *)self + 595) = var3;
  *((unsigned char *)self + 596) = BYTE4(v7);
  *((unsigned char *)self + 597) = BYTE5(v7);
  if (!*((unsigned char *)self + *(int *)(v11 + 1248))) {
    [(VKMapView *)self _applyMapDisplayStyle:v7 & 0xFFFFFFFFFFFFLL animated:v6 duration:a5];
  }
}

- (void)_applyMapDisplayStyle:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  uint64_t v6 = *(void *)&a3.var0;
  unint64_t v7 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v8 = v7[2];
  BOOL v42 = a4;
  if (!*(void *)&v8) {
    goto LABEL_21;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    uint64_t v10 = 0x2FED70A4459DFCA1;
    if (*(void *)&v8 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v10 = 0x2FED70A4459DFCA1uLL % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v10 = (*(void *)&v8 - 1) & 0x2FED70A4459DFCA1;
  }
  unint64_t v11 = *(void **)(*(void *)&v7[1] + 8 * v10);
  if (!v11 || (uint64_t v12 = (void *)*v11) == 0)
  {
LABEL_21:
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  if (v9.u32[0] < 2uLL)
  {
    uint64_t v13 = *(void *)&v8 - 1;
    while (1)
    {
      uint64_t v15 = v12[1];
      if (v15 == 0x2FED70A4459DFCA1)
      {
        if (v12[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_79;
        }
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_21;
      }
      uint64_t v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v12[1];
    if (v14 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_21;
    }
  }
  if (v12[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_79:
  uint64_t v16 = v12[5];
LABEL_22:
  if ((a3.var2 - 1) > 8u) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = qword_1A29C3060[(a3.var2 - 1)];
  }
  double v44 = +[VKDebugSettings sharedSettings];
  [v44 transitionTimeMultiplier];
  float v19 = v18;
  if (*(_DWORD *)(v16 + 1096) == 8)
  {
    unsigned int v20 = 2;
  }
  else
  {
    uint64_t v21 = *(uint64_t **)(v16 + 184);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    if (v22 != v23)
    {
      while (*(unsigned char *)v22 != 2)
      {
        v22 += 16;
        if (v22 == v23) {
          goto LABEL_33;
        }
      }
    }
    if (v22 == v23) {
LABEL_33:
    }
      uint64_t v24 = 0;
    else {
      uint64_t v24 = *(void *)(v22 + 8);
    }
    unsigned int v20 = v24 != 0;
  }
  uint64_t v46 = *(unsigned __int8 *)(v16 + 164);
  uint64_t v45 = *(unsigned __int8 *)(v16 + 166);
  unint64_t v25 = gss::ClientStyleState<gss::PropertyID>::targetMapDisplayStyle(*(void *)(v16 + 208));
  uint64_t v26 = v6 & 0xFFFFFF00FFFFLL | v17;
  int v27 = (v6 | v17);
  if (v27 != v25
    || v20 != BYTE1(v25)
    || BYTE2(v17) != BYTE2(v25)
    || (unint64_t)(v6 & 0xFF00FFFF | v17) >> 24 != BYTE3(v25)
    || BYTE4(v26) != BYTE4(v25)
    || BYTE5(v26) != BYTE5(v25)
    || v46 != BYTE6(v25)
    || v45 != HIBYTE(v25))
  {
    goto LABEL_59;
  }
  if (*(void *)(v16 + 272))
  {
    uint64_t v28 = *(void *)(v16 + 224);
    unint64_t v50 = v28 + 16;
    __int16 v29 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v28 + 16));
    if (v29) {
      geo::read_write_lock::logFailure(v29, (uint64_t)"read lock", v30);
    }
    geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::intern_linear_map(&v47, (uint64_t *)(v28 + 232));
    __int16 v31 = (geo::read_write_lock *)pthread_rwlock_unlock((pthread_rwlock_t *)(v28 + 16));
    if (v31) {
      geo::read_write_lock::logFailure(v31, (uint64_t)"unlock", v32);
    }
    __int16 v33 = (gss::Allocator *)gss::DisplayStyle::DisplayStyle((uint64_t)&v50, (uint64_t)&v47);
    if (!v49 && v47)
    {
      uint64_t v34 = gss::Allocator::instance(v33);
      (*(void (**)(uint64_t, uint64_t, void))(*(void *)v34 + 40))(v34, v47, v48);
    }
    if (v27 != v50
      || v20 != BYTE1(v50)
      || BYTE2(v17) != BYTE2(v50)
      || (unint64_t)(v6 & 0xFF00FFFF | v17) >> 24 != BYTE3(v50)
      || BYTE4(v26) != BYTE4(v50)
      || BYTE5(v26) != BYTE5(v50)
      || v46 != BYTE6(v50)
      || v45 != HIBYTE(v50))
    {
LABEL_59:
      *(unsigned char *)(v16 + 176) = BYTE2(v17);
      __int16 v35 = *(void **)(v16 + 1184);
      if (v35) {
        [v35 stop];
      }
      unint64_t v36 = v6 & 0xFFFFFF0000FFLL | v17 & 0xFFFFFFFF00FFLL | ((unint64_t)v20 << 8) | (v45 << 56) | (v46 << 48);
      gss::ClientStyleState<gss::PropertyID>::setTargetMapDisplayStyle(*(void *)(v16 + 208), v36);
      gss::ClientStyleState<gss::ScenePropertyID>::setTargetMapDisplayStyle(*(void *)(v16 + 224), v36);
      float v37 = v19 * a5;
      *(void *)(v16 + 328) = v36;
      *(unsigned char *)(v16 + 336) = v42;
      if (!v42) {
        float v37 = 0.0;
      }
      if (*(unsigned char *)(v16 + 1116))
      {
        *(float *)(v16 + 1120) = fmaxf(*(float *)(v16 + 1120), v37);
      }
      else
      {
        *(unsigned char *)(v16 + 1116) = 1;
        *(float *)(v16 + 1120) = v37;
        LOBYTE(v47) = 4;
        uint64_t v38 = *(char **)(v16 + 1128);
        __int16 v39 = *(char **)(v16 + 1136);
        if (v38 != v39)
        {
          while (*v38 <= 3u)
          {
            if (++v38 == v39) {
              goto LABEL_71;
            }
          }
        }
        if (v38 == v39 || (__int16 v39 = v38, *v38 != 4)) {
LABEL_71:
        }
          std::vector<md::StyleManagerEvent>::insert(v16 + 1128, v39, (char *)&v47);
        uint64_t v40 = **(void **)(v16 + 1240);
        if (v40)
        {
          LOBYTE(v47) = 12;
          md::MapEngine::setNeedsTick(v40, &v47);
        }
      }
    }
  }

  uint64_t v41 = **(void **)(*((void *)self + 48) + 120);
  if (v41)
  {
    LOBYTE(v47) = 1;
    md::MapEngine::setNeedsTick(v41, &v47);
  }
  [(VKMapView *)self _updateBackgroundColor];
}

- (void)setMapDisplayStyle:(id)a3
{
}

- (BOOL)canShowFlyover
{
  BOOL v3 = [(VKMapView *)self currentCanvas];
  if (v3 == *((void **)self + 6))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(VKMapView *)self currentCanvas];
      uint64_t v6 = [v5 cameraController];
    }
    else
    {
      uint64_t v6 = 0;
    }
    if ([*((id *)self + 6) flyoverAvailable]) {
      char v4 = [v6 canEnter3DMode];
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isShowingFlyover
{
  BOOL v3 = [(VKMapView *)self currentCanvas];
  char v4 = v3;
  if (v3 == *((void **)self + 6) && [v3 flyoverAvailable])
  {
    uint64_t v5 = [*((id *)self + 6) cameraController];
    char v6 = [v5 isPitched];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setRouteLineSplitAnnotation:(id)a3
{
  id v5 = a3;
  char v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (v6)
  {
    int8x8_t v7 = v6[2];
    if (v7)
    {
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        uint64_t v9 = 0x5CBBA028798243FLL;
        if (*(void *)&v7 <= 0x5CBBA028798243FuLL) {
          uint64_t v9 = 0x5CBBA028798243FuLL % *(void *)&v7;
        }
      }
      else
      {
        uint64_t v9 = (*(void *)&v7 - 1) & 0x5CBBA028798243FLL;
      }
      uint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
      if (v10)
      {
        unint64_t v11 = (void *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            uint64_t v12 = *(void *)&v7 - 1;
            while (1)
            {
              uint64_t v14 = v11[1];
              if (v14 == 0x5CBBA028798243FLL)
              {
                if (v11[2] == 0x5CBBA028798243FLL) {
                  goto LABEL_23;
                }
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_25;
              }
              unint64_t v11 = (void *)*v11;
              if (!v11) {
                goto LABEL_25;
              }
            }
          }
          do
          {
            unint64_t v13 = v11[1];
            if (v13 == 0x5CBBA028798243FLL)
            {
              if (v11[2] == 0x5CBBA028798243FLL)
              {
LABEL_23:
                uint64_t v15 = v11[5];
                if (v15)
                {
                  id v16 = v5;
                  objc_storeStrong((id *)(v15 + 176), a3);
                  id v5 = v16;
                }
                break;
              }
            }
            else
            {
              if (v13 >= *(void *)&v7) {
                v13 %= *(void *)&v7;
              }
              if (v13 != v9) {
                break;
              }
            }
            unint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
      }
    }
  }
LABEL_25:
}

- (void)setCameraDelegate:(id)a3
{
  id v5 = a3;
  id v4 = *(id *)(*((void *)self + 48) + 1104);
  [v4 setCameraDelegate:v5];
}

- (void)setMapKitClientMode:(unsigned __int8)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*((unsigned __int8 *)self + 212) != a3)
  {
    int v3 = a3;
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v17 = 134218242;
      float v18 = self;
      __int16 v19 = 2080;
      unsigned int v20 = gss::to_string(v3);
      _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set mapKitClientMode: %s", (uint8_t *)&v17, 0x16u);
    }

    *((unsigned char *)self + 212) = v3;
    char v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
    int8x8_t v7 = v6[2];
    if (v7)
    {
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        uint64_t v9 = 0x2FED70A4459DFCA1;
        if (*(void *)&v7 <= 0x2FED70A4459DFCA1uLL) {
          uint64_t v9 = 0x2FED70A4459DFCA1uLL % *(void *)&v7;
        }
      }
      else
      {
        uint64_t v9 = (*(void *)&v7 - 1) & 0x2FED70A4459DFCA1;
      }
      uint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
      if (v10)
      {
        unint64_t v11 = (void *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            uint64_t v12 = *(void *)&v7 - 1;
            while (1)
            {
              uint64_t v14 = v11[1];
              if (v14 == 0x2FED70A4459DFCA1)
              {
                if (v11[2] == 0x2FED70A4459DFCA1) {
                  goto LABEL_30;
                }
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_26;
              }
              unint64_t v11 = (void *)*v11;
              if (!v11) {
                goto LABEL_26;
              }
            }
          }
          do
          {
            unint64_t v13 = v11[1];
            if (v13 == 0x2FED70A4459DFCA1)
            {
              if (v11[2] == 0x2FED70A4459DFCA1)
              {
LABEL_30:
                uint64_t v15 = v11[5];
                goto LABEL_27;
              }
            }
            else
            {
              if (v13 >= *(void *)&v7) {
                v13 %= *(void *)&v7;
              }
              if (v13 != v9) {
                break;
              }
            }
            unint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
      }
    }
LABEL_26:
    uint64_t v15 = 0;
LABEL_27:
    md::StyleLogic::setMapKitClientMode(v15, v3);
    if (*((unsigned char *)self + 211))
    {
      uint64_t v16 = *((void *)self + 48);
      LOBYTE(v17) = 1;
      md::MapEngine::setNeedsTick(v16, &v17);
    }
  }
}

- (void)setLabelEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint8x8_t v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v10 = 134219008;
    unint64_t v11 = self;
    __int16 v12 = 2048;
    double v13 = top;
    __int16 v14 = 2048;
    double v15 = bottom;
    __int16 v16 = 2048;
    double v17 = left;
    __int16 v18 = 2048;
    double v19 = right;
    _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label edge insets: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v10, 0x34u);
  }
  uint64_t v9 = (float *)*((void *)self + 48);
  v9[232] = top;
  v9[233] = left;
  v9[234] = bottom;
  v9[235] = right;
  LOBYTE(v10) = 1;
  md::MapEngine::setNeedsTick((uint64_t)v9, &v10);
}

- (BOOL)isFullyDrawn
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1136);
  if (*(unsigned char *)(v2 + 88)) {
    int v3 = *(unsigned __int8 *)(v2 + 89);
  }
  else {
    int v3 = 0;
  }
  return v3 == 4 || (v3 & 0xFE) == 2;
}

- (void)updateLightingLogic
{
  int v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v4 = [v3 thermalState];

  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  char v6 = [v5 isLowPowerModeEnabled];

  uint64_t v7 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v8 = *(void *)(v7 + 16);
  if ((v8 & (v8 - 1)) != 0)
  {
    unint64_t v10 = 0x91E65CD7F1A7A7FALL;
    if (v8 <= 0x91E65CD7F1A7A7FALL) {
      unint64_t v10 = 0x91E65CD7F1A7A7FALL % v8;
    }
    uint64_t v9 = *(void **)(*(void *)(v7 + 8) + 8 * v10);
    do
    {
      do
        uint64_t v9 = (void *)*v9;
      while (v9[1] != 0x91E65CD7F1A7A7FALL);
    }
    while (v9[2] != 0x91E65CD7F1A7A7FALL);
  }
  else
  {
    uint64_t v9 = *(void **)(*(void *)(v7 + 8) + 8 * ((v8 - 1) & 0x91E65CD7F1A7A7FALL));
    do
    {
      do
        uint64_t v9 = (void *)*v9;
      while (v9[1] != 0x91E65CD7F1A7A7FALL);
    }
    while (v9[2] != 0x91E65CD7F1A7A7FALL);
  }
  uint64_t v11 = v9[5];
  char v12 = v6 ^ 1;
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    char v12 = 0;
  }
  *(unsigned char *)(v11 + 139) = v12;
}

- (void)_closeLoaderConnection:(BOOL)a3
{
  if (*((unsigned char *)self + 128))
  {
    BOOL v3 = a3;
    *((unsigned char *)self + 128) = 0;
    id v5 = [MEMORY[0x1E4F64AC8] modernLoader];
    [v5 closeForClient:*((void *)self + 17)];

    id v6 = [MEMORY[0x1E4F64918] modernManager];
    [v6 closeServerConnection:v3];
  }
}

- (void)setPointsOfInterestFilter:(id)a3
{
  id v5 = a3;
  id v6 = (id)*((void *)self + 51);
  if (v6 == v5) {
    goto LABEL_45;
  }
  objc_storeStrong((id *)self + 51, a3);
  uint64_t v7 = *((void *)self + 51);
  if (v7)
  {
    unint64_t v8 = (std::__shared_weak_count *)operator new(0x30uLL);
    v8->__shared_owners_ = 0;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF580C98;
    id v9 = v5;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5598D8;
    v8[1].__shared_owners_ = (uint64_t)v9;
    uint64_t v26 = v8 + 1;
    int v27 = v8;
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v26 = 0;
    int v27 = 0;
  }
  md::LabelSettings_Presentation::setPointsOfInterestFilter((uint64_t)[(VKMapView *)self _labelSettings], (uint64_t *)&v26);
  if ((v6 == 0) != (v7 != 0)) {
    goto LABEL_42;
  }
  unint64_t v10 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v11 = v10[2];
  if (!*(void *)&v11) {
    goto LABEL_26;
  }
  uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    uint64_t v13 = 0x2FED70A4459DFCA1;
    if (*(void *)&v11 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v13 = 0x2FED70A4459DFCA1uLL % *(void *)&v11;
    }
  }
  else
  {
    uint64_t v13 = (*(void *)&v11 - 1) & 0x2FED70A4459DFCA1;
  }
  __int16 v14 = *(void **)(*(void *)&v10[1] + 8 * v13);
  if (!v14 || (double v15 = (void *)*v14) == 0)
  {
LABEL_26:
    uint64_t v19 = 0;
    goto LABEL_27;
  }
  if (v12.u32[0] < 2uLL)
  {
    uint64_t v16 = *(void *)&v11 - 1;
    while (1)
    {
      uint64_t v18 = v15[1];
      if (v18 == 0x2FED70A4459DFCA1)
      {
        if (v15[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_46;
        }
      }
      else if ((v18 & v16) != v13)
      {
        goto LABEL_26;
      }
      double v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v17 = v15[1];
    if (v17 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v17 >= *(void *)&v11) {
      v17 %= *(void *)&v11;
    }
    if (v17 != v13) {
      goto LABEL_26;
    }
LABEL_16:
    double v15 = (void *)*v15;
    if (!v15) {
      goto LABEL_26;
    }
  }
  if (v15[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_16;
  }
LABEL_46:
  uint64_t v19 = v15[5];
LABEL_27:
  int v20 = v7 != 0;
  if (*(unsigned __int8 *)(v19 + 165) != v20)
  {
    uint64_t v21 = *(void **)(v19 + 1184);
    if (v21) {
      [v21 stop];
    }
    *(unsigned char *)(v19 + 165) = v20;
    gss::ClientStyleState<gss::PropertyID>::setTargetClientStyleAttribute(*(void *)(v19 + 208), 0x10073u, v7 != 0);
    gss::ClientStyleState<gss::ScenePropertyID>::setTargetClientStyleAttribute(*(void *)(v19 + 224), 0x10073u, *(unsigned __int8 *)(v19 + 165));
    if (*(unsigned char *)(v19 + 1116))
    {
      *(float *)(v19 + 1120) = fmaxf(*(float *)(v19 + 1120), 0.0);
    }
    else
    {
      *(unsigned char *)(v19 + 1116) = 1;
      *(_DWORD *)(v19 + 1120) = 0;
      char v28 = 4;
      uint64_t v22 = *(char **)(v19 + 1128);
      uint64_t v23 = *(char **)(v19 + 1136);
      if (v22 != v23)
      {
        while (*v22 <= 3u)
        {
          if (++v22 == v23) {
            goto LABEL_38;
          }
        }
      }
      if (v22 == v23 || (uint64_t v23 = v22, *v22 != 4)) {
LABEL_38:
      }
        std::vector<md::StyleManagerEvent>::insert(v19 + 1128, v23, &v28);
      uint64_t v24 = **(void **)(v19 + 1240);
      if (v24)
      {
        char v28 = 12;
        md::MapEngine::setNeedsTick(v24, &v28);
      }
    }
  }
  uint64_t v25 = *((void *)self + 48);
  char v28 = 1;
  md::MapEngine::setNeedsTick(v25, &v28);
  unint64_t v8 = v27;
LABEL_42:
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_45:
}

- (void)setDesiredMapMode:(int64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v5 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 + 1) > 5) {
      id v6 = &stru_1EF593218;
    }
    else {
      id v6 = off_1E5A8C340[a3 + 1];
    }
    *(_DWORD *)buf = 134218242;
    __int16 v33 = self;
    __int16 v34 = 2112;
    __int16 v35 = v6;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set desired map mode: %@", buf, 0x16u);
  }
  unint64_t v8 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (v8)
  {
    int8x8_t v9 = v8[2];
    if (v9)
    {
      uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
      v10.i16[0] = vaddlv_u8(v10);
      if (v10.u32[0] > 1uLL)
      {
        uint64_t v11 = 0x2FED70A4459DFCA1;
        if (*(void *)&v9 <= 0x2FED70A4459DFCA1uLL) {
          uint64_t v11 = 0x2FED70A4459DFCA1uLL % *(void *)&v9;
        }
      }
      else
      {
        uint64_t v11 = (*(void *)&v9 - 1) & 0x2FED70A4459DFCA1;
      }
      uint8x8_t v12 = *(void **)(*(void *)&v8[1] + 8 * v11);
      if (v12)
      {
        uint64_t v13 = (void *)*v12;
        if (v13)
        {
          if (v10.u32[0] < 2uLL)
          {
            uint64_t v14 = *(void *)&v9 - 1;
            while (1)
            {
              uint64_t v16 = v13[1];
              if (v16 == 0x2FED70A4459DFCA1)
              {
                if (v13[2] == 0x2FED70A4459DFCA1) {
                  goto LABEL_30;
                }
              }
              else if ((v16 & v14) != v11)
              {
                goto LABEL_45;
              }
              uint64_t v13 = (void *)*v13;
              if (!v13) {
                goto LABEL_45;
              }
            }
          }
          do
          {
            unint64_t v15 = v13[1];
            if (v15 == 0x2FED70A4459DFCA1)
            {
              if (v13[2] == 0x2FED70A4459DFCA1)
              {
LABEL_30:
                uint64_t v17 = v13[5];
                if (v17)
                {
                  int v18 = 3;
                  switch(a3)
                  {
                    case 1:
                      goto LABEL_39;
                    case 2:
                      int v18 = 5;
                      goto LABEL_39;
                    case 3:
                      int v22 = *(unsigned __int8 *)(v17 + 167);
                      BOOL v20 = v22 != 6;
                      if (!*(unsigned char *)(v17 + 167))
                      {
                        int v21 = 6;
                        goto LABEL_44;
                      }
                      BOOL v23 = v22 != 6;
                      md::StyleLogic::setMapMode(v13[5], 6, 0.0);
                      if (v23) {
                        goto LABEL_45;
                      }
                      return;
                    case 4:
                      int v18 = 7;
LABEL_39:
                      BOOL v24 = v18 == *(unsigned __int8 *)(v17 + 167);
                      md::StyleLogic::setMapMode(v13[5], v18, 0.0);
                      if (v24) {
                        return;
                      }
                      goto LABEL_45;
                    default:
                      int v19 = *(unsigned __int8 *)(v17 + 167);
                      BOOL v20 = *(unsigned char *)(v17 + 167) != 0;
                      if (v19 != 6)
                      {
                        BOOL v25 = v19 != 0;
                        md::StyleLogic::setMapMode(v13[5], 0, 0.0);
                        if (v25) {
                          goto LABEL_45;
                        }
                        return;
                      }
                      int v21 = 0;
LABEL_44:
                      uint64_t v26 = +[VKDebugSettings sharedSettings];
                      [v26 transitionTimeMultiplier];
                      float v28 = v27;

                      float v29 = v28 * 0.6;
                      md::StyleLogic::setMapMode(v17, v21, v29);
                      if (!v20) {
                        return;
                      }
                      break;
                  }
                }
                break;
              }
            }
            else
            {
              if (v15 >= *(void *)&v9) {
                v15 %= *(void *)&v9;
              }
              if (v15 != v11) {
                break;
              }
            }
            uint64_t v13 = (void *)*v13;
          }
          while (v13);
        }
      }
    }
  }
LABEL_45:
  [(VKMapView *)self setLoadMuninMetadata:a3 == 3];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __31__VKMapView_setDesiredMapMode___block_invoke;
  v31[3] = &unk_1E5A8C190;
  v31[4] = self;
  v31[5] = a3;
  [(VKMapView *)self _postDelegateCallbackBlock:v31];
  uint64_t v30 = *((void *)self + 48);
  buf[0] = 1;
  md::MapEngine::setNeedsTick(v30, buf);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    id v6 = "NO";
    if (v3) {
      id v6 = "YES";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = self;
    __int16 v18 = 2080;
    int v19 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set hidden: %s", buf, 0x16u);
    if (v3)
    {
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
        dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
      }
LABEL_10:
      uint64_t v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
      unint64_t v8 = v7;
      os_signpost_id_t v9 = *(void *)(*((void *)self + 48) + 1216);
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        uint8x8_t v10 = v8;
        os_signpost_type_t v11 = OS_SIGNPOST_INTERVAL_END;
LABEL_18:
        _os_signpost_emit_with_name_impl(&dword_1A1780000, v10, v11, v9, "Visible", "", buf, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
  }
  else if (v3)
  {
    goto LABEL_10;
  }
  uint8x8_t v12 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  unint64_t v8 = v12;
  os_signpost_id_t v9 = *(void *)(*((void *)self + 48) + 1216);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    uint8x8_t v10 = v8;
    os_signpost_type_t v11 = OS_SIGNPOST_INTERVAL_BEGIN;
    goto LABEL_18;
  }
LABEL_19:

  v15.receiver = self;
  v15.super_class = (Class)VKMapView;
  [(VKMapView *)&v15 setHidden:v3];
  uint64_t v13 = (void *)*((void *)self + 6);
  if (v13) {
    [v13 stopLoading];
  }
  uint64_t v14 = (md::MapEngine *)*((void *)self + 48);
  if (v14)
  {
    *((unsigned char *)v14 + 1176) = v3;
    md::MapEngine::updateRunLoopStatus(v14);
  }
}

void __33__VKMapView_setMapType_animated___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) canShowFlyoverDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)setApplicationState:(unsigned __int8)a3 displayedSearchResultsType:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v7 = *((unsigned __int8 *)self + 192);
  if (v7 == a3) {
    goto LABEL_49;
  }
  *((unsigned char *)self + 192) = a3;
  unint64_t v8 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (!v8) {
    goto LABEL_49;
  }
  int8x8_t v9 = v8[2];
  if (!*(void *)&v9) {
    goto LABEL_49;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v11 = 0x5CBBA028798243FLL;
    if (*(void *)&v9 <= 0x5CBBA028798243FuLL) {
      uint64_t v11 = 0x5CBBA028798243FuLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v11 = (*(void *)&v9 - 1) & 0x5CBBA028798243FLL;
  }
  int8x8_t v12 = v8[1];
  uint64_t v13 = *(void **)(*(void *)&v12 + 8 * v11);
  if (v13)
  {
    uint64_t v14 = (void *)*v13;
    if (v14)
    {
      if (v10.u32[0] < 2uLL)
      {
        while (1)
        {
          uint64_t v16 = v14[1];
          if (v16 == 0x5CBBA028798243FLL)
          {
            if (v14[2] == 0x5CBBA028798243FLL) {
              goto LABEL_24;
            }
          }
          else if ((v16 & (*(void *)&v9 - 1)) != v11)
          {
            goto LABEL_26;
          }
          uint64_t v14 = (void *)*v14;
          if (!v14) {
            goto LABEL_26;
          }
        }
      }
      do
      {
        unint64_t v15 = v14[1];
        if (v15 == 0x5CBBA028798243FLL)
        {
          if (v14[2] == 0x5CBBA028798243FLL)
          {
LABEL_24:
            uint64_t v17 = v14[5];
            if (v17) {
              *(unsigned char *)(v17 + 192) = a3;
            }
            break;
          }
        }
        else
        {
          if (v15 >= *(void *)&v9) {
            v15 %= *(void *)&v9;
          }
          if (v15 != v11) {
            break;
          }
        }
        uint64_t v14 = (void *)*v14;
      }
      while (v14);
    }
  }
LABEL_26:
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v18 = 0xBEC1A12372CEEC00;
    if (*(void *)&v9 <= 0xBEC1A12372CEEC00) {
      unint64_t v18 = 0xBEC1A12372CEEC00 % *(void *)&v9;
    }
  }
  else
  {
    unint64_t v18 = (*(void *)&v9 - 1) & 0xBEC1A12372CEEC00;
  }
  int v19 = *(void **)(*(void *)&v12 + 8 * v18);
  if (v19)
  {
    uint64_t v20 = (void *)*v19;
    if (v20)
    {
      if (v10.u32[0] < 2uLL)
      {
        uint64_t v21 = *(void *)&v9 - 1;
        while (1)
        {
          uint64_t v23 = v20[1];
          if (v23 == 0xBEC1A12372CEEC00)
          {
            if (v20[2] == 0xBEC1A12372CEEC00) {
              goto LABEL_46;
            }
          }
          else if ((v23 & v21) != v18)
          {
            goto LABEL_49;
          }
          uint64_t v20 = (void *)*v20;
          if (!v20) {
            goto LABEL_49;
          }
        }
      }
      do
      {
        unint64_t v22 = v20[1];
        if (v22 == 0xBEC1A12372CEEC00)
        {
          if (v20[2] == 0xBEC1A12372CEEC00)
          {
LABEL_46:
            BOOL v24 = (md::NavigationLogic *)v20[5];
            if (v24)
            {
              int v25 = *((unsigned __int8 *)self + 192);
              if (*((unsigned __int8 *)v24 + 225) != v25)
              {
                *((unsigned char *)v24 + 225) = v25;
                md::NavigationLogic::_updatePolygonSelection(v24);
              }
            }
            break;
          }
        }
        else
        {
          if (v22 >= *(void *)&v9) {
            v22 %= *(void *)&v9;
          }
          if (v22 != v18) {
            break;
          }
        }
        uint64_t v20 = (void *)*v20;
      }
      while (v20);
    }
  }
LABEL_49:
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v26 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if (v5 > 9)
    {
      float v27 = &stru_1EF593218;
      if (v4 > 4) {
        goto LABEL_54;
      }
    }
    else
    {
      float v27 = off_1E5A8C3F8[v5];
      if (v4 > 4)
      {
LABEL_54:
        float v28 = &stru_1EF593218;
LABEL_57:
        *(_DWORD *)uint64_t v32 = 134218498;
        *(void *)&v32[4] = self;
        *(_WORD *)&v32[12] = 2112;
        *(void *)&v32[14] = v27;
        *(_WORD *)&v32[22] = 2112;
        __int16 v33 = v28;
        float v29 = v26;
        _os_log_impl(&dword_1A1780000, v29, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set application state: %@, displayed search results type: %@", v32, 0x20u);

        goto LABEL_58;
      }
    }
    float v28 = off_1E5A8C448[v4];
    goto LABEL_57;
  }
LABEL_58:
  if (*((unsigned __int8 *)self + 208) == v4)
  {
    if (v7 == v5) {
      return;
    }
  }
  else
  {
    *((unsigned char *)self + 208) = v4;
  }
  [(VKMapView *)self _updateMapDisplayStyle];
  [(VKMapView *)self _updateCameraThermalOptions];
  if (*((unsigned char *)self + 598))
  {
    uint64_t v30 = +[VKDebugSettings sharedSettings];
    __int16 v31 = (unsigned int *)[v30 displayStyleOverride];

    if (v31) {
      [(VKMapView *)self enableMapDisplayStyleDebugOverride:*v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32)];
    }
  }
}

void __35__VKMapView_snapMapAfterModeChange__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) currentCanvas];
  id v2 = [v1 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 snapMapIfNecessary:1];
  }
}

- (void)setRendersInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unsigned int v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    id v6 = "NO";
    if (v3) {
      id v6 = "YES";
    }
    int v8 = 134218242;
    int8x8_t v9 = self;
    __int16 v10 = 2080;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set renders in background: %s", (uint8_t *)&v8, 0x16u);
  }
  int v7 = (md::MapEngine *)*((void *)self + 48);
  *((unsigned char *)v7 + 1178) = v3;
  md::MapEngine::updateRunLoopStatus(v7);
}

- (void)setPreferredUnits:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unsigned int v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218240;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set Contour Line Units: %lu", (uint8_t *)&v10, 0x16u);
  }
  int v6 = a3 != 0;
  uint64_t v7 = *((void *)self + 48);
  if (*(unsigned __int8 *)(*(void *)(v7 + 896) + 392) != v6)
  {
    md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView setPreferredUnits:]");
    md::World::setPreferredUnits(*(void *)(v7 + 896), v6);
    uint64_t v8 = *(void *)(*((void *)self + 48) + 1128);
    LOBYTE(v10) = 35;
    md::MapEngineSettings::set(v8, &v10, (void *)(a3 != 0));
    uint64_t v9 = *((void *)self + 48);
    LOBYTE(v10) = 1;
    md::MapEngine::setNeedsTick(v9, &v10);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 32) = 0;
  *((void *)self + 7) = 850045863;
  *((void *)self + 14) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((void *)self + 34) = &unk_1EF559A78;
  *((void *)self + 35) = 0;
  *((void *)self + 37) = &unk_1EF559C58;
  *((void *)self + 38) = 0;
  *((unsigned char *)self + 328) = 0;
  *((unsigned char *)self + 352) = 0;
  *((unsigned char *)self + 360) = 0;
  *((unsigned char *)self + 368) = 0;
  *((void *)self + 47) = 0xBF80000000000000;
  *((void *)self + 48) = 0;
  *((void *)self + 53) = &unk_1EF5599F8;
  *((void *)self + 54) = 0;
  *((void *)self + 56) = &unk_1EF559F38;
  *((void *)self + 57) = 0;
  *((void *)self + 60) = &unk_1EF559D78;
  *((void *)self + 61) = 0;
  *((void *)self + 63) = 0;
  *((void *)self + 68) = &unk_1EF559CF8;
  *((void *)self + 69) = 0;
  return self;
}

- (void)setHostDisplay:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unsigned int v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    uint64_t v17 = self;
    __int16 v18 = 2048;
    id v19 = v4;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set host display: %p", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v6 = *((void *)self + 48);
  id v7 = v4;
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  if (v9)
  {
    id v10 = v7;
    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F39B60] mainDisplay];
    }
    if (v10 != *(id *)(v9 + 88))
    {
      objc_storeStrong((id *)(v9 + 88), v10);
      [*(id *)(v9 + 72) invalidate];
      uint64_t v11 = [MEMORY[0x1E4F39B68] displayLinkWithDisplay:*(void *)(v9 + 88) target:*(void *)(v9 + 80) selector:sel_displayLinkFired_];
      unint64_t v13 = *(void **)(v9 + 72);
      __int16 v12 = (uint64_t *)(v9 + 72);
      *__int16 v12 = v11;

      uint64_t v14 = (void *)*v12;
      unint64_t v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v14 addToRunLoop:v15 forMode:*MEMORY[0x1E4F1C4B0]];
    }
  }
}

- (void)setOfflineMode:(BOOL)a3
{
  int v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0x2FED70A4459DFCA1;
  uint64_t v6 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v7 = *(void *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    unint64_t v9 = 0x2FED70A4459DFCA1;
    if (v7 <= 0x2FED70A4459DFCA1) {
      unint64_t v9 = 0x2FED70A4459DFCA1 % v7;
    }
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 8 * v9);
    do
    {
      do
        uint64_t v8 = (void *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 8 * ((v7 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        uint64_t v8 = (void *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  if (*(unsigned char *)(v8[5] + 178) == a3) {
    return;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218242;
    int v25 = self;
    __int16 v26 = 2080;
    float v27 = gss::to_string(v3);
    _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set set offline mode:%s", (uint8_t *)&v24, 0x16u);
  }

  uint64_t v11 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v12 = v11[2];
  if (!*(void *)&v12) {
    goto LABEL_36;
  }
  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    if (*(void *)&v12 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v12;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v14 = *(void **)(*(void *)&v11[1] + 8 * v5);
  if (!v14 || (unint64_t v15 = (void *)*v14) == 0)
  {
LABEL_36:
    uint64_t v19 = 0;
    goto LABEL_37;
  }
  if (v13.u32[0] < 2uLL)
  {
    uint64_t v16 = *(void *)&v12 - 1;
    while (1)
    {
      uint64_t v18 = v15[1];
      if (v18 == 0x2FED70A4459DFCA1)
      {
        if (v15[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_49;
        }
      }
      else if ((v18 & v16) != v5)
      {
        goto LABEL_36;
      }
      unint64_t v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_36;
      }
    }
  }
  while (1)
  {
    unint64_t v17 = v15[1];
    if (v17 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v17 >= *(void *)&v12) {
      v17 %= *(void *)&v12;
    }
    if (v17 != v5) {
      goto LABEL_36;
    }
LABEL_26:
    unint64_t v15 = (void *)*v15;
    if (!v15) {
      goto LABEL_36;
    }
  }
  if (v15[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_26;
  }
LABEL_49:
  uint64_t v19 = v15[5];
LABEL_37:
  if (*(unsigned __int8 *)(v19 + 178) != v3)
  {
    *(unsigned char *)(v19 + 178) = v3;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(void *)(v19 + 208), 0x10083u, v3);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(void *)(v19 + 224), 0x10083u, *(unsigned __int8 *)(v19 + 178));
    LOBYTE(v24) = 4;
    uint64_t v20 = *(char **)(v19 + 1128);
    uint64_t v21 = *(char **)(v19 + 1136);
    if (v20 != v21)
    {
      while (*v20 <= 3u)
      {
        if (++v20 == v21) {
          goto LABEL_44;
        }
      }
    }
    if (v20 == v21 || (uint64_t v21 = v20, *v20 != 4)) {
LABEL_44:
    }
      std::vector<md::StyleManagerEvent>::insert(v19 + 1128, v21, (char *)&v24);
    uint64_t v22 = **(void **)(v19 + 1240);
    if (v22)
    {
      LOBYTE(v24) = 12;
      md::MapEngine::setNeedsTick(v22, &v24);
    }
  }
  uint64_t v23 = *((void *)self + 48);
  LOBYTE(v24) = 1;
  md::MapEngine::setNeedsTick(v23, &v24);
}

- (void)setTargetDisplay:(int64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0x2FED70A4459DFCA1;
  int v6 = a3;
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v8 = *(void *)(v7 + 16);
  if ((v8 & (v8 - 1)) != 0)
  {
    unint64_t v10 = 0x2FED70A4459DFCA1;
    if (v8 <= 0x2FED70A4459DFCA1) {
      unint64_t v10 = 0x2FED70A4459DFCA1 % v8;
    }
    unint64_t v9 = *(void **)(*(void *)(v7 + 8) + 8 * v10);
    do
    {
      do
        unint64_t v9 = (void *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    unint64_t v9 = *(void **)(*(void *)(v7 + 8) + 8 * ((v8 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        unint64_t v9 = (void *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  if (*(unsigned __int8 *)(v9[5] + 161) == a3) {
    return;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v11 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 2) {
      int8x8_t v12 = &stru_1EF593218;
    }
    else {
      int8x8_t v12 = off_1E5A8C388[a3];
    }
    *(_DWORD *)uint64_t v40 = 134218242;
    *(void *)&v40[4] = self;
    *(_WORD *)&v40[12] = 2112;
    *(void *)&v40[14] = v12;
    uint8x8_t v13 = v11;
    _os_log_impl(&dword_1A1780000, v13, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set target display: %@", v40, 0x16u);
  }
  uint64_t v14 = *((void *)self + 48);
  uint64_t v15 = *(void *)(v14 + 896);
  uint64_t v16 = *(void *)(v15 + 32);
  uint64_t v17 = *(void *)(v15 + 40);
  if (v16 != v17)
  {
    while (*(_WORD *)v16 != 27)
    {
      v16 += 16;
      if (v16 == v17) {
        goto LABEL_35;
      }
    }
  }
  if (v16 != v17)
  {
    uint64_t v18 = *(void *)(v16 + 8);
    if (v18)
    {
      if (*(unsigned __int8 *)(v18 + 760) != v6)
      {
        uint64_t v19 = *(void *)(v18 + 752);
        unint64_t v20 = v19 & 0xFFFFFFFFFFFFFFF9 | 4;
        uint64_t v21 = v19 | 6;
        if (v6 != 1) {
          uint64_t v21 = v20;
        }
        *(void *)(v18 + 752) = v21;
        *(unsigned char *)(v18 + 760) = v6;
        uint64_t v22 = *(void **)(v18 + 16);
        std::__list_imp<geo::MarkedLRUCache<gdc::LayerDataRequestKey,std::shared_ptr<gdc::LayerData>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>>::CacheEntry,std::allocator<geo::MarkedLRUCache<gdc::LayerDataRequestKey,std::shared_ptr<gdc::LayerData>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>>::CacheEntry>>::clear(v22);
        if (v22[6])
        {
          uint64_t v23 = (unsigned char *)v22[5];
          if (v23)
          {
            do
            {
              if (v23[112]) {
                v23[112] = 0;
              }
              float v29 = *(unsigned char **)v23;
              uint64_t v30 = (void *)*((void *)v23 + 4);
              if (v30 != *((void **)v23 + 6)) {
                free(v30);
              }
              operator delete(v23);
              uint64_t v23 = v29;
            }
            while (v29);
          }
          id v22[5] = 0;
          uint64_t v24 = v22[4];
          if (v24)
          {
            for (uint64_t i = 0; i != v24; ++i)
              *(void *)(v22[3] + 8 * i) = 0;
          }
          v22[6] = 0;
        }
        v22[8] = v22;
        v22[9] = 0;
        uint64_t v14 = *((void *)self + 48);
      }
    }
  }
LABEL_35:
  __int16 v26 = *(int8x8_t **)(v14 + 1120);
  int8x8_t v27 = v26[2];
  if (!*(void *)&v27) {
    goto LABEL_60;
  }
  uint8x8_t v28 = (uint8x8_t)vcnt_s8(v27);
  v28.i16[0] = vaddlv_u8(v28);
  if (v28.u32[0] > 1uLL)
  {
    if (*(void *)&v27 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v27;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v27 - 1) & 0x2FED70A4459DFCA1;
  }
  __int16 v31 = *(void **)(*(void *)&v26[1] + 8 * v5);
  if (!v31 || (uint64_t v32 = (void *)*v31) == 0)
  {
LABEL_60:
    uint64_t v36 = 0;
    goto LABEL_61;
  }
  if (v28.u32[0] < 2uLL)
  {
    uint64_t v33 = *(void *)&v27 - 1;
    while (1)
    {
      uint64_t v35 = v32[1];
      if (v35 == 0x2FED70A4459DFCA1)
      {
        if (v32[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_69;
        }
      }
      else if ((v35 & v33) != v5)
      {
        goto LABEL_60;
      }
      uint64_t v32 = (void *)*v32;
      if (!v32) {
        goto LABEL_60;
      }
    }
  }
  while (1)
  {
    unint64_t v34 = v32[1];
    if (v34 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v34 >= *(void *)&v27) {
      v34 %= *(void *)&v27;
    }
    if (v34 != v5) {
      goto LABEL_60;
    }
LABEL_50:
    uint64_t v32 = (void *)*v32;
    if (!v32) {
      goto LABEL_60;
    }
  }
  if (v32[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_50;
  }
LABEL_69:
  uint64_t v36 = (unsigned char *)v32[5];
LABEL_61:
  if (v36[161] != v6)
  {
    v36[161] = v6;
    (*(void (**)(unsigned char *))(*(void *)v36 + 16))(v36);
  }
  float v37 = [(VKMapView *)self _labelSettings];
  **((unsigned char **)v37 + 5) = v6;
  uint64_t v38 = (md::LabelManager *)*((void *)v37 + 3);
  *(void *)uint64_t v40 = &unk_1EF56E400;
  *(void *)&v40[8] = v38;
  *(void *)&v40[16] = a3;
  uint64_t v41 = v40;
  md::LabelManager::queueCommand(v38, 13, 1, v40);
  if (v41 == v40)
  {
    (*(void (**)(unsigned char *))(*(void *)v40 + 32))(v40);
  }
  else if (v41)
  {
    (*(void (**)(void))(*(void *)v41 + 40))();
  }
  __int16 v39 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v39[567], "-[VKMapView setTargetDisplay:]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v39);
}

void __34__VKMapView_didUpdateSceneStatus___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  int v6 = @"hasFailedTiles";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"VKMapViewDidBecomeFullyDrawnNotification" object:v3 userInfo:v5];
}

- (float)currentZoomLevel
{
  id v2 = [(VKMapView *)self currentCanvas];
  uint64_t v3 = [v2 cameraController];
  [v3 currentZoomLevel];
  float v5 = v4;

  return v5;
}

- (unordered_map<unsigned)clientStyleAttributes
{
  retstr->var0.unint64_t var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.unint64_t var0 = 0u;
  retstr->var0.var3.unint64_t var0 = 1.0;
  float v5 = *(int8x8_t **)(self[9].var0.var2.var0 + 1120);
  if (v5)
  {
    int8x8_t v6 = v5[2];
    if (v6)
    {
      uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
      v7.i16[0] = vaddlv_u8(v7);
      if (v7.u32[0] > 1uLL)
      {
        uint64_t v8 = 0x2FED70A4459DFCA1;
        if (*(void *)&v6 <= 0x2FED70A4459DFCA1uLL) {
          uint64_t v8 = 0x2FED70A4459DFCA1uLL % *(void *)&v6;
        }
      }
      else
      {
        uint64_t v8 = (*(void *)&v6 - 1) & 0x2FED70A4459DFCA1;
      }
      unint64_t v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
      if (v9)
      {
        unint64_t v10 = (void *)*v9;
        if (v10)
        {
          if (v7.u32[0] < 2uLL)
          {
            uint64_t v11 = *(void *)&v6 - 1;
            while (1)
            {
              uint64_t v13 = v10[1];
              if (v13 == 0x2FED70A4459DFCA1)
              {
                if (v10[2] == 0x2FED70A4459DFCA1) {
                  goto LABEL_23;
                }
              }
              else if ((v13 & v11) != v8)
              {
                return self;
              }
              unint64_t v10 = (void *)*v10;
              if (!v10) {
                return self;
              }
            }
          }
          while (1)
          {
            unint64_t v12 = v10[1];
            if (v12 == 0x2FED70A4459DFCA1) {
              break;
            }
            if (v12 >= *(void *)&v6) {
              v12 %= *(void *)&v6;
            }
            if (v12 != v8) {
              return self;
            }
LABEL_12:
            unint64_t v10 = (void *)*v10;
            if (!v10) {
              return self;
            }
          }
          if (v10[2] != 0x2FED70A4459DFCA1) {
            goto LABEL_12;
          }
LABEL_23:
          uint64_t v14 = v10[5];
          if (v14)
          {
            unint64_t v15 = *(void *)(v14 + 208);
            unint64_t v61 = v15 + 16;
            uint64_t v16 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v15 + 16));
            if (v16) {
              geo::read_write_lock::logFailure(v16, (uint64_t)"read lock", v17);
            }
            geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::intern_linear_map(&v56, (uint64_t *)(v15 + 216));
            self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)pthread_rwlock_unlock((pthread_rwlock_t *)(v15 + 16));
            if (self) {
              geo::read_write_lock::logFailure((geo::read_write_lock *)self, (uint64_t)"unlock", v18);
            }
            int v55 = v58;
            if (!v58)
            {
LABEL_126:
              if (!v60)
              {
                if (v56)
                {
                  uint64_t v54 = gss::Allocator::instance((gss::Allocator *)self);
                  return (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)(*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v54 + 40))(v54, v56, v59);
                }
              }
              return self;
            }
            uint64_t v19 = 0;
            unsigned int v20 = 0;
            p_double var1 = &retstr->var0.var1;
            unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
            unsigned int v23 = v58;
            while (1)
            {
              if (v20 < v23)
              {
                uint64_t v19 = (unsigned int *)(v56 + 4 * v20);
                uint64_t v3 = (unsigned __int16 *)(v56 + v57 + 2 * v20);
              }
              unint64_t v24 = *v3;
              unint64_t v25 = *v19;
              if (var0)
              {
                uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)var0);
                v26.i16[0] = vaddlv_u8(v26);
                if (v26.u32[0] > 1uLL)
                {
                  unint64_t v15 = *v19;
                  if (var0 <= v25) {
                    unint64_t v15 = v25 % var0;
                  }
                }
                else
                {
                  unint64_t v15 = (var0 - 1) & v25;
                }
                int8x8_t v27 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> **)retstr->var0.var0.var0.var0[v15];
                if (v27)
                {
                  uint8x8_t v28 = *v27;
                  if (*v27)
                  {
                    if (v26.u32[0] < 2uLL)
                    {
                      while (1)
                      {
                        unint64_t v30 = v28->var0.var0.var0.var1.var0.var0;
                        if (v30 == v25)
                        {
                          if (LODWORD(v28->var0.var1.var0.var0) == v25) {
                            goto LABEL_112;
                          }
                        }
                        else if ((v30 & (var0 - 1)) != v15)
                        {
                          goto LABEL_52;
                        }
                        uint8x8_t v28 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)v28->var0.var0.var0.var0;
                        if (!v28) {
                          goto LABEL_52;
                        }
                      }
                    }
                    do
                    {
                      unint64_t v29 = v28->var0.var0.var0.var1.var0.var0;
                      if (v29 == v25)
                      {
                        if (LODWORD(v28->var0.var1.var0.var0) == v25) {
                          goto LABEL_112;
                        }
                      }
                      else
                      {
                        if (v29 >= var0) {
                          v29 %= var0;
                        }
                        if (v29 != v15) {
                          break;
                        }
                      }
                      uint8x8_t v28 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)v28->var0.var0.var0.var0;
                    }
                    while (v28);
                  }
                }
              }
LABEL_52:
              self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)operator new(0x20uLL);
              uint8x8_t v28 = self;
              self->var0.var0.var0.unint64_t var0 = 0;
              self->var0.var0.var0.var1.var0.unint64_t var0 = v25;
              LODWORD(self->var0.var1.var0.var0) = v25;
              self->var0.var2.unint64_t var0 = 0;
              float v31 = (float)(retstr->var0.var2.var0 + 1);
              float v32 = retstr->var0.var3.var0;
              if (!var0 || (float)(v32 * (float)var0) < v31) {
                break;
              }
LABEL_102:
              unint64_t v51 = retstr->var0.var0.var0.var0;
              uint64_t v52 = (void **)retstr->var0.var0.var0.var0[v15];
              if (v52)
              {
                v28->var0.var0.var0.unint64_t var0 = (void **)*v52;
              }
              else
              {
                v28->var0.var0.var0.unint64_t var0 = (void **)p_var1->var0.var0;
                p_var1->var0.unint64_t var0 = v28;
                v51[v15] = p_var1;
                if (!v28->var0.var0.var0.var0) {
                  goto LABEL_111;
                }
                unint64_t v53 = *((void *)v28->var0.var0.var0.var0 + 1);
                if ((var0 & (var0 - 1)) != 0)
                {
                  if (v53 >= var0) {
                    v53 %= var0;
                  }
                }
                else
                {
                  v53 &= var0 - 1;
                }
                uint64_t v52 = &retstr->var0.var0.var0.var0[v53];
              }
              *uint64_t v52 = v28;
LABEL_111:
              ++retstr->var0.var2.var0;
              unsigned int v23 = v58;
LABEL_112:
              v28->var0.var2.unint64_t var0 = v24;
              if (v20 + 1 < v23) {
                ++v20;
              }
              else {
                unsigned int v20 = v23;
              }
              if (v20 == v55) {
                goto LABEL_126;
              }
            }
            BOOL v33 = (var0 & (var0 - 1)) != 0;
            if (var0 < 3) {
              BOOL v33 = 1;
            }
            unint64_t v34 = v33 | (2 * var0);
            unint64_t v35 = vcvtps_u32_f32(v31 / v32);
            if (v34 <= v35) {
              size_t v36 = v35;
            }
            else {
              size_t v36 = v34;
            }
            if (v36 == 1)
            {
              size_t v36 = 2;
            }
            else if ((v36 & (v36 - 1)) != 0)
            {
              self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)std::__next_prime(v36);
              size_t v36 = (size_t)self;
              unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
            }
            if (v36 <= var0)
            {
              if (v36 >= var0) {
                goto LABEL_89;
              }
              self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)vcvtps_u32_f32((float)retstr->var0.var2.var0 / retstr->var0.var3.var0);
              if (var0 < 3
                || (uint8x8_t v46 = (uint8x8_t)vcnt_s8((int8x8_t)var0), v46.i16[0] = vaddlv_u8(v46), v46.u32[0] > 1uLL))
              {
                self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)std::__next_prime((size_t)self);
              }
              else
              {
                uint64_t v47 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)(1 << -(char)__clz((unint64_t)&self[-1].var0.var3 + 7));
                if ((unint64_t)self >= 2) {
                  self = v47;
                }
              }
              if (v36 <= (unint64_t)self) {
                size_t v36 = (size_t)self;
              }
              if (v36 >= var0)
              {
                unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
LABEL_89:
                if ((var0 & (var0 - 1)) != 0)
                {
                  if (var0 <= v25) {
                    unint64_t v15 = v25 % var0;
                  }
                  else {
                    unint64_t v15 = v25;
                  }
                }
                else
                {
                  unint64_t v15 = (var0 - 1) & v25;
                }
                goto LABEL_102;
              }
              if (!v36)
              {
                self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)retstr->var0.var0.var0.var0;
                retstr->var0.var0.var0.unint64_t var0 = 0;
                if (self) {
                  operator delete(self);
                }
                unint64_t var0 = 0;
                retstr->var0.var0.var0.var1.var0.unint64_t var0 = 0;
                goto LABEL_89;
              }
            }
            if (v36 >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            float v37 = (void **)operator new(8 * v36);
            self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)retstr->var0.var0.var0.var0;
            retstr->var0.var0.var0.unint64_t var0 = v37;
            if (self) {
              operator delete(self);
            }
            uint64_t v38 = 0;
            retstr->var0.var0.var0.var1.var0.unint64_t var0 = v36;
            do
              retstr->var0.var0.var0.var0[v38++] = 0;
            while (v36 != v38);
            __int16 v39 = p_var1->var0.var0;
            if (!p_var1->var0.var0)
            {
LABEL_88:
              unint64_t var0 = v36;
              goto LABEL_89;
            }
            size_t v40 = v39[1];
            size_t v41 = v36 - 1;
            if ((v36 & (v36 - 1)) == 0)
            {
              size_t v42 = v40 & v41;
              retstr->var0.var0.var0.var0[v42] = p_var1;
              for (uint64_t i = (void *)*v39; *v39; uint64_t i = (void *)*v39)
              {
                size_t v44 = i[1] & v41;
                if (v44 == v42)
                {
                  __int16 v39 = i;
                }
                else if (retstr->var0.var0.var0.var0[v44])
                {
                  *__int16 v39 = *i;
                  size_t v45 = v44;
                  *uint64_t i = *(void *)retstr->var0.var0.var0.var0[v45];
                  *(void *)retstr->var0.var0.var0.var0[v45] = i;
                }
                else
                {
                  retstr->var0.var0.var0.var0[v44] = v39;
                  __int16 v39 = i;
                  size_t v42 = v44;
                }
              }
              goto LABEL_88;
            }
            if (v40 >= v36) {
              v40 %= v36;
            }
            retstr->var0.var0.var0.var0[v40] = p_var1;
            unsigned __int16 v48 = (void *)*v39;
            if (!*v39) {
              goto LABEL_88;
            }
            while (1)
            {
              size_t v50 = v48[1];
              if (v50 >= v36) {
                v50 %= v36;
              }
              if (v50 != v40)
              {
                if (!retstr->var0.var0.var0.var0[v50])
                {
                  retstr->var0.var0.var0.var0[v50] = v39;
                  goto LABEL_93;
                }
                *__int16 v39 = *v48;
                size_t v49 = v50;
                *unsigned __int16 v48 = *(void *)retstr->var0.var0.var0.var0[v49];
                *(void *)retstr->var0.var0.var0.var0[v49] = v48;
                unsigned __int16 v48 = v39;
              }
              size_t v50 = v40;
LABEL_93:
              __int16 v39 = v48;
              unsigned __int16 v48 = (void *)*v48;
              size_t v40 = v50;
              if (!v48) {
                goto LABEL_88;
              }
            }
          }
        }
      }
    }
  }
  return self;
}

- (id)markerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  float v5 = [(VKMapView *)self currentCanvas];
  int8x8_t v6 = objc_msgSend(v5, "markerAtScreenPoint:enableExtendedFeatureMarkers:", 1, x, y);

  return v6;
}

- (id)buildingMarkerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = *(id *)(*((void *)self + 48) + 840);
  uint8x8_t v7 = v6;
  uint64_t v8 = *(void **)(*((void *)self + 48) + 920);
  int8x8_t v9 = (int8x8_t)v8[1];
  if (!*(void *)&v9) {
    goto LABEL_26;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v11 = 0x1AF456233693CD46;
    if (*(void *)&v9 <= 0x1AF456233693CD46uLL) {
      uint64_t v11 = 0x1AF456233693CD46uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v11 = (*(void *)&v9 - 1) & 0x1AF456233693CD46;
  }
  unint64_t v12 = *(void **)(*v8 + 8 * v11);
  if (!v12) {
    goto LABEL_26;
  }
  uint64_t v13 = (void *)*v12;
  if (!v13) {
    goto LABEL_26;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == 0x1AF456233693CD46)
      {
        if (v13[2] == 0x1AF456233693CD46) {
          goto LABEL_22;
        }
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_26;
      }
      uint64_t v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v13[1];
    if (v15 == 0x1AF456233693CD46) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v11) {
      goto LABEL_26;
    }
LABEL_11:
    uint64_t v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_26;
    }
  }
  if (v13[2] != 0x1AF456233693CD46) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v17 = v13[5];
  if (*(void *)(v17 + 8) != 0x1AF456233693CD46 || (uint64_t v18 = *(md::CameraContext **)(v17 + 32)) == 0)
  {
LABEL_26:
    unint64_t v30 = 0;
    goto LABEL_27;
  }
  [v6 size];
  double v20 = v19;
  [v7 size];
  double v22 = v21;
  [v7 size];
  double v39 = md::CameraContext::groundPointFromScreenPoint(v18, v24, x / v20, (-1.0 - y + v22) / v23);
  uint64_t v40 = v25;
  uint64_t v41 = v26;
  uint64_t v27 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v27 + 4536), "-[VKMapView(Tools) buildingMarkerAtPoint:]");
  uint64_t v28 = *(void *)(*(void *)(v27 + 856) + 40);
  if ((unint64_t)(*(void *)(*(void *)(v27 + 856) + 48) - v28) >= 0xD8) {
    uint64_t v29 = *(void *)(v28 + 208);
  }
  else {
    uint64_t v29 = 0;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v29 + 88))(&v37);
  if (v37)
  {
    float v32 = [VKMarker alloc];
    uint64_t v35 = v37;
    size_t v36 = v38;
    if (v38) {
      atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v30 = [(VKMarker *)v32 initWithFeatureMarkerPtr:&v35 markerType:0];
    BOOL v33 = v36;
    if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  unint64_t v34 = v38;
  if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
LABEL_27:

  return v30;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 77);
  objc_storeStrong((id *)self + 73, 0);
  *((void *)self + 68) = &unk_1EF559CF8;

  objc_storeStrong((id *)self + 67, 0);
  uint64_t v3 = *((void *)self + 63);
  *((void *)self + 63) = 0;
  if (v3) {
    MEMORY[0x1A6239270](v3, 0x1000C40E32A8BA7);
  }
  *((void *)self + 60) = &unk_1EF559D78;

  objc_storeStrong((id *)self + 59, 0);
  *((void *)self + 56) = &unk_1EF559F38;

  *((void *)self + 53) = &unk_1EF5599F8;
  objc_storeStrong((id *)self + 51, 0);
  objc_storeStrong((id *)self + 50, 0);
  uint64_t v4 = *((void *)self + 48);
  *((void *)self + 48) = 0;
  if (v4) {
    md::MapEngineDeleter::operator()(v4);
  }
  objc_storeStrong((id *)self + 40, 0);
  *((void *)self + 37) = &unk_1EF559C58;

  *((void *)self + 34) = &unk_1EF559A78;
  objc_storeStrong((id *)self + 33, 0);
  objc_storeStrong((id *)self + 32, 0);
  objc_storeStrong((id *)self + 31, 0);
  objc_storeStrong((id *)self + 28, 0);
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_destroyWeak((id *)self + 15);
  std::mutex::~mutex((std::mutex *)((char *)self + 56));
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  if (*((unsigned char *)self + 32)) {
    *((unsigned char *)self + 32) = 0;
  }
}

- (VKLabelSelectionFilter)labelSelectionFilter
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 77);
  return (VKLabelSelectionFilter *)WeakRetained;
}

- (unint64_t)navCameraMode
{
  return *((void *)self + 75);
}

- (unsigned)mapKitClientMode
{
  return *((unsigned char *)self + 212);
}

- (unsigned)mapsUsage
{
  return *((unsigned char *)self + 210);
}

- (unsigned)mapKitUsage
{
  return *((unsigned char *)self + 211);
}

- (BOOL)compressedBuildingsEnabled
{
  return *((unsigned char *)self + 416);
}

- (GEOPOICategoryFilter)pointsOfInterestFilter
{
  return (GEOPOICategoryFilter *)*((void *)self + 51);
}

- (unsigned)displayedSearchResultsType
{
  return *((unsigned char *)self + 208);
}

- (unsigned)applicationSubState
{
  return *((unsigned char *)self + 193);
}

- (VKMapViewDelegate)mapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  return (VKMapViewDelegate *)WeakRetained;
}

- (VKSceneConfiguration)sceneConfiguration
{
  id v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_24;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x2FED70A4459DFCA1;
    if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  id v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    goto LABEL_24;
  }
  uint8x8_t v7 = (void *)*v6;
  if (!v7) {
    goto LABEL_24;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_24;
      }
      uint8x8_t v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_24;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_24;
    }
LABEL_11:
    uint8x8_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_24;
    }
  }
  if (v7[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11)
  {
    id v12 = *(id *)(v11 + 1160);
    goto LABEL_25;
  }
LABEL_24:
  id v12 = 0;
LABEL_25:
  return (VKSceneConfiguration *)v12;
}

- (void)puckAnimator:(id)a3 updatedPosition:(const void *)a4 course:(const void *)a5 polylineCoordinate:(PolylineCoordinate)a6
{
  id v10 = a3;
  uint64_t v11 = (_OWORD *)((char *)self + 328);
  if (*((unsigned char *)self + 352))
  {
    long long v12 = *(_OWORD *)a4;
    *((void *)self + 43) = *((void *)a4 + 2);
    *uint64_t v11 = v12;
  }
  else
  {
    *(void *)uint64_t v11 = *(void *)a4;
    *((_OWORD *)self + 21) = *(_OWORD *)((char *)a4 + 8);
    *((unsigned char *)self + 352) = 1;
  }
  uint64_t v13 = *(void *)a5;
  if (!*((unsigned char *)self + 368)) {
    *((unsigned char *)self + 368) = 1;
  }
  *((void *)self + 45) = v13;
  *((PolylineCoordinate *)self + 47) = a6;
  uint64_t v14 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v15 = v14[2];
  uint8x8_t v16 = (uint8x8_t)vcnt_s8(v15);
  v16.i16[0] = vaddlv_u8(v16);
  unint64_t v17 = v16.u32[0];
  if (v16.u32[0] >= 2uLL)
  {
    unint64_t v21 = 0xBEC1A12372CEEC00;
    if (*(void *)&v15 <= 0xBEC1A12372CEEC00) {
      unint64_t v21 = 0xBEC1A12372CEEC00 % *(void *)&v15;
    }
    int8x8_t v19 = v14[1];
    double v20 = *(void **)(*(void *)&v19 + 8 * v21);
    do
    {
      do
        double v20 = (void *)*v20;
      while (v20[1] != 0xBEC1A12372CEEC00);
    }
    while (v20[2] != 0xBEC1A12372CEEC00);
    uint64_t v18 = *(void *)&v15 - 1;
  }
  else
  {
    uint64_t v18 = *(void *)&v15 - 1;
    int8x8_t v19 = v14[1];
    double v20 = *(void **)(*(void *)&v19 + 8 * ((*(void *)&v15 - 1) & 0xBEC1A12372CEEC00));
    do
    {
      do
        double v20 = (void *)*v20;
      while (v20[1] != 0xBEC1A12372CEEC00);
    }
    while (v20[2] != 0xBEC1A12372CEEC00);
  }
  uint64_t v22 = v20[5];
  if (*((unsigned char *)self + 352)) {
    double v23 = (char *)self + 328;
  }
  else {
    double v23 = (char *)a4;
  }
  uint64_t v24 = *((void *)v23 + 2);
  *(_OWORD *)(v22 + 128) = *(_OWORD *)v23;
  *(void *)(v22 + 144) = v24;
  if (v17 >= 2)
  {
    unint64_t v26 = 0xBEC1A12372CEEC00;
    if (*(void *)&v15 <= 0xBEC1A12372CEEC00) {
      unint64_t v26 = 0xBEC1A12372CEEC00 % *(void *)&v15;
    }
    uint64_t v25 = *(void **)(*(void *)&v19 + 8 * v26);
    do
    {
      do
        uint64_t v25 = (void *)*v25;
      while (v25[1] != 0xBEC1A12372CEEC00);
    }
    while (v25[2] != 0xBEC1A12372CEEC00);
  }
  else
  {
    uint64_t v25 = *(void **)(*(void *)&v19 + 8 * (v18 & 0xBEC1A12372CEEC00));
    do
    {
      do
        uint64_t v25 = (void *)*v25;
      while (v25[1] != 0xBEC1A12372CEEC00);
    }
    while (v25[2] != 0xBEC1A12372CEEC00);
  }
  *(PolylineCoordinate *)(v25[5] + 208) = a6;
  uint64_t v27 = [(VKMapView *)self navigationPuck];
  +[VKMapView updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:](VKMapView, "updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:", v10, [v27 enabled], *((void *)self + 48) + 928);

  uint64_t v28 = *(unsigned __int8 **)(*((void *)self + 48) + 904);
  if (v28)
  {
    md::MapDataAccess::heightAtCoordinate(v28, a4);
    if (v29)
    {
      uint64_t v30 = *((void *)self + 48);
      long long v31 = *(_OWORD *)a4;
      *(void *)(v30 + 1000) = *((void *)a4 + 2);
      *(_OWORD *)(v30 + 984) = v31;
    }
  }
  float v32 = (void *)*((void *)self + 33);
  if (*((unsigned char *)self + 352)) {
    BOOL v33 = (char *)self + 328;
  }
  else {
    BOOL v33 = (char *)a4;
  }
  uint64_t v34 = *((void *)v33 + 2);
  long long v35 = *(_OWORD *)v33;
  uint64_t v36 = v34;
  [v32 puckAnimator:v10 updatedPosition:&v35 course:a5 polylineCoordinate:*((void *)self + 47)];
}

- (void)removeExternalAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v6 = v5[2];
  id v32 = v4;
  if (!*(void *)&v6) {
    goto LABEL_72;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v8 = 0x79FE0BD9535D5C4DLL;
    if (*(void *)&v6 <= 0x79FE0BD9535D5C4DuLL) {
      uint64_t v8 = 0x79FE0BD9535D5C4DuLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v6 - 1) & 0x79FE0BD9535D5C4DLL;
  }
  unint64_t v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
  if (!v9) {
    goto LABEL_72;
  }
  id v10 = (void *)*v9;
  if (!v10) {
    goto LABEL_72;
  }
  if (v7.u32[0] < 2uLL)
  {
    uint64_t v11 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == 0x79FE0BD9535D5C4DLL)
      {
        if (v10[2] == 0x79FE0BD9535D5C4DLL) {
          goto LABEL_22;
        }
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_72;
      }
      id v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_72;
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == 0x79FE0BD9535D5C4DLL) {
      break;
    }
    if (v12 >= *(void *)&v6) {
      v12 %= *(void *)&v6;
    }
    if (v12 != v8) {
      goto LABEL_72;
    }
LABEL_11:
    id v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_72;
    }
  }
  if (v10[2] != 0x79FE0BD9535D5C4DLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v14 = (void *)v10[5];
  if (v14)
  {
    id v15 = v4;
    unint64_t v16 = [v15 hash];
    int8x8_t v17 = (int8x8_t)v14[23];
    if (v17)
    {
      uint8x8_t v18 = (uint8x8_t)vcnt_s8(v17);
      v18.i16[0] = vaddlv_u8(v18);
      if (v18.u32[0] > 1uLL)
      {
        unint64_t v19 = v16;
        if (v16 >= *(void *)&v17) {
          unint64_t v19 = v16 % *(void *)&v17;
        }
      }
      else
      {
        unint64_t v19 = (*(void *)&v17 - 1) & v16;
      }
      uint64_t v20 = v14[22];
      unint64_t v21 = *(void ***)(v20 + 8 * v19);
      if (v21)
      {
        uint64_t v22 = *v21;
        if (*v21)
        {
          uint64_t v23 = *(void *)&v17 - 1;
          if (v18.u32[0] < 2uLL)
          {
            while (1)
            {
              uint64_t v24 = v22[1];
              if (v24 == v16)
              {
                if ((id)v22[3] == v15) {
                  goto LABEL_44;
                }
              }
              else if ((v24 & v23) != v19)
              {
                goto LABEL_71;
              }
              uint64_t v22 = (void *)*v22;
              if (!v22) {
                goto LABEL_71;
              }
            }
          }
          do
          {
            unint64_t v25 = v22[1];
            if (v25 == v16)
            {
              if ((id)v22[3] == v15)
              {
LABEL_44:
                if (v18.u32[0] > 1uLL)
                {
                  if (v16 >= *(void *)&v17) {
                    v16 %= *(void *)&v17;
                  }
                }
                else
                {
                  v16 &= v23;
                }
                unint64_t v26 = *(void **)(v20 + 8 * v16);
                do
                {
                  uint64_t v27 = v26;
                  unint64_t v26 = (void *)*v26;
                }
                while (v26 != v22);
                if (v27 == v14 + 24) {
                  goto LABEL_61;
                }
                unint64_t v28 = v27[1];
                if (v18.u32[0] > 1uLL)
                {
                  if (v28 >= *(void *)&v17) {
                    v28 %= *(void *)&v17;
                  }
                }
                else
                {
                  v28 &= v23;
                }
                if (v28 != v16)
                {
LABEL_61:
                  if (!*v22) {
                    goto LABEL_62;
                  }
                  unint64_t v29 = *(void *)(*v22 + 8);
                  if (v18.u32[0] > 1uLL)
                  {
                    if (v29 >= *(void *)&v17) {
                      v29 %= *(void *)&v17;
                    }
                  }
                  else
                  {
                    v29 &= v23;
                  }
                  if (v29 != v16) {
LABEL_62:
                  }
                    *(void *)(v20 + 8 * v16) = 0;
                }
                uint64_t v30 = *v22;
                if (*v22)
                {
                  unint64_t v31 = *(void *)(v30 + 8);
                  if (v18.u32[0] > 1uLL)
                  {
                    if (v31 >= *(void *)&v17) {
                      v31 %= *(void *)&v17;
                    }
                  }
                  else
                  {
                    v31 &= v23;
                  }
                  if (v31 != v16)
                  {
                    *(void *)(v14[22] + 8 * v31) = v27;
                    uint64_t v30 = *v22;
                  }
                }
                *uint64_t v27 = v30;
                *uint64_t v22 = 0;
                --v14[25];
                (*(void (**)(void))v22[2])();
                operator delete(v22);
                break;
              }
            }
            else
            {
              if (v25 >= *(void *)&v17) {
                v25 %= *(void *)&v17;
              }
              if (v25 != v19) {
                break;
              }
            }
            uint64_t v22 = (void *)*v22;
          }
          while (v22);
        }
      }
    }
LABEL_71:

    id v4 = v32;
  }
LABEL_72:
  objc_msgSend(v4, "setDisplayLayer:", 0, v32);
}

- (void)setCameraHorizontalOffset:(double)a3 duration:(double)a4 timingFunction:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v9 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218496;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    double v13 = a3;
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_impl(&dword_1A1780000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set horizontal offset: %f, duration: %f", (uint8_t *)&v10, 0x20u);
  }
  [*((id *)self + 5) setCameraHorizontalOffset:v8 duration:a3 timingFunction:a4];
}

- (void)setUseSmallCache:(BOOL)a3
{
  uint64_t v3 = *(void *)(*((void *)self + 48) + 896);
  double v4 = 1.0;
  if (a3) {
    GEOConfigGetDouble();
  }
  *(double *)(v3 + 384) = v4;
}

- (void)forceResolveCameraController
{
  id v2 = (void *)*((void *)self + 5);
  id v3 = [(VKMapView *)self resolveMapCameraController];
  objc_msgSend(v2, "setCameraController:");
}

- (id)pptTileStatisticsForMapType:(int)a3 latitude:(double)a4 longitude:(double)a5 zoom:(float)a6 width:(double)a7 height:(double)a8 rect:(id)a9
{
  return 0;
}

- (void)setSkippedRouteLineSplitAnnotation:(id)a3
{
  id v5 = a3;
  int8x8_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (v6)
  {
    int8x8_t v7 = v6[2];
    if (v7)
    {
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        uint64_t v9 = 0x5CBBA028798243FLL;
        if (*(void *)&v7 <= 0x5CBBA028798243FuLL) {
          uint64_t v9 = 0x5CBBA028798243FuLL % *(void *)&v7;
        }
      }
      else
      {
        uint64_t v9 = (*(void *)&v7 - 1) & 0x5CBBA028798243FLL;
      }
      int v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
      if (v10)
      {
        uint64_t v11 = (void *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            uint64_t v12 = *(void *)&v7 - 1;
            while (1)
            {
              uint64_t v14 = v11[1];
              if (v14 == 0x5CBBA028798243FLL)
              {
                if (v11[2] == 0x5CBBA028798243FLL) {
                  goto LABEL_23;
                }
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_25;
              }
              uint64_t v11 = (void *)*v11;
              if (!v11) {
                goto LABEL_25;
              }
            }
          }
          do
          {
            unint64_t v13 = v11[1];
            if (v13 == 0x5CBBA028798243FLL)
            {
              if (v11[2] == 0x5CBBA028798243FLL)
              {
LABEL_23:
                uint64_t v15 = v11[5];
                if (v15)
                {
                  id v16 = v5;
                  objc_storeStrong((id *)(v15 + 184), a3);
                  id v5 = v16;
                }
                break;
              }
            }
            else
            {
              if (v13 >= *(void *)&v7) {
                v13 %= *(void *)&v7;
              }
              if (v13 != v9) {
                break;
              }
            }
            uint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
      }
    }
  }
LABEL_25:
}

- (void)goToTileX:(int)a3 Y:(int)a4 Z:(int)a5 tileSize:(int)a6
{
}

- (BOOL)gridDisabled
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 15)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)rastersDisabled
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 14)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)buildingFootprintsDisabled
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 13)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)renderInverseFills
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 12)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)renderOverlayPolygons
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 11)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)polygonsDisabled
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 10)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)labelsDisabled
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 9)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)roadsDisabled
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 8)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (unint64_t)getSceneState
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1136);
  if (*(unsigned char *)(v2 + 88) && (unsigned __int8 v3 = *(unsigned char *)(v2 + 89) - 1, v3 <= 3u)) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void)setDisableGrid:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 15;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisableRasters:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 14;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setRenderInverseFills:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 12;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisablePolygons:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 10;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisableLabels:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 9;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisableRoads:(BOOL)a3
{
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1128);
  char v7 = 8;
  md::MapEngineSettings::set(v4, &v7, (void *)a3);
  uint64_t v5 = *((void *)self + 48);
  char v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  char v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend(v6, "tapAtPoint:", x, y);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)stopSnappingAnimations
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  id v3 = [v2 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 stopSnappingAnimations];
  }
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  char v6 = objc_msgSend(v5, "isPointValidForGesturing:", x, y);

  return v6;
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "stopPitchingWithFocusPoint:", x, y);
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  char v7 = [(VKMapView *)self currentCanvas];
  id v8 = [v7 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "updatePitchWithFocusPoint:degrees:", x, y, a4);
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  char v7 = [(VKMapView *)self currentCanvas];
  id v8 = [v7 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "updatePitchWithFocusPoint:translation:", x, y, a4);
  }
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "startPitchingWithFocusPoint:", x, y);
  }
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "stopRotatingWithFocusPoint:", x, y);
  }
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  char v7 = [(VKMapView *)self currentCanvas];
  id v8 = [v7 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "updateRotationWithFocusPoint:newValue:", x, y, a4);
  }
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "startRotatingWithFocusPoint:", x, y);
  }
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "stopPanningAtPoint:", x, y);
  }
}

- (void)willStopPanningAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v8 = [(VKMapView *)self currentCanvas];
  id v9 = [v8 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "willStopPanningAtPoint:withVelocity:", v7, v6, x, y);
  }
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "updatePanWithTranslation:", x, y);
  }
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v7 = [(VKMapView *)self currentCanvas];
  id v8 = [v7 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "startPanningAtPoint:panAtStartPoint:", v4, x, y);
  }
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "startPanningAtPoint:panAtStartPoint:", 0, x, y);
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "stopPinchingWithFocusPoint:", x, y);
  }
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = [(VKMapView *)self currentCanvas];
  id v10 = [v9 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v10, "updatePinchWithFocusPoint:oldFactor:newFactor:", x, y, a4, a5);
  }
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = [v5 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "startPinchingWithFocusPoint:", x, y);
  }
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = (void (**)(void))a5;
  id v10 = [(VKMapView *)self currentCanvas];
  uint64_t v11 = [v10 cameraController];

  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__VKMapView_zoom_withFocusPoint_completionHandler___block_invoke;
    v12[3] = &unk_1E5A942C8;
    unint64_t v13 = v9;
    objc_msgSend(v11, "zoom:withFocusPoint:completionHandler:", v12, a3, x, y);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

uint64_t __51__VKMapView_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)zoomToLevel:(double)a3 withFocusPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [(VKMapView *)self currentCanvas];
  id v8 = [v7 cameraController];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "zoomToLevel:withFocusPoint:", a3, x, y);
  }
}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  uint64_t v12 = (VKCameraRegionRestriction *)a3;
  id v8 = a5;
  id v9 = [(VKMapView *)self currentCanvas];
  id v10 = [v9 cameraController];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = v12;
    if (!v12) {
      uint64_t v11 = [[VKCameraRegionRestriction alloc] initWithMapRegion:0];
    }
    uint64_t v12 = v11;
    objc_msgSend(v10, "setRegionRestriction:duration:timingFunction:", a4);
  }
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  id v9 = [(VKMapView *)self currentCanvas];
  id v10 = [v9 cameraController];

  if (objc_opt_respondsToSelector())
  {
    long long v11 = *(_OWORD *)&a3->var0;
    uint64_t v12 = *(void *)&a3->var2;
    [v10 setCenterCoordinateDistanceRange:&v11 duration:v8 timingFunction:a4];
  }
}

- (void)mapController:(id)a3 requestsDisplayRate:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*((void *)self + 48) + 120) + 8) != a4)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v6 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218240;
      id v10 = self;
      __int16 v11 = 2048;
      int64_t v12 = a4;
      _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set requested display rate: %ld", (uint8_t *)&v9, 0x16u);
    }
    double v7 = *(uint64_t **)(*((void *)self + 48) + 120);
    v7[1] = a4;
    uint64_t v8 = *v7;
    if (*v7)
    {
      if (!**(unsigned char **)(v8 + 1056)) {
        md::MapEngine::setDisplayRate(v8, a4);
      }
    }
  }
}

- (void)_updateMapDisplayStyle
{
  uint64_t v3 = (uint64_t)[(VKMapView *)self mapDisplayStyle];
  if ((BYTE2(v3) - 1) > 8u) {
    int v4 = 0;
  }
  else {
    int v4 = byte_1A290011C[(BYTE2(v3) - 1)];
  }
  uint64_t v5 = *((unsigned __int8 *)self + 192);
  if ((v5 - 1) >= 8)
  {
    if (v5 == 9)
    {
      uint64_t v5 = 1;
      uint64_t v6 = 1;
      goto LABEL_6;
    }
    uint64_t v5 = 0;
  }
  uint64_t v6 = *((unsigned __int8 *)self + 193) == 1;
LABEL_6:
  uint64_t v7 = *((unsigned __int8 *)self + 208);
  if ((unint64_t)((unsigned __int16)v3 & 0xFF00) >> 8 != BYTE1(v3)
    || v5 != v4
    || v6 != (v3 & 0xFF000000) >> 24
    || v7 != BYTE4(v3))
  {
    [(VKMapView *)self setMapDisplayStyle:(((unint64_t)((v3 & 0xFF0000000000) == 0x10000000000) << 40) | (v7 << 32) | (v6 << 24) | (v5 << 16)) & 0xFFFFFFFFFFFFLL | (unsigned __int16)v3 & 0xFF00 | v3 animated:1 duration:0.25];
  }
}

- (void)mapDidFinishChangingMapDisplayStyle:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__VKMapView_mapDidFinishChangingMapDisplayStyle___block_invoke;
  v3[3] = &unk_1E5A8C2F8;
  v3[4] = self;
  $6EFE6C6748B912A6EAC8A8E593ED1344 v4 = a3;
  [(VKMapView *)self _postDelegateCallbackBlock:v3];
}

void __49__VKMapView_mapDidFinishChangingMapDisplayStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) didFinishChangingMapDisplayStyle:*(unsigned int *)(a1 + 40) | ((unint64_t)*(unsigned __int16 *)(a1 + 44) << 32)];
  }
}

- (void)map:(id)a3 canShowFlyoverDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (id *)((char *)self + 120);
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v15 = objc_loadWeakRetained(v6);
    [v15 mapLayer:self canShowFlyoverDidChange:v4];
  }
  id v16 = objc_loadWeakRetained(v6);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(VKMapView *)self currentCanvas];
    id v17 = v9;
    if (v4)
    {
      id v10 = [v9 cameraController];
      int v11 = [v10 isPitched];

      if (!v11) {
        return;
      }
      id v18 = objc_loadWeakRetained(v6);
      [v18 mapLayer:self showingFlyoverDidChange:1];
    }
    else
    {
      int64_t v12 = [v9 cameraController];
      int v13 = [v12 isPitched];

      if (!v13) {
        return;
      }
      id v18 = objc_loadWeakRetained(v6);
      [v18 mapLayer:self showingFlyoverDidChange:0];
    }
  }
}

- (void)labelMarkerDidChangeState:(const void *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] labelMarkerDidChangeState", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = *(void *)a3;
  uint64_t v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
  *(void *)&long long buf = *(void *)a3;
  *((void *)&buf + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __39__VKMapView_labelMarkerDidChangeState___block_invoke;
  v10[3] = &unk_1EF58E470;
  v10[4] = self;
  v10[5] = v7;
  int v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(VKMapView *)self _postDelegateCallbackBlock:v10];
  char v8 = v11;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  int v9 = (std::__shared_weak_count *)*((void *)&buf + 1);
  if (*((void *)&buf + 1))
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void __39__VKMapView_labelMarkerDidChangeState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v6 = +[VKLabelMarker markerWithLabelMarker:a1 + 40];
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v3 mapLayer:*(void *)(a1 + 32) labelMarkerDidChangeState:v6];
LABEL_3:

    goto LABEL_4;
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return;
  }
  id v6 = +[VKLabelMarker markerWithLabelMarker:a1 + 40];
  if ([v6 isSelected])
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v3 mapLayer:*(void *)(a1 + 32) selectedLabelMarkerDidChangeState:v6];
    goto LABEL_3;
  }
LABEL_4:
}

- (void)selectedLabelMarkerWillDisappear:(const void *)a3
{
  uint64_t v4 = *(void *)a3;
  id v3 = (std::__shared_weak_count *)*((void *)a3 + 1);
  uint64_t v9 = *(void *)a3;
  id v10 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  void v7[2] = __46__VKMapView_selectedLabelMarkerWillDisappear___block_invoke;
  v7[3] = &unk_1EF58E470;
  v7[4] = self;
  void v7[5] = v4;
  char v8 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(VKMapView *)self _postDelegateCallbackBlock:v7];
  uint64_t v5 = v8;
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  id v6 = v10;
  if (v10)
  {
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void __46__VKMapView_selectedLabelMarkerWillDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v5 = +[VKLabelMarker markerWithLabelMarker:a1 + 40];
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v3 mapLayer:*(void *)(a1 + 32) selectedLabelMarkerWillDisappear:v5];
  }
}

- (void)selectedLabelMarkerDidCompleteLayout:(const void *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] selectedLabelMarkerDidCompleteLayout", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = *(void *)a3;
  id v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
  *(void *)&long long buf = *(void *)a3;
  *((void *)&buf + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __50__VKMapView_selectedLabelMarkerDidCompleteLayout___block_invoke;
  v10[3] = &unk_1EF58E470;
  v10[4] = self;
  v10[5] = v7;
  int v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(VKMapView *)self _postDelegateCallbackBlock:v10];
  char v8 = v11;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)&buf + 1);
  if (*((void *)&buf + 1))
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void __50__VKMapView_selectedLabelMarkerDidCompleteLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v5 = +[VKLabelMarker markerWithLabelMarker:a1 + 40];
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v3 mapLayer:*(void *)(a1 + 32) selectedLabelMarkerDidCompleteLayout:v5];
  }
}

- (void)mapDidReloadStylesheet:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__VKMapView_mapDidReloadStylesheet___block_invoke;
  v3[3] = &unk_1E5A960A0;
  v3[4] = self;
  [(VKMapView *)self _postDelegateCallbackBlock:v3];
}

void __36__VKMapView_mapDidReloadStylesheet___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerDidReloadStylesheet:*(void *)(a1 + 32)];
  }
}

- (void)didFinishLoadingDataWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__VKMapView_didFinishLoadingDataWithError___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

void __43__VKMapView_didFinishLoadingDataWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerDidFailLoadingTiles:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
  }
}

- (void)puckLocationTracingEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__VKMapView_puckLocationTracingEvent___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

void __38__VKMapView_puckLocationTracingEvent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] puckLocationTracingEvent VKNavigationPuckLocationTracingEvent:%@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v7 mapLayer:*(void *)(a1 + 32) puckLocationTracingEvent:*(void *)(a1 + 40)];
  }
}

- (void)injectDebugARUserRouteCoordinate:(PolylineCoordinate)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__VKMapView_injectDebugARUserRouteCoordinate___block_invoke;
  v3[3] = &unk_1E5A8C190;
  v3[4] = self;
  void v3[5] = a3;
  [(VKMapView *)self _postDelegateCallbackBlock:v3];
}

uint64_t __46__VKMapView_injectDebugARUserRouteCoordinate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRouteUserOffset:*(void *)(a1 + 40)];
}

- (void)injectDebugARFeatures:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__VKMapView_injectDebugARFeatures___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

id __35__VKMapView_injectDebugARFeatures___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) setARWalkingFeatureSet:*(void *)(a1 + 40)];
}

- (void)arWalkingElevationRequestFailure:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VKMapView_arWalkingElevationRequestFailure___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

void __46__VKMapView_arWalkingElevationRequestFailure___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] ArWalkingElevationRequestFailure reason:%@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v7 mapLayer:*(void *)(a1 + 32) arWalkingElevationRequestFailure:*(void *)(a1 + 40)];
  }
}

- (void)arWalkingFeatureSetStateDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__VKMapView_arWalkingFeatureSetStateDidUpdate___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

void __47__VKMapView_arWalkingFeatureSetStateDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] ARWalkingFeatureSetStateDidUpdate featureSet:%@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v7 mapLayer:*(void *)(a1 + 32) arWalkingFeatureSetStateDidUpdate:*(void *)(a1 + 40)];
  }
}

- (void)activeARWalkingFeatureDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__VKMapView_activeARWalkingFeatureDidUpdate___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

void __45__VKMapView_activeARWalkingFeatureDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] ActiveARWalkingFeatureDidUpdate info:%@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v7 mapLayer:*(void *)(a1 + 32) activeARWalkingFeatureDidUpdate:*(void *)(a1 + 40)];
  }
}

- (void)muninJunctionDidChange:(const void *)a3 currentRoad:(const void *)a4 localize:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v19 = &unk_1EF559638;
  uint64_t v20 = 0;
  id v17 = &unk_1EF559418;
  id v18 = 0;
  if (a3)
  {
    int v8 = [[VKMuninJunction alloc] initWithMuninJunction:a3 localize:a5];
    uint64_t v9 = v20;
    uint64_t v20 = v8;
  }
  if (a4)
  {
    __int16 v10 = [[VKMuninRoad alloc] initWithMuninRoadEdge:a4 localize:v5];
    uint64_t v11 = v18;
    id v18 = v10;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __57__VKMapView_muninJunctionDidChange_currentRoad_localize___block_invoke;
  v12[3] = &unk_1EF58EA98;
  void v12[4] = self;
  uint64_t v13 = &unk_1EF559638;
  uint64_t v14 = v20;
  id v15 = &unk_1EF559418;
  id v16 = v18;
  [(VKMapView *)self _postDelegateCallbackBlock:v12];
  id v15 = &unk_1EF559418;

  uint64_t v13 = &unk_1EF559638;
  id v17 = &unk_1EF559418;

  unint64_t v19 = &unk_1EF559638;
}

void __57__VKMapView_muninJunctionDidChange_currentRoad_localize___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(id *)(a1 + 48);
      id v7 = *(id *)(a1 + 72);
      int v14 = 134218498;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      int v8 = v4;
      _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Junction didChange:%@ currentRoad:%@", (uint8_t *)&v14, 0x20u);
    }
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 72);
    id v13 = v11;
    [v9 mapLayer:v10 nearestJunctionDidChange:v13 currentRoad:v12];
  }
}

- (void)setFocusedLabelsPolyline:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting focused labels polyline: %@", (uint8_t *)&v6, 0x16u);
  }
  md::LabelSettings_Navigation::setFocusedPolyline((md::LabelSettings_Navigation *)([(VKMapView *)self _labelSettings] + 8), v4);
}

- (VKPolylineOverlay)focusedLabelsPolyline
{
  char v2 = *(void **)(*(void *)(*(void *)([(VKMapView *)self _labelSettings] + 8) + 40) + 200);
  return (VKPolylineOverlay *)v2;
}

- (void)setNavContext:(id)a3
{
  uint64_t v5 = (id *)((char *)self + 320);
  id v6 = a3;
  id v7 = v6;
  if (*v5 != v6)
  {
    objc_storeStrong((id *)self + 40, a3);
    id v6 = *v5;
  }
  if (!v6) {
    [(VKMapView *)self setRouteUserOffset:*MEMORY[0x1E4F64198]];
  }
  [*((id *)self + 33) setNavContext:v7];
}

- (id)routeContext
{
  return *((id *)self + 59);
}

- (void)setRouteContext:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = (VKRouteContext *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v7 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v49 = 134218242;
    size_t v50 = self;
    __int16 v51 = 2112;
    uint64_t v52 = v6;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting route context: %@", (uint8_t *)&v49, 0x16u);
  }
  unsigned __int8 v8 = 0x80;
  id v9 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v10 = v9[2];
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      uint64_t v12 = 0x1BCA10CB9934FB1BLL;
      if (*(void *)&v10 <= 0x1BCA10CB9934FB1BuLL) {
        uint64_t v12 = 0x1BCA10CB9934FB1BuLL % *(void *)&v10;
      }
    }
    else
    {
      uint64_t v12 = (*(void *)&v10 - 1) & 0x1BCA10CB9934FB1BLL;
    }
    id v13 = *(void **)(*(void *)&v9[1] + 8 * v12);
    if (v13)
    {
      int v14 = (void *)*v13;
      if (v14)
      {
        if (v11.u32[0] < 2uLL)
        {
          uint64_t v15 = *(void *)&v10 - 1;
          while (1)
          {
            uint64_t v17 = v14[1];
            if (v17 == 0x1BCA10CB9934FB1BLL)
            {
              if (v14[2] == 0x1BCA10CB9934FB1BLL) {
                goto LABEL_71;
              }
            }
            else if ((v17 & v15) != v12)
            {
              goto LABEL_25;
            }
            int v14 = (void *)*v14;
            if (!v14) {
              goto LABEL_25;
            }
          }
        }
        do
        {
          unint64_t v16 = v14[1];
          if (v16 == 0x1BCA10CB9934FB1BLL)
          {
            if (v14[2] == 0x1BCA10CB9934FB1BLL)
            {
LABEL_71:
              __int16 v18 = (md::TransitLogic *)v14[5];
              goto LABEL_26;
            }
          }
          else
          {
            if (v16 >= *(void *)&v10) {
              v16 %= *(void *)&v10;
            }
            if (v16 != v12) {
              break;
            }
          }
          int v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_25:
  __int16 v18 = 0;
LABEL_26:
  md::TransitLogic::setRouteContext(v18, v6);
  id v19 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v20 = v19[2];
  if (!*(void *)&v20) {
    goto LABEL_46;
  }
  uint8x8_t v21 = (uint8x8_t)vcnt_s8(v20);
  v21.i16[0] = vaddlv_u8(v21);
  if (v21.u32[0] > 1uLL)
  {
    unint64_t v22 = 0xBEC1A12372CEEC00;
    if (*(void *)&v20 <= 0xBEC1A12372CEEC00) {
      unint64_t v22 = 0xBEC1A12372CEEC00 % *(void *)&v20;
    }
  }
  else
  {
    unint64_t v22 = (*(void *)&v20 - 1) & 0xBEC1A12372CEEC00;
  }
  uint64_t v23 = *(void **)(*(void *)&v19[1] + 8 * v22);
  if (!v23 || (uint64_t v24 = (void *)*v23) == 0)
  {
LABEL_46:
    unint64_t v28 = 0;
    goto LABEL_47;
  }
  if (v21.u32[0] < 2uLL)
  {
    uint64_t v25 = *(void *)&v20 - 1;
    while (1)
    {
      uint64_t v27 = v24[1];
      if (v27 == 0xBEC1A12372CEEC00)
      {
        if (v24[2] == 0xBEC1A12372CEEC00) {
          goto LABEL_72;
        }
      }
      else if ((v27 & v25) != v22)
      {
        goto LABEL_46;
      }
      uint64_t v24 = (void *)*v24;
      if (!v24) {
        goto LABEL_46;
      }
    }
  }
  while (1)
  {
    unint64_t v26 = v24[1];
    if (v26 == 0xBEC1A12372CEEC00) {
      break;
    }
    if (v26 >= *(void *)&v20) {
      v26 %= *(void *)&v20;
    }
    if (v26 != v22) {
      goto LABEL_46;
    }
LABEL_36:
    uint64_t v24 = (void *)*v24;
    if (!v24) {
      goto LABEL_46;
    }
  }
  if (v24[2] != 0xBEC1A12372CEEC00) {
    goto LABEL_36;
  }
LABEL_72:
  unint64_t v28 = (md::NavigationLogic *)v24[5];
LABEL_47:
  md::NavigationLogic::setRouteContext(v28, v6);
  if (*((VKRouteContext **)self + 59) != v6) {
    objc_storeStrong((id *)self + 59, a3);
  }
  md::LabelSettings_Navigation::setRouteContext((md::LabelSettings_Navigation *)([(VKMapView *)self _labelSettings] + 8), v6);
  unint64_t v29 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (v29)
  {
    int8x8_t v30 = v29[2];
    if (v30)
    {
      uint8x8_t v31 = (uint8x8_t)vcnt_s8(v30);
      v31.i16[0] = vaddlv_u8(v31);
      if (v31.u32[0] > 1uLL)
      {
        uint64_t v32 = 0x2FED70A4459DFCA1;
        if (*(void *)&v30 <= 0x2FED70A4459DFCA1uLL) {
          uint64_t v32 = 0x2FED70A4459DFCA1uLL % *(void *)&v30;
        }
      }
      else
      {
        uint64_t v32 = (*(void *)&v30 - 1) & 0x2FED70A4459DFCA1;
      }
      id v33 = *(void **)(*(void *)&v29[1] + 8 * v32);
      if (v33)
      {
        uint64_t v34 = (void *)*v33;
        if (v34)
        {
          if (v31.u32[0] < 2uLL)
          {
            uint64_t v35 = *(void *)&v30 - 1;
            while (1)
            {
              uint64_t v37 = v34[1];
              if (v37 == 0x2FED70A4459DFCA1)
              {
                if (v34[2] == 0x2FED70A4459DFCA1) {
                  goto LABEL_73;
                }
              }
              else if ((v37 & v35) != v32)
              {
                goto LABEL_88;
              }
              uint64_t v34 = (void *)*v34;
              if (!v34) {
                goto LABEL_88;
              }
            }
          }
          do
          {
            unint64_t v36 = v34[1];
            if (v36 == 0x2FED70A4459DFCA1)
            {
              if (v34[2] == 0x2FED70A4459DFCA1)
              {
LABEL_73:
                uint64_t v38 = v34[5];
                if (v38)
                {
                  if (v6)
                  {
                    double v39 = [(VKRouteContext *)v6 routeInfo];
                    uint64_t v40 = [v39 route];
                    unsigned int v41 = [v40 transportType];

                    if (v41 >= 7) {
                      unsigned __int8 v8 = 4;
                    }
                    else {
                      unsigned __int8 v8 = 0x50403020100uLL >> (8 * v41);
                    }
                    size_t v42 = [(VKRouteContext *)v6 routeInfo];
                    __int16 v43 = [v42 route];
                    BOOL v44 = v43 == 0;

                    if (v44)
                    {
                      if (([(VKMapView *)self mapDisplayStyle] & 0xFF000000) == 0x1000000) {
                        unsigned __int8 v3 = 3;
                      }
                      else {
                        unsigned __int8 v3 = 0;
                      }
                    }
                    else
                    {
                      size_t v45 = [(VKRouteContext *)v6 routeInfo];
                      uint8x8_t v46 = [v45 route];
                      unint64_t v47 = [v46 source];

                      if (v47 >= 6) {
                        unsigned __int8 v3 = 0;
                      }
                      else {
                        unsigned __int8 v3 = 0x40003020100uLL >> (8 * v47);
                      }
                    }
                    char v48 = 1;
                  }
                  else
                  {
                    char v48 = 0;
                  }
                  md::StyleLogic::setRouteTransportType(v38, v48, v8);
                  md::StyleLogic::setRouteSource(v38, v48, v3);
                }
                break;
              }
            }
            else
            {
              if (v36 >= *(void *)&v30) {
                v36 %= *(void *)&v30;
              }
              if (v36 != v32) {
                break;
              }
            }
            uint64_t v34 = (void *)*v34;
          }
          while (v34);
        }
      }
    }
  }
LABEL_88:
}

- (void)setCurrentLocationText:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218243;
    id v7 = self;
    __int16 v8 = 2113;
    id v9 = v4;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting current location text: %{private}@", (uint8_t *)&v6, 0x16u);
  }
  md::LabelSettings_Navigation::setCurrentLocationText((md::LabelSettings_Navigation *)([(VKMapView *)self _labelSettings] + 8), v4);
}

- (void)setRouteUserOffset:(PolylineCoordinate)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  PolylineCoordinate v10 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218496;
    uint64_t v12 = self;
    __int16 v13 = 1024;
    indedouble x = a3.index;
    __int16 v15 = 2048;
    double offset = a3.offset;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting route user offset: %d.%f", buf, 0x1Cu);
  }
  md::LabelSettings_Navigation::setRouteUserOffset((md::LabelSettings_Navigation *)([(VKMapView *)self _labelSettings] + 8), &v10);
  uint64_t v6 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v7 = *(void *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    unint64_t v9 = 0xBEC1A12372CEEC00;
    if (v7 <= 0xBEC1A12372CEEC00) {
      unint64_t v9 = 0xBEC1A12372CEEC00 % v7;
    }
    __int16 v8 = *(void **)(*(void *)(v6 + 8) + 8 * v9);
    do
    {
      do
        __int16 v8 = (void *)*v8;
      while (v8[1] != 0xBEC1A12372CEEC00);
    }
    while (v8[2] != 0xBEC1A12372CEEC00);
  }
  else
  {
    __int16 v8 = *(void **)(*(void *)(v6 + 8) + 8 * ((v7 - 1) & 0xBEC1A12372CEEC00));
    do
    {
      do
        __int16 v8 = (void *)*v8;
      while (v8[1] != 0xBEC1A12372CEEC00);
    }
    while (v8[2] != 0xBEC1A12372CEEC00);
  }
  *(PolylineCoordinate *)(v8[5] + 200) = a3;
}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(VKMapView *)self currentCanvas];
  [v8 insertOverlay:v6 belowOverlay:v7];

  uint64_t v9 = *(void *)(*((void *)self + 48) + 1128);
  char v12 = 5;
  PolylineCoordinate v10 = [(VKMapView *)self currentCanvas];
  uint8x8_t v11 = [v10 overlays];
  md::MapEngineSettings::set(v9, &v12, (void *)([v11 count] != 0));
}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(VKMapView *)self currentCanvas];
  [v8 insertOverlay:v6 aboveOverlay:v7];

  uint64_t v9 = *(void *)(*((void *)self + 48) + 1128);
  char v12 = 5;
  PolylineCoordinate v10 = [(VKMapView *)self currentCanvas];
  uint8x8_t v11 = [v10 overlays];
  md::MapEngineSettings::set(v9, &v12, (void *)([v11 count] != 0));
}

- (void)removeOverlay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  [v5 removeOverlay:v4];

  uint64_t v6 = *(void *)(*((void *)self + 48) + 1128);
  char v9 = 5;
  id v7 = [(VKMapView *)self currentCanvas];
  __int16 v8 = [v7 overlays];
  md::MapEngineSettings::set(v6, &v9, (void *)([v8 count] != 0));
}

- (void)addOverlay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  [v5 addOverlay:v4];

  uint64_t v6 = *(void *)(*((void *)self + 48) + 1128);
  char v9 = 5;
  id v7 = [(VKMapView *)self currentCanvas];
  __int16 v8 = [v7 overlays];
  md::MapEngineSettings::set(v6, &v9, (void *)([v8 count] != 0));
}

- (void)removePersistentRouteOverlay:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = [(VKMapView *)self targetDisplay];
    if (v6 > 2) {
      id v7 = &stru_1EF593218;
    }
    else {
      id v7 = off_1E5A8C388[v6];
    }
    int v9 = 134218498;
    PolylineCoordinate v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = v7;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Removing persistent route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v8 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView removePersistentRouteOverlay:]");
  md::RouteOverlayContainer::removeOverlay(*(void *)(*(void *)(v8 + 896) + 16), v4, 1);
}

- (void)removeRouteOverlay:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = [(VKMapView *)self targetDisplay];
    if (v6 > 2) {
      id v7 = &stru_1EF593218;
    }
    else {
      id v7 = off_1E5A8C388[v6];
    }
    int v9 = 134218498;
    PolylineCoordinate v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = v7;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Removing route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v8 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView removeRouteOverlay:]");
  md::RouteOverlayContainer::removeOverlay(*(void *)(*(void *)(v8 + 896) + 16), v4, 0);
}

- (void)addRouteOverlay:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = [(VKMapView *)self targetDisplay];
    if (v6 > 2) {
      id v7 = &stru_1EF593218;
    }
    else {
      id v7 = off_1E5A8C388[v6];
    }
    int v9 = 134218498;
    PolylineCoordinate v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = v7;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Adding route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v8 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView addRouteOverlay:]");
  md::RouteOverlayContainer::addOverlay(*(void *)(*(void *)(v8 + 896) + 16), v4, 0);
}

- (BOOL)isAnimatingToTrackAnnotation
{
  char v2 = [(VKMapView *)self currentCanvas];
  unsigned __int8 v3 = [v2 cameraController];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isAnimatingToTrackAnnotation];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)stopTrackingAnnotation
{
  char v2 = [(VKMapView *)self currentCanvas];
  id v3 = [v2 cameraController];

  if (objc_opt_respondsToSelector()) {
    [v3 stopTrackingAnnotation];
  }
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v15 = a3;
  id v12 = a7;
  __int16 v13 = [(VKMapView *)self currentCanvas];
  int v14 = [v13 cameraController];

  if (objc_opt_respondsToSelector()) {
    [v14 startTrackingAnnotation:v15 trackHeading:v10 animated:v9 duration:v12 timingFunction:a6];
  }
}

- (void)setHasVehicleHeading:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(VKMapView *)self currentCanvas];
  id v5 = [v4 cameraController];

  if (objc_opt_respondsToSelector()) {
    [v5 setHasVehicleHeading:v3];
  }
}

- (void)setAnnotationTrackingBehavior:(id *)a3
{
  char v4 = [(VKMapView *)self currentCanvas];
  id v5 = [v4 cameraController];

  if (objc_opt_respondsToSelector())
  {
    long long v6 = *(_OWORD *)&a3->var0;
    uint64_t v7 = *(void *)&a3->var2;
    [v5 setAnnotationTrackingBehavior:&v6];
  }
}

- ($FF918C85BF8E73478720C66798E418D4)annotationTrackingBehavior
{
  char v4 = [(VKMapView *)self currentCanvas];
  id v6 = [v4 cameraController];

  if (objc_opt_respondsToSelector())
  {
    if (v6)
    {
      [v6 annotationTrackingBehavior];
    }
    else
    {
      *(void *)&retstr->unint64_t var0 = 0;
      retstr->double var1 = 0.0;
      *(void *)&retstr->var2 = 0;
    }
  }
  else
  {
    *(_OWORD *)&retstr->unint64_t var0 = VKAnnotationTrackingBehaviorDefault;
    *(void *)&retstr->var2 = 1;
  }

  return result;
}

- (void)setTrackingZoomScale:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set tracking zoom scale: %f", (uint8_t *)&v6, 0x16u);
  }
  [*((id *)self + 33) setZoomScale:a3];
}

- (double)trackingZoomScale
{
  char v2 = (void *)*((void *)self + 33);
  if (!v2) {
    return 1.0;
  }
  [v2 zoomScale];
  return result;
}

- (NSArray)labelMarkers
{
  uint64_t v2 = *(void *)(*(void *)([(VKMapView *)self _labelSettings] + 16) + 24);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  {
    operator new();
  }
  uint64_t v17 = mdm::Allocator::instance(void)::alloc;
  std::recursive_mutex::lock((std::recursive_mutex *)(v2 + 24));
  (*(void (**)(void, uint64_t *))(**(void **)(v2 + 240) + 216))(*(void *)(v2 + 240), &v14);
  std::recursive_mutex::unlock((std::recursive_mutex *)(v2 + 24));
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  char v4 = (void *)[v3 initWithCapacity:(v15 - v14) >> 4];
  uint64_t v5 = v14;
  for (uint64_t i = v15; v5 != i; v5 += 16)
  {
    uint64_t v7 = +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", v5, v14);
    if (v7) {
      [v4 addObject:v7];
    }
  }
  __int16 v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v4, v14);

  uint64_t v9 = v14;
  if (v14)
  {
    uint64_t v10 = v15;
    uint64_t v11 = v14;
    if (v15 != v14)
    {
      do
      {
        id v12 = *(std::__shared_weak_count **)(v10 - 8);
        if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, uint64_t))v12->__on_zero_shared)(v12, v11);
          std::__shared_weak_count::__release_weak(v12);
        }
        v10 -= 16;
      }
      while (v10 != v9);
      uint64_t v11 = v14;
    }
    uint64_t v15 = v9;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v17 + 40))(v17, v11, v16 - v11);
  }
  return (NSArray *)v8;
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 shouldHideOffscreenSelectedAnnotation];

  return v3;
}

- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  double y = a4.y;
  double x = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  uint64_t v16 = (void (**)(void))a7;
  uint64_t v14 = [(VKMapView *)self currentCanvas];
  uint64_t v15 = [v14 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v15, "panWithOffset:relativeToScreenPoint:animated:duration:completionHandler:", v8, v16, v12, v11, x, y, a6);
  }
  else if (v16)
  {
    v16[2]();
  }
}

- (int)flyoverMode
{
  return *((_DWORD *)self + 99);
}

- (void)setFlyoverMode:(int)a3
{
  if (*((_DWORD *)self + 99) == a3) {
    return;
  }
  BOOL v5 = +[MDARController isSupported];
  BOOL v6 = v5;
  if (!*(unsigned char *)(*((void *)self + 48) + 1241))
  {
    BOOL v8 = [(VKMapView *)self currentCanvas];
    uint64_t v9 = (void *)*((void *)self + 6);

    if (v8 != v9) {
      return;
    }
    switch(a3)
    {
      case -1:
        uint64_t v10 = (void *)*((void *)self + 6);
        double v11 = [v10 globeCameraController];
        [v10 setCameraController:v11];

        **(unsigned char **)(*((void *)self + 48) + 1056) = 0;
        double v12 = [*((id *)self + 6) globeCameraController];
        [v12 setTourShouldResumeWhenDoneGesturing:1];

        uint64_t v13 = *(void *)(*((void *)self + 48) + 1128);
        char v35 = 2;
        md::MapEngineSettings::set(v13, &v35, (void *)1);
        goto LABEL_25;
      case 0:
        uint64_t v26 = *(void *)(*((void *)self + 48) + 1128);
        char v35 = 2;
        md::MapEngineSettings::set(v26, &v35, 0);
        if (v6)
        {
          **(unsigned char **)(*((void *)self + 48) + 1056) = 1;
          uint64_t v27 = (void *)*((void *)self + 6);
          unint64_t v28 = [v27 arCameraController];
          [v27 setCameraController:v28];

          if ((*((_DWORD *)self + 99) - 1) > 1)
          {
LABEL_23:
            id v19 = self;
            uint64_t v20 = 10;
            goto LABEL_24;
          }
          [*((id *)self + 50) run:1];
          unint64_t v29 = [*((id *)self + 6) arCameraController];
          int8x8_t v30 = [*((id *)self + 6) globeCameraController];
          objc_msgSend(v29, "trasitionToARModeFromCameraFrame:withDuration:completion:", *(void *)(objc_msgSend(v30, "globeView") + 72) + 8, 0, 0.5);
        }
        else
        {
          unint64_t v29 = [*((id *)self + 6) globeCameraController];
          [v29 setTourShouldResumeWhenDoneGesturing:0];
        }

        goto LABEL_23;
      case 1:
        if (!*((_DWORD *)self + 99))
        {
          uint64_t v14 = [*((id *)self + 6) arCameraController];
          [v14 updateCameraFrameFromARTransform];

          uint64_t v15 = *(void *)(*((void *)self + 48) + 1128);
          char v35 = 2;
          md::MapEngineSettings::set(v15, &v35, 0);
        }
        uint64_t v16 = (void *)*((void *)self + 6);
        uint64_t v17 = [v16 globeCameraController];
        [v16 setCameraController:v17];

        **(unsigned char **)(*((void *)self + 48) + 1056) = 0;
        __int16 v18 = [*((id *)self + 6) globeCameraController];
        [v18 setTourShouldResumeWhenDoneGesturing:1];

        id v19 = self;
        uint64_t v20 = 3;
LABEL_24:
        [(VKMapView *)v19 setMapType:v20];
        goto LABEL_25;
      case 2:
        if (!*((_DWORD *)self + 99))
        {
          uint8x8_t v21 = [*((id *)self + 6) arCameraController];
          [v21 updateCameraFrameFromARTransform];

          uint64_t v22 = *(void *)(*((void *)self + 48) + 1128);
          char v35 = 2;
          md::MapEngineSettings::set(v22, &v35, (void *)1);
        }
        uint64_t v23 = (void *)*((void *)self + 6);
        uint64_t v24 = [v23 globeCameraController];
        [v23 setCameraController:v24];

        **(unsigned char **)(*((void *)self + 48) + 1056) = 0;
        uint64_t v25 = [*((id *)self + 6) globeCameraController];
        [v25 setTourShouldResumeWhenDoneGesturing:0];

        goto LABEL_25;
      default:
LABEL_25:
        *((_DWORD *)self + 99) = a3;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __28__VKMapView_setFlyoverMode___block_invoke_2;
        v31[3] = &unk_1E5A8C2D0;
        v31[4] = self;
        int v32 = a3;
        [(VKMapView *)self _postDelegateCallbackBlock:v31];
        return;
    }
  }
  [*((id *)self + 31) setTourShouldResumeWhenDoneGesturing:!v5];
  if (a3 == -1)
  {
    [(VKMapView *)self stopFlyoverAnimation];
  }
  else
  {
    uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
    char v35 = 2;
    md::MapEngineSettings::set(v7, &v35, 0);
    if ([(VKMapView *)self mapType] != 3) {
      [(VKMapView *)self setMapType:3];
    }
  }
  *((_DWORD *)self + 99) = a3;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __28__VKMapView_setFlyoverMode___block_invoke;
  void v33[3] = &unk_1E5A8C2D0;
  v33[4] = self;
  int v34 = a3;
  [(VKMapView *)self _postDelegateCallbackBlock:v33];
}

void __28__VKMapView_setFlyoverMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) flyoverModeDidChange:*(unsigned int *)(a1 + 40)];
  }
}

void __28__VKMapView_setFlyoverMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) flyoverModeDidChange:*(unsigned int *)(a1 + 40)];
  }
}

- (double)maxPitch
{
  char v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 cameraController];
  [v3 maxPitch];
  double v5 = v4;

  return v5;
}

- (double)minPitch
{
  char v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 cameraController];
  [v3 minPitch];
  double v5 = v4;

  return v5;
}

- (BOOL)isFullyPitched
{
  char v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 cameraController];
  char v4 = [v3 isFullyPitched];

  return v4;
}

- (BOOL)canEnter3DModeFlyoverForTileSize:(int64_t)a3
{
  [(VKMapView *)self currentZoomLevelForTileSize:a3];
  return v3 > 7.5;
}

- (BOOL)supportsGPUFrameCaptureToDestination
{
  return *(unsigned char *)(*(void *)(*(void *)(*((void *)self + 48) + 24) + 8) + 19);
}

- (void)exit3DMode
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Exit 3d mode", (uint8_t *)&v6, 0xCu);
  }
  char v4 = [(VKMapView *)self currentCanvas];
  double v5 = [v4 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 exit3DMode];
  }
}

- (void)enter3DMode
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Enter 3d mode", (uint8_t *)&v6, 0xCu);
  }
  char v4 = [(VKMapView *)self currentCanvas];
  double v5 = [v4 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 enter3DMode];
  }
}

- (void)setSelectedBuildingFeatureIds:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select building feature ids %@", buf, 0x16u);
  }
  if ([v4 isEqualToSet:*((void *)self + 61)]) {
    goto LABEL_69;
  }
  id v6 = v4;
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  uint64_t v9 = (void *)*((void *)self + 61);
  *((void *)self + 61) = v7;

  *(void *)&buf[8] = 0;
  *(void *)&uint8_t buf[16] = 0;
  *(void *)long long buf = &buf[8];
  if (v7)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v10);
          }
          unint64_t v14 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "unsignedIntegerValue", (void)v38);
          uint64_t v15 = (uint64_t *)operator new(0x28uLL);
          uint64_t v16 = v15;
          v15[4] = v14;
          uint64_t v17 = *(uint64_t **)&buf[8];
          __int16 v18 = (uint64_t **)&buf[8];
          id v19 = (uint64_t **)&buf[8];
          if (*(void *)&buf[8])
          {
            while (1)
            {
              while (1)
              {
                id v19 = (uint64_t **)v17;
                unint64_t v20 = v17[4];
                if (v14 >= v20) {
                  break;
                }
                uint64_t v17 = (uint64_t *)*v17;
                __int16 v18 = v19;
                if (!*v19) {
                  goto LABEL_23;
                }
              }
              if (v20 >= v14) {
                break;
              }
              uint64_t v17 = (uint64_t *)v17[1];
              if (!v17)
              {
                __int16 v18 = v19 + 1;
                goto LABEL_23;
              }
            }
            operator delete(v15);
          }
          else
          {
LABEL_23:
            *uint64_t v15 = 0;
            v15[1] = 0;
            v15[2] = (uint64_t)v19;
            void *v18 = v15;
            if (**(void **)buf)
            {
              *(void *)long long buf = **(void **)buf;
              uint64_t v16 = *v18;
            }
            std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&buf[8], v16);
            ++*(void *)&buf[16];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v11);
    }
  }
  uint8x8_t v21 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v22 = v21[2];
  if (!*(void *)&v22) {
    goto LABEL_48;
  }
  uint8x8_t v23 = (uint8x8_t)vcnt_s8(v22);
  v23.i16[0] = vaddlv_u8(v23);
  if (v23.u32[0] > 1uLL)
  {
    uint64_t v24 = 0x1F3242C85D9F2F62;
    if (*(void *)&v22 <= 0x1F3242C85D9F2F62uLL) {
      uint64_t v24 = 0x1F3242C85D9F2F62uLL % *(void *)&v22;
    }
  }
  else
  {
    uint64_t v24 = (*(void *)&v22 - 1) & 0x1F3242C85D9F2F62;
  }
  uint64_t v25 = *(void **)(*(void *)&v21[1] + 8 * v24);
  if (!v25 || (uint64_t v26 = (void *)*v25) == 0)
  {
LABEL_48:
    uint64_t v30 = 0;
    goto LABEL_49;
  }
  if (v23.u32[0] < 2uLL)
  {
    uint64_t v27 = *(void *)&v22 - 1;
    while (1)
    {
      uint64_t v29 = v26[1];
      if (v29 == 0x1F3242C85D9F2F62)
      {
        if (v26[2] == 0x1F3242C85D9F2F62) {
          goto LABEL_70;
        }
      }
      else if ((v29 & v27) != v24)
      {
        goto LABEL_48;
      }
      uint64_t v26 = (void *)*v26;
      if (!v26) {
        goto LABEL_48;
      }
    }
  }
  while (1)
  {
    unint64_t v28 = v26[1];
    if (v28 == 0x1F3242C85D9F2F62) {
      break;
    }
    if (v28 >= *(void *)&v22) {
      v28 %= *(void *)&v22;
    }
    if (v28 != v24) {
      goto LABEL_48;
    }
LABEL_38:
    uint64_t v26 = (void *)*v26;
    if (!v26) {
      goto LABEL_48;
    }
  }
  if (v26[2] != 0x1F3242C85D9F2F62) {
    goto LABEL_38;
  }
LABEL_70:
  uint64_t v30 = v26[5];
LABEL_49:
  if (*(void *)(v30 + 392) == *(void *)&buf[16])
  {
    uint8x8_t v31 = *(void **)(v30 + 376);
    if (v31 != (void *)(v30 + 384))
    {
      int v32 = *(void **)buf;
      while (v31[4] == v32[4])
      {
        id v33 = (void *)v31[1];
        int v34 = v31;
        if (v33)
        {
          do
          {
            uint8x8_t v31 = v33;
            id v33 = (void *)*v33;
          }
          while (v33);
        }
        else
        {
          do
          {
            uint8x8_t v31 = (void *)v34[2];
            BOOL v35 = *v31 == (void)v34;
            int v34 = v31;
          }
          while (!v35);
        }
        unint64_t v36 = (void *)v32[1];
        if (v36)
        {
          do
          {
            uint64_t v37 = v36;
            unint64_t v36 = (void *)*v36;
          }
          while (v36);
        }
        else
        {
          do
          {
            uint64_t v37 = (void *)v32[2];
            BOOL v35 = *v37 == (void)v32;
            int v32 = v37;
          }
          while (!v35);
        }
        int v32 = v37;
        if (v31 == (void *)(v30 + 384)) {
          goto LABEL_68;
        }
      }
      goto LABEL_65;
    }
  }
  else
  {
LABEL_65:
    if ((unsigned char *)(v30 + 376) != buf) {
      std::__tree<objc_object  {objcproto14VKRouteOverlay}*>::__assign_multi<std::__tree_const_iterator<objc_object  {objcproto14VKRouteOverlay}*,std::__tree_node<objc_object  {objcproto14VKRouteOverlay}*,void *> *,long>>((uint64_t **)(v30 + 376), *(void **)buf, &buf[8]);
    }
    std::__tree<objc_object  {objcproto14VKRouteOverlay}*>::__assign_multi<std::__tree_const_iterator<objc_object  {objcproto14VKRouteOverlay}*,std::__tree_node<objc_object  {objcproto14VKRouteOverlay}*,void *> *,long>>((uint64_t **)(v30 + 400), *(void **)(v30 + 376), (void *)(v30 + 384));
    *(unsigned char *)(v30 + 448) = 1;
  }
LABEL_68:
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(*(void **)&buf[8]);
LABEL_69:
}

- (void)deselectVenuePoiFeatureId
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    uint64_t v15 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect venue poi feature", (uint8_t *)&v14, 0xCu);
  }
  id v4 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v5 = v4[2];
  if (v5)
  {
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v7 = 0xEC9B77B4222D22FFLL;
      if (*(void *)&v5 <= 0xEC9B77B4222D22FFLL) {
        unint64_t v7 = 0xEC9B77B4222D22FFLL % *(void *)&v5;
      }
    }
    else
    {
      unint64_t v7 = (*(void *)&v5 - 1) & 0xEC9B77B4222D22FFLL;
    }
    id v8 = *(void **)(*(void *)&v4[1] + 8 * v7);
    if (v8)
    {
      uint64_t v9 = (void *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          uint64_t v10 = *(void *)&v5 - 1;
          while (1)
          {
            uint64_t v12 = v9[1];
            if (v12 == 0xEC9B77B4222D22FFLL)
            {
              if (v9[2] == 0xEC9B77B4222D22FFLL) {
                goto LABEL_26;
              }
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            uint64_t v9 = (void *)*v9;
            if (!v9) {
              return;
            }
          }
        }
        do
        {
          unint64_t v11 = v9[1];
          if (v11 == 0xEC9B77B4222D22FFLL)
          {
            if (v9[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_26:
              uint64_t v13 = v9[5];
              if (v13) {
                *(void *)(v13 + 592) = 0;
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(void *)&v5) {
              v11 %= *(void *)&v5;
            }
            if (v11 != v7) {
              return;
            }
          }
          uint64_t v9 = (void *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setSelectedVenuePoiFeatureId:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  int8x8_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    uint64_t v17 = self;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select venue poi feature id: %llu", (uint8_t *)&v16, 0x16u);
  }
  uint8x8_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = 0xEC9B77B4222D22FFLL;
      if (*(void *)&v7 <= 0xEC9B77B4222D22FFLL) {
        unint64_t v9 = 0xEC9B77B4222D22FFLL % *(void *)&v7;
      }
    }
    else
    {
      unint64_t v9 = (*(void *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
    }
    uint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
    if (v10)
    {
      unint64_t v11 = (void *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          uint64_t v12 = *(void *)&v7 - 1;
          while (1)
          {
            uint64_t v14 = v11[1];
            if (v14 == 0xEC9B77B4222D22FFLL)
            {
              if (v11[2] == 0xEC9B77B4222D22FFLL) {
                goto LABEL_26;
              }
            }
            else if ((v14 & v12) != v9)
            {
              return;
            }
            unint64_t v11 = (void *)*v11;
            if (!v11) {
              return;
            }
          }
        }
        do
        {
          unint64_t v13 = v11[1];
          if (v13 == 0xEC9B77B4222D22FFLL)
          {
            if (v11[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_26:
              uint64_t v15 = v11[5];
              if (v15) {
                *(void *)(v15 + 592) = a3;
              }
              return;
            }
          }
          else
          {
            if (v13 >= *(void *)&v7) {
              v13 %= *(void *)&v7;
            }
            if (v13 != v9) {
              return;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
}

- (void)deselectFeatureId
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v24 = 134217984;
    uint64_t v25 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect feature id", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v4 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView deselectFeatureId]");
  uint64_t v5 = *(void *)(v4 + 896);
  for (uint64_t i = *(void *)(v5 + 32); i != *(void *)(v5 + 40); i += 16)
    (*(void (**)(void))(**(void **)(i + 8) + 96))(*(void *)(i + 8));
  int8x8_t v7 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v8 = v7[2];
  if (!*(void *)&v8) {
    return;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    uint64_t v10 = 0x3B36D43422893971;
    if (*(void *)&v8 <= 0x3B36D43422893971uLL) {
      uint64_t v10 = 0x3B36D43422893971uLL % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v10 = (*(void *)&v8 - 1) & 0x3B36D43422893971;
  }
  int8x8_t v11 = v7[1];
  uint64_t v12 = *(void **)(*(void *)&v11 + 8 * v10);
  if (!v12) {
    goto LABEL_32;
  }
  unint64_t v13 = (void *)*v12;
  if (!v13) {
    goto LABEL_32;
  }
  if (v9.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v15 = v13[1];
      if (v15 == 0x3B36D43422893971)
      {
        if (v13[2] == 0x3B36D43422893971) {
          goto LABEL_29;
        }
      }
      else if ((v15 & (*(void *)&v8 - 1)) != v10)
      {
        goto LABEL_32;
      }
      unint64_t v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_32;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v13[1];
    if (v14 == 0x3B36D43422893971) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_32;
    }
LABEL_18:
    unint64_t v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_32;
    }
  }
  if (v13[2] != 0x3B36D43422893971) {
    goto LABEL_18;
  }
LABEL_29:
  uint64_t v16 = v13[5];
  if (v16 && *(unsigned char *)(v16 + 224)) {
    *(unsigned char *)(v16 + 224) = 0;
  }
LABEL_32:
  if (v9.u32[0] > 1uLL)
  {
    uint64_t v17 = 0x3C2657D301A7BCF4;
    if (*(void *)&v8 <= 0x3C2657D301A7BCF4uLL) {
      uint64_t v17 = 0x3C2657D301A7BCF4uLL % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v17 = (*(void *)&v8 - 1) & 0x3C2657D301A7BCF4;
  }
  __int16 v18 = *(void **)(*(void *)&v11 + 8 * v17);
  if (v18)
  {
    unint64_t v19 = (void *)*v18;
    if (v19)
    {
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v20 = *(void *)&v8 - 1;
        while (1)
        {
          uint64_t v22 = v19[1];
          if (v22 == 0x3C2657D301A7BCF4)
          {
            if (v19[2] == 0x3C2657D301A7BCF4) {
              goto LABEL_52;
            }
          }
          else if ((v22 & v20) != v17)
          {
            return;
          }
          unint64_t v19 = (void *)*v19;
          if (!v19) {
            return;
          }
        }
      }
      do
      {
        unint64_t v21 = v19[1];
        if (v21 == 0x3C2657D301A7BCF4)
        {
          if (v19[2] == 0x3C2657D301A7BCF4)
          {
LABEL_52:
            uint64_t v23 = v19[5];
            if (v23)
            {
              if (*(unsigned char *)(v23 + 128)) {
                *(unsigned char *)(v23 + 128) = 0;
              }
            }
            return;
          }
        }
        else
        {
          if (v21 >= *(void *)&v8) {
            v21 %= *(void *)&v8;
          }
          if (v21 != v17) {
            return;
          }
        }
        unint64_t v19 = (void *)*v19;
      }
      while (v19);
    }
  }
}

- (void)setSelectedFeatureId:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v27 = 134218240;
    unint64_t v28 = self;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select feature id: %llu", (uint8_t *)&v27, 0x16u);
  }
  uint64_t v6 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v6 + 4536), "-[VKMapView setSelectedFeatureId:]");
  uint64_t v7 = *(void *)(v6 + 896);
  for (uint64_t i = *(void *)(v7 + 32); i != *(void *)(v7 + 40); i += 16)
    (*(void (**)(void, unint64_t))(**(void **)(i + 8) + 88))(*(void *)(i + 8), a3);
  uint8x8_t v9 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v10 = v9[2];
  if (!*(void *)&v10) {
    return;
  }
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = 0x3B36D43422893971;
    if (*(void *)&v10 <= 0x3B36D43422893971uLL) {
      uint64_t v13 = 0x3B36D43422893971uLL % *(void *)&v10;
    }
  }
  else
  {
    uint64_t v13 = (*(void *)&v10 - 1) & 0x3B36D43422893971;
  }
  unint64_t v14 = *(void **)(*(void *)&v9[1] + 8 * v13);
  if (!v14) {
    goto LABEL_33;
  }
  uint64_t v15 = (void *)*v14;
  if (!v15) {
    goto LABEL_33;
  }
  if (v11.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v17 = v15[1];
      if (v17 == 0x3B36D43422893971)
      {
        if (v15[2] == 0x3B36D43422893971) {
          goto LABEL_29;
        }
      }
      else if ((v17 & (*(void *)&v10 - 1)) != v13)
      {
        goto LABEL_31;
      }
      uint64_t v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v16 = v15[1];
    if (v16 == 0x3B36D43422893971) {
      break;
    }
    if (v16 >= *(void *)&v10) {
      v16 %= *(void *)&v10;
    }
    if (v16 != v13) {
      goto LABEL_31;
    }
LABEL_18:
    uint64_t v15 = (void *)*v15;
    if (!v15) {
      goto LABEL_31;
    }
  }
  if (v15[2] != 0x3B36D43422893971) {
    goto LABEL_18;
  }
LABEL_29:
  uint64_t v18 = v15[5];
  if (v18)
  {
    *(void *)(v18 + 216) = a3;
    *(unsigned char *)(v18 + 224) = 1;
    int8x8_t v10 = v9[2];
  }
LABEL_31:
  if (!*(void *)&v10) {
    return;
  }
  uint8x8_t v19 = (uint8x8_t)vcnt_s8(v10);
  v19.i16[0] = vaddlv_u8(v19);
  unint64_t v12 = v19.u32[0];
LABEL_33:
  if (v12 > 1)
  {
    uint64_t v20 = 0x3C2657D301A7BCF4;
    if (*(void *)&v10 <= 0x3C2657D301A7BCF4uLL) {
      uint64_t v20 = 0x3C2657D301A7BCF4uLL % *(void *)&v10;
    }
  }
  else
  {
    uint64_t v20 = (*(void *)&v10 - 1) & 0x3C2657D301A7BCF4;
  }
  unint64_t v21 = *(void **)(*(void *)&v9[1] + 8 * v20);
  if (v21)
  {
    uint64_t v22 = (void *)*v21;
    if (v22)
    {
      if (v12 < 2)
      {
        uint64_t v23 = *(void *)&v10 - 1;
        while (1)
        {
          uint64_t v25 = v22[1];
          if (v25 == 0x3C2657D301A7BCF4)
          {
            if (v22[2] == 0x3C2657D301A7BCF4) {
              goto LABEL_53;
            }
          }
          else if ((v25 & v23) != v20)
          {
            return;
          }
          uint64_t v22 = (void *)*v22;
          if (!v22) {
            return;
          }
        }
      }
      do
      {
        unint64_t v24 = v22[1];
        if (v24 == 0x3C2657D301A7BCF4)
        {
          if (v22[2] == 0x3C2657D301A7BCF4)
          {
LABEL_53:
            uint64_t v26 = v22[5];
            if (v26)
            {
              *(void *)(v26 + 120) = a3;
              *(unsigned char *)(v26 + 128) = 1;
            }
            return;
          }
        }
        else
        {
          if (v24 >= *(void *)&v10) {
            v24 %= *(void *)&v10;
          }
          if (v24 != v20) {
            return;
          }
        }
        uint64_t v22 = (void *)*v22;
      }
      while (v22);
    }
  }
}

- (void)deselectTrails
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v15 = 134217984;
    unint64_t v16 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect trails", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v4 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v5 = v4[2];
  if (v5)
  {
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v7 = 0xC74495586E0C32F6;
      if (*(void *)&v5 <= 0xC74495586E0C32F6) {
        unint64_t v7 = 0xC74495586E0C32F6 % *(void *)&v5;
      }
    }
    else
    {
      unint64_t v7 = (*(void *)&v5 - 1) & 0xC74495586E0C32F6;
    }
    int8x8_t v8 = *(void **)(*(void *)&v4[1] + 8 * v7);
    if (v8)
    {
      uint8x8_t v9 = (void *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          uint64_t v10 = *(void *)&v5 - 1;
          while (1)
          {
            uint64_t v12 = v9[1];
            if (v12 == 0xC74495586E0C32F6)
            {
              if (v9[2] == 0xC74495586E0C32F6) {
                goto LABEL_26;
              }
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            uint8x8_t v9 = (void *)*v9;
            if (!v9) {
              return;
            }
          }
        }
        do
        {
          unint64_t v11 = v9[1];
          if (v11 == 0xC74495586E0C32F6)
          {
            if (v9[2] == 0xC74495586E0C32F6)
            {
LABEL_26:
              uint64_t v13 = (md::HikingLogic *)v9[5];
              if (v13)
              {
                md::HikingLogic::deselectTrails(v13);
                uint64_t v14 = *((void *)self + 48);
                LOBYTE(v15) = 1;
                md::MapEngine::setNeedsTick(v14, &v15);
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(void *)&v5) {
              v11 %= *(void *)&v5;
            }
            if (v11 != v7) {
              return;
            }
          }
          uint8x8_t v9 = (void *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v10 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v22 = 134218240;
    uint64_t v23 = self;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select trail ID: %llu", (uint8_t *)&v22, 0x16u);
  }
  unint64_t v11 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v12 = v11[2];
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v14 = 0xC74495586E0C32F6;
      if (*(void *)&v12 <= 0xC74495586E0C32F6) {
        unint64_t v14 = 0xC74495586E0C32F6 % *(void *)&v12;
      }
    }
    else
    {
      unint64_t v14 = (*(void *)&v12 - 1) & 0xC74495586E0C32F6;
    }
    int v15 = *(void **)(*(void *)&v11[1] + 8 * v14);
    if (v15)
    {
      unint64_t v16 = (void *)*v15;
      if (v16)
      {
        if (v13.u32[0] < 2uLL)
        {
          uint64_t v17 = *(void *)&v12 - 1;
          while (1)
          {
            uint64_t v19 = v16[1];
            if (v19 == 0xC74495586E0C32F6)
            {
              if (v16[2] == 0xC74495586E0C32F6) {
                goto LABEL_26;
              }
            }
            else if ((v19 & v17) != v14)
            {
              goto LABEL_28;
            }
            unint64_t v16 = (void *)*v16;
            if (!v16) {
              goto LABEL_28;
            }
          }
        }
        do
        {
          unint64_t v18 = v16[1];
          if (v18 == 0xC74495586E0C32F6)
          {
            if (v16[2] == 0xC74495586E0C32F6)
            {
LABEL_26:
              uint64_t v20 = (md::HikingLogic *)v16[5];
              if (v20)
              {
                md::HikingLogic::setSelectedTrail(v20, a3, (const char *)[v8 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
                uint64_t v21 = *((void *)self + 48);
                LOBYTE(v22) = 1;
                md::MapEngine::setNeedsTick(v21, &v22);
              }
              break;
            }
          }
          else
          {
            if (v18 >= *(void *)&v12) {
              v18 %= *(void *)&v12;
            }
            if (v18 != v14) {
              break;
            }
          }
          unint64_t v16 = (void *)*v16;
        }
        while (v16);
      }
    }
  }
LABEL_28:
}

- (void)setSelectedTrailId:(unint64_t)a3
{
}

- (void)deselectTransitLineMarker
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v15 = 134217984;
    unint64_t v16 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect transit line marker", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v4 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v5 = v4[2];
  if (v5)
  {
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      uint64_t v7 = 0x1BCA10CB9934FB1BLL;
      if (*(void *)&v5 <= 0x1BCA10CB9934FB1BuLL) {
        uint64_t v7 = 0x1BCA10CB9934FB1BuLL % *(void *)&v5;
      }
    }
    else
    {
      uint64_t v7 = (*(void *)&v5 - 1) & 0x1BCA10CB9934FB1BLL;
    }
    id v8 = *(void **)(*(void *)&v4[1] + 8 * v7);
    if (v8)
    {
      id v9 = (void *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          uint64_t v10 = *(void *)&v5 - 1;
          while (1)
          {
            uint64_t v12 = v9[1];
            if (v12 == 0x1BCA10CB9934FB1BLL)
            {
              if (v9[2] == 0x1BCA10CB9934FB1BLL) {
                goto LABEL_26;
              }
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            id v9 = (void *)*v9;
            if (!v9) {
              return;
            }
          }
        }
        do
        {
          unint64_t v11 = v9[1];
          if (v11 == 0x1BCA10CB9934FB1BLL)
          {
            if (v9[2] == 0x1BCA10CB9934FB1BLL)
            {
LABEL_26:
              uint8x8_t v13 = (md::TransitLogic *)v9[5];
              if (v13)
              {
                md::TransitLogic::setSelectedLines(v13, 0);
                uint64_t v14 = *((void *)self + 48);
                LOBYTE(v15) = 1;
                md::MapEngine::setNeedsTick(v14, &v15);
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(void *)&v5) {
              v11 %= *(void *)&v5;
            }
            if (v11 != v7) {
              return;
            }
          }
          id v9 = (void *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)selectTransitLineMarker:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (VKTransitLineMarker *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  int8x8_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v17 = 134218242;
    unint64_t v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select transit line marker: %@", (uint8_t *)&v17, 0x16u);
  }
  uint8x8_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      uint64_t v9 = 0x1BCA10CB9934FB1BLL;
      if (*(void *)&v7 <= 0x1BCA10CB9934FB1BuLL) {
        uint64_t v9 = 0x1BCA10CB9934FB1BuLL % *(void *)&v7;
      }
    }
    else
    {
      uint64_t v9 = (*(void *)&v7 - 1) & 0x1BCA10CB9934FB1BLL;
    }
    uint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
    if (v10)
    {
      unint64_t v11 = (void *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          uint64_t v12 = *(void *)&v7 - 1;
          while (1)
          {
            uint64_t v14 = v11[1];
            if (v14 == 0x1BCA10CB9934FB1BLL)
            {
              if (v11[2] == 0x1BCA10CB9934FB1BLL) {
                goto LABEL_26;
              }
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_28;
            }
            unint64_t v11 = (void *)*v11;
            if (!v11) {
              goto LABEL_28;
            }
          }
        }
        do
        {
          unint64_t v13 = v11[1];
          if (v13 == 0x1BCA10CB9934FB1BLL)
          {
            if (v11[2] == 0x1BCA10CB9934FB1BLL)
            {
LABEL_26:
              int v15 = (md::TransitLogic *)v11[5];
              if (v15)
              {
                md::TransitLogic::setSelectedLines(v15, v4);
                uint64_t v16 = *((void *)self + 48);
                LOBYTE(v17) = 1;
                md::MapEngine::setNeedsTick(v16, &v17);
              }
              break;
            }
          }
          else
          {
            if (v13 >= *(void *)&v7) {
              v13 %= *(void *)&v7;
            }
            if (v13 != v9) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_28:
}

- (id)selectedTransitLineIDs
{
  double v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_25;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0x1BCA10CB9934FB1BLL;
    if (*(void *)&v4 <= 0x1BCA10CB9934FB1BuLL) {
      uint64_t v6 = 0x1BCA10CB9934FB1BuLL % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v4 - 1) & 0x1BCA10CB9934FB1BLL;
  }
  int8x8_t v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
  if (!v7) {
    goto LABEL_25;
  }
  uint8x8_t v8 = (void *)*v7;
  if (!v8) {
    goto LABEL_25;
  }
  if (v5.u32[0] < 2uLL)
  {
    uint64_t v9 = *(void *)&v4 - 1;
    while (1)
    {
      uint64_t v11 = v8[1];
      if (v11 == 0x1BCA10CB9934FB1BLL)
      {
        if (v8[2] == 0x1BCA10CB9934FB1BLL) {
          goto LABEL_22;
        }
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_25;
      }
      uint8x8_t v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_25;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = v8[1];
    if (v10 == 0x1BCA10CB9934FB1BLL) {
      break;
    }
    if (v10 >= *(void *)&v4) {
      v10 %= *(void *)&v4;
    }
    if (v10 != v6) {
      goto LABEL_25;
    }
LABEL_11:
    uint8x8_t v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_25;
    }
  }
  if (v8[2] != 0x1BCA10CB9934FB1BLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v12 = v8[5];
  if (!v12)
  {
LABEL_25:
    int v15 = 0;
    goto LABEL_26;
  }
  uint64_t v43 = 0;
  unint64_t v44 = 0;
  uint64_t v13 = *(void *)(v12 + 264);
  size_t prime = *(void *)(v12 + 240);
  uint64_t v45 = *(void *)(v12 + 248);
  uint8x8_t v46 = 0;
  uint64_t v47 = v13;
  unint64_t v48 = 0;
  float v49 = *(float *)(v12 + 280);
  if (prime == 1)
  {
    size_t prime = 2;
    goto LABEL_33;
  }
  if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
    int8x8_t v17 = (int8x8_t)v44;
  }
  else
  {
    int8x8_t v17 = 0;
  }
  if (prime > *(void *)&v17) {
LABEL_33:
  }
    std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v43, prime);
  unint64_t v18 = *(void **)(v12 + 256);
  if (v18)
  {
    while (2)
    {
      unint64_t v19 = v18[2];
      unint64_t v20 = v44;
      if (v44)
      {
        uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v44);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          unint64_t v2 = v18[2];
          if (v19 >= v44) {
            unint64_t v2 = v19 % v44;
          }
        }
        else
        {
          unint64_t v2 = (v44 - 1) & v19;
        }
        int v22 = *(void **)(v43 + 8 * v2);
        if (v22)
        {
          uint64_t v23 = (void *)*v22;
          if (v23)
          {
            if (v21.u32[0] < 2uLL)
            {
              while (1)
              {
                uint64_t v25 = v23[1];
                if (v25 == v19)
                {
                  if (v23[2] == v19) {
                    goto LABEL_93;
                  }
                }
                else if ((v25 & (v44 - 1)) != v2)
                {
                  goto LABEL_55;
                }
                uint64_t v23 = (void *)*v23;
                if (!v23) {
                  goto LABEL_55;
                }
              }
            }
            do
            {
              unint64_t v24 = v23[1];
              if (v24 == v19)
              {
                if (v23[2] == v19) {
                  goto LABEL_93;
                }
              }
              else
              {
                if (v24 >= v44) {
                  v24 %= v44;
                }
                if (v24 != v2) {
                  break;
                }
              }
              uint64_t v23 = (void *)*v23;
            }
            while (v23);
          }
        }
      }
LABEL_55:
      uint64_t v26 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v47 + 16))(v47, 24, 8);
      *uint64_t v26 = 0;
      v26[1] = v19;
      v26[2] = v18[2];
      float v27 = (float)(v48 + 1);
      if (!v20 || (float)(v49 * (float)v20) < v27)
      {
        BOOL v28 = (v20 & (v20 - 1)) != 0;
        if (v20 < 3) {
          BOOL v28 = 1;
        }
        unint64_t v29 = v28 | (2 * v20);
        unint64_t v30 = vcvtps_u32_f32(v27 / v49);
        if (v29 <= v30) {
          size_t v31 = v30;
        }
        else {
          size_t v31 = v29;
        }
        if (v31 == 1)
        {
          size_t v31 = 2;
        }
        else if ((v31 & (v31 - 1)) != 0)
        {
          size_t v31 = std::__next_prime(v31);
        }
        int8x8_t v32 = (int8x8_t)v44;
        if (v31 > v44) {
          goto LABEL_67;
        }
        if (v31 < v44)
        {
          unint64_t v33 = vcvtps_u32_f32((float)v48 / v49);
          if (v44 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v44), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
          {
            unint64_t v33 = std::__next_prime(v33);
          }
          else
          {
            uint64_t v35 = 1 << -(char)__clz(v33 - 1);
            if (v33 >= 2) {
              unint64_t v33 = v35;
            }
          }
          if (v31 <= v33) {
            size_t v31 = v33;
          }
          if (v31 < *(void *)&v32) {
LABEL_67:
          }
            std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v43, v31);
        }
        unint64_t v20 = v44;
        if ((v44 & (v44 - 1)) != 0)
        {
          if (v19 >= v44) {
            unint64_t v2 = v19 % v44;
          }
          else {
            unint64_t v2 = v19;
          }
        }
        else
        {
          unint64_t v2 = (v44 - 1) & v19;
        }
      }
      unint64_t v36 = *(void **)(v43 + 8 * v2);
      if (v36)
      {
        *uint64_t v26 = *v36;
        goto LABEL_91;
      }
      *uint64_t v26 = v46;
      uint8x8_t v46 = v26;
      *(void *)(v43 + 8 * v2) = &v46;
      if (*v26)
      {
        unint64_t v37 = *(void *)(*v26 + 8);
        if ((v20 & (v20 - 1)) != 0)
        {
          if (v37 >= v20) {
            v37 %= v20;
          }
        }
        else
        {
          v37 &= v20 - 1;
        }
        unint64_t v36 = (void *)(v43 + 8 * v37);
LABEL_91:
        *unint64_t v36 = v26;
      }
      ++v48;
LABEL_93:
      unint64_t v18 = (void *)*v18;
      if (!v18) {
        break;
      }
      continue;
    }
  }
  int v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v48];
  long long v38 = v46;
  if (v46)
  {
    do
    {
      long long v39 = [NSNumber numberWithUnsignedLongLong:v38[2]];
      [v15 addObject:v39];

      long long v38 = (void *)*v38;
    }
    while (v38);
    long long v40 = v46;
    if (v46)
    {
      do
      {
        long long v41 = (void *)*v40;
        (*(void (**)(uint64_t))(*(void *)v47 + 40))(v47);
        long long v40 = v41;
      }
      while (v41);
    }
  }
  uint64_t v42 = v43;
  uint64_t v43 = 0;
  if (v42) {
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v45 + 40))(v45, v42, 8 * v44);
  }
LABEL_26:
  return v15;
}

- (id)transitLineMarkersForSelectionAtPoint:(CGPoint)a3
{
  double v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_27;
  }
  double y = a3.y;
  double x = a3.x;
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v4);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    uint64_t v9 = 0x1BCA10CB9934FB1BLL;
    if (*(void *)&v4 <= 0x1BCA10CB9934FB1BuLL) {
      uint64_t v9 = 0x1BCA10CB9934FB1BuLL % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v9 = (*(void *)&v4 - 1) & 0x1BCA10CB9934FB1BLL;
  }
  unint64_t v10 = *(void **)(*(void *)&v3[1] + 8 * v9);
  if (!v10) {
    goto LABEL_27;
  }
  uint64_t v11 = (void *)*v10;
  if (!v11) {
    goto LABEL_27;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v4 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == 0x1BCA10CB9934FB1BLL)
      {
        if (v11[2] == 0x1BCA10CB9934FB1BLL) {
          goto LABEL_22;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_27;
      }
      uint64_t v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_27;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == 0x1BCA10CB9934FB1BLL) {
      break;
    }
    if (v13 >= *(void *)&v4) {
      v13 %= *(void *)&v4;
    }
    if (v13 != v9) {
      goto LABEL_27;
    }
LABEL_11:
    uint64_t v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_27;
    }
  }
  if (v11[2] != 0x1BCA10CB9934FB1BLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v15 = v11[5];
  if (!v15)
  {
LABEL_27:
    uint64_t v25 = 0;
    goto LABEL_28;
  }
  uint64_t v16 = [(VKMapView *)self currentCanvas];
  int8x8_t v17 = [v16 cameraController];

  if (v17 && ([v17 vkCamera], unint64_t v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    [*(id *)(*((void *)self + 48) + 840) size];
    double v20 = v19;
    [*(id *)(*((void *)self + 48) + 840) size];
    double v22 = v21;
    uint64_t v23 = [v17 vkCamera];
    unint64_t v24 = v23;
    if (v23) {
      objc_msgSend(v23, "groundPointFromScreenPoint:", x / v20, 1.0 - y / v22);
    }
    else {
      memset(v33, 0, sizeof(v33));
    }

    md::TransitLogic::getTransitLineMarkersForSelectionAtGroundPoint(&__p, *(float64x2_t ***)(v15 + 168), *(float64x2_t ***)(v15 + 176), (float64x2_t *)&v33[0].f64[1]);
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
    float v27 = (char *)__p;
    if (__p)
    {
      BOOL v28 = v32;
      unint64_t v29 = __p;
      if (v32 != __p)
      {
        do
        {
          unint64_t v30 = (void *)*((void *)v28 - 1);
          v28 -= 8;
        }
        while (v28 != v27);
        unint64_t v29 = __p;
      }
      int8x8_t v32 = v27;
      operator delete(v29);
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

LABEL_28:
  return v25;
}

- (id)transitLineMarkersInCurrentViewport
{
  double v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_25;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0x1BCA10CB9934FB1BLL;
    if (*(void *)&v4 <= 0x1BCA10CB9934FB1BuLL) {
      uint64_t v6 = 0x1BCA10CB9934FB1BuLL % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v4 - 1) & 0x1BCA10CB9934FB1BLL;
  }
  int8x8_t v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
  if (!v7) {
    goto LABEL_25;
  }
  uint8x8_t v8 = (void *)*v7;
  if (!v8) {
    goto LABEL_25;
  }
  if (v5.u32[0] < 2uLL)
  {
    uint64_t v9 = *(void *)&v4 - 1;
    while (1)
    {
      uint64_t v11 = v8[1];
      if (v11 == 0x1BCA10CB9934FB1BLL)
      {
        if (v8[2] == 0x1BCA10CB9934FB1BLL) {
          goto LABEL_22;
        }
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_25;
      }
      uint8x8_t v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_25;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = v8[1];
    if (v10 == 0x1BCA10CB9934FB1BLL) {
      break;
    }
    if (v10 >= *(void *)&v4) {
      v10 %= *(void *)&v4;
    }
    if (v10 != v6) {
      goto LABEL_25;
    }
LABEL_11:
    uint8x8_t v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_25;
    }
  }
  if (v8[2] != 0x1BCA10CB9934FB1BLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v12 = (double *)v8[5];
  if (v12)
  {
    v128 = 0;
    unint64_t v129 = 0;
    v127 = 0;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)char v131 = 0u;
    float v132 = 1.0;
    unint64_t v13 = (uint64_t *)*((void *)v12 + 21);
    uint64_t v124 = *((void *)v12 + 22);
    if (v13 != (uint64_t *)v124)
    {
      unsigned int v125 = v12;
      while (2)
      {
        uint64_t v16 = *v13;
        double v17 = v12[71];
        double v18 = *(double *)(*v13 + 1296);
        if (v17 > v18)
        {
          double v19 = v125[69];
          double v20 = *(double *)(v16 + 1312);
          if (v19 < v20)
          {
            double v21 = v125[72];
            double v22 = *(double *)(v16 + 1304);
            if (v21 > v22)
            {
              double v23 = v125[70];
              double v24 = *(double *)(v16 + 1320);
              if (v23 < v24)
              {
                unint64_t v25 = 0;
                double v26 = v20 - v18;
                double v27 = v24 - v22;
                float v28 = (v19 - v18) / v26;
                float v29 = (v21 - v22) / v27;
                float v30 = (v17 - v18) / v26;
                float v31 = (v23 - v22) / v27;
                float v32 = v31 - v29;
                float v33 = v28 - v30;
                for (i = *v13; ; uint64_t v16 = i)
                {
                  if (v25 >= geo::codec::VectorTile::transitLinkCount(*(geo::codec::VectorTile **)(v16 + 720))) {
                    goto LABEL_29;
                  }
                  uint64_t v34 = geo::codec::VectorTile::transitLinks(*(geo::codec::VectorTile **)(v16 + 720));
                  uint64_t v35 = v34 + 184 * v25;
                  if (*(_DWORD *)(v35 + 20))
                  {
                    uint64_t v36 = 0;
                    while (1)
                    {
                      v133[0] = 0;
                      unint64_t v37 = (float *)geo::codec::transitLinkPoints(v35, v36, v133);
                      uint64_t v38 = v133[0] - 1;
                      if (v133[0] > 1uLL) {
                        break;
                      }
LABEL_39:
                      if (++v36 >= (unint64_t)*(unsigned int *)(v35 + 20)) {
                        goto LABEL_35;
                      }
                    }
                    float v39 = *v37;
                    float v40 = v37[1];
                    long long v41 = v37 + 3;
                    while (1)
                    {
                      BOOL v47 = v39 >= v28 && v39 < v30;
                      BOOL v48 = !v47 || v40 < v31;
                      if (!v48 && v40 < v29) {
                        break;
                      }
                      float v50 = *(v41 - 1);
                      float v51 = v50 - v39;
                      float v52 = *v41;
                      float v53 = *v41 - v40;
                      float v54 = v50 - v28;
                      float v55 = *v41 - v29;
                      if ((float)(v53 * v33) != 0.0)
                      {
                        float v56 = 1.0 / (float)(v53 * v33);
                        float v57 = (float)(v56 * v33) * v55;
                        float v58 = v54 * v53;
                        if (v57 >= 0.0 && v57 <= 1.0)
                        {
                          float v60 = (float)-(float)(v58 - (float)(v55 * v51)) * v56;
                          if (v60 >= 0.0 && v60 <= 1.0) {
                            break;
                          }
                        }
                        float v62 = (float)(v56 * v33) * (float)(v52 - v31);
                        if (v62 >= 0.0 && v62 <= 1.0)
                        {
                          float v64 = (float)-(float)(v58 - (float)((float)(v52 - v31) * v51)) * v56;
                          if (v64 >= 0.0 && v64 <= 1.0) {
                            break;
                          }
                        }
                      }
                      if ((float)(v51 * v32) != 0.0)
                      {
                        float v66 = 1.0 / (float)(v51 * v32);
                        float v67 = (float)(v66 * v32) * v54;
                        float v68 = v55 * v51;
                        if (v67 >= 0.0 && v67 <= 1.0)
                        {
                          float v70 = (float)(v68 - (float)(v54 * v53)) * v66;
                          if (v70 >= 0.0 && v70 <= 1.0) {
                            break;
                          }
                        }
                        float v42 = (float)(v66 * v32) * (float)(v50 - v30);
                        float v43 = (float)(v68 - (float)((float)(v50 - v30) * v53)) * v66;
                        BOOL v44 = v43 > 1.0 || v43 < 0.0;
                        BOOL v45 = !v44 && v42 <= 1.0;
                        if (v45 && v42 >= 0.0) {
                          break;
                        }
                      }
                      v41 += 2;
                      float v40 = v52;
                      float v39 = v50;
                      if (!--v38) {
                        goto LABEL_39;
                      }
                    }
                    unint64_t v72 = v34 + 184 * v25;
                    uint64_t v74 = *(void *)(v72 + 32);
                    uint64_t v73 = (void *)(v72 + 32);
                    if (v74) {
                      break;
                    }
                  }
LABEL_35:
                  ++v25;
                }
                uint64_t v75 = 0;
                while (1)
                {
                  unint64_t v76 = geo::codec::vectorTransitLineAlongLink((void *)v35, v75);
                  unint64_t v77 = v76;
                  unint64_t v78 = (unint64_t)__p[1];
                  if (__p[1])
                  {
                    uint8x8_t v79 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
                    v79.i16[0] = vaddlv_u8(v79);
                    if (v79.u32[0] > 1uLL)
                    {
                      unint64_t v2 = v76;
                      if (__p[1] <= (void *)v76) {
                        unint64_t v2 = v76 % (unint64_t)__p[1];
                      }
                    }
                    else
                    {
                      unint64_t v2 = ((unint64_t)__p[1] - 1) & v76;
                    }
                    v80 = (void *)*((void *)__p[0] + v2);
                    if (v80)
                    {
                      v81 = (void *)*v80;
                      if (v81)
                      {
                        if (v79.u32[0] < 2uLL)
                        {
                          while (1)
                          {
                            uint64_t v85 = v81[1];
                            if (v85 == v76)
                            {
                              if (v76 == v81[2] && v35 == v81[3]) {
                                goto LABEL_182;
                              }
                            }
                            else if ((v85 & ((uint64_t)__p[1] - 1)) != v2)
                            {
                              goto LABEL_122;
                            }
                            v81 = (void *)*v81;
                            if (!v81) {
                              goto LABEL_122;
                            }
                          }
                        }
                        do
                        {
                          unint64_t v83 = v81[1];
                          if (v83 == v76)
                          {
                            if (v76 == v81[2] && v35 == v81[3]) {
                              goto LABEL_182;
                            }
                          }
                          else
                          {
                            if ((void *)v83 >= __p[1]) {
                              v83 %= (unint64_t)__p[1];
                            }
                            if (v83 != v2) {
                              break;
                            }
                          }
                          v81 = (void *)*v81;
                        }
                        while (v81);
                      }
                    }
                  }
LABEL_122:
                  v86 = operator new(0x20uLL);
                  void *v86 = 0;
                  v86[1] = v77;
                  v86[2] = v77;
                  v86[3] = v35;
                  float v87 = (float)((unint64_t)v131[1] + 1);
                  if (!v78 || (float)(v132 * (float)v78) < v87) {
                    break;
                  }
LABEL_172:
                  id v108 = __p[0];
                  char v109 = (void *)*((void *)__p[0] + v2);
                  if (v109)
                  {
                    void *v86 = *v109;
                  }
                  else
                  {
                    void *v86 = v131[0];
                    v131[0] = v86;
                    v108[v2] = v131;
                    if (!*v86) {
                      goto LABEL_181;
                    }
                    unint64_t v110 = *(void *)(*v86 + 8);
                    if ((v78 & (v78 - 1)) != 0)
                    {
                      if (v110 >= v78) {
                        v110 %= v78;
                      }
                    }
                    else
                    {
                      v110 &= v78 - 1;
                    }
                    char v109 = (char *)__p[0] + 8 * v110;
                  }
                  *char v109 = v86;
LABEL_181:
                  ++v131[1];
LABEL_182:
                  if ((unint64_t)++v75 >= *v73) {
                    goto LABEL_35;
                  }
                }
                BOOL v88 = (v78 & (v78 - 1)) != 0;
                if (v78 < 3) {
                  BOOL v88 = 1;
                }
                unint64_t v89 = v88 | (2 * v78);
                unint64_t v90 = vcvtps_u32_f32(v87 / v132);
                if (v89 <= v90) {
                  size_t prime = v90;
                }
                else {
                  size_t prime = v89;
                }
                if (prime == 1)
                {
                  size_t prime = 2;
                }
                else if ((prime & (prime - 1)) != 0)
                {
                  size_t prime = std::__next_prime(prime);
                  unint64_t v78 = (unint64_t)__p[1];
                }
                if (prime <= v78)
                {
                  if (prime >= v78) {
                    goto LABEL_159;
                  }
                  unint64_t v102 = vcvtps_u32_f32((float)(unint64_t)v131[1] / v132);
                  if (v78 < 3
                    || (uint8x8_t v103 = (uint8x8_t)vcnt_s8((int8x8_t)v78), v103.i16[0] = vaddlv_u8(v103), v103.u32[0] > 1uLL))
                  {
                    unint64_t v102 = std::__next_prime(v102);
                  }
                  else
                  {
                    uint64_t v104 = 1 << -(char)__clz(v102 - 1);
                    if (v102 >= 2) {
                      unint64_t v102 = v104;
                    }
                  }
                  if (prime <= v102) {
                    size_t prime = v102;
                  }
                  if (prime >= v78)
                  {
                    unint64_t v78 = (unint64_t)__p[1];
LABEL_159:
                    if ((v78 & (v78 - 1)) != 0)
                    {
                      if (v78 <= v77) {
                        unint64_t v2 = v77 % v78;
                      }
                      else {
                        unint64_t v2 = v77;
                      }
                    }
                    else
                    {
                      unint64_t v2 = (v78 - 1) & v77;
                    }
                    goto LABEL_172;
                  }
                  if (!prime)
                  {
                    id v111 = __p[0];
                    __p[0] = 0;
                    if (v111) {
                      operator delete(v111);
                    }
                    unint64_t v78 = 0;
                    __p[1] = 0;
                    goto LABEL_159;
                  }
                }
                if (prime >> 61) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v92 = operator new(8 * prime);
                int v93 = __p[0];
                __p[0] = v92;
                if (v93) {
                  operator delete(v93);
                }
                uint64_t v94 = 0;
                __p[1] = (void *)prime;
                do
                  *((void *)__p[0] + v94++) = 0;
                while (prime != v94);
                uint64_t v95 = (void **)v131[0];
                if (!v131[0])
                {
LABEL_158:
                  unint64_t v78 = prime;
                  goto LABEL_159;
                }
                size_t v96 = *((void *)v131[0] + 1);
                size_t v97 = prime - 1;
                if ((prime & (prime - 1)) == 0)
                {
                  size_t v98 = v96 & v97;
                  *((void *)__p[0] + v98) = v131;
                  for (uint64_t j = *v95; *v95; uint64_t j = *v95)
                  {
                    size_t v100 = j[1] & v97;
                    if (v100 == v98)
                    {
                      uint64_t v95 = (void **)j;
                    }
                    else if (*((void *)__p[0] + v100))
                    {
                      *uint64_t v95 = (void *)*j;
                      uint64_t v101 = 8 * v100;
                      *uint64_t j = **(void **)((char *)__p[0] + v101);
                      **(void **)((char *)__p[0] + v101) = j;
                    }
                    else
                    {
                      *((void *)__p[0] + v100) = v95;
                      uint64_t v95 = (void **)j;
                      size_t v98 = v100;
                    }
                  }
                  goto LABEL_158;
                }
                if (v96 >= prime) {
                  v96 %= prime;
                }
                *((void *)__p[0] + v96) = v131;
                id v105 = *v95;
                if (!*v95) {
                  goto LABEL_158;
                }
                while (1)
                {
                  size_t v107 = v105[1];
                  if (v107 >= prime) {
                    v107 %= prime;
                  }
                  if (v107 != v96)
                  {
                    if (!*((void *)__p[0] + v107))
                    {
                      *((void *)__p[0] + v107) = v95;
                      goto LABEL_163;
                    }
                    *uint64_t v95 = (void *)*v105;
                    uint64_t v106 = 8 * v107;
                    *id v105 = **(void **)((char *)__p[0] + v106);
                    **(void **)((char *)__p[0] + v106) = v105;
                    id v105 = v95;
                  }
                  size_t v107 = v96;
LABEL_163:
                  uint64_t v95 = (void **)v105;
                  id v105 = (void *)*v105;
                  size_t v96 = v107;
                  if (!v105) {
                    goto LABEL_158;
                  }
                }
              }
            }
          }
        }
LABEL_29:
        ++v13;
        uint64_t v12 = v125;
        if (v13 != (uint64_t *)v124) {
          continue;
        }
        break;
      }
      if (v131[1])
      {
        std::vector<VKTransitLineMarker * {__strong}>::reserve((uint64_t)&v127, (unint64_t)v131[1]);
        char v112 = v131[0];
        if (v131[0])
        {
          do
          {
            uint64_t v115 = +[VKTransitLineMarker markerWithFeature:transitLink:](VKTransitLineMarker, "markerWithFeature:transitLink:", v112[2], v112[3], v124);
            v133[0] = v115;
            v116 = v128;
            if ((unint64_t)v128 < v129)
            {
              id v113 = 0;
              v133[0] = 0;
              uint64_t *v128 = v115;
              v114 = v116 + 1;
            }
            else
            {
              v114 = std::vector<objc_object * {__strong}>::__emplace_back_slow_path<objc_object * {__strong}>(&v127, v133);
              id v113 = (void *)v133[0];
            }
            v128 = v114;

            char v112 = (void *)*v112;
          }
          while (v112);
        }
      }
    }
    id v117 = v131[0];
    if (v131[0])
    {
      do
      {
        v118 = (void *)*v117;
        operator delete(v117);
        id v117 = v118;
      }
      while (v118);
    }
    v119 = __p[0];
    __p[0] = 0;
    if (v119) {
      operator delete(v119);
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v124);
    int v120 = (uint64_t *)v127;
    if (v127)
    {
      int v121 = v128;
      int v122 = v127;
      if (v128 != v127)
      {
        do
        {
          BOOL v123 = (void *)*--v121;
        }
        while (v121 != v120);
        int v122 = v127;
      }
      v128 = v120;
      operator delete(v122);
    }
  }
  else
  {
LABEL_25:
    uint64_t v14 = 0;
  }
  return v14;
}

- (void)setDisableTransitLines:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint8x8_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v9 = 134218242;
    unint64_t v10 = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set disable transit lines: %s", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v9) = 16;
  md::MapEngineSettings::set(v7, &v9, (void *)v3);
  uint64_t v8 = *((void *)self + 48);
  LOBYTE(v9) = 1;
  md::MapEngine::setNeedsTick(v8, &v9);
}

- (BOOL)transitLinesDisabled
{
  unint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 16)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setPreviouslySelectedLabelMarker:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint8x8_t v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)uint64_t v13 = 134218243;
    *(void *)&v13[4] = self;
    __int16 v14 = 2113;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] setPreviouslySelectedLabelMarker=%{private}@", v13, 0x16u);
  }
  if (!v4)
  {
    [(VKMapView *)self clearPreviouslySelectedLabelMarker];
    goto LABEL_19;
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  uint64_t v8 = (uint64_t *)[v4 labelMarkerImpl];
  int v9 = *(md::LabelManager **)(v7[2] + 24);
  uint64_t v11 = *v8;
  unint64_t v10 = (std::__shared_weak_count *)v8[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = 0;
  uint64_t v12 = operator new(0x20uLL);
  *uint64_t v12 = &unk_1EF51DB58;
  v12[1] = v9;
  v12[2] = v11;
  v12[3] = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = v12;
  md::LabelManager::queueCommand(v9, 62, 1, v13);
  if (v16 == v13)
  {
    (*(void (**)(unsigned char *))(*(void *)v13 + 32))(v13);
    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v16) {
    (*(void (**)(void))(*(void *)v16 + 40))();
  }
  if (v10)
  {
LABEL_17:
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
LABEL_19:
}

- (void)deselectLabelMarker
{
  uint64_t v3 = [(VKMapView *)self _labelSettings];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v4 = *(void *)(v3[2] + 40);
  uint8x8_t v5 = *(std::__shared_weak_count **)(v4 + 40);
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  md::LabelManager::selectLabelMarker(*(md::LabelManager **)(v3[2] + 24), &v7);
  uint64_t v6 = v8;
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  [(VKMapView *)self _updateMapDisplayStyle];
}

- (void)selectLabelMarker:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14)
  {
    uint64_t v7 = [(VKMapView *)self _labelSettings];
    uint64_t v8 = (uint64_t *)[v14 labelMarkerImpl];
    uint64_t v9 = *(void *)(v7[2] + 40);
    uint64_t v11 = *v8;
    uint64_t v10 = v8[1];
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = *(std::__shared_weak_count **)(v9 + 40);
    *(void *)(v9 + 32) = v11;
    *(void *)(v9 + 40) = v10;
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    md::LabelManager::selectLabelMarker(*(md::LabelManager **)(v7[2] + 24), v8);
    [(VKMapView *)self _updateMapDisplayStyle];
    if (*((unsigned char *)self + 32) && *((_DWORD *)self + 9) == 11)
    {
      id v13 = *((id *)self + 35);
      objc_msgSend(v13, "selectLabelMarker:completion:", objc_msgSend(v14, "labelMarkerImpl"), v6);
    }
  }
  else
  {
    [(VKMapView *)self deselectLabelMarker];
  }
}

- (void)selectLabelMarker:(id)a3
{
}

- (id)rapMarkerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint8x8_t v5 = [(VKMapView *)self currentCanvas];
  id v6 = objc_msgSend(v5, "markerAtScreenPoint:enableExtendedFeatureMarkers:", 0, x, y);

  return v6;
}

- (id)labelMarkerForCustomFeatureAnnotation:(id)a3
{
  id v4 = a3;
  uint8x8_t v5 = [v4 feature];
  id v6 = [v5 dataSource];
  uint64_t v7 = [(VKMapView *)self labelMarkerForCustomFeatureAnnotation:v4 dataSource:v6];

  return v7;
}

- (id)labelMarkerForCustomFeatureAnnotation:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    uint64_t v10 = [v6 feature];
    uint64_t v11 = [v10 dataSource];

    if (v11)
    {
      uint64_t v12 = [v6 feature];
      id v13 = [v12 dataSource];

      if (v13 != v8)
      {
        uint64_t v9 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      id v14 = [v6 feature];
      [v14 setDataSource:v8];
    }
    md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((void *)self + 48) + 4536), "-[VKMapView labelMarkerForCustomFeatureAnnotation:dataSource:]");
    md::LabelManager::labelMarkerForCustomFeatureAnnotation(&v17, *(void *)(*(void *)([(VKMapView *)self _labelSettings] + 16) + 24), v6, v8);
    uint64_t v9 = +[VKLabelMarker markerWithLabelMarker:&v17];
    uint64_t v15 = v18;
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
LABEL_10:

  return v9;
}

- (id)labelMarkerForSelectionAtPoint:(CGPoint)a3 selectableLabelsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = [(VKMapView *)self _labelSettings];
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  md::LabelSettings_Markers::labelMarkerForSelectionAtPoint((md::LabelSettings_Markers *)&v11, v14, *(void *)(v7[2] + 24), v4);
  uint64_t v8 = +[VKLabelMarker markerWithLabelMarker:&v11];
  uint64_t v9 = v12;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  return v8;
}

- (void)setScreenLabelFeatures:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(VKMapView *)self _labelSettings];
  uint8x8_t v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
  objc_storeStrong((id *)(*((void *)v4 + 5) + 128), v5);
  id v6 = v5;
  md::LabelManager::setScreenLabelFeatures(*((md::LabelManager **)v4 + 3), v6);
}

- (void)setLabelExclusionRegions:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(VKMapView *)self _labelSettings];
  uint8x8_t v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  md::LabelSettings::setLabelExclusionRegions((uint64_t)v4, v5);
}

- (void)removeCustomFeatureDataSource:(id)a3
{
  id v4 = a3;
  md::LabelSettings::removeCustomFeatureDataSource((uint64_t)[(VKMapView *)self _labelSettings], v4);
}

- (void)setHiddenTrafficIncidentFeatures:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint8x8_t v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v4) {
      uint64_t v6 = [v4 count];
    }
    else {
      uint64_t v6 = 0;
    }
    int v7 = 134218240;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set hidden traffic incident features - count:%zu", (uint8_t *)&v7, 0x16u);
  }

  md::LabelSettings::setHiddenTrafficIncidentFeatures((uint64_t)[(VKMapView *)self _labelSettings], v4);
}

- (BOOL)trackingCameraShouldHandleGestures
{
  return 0;
}

- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 pounceCompletionHandler:(id)a7
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  BOOL v11 = a3;
  id v13 = a7;
  if (var0 > 90.0 || var0 < -90.0 || var1 > 180.0 || var1 < -180.0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    uint64_t v17 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A1780000, v17, OS_LOG_TYPE_ERROR, "Transition to tracking passed invalid start location!", buf, 2u);
    }
  }
  [(VKMapView *)self stopTrackingAnnotation];
  double v18 = [(VKMapView *)self currentCanvas];
  if (!*((void *)self + 33))
  {
    double v19 = [VKNavCameraController alloc];
    uint64_t v20 = *((void *)self + 48);
    double v21 = *(std::__shared_weak_count **)(v20 + 16);
    uint64_t v42 = *(void *)(v20 + 8);
    float v43 = v21;
    int64_t v36 = a4;
    id v37 = v13;
    if (v21)
    {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v20 = *((void *)self + 48);
    }
    uint64_t v22 = *(void *)(v20 + 24);
    uint64_t v23 = *(void *)(v20 + 904);
    uint64_t v25 = *(void *)(v20 + 112);
    uint64_t v24 = *(void *)(v20 + 120);
    id v26 = *(id *)(v20 + 1104);
    uint64_t v27 = [(VKNavCameraController *)v19 initWithTaskContext:&v42 device:v22 mapDataAccess:v23 animationRunner:v25 runLoopController:v24 cameraDelegate:v26];
    float v28 = (void *)*((void *)self + 33);
    *((void *)self + 33) = v27;

    float v29 = v43;
    id v13 = v37;
    if (v43 && !atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
    [(VKMapView *)self sceneConfiguration];
    float v30 = a4 = v36;
    [*((id *)self + 33) setSceneConfiguration:v30];

    [*((id *)self + 33) setNavContext:*((void *)self + 40)];
    [*((id *)self + 33) setScreenCanvas:v18];
  }
  if (*((unsigned char *)self + 352) && *((unsigned char *)self + 368))
  {
    objc_msgSend(*((id *)self + 33), "updateLocation:andCourse:");
  }
  else
  {
    *(double *)long long buf = var0 * 0.0174532925;
    double v40 = var1 * 0.0174532925;
    uint64_t v41 = 0;
    uint64_t v31 = [(VKMapView *)self puckAnimator:*((void *)self + 28) getElevationWithCoordinate:buf];
    if (v32) {
      uint64_t v33 = v31;
    }
    else {
      uint64_t v33 = 0;
    }
    uint64_t v41 = v33;
    uint64_t v34 = *((void *)self + 28);
    double v38 = a6 * 0.0174532925;
    [(VKMapView *)self puckAnimator:v34 updatedPosition:buf course:&v38 polylineCoordinate:*((void *)self + 47)];
    uint64_t v35 = [(VKMapView *)self navigationPuck];
    [v35 setPresentationCourse:a6];
  }
  [*((id *)self + 28) start];
  [v18 setCameraController:*((void *)self + 33)];
  objc_msgSend(v18, "transitionToTracking:mapMode:startLocation:startCourse:cameraController:pounceCompletionHandler:", v11, a4, *((void *)self + 33), v13, var0, var1, a6);
}

- (void)navigationCameraReturnToPuck
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint8x8_t v5 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Navigation return to puck", (uint8_t *)&v4, 0xCu);
  }
  [*((id *)self + 33) returnToPuck];
}

- (void)pauseTracking
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint8x8_t v5 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Pause tracking", (uint8_t *)&v4, 0xCu);
  }
  [*((id *)self + 33) stop];
}

- (void)stopTracking
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Stop tracking", (uint8_t *)&v7, 0xCu);
  }
  [*((id *)self + 33) stop];
  int v4 = (void *)*((void *)self + 5);
  uint8x8_t v5 = [(VKMapView *)self resolveMapCameraController];
  [v4 setCameraController:v5];

  uint64_t v6 = (void *)*((void *)self + 33);
  *((void *)self + 33) = 0;
}

- (id)tileStatistics
{
  id v1 = a1;
  unint64_t v2 = [v1 stringByReplacingOccurrencesOfString:@"DaVinci" withString:@"Pine"];

  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"DAVINCI" withString:@"PINE"];

  return v3;
}

- (void)tileStatistics
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  [*a1 setValue:v11 forKey:v7];
  id v9 = *a1;
  uint64_t v10 = [NSString stringWithFormat:@"%@Units", v7];
  [v9 setValue:v8 forKey:v10];
}

- (void)resetTileStatistics
{
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((void *)self + 48) + 4536), "-[VKMapView resetTileStatistics]");
  uint64_t v3 = *(void *)(*(void *)(*(void *)(*((void *)self + 48) + 896) + 24) + 56);
  int v4 = &md::MapResourceTypeList;
  do
  {
    uint8x8_t v5 = *(unsigned __int16 **)(v3 + 32);
    uint64_t v6 = *(unsigned __int16 **)(v3 + 40);
    if (v5 != v6)
    {
      while (*v5 != (unsigned __int16)*v4)
      {
        v5 += 8;
        if (v5 == v6) {
          goto LABEL_2;
        }
      }
    }
    if (v5 != v6)
    {
      uint64_t v7 = *((void *)v5 + 1);
      if (v7)
      {
        std::mutex::lock((std::mutex *)(v7 + 112));
        *(void *)(v7 + 432) = 0;
        *(_OWORD *)(v7 + 400) = 0u;
        *(_OWORD *)(v7 + 416) = 0u;
        *(_OWORD *)(v7 + 176) = 0u;
        *(_OWORD *)(v7 + 192) = 0u;
        *(_OWORD *)(v7 + 208) = 0u;
        *(_OWORD *)(v7 + 224) = 0u;
        *(_OWORD *)(v7 + 240) = 0u;
        *(_OWORD *)(v7 + 256) = 0u;
        *(_OWORD *)(v7 + 272) = 0u;
        *(_OWORD *)(v7 + 288) = 0u;
        *(_OWORD *)(v7 + 304) = 0u;
        *(_OWORD *)(v7 + 320) = 0u;
        std::mutex::unlock((std::mutex *)(v7 + 112));
      }
    }
LABEL_2:
    ++v4;
  }
  while (v4 != &md::MapDataTypeList);
  id v8 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v9 = v8[2];
  if (!*(void *)&v9) {
    goto LABEL_39;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v11 = 0x2B7C4502BD3C99C6;
    if (*(void *)&v9 <= 0x2B7C4502BD3C99C6uLL) {
      uint64_t v11 = 0x2B7C4502BD3C99C6uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v11 = (*(void *)&v9 - 1) & 0x2B7C4502BD3C99C6;
  }
  uint64_t v12 = *(void **)(*(void *)&v8[1] + 8 * v11);
  if (!v12) {
    goto LABEL_39;
  }
  id v13 = (void *)*v12;
  if (!v13) {
    goto LABEL_39;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == 0x2B7C4502BD3C99C6)
      {
        if (v13[2] == 0x2B7C4502BD3C99C6) {
          goto LABEL_31;
        }
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_39;
      }
      id v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_39;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v13[1];
    if (v15 == 0x2B7C4502BD3C99C6) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v11) {
      goto LABEL_39;
    }
LABEL_20:
    id v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_39;
    }
  }
  if (v13[2] != 0x2B7C4502BD3C99C6) {
    goto LABEL_20;
  }
LABEL_31:
  uint64_t v17 = (void *)v13[5];
  if (v17 && v17[20])
  {
    double v18 = (void *)v17[19];
    if (v18)
    {
      do
      {
        double v19 = (void *)*v18;
        std::__destroy_at[abi:nn180100]<std::pair<gdc::LayerDataRequestKey const,gdc::DebugTreeNode>,0>((uint64_t)(v18 + 2));
        operator delete(v18);
        double v18 = v19;
      }
      while (v19);
    }
    v17[19] = 0;
    uint64_t v20 = v17[18];
    if (v20)
    {
      for (uint64_t i = 0; i != v20; ++i)
        *(void *)(v17[17] + 8 * i) = 0;
    }
    v17[20] = 0;
  }
LABEL_39:
  uint64_t v22 = (char *)&md::MapDataTypeList;
  do
  {
    uint64_t v23 = *(void *)(*((void *)self + 48) + 896);
    uint64_t v24 = *(unsigned __int16 **)(v23 + 32);
    uint64_t v25 = *(unsigned __int16 **)(v23 + 40);
    if (v24 != v25)
    {
      while (*v24 != *(unsigned __int16 *)v22)
      {
        v24 += 8;
        if (v24 == v25) {
          goto LABEL_40;
        }
      }
    }
    if (v24 != v25)
    {
      uint64_t v26 = *((void *)v24 + 1);
      if (v26)
      {
        std::mutex::lock((std::mutex *)(v26 + 480));
        *(void *)(v26 + 576) = 0;
        *(_OWORD *)(v26 + 544) = 0u;
        *(_OWORD *)(v26 + 560) = 0u;
        std::mutex::unlock((std::mutex *)(v26 + 480));
      }
    }
LABEL_40:
    v22 += 2;
  }
  while (v22 != gdc::ResourceSourceList);
}

- (void)disableTileStatistics
{
  unint64_t v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      uint64_t v5 = 0x2B7C4502BD3C99C6;
      if (*(void *)&v3 <= 0x2B7C4502BD3C99C6uLL) {
        uint64_t v5 = 0x2B7C4502BD3C99C6uLL % *(void *)&v3;
      }
    }
    else
    {
      uint64_t v5 = (*(void *)&v3 - 1) & 0x2B7C4502BD3C99C6;
    }
    uint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
    if (v6)
    {
      uint64_t v7 = (void *)*v6;
      if (v7)
      {
        if (v4.u32[0] < 2uLL)
        {
          uint64_t v8 = *(void *)&v3 - 1;
          while (1)
          {
            uint64_t v10 = v7[1];
            if (v10 == 0x2B7C4502BD3C99C6)
            {
              if (v7[2] == 0x2B7C4502BD3C99C6) {
                goto LABEL_22;
              }
            }
            else if ((v10 & v8) != v5)
            {
              return;
            }
            uint64_t v7 = (void *)*v7;
            if (!v7) {
              return;
            }
          }
        }
        do
        {
          unint64_t v9 = v7[1];
          if (v9 == 0x2B7C4502BD3C99C6)
          {
            if (v7[2] == 0x2B7C4502BD3C99C6)
            {
LABEL_22:
              uint64_t v11 = v7[5];
              if (v11) {
                *(unsigned char *)(v11 + 128) = 0;
              }
              return;
            }
          }
          else
          {
            if (v9 >= *(void *)&v3) {
              v9 %= *(void *)&v3;
            }
            if (v9 != v5) {
              return;
            }
          }
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
    }
  }
}

- (void)enableTileStatistics
{
  unint64_t v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      uint64_t v5 = 0x2B7C4502BD3C99C6;
      if (*(void *)&v3 <= 0x2B7C4502BD3C99C6uLL) {
        uint64_t v5 = 0x2B7C4502BD3C99C6uLL % *(void *)&v3;
      }
    }
    else
    {
      uint64_t v5 = (*(void *)&v3 - 1) & 0x2B7C4502BD3C99C6;
    }
    uint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
    if (v6)
    {
      uint64_t v7 = (void *)*v6;
      if (v7)
      {
        if (v4.u32[0] < 2uLL)
        {
          uint64_t v8 = *(void *)&v3 - 1;
          while (1)
          {
            uint64_t v10 = v7[1];
            if (v10 == 0x2B7C4502BD3C99C6)
            {
              if (v7[2] == 0x2B7C4502BD3C99C6) {
                goto LABEL_22;
              }
            }
            else if ((v10 & v8) != v5)
            {
              return;
            }
            uint64_t v7 = (void *)*v7;
            if (!v7) {
              return;
            }
          }
        }
        do
        {
          unint64_t v9 = v7[1];
          if (v9 == 0x2B7C4502BD3C99C6)
          {
            if (v7[2] == 0x2B7C4502BD3C99C6)
            {
LABEL_22:
              uint64_t v11 = v7[5];
              if (v11) {
                *(unsigned char *)(v11 + 128) = 1;
              }
              return;
            }
          }
          else
          {
            if (v9 >= *(void *)&v3) {
              v9 %= *(void *)&v3;
            }
            if (v9 != v5) {
              return;
            }
          }
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
    }
  }
}

- (id)testStatistics
{
  kern_return_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void **v40;
  void *v41;
  void **v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  mach_msg_type_number_t task_info_outCnt;
  std::string __p;
  double v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void **v56;
  void *v57;
  void *v58;
  uint64_t vars8;

  uint64_t v3 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v3 + 4536), "-[VKMapView testStatistics]");
  uint64_t v4 = *(void *)(v3 + 1144);
  uint64_t v5 = (void *)*((void *)self + 6);
  if (v5)
  {
    id v6 = [v5 flyoverStatistics];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v7 = v6;
  BOOL v44 = v4;
  gdc::Statistics::getAllHistograms((gdc::Statistics *)&v57, v4);
  BOOL v45 = v57;
  uint8x8_t v46 = v58;
  if (v57 != v58)
  {
    uint64_t v8 = v57;
    while (1)
    {
      gdc::Histogram::getHistogramData((gdc::Histogram *)&__p, v8[1]);
      double v9 = v51;
      if (v52 != *(void **)&v51) {
        break;
      }
      double v9 = *(double *)&v52;
      if (v52) {
        goto LABEL_7;
      }
LABEL_8:
      v8 += 2;
      if (v8 == v46) {
        goto LABEL_14;
      }
    }
    unint64_t v10 = 0;
    double v11 = *(double *)&__p.__r_.__value_.__r.__words[2];
    std::string::pointer data = __p.__r_.__value_.__l.__data_;
    unint64_t v13 = ((uint64_t)v52 - *(void *)&v51) >> 3;
    do
    {
      unint64_t v14 = v10 + 1;
      unint64_t v15 = *(void *)(*(void *)&v9 + 8 * v10);
      if (v15)
      {
        uint64_t v16 = [NSString stringWithFormat:@"%s [%3.0f, %3.0f]ms", *v8, *(double *)&data + v11 * (double)v10, *(double *)&data + v11 * (double)v14];
        uint64_t v17 = [NSNumber numberWithDouble:(double)v15];
        [v7 setValue:v17 forKey:v16];

        double v18 = [NSString stringWithFormat:@"%@Units", v16];
        [v7 setValue:@"samples" forKey:v18];
      }
      unint64_t v10 = v14;
    }
    while (v14 < v13);
LABEL_7:
    operator delete(*(void **)&v9);
    goto LABEL_8;
  }
LABEL_14:
  gdc::Statistics::getAllSamplers((gdc::Statistics *)&__p, v44);
  gdc::Statistics::dumpSamplerValues((uint64_t)&v55, (uint64_t *)&__p);
  if (__p.__r_.__value_.__r.__words[0]) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  for (uint64_t i = v56; i; uint64_t i = (void **)*i)
  {
    if (*((char *)i + 39) < 0) {
      std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)i[2], (std::string::size_type)i[3]);
    }
    else {
      __p = *(std::string *)(i + 2);
    }
    float v51 = *((double *)i + 5);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    double v21 = [NSString stringWithUTF8String:p_p];
    uint64_t v22 = [NSNumber numberWithDouble:v51];
    [v7 setValue:v22 forKey:v21];

    uint64_t v23 = [NSString stringWithFormat:@"%@Units", v21];
    [v7 setValue:@"ms" forKey:v23];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  task_info_outCnt = 372;
  uint64_t v24 = task_info(*MEMORY[0x1E4F14960], 0x16u, (task_info_t)&__p, &task_info_outCnt);
  uint64_t v25 = 0.0;
  uint64_t v26 = 0.0;
  if (!v24)
  {
    uint64_t v25 = (double)v53 * 0.000000953674316;
    uint64_t v26 = (double)v54 * 0.000000953674316;
  }
  uint64_t v27 = [NSNumber numberWithDouble:v25];
  [v7 setValue:v27 forKey:@"MemoryUsage:Footprint"];

  float v28 = [NSNumber numberWithDouble:v26];
  [v7 setValue:v28 forKey:@"MemoryUsage:Footprint_Peak"];

  BOOL v48 = 0;
  BOOL v47 = 0;
  malloc_get_all_zones();
  float v29 = +[VKSharedResourcesManager sharedResources];
  float v30 = *(void *)([v29 device] + 8);

  if (v30)
  {
    uint64_t v31 = *(void *)(v30 + 80);
    if (v31)
    {
      for (uint64_t j = *(void **)(v31 + 168); j; uint64_t j = (void *)*j)
      {
        uint64_t v33 = [NSNumber numberWithUnsignedLongLong:j[4]];
        uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"ResourceStats::%s::Count", j[2]);
        [v7 setValue:v33 forKey:v34];

        uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"ResourceStats::%s::CountUnits", j[2]);
        [v7 setObject:@"items" forKey:v35];

        int64_t v36 = [NSNumber numberWithUnsignedLongLong:(unint64_t)((double)(unint64_t)j[5] * 0.000000953674316)];
        id v37 = objc_msgSend(NSString, "stringWithFormat:", @"ResourceStats::%s::Size", j[2]);
        [v7 setValue:v36 forKey:v37];

        double v38 = objc_msgSend(NSString, "stringWithFormat:", @"ResourceStats::%s::SizeUnits", j[2]);
        [v7 setObject:@"MB" forKey:v38];
      }
    }
  }
  float v39 = v7;
  double v40 = v56;
  if (v56)
  {
    do
    {
      float v43 = (void **)*v40;
      if (*((char *)v40 + 39) < 0) {
        operator delete(v40[2]);
      }
      operator delete(v40);
      double v40 = v43;
    }
    while (v43);
  }
  uint64_t v41 = v55;
  float v55 = 0;
  if (v41) {
    operator delete(v41);
  }
  if (v45) {
    operator delete(v45);
  }

  return v39;
}

- (void)resetTestStatistics
{
  uint64_t v3 = (void *)*((void *)self + 6);
  if (v3) {
    [v3 resetFlyoverStatistics];
  }
  uint64_t v4 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView resetTestStatistics]");
  uint64_t v5 = *(gdc::Statistics **)(v4 + 1144);
  gdc::Statistics::reset(v5);
}

- (void)disableTestStatistics
{
  uint64_t v3 = (void *)*((void *)self + 6);
  if (v3) {
    [v3 disableFlyoverStatistics];
  }
  uint64_t v4 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView disableTestStatistics]");
  uint64_t v5 = *(void *)(v4 + 1144);
  atomic_store(0, (unsigned __int8 *)(v5 + 153));
  atomic_store(0, (unsigned __int8 *)(v5 + 152));
}

- (void)enableTestStatistics
{
  uint64_t v3 = (void *)*((void *)self + 6);
  if (v3) {
    [v3 enableFlyoverStatistics];
  }
  uint64_t v4 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView enableTestStatistics]");
  uint64_t v5 = *(void *)(v4 + 1144);
  atomic_store(1u, (unsigned __int8 *)(v5 + 153));
  atomic_store(1u, (unsigned __int8 *)(v5 + 152));
}

- (void)resumeFlyoverTourAnimation
{
  if (*(unsigned char *)(*((void *)self + 48) + 1241))
  {
    uint64_t v3 = &OBJC_IVAR___VKMapView__mapCameraController;
  }
  else
  {
    if (![(VKMapView *)self canShowFlyoverAnimation]) {
      return;
    }
    uint64_t v3 = &OBJC_IVAR___VKMapView__globe;
  }
  uint64_t v4 = *(void **)((char *)self + *v3);
  [v4 resumeFlyoverTourAnimation];
}

- (void)pauseFlyoverTourAnimation
{
  if (*(unsigned char *)(*((void *)self + 48) + 1241))
  {
    uint64_t v3 = &OBJC_IVAR___VKMapView__mapCameraController;
  }
  else
  {
    if (![(VKMapView *)self canShowFlyoverAnimation]) {
      return;
    }
    uint64_t v3 = &OBJC_IVAR___VKMapView__globe;
  }
  uint64_t v4 = *(void **)((char *)self + *v3);
  [v4 pauseFlyoverTourAnimation];
}

- (void)stopFlyoverAnimation
{
  uint64_t v3 = *(void *)(*((void *)self + 48) + 1128);
  char v4 = 2;
  md::MapEngineSettings::set(v3, &v4, (void *)1);
  if (*(unsigned char *)(*((void *)self + 48) + 1241))
  {
    [*((id *)self + 31) stopFlyoverTourAnimation];
  }
  else if ([(VKMapView *)self canShowFlyoverAnimation])
  {
    [*((id *)self + 6) stopFlyoverAnimation];
  }
}

- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [*((id *)self + 31) endRegionChange];
  uint64_t v9 = *(void *)(*((void *)self + 48) + 1128);
  char v20 = 2;
  md::MapEngineSettings::set(v9, &v20, 0);
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)self + 15);
    [v12 mapLayerWillStartFlyoverTour:self];
  }
  if (*(unsigned char *)(*((void *)self + 48) + 1241))
  {
    unint64_t v13 = (void *)*((void *)self + 31);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke;
    v19[3] = &unk_1E5A8C258;
    v19[4] = self;
    unint64_t v14 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_2;
    v18[3] = &unk_1E5A8C280;
    v18[4] = self;
    v18[5] = v8;
    [v13 startFlyoverTourAnimation:a3 animateToStart:v5 labelChanged:v19 stateChange:v18];
  }
  else
  {
    unint64_t v15 = (void *)*((void *)self + 6);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_3;
    v17[3] = &unk_1E5A8C258;
    v17[4] = self;
    unint64_t v14 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_4;
    v16[3] = &unk_1E5A8C280;
    v16[4] = self;
    v16[5] = v8;
    [v15 startFlyoverTourAnimation:a3 animateToStart:v5 labelChanged:v17 stateChange:v16];
  }
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyDelegateFlyoverTourLabelChanged:a2];
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runFlyoverTourStateChange:a2 completion:*(void *)(a1 + 40)];
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyDelegateFlyoverTourLabelChanged:a2];
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runFlyoverTourStateChange:a2 completion:*(void *)(a1 + 40)];
}

- (void)moveToFlyoverTourStartPosition:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *((void *)self + 48);
  if (*(unsigned char *)(v10 + 1241))
  {
    uint64_t v11 = *(void *)(v10 + 1128);
    LOBYTE(v24) = 2;
    md::MapEngineSettings::set(v11, &v24, 0);
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__1172;
    float v28 = __Block_byref_object_dispose__1173;
    id v29 = [*((id *)self + 31) createFlyoverPreTourAnimation:v8 duration:a4];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke;
    v21[3] = &unk_1E5A8C2A8;
    uint64_t v23 = &v24;
    id v22 = v9;
    id v12 = (void *)MEMORY[0x1A6239EB0](v21);
    [(VKMapView *)self startFlyoverAnimation:v25[5] animateToStart:0 completion:v12];

    unint64_t v13 = v22;
  }
  else
  {
    if ([(VKMapView *)self mapType] != 3) {
      [(VKMapView *)self setMapType:3];
    }
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__1172;
    float v28 = __Block_byref_object_dispose__1173;
    id v29 = [*((id *)self + 6) createFlyoverPreTourAnimation:v8 duration:a4];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke_2;
    double v18 = &unk_1E5A8C2A8;
    char v20 = &v24;
    id v19 = v9;
    unint64_t v14 = (void *)MEMORY[0x1A6239EB0](&v15);
    -[VKMapView startFlyoverAnimation:animateToStart:completion:](self, "startFlyoverAnimation:animateToStart:completion:", v25[5], 0, v14, v15, v16, v17, v18);

    unint64_t v13 = v19;
  }

  _Block_object_dispose(&v24, 8);
}

uint64_t __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  char v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

uint64_t __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  char v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (void)startFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)self + 15);
    [v12 mapLayerWillStartFlyoverTour:self];
  }
  if (*(unsigned char *)(*((void *)self + 48) + 1241))
  {
    unint64_t v13 = (void *)*((void *)self + 31);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke;
    v19[3] = &unk_1E5A8C258;
    v19[4] = self;
    unint64_t v14 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_2;
    v18[3] = &unk_1E5A8C280;
    v18[4] = self;
    v18[5] = v9;
    [v13 flyoverTourAnimation:v8 animateToStart:v6 labelChanged:v19 stateChange:v18];
LABEL_9:

    goto LABEL_10;
  }
  if ([(VKMapView *)self canShowFlyoverAnimation])
  {
    if ([(VKMapView *)self mapType] != 3) {
      [(VKMapView *)self setMapType:3];
    }
    uint64_t v15 = (void *)*((void *)self + 6);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_3;
    v17[3] = &unk_1E5A8C258;
    v17[4] = self;
    unint64_t v14 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_4;
    v16[3] = &unk_1E5A8C280;
    v16[4] = self;
    v16[5] = v9;
    [v15 startFlyoverAnimation:v8 animateToStart:v6 labelChanged:v17 stateChange:v16];
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyDelegateFlyoverTourLabelChanged:a2];
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runFlyoverTourStateChange:a2 completion:*(void *)(a1 + 40)];
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyDelegateFlyoverTourLabelChanged:a2];
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runFlyoverTourStateChange:a2 completion:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateFlyoverTourLabelChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__VKMapView__notifyDelegateFlyoverTourLabelChanged___block_invoke;
  v6[3] = &unk_1E5A99EC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VKMapView *)self _postDelegateCallbackBlock:v6];
}

void __52__VKMapView__notifyDelegateFlyoverTourLabelChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) flyoverTourLabelDidChange:*(void *)(a1 + 40)];
  }
}

- (void)_runFlyoverTourStateChange:(int)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(id, BOOL))a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke;
  v12[3] = &unk_1E5A960A0;
  void v12[4] = self;
  id v7 = (void *)MEMORY[0x1A6239EB0](v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_3;
  v11[3] = &unk_1E5A960A0;
  v11[4] = self;
  id v8 = (void *)MEMORY[0x1A6239EB0](v11);
  if ((a3 - 3) < 2) {
    goto LABEL_4;
  }
  id v9 = v7;
  if (a3 == 5) {
    goto LABEL_5;
  }
  if (a3 == 6)
  {
LABEL_4:
    id v9 = v8;
LABEL_5:
    uint64_t v10 = (void (**)(void))MEMORY[0x1A6239EB0](v9);
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  if (!v6) {
    goto LABEL_10;
  }
LABEL_8:
  if ((a3 - 3) <= 3)
  {
    v6[2](v6, a3 == 5);
    [(VKMapView *)self _notifyDelegateFlyoverTourLabelChanged:0];
  }
LABEL_10:
  if (v10) {
    v10[2](v10);
  }
}

uint64_t __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_2;
  v3[3] = &unk_1E5A960A0;
  v3[4] = v1;
  return [v1 _postDelegateCallbackBlock:v3];
}

uint64_t __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_4;
  v3[3] = &unk_1E5A960A0;
  v3[4] = v1;
  return [v1 _postDelegateCallbackBlock:v3];
}

void __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) didStopFlyoverTourCompleted:0];
  }
}

void __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) didStopFlyoverTourCompleted:1];
  }
}

- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v19 = a3;
  BOOL v6 = (void (**)(id, void))a4;
  uint64_t v7 = *((void *)self + 48);
  if (*(unsigned char *)(v7 + 1241))
  {
    id v8 = *(id *)(v7 + 1104);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = *(id *)(*((void *)self + 48) + 1104);
      [v10 mapLayerWillChangeRegionAnimated:0];
    }
    [*((id *)self + 31) prepareFlyoverAnimation:v19 completion:v6];
    id v11 = *(id *)(*((void *)self + 48) + 1104);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
LABEL_10:
      id v18 = *(id *)(*((void *)self + 48) + 1104);
      [v18 mapLayerDidChangeRegionAnimated:0];
    }
  }
  else if ([(VKMapView *)self canShowFlyoverAnimation])
  {
    id v13 = *(id *)(*((void *)self + 48) + 1104);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = *(id *)(*((void *)self + 48) + 1104);
      [v15 mapLayerWillChangeRegionAnimated:0];
    }
    [*((id *)self + 6) prepareFlyoverAnimation:v19 completion:v6];
    id v16 = *(id *)(*((void *)self + 48) + 1104);
    char v17 = objc_opt_respondsToSelector();

    if (v17) {
      goto LABEL_10;
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (BOOL)canShowFlyoverAnimation
{
  return [(VKMapView *)self mapType] == 3
      || [(VKMapView *)self mapType] == 4
      || [(VKMapView *)self mapType] == 10;
}

- (BOOL)isFlyoverUnificationEnabled
{
  return *(unsigned char *)(*((void *)self + 48) + 1241);
}

- (void)setCameraFramingInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v13 = 134219008;
    char v14 = self;
    __int16 v15 = 2048;
    double v16 = top;
    __int16 v17 = 2048;
    double v18 = bottom;
    __int16 v19 = 2048;
    double v20 = left;
    __int16 v21 = 2048;
    double v22 = right;
    _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set camera framing edge insets: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v13, 0x34u);
  }
  *(float *)&double v9 = top;
  *(float *)&double v10 = left;
  *(float *)&double v11 = bottom;
  *(float *)&double v12 = right;
  objc_msgSend(*((id *)self + 33), "setClientFramingInsets:", v9, v10, v11, v12);
}

- (VKEdgeInsets)fullyOccludedEdgeInsets
{
  char v2 = [(VKMapView *)self currentCanvas];
  [v2 fullyOccludedEdgeInsets];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  float v10 = v9;

  float v11 = v4;
  float v12 = v6;
  float v13 = v8;
  float v14 = v10;
  result.float right = v14;
  result.float bottom = v13;
  result.float left = v12;
  result.float top = v11;
  return result;
}

- (void)setFullyOccludedEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  float v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v14 = 134219008;
    __int16 v15 = self;
    __int16 v16 = 2048;
    double v17 = top;
    __int16 v18 = 2048;
    double v19 = bottom;
    __int16 v20 = 2048;
    double v21 = left;
    __int16 v22 = 2048;
    double v23 = right;
    _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set fully occluded edge insets: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v14, 0x34u);
  }
  float v9 = [(VKMapView *)self currentCanvas];
  *(float *)&double v10 = top;
  *(float *)&double v11 = left;
  *(float *)&double v12 = bottom;
  *(float *)&double v13 = right;
  objc_msgSend(v9, "setFullyOccludedEdgeInsets:", v10, v11, v12, v13);
}

uint64_t __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_solveForInput:");
}

void __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    float32x4_t v9 = *(float32x4_t *)(a1 + 40);
    float32x4_t v10 = *(float32x4_t *)(a1 + 56);
    id v11 = WeakRetained;
    float v4 = [WeakRetained currentCanvas];
    objc_msgSend(v4, "setEdgeInsets:");

    id WeakRetained = v11;
    uint64_t v5 = *((void *)v11 + 48);
    float32x4_t v6 = vmlaq_n_f32(vmulq_n_f32(v9, 1.0 - a2), v10, a2);
    *(float32x4_t *)(v5 + 960) = v6;
    float v7 = *(float32x4_t **)(v5 + 1064);
    float v8 = *(std::__shared_weak_count **)(v5 + 1072);
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      v7[27] = v6;
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
        id WeakRetained = v11;
      }
    }
    else
    {
      v7[27] = v6;
    }
  }
}

void __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    float v4 = (void *)WeakRetained[19];
    WeakRetained[19] = 0;

    uint64_t v5 = [WeakRetained currentCanvas];
    float32x4_t v6 = [v5 cameraController];
    [v6 setEdgeInsetsAnimating:0];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
}

- (double)distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 fromLayer:(id)a5 withPrecision:(int64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  double v12 = (VKMapView *)a5;
  if ([(VKMapView *)self flyoverMode] == -1)
  {
    -[VKMapView convertPoint:toCoordinateFromLayer:](self, "convertPoint:toCoordinateFromLayer:", v12, v10, v9);
    double v18 = v23;
    double v20 = v24;
    -[VKMapView convertPoint:toCoordinateFromLayer:](self, "convertPoint:toCoordinateFromLayer:", v12, x, y);
  }
  else
  {
    if (v12 != self)
    {
      -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v12, v10, v9);
      double v10 = v13;
      double v9 = v14;
      -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v12, x, y);
      double x = v15;
      double y = v16;
    }
    objc_msgSend(*((id *)self + 6), "convertPointToCoordinateOnSphere:", v10, v9);
    double v18 = v17;
    double v20 = v19;
    objc_msgSend(*((id *)self + 6), "convertPointToCoordinateOnSphere:", x, y);
  }
  double v25 = 0.0;
  if (v18 <= 90.0
    && v18 >= -90.0
    && v20 <= 180.0
    && v20 >= -180.0
    && v21 <= 90.0
    && v21 >= -90.0
    && v22 <= 180.0
    && v22 >= -180.0)
  {
    if (a6) {
      GEOCalculateDistanceHighPrecision();
    }
    else {
      GEOCalculateDistance();
    }
    double v25 = v26;
  }

  return v25;
}

- (CGPoint)convertCoordinate:(id)a3 toCameraModelPointToLayer:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  float v8 = [(VKMapView *)self currentCanvas];
  objc_msgSend(v8, "convertCoordinateToCameraModelPoint:", var0, var1);
  double v10 = v9;
  double v12 = v11;

  -[VKMapView convertPoint:toLayer:](self, "convertPoint:toLayer:", v7, v10, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)convertCoordinate:(id)a3 toPointToLayer:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  float v8 = [(VKMapView *)self currentCanvas];
  objc_msgSend(v8, "convertCoordinateToPoint:", var0, var1);
  double v10 = v9;
  double v12 = v11;

  -[VKMapView convertPoint:toLayer:](self, "convertPoint:toLayer:", v7, v10, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)convertMapPoint:(id)a3 toPointToLayer:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  float v8 = [(VKMapView *)self currentCanvas];
  objc_msgSend(v8, "convertMapPointToPoint:", var0, var1);
  double v10 = v9;
  double v12 = v11;

  -[VKMapView convertPoint:toLayer:](self, "convertPoint:toLayer:", v7, v10, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPoint:(CGPoint)a3 toMapPointFromLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (VKMapView *)a4;
  if (v7 != self)
  {
    -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v7, x, y);
    double x = v8;
    double y = v9;
  }
  double v10 = [(VKMapView *)self currentCanvas];
  objc_msgSend(v10, "convertPointToMapPoint:", x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double var1 = v16;
  result.double var0 = v15;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPoint:(CGPoint)a3 toCoordinateFromLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (VKMapView *)a4;
  if (v7 != self)
  {
    -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v7, x, y);
    double x = v8;
    double y = v9;
  }
  double v10 = [(VKMapView *)self currentCanvas];
  objc_msgSend(v10, "convertPointToCoordinate:", x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double var1 = v16;
  result.double var0 = v15;
  return result;
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  float32x4_t v6 = [v5 cameraController];

  objc_opt_class();
  double v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v6 durationToAnimateToMapRegion:v4];
    double v7 = v8;
  }

  return v7;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 completion:(id)a7
{
}

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  double v7 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    double v8 = "NO";
    *(_DWORD *)double v11 = 134218498;
    *(void *)&v11[4] = self;
    if (v4) {
      double v8 = "YES";
    }
    *(_WORD *)&v11[12] = 2048;
    *(double *)&v11[14] = a3;
    __int16 v12 = 2080;
    double v13 = v8;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set yaw: %f, animated: %s", v11, 0x20u);
  }
  double v9 = [(VKMapView *)self currentCanvas];
  double v10 = [v9 cameraController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setYaw:v4 animated:a3];
  }
}

- (void)renderInContext:(CGContext *)a3
{
  if (*((unsigned char *)self + 528))
  {
    v6.receiver = self;
    v6.super_class = (Class)VKMapView;
    [(VKMapView *)&v6 renderInContext:a3];
  }
  else
  {
    BOOL v4 = (md::HomeQueueScheduler **)*((void *)self + 48);
    if (v4)
    {
      md::HomeQueueScheduler::waitForSynchronization(v4[567], "-[VKMapView renderInContext:]");
      double v5 = CACurrentMediaTime();
      md::MapEngine::renderSceneInContextSync((md::MapEngine *)v4, a3, v5);
    }
  }
}

- (id)activeLogics
{
  float v3 = *(void **)(a1 + 8);
  *a2 = &unk_1EF56C0D8;
  id result = v3;
  a2[1] = result;
  return result;
}

- (void)activeLogics
{
  JUMPOUT(0x1A6239270);
}

- (uint64_t)activeLogics
{
  return a1;
}

void __38__VKMapView__configureDefaultSettings__block_invoke(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setEnableGlobe:WeakRetained[576]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setEnableRoundedBuildings:WeakRetained[577]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setEnableColorizedBuildings:WeakRetained[578]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setEnableBuildingHeights:WeakRetained[579]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setEnableAdvancedWater:WeakRetained[581]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setEnableAdvancedLighting:WeakRetained[580]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setTerrainMode:WeakRetained[71]];
  }
}

void __38__VKMapView__configureDefaultSettings__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_24;
  }
  [WeakRetained setModernMapEnabled:a4];
  double v5 = *(int8x8_t **)(*((void *)WeakRetained + 48) + 1120);
  int8x8_t v6 = v5[2];
  if (!*(void *)&v6) {
    goto LABEL_22;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v8 = 0x2FED70A4459DFCA1;
    if (*(void *)&v6 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v8 = 0x2FED70A4459DFCA1uLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v6 - 1) & 0x2FED70A4459DFCA1;
  }
  double v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
  if (!v9 || (double v10 = (void *)*v9) == 0)
  {
LABEL_22:
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  if (v7.u32[0] < 2uLL)
  {
    uint64_t v11 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == 0x2FED70A4459DFCA1)
      {
        if (v10[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_27;
        }
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_22;
      }
      double v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_22;
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v12 >= *(void *)&v6) {
      v12 %= *(void *)&v6;
    }
    if (v12 != v8) {
      goto LABEL_22;
    }
LABEL_12:
    double v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_22;
    }
  }
  if (v10[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_12;
  }
LABEL_27:
  uint64_t v14 = (md::StyleLogic *)v10[5];
LABEL_23:
  md::StyleLogic::updateConfiguration(v14, *((_DWORD *)WeakRetained + 9));
  double v15 = (md::HomeQueueScheduler **)*((void *)WeakRetained + 48);
  md::HomeQueueScheduler::waitForSynchronization(v15[567], "-[VKMapView _configureDefaultSettings]_block_invoke_8");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v15);
LABEL_24:
}

- (void)dealloc
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  float v3 = (void *)*((void *)self + 73);
  if (v3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v4);
          }
          MapsFeature_RemoveBlockListener();
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v5);
    }
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218240;
    float v28 = self;
    __int16 v29 = 2048;
    float v30 = self;
    _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Destroying map view(%p)", buf, 0x16u);
  }
  double v9 = (void *)*((void *)self + 54);
  if (v9)
  {
    *((void *)self + 54) = 0;
  }
  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];

  [(VKMapView *)self _shutdownThermalMonitor];
  [(VKMapView *)self _closeLoaderConnection:1];
  uint64_t v11 = (void *)*((void *)self + 40);
  *((void *)self + 40) = 0;

  unint64_t v12 = (void *)*((void *)self + 59);
  *((void *)self + 59) = 0;

  uint64_t v13 = (void *)*((void *)self + 31);
  if (v13) {
    [v13 setMapEngine:0];
  }
  uint64_t v14 = (void *)*((void *)self + 35);
  if (v14)
  {
    *((void *)self + 35) = 0;
  }
  [*((id *)self + 6) setDelegate:0];
  [*((id *)self + 6) setMapDelegate:0];
  [*((id *)self + 6) willDealloc];
  double v15 = (void *)*((void *)self + 6);
  *((void *)self + 6) = 0;

  [*((id *)self + 5) setDelegate:0];
  [*((id *)self + 5) setMapDelegate:0];
  double v16 = (void *)*((void *)self + 5);
  *((void *)self + 5) = 0;

  [*((id *)self + 28) setDelegate:0];
  [*((id *)self + 28) stop];
  double v17 = (void *)*((void *)self + 33);
  *((void *)self + 33) = 0;

  double v18 = (void *)*((void *)self + 19);
  if (v18)
  {
    [v18 stop];
    double v19 = (void *)*((void *)self + 19);
    *((void *)self + 19) = 0;
  }
  double v20 = (void *)*((void *)self + 51);
  *((void *)self + 51) = 0;

  objc_storeWeak((id *)self + 77, 0);
  uint64_t v21 = *((void *)self + 48);
  *((void *)self + 48) = 0;
  if (v21) {
    md::MapEngineDeleter::operator()(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)VKMapView;
  [(VKMapView *)&v22 dealloc];
}

- (id)initWithDescriptor:
{
  id v1 = (id *)(a1 + 8);
  char v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EF56C240;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)initWithDescriptor:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF56C1B0;
  a2[1] = v2;
  return result;
}

- (__CFString)initWithDescriptor:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    float v3 = [WeakRetained detailedDescription];
  }
  else
  {
    float v3 = @"Invalid VKMapView";
  }

  return v3;
}

- (VKMapView)initWithLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKMapView;
  id result = [(VKMapView *)&v4 initWithLayer:a3];
  if (result) {
    *((unsigned char *)result + 528) = 1;
  }
  return result;
}

- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8
{
  double v9 = +[VKMapViewDescriptor descriptorWithShouldRasterize:a3 inBackground:a4 contentScale:a6 auditToken:a7 mapViewPurpose:a8 allowsAntialiasing:a5];
  double v10 = [(VKMapView *)self initWithDescriptor:v9];

  return v10;
}

- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7
{
  return [(VKMapView *)self initShouldRasterize:a3 inBackground:a4 contentScale:a6 auditToken:a7 mapViewPurpose:1 allowsAntialiasing:a5];
}

- (id)consoleString:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(VKMapView *)self currentCanvas];
  uint64_t v5 = [v4 consoleString:v3];

  return v5;
}

- (void)setMapDisplayStyle:(id)a3 animated:(BOOL)a4
{
}

void __33__VKMapView_setMapType_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(a1 + 40);
    if (v3 == *(void **)(v4 + 48)) {
      uint64_t v5 = [v3 flyoverMode];
    }
    else {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
    [v7 mapLayer:v4 flyoverModeDidChange:v5];
  }
}

void __33__VKMapView_setMapType_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) canShowFlyoverDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __33__VKMapView_setMapType_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) showingFlyoverDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __33__VKMapView_setMapType_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) showingFlyoverDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)setMapType:(int)a3
{
}

- (BOOL)supportsNightMode
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_21;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x2FED70A4459DFCA1;
    if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6 || (id v7 = (void *)*v6) == 0)
  {
LABEL_21:
    uint64_t v11 = 0;
    uint64_t v12 = MEMORY[0x100];
    if (!MEMORY[0x100]) {
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_34;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      id v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_21;
    }
LABEL_11:
    id v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (v7[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_34:
  uint64_t v11 = v7[5];
  uint64_t v12 = *(void *)(v11 + 256);
  if (!v12)
  {
LABEL_22:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v11, *(_DWORD *)(v11 + 1096));
    uint64_t v12 = *(void *)(v11 + 256);
  }
LABEL_23:
  uint64_t v13 = *(std::__shared_weak_count **)(v11 + 264);
  double v18 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v12)
  {
    BOOL v16 = 0;
    if (!v13) {
      return v16;
    }
    goto LABEL_31;
  }
  uint64_t v14 = *(void *)(v12 + 16);
  unsigned __int8 v15 = atomic_load((unsigned __int8 *)(v14 + 2784));
  if ((v15 & 1) == 0) {
    std::__assoc_sub_state::wait(*(std::__assoc_sub_state **)(v14 + 2808));
  }
  BOOL v16 = *(unsigned char *)(v14 + 136) != 0;
  uint64_t v13 = v18;
  if (v18)
  {
LABEL_31:
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v16;
}

- (void)_createGlobe
{
  if (!*((void *)self + 6))
  {
    int8x8_t v3 = [[VKClassicGlobeCanvas alloc] initWithMapEngine:*((void *)self + 48) inBackground:0];
    uint8x8_t v4 = (void *)*((void *)self + 6);
    *((void *)self + 6) = v3;

    [*((id *)self + 6) setDelegate:self];
    [*((id *)self + 6) setMapDelegate:self];
    uint64_t v5 = (void *)*((void *)self + 6);
    uint64_t v13 = &unk_1EF559F38;
    id v14 = *((id *)self + 57);
    [v5 setVkCamera:&v13];
    uint64_t v13 = &unk_1EF559F38;

    uint64_t v6 = (void *)*((void *)self + 6);
    uint64_t v7 = *((void *)self + 48);
    uint64_t v8 = *(void *)(v7 + 1064);
    unint64_t v9 = *(std::__shared_weak_count **)(v7 + 1072);
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [v6 setCamera:&v11];
    uint64_t v10 = v12;
    if (v12)
    {
      if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
}

void __31__VKMapView_setDesiredMapMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayer:*(void *)(a1 + 32) willTransitionTo:*(void *)(a1 + 40)];
  }
}

- (void)location:(id)a3 isInHikingContextualRegion:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__VKMapView_location_isInHikingContextualRegion___block_invoke;
  v4[3] = &unk_1E5A8C1B8;
  v4[4] = self;
  BOOL v6 = a4;
  $F24F406B2B787EFB06265DBA3D28CBD5 v5 = a3;
  [(VKMapView *)self _postDelegateCallbackBlock:v4];
}

void __49__VKMapView_location_isInHikingContextualRegion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      BOOL v6 = "YES";
      if (!*(unsigned char *)(a1 + 56)) {
        BOOL v6 = "NO";
      }
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] location:isInHikingContextualRegion: %s", (uint8_t *)&v8, 0x16u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:location:isInHikingContextualRegion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (void)locationInHikingToolTipRegion:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VKMapView_locationInHikingToolTipRegion___block_invoke;
  v3[3] = &unk_1E5A8C190;
  v3[4] = self;
  void v3[5] = a3;
  [(VKMapView *)self _postDelegateCallbackBlock:v3];
}

void __43__VKMapView_locationInHikingToolTipRegion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    id v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 134218240;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] locationInHikingToolTipRegion hikingToolTipRegionId:%llu", (uint8_t *)&v8, 0x16u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v7 mapLayer:*(void *)(a1 + 32) locationInHikingToolTipRegion:*(void *)(a1 + 40)];
  }
}

- (void)nearestVenueDidChange:(const void *)a3 building:(const void *)a4
{
  id v9 = [(VKMapView *)self mapDelegate];
  if (a3)
  {
    id v7 = [[VKVenueFeatureMarker alloc] initWithVenue:a3 localize:[(VKMapView *)self localizeLabels]];
    if (a4)
    {
LABEL_3:
      int v8 = [[VKVenueBuildingFeatureMarker alloc] initWithVenueBuilding:a4 localize:[(VKMapView *)self localizeLabels]];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  int v8 = 0;
LABEL_6:
  [v9 mapLayer:self venueWithFocusDidChange:v7 building:v8];
  if (a4) {

  }
  if (a3) {
}
  }

- (void)_setFloorSwitcherZoomPadding:(float)a3
{
  char v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (v4)
  {
    uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      unint64_t v6 = 0xEC9B77B4222D22FFLL;
      if (*(void *)&v4 <= 0xEC9B77B4222D22FFLL) {
        unint64_t v6 = 0xEC9B77B4222D22FFLL % *(void *)&v4;
      }
    }
    else
    {
      unint64_t v6 = (*(void *)&v4 - 1) & 0xEC9B77B4222D22FFLL;
    }
    id v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
    if (v7)
    {
      int v8 = (void *)*v7;
      if (v8)
      {
        if (v5.u32[0] < 2uLL)
        {
          uint64_t v9 = *(void *)&v4 - 1;
          while (1)
          {
            uint64_t v11 = v8[1];
            if (v11 == 0xEC9B77B4222D22FFLL)
            {
              if (v8[2] == 0xEC9B77B4222D22FFLL) {
                goto LABEL_22;
              }
            }
            else if ((v11 & v9) != v6)
            {
              goto LABEL_16;
            }
            int v8 = (void *)*v8;
            if (!v8) {
              goto LABEL_16;
            }
          }
        }
        do
        {
          unint64_t v10 = v8[1];
          if (v10 == 0xEC9B77B4222D22FFLL)
          {
            if (v8[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_22:
              uint64_t v12 = v8[5];
              if (v12) {
                *(float *)(v12 + 692) = a3;
              }
              break;
            }
          }
          else
          {
            if (v10 >= *(void *)&v4) {
              v10 %= *(void *)&v4;
            }
            if (v10 != v6) {
              break;
            }
          }
          int v8 = (void *)*v8;
        }
        while (v8);
      }
    }
  }
LABEL_16:
  [(VKMapView *)self setNeedsLayout];
}

- (float)zoomToRevealVenueBuildingFloorplan:(id)a3
{
  return 16.0;
}

- (float)zoomToRevealVenueFloorplan:(id)a3
{
  return 16.0;
}

- (id)clearVenueBuildingFloorSelections
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_28;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v3 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v6 = 0xEC9B77B4222D22FFLL % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v6 = (*(void *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  id v7 = *(void **)(*(void *)&v2[1] + 8 * v6);
  if (!v7) {
    goto LABEL_28;
  }
  int v8 = (void *)*v7;
  if (!v8) {
    goto LABEL_28;
  }
  if (v5.u32[0] < 2uLL)
  {
    uint64_t v9 = *(void *)&v3 - 1;
    unint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
    while (1)
    {
      uint64_t v11 = v8[1];
      if (v11 == 0xEC9B77B4222D22FFLL)
      {
        if (v8[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_23;
        }
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_29;
      }
      int v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_29;
      }
    }
  }
  unint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  while (1)
  {
    unint64_t v12 = v8[1];
    if (v12 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v12 >= *(void *)&v3) {
      v12 %= *(void *)&v3;
    }
    if (v12 != v6) {
      goto LABEL_29;
    }
LABEL_17:
    int v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_29;
    }
  }
  if (v8[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_17;
  }
LABEL_23:
  uint64_t v13 = v8[5];
  if (!v13 || !*(unsigned char *)(v13 + 56))
  {
LABEL_28:
    unint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v13 + 272);
  if (v14)
  {
    if (v14 >> 61) {
      abort();
    }
    unsigned __int8 v15 = (char *)operator new(8 * v14);
    BOOL v16 = &v15[8 * v14];
    double v17 = v15;
  }
  else
  {
    double v17 = 0;
    BOOL v16 = 0;
  }
  double v19 = *(void **)(v13 + 264);
  if (v19)
  {
    double v20 = (void *)(v13 + 224);
    uint64_t v21 = v17;
    objc_super v22 = v17;
    uint64_t v47 = v13;
    BOOL v48 = (void *)(v13 + 224);
    do
    {
      long long v23 = v20;
      while (1)
      {
        long long v23 = (void *)*v23;
        if (!v23) {
          break;
        }
        uint64_t v24 = v23[3];
        uint64_t v26 = *(void *)(v24 + 16);
        uint64_t v25 = *(void *)(v24 + 24);
        if (v26 != v25)
        {
          while (*(void *)(v26 + 24) != v19[2])
          {
            v26 += 120;
            if (v26 == v25)
            {
              uint64_t v26 = v25;
              break;
            }
          }
        }
        if (v26 != v25)
        {
          if (!v26) {
            break;
          }
          if (v22 < v16)
          {
            *(void *)objc_super v22 = v26;
            v22 += 8;
            uint64_t v21 = v22;
            break;
          }
          uint64_t v27 = (v22 - v17) >> 3;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 61) {
            abort();
          }
          if ((v16 - v17) >> 2 > v28) {
            unint64_t v28 = (v16 - v17) >> 2;
          }
          if ((unint64_t)(v16 - v17) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v28;
          }
          if (v29)
          {
            if (v29 >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            float v30 = operator new(8 * v29);
          }
          else
          {
            float v30 = 0;
          }
          uint64_t v31 = &v30[8 * v27];
          *(void *)uint64_t v31 = v26;
          uint64_t v21 = v31 + 8;
          if (v22 != v17)
          {
            unint64_t v32 = v22 - 8 - v17;
            if (v32 < 0x168)
            {
              uint64_t v33 = v22;
              goto LABEL_59;
            }
            if (&v30[v22 - v17 - 8 - (v32 & 0xFFFFFFFFFFFFFFF8)] > &v30[v22 - v17 - 8])
            {
              uint64_t v33 = v22;
              goto LABEL_59;
            }
            if (&v22[-(v32 & 0xFFFFFFFFFFFFFFF8) - 8] > v22 - 8)
            {
              uint64_t v33 = v22;
              goto LABEL_59;
            }
            if ((unint64_t)(v17 - v30) < 0x20)
            {
              uint64_t v33 = v22;
              goto LABEL_59;
            }
            uint64_t v35 = (v32 >> 3) + 1;
            uint64_t v33 = &v22[-8 * (v35 & 0x3FFFFFFFFFFFFFFCLL)];
            int64_t v36 = &v30[8 * v27 - 16];
            id v37 = v22 - 16;
            uint64_t v38 = v35 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v39 = *(_OWORD *)v37;
              *(v36 - 1) = *((_OWORD *)v37 - 1);
              *int64_t v36 = v39;
              v36 -= 2;
              v37 -= 32;
              v38 -= 4;
            }
            while (v38);
            v31 -= 8 * (v35 & 0x3FFFFFFFFFFFFFFCLL);
            if (v35 != (v35 & 0x3FFFFFFFFFFFFFFCLL))
            {
              do
              {
LABEL_59:
                uint64_t v34 = *((void *)v33 - 1);
                v33 -= 8;
                *((void *)v31 - 1) = v34;
                v31 -= 8;
              }
              while (v33 != v17);
            }
          }
          BOOL v16 = &v30[8 * v29];
          if (v17) {
            operator delete(v17);
          }
          double v17 = v31;
          objc_super v22 = v21;
          double v20 = v48;
          break;
        }
      }
      double v19 = (void *)*v19;
    }
    while (v19);
    uint64_t v13 = v47;
    unint64_t v14 = *(void *)(v47 + 272);
  }
  else
  {
    uint64_t v21 = v17;
  }
  if (v14)
  {
    double v40 = *(void **)(v13 + 264);
    if (v40)
    {
      do
      {
        uint64_t v41 = (void *)*v40;
        operator delete(v40);
        double v40 = v41;
      }
      while (v41);
    }
    *(void *)(v13 + 264) = 0;
    uint64_t v42 = *(void *)(v13 + 256);
    if (v42)
    {
      for (uint64_t i = 0; i != v42; ++i)
        *(void *)(*(void *)(v13 + 248) + 8 * i) = 0;
    }
    *(void *)(v13 + 272) = 0;
  }
  uint64_t v44 = *(void *)(v13 + 784);
  if (v44) {
    (*(void (**)(uint64_t))(*(void *)v44 + 48))(v44);
  }
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", (v21 - v17) >> 3, v47);
  if (v17 != v21)
  {
    BOOL v45 = v17;
    do
    {
      uint8x8_t v46 = [[VKVenueBuildingFeatureMarker alloc] initWithVenueBuilding:*(void *)v45 localize:[(VKMapView *)self localizeLabels]];
      [v10 addObject:v46];

      v45 += 8;
    }
    while (v45 != v21);
  }
  [(VKMapView *)self setNeedsLayout];
  if (v17) {
    operator delete(v17);
  }
LABEL_29:
  return v10;
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forVenueBuilding:(id)a4
{
  id v17 = a4;
  unint64_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = 0xEC9B77B4222D22FFLL;
      if (*(void *)&v7 <= 0xEC9B77B4222D22FFLL) {
        unint64_t v9 = 0xEC9B77B4222D22FFLL % *(void *)&v7;
      }
    }
    else
    {
      unint64_t v9 = (*(void *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
    }
    unint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
    if (v10)
    {
      uint64_t v11 = (void *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          uint64_t v12 = *(void *)&v7 - 1;
          while (1)
          {
            uint64_t v14 = v11[1];
            if (v14 == 0xEC9B77B4222D22FFLL)
            {
              if (v11[2] == 0xEC9B77B4222D22FFLL) {
                goto LABEL_22;
              }
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_26;
            }
            uint64_t v11 = (void *)*v11;
            if (!v11) {
              goto LABEL_26;
            }
          }
        }
        do
        {
          unint64_t v13 = v11[1];
          if (v13 == 0xEC9B77B4222D22FFLL)
          {
            if (v11[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_22:
              uint64_t v15 = v11[5];
              if (v15 && v17 && *(unsigned char *)(v15 + 56))
              {
                uint64_t v16 = [v17 venueBuildingFeatureMarker];
                md::VenueLogic::setDisplayedFloorOrdinalForVenueBuilding((void *)v15, *(void *)(*(void *)v16 + 56), *(_WORD *)(*(void *)v16 + 88), a3);
              }
              break;
            }
          }
          else
          {
            if (v13 >= *(void *)&v7) {
              v13 %= *(void *)&v7;
            }
            if (v13 != v9) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_26:
  [(VKMapView *)self setNeedsLayout];
}

- (signed)displayedFloorOrdinalForVenueBuilding:(id)a3
{
  id v4 = a3;
  uint8x8_t v5 = v4;
  unint64_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    goto LABEL_26;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v7 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v9 = 0xEC9B77B4222D22FFLL % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
  }
  unint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
  if (!v10) {
    goto LABEL_26;
  }
  uint64_t v11 = (void *)*v10;
  if (!v11) {
    goto LABEL_26;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v7 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == 0xEC9B77B4222D22FFLL)
      {
        if (v11[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_26;
      }
      uint64_t v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v13 >= *(void *)&v7) {
      v13 %= *(void *)&v7;
    }
    if (v13 != v9) {
      goto LABEL_26;
    }
LABEL_11:
    uint64_t v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_26;
    }
  }
  if (v11[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v15 = (int8x8_t *)v11[5];
  if (!v15)
  {
LABEL_26:
    signed __int16 v16 = 0x8000;
    goto LABEL_27;
  }
  signed __int16 v16 = 0x8000;
  if (v4 && v15[7].i8[0])
  {
    uint64_t v17 = [v4 venueBuildingFeatureMarker];
    signed __int16 v16 = md::VenueLogic::displayedFloorOrdinalForVenueBuilding(v15, *(void *)(*(void *)v17 + 56), *(_WORD *)(*(void *)v17 + 88));
  }
LABEL_27:

  return v16;
}

- (signed)defaultFloorOrdinalForVenueBuilding:(id)a3
{
  id v4 = a3;
  uint8x8_t v5 = v4;
  unint64_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    goto LABEL_21;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v7 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v9 = 0xEC9B77B4222D22FFLL % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
  }
  unint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
  if (!v10 || (uint64_t v11 = (void *)*v10) == 0)
  {
LABEL_21:
    signed __int16 v15 = 0x8000;
    goto LABEL_22;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v7 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == 0xEC9B77B4222D22FFLL)
      {
        if (v11[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_23;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_21;
      }
      uint64_t v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v13 >= *(void *)&v7) {
      v13 %= *(void *)&v7;
    }
    if (v13 != v9) {
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_21;
    }
  }
  if (v11[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_23:
  signed __int16 v15 = 0x8000;
  if (v4 && v11[5]) {
    signed __int16 v15 = *(_WORD *)(*(void *)[v4 venueBuildingFeatureMarker] + 88);
  }
LABEL_22:

  return v15;
}

- (BOOL)displayedFloorIsDefaultForVenueBuilding:(id)a3
{
  id v4 = a3;
  uint8x8_t v5 = v4;
  unint64_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    goto LABEL_26;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v7 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v9 = 0xEC9B77B4222D22FFLL % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
  }
  unint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
  if (!v10) {
    goto LABEL_26;
  }
  uint64_t v11 = (void *)*v10;
  if (!v11) {
    goto LABEL_26;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v7 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == 0xEC9B77B4222D22FFLL)
      {
        if (v11[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_26;
      }
      uint64_t v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v13 >= *(void *)&v7) {
      v13 %= *(void *)&v7;
    }
    if (v13 != v9) {
      goto LABEL_26;
    }
LABEL_11:
    uint64_t v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_26;
    }
  }
  if (v11[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_22:
  signed __int16 v15 = (int8x8_t *)v11[5];
  if (!v15)
  {
LABEL_26:
    BOOL IsDefaultForVenueBuilding = 0;
    goto LABEL_27;
  }
  BOOL IsDefaultForVenueBuilding = 0;
  if (v4 && v15[7].i8[0]) {
    BOOL IsDefaultForVenueBuilding = md::VenueLogic::displayedFloorIsDefaultForVenueBuilding(v15, *(void *)(*(void *)[v4 venueBuildingFeatureMarker] + 56));
  }
LABEL_27:

  return IsDefaultForVenueBuilding;
}

- (id)venueWithID:(unint64_t)a3
{
  int8x8_t v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_46;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v4 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v7 = 0xEC9B77B4222D22FFLL % *(void *)&v4;
    }
  }
  else
  {
    unint64_t v7 = (*(void *)&v4 - 1) & 0xEC9B77B4222D22FFLL;
  }
  uint8x8_t v8 = *(void **)(*(void *)&v3[1] + 8 * v7);
  if (!v8) {
    goto LABEL_46;
  }
  unint64_t v9 = (void *)*v8;
  if (!v9) {
    goto LABEL_46;
  }
  if (v6.u32[0] < 2uLL)
  {
    uint64_t v10 = *(void *)&v4 - 1;
    while (1)
    {
      uint64_t v12 = v9[1];
      if (v12 == 0xEC9B77B4222D22FFLL)
      {
        if (v9[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v12 & v10) != v7)
      {
        goto LABEL_46;
      }
      unint64_t v9 = (void *)*v9;
      if (!v9) {
        goto LABEL_46;
      }
    }
  }
  while (1)
  {
    unint64_t v11 = v9[1];
    if (v11 != 0xEC9B77B4222D22FFLL)
    {
      if (v11 >= *(void *)&v4) {
        v11 %= *(void *)&v4;
      }
      if (v11 != v7) {
        goto LABEL_46;
      }
      goto LABEL_11;
    }
    if (v9[2] == 0xEC9B77B4222D22FFLL) {
      break;
    }
LABEL_11:
    unint64_t v9 = (void *)*v9;
    if (!v9) {
      goto LABEL_46;
    }
  }
LABEL_22:
  uint64_t v13 = v9[5];
  if (!v13) {
    goto LABEL_46;
  }
  unint64_t v14 = *(void *)(v13 + 216);
  if (!v14) {
    goto LABEL_46;
  }
  uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    unint64_t v16 = a3;
    if (v14 <= a3) {
      unint64_t v16 = a3 % v14;
    }
  }
  else
  {
    unint64_t v16 = (v14 - 1) & a3;
  }
  uint64_t v17 = *(void **)(*(void *)(v13 + 208) + 8 * v16);
  if (!v17) {
    goto LABEL_46;
  }
  double v18 = (void *)*v17;
  if (!v18) {
    goto LABEL_46;
  }
  if (v15.u32[0] < 2uLL)
  {
    unint64_t v19 = v14 - 1;
    while (1)
    {
      uint64_t v22 = v18[1];
      if (v22 == a3)
      {
        if (v18[2] == a3) {
          goto LABEL_44;
        }
      }
      else if ((v22 & v19) != v16)
      {
        goto LABEL_46;
      }
      double v20 = 0;
      double v18 = (void *)*v18;
      if (!v18) {
        goto LABEL_47;
      }
    }
  }
  while (2)
  {
    unint64_t v21 = v18[1];
    if (v21 != a3)
    {
      if (v21 >= v14) {
        v21 %= v14;
      }
      if (v21 != v16) {
        goto LABEL_46;
      }
      goto LABEL_33;
    }
    if (v18[2] != a3)
    {
LABEL_33:
      double v20 = 0;
      double v18 = (void *)*v18;
      if (!v18) {
        goto LABEL_47;
      }
      continue;
    }
    break;
  }
LABEL_44:
  uint64_t v23 = v18[3];
  if (v23)
  {
    double v20 = [[VKVenueFeatureMarker alloc] initWithVenue:v23 localize:[(VKMapView *)self localizeLabels]];
    goto LABEL_47;
  }
LABEL_46:
  double v20 = 0;
LABEL_47:
  return v20;
}

- (id)venueAtLocation:(id)a3 withMarginForError:(BOOL)a4 includeNonRevealedVenues:(BOOL)a5
{
  uint8x8_t v5 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v6 = v5[2];
  if (!*(void *)&v6) {
    goto LABEL_27;
  }
  BOOL v7 = a5;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v6);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v11 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v6 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v11 = 0xEC9B77B4222D22FFLL % *(void *)&v6;
    }
  }
  else
  {
    unint64_t v11 = (*(void *)&v6 - 1) & 0xEC9B77B4222D22FFLL;
  }
  uint64_t v12 = *(void **)(*(void *)&v5[1] + 8 * v11);
  if (!v12 || (uint64_t v13 = (void *)*v12) == 0)
  {
LABEL_27:
    unint64_t v29 = 0;
    goto LABEL_28;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == 0xEC9B77B4222D22FFLL)
      {
        if (v13[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_27;
      }
      uint64_t v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_27;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v13[1];
    if (v15 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v15 >= *(void *)&v6) {
      v15 %= *(void *)&v6;
    }
    if (v15 != v11) {
      goto LABEL_27;
    }
LABEL_11:
    uint64_t v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_27;
    }
  }
  if (v13[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v17 = v13[5];
  if (!v17) {
    goto LABEL_27;
  }
  double var1 = a3.var1;
  long double v18 = tan(a3.var0 * 0.00872664626 + 0.785398163);
  long double v19 = log(v18);
  v20.f64[0] = var1;
  v20.f64[1] = v19;
  __n128 v21 = (__n128)xmmword_1A28FCBE0;
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v27 = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v20);
  float64x2_t v34 = v27;
  if (!a4)
  {
    float64x2_t v31 = v27;
    unint64_t v32 = (void *)(v17 + 224);
    while (1)
    {
      unint64_t v32 = (void *)*v32;
      if (!v32) {
        goto LABEL_27;
      }
      uint64_t v28 = v32[3];
      if (geo::containsPoint<double>(*(void *)(v28 + 40), *(void *)(v28 + 48), v31.f64[0], v31.f64[1])) {
        goto LABEL_34;
      }
    }
  }
  v21.n128_u32[0] = -1.0;
  if (v7) {
    v21.n128_f32[0] = 0.0;
  }
  uint64_t v28 = md::VenueLogic::venueInProximityToWorldPoint(v17, &v34, v21);
  if (!v28) {
    goto LABEL_27;
  }
LABEL_34:
  unint64_t v29 = [[VKVenueFeatureMarker alloc] initWithVenue:v28 localize:[(VKMapView *)self localizeLabels]];
LABEL_28:
  return v29;
}

- (id)venueAtLocation:(id)a3 withMarginForError:(BOOL)a4
{
  return -[VKMapView venueAtLocation:withMarginForError:includeNonRevealedVenues:](self, "venueAtLocation:withMarginForError:includeNonRevealedVenues:", a4, 0, a3.var0, a3.var1);
}

- (id)venueAtLocation:(id)a3
{
  return -[VKMapView venueAtLocation:withMarginForError:includeNonRevealedVenues:](self, "venueAtLocation:withMarginForError:includeNonRevealedVenues:", 1, 0, a3.var0, a3.var1);
}

- (id)venueBuildingWithFocus
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_26;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v3 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v5 = 0xEC9B77B4222D22FFLL % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  int8x8_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    goto LABEL_26;
  }
  BOOL v7 = (void *)*v6;
  if (!v7) {
    goto LABEL_26;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0xEC9B77B4222D22FFLL)
      {
        if (v7[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_26;
      }
      BOOL v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_26;
    }
LABEL_11:
    BOOL v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_26;
    }
  }
  if (v7[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11)
  {
    if (*(unsigned char *)(v11 + 56))
    {
      uint64_t v12 = *(void *)(v11 + 576);
      if (v12)
      {
        uint64_t v13 = [[VKVenueBuildingFeatureMarker alloc] initWithVenueBuilding:v12 localize:[(VKMapView *)self localizeLabels]];
        goto LABEL_27;
      }
    }
  }
LABEL_26:
  uint64_t v13 = 0;
LABEL_27:
  return v13;
}

- (BOOL)isDimmingBaseMap
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v3 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v5 = 0xEC9B77B4222D22FFLL % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  int8x8_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    return 0;
  }
  BOOL v7 = (void *)*v6;
  if (!v7) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0xEC9B77B4222D22FFLL)
      {
        if (v7[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      BOOL v7 = (void *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    BOOL v7 = (void *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (v7[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11) {
    return *(float *)(v11 + 488) > 0.00000011921;
  }
  return 0;
}

- (void)setDimmingBaseMap:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v9 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = "NO";
    *(_DWORD *)long long buf = 134218754;
    *(void *)&uint8_t buf[4] = self;
    if (v7) {
      uint64_t v11 = "YES";
    }
    else {
      uint64_t v11 = "NO";
    }
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[12] = 2080;
    if (v6) {
      uint64_t v10 = "YES";
    }
    *(_WORD *)&buf[22] = 2080;
    float v57 = v10;
    *(_WORD *)float v58 = 2048;
    *(double *)&v58[2] = a5;
    _os_log_impl(&dword_1A1780000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set dimming base map: %s, animated: %s, duration: %f", buf, 0x2Au);
  }
  uint64_t v12 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v13 = v12[2];
  if (!*(void *)&v13) {
    goto LABEL_30;
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8(v13);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    uint64_t v15 = 0x2FED70A4459DFCA1;
    if (*(void *)&v13 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v15 = 0x2FED70A4459DFCA1uLL % *(void *)&v13;
    }
  }
  else
  {
    uint64_t v15 = (*(void *)&v13 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v16 = *(void **)(*(void *)&v12[1] + 8 * v15);
  if (!v16 || (uint64_t v17 = (void *)*v16) == 0)
  {
LABEL_30:
    uint64_t v21 = 0;
    uint64_t v22 = MEMORY[0x100];
    if (!MEMORY[0x100]) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v14.u32[0] < 2uLL)
  {
    uint64_t v18 = *(void *)&v13 - 1;
    while (1)
    {
      uint64_t v19 = v17[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v17[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_67;
        }
      }
      else if ((v19 & v18) != v15)
      {
        goto LABEL_30;
      }
      uint64_t v17 = (void *)*v17;
      if (!v17) {
        goto LABEL_30;
      }
    }
  }
  while (1)
  {
    unint64_t v20 = v17[1];
    if (v20 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v20 >= *(void *)&v13) {
      v20 %= *(void *)&v13;
    }
    if (v20 != v15) {
      goto LABEL_30;
    }
LABEL_25:
    uint64_t v17 = (void *)*v17;
    if (!v17) {
      goto LABEL_30;
    }
  }
  if (v17[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_25;
  }
LABEL_67:
  uint64_t v21 = v17[5];
  uint64_t v22 = *(void *)(v21 + 256);
  if (!v22)
  {
LABEL_31:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v21, *(_DWORD *)(v21 + 1096));
    uint64_t v22 = *(void *)(v21 + 256);
  }
LABEL_32:
  uint64_t v23 = *(std::__shared_weak_count **)(v21 + 264);
  uint64_t v51 = v22;
  float v52 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v24 = 0;
  if (v7)
  {
    uint64_t v25 = *(void *)(v22 + 16);
    unsigned __int8 v26 = atomic_load((unsigned __int8 *)(v25 + 2784));
    if ((v26 & 1) == 0) {
      std::__assoc_sub_state::wait(*(std::__assoc_sub_state **)(v25 + 2808));
    }
    uint64_t v27 = *(void *)(v25 + 120);
    uint64_t v28 = *(std::__shared_weak_count **)(v25 + 128);
    if (v28)
    {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      int v24 = *(_DWORD *)(v27 + 316);
      if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    else
    {
      int v24 = *(_DWORD *)(v27 + 316);
    }
  }
  uint64_t v29 = *(void *)(v51 + 520);
  float v30 = *(std::__shared_weak_count **)(v51 + 528);
  *(void *)long long buf = v29;
  *(void *)&uint8_t buf[8] = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v29, 0x10049u, v7);
  if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  float64x2_t v31 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v32 = v31[2];
  if (!*(void *)&v32) {
    goto LABEL_80;
  }
  uint8x8_t v33 = (uint8x8_t)vcnt_s8(v32);
  v33.i16[0] = vaddlv_u8(v33);
  if (v33.u32[0] > 1uLL)
  {
    unint64_t v34 = 0xEC9B77B4222D22FFLL;
    if (*(void *)&v32 <= 0xEC9B77B4222D22FFLL) {
      unint64_t v34 = 0xEC9B77B4222D22FFLL % *(void *)&v32;
    }
  }
  else
  {
    unint64_t v34 = (*(void *)&v32 - 1) & 0xEC9B77B4222D22FFLL;
  }
  uint64_t v35 = *(void **)(*(void *)&v31[1] + 8 * v34);
  if (!v35) {
    goto LABEL_80;
  }
  int64_t v36 = (void *)*v35;
  if (!v36) {
    goto LABEL_80;
  }
  if (v33.u32[0] < 2uLL)
  {
    uint64_t v37 = *(void *)&v32 - 1;
    while (1)
    {
      uint64_t v38 = v36[1];
      if (v38 == 0xEC9B77B4222D22FFLL)
      {
        if (v36[2] == 0xEC9B77B4222D22FFLL) {
          goto LABEL_69;
        }
      }
      else if ((v38 & v37) != v34)
      {
        goto LABEL_80;
      }
      int64_t v36 = (void *)*v36;
      if (!v36) {
        goto LABEL_80;
      }
    }
  }
  while (1)
  {
    unint64_t v39 = v36[1];
    if (v39 == 0xEC9B77B4222D22FFLL) {
      break;
    }
    if (v39 >= *(void *)&v32) {
      v39 %= *(void *)&v32;
    }
    if (v39 != v34) {
      goto LABEL_80;
    }
LABEL_61:
    int64_t v36 = (void *)*v36;
    if (!v36) {
      goto LABEL_80;
    }
  }
  if (v36[2] != 0xEC9B77B4222D22FFLL) {
    goto LABEL_61;
  }
LABEL_69:
  uint64_t v40 = v36[5];
  if (!v40)
  {
LABEL_80:
    if (v52)
    {
      if (!atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
    return;
  }
  if (!v6)
  {
    *(_DWORD *)(v40 + 488) = v24;
    uint64_t v48 = *(void *)(v40 + 848);
    if (v48) {
      (*(void (**)(uint64_t))(*(void *)v48 + 48))(v48);
    }
LABEL_76:
    uint64_t v49 = *(void *)(v40 + 880);
    if (v49)
    {
      buf[0] = v7;
      (*(void (**)(uint64_t, unsigned char *))(*(void *)v49 + 48))(v49, buf);
    }
    if (!v6)
    {
      uint64_t v50 = *((void *)self + 48);
      buf[0] = 1;
      md::MapEngine::setNeedsTick(v50, buf);
    }
    goto LABEL_80;
  }
  int v41 = *(_DWORD *)(v40 + 488);
  [*(id *)(v40 + 648) stop];
  uint64_t v42 = [[VKTimedAnimation alloc] initWithDuration:a5];
  float v43 = *(void **)(v40 + 648);
  *(void *)(v40 + 648) = v42;

  uint64_t v44 = *(void **)(v40 + 648);
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___ZN2md10VenueLogic23setBaseMapDimmingFactorEfbd_block_invoke;
  float v57 = (const char *)&__block_descriptor_48_e8_v12__0f8l;
  *(void *)float v58 = v40;
  *(_DWORD *)&v58[8] = v41;
  int v59 = v24;
  [v44 setStepHandler:buf];
  BOOL v45 = *(void **)(v40 + 648);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = ___ZN2md10VenueLogic23setBaseMapDimmingFactorEfbd_block_invoke_2;
  v53[3] = &__block_descriptor_44_e8_v12__0B8l;
  v53[4] = v40;
  int v54 = v24;
  [v45 setCompletionHandler:v53];
  if (!*(void *)(v40 + 816)) {
    goto LABEL_76;
  }
  id v46 = *(id *)(v40 + 648);
  id v55 = v46;
  uint64_t v47 = *(void *)(v40 + 816);
  if (v47)
  {
    (*(void (**)(uint64_t, id *))(*(void *)v47 + 48))(v47, &v55);

    goto LABEL_76;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)setDimmingBaseMap:(BOOL)a3
{
}

- (void)reconfigureFlyoverIfNeeded
{
  [(VKMapView *)self _createGlobe];
  if (*((unsigned char *)self + 32))
  {
    uint64_t v3 = *((unsigned int *)self + 9);
    [(VKMapView *)self setMapType:v3];
  }
}

- (float)worldSpaceWidthOfView
{
  char v2 = (id *)((char *)self + 448);
  uint64_t v3 = [*((id *)self + 57) footprint];
  [v3 minDepth];
  objc_msgSend(v2[1], "widthOfViewAtDepth:");
  float v5 = v4;

  return v5;
}

- (void)tileGroupDidChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] tileGroupDidChange", (uint8_t *)&v7, 0xCu);
  }
  double v4 = +[VKSharedResourcesManager sharedResources];
  [v4 prune:0];

  uint64_t v5 = *((void *)self + 48);
  BOOL v6 = *(unsigned char *)(v5 + 1241) == 0;
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v5 + 4536), "-[VKMapView tileGroupDidChange]");
  md::MapEngineSyncAccessor::configurationDidChange((md::MapEngineSyncAccessor *)v5);
  if (!v6 && !*(unsigned char *)(*((void *)self + 48) + 1241)) {
    [(VKMapView *)self reconfigureFlyoverIfNeeded];
  }
  [(VKMapView *)self _updateBuildingCompressionSetting];
  [(VKMapView *)self _reconfigurePermissions];
}

- (void)tileGroupWillChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] tileGroupWillChange", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_reconfigurePermissions
{
  [(VKMapView *)self setTerrainMode:*((void *)self + 71)];
  [(VKMapView *)self setEnableGlobe:*((unsigned __int8 *)self + 576)];
  [(VKMapView *)self setEnableRoundedBuildings:*((unsigned __int8 *)self + 577)];
  [(VKMapView *)self setEnableColorizedBuildings:*((unsigned __int8 *)self + 578)];
  [(VKMapView *)self setEnableBuildingHeights:*((unsigned __int8 *)self + 579)];
  [(VKMapView *)self setEnableAdvancedWater:*((unsigned __int8 *)self + 581)];
  uint64_t v3 = *((unsigned __int8 *)self + 580);
  [(VKMapView *)self setEnableAdvancedLighting:v3];
}

- (void)requestHikingContextualRegionDoesIntersectForLocation:(id)a3
{
  uint64_t v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (v4)
  {
    uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      unint64_t v6 = 0xC74495586E0C32F6;
      if (*(void *)&v4 <= 0xC74495586E0C32F6) {
        unint64_t v6 = 0xC74495586E0C32F6 % *(void *)&v4;
      }
    }
    else
    {
      unint64_t v6 = (*(void *)&v4 - 1) & 0xC74495586E0C32F6;
    }
    int v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
    if (v7)
    {
      uint64_t v8 = (void *)*v7;
      if (v8)
      {
        if (v5.u32[0] < 2uLL)
        {
          uint64_t v9 = *(void *)&v4 - 1;
          while (1)
          {
            uint64_t v11 = v8[1];
            if (v11 == 0xC74495586E0C32F6)
            {
              if (v8[2] == 0xC74495586E0C32F6) {
                goto LABEL_22;
              }
            }
            else if ((v11 & v9) != v6)
            {
              return;
            }
            uint64_t v8 = (void *)*v8;
            if (!v8) {
              return;
            }
          }
        }
        do
        {
          unint64_t v10 = v8[1];
          if (v10 == 0xC74495586E0C32F6)
          {
            if (v8[2] == 0xC74495586E0C32F6)
            {
LABEL_22:
              uint64_t v12 = v8[5];
              if (v12 && *(unsigned char *)(v12 + 56))
              {
                double var1 = a3.var1;
                long double v13 = tan(a3.var0 * 0.00872664626 + 0.785398163);
                long double v14 = log(v13);
                v15.f64[0] = var1;
                v15.f64[1] = v14;
                __asm { FMOV            V1.2D, #0.5 }
                int v21 = *(unsigned __int8 *)(v12 + 280);
                *(float64x2_t *)(v12 + 264) = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v15);
                if (!v21) {
                  *(unsigned char *)(v12 + 280) = 1;
                }
              }
              return;
            }
          }
          else
          {
            if (v10 >= *(void *)&v4) {
              v10 %= *(void *)&v4;
            }
            if (v10 != v6) {
              return;
            }
          }
          uint64_t v8 = (void *)*v8;
        }
        while (v8);
      }
    }
  }
}

- (void)requestHikingToolTipRegionIDForLocation:(id)a3
{
  uint64_t v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (v4)
  {
    uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      unint64_t v6 = 0xC74495586E0C32F6;
      if (*(void *)&v4 <= 0xC74495586E0C32F6) {
        unint64_t v6 = 0xC74495586E0C32F6 % *(void *)&v4;
      }
    }
    else
    {
      unint64_t v6 = (*(void *)&v4 - 1) & 0xC74495586E0C32F6;
    }
    int v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
    if (v7)
    {
      uint64_t v8 = (void *)*v7;
      if (v8)
      {
        if (v5.u32[0] < 2uLL)
        {
          uint64_t v9 = *(void *)&v4 - 1;
          while (1)
          {
            uint64_t v11 = v8[1];
            if (v11 == 0xC74495586E0C32F6)
            {
              if (v8[2] == 0xC74495586E0C32F6) {
                goto LABEL_22;
              }
            }
            else if ((v11 & v9) != v6)
            {
              return;
            }
            uint64_t v8 = (void *)*v8;
            if (!v8) {
              return;
            }
          }
        }
        do
        {
          unint64_t v10 = v8[1];
          if (v10 == 0xC74495586E0C32F6)
          {
            if (v8[2] == 0xC74495586E0C32F6)
            {
LABEL_22:
              uint64_t v12 = v8[5];
              if (v12 && *(unsigned char *)(v12 + 56))
              {
                double var1 = a3.var1;
                long double v13 = tan(a3.var0 * 0.00872664626 + 0.785398163);
                long double v14 = log(v13);
                v15.f64[0] = var1;
                v15.f64[1] = v14;
                __asm { FMOV            V1.2D, #0.5 }
                int v21 = *(unsigned __int8 *)(v12 + 224);
                *(float64x2_t *)(v12 + 208) = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v15);
                if (!v21) {
                  *(unsigned char *)(v12 + 224) = 1;
                }
              }
              return;
            }
          }
          else
          {
            if (v10 >= *(void *)&v4) {
              v10 %= *(void *)&v4;
            }
            if (v10 != v6) {
              return;
            }
          }
          uint64_t v8 = (void *)*v8;
        }
        while (v8);
      }
    }
  }
}

- (BOOL)isCameraInHikingBufferRegion
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = 0xC74495586E0C32F6;
    if (*(void *)&v3 <= 0xC74495586E0C32F6) {
      unint64_t v5 = 0xC74495586E0C32F6 % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v3 - 1) & 0xC74495586E0C32F6;
  }
  unint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    return 0;
  }
  int v7 = (void *)*v6;
  if (!v7) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0xC74495586E0C32F6)
      {
        if (v7[2] == 0xC74495586E0C32F6) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      int v7 = (void *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0xC74495586E0C32F6) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    int v7 = (void *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (v7[2] != 0xC74495586E0C32F6) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11 && *(unsigned char *)(v11 + 56)) {
    return *(unsigned char *)(v11 + 200) != 0;
  }
  return 0;
}

- (BOOL)isCameraInHikingBoundary
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = 0xC74495586E0C32F6;
    if (*(void *)&v3 <= 0xC74495586E0C32F6) {
      unint64_t v5 = 0xC74495586E0C32F6 % *(void *)&v3;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v3 - 1) & 0xC74495586E0C32F6;
  }
  unint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    return 0;
  }
  int v7 = (void *)*v6;
  if (!v7) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0xC74495586E0C32F6)
      {
        if (v7[2] == 0xC74495586E0C32F6) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      int v7 = (void *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0xC74495586E0C32F6) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    int v7 = (void *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (v7[2] != 0xC74495586E0C32F6) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v11 = v7[5];
  if (v11 && *(unsigned char *)(v11 + 56)) {
    return *(unsigned char *)(v11 + 184) != 0;
  }
  return 0;
}

- (BOOL)enableAdvancedWater
{
  char v2 = +[VKDebugSettings sharedSettings];
  char v3 = [v2 daVinciWaterEnabled];

  return v3;
}

- (BOOL)enableAdvancedLighting
{
  char v2 = +[VKDebugSettings sharedSettings];
  char v3 = [v2 daVinciAdvancedLightingEnabled];

  return v3;
}

- (BOOL)enableBuildingHeights
{
  char v2 = +[VKDebugSettings sharedSettings];
  char v3 = [v2 daVinciBuildingHeights];

  return v3;
}

- (BOOL)enableColorizedBuildings
{
  char v2 = +[VKDebugSettings sharedSettings];
  char v3 = [v2 daVinciColorBuildings];

  return v3;
}

- (BOOL)enableRoundedBuildings
{
  char v2 = +[VKDebugSettings sharedSettings];
  char v3 = [v2 daVinciRoundBuildings];

  return v3;
}

- (BOOL)_hillshadeIsAvailable
{
  int v2 = *(unsigned __int8 *)(*((void *)self + 48) + 4584);
  BOOL result = MapsFeature_IsEnabled_HikingiOS();
  if (!v2) {
    return 0;
  }
  return result;
}

- (BOOL)_realTimeEVChargerIsEnabled
{
  if (MapsFeature_IsEnabled_RealTimeEVCharger()) {
    return 1;
  }
  return GEOConfigGetBOOL();
}

- (BOOL)_modernMapAllowed
{
  return MEMORY[0x1F411C470](self, a2);
}

- (int64_t)terrainMode
{
  uint64_t v2 = *((void *)self + 48);
  if (!v2) {
    return 0;
  }
  char v3 = *(uint64_t **)(v2 + 1128);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4 != v5)
  {
    while (*(unsigned char *)v4 != 29)
    {
      v4 += 16;
      if (v4 == v5) {
        return 0;
      }
    }
  }
  if (v4 == v5) {
    return 0;
  }
  else {
    return *(void *)(v4 + 8);
  }
}

- (BOOL)loadMuninAvailability
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 19)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setLoadMuninMetadata:(BOOL)a3
{
  uint64_t v3 = *(void *)(*((void *)self + 48) + 1128);
  char v4 = 18;
  md::MapEngineSettings::set(v3, &v4, (void *)a3);
}

- (BOOL)isLoadingMuninMetadata
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 18)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setSupportedEVConnectorTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v5 |= 1 << objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue", (void)v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  unint64_t v9 = [(VKMapView *)self _labelSettings];
  *(void *)(v9[5] + 320) = v5;
  uint64_t v10 = (md::LabelManager *)v9[3];
  if (*((void *)v10 + 432) != v5)
  {
    v16[0] = &unk_1EF56EFD0;
    v16[1] = v10;
    v16[2] = v5;
    uint64_t v17 = v16;
    md::LabelManager::queueCommand(v10, 70, 1, v16);
    if (v17 == v16)
    {
      (*(void (**)(void *))(v16[0] + 32))(v16);
    }
    else if (v17)
    {
      (*(void (**)(void *))(*v17 + 40))(v17);
    }
  }
}

- (BOOL)showsLiveEVData
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 36)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsHillshade:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    *(_DWORD *)unint64_t v9 = 134218242;
    *(void *)&v9[4] = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows hillshade: %s", v9, 0x16u);
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
    v9[0] = 32;
    if (v3) {
      unint64_t v8 = [(VKMapView *)self _hillshadeIsAvailable];
    }
    else {
      unint64_t v8 = 0;
    }
    md::MapEngineSettings::set(v7, v9, (void *)v8);
  }
}

- (BOOL)showsHillshade
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 32)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)showsTopographicFeatures
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 34)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsHiking:(BOOL)a3
{
}

- (BOOL)showsHiking
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 33)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)showsVenues
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)showsBuildings
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 1)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setIsMKRenderingSelectionBalloon:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set isMKRenderingSelectionBalloon: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setMKRenderingSelectionBalloon(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)isMKRenderingSelectionBalloon
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 27);
}

- (BOOL)showsPointsOfInterest
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 17);
}

- (void)setShowsLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show labels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 23);
}

- (void)setShowsPhysicalFeatureLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show physical feature labels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsPhysicalFeatureLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsPhysicalFeatureLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 22);
}

- (void)setShowsContourLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show contour labels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsContourLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsContourLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 21);
}

- (void)setShowsPointLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show point labels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsPointLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsPointLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 18);
}

- (void)setShowsRoadShields:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show road shields: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsRoadShields(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsRoadShields
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 20);
}

- (void)setShowsRoadLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2080;
    long long v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show road labels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsRoadLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsRoadLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 19);
}

- (void)setShieldIdiom:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v7 = 134218240;
    int v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shield idiom: %ld", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Presentation::setShieldIdiom(*(md::LabelManager **)(*(void *)v6 + 24), *(void *)(*(void *)v6 + 40), a3);
}

- (int64_t)shieldIdiom
{
  return *(void *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 8);
}

- (void)setNavigationShieldSize:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v7 = 134218240;
    int v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set navigation shield size: %ld", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(VKMapView *)self _labelSettings];
  md::LabelSettings_Navigation::setNavigationShieldSize(*(md::LabelManager **)(v6[1] + 24), *(void *)(v6[1] + 40), +[VKInternalIconManager convertSizeGroup:a3]);
}

- (int64_t)navigationShieldSize
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)([(VKMapView *)self _labelSettings] + 8) + 40)
                          + 2);
  return +[VKInternalIconManager convertGrlSizeGroup:v2];
}

- (double)minimumZoomLevelForTileSize:(int64_t)a3
{
  uint64_t v4 = [(VKMapView *)self currentCanvas];
  uint64_t v5 = [v4 cameraController];
  [v5 minimumZoomLevelForTileSize:a3];
  double v7 = v6;

  return v7;
}

- (BOOL)canZoomOutForTileSize:(int64_t)a3
{
  uint64_t v4 = [(VKMapView *)self currentCanvas];
  uint64_t v5 = [v4 cameraController];
  LOBYTE(a3) = [v5 canZoomOutForTileSize:a3];

  return a3;
}

- (BOOL)canZoomInForTileSize:(int64_t)a3
{
  uint64_t v4 = [(VKMapView *)self currentCanvas];
  uint64_t v5 = [v4 cameraController];
  LOBYTE(a3) = [v5 canZoomInForTileSize:a3];

  return a3;
}

- (void)setGesturing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VKMapView *)self currentCanvas];
  double v6 = [v5 cameraController];
  int v7 = [v6 isGesturing];

  if (v7 != v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    int v8 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = "NO";
      if (v3) {
        __int16 v9 = "YES";
      }
      int v18 = 134218242;
      uint64_t v19 = self;
      __int16 v20 = 2080;
      int v21 = v9;
      _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set gesturing: %s", (uint8_t *)&v18, 0x16u);
      if (v3)
      {
        if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
          dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
        }
        goto LABEL_11;
      }
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
        dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
      }
    }
    else if (v3)
    {
LABEL_11:
      int64_t v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
      uint64_t v11 = v10;
      os_signpost_id_t v12 = *(void *)(*((void *)self + 48) + 1216);
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A1780000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Gesturing", "", (uint8_t *)&v18, 2u);
      }

      md::AnimationManager::forceInstantAnimations(*(md::AnimationManager **)(*((void *)self + 48) + 104), 0);
LABEL_21:
      uint64_t v16 = [(VKMapView *)self currentCanvas];
      uint64_t v17 = [v16 cameraController];
      [v17 setGesturing:v3];

      md::MapEngine::updateRunLoopStatus(*((md::MapEngine **)self + 48));
      return;
    }
    long long v13 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    long long v14 = v13;
    os_signpost_id_t v15 = *(void *)(*((void *)self + 48) + 1216);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Gesturing", "", (uint8_t *)&v18, 2u);
    }

    goto LABEL_21;
  }
}

- (void)enableMapDisplayStyleDebugOverride:(id)a3
{
  unint64_t v3 = *(void *)&a3.var0;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  $6EFE6C6748B912A6EAC8A8E593ED1344 v12 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((_BYTE)v3) {
      double v6 = @"Night";
    }
    else {
      double v6 = @"Day";
    }
    *(_DWORD *)long long buf = 134218242;
    long long v14 = self;
    __int16 v15 = 2080;
    uint64_t v16 = [(__CFString *)v6 UTF8String];
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Map display style debug override enabled, setting time of day to: %s", buf, 0x16u);
  }

  *((unsigned char *)self + 598) = 1;
  if (!(*(_DWORD *)&v12.var0 | *(unsigned __int16 *)&v12.var4 ^ 0x100)
    || (*(_DWORD *)&v12.var0 == 1 ? (BOOL v7 = *(unsigned __int16 *)&v12.var4 == 256) : (BOOL v7 = 0), v7))
  {
    v12.var2 = *((unsigned char *)self + 594);
    unint64_t v3 = *(unsigned int *)&v12.var0 | ((unint64_t)*(unsigned __int16 *)&v12.var4 << 32);
LABEL_28:
    uint64_t v11 = 1;
    goto LABEL_29;
  }
  if (*(_DWORD *)&v12.var0 != 512 || *(unsigned __int16 *)&v12.var4 != 256)
  {
    if (*(_DWORD *)&v12.var0 == 0x10000 && *(unsigned __int16 *)&v12.var4 == 256) {
      goto LABEL_28;
    }
    if (*(_DWORD *)&v12.var0 != 66048 || *(unsigned __int16 *)&v12.var4 != 256) {
      goto LABEL_28;
    }
  }
  uint64_t v11 = 0;
LABEL_29:
  [(VKMapView *)self setEmphasis:v11 animated:1];
  [(VKMapView *)self _applyMapDisplayStyle:v3 & 0xFFFFFFFFFFFFLL animated:1 duration:1.0];
}

- (id)detailedDescriptionDictionaryRepresentation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return v2;
}

- (id)detailedDescription
{
  uint64_t v5 = objc_alloc_init(VKDebugTree);
  [(VKDebugTree *)v5 populateData:self];
  unint64_t v3 = [(VKDebugTree *)v5 logTree];

  return v3;
}

- (BOOL)shouldLoadMapMargin
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 6)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShouldLoadMapMargin:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    double v6 = "NO";
    if (v3) {
      double v6 = "YES";
    }
    int v8 = 134218242;
    __int16 v9 = self;
    __int16 v10 = 2080;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set should load map margin: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1128);
  LOBYTE(v8) = 6;
  md::MapEngineSettings::set(v7, &v8, (void *)v3);
}

- (BOOL)shouldLoadFallbackTiles
{
  id v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 7)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (id)debugLabelString:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *(md::LabelSettings **)([(VKMapView *)self _labelSettings] + 24);
  return md::LabelSettings::debugLabelString(v4, v3);
}

- (void)debugHighlightLabelAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v16 = +[VKDebugSettings sharedSettings];
  int v6 = [v16 daVinciEntityDebugHighlighting];

  if (v6)
  {
    uint64_t v7 = *(void *)(*((void *)self + 48) + 1120);
    unint64_t v8 = *(void *)(v7 + 16);
    if ((v8 & (v8 - 1)) != 0)
    {
      unint64_t v11 = 0x8D737D0C0FC52C0CLL;
      if (v8 <= 0x8D737D0C0FC52C0CLL) {
        unint64_t v11 = 0x8D737D0C0FC52C0CLL % v8;
      }
      __int16 v9 = *(void **)(*(void *)(v7 + 8) + 8 * v11);
      do
      {
        do
          __int16 v9 = (void *)*v9;
        while (v9[1] != 0x8D737D0C0FC52C0CLL);
      }
      while (v9[2] != 0x8D737D0C0FC52C0CLL);
    }
    else
    {
      __int16 v9 = *(void **)(*(void *)(v7 + 8) + 8 * ((v8 - 1) & 0x8D737D0C0FC52C0CLL));
      do
      {
        do
          __int16 v9 = (void *)*v9;
        while (v9[1] != 0x8D737D0C0FC52C0CLL);
      }
      while (v9[2] != 0x8D737D0C0FC52C0CLL);
    }
    uint64_t v12 = v9[5];
    float v13 = x;
    float v14 = y;
    int v15 = *(unsigned __int8 *)(v12 + 144);
    *(float *)(v12 + 136) = v13;
    *(float *)(v12 + 140) = v14;
    if (!v15) {
      *(unsigned char *)(v12 + 144) = 1;
    }
    [(VKMapView *)self setNeedsLayout];
  }
  else
  {
    id v17 = +[VKDebugSettings sharedSettings];
    int v10 = [v17 transitHighlighting];

    if (v10)
    {
      id v18 = [(VKMapView *)self currentCanvas];
      objc_msgSend(v18, "debugHighlightObjectAtPoint:highlightTarget:", 1, x, y);
    }
    else
    {
      (*(void (**)(void))(**(void **)(*(void *)([(VKMapView *)self _labelSettings] + 24) + 240)
                        + 256))();
    }
  }
}

- (BOOL)enableDebugLabelHighlighting
{
  id v2 = +[VKDebugSettings sharedSettings];
  if ([v2 daVinciEntityDebugHighlighting])
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = +[VKDebugSettings sharedSettings];
    if ([v4 labelHighlighting])
    {
      char v3 = 1;
    }
    else
    {
      uint64_t v5 = +[VKDebugSettings sharedSettings];
      char v3 = [v5 transitHighlighting];
    }
  }

  return v3;
}

- (CADisplay)hostDisplay
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 64);
  if (v2) {
    id v3 = *(id *)(v2 + 88);
  }
  else {
    id v3 = 0;
  }
  return (CADisplay *)v3;
}

- (void)didReceiveLocalChanged
{
  uint64_t v2 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v2[567], "-[VKMapView didReceiveLocalChanged]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v2);
}

- (void)didReceiveFlushTileCaches
{
  uint64_t v2 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v2[567], "-[VKMapView didReceiveFlushTileCaches]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v2);
}

- (void)didReceiveMemoryWarning
{
  BOOL v3 = [(VKMapView *)self isEffectivelyHidden];
  [*((id *)self + 5) didReceiveMemoryWarning:v3 beAggressive:0];
  [*((id *)self + 6) didReceiveMemoryWarning:v3 beAggressive:0];
  uint64_t v4 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView didReceiveMemoryWarning]");
  md::MapEngine::prune(v4, !v3);
  id v5 = +[VKSharedResourcesManager sharedResources];
  [v5 prune:1];
}

- (void)clearScene
{
  BOOL v3 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v3[567], "-[VKMapView clearScene]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)v3);
  uint64_t v4 = (void *)*((void *)self + 5);
  [v4 clearScene];
}

- (void)setDebugLayoutContinuously:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[VKDebugSettings sharedSettings];
  [v5 setLayoutContinuously:v3];

  [(VKMapView *)self setNeedsLayout];
}

- (BOOL)debugLayoutContinuously
{
  uint64_t v2 = +[VKDebugSettings sharedSettings];
  char v3 = [v2 layoutContinuously];

  return v3;
}

- (BOOL)staysCenteredDuringRotation
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  char v3 = [v2 cameraController];
  char v4 = [v3 staysCenteredDuringRotation];

  return v4;
}

- (void)setStaysCenteredDuringRotation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = "NO";
    if (v3) {
      int v6 = "YES";
    }
    int v9 = 134218242;
    int v10 = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set stays centered durning rotation: %s", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [(VKMapView *)self currentCanvas];
  unint64_t v8 = [v7 cameraController];
  [v8 setStaysCenteredDuringRotation:v3];
}

- (BOOL)staysCenteredDuringPinch
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  BOOL v3 = [v2 cameraController];
  char v4 = [v3 staysCenteredDuringPinch];

  return v4;
}

- (VKMetrics)metrics
{
  BOOL v3 = (void *)*((void *)self + 67);
  if (!v3)
  {
    char v4 = objc_opt_new();
    objc_msgSend(v4, "setCarDisplayType:", -[VKMapView carDisplayType](self, "carDisplayType"));
    objc_msgSend(v4, "setLabelScaleFactor:", -[VKMapView labelScaleFactor](self, "labelScaleFactor"));
    objc_msgSend(v4, "setShieldSize:", -[VKMapView shieldSize](self, "shieldSize"));
    id v5 = *(int8x8_t **)(*((void *)self + 48) + 1120);
    if (v5)
    {
      int8x8_t v6 = v5[2];
      if (v6)
      {
        uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
        v7.i16[0] = vaddlv_u8(v7);
        if (v7.u32[0] > 1uLL)
        {
          uint64_t v8 = 0x2FED70A4459DFCA1;
          if (*(void *)&v6 <= 0x2FED70A4459DFCA1uLL) {
            uint64_t v8 = 0x2FED70A4459DFCA1uLL % *(void *)&v6;
          }
        }
        else
        {
          uint64_t v8 = (*(void *)&v6 - 1) & 0x2FED70A4459DFCA1;
        }
        int v9 = *(uint64_t ****)(*(void *)&v5[1] + 8 * v8);
        if (v9)
        {
          int v10 = *v9;
          if (v10)
          {
            if (v7.u32[0] < 2uLL)
            {
              uint64_t v11 = *(void *)&v6 - 1;
              while (1)
              {
                uint64_t v13 = v10[1];
                if (v13 == (uint64_t *)0x2FED70A4459DFCA1)
                {
                  if (v10[2] == (uint64_t *)0x2FED70A4459DFCA1) {
                    goto LABEL_24;
                  }
                }
                else if (((unint64_t)v13 & v11) != v8)
                {
                  goto LABEL_32;
                }
                int v10 = (uint64_t **)*v10;
                if (!v10) {
                  goto LABEL_32;
                }
              }
            }
            do
            {
              unint64_t v12 = (unint64_t)v10[1];
              if (v12 == 0x2FED70A4459DFCA1)
              {
                if (v10[2] == (uint64_t *)0x2FED70A4459DFCA1)
                {
LABEL_24:
                  float v14 = v10[5];
                  if (v14)
                  {
                    uint64_t v15 = v14[32];
                    if (!v15)
                    {
                      md::StyleLogic::updateConfiguration((md::StyleLogic *)v10[5], *((_DWORD *)v14 + 274));
                      uint64_t v15 = v14[32];
                    }
                    id v16 = (std::__shared_weak_count *)v14[33];
                    uint64_t v21 = v15;
                    uint64_t v22 = v16;
                    if (v16) {
                      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
                    }
                    [v4 setStyleManager:&v21];
                    id v17 = v22;
                    if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
                      std::__shared_weak_count::__release_weak(v17);
                    }
                  }
                  break;
                }
              }
              else
              {
                if (v12 >= *(void *)&v6) {
                  v12 %= *(void *)&v6;
                }
                if (v12 != v8) {
                  break;
                }
              }
              int v10 = (uint64_t **)*v10;
            }
            while (v10);
          }
        }
      }
    }
LABEL_32:
    id v18 = [[VKMetrics alloc] initWithDescriptor:v4];
    uint64_t v19 = (void *)*((void *)self + 67);
    *((void *)self + 67) = v18;

    BOOL v3 = (void *)*((void *)self + 67);
  }
  return (VKMetrics *)v3;
}

- (BOOL)localizeLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapView *)self _labelSettings] + 40) + 24);
}

- (void)setStaysCenteredDuringPinch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  id v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int8x8_t v6 = "NO";
    if (v3) {
      int8x8_t v6 = "YES";
    }
    int v9 = 134218242;
    int v10 = self;
    __int16 v11 = 2080;
    unint64_t v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set stays centered during pitch: %s", (uint8_t *)&v9, 0x16u);
  }
  uint8x8_t v7 = [(VKMapView *)self currentCanvas];
  uint64_t v8 = [v7 cameraController];
  [v8 setStaysCenteredDuringPinch:v3];
}

- (void)flushTileLoads
{
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((void *)self + 48) + 4536), "-[VKMapView flushTileLoads]");
  uint64_t v3 = *(void *)(*(void *)(*((void *)self + 48) + 896) + 24);
  uint64_t v4 = *(void *)(v3 + 8);
  for (uint64_t i = *(void *)(v3 + 16); v4 != i; v4 += 24)
    gdc::LayerDataSource::cancelAllLayerDataRequests(*(gdc::LayerDataSource **)(v4 + 8));
  gdc::ResourceManager::cleanupResources(*(gdc::ResourceManager **)(v3 + 56));
  uint64_t v6 = *((void *)self + 48);
  if (v6)
  {
    uint8x8_t v7 = *(md::TaskContext **)(v6 + 8);
    uint64_t v8 = *(std::__shared_weak_count **)(v6 + 16);
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    md::TaskContext::flushTileDecodeQueues(v7);
    if (v8)
    {
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

- (void)didFinishSnapshotting
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Did finish suspension snapshot", (uint8_t *)&v5, 0xCu);
  }
  if (*((unsigned char *)self + 240) && ![(VKMapView *)self rendersInBackground])
  {
    uint64_t v4 = *((void *)self + 48);
    [*(id *)(v4 + 840) setRenderSource:0];
    [*(id *)(v4 + 840) destroyRenderTarget];
  }
  *((unsigned char *)self + 392) = 1;
}

- (int64_t)navigationDisplayRate
{
  return *((void *)self + 29);
}

- (int64_t)displayRate
{
  return *(void *)(*(void *)(*((void *)self + 48) + 120) + 8);
}

- (BOOL)trafficIncidentsEnabled
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 3)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (BOOL)hasTraffic
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 4)
    {
      v3 += 16;
      if (v3 == v4) {
        return [(VKMapView *)self trafficEnabled];
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) || [(VKMapView *)self trafficEnabled];
}

- (BOOL)trafficEnabled
{
  uint64_t v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 2)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setApplicationUILayout:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*((void *)self + 25) == a3) {
    return;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  int v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v21 = 134218242;
    uint64_t v22 = self;
    __int16 v23 = 2080;
    int v24 = gss::to_string(a3);
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set applicationUILayout: %s", (uint8_t *)&v21, 0x16u);
  }

  *((void *)self + 25) = a3;
  uint64_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    goto LABEL_26;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    uint64_t v9 = 0x2FED70A4459DFCA1;
    if (*(void *)&v7 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v9 = 0x2FED70A4459DFCA1uLL % *(void *)&v7;
    }
  }
  else
  {
    uint64_t v9 = (*(void *)&v7 - 1) & 0x2FED70A4459DFCA1;
  }
  int v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
  if (!v10 || (__int16 v11 = (void *)*v10) == 0)
  {
LABEL_26:
    uint64_t v15 = 0;
    goto LABEL_27;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v7 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == 0x2FED70A4459DFCA1)
      {
        if (v11[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_43;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_26;
      }
      __int16 v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v13 >= *(void *)&v7) {
      v13 %= *(void *)&v7;
    }
    if (v13 != v9) {
      goto LABEL_26;
    }
LABEL_16:
    __int16 v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_26;
    }
  }
  if (v11[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_16;
  }
LABEL_43:
  uint64_t v15 = v11[5];
LABEL_27:
  if (*(unsigned __int8 *)(v15 + 166) != a3)
  {
    id v16 = *(void **)(v15 + 1184);
    if (v16) {
      [v16 stop];
    }
    *(unsigned char *)(v15 + 166) = a3;
    gss::ClientStyleState<gss::PropertyID>::setTargetClientStyleAttribute(*(void *)(v15 + 208), 0x1003Du, a3);
    gss::ClientStyleState<gss::ScenePropertyID>::setTargetClientStyleAttribute(*(void *)(v15 + 224), 0x1003Du, a3);
    if (*(unsigned char *)(v15 + 1116))
    {
      *(float *)(v15 + 1120) = fmaxf(*(float *)(v15 + 1120), 0.25);
    }
    else
    {
      *(unsigned char *)(v15 + 1116) = 1;
      *(_DWORD *)(v15 + 1120) = 1048576000;
      LOBYTE(v21) = 4;
      id v17 = *(char **)(v15 + 1128);
      id v18 = *(char **)(v15 + 1136);
      if (v17 != v18)
      {
        while (*v17 <= 3u)
        {
          if (++v17 == v18) {
            goto LABEL_38;
          }
        }
      }
      if (v17 == v18 || (id v18 = v17, *v17 != 4)) {
LABEL_38:
      }
        std::vector<md::StyleManagerEvent>::insert(v15 + 1128, v18, (char *)&v21);
      uint64_t v19 = **(void **)(v15 + 1240);
      if (v19)
      {
        LOBYTE(v21) = 12;
        md::MapEngine::setNeedsTick(v19, &v21);
      }
    }
  }
  uint64_t v20 = *((void *)self + 48);
  LOBYTE(v21) = 1;
  md::MapEngine::setNeedsTick(v20, &v21);
}

- (void)setVehicleState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  int v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "YES";
    if (!a3.var0) {
      uint64_t v6 = "NO";
    }
    int v21 = 134218242;
    uint64_t v22 = self;
    __int16 v23 = 2080;
    int v24 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set vehicle state parked: %s", (uint8_t *)&v21, 0x16u);
  }
  int8x8_t v7 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v8 = v7[2];
  if (!*(void *)&v8) {
    goto LABEL_27;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    uint64_t v10 = 0x2FED70A4459DFCA1;
    if (*(void *)&v8 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v10 = 0x2FED70A4459DFCA1uLL % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v10 = (*(void *)&v8 - 1) & 0x2FED70A4459DFCA1;
  }
  __int16 v11 = *(void **)(*(void *)&v7[1] + 8 * v10);
  if (!v11 || (uint64_t v12 = (void *)*v11) == 0)
  {
LABEL_27:
    uint64_t v16 = 0;
    goto LABEL_28;
  }
  if (v9.u32[0] < 2uLL)
  {
    uint64_t v13 = *(void *)&v8 - 1;
    while (1)
    {
      uint64_t v15 = v12[1];
      if (v15 == 0x2FED70A4459DFCA1)
      {
        if (v12[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_39;
        }
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_27;
      }
      uint64_t v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_27;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v12[1];
    if (v14 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_27;
    }
LABEL_17:
    uint64_t v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_27;
    }
  }
  if (v12[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_17;
  }
LABEL_39:
  uint64_t v16 = v12[5];
LABEL_28:
  int var0 = a3.var0;
  if (*(unsigned __int8 *)(v16 + 160) != var0)
  {
    *(unsigned char *)(v16 + 160) = var0;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(void *)(v16 + 208), 0x10019u, var0);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(void *)(v16 + 224), 0x10019u, var0);
    LOBYTE(v21) = 4;
    id v18 = *(char **)(v16 + 1128);
    uint64_t v19 = *(char **)(v16 + 1136);
    if (v18 != v19)
    {
      while (*v18 <= 3u)
      {
        if (++v18 == v19) {
          goto LABEL_35;
        }
      }
    }
    if (v18 == v19 || (uint64_t v19 = v18, *v18 != 4)) {
LABEL_35:
    }
      std::vector<md::StyleManagerEvent>::insert(v16 + 1128, v19, (char *)&v21);
    uint64_t v20 = **(void **)(v16 + 1240);
    if (v20)
    {
      LOBYTE(v21) = 12;
      md::MapEngine::setNeedsTick(v20, &v21);
    }
  }
}

- ($E5C720D6BB068A42F0C2CD001350366C)vehicleState
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return ($E5C720D6BB068A42F0C2CD001350366C)(*(unsigned char *)(v4[5] + 160) & 1);
}

- (int64_t)carDisplayType
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(unsigned __int8 *)(v4[5] + 163);
}

- (void)setNavCameraMode:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*((void *)self + 75) != a3)
  {
    int v3 = a3;
    *((void *)self + 75) = a3;
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
    }
    unint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      int8x8_t v7 = self;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set nav camera mode to:%d", (uint8_t *)&v6, 0x12u);
    }
    [(VKMapView *)self _updateCameraThermalOptions];
  }
}

- (void)setCarDisplayConfig:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0x2FED70A4459DFCA1;
  uint64_t v7 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v8 = *(void *)(v7 + 16);
  if ((v8 & (v8 - 1)) != 0)
  {
    unint64_t v10 = 0x2FED70A4459DFCA1;
    if (v8 <= 0x2FED70A4459DFCA1) {
      unint64_t v10 = 0x2FED70A4459DFCA1 % v8;
    }
    int v9 = *(void **)(*(void *)(v7 + 8) + 8 * v10);
    do
    {
      do
        int v9 = (void *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    int v9 = *(void **)(*(void *)(v7 + 8) + 8 * ((v8 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        int v9 = (void *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  if (*(unsigned __int8 *)(v9[5] + 162) == a3) {
    return;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  __int16 v11 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v30 = 134218242;
    float64x2_t v31 = self;
    __int16 v32 = 2080;
    uint8x8_t v33 = gss::to_string(a3);
    _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set car display config:%s", (uint8_t *)&v30, 0x16u);
  }

  uint64_t v12 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v13 = v12[2];
  if (!*(void *)&v13) {
    goto LABEL_36;
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8(v13);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    if (*(void *)&v13 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v6 = 0x2FED70A4459DFCA1uLL % *(void *)&v13;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v13 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v15 = *(void **)(*(void *)&v12[1] + 8 * v6);
  if (!v15 || (uint64_t v16 = (void *)*v15) == 0)
  {
LABEL_36:
    uint64_t v20 = 0;
    goto LABEL_37;
  }
  if (v14.u32[0] < 2uLL)
  {
    uint64_t v17 = *(void *)&v13 - 1;
    while (1)
    {
      uint64_t v19 = v16[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v16[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_57;
        }
      }
      else if ((v19 & v17) != v6)
      {
        goto LABEL_36;
      }
      uint64_t v16 = (void *)*v16;
      if (!v16) {
        goto LABEL_36;
      }
    }
  }
  while (1)
  {
    unint64_t v18 = v16[1];
    if (v18 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v18 >= *(void *)&v13) {
      v18 %= *(void *)&v13;
    }
    if (v18 != v6) {
      goto LABEL_36;
    }
LABEL_26:
    uint64_t v16 = (void *)*v16;
    if (!v16) {
      goto LABEL_36;
    }
  }
  if (v16[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_26;
  }
LABEL_57:
  uint64_t v20 = v16[5];
LABEL_37:
  if (*(unsigned __int8 *)(v20 + 162) != a3)
  {
    *(unsigned char *)(v20 + 162) = a3;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(void *)(v20 + 208), 0x10078u, a3);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(void *)(v20 + 224), 0x10078u, *(unsigned __int8 *)(v20 + 162));
    LOBYTE(v30) = 4;
    int v21 = *(char **)(v20 + 1128);
    uint64_t v22 = *(char **)(v20 + 1136);
    if (v21 != v22)
    {
      while (*v21 <= 3u)
      {
        if (++v21 == v22) {
          goto LABEL_44;
        }
      }
    }
    if (v21 == v22 || (uint64_t v22 = v21, *v21 != 4)) {
LABEL_44:
    }
      std::vector<md::StyleManagerEvent>::insert(v20 + 1128, v22, (char *)&v30);
    uint64_t v23 = **(void **)(v20 + 1240);
    if (v23)
    {
      LOBYTE(v30) = 12;
      md::MapEngine::setNeedsTick(v23, &v30);
    }
  }
  uint64_t v24 = *((void *)self + 48);
  LOBYTE(v30) = 1;
  md::MapEngine::setNeedsTick(v24, &v30);
  if (a3 == 2)
  {
    uint64_t v25 = *(uint64_t **)(*((void *)self + 48) + 1128);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    if (v27 != v26)
    {
      uint64_t v28 = v27 + 16;
      do
      {
        BOOL v29 = *(unsigned char *)(v28 - 16) == 31 || v28 == v26;
        v28 += 16;
      }
      while (!v29);
    }
  }
  [(VKMapView *)self setNavCameraMode:0];
}

- (int64_t)carDisplayConfig
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        uint64_t v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(unsigned __int8 *)(v4[5] + 162);
}

- (void)setStyleZOffsetScale:(float)a3
{
  unint64_t v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    return;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0x2FED70A4459DFCA1;
    if (*(void *)&v4 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v6 = 0x2FED70A4459DFCA1uLL % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v4 - 1) & 0x2FED70A4459DFCA1;
  }
  int8x8_t v7 = v3[1];
  unint64_t v8 = *(void **)(*(void *)&v7 + 8 * v6);
  if (!v8) {
    goto LABEL_24;
  }
  int v9 = (void *)*v8;
  if (!v9) {
    goto LABEL_24;
  }
  if (v5.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v11 = v9[1];
      if (v11 == 0x2FED70A4459DFCA1)
      {
        if (v9[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_22;
        }
      }
      else if ((v11 & (*(void *)&v4 - 1)) != v6)
      {
        goto LABEL_24;
      }
      int v9 = (void *)*v9;
      if (!v9) {
        goto LABEL_24;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = v9[1];
    if (v10 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v10 >= *(void *)&v4) {
      v10 %= *(void *)&v4;
    }
    if (v10 != v6) {
      goto LABEL_24;
    }
LABEL_11:
    int v9 = (void *)*v9;
    if (!v9) {
      goto LABEL_24;
    }
  }
  if (v9[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v12 = v9[5];
  if (v12) {
    *(float *)(v12 + 124) = a3;
  }
LABEL_24:
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v13 = 0x8E629317B3523E63;
    if (*(void *)&v4 <= 0x8E629317B3523E63) {
      unint64_t v13 = 0x8E629317B3523E63 % *(void *)&v4;
    }
  }
  else
  {
    unint64_t v13 = (*(void *)&v4 - 1) & 0x8E629317B3523E63;
  }
  uint8x8_t v14 = *(void **)(*(void *)&v7 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = (void *)*v14;
    if (v15)
    {
      if (v5.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v4 - 1;
        while (1)
        {
          uint64_t v18 = v15[1];
          if (v18 == 0x8E629317B3523E63)
          {
            if (v15[2] == 0x8E629317B3523E63) {
              goto LABEL_44;
            }
          }
          else if ((v18 & v16) != v13)
          {
            return;
          }
          uint64_t v15 = (void *)*v15;
          if (!v15) {
            return;
          }
        }
      }
      do
      {
        unint64_t v17 = v15[1];
        if (v17 == 0x8E629317B3523E63)
        {
          if (v15[2] == 0x8E629317B3523E63)
          {
LABEL_44:
            uint64_t v19 = v15[5];
            if (v19) {
              *(float *)(v19 + 120) = a3;
            }
            return;
          }
        }
        else
        {
          if (v17 >= *(void *)&v4) {
            v17 %= *(void *)&v4;
          }
          if (v17 != v13) {
            return;
          }
        }
        uint64_t v15 = (void *)*v15;
      }
      while (v15);
    }
  }
}

- (float)styleZOffsetScale
{
  uint64_t v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  float result = 1.0;
  if (v3)
  {
    uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      uint64_t v6 = 0x2FED70A4459DFCA1;
      if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
        uint64_t v6 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
      }
    }
    else
    {
      uint64_t v6 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
    }
    int8x8_t v7 = *(void **)(*(void *)&v2[1] + 8 * v6);
    if (v7)
    {
      unint64_t v8 = (void *)*v7;
      if (v8)
      {
        if (v5.u32[0] < 2uLL)
        {
          uint64_t v9 = *(void *)&v3 - 1;
          while (1)
          {
            uint64_t v11 = v8[1];
            if (v11 == 0x2FED70A4459DFCA1)
            {
              if (v8[2] == 0x2FED70A4459DFCA1) {
                goto LABEL_22;
              }
            }
            else if ((v11 & v9) != v6)
            {
              return result;
            }
            unint64_t v8 = (void *)*v8;
            if (!v8) {
              return result;
            }
          }
        }
        do
        {
          unint64_t v10 = v8[1];
          if (v10 == 0x2FED70A4459DFCA1)
          {
            if (v8[2] == 0x2FED70A4459DFCA1)
            {
LABEL_22:
              uint64_t v12 = v8[5];
              if (v12) {
                return *(float *)(v12 + 124);
              }
              return result;
            }
          }
          else
          {
            if (v10 >= *(void *)&v3) {
              v10 %= *(void *)&v3;
            }
            if (v10 != v6) {
              return result;
            }
          }
          unint64_t v8 = (void *)*v8;
        }
        while (v8);
      }
    }
  }
  return result;
}

- (void)reloadStylesheet
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    int8x8_t v4 = *(uint64_t ***)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        int8x8_t v4 = (uint64_t **)*v4;
      while (v4[1] != (uint64_t *)0x2FED70A4459DFCA1);
    }
    while (v4[2] != (uint64_t *)0x2FED70A4459DFCA1);
  }
  else
  {
    int8x8_t v4 = *(uint64_t ***)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        int8x8_t v4 = (uint64_t **)*v4;
      while (v4[1] != (uint64_t *)0x2FED70A4459DFCA1);
    }
    while (v4[2] != (uint64_t *)0x2FED70A4459DFCA1);
  }
  (*(void (**)(void))(*v4[5] + 16))();
}

- (BOOL)stylesheetIsDevResource
{
  uint64_t v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_21;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x2FED70A4459DFCA1;
    if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6 || (int8x8_t v7 = (void *)*v6) == 0)
  {
LABEL_21:
    uint64_t v11 = 0;
    uint64_t v12 = MEMORY[0x100];
    if (!MEMORY[0x100]) {
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_32;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      int8x8_t v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_21;
    }
LABEL_11:
    int8x8_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (v7[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_32:
  uint64_t v11 = v7[5];
  uint64_t v12 = *(void *)(v11 + 256);
  if (!v12)
  {
LABEL_22:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v11, *(_DWORD *)(v11 + 1096));
    uint64_t v12 = *(void *)(v11 + 256);
  }
LABEL_23:
  unint64_t v13 = *(std::__shared_weak_count **)(v11 + 264);
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v12)
  {
    BOOL v14 = *(unsigned char *)(*(void *)(v12 + 16) + 80) != 0;
    if (!v13) {
      return v14;
    }
LABEL_29:
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  else
  {
    BOOL v14 = 0;
    if (v13) {
      goto LABEL_29;
    }
  }
  return v14;
}

- (id)attributionsForCurrentRegion
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  int8x8_t v3 = [v2 attributionsForCurrentRegion];

  return v3;
}

- (NSArray)visibleTileSets
{
  uint64_t v2 = [(VKMapView *)self currentCanvas];
  int8x8_t v3 = [v2 visibleTileSets];

  return (NSArray *)v3;
}

- (void)forceCameraUpdateForFrameResize
{
  id v2 = [(VKMapView *)self currentCanvas];
  [v2 updateCameraForFrameResize];
}

- (void)forceLayout
{
  int8x8_t v3 = [(VKMapView *)self currentCanvas];
  [v3 updateCameraForFrameResize];

  uint64_t v4 = *((void *)self + 48);
  char v7 = 1;
  md::MapEngine::setNeedsTick(v4, &v7);
  uint64_t v5 = (md::HomeQueueScheduler **)*((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v5[567], "-[VKMapView forceLayout]");
  double v6 = CACurrentMediaTime();
  if (md::MapEngine::renderSceneSync((md::MapEngine *)v5, v6))
  {
    [(VKMapView *)self didPresent];
  }
}

- (void)_forceLayoutForSuspensionSnapShot
{
  int8x8_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v3 objectForInfoDictionaryKey:@"CAProcessCanAccessGPU"];

  if (v6 && ([v6 BOOLValue] & 1) != 0)
  {
    BOOL v4 = [(VKMapView *)self rendersInBackground];
    [(VKMapView *)self setRendersInBackground:1];
    uint64_t v5 = *((void *)self + 48);
    [*(id *)(v5 + 840) setRenderSource:0];
    [*(id *)(v5 + 840) destroyRenderTarget];
    [(VKMapView *)self _createDisplayLayer];
    [(VKMapView *)self forceLayout];
    [(VKMapView *)self setRendersInBackground:v4];
  }
}

- (id)secondaryCanvas
{
  int8x8_t v3 = [(VKMapView *)self currentCanvas];
  BOOL v4 = (void *)*((void *)self + 5);
  if (v3 == v4) {
    BOOL v4 = (void *)*((void *)self + 6);
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isOfflineMode
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    BOOL v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        BOOL v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    BOOL v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        BOOL v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(unsigned char *)(v4[5] + 178) == 1;
}

- (void)setOfflineRegionSelector:(BOOL)a3
{
  int v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0x2FED70A4459DFCA1;
  uint64_t v6 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v7 = *(void *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    unint64_t v9 = 0x2FED70A4459DFCA1;
    if (v7 <= 0x2FED70A4459DFCA1) {
      unint64_t v9 = 0x2FED70A4459DFCA1 % v7;
    }
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 8 * v9);
    do
    {
      do
        uint64_t v8 = (void *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 8 * ((v7 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        uint64_t v8 = (void *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  if (*(unsigned char *)(v8[5] + 177) == a3) {
    return;
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218242;
    uint64_t v25 = self;
    __int16 v26 = 2080;
    uint64_t v27 = gss::to_string(v3);
    _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set set offline region selector:%s", (uint8_t *)&v24, 0x16u);
  }

  uint64_t v11 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v12 = v11[2];
  if (!*(void *)&v12) {
    goto LABEL_36;
  }
  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    if (*(void *)&v12 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v12;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  BOOL v14 = *(void **)(*(void *)&v11[1] + 8 * v5);
  if (!v14 || (uint64_t v15 = (void *)*v14) == 0)
  {
LABEL_36:
    uint64_t v19 = 0;
    goto LABEL_37;
  }
  if (v13.u32[0] < 2uLL)
  {
    uint64_t v16 = *(void *)&v12 - 1;
    while (1)
    {
      uint64_t v18 = v15[1];
      if (v18 == 0x2FED70A4459DFCA1)
      {
        if (v15[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_49;
        }
      }
      else if ((v18 & v16) != v5)
      {
        goto LABEL_36;
      }
      uint64_t v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_36;
      }
    }
  }
  while (1)
  {
    unint64_t v17 = v15[1];
    if (v17 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v17 >= *(void *)&v12) {
      v17 %= *(void *)&v12;
    }
    if (v17 != v5) {
      goto LABEL_36;
    }
LABEL_26:
    uint64_t v15 = (void *)*v15;
    if (!v15) {
      goto LABEL_36;
    }
  }
  if (v15[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_26;
  }
LABEL_49:
  uint64_t v19 = v15[5];
LABEL_37:
  if (*(unsigned __int8 *)(v19 + 177) != v3)
  {
    *(unsigned char *)(v19 + 177) = v3;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(void *)(v19 + 208), 0x10080u, v3);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(void *)(v19 + 224), 0x10080u, *(unsigned __int8 *)(v19 + 177));
    LOBYTE(v24) = 4;
    uint64_t v20 = *(char **)(v19 + 1128);
    int v21 = *(char **)(v19 + 1136);
    if (v20 != v21)
    {
      while (*v20 <= 3u)
      {
        if (++v20 == v21) {
          goto LABEL_44;
        }
      }
    }
    if (v20 == v21 || (int v21 = v20, *v20 != 4)) {
LABEL_44:
    }
      std::vector<md::StyleManagerEvent>::insert(v19 + 1128, v21, (char *)&v24);
    uint64_t v22 = **(void **)(v19 + 1240);
    if (v22)
    {
      LOBYTE(v24) = 12;
      md::MapEngine::setNeedsTick(v22, &v24);
    }
  }
  uint64_t v23 = *((void *)self + 48);
  LOBYTE(v24) = 1;
  md::MapEngine::setNeedsTick(v23, &v24);
}

- (BOOL)isOfflineRegionSelector
{
  uint64_t v2 = *(void *)(*((void *)self + 48) + 1120);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    BOOL v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        BOOL v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    BOOL v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        BOOL v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(unsigned char *)(v4[5] + 177) == 1;
}

- (BOOL)isLabelMarkerSelectionEnabled
{
  return *(unsigned char *)(*(void *)(*(void *)([(VKMapView *)self _labelSettings] + 16) + 40) + 28);
}

- (VKMapViewCameraDelegate)cameraDelegate
{
  id v2 = *(id *)(*((void *)self + 48) + 1104);
  unint64_t v3 = [v2 cameraDelegate];

  return (VKMapViewCameraDelegate *)v3;
}

- (void)setApplicationSubState:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  unint64_t v5 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = &stru_1EF593218;
    if (v3 == 1) {
      uint64_t v6 = @"Route Creation";
    }
    if (!v3) {
      uint64_t v6 = @"Default";
    }
    int v8 = 134218242;
    unint64_t v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    unint64_t v7 = v5;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set application substate: %@", (uint8_t *)&v8, 0x16u);
  }
  if (*((unsigned __int8 *)self + 193) != v3)
  {
    *((unsigned char *)self + 193) = v3;
    [(VKMapView *)self _updateMapDisplayStyle];
  }
}

- (void)setApplicationState:(unsigned __int8)a3
{
}

+ (BOOL)_globeIsAvailable
{
  if (!MapsFeature_IsAvailable_ShelbyvilleGlobe()) {
    return 0;
  }
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  int v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v2 = [v3 supportsAdvancedMap];

  return v2;
}

+ (BOOL)_elevatedGroundIsAvailable
{
  if (!MapsFeature_IsAvailable_ShelbyvilleTerrain()) {
    return 0;
  }
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  int v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v2 = [v3 supportsAdvancedMap];

  return v2;
}

- (void)_shutdownThermalMonitor
{
  int v3 = *((_DWORD *)self + 129);
  if (v3)
  {
    notify_cancel(v3);
    *((_DWORD *)self + 129) = 0;
  }
}

void __42__VKMapView_Thermal___setupThermalMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateThermalPressureLevel];
}

- (void)_updateCameraThermalOptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)self + 192) == 2)
  {
    if ((*((void *)self + 75) | 2) == 3) {
      int v3 = (int *)(*((void *)self + 63) + 16 * *((unsigned __int8 *)self + 512) + 68);
    }
    else {
      int v3 = (int *)(*((void *)self + 63) + 16 * *((unsigned __int8 *)self + 512) + 4);
    }
  }
  else
  {
    int v3 = (int *)(*((void *)self + 63) + 16 * *((unsigned __int8 *)self + 512) + 132);
  }
  int v4 = *((unsigned __int8 *)v3 + 12);
  uint64_t v5 = v3[2];
  if (*((unsigned char *)v3 + 4)) {
    uint64_t v6 = *v3;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(VKMapView *)self currentCanvas];
  [v7 setBaseDisplayRate:v6];

  if (v4) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(VKMapView *)self currentCanvas];
  [v9 setMaxDisplayRate:v8];

  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  __int16 v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [(VKMapView *)self currentCanvas];
    int v12 = [v11 baseDisplayRate];
    uint8x8_t v13 = [(VKMapView *)self currentCanvas];
    int v14 = 134218496;
    uint64_t v15 = self;
    __int16 v16 = 1024;
    int v17 = v12;
    __int16 v18 = 1024;
    int v19 = [v13 maxDisplayRate];
    _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set Nav Thermal Options: targetFps=%i, maxFps:%i", (uint8_t *)&v14, 0x18u);
  }
}

- (void)_setThermalPressureLevel:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_1160);
  }
  uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    unint64_t v7 = self;
    __int16 v8 = 1024;
    int v9 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] set thermal pressure %i", (uint8_t *)&v6, 0x12u);
  }
  *((void *)self + 65) = a3;
  if (a3 < 0x1E)
  {
    if (a3 < 0x14) {
      *((unsigned char *)self + 512) = a3 >= 0xA;
    }
    else {
      *((unsigned char *)self + 512) = 2;
    }
  }
  else
  {
    *((unsigned char *)self + 512) = 3;
  }
}

- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *((void *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView(Internal) populateDebugNode:withOptions:]");
  __dst[23] = 4;
  strcpy(__dst, "Self");
  id v8 = [(VKMapView *)self description];
  int v9 = (const std::string::value_type *)[v8 UTF8String];
  memset(&__p, 0, sizeof(__p));
  int v113 = 4;
  if (v9)
  {
    std::string::__assign_external(&__p, v9);
  }
  else
  {
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v111);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  __dst[23] = 16;
  strcpy(__dst, "Is in Background");
  uint64_t v10 = *((unsigned __int8 *)self + 240);
  int v110 = 0;
  memset(&v109[4], 0, 24);
  v109[0] = v10;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v109);
  __dst[23] = 8;
  strcpy(__dst, "Map Type");
  if (*((unsigned char *)self + 32))
  {
    unsigned int v11 = *((_DWORD *)self + 9) - 1;
    if (v11 > 0xA) {
      int v12 = @"VKMapTypeStandard";
    }
    else {
      int v12 = off_1E5A8C3A0[v11];
    }
    uint8x8_t v13 = (const std::string::value_type *)[(__CFString *)v12 UTF8String];
    memset(&v107, 0, sizeof(v107));
    int v108 = 4;
    if (v13)
    {
      std::string::__assign_external(&v107, v13);
    }
    else
    {
      *((unsigned char *)&v107.__r_.__value_.__s + 23) = 6;
      qmemcpy(&v107, "<null>", 6);
    }
  }
  else
  {
    memset(&v107, 0, sizeof(v107));
    int v108 = 4;
    std::string::__assign_external(&v107, "NONE");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v106);
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v107.__r_.__value_.__l.__data_);
  }
  __dst[23] = 21;
  strcpy(__dst, "Renders In Background");
  int v105 = 0;
  memset(&v104[4], 0, 24);
  v104[0] = [(VKMapView *)self rendersInBackground];
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v104);
  int v14 = (char *)operator new(0x19uLL);
  *(void *)__dst = v14;
  *(_OWORD *)&__dst[8] = xmmword_1A28FCDB0;
  strcpy(v14, "Did Finish Snapshotting");
  uint64_t v15 = *((unsigned __int8 *)self + 392);
  int v103 = 0;
  memset(&v102[4], 0, 24);
  v102[0] = v15;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v102);
  operator delete(v14);
  __dst[23] = 6;
  strcpy(__dst, "Hidden");
  int v101 = 0;
  memset(&v100[4], 0, 24);
  v100[0] = [(VKMapView *)self isHidden];
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v100);
  uint64_t v16 = *(void *)(*(void *)(*((void *)self + 48) + 120) + 8);
  __dst[23] = 12;
  strcpy(__dst, "Display Rate");
  int v99 = 0;
  memset(&v98[4], 0, 24);
  v98[0] = v16;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v98);
  int v17 = (char *)operator new(0x19uLL);
  *(void *)__dst = v17;
  *(_OWORD *)&__dst[8] = xmmword_1A28FCDB0;
  strcpy(v17, "Navigation Display Rate");
  __int16 v18 = [(VKMapView *)self currentCanvas];
  int v19 = [v18 cameraController];
  int v97 = 0;
  memset(&v96[4], 0, 24);
  v96[0] = [v19 baseDisplayRate];
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v96);

  operator delete(v17);
  __dst[23] = 12;
  strcpy(__dst, "Display Rate");
  uint64_t v20 = *(void *)(*(void *)(*((void *)self + 48) + 120) + 8);
  int v95 = 0;
  memset(&v94[4], 0, 24);
  v94[0] = v20;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v94);
  __dst[23] = 17;
  strcpy(__dst, "Application State");
  unint64_t v21 = *((unsigned __int8 *)self + 192);
  if (v21 > 9) {
    uint64_t v22 = &stru_1EF593218;
  }
  else {
    uint64_t v22 = off_1E5A8C3F8[v21];
  }
  uint64_t v23 = (const std::string::value_type *)[(__CFString *)v22 UTF8String];
  memset(&v92, 0, sizeof(v92));
  int v93 = 4;
  if (v23)
  {
    std::string::__assign_external(&v92, v23);
  }
  else
  {
    *((unsigned char *)&v92.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v92, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v91);
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v92.__r_.__value_.__l.__data_);
  }
  __dst[23] = 13;
  strcpy(__dst, "Display Style");
  ChildNode = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (long long *)__dst);
  unint64_t v25 = (unint64_t)[(VKMapView *)self mapDisplayStyle];
  __int16 v26 = (char *)operator new(0x20uLL);
  *(void *)__dst = v26;
  *(_OWORD *)&__dst[8] = xmmword_1A28FCDC0;
  strcpy(v26, "Displayed Search Results Type");
  unint64_t v27 = *((unsigned __int8 *)self + 208);
  if (v27 > 4) {
    uint64_t v28 = &stru_1EF593218;
  }
  else {
    uint64_t v28 = off_1E5A8C448[v27];
  }
  BOOL v29 = (const std::string::value_type *)[(__CFString *)v28 UTF8String];
  memset(&v89, 0, sizeof(v89));
  int v90 = 4;
  if (v29)
  {
    std::string::__assign_external(&v89, v29);
  }
  else
  {
    *((unsigned char *)&v89.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v89, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v88);
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v89.__r_.__value_.__l.__data_);
  }
  operator delete(v26);
  __dst[23] = 10;
  strcpy(__dst, "TimePeriod");
  if ((_BYTE)v25) {
    int v30 = @"Night";
  }
  else {
    int v30 = @"Day";
  }
  float64x2_t v31 = (const std::string::value_type *)[(__CFString *)v30 UTF8String];
  memset(&v86, 0, sizeof(v86));
  int v87 = 4;
  if (v31)
  {
    std::string::__assign_external(&v86, v31);
  }
  else
  {
    *((unsigned char *)&v86.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v86, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v85);
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v86.__r_.__value_.__l.__data_);
  }
  __dst[23] = 11;
  strcpy(__dst, "OverlayType");
  __int16 v32 = @"None";
  if (BYTE1(v25) == 1) {
    __int16 v32 = @"Traffic";
  }
  if (BYTE1(v25) == 2) {
    uint8x8_t v33 = @"Transit";
  }
  else {
    uint8x8_t v33 = v32;
  }
  uint64_t v34 = (const std::string::value_type *)[(__CFString *)v33 UTF8String];
  memset(&v83, 0, sizeof(v83));
  int v84 = 4;
  if (v34)
  {
    std::string::__assign_external(&v83, v34);
  }
  else
  {
    *((unsigned char *)&v83.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v83, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v82);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v83.__r_.__value_.__l.__data_);
  }
  __dst[23] = 16;
  strcpy(__dst, "ApplicationState");
  if (BYTE2(v25) > 9u) {
    uint64_t v35 = &stru_1EF593218;
  }
  else {
    uint64_t v35 = off_1E5A8C3F8[BYTE2(v25)];
  }
  int64_t v36 = (const std::string::value_type *)[(__CFString *)v35 UTF8String];
  memset(&v80, 0, sizeof(v80));
  int v81 = 4;
  if (v36)
  {
    std::string::__assign_external(&v80, v36);
  }
  else
  {
    *((unsigned char *)&v80.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v80, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v79);
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v80.__r_.__value_.__l.__data_);
  }
  __dst[23] = 17;
  strcpy(__dst, "SearchResultsType");
  if (BYTE4(v25) > 4u) {
    uint64_t v37 = &stru_1EF593218;
  }
  else {
    uint64_t v37 = off_1E5A8C448[BYTE4(v25)];
  }
  uint64_t v38 = (const std::string::value_type *)[(__CFString *)v37 UTF8String];
  memset(&v77, 0, sizeof(v77));
  int v78 = 4;
  if (v38)
  {
    std::string::__assign_external(&v77, v38);
  }
  else
  {
    *((unsigned char *)&v77.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v77, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v76);
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v77.__r_.__value_.__l.__data_);
  }
  __dst[23] = 12;
  strcpy(__dst, "MapHasLabels");
  int v75 = 0;
  memset(&v74[4], 0, 24);
  v74[0] = (v25 >> 40) & 1;
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v74);
  __dst[23] = 10;
  strcpy(__dst, "Map Canvas");
  objc_msgSend(*((id *)self + 5), "populateDebugNode:withOptions:", gdc::DebugTreeNode::createChildNode((uint64_t)a3, (long long *)__dst), a4);
  md::MapEngine::createDebugNode((uint64_t)__dst, v7, (uint64_t)a4);
  gdc::DebugTreeNode::addChildNode(a3, (long long *)__dst);
  unint64_t v39 = v120;
  if (v120)
  {
    uint64_t v40 = v121;
    int v41 = v120;
    if ((void *)v121 != v120)
    {
      do
      {
        v40 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v40);
      }
      while ((void *)v40 != v39);
      int v41 = v120;
    }
    uint64_t v121 = (uint64_t)v39;
    operator delete(v41);
  }
  std::vector<gdc::DebugTreeNode>::~vector[abi:nn180100](&v119);
  if (v118 < 0)
  {
    operator delete(v117);
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_73;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_73;
  }
  operator delete(*(void **)__dst);
LABEL_73:
  __dst[23] = 13;
  strcpy(__dst, "Route Context");
  uint64_t v42 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (long long *)__dst);
  __dst[23] = 11;
  strcpy(__dst, "Description");
  id v43 = [*((id *)self + 59) description];
  uint64_t v44 = (const std::string::value_type *)[v43 UTF8String];
  memset(&v72, 0, sizeof(v72));
  int v73 = 4;
  if (v44)
  {
    std::string::__assign_external(&v72, v44);
  }
  else
  {
    *((unsigned char *)&v72.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v72, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)v42, (uint64_t)__dst, (uint64_t)v71);
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v72.__r_.__value_.__l.__data_);
  }

  __dst[23] = 10;
  strcpy(__dst, "TileLoader");
  BOOL v45 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (long long *)__dst);
  float v62 = [MEMORY[0x1E4F64AC8] modernLoader];
  if (!v62) {
    goto LABEL_86;
  }
  *(void *)__dst = &unk_1EF56C7E0;
  *(void *)&__dst[8] = __dst;
  id v117 = __dst;
  id v46 = [v62 descriptionDictionaryRepresentation];
  id v114 = v46;
  if (v117)
  {
    (*(void (**)(unsigned char *, id *, char *))(*(void *)v117 + 48))(v117, &v114, v45);

    if (v117 == __dst)
    {
      (*(void (**)(unsigned char *))(*(void *)__dst + 32))(__dst);
    }
    else if (v117)
    {
      (*(void (**)(void))(*(void *)v117 + 40))();
    }
LABEL_86:
    __dst[23] = 15;
    strcpy(__dst, "Tile Statistics");
    uint64_t v47 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (long long *)__dst);
    float v64 = [(VKMapView *)self tileStatistics];
    uint64_t v48 = [v64 allKeys];
    uint64_t v49 = [v48 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v49;
    uint64_t v50 = [obj countByEnumeratingWithState:&v67 objects:v115 count:16];
    if (!v50) {
      goto LABEL_103;
    }
    uint64_t v51 = *(void *)v68;
    while (1)
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v68 != v51) {
          objc_enumerationMutation(obj);
        }
        float v53 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        int v54 = objc_msgSend(v64, "valueForKey:", v53, v62);
        id v55 = (const char *)[v53 UTF8String];
        size_t v56 = strlen(v55);
        if (v56 >= 0x7FFFFFFFFFFFFFF8) {
          abort();
        }
        size_t v57 = v56;
        if (v56 >= 0x17)
        {
          uint64_t v59 = (v56 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v56 | 7) != 0x17) {
            uint64_t v59 = v56 | 7;
          }
          uint64_t v60 = v59 + 1;
          float v58 = operator new(v59 + 1);
          *(void *)&__dst[8] = v57;
          *(void *)&__dst[16] = v60 | 0x8000000000000000;
          *(void *)__dst = v58;
LABEL_98:
          memmove(v58, v55, v57);
          goto LABEL_99;
        }
        __dst[23] = v56;
        float v58 = __dst;
        if (v56) {
          goto LABEL_98;
        }
LABEL_99:
        v58[v57] = 0;
        uint64_t v61 = [v54 longLongValue];
        memset(&v65[4], 0, 24);
        int v66 = 0;
        v65[0] = v61;
        gdc::DebugTreeNode::addProperty((uint64_t)v47, (uint64_t)__dst, (uint64_t)v65);
        if ((__dst[23] & 0x80000000) != 0) {
          operator delete(*(void **)__dst);
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v67 objects:v115 count:16];
      if (!v50)
      {
LABEL_103:

        return;
      }
    }
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (int64_t)currentMapMode
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (!v2) {
    return 0;
  }
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x2FED70A4459DFCA1;
    if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  int v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = (void *)*v6;
  if (!v7) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_23;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      uint64_t v7 = (void *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_12:
    uint64_t v7 = (void *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (v7[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_12;
  }
LABEL_23:
  uint64_t v11 = v7[5];
  if (v11)
  {
    unsigned int v12 = *(unsigned __int8 *)(v11 + 167) - 1;
    if (v12 <= 6) {
      return qword_1A2900128[v12];
    }
  }
  return 0;
}

- (void)performStylesheetDidChange
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  if (!v2) {
    return;
  }
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0x2FED70A4459DFCA1;
    if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v6 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v7 = *(uint64_t ****)(*(void *)&v2[1] + 8 * v6);
  if (!v7) {
    return;
  }
  uint64_t v8 = *v7;
  if (!v8) {
    return;
  }
  if (v5.u32[0] < 2uLL)
  {
    uint64_t v9 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v11 = v8[1];
      if (v11 == (uint64_t *)0x2FED70A4459DFCA1)
      {
        if (v8[2] == (uint64_t *)0x2FED70A4459DFCA1) {
          goto LABEL_23;
        }
      }
      else if (((unint64_t)v11 & v9) != v6)
      {
        return;
      }
      uint64_t v8 = (uint64_t **)*v8;
      if (!v8) {
        return;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = (unint64_t)v8[1];
    if (v10 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v10 >= *(void *)&v3) {
      v10 %= *(void *)&v3;
    }
    if (v10 != v6) {
      return;
    }
LABEL_12:
    uint64_t v8 = (uint64_t **)*v8;
    if (!v8) {
      return;
    }
  }
  if (v8[2] != (uint64_t *)0x2FED70A4459DFCA1) {
    goto LABEL_12;
  }
LABEL_23:
  unsigned int v12 = v8[5];
  if (v12)
  {
    uint64_t v13 = v12[32];
    if (!v13)
    {
      md::StyleLogic::updateConfiguration((md::StyleLogic *)v8[5], *((_DWORD *)v12 + 274));
      uint64_t v13 = v12[32];
    }
    int v14 = (std::__shared_weak_count *)v12[33];
    unint64_t v21 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v13)
    {
      uint64_t v15 = *(void *)(v13 + 520);
      uint64_t v16 = *(std::__shared_weak_count **)(v13 + 528);
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v15) {
        atomic_store(*(_DWORD *)(v15 + 248) + 1, (unsigned int *)(v15 + 248));
      }
      if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v16->__on_zero_shared)(v16, a2);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    char v22 = 4;
    int v17 = (char *)v12[141];
    __int16 v18 = (char *)v12[142];
    if (v17 != v18)
    {
      while (*v17 <= 3u)
      {
        if (++v17 == v18) {
          goto LABEL_42;
        }
      }
    }
    if (v17 == v18 || (__int16 v18 = v17, *v17 != 4)) {
LABEL_42:
    }
      std::vector<md::StyleManagerEvent>::insert((uint64_t)(v12 + 141), v18, &v22);
    uint64_t v19 = *(void *)v12[155];
    if (v19)
    {
      char v22 = 12;
      md::MapEngine::setNeedsTick(v19, &v22);
    }
    uint64_t v20 = *((void *)self + 48);
    char v22 = 1;
    md::MapEngine::setNeedsTick(v20, &v22);
    if (v21)
    {
      if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
}

- (const)mapEngine
{
  return (const void *)*((void *)self + 48);
}

- (VKMapCanvas)mapCanvas
{
  return (VKMapCanvas *)*((id *)self + 5);
}

- (void)debugHighlightFeatureMarker:(const void *)a3
{
  uint8x8_t v5 = [(VKMapView *)self _labelSettings];
  (*(void (**)(void, const void *))(**(void **)(v5[3] + 240) + 264))(*(void *)(v5[3] + 240), a3);
  [(VKMapView *)self _updateMapDisplayStyle];
}

- (id)iconForStyleAttributes:(id)a3 contentScale:(double)a4 size:(int64_t)a5 transparent:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  uint64_t v11 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v12 = v11[2];
  if (!*(void *)&v12) {
    goto LABEL_21;
  }
  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    uint64_t v14 = 0x2FED70A4459DFCA1;
    if (*(void *)&v12 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v14 = 0x2FED70A4459DFCA1uLL % *(void *)&v12;
    }
  }
  else
  {
    uint64_t v14 = (*(void *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v15 = *(void **)(*(void *)&v11[1] + 8 * v14);
  if (!v15 || (uint64_t v16 = (void *)*v15) == 0)
  {
LABEL_21:
    uint64_t v20 = 0;
    uint64_t v21 = MEMORY[0x100];
    if (!MEMORY[0x100]) {
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (v13.u32[0] < 2uLL)
  {
    uint64_t v17 = *(void *)&v12 - 1;
    while (1)
    {
      uint64_t v19 = v16[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v16[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_36;
        }
      }
      else if ((v19 & v17) != v14)
      {
        goto LABEL_21;
      }
      uint64_t v16 = (void *)*v16;
      if (!v16) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v18 = v16[1];
    if (v18 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v18 >= *(void *)&v12) {
      v18 %= *(void *)&v12;
    }
    if (v18 != v14) {
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v16 = (void *)*v16;
    if (!v16) {
      goto LABEL_21;
    }
  }
  if (v16[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_36:
  uint64_t v20 = v16[5];
  uint64_t v21 = *(void *)(v20 + 256);
  if (!v21)
  {
LABEL_22:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v20, *(_DWORD *)(v20 + 1096));
    uint64_t v21 = *(void *)(v20 + 256);
  }
LABEL_23:
  char v22 = *(std::__shared_weak_count **)(v20 + 264);
  uint64_t v34 = v21;
  uint64_t v35 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v23 = objc_alloc_init(VKIconModifiers);
  [(VKIconModifiers *)v23 setGlyphOnly:v6];
  int v24 = +[VKSharedResourcesManager sharedResources];
  unint64_t v25 = [v24 iconManager];
  unint64_t v27 = v25;
  uint64_t v32 = v21;
  uint8x8_t v33 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(float *)&double v26 = a4;
  uint64_t v28 = [v25 imageForStyleAttributes:v10 styleManager:&v32 contentScale:a5 sizeGroup:v23 modifiers:v26];
  BOOL v29 = v33;
  if (v33 && !atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }

  int v30 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }

  return v28;
}

- (id)roadLabelTilesInScene
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint8x8_t v4 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v5 = v4[2];
  if (!*(void *)&v5) {
    goto LABEL_30;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    uint64_t v7 = 0x2B7C4502BD3C99C6;
    if (*(void *)&v5 <= 0x2B7C4502BD3C99C6uLL) {
      uint64_t v7 = 0x2B7C4502BD3C99C6uLL % *(void *)&v5;
    }
  }
  else
  {
    uint64_t v7 = (*(void *)&v5 - 1) & 0x2B7C4502BD3C99C6;
  }
  uint64_t v8 = *(void **)(*(void *)&v4[1] + 8 * v7);
  if (!v8) {
    goto LABEL_30;
  }
  uint64_t v9 = (void *)*v8;
  if (!v9) {
    goto LABEL_30;
  }
  if (v6.u32[0] < 2uLL)
  {
    uint64_t v10 = *(void *)&v5 - 1;
    while (1)
    {
      uint64_t v12 = v9[1];
      if (v12 == 0x2B7C4502BD3C99C6)
      {
        if (v9[2] == 0x2B7C4502BD3C99C6) {
          goto LABEL_22;
        }
      }
      else if ((v12 & v10) != v7)
      {
        goto LABEL_30;
      }
      uint64_t v9 = (void *)*v9;
      if (!v9) {
        goto LABEL_30;
      }
    }
  }
  while (1)
  {
    unint64_t v11 = v9[1];
    if (v11 == 0x2B7C4502BD3C99C6) {
      break;
    }
    if (v11 >= *(void *)&v5) {
      v11 %= *(void *)&v5;
    }
    if (v11 != v7) {
      goto LABEL_30;
    }
LABEL_11:
    uint64_t v9 = (void *)*v9;
    if (!v9) {
      goto LABEL_30;
    }
  }
  if (v9[2] != 0x2B7C4502BD3C99C6) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v13 = v9[5];
  if (!v13 || (uint64_t v14 = *(md::SceneContext **)(v13 + 120)) == 0)
  {
LABEL_30:
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_37284);
    }
    uint64_t v20 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1A1780000, v20, OS_LOG_TYPE_INFO, "[VKMapView:%p] roadLabelTilesInScene - no SceneContext", buf, 0xCu);
    }
    goto LABEL_34;
  }
  uint64_t v15 = *(void *)v14;
  {
    uint64_t v38 = v14;
    uint64_t v14 = v38;
    if (v39)
    {
      qword_1EB3176C0 = 0;
      qword_1EB3176B8 = 0;
      md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet = (uint64_t)&qword_1EB3176B8;
      __cxa_atexit((void (*)(void *))std::set<gdc::LayerDataWithWorld>::~set[abi:nn180100], &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet, &dword_1A1780000);
      uint64_t v14 = v38;
    }
  }
  uint64_t v16 = *(_WORD **)(v15 + 48);
  uint64_t v17 = *(_WORD **)(v15 + 56);
  unint64_t v18 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
  if (v16 != v17)
  {
    uint64_t v19 = v16;
    while (*v19 != 21)
    {
      v19 += 16;
      if (v19 == v17) {
        goto LABEL_43;
      }
    }
    if (v19 == v17)
    {
      unint64_t v18 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
    }
    else
    {
      while (*v16 != 21)
      {
        v16 += 16;
        if (v16 == v17)
        {
          uint64_t v16 = v17;
          break;
        }
      }
      unint64_t v18 = (uint64_t *)(v16 + 4);
    }
  }
LABEL_43:
  if (!v18[2]) {
    unint64_t v18 = md::SceneContext::layerDataInView(v14, 18);
  }
  int v24 = (uint64_t *)*v18;
  char v22 = v18 + 1;
  uint64_t v23 = v24;
  if (v24 != v22)
  {
    while (2)
    {
      uint64_t v26 = v23[4];
      unint64_t v25 = (std::__shared_weak_count *)v23[5];
      *(void *)long long buf = v26;
      *(void *)&uint8_t buf[8] = v25;
      if (v25) {
        atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v26 && *(void *)(v26 + 720))
      {
        id v27 = objc_alloc(MEMORY[0x1E4F64BA0]);
        uint64_t v28 = *(uint64_t **)(*(void *)(v26 + 720) + 24);
        uint64_t v30 = *v28;
        BOOL v29 = (std::__shared_weak_count *)v28[1];
        uint64_t v40 = v30;
        int v41 = v29;
        if (v29) {
          atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        float64x2_t v31 = (void *)[v27 initWithVectorTile:&v40];
        uint64_t v32 = v41;
        if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
        objc_msgSend(v3, "addObject:", v31, v40);

        unint64_t v25 = *(std::__shared_weak_count **)&buf[8];
      }
      if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
        uint8x8_t v33 = (uint64_t *)v23[1];
        if (v33) {
          goto LABEL_61;
        }
      }
      else
      {
        uint8x8_t v33 = (uint64_t *)v23[1];
        if (v33)
        {
          do
          {
LABEL_61:
            uint64_t v34 = v33;
            uint8x8_t v33 = (uint64_t *)*v33;
          }
          while (v33);
          goto LABEL_47;
        }
      }
      do
      {
        uint64_t v34 = (uint64_t *)v23[2];
        BOOL v35 = *v34 == (void)v23;
        uint64_t v23 = v34;
      }
      while (!v35);
LABEL_47:
      uint64_t v23 = v34;
      if (v34 == v22) {
        break;
      }
      continue;
    }
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_37284);
  }
  int64_t v36 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = [v3 count];
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v37;
    _os_log_impl(&dword_1A1780000, v36, OS_LOG_TYPE_INFO, "[VKMapView:%p] roadLabelTilesInScene:%zu", buf, 0x16u);
  }

LABEL_34:
  return v3;
}

- (void)setARMode:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 3) {
    uint8x8_t v4 = (void *)(v3 + 1);
  }
  else {
    uint8x8_t v4 = 0;
  }
  uint64_t v5 = *(void *)(*((void *)self + 48) + 1128);
  char v6 = 26;
  md::MapEngineSettings::set(v5, &v6, v4);
}

- (int)arMode
{
  char v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 26)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  if (v3 == v4) {
    return 0;
  }
  unsigned int v5 = (*(void *)(v3 + 8) - 1);
  if (v5 > 2) {
    return 0;
  }
  else {
    return v5 + 1;
  }
}

- (int)arSceneType
{
  char v2 = *(uint64_t **)(*((void *)self + 48) + 1128);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 27)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  if (v3 == v4) {
    return 0;
  }
  int v5 = *(void *)(v3 + 8);
  if (v5 == 2) {
    return 2;
  }
  else {
    return v5 == 1;
  }
}

- (void)setARSceneType:(int)a3
{
  uint64_t v3 = *(void *)(*((void *)self + 48) + 1128);
  char v5 = 27;
  if (a3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = a3 == 1;
  }
  md::MapEngineSettings::set(v3, &v5, (void *)v4);
}

- (int64_t)getCurrentSetARInterfaceOrientation
{
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
  }
  uint64_t v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Get AR interface orientation", v6, 2u);
  }
  uint64_t v4 = *(void *)(*((void *)self + 48) + 1056);
  if (v4) {
    return *(void *)(v4 + 96);
  }
  else {
    return 0;
  }
}

- (void)setARInterfaceOrientation:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
  }
  char v5 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 3) {
      char v6 = @"Unknown";
    }
    else {
      char v6 = (__CFString *)*((void *)&off_1E5A960C0 + a3 - 1);
    }
    int v19 = 138412290;
    uint64_t v20 = v6;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "Set AR interface orientation %@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v8 = *((void *)self + 48);
  *(void *)(*(void *)(v8 + 1056) + 96) = a3;
  uint64_t v9 = *(int8x8_t **)(v8 + 1120);
  int8x8_t v10 = v9[2];
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      uint64_t v12 = 0x69AB09C896BF94A7;
      if (*(void *)&v10 <= 0x69AB09C896BF94A7uLL) {
        uint64_t v12 = 0x69AB09C896BF94A7uLL % *(void *)&v10;
      }
    }
    else
    {
      uint64_t v12 = (*(void *)&v10 - 1) & 0x69AB09C896BF94A7;
    }
    uint64_t v13 = *(void **)(*(void *)&v9[1] + 8 * v12);
    if (v13)
    {
      uint64_t v14 = (void *)*v13;
      if (v14)
      {
        if (v11.u32[0] < 2uLL)
        {
          uint64_t v15 = *(void *)&v10 - 1;
          while (1)
          {
            uint64_t v17 = v14[1];
            if (v17 == 0x69AB09C896BF94A7)
            {
              if (v14[2] == 0x69AB09C896BF94A7) {
                goto LABEL_29;
              }
            }
            else if ((v17 & v15) != v12)
            {
              return;
            }
            uint64_t v14 = (void *)*v14;
            if (!v14) {
              return;
            }
          }
        }
        do
        {
          unint64_t v16 = v14[1];
          if (v16 == 0x69AB09C896BF94A7)
          {
            if (v14[2] == 0x69AB09C896BF94A7)
            {
LABEL_29:
              uint64_t v18 = v14[5];
              if (v18) {
                *(void *)(v18 + 176) = a3;
              }
              return;
            }
          }
          else
          {
            if (v16 >= *(void *)&v10) {
              v16 %= *(void *)&v10;
            }
            if (v16 != v12) {
              return;
            }
          }
          uint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
}

- (void)arController:(id)a3 didChangeTrackingState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v8 = (id *)((char *)self + 120);
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v11 = objc_loadWeakRetained(v8);
    [v11 mapLayer:self arTrackingStateDidChange:a4 reason:a5];
  }
}

- (void)arControllerSessionInterruptionEnded:(id)a3
{
  uint64_t v4 = (id *)((char *)self + 120);
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained(v4);
    [v7 mapLayerARSessionInterruptionEnded:self];
  }
}

- (void)arController:(id)a3 arSessionWasInterrupted:(unint64_t)a4
{
  id v12 = a3;
  char v6 = (void *)*((void *)self + 6);
  if (v6)
  {
    id v7 = [v6 arCameraController];

    if (v7)
    {
      uint64_t v8 = [*((id *)self + 6) arCameraController];
      [v8 arSessionWasInterrupted:a4];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)self + 15);
    [v11 mapLayer:self arSessionWasInterrupted:a4];
  }
}

- (void)arController:(id)a3 didEncounterError:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)self + 15);
    [v7 mapLayer:self didEncounterARError:v8];
  }
}

- (void)map:(id)a3 didEnterARMode:(BOOL)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __36__VKMapView_AR__map_didEnterARMode___block_invoke;
  v7[3] = &unk_1E5A960A0;
  v7[4] = self;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v7, a4);
  char v5 = +[VKDebugSettings sharedSettings];
  char v6 = [v5 arRenderAtNativeRate];

  if ((v6 & 1) == 0) {
    md::MapEngine::setDisplayRate(*((void *)self + 48), 60);
  }
}

void __36__VKMapView_AR__map_didEnterARMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 mapLayerDidEnterAR:*(void *)(a1 + 32)];
  }
}

- (void)exitARMode
{
  uint64_t v3 = *((void *)self + 48);
  int v4 = *(unsigned __int8 *)(v3 + 1241);
  md::MapEngine::setDisplayRate(v3, -1);
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  if (!v4)
  {
    int v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v16 = objc_loadWeakRetained((id *)self + 15);
      [v16 mapLayerWillExitAR:self];
    }
    [*((id *)self + 6) exitARSession];
    [*((id *)self + 6) stopFlyoverAnimation];
    [(VKMapView *)self setFlyoverMode:0xFFFFFFFFLL];
    id v17 = objc_loadWeakRetained((id *)self + 15);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v18 = objc_loadWeakRetained((id *)self + 15);
      [v18 mapLayerDidExitAR:self];
    }
    [*((id *)self + 50) pause];
    uint64_t v10 = *(void *)(*((void *)self + 48) + 1056);
    id v11 = *(void **)(v10 + 104);
    *(void *)(v10 + 104) = 0;

    *(unsigned char *)uint64_t v10 = 0;
    id v7 = (void *)*((void *)self + 50);
    *((void *)self + 50) = 0;
    goto LABEL_11;
  }
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v13 = objc_loadWeakRetained((id *)self + 15);
    [v13 mapLayerWillExitAR:self];
  }
  [(VKMapView *)self setFlyoverMode:0xFFFFFFFFLL];
  id v14 = objc_loadWeakRetained((id *)self + 15);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v15 = objc_loadWeakRetained((id *)self + 15);
    [v15 mapLayerDidExitAR:self];
    id v7 = v15;
LABEL_11:
  }
}

- (void)enterARModeAtCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(VKMapView *)self setMapType:10 animated:0];
  if (+[MDARController isSupported])
  {
    uint64_t v6 = *(void *)(*((void *)self + 48) + 1056);
    md::ARContext::ARContext((md::ARContext *)&v19);
    uint64_t v7 = v19;
    *(_DWORD *)(v6 + 8) = v20;
    *(void *)uint64_t v6 = v7;
    long long v8 = v23;
    *(_OWORD *)(v6 + 16) = v21;
    *(_OWORD *)(v6 + 32) = v22;
    *(_OWORD *)(v6 + 48) = v8;
    *(_OWORD *)(v6 + 64) = v24;
    *(_OWORD *)(v6 + 80) = v25;
    *(void *)(v6 + 96) = v26;
    id v9 = v27;
    id v27 = 0;
    uint64_t v10 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = v9;

    id v11 = objc_alloc_init(MDARController);
    id v12 = (void *)*((void *)self + 50);
    *((void *)self + 50) = v11;

    [*((id *)self + 50) run:1];
    [*((id *)self + 50) setDelegate:self];
    uint64_t v13 = *(void *)(*((void *)self + 48) + 1056);
    uint64_t v14 = [*((id *)self + 50) session];
    id v15 = *(void **)(v13 + 104);
    *(void *)(v13 + 104) = v14;

    *(unsigned char *)uint64_t v13 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)self + 15);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)self + 15);
    [v18 mapLayerWillEnterAR:self];
  }
  objc_msgSend(*((id *)self + 6), "enterARSessionAtCoordinate:", var0, var1);
  [(VKMapView *)self setFlyoverMode:0];
}

- (id)arWalkingDebugOutput
{
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_21;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x20A1ED17D78F322BLL;
    if (*(void *)&v3 <= 0x20A1ED17D78F322BuLL) {
      uint64_t v5 = 0x20A1ED17D78F322BuLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x20A1ED17D78F322BLL;
  }
  uint64_t v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6 || (uint64_t v7 = (void *)*v6) == 0)
  {
LABEL_21:
    id v11 = 0;
    goto LABEL_22;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x20A1ED17D78F322BLL)
      {
        if (v7[2] == 0x20A1ED17D78F322BLL) {
          goto LABEL_32;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      uint64_t v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x20A1ED17D78F322BLL) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (v7[2] != 0x20A1ED17D78F322BLL) {
    goto LABEL_11;
  }
LABEL_32:
  id v11 = (void *)v7[5];
LABEL_22:
  uint64_t v12 = *md::LabelsLogic::labelManagerForWorldType(v11, 3u);
  if (v12)
  {
    md::LabelManager::debugString((md::LabelManager *)__p, v12, 0);
    if (v17 >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = (void **)__p[0];
    }
    uint64_t v14 = [NSString stringWithUTF8String:v13];
    if (v17 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (void)setARWalkingFeatures:(id)a3
{
  id v3 = [(VKMapView *)self setARWalkingFeatureSet:a3];
}

- (id)setARWalkingFeatureSet:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint8x8_t v4 = (VKARWalkingFeatureSet *)a3;
  uint64_t v5 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v6 = v5[2];
  if (!*(void *)&v6) {
    goto LABEL_21;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v8 = 0xF4B920F5F640B882;
    if (*(void *)&v6 <= 0xF4B920F5F640B882) {
      unint64_t v8 = 0xF4B920F5F640B882 % *(void *)&v6;
    }
  }
  else
  {
    unint64_t v8 = (*(void *)&v6 - 1) & 0xF4B920F5F640B882;
  }
  unint64_t v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
  if (!v9 || (uint64_t v10 = (void *)*v9) == 0)
  {
LABEL_21:
    uint64_t v14 = 0;
    if (!MEMORY[0x78]) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (v7.u32[0] < 2uLL)
  {
    uint64_t v11 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == 0xF4B920F5F640B882)
      {
        if (v10[2] == 0xF4B920F5F640B882) {
          goto LABEL_23;
        }
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_21;
      }
      uint64_t v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == 0xF4B920F5F640B882) {
      break;
    }
    if (v12 >= *(void *)&v6) {
      v12 %= *(void *)&v6;
    }
    if (v12 != v8) {
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_21;
    }
  }
  if (v10[2] != 0xF4B920F5F640B882) {
    goto LABEL_11;
  }
LABEL_23:
  uint64_t v14 = v10[5];
  if (*(void *)(v14 + 120))
  {
LABEL_22:
    id v15 = (id *)(v14 + 168);
    goto LABEL_25;
  }
LABEL_24:
  id v15 = (id *)(*(void *)(*(void *)(v14 + 128) + 40) + 144);
LABEL_25:
  id v16 = *v15;
  char v17 = [v16 features];

  if (v17 == v4)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
    }
    long long v24 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      long long v25 = [v16 features];
      uint64_t v26 = [v16 features];
      int v36 = 134218240;
      uint64_t v37 = v25;
      __int16 v38 = 2048;
      int v39 = v26;
      _os_log_impl(&dword_1A1780000, v24, OS_LOG_TYPE_INFO, "Set ARFeatures (unchanged) - current:%p incoming:%p", (uint8_t *)&v36, 0x16u);
    }
    long long v23 = (VKARWalkingFeatureSet *)v16;
  }
  else
  {
    id v18 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA80];
    int v20 = [v16 features];
    long long v21 = [v19 setWithArray:v20];

    if ([v18 isEqualToSet:v21])
    {
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
      }
      long long v22 = GEOGetVectorKitVKMapViewLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
      {
        int v36 = 138412290;
        uint64_t v37 = v4;
        _os_log_impl(&dword_1A1780000, v22, OS_LOG_TYPE_INFO, "Set ARFeatures (unchanged) - %@", (uint8_t *)&v36, 0xCu);
      }
      long long v23 = (VKARWalkingFeatureSet *)v16;
    }
    else
    {
      id v27 = [[VKARWalkingFeatureSet alloc] initWithFeatures:v4];
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
      }
      uint64_t v28 = GEOGetVectorKitVKMapViewLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
      {
        int v36 = 138412290;
        uint64_t v37 = v27;
        _os_log_impl(&dword_1A1780000, v28, OS_LOG_TYPE_INFO, "Set ARFeatures:%@", (uint8_t *)&v36, 0xCu);
      }
      BOOL v29 = v27;
      if (*(void *)(v14 + 120))
      {
        if (GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken != -1) {
          dispatch_once(&GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken, &__block_literal_global_40653);
        }
        uint64_t v30 = GEOGetVectorKitARFeatureInjectionLogicLog(void)::log;
        if (os_log_type_enabled((os_log_t)GEOGetVectorKitARFeatureInjectionLogicLog(void)::log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A1780000, v30, OS_LOG_TYPE_INFO, "ARFeatureInjectionLogic intercepted features for ARDebugScene", (uint8_t *)&v36, 2u);
        }
      }
      else
      {
        if (GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken != -1) {
          dispatch_once(&GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken, &__block_literal_global_40653);
        }
        float64x2_t v31 = GEOGetVectorKitARFeatureInjectionLogicLog(void)::log;
        if (os_log_type_enabled((os_log_t)GEOGetVectorKitARFeatureInjectionLogicLog(void)::log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A1780000, v31, OS_LOG_TYPE_INFO, "ARFeatureInjectionLogic forwarding features to LabelSettings", (uint8_t *)&v36, 2u);
        }
        md::LabelSettings::setARWalkingFeatures(*(md::LabelSettings **)(v14 + 128), v29, 0);
      }
      uint64_t v32 = v29;
      long long v23 = v32;
      if (v32) {
        uint8x8_t v33 = v32;
      }
      uint64_t v34 = *(void **)(v14 + 168);
      *(void *)(v14 + 168) = v23;
    }
  }

  return v23;
}

- (void)_setARSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint8x8_t v4 = (ARSession *)a3;
  if (+[MDARSession isSupported])
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
    }
    uint64_t v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "Set AR Session:%@", (uint8_t *)&v17, 0xCu);
    }
    int8x8_t v6 = *(int8x8_t **)(*((void *)self + 48) + 1120);
    int8x8_t v7 = v6[2];
    if (v7)
    {
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        uint64_t v9 = 0x69AB09C896BF94A7;
        if (*(void *)&v7 <= 0x69AB09C896BF94A7uLL) {
          uint64_t v9 = 0x69AB09C896BF94A7uLL % *(void *)&v7;
        }
      }
      else
      {
        uint64_t v9 = (*(void *)&v7 - 1) & 0x69AB09C896BF94A7;
      }
      uint64_t v11 = *(void **)(*(void *)&v6[1] + 8 * v9);
      if (v11)
      {
        unint64_t v12 = (void *)*v11;
        if (v12)
        {
          if (v8.u32[0] < 2uLL)
          {
            uint64_t v13 = *(void *)&v7 - 1;
            while (1)
            {
              uint64_t v15 = v12[1];
              if (v15 == 0x69AB09C896BF94A7)
              {
                if (v12[2] == 0x69AB09C896BF94A7) {
                  goto LABEL_31;
                }
              }
              else if ((v15 & v13) != v9)
              {
                goto LABEL_33;
              }
              unint64_t v12 = (void *)*v12;
              if (!v12) {
                goto LABEL_33;
              }
            }
          }
          do
          {
            unint64_t v14 = v12[1];
            if (v14 == 0x69AB09C896BF94A7)
            {
              if (v12[2] == 0x69AB09C896BF94A7)
              {
LABEL_31:
                id v16 = (id *)v12[5];
                if (v16) {
                  md::ARLogic::setARSession(v16, v4);
                }
                break;
              }
            }
            else
            {
              if (v14 >= *(void *)&v7) {
                v14 %= *(void *)&v7;
              }
              if (v14 != v9) {
                break;
              }
            }
            unint64_t v12 = (void *)*v12;
          }
          while (v12);
        }
      }
    }
  }
  else
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_40238);
    }
    uint64_t v10 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_ERROR, "AR Walking is unsupported", (uint8_t *)&v17, 2u);
    }
  }
LABEL_33:
}

- (void)exitARWalking
{
}

- (void)enterARWalking:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    [(VKMapView *)self setARSession:v4];
  }
  else
  {
    id v5 = +[MDARSession newGeoTrackingSession];
    [(VKMapView *)self _setARSession:v5];
  }
}

- (void)setVirtualParallaxEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
  }
  id v5 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
  {
    id v6 = "false";
    if (v3) {
      id v6 = "true";
    }
    int v7 = 136315138;
    uint8x8_t v8 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "Set virtual parallax enabled: %s", (uint8_t *)&v7, 0xCu);
  }
  [*((id *)self + 35) setVirtualParallaxEnabled:v3];
}

- (BOOL)virtualParallaxEnabled
{
  return [*((id *)self + 35) virtualParallaxEnabled];
}

- (id)onscreenImageResources
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  char v2 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    goto LABEL_21;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x669A8EDAC04FCBF1;
    if (*(void *)&v3 <= 0x669A8EDAC04FCBF1uLL) {
      uint64_t v5 = 0x669A8EDAC04FCBF1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x669A8EDAC04FCBF1;
  }
  id v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6 || (int v7 = (void *)*v6) == 0)
  {
LABEL_21:
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x669A8EDAC04FCBF1)
      {
        if (v7[2] == 0x669A8EDAC04FCBF1) {
          goto LABEL_76;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      int v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x669A8EDAC04FCBF1) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      goto LABEL_21;
    }
LABEL_11:
    int v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (v7[2] != 0x669A8EDAC04FCBF1) {
    goto LABEL_11;
  }
LABEL_76:
  uint64_t v11 = v7[5];
LABEL_22:
  uint64_t v12 = *(void *)(v11 + 144);
  uint64_t v13 = *(void *)(v12 + 80);
  uint64_t v14 = *(void *)(v12 + 88);
  if (v13 != v14)
  {
    while (*(_WORD *)v13 != 36)
    {
      v13 += 16;
      if (v13 == v14) {
        goto LABEL_28;
      }
    }
  }
  if (v13 == v14) {
LABEL_28:
  }
    int v41 = 0;
  else {
    int v41 = *(gdc::LayerDataRequestKey **)(v13 + 8);
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v48 = (pthread_rwlock_t *)(v11 + 208);
  uint64_t v15 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v11 + 208));
  if (v15) {
    geo::read_write_lock::logFailure(v15, (uint64_t)"read lock", v16);
  }
  uint64_t v17 = *(void *)(v11 + 184);
  uint64_t v43 = *(void *)(v11 + 192);
  if (v17 != v43)
  {
    while (2)
    {
      unint64_t v18 = *(void *)v17;
      uint64_t v19 = *(unsigned __int8 *)(v17 + 8);
      uint64_t v20 = *(unsigned __int8 *)(v17 + 9);
      unint64_t v21 = *(unsigned __int8 *)(v17 + 10);
      md::mun::MuninMetadataContainer::activePoint((md::mun::MuninMetadataContainer *)v56, *(void *)(v11 + 168), *(void *)v17);
      if (v56[0])
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F648B8]);
        [v22 setLoadStatus:0];
        [v22 setCameraNumber:v19];
        [v22 setLod:v20];
        uint64_t v49 = v53;
        uint64_t v50 = v53;
        uint64_t v51 = v53;
        uint64_t v52 = 32;
        unint64_t v54 = 0;
        unint64_t v55 = v61;
        unint64_t v23 = v20 | (v19 << 16) | ((unint64_t)v60 << 32);
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v49, v53, (char *)&v55, v56);
        unint64_t v55 = v18;
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v49, v50, (char *)&v55, v56);
        unint64_t v55 = v23;
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v49, v50, (char *)&v55, v56);
        unint64_t v55 = v21;
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v49, v50, (char *)&v55, v56);
        long long v24 = (unsigned __int8 *)v49;
        unint64_t v25 = v50 - (unsigned char *)v49;
        if (v50 == v49)
        {
          unint64_t v26 = 0;
        }
        else
        {
          unint64_t v26 = 0;
          if (v25 <= 1) {
            unint64_t v25 = 1;
          }
          do
          {
            unsigned int v27 = *v24++;
            v26 ^= (v26 << 6) + (v26 >> 2) - 0x61C8864680B583EBLL + v27;
            --v25;
          }
          while (v25);
        }
        unint64_t v54 = v26;
        gdc::LayerDataRequestKey::LayerDataRequestKey(v44, 0, 0x24u, (uint64_t)&v49, 2147483646);
        if (v49 != v51) {
          free(v49);
        }
        gdc::LayerDataStore::get((gdc::LayerDataStore *)&v49, v41, v44);
        uint64_t v28 = v49;
        BOOL v29 = (std::__shared_weak_count *)v50;
        if (v50 && !atomic_fetch_add((atomic_ullong *volatile)v50 + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
          if (!v28) {
            goto LABEL_48;
          }
LABEL_46:
          objc_msgSend(v22, "setLoadStatus:", 1, v41);
        }
        else
        {
          if (v28) {
            goto LABEL_46;
          }
LABEL_48:
          uint64_t v30 = *(void *)(v11 + 144);
          uint64_t v31 = *(void *)(v30 + 32);
          uint64_t v32 = *(void *)(v30 + 40);
          if (v31 != v32)
          {
            while (*(_WORD *)v31 != 36)
            {
              v31 += 16;
              if (v31 == v32) {
                goto LABEL_54;
              }
            }
          }
          if (v31 == v32) {
LABEL_54:
          }
            uint64_t v33 = 0;
          else {
            uint64_t v33 = *(void *)(v31 + 8);
          }
          if (std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::find<gdc::LayerDataRequestKey>((void *)(v33 + 80), v44)|| std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::find<gdc::LayerDataRequestKey>((void *)(v33 + 120), v44))
          {
            objc_msgSend(v22, "setLoadStatus:", 2, v41);
          }
        }
        objc_msgSend(v42, "addObject:", v22, v41);
        if (v47) {
          char v47 = 0;
        }
        if (v45 != v46) {
          free(v45);
        }

        if (v56[0])
        {
          BOOL v35 = v57;
          uint64_t v34 = v58;
          if (v57 != v58)
          {
            do
            {
              int v36 = (void *)v35[31];
              if (v36 != (void *)v35[33]) {
                free(v36);
              }
              v35 += 36;
            }
            while (v35 != v34);
            BOOL v35 = v57;
          }
          if (v35 != v59) {
            free(v35);
          }
        }
      }
      v17 += 16;
      if (v17 == v43) {
        break;
      }
      continue;
    }
  }
  uint64_t v37 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v42, v41);
  __int16 v38 = (geo::read_write_lock *)pthread_rwlock_unlock(v48);
  if (v38) {
    geo::read_write_lock::logFailure(v38, (uint64_t)"unlock", v39);
  }

  return v37;
}

- (id)currentMarker
{
  char v2 = (VKMuninMarker *)[*((id *)self + 35) currentPoint];
  if (v2) {
    char v2 = [[VKMuninMarker alloc] initWithCollectionPoint:v2];
  }
  return v2;
}

- (void)enableViewDataLoading:(BOOL)a3
{
  int8x8_t v3 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_21;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0x669A8EDAC04FCBF1;
    if (*(void *)&v4 <= 0x669A8EDAC04FCBF1uLL) {
      uint64_t v6 = 0x669A8EDAC04FCBF1uLL % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v4 - 1) & 0x669A8EDAC04FCBF1;
  }
  int v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
  if (!v7 || (uint64_t v8 = (void *)*v7) == 0)
  {
LABEL_21:
    uint64_t v12 = 0;
    MEMORY[0x341] = a3;
    if (a3) {
      goto LABEL_22;
    }
    return;
  }
  if (v5.u32[0] < 2uLL)
  {
    uint64_t v9 = *(void *)&v4 - 1;
    while (1)
    {
      uint64_t v11 = v8[1];
      if (v11 == 0x669A8EDAC04FCBF1)
      {
        if (v8[2] == 0x669A8EDAC04FCBF1) {
          goto LABEL_25;
        }
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_21;
      }
      uint64_t v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = v8[1];
    if (v10 == 0x669A8EDAC04FCBF1) {
      break;
    }
    if (v10 >= *(void *)&v4) {
      v10 %= *(void *)&v4;
    }
    if (v10 != v6) {
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_21;
    }
  }
  if (v8[2] != 0x669A8EDAC04FCBF1) {
    goto LABEL_11;
  }
LABEL_25:
  uint64_t v12 = v8[5];
  *(unsigned char *)(v12 + 833) = a3;
  if (!a3) {
    return;
  }
LABEL_22:
  uint64_t v13 = **(void **)(v12 + 160);
  if (v13)
  {
    char v14 = 8;
    md::MapEngine::setNeedsTick(v13, &v14);
  }
}

- (BOOL)cancelPendingMove
{
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
  }
  int8x8_t v3 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8x8_t v5 = 0;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Cancel pending move", v5, 2u);
  }
  return [*((id *)self + 35) cancelPendingMove];
}

- (BOOL)moveToMarker:(id)a3 withHeading:(double)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if ([v10 collectionPoint])
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    uint64_t v12 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A1780000, v12, OS_LOG_TYPE_INFO, "Move to marker", buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
      }
    }
    uint64_t v13 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MoveToMarker", "", buf, 2u);
    }
    id v14 = *((id *)self + 35);
    double v19 = a4 * -0.0174532925;
    uint64_t v18 = 0;
    char v15 = objc_msgSend(v14, "moveToPoint:withHeading:withPitch:animated:completionHandler:", objc_msgSend(v10, "collectionPoint"), &v19, &v18, v7, v11);
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    id v16 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A1780000, v16, OS_LOG_TYPE_ERROR, "Move to marker - missing collection point", buf, 2u);
    }
    char v15 = 0;
  }

  return v15;
}

- (BOOL)moveToStorefrontView:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [v8 imageryInfo];

    md::mun::cameraFrameFromStorefront((uint64_t)v27, v8);
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    id v11 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_INFO, "Move to storefront view", (uint8_t *)&buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
      }
    }
    uint64_t v12 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MoveToStorefrontView", "", (uint8_t *)&buf, 2u);
    }
    uint64_t v13 = (id *)((char *)self + 272);
    objc_initWeak(&buf, v13[1]);
    id v14 = v13[1];
    uint64_t v24 = v28;
    uint64_t v25 = v29;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__VKMapView_Munin__moveToStorefrontView_animated_completionHandler___block_invoke;
    v21[3] = &unk_1E5A98E30;
    id v22 = v9;
    objc_copyWeak(&v23, &buf);
    char v15 = [v14 moveToPoint:v30 withHeading:&v25 withPitch:&v24 animated:v6 completionHandler:v21];
    objc_destroyWeak(&v23);

    objc_destroyWeak(&buf);
    id v16 = v31;
    uint64_t v17 = v32;
    if (v31 != v32)
    {
      do
      {
        uint64_t v18 = (void *)v16[31];
        if (v18 != (void *)v16[33]) {
          free(v18);
        }
        v16 += 36;
      }
      while (v16 != v17);
      id v16 = v31;
    }
    if (v16 != v33) {
      free(v16);
    }
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    double v19 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1A1780000, v19, OS_LOG_TYPE_ERROR, "Move to storefront view - missing storefront info", v30, 2u);
    }
    char v15 = 0;
  }

  return v15;
}

void __68__VKMapView_Munin__moveToStorefrontView_animated_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained resetPathAnimation];
  }
}

- (id)muninMarkerAtCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
  }
  BOOL v7 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkerAtPointSync", "", buf, 2u);
  }
  id v8 = *(int8x8_t **)(*((void *)self + 48) + 1120);
  int8x8_t v9 = v8[2];
  if (!*(void *)&v9) {
    goto LABEL_111;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v12 = 0x669A8EDAC04FCBF1;
    if (*(void *)&v9 <= 0x669A8EDAC04FCBF1uLL) {
      uint64_t v12 = 0x669A8EDAC04FCBF1uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v12 = (*(void *)&v9 - 1) & 0x669A8EDAC04FCBF1;
  }
  uint64_t v13 = *(void **)(*(void *)&v8[1] + 8 * v12);
  if (!v13) {
    goto LABEL_71;
  }
  id v14 = (void *)*v13;
  if (!v14) {
    goto LABEL_71;
  }
  if (v10.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v16 = v14[1];
      if (v16 == 0x669A8EDAC04FCBF1)
      {
        if (v14[2] == 0x669A8EDAC04FCBF1) {
          goto LABEL_26;
        }
      }
      else if ((v16 & (*(void *)&v9 - 1)) != v12)
      {
        goto LABEL_69;
      }
      id v14 = (void *)*v14;
      if (!v14) {
        goto LABEL_69;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v14[1];
    if (v15 == 0x669A8EDAC04FCBF1) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v12) {
      goto LABEL_69;
    }
LABEL_15:
    id v14 = (void *)*v14;
    if (!v14) {
      goto LABEL_69;
    }
  }
  if (v14[2] != 0x669A8EDAC04FCBF1) {
    goto LABEL_15;
  }
LABEL_26:
  uint64_t v17 = v14[5];
  if (!v17) {
    goto LABEL_69;
  }
  long double v18 = tan(var0 * 0.00872664626 + 0.785398163);
  long double v19 = log(v18);
  v20.f64[0] = var1;
  v20.f64[1] = v19;
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t v81 = vmlaq_f64(_Q2, (float64x2_t)xmmword_1A28FCBE0, v20);
  *(void *)id buf = 0;
  double v83 = 0.0;
  double v84 = 0.0;
  int v78 = 0;
  uint8x8_t v79 = 0;
  uint64_t v80 = 0;
  uint64_t v26 = *(void *)(v17 + 168);
  unsigned int v27 = (pthread_rwlock_t *)(v26 + 96);
  uint64_t v28 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v26 + 96));
  if (v28) {
    geo::read_write_lock::logFailure(v28, (uint64_t)"read lock", v29);
  }
  uint64_t v30 = *(VKMuninMarker **)(v26 + 48);
  uint64_t v31 = (VKMuninMarker *)(v26 + 56);
  if (v30 != v31)
  {
    do
    {
      md::mun::MuninMetadata::neighborsWithinRadius(*(void *)&v30->_anon_18[8], v81.f64, (uint64_t)&v78, (uint64_t)buf, 250.0);
      isa = *(VKMuninMarker **)&v30->_collectionPoint._hasValue;
      if (isa)
      {
        do
        {
          uint64_t v33 = isa;
          isa = (VKMuninMarker *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          uint64_t v33 = *(VKMuninMarker **)&v30->_collectionPoint._value.type;
          _ZF = v33->super.isa == (Class)v30;
          uint64_t v30 = v33;
        }
        while (!_ZF);
      }
      uint64_t v30 = v33;
    }
    while (v33 != v31);
  }
  uint64_t v34 = (geo::read_write_lock *)pthread_rwlock_unlock(v27);
  if (v34) {
    geo::read_write_lock::logFailure(v34, (uint64_t)"unlock", v35);
  }
  int v36 = v78;
  uint64_t v37 = *(void **)buf;
  BOOL v38 = v79 == v78;
  if (v79 == v78)
  {
    if (v78) {
      goto LABEL_64;
    }
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    unint64_t v41 = (v79 - v78) >> 3;
    if (v41 <= 1) {
      unint64_t v41 = 1;
    }
    do
    {
      if (*(double *)(*(void *)buf + 8 * v40) < *(double *)(*(void *)buf + 8 * v39)) {
        uint64_t v39 = v40;
      }
      ++v40;
    }
    while (v41 != v40);
    uint64_t v42 = 0;
    double v43 = fmax(sqrt(*(double *)(*(void *)buf + 8 * v39)) * 1.2, 1.0);
    double v44 = v43 * v43;
    uint64_t v45 = v39;
    do
    {
      if (*(double *)(*(void *)buf + 8 * v42) <= v44)
      {
        uint64_t v46 = *(void *)(*(void *)&v78[8 * v42] + 80);
        if (v46 > *(void *)(*(void *)&v78[8 * v45] + 80)
          && (unint64_t)(v46 - *(void *)(*(void *)&v78[8 * v39] + 80)) > 0x240C8400)
        {
          uint64_t v45 = v42;
        }
      }
      ++v42;
    }
    while (v41 != v42);
    uint64_t v31 = *(VKMuninMarker **)&v78[8 * v45];
    if (v31)
    {
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
      }
      uint64_t v48 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)std::string v77 = 0;
        _os_log_impl(&dword_1A1780000, v48, OS_LOG_TYPE_INFO, "Marker at point, got one from metadata", v77, 2u);
      }
      uint64_t v31 = [[VKMuninMarker alloc] initWithCollectionPoint:v31];
    }
    else
    {
      BOOL v38 = 1;
    }
LABEL_64:
    operator delete(v36);
    uint64_t v37 = *(void **)buf;
  }
  if (*(double *)&v37 != 0.0)
  {
    double v83 = *(double *)&v37;
    operator delete(v37);
  }
  if (v38)
  {
    id v8 = *(int8x8_t **)(*((void *)self + 48) + 1120);
    int8x8_t v9 = v8[2];
LABEL_69:
    if (!*(void *)&v9) {
      goto LABEL_111;
    }
    uint8x8_t v49 = (uint8x8_t)vcnt_s8(v9);
    v49.i16[0] = vaddlv_u8(v49);
    unint64_t v11 = v49.u32[0];
LABEL_71:
    if (v11 > 1)
    {
      unint64_t v50 = 0xEA624BC935BAF297;
      if (*(void *)&v9 <= 0xEA624BC935BAF297) {
        unint64_t v50 = 0xEA624BC935BAF297 % *(void *)&v9;
      }
    }
    else
    {
      unint64_t v50 = (*(void *)&v9 - 1) & 0xEA624BC935BAF297;
    }
    uint64_t v51 = *(void **)(*(void *)&v8[1] + 8 * v50);
    if (!v51) {
      goto LABEL_111;
    }
    uint64_t v52 = (void *)*v51;
    if (!v52) {
      goto LABEL_111;
    }
    if (v11 < 2)
    {
      uint64_t v53 = *(void *)&v9 - 1;
      while (1)
      {
        uint64_t v55 = v52[1];
        if (v55 == 0xEA624BC935BAF297)
        {
          if (v52[2] == 0xEA624BC935BAF297) {
            goto LABEL_91;
          }
        }
        else if ((v55 & v53) != v50)
        {
          goto LABEL_111;
        }
        uint64_t v52 = (void *)*v52;
        if (!v52) {
          goto LABEL_111;
        }
      }
    }
    while (1)
    {
      unint64_t v54 = v52[1];
      if (v54 == 0xEA624BC935BAF297)
      {
        if (v52[2] == 0xEA624BC935BAF297)
        {
LABEL_91:
          uint64_t v56 = v52[5];
          if (v56)
          {
            size_t v57 = *(uint64_t **)(v56 + 160);
            float v58 = *(uint64_t **)(v56 + 168);
            if (v57 != v58)
            {
              long double v59 = tan(var0 * 0.00872664626 + 0.785398163);
              long double v60 = log(v59);
              char v61 = 0;
              int v62 = 0;
              v63.f64[0] = var1;
              v63.f64[1] = v60;
              double v64 = 1.79769313e308;
              __asm { FMOV            V0.2D, #0.5 }
              float64x2_t v66 = vmlaq_f64(_Q0, (float64x2_t)xmmword_1A28FCBE0, v63);
              double v67 = v66.f64[1];
              double v76 = v66.f64[0];
              do
              {
                md::MuninAvailabilityData::nearestAvailableRoadPoint((uint64_t)buf, *v57, v66.f64[0], v67);
                if (buf[0])
                {
                  if ((v76 - v83) * (v76 - v83) + (v67 - v84) * (v67 - v84) >= v64) {
                    double v68 = 0.0;
                  }
                  else {
                    double v68 = 1.0;
                  }
                  v66.f64[0] = v76;
                  if (v64 <= v68)
                  {
                    double v68 = v64;
                  }
                  else
                  {
                    if (!v62) {
                      char v61 = 1;
                    }
                    int v62 = 1;
                    double v3 = v83;
                    double v4 = v84;
                  }
                }
                else
                {
                  double v68 = v64;
                  v66.f64[0] = v76;
                }
                v57 += 2;
                double v64 = v68;
              }
              while (v57 != v58);
              if (v61)
              {
                if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
                  dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
                }
                long long v69 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
                if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)id buf = 0;
                  _os_log_impl(&dword_1A1780000, v69, OS_LOG_TYPE_INFO, "Marker at point, got one from the road network", buf, 2u);
                }
                long double v70 = exp(v4 * 6.28318531 + -3.14159265);
                double v71 = atan(v70);
                long double v72 = fmod(v3 * 6.28318531, 6.28318531);
                uint64_t v31 = -[VKMuninMarker initWithCoordinate:]([VKMuninMarker alloc], "initWithCoordinate:", v71 * 114.591559 + -90.0, (double)(fmod(v72 + 6.28318531, 6.28318531) * 57.2957795 + -180.0), 0.0);
                break;
              }
            }
          }
LABEL_111:
          if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
            dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
          }
          int v73 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
          if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_1A1780000, v73, OS_LOG_TYPE_INFO, "Marker at point, failed to find a munin marker", buf, 2u);
          }
          uint64_t v31 = 0;
          break;
        }
      }
      else
      {
        if (v54 >= *(void *)&v9) {
          v54 %= *(void *)&v9;
        }
        if (v54 != v50) {
          goto LABEL_111;
        }
      }
      uint64_t v52 = (void *)*v52;
      if (!v52) {
        goto LABEL_111;
      }
    }
  }
  return v31;
}

- (id)muninMarkerAtCoordinate:(id)a3 completeMarkerHandler:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void (**)(id, void *))a4;
  id v8 = -[VKMapView muninMarkerAtCoordinate:](self, "muninMarkerAtCoordinate:", var0, var1);
  os_signpost_id_t v9 = *(void *)(*((void *)self + 48) + 1216);
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
  }
  uint8x8_t v10 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
  unint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v45[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MarkerAtPoint", "", (uint8_t *)v45, 2u);
  }

  if (v8 && [v8 canMoveToMarker])
  {
    v7[2](v7, v8);
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    uint64_t v13 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
    id v14 = v13;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v45[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v14, OS_SIGNPOST_INTERVAL_END, v9, "MarkerAtPoint", "", (uint8_t *)v45, 2u);
    }
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v15 = *((void *)self + 48);
  uint64_t v16 = *(int8x8_t **)(v15 + 1120);
  int8x8_t v17 = v16[2];
  if (!*(void *)&v17) {
    goto LABEL_40;
  }
  uint8x8_t v18 = (uint8x8_t)vcnt_s8(v17);
  v18.i16[0] = vaddlv_u8(v18);
  if (v18.u32[0] > 1uLL)
  {
    uint64_t v19 = 0x669A8EDAC04FCBF1;
    if (*(void *)&v17 <= 0x669A8EDAC04FCBF1uLL) {
      uint64_t v19 = 0x669A8EDAC04FCBF1uLL % *(void *)&v17;
    }
  }
  else
  {
    uint64_t v19 = (*(void *)&v17 - 1) & 0x669A8EDAC04FCBF1;
  }
  float64x2_t v20 = *(void **)(*(void *)&v16[1] + 8 * v19);
  if (!v20) {
    goto LABEL_40;
  }
  unint64_t v21 = (void *)*v20;
  if (!v21) {
    goto LABEL_40;
  }
  if (v18.u32[0] < 2uLL)
  {
    uint64_t v22 = *(void *)&v17 - 1;
    while (1)
    {
      uint64_t v24 = v21[1];
      if (v24 == 0x669A8EDAC04FCBF1)
      {
        if (v21[2] == 0x669A8EDAC04FCBF1) {
          goto LABEL_35;
        }
      }
      else if ((v24 & v22) != v19)
      {
        goto LABEL_40;
      }
      unint64_t v21 = (void *)*v21;
      if (!v21) {
        goto LABEL_40;
      }
    }
  }
  while (1)
  {
    unint64_t v23 = v21[1];
    if (v23 == 0x669A8EDAC04FCBF1) {
      break;
    }
    if (v23 >= *(void *)&v17) {
      v23 %= *(void *)&v17;
    }
    if (v23 != v19) {
      goto LABEL_40;
    }
LABEL_24:
    unint64_t v21 = (void *)*v21;
    if (!v21) {
      goto LABEL_40;
    }
  }
  if (v21[2] != 0x669A8EDAC04FCBF1) {
    goto LABEL_24;
  }
LABEL_35:
  uint64_t v25 = v21[5];
  uint64_t v26 = *(void *)(v15 + 896);
  if (!v25 || v26 == 0)
  {
LABEL_40:
    v7[2](v7, 0);
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    uint64_t v28 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
    id v14 = v28;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      LOWORD(v45[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v14, OS_SIGNPOST_INTERVAL_END, v9, "MarkerAtPoint", "", (uint8_t *)v45, 2u);
    }
    goto LABEL_45;
  }
  long double v30 = tan(var0 * 0.00872664626 + 0.785398163);
  double v31 = log(v30);
  uint64_t v32 = *(void *)(v25 + 168);
  v45[0] = var0 * 0.0174532925;
  v45[1] = var1 * 0.0174532925;
  uint64_t v46 = 0;
  md::mun::MuninMetadataContainer::nearestMetadataTiles((uint64_t)&v52, v32, v45, 250.0);
  *(_OWORD *)std::string __p = 0u;
  *(_OWORD *)unint64_t v50 = 0u;
  int v51 = 1065353216;
  uint64_t v33 = (unsigned __int8 *)v53;
  if (v53)
  {
    do
    {
      gdc::Tiled::mapDataKeyFromTile((unsigned __int8 *)v45, 0, v33 + 16, 35, -4);
      std::__hash_table<gdc::LayerDataRequestKey,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,std::allocator<gdc::LayerDataRequestKey>>::__emplace_unique_key_args<gdc::LayerDataRequestKey,gdc::LayerDataRequestKey const&>((uint64_t)__p, (unsigned __int8 *)v45, (uint64_t)v45);
      if (v48) {
        char v48 = 0;
      }
      if (v46 != v47) {
        free(v46);
      }
      uint64_t v33 = *(unsigned __int8 **)v33;
    }
    while (v33);
  }
  uint64_t v34 = *(void *)(v26 + 24);
  BOOL v35 = (void *)MEMORY[0x1A6239EB0](v7);
  uint64_t v36 = MEMORY[0x1A6239EB0]();
  uint64_t v37 = (double *)operator new(0x28uLL);
  *(void *)uint64_t v37 = &unk_1EF56C948;
  *((void *)v37 + 1) = v36;
  v37[2] = var1 * 0.00277777778 + 0.5;
  v37[3] = v31 * 0.159154943 + 0.5;
  *((void *)v37 + 4) = v9;
  uint64_t v55 = v37;
  gdc::LayerDataManager::requestLayerDataKeys(v34, (uint64_t)__p, v54);
  if (v55 == (double *)v54)
  {
    (*(void (**)(void *))(v54[0] + 32))(v54);
  }
  else if (v55)
  {
    (*(void (**)(double *))(*(void *)v55 + 40))(v55);
  }

  BOOL v38 = v50[0];
  if (v50[0])
  {
    do
    {
      if (v38[112]) {
        v38[112] = 0;
      }
      double v43 = *(unsigned char **)v38;
      double v44 = (void *)*((void *)v38 + 4);
      if (v44 != *((void **)v38 + 6)) {
        free(v44);
      }
      operator delete(v38);
      BOOL v38 = v43;
    }
    while (v43);
  }
  uint64_t v39 = __p[0];
  __p[0] = 0;
  if (v39) {
    operator delete(v39);
  }
  uint64_t v40 = v53;
  if (v53)
  {
    do
    {
      unint64_t v41 = (void *)*v40;
      operator delete(v40);
      uint64_t v40 = v41;
    }
    while (v41);
  }
  uint64_t v42 = v52;
  uint64_t v52 = 0;
  if (v42) {
    operator delete(v42);
  }
LABEL_46:

  return v8;
}

- (double)heading
{
  [*((id *)self + 35) heading];
  return result;
}

- (void)enterMuninForMarker:(id)a3 withHeading:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    BOOL v7 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "Enter for marker", buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
      }
    }
    id v8 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnterForMarker", "", buf, 2u);
    }
    os_signpost_id_t v9 = +[VKSharedResourcesManager sharedResources];
    [v9 startDecompressionSession];

    [(VKMapView *)self setMapType:11];
    [(VKMapView *)self setShouldLoadFallbackTiles:0];
    [v6 coordinate];
    double v11 = v10;
    [v6 coordinate];
    double v13 = v12;
    [v6 coordinate];
    id v14 = (char *)self + 272;
    uint64_t v15 = (void *)*((void *)v14 + 1);
    v19[0] = v11 * 0.0174532925;
    v19[1] = v13 * 0.0174532925;
    v19[2] = v16;
    v19[3] = 0.0;
    v19[4] = 0.0;
    void v19[5] = a4 * -0.0174532925;
    v19[6] = 0.0;
    [v15 setCameraFrame:v19];
    uint64_t v17 = [v6 collectionPoint];
    if (v17) {
      [*((id *)v14 + 1) setCurrentPoint:v17];
    }
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    uint8x8_t v18 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A1780000, v18, OS_LOG_TYPE_ERROR, "Missing storefront info. Unable to enter munin.", buf, 2u);
    }
    [(VKMapView *)self setMapType:0];
  }
}

- (void)enterMuninForStorefrontView:(id)a3 secondaryStorefrontView:(id)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self);
  id v6 = v5;
  BOOL v7 = (id *)v4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  id v10 = v6;
  if (v9
    && ([v9 imageryInfo],
        double v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 dataFormatVersion],
        v11,
        v12 < 3))
  {
    id v14 = +[VKSharedResourcesManager sharedResources];
    [v14 startDecompressionSession];

    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    uint64_t v15 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A1780000, v15, OS_LOG_TYPE_INFO, "Enter for storefront view", buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
      }
    }
    double v16 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnterForStorefrontView", "", buf, 2u);
    }
    uint64_t v17 = [v9 imageryInfo];

    md::mun::cameraFrameFromStorefront((uint64_t)v37, v9);
    [v7 setMapType:11];
    [v7 setShouldLoadFallbackTiles:0];
    uint8x8_t v18 = +[VKDebugSettings sharedSettings];
    if (![v18 muninIgnorePlacesMetadata])
    {
      if (v10)
      {
        uint64_t v19 = [v10 imageryInfo];

        id v20 = v7[35];
        geo::optional<md::mun::CollectionPoint>::optional((uint64_t)v43, (uint64_t)v33);
        [v20 setCurrentPoint:buf secondaryPoint:v43];
        if (v43[0])
        {
          unint64_t v21 = v44;
          uint64_t v22 = v45;
          if (v44 != v45)
          {
            do
            {
              unint64_t v23 = (void *)v21[31];
              if (v23 != (void *)v21[33]) {
                free(v23);
              }
              v21 += 36;
            }
            while (v21 != v22);
            unint64_t v21 = v44;
          }
          if (v21 != v46) {
            free(v21);
          }
          v43[0] = 0;
        }

        uint64_t v24 = v34;
        uint64_t v25 = v35;
        if (v34 != v35)
        {
          do
          {
            uint64_t v26 = (void *)v24[31];
            if (v26 != (void *)v24[33]) {
              free(v26);
            }
            v24 += 36;
          }
          while (v24 != v25);
          uint64_t v24 = v34;
        }
        if (v24 != v36) {
          free(v24);
        }
      }
      else
      {
        [v7[35] setCurrentPoint:buf];
      }
    }
    id v27 = v7[35];
    v31[0] = v37[0];
    v31[1] = v37[1];
    v31[2] = v37[2];
    uint64_t v32 = v38;
    [v27 setCameraFrame:v31];

    uint64_t v28 = v40;
    uint64_t v29 = v41;
    if (v40 != v41)
    {
      do
      {
        long double v30 = (void *)v28[31];
        if (v30 != (void *)v28[33]) {
          free(v30);
        }
        v28 += 36;
      }
      while (v28 != v29);
      uint64_t v28 = v40;
    }
    if (v28 != v42) {
      free(v28);
    }
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_49544);
    }
    double v13 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A1780000, v13, OS_LOG_TYPE_ERROR, "Missing storefront info. Unable to enter munin.", buf, 2u);
    }
    [v7 setMapType:0];
  }
}

@end