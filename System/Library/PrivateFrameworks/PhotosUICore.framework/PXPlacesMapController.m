@interface PXPlacesMapController
+ ($12569EB6952B655774F5ECF42E55FE6C)mapRectWithMapViewSize:(CGSize)a3 centeredOnCoordinate:(CLLocationCoordinate2D)a4 visibleDistance:(double)a5;
+ (void)launchMapsAtCoordinate:(CLLocationCoordinate2D)a3 withTitle:(id)a4 completionHandler:(id)a5;
- ($12569EB6952B655774F5ECF42E55FE6C)_ensureMinimumSize:(id)a3;
- ($12569EB6952B655774F5ECF42E55FE6C)_mapRectForGeotaggablesFromPipeline:(id)a3 fitAdjusted:(BOOL *)a4;
- ($12569EB6952B655774F5ECF42E55FE6C)mapRectForGeotaggablesFromDataSource:(id)a3 renderer:(id)a4 mapViewSize:(CGSize)a5 fitAdjusted:(BOOL *)a6;
- ($12569EB6952B655774F5ECF42E55FE6C)mapRectForNearbyQueriesFromRect:(id)a3 atScale:(double)a4 targetViewSize:(CGSize)a5;
- ($12569EB6952B655774F5ECF42E55FE6C)signalFocusMapRect;
- ($B7681AED98C8A3AAF93603046C9C96EE)initialCoordinateRegion;
- (BOOL)mapViewIsVisible;
- (BOOL)pipelineExecutionAllowed;
- (BOOL)signalFocusWhenMapViewBecomesVisible;
- (CLLocationCoordinate2D)initialCenterCoordinate;
- (MKAnnotation)currentSelection;
- (NSMapTable)dataSourceToPipelineMap;
- (NSMutableDictionary)showDebugMapRectColors;
- (NSOrderedSet)currentSelectedGeotaggables;
- (NSSet)dataSources;
- (PXPlacesImageCache)cache;
- (PXPlacesMapController)init;
- (PXPlacesMapControllerChangeDelegate)changeDelegate;
- (PXPlacesMapControllerFocusDelegate)focusDelegate;
- (PXPlacesMapControllerLoadingStateDelegate)stateDelegate;
- (PXPlacesMapControllerSelectionDelegate)selectionDelegate;
- (PXPlacesMapPipelineExecutionContext)currentExecutionContext;
- (PXPlacesMapView)mapView;
- (UIEdgeInsets)initialEdgePadding;
- (double)_defaultAnimationDuration;
- (double)_fadeInAnimationDuration;
- (double)_fadeOutAnimationDuration;
- (double)_zPositionForAnnotationIndex:(int64_t)a3;
- (id)createTrackingBarButtonItem;
- (id)executePipeline:(id)a3 dataSourceChange:(id)a4 context:(id)a5;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)visibleGeotaggableFromDataSource:(id)a3;
- (void)_executeUpdatePlanResults:(id)a3;
- (void)_setVisibleMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4 animated:(BOOL)a5;
- (void)_showDebugMapRect:(id)a3 color:(id)a4;
- (void)_updateMapWithAllDataSources:(id)a3;
- (void)_updateMapWithDataSource:(id)a3 dataSourceChange:(id)a4 completion:(id)a5;
- (void)_updateMapWithDataSources:(id)a3 dataSourceChangeTable:(id)a4 completion:(id)a5;
- (void)addPipeline:(id)a3;
- (void)dataSource:(id)a3 didChange:(id)a4;
- (void)dealloc;
- (void)focusOnGeotaggablesFromPipeline:(id)a3 animated:(BOOL)a4;
- (void)focusOnGeotaggablesFromPipelineImmediately:(id)a3;
- (void)loadView;
- (void)mapContainerViewDidAppear;
- (void)mapContainerViewDidDisappear;
- (void)mapContainerViewWillAppear;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)removeDataSource:(id)a3;
- (void)removePipeline:(id)a3;
- (void)resumePipelines:(id)a3;
- (void)runPipelines;
- (void)setCache:(id)a3;
- (void)setChangeDelegate:(id)a3;
- (void)setCurrentExecutionContext:(id)a3;
- (void)setCurrentSelection:(id)a3;
- (void)setDataSourceToPipelineMap:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setFocusDelegate:(id)a3;
- (void)setInitialCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)setInitialCoordinateRegion:(id *)a3;
- (void)setInitialEdgePadding:(UIEdgeInsets)a3;
- (void)setMapView:(id)a3;
- (void)setMapViewIsVisible:(BOOL)a3;
- (void)setPipelineExecutionAllowed:(BOOL)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setShowDebugMapRectColors:(id)a3;
- (void)setSignalFocusMapRect:(id)a3;
- (void)setSignalFocusWhenMapViewBecomesVisible:(BOOL)a3;
- (void)setStateDelegate:(id)a3;
- (void)setVisibleMapRect:(id)a3 forPipeline:(id)a4 animated:(BOOL)a5;
- (void)setVisibleMapRect:(id)a3 forRenderer:(id)a4 animated:(BOOL)a5;
- (void)suspendPipelines;
@end

@implementation PXPlacesMapController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showDebugMapRectColors, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_currentExecutionContext, 0);
  objc_storeStrong((id *)&self->_dataSourceToPipelineMap, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_currentSelection, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_stateDelegate);
  objc_destroyWeak((id *)&self->_focusDelegate);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_pendingDataSourceChanges, 0);
  objc_storeStrong((id *)&self->_dataSourceExecutionContexts, 0);
  objc_storeStrong((id *)&self->_uiUpdateTimer, 0);
  objc_storeStrong((id *)&self->_executionContextQueue, 0);
  objc_storeStrong((id *)&self->_dataSourcesQueue, 0);
  objc_storeStrong((id *)&self->_pipelinesQueue, 0);
}

- (void)setShowDebugMapRectColors:(id)a3
{
}

- (NSMutableDictionary)showDebugMapRectColors
{
  return self->_showDebugMapRectColors;
}

- (void)setCache:(id)a3
{
}

- (PXPlacesImageCache)cache
{
  return (PXPlacesImageCache *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSignalFocusMapRect:(id)a3
{
  self->_signalFocusMapRect = ($DFF1302A2B19FC4662A7566F2E3E3516)a3;
}

- ($12569EB6952B655774F5ECF42E55FE6C)signalFocusMapRect
{
  double x = self->_signalFocusMapRect.origin.x;
  double y = self->_signalFocusMapRect.origin.y;
  double width = self->_signalFocusMapRect.size.width;
  double height = self->_signalFocusMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setSignalFocusWhenMapViewBecomesVisible:(BOOL)a3
{
  self->_signalFocusWhenMapViewBecomesVisible = a3;
}

- (BOOL)signalFocusWhenMapViewBecomesVisible
{
  return self->_signalFocusWhenMapViewBecomesVisible;
}

- (void)setMapViewIsVisible:(BOOL)a3
{
  self->_mapViewIsVisible = a3;
}

- (BOOL)mapViewIsVisible
{
  return self->_mapViewIsVisible;
}

- (void)setPipelineExecutionAllowed:(BOOL)a3
{
  self->_pipelineExecutionAllowed = a3;
}

- (BOOL)pipelineExecutionAllowed
{
  return self->_pipelineExecutionAllowed;
}

- (void)setCurrentExecutionContext:(id)a3
{
}

- (PXPlacesMapPipelineExecutionContext)currentExecutionContext
{
  return (PXPlacesMapPipelineExecutionContext *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDataSourceToPipelineMap:(id)a3
{
}

- (NSMapTable)dataSourceToPipelineMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataSources:(id)a3
{
}

- (NSSet)dataSources
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentSelection:(id)a3
{
}

- (MKAnnotation)currentSelection
{
  return self->_currentSelection;
}

- (void)setInitialEdgePadding:(UIEdgeInsets)a3
{
  self->_initialEdgePadding = a3;
}

- (UIEdgeInsets)initialEdgePadding
{
  double top = self->_initialEdgePadding.top;
  double left = self->_initialEdgePadding.left;
  double bottom = self->_initialEdgePadding.bottom;
  double right = self->_initialEdgePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInitialCoordinateRegion:(id *)a3
{
  self->_initialCoordinateRegion.center.latitude = v3;
  self->_initialCoordinateRegion.center.longitude = v4;
  self->_initialCoordinateRegion.span.latitudeDelta = v5;
  self->_initialCoordinateRegion.span.longitudeDelta = v6;
}

- ($B7681AED98C8A3AAF93603046C9C96EE)initialCoordinateRegion
{
  return self;
}

- (void)setInitialCenterCoordinate:(CLLocationCoordinate2D)a3
{
  self->_initialCenterCoordinate = a3;
}

- (CLLocationCoordinate2D)initialCenterCoordinate
{
  double latitude = self->_initialCenterCoordinate.latitude;
  double longitude = self->_initialCenterCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setMapView:(id)a3
{
}

- (void)setStateDelegate:(id)a3
{
}

- (PXPlacesMapControllerLoadingStateDelegate)stateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDelegate);
  return (PXPlacesMapControllerLoadingStateDelegate *)WeakRetained;
}

- (void)setFocusDelegate:(id)a3
{
}

- (PXPlacesMapControllerFocusDelegate)focusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
  return (PXPlacesMapControllerFocusDelegate *)WeakRetained;
}

- (void)setChangeDelegate:(id)a3
{
}

- (PXPlacesMapControllerChangeDelegate)changeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
  return (PXPlacesMapControllerChangeDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (PXPlacesMapControllerSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  return (PXPlacesMapControllerSelectionDelegate *)WeakRetained;
}

- (void)mapContainerViewDidDisappear
{
}

- (void)mapContainerViewDidAppear
{
  [(PXPlacesMapController *)self setMapViewIsVisible:1];
  if ([(PXPlacesMapController *)self signalFocusWhenMapViewBecomesVisible])
  {
    [(PXPlacesMapController *)self setSignalFocusWhenMapViewBecomesVisible:0];
    CLLocationDegrees v3 = [(PXPlacesMapController *)self focusDelegate];

    if (v3)
    {
      CLLocationDegrees v4 = [(PXPlacesMapController *)self mapView];
      double v5 = [v4 currentViewPortWithThumbnailOverscan];
      [v5 scale];

      id v6 = [(PXPlacesMapController *)self focusDelegate];
      [(PXPlacesMapController *)self signalFocusMapRect];
      objc_msgSend(v6, "mapFocusDidChange:toRect:scale:", self);
    }
  }
}

- (void)mapContainerViewWillAppear
{
  id v2 = [(PXPlacesMapController *)self mapView];
  [v2 deselectAllAnnotationsAnimated:0];
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id v5 = [(PXPlacesMapController *)self stateDelegate];
  [v5 mapViewDidFinishRendering:self];
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a4;
  if (([v6 conformsToProtocol:&unk_1F048BF10] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXPlacesMapController.m" lineNumber:1102 description:@"Parameter 'overlay' must conform to <PXPlacesMapRenderable>."];
  }
  id v7 = v6;
  v8 = [v7 renderer];
  if (![v8 conformsToProtocol:&unk_1F050E480]
    || (id v9 = v8,
        [(PXPlacesMapController *)self mapView],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v9 rendererForOverlay:v7 andMapView:v10],
        v11 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10,
        !v11))
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXPlacesMapController.m" lineNumber:1112 description:@"Function requires a non-null value for overlayRenderer"];

    v11 = 0;
  }

  return v11;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v13 = a3;
  id v6 = [a4 annotation];
  id v7 = v6;
  if (v6)
  {
    if ([v6 conformsToProtocol:&unk_1F048BF10])
    {
      v8 = [(PXPlacesMapController *)self selectionDelegate];

      if (v8)
      {
        id v9 = [v7 selectionHandler];
        v10 = [v9 selectedGeotaggablesForRenderable:v7 mapView:v13];
        [(PXPlacesMapController *)self setCurrentSelection:v7];
        if (v10)
        {
          v11 = [(PXPlacesMapController *)self selectionDelegate];
          v12 = [(PXPlacesMapController *)self mapView];
          [v11 didSelectGeotaggableItems:v10 fromMapView:v12];
        }
      }
    }
  }
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v43 = [MEMORY[0x1E4F1CA80] set];
  v42 = [MEMORY[0x1E4F1CA80] set];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v11 = [v10 annotation];
        if ([v11 conformsToProtocol:&unk_1F050E420]) {
          [v43 addObject:v11];
        }
        if ([v11 conformsToProtocol:&unk_1F048BF10])
        {
          -[PXPlacesMapController _zPositionForAnnotationIndex:](self, "_zPositionForAnnotationIndex:", [v11 index]);
          double v13 = v12;
          v14 = [v10 layer];
          [v14 setZPosition:v13];
        }
        if ([v10 conformsToProtocol:&unk_1F04862A0])
        {
          v15 = [v10 layer];
          [v15 setOpacity:0.0];

          [v42 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v7);
  }

  v16 = [(PXPlacesMapPipelineExecutionContext *)self->_currentExecutionContext updatePlanResults];
  v17 = [MEMORY[0x1E4F1CA80] set];
  v18 = [MEMORY[0x1E4F1CA80] set];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
  v21 = v43;
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        v26 = [v25 annotationsToRemoveAfterAnimationHasStarted];
        [v17 unionSet:v26];

        v27 = [v25 annotationsToRemoveAfterAnimationHasEnded];
        [v18 unionSet:v27];
      }
      uint64_t v22 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v22);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke;
  aBlock[3] = &unk_1E5DD32A8;
  v28 = self;
  aBlock[4] = self;
  id v29 = v18;
  id v54 = v29;
  v30 = (void (**)(void))_Block_copy(aBlock);
  if ([v43 count])
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_2;
    v51[3] = &unk_1E5DD36F8;
    id v52 = v43;
    v31 = _Block_copy(v51);
    v32 = (void *)MEMORY[0x1E4FB1EB0];
    [(PXPlacesMapController *)self _defaultAnimationDuration];
    double v34 = v33;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_3;
    v49[3] = &unk_1E5DD3128;
    id v50 = v31;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_4;
    v47[3] = &unk_1E5DCCA98;
    v48 = v30;
    id v35 = v31;
    v36 = v32;
    v28 = self;
    [v36 animateWithDuration:v49 animations:v47 completion:v34];
  }
  else
  {
    v30[2](v30);
  }
  if ([v42 count])
  {
    v37 = (void *)MEMORY[0x1E4FB1EB0];
    [(PXPlacesMapController *)v28 _fadeInAnimationDuration];
    double v39 = v38;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_5;
    v45[3] = &unk_1E5DD36F8;
    id v46 = v42;
    [v37 animateWithDuration:v45 animations:v39];
  }
  if ([v17 count])
  {
    v40 = [(PXPlacesMapController *)v28 mapView];
    v41 = [v17 allObjects];
    [v40 removeAnnotations:v41];

    v21 = v43;
  }
}

void __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mapView];
  id v2 = [*(id *)(a1 + 40) allObjects];
  [v3 removeAnnotations:v2];
}

void __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v6, "animationDestinationCoordinate", (void)v9);
        double latitude = v15.latitude;
        double longitude = v15.longitude;
        if (CLLocationCoordinate2DIsValid(v15)) {
          objc_msgSend(v6, "setCoordinate:", latitude, longitude);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

uint64_t __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_5(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "layer", (void)v8);
        LODWORD(v7) = 1.0;
        [v6 setOpacity:v7];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  if ([v5 conformsToProtocol:&unk_1F048BF10])
  {
    uint64_t v6 = [v5 renderer];
    double v7 = [(PXPlacesMapController *)self mapView];
    long long v8 = [v6 viewForAnnotation:v5 andMapView:v7];
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  -[PXPlacesMapController _updateMapWithAllDataSources:](self, "_updateMapWithAllDataSources:", 0, a4);
  id v5 = [(PXPlacesMapController *)self changeDelegate];
  [v5 mapRegionDidChange:self];
}

- (void)dataSource:(id)a3 didChange:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v8 = [v7 removedItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        uint64_t v14 = [(PXPlacesMapController *)self cache];
        [v14 removeCachedRenderedImageForGeotaggble:v13 andKey:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CLLocationCoordinate2D v15 = objc_msgSend(v7, "updatedItems", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * v19);
        v21 = [(PXPlacesMapController *)self cache];
        [v21 removeCachedRenderedImageForGeotaggble:v20 andKey:0];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  [(PXPlacesMapController *)self _updateMapWithDataSource:v6 dataSourceChange:v7 completion:0];
  uint64_t v22 = [(PXPlacesMapController *)self changeDelegate];
  [v22 dataSourceDidChange:self];
}

- (NSOrderedSet)currentSelectedGeotaggables
{
  uint64_t v2 = [(PXPlacesMapController *)self currentSelection];
  if ([v2 conformsToProtocol:&unk_1F048BF10])
  {
    uint64_t v3 = [v2 geotaggables];
    uint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSOrderedSet *)v4;
}

- (double)_zPositionForAnnotationIndex:(int64_t)a3
{
  return (double)-a3;
}

- (void)_executeUpdatePlanResults:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKPlacesKitGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  PKPlacesKitGetLog();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  long long v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v62 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ExecuteUpdatePlanResults", "", buf, 2u);
  }
  v63 = v8;

  v68 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  v69 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  v67 = [MEMORY[0x1E4F1CA48] array];
  v66 = [MEMORY[0x1E4F1CA48] array];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v4;
  uint64_t v11 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v87 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        CLLocationCoordinate2D v15 = [v14 annotationsToAddImmediately];
        uint64_t v16 = [v15 allObjects];
        [v68 addObjectsFromArray:v16];

        uint64_t v17 = [v14 annotationsToRemoveImmediately];
        uint64_t v18 = [v17 allObjects];
        [v9 addObjectsFromArray:v18];

        uint64_t v19 = [v14 annotationsToRedraw];
        uint64_t v20 = [v19 allObjects];
        [v69 addObjectsFromArray:v20];

        v21 = [v14 annotationsWithUpdatedIndex];
        uint64_t v22 = [v21 allObjects];
        [v10 addObjectsFromArray:v22];

        long long v23 = [v14 overlaysToAddImmediately];
        long long v24 = [v23 allObjects];
        [v67 addObjectsFromArray:v24];

        long long v25 = [v14 overlaysToRemoveImmediately];
        long long v26 = [v25 allObjects];
        [v66 addObjectsFromArray:v26];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
    }
    while (v11);
  }

  long long v27 = [(PXPlacesMapController *)self mapView];
  [v27 addOverlays:v67];

  long long v28 = [(PXPlacesMapController *)self mapView];
  [v28 removeOverlays:v66];

  if ([v69 count])
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v29 = v69;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v82 objects:v93 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v83 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = *(void *)(*((void *)&v82 + 1) + 8 * j);
          double v34 = [(PXPlacesMapController *)self mapView];
          id v35 = [v34 viewForAnnotation:v33];

          if (v35) {
            [v35 setAnnotation:v33];
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v82 objects:v93 count:16];
      }
      while (v30);
    }
  }
  v64 = [MEMORY[0x1E4F1CA48] array];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v36 = v9;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v79 != v38) {
          objc_enumerationMutation(v36);
        }
        uint64_t v40 = *(void *)(*((void *)&v78 + 1) + 8 * k);
        v41 = [(PXPlacesMapController *)self mapView];
        v42 = [v41 viewForAnnotation:v40];

        if ([v42 conformsToProtocol:&unk_1F04862A0]) {
          [v64 addObject:v42];
        }
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v78 objects:v92 count:16];
    }
    while (v37);
  }

  if ([v64 count])
  {
    v43 = (void *)MEMORY[0x1E4FB1EB0];
    [(PXPlacesMapController *)self _fadeOutAnimationDuration];
    double v45 = v44;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke;
    v76[3] = &unk_1E5DD36F8;
    id v77 = v64;
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke_2;
    v74[3] = &unk_1E5DD0058;
    v74[4] = self;
    id v75 = v36;
    [v43 animateWithDuration:v76 animations:v74 completion:v45];

    id v46 = v77;
  }
  else
  {
    id v46 = [(PXPlacesMapController *)self mapView];
    [v46 removeAnnotations:v36];
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v47 = v10;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v70 objects:v91 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v71;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v71 != v49) {
          objc_enumerationMutation(v47);
        }
        v51 = *(void **)(*((void *)&v70 + 1) + 8 * m);
        id v52 = [(PXPlacesMapController *)self mapView];
        v53 = [v52 viewForAnnotation:v51];

        if (v53 && [v51 conformsToProtocol:&unk_1F048BF10])
        {
          id v54 = v51;
          -[PXPlacesMapController _zPositionForAnnotationIndex:](self, "_zPositionForAnnotationIndex:", [v54 index]);
          double v56 = v55;
          long long v57 = [v53 layer];
          [v57 setZPosition:v56];
        }
      }
      uint64_t v48 = [v47 countByEnumeratingWithState:&v70 objects:v91 count:16];
    }
    while (v48);
  }

  if ([v68 count])
  {
    long long v58 = [(PXPlacesMapController *)self mapView];
    [v58 addAnnotations:v68];
  }
  long long v59 = v63;
  long long v60 = v59;
  if (v62 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v60, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteUpdatePlanResults", "", buf, 2u);
  }
}

void __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        os_signpost_id_t v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "layer", (void)v7);
        [v6 setOpacity:0.0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapView];
  [v2 removeAnnotations:*(void *)(a1 + 40)];
}

- (double)_fadeOutAnimationDuration
{
  return 0.4;
}

- (double)_fadeInAnimationDuration
{
  return 0.15;
}

- (double)_defaultAnimationDuration
{
  return 0.3;
}

- (void)_updateMapWithDataSource:(id)a3 dataSourceChange:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PXPlacesMapController *)self dataSources];
  int v12 = [v11 containsObject:v8];

  if (v12 && v8 && self->_pipelineExecutionAllowed)
  {
    executionContextQueue = self->_executionContextQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke;
    v14[3] = &unk_1E5DD2BB8;
    v14[4] = self;
    id v15 = v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(executionContextQueue, v14);
  }
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke(id *a1)
{
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  double v55 = __Block_byref_object_copy__77757;
  double v56 = __Block_byref_object_dispose__77758;
  id v57 = 0;
  id v2 = a1[4];
  uint64_t v3 = *((void *)v2 + 2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_2;
  block[3] = &unk_1E5DCCA20;
  v51 = &v52;
  block[4] = v2;
  id v50 = a1[5];
  dispatch_sync(v3, block);
  if (!*((void *)a1[4] + 16) && [(id)v53[5] count])
  {
    uint64_t v43 = 0;
    double v44 = &v43;
    uint64_t v45 = 0x3032000000;
    id v46 = __Block_byref_object_copy__77757;
    id v47 = __Block_byref_object_dispose__77758;
    id v48 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_3;
    v42[3] = &unk_1E5DD0588;
    v42[4] = a1[4];
    v42[5] = &v43;
    dispatch_sync(MEMORY[0x1E4F14428], v42);
    os_signpost_id_t v6 = [PXPlacesMapPipelineExecutionContext alloc];
    uint64_t v7 = v44[5];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_4;
    v39[3] = &unk_1E5DCA938;
    v39[4] = a1[4];
    id v40 = a1[7];
    v41 = &v43;
    id v8 = [(PXPlacesMapPipelineExecutionContext *)v6 initWithViewPort:v7 completionHandler:v39];
    objc_storeStrong((id *)a1[4] + 16, v8);
    id v9 = [*((id *)a1[4] + 6) objectForKey:a1[5]];
    if (v9)
    {
      [a1[6] updateWithChange:v9];
      [*((id *)a1[4] + 6) removeObjectForKey:a1[5]];
    }
    [(PXPlacesMapPipelineExecutionContext *)v8 start];
    [(PXPlacesMapPipelineExecutionContext *)v8 startTimerForDataSource:a1[5]];
    id v10 = [a1[4] stateDelegate];
    [v10 mapController:a1[4] didStartExecutingPipelines:v53[5]];

    uint64_t v11 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_7;
    aBlock[3] = &unk_1E5DB6FF8;
    uint64_t v5 = v8;
    id v35 = v5;
    id v12 = a1[5];
    id v13 = a1[4];
    id v36 = v12;
    id v37 = v13;
    uint64_t v38 = &v52;
    uint64_t v14 = _Block_copy(aBlock);
    if ([(id)v53[5] count] == 1)
    {
      id v15 = dispatch_get_global_queue(25, 0);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_9;
      v29[3] = &unk_1E5DCA4D0;
      v29[4] = a1[4];
      uint64_t v33 = &v52;
      id v30 = a1[6];
      uint64_t v31 = v5;
      id v32 = v14;
      id v16 = v14;
      dispatch_async(v15, v29);
    }
    else
    {
      id v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
      dispatch_queue_t v17 = dispatch_queue_create("map update plan results", v16);
      uint64_t v18 = dispatch_get_global_queue(25, 0);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_10;
      v22[3] = &unk_1E5DB7048;
      id v19 = a1[4];
      long long v28 = &v52;
      v22[4] = v19;
      id v23 = a1[6];
      long long v24 = v5;
      dispatch_queue_t v25 = v17;
      id v26 = v11;
      id v27 = v14;
      id v20 = v14;
      v21 = v17;
      dispatch_async(v18, v22);
    }
    _Block_object_dispose(&v43, 8);

    goto LABEL_13;
  }
  if (a1[6])
  {
    uint64_t v4 = [*((id *)a1[4] + 6) objectForKey:a1[5]];
    uint64_t v5 = v4;
    if (v4)
    {
      [(PXPlacesMapPipelineExecutionContext *)v4 updateWithChange:a1[6]];
    }
    else
    {
      [*((id *)a1[4] + 6) setObject:a1[6] forKey:a1[5]];
      uint64_t v5 = 0;
    }
LABEL_13:
  }
  _Block_object_dispose(&v52, 8);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) dataSourceToPipelineMap];
  id v2 = [v6 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mapView];
  uint64_t v2 = [v5 currentViewPortWithThumbnailOverscan];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_5;
  block[3] = &unk_1E5DCA938;
  block[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, block);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 stopTimerForDataSource:v4];
  [*(id *)(a1 + 32) setUpdatePlanResults:v5];

  objc_initWeak(&location, *(id *)(a1 + 48));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_8;
  v8[3] = &unk_1E5DC4530;
  objc_copyWeak(&v11, &location);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v9 = v6;
  uint64_t v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_9(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectAtIndexedSubscript:0];
  uint64_t v4 = [v2 executePipeline:v3 dataSourceChange:a1[5] context:a1[6]];

  if (v4)
  {
    uint64_t v5 = a1[7];
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_10(uint64_t a1)
{
  size_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
  uint64_t v3 = dispatch_get_global_queue(25, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_11;
  v9[3] = &unk_1E5DB7020;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 80);
  v9[4] = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  dispatch_apply(v2, v3, v9);

  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 64), v6, v7, v8);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_11(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count] > a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:a2];
    uint64_t v6 = [v4 executePipeline:v5 dataSourceChange:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];

    if (v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_12;
      v8[3] = &unk_1E5DD32A8;
      uint64_t v7 = *(NSObject **)(a1 + 56);
      id v9 = *(id *)(a1 + 64);
      id v10 = v6;
      dispatch_sync(v7, v8);
    }
  }
}

uint64_t __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_8(uint64_t a1)
{
  size_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) updatePlanResults];
  [WeakRetained _executeUpdatePlanResults:v4];

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 currentExecutionContext];
  [v6 stop];

  id v9 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v9 stateDelegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 mapController:v8 didFinishExecutingPipelines:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = __Block_byref_object_copy__77757;
  id v35 = __Block_byref_object_dispose__77758;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_6;
  v30[3] = &unk_1E5DD0588;
  v30[4] = *(void *)(a1 + 32);
  v30[5] = &v31;
  dispatch_sync(MEMORY[0x1E4F14428], v30);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mapRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(id)v32[5] mapRect];
  BOOL v19 = v6 == v16 && v8 == v13 && v10 == v14 && v12 == v15;
  if (v19
    && (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) viewSize],
         double v21 = v20,
         double v23 = v22,
         [(id)v32[5] viewSize],
         v21 == v25)
      ? (BOOL v26 = v23 == v24)
      : (BOOL v26 = 0),
        v26))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 48) count])
    {
      id v27 = *(id **)(a1 + 32);
      long long v28 = [v27[6] keyEnumerator];
      id v29 = [v28 allObjects];
      [v27 _updateMapWithDataSources:v29 dataSourceChangeTable:*(void *)(*(void *)(a1 + 32) + 48) completion:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _updateMapWithAllDataSources:0];
  }
  _Block_object_dispose(&v31, 8);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_6(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mapView];
  uint64_t v2 = [v5 currentViewPortWithThumbnailOverscan];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)executePipeline:(id)a3 dataSourceChange:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v7 startTimerForPipeline:v9];
  double v10 = [v7 viewPort];
  double v11 = [v9 executeWithUpdatedViewPort:v10 andDataSourceChange:v8];

  [v7 stopTimerForPipeline:v9];
  return v11;
}

- (void)_updateMapWithDataSources:(id)a3 dataSourceChangeTable:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] == 1)
  {
    double v11 = [v8 objectAtIndexedSubscript:0];
    double v12 = [v8 objectAtIndexedSubscript:0];
    double v13 = [v9 objectForKey:v12];
    [(PXPlacesMapController *)self _updateMapWithDataSource:v11 dataSourceChange:v13 completion:v10];
  }
  else if ([v8 count])
  {
    dispatch_group_t v14 = dispatch_group_create();
    size_t v15 = [v8 count];
    double v16 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke;
    block[3] = &unk_1E5DB6FD0;
    block[4] = self;
    id v21 = v8;
    dispatch_group_t v22 = v14;
    id v23 = v9;
    dispatch_queue_t v17 = v14;
    dispatch_apply(v15, v16, block);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_4;
    v18[3] = &unk_1E5DD3128;
    id v19 = v10;
    dispatch_group_notify(v17, v16, v18);
  }
}

void __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = 0;
  size_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  dispatch_queue_t v17 = __Block_byref_object_copy__77757;
  uint64_t v18 = __Block_byref_object_dispose__77758;
  id v19 = 0;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_2;
  block[3] = &unk_1E5DCDEC8;
  double v12 = &v14;
  id v11 = *(id *)(a1 + 40);
  uint64_t v13 = a2;
  dispatch_sync(v4, block);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v15[5];
  id v7 = [*(id *)(a1 + 56) objectForKey:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_3;
  v8[3] = &unk_1E5DD36F8;
  id v9 = *(id *)(a1 + 48);
  [v5 _updateMapWithDataSource:v6 dataSourceChange:v7 completion:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_3(uint64_t a1)
{
}

- (void)_updateMapWithAllDataSources:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__77757;
  id v11 = __Block_byref_object_dispose__77758;
  id v12 = 0;
  dataSourcesQueue = self->_dataSourcesQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PXPlacesMapController__updateMapWithAllDataSources___block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dataSourcesQueue, v6);
  [(PXPlacesMapController *)self _updateMapWithDataSources:v8[5] dataSourceChangeTable:0 completion:v4];
  _Block_object_dispose(&v7, 8);
}

void __54__PXPlacesMapController__updateMapWithAllDataSources___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataSources];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- ($12569EB6952B655774F5ECF42E55FE6C)_ensureMinimumSize:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  v22.double x = a3.var0.var0 + a3.var1.var0 * 0.5;
  v22.double y = a3.var0.var1 + a3.var1.var1 * 0.5;
  CLLocationCoordinate2D v7 = MKCoordinateForMapPoint(v22);
  double v8 = MEMORY[0x1AD109A40](v7.latitude, v7.longitude);
  +[PXPlacesMapView canonicalMapRect:](PXPlacesMapView, "canonicalMapRect:", v6 - v8 * 500.0 * 0.5, v5 - v8 * 500.0 * 0.5, v8 * 500.0, v8 * 500.0);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  double v17 = v6;
  double v18 = v5;
  double v19 = var0;
  double v20 = var1;
  return ($12569EB6952B655774F5ECF42E55FE6C)MKMapRectUnion(*(MKMapRect *)&v17, *(MKMapRect *)&v10);
}

- (void)_setVisibleMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v12 = a3.var0.var1;
  double v13 = a3.var0.var0;
  uint64_t v15 = [(PXPlacesMapController *)self mapView];
  objc_msgSend(v15, "setVisibleMapRect:edgePadding:animated:", v5, v13, v12, var0, var1, top, left, bottom, right);

  uint64_t v16 = [(PXPlacesMapController *)self focusDelegate];

  if (v16)
  {
    if ([(PXPlacesMapController *)self mapViewIsVisible])
    {
      [(PXPlacesMapController *)self setSignalFocusWhenMapViewBecomesVisible:0];
      double v17 = [(PXPlacesMapController *)self mapView];
      double v18 = [v17 currentViewPortWithThumbnailOverscan];
      [v18 scale];
      double v20 = v19;

      id v21 = [(PXPlacesMapController *)self focusDelegate];
      objc_msgSend(v21, "mapFocusDidChange:toRect:scale:", self, v13, v12, var0, var1, v20);
    }
    else
    {
      [(PXPlacesMapController *)self setSignalFocusWhenMapViewBecomesVisible:1];
      -[PXPlacesMapController setSignalFocusMapRect:](self, "setSignalFocusMapRect:", v13, v12, var0, var1);
    }
  }
}

- (void)setVisibleMapRect:(id)a3 forRenderer:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  [a4 minimumEdgeInsets];
  -[PXPlacesMapController _setVisibleMapRect:edgePadding:animated:](self, "_setVisibleMapRect:edgePadding:animated:", v5, v9, v8, var0, var1, v11, v12, v13, v14);
}

- (void)setVisibleMapRect:(id)a3 forPipeline:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  id v11 = [a4 renderer];
  -[PXPlacesMapController setVisibleMapRect:forRenderer:animated:](self, "setVisibleMapRect:forRenderer:animated:", v11, v5, v9, v8, var0, var1);
}

- (void)_showDebugMapRect:(id)a3 color:(id)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  v19[8] = *MEMORY[0x1E4F143B8];
  v19[0] = *(void *)&a3.var0.var0;
  v19[1] = *(void *)&a3.var0.var1;
  *(double *)&v19[2] = a3.var0.var0 + a3.var1.var0;
  v19[3] = *(void *)&a3.var0.var1;
  *(double *)&v19[4] = a3.var0.var0 + a3.var1.var0;
  *(double *)&v19[5] = a3.var0.var1 + a3.var1.var1;
  v19[6] = *(void *)&a3.var0.var0;
  *(double *)&v19[7] = a3.var0.var1 + a3.var1.var1;
  double v9 = (void *)MEMORY[0x1E4F30FE8];
  id v10 = a4;
  id v11 = [v9 polygonWithPoints:v19 count:4];
  double v12 = NSString;
  double v13 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v7, *(void *)&v6];
  double v14 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&var0, *(void *)&var1];
  uint64_t v15 = [v12 stringWithFormat:@"{%@, %@}", v13, v14];

  [v11 setTitle:v15];
  uint64_t v16 = [(PXPlacesMapController *)self showDebugMapRectColors];
  double v17 = [v11 title];
  [v16 setObject:v10 forKey:v17];

  double v18 = [(PXPlacesMapController *)self mapView];
  [v18 addOverlay:v11];
}

- ($12569EB6952B655774F5ECF42E55FE6C)mapRectForNearbyQueriesFromRect:(id)a3 atScale:(double)a4 targetViewSize:(CGSize)a5
{
  +[PXPlacesMapView canonicalMapRect:](PXPlacesMapView, "canonicalMapRect:", a3.var0.var0 + a3.var1.var0 * 0.5 - a5.width * a4 * 0.5, a3.var0.var1 + a3.var1.var1 * 0.5 - a5.height * a4 * 0.5, a5.width * a4, a5.height * a4);
  result.var1.double var1 = v8;
  result.var1.double var0 = v7;
  result.var0.double var1 = v6;
  result.var0.double var0 = v5;
  return result;
}

- ($12569EB6952B655774F5ECF42E55FE6C)mapRectForGeotaggablesFromDataSource:(id)a3 renderer:(id)a4 mapViewSize:(CGSize)a5 fitAdjusted:(BOOL *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = MEMORY[0x1E4F30D98];
  double v14 = *MEMORY[0x1E4F30D98];
  double v15 = *(double *)(MEMORY[0x1E4F30D98] + 8);
  [v11 minimalEncompassingMapRect];
  if (v17 == v14 && v16 == v15)
  {
    BOOL v33 = 0;
    double v22 = *(double *)(v13 + 16);
    double v24 = *(double *)(v13 + 24);
    if (!a6) {
      goto LABEL_14;
    }
LABEL_13:
    *a6 = v33;
    goto LABEL_14;
  }
  -[PXPlacesMapController _ensureMinimumSize:](self, "_ensureMinimumSize:");
  double v14 = v19;
  double v15 = v20;
  double v22 = v21;
  double v24 = v23;
  double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == width && v25 == height) {
    goto LABEL_10;
  }
  objc_msgSend(v12, "minimumEdgeInsets", *MEMORY[0x1E4F1DB30], v25);
  uint64_t v49 = v27;
  uint64_t v50 = v28;
  uint64_t v47 = v29;
  uint64_t v48 = v30;
  _MKMapRectThatFits();
  double v31 = v52.size.width;
  double v32 = v52.size.height;
  v54.origin.double x = v14;
  v54.origin.double y = v15;
  v54.size.double width = v22;
  v54.size.double height = v24;
  if (MKMapRectContainsRect(v52, v54))
  {
LABEL_10:
    BOOL v33 = 0;
    if (!a6) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v38 = objc_msgSend(v11, "allItems", v47, v48, v49, v50);
  double v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithSet:v38];
  [v39 sortUsingComparator:&__block_literal_global_103_77773];
  id v40 = [v39 firstObject];
  v41 = v40;
  BOOL v33 = v40 != 0;
  if (v40)
  {
    [v40 coordinate];
    MKMapPoint v42 = MKMapPointForCoordinate(v51);
    +[PXPlacesMapView canonicalMapRect:](PXPlacesMapView, "canonicalMapRect:", v42.x - v31 * 0.5, v42.y - v32 * 0.5, v31, v32);
    _MKMapRectThatFits();
    double v14 = v43;
    double v15 = v44;
    double v22 = v45;
    double v24 = v46;
  }

  if (a6) {
    goto LABEL_13;
  }
LABEL_14:

  double v34 = v14;
  double v35 = v15;
  double v36 = v22;
  double v37 = v24;
  result.var1.double var1 = v37;
  result.var1.double var0 = v36;
  result.var0.double var1 = v35;
  result.var0.double var0 = v34;
  return result;
}

uint64_t __95__PXPlacesMapController_mapRectForGeotaggablesFromDataSource_renderer_mapViewSize_fitAdjusted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compareTo:a2];
}

- ($12569EB6952B655774F5ECF42E55FE6C)_mapRectForGeotaggablesFromPipeline:(id)a3 fitAdjusted:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [v6 dataSource];
  double v8 = [v6 renderer];

  double v9 = [(PXPlacesMapController *)self mapView];
  [v9 frame];
  -[PXPlacesMapController mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:](self, "mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:", v7, v8, a4, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.var1.double var1 = v23;
  result.var1.double var0 = v22;
  result.var0.double var1 = v21;
  result.var0.double var0 = v20;
  return result;
}

- (void)focusOnGeotaggablesFromPipelineImmediately:(id)a3
{
  id v4 = a3;
  char v24 = 0;
  [(PXPlacesMapController *)self _mapRectForGeotaggablesFromPipeline:v4 fitAdjusted:&v24];
  double v9 = v8;
  double v10 = v5;
  if (v8 != *MEMORY[0x1E4F30D98] || v5 != *(double *)(MEMORY[0x1E4F30D98] + 8))
  {
    double v12 = v6;
    double v13 = v7;
    if (v24)
    {
      double v14 = *MEMORY[0x1E4FB2848];
      double v15 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v17 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    else
    {
      double v18 = [v4 renderer];
      [v18 minimumEdgeInsets];
      double v14 = v19;
      double v15 = v20;
      double v17 = v21;
      double v16 = v22;
    }
    double v23 = [(PXPlacesMapController *)self mapView];
    objc_msgSend(v23, "setVisibleMapRect:edgePadding:animated:", 0, v9, v10, v12, v13, v14, v15, v17, v16);
  }
}

- (void)focusOnGeotaggablesFromPipeline:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v10 = 0;
  [(PXPlacesMapController *)self _mapRectForGeotaggablesFromPipeline:v6 fitAdjusted:&v10];
  if (v8 != *MEMORY[0x1E4F30D98] || v7 != *(double *)(MEMORY[0x1E4F30D98] + 8))
  {
    if (v10) {
      -[PXPlacesMapController _setVisibleMapRect:edgePadding:animated:](self, "_setVisibleMapRect:edgePadding:animated:", v4);
    }
    else {
      -[PXPlacesMapController setVisibleMapRect:forPipeline:animated:](self, "setVisibleMapRect:forPipeline:animated:", v6, v4);
    }
  }
}

- (id)visibleGeotaggableFromDataSource:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXPlacesMapController.m" lineNumber:452 description:@"-[PXPlacesMapController getViewableGeotags] dataSource cannot be nil"];
  }
  id v6 = [(PXPlacesMapController *)self mapView];
  [v6 visibleMapRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = objc_msgSend(v5, "findItemsInMapRect:", v8, v10, v12, v14);

  return v15;
}

- (void)runPipelines
{
}

- (void)resumePipelines:(id)a3
{
  self->_pipelineExecutionAllowed = 1;
  [(PXPlacesMapController *)self _updateMapWithAllDataSources:a3];
}

- (void)suspendPipelines
{
  self->_pipelineExecutionAllowed = 0;
}

- (void)removePipeline:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dataSource];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXPlacesMapController_removePipeline___block_invoke;
  block[3] = &unk_1E5DD32A8;
  void block[4] = self;
  id v6 = v4;
  id v28 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__77757;
  v21[4] = __Block_byref_object_dispose__77758;
  id v22 = 0;
  dataSourcesQueue = self->_dataSourcesQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__PXPlacesMapController_removePipeline___block_invoke_2;
  v18[3] = &unk_1E5DCCA20;
  double v20 = v21;
  void v18[4] = self;
  id v8 = v5;
  id v19 = v8;
  dispatch_sync(dataSourcesQueue, v18);
  pipelinesQueue = self->_pipelinesQueue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __40__PXPlacesMapController_removePipeline___block_invoke_3;
  double v14 = &unk_1E5DCCE38;
  double v16 = v21;
  id v10 = v6;
  id v15 = v10;
  double v17 = &v23;
  dispatch_sync(pipelinesQueue, &v11);
  if (*((unsigned char *)v24 + 24)) {
    -[PXPlacesMapController removeDataSource:](self, "removeDataSource:", v8, v11, v12, v13, v14);
  }

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);
}

void __40__PXPlacesMapController_removePipeline___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) executeRemoval];
  v4[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 _executeUpdatePlanResults:v3];
}

void __40__PXPlacesMapController_removePipeline___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataSourceToPipelineMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __40__PXPlacesMapController_removePipeline___block_invoke_3(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) removeObject:a1[4]];
  uint64_t result = [*(id *)(*(void *)(a1[5] + 8) + 40) count];
  if (!result) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (void)removeDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  double v32 = __Block_byref_object_copy__77757;
  BOOL v33 = __Block_byref_object_dispose__77758;
  id v34 = 0;
  dataSourcesQueue = self->_dataSourcesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXPlacesMapController_removeDataSource___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v28 = &v29;
  void block[4] = self;
  id v6 = v4;
  id v27 = v6;
  dispatch_sync(dataSourcesQueue, block);
  double v7 = (void *)v30[5];
  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    double v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    dispatch_queue_t v10 = dispatch_queue_create("map update plan results", v9);
    size_t v11 = [(id)v30[5] count];
    uint64_t v12 = dispatch_get_global_queue(25, 0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_2;
    v22[3] = &unk_1E5DB6FA8;
    uint64_t v25 = &v29;
    v22[4] = self;
    dispatch_queue_t v23 = v10;
    id v13 = v8;
    id v24 = v13;
    double v14 = v10;
    dispatch_apply(v11, v12, v22);

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_5;
    v20[3] = &unk_1E5DD32A8;
    v20[4] = self;
    id v21 = v13;
    id v15 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v20);
  }
  [v6 setDelegate:0];
  double v16 = self->_dataSourcesQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_6;
  v18[3] = &unk_1E5DD32A8;
  void v18[4] = self;
  id v19 = v6;
  id v17 = v6;
  dispatch_sync(v16, v18);

  _Block_object_dispose(&v29, 8);
}

void __42__PXPlacesMapController_removeDataSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSourceToPipelineMap];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) dataSourceToPipelineMap];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];
}

void __42__PXPlacesMapController_removeDataSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__77757;
  id v15 = __Block_byref_object_dispose__77758;
  id v16 = 0;
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_3;
  block[3] = &unk_1E5DB6F80;
  void block[5] = &v11;
  block[6] = a2;
  void block[4] = *(void *)(a1 + 56);
  dispatch_sync(v3, block);
  uint64_t v4 = [(id)v12[5] executeRemoval];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_4;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  id v5 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v6 = v4;
  dispatch_sync(v5, v7);

  _Block_object_dispose(&v11, 8);
}

uint64_t __42__PXPlacesMapController_removeDataSource___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeUpdatePlanResults:*(void *)(a1 + 40)];
}

void __42__PXPlacesMapController_removeDataSource___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSources];
  id v4 = (id)[v2 mutableCopy];

  [v4 removeObject:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)[v4 copy];
  [*(id *)(a1 + 32) setDataSources:v3];
}

void __42__PXPlacesMapController_removeDataSource___block_invoke_3(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(*(void *)(a1[4] + 8) + 40) count])
  {
    uint64_t v3 = [*(id *)(*(void *)(a1[4] + 8) + 40) objectAtIndexedSubscript:a1[6]];
    uint64_t v4 = *(void *)(a1[5] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

uint64_t __42__PXPlacesMapController_removeDataSource___block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "addObject:");
  }
  return result;
}

- (void)addPipeline:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPlacesMapController *)self cache];
  [v4 setImageCache:v5];

  id v6 = [v4 dataSource];
  dataSourcesQueue = self->_dataSourcesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PXPlacesMapController_addPipeline___block_invoke;
  block[3] = &unk_1E5DD0F30;
  void block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_sync(dataSourcesQueue, block);
  [(PXPlacesMapController *)self _updateMapWithDataSource:v9 dataSourceChange:0 completion:0];
}

void __37__PXPlacesMapController_addPipeline___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) dataSourceToPipelineMap];
  id v6 = [v2 objectForKey:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 32)];
  if (!v6)
  {
    id v6 = (id)objc_opt_new();
    uint64_t v3 = [*(id *)(a1 + 32) dataSourceToPipelineMap];
    [v3 setObject:v6 forKey:*(void *)(a1 + 40)];
  }
  [v6 addObject:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) dataSources];
  id v5 = [v4 setByAddingObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setDataSources:v5];
}

- (id)createTrackingBarButtonItem
{
  unint64_t v2 = [(PXPlacesMapController *)self mapView];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F310A0]) initWithMapView:v2];

  return v3;
}

- (PXPlacesMapView)mapView
{
  mapView = self->_mapView;
  if (!mapView)
  {
    [(PXPlacesMapController *)self loadView];
    mapView = self->_mapView;
  }
  return mapView;
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(PXPlacesMapView);
  [(PXPlacesMapView *)v3 setMapViewDelegate:self];
  [(PXPlacesMapController *)self initialCenterCoordinate];
  CLLocationDegrees latitude = v25.latitude;
  CLLocationDegrees longitude = v25.longitude;
  if (CLLocationCoordinate2DIsValid(v25))
  {
    v26.CLLocationDegrees latitude = latitude;
    v26.CLLocationDegrees longitude = longitude;
    MKMapPoint v6 = MKMapPointForCoordinate(v26);
    -[PXPlacesMapController _ensureMinimumSize:](self, "_ensureMinimumSize:", v6.x, v6.y, 1.0, 1.0);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(PXPlacesMapController *)self initialEdgePadding];
    -[PXPlacesMapView setVisibleMapRect:edgePadding:animated:](v3, "setVisibleMapRect:edgePadding:animated:", 0, v8, v10, v12, v14, v15, v16, v17, v18);
  }
  else
  {
    [(PXPlacesMapController *)self initialCoordinateRegion];
    if (v20 >= -180.0
      && v20 <= 180.0
      && v19 >= -90.0
      && v19 <= 90.0
      && v21 >= 0.0
      && v21 <= 180.0
      && v22 >= 0.0
      && v22 <= 360.0)
    {
      [(PXPlacesMapController *)self initialCoordinateRegion];
      -[PXPlacesMapView setRegion:](v3, "setRegion:");
    }
  }
  mapView = self->_mapView;
  self->_mapView = v3;
}

- (void)dealloc
{
  dataSourcesQueue = self->_dataSourcesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PXPlacesMapController_dealloc__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_sync(dataSourcesQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)PXPlacesMapController;
  [(PXPlacesMapController *)&v4 dealloc];
}

void __32__PXPlacesMapController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = objc_msgSend(*(id *)(a1 + 32), "dataSources", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setDelegate:0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (PXPlacesMapController)init
{
  v24.receiver = self;
  v24.super_class = (Class)PXPlacesMapController;
  uint64_t v2 = [(PXPlacesMapController *)&v24 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    uint64_t v4 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0];
    long long v6 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v5;

    long long v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v8 = dispatch_queue_create("dataSourcesQueue", v7);
    long long v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    dispatch_queue_t v10 = dispatch_queue_create("pipelinesQueue", v7);
    uint64_t v11 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v10;

    dispatch_queue_t v12 = dispatch_queue_create("executionContextQueue", v7);
    double v13 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    double v15 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    double v17 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v16;

    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E4F1E750];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F30D30] + 16);
    *(_OWORD *)(v2 + 168) = *MEMORY[0x1E4F30D30];
    *(_OWORD *)(v2 + 184) = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)(v2 + 200) = *MEMORY[0x1E4FB2848];
    *(_OWORD *)(v2 + 216) = v19;
    double v20 = objc_alloc_init(PXPlacesImageCache);
    double v21 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v20;

    long long v22 = *(_OWORD *)(MEMORY[0x1E4F30D98] + 16);
    *(_OWORD *)(v2 + 232) = *MEMORY[0x1E4F30D98];
    *(_OWORD *)(v2 + 248) = v22;
  }
  return (PXPlacesMapController *)v2;
}

+ ($12569EB6952B655774F5ECF42E55FE6C)mapRectWithMapViewSize:(CGSize)a3 centeredOnCoordinate:(CLLocationCoordinate2D)a4 visibleDistance:(double)a5
{
  if (*MEMORY[0x1E4F1DB30] == a3.width && *(double *)(MEMORY[0x1E4F1DB30] + 8) == a3.height)
  {
    double v7 = *MEMORY[0x1E4F30D98];
    double v8 = *(double *)(MEMORY[0x1E4F30D98] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F30D98] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F30D98] + 24);
  }
  else
  {
    uint64_t v6 = MEMORY[0x1AD109A20](a1, a2, a4.latitude, a4.longitude, a5, a5);
    MEMORY[0x1AD109A70](v6);
  }
  result.var1.double var1 = v10;
  result.var1.double var0 = v9;
  result.var0.double var1 = v8;
  result.var0.double var0 = v7;
  return result;
}

+ (void)launchMapsAtCoordinate:(CLLocationCoordinate2D)a3 withTitle:(id)a4 completionHandler:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  double v8 = (objc_class *)MEMORY[0x1E4F30FD0];
  id v9 = a5;
  id v10 = a4;
  id v12 = (id)objc_msgSend([v8 alloc], "initWithCoordinate:", latitude, longitude);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithPlacemark:v12];
  [v11 setName:v10];

  [v11 openInMapsWithLaunchOptions:0 fromScene:0 completionHandler:v9];
}

@end