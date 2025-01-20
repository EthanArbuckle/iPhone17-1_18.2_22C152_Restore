@interface MapSelectionManager
- (BOOL)hasSelection;
- (BOOL)ignoreSelectionChanges;
- (BOOL)isMapItemSelected:(id)a3;
- (BOOL)mapShouldSelectAnnotationView:(id)a3;
- (BOOL)mapShouldSelectLabelMarker:(id)a3;
- (CustomPOIAnnotation)customLabelMarker;
- (CustomPOIsController)customPOIsController;
- (MKAnnotationView)annotationView;
- (MKMapView)mapView;
- (MapCameraController)mapCameraController;
- (MapSelectionManager)initWithCameraController:(id)a3;
- (MapSelectionManagerDelegate)delegate;
- (VKLabelMarker)labelMarker;
- (id)selectionStateIncludingCamera:(BOOL)a3 includeNotCustomLabelMarkers:(BOOL)a4;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (unint64_t)selectedTrailId;
- (void)_addGestureRecognizersForMapView:(id)a3;
- (void)_applyMapSelectionDidChange;
- (void)_clearClusterSelectionOnGesture:(id)a3;
- (void)_handleMapPinch:(id)a3;
- (void)_handleMapZoomingGesture:(id)a3;
- (void)_handleSelectingTapGesture:(id)a3;
- (void)_notifyDelegate;
- (void)_performAnalyticsForTappingOnAnnotationView:(id)a3;
- (void)_performAnalyticsForTappingOnLabelMarker:(id)a3;
- (void)_removeGestureRecognizersForMapView:(id)a3;
- (void)_selectCustomPOIAnnotation:(id)a3 camera:(id)a4 restoreRegion:(BOOL)a5 updateIfNeeded:(BOOL)a6 completion:(id)a7;
- (void)_selectLabelMarkerWithKeys:(id)a3 camera:(id)a4 animated:(BOOL)a5 restoreRegion:(BOOL)a6 updateIfNeeded:(BOOL)a7 completion:(id)a8;
- (void)_setNeedsUpdate;
- (void)clearSelection;
- (void)clearSelectionAnimated:(BOOL)a3;
- (void)clearSelectionAnimated:(BOOL)a3 updateIfNeeded:(BOOL)a4;
- (void)dealloc;
- (void)deselectTrails;
- (void)injectAndSelectSearchResult:(id)a3;
- (void)injectPreviouslySelectedSearchResult:(id)a3;
- (void)mapDidSelectAnnotationView:(id)a3;
- (void)mapDidSelectLabelMarker:(id)a3;
- (void)restoreSelectionState:(id)a3 animated:(BOOL)a4;
- (void)restoreSelectionState:(id)a3 animated:(BOOL)a4 restoreRegion:(BOOL)a5 notifyDelegate:(BOOL)a6;
- (void)resumeUpdates;
- (void)selectLabelMarker:(id)a3 animated:(BOOL)a4;
- (void)selectLabelMarker:(id)a3 animated:(BOOL)a4 updateIfNeeded:(BOOL)a5;
- (void)selectLabelMarkerWithKeys:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectLabelMarkerWithKeys:(id)a3 animated:(BOOL)a4 restoreRegion:(BOOL)a5 completion:(id)a6;
- (void)selectMapItem:(id)a3 animated:(BOOL)a4;
- (void)selectSearchResult:(id)a3 animated:(BOOL)a4;
- (void)selectTrailId:(unint64_t)a3;
- (void)selectTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5;
- (void)setAnnotationView:(id)a3;
- (void)setCustomPOIsController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreSelectionChanges:(BOOL)a3;
- (void)setLabelMarker:(id)a3;
- (void)setLabelMarker:(id)a3 updateIfNeeded:(BOOL)a4;
- (void)setMapCameraController:(id)a3;
- (void)setSelectedTrailId:(unint64_t)a3;
- (void)suspendUpdates;
@end

@implementation MapSelectionManager

- (MapSelectionManager)initWithCameraController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapSelectionManager;
  v6 = [(MapSelectionManager *)&v12 init];
  if (v6)
  {
    v7 = [v5 mapView];
    [(MapSelectionManager *)v6 _addGestureRecognizersForMapView:v7];

    objc_storeStrong((id *)&v6->_mapCameraController, a3);
    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 registerDefaults:&off_1013AEEE8];

    dispatch_group_t v9 = dispatch_group_create();
    updateGroup = v6->_updateGroup;
    v6->_updateGroup = (OS_dispatch_group *)v9;
  }
  return v6;
}

- (void)_addGestureRecognizersForMapView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 _pinchGestureRecognizer];
    [v5 addTarget:self action:"_handleMapPinch:"];

    v6 = [v4 _oneHandedZoomGestureRecognizer];
    [v6 addTarget:self action:"_handleMapZoomingGesture:"];

    v7 = [v4 _doubleTapGestureRecognizer];
    [v7 addTarget:self action:"_clearClusterSelectionOnGesture:"];

    v8 = [v4 _twoFingerTapGestureRecognizer];
    [v8 addTarget:self action:"_clearClusterSelectionOnGesture:"];

    id v9 = [v4 _selectingTapGestureRecognizer];

    [v9 addTarget:self action:"_handleSelectingTapGesture:"];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setCustomPOIsController:(id)a3
{
}

- (void)dealloc
{
  v3 = [(MapSelectionManager *)self mapView];
  [(MapSelectionManager *)self _removeGestureRecognizersForMapView:v3];

  v4.receiver = self;
  v4.super_class = (Class)MapSelectionManager;
  [(MapSelectionManager *)&v4 dealloc];
}

- (MKMapView)mapView
{
  v2 = [(MapSelectionManager *)self mapCameraController];
  v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (void)_notifyDelegate
{
  if (!atomic_fetch_add_explicit(&self->_updateCount, 0, memory_order_relaxed))
  {
    if (self->_labelMarker)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained mapSelectionManager:self selectVKLabelMarker:self->_labelMarker];
    }
    else
    {
      annotationView = self->_annotationView;
      id v4 = objc_loadWeakRetained((id *)&self->_delegate);
      id WeakRetained = v4;
      if (annotationView) {
        [v4 mapSelectionManager:self selectAnnotationView:self->_annotationView];
      }
      else {
        [v4 mapSelectionManagerClearSelection:self];
      }
    }
  }
}

- (void)_setNeedsUpdate
{
  if (!self->needsUpdate)
  {
    self->needsUpdate = 1;
    [(MapSelectionManager *)self suspendUpdates];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C4D8EC;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    updateGroup = self->_updateGroup;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100C4D8F4;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    dispatch_group_notify(updateGroup, (dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)setMapCameraController:(id)a3
{
  id v5 = (MapCameraController *)a3;
  if (self->_mapCameraController != v5)
  {
    v10 = v5;
    v6 = [(MapSelectionManager *)self mapCameraController];
    v7 = [v6 mapView];
    [(MapSelectionManager *)self _removeGestureRecognizersForMapView:v7];

    objc_storeStrong((id *)&self->_mapCameraController, a3);
    v8 = [(MapSelectionManager *)self mapCameraController];
    id v9 = [v8 mapView];
    [(MapSelectionManager *)self _addGestureRecognizersForMapView:v9];

    id v5 = v10;
  }
}

- (void)_removeGestureRecognizersForMapView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 _pinchGestureRecognizer];
    [v5 removeTarget:self action:"_handleMapPinch:"];

    v6 = [v4 _oneHandedZoomGestureRecognizer];
    [v6 removeTarget:self action:"_handleMapZoomingGesture:"];

    v7 = [v4 _doubleTapGestureRecognizer];
    [v7 removeTarget:self action:"_clearClusterSelectionOnGesture:"];

    v8 = [v4 _twoFingerTapGestureRecognizer];
    [v8 removeTarget:self action:"_clearClusterSelectionOnGesture:"];

    id v9 = [v4 _selectingTapGestureRecognizer];

    [v9 removeTarget:self action:"_handleSelectingTapGesture:"];
  }
}

- (void)setLabelMarker:(id)a3
{
}

- (void)setLabelMarker:(id)a3 updateIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (VKLabelMarker *)a3;
  p_labelMarker = &self->_labelMarker;
  if (self->_labelMarker == v7) {
    goto LABEL_14;
  }
  v18 = v7;
  id v9 = [(VKLabelMarker *)v7 featureAnnotation];
  if (v9)
  {
    v10 = [(VKLabelMarker *)*p_labelMarker featureAnnotation];

    if (v10)
    {
      v11 = [(VKLabelMarker *)v18 featureAnnotation];
      objc_super v12 = [(VKLabelMarker *)*p_labelMarker featureAnnotation];
      LODWORD(v9) = [v11 isEqual:v12];
    }
    else
    {
      LODWORD(v9) = 0;
    }
  }
  objc_storeStrong((id *)&self->_labelMarker, a3);
  annotationView = self->_annotationView;
  self->_annotationView = 0;

  if ([(VKLabelMarker *)v18 countFeatureIDs])
  {
    v14 = [(MapSelectionManager *)self mapView];
    id v15 = *(id *)[(VKLabelMarker *)v18 featureIDs];
LABEL_10:
    [v14 setSelectedVenuePoiFeatureId:v15];
    goto LABEL_12;
  }
  unsigned int v16 = [(VKLabelMarker *)v18 hasBusinessID];
  v17 = [(MapSelectionManager *)self mapView];
  v14 = v17;
  if (v16)
  {
    id v15 = [(VKLabelMarker *)v18 businessID];
    goto LABEL_10;
  }
  [v17 deselectVenuePoiFeatureId];
LABEL_12:

  self->_isCluster = [(VKLabelMarker *)v18 isCluster];
  v7 = v18;
  if (((!v4 | v9) & 1) == 0)
  {
    [(MapSelectionManager *)self _setNeedsUpdate];
    v7 = v18;
  }
LABEL_14:
}

- (void)setAnnotationView:(id)a3
{
  id v5 = (MKAnnotationView *)a3;
  if (self->_annotationView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_annotationView, a3);
    labelMarker = self->_labelMarker;
    self->_labelMarker = 0;

    v7 = [(MapSelectionManager *)self mapView];
    [v7 deselectVenuePoiFeatureId];

    [(MapSelectionManager *)self _setNeedsUpdate];
    id v5 = v8;
  }
}

- (CustomPOIAnnotation)customLabelMarker
{
  v2 = [(VKLabelMarker *)self->_labelMarker featureAnnotation];
  v3 = v2;
  if (v2 && [v2 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CustomPOIAnnotation *)v4;
}

- (BOOL)hasSelection
{
  return self->_annotationView || self->_labelMarker != 0;
}

- (void)clearSelection
{
}

- (void)clearSelectionAnimated:(BOOL)a3
{
}

- (void)clearSelectionAnimated:(BOOL)a3 updateIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = sub_100C4DFA4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v21 = 134349056;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Clearing selection", (uint8_t *)&v21, 0xCu);
  }

  v8 = [(MapSelectionManager *)self customPOIsController];
  [v8 clearInjectSearchResult];

  labelMarker = self->_labelMarker;
  BOOL v10 = labelMarker != 0;
  if (labelMarker)
  {
    v11 = [(MapSelectionManager *)self mapView];
    [v11 _deselectLabelMarkerAnimated:v5];

    objc_super v12 = [(MapSelectionManager *)self mapView];
    [v12 deselectVenuePoiFeatureId];

    v13 = self->_labelMarker;
    self->_labelMarker = 0;
  }
  if (self->_annotationView)
  {
    v14 = [(MapSelectionManager *)self mapView];
    id v15 = [(MKAnnotationView *)self->_annotationView annotation];
    [v14 deselectAnnotation:v15 animated:v5];

    annotationView = self->_annotationView;
    self->_annotationView = 0;

    BOOL v10 = 1;
  }
  v17 = [(MapSelectionManager *)self mapView];
  unsigned int v18 = [v17 _hasSelectedTransitLines];

  if (v18)
  {
    v19 = [(MapSelectionManager *)self mapView];
    [v19 _deselectTransitLineMarker];

    v20 = [(MapSelectionManager *)self mapView];
    [v20 _setApplicationState:0];

    BOOL v10 = 1;
  }
  [(MapSelectionManager *)self deselectTrails];
  if (v10 && v4) {
    [(MapSelectionManager *)self _setNeedsUpdate];
  }
}

- (void)selectLabelMarker:(id)a3 animated:(BOOL)a4
{
}

- (void)selectLabelMarker:(id)a3 animated:(BOOL)a4 updateIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = (VKLabelMarker *)a3;
  id v9 = sub_100C4DFA4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 134349314;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Selecting label marker: %@", (uint8_t *)&v12, 0x16u);
  }

  if (self->_labelMarker != v8)
  {
    BOOL v10 = [(VKLabelMarker *)v8 featureAnnotation];
    if (v10)
    {

LABEL_7:
      [(MapSelectionManager *)self setLabelMarker:v8 updateIfNeeded:v5];
      v11 = [(MapSelectionManager *)self mapView];
      [v11 _selectLabelMarker:v8 animated:v6];

      goto LABEL_8;
    }
    if ([(VKLabelMarker *)v8 isSelectable]) {
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)selectSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = sub_100C4DFA4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 134349314;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Selecting search result: %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = [(MapSelectionManager *)self delegate];
  id v9 = [v8 searchPinsManagerForMapSelectionManager:self];

  [v9 selectAndShowSearchResult:v6 animated:v4];
}

- (void)selectTrailId:(unint64_t)a3
{
  BOOL v5 = sub_100C4DFA4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349312;
    v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trail ID: %llu", (uint8_t *)&v7, 0x16u);
  }

  [(MapSelectionManager *)self setSelectedTrailId:a3];
  id v6 = [(MapSelectionManager *)self mapView];
  [v6 setSelectedTrailId:a3];
}

- (void)selectTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = sub_100C4DFA4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 134349826;
    id v13 = self;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trail with Id: %llu, name: %@, locale: %@", (uint8_t *)&v12, 0x2Au);
  }

  [(MapSelectionManager *)self setSelectedTrailId:a3];
  v11 = [(MapSelectionManager *)self mapView];
  [v11 setSelectedTrailWithId:a3 name:v8 locale:v9];
}

- (void)deselectTrails
{
  unint64_t v3 = [(MapSelectionManager *)self selectedTrailId];
  BOOL v4 = sub_100C4DFA4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v6 = 134349312;
      int v7 = self;
      __int16 v8 = 2048;
      unint64_t v9 = [(MapSelectionManager *)self selectedTrailId];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deselecting trail with Id: %llu", (uint8_t *)&v6, 0x16u);
    }

    [(MapSelectionManager *)self setSelectedTrailId:0];
    BOOL v4 = [(MapSelectionManager *)self mapView];
    [v4 deselectTrails];
  }
  else if (v5)
  {
    int v6 = 134349056;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] No selected trails to deselect.", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)isMapItemSelected:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    int v6 = [v4 identifier];
    int v7 = [(VKLabelMarker *)self->_labelMarker identifier];
    if (v6 && ([v6 isEqual:v7] & 1) != 0)
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      unint64_t v9 = [(VKLabelMarker *)self->_labelMarker _maps_mapItem];
      unsigned __int8 v8 = [v5 isEqual:v9];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)selectMapItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = sub_100C4DFA4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 134349314;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Selecting map item: %@", (uint8_t *)&v12, 0x16u);
  }

  unsigned __int8 v8 = [[PersonalizedMapItemKey alloc] initWithMapItem:v6];
  unint64_t v9 = +[NSSet setWithObject:v8];
  if ([v6 _hasMUID] && objc_msgSend(v6, "_muid"))
  {
    unint64_t v10 = -[PersonalizedMapItemMUIDKey initWithMUID:]([PersonalizedMapItemMUIDKey alloc], "initWithMUID:", [v6 _muid]);
    uint64_t v11 = [v9 setByAddingObject:v10];

    unint64_t v9 = (void *)v11;
  }
  [(MapSelectionManager *)self selectLabelMarkerWithKeys:v9 animated:v4 completion:0];
}

- (void)selectLabelMarkerWithKeys:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)selectLabelMarkerWithKeys:(id)a3 animated:(BOOL)a4 restoreRegion:(BOOL)a5 completion:(id)a6
{
}

- (void)injectAndSelectSearchResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MapSelectionManager *)self customPOIsController];
  id v6 = [v5 injectSearchResultIfNeeded:v4];

  [(MapSelectionManager *)self _selectCustomPOIAnnotation:v6 camera:0 restoreRegion:1 updateIfNeeded:1 completion:0];
}

- (void)injectPreviouslySelectedSearchResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MapSelectionManager *)self customPOIsController];
  id v10 = [v5 injectSearchResultIfNeeded:v4];

  id v6 = [(MapSelectionManager *)self mapView];
  int v7 = [v6 _labelMarkerForCustomFeatureAnnotation:v10];

  unsigned __int8 v8 = [(MapSelectionManager *)self mapView];
  unint64_t v9 = [v8 _mapLayer];
  [v9 setPreviouslySelectedLabelMarker:v7];
}

- (void)_selectLabelMarkerWithKeys:(id)a3 camera:(id)a4 animated:(BOOL)a5 restoreRegion:(BOOL)a6 updateIfNeeded:(BOOL)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  __int16 v16 = sub_100C4DFA4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349570;
    v25 = self;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Selecting label marker with keys: %@, camera: %@", buf, 0x20u);
  }

  if (v13 && [v13 count])
  {
    id v17 = [(MapSelectionManager *)self customPOIsController];

    if (v17)
    {
      [(MapSelectionManager *)self suspendUpdates];
      __int16 v18 = [(MapSelectionManager *)self customPOIsController];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100C4EB0C;
      v19[3] = &unk_10131C610;
      v19[4] = self;
      id v21 = v15;
      id v20 = v14;
      BOOL v22 = a6;
      BOOL v23 = a7;
      [v18 customFeatureForKeys:v13 completion:v19];
    }
  }
  else if (v15)
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

- (void)_selectCustomPOIAnnotation:(id)a3 camera:(id)a4 restoreRegion:(BOOL)a5 updateIfNeeded:(BOOL)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a7;
  id v14 = a3;
  id v15 = [(MapSelectionManager *)self mapView];
  __int16 v16 = [v15 _labelMarkerForCustomFeatureAnnotation:v14];

  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_100C4ED08;
  __int16 v28 = &unk_1012F7A50;
  id v17 = v16;
  id v29 = v17;
  v30 = self;
  BOOL v32 = a6;
  id v18 = v13;
  id v31 = v18;
  id v19 = objc_retainBlock(&v25);
  ((void (*)(void ***, uint64_t, uint64_t, uint64_t))v19[2])(v19, v20, v21, v22);
  if (v9)
  {
    if (v12)
    {
      -[MapCameraController restoreRegionForMapSelectionWithCamera:completion:](self->_mapCameraController, "restoreRegionForMapSelectionWithCamera:completion:", v12, 0, v25, v26, v27, v28, v29, v30);
    }
    else if (v17)
    {
      mapCameraController = self->_mapCameraController;
      v24 = [(MapSelectionManager *)self mapView];
      [v24 _edgeInsets];
      -[MapCameraController restoreRegionForMapSelectionForLabelMarker:edgeInsets:completion:](mapCameraController, "restoreRegionForMapSelectionForLabelMarker:edgeInsets:completion:", v17, 0);
    }
  }
}

- (id)selectionStateIncludingCamera:(BOOL)a3 includeNotCustomLabelMarkers:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = objc_opt_new();
  unsigned __int8 v8 = [(MapSelectionManager *)self mapView];
  BOOL v9 = [v8 _selectedLabelMarker];

  if (!v9)
  {
    id v10 = [(MapSelectionManager *)self mapView];
    uint64_t v11 = [v10 selectedAnnotations];
    [v7 setSelectedAnnotations:v11];
    goto LABEL_9;
  }
  if (!v4)
  {
    id v12 = [v9 featureAnnotation];
    id v10 = v12;
    if (!v12 || ![v12 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
LABEL_10:

      if (!v5) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v11 = [v10 keys];
    [v7 setCustomPOIKeys:v11];
LABEL_9:

    goto LABEL_10;
  }
  [v7 setLabelMarker:v9];
  if (v5)
  {
LABEL_11:
    id v13 = [(MapSelectionManager *)self mapView];
    id v14 = [v13 camera];
    [v7 setCamera:v14];
  }
LABEL_12:

  return v7;
}

- (void)restoreSelectionState:(id)a3 animated:(BOOL)a4
{
}

- (void)restoreSelectionState:(id)a3 animated:(BOOL)a4 restoreRegion:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = sub_100C4DFA4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v28 = 134349314;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Restoring selection state: %@", (uint8_t *)&v28, 0x16u);
  }

  if (v10)
  {
    id v12 = [v10 camera];
    id v13 = v12;
    if (v12 && (([v12 centerCoordinate], v15 < -180.0) || v15 > 180.0 || v14 < -90.0 || v14 > 90.0))
    {

      id v13 = 0;
    }
    else
    {
      __int16 v16 = [v10 customPOIKeys];

      if (v16)
      {
        id v17 = [v10 customPOIKeys];
        [(MapSelectionManager *)self _selectLabelMarkerWithKeys:v17 camera:v13 animated:v8 restoreRegion:v7 updateIfNeeded:v6 completion:0];
      }
      else
      {
        id v18 = [v10 selectedAnnotations];
        id v19 = [v18 count];

        if (v19)
        {
          uint64_t v20 = [(MapSelectionManager *)self mapView];
          uint64_t v21 = [v10 selectedAnnotations];
          [v20 setSelectedAnnotations:v21];

          if (v13 && v7) {
            [(MapCameraController *)self->_mapCameraController restoreRegionForMapSelectionWithCamera:v13 completion:0];
          }
        }
        else
        {
          uint64_t v22 = [v10 labelMarker];

          if (v22)
          {
            BOOL v23 = [v10 labelMarker];
            unsigned int v24 = [v23 isCluster];

            if (v24)
            {
              [(MapSelectionManager *)self clearSelectionAnimated:0 updateIfNeeded:v6];
            }
            else
            {
              id v27 = [v10 labelMarker];
              [(MapSelectionManager *)self selectLabelMarker:v27 animated:v8 updateIfNeeded:v6];
            }
          }
          else
          {
            v25 = [(MapSelectionManager *)self delegate];
            uint64_t v26 = [v25 searchPinsManagerForMapSelectionManager:self];

            [v26 clearLinkedPlacesAndPolygon];
          }
        }
      }
    }
  }
}

- (BOOL)mapShouldSelectLabelMarker:(id)a3
{
  id v4 = a3;
  if ([v4 isRouteAnnotation])
  {
    BOOL v5 = [v4 _maps_selectableRouteAnnotations];
    if (![v5 count])
    {

LABEL_10:
      BOOL v7 = sub_100C4DFA4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 134349056;
        __int16 v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Suppressing label marker selection (no selectable route annotations or empty cluster)", (uint8_t *)&v15, 0xCu);
      }
      LOBYTE(v8) = 0;
      goto LABEL_21;
    }
    if ([v4 isCluster])
    {
      id v6 = [v4 clusterFeatureCount];

      if (!v6) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  else if (([v4 isCluster] & 1) != 0 && !objc_msgSend(v4, "clusterFeatureCount"))
  {
    goto LABEL_10;
  }
  BOOL v9 = [(MapSelectionManager *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(MapSelectionManager *)self delegate];
    unsigned int v8 = [v11 mapSelectionManager:self shouldSelectVKLabelMarker:v4];
  }
  else
  {
    unsigned int v8 = 1;
  }
  BOOL v7 = sub_100C4DFA4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v12 = @"NO";
    if (v8) {
      id v12 = @"YES";
    }
    id v13 = v12;
    int v15 = 134349570;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Should select label marker %@: %@", (uint8_t *)&v15, 0x20u);
  }
LABEL_21:

  return v8;
}

- (void)mapDidSelectLabelMarker:(id)a3
{
  BOOL v5 = (VKLabelMarker *)a3;
  id v6 = sub_100C4DFA4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    double v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Map did select label marker: %@", buf, 0x16u);
  }

  labelMarker = self->_labelMarker;
  if (labelMarker && labelMarker != v5)
  {
    unsigned int v8 = [(VKLabelMarker *)labelMarker featureAnnotation];
    if ([v8 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
      BOOL v9 = [v8 searchResult];
      if (v9)
      {
        char v10 = [(MapSelectionManager *)self delegate];
        uint64_t v11 = [v10 searchPinsManagerForMapSelectionManager:self];

        [v11 mapSelectionManagerDidDeselectSearchResult:v9];
      }
    }
  }
  if (!self->_ignoreSelectionChanges)
  {
    if (!self->_mapSelectionChangePending)
    {
      self->_mapSelectionChangePending = 1;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100C4F560;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    objc_storeStrong((id *)&self->_pendingSelectedLabelMarker, a3);
    [(MapSelectionManager *)self _performAnalyticsForTappingOnLabelMarker:v5];
  }
}

- (BOOL)mapShouldSelectAnnotationView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MapSelectionManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(MapSelectionManager *)self delegate];
    unsigned int v8 = [v7 mapSelectionManager:self shouldSelectAnnotationView:v4];
  }
  else
  {
    unsigned int v8 = 1;
  }
  BOOL v9 = sub_100C4DFA4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = @"NO";
    if (v8) {
      char v10 = @"YES";
    }
    uint64_t v11 = v10;
    int v13 = 134349570;
    double v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Should select annotationView %@: %@", (uint8_t *)&v13, 0x20u);
  }
  return v8;
}

- (void)mapDidSelectAnnotationView:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_ignoreSelectionChanges)
  {
    if (v4 && ![(MapSelectionManager *)self mapShouldSelectAnnotationView:v4])
    {
      BOOL v7 = sub_100C4DFA4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 134349314;
        id v12 = self;
        __int16 v13 = 2112;
        double v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Will reverse annotation view selection: %@", (uint8_t *)&v11, 0x16u);
      }

      BOOL ignoreSelectionChanges = self->_ignoreSelectionChanges;
      [(MapSelectionManager *)self setIgnoreSelectionChanges:1];
      BOOL v9 = [(MapSelectionManager *)self mapView];
      char v10 = [v5 annotation];
      [v9 deselectAnnotation:v10 animated:0];

      [(MapSelectionManager *)self setIgnoreSelectionChanges:ignoreSelectionChanges];
    }
    else
    {
      char v6 = sub_100C4DFA4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v11 = 134349314;
        id v12 = self;
        __int16 v13 = 2112;
        double v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Map did select annotation view: %@", (uint8_t *)&v11, 0x16u);
      }

      [(MapSelectionManager *)self setAnnotationView:v5];
      [(MapSelectionManager *)self _performAnalyticsForTappingOnAnnotationView:v5];
    }
  }
}

- (void)_performAnalyticsForTappingOnLabelMarker:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100C4F90C;
    v6[3] = &unk_1012E5D58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_performAnalyticsForTappingOnAnnotationView:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100C4FB24;
    v6[3] = &unk_1012E5D58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_applyMapSelectionDidChange
{
  self->_mapSelectionChangePending = 0;
  pendingSelectedLabelMarker = self->_pendingSelectedLabelMarker;
  self->_pendingSelectedLabelMarker = 0;
  id v4 = pendingSelectedLabelMarker;

  [(MapSelectionManager *)self setLabelMarker:v4];
}

- (void)_handleMapPinch:(id)a3
{
}

- (void)_handleMapZoomingGesture:(id)a3
{
  id v4 = a3;
  labelMarker = self->_labelMarker;
  if (labelMarker)
  {
    uint64_t v22 = v4;
    if (![(VKLabelMarker *)labelMarker isCluster])
    {
      char v10 = [(VKLabelMarker *)self->_labelMarker featureAnnotation];
      int v11 = v10;
      if (v10 && [v10 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
      {
        id v12 = v11;
        __int16 v13 = [(MapSelectionManager *)self mapView];
        id v14 = [v13 _displayedSearchResultsType];

        __int16 v15 = [v12 styleAttributes];
        id v16 = [v15 styleAttributes];
        unsigned int v17 = [v16 isLabelPOI];

        if (v17 && v14 == (id)2)
        {
          if ([v22 state] == (id)1)
          {
            id v18 = +[NSUserDefaults standardUserDefaults];
            [v18 floatForKey:@"__personalizedMapsZoomAmountToClearClusterSelection"];
            self->_clusterDeselectZoomThreshold = v19;
          }
          if ([v22 state] == (id)2)
          {
            [v22 scale];
            if (v20 == 0.0) {
              double v20 = 1.0;
            }
            if (v20 < 1.0) {
              double v20 = 1.0 / v20;
            }
            if (v20 > 1.29999995)
            {
              id WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);
              [WeakRetained clearSearchResultStyle];
            }
          }
        }
      }
      goto LABEL_27;
    }
    if ([v22 state] == (id)1)
    {
      char v6 = +[NSUserDefaults standardUserDefaults];
      [v6 floatForKey:@"__personalizedMapsZoomAmountToClearClusterSelection"];
      self->_clusterDeselectZoomThreshold = v7;
    }
    id v8 = [v22 state];
    id v4 = v22;
    if (v8 == (id)2)
    {
      [v22 scale];
      id v4 = v22;
      if (v9 == 0.0) {
        double v9 = 1.0;
      }
      if (v9 < 1.0) {
        double v9 = 1.0 / v9;
      }
      if (v9 > self->_clusterDeselectZoomThreshold)
      {
        [(MapSelectionManager *)self clearSelection];
LABEL_27:
        id v4 = v22;
      }
    }
  }
}

- (void)_clearClusterSelectionOnGesture:(id)a3
{
  id v4 = a3;
  if (self->_labelMarker)
  {
    if (self->_isCluster)
    {
      id v6 = v4;
      BOOL v5 = [v4 state] == (id)3;
      id v4 = v6;
      if (v5)
      {
        [(MapSelectionManager *)self clearSelection];
        id v4 = v6;
      }
    }
  }
}

- (void)_handleSelectingTapGesture:(id)a3
{
  self->_selectionFromTap = 1;
}

- (void)suspendUpdates
{
}

- (void)resumeUpdates
{
}

- (int)currentUITargetForAnalytics
{
  unint64_t v3 = [(MapSelectionManager *)self delegate];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(MapSelectionManager *)self delegate];
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
  unint64_t v3 = [(MapSelectionManager *)self delegate];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(MapSelectionManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentMapViewTargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (MapSelectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapSelectionManagerDelegate *)WeakRetained;
}

- (MapCameraController)mapCameraController
{
  return self->_mapCameraController;
}

- (CustomPOIsController)customPOIsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);

  return (CustomPOIsController *)WeakRetained;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (MKAnnotationView)annotationView
{
  return self->_annotationView;
}

- (BOOL)ignoreSelectionChanges
{
  return self->_ignoreSelectionChanges;
}

- (void)setIgnoreSelectionChanges:(BOOL)a3
{
  self->_BOOL ignoreSelectionChanges = a3;
}

- (unint64_t)selectedTrailId
{
  return self->_selectedTrailId;
}

- (void)setSelectedTrailId:(unint64_t)a3
{
  self->_selectedTrailId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationView, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_destroyWeak((id *)&self->_customPOIsController);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateGroup, 0);

  objc_storeStrong((id *)&self->_pendingSelectedLabelMarker, 0);
}

@end