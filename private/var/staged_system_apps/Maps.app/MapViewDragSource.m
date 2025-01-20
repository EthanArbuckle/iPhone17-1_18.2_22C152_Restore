@interface MapViewDragSource
- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)_isValidLabelMarkerForDragging:(id)a3;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)shouldBeginDragFromLocation:(CGPoint)a3;
- (MKMapView)mapView;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (void)dragAndDropPreviewDidUpdate:(id)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)reset;
- (void)setMapView:(id)a3;
- (void)updatePreviewDrag;
@end

@implementation MapViewDragSource

- (BOOL)shouldBeginDragFromLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = -[MKMapView hitTest:withEvent:](self->_mapView, "hitTest:withEvent:", 0);
  unsigned int v7 = -[MKMapView calloutViewContainsPoint:](self->_mapView, "calloutViewContainsPoint:", x, y);
  self->_draggingCallout = 0;
  if (!v7)
  {
    if (![v6 isDescendantOfView:self->_mapView])
    {
LABEL_21:
      BOOL v17 = 0;
      goto LABEL_22;
    }
    -[MKMapView _annotationAtPoint:avoidCurrent:](self->_mapView, "_annotationAtPoint:avoidCurrent:", 0, x, y);
    v14 = (SearchResult *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [(SearchResult *)v14 annotation];

      v14 = (SearchResult *)v15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      searchResult = self->_searchResult;
      self->_searchResult = v14;
    }
    else
    {
      v18 = -[MKMapView _labelMarkerAtPoint:](self->_mapView, "_labelMarkerAtPoint:", x, y);
      if (![(MapViewDragSource *)self _isValidLabelMarkerForDragging:v18])
      {

LABEL_20:
        goto LABEL_21;
      }
      labelMarker = self->_labelMarker;
      self->_labelMarker = (VKLabelMarker *)v18;
    }
    BOOL v17 = 1;
    goto LABEL_22;
  }
  v8 = [(MKMapView *)self->_mapView selectedAnnotations];
  id v9 = [v8 count];

  if (v9 != (id)1)
  {
LABEL_13:
    v14 = [(MKMapView *)self->_mapView _selectedLabelMarker];
    if ([(MapViewDragSource *)self _isValidLabelMarkerForDragging:v14])
    {
      v13 = self->_labelMarker;
      self->_labelMarker = (VKLabelMarker *)v14;
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  v10 = [(MKMapView *)self->_mapView selectedAnnotations];
  v11 = [v10 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [(SearchResult *)v11 annotation];

    v11 = (SearchResult *)v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_13;
  }
  v13 = self->_searchResult;
  self->_searchResult = v11;
LABEL_15:

  BOOL v17 = 1;
  self->_draggingCallout = 1;
LABEL_22:

  return v17;
}

- (BOOL)_isValidLabelMarkerForDragging:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3
    || ([v3 isTransitLine] & 1) != 0
    || ([v4 isFlyoverTour] & 1) != 0
    || ([v4 isTrafficIncident] & 1) != 0
    || ([v4 isOneWayArrow] & 1) != 0
    || ([v4 isRouteAnnotation] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned int v7 = [v4 featureType];
    if (v7 <= 6) {
      unsigned int v5 = (0x68u >> v7) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MapsDragAndDropManager sharedManager];
  unsigned int v9 = [v8 canStartNewDrag];

  if (v9)
  {
    v10 = [v6 view];
    [v7 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    if (-[MapViewDragSource shouldBeginDragFromLocation:](self, "shouldBeginDragFromLocation:", v12, v14))
    {
      if (self->_labelMarker)
      {
        +[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:");
        uint64_t v15 = (DragAndDropMapItem *)objc_claimAutoreleasedReturnValue();
        dragItem = self->_dragItem;
        self->_dragItem = v15;

        [(VKLabelMarker *)self->_labelMarker coordinate];
        CLLocationDegrees v18 = v17;
        labelMarker = self->_labelMarker;
LABEL_7:
        [labelMarker coordinate];
        CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v18, v23);
        [(DragAndDropMapItem *)self->_dragItem setSourceView:self->_mapView];
        -[DragAndDropMapItem setSourceCoordinate:](self->_dragItem, "setSourceCoordinate:", v24.latitude, v24.longitude);
        v25 = [DragAndDropPreview alloc];
        v26 = self->_dragItem;
        v27 = [(MKMapView *)self->_mapView traitCollection];
        v28 = [(DragAndDropPreview *)v25 initWithDragAndDropMapItem:v26 traitCollection:v27];
        previewView = self->_previewView;
        self->_previewView = v28;

        [(DragAndDropPreview *)self->_previewView setContentUpdateDelegate:self];
        v30 = [(DragAndDropMapItem *)self->_dragItem itemProvider];
        id v31 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v30];
        [v31 setLocalObject:self->_dragItem];
        id v34 = v31;
        v32 = +[NSArray arrayWithObjects:&v34 count:1];

        goto LABEL_9;
      }
      if (self->_searchResult)
      {
        +[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:");
        v20 = (DragAndDropMapItem *)objc_claimAutoreleasedReturnValue();
        v21 = self->_dragItem;
        self->_dragItem = v20;

        [(SearchResult *)self->_searchResult coordinate];
        CLLocationDegrees v18 = v22;
        labelMarker = self->_searchResult;
        goto LABEL_7;
      }
    }
  }
  v32 = &__NSArray0__struct;
LABEL_9:

  return v32;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  previewView = self->_previewView;
  id v7 = a4;
  v8 = [(DragAndDropPreview *)previewView renderPreviewImage];
  unsigned int v9 = [v7 localObject];

  mapView = self->_mapView;
  [v9 sourceCoordinate];
  -[MKMapView convertCoordinate:toPointToView:](mapView, "convertCoordinate:toPointToView:", self->_mapView);
  double v12 = v11;
  double v14 = v13;
  id v15 = objc_alloc((Class)UIDragPreviewTarget);
  v16 = [v9 sourceView];
  id v17 = [v15 initWithContainer:v16 center:v12];

  CLLocationDegrees v18 = [v8 targetedDragPreviewWithTarget:v17];
  objc_storeStrong((id *)&self->_liftPreview, v18);

  return v18;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a4;
  id v6 = [MapsDragLocalContext alloc];
  id v7 = [(MapViewDragSource *)self mapView];
  v8 = [v7 window];
  unsigned int v9 = [v8 windowScene];
  v10 = [(MapsDragLocalContext *)v6 initWithWindowScene:v9];
  [v5 setLocalContext:v10];

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = (UIDragSession *)v5;
  id v12 = v5;

  double v13 = +[MapsDragAndDropManager sharedManager];
  [v13 setDragSession:v12];

  [(MapViewDragSource *)self updatePreviewDrag];
  [(VKLabelMarker *)self->_labelMarker setIsDragged:1];
  id v17 = [(DragAndDropMapItem *)self->_dragItem analyticsHelper];
  double v14 = +[MKMapService sharedService];

  id v15 = [v17 eventValue];
  v16 = [v17 actionDetails];
  [v14 captureUserAction:17001 onTarget:1 eventValue:v15 placeActionDetails:v16];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  v8 = +[MapsDragAndDropManager sharedManager];
  [v8 setDragSession:0];

  [(VKLabelMarker *)self->_labelMarker setIsDragged:0];
  id v13 = [(DragAndDropMapItem *)self->_dragItem analyticsHelper];
  if (a5 == 2)
  {
    uint64_t v9 = 17003;
  }
  else
  {
    if (a5) {
      goto LABEL_6;
    }
    uint64_t v9 = 17002;
  }
  v10 = +[MKMapService sharedService];
  double v11 = [v13 eventValue];
  id v12 = [v13 actionDetails];
  [v10 captureUserAction:v9 onTarget:1 eventValue:v11 placeActionDetails:v12];

LABEL_6:
  [(MapViewDragSource *)self reset];
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a5;
  v8 = [a4 localObject];
  mapView = self->_mapView;
  [v8 sourceCoordinate];
  -[MKMapView convertCoordinate:toPointToView:](mapView, "convertCoordinate:toPointToView:", self->_mapView);
  double v11 = v10;
  double v13 = v12;
  double v14 = [v8 sourceView];
  [v14 frame];
  v21.double x = v11;
  v21.double y = v13;
  LODWORD(mapView) = CGRectContainsPoint(v22, v21);

  if (mapView)
  {
    id v15 = objc_alloc((Class)UIDragPreviewTarget);
    v16 = [v8 sourceView];
    id v17 = [v15 initWithContainer:v16 center:v11, v13];

    CLLocationDegrees v18 = [v7 retargetedPreviewWithTarget:v17];
  }
  else
  {
    CLLocationDegrees v18 = 0;
  }

  return v18;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 0;
}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
  v4 = [a3 item];
  dragItem = self->_dragItem;

  if (v4 == dragItem)
  {
    [(MapViewDragSource *)self updatePreviewDrag];
  }
}

- (void)updatePreviewDrag
{
  if (self->_currentDragSession && (previewView = self->_previewView) != 0)
  {
    v4 = [(DragAndDropPreview *)previewView renderPreviewImage];
    [v4 dragPreview];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A1D9B4;
    v12[3] = &unk_1012EBCE0;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    currentDragSession = self->_currentDragSession;
    id v6 = v13;
    id v7 = [(UIDragSession *)currentDragSession items];
    v8 = [v7 firstObject];
    [v8 setPreviewProvider:v12];
  }
  else if (self->_liftPreview)
  {
    id v11 = [(DragAndDropPreview *)self->_previewView renderPreviewImage];
    uint64_t v9 = [(UITargetedDragPreview *)self->_liftPreview view];
    double v10 = [v11 image];
    [v9 setImage:v10];
  }
}

- (void)reset
{
  [(VKLabelMarker *)self->_labelMarker setIsDragged:0];
  labelMarker = self->_labelMarker;
  self->_labelMarker = 0;

  searchResult = self->_searchResult;
  self->_searchResult = 0;

  previewView = self->_previewView;
  self->_previewView = 0;

  liftPreview = self->_liftPreview;
  self->_liftPreview = 0;

  dragItem = self->_dragItem;
  self->_dragItem = 0;

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  id v9 = +[MapsDragAndDropManager sharedManager];
  [v9 setDragSession:0];
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_storeStrong((id *)&self->_liftPreview, 0);
  objc_storeStrong((id *)&self->_previewView, 0);

  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end