@interface DataSource
- (AutocompleteContext)analyticsContext;
- (BOOL)active;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (DataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4;
- (DataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4;
- (DataSourceDelegate)delegate;
- (GEOLocation)currentLocation;
- (NSArray)keyCommands;
- (NSArray)objectsForAnalytics;
- (NSString)searchTextForAnalyics;
- (UICollectionView)collectionView;
- (UITableView)tableView;
- (double)rowHeight;
- (id)objectAtIndexPath:(id)a3;
- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)visibleCells;
- (int)flattenedIndexWithIndexPath:(id)a3;
- (int)listInteractionSessionType;
- (int)targetForDragAnalytics;
- (int64_t)presentationStyle;
- (void)addEKAnalyticsForEntry:(id)a3 tapped:(BOOL)a4;
- (void)commonInitWithUpdateLocation:(BOOL)a3;
- (void)locationManagerDidReset:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)preferredContentSizeChanged:(id)a3;
- (void)proactiveAnalyticElementsAtIndex:(int)a3 action:(int)a4 elementsBlock:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectAtIndexPath:(id)a3;
- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5;
- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5 eventValue:(id)a6;
- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5 populateSearchTapEvent:(BOOL)a6;
- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 childPlaceIndexPath:(id)a5 childPlaceObject:(id)a6 action:(int)a7 eventValue:(id)a8 populateSearchTapEvent:(BOOL)a9;
- (void)sendAnalyticsObject:(id)a3 geoMapItem:(id)a4 atIndexPath:(id)a5 action:(int)a6 eventValue:(id)a7;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableViewDidFinishReload:(id)a3;
- (void)updatePreviewDrag;
- (void)updateSavedLocation:(id)a3;
@end

@implementation DataSource

- (DataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DataSource;
  v7 = [(DataSource *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_tableView, v6);
    [(DataSource *)v8 commonInitWithUpdateLocation:v4];
  }

  return v8;
}

- (DataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DataSource;
  v7 = [(DataSource *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_collectionView, v6);
    [(DataSource *)v8 commonInitWithUpdateLocation:v4];
  }

  return v8;
}

- (void)commonInitWithUpdateLocation:(BOOL)a3
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005E9164;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
  if (a3)
  {
    self->_eventProactiveSuggestionInteractionSent = 0;
    BOOL v4 = +[NSMutableDictionary dictionary];
    proactiveItemAddDates = self->_proactiveItemAddDates;
    self->_proactiveItemAddDates = v4;

    id v6 = +[NSDate date];
    dateActive = self->_dateActive;
    self->_dateActive = v6;
  }
}

- (double)rowHeight
{
  return UITableViewAutomaticDimension;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v10 = a3;
  BOOL v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 != (id)5)
  {
    id v6 = [v10 window];
    [v6 endEditing:1];
  }
  v7 = [(DataSource *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(DataSource *)self delegate];
    [v9 scrollViewWillBeginDragging:v10];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  v9 = [(DataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(DataSource *)self delegate];
    [v11 scrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(DataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DataSource *)self delegate];
    [v6 scrollViewDidScroll:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [self->_currentListInteractionSession updateWithTableView:v7];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(DataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DataSource *)self delegate];
    [v6 scrollViewDidEndDecelerating:v7];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(DataSource *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(DataSource *)self delegate];
    [v8 scrollViewDidEndDragging:v9 willDecelerate:v4];
  }
}

- (NSString)searchTextForAnalyics
{
  return 0;
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v8 = a3;
  if (self->_currentListInteractionSession) {
    [(DataSource *)self sendCurrentListSession];
  }
  BOOL v4 = [ListInteractionSession alloc];
  char v5 = [(DataSource *)self objectsForAnalytics];
  id v6 = [(ListInteractionSession *)v4 initWithObjects:v5 forType:[(DataSource *)self listInteractionSessionType] startDate:self->_dateActive proactiveStartTimes:self->_proactiveItemAddDates];
  currentListInteractionSession = self->_currentListInteractionSession;
  self->_currentListInteractionSession = v6;

  [self->_currentListInteractionSession updateWithTableView:v8];
}

- (NSArray)objectsForAnalytics
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)objectAtIndexPath:(id)a3
{
  return 0;
}

- (int)listInteractionSessionType
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int v7 = [v6 listForDataSource:self];

  return v7;
}

- (void)selectAtIndexPath:(id)a3
{
  [self->_currentListInteractionSession updateWithSelection:a3];

  [(DataSource *)self sendCurrentListSession];
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5
{
  LOBYTE(v5) = 0;
  [(DataSource *)self sendAnalyticsForDataAtIndexPath:a3 object:a4 childPlaceIndexPath:0 childPlaceObject:0 action:*(void *)&a5 eventValue:0 populateSearchTapEvent:v5];
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5 populateSearchTapEvent:(BOOL)a6
{
  LOBYTE(v6) = a6;
  [(DataSource *)self sendAnalyticsForDataAtIndexPath:a3 object:a4 childPlaceIndexPath:0 childPlaceObject:0 action:*(void *)&a5 eventValue:0 populateSearchTapEvent:v6];
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5 eventValue:(id)a6
{
  LOBYTE(v6) = 0;
  [(DataSource *)self sendAnalyticsForDataAtIndexPath:a3 object:a4 childPlaceIndexPath:0 childPlaceObject:0 action:*(void *)&a5 eventValue:a6 populateSearchTapEvent:v6];
}

- (void)addEKAnalyticsForEntry:(id)a3 tapped:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      uint64_t v5 = sub_100018584();
      [v5 feedbackForEntry:v9 action:1];

      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 4;
    }
    if ([v9 containsKey:@"MapsSuggestionsCoreSuggestionsUniqueKey"])
    {
      int v7 = [v9 stringForKey:@"MapsSuggestionsCoreSuggestionsUniqueKey"];
      id v8 = +[SGSuggestionsService serviceForEvents];
      [v8 logEventInteractionForEventWithUniqueKey:v7 interface:16 actionType:v6];
    }
  }
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 childPlaceIndexPath:(id)a5 childPlaceObject:(id)a6 action:(int)a7 eventValue:(id)a8 populateSearchTapEvent:(BOOL)a9
{
  id v41 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = v41;
  id v20 = v18;
  if (v41)
  {
    uint64_t v21 = [(DataSource *)self flattenedIndexWithIndexPath:v41];
    id v19 = v41;
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  [(DataSource *)self selectAtIndexPath:v19];
  objc_opt_class();
  unsigned int v39 = a7;
  if (objc_opt_isKindOfClass())
  {
    v23 = [v15 _geoMapItem];
LABEL_11:
    BOOL v40 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [v15 geoMapItem];
    BOOL v40 = !self->_eventProactiveSuggestionInteractionSent;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_10:
    v24 = [v15 mapItem];
    v23 = [v24 _geoMapItem];

    goto LABEL_11;
  }
  BOOL v40 = 0;
  v23 = 0;
LABEL_12:
  v25 = [v23 _hikeAssociatedInfo];

  if (v25)
  {
    uint64_t v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v23 _muid]);

    id v20 = (id)v26;
  }
  uint64_t v27 = v22;
  if (v22 == -1) {
    BOOL v40 = !self->_eventProactiveSuggestionInteractionSent;
  }
  v28 = +[GEOAPSharedStateData sharedData];
  double Current = CFAbsoluteTimeGetCurrent();
  v30 = v16;
  if (v17)
  {
    [v28 populateWithChildPlace:v17 timestamp:[v16 row] resultIndex:Current];
  }
  else
  {
    [v28 populateWithPlace:v23 timestamp:v27 resultIndex:Current];

    v31 = v20;
    if (!a9) {
      goto LABEL_24;
    }
    v32 = [v15 searchSection];
    id v33 = [v32 sectionType];

    if (v33 == (id)2) {
      int v34 = 3;
    }
    else {
      int v34 = 2;
    }
    unsigned int v38 = v34;
    v28 = +[GEOAPSharedStateData sharedData];
    id v35 = [v23 _muid];
    v36 = [v23 _place];
    [v28 populateTapEventForResultIndex:v27 resultType:v38 businessId:v35 localSearchProviderId:[v36 localSearchProviderID] isEnrichedItem:0];
  }
  v31 = v20;
LABEL_24:
  if (v39) {
    [(DataSource *)self sendAnalyticsObject:v15 geoMapItem:v23 atIndexPath:v41 action:v39 eventValue:v31];
  }
  if (v40)
  {
    self->_eventProactiveSuggestionInteractionSent = 1;
    [(DataSource *)self proactiveAnalyticElementsAtIndex:v27 action:v39 elementsBlock:&stru_1012F1AD0];
  }
  v37 = +[GEOAPSharedStateData sharedData];
  [v37 clearPlaceCardStateData];
}

- (void)sendAnalyticsObject:(id)a3 geoMapItem:(id)a4 atIndexPath:(id)a5 action:(int)a6 eventValue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1005E9FD4;
  v34[3] = &unk_1012F1AF8;
  id v16 = v14;
  int v38 = a6;
  id v35 = v16;
  v36 = self;
  id v17 = v15;
  id v37 = v17;
  id v18 = objc_retainBlock(v34);
  id v19 = (void (**)(void, void))v18;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100103DDC;
  v32 = sub_100104778;
  id v33 = 0;
  if (v13)
  {
    ((void (*)(void *, id))v18[2])(v18, v13);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v12;
      uint64_t v21 = [v20 historyEntry];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1005EA140;
      v25[3] = &unk_1012F1B20;
      uint64_t v26 = v19;
      uint64_t v27 = &v28;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1005EA15C;
      v22[3] = &unk_1012EA8D8;
      v24 = &v28;
      v23 = v26;
      [v21 ifSearch:v25 ifRoute:0 ifPlaceDisplay:v22 ifTransitLineItem:0];
    }
    else
    {
      v19[2](v19, v29[5]);
    }
  }
  _Block_object_dispose(&v28, 8);
}

- (int)flattenedIndexWithIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (char *)[v4 row];
  if ((uint64_t)[v4 section] >= 1)
  {
    uint64_t v6 = 0;
    p_tableView = &self->_tableView;
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_tableView);
      uint64_t v5 = &v5[(void)[WeakRetained numberOfRowsInSection:v6]];

      ++v6;
    }
    while ((uint64_t)[v4 section] > v6);
  }

  return (int)v5;
}

- (void)proactiveAnalyticElementsAtIndex:(int)a3 action:(int)a4 elementsBlock:(id)a5
{
  v25 = (void (**)(id, uint64_t, uint64_t, id, double))a5;
  [(NSDate *)self->_dateActive timeIntervalSinceNow];
  double v9 = v8;
  char v10 = [self->_currentListInteractionSession proactiveItems];
  v11 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = [v10 allKeys];
  id v13 = [v12 sortedArrayUsingSelector:"compare:"];

  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    unsigned int v16 = 0;
    uint64_t v17 = *(void *)v30;
    uint64_t v27 = 0xFFFFFFFFLL;
    int v26 = a4;
    int v18 = a4 - 2007;
    do
    {
      id v19 = 0;
      uint64_t v28 = v16;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v13);
        }
        id v20 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v19);
        uint64_t v21 = [v10 objectForKeyedSubscript:v20];
        if (a3 < 0 || [v20 integerValue] != (id)a3)
        {
          id v22 = v21;
        }
        else
        {
          uint64_t v27 = (uint64_t)v19 + v28;
          id v22 = [v21 copy];

          switch(v18)
          {
            case 0:
            case 11:
              [v22 setTapped:1];
              break;
            case 1:
              [v22 setShared:1];
              break;
            case 2:
              [v22 setDeleted:1];
              break;
            case 3:
              goto LABEL_15;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
              break;
            default:
              if (v26 == 6027 || v26 == 6034) {
LABEL_15:
              }
                [v22 setEdited:1];
              break;
          }
        }
        [v11 addObject:v22];

        id v19 = (char *)v19 + 1;
      }
      while (v15 != v19);
      unsigned int v16 = v28 + v15;
      id v23 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      id v15 = v23;
    }
    while (v23);
  }
  else
  {
    uint64_t v27 = 0xFFFFFFFFLL;
  }

  id v24 = [v11 copy];
  v25[2](v25, v27, 2, v24, -v9);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[DataSource objectAtIndexPath:](self, "objectAtIndexPath:", a5, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v6 = [(DataSource *)self analyticsContext];
    int v7 = [v6 matchInfoForObject:v8];

    [v7 setShownToUser:1];
  }
}

- (AutocompleteContext)analyticsContext
{
  return 0;
}

- (void)updatePreviewDrag
{
  if (self->_currentDragSession)
  {
    previewView = self->_previewView;
    if (previewView)
    {
      id v4 = [(DragAndDropPreview *)previewView renderPreviewImage];
      [v4 dragPreview];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1005EA6B8;
      v9[3] = &unk_1012EBCE0;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      currentDragSession = self->_currentDragSession;
      id v6 = v10;
      int v7 = [(UIDragSession *)currentDragSession items];
      id v8 = [v7 firstObject];
      [v8 setPreviewProvider:v9];
    }
  }
}

- (int)targetForDragAnalytics
{
  return 0;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [MapsDragLocalContext alloc];
  double v9 = [v7 window];

  id v10 = [v9 windowScene];
  v11 = [(MapsDragLocalContext *)v8 initWithWindowScene:v10];
  [v6 setLocalContext:v11];

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = (UIDragSession *)v6;
  id v13 = v6;

  id v14 = +[MapsDragAndDropManager sharedManager];
  [v14 setDragSession:v13];

  [(DataSource *)self updatePreviewDrag];
  id v19 = [(DragAndDropMapItem *)self->_dragItem analyticsHelper];
  id v15 = +[MKMapService sharedService];

  uint64_t v16 = [(DataSource *)self targetForDragAnalytics];
  uint64_t v17 = [v19 eventValue];
  int v18 = [v19 actionDetails];
  [v15 captureUserAction:17001 onTarget:v16 eventValue:v17 placeActionDetails:v18];
}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v12 = [(DragAndDropMapItem *)self->_dragItem analyticsHelper];
  uint64_t v5 = +[MKMapService sharedService];
  uint64_t v6 = [(DataSource *)self targetForDragAnalytics];
  id v7 = [v12 eventValue];
  id v8 = [v12 actionDetails];
  [v5 captureUserAction:17003 onTarget:v6 eventValue:v7 placeActionDetails:v8];

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  dragItem = self->_dragItem;
  self->_dragItem = 0;

  v11 = +[MapsDragAndDropManager sharedManager];
  [v11 setDragSession:0];
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = +[MapsDragAndDropManager sharedManager];
  unsigned int v8 = [v7 canStartNewDrag];

  if (v8)
  {
    double v9 = [(DataSource *)self objectAtIndexPath:v6];
    id v10 = +[DragAndDropMapItem dragAndDropItemWithObject:v9];
    v11 = v10;
    if (!v10) {
      goto LABEL_6;
    }
    [v10 setObserver:self];
    objc_storeStrong((id *)&self->_dragItem, v11);
    id v12 = [v6 row];
    id v13 = [(DragAndDropMapItem *)self->_dragItem analyticsHelper];
    id v14 = [v13 actionDetails];
    [v14 setResultIndex:v12];

    id v15 = [DragAndDropPreview alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
    uint64_t v17 = [WeakRetained traitCollection];
    int v18 = [(DragAndDropPreview *)v15 initWithDragAndDropMapItem:v11 traitCollection:v17];
    previewView = self->_previewView;
    self->_previewView = v18;

    [(DragAndDropPreview *)self->_previewView setContentUpdateDelegate:self];
    uint64_t v20 = [v11 itemProviderWriting];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      id v22 = [v11 itemProvider];
      id v23 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v22];
      id v26 = v23;
      id v24 = +[NSArray arrayWithObjects:&v26 count:1];
    }
    else
    {
LABEL_6:
      id v24 = &__NSArray0__struct;
    }
  }
  else
  {
    id v24 = &__NSArray0__struct;
  }

  return v24;
}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  id v6 = [v4 theme];

  id v7 = [v6 controlBackgroundColor];
  [v5 setBackgroundColor:v7];

  return v5;
}

- (id)visibleCells
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  v3 = [WeakRetained visibleCells];

  return v3;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained reloadData];
}

- (void)updateSavedLocation:(id)a3
{
  id v4 = a3;
  id v5 = +[MKLocationManager sharedLocationManager];
  if ([v5 isAuthorizedForPreciseLocation])
  {
    id v6 = [v4 currentLocation];
  }
  else
  {
    id v6 = 0;
  }

  p_currentLocation = &self->_currentLocation;
  unsigned __int8 v8 = [(GEOLocation *)self->_currentLocation isEqual:v6];
  objc_storeStrong((id *)&self->_currentLocation, v6);
  if ((v8 & 1) == 0)
  {
    if (sub_1009DB5CC())
    {
      [(DataSource *)self locationDidUpdate];
    }
    else
    {
      double v9 = [(DataSource *)self visibleCells];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          id v13 = 0;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = *p_currentLocation;
              id v16 = v14;
              [v16 setCurrentLocation:v15];
              [v16 needsUpdate];
            }
            id v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
}

- (void)locationManagerDidReset:(id)a3
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (DataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_storeStrong((id *)&self->_proactiveItemAddDates, 0);
  objc_storeStrong((id *)&self->_dateActive, 0);

  objc_storeStrong((id *)&self->_currentListInteractionSession, 0);
}

@end