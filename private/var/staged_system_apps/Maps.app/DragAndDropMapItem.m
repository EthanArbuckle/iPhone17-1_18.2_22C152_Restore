@interface DragAndDropMapItem
+ (id)dragAndDropItemWithObject:(id)a3;
+ (id)writableTypeIdentifiersForItemProvider;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (CLLocationCoordinate2D)sourceCoordinate;
- (DragAndDropMapItem)init;
- (DragAndDropMapItem)initWithAddress:(id)a3;
- (DragAndDropMapItem)initWithLabelMarker:(id)a3;
- (DragAndDropMapItem)initWithMapItem:(id)a3;
- (DragAndDropMapItem)initWithPersonalizedItem:(id)a3;
- (DragAndDropMapItem)initWithRecentContact:(id)a3;
- (DragAndDropMapItemObserver)observer;
- (MKMapItem)draggedMapItem;
- (MKMapItem)originalMapItem;
- (MKMapItem)resolvedMapItem;
- (MapsAnalyticsHelper)analyticsHelper;
- (NSItemProvider)itemProvider;
- (NSItemProviderWriting)itemProviderWriting;
- (UIView)sourceView;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)presentationObject;
- (id)traitsForMapItemResolver:(id)a3;
- (void)_didResolveMapItem:(id)a3;
- (void)_resolveMapItem;
- (void)setObserver:(id)a3;
- (void)setSourceCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSourceView:(id)a3;
@end

@implementation DragAndDropMapItem

+ (id)dragAndDropItemWithObject:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 autocompleteObject];

    id v4 = (id)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v4;
    id v8 = objc_alloc((Class)a1);
    v9 = [v4 mapItem];

    id v6 = [v8 initWithMapItem:v9];
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v4;
      id v14 = [objc_alloc((Class)a1) initWithAddress:v4];
LABEL_17:
      id v6 = v14;
      goto LABEL_33;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = sub_100103ADC;
      v26 = sub_1001045F8;
      id v27 = 0;
      id v4 = v4;
      v15 = [v4 historyEntry];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10036273C;
      v21[3] = &unk_1012E5E70;
      v21[4] = &v22;
      v21[5] = a1;
      [v15 ifSearch:&stru_1012E5E08 ifRoute:&stru_1012E5E48 ifPlaceDisplay:v21 ifTransitLineItem:&stru_1012E5EB0];

      id v6 = (id)v23[5];
      _Block_object_dispose(&v22, 8);

      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [objc_alloc((Class)a1) initWithRecentContact:v4];
LABEL_22:
      id v6 = v16;
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v4;
      v17 = [v4 geoMapItem];

      if (!v17) {
        goto LABEL_32;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v4;
        id v14 = [objc_alloc((Class)a1) initWithLabelMarker:v4];
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [objc_alloc((Class)a1) initWithMapItem:v4];
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_5:
        id v6 = 0;
        goto LABEL_6;
      }
      id v4 = v4;
      v20 = [v4 geoMapItem];

      if (!v20) {
        goto LABEL_32;
      }
    }
    id v18 = objc_alloc((Class)MKMapItem);
    v19 = [v4 geoMapItem];
    id v12 = [v18 initWithGeoMapItem:v19 isPlaceHolderPlace:1];

    id v13 = objc_alloc((Class)a1);
    goto LABEL_14;
  }
  id v4 = v4;
  v10 = [v4 mapItem];

  if (!v10)
  {
LABEL_32:
    id v6 = 0;
    goto LABEL_33;
  }
  id v11 = objc_alloc((Class)a1);
  id v12 = [v4 mapItem];
  id v13 = v11;
LABEL_14:
  id v6 = [v13 initWithMapItem:v12];

LABEL_33:
LABEL_6:

  return v6;
}

- (DragAndDropMapItem)init
{
  return 0;
}

- (DragAndDropMapItem)initWithLabelMarker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 featureAnnotation];
  if ([v4 isCluster])
  {
    id v6 = [v4 clusterFeatureAnnotations];
    uint64_t v7 = [v6 firstObject];

    uint64_t v5 = (void *)v7;
  }
  if (!v5 || ![v5 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation]) {
    goto LABEL_9;
  }
  id v8 = v5;
  v9 = [v8 personalizedItem];
  id v10 = [v8 mapItem];

  if (v9)
  {
    id v11 = [(DragAndDropMapItem *)self initWithPersonalizedItem:v9];

    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v10) {
LABEL_9:
  }
    id v10 = [objc_alloc((Class)MKMapItem) _initWithLabelMarker:v4];
  id v11 = [(DragAndDropMapItem *)self initWithMapItem:v10];
  if (v11)
  {
LABEL_11:
    id v12 = [[MapsAnalyticsHelper alloc] initWithLabelMarker:v4];
    analyticsHelper = v11->_analyticsHelper;
    v11->_analyticsHelper = v12;
  }
LABEL_12:

  return v11;
}

- (DragAndDropMapItem)initWithMapItem:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DragAndDropMapItem;
  id v6 = [(DragAndDropMapItem *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    objc_storeStrong((id *)&v7->_originalMapItem, a3);
    objc_storeStrong(&v7->_presentationObject, a3);
    uint64_t v8 = [v5 name];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    id v10 = [[MapsAnalyticsHelper alloc] initWithMapItem:v5];
    analyticsHelper = v7->_analyticsHelper;
    v7->_analyticsHelper = v10;
  }
  return v7;
}

- (DragAndDropMapItem)initWithAddress:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DragAndDropMapItem;
  id v6 = [(DragAndDropMapItem *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_address, a3);
    uint64_t v8 = [(AddressBookAddress *)v7->_address geocodedMapItem];
    originalMapItem = v7->_originalMapItem;
    v7->_originalMapItem = (MKMapItem *)v8;

    objc_storeStrong(&v7->_presentationObject, a3);
    uint64_t v10 = [v5 compositeName];
    name = v7->_name;
    v7->_name = (NSString *)v10;

    if (v7->_originalMapItem) {
      id v12 = [[MapsAnalyticsHelper alloc] initWithMapItem:v7->_originalMapItem];
    }
    else {
      id v12 = objc_alloc_init(MapsAnalyticsHelper);
    }
    analyticsHelper = v7->_analyticsHelper;
    v7->_analyticsHelper = v12;
  }
  return v7;
}

- (DragAndDropMapItem)initWithRecentContact:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DragAndDropMapItem;
  id v6 = [(DragAndDropMapItem *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recentContact, a3);
    objc_storeStrong(&v7->_presentationObject, a3);
    uint64_t v8 = [v5 displayName];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    uint64_t v10 = objc_alloc_init(MapsAnalyticsHelper);
    analyticsHelper = v7->_analyticsHelper;
    v7->_analyticsHelper = v10;
  }
  return v7;
}

- (DragAndDropMapItem)initWithPersonalizedItem:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DragAndDropMapItem;
  id v5 = [(DragAndDropMapItem *)&v25 init];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 searchResult];
  searchResult = v5->_searchResult;
  v5->_searchResult = (SearchResult *)v6;

  uint64_t v8 = [v4 address];
  address = v5->_address;
  v5->_address = (AddressBookAddress *)v8;

  uint64_t v10 = [v4 mapItem];
  mapItem = v5->_mapItem;
  v5->_mapItem = (MKMapItem *)v10;

  objc_storeStrong((id *)&v5->_originalMapItem, v5->_mapItem);
  id v12 = [v4 title];
  uint64_t v13 = [v12 value];
  name = v5->_name;
  v5->_name = (NSString *)v13;

  objc_super v15 = [v4 parkedCar];
  id v16 = v15;
  if (v15)
  {
    v17 = v15;
LABEL_6:
    presentationObject = (MKMapItem *)v5->_presentationObject;
    v5->_presentationObject = v17;
LABEL_7:

    goto LABEL_8;
  }
  id v18 = v5->_address;
  if (v18)
  {
    v17 = v18;
    goto LABEL_6;
  }
  v23 = v5->_searchResult;
  if (v23 || v5->_mapItem)
  {
    presentationObject = [(SearchResult *)v23 mapItem];
    uint64_t v24 = presentationObject;
    if (!presentationObject) {
      uint64_t v24 = v5->_mapItem;
    }
    objc_storeStrong(&v5->_presentationObject, v24);
    goto LABEL_7;
  }
LABEL_8:
  if (v5->_originalMapItem) {
    v20 = [[MapsAnalyticsHelper alloc] initWithMapItem:v5->_originalMapItem];
  }
  else {
    v20 = objc_alloc_init(MapsAnalyticsHelper);
  }
  analyticsHelper = v5->_analyticsHelper;
  v5->_analyticsHelper = v20;

LABEL_12:
  return v5;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);

  [(DragAndDropMapItem *)self _resolveMapItem];
}

- (void)_didResolveMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedMapItem, a3);
  id v5 = a3;
  id v6 = [(DragAndDropMapItem *)self observer];
  [v6 dragAndDropItem:self didResolveMapItem:self->_resolvedMapItem];
}

- (void)_resolveMapItem
{
  if (!self->_resolveGroup)
  {
    v3 = dispatch_group_create();
    if (self->_address)
    {
      id v4 = +[NSProgress progressWithTotalUnitCount:100];
      [(NSProgress *)v4 setCancellable:0];
      id v5 = [[MapItemResolver alloc] initWithAddress:self->_address];
      goto LABEL_4;
    }
    if (self->_recentContact)
    {
      id v4 = +[NSProgress progressWithTotalUnitCount:100];
      [(NSProgress *)v4 setCancellable:1];
      uint64_t v7 = [MapItemResolver alloc];
      uint64_t v8 = [(CRRecentContact *)self->_recentContact address];
      id v6 = [(MapItemResolver *)v7 initWithAddressString:v8];

      if (v6) {
        goto LABEL_8;
      }
    }
    else
    {
      if (self->_mapItem)
      {
        id v4 = +[NSProgress progressWithTotalUnitCount:100];
        [(NSProgress *)v4 setCancellable:1];
        id v5 = [[MapItemResolver alloc] initWithMapItem:self->_mapItem];
LABEL_4:
        id v6 = v5;
        if (!v5) {
          goto LABEL_11;
        }
LABEL_8:
        dispatch_group_enter(v3);
        [(MapItemResolver *)v6 setDelegate:self];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100363064;
        v16[3] = &unk_1012E5ED8;
        v16[4] = self;
        id v4 = v4;
        v17 = v4;
        id v18 = v3;
        [(MapItemResolver *)v6 startWithCompletion:v16];
        [(NSProgress *)v4 setPausable:0];
        if ([(NSProgress *)v4 isCancellable])
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1003630D8;
          v14[3] = &unk_1012E5D08;
          objc_super v15 = v6;
          [(NSProgress *)v4 setCancellationHandler:v14];
        }
        goto LABEL_11;
      }
      id v4 = 0;
      id v6 = 0;
    }
LABEL_11:
    resolver = self->_resolver;
    self->_resolver = v6;
    uint64_t v10 = v6;

    resolveProgress = self->_resolveProgress;
    self->_resolveProgress = v4;
    id v12 = v4;

    resolveGroup = self->_resolveGroup;
    self->_resolveGroup = (OS_dispatch_group *)v3;
  }
}

- (NSItemProviderWriting)itemProviderWriting
{
  return (NSItemProviderWriting *)self;
}

- (NSItemProvider)itemProvider
{
  id v3 = objc_alloc((Class)NSItemProvider);
  id v4 = [(DragAndDropMapItem *)self itemProviderWriting];
  id v5 = [v3 initWithObject:v4];

  [v5 setSuggestedName:self->_name];

  return (NSItemProvider *)v5;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v2 = +[NSMutableArray array];
  id v3 = +[MKMapItem writableTypeIdentifiersForItemProvider];
  [v2 addObjectsFromArray:v3];

  id v4 = [UTTypeVCard identifier];
  [v2 addObject:v4];

  id v5 = [UTTypeURL identifier];
  [v2 addObject:v5];

  id v6 = [UTTypeUTF8PlainText identifier];
  [v2 addObject:v6];

  id v7 = [v2 copy];

  return v7;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_resolveProgress)
  {
    uint64_t v8 = +[NSProgress progressWithTotalUnitCount:100];
    if ([(NSProgress *)self->_resolveProgress isCancellable])
    {
      [v8 setCancellable:1];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1003634B8;
      v25[3] = &unk_1012E5D08;
      v25[4] = self;
      [v8 setCancellationHandler:v25];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100363540;
  v20[3] = &unk_1012E5F50;
  id v9 = v7;
  id v24 = v9;
  id v10 = v8;
  id v21 = v10;
  id v11 = v6;
  id v22 = v11;
  v23 = self;
  id v12 = objc_retainBlock(v20);
  uint64_t v13 = +[UIDevice currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14 == (id)5)
  {
    ((void (*)(void *, MKMapItem *))v12[2])(v12, self->_originalMapItem);
  }
  else
  {
    resolveGroup = self->_resolveGroup;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100363814;
    block[3] = &unk_1012E5F78;
    block[4] = self;
    v19 = v12;
    dispatch_group_notify(resolveGroup, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  id v16 = v10;

  return v16;
}

- (id)traitsForMapItemResolver:(id)a3
{
  id v3 = +[MKMapService sharedService];
  id v4 = [v3 defaultTraits];

  return v4;
}

- (MKMapItem)draggedMapItem
{
  return self->_resolvedMapItem;
}

- (DragAndDropMapItemObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (DragAndDropMapItemObserver *)WeakRetained;
}

- (id)presentationObject
{
  return self->_presentationObject;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (MKMapItem)resolvedMapItem
{
  return self->_resolvedMapItem;
}

- (CLLocationCoordinate2D)sourceCoordinate
{
  double latitude = self->_sourceCoordinate.latitude;
  double longitude = self->_sourceCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setSourceCoordinate:(CLLocationCoordinate2D)a3
{
  self->_sourceCoordinate = a3;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (MapsAnalyticsHelper)analyticsHelper
{
  return self->_analyticsHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsHelper, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_originalMapItem, 0);
  objc_storeStrong(&self->_presentationObject, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_resolveProgress, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_resolveGroup, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_recentContact, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_resolver, 0);
}

@end