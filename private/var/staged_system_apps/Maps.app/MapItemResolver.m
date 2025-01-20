@interface MapItemResolver
- (BOOL)hasNearestStation;
- (BOOL)isCanceled;
- (MKMapItem)resolvedMapItem;
- (MapItemResolver)init;
- (MapItemResolver)initWithAddress:(id)a3;
- (MapItemResolver)initWithAddressString:(id)a3;
- (MapItemResolver)initWithLabelMarker:(id)a3;
- (MapItemResolver)initWithMapItem:(id)a3;
- (MapItemResolverDelegate)delegate;
- (NSError)error;
- (PersonalizedItem)resolvedPlace;
- (id)context;
- (id)traits;
- (void)_addCancelationHandler:(id)a3;
- (void)cancel;
- (void)resolveAddress:(id)a3;
- (void)resolveAddressString:(id)a3;
- (void)resolveLabelMarker:(id)a3;
- (void)resolveMapItem:(id)a3;
- (void)resolveNearestTransitStationForLabelMarker:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setHasNearestStation:(BOOL)a3;
- (void)setResolvedMapItem:(id)a3;
- (void)setResolvedPlace:(id)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation MapItemResolver

- (MapItemResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapItemResolver;
  v2 = [(MapItemResolver *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    resolveGroup = v2->_resolveGroup;
    v2->_resolveGroup = (OS_dispatch_group *)v3;
  }
  return v2;
}

- (MapItemResolver)initWithLabelMarker:(id)a3
{
  id v4 = a3;
  v5 = [(MapItemResolver *)self init];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10070BF64;
    v9[3] = &unk_1012F61F0;
    id v10 = v4;
    objc_super v6 = objc_retainBlock(v9);
    id resolveBlock = v5->_resolveBlock;
    v5->_id resolveBlock = v6;
  }
  return v5;
}

- (MapItemResolver)initWithAddress:(id)a3
{
  id v4 = a3;
  v5 = [(MapItemResolver *)self init];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10070C020;
    v9[3] = &unk_1012F61F0;
    id v10 = v4;
    objc_super v6 = objc_retainBlock(v9);
    id resolveBlock = v5->_resolveBlock;
    v5->_id resolveBlock = v6;
  }
  return v5;
}

- (MapItemResolver)initWithAddressString:(id)a3
{
  id v4 = a3;
  v5 = [(MapItemResolver *)self init];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10070C0DC;
    v9[3] = &unk_1012F61F0;
    id v10 = v4;
    objc_super v6 = objc_retainBlock(v9);
    id resolveBlock = v5->_resolveBlock;
    v5->_id resolveBlock = v6;
  }
  return v5;
}

- (MapItemResolver)initWithMapItem:(id)a3
{
  id v4 = a3;
  v5 = [(MapItemResolver *)self init];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10070C198;
    v9[3] = &unk_1012F61F0;
    id v10 = v4;
    objc_super v6 = objc_retainBlock(v9);
    id resolveBlock = v5->_resolveBlock;
    v5->_id resolveBlock = v6;
  }
  return v5;
}

- (id)traits
{
  dispatch_group_t v3 = [(MapItemResolver *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MapItemResolver *)self delegate];
    objc_super v6 = [v5 traitsForMapItemResolver:self];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = 0;
  atomic_compare_exchange_strong_explicit(&self->_hasStarted, (unsigned int *)&v5, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v5)
  {
    id resolveBlock = (void (**)(id, MapItemResolver *))self->_resolveBlock;
    if (resolveBlock) {
      resolveBlock[2](resolveBlock, self);
    }
    if (v4)
    {
      resolveGroup = self->_resolveGroup;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10070C30C;
      v8[3] = &unk_1012E5F78;
      v8[4] = self;
      id v9 = v4;
      dispatch_group_notify(resolveGroup, (dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  dispatch_group_t v3 = v2->_cancelHandlers;
  cancelHandlers = v2->_cancelHandlers;
  v2->_cancelHandlers = 0;

  [(MapItemResolver *)v2 setCanceled:1];
  objc_sync_exit(v2);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v5 = v3;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_addCancelationHandler:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  int v5 = v10;
  cancelHandlers = v4->_cancelHandlers;
  if (!cancelHandlers)
  {
    uint64_t v7 = +[NSMutableArray array];
    v8 = v4->_cancelHandlers;
    v4->_cancelHandlers = (NSMutableArray *)v7;

    cancelHandlers = v4->_cancelHandlers;
    int v5 = v10;
  }
  id v9 = [v5 copy];
  [(NSMutableArray *)cancelHandlers addObject:v9];

  objc_sync_exit(v4);
}

- (void)resolveLabelMarker:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  CLLocationDegrees v6 = v5;
  [v4 coordinate];
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);
  id v9 = [objc_alloc((Class)CLLocation) initWithLatitude:v8.latitude longitude:v8.longitude];
  id v10 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v9];
  id v11 = v4;
  unsigned int v12 = [v11 featureType];
  if (v12 <= 9 && ((1 << v12) & 0x2C0) != 0)
  {
    uint64_t v13 = [v11 title];
  }
  else
  {
    uint64_t v13 = [v11 name];
  }
  v14 = (void *)v13;

  [v10 setName:v14];
  if ([v11 isTransitLine])
  {
    if (objc_msgSend(v11, "_maps_numLines") == (id)1) {
      [(MapItemResolver *)self resolveNearestTransitStationForLabelMarker:v11];
    }
    else {
      [(MapItemResolver *)self setResolvedMapItem:v10];
    }
  }
  else
  {
    v15 = [v11 featureAnnotation];
    v16 = v15;
    if (v15 && [v15 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
      v17 = [v16 personalizedItem];
      if ([v17 mustRefineMapItem]
        && ([v17 mapItem], v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
      {
        v19 = [v17 mapItem];
        [(MapItemResolver *)self resolveMapItem:v19];
      }
      else
      {
        [(MapItemResolver *)self setResolvedPlace:v17];
        v19 = [v17 mapItem];
        [(MapItemResolver *)self setResolvedMapItem:v19];
      }
    }
    else if ([v11 businessID])
    {
      v20 = self->_resolveGroup;
      dispatch_group_enter((dispatch_group_t)v20);
      v21 = +[UIApplication sharedMapsDelegate];
      v22 = [v21 poiSearchManager];
      v23 = [v11 identifier];
      v24 = [(MapItemResolver *)self traits];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10070C80C;
      v26[3] = &unk_1012F6218;
      v26[4] = self;
      v27 = v20;
      v25 = v20;
      [v22 searchForIdentifier:v23 allowExpired:1 traits:v24 completionHandler:v26];
    }
  }
}

- (void)resolveMapItem:(id)a3
{
  id v4 = a3;
  double v5 = [v4 _identifier];

  BOOL v6 = v5 == 0;
  CLLocationDegrees v7 = +[MKMapService sharedService];
  if (v6)
  {
    v15 = [(MapItemResolver *)self traits];
    id v11 = [v7 ticketForMapItemToRefine:v4 traits:v15];

    v14 = [v4 name];
    uint64_t v13 = [v4 url];
    unsigned int v12 = [v4 phoneNumber];
  }
  else
  {
    CLLocationCoordinate2D v8 = [v4 _identifier];
    v37 = v8;
    id v9 = +[NSArray arrayWithObjects:&v37 count:1];
    id v10 = [(MapItemResolver *)self traits];
    id v11 = [v7 ticketForIdentifiers:v9 traits:v10];

    unsigned int v12 = 0;
    uint64_t v13 = 0;
    v14 = 0;
  }
  v16 = self->_resolveGroup;
  v17 = v16;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  int v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_100103EAC;
  v33[4] = sub_1001047E0;
  id v34 = 0;
  if (v11)
  {
    dispatch_group_enter((dispatch_group_t)v16);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10070CC70;
    v26[3] = &unk_1012F6240;
    v26[4] = self;
    id v27 = v4;
    id v28 = v14;
    id v29 = v13;
    id v30 = v12;
    v32 = v35;
    v31 = v17;
    id v18 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10070CD90;
    v25[3] = &unk_1012E83B0;
    v25[4] = v33;
    [v11 submitWithHandler:v26 queue:&_dispatch_main_q networkActivity:v25];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10070CE2C;
  v21[3] = &unk_1012E7A60;
  id v19 = v11;
  id v22 = v19;
  v24 = v35;
  v20 = v17;
  v23 = v20;
  [(MapItemResolver *)self _addCancelationHandler:v21];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
}

- (void)resolveNearestTransitStationForLabelMarker:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "_maps_numLines") == (id)1)
  {
    double v5 = [v4 _maps_lineIdentifiers];
    BOOL v6 = [v5 firstObject];

    CLLocationDegrees v7 = self->_resolveGroup;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    int v29 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    int v27 = 0;
    dispatch_group_enter((dispatch_group_t)v7);
    CLLocationCoordinate2D v8 = +[MKLocationManager sharedLocationManager];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10070D0B8;
    v21[3] = &unk_1012F6290;
    void v21[4] = self;
    id v9 = v7;
    id v22 = v9;
    id v10 = v6;
    id v23 = v10;
    v24 = v28;
    v25 = v26;
    id v11 = [v8 singleLocationUpdateWithHandler:v21];

    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10070D534;
    v17 = &unk_1012E7A60;
    id v12 = v11;
    id v18 = v12;
    v20 = v26;
    uint64_t v13 = v9;
    id v19 = v13;
    [(MapItemResolver *)self _addCancelationHandler:&v14];
    [v12 start:v14, v15, v16, v17];

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);
  }
}

- (void)resolveAddress:(id)a3
{
  resolveGroup = self->_resolveGroup;
  id v5 = a3;
  dispatch_group_enter(resolveGroup);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10070D638;
  v6[3] = &unk_1012E8738;
  v6[4] = self;
  [v5 forwardGeocodeAddress:v6];
}

- (void)resolveAddressString:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100103EAC;
  int v29 = sub_1001047E0;
  id v30 = 0;
  id v5 = +[MKMapService sharedService];
  BOOL v6 = [(MapItemResolver *)self traits];
  uint64_t v7 = [v5 ticketForForwardGeocodeString:v4 traits:v6];
  CLLocationCoordinate2D v8 = (void *)v26[5];
  void v26[5] = v7;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_100103EAC;
  void v21[4] = sub_1001047E0;
  id v22 = 0;
  id v9 = self->_resolveGroup;
  dispatch_group_enter((dispatch_group_t)v9);
  id v10 = (void *)v26[5];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10070D96C;
  v18[3] = &unk_1012F62B8;
  v18[4] = self;
  v20 = v23;
  id v11 = v9;
  id v19 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10070DA20;
  v17[3] = &unk_1012E83B0;
  v17[4] = v21;
  [v10 submitWithRefinedHandler:v18 networkActivity:v17];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10070DABC;
  v13[3] = &unk_1012F62E0;
  uint64_t v15 = &v25;
  v16 = v23;
  id v12 = v11;
  v14 = v12;
  [(MapItemResolver *)self _addCancelationHandler:v13];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MKMapItem)resolvedMapItem
{
  return self->_resolvedMapItem;
}

- (void)setResolvedMapItem:(id)a3
{
}

- (PersonalizedItem)resolvedPlace
{
  return self->_resolvedPlace;
}

- (void)setResolvedPlace:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (MapItemResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapItemResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasNearestStation
{
  return self->_hasNearestStation;
}

- (void)setHasNearestStation:(BOOL)a3
{
  self->_hasNearestStation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_resolvedPlace, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cancelHandlers, 0);
  objc_storeStrong((id *)&self->_locationOperation, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_resolveBlock, 0);

  objc_storeStrong((id *)&self->_resolveGroup, 0);
}

@end