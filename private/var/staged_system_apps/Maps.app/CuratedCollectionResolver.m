@interface CuratedCollectionResolver
- (BOOL)shouldResolveAppClips;
- (CuratedCollectionResolver)initWithCuratedCollectionIdentifier:(id)a3 delegate:(id)a4;
- (CuratedCollectionResolver)initWithCuratedCollectionIdentifier:(id)a3 handler:(id)a4;
- (CuratedCollectionResolver)initWithFullyClientizedCuratedCollection:(id)a3 delegate:(id)a4;
- (CuratedCollectionResolverDelegate)delegate;
- (GEOAppleMediaServicesResult)mediaIntegration;
- (GEOPlaceCollection)curatedCollection;
- (MKMapItemIdentifier)collectionIdentifier;
- (NSArray)thirdPartyLinks;
- (NSDictionary)appClips;
- (NSError)error;
- (NSMutableArray)placeCollectionItems;
- (NSMutableArray)tickets;
- (id)handler;
- (void)_commonInitWithCuratedCollectionIdentifier:(id)a3;
- (void)_finishedResolvingItems;
- (void)_resolveAppClips;
- (void)_resolveCollectionDetails;
- (void)_resolveMediaLink:(id)a3 withGroup:(id)a4;
- (void)_resolveThirdPartyLinks:(id)a3 withGroup:(id)a4;
- (void)cancel;
- (void)resolveCollection;
- (void)setCollectionIdentifier:(id)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setHandler:(id)a3;
- (void)setMediaIntegration:(id)a3;
- (void)setPlaceCollectionItems:(id)a3;
- (void)setShouldResolveAppClips:(BOOL)a3;
- (void)setThirdPartyLinks:(id)a3;
- (void)setTickets:(id)a3;
@end

@implementation CuratedCollectionResolver

- (CuratedCollectionResolver)initWithCuratedCollectionIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionResolver;
  v8 = [(CuratedCollectionResolver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    [(CuratedCollectionResolver *)v9 _commonInitWithCuratedCollectionIdentifier:v6];
  }

  return v9;
}

- (CuratedCollectionResolver)initWithCuratedCollectionIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionResolver;
  v8 = [(CuratedCollectionResolver *)&v12 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v7);
    id handler = v8->_handler;
    v8->_id handler = v9;

    [(CuratedCollectionResolver *)v8 _commonInitWithCuratedCollectionIdentifier:v6];
  }

  return v8;
}

- (CuratedCollectionResolver)initWithFullyClientizedCuratedCollection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CuratedCollectionResolver;
  id v9 = [(CuratedCollectionResolver *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_curatedCollection, a3);
    id v11 = objc_alloc((Class)MKMapItemIdentifier);
    objc_super v12 = [v7 collectionIdentifier];
    id v13 = [v11 initWithGEOMapItemIdentifier:v12];

    [(CuratedCollectionResolver *)v10 _commonInitWithCuratedCollectionIdentifier:v13];
  }

  return v10;
}

- (void)_commonInitWithCuratedCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIdentifier, a3);
  id v7 = a3;
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  tickets = self->_tickets;
  self->_tickets = v5;
}

- (void)resolveCollection
{
  v3 = [(CuratedCollectionResolver *)self curatedCollection];

  if (v3)
  {
    [(CuratedCollectionResolver *)self _resolveCollectionDetails];
  }
  else
  {
    v4 = +[CuratedCollectionSyncManager sharedManager];
    v5 = [(CuratedCollectionResolver *)self collectionIdentifier];
    id v6 = MKMapItemIdentifiersToGEOMapItemIdentifier();
    id v7 = [v4 collectionIsSavedWithIdentifier:v6];

    id v8 = +[MKMapService sharedService];
    id v9 = [(CuratedCollectionResolver *)self collectionIdentifier];
    v21 = v9;
    v10 = +[NSArray arrayWithObjects:&v21 count:1];
    id v11 = [v8 ticketForCuratedCollections:v10 isBatchLookup:0 overrideSuppress:v7 traits:0];

    objc_super v12 = [(CuratedCollectionResolver *)self tickets];
    [v12 addObject:v11];

    objc_initWeak(&location, self);
    id v13 = sub_1005B602C();
    v14 = (char *)os_signpost_id_generate(v13);

    objc_super v15 = sub_1005B602C();
    v16 = v15;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "ResolvingCollection", "", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1005B6080;
    v17[3] = &unk_1012F0E18;
    v18[1] = v14;
    objc_copyWeak(v18, &location);
    [v11 submitWithHandler:v17 networkActivity:0];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

- (void)cancel
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CuratedCollectionResolver *)self tickets];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 cancel];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_resolveCollectionDetails
{
  id v3 = [(CuratedCollectionResolver *)self curatedCollection];
  if (![v3 isSuppressed])
  {
    id v4 = [(CuratedCollectionResolver *)self curatedCollection];
    unsigned int v5 = [v4 isBlocked];

    if (v5) {
      goto LABEL_4;
    }
    long long v9 = +[NSMutableArray array];
    [(CuratedCollectionResolver *)self setPlaceCollectionItems:v9];

    long long v10 = sub_1005B602C();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    objc_super v12 = sub_1005B602C();
    id v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ResolvingCollectionItems", "", buf, 2u);
    }

    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    objc_super v15 = +[MKMapService sharedService];
    v16 = [(CuratedCollectionResolver *)self curatedCollection];
    v17 = [v16 itemIds];
    v18 = MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray();
    v19 = [(CuratedCollectionResolver *)self collectionIdentifier];
    v20 = [v15 ticketForCuratedCollectionItems:v18 collection:v19 traits:0];

    v21 = [(CuratedCollectionResolver *)self tickets];
    [v21 addObject:v20];

    *(void *)buf = 0;
    v36 = buf;
    uint64_t v37 = 0x3032000000;
    v38 = sub_100103D4C;
    v39 = sub_100104730;
    id v40 = 0;
    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1005B6784;
    v30[3] = &unk_1012F0E40;
    objc_copyWeak(&v33, &location);
    v32 = buf;
    v22 = v14;
    v31 = v22;
    [v20 submitWithHandler:v30 networkActivity:0];
    v23 = [(CuratedCollectionResolver *)self curatedCollection];
    v24 = [v23 mediaLinks];
    v25 = [v24 firstObject];

    if (v25 && MapsFeature_IsEnabled_GuidesMediaIntegration()) {
      [(CuratedCollectionResolver *)self _resolveMediaLink:v25 withGroup:v22];
    }
    v26 = [v25 thirdPartyLinks];
    if ([v26 count])
    {
      int IsEnabled_GuidesMediaIntegrationThirdPartyLinks = MapsFeature_IsEnabled_GuidesMediaIntegrationThirdPartyLinks();

      if (!IsEnabled_GuidesMediaIntegrationThirdPartyLinks)
      {
LABEL_17:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1005B682C;
        block[3] = &unk_1012ECF98;
        block[5] = buf;
        block[6] = v11;
        block[4] = self;
        dispatch_group_notify(v22, (dispatch_queue_t)&_dispatch_main_q, block);

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);

        return;
      }
      v26 = [v25 thirdPartyLinks];
      [(CuratedCollectionResolver *)self _resolveThirdPartyLinks:v26 withGroup:v22];
    }

    goto LABEL_17;
  }

LABEL_4:
  id v6 = GEOErrorDomain();
  id v28 = +[NSError errorWithDomain:v6 code:-6 userInfo:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v8 = [(CuratedCollectionResolver *)self curatedCollection];
  [WeakRetained didFailToResolveCollectionWithError:v28 withFetchedCollection:v8];
}

- (void)_resolveMediaLink:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_enter(v7);
  long long v8 = sub_1005B602C();
  long long v9 = (char *)os_signpost_id_generate(v8);

  long long v10 = sub_1005B602C();
  os_signpost_id_t v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "ResolvingMediaLink", "", (uint8_t *)buf, 2u);
  }

  [v6 mediaSubType];
  uint64_t v12 = GEOAppleMediaServicesMediaTypeForGeoSubtype();
  objc_initWeak(buf, self);
  id v13 = +[MKAppleMediaServices sharedInstance];
  v14 = [v6 adamID];
  v24 = v14;
  objc_super v15 = +[NSArray arrayWithObjects:&v24 count:1];
  v16 = +[UIScreen mainScreen];
  [v16 scale];
  double v18 = v17;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005B6BB8;
  v20[3] = &unk_1012F0E68;
  objc_copyWeak(v22, buf);
  v22[1] = v9;
  v19 = v7;
  v21 = v19;
  [v13 appleMediaServicesResultsWithIdentifiers:v15 artworkSize:v12 screenScale:8 type:v20 source:64.0 completion:64.0];

  objc_destroyWeak(v22);
  objc_destroyWeak(buf);
}

- (void)_resolveThirdPartyLinks:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_enter(v7);
  long long v8 = sub_1005B602C();
  long long v9 = (char *)os_signpost_id_generate(v8);

  long long v10 = sub_1005B602C();
  os_signpost_id_t v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "ResolvingThirdPartyMediaLink", "", (uint8_t *)buf, 2u);
  }

  uint64_t v12 = [v6 _maps_map:&stru_1012F0EA8];
  id v13 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v12];
  objc_initWeak(buf, self);
  v14 = +[MKAppleMediaServices sharedInstance];
  objc_super v15 = +[UIScreen mainScreen];
  [v15 scale];
  double v17 = v16;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005B6F60;
  v20[3] = &unk_1012F0EF8;
  objc_copyWeak(v23, buf);
  id v18 = v13;
  id v21 = v18;
  v23[1] = v9;
  v19 = v7;
  v22 = v19;
  [v14 appleMediaServicesResultsWithIdentifiers:v12 artworkSize:1 screenScale:8 type:v20 source:64.0 completion:64.0 v17];

  objc_destroyWeak(v23);
  objc_destroyWeak(buf);
}

- (void)_resolveAppClips
{
  id v3 = dispatch_group_create();
  id v4 = +[NSMutableDictionary dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = self;
  unsigned int v5 = [(CuratedCollectionResolver *)self placeCollectionItems];
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        os_signpost_id_t v11 = [v10 appClip];
        if (v11)
        {
          dispatch_group_enter(v3);
          uint64_t v12 = +[MKClipServices sharedInstance];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          id v23[2] = sub_1005B7528;
          v23[3] = &unk_1012F0F20;
          id v24 = v4;
          v25 = v10;
          v26 = v3;
          [v12 appClipWithQuickLink:v11 completion:v23];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  id v13 = sub_1005B602C();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  objc_super v15 = sub_1005B602C();
  double v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ResolvingAppClips", "", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005B75B8;
  block[3] = &unk_1012EA9E0;
  id v20 = v4;
  os_signpost_id_t v21 = v14;
  block[4] = v18;
  id v17 = v4;
  dispatch_group_notify(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_finishedResolvingItems
{
  id v3 = +[CuratedCollectionSyncManager sharedManager];
  id v4 = [(CuratedCollectionResolver *)self curatedCollection];
  unsigned int v5 = [v3 collectionIsSaved:v4];

  if (v5)
  {
    id v6 = +[CuratedCollectionSyncManager sharedManager];
    id v7 = [(CuratedCollectionResolver *)self curatedCollection];
    [v6 updateSavedCuratedCollection:v7 completion:0];
  }
  uint64_t v8 = [(CuratedCollectionResolver *)self placeCollectionItems];
  id v25 = [v8 copy];

  long long v9 = [(CuratedCollectionResolver *)self delegate];

  if (v9)
  {
    long long v10 = [(CuratedCollectionResolver *)self curatedCollection];
    os_signpost_id_t v11 = [v10 mediaLinks];
    uint64_t v12 = [v11 firstObject];

    id v13 = [CuratedCollectionResolverInfo alloc];
    os_signpost_id_t v14 = [(CuratedCollectionResolver *)self mediaIntegration];
    id v15 = [v12 relatedCollectionItemIndex];
    id v16 = [v12 position];
    id v17 = [(CuratedCollectionResolver *)self thirdPartyLinks];
    id v18 = [(CuratedCollectionResolverInfo *)v13 initWithCollectionItems:v25 mediaIntegration:v14 mediaIntegrationCollectionItemIndex:v15 mediaIntegrationPosition:v16 thirdPartyLinks:v17];

    v19 = [(CuratedCollectionResolver *)self delegate];
    id v20 = [(CuratedCollectionResolver *)self curatedCollection];
    [v19 didResolveCollection:v20 resolverInfo:v18];
  }
  os_signpost_id_t v21 = [(CuratedCollectionResolver *)self handler];

  if (v21)
  {
    v22 = [(CuratedCollectionResolver *)self handler];
    v23 = [(CuratedCollectionResolver *)self curatedCollection];
    id v24 = [(CuratedCollectionResolver *)self error];
    ((void (**)(void, void *, id, void *))v22)[2](v22, v23, v25, v24);
  }
}

- (BOOL)shouldResolveAppClips
{
  return self->_shouldResolveAppClips;
}

- (void)setShouldResolveAppClips:(BOOL)a3
{
  self->_shouldResolveAppClips = a3;
}

- (NSDictionary)appClips
{
  return self->_appClips;
}

- (CuratedCollectionResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CuratedCollectionResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapItemIdentifier)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSMutableArray)tickets
{
  return self->_tickets;
}

- (void)setTickets:(id)a3
{
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
}

- (NSMutableArray)placeCollectionItems
{
  return self->_placeCollectionItems;
}

- (void)setPlaceCollectionItems:(id)a3
{
}

- (GEOAppleMediaServicesResult)mediaIntegration
{
  return self->_mediaIntegration;
}

- (void)setMediaIntegration:(id)a3
{
}

- (NSArray)thirdPartyLinks
{
  return self->_thirdPartyLinks;
}

- (void)setThirdPartyLinks:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);
  objc_storeStrong((id *)&self->_mediaIntegration, 0);
  objc_storeStrong((id *)&self->_placeCollectionItems, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_tickets, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_appClips, 0);
}

@end