@interface AllPlacesCollectionHandler
- (AllPlacesCollectionHandler)init;
- (BOOL)canDeleteContent;
- (NSArray)storeSubscriptionTypes;
- (id)glyphImage;
- (id)identifier;
- (id)title;
- (int)showAction;
- (int64_t)contentType;
- (int64_t)handlerType;
- (void)rebuildContent;
- (void)removeObjects:(id)a3 completion:(id)a4;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)updateContent;
@end

@implementation AllPlacesCollectionHandler

- (AllPlacesCollectionHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)AllPlacesCollectionHandler;
  v2 = [(CollectionHandler *)&v8 init];
  if (v2)
  {
    v3 = +[MapsSyncStore sharedStore];
    [v3 subscribe:v2];

    uint64_t v9 = objc_opt_class();
    uint64_t v4 = +[NSArray arrayWithObjects:&v9 count:1];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v4;

    queryContents = v2->_queryContents;
    v2->_queryContents = (NSArray *)&__NSArray0__struct;

    [(AllPlacesCollectionHandler *)v2 storeDidChangeWithTypes:&__NSArray0__struct];
  }
  return v2;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)MSCollectionPlaceItemRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100023650;
  v6[3] = &unk_1012E6E78;
  objc_copyWeak(&v7, &location);
  [v5 fetchWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)identifier
{
  return @"__internal_CollectionSavedPlacesIdentifier";
}

- (void)rebuildContent
{
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Collection] All Places" value:@"localized string not found" table:0];

  return v3;
}

- (id)glyphImage
{
  return +[UIImage _systemImageNamed:@"pin.point.of.interest.2.fill"];
}

- (int64_t)handlerType
{
  return 2;
}

- (int64_t)contentType
{
  return 1;
}

- (int)showAction
{
  return 2085;
}

- (void)updateContent
{
  [(AllPlacesCollectionHandler *)self rebuildContent];

  [(CollectionHandler *)self updateSorting];
}

- (BOOL)canDeleteContent
{
  return 1;
}

- (void)removeObjects:(id)a3 completion:(id)a4
{
  id v5 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    objc_super v8 = GEOResultRefinementSort_ptr;
    uint64_t v9 = *(void *)v31;
    v10 = &classRef_TraceWaypointRequest;
    do
    {
      v11 = 0;
      id v28 = v7;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = (objc_class *)v10[463];
          v29.receiver = self;
          v29.super_class = v13;
          v14 = [(CollectionHandler *)&v29 itemForMapItem:v12];
          if (v14) {
            goto LABEL_17;
          }
        }
        else
        {
          id v15 = v12;
          if ([v15 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine]) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          if (v17)
          {
            v18 = [(CollectionHandler *)self mapping];
            v14 = [v18 objectForKey:v17];

            if (!v14)
            {
              v19 = [(CollectionHandler *)self mapping];
              [v17 name];
              uint64_t v20 = v9;
              v21 = self;
              v22 = v10;
              v23 = v8;
              v25 = id v24 = v5;
              v14 = [v19 objectForKey:v25];

              id v5 = v24;
              objc_super v8 = v23;
              v10 = v22;
              self = v21;
              uint64_t v9 = v20;
              id v7 = v28;
            }
          }
          else
          {
            v14 = 0;
          }

          if (v14)
          {
LABEL_17:
            v26 = +[MapsSyncStore sharedStore];
            v34 = v14;
            v27 = +[NSArray arrayWithObjects:&v34 count:1];
            [v26 deleteWithObjects:v27 error:0];
          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);

  objc_storeStrong((id *)&self->_queryContents, 0);
}

@end