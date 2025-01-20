@interface CollectionSaveSession
- (BOOL)canRenameSelectedObjectInCollection:(id)a3;
- (CollectionSaveSession)initWithMapItem:(id)a3;
- (GEOTransitLine)transitLine;
- (MKMapItem)mapItem;
- (void)applyToCollection:(id)a3 completion:(id)a4;
@end

@implementation CollectionSaveSession

- (CollectionSaveSession)initWithMapItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CollectionSaveSession;
  v5 = [(CollectionEditSession *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CollectionEditSession *)v5 addSelectedObject:v4];
  }

  return v6;
}

- (MKMapItem)mapItem
{
  v2 = [(CollectionEditSession *)self selectedObjectSet];
  v3 = [v2 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (MKMapItem *)v4;
}

- (GEOTransitLine)transitLine
{
  v2 = [(CollectionEditSession *)self selectedObjectSet];
  v3 = [v2 anyObject];

  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (GEOTransitLine *)v4;
}

- (BOOL)canRenameSelectedObjectInCollection:(id)a3
{
  id v4 = a3;
  v5 = [(CollectionEditSession *)self selectedObjectSet];
  id v6 = [v5 count];

  if (v6 == (id)1)
  {
    v7 = [(CollectionSaveSession *)self mapItem];
    if (objc_msgSend(v7, "_maps_canRenameCollectionItem")) {
      unsigned int v8 = [v4 containsItem:v7] ^ 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)applyToCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(CollectionEditSession *)self collection];
  }
  v9 = v8;
  v10 = [(CollectionSaveSession *)self mapItem];

  if (v10 && v9)
  {
    if (![(CollectionEditSession *)self suppressAnalytics])
    {
      uint64_t v11 = [(CollectionEditSession *)self analyticsTarget];
      id v12 = [(CollectionEditSession *)self collection];

      id v26 = v7;
      v25 = v9;
      if (v12 != v6)
      {
        v13 = [(CollectionEditSession *)self collection];
        if ([v13 handlerType] == (id)3) {
          uint64_t v11 = 256;
        }
        else {
          uint64_t v11 = 252;
        }
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = [(CollectionEditSession *)self selectedObjectSet];
      id v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(obj);
            }
            v18 = [*(id *)(*((void *)&v30 + 1) + 8 * i) _identifier];
            v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 muid]);
            v20 = [v19 stringValue];
            +[GEOAPPortal captureUserAction:2073 target:v11 value:v20];
          }
          id v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      id v7 = v26;
      v9 = v25;
    }
    v21 = [(CollectionEditSession *)self selectedObjectSet];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100AD0368;
    v28[3] = &unk_1012F0BB0;
    v28[4] = self;
    id v29 = v7;
    [v9 addObjects:v21 completion:v28];
  }
  else
  {
    v22 = +[NSError GEOErrorWithCode:0 reason:@"Nil map item or collection"];
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v22);
    }
    v23 = [(CollectionEditSession *)self resultBlock];

    if (v23)
    {
      v24 = [(CollectionEditSession *)self resultBlock];
      ((void (**)(void, void *))v24)[2](v24, v22);
    }
  }
}

@end