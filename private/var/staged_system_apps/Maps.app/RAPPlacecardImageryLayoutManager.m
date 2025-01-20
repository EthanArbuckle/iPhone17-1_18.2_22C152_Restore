@interface RAPPlacecardImageryLayoutManager
- (RAPPlacecardImageryLayoutManager)initWithDefaultItems:(id)a3;
- (id)issueItemForIndex:(unint64_t)a3;
- (id)issueItems;
- (unint64_t)numberOfIssueItems;
- (void)downloadAndResolveLayoutWithMapItem:(id)a3 completion:(id)a4;
- (void)mergeWithServerConfig:(id)a3;
@end

@implementation RAPPlacecardImageryLayoutManager

- (RAPPlacecardImageryLayoutManager)initWithDefaultItems:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RAPPlacecardImageryLayoutManager;
  v5 = [(RAPPlacecardImageryLayoutManager *)&v25 init];
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    id v23 = v4;
    id v7 = v4;
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v13);
          v15 = objc_alloc_init(RAPLayoutItem);
          v16 = [v14 localizedTitle];
          [(RAPLayoutItem *)v15 setDisplayText:v16];

          v17 = +[NSNumber numberWithUnsignedInteger:(char *)v13 + v11];
          [(RAPLayoutItem *)v15 setOrdinal:v17];

          v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 type]);
          [(RAPLayoutItem *)v15 setFieldType:v18];

          [v8 addObject:v15];
          v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        v11 += (uint64_t)v13;
      }
      while (v10);
    }

    v19 = (NSArray *)[v8 copy];
    v6 = v22;
    layoutItems = v22->_layoutItems;
    v22->_layoutItems = v19;

    id v4 = v23;
  }

  return v6;
}

- (void)mergeWithServerConfig:(id)a3
{
  id v3 = a3;
  id obj = (id)objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v50 = v3;
  id v4 = [v3 layoutFields];
  id v5 = [v4 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v67;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v67 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if ([v9 type] == 7 && objc_msgSend(v9, "enabled"))
        {
          id v10 = v9;
          uint64_t v11 = objc_alloc_init(RAPLayoutItem);
          uint64_t v12 = [v10 name];
          uint64_t v13 = [v12 poiImageCorrectionType] - 1;
          if (v13 < 8) {
            uint64_t v14 = v13 + 1;
          }
          else {
            uint64_t v14 = 0;
          }
          v15 = +[NSNumber numberWithUnsignedInteger:v14];
          [(RAPLayoutItem *)v11 setFieldType:v15];

          v16 = [v10 displayText];
          [(RAPLayoutItem *)v11 setDisplayText:v16];

          [obj addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v6);
  }

  id v17 = [(NSArray *)self->_layoutItems copy];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  id v19 = objc_alloc_init((Class)NSMutableSet);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v20 = v17;
  id v21 = [v20 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v63;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v63 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_super v25 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
        long long v26 = [v25 fieldType];
        [v18 setObject:v25 forKey:v26];

        long long v27 = [v25 fieldType];
        [v19 addObject:v27];
      }
      id v22 = [v20 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v22);
  }
  v49 = v20;

  id v28 = objc_alloc_init((Class)NSMutableSet);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obja = obj;
  id v29 = [obja countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v59;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v59 != v31) {
          objc_enumerationMutation(obja);
        }
        v33 = *(void **)(*((void *)&v58 + 1) + 8 * (void)k);
        v34 = [v33 fieldType];
        v35 = [v18 objectForKey:v34];

        v36 = [v33 displayText];
        id v37 = [v36 length];

        if (v37)
        {
          v38 = [v33 displayText];
          [v35 setDisplayText:v38];
        }
        v39 = [v33 fieldType];
        [v28 addObject:v39];
      }
      id v30 = [obja countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v30);
  }

  [v28 minusSet:v19];
  id v40 = objc_alloc_init((Class)NSMutableArray);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v41 = v28;
  id v42 = [v41 countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v55;
    do
    {
      for (m = 0; m != v43; m = (char *)m + 1)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = [v18 objectForKey:*(void *)(*((void *)&v54 + 1) + 8 * (void)m)];
        [v40 addObject:v46];
      }
      id v43 = [v41 countByEnumeratingWithState:&v54 objects:v70 count:16];
    }
    while (v43);
  }

  v47 = (NSArray *)[v40 copy];
  layoutItems = self->_layoutItems;
  self->_layoutItems = v47;
}

- (void)downloadAndResolveLayoutWithMapItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(RAPLayoutOptions);
  [(RAPLayoutOptions *)v8 setLayoutType:5];
  [(RAPLayoutOptions *)v8 setReportedMapItem:v6];
  id v9 = [[RAPLayoutDownloader alloc] initWithLayoutOptions:v8];
  downloader = self->_downloader;
  self->_downloader = v9;

  objc_initWeak(&location, self);
  uint64_t v11 = self->_downloader;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100549864;
  v13[3] = &unk_1012EE7B8;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  [(RAPLayoutDownloader *)v11 fetchLayoutConfig:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (unint64_t)numberOfIssueItems
{
  return [(NSArray *)self->_layoutItems count];
}

- (id)issueItemForIndex:(unint64_t)a3
{
  if ([(RAPPlacecardImageryLayoutManager *)self numberOfIssueItems] <= a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: index < self.numberOfIssueItems", v11, 2u);
    }
    id v9 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_layoutItems objectAtIndex:a3];
    id v6 = [v5 fieldType];
    id v7 = [v6 unsignedIntegerValue];

    id v8 = [v5 displayText];
    id v9 = [[RAPPlacecardImageryIssueItem alloc] initWithType:v7 overridenText:v8];
  }

  return v9;
}

- (id)issueItems
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_layoutItems;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 fieldType:v16];
        id v11 = [v10 unsignedIntegerValue];

        id v12 = [v9 displayText];

        uint64_t v13 = [[RAPPlacecardImageryIssueItem alloc] initWithType:v11 overridenText:v12];
        [v3 addObject:v13];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v14 = [v3 copy];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloader, 0);

  objc_storeStrong((id *)&self->_layoutItems, 0);
}

@end