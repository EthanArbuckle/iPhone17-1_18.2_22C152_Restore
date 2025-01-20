@interface ShareItem
+ (id)shareItemForCurrentLocationIncludingPrintActivity:(BOOL)a3 withBackingMapItem:(id)a4;
+ (id)shareItemForObject:(id)a3;
+ (id)shareItemWithRoute:(id)a3 includeRoutingApps:(BOOL)a4;
+ (id)shareItemWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5;
+ (id)shareItemWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5 applicationActivities:(id)a6;
@end

@implementation ShareItem

+ (id)shareItemWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5 applicationActivities:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[ShareItemSearchResult alloc] initWithSearchResult:v11 contact:v10 includePrintActivity:v6 applicationActivities:v9];

  return v12;
}

+ (id)shareItemWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5
{
  return [a1 shareItemWithSearchResult:a3 contact:a4 includePrintActivity:a5 applicationActivities:&__NSArray0__struct];
}

+ (id)shareItemForCurrentLocationIncludingPrintActivity:(BOOL)a3 withBackingMapItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = +[SearchResult currentLocationSearchResult];
  v8 = v7;
  if (v6) {
    [v7 setMapItem:v6];
  }
  id v9 = objc_alloc_init((Class)CNContactStore);
  id v10 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v28 = v10;
  id v11 = +[NSArray arrayWithObjects:&v28 count:1];
  v26 = v9;
  id v27 = 0;
  v12 = [v9 _ios_meContactWithKeysToFetch:v11 error:&v27];
  id v13 = v27;

  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    v16 = +[CNContactFormatter stringFromContact:v12 style:0];
    if ([v16 length])
    {
      v17 = +[NSBundle mainBundle];
      [v17 localizedStringForKey:@"Person_Name_Location_Callout_Label" value:@"localized string not found" table:0];
      id v25 = v6;
      id v18 = a1;
      v20 = BOOL v19 = v4;
      uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v16);

      BOOL v4 = v19;
      a1 = v18;
      id v6 = v25;

      v22 = [v8 place];
      [v22 setName:v21];

      v16 = (void *)v21;
    }
    id v15 = objc_alloc_init((Class)CNMutableContact);
    [v15 setContactType:0];
    [v15 setGivenName:v16];
  }
  else
  {
    id v15 = [v8 unknownContact];
  }
  v23 = [a1 shareItemWithSearchResult:v8 contact:v15 includePrintActivity:v4];

  return v23;
}

+ (id)shareItemWithRoute:(id)a3 includeRoutingApps:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[ShareItemRoute alloc] initWithRoute:v5 includeRoutingApps:v4];

  return v6;
}

+ (id)shareItemForObject:(id)a3
{
  id v3 = a3;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1001042B0;
  v57 = sub_1001049C8;
  id v58 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = v54;
    id v5 = v3;
    id v6 = (id)v4[5];
    v4[5] = (uint64_t)v5;
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    id v10 = [v6 MKMapItem];

    if (v10)
    {
      id v11 = [SearchResult alloc];
      v12 = [v6 MKMapItem];
      id v13 = [(SearchResult *)v11 initWithMapItem:v12];
      BOOL v14 = (void *)v54[5];
      v54[5] = (uint64_t)v13;
    }
    if ([v6 type] == (id)7) {
      [(id)v54[5] setReverseGeocoded:1];
    }
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_4:
      v7 = (void *)v54[5];
      if (v7)
      {
        v8 = [v7 unknownContact];
        id v9 = +[ShareItem shareItemWithSearchResult:v54[5] contact:v8 includePrintActivity:1];
      }
      else
      {
        id v9 = 0;
      }
      goto LABEL_12;
    }
    id v6 = v3;
    v30 = +[Recents sharedRecents];
    v31 = [v30 cachedMapItemForContactID:[v6 contactID]];

    if (v31)
    {
      v32 = [[SearchResult alloc] initWithMapItem:v31];
      v33 = (void *)v54[5];
      v54[5] = (uint64_t)v32;
    }
LABEL_3:

    goto LABEL_4;
  }
  id v16 = v3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_1001042B0;
  v51 = sub_1001049C8;
  id v52 = 0;
  v17 = [v16 historyEntry];
  v45[4] = &v47;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100A93A7C;
  v46[3] = &unk_1012F4148;
  v46[4] = &v53;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100A93AD4;
  v45[3] = &unk_1012F8798;
  [v17 ifSearch:0 ifRoute:v46 ifPlaceDisplay:v45 ifTransitLineItem:0];

  if (v48[5])
  {
    id v18 = [SearchResult alloc];
    id v19 = objc_alloc((Class)MKMapItem);
    id v20 = [v19 initWithGeoMapItem:v48[5] isPlaceHolderPlace:0];
    uint64_t v21 = [(SearchResult *)v18 initWithMapItem:v20];
    v22 = (void *)v54[5];
    v54[5] = (uint64_t)v21;
  }
  id v23 = v16;
  id v9 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
  objc_opt_class();
  id v24 = v23;
  if (objc_opt_isKindOfClass()) {
    id v25 = v24;
  }
  else {
    id v25 = 0;
  }
  id v26 = v25;

  if (v26
    && ([v26 historyEntry],
        id v27 = objc_claimAutoreleasedReturnValue(),
        unsigned int v28 = [v27 conformsToProtocol:v9],
        v27,
        v28))
  {
    id v29 = v24;
  }
  else
  {
    id v29 = 0;
  }

  if (v29)
  {
    id v34 = v24;
    v35 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
    objc_opt_class();
    id v36 = v34;
    if (objc_opt_isKindOfClass()) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    if (v38
      && ([v38 historyEntry],
          v39 = objc_claimAutoreleasedReturnValue(),
          unsigned int v40 = [v39 conformsToProtocol:v35],
          v39,
          v40))
    {
      id v41 = v36;
    }
    else
    {
      id v41 = 0;
    }

    v42 = [CuratedCollectionShareItemSource alloc];
    v43 = [v41 historyEntry];
    v44 = [v43 placeCollection];
    id v9 = [(CuratedCollectionShareItemSource *)v42 initWithPlaceCollection:v44 refinedMapItems:&__NSArray0__struct];
  }
  _Block_object_dispose(&v47, 8);

  if (!v29) {
    goto LABEL_4;
  }
LABEL_12:
  _Block_object_dispose(&v53, 8);

  return v9;
}

@end