@interface CuratedCollectionsListFetcher
- (CuratedCollectionsListFetcher)initWithTraits:(id)a3;
- (GEOMapServiceTraits)traits;
- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)setTraits:(id)a3;
@end

@implementation CuratedCollectionsListFetcher

- (CuratedCollectionsListFetcher)initWithTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionsListFetcher;
  v6 = [(CuratedCollectionsListFetcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_traits, a3);
  }

  return v7;
}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MKMapService sharedService];
  objc_super v9 = [(CuratedCollectionsListFetcher *)self traits];
  v10 = [v8 ticketForCuratedCollections:v6 isBatchLookup:1 traits:v9];

  objc_initWeak(&location, self);
  v11 = sub_1003A0980();
  v12 = (char *)os_signpost_id_generate(v11);

  v13 = sub_1003A0980();
  v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "FetchingCollectionsListViewBatch", "", buf, 2u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003A09D4;
  v16[3] = &unk_1012E71E0;
  v18[1] = v12;
  objc_copyWeak(v18, &location);
  id v15 = v7;
  id v17 = v15;
  [v10 submitWithHandler:v16 networkActivity:&stru_1012E7200];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (void).cxx_destruct
{
}

@end