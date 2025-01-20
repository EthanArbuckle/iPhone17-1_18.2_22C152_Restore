@interface AllCollectionsAPIController
- (AllCollectionsAPIController)initWithOnStateChangeHandler:(id)a3 usingTraits:(id)a4;
- (GEOMapServiceTraits)traits;
- (MKMapServiceAllCollectionsViewTicket)ticket;
- (MKMapServiceCuratedCollectionTicket)batchTicket;
- (NSArray)collectionIds;
- (NSArray)collectionResults;
- (NSArray)filters;
- (NSArray)placeCollections;
- (id)placeCollectionsFromLastBatch;
- (id)stateHandler;
- (int64_t)state;
- (unsigned)batchSize;
- (void)cancelFetchingAllCollections;
- (void)fetchAllCollectionsViewForKeywordFilter:(id)a3 addressFilter:(id)a4 onCompletion:(id)a5;
- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)setBatchTicket:(id)a3;
- (void)setCollectionIds:(id)a3;
- (void)setCollectionResults:(id)a3;
- (void)setFilters:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateHandler:(id)a3;
- (void)setTicket:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation AllCollectionsAPIController

- (AllCollectionsAPIController)initWithOnStateChangeHandler:(id)a3 usingTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AllCollectionsAPIController;
  v8 = [(AllCollectionsAPIController *)&v12 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id stateHandler = v8->_stateHandler;
    v8->_id stateHandler = v9;

    objc_storeStrong((id *)&v8->_traits, a4);
    v8->_state = 0;
  }

  return v8;
}

- (NSArray)collectionResults
{
  return self->_collectionResults;
}

- (id)placeCollectionsFromLastBatch
{
  v2 = [(AllCollectionsAPIController *)self placeCollections];
  id v3 = [v2 copy];

  return v3;
}

- (unsigned)batchSize
{
  return 10;
}

- (void)fetchAllCollectionsViewForKeywordFilter:(id)a3 addressFilter:(id)a4 onCompletion:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  v11 = [(AllCollectionsAPIController *)self allCollectionViewFilters];
  id v12 = [v11 count];

  if (!v12 || v8 | v9 || (id)[(AllCollectionsAPIController *)self state] == (id)3)
  {
    v13 = [(AllCollectionsAPIController *)self stateHandler];
    v13[2](v13, [(AllCollectionsAPIController *)self state], 1);

    [(AllCollectionsAPIController *)self setState:1];
    v14 = +[MKMapService sharedService];
    uint64_t v15 = [(AllCollectionsAPIController *)self batchSize];
    v16 = [(AllCollectionsAPIController *)self traits];
    v17 = [v14 ticketForAllCollectionViewWithBatchSize:v15 keywordFilter:v8 addressFilter:v9 withTraits:v16];
    [(AllCollectionsAPIController *)self setTicket:v17];

    objc_initWeak(&location, self);
    v18 = sub_1003BFCA0();
    v19 = (char *)os_signpost_id_generate(v18);

    v20 = sub_1003BFCA0();
    v21 = v20;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v19, "FetchingAllCollectionsView", "", buf, 2u);
    }

    v22 = [(AllCollectionsAPIController *)self ticket];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1003BFCF4;
    v23[3] = &unk_1012E7C68;
    objc_copyWeak(v25, &location);
    v25[1] = v19;
    id v24 = v10;
    [v22 submitWithHandler:v23 networkActivity:&stru_1012E7C88];

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
}

- (void)cancelFetchingAllCollections
{
  id v3 = [(AllCollectionsAPIController *)self ticket];
  [v3 cancel];

  id v4 = [(AllCollectionsAPIController *)self batchTicket];
  [v4 cancel];
}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[MKMapService sharedService];
  unint64_t v9 = [(AllCollectionsAPIController *)self traits];
  id v10 = [v8 ticketForCuratedCollections:v6 isBatchLookup:1 traits:v9];
  [(AllCollectionsAPIController *)self setBatchTicket:v10];

  objc_initWeak(&location, self);
  v11 = sub_1003BFCA0();
  id v12 = (char *)os_signpost_id_generate(v11);

  v13 = sub_1003BFCA0();
  v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "FetchingAllCollectionsViewBatch", "", buf, 2u);
  }

  uint64_t v15 = [(AllCollectionsAPIController *)self batchTicket];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003C01F4;
  v17[3] = &unk_1012E71E0;
  objc_copyWeak(v19, &location);
  id v16 = v7;
  id v18 = v16;
  v19[1] = v12;
  [v15 submitWithHandler:v17 networkActivity:&stru_1012E7CA8];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MKMapServiceAllCollectionsViewTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (MKMapServiceCuratedCollectionTicket)batchTicket
{
  return self->_batchTicket;
}

- (void)setBatchTicket:(id)a3
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (void)setCollectionResults:(id)a3
{
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_stateHandler, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end