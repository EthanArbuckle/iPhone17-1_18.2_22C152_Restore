@interface PublisherAPIController
- (GEOMapServiceTraits)traits;
- (GEOPublisherResult)publisherResult;
- (MKMapItemIdentifier)publisherId;
- (MKMapServiceCuratedCollectionTicket)batchTicket;
- (MKMapServicePublisherViewTicket)ticket;
- (NSArray)collectionIds;
- (NSArray)collectionResults;
- (NSArray)filters;
- (NSArray)placeCollections;
- (PublisherAPIController)initWithPublisherId:(id)a3 usingOnStateChangeHandler:(id)a4 usingTraits:(id)a5;
- (id)placeCollectionsFromLastBatch;
- (id)publisherViewResultFilters;
- (id)stateHandler;
- (int64_t)state;
- (unsigned)batchSize;
- (void)cancelFetchingPublisher;
- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchPublisherViewForKeywordFilter:(id)a3 addressFilter:(id)a4 onCompletion:(id)a5;
- (void)setBatchTicket:(id)a3;
- (void)setCollectionIds:(id)a3;
- (void)setCollectionResults:(id)a3;
- (void)setFilters:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setPublisherId:(id)a3;
- (void)setPublisherResult:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateHandler:(id)a3;
- (void)setTicket:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation PublisherAPIController

- (PublisherAPIController)initWithPublisherId:(id)a3 usingOnStateChangeHandler:(id)a4 usingTraits:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PublisherAPIController;
  v12 = [(PublisherAPIController *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_publisherId, a3);
    id v14 = objc_retainBlock(v10);
    id stateHandler = v13->_stateHandler;
    v13->_id stateHandler = v14;

    objc_storeStrong((id *)&v13->_traits, a5);
    v13->_state = 0;
  }

  return v13;
}

- (void)fetchPublisherViewForKeywordFilter:(id)a3 addressFilter:(id)a4 onCompletion:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  id v11 = [(PublisherAPIController *)self filters];
  id v12 = [v11 count];

  if (!v12 || v8 | v9 || (id)[(PublisherAPIController *)self state] == (id)3)
  {
    v13 = [(PublisherAPIController *)self stateHandler];
    v13[2](v13, [(PublisherAPIController *)self state], 1);

    [(PublisherAPIController *)self setState:1];
    id v14 = +[MKMapService sharedService];
    v15 = [(PublisherAPIController *)self publisherId];
    uint64_t v16 = [(PublisherAPIController *)self batchSize];
    objc_super v17 = [(PublisherAPIController *)self traits];
    v18 = [v14 ticketForPublisherViewPublisherIdentifier:v15 keywordFilter:v8 addressFilter:v9 batchSize:v16 withTraits:v17];
    [(PublisherAPIController *)self setTicket:v18];

    objc_initWeak(&location, self);
    v19 = sub_100969A20();
    v20 = (char *)os_signpost_id_generate(v19);

    v21 = sub_100969A20();
    v22 = v21;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v20, "FetchingPublisherView", "", buf, 2u);
    }

    v23 = [(PublisherAPIController *)self ticket];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100969A74;
    v24[3] = &unk_101303730;
    objc_copyWeak(v26, &location);
    v26[1] = v20;
    v24[4] = self;
    id v25 = v10;
    [v23 submitWithHandler:v24 networkActivity:&stru_101303750];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
}

- (void)cancelFetchingPublisher
{
  v3 = [(PublisherAPIController *)self ticket];
  [v3 cancel];

  id v4 = [(PublisherAPIController *)self batchTicket];
  [v4 cancel];
}

- (id)publisherViewResultFilters
{
  return self->_filters;
}

- (NSArray)collectionResults
{
  return self->_collectionResults;
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (id)placeCollectionsFromLastBatch
{
  v2 = [(PublisherAPIController *)self placeCollections];
  id v3 = [v2 copy];

  return v3;
}

- (unsigned)batchSize
{
  return 10;
}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[MKMapService sharedService];
  unint64_t v9 = [(PublisherAPIController *)self traits];
  id v10 = [v8 ticketForCuratedCollections:v6 isBatchLookup:1 traits:v9];
  [(PublisherAPIController *)self setBatchTicket:v10];

  objc_initWeak(&location, self);
  id v11 = sub_100969A20();
  id v12 = (char *)os_signpost_id_generate(v11);

  v13 = sub_100969A20();
  id v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "FetchingPublisherViewBatch", "", buf, 2u);
  }

  v15 = [(PublisherAPIController *)self batchTicket];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10096A080;
  v17[3] = &unk_1012E71E0;
  objc_copyWeak(v19, &location);
  id v16 = v7;
  id v18 = v16;
  v19[1] = v12;
  [v15 submitWithHandler:v17 networkActivity:&stru_101303770];

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

- (MKMapItemIdentifier)publisherId
{
  return self->_publisherId;
}

- (void)setPublisherId:(id)a3
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

- (MKMapServicePublisherViewTicket)ticket
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

- (void)setPublisherResult:(id)a3
{
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_publisherId, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end