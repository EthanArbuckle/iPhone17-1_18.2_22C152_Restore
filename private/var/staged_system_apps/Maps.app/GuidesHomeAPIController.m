@interface GuidesHomeAPIController
- (BOOL)isCuratedGuidesHome;
- (BOOL)isFilteredGuidesHome;
- (GEOGuideLocation)guideLocation;
- (GEOGuidesHomeResult)guideHomeResult;
- (GEOGuidesHomeResultFilterTypeConcept)filter;
- (GEOMapServiceTraits)traits;
- (GEOPlaceCollection)singlePlaceCollection;
- (GuidesHomeAPIController)initWithGuideLocation:(id)a3 onStateChangeHandler:(id)a4 traits:(id)a5;
- (MKMapServiceCuratedCollectionTicket)batchTicket;
- (MKMapServiceGuideHomeViewTicket)ticket;
- (NSArray)filteredCollections;
- (NSArray)filteredCollectionsIds;
- (NSArray)placeCollections;
- (id)guideHomeFilteredCollectionResults;
- (id)guideHomeFilteredCollectionResultsIds;
- (id)guideHomeSingleCollectionIdentifier;
- (id)guideLocationName;
- (id)stateHandler;
- (int64_t)state;
- (void)cancelFetchingGuideHome;
- (void)clearFilteredData;
- (void)fetchGuidesHomeViewFilteredBy:(id)a3 onCompletion:(id)a4;
- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)initializeSingleCollectionFromResponseIfApplicable;
- (void)refreshWithGuideLocation:(id)a3;
- (void)setBatchTicket:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilteredCollections:(id)a3;
- (void)setFilteredCollectionsIds:(id)a3;
- (void)setGuideHomeResult:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setSinglePlaceCollection:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateHandler:(id)a3;
- (void)setTicket:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation GuidesHomeAPIController

- (GuidesHomeAPIController)initWithGuideLocation:(id)a3 onStateChangeHandler:(id)a4 traits:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GuidesHomeAPIController;
  v12 = [(GuidesHomeAPIController *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_guideLocation, a3);
    id v14 = objc_retainBlock(v10);
    id stateHandler = v13->_stateHandler;
    v13->_id stateHandler = v14;

    objc_storeStrong((id *)&v13->_traits, a5);
    v13->_state = 0;
  }

  return v13;
}

- (void)cancelFetchingGuideHome
{
  [(GuidesHomeAPIController *)self clearFilteredData];
  v3 = [(GuidesHomeAPIController *)self batchTicket];
  [v3 cancel];

  id v4 = [(GuidesHomeAPIController *)self ticket];
  [v4 cancel];
}

- (void)refreshWithGuideLocation:(id)a3
{
  objc_storeStrong((id *)&self->_guideLocation, a3);
  id v5 = a3;
  guideHomeResult = self->_guideHomeResult;
  self->_guideHomeResult = 0;

  [(GuidesHomeAPIController *)self cancelFetchingGuideHome];
}

- (void)fetchGuidesHomeViewFilteredBy:(id)a3 onCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  [(GuidesHomeAPIController *)self setFilter:v6];
  if (v6
    || ([(GuidesHomeAPIController *)self guideHomeResult],
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    v8 = [(GuidesHomeAPIController *)self stateHandler];
    v8[2](v8, [(GuidesHomeAPIController *)self state], 1);

    [(GuidesHomeAPIController *)self setState:1];
    id v9 = +[MKMapService sharedService];
    id v10 = [(GuidesHomeAPIController *)self guideLocation];
    id v11 = [(GuidesHomeAPIController *)self traits];
    v12 = [v9 ticketForGuideHomeWithFilter:v6 guideLocation:v10 withTraits:v11];
    [(GuidesHomeAPIController *)self setTicket:v12];

    objc_initWeak(&location, self);
    v13 = sub_1003A3F78();
    id v14 = (char *)os_signpost_id_generate(v13);

    v15 = sub_1003A3F78();
    v16 = v15;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "FetchingGuidesHomeView", "", buf, 2u);
    }

    objc_super v17 = [(GuidesHomeAPIController *)self ticket];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1003A3FCC;
    v20[3] = &unk_1012E72E8;
    v23[1] = v14;
    objc_copyWeak(v23, &location);
    id v21 = v6;
    v22 = v7;
    [v17 submitWithHandler:v20 networkActivity:0];

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
  else
  {
    [(GuidesHomeAPIController *)self clearFilteredData];
    v19 = [(GuidesHomeAPIController *)self stateHandler];
    v19[2](v19, [(GuidesHomeAPIController *)self state], 2);

    [(GuidesHomeAPIController *)self setState:2];
    v7[2](v7);
  }
}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MKMapService sharedService];
  id v9 = [(GuidesHomeAPIController *)self traits];
  id v10 = [v8 ticketForCuratedCollections:v6 isBatchLookup:1 traits:v9];
  [(GuidesHomeAPIController *)self setBatchTicket:v10];

  objc_initWeak(&location, self);
  id v11 = sub_1003A3F78();
  v12 = (char *)os_signpost_id_generate(v11);

  v13 = sub_1003A3F78();
  id v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "FetchingGuidesHomeViewBatch", "", buf, 2u);
  }

  v15 = [(GuidesHomeAPIController *)self batchTicket];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003A43F4;
  v17[3] = &unk_1012E71E0;
  v19[1] = v12;
  objc_copyWeak(v19, &location);
  id v16 = v7;
  id v18 = v16;
  [v15 submitWithHandler:v17 networkActivity:&stru_1012E7308];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)clearFilteredData
{
  [(GuidesHomeAPIController *)self setFilteredCollections:0];

  [(GuidesHomeAPIController *)self setFilteredCollectionsIds:0];
}

- (void)initializeSingleCollectionFromResponseIfApplicable
{
  v3 = [(GuidesHomeAPIController *)self guideHomeResult];
  id v4 = [v3 repeatableSections];
  id v5 = [v4 count];

  if ((unint64_t)v5 <= 1)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [(GuidesHomeAPIController *)self guideHomeResult];
    v8 = [v7 repeatableSections];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003A46A0;
    v14[3] = &unk_1012E7330;
    id v9 = v6;
    id v15 = v9;
    [v8 enumerateObjectsUsingBlock:v14];

    id v10 = [v9 firstObject];
    if ([v9 count] == (id)1)
    {
      id v11 = [v10 collection];

      if (v11)
      {
        v12 = [v10 collection];
        singlePlaceCollection = self->_singlePlaceCollection;
        self->_singlePlaceCollection = v12;
      }
    }
  }
}

- (id)guideHomeFilteredCollectionResults
{
  return [(GuidesHomeAPIController *)self filteredCollections];
}

- (id)guideHomeFilteredCollectionResultsIds
{
  return [(GuidesHomeAPIController *)self filteredCollectionsIds];
}

- (id)guideLocationName
{
  v3 = [(GuidesHomeAPIController *)self guideLocation];
  id v4 = [v3 title];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(GuidesHomeAPIController *)self guideHomeViewResult];
    id v7 = [(GuidesHomeAPIController *)self guideLocation];
    id v5 = [v6 guideLocationName:v7];
  }

  return v5;
}

- (BOOL)isCuratedGuidesHome
{
  v2 = [(GuidesHomeAPIController *)self guideHomeResult];
  v3 = [v2 featuredGuidesSection];
  id v4 = [v3 featuredGuides];
  id v5 = [v4 firstObject];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)isFilteredGuidesHome
{
  v2 = [(GuidesHomeAPIController *)self filter];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)guideHomeSingleCollectionIdentifier
{
  BOOL v3 = [(GuidesHomeAPIController *)self singlePlaceCollection];

  if (v3)
  {
    id v4 = objc_alloc((Class)MKMapItemIdentifier);
    id v5 = [(GuidesHomeAPIController *)self singlePlaceCollection];
    BOOL v6 = [v5 collectionIdentifier];
    id v7 = [v4 initWithGEOMapItemIdentifier:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
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

- (MKMapServiceGuideHomeViewTicket)ticket
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

- (GEOGuidesHomeResult)guideHomeResult
{
  return self->_guideHomeResult;
}

- (void)setGuideHomeResult:(id)a3
{
}

- (NSArray)filteredCollections
{
  return self->_filteredCollections;
}

- (void)setFilteredCollections:(id)a3
{
}

- (NSArray)filteredCollectionsIds
{
  return self->_filteredCollectionsIds;
}

- (void)setFilteredCollectionsIds:(id)a3
{
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (GEOGuidesHomeResultFilterTypeConcept)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (GEOPlaceCollection)singlePlaceCollection
{
  return self->_singlePlaceCollection;
}

- (void)setSinglePlaceCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singlePlaceCollection, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_filteredCollectionsIds, 0);
  objc_storeStrong((id *)&self->_filteredCollections, 0);
  objc_storeStrong((id *)&self->_guideHomeResult, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong(&self->_stateHandler, 0);

  objc_storeStrong((id *)&self->_guideLocation, 0);
}

@end