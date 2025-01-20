@interface CitySelectorAPIController
- (BOOL)isWorldwideSection:(id)a3;
- (CitySelectorAPIController)initWithStateChangeHandler:(id)a3 usingTraits:(id)a4;
- (GEOAllGuidesLocationsViewResult)result;
- (GEOMapServiceGuideLocationsLookupTicket)batchTicket;
- (GEOMapServiceTraits)traits;
- (MKMapServiceCitySelectorViewTicket)ticket;
- (NSArray)guideLocations;
- (NSArray)sections;
- (id)citySelectorSections;
- (id)guideLocationsFromLastBatch;
- (id)stateHandler;
- (id)titleForSection:(id)a3;
- (int64_t)state;
- (unsigned)batchSize;
- (void)cancelFetchingCitySelectorView;
- (void)fetchCitySelectorView:(id)a3;
- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)setBatchTicket:(id)a3;
- (void)setGuideLocations:(id)a3;
- (void)setResult:(id)a3;
- (void)setSections:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateHandler:(id)a3;
- (void)setTicket:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation CitySelectorAPIController

- (CitySelectorAPIController)initWithStateChangeHandler:(id)a3 usingTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CitySelectorAPIController;
  v8 = [(CitySelectorAPIController *)&v12 init];
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

- (id)citySelectorSections
{
  v2 = [(CitySelectorAPIController *)self sections];
  id v3 = [v2 copy];

  return v3;
}

- (id)titleForSection:(id)a3
{
  return [a3 sectionTitle];
}

- (BOOL)isWorldwideSection:(id)a3
{
  return _[a3 isWorldwideSection];
}

- (id)guideLocationsFromLastBatch
{
  v2 = [(CitySelectorAPIController *)self guideLocations];
  id v3 = [v2 copy];

  return v3;
}

- (unsigned)batchSize
{
  return 10;
}

- (void)fetchCitySelectorView:(id)a3
{
  id v4 = a3;
  v5 = [(CitySelectorAPIController *)self stateHandler];
  v5[2](v5, [(CitySelectorAPIController *)self state], 1);

  [(CitySelectorAPIController *)self setState:1];
  id v6 = +[MKMapService sharedService];
  id v7 = [(CitySelectorAPIController *)self traits];
  v8 = [v6 ticketForCitySelectorViewWithTraits:v7 batchSize:[self batchSize]];
  [(CitySelectorAPIController *)self setTicket:v8];

  objc_initWeak(&location, self);
  id v9 = sub_10047BB60();
  v10 = (char *)os_signpost_id_generate(v9);

  v11 = sub_10047BB60();
  objc_super v12 = v11;
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "FetchingCitySelectorView", "", buf, 2u);
  }

  v13 = [(CitySelectorAPIController *)self ticket];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10047BBB4;
  v15[3] = &unk_1012EB7D0;
  v17[1] = v10;
  objc_copyWeak(v17, &location);
  id v14 = v4;
  id v16 = v14;
  [v13 submitWithHandler:v15 networkActivity:&stru_1012EB7F0];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)cancelFetchingCitySelectorView
{
  id v2 = [(CitySelectorAPIController *)self ticket];
  [v2 cancel];
}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray();
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10047C0E0;
  v25[3] = &unk_1012EB840;
  objc_copyWeak(&v27, &location);
  id v10 = v9;
  id v26 = v10;
  [v6 enumerateObjectsUsingBlock:v25];
  id v11 = [v6 count];
  if (v11 == [v10 count])
  {
    objc_super v12 = +[GEOMapService sharedService];
    v13 = [(CitySelectorAPIController *)self traits];
    id v14 = [v12 ticketForGuideLocationLookupWithIds:v10 identifiers:v8 traits:v13];
    [(CitySelectorAPIController *)self setBatchTicket:v14];

    v15 = sub_10047BB60();
    id v16 = (char *)os_signpost_id_generate(v15);

    v17 = sub_10047BB60();
    v18 = v17;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v16, "FetchingCitySelectorViewBatch", "", buf, 2u);
    }

    v19 = [(CitySelectorAPIController *)self batchTicket];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10047C254;
    v21[3] = &unk_1012E71E0;
    objc_copyWeak(v23, &location);
    id v22 = v7;
    v23[1] = v16;
    [v19 submitWithHandler:v21 networkActivity:0];

    objc_destroyWeak(v23);
  }
  else
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
    v20 = sub_10057611C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error fetching a batch for city selector.", buf, 2u);
    }
  }
  objc_destroyWeak(&v27);
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

- (MKMapServiceCitySelectorViewTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (GEOMapServiceGuideLocationsLookupTicket)batchTicket
{
  return self->_batchTicket;
}

- (void)setBatchTicket:(id)a3
{
}

- (GEOAllGuidesLocationsViewResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)guideLocations
{
  return self->_guideLocations;
}

- (void)setGuideLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocations, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_stateHandler, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end