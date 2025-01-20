@interface NavSARAPIController
- (MKMapServiceCategoriesTicket)ticket;
- (NSArray)categories;
- (id)fetchCategoriesTicket;
- (void)cancelFetchingSARCategories;
- (void)fetchSARCategoriesOnCompletionHandler:(id)a3;
- (void)setCategories:(id)a3;
- (void)setTicket:(id)a3;
@end

@implementation NavSARAPIController

- (void)fetchSARCategoriesOnCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(NavSARAPIController *)self fetchCategoriesTicket];
  [(NavSARAPIController *)self setTicket:v5];

  objc_initWeak(&location, self);
  v6 = sub_1005393B0();
  v7 = (char *)os_signpost_id_generate(v6);

  v8 = sub_1005393B0();
  v9 = v8;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "FetchingSARCategories", "", buf, 2u);
  }

  v10 = [(NavSARAPIController *)self ticket];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100539404;
  v12[3] = &unk_1012E71E0;
  objc_copyWeak(v14, &location);
  v14[1] = v7;
  id v11 = v4;
  id v13 = v11;
  [v10 submitWithHandler:v12 networkActivity:0];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)cancelFetchingSARCategories
{
  id v2 = [(NavSARAPIController *)self ticket];
  [v2 cancel];
}

- (NSArray)categories
{
  return self->_categories;
}

- (id)fetchCategoriesTicket
{
  id v2 = +[MKMapService sharedService];
  v3 = [v2 defaultTraits];

  [v3 setNavigating:1];
  id v4 = +[MNNavigationService sharedService];
  if ([v4 isInNavigatingState]) {
    id v5 = [v4 navigationTransportType];
  }
  else {
    id v5 = [v4 desiredTransportType];
  }
  [v3 setNavigationTransportType:v5];
  v6 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  v7 = [v6 updatedTraitsForCurrentGarageState:v3];

  v8 = +[MKMapService sharedService];
  v9 = [v8 ticketForCategoryListWithTraits:v7 isFromNoQueryState:0];

  return v9;
}

- (MKMapServiceCategoriesTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (void)setCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

@end