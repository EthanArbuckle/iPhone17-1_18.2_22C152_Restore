@interface UGCSubmissionLookupTicket
- (void)cancel;
- (void)fetchSubmissionForMuid:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5;
@end

@implementation UGCSubmissionLookupTicket

- (void)fetchSubmissionForMuid:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(UGCSubmissionLookupTicket *)self cancel];
  id v10 = v8;
  id v11 = objc_alloc_init((Class)GEORPFilter);
  [v11 setPlaceMuid:a3];
  id v12 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
  [v12 setFilter:v11];
  [v12 addFeedbackComponentType:4];
  id v13 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  [v13 setQueryParameters:v12];
  id v14 = objc_alloc((Class)GEORPFeedbackRequest);
  v15 = +[MKMapService sharedService];
  v16 = [v15 defaultTraits];
  id v17 = [v14 initWithFeedbackRequestParameters:v13 traits:v16];

  [v17 setUserInfo:v10];
  v18 = +[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:v17];
  ticket = self->_ticket;
  self->_ticket = v18;

  objc_initWeak(&location, self);
  v20 = self->_ticket;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1005D53A4;
  v22[3] = &unk_1012F1720;
  objc_copyWeak(v24, &location);
  v24[1] = (id)a3;
  id v21 = v9;
  id v23 = v21;
  [(GEOMapServiceFeedbackReportTicket *)v20 submitWithHandler:v22 networkActivity:0];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end