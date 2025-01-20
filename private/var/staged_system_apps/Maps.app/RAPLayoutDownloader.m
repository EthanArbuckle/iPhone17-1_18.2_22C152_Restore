@interface RAPLayoutDownloader
- (RAPLayoutDownloader)initWithLayoutOptions:(id)a3;
- (id)_extractLayoutFormFromResponse:(id)a3;
- (id)_generateRequestParams;
- (int)_geoFormTypeForOptions;
- (void)cancel;
- (void)fetchLayoutConfig:(id)a3;
@end

@implementation RAPLayoutDownloader

- (RAPLayoutDownloader)initWithLayoutOptions:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPLayoutDownloader;
  v6 = [(RAPLayoutDownloader *)&v11 init];
  if (v6)
  {
    v7 = +[MKMapService sharedService];
    uint64_t v8 = [v7 defaultTraits];
    traits = v6->_traits;
    v6->_traits = (GEOMapServiceTraits *)v8;

    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v6;
}

- (void)cancel
{
  ticket = self->_ticket;
  if (ticket)
  {
    [(GEOMapServiceFeedbackReportTicket *)ticket cancel];
    v4 = self->_ticket;
    self->_ticket = 0;
  }
}

- (id)_generateRequestParams
{
  id v3 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  v4 = [(RAPLayoutOptions *)self->_options initialLayoutParameters];
  [v3 setLayoutConfigParameters:v4];

  return v3;
}

- (void)fetchLayoutConfig:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  int BOOL = GEOConfigGetBOOL();
  char v6 = BOOL;
  if (BOOL
    && (+[RAPLayoutCache configForLayoutType:[(RAPLayoutOptions *)self->_options layoutType]], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = (void *)v7;
    v4[2](v4, v7, 0);
  }
  else
  {
    if (self->_ticket) {
      [(RAPLayoutDownloader *)self cancel];
    }
    v9 = [(RAPLayoutDownloader *)self _generateRequestParams];
    v10 = [(RAPLayoutOptions *)self->_options reportedMapItem];
    objc_super v11 = [v10 _geoMapItem];
    v12 = +[MSPFeedbackSubmissionTicket ticketForFeedbackRequestParameters:v9 mapItem:v11 traits:self->_traits];
    ticket = self->_ticket;
    self->_ticket = v12;

    objc_initWeak(&location, self);
    v14 = self->_ticket;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1006DAA24;
    v15[3] = &unk_1012F54E0;
    objc_copyWeak(&v17, &location);
    char v18 = v6;
    v16 = v4;
    [(GEOMapServiceFeedbackReportTicket *)v14 submitWithHandler:v15 networkActivity:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (id)_extractLayoutFormFromResponse:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RAPLayoutDownloader *)self _geoFormTypeForOptions];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v6 = [v4 feedbackResult];
  uint64_t v7 = [v6 layoutConfigResult];
  uint64_t v8 = [v7 forms];

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 formType] == v5)
        {
          id v14 = v13;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (int)_geoFormTypeForOptions
{
  unint64_t v2 = [(RAPLayoutOptions *)self->_options layoutType];
  if (v2 > 5) {
    return 0;
  }
  else {
    return dword_100F71AF8[v2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

@end