@interface SearchResultsHistoryRecorder
- (BOOL)hasRefinedMapItems;
- (MKMapServiceSearchTicket)ticket;
- (MSPMutableHistoryEntrySearch)searchRequestHistoryItem;
- (NSArray)searchResults;
- (SearchResultsHistoryRecorder)initWithTicket:(id)a3 searchResults:(id)a4 auxiliaryControlsOrigin:(int64_t)a5 hasRefinedMapItems:(BOOL)a6 tracksRAPReportingOnly:(BOOL)a7 completionTitle:(id)a8;
- (int64_t)auxiliaryControlsOrigin;
- (void)recordItemInHistory;
- (void)recordItemInHistoryWithCompletion:(id)a3;
- (void)setAuxiliaryControlsOrigin:(int64_t)a3;
- (void)setTicket:(id)a3;
@end

@implementation SearchResultsHistoryRecorder

- (SearchResultsHistoryRecorder)initWithTicket:(id)a3 searchResults:(id)a4 auxiliaryControlsOrigin:(int64_t)a5 hasRefinedMapItems:(BOOL)a6 tracksRAPReportingOnly:(BOOL)a7 completionTitle:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)SearchResultsHistoryRecorder;
  v18 = [(SearchResultsHistoryRecorder *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_ticket, a3);
    v20 = (NSArray *)[v16 copy];
    searchResults = v19->_searchResults;
    v19->_searchResults = v20;

    v19->_auxiliaryControlsOrigin = a5;
    v19->_hasRefinedMapItems = a6;
    id v22 = objc_alloc((Class)MSPMutableHistoryEntrySearch);
    v23 = [(SearchResultsHistoryRecorder *)v19 ticket];
    v24 = (MSPMutableHistoryEntrySearch *)[v22 initWithTicket:v23 completionTitle:v17];
    searchRequestHistoryItem = v19->_searchRequestHistoryItem;
    v19->_searchRequestHistoryItem = v24;

    [(MSPMutableHistoryEntrySearch *)v19->_searchRequestHistoryItem setTracksRAPReportingOnly:v9];
  }

  return v19;
}

- (void)recordItemInHistory
{
}

- (void)recordItemInHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100103F1C;
  v23 = sub_100104818;
  id v24 = 0;
  v5 = [(SearchResultsHistoryRecorder *)self searchRequestHistoryItem];
  v6 = [v5 query];

  v7 = [(SearchResultsHistoryRecorder *)self searchResults];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100769838;
  v16[3] = &unk_1012F7C28;
  v18 = &v19;
  id v8 = v6;
  id v17 = v8;
  [v7 enumerateObjectsUsingBlock:v16];

  uint64_t v9 = v20[5];
  if (v9)
  {
    v10 = [(SearchResultsHistoryRecorder *)self searchRequestHistoryItem];
    [v10 setLocationDisplayString:v9];

    v11 = +[NSDate date];
    v12 = [(SearchResultsHistoryRecorder *)self searchRequestHistoryItem];
    [v12 setUsageDate:v11];
  }
  if (![(SearchResultsHistoryRecorder *)self hasRefinedMapItems])
  {
    v13 = [(SearchResultsHistoryRecorder *)self searchRequestHistoryItem];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10076997C;
    v14[3] = &unk_1012F7C50;
    id v15 = v4;
    +[HistoryEntryRecentsItem saveSearch:v13 completion:v14];
  }
  _Block_object_dispose(&v19, 8);
}

- (MSPMutableHistoryEntrySearch)searchRequestHistoryItem
{
  return self->_searchRequestHistoryItem;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (BOOL)hasRefinedMapItems
{
  return self->_hasRefinedMapItems;
}

- (MKMapServiceSearchTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (int64_t)auxiliaryControlsOrigin
{
  return self->_auxiliaryControlsOrigin;
}

- (void)setAuxiliaryControlsOrigin:(int64_t)a3
{
  self->_auxiliaryControlsOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);

  objc_storeStrong((id *)&self->_searchRequestHistoryItem, 0);
}

@end