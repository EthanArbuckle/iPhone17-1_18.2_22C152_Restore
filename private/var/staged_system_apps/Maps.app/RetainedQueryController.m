@interface RetainedQueryController
- (BOOL)hasRelevantRetainedSearchQuery;
- (GEORetainedSearchMetadata)restoredRetainedSearchQueryMetadata;
- (double)retainedSearchQueryAge;
- (void)_sendAnalyticsRetainedQueryEvent;
- (void)clearRetainedSearchQuery;
- (void)restoreIfNeededWithBlock:(id)a3;
- (void)retainSearchQuery:(id)a3 metadata:(id)a4 forTimeInterval:(double)a5;
- (void)retainSearchQueryForSelectedAutocompleteItem:(id)a3 query:(id)a4 forTimeInterval:(double)a5;
- (void)retainSearchQueryForSelectedSearchCompletion:(id)a3 query:(id)a4 forTimeInterval:(double)a5;
- (void)retainSearchQueryForSelectedSearchResult:(id)a3 query:(id)a4 forTimeInterval:(double)a5;
- (void)retainSearchQueryWithRetainedSearchMetadata:(id)a3 query:(id)a4 forTimeInterval:(double)a5;
- (void)setRestoredRetainedSearchQueryMetadata:(id)a3;
@end

@implementation RetainedQueryController

- (void)restoreIfNeededWithBlock:(id)a3
{
  v4 = (void (**)(id, SearchFieldItem *))a3;
  if ([(RetainedQueryController *)self hasRelevantRetainedSearchQuery])
  {
    v5 = sub_100109E50();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Restoring Retain Query", (uint8_t *)v7, 2u);
    }

    [(RetainedQueryController *)self _sendAnalyticsRetainedQueryEvent];
    v6 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v6 setSearchString:self->_retainedSearchQueryString];
    [(SearchFieldItem *)v6 setRetainedSearchMetadata:self->_retainedSearchQueryMetadata];
    v4[2](v4, v6);

    objc_storeStrong((id *)&self->_restoredRetainedSearchQueryMetadata, self->_retainedSearchQueryMetadata);
    v4 = (void (**)(id, SearchFieldItem *))v6;
  }
  else
  {
    [(RetainedQueryController *)self clearRetainedSearchQuery];
    v4[2](v4, 0);
  }
}

- (void)clearRetainedSearchQuery
{
  v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing Retain Query", v8, 2u);
  }

  retainedSearchQueryTimestamp = self->_retainedSearchQueryTimestamp;
  self->_retainedSearchQueryTimestamp = 0;

  retainedSearchQueryString = self->_retainedSearchQueryString;
  self->_retainedSearchQueryString = 0;

  retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;
  self->_retainedSearchQueryMetadata = 0;

  restoredRetainedSearchQueryMetadata = self->_restoredRetainedSearchQueryMetadata;
  self->_restoredRetainedSearchQueryMetadata = 0;

  self->_timeToRetainSearchQuery = 0.0;
}

- (BOOL)hasRelevantRetainedSearchQuery
{
  retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;
  if (retainedSearchQueryMetadata)
  {
    v2 = [(GEORetainedSearchMetadata *)self->_retainedSearchQueryMetadata sourceAppID];
    if (v2 == @"com.apple.Spotlight")
    {
      v2 = @"com.apple.Spotlight";
      if (self->_timeToRetainSearchQuery > 0.0)
      {
        BOOL v5 = 1;
        goto LABEL_11;
      }
    }
  }
  if (!self->_retainedSearchQueryString
    || !self->_retainedSearchQueryTimestamp
    || self->_timeToRetainSearchQuery <= 0.0)
  {
    BOOL v5 = 0;
    BOOL result = 0;
    if (!retainedSearchQueryMetadata) {
      return result;
    }
    goto LABEL_11;
  }
  [(RetainedQueryController *)self retainedSearchQueryAge];
  BOOL v5 = v6 < self->_timeToRetainSearchQuery;
  BOOL result = v5;
  if (retainedSearchQueryMetadata)
  {
LABEL_11:

    return v5;
  }
  return result;
}

- (void)_sendAnalyticsRetainedQueryEvent
{
  [(RetainedQueryController *)self retainedSearchQueryAge];
  id v5 = +[NSString stringWithFormat:@"{ \"age\": %lu, \"retainSearchTime\": %lu }", (unint64_t)(v3 * 1000.0), (unint64_t)(self->_timeToRetainSearchQuery * 1000.0)];
  v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2024 onTarget:11 eventValue:v5];
}

- (void)retainSearchQueryForSelectedSearchResult:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = [v12 retainedSearchMetadata];
  if (v9)
  {
    retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;

    if (!retainedSearchQueryMetadata)
    {
      v11 = [v12 retainedSearchMetadata];
      [(RetainedQueryController *)self retainSearchQueryWithRetainedSearchMetadata:v11 query:v8 forTimeInterval:a5];
    }
  }
}

- (void)retainSearchQueryWithRetainedSearchMetadata:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v12 = a4;
  id v8 = a3;
  v9 = [v8 _query];
  if (v9) {
    v10 = v9;
  }
  else {
    v10 = v12;
  }
  id v11 = v10;

  [(RetainedQueryController *)self retainSearchQuery:v11 metadata:v8 forTimeInterval:a5];
}

- (void)retainSearchQueryForSelectedAutocompleteItem:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v9 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(RetainedQueryController *)self retainSearchQueryForSelectedSearchCompletion:v9 query:v8 forTimeInterval:a5];
  }
  else {
    [(RetainedQueryController *)self retainSearchQueryWithRetainedSearchMetadata:0 query:v8 forTimeInterval:a5];
  }
}

- (void)retainSearchQueryForSelectedSearchCompletion:(id)a3 query:(id)a4 forTimeInterval:(double)a5
{
  id v8 = a4;
  id v9 = [a3 retainedSearchMetadata];
  [(RetainedQueryController *)self retainSearchQueryWithRetainedSearchMetadata:v9 query:v8 forTimeInterval:a5];
}

- (void)retainSearchQuery:(id)a3 metadata:(id)a4 forTimeInterval:(double)a5
{
  id v14 = a3;
  id v8 = (GEORetainedSearchMetadata *)a4;
  id v9 = +[NSDate date];
  retainedSearchQueryTimestamp = self->_retainedSearchQueryTimestamp;
  self->_retainedSearchQueryTimestamp = v9;

  id v11 = [v14 length];
  retainedSearchQueryString = (NSString *)v14;
  if (!v11)
  {
    if ([(NSString *)self->_retainedSearchQueryString length]) {
      retainedSearchQueryString = self->_retainedSearchQueryString;
    }
    else {
      retainedSearchQueryString = 0;
    }
  }
  objc_storeStrong((id *)&self->_retainedSearchQueryString, retainedSearchQueryString);
  retainedSearchQueryMetadata = self->_retainedSearchQueryMetadata;
  self->_retainedSearchQueryMetadata = v8;

  self->_timeToRetainSearchQuery = a5;
}

- (double)retainedSearchQueryAge
{
  [(NSDate *)self->_retainedSearchQueryTimestamp timeIntervalSinceNow];
  return -v2;
}

- (GEORetainedSearchMetadata)restoredRetainedSearchQueryMetadata
{
  return self->_restoredRetainedSearchQueryMetadata;
}

- (void)setRestoredRetainedSearchQueryMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoredRetainedSearchQueryMetadata, 0);
  objc_storeStrong((id *)&self->_retainedSearchQueryMetadata, 0);
  objc_storeStrong((id *)&self->_retainedSearchQueryTimestamp, 0);

  objc_storeStrong((id *)&self->_retainedSearchQueryString, 0);
}

@end