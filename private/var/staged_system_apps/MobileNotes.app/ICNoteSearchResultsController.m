@interface ICNoteSearchResultsController
- (BOOL)isUpToDateForInput:(id)a3 accountIdentifier:(id)a4;
- (ICNoteSearchResultsController)init;
- (ICSearchUserInput)previousSearchInput;
- (ICSelectorDelayer)searchDonationDelayer;
- (NSOperationQueue)queryOperationQueue;
- (NSString)donationSearchString;
- (NSString)previousAccountIdentifier;
- (void)cancelSearchQuery;
- (void)donateSearchIntent;
- (void)donateSearchIntentForSearchString:(id)a3;
- (void)performSearchWithInput:(id)a3 suggestionsResponder:(id)a4 accountIdentifier:(id)a5 modernResultsOnly:(BOOL)a6 updateHandler:(id)a7;
- (void)setDonationSearchString:(id)a3;
- (void)setPreviousAccountIdentifier:(id)a3;
- (void)setPreviousSearchInput:(id)a3;
- (void)setQueryOperationQueue:(id)a3;
- (void)setSearchDonationDelayer:(id)a3;
@end

@implementation ICNoteSearchResultsController

- (ICNoteSearchResultsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICNoteSearchResultsController;
  v2 = [(ICNoteSearchResultsController *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)+[ICSearchQueryOperation newOperationQueueWithName:@"com.apple.notes.search-query"];
    queryOperationQueue = v2->_queryOperationQueue;
    v2->_queryOperationQueue = v3;

    v5 = (ICSelectorDelayer *)[objc_alloc((Class)ICSelectorDelayer) initWithTarget:v2 selector:"donateSearchIntent" delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:1.0];
    searchDonationDelayer = v2->_searchDonationDelayer;
    v2->_searchDonationDelayer = v5;
  }
  return v2;
}

- (void)cancelSearchQuery
{
  v3 = [(ICNoteSearchResultsController *)self queryOperationQueue];
  [v3 cancelAllOperations];

  v4 = [(ICNoteSearchResultsController *)self searchDonationDelayer];
  [v4 cancelPreviousFireRequests];

  [(ICNoteSearchResultsController *)self setDonationSearchString:0];
  [(ICNoteSearchResultsController *)self setPreviousSearchInput:0];

  [(ICNoteSearchResultsController *)self setPreviousAccountIdentifier:0];
}

- (BOOL)isUpToDateForInput:(id)a3 accountIdentifier:(id)a4
{
  CFNullRef v6 = (const __CFNull *)a4;
  id v7 = a3;
  objc_super v8 = [(ICNoteSearchResultsController *)self previousSearchInput];
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    CFNullRef v10 = [(ICNoteSearchResultsController *)self previousAccountIdentifier];
    if (kCFNull == v6) {
      CFNullRef v11 = 0;
    }
    else {
      CFNullRef v11 = v6;
    }
    unint64_t v12 = v11;
    if (kCFNull == v10) {
      CFNullRef v13 = 0;
    }
    else {
      CFNullRef v13 = v10;
    }
    unint64_t v14 = v13;
    v15 = (void *)v14;
    if (v12 | v14)
    {
      if (v12) {
        BOOL v16 = v14 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16) {
        LOBYTE(v9) = 0;
      }
      else {
        LOBYTE(v9) = [(id)v12 isEqual:v14];
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)performSearchWithInput:(id)a3 suggestionsResponder:(id)a4 accountIdentifier:(id)a5 modernResultsOnly:(BOOL)a6 updateHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (![(ICNoteSearchResultsController *)self isUpToDateForInput:v12 accountIdentifier:v14])
  {
    [(ICNoteSearchResultsController *)self cancelSearchQuery];
    id v16 = [v12 copy];
    [(ICNoteSearchResultsController *)self setPreviousSearchInput:v16];

    [(ICNoteSearchResultsController *)self setPreviousAccountIdentifier:v14];
    if (([v12 isEmpty] & 1) == 0)
    {
      uint64_t v17 = [v12 searchString];
      v18 = (void *)v17;
      v19 = &stru_10063F3D8;
      if (v17) {
        v19 = (__CFString *)v17;
      }
      v20 = v19;

      [(ICNoteSearchResultsController *)self donateSearchIntentForSearchString:v20];
      id v21 = [objc_alloc((Class)ICSearchQueryOperation) initWithSearchSuggestionsResponder:v13 userInput:v12 performNLSearch:1 performTopHitSearch:1 modernResultsOnly:v8];
      +[ICSearchProfiler logProfilingWithMessage:@"ICSearchViewController startSearchQueryWithString: start" searchQueryOperation:v21];
      objc_initWeak(&location, v21);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10006ED2C;
      v23[3] = &unk_100626BE0;
      objc_copyWeak(&v27, &location);
      v25 = &stru_100626B68;
      id v24 = v14;
      id v26 = v15;
      [v21 setFoundItemsHandler:v23];
      v22 = [(ICNoteSearchResultsController *)self queryOperationQueue];
      [v22 addOperation:v21];

      +[ICSearchProfiler logProfilingWithMessage:@"ICSearchViewController startSearchQueryWithString: end" searchQueryOperation:v21];
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
}

- (void)donateSearchIntentForSearchString:(id)a3
{
  [(ICNoteSearchResultsController *)self setDonationSearchString:a3];
  id v4 = [(ICNoteSearchResultsController *)self searchDonationDelayer];
  [v4 requestFire];
}

- (void)donateSearchIntent
{
  id v4 = [(ICNoteSearchResultsController *)self donationSearchString];
  if ([v4 length])
  {
    v3 = +[ICIntentsUtilities interactionForSearchString:v4];
    +[ICIntentsUtilities donateInteraction:v3];
  }
  [(ICNoteSearchResultsController *)self setDonationSearchString:0];
}

- (ICSelectorDelayer)searchDonationDelayer
{
  return self->_searchDonationDelayer;
}

- (void)setSearchDonationDelayer:(id)a3
{
}

- (NSOperationQueue)queryOperationQueue
{
  return self->_queryOperationQueue;
}

- (void)setQueryOperationQueue:(id)a3
{
}

- (NSString)donationSearchString
{
  return self->_donationSearchString;
}

- (void)setDonationSearchString:(id)a3
{
}

- (ICSearchUserInput)previousSearchInput
{
  return self->_previousSearchInput;
}

- (void)setPreviousSearchInput:(id)a3
{
}

- (NSString)previousAccountIdentifier
{
  return self->_previousAccountIdentifier;
}

- (void)setPreviousAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_previousSearchInput, 0);
  objc_storeStrong((id *)&self->_donationSearchString, 0);
  objc_storeStrong((id *)&self->_queryOperationQueue, 0);

  objc_storeStrong((id *)&self->_searchDonationDelayer, 0);
}

@end