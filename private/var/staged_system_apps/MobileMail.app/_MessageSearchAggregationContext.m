@interface _MessageSearchAggregationContext
- (NSOrderedSet)allFoundRanges;
- (void)finishedSearching;
- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5;
- (void)invalidate;
- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4;
- (void)webProcessDidBlockLoadingResourceWithURL:(id)a3;
- (void)webProcessDidFailLoadingResourceWithURL:(id)a3;
- (void)webProcessDidFinishDocumentLoadForURL:(id)a3 andRequestedRemoteURLs:(id)a4;
- (void)webProcessDidFinishLoadForURL:(id)a3;
- (void)webProcessFailedToLoadResourceWithProxyForURL:(id)a3 failureReason:(int64_t)a4;
@end

@implementation _MessageSearchAggregationContext

- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  id v10 = a3;
  if (self)
  {
    v6 = self->_foundRanges;
    itemID = self->_itemID;
  }
  else
  {
    v6 = 0;
    itemID = 0;
  }
  v8 = itemID;
  v9 = sub_10006C578((uint64_t)ConversationSearchTextRange, v10, v8);
  [(NSMutableOrderedSet *)v6 addObject:v9];
}

- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  id v9 = a3;
  if (self)
  {
    v5 = self->_foundRanges;
    itemID = self->_itemID;
  }
  else
  {
    v5 = 0;
    itemID = 0;
  }
  v7 = itemID;
  v8 = sub_10006C578((uint64_t)ConversationSearchTextRange, v9, v7);
  [(NSMutableOrderedSet *)v5 removeObject:v8];
}

- (void)invalidate
{
  if (self) {
    self = (_MessageSearchAggregationContext *)self->_foundRanges;
  }
  [(_MessageSearchAggregationContext *)self removeAllObjects];
}

- (void)finishedSearching
{
}

- (NSOrderedSet)allFoundRanges
{
  if (self) {
    self = (_MessageSearchAggregationContext *)self->_foundRanges;
  }
  return (NSOrderedSet *)self;
}

- (void)webProcessDidBlockLoadingResourceWithURL:(id)a3
{
  id v4 = a3;
  sub_100068CD4();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      itemID = self->_itemID;
    }
    else {
      itemID = 0;
    }
    v7 = itemID;
    v8 = [v4 absoluteString];
    id v9 = +[EFPrivacy fullyRedactedStringForString:v8];
    int v10 = 136315650;
    v11 = "-[_MessageSearchAggregationContext webProcessDidBlockLoadingResourceWithURL:]";
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: itemID:%{public}@, url:%{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)webProcessDidFailLoadingResourceWithURL:(id)a3
{
  id v4 = a3;
  sub_100068CD4();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      itemID = self->_itemID;
    }
    else {
      itemID = 0;
    }
    v7 = itemID;
    v8 = [v4 absoluteString];
    id v9 = +[EFPrivacy fullyRedactedStringForString:v8];
    int v10 = 136315650;
    v11 = "-[_MessageSearchAggregationContext webProcessDidFailLoadingResourceWithURL:]";
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: itemID:%{public}@, url:%{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)webProcessDidFinishDocumentLoadForURL:(id)a3 andRequestedRemoteURLs:(id)a4
{
  id v5 = a3;
  sub_100068CD4();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (self) {
      itemID = self->_itemID;
    }
    else {
      itemID = 0;
    }
    v8 = itemID;
    id v9 = [v5 absoluteString];
    int v10 = +[EFPrivacy fullyRedactedStringForString:v9];
    int v11 = 136315650;
    __int16 v12 = "-[_MessageSearchAggregationContext webProcessDidFinishDocumentLoadForURL:andRequestedRemoteURLs:]";
    __int16 v13 = 2114;
    __int16 v14 = v8;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: itemID:%{public}@, url:%{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)webProcessDidFinishLoadForURL:(id)a3
{
  id v4 = a3;
  if (self) {
    loadingController = self->_loadingController;
  }
  else {
    loadingController = 0;
  }
  v6 = loadingController;
  v7 = [(MFWebViewLoadingController *)v6 webView];

  sub_100068CD4();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      itemID = self->_itemID;
    }
    else {
      itemID = 0;
    }
    int v10 = itemID;
    int v11 = [v4 absoluteString];
    __int16 v12 = +[EFPrivacy fullyRedactedStringForString:v11];
    int v15 = 136315906;
    v16 = "-[_MessageSearchAggregationContext webProcessDidFinishLoadForURL:]";
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2114;
    v20 = v12;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: itemID:%{public}@, url:%{public}@, webview: %@", (uint8_t *)&v15, 0x2Au);
  }
  if (self)
  {
    __int16 v13 = self->_searchString;
    searchOptions = self->_searchOptions;
  }
  else
  {
    __int16 v13 = 0;
    searchOptions = 0;
  }
  [v7 performTextSearchWithQueryString:v13 usingOptions:searchOptions resultAggregator:self];
}

- (void)webProcessFailedToLoadResourceWithProxyForURL:(id)a3 failureReason:(int64_t)a4
{
  id v6 = a3;
  sub_100068CD4();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      itemID = self->_itemID;
    }
    else {
      itemID = 0;
    }
    id v9 = itemID;
    int v10 = [v6 absoluteString];
    int v11 = +[EFPrivacy fullyRedactedStringForString:v10];
    int v12 = 136315906;
    __int16 v13 = "-[_MessageSearchAggregationContext webProcessFailedToLoadResourceWithProxyForURL:failureReason:]";
    __int16 v14 = 2114;
    int v15 = v9;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: itemID:%{public}@ reason:%ld  %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchOptions, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong((id *)&self->_foundRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end