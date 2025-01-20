@interface SearchHomeNoDataDataFetcher
- (BOOL)isFetchingDataComplete;
- (NSArray)dataProviders;
- (SearchHomeDataFetcherDelegate)delegate;
- (SearchHomeNoDataDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4;
- (void)fetchContent;
- (void)setDataProviders:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SearchHomeNoDataDataFetcher

- (SearchHomeNoDataDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeNoDataDataFetcher;
  v6 = [(SearchHomeNoDataDataFetcher *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isFetchingDataComplete = 1;
    objc_storeWeak((id *)&v6->_delegate, v5);
  }

  return v7;
}

- (void)fetchContent
{
  v3 = [(SearchHomeNoDataDataFetcher *)self dataProviders];

  if (!v3)
  {
    v4 = [SearchHomeNoDataDataProvider alloc];
    CFStringRef v10 = @"SearchHomeNoData";
    id v5 = +[NSArray arrayWithObjects:&v10 count:1];
    v6 = [(SearchHomeNoDataDataProvider *)v4 initWithObjects:v5 type:0 identifier:@"SearchHomeNoData" title:&stru_101324E70];

    objc_super v9 = v6;
    v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [(SearchHomeNoDataDataFetcher *)self setDataProviders:v7];
  }
  v8 = [(SearchHomeNoDataDataFetcher *)self delegate];
  [v8 didUpdateDataFetcher:self];
}

- (SearchHomeDataFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchHomeDataFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
}

- (BOOL)isFetchingDataComplete
{
  return self->_isFetchingDataComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviders, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end