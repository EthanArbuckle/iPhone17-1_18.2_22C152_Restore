@interface SearchHomeTipDataFetcher
- (BOOL)isFetchingDataComplete;
- (NSArray)dataProviders;
- (SearchHomeDataFetcherDelegate)delegate;
- (SearchHomeTipDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4;
- (void)fetchContent;
- (void)setDataProviders:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SearchHomeTipDataFetcher

- (SearchHomeTipDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeTipDataFetcher;
  v6 = [(SearchHomeTipDataFetcher *)&v9 init];
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
  v3 = [(SearchHomeTipDataFetcher *)self dataProviders];

  if (!v3)
  {
    v4 = [SearchHomeTipDataProvider alloc];
    CFStringRef v10 = @"SearchHomeTip";
    id v5 = +[NSArray arrayWithObjects:&v10 count:1];
    v6 = [(SearchHomeTipDataProvider *)v4 initWithObjects:v5 type:6 identifier:@"SearchHomeTip" title:&stru_101324E70];

    objc_super v9 = v6;
    v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [(SearchHomeTipDataFetcher *)self setDataProviders:v7];
  }
  v8 = [(SearchHomeTipDataFetcher *)self delegate];
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