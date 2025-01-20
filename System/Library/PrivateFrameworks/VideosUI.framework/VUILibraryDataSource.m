@interface VUILibraryDataSource
- (BOOL)hasCompletedInitialFetch;
- (VUILibraryDataSourceDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setHasCompletedInitialFetch:(BOOL)a3;
@end

@implementation VUILibraryDataSource

- (VUILibraryDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasCompletedInitialFetch
{
  return self->_hasCompletedInitialFetch;
}

- (void)setHasCompletedInitialFetch:(BOOL)a3
{
  self->_hasCompletedInitialFetch = a3;
}

- (void).cxx_destruct
{
}

@end