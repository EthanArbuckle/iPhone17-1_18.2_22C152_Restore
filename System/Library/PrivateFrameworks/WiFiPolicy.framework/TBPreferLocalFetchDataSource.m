@interface TBPreferLocalFetchDataSource
- (TBCacheProvider)cacheProvider;
- (TBDataSource)localDataSource;
- (TBDataSource)remoteDataSource;
- (TBPreferLocalFetchDataSource)initWithLocalDataSource:(id)a3 remoteDataSource:(id)a4 cacheProvider:(id)a5;
- (void)setCacheProvider:(id)a3;
- (void)setLocalDataSource:(id)a3;
- (void)setRemoteDataSource:(id)a3;
@end

@implementation TBPreferLocalFetchDataSource

- (TBDataSource)localDataSource
{
  return self->_localDataSource;
}

- (TBPreferLocalFetchDataSource)initWithLocalDataSource:(id)a3 remoteDataSource:(id)a4 cacheProvider:(id)a5
{
  v8 = (TBDataSource *)a3;
  v9 = (TBDataSource *)a4;
  v10 = (TBCacheProvider *)a5;
  v18.receiver = self;
  v18.super_class = (Class)TBPreferLocalFetchDataSource;
  v11 = [(TBPreferLocalFetchDataSource *)&v18 init];
  localDataSource = v11->_localDataSource;
  v11->_localDataSource = v8;
  v13 = v8;

  remoteDataSource = v11->_remoteDataSource;
  v11->_remoteDataSource = v9;
  v15 = v9;

  cacheProvider = v11->_cacheProvider;
  v11->_cacheProvider = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheProvider, 0);
  objc_storeStrong((id *)&self->_remoteDataSource, 0);

  objc_storeStrong((id *)&self->_localDataSource, 0);
}

- (void)setLocalDataSource:(id)a3
{
}

- (TBDataSource)remoteDataSource
{
  return self->_remoteDataSource;
}

- (void)setRemoteDataSource:(id)a3
{
}

- (TBCacheProvider)cacheProvider
{
  return self->_cacheProvider;
}

- (void)setCacheProvider:(id)a3
{
}

@end