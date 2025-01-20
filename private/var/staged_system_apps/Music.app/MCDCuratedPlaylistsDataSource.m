@interface MCDCuratedPlaylistsDataSource
- (MCDCuratedPlaylistsDataSource)initWithCurator:(id)a3;
- (MPModelCurator)curator;
- (int64_t)curatorID;
- (void)setCurator:(id)a3;
@end

@implementation MCDCuratedPlaylistsDataSource

- (MCDCuratedPlaylistsDataSource)initWithCurator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDCuratedPlaylistsDataSource;
  v6 = [(MCDCuratedPlaylistsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_curator, a3);
  }

  return v7;
}

- (int64_t)curatorID
{
  v2 = [(MCDCuratedPlaylistsDataSource *)self curator];
  v3 = [v2 identifiers];
  v4 = [v3 universalStore];
  id v5 = [v4 adamID];

  return (int64_t)v5;
}

- (MPModelCurator)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end