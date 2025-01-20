@interface MCDPlaylistAddedDataSource
- (BOOL)wantsDetailedKeepLocalRequestableResponse;
- (id)requestSectionProperties;
- (id)storeIDs;
@end

@implementation MCDPlaylistAddedDataSource

- (id)requestSectionProperties
{
  uint64_t v12 = MPModelRelationshipGenericPlaylist;
  uint64_t v11 = MPModelPropertyPlaylistLibraryAdded;
  v2 = +[NSArray arrayWithObjects:&v11 count:1];
  v3 = +[MPPropertySet propertySetWithProperties:v2];
  v13 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  id v5 = objc_alloc((Class)MPPropertySet);
  v6 = +[MPModelPlaylist requiredLibraryAddStatusObservationProperties];
  v7 = [v6 properties];
  v8 = [v7 allObjects];
  id v9 = [v5 initWithProperties:v8 relationships:v4];

  return v9;
}

- (BOOL)wantsDetailedKeepLocalRequestableResponse
{
  return 1;
}

- (id)storeIDs
{
  v2 = [(MCDPlaylistTracksDataSource *)self playlist];
  v3 = [v2 identifiers];
  v4 = [v3 universalStore];
  id v5 = [v4 globalPlaylistID];

  if (v5)
  {
    v8 = v5;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end