@interface MCDAlbumAddedDataSource
- (BOOL)wantsDetailedKeepLocalRequestableResponse;
- (id)requestSectionProperties;
- (id)storeIDs;
@end

@implementation MCDAlbumAddedDataSource

- (id)requestSectionProperties
{
  uint64_t v12 = MPModelRelationshipGenericAlbum;
  uint64_t v11 = MPModelPropertyAlbumLibraryAdded;
  v2 = +[NSArray arrayWithObjects:&v11 count:1];
  v3 = +[MPPropertySet propertySetWithProperties:v2];
  v13 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  id v5 = objc_alloc((Class)MPPropertySet);
  v6 = +[MPModelAlbum requiredLibraryAddStatusObservationProperties];
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
  v2 = [(MCDAlbumTracksDataSource *)self album];
  v3 = [v2 identifiers];
  v4 = [v3 universalStore];
  id v5 = [v4 adamID];

  if (v5)
  {
    v6 = +[NSString stringWithFormat:@"%lld", v5];
    v8 = v6;
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }

  return v5;
}

@end