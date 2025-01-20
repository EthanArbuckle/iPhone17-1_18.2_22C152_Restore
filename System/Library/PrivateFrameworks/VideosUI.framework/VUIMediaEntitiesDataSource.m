@interface VUIMediaEntitiesDataSource
- (BOOL)shouldAutoFetchArtworkInfoDictionaries;
- (BOOL)shouldPauseAutoFetchingArtworkInfoDictionaries;
- (NSArray)grouping;
- (NSArray)mediaEntities;
- (NSDictionary)artworkInfoDictionaryByPurchaseID;
- (VUIMediaEntitiesDataSource)initWithFetchRequest:(id)a3;
- (VUIMediaEntityFetchRequest)fetchRequest;
- (void)setArtworkInfoDictionaryByPurchaseID:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setGrouping:(id)a3;
- (void)setMediaEntities:(id)a3;
- (void)setShouldAutoFetchArtworkInfoDictionaries:(BOOL)a3;
- (void)setShouldPauseAutoFetchingArtworkInfoDictionaries:(BOOL)a3;
@end

@implementation VUIMediaEntitiesDataSource

- (VUIMediaEntitiesDataSource)initWithFetchRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntitiesDataSource;
  v6 = [(VUIMediaEntitiesDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchRequest, a3);
    v7->_shouldAutoFetchArtworkInfoDictionaries = 0;
    v7->_shouldPauseAutoFetchingArtworkInfoDictionaries = 0;
  }

  return v7;
}

- (VUIMediaEntityFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (void)setMediaEntities:(id)a3
{
}

- (NSArray)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
}

- (BOOL)shouldAutoFetchArtworkInfoDictionaries
{
  return self->_shouldAutoFetchArtworkInfoDictionaries;
}

- (void)setShouldAutoFetchArtworkInfoDictionaries:(BOOL)a3
{
  self->_shouldAutoFetchArtworkInfoDictionaries = a3;
}

- (BOOL)shouldPauseAutoFetchingArtworkInfoDictionaries
{
  return self->_shouldPauseAutoFetchingArtworkInfoDictionaries;
}

- (void)setShouldPauseAutoFetchingArtworkInfoDictionaries:(BOOL)a3
{
  self->_shouldPauseAutoFetchingArtworkInfoDictionaries = a3;
}

- (NSDictionary)artworkInfoDictionaryByPurchaseID
{
  return self->_artworkInfoDictionaryByPurchaseID;
}

- (void)setArtworkInfoDictionaryByPurchaseID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkInfoDictionaryByPurchaseID, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end