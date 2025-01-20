@interface VUIDocumentPreFetchedDataPlaybackUpNext
- (BOOL)canAutoPlay;
- (BOOL)isLiveStream;
- (BOOL)isPostPlay;
- (BOOL)refetchUpNextData;
- (BOOL)updateEvent;
- (NSArray)excludedCanonicals;
- (NSNumber)seasonNumber;
- (NSString)adamID;
- (NSString)host;
- (NSString)productID;
- (NSString)showID;
- (id)jsonData;
- (void)setAdamID:(id)a3;
- (void)setCanAutoPlay:(BOOL)a3;
- (void)setExcludedCanonicals:(id)a3;
- (void)setHost:(id)a3;
- (void)setIsLiveStream:(BOOL)a3;
- (void)setIsPostPlay:(BOOL)a3;
- (void)setProductID:(id)a3;
- (void)setRefetchUpNextData:(BOOL)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setShowID:(id)a3;
- (void)setUpdateEvent:(BOOL)a3;
@end

@implementation VUIDocumentPreFetchedDataPlaybackUpNext

- (id)jsonData
{
  v3 = objc_opt_new();
  v4 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self host];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self host];
    [v3 setObject:v6 forKeyedSubscript:@"host"];
  }
  if ([(VUIDocumentPreFetchedDataPlaybackUpNext *)self updateEvent]) {
    [v3 setObject:@"upNext" forKeyedSubscript:@"updateComponentType"];
  }
  if ([(VUIDocumentPreFetchedDataPlaybackUpNext *)self canAutoPlay])
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext canAutoPlay](self, "canAutoPlay"));
    [v3 setObject:v7 forKeyedSubscript:@"canAutoPlay"];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext isPostPlay](self, "isPostPlay"));
  [v3 setObject:v8 forKeyedSubscript:@"isPostPlay"];

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext isLiveStream](self, "isLiveStream"));
  [v3 setObject:v9 forKeyedSubscript:@"isLiveStream"];

  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext refetchUpNextData](self, "refetchUpNextData"));
  [v3 setObject:v10 forKeyedSubscript:@"refetchUpNextData"];

  v11 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self showID];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self showID];
    [v3 setObject:v13 forKeyedSubscript:@"showId"];
  }
  v14 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self productID];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    v16 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self productID];
    [v3 setObject:v16 forKeyedSubscript:@"id"];
  }
  v17 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self adamID];

  if (v17)
  {
    v18 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self adamID];
    [v3 setObject:v18 forKeyedSubscript:@"adamId"];
  }
  v19 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self seasonNumber];

  if (v19)
  {
    v20 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self seasonNumber];
    [v3 setObject:v20 forKeyedSubscript:@"seasonNumber"];
  }
  v21 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self excludedCanonicals];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = [(VUIDocumentPreFetchedDataPlaybackUpNext *)self excludedCanonicals];
    [v3 setObject:v23 forKeyedSubscript:@"excludedCanonicals"];
  }
  v24 = (void *)[v3 copy];

  return v24;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSString)showID
{
  return self->_showID;
}

- (void)setShowID:(id)a3
{
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
}

- (NSArray)excludedCanonicals
{
  return self->_excludedCanonicals;
}

- (void)setExcludedCanonicals:(id)a3
{
}

- (BOOL)updateEvent
{
  return self->_updateEvent;
}

- (void)setUpdateEvent:(BOOL)a3
{
  self->_updateEvent = a3;
}

- (BOOL)canAutoPlay
{
  return self->_canAutoPlay;
}

- (void)setCanAutoPlay:(BOOL)a3
{
  self->_canAutoPlay = a3;
}

- (BOOL)isPostPlay
{
  return self->_isPostPlay;
}

- (void)setIsPostPlay:(BOOL)a3
{
  self->_isPostPlay = a3;
}

- (BOOL)isLiveStream
{
  return self->_isLiveStream;
}

- (void)setIsLiveStream:(BOOL)a3
{
  self->_isLiveStream = a3;
}

- (BOOL)refetchUpNextData
{
  return self->_refetchUpNextData;
}

- (void)setRefetchUpNextData:(BOOL)a3
{
  self->_refetchUpNextData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedCanonicals, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end