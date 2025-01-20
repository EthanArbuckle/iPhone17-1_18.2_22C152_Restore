@interface SREMusicCandidate
- (NSArray)genreIDs;
- (NSString)artistName;
- (NSString)artworkURL;
- (NSString)collectionName;
- (NSString)trackName;
- (SREMusicCandidate)init;
- (id)debugString;
- (id)genresDebugString;
- (int64_t)collectionId;
- (int64_t)trackId;
- (int64_t)trackTimeMillis;
- (unsigned)trackExplicitness;
- (void)setArtistName:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setCollectionId:(int64_t)a3;
- (void)setCollectionName:(id)a3;
- (void)setGenreIDs:(id)a3;
- (void)setTrackExplicitness:(unsigned __int8)a3;
- (void)setTrackId:(int64_t)a3;
- (void)setTrackName:(id)a3;
- (void)setTrackTimeMillis:(int64_t)a3;
@end

@implementation SREMusicCandidate

- (SREMusicCandidate)init
{
  v3.receiver = self;
  v3.super_class = (Class)SREMusicCandidate;
  return [(SREMusicCandidate *)&v3 init];
}

- (id)genresDebugString
{
  v2 = [(SREMusicCandidate *)self genreIDs];
  objc_super v3 = [v2 componentsJoinedByString:@","];

  return v3;
}

- (id)debugString
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"trackId=%ld", -[SREMusicCandidate trackId](self, "trackId"));
  [v3 addObject:v4];

  v5 = [(SREMusicCandidate *)self trackName];

  if (v5)
  {
    v6 = NSString;
    v7 = [(SREMusicCandidate *)self trackName];
    v8 = [v6 stringWithFormat:@"trackName=%@", v7];
    [v3 addObject:v8];
  }
  v9 = [(SREMusicCandidate *)self artistName];

  if (v9)
  {
    v10 = NSString;
    v11 = [(SREMusicCandidate *)self artistName];
    v12 = [v10 stringWithFormat:@"artistName=%@", v11];
    [v3 addObject:v12];
  }
  if ([(SREMusicCandidate *)self collectionId])
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"collectionId=%ld", -[SREMusicCandidate collectionId](self, "collectionId"));
    [v3 addObject:v13];
  }
  v14 = [(SREMusicCandidate *)self collectionName];

  if (v14)
  {
    v15 = NSString;
    v16 = [(SREMusicCandidate *)self collectionName];
    v17 = [v15 stringWithFormat:@"collectionName=%@", v16];
    [v3 addObject:v17];
  }
  v18 = [(SREMusicCandidate *)self genreIDs];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    v20 = NSString;
    v21 = [(SREMusicCandidate *)self genresDebugString];
    v22 = [v20 stringWithFormat:@"genreID=%@", v21];
    [v3 addObject:v22];
  }
  v23 = [(SREMusicCandidate *)self artworkURL];

  if (v23)
  {
    v24 = NSString;
    v25 = [(SREMusicCandidate *)self artworkURL];
    v26 = [v24 stringWithFormat:@"artworkURL=%@", v25];
    [v3 addObject:v26];
  }
  if ([(SREMusicCandidate *)self trackTimeMillis])
  {
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"trackTimeMillis=%ld", -[SREMusicCandidate trackTimeMillis](self, "trackTimeMillis"));
    [v3 addObject:v27];
  }
  v28 = objc_msgSend(NSString, "stringWithFormat:", @"trackExplicitness=%d", -[SREMusicCandidate trackExplicitness](self, "trackExplicitness"));
  [v3 addObject:v28];

  v29 = [v3 componentsJoinedByString:@"  "];

  return v29;
}

- (int64_t)trackId
{
  return self->_trackId;
}

- (void)setTrackId:(int64_t)a3
{
  self->_trackId = a3;
}

- (NSString)trackName
{
  return self->_trackName;
}

- (void)setTrackName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (int64_t)collectionId
{
  return self->_collectionId;
}

- (void)setCollectionId:(int64_t)a3
{
  self->_collectionId = a3;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
}

- (NSArray)genreIDs
{
  return self->_genreIDs;
}

- (void)setGenreIDs:(id)a3
{
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (int64_t)trackTimeMillis
{
  return self->_trackTimeMillis;
}

- (void)setTrackTimeMillis:(int64_t)a3
{
  self->_trackTimeMillis = a3;
}

- (unsigned)trackExplicitness
{
  return self->_trackExplicitness;
}

- (void)setTrackExplicitness:(unsigned __int8)a3
{
  self->_trackExplicitness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_genreIDs, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_trackName, 0);
}

@end