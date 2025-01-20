@interface PGSinglePersonWallpaperAssetCandidate
- (BOOL)isFavorite;
- (NSDate)creationDate;
- (NSString)assetUUID;
- (PGSinglePersonWallpaperAssetCandidate)initWithFace:(id)a3 inAsset:(id)a4;
- (double)aestheticScore;
- (double)score;
- (double)wallpaperScore;
@end

@implementation PGSinglePersonWallpaperAssetCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (double)wallpaperScore
{
  return self->_wallpaperScore;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (NSString)assetUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (PGSinglePersonWallpaperAssetCandidate)initWithFace:(id)a3 inAsset:(id)a4
{
  id v5 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGSinglePersonWallpaperAssetCandidate;
  v6 = [(PGSinglePersonWallpaperAssetCandidate *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 uuid];
    assetUUID = v6->_assetUUID;
    v6->_assetUUID = (NSString *)v7;

    v6->_isFavorite = [v5 isFavorite];
    v9 = [v5 mediaAnalysisProperties];
    [v9 wallpaperScore];
    v6->_wallpaperScore = v10;

    [v5 overallAestheticScore];
    double v12 = v11;
    v6->_aestheticScore = v12;
    v6->_score = v6->_wallpaperScore + v12;
    uint64_t v13 = [v5 creationDate];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v13;
  }
  return v6;
}

@end