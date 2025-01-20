@interface MRAssetMaster
- (BOOL)isEmbeddedAsset;
- (BOOL)isSupportedMovie;
- (BOOL)isValid;
- (BOOL)purgeResources;
- (CGSize)originalSize;
- (MRAssetMaster)initWithPath:(id)a3 originalSize:(CGSize)a4 isEmbeddedAsset:(BOOL)a5 isSupportedMovie:(BOOL)a6 andImageManager:(id)a7;
- (MRImage)thumbnail;
- (MRImageManager)imageManager;
- (NSDictionary)players;
- (NSString)path;
- (double)timestamp;
- (id)retainedByUserPlayerForSize:(CGSize)a3 andOptions:(id)a4;
- (id)thumbnailForFlagsMonochromatic:(BOOL)a3 mipmap:(BOOL)a4 powerOfTwo:(BOOL)a5;
- (void)dealloc;
- (void)invalidate;
- (void)relinquishPlayer:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MRAssetMaster

- (MRAssetMaster)initWithPath:(id)a3 originalSize:(CGSize)a4 isEmbeddedAsset:(BOOL)a5 isSupportedMovie:(BOOL)a6 andImageManager:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)MRAssetMaster;
  v13 = [(MRAssetMaster *)&v16 init];
  if (v13)
  {
    v13->_path = (NSString *)[a3 copy];
    v13->_originalSize.CGFloat width = width;
    v13->_originalSize.CGFloat height = height;
    v13->_imageManager = (MRImageManager *)a7;
    BOOL v14 = v13->_originalSize.width > 0.0 && v13->_originalSize.height > 0.0;
    v13->_isValid = v14;
    v13->_isEmbeddedAsset = a5;
    v13->_isSupportedMovie = a6;
    v13->_players = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v13->_unusedPlayers = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v13;
}

- (void)dealloc
{
  self->_path = 0;
  [(MRImage *)self->_thumbnail releaseByUser];
  self->_thumbnail = 0;
  self->_originalSize = CGSizeZero;
  self->_isValid = 0;

  self->_players = 0;
  self->_unusedPlayers = 0;

  self->_imageManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRAssetMaster;
  [(MRAssetMaster *)&v3 dealloc];
}

- (void)invalidate
{
  objc_sync_enter(self);

  self->_path = +[NSString stringWithFormat:@"invalid %p", self];
  objc_sync_exit(self);
}

- (NSString)path
{
  objc_sync_enter(self);
  objc_super v3 = self->_path;
  objc_sync_exit(self);
  return v3;
}

- (id)retainedByUserPlayerForSize:(CGSize)a3 andOptions:(id)a4
{
  if (!self->_isValid) {
    return 0;
  }
  double height = a3.height;
  double width = a3.width;
  v8 = @"liveCamera";
  unsigned __int8 v9 = [(NSString *)self->_path isEqualToString:@"liveCamera"];
  if (v9) {
    goto LABEL_26;
  }
  BOOL v10 = width == CGSizeZero.width;
  BOOL v11 = height == CGSizeZero.height;
  double v12 = self->_originalSize.width;
  if (v10 && v11) {
    double v13 = self->_originalSize.width;
  }
  else {
    double v13 = width;
  }
  if (v10 && v11) {
    double v14 = self->_originalSize.height;
  }
  else {
    double v14 = height;
  }
  float v15 = v12 / self->_originalSize.height;
  if (v13 == 0.0)
  {
    double v13 = v14 * v15;
  }
  else
  {
    double v17 = v15;
    if (v14 == 0.0 || (float v18 = v13 / v14, v18 > v15)) {
      double v14 = v13 / v17;
    }
    else {
      double v13 = v14 * v17;
    }
  }
  if (v13 <= v12) {
    double width = v13;
  }
  else {
    double width = self->_originalSize.width;
  }
  if (v13 <= v12) {
    double height = v14;
  }
  else {
    double height = self->_originalSize.height;
  }
  unsigned int v19 = [a4 isStill];
  char v20 = v19;
  if (v19)
  {
    if (self->_isSupportedMovie)
    {
      unsigned int v21 = [a4 wantsMonochromatic];
      unsigned int v22 = [a4 wantsMipmap];
      unsigned int v23 = [a4 wantsPowerOfTwo];
      [a4 stillTime];
      v8 = +[NSString stringWithFormat:@"%d-%d%d%d%f", (int)width, v21, v22, v23, v24];
      char v20 = 1;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (self->_isSupportedMovie)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d%d%d", [a4 wantsMonochromatic], objc_msgSend(a4, "wantsMipmap"), objc_msgSend(a4, "wantsPowerOfTwo"));
LABEL_26:
    char v20 = 0;
    goto LABEL_28;
  }
LABEL_27:
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d-%d%d%d", (int)width, [a4 wantsMonochromatic], objc_msgSend(a4, "wantsMipmap"), objc_msgSend(a4, "wantsPowerOfTwo"));
LABEL_28:
  players = self->_players;
  objc_sync_enter(players);
  v26 = (MRAssetPlayerStillImage *)[(NSMutableDictionary *)self->_players objectForKey:v8];
  [a4 isForExport];
  v27 = (objc_class *)objc_opt_class();
  while (v26)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0
      || v26 == [a4 playerHint]
      || ([(NSMutableSet *)self->_unusedPlayers containsObject:v26] & 1) != 0)
    {
      [(NSMutableSet *)self->_unusedPlayers removeObject:v26];
      goto LABEL_67;
    }
    v8 = (__CFString *)[(__CFString *)v8 stringByAppendingString:@"."];
    v26 = (MRAssetPlayerStillImage *)[(NSMutableDictionary *)self->_players objectForKey:v8];
  }
  if (v9)
  {
    v26 = 0;
  }
  else
  {
    if ((v20 & 1) != 0 || !self->_isSupportedMovie)
    {
      if ([a4 thumbnailIsOK])
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v28 = [(NSMutableDictionary *)self->_players objectEnumerator];
        id v29 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v29)
        {
          id v48 = 0;
          uint64_t v30 = *(void *)v50;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v50 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v33 = [a4 wantsMonochromatic];
                if (v33 == [v32 isMonochromatic])
                {
                  unsigned int v34 = [a4 wantsMipmap];
                  if (v34 == [v32 generatesMipmap])
                  {
                    unsigned int v35 = [a4 wantsPowerOfTwo];
                    if (v35 == [v32 usesPowerOfTwo])
                    {
                      id v36 = [v32 retainedByUserCurrentImage];
                      v37 = v36;
                      if (v36)
                      {
                        if (!v48
                          || ([v36 size],
                              double v39 = v38,
                              [v48 size],
                              double v41 = v40,
                              double v42 = fabs(log2(v39 / width)),
                              v42 < fabs(log2(v41 / width))))
                        {
                          [v48 releaseByUser];
                          id v48 = [v37 retainByUser];
                        }
                        [v37 releaseByUser];
                      }
                    }
                  }
                }
              }
            }
            id v29 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
          }
          while (v29);
        }
        else
        {
          id v48 = 0;
        }
        [a4 setInitialImage:v48];
        [v48 releaseByUser];
      }
      v43 = -[MRAssetPlayerStillImage initWithPath:size:master:andOptions:]([MRAssetPlayerStillImage alloc], "initWithPath:size:master:andOptions:", self->_path, self, a4, width, height);
    }
    else
    {
      if (self->_isEmbeddedAsset
        || (v44 = -[MRContext assetManager](-[MRImageManager baseContext](self->_imageManager, "baseContext"), "assetManager"), !-[MZMediaManagement avAssetForAssetAtPath:](v44, "avAssetForAssetAtPath:", self->_path))&& ((id v46 = -[MZMediaManagement absolutePathForAssetAtPath:andSize:](v44, "absolutePathForAssetAtPath:andSize:", self->_path, width, height), (v47 = v46) == 0)|| ![v46 isAbsolutePath]|| !-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", v47, 0)))
      {
        v27 = (objc_class *)MRAssetPlayerStillImage;
      }
      v43 = (MRAssetPlayerStillImage *)objc_msgSend([v27 alloc], "initWithPath:size:master:andOptions:", self->_path, self, a4, width, height);
    }
    v26 = v43;
  }
  [(NSMutableDictionary *)self->_players setObject:v26 forKey:v8];

LABEL_67:
  id v16 = [(MRAssetPlayer *)v26 retainByUser];
  objc_sync_exit(players);
  return v16;
}

- (void)relinquishPlayer:(id)a3
{
  players = self->_players;
  objc_sync_enter(players);
  [(NSMutableSet *)self->_unusedPlayers addObject:a3];
  objc_sync_exit(players);
}

- (MRImage)thumbnail
{
  objc_sync_enter(self);
  thumbnail = self->_thumbnail;
  if (!thumbnail)
  {
    double width = self->_originalSize.width;
    double height = self->_originalSize.height;
    BOOL v6 = width < height;
    double v7 = height / width * 256.0;
    double v8 = width / height;
    double v9 = 256.0;
    double v10 = v8 * 256.0;
    if (v6)
    {
      double v10 = 256.0;
      double v9 = v7;
    }
    thumbnail = [(MRImage *)_GetImage(self, 0, 0, 0, 1, 1, v10, v9, 0.0) retainByUser];
    self->_thumbnail = thumbnail;
  }
  BOOL v11 = thumbnail;
  objc_sync_exit(self);
  return v11;
}

- (id)thumbnailForFlagsMonochromatic:(BOOL)a3 mipmap:(BOOL)a4 powerOfTwo:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (a3 || a4 || a5)
  {
    objc_sync_enter(self);
    double width = self->_originalSize.width;
    double height = self->_originalSize.height;
    BOOL v12 = width < height;
    double v13 = height / width * 256.0;
    double v14 = width / height;
    double v15 = 256.0;
    double v16 = v14 * 256.0;
    if (v12)
    {
      double v15 = v13;
      double v16 = 256.0;
    }
    double v17 = _GetImage(self, v7, v6, v5, 1, 1, v16, v15, 0.0);
    objc_sync_exit(self);
    return v17;
  }
  else
  {
    return [(MRAssetMaster *)self thumbnail];
  }
}

- (BOOL)purgeResources
{
  if (![(NSMutableSet *)self->_unusedPlayers count]) {
    return 0;
  }
  players = self->_players;
  objc_sync_enter(players);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unusedPlayers = self->_unusedPlayers;
  id v5 = [(NSMutableSet *)unusedPlayers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(unusedPlayers);
        }
        id v8 = objc_msgSend(-[NSMutableDictionary allKeysForObject:](self->_players, "allKeysForObject:", *(void *)(*((void *)&v11 + 1) + 8 * i)), "lastObject");
        if (v8) {
          [(NSMutableDictionary *)self->_players removeObjectForKey:v8];
        }
      }
      id v5 = [(NSMutableSet *)unusedPlayers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [(NSMutableSet *)self->_unusedPlayers removeAllObjects];
  BOOL v9 = [(NSMutableDictionary *)self->_players count] == 0;
  objc_sync_exit(players);
  return v9;
}

- (MRImageManager)imageManager
{
  return self->_imageManager;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGSize)originalSize
{
  objc_copyStruct(v4, &self->_originalSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)isEmbeddedAsset
{
  return self->_isEmbeddedAsset;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)isSupportedMovie
{
  return self->_isSupportedMovie;
}

- (NSDictionary)players
{
  return &self->_players->super;
}

@end