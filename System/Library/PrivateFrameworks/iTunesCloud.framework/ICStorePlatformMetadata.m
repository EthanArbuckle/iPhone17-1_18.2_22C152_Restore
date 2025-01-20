@interface ICStorePlatformMetadata
+ (NSCalendar)storeServerCalendar;
- (BOOL)hasLyrics;
- (BOOL)hasTimeSyncedLyrics;
- (BOOL)isExplicit;
- (BOOL)shouldShowComposer;
- (BOOL)supportsVocalAttenuation;
- (ICStorePlatformMetadata)initWithMetadataDictionary:(id)a3;
- (ICStorePlatformMetadata)initWithMetadataDictionary:(id)a3 expirationDate:(id)a4;
- (NSArray)artworkInfos;
- (NSArray)audioTraits;
- (NSArray)formerStoreAdamIDs;
- (NSArray)genreNames;
- (NSArray)offers;
- (NSDate)expirationDate;
- (NSDate)releaseDate;
- (NSDictionary)metadataDictionary;
- (NSString)artistName;
- (NSString)cloudUniversalLibraryID;
- (NSString)collectionName;
- (NSString)composerName;
- (NSString)copyrightText;
- (NSString)kind;
- (NSString)movementName;
- (NSString)name;
- (NSString)playlistGlobalID;
- (NSString)radioStationStringID;
- (NSString)title;
- (NSString)workName;
- (NSURL)classicalURL;
- (double)duration;
- (id)_storePlatformReleaseDateFormatter;
- (id)offerWithType:(id)a3;
- (int64_t)artistStoreAdamID;
- (int64_t)collectionStoreAdamID;
- (int64_t)discNumber;
- (int64_t)explicitRating;
- (int64_t)movementCount;
- (int64_t)movementNumber;
- (int64_t)storeAdamID;
- (int64_t)trackCount;
- (int64_t)trackNumber;
@end

@implementation ICStorePlatformMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)_storePlatformReleaseDateFormatter
{
  if (_storePlatformReleaseDateFormatter_sOnceToken != -1) {
    dispatch_once(&_storePlatformReleaseDateFormatter_sOnceToken, &__block_literal_global_169_10012);
  }
  v2 = (void *)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;

  return v2;
}

void __61__ICStorePlatformMetadata__storePlatformReleaseDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;
  _storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter = (uint64_t)v0;

  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter setLocale:v2];
  [(id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter setDateFormat:@"YYYY-MM-dd"];
}

- (BOOL)supportsVocalAttenuation
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"isVocalAttenuationAllowed"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSURL)classicalURL
{
  id v2 = [(NSDictionary *)self->_metadataDictionary ic_stringValueForKey:@"classicalUrl"];
  if ([v2 length])
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSArray)audioTraits
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(NSDictionary *)self->_metadataDictionary ic_arrayValueForKey:@"audioTraits"];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__ICStorePlatformMetadata_audioTraits__block_invoke;
    v6[3] = &unk_1E5AC80B8;
    id v7 = v3;
    [v4 enumerateObjectsUsingBlock:v6];
  }

  return (NSArray *)v3;
}

void __38__ICStorePlatformMetadata_audioTraits__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_NSIsNSString()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSArray)artworkInfos
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"artwork"];
  if (_NSIsNSDictionary())
  {
    id v3 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v2];
    v18[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
LABEL_13:

    goto LABEL_15;
  }
  if (_NSIsNSArray())
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v3 = v2;
    uint64_t v5 = [(ICStoreArtworkInfo *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [ICStoreArtworkInfo alloc];
            v11 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:](v10, "initWithArtworkResponseDictionary:", v9, (void)v13);
            [v4 addObject:v11];
          }
        }
        uint64_t v6 = [(ICStoreArtworkInfo *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    goto LABEL_13;
  }
  v4 = 0;
LABEL_15:

  return (NSArray *)v4;
}

- (NSString)workName
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"workName"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)trackCount
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"trackCount"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)trackNumber
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"trackNumber"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)title
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"title"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)formerStoreAdamIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"formerIds"];
  if (_NSIsNSArray())
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v13 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            if (_NSIsNSNumber())
            {
              id v10 = v9;
            }
            else
            {
              objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
              id v10 = (id)objc_claimAutoreleasedReturnValue();
            }
            v11 = v10;
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    id v2 = v13;
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (int64_t)storeAdamID
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"id"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)shouldShowComposer
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"showComposer"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSDate)releaseDate
{
  char v3 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"releaseDate"];
  if (_NSIsNSString())
  {
    id v4 = [(ICStorePlatformMetadata *)self _storePlatformReleaseDateFormatter];
    uint64_t v5 = [v4 dateFromString:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSString)radioStationStringID
{
  char v3 = [(ICStorePlatformMetadata *)self kind];
  int v4 = [v3 isEqualToString:ICStorePlatformMetadataKindRadioStation];

  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"id"];
    if (_NSIsNSString()) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = 0;
LABEL_5:

  return (NSString *)v5;
}

- (id)offerWithType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(ICStorePlatformMetadata *)self offers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 offerType];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)offers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"offers"];
  if (_NSIsNSArray())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            id v10 = [ICStorePlatformOffer alloc];
            int v11 = -[ICStorePlatformOffer initWithResponseDictionary:](v10, "initWithResponseDictionary:", v9, (void)v13);
            if (v11) {
              [v3 addObject:v11];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSString)playlistGlobalID
{
  id v3 = [(ICStorePlatformMetadata *)self kind];
  int v4 = [v3 isEqualToString:ICStorePlatformMetadataKindPlaylist];

  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"id"];
    if (_NSIsNSString()) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = 0;
LABEL_5:

  return (NSString *)v5;
}

- (NSString)name
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"name"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)movementNumber
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"movementNumber"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)movementName
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"movementName"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)movementCount
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"movementCount"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)kind
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"kind"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)hasTimeSyncedLyrics
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"hasTimeSyncedLyrics"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasLyrics
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"hasLyrics"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSArray)genreNames
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"genreNames"];
  if (_NSIsNSArray())
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!_NSIsNSString())
          {

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  if (!v3)
  {
LABEL_14:
    uint64_t v9 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"genres"];
    if (_NSIsNSArray())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v3 = 0;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
            if (_NSIsNSDictionary())
            {
              long long v16 = objc_msgSend(v15, "objectForKey:", @"name", (void)v18);
              if (_NSIsNSString())
              {
                if (!v3) {
                  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                [v3 addObject:v16];
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v12);
      }
      else
      {
        id v3 = 0;
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSArray *)v3;
}

- (BOOL)isExplicit
{
  return [(ICStorePlatformMetadata *)self explicitRating] > 100;
}

- (int64_t)explicitRating
{
  id v3 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"contentRatingsBySystem"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 allValues];
    uint64_t v5 = [v4 firstObject];

    if (_NSIsNSDictionary())
    {
      uint64_t v6 = [v5 objectForKey:@"value"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    v8 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"is-explicit"];
    if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 BOOLValue]) {
      int64_t v7 = 1000;
    }
    else {
      int64_t v7 = 100;
    }
  }
  return v7;
}

- (double)duration
{
  id v2 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(ICStorePlatformMetadata *)self offers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v3) {
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  long long v19 = v2;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v26;
  double v7 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v26 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "assets", v19);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * j) duration];
            if (v14 <= 2.22044605e-16) {
              double v14 = -0.0;
            }
            else {
              ++v5;
            }
            double v7 = v7 + v14;
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v11);
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  }
  while (v4);
  id v2 = v19;
  if (v5)
  {
    double v15 = v7 / (double)v5;
  }
  else
  {
LABEL_20:
    long long v16 = [(NSDictionary *)v2->_metadataDictionary objectForKey:@"duration"];
    double v15 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v16 doubleValue];
      double v15 = v17;
    }
  }
  return v15;
}

- (int64_t)discNumber
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"discNumber"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)copyrightText
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"copyright"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)composerName
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"composer"];
  if (_NSIsNSDictionary())
  {
    id v3 = [v2 objectForKey:@"name"];
    if (_NSIsNSString()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (int64_t)collectionStoreAdamID
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"collectionId"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)collectionName
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"collectionName"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)cloudUniversalLibraryID
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"libraryTrackId"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)artistStoreAdamID
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"artistId"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)artistName
{
  id v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"artistName"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (ICStorePlatformMetadata)initWithMetadataDictionary:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICStorePlatformMetadata;
  v8 = [(ICStorePlatformMetadata *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v9;

    uint64_t v11 = [v6 copy];
    metadataDictionary = v8->_metadataDictionary;
    v8->_metadataDictionary = (NSDictionary *)v11;
  }
  return v8;
}

- (ICStorePlatformMetadata)initWithMetadataDictionary:(id)a3
{
  return [(ICStorePlatformMetadata *)self initWithMetadataDictionary:a3 expirationDate:0];
}

+ (NSCalendar)storeServerCalendar
{
  if (storeServerCalendar_sOnceToken != -1) {
    dispatch_once(&storeServerCalendar_sOnceToken, &__block_literal_global_10123);
  }
  id v2 = (void *)storeServerCalendar_sGMTCalendar;

  return (NSCalendar *)v2;
}

void __46__ICStorePlatformMetadata_storeServerCalendar__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)storeServerCalendar_sGMTCalendar;
  storeServerCalendar_sGMTCalendar = v1;

  id v3 = (void *)storeServerCalendar_sGMTCalendar;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

@end