@interface WLKBasicEpisodeMetadata
+ (id)episodesWithDictionaries:(id)a3 context:(id)a4;
- (NSDate)releaseDate;
- (NSNumber)episodeNumber;
- (NSNumber)seasonNumber;
- (NSString)canonicalSeasonID;
- (NSString)canonicalShowID;
- (NSString)seasonTitle;
- (NSString)showTitle;
- (WLKArtworkVariantListing)seasonImages;
- (WLKArtworkVariantListing)showImages;
- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3;
- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3 context:(id)a4;
- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3 context:(id)a4 playablesDict:(id)a5 playablesId:(id)a6 seasonsDict:(id)a7;
- (WLKPlayable)playable;
- (double)duration;
@end

@implementation WLKBasicEpisodeMetadata

+ (id)episodesWithDictionaries:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = objc_alloc((Class)a1);
          v16 = objc_msgSend(v15, "initWithDictionary:context:", v14, v7, (void)v18);
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3
{
  return [(WLKBasicEpisodeMetadata *)self initWithDictionary:a3 context:0];
}

- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)WLKBasicEpisodeMetadata;
  id v8 = [(WLKBasicContentMetadata *)&v37 initWithDictionary:v6];
  if (v8)
  {
    id v9 = objc_msgSend(v6, "wlk_stringForKey:", @"showTitle");
    uint64_t v10 = [v9 copy];
    showTitle = v8->_showTitle;
    v8->_showTitle = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v6, "wlk_stringForKey:", @"showId");
    uint64_t v13 = [v12 copy];
    canonicalShowID = v8->_canonicalShowID;
    v8->_canonicalShowID = (NSString *)v13;

    id v15 = objc_msgSend(v6, "wlk_stringForKey:", @"seasonId");
    uint64_t v16 = [v15 copy];
    canonicalSeasonID = v8->_canonicalSeasonID;
    v8->_canonicalSeasonID = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v6, "wlk_numberForKey:", @"seasonNumber");
    seasonNumber = v8->_seasonNumber;
    v8->_seasonNumber = (NSNumber *)v18;

    uint64_t v20 = objc_msgSend(v6, "wlk_numberForKey:", @"episodeNumber");
    episodeNumber = v8->_episodeNumber;
    v8->_episodeNumber = (NSNumber *)v20;

    uint64_t v22 = objc_msgSend(v6, "wlk_stringForKey:", @"seasonTitle");
    seasonTitle = v8->_seasonTitle;
    v8->_seasonTitle = (NSString *)v22;

    v24 = objc_msgSend(v6, "wlk_numberForKey:", @"duration");
    [v24 doubleValue];
    v8->_duration = v25;

    uint64_t v26 = objc_msgSend(v6, "wlk_dateFromMillisecondsSince1970ForKey:", @"releaseDate");
    releaseDate = v8->_releaseDate;
    v8->_releaseDate = (NSDate *)v26;

    uint64_t v28 = objc_msgSend(v6, "wlk_artworkVariantListingForKey:", @"showImages");
    showImages = v8->_showImages;
    v8->_showImages = (WLKArtworkVariantListing *)v28;

    uint64_t v30 = objc_msgSend(v6, "wlk_artworkVariantListingForKey:", @"seasonImages");
    seasonImages = v8->_seasonImages;
    v8->_seasonImages = (WLKArtworkVariantListing *)v30;

    v32 = [WLKPlayable alloc];
    v33 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"playable");
    uint64_t v34 = [(WLKPlayable *)v32 initWithDictionary:v33 context:v7];
    playable = v8->_playable;
    v8->_playable = (WLKPlayable *)v34;
  }
  return v8;
}

- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3 context:(id)a4 playablesDict:(id)a5 playablesId:(id)a6 seasonsDict:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v58.receiver = self;
  v58.super_class = (Class)WLKBasicEpisodeMetadata;
  v17 = [(WLKBasicContentMetadata *)&v58 initWithDictionary:v12];
  if (v17)
  {
    uint64_t v18 = objc_msgSend(v12, "wlk_stringForKey:", @"showTitle");
    uint64_t v19 = [v18 copy];
    showTitle = v17->_showTitle;
    v17->_showTitle = (NSString *)v19;

    long long v21 = objc_msgSend(v12, "wlk_stringForKey:", @"showId");
    uint64_t v22 = [v21 copy];
    canonicalShowID = v17->_canonicalShowID;
    v17->_canonicalShowID = (NSString *)v22;

    v24 = objc_msgSend(v12, "wlk_stringForKey:", @"seasonId");
    uint64_t v25 = [v24 copy];
    canonicalSeasonID = v17->_canonicalSeasonID;
    v17->_canonicalSeasonID = (NSString *)v25;

    uint64_t v27 = objc_msgSend(v12, "wlk_numberForKey:", @"seasonNumber");
    seasonNumber = v17->_seasonNumber;
    v17->_seasonNumber = (NSNumber *)v27;

    uint64_t v29 = objc_msgSend(v12, "wlk_numberForKey:", @"episodeNumber");
    episodeNumber = v17->_episodeNumber;
    v17->_episodeNumber = (NSNumber *)v29;

    uint64_t v31 = objc_msgSend(v12, "wlk_stringForKey:", @"seasonTitle");
    seasonTitle = v17->_seasonTitle;
    v17->_seasonTitle = (NSString *)v31;

    v33 = objc_msgSend(v12, "wlk_numberForKey:", @"duration");
    [v33 doubleValue];
    v17->_duration = v34;

    uint64_t v35 = objc_msgSend(v12, "wlk_dateFromMillisecondsSince1970ForKey:", @"releaseDate");
    releaseDate = v17->_releaseDate;
    v17->_releaseDate = (NSDate *)v35;

    uint64_t v37 = objc_msgSend(v12, "wlk_artworkVariantListingForKey:", @"images");
    showImages = v17->_showImages;
    v17->_showImages = (WLKArtworkVariantListing *)v37;

    id v52 = v16;
    uint64_t v39 = objc_msgSend(v16, "wlk_artworkVariantListingForKey:", @"images");
    seasonImages = v17->_seasonImages;
    v17->_seasonImages = (WLKArtworkVariantListing *)v39;

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v53 = v15;
    id v41 = v15;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v55;
      id v51 = v13;
      while (2)
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "wlk_stringForKey:", @"playableId");
          v47 = objc_msgSend(v14, "wlk_dictionaryForKey:", v46);

          if (v47)
          {
            id v13 = v51;
            v48 = [[WLKPlayable alloc] initWithDictionary:v47 context:v51];
            playable = v17->_playable;
            v17->_playable = v48;

            goto LABEL_12;
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
        id v13 = v51;
        if (v43) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v16 = v52;
    id v15 = v53;
  }

  return v17;
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (NSString)canonicalShowID
{
  return self->_canonicalShowID;
}

- (NSString)canonicalSeasonID
{
  return self->_canonicalSeasonID;
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (NSString)seasonTitle
{
  return self->_seasonTitle;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (WLKArtworkVariantListing)showImages
{
  return self->_showImages;
}

- (WLKArtworkVariantListing)seasonImages
{
  return self->_seasonImages;
}

- (WLKPlayable)playable
{
  return self->_playable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playable, 0);
  objc_storeStrong((id *)&self->_seasonImages, 0);
  objc_storeStrong((id *)&self->_showImages, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_seasonTitle, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_canonicalSeasonID, 0);
  objc_storeStrong((id *)&self->_canonicalShowID, 0);

  objc_storeStrong((id *)&self->_showTitle, 0);
}

@end