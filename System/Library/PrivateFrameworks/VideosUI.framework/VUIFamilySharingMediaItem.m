@interface VUIFamilySharingMediaItem
- (BOOL)isFamilySharingContent;
- (NSString)artworkURL;
- (NSString)buyParams;
- (NSString)personalizedBuyParams;
- (NSString)previewArtworkURL;
- (VUIExtrasInfo)iTunesExtrasInfo;
- (VUIFamilySharingEntity)entity;
- (VUIFamilySharingMediaItem)initWithAMSEntity:(id)a3 requestedProperties:(id)a4;
- (VUIFamilySharingRelationships)relationships;
- (VUIMediaEntityAssetController)assetController;
- (VUIVideosPlayable)videosPlayable;
- (id)_bestOffer;
- (id)_bestRedownloadOffer;
- (id)_itunesExtrasDictionary;
- (id)audioCapability;
- (id)bookmark;
- (id)colorCapability;
- (id)contentDescription;
- (id)contentRating;
- (id)duration;
- (id)episodeNumber;
- (id)extrasURL;
- (id)genreTitle;
- (id)releaseDate;
- (id)releaseYear;
- (id)resolution;
- (id)seasonCanonicalID;
- (id)seasonIdentifier;
- (id)seasonNumber;
- (id)showCanonicalID;
- (id)showIdentifier;
- (id)showTitle;
- (id)storeID;
- (id)title;
- (void)setArtworkURL:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setEntity:(id)a3;
- (void)setITunesExtrasInfo:(id)a3;
- (void)setPersonalizedBuyParams:(id)a3;
- (void)setPreviewArtworkURL:(id)a3;
- (void)setRelationships:(id)a3;
- (void)setVideosPlayable:(id)a3;
@end

@implementation VUIFamilySharingMediaItem

- (VUIFamilySharingMediaItem)initWithAMSEntity:(id)a3 requestedProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [VUIFamilySharingMediaEntityIdentifier alloc];
  v10 = [v7 identifier];
  v11 = [v7 type];
  v12 = [(VUIFamilySharingMediaEntityIdentifier *)v9 initWithEntityIdentifier:v10 mediaEntityType:v11];

  v13 = VUIFamilySharingMediaItemKind();
  v16.receiver = self;
  v16.super_class = (Class)VUIFamilySharingMediaItem;
  v14 = [(VUIMediaEntity *)&v16 initWithMediaLibrary:0 identifier:v12 requestedProperties:v8 kind:v13];

  if (v14) {
    objc_storeStrong((id *)&v14->_entity, a3);
  }

  return v14;
}

- (id)storeID
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 identifier];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v4 setNumberStyle:1];
    v5 = [v4 numberFromString:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)title
{
  v3 = [(VUIFamilySharingMediaItem *)self entity];
  id v4 = [v3 title];

  if (v4)
  {
    v5 = [(VUIFamilySharingMediaItem *)self entity];
    v6 = [v5 title];
  }
  else
  {
    v6 = &stru_1F3E921E0;
  }
  return v6;
}

- (NSString)artworkURL
{
  p_artworkURL = &self->_artworkURL;
  artworkURL = self->_artworkURL;
  if (artworkURL)
  {
    id v4 = artworkURL;
  }
  else
  {
    v6 = [(VUIFamilySharingMediaItem *)self entity];
    id v7 = [v6 artworkURL];

    if (v7)
    {
      id v8 = [(VUIFamilySharingMediaItem *)self entity];
      v9 = [v8 artworkURL];

      objc_storeStrong((id *)p_artworkURL, v9);
    }
    else
    {
      v9 = &stru_1F3E921E0;
    }
    id v4 = *p_artworkURL;
  }
  return v4;
}

- (id)extrasURL
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 iTunesExtrasUrl];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (VUIExtrasInfo)iTunesExtrasInfo
{
  iTunesExtrasInfo = self->_iTunesExtrasInfo;
  if (iTunesExtrasInfo)
  {
    v3 = iTunesExtrasInfo;
  }
  else
  {
    v5 = [(VUIFamilySharingMediaItem *)self _itunesExtrasDictionary];
    v6 = [[VUIExtrasInfo alloc] initWithDictionary:v5];
    id v7 = self->_iTunesExtrasInfo;
    self->_iTunesExtrasInfo = v6;
    id v8 = v6;

    v3 = self->_iTunesExtrasInfo;
  }
  return v3;
}

- (NSString)previewArtworkURL
{
  p_previewArtworkURL = &self->_previewArtworkURL;
  previewArtworkURL = self->_previewArtworkURL;
  if (previewArtworkURL)
  {
    id v4 = previewArtworkURL;
  }
  else
  {
    v6 = [(VUIFamilySharingMediaItem *)self entity];
    id v7 = [v6 previewArtworkURL];

    if (v7)
    {
      id v8 = [(VUIFamilySharingMediaItem *)self entity];
      v9 = [v8 previewArtworkURL];

      objc_storeStrong((id *)p_previewArtworkURL, v9);
    }
    else
    {
      v9 = &stru_1F3E921E0;
    }
    id v4 = *p_previewArtworkURL;
  }
  return v4;
}

- (VUIVideosPlayable)videosPlayable
{
  v76[1] = *MEMORY[0x1E4F143B8];
  videosPlayable = self->_videosPlayable;
  if (videosPlayable)
  {
    v3 = videosPlayable;
    goto LABEL_37;
  }
  v74 = [(VUIFamilySharingMediaItem *)self _itunesExtrasDictionary];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(VUIFamilySharingMediaItem *)self _bestRedownloadOffer];
  if (!v7)
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "[VUIFamilySharingMediaItem] - No personalized redownload offer found. Falling back to buy offers", buf, 2u);
    }

    id v7 = [(VUIFamilySharingMediaItem *)self _bestOffer];
  }
  v9 = [(VUIFamilySharingMediaItem *)self entity];
  v10 = [v9 type];

  v11 = [v10 stringDescription];
  v70 = [v7 dictionary];
  v73 = [v70 objectForKey:@"hlsUrl"];
  if ([v73 length])
  {
    [v5 setObject:v73 forKey:@"hlsUrl"];
    v12 = [MEMORY[0x1E4F1CB10] URLWithString:v73];
    v13 = objc_msgSend(v12, "vui_URLByAddingQueryParamWithName:value:", @"playback-type", @"download");
    v14 = [v13 absoluteString];

    if ([v14 length]) {
      [v5 setObject:v14 forKey:@"hlsDownloadUrl"];
    }
  }
  v72 = v7;
  v15 = [v7 buyParameters];
  [v5 setValue:v15 forKey:@"buyParams"];

  [v5 setValue:v11 forKey:@"mediaType"];
  [v5 setValue:&unk_1F3F3CE18 forKey:@"sharedPurchase"];
  [v5 setValue:*MEMORY[0x1E4FB5200] forKey:@"channelId"];
  objc_super v16 = [(VUIFamilySharingMediaItem *)self entity];
  v17 = [v16 identifier];
  [v5 setValue:v17 forKey:@"externalId"];

  v18 = [(VUIFamilySharingMediaItem *)self entity];
  v19 = [v18 identifier];
  [v5 setValue:v19 forKey:@"bookmarkId"];

  v20 = [(VUIFamilySharingMediaItem *)self entity];
  v21 = [v20 identifier];
  [v5 setValue:v21 forKey:@"adamId"];

  v22 = [(VUIFamilySharingMediaItem *)self entity];
  v23 = [v22 relationships];
  v24 = [v23 show];
  uint64_t v25 = [v24 identifier];

  v26 = [(VUIFamilySharingMediaItem *)self entity];
  v27 = [v26 relationships];
  v28 = [v27 season];
  uint64_t v29 = [v28 identifier];

  if (v25) {
    [v5 setObject:v25 forKey:@"showAdamID"];
  }
  if (v29) {
    [v5 setObject:v29 forKey:@"seasonAdamID"];
  }
  v69 = (void *)v25;
  if (v74) {
    [v5 setValue:v74 forKey:@"extras"];
  }
  v30 = [(VUIFamilySharingMediaItem *)self entity];
  v31 = [v30 contentRating];
  uint64_t v32 = [v31 rank];

  uint64_t v33 = [v11 rangeOfString:@"Movie"];
  v34 = +[VUIMediaEntityType movie];

  v68 = (void *)v29;
  if (v10 == v34)
  {
    v38 = VUIContentMetadataTypeMovie;
  }
  else
  {
    v35 = +[VUIMediaEntityType show];

    if (v10 == v35)
    {
      v38 = VUIContentMetadataTypeShow;
    }
    else
    {
      v36 = +[VUIMediaEntityType episode];

      if (v10 != v36)
      {
        v37 = 0;
        goto LABEL_25;
      }
      v38 = VUIContentMetadataTypeEpisode;
    }
  }
  v37 = *v38;
LABEL_25:
  v71 = v11;
  v67 = v37;
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v37, @"type");
  v39 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v32];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v39, @"ratingValue");

  v40 = (void *)MEMORY[0x1E4FA9E50];
  if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
    v40 = (void *)MEMORY[0x1E4FA9E58];
  }
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", *v40, @"ratingDomain");
  v41 = [(VUIFamilySharingMediaItem *)self entity];
  v42 = [v41 title];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v42, @"title");

  v43 = [(VUIFamilySharingMediaItem *)self entity];
  v44 = [v43 showTitle];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v44, @"showTitle");

  v45 = [(VUIFamilySharingMediaItem *)self entity];
  v46 = [v45 episodeNumber];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v46, @"episodeNumber");

  v47 = [(VUIFamilySharingMediaItem *)self entity];
  v48 = [v47 seasonNumber];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v48, @"seasonNumber");

  v49 = [(VUIFamilySharingMediaItem *)self entity];
  v50 = [v49 artworkURL];

  if (![v50 length]) {
    goto LABEL_34;
  }
  v51 = [MEMORY[0x1E4F1CA60] dictionary];
  [v51 setObject:v50 forKey:@"url"];
  [v51 setObject:&unk_1F3F3CE30 forKey:@"width"];
  [v51 setObject:&unk_1F3F3CE48 forKey:@"height"];
  [v6 setObject:v51 forKey:@"artwork"];
  uint64_t v52 = +[VUIMediaEntityType episode];
  v53 = v10;
  if (v10 == (void *)v52)
  {

LABEL_32:
    [v6 setObject:v51 forKey:@"showArtwork"];
    goto LABEL_33;
  }
  v54 = (void *)v52;
  v55 = +[VUIMediaEntityType show];

  v10 = v53;
  if (v53 == v55) {
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  v56 = v10;
  v57 = [(VUIFamilySharingMediaItem *)self entity];
  v58 = [v57 previewArtworkURL];

  if ([v58 length])
  {
    v59 = [MEMORY[0x1E4F1CA60] dictionary];
    [v59 setObject:v58 forKey:@"url"];
    [v59 setObject:&unk_1F3F3CE30 forKey:@"width"];
    [v59 setObject:&unk_1F3F3CE48 forKey:@"height"];
    [v6 setObject:v59 forKey:@"previewFrameArtwork"];
  }
  v60 = (void *)[v5 copy];
  v76[0] = v60;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
  v62 = +[VUIVideosPlayable videosPlayablesFromDictionaries:v61 andMetadataDictionary:v6];

  v63 = [v62 firstObject];
  v64 = self->_videosPlayable;
  self->_videosPlayable = v63;
  v65 = v63;

  v3 = self->_videosPlayable;
LABEL_37:
  return v3;
}

- (id)showIdentifier
{
  v3 = [(VUIFamilySharingMediaItem *)self entity];
  id v4 = [v3 relationships];

  if (v4)
  {
    id v5 = [(VUIFamilySharingMediaItem *)self entity];
    v6 = [v5 relationships];
    id v7 = [v6 show];

    id v8 = [v7 identifier];
    v9 = [VUIFamilySharingMediaEntityIdentifier alloc];
    v10 = +[VUIMediaEntityType show];
    v11 = [(VUIFamilySharingMediaEntityIdentifier *)v9 initWithEntityIdentifier:v8 mediaEntityType:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)seasonIdentifier
{
  v3 = [(VUIFamilySharingMediaItem *)self entity];
  id v4 = [v3 relationships];

  if (v4)
  {
    id v5 = [(VUIFamilySharingMediaItem *)self entity];
    v6 = [v5 relationships];
    id v7 = [v6 season];

    id v8 = [v7 identifier];
    v9 = [VUIFamilySharingMediaEntityIdentifier alloc];
    v10 = +[VUIMediaEntityType season];
    v11 = [(VUIFamilySharingMediaEntityIdentifier *)v9 initWithEntityIdentifier:v8 mediaEntityType:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)seasonCanonicalID
{
  return &stru_1F3E921E0;
}

- (id)showCanonicalID
{
  return &stru_1F3E921E0;
}

- (id)episodeNumber
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 episodeNumber];

  return v3;
}

- (id)seasonNumber
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 seasonNumber];

  return v3;
}

- (id)showTitle
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 showTitle];

  return v3;
}

- (id)genreTitle
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 genreTitle];

  return v3;
}

- (id)bookmark
{
  v2 = [(VUIFamilySharingMediaItem *)self relationships];
  v3 = [v2 playbackPosition];
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  if (v3)
  {
    v6 = [v3 positionInMilliseconds];
    [v6 floatValue];
    *(float *)&double v8 = v7 / 1000.0;
    v9 = [v5 numberWithFloat:v8];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  }

  return v9;
}

- (id)duration
{
  v2 = [(VUIFamilySharingMediaItem *)self _bestOffer];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 dictionary];
    id v5 = objc_msgSend(v4, "vui_numberForKey:", @"durationInMilliseconds");

    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v5 doubleValue], v6 / 1000.0 > 0.0))
    {
      float v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    }
    else
    {
      float v7 = 0;
    }
  }
  else
  {
    float v7 = 0;
  }

  return v7;
}

- (id)releaseDate
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  v3 = [v2 releaseDate];

  return v3;
}

- (id)releaseYear
{
  v2 = [(VUIFamilySharingMediaItem *)self releaseDate];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v5 = [v4 components:4 fromDate:v2];
  uint64_t v6 = [v5 year];
  float v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];

  return v7;
}

- (id)contentRating
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  id v3 = [v2 contentRating];

  return v3;
}

- (id)contentDescription
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  id v3 = [v2 standardDescription];

  return v3;
}

- (VUIFamilySharingRelationships)relationships
{
  relationships = self->_relationships;
  if (!relationships)
  {
    id v4 = [(VUIFamilySharingMediaItem *)self entity];
    id v5 = [v4 relationships];
    uint64_t v6 = self->_relationships;
    self->_relationships = v5;

    relationships = self->_relationships;
  }
  float v7 = relationships;
  return v7;
}

- (BOOL)isFamilySharingContent
{
  return 1;
}

- (id)_bestOffer
{
  id v3 = [(VUIFamilySharingMediaItem *)self entity];
  id v4 = [v3 offerListing];
  id v5 = [v4 bestStoreBuyOffer];

  if (!v5)
  {
    uint64_t v6 = [(VUIFamilySharingMediaItem *)self entity];
    float v7 = [v6 offerListing];
    id v5 = [v7 bestStoreGetOffer];
  }
  return v5;
}

- (id)_bestRedownloadOffer
{
  v2 = [(VUIFamilySharingMediaItem *)self entity];
  id v3 = [v2 personalizedOfferListing];
  id v4 = [v3 bestStoreRedownloadOffer];

  return v4;
}

- (NSString)buyParams
{
  buyParams = self->_buyParams;
  if (buyParams)
  {
    id v3 = buyParams;
  }
  else
  {
    id v5 = [(VUIFamilySharingMediaItem *)self _bestOffer];
    uint64_t v6 = v5;
    if (v5)
    {
      float v7 = [v5 buyParameters];
    }
    else
    {
      float v7 = &stru_1F3E921E0;
    }
    double v8 = self->_buyParams;
    self->_buyParams = &v7->isa;

    id v3 = self->_buyParams;
  }
  return v3;
}

- (NSString)personalizedBuyParams
{
  personalizedBuyParams = self->_personalizedBuyParams;
  if (personalizedBuyParams)
  {
    id v3 = personalizedBuyParams;
  }
  else
  {
    id v5 = [(VUIFamilySharingMediaItem *)self _bestRedownloadOffer];
    uint64_t v6 = v5;
    if (v5)
    {
      float v7 = [v5 buyParameters];
    }
    else
    {
      float v7 = &stru_1F3E921E0;
    }
    double v8 = self->_personalizedBuyParams;
    self->_personalizedBuyParams = &v7->isa;

    id v3 = self->_personalizedBuyParams;
  }
  return v3;
}

- (VUIMediaEntityAssetController)assetController
{
  assetController = self->_assetController;
  if (!assetController)
  {
    id v4 = [VUIUniversalAssetController alloc];
    id v5 = [(VUIFamilySharingMediaItem *)self videosPlayable];
    uint64_t v6 = [(VUIUniversalAssetController *)v4 initWithVideosPlayable:v5];
    float v7 = self->_assetController;
    self->_assetController = v6;

    assetController = self->_assetController;
  }
  return assetController;
}

- (id)_itunesExtrasDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(VUIFamilySharingMediaItem *)self _bestRedownloadOffer];
  if (!v4)
  {
    id v4 = [(VUIFamilySharingMediaItem *)self _bestOffer];
  }
  id v5 = [v4 dictionary];
  uint64_t v6 = objc_msgSend(v5, "vui_arrayForKey:", @"capabilities");

  if ([v6 containsObject:@"iTunesExtras"])
  {
    float v7 = [(VUIFamilySharingMediaItem *)self entity];
    double v8 = [v7 iTunesExtrasUrl];

    if (v8)
    {
      [v3 setValue:v8 forKey:@"extrasUrl"];
      v9 = [v4 buyParameters];
      [v3 setValue:v9 forKey:@"buyParams"];

      v10 = [(VUIFamilySharingMediaItem *)self storeID];
      [v3 setValue:v10 forKey:@"adamId"];

      v11 = [(VUIFamilySharingMediaItem *)self contentRating];
      v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 rank];
        if (v13)
        {
          v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v13];
          [v3 setValue:v14 forKey:@"ratingValue"];
        }
      }
    }
  }
  v15 = (void *)[v3 copy];

  return v15;
}

- (id)resolution
{
  v2 = [(VUIFamilySharingEntity *)self->_entity capabilities];
  int v3 = [v2 containsObject:@"4K"];

  if (v3) {
    return &unk_1F3F3CE60;
  }
  else {
    return 0;
  }
}

- (id)colorCapability
{
  int v3 = [(VUIFamilySharingEntity *)self->_entity capabilities];
  char v4 = [v3 containsObject:@"dolbyVision"];

  if (v4) {
    return &unk_1F3F3CE78;
  }
  uint64_t v6 = [(VUIFamilySharingEntity *)self->_entity capabilities];
  if ([v6 containsObject:@"HDR"])
  {

    return &unk_1F3F3CE90;
  }
  float v7 = [(VUIFamilySharingEntity *)self->_entity capabilities];
  int v8 = [v7 containsObject:@"HDR10+"];

  if (v8) {
    return &unk_1F3F3CE90;
  }
  return 0;
}

- (id)audioCapability
{
  v2 = [(VUIFamilySharingEntity *)self->_entity capabilities];
  int v3 = [v2 containsObject:@"dolbyAtmos"];

  if (v3) {
    return &unk_1F3F3CE90;
  }
  else {
    return 0;
  }
}

- (void)setArtworkURL:(id)a3
{
}

- (void)setPreviewArtworkURL:(id)a3
{
}

- (void)setITunesExtrasInfo:(id)a3
{
}

- (void)setRelationships:(id)a3
{
}

- (void)setVideosPlayable:(id)a3
{
}

- (void)setBuyParams:(id)a3
{
}

- (void)setPersonalizedBuyParams:(id)a3
{
}

- (VUIFamilySharingEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (void)setAssetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_personalizedBuyParams, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_iTunesExtrasInfo, 0);
  objc_storeStrong((id *)&self->_previewArtworkURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end