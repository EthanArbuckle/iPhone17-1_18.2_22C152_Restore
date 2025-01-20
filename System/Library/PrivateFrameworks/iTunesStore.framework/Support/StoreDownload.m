@interface StoreDownload
- (BOOL)_patchPackageDictionary:(id)a3 matchesInstallApplication:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSArray)assets;
- (NSNumber)downloaderAccountIdentifier;
- (NSNumber)familyAccountIdentifier;
- (NSNumber)matchedStatus;
- (NSNumber)purchaserAccountIdentifier;
- (NSNumber)redownloadedStatus;
- (StoreDownload)initWithContentsOfFile:(id)a3;
- (StoreDownload)initWithDownload:(id)a3;
- (id)_copyPinfValueWithField:(int64_t)a3;
- (id)_copySinfValueFromEpubRightsDataWithField:(int64_t)a3;
- (id)_copySinfValueWithField:(int64_t)a3;
- (id)_epubRightsSinfData;
- (id)_newAssetArrayWithDownloadAssets:(id)a3;
- (id)_newAssetPropertiesWithStoreDictionary:(id)a3 assetType:(id)a4;
- (id)_newAssetWithURL:(id)a3 assetType:(id)a4;
- (id)_newDateFormatter;
- (id)_newDeltaPackageAssetsWithAssetDictionary:(id)a3;
- (id)_newPrimaryAssetsWithAssetDictionary:(id)a3 assetType:(id)a4;
- (id)copyJobActivity;
- (id)description;
- (id)newDownloadProperties;
- (void)dealloc;
@end

@implementation StoreDownload

- (StoreDownload)initWithContentsOfFile:(id)a3
{
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:a3];
  if (v4)
  {
    v5 = v4;
    v6 = [(StoreDownload *)self initWithDictionary:v4];

    return v6;
  }
  else
  {

    return 0;
  }
}

- (StoreDownload)initWithDownload:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)StoreDownload;
  id v4 = [(StoreDownload *)&v15 init];
  if (v4)
  {
    v47[75] = "setKind:";
    v48[0] = 0;
    v48[1] = "setArtistName:";
    v48[2] = 0;
    v48[3] = "setBundleIdentifier:";
    v48[4] = 0;
    v48[5] = "setCancelDownloadURL:";
    v48[6] = sub_1000AFDA4;
    v48[7] = "setDownloadPermalink:";
    v48[8] = 0;
    v48[9] = "setCloudIdentifier:";
    v48[10] = 0;
    v48[11] = "setCollectionArtistName:";
    v48[12] = 0;
    v48[13] = "setCollectionIndexInCollectionGroup:";
    v48[14] = 0;
    v48[15] = "setCollectionName:";
    v48[16] = 0;
    v48[17] = "setComposerName:";
    v48[18] = 0;
    v48[19] = "setDocumentTargetIdentifier:";
    v48[20] = 0;
    v48[21] = "setDownloadKey:";
    v48[22] = 0;
    v48[23] = "setDurationInMilliseconds:";
    v48[24] = 0;
    v48[25] = "setEpisodeIdentifier:";
    v48[26] = 0;
    v48[27] = "setEpisodeSortIdentifier:";
    v48[28] = 0;
    v48[29] = "setGenre:";
    v48[30] = 0;
    v48[31] = "setIndexInCollection:";
    v48[32] = 0;
    v48[33] = "setLongDescription:";
    v48[34] = 0;
    v48[35] = "setLongSeasonDescription:";
    v48[36] = 0;
    v48[37] = "setNumberOfCollectionsInCollectionGroup:";
    v48[38] = 0;
    v48[39] = "setNumberOfItemsInCollection:";
    v48[40] = 0;
    v48[41] = "setPageProgressionDirection:";
    v48[42] = 0;
    v48[43] = "setPodcastEpisodeGUID:";
    v48[44] = 0;
    v48[45] = "setPodcastFeedURL:";
    v48[46] = sub_1000AFDA4;
    v48[47] = "setPodcastType:";
    v48[48] = 0;
    v48[49] = "setPurchaseDate:";
    v48[50] = sub_1000AFDB4;
    v48[51] = "setReleaseDate:";
    v48[52] = sub_1000AFDB4;
    v48[53] = "setReleaseYear:";
    v48[54] = 0;
    v48[55] = "setSeasonNumber:";
    v48[56] = 0;
    v48[57] = "setSeriesName:";
    v48[58] = 0;
    v48[59] = "setShortDescription:";
    v48[60] = 0;
    v48[61] = "setThumbnailImageURL:";
    v48[62] = sub_1000AFDA4;
    v48[63] = "setTitle:";
    v48[64] = 0;
    v48[65] = "setPublicationVersion:";
    v48[66] = 0;
    v48[67] = "setTransactionIdentifier:";
    v48[68] = 0;
    v48[69] = "setRedownloadActionParameters:";
    v48[70] = 0;
    v48[71] = "setThumbnailNewsstandBindingEdge:";
    v48[72] = 0;
    v48[73] = "setThumbnailNewsstandBindingType:";
    v48[74] = 0;
    v48[75] = "setViewStoreItemURL:";
    v48[76] = sub_1000AFDA4;
    v47[0] = @"kind";
    v47[1] = @"artist_name";
    v47[2] = @"bundle_id";
    v47[3] = @"cancel_url";
    v47[4] = @"download_permalink";
    v47[5] = @"store_saga_id";
    v47[6] = @"collection_artist_name";
    v47[7] = @"index_in_collection_group";
    v47[8] = @"collection_name";
    v47[9] = @"composer_name";
    v47[10] = @"document_target_id";
    v47[11] = @"store_download_key";
    v47[12] = @"duration_in_ms";
    v47[13] = @"episode_id";
    v47[14] = @"episode_sort_id";
    v47[15] = @"genre_name";
    v47[16] = @"index_in_collection";
    v47[17] = @"long_description";
    v47[18] = @"long_season_description";
    v47[19] = @"collection_group_count";
    v47[20] = @"collection_item_count";
    v47[21] = @"page_progression_direction";
    v47[22] = @"podcast_episode_guid";
    v47[23] = @"podcast_feed_url";
    v47[24] = @"podcast_type";
    v47[25] = @"store_purchase_date";
    v47[26] = @"release_date";
    v47[27] = @"release_year";
    v47[28] = @"season_number";
    v47[29] = @"series_name";
    v47[30] = @"short_description";
    v47[31] = @"thumbnail_url";
    v47[32] = @"title";
    v47[33] = @"store_publication_version";
    v47[34] = @"store_transaction_id";
    v47[35] = @"store_redownload_parameters";
    v47[36] = @"thumbnail_newsstand_binding_edge";
    v47[37] = @"thumbnail_newsstand_binding_type";
    v47[38] = @"store_url";
    v47[39] = @"store_artist_id";
    v47[40] = @"store_collection_id";
    v47[41] = @"store_composer_id";
    v47[42] = @"store_genre_id";
    v47[43] = @"store_item_id";
    v47[44] = @"store_preorder_id";
    v47[45] = @"artwork_is_prerendered";
    v47[46] = @"is_automatic";
    v47[47] = @"is_compilation";
    v47[48] = @"is_explicit";
    v47[49] = @"is_rental";
    v47[50] = @"is_sample";
    v47[51] = @"is_music_show";
    v47[52] = @"software_type";
    v47[53] = @"store_software_version_id";
    v47[54] = @"store_front_id";
    v47[55] = @"store_xid";
    v47[56] = @"artwork_template_name";
    v47[57] = @"is_store_queued";
    v47[58] = @"preferred_asset_flavor";
    v47[59] = @"is_hd";
    v47[60] = @"cancel_if_duplicate";
    v47[61] = @"bundle_version";
    v47[62] = @"store_cohort";
    v47[63] = @"is_redownload";
    v47[64] = @"beta_external_version_identifier";
    v47[65] = @"variant_id";
    v47[66] = @"rental_id";
    v47[67] = @"show_composer";
    v47[68] = @"work_name";
    v47[69] = @"has_hdr";
    v47[70] = @"is_hls";
    v47[71] = @"is_premium";
    v47[72] = @"has_4k";
    v47[73] = @"has_dolby_vision";
    v47[74] = @"hls_playlist_url";
    [a3 getValues:v16 forProperties:v47 count:75];
    if (SSDownloadKindIsPodcastKind()) {
      [(StoreDownload *)v4 setKeyStyle:1];
    }
    uint64_t v5 = 0;
    v6 = (uint64_t (**)(void))v48;
    do
    {
      uint64_t v7 = v16[v5];
      if (v7)
      {
        if (*v6)
        {
          uint64_t v7 = (*v6)(v16[v5]);
          v16[v5] = v7;
        }
        [(StoreDownload *)v4 performSelector:*(v6 - 1) withObject:v7];
      }
      ++v5;
      v6 += 2;
    }
    while (v5 != 39);
    uint64_t v8 = SSGetItemIdentifierFromValue();
    if (v8) {
      [(StoreDownload *)v4 setArtistIdentifier:v8];
    }
    uint64_t v9 = SSGetItemIdentifierFromValue();
    if (v9) {
      [(StoreDownload *)v4 setCollectionIdentifier:v9];
    }
    uint64_t v10 = SSGetItemIdentifierFromValue();
    if (v10) {
      [(StoreDownload *)v4 setComposerIdentifier:v10];
    }
    uint64_t v11 = SSGetItemIdentifierFromValue();
    if (v11) {
      [(StoreDownload *)v4 setGenreIdentifier:v11];
    }
    uint64_t v12 = SSGetItemIdentifierFromValue();
    if (v12) {
      [(StoreDownload *)v4 setItemIdentifier:v12];
    }
    uint64_t v13 = SSGetItemIdentifierFromValue();
    if (v13) {
      [(StoreDownload *)v4 setPreOrderIdentifier:v13];
    }
    if (v17) {
      -[StoreDownload setArtworkIsPrerendered:](v4, "setArtworkIsPrerendered:", [v17 BOOLValue]);
    }
    if (v18) {
      -[StoreDownload setAutomaticDownload:](v4, "setAutomaticDownload:", [v18 BOOLValue]);
    }
    if (v19) {
      -[StoreDownload setCompilation:](v4, "setCompilation:", [v19 BOOLValue]);
    }
    if (v20) {
      -[StoreDownload setExplicitContent:](v4, "setExplicitContent:", [v20 BOOLValue]);
    }
    if (v21) {
      -[StoreDownload setRental:](v4, "setRental:", [v21 BOOLValue]);
    }
    if (v22) {
      -[StoreDownload setSample:](v4, "setSample:", [v22 BOOLValue]);
    }
    if (v23) {
      -[StoreDownload setMusicShow:](v4, "setMusicShow:", [v23 BOOLValue]);
    }
    [(StoreDownload *)v4 setValue:v24 forMetadataKey:SSDownloadMetadataKeySoftwareType];
    [(StoreDownload *)v4 setValue:v25 forMetadataKey:SSDownloadMetadataKeySoftwareExternalVersionID];
    [(StoreDownload *)v4 setValue:v26 forMetadataKey:SSDownloadMetadataKeyStoreFrontID];
    [(StoreDownload *)v4 setValue:v27 forMetadataKey:SSDownloadMetadataKeyXID];
    [(StoreDownload *)v4 setValue:v28 forMetadataKey:SSDownloadMetadataKeyArtworkTemplateName];
    [(StoreDownload *)v4 setValue:v29 forMetadataKey:SSDownloadMetadataKeyIsInStoreQueue];
    [(StoreDownload *)v4 setPreferredAssetFlavor:v30];
    -[StoreDownload setHighDefinition:](v4, "setHighDefinition:", [v31 BOOLValue]);
    [(StoreDownload *)v4 setValue:v32 forMetadataKey:SSDownloadMetadataKeyCancelIfDuplicate];
    [(StoreDownload *)v4 setValue:v33 forMetadataKey:SSDownloadMetadataKeyBundleVersion];
    [(StoreDownload *)v4 setValue:v34 forMetadataKey:SSDownloadMetadataKeyStoreCohort];
    [(StoreDownload *)v4 setValue:v35 forMetadataKey:SSDownloadMetadataKeyIsPurchaseRedownload];
    [(StoreDownload *)v4 setValue:v36 forMetadataKey:SSDownloadMetadataKeyBetaExternalVersionIdentifier];
    [(StoreDownload *)v4 setValue:v37 forMetadataKey:@"variantID"];
    [(StoreDownload *)v4 setValue:v38 forMetadataKey:SSDownloadMetadataKeyRentalIdentifier];
    [(StoreDownload *)v4 setValue:v39 forMetadataKey:SSDownloadMetadataKeyShowComposer];
    [(StoreDownload *)v4 setValue:v40 forMetadataKey:SSDownloadMetadataKeyWorkName];
    [(StoreDownload *)v4 setValue:v41 forMetadataKey:SSDownloadMetadataKeyHasHDR];
    [(StoreDownload *)v4 setValue:v42 forMetadataKey:SSDownloadMetadataKeyIsHLS];
    [(StoreDownload *)v4 setValue:v43 forMetadataKey:SSDownloadMetadataKeyIsPremium];
    [(StoreDownload *)v4 setValue:v44 forMetadataKey:SSDownloadMetadataKeyHas4K];
    [(StoreDownload *)v4 setValue:v45 forMetadataKey:SSDownloadMetadataKeyHasDolbyVision];
    [(StoreDownload *)v4 setValue:v46 forMetadataKey:SSDownloadMetadataKeyHLSPlaylistURL];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)StoreDownload;
  [(StoreDownload *)&v3 dealloc];
}

- (NSArray)assets
{
  objc_super v3 = (NSArray *)+[NSMutableArray array];
  id v4 = [(StoreDownload *)self primaryAssetDictionary];
  if (v4 || (id v4 = [(StoreDownload *)self dictionary]) != 0)
  {
    id v5 = [(StoreDownload *)self _newDeltaPackageAssetsWithAssetDictionary:v4];
    [(NSArray *)v3 addObjectsFromArray:v5];

    id v6 = [(StoreDownload *)self _newPrimaryAssetsWithAssetDictionary:v4 assetType:SSDownloadAssetTypeMedia];
    [(NSArray *)v3 addObjectsFromArray:v6];

    uint64_t v7 = [(NSArray *)v3 count];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "setValue:forProperty:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", i), @"asset_order");
    }
  }
  id v10 = [(StoreDownload *)self fullSizeImageURL];
  if (objc_msgSend(objc_msgSend(v10, "host"), "length"))
  {
    id v11 = [(StoreDownload *)self _newAssetWithURL:v10 assetType:SSDownloadAssetTypeArtwork];
    [(NSArray *)v3 addObject:v11];
  }
  id v12 = [(StoreDownload *)self podcastFeedURL];
  if (objc_msgSend(objc_msgSend(v12, "host"), "length"))
  {
    id v13 = [(StoreDownload *)self _newAssetWithURL:v12 assetType:SSDownloadAssetTypeXMLFeed];
    [(NSArray *)v3 addObject:v13];
  }
  id v14 = [(StoreDownload *)self transitMapDataURL];
  if (objc_msgSend(objc_msgSend(v14, "host"), "length"))
  {
    id v15 = [(StoreDownload *)self _newAssetWithURL:v14 assetType:SSDownloadAssetTypeTransitMapsData];
    [(NSArray *)v3 addObject:v15];
  }
  id v16 = [(StoreDownload *)self thumbnailImageCollection];
  id v17 = [v16 imagesForKind:SSItemArtworkKindNewsstandIcon];
  if ([v17 count])
  {
    id v18 = objc_msgSend(objc_msgSend(v17, "lastObject"), "URL");
    if (objc_msgSend(objc_msgSend(v18, "host"), "length"))
    {
      id v19 = [(StoreDownload *)self _newAssetWithURL:v18 assetType:SSDownloadAssetTypeNewsstandArtwork];
      [(NSArray *)v3 addObject:v19];
    }
  }
  return v3;
}

- (NSNumber)matchedStatus
{
  objc_super v3 = (NSNumber *)[(StoreDownload *)self valueForMetadataKey:@"matched-status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  id v5 = [(StoreDownload *)self _copyPinfValueWithField:0];

  return (NSNumber *)v5;
}

- (NSNumber)redownloadedStatus
{
  objc_super v3 = (NSNumber *)[(StoreDownload *)self valueForMetadataKey:@"redownloaded-status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  id v5 = [(StoreDownload *)self _copyPinfValueWithField:1];

  return (NSNumber *)v5;
}

- (NSNumber)purchaserAccountIdentifier
{
  result = (NSNumber *)[(StoreDownload *)self _copySinfValueWithField:2];
  if (!result)
  {
    id v4 = [(StoreDownload *)self _copySinfValueFromEpubRightsDataWithField:2];
    return (NSNumber *)v4;
  }
  return result;
}

- (NSNumber)downloaderAccountIdentifier
{
  result = (NSNumber *)[(StoreDownload *)self _copySinfValueWithField:3];
  if (!result)
  {
    id v4 = [(StoreDownload *)self _copySinfValueFromEpubRightsDataWithField:3];
    return (NSNumber *)v4;
  }
  return result;
}

- (NSNumber)familyAccountIdentifier
{
  result = (NSNumber *)[(StoreDownload *)self _copySinfValueWithField:4];
  if (!result)
  {
    id v4 = [(StoreDownload *)self _copySinfValueFromEpubRightsDataWithField:4];
    return (NSNumber *)v4;
  }
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:[(StoreDownload *)self dictionary] format:200 options:0 error:a5];
  if (v8)
  {
    LOBYTE(v8) = [(NSData *)v8 writeToFile:a3 options:a4 error:a5];
  }
  return (char)v8;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)StoreDownload;
  return +[NSString stringWithFormat:@"%@: %llu / %@", [(StoreDownload *)&v3 description], [(StoreDownload *)self itemIdentifier], [(StoreDownload *)self transactionIdentifier]];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  id v6 = [(StoreDownload *)self itemIdentifier];
  if (v6 != [a3 itemIdentifier]) {
    return 0;
  }
  id v7 = [(StoreDownload *)self transactionIdentifier];
  if (v7 == [a3 transactionIdentifier]) {
    return 1;
  }
  id v8 = [(StoreDownload *)self transactionIdentifier];
  id v9 = [a3 transactionIdentifier];

  return [v8 isEqual:v9];
}

- (id)newDownloadProperties
{
  v7.receiver = self;
  v7.super_class = (Class)StoreDownload;
  id v3 = [(StoreDownload *)&v7 newDownloadProperties];
  id v4 = [(StoreDownload *)self matchedStatus];
  if (v4) {
    [v3 setObject:v4 forKey:SSDownloadPropertyStoreMatchStatus];
  }
  uint64_t v5 = [(StoreDownload *)self redownloadedStatus];
  if (v5) {
    [v3 setObject:v5 forKey:SSDownloadPropertyStoreRedownloadStatus];
  }
  return v3;
}

- (id)_copyPinfValueWithField:(int64_t)a3
{
  id v4 = [(StoreDownload *)self sinfs];
  if (![v4 count]) {
    return 0;
  }
  uint64_t v5 = [[DownloadDRM alloc] initWithSinfArray:v4];
  id v6 = [(DownloadDRM *)v5 pinfsArray];
  if (v6) {
    id v7 = [(SinfsArray *)v6 copyValueForField:a3 error:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_copySinfValueWithField:(int64_t)a3
{
  id v4 = [(StoreDownload *)self sinfs];
  if (![v4 count]) {
    return 0;
  }
  uint64_t v5 = [[DownloadDRM alloc] initWithSinfArray:v4];
  id v6 = [(DownloadDRM *)v5 sinfsArray];
  if (v6) {
    id v7 = [(SinfsArray *)v6 copyValueForField:a3 error:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_copySinfValueFromEpubRightsDataWithField:(int64_t)a3
{
  id v4 = [(StoreDownload *)self _epubRightsSinfData];
  if (!v4) {
    return 0;
  }
  id v8 = v4;
  uint64_t v5 = [[SinfsArray alloc] initWithSINFs:+[NSArray arrayWithObjects:&v8 count:1]];
  id v6 = [(SinfsArray *)v5 copyValueForField:a3 error:0];

  return v6;
}

- (id)_epubRightsSinfData
{
  epubRightsSinfData = self->_epubRightsSinfData;
  if (!epubRightsSinfData)
  {
    id v4 = [[EpubRightsDataParser alloc] initWithXMLData:[(StoreDownload *)self epubRightsData]];
    self->_epubRightsSinfData = [(EpubRightsDataParser *)v4 sinfData];

    epubRightsSinfData = self->_epubRightsSinfData;
  }
  uint64_t v5 = epubRightsSinfData;

  return v5;
}

- (id)_newAssetPropertiesWithStoreDictionary:(id)a3 assetType:(id)a4
{
  id v7 = [a3 objectForKey:SSDownloadMetadataKeyURL];
  if (!v7) {
    id v7 = [a3 objectForKey:SSDownloadMetadataKeyURL2];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 length]) {
    return 0;
  }
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:a4 forKey:@"asset_type"];
  [v8 setObject:v7 forKey:@"url"];
  id v9 = [a3 objectForKey:SSDownloadMetadataKeyDownloadKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setObject:v9 forKey:@"store_download_key"];
  }
  uint64_t v10 = SSDownloadMetadataKeyFileExtension;
  id v11 = [a3 objectForKey:SSDownloadMetadataKeyFileExtension];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [a4 isEqualToString:SSDownloadAssetTypeMedia]
    && (id v11 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"metadata"), "objectForKey:", v10),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v8 setObject:v11 forKey:@"path_extension"];
  }
  uint64_t v12 = SSDownloadMetadataKeyIsZipStreamable;
  id v13 = [a3 objectForKey:SSDownloadMetadataKeyIsZipStreamable];
  if (!v13) {
    id v13 = -[StoreDownload valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", v12, 0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setObject:v13 forKey:@"is_zip_streamable"];
  }
  uint64_t v14 = SSDownloadMetadataKeyUncompressedSize;
  id v15 = [a3 objectForKey:SSDownloadMetadataKeyUncompressedSize];
  if (!v15) {
    id v15 = -[StoreDownload valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", v14, 0);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v15, "unsignedLongLongValue")), @"uncompressed_size");
  }
  id v16 = [a3 objectForKey:SSDownloadMetadataKeyAssetInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = a3;
  }
  if (v17)
  {
    id v18 = [v17 objectForKey:SSDownloadMetadataKeyAssetFileSize];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setObject:v18 forKey:@"bytes_total"];
    }
    else {
      id v18 = 0;
    }
    id v19 = [v17 objectForKey:SSDownloadMetadataKeyAssetFlavor];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setObject:v19 forKey:@"store_flavor"];
    }
  }
  else
  {
    id v18 = 0;
  }
  id v20 = [a3 objectForKey:SSDownloadMetadataKeyVariantIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setObject:v20 forKey:@"variant_id"];
  }
  id v21 = [a3 objectForKey:SSDownloadMetadataKeyHashChunks];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = (NSArray *)[v21 objectForKey:SSDownloadMetadataKeyHashChunkHashes];
    id v18 = [v21 objectForKey:SSDownloadMetadataKeyHashChunkSize];
  }
  else
  {
    id v23 = [a3 objectForKey:SSDownloadMetadataKeyMD5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v22 = +[NSArray arrayWithObject:v23];
    }
    else {
      id v22 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setObject:v18 forKey:@"bytes_to_hash"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = +[NSPropertyListSerialization dataWithPropertyList:v22 format:200 options:0 error:0];
    if (v24) {
      [v8 setObject:v24 forKey:@"hash_array"];
    }
  }
  id v25 = [a3 objectForKey:SSDownloadMetadataKeySINFs];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v25 count])
  {
    uint64_t v26 = [[DownloadDRM alloc] initWithSinfArray:v25];
    if ([(DownloadDRM *)v26 isDRMFree]) {
      objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"is_drm_free");
    }
    uint64_t v27 = +[NSPropertyListSerialization dataWithPropertyList:v25 format:200 options:0 error:0];
    if ([(NSData *)v27 length]) {
      [v8 setObject:v27 forKey:@"sinfs_data"];
    }
  }
  id v28 = [a3 objectForKey:SSDownloadMetadataKeyIsHLS];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v28 BOOLValue]) {
    [v8 setObject:v28 forKey:@"is_hls"];
  }
  id v29 = [a3 objectForKey:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setObject:v29 forKey:@"path_extension"];
  }
  uint64_t v30 = (NSNull *)[a3 objectForKey:SSDownloadMetadataKeyInitialODRSize];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v30 = +[NSNull null];
  }
  [v8 setObject:v30 forKey:@"initial_odr_size"];
  return v8;
}

- (id)_newAssetWithURL:(id)a3 assetType:(id)a4
{
  id v5 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:a3];
  [v5 setITunesStoreRequest:1];
  id v6 = [[DownloadAsset alloc] initWithURLRequestProperties:v5];
  [(DownloadAsset *)v6 setValue:a4 forProperty:@"asset_type"];

  return v6;
}

- (id)_newDeltaPackageAssetsWithAssetDictionary:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [a3 objectForKey:SSDownloadMetadataKeyDeltaPackages];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = +[LSApplicationProxy applicationProxyForIdentifier:[(StoreDownload *)self bundleIdentifier]];
    if ([v8 purchaserDSID])
    {
      id v9 = +[SSLogConfig sharedDaemonConfig];
      if (!v9) {
        id v9 = +[SSLogConfig sharedConfig];
      }
      unsigned int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
        v11 &= 2u;
      }
      if (v11)
      {
        int v46 = 138412546;
        uint64_t v47 = objc_opt_class();
        __int16 v48 = 2112;
        id v49 = [(StoreDownload *)self bundleIdentifier];
        LODWORD(v40) = 22;
        uint64_t v38 = &v46;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          id v13 = (void *)v12;
          uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v46, v40);
          free(v13);
          uint64_t v38 = (int *)v14;
          SSFileLog();
        }
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16, v38);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v6);
            }
            uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [(StoreDownload *)self _patchPackageDictionary:v19 matchesInstallApplication:v8])
            {
              id v20 = +[SSLogConfig sharedDaemonConfig];
              if (!v20) {
                id v20 = +[SSLogConfig sharedConfig];
              }
              unsigned int v21 = [v20 shouldLog];
              if ([v20 shouldLogToDisk]) {
                int v22 = v21 | 2;
              }
              else {
                int v22 = v21;
              }
              if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_INFO)) {
                v22 &= 2u;
              }
              if (v22)
              {
                uint64_t v23 = objc_opt_class();
                id v24 = [(StoreDownload *)self bundleIdentifier];
                int v46 = 138412546;
                uint64_t v47 = v23;
                __int16 v48 = 2112;
                id v49 = v24;
                LODWORD(v40) = 22;
                uint64_t v39 = &v46;
                uint64_t v25 = _os_log_send_and_compose_impl();
                if (v25)
                {
                  uint64_t v26 = (void *)v25;
                  uint64_t v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v46, v40);
                  free(v26);
                  uint64_t v39 = (int *)v27;
                  SSFileLog();
                }
              }
              id v28 = -[StoreDownload _newPrimaryAssetsWithAssetDictionary:assetType:](self, "_newPrimaryAssetsWithAssetDictionary:assetType:", v19, SSDownloadAssetTypeDeltaPackage, v39);
              if (v28)
              {
                id v29 = v28;
                [v5 addObjectsFromArray:v28];
              }
              else
              {
                id v31 = +[SSLogConfig sharedDaemonConfig];
                if (!v31) {
                  id v31 = +[SSLogConfig sharedConfig];
                }
                unsigned int v32 = [v31 shouldLog];
                if ([v31 shouldLogToDisk]) {
                  int v33 = v32 | 2;
                }
                else {
                  int v33 = v32;
                }
                if (!os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                  v33 &= 2u;
                }
                if (v33)
                {
                  uint64_t v34 = objc_opt_class();
                  id v35 = [(StoreDownload *)self bundleIdentifier];
                  int v46 = 138412546;
                  uint64_t v47 = v34;
                  __int16 v48 = 2112;
                  id v49 = v35;
                  LODWORD(v40) = 22;
                  uint64_t v36 = _os_log_send_and_compose_impl();
                  if (v36)
                  {
                    uint64_t v37 = (void *)v36;
                    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v46, v40);
                    free(v37);
                    SSFileLog();
                  }
                }
              }
              goto LABEL_35;
            }
          }
          id v16 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
LABEL_35:
  }
  return v5;
}

- (id)_newPrimaryAssetsWithAssetDictionary:(id)a3 assetType:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [(StoreDownload *)self _newAssetPropertiesWithStoreDictionary:a3 assetType:a4];
  if (v8)
  {
    id v9 = v8;
    [a3 objectForKey:@"local-server-info"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v9, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"is_local_cache_server");
    }
    if (![v9 objectForKey:@"path_extension"])
    {
      id v10 = [(StoreDownload *)self fileExtension];
      if (v10) {
        [v9 setObject:v10 forKey:@"path_extension"];
      }
    }
    int v11 = objc_alloc_init(DownloadAsset);
    [(DownloadAsset *)v11 setValuesWithDictionary:v9];
    [v7 addObject:v11];
  }
  return v7;
}

- (BOOL)_patchPackageDictionary:(id)a3 matchesInstallApplication:(id)a4
{
  id v6 = [a4 externalVersionIdentifier];
  id v7 = [a3 objectForKey:SSDownloadMetadataKeyPriorVersionExternalIdentifier];
  unsigned int v8 = [v6 isEqual:v7];
  if (v8)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v27 = 138413058;
      uint64_t v28 = objc_opt_class();
      __int16 v29 = 2112;
      id v30 = [a4 bundleIdentifier];
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      id v34 = v7;
      LODWORD(v26) = 42;
      uint64_t v25 = &v27;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v27, v26);
        free(v13);
        uint64_t v25 = (int *)v14;
        SSFileLog();
      }
    }
    id v15 = objc_msgSend(a4, "applicationVariant", v25);
    id v16 = [a3 objectForKey:SSDownloadMetadataKeyVariantIdentifier];
    if (v15 == v16 || (unsigned int v8 = [v15 isEqual:v16]) != 0)
    {
      id v17 = +[SSLogConfig sharedDaemonConfig];
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig];
      }
      unsigned int v18 = [v17 shouldLog];
      if ([v17 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v19 &= 2u;
      }
      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        id v21 = [a4 bundleIdentifier];
        int v27 = 138413058;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        id v30 = v21;
        __int16 v31 = 2112;
        id v32 = v15;
        __int16 v33 = 2112;
        id v34 = v16;
        LODWORD(v26) = 42;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v27, v26);
          free(v23);
          SSFileLog();
        }
      }
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (id)copyJobActivity
{
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  id v4 = +[NSNumber numberWithLongLong:[(StoreDownload *)self artistIdentifier]];
  [v3 setArtistID:v4];

  id v5 = [(StoreDownload *)self artistName];
  [v3 setArtistName:v5];

  id v6 = [(StoreDownload *)self bundleIdentifier];
  [v3 setBundleID:v6];

  id v7 = [(StoreDownload *)self redownloadActionParameters];
  [v3 setBuyParams:v7];

  unsigned int v8 = [(StoreDownload *)self cancelDownloadURL];
  id v9 = [v8 absoluteString];
  [v3 setCancelDownloadURL:v9];

  unsigned int v10 = [(StoreDownload *)self collectionName];
  [v3 setCollectionName:v10];

  int v11 = [(StoreDownload *)self enableExtensions];
  [v3 setEnableExtensions:v11];

  objc_msgSend(v3, "setExplicitContent:", -[StoreDownload isExplicitContent](self, "isExplicitContent"));
  uint64_t v12 = [(StoreDownload *)self genre];
  [v3 setGenre:v12];

  id v13 = +[NSNumber numberWithLongLong:[(StoreDownload *)self genreIdentifier]];
  [v3 setGenreID:v13];

  uint64_t v14 = +[NSNumber numberWithLongLong:[(StoreDownload *)self itemIdentifier]];
  [v3 setItemID:v14];

  id v15 = [(StoreDownload *)self kind];
  [v3 setKind:v15];

  objc_msgSend(v3, "setHasMessagesExtension:", -[StoreDownload hasMessagesExtension](self, "hasMessagesExtension"));
  objc_msgSend(v3, "setLaunchProhibited:", -[StoreDownload launchProhibited](self, "launchProhibited"));
  id v16 = [(StoreDownload *)self messagesArtworkURL];
  id v17 = [v16 absoluteString];
  [v3 setMessagesArtworkURL:v17];

  unsigned int v18 = [(StoreDownload *)self purchaseDate];
  [v3 setPurchaseDate:v18];

  int v19 = [(StoreDownload *)self releaseDate];
  [v3 setReleaseDate:v19];

  uint64_t v20 = [(StoreDownload *)self downloadKey];
  [v3 setStoreDownloadKey:v20];

  id v21 = [(StoreDownload *)self transactionIdentifier];
  [v3 setStoreTransactionID:v21];

  objc_msgSend(v3, "setSoftwareIconNeedsShine:", -[StoreDownload artworkIsPrerendered](self, "artworkIsPrerendered"));
  uint64_t v22 = [(StoreDownload *)self thumbnailImageURL];
  uint64_t v23 = [v22 absoluteString];
  [v3 setThumbnailURL:v23];

  id v24 = [(StoreDownload *)self title];
  [v3 setTitle:v24];

  uint64_t v25 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyAppReceiptData];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setAppReceiptData:v25];
  }
  uint64_t v26 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyBetaExternalVersionIdentifier];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setBetaExternalVersionIdentifier:v26];
  }
  int v27 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyBundleVersion];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setBundleVersion:v27];
  }
  uint64_t v28 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyCancelIfDuplicate];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setCancelIfDuplicate:", objc_msgSend(v28, "BOOLValue"));
  }
  __int16 v29 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyIsPurchaseRedownload];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsPurchasedRedownload:", objc_msgSend(v29, "BOOLValue"));
  }
  id v30 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyIAdAttribution];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setIAdAttribution:v30];
  }
  __int16 v31 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyIAdConversionDate];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = [(StoreDownload *)self _newDateFormatter];
    __int16 v33 = [v32 dateFromString:v31];
    if (v33) {
      [v3 setIAdConversionDate:v33];
    }
  }
  id v34 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyIAdImpressionDate];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = [(StoreDownload *)self _newDateFormatter];
    uint64_t v36 = [v35 dateFromString:v34];
    if (v36) {
      [v3 setIAdImpressionDate:v36];
    }
  }
  uint64_t v37 = [(StoreDownload *)self valueForMetadataKey:SSDownloadPropertyIsInStoreQueue];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsInQueue:", objc_msgSend(v37, "BOOLValue"));
  }
  uint64_t v38 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyStoreFrontID];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v39 = [v38 stringValue];
    [v3 setStorefront:v39];
  }
  uint64_t v40 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyRating];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
    long long v42 = [v41 objectForKey:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 setRatingLabel:v42];
    }
    long long v43 = [v41 objectForKey:@"rank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 setRatingRank:v43];
    }
  }
  long long v44 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeySoftwareExternalVersionID];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setSoftwareVersionExternalIdentifier:v44];
  }
  uint64_t v45 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyStoreCohort];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setStoreCohort:v45];
  }
  int v46 = [(StoreDownload *)self valueForMetadataKey:SSDownloadMetadataKeyVariantIdentifier];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setVariantID:v46];
  }
  uint64_t v47 = [(StoreDownload *)self assets];
  id v48 = [(StoreDownload *)self _newAssetArrayWithDownloadAssets:v47];

  [v3 setAssets:v48];
  return v3;
}

- (id)_newAssetArrayWithDownloadAssets:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "copyJobAsset", (void)v13);
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (id)_newDateFormatter
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  [v2 setLenient:1];
  id v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  return v2;
}

@end