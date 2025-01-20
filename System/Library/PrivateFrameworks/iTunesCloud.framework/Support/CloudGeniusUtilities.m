@interface CloudGeniusUtilities
- (CloudGeniusUtilities)init;
- (NSArray)allGeniusPlaylistPropertiesWithML3ContainerProperties;
- (NSArray)allGeniusTrackPropertiesWithML3TrackProperties;
- (NSArray)allML3ContainerPropertiesWithGeniusPlaylistProperties;
- (NSArray)allML3TrackPropertiesWithGeniusTrackProperties;
- (id)geniusPlaylistPropertyForML3ContainerProperty:(id)a3;
- (id)geniusTrackPropertyForML3TrackProperty:(id)a3;
- (id)geniusValueForML3ContainerProperty:(id)a3 value:(id)a4;
- (id)geniusValueForML3TrackProperty:(id)a3 value:(id)a4;
- (void)_initializeMappings;
- (void)setAllGeniusPlaylistPropertiesWithML3ContainerProperties:(id)a3;
- (void)setAllGeniusTrackPropertiesWithML3TrackProperties:(id)a3;
- (void)setAllML3ContainerPropertiesWithGeniusPlaylistProperties:(id)a3;
- (void)setAllML3TrackPropertiesWithGeniusTrackProperties:(id)a3;
@end

@implementation CloudGeniusUtilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allGeniusPlaylistPropertiesWithML3ContainerProperties, 0);
  objc_storeStrong((id *)&self->_allML3ContainerPropertiesWithGeniusPlaylistProperties, 0);
  objc_storeStrong((id *)&self->_allGeniusTrackPropertiesWithML3TrackProperties, 0);
  objc_storeStrong((id *)&self->_allML3TrackPropertiesWithGeniusTrackProperties, 0);
  objc_storeStrong((id *)&self->_ml3ContainerPropertyTransformMap, 0);
  objc_storeStrong((id *)&self->_ml3ContainerPropertyToGeniusPlaylistPropertyMap, 0);
  objc_storeStrong((id *)&self->_ml3TrackPropertyTransformMap, 0);

  objc_storeStrong((id *)&self->_ml3TrackPropertyToGeniusTrackPropertyMap, 0);
}

- (void)setAllGeniusPlaylistPropertiesWithML3ContainerProperties:(id)a3
{
}

- (NSArray)allGeniusPlaylistPropertiesWithML3ContainerProperties
{
  return self->_allGeniusPlaylistPropertiesWithML3ContainerProperties;
}

- (void)setAllML3ContainerPropertiesWithGeniusPlaylistProperties:(id)a3
{
}

- (NSArray)allML3ContainerPropertiesWithGeniusPlaylistProperties
{
  return self->_allML3ContainerPropertiesWithGeniusPlaylistProperties;
}

- (void)setAllGeniusTrackPropertiesWithML3TrackProperties:(id)a3
{
}

- (NSArray)allGeniusTrackPropertiesWithML3TrackProperties
{
  return self->_allGeniusTrackPropertiesWithML3TrackProperties;
}

- (void)setAllML3TrackPropertiesWithGeniusTrackProperties:(id)a3
{
}

- (NSArray)allML3TrackPropertiesWithGeniusTrackProperties
{
  return self->_allML3TrackPropertiesWithGeniusTrackProperties;
}

- (void)_initializeMappings
{
  id v78 = +[NSMutableDictionary dictionary];
  v2 = +[NSMutableDictionary dictionary];
  v3 = +[NSMutableArray array];
  v4 = +[NSMutableArray array];
  v5 = objc_alloc_init(CloudGeniusBooleanTransform);
  v6 = objc_alloc_init(CloudGeniusDateTransform);
  v73 = objc_alloc_init(CloudGeniusNegatedBooleanTransform);
  v77 = objc_alloc_init(CloudGeniusOnlyIfDoesNotHaveValueTransform);
  v74 = objc_alloc_init(CloudGeniusOnlyIfHasValueTransform);
  v75 = objc_alloc_init(CloudGeniusOnlyIfNegatedBooleanTransform);
  v7 = objc_alloc_init(CloudGeniusOnlyIfNonEmptyStringTransform);
  v76 = objc_alloc_init(CloudGeniusOnlyIfNonZeroDoubleTransform);
  v8 = objc_alloc_init(CloudGeniusOnlyIfNonZeroIntegerTransform);
  uint64_t v9 = ML3TrackPropertyTitle;
  id v10 = v3;
  id v11 = v4;
  [v78 setObject:@"item-name" forKey:v9];
  [v10 addObject:v9];

  [v11 addObject:@"item-name"];
  uint64_t v12 = ML3TrackPropertyStoreItemID;
  id v13 = v10;
  id v14 = v11;
  [v78 setObject:@"item-id" forKey:v12];
  [v13 addObject:v12];

  [v14 addObject:@"item-id"];
  uint64_t v15 = ML3TrackPropertyAlbum;
  id v16 = v13;
  id v17 = v14;
  [v78 setObject:@"playlist-name" forKey:v15];
  [v16 addObject:v15];

  [v17 addObject:@"playlist-name"];
  sub_10009FCD8(v78, v16, v17, v2, ML3TrackPropertyStorePlaylistID, @"playlist-id", v8);
  uint64_t v18 = ML3TrackPropertyAlbumArtist;
  id v19 = v16;
  id v20 = v17;
  [v78 setObject:@"playlist-artist-name" forKey:v18];
  [v19 addObject:v18];

  [v20 addObject:@"playlist-artist-name"];
  sub_10009FCD8(v78, v19, v20, v2, ML3TrackPropertyAlbumArtistStoreID, @"playlist-artist-id", v8);
  uint64_t v21 = ML3TrackPropertyArtist;
  id v22 = v19;
  id v23 = v20;
  [v78 setObject:@"artist-name" forKey:v21];
  [v22 addObject:v21];

  [v23 addObject:@"artist-name"];
  sub_10009FCD8(v78, v22, v23, v2, ML3TrackPropertyArtistStoreID, @"artist-id", v8);
  uint64_t v24 = ML3TrackPropertyComposer;
  id v25 = v22;
  id v26 = v23;
  [v78 setObject:@"composer-name" forKey:v24];
  [v25 addObject:v24];

  [v26 addObject:@"composer-name"];
  sub_10009FCD8(v78, v25, v26, v2, ML3TrackPropertyStoreComposerID, @"composer-id", v8);
  uint64_t v27 = ML3TrackPropertyGenre;
  id v28 = v25;
  id v29 = v26;
  [v78 setObject:@"genre-name" forKey:v27];
  [v28 addObject:v27];

  [v29 addObject:@"genre-name"];
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyStoreGenreID, @"genre-id", v8);
  v70 = v5;
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyIsCompilation, @"compilation", v5);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyYear, @"year", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyTotalTime, @"duration", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyTrackNumber, @"track-number", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyTrackCount, @"track-count", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyDiscNumber, @"disc-number", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyDiscCount, @"disc-count", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyStoreStorefrontID, @"store-front-id", v8);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyStoreXID, @"xid", v7);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyDateAdded, @"added-date", v6);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyDateModified, @"modified-date", v6);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyStoreDatePurchased, @"purchased-date", v6);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyDateReleased, @"released-date", v6);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyCopyright, @"copyright", v7);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyDatePlayed, @"last-played-date", v6);
  sub_10009FCD8(v78, v28, v29, v2, ML3TrackPropertyHasBeenPlayed, @"has-been-played", v5);
  uint64_t v30 = ML3TrackPropertyPlayCountUser;
  id v31 = v28;
  id v32 = v29;
  [v78 setObject:@"play-count" forKey:v30];
  [v31 addObject:v30];

  [v32 addObject:@"play-count"];
  uint64_t v33 = ML3TrackPropertySkipCountUser;
  id v34 = v31;
  id v35 = v32;
  [v78 setObject:@"skip-count" forKey:v33];
  [v34 addObject:v33];

  [v35 addObject:@"skip-count"];
  uint64_t v36 = ML3TrackPropertyUserRating;
  id v37 = v34;
  id v38 = v35;
  [v78 setObject:@"user-rating" forKey:v36];
  [v37 addObject:v36];

  [v38 addObject:@"user-rating"];
  uint64_t v39 = ML3TrackPropertyUserAlbumRating;
  id v40 = v37;
  id v41 = v38;
  [v78 setObject:@"album-rating" forKey:v39];
  [v40 addObject:v39];

  [v41 addObject:@"album-rating"];
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyIsUserDisabled, @"item-checked", v73);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyComment, @"comment", v7);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyLyrics, @"has-lyrics", v74);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyArtworkToken, @"lacks-cover-art", v77);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyHasNonPurgeableAsset, @"cloud-only", v75);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyBPM, @"beats-per-minute", v8);
  v72 = v7;
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyLocationFileName, @"filename", v7);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyTotalSize, @"size", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertySampleRate, @"sample-rate", v76);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyBitRate, @"bit-rate", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyFormat, @"format", v7);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyCodecType, @"audio-codec", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyCodecSubtype, @"audio-codec-sub-type", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyGaplessHeuristicInfo, @"gapless-heuristic", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyGaplessEncodingDrain, @"gapless-encoding-drain", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyGaplessEncodingDelay, @"gapless-encoding-delay", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyDurationInSamples, @"gapless-duration", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyGaplessLastFrameResync, @"gapless-frame-resynch", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyVolumeNormalization, @"normalized-volume", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyLikedState, @"liked-status", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyLikedStateChangedDate, @"liked-status-last-updated-date", v6);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyAlbumLikedState, @"album-liked-status", v8);
  sub_10009FCD8(v78, v40, v41, v2, ML3TrackPropertyAlbumLikedStateChangedDate, @"album-liked-status-last-updated-date", v6);
  v42 = (NSDictionary *)[v78 copy];
  ml3TrackPropertyToGeniusTrackPropertyMap = self->_ml3TrackPropertyToGeniusTrackPropertyMap;
  self->_ml3TrackPropertyToGeniusTrackPropertyMap = v42;

  v44 = (NSDictionary *)[v2 copy];
  ml3TrackPropertyTransformMap = self->_ml3TrackPropertyTransformMap;
  self->_ml3TrackPropertyTransformMap = v44;

  v46 = (NSArray *)[v40 copy];
  allML3TrackPropertiesWithGeniusTrackProperties = self->_allML3TrackPropertiesWithGeniusTrackProperties;
  self->_allML3TrackPropertiesWithGeniusTrackProperties = v46;

  v48 = (NSArray *)[v41 copy];
  allGeniusTrackPropertiesWithML3TrackProperties = self->_allGeniusTrackPropertiesWithML3TrackProperties;
  self->_allGeniusTrackPropertiesWithML3TrackProperties = v48;

  v50 = +[NSMutableDictionary dictionary];
  v51 = +[NSMutableDictionary dictionary];
  v52 = +[NSMutableArray array];
  v53 = +[NSMutableArray array];
  uint64_t v54 = ML3ContainerPropertyName;
  id v55 = v52;
  [v50 setObject:@"item-name" forKey:v54];
  [v55 addObject:v54];

  [v53 addObject:@"item-name"];
  uint64_t v56 = ML3ContainerPropertyPlayOrder;
  id v57 = v55;
  id v58 = v53;
  [v50 setObject:@"playlist-sort-order" forKey:v56];
  [v57 addObject:v56];

  [v58 addObject:@"playlist-sort-order"];
  uint64_t v59 = ML3ContainerPropertyPlayOrderReversed;
  id v60 = v57;
  id v61 = v58;
  [v50 setObject:@"playlist-sort-reversed" forKey:v59];
  [v60 addObject:v59];

  [v61 addObject:@"playlist-sort-reversed"];
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyDescription, @"description", v72);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyArtworkToken, @"lacks-cover-art", v77);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyDateCreated, @"added-date", v6);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyDatePlayed, @"last-played-date", v6);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyParentPersistentID, @"parent-id", v8);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyExternalVendorIdentifier, @"external-vendor-identifier", v72);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyExternalVendorDisplayName, @"external-vendor-display-name", v72);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyExternalVendorContainerTag, @"external-vendor-container-tag", v72);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyLikedState, @"liked-status", v8);
  sub_10009FCD8(v50, v60, v61, v51, ML3ContainerPropertyLikedStateChangedDate, @"liked-status-last-updated-date", v6);
  v62 = (NSDictionary *)[v50 copy];
  ml3ContainerPropertyToGeniusPlaylistPropertyMap = self->_ml3ContainerPropertyToGeniusPlaylistPropertyMap;
  self->_ml3ContainerPropertyToGeniusPlaylistPropertyMap = v62;

  v64 = (NSDictionary *)[v51 copy];
  ml3ContainerPropertyTransformMap = self->_ml3ContainerPropertyTransformMap;
  self->_ml3ContainerPropertyTransformMap = v64;

  v66 = (NSArray *)[v60 copy];
  allML3ContainerPropertiesWithGeniusPlaylistProperties = self->_allML3ContainerPropertiesWithGeniusPlaylistProperties;
  self->_allML3ContainerPropertiesWithGeniusPlaylistProperties = v66;

  v68 = (NSArray *)[v61 copy];
  allGeniusPlaylistPropertiesWithML3ContainerProperties = self->_allGeniusPlaylistPropertiesWithML3ContainerProperties;
  self->_allGeniusPlaylistPropertiesWithML3ContainerProperties = v68;
}

- (id)geniusValueForML3ContainerProperty:(id)a3 value:(id)a4
{
  id v6 = a4;
  v7 = [(NSDictionary *)self->_ml3ContainerPropertyTransformMap objectForKey:a3];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 geniusValueForMLValue:v6];

    id v6 = (id)v9;
  }

  return v6;
}

- (id)geniusPlaylistPropertyForML3ContainerProperty:(id)a3
{
  return [(NSDictionary *)self->_ml3ContainerPropertyToGeniusPlaylistPropertyMap objectForKey:a3];
}

- (id)geniusValueForML3TrackProperty:(id)a3 value:(id)a4
{
  id v6 = a4;
  v7 = [(NSDictionary *)self->_ml3TrackPropertyTransformMap objectForKey:a3];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 geniusValueForMLValue:v6];

    id v6 = (id)v9;
  }

  return v6;
}

- (id)geniusTrackPropertyForML3TrackProperty:(id)a3
{
  return [(NSDictionary *)self->_ml3TrackPropertyToGeniusTrackPropertyMap objectForKey:a3];
}

- (CloudGeniusUtilities)init
{
  v5.receiver = self;
  v5.super_class = (Class)CloudGeniusUtilities;
  v2 = [(CloudGeniusUtilities *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CloudGeniusUtilities *)v2 _initializeMappings];
  }
  return v3;
}

@end