@interface ML3Album
+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3;
+ (BOOL)libraryContentsChangeForProperty:(id)a3;
+ (BOOL)libraryDynamicChangeForProperty:(id)a3;
+ (BOOL)propertyIsCountProperty:(id)a3;
+ (id)allProperties;
+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4;
+ (id)joinClausesForProperty:(id)a3;
+ (id)predisambiguatedProperties;
+ (id)propertiesForGroupingKey;
+ (id)propertiesForGroupingUniqueCollections;
+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4;
+ (id)trackForeignPersistentID;
+ (int64_t)revisionTrackingCode;
+ (void)initialize;
- (id)multiverseIdentifier;
- (id)protocolItem;
- (void)updateTrackValues:(id)a3;
@end

@implementation ML3Album

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(id)ML3AlbumJoinsForProperties objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Album;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return @"album";
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Album;
  id v7 = objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      id v7 = [(id)ML3TrackForeignPropertyForML3AlbumProperties objectForKey:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (int64_t)revisionTrackingCode
{
  return 4;
}

+ (void)initialize
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:");
    v22[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v5 = (void *)ML3AlbumDefaultOrderingTerms;
    ML3AlbumDefaultOrderingTerms = v4;

    v20[0] = @"album_artist.album_artist";
    v20[1] = @"album_artist.grouping_key";
    v21[0] = &unk_1F0910690;
    v21[1] = &unk_1F09106A8;
    v20[2] = @"album_item_store.store_playlist_id";
    v20[3] = @"album_item_store.cloud_album_id";
    v21[2] = &unk_1F09106C0;
    v21[3] = &unk_1F09106D8;
    v20[4] = @"album_item_store.tv_season_canonical_id";
    v21[4] = &unk_1F09106F0;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
    id v7 = (void *)ML3AlbumJoinsForProperties;
    ML3AlbumJoinsForProperties = v6;

    v19[0] = @"ROWID";
    v19[1] = @"album";
    v19[2] = @"sort_album";
    v19[3] = @"album_artist.album_artist";
    v19[4] = @"album_artist.grouping_key";
    v19[5] = @"album_artist_pid";
    v19[6] = @"representative_item_pid";
    v19[7] = @"user_rating";
    v19[8] = @"all_compilations";
    v19[9] = @"feed_url";
    v19[10] = @"season_number";
    v19[11] = @"album_year";
    v19[12] = @"liked_state";
    v19[13] = @"album_item_store.store_playlist_id";
    v19[14] = @"app_data";
    v19[15] = @"contains_classical_work";
    v19[16] = @"date_played_local";
    v19[17] = @"sync_id";
    v19[18] = @"classical_experience_available";
    v19[19] = @"liked_state_changed_date";
    v19[20] = @"store_id";
    v19[21] = @"cloud_library_id";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:22];
    objc_super v9 = (void *)ML3AlbumAllProperties;
    ML3AlbumAllProperties = v8;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"liked_state", @"liked_state_changed_date", 0);
    v11 = (void *)ML3AlbumContentsUnchangingProperties;
    ML3AlbumContentsUnchangingProperties = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3AlbumAllProperties toDictionary:v12];
    v13 = (void *)ML3AlbumPredisambiguatedPropertyForProperties;
    ML3AlbumPredisambiguatedPropertyForProperties = (uint64_t)v12;
    id v14 = v12;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"album_artist.album_artist", @"album_artist.album_artist", @"album.album", @"album", @"ROWID", @"representative_item_pid", @"is_compilation", @"all_compilations", @"item_store.tv_season_canonical_id", @"album_item_store.tv_season_canonical_id", 0);
    v16 = (void *)ML3TrackForeignPropertyForML3AlbumProperties;
    ML3TrackForeignPropertyForML3AlbumProperties = v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"cloud_status", 0);
    v18 = (void *)ML3AlbumNoAssistantSyncProperties;
    ML3AlbumNoAssistantSyncProperties = v17;
  }
}

- (void)updateTrackValues:(id)a3
{
  v27[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = @"ROWID";
  v27[0] = @"ROWID";
  v27[1] = @"album";
  v27[2] = @"sort_album";
  v27[3] = @"season_number";
  uint64_t v6 = @"representative_item_pid";
  v27[4] = @"representative_item_pid";
  id v7 = @"cloud_status";
  v27[5] = @"cloud_status";
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  [(ML3Entity *)self getValues:&v24 forProperties:v27 count:6];
  [v4 setValue:(void)v24 forKey:@"album_pid"];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = +[ML3Track trackValueAreInTheCloud:v4];
  uint64_t v10 = [*((id *)&v26 + 1) integerValue];
  v11 = [v4 objectForKey:@"ROWID"];
  uint64_t v12 = [(id)v26 longLongValue];
  if (v12)
  {
    uint64_t v13 = v12;
    [v4 setValue:*((void *)&v24 + 1) forKey:@"album.album"];
    [v4 setValue:(void)v25 forKey:@"album.sort_album"];
    [v4 setValue:*((void *)&v25 + 1) forKey:@"item_video.season_number"];
    if (v9)
    {
      if (v10) {
        goto LABEL_9;
      }
    }
    else if (v10 != 2)
    {
      goto LABEL_9;
    }
    v19 = [NSNumber numberWithInteger:1];
    [v8 setValue:v19 forKey:@"cloud_status"];

LABEL_9:
    [(ML3Collection *)self updateRepresentativeCollectionValues:v8 existingRepresentativePersistentID:v13 forUpdateTrackValues:v4];
    uint64_t v17 = [v8 objectForKey:@"representative_item_pid"];
    uint64_t v20 = [v17 longLongValue];
    if (v20) {
      uint64_t v18 = v20;
    }
    else {
      uint64_t v18 = v13;
    }
    goto LABEL_12;
  }
  id v14 = [v4 objectForKey:@"album.album"];
  [v8 setValue:v14 forKey:@"album"];

  uint64_t v15 = [v4 objectForKey:@"album.sort_album"];
  [v8 setValue:v15 forKey:@"sort_album"];

  v16 = [v4 objectForKey:@"item_video.season_number"];
  [v8 setValue:v16 forKey:@"season_number"];

  if (!v9)
  {
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  uint64_t v17 = [NSNumber numberWithInteger:2];
  [v8 setValue:v17 forKey:@"cloud_status"];
  uint64_t v18 = 0;
LABEL_12:

LABEL_13:
  if ([v11 longLongValue] != v18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
    char v22 = (char)+[ML3Track trackWithPersistentID:v18 existsInLibrary:WeakRetained];

    if ((v22 & 1) == 0) {
      [v8 setValue:v11 forKey:@"representative_item_pid"];
    }
  }
  [(ML3Entity *)self setValuesForPropertiesWithDictionary:v8];

  for (uint64_t i = 5; i != -1; --i)
}

+ (id)trackForeignPersistentID
{
  v2 = @"album_pid";
  return @"album_pid";
}

+ (id)propertiesForGroupingUniqueCollections
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"grouping_key";
  v4[1] = @"album_artist_pid";
  v4[2] = @"feed_url";
  v4[3] = @"season_number";
  v4[4] = @"album_year";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_5792 != -1) {
    dispatch_once(&propertiesForGroupingKey_onceToken_5792, &__block_literal_global_5793);
  }
  v2 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_5794;

  return v2;
}

uint64_t __36__ML3Album_propertiesForGroupingKey__block_invoke()
{
  propertiesForGroupingKey_propertiesForGroupingKey_5794 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"album", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (__CFString *)a4;
  uint64_t v10 = [v8 predicateIncludingSystemwidePredicates];

  if (v10)
  {
    v11 = [v8 predicateIncludingSystemwidePredicates];
    v19[0] = v11;
    uint64_t v12 = +[ML3ComparisonPredicate predicateWithProperty:@"album_pid" equalToInt64:a5];
    v19[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v13];
  }
  else
  {
    id v14 = +[ML3ComparisonPredicate predicateWithProperty:@"album_pid" equalToInt64:a5];
  }
  if (v9 == @"item_pid")
  {
    v16 = [v8 library];
    uint64_t v15 = +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, [v8 options]);
  }
  else
  {
    v18.receiver = a1;
    v18.super_class = (Class)&OBJC_METACLASS___ML3Album;
    uint64_t v15 = objc_msgSendSuper2(&v18, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
  }

  return v15;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return a3 == @"item_pid";
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return [(id)ML3AlbumNoAssistantSyncProperties containsObject:a3] ^ 1;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return [(id)ML3AlbumContentsUnchangingProperties containsObject:a3];
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isEqualToString:@"date_played_local"];
  char v5 = [v3 isEqualToString:@"liked_state"];
  char v6 = [v3 isEqualToString:@"liked_state_changed_date"];
  char v7 = [v3 isEqualToString:@"app_data"];

  return (v4 | v5 | v6 | v7) ^ 1;
}

+ (id)allProperties
{
  return (id)ML3AlbumAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3AlbumPredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3AlbumDefaultOrderingTerms;
}

- (id)protocolItem
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ROWID";
  v8[1] = @"album";
  v8[2] = @"sort_album";
  v8[3] = @"user_rating";
  v8[4] = @"album_artist.album_artist";
  v8[5] = @"album_artist_pid";
  v8[6] = @"liked_state";
  v8[7] = @"liked_state_changed_date";
  v8[8] = @"cloud_library_id";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  char v4 = [(ML3Entity *)self getValuesForProperties:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  char v6 = +[ML3Album protocolItemWithProperties:v4 inLibrary:WeakRetained];

  return v6;
}

- (id)multiverseIdentifier
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MIPMultiverseIdentifier);
  [(MIPMultiverseIdentifier *)v3 setMediaObjectType:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  uint64_t v5 = [WeakRetained libraryUID];
  char v6 = [WeakRetained syncLibraryID];
  char v7 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v7 setLibraryId:self->super.super._persistentID];
  uint64_t v17 = (void *)v5;
  [(MIPLibraryIdentifier *)v7 setLibraryName:v5];
  [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v7];
  v18[0] = @"album";
  v18[1] = @"album_item_store.store_playlist_id";
  v18[2] = @"album_item_store.cloud_album_id";
  v18[3] = @"sync_id";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  BOOL v9 = [(ML3Entity *)self getValuesForProperties:v8];
  uint64_t v10 = [v9 objectForKey:@"album"];
  [(MIPMultiverseIdentifier *)v3 setName:v10];

  v11 = [v9 objectForKey:@"album_item_store.store_playlist_id"];
  -[MIPMultiverseIdentifier setStoreId:](v3, "setStoreId:", [v11 longLongValue]);

  uint64_t v12 = [v9 objectForKey:@"album_item_store.cloud_album_id"];
  [(MIPMultiverseIdentifier *)v3 setCloudUniversalLibraryId:v12];

  uint64_t v13 = [v9 objectForKey:@"sync_id"];
  uint64_t v14 = [v13 longLongValue];

  if (v14 >= 1 && [v6 length])
  {
    uint64_t v15 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v15 setLibraryId:v14];
    [(MIPLibraryIdentifier *)v15 setLibraryName:v6];
    [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v15];
  }

  return v3;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_alloc_init(MIPAlbum);
  id v8 = [v5 objectForKey:@"album_artist_pid"];
  uint64_t v9 = [v8 longLongValue];

  uint64_t v10 = [v5 objectForKey:@"album_item_store.store_playlist_id"];
  uint64_t v11 = [v10 longLongValue];

  long long v24 = v6;
  if (v9)
  {
    uint64_t v12 = [(ML3Entity *)[ML3AlbumArtist alloc] initWithPersistentID:v9 inLibrary:v6];
    uint64_t v13 = [(ML3AlbumArtist *)v12 protocolItem];
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [v5 objectForKey:@"album"];
  uint64_t v15 = [v5 objectForKey:@"sort_album"];
  v16 = [v5 objectForKey:@"user_rating"];
  uint64_t v17 = [v16 integerValue];

  objc_super v18 = [v5 objectForKey:@"liked_state"];
  uint64_t v19 = [v18 integerValue];

  uint64_t v20 = [v5 objectForKey:@"liked_state_changed_date"];
  uint64_t v21 = [v20 longLongValue];

  char v22 = [v5 objectForKey:@"cloud_library_id"];
  if (v11) {
    [(MIPAlbum *)v7 setStoreId:v11];
  }
  if (v13) {
    [(MIPAlbum *)v7 setArtist:v13];
  }
  if ([v14 length]) {
    [(MIPAlbum *)v7 setName:v14];
  }
  if ([v15 length]) {
    [(MIPAlbum *)v7 setSortName:v15];
  }
  if (v17) {
    [(MIPAlbum *)v7 setUserRating:v17];
  }
  [(MIPAlbum *)v7 setLikedState:v19];
  [(MIPAlbum *)v7 setLikedStateChangedDate:v21];
  [(MIPAlbum *)v7 setCloudId:v22];

  return v7;
}

@end