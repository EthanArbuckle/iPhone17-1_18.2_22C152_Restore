@interface ML3AlbumArtist
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7;
+ (BOOL)libraryContentsChangeForProperty:(id)a3;
+ (BOOL)libraryDynamicChangeForProperty:(id)a3;
+ (BOOL)propertyIsCountProperty:(id)a3;
+ (id)allProperties;
+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4;
+ (id)predisambiguatedProperties;
+ (id)propertiesForGroupingKey;
+ (id)propertiesForGroupingUniqueCollections;
+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4;
+ (id)sectionPropertyForProperty:(id)a3;
+ (id)trackForeignPersistentID;
+ (int64_t)revisionTrackingCode;
+ (void)initialize;
- (id)multiverseIdentifier;
- (id)protocolItem;
- (void)updateTrackValues:(id)a3;
@end

@implementation ML3AlbumArtist

+ (id)databaseTable
{
  return @"album_artist";
}

+ (int64_t)revisionTrackingCode
{
  return 7;
}

+ (void)initialize
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[ML3OrderingTerm orderingTermWithProperty:@"album_artist"];
    v18[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v5 = (void *)ML3AlbumArtistDefaultOrderingTerms;
    ML3AlbumArtistDefaultOrderingTerms = v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v7 = (void *)ML3AlbumArtistSectionPropertyForProperties;
    ML3AlbumArtistSectionPropertyForProperties = (uint64_t)v6;

    v17[0] = @"ROWID";
    v17[1] = @"album_artist";
    v17[2] = @"sort_album_artist";
    v17[3] = @"store_id";
    v17[4] = @"cloud_universal_library_id";
    v17[5] = @"classical_experience_available";
    v17[6] = @"liked_state";
    v17[7] = @"liked_state_changed_date";
    v17[8] = @"sync_id";
    v17[9] = @"album_artist_pid";
    v17[10] = @"grouping_key";
    v17[11] = @"sort_order";
    v17[12] = @"sort_order_section";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:13];
    v9 = (void *)ML3AlbumArtistAllProperties;
    ML3AlbumArtistAllProperties = v8;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"liked_state", @"liked_state_changed_date", 0);
    v11 = (void *)ML3AlbumArtistContentsUnchangingProperties;
    ML3AlbumArtistContentsUnchangingProperties = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3AlbumArtistAllProperties toDictionary:v12];
    v13 = (void *)ML3AlbumArtistPredisambiguatedPropertyForProperties;
    ML3AlbumArtistPredisambiguatedPropertyForProperties = (uint64_t)v12;
    id v14 = v12;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"album_artist.album_artist", @"album_artist", @"ROWID", @"representative_item_pid", 0);
    v16 = (void *)ML3TrackForeignPropertyForML3AlbumArtistProperties;
    ML3TrackForeignPropertyForML3AlbumArtistProperties = v15;
  }
}

- (void)updateTrackValues:(id)a3
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = @"ROWID";
  v26[0] = @"ROWID";
  v26[1] = @"album_artist";
  v26[2] = @"sort_album_artist";
  id v6 = @"representative_item_pid";
  v26[3] = @"representative_item_pid";
  v7 = @"cloud_status";
  v26[4] = @"cloud_status";
  id v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  [(ML3Entity *)self getValues:&v23 forProperties:v26 count:5];
  [v4 setValue:(void)v23 forKey:@"album_artist_pid"];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = +[ML3Track trackValueAreInTheCloud:v4];
  uint64_t v10 = [v25 integerValue];
  v11 = [v4 objectForKey:@"ROWID"];
  uint64_t v12 = [*((id *)&v24 + 1) longLongValue];
  if (v12)
  {
    uint64_t v13 = v12;
    [v4 setValue:*((void *)&v23 + 1) forKey:@"album_artist.album_artist"];
    [v4 setValue:(void)v24 forKey:@"album_artist.sort_album_artist"];
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
    v18 = [NSNumber numberWithInteger:1];
    [v8 setValue:v18 forKey:@"cloud_status"];

LABEL_9:
    [(ML3Collection *)self updateRepresentativeCollectionValues:v8 existingRepresentativePersistentID:v13 forUpdateTrackValues:v4];
    v16 = [v8 objectForKey:@"representative_item_pid"];
    uint64_t v19 = [v16 longLongValue];
    if (v19) {
      uint64_t v17 = v19;
    }
    else {
      uint64_t v17 = v13;
    }
    goto LABEL_12;
  }
  id v14 = [v4 objectForKey:@"album_artist.album_artist"];
  [v8 setValue:v14 forKey:@"album_artist"];

  uint64_t v15 = [v4 objectForKey:@"album_artist.sort_album_artist"];
  [v8 setValue:v15 forKey:@"sort_album_artist"];

  if (!v9)
  {
    uint64_t v17 = 0;
    goto LABEL_13;
  }
  v16 = [NSNumber numberWithInteger:2];
  [v8 setValue:v16 forKey:@"cloud_status"];
  uint64_t v17 = 0;
LABEL_12:

LABEL_13:
  if ([v11 longLongValue] != v17)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
    char v21 = (char)+[ML3Track trackWithPersistentID:v17 existsInLibrary:WeakRetained];

    if ((v21 & 1) == 0) {
      [v8 setValue:v11 forKey:@"representative_item_pid"];
    }
  }
  [(ML3Entity *)self setValuesForPropertiesWithDictionary:v8];

  for (uint64_t i = 4; i != -1; --i)
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___ML3AlbumArtist;
  unsigned int v14 = objc_msgSendSuper2(&v16, sel_deleteFromLibrary_deletionType_persistentIDs_count_usingConnection_, v12, v10, a5, a6, v13);
  if (v14) {
    [v12 repairAlbumArtistRelationshipsWithConnection:v13];
  }

  return v14;
}

+ (id)propertiesForGroupingUniqueCollections
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"grouping_key";
  v4[1] = @"store_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)trackForeignPersistentID
{
  v2 = @"album_artist_pid";
  return @"album_artist_pid";
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_9323 != -1) {
    dispatch_once(&propertiesForGroupingKey_onceToken_9323, &__block_literal_global_9324);
  }
  v2 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_9325;

  return v2;
}

uint64_t __42__ML3AlbumArtist_propertiesForGroupingKey__block_invoke()
{
  propertiesForGroupingKey_propertiesForGroupingKey_9325 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"album_artist", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (__CFString *)a4;
  uint64_t v10 = [v8 predicateIncludingSystemwidePredicates];

  if (v10)
  {
    v11 = [v8 predicateIncludingSystemwidePredicates];
    v20[0] = v11;
    id v12 = +[ML3ComparisonPredicate predicateWithProperty:@"album_artist_pid" equalToInt64:a5];
    v20[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    unsigned int v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v13];
  }
  else
  {
    unsigned int v14 = +[ML3ComparisonPredicate predicateWithProperty:@"album_artist_pid" equalToInt64:a5];
  }
  if (v9 == @"item_pid")
  {
    objc_super v16 = [v8 library];
    uint64_t v17 = +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, [v8 options]);
  }
  else
  {
    if (v9 != @"album_pid")
    {
      v19.receiver = a1;
      v19.super_class = (Class)&OBJC_METACLASS___ML3AlbumArtist;
      uint64_t v15 = objc_msgSendSuper2(&v19, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
      goto LABEL_10;
    }
    objc_super v16 = [v8 library];
    uint64_t v17 = +[ML3Entity queryWithLibrary:predicate:orderingTerms:propertyToCount:options:](ML3Track, "queryWithLibrary:predicate:orderingTerms:propertyToCount:options:", v16, v14, 0, @"album_pid", [v8 options]);
  }
  uint64_t v15 = (void *)v17;

LABEL_10:

  return v15;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return a3 == @"item_pid" || a3 == @"album_pid";
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3AlbumArtist;
  v7 = objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      v7 = [(id)ML3TrackForeignPropertyForML3AlbumArtistProperties objectForKey:v6];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v3 = a3;
  if ([(id)ML3AlbumArtistContentsUnchangingProperties containsObject:v3]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"app_data"] ^ 1;
  }

  return v4;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return [(id)ML3AlbumArtistContentsUnchangingProperties containsObject:a3];
}

+ (id)allProperties
{
  return (id)ML3AlbumArtistAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3AlbumArtistPredisambiguatedPropertyForProperties;
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return (id)[(id)ML3AlbumArtistSectionPropertyForProperties objectForKey:a3];
}

+ (id)defaultOrderingTerms
{
  return (id)ML3AlbumArtistDefaultOrderingTerms;
}

- (id)protocolItem
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ROWID";
  v8[1] = @"album_artist";
  v8[2] = @"sort_album_artist";
  v8[3] = @"cloud_universal_library_id";
  v8[4] = @"store_id";
  v8[5] = @"liked_state";
  v8[6] = @"liked_state_changed_date";
  v8[7] = @"sort_order";
  v8[8] = @"sort_order_section";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  int v4 = [(ML3Entity *)self getValuesForProperties:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  id v6 = +[ML3AlbumArtist protocolItemWithProperties:v4 inLibrary:WeakRetained];

  return v6;
}

- (id)multiverseIdentifier
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MIPMultiverseIdentifier);
  [(MIPMultiverseIdentifier *)v3 setMediaObjectType:8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  v5 = [WeakRetained libraryUID];
  id v6 = [WeakRetained syncLibraryID];
  v7 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v7 setLibraryId:self->super.super._persistentID];
  [(MIPLibraryIdentifier *)v7 setLibraryName:v5];
  [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v7];
  v18[0] = @"album_artist";
  v18[1] = @"store_id";
  void v18[2] = @"sync_id";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  objc_super v9 = [(ML3Entity *)self getValuesForProperties:v8];
  uint64_t v10 = [v9 objectForKey:@"album_artist"];
  [(MIPMultiverseIdentifier *)v3 setName:v10];

  v11 = [v9 objectForKey:@"store_id"];
  uint64_t v12 = [v11 longLongValue];

  if (v12 >= 1)
  {
    id v13 = [v9 objectForKey:@"store_id"];
    -[MIPMultiverseIdentifier setStoreId:](v3, "setStoreId:", [v13 longLongValue]);
  }
  unsigned int v14 = [v9 objectForKey:@"sync_id"];
  uint64_t v15 = [v14 longLongValue];

  if (v15 >= 1 && [v6 length])
  {
    objc_super v16 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v16 setLibraryId:v15];
    [(MIPLibraryIdentifier *)v16 setLibraryName:v6];
    [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v16];
  }

  return v3;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(MIPArtist);
  id v6 = [v4 objectForKey:@"ROWID"];
  uint64_t v7 = [v6 longLongValue];

  id v8 = [v4 objectForKey:@"store_id"];
  uint64_t v9 = [v8 longLongValue];

  uint64_t v10 = [v4 objectForKey:@"album_artist"];
  v11 = [v4 objectForKey:@"sort_album_artist"];
  uint64_t v12 = [v4 objectForKey:@"cloud_universal_library_id"];
  id v13 = [v4 objectForKey:@"liked_state"];
  uint64_t v21 = [v13 integerValue];

  unsigned int v14 = [v4 objectForKey:@"liked_state_changed_date"];
  uint64_t v15 = [v14 longLongValue];

  objc_super v16 = [v4 objectForKey:@"sort_order"];
  uint64_t v17 = [v16 longLongValue];

  v18 = [v4 objectForKey:@"sort_order_section"];

  uint64_t v19 = [v18 longLongValue];
  if (v7) {
    [(MIPArtist *)v5 setPersistentId:v7];
  }
  if (v9) {
    [(MIPArtist *)v5 setStoreId:v9];
  }
  if ([v10 length]) {
    [(MIPArtist *)v5 setName:v10];
  }
  if ([v11 length]) {
    [(MIPArtist *)v5 setSortName:v11];
  }
  if (v17) {
    [(MIPArtist *)v5 setSortOrder:v17];
  }
  if (v19) {
    [(MIPArtist *)v5 setSortOrderSection:v19];
  }
  [(MIPArtist *)v5 setLikedState:v21];
  [(MIPArtist *)v5 setLikedStateChangedDate:v15];
  [(MIPArtist *)v5 setCloudUniversalLibraryId:v12];

  return v5;
}

@end