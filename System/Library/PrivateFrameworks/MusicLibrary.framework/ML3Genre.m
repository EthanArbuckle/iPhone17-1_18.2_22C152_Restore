@interface ML3Genre
+ (BOOL)propertyIsCountProperty:(id)a3;
+ (id)allProperties;
+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4;
+ (id)joinClausesForProperty:(id)a3;
+ (id)predisambiguatedProperties;
+ (id)propertiesForGroupingKey;
+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4;
+ (id)trackForeignPersistentID;
+ (int64_t)revisionTrackingCode;
+ (void)initialize;
- (id)multiverseIdentifier;
- (id)protocolItem;
- (void)updateTrackValues:(id)a3;
@end

@implementation ML3Genre

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(id)ML3GenreJoinsForProperties objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Genre;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return @"genre";
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Genre;
  id v7 = objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      id v7 = [(id)ML3TrackForeignPropertyForML3GenreProperties objectForKey:v6];
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
  return 3;
}

+ (void)initialize
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[ML3OrderingTerm orderingTermWithProperty:@"genre"];
    v17[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v5 = (void *)ML3GenreDefaultOrderingTerms;
    ML3GenreDefaultOrderingTerms = v4;

    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"ROWID", @"genre", @"representative_item_pid", 0);
    id v7 = (void *)ML3GenreAllProperties;
    ML3GenreAllProperties = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3GenreAllProperties toDictionary:v8];
    objc_super v9 = (void *)ML3GenrePredisambiguatedPropertyForProperties;
    ML3GenrePredisambiguatedPropertyForProperties = (uint64_t)v8;
    id v10 = v8;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"genre.genre", @"genre", @"ROWID", @"representative_item_pid", 0);
    v12 = (void *)ML3TrackForeignPropertyForML3GenreProperties;
    ML3TrackForeignPropertyForML3GenreProperties = v11;

    v15 = @"genre_item_store.store_genre_id";
    v16 = &unk_1F0910720;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v14 = (void *)ML3GenreJoinsForProperties;
    ML3GenreJoinsForProperties = v13;
  }
}

- (void)updateTrackValues:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = @"ROWID";
  v22[0] = @"ROWID";
  v22[1] = @"genre";
  uint64_t v6 = @"representative_item_pid";
  v22[2] = @"representative_item_pid";
  id v7 = @"cloud_status";
  v22[3] = @"cloud_status";
  long long v20 = 0u;
  long long v21 = 0u;
  [(ML3Entity *)self getValues:&v20 forProperties:v22 count:4];
  [v4 setValue:(void)v20 forKey:@"genre_id"];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = +[ML3Track trackValueAreInTheCloud:v4];
  uint64_t v10 = [*((id *)&v21 + 1) integerValue];
  uint64_t v11 = [v4 objectForKey:@"ROWID"];
  uint64_t v12 = [(id)v21 longLongValue];
  if (v12)
  {
    uint64_t v13 = v12;
    [v4 setValue:*((void *)&v20 + 1) forKey:@"genre.genre"];
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
    v15 = [NSNumber numberWithInteger:1];
    [v8 setValue:v15 forKey:@"cloud_status"];

LABEL_9:
    [(ML3Collection *)self updateRepresentativeCollectionValues:v8 existingRepresentativePersistentID:v13 forUpdateTrackValues:v4];
    v14 = [v8 objectForKey:@"representative_item_pid"];
    uint64_t v16 = [v14 longLongValue];
    if (v16) {
      uint64_t v13 = v16;
    }
    goto LABEL_11;
  }
  if (!v9)
  {
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  v14 = [NSNumber numberWithInteger:2];
  [v8 setValue:v14 forKey:@"cloud_status"];
  uint64_t v13 = 0;
LABEL_11:

LABEL_12:
  if ([v11 longLongValue] != v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
    char v18 = (char)+[ML3Track trackWithPersistentID:v13 existsInLibrary:WeakRetained];

    if ((v18 & 1) == 0) {
      [v8 setValue:v11 forKey:@"representative_item_pid"];
    }
  }
  [(ML3Entity *)self setValuesForPropertiesWithDictionary:v8];

  for (uint64_t i = 3; i != -1; --i)
}

+ (id)trackForeignPersistentID
{
  v2 = @"genre_id";
  return @"genre_id";
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_7406 != -1) {
    dispatch_once(&propertiesForGroupingKey_onceToken_7406, &__block_literal_global_7407);
  }
  v2 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_7408;

  return v2;
}

uint64_t __36__ML3Genre_propertiesForGroupingKey__block_invoke()
{
  propertiesForGroupingKey_propertiesForGroupingKey_7408 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"genre", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (__CFString *)a4;
  uint64_t v10 = [v8 predicateIncludingSystemwidePredicates];

  if (v10)
  {
    uint64_t v11 = [v8 predicateIncludingSystemwidePredicates];
    v22[0] = v11;
    uint64_t v12 = +[ML3ComparisonPredicate predicateWithProperty:@"genre_id" equalToInt64:a5];
    v22[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v13];
  }
  else
  {
    v14 = +[ML3ComparisonPredicate predicateWithProperty:@"genre_id" equalToInt64:a5];
  }
  if (v9 == @"item_pid")
  {
    uint64_t v16 = [v8 library];
    uint64_t v17 = +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, [v8 options]);
  }
  else
  {
    if (v9 == @"album_pid")
    {
      uint64_t v16 = [v8 library];
      uint64_t v18 = [v8 options];
      v19 = @"album_pid";
    }
    else
    {
      if (v9 != @"item_artist_pid")
      {
        v21.receiver = a1;
        v21.super_class = (Class)&OBJC_METACLASS___ML3Genre;
        v15 = objc_msgSendSuper2(&v21, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
        goto LABEL_13;
      }
      uint64_t v16 = [v8 library];
      uint64_t v18 = [v8 options];
      v19 = @"item_artist_pid";
    }
    uint64_t v17 = +[ML3Entity queryWithLibrary:v16 predicate:v14 orderingTerms:0 propertyToCount:v19 options:v18];
  }
  v15 = (void *)v17;

LABEL_13:

  return v15;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return a3 == @"item_pid" || a3 == @"album_pid" || a3 == @"item_artist_pid";
}

+ (id)allProperties
{
  return (id)ML3GenreAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3GenrePredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3GenreDefaultOrderingTerms;
}

- (id)protocolItem
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ROWID";
  v8[1] = @"genre";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v4 = [(ML3Entity *)self getValuesForProperties:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  uint64_t v6 = +[ML3Genre protocolItemWithProperties:v4 inLibrary:WeakRetained];

  return v6;
}

- (id)multiverseIdentifier
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  [(MIPMultiverseIdentifier *)v3 setMediaObjectType:4];
  id v4 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v4 setLibraryId:self->super.super._persistentID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  uint64_t v6 = [WeakRetained libraryUID];
  [(MIPLibraryIdentifier *)v4 setLibraryName:v6];

  [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v4];
  v11[0] = @"genre";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v8 = [(ML3Entity *)self getValuesForProperties:v7];
  BOOL v9 = [v8 objectForKey:@"genre"];
  [(MIPMultiverseIdentifier *)v3 setName:v9];

  return v3;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(MIPGenre);
  uint64_t v6 = [v4 objectForKey:@"genre"];

  if ([v6 length]) {
    [(MIPGenre *)v5 setName:v6];
  }

  return v5;
}

@end