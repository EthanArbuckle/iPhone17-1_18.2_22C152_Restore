@interface ML3Composer
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

@implementation ML3Composer

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(id)ML3ComposerJoinsForProperties objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Composer;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return @"composer";
}

+ (int64_t)revisionTrackingCode
{
  return 5;
}

+ (void)initialize
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[ML3OrderingTerm orderingTermWithProperty:@"composer"];
    v17[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v5 = (void *)ML3ComposerDefaultOrderingTerms;
    ML3ComposerDefaultOrderingTerms = v4;

    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"ROWID", @"composer", @"sort_composer", @"representative_item_pid", 0);
    id v7 = (void *)ML3ComposerAllProperties;
    ML3ComposerAllProperties = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3ComposerAllProperties toDictionary:v8];
    v9 = (void *)ML3ComposerPredisambiguatedPropertyForProperties;
    ML3ComposerPredisambiguatedPropertyForProperties = (uint64_t)v8;
    id v10 = v8;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"composer.composer", @"composer", @"ROWID", @"representative_item_pid", 0);
    v12 = (void *)ML3TrackForeignPropertyForML3ComposerProperties;
    ML3TrackForeignPropertyForML3ComposerProperties = v11;

    v15 = @"composer_item_store.store_composer_id";
    v16 = &unk_1F0910978;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v14 = (void *)ML3ComposerJoinsForProperties;
    ML3ComposerJoinsForProperties = v13;
  }
}

- (void)updateTrackValues:(id)a3
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = @"ROWID";
  v26[0] = @"ROWID";
  v26[1] = @"composer";
  v26[2] = @"sort_composer";
  uint64_t v6 = @"representative_item_pid";
  v26[3] = @"representative_item_pid";
  v26[4] = 0;
  id v7 = @"cloud_status";
  v26[5] = @"cloud_status";
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  [(ML3Entity *)self getValues:&v23 forProperties:v26 count:6];
  [v4 setValue:(void)v23 forKey:@"composer_pid"];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = +[ML3Track trackValueAreInTheCloud:v4];
  uint64_t v10 = [*((id *)&v25 + 1) integerValue];
  uint64_t v11 = [v4 objectForKey:@"ROWID"];
  uint64_t v12 = [*((id *)&v24 + 1) longLongValue];
  if (v12)
  {
    uint64_t v13 = v12;
    [v4 setValue:*((void *)&v23 + 1) forKey:@"composer.composer"];
    [v4 setValue:(void)v24 forKey:@"composer.sort_composer"];
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
  v14 = [v4 objectForKey:@"composer.composer"];
  [v8 setValue:v14 forKey:@"composer"];

  v15 = [v4 objectForKey:@"composer.sort_composer"];
  [v8 setValue:v15 forKey:@"sort_composer"];

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

  for (uint64_t i = 5; i != -1; --i)
}

+ (id)trackForeignPersistentID
{
  v2 = @"composer_pid";
  return @"composer_pid";
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_9204 != -1) {
    dispatch_once(&propertiesForGroupingKey_onceToken_9204, &__block_literal_global_9205);
  }
  v2 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_9206;

  return v2;
}

uint64_t __39__ML3Composer_propertiesForGroupingKey__block_invoke()
{
  propertiesForGroupingKey_propertiesForGroupingKey_9206 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"composer", 0);

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
    uint64_t v12 = +[ML3ComparisonPredicate predicateWithProperty:@"composer_pid" equalToInt64:a5];
    v22[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v13];
  }
  else
  {
    v14 = +[ML3ComparisonPredicate predicateWithProperty:@"composer_pid" equalToInt64:a5];
  }
  if (v9 == @"item_pid")
  {
    v16 = [v8 library];
    uint64_t v17 = +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, [v8 options]);
  }
  else
  {
    if (v9 == @"album_pid")
    {
      v16 = [v8 library];
      uint64_t v18 = [v8 options];
      uint64_t v19 = @"album_pid";
    }
    else
    {
      if (v9 != @"item_artist_pid")
      {
        v21.receiver = a1;
        v21.super_class = (Class)&OBJC_METACLASS___ML3Composer;
        v15 = objc_msgSendSuper2(&v21, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
        goto LABEL_13;
      }
      v16 = [v8 library];
      uint64_t v18 = [v8 options];
      uint64_t v19 = @"item_artist_pid";
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

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Composer;
  id v7 = objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      id v7 = [(id)ML3TrackForeignPropertyForML3ComposerProperties objectForKey:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (id)allProperties
{
  return (id)ML3ComposerAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3ComposerPredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3ComposerDefaultOrderingTerms;
}

- (id)protocolItem
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ROWID";
  v8[1] = @"composer";
  v8[2] = @"sort_composer";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  id v4 = [(ML3Entity *)self getValuesForProperties:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  id v6 = +[ML3Composer protocolItemWithProperties:v4 inLibrary:WeakRetained];

  return v6;
}

- (id)multiverseIdentifier
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  [(MIPMultiverseIdentifier *)v3 setMediaObjectType:3];
  id v4 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v4 setLibraryId:self->super.super._persistentID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  id v6 = [WeakRetained libraryUID];
  [(MIPLibraryIdentifier *)v4 setLibraryName:v6];

  [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v4];
  v11[0] = @"composer";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v8 = [(ML3Entity *)self getValuesForProperties:v7];
  objc_super v9 = [v8 objectForKey:@"composer"];
  [(MIPMultiverseIdentifier *)v3 setName:v9];

  return v3;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(MIPArtist);
  id v6 = [v4 objectForKey:@"composer"];
  id v7 = [v4 objectForKey:@"sort_composer"];

  if ([v6 length]) {
    [(MIPArtist *)v5 setName:v6];
  }
  if ([v7 length]) {
    [(MIPArtist *)v5 setSortName:v7];
  }

  return v5;
}

@end