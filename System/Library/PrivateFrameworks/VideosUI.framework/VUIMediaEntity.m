@interface VUIMediaEntity
- (BOOL)_didRequestPropertyWithKey:(id)a3;
- (BOOL)cachesPropertiesOnFirstAccess;
- (BOOL)hasLocalChanges;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFetchedPropertiesEqualToFetchedMediaEntity:(id)a3;
- (BOOL)markedAsDeleted;
- (NSDate)addedDate;
- (NSDate)releaseDate;
- (NSMutableDictionary)firstAccessPropertiesCache;
- (NSNumber)HLSAudioCapability;
- (NSNumber)HLSColorCapability;
- (NSNumber)HLSResolution;
- (NSNumber)audioCapability;
- (NSNumber)colorCapability;
- (NSNumber)isLocal;
- (NSNumber)playedState;
- (NSNumber)purchaseHistoryID;
- (NSNumber)releaseYear;
- (NSNumber)resolution;
- (NSNumber)seasonNumber;
- (NSNumber)storeID;
- (NSSet)requestedProperties;
- (NSString)brandID;
- (NSString)brandName;
- (NSString)canonicalID;
- (NSString)contentDescription;
- (NSString)coverArtImageIdentifier;
- (NSString)genreTitle;
- (NSString)showTitle;
- (NSString)sortTitle;
- (NSString)title;
- (VUIContentRating)contentRating;
- (VUIMediaEntity)init;
- (VUIMediaEntity)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6;
- (VUIMediaEntityIdentifier)showIdentifier;
- (VUIMediaEntityIdentifierInternal)identifierInternal;
- (VUIMediaEntityKind)kind;
- (VUIMediaEntityType)type;
- (VUIMediaLibrary)mediaLibrary;
- (id)_defaultValueForPropertyDescriptor:(id)a3;
- (id)_propertyValueForKey:(id)a3;
- (id)_propertyValueWithBlock:(id)a3 forKey:(id)a4;
- (id)_valueForPropertyDescriptor:(id)a3;
- (id)assetController;
- (id)description;
- (unint64_t)hash;
- (void)populateMetadata;
- (void)setCachesPropertiesOnFirstAccess:(BOOL)a3;
- (void)setFirstAccessPropertiesCache:(id)a3;
- (void)setIdentifierInternal:(id)a3;
- (void)setLocalChanges:(BOOL)a3;
- (void)setMediaLibrary:(id)a3;
@end

@implementation VUIMediaEntity

- (VUIMediaEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntity)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"identifier" format];
  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"kind" format];
LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)VUIMediaEntity;
  v15 = [(VUIMediaEntity *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaLibrary, a3);
    uint64_t v17 = [v12 copy];
    identifierInternal = v16->_identifierInternal;
    v16->_identifierInternal = (VUIMediaEntityIdentifierInternal *)v17;

    objc_storeStrong((id *)&v16->_requestedProperties, a5);
    objc_storeStrong((id *)&v16->_kind, a6);
  }

  return v16;
}

- (VUIMediaEntityType)type
{
  v2 = [(VUIMediaEntity *)self identifierInternal];
  v3 = [v2 mediaEntityType];

  return (VUIMediaEntityType *)v3;
}

- (NSNumber)isLocal
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"isLocal"];
}

- (NSNumber)resolution
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"resolution"];
}

- (NSNumber)colorCapability
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"colorCapability"];
}

- (NSNumber)audioCapability
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"audioCapability"];
}

- (NSNumber)HLSResolution
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"HLSResolution"];
}

- (NSNumber)HLSColorCapability
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"HLSColorCapability"];
}

- (NSNumber)HLSAudioCapability
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"HLSAudioCapability"];
}

- (NSString)title
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"title"];
}

- (NSString)sortTitle
{
  v3 = [(VUIMediaEntity *)self _propertyValueForKey:@"sortTitle"];
  if (!v3)
  {
    v3 = [(VUIMediaEntity *)self title];
  }
  return (NSString *)v3;
}

- (NSString)genreTitle
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"genreTitle"];
}

- (NSString)contentDescription
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"contentDescription"];
}

- (NSDate)addedDate
{
  return (NSDate *)[(VUIMediaEntity *)self _propertyValueForKey:@"addedDate"];
}

- (NSDate)releaseDate
{
  return (NSDate *)[(VUIMediaEntity *)self _propertyValueForKey:@"releaseDate"];
}

- (NSNumber)releaseYear
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__VUIMediaEntity_releaseYear__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"releaseYear"];
  return (NSNumber *)v2;
}

id __29__VUIMediaEntity_releaseYear__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) releaseDate];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v3 = [v2 components:4 fromDate:v1];

    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "year"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (VUIContentRating)contentRating
{
  return (VUIContentRating *)[(VUIMediaEntity *)self _propertyValueForKey:@"contentRating"];
}

- (NSString)coverArtImageIdentifier
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"coverArtImageIdentifier"];
}

- (NSNumber)storeID
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"storeID"];
}

- (NSNumber)purchaseHistoryID
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"purchaseHistoryID"];
}

- (NSString)canonicalID
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"canonicalID"];
}

- (BOOL)markedAsDeleted
{
  v2 = [(VUIMediaEntity *)self _propertyValueForKey:@"markedAsDeleted"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)brandID
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"brandID"];
}

- (NSString)brandName
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"brandName"];
}

- (NSNumber)playedState
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"playedState"];
}

- (VUIMediaEntityIdentifier)showIdentifier
{
  return (VUIMediaEntityIdentifier *)[(VUIMediaEntity *)self _propertyValueForKey:@"showIdentifier"];
}

- (NSString)showTitle
{
  return (NSString *)[(VUIMediaEntity *)self _propertyValueForKey:@"showTitle"];
}

- (NSNumber)seasonNumber
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"seasonNumber"];
}

- (void)populateMetadata
{
  BOOL v3 = [(VUIMediaEntity *)self kind];
  uint64_t v4 = [v3 propertyDescriptorsByName];
  id v6 = [v4 allKeys];

  id v5 = (id)[(VUIMediaEntity *)self dictionaryWithValuesForKeys:v6];
}

- (BOOL)isFetchedPropertiesEqualToFetchedMediaEntity:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (VUIMediaEntity *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
    goto LABEL_39;
  }
  if (!v4)
  {
    LOBYTE(v13) = 0;
    goto LABEL_39;
  }
  id v6 = [(VUIMediaEntity *)self mediaLibrary];

  if (v6)
  {
    v7 = [(VUIMediaEntity *)self mediaLibrary];
    v8 = [(VUIMediaEntity *)v5 mediaLibrary];
    id v9 = v7;
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      id v11 = v10;
      if (!v9 || !v10)
      {

LABEL_14:
        LOBYTE(v13) = 0;
        goto LABEL_15;
      }
      char v12 = [v9 isEqual:v10];

      if ((v12 & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  BOOL v14 = [(VUIMediaEntity *)self hasLocalChanges];
  BOOL v13 = v14 ^ [(VUIMediaEntity *)v5 hasLocalChanges] ^ 1;
LABEL_15:
  v15 = [(VUIMediaEntity *)self kind];
  v16 = [v15 propertyDescriptorsByName];
  uint64_t v17 = [v16 allKeys];

  v18 = self;
  objc_sync_enter(v18);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v19)
  {
    uint64_t v34 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v36 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v22 = [(VUIMediaEntity *)v18 firstAccessPropertiesCache];
        v23 = v22;
        if (!v22
          || ([v22 objectForKey:v21], (v24 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v24 = [(VUIMediaEntity *)v18 valueForKey:v21];
        }
        v25 = [MEMORY[0x1E4F1CA98] null];
        int v26 = [v24 isEqual:v25];

        if (v26)
        {

          v24 = 0;
        }
        v27 = [(VUIMediaEntity *)v5 valueForKey:v21];
        if (!v13) {
          goto LABEL_36;
        }
        id v28 = v24;
        id v29 = v27;
        if (v28 == v29)
        {
        }
        else
        {
          v30 = v29;
          if (!v28 || !v29)
          {

LABEL_36:
LABEL_37:
            LOBYTE(v13) = 0;
            goto LABEL_38;
          }
          char v31 = [v28 isEqual:v29];

          if ((v31 & 1) == 0) {
            goto LABEL_37;
          }
        }
        LOBYTE(v13) = 1;
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_38:

  objc_sync_exit(v18);
LABEL_39:

  return v13;
}

- (id)assetController
{
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VUIMediaEntity *)self mediaLibrary];

  if (v3)
  {
    uint64_t v4 = [(VUIMediaEntity *)self mediaLibrary];
    uint64_t v3 = [v4 hash];
  }
  id v5 = [(VUIMediaEntity *)self identifier];
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (VUIMediaEntity *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v21) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = v5;
        v7 = [(VUIMediaEntity *)self identifier];
        v8 = [(VUIMediaEntity *)v6 identifier];
        int v9 = [v7 isEqual:v8];

        if (!v9) {
          goto LABEL_13;
        }
        id v10 = [(VUIMediaEntity *)self kind];
        id v11 = [v10 mediaEntityClassName];
        char v12 = [(VUIMediaEntity *)v6 kind];
        BOOL v13 = [v12 mediaEntityClassName];
        int v14 = [v11 isEqualToString:v13];

        if (!v14)
        {
LABEL_13:
          LOBYTE(v21) = 0;
LABEL_39:

          goto LABEL_40;
        }
        v15 = [(VUIMediaEntity *)self mediaLibrary];
        v16 = [(VUIMediaEntity *)v6 mediaLibrary];
        id v17 = v15;
        id v18 = v16;
        if (v17 == v18)
        {
        }
        else
        {
          uint64_t v19 = v18;
          if (!v17 || !v18)
          {

LABEL_17:
            LOBYTE(v21) = 0;
            goto LABEL_18;
          }
          char v20 = [v17 isEqual:v18];

          if ((v20 & 1) == 0) {
            goto LABEL_17;
          }
        }
        BOOL v22 = [(VUIMediaEntity *)self hasLocalChanges];
        BOOL v21 = v22 ^ [(VUIMediaEntity *)v6 hasLocalChanges] ^ 1;
LABEL_18:
        v23 = [(VUIMediaEntity *)self kind];
        v24 = [v23 propertyDescriptorsByName];
        v25 = [v24 allKeys];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = v25;
        uint64_t v26 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v41;
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              char v31 = [(VUIMediaEntity *)self valueForKey:v30];
              v32 = [(VUIMediaEntity *)v6 valueForKey:v30];
              if (!v21) {
                goto LABEL_36;
              }
              id v33 = v31;
              id v34 = v32;
              if (v33 == v34)
              {
              }
              else
              {
                long long v35 = v34;
                if (v33) {
                  BOOL v36 = v34 == 0;
                }
                else {
                  BOOL v36 = 1;
                }
                if (v36)
                {

LABEL_36:
LABEL_37:
                  LOBYTE(v21) = 0;
                  goto LABEL_38;
                }
                char v37 = [v33 isEqual:v34];

                if ((v37 & 1) == 0) {
                  goto LABEL_37;
                }
              }
              LOBYTE(v21) = 1;
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
LABEL_38:

        goto LABEL_39;
      }
    }
    LOBYTE(v21) = 0;
  }
LABEL_40:

  return v21;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v83.receiver = self;
  v83.super_class = (Class)VUIMediaEntity;
  uint64_t v4 = [(VUIMediaEntity *)&v83 description];
  [v3 addObject:v4];

  id v5 = NSString;
  unint64_t v6 = [(VUIMediaEntity *)self mediaLibrary];
  v7 = [v6 title];
  v8 = [v5 stringWithFormat:@"%@=%p", @"mediaLibrary", v7];
  [v3 addObject:v8];

  int v9 = NSString;
  id v10 = [(VUIMediaEntity *)self identifier];
  id v11 = [v9 stringWithFormat:@"%@=%@", @"identifier", v10];
  [v3 addObject:v11];

  char v12 = NSString;
  BOOL v13 = [(VUIMediaEntity *)self isLocal];
  int v14 = [v12 stringWithFormat:@"%@=%@", @"isLocal", v13];
  [v3 addObject:v14];

  v15 = NSString;
  v16 = [(VUIMediaEntity *)self resolution];
  id v17 = [v15 stringWithFormat:@"%@=%@", @"resolution", v16];
  [v3 addObject:v17];

  id v18 = NSString;
  uint64_t v19 = [(VUIMediaEntity *)self colorCapability];
  char v20 = [v18 stringWithFormat:@"%@=%@", @"colorCapability", v19];
  [v3 addObject:v20];

  BOOL v21 = NSString;
  BOOL v22 = [(VUIMediaEntity *)self audioCapability];
  v23 = [v21 stringWithFormat:@"%@=%@", @"audioCapability", v22];
  [v3 addObject:v23];

  v24 = NSString;
  v25 = [(VUIMediaEntity *)self HLSResolution];
  uint64_t v26 = [v24 stringWithFormat:@"%@=%@", @"HLSResolution", v25];
  [v3 addObject:v26];

  uint64_t v27 = NSString;
  uint64_t v28 = [(VUIMediaEntity *)self HLSColorCapability];
  id v29 = [v27 stringWithFormat:@"%@=%@", @"HLSColorCapability", v28];
  [v3 addObject:v29];

  uint64_t v30 = NSString;
  char v31 = [(VUIMediaEntity *)self HLSAudioCapability];
  v32 = [v30 stringWithFormat:@"%@=%@", @"HLSAudioCapability", v31];
  [v3 addObject:v32];

  id v33 = NSString;
  id v34 = [(VUIMediaEntity *)self title];
  long long v35 = [v33 stringWithFormat:@"%@=%@", @"title", v34];
  [v3 addObject:v35];

  BOOL v36 = NSString;
  char v37 = [(VUIMediaEntity *)self genreTitle];
  long long v38 = [v36 stringWithFormat:@"%@=%@", @"genreTitle", v37];
  [v3 addObject:v38];

  v39 = NSString;
  long long v40 = [(VUIMediaEntity *)self contentDescription];
  long long v41 = [v39 stringWithFormat:@"%@=%@", @"contentDescription", v40];
  [v3 addObject:v41];

  long long v42 = NSString;
  long long v43 = [(VUIMediaEntity *)self addedDate];
  v44 = [v42 stringWithFormat:@"%@=%@", @"addedDate", v43];
  [v3 addObject:v44];

  uint64_t v45 = NSString;
  v46 = [(VUIMediaEntity *)self releaseDate];
  v47 = [v45 stringWithFormat:@"%@=%@", @"releaseDate", v46];
  [v3 addObject:v47];

  v48 = NSString;
  v49 = [(VUIMediaEntity *)self releaseYear];
  v50 = [v48 stringWithFormat:@"%@=%@", @"releaseYear", v49];
  [v3 addObject:v50];

  v51 = NSString;
  v52 = [(VUIMediaEntity *)self contentRating];
  v53 = [v51 stringWithFormat:@"%@=%@", @"contentRating", v52];
  [v3 addObject:v53];

  v54 = NSString;
  v55 = [(VUIMediaEntity *)self coverArtImageIdentifier];
  v56 = [v54 stringWithFormat:@"%@=%@", @"coverArtImageIdentifier", v55];
  [v3 addObject:v56];

  v57 = NSString;
  v58 = [(VUIMediaEntity *)self storeID];
  v59 = [v57 stringWithFormat:@"%@=%@", @"storeID", v58];
  [v3 addObject:v59];

  v60 = NSString;
  v61 = [(VUIMediaEntity *)self purchaseHistoryID];
  v62 = [v60 stringWithFormat:@"%@=%@", @"purchaseHistoryID", v61];
  [v3 addObject:v62];

  v63 = NSString;
  v64 = [(VUIMediaEntity *)self playedState];
  v65 = VUIMediaEntityPlayedStateLogString([v64 unsignedIntegerValue]);
  v66 = [v63 stringWithFormat:@"%@=%@", @"playedState", v65];
  [v3 addObject:v66];

  v67 = NSString;
  v68 = [(VUIMediaEntity *)self showIdentifier];
  v69 = [v67 stringWithFormat:@"%@=%@", @"showIdentifier", v68];
  [v3 addObject:v69];

  v70 = NSString;
  v71 = [(VUIMediaEntity *)self showTitle];
  v72 = [v70 stringWithFormat:@"%@=%@", @"showTitle", v71];
  [v3 addObject:v72];

  v73 = NSString;
  v74 = [(VUIMediaEntity *)self seasonNumber];
  v75 = [v73 stringWithFormat:@"%@=%@", @"seasonNumber", v74];
  [v3 addObject:v75];

  v76 = NSString;
  v77 = [(VUIMediaEntity *)self canonicalID];
  v78 = [v76 stringWithFormat:@"%@=%@", @"canonicalID", v77];
  [v3 addObject:v78];

  v79 = NSString;
  v80 = [v3 componentsJoinedByString:@", "];
  v81 = [v79 stringWithFormat:@"<%@>", v80];

  return v81;
}

- (BOOL)_didRequestPropertyWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMediaEntity *)self requestedProperties];
  BOOL v6 = (VUIMediaEntityFetchRequestIsAllPropertiesSet(v5) & 1) != 0
    || [v5 containsObject:v4];

  return v6;
}

- (id)_propertyValueWithBlock:(id)a3 forKey:(id)a4
{
  BOOL v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"block" format];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"key" format];
LABEL_3:
  int v9 = [(VUIMediaEntity *)self kind];
  id v10 = [v9 propertyDescriptorForName:v8];

  id v11 = v6[2](v6, v10);
  if (!v11)
  {
    id v11 = [(VUIMediaEntity *)self _defaultValueForPropertyDescriptor:v10];
  }
  char v12 = self;
  objc_sync_enter(v12);
  BOOL v13 = [(VUIMediaEntity *)v12 firstAccessPropertiesCache];
  int v14 = v13;
  if (v13)
  {
    id v15 = [v13 objectForKey:v8];
    if (!v15)
    {
      id v15 = v11;
      if (!v15)
      {
        id v15 = [MEMORY[0x1E4F1CA98] null];
      }
      [v14 setObject:v15 forKey:v8];
    }
  }
  objc_sync_exit(v12);

  return v11;
}

- (id)_propertyValueForKey:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__VUIMediaEntity__propertyValueForKey___block_invoke;
  v5[3] = &unk_1E6DFA650;
  v5[4] = self;
  id v3 = [(VUIMediaEntity *)self _propertyValueWithBlock:v5 forKey:a3];
  return v3;
}

uint64_t __39__VUIMediaEntity__propertyValueForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _valueForPropertyDescriptor:a2];
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  return 0;
}

- (NSMutableDictionary)firstAccessPropertiesCache
{
  if (!self->_firstAccessPropertiesCache
    && [(VUIMediaEntity *)self cachesPropertiesOnFirstAccess])
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    firstAccessPropertiesCache = self->_firstAccessPropertiesCache;
    self->_firstAccessPropertiesCache = v3;
  }
  id v5 = self->_firstAccessPropertiesCache;
  return v5;
}

- (id)_defaultValueForPropertyDescriptor:(id)a3
{
  id v3 = a3;
  if ([v3 allowsDefaultValue])
  {
    id v4 = [v3 defaultValue];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (BOOL)hasLocalChanges
{
  return self->_localChanges;
}

- (void)setLocalChanges:(BOOL)a3
{
  self->_localChanges = a3;
}

- (VUIMediaEntityIdentifierInternal)identifierInternal
{
  return self->_identifierInternal;
}

- (void)setIdentifierInternal:(id)a3
{
}

- (void)setFirstAccessPropertiesCache:(id)a3
{
}

- (BOOL)cachesPropertiesOnFirstAccess
{
  return self->_cachesPropertiesOnFirstAccess;
}

- (void)setCachesPropertiesOnFirstAccess:(BOOL)a3
{
  self->_cachesPropertiesOnFirstAccess = a3;
}

- (VUIMediaEntityKind)kind
{
  return self->_kind;
}

- (NSSet)requestedProperties
{
  return self->_requestedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_firstAccessPropertiesCache, 0);
  objc_storeStrong((id *)&self->_identifierInternal, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end