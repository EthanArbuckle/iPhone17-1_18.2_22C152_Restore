@interface BKMLAudiobookIdentifier
+ (id)identifierFromAlbumPersistentID:(id)a3;
+ (id)identifierFromAssetID:(id)a3 albumTitle:(id)a4;
+ (id)identifierFromMediaQuery:(id)a3 supplementalAssetIdentifiers:(id)a4;
+ (id)identifierFromPersistentID:(id)a3;
- (BKMLAudiobookIdentifier)initWithAlbumPersistentID:(id)a3;
- (BKMLAudiobookIdentifier)initWithAssetID:(id)a3 albumTitle:(id)a4;
- (BKMLAudiobookIdentifier)initWithMediaQuery:(id)a3 supplementalAssetIDs:(id)a4;
- (BKMLAudiobookIdentifier)initWithPersistentID:(id)a3;
- (BOOL)isEqualToIdentifier:(id)a3;
- (BOOL)isValid;
- (MPMediaQuery)query;
- (NSArray)supplementalAssetIdentifiers;
- (NSNumber)albumPersistentID;
- (NSNumber)persistentID;
- (NSNumber)storeID;
- (NSString)albumTitle;
- (NSString)description;
- (id)audiobookQuery;
- (void)setQuery:(id)a3;
- (void)setSupplementalAssetIdentifiers:(id)a3;
@end

@implementation BKMLAudiobookIdentifier

+ (id)identifierFromPersistentID:(id)a3
{
  id v3 = a3;
  v4 = [[BKMLAudiobookIdentifier alloc] initWithPersistentID:v3];

  return v4;
}

+ (id)identifierFromAlbumPersistentID:(id)a3
{
  id v3 = a3;
  v4 = [[BKMLAudiobookIdentifier alloc] initWithAlbumPersistentID:v3];

  return v4;
}

+ (id)identifierFromAssetID:(id)a3 albumTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BKMLAudiobookIdentifier alloc] initWithAssetID:v6 albumTitle:v5];

  return v7;
}

+ (id)identifierFromMediaQuery:(id)a3 supplementalAssetIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BKMLAudiobookIdentifier alloc] initWithMediaQuery:v6 supplementalAssetIDs:v5];

  return v7;
}

- (BKMLAudiobookIdentifier)initWithPersistentID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMLAudiobookIdentifier;
  id v6 = [(BKMLAudiobookIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentID, a3);
  }

  return v7;
}

- (BKMLAudiobookIdentifier)initWithAlbumPersistentID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMLAudiobookIdentifier;
  id v6 = [(BKMLAudiobookIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_albumPersistentID, a3);
  }

  return v7;
}

- (BKMLAudiobookIdentifier)initWithAssetID:(id)a3 albumTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKMLAudiobookIdentifier;
  v8 = [(BKMLAudiobookIdentifier *)&v14 init];
  if (v8)
  {
    uint64_t v9 = BUStoreIdFromObject();
    if (v9)
    {
      uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:v9];
      storeID = v8->_storeID;
      v8->_storeID = (NSNumber *)v10;
    }
    else
    {
      v12 = (NSString *)[v7 copy];
      storeID = (NSNumber *)v8->_albumTitle;
      v8->_albumTitle = v12;
    }
  }
  return v8;
}

- (BKMLAudiobookIdentifier)initWithMediaQuery:(id)a3 supplementalAssetIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKMLAudiobookIdentifier;
  uint64_t v9 = [(BKMLAudiobookIdentifier *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v11 = (NSArray *)[v8 copy];
    supplementalAssetIdentifiers = v10->_supplementalAssetIdentifiers;
    v10->_supplementalAssetIdentifiers = v11;
  }
  return v10;
}

- (BOOL)isValid
{
  id v3 = [(BKMLAudiobookIdentifier *)self persistentID];
  if (v3)
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(BKMLAudiobookIdentifier *)self storeID];
    if (v5)
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(BKMLAudiobookIdentifier *)self albumPersistentID];
      if (v6)
      {
        char v4 = 1;
      }
      else
      {
        id v7 = [(BKMLAudiobookIdentifier *)self query];
        if (v7)
        {
          char v4 = 1;
        }
        else
        {
          id v8 = [(BKMLAudiobookIdentifier *)self albumTitle];
          char v4 = [v8 length] != 0;
        }
      }
    }
  }

  return v4;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  char v4 = (BKMLAudiobookIdentifier *)a3;
  if (self == v4)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(BKMLAudiobookIdentifier *)self persistentID];
      uint64_t v7 = [(BKMLAudiobookIdentifier *)v5 persistentID];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(BKMLAudiobookIdentifier *)self persistentID];
        uint64_t v10 = [(BKMLAudiobookIdentifier *)v5 persistentID];
        unsigned int v11 = [v9 isEqualToNumber:v10];

        if (!v11) {
          goto LABEL_23;
        }
      }
      v13 = [(BKMLAudiobookIdentifier *)self storeID];
      uint64_t v14 = [(BKMLAudiobookIdentifier *)v5 storeID];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        v16 = [(BKMLAudiobookIdentifier *)self storeID];
        v17 = [(BKMLAudiobookIdentifier *)v5 storeID];
        unsigned int v18 = [v16 isEqualToNumber:v17];

        if (!v18) {
          goto LABEL_23;
        }
      }
      v19 = [(BKMLAudiobookIdentifier *)self albumPersistentID];
      uint64_t v20 = [(BKMLAudiobookIdentifier *)v5 albumPersistentID];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        v21 = (void *)v20;
        v22 = [(BKMLAudiobookIdentifier *)self albumPersistentID];
        v23 = [(BKMLAudiobookIdentifier *)v5 albumPersistentID];
        unsigned int v24 = [v22 isEqualToNumber:v23];

        if (!v24) {
          goto LABEL_23;
        }
      }
      v25 = [(BKMLAudiobookIdentifier *)self query];
      uint64_t v26 = [(BKMLAudiobookIdentifier *)v5 query];
      if (v25 == (void *)v26)
      {
      }
      else
      {
        v27 = (void *)v26;
        v28 = [(BKMLAudiobookIdentifier *)self query];
        v29 = [(BKMLAudiobookIdentifier *)v5 query];
        unsigned int v30 = [v28 isEqual:v29];

        if (!v30) {
          goto LABEL_23;
        }
      }
      v31 = [(BKMLAudiobookIdentifier *)self albumTitle];
      uint64_t v32 = [(BKMLAudiobookIdentifier *)v5 albumTitle];
      if (v31 == (void *)v32)
      {
      }
      else
      {
        v33 = (void *)v32;
        v34 = [(BKMLAudiobookIdentifier *)self albumTitle];
        v35 = [(BKMLAudiobookIdentifier *)v5 albumTitle];
        unsigned int v36 = [v34 isEqualToString:v35];

        if (!v36)
        {
LABEL_23:
          unsigned __int8 v12 = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      v38 = [(BKMLAudiobookIdentifier *)self supplementalAssetIdentifiers];
      v39 = [(BKMLAudiobookIdentifier *)v5 supplementalAssetIdentifiers];
      if (v38 == v39)
      {
        unsigned __int8 v12 = 1;
      }
      else
      {
        v40 = [(BKMLAudiobookIdentifier *)self supplementalAssetIdentifiers];
        v41 = [(BKMLAudiobookIdentifier *)v5 supplementalAssetIdentifiers];
        unsigned __int8 v12 = [v40 isEqual:v41];
      }
      goto LABEL_24;
    }
    unsigned __int8 v12 = 0;
  }
LABEL_25:

  return v12;
}

- (id)audiobookQuery
{
  id v3 = [(BKMLAudiobookIdentifier *)self query];

  if (v3)
  {
    char v4 = [(BKMLAudiobookIdentifier *)self query];
    goto LABEL_14;
  }
  if ([(BKMLAudiobookIdentifier *)self isValid])
  {
    char v4 = +[MPMediaQuery bk_audiobooksQuery];
    [v4 setIgnoreSystemFilterPredicates:1];
    [v4 setGroupingType:1];
    id v5 = [(BKMLAudiobookIdentifier *)self persistentID];

    if (v5)
    {
      id v6 = [(BKMLAudiobookIdentifier *)self persistentID];
      uint64_t v7 = &MPMediaItemPropertyPersistentID;
LABEL_13:
      unsigned __int8 v12 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:*v7];
      [v4 addFilterPredicate:v12];

      goto LABEL_14;
    }
    uint64_t v9 = [(BKMLAudiobookIdentifier *)self albumPersistentID];

    if (v9)
    {
      id v6 = [(BKMLAudiobookIdentifier *)self albumPersistentID];
      uint64_t v7 = &MPMediaItemPropertyAlbumPersistentID;
      goto LABEL_13;
    }
    uint64_t v10 = [(BKMLAudiobookIdentifier *)self albumTitle];
    id v11 = [v10 length];

    if (v11)
    {
      id v6 = [(BKMLAudiobookIdentifier *)self albumTitle];
      uint64_t v7 = &MPMediaItemPropertyAlbumTitle;
      goto LABEL_13;
    }
    uint64_t v14 = [(BKMLAudiobookIdentifier *)self storeID];

    if (v14)
    {
      v15 = [(BKMLAudiobookIdentifier *)self storeID];
      uint64_t v16 = MPMediaItemPropertyStorePlaylistID;
      v17 = +[MPMediaPropertyPredicate predicateWithValue:v15 forProperty:MPMediaItemPropertyStorePlaylistID];
      [v4 addFilterPredicate:v17];

      unsigned int v18 = [v4 collections];
      id v19 = [v18 count];

      if (!v19)
      {
        [v4 removePredicatesForProperty:v16];
        id v6 = [(BKMLAudiobookIdentifier *)self storeID];
        uint64_t v7 = (NSString *const *)&MPMediaItemPropertyStoreID;
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v8 = BKAudiobooksLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2578C(v8);
    }

    char v4 = 0;
  }
LABEL_14:

  return v4;
}

- (NSString)description
{
  id v3 = [(BKMLAudiobookIdentifier *)self persistentID];

  if (v3)
  {
    char v4 = [(BKMLAudiobookIdentifier *)self persistentID];
    +[NSString stringWithFormat:@"persistentID: %@", v4];
LABEL_9:
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  id v5 = [(BKMLAudiobookIdentifier *)self storeID];

  if (v5)
  {
    char v4 = [(BKMLAudiobookIdentifier *)self storeID];
    +[NSString stringWithFormat:@"storeID: %@", v4];
    goto LABEL_9;
  }
  id v6 = [(BKMLAudiobookIdentifier *)self query];

  if (v6)
  {
    char v4 = [(BKMLAudiobookIdentifier *)self query];
    +[NSString stringWithFormat:@"query: %@", v4];
    goto LABEL_9;
  }
  uint64_t v7 = [(BKMLAudiobookIdentifier *)self albumTitle];
  id v8 = [v7 length];

  if (v8)
  {
    char v4 = [(BKMLAudiobookIdentifier *)self albumTitle];
    +[NSString stringWithFormat:@"albumTitle: '%@'", v4];
    goto LABEL_9;
  }
  uint64_t v9 = @"no persistentID or assetID set";
LABEL_10:
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  uint64_t v12 = [(NSArray *)self->_supplementalAssetIdentifiers componentsJoinedByString:@","];
  v13 = (void *)v12;
  uint64_t v14 = &__NSArray0__struct;
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  v15 = +[NSString stringWithFormat:@"<%@(%p) %@ supplementalAssetIDs=%@>", v11, self, v9, v14];

  return (NSString *)v15;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (NSNumber)albumPersistentID
{
  return self->_albumPersistentID;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSArray)supplementalAssetIdentifiers
{
  return self->_supplementalAssetIdentifiers;
}

- (void)setSupplementalAssetIdentifiers:(id)a3
{
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_supplementalAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_albumPersistentID, 0);

  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end