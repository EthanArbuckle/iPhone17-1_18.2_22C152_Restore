@interface BKCollectionMember
+ (id)collectionMemberDictionariesWithAssetIDs:(id)a3;
+ (id)collectionMemberDictionaryWithLibraryAsset:(id)a3 sortKey:(id)a4;
+ (id)predicateForCollectionMembersWithAssetIDs:(id)a3;
+ (id)predicateForCollectionMembersWithCollection:(id)a3;
- (NSDate)localModDate;
- (NSString)collectionID;
- (id)collectionMemberRepresentation;
- (id)shortDescription;
- (void)awakeFromFetch;
- (void)configureFromCollectionMember:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setLocalModDate:(id)a3;
- (void)setSortKey:(id)a3;
- (void)setTemporaryAssetID:(id)a3;
- (void)updateLastModification;
@end

@implementation BKCollectionMember

- (void)awakeFromFetch
{
  v8.receiver = self;
  v8.super_class = (Class)BKCollectionMember;
  [(BKCollectionMember *)&v8 awakeFromFetch];
  v3 = [(BKCollectionMember *)self collection];

  if (v3)
  {
    v4 = [(BKCollectionMember *)self collection];
    v5 = [v4 collectionID];
    v6 = (NSString *)[v5 copy];
    collectionID = self->_collectionID;
    self->_collectionID = v6;
  }
}

+ (id)collectionMemberDictionaryWithLibraryAsset:(id)a3 sortKey:(id)a4
{
  id v5 = a4;
  v6 = [a3 assetID];
  if ([v6 length])
  {
    v7 = +[NSDictionary dictionaryWithObjectsAndKeys:v6, @"assetID", v5, @"sortKey", 0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)collectionMemberDictionariesWithAssetIDs:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length])
        {
          id v11 = objc_alloc((Class)NSDictionary);
          id v12 = [v11 initWithObjectsAndKeys:v10, @"assetID", 0, v14];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)predicateForCollectionMembersWithAssetIDs:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    +[NSPredicate predicateWithFormat:@"assetID IN %@", v3];
  }
  else {
  id v4 = +[NSPredicate predicateWithValue:0];
  }

  return v4;
}

+ (id)predicateForCollectionMembersWithCollection:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"collection", a3];
}

- (id)collectionMemberRepresentation
{
  uint64_t v3 = [(BKCollectionMember *)self collectionID];
  if (v3
    && (id v4 = (void *)v3,
        [(BKCollectionMember *)self assetID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(BKCollectionMember *)self collectionID];
    id v7 = [(BKCollectionMember *)self assetID];
    uint64_t v8 = +[BCCollectionMember collectionMemberIDWithCollectionID:v6 assetID:v7];

    id v9 = [objc_alloc((Class)BCMutableCollectionMember) initWithCollectionMemberID:v8];
    v10 = [(BKCollectionMember *)self sortKey];
    [v9 setSortOrder:[v10 intValue]];

    [v9 setDeletedFlag:0];
    id v11 = [(BKCollectionMember *)self localModDate];
    [v9 setModificationDate:v11];
  }
  else
  {
    id v12 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_92ABC(self);
    }

    id v9 = 0;
  }

  return v9;
}

- (void)configureFromCollectionMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKCollectionMember *)self localModDate];
  uint64_t v6 = [v4 modificationDate];
  id v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v18 = +[BULogUtilities shared];
    unsigned int v19 = [v18 verboseLoggingEnabled];

    if (!v19) {
      goto LABEL_17;
    }
    v10 = BKLibraryCollectionDevelopmentLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    id v11 = [(BKCollectionMember *)self collection];
    id v12 = [v11 title];
    v13 = [(BKCollectionMember *)self asset];
    long long v14 = [v13 title];
    *(_DWORD *)buf = 138412546;
    uint64_t v50 = (uint64_t)v12;
    __int16 v51 = 2112;
    v52 = v14;
    long long v15 = "\"\\\"configureFromCollectionMember No local modDate, No collectionMember modDate for collectionMember %@ - %@\\\"\"";
    long long v16 = v10;
    uint32_t v17 = 22;
    goto LABEL_15;
  }
  if (!v5 && v6)
  {
    uint64_t v8 = +[BULogUtilities shared];
    unsigned int v9 = [v8 verboseLoggingEnabled];

    if (!v9) {
      goto LABEL_17;
    }
    v10 = BKLibraryCollectionDevelopmentLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    id v11 = [(BKCollectionMember *)self collection];
    id v12 = [v11 title];
    v13 = [(BKCollectionMember *)self asset];
    long long v14 = [v13 title];
    *(_DWORD *)buf = 138412802;
    uint64_t v50 = (uint64_t)v7;
    __int16 v51 = 2112;
    v52 = v12;
    __int16 v53 = 2112;
    v54 = v14;
    long long v15 = "\"\\\"No local modDate, collectionMember has modDate:%@  for collectionMember %@ - %@\\\"\"";
    long long v16 = v10;
    uint32_t v17 = 32;
    goto LABEL_15;
  }
  if (v5)
  {
    if (v6)
    {
      v20 = +[BULogUtilities shared];
      unsigned int v21 = [v20 verboseLoggingEnabled];

      if (v21)
      {
        v10 = BKLibraryCollectionDevelopmentLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        id v11 = [(BKCollectionMember *)self collection];
        id v12 = [v11 title];
        v13 = [(BKCollectionMember *)self asset];
        long long v14 = [v13 title];
        *(_DWORD *)buf = 138413058;
        uint64_t v50 = v5;
        __int16 v51 = 2112;
        v52 = v7;
        __int16 v53 = 2112;
        v54 = v12;
        __int16 v55 = 2112;
        v56 = v14;
        long long v15 = "\"\\\"local has modDate:%@, collectionMember has modDate:%@ for collectionMember %@ - %@\\\"\"";
        long long v16 = v10;
        uint32_t v17 = 42;
LABEL_15:
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);

        goto LABEL_16;
      }
    }
  }
LABEL_17:
  v22 = [v4 collectionMemberID];
  v23 = +[BCCollectionMember collectionIDFromCollectionMemberID:v22];

  v24 = [v4 collectionMemberID];
  v25 = +[BCCollectionMember assetIDFromCollectionMemberID:v24];

  if ([v4 deletedFlag])
  {
    v26 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_92D98(self);
    }
  }
  uint64_t v27 = [(BKCollectionMember *)self collectionID];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(BKCollectionMember *)self collectionID];
    unsigned __int8 v30 = [v23 isEqualToString:v29];

    if ((v30 & 1) == 0)
    {
      v31 = BKLibraryCollectionLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_92D08(self);
      }
    }
  }
  v32 = [(BKCollectionMember *)self assetID];

  if (!v32)
  {
    [(BKCollectionMember *)self setAssetID:v25];
    v35 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_92B70(self, v35);
    }
    goto LABEL_32;
  }
  v33 = [(BKCollectionMember *)self assetID];
  unsigned __int8 v34 = [v25 isEqualToString:v33];

  if ((v34 & 1) == 0)
  {
    v35 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_92C78(self);
    }
LABEL_32:
  }
  if (v7)
  {
    if (!v5
      || ([v7 timeIntervalSinceReferenceDate],
          double v37 = v36,
          [(id)v5 timeIntervalSinceReferenceDate],
          v37 > v38))
    {
      v39 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v4 sortOrder]);
      [(BKCollectionMember *)self setDifferentNumber:v39 forKey:@"sortKey"];
      unsigned int v40 = [(BKCollectionMember *)self hasChanges];
      [(BKCollectionMember *)self setDifferentDate:v7 forKey:@"localModDate"];
      v41 = +[BULogUtilities shared];
      unsigned int v42 = [v41 verboseLoggingEnabled];

      if (v40)
      {
        if (v42)
        {
          v43 = BKLibraryCollectionDevelopmentLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = [(BKCollectionMember *)self shortDescription];
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = (uint64_t)v44;
            _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "\"\\\"BKCollectionMember Configured with changes: %@\\\"\"", buf, 0xCu);
          }
LABEL_43:
        }
      }
      else if (v42)
      {
        v43 = BKLibraryCollectionDevelopmentLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [(BKCollectionMember *)self collection];
          v45 = [v48 title];
          v46 = [(BKCollectionMember *)self asset];
          v47 = [v46 title];
          *(_DWORD *)buf = 138412546;
          uint64_t v50 = (uint64_t)v45;
          __int16 v51 = 2112;
          v52 = v47;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "\"\\\"BKCollectionMember Configure - No changes besides date for collectionMember %@ - %@\\\"\"", buf, 0x16u);
        }
        goto LABEL_43;
      }
    }
  }
}

- (id)shortDescription
{
  uint64_t v3 = [(BKCollectionMember *)self collection];
  id v4 = [v3 collectionID];
  uint64_t v5 = [(BKCollectionMember *)self assetID];
  uint64_t v6 = [(BKCollectionMember *)self asset];
  id v7 = [v6 title];
  uint64_t v8 = [(BKCollectionMember *)self sortKey];
  unsigned int v9 = +[NSString stringWithFormat:@"BKCollectionMember collectionID: %@ assetID: %@ title: %@ sortKey:%@", v4, v5, v7, v8];

  return v9;
}

- (void)updateLastModification
{
  id v3 = +[NSDate date];
  [(BKCollectionMember *)self setLocalModDate:v3];
}

- (void)setAssetID:(id)a3
{
  id v6 = a3;
  id v4 = [(BKCollectionMember *)self assetID];
  unsigned __int8 v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(BKCollectionMember *)self willChangeValueForKey:@"assetID"];
    [(BKCollectionMember *)self setPrimitiveValue:v6 forKey:@"assetID"];
    [(BKCollectionMember *)self updateLastModification];
    [(BKCollectionMember *)self didChangeValueForKey:@"assetID"];
  }
}

- (void)setTemporaryAssetID:(id)a3
{
  id v6 = a3;
  id v4 = [(BKCollectionMember *)self temporaryAssetID];
  unsigned __int8 v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(BKCollectionMember *)self willChangeValueForKey:@"temporaryAssetID"];
    [(BKCollectionMember *)self setPrimitiveValue:v6 forKey:@"temporaryAssetID"];
    [(BKCollectionMember *)self updateLastModification];
    [(BKCollectionMember *)self didChangeValueForKey:@"temporaryAssetID"];
  }
}

- (void)setAsset:(id)a3
{
  id v5 = a3;
  id v4 = [(BKCollectionMember *)self asset];

  if (v4 != v5)
  {
    [(BKCollectionMember *)self willChangeValueForKey:@"asset"];
    [(BKCollectionMember *)self setPrimitiveValue:v5 forKey:@"asset"];
    [(BKCollectionMember *)self updateLastModification];
    [(BKCollectionMember *)self didChangeValueForKey:@"asset"];
  }
}

- (void)setSortKey:(id)a3
{
  id v6 = a3;
  id v4 = [(BKCollectionMember *)self sortKey];
  unsigned __int8 v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(BKCollectionMember *)self willChangeValueForKey:@"sortKey"];
    [(BKCollectionMember *)self setPrimitiveValue:v6 forKey:@"sortKey"];
    [(BKCollectionMember *)self updateLastModification];
    [(BKCollectionMember *)self didChangeValueForKey:@"sortKey"];
  }
}

- (void)setCollection:(id)a3
{
  id v10 = a3;
  id v4 = [(BKCollectionMember *)self collection];

  if (v4 != v10)
  {
    [(BKCollectionMember *)self willChangeValueForKey:@"collection"];
    [(BKCollectionMember *)self setPrimitiveValue:v10 forKey:@"collection"];
    [(BKCollectionMember *)self updateLastModification];
    [(BKCollectionMember *)self didChangeValueForKey:@"collection"];
    unsigned __int8 v5 = [(BKCollectionMember *)self collection];

    if (v5)
    {
      id v6 = [(BKCollectionMember *)self collection];
      id v7 = [v6 collectionID];
      uint64_t v8 = (NSString *)[v7 copy];
      collectionID = self->_collectionID;
      self->_collectionID = v8;
    }
  }
}

- (NSString)collectionID
{
  if (!self->_collectionID)
  {
    id v3 = [(BKCollectionMember *)self collection];

    if (v3)
    {
      id v4 = [(BKCollectionMember *)self collection];
      unsigned __int8 v5 = [v4 collectionID];
      id v6 = (NSString *)[v5 copy];
      collectionID = self->_collectionID;
      self->_collectionID = v6;
    }
  }
  uint64_t v8 = self->_collectionID;

  return v8;
}

- (void)setCollectionID:(id)a3
{
}

- (NSDate)localModDate
{
  return self->_localModDate;
}

- (void)setLocalModDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localModDate, 0);

  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end