@interface PLCloudRecordOrganizer
+ (BOOL)records:(id)a3 containsScopedIdentifier:(id)a4;
- (NSMutableArray)albumRecords;
- (NSMutableArray)albumRecordsWithContainerChange;
- (NSMutableArray)assetRecords;
- (NSMutableArray)assetRecordsWithContainerChange;
- (NSMutableArray)deletePersonRecords;
- (NSMutableArray)deleteRecords;
- (NSMutableArray)expungedRecords;
- (NSMutableArray)faceCropRecords;
- (NSMutableArray)masterRecords;
- (NSMutableArray)memoryRecords;
- (NSMutableArray)personRecords;
- (NSMutableArray)scopeRecords;
- (NSMutableArray)socialGroupRecords;
- (NSMutableArray)suggestionRecords;
- (PLCloudRecordOrganizer)initWithPhotoLibrary:(id)a3;
- (void)organizeRecords:(id)a3;
@end

@implementation PLCloudRecordOrganizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroupRecords, 0);
  objc_storeStrong((id *)&self->_suggestionRecords, 0);
  objc_storeStrong((id *)&self->_expungedRecords, 0);
  objc_storeStrong((id *)&self->_deletePersonRecords, 0);
  objc_storeStrong((id *)&self->_deleteRecords, 0);
  objc_storeStrong((id *)&self->_faceCropRecords, 0);
  objc_storeStrong((id *)&self->_memoryRecords, 0);
  objc_storeStrong((id *)&self->_albumRecords, 0);
  objc_storeStrong((id *)&self->_assetRecords, 0);
  objc_storeStrong((id *)&self->_masterRecords, 0);
  objc_storeStrong((id *)&self->_scopeRecords, 0);
  objc_storeStrong((id *)&self->_personRecords, 0);
  objc_storeStrong((id *)&self->_albumRecordsWithContainerChange, 0);
  objc_storeStrong((id *)&self->_assetRecordsWithContainerChange, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (NSMutableArray)socialGroupRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableArray)suggestionRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSMutableArray)expungedRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSMutableArray)deletePersonRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableArray)deleteRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)faceCropRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableArray)memoryRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableArray)albumRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableArray)assetRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableArray)masterRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableArray)scopeRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableArray)personRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)albumRecordsWithContainerChange
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)assetRecordsWithContainerChange
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)organizeRecords:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    p_deletePersonRecords = &self->_deletePersonRecords;
    p_expungedRecords = &self->_expungedRecords;
    uint64_t v10 = *(void *)v31;
    *(void *)&long long v6 = 138412290;
    long long v29 = v6;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        __int16 v13 = objc_msgSend(v12, "changeType", v29);
        if ((v13 & 0x400) == 0)
        {
          int v14 = [v12 inExpunged];
          v15 = (id *)p_expungedRecords;
          if (v14)
          {
LABEL_11:
            [*v15 addObject:v12];
            if ([v12 inExpunged]) {
              goto LABEL_60;
            }
            if ((v13 & 0x400) != 0) {
              goto LABEL_17;
            }
          }
          else if ([v12 inExpunged])
          {
            goto LABEL_60;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            masterRecords = self->_masterRecords;
LABEL_15:
            [(NSMutableArray *)masterRecords addObject:v12];
            goto LABEL_60;
          }
          goto LABEL_17;
        }
        [(NSMutableArray *)self->_deleteRecords addObject:v12];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v15 = (id *)p_deletePersonRecords;
        if (isKindOfClass) {
          goto LABEL_11;
        }
        if ([v12 inExpunged]) {
          goto LABEL_60;
        }
LABEL_17:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v12;
          if ([v18 hasChangeType:16]) {
            [(NSMutableArray *)self->_assetRecordsWithContainerChange addObject:v18];
          }
          if ((v13 & 0x400) == 0) {
            [(NSMutableArray *)self->_assetRecords addObject:v18];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v12;
            if ([v19 hasChangeType:2]) {
              [(NSMutableArray *)self->_albumRecordsWithContainerChange addObject:v19];
            }
            if ((v13 & 0x400) == 0)
            {
              id v20 = v19;
              if (![v20 albumType]
                || [v20 albumType] == 3
                || [v20 albumType] == 7)
              {
                v21 = [v20 scopedIdentifier];
                v22 = [v21 identifier];

                if (([@"----Root-Folder----" isEqualToString:v22] & 1) != 0
                  || ([@"----Project-Root-Folder----" isEqualToString:v22] & 1) != 0)
                {
                  if ([@"----Root-Folder----" isEqualToString:v22])
                  {
                    uint64_t v23 = +[PLGenericAlbum rootFolderInLibrary:self->_photoLibrary];
                    goto LABEL_41;
                  }
                  if ([@"----Project-Root-Folder----" isEqualToString:v22])
                  {
                    uint64_t v23 = +[PLGenericAlbum projectAlbumRootFolderInLibrary:self->_photoLibrary];
LABEL_41:
                    v24 = (void *)v23;
                  }
                  else
                  {
                    if (!*MEMORY[0x1E4F59AC0])
                    {
                      v25 = __CPLAssetsdOSLogDomain();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        id v35 = v20;
                        __int16 v36 = 2112;
                        v37 = v22;
                        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Received unexpected root folder type in CPLAlbumChange: %@, with identifier: %@", buf, 0x16u);
                      }
                    }
                    v24 = 0;
                  }
                  int v26 = [v24 customSortAscending];
                  if (v26 != [v20 albumSortAscending]) {
                    objc_msgSend(v24, "setCustomSortAscending:", objc_msgSend(v20, "albumSortAscending"));
                  }
                  int v27 = [v24 customSortKey];
                  if (v27 != [v20 albumSortType]) {
                    objc_msgSend(v24, "setCustomSortKey:", objc_msgSend(v20, "albumSortType"));
                  }
                  p_deletePersonRecords = &self->_deletePersonRecords;
                  if ([v24 cloudLocalState] != 1) {
                    [v24 setCloudLocalState:1];
                  }
                }
                else
                {
                  [(NSMutableArray *)self->_albumRecords addObject:v20];
                }
LABEL_57:
              }
              else if (!*MEMORY[0x1E4F59AC0])
              {
                v22 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v29;
                  id v35 = v20;
                  _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "We are dropping record %@, not yet handling that type", buf, 0xCu);
                }
                goto LABEL_57;
              }

              p_expungedRecords = &self->_expungedRecords;
            }

            goto LABEL_60;
          }
          if ((v13 & 0x400) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              masterRecords = self->_personRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              masterRecords = self->_memoryRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              masterRecords = self->_suggestionRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              masterRecords = self->_socialGroupRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              masterRecords = self->_faceCropRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              masterRecords = self->_scopeRecords;
              goto LABEL_15;
            }
          }
        }
LABEL_60:
        ++v11;
      }
      while (v7 != v11);
      uint64_t v28 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
      uint64_t v7 = v28;
    }
    while (v28);
  }
}

- (PLCloudRecordOrganizer)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PLCloudRecordOrganizer;
  long long v6 = [(PLCloudRecordOrganizer *)&v38 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetRecordsWithContainerChange = v7->_assetRecordsWithContainerChange;
    v7->_assetRecordsWithContainerChange = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    albumRecordsWithContainerChange = v7->_albumRecordsWithContainerChange;
    v7->_albumRecordsWithContainerChange = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    personRecords = v7->_personRecords;
    v7->_personRecords = v12;

    int v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scopeRecords = v7->_scopeRecords;
    v7->_scopeRecords = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    masterRecords = v7->_masterRecords;
    v7->_masterRecords = v16;

    id v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetRecords = v7->_assetRecords;
    v7->_assetRecords = v18;

    id v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    albumRecords = v7->_albumRecords;
    v7->_albumRecords = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    memoryRecords = v7->_memoryRecords;
    v7->_memoryRecords = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    faceCropRecords = v7->_faceCropRecords;
    v7->_faceCropRecords = v24;

    int v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deleteRecords = v7->_deleteRecords;
    v7->_deleteRecords = v26;

    uint64_t v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletePersonRecords = v7->_deletePersonRecords;
    v7->_deletePersonRecords = v28;

    long long v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    expungedRecords = v7->_expungedRecords;
    v7->_expungedRecords = v30;

    long long v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    suggestionRecords = v7->_suggestionRecords;
    v7->_suggestionRecords = v32;

    v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    socialGroupRecords = v7->_socialGroupRecords;
    v7->_socialGroupRecords = v34;

    __int16 v36 = v7;
  }

  return v7;
}

+ (BOOL)records:(id)a3 containsScopedIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "scopedIdentifier", (void)v14);
        char v12 = [v11 isEqual:v6];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

@end