@interface QLCacheIndexDatabaseQueryEnumerator
- (BOOL)nextThumbnailInfo;
- (CGRect)contentRect;
- (NSDate)lastHitDate;
- (QLCacheBlobInfo)bitmapDataBlobInfo;
- (QLCacheBlobInfo)metadataBlobInfo;
- (QLCacheFileIdentifier)fileIdentifier;
- (QLCacheIndexDatabaseQueryEnumerator)initWithSqliteDatabase:(id)a3 fileRequests:(id)a4;
- (QLTBitmapFormat)bitmapFormat;
- (float)size;
- (int)flavor;
- (int)interpolationQuality;
- (int64_t)iconVariant;
- (unint64_t)badgeType;
- (unint64_t)cacheId;
- (unint64_t)externalGeneratorDataHash;
- (unsigned)hitCount;
- (unsigned)iconMode;
- (void)_getCacheIds;
- (void)_getCacheIdsForHomogeneousArrayOfRequests:(id)a3;
- (void)dealloc;
- (void)nextThumbnailInfo;
@end

@implementation QLCacheIndexDatabaseQueryEnumerator

- (QLCacheFileIdentifier)fileIdentifier
{
  return self->_fileIdentifier;
}

- (BOOL)nextThumbnailInfo
{
  v2 = self;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  p_stmt = &self->super._stmt;
  v64 = &self->super._stmt;
  if (self->super._stmt)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT file_id, size, icon_mode, bitmapFormat, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length, flavor, content_rect, hit_count, last_hit_date, badge_type, icon_variant, interpolation, externalGeneratorDataHash FROM thumbnails WHERE "];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v6 = v2->_allFileRequests;
    uint64_t v68 = [(NSArray *)v6 countByEnumeratingWithState:&v88 objects:v92 count:16];
    if (v68)
    {
      v63 = v2;
      char v69 = 0;
      uint64_t v7 = 0;
      uint64_t v67 = *(void *)v89;
      v65 = v6;
      do
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v89 != v67) {
            objc_enumerationMutation(v6);
          }
          v9 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          if ([v9 cacheId])
          {
            if (v7 >= 1) {
              [v5 appendString:@" OR "];
            }
            uint64_t v10 = [v9 cacheId];
            objc_msgSend(v5, "appendFormat:", @"(file_id=?");
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke;
            aBlock[3] = &__block_descriptor_40_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
            aBlock[4] = v10;
            v11 = _Block_copy(aBlock);
            [v4 addObject:v11];

            if (v69) {
              char v69 = 1;
            }
            else {
              char v69 = [v9 hasAtLeastOneLowQuality];
            }
            if (([v9 allSizes] & 1) == 0 && (objc_msgSend(v9, "hasAtLeastOneLowQuality") & 1) == 0)
            {
              uint64_t v66 = v7;
              objc_msgSend(v5, "appendFormat:", @" AND (");
              uint64_t v12 = [v9 sizeAndIconModeCount];
              if (v12 >= 1)
              {
                uint64_t v13 = v12;
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (j) {
                    [v5 appendString:@" OR "];
                  }
                  [v9 minimumSizeAtIndex:j];
                  float v16 = v15;
                  if (v15 > 0.0) {
                    objc_msgSend(v5, "appendFormat:", @"(");
                  }
                  [v9 sizeAtIndex:j];
                  float v18 = v17;
                  [v5 appendFormat:@"(size=? AND icon_mode=? AND badge_type=? AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?)"];
                  v85[0] = MEMORY[0x1E4F143A8];
                  v85[1] = 3221225472;
                  v85[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_2;
                  v85[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                  float v86 = v18;
                  v19 = _Block_copy(v85);
                  [v4 addObject:v19];

                  v84[0] = MEMORY[0x1E4F143A8];
                  v84[1] = 3221225472;
                  v84[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_3;
                  v84[3] = &unk_1E6D0CB78;
                  v84[4] = v9;
                  v84[5] = j;
                  v20 = _Block_copy(v84);
                  [v4 addObject:v20];

                  v83[0] = MEMORY[0x1E4F143A8];
                  v83[1] = 3221225472;
                  v83[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_4;
                  v83[3] = &unk_1E6D0CB78;
                  v83[4] = v9;
                  v83[5] = j;
                  v21 = _Block_copy(v83);
                  [v4 addObject:v21];

                  v82[0] = MEMORY[0x1E4F143A8];
                  v82[1] = 3221225472;
                  v82[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_5;
                  v82[3] = &unk_1E6D0CB78;
                  v82[4] = v9;
                  v82[5] = j;
                  v22 = _Block_copy(v82);
                  [v4 addObject:v22];

                  v81[0] = MEMORY[0x1E4F143A8];
                  v81[1] = 3221225472;
                  v81[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_6;
                  v81[3] = &unk_1E6D0CB78;
                  v81[4] = v9;
                  v81[5] = j;
                  v23 = _Block_copy(v81);
                  [v4 addObject:v23];

                  v80[0] = MEMORY[0x1E4F143A8];
                  v80[1] = 3221225472;
                  v80[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_7;
                  v80[3] = &unk_1E6D0CB78;
                  v80[4] = v9;
                  v80[5] = j;
                  v24 = _Block_copy(v80);
                  [v4 addObject:v24];

                  float v25 = fmaxf(v18 + v18, 1024.0);
                  [v5 appendFormat:@" AND (width<=? OR height<=?)"];
                  v78[0] = MEMORY[0x1E4F143A8];
                  v78[1] = 3221225472;
                  v78[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_8;
                  v78[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                  float v79 = v25;
                  v26 = _Block_copy(v78);
                  [v4 addObject:v26];

                  v76[0] = MEMORY[0x1E4F143A8];
                  v76[1] = 3221225472;
                  v76[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_9;
                  v76[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                  float v77 = v25;
                  v27 = _Block_copy(v76);
                  [v4 addObject:v27];

                  if (v16 > 0.0)
                  {
                    [v5 appendFormat:@" AND width>=? AND height>=?"]);
                    v74[0] = MEMORY[0x1E4F143A8];
                    v74[1] = 3221225472;
                    v74[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_10;
                    v74[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                    float v75 = v16;
                    v28 = _Block_copy(v74);
                    [v4 addObject:v28];

                    v72[0] = MEMORY[0x1E4F143A8];
                    v72[1] = 3221225472;
                    v72[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_11;
                    v72[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                    float v73 = v16;
                    v29 = _Block_copy(v72);
                    [v4 addObject:v29];
                  }
                }
              }
              [v5 appendString:@""]);
              v6 = v65;
              uint64_t v7 = v66;
            }
            ++v7;
            [v5 appendString:@""]);
          }
        }
        uint64_t v68 = [(NSArray *)v6 countByEnumeratingWithState:&v88 objects:v92 count:16];
      }
      while (v68);

      p_stmt = v64;
      if (v69) {
        [v5 appendString:@" ORDER BY file_id, icon_mode ASC, size ASC"];
      }
      v2 = v63;
      if (v7 >= 1) {
        v63->super._stmt = -[QLSqliteDatabase prepareStatement:](v63->super._sqliteDatabase, "prepareStatement:", [v5 UTF8String]);
      }
    }
    else
    {
    }
    if (!*p_stmt) {
      goto LABEL_46;
    }
  }
  fileIdentifier = v2->_fileIdentifier;
  if (fileIdentifier)
  {
    v2->_fileIdentifier = 0;
  }
  if ([v4 count])
  {
    unint64_t v31 = 0;
    do
    {
      unint64_t v32 = v31 + 1;
      objc_msgSend(v4, "objectAtIndexedSubscript:");
      v33 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, unint64_t, sqlite3_stmt *, QLSqliteDatabase *))v33)[2](v33, v32, v2->super._stmt, v2->super._sqliteDatabase);

      unint64_t v34 = [v4 count];
      unint64_t v31 = v32;
    }
    while (v32 < v34);
  }
  char v71 = 0;
  if ([(QLSqliteDatabase *)v2->super._sqliteDatabase stepStatement:v2->super._stmt didReturnData:&v71])
  {
    BOOL v35 = v71 == 0;
  }
  else
  {
    BOOL v35 = 1;
  }
  if (v35)
  {
LABEL_45:
    [(QLSqliteDatabase *)v2->super._sqliteDatabase finalizeStatement:v64];
LABEL_46:
    BOOL v36 = 0;
    goto LABEL_63;
  }
  while (1)
  {
    uint64_t v37 = [(QLSqliteDatabase *)v2->super._sqliteDatabase unsignedLongLongFromColumn:0 inStatement:v2->super._stmt];
    uint64_t v38 = [(NSDictionary *)v2->_fileRequests count];
    if (v38) {
      break;
    }
LABEL_51:
    if ([(QLSqliteDatabase *)v2->super._sqliteDatabase stepStatement:v2->super._stmt didReturnData:&v71])
    {
      BOOL v44 = v71 == 0;
    }
    else
    {
      BOOL v44 = 1;
    }
    if (v44) {
      goto LABEL_45;
    }
  }
  uint64_t v39 = v38;
  uint64_t v40 = 0;
  while (1)
  {
    v41 = v2;
    v42 = [(NSArray *)v2->_allFileRequests objectAtIndexedSubscript:v40];
    uint64_t v43 = [v42 cacheId];

    if (v37 == v43) {
      break;
    }
    ++v40;
    v2 = v41;
    if (v39 == v40) {
      goto LABEL_51;
    }
  }
  v45 = [(NSArray *)v41->_allFileRequests objectAtIndexedSubscript:v40];
  uint64_t v46 = [v45 fileIdentifier];
  v47 = v41->_fileIdentifier;
  v41->_fileIdentifier = (QLCacheFileIdentifier *)v46;

  v41->_cacheId = [(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:0 inStatement:v41->super._stmt];
  [(QLSqliteDatabase *)v41->super._sqliteDatabase floatFromColumn:1 inStatement:v41->super._stmt];
  v41->_size = v48;
  v41->_iconMode = [(QLSqliteDatabase *)v41->super._sqliteDatabase intFromColumn:2 inStatement:v41->super._stmt];
  id v49 = [(QLSqliteDatabase *)v41->super._sqliteDatabase newDataFromColumn:3 inStatement:v41->super._stmt copyBytes:0];
  id v70 = 0;
  uint64_t v50 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v49 error:&v70];
  id v51 = v70;
  bitmapFormat = v41->_bitmapFormat;
  v41->_bitmapFormat = (QLTBitmapFormat *)v50;

  if (!v41->_bitmapFormat)
  {
    uint64_t v53 = MEMORY[0x1E4F3A768];
    v54 = *(NSObject **)(MEMORY[0x1E4F3A768] + 56);
    if (!v54)
    {
      QLTInitLogging();
      v54 = *(NSObject **)(v53 + 56);
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      [(QLCacheIndexDatabaseQueryEnumerator *)(uint64_t)v49 nextThumbnailInfo];
    }
  }
  v55 = objc_alloc_init(QLCacheBlobInfo);
  bitmapDataBlobInfo = v41->_bitmapDataBlobInfo;
  v41->_bitmapDataBlobInfo = v55;

  [(QLCacheBlobInfo *)v41->_bitmapDataBlobInfo setLocation:[(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:4 inStatement:v41->super._stmt]];
  [(QLCacheBlobInfo *)v41->_bitmapDataBlobInfo setLength:[(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:5 inStatement:v41->super._stmt]];
  v57 = objc_alloc_init(QLCacheBlobInfo);
  plistBufferBlobInfo = v41->_plistBufferBlobInfo;
  v41->_plistBufferBlobInfo = v57;

  [(QLCacheBlobInfo *)v41->_plistBufferBlobInfo setLocation:[(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:6 inStatement:v41->super._stmt]];
  [(QLCacheBlobInfo *)v41->_plistBufferBlobInfo setLength:[(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:7 inStatement:v41->super._stmt]];
  v41->_hitCount = [(QLSqliteDatabase *)v41->super._sqliteDatabase intFromColumn:10 inStatement:v41->super._stmt];
  v59 = (void *)MEMORY[0x1E4F1C9C8];
  [(QLSqliteDatabase *)v41->super._sqliteDatabase doubleFromColumn:11 inStatement:v41->super._stmt];
  uint64_t v60 = objc_msgSend(v59, "dateWithTimeIntervalSinceReferenceDate:");
  lastHitDate = v41->_lastHitDate;
  v41->_lastHitDate = (NSDate *)v60;

  v41->_badgeType = [(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:12 inStatement:v41->super._stmt];
  v41->_iconVariant = [(QLSqliteDatabase *)v41->super._sqliteDatabase intFromColumn:13 inStatement:v41->super._stmt];
  v41->_interpolationQuality = [(QLSqliteDatabase *)v41->super._sqliteDatabase intFromColumn:14 inStatement:v41->super._stmt];
  v41->_externalGeneratorDataHash = [(QLSqliteDatabase *)v41->super._sqliteDatabase unsignedLongLongFromColumn:15 inStatement:v41->super._stmt];

  BOOL v36 = 1;
LABEL_63:

  return v36;
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 bindUnsignedLongLong:vcvtms_u32_f32(*(float *)(a1 + 32)) atIndex:a2 inStatement:a3];
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 bindUnsignedLongLong:vcvtms_u32_f32(*(float *)(a1 + 32)) atIndex:a2 inStatement:a3];
}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "externalGeneratorDataHashAtIndex:", v7), a2, a3);
}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", (int)objc_msgSend(v6, "interpolationQualityAtIndex:", v7), a2, a3);
}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "iconVariantAtIndex:", v7), a2, a3);
}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "badgeTypeAtIndex:", v7), a2, a3);
}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "iconModeAtIndex:", v7), a2, a3);
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 bindUnsignedLongLong:(unint64_t)*(float *)(a1 + 32) atIndex:a2 inStatement:a3];
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 bindUnsignedLongLong:vcvtps_u32_f32(*(float *)(a1 + 32)) atIndex:a2 inStatement:a3];
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 bindUnsignedLongLong:vcvtps_u32_f32(*(float *)(a1 + 32)) atIndex:a2 inStatement:a3];
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 bindUnsignedLongLong:*(void *)(a1 + 32) atIndex:a2 inStatement:a3];
}

- (float)size
{
  return self->_size;
}

- (QLCacheBlobInfo)metadataBlobInfo
{
  return self->_plistBufferBlobInfo;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (unsigned)iconMode
{
  return self->_iconMode;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (QLTBitmapFormat)bitmapFormat
{
  return self->_bitmapFormat;
}

- (QLCacheBlobInfo)bitmapDataBlobInfo
{
  return self->_bitmapDataBlobInfo;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (QLCacheIndexDatabaseQueryEnumerator)initWithSqliteDatabase:(id)a3 fileRequests:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLCacheIndexDatabaseQueryEnumerator;
  id v8 = [(QLCacheIndexDatabaseGenericEnumerator *)&v11 initWithSqliteDatabase:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileRequests, a4);
    [(QLCacheIndexDatabaseQueryEnumerator *)v9 _getCacheIds];
  }

  return v9;
}

- (void)_getCacheIds
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(NSDictionary *)self->_fileRequests allValues];
  allFileRequests = self->_allFileRequests;
  self->_allFileRequests = v3;

  v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = self->_allFileRequests;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 fileIdentifier];
        id v13 = [v5 objectForKey:objc_opt_class()];

        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v14 = [v11 fileIdentifier];
          [v5 setObject:v13 forKey:objc_opt_class()];
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  float v15 = objc_msgSend(v5, "objectEnumerator", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [(QLCacheIndexDatabaseQueryEnumerator *)self _getCacheIdsForHomogeneousArrayOfRequests:*(void *)(*((void *)&v20 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)_getCacheIdsForHomogeneousArrayOfRequests:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_super v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (v8)
        {
          [v8 appendString:@" OR "];
        }
        else
        {
          uint64_t v12 = [*(id *)(*((void *)&v49 + 1) + 8 * i) fileIdentifier];
          uint64_t v7 = objc_opt_class();

          id v13 = [v7 queryStringToFindCacheIds];
          uint64_t v8 = (void *)[v13 mutableCopy];
        }
        v14 = [v11 fileIdentifier];
        float v15 = [(id)objc_opt_class() whereClauseToFindCacheId];
        [v8 appendString:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v48 = 0;
  sqliteDatabase = self->super._sqliteDatabase;
  id v17 = v8;
  uint64_t v18 = -[QLSqliteDatabase prepareStatement:](sqliteDatabase, "prepareStatement:", [v17 UTF8String]);
  uint64_t v48 = v18;
  if (v18)
  {
    uint64_t v19 = v18;
    id v38 = v17;
    unsigned int v47 = 1;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v20 = v4;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * j), "fileIdentifier", v38);
          [v25 bindInFindCacheIdStatement:v19 database:self->super._sqliteDatabase startingAtIndex:v47 gettingNextIndex:&v47];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v22);
    }

    char v42 = 0;
    if ([(QLSqliteDatabase *)self->super._sqliteDatabase stepStatement:v19 didReturnData:&v42]&& v42)
    {
      unint64_t v26 = 0x1EAB91000uLL;
      do
      {
        uint64_t v27 = objc_msgSend(v7, "cacheIdFromRowId:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 0, v19, v38));
        id v28 = objc_alloc((Class)[v7 versionedFileIdentifierClass]);
        uint64_t v19 = v48;
        v29 = (void *)[v28 initWithSteppedStatement:v48 database:self->super._sqliteDatabase];
        uint64_t v30 = [v29 fileIdentifier];
        if (v30)
        {
          unint64_t v31 = [*(id *)((char *)&self->super.super.isa + *(int *)(v26 + 1676)) objectForKeyedSubscript:v30];
          unint64_t v32 = v31;
          if (v31)
          {
            v33 = [v31 version];

            if (!v33) {
              goto LABEL_29;
            }
            uint64_t v34 = [v29 version];
            if (v34)
            {
              BOOL v35 = (void *)v34;
              BOOL v36 = [v29 version];
              [v32 version];
              uint64_t v37 = v41 = v27;
              int v40 = [v36 isEqual:v37];

              uint64_t v27 = v41;
              unint64_t v26 = 0x1EAB91000;

              if (v40) {
LABEL_29:
              }
                [v32 _setCacheId:v27];
            }
          }
        }
        else
        {
          unint64_t v32 = 0;
        }
      }
      while ([(QLSqliteDatabase *)self->super._sqliteDatabase stepStatement:v19 didReturnData:&v42]&& v42);
    }
    -[QLSqliteDatabase finalizeStatement:](self->super._sqliteDatabase, "finalizeStatement:", &v48, v38);
    id v17 = v39;
  }
}

- (void)dealloc
{
  p_stmt = &self->super._stmt;
  if (self->super._stmt) {
    [(QLSqliteDatabase *)self->super._sqliteDatabase finalizeStatement:p_stmt];
  }
  v4.receiver = self;
  v4.super_class = (Class)QLCacheIndexDatabaseQueryEnumerator;
  [(QLCacheIndexDatabaseGenericEnumerator *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_plistBufferBlobInfo, 0);
  objc_storeStrong((id *)&self->_bitmapDataBlobInfo, 0);
  objc_storeStrong((id *)&self->_lastHitDate, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_allFileRequests, 0);
  objc_storeStrong((id *)&self->_fileRequests, 0);
}

- (unsigned)hitCount
{
  return self->_hitCount;
}

- (NSDate)lastHitDate
{
  return self->_lastHitDate;
}

- (int)flavor
{
  return self->_flavor;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)nextThumbnailInfo
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "cannot create the bitmap format based on data %@ : %@", (uint8_t *)&v3, 0x16u);
}

@end