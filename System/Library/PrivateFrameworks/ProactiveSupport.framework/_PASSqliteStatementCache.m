@interface _PASSqliteStatementCache
- (_PASSqliteStatementCache)init;
- (uLong)crc32ForStatement:(sqlite3_stmt *)a1;
- (uint64_t)checkOutStatement:(id *)a3 associatedObject:(const char *)a4 withSQL:;
- (void)evictCachedStatementForScoreSlot:(uint64_t)a1;
@end

@implementation _PASSqliteStatementCache

- (uint64_t)checkOutStatement:(id *)a3 associatedObject:(const char *)a4 withSQL:
{
  uint64_t result = 0;
  if (a1 && a4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a1 + 264;
    while (1)
    {
      uint64_t v11 = *(void *)(v10 + 8 * v9);
      if (v11)
      {
        v12 = sqlite3_sql(*(sqlite3_stmt **)(v10 + 8 * v9));
        if (!strcmp(a4, v12)) {
          break;
        }
      }
      if (++v9 == 8) {
        return 0;
      }
    }
    *(void *)(v10 + 8 * v9) = 0;
    if (a3) {
      objc_storeStrong(a3, *(id *)(a1 + 8 * v9 + 328));
    }
    uint64_t v13 = a1 + 328;
    v14 = *(const void **)(v13 + 8 * v9);
    if (v14)
    {
      CFRelease(v14);
      *(void *)(v13 + 8 * v9) = 0;
    }
    *a2 = v11;
    return 1;
  }
  return result;
}

- (uLong)crc32ForStatement:(sqlite3_stmt *)a1
{
  v1 = sqlite3_sql(a1);
  v2 = (const Bytef *)v1;
  if (v1) {
    z_size_t v3 = strlen(v1);
  }
  else {
    z_size_t v3 = 0;
  }
  return crc32_z(0, v2, v3);
}

- (void)evictCachedStatementForScoreSlot:(uint64_t)a1
{
  if (*(unsigned __int8 *)(a1 + 8 + 8 * a2 + 4) >= 9u)
  {
    uint64_t v3 = 0;
    int v4 = *(_DWORD *)(a1 + 8 + 8 * a2);
    uint64_t v5 = a1 + 264;
    while (1)
    {
      v6 = *(sqlite3_stmt **)(v5 + 8 * v3);
      if (v6)
      {
        if (-[_PASSqliteStatementCache crc32ForStatement:](v6) == v4) {
          break;
        }
      }
      if (++v3 == 8) {
        return;
      }
    }
    if (v3 != -1)
    {
      sqlite3_finalize(*(sqlite3_stmt **)(v5 + 8 * (int)v3));
      *(void *)(v5 + 8 * (int)v3) = 0;
      uint64_t v7 = a1 + 328;
      v8 = *(const void **)(v7 + 8 * (int)v3);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(v7 + 8 * (int)v3) = 0;
      }
    }
  }
}

- (_PASSqliteStatementCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PASSqliteStatementCache;
  uint64_t result = [(_PASSqliteStatementCache *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_scores[0].crc32 = 0u;
    *(_OWORD *)&result->_associatedObjects[4] = 0u;
    *(_OWORD *)&result->_associatedObjects[6] = 0u;
    *(_OWORD *)result->_associatedObjects = 0u;
    *(_OWORD *)&result->_associatedObjects[2] = 0u;
    *(_OWORD *)&result->_cached[4] = 0u;
    *(_OWORD *)&result->_cached[6] = 0u;
    *(_OWORD *)result->_cached = 0u;
    *(_OWORD *)&result->_cached[2] = 0u;
    *(_OWORD *)&result->_scores[28].crc32 = 0u;
    *(_OWORD *)&result->_scores[30].crc32 = 0u;
    *(_OWORD *)&result->_scores[24].crc32 = 0u;
    *(_OWORD *)&result->_scores[26].crc32 = 0u;
    *(_OWORD *)&result->_scores[20].crc32 = 0u;
    *(_OWORD *)&result->_scores[22].crc32 = 0u;
    *(_OWORD *)&result->_scores[16].crc32 = 0u;
    *(_OWORD *)&result->_scores[18].crc32 = 0u;
    *(_OWORD *)&result->_scores[12].crc32 = 0u;
    *(_OWORD *)&result->_scores[14].crc32 = 0u;
    *(_OWORD *)&result->_scores[8].crc32 = 0u;
    *(_OWORD *)&result->_scores[10].crc32 = 0u;
    *(_OWORD *)&result->_scores[4].crc32 = 0u;
    *(_OWORD *)&result->_scores[6].crc32 = 0u;
    *(_OWORD *)&result->_scores[2].crc32 = 0u;
  }
  return result;
}

@end