@interface MFIMAPConnectionFlagSearchResults
- (MFIMAPConnectionFlagSearchResults)init;
- (id)_indexSetFromUIDs:(id)a3;
- (id)copyResponseForUID:(unint64_t)a3;
- (id)description;
- (unint64_t)_flagsForUID:(unint64_t)a3;
- (void)cacheStateForUIDs:(id)a3 mask:(unint64_t)a4 existenceSetsFlag:(BOOL)a5;
@end

@implementation MFIMAPConnectionFlagSearchResults

- (MFIMAPConnectionFlagSearchResults)init
{
  v9.receiver = self;
  v9.super_class = (Class)MFIMAPConnectionFlagSearchResults;
  v2 = [(MFIMAPConnectionFlagSearchResults *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uidsWithFlagMaskSet = v2->_uidsWithFlagMaskSet;
    v2->_uidsWithFlagMaskSet = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uidsWithoutFlagMaskSet = v2->_uidsWithoutFlagMaskSet;
    v2->_uidsWithoutFlagMaskSet = v5;

    v7 = v2;
  }

  return v2;
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v4 = self->_uidsWithFlagMaskSet;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_super v9 = [(NSMutableDictionary *)self->_uidsWithFlagMaskSet objectForKey:v8];
        v10 = MFDescriptionForMessageFlags([v8 unsignedLongLongValue]);
        [v3 appendFormat:@"\n\t%@ set %@", v10, v9];
      }
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = self->_uidsWithoutFlagMaskSet;
  uint64_t v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        v16 = [(NSMutableDictionary *)self->_uidsWithoutFlagMaskSet objectForKey:v15];
        v17 = MFDescriptionForMessageFlags([v15 unsignedLongLongValue]);
        [v3 appendFormat:@"\n\t%@ unset %@", v17, v16, (void)v19];
      }
      uint64_t v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }

  return v3;
}

- (unint64_t)_flagsForUID:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = self->_uidsWithFlagMaskSet;
  unint64_t v6 = 0;
  uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v11 = [(NSMutableDictionary *)self->_uidsWithFlagMaskSet objectForKey:v10];
        uint64_t v12 = [v10 unsignedLongLongValue];
        if ([v11 containsIndex:a3]) {
          v6 |= v12;
        }
        else {
          v6 &= ~v12;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = self->_uidsWithoutFlagMaskSet;
  uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        v18 = -[NSMutableDictionary objectForKey:](self->_uidsWithoutFlagMaskSet, "objectForKey:", v17, (void)v21);
        uint64_t v19 = [v17 unsignedLongLongValue];
        if ([v18 containsIndex:a3]) {
          v6 &= ~v19;
        }
        else {
          v6 |= v19;
        }
      }
      uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  return v6;
}

- (id)_indexSetFromUIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E60] indexSet];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "integerValue", (void)v10));
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)cacheStateForUIDs:(id)a3 mask:(unint64_t)a4 existenceSetsFlag:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4];
  objc_super v9 = [(MFIMAPConnectionFlagSearchResults *)self _indexSetFromUIDs:v15];
  uint64_t v10 = 16;
  if (v5) {
    uint64_t v10 = 8;
  }
  id v11 = *(id *)((char *)&self->super.isa + v10);
  long long v12 = [v11 objectForKeyedSubscript:v8];
  long long v13 = v12;
  if (v12) {
    [v12 addIndexes:v9];
  }
  else {
    [v11 setObject:v9 forKeyedSubscript:v8];
  }
  uint64_t v14 = 8;
  if (v5) {
    uint64_t v14 = 16;
  }
  [*(id *)((char *)&self->super.isa + v14) removeObjectForKey:v8];
}

- (id)copyResponseForUID:(unint64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_alloc_init(MFIMAPResponse);
  [(MFIMAPResponse *)v5 setResponseType:17];
  uint64_t v6 = [[MFIMAPFetchResult alloc] initWithType:8];
  uint64_t v7 = [[MFIMAPFetchResult alloc] initWithType:10];
  [(MFIMAPFetchResult *)v6 setUid:a3];
  [(MFIMAPFetchResult *)v7 setMessageFlags:[(MFIMAPConnectionFlagSearchResults *)self _flagsForUID:a3]];
  v10[0] = v6;
  v10[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [(MFIMAPResponse *)v5 setFetchResults:v8];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uidsWithoutFlagMaskSet, 0);
  objc_storeStrong((id *)&self->_uidsWithFlagMaskSet, 0);
}

@end