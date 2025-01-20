@interface BRCProgressMultiplex
- (BOOL)indeterminate;
- (BOOL)isPublished;
- (BRCProgressMultiplex)initWithUnderlineProgressObjects:(id)a3;
- (NSString)localizedAdditionalDescription;
- (NSString)localizedDescription;
- (id)brc_dumpDescription;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)brc_publish;
- (void)brc_unpublish;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setLocalizedAdditionalDescription:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
@end

@implementation BRCProgressMultiplex

- (BRCProgressMultiplex)initWithUnderlineProgressObjects:(id)a3
{
  return self;
}

- (void)setLocalizedDescription:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_localizedDescription, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v7 = v6->_underlineProgressObjects;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setLocalizedDescription:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

- (void)setLocalizedAdditionalDescription:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_localizedAdditionalDescription, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v7 = v6->_underlineProgressObjects;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setLocalizedAdditionalDescription:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = self;
  objc_sync_enter(v4);
  v4->_completedUnitCount = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4->_underlineProgressObjects;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setCompletedUnitCount:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (void)setTotalUnitCount:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = self;
  objc_sync_enter(v4);
  v4->_totalUnitCount = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4->_underlineProgressObjects;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setTotalUnitCount:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v9 = v8->_underlineProgressObjects;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setUserInfoObject:forKey:", v6, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (BOOL)isPublished
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = v2->_underlineProgressObjects;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if (v6) {
          char v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isPublished", (void)v9);
        }
        else {
          char v6 = 0;
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    char v6 = 1;
  }

  objc_sync_exit(v2);
  return v6;
}

- (BOOL)indeterminate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = v2->_underlineProgressObjects;
  char v4 = 0;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (v4) {
          char v4 = 1;
        }
        else {
          char v4 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isIndeterminate", (void)v9);
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)brc_dumpDescription
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  char v4 = self;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = v4->_underlineProgressObjects;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "brc_dumpDescription", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  long long v10 = [v3 componentsJoinedByString:@","];

  return v10;
}

- (void)brc_publish
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = v2->_underlineProgressObjects;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "brc_publish", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)brc_unpublish
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = v2->_underlineProgressObjects;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "brc_unpublish", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (NSString)localizedAdditionalDescription
{
  return self->_localizedAdditionalDescription;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedAdditionalDescription, 0);
  objc_storeStrong((id *)&self->_underlineProgressObjects, 0);
}

@end