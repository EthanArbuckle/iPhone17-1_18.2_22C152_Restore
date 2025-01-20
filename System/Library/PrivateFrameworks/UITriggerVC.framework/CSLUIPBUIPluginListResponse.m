@interface CSLUIPBUIPluginListResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)names;
- (NSMutableArray)usages;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nameAtIndex:(unint64_t)a3;
- (id)usageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)namesCount;
- (unint64_t)usagesCount;
- (void)addName:(id)a3;
- (void)addUsage:(id)a3;
- (void)clearNames;
- (void)clearUsages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNames:(id)a3;
- (void)setUsages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSLUIPBUIPluginListResponse

- (void)clearNames
{
}

- (void)addName:(id)a3
{
  id v4 = a3;
  names = self->_names;
  id v8 = v4;
  if (!names)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_names;
    self->_names = v6;

    id v4 = v8;
    names = self->_names;
  }
  [(NSMutableArray *)names addObject:v4];
}

- (unint64_t)namesCount
{
  return [(NSMutableArray *)self->_names count];
}

- (id)nameAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_names objectAtIndex:a3];
}

- (void)clearUsages
{
}

- (void)addUsage:(id)a3
{
  id v4 = a3;
  usages = self->_usages;
  id v8 = v4;
  if (!usages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_usages;
    self->_usages = v6;

    id v4 = v8;
    usages = self->_usages;
  }
  [(NSMutableArray *)usages addObject:v4];
}

- (unint64_t)usagesCount
{
  return [(NSMutableArray *)self->_usages count];
}

- (id)usageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_usages objectAtIndex:a3];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CSLUIPBUIPluginListResponse;
  id v4 = [(CSLUIPBUIPluginListResponse *)&v8 description];
  v5 = [(CSLUIPBUIPluginListResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  names = self->_names;
  if (names) {
    [v3 setObject:names forKey:@"name"];
  }
  usages = self->_usages;
  if (usages) {
    [v4 setObject:usages forKey:@"usage"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CSLUIPBUIPluginListResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_names;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_usages;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(CSLUIPBUIPluginListResponse *)self namesCount])
  {
    [v12 clearNames];
    unint64_t v4 = [(CSLUIPBUIPluginListResponse *)self namesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CSLUIPBUIPluginListResponse *)self nameAtIndex:i];
        [v12 addName:v7];
      }
    }
  }
  if ([(CSLUIPBUIPluginListResponse *)self usagesCount])
  {
    [v12 clearUsages];
    unint64_t v8 = [(CSLUIPBUIPluginListResponse *)self usagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(CSLUIPBUIPluginListResponse *)self usageAtIndex:j];
        [v12 addUsage:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_names;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addName:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_usages;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addUsage:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((names = self->_names, !((unint64_t)names | v4[1]))
     || -[NSMutableArray isEqual:](names, "isEqual:")))
  {
    usages = self->_usages;
    if ((unint64_t)usages | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](usages, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_names hash];
  return [(NSMutableArray *)self->_usages hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CSLUIPBUIPluginListResponse *)self addName:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CSLUIPBUIPluginListResponse addUsage:](self, "addUsage:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
}

- (NSMutableArray)usages
{
  return self->_usages;
}

- (void)setUsages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usages, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

@end