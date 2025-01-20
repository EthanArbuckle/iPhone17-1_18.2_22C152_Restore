@interface NTPBPersonalizationWhitelist
+ (Class)defaultTagsType;
+ (Class)disabledPortraitTagsType;
+ (Class)optionalTagsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)defaultTags;
- (NSMutableArray)disabledPortraitTags;
- (NSMutableArray)optionalTags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultTagsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disabledPortraitTagsAtIndex:(unint64_t)a3;
- (id)optionalTagsAtIndex:(unint64_t)a3;
- (unint64_t)defaultTagsCount;
- (unint64_t)disabledPortraitTagsCount;
- (unint64_t)hash;
- (unint64_t)optionalTagsCount;
- (void)addDefaultTags:(id)a3;
- (void)addDisabledPortraitTags:(id)a3;
- (void)addOptionalTags:(id)a3;
- (void)clearDefaultTags;
- (void)clearDisabledPortraitTags;
- (void)clearOptionalTags;
- (void)mergeFrom:(id)a3;
- (void)setDefaultTags:(id)a3;
- (void)setDisabledPortraitTags:(id)a3;
- (void)setOptionalTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationWhitelist

- (void)addOptionalTags:(id)a3
{
  id v4 = a3;
  optionalTags = self->_optionalTags;
  id v8 = v4;
  if (!optionalTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_optionalTags;
    self->_optionalTags = v6;

    id v4 = v8;
    optionalTags = self->_optionalTags;
  }
  [(NSMutableArray *)optionalTags addObject:v4];
}

- (void)addDefaultTags:(id)a3
{
  id v4 = a3;
  defaultTags = self->_defaultTags;
  id v8 = v4;
  if (!defaultTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_defaultTags;
    self->_defaultTags = v6;

    id v4 = v8;
    defaultTags = self->_defaultTags;
  }
  [(NSMutableArray *)defaultTags addObject:v4];
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationWhitelistReadFrom(self, (uint64_t)a3);
}

- (NSMutableArray)optionalTags
{
  return self->_optionalTags;
}

- (NSMutableArray)disabledPortraitTags
{
  return self->_disabledPortraitTags;
}

- (NSMutableArray)defaultTags
{
  return self->_defaultTags;
}

- (void)clearDefaultTags
{
}

- (unint64_t)defaultTagsCount
{
  return [(NSMutableArray *)self->_defaultTags count];
}

- (id)defaultTagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_defaultTags objectAtIndex:a3];
}

+ (Class)defaultTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearOptionalTags
{
}

- (unint64_t)optionalTagsCount
{
  return [(NSMutableArray *)self->_optionalTags count];
}

- (id)optionalTagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_optionalTags objectAtIndex:a3];
}

+ (Class)optionalTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearDisabledPortraitTags
{
}

- (void)addDisabledPortraitTags:(id)a3
{
  id v4 = a3;
  disabledPortraitTags = self->_disabledPortraitTags;
  id v8 = v4;
  if (!disabledPortraitTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_disabledPortraitTags;
    self->_disabledPortraitTags = v6;

    id v4 = v8;
    disabledPortraitTags = self->_disabledPortraitTags;
  }
  [(NSMutableArray *)disabledPortraitTags addObject:v4];
}

- (unint64_t)disabledPortraitTagsCount
{
  return [(NSMutableArray *)self->_disabledPortraitTags count];
}

- (id)disabledPortraitTagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_disabledPortraitTags objectAtIndex:a3];
}

+ (Class)disabledPortraitTagsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPersonalizationWhitelist;
  id v4 = [(NTPBPersonalizationWhitelist *)&v8 description];
  v5 = [(NTPBPersonalizationWhitelist *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_defaultTags count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_defaultTags, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = self->_defaultTags;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"defaultTags"];
  }
  if ([(NSMutableArray *)self->_optionalTags count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_optionalTags, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = self->_optionalTags;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "dictionaryRepresentation", (void)v20);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"optionalTags"];
  }
  disabledPortraitTags = self->_disabledPortraitTags;
  if (disabledPortraitTags) {
    [v3 setObject:disabledPortraitTags forKey:@"disabledPortraitTags"];
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_defaultTags;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_optionalTags;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_disabledPortraitTags;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_defaultTags;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addDefaultTags:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = self->_optionalTags;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addOptionalTags:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_disabledPortraitTags;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addDisabledPortraitTags:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((defaultTags = self->_defaultTags, !((unint64_t)defaultTags | v4[1]))
     || -[NSMutableArray isEqual:](defaultTags, "isEqual:"))
    && ((optionalTags = self->_optionalTags, !((unint64_t)optionalTags | v4[3]))
     || -[NSMutableArray isEqual:](optionalTags, "isEqual:")))
  {
    disabledPortraitTags = self->_disabledPortraitTags;
    if ((unint64_t)disabledPortraitTags | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](disabledPortraitTags, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_defaultTags hash];
  uint64_t v4 = [(NSMutableArray *)self->_optionalTags hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_disabledPortraitTags hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBPersonalizationWhitelist *)self addDefaultTags:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBPersonalizationWhitelist *)self addOptionalTags:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[2];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NTPBPersonalizationWhitelist addDisabledPortraitTags:](self, "addDisabledPortraitTags:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)setDefaultTags:(id)a3
{
}

- (void)setOptionalTags:(id)a3
{
}

- (void)setDisabledPortraitTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalTags, 0);
  objc_storeStrong((id *)&self->_disabledPortraitTags, 0);

  objc_storeStrong((id *)&self->_defaultTags, 0);
}

@end