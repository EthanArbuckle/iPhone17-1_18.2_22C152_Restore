@interface NTKProtoPigmentCollection
+ (Class)collectionsType;
+ (Class)defaultGalleryColorsType;
+ (Class)itemsType;
- (BOOL)hasConfig;
- (BOOL)hasDefaultOption;
- (BOOL)hasIsShared;
- (BOOL)hasIsStub;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShared;
- (BOOL)isStub;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)collections;
- (NSMutableArray)defaultGalleryColors;
- (NSMutableArray)items;
- (NSString)name;
- (NTKProtoPigment)defaultOption;
- (NTKProtoPigmentCollectionConfig)config;
- (id)collectionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultGalleryColorsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(unint64_t)a3;
- (unint64_t)collectionsCount;
- (unint64_t)defaultGalleryColorsCount;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (void)addCollections:(id)a3;
- (void)addDefaultGalleryColors:(id)a3;
- (void)addItems:(id)a3;
- (void)clearCollections;
- (void)clearDefaultGalleryColors;
- (void)clearItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollections:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDefaultGalleryColors:(id)a3;
- (void)setDefaultOption:(id)a3;
- (void)setHasIsShared:(BOOL)a3;
- (void)setHasIsStub:(BOOL)a3;
- (void)setIsShared:(BOOL)a3;
- (void)setIsStub:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoPigmentCollection

- (BOOL)hasConfig
{
  return self->_config != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasDefaultOption
{
  return self->_defaultOption != 0;
}

- (void)clearItems
{
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  items = self->_items;
  id v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_items;
    self->_items = v6;

    id v4 = v8;
    items = self->_items;
  }
  [(NSMutableArray *)items addObject:v4];
}

- (unint64_t)itemsCount
{
  return [(NSMutableArray *)self->_items count];
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

- (void)clearDefaultGalleryColors
{
}

- (void)addDefaultGalleryColors:(id)a3
{
  id v4 = a3;
  defaultGalleryColors = self->_defaultGalleryColors;
  id v8 = v4;
  if (!defaultGalleryColors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_defaultGalleryColors;
    self->_defaultGalleryColors = v6;

    id v4 = v8;
    defaultGalleryColors = self->_defaultGalleryColors;
  }
  [(NSMutableArray *)defaultGalleryColors addObject:v4];
}

- (unint64_t)defaultGalleryColorsCount
{
  return [(NSMutableArray *)self->_defaultGalleryColors count];
}

- (id)defaultGalleryColorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_defaultGalleryColors objectAtIndex:a3];
}

+ (Class)defaultGalleryColorsType
{
  return (Class)objc_opt_class();
}

- (void)clearCollections
{
}

- (void)addCollections:(id)a3
{
  id v4 = a3;
  collections = self->_collections;
  id v8 = v4;
  if (!collections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_collections;
    self->_collections = v6;

    id v4 = v8;
    collections = self->_collections;
  }
  [(NSMutableArray *)collections addObject:v4];
}

- (unint64_t)collectionsCount
{
  return [(NSMutableArray *)self->_collections count];
}

- (id)collectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_collections objectAtIndex:a3];
}

+ (Class)collectionsType
{
  return (Class)objc_opt_class();
}

- (void)setIsShared:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isShared = a3;
}

- (void)setHasIsShared:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsShared
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsStub:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isStub = a3;
}

- (void)setHasIsStub:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStub
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoPigmentCollection;
  id v4 = [(NTKProtoPigmentCollection *)&v8 description];
  v5 = [(NTKProtoPigmentCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  config = self->_config;
  if (config)
  {
    v5 = [(NTKProtoPigmentCollectionConfig *)config dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"config"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  defaultOption = self->_defaultOption;
  if (defaultOption)
  {
    objc_super v8 = [(NTKProtoPigment *)defaultOption dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"defaultOption"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v10 = self->_items;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"items"];
  }
  if ([(NSMutableArray *)self->_defaultGalleryColors count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_defaultGalleryColors, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v17 = self->_defaultGalleryColors;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v38 + 1) + 8 * j) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"defaultGalleryColors"];
  }
  if ([(NSMutableArray *)self->_collections count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_collections, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v24 = self->_collections;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "dictionaryRepresentation", (void)v34);
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKey:@"collections"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v31 = [NSNumber numberWithBool:self->_isShared];
    [v3 setObject:v31 forKey:@"isShared"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_isStub];
    [v3 setObject:v32 forKey:@"isStub"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoPigmentCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_config) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_defaultOption) {
    PBDataWriterWriteSubmessage();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = self->_items;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = self->_defaultGalleryColors;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = self->_collections;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v17 = a3;
  if (self->_config) {
    objc_msgSend(v17, "setConfig:");
  }
  if (self->_name) {
    objc_msgSend(v17, "setName:");
  }
  if (self->_defaultOption) {
    objc_msgSend(v17, "setDefaultOption:");
  }
  if ([(NTKProtoPigmentCollection *)self itemsCount])
  {
    [v17 clearItems];
    unint64_t v4 = [(NTKProtoPigmentCollection *)self itemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NTKProtoPigmentCollection *)self itemsAtIndex:i];
        [v17 addItems:v7];
      }
    }
  }
  if ([(NTKProtoPigmentCollection *)self defaultGalleryColorsCount])
  {
    [v17 clearDefaultGalleryColors];
    unint64_t v8 = [(NTKProtoPigmentCollection *)self defaultGalleryColorsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NTKProtoPigmentCollection *)self defaultGalleryColorsAtIndex:j];
        [v17 addDefaultGalleryColors:v11];
      }
    }
  }
  if ([(NTKProtoPigmentCollection *)self collectionsCount])
  {
    [v17 clearCollections];
    unint64_t v12 = [(NTKProtoPigmentCollection *)self collectionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NTKProtoPigmentCollection *)self collectionsAtIndex:k];
        [v17 addCollections:v15];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v17[56] = self->_isShared;
    v17[60] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v17[57] = self->_isStub;
    v17[60] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTKProtoPigmentCollectionConfig *)self->_config copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(NTKProtoPigment *)self->_defaultOption copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v12 = self->_items;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addItems:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v14);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v18 = self->_defaultGalleryColors;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDefaultGalleryColors:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v20);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v24 = self->_collections;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (void)v32);
        [(id)v5 addCollections:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v26);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(unsigned char *)(v5 + 56) = self->_isShared;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 57) = self->_isStub;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  config = self->_config;
  if ((unint64_t)config | *((void *)v4 + 2))
  {
    if (!-[NTKProtoPigmentCollectionConfig isEqual:](config, "isEqual:")) {
      goto LABEL_24;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_24;
    }
  }
  defaultOption = self->_defaultOption;
  if ((unint64_t)defaultOption | *((void *)v4 + 4))
  {
    if (!-[NTKProtoPigment isEqual:](defaultOption, "isEqual:")) {
      goto LABEL_24;
    }
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:")) {
      goto LABEL_24;
    }
  }
  defaultGalleryColors = self->_defaultGalleryColors;
  if ((unint64_t)defaultGalleryColors | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](defaultGalleryColors, "isEqual:")) {
      goto LABEL_24;
    }
  }
  collections = self->_collections;
  if ((unint64_t)collections | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](collections, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0) {
      goto LABEL_24;
    }
    if (self->_isShared)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_24;
  }
  BOOL v11 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      if (self->_isStub)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 57))
      {
        goto LABEL_24;
      }
      BOOL v11 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v11 = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTKProtoPigmentCollectionConfig *)self->_config hash];
  NSUInteger v4 = [(NSString *)self->_name hash];
  unint64_t v5 = [(NTKProtoPigment *)self->_defaultOption hash];
  uint64_t v6 = [(NSMutableArray *)self->_items hash];
  uint64_t v7 = [(NSMutableArray *)self->_defaultGalleryColors hash];
  uint64_t v8 = [(NSMutableArray *)self->_collections hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = 2654435761 * self->_isShared;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_isStub;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  config = self->_config;
  uint64_t v6 = *((void *)v4 + 2);
  if (config)
  {
    if (v6) {
      -[NTKProtoPigmentCollectionConfig mergeFrom:](config, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTKProtoPigmentCollection setConfig:](self, "setConfig:");
  }
  if (*((void *)v4 + 6)) {
    -[NTKProtoPigmentCollection setName:](self, "setName:");
  }
  defaultOption = self->_defaultOption;
  uint64_t v8 = *((void *)v4 + 4);
  if (defaultOption)
  {
    if (v8) {
      -[NTKProtoPigment mergeFrom:](defaultOption, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTKProtoPigmentCollection setDefaultOption:](self, "setDefaultOption:");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = *((id *)v4 + 5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NTKProtoPigmentCollection *)self addItems:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = *((id *)v4 + 3);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NTKProtoPigmentCollection *)self addDefaultGalleryColors:*(void *)(*((void *)&v29 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v16);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = *((id *)v4 + 1);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        -[NTKProtoPigmentCollection addCollections:](self, "addCollections:", *(void *)(*((void *)&v25 + 1) + 8 * k), (void)v25);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }

  char v24 = *((unsigned char *)v4 + 60);
  if (v24)
  {
    self->_isShared = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 1u;
    char v24 = *((unsigned char *)v4 + 60);
  }
  if ((v24 & 2) != 0)
  {
    self->_isStub = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NTKProtoPigmentCollectionConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NTKProtoPigment)defaultOption
{
  return self->_defaultOption;
}

- (void)setDefaultOption:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)defaultGalleryColors
{
  return self->_defaultGalleryColors;
}

- (void)setDefaultGalleryColors:(id)a3
{
}

- (NSMutableArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (BOOL)isStub
{
  return self->_isStub;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_defaultOption, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColors, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

@end