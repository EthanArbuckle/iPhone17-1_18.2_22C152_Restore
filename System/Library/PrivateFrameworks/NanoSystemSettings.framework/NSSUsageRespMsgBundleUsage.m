@interface NSSUsageRespMsgBundleUsage
+ (Class)categoriesType;
- (BOOL)hasPurgeable;
- (BOOL)isEqual:(id)a3;
- (BOOL)purgeable;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)categories;
- (NSString)bundleIdentifier;
- (NSString)name;
- (id)categoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)categoriesCount;
- (unint64_t)hash;
- (void)addCategories:(id)a3;
- (void)clearCategories;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategories:(id)a3;
- (void)setHasPurgeable:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPurgeable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageRespMsgBundleUsage

- (void)clearCategories
{
}

- (void)addCategories:(id)a3
{
  id v4 = a3;
  categories = self->_categories;
  id v8 = v4;
  if (!categories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_categories;
    self->_categories = v6;

    id v4 = v8;
    categories = self->_categories;
  }
  [(NSMutableArray *)categories addObject:v4];
}

- (unint64_t)categoriesCount
{
  return [(NSMutableArray *)self->_categories count];
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categories objectAtIndex:a3];
}

+ (Class)categoriesType
{
  return (Class)objc_opt_class();
}

- (void)setPurgeable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_purgeable = a3;
}

- (void)setHasPurgeable:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPurgeable
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgBundleUsage;
  id v4 = [(NSSUsageRespMsgBundleUsage *)&v8 description];
  v5 = [(NSSUsageRespMsgBundleUsage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  if ([(NSMutableArray *)self->_categories count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_categories, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v8 = self->_categories;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"categories"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = [NSNumber numberWithBool:self->_purgeable];
    [v4 setObject:v14 forKey:@"purgeable"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgBundleUsageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_categories;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [v8 setName:self->_name];
  [v8 setBundleIdentifier:self->_bundleIdentifier];
  if ([(NSSUsageRespMsgBundleUsage *)self categoriesCount])
  {
    [v8 clearCategories];
    unint64_t v4 = [(NSSUsageRespMsgBundleUsage *)self categoriesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSSUsageRespMsgBundleUsage *)self categoriesAtIndex:i];
        [v8 addCategories:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[32] = self->_purgeable;
    v8[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_categories;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addCategories:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_purgeable;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_10;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  categories = self->_categories;
  if ((unint64_t)categories | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](categories, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_purgeable)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  uint64_t v5 = [(NSMutableArray *)self->_categories hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_purgeable;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[NSSUsageRespMsgBundleUsage setName:](self, "setName:");
  }
  if (*((void *)v4 + 1)) {
    -[NSSUsageRespMsgBundleUsage setBundleIdentifier:](self, "setBundleIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSSUsageRespMsgBundleUsage addCategories:](self, "addCategories:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 36))
  {
    self->_purgeable = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSMutableArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (BOOL)purgeable
{
  return self->_purgeable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end