@interface AMPMusicArtistContent
+ (Class)catalogContentType;
- (BOOL)hasAdamId;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)catalogContents;
- (NSString)name;
- (id)catalogContentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)adamId;
- (unint64_t)catalogContentsCount;
- (unint64_t)hash;
- (void)addCatalogContent:(id)a3;
- (void)clearCatalogContents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setCatalogContents:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicArtistContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_catalogContents, 0);
}

- (void)setCatalogContents:(id)a3
{
}

- (NSMutableArray)catalogContents
{
  return self->_catalogContents;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = (id *)v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_adamId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[AMPMusicArtistContent setName:](self, "setName:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5[2];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[AMPMusicArtistContent addCatalogContent:](self, "addCatalogContent:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_adamId;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_name hash] ^ v3;
  return v4 ^ (unint64_t)[(NSMutableArray *)self->_catalogContents hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_11;
  }
  catalogContents = self->_catalogContents;
  if ((unint64_t)catalogContents | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[NSMutableArray isEqual:](catalogContents, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_adamId;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(NSString *)self->_name copyWithZone:a3];
  id v8 = (void *)v6[3];
  v6[3] = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_catalogContents;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "copyWithZone:", a3, (void)v16);
        [v6 addCatalogContent:v14];

        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_adamId;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v9 = v4;
  if (self->_name) {
    objc_msgSend(v4, "setName:");
  }
  if ([(AMPMusicArtistContent *)self catalogContentsCount])
  {
    [v9 clearCatalogContents];
    unint64_t v5 = [(AMPMusicArtistContent *)self catalogContentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(AMPMusicArtistContent *)self catalogContentAtIndex:i];
        [v9 addCatalogContent:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_catalogContents;
  unint64_t v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BB8AC((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithLongLong:self->_adamId];
    [v3 setObject:v4 forKey:@"adamId"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_catalogContents count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_catalogContents, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = self->_catalogContents;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"catalogContent"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AMPMusicArtistContent;
  uint64_t v3 = [(AMPMusicArtistContent *)&v7 description];
  id v4 = [(AMPMusicArtistContent *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)catalogContentAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_catalogContents objectAtIndex:a3];
}

- (unint64_t)catalogContentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_catalogContents count];
}

- (void)addCatalogContent:(id)a3
{
  id v4 = a3;
  catalogContents = self->_catalogContents;
  id v8 = v4;
  if (!catalogContents)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_catalogContents;
    self->_catalogContents = v6;

    id v4 = v8;
    catalogContents = self->_catalogContents;
  }
  [(NSMutableArray *)catalogContents addObject:v4];
}

- (void)clearCatalogContents
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasAdamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAdamId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adamId = a3;
}

+ (Class)catalogContentType
{
  return (Class)objc_opt_class();
}

@end