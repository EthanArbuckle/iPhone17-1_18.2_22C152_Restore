@interface NPKProtoPhotosForFamilyMembersWithDSIDsResponse
+ (Class)familyPhotosIDsType;
+ (Class)familyPhotosType;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSMutableArray)familyPhotos;
- (NSMutableArray)familyPhotosIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)familyPhotosAtIndex:(unint64_t)a3;
- (id)familyPhotosIDsAtIndex:(unint64_t)a3;
- (unint64_t)familyPhotosCount;
- (unint64_t)familyPhotosIDsCount;
- (unint64_t)hash;
- (void)addFamilyPhotos:(id)a3;
- (void)addFamilyPhotosIDs:(id)a3;
- (void)clearFamilyPhotos;
- (void)clearFamilyPhotosIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFamilyPhotos:(id)a3;
- (void)setFamilyPhotosIDs:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPhotosForFamilyMembersWithDSIDsResponse

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearFamilyPhotosIDs
{
}

- (void)addFamilyPhotosIDs:(id)a3
{
  id v4 = a3;
  familyPhotosIDs = self->_familyPhotosIDs;
  id v8 = v4;
  if (!familyPhotosIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_familyPhotosIDs;
    self->_familyPhotosIDs = v6;

    id v4 = v8;
    familyPhotosIDs = self->_familyPhotosIDs;
  }
  [(NSMutableArray *)familyPhotosIDs addObject:v4];
}

- (unint64_t)familyPhotosIDsCount
{
  return [(NSMutableArray *)self->_familyPhotosIDs count];
}

- (id)familyPhotosIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_familyPhotosIDs objectAtIndex:a3];
}

+ (Class)familyPhotosIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearFamilyPhotos
{
}

- (void)addFamilyPhotos:(id)a3
{
  id v4 = a3;
  familyPhotos = self->_familyPhotos;
  id v8 = v4;
  if (!familyPhotos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_familyPhotos;
    self->_familyPhotos = v6;

    id v4 = v8;
    familyPhotos = self->_familyPhotos;
  }
  [(NSMutableArray *)familyPhotos addObject:v4];
}

- (unint64_t)familyPhotosCount
{
  return [(NSMutableArray *)self->_familyPhotos count];
}

- (id)familyPhotosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_familyPhotos objectAtIndex:a3];
}

+ (Class)familyPhotosType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPhotosForFamilyMembersWithDSIDsResponse;
  id v4 = [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)&v8 description];
  v5 = [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v4 forKey:@"success"];
  }
  familyPhotosIDs = self->_familyPhotosIDs;
  if (familyPhotosIDs) {
    [v3 setObject:familyPhotosIDs forKey:@"familyPhotosIDs"];
  }
  familyPhotos = self->_familyPhotos;
  if (familyPhotos) {
    [v3 setObject:familyPhotos forKey:@"familyPhotos"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPhotosForFamilyMembersWithDSIDsResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_familyPhotosIDs;
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
        PBDataWriterWriteDataField();
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
  v10 = self->_familyPhotos;
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
        PBDataWriterWriteDataField();
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
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_success;
    v4[28] |= 1u;
  }
  id v13 = v4;
  if ([(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self familyPhotosIDsCount])
  {
    [v13 clearFamilyPhotosIDs];
    unint64_t v5 = [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self familyPhotosIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self familyPhotosIDsAtIndex:i];
        [v13 addFamilyPhotosIDs:v8];
      }
    }
  }
  if ([(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self familyPhotosCount])
  {
    [v13 clearFamilyPhotos];
    unint64_t v9 = [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self familyPhotosCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self familyPhotosAtIndex:j];
        [v13 addFamilyPhotos:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_success;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_familyPhotosIDs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addFamilyPhotosIDs:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = self->_familyPhotos;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v6 addFamilyPhotos:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_success)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  familyPhotosIDs = self->_familyPhotosIDs;
  if ((unint64_t)familyPhotosIDs | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](familyPhotosIDs, "isEqual:"))
  {
    goto LABEL_14;
  }
  familyPhotos = self->_familyPhotos;
  if ((unint64_t)familyPhotos | *((void *)v4 + 1)) {
    char v7 = -[NSMutableArray isEqual:](familyPhotos, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_success;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_familyPhotosIDs hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_familyPhotos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_success = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NPKProtoPhotosForFamilyMembersWithDSIDsResponse *)self addFamilyPhotosIDs:*(void *)(*((void *)&v20 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5[1];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[NPKProtoPhotosForFamilyMembersWithDSIDsResponse addFamilyPhotos:](self, "addFamilyPhotos:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSMutableArray)familyPhotosIDs
{
  return self->_familyPhotosIDs;
}

- (void)setFamilyPhotosIDs:(id)a3
{
}

- (NSMutableArray)familyPhotos
{
  return self->_familyPhotos;
}

- (void)setFamilyPhotos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyPhotosIDs, 0);
  objc_storeStrong((id *)&self->_familyPhotos, 0);
}

@end