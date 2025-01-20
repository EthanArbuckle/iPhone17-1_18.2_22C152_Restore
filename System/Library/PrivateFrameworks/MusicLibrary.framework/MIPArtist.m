@interface MIPArtist
+ (Class)libraryIdentifiersType;
- (BOOL)hasArtworkId;
- (BOOL)hasCloudUniversalLibraryId;
- (BOOL)hasLikedState;
- (BOOL)hasLikedStateChangedDate;
- (BOOL)hasName;
- (BOOL)hasPersistentId;
- (BOOL)hasSortName;
- (BOOL)hasSortOrder;
- (BOOL)hasSortOrderSection;
- (BOOL)hasStoreId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)libraryIdentifiers;
- (NSString)artworkId;
- (NSString)cloudUniversalLibraryId;
- (NSString)name;
- (NSString)sortName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)libraryIdentifiersAtIndex:(unint64_t)a3;
- (int)likedState;
- (int64_t)likedStateChangedDate;
- (int64_t)persistentId;
- (int64_t)sortOrder;
- (int64_t)sortOrderSection;
- (int64_t)storeId;
- (unint64_t)hash;
- (unint64_t)libraryIdentifiersCount;
- (void)addLibraryIdentifiers:(id)a3;
- (void)clearLibraryIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkId:(id)a3;
- (void)setCloudUniversalLibraryId:(id)a3;
- (void)setHasLikedState:(BOOL)a3;
- (void)setHasLikedStateChangedDate:(BOOL)a3;
- (void)setHasPersistentId:(BOOL)a3;
- (void)setHasSortOrder:(BOOL)a3;
- (void)setHasSortOrderSection:(BOOL)a3;
- (void)setHasStoreId:(BOOL)a3;
- (void)setLibraryIdentifiers:(id)a3;
- (void)setLikedState:(int)a3;
- (void)setLikedStateChangedDate:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setPersistentId:(int64_t)a3;
- (void)setSortName:(id)a3;
- (void)setSortOrder:(int64_t)a3;
- (void)setSortOrderSection:(int64_t)a3;
- (void)setStoreId:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPArtist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);

  objc_storeStrong((id *)&self->_artworkId, 0);
}

- (void)setLibraryIdentifiers:(id)a3
{
}

- (NSMutableArray)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (int64_t)sortOrderSection
{
  return self->_sortOrderSection;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (int)likedState
{
  return self->_likedState;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (int64_t)persistentId
{
  return self->_persistentId;
}

- (void)setArtworkId:(id)a3
{
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setSortName:(id)a3
{
}

- (NSString)sortName
{
  return self->_sortName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if ((v4[12] & 0x10) != 0)
  {
    self->_storeId = v4[5];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (v4[10]) {
    -[MIPArtist setName:](self, "setName:");
  }
  if (*((void *)v5 + 11)) {
    -[MIPArtist setSortName:](self, "setSortName:");
  }
  if (*((void *)v5 + 6)) {
    -[MIPArtist setArtworkId:](self, "setArtworkId:");
  }
  if ((*((unsigned char *)v5 + 96) & 2) != 0)
  {
    self->_persistentId = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 7)) {
    -[MIPArtist setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  }
  char v6 = *((unsigned char *)v5 + 96);
  if ((v6 & 0x20) != 0)
  {
    self->_likedState = *((_DWORD *)v5 + 18);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v5 + 96);
    if ((v6 & 1) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v5 + 96) & 1) == 0)
  {
    goto LABEL_15;
  }
  self->_likedStateChangedDate = *((void *)v5 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v5 + 96);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_28:
  self->_sortOrder = *((void *)v5 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v5 + 96) & 8) != 0)
  {
LABEL_17:
    self->_sortOrderSection = *((void *)v5 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_18:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[MIPArtist addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_storeId;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  NSUInteger v5 = [(NSString *)self->_sortName hash];
  NSUInteger v6 = [(NSString *)self->_artworkId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_persistentId;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_cloudUniversalLibraryId hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v9 = 2654435761 * self->_likedState;
    if (*(unsigned char *)&self->_has)
    {
LABEL_9:
      uint64_t v10 = 2654435761 * self->_likedStateChangedDate;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v11 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v12 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_libraryIdentifiers hash];
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_sortOrder;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_sortOrderSection;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_libraryIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x10) == 0 || self->_storeId != *((void *)v4 + 5)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 10) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_43;
  }
  sortName = self->_sortName;
  if ((unint64_t)sortName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](sortName, "isEqual:")) {
      goto LABEL_43;
    }
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 96);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_persistentId != *((void *)v4 + 2)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_43;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:"))
    {
LABEL_43:
      char v12 = 0;
      goto LABEL_44;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 96);
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_likedState != *((_DWORD *)v4 + 18)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_43;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_likedStateChangedDate != *((void *)v4 + 1)) {
      goto LABEL_43;
    }
  }
  else if (v9)
  {
    goto LABEL_43;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_sortOrder != *((void *)v4 + 3)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_sortOrderSection != *((void *)v4 + 4)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_43;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((void *)v4 + 8)) {
    char v12 = -[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_44:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_storeId;
    *(unsigned char *)(v5 + 96) |= 0x10u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  NSUInteger v8 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v7;

  uint64_t v9 = [(NSString *)self->_sortName copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v9;

  uint64_t v11 = [(NSString *)self->_artworkId copyWithZone:a3];
  char v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_persistentId;
    *(unsigned char *)(v6 + 96) |= 2u;
  }
  uint64_t v13 = [(NSString *)self->_cloudUniversalLibraryId copyWithZone:a3];
  long long v14 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v13;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_likedState;
    *(unsigned char *)(v6 + 96) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 8) = self->_likedStateChangedDate;
  *(unsigned char *)(v6 + 96) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_20:
  *(void *)(v6 + 24) = self->_sortOrder;
  *(unsigned char *)(v6 + 96) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(void *)(v6 + 32) = self->_sortOrderSection;
    *(unsigned char *)(v6 + 96) |= 8u;
  }
LABEL_10:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_libraryIdentifiers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v6 addLibraryIdentifiers:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_storeId;
    *((unsigned char *)v4 + 96) |= 0x10u;
  }
  uint64_t v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v10;
  }
  if (self->_sortName)
  {
    objc_msgSend(v10, "setSortName:");
    id v4 = v10;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v10, "setArtworkId:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_persistentId;
    *((unsigned char *)v4 + 96) |= 2u;
  }
  if (self->_cloudUniversalLibraryId)
  {
    objc_msgSend(v10, "setCloudUniversalLibraryId:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_likedState;
    *((unsigned char *)v4 + 96) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_16;
      }
LABEL_27:
      v4[3] = self->_sortOrder;
      *((unsigned char *)v4 + 96) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  v4[1] = self->_likedStateChangedDate;
  *((unsigned char *)v4 + 96) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_27;
  }
LABEL_16:
  if ((has & 8) != 0)
  {
LABEL_17:
    v4[4] = self->_sortOrderSection;
    *((unsigned char *)v4 + 96) |= 8u;
  }
LABEL_18:
  if ([(MIPArtist *)self libraryIdentifiersCount])
  {
    [v10 clearLibraryIdentifiers];
    unint64_t v6 = [(MIPArtist *)self libraryIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(MIPArtist *)self libraryIdentifiersAtIndex:i];
        [v10 addLibraryIdentifiers:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_sortName) {
    PBDataWriterWriteStringField();
  }
  if (self->_artworkId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_cloudUniversalLibraryId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt64Field();
LABEL_18:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_libraryIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPArtistReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    id v4 = [NSNumber numberWithLongLong:self->_storeId];
    [v3 setObject:v4 forKey:@"storeId"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  sortName = self->_sortName;
  if (sortName) {
    [v3 setObject:sortName forKey:@"sortName"];
  }
  artworkId = self->_artworkId;
  if (artworkId) {
    [v3 setObject:artworkId forKey:@"artworkId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithLongLong:self->_persistentId];
    [v3 setObject:v8 forKey:@"persistentId"];
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId) {
    [v3 setObject:cloudUniversalLibraryId forKey:@"cloudUniversalLibraryId"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v20 = [NSNumber numberWithInt:self->_likedState];
    [v3 setObject:v20 forKey:@"likedState"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  v21 = [NSNumber numberWithLongLong:self->_likedStateChangedDate];
  [v3 setObject:v21 forKey:@"likedStateChangedDate"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  v22 = [NSNumber numberWithLongLong:self->_sortOrder];
  [v3 setObject:v22 forKey:@"sortOrder"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_17:
    long long v11 = [NSNumber numberWithLongLong:self->_sortOrderSection];
    [v3 setObject:v11 forKey:@"sortOrderSection"];
  }
LABEL_18:
  if ([(NSMutableArray *)self->_libraryIdentifiers count])
  {
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v13 = self->_libraryIdentifiers;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"libraryIdentifiers"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPArtist;
  id v4 = [(MIPArtist *)&v8 description];
  uint64_t v5 = [(MIPArtist *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)libraryIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_libraryIdentifiers objectAtIndex:a3];
}

- (unint64_t)libraryIdentifiersCount
{
  return [(NSMutableArray *)self->_libraryIdentifiers count];
}

- (void)addLibraryIdentifiers:(id)a3
{
  id v4 = a3;
  libraryIdentifiers = self->_libraryIdentifiers;
  id v8 = v4;
  if (!libraryIdentifiers)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_libraryIdentifiers;
    self->_libraryIdentifiers = v6;

    id v4 = v8;
    libraryIdentifiers = self->_libraryIdentifiers;
  }
  [(NSMutableArray *)libraryIdentifiers addObject:v4];
}

- (void)clearLibraryIdentifiers
{
}

- (BOOL)hasSortOrderSection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSortOrderSection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSortOrderSection:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sortOrderSection = a3;
}

- (BOOL)hasSortOrder
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSortOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSortOrder:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sortOrder = a3;
}

- (BOOL)hasLikedStateChangedDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLikedStateChangedDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLikedStateChangedDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_likedStateChangedDate = a3;
}

- (BOOL)hasLikedState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasLikedState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setLikedState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_likedState = a3;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (BOOL)hasPersistentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPersistentId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPersistentId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_persistentId = a3;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (BOOL)hasSortName
{
  return self->_sortName != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasStoreId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasStoreId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setStoreId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_storeId = a3;
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end