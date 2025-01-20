@interface MIPAlbum
+ (Class)libraryIdentifiersType;
- (BOOL)compilation;
- (BOOL)hasArtist;
- (BOOL)hasArtworkId;
- (BOOL)hasCloudId;
- (BOOL)hasCompilation;
- (BOOL)hasLikedState;
- (BOOL)hasLikedStateChangedDate;
- (BOOL)hasName;
- (BOOL)hasNumDiscs;
- (BOOL)hasNumTracks;
- (BOOL)hasPersistentId;
- (BOOL)hasSortName;
- (BOOL)hasStoreId;
- (BOOL)hasUserRating;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MIPArtist)artist;
- (NSMutableArray)libraryIdentifiers;
- (NSString)artworkId;
- (NSString)cloudId;
- (NSString)name;
- (NSString)sortName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)libraryIdentifiersAtIndex:(unint64_t)a3;
- (int)likedState;
- (int)numDiscs;
- (int)numTracks;
- (int)userRating;
- (int64_t)likedStateChangedDate;
- (int64_t)persistentId;
- (int64_t)storeId;
- (unint64_t)hash;
- (unint64_t)libraryIdentifiersCount;
- (void)addLibraryIdentifiers:(id)a3;
- (void)clearLibraryIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkId:(id)a3;
- (void)setCloudId:(id)a3;
- (void)setCompilation:(BOOL)a3;
- (void)setHasCompilation:(BOOL)a3;
- (void)setHasLikedState:(BOOL)a3;
- (void)setHasLikedStateChangedDate:(BOOL)a3;
- (void)setHasNumDiscs:(BOOL)a3;
- (void)setHasNumTracks:(BOOL)a3;
- (void)setHasPersistentId:(BOOL)a3;
- (void)setHasStoreId:(BOOL)a3;
- (void)setHasUserRating:(BOOL)a3;
- (void)setLibraryIdentifiers:(id)a3;
- (void)setLikedState:(int)a3;
- (void)setLikedStateChangedDate:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNumDiscs:(int)a3;
- (void)setNumTracks:(int)a3;
- (void)setPersistentId:(int64_t)a3;
- (void)setSortName:(id)a3;
- (void)setStoreId:(int64_t)a3;
- (void)setUserRating:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPAlbum

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudId, 0);
  objc_storeStrong((id *)&self->_artworkId, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

- (void)setLibraryIdentifiers:(id)a3
{
}

- (NSMutableArray)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (int)likedState
{
  return self->_likedState;
}

- (void)setCloudId:(id)a3
{
}

- (NSString)cloudId
{
  return self->_cloudId;
}

- (int64_t)persistentId
{
  return self->_persistentId;
}

- (BOOL)compilation
{
  return self->_compilation;
}

- (int)userRating
{
  return self->_userRating;
}

- (void)setArtworkId:(id)a3
{
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (int)numDiscs
{
  return self->_numDiscs;
}

- (int)numTracks
{
  return self->_numTracks;
}

- (void)setArtist:(id)a3
{
}

- (MIPArtist)artist
{
  return self->_artist;
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if ((v4[13] & 4) != 0)
  {
    self->_storeId = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (v4[9]) {
    -[MIPAlbum setName:](self, "setName:");
  }
  if (*((void *)v5 + 11)) {
    -[MIPAlbum setSortName:](self, "setSortName:");
  }
  artist = self->_artist;
  uint64_t v7 = *((void *)v5 + 4);
  if (artist)
  {
    if (v7) {
      -[MIPArtist mergeFrom:](artist, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[MIPAlbum setArtist:](self, "setArtist:");
  }
  char v8 = *((unsigned char *)v5 + 104);
  if ((v8 & 0x20) != 0)
  {
    self->_numTracks = *((_DWORD *)v5 + 21);
    *(unsigned char *)&self->_has |= 0x20u;
    char v8 = *((unsigned char *)v5 + 104);
  }
  if ((v8 & 0x10) != 0)
  {
    self->_numDiscs = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 5)) {
    -[MIPAlbum setArtworkId:](self, "setArtworkId:");
  }
  char v9 = *((unsigned char *)v5 + 104);
  if ((v9 & 0x40) != 0)
  {
    self->_userRating = *((_DWORD *)v5 + 24);
    *(unsigned char *)&self->_has |= 0x40u;
    char v9 = *((unsigned char *)v5 + 104);
    if ((v9 & 0x80) == 0)
    {
LABEL_20:
      if ((v9 & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v5 + 104) & 0x80) == 0)
  {
    goto LABEL_20;
  }
  self->_compilation = *((unsigned char *)v5 + 100);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v5 + 104) & 2) != 0)
  {
LABEL_21:
    self->_persistentId = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_22:
  if (*((void *)v5 + 6)) {
    -[MIPAlbum setCloudId:](self, "setCloudId:");
  }
  char v10 = *((unsigned char *)v5 + 104);
  if ((v10 & 8) != 0)
  {
    self->_likedState = *((_DWORD *)v5 + 16);
    *(unsigned char *)&self->_has |= 8u;
    char v10 = *((unsigned char *)v5 + 104);
  }
  if (v10)
  {
    self->_likedStateChangedDate = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[MIPAlbum addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_storeId;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_sortName hash];
  unint64_t v5 = [(MIPArtist *)self->_artist hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v6 = 2654435761 * self->_numTracks;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v20 = v6;
  unint64_t v7 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v8 = 2654435761 * self->_numDiscs;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_artworkId hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v10 = 2654435761 * self->_userRating;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_12:
      uint64_t v11 = 2654435761 * self->_compilation;
      goto LABEL_15;
    }
  }
  uint64_t v11 = 0;
LABEL_15:
  uint64_t v12 = v10;
  NSUInteger v13 = v9;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_persistentId;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_cloudId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_likedState;
  }
  else {
    uint64_t v16 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v17 = 2654435761 * self->_likedStateChangedDate;
  }
  else {
    uint64_t v17 = 0;
  }
  return v3 ^ v19 ^ v4 ^ v7 ^ v20 ^ v8 ^ v13 ^ v12 ^ v11 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSMutableArray *)self->_libraryIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_storeId != *((void *)v4 + 3)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_59;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 9) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_59;
  }
  sortName = self->_sortName;
  if ((unint64_t)sortName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](sortName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 4))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:")) {
      goto LABEL_59;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 104);
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x20) == 0 || self->_numTracks != *((_DWORD *)v4 + 21)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 0x20) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x10) == 0 || self->_numDiscs != *((_DWORD *)v4 + 20)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_59;
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:")) {
      goto LABEL_59;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 104);
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_userRating != *((_DWORD *)v4 + 24)) {
      goto LABEL_59;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_59;
  }
  if (has < 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_59;
    }
    if (self->_compilation)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_59;
    }
  }
  else if (v9 < 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_persistentId != *((void *)v4 + 2)) {
      goto LABEL_59;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_59;
  }
  cloudId = self->_cloudId;
  if ((unint64_t)cloudId | *((void *)v4 + 6))
  {
    if (-[NSString isEqual:](cloudId, "isEqual:"))
    {
      char has = (char)self->_has;
      char v9 = *((unsigned char *)v4 + 104);
      goto LABEL_45;
    }
LABEL_59:
    char v13 = 0;
    goto LABEL_60;
  }
LABEL_45:
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_likedState != *((_DWORD *)v4 + 16)) {
      goto LABEL_59;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_59;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_likedStateChangedDate != *((void *)v4 + 1)) {
      goto LABEL_59;
    }
  }
  else if (v9)
  {
    goto LABEL_59;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((void *)v4 + 7)) {
    char v13 = -[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_60:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_storeId;
    *(unsigned char *)(v5 + 104) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v7;

  uint64_t v9 = [(NSString *)self->_sortName copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v9;

  id v11 = [(MIPArtist *)self->_artist copyWithZone:a3];
  uint64_t v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_numTracks;
    *(unsigned char *)(v6 + 104) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_numDiscs;
    *(unsigned char *)(v6 + 104) |= 0x10u;
  }
  uint64_t v14 = [(NSString *)self->_artworkId copyWithZone:a3];
  NSUInteger v15 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_userRating;
    *(unsigned char *)(v6 + 104) |= 0x40u;
    char v16 = (char)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_9:
      if ((v16 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  *(unsigned char *)(v6 + 100) = self->_compilation;
  *(unsigned char *)(v6 + 104) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    *(void *)(v6 + 16) = self->_persistentId;
    *(unsigned char *)(v6 + 104) |= 2u;
  }
LABEL_11:
  uint64_t v17 = [(NSString *)self->_cloudId copyWithZone:a3];
  long long v18 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v17;

  char v19 = (char)self->_has;
  if ((v19 & 8) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_likedState;
    *(unsigned char *)(v6 + 104) |= 8u;
    char v19 = (char)self->_has;
  }
  if (v19)
  {
    *(void *)(v6 + 8) = self->_likedStateChangedDate;
    *(unsigned char *)(v6 + 104) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = self->_libraryIdentifiers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v6 addLibraryIdentifiers:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[3] = self->_storeId;
    *((unsigned char *)v4 + 104) |= 4u;
  }
  uint64_t v12 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v12;
  }
  if (self->_sortName)
  {
    objc_msgSend(v12, "setSortName:");
    id v4 = v12;
  }
  if (self->_artist)
  {
    objc_msgSend(v12, "setArtist:");
    id v4 = v12;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_numTracks;
    *((unsigned char *)v4 + 104) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_numDiscs;
    *((unsigned char *)v4 + 104) |= 0x10u;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v12, "setArtworkId:");
    id v4 = v12;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_userRating;
    *((unsigned char *)v4 + 104) |= 0x40u;
    char v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_17:
      if ((v6 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v4 + 100) = self->_compilation;
  *((unsigned char *)v4 + 104) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_18:
    v4[2] = self->_persistentId;
    *((unsigned char *)v4 + 104) |= 2u;
  }
LABEL_19:
  if (self->_cloudId)
  {
    objc_msgSend(v12, "setCloudId:");
    id v4 = v12;
  }
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_likedState;
    *((unsigned char *)v4 + 104) |= 8u;
    char v7 = (char)self->_has;
  }
  if (v7)
  {
    v4[1] = self->_likedStateChangedDate;
    *((unsigned char *)v4 + 104) |= 1u;
  }
  if ([(MIPAlbum *)self libraryIdentifiersCount])
  {
    [v12 clearLibraryIdentifiers];
    unint64_t v8 = [(MIPAlbum *)self libraryIdentifiersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        id v11 = [(MIPAlbum *)self libraryIdentifiersAtIndex:i];
        [v12 addLibraryIdentifiers:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_sortName) {
    PBDataWriterWriteStringField();
  }
  if (self->_artist) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_artworkId) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_17:
      if ((v6 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt64Field();
LABEL_19:
  if (self->_cloudId) {
    PBDataWriterWriteStringField();
  }
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v7 = (char)self->_has;
  }
  if (v7) {
    PBDataWriterWriteInt64Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v8 = self->_libraryIdentifiers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPAlbumReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
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
  artist = self->_artist;
  if (artist)
  {
    unint64_t v8 = [(MIPArtist *)artist dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"artist"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v10 = [NSNumber numberWithInt:self->_numTracks];
    [v3 setObject:v10 forKey:@"numTracks"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v11 = [NSNumber numberWithInt:self->_numDiscs];
    [v3 setObject:v11 forKey:@"numDiscs"];
  }
  artworkId = self->_artworkId;
  if (artworkId) {
    [v3 setObject:artworkId forKey:@"artworkId"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x40) != 0)
  {
    long long v27 = [NSNumber numberWithInt:self->_userRating];
    [v3 setObject:v27 forKey:@"userRating"];

    char v13 = (char)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_17:
      if ((v13 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_17;
  }
  long long v28 = [NSNumber numberWithBool:self->_compilation];
  [v3 setObject:v28 forKey:@"compilation"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_18:
    long long v14 = [NSNumber numberWithLongLong:self->_persistentId];
    [v3 setObject:v14 forKey:@"persistentId"];
  }
LABEL_19:
  cloudId = self->_cloudId;
  if (cloudId) {
    [v3 setObject:cloudId forKey:@"cloudId"];
  }
  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    uint64_t v17 = [NSNumber numberWithInt:self->_likedState];
    [v3 setObject:v17 forKey:@"likedState"];

    char v16 = (char)self->_has;
  }
  if (v16)
  {
    uint64_t v18 = [NSNumber numberWithLongLong:self->_likedStateChangedDate];
    [v3 setObject:v18 forKey:@"likedStateChangedDate"];
  }
  if ([(NSMutableArray *)self->_libraryIdentifiers count])
  {
    char v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = self->_libraryIdentifiers;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (void)v29);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"libraryIdentifiers"];
  }

  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPAlbum;
  id v4 = [(MIPAlbum *)&v8 description];
  uint64_t v5 = [(MIPAlbum *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v7 = self->_libraryIdentifiers;
    self->_libraryIdentifiers = v6;

    id v4 = v8;
    libraryIdentifiers = self->_libraryIdentifiers;
  }
  [(NSMutableArray *)libraryIdentifiers addObject:v4];
}

- (void)clearLibraryIdentifiers
{
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
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasLikedState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setLikedState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_likedState = a3;
}

- (BOOL)hasCloudId
{
  return self->_cloudId != 0;
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

- (BOOL)hasCompilation
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasCompilation:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setCompilation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_compilation = a3;
}

- (BOOL)hasUserRating
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasUserRating:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setUserRating:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_userRating = a3;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (BOOL)hasNumDiscs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNumDiscs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setNumDiscs:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numDiscs = a3;
}

- (BOOL)hasNumTracks
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasNumTracks:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setNumTracks:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numTracks = a3;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
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
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStoreId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStoreId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_storeId = a3;
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end