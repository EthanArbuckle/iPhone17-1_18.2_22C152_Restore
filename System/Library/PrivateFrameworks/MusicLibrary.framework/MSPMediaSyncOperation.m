@interface MSPMediaSyncOperation
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasGenre;
- (BOOL)hasMediaItem;
- (BOOL)hasMultiverseId;
- (BOOL)hasOperationType;
- (BOOL)hasPlaylist;
- (BOOL)hasSeries;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MIPAlbum)album;
- (MIPArtist)artist;
- (MIPGenre)genre;
- (MIPMediaItem)mediaItem;
- (MIPMultiverseIdentifier)multiverseId;
- (MIPPlaylist)playlist;
- (MIPSeries)series;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationTypeAsString:(int)a3;
- (int)StringAsOperationType:(id)a3;
- (int)operationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setGenre:(id)a3;
- (void)setHasOperationType:(BOOL)a3;
- (void)setMediaItem:(id)a3;
- (void)setMultiverseId:(id)a3;
- (void)setOperationType:(int)a3;
- (void)setPlaylist:(id)a3;
- (void)setSeries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPMediaSyncOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_multiverseId, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

- (void)setPlaylist:(id)a3
{
}

- (MIPPlaylist)playlist
{
  return self->_playlist;
}

- (void)setMediaItem:(id)a3
{
}

- (MIPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setSeries:(id)a3
{
}

- (MIPSeries)series
{
  return self->_series;
}

- (void)setGenre:(id)a3
{
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setAlbum:(id)a3
{
}

- (MIPAlbum)album
{
  return self->_album;
}

- (void)setArtist:(id)a3
{
}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setMultiverseId:(id)a3
{
}

- (MIPMultiverseIdentifier)multiverseId
{
  return self->_multiverseId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 72))
  {
    self->_operationType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  multiverseId = self->_multiverseId;
  uint64_t v7 = v5[5];
  v20 = v5;
  if (multiverseId)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MIPMultiverseIdentifier mergeFrom:](multiverseId, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MSPMediaSyncOperation setMultiverseId:](self, "setMultiverseId:");
  }
  v5 = v20;
LABEL_9:
  artist = self->_artist;
  uint64_t v9 = v5[2];
  if (artist)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MSPMediaSyncOperation setArtist:](self, "setArtist:");
  }
  v5 = v20;
LABEL_15:
  album = self->_album;
  uint64_t v11 = v5[1];
  if (album)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MIPAlbum mergeFrom:](album, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MSPMediaSyncOperation setAlbum:](self, "setAlbum:");
  }
  v5 = v20;
LABEL_21:
  genre = self->_genre;
  uint64_t v13 = v5[3];
  if (genre)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MIPGenre mergeFrom:](genre, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MSPMediaSyncOperation setGenre:](self, "setGenre:");
  }
  v5 = v20;
LABEL_27:
  series = self->_series;
  uint64_t v15 = v5[8];
  if (series)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MIPSeries mergeFrom:](series, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MSPMediaSyncOperation setSeries:](self, "setSeries:");
  }
  v5 = v20;
LABEL_33:
  mediaItem = self->_mediaItem;
  uint64_t v17 = v5[4];
  if (mediaItem)
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[MIPMediaItem mergeFrom:](mediaItem, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[MSPMediaSyncOperation setMediaItem:](self, "setMediaItem:");
  }
  v5 = v20;
LABEL_39:
  playlist = self->_playlist;
  uint64_t v19 = v5[7];
  if (playlist)
  {
    if (v19) {
      -[MIPPlaylist mergeFrom:](playlist, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[MSPMediaSyncOperation setPlaylist:](self, "setPlaylist:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_operationType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MIPMultiverseIdentifier *)self->_multiverseId hash] ^ v3;
  unint64_t v5 = [(MIPArtist *)self->_artist hash];
  unint64_t v6 = v4 ^ v5 ^ [(MIPAlbum *)self->_album hash];
  unint64_t v7 = [(MIPGenre *)self->_genre hash];
  unint64_t v8 = v7 ^ [(MIPSeries *)self->_series hash];
  unint64_t v9 = v6 ^ v8 ^ [(MIPMediaItem *)self->_mediaItem hash];
  return v9 ^ [(MIPPlaylist *)self->_playlist hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_operationType != *((_DWORD *)v4 + 12)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  multiverseId = self->_multiverseId;
  if ((unint64_t)multiverseId | *((void *)v4 + 5)
    && !-[MIPMultiverseIdentifier isEqual:](multiverseId, "isEqual:"))
  {
    goto LABEL_21;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 2))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:")) {
      goto LABEL_21;
    }
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 1))
  {
    if (!-[MIPAlbum isEqual:](album, "isEqual:")) {
      goto LABEL_21;
    }
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 3))
  {
    if (!-[MIPGenre isEqual:](genre, "isEqual:")) {
      goto LABEL_21;
    }
  }
  series = self->_series;
  if ((unint64_t)series | *((void *)v4 + 8))
  {
    if (!-[MIPSeries isEqual:](series, "isEqual:")) {
      goto LABEL_21;
    }
  }
  mediaItem = self->_mediaItem;
  if ((unint64_t)mediaItem | *((void *)v4 + 4))
  {
    if (!-[MIPMediaItem isEqual:](mediaItem, "isEqual:")) {
      goto LABEL_21;
    }
  }
  playlist = self->_playlist;
  if ((unint64_t)playlist | *((void *)v4 + 7)) {
    char v12 = -[MIPPlaylist isEqual:](playlist, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_operationType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v7 = [(MIPMultiverseIdentifier *)self->_multiverseId copyWithZone:a3];
  unint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(MIPArtist *)self->_artist copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(MIPAlbum *)self->_album copyWithZone:a3];
  char v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(MIPGenre *)self->_genre copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  id v15 = [(MIPSeries *)self->_series copyWithZone:a3];
  v16 = (void *)v6[8];
  v6[8] = v15;

  id v17 = [(MIPMediaItem *)self->_mediaItem copyWithZone:a3];
  v18 = (void *)v6[4];
  v6[4] = v17;

  id v19 = [(MIPPlaylist *)self->_playlist copyWithZone:a3];
  v20 = (void *)v6[7];
  v6[7] = v19;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_operationType;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_multiverseId)
  {
    objc_msgSend(v4, "setMultiverseId:");
    id v4 = v5;
  }
  if (self->_artist)
  {
    objc_msgSend(v5, "setArtist:");
    id v4 = v5;
  }
  if (self->_album)
  {
    objc_msgSend(v5, "setAlbum:");
    id v4 = v5;
  }
  if (self->_genre)
  {
    objc_msgSend(v5, "setGenre:");
    id v4 = v5;
  }
  if (self->_series)
  {
    objc_msgSend(v5, "setSeries:");
    id v4 = v5;
  }
  if (self->_mediaItem)
  {
    objc_msgSend(v5, "setMediaItem:");
    id v4 = v5;
  }
  if (self->_playlist)
  {
    objc_msgSend(v5, "setPlaylist:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_multiverseId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_album)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_series)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mediaItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playlist)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MSPMediaSyncOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_operationType - 1;
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_operationType);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E5FB5F18[v4];
    }
    [v3 setObject:v5 forKey:@"operationType"];
  }
  multiverseId = self->_multiverseId;
  if (multiverseId)
  {
    id v7 = [(MIPMultiverseIdentifier *)multiverseId dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"multiverseId"];
  }
  artist = self->_artist;
  if (artist)
  {
    id v9 = [(MIPArtist *)artist dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"artist"];
  }
  album = self->_album;
  if (album)
  {
    id v11 = [(MIPAlbum *)album dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"album"];
  }
  genre = self->_genre;
  if (genre)
  {
    id v13 = [(MIPGenre *)genre dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"genre"];
  }
  series = self->_series;
  if (series)
  {
    id v15 = [(MIPSeries *)series dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"series"];
  }
  mediaItem = self->_mediaItem;
  if (mediaItem)
  {
    id v17 = [(MIPMediaItem *)mediaItem dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"mediaItem"];
  }
  playlist = self->_playlist;
  if (playlist)
  {
    id v19 = [(MIPPlaylist *)playlist dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"playlist"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPMediaSyncOperation;
  unsigned int v4 = [(MSPMediaSyncOperation *)&v8 description];
  id v5 = [(MSPMediaSyncOperation *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPlaylist
{
  return self->_playlist != 0;
}

- (BOOL)hasMediaItem
{
  return self->_mediaItem != 0;
}

- (BOOL)hasSeries
{
  return self->_series != 0;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasMultiverseId
{
  return self->_multiverseId != 0;
}

- (int)StringAsOperationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Add"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Delete"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB5F18[a3 - 1];
  }

  return v3;
}

- (BOOL)hasOperationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasOperationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setOperationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_operationType = a3;
}

- (int)operationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_operationType;
  }
  else {
    return 1;
  }
}

@end