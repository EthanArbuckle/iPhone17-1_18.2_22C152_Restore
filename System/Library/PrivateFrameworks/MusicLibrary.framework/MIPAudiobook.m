@interface MIPAudiobook
- (BOOL)excludeFromShuffle;
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasAudioFormat;
- (BOOL)hasComposer;
- (BOOL)hasDiscNumber;
- (BOOL)hasExcludeFromShuffle;
- (BOOL)hasGenre;
- (BOOL)hasHasVideo;
- (BOOL)hasHlsPlaylistURL;
- (BOOL)hasPlaybackInfo;
- (BOOL)hasTrackNumber;
- (BOOL)hasUserRating;
- (BOOL)hasVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MIPAlbum)album;
- (MIPArtist)artist;
- (MIPArtist)composer;
- (MIPGenre)genre;
- (MIPPlaybackInfo)playbackInfo;
- (NSString)hlsPlaylistURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)audioFormat;
- (int)discNumber;
- (int)trackNumber;
- (int)userRating;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setAudioFormat:(int)a3;
- (void)setComposer:(id)a3;
- (void)setDiscNumber:(int)a3;
- (void)setExcludeFromShuffle:(BOOL)a3;
- (void)setGenre:(id)a3;
- (void)setHasAudioFormat:(BOOL)a3;
- (void)setHasDiscNumber:(BOOL)a3;
- (void)setHasExcludeFromShuffle:(BOOL)a3;
- (void)setHasHasVideo:(BOOL)a3;
- (void)setHasTrackNumber:(BOOL)a3;
- (void)setHasUserRating:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setHlsPlaylistURL:(id)a3;
- (void)setPlaybackInfo:(id)a3;
- (void)setTrackNumber:(int)a3;
- (void)setUserRating:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPAudiobook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

- (void)setHlsPlaylistURL:(id)a3
{
}

- (NSString)hlsPlaylistURL
{
  return self->_hlsPlaylistURL;
}

- (void)setPlaybackInfo:(id)a3
{
}

- (MIPPlaybackInfo)playbackInfo
{
  return self->_playbackInfo;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (int)audioFormat
{
  return self->_audioFormat;
}

- (BOOL)excludeFromShuffle
{
  return self->_excludeFromShuffle;
}

- (int)userRating
{
  return self->_userRating;
}

- (int)trackNumber
{
  return self->_trackNumber;
}

- (int)discNumber
{
  return self->_discNumber;
}

- (void)setGenre:(id)a3
{
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setComposer:(id)a3
{
}

- (MIPArtist)composer
{
  return self->_composer;
}

- (void)setArtist:(id)a3
{
}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setAlbum:(id)a3
{
}

- (MIPAlbum)album
{
  return self->_album;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  album = self->_album;
  uint64_t v6 = *((void *)v4 + 1);
  id v16 = v4;
  if (album)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MIPAlbum mergeFrom:](album, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MIPAudiobook setAlbum:](self, "setAlbum:");
  }
  id v4 = v16;
LABEL_7:
  artist = self->_artist;
  uint64_t v8 = *((void *)v4 + 2);
  if (artist)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MIPAudiobook setArtist:](self, "setArtist:");
  }
  id v4 = v16;
LABEL_13:
  composer = self->_composer;
  uint64_t v10 = *((void *)v4 + 4);
  if (composer)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MIPArtist mergeFrom:](composer, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MIPAudiobook setComposer:](self, "setComposer:");
  }
  id v4 = v16;
LABEL_19:
  genre = self->_genre;
  uint64_t v12 = *((void *)v4 + 6);
  if (genre)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[MIPGenre mergeFrom:](genre, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[MIPAudiobook setGenre:](self, "setGenre:");
  }
  id v4 = v16;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 84);
  if ((v13 & 2) != 0)
  {
    self->_discNumber = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v13 = *((unsigned char *)v4 + 84);
    if ((v13 & 4) == 0)
    {
LABEL_27:
      if ((v13 & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_trackNumber = *((_DWORD *)v4 + 18);
  *(unsigned char *)&self->_has |= 4u;
  char v13 = *((unsigned char *)v4 + 84);
  if ((v13 & 8) == 0)
  {
LABEL_28:
    if ((v13 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_userRating = *((_DWORD *)v4 + 19);
  *(unsigned char *)&self->_has |= 8u;
  char v13 = *((unsigned char *)v4 + 84);
  if ((v13 & 0x10) == 0)
  {
LABEL_29:
    if ((v13 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_excludeFromShuffle = *((unsigned char *)v4 + 80);
  *(unsigned char *)&self->_has |= 0x10u;
  char v13 = *((unsigned char *)v4 + 84);
  if ((v13 & 1) == 0)
  {
LABEL_30:
    if ((v13 & 0x20) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_39:
  self->_audioFormat = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 84) & 0x20) != 0)
  {
LABEL_31:
    self->_hasVideo = *((unsigned char *)v4 + 81);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_32:
  playbackInfo = self->_playbackInfo;
  uint64_t v15 = *((void *)v4 + 8);
  if (playbackInfo)
  {
    if (!v15) {
      goto LABEL_44;
    }
    -[MIPPlaybackInfo mergeFrom:](playbackInfo, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_44;
    }
    -[MIPAudiobook setPlaybackInfo:](self, "setPlaybackInfo:");
  }
  id v4 = v16;
LABEL_44:
  if (*((void *)v4 + 7)) {
    -[MIPAudiobook setHlsPlaylistURL:](self, "setHlsPlaylistURL:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(MIPAlbum *)self->_album hash];
  unint64_t v4 = [(MIPArtist *)self->_artist hash];
  unint64_t v5 = [(MIPArtist *)self->_composer hash];
  unint64_t v6 = [(MIPGenre *)self->_genre hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_discNumber;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_trackNumber;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_userRating;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v10 = 2654435761 * self->_excludeFromShuffle;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v12 = 0;
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v11 = 2654435761 * self->_audioFormat;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v12 = 2654435761 * self->_hasVideo;
LABEL_14:
  unint64_t v13 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v14 = v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(MIPPlaybackInfo *)self->_playbackInfo hash];
  return v13 ^ v14 ^ [(NSString *)self->_hlsPlaylistURL hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 1))
  {
    if (!-[MIPAlbum isEqual:](album, "isEqual:")) {
      goto LABEL_50;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 2))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:")) {
      goto LABEL_50;
    }
  }
  composer = self->_composer;
  if ((unint64_t)composer | *((void *)v4 + 4))
  {
    if (!-[MIPArtist isEqual:](composer, "isEqual:")) {
      goto LABEL_50;
    }
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 6))
  {
    if (!-[MIPGenre isEqual:](genre, "isEqual:")) {
      goto LABEL_50;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_discNumber != *((_DWORD *)v4 + 10)) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_trackNumber != *((_DWORD *)v4 + 18)) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) == 0 || self->_userRating != *((_DWORD *)v4 + 19)) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x10) == 0) {
      goto LABEL_50;
    }
    if (self->_excludeFromShuffle)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_50;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_audioFormat != *((_DWORD *)v4 + 6)) {
      goto LABEL_50;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x20) != 0)
    {
      if (self->_hasVideo)
      {
        if (!*((unsigned char *)v4 + 81)) {
          goto LABEL_50;
        }
        goto LABEL_46;
      }
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_46;
      }
    }
LABEL_50:
    char v11 = 0;
    goto LABEL_51;
  }
  if ((*((unsigned char *)v4 + 84) & 0x20) != 0) {
    goto LABEL_50;
  }
LABEL_46:
  playbackInfo = self->_playbackInfo;
  if ((unint64_t)playbackInfo | *((void *)v4 + 8) && !-[MIPPlaybackInfo isEqual:](playbackInfo, "isEqual:")) {
    goto LABEL_50;
  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if ((unint64_t)hlsPlaylistURL | *((void *)v4 + 7)) {
    char v11 = -[NSString isEqual:](hlsPlaylistURL, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_51:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MIPAlbum *)self->_album copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(MIPArtist *)self->_artist copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  id v10 = [(MIPArtist *)self->_composer copyWithZone:a3];
  char v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  id v12 = [(MIPGenre *)self->_genre copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_discNumber;
    *(unsigned char *)(v5 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_trackNumber;
  *(unsigned char *)(v5 + 84) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v5 + 76) = self->_userRating;
  *(unsigned char *)(v5 + 84) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_audioFormat;
    *(unsigned char *)(v5 + 84) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(unsigned char *)(v5 + 80) = self->_excludeFromShuffle;
  *(unsigned char *)(v5 + 84) |= 0x10u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 81) = self->_hasVideo;
    *(unsigned char *)(v5 + 84) |= 0x20u;
  }
LABEL_8:
  id v15 = [(MIPPlaybackInfo *)self->_playbackInfo copyWithZone:a3];
  id v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  uint64_t v17 = [(NSString *)self->_hlsPlaylistURL copyWithZone:a3];
  v18 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v17;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_album)
  {
    objc_msgSend(v4, "setAlbum:");
    id v4 = v6;
  }
  if (self->_artist)
  {
    objc_msgSend(v6, "setArtist:");
    id v4 = v6;
  }
  if (self->_composer)
  {
    objc_msgSend(v6, "setComposer:");
    id v4 = v6;
  }
  if (self->_genre)
  {
    objc_msgSend(v6, "setGenre:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_discNumber;
    *((unsigned char *)v4 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 18) = self->_trackNumber;
  *((unsigned char *)v4 + 84) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 19) = self->_userRating;
  *((unsigned char *)v4 + 84) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)v4 + 80) = self->_excludeFromShuffle;
  *((unsigned char *)v4 + 84) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_27:
  *((_DWORD *)v4 + 6) = self->_audioFormat;
  *((unsigned char *)v4 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    *((unsigned char *)v4 + 81) = self->_hasVideo;
    *((unsigned char *)v4 + 84) |= 0x20u;
  }
LABEL_16:
  if (self->_playbackInfo)
  {
    objc_msgSend(v6, "setPlaybackInfo:");
    id v4 = v6;
  }
  if (self->_hlsPlaylistURL)
  {
    objc_msgSend(v6, "setHlsPlaylistURL:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_album)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_composer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_16:
  if (self->_playbackInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_hlsPlaylistURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPAudiobookReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  album = self->_album;
  if (album)
  {
    uint64_t v5 = [(MIPAlbum *)album dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"album"];
  }
  artist = self->_artist;
  if (artist)
  {
    uint64_t v7 = [(MIPArtist *)artist dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"artist"];
  }
  composer = self->_composer;
  if (composer)
  {
    uint64_t v9 = [(MIPArtist *)composer dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"composer"];
  }
  genre = self->_genre;
  if (genre)
  {
    char v11 = [(MIPGenre *)genre dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"genre"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v18 = [NSNumber numberWithInt:self->_discNumber];
    [v3 setObject:v18 forKey:@"discNumber"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  v19 = [NSNumber numberWithInt:self->_trackNumber];
  [v3 setObject:v19 forKey:@"trackNumber"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  v20 = [NSNumber numberWithInt:self->_userRating];
  [v3 setObject:v20 forKey:@"userRating"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  v21 = [NSNumber numberWithBool:self->_excludeFromShuffle];
  [v3 setObject:v21 forKey:@"excludeFromShuffle"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_27:
  v22 = [NSNumber numberWithInt:self->_audioFormat];
  [v3 setObject:v22 forKey:@"audioFormat"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    unint64_t v13 = [NSNumber numberWithBool:self->_hasVideo];
    [v3 setObject:v13 forKey:@"hasVideo"];
  }
LABEL_16:
  playbackInfo = self->_playbackInfo;
  if (playbackInfo)
  {
    id v15 = [(MIPPlaybackInfo *)playbackInfo dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"playbackInfo"];
  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if (hlsPlaylistURL) {
    [v3 setObject:hlsPlaylistURL forKey:@"hlsPlaylistURL"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPAudiobook;
  id v4 = [(MIPAudiobook *)&v8 description];
  uint64_t v5 = [(MIPAudiobook *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasHlsPlaylistURL
{
  return self->_hlsPlaylistURL != 0;
}

- (BOOL)hasPlaybackInfo
{
  return self->_playbackInfo != 0;
}

- (BOOL)hasHasVideo
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasHasVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setHasVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_hasVideo = a3;
}

- (BOOL)hasAudioFormat
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAudioFormat:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAudioFormat:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_audioFormat = a3;
}

- (BOOL)hasExcludeFromShuffle
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasExcludeFromShuffle:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setExcludeFromShuffle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_excludeFromShuffle = a3;
}

- (BOOL)hasUserRating
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasUserRating:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setUserRating:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_userRating = a3;
}

- (BOOL)hasTrackNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTrackNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_trackNumber = a3;
}

- (BOOL)hasDiscNumber
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDiscNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDiscNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_discNumber = a3;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasComposer
{
  return self->_composer != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

@end