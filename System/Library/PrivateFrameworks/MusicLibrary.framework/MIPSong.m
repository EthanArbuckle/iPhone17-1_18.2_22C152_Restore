@interface MIPSong
- (BOOL)excludeFromShuffle;
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasAudioFormat;
- (BOOL)hasComposer;
- (BOOL)hasDiscNumber;
- (BOOL)hasExcludeFromShuffle;
- (BOOL)hasGeniusId;
- (BOOL)hasGenre;
- (BOOL)hasHasVideo;
- (BOOL)hasHlsPlaylistURL;
- (BOOL)hasLyrics;
- (BOOL)hasLyricsChecksum;
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
- (NSString)lyrics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)audioFormat;
- (int)discNumber;
- (int)lyricsChecksum;
- (int)trackNumber;
- (int)userRating;
- (int64_t)geniusId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setAudioFormat:(int)a3;
- (void)setComposer:(id)a3;
- (void)setDiscNumber:(int)a3;
- (void)setExcludeFromShuffle:(BOOL)a3;
- (void)setGeniusId:(int64_t)a3;
- (void)setGenre:(id)a3;
- (void)setHasAudioFormat:(BOOL)a3;
- (void)setHasDiscNumber:(BOOL)a3;
- (void)setHasExcludeFromShuffle:(BOOL)a3;
- (void)setHasGeniusId:(BOOL)a3;
- (void)setHasHasVideo:(BOOL)a3;
- (void)setHasLyricsChecksum:(BOOL)a3;
- (void)setHasTrackNumber:(BOOL)a3;
- (void)setHasUserRating:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setHlsPlaylistURL:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setLyricsChecksum:(int)a3;
- (void)setPlaybackInfo:(id)a3;
- (void)setTrackNumber:(int)a3;
- (void)setUserRating:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPSong

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
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

- (int)lyricsChecksum
{
  return self->_lyricsChecksum;
}

- (void)setPlaybackInfo:(id)a3
{
}

- (MIPPlaybackInfo)playbackInfo
{
  return self->_playbackInfo;
}

- (void)setLyrics:(id)a3
{
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (int)audioFormat
{
  return self->_audioFormat;
}

- (int64_t)geniusId
{
  return self->_geniusId;
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
  uint64_t v6 = *((void *)v4 + 2);
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
    -[MIPSong setAlbum:](self, "setAlbum:");
  }
  id v4 = v16;
LABEL_7:
  artist = self->_artist;
  uint64_t v8 = *((void *)v4 + 3);
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
    -[MIPSong setArtist:](self, "setArtist:");
  }
  id v4 = v16;
LABEL_13:
  composer = self->_composer;
  uint64_t v10 = *((void *)v4 + 5);
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
    -[MIPSong setComposer:](self, "setComposer:");
  }
  id v4 = v16;
LABEL_19:
  genre = self->_genre;
  uint64_t v12 = *((void *)v4 + 7);
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
    -[MIPSong setGenre:](self, "setGenre:");
  }
  id v4 = v16;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 108);
  if ((v13 & 4) != 0)
  {
    self->_discNumber = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v13 = *((unsigned char *)v4 + 108);
    if ((v13 & 0x10) == 0)
    {
LABEL_27:
      if ((v13 & 0x20) == 0) {
        goto LABEL_28;
      }
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x10) == 0)
  {
    goto LABEL_27;
  }
  self->_trackNumber = *((_DWORD *)v4 + 24);
  *(unsigned char *)&self->_has |= 0x10u;
  char v13 = *((unsigned char *)v4 + 108);
  if ((v13 & 0x20) == 0)
  {
LABEL_28:
    if ((v13 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_userRating = *((_DWORD *)v4 + 25);
  *(unsigned char *)&self->_has |= 0x20u;
  char v13 = *((unsigned char *)v4 + 108);
  if ((v13 & 0x40) == 0)
  {
LABEL_29:
    if ((v13 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_excludeFromShuffle = *((unsigned char *)v4 + 104);
  *(unsigned char *)&self->_has |= 0x40u;
  char v13 = *((unsigned char *)v4 + 108);
  if ((v13 & 1) == 0)
  {
LABEL_30:
    if ((v13 & 2) == 0) {
      goto LABEL_31;
    }
LABEL_42:
    self->_audioFormat = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v4 + 108) & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_43;
  }
LABEL_41:
  self->_geniusId = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v13 = *((unsigned char *)v4 + 108);
  if ((v13 & 2) != 0) {
    goto LABEL_42;
  }
LABEL_31:
  if ((v13 & 0x80) == 0) {
    goto LABEL_32;
  }
LABEL_43:
  self->_hasVideo = *((unsigned char *)v4 + 105);
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_32:
  if (*((void *)v4 + 9))
  {
    -[MIPSong setLyrics:](self, "setLyrics:");
    id v4 = v16;
  }
  playbackInfo = self->_playbackInfo;
  uint64_t v15 = *((void *)v4 + 11);
  if (playbackInfo)
  {
    if (!v15) {
      goto LABEL_47;
    }
    -[MIPPlaybackInfo mergeFrom:](playbackInfo, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_47;
    }
    -[MIPSong setPlaybackInfo:](self, "setPlaybackInfo:");
  }
  id v4 = v16;
LABEL_47:
  if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    self->_lyricsChecksum = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 8)) {
    -[MIPSong setHlsPlaylistURL:](self, "setHlsPlaylistURL:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v16 = [(MIPAlbum *)self->_album hash];
  unint64_t v15 = [(MIPArtist *)self->_artist hash];
  unint64_t v14 = [(MIPArtist *)self->_composer hash];
  unint64_t v17 = [(MIPGenre *)self->_genre hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v13 = 2654435761 * self->_discNumber;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_trackNumber;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_userRating;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_excludeFromShuffle;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_geniusId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_audioFormat;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_hasVideo;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
LABEL_16:
  NSUInteger v9 = [(NSString *)self->_lyrics hash];
  unint64_t v10 = [(MIPPlaybackInfo *)self->_playbackInfo hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_lyricsChecksum;
  }
  else {
    uint64_t v11 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v17 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_hlsPlaylistURL hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 2))
  {
    if (!-[MIPAlbum isEqual:](album, "isEqual:")) {
      goto LABEL_61;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 3))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:")) {
      goto LABEL_61;
    }
  }
  composer = self->_composer;
  if ((unint64_t)composer | *((void *)v4 + 5))
  {
    if (!-[MIPArtist isEqual:](composer, "isEqual:")) {
      goto LABEL_61;
    }
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 7))
  {
    if (!-[MIPGenre isEqual:](genre, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_discNumber != *((_DWORD *)v4 + 12)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x10) == 0 || self->_trackNumber != *((_DWORD *)v4 + 24)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x20) == 0 || self->_userRating != *((_DWORD *)v4 + 25)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x40) == 0) {
      goto LABEL_61;
    }
    if (self->_excludeFromShuffle)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x40) != 0)
  {
    goto LABEL_61;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_geniusId != *((void *)v4 + 1)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_audioFormat != *((_DWORD *)v4 + 8)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x80) == 0) {
      goto LABEL_45;
    }
LABEL_61:
    char v12 = 0;
    goto LABEL_62;
  }
  if ((*((unsigned char *)v4 + 108) & 0x80) == 0) {
    goto LABEL_61;
  }
  if (self->_hasVideo)
  {
    if (!*((unsigned char *)v4 + 105)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 105))
  {
    goto LABEL_61;
  }
LABEL_45:
  lyrics = self->_lyrics;
  if ((unint64_t)lyrics | *((void *)v4 + 9) && !-[NSString isEqual:](lyrics, "isEqual:")) {
    goto LABEL_61;
  }
  playbackInfo = self->_playbackInfo;
  if ((unint64_t)playbackInfo | *((void *)v4 + 11))
  {
    if (!-[MIPPlaybackInfo isEqual:](playbackInfo, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 8) == 0 || self->_lyricsChecksum != *((_DWORD *)v4 + 20)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    goto LABEL_61;
  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if ((unint64_t)hlsPlaylistURL | *((void *)v4 + 8)) {
    char v12 = -[NSString isEqual:](hlsPlaylistURL, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_62:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MIPAlbum *)self->_album copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(MIPArtist *)self->_artist copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(MIPArtist *)self->_composer copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(MIPGenre *)self->_genre copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_discNumber;
    *(unsigned char *)(v5 + 108) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_trackNumber;
  *(unsigned char *)(v5 + 108) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 100) = self->_userRating;
  *(unsigned char *)(v5 + 108) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(unsigned char *)(v5 + 104) = self->_excludeFromShuffle;
  *(unsigned char *)(v5 + 108) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_16:
    *(_DWORD *)(v5 + 32) = self->_audioFormat;
    *(unsigned char *)(v5 + 108) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_15:
  *(void *)(v5 + 8) = self->_geniusId;
  *(unsigned char *)(v5 + 108) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_7:
  if ((has & 0x80) == 0) {
    goto LABEL_8;
  }
LABEL_17:
  *(unsigned char *)(v5 + 105) = self->_hasVideo;
  *(unsigned char *)(v5 + 108) |= 0x80u;
LABEL_8:
  uint64_t v15 = [(NSString *)self->_lyrics copyWithZone:a3];
  unint64_t v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  id v17 = [(MIPPlaybackInfo *)self->_playbackInfo copyWithZone:a3];
  v18 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v17;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_lyricsChecksum;
    *(unsigned char *)(v5 + 108) |= 8u;
  }
  uint64_t v19 = [(NSString *)self->_hlsPlaylistURL copyWithZone:a3];
  v20 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v19;

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
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_discNumber;
    *((unsigned char *)v4 + 108) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 24) = self->_trackNumber;
  *((unsigned char *)v4 + 108) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 25) = self->_userRating;
  *((unsigned char *)v4 + 108) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)v4 + 104) = self->_excludeFromShuffle;
  *((unsigned char *)v4 + 108) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_32:
    *((_DWORD *)v4 + 8) = self->_audioFormat;
    *((unsigned char *)v4 + 108) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_31:
  *((void *)v4 + 1) = self->_geniusId;
  *((unsigned char *)v4 + 108) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_32;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_33:
  *((unsigned char *)v4 + 105) = self->_hasVideo;
  *((unsigned char *)v4 + 108) |= 0x80u;
LABEL_16:
  if (self->_lyrics)
  {
    objc_msgSend(v6, "setLyrics:");
    id v4 = v6;
  }
  if (self->_playbackInfo)
  {
    objc_msgSend(v6, "setPlaybackInfo:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_lyricsChecksum;
    *((unsigned char *)v4 + 108) |= 8u;
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_32:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_32;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
LABEL_16:
  if (self->_lyrics)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_playbackInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  return MIPSongReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
    NSUInteger v9 = [(MIPArtist *)composer dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"composer"];
  }
  genre = self->_genre;
  if (genre)
  {
    uint64_t v11 = [(MIPGenre *)genre dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"genre"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v19 = [NSNumber numberWithInt:self->_discNumber];
    [v3 setObject:v19 forKey:@"discNumber"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  v20 = [NSNumber numberWithInt:self->_trackNumber];
  [v3 setObject:v20 forKey:@"trackNumber"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v21 = [NSNumber numberWithInt:self->_userRating];
  [v3 setObject:v21 forKey:@"userRating"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v22 = [NSNumber numberWithBool:self->_excludeFromShuffle];
  [v3 setObject:v22 forKey:@"excludeFromShuffle"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_32:
    v24 = [NSNumber numberWithInt:self->_audioFormat];
    [v3 setObject:v24 forKey:@"audioFormat"];

    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_31:
  v23 = [NSNumber numberWithLongLong:self->_geniusId];
  [v3 setObject:v23 forKey:@"geniusId"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_32;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_33:
  v25 = [NSNumber numberWithBool:self->_hasVideo];
  [v3 setObject:v25 forKey:@"hasVideo"];

LABEL_16:
  lyrics = self->_lyrics;
  if (lyrics) {
    [v3 setObject:lyrics forKey:@"lyrics"];
  }
  playbackInfo = self->_playbackInfo;
  if (playbackInfo)
  {
    uint64_t v15 = [(MIPPlaybackInfo *)playbackInfo dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"playbackInfo"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v16 = [NSNumber numberWithInt:self->_lyricsChecksum];
    [v3 setObject:v16 forKey:@"lyricsChecksum"];
  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if (hlsPlaylistURL) {
    [v3 setObject:hlsPlaylistURL forKey:@"hlsPlaylistURL"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPSong;
  id v4 = [(MIPSong *)&v8 description];
  uint64_t v5 = [(MIPSong *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasHlsPlaylistURL
{
  return self->_hlsPlaylistURL != 0;
}

- (BOOL)hasLyricsChecksum
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasLyricsChecksum:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setLyricsChecksum:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_lyricsChecksum = a3;
}

- (BOOL)hasPlaybackInfo
{
  return self->_playbackInfo != 0;
}

- (BOOL)hasLyrics
{
  return self->_lyrics != 0;
}

- (BOOL)hasHasVideo
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasHasVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setHasVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_hasVideo = a3;
}

- (BOOL)hasAudioFormat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAudioFormat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setAudioFormat:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_audioFormat = a3;
}

- (BOOL)hasGeniusId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasGeniusId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setGeniusId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_geniusId = a3;
}

- (BOOL)hasExcludeFromShuffle
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasExcludeFromShuffle:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setExcludeFromShuffle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_excludeFromShuffle = a3;
}

- (BOOL)hasUserRating
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasUserRating:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setUserRating:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_userRating = a3;
}

- (BOOL)hasTrackNumber
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setTrackNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_trackNumber = a3;
}

- (BOOL)hasDiscNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDiscNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDiscNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
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