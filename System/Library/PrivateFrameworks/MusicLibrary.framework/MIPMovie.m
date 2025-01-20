@interface MIPMovie
- (BOOL)hasAlternateAudio;
- (BOOL)hasArtist;
- (BOOL)hasAudioLanguage;
- (BOOL)hasAudioTrackId;
- (BOOL)hasAudioTrackIndex;
- (BOOL)hasChapterData;
- (BOOL)hasExtendedContentName;
- (BOOL)hasFlattenedChapterData;
- (BOOL)hasGenre;
- (BOOL)hasHasAlternateAudio;
- (BOOL)hasHasChapterData;
- (BOOL)hasHasSubtitles;
- (BOOL)hasMovieInfo;
- (BOOL)hasRental;
- (BOOL)hasRentalDuration;
- (BOOL)hasRentalPlaybackDuration;
- (BOOL)hasRentalPlaybackStartedDateTime;
- (BOOL)hasRentalStartedDateTime;
- (BOOL)hasSubtitleLanguage;
- (BOOL)hasSubtitleTrackIndex;
- (BOOL)hasSubtitles;
- (BOOL)hasVideoQuality;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)rental;
- (MIPArtist)artist;
- (MIPGenre)genre;
- (NSData)flattenedChapterData;
- (NSString)extendedContentName;
- (NSString)movieInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)audioLanguage;
- (int)audioTrackId;
- (int)audioTrackIndex;
- (int)subtitleLanguage;
- (int)subtitleTrackIndex;
- (int)videoQuality;
- (int64_t)rentalDuration;
- (int64_t)rentalPlaybackDuration;
- (int64_t)rentalPlaybackStartedDateTime;
- (int64_t)rentalStartedDateTime;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtist:(id)a3;
- (void)setAudioLanguage:(int)a3;
- (void)setAudioTrackId:(int)a3;
- (void)setAudioTrackIndex:(int)a3;
- (void)setExtendedContentName:(id)a3;
- (void)setFlattenedChapterData:(id)a3;
- (void)setGenre:(id)a3;
- (void)setHasAlternateAudio:(BOOL)a3;
- (void)setHasAudioLanguage:(BOOL)a3;
- (void)setHasAudioTrackId:(BOOL)a3;
- (void)setHasAudioTrackIndex:(BOOL)a3;
- (void)setHasChapterData:(BOOL)a3;
- (void)setHasHasAlternateAudio:(BOOL)a3;
- (void)setHasHasChapterData:(BOOL)a3;
- (void)setHasHasSubtitles:(BOOL)a3;
- (void)setHasRental:(BOOL)a3;
- (void)setHasRentalDuration:(BOOL)a3;
- (void)setHasRentalPlaybackDuration:(BOOL)a3;
- (void)setHasRentalPlaybackStartedDateTime:(BOOL)a3;
- (void)setHasRentalStartedDateTime:(BOOL)a3;
- (void)setHasSubtitleLanguage:(BOOL)a3;
- (void)setHasSubtitleTrackIndex:(BOOL)a3;
- (void)setHasSubtitles:(BOOL)a3;
- (void)setHasVideoQuality:(BOOL)a3;
- (void)setMovieInfo:(id)a3;
- (void)setRental:(BOOL)a3;
- (void)setRentalDuration:(int64_t)a3;
- (void)setRentalPlaybackDuration:(int64_t)a3;
- (void)setRentalPlaybackStartedDateTime:(int64_t)a3;
- (void)setRentalStartedDateTime:(int64_t)a3;
- (void)setSubtitleLanguage:(int)a3;
- (void)setSubtitleTrackIndex:(int)a3;
- (void)setVideoQuality:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPMovie

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieInfo, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_flattenedChapterData, 0);
  objc_storeStrong((id *)&self->_extendedContentName, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

- (void)setGenre:(id)a3
{
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setFlattenedChapterData:(id)a3
{
}

- (NSData)flattenedChapterData
{
  return self->_flattenedChapterData;
}

- (int64_t)rentalStartedDateTime
{
  return self->_rentalStartedDateTime;
}

- (int64_t)rentalPlaybackStartedDateTime
{
  return self->_rentalPlaybackStartedDateTime;
}

- (int64_t)rentalPlaybackDuration
{
  return self->_rentalPlaybackDuration;
}

- (int64_t)rentalDuration
{
  return self->_rentalDuration;
}

- (int)subtitleTrackIndex
{
  return self->_subtitleTrackIndex;
}

- (int)subtitleLanguage
{
  return self->_subtitleLanguage;
}

- (int)audioTrackId
{
  return self->_audioTrackId;
}

- (int)audioTrackIndex
{
  return self->_audioTrackIndex;
}

- (int)audioLanguage
{
  return self->_audioLanguage;
}

- (BOOL)hasSubtitles
{
  return self->_hasSubtitles;
}

- (BOOL)hasAlternateAudio
{
  return self->_hasAlternateAudio;
}

- (void)setMovieInfo:(id)a3
{
}

- (NSString)movieInfo
{
  return self->_movieInfo;
}

- (void)setExtendedContentName:(id)a3
{
}

- (NSString)extendedContentName
{
  return self->_extendedContentName;
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (BOOL)rental
{
  return self->_rental;
}

- (int)videoQuality
{
  return self->_videoQuality;
}

- (void)setArtist:(id)a3
{
}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  artist = self->_artist;
  uint64_t v6 = *((void *)v4 + 5);
  id v11 = v4;
  if (artist)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MIPMovie setArtist:](self, "setArtist:");
  }
  id v4 = v11;
LABEL_7:
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((v7 & 0x200) != 0)
  {
    self->_videoQuality = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v7 = *((_WORD *)v4 + 56);
    if ((v7 & 0x2000) == 0)
    {
LABEL_9:
      if ((v7 & 0x800) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) == 0)
  {
    goto LABEL_9;
  }
  self->_rental = *((unsigned char *)v4 + 111);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
LABEL_10:
    self->_hasChapterData = *((unsigned char *)v4 + 109);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_11:
  if (*((void *)v4 + 8))
  {
    -[MIPMovie setExtendedContentName:](self, "setExtendedContentName:");
    id v4 = v11;
  }
  if (*((void *)v4 + 11))
  {
    -[MIPMovie setMovieInfo:](self, "setMovieInfo:");
    id v4 = v11;
  }
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x400) != 0)
  {
    self->_hasAlternateAudio = *((unsigned char *)v4 + 108);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v8 = *((_WORD *)v4 + 56);
    if ((v8 & 0x1000) == 0)
    {
LABEL_17:
      if ((v8 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x1000) == 0)
  {
    goto LABEL_17;
  }
  self->_hasSubtitles = *((unsigned char *)v4 + 110);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x10) == 0)
  {
LABEL_18:
    if ((v8 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_audioLanguage = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x40) == 0)
  {
LABEL_19:
    if ((v8 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_audioTrackIndex = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x20) == 0)
  {
LABEL_20:
    if ((v8 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_audioTrackId = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x80) == 0)
  {
LABEL_21:
    if ((v8 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_subtitleLanguage = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x100) == 0)
  {
LABEL_22:
    if ((v8 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_subtitleTrackIndex = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 1) == 0)
  {
LABEL_23:
    if ((v8 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_rentalDuration = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 2) == 0)
  {
LABEL_24:
    if ((v8 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_rentalPlaybackDuration = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((v8 & 4) == 0)
  {
LABEL_25:
    if ((v8 & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_44:
  self->_rentalPlaybackStartedDateTime = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 56) & 8) != 0)
  {
LABEL_26:
    self->_rentalStartedDateTime = *((void *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_27:
  if (*((void *)v4 + 9))
  {
    -[MIPMovie setFlattenedChapterData:](self, "setFlattenedChapterData:");
    id v4 = v11;
  }
  genre = self->_genre;
  uint64_t v10 = *((void *)v4 + 10);
  if (genre)
  {
    if (v10) {
      -[MIPGenre mergeFrom:](genre, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[MIPMovie setGenre:](self, "setGenre:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(MIPArtist *)self->_artist hash];
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    uint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_videoQuality;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_rental;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_hasChapterData;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  NSUInteger v7 = [(NSString *)self->_extendedContentName hash];
  NSUInteger v8 = [(NSString *)self->_movieInfo hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v10 = 2654435761 * self->_hasAlternateAudio;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_10:
      uint64_t v11 = 2654435761 * self->_hasSubtitles;
      if ((has & 0x10) != 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_audioLanguage;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_audioTrackIndex;
    if ((has & 0x20) != 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v13 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_audioTrackId;
    if ((has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_subtitleLanguage;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_subtitleTrackIndex;
    if (has) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v16 = 0;
  if (has)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_rentalDuration;
    if ((has & 2) != 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v17 = 0;
  if ((has & 2) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_rentalPlaybackDuration;
    if ((has & 4) != 0) {
      goto LABEL_18;
    }
LABEL_29:
    uint64_t v19 = 0;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_30:
    uint64_t v20 = 0;
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v18 = 0;
  if ((has & 4) == 0) {
    goto LABEL_29;
  }
LABEL_18:
  uint64_t v19 = 2654435761 * self->_rentalPlaybackStartedDateTime;
  if ((has & 8) == 0) {
    goto LABEL_30;
  }
LABEL_19:
  uint64_t v20 = 2654435761 * self->_rentalStartedDateTime;
LABEL_31:
  unint64_t v21 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11;
  uint64_t v22 = v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NSData *)self->_flattenedChapterData hash];
  return v21 ^ v22 ^ [(MIPGenre *)self->_genre hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_94;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 5))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:")) {
      goto LABEL_94;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0 || self->_videoQuality != *((_DWORD *)v4 + 26)) {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x200) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x2000) == 0) {
      goto LABEL_94;
    }
    if (self->_rental)
    {
      if (!*((unsigned char *)v4 + 111)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 111))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x800) == 0) {
      goto LABEL_94;
    }
    if (self->_hasChapterData)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
    goto LABEL_94;
  }
  extendedContentName = self->_extendedContentName;
  if ((unint64_t)extendedContentName | *((void *)v4 + 8)
    && !-[NSString isEqual:](extendedContentName, "isEqual:"))
  {
    goto LABEL_94;
  }
  movieInfo = self->_movieInfo;
  if ((unint64_t)movieInfo | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](movieInfo, "isEqual:")) {
      goto LABEL_94;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 56);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x400) == 0) {
      goto LABEL_94;
    }
    if (self->_hasAlternateAudio)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_94;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x400) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
    {
      if (self->_hasSubtitles)
      {
        if (!*((unsigned char *)v4 + 110)) {
          goto LABEL_94;
        }
        goto LABEL_45;
      }
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_45;
      }
    }
LABEL_94:
    char v12 = 0;
    goto LABEL_95;
  }
  if ((*((_WORD *)v4 + 56) & 0x1000) != 0) {
    goto LABEL_94;
  }
LABEL_45:
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_audioLanguage != *((_DWORD *)v4 + 12)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_audioTrackIndex != *((_DWORD *)v4 + 14)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_audioTrackId != *((_DWORD *)v4 + 13)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_subtitleLanguage != *((_DWORD *)v4 + 24)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_subtitleTrackIndex != *((_DWORD *)v4 + 25)) {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_94;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_rentalDuration != *((void *)v4 + 1)) {
      goto LABEL_94;
    }
  }
  else if (v9)
  {
    goto LABEL_94;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_rentalPlaybackDuration != *((void *)v4 + 2)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_rentalPlaybackStartedDateTime != *((void *)v4 + 3)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_rentalStartedDateTime != *((void *)v4 + 4)) {
      goto LABEL_94;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_94;
  }
  flattenedChapterData = self->_flattenedChapterData;
  if ((unint64_t)flattenedChapterData | *((void *)v4 + 9)
    && !-[NSData isEqual:](flattenedChapterData, "isEqual:"))
  {
    goto LABEL_94;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 10)) {
    char v12 = -[MIPGenre isEqual:](genre, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_95:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MIPArtist *)self->_artist copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_videoQuality;
    *(_WORD *)(v5 + 112) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 111) = self->_rental;
  *(_WORD *)(v5 + 112) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 109) = self->_hasChapterData;
    *(_WORD *)(v5 + 112) |= 0x800u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_extendedContentName copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  uint64_t v11 = [(NSString *)self->_movieInfo copyWithZone:a3];
  char v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_hasAlternateAudio;
    *(_WORD *)(v5 + 112) |= 0x400u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x1000) == 0)
    {
LABEL_7:
      if ((v13 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 110) = self->_hasSubtitles;
  *(_WORD *)(v5 + 112) |= 0x1000u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_8:
    if ((v13 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 48) = self->_audioLanguage;
  *(_WORD *)(v5 + 112) |= 0x10u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) == 0)
  {
LABEL_9:
    if ((v13 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 56) = self->_audioTrackIndex;
  *(_WORD *)(v5 + 112) |= 0x40u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_10:
    if ((v13 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 52) = self->_audioTrackId;
  *(_WORD *)(v5 + 112) |= 0x20u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_11:
    if ((v13 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 96) = self->_subtitleLanguage;
  *(_WORD *)(v5 + 112) |= 0x80u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x100) == 0)
  {
LABEL_12:
    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 100) = self->_subtitleTrackIndex;
  *(_WORD *)(v5 + 112) |= 0x100u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_13:
    if ((v13 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(void *)(v5 + 8) = self->_rentalDuration;
  *(_WORD *)(v5 + 112) |= 1u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 2) == 0)
  {
LABEL_14:
    if ((v13 & 4) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *(void *)(v5 + 24) = self->_rentalPlaybackStartedDateTime;
    *(_WORD *)(v5 + 112) |= 4u;
    if ((*(_WORD *)&self->_has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_29:
  *(void *)(v5 + 16) = self->_rentalPlaybackDuration;
  *(_WORD *)(v5 + 112) |= 2u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((v13 & 8) != 0)
  {
LABEL_16:
    *(void *)(v5 + 32) = self->_rentalStartedDateTime;
    *(_WORD *)(v5 + 112) |= 8u;
  }
LABEL_17:
  uint64_t v14 = [(NSData *)self->_flattenedChapterData copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  id v16 = [(MIPGenre *)self->_genre copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v16;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_artist)
  {
    objc_msgSend(v4, "setArtist:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_videoQuality;
    *((_WORD *)v4 + 56) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 111) = self->_rental;
  *((_WORD *)v4 + 56) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 109) = self->_hasChapterData;
    *((_WORD *)v4 + 56) |= 0x800u;
  }
LABEL_7:
  if (self->_extendedContentName)
  {
    objc_msgSend(v7, "setExtendedContentName:");
    id v4 = v7;
  }
  if (self->_movieInfo)
  {
    objc_msgSend(v7, "setMovieInfo:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    *((unsigned char *)v4 + 108) = self->_hasAlternateAudio;
    *((_WORD *)v4 + 56) |= 0x400u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x1000) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v4 + 110) = self->_hasSubtitles;
  *((_WORD *)v4 + 56) |= 0x1000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 12) = self->_audioLanguage;
  *((_WORD *)v4 + 56) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 14) = self->_audioTrackIndex;
  *((_WORD *)v4 + 56) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 13) = self->_audioTrackId;
  *((_WORD *)v4 + 56) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 24) = self->_subtitleLanguage;
  *((_WORD *)v4 + 56) |= 0x80u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 25) = self->_subtitleTrackIndex;
  *((_WORD *)v4 + 56) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_19:
    if ((v6 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v4 + 1) = self->_rentalDuration;
  *((_WORD *)v4 + 56) |= 1u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_20:
    if ((v6 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)v4 + 2) = self->_rentalPlaybackDuration;
  *((_WORD *)v4 + 56) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_21:
    if ((v6 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_42:
  *((void *)v4 + 3) = self->_rentalPlaybackStartedDateTime;
  *((_WORD *)v4 + 56) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    *((void *)v4 + 4) = self->_rentalStartedDateTime;
    *((_WORD *)v4 + 56) |= 8u;
  }
LABEL_23:
  if (self->_flattenedChapterData)
  {
    objc_msgSend(v7, "setFlattenedChapterData:");
    id v4 = v7;
  }
  if (self->_genre)
  {
    objc_msgSend(v7, "setGenre:");
    id v4 = v7;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_7:
  if (self->_extendedContentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_movieInfo)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x1000) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_19:
    if ((v6 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_20:
    if ((v6 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_21:
    if ((v6 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_42:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_23:
  if (self->_flattenedChapterData)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPMovieReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  artist = self->_artist;
  if (artist)
  {
    uint64_t v5 = [(MIPArtist *)artist dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"artist"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    id v16 = [NSNumber numberWithInt:self->_videoQuality];
    [v3 setObject:v16 forKey:@"videoQuality"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v17 = [NSNumber numberWithBool:self->_rental];
  [v3 setObject:v17 forKey:@"rental"];

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    id v7 = [NSNumber numberWithBool:self->_hasChapterData];
    [v3 setObject:v7 forKey:@"hasChapterData"];
  }
LABEL_7:
  extendedContentName = self->_extendedContentName;
  if (extendedContentName) {
    [v3 setObject:extendedContentName forKey:@"extendedContentName"];
  }
  movieInfo = self->_movieInfo;
  if (movieInfo) {
    [v3 setObject:movieInfo forKey:@"movieInfo"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x400) != 0)
  {
    uint64_t v18 = [NSNumber numberWithBool:self->_hasAlternateAudio];
    [v3 setObject:v18 forKey:@"hasAlternateAudio"];

    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x1000) == 0)
    {
LABEL_13:
      if ((v10 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  uint64_t v19 = [NSNumber numberWithBool:self->_hasSubtitles];
  [v3 setObject:v19 forKey:@"hasSubtitles"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_14:
    if ((v10 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v20 = [NSNumber numberWithInt:self->_audioLanguage];
  [v3 setObject:v20 forKey:@"audioLanguage"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_15:
    if ((v10 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v21 = [NSNumber numberWithInt:self->_audioTrackIndex];
  [v3 setObject:v21 forKey:@"audioTrackIndex"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_16:
    if ((v10 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v22 = [NSNumber numberWithInt:self->_audioTrackId];
  [v3 setObject:v22 forKey:@"audioTrackId"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x80) == 0)
  {
LABEL_17:
    if ((v10 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = [NSNumber numberWithInt:self->_subtitleLanguage];
  [v3 setObject:v23 forKey:@"subtitleLanguage"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_18:
    if ((v10 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  v24 = [NSNumber numberWithInt:self->_subtitleTrackIndex];
  [v3 setObject:v24 forKey:@"subtitleTrackIndex"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_19:
    if ((v10 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  v25 = [NSNumber numberWithLongLong:self->_rentalDuration];
  [v3 setObject:v25 forKey:@"rentalDuration"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_20:
    if ((v10 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
LABEL_41:
  v26 = [NSNumber numberWithLongLong:self->_rentalPlaybackDuration];
  [v3 setObject:v26 forKey:@"rentalPlaybackDuration"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_21:
    if ((v10 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_42:
  v27 = [NSNumber numberWithLongLong:self->_rentalPlaybackStartedDateTime];
  [v3 setObject:v27 forKey:@"rentalPlaybackStartedDateTime"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    uint64_t v11 = [NSNumber numberWithLongLong:self->_rentalStartedDateTime];
    [v3 setObject:v11 forKey:@"rentalStartedDateTime"];
  }
LABEL_23:
  flattenedChapterData = self->_flattenedChapterData;
  if (flattenedChapterData) {
    [v3 setObject:flattenedChapterData forKey:@"flattenedChapterData"];
  }
  genre = self->_genre;
  if (genre)
  {
    uint64_t v14 = [(MIPGenre *)genre dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"genre"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPMovie;
  id v4 = [(MIPMovie *)&v8 description];
  uint64_t v5 = [(MIPMovie *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasFlattenedChapterData
{
  return self->_flattenedChapterData != 0;
}

- (BOOL)hasRentalStartedDateTime
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRentalStartedDateTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setRentalStartedDateTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rentalStartedDateTime = a3;
}

- (BOOL)hasRentalPlaybackStartedDateTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRentalPlaybackStartedDateTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setRentalPlaybackStartedDateTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rentalPlaybackStartedDateTime = a3;
}

- (BOOL)hasRentalPlaybackDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasRentalPlaybackDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setRentalPlaybackDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rentalPlaybackDuration = a3;
}

- (BOOL)hasRentalDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasRentalDuration:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setRentalDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rentalDuration = a3;
}

- (BOOL)hasSubtitleTrackIndex
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasSubtitleTrackIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setSubtitleTrackIndex:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subtitleTrackIndex = a3;
}

- (BOOL)hasSubtitleLanguage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasSubtitleLanguage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setSubtitleLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subtitleLanguage = a3;
}

- (BOOL)hasAudioTrackId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAudioTrackId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setAudioTrackId:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_audioTrackId = a3;
}

- (BOOL)hasAudioTrackIndex
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasAudioTrackIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setAudioTrackIndex:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_audioTrackIndex = a3;
}

- (BOOL)hasAudioLanguage
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasAudioLanguage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setAudioLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_audioLanguage = a3;
}

- (BOOL)hasHasSubtitles
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasHasSubtitles:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setHasSubtitles:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_hasSubtitles = a3;
}

- (BOOL)hasHasAlternateAudio
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasHasAlternateAudio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setHasAlternateAudio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasAlternateAudio = a3;
}

- (BOOL)hasMovieInfo
{
  return self->_movieInfo != 0;
}

- (BOOL)hasExtendedContentName
{
  return self->_extendedContentName != 0;
}

- (BOOL)hasHasChapterData
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasHasChapterData:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setHasChapterData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasChapterData = a3;
}

- (BOOL)hasRental
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasRental:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setRental:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_rental = a3;
}

- (BOOL)hasVideoQuality
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasVideoQuality:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setVideoQuality:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_videoQuality = a3;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

@end