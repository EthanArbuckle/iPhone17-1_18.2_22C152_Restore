@interface MIPTVShow
- (BOOL)hasArtist;
- (BOOL)hasEpisodeId;
- (BOOL)hasEpisodeSortId;
- (BOOL)hasGenre;
- (BOOL)hasNetworkName;
- (BOOL)hasSeasonNumber;
- (BOOL)hasSeries;
- (BOOL)hasVideoQuality;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MIPArtist)artist;
- (MIPGenre)genre;
- (MIPSeries)series;
- (NSString)episodeId;
- (NSString)episodeSortId;
- (NSString)networkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)seasonNumber;
- (int)videoQuality;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtist:(id)a3;
- (void)setEpisodeId:(id)a3;
- (void)setEpisodeSortId:(id)a3;
- (void)setGenre:(id)a3;
- (void)setHasSeasonNumber:(BOOL)a3;
- (void)setHasVideoQuality:(BOOL)a3;
- (void)setNetworkName:(id)a3;
- (void)setSeasonNumber:(int)a3;
- (void)setSeries:(id)a3;
- (void)setVideoQuality:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPTVShow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_episodeSortId, 0);
  objc_storeStrong((id *)&self->_episodeId, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

- (void)setGenre:(id)a3
{
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (int)videoQuality
{
  return self->_videoQuality;
}

- (void)setEpisodeSortId:(id)a3
{
}

- (NSString)episodeSortId
{
  return self->_episodeSortId;
}

- (void)setEpisodeId:(id)a3
{
}

- (NSString)episodeId
{
  return self->_episodeId;
}

- (int)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeries:(id)a3
{
}

- (MIPSeries)series
{
  return self->_series;
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
  uint64_t v6 = *((void *)v4 + 1);
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
    -[MIPTVShow setArtist:](self, "setArtist:");
  }
  id v4 = v11;
LABEL_7:
  series = self->_series;
  uint64_t v8 = *((void *)v4 + 7);
  if (series)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MIPSeries mergeFrom:](series, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MIPTVShow setSeries:](self, "setSeries:");
  }
  id v4 = v11;
LABEL_13:
  if (*((unsigned char *)v4 + 68))
  {
    self->_seasonNumber = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[MIPTVShow setEpisodeId:](self, "setEpisodeId:");
    id v4 = v11;
  }
  if (*((void *)v4 + 3))
  {
    -[MIPTVShow setEpisodeSortId:](self, "setEpisodeSortId:");
    id v4 = v11;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_videoQuality = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 5))
  {
    -[MIPTVShow setNetworkName:](self, "setNetworkName:");
    id v4 = v11;
  }
  genre = self->_genre;
  uint64_t v10 = *((void *)v4 + 4);
  if (genre)
  {
    if (v10) {
      -[MIPGenre mergeFrom:](genre, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[MIPTVShow setGenre:](self, "setGenre:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(MIPArtist *)self->_artist hash];
  unint64_t v4 = [(MIPSeries *)self->_series hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_seasonNumber;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_episodeId hash];
  NSUInteger v7 = [(NSString *)self->_episodeSortId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_videoQuality;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_networkName hash];
  return v9 ^ [(MIPGenre *)self->_genre hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 1))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:")) {
      goto LABEL_24;
    }
  }
  series = self->_series;
  if ((unint64_t)series | *((void *)v4 + 7))
  {
    if (!-[MIPSeries isEqual:](series, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_seasonNumber != *((_DWORD *)v4 + 12)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_24:
    char v11 = 0;
    goto LABEL_25;
  }
  episodeId = self->_episodeId;
  if ((unint64_t)episodeId | *((void *)v4 + 2) && !-[NSString isEqual:](episodeId, "isEqual:")) {
    goto LABEL_24;
  }
  episodeSortId = self->_episodeSortId;
  if ((unint64_t)episodeSortId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](episodeSortId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_videoQuality != *((_DWORD *)v4 + 16)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_24;
  }
  networkName = self->_networkName;
  if ((unint64_t)networkName | *((void *)v4 + 5)
    && !-[NSString isEqual:](networkName, "isEqual:"))
  {
    goto LABEL_24;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 4)) {
    char v11 = -[MIPGenre isEqual:](genre, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_25:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MIPArtist *)self->_artist copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(MIPSeries *)self->_series copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_seasonNumber;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_episodeId copyWithZone:a3];
  char v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_episodeSortId copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_videoQuality;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v14 = [(NSString *)self->_networkName copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  id v16 = [(MIPGenre *)self->_genre copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_artist)
  {
    objc_msgSend(v4, "setArtist:");
    id v4 = v5;
  }
  if (self->_series)
  {
    objc_msgSend(v5, "setSeries:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_seasonNumber;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_episodeId)
  {
    objc_msgSend(v5, "setEpisodeId:");
    id v4 = v5;
  }
  if (self->_episodeSortId)
  {
    objc_msgSend(v5, "setEpisodeSortId:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_videoQuality;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_networkName)
  {
    objc_msgSend(v5, "setNetworkName:");
    id v4 = v5;
  }
  if (self->_genre)
  {
    objc_msgSend(v5, "setGenre:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_series)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_episodeId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_episodeSortId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_networkName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPTVShowReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  artist = self->_artist;
  if (artist)
  {
    id v5 = [(MIPArtist *)artist dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"artist"];
  }
  series = self->_series;
  if (series)
  {
    NSUInteger v7 = [(MIPSeries *)series dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"series"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v8 = [NSNumber numberWithInt:self->_seasonNumber];
    [v3 setObject:v8 forKey:@"seasonNumber"];
  }
  episodeId = self->_episodeId;
  if (episodeId) {
    [v3 setObject:episodeId forKey:@"episodeId"];
  }
  episodeSortId = self->_episodeSortId;
  if (episodeSortId) {
    [v3 setObject:episodeSortId forKey:@"episodeSortId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    char v11 = [NSNumber numberWithInt:self->_videoQuality];
    [v3 setObject:v11 forKey:@"videoQuality"];
  }
  networkName = self->_networkName;
  if (networkName) {
    [v3 setObject:networkName forKey:@"networkName"];
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
  v8.super_class = (Class)MIPTVShow;
  id v4 = [(MIPTVShow *)&v8 description];
  id v5 = [(MIPTVShow *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasNetworkName
{
  return self->_networkName != 0;
}

- (BOOL)hasVideoQuality
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasVideoQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setVideoQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_videoQuality = a3;
}

- (BOOL)hasEpisodeSortId
{
  return self->_episodeSortId != 0;
}

- (BOOL)hasEpisodeId
{
  return self->_episodeId != 0;
}

- (BOOL)hasSeasonNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSeasonNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSeasonNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_seasonNumber = a3;
}

- (BOOL)hasSeries
{
  return self->_series != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

@end