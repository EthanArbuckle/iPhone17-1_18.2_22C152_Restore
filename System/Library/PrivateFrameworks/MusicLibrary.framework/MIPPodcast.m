@interface MIPPodcast
- (BOOL)hasArtist;
- (BOOL)hasExternalGuid;
- (BOOL)hasFeedUrl;
- (BOOL)hasSeries;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MIPArtist)artist;
- (MIPSeries)series;
- (NSString)externalGuid;
- (NSString)feedUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtist:(id)a3;
- (void)setExternalGuid:(id)a3;
- (void)setFeedUrl:(id)a3;
- (void)setSeries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPPodcast

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_externalGuid, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

- (void)setFeedUrl:(id)a3
{
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setExternalGuid:(id)a3
{
}

- (NSString)externalGuid
{
  return self->_externalGuid;
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
  v4 = a3;
  artist = self->_artist;
  uint64_t v6 = v4[1];
  v9 = v4;
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
    -[MIPPodcast setArtist:](self, "setArtist:");
  }
  v4 = v9;
LABEL_7:
  series = self->_series;
  uint64_t v8 = v4[4];
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
    -[MIPPodcast setSeries:](self, "setSeries:");
  }
  v4 = v9;
LABEL_13:
  if (v4[2])
  {
    -[MIPPodcast setExternalGuid:](self, "setExternalGuid:");
    v4 = v9;
  }
  if (v4[3]) {
    -[MIPPodcast setFeedUrl:](self, "setFeedUrl:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(MIPArtist *)self->_artist hash];
  unint64_t v4 = [(MIPSeries *)self->_series hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_externalGuid hash];
  return v4 ^ v5 ^ [(NSString *)self->_feedUrl hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((artist = self->_artist, !((unint64_t)artist | v4[1])) || -[MIPArtist isEqual:](artist, "isEqual:"))
    && ((series = self->_series, !((unint64_t)series | v4[4])) || -[MIPSeries isEqual:](series, "isEqual:"))
    && ((externalGuid = self->_externalGuid, !((unint64_t)externalGuid | v4[2]))
     || -[NSString isEqual:](externalGuid, "isEqual:")))
  {
    feedUrl = self->_feedUrl;
    if ((unint64_t)feedUrl | v4[3]) {
      char v9 = -[NSString isEqual:](feedUrl, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MIPArtist *)self->_artist copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(MIPSeries *)self->_series copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_externalGuid copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_feedUrl copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
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
  if (self->_externalGuid)
  {
    objc_msgSend(v5, "setExternalGuid:");
    id v4 = v5;
  }
  if (self->_feedUrl)
  {
    objc_msgSend(v5, "setFeedUrl:");
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
  if (self->_externalGuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_feedUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPPodcastReadFrom((uint64_t)self, (uint64_t)a3);
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
    v7 = [(MIPSeries *)series dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"series"];
  }
  externalGuid = self->_externalGuid;
  if (externalGuid) {
    [v3 setObject:externalGuid forKey:@"externalGuid"];
  }
  feedUrl = self->_feedUrl;
  if (feedUrl) {
    [v3 setObject:feedUrl forKey:@"feedUrl"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPPodcast;
  id v4 = [(MIPPodcast *)&v8 description];
  id v5 = [(MIPPodcast *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFeedUrl
{
  return self->_feedUrl != 0;
}

- (BOOL)hasExternalGuid
{
  return self->_externalGuid != 0;
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