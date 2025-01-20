@interface _NMRContentItemMetadata
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasDuration;
- (BOOL)hasIsAutoPlayItem;
- (BOOL)hasTitle;
- (BOOL)isAutoPlayItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)album;
- (NSString)artist;
- (NSString)title;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasIsAutoPlayItem:(BOOL)a3;
- (void)setIsAutoPlayItem:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRContentItemMetadata

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAutoPlayItem:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isAutoPlayItem = a3;
}

- (void)setHasIsAutoPlayItem:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAutoPlayItem
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRContentItemMetadata;
  char v3 = [(_NMRContentItemMetadata *)&v7 description];
  v4 = [(_NMRContentItemMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  artist = self->_artist;
  if (artist) {
    [v4 setObject:artist forKey:@"artist"];
  }
  album = self->_album;
  if (album) {
    [v4 setObject:album forKey:@"album"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithDouble:self->_duration];
    [v4 setObject:v9 forKey:@"duration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_isAutoPlayItem];
    [v4 setObject:v10 forKey:@"isAutoPlayItem"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000AEE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_artist)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_album)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_title)
  {
    [v4 setTitle:];
    id v4 = v6;
  }
  if (self->_artist)
  {
    [v6 setArtist:];
    id v4 = v6;
  }
  if (self->_album)
  {
    [v6 setAlbum:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_duration;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_isAutoPlayItem;
    *((unsigned char *)v4 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_title copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_artist copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_album copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = *(void *)&self->_duration;
    *((unsigned char *)v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 40) = self->_isAutoPlayItem;
    *((unsigned char *)v5 + 44) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_15;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](artist, "isEqual:")) {
      goto LABEL_15;
    }
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](album, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_15;
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }
    if (self->_isAutoPlayItem)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_artist hash];
  NSUInteger v5 = [(NSString *)self->_album hash];
  char has = (char)self->_has;
  if (has)
  {
    double duration = self->_duration;
    double v9 = -duration;
    if (duration >= 0.0) {
      double v9 = self->_duration;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_isAutoPlayItem;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[_NMRContentItemMetadata setTitle:](self, "setTitle:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[_NMRContentItemMetadata setArtist:](self, "setArtist:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[_NMRContentItemMetadata setAlbum:](self, "setAlbum:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_double duration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_isAutoPlayItem = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isAutoPlayItem
{
  return self->_isAutoPlayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

@end