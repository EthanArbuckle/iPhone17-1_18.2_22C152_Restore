@interface TVRMSNowPlayingArtworkRequestMessage
- (BOOL)hasArtworkIdentifier;
- (BOOL)hasCompressionQuality;
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)artworkIdentifier;
- (float)compressionQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)height;
- (unsigned)width;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setCompressionQuality:(float)a3;
- (void)setHasCompressionQuality:(BOOL)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setWidth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSNowPlayingArtworkRequestMessage

- (BOOL)hasArtworkIdentifier
{
  return self->_artworkIdentifier != 0;
}

- (void)setWidth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHeight:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCompressionQuality:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_compressionQuality = a3;
}

- (void)setHasCompressionQuality:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompressionQuality
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSNowPlayingArtworkRequestMessage;
  v4 = [(TVRMSNowPlayingArtworkRequestMessage *)&v8 description];
  v5 = [(TVRMSNowPlayingArtworkRequestMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  artworkIdentifier = self->_artworkIdentifier;
  if (artworkIdentifier) {
    [v3 setObject:artworkIdentifier forKey:@"artworkIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_width];
    [v5 setObject:v10 forKey:@"width"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v11 = [NSNumber numberWithUnsignedInt:self->_height];
  [v5 setObject:v11 forKey:@"height"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *(float *)&double v4 = self->_compressionQuality;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v8 forKey:@"compressionQuality"];
  }
LABEL_7:

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSNowPlayingArtworkRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_artworkIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_artworkIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setArtworkIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_width;
    *((unsigned char *)v4 + 28) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 5) = self->_height;
  *((unsigned char *)v4 + 28) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((_DWORD *)v4 + 4) = LODWORD(self->_compressionQuality);
    *((unsigned char *)v4 + 28) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_artworkIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_height;
    *(unsigned char *)(v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_width;
  *(unsigned char *)(v5 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(float *)(v5 + 16) = self->_compressionQuality;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  artworkIdentifier = self->_artworkIdentifier;
  if ((unint64_t)artworkIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](artworkIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_width != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_height != *((_DWORD *)v4 + 5)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_compressionQuality != *((float *)v4 + 4)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_artworkIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  uint64_t v4 = 2654435761 * self->_width;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_height;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float compressionQuality = self->_compressionQuality;
  double v7 = compressionQuality;
  if (compressionQuality < 0.0) {
    double v7 = -compressionQuality;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[TVRMSNowPlayingArtworkRequestMessage setArtworkIdentifier:](self, "setArtworkIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_width = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_height = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 28))
  {
LABEL_6:
    self->_float compressionQuality = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (float)compressionQuality
{
  return self->_compressionQuality;
}

- (void).cxx_destruct
{
}

@end