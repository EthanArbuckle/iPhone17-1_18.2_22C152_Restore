@interface _NMRMediaRemoteSetArtworkMessage
- (BOOL)hasJpegData;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasOriginalDigest;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jpegData;
- (NSData)originalDigest;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setJpegData:(id)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setOriginalDigest:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRMediaRemoteSetArtworkMessage

- (BOOL)hasJpegData
{
  return self->_jpegData != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasOriginalDigest
{
  return self->_originalDigest != 0;
}

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRMediaRemoteSetArtworkMessage;
  char v3 = [(_NMRMediaRemoteSetArtworkMessage *)&v7 description];
  v4 = [(_NMRMediaRemoteSetArtworkMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  jpegData = self->_jpegData;
  if (jpegData) {
    [v3 setObject:jpegData forKey:@"jpegData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithDouble:self->_timestamp];
    [v4 setObject:v6 forKey:@"timestamp"];
  }
  originalDigest = self->_originalDigest;
  if (originalDigest) {
    [v4 setObject:originalDigest forKey:@"originalDigest"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v8 = +[NSNumber numberWithInt:self->_originIdentifier];
    [v4 setObject:v8 forKey:@"originIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001E594((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_jpegData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_originalDigest)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_jpegData)
  {
    [v4 setJpegData:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_originalDigest)
  {
    [v5 setOriginalDigest:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_originIdentifier;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSData *)self->_jpegData copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v8 = [(NSData *)self->_originalDigest copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_originIdentifier;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  jpegData = self->_jpegData;
  if ((unint64_t)jpegData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](jpegData, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_16;
  }
  originalDigest = self->_originalDigest;
  if ((unint64_t)originalDigest | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](originalDigest, "isEqual:"))
    {
LABEL_16:
      BOOL v8 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
    BOOL v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_jpegData hash];
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v9 = (unint64_t)[(NSData *)self->_originalDigest hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[_NMRMediaRemoteSetArtworkMessage setJpegData:](self, "setJpegData:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[_NMRMediaRemoteSetArtworkMessage setOriginalDigest:](self, "setOriginalDigest:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_originIdentifier = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)jpegData
{
  return self->_jpegData;
}

- (void)setJpegData:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)originalDigest
{
  return self->_originalDigest;
}

- (void)setOriginalDigest:(id)a3
{
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDigest, 0);

  objc_storeStrong((id *)&self->_jpegData, 0);
}

@end