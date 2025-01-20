@interface SDAutoUnlockAuthPromptImageData
- (BOOL)finalMessage;
- (BOOL)hasFinalMessage;
- (BOOL)hasImageData;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFinalMessage:(BOOL)a3;
- (void)setHasFinalMessage:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAuthPromptImageData

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (void)setFinalMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_finalMessage = a3;
}

- (void)setHasFinalMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFinalMessage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockAuthPromptImageData;
  char v3 = [(SDAutoUnlockAuthPromptImageData *)&v7 description];
  v4 = [(SDAutoUnlockAuthPromptImageData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = +[NSNumber numberWithBool:self->_finalMessage];
    [v3 setObject:v6 forKey:@"finalMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptImageDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_imageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_imageData)
  {
    id v5 = v4;
    [v4 setImageData:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_finalMessage;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[4] = self->_version;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(NSData *)self->_imageData copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v6 + 20) = self->_finalMessage;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_12;
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:")) {
      goto LABEL_12;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_finalMessage)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_12;
      }
      BOOL v7 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_imageData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_finalMessage;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 24))
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[SDAutoUnlockAuthPromptImageData setImageData:](self, "setImageData:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_finalMessage = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (BOOL)finalMessage
{
  return self->_finalMessage;
}

- (void).cxx_destruct
{
}

@end