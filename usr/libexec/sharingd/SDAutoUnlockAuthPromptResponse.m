@interface SDAutoUnlockAuthPromptResponse
- (BOOL)hasErrorCode;
- (BOOL)hasKeyData;
- (BOOL)hasNeedsImageData;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsImageData;
- (BOOL)readFrom:(id)a3;
- (NSData)keyData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasNeedsImageData:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKeyData:(id)a3;
- (void)setNeedsImageData:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAuthPromptResponse

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (void)setNeedsImageData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_needsImageData = a3;
}

- (void)setHasNeedsImageData:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNeedsImageData
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockAuthPromptResponse;
  char v3 = [(SDAutoUnlockAuthPromptResponse *)&v7 description];
  v4 = [(SDAutoUnlockAuthPromptResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKey:@"keyData"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_needsImageData];
    [v3 setObject:v7 forKey:@"needsImageData"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v8 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_keyData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  if (self->_keyData)
  {
    v6 = v4;
    [v4 setKeyData:];
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_needsImageData;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[6] = self->_version;
    *((unsigned char *)v5 + 32) |= 2u;
  }
  id v7 = [(NSData *)self->_keyData copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v6 + 28) = self->_needsImageData;
    *((unsigned char *)v6 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((unsigned char *)v6 + 32) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_22;
  }
  keyData = self->_keyData;
  if ((unint64_t)keyData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](keyData, "isEqual:")) {
      goto LABEL_22;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) != 0)
    {
      if (self->_needsImageData)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    BOOL v7 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 32) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_22;
    }
    BOOL v7 = 1;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_keyData hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_needsImageData;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SDAutoUnlockAuthPromptResponse setKeyData:](self, "setKeyData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_needsImageData = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (BOOL)needsImageData
{
  return self->_needsImageData;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end