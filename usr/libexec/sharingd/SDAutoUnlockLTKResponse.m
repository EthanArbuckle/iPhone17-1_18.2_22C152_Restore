@interface SDAutoUnlockLTKResponse
- (BOOL)currentlySyncing;
- (BOOL)hasCurrentlySyncing;
- (BOOL)hasLtkData;
- (BOOL)hasNeedsUnlock;
- (BOOL)hasVersion;
- (BOOL)hasViewState;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsUnlock;
- (BOOL)readFrom:(id)a3;
- (BOOL)viewState;
- (NSData)ltkData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentlySyncing:(BOOL)a3;
- (void)setHasCurrentlySyncing:(BOOL)a3;
- (void)setHasNeedsUnlock:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasViewState:(BOOL)a3;
- (void)setLtkData:(id)a3;
- (void)setNeedsUnlock:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setViewState:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockLTKResponse

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

- (BOOL)hasLtkData
{
  return self->_ltkData != 0;
}

- (void)setViewState:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_viewState = a3;
}

- (void)setHasViewState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasViewState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNeedsUnlock:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_needsUnlock = a3;
}

- (void)setHasNeedsUnlock:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNeedsUnlock
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCurrentlySyncing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_currentlySyncing = a3;
}

- (void)setHasCurrentlySyncing:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentlySyncing
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockLTKResponse;
  char v3 = [(SDAutoUnlockLTKResponse *)&v7 description];
  v4 = [(SDAutoUnlockLTKResponse *)self dictionaryRepresentation];
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
  ltkData = self->_ltkData;
  if (ltkData) {
    [v3 setObject:ltkData forKey:@"ltkData"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_viewState];
    [v3 setObject:v9 forKey:@"viewState"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v10 = +[NSNumber numberWithBool:self->_needsUnlock];
  [v3 setObject:v10 forKey:@"needsUnlock"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_super v7 = +[NSNumber numberWithBool:self->_currentlySyncing];
    [v3 setObject:v7 forKey:@"currentlySyncing"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_ltkData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_ltkData)
  {
    v6 = v4;
    [v4 setLtkData:];
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 22) = self->_viewState;
    *((unsigned char *)v4 + 24) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 21) = self->_needsUnlock;
  *((unsigned char *)v4 + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 20) = self->_currentlySyncing;
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_9:
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
  id v7 = [(NSData *)self->_ltkData copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((unsigned char *)v6 + 21) = self->_needsUnlock;
    *((unsigned char *)v6 + 24) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v6;
    }
    goto LABEL_6;
  }
  *((unsigned char *)v6 + 22) = self->_viewState;
  *((unsigned char *)v6 + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((unsigned char *)v6 + 20) = self->_currentlySyncing;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_28;
  }
  ltkData = self->_ltkData;
  if ((unint64_t)ltkData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](ltkData, "isEqual:")) {
      goto LABEL_28;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0) {
      goto LABEL_28;
    }
    if (self->_viewState)
    {
      if (!*((unsigned char *)v4 + 22)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 22))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_needsUnlock)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_28;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_currentlySyncing)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_28;
      }
      BOOL v7 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v7 = 0;
  }
LABEL_29:

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
  unint64_t v4 = (unint64_t)[(NSData *)self->_ltkData hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_viewState;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_needsUnlock;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_currentlySyncing;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
    id v6 = v4;
    -[SDAutoUnlockLTKResponse setLtkData:](self, "setLtkData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) != 0)
  {
    self->_viewState = *((unsigned char *)v4 + 22);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_needsUnlock = *((unsigned char *)v4 + 21);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_8:
    self->_currentlySyncing = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_9:
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)ltkData
{
  return self->_ltkData;
}

- (void)setLtkData:(id)a3
{
}

- (BOOL)viewState
{
  return self->_viewState;
}

- (BOOL)needsUnlock
{
  return self->_needsUnlock;
}

- (BOOL)currentlySyncing
{
  return self->_currentlySyncing;
}

- (void).cxx_destruct
{
}

@end