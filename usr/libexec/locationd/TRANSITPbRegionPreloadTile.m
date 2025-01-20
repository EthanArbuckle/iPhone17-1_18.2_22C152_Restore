@interface TRANSITPbRegionPreloadTile
- (BOOL)hasIsAllowOverCellular;
- (BOOL)hasSecKey;
- (BOOL)hasTileType;
- (BOOL)hasTileX;
- (BOOL)hasTileY;
- (BOOL)isAllowOverCellular;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)secKey;
- (unsigned)tileType;
- (unsigned)tileX;
- (unsigned)tileY;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAllowOverCellular:(BOOL)a3;
- (void)setHasSecKey:(BOOL)a3;
- (void)setHasTileType:(BOOL)a3;
- (void)setHasTileX:(BOOL)a3;
- (void)setHasTileY:(BOOL)a3;
- (void)setIsAllowOverCellular:(BOOL)a3;
- (void)setSecKey:(unint64_t)a3;
- (void)setTileType:(unsigned int)a3;
- (void)setTileX:(unsigned int)a3;
- (void)setTileY:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbRegionPreloadTile

- (void)setTileType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tileType = a3;
}

- (void)setHasTileType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTileType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTileX:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTileX
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTileY:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTileY
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsAllowOverCellular:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isAllowOverCellular = a3;
}

- (void)setHasIsAllowOverCellular:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAllowOverCellular
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (unint64_t)secKey
{
  if (*(unsigned char *)&self->_has) {
    return self->_secKey;
  }
  else {
    return -1;
  }
}

- (void)setSecKey:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_secKey = a3;
}

- (void)setHasSecKey:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecKey
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadTile;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbRegionPreloadTile *)&v3 description], [(TRANSITPbRegionPreloadTile *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileType)] forKey:@"tileType"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileX)] forKey:@"tileX"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithBool:self->_isAllowOverCellular] forKey:@"isAllowOverCellular"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileY)] forKey:@"tileY"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (has) {
LABEL_6:
  }
    [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_secKey)] forKey:@"secKey"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004B9AB4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 1) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_tileType;
    *((unsigned char *)a3 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_tileX;
  *((unsigned char *)a3 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 6) = self->_tileY;
  *((unsigned char *)a3 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return;
    }
LABEL_11:
    *((void *)a3 + 1) = self->_secKey;
    *((unsigned char *)a3 + 32) |= 1u;
    return;
  }
LABEL_10:
  *((unsigned char *)a3 + 28) = self->_isAllowOverCellular;
  *((unsigned char *)a3 + 32) |= 0x10u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_tileType;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_tileX;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_tileY;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 28) = self->_isAllowOverCellular;
  *((unsigned char *)result + 32) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 1) = self->_secKey;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_tileType != *((_DWORD *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_tileX != *((_DWORD *)a3 + 5)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 8) == 0 || self->_tileY != *((_DWORD *)a3 + 6)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 0x10) == 0 || self->_isAllowOverCellular != *((unsigned __int8 *)a3 + 28)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_secKey != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_tileType;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_tileX;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_tileY;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isAllowOverCellular;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_secKey;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_tileType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_tileX = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_tileY = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_11:
    self->_secKey = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_10:
  self->_isAllowOverCellular = *((unsigned char *)a3 + 28);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)a3 + 32)) {
    goto LABEL_11;
  }
}

- (unsigned)tileType
{
  return self->_tileType;
}

- (unsigned)tileX
{
  return self->_tileX;
}

- (unsigned)tileY
{
  return self->_tileY;
}

- (BOOL)isAllowOverCellular
{
  return self->_isAllowOverCellular;
}

@end