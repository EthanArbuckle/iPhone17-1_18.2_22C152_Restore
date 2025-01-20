@interface AWDNetworkUsage
- (BOOL)hasBundleName;
- (BOOL)hasCellIn;
- (BOOL)hasCellOut;
- (BOOL)hasNumConnections;
- (BOOL)hasWifiIn;
- (BOOL)hasWifiOut;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)cellIn;
- (unint64_t)cellOut;
- (unint64_t)hash;
- (unint64_t)wifiIn;
- (unint64_t)wifiOut;
- (unsigned)numConnections;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setCellIn:(unint64_t)a3;
- (void)setCellOut:(unint64_t)a3;
- (void)setHasCellIn:(BOOL)a3;
- (void)setHasCellOut:(BOOL)a3;
- (void)setHasNumConnections:(BOOL)a3;
- (void)setHasWifiIn:(BOOL)a3;
- (void)setHasWifiOut:(BOOL)a3;
- (void)setNumConnections:(unsigned int)a3;
- (void)setWifiIn:(unint64_t)a3;
- (void)setWifiOut:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNetworkUsage

- (void)dealloc
{
  [(AWDNetworkUsage *)self setBundleName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkUsage;
  [(AWDNetworkUsage *)&v3 dealloc];
}

- (BOOL)hasBundleName
{
  return self->_bundleName != 0;
}

- (void)setWifiIn:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_wifiIn = a3;
}

- (void)setHasWifiIn:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWifiIn
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWifiOut:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_wifiOut = a3;
}

- (void)setHasWifiOut:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifiOut
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCellIn:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cellIn = a3;
}

- (void)setHasCellIn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellIn
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCellOut:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cellOut = a3;
}

- (void)setHasCellOut:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellOut
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumConnections:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numConnections = a3;
}

- (void)setHasNumConnections:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumConnections
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkUsage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNetworkUsage description](&v3, sel_description), -[AWDNetworkUsage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  bundleName = self->_bundleName;
  if (bundleName) {
    [v3 setObject:bundleName forKey:@"bundleName"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_wifiIn] forKey:@"wifiIn"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_wifiOut] forKey:@"wifiOut"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_cellOut] forKey:@"cellOut"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v4;
    }
    goto LABEL_8;
  }
LABEL_12:
  [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_cellIn] forKey:@"cellIn"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x10) != 0) {
LABEL_8:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_numConnections] forKey:@"numConnections"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bundleName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_12:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_7:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_bundleName) {
    [a3 setBundleName:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_wifiIn;
    *((unsigned char *)a3 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((void *)a3 + 4) = self->_wifiOut;
  *((unsigned char *)a3 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_cellIn;
  *((unsigned char *)a3 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return;
    }
    goto LABEL_8;
  }
LABEL_13:
  *((void *)a3 + 2) = self->_cellOut;
  *((unsigned char *)a3 + 52) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 12) = self->_numConnections;
  *((unsigned char *)a3 + 52) |= 0x10u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")];

  *(void *)(v5 + 40) = [(NSString *)self->_bundleName copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_wifiIn;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 32) = self->_wifiOut;
  *(unsigned char *)(v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(void *)(v5 + 16) = self->_cellOut;
    *(unsigned char *)(v5 + 52) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(void *)(v5 + 8) = self->_cellIn;
  *(unsigned char *)(v5 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 48) = self->_numConnections;
    *(unsigned char *)(v5 + 52) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    bundleName = self->_bundleName;
    if (!((unint64_t)bundleName | *((void *)a3 + 5))
      || (int v5 = -[NSString isEqual:](bundleName, "isEqual:")) != 0)
    {
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_wifiIn != *((void *)a3 + 3)) {
          goto LABEL_28;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 4) != 0)
      {
LABEL_28:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_wifiOut != *((void *)a3 + 4)) {
          goto LABEL_28;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 8) != 0)
      {
        goto LABEL_28;
      }
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_cellIn != *((void *)a3 + 1)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)a3 + 52))
      {
        goto LABEL_28;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_cellOut != *((void *)a3 + 2)) {
          goto LABEL_28;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 2) != 0)
      {
        goto LABEL_28;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 0x10) == 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_numConnections != *((_DWORD *)a3 + 12)) {
          goto LABEL_28;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v4 = 2654435761u * self->_wifiIn;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_wifiOut;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_cellIn;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v7 = 2654435761u * self->_cellOut;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_numConnections;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 5)) {
    -[AWDNetworkUsage setBundleName:](self, "setBundleName:");
  }
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_wifiIn = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 52);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_wifiOut = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_cellIn = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      return;
    }
    goto LABEL_8;
  }
LABEL_13:
  self->_cellOut = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 52) & 0x10) == 0) {
    return;
  }
LABEL_8:
  self->_numConnections = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (unint64_t)wifiIn
{
  return self->_wifiIn;
}

- (unint64_t)wifiOut
{
  return self->_wifiOut;
}

- (unint64_t)cellIn
{
  return self->_cellIn;
}

- (unint64_t)cellOut
{
  return self->_cellOut;
}

- (unsigned)numConnections
{
  return self->_numConnections;
}

@end