@interface AWDWiFiMetricsScanObj
- (BOOL)hasDurScans;
- (BOOL)hasNumScans;
- (BOOL)hasScanType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)durScans;
- (unsigned)numScans;
- (unsigned)scanType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurScans:(unsigned int)a3;
- (void)setHasDurScans:(BOOL)a3;
- (void)setHasNumScans:(BOOL)a3;
- (void)setHasScanType:(BOOL)a3;
- (void)setNumScans:(unsigned int)a3;
- (void)setScanType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsScanObj

- (void)setScanType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scanType = a3;
}

- (void)setHasScanType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScanType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumScans:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numScans = a3;
}

- (void)setHasNumScans:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumScans
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDurScans:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_durScans = a3;
}

- (void)setHasDurScans:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurScans
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsScanObj;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsScanObj description](&v3, sel_description), -[AWDWiFiMetricsScanObj dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numScans] forKey:@"num_scans"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanType] forKey:@"scan_type"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durScans] forKey:@"dur_scans"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsScanObjReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_scanType;
    *((unsigned char *)a3 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_durScans;
      *((unsigned char *)a3 + 20) |= 1u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_numScans;
  *((unsigned char *)a3 + 20) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_scanType;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_numScans;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_durScans;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 4) == 0 || self->_scanType != *((_DWORD *)a3 + 4)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 2) == 0 || self->_numScans != *((_DWORD *)a3 + 3)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_durScans != *((_DWORD *)a3 + 2)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_scanType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_numScans;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_durScans;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 20);
  if ((v3 & 4) != 0)
  {
    self->_scanType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        return;
      }
LABEL_7:
      self->_durScans = *((_DWORD *)a3 + 2);
      *(unsigned char *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_numScans = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 20)) {
    goto LABEL_7;
  }
}

- (unsigned)scanType
{
  return self->_scanType;
}

- (unsigned)numScans
{
  return self->_numScans;
}

- (unsigned)durScans
{
  return self->_durScans;
}

@end