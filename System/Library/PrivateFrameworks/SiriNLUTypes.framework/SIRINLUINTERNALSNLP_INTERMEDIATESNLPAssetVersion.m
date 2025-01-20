@interface SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion
- (BOOL)hasBoltTaskId;
- (BOOL)hasNcvNumber;
- (BOOL)hasOsRelease;
- (BOOL)hasPatchNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)boltTaskId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ncvNumber;
- (unsigned)osRelease;
- (unsigned)patchNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoltTaskId:(id)a3;
- (void)setHasNcvNumber:(BOOL)a3;
- (void)setHasOsRelease:(BOOL)a3;
- (void)setHasPatchNumber:(BOOL)a3;
- (void)setNcvNumber:(unsigned int)a3;
- (void)setOsRelease:(unsigned int)a3;
- (void)setPatchNumber:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion

- (void).cxx_destruct
{
}

- (void)setBoltTaskId:(id)a3
{
}

- (NSString)boltTaskId
{
  return self->_boltTaskId;
}

- (unsigned)patchNumber
{
  return self->_patchNumber;
}

- (unsigned)ncvNumber
{
  return self->_ncvNumber;
}

- (unsigned)osRelease
{
  return self->_osRelease;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_osRelease = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_ncvNumber = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_patchNumber = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion setBoltTaskId:](self, "setBoltTaskId:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_boltTaskId hash];
  }
  uint64_t v2 = 2654435761 * self->_osRelease;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_ncvNumber;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_patchNumber;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_boltTaskId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_osRelease != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_ncvNumber != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_patchNumber != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  boltTaskId = self->_boltTaskId;
  if ((unint64_t)boltTaskId | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](boltTaskId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_ncvNumber;
    *(unsigned char *)(v5 + 28) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_osRelease;
  *(unsigned char *)(v5 + 28) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_patchNumber;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_boltTaskId copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_osRelease;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_ncvNumber;
  *((unsigned char *)v4 + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[6] = self->_patchNumber;
    *((unsigned char *)v4 + 28) |= 4u;
  }
LABEL_5:
  if (self->_boltTaskId)
  {
    char v6 = v4;
    objc_msgSend(v4, "setBoltTaskId:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_boltTaskId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_osRelease];
    [v3 setObject:v8 forKey:@"os_release"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithUnsignedInt:self->_ncvNumber];
  [v3 setObject:v9 forKey:@"ncv_number"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_patchNumber];
    [v3 setObject:v5 forKey:@"patch_number"];
  }
LABEL_5:
  boltTaskId = self->_boltTaskId;
  if (boltTaskId) {
    [v3 setObject:boltTaskId forKey:@"bolt_task_id"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion;
  id v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBoltTaskId
{
  return self->_boltTaskId != 0;
}

- (BOOL)hasPatchNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPatchNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPatchNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_patchNumber = a3;
}

- (BOOL)hasNcvNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNcvNumber:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setNcvNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ncvNumber = a3;
}

- (BOOL)hasOsRelease
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasOsRelease:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setOsRelease:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_osRelease = a3;
}

@end