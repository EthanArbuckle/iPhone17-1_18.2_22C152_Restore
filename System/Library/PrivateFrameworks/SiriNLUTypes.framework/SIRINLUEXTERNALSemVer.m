@interface SIRINLUEXTERNALSemVer
- (BOOL)hasMajorVersion;
- (BOOL)hasMinorVersion;
- (BOOL)hasPatchVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)majorVersion;
- (unsigned)minorVersion;
- (unsigned)patchVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMajorVersion:(BOOL)a3;
- (void)setHasMinorVersion:(BOOL)a3;
- (void)setHasPatchVersion:(BOOL)a3;
- (void)setMajorVersion:(unsigned int)a3;
- (void)setMinorVersion:(unsigned int)a3;
- (void)setPatchVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSemVer

- (unsigned)patchVersion
{
  return self->_patchVersion;
}

- (unsigned)minorVersion
{
  return self->_minorVersion;
}

- (unsigned)majorVersion
{
  return self->_majorVersion;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_majorVersion = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_minorVersion = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_4:
    self->_patchVersion = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_majorVersion;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_minorVersion;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_patchVersion;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_majorVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_minorVersion != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_patchVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_majorVersion;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_minorVersion;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_patchVersion;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_majorVersion;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_minorVersion;
  *((unsigned char *)v4 + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[4] = self->_patchVersion;
    *((unsigned char *)v4 + 20) |= 4u;
  }
LABEL_5:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
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
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSemVerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_majorVersion];
    [v3 setObject:v7 forKey:@"major_version"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_minorVersion];
  [v3 setObject:v8 forKey:@"minor_version"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    BOOL v5 = [NSNumber numberWithUnsignedInt:self->_patchVersion];
    [v3 setObject:v5 forKey:@"patch_version"];
  }
LABEL_5:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSemVer;
  id v4 = [(SIRINLUEXTERNALSemVer *)&v8 description];
  BOOL v5 = [(SIRINLUEXTERNALSemVer *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPatchVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPatchVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPatchVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_patchVersion = a3;
}

- (BOOL)hasMinorVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMinorVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minorVersion = a3;
}

- (BOOL)hasMajorVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMajorVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_majorVersion = a3;
}

@end