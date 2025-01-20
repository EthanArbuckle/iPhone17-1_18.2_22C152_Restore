@interface SIRINLUEXTERNALUtteranceSpan
- (BOOL)hasEndIndex;
- (BOOL)hasEndMilliSeconds;
- (BOOL)hasEndUnicodeScalarIndex;
- (BOOL)hasStartIndex;
- (BOOL)hasStartMilliSeconds;
- (BOOL)hasStartUnicodeScalarIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)endMilliSeconds;
- (int)startMilliSeconds;
- (unint64_t)hash;
- (unsigned)endIndex;
- (unsigned)endUnicodeScalarIndex;
- (unsigned)startIndex;
- (unsigned)startUnicodeScalarIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndIndex:(unsigned int)a3;
- (void)setEndMilliSeconds:(int)a3;
- (void)setEndUnicodeScalarIndex:(unsigned int)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasEndMilliSeconds:(BOOL)a3;
- (void)setHasEndUnicodeScalarIndex:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)setHasStartMilliSeconds:(BOOL)a3;
- (void)setHasStartUnicodeScalarIndex:(BOOL)a3;
- (void)setStartIndex:(unsigned int)a3;
- (void)setStartMilliSeconds:(int)a3;
- (void)setStartUnicodeScalarIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUtteranceSpan

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (unsigned)endUnicodeScalarIndex
{
  return self->_endUnicodeScalarIndex;
}

- (unsigned)startUnicodeScalarIndex
{
  return self->_startUnicodeScalarIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) != 0)
  {
    self->_startIndex = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_endIndex = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_startUnicodeScalarIndex = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_endUnicodeScalarIndex = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_startMilliSeconds = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_7:
    self->_endMilliSeconds = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_8:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_startIndex;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_endIndex;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_startUnicodeScalarIndex;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_endUnicodeScalarIndex;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_startMilliSeconds;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_endMilliSeconds;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_startIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_endIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0 || self->_startUnicodeScalarIndex != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_endUnicodeScalarIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_startMilliSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_endMilliSeconds != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_startIndex;
    *((unsigned char *)result + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_endIndex;
  *((unsigned char *)result + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 7) = self->_startUnicodeScalarIndex;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 4) = self->_endUnicodeScalarIndex;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_startMilliSeconds;
  *((unsigned char *)result + 32) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 3) = self->_endMilliSeconds;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_startIndex;
    *((unsigned char *)v4 + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_endIndex;
  *((unsigned char *)v4 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[7] = self->_startUnicodeScalarIndex;
  *((unsigned char *)v4 + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[4] = self->_endUnicodeScalarIndex;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[6] = self->_startMilliSeconds;
  *((unsigned char *)v4 + 32) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    v4[3] = self->_endMilliSeconds;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_8:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUtteranceSpanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_startIndex];
    [v3 setObject:v7 forKey:@"start_index"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_endIndex];
  [v3 setObject:v8 forKey:@"end_index"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = [NSNumber numberWithUnsignedInt:self->_startUnicodeScalarIndex];
  [v3 setObject:v9 forKey:@"start_unicode_scalar_index"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = [NSNumber numberWithUnsignedInt:self->_endUnicodeScalarIndex];
  [v3 setObject:v10 forKey:@"end_unicode_scalar_index"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = [NSNumber numberWithInt:self->_startMilliSeconds];
  [v3 setObject:v11 forKey:@"start_milli_seconds"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    id v5 = [NSNumber numberWithInt:self->_endMilliSeconds];
    [v3 setObject:v5 forKey:@"end_milli_seconds"];
  }
LABEL_8:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUtteranceSpan;
  id v4 = [(SIRINLUEXTERNALUtteranceSpan *)&v8 description];
  id v5 = [(SIRINLUEXTERNALUtteranceSpan *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEndMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEndMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEndMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endMilliSeconds = a3;
}

- (BOOL)hasStartMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasStartMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setStartMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_startMilliSeconds = a3;
}

- (BOOL)hasEndUnicodeScalarIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEndUnicodeScalarIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setEndUnicodeScalarIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endUnicodeScalarIndex = a3;
}

- (BOOL)hasStartUnicodeScalarIndex
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasStartUnicodeScalarIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setStartUnicodeScalarIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startUnicodeScalarIndex = a3;
}

- (BOOL)hasEndIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEndIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endIndex = a3;
}

- (BOOL)hasStartIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasStartIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startIndex = a3;
}

@end