@interface SIRINLUEXTERNALUUID
- (BOOL)hasHighInt;
- (BOOL)hasLowInt;
- (BOOL)hasNamespaceA;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)namespaceAAsString:(int)a3;
- (int)StringAsNamespaceA:(id)a3;
- (int)namespaceA;
- (unint64_t)hash;
- (unint64_t)highInt;
- (unint64_t)lowInt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHighInt:(BOOL)a3;
- (void)setHasLowInt:(BOOL)a3;
- (void)setHasNamespaceA:(BOOL)a3;
- (void)setHighInt:(unint64_t)a3;
- (void)setLowInt:(unint64_t)a3;
- (void)setNamespaceA:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUUID

- (void)setLowInt:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lowInt = a3;
}

- (void)setHighInt:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_highInt = a3;
}

- (unint64_t)lowInt
{
  return self->_lowInt;
}

- (unint64_t)highInt
{
  return self->_highInt;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_highInt = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_lowInt = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_namespaceA = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_highInt;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_lowInt;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_namespaceA;
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_highInt != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_lowInt != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_namespaceA != *((_DWORD *)v4 + 6)) {
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
    *((void *)result + 1) = self->_highInt;
    *((unsigned char *)result + 28) |= 1u;
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
  *((void *)result + 2) = self->_lowInt;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 6) = self->_namespaceA;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_highInt;
    *((unsigned char *)v4 + 28) |= 1u;
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
  v4[2] = self->_lowInt;
  *((unsigned char *)v4 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 6) = self->_namespaceA;
    *((unsigned char *)v4 + 28) |= 4u;
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
    PBDataWriterWriteUint64Field();
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
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUUIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    id v6 = [NSNumber numberWithUnsignedLongLong:self->_lowInt];
    [v3 setObject:v6 forKey:@"low_int"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    uint64_t namespaceA = self->_namespaceA;
    if (namespaceA >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_namespaceA);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E6578E20[namespaceA];
    }
    [v3 setObject:v8 forKey:@"namespace_a"];

    goto LABEL_11;
  }
  BOOL v5 = [NSNumber numberWithUnsignedLongLong:self->_highInt];
  [v3 setObject:v5 forKey:@"high_int"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_11:
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUUID;
  id v4 = [(SIRINLUEXTERNALUUID *)&v8 description];
  BOOL v5 = [(SIRINLUEXTERNALUUID *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsNamespaceA:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UUID_NAMESPACE_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTITY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TASK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYSTEM_DIALOG_ACT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NLU_REQUEST_ID"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ASR_HYPOTHESIS_ID"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)namespaceAAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578E20[a3];
  }
  return v3;
}

- (BOOL)hasNamespaceA
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNamespaceA:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNamespaceA:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t namespaceA = a3;
}

- (int)namespaceA
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_namespaceA;
  }
  else {
    return 0;
  }
}

- (BOOL)hasLowInt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLowInt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHighInt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasHighInt:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

@end