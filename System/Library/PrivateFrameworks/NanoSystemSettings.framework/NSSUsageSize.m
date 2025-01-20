@interface NSSUsageSize
- (BOOL)hasDocsAndData;
- (BOOL)hasFixed;
- (BOOL)hasPurgeable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)docsAndData;
- (unint64_t)fixed;
- (unint64_t)hash;
- (unint64_t)purgeable;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDocsAndData:(unint64_t)a3;
- (void)setFixed:(unint64_t)a3;
- (void)setHasDocsAndData:(BOOL)a3;
- (void)setHasFixed:(BOOL)a3;
- (void)setHasPurgeable:(BOOL)a3;
- (void)setPurgeable:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageSize

- (void)setFixed:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fixed = a3;
}

- (void)setHasFixed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFixed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDocsAndData:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_docsAndData = a3;
}

- (void)setHasDocsAndData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDocsAndData
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPurgeable:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_purgeable = a3;
}

- (void)setHasPurgeable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPurgeable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageSize;
  v4 = [(NSSUsageSize *)&v8 description];
  v5 = [(NSSUsageSize *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_fixed];
    [v3 setObject:v7 forKey:@"fixed"];

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
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_docsAndData];
  [v3 setObject:v8 forKey:@"docsAndData"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_purgeable];
    [v3 setObject:v5 forKey:@"purgeable"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
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
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_fixed;
    *((unsigned char *)v4 + 32) |= 2u;
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
  v4[1] = self->_docsAndData;
  *((unsigned char *)v4 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_purgeable;
    *((unsigned char *)v4 + 32) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_fixed;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_docsAndData;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 3) = self->_purgeable;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_fixed != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_docsAndData != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_purgeable != *((void *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_fixed;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_docsAndData;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_purgeable;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_fixed = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_docsAndData = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_4:
    self->_purgeable = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unint64_t)fixed
{
  return self->_fixed;
}

- (unint64_t)docsAndData
{
  return self->_docsAndData;
}

- (unint64_t)purgeable
{
  return self->_purgeable;
}

@end