@interface SIRINLUINTERNALCompareOptions
- (BOOL)caseInsensitive;
- (BOOL)diacriticInsensitive;
- (BOOL)hasCaseInsensitive;
- (BOOL)hasDiacriticInsensitive;
- (BOOL)hasWidthInsensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)widthInsensitive;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaseInsensitive:(BOOL)a3;
- (void)setDiacriticInsensitive:(BOOL)a3;
- (void)setHasCaseInsensitive:(BOOL)a3;
- (void)setHasDiacriticInsensitive:(BOOL)a3;
- (void)setHasWidthInsensitive:(BOOL)a3;
- (void)setWidthInsensitive:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCompareOptions

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if (v5)
  {
    self->_caseInsensitive = v4[8];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[12];
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[12] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_diacriticInsensitive = v4[9];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[12] & 4) != 0)
  {
LABEL_4:
    self->_widthInsensitive = v4[10];
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
  uint64_t v2 = 2654435761 * self->_caseInsensitive;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_diacriticInsensitive;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_widthInsensitive;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_20;
    }
    if (self->_caseInsensitive)
    {
      if (!v4[8]) {
        goto LABEL_20;
      }
    }
    else if (v4[8])
    {
      goto LABEL_20;
    }
  }
  else if (v4[12])
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_diacriticInsensitive)
    {
      if (!v4[9]) {
        goto LABEL_20;
      }
    }
    else if (v4[9])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v5 = (v4[12] & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_widthInsensitive)
      {
        if (!v4[10]) {
          goto LABEL_20;
        }
      }
      else if (v4[10])
      {
        goto LABEL_20;
      }
      BOOL v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v5 = 0;
  }
LABEL_21:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 8) = self->_caseInsensitive;
    *((unsigned char *)result + 12) |= 1u;
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
  *((unsigned char *)result + 9) = self->_diacriticInsensitive;
  *((unsigned char *)result + 12) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 10) = self->_widthInsensitive;
  *((unsigned char *)result + 12) |= 4u;
  return result;
}

- (void)copyTo:(id)a3
{
  uint64_t v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_caseInsensitive;
    v4[12] |= 1u;
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
  v4[9] = self->_diacriticInsensitive;
  v4[12] |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[10] = self->_widthInsensitive;
    v4[12] |= 4u;
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
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCompareOptionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithBool:self->_caseInsensitive];
    [v3 setObject:v7 forKey:@"case_insensitive"];

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
  v8 = [NSNumber numberWithBool:self->_diacriticInsensitive];
  [v3 setObject:v8 forKey:@"diacritic_insensitive"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    BOOL v5 = [NSNumber numberWithBool:self->_widthInsensitive];
    [v3 setObject:v5 forKey:@"width_insensitive"];
  }
LABEL_5:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCompareOptions;
  id v4 = [(SIRINLUINTERNALCompareOptions *)&v8 description];
  BOOL v5 = [(SIRINLUINTERNALCompareOptions *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasWidthInsensitive
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasWidthInsensitive:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setWidthInsensitive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_widthInsensitive = a3;
}

- (BOOL)widthInsensitive
{
  return (*(unsigned char *)&self->_has & 4) != 0 && self->_widthInsensitive;
}

- (BOOL)hasDiacriticInsensitive
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDiacriticInsensitive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDiacriticInsensitive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_diacriticInsensitive = a3;
}

- (BOOL)diacriticInsensitive
{
  return (*(unsigned char *)&self->_has & 2) != 0 && self->_diacriticInsensitive;
}

- (BOOL)hasCaseInsensitive
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCaseInsensitive:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCaseInsensitive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_caseInsensitive = a3;
}

- (BOOL)caseInsensitive
{
  return (*(unsigned char *)&self->_has & 1) == 0 || self->_caseInsensitive;
}

@end