@interface NTPBAbsolutePersonalizedSectionPresenceConfig
- (BOOL)hasCTRToHide;
- (BOOL)hasCTRToShow;
- (BOOL)hasMinProbabilityToShow;
- (BOOL)hasSectionEdition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)cTRToHide;
- (double)cTRToShow;
- (double)minProbabilityToShow;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)sectionEdition;
- (void)mergeFrom:(id)a3;
- (void)setCTRToHide:(double)a3;
- (void)setCTRToShow:(double)a3;
- (void)setHasCTRToHide:(BOOL)a3;
- (void)setHasCTRToShow:(BOOL)a3;
- (void)setHasMinProbabilityToShow:(BOOL)a3;
- (void)setHasSectionEdition:(BOOL)a3;
- (void)setMinProbabilityToShow:(double)a3;
- (void)setSectionEdition:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAbsolutePersonalizedSectionPresenceConfig

- (void)setCTRToShow:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cTRToShow = a3;
}

- (void)setHasCTRToShow:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCTRToShow
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCTRToHide:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cTRToHide = a3;
}

- (void)setHasCTRToHide:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCTRToHide
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinProbabilityToShow:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minProbabilityToShow = a3;
}

- (void)setHasMinProbabilityToShow:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinProbabilityToShow
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSectionEdition:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sectionEdition = a3;
}

- (void)setHasSectionEdition:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSectionEdition
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAbsolutePersonalizedSectionPresenceConfig;
  v4 = [(NTPBAbsolutePersonalizedSectionPresenceConfig *)&v8 description];
  v5 = [(NTPBAbsolutePersonalizedSectionPresenceConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_cTRToShow];
    [v3 setObject:v7 forKey:@"CTR_to_show"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_cTRToHide];
  [v3 setObject:v8 forKey:@"CTR_to_hide"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [NSNumber numberWithDouble:self->_minProbabilityToShow];
  [v3 setObject:v9 forKey:@"min_probability_to_show"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_sectionEdition];
    [v3 setObject:v5 forKey:@"section_edition"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAbsolutePersonalizedSectionPresenceConfigReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_cTRToShow;
    *((unsigned char *)result + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_cTRToHide;
  *((unsigned char *)result + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 3) = *(void *)&self->_minProbabilityToShow;
  *((unsigned char *)result + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 4) = self->_sectionEdition;
  *((unsigned char *)result + 40) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_cTRToShow != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_cTRToHide != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_minProbabilityToShow != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_sectionEdition != *((void *)v4 + 4)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double cTRToShow = self->_cTRToShow;
    double v6 = -cTRToShow;
    if (cTRToShow >= 0.0) {
      double v6 = self->_cTRToShow;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double cTRToHide = self->_cTRToHide;
    double v11 = -cTRToHide;
    if (cTRToHide >= 0.0) {
      double v11 = self->_cTRToHide;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    double minProbabilityToShow = self->_minProbabilityToShow;
    double v16 = -minProbabilityToShow;
    if (minProbabilityToShow >= 0.0) {
      double v16 = self->_minProbabilityToShow;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 8) != 0) {
    unint64_t v19 = 2654435761u * self->_sectionEdition;
  }
  else {
    unint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_double cTRToShow = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double cTRToHide = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double minProbabilityToShow = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_5:
    self->_sectionEdition = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (double)cTRToShow
{
  return self->_cTRToShow;
}

- (double)cTRToHide
{
  return self->_cTRToHide;
}

- (double)minProbabilityToShow
{
  return self->_minProbabilityToShow;
}

- (unint64_t)sectionEdition
{
  return self->_sectionEdition;
}

@end