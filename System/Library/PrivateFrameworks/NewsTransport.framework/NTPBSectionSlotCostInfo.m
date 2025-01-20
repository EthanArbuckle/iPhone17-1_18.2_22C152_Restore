@interface NTPBSectionSlotCostInfo
- (BOOL)hasHeadlineSlotCost;
- (BOOL)hasSectionFooterSlotCost;
- (BOOL)hasSectionTitleSlotCost;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)headlineSlotCost;
- (double)sectionFooterSlotCost;
- (double)sectionTitleSlotCost;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasHeadlineSlotCost:(BOOL)a3;
- (void)setHasSectionFooterSlotCost:(BOOL)a3;
- (void)setHasSectionTitleSlotCost:(BOOL)a3;
- (void)setHeadlineSlotCost:(double)a3;
- (void)setSectionFooterSlotCost:(double)a3;
- (void)setSectionTitleSlotCost:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSectionSlotCostInfo

- (void)setSectionTitleSlotCost:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sectionTitleSlotCost = a3;
}

- (void)setHasSectionTitleSlotCost:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSectionTitleSlotCost
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHeadlineSlotCost:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_headlineSlotCost = a3;
}

- (void)setHasHeadlineSlotCost:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeadlineSlotCost
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSectionFooterSlotCost:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sectionFooterSlotCost = a3;
}

- (void)setHasSectionFooterSlotCost:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSectionFooterSlotCost
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSectionSlotCostInfo;
  v4 = [(NTPBSectionSlotCostInfo *)&v8 description];
  v5 = [(NTPBSectionSlotCostInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_sectionTitleSlotCost];
    [v3 setObject:v7 forKey:@"section_title_slot_cost"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_headlineSlotCost];
  [v3 setObject:v8 forKey:@"headline_slot_cost"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_sectionFooterSlotCost];
    [v3 setObject:v5 forKey:@"section_footer_slot_cost"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSectionSlotCostInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_sectionTitleSlotCost;
    *((unsigned char *)result + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_headlineSlotCost;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = *(void *)&self->_sectionFooterSlotCost;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_sectionTitleSlotCost != *((double *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_headlineSlotCost != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_sectionFooterSlotCost != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double sectionTitleSlotCost = self->_sectionTitleSlotCost;
    double v6 = -sectionTitleSlotCost;
    if (sectionTitleSlotCost >= 0.0) {
      double v6 = self->_sectionTitleSlotCost;
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
    double headlineSlotCost = self->_headlineSlotCost;
    double v11 = -headlineSlotCost;
    if (headlineSlotCost >= 0.0) {
      double v11 = self->_headlineSlotCost;
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
  if ((has & 2) != 0)
  {
    double sectionFooterSlotCost = self->_sectionFooterSlotCost;
    double v16 = -sectionFooterSlotCost;
    if (sectionFooterSlotCost >= 0.0) {
      double v16 = self->_sectionFooterSlotCost;
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
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_double sectionTitleSlotCost = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double headlineSlotCost = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_4:
    self->_double sectionFooterSlotCost = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (double)sectionTitleSlotCost
{
  return self->_sectionTitleSlotCost;
}

- (double)headlineSlotCost
{
  return self->_headlineSlotCost;
}

- (double)sectionFooterSlotCost
{
  return self->_sectionFooterSlotCost;
}

@end