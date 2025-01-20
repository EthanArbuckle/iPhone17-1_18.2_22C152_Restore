@interface NTPBScoringCohort
- (BOOL)hasClicks;
- (BOOL)hasIdentifier;
- (BOOL)hasImpressions;
- (BOOL)hasRawClicks;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (double)clicks;
- (double)impressions;
- (double)rawClicks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClicks:(double)a3;
- (void)setHasClicks:(BOOL)a3;
- (void)setHasImpressions:(BOOL)a3;
- (void)setHasRawClicks:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpressions:(double)a3;
- (void)setRawClicks:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBScoringCohort

- (void)dealloc
{
  [(NTPBScoringCohort *)self setIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoringCohort;
  [(NTPBScoringCohort *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setClicks:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clicks = a3;
}

- (void)setHasClicks:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClicks
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRawClicks:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rawClicks = a3;
}

- (void)setHasRawClicks:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRawClicks
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setImpressions:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_impressions = a3;
}

- (void)setHasImpressions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasImpressions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoringCohort;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBScoringCohort description](&v3, sel_description), -[NTPBScoringCohort dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_rawClicks), @"raw_clicks");
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v4;
    }
    goto LABEL_6;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_clicks), @"clicks");
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_impressions), @"impressions");
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoringCohortReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_8;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteDoubleField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 32) = [(NSString *)self->_identifier copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 24) = self->_rawClicks;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_clicks;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_impressions;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_clicks != *((double *)a3 + 1)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)a3 + 40))
      {
LABEL_18:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_rawClicks != *((double *)a3 + 3)) {
          goto LABEL_18;
        }
      }
      else if ((*((unsigned char *)a3 + 40) & 4) != 0)
      {
        goto LABEL_18;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 2) == 0;
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_impressions != *((double *)a3 + 2)) {
          goto LABEL_18;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double clicks = self->_clicks;
    double v7 = -clicks;
    if (clicks >= 0.0) {
      double v7 = self->_clicks;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 4) != 0)
  {
    double rawClicks = self->_rawClicks;
    double v12 = -rawClicks;
    if (rawClicks >= 0.0) {
      double v12 = self->_rawClicks;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 2) != 0)
  {
    double impressions = self->_impressions;
    double v17 = -impressions;
    if (impressions >= 0.0) {
      double v17 = self->_impressions;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[NTPBScoringCohort setIdentifier:](self, "setIdentifier:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if (v5)
  {
    self->_double clicks = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        return;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_double rawClicks = *((double *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 40) & 2) == 0) {
    return;
  }
LABEL_6:
  self->_double impressions = *((double *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)clicks
{
  return self->_clicks;
}

- (double)rawClicks
{
  return self->_rawClicks;
}

- (double)impressions
{
  return self->_impressions;
}

@end