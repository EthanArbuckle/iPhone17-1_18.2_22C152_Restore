@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort
- (BOOL)hasClicks;
- (BOOL)hasImpressions;
- (BOOL)hasRawClicks;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)clicks;
- (double)impressions;
- (double)rawClicks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)timestamp;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClicks:(double)a3;
- (void)setHasClicks:(BOOL)a3;
- (void)setHasImpressions:(BOOL)a3;
- (void)setHasRawClicks:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setImpressions:(double)a3;
- (void)setRawClicks:(double)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Paid";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Default";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Paid"];
  }

  return v4;
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

- (void)setTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort;
  int v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    int type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v6 = @"Paid";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = @"Default";
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_clicks];
    [v3 setObject:v9 forKey:@"clicks"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_10;
  }
  v10 = [NSNumber numberWithDouble:self->_impressions];
  [v3 setObject:v10 forKey:@"impressions"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_18:
  v11 = [NSNumber numberWithLongLong:self->_timestamp];
  [v3 setObject:v11 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    v7 = [NSNumber numberWithDouble:self->_rawClicks];
    [v3 setObject:v7 forKey:@"raw_clicks"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 1) = *(void *)&self->_clicks;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)v4 + 2) = *(void *)&self->_impressions;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((void *)v4 + 4) = self->_timestamp;
  *((unsigned char *)v4 + 44) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((void *)v4 + 3) = *(void *)&self->_rawClicks;
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 10) = self->_type;
    *((unsigned char *)result + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_clicks;
  *((unsigned char *)result + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 2) = *(void *)&self->_impressions;
  *((unsigned char *)result + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 4) = self->_timestamp;
  *((unsigned char *)result + 44) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 3) = *(void *)&self->_rawClicks;
  *((unsigned char *)result + 44) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_clicks != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_impressions != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_rawClicks != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double clicks = self->_clicks;
  double v6 = -clicks;
  if (clicks >= 0.0) {
    double v6 = self->_clicks;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    double impressions = self->_impressions;
    double v12 = -impressions;
    if (impressions >= 0.0) {
      double v12 = self->_impressions;
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
  if ((has & 8) != 0)
  {
    uint64_t v15 = 2654435761 * self->_timestamp;
    if ((has & 4) != 0) {
      goto LABEL_21;
    }
LABEL_26:
    unint64_t v20 = 0;
    return v9 ^ v4 ^ v10 ^ v15 ^ v20;
  }
  uint64_t v15 = 0;
  if ((has & 4) == 0) {
    goto LABEL_26;
  }
LABEL_21:
  double rawClicks = self->_rawClicks;
  double v17 = -rawClicks;
  if (rawClicks >= 0.0) {
    double v17 = self->_rawClicks;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  unint64_t v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0) {
      v20 += (unint64_t)v19;
    }
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
  return v9 ^ v4 ^ v10 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double clicks = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_double impressions = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_timestamp = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_6:
    self->_double rawClicks = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
}

- (double)clicks
{
  return self->_clicks;
}

- (double)impressions
{
  return self->_impressions;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (double)rawClicks
{
  return self->_rawClicks;
}

@end