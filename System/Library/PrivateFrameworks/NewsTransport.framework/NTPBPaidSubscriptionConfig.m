@interface NTPBPaidSubscriptionConfig
- (BOOL)hasMaxGroupSizeIPad;
- (BOOL)hasMaxGroupSizeIPhone;
- (BOOL)hasMaxTimesHeadlineInGroup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)maxGroupSizeIPad;
- (int64_t)maxGroupSizeIPhone;
- (int64_t)maxTimesHeadlineInGroup;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxGroupSizeIPad:(BOOL)a3;
- (void)setHasMaxGroupSizeIPhone:(BOOL)a3;
- (void)setHasMaxTimesHeadlineInGroup:(BOOL)a3;
- (void)setMaxGroupSizeIPad:(int64_t)a3;
- (void)setMaxGroupSizeIPhone:(int64_t)a3;
- (void)setMaxTimesHeadlineInGroup:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaidSubscriptionConfig

- (int64_t)maxGroupSizeIPad
{
  if (*(unsigned char *)&self->_has) {
    return self->_maxGroupSizeIPad;
  }
  else {
    return 5;
  }
}

- (void)setMaxGroupSizeIPad:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxGroupSizeIPad = a3;
}

- (void)setHasMaxGroupSizeIPad:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxGroupSizeIPad
{
  return *(unsigned char *)&self->_has & 1;
}

- (int64_t)maxGroupSizeIPhone
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_maxGroupSizeIPhone;
  }
  else {
    return 5;
  }
}

- (void)setMaxGroupSizeIPhone:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxGroupSizeIPhone = a3;
}

- (void)setHasMaxGroupSizeIPhone:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxGroupSizeIPhone
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int64_t)maxTimesHeadlineInGroup
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_maxTimesHeadlineInGroup;
  }
  else {
    return 7;
  }
}

- (void)setMaxTimesHeadlineInGroup:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxTimesHeadlineInGroup = a3;
}

- (void)setHasMaxTimesHeadlineInGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxTimesHeadlineInGroup
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPaidSubscriptionConfig;
  v4 = [(NTPBPaidSubscriptionConfig *)&v8 description];
  v5 = [(NTPBPaidSubscriptionConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_maxGroupSizeIPad];
    [v3 setObject:v7 forKey:@"max_group_size_iPad"];

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
  objc_super v8 = [NSNumber numberWithLongLong:self->_maxGroupSizeIPhone];
  [v3 setObject:v8 forKey:@"max_group_size_iPhone"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_maxTimesHeadlineInGroup];
    [v3 setObject:v5 forKey:@"max_times_headline_in_group"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
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
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_maxGroupSizeIPad;
    *((unsigned char *)result + 32) |= 1u;
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
  *((void *)result + 2) = self->_maxGroupSizeIPhone;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 3) = self->_maxTimesHeadlineInGroup;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_maxGroupSizeIPad != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_maxGroupSizeIPhone != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_maxTimesHeadlineInGroup != *((void *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
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
  uint64_t v2 = 2654435761 * self->_maxGroupSizeIPad;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_maxGroupSizeIPhone;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_maxTimesHeadlineInGroup;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_maxGroupSizeIPad = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_maxGroupSizeIPhone = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_4:
    self->_maxTimesHeadlineInGroup = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

@end