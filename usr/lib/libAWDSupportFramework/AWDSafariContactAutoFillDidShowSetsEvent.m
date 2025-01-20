@interface AWDSafariContactAutoFillDidShowSetsEvent
- (BOOL)hasIsShowingMeCardSets;
- (BOOL)hasIsShowingPreviouslyCustomizedSet;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShowingMeCardSets;
- (BOOL)isShowingPreviouslyCustomizedSet;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsShowingMeCardSets:(BOOL)a3;
- (void)setHasIsShowingPreviouslyCustomizedSet:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsShowingMeCardSets:(BOOL)a3;
- (void)setIsShowingPreviouslyCustomizedSet:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariContactAutoFillDidShowSetsEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsShowingMeCardSets:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isShowingMeCardSets = a3;
}

- (void)setHasIsShowingMeCardSets:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsShowingMeCardSets
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsShowingPreviouslyCustomizedSet:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isShowingPreviouslyCustomizedSet = a3;
}

- (void)setHasIsShowingPreviouslyCustomizedSet:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsShowingPreviouslyCustomizedSet
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariContactAutoFillDidShowSetsEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariContactAutoFillDidShowSetsEvent description](&v3, sel_description), -[AWDSafariContactAutoFillDidShowSetsEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithBool:self->_isShowingMeCardSets] forKey:@"isShowingMeCardSets"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isShowingPreviouslyCustomizedSet] forKey:@"isShowingPreviouslyCustomizedSet"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariContactAutoFillDidShowSetsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((unsigned char *)a3 + 17) = self->_isShowingPreviouslyCustomizedSet;
      *((unsigned char *)a3 + 20) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 16) = self->_isShowingMeCardSets;
  *((unsigned char *)a3 + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
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
  *((unsigned char *)result + 16) = self->_isShowingMeCardSets;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 17) = self->_isShowingPreviouslyCustomizedSet;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)a3 + 20))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 20) & 2) != 0)
    {
      if (self->_isShowingMeCardSets)
      {
        if (!*((unsigned char *)a3 + 16)) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)a3 + 16)) {
        goto LABEL_15;
      }
    }
LABEL_17:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 20) & 2) != 0) {
    goto LABEL_17;
  }
LABEL_15:
  LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 20) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_isShowingPreviouslyCustomizedSet)
    {
      if (!*((unsigned char *)a3 + 17)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)a3 + 17))
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
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
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isShowingMeCardSets;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isShowingPreviouslyCustomizedSet;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 20);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_isShowingPreviouslyCustomizedSet = *((unsigned char *)a3 + 17);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_isShowingMeCardSets = *((unsigned char *)a3 + 16);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 20) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isShowingMeCardSets
{
  return self->_isShowingMeCardSets;
}

- (BOOL)isShowingPreviouslyCustomizedSet
{
  return self->_isShowingPreviouslyCustomizedSet;
}

@end