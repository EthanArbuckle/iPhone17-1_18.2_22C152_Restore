@interface AWDSpringBoardSwitcherToAppTransition
- (BOOL)hasAbsoluteDistanceInList;
- (BOOL)hasIsGoingToHomeScreen;
- (BOOL)hasSwitcherName;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGoingToHomeScreen;
- (BOOL)readFrom:(id)a3;
- (NSString)switcherName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)absoluteDistanceInList;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteDistanceInList:(unint64_t)a3;
- (void)setHasAbsoluteDistanceInList:(BOOL)a3;
- (void)setHasIsGoingToHomeScreen:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsGoingToHomeScreen:(BOOL)a3;
- (void)setSwitcherName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardSwitcherToAppTransition

- (void)dealloc
{
  [(AWDSpringBoardSwitcherToAppTransition *)self setSwitcherName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSwitcherToAppTransition;
  [(AWDSpringBoardSwitcherToAppTransition *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSwitcherName
{
  return self->_switcherName != 0;
}

- (void)setAbsoluteDistanceInList:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteDistanceInList = a3;
}

- (void)setHasAbsoluteDistanceInList:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteDistanceInList
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsGoingToHomeScreen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isGoingToHomeScreen = a3;
}

- (void)setHasIsGoingToHomeScreen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsGoingToHomeScreen
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSwitcherToAppTransition;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardSwitcherToAppTransition description](&v3, sel_description), -[AWDSpringBoardSwitcherToAppTransition dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  switcherName = self->_switcherName;
  if (switcherName) {
    [v3 setObject:switcherName forKey:@"switcherName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_absoluteDistanceInList] forKey:@"absoluteDistanceInList"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_isGoingToHomeScreen] forKey:@"isGoingToHomeScreen"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSwitcherToAppTransitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_switcherName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 2u;
  }
  if (self->_switcherName) {
    [a3 setSwitcherName:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_absoluteDistanceInList;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)a3 + 32) = self->_isGoingToHomeScreen;
    *((unsigned char *)a3 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 2u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_switcherName copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_absoluteDistanceInList;
    *(unsigned char *)(v6 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_isGoingToHomeScreen;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_17;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
      goto LABEL_17;
    }
    switcherName = self->_switcherName;
    if ((unint64_t)switcherName | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](switcherName, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_absoluteDistanceInList != *((void *)a3 + 1)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0)
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_isGoingToHomeScreen)
      {
        if (!*((unsigned char *)a3 + 32)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)a3 + 32))
      {
        goto LABEL_17;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_switcherName hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = 2654435761u * self->_absoluteDistanceInList;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isGoingToHomeScreen;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDSpringBoardSwitcherToAppTransition setSwitcherName:](self, "setSwitcherName:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if (v5)
  {
    self->_absoluteDistanceInList = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if ((v5 & 4) != 0)
  {
    self->_isGoingToHomeScreen = *((unsigned char *)a3 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)switcherName
{
  return self->_switcherName;
}

- (void)setSwitcherName:(id)a3
{
}

- (unint64_t)absoluteDistanceInList
{
  return self->_absoluteDistanceInList;
}

- (BOOL)isGoingToHomeScreen
{
  return self->_isGoingToHomeScreen;
}

@end