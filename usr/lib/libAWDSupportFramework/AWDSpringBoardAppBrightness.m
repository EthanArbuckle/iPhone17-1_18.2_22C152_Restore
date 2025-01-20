@interface AWDSpringBoardAppBrightness
- (BOOL)hasAppBundleID;
- (BOOL)hasBrightness;
- (BOOL)hasDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)brightness;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setBrightness:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasBrightness:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardAppBrightness

- (void)dealloc
{
  [(AWDSpringBoardAppBrightness *)self setAppBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardAppBrightness;
  [(AWDSpringBoardAppBrightness *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleID
{
  return self->_appBundleID != 0;
}

- (void)setBrightness:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_brightness = a3;
}

- (void)setHasBrightness:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBrightness
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardAppBrightness;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardAppBrightness description](&v3, sel_description), -[AWDSpringBoardAppBrightness dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  appBundleID = self->_appBundleID;
  if (appBundleID) {
    [v3 setObject:appBundleID forKey:@"appBundleID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_brightness] forKey:@"brightness"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardAppBrightnessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_appBundleID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 4u;
  }
  if (self->_appBundleID) {
    [a3 setAppBundleID:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_brightness;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_duration;
    *((unsigned char *)a3 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 4u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_appBundleID copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_brightness;
    *(unsigned char *)(v6 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_duration;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    appBundleID = self->_appBundleID;
    if ((unint64_t)appBundleID | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](appBundleID, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_brightness != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_duration != *((void *)a3 + 2)) {
        goto LABEL_19;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_appBundleID hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = 2654435761u * self->_brightness;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_duration;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 40) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDSpringBoardAppBrightness setAppBundleID:](self, "setAppBundleID:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if (v5)
  {
    self->_brightness = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_duration = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (unint64_t)brightness
{
  return self->_brightness;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end