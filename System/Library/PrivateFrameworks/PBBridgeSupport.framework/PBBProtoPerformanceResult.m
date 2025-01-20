@interface PBBProtoPerformanceResult
+ (void)initialize;
- (BOOL)hasActivityType;
- (BOOL)hasIdentifier;
- (BOOL)hasTimeDelta;
- (BOOL)hasTimeEnded;
- (BOOL)hasTimeStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activityType;
- (NSString)identifier;
- (double)timeDelta;
- (double)timeEnded;
- (double)timeStarted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)detailedDescription;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setHasTimeDelta:(BOOL)a3;
- (void)setHasTimeEnded:(BOOL)a3;
- (void)setHasTimeStarted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setTimeDelta:(double)a3;
- (void)setTimeEnded:(double)a3;
- (void)setTimeStarted:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoPerformanceResult

+ (void)initialize
{
  InstanceMethod = class_getInstanceMethod((Class)a1, sel_description);
  v4 = class_getInstanceMethod((Class)a1, sel_detailedDescription);
  method_exchangeImplementations(InstanceMethod, v4);
}

- (id)detailedDescription
{
  return (id)[NSString stringWithFormat:@"< %p Activity: %@ (%@), time delta: %f (%f / %f)>", self, self->_activityType, self->_identifier, *(void *)&self->_timeDelta, *(void *)&self->_timeStarted, *(void *)&self->_timeEnded];
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setTimeDelta:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeDelta = a3;
}

- (void)setHasTimeDelta:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeDelta
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeStarted:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timeStarted = a3;
}

- (void)setHasTimeStarted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeStarted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimeEnded:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timeEnded = a3;
}

- (void)setHasTimeEnded:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeEnded
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoPerformanceResult;
  v4 = [(PBBProtoPerformanceResult *)&v8 description];
  v5 = [(PBBProtoPerformanceResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  activityType = self->_activityType;
  if (activityType) {
    [v3 setObject:activityType forKey:@"activityType"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithDouble:self->_timeDelta];
    [v4 setObject:v10 forKey:@"timeDelta"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v11 = [NSNumber numberWithDouble:self->_timeStarted];
  [v4 setObject:v11 forKey:@"timeStarted"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithDouble:self->_timeEnded];
    [v4 setObject:v8 forKey:@"timeEnded"];
  }
LABEL_9:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoPerformanceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_activityType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_activityType)
  {
    objc_msgSend(v4, "setActivityType:");
    id v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeDelta;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 3) = *(void *)&self->_timeStarted;
  *((unsigned char *)v4 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    *((void *)v4 + 2) = *(void *)&self->_timeEnded;
    *((unsigned char *)v4 + 48) |= 2u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_activityType copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 24) = self->_timeStarted;
    *(unsigned char *)(v5 + 48) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_timeDelta;
  *(unsigned char *)(v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_timeEnded;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:")) {
      goto LABEL_20;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timeDelta != *((double *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_timeStarted != *((double *)v4 + 3)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_timeEnded != *((double *)v4 + 2)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_activityType hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double timeDelta = self->_timeDelta;
    double v8 = -timeDelta;
    if (timeDelta >= 0.0) {
      double v8 = self->_timeDelta;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0)
  {
    double timeStarted = self->_timeStarted;
    double v13 = -timeStarted;
    if (timeStarted >= 0.0) {
      double v13 = self->_timeStarted;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 2) != 0)
  {
    double timeEnded = self->_timeEnded;
    double v18 = -timeEnded;
    if (timeEnded >= 0.0) {
      double v18 = self->_timeEnded;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[PBBProtoPerformanceResult setActivityType:](self, "setActivityType:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[PBBProtoPerformanceResult setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_double timeDelta = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if (((_BYTE)v4[6] & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_double timeStarted = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  if (((_BYTE)v4[6] & 2) != 0)
  {
LABEL_8:
    self->_double timeEnded = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_9:
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)timeDelta
{
  return self->_timeDelta;
}

- (double)timeStarted
{
  return self->_timeStarted;
}

- (double)timeEnded
{
  return self->_timeEnded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end