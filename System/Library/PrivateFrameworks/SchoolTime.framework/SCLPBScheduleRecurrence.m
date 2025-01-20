@interface SCLPBScheduleRecurrence
- (BOOL)hasDay;
- (BOOL)hasTimeInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SCLPBTimeInterval)timeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dayAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsDay:(id)a3;
- (int)day;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDay:(int)a3;
- (void)setHasDay:(BOOL)a3;
- (void)setTimeInterval:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCLPBScheduleRecurrence

- (BOOL)hasTimeInterval
{
  return self->_timeInterval != 0;
}

- (int)day
{
  if (*(unsigned char *)&self->_has) {
    return self->_day;
  }
  else {
    return 1;
  }
}

- (void)setDay:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_day = a3;
}

- (void)setHasDay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDay
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)dayAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2648AC8B8[a3 - 1];
  }
  return v3;
}

- (int)StringAsDay:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SCLPBScheduleRecurrence;
  int v4 = [(SCLPBScheduleRecurrence *)&v8 description];
  v5 = [(SCLPBScheduleRecurrence *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  timeInterval = self->_timeInterval;
  if (timeInterval)
  {
    v5 = [(SCLPBTimeInterval *)timeInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeInterval"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = self->_day - 1;
    if (v6 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_day);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_2648AC8B8[v6];
    }
    [v3 setObject:v7 forKey:@"day"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBScheduleRecurrenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timeInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_timeInterval)
  {
    id v5 = v4;
    objc_msgSend(v4, "setTimeInterval:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_day;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SCLPBTimeInterval *)self->_timeInterval copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_day;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  timeInterval = self->_timeInterval;
  if ((unint64_t)timeInterval | *((void *)v4 + 2))
  {
    if (!-[SCLPBTimeInterval isEqual:](timeInterval, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_day == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCLPBTimeInterval *)self->_timeInterval hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_day;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeInterval = self->_timeInterval;
  uint64_t v6 = *((void *)v4 + 2);
  if (timeInterval)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[SCLPBTimeInterval mergeFrom:](timeInterval, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[SCLPBScheduleRecurrence setTimeInterval:](self, "setTimeInterval:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_day = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (SCLPBTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end