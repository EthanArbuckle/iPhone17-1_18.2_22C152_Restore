@interface AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonsAsString:(int)a3;
- (int)StringAsReasons:(id)a3;
- (int)reasonAtIndex:(unint64_t)a3;
- (int)reasons;
- (unint64_t)hash;
- (unint64_t)reasonsCount;
- (unint64_t)timestamp;
- (void)addReason:(int)a3;
- (void)clearReasons;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setReasons:(int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent;
  [(AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent *)&v3 dealloc];
}

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

- (unint64_t)reasonsCount
{
  return self->_reasons.count;
}

- (int)reasons
{
  return self->_reasons.list;
}

- (void)clearReasons
{
}

- (void)addReason:(int)a3
{
}

- (int)reasonAtIndex:(unint64_t)a3
{
  p_reasons = &self->_reasons;
  unint64_t count = self->_reasons.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_reasons->list[a3];
}

- (void)setReasons:(int *)a3 count:(unint64_t)a4
{
}

- (id)reasonsAsString:(int)a3
{
  if (a3 >= 9) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA018[a3];
  }
}

- (int)StringAsReasons:(id)a3
{
  if ([a3 isEqualToString:@"SIGNED_OUT_OF_ICLOUD_OR_ACCOUNT_IS_MAID"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"EXCLUDED_FROM_MIGRATION_RAMP"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"STILL_IN_GRACE_PERIOD"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"INELIGIBLE_MAC_OR_IOS_DEVICE_IN_CLOUD_TABS"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"INELIGIBLE_WINDOWS_DEVICE"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"WINDOWS_INFO_NOT_AVAILABLE"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"INELIGIBLE_DEVICE_IN_ACCOUNT_LIST"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"CLOUD_TAB_DEVICES_OUT_OF_DATE"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"SAFARI_SYNC_DISABLED"]) {
    return 8;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent description](&v3, sel_description), -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  p_reasons = &self->_reasons;
  if (self->_reasons.count)
  {
    v5 = [MEMORY[0x263EFF980] arrayWithCapacity:];
    if (p_reasons->count)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = p_reasons->list[v6];
        if (v7 >= 9) {
          v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", p_reasons->list[v6]];
        }
        else {
          v8 = off_2641BA018[v7];
        }
        [v5 addObject:v8];
        ++v6;
      }
      while (v6 < p_reasons->count);
    }
    [v3 setObject:v5 forKey:@"reason"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariUnableToSilentlyMigrateToCKBookmarksEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  p_reasons = &self->_reasons;
  if (p_reasons->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_reasons->count);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if ([(AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent *)self reasonsCount])
  {
    [a3 clearReasons];
    unint64_t v5 = [(AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent *)self reasonsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addReason:-[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent reasonAtIndex:](self, "reasonAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_opt_class() allocWithZone:a3];
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 32) = self->_timestamp;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 40))
  {
    return 0;
  }

  return PBRepeatedInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 reasonsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent addReason:](self, "addReason:", [a3 reasonAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end