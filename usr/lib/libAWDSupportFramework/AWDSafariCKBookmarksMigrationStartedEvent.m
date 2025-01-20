@interface AWDSafariCKBookmarksMigrationStartedEvent
- (BOOL)hasLocalState;
- (BOOL)hasMigratorType;
- (BOOL)hasRemoteState;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)migratorTypeAsString:(int)a3;
- (int)StringAsMigratorType:(id)a3;
- (int)migratorType;
- (int64_t)localState;
- (int64_t)remoteState;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocalState:(BOOL)a3;
- (void)setHasMigratorType:(BOOL)a3;
- (void)setHasRemoteState:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLocalState:(int64_t)a3;
- (void)setMigratorType:(int)a3;
- (void)setRemoteState:(int64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariCKBookmarksMigrationStartedEvent

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

- (int)migratorType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_migratorType;
  }
  else {
    return 0;
  }
}

- (void)setMigratorType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_migratorType = a3;
}

- (void)setHasMigratorType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMigratorType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)migratorTypeAsString:(int)a3
{
  if (!a3) {
    return @"PRIMARY_MIGRATOR";
  }
  if (a3 == 1) {
    return @"SECONDARY_MIGRATOR";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsMigratorType:(id)a3
{
  if ([a3 isEqualToString:@"PRIMARY_MIGRATOR"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"SECONDARY_MIGRATOR"];
  }
}

- (void)setLocalState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_localState = a3;
}

- (void)setHasLocalState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocalState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRemoteState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_remoteState = a3;
}

- (void)setHasRemoteState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRemoteState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksMigrationStartedEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariCKBookmarksMigrationStartedEvent description](&v3, sel_description), -[AWDSafariCKBookmarksMigrationStartedEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_14:
      [v3 setObject:[NSNumber numberWithLongLong:self->_localState] forKey:@"localState"];
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  int migratorType = self->_migratorType;
  if (migratorType)
  {
    if (migratorType == 1) {
      v7 = @"SECONDARY_MIGRATOR";
    }
    else {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_migratorType];
    }
  }
  else
  {
    v7 = @"PRIMARY_MIGRATOR";
  }
  [v3 setObject:v7 forKey:@"migratorType"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_4:
  if ((has & 2) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_remoteState] forKey:@"remoteState"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariCKBookmarksMigrationStartedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteInt64Field();
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 2) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_migratorType;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return;
    }
LABEL_9:
    *((void *)a3 + 2) = self->_remoteState;
    *((unsigned char *)a3 + 36) |= 2u;
    return;
  }
LABEL_8:
  *((void *)a3 + 1) = self->_localState;
  *((unsigned char *)a3 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_timestamp;
    *((unsigned char *)result + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_migratorType;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 1) = self->_localState;
  *((unsigned char *)result + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 2) = self->_remoteState;
  *((unsigned char *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_migratorType != *((_DWORD *)a3 + 8)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_21;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_localState != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_remoteState != *((void *)a3 + 2)) {
        goto LABEL_21;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_migratorType;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_localState;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_remoteState;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_int migratorType = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_9:
    self->_remoteState = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_8:
  self->_localState = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 36) & 2) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)localState
{
  return self->_localState;
}

- (int64_t)remoteState
{
  return self->_remoteState;
}

@end