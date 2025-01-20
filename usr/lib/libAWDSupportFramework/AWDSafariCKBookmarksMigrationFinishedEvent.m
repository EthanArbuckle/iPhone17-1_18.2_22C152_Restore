@interface AWDSafariCKBookmarksMigrationFinishedEvent
- (BOOL)hasDuration;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasMigratorType;
- (BOOL)hasResult;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorCode;
- (NSString)errorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)migratorTypeAsString:(int)a3;
- (id)resultAsString:(int)a3;
- (int)StringAsMigratorType:(id)a3;
- (int)StringAsResult:(id)a3;
- (int)migratorType;
- (int)result;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasMigratorType:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMigratorType:(int)a3;
- (void)setResult:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariCKBookmarksMigrationFinishedEvent

- (void)dealloc
{
  [(AWDSafariCKBookmarksMigrationFinishedEvent *)self setErrorDomain:0];
  [(AWDSafariCKBookmarksMigrationFinishedEvent *)self setErrorCode:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksMigrationFinishedEvent;
  [(AWDSafariCKBookmarksMigrationFinishedEvent *)&v3 dealloc];
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

- (int)migratorType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_migratorType;
  }
  else {
    return 0;
  }
}

- (void)setMigratorType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_migratorType = a3;
}

- (void)setHasMigratorType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMigratorType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)result
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_result;
  }
  else {
    return 0;
  }
}

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)resultAsString:(int)a3
{
  if (!a3) {
    return @"MIGRATION_SUCCESSFUL";
  }
  if (a3 == 1) {
    return @"MIGRATION_FAILED";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsResult:(id)a3
{
  if ([a3 isEqualToString:@"MIGRATION_SUCCESSFUL"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"MIGRATION_FAILED"];
  }
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksMigrationFinishedEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariCKBookmarksMigrationFinishedEvent description](&v3, sel_description), -[AWDSafariCKBookmarksMigrationFinishedEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  int migratorType = self->_migratorType;
  if (migratorType)
  {
    if (migratorType == 1) {
      v6 = @"SECONDARY_MIGRATOR";
    }
    else {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_migratorType];
    }
  }
  else
  {
    v6 = @"PRIMARY_MIGRATOR";
  }
  [v3 setObject:v6 forKey:@"migratorType"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  int v7 = self->_result;
  if (v7)
  {
    if (v7 == 1) {
      v8 = @"MIGRATION_FAILED";
    }
    else {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_result];
    }
  }
  else
  {
    v8 = @"MIGRATION_SUCCESSFUL";
  }
  [v3 setObject:v8 forKey:@"result"];
LABEL_20:
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v3 setObject:errorCode forKey:@"errorCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariCKBookmarksMigrationFinishedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_migratorType;
  *((unsigned char *)a3 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  *((void *)a3 + 1) = self->_duration;
  *((unsigned char *)a3 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 11) = self->_result;
    *((unsigned char *)a3 + 48) |= 8u;
  }
LABEL_6:
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  if (self->_errorCode)
  {
    [a3 setErrorCode:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 8) = self->_duration;
      *(unsigned char *)(v5 + 48) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_migratorType;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 44) = self->_result;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
LABEL_6:

  *(void *)(v6 + 32) = [(NSString *)self->_errorDomain copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_errorCode copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_migratorType != *((_DWORD *)a3 + 10)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_26;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_result != *((_DWORD *)a3 + 11)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_26;
    }
    errorDomain = self->_errorDomain;
    if (!((unint64_t)errorDomain | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
    {
      errorCode = self->_errorCode;
      if ((unint64_t)errorCode | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSString isEqual:](errorCode, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_migratorType;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_duration;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_result;
LABEL_10:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_errorDomain hash];
  return v7 ^ [(NSString *)self->_errorCode hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int migratorType = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  self->_duration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
LABEL_5:
    self->_result = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((void *)a3 + 4)) {
    -[AWDSafariCKBookmarksMigrationFinishedEvent setErrorDomain:](self, "setErrorDomain:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDSafariCKBookmarksMigrationFinishedEvent setErrorCode:](self, "setErrorCode:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

@end