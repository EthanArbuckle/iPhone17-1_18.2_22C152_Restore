@interface AWDCoreRoutinePersistenceStore
- (BOOL)hasMigratorDestroyedStoreReason;
- (BOOL)hasMigratorFailed;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)migratorFailed;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)migratorDestroyedStoreReason;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMigratorDestroyedStoreReason:(BOOL)a3;
- (void)setHasMigratorFailed:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMigratorDestroyedStoreReason:(int)a3;
- (void)setMigratorFailed:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutinePersistenceStore

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

- (void)setMigratorFailed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_migratorFailed = a3;
}

- (void)setHasMigratorFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMigratorFailed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMigratorDestroyedStoreReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_migratorDestroyedStoreReason = a3;
}

- (void)setHasMigratorDestroyedStoreReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMigratorDestroyedStoreReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceStore;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutinePersistenceStore description](&v3, sel_description), -[AWDCoreRoutinePersistenceStore dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithBool:self->_migratorFailed] forKey:@"migratorFailed"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_migratorDestroyedStoreReason] forKey:@"migratorDestroyedStoreReason"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 2) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 4) = self->_migratorDestroyedStoreReason;
      *((unsigned char *)a3 + 24) |= 2u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 20) = self->_migratorFailed;
  *((unsigned char *)a3 + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
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
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 20) = self->_migratorFailed;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_migratorDestroyedStoreReason;
  *((unsigned char *)result + 24) |= 2u;
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
    if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)a3 + 24))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 24) & 4) != 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if ((*((unsigned char *)a3 + 24) & 4) == 0) {
    goto LABEL_19;
  }
  if (self->_migratorFailed)
  {
    if (!*((unsigned char *)a3 + 20)) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (*((unsigned char *)a3 + 20))
  {
LABEL_19:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_migratorDestroyedStoreReason != *((_DWORD *)a3 + 4)) {
      goto LABEL_19;
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
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_migratorFailed;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_migratorDestroyedStoreReason;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 24);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        return;
      }
LABEL_7:
      self->_migratorDestroyedStoreReason = *((_DWORD *)a3 + 4);
      *(unsigned char *)&self->_has |= 2u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_migratorFailed = *((unsigned char *)a3 + 20);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 24) & 2) != 0) {
    goto LABEL_7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)migratorFailed
{
  return self->_migratorFailed;
}

- (int)migratorDestroyedStoreReason
{
  return self->_migratorDestroyedStoreReason;
}

@end