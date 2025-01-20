@interface AWDCompanionSyncFullSyncDuration
- (BOOL)hasIsMaster;
- (BOOL)hasService;
- (BOOL)hasSyncDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMaster;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)syncDuration;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIsMaster:(BOOL)a3;
- (void)setHasSyncDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsMaster:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSyncDuration:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCompanionSyncFullSyncDuration

- (void)dealloc
{
  [(AWDCompanionSyncFullSyncDuration *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncFullSyncDuration;
  [(AWDCompanionSyncFullSyncDuration *)&v3 dealloc];
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

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setIsMaster:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isMaster = a3;
}

- (void)setHasIsMaster:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsMaster
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSyncDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_syncDuration = a3;
}

- (void)setHasSyncDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSyncDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncFullSyncDuration;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCompanionSyncFullSyncDuration description](&v3, sel_description), -[AWDCompanionSyncFullSyncDuration dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_isMaster] forKey:@"is_master"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_syncDuration] forKey:@"sync_duration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncFullSyncDurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 2u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)a3 + 32) = self->_isMaster;
    *((unsigned char *)a3 + 36) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_syncDuration;
    *((unsigned char *)a3 + 36) |= 1u;
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

  *(void *)(v6 + 24) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_isMaster;
    *(unsigned char *)(v6 + 36) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_syncDuration;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  service = self->_service;
  if ((unint64_t)service | *((void *)a3 + 3))
  {
    int v5 = -[NSString isEqual:](service, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 36) & 4) != 0) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if ((*((unsigned char *)a3 + 36) & 4) == 0) {
    goto LABEL_22;
  }
  if (self->_isMaster)
  {
    if (!*((unsigned char *)a3 + 32)) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 32))
  {
LABEL_22:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_syncDuration != *((void *)a3 + 1)) {
      goto LABEL_22;
    }
    LOBYTE(v5) = 1;
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
  NSUInteger v4 = [(NSString *)self->_service hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_isMaster;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_syncDuration;
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
    -[AWDCompanionSyncFullSyncDuration setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 4) != 0)
  {
    self->_isMaster = *((unsigned char *)a3 + 32);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if (v5)
  {
    self->_syncDuration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)isMaster
{
  return self->_isMaster;
}

- (unint64_t)syncDuration
{
  return self->_syncDuration;
}

@end