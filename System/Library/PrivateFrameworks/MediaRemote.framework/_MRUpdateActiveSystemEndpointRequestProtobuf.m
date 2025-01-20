@interface _MRUpdateActiveSystemEndpointRequestProtobuf
- (BOOL)demoteWhenSyncingToCompanion;
- (BOOL)hasChangeType;
- (BOOL)hasDemoteWhenSyncingToCompanion;
- (BOOL)hasDisableDuration;
- (BOOL)hasOutputDeviceUID;
- (BOOL)hasPairedDeviceSync;
- (BOOL)hasReason;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)pairedDeviceSync;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceUID;
- (NSString)reason;
- (double)disableDuration;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChangeType:(id)a3;
- (int)changeType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3;
- (void)setDisableDuration:(double)a3;
- (void)setHasChangeType:(BOOL)a3;
- (void)setHasDemoteWhenSyncingToCompanion:(BOOL)a3;
- (void)setHasDisableDuration:(BOOL)a3;
- (void)setHasPairedDeviceSync:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setPairedDeviceSync:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRUpdateActiveSystemEndpointRequestProtobuf

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (int)changeType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_changeType;
  }
  else {
    return 0;
  }
}

- (void)setChangeType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChangeType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)changeTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Deferrable";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Immediate";
  }
  return v4;
}

- (int)StringAsChangeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Immediate"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Deferrable"];
  }

  return v4;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)setPairedDeviceSync:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_pairedDeviceSync = a3;
}

- (void)setHasPairedDeviceSync:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPairedDeviceSync
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDisableDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_disableDuration = a3;
}

- (void)setHasDisableDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisableDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_demoteWhenSyncingToCompanion = a3;
}

- (void)setHasDemoteWhenSyncingToCompanion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDemoteWhenSyncingToCompanion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRUpdateActiveSystemEndpointRequestProtobuf;
  int v4 = [(_MRUpdateActiveSystemEndpointRequestProtobuf *)&v8 description];
  v5 = [(_MRUpdateActiveSystemEndpointRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int changeType = self->_changeType;
    if (changeType)
    {
      if (changeType == 1)
      {
        v7 = @"Deferrable";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_changeType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"Immediate";
    }
    [v4 setObject:v7 forKey:@"changeType"];
  }
  reason = self->_reason;
  if (reason) {
    [v4 setObject:reason forKey:@"reason"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_pairedDeviceSync];
    [v4 setObject:v12 forKey:@"pairedDeviceSync"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_14:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_14;
  }
  v13 = [NSNumber numberWithUnsignedLongLong:self->_type];
  [v4 setObject:v13 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_22:
  v14 = [NSNumber numberWithDouble:self->_disableDuration];
  [v4 setObject:v14 forKey:@"disableDuration"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    v10 = [NSNumber numberWithBool:self->_demoteWhenSyncingToCompanion];
    [v4 setObject:v10 forKey:@"demoteWhenSyncingToCompanion"];
  }
LABEL_17:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateActiveSystemEndpointRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_changeType;
    *((unsigned char *)v4 + 52) |= 4u;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 49) = self->_pairedDeviceSync;
    *((unsigned char *)v4 + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 2) = self->_type;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  *((void *)v4 + 1) = *(void *)&self->_disableDuration;
  *((unsigned char *)v4 + 52) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 48) = self->_demoteWhenSyncingToCompanion;
    *((unsigned char *)v4 + 52) |= 8u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_changeType;
    *(unsigned char *)(v5 + 52) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_reason copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 49) = self->_pairedDeviceSync;
    *(unsigned char *)(v5 + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v5 + 8) = self->_disableDuration;
      *(unsigned char *)(v5 + 52) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v5 + 16) = self->_type;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 48) = self->_demoteWhenSyncingToCompanion;
    *(unsigned char *)(v5 + 52) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](outputDeviceUID, "isEqual:")) {
      goto LABEL_32;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_changeType != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](reason, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_32;
    }
    if (self->_pairedDeviceSync)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_disableDuration != *((double *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_32;
  }
  BOOL v8 = (*((unsigned char *)v4 + 52) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) != 0)
    {
      if (self->_demoteWhenSyncingToCompanion)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_32;
      }
      BOOL v8 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v8 = 0;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_outputDeviceUID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_changeType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_reason hash];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v8 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v13 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = 2654435761 * self->_pairedDeviceSync;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_type;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double disableDuration = self->_disableDuration;
  double v10 = -disableDuration;
  if (disableDuration >= 0.0) {
    double v10 = self->_disableDuration;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_16:
  if ((has & 8) != 0) {
    uint64_t v14 = 2654435761 * self->_demoteWhenSyncingToCompanion;
  }
  else {
    uint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[_MRUpdateActiveSystemEndpointRequestProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    self->_int changeType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[_MRUpdateActiveSystemEndpointRequestProtobuf setReason:](self, "setReason:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_pairedDeviceSync = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_type = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_double disableDuration = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
LABEL_11:
    self->_demoteWhenSyncingToCompanion = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)pairedDeviceSync
{
  return self->_pairedDeviceSync;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)disableDuration
{
  return self->_disableDuration;
}

- (BOOL)demoteWhenSyncingToCompanion
{
  return self->_demoteWhenSyncingToCompanion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end