@interface _MRRequestDetailsProtobuf
- (BOOL)hasInitiator;
- (BOOL)hasInitiatorWasInferred;
- (BOOL)hasOriginatingBundleID;
- (BOOL)hasQos;
- (BOOL)hasReason;
- (BOOL)hasRequestID;
- (BOOL)hasStartDate;
- (BOOL)hasUserInitiated;
- (BOOL)initiatorWasInferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userInitiated;
- (NSString)initiator;
- (NSString)originatingBundleID;
- (NSString)reason;
- (NSString)requestID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)startDate;
- (unsigned)qos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInitiatorWasInferred:(BOOL)a3;
- (void)setHasQos:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setHasUserInitiated:(BOOL)a3;
- (void)setInitiator:(id)a3;
- (void)setInitiatorWasInferred:(BOOL)a3;
- (void)setOriginatingBundleID:(id)a3;
- (void)setQos:(unsigned int)a3;
- (void)setReason:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setStartDate:(unint64_t)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRequestDetailsProtobuf

- (BOOL)hasInitiator
{
  return self->_initiator != 0;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)setQos:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_qos = a3;
}

- (void)setHasQos:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQos
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartDate:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserInitiated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_userInitiated = a3;
}

- (void)setHasUserInitiated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserInitiated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInitiatorWasInferred:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_initiatorWasInferred = a3;
}

- (void)setHasInitiatorWasInferred:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInitiatorWasInferred
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasOriginatingBundleID
{
  return self->_originatingBundleID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRequestDetailsProtobuf;
  v4 = [(_MRRequestDetailsProtobuf *)&v8 description];
  v5 = [(_MRRequestDetailsProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  initiator = self->_initiator;
  if (initiator) {
    [v3 setObject:initiator forKey:@"initiator"];
  }
  requestID = self->_requestID;
  if (requestID) {
    [v4 setObject:requestID forKey:@"requestID"];
  }
  reason = self->_reason;
  if (reason) {
    [v4 setObject:reason forKey:@"reason"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_qos];
    [v4 setObject:v12 forKey:@"qos"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v13 = [NSNumber numberWithUnsignedLongLong:self->_startDate];
  [v4 setObject:v13 forKey:@"startDate"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v14 = [NSNumber numberWithBool:self->_userInitiated];
  [v4 setObject:v14 forKey:@"userInitiated"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithBool:self->_initiatorWasInferred];
    [v4 setObject:v9 forKey:@"initiatorWasInferred"];
  }
LABEL_12:
  originatingBundleID = self->_originatingBundleID;
  if (originatingBundleID) {
    [v4 setObject:originatingBundleID forKey:@"originatingBundleID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRequestDetailsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_initiator)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
  if (self->_originatingBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_initiator)
  {
    objc_msgSend(v4, "setInitiator:");
    id v4 = v6;
  }
  if (self->_requestID)
  {
    objc_msgSend(v6, "setRequestID:");
    id v4 = v6;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_qos;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 1) = self->_startDate;
  *((unsigned char *)v4 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  *((unsigned char *)v4 + 57) = self->_userInitiated;
  *((unsigned char *)v4 + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 56) = self->_initiatorWasInferred;
    *((unsigned char *)v4 + 60) |= 4u;
  }
LABEL_12:
  if (self->_originatingBundleID)
  {
    objc_msgSend(v6, "setOriginatingBundleID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_initiator copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_requestID copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_reason copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_qos;
    *(unsigned char *)(v5 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v5 + 57) = self->_userInitiated;
      *(unsigned char *)(v5 + 60) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_startDate;
  *(unsigned char *)(v5 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 56) = self->_initiatorWasInferred;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
LABEL_6:
  uint64_t v13 = [(NSString *)self->_originatingBundleID copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  initiator = self->_initiator;
  if ((unint64_t)initiator | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](initiator, "isEqual:")) {
      goto LABEL_30;
    }
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_30;
    }
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](reason, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_qos != *((_DWORD *)v4 + 8)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_startDate != *((void *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0) {
      goto LABEL_30;
    }
    if (self->_userInitiated)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_36;
    }
LABEL_30:
    char v8 = 0;
    goto LABEL_31;
  }
  if ((*((unsigned char *)v4 + 60) & 4) == 0) {
    goto LABEL_30;
  }
  if (!self->_initiatorWasInferred)
  {
    if (!*((unsigned char *)v4 + 56)) {
      goto LABEL_36;
    }
    goto LABEL_30;
  }
  if (!*((unsigned char *)v4 + 56)) {
    goto LABEL_30;
  }
LABEL_36:
  originatingBundleID = self->_originatingBundleID;
  if ((unint64_t)originatingBundleID | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](originatingBundleID, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_initiator hash];
  NSUInteger v4 = [(NSString *)self->_requestID hash];
  NSUInteger v5 = [(NSString *)self->_reason hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_qos;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v7 = 2654435761u * self->_startDate;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_originatingBundleID hash];
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_userInitiated;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_initiatorWasInferred;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_originatingBundleID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MRRequestDetailsProtobuf setInitiator:](self, "setInitiator:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[_MRRequestDetailsProtobuf setRequestID:](self, "setRequestID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[_MRRequestDetailsProtobuf setReason:](self, "setReason:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_qos = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_startDate = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  self->_userInitiated = *((unsigned char *)v4 + 57);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
LABEL_11:
    self->_initiatorWasInferred = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((void *)v4 + 3))
  {
    -[_MRRequestDetailsProtobuf setOriginatingBundleID:](self, "setOriginatingBundleID:");
    id v4 = v6;
  }
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (unsigned)qos
{
  return self->_qos;
}

- (unint64_t)startDate
{
  return self->_startDate;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (BOOL)initiatorWasInferred
{
  return self->_initiatorWasInferred;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setOriginatingBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);

  objc_storeStrong((id *)&self->_initiator, 0);
}

@end