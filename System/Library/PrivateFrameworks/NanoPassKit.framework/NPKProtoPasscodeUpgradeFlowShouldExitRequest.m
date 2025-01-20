@interface NPKProtoPasscodeUpgradeFlowShouldExitRequest
- (BOOL)hasErrorData;
- (BOOL)hasPasscodeChanged;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)passcodeChanged;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPasscodeChanged:(BOOL)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPasscodeChanged:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPasscodeUpgradeFlowShouldExitRequest

- (void)setPasscodeChanged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passcodeChanged = a3;
}

- (void)setHasPasscodeChanged:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPasscodeChanged
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPasscodeUpgradeFlowShouldExitRequest;
  v4 = [(NPKProtoPasscodeUpgradeFlowShouldExitRequest *)&v8 description];
  v5 = [(NPKProtoPasscodeUpgradeFlowShouldExitRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_passcodeChanged];
    [v3 setObject:v4 forKey:@"passcodeChanged"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v6 forKey:@"pending"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPasscodeUpgradeFlowShouldExitRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_passcodeChanged;
    v4[20] |= 1u;
  }
  if (self->_errorData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setErrorData:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[17] = self->_pending;
    v4[20] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_passcodeChanged;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_errorData copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 17) = self->_pending;
    *(unsigned char *)(v6 + 20) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_15;
    }
    if (self->_passcodeChanged)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_15;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:")) {
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_15;
        }
      }
      else if (*((unsigned char *)v4 + 17))
      {
        goto LABEL_15;
      }
      BOOL v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_passcodeChanged;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_errorData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[20])
  {
    self->_passcodeChanged = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NPKProtoPasscodeUpgradeFlowShouldExitRequest setErrorData:](self, "setErrorData:");
    uint64_t v4 = v5;
  }
  if ((v4[20] & 2) != 0)
  {
    self->_pending = v4[17];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)passcodeChanged
{
  return self->_passcodeChanged;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (BOOL)pending
{
  return self->_pending;
}

- (void).cxx_destruct
{
}

@end