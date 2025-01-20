@interface NNMKProtoInitialMessagesSyncFailure
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasMailboxId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDomain;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoInitialMessagesSyncFailure

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoInitialMessagesSyncFailure;
  v4 = [(NNMKProtoInitialMessagesSyncFailure *)&v8 description];
  v5 = [(NNMKProtoInitialMessagesSyncFailure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v4 setObject:errorDomain forKey:@"errorDomain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_errorCode];
    [v4 setObject:v7 forKey:@"errorCode"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoInitialMessagesSyncFailureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mailboxId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mailboxId)
  {
    objc_msgSend(v4, "setMailboxId:");
    id v4 = v5;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_errorCode;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_errorCode;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_errorCode == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mailboxId hash];
  NSUInteger v4 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NNMKProtoInitialMessagesSyncFailure setMailboxId:](self, "setMailboxId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoInitialMessagesSyncFailure setErrorDomain:](self, "setErrorDomain:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_errorCode = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end