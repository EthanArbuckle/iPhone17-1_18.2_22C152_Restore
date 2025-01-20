@interface NPKProtoLongTermPrivacyKeyRequest
- (BOOL)hasReuseExisting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)reuseExisting;
- (NSString)credentialGroupIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialGroupIdentifier:(id)a3;
- (void)setHasReuseExisting:(BOOL)a3;
- (void)setReuseExisting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoLongTermPrivacyKeyRequest

- (void)setReuseExisting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reuseExisting = a3;
}

- (void)setHasReuseExisting:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReuseExisting
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoLongTermPrivacyKeyRequest;
  v4 = [(NPKProtoLongTermPrivacyKeyRequest *)&v8 description];
  v5 = [(NPKProtoLongTermPrivacyKeyRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  credentialGroupIdentifier = self->_credentialGroupIdentifier;
  if (credentialGroupIdentifier) {
    [v3 setObject:credentialGroupIdentifier forKey:@"credentialGroupIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_reuseExisting];
    [v4 setObject:v6 forKey:@"reuseExisting"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoLongTermPrivacyKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_credentialGroupIdentifier) {
    -[NPKProtoLongTermPrivacyKeyRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setCredentialGroupIdentifier:self->_credentialGroupIdentifier];
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_reuseExisting;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_credentialGroupIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_reuseExisting;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  credentialGroupIdentifier = self->_credentialGroupIdentifier;
  if ((unint64_t)credentialGroupIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](credentialGroupIdentifier, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_reuseExisting)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_credentialGroupIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_reuseExisting;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NPKProtoLongTermPrivacyKeyRequest setCredentialGroupIdentifier:](self, "setCredentialGroupIdentifier:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_reuseExisting = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)credentialGroupIdentifier
{
  return self->_credentialGroupIdentifier;
}

- (void)setCredentialGroupIdentifier:(id)a3
{
}

- (BOOL)reuseExisting
{
  return self->_reuseExisting;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoLongTermPrivacyKeyRequest writeTo:]", "NPKProtoLongTermPrivacyKeyRequest.m", 96, "nil != self->_credentialGroupIdentifier");
}

@end