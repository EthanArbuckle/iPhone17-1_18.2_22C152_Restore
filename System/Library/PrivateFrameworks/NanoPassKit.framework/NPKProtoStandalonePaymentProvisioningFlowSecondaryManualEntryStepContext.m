@interface NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext
- (BOOL)allowsAddingDifferentCard;
- (BOOL)hasAllowsAddingDifferentCard;
- (BOOL)hasCredential;
- (BOOL)hasRemoteCredential;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentCredentialUnion)credential;
- (NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext)manualEntryStepContext;
- (NPKProtoStandalonePaymentRemoteCredential)remoteCredential;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowsAddingDifferentCard:(BOOL)a3;
- (void)setCredential:(id)a3;
- (void)setHasAllowsAddingDifferentCard:(BOOL)a3;
- (void)setManualEntryStepContext:(id)a3;
- (void)setRemoteCredential:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext

- (BOOL)hasRemoteCredential
{
  return self->_remoteCredential != 0;
}

- (BOOL)hasCredential
{
  return self->_credential != 0;
}

- (void)setAllowsAddingDifferentCard:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowsAddingDifferentCard = a3;
}

- (void)setHasAllowsAddingDifferentCard:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsAddingDifferentCard
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  manualEntryStepContext = self->_manualEntryStepContext;
  if (manualEntryStepContext)
  {
    v5 = [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)manualEntryStepContext dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"manualEntryStepContext"];
  }
  remoteCredential = self->_remoteCredential;
  if (remoteCredential)
  {
    v7 = [(NPKProtoStandalonePaymentRemoteCredential *)remoteCredential dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"remoteCredential"];
  }
  credential = self->_credential;
  if (credential)
  {
    v9 = [(NPKProtoStandalonePaymentCredentialUnion *)credential dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"credential"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithBool:self->_allowsAddingDifferentCard];
    [v3 setObject:v10 forKey:@"allowsAddingDifferentCard"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_manualEntryStepContext) {
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_remoteCredential) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_credential) {
    PBDataWriterWriteSubmessage();
  }
  v5 = v6;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setManualEntryStepContext:self->_manualEntryStepContext];
  if (self->_remoteCredential) {
    objc_msgSend(v4, "setRemoteCredential:");
  }
  if (self->_credential) {
    objc_msgSend(v4, "setCredential:");
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_allowsAddingDifferentCard;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)self->_manualEntryStepContext copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(NPKProtoStandalonePaymentRemoteCredential *)self->_remoteCredential copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(NPKProtoStandalonePaymentCredentialUnion *)self->_credential copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_allowsAddingDifferentCard;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  manualEntryStepContext = self->_manualEntryStepContext;
  if ((unint64_t)manualEntryStepContext | *((void *)v4 + 2))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext isEqual:](manualEntryStepContext, "isEqual:"))goto LABEL_10; {
  }
    }
  remoteCredential = self->_remoteCredential;
  if ((unint64_t)remoteCredential | *((void *)v4 + 3))
  {
    if (!-[NPKProtoStandalonePaymentRemoteCredential isEqual:](remoteCredential, "isEqual:")) {
      goto LABEL_10;
    }
  }
  credential = self->_credential;
  if ((unint64_t)credential | *((void *)v4 + 1))
  {
    if (!-[NPKProtoStandalonePaymentCredentialUnion isEqual:](credential, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_allowsAddingDifferentCard)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)self->_manualEntryStepContext hash];
  unint64_t v4 = [(NPKProtoStandalonePaymentRemoteCredential *)self->_remoteCredential hash];
  unint64_t v5 = [(NPKProtoStandalonePaymentCredentialUnion *)self->_credential hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_allowsAddingDifferentCard;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  manualEntryStepContext = self->_manualEntryStepContext;
  uint64_t v6 = *((void *)v4 + 2);
  id v11 = v4;
  if (manualEntryStepContext)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext mergeFrom:](manualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext setManualEntryStepContext:](self, "setManualEntryStepContext:");
  }
  id v4 = v11;
LABEL_7:
  remoteCredential = self->_remoteCredential;
  uint64_t v8 = *((void *)v4 + 3);
  if (remoteCredential)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentRemoteCredential mergeFrom:](remoteCredential, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext setRemoteCredential:](self, "setRemoteCredential:");
  }
  id v4 = v11;
LABEL_13:
  credential = self->_credential;
  uint64_t v10 = *((void *)v4 + 1);
  if (credential)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[NPKProtoStandalonePaymentCredentialUnion mergeFrom:](credential, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext setCredential:](self, "setCredential:");
  }
  id v4 = v11;
LABEL_19:
  if (*((unsigned char *)v4 + 36))
  {
    self->_allowsAddingDifferentCard = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext)manualEntryStepContext
{
  return self->_manualEntryStepContext;
}

- (void)setManualEntryStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void)setRemoteCredential:(id)a3
{
}

- (NPKProtoStandalonePaymentCredentialUnion)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (BOOL)allowsAddingDifferentCard
{
  return self->_allowsAddingDifferentCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_manualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext.m", 166, "self->_manualEntryStepContext != nil");
}

@end