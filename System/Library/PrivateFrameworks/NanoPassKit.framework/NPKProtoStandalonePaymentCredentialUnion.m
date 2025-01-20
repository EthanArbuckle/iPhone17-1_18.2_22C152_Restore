@interface NPKProtoStandalonePaymentCredentialUnion
- (BOOL)hasCreditAccountCredential;
- (BOOL)hasFlowIdentifier;
- (BOOL)hasRemoteCredential;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneCreditAccountCredential)creditAccountCredential;
- (NPKProtoStandalonePaymentRemoteCredential)remoteCredential;
- (NSString)flowIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreditAccountCredential:(id)a3;
- (void)setFlowIdentifier:(id)a3;
- (void)setRemoteCredential:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentCredentialUnion

- (BOOL)hasFlowIdentifier
{
  return self->_flowIdentifier != 0;
}

- (BOOL)hasRemoteCredential
{
  return self->_remoteCredential != 0;
}

- (BOOL)hasCreditAccountCredential
{
  return self->_creditAccountCredential != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentCredentialUnion;
  v4 = [(NPKProtoStandalonePaymentCredentialUnion *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentCredentialUnion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  flowIdentifier = self->_flowIdentifier;
  if (flowIdentifier) {
    [v3 setObject:flowIdentifier forKey:@"flowIdentifier"];
  }
  remoteCredential = self->_remoteCredential;
  if (remoteCredential)
  {
    v7 = [(NPKProtoStandalonePaymentRemoteCredential *)remoteCredential dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"remoteCredential"];
  }
  creditAccountCredential = self->_creditAccountCredential;
  if (creditAccountCredential)
  {
    v9 = [(NPKProtoStandaloneCreditAccountCredential *)creditAccountCredential dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"creditAccountCredential"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentCredentialUnionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_flowIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_remoteCredential)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_creditAccountCredential)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_flowIdentifier)
  {
    objc_msgSend(v4, "setFlowIdentifier:");
    id v4 = v5;
  }
  if (self->_remoteCredential)
  {
    objc_msgSend(v5, "setRemoteCredential:");
    id v4 = v5;
  }
  if (self->_creditAccountCredential)
  {
    objc_msgSend(v5, "setCreditAccountCredential:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_flowIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NPKProtoStandalonePaymentRemoteCredential *)self->_remoteCredential copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NPKProtoStandaloneCreditAccountCredential *)self->_creditAccountCredential copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((flowIdentifier = self->_flowIdentifier, !((unint64_t)flowIdentifier | v4[2]))
     || -[NSString isEqual:](flowIdentifier, "isEqual:"))
    && ((remoteCredential = self->_remoteCredential, !((unint64_t)remoteCredential | v4[3]))
     || -[NPKProtoStandalonePaymentRemoteCredential isEqual:](remoteCredential, "isEqual:")))
  {
    creditAccountCredential = self->_creditAccountCredential;
    if ((unint64_t)creditAccountCredential | v4[1]) {
      char v8 = -[NPKProtoStandaloneCreditAccountCredential isEqual:](creditAccountCredential, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_flowIdentifier hash];
  unint64_t v4 = [(NPKProtoStandalonePaymentRemoteCredential *)self->_remoteCredential hash] ^ v3;
  return v4 ^ [(NPKProtoStandaloneCreditAccountCredential *)self->_creditAccountCredential hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[NPKProtoStandalonePaymentCredentialUnion setFlowIdentifier:](self, "setFlowIdentifier:");
    unint64_t v4 = v9;
  }
  remoteCredential = self->_remoteCredential;
  uint64_t v6 = v4[3];
  if (remoteCredential)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoStandalonePaymentRemoteCredential mergeFrom:](remoteCredential, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoStandalonePaymentCredentialUnion setRemoteCredential:](self, "setRemoteCredential:");
  }
  unint64_t v4 = v9;
LABEL_9:
  creditAccountCredential = self->_creditAccountCredential;
  uint64_t v8 = v4[1];
  if (creditAccountCredential)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[NPKProtoStandaloneCreditAccountCredential mergeFrom:](creditAccountCredential, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[NPKProtoStandalonePaymentCredentialUnion setCreditAccountCredential:](self, "setCreditAccountCredential:");
  }
  unint64_t v4 = v9;
LABEL_15:
}

- (NSString)flowIdentifier
{
  return self->_flowIdentifier;
}

- (void)setFlowIdentifier:(id)a3
{
}

- (NPKProtoStandalonePaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void)setRemoteCredential:(id)a3
{
}

- (NPKProtoStandaloneCreditAccountCredential)creditAccountCredential
{
  return self->_creditAccountCredential;
}

- (void)setCreditAccountCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_flowIdentifier, 0);
  objc_storeStrong((id *)&self->_creditAccountCredential, 0);
}

@end