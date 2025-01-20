@interface NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequest
- (BOOL)hasSubCredentialId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)subCredentialId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSubCredentialId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequest

- (BOOL)hasSubCredentialId
{
  return self->_subCredentialId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequest;
  v4 = [(NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequest *)&v8 description];
  v5 = [(NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  subCredentialId = self->_subCredentialId;
  if (subCredentialId) {
    [v3 setObject:subCredentialId forKey:@"subCredentialId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_subCredentialId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  subCredentialId = self->_subCredentialId;
  if (subCredentialId) {
    [a3 setSubCredentialId:subCredentialId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_subCredentialId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    subCredentialId = self->_subCredentialId;
    if ((unint64_t)subCredentialId | v4[1]) {
      char v6 = -[NSString isEqual:](subCredentialId, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_subCredentialId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoGenerateSEEncryptionCertificateForSubCredentialIdRequest setSubCredentialId:](self, "setSubCredentialId:");
  }
}

- (NSString)subCredentialId
{
  return self->_subCredentialId;
}

- (void)setSubCredentialId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end