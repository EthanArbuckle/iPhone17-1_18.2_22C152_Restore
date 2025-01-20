@interface NPKProtoCarKeyAccountAttestationRequest
- (BOOL)hasCredentialData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)credentialData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyAccountAttestationRequest

- (BOOL)hasCredentialData
{
  return self->_credentialData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyAccountAttestationRequest;
  v4 = [(NPKProtoCarKeyAccountAttestationRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyAccountAttestationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  credentialData = self->_credentialData;
  if (credentialData) {
    [v3 setObject:credentialData forKey:@"credentialData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyAccountAttestationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_credentialData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  credentialData = self->_credentialData;
  if (credentialData) {
    [a3 setCredentialData:credentialData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_credentialData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    credentialData = self->_credentialData;
    if ((unint64_t)credentialData | v4[1]) {
      char v6 = -[NSData isEqual:](credentialData, "isEqual:");
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
  return [(NSData *)self->_credentialData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoCarKeyAccountAttestationRequest setCredentialData:](self, "setCredentialData:");
  }
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end