@interface NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequest
- (BOOL)hasCredentialIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)credentialIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)credentialType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequest

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequest;
  v4 = [(NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequest *)&v8 description];
  v5 = [(NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_credentialType];
  [v3 setObject:v4 forKey:@"credentialType"];

  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier) {
    [v3 setObject:credentialIdentifier forKey:@"credentialIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt64Field();
  if (self->_credentialIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_credentialType;
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier) {
    [a3 setCredentialIdentifier:credentialIdentifier];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_credentialType;
  uint64_t v6 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_credentialType == v4[1])
  {
    credentialIdentifier = self->_credentialIdentifier;
    if ((unint64_t)credentialIdentifier | v4[2]) {
      char v6 = -[NSString isEqual:](credentialIdentifier, "isEqual:");
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
  uint64_t v2 = 2654435761 * self->_credentialType;
  return [(NSString *)self->_credentialIdentifier hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_credentialType = *((void *)a3 + 1);
  if (*((void *)a3 + 2)) {
    -[NPKProtoProvisionPassForRemoteCredentialWithTypeAndIdentifierRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
  }
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end