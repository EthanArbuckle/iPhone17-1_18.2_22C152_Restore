@interface NPKProtoRevokeShareForPassIdentifierResponse
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRevokeShareForPassIdentifierResponse

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRevokeShareForPassIdentifierResponse;
  v4 = [(NPKProtoRevokeShareForPassIdentifierResponse *)&v8 description];
  v5 = [(NPKProtoRevokeShareForPassIdentifierResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithBool:self->_success];
  [v3 setObject:v4 forKey:@"success"];

  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRevokeShareForPassIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 16) = self->_success;
  errorData = self->_errorData;
  if (errorData) {
    [a3 setErrorData:errorData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 16) = self->_success;
  uint64_t v6 = [(NSData *)self->_errorData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  if (self->_success)
  {
    if (*((unsigned char *)v4 + 16)) {
      goto LABEL_4;
    }
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  if (*((unsigned char *)v4 + 16)) {
    goto LABEL_7;
  }
LABEL_4:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1)) {
    char v6 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_8:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_success;
  return [(NSData *)self->_errorData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_success = *((unsigned char *)a3 + 16);
  if (*((void *)a3 + 1)) {
    -[NPKProtoRevokeShareForPassIdentifierResponse setErrorData:](self, "setErrorData:");
  }
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end