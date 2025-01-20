@interface NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse
- (BOOL)encrypted;
- (BOOL)hasEncrypted;
- (BOOL)hasErrorData;
- (BOOL)hasServiceProviderData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSData)serviceProviderData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncrypted:(BOOL)a3;
- (void)setErrorData:(id)a3;
- (void)setHasEncrypted:(BOOL)a3;
- (void)setServiceProviderData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse

- (BOOL)hasServiceProviderData
{
  return self->_serviceProviderData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (void)setEncrypted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_encrypted = a3;
}

- (void)setHasEncrypted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEncrypted
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse;
  v4 = [(NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse *)&v8 description];
  v5 = [(NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  serviceProviderData = self->_serviceProviderData;
  if (serviceProviderData) {
    [v3 setObject:serviceProviderData forKey:@"serviceProviderData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_encrypted];
    [v4 setObject:v7 forKey:@"encrypted"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceProviderData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceProviderData)
  {
    objc_msgSend(v4, "setServiceProviderData:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_encrypted;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_serviceProviderData copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_encrypted;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  serviceProviderData = self->_serviceProviderData;
  if ((unint64_t)serviceProviderData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](serviceProviderData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_encrypted)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_serviceProviderData hash];
  uint64_t v4 = [(NSData *)self->_errorData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_encrypted;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse setServiceProviderData:](self, "setServiceProviderData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse setErrorData:](self, "setErrorData:");
    uint64_t v4 = v5;
  }
  if (v4[28])
  {
    self->_encrypted = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end