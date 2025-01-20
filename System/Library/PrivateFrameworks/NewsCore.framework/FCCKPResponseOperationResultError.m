@interface FCCKPResponseOperationResultError
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPResponseOperationResultError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_extensionError, 0);
  objc_storeStrong((id *)&self->_errorKey, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_clientError, 0);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPResponseOperationResultError;
  v4 = [(FCCKPResponseOperationResultError *)&v8 description];
  v5 = [(FCCKPResponseOperationResultError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  clientError = self->_clientError;
  if (clientError)
  {
    v5 = [(FCCKPResponseOperationResultErrorClient *)clientError dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"clientError"];
  }
  serverError = self->_serverError;
  if (serverError)
  {
    v7 = [(FCCKPResponseOperationResultErrorServer *)serverError dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"serverError"];
  }
  extensionError = self->_extensionError;
  if (extensionError)
  {
    v9 = [(FCCKPResponseOperationResultErrorExtension *)extensionError dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"extensionError"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithInt:self->_retryAfterSeconds];
    [v3 setObject:v10 forKey:@"retryAfterSeconds"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }
  errorKey = self->_errorKey;
  if (errorKey) {
    [v3 setObject:errorKey forKey:@"errorKey"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPResponseOperationResultErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_serverError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_extensionError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPResponseOperationResultErrorClient *)self->_clientError copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(FCCKPResponseOperationResultErrorServer *)self->_serverError copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_retryAfterSeconds;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_errorKey copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  id v14 = [(FCCKPResponseOperationResultErrorExtension *)self->_extensionError copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  clientError = self->_clientError;
  if ((unint64_t)clientError | *((void *)v4 + 1))
  {
    if (!-[FCCKPResponseOperationResultErrorClient isEqual:](clientError, "isEqual:")) {
      goto LABEL_17;
    }
  }
  serverError = self->_serverError;
  if ((unint64_t)serverError | *((void *)v4 + 6))
  {
    if (!-[FCCKPResponseOperationResultErrorServer isEqual:](serverError, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_retryAfterSeconds != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_17;
  }
  errorKey = self->_errorKey;
  if ((unint64_t)errorKey | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorKey, "isEqual:")) {
      goto LABEL_17;
    }
  }
  extensionError = self->_extensionError;
  if ((unint64_t)extensionError | *((void *)v4 + 4)) {
    char v10 = -[FCCKPResponseOperationResultErrorExtension isEqual:](extensionError, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPResponseOperationResultErrorClient *)self->_clientError hash];
  unint64_t v4 = [(FCCKPResponseOperationResultErrorServer *)self->_serverError hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_retryAfterSeconds;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_errorDescription hash];
  NSUInteger v7 = [(NSString *)self->_errorKey hash];
  return v6 ^ v7 ^ [(FCCKPResponseOperationResultErrorExtension *)self->_extensionError hash];
}

@end