@interface SECC2MPError
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasErrorDomain;
- (BOOL)hasUnderlyingError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDescription;
- (NSString)errorDomain;
- (SECC2MPError)underlyingError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setUnderlyingError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);

  objc_storeStrong((id *)&self->_errorDescription, 0);
}

- (void)setUnderlyingError:(id)a3
{
}

- (SECC2MPError)underlyingError
{
  return self->_underlyingError;
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[SECC2MPError setErrorDomain:](self, "setErrorDomain:");
    v4 = v7;
  }
  if (v4[5])
  {
    self->_errorCode = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[SECC2MPError setErrorDescription:](self, "setErrorDescription:");
    v4 = v7;
  }
  underlyingError = self->_underlyingError;
  uint64_t v6 = v4[4];
  if (underlyingError)
  {
    if (v6) {
      -[SECC2MPError mergeFrom:](underlyingError, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SECC2MPError setUnderlyingError:](self, "setUnderlyingError:");
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_errorDescription hash];
  return v5 ^ v6 ^ [(SECC2MPError *)self->_underlyingError hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_errorCode != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_13;
  }
  underlyingError = self->_underlyingError;
  if ((unint64_t)underlyingError | *((void *)v4 + 4)) {
    unsigned __int8 v8 = -[SECC2MPError isEqual:](underlyingError, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_errorCode;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v8 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SECC2MPError *)self->_underlyingError copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_errorDomain)
  {
    [v4 setErrorDomain:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_errorCode;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_errorDescription)
  {
    [v5 setErrorDescription:];
    id v4 = v5;
  }
  if (self->_underlyingError)
  {
    [v5 setUnderlyingError:];
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_underlyingError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_100153C18((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"error_domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = +[NSNumber numberWithLongLong:self->_errorCode];
    [v4 setObject:v6 forKey:@"error_code"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"error_description"];
  }
  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    v9 = [(SECC2MPError *)underlyingError dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"underlying_error"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPError;
  NSUInteger v3 = [(SECC2MPError *)&v7 description];
  id v4 = [(SECC2MPError *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

@end