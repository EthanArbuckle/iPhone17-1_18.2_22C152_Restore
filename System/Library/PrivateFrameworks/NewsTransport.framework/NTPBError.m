@interface NTPBError
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBError

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBError;
  v4 = [(NTPBError *)&v8 description];
  v5 = [(NTPBError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:self->_errorCode];
  [v3 setObject:v4 forKey:@"error_code"];

  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"error_message"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_errorMessage) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_errorCode;
  uint64_t v6 = [(NSString *)self->_errorMessage copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_errorCode == *((_DWORD *)v4 + 2))
  {
    errorMessage = self->_errorMessage;
    if ((unint64_t)errorMessage | v4[2]) {
      char v6 = -[NSString isEqual:](errorMessage, "isEqual:");
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
  uint64_t v2 = 2654435761 * self->_errorCode;
  return [(NSString *)self->_errorMessage hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_errorCode = *((_DWORD *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[NTPBError setErrorMessage:](self, "setErrorMessage:");
  }
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end