@interface CSLUIPBUIPluginTriggerResponse
- (BOOL)hasErrorString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSString)errorString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorString:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSLUIPBUIPluginTriggerResponse

- (BOOL)hasErrorString
{
  return self->_errorString != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CSLUIPBUIPluginTriggerResponse;
  v4 = [(CSLUIPBUIPluginTriggerResponse *)&v8 description];
  v5 = [(CSLUIPBUIPluginTriggerResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithBool:self->_success];
  [v3 setObject:v4 forKey:@"success"];

  errorString = self->_errorString;
  if (errorString) {
    [v3 setObject:errorString forKey:@"errorString"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CSLUIPBUIPluginTriggerResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_errorString) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 16) = self->_success;
  errorString = self->_errorString;
  if (errorString) {
    [a3 setErrorString:errorString];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 16) = self->_success;
  uint64_t v6 = [(NSString *)self->_errorString copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_success == *((unsigned __int8 *)v4 + 16))
  {
    errorString = self->_errorString;
    if ((unint64_t)errorString | v4[1]) {
      char v6 = -[NSString isEqual:](errorString, "isEqual:");
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
  uint64_t v2 = 2654435761 * self->_success;
  return [(NSString *)self->_errorString hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_success = *((unsigned char *)a3 + 16);
  if (*((void *)a3 + 1)) {
    -[CSLUIPBUIPluginTriggerResponse setErrorString:](self, "setErrorString:");
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

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end