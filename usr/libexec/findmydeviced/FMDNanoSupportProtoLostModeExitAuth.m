@interface FMDNanoSupportProtoLostModeExitAuth
- (BOOL)errorOccurred;
- (BOOL)hasLostModeExitAuthToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)lostModeExitAuthToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorOccurred:(BOOL)a3;
- (void)setLostModeExitAuthToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMDNanoSupportProtoLostModeExitAuth

- (BOOL)hasLostModeExitAuthToken
{
  return self->_lostModeExitAuthToken != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMDNanoSupportProtoLostModeExitAuth;
  v3 = [(FMDNanoSupportProtoLostModeExitAuth *)&v7 description];
  v4 = [(FMDNanoSupportProtoLostModeExitAuth *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_errorOccurred];
  [v3 setObject:v4 forKey:@"error_occurred"];

  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if (lostModeExitAuthToken) {
    [v3 setObject:lostModeExitAuthToken forKey:@"lostModeExitAuthToken"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoLostModeExitAuthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_lostModeExitAuthToken) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 16) = self->_errorOccurred;
  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if (lostModeExitAuthToken) {
    [a3 setLostModeExitAuthToken:lostModeExitAuthToken];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v5[16] = self->_errorOccurred;
  id v6 = [(NSString *)self->_lostModeExitAuthToken copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  if (self->_errorOccurred)
  {
    if (*((unsigned char *)v4 + 16)) {
      goto LABEL_4;
    }
LABEL_7:
    unsigned __int8 v6 = 0;
    goto LABEL_8;
  }
  if (*((unsigned char *)v4 + 16)) {
    goto LABEL_7;
  }
LABEL_4:
  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if ((unint64_t)lostModeExitAuthToken | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSString isEqual:](lostModeExitAuthToken, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_8:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_errorOccurred;
  return [(NSString *)self->_lostModeExitAuthToken hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_errorOccurred = *((unsigned char *)a3 + 16);
  if (*((void *)a3 + 1)) {
    -[FMDNanoSupportProtoLostModeExitAuth setLostModeExitAuthToken:](self, "setLostModeExitAuthToken:");
  }
}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->_errorOccurred = a3;
}

- (NSString)lostModeExitAuthToken
{
  return self->_lostModeExitAuthToken;
}

- (void)setLostModeExitAuthToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end