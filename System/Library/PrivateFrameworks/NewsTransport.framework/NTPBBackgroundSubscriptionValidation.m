@interface NTPBBackgroundSubscriptionValidation
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)hasResultType;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorCode;
- (NSString)errorMessage;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)resultType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setResultType:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBackgroundSubscriptionValidation

- (int)resultType
{
  if (*(unsigned char *)&self->_has) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBackgroundSubscriptionValidation;
  v4 = [(NTPBBackgroundSubscriptionValidation *)&v8 description];
  v5 = [(NTPBBackgroundSubscriptionValidation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_resultType];
    [v3 setObject:v4 forKey:@"result_type"];
  }
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"error_message"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v3 setObject:errorCode forKey:@"error_code"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBackgroundSubscriptionValidationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_errorMessage)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_resultType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_errorMessage copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_errorCode copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_resultType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((void *)v4 + 2)
    && !-[NSString isEqual:](errorMessage, "isEqual:"))
  {
    goto LABEL_13;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:")) {
      goto LABEL_13;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_resultType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_errorMessage hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_errorCode hash];
  return v4 ^ v5 ^ [(NSString *)self->_sourceChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[10])
  {
    self->_resultType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBBackgroundSubscriptionValidation setErrorMessage:](self, "setErrorMessage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBBackgroundSubscriptionValidation setErrorCode:](self, "setErrorCode:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBBackgroundSubscriptionValidation setSourceChannelId:](self, "setSourceChannelId:");
    NSUInteger v4 = v5;
  }
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);

  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end