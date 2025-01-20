@interface WFPBRemoteExecutionErrorEvent
- (BOOL)hasDestinationType;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)destinationType;
- (NSString)errorCode;
- (NSString)errorDomain;
- (NSString)key;
- (NSString)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinationType:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBRemoteExecutionErrorEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorCode
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

- (void)setDestinationType:(id)a3
{
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[4]) {
    -[WFPBRemoteExecutionErrorEvent setKey:](self, "setKey:");
  }
  if (v4[5]) {
    -[WFPBRemoteExecutionErrorEvent setSource:](self, "setSource:");
  }
  if (v4[1]) {
    -[WFPBRemoteExecutionErrorEvent setDestinationType:](self, "setDestinationType:");
  }
  if (v4[3]) {
    -[WFPBRemoteExecutionErrorEvent setErrorDomain:](self, "setErrorDomain:");
  }
  if (v4[2]) {
    -[WFPBRemoteExecutionErrorEvent setErrorCode:](self, "setErrorCode:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_source hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_destinationType hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_errorDomain hash];
  return v6 ^ [(NSString *)self->_errorCode hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[4])) || -[NSString isEqual:](key, "isEqual:"))
    && ((source = self->_source, !((unint64_t)source | v4[5]))
     || -[NSString isEqual:](source, "isEqual:"))
    && ((destinationType = self->_destinationType, !((unint64_t)destinationType | v4[1]))
     || -[NSString isEqual:](destinationType, "isEqual:"))
    && ((errorDomain = self->_errorDomain, !((unint64_t)errorDomain | v4[3]))
     || -[NSString isEqual:](errorDomain, "isEqual:")))
  {
    errorCode = self->_errorCode;
    if ((unint64_t)errorCode | v4[2]) {
      char v10 = -[NSString isEqual:](errorCode, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_source copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSString *)self->_destinationType copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_errorCode copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_source)
  {
    objc_msgSend(v5, "setSource:");
    id v4 = v5;
  }
  if (self->_destinationType)
  {
    objc_msgSend(v5, "setDestinationType:");
    id v4 = v5;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    id v4 = v5;
  }
  if (self->_errorCode)
  {
    objc_msgSend(v5, "setErrorCode:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_destinationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRemoteExecutionErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
  }
  destinationType = self->_destinationType;
  if (destinationType) {
    [v4 setObject:destinationType forKey:@"destinationType"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v4 setObject:errorDomain forKey:@"errorDomain"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v4 setObject:errorCode forKey:@"errorCode"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBRemoteExecutionErrorEvent;
  id v4 = [(WFPBRemoteExecutionErrorEvent *)&v8 description];
  id v5 = [(WFPBRemoteExecutionErrorEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasDestinationType
{
  return self->_destinationType != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"RemoteExecutionError";
  }
}

@end