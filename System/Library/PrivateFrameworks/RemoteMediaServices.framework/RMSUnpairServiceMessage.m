@interface RMSUnpairServiceMessage
- (BOOL)hasService;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (RMSServiceMessage)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setService:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSUnpairServiceMessage

- (BOOL)hasService
{
  return self->_service != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSUnpairServiceMessage;
  v4 = [(RMSUnpairServiceMessage *)&v8 description];
  v5 = [(RMSUnpairServiceMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  service = self->_service;
  if (service)
  {
    v5 = [(RMSServiceMessage *)service dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"service"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSUnpairServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_service) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  service = self->_service;
  if (service) {
    [a3 setService:service];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(RMSServiceMessage *)self->_service copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    service = self->_service;
    if ((unint64_t)service | v4[1]) {
      char v6 = -[RMSServiceMessage isEqual:](service, "isEqual:");
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
  return [(RMSServiceMessage *)self->_service hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  service = self->_service;
  uint64_t v6 = v4[1];
  if (service)
  {
    if (v6) {
      -[RMSServiceMessage mergeFrom:](service, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[RMSUnpairServiceMessage setService:](self, "setService:");
  }
  MEMORY[0x270F9A758]();
}

- (RMSServiceMessage)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end