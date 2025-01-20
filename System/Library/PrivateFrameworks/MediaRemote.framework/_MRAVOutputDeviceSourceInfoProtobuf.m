@interface _MRAVOutputDeviceSourceInfoProtobuf
- (BOOL)hasMultipleBuiltInDevices;
- (BOOL)hasRoutingContextUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)multipleBuiltInDevices;
- (BOOL)readFrom:(id)a3;
- (NSString)routingContextUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMultipleBuiltInDevices:(BOOL)a3;
- (void)setMultipleBuiltInDevices:(BOOL)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAVOutputDeviceSourceInfoProtobuf

- (void).cxx_destruct
{
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (BOOL)multipleBuiltInDevices
{
  return self->_multipleBuiltInDevices;
}

- (void)setRoutingContextUID:(id)a3
{
}

- (void)setMultipleBuiltInDevices:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_multipleBuiltInDevices = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  routingContextUID = self->_routingContextUID;
  if ((unint64_t)routingContextUID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](routingContextUID, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_multipleBuiltInDevices)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routingContextUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_routingContextUID copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_multipleBuiltInDevices;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)hasRoutingContextUID
{
  return self->_routingContextUID != 0;
}

- (void)setHasMultipleBuiltInDevices:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMultipleBuiltInDevices
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAVOutputDeviceSourceInfoProtobuf;
  id v4 = [(_MRAVOutputDeviceSourceInfoProtobuf *)&v8 description];
  uint64_t v5 = [(_MRAVOutputDeviceSourceInfoProtobuf *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  routingContextUID = self->_routingContextUID;
  if (routingContextUID) {
    [v3 setObject:routingContextUID forKey:@"routingContextUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_multipleBuiltInDevices];
    [v4 setObject:v6 forKey:@"multipleBuiltInDevices"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVOutputDeviceSourceInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_routingContextUID)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setRoutingContextUID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_multipleBuiltInDevices;
    v4[20] |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_routingContextUID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_multipleBuiltInDevices;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    [(_MRAVOutputDeviceSourceInfoProtobuf *)self setRoutingContextUID:"setRoutingContextUID:"];
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_multipleBuiltInDevices = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end