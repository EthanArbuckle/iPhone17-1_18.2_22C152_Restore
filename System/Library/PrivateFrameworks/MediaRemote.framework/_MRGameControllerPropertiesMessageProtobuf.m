@interface _MRGameControllerPropertiesMessageProtobuf
- (BOOL)hasControllerID;
- (BOOL)hasProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRGameControllerPropertiesProtobuf)properties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)controllerID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setControllerID:(unint64_t)a3;
- (void)setHasControllerID:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerPropertiesMessageProtobuf

- (void)setControllerID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_controllerID = a3;
}

- (void)setHasControllerID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasControllerID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProperties
{
  return self->_properties != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerPropertiesMessageProtobuf;
  v4 = [(_MRGameControllerPropertiesMessageProtobuf *)&v8 description];
  v5 = [(_MRGameControllerPropertiesMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_controllerID];
    [v3 setObject:v4 forKey:@"controllerID"];
  }
  properties = self->_properties;
  if (properties)
  {
    v6 = [(_MRGameControllerPropertiesProtobuf *)properties dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"properties"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerPropertiesMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_properties)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_controllerID;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_properties)
  {
    id v5 = v4;
    objc_msgSend(v4, "setProperties:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_controllerID;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(_MRGameControllerPropertiesProtobuf *)self->_properties copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_controllerID != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 2)) {
    char v6 = -[_MRGameControllerPropertiesProtobuf isEqual:](properties, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_controllerID;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(_MRGameControllerPropertiesProtobuf *)self->_properties hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[3])
  {
    self->_controllerID = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  properties = self->_properties;
  uint64_t v7 = v5[2];
  if (properties)
  {
    if (v7) {
      -[_MRGameControllerPropertiesProtobuf mergeFrom:](properties, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[_MRGameControllerPropertiesMessageProtobuf setProperties:](self, "setProperties:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)controllerID
{
  return self->_controllerID;
}

- (_MRGameControllerPropertiesProtobuf)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end