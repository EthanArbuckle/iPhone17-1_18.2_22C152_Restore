@interface _MRRegisterGameControllerMessageProtobuf
- (BOOL)hasProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRGameControllerPropertiesProtobuf)properties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProperties:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRegisterGameControllerMessageProtobuf

- (BOOL)hasProperties
{
  return self->_properties != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRegisterGameControllerMessageProtobuf;
  v4 = [(_MRRegisterGameControllerMessageProtobuf *)&v8 description];
  v5 = [(_MRRegisterGameControllerMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  properties = self->_properties;
  if (properties)
  {
    v5 = [(_MRGameControllerPropertiesProtobuf *)properties dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"properties"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRegisterGameControllerMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_properties) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  properties = self->_properties;
  if (properties) {
    [a3 setProperties:properties];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRGameControllerPropertiesProtobuf *)self->_properties copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    properties = self->_properties;
    if ((unint64_t)properties | v4[1]) {
      char v6 = -[_MRGameControllerPropertiesProtobuf isEqual:](properties, "isEqual:");
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
  return [(_MRGameControllerPropertiesProtobuf *)self->_properties hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  properties = self->_properties;
  uint64_t v6 = v4[1];
  if (properties)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    properties = (_MRGameControllerPropertiesProtobuf *)-[_MRGameControllerPropertiesProtobuf mergeFrom:](properties, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    properties = (_MRGameControllerPropertiesProtobuf *)-[_MRRegisterGameControllerMessageProtobuf setProperties:](self, "setProperties:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](properties, v4);
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