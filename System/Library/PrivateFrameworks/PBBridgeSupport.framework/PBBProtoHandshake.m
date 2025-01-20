@interface PBBProtoHandshake
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)position;
- (unsigned)state;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPosition:(unsigned int)a3;
- (void)setState:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoHandshake

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoHandshake;
  v4 = [(PBBProtoHandshake *)&v8 description];
  v5 = [(PBBProtoHandshake *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_position];
  [v3 setObject:v4 forKey:@"position"];

  v5 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v5 forKey:@"version"];

  v6 = [NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v6 forKey:@"state"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoHandshakeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_position;
  *((_DWORD *)a3 + 4) = self->_version;
  *((_DWORD *)a3 + 3) = self->_state;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_position;
  *((_DWORD *)result + 4) = self->_version;
  *((_DWORD *)result + 3) = self->_state;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_position == v4[2]
    && self->_version == v4[4]
    && self->_state == v4[3];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_version) ^ (2654435761 * self->_position) ^ (2654435761 * self->_state);
}

- (void)mergeFrom:(id)a3
{
  self->_position = *((_DWORD *)a3 + 2);
  self->_version = *((_DWORD *)a3 + 4);
  self->_state = *((_DWORD *)a3 + 3);
}

- (unsigned)position
{
  return self->_position;
}

- (void)setPosition:(unsigned int)a3
{
  self->_position = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

@end