@interface _MRGetVolumeControlCapabilitiesResultMessageProtobuf
- (BOOL)hasCapabilities;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRVolumeControlAvailabilityProtobuf)capabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGetVolumeControlCapabilitiesResultMessageProtobuf

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGetVolumeControlCapabilitiesResultMessageProtobuf;
  v4 = [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)&v8 description];
  v5 = [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  capabilities = self->_capabilities;
  if (capabilities)
  {
    v5 = [(_MRVolumeControlAvailabilityProtobuf *)capabilities dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"capabilities"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGetVolumeControlCapabilitiesResultMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_capabilities) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  capabilities = self->_capabilities;
  if (capabilities) {
    [a3 setCapabilities:capabilities];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRVolumeControlAvailabilityProtobuf *)self->_capabilities copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    capabilities = self->_capabilities;
    if ((unint64_t)capabilities | v4[1]) {
      char v6 = -[_MRVolumeControlAvailabilityProtobuf isEqual:](capabilities, "isEqual:");
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
  return [(_MRVolumeControlAvailabilityProtobuf *)self->_capabilities hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  capabilities = self->_capabilities;
  uint64_t v6 = v4[1];
  if (capabilities)
  {
    if (v6) {
      -[_MRVolumeControlAvailabilityProtobuf mergeFrom:](capabilities, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf setCapabilities:](self, "setCapabilities:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRVolumeControlAvailabilityProtobuf)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end