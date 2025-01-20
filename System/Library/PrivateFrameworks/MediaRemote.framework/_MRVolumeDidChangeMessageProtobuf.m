@interface _MRVolumeDidChangeMessageProtobuf
- (BOOL)hasEndpointUID;
- (BOOL)hasOutputDeviceUID;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)endpointUID;
- (NSString)outputDeviceUID;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndpointUID:(id)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setVolume:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRVolumeDidChangeMessageProtobuf

- (void)setVolume:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_volume = a3;
}

- (void)setHasVolume:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVolume
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRVolumeDidChangeMessageProtobuf;
  v4 = [(_MRVolumeDidChangeMessageProtobuf *)&v8 description];
  v5 = [(_MRVolumeDidChangeMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_volume;
    v5 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v5 forKey:@"volume"];
  }
  endpointUID = self->_endpointUID;
  if (endpointUID) {
    [v3 setObject:endpointUID forKey:@"endpointUID"];
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVolumeDidChangeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_endpointUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = LODWORD(self->_volume);
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_endpointUID)
  {
    objc_msgSend(v4, "setEndpointUID:");
    id v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v5, "setOutputDeviceUID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 24) = self->_volume;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_endpointUID copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_volume != *((float *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  endpointUID = self->_endpointUID;
  if ((unint64_t)endpointUID | *((void *)v4 + 1)
    && !-[NSString isEqual:](endpointUID, "isEqual:"))
  {
    goto LABEL_11;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    float volume = self->_volume;
    float v5 = -volume;
    if (volume >= 0.0) {
      float v5 = self->_volume;
    }
    float v6 = floorf(v5 + 0.5);
    float v7 = (float)(v5 - v6) * 1.8447e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabsf(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_endpointUID hash] ^ v3;
  return v8 ^ [(NSString *)self->_outputDeviceUID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  if ((_BYTE)v4[7])
  {
    self->_float volume = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  float v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[_MRVolumeDidChangeMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[_MRVolumeDidChangeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    id v4 = v5;
  }
}

- (float)volume
{
  return self->_volume;
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_endpointUID, 0);
}

@end