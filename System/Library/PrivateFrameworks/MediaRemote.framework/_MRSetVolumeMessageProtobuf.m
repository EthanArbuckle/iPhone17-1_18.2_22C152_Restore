@interface _MRSetVolumeMessageProtobuf
- (BOOL)hasDetails;
- (BOOL)hasOutputDeviceUID;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceUID;
- (_MRRequestDetailsProtobuf)details;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetails:(id)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setVolume:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSetVolumeMessageProtobuf

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

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSetVolumeMessageProtobuf;
  v4 = [(_MRSetVolumeMessageProtobuf *)&v8 description];
  v5 = [(_MRSetVolumeMessageProtobuf *)self dictionaryRepresentation];
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
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }
  details = self->_details;
  if (details)
  {
    objc_super v8 = [(_MRRequestDetailsProtobuf *)details dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"details"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetVolumeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_details)
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
    v4[6] = LODWORD(self->_volume);
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    id v4 = v5;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
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
  uint64_t v7 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(_MRRequestDetailsProtobuf *)self->_details copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

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
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((void *)v4 + 2)
    && !-[NSString isEqual:](outputDeviceUID, "isEqual:"))
  {
    goto LABEL_11;
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 1)) {
    char v7 = -[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:");
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
  NSUInteger v8 = [(NSString *)self->_outputDeviceUID hash] ^ v3;
  return v8 ^ [(_MRRequestDetailsProtobuf *)self->_details hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  float v5 = v4;
  if ((_BYTE)v4[7])
  {
    self->_float volume = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MRSetVolumeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    float v5 = v8;
  }
  details = self->_details;
  uint64_t v7 = *((void *)v5 + 1);
  if (details)
  {
    if (v7) {
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[_MRSetVolumeMessageProtobuf setDetails:](self, "setDetails:");
  }

  MEMORY[0x1F41817F8]();
}

- (float)volume
{
  return self->_volume;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_details, 0);
}

@end