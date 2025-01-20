@interface _MRVoiceInputDevice
- (BOOL)hasDescriptor;
- (BOOL)hasDeviceID;
- (BOOL)hasRecordingState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRVoiceInputDeviceDescriptorProtobuf)descriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordingStateAsString:(int)a3;
- (int)StringAsRecordingState:(id)a3;
- (int)recordingState;
- (unint64_t)hash;
- (unsigned)deviceID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDeviceID:(unsigned int)a3;
- (void)setHasDeviceID:(BOOL)a3;
- (void)setHasRecordingState:(BOOL)a3;
- (void)setRecordingState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRVoiceInputDevice

- (void)setDeviceID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deviceID = a3;
}

- (void)setHasDeviceID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDescriptor
{
  return self->_descriptor != 0;
}

- (int)recordingState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_recordingState;
  }
  else {
    return 0;
  }
}

- (void)setRecordingState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recordingState = a3;
}

- (void)setHasRecordingState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordingState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)recordingStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D3CC8[a3];
  }

  return v3;
}

- (int)StringAsRecordingState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Recording"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotRecording"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRVoiceInputDevice;
  int v4 = [(_MRVoiceInputDevice *)&v8 description];
  v5 = [(_MRVoiceInputDevice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [NSNumber numberWithUnsignedInt:self->_deviceID];
    [v3 setObject:v4 forKey:@"deviceID"];
  }
  descriptor = self->_descriptor;
  if (descriptor)
  {
    v6 = [(_MRVoiceInputDeviceDescriptorProtobuf *)descriptor dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"descriptor"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t recordingState = self->_recordingState;
    if (recordingState >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recordingState);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E57D3CC8[recordingState];
    }
    [v3 setObject:v8 forKey:@"recordingState"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVoiceInputDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_descriptor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_deviceID;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_descriptor)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDescriptor:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_recordingState;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_deviceID;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(_MRVoiceInputDeviceDescriptorProtobuf *)self->_descriptor copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_recordingState;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_deviceID != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  descriptor = self->_descriptor;
  if ((unint64_t)descriptor | *((void *)v4 + 1))
  {
    if (!-[_MRVoiceInputDeviceDescriptorProtobuf isEqual:](descriptor, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_recordingState != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_deviceID;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRVoiceInputDeviceDescriptorProtobuf *)self->_descriptor hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_recordingState;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[6])
  {
    self->_deviceID = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  descriptor = self->_descriptor;
  uint64_t v7 = *((void *)v5 + 1);
  if (descriptor)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[_MRVoiceInputDeviceDescriptorProtobuf mergeFrom:](descriptor, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[_MRVoiceInputDevice setDescriptor:](self, "setDescriptor:");
  }
  uint64_t v5 = v8;
LABEL_9:
  if ((v5[6] & 2) != 0)
  {
    self->_uint64_t recordingState = v5[5];
    *(unsigned char *)&self->_has |= 2u;
  }

  MEMORY[0x1F41817F8]();
}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (_MRVoiceInputDeviceDescriptorProtobuf)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end