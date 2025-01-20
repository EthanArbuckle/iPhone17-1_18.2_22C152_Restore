@interface _MRGetVoiceInputDevicesResponseMessageProtobuf
- (BOOL)hasErrorCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)deviceIDsCount;
- (unint64_t)hash;
- (unsigned)deviceIDs;
- (unsigned)deviceIDsAtIndex:(unint64_t)a3;
- (unsigned)errorCode;
- (void)addDeviceIDs:(unsigned int)a3;
- (void)clearDeviceIDs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeviceIDs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGetVoiceInputDevicesResponseMessageProtobuf

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRGetVoiceInputDevicesResponseMessageProtobuf;
  [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)&v3 dealloc];
}

- (unint64_t)deviceIDsCount
{
  return self->_deviceIDs.count;
}

- (unsigned)deviceIDs
{
  return self->_deviceIDs.list;
}

- (void)clearDeviceIDs
{
}

- (void)addDeviceIDs:(unsigned int)a3
{
}

- (unsigned)deviceIDsAtIndex:(unint64_t)a3
{
  p_deviceIDs = &self->_deviceIDs;
  unint64_t count = self->_deviceIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_deviceIDs->list[a3];
}

- (void)setDeviceIDs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGetVoiceInputDevicesResponseMessageProtobuf;
  v4 = [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)&v8 description];
  v5 = [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = PBRepeatedUInt32NSArray();
  [v3 setObject:v4 forKey:@"deviceIDs"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v5 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGetVoiceInputDevicesResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_deviceIDs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_deviceIDs.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(_MRGetVoiceInputDevicesResponseMessageProtobuf *)self deviceIDsCount])
  {
    [v7 clearDeviceIDs];
    unint64_t v4 = [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)self deviceIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addDeviceIDs:", -[_MRGetVoiceInputDevicesResponseMessageProtobuf deviceIDsAtIndex:](self, "deviceIDsAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v7 + 8) = self->_errorCode;
    *((unsigned char *)v7 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v4 + 32) = self->_errorCode;
    *(unsigned char *)(v4 + 36) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_errorCode == *((_DWORD *)v4 + 8))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (unsigned int *)a3;
  uint64_t v4 = [v7 deviceIDsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[_MRGetVoiceInputDevicesResponseMessageProtobuf addDeviceIDs:](self, "addDeviceIDs:", [v7 deviceIDsAtIndex:i]);
  }
  if (v7[9])
  {
    self->_errorCode = v7[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

@end