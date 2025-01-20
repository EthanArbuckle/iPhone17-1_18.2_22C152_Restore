@interface _MROriginClientPropertiesMessageProtobuf
- (BOOL)hasDevicePlaybackSessionID;
- (BOOL)hasLastPlayingTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)devicePlaybackSessionID;
- (double)lastPlayingTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDevicePlaybackSessionID:(id)a3;
- (void)setHasLastPlayingTimestamp:(BOOL)a3;
- (void)setLastPlayingTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MROriginClientPropertiesMessageProtobuf

- (void)setLastPlayingTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastPlayingTimestamp = a3;
}

- (void)setHasLastPlayingTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastPlayingTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDevicePlaybackSessionID
{
  return self->_devicePlaybackSessionID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MROriginClientPropertiesMessageProtobuf;
  v4 = [(_MROriginClientPropertiesMessageProtobuf *)&v8 description];
  v5 = [(_MROriginClientPropertiesMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_lastPlayingTimestamp];
    [v3 setObject:v4 forKey:@"lastPlayingTimestamp"];
  }
  devicePlaybackSessionID = self->_devicePlaybackSessionID;
  if (devicePlaybackSessionID) {
    [v3 setObject:devicePlaybackSessionID forKey:@"devicePlaybackSessionID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MROriginClientPropertiesMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_devicePlaybackSessionID)
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
    v4[1] = *(void *)&self->_lastPlayingTimestamp;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_devicePlaybackSessionID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDevicePlaybackSessionID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_lastPlayingTimestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_devicePlaybackSessionID copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_lastPlayingTimestamp != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  devicePlaybackSessionID = self->_devicePlaybackSessionID;
  if ((unint64_t)devicePlaybackSessionID | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](devicePlaybackSessionID, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double lastPlayingTimestamp = self->_lastPlayingTimestamp;
    double v5 = -lastPlayingTimestamp;
    if (lastPlayingTimestamp >= 0.0) {
      double v5 = self->_lastPlayingTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(NSString *)self->_devicePlaybackSessionID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[3])
  {
    self->_double lastPlayingTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    double v5 = v4;
    -[_MROriginClientPropertiesMessageProtobuf setDevicePlaybackSessionID:](self, "setDevicePlaybackSessionID:");
    id v4 = v5;
  }
}

- (double)lastPlayingTimestamp
{
  return self->_lastPlayingTimestamp;
}

- (NSString)devicePlaybackSessionID
{
  return self->_devicePlaybackSessionID;
}

- (void)setDevicePlaybackSessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end