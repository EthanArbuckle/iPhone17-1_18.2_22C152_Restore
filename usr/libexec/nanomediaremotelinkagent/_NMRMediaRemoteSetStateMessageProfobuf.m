@interface _NMRMediaRemoteSetStateMessageProfobuf
- (BOOL)hasApplicationInfo;
- (BOOL)hasDigest;
- (BOOL)hasNowPlayingInfo;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasPayload;
- (BOOL)hasPlaybackQueue;
- (BOOL)hasState;
- (BOOL)hasSupportedCommands;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)applicationInfo;
- (NSData)digest;
- (NSData)nowPlayingInfo;
- (NSData)payload;
- (NSData)playbackQueue;
- (NSData)supportedCommands;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (int)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationInfo:(id)a3;
- (void)setDigest:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setPayload:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setState:(int)a3;
- (void)setSupportedCommands:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRMediaRemoteSetStateMessageProfobuf

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (BOOL)hasDigest
{
  return self->_digest != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasNowPlayingInfo
{
  return self->_nowPlayingInfo != 0;
}

- (BOOL)hasApplicationInfo
{
  return self->_applicationInfo != 0;
}

- (BOOL)hasSupportedCommands
{
  return self->_supportedCommands != 0;
}

- (BOOL)hasPlaybackQueue
{
  return self->_playbackQueue != 0;
}

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRMediaRemoteSetStateMessageProfobuf;
  char v3 = [(_NMRMediaRemoteSetStateMessageProfobuf *)&v7 description];
  v4 = [(_NMRMediaRemoteSetStateMessageProfobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = +[NSNumber numberWithInt:self->_state];
    [v3 setObject:v4 forKey:@"state"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }
  digest = self->_digest;
  if (digest) {
    [v3 setObject:digest forKey:@"digest"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];
  }
  nowPlayingInfo = self->_nowPlayingInfo;
  if (nowPlayingInfo) {
    [v3 setObject:nowPlayingInfo forKey:@"nowPlayingInfo"];
  }
  applicationInfo = self->_applicationInfo;
  if (applicationInfo) {
    [v3 setObject:applicationInfo forKey:@"applicationInfo"];
  }
  supportedCommands = self->_supportedCommands;
  if (supportedCommands) {
    [v3 setObject:supportedCommands forKey:@"supportedCommands"];
  }
  playbackQueue = self->_playbackQueue;
  if (playbackQueue) {
    [v3 setObject:playbackQueue forKey:@"playbackQueue"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = +[NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v12 forKey:@"originIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000C664((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_payload) {
    PBDataWriterWriteDataField();
  }
  if (self->_digest) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_nowPlayingInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_applicationInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_supportedCommands) {
    PBDataWriterWriteDataField();
  }
  if (self->_playbackQueue) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[16] = self->_state;
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if (self->_payload) {
    [v4 setPayload:];
  }
  if (self->_digest) {
    [v4 setDigest:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_nowPlayingInfo) {
    [v4 setNowPlayingInfo:];
  }
  if (self->_applicationInfo) {
    [v4 setApplicationInfo:];
  }
  if (self->_supportedCommands) {
    [v4 setSupportedCommands:];
  }
  if (self->_playbackQueue) {
    [v4 setPlaybackQueue:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[10] = self->_originIdentifier;
    *((unsigned char *)v4 + 80) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[16] = self->_state;
    *((unsigned char *)v5 + 80) |= 4u;
  }
  id v7 = [(NSData *)self->_payload copyWithZone:a3];
  v8 = (void *)v6[6];
  v6[6] = v7;

  id v9 = [(NSData *)self->_digest copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v6 + 80) |= 1u;
  }
  id v11 = [(NSData *)self->_nowPlayingInfo copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  id v13 = [(NSData *)self->_applicationInfo copyWithZone:a3];
  v14 = (void *)v6[2];
  v6[2] = v13;

  id v15 = [(NSData *)self->_supportedCommands copyWithZone:a3];
  v16 = (void *)v6[9];
  v6[9] = v15;

  id v17 = [(NSData *)self->_playbackQueue copyWithZone:a3];
  v18 = (void *)v6[7];
  v6[7] = v17;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_originIdentifier;
    *((unsigned char *)v6 + 80) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_state != *((_DWORD *)v4 + 16)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
LABEL_28:
    BOOL v11 = 0;
    goto LABEL_29;
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((void *)v4 + 6) && !-[NSData isEqual:](payload, "isEqual:")) {
    goto LABEL_28;
  }
  digest = self->_digest;
  if ((unint64_t)digest | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](digest, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_28;
  }
  nowPlayingInfo = self->_nowPlayingInfo;
  if ((unint64_t)nowPlayingInfo | *((void *)v4 + 4)
    && !-[NSData isEqual:](nowPlayingInfo, "isEqual:"))
  {
    goto LABEL_28;
  }
  applicationInfo = self->_applicationInfo;
  if ((unint64_t)applicationInfo | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](applicationInfo, "isEqual:")) {
      goto LABEL_28;
    }
  }
  supportedCommands = self->_supportedCommands;
  if ((unint64_t)supportedCommands | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](supportedCommands, "isEqual:")) {
      goto LABEL_28;
    }
  }
  playbackQueue = self->_playbackQueue;
  if ((unint64_t)playbackQueue | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](playbackQueue, "isEqual:")) {
      goto LABEL_28;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 80) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
    BOOL v11 = 1;
  }
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_state;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_payload hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_digest hash];
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v8 = -timestamp;
    if (timestamp >= 0.0) {
      double v8 = self->_timestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  unint64_t v11 = (unint64_t)[(NSData *)self->_nowPlayingInfo hash];
  unint64_t v12 = (unint64_t)[(NSData *)self->_applicationInfo hash];
  unint64_t v13 = (unint64_t)[(NSData *)self->_supportedCommands hash];
  unint64_t v14 = (unint64_t)[(NSData *)self->_playbackQueue hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v15 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v15 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    self->_state = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v5 = v4;
  if (*((void *)v4 + 6))
  {
    -[_NMRMediaRemoteSetStateMessageProfobuf setPayload:](self, "setPayload:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[_NMRMediaRemoteSetStateMessageProfobuf setDigest:](self, "setDigest:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[_NMRMediaRemoteSetStateMessageProfobuf setNowPlayingInfo:](self, "setNowPlayingInfo:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[_NMRMediaRemoteSetStateMessageProfobuf setApplicationInfo:](self, "setApplicationInfo:");
    id v4 = v5;
  }
  if (*((void *)v4 + 9))
  {
    -[_NMRMediaRemoteSetStateMessageProfobuf setSupportedCommands:](self, "setSupportedCommands:");
    id v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[_NMRMediaRemoteSetStateMessageProfobuf setPlaybackQueue:](self, "setPlaybackQueue:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    self->_originIdentifier = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)state
{
  return self->_state;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSData)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
}

- (NSData)applicationInfo
{
  return self->_applicationInfo;
}

- (void)setApplicationInfo:(id)a3
{
}

- (NSData)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (NSData)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_digest, 0);

  objc_storeStrong((id *)&self->_applicationInfo, 0);
}

@end