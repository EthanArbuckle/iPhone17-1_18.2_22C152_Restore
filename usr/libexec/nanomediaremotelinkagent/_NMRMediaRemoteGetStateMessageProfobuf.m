@interface _NMRMediaRemoteGetStateMessageProfobuf
- (BOOL)hasApplicationInfoDigest;
- (BOOL)hasKnownDigest;
- (BOOL)hasNowPlayingInfoDigest;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasPlaybackQueueDigest;
- (BOOL)hasState;
- (BOOL)hasSupportedCommandsDigest;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)applicationInfoDigest;
- (NSData)knownDigest;
- (NSData)nowPlayingInfoDigest;
- (NSData)playbackQueueDigest;
- (NSData)supportedCommandsDigest;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (int)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationInfoDigest:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setKnownDigest:(id)a3;
- (void)setNowPlayingInfoDigest:(id)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setPlaybackQueueDigest:(id)a3;
- (void)setState:(int)a3;
- (void)setSupportedCommandsDigest:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRMediaRemoteGetStateMessageProfobuf

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

- (BOOL)hasKnownDigest
{
  return self->_knownDigest != 0;
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

- (BOOL)hasNowPlayingInfoDigest
{
  return self->_nowPlayingInfoDigest != 0;
}

- (BOOL)hasApplicationInfoDigest
{
  return self->_applicationInfoDigest != 0;
}

- (BOOL)hasSupportedCommandsDigest
{
  return self->_supportedCommandsDigest != 0;
}

- (BOOL)hasPlaybackQueueDigest
{
  return self->_playbackQueueDigest != 0;
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
  v7.super_class = (Class)_NMRMediaRemoteGetStateMessageProfobuf;
  char v3 = [(_NMRMediaRemoteGetStateMessageProfobuf *)&v7 description];
  v4 = [(_NMRMediaRemoteGetStateMessageProfobuf *)self dictionaryRepresentation];
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
  knownDigest = self->_knownDigest;
  if (knownDigest) {
    [v3 setObject:knownDigest forKey:@"knownDigest"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v6 forKey:@"timestamp"];
  }
  nowPlayingInfoDigest = self->_nowPlayingInfoDigest;
  if (nowPlayingInfoDigest) {
    [v3 setObject:nowPlayingInfoDigest forKey:@"nowPlayingInfoDigest"];
  }
  applicationInfoDigest = self->_applicationInfoDigest;
  if (applicationInfoDigest) {
    [v3 setObject:applicationInfoDigest forKey:@"applicationInfoDigest"];
  }
  supportedCommandsDigest = self->_supportedCommandsDigest;
  if (supportedCommandsDigest) {
    [v3 setObject:supportedCommandsDigest forKey:@"supportedCommandsDigest"];
  }
  playbackQueueDigest = self->_playbackQueueDigest;
  if (playbackQueueDigest) {
    [v3 setObject:playbackQueueDigest forKey:@"playbackQueueDigest"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = +[NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v11 forKey:@"originIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000069D8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_knownDigest) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_nowPlayingInfoDigest) {
    PBDataWriterWriteDataField();
  }
  if (self->_applicationInfoDigest) {
    PBDataWriterWriteDataField();
  }
  if (self->_supportedCommandsDigest) {
    PBDataWriterWriteDataField();
  }
  if (self->_playbackQueueDigest) {
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
    v4[14] = self->_state;
    *((unsigned char *)v4 + 72) |= 4u;
  }
  v5 = v4;
  if (self->_knownDigest)
  {
    [v4 setKnownDigest:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_nowPlayingInfoDigest)
  {
    [v5 setNowPlayingInfoDigest:];
    id v4 = v5;
  }
  if (self->_applicationInfoDigest)
  {
    [v5 setApplicationInfoDigest:];
    id v4 = v5;
  }
  if (self->_supportedCommandsDigest)
  {
    [v5 setSupportedCommandsDigest:];
    id v4 = v5;
  }
  if (self->_playbackQueueDigest)
  {
    [v5 setPlaybackQueueDigest:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[10] = self->_originIdentifier;
    *((unsigned char *)v4 + 72) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[14] = self->_state;
    *((unsigned char *)v5 + 72) |= 4u;
  }
  id v7 = [(NSData *)self->_knownDigest copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v6 + 72) |= 1u;
  }
  id v9 = [(NSData *)self->_nowPlayingInfoDigest copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(NSData *)self->_applicationInfoDigest copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(NSData *)self->_supportedCommandsDigest copyWithZone:a3];
  v14 = (void *)v6[8];
  v6[8] = v13;

  id v15 = [(NSData *)self->_playbackQueueDigest copyWithZone:a3];
  v16 = (void *)v6[6];
  v6[6] = v15;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_originIdentifier;
    *((unsigned char *)v6 + 72) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_state != *((_DWORD *)v4 + 14)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_27;
  }
  knownDigest = self->_knownDigest;
  if ((unint64_t)knownDigest | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](knownDigest, "isEqual:"))
    {
LABEL_27:
      BOOL v11 = 0;
      goto LABEL_28;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_27;
  }
  nowPlayingInfoDigest = self->_nowPlayingInfoDigest;
  if ((unint64_t)nowPlayingInfoDigest | *((void *)v4 + 4)
    && !-[NSData isEqual:](nowPlayingInfoDigest, "isEqual:"))
  {
    goto LABEL_27;
  }
  applicationInfoDigest = self->_applicationInfoDigest;
  if ((unint64_t)applicationInfoDigest | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](applicationInfoDigest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  supportedCommandsDigest = self->_supportedCommandsDigest;
  if ((unint64_t)supportedCommandsDigest | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](supportedCommandsDigest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  playbackQueueDigest = self->_playbackQueueDigest;
  if ((unint64_t)playbackQueueDigest | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](playbackQueueDigest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 72) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 10)) {
      goto LABEL_27;
    }
    BOOL v11 = 1;
  }
LABEL_28:

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
  unint64_t v4 = (unint64_t)[(NSData *)self->_knownDigest hash];
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v7 = -timestamp;
    if (timestamp >= 0.0) {
      double v7 = self->_timestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v10 = (unint64_t)[(NSData *)self->_nowPlayingInfoDigest hash];
  unint64_t v11 = (unint64_t)[(NSData *)self->_applicationInfoDigest hash];
  unint64_t v12 = (unint64_t)[(NSData *)self->_supportedCommandsDigest hash];
  unint64_t v13 = (unint64_t)[(NSData *)self->_playbackQueueDigest hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    self->_state = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[_NMRMediaRemoteGetStateMessageProfobuf setKnownDigest:](self, "setKnownDigest:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[_NMRMediaRemoteGetStateMessageProfobuf setNowPlayingInfoDigest:](self, "setNowPlayingInfoDigest:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[_NMRMediaRemoteGetStateMessageProfobuf setApplicationInfoDigest:](self, "setApplicationInfoDigest:");
    id v4 = v5;
  }
  if (*((void *)v4 + 8))
  {
    -[_NMRMediaRemoteGetStateMessageProfobuf setSupportedCommandsDigest:](self, "setSupportedCommandsDigest:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[_NMRMediaRemoteGetStateMessageProfobuf setPlaybackQueueDigest:](self, "setPlaybackQueueDigest:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    self->_originIdentifier = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)state
{
  return self->_state;
}

- (NSData)knownDigest
{
  return self->_knownDigest;
}

- (void)setKnownDigest:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)nowPlayingInfoDigest
{
  return self->_nowPlayingInfoDigest;
}

- (void)setNowPlayingInfoDigest:(id)a3
{
}

- (NSData)applicationInfoDigest
{
  return self->_applicationInfoDigest;
}

- (void)setApplicationInfoDigest:(id)a3
{
}

- (NSData)supportedCommandsDigest
{
  return self->_supportedCommandsDigest;
}

- (void)setSupportedCommandsDigest:(id)a3
{
}

- (NSData)playbackQueueDigest
{
  return self->_playbackQueueDigest;
}

- (void)setPlaybackQueueDigest:(id)a3
{
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCommandsDigest, 0);
  objc_storeStrong((id *)&self->_playbackQueueDigest, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoDigest, 0);
  objc_storeStrong((id *)&self->_knownDigest, 0);

  objc_storeStrong((id *)&self->_applicationInfoDigest, 0);
}

@end