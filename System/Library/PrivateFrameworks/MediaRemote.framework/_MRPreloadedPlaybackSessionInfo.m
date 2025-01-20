@interface _MRPreloadedPlaybackSessionInfo
- (BOOL)hasPlaybackSessionIdentifier;
- (BOOL)hasPlaybackSessionPriority;
- (BOOL)hasPlaybackSessionRevision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)playbackSessionIdentifier;
- (NSString)playbackSessionRevision;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)playbackSessionPriority;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPlaybackSessionPriority:(BOOL)a3;
- (void)setPlaybackSessionIdentifier:(id)a3;
- (void)setPlaybackSessionPriority:(int)a3;
- (void)setPlaybackSessionRevision:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPreloadedPlaybackSessionInfo

- (BOOL)hasPlaybackSessionIdentifier
{
  return self->_playbackSessionIdentifier != 0;
}

- (BOOL)hasPlaybackSessionRevision
{
  return self->_playbackSessionRevision != 0;
}

- (void)setPlaybackSessionPriority:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackSessionPriority = a3;
}

- (void)setHasPlaybackSessionPriority:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackSessionPriority
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPreloadedPlaybackSessionInfo;
  v4 = [(_MRPreloadedPlaybackSessionInfo *)&v8 description];
  v5 = [(_MRPreloadedPlaybackSessionInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if (playbackSessionIdentifier) {
    [v3 setObject:playbackSessionIdentifier forKey:@"playbackSessionIdentifier"];
  }
  playbackSessionRevision = self->_playbackSessionRevision;
  if (playbackSessionRevision) {
    [v4 setObject:playbackSessionRevision forKey:@"playbackSessionRevision"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_playbackSessionPriority];
    [v4 setObject:v7 forKey:@"playbackSessionPriority"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPreloadedPlaybackSessionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_playbackSessionRevision)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSessionIdentifier)
  {
    objc_msgSend(v4, "setPlaybackSessionIdentifier:");
    id v4 = v5;
  }
  if (self->_playbackSessionRevision)
  {
    objc_msgSend(v5, "setPlaybackSessionRevision:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_playbackSessionPriority;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_playbackSessionIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_playbackSessionRevision copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_playbackSessionPriority;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if ((unint64_t)playbackSessionIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](playbackSessionIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  playbackSessionRevision = self->_playbackSessionRevision;
  if ((unint64_t)playbackSessionRevision | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](playbackSessionRevision, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_playbackSessionPriority == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_playbackSessionIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_playbackSessionRevision hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_playbackSessionPriority;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionIdentifier:](self, "setPlaybackSessionIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionRevision:](self, "setPlaybackSessionRevision:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_playbackSessionPriority = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (void)setPlaybackSessionIdentifier:(id)a3
{
}

- (NSString)playbackSessionRevision
{
  return self->_playbackSessionRevision;
}

- (void)setPlaybackSessionRevision:(id)a3
{
}

- (int)playbackSessionPriority
{
  return self->_playbackSessionPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionRevision, 0);

  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
}

@end