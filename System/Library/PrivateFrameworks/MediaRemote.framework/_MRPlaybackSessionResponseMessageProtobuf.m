@interface _MRPlaybackSessionResponseMessageProtobuf
- (BOOL)hasPlaybackSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRPlaybackSessionProtobuf)playbackSession;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlaybackSession:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionResponseMessageProtobuf

- (BOOL)hasPlaybackSession
{
  return self->_playbackSession != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionResponseMessageProtobuf;
  v4 = [(_MRPlaybackSessionResponseMessageProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionResponseMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  playbackSession = self->_playbackSession;
  if (playbackSession)
  {
    v5 = [(_MRPlaybackSessionProtobuf *)playbackSession dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"playbackSession"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_playbackSession) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  playbackSession = self->_playbackSession;
  if (playbackSession) {
    [a3 setPlaybackSession:playbackSession];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRPlaybackSessionProtobuf *)self->_playbackSession copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    playbackSession = self->_playbackSession;
    if ((unint64_t)playbackSession | v4[1]) {
      char v6 = -[_MRPlaybackSessionProtobuf isEqual:](playbackSession, "isEqual:");
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
  return [(_MRPlaybackSessionProtobuf *)self->_playbackSession hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  playbackSession = self->_playbackSession;
  uint64_t v6 = v4[1];
  if (playbackSession)
  {
    if (v6) {
      -[_MRPlaybackSessionProtobuf mergeFrom:](playbackSession, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRPlaybackSessionResponseMessageProtobuf setPlaybackSession:](self, "setPlaybackSession:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRPlaybackSessionProtobuf)playbackSession
{
  return self->_playbackSession;
}

- (void)setPlaybackSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end