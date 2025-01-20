@interface _MRPlaybackSessionMigrateRequestMessageProtobuf
- (BOOL)hasPlaybackSession;
- (BOOL)hasPlayerPath;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRPlaybackSessionMigrateRequestProtobuf)request;
- (_MRPlaybackSessionProtobuf)playbackSession;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlaybackSession:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionMigrateRequestMessageProtobuf

- (BOOL)hasPlaybackSession
{
  return self->_playbackSession != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionMigrateRequestMessageProtobuf;
  v4 = [(_MRPlaybackSessionMigrateRequestMessageProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionMigrateRequestMessageProtobuf *)self dictionaryRepresentation];
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
  request = self->_request;
  if (request)
  {
    v7 = [(_MRPlaybackSessionMigrateRequestProtobuf *)request dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"request"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v9 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateRequestMessageProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSession)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSession)
  {
    objc_msgSend(v4, "setPlaybackSession:");
    id v4 = v5;
  }
  if (self->_request)
  {
    objc_msgSend(v5, "setRequest:");
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRPlaybackSessionProtobuf *)self->_playbackSession copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_MRPlaybackSessionMigrateRequestProtobuf *)self->_request copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((playbackSession = self->_playbackSession, !((unint64_t)playbackSession | v4[1]))
     || -[_MRPlaybackSessionProtobuf isEqual:](playbackSession, "isEqual:"))
    && ((request = self->_request, !((unint64_t)request | v4[3]))
     || -[_MRPlaybackSessionMigrateRequestProtobuf isEqual:](request, "isEqual:")))
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[2]) {
      char v8 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRPlaybackSessionProtobuf *)self->_playbackSession hash];
  unint64_t v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)self->_request hash] ^ v3;
  return v4 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  playbackSession = self->_playbackSession;
  uint64_t v6 = v4[1];
  v11 = v4;
  if (playbackSession)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRPlaybackSessionProtobuf mergeFrom:](playbackSession, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setPlaybackSession:](self, "setPlaybackSession:");
  }
  unint64_t v4 = v11;
LABEL_7:
  request = self->_request;
  uint64_t v8 = v4[3];
  if (request)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRPlaybackSessionMigrateRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setRequest:](self, "setRequest:");
  }
  unint64_t v4 = v11;
LABEL_13:
  playerPath = self->_playerPath;
  uint64_t v10 = v4[2];
  if (playerPath)
  {
    if (v10) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
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

- (_MRPlaybackSessionMigrateRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_playbackSession, 0);
}

@end