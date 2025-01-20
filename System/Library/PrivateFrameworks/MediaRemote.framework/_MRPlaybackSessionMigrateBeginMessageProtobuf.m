@interface _MRPlaybackSessionMigrateBeginMessageProtobuf
- (BOOL)hasPlayerPath;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRPlaybackSessionRequestProtobuf)request;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionMigrateBeginMessageProtobuf

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
  v8.super_class = (Class)_MRPlaybackSessionMigrateBeginMessageProtobuf;
  v4 = [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  request = self->_request;
  if (request)
  {
    v5 = [(_MRPlaybackSessionRequestProtobuf *)request dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v7 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateBeginMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
  if (self->_request)
  {
    objc_msgSend(v4, "setRequest:");
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
  id v6 = [(_MRPlaybackSessionRequestProtobuf *)self->_request copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((request = self->_request, !((unint64_t)request | v4[2]))
     || -[_MRPlaybackSessionRequestProtobuf isEqual:](request, "isEqual:")))
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[1]) {
      char v7 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRPlaybackSessionRequestProtobuf *)self->_request hash];
  return [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  request = self->_request;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (request)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRPlaybackSessionRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf setRequest:](self, "setRequest:");
  }
  id v4 = v9;
LABEL_7:
  playerPath = self->_playerPath;
  uint64_t v8 = v4[1];
  if (playerPath)
  {
    if (v8) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRPlaybackSessionRequestProtobuf)request
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
}

@end