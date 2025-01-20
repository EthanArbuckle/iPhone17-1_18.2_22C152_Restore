@interface _MRRemovePlayerMessageProtobuf
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRemovePlayerMessageProtobuf

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRemovePlayerMessageProtobuf;
  v4 = [(_MRRemovePlayerMessageProtobuf *)&v8 description];
  v5 = [(_MRRemovePlayerMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v5 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemovePlayerMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  playerPath = self->_playerPath;
  if (playerPath) {
    [a3 setPlayerPath:playerPath];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[1]) {
      char v6 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
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
  return [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  playerPath = self->_playerPath;
  uint64_t v6 = v4[1];
  if (playerPath)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRRemovePlayerMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](playerPath, v4);
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
}

@end