@interface _MRNowPlayingPlayerPathProtobuf
- (BOOL)hasClient;
- (BOOL)hasOrigin;
- (BOOL)hasPlayer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingClientProtobuf)client;
- (_MRNowPlayingPlayerProtobuf)player;
- (_MROriginProtobuf)origin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClient:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPlayer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRNowPlayingPlayerPathProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingPlayerPathProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_origin, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setPlayer:(id)a3
{
}

- (void)setOrigin:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (_MROriginProtobuf)origin
{
  return self->_origin;
}

- (_MRNowPlayingClientProtobuf)client
{
  return self->_client;
}

- (_MRNowPlayingPlayerProtobuf)player
{
  return self->_player;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_origin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_client)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_player)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((origin = self->_origin, !((unint64_t)origin | v4[2]))
     || -[_MROriginProtobuf isEqual:](origin, "isEqual:"))
    && ((client = self->_client, !((unint64_t)client | v4[1]))
     || -[_MRNowPlayingClientProtobuf isEqual:](client, "isEqual:")))
  {
    player = self->_player;
    if ((unint64_t)player | v4[3]) {
      char v8 = -[_MRNowPlayingPlayerProtobuf isEqual:](player, "isEqual:");
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

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (BOOL)hasClient
{
  return self->_client != 0;
}

- (BOOL)hasPlayer
{
  return self->_player != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRNowPlayingPlayerPathProtobuf;
  id v4 = [(_MRNowPlayingPlayerPathProtobuf *)&v8 description];
  id v5 = [(_MRNowPlayingPlayerPathProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  origin = self->_origin;
  if (origin)
  {
    id v5 = [(_MROriginProtobuf *)origin dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"origin"];
  }
  client = self->_client;
  if (client)
  {
    v7 = [(_MRNowPlayingClientProtobuf *)client dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"client"];
  }
  player = self->_player;
  if (player)
  {
    v9 = [(_MRNowPlayingPlayerProtobuf *)player dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"player"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_origin)
  {
    objc_msgSend(v4, "setOrigin:");
    id v4 = v5;
  }
  if (self->_client)
  {
    objc_msgSend(v5, "setClient:");
    id v4 = v5;
  }
  if (self->_player)
  {
    objc_msgSend(v5, "setPlayer:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MROriginProtobuf *)self->_origin copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(_MRNowPlayingClientProtobuf *)self->_client copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(_MRNowPlayingPlayerProtobuf *)self->_player copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MROriginProtobuf *)self->_origin hash];
  unint64_t v4 = [(_MRNowPlayingClientProtobuf *)self->_client hash] ^ v3;
  return v4 ^ [(_MRNowPlayingPlayerProtobuf *)self->_player hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  origin = self->_origin;
  uint64_t v6 = v4[2];
  v11 = v4;
  if (origin)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MROriginProtobuf mergeFrom:](origin, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRNowPlayingPlayerPathProtobuf setOrigin:](self, "setOrigin:");
  }
  unint64_t v4 = v11;
LABEL_7:
  client = self->_client;
  uint64_t v8 = v4[1];
  if (client)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRNowPlayingClientProtobuf mergeFrom:](client, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRNowPlayingPlayerPathProtobuf setClient:](self, "setClient:");
  }
  unint64_t v4 = v11;
LABEL_13:
  player = self->_player;
  uint64_t v10 = v4[3];
  if (player)
  {
    if (v10) {
      -[_MRNowPlayingPlayerProtobuf mergeFrom:](player, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[_MRNowPlayingPlayerPathProtobuf setPlayer:](self, "setPlayer:");
  }

  MEMORY[0x1F41817F8]();
}

@end