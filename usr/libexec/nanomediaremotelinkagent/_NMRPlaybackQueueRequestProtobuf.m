@interface _NMRPlaybackQueueRequestProtobuf
- (BOOL)hasPlayerPath;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)playerPath;
- (NSData)request;
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

@implementation _NMRPlaybackQueueRequestProtobuf

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
  v7.receiver = self;
  v7.super_class = (Class)_NMRPlaybackQueueRequestProtobuf;
  v3 = [(_NMRPlaybackQueueRequestProtobuf *)&v7 description];
  v4 = [(_NMRPlaybackQueueRequestProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  request = self->_request;
  if (request) {
    [v3 setObject:request forKey:@"request"];
  }
  playerPath = self->_playerPath;
  if (playerPath) {
    [v4 setObject:playerPath forKey:@"playerPath"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000307A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_request)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_request)
  {
    [v4 setRequest:];
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    [v5 setPlayerPath:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSData *)self->_request copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_playerPath copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((request = self->_request, !((unint64_t)request | v4[2]))
     || -[NSData isEqual:](request, "isEqual:")))
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](playerPath, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_request hash];
  return (unint64_t)[(NSData *)self->_playerPath hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[_NMRPlaybackQueueRequestProtobuf setRequest:](self, "setRequest:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[_NMRPlaybackQueueRequestProtobuf setPlayerPath:](self, "setPlayerPath:");
    id v4 = v5;
  }
}

- (NSData)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSData)playerPath
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