@interface _NMRPlaybackQueueResponseProtobuf
- (BOOL)hasError;
- (BOOL)hasPlaybackQueue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)error;
- (NSData)playbackQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRPlaybackQueueResponseProtobuf

- (BOOL)hasPlaybackQueue
{
  return self->_playbackQueue != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRPlaybackQueueResponseProtobuf;
  v3 = [(_NMRPlaybackQueueResponseProtobuf *)&v7 description];
  v4 = [(_NMRPlaybackQueueResponseProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  playbackQueue = self->_playbackQueue;
  if (playbackQueue) {
    [v3 setObject:playbackQueue forKey:@"playbackQueue"];
  }
  error = self->_error;
  if (error) {
    [v4 setObject:error forKey:@"error"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100019F68((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackQueue)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackQueue)
  {
    [v4 setPlaybackQueue:];
    id v4 = v5;
  }
  if (self->_error)
  {
    [v5 setError:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSData *)self->_playbackQueue copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_error copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((playbackQueue = self->_playbackQueue, !((unint64_t)playbackQueue | v4[2]))
     || -[NSData isEqual:](playbackQueue, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](error, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_playbackQueue hash];
  return (unint64_t)[(NSData *)self->_error hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[_NMRPlaybackQueueResponseProtobuf setPlaybackQueue:](self, "setPlaybackQueue:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[_NMRPlaybackQueueResponseProtobuf setError:](self, "setError:");
    id v4 = v5;
  }
}

- (NSData)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
}

- (NSData)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueue, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end