@interface _MRMusicHandoffSessionProtobuf
- (BOOL)hasDestinationPlayerPath;
- (BOOL)hasIdentifier;
- (BOOL)hasSourcePlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_MRNowPlayingPlayerPathProtobuf)destinationPlayerPath;
- (_MRNowPlayingPlayerPathProtobuf)sourcePlayerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinationPlayerPath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSourcePlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRMusicHandoffSessionProtobuf

- (_MRNowPlayingPlayerPathProtobuf)destinationPlayerPath
{
  return self->_destinationPlayerPath;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasSourcePlayerPath
{
  return self->_sourcePlayerPath != 0;
}

- (BOOL)hasDestinationPlayerPath
{
  return self->_destinationPlayerPath != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRMusicHandoffSessionProtobuf;
  v4 = [(_MRMusicHandoffSessionProtobuf *)&v8 description];
  v5 = [(_MRMusicHandoffSessionProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  sourcePlayerPath = self->_sourcePlayerPath;
  if (sourcePlayerPath)
  {
    v7 = [(_MRNowPlayingPlayerPathProtobuf *)sourcePlayerPath dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"sourcePlayerPath"];
  }
  destinationPlayerPath = self->_destinationPlayerPath;
  if (destinationPlayerPath)
  {
    v9 = [(_MRNowPlayingPlayerPathProtobuf *)destinationPlayerPath dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"destinationPlayerPath"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRMusicHandoffSessionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourcePlayerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_destinationPlayerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_sourcePlayerPath)
  {
    objc_msgSend(v5, "setSourcePlayerPath:");
    id v4 = v5;
  }
  if (self->_destinationPlayerPath)
  {
    objc_msgSend(v5, "setDestinationPlayerPath:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(_MRNowPlayingPlayerPathProtobuf *)self->_sourcePlayerPath copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(_MRNowPlayingPlayerPathProtobuf *)self->_destinationPlayerPath copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((sourcePlayerPath = self->_sourcePlayerPath, !((unint64_t)sourcePlayerPath | v4[3]))
     || -[_MRNowPlayingPlayerPathProtobuf isEqual:](sourcePlayerPath, "isEqual:")))
  {
    destinationPlayerPath = self->_destinationPlayerPath;
    if ((unint64_t)destinationPlayerPath | v4[1]) {
      char v8 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](destinationPlayerPath, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(_MRNowPlayingPlayerPathProtobuf *)self->_sourcePlayerPath hash] ^ v3;
  return v4 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_destinationPlayerPath hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[_MRMusicHandoffSessionProtobuf setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v9;
  }
  sourcePlayerPath = self->_sourcePlayerPath;
  uint64_t v6 = v4[3];
  if (sourcePlayerPath)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](sourcePlayerPath, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[_MRMusicHandoffSessionProtobuf setSourcePlayerPath:](self, "setSourcePlayerPath:");
  }
  unint64_t v4 = v9;
LABEL_9:
  destinationPlayerPath = self->_destinationPlayerPath;
  uint64_t v8 = v4[1];
  if (destinationPlayerPath)
  {
    if (v8) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](destinationPlayerPath, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRMusicHandoffSessionProtobuf setDestinationPlayerPath:](self, "setDestinationPlayerPath:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)sourcePlayerPath
{
  return self->_sourcePlayerPath;
}

- (void)setSourcePlayerPath:(id)a3
{
}

- (void)setDestinationPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePlayerPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_destinationPlayerPath, 0);
}

@end