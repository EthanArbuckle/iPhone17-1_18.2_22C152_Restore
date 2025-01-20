@interface _MRPlaybackSessionProtobuf
- (BOOL)hasIdentifier;
- (BOOL)hasMetadata;
- (BOOL)hasPlaybackSessionData;
- (BOOL)hasRevision;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)metadata;
- (NSData)playbackSessionData;
- (NSString)identifier;
- (NSString)revision;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPlaybackSessionData:(id)a3;
- (void)setRevision:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionProtobuf

- (BOOL)hasPlaybackSessionData
{
  return self->_playbackSessionData != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasRevision
{
  return self->_revision != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionProtobuf;
  v4 = [(_MRPlaybackSessionProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  playbackSessionData = self->_playbackSessionData;
  if (playbackSessionData) {
    [v3 setObject:playbackSessionData forKey:@"playbackSessionData"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  revision = self->_revision;
  if (revision) {
    [v4 setObject:revision forKey:@"revision"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSessionData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_revision)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSessionData)
  {
    objc_msgSend(v4, "setPlaybackSessionData:");
    id v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    id v4 = v5;
  }
  if (self->_revision)
  {
    objc_msgSend(v5, "setRevision:");
    id v4 = v5;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_playbackSessionData copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_type copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_revision copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSData *)self->_metadata copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((playbackSessionData = self->_playbackSessionData, !((unint64_t)playbackSessionData | v4[3]))
     || -[NSData isEqual:](playbackSessionData, "isEqual:"))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[5])) || -[NSString isEqual:](type, "isEqual:"))
    && ((revision = self->_revision, !((unint64_t)revision | v4[4]))
     || -[NSString isEqual:](revision, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[2]) {
      char v10 = -[NSData isEqual:](metadata, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_playbackSessionData hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_type hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_revision hash];
  return v6 ^ [(NSData *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[_MRPlaybackSessionProtobuf setPlaybackSessionData:](self, "setPlaybackSessionData:");
  }
  if (v4[1]) {
    -[_MRPlaybackSessionProtobuf setIdentifier:](self, "setIdentifier:");
  }
  if (v4[5]) {
    -[_MRPlaybackSessionProtobuf setType:](self, "setType:");
  }
  if (v4[4]) {
    -[_MRPlaybackSessionProtobuf setRevision:](self, "setRevision:");
  }
  if (v4[2]) {
    -[_MRPlaybackSessionProtobuf setMetadata:](self, "setMetadata:");
  }
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (void)setPlaybackSessionData:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)revision
{
  return self->_revision;
}

- (void)setRevision:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end