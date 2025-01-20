@interface _MRApplicationConnectionContextProtobuf
- (BOOL)hasDestinationPlayerPath;
- (BOOL)hasIdentifier;
- (BOOL)hasServiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)serviceName;
- (_MRNowPlayingPlayerPathProtobuf)destinationPlayerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinationPlayerPath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setServiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRApplicationConnectionContextProtobuf

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v4 setObject:serviceName forKey:@"serviceName"];
  }
  destinationPlayerPath = self->_destinationPlayerPath;
  if (destinationPlayerPath)
  {
    v8 = [(_MRNowPlayingPlayerPathProtobuf *)destinationPlayerPath dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"destinationPlayerPath"];
  }

  return v4;
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
  if (self->_serviceName)
  {
    objc_msgSend(v5, "setServiceName:");
    id v4 = v5;
  }
  if (self->_destinationPlayerPath)
  {
    objc_msgSend(v5, "setDestinationPlayerPath:");
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_destinationPlayerPath, 0);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasDestinationPlayerPath
{
  return self->_destinationPlayerPath != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRApplicationConnectionContextProtobuf;
  id v4 = [(_MRApplicationConnectionContextProtobuf *)&v8 description];
  id v5 = [(_MRApplicationConnectionContextProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return _MRApplicationConnectionContextProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_serviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_destinationPlayerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_serviceName copyWithZone:a3];
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
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[3]))
     || -[NSString isEqual:](serviceName, "isEqual:")))
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
  NSUInteger v4 = [(NSString *)self->_serviceName hash] ^ v3;
  return v4 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_destinationPlayerPath hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[_MRApplicationConnectionContextProtobuf setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v7;
  }
  if (v4[3])
  {
    -[_MRApplicationConnectionContextProtobuf setServiceName:](self, "setServiceName:");
    NSUInteger v4 = v7;
  }
  destinationPlayerPath = self->_destinationPlayerPath;
  uint64_t v6 = v4[1];
  if (destinationPlayerPath)
  {
    if (v6) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](destinationPlayerPath, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRApplicationConnectionContextProtobuf setDestinationPlayerPath:](self, "setDestinationPlayerPath:");
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

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)destinationPlayerPath
{
  return self->_destinationPlayerPath;
}

- (void)setDestinationPlayerPath:(id)a3
{
}

@end