@interface _MRSystemPlaybackCustomDataQueueProtobuf
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSystemPlaybackCustomDataQueueProtobuf

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSystemPlaybackCustomDataQueueProtobuf;
  v4 = [(_MRSystemPlaybackCustomDataQueueProtobuf *)&v8 description];
  v5 = [(_MRSystemPlaybackCustomDataQueueProtobuf *)self dictionaryRepresentation];
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
  data = self->_data;
  if (data) {
    [v4 setObject:data forKey:@"data"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSystemPlaybackCustomDataQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    -[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_data) {
    -[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 setIdentifier:identifier];
  [v5 setData:self->_data];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_data copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    data = self->_data;
    if ((unint64_t)data | v4[1]) {
      char v7 = -[NSData isEqual:](data, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSData *)self->_data hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[_MRSystemPlaybackCustomDataQueueProtobuf setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[_MRSystemPlaybackCustomDataQueueProtobuf setData:](self, "setData:");
    id v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:]", "_MRSystemPlaybackCustomDataQueueProtobuf.m", 83, "nil != self->_identifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:]", "_MRSystemPlaybackCustomDataQueueProtobuf.m", 88, "nil != self->_data");
}

@end