@interface _MRSendPackedVirtualTouchEventMessageProtobuf
- (BOOL)hasData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendPackedVirtualTouchEventMessageProtobuf

- (BOOL)hasData
{
  return self->_data != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendPackedVirtualTouchEventMessageProtobuf;
  v4 = [(_MRSendPackedVirtualTouchEventMessageProtobuf *)&v8 description];
  v5 = [(_MRSendPackedVirtualTouchEventMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  data = self->_data;
  if (data) {
    [v3 setObject:data forKey:@"data"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendPackedVirtualTouchEventMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_data) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  data = self->_data;
  if (data) {
    [a3 setData:data];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_data copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    data = self->_data;
    if ((unint64_t)data | v4[1]) {
      char v6 = -[NSData isEqual:](data, "isEqual:");
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
  return [(NSData *)self->_data hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRSendPackedVirtualTouchEventMessageProtobuf setData:](self, "setData:");
  }
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
}

@end