@interface _MRGenericMessageProtobuf
- (BOOL)hasData;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGenericMessageProtobuf

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGenericMessageProtobuf;
  v4 = [(_MRGenericMessageProtobuf *)&v8 description];
  v5 = [(_MRGenericMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  data = self->_data;
  if (data) {
    [v4 setObject:data forKey:@"data"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGenericMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_data)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_data)
  {
    objc_msgSend(v5, "setData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
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
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:")))
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
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(NSData *)self->_data hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[_MRGenericMessageProtobuf setKey:](self, "setKey:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[_MRGenericMessageProtobuf setData:](self, "setData:");
    id v4 = v5;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
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
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end