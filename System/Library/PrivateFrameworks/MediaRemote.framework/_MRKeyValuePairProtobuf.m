@interface _MRKeyValuePairProtobuf
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (_MRValueProtobuf)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRKeyValuePairProtobuf

- (void)setValue:(id)a3
{
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[_MRKeyValuePairProtobuf writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_value) {
    -[_MRKeyValuePairProtobuf writeTo:]();
  }
  PBDataWriterWriteSubmessage();
}

- (_MRValueProtobuf)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRKeyValuePairProtobuf;
  id v4 = [(_MRKeyValuePairProtobuf *)&v8 description];
  id v5 = [(_MRKeyValuePairProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value)
  {
    v7 = [(_MRValueProtobuf *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRKeyValuePairProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 setKey:key];
  [v5 setValue:self->_value];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_MRValueProtobuf *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[_MRValueProtobuf isEqual:](value, "isEqual:");
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
  return [(_MRValueProtobuf *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[_MRKeyValuePairProtobuf setKey:](self, "setKey:");
    id v4 = v7;
  }
  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6) {
      -[_MRValueProtobuf mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRKeyValuePairProtobuf setValue:](self, "setValue:");
  }

  MEMORY[0x1F41817F8]();
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRKeyValuePairProtobuf writeTo:]", "_MRKeyValuePairProtobuf.m", 97, "nil != self->_key");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_MRKeyValuePairProtobuf writeTo:]", "_MRKeyValuePairProtobuf.m", 102, "self->_value != nil");
}

@end